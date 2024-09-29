-- (1) 마당서점 도서의 총 개수
select count(bookid) from Book;

-- (2) 마당서점에 도서를 출고하는 출판사의 총 개수
select count(distinct publisher) as num_publisher from Book;

-- (3) 모든 고객의 이름, 주소
select name, address from Customer;	

-- (4) 2014년 7월 4일~7월 7일 사이에 주문받은 도서의 주문번호
select orderid from Orders where orderdate BETWEEN '2014-07-04' AND '2014-07-07'; -- 20140704라는 형태도 가능하다.
	
-- (5) 2014년 7월 4일~7월 7일 사이에 주문받은 도서를 제외한 도서의 주문번호
select orderid from Orders where orderdate NOT BETWEEN '2014-07-04' AND '2014-07-07';

-- (6) 성이 ‘김’ 씨인 고객의 이름과 주소
select name, address from Customer where name LIKE '김%';
    
-- (7) 성이 ‘김’ 씨이고 이름이 ‘아’로 끝나는 고객의 이름과 주소
select name, address from Customer where name LIKE '김%아';
    
-- (8) 주문하지 않은 고객의 이름(조인 사용)
select name from Customer where name not in (select name from Orders, Customer where Orders.custid=Customer.custid);
	
-- (9) 주문 금액의 총액과 주문의 평균 금액
select SUM(saleprice), AVG(saleprice) from Orders;
	
-- (10) 고객의 이름과 고객별 구매액
select name, SUM(saleprice) from Orders, Customer where Orders.custid=Customer.custid GROUP BY name;
	
-- (11) 고객의 이름과 고객이 구매한 도서 목록 (주문하지 않은 고객 포함)
select name, bookid from Customer left outer join Orders on Orders.custid=Customer.custid;

-- (12) 도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문
select * from Book, Orders where Book.bookid=Orders.bookid AND price-saleprice=(select MAX(price-saleprice) from Book, Orders where Book.bookid=Orders.bookid);
	
-- (13) 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름

-- (14) 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
	
-- (15) 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
	
-- (16) 전체 고객의 30% 이상이 구매한 도서
	
-- (17) 새로운 도서 (‘스포츠 세계’, ‘대한미디어’, 10000원)이 마당서점에 입고되었다. 삽입이 안 될 경우 필요한 데이터가 더 있는지 찾아보자.
	
-- (18) ‘삼성당’에서 출판한 도서를 삭제해야 한다.
	
-- (19) ‘이상미디어’에서 출판한 도서를 삭제해야 한다. 삭제가 안 될 경우 원인을 생각해보자.
	
-- (20) 출판사 ‘대한미디어’가 ‘대한출판사’로 이름을 바꾸었다.
	
	