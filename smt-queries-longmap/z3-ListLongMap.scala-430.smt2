; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8050 () Bool)

(assert start!8050)

(declare-fun b!50589 () Bool)

(declare-fun b_free!1553 () Bool)

(declare-fun b_next!1553 () Bool)

(assert (=> b!50589 (= b_free!1553 (not b_next!1553))))

(declare-fun tp!6724 () Bool)

(declare-fun b_and!2763 () Bool)

(assert (=> b!50589 (= tp!6724 b_and!2763)))

(declare-fun b!50586 () Bool)

(declare-fun b_free!1555 () Bool)

(declare-fun b_next!1555 () Bool)

(assert (=> b!50586 (= b_free!1555 (not b_next!1555))))

(declare-fun tp!6726 () Bool)

(declare-fun b_and!2765 () Bool)

(assert (=> b!50586 (= tp!6726 b_and!2765)))

(declare-fun b!50577 () Bool)

(declare-fun e!32700 () Bool)

(declare-fun tp_is_empty!2193 () Bool)

(assert (=> b!50577 (= e!32700 tp_is_empty!2193)))

(declare-fun mapNonEmpty!2213 () Bool)

(declare-fun mapRes!2214 () Bool)

(declare-fun tp!6723 () Bool)

(declare-fun e!32706 () Bool)

(assert (=> mapNonEmpty!2213 (= mapRes!2214 (and tp!6723 e!32706))))

(declare-fun mapKey!2213 () (_ BitVec 32))

(declare-datatypes ((V!2571 0))(
  ( (V!2572 (val!1141 Int)) )
))
(declare-datatypes ((ValueCell!753 0))(
  ( (ValueCellFull!753 (v!2169 V!2571)) (EmptyCell!753) )
))
(declare-fun mapRest!2214 () (Array (_ BitVec 32) ValueCell!753))

(declare-datatypes ((array!3299 0))(
  ( (array!3300 (arr!1577 (Array (_ BitVec 32) (_ BitVec 64))) (size!1801 (_ BitVec 32))) )
))
(declare-datatypes ((array!3301 0))(
  ( (array!3302 (arr!1578 (Array (_ BitVec 32) ValueCell!753)) (size!1802 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!414 0))(
  ( (LongMapFixedSize!415 (defaultEntry!1921 Int) (mask!5713 (_ BitVec 32)) (extraKeys!1812 (_ BitVec 32)) (zeroValue!1839 V!2571) (minValue!1839 V!2571) (_size!256 (_ BitVec 32)) (_keys!3531 array!3299) (_values!1904 array!3301) (_vacant!256 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!414)

(declare-fun mapValue!2213 () ValueCell!753)

(assert (=> mapNonEmpty!2213 (= (arr!1578 (_values!1904 newMap!16)) (store mapRest!2214 mapKey!2213 mapValue!2213))))

(declare-fun b!50578 () Bool)

(declare-fun e!32695 () Bool)

(assert (=> b!50578 (= e!32695 tp_is_empty!2193)))

(declare-fun mapIsEmpty!2213 () Bool)

(assert (=> mapIsEmpty!2213 mapRes!2214))

(declare-fun b!50579 () Bool)

(declare-fun e!32704 () Bool)

(declare-datatypes ((Cell!240 0))(
  ( (Cell!241 (v!2170 LongMapFixedSize!414)) )
))
(declare-datatypes ((LongMap!240 0))(
  ( (LongMap!241 (underlying!131 Cell!240)) )
))
(declare-fun thiss!992 () LongMap!240)

(assert (=> b!50579 (= e!32704 (and (= (size!1802 (_values!1904 (v!2170 (underlying!131 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5713 (v!2170 (underlying!131 thiss!992))))) (not (= (size!1801 (_keys!3531 (v!2170 (underlying!131 thiss!992)))) (size!1802 (_values!1904 (v!2170 (underlying!131 thiss!992))))))))))

(declare-fun b!50580 () Bool)

(declare-fun e!32703 () Bool)

(assert (=> b!50580 (= e!32703 tp_is_empty!2193)))

(declare-fun b!50581 () Bool)

(assert (=> b!50581 (= e!32706 tp_is_empty!2193)))

(declare-fun b!50582 () Bool)

(declare-fun res!29090 () Bool)

(assert (=> b!50582 (=> (not res!29090) (not e!32704))))

(declare-fun valid!137 (LongMapFixedSize!414) Bool)

(assert (=> b!50582 (= res!29090 (valid!137 newMap!16))))

(declare-fun b!50583 () Bool)

(declare-fun res!29093 () Bool)

(assert (=> b!50583 (=> (not res!29093) (not e!32704))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!50583 (= res!29093 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1801 (_keys!3531 (v!2170 (underlying!131 thiss!992)))))))))

(declare-fun mapNonEmpty!2214 () Bool)

(declare-fun mapRes!2213 () Bool)

(declare-fun tp!6725 () Bool)

(assert (=> mapNonEmpty!2214 (= mapRes!2213 (and tp!6725 e!32703))))

(declare-fun mapValue!2214 () ValueCell!753)

(declare-fun mapRest!2213 () (Array (_ BitVec 32) ValueCell!753))

(declare-fun mapKey!2214 () (_ BitVec 32))

(assert (=> mapNonEmpty!2214 (= (arr!1578 (_values!1904 (v!2170 (underlying!131 thiss!992)))) (store mapRest!2213 mapKey!2214 mapValue!2214))))

(declare-fun b!50584 () Bool)

(declare-fun e!32702 () Bool)

(declare-fun e!32696 () Bool)

(assert (=> b!50584 (= e!32702 e!32696)))

(declare-fun b!50585 () Bool)

(declare-fun res!29092 () Bool)

(assert (=> b!50585 (=> (not res!29092) (not e!32704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!50585 (= res!29092 (validMask!0 (mask!5713 (v!2170 (underlying!131 thiss!992)))))))

(declare-fun e!32707 () Bool)

(declare-fun e!32705 () Bool)

(declare-fun array_inv!967 (array!3299) Bool)

(declare-fun array_inv!968 (array!3301) Bool)

(assert (=> b!50586 (= e!32707 (and tp!6726 tp_is_empty!2193 (array_inv!967 (_keys!3531 newMap!16)) (array_inv!968 (_values!1904 newMap!16)) e!32705))))

(declare-fun mapIsEmpty!2214 () Bool)

(assert (=> mapIsEmpty!2214 mapRes!2213))

(declare-fun b!50587 () Bool)

(assert (=> b!50587 (= e!32705 (and e!32695 mapRes!2214))))

(declare-fun condMapEmpty!2213 () Bool)

(declare-fun mapDefault!2214 () ValueCell!753)

(assert (=> b!50587 (= condMapEmpty!2213 (= (arr!1578 (_values!1904 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!753)) mapDefault!2214)))))

(declare-fun b!50588 () Bool)

(declare-fun res!29094 () Bool)

(assert (=> b!50588 (=> (not res!29094) (not e!32704))))

(assert (=> b!50588 (= res!29094 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5713 newMap!16)) (_size!256 (v!2170 (underlying!131 thiss!992)))))))

(declare-fun e!32698 () Bool)

(assert (=> b!50589 (= e!32696 (and tp!6724 tp_is_empty!2193 (array_inv!967 (_keys!3531 (v!2170 (underlying!131 thiss!992)))) (array_inv!968 (_values!1904 (v!2170 (underlying!131 thiss!992)))) e!32698))))

(declare-fun res!29091 () Bool)

(assert (=> start!8050 (=> (not res!29091) (not e!32704))))

(declare-fun valid!138 (LongMap!240) Bool)

(assert (=> start!8050 (= res!29091 (valid!138 thiss!992))))

(assert (=> start!8050 e!32704))

(declare-fun e!32697 () Bool)

(assert (=> start!8050 e!32697))

(assert (=> start!8050 true))

(assert (=> start!8050 e!32707))

(declare-fun b!50590 () Bool)

(assert (=> b!50590 (= e!32697 e!32702)))

(declare-fun b!50591 () Bool)

(assert (=> b!50591 (= e!32698 (and e!32700 mapRes!2213))))

(declare-fun condMapEmpty!2214 () Bool)

(declare-fun mapDefault!2213 () ValueCell!753)

(assert (=> b!50591 (= condMapEmpty!2214 (= (arr!1578 (_values!1904 (v!2170 (underlying!131 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!753)) mapDefault!2213)))))

(assert (= (and start!8050 res!29091) b!50583))

(assert (= (and b!50583 res!29093) b!50582))

(assert (= (and b!50582 res!29090) b!50588))

(assert (= (and b!50588 res!29094) b!50585))

(assert (= (and b!50585 res!29092) b!50579))

(assert (= (and b!50591 condMapEmpty!2214) mapIsEmpty!2214))

(assert (= (and b!50591 (not condMapEmpty!2214)) mapNonEmpty!2214))

(get-info :version)

(assert (= (and mapNonEmpty!2214 ((_ is ValueCellFull!753) mapValue!2214)) b!50580))

(assert (= (and b!50591 ((_ is ValueCellFull!753) mapDefault!2213)) b!50577))

(assert (= b!50589 b!50591))

(assert (= b!50584 b!50589))

(assert (= b!50590 b!50584))

(assert (= start!8050 b!50590))

(assert (= (and b!50587 condMapEmpty!2213) mapIsEmpty!2213))

(assert (= (and b!50587 (not condMapEmpty!2213)) mapNonEmpty!2213))

(assert (= (and mapNonEmpty!2213 ((_ is ValueCellFull!753) mapValue!2213)) b!50581))

(assert (= (and b!50587 ((_ is ValueCellFull!753) mapDefault!2214)) b!50578))

(assert (= b!50586 b!50587))

(assert (= start!8050 b!50586))

(declare-fun m!43797 () Bool)

(assert (=> b!50589 m!43797))

(declare-fun m!43799 () Bool)

(assert (=> b!50589 m!43799))

(declare-fun m!43801 () Bool)

(assert (=> b!50582 m!43801))

(declare-fun m!43803 () Bool)

(assert (=> b!50586 m!43803))

(declare-fun m!43805 () Bool)

(assert (=> b!50586 m!43805))

(declare-fun m!43807 () Bool)

(assert (=> mapNonEmpty!2214 m!43807))

(declare-fun m!43809 () Bool)

(assert (=> b!50585 m!43809))

(declare-fun m!43811 () Bool)

(assert (=> mapNonEmpty!2213 m!43811))

(declare-fun m!43813 () Bool)

(assert (=> start!8050 m!43813))

(check-sat (not b!50589) (not mapNonEmpty!2214) b_and!2765 tp_is_empty!2193 (not b_next!1555) (not b!50582) b_and!2763 (not b_next!1553) (not b!50585) (not b!50586) (not mapNonEmpty!2213) (not start!8050))
(check-sat b_and!2763 b_and!2765 (not b_next!1553) (not b_next!1555))
(get-model)

(declare-fun d!10195 () Bool)

(declare-fun res!29116 () Bool)

(declare-fun e!32749 () Bool)

(assert (=> d!10195 (=> (not res!29116) (not e!32749))))

(declare-fun simpleValid!35 (LongMapFixedSize!414) Bool)

(assert (=> d!10195 (= res!29116 (simpleValid!35 newMap!16))))

(assert (=> d!10195 (= (valid!137 newMap!16) e!32749)))

(declare-fun b!50643 () Bool)

(declare-fun res!29117 () Bool)

(assert (=> b!50643 (=> (not res!29117) (not e!32749))))

(declare-fun arrayCountValidKeys!0 (array!3299 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!50643 (= res!29117 (= (arrayCountValidKeys!0 (_keys!3531 newMap!16) #b00000000000000000000000000000000 (size!1801 (_keys!3531 newMap!16))) (_size!256 newMap!16)))))

(declare-fun b!50644 () Bool)

(declare-fun res!29118 () Bool)

(assert (=> b!50644 (=> (not res!29118) (not e!32749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3299 (_ BitVec 32)) Bool)

(assert (=> b!50644 (= res!29118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3531 newMap!16) (mask!5713 newMap!16)))))

(declare-fun b!50645 () Bool)

(declare-datatypes ((List!1330 0))(
  ( (Nil!1327) (Cons!1326 (h!1906 (_ BitVec 64)) (t!4364 List!1330)) )
))
(declare-fun arrayNoDuplicates!0 (array!3299 (_ BitVec 32) List!1330) Bool)

(assert (=> b!50645 (= e!32749 (arrayNoDuplicates!0 (_keys!3531 newMap!16) #b00000000000000000000000000000000 Nil!1327))))

(assert (= (and d!10195 res!29116) b!50643))

(assert (= (and b!50643 res!29117) b!50644))

(assert (= (and b!50644 res!29118) b!50645))

(declare-fun m!43833 () Bool)

(assert (=> d!10195 m!43833))

(declare-fun m!43835 () Bool)

(assert (=> b!50643 m!43835))

(declare-fun m!43837 () Bool)

(assert (=> b!50644 m!43837))

(declare-fun m!43839 () Bool)

(assert (=> b!50645 m!43839))

(assert (=> b!50582 d!10195))

(declare-fun d!10197 () Bool)

(assert (=> d!10197 (= (array_inv!967 (_keys!3531 (v!2170 (underlying!131 thiss!992)))) (bvsge (size!1801 (_keys!3531 (v!2170 (underlying!131 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!50589 d!10197))

(declare-fun d!10199 () Bool)

(assert (=> d!10199 (= (array_inv!968 (_values!1904 (v!2170 (underlying!131 thiss!992)))) (bvsge (size!1802 (_values!1904 (v!2170 (underlying!131 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!50589 d!10199))

(declare-fun d!10201 () Bool)

(assert (=> d!10201 (= (validMask!0 (mask!5713 (v!2170 (underlying!131 thiss!992)))) (and (or (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000000000000000000000000000111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000000000000000000000000001111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000000000000000000000000011111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000000000000000000000000111111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000000000000000000000001111111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000000000000000000000011111111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000000000000000000000111111111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000000000000000000001111111111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000000000000000000011111111111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000000000000000000111111111111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000000000000000001111111111111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000000000000000011111111111111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000000000000000111111111111111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000000000000001111111111111111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000000000000011111111111111111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000000000000111111111111111111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000000000001111111111111111111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000000000011111111111111111111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000000000111111111111111111111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000000001111111111111111111111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000000011111111111111111111111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000000111111111111111111111111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000001111111111111111111111111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000011111111111111111111111111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000111111111111111111111111111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00001111111111111111111111111111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00011111111111111111111111111111) (= (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!50585 d!10201))

(declare-fun d!10203 () Bool)

(assert (=> d!10203 (= (valid!138 thiss!992) (valid!137 (v!2170 (underlying!131 thiss!992))))))

(declare-fun bs!2363 () Bool)

(assert (= bs!2363 d!10203))

(declare-fun m!43841 () Bool)

(assert (=> bs!2363 m!43841))

(assert (=> start!8050 d!10203))

(declare-fun d!10205 () Bool)

(assert (=> d!10205 (= (array_inv!967 (_keys!3531 newMap!16)) (bvsge (size!1801 (_keys!3531 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!50586 d!10205))

(declare-fun d!10207 () Bool)

(assert (=> d!10207 (= (array_inv!968 (_values!1904 newMap!16)) (bvsge (size!1802 (_values!1904 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!50586 d!10207))

(declare-fun condMapEmpty!2223 () Bool)

(declare-fun mapDefault!2223 () ValueCell!753)

(assert (=> mapNonEmpty!2214 (= condMapEmpty!2223 (= mapRest!2213 ((as const (Array (_ BitVec 32) ValueCell!753)) mapDefault!2223)))))

(declare-fun e!32755 () Bool)

(declare-fun mapRes!2223 () Bool)

(assert (=> mapNonEmpty!2214 (= tp!6725 (and e!32755 mapRes!2223))))

(declare-fun mapIsEmpty!2223 () Bool)

(assert (=> mapIsEmpty!2223 mapRes!2223))

(declare-fun b!50653 () Bool)

(assert (=> b!50653 (= e!32755 tp_is_empty!2193)))

(declare-fun b!50652 () Bool)

(declare-fun e!32754 () Bool)

(assert (=> b!50652 (= e!32754 tp_is_empty!2193)))

(declare-fun mapNonEmpty!2223 () Bool)

(declare-fun tp!6741 () Bool)

(assert (=> mapNonEmpty!2223 (= mapRes!2223 (and tp!6741 e!32754))))

(declare-fun mapKey!2223 () (_ BitVec 32))

(declare-fun mapValue!2223 () ValueCell!753)

(declare-fun mapRest!2223 () (Array (_ BitVec 32) ValueCell!753))

(assert (=> mapNonEmpty!2223 (= mapRest!2213 (store mapRest!2223 mapKey!2223 mapValue!2223))))

(assert (= (and mapNonEmpty!2214 condMapEmpty!2223) mapIsEmpty!2223))

(assert (= (and mapNonEmpty!2214 (not condMapEmpty!2223)) mapNonEmpty!2223))

(assert (= (and mapNonEmpty!2223 ((_ is ValueCellFull!753) mapValue!2223)) b!50652))

(assert (= (and mapNonEmpty!2214 ((_ is ValueCellFull!753) mapDefault!2223)) b!50653))

(declare-fun m!43843 () Bool)

(assert (=> mapNonEmpty!2223 m!43843))

(declare-fun condMapEmpty!2224 () Bool)

(declare-fun mapDefault!2224 () ValueCell!753)

(assert (=> mapNonEmpty!2213 (= condMapEmpty!2224 (= mapRest!2214 ((as const (Array (_ BitVec 32) ValueCell!753)) mapDefault!2224)))))

(declare-fun e!32757 () Bool)

(declare-fun mapRes!2224 () Bool)

(assert (=> mapNonEmpty!2213 (= tp!6723 (and e!32757 mapRes!2224))))

(declare-fun mapIsEmpty!2224 () Bool)

(assert (=> mapIsEmpty!2224 mapRes!2224))

(declare-fun b!50655 () Bool)

(assert (=> b!50655 (= e!32757 tp_is_empty!2193)))

(declare-fun b!50654 () Bool)

(declare-fun e!32756 () Bool)

(assert (=> b!50654 (= e!32756 tp_is_empty!2193)))

(declare-fun mapNonEmpty!2224 () Bool)

(declare-fun tp!6742 () Bool)

(assert (=> mapNonEmpty!2224 (= mapRes!2224 (and tp!6742 e!32756))))

(declare-fun mapKey!2224 () (_ BitVec 32))

(declare-fun mapValue!2224 () ValueCell!753)

(declare-fun mapRest!2224 () (Array (_ BitVec 32) ValueCell!753))

(assert (=> mapNonEmpty!2224 (= mapRest!2214 (store mapRest!2224 mapKey!2224 mapValue!2224))))

(assert (= (and mapNonEmpty!2213 condMapEmpty!2224) mapIsEmpty!2224))

(assert (= (and mapNonEmpty!2213 (not condMapEmpty!2224)) mapNonEmpty!2224))

(assert (= (and mapNonEmpty!2224 ((_ is ValueCellFull!753) mapValue!2224)) b!50654))

(assert (= (and mapNonEmpty!2213 ((_ is ValueCellFull!753) mapDefault!2224)) b!50655))

(declare-fun m!43845 () Bool)

(assert (=> mapNonEmpty!2224 m!43845))

(check-sat (not b!50645) tp_is_empty!2193 (not b_next!1555) (not mapNonEmpty!2223) (not d!10203) b_and!2763 (not b!50644) (not b_next!1553) (not b!50643) b_and!2765 (not mapNonEmpty!2224) (not d!10195))
(check-sat b_and!2763 b_and!2765 (not b_next!1553) (not b_next!1555))
(get-model)

(declare-fun b!50666 () Bool)

(declare-fun res!29129 () Bool)

(declare-fun e!32760 () Bool)

(assert (=> b!50666 (=> (not res!29129) (not e!32760))))

(declare-fun size!1805 (LongMapFixedSize!414) (_ BitVec 32))

(assert (=> b!50666 (= res!29129 (= (size!1805 newMap!16) (bvadd (_size!256 newMap!16) (bvsdiv (bvadd (extraKeys!1812 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!10209 () Bool)

(declare-fun res!29128 () Bool)

(assert (=> d!10209 (=> (not res!29128) (not e!32760))))

(assert (=> d!10209 (= res!29128 (validMask!0 (mask!5713 newMap!16)))))

(assert (=> d!10209 (= (simpleValid!35 newMap!16) e!32760)))

(declare-fun b!50664 () Bool)

(declare-fun res!29130 () Bool)

(assert (=> b!50664 (=> (not res!29130) (not e!32760))))

(assert (=> b!50664 (= res!29130 (and (= (size!1802 (_values!1904 newMap!16)) (bvadd (mask!5713 newMap!16) #b00000000000000000000000000000001)) (= (size!1801 (_keys!3531 newMap!16)) (size!1802 (_values!1904 newMap!16))) (bvsge (_size!256 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!256 newMap!16) (bvadd (mask!5713 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!50667 () Bool)

(assert (=> b!50667 (= e!32760 (and (bvsge (extraKeys!1812 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1812 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!256 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!50665 () Bool)

(declare-fun res!29127 () Bool)

(assert (=> b!50665 (=> (not res!29127) (not e!32760))))

(assert (=> b!50665 (= res!29127 (bvsge (size!1805 newMap!16) (_size!256 newMap!16)))))

(assert (= (and d!10209 res!29128) b!50664))

(assert (= (and b!50664 res!29130) b!50665))

(assert (= (and b!50665 res!29127) b!50666))

(assert (= (and b!50666 res!29129) b!50667))

(declare-fun m!43847 () Bool)

(assert (=> b!50666 m!43847))

(declare-fun m!43849 () Bool)

(assert (=> d!10209 m!43849))

(assert (=> b!50665 m!43847))

(assert (=> d!10195 d!10209))

(declare-fun b!50676 () Bool)

(declare-fun e!32766 () (_ BitVec 32))

(declare-fun call!3904 () (_ BitVec 32))

(assert (=> b!50676 (= e!32766 (bvadd #b00000000000000000000000000000001 call!3904))))

(declare-fun b!50677 () Bool)

(assert (=> b!50677 (= e!32766 call!3904)))

(declare-fun b!50678 () Bool)

(declare-fun e!32765 () (_ BitVec 32))

(assert (=> b!50678 (= e!32765 #b00000000000000000000000000000000)))

(declare-fun bm!3901 () Bool)

(assert (=> bm!3901 (= call!3904 (arrayCountValidKeys!0 (_keys!3531 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1801 (_keys!3531 newMap!16))))))

(declare-fun d!10211 () Bool)

(declare-fun lt!21084 () (_ BitVec 32))

(assert (=> d!10211 (and (bvsge lt!21084 #b00000000000000000000000000000000) (bvsle lt!21084 (bvsub (size!1801 (_keys!3531 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!10211 (= lt!21084 e!32765)))

(declare-fun c!6823 () Bool)

(assert (=> d!10211 (= c!6823 (bvsge #b00000000000000000000000000000000 (size!1801 (_keys!3531 newMap!16))))))

(assert (=> d!10211 (and (bvsle #b00000000000000000000000000000000 (size!1801 (_keys!3531 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1801 (_keys!3531 newMap!16)) (size!1801 (_keys!3531 newMap!16))))))

(assert (=> d!10211 (= (arrayCountValidKeys!0 (_keys!3531 newMap!16) #b00000000000000000000000000000000 (size!1801 (_keys!3531 newMap!16))) lt!21084)))

(declare-fun b!50679 () Bool)

(assert (=> b!50679 (= e!32765 e!32766)))

(declare-fun c!6822 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!50679 (= c!6822 (validKeyInArray!0 (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10211 c!6823) b!50678))

(assert (= (and d!10211 (not c!6823)) b!50679))

(assert (= (and b!50679 c!6822) b!50676))

(assert (= (and b!50679 (not c!6822)) b!50677))

(assert (= (or b!50676 b!50677) bm!3901))

(declare-fun m!43851 () Bool)

(assert (=> bm!3901 m!43851))

(declare-fun m!43853 () Bool)

(assert (=> b!50679 m!43853))

(assert (=> b!50679 m!43853))

(declare-fun m!43855 () Bool)

(assert (=> b!50679 m!43855))

(assert (=> b!50643 d!10211))

(declare-fun d!10213 () Bool)

(declare-fun res!29131 () Bool)

(declare-fun e!32767 () Bool)

(assert (=> d!10213 (=> (not res!29131) (not e!32767))))

(assert (=> d!10213 (= res!29131 (simpleValid!35 (v!2170 (underlying!131 thiss!992))))))

(assert (=> d!10213 (= (valid!137 (v!2170 (underlying!131 thiss!992))) e!32767)))

(declare-fun b!50680 () Bool)

(declare-fun res!29132 () Bool)

(assert (=> b!50680 (=> (not res!29132) (not e!32767))))

(assert (=> b!50680 (= res!29132 (= (arrayCountValidKeys!0 (_keys!3531 (v!2170 (underlying!131 thiss!992))) #b00000000000000000000000000000000 (size!1801 (_keys!3531 (v!2170 (underlying!131 thiss!992))))) (_size!256 (v!2170 (underlying!131 thiss!992)))))))

(declare-fun b!50681 () Bool)

(declare-fun res!29133 () Bool)

(assert (=> b!50681 (=> (not res!29133) (not e!32767))))

(assert (=> b!50681 (= res!29133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3531 (v!2170 (underlying!131 thiss!992))) (mask!5713 (v!2170 (underlying!131 thiss!992)))))))

(declare-fun b!50682 () Bool)

(assert (=> b!50682 (= e!32767 (arrayNoDuplicates!0 (_keys!3531 (v!2170 (underlying!131 thiss!992))) #b00000000000000000000000000000000 Nil!1327))))

(assert (= (and d!10213 res!29131) b!50680))

(assert (= (and b!50680 res!29132) b!50681))

(assert (= (and b!50681 res!29133) b!50682))

(declare-fun m!43857 () Bool)

(assert (=> d!10213 m!43857))

(declare-fun m!43859 () Bool)

(assert (=> b!50680 m!43859))

(declare-fun m!43861 () Bool)

(assert (=> b!50681 m!43861))

(declare-fun m!43863 () Bool)

(assert (=> b!50682 m!43863))

(assert (=> d!10203 d!10213))

(declare-fun d!10215 () Bool)

(declare-fun res!29138 () Bool)

(declare-fun e!32776 () Bool)

(assert (=> d!10215 (=> res!29138 e!32776)))

(assert (=> d!10215 (= res!29138 (bvsge #b00000000000000000000000000000000 (size!1801 (_keys!3531 newMap!16))))))

(assert (=> d!10215 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3531 newMap!16) (mask!5713 newMap!16)) e!32776)))

(declare-fun b!50691 () Bool)

(declare-fun e!32774 () Bool)

(declare-fun call!3907 () Bool)

(assert (=> b!50691 (= e!32774 call!3907)))

(declare-fun bm!3904 () Bool)

(assert (=> bm!3904 (= call!3907 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3531 newMap!16) (mask!5713 newMap!16)))))

(declare-fun b!50692 () Bool)

(declare-fun e!32775 () Bool)

(assert (=> b!50692 (= e!32774 e!32775)))

(declare-fun lt!21091 () (_ BitVec 64))

(assert (=> b!50692 (= lt!21091 (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1421 0))(
  ( (Unit!1422) )
))
(declare-fun lt!21093 () Unit!1421)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3299 (_ BitVec 64) (_ BitVec 32)) Unit!1421)

(assert (=> b!50692 (= lt!21093 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3531 newMap!16) lt!21091 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!50692 (arrayContainsKey!0 (_keys!3531 newMap!16) lt!21091 #b00000000000000000000000000000000)))

(declare-fun lt!21092 () Unit!1421)

(assert (=> b!50692 (= lt!21092 lt!21093)))

(declare-fun res!29139 () Bool)

(declare-datatypes ((SeekEntryResult!220 0))(
  ( (MissingZero!220 (index!3002 (_ BitVec 32))) (Found!220 (index!3003 (_ BitVec 32))) (Intermediate!220 (undefined!1032 Bool) (index!3004 (_ BitVec 32)) (x!9252 (_ BitVec 32))) (Undefined!220) (MissingVacant!220 (index!3005 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3299 (_ BitVec 32)) SeekEntryResult!220)

(assert (=> b!50692 (= res!29139 (= (seekEntryOrOpen!0 (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000) (_keys!3531 newMap!16) (mask!5713 newMap!16)) (Found!220 #b00000000000000000000000000000000)))))

(assert (=> b!50692 (=> (not res!29139) (not e!32775))))

(declare-fun b!50693 () Bool)

(assert (=> b!50693 (= e!32776 e!32774)))

(declare-fun c!6826 () Bool)

(assert (=> b!50693 (= c!6826 (validKeyInArray!0 (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50694 () Bool)

(assert (=> b!50694 (= e!32775 call!3907)))

(assert (= (and d!10215 (not res!29138)) b!50693))

(assert (= (and b!50693 c!6826) b!50692))

(assert (= (and b!50693 (not c!6826)) b!50691))

(assert (= (and b!50692 res!29139) b!50694))

(assert (= (or b!50694 b!50691) bm!3904))

(declare-fun m!43865 () Bool)

(assert (=> bm!3904 m!43865))

(assert (=> b!50692 m!43853))

(declare-fun m!43867 () Bool)

(assert (=> b!50692 m!43867))

(declare-fun m!43869 () Bool)

(assert (=> b!50692 m!43869))

(assert (=> b!50692 m!43853))

(declare-fun m!43871 () Bool)

(assert (=> b!50692 m!43871))

(assert (=> b!50693 m!43853))

(assert (=> b!50693 m!43853))

(assert (=> b!50693 m!43855))

(assert (=> b!50644 d!10215))

(declare-fun bm!3907 () Bool)

(declare-fun call!3910 () Bool)

(declare-fun c!6829 () Bool)

(assert (=> bm!3907 (= call!3910 (arrayNoDuplicates!0 (_keys!3531 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6829 (Cons!1326 (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000) Nil!1327) Nil!1327)))))

(declare-fun b!50705 () Bool)

(declare-fun e!32787 () Bool)

(declare-fun contains!620 (List!1330 (_ BitVec 64)) Bool)

(assert (=> b!50705 (= e!32787 (contains!620 Nil!1327 (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!10217 () Bool)

(declare-fun res!29148 () Bool)

(declare-fun e!32786 () Bool)

(assert (=> d!10217 (=> res!29148 e!32786)))

(assert (=> d!10217 (= res!29148 (bvsge #b00000000000000000000000000000000 (size!1801 (_keys!3531 newMap!16))))))

(assert (=> d!10217 (= (arrayNoDuplicates!0 (_keys!3531 newMap!16) #b00000000000000000000000000000000 Nil!1327) e!32786)))

(declare-fun b!50706 () Bool)

(declare-fun e!32788 () Bool)

(assert (=> b!50706 (= e!32788 call!3910)))

(declare-fun b!50707 () Bool)

(assert (=> b!50707 (= e!32788 call!3910)))

(declare-fun b!50708 () Bool)

(declare-fun e!32785 () Bool)

(assert (=> b!50708 (= e!32785 e!32788)))

(assert (=> b!50708 (= c!6829 (validKeyInArray!0 (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50709 () Bool)

(assert (=> b!50709 (= e!32786 e!32785)))

(declare-fun res!29146 () Bool)

(assert (=> b!50709 (=> (not res!29146) (not e!32785))))

(assert (=> b!50709 (= res!29146 (not e!32787))))

(declare-fun res!29147 () Bool)

(assert (=> b!50709 (=> (not res!29147) (not e!32787))))

(assert (=> b!50709 (= res!29147 (validKeyInArray!0 (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10217 (not res!29148)) b!50709))

(assert (= (and b!50709 res!29147) b!50705))

(assert (= (and b!50709 res!29146) b!50708))

(assert (= (and b!50708 c!6829) b!50707))

(assert (= (and b!50708 (not c!6829)) b!50706))

(assert (= (or b!50707 b!50706) bm!3907))

(assert (=> bm!3907 m!43853))

(declare-fun m!43873 () Bool)

(assert (=> bm!3907 m!43873))

(assert (=> b!50705 m!43853))

(assert (=> b!50705 m!43853))

(declare-fun m!43875 () Bool)

(assert (=> b!50705 m!43875))

(assert (=> b!50708 m!43853))

(assert (=> b!50708 m!43853))

(assert (=> b!50708 m!43855))

(assert (=> b!50709 m!43853))

(assert (=> b!50709 m!43853))

(assert (=> b!50709 m!43855))

(assert (=> b!50645 d!10217))

(declare-fun condMapEmpty!2225 () Bool)

(declare-fun mapDefault!2225 () ValueCell!753)

(assert (=> mapNonEmpty!2224 (= condMapEmpty!2225 (= mapRest!2224 ((as const (Array (_ BitVec 32) ValueCell!753)) mapDefault!2225)))))

(declare-fun e!32790 () Bool)

(declare-fun mapRes!2225 () Bool)

(assert (=> mapNonEmpty!2224 (= tp!6742 (and e!32790 mapRes!2225))))

(declare-fun mapIsEmpty!2225 () Bool)

(assert (=> mapIsEmpty!2225 mapRes!2225))

(declare-fun b!50711 () Bool)

(assert (=> b!50711 (= e!32790 tp_is_empty!2193)))

(declare-fun b!50710 () Bool)

(declare-fun e!32789 () Bool)

(assert (=> b!50710 (= e!32789 tp_is_empty!2193)))

(declare-fun mapNonEmpty!2225 () Bool)

(declare-fun tp!6743 () Bool)

(assert (=> mapNonEmpty!2225 (= mapRes!2225 (and tp!6743 e!32789))))

(declare-fun mapValue!2225 () ValueCell!753)

(declare-fun mapRest!2225 () (Array (_ BitVec 32) ValueCell!753))

(declare-fun mapKey!2225 () (_ BitVec 32))

(assert (=> mapNonEmpty!2225 (= mapRest!2224 (store mapRest!2225 mapKey!2225 mapValue!2225))))

(assert (= (and mapNonEmpty!2224 condMapEmpty!2225) mapIsEmpty!2225))

(assert (= (and mapNonEmpty!2224 (not condMapEmpty!2225)) mapNonEmpty!2225))

(assert (= (and mapNonEmpty!2225 ((_ is ValueCellFull!753) mapValue!2225)) b!50710))

(assert (= (and mapNonEmpty!2224 ((_ is ValueCellFull!753) mapDefault!2225)) b!50711))

(declare-fun m!43877 () Bool)

(assert (=> mapNonEmpty!2225 m!43877))

(declare-fun condMapEmpty!2226 () Bool)

(declare-fun mapDefault!2226 () ValueCell!753)

(assert (=> mapNonEmpty!2223 (= condMapEmpty!2226 (= mapRest!2223 ((as const (Array (_ BitVec 32) ValueCell!753)) mapDefault!2226)))))

(declare-fun e!32792 () Bool)

(declare-fun mapRes!2226 () Bool)

(assert (=> mapNonEmpty!2223 (= tp!6741 (and e!32792 mapRes!2226))))

(declare-fun mapIsEmpty!2226 () Bool)

(assert (=> mapIsEmpty!2226 mapRes!2226))

(declare-fun b!50713 () Bool)

(assert (=> b!50713 (= e!32792 tp_is_empty!2193)))

(declare-fun b!50712 () Bool)

(declare-fun e!32791 () Bool)

(assert (=> b!50712 (= e!32791 tp_is_empty!2193)))

(declare-fun mapNonEmpty!2226 () Bool)

(declare-fun tp!6744 () Bool)

(assert (=> mapNonEmpty!2226 (= mapRes!2226 (and tp!6744 e!32791))))

(declare-fun mapKey!2226 () (_ BitVec 32))

(declare-fun mapValue!2226 () ValueCell!753)

(declare-fun mapRest!2226 () (Array (_ BitVec 32) ValueCell!753))

(assert (=> mapNonEmpty!2226 (= mapRest!2223 (store mapRest!2226 mapKey!2226 mapValue!2226))))

(assert (= (and mapNonEmpty!2223 condMapEmpty!2226) mapIsEmpty!2226))

(assert (= (and mapNonEmpty!2223 (not condMapEmpty!2226)) mapNonEmpty!2226))

(assert (= (and mapNonEmpty!2226 ((_ is ValueCellFull!753) mapValue!2226)) b!50712))

(assert (= (and mapNonEmpty!2223 ((_ is ValueCellFull!753) mapDefault!2226)) b!50713))

(declare-fun m!43879 () Bool)

(assert (=> mapNonEmpty!2226 m!43879))

(check-sat b_and!2765 (not b!50679) (not bm!3904) (not b!50692) (not d!10209) (not b!50709) (not b!50693) (not mapNonEmpty!2225) (not bm!3907) (not b!50666) tp_is_empty!2193 (not b!50705) (not bm!3901) (not b!50665) (not b!50708) (not b_next!1555) (not mapNonEmpty!2226) (not d!10213) b_and!2763 (not b!50680) (not b!50682) (not b!50681) (not b_next!1553))
(check-sat b_and!2763 b_and!2765 (not b_next!1553) (not b_next!1555))
(get-model)

(declare-fun d!10219 () Bool)

(assert (=> d!10219 (= (validKeyInArray!0 (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!50693 d!10219))

(declare-fun b!50714 () Bool)

(declare-fun e!32794 () (_ BitVec 32))

(declare-fun call!3911 () (_ BitVec 32))

(assert (=> b!50714 (= e!32794 (bvadd #b00000000000000000000000000000001 call!3911))))

(declare-fun b!50715 () Bool)

(assert (=> b!50715 (= e!32794 call!3911)))

(declare-fun b!50716 () Bool)

(declare-fun e!32793 () (_ BitVec 32))

(assert (=> b!50716 (= e!32793 #b00000000000000000000000000000000)))

(declare-fun bm!3908 () Bool)

(assert (=> bm!3908 (= call!3911 (arrayCountValidKeys!0 (_keys!3531 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1801 (_keys!3531 newMap!16))))))

(declare-fun d!10221 () Bool)

(declare-fun lt!21094 () (_ BitVec 32))

(assert (=> d!10221 (and (bvsge lt!21094 #b00000000000000000000000000000000) (bvsle lt!21094 (bvsub (size!1801 (_keys!3531 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!10221 (= lt!21094 e!32793)))

(declare-fun c!6831 () Bool)

(assert (=> d!10221 (= c!6831 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1801 (_keys!3531 newMap!16))))))

(assert (=> d!10221 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1801 (_keys!3531 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1801 (_keys!3531 newMap!16)) (size!1801 (_keys!3531 newMap!16))))))

(assert (=> d!10221 (= (arrayCountValidKeys!0 (_keys!3531 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1801 (_keys!3531 newMap!16))) lt!21094)))

(declare-fun b!50717 () Bool)

(assert (=> b!50717 (= e!32793 e!32794)))

(declare-fun c!6830 () Bool)

(assert (=> b!50717 (= c!6830 (validKeyInArray!0 (select (arr!1577 (_keys!3531 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!10221 c!6831) b!50716))

(assert (= (and d!10221 (not c!6831)) b!50717))

(assert (= (and b!50717 c!6830) b!50714))

(assert (= (and b!50717 (not c!6830)) b!50715))

(assert (= (or b!50714 b!50715) bm!3908))

(declare-fun m!43881 () Bool)

(assert (=> bm!3908 m!43881))

(declare-fun m!43883 () Bool)

(assert (=> b!50717 m!43883))

(assert (=> b!50717 m!43883))

(declare-fun m!43885 () Bool)

(assert (=> b!50717 m!43885))

(assert (=> bm!3901 d!10221))

(declare-fun d!10223 () Bool)

(assert (=> d!10223 (arrayContainsKey!0 (_keys!3531 newMap!16) lt!21091 #b00000000000000000000000000000000)))

(declare-fun lt!21097 () Unit!1421)

(declare-fun choose!13 (array!3299 (_ BitVec 64) (_ BitVec 32)) Unit!1421)

(assert (=> d!10223 (= lt!21097 (choose!13 (_keys!3531 newMap!16) lt!21091 #b00000000000000000000000000000000))))

(assert (=> d!10223 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!10223 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3531 newMap!16) lt!21091 #b00000000000000000000000000000000) lt!21097)))

(declare-fun bs!2364 () Bool)

(assert (= bs!2364 d!10223))

(assert (=> bs!2364 m!43869))

(declare-fun m!43887 () Bool)

(assert (=> bs!2364 m!43887))

(assert (=> b!50692 d!10223))

(declare-fun d!10225 () Bool)

(declare-fun res!29153 () Bool)

(declare-fun e!32799 () Bool)

(assert (=> d!10225 (=> res!29153 e!32799)))

(assert (=> d!10225 (= res!29153 (= (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000) lt!21091))))

(assert (=> d!10225 (= (arrayContainsKey!0 (_keys!3531 newMap!16) lt!21091 #b00000000000000000000000000000000) e!32799)))

(declare-fun b!50722 () Bool)

(declare-fun e!32800 () Bool)

(assert (=> b!50722 (= e!32799 e!32800)))

(declare-fun res!29154 () Bool)

(assert (=> b!50722 (=> (not res!29154) (not e!32800))))

(assert (=> b!50722 (= res!29154 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1801 (_keys!3531 newMap!16))))))

(declare-fun b!50723 () Bool)

(assert (=> b!50723 (= e!32800 (arrayContainsKey!0 (_keys!3531 newMap!16) lt!21091 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10225 (not res!29153)) b!50722))

(assert (= (and b!50722 res!29154) b!50723))

(assert (=> d!10225 m!43853))

(declare-fun m!43889 () Bool)

(assert (=> b!50723 m!43889))

(assert (=> b!50692 d!10225))

(declare-fun b!50736 () Bool)

(declare-fun e!32808 () SeekEntryResult!220)

(declare-fun e!32809 () SeekEntryResult!220)

(assert (=> b!50736 (= e!32808 e!32809)))

(declare-fun lt!21105 () (_ BitVec 64))

(declare-fun lt!21106 () SeekEntryResult!220)

(assert (=> b!50736 (= lt!21105 (select (arr!1577 (_keys!3531 newMap!16)) (index!3004 lt!21106)))))

(declare-fun c!6840 () Bool)

(assert (=> b!50736 (= c!6840 (= lt!21105 (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50737 () Bool)

(declare-fun c!6838 () Bool)

(assert (=> b!50737 (= c!6838 (= lt!21105 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32807 () SeekEntryResult!220)

(assert (=> b!50737 (= e!32809 e!32807)))

(declare-fun b!50738 () Bool)

(assert (=> b!50738 (= e!32809 (Found!220 (index!3004 lt!21106)))))

(declare-fun b!50739 () Bool)

(assert (=> b!50739 (= e!32808 Undefined!220)))

(declare-fun b!50741 () Bool)

(assert (=> b!50741 (= e!32807 (MissingZero!220 (index!3004 lt!21106)))))

(declare-fun b!50740 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3299 (_ BitVec 32)) SeekEntryResult!220)

(assert (=> b!50740 (= e!32807 (seekKeyOrZeroReturnVacant!0 (x!9252 lt!21106) (index!3004 lt!21106) (index!3004 lt!21106) (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000) (_keys!3531 newMap!16) (mask!5713 newMap!16)))))

(declare-fun d!10227 () Bool)

(declare-fun lt!21104 () SeekEntryResult!220)

(assert (=> d!10227 (and (or ((_ is Undefined!220) lt!21104) (not ((_ is Found!220) lt!21104)) (and (bvsge (index!3003 lt!21104) #b00000000000000000000000000000000) (bvslt (index!3003 lt!21104) (size!1801 (_keys!3531 newMap!16))))) (or ((_ is Undefined!220) lt!21104) ((_ is Found!220) lt!21104) (not ((_ is MissingZero!220) lt!21104)) (and (bvsge (index!3002 lt!21104) #b00000000000000000000000000000000) (bvslt (index!3002 lt!21104) (size!1801 (_keys!3531 newMap!16))))) (or ((_ is Undefined!220) lt!21104) ((_ is Found!220) lt!21104) ((_ is MissingZero!220) lt!21104) (not ((_ is MissingVacant!220) lt!21104)) (and (bvsge (index!3005 lt!21104) #b00000000000000000000000000000000) (bvslt (index!3005 lt!21104) (size!1801 (_keys!3531 newMap!16))))) (or ((_ is Undefined!220) lt!21104) (ite ((_ is Found!220) lt!21104) (= (select (arr!1577 (_keys!3531 newMap!16)) (index!3003 lt!21104)) (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!220) lt!21104) (= (select (arr!1577 (_keys!3531 newMap!16)) (index!3002 lt!21104)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!220) lt!21104) (= (select (arr!1577 (_keys!3531 newMap!16)) (index!3005 lt!21104)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10227 (= lt!21104 e!32808)))

(declare-fun c!6839 () Bool)

(assert (=> d!10227 (= c!6839 (and ((_ is Intermediate!220) lt!21106) (undefined!1032 lt!21106)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3299 (_ BitVec 32)) SeekEntryResult!220)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!10227 (= lt!21106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000) (mask!5713 newMap!16)) (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000) (_keys!3531 newMap!16) (mask!5713 newMap!16)))))

(assert (=> d!10227 (validMask!0 (mask!5713 newMap!16))))

(assert (=> d!10227 (= (seekEntryOrOpen!0 (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000) (_keys!3531 newMap!16) (mask!5713 newMap!16)) lt!21104)))

(assert (= (and d!10227 c!6839) b!50739))

(assert (= (and d!10227 (not c!6839)) b!50736))

(assert (= (and b!50736 c!6840) b!50738))

(assert (= (and b!50736 (not c!6840)) b!50737))

(assert (= (and b!50737 c!6838) b!50741))

(assert (= (and b!50737 (not c!6838)) b!50740))

(declare-fun m!43891 () Bool)

(assert (=> b!50736 m!43891))

(assert (=> b!50740 m!43853))

(declare-fun m!43893 () Bool)

(assert (=> b!50740 m!43893))

(declare-fun m!43895 () Bool)

(assert (=> d!10227 m!43895))

(assert (=> d!10227 m!43853))

(declare-fun m!43897 () Bool)

(assert (=> d!10227 m!43897))

(declare-fun m!43899 () Bool)

(assert (=> d!10227 m!43899))

(assert (=> d!10227 m!43849))

(declare-fun m!43901 () Bool)

(assert (=> d!10227 m!43901))

(assert (=> d!10227 m!43853))

(assert (=> d!10227 m!43895))

(declare-fun m!43903 () Bool)

(assert (=> d!10227 m!43903))

(assert (=> b!50692 d!10227))

(declare-fun d!10229 () Bool)

(assert (=> d!10229 (= (size!1805 newMap!16) (bvadd (_size!256 newMap!16) (bvsdiv (bvadd (extraKeys!1812 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!50666 d!10229))

(declare-fun b!50744 () Bool)

(declare-fun res!29157 () Bool)

(declare-fun e!32810 () Bool)

(assert (=> b!50744 (=> (not res!29157) (not e!32810))))

(assert (=> b!50744 (= res!29157 (= (size!1805 (v!2170 (underlying!131 thiss!992))) (bvadd (_size!256 (v!2170 (underlying!131 thiss!992))) (bvsdiv (bvadd (extraKeys!1812 (v!2170 (underlying!131 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!10231 () Bool)

(declare-fun res!29156 () Bool)

(assert (=> d!10231 (=> (not res!29156) (not e!32810))))

(assert (=> d!10231 (= res!29156 (validMask!0 (mask!5713 (v!2170 (underlying!131 thiss!992)))))))

(assert (=> d!10231 (= (simpleValid!35 (v!2170 (underlying!131 thiss!992))) e!32810)))

(declare-fun b!50742 () Bool)

(declare-fun res!29158 () Bool)

(assert (=> b!50742 (=> (not res!29158) (not e!32810))))

(assert (=> b!50742 (= res!29158 (and (= (size!1802 (_values!1904 (v!2170 (underlying!131 thiss!992)))) (bvadd (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000000000000000000000000000001)) (= (size!1801 (_keys!3531 (v!2170 (underlying!131 thiss!992)))) (size!1802 (_values!1904 (v!2170 (underlying!131 thiss!992))))) (bvsge (_size!256 (v!2170 (underlying!131 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!256 (v!2170 (underlying!131 thiss!992))) (bvadd (mask!5713 (v!2170 (underlying!131 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun b!50745 () Bool)

(assert (=> b!50745 (= e!32810 (and (bvsge (extraKeys!1812 (v!2170 (underlying!131 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1812 (v!2170 (underlying!131 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!256 (v!2170 (underlying!131 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!50743 () Bool)

(declare-fun res!29155 () Bool)

(assert (=> b!50743 (=> (not res!29155) (not e!32810))))

(assert (=> b!50743 (= res!29155 (bvsge (size!1805 (v!2170 (underlying!131 thiss!992))) (_size!256 (v!2170 (underlying!131 thiss!992)))))))

(assert (= (and d!10231 res!29156) b!50742))

(assert (= (and b!50742 res!29158) b!50743))

(assert (= (and b!50743 res!29155) b!50744))

(assert (= (and b!50744 res!29157) b!50745))

(declare-fun m!43905 () Bool)

(assert (=> b!50744 m!43905))

(assert (=> d!10231 m!43809))

(assert (=> b!50743 m!43905))

(assert (=> d!10213 d!10231))

(declare-fun d!10233 () Bool)

(declare-fun res!29159 () Bool)

(declare-fun e!32813 () Bool)

(assert (=> d!10233 (=> res!29159 e!32813)))

(assert (=> d!10233 (= res!29159 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1801 (_keys!3531 newMap!16))))))

(assert (=> d!10233 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3531 newMap!16) (mask!5713 newMap!16)) e!32813)))

(declare-fun b!50746 () Bool)

(declare-fun e!32811 () Bool)

(declare-fun call!3912 () Bool)

(assert (=> b!50746 (= e!32811 call!3912)))

(declare-fun bm!3909 () Bool)

(assert (=> bm!3909 (= call!3912 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3531 newMap!16) (mask!5713 newMap!16)))))

(declare-fun b!50747 () Bool)

(declare-fun e!32812 () Bool)

(assert (=> b!50747 (= e!32811 e!32812)))

(declare-fun lt!21107 () (_ BitVec 64))

(assert (=> b!50747 (= lt!21107 (select (arr!1577 (_keys!3531 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!21109 () Unit!1421)

(assert (=> b!50747 (= lt!21109 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3531 newMap!16) lt!21107 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!50747 (arrayContainsKey!0 (_keys!3531 newMap!16) lt!21107 #b00000000000000000000000000000000)))

(declare-fun lt!21108 () Unit!1421)

(assert (=> b!50747 (= lt!21108 lt!21109)))

(declare-fun res!29160 () Bool)

(assert (=> b!50747 (= res!29160 (= (seekEntryOrOpen!0 (select (arr!1577 (_keys!3531 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3531 newMap!16) (mask!5713 newMap!16)) (Found!220 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!50747 (=> (not res!29160) (not e!32812))))

(declare-fun b!50748 () Bool)

(assert (=> b!50748 (= e!32813 e!32811)))

(declare-fun c!6841 () Bool)

(assert (=> b!50748 (= c!6841 (validKeyInArray!0 (select (arr!1577 (_keys!3531 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50749 () Bool)

(assert (=> b!50749 (= e!32812 call!3912)))

(assert (= (and d!10233 (not res!29159)) b!50748))

(assert (= (and b!50748 c!6841) b!50747))

(assert (= (and b!50748 (not c!6841)) b!50746))

(assert (= (and b!50747 res!29160) b!50749))

(assert (= (or b!50749 b!50746) bm!3909))

(declare-fun m!43907 () Bool)

(assert (=> bm!3909 m!43907))

(assert (=> b!50747 m!43883))

(declare-fun m!43909 () Bool)

(assert (=> b!50747 m!43909))

(declare-fun m!43911 () Bool)

(assert (=> b!50747 m!43911))

(assert (=> b!50747 m!43883))

(declare-fun m!43913 () Bool)

(assert (=> b!50747 m!43913))

(assert (=> b!50748 m!43883))

(assert (=> b!50748 m!43883))

(assert (=> b!50748 m!43885))

(assert (=> bm!3904 d!10233))

(assert (=> b!50665 d!10229))

(assert (=> b!50709 d!10219))

(assert (=> b!50708 d!10219))

(declare-fun bm!3910 () Bool)

(declare-fun call!3913 () Bool)

(declare-fun c!6842 () Bool)

(assert (=> bm!3910 (= call!3913 (arrayNoDuplicates!0 (_keys!3531 (v!2170 (underlying!131 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6842 (Cons!1326 (select (arr!1577 (_keys!3531 (v!2170 (underlying!131 thiss!992)))) #b00000000000000000000000000000000) Nil!1327) Nil!1327)))))

(declare-fun b!50750 () Bool)

(declare-fun e!32816 () Bool)

(assert (=> b!50750 (= e!32816 (contains!620 Nil!1327 (select (arr!1577 (_keys!3531 (v!2170 (underlying!131 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!10235 () Bool)

(declare-fun res!29163 () Bool)

(declare-fun e!32815 () Bool)

(assert (=> d!10235 (=> res!29163 e!32815)))

(assert (=> d!10235 (= res!29163 (bvsge #b00000000000000000000000000000000 (size!1801 (_keys!3531 (v!2170 (underlying!131 thiss!992))))))))

(assert (=> d!10235 (= (arrayNoDuplicates!0 (_keys!3531 (v!2170 (underlying!131 thiss!992))) #b00000000000000000000000000000000 Nil!1327) e!32815)))

(declare-fun b!50751 () Bool)

(declare-fun e!32817 () Bool)

(assert (=> b!50751 (= e!32817 call!3913)))

(declare-fun b!50752 () Bool)

(assert (=> b!50752 (= e!32817 call!3913)))

(declare-fun b!50753 () Bool)

(declare-fun e!32814 () Bool)

(assert (=> b!50753 (= e!32814 e!32817)))

(assert (=> b!50753 (= c!6842 (validKeyInArray!0 (select (arr!1577 (_keys!3531 (v!2170 (underlying!131 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50754 () Bool)

(assert (=> b!50754 (= e!32815 e!32814)))

(declare-fun res!29161 () Bool)

(assert (=> b!50754 (=> (not res!29161) (not e!32814))))

(assert (=> b!50754 (= res!29161 (not e!32816))))

(declare-fun res!29162 () Bool)

(assert (=> b!50754 (=> (not res!29162) (not e!32816))))

(assert (=> b!50754 (= res!29162 (validKeyInArray!0 (select (arr!1577 (_keys!3531 (v!2170 (underlying!131 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!10235 (not res!29163)) b!50754))

(assert (= (and b!50754 res!29162) b!50750))

(assert (= (and b!50754 res!29161) b!50753))

(assert (= (and b!50753 c!6842) b!50752))

(assert (= (and b!50753 (not c!6842)) b!50751))

(assert (= (or b!50752 b!50751) bm!3910))

(declare-fun m!43915 () Bool)

(assert (=> bm!3910 m!43915))

(declare-fun m!43917 () Bool)

(assert (=> bm!3910 m!43917))

(assert (=> b!50750 m!43915))

(assert (=> b!50750 m!43915))

(declare-fun m!43919 () Bool)

(assert (=> b!50750 m!43919))

(assert (=> b!50753 m!43915))

(assert (=> b!50753 m!43915))

(declare-fun m!43921 () Bool)

(assert (=> b!50753 m!43921))

(assert (=> b!50754 m!43915))

(assert (=> b!50754 m!43915))

(assert (=> b!50754 m!43921))

(assert (=> b!50682 d!10235))

(declare-fun d!10237 () Bool)

(declare-fun res!29164 () Bool)

(declare-fun e!32820 () Bool)

(assert (=> d!10237 (=> res!29164 e!32820)))

(assert (=> d!10237 (= res!29164 (bvsge #b00000000000000000000000000000000 (size!1801 (_keys!3531 (v!2170 (underlying!131 thiss!992))))))))

(assert (=> d!10237 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3531 (v!2170 (underlying!131 thiss!992))) (mask!5713 (v!2170 (underlying!131 thiss!992)))) e!32820)))

(declare-fun b!50755 () Bool)

(declare-fun e!32818 () Bool)

(declare-fun call!3914 () Bool)

(assert (=> b!50755 (= e!32818 call!3914)))

(declare-fun bm!3911 () Bool)

(assert (=> bm!3911 (= call!3914 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3531 (v!2170 (underlying!131 thiss!992))) (mask!5713 (v!2170 (underlying!131 thiss!992)))))))

(declare-fun b!50756 () Bool)

(declare-fun e!32819 () Bool)

(assert (=> b!50756 (= e!32818 e!32819)))

(declare-fun lt!21110 () (_ BitVec 64))

(assert (=> b!50756 (= lt!21110 (select (arr!1577 (_keys!3531 (v!2170 (underlying!131 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!21112 () Unit!1421)

(assert (=> b!50756 (= lt!21112 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3531 (v!2170 (underlying!131 thiss!992))) lt!21110 #b00000000000000000000000000000000))))

(assert (=> b!50756 (arrayContainsKey!0 (_keys!3531 (v!2170 (underlying!131 thiss!992))) lt!21110 #b00000000000000000000000000000000)))

(declare-fun lt!21111 () Unit!1421)

(assert (=> b!50756 (= lt!21111 lt!21112)))

(declare-fun res!29165 () Bool)

(assert (=> b!50756 (= res!29165 (= (seekEntryOrOpen!0 (select (arr!1577 (_keys!3531 (v!2170 (underlying!131 thiss!992)))) #b00000000000000000000000000000000) (_keys!3531 (v!2170 (underlying!131 thiss!992))) (mask!5713 (v!2170 (underlying!131 thiss!992)))) (Found!220 #b00000000000000000000000000000000)))))

(assert (=> b!50756 (=> (not res!29165) (not e!32819))))

(declare-fun b!50757 () Bool)

(assert (=> b!50757 (= e!32820 e!32818)))

(declare-fun c!6843 () Bool)

(assert (=> b!50757 (= c!6843 (validKeyInArray!0 (select (arr!1577 (_keys!3531 (v!2170 (underlying!131 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50758 () Bool)

(assert (=> b!50758 (= e!32819 call!3914)))

(assert (= (and d!10237 (not res!29164)) b!50757))

(assert (= (and b!50757 c!6843) b!50756))

(assert (= (and b!50757 (not c!6843)) b!50755))

(assert (= (and b!50756 res!29165) b!50758))

(assert (= (or b!50758 b!50755) bm!3911))

(declare-fun m!43923 () Bool)

(assert (=> bm!3911 m!43923))

(assert (=> b!50756 m!43915))

(declare-fun m!43925 () Bool)

(assert (=> b!50756 m!43925))

(declare-fun m!43927 () Bool)

(assert (=> b!50756 m!43927))

(assert (=> b!50756 m!43915))

(declare-fun m!43929 () Bool)

(assert (=> b!50756 m!43929))

(assert (=> b!50757 m!43915))

(assert (=> b!50757 m!43915))

(assert (=> b!50757 m!43921))

(assert (=> b!50681 d!10237))

(declare-fun d!10239 () Bool)

(declare-fun lt!21115 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!57 (List!1330) (InoxSet (_ BitVec 64)))

(assert (=> d!10239 (= lt!21115 (select (content!57 Nil!1327) (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!32825 () Bool)

(assert (=> d!10239 (= lt!21115 e!32825)))

(declare-fun res!29170 () Bool)

(assert (=> d!10239 (=> (not res!29170) (not e!32825))))

(assert (=> d!10239 (= res!29170 ((_ is Cons!1326) Nil!1327))))

(assert (=> d!10239 (= (contains!620 Nil!1327 (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000)) lt!21115)))

(declare-fun b!50763 () Bool)

(declare-fun e!32826 () Bool)

(assert (=> b!50763 (= e!32825 e!32826)))

(declare-fun res!29171 () Bool)

(assert (=> b!50763 (=> res!29171 e!32826)))

(assert (=> b!50763 (= res!29171 (= (h!1906 Nil!1327) (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50764 () Bool)

(assert (=> b!50764 (= e!32826 (contains!620 (t!4364 Nil!1327) (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10239 res!29170) b!50763))

(assert (= (and b!50763 (not res!29171)) b!50764))

(declare-fun m!43931 () Bool)

(assert (=> d!10239 m!43931))

(assert (=> d!10239 m!43853))

(declare-fun m!43933 () Bool)

(assert (=> d!10239 m!43933))

(assert (=> b!50764 m!43853))

(declare-fun m!43935 () Bool)

(assert (=> b!50764 m!43935))

(assert (=> b!50705 d!10239))

(declare-fun b!50765 () Bool)

(declare-fun e!32828 () (_ BitVec 32))

(declare-fun call!3915 () (_ BitVec 32))

(assert (=> b!50765 (= e!32828 (bvadd #b00000000000000000000000000000001 call!3915))))

(declare-fun b!50766 () Bool)

(assert (=> b!50766 (= e!32828 call!3915)))

(declare-fun b!50767 () Bool)

(declare-fun e!32827 () (_ BitVec 32))

(assert (=> b!50767 (= e!32827 #b00000000000000000000000000000000)))

(declare-fun bm!3912 () Bool)

(assert (=> bm!3912 (= call!3915 (arrayCountValidKeys!0 (_keys!3531 (v!2170 (underlying!131 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1801 (_keys!3531 (v!2170 (underlying!131 thiss!992))))))))

(declare-fun d!10241 () Bool)

(declare-fun lt!21116 () (_ BitVec 32))

(assert (=> d!10241 (and (bvsge lt!21116 #b00000000000000000000000000000000) (bvsle lt!21116 (bvsub (size!1801 (_keys!3531 (v!2170 (underlying!131 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!10241 (= lt!21116 e!32827)))

(declare-fun c!6845 () Bool)

(assert (=> d!10241 (= c!6845 (bvsge #b00000000000000000000000000000000 (size!1801 (_keys!3531 (v!2170 (underlying!131 thiss!992))))))))

(assert (=> d!10241 (and (bvsle #b00000000000000000000000000000000 (size!1801 (_keys!3531 (v!2170 (underlying!131 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1801 (_keys!3531 (v!2170 (underlying!131 thiss!992)))) (size!1801 (_keys!3531 (v!2170 (underlying!131 thiss!992))))))))

(assert (=> d!10241 (= (arrayCountValidKeys!0 (_keys!3531 (v!2170 (underlying!131 thiss!992))) #b00000000000000000000000000000000 (size!1801 (_keys!3531 (v!2170 (underlying!131 thiss!992))))) lt!21116)))

(declare-fun b!50768 () Bool)

(assert (=> b!50768 (= e!32827 e!32828)))

(declare-fun c!6844 () Bool)

(assert (=> b!50768 (= c!6844 (validKeyInArray!0 (select (arr!1577 (_keys!3531 (v!2170 (underlying!131 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!10241 c!6845) b!50767))

(assert (= (and d!10241 (not c!6845)) b!50768))

(assert (= (and b!50768 c!6844) b!50765))

(assert (= (and b!50768 (not c!6844)) b!50766))

(assert (= (or b!50765 b!50766) bm!3912))

(declare-fun m!43937 () Bool)

(assert (=> bm!3912 m!43937))

(assert (=> b!50768 m!43915))

(assert (=> b!50768 m!43915))

(assert (=> b!50768 m!43921))

(assert (=> b!50680 d!10241))

(declare-fun c!6846 () Bool)

(declare-fun bm!3913 () Bool)

(declare-fun call!3916 () Bool)

(assert (=> bm!3913 (= call!3916 (arrayNoDuplicates!0 (_keys!3531 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!6846 (Cons!1326 (select (arr!1577 (_keys!3531 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!6829 (Cons!1326 (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000) Nil!1327) Nil!1327)) (ite c!6829 (Cons!1326 (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000) Nil!1327) Nil!1327))))))

(declare-fun b!50769 () Bool)

(declare-fun e!32831 () Bool)

(assert (=> b!50769 (= e!32831 (contains!620 (ite c!6829 (Cons!1326 (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000) Nil!1327) Nil!1327) (select (arr!1577 (_keys!3531 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!10243 () Bool)

(declare-fun res!29174 () Bool)

(declare-fun e!32830 () Bool)

(assert (=> d!10243 (=> res!29174 e!32830)))

(assert (=> d!10243 (= res!29174 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1801 (_keys!3531 newMap!16))))))

(assert (=> d!10243 (= (arrayNoDuplicates!0 (_keys!3531 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6829 (Cons!1326 (select (arr!1577 (_keys!3531 newMap!16)) #b00000000000000000000000000000000) Nil!1327) Nil!1327)) e!32830)))

(declare-fun b!50770 () Bool)

(declare-fun e!32832 () Bool)

(assert (=> b!50770 (= e!32832 call!3916)))

(declare-fun b!50771 () Bool)

(assert (=> b!50771 (= e!32832 call!3916)))

(declare-fun b!50772 () Bool)

(declare-fun e!32829 () Bool)

(assert (=> b!50772 (= e!32829 e!32832)))

(assert (=> b!50772 (= c!6846 (validKeyInArray!0 (select (arr!1577 (_keys!3531 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50773 () Bool)

(assert (=> b!50773 (= e!32830 e!32829)))

(declare-fun res!29172 () Bool)

(assert (=> b!50773 (=> (not res!29172) (not e!32829))))

(assert (=> b!50773 (= res!29172 (not e!32831))))

(declare-fun res!29173 () Bool)

(assert (=> b!50773 (=> (not res!29173) (not e!32831))))

(assert (=> b!50773 (= res!29173 (validKeyInArray!0 (select (arr!1577 (_keys!3531 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!10243 (not res!29174)) b!50773))

(assert (= (and b!50773 res!29173) b!50769))

(assert (= (and b!50773 res!29172) b!50772))

(assert (= (and b!50772 c!6846) b!50771))

(assert (= (and b!50772 (not c!6846)) b!50770))

(assert (= (or b!50771 b!50770) bm!3913))

(assert (=> bm!3913 m!43883))

(declare-fun m!43939 () Bool)

(assert (=> bm!3913 m!43939))

(assert (=> b!50769 m!43883))

(assert (=> b!50769 m!43883))

(declare-fun m!43941 () Bool)

(assert (=> b!50769 m!43941))

(assert (=> b!50772 m!43883))

(assert (=> b!50772 m!43883))

(assert (=> b!50772 m!43885))

(assert (=> b!50773 m!43883))

(assert (=> b!50773 m!43883))

(assert (=> b!50773 m!43885))

(assert (=> bm!3907 d!10243))

(declare-fun d!10245 () Bool)

(assert (=> d!10245 (= (validMask!0 (mask!5713 newMap!16)) (and (or (= (mask!5713 newMap!16) #b00000000000000000000000000000111) (= (mask!5713 newMap!16) #b00000000000000000000000000001111) (= (mask!5713 newMap!16) #b00000000000000000000000000011111) (= (mask!5713 newMap!16) #b00000000000000000000000000111111) (= (mask!5713 newMap!16) #b00000000000000000000000001111111) (= (mask!5713 newMap!16) #b00000000000000000000000011111111) (= (mask!5713 newMap!16) #b00000000000000000000000111111111) (= (mask!5713 newMap!16) #b00000000000000000000001111111111) (= (mask!5713 newMap!16) #b00000000000000000000011111111111) (= (mask!5713 newMap!16) #b00000000000000000000111111111111) (= (mask!5713 newMap!16) #b00000000000000000001111111111111) (= (mask!5713 newMap!16) #b00000000000000000011111111111111) (= (mask!5713 newMap!16) #b00000000000000000111111111111111) (= (mask!5713 newMap!16) #b00000000000000001111111111111111) (= (mask!5713 newMap!16) #b00000000000000011111111111111111) (= (mask!5713 newMap!16) #b00000000000000111111111111111111) (= (mask!5713 newMap!16) #b00000000000001111111111111111111) (= (mask!5713 newMap!16) #b00000000000011111111111111111111) (= (mask!5713 newMap!16) #b00000000000111111111111111111111) (= (mask!5713 newMap!16) #b00000000001111111111111111111111) (= (mask!5713 newMap!16) #b00000000011111111111111111111111) (= (mask!5713 newMap!16) #b00000000111111111111111111111111) (= (mask!5713 newMap!16) #b00000001111111111111111111111111) (= (mask!5713 newMap!16) #b00000011111111111111111111111111) (= (mask!5713 newMap!16) #b00000111111111111111111111111111) (= (mask!5713 newMap!16) #b00001111111111111111111111111111) (= (mask!5713 newMap!16) #b00011111111111111111111111111111) (= (mask!5713 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!5713 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!10209 d!10245))

(assert (=> b!50679 d!10219))

(declare-fun condMapEmpty!2227 () Bool)

(declare-fun mapDefault!2227 () ValueCell!753)

(assert (=> mapNonEmpty!2225 (= condMapEmpty!2227 (= mapRest!2225 ((as const (Array (_ BitVec 32) ValueCell!753)) mapDefault!2227)))))

(declare-fun e!32834 () Bool)

(declare-fun mapRes!2227 () Bool)

(assert (=> mapNonEmpty!2225 (= tp!6743 (and e!32834 mapRes!2227))))

(declare-fun mapIsEmpty!2227 () Bool)

(assert (=> mapIsEmpty!2227 mapRes!2227))

(declare-fun b!50775 () Bool)

(assert (=> b!50775 (= e!32834 tp_is_empty!2193)))

(declare-fun b!50774 () Bool)

(declare-fun e!32833 () Bool)

(assert (=> b!50774 (= e!32833 tp_is_empty!2193)))

(declare-fun mapNonEmpty!2227 () Bool)

(declare-fun tp!6745 () Bool)

(assert (=> mapNonEmpty!2227 (= mapRes!2227 (and tp!6745 e!32833))))

(declare-fun mapValue!2227 () ValueCell!753)

(declare-fun mapRest!2227 () (Array (_ BitVec 32) ValueCell!753))

(declare-fun mapKey!2227 () (_ BitVec 32))

(assert (=> mapNonEmpty!2227 (= mapRest!2225 (store mapRest!2227 mapKey!2227 mapValue!2227))))

(assert (= (and mapNonEmpty!2225 condMapEmpty!2227) mapIsEmpty!2227))

(assert (= (and mapNonEmpty!2225 (not condMapEmpty!2227)) mapNonEmpty!2227))

(assert (= (and mapNonEmpty!2227 ((_ is ValueCellFull!753) mapValue!2227)) b!50774))

(assert (= (and mapNonEmpty!2225 ((_ is ValueCellFull!753) mapDefault!2227)) b!50775))

(declare-fun m!43943 () Bool)

(assert (=> mapNonEmpty!2227 m!43943))

(declare-fun condMapEmpty!2228 () Bool)

(declare-fun mapDefault!2228 () ValueCell!753)

(assert (=> mapNonEmpty!2226 (= condMapEmpty!2228 (= mapRest!2226 ((as const (Array (_ BitVec 32) ValueCell!753)) mapDefault!2228)))))

(declare-fun e!32836 () Bool)

(declare-fun mapRes!2228 () Bool)

(assert (=> mapNonEmpty!2226 (= tp!6744 (and e!32836 mapRes!2228))))

(declare-fun mapIsEmpty!2228 () Bool)

(assert (=> mapIsEmpty!2228 mapRes!2228))

(declare-fun b!50777 () Bool)

(assert (=> b!50777 (= e!32836 tp_is_empty!2193)))

(declare-fun b!50776 () Bool)

(declare-fun e!32835 () Bool)

(assert (=> b!50776 (= e!32835 tp_is_empty!2193)))

(declare-fun mapNonEmpty!2228 () Bool)

(declare-fun tp!6746 () Bool)

(assert (=> mapNonEmpty!2228 (= mapRes!2228 (and tp!6746 e!32835))))

(declare-fun mapRest!2228 () (Array (_ BitVec 32) ValueCell!753))

(declare-fun mapKey!2228 () (_ BitVec 32))

(declare-fun mapValue!2228 () ValueCell!753)

(assert (=> mapNonEmpty!2228 (= mapRest!2226 (store mapRest!2228 mapKey!2228 mapValue!2228))))

(assert (= (and mapNonEmpty!2226 condMapEmpty!2228) mapIsEmpty!2228))

(assert (= (and mapNonEmpty!2226 (not condMapEmpty!2228)) mapNonEmpty!2228))

(assert (= (and mapNonEmpty!2228 ((_ is ValueCellFull!753) mapValue!2228)) b!50776))

(assert (= (and mapNonEmpty!2226 ((_ is ValueCellFull!753) mapDefault!2228)) b!50777))

(declare-fun m!43945 () Bool)

(assert (=> mapNonEmpty!2228 m!43945))

(check-sat (not d!10239) b_and!2765 (not b!50723) (not bm!3911) (not b!50744) (not b!50753) (not mapNonEmpty!2228) (not b!50750) (not d!10223) (not bm!3912) (not d!10231) (not bm!3909) (not b!50748) (not bm!3908) (not b!50768) (not b!50743) (not b!50740) tp_is_empty!2193 (not b!50754) (not d!10227) (not b!50772) (not b_next!1555) (not b!50773) (not b!50756) (not b!50757) (not b!50747) b_and!2763 (not bm!3913) (not mapNonEmpty!2227) (not b!50717) (not b!50769) (not b!50764) (not b_next!1553) (not bm!3910))
(check-sat b_and!2763 b_and!2765 (not b_next!1553) (not b_next!1555))
