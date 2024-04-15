; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8094 () Bool)

(assert start!8094)

(declare-fun b!50879 () Bool)

(declare-fun b_free!1573 () Bool)

(declare-fun b_next!1573 () Bool)

(assert (=> b!50879 (= b_free!1573 (not b_next!1573))))

(declare-fun tp!6794 () Bool)

(declare-fun b_and!2785 () Bool)

(assert (=> b!50879 (= tp!6794 b_and!2785)))

(declare-fun b!50878 () Bool)

(declare-fun b_free!1575 () Bool)

(declare-fun b_next!1575 () Bool)

(assert (=> b!50878 (= b_free!1575 (not b_next!1575))))

(declare-fun tp!6793 () Bool)

(declare-fun b_and!2787 () Bool)

(assert (=> b!50878 (= tp!6793 b_and!2787)))

(declare-fun mapIsEmpty!2251 () Bool)

(declare-fun mapRes!2251 () Bool)

(assert (=> mapIsEmpty!2251 mapRes!2251))

(declare-fun b!50877 () Bool)

(declare-fun e!32938 () Bool)

(declare-fun tp_is_empty!2203 () Bool)

(assert (=> b!50877 (= e!32938 tp_is_empty!2203)))

(declare-fun e!32942 () Bool)

(declare-datatypes ((V!2585 0))(
  ( (V!2586 (val!1146 Int)) )
))
(declare-datatypes ((array!3301 0))(
  ( (array!3302 (arr!1576 (Array (_ BitVec 32) (_ BitVec 64))) (size!1802 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!758 0))(
  ( (ValueCellFull!758 (v!2177 V!2585)) (EmptyCell!758) )
))
(declare-datatypes ((array!3303 0))(
  ( (array!3304 (arr!1577 (Array (_ BitVec 32) ValueCell!758)) (size!1803 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!424 0))(
  ( (LongMapFixedSize!425 (defaultEntry!1926 Int) (mask!5724 (_ BitVec 32)) (extraKeys!1817 (_ BitVec 32)) (zeroValue!1844 V!2585) (minValue!1844 V!2585) (_size!261 (_ BitVec 32)) (_keys!3537 array!3301) (_values!1909 array!3303) (_vacant!261 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!424)

(declare-fun e!32949 () Bool)

(declare-fun array_inv!963 (array!3301) Bool)

(declare-fun array_inv!964 (array!3303) Bool)

(assert (=> b!50878 (= e!32942 (and tp!6793 tp_is_empty!2203 (array_inv!963 (_keys!3537 newMap!16)) (array_inv!964 (_values!1909 newMap!16)) e!32949))))

(declare-fun b!50880 () Bool)

(declare-fun e!32947 () Bool)

(declare-fun e!32939 () Bool)

(assert (=> b!50880 (= e!32947 e!32939)))

(declare-fun b!50881 () Bool)

(declare-fun res!29212 () Bool)

(declare-fun e!32940 () Bool)

(assert (=> b!50881 (=> (not res!29212) (not e!32940))))

(declare-fun valid!153 (LongMapFixedSize!424) Bool)

(assert (=> b!50881 (= res!29212 (valid!153 newMap!16))))

(declare-fun b!50882 () Bool)

(declare-fun e!32937 () Bool)

(declare-fun e!32941 () Bool)

(assert (=> b!50882 (= e!32937 (and e!32941 mapRes!2251))))

(declare-fun condMapEmpty!2251 () Bool)

(declare-datatypes ((Cell!248 0))(
  ( (Cell!249 (v!2178 LongMapFixedSize!424)) )
))
(declare-datatypes ((LongMap!248 0))(
  ( (LongMap!249 (underlying!135 Cell!248)) )
))
(declare-fun thiss!992 () LongMap!248)

(declare-fun mapDefault!2252 () ValueCell!758)

(assert (=> b!50882 (= condMapEmpty!2251 (= (arr!1577 (_values!1909 (v!2178 (underlying!135 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!758)) mapDefault!2252)))))

(declare-fun b!50883 () Bool)

(declare-fun e!32945 () Bool)

(assert (=> b!50883 (= e!32945 tp_is_empty!2203)))

(declare-fun b!50884 () Bool)

(declare-fun res!29211 () Bool)

(assert (=> b!50884 (=> (not res!29211) (not e!32940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!50884 (= res!29211 (validMask!0 (mask!5724 (v!2178 (underlying!135 thiss!992)))))))

(declare-fun mapNonEmpty!2251 () Bool)

(declare-fun tp!6791 () Bool)

(assert (=> mapNonEmpty!2251 (= mapRes!2251 (and tp!6791 e!32938))))

(declare-fun mapValue!2252 () ValueCell!758)

(declare-fun mapRest!2251 () (Array (_ BitVec 32) ValueCell!758))

(declare-fun mapKey!2251 () (_ BitVec 32))

(assert (=> mapNonEmpty!2251 (= (arr!1577 (_values!1909 (v!2178 (underlying!135 thiss!992)))) (store mapRest!2251 mapKey!2251 mapValue!2252))))

(declare-fun b!50885 () Bool)

(declare-fun e!32943 () Bool)

(assert (=> b!50885 (= e!32943 e!32947)))

(declare-fun b!50886 () Bool)

(declare-fun mapRes!2252 () Bool)

(assert (=> b!50886 (= e!32949 (and e!32945 mapRes!2252))))

(declare-fun condMapEmpty!2252 () Bool)

(declare-fun mapDefault!2251 () ValueCell!758)

(assert (=> b!50886 (= condMapEmpty!2252 (= (arr!1577 (_values!1909 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!758)) mapDefault!2251)))))

(declare-fun res!29210 () Bool)

(assert (=> start!8094 (=> (not res!29210) (not e!32940))))

(declare-fun valid!154 (LongMap!248) Bool)

(assert (=> start!8094 (= res!29210 (valid!154 thiss!992))))

(assert (=> start!8094 e!32940))

(assert (=> start!8094 e!32943))

(assert (=> start!8094 true))

(assert (=> start!8094 e!32942))

(assert (=> b!50879 (= e!32939 (and tp!6794 tp_is_empty!2203 (array_inv!963 (_keys!3537 (v!2178 (underlying!135 thiss!992)))) (array_inv!964 (_values!1909 (v!2178 (underlying!135 thiss!992)))) e!32937))))

(declare-fun b!50887 () Bool)

(declare-fun e!32946 () Bool)

(assert (=> b!50887 (= e!32946 tp_is_empty!2203)))

(declare-fun mapNonEmpty!2252 () Bool)

(declare-fun tp!6792 () Bool)

(assert (=> mapNonEmpty!2252 (= mapRes!2252 (and tp!6792 e!32946))))

(declare-fun mapRest!2252 () (Array (_ BitVec 32) ValueCell!758))

(declare-fun mapKey!2252 () (_ BitVec 32))

(declare-fun mapValue!2251 () ValueCell!758)

(assert (=> mapNonEmpty!2252 (= (arr!1577 (_values!1909 newMap!16)) (store mapRest!2252 mapKey!2252 mapValue!2251))))

(declare-fun b!50888 () Bool)

(assert (=> b!50888 (= e!32941 tp_is_empty!2203)))

(declare-fun b!50889 () Bool)

(assert (=> b!50889 (= e!32940 (and (= (size!1803 (_values!1909 (v!2178 (underlying!135 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5724 (v!2178 (underlying!135 thiss!992))))) (= (size!1802 (_keys!3537 (v!2178 (underlying!135 thiss!992)))) (size!1803 (_values!1909 (v!2178 (underlying!135 thiss!992))))) (bvsge (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!1817 (v!2178 (underlying!135 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!50890 () Bool)

(declare-fun res!29214 () Bool)

(assert (=> b!50890 (=> (not res!29214) (not e!32940))))

(assert (=> b!50890 (= res!29214 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5724 newMap!16)) (_size!261 (v!2178 (underlying!135 thiss!992)))))))

(declare-fun b!50891 () Bool)

(declare-fun res!29213 () Bool)

(assert (=> b!50891 (=> (not res!29213) (not e!32940))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!50891 (= res!29213 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1802 (_keys!3537 (v!2178 (underlying!135 thiss!992)))))))))

(declare-fun mapIsEmpty!2252 () Bool)

(assert (=> mapIsEmpty!2252 mapRes!2252))

(assert (= (and start!8094 res!29210) b!50891))

(assert (= (and b!50891 res!29213) b!50881))

(assert (= (and b!50881 res!29212) b!50890))

(assert (= (and b!50890 res!29214) b!50884))

(assert (= (and b!50884 res!29211) b!50889))

(assert (= (and b!50882 condMapEmpty!2251) mapIsEmpty!2251))

(assert (= (and b!50882 (not condMapEmpty!2251)) mapNonEmpty!2251))

(get-info :version)

(assert (= (and mapNonEmpty!2251 ((_ is ValueCellFull!758) mapValue!2252)) b!50877))

(assert (= (and b!50882 ((_ is ValueCellFull!758) mapDefault!2252)) b!50888))

(assert (= b!50879 b!50882))

(assert (= b!50880 b!50879))

(assert (= b!50885 b!50880))

(assert (= start!8094 b!50885))

(assert (= (and b!50886 condMapEmpty!2252) mapIsEmpty!2252))

(assert (= (and b!50886 (not condMapEmpty!2252)) mapNonEmpty!2252))

(assert (= (and mapNonEmpty!2252 ((_ is ValueCellFull!758) mapValue!2251)) b!50887))

(assert (= (and b!50886 ((_ is ValueCellFull!758) mapDefault!2251)) b!50883))

(assert (= b!50878 b!50886))

(assert (= start!8094 b!50878))

(declare-fun m!43919 () Bool)

(assert (=> start!8094 m!43919))

(declare-fun m!43921 () Bool)

(assert (=> b!50879 m!43921))

(declare-fun m!43923 () Bool)

(assert (=> b!50879 m!43923))

(declare-fun m!43925 () Bool)

(assert (=> b!50881 m!43925))

(declare-fun m!43927 () Bool)

(assert (=> b!50884 m!43927))

(declare-fun m!43929 () Bool)

(assert (=> b!50878 m!43929))

(declare-fun m!43931 () Bool)

(assert (=> b!50878 m!43931))

(declare-fun m!43933 () Bool)

(assert (=> mapNonEmpty!2252 m!43933))

(declare-fun m!43935 () Bool)

(assert (=> mapNonEmpty!2251 m!43935))

(check-sat (not b!50879) tp_is_empty!2203 b_and!2785 (not start!8094) (not b!50881) (not mapNonEmpty!2251) (not b_next!1573) (not b!50884) (not b!50878) b_and!2787 (not b_next!1575) (not mapNonEmpty!2252))
(check-sat b_and!2785 b_and!2787 (not b_next!1573) (not b_next!1575))
(get-model)

(declare-fun d!10227 () Bool)

(assert (=> d!10227 (= (valid!154 thiss!992) (valid!153 (v!2178 (underlying!135 thiss!992))))))

(declare-fun bs!2370 () Bool)

(assert (= bs!2370 d!10227))

(declare-fun m!43973 () Bool)

(assert (=> bs!2370 m!43973))

(assert (=> start!8094 d!10227))

(declare-fun d!10229 () Bool)

(declare-fun res!29251 () Bool)

(declare-fun e!33030 () Bool)

(assert (=> d!10229 (=> (not res!29251) (not e!33030))))

(declare-fun simpleValid!36 (LongMapFixedSize!424) Bool)

(assert (=> d!10229 (= res!29251 (simpleValid!36 newMap!16))))

(assert (=> d!10229 (= (valid!153 newMap!16) e!33030)))

(declare-fun b!50988 () Bool)

(declare-fun res!29252 () Bool)

(assert (=> b!50988 (=> (not res!29252) (not e!33030))))

(declare-fun arrayCountValidKeys!0 (array!3301 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!50988 (= res!29252 (= (arrayCountValidKeys!0 (_keys!3537 newMap!16) #b00000000000000000000000000000000 (size!1802 (_keys!3537 newMap!16))) (_size!261 newMap!16)))))

(declare-fun b!50989 () Bool)

(declare-fun res!29253 () Bool)

(assert (=> b!50989 (=> (not res!29253) (not e!33030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3301 (_ BitVec 32)) Bool)

(assert (=> b!50989 (= res!29253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3537 newMap!16) (mask!5724 newMap!16)))))

(declare-fun b!50990 () Bool)

(declare-datatypes ((List!1327 0))(
  ( (Nil!1324) (Cons!1323 (h!1903 (_ BitVec 64)) (t!4360 List!1327)) )
))
(declare-fun arrayNoDuplicates!0 (array!3301 (_ BitVec 32) List!1327) Bool)

(assert (=> b!50990 (= e!33030 (arrayNoDuplicates!0 (_keys!3537 newMap!16) #b00000000000000000000000000000000 Nil!1324))))

(assert (= (and d!10229 res!29251) b!50988))

(assert (= (and b!50988 res!29252) b!50989))

(assert (= (and b!50989 res!29253) b!50990))

(declare-fun m!43975 () Bool)

(assert (=> d!10229 m!43975))

(declare-fun m!43977 () Bool)

(assert (=> b!50988 m!43977))

(declare-fun m!43979 () Bool)

(assert (=> b!50989 m!43979))

(declare-fun m!43981 () Bool)

(assert (=> b!50990 m!43981))

(assert (=> b!50881 d!10229))

(declare-fun d!10231 () Bool)

(assert (=> d!10231 (= (array_inv!963 (_keys!3537 (v!2178 (underlying!135 thiss!992)))) (bvsge (size!1802 (_keys!3537 (v!2178 (underlying!135 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!50879 d!10231))

(declare-fun d!10233 () Bool)

(assert (=> d!10233 (= (array_inv!964 (_values!1909 (v!2178 (underlying!135 thiss!992)))) (bvsge (size!1803 (_values!1909 (v!2178 (underlying!135 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!50879 d!10233))

(declare-fun d!10235 () Bool)

(assert (=> d!10235 (= (validMask!0 (mask!5724 (v!2178 (underlying!135 thiss!992)))) (and (or (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000000000000000000000000111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000000000000000000000001111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000000000000000000000011111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000000000000000000000111111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000000000000000000001111111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000000000000000000011111111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000000000000000000111111111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000000000000000001111111111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000000000000000011111111111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000000000000000111111111111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000000000000001111111111111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000000000000011111111111111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000000000000111111111111111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000000000001111111111111111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000000000011111111111111111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000000000111111111111111111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000000001111111111111111111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000000011111111111111111111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000000111111111111111111111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000001111111111111111111111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000011111111111111111111111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000111111111111111111111111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000001111111111111111111111111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000011111111111111111111111111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000111111111111111111111111111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00001111111111111111111111111111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00011111111111111111111111111111) (= (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!50884 d!10235))

(declare-fun d!10237 () Bool)

(assert (=> d!10237 (= (array_inv!963 (_keys!3537 newMap!16)) (bvsge (size!1802 (_keys!3537 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!50878 d!10237))

(declare-fun d!10239 () Bool)

(assert (=> d!10239 (= (array_inv!964 (_values!1909 newMap!16)) (bvsge (size!1803 (_values!1909 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!50878 d!10239))

(declare-fun b!50997 () Bool)

(declare-fun e!33035 () Bool)

(assert (=> b!50997 (= e!33035 tp_is_empty!2203)))

(declare-fun condMapEmpty!2267 () Bool)

(declare-fun mapDefault!2267 () ValueCell!758)

(assert (=> mapNonEmpty!2251 (= condMapEmpty!2267 (= mapRest!2251 ((as const (Array (_ BitVec 32) ValueCell!758)) mapDefault!2267)))))

(declare-fun e!33036 () Bool)

(declare-fun mapRes!2267 () Bool)

(assert (=> mapNonEmpty!2251 (= tp!6791 (and e!33036 mapRes!2267))))

(declare-fun mapIsEmpty!2267 () Bool)

(assert (=> mapIsEmpty!2267 mapRes!2267))

(declare-fun b!50998 () Bool)

(assert (=> b!50998 (= e!33036 tp_is_empty!2203)))

(declare-fun mapNonEmpty!2267 () Bool)

(declare-fun tp!6821 () Bool)

(assert (=> mapNonEmpty!2267 (= mapRes!2267 (and tp!6821 e!33035))))

(declare-fun mapValue!2267 () ValueCell!758)

(declare-fun mapKey!2267 () (_ BitVec 32))

(declare-fun mapRest!2267 () (Array (_ BitVec 32) ValueCell!758))

(assert (=> mapNonEmpty!2267 (= mapRest!2251 (store mapRest!2267 mapKey!2267 mapValue!2267))))

(assert (= (and mapNonEmpty!2251 condMapEmpty!2267) mapIsEmpty!2267))

(assert (= (and mapNonEmpty!2251 (not condMapEmpty!2267)) mapNonEmpty!2267))

(assert (= (and mapNonEmpty!2267 ((_ is ValueCellFull!758) mapValue!2267)) b!50997))

(assert (= (and mapNonEmpty!2251 ((_ is ValueCellFull!758) mapDefault!2267)) b!50998))

(declare-fun m!43983 () Bool)

(assert (=> mapNonEmpty!2267 m!43983))

(declare-fun b!50999 () Bool)

(declare-fun e!33037 () Bool)

(assert (=> b!50999 (= e!33037 tp_is_empty!2203)))

(declare-fun condMapEmpty!2268 () Bool)

(declare-fun mapDefault!2268 () ValueCell!758)

(assert (=> mapNonEmpty!2252 (= condMapEmpty!2268 (= mapRest!2252 ((as const (Array (_ BitVec 32) ValueCell!758)) mapDefault!2268)))))

(declare-fun e!33038 () Bool)

(declare-fun mapRes!2268 () Bool)

(assert (=> mapNonEmpty!2252 (= tp!6792 (and e!33038 mapRes!2268))))

(declare-fun mapIsEmpty!2268 () Bool)

(assert (=> mapIsEmpty!2268 mapRes!2268))

(declare-fun b!51000 () Bool)

(assert (=> b!51000 (= e!33038 tp_is_empty!2203)))

(declare-fun mapNonEmpty!2268 () Bool)

(declare-fun tp!6822 () Bool)

(assert (=> mapNonEmpty!2268 (= mapRes!2268 (and tp!6822 e!33037))))

(declare-fun mapRest!2268 () (Array (_ BitVec 32) ValueCell!758))

(declare-fun mapValue!2268 () ValueCell!758)

(declare-fun mapKey!2268 () (_ BitVec 32))

(assert (=> mapNonEmpty!2268 (= mapRest!2252 (store mapRest!2268 mapKey!2268 mapValue!2268))))

(assert (= (and mapNonEmpty!2252 condMapEmpty!2268) mapIsEmpty!2268))

(assert (= (and mapNonEmpty!2252 (not condMapEmpty!2268)) mapNonEmpty!2268))

(assert (= (and mapNonEmpty!2268 ((_ is ValueCellFull!758) mapValue!2268)) b!50999))

(assert (= (and mapNonEmpty!2252 ((_ is ValueCellFull!758) mapDefault!2268)) b!51000))

(declare-fun m!43985 () Bool)

(assert (=> mapNonEmpty!2268 m!43985))

(check-sat tp_is_empty!2203 b_and!2785 (not mapNonEmpty!2268) (not b_next!1573) (not b!50990) (not b!50989) (not b_next!1575) (not d!10227) (not d!10229) b_and!2787 (not b!50988) (not mapNonEmpty!2267))
(check-sat b_and!2785 b_and!2787 (not b_next!1573) (not b_next!1575))
(get-model)

(declare-fun bm!3915 () Bool)

(declare-fun call!3918 () Bool)

(declare-fun c!6826 () Bool)

(assert (=> bm!3915 (= call!3918 (arrayNoDuplicates!0 (_keys!3537 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6826 (Cons!1323 (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000) Nil!1324) Nil!1324)))))

(declare-fun b!51011 () Bool)

(declare-fun e!33048 () Bool)

(declare-fun contains!617 (List!1327 (_ BitVec 64)) Bool)

(assert (=> b!51011 (= e!33048 (contains!617 Nil!1324 (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!10241 () Bool)

(declare-fun res!29262 () Bool)

(declare-fun e!33049 () Bool)

(assert (=> d!10241 (=> res!29262 e!33049)))

(assert (=> d!10241 (= res!29262 (bvsge #b00000000000000000000000000000000 (size!1802 (_keys!3537 newMap!16))))))

(assert (=> d!10241 (= (arrayNoDuplicates!0 (_keys!3537 newMap!16) #b00000000000000000000000000000000 Nil!1324) e!33049)))

(declare-fun b!51012 () Bool)

(declare-fun e!33047 () Bool)

(assert (=> b!51012 (= e!33049 e!33047)))

(declare-fun res!29261 () Bool)

(assert (=> b!51012 (=> (not res!29261) (not e!33047))))

(assert (=> b!51012 (= res!29261 (not e!33048))))

(declare-fun res!29260 () Bool)

(assert (=> b!51012 (=> (not res!29260) (not e!33048))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!51012 (= res!29260 (validKeyInArray!0 (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51013 () Bool)

(declare-fun e!33050 () Bool)

(assert (=> b!51013 (= e!33050 call!3918)))

(declare-fun b!51014 () Bool)

(assert (=> b!51014 (= e!33047 e!33050)))

(assert (=> b!51014 (= c!6826 (validKeyInArray!0 (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51015 () Bool)

(assert (=> b!51015 (= e!33050 call!3918)))

(assert (= (and d!10241 (not res!29262)) b!51012))

(assert (= (and b!51012 res!29260) b!51011))

(assert (= (and b!51012 res!29261) b!51014))

(assert (= (and b!51014 c!6826) b!51015))

(assert (= (and b!51014 (not c!6826)) b!51013))

(assert (= (or b!51015 b!51013) bm!3915))

(declare-fun m!43987 () Bool)

(assert (=> bm!3915 m!43987))

(declare-fun m!43989 () Bool)

(assert (=> bm!3915 m!43989))

(assert (=> b!51011 m!43987))

(assert (=> b!51011 m!43987))

(declare-fun m!43991 () Bool)

(assert (=> b!51011 m!43991))

(assert (=> b!51012 m!43987))

(assert (=> b!51012 m!43987))

(declare-fun m!43993 () Bool)

(assert (=> b!51012 m!43993))

(assert (=> b!51014 m!43987))

(assert (=> b!51014 m!43987))

(assert (=> b!51014 m!43993))

(assert (=> b!50990 d!10241))

(declare-fun d!10243 () Bool)

(declare-fun res!29263 () Bool)

(declare-fun e!33051 () Bool)

(assert (=> d!10243 (=> (not res!29263) (not e!33051))))

(assert (=> d!10243 (= res!29263 (simpleValid!36 (v!2178 (underlying!135 thiss!992))))))

(assert (=> d!10243 (= (valid!153 (v!2178 (underlying!135 thiss!992))) e!33051)))

(declare-fun b!51016 () Bool)

(declare-fun res!29264 () Bool)

(assert (=> b!51016 (=> (not res!29264) (not e!33051))))

(assert (=> b!51016 (= res!29264 (= (arrayCountValidKeys!0 (_keys!3537 (v!2178 (underlying!135 thiss!992))) #b00000000000000000000000000000000 (size!1802 (_keys!3537 (v!2178 (underlying!135 thiss!992))))) (_size!261 (v!2178 (underlying!135 thiss!992)))))))

(declare-fun b!51017 () Bool)

(declare-fun res!29265 () Bool)

(assert (=> b!51017 (=> (not res!29265) (not e!33051))))

(assert (=> b!51017 (= res!29265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3537 (v!2178 (underlying!135 thiss!992))) (mask!5724 (v!2178 (underlying!135 thiss!992)))))))

(declare-fun b!51018 () Bool)

(assert (=> b!51018 (= e!33051 (arrayNoDuplicates!0 (_keys!3537 (v!2178 (underlying!135 thiss!992))) #b00000000000000000000000000000000 Nil!1324))))

(assert (= (and d!10243 res!29263) b!51016))

(assert (= (and b!51016 res!29264) b!51017))

(assert (= (and b!51017 res!29265) b!51018))

(declare-fun m!43995 () Bool)

(assert (=> d!10243 m!43995))

(declare-fun m!43997 () Bool)

(assert (=> b!51016 m!43997))

(declare-fun m!43999 () Bool)

(assert (=> b!51017 m!43999))

(declare-fun m!44001 () Bool)

(assert (=> b!51018 m!44001))

(assert (=> d!10227 d!10243))

(declare-fun b!51027 () Bool)

(declare-fun e!33059 () Bool)

(declare-fun call!3921 () Bool)

(assert (=> b!51027 (= e!33059 call!3921)))

(declare-fun b!51028 () Bool)

(declare-fun e!33060 () Bool)

(assert (=> b!51028 (= e!33060 call!3921)))

(declare-fun d!10245 () Bool)

(declare-fun res!29271 () Bool)

(declare-fun e!33058 () Bool)

(assert (=> d!10245 (=> res!29271 e!33058)))

(assert (=> d!10245 (= res!29271 (bvsge #b00000000000000000000000000000000 (size!1802 (_keys!3537 newMap!16))))))

(assert (=> d!10245 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3537 newMap!16) (mask!5724 newMap!16)) e!33058)))

(declare-fun b!51029 () Bool)

(assert (=> b!51029 (= e!33059 e!33060)))

(declare-fun lt!21107 () (_ BitVec 64))

(assert (=> b!51029 (= lt!21107 (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1428 0))(
  ( (Unit!1429) )
))
(declare-fun lt!21109 () Unit!1428)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3301 (_ BitVec 64) (_ BitVec 32)) Unit!1428)

(assert (=> b!51029 (= lt!21109 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3537 newMap!16) lt!21107 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!51029 (arrayContainsKey!0 (_keys!3537 newMap!16) lt!21107 #b00000000000000000000000000000000)))

(declare-fun lt!21108 () Unit!1428)

(assert (=> b!51029 (= lt!21108 lt!21109)))

(declare-fun res!29270 () Bool)

(declare-datatypes ((SeekEntryResult!224 0))(
  ( (MissingZero!224 (index!3018 (_ BitVec 32))) (Found!224 (index!3019 (_ BitVec 32))) (Intermediate!224 (undefined!1036 Bool) (index!3020 (_ BitVec 32)) (x!9309 (_ BitVec 32))) (Undefined!224) (MissingVacant!224 (index!3021 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3301 (_ BitVec 32)) SeekEntryResult!224)

(assert (=> b!51029 (= res!29270 (= (seekEntryOrOpen!0 (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000) (_keys!3537 newMap!16) (mask!5724 newMap!16)) (Found!224 #b00000000000000000000000000000000)))))

(assert (=> b!51029 (=> (not res!29270) (not e!33060))))

(declare-fun bm!3918 () Bool)

(assert (=> bm!3918 (= call!3921 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3537 newMap!16) (mask!5724 newMap!16)))))

(declare-fun b!51030 () Bool)

(assert (=> b!51030 (= e!33058 e!33059)))

(declare-fun c!6829 () Bool)

(assert (=> b!51030 (= c!6829 (validKeyInArray!0 (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10245 (not res!29271)) b!51030))

(assert (= (and b!51030 c!6829) b!51029))

(assert (= (and b!51030 (not c!6829)) b!51027))

(assert (= (and b!51029 res!29270) b!51028))

(assert (= (or b!51028 b!51027) bm!3918))

(assert (=> b!51029 m!43987))

(declare-fun m!44003 () Bool)

(assert (=> b!51029 m!44003))

(declare-fun m!44005 () Bool)

(assert (=> b!51029 m!44005))

(assert (=> b!51029 m!43987))

(declare-fun m!44007 () Bool)

(assert (=> b!51029 m!44007))

(declare-fun m!44009 () Bool)

(assert (=> bm!3918 m!44009))

(assert (=> b!51030 m!43987))

(assert (=> b!51030 m!43987))

(assert (=> b!51030 m!43993))

(assert (=> b!50989 d!10245))

(declare-fun b!51039 () Bool)

(declare-fun e!33065 () (_ BitVec 32))

(declare-fun call!3924 () (_ BitVec 32))

(assert (=> b!51039 (= e!33065 call!3924)))

(declare-fun b!51040 () Bool)

(assert (=> b!51040 (= e!33065 (bvadd #b00000000000000000000000000000001 call!3924))))

(declare-fun b!51041 () Bool)

(declare-fun e!33066 () (_ BitVec 32))

(assert (=> b!51041 (= e!33066 e!33065)))

(declare-fun c!6835 () Bool)

(assert (=> b!51041 (= c!6835 (validKeyInArray!0 (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!10247 () Bool)

(declare-fun lt!21112 () (_ BitVec 32))

(assert (=> d!10247 (and (bvsge lt!21112 #b00000000000000000000000000000000) (bvsle lt!21112 (bvsub (size!1802 (_keys!3537 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!10247 (= lt!21112 e!33066)))

(declare-fun c!6834 () Bool)

(assert (=> d!10247 (= c!6834 (bvsge #b00000000000000000000000000000000 (size!1802 (_keys!3537 newMap!16))))))

(assert (=> d!10247 (and (bvsle #b00000000000000000000000000000000 (size!1802 (_keys!3537 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1802 (_keys!3537 newMap!16)) (size!1802 (_keys!3537 newMap!16))))))

(assert (=> d!10247 (= (arrayCountValidKeys!0 (_keys!3537 newMap!16) #b00000000000000000000000000000000 (size!1802 (_keys!3537 newMap!16))) lt!21112)))

(declare-fun bm!3921 () Bool)

(assert (=> bm!3921 (= call!3924 (arrayCountValidKeys!0 (_keys!3537 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1802 (_keys!3537 newMap!16))))))

(declare-fun b!51042 () Bool)

(assert (=> b!51042 (= e!33066 #b00000000000000000000000000000000)))

(assert (= (and d!10247 c!6834) b!51042))

(assert (= (and d!10247 (not c!6834)) b!51041))

(assert (= (and b!51041 c!6835) b!51040))

(assert (= (and b!51041 (not c!6835)) b!51039))

(assert (= (or b!51040 b!51039) bm!3921))

(assert (=> b!51041 m!43987))

(assert (=> b!51041 m!43987))

(assert (=> b!51041 m!43993))

(declare-fun m!44011 () Bool)

(assert (=> bm!3921 m!44011))

(assert (=> b!50988 d!10247))

(declare-fun b!51051 () Bool)

(declare-fun res!29282 () Bool)

(declare-fun e!33069 () Bool)

(assert (=> b!51051 (=> (not res!29282) (not e!33069))))

(assert (=> b!51051 (= res!29282 (and (= (size!1803 (_values!1909 newMap!16)) (bvadd (mask!5724 newMap!16) #b00000000000000000000000000000001)) (= (size!1802 (_keys!3537 newMap!16)) (size!1803 (_values!1909 newMap!16))) (bvsge (_size!261 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!261 newMap!16) (bvadd (mask!5724 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!51052 () Bool)

(declare-fun res!29283 () Bool)

(assert (=> b!51052 (=> (not res!29283) (not e!33069))))

(declare-fun size!1808 (LongMapFixedSize!424) (_ BitVec 32))

(assert (=> b!51052 (= res!29283 (bvsge (size!1808 newMap!16) (_size!261 newMap!16)))))

(declare-fun b!51054 () Bool)

(assert (=> b!51054 (= e!33069 (and (bvsge (extraKeys!1817 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1817 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!261 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun d!10249 () Bool)

(declare-fun res!29281 () Bool)

(assert (=> d!10249 (=> (not res!29281) (not e!33069))))

(assert (=> d!10249 (= res!29281 (validMask!0 (mask!5724 newMap!16)))))

(assert (=> d!10249 (= (simpleValid!36 newMap!16) e!33069)))

(declare-fun b!51053 () Bool)

(declare-fun res!29280 () Bool)

(assert (=> b!51053 (=> (not res!29280) (not e!33069))))

(assert (=> b!51053 (= res!29280 (= (size!1808 newMap!16) (bvadd (_size!261 newMap!16) (bvsdiv (bvadd (extraKeys!1817 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!10249 res!29281) b!51051))

(assert (= (and b!51051 res!29282) b!51052))

(assert (= (and b!51052 res!29283) b!51053))

(assert (= (and b!51053 res!29280) b!51054))

(declare-fun m!44013 () Bool)

(assert (=> b!51052 m!44013))

(declare-fun m!44015 () Bool)

(assert (=> d!10249 m!44015))

(assert (=> b!51053 m!44013))

(assert (=> d!10229 d!10249))

(declare-fun b!51055 () Bool)

(declare-fun e!33070 () Bool)

(assert (=> b!51055 (= e!33070 tp_is_empty!2203)))

(declare-fun condMapEmpty!2269 () Bool)

(declare-fun mapDefault!2269 () ValueCell!758)

(assert (=> mapNonEmpty!2268 (= condMapEmpty!2269 (= mapRest!2268 ((as const (Array (_ BitVec 32) ValueCell!758)) mapDefault!2269)))))

(declare-fun e!33071 () Bool)

(declare-fun mapRes!2269 () Bool)

(assert (=> mapNonEmpty!2268 (= tp!6822 (and e!33071 mapRes!2269))))

(declare-fun mapIsEmpty!2269 () Bool)

(assert (=> mapIsEmpty!2269 mapRes!2269))

(declare-fun b!51056 () Bool)

(assert (=> b!51056 (= e!33071 tp_is_empty!2203)))

(declare-fun mapNonEmpty!2269 () Bool)

(declare-fun tp!6823 () Bool)

(assert (=> mapNonEmpty!2269 (= mapRes!2269 (and tp!6823 e!33070))))

(declare-fun mapValue!2269 () ValueCell!758)

(declare-fun mapRest!2269 () (Array (_ BitVec 32) ValueCell!758))

(declare-fun mapKey!2269 () (_ BitVec 32))

(assert (=> mapNonEmpty!2269 (= mapRest!2268 (store mapRest!2269 mapKey!2269 mapValue!2269))))

(assert (= (and mapNonEmpty!2268 condMapEmpty!2269) mapIsEmpty!2269))

(assert (= (and mapNonEmpty!2268 (not condMapEmpty!2269)) mapNonEmpty!2269))

(assert (= (and mapNonEmpty!2269 ((_ is ValueCellFull!758) mapValue!2269)) b!51055))

(assert (= (and mapNonEmpty!2268 ((_ is ValueCellFull!758) mapDefault!2269)) b!51056))

(declare-fun m!44017 () Bool)

(assert (=> mapNonEmpty!2269 m!44017))

(declare-fun b!51057 () Bool)

(declare-fun e!33072 () Bool)

(assert (=> b!51057 (= e!33072 tp_is_empty!2203)))

(declare-fun condMapEmpty!2270 () Bool)

(declare-fun mapDefault!2270 () ValueCell!758)

(assert (=> mapNonEmpty!2267 (= condMapEmpty!2270 (= mapRest!2267 ((as const (Array (_ BitVec 32) ValueCell!758)) mapDefault!2270)))))

(declare-fun e!33073 () Bool)

(declare-fun mapRes!2270 () Bool)

(assert (=> mapNonEmpty!2267 (= tp!6821 (and e!33073 mapRes!2270))))

(declare-fun mapIsEmpty!2270 () Bool)

(assert (=> mapIsEmpty!2270 mapRes!2270))

(declare-fun b!51058 () Bool)

(assert (=> b!51058 (= e!33073 tp_is_empty!2203)))

(declare-fun mapNonEmpty!2270 () Bool)

(declare-fun tp!6824 () Bool)

(assert (=> mapNonEmpty!2270 (= mapRes!2270 (and tp!6824 e!33072))))

(declare-fun mapKey!2270 () (_ BitVec 32))

(declare-fun mapRest!2270 () (Array (_ BitVec 32) ValueCell!758))

(declare-fun mapValue!2270 () ValueCell!758)

(assert (=> mapNonEmpty!2270 (= mapRest!2267 (store mapRest!2270 mapKey!2270 mapValue!2270))))

(assert (= (and mapNonEmpty!2267 condMapEmpty!2270) mapIsEmpty!2270))

(assert (= (and mapNonEmpty!2267 (not condMapEmpty!2270)) mapNonEmpty!2270))

(assert (= (and mapNonEmpty!2270 ((_ is ValueCellFull!758) mapValue!2270)) b!51057))

(assert (= (and mapNonEmpty!2267 ((_ is ValueCellFull!758) mapDefault!2270)) b!51058))

(declare-fun m!44019 () Bool)

(assert (=> mapNonEmpty!2270 m!44019))

(check-sat tp_is_empty!2203 (not b!51053) (not b!51029) (not b!51014) (not b_next!1573) (not mapNonEmpty!2270) (not b!51011) (not bm!3915) (not b!51017) (not bm!3918) (not b!51041) (not b_next!1575) (not mapNonEmpty!2269) (not b!51052) (not b!51016) b_and!2787 (not b!51012) (not b!51030) (not b!51018) b_and!2785 (not d!10249) (not d!10243) (not bm!3921))
(check-sat b_and!2785 b_and!2787 (not b_next!1573) (not b_next!1575))
(get-model)

(declare-fun b!51059 () Bool)

(declare-fun e!33074 () (_ BitVec 32))

(declare-fun call!3925 () (_ BitVec 32))

(assert (=> b!51059 (= e!33074 call!3925)))

(declare-fun b!51060 () Bool)

(assert (=> b!51060 (= e!33074 (bvadd #b00000000000000000000000000000001 call!3925))))

(declare-fun b!51061 () Bool)

(declare-fun e!33075 () (_ BitVec 32))

(assert (=> b!51061 (= e!33075 e!33074)))

(declare-fun c!6837 () Bool)

(assert (=> b!51061 (= c!6837 (validKeyInArray!0 (select (arr!1576 (_keys!3537 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!10251 () Bool)

(declare-fun lt!21113 () (_ BitVec 32))

(assert (=> d!10251 (and (bvsge lt!21113 #b00000000000000000000000000000000) (bvsle lt!21113 (bvsub (size!1802 (_keys!3537 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!10251 (= lt!21113 e!33075)))

(declare-fun c!6836 () Bool)

(assert (=> d!10251 (= c!6836 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1802 (_keys!3537 newMap!16))))))

(assert (=> d!10251 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1802 (_keys!3537 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1802 (_keys!3537 newMap!16)) (size!1802 (_keys!3537 newMap!16))))))

(assert (=> d!10251 (= (arrayCountValidKeys!0 (_keys!3537 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1802 (_keys!3537 newMap!16))) lt!21113)))

(declare-fun bm!3922 () Bool)

(assert (=> bm!3922 (= call!3925 (arrayCountValidKeys!0 (_keys!3537 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1802 (_keys!3537 newMap!16))))))

(declare-fun b!51062 () Bool)

(assert (=> b!51062 (= e!33075 #b00000000000000000000000000000000)))

(assert (= (and d!10251 c!6836) b!51062))

(assert (= (and d!10251 (not c!6836)) b!51061))

(assert (= (and b!51061 c!6837) b!51060))

(assert (= (and b!51061 (not c!6837)) b!51059))

(assert (= (or b!51060 b!51059) bm!3922))

(declare-fun m!44021 () Bool)

(assert (=> b!51061 m!44021))

(assert (=> b!51061 m!44021))

(declare-fun m!44023 () Bool)

(assert (=> b!51061 m!44023))

(declare-fun m!44025 () Bool)

(assert (=> bm!3922 m!44025))

(assert (=> bm!3921 d!10251))

(declare-fun d!10253 () Bool)

(declare-fun lt!21116 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!58 (List!1327) (InoxSet (_ BitVec 64)))

(assert (=> d!10253 (= lt!21116 (select (content!58 Nil!1324) (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!33081 () Bool)

(assert (=> d!10253 (= lt!21116 e!33081)))

(declare-fun res!29288 () Bool)

(assert (=> d!10253 (=> (not res!29288) (not e!33081))))

(assert (=> d!10253 (= res!29288 ((_ is Cons!1323) Nil!1324))))

(assert (=> d!10253 (= (contains!617 Nil!1324 (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000)) lt!21116)))

(declare-fun b!51067 () Bool)

(declare-fun e!33080 () Bool)

(assert (=> b!51067 (= e!33081 e!33080)))

(declare-fun res!29289 () Bool)

(assert (=> b!51067 (=> res!29289 e!33080)))

(assert (=> b!51067 (= res!29289 (= (h!1903 Nil!1324) (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51068 () Bool)

(assert (=> b!51068 (= e!33080 (contains!617 (t!4360 Nil!1324) (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10253 res!29288) b!51067))

(assert (= (and b!51067 (not res!29289)) b!51068))

(declare-fun m!44027 () Bool)

(assert (=> d!10253 m!44027))

(assert (=> d!10253 m!43987))

(declare-fun m!44029 () Bool)

(assert (=> d!10253 m!44029))

(assert (=> b!51068 m!43987))

(declare-fun m!44031 () Bool)

(assert (=> b!51068 m!44031))

(assert (=> b!51011 d!10253))

(declare-fun d!10255 () Bool)

(assert (=> d!10255 (= (size!1808 newMap!16) (bvadd (_size!261 newMap!16) (bvsdiv (bvadd (extraKeys!1817 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!51052 d!10255))

(declare-fun d!10257 () Bool)

(assert (=> d!10257 (= (validKeyInArray!0 (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!51012 d!10257))

(assert (=> b!51041 d!10257))

(declare-fun c!6838 () Bool)

(declare-fun bm!3923 () Bool)

(declare-fun call!3926 () Bool)

(assert (=> bm!3923 (= call!3926 (arrayNoDuplicates!0 (_keys!3537 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!6838 (Cons!1323 (select (arr!1576 (_keys!3537 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!6826 (Cons!1323 (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000) Nil!1324) Nil!1324)) (ite c!6826 (Cons!1323 (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000) Nil!1324) Nil!1324))))))

(declare-fun b!51069 () Bool)

(declare-fun e!33083 () Bool)

(assert (=> b!51069 (= e!33083 (contains!617 (ite c!6826 (Cons!1323 (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000) Nil!1324) Nil!1324) (select (arr!1576 (_keys!3537 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!10259 () Bool)

(declare-fun res!29292 () Bool)

(declare-fun e!33084 () Bool)

(assert (=> d!10259 (=> res!29292 e!33084)))

(assert (=> d!10259 (= res!29292 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1802 (_keys!3537 newMap!16))))))

(assert (=> d!10259 (= (arrayNoDuplicates!0 (_keys!3537 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6826 (Cons!1323 (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000) Nil!1324) Nil!1324)) e!33084)))

(declare-fun b!51070 () Bool)

(declare-fun e!33082 () Bool)

(assert (=> b!51070 (= e!33084 e!33082)))

(declare-fun res!29291 () Bool)

(assert (=> b!51070 (=> (not res!29291) (not e!33082))))

(assert (=> b!51070 (= res!29291 (not e!33083))))

(declare-fun res!29290 () Bool)

(assert (=> b!51070 (=> (not res!29290) (not e!33083))))

(assert (=> b!51070 (= res!29290 (validKeyInArray!0 (select (arr!1576 (_keys!3537 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!51071 () Bool)

(declare-fun e!33085 () Bool)

(assert (=> b!51071 (= e!33085 call!3926)))

(declare-fun b!51072 () Bool)

(assert (=> b!51072 (= e!33082 e!33085)))

(assert (=> b!51072 (= c!6838 (validKeyInArray!0 (select (arr!1576 (_keys!3537 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!51073 () Bool)

(assert (=> b!51073 (= e!33085 call!3926)))

(assert (= (and d!10259 (not res!29292)) b!51070))

(assert (= (and b!51070 res!29290) b!51069))

(assert (= (and b!51070 res!29291) b!51072))

(assert (= (and b!51072 c!6838) b!51073))

(assert (= (and b!51072 (not c!6838)) b!51071))

(assert (= (or b!51073 b!51071) bm!3923))

(assert (=> bm!3923 m!44021))

(declare-fun m!44033 () Bool)

(assert (=> bm!3923 m!44033))

(assert (=> b!51069 m!44021))

(assert (=> b!51069 m!44021))

(declare-fun m!44035 () Bool)

(assert (=> b!51069 m!44035))

(assert (=> b!51070 m!44021))

(assert (=> b!51070 m!44021))

(assert (=> b!51070 m!44023))

(assert (=> b!51072 m!44021))

(assert (=> b!51072 m!44021))

(assert (=> b!51072 m!44023))

(assert (=> bm!3915 d!10259))

(declare-fun b!51074 () Bool)

(declare-fun e!33087 () Bool)

(declare-fun call!3927 () Bool)

(assert (=> b!51074 (= e!33087 call!3927)))

(declare-fun b!51075 () Bool)

(declare-fun e!33088 () Bool)

(assert (=> b!51075 (= e!33088 call!3927)))

(declare-fun d!10261 () Bool)

(declare-fun res!29294 () Bool)

(declare-fun e!33086 () Bool)

(assert (=> d!10261 (=> res!29294 e!33086)))

(assert (=> d!10261 (= res!29294 (bvsge #b00000000000000000000000000000000 (size!1802 (_keys!3537 (v!2178 (underlying!135 thiss!992))))))))

(assert (=> d!10261 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3537 (v!2178 (underlying!135 thiss!992))) (mask!5724 (v!2178 (underlying!135 thiss!992)))) e!33086)))

(declare-fun b!51076 () Bool)

(assert (=> b!51076 (= e!33087 e!33088)))

(declare-fun lt!21117 () (_ BitVec 64))

(assert (=> b!51076 (= lt!21117 (select (arr!1576 (_keys!3537 (v!2178 (underlying!135 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!21119 () Unit!1428)

(assert (=> b!51076 (= lt!21119 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3537 (v!2178 (underlying!135 thiss!992))) lt!21117 #b00000000000000000000000000000000))))

(assert (=> b!51076 (arrayContainsKey!0 (_keys!3537 (v!2178 (underlying!135 thiss!992))) lt!21117 #b00000000000000000000000000000000)))

(declare-fun lt!21118 () Unit!1428)

(assert (=> b!51076 (= lt!21118 lt!21119)))

(declare-fun res!29293 () Bool)

(assert (=> b!51076 (= res!29293 (= (seekEntryOrOpen!0 (select (arr!1576 (_keys!3537 (v!2178 (underlying!135 thiss!992)))) #b00000000000000000000000000000000) (_keys!3537 (v!2178 (underlying!135 thiss!992))) (mask!5724 (v!2178 (underlying!135 thiss!992)))) (Found!224 #b00000000000000000000000000000000)))))

(assert (=> b!51076 (=> (not res!29293) (not e!33088))))

(declare-fun bm!3924 () Bool)

(assert (=> bm!3924 (= call!3927 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3537 (v!2178 (underlying!135 thiss!992))) (mask!5724 (v!2178 (underlying!135 thiss!992)))))))

(declare-fun b!51077 () Bool)

(assert (=> b!51077 (= e!33086 e!33087)))

(declare-fun c!6839 () Bool)

(assert (=> b!51077 (= c!6839 (validKeyInArray!0 (select (arr!1576 (_keys!3537 (v!2178 (underlying!135 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!10261 (not res!29294)) b!51077))

(assert (= (and b!51077 c!6839) b!51076))

(assert (= (and b!51077 (not c!6839)) b!51074))

(assert (= (and b!51076 res!29293) b!51075))

(assert (= (or b!51075 b!51074) bm!3924))

(declare-fun m!44037 () Bool)

(assert (=> b!51076 m!44037))

(declare-fun m!44039 () Bool)

(assert (=> b!51076 m!44039))

(declare-fun m!44041 () Bool)

(assert (=> b!51076 m!44041))

(assert (=> b!51076 m!44037))

(declare-fun m!44043 () Bool)

(assert (=> b!51076 m!44043))

(declare-fun m!44045 () Bool)

(assert (=> bm!3924 m!44045))

(assert (=> b!51077 m!44037))

(assert (=> b!51077 m!44037))

(declare-fun m!44047 () Bool)

(assert (=> b!51077 m!44047))

(assert (=> b!51017 d!10261))

(declare-fun bm!3925 () Bool)

(declare-fun call!3928 () Bool)

(declare-fun c!6840 () Bool)

(assert (=> bm!3925 (= call!3928 (arrayNoDuplicates!0 (_keys!3537 (v!2178 (underlying!135 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6840 (Cons!1323 (select (arr!1576 (_keys!3537 (v!2178 (underlying!135 thiss!992)))) #b00000000000000000000000000000000) Nil!1324) Nil!1324)))))

(declare-fun b!51078 () Bool)

(declare-fun e!33090 () Bool)

(assert (=> b!51078 (= e!33090 (contains!617 Nil!1324 (select (arr!1576 (_keys!3537 (v!2178 (underlying!135 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!10263 () Bool)

(declare-fun res!29297 () Bool)

(declare-fun e!33091 () Bool)

(assert (=> d!10263 (=> res!29297 e!33091)))

(assert (=> d!10263 (= res!29297 (bvsge #b00000000000000000000000000000000 (size!1802 (_keys!3537 (v!2178 (underlying!135 thiss!992))))))))

(assert (=> d!10263 (= (arrayNoDuplicates!0 (_keys!3537 (v!2178 (underlying!135 thiss!992))) #b00000000000000000000000000000000 Nil!1324) e!33091)))

(declare-fun b!51079 () Bool)

(declare-fun e!33089 () Bool)

(assert (=> b!51079 (= e!33091 e!33089)))

(declare-fun res!29296 () Bool)

(assert (=> b!51079 (=> (not res!29296) (not e!33089))))

(assert (=> b!51079 (= res!29296 (not e!33090))))

(declare-fun res!29295 () Bool)

(assert (=> b!51079 (=> (not res!29295) (not e!33090))))

(assert (=> b!51079 (= res!29295 (validKeyInArray!0 (select (arr!1576 (_keys!3537 (v!2178 (underlying!135 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51080 () Bool)

(declare-fun e!33092 () Bool)

(assert (=> b!51080 (= e!33092 call!3928)))

(declare-fun b!51081 () Bool)

(assert (=> b!51081 (= e!33089 e!33092)))

(assert (=> b!51081 (= c!6840 (validKeyInArray!0 (select (arr!1576 (_keys!3537 (v!2178 (underlying!135 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51082 () Bool)

(assert (=> b!51082 (= e!33092 call!3928)))

(assert (= (and d!10263 (not res!29297)) b!51079))

(assert (= (and b!51079 res!29295) b!51078))

(assert (= (and b!51079 res!29296) b!51081))

(assert (= (and b!51081 c!6840) b!51082))

(assert (= (and b!51081 (not c!6840)) b!51080))

(assert (= (or b!51082 b!51080) bm!3925))

(assert (=> bm!3925 m!44037))

(declare-fun m!44049 () Bool)

(assert (=> bm!3925 m!44049))

(assert (=> b!51078 m!44037))

(assert (=> b!51078 m!44037))

(declare-fun m!44051 () Bool)

(assert (=> b!51078 m!44051))

(assert (=> b!51079 m!44037))

(assert (=> b!51079 m!44037))

(assert (=> b!51079 m!44047))

(assert (=> b!51081 m!44037))

(assert (=> b!51081 m!44037))

(assert (=> b!51081 m!44047))

(assert (=> b!51018 d!10263))

(declare-fun b!51083 () Bool)

(declare-fun e!33093 () (_ BitVec 32))

(declare-fun call!3929 () (_ BitVec 32))

(assert (=> b!51083 (= e!33093 call!3929)))

(declare-fun b!51084 () Bool)

(assert (=> b!51084 (= e!33093 (bvadd #b00000000000000000000000000000001 call!3929))))

(declare-fun b!51085 () Bool)

(declare-fun e!33094 () (_ BitVec 32))

(assert (=> b!51085 (= e!33094 e!33093)))

(declare-fun c!6842 () Bool)

(assert (=> b!51085 (= c!6842 (validKeyInArray!0 (select (arr!1576 (_keys!3537 (v!2178 (underlying!135 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!10265 () Bool)

(declare-fun lt!21120 () (_ BitVec 32))

(assert (=> d!10265 (and (bvsge lt!21120 #b00000000000000000000000000000000) (bvsle lt!21120 (bvsub (size!1802 (_keys!3537 (v!2178 (underlying!135 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!10265 (= lt!21120 e!33094)))

(declare-fun c!6841 () Bool)

(assert (=> d!10265 (= c!6841 (bvsge #b00000000000000000000000000000000 (size!1802 (_keys!3537 (v!2178 (underlying!135 thiss!992))))))))

(assert (=> d!10265 (and (bvsle #b00000000000000000000000000000000 (size!1802 (_keys!3537 (v!2178 (underlying!135 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1802 (_keys!3537 (v!2178 (underlying!135 thiss!992)))) (size!1802 (_keys!3537 (v!2178 (underlying!135 thiss!992))))))))

(assert (=> d!10265 (= (arrayCountValidKeys!0 (_keys!3537 (v!2178 (underlying!135 thiss!992))) #b00000000000000000000000000000000 (size!1802 (_keys!3537 (v!2178 (underlying!135 thiss!992))))) lt!21120)))

(declare-fun bm!3926 () Bool)

(assert (=> bm!3926 (= call!3929 (arrayCountValidKeys!0 (_keys!3537 (v!2178 (underlying!135 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1802 (_keys!3537 (v!2178 (underlying!135 thiss!992))))))))

(declare-fun b!51086 () Bool)

(assert (=> b!51086 (= e!33094 #b00000000000000000000000000000000)))

(assert (= (and d!10265 c!6841) b!51086))

(assert (= (and d!10265 (not c!6841)) b!51085))

(assert (= (and b!51085 c!6842) b!51084))

(assert (= (and b!51085 (not c!6842)) b!51083))

(assert (= (or b!51084 b!51083) bm!3926))

(assert (=> b!51085 m!44037))

(assert (=> b!51085 m!44037))

(assert (=> b!51085 m!44047))

(declare-fun m!44053 () Bool)

(assert (=> bm!3926 m!44053))

(assert (=> b!51016 d!10265))

(declare-fun b!51087 () Bool)

(declare-fun e!33096 () Bool)

(declare-fun call!3930 () Bool)

(assert (=> b!51087 (= e!33096 call!3930)))

(declare-fun b!51088 () Bool)

(declare-fun e!33097 () Bool)

(assert (=> b!51088 (= e!33097 call!3930)))

(declare-fun d!10267 () Bool)

(declare-fun res!29299 () Bool)

(declare-fun e!33095 () Bool)

(assert (=> d!10267 (=> res!29299 e!33095)))

(assert (=> d!10267 (= res!29299 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1802 (_keys!3537 newMap!16))))))

(assert (=> d!10267 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3537 newMap!16) (mask!5724 newMap!16)) e!33095)))

(declare-fun b!51089 () Bool)

(assert (=> b!51089 (= e!33096 e!33097)))

(declare-fun lt!21121 () (_ BitVec 64))

(assert (=> b!51089 (= lt!21121 (select (arr!1576 (_keys!3537 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!21123 () Unit!1428)

(assert (=> b!51089 (= lt!21123 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3537 newMap!16) lt!21121 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!51089 (arrayContainsKey!0 (_keys!3537 newMap!16) lt!21121 #b00000000000000000000000000000000)))

(declare-fun lt!21122 () Unit!1428)

(assert (=> b!51089 (= lt!21122 lt!21123)))

(declare-fun res!29298 () Bool)

(assert (=> b!51089 (= res!29298 (= (seekEntryOrOpen!0 (select (arr!1576 (_keys!3537 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3537 newMap!16) (mask!5724 newMap!16)) (Found!224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!51089 (=> (not res!29298) (not e!33097))))

(declare-fun bm!3927 () Bool)

(assert (=> bm!3927 (= call!3930 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3537 newMap!16) (mask!5724 newMap!16)))))

(declare-fun b!51090 () Bool)

(assert (=> b!51090 (= e!33095 e!33096)))

(declare-fun c!6843 () Bool)

(assert (=> b!51090 (= c!6843 (validKeyInArray!0 (select (arr!1576 (_keys!3537 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!10267 (not res!29299)) b!51090))

(assert (= (and b!51090 c!6843) b!51089))

(assert (= (and b!51090 (not c!6843)) b!51087))

(assert (= (and b!51089 res!29298) b!51088))

(assert (= (or b!51088 b!51087) bm!3927))

(assert (=> b!51089 m!44021))

(declare-fun m!44055 () Bool)

(assert (=> b!51089 m!44055))

(declare-fun m!44057 () Bool)

(assert (=> b!51089 m!44057))

(assert (=> b!51089 m!44021))

(declare-fun m!44059 () Bool)

(assert (=> b!51089 m!44059))

(declare-fun m!44061 () Bool)

(assert (=> bm!3927 m!44061))

(assert (=> b!51090 m!44021))

(assert (=> b!51090 m!44021))

(assert (=> b!51090 m!44023))

(assert (=> bm!3918 d!10267))

(assert (=> b!51030 d!10257))

(declare-fun d!10269 () Bool)

(assert (=> d!10269 (arrayContainsKey!0 (_keys!3537 newMap!16) lt!21107 #b00000000000000000000000000000000)))

(declare-fun lt!21126 () Unit!1428)

(declare-fun choose!13 (array!3301 (_ BitVec 64) (_ BitVec 32)) Unit!1428)

(assert (=> d!10269 (= lt!21126 (choose!13 (_keys!3537 newMap!16) lt!21107 #b00000000000000000000000000000000))))

(assert (=> d!10269 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!10269 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3537 newMap!16) lt!21107 #b00000000000000000000000000000000) lt!21126)))

(declare-fun bs!2371 () Bool)

(assert (= bs!2371 d!10269))

(assert (=> bs!2371 m!44005))

(declare-fun m!44063 () Bool)

(assert (=> bs!2371 m!44063))

(assert (=> b!51029 d!10269))

(declare-fun d!10271 () Bool)

(declare-fun res!29304 () Bool)

(declare-fun e!33102 () Bool)

(assert (=> d!10271 (=> res!29304 e!33102)))

(assert (=> d!10271 (= res!29304 (= (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000) lt!21107))))

(assert (=> d!10271 (= (arrayContainsKey!0 (_keys!3537 newMap!16) lt!21107 #b00000000000000000000000000000000) e!33102)))

(declare-fun b!51095 () Bool)

(declare-fun e!33103 () Bool)

(assert (=> b!51095 (= e!33102 e!33103)))

(declare-fun res!29305 () Bool)

(assert (=> b!51095 (=> (not res!29305) (not e!33103))))

(assert (=> b!51095 (= res!29305 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1802 (_keys!3537 newMap!16))))))

(declare-fun b!51096 () Bool)

(assert (=> b!51096 (= e!33103 (arrayContainsKey!0 (_keys!3537 newMap!16) lt!21107 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10271 (not res!29304)) b!51095))

(assert (= (and b!51095 res!29305) b!51096))

(assert (=> d!10271 m!43987))

(declare-fun m!44065 () Bool)

(assert (=> b!51096 m!44065))

(assert (=> b!51029 d!10271))

(declare-fun b!51109 () Bool)

(declare-fun e!33111 () SeekEntryResult!224)

(declare-fun lt!21133 () SeekEntryResult!224)

(assert (=> b!51109 (= e!33111 (MissingZero!224 (index!3020 lt!21133)))))

(declare-fun b!51110 () Bool)

(declare-fun e!33112 () SeekEntryResult!224)

(assert (=> b!51110 (= e!33112 (Found!224 (index!3020 lt!21133)))))

(declare-fun b!51111 () Bool)

(declare-fun e!33110 () SeekEntryResult!224)

(assert (=> b!51111 (= e!33110 e!33112)))

(declare-fun lt!21135 () (_ BitVec 64))

(assert (=> b!51111 (= lt!21135 (select (arr!1576 (_keys!3537 newMap!16)) (index!3020 lt!21133)))))

(declare-fun c!6851 () Bool)

(assert (=> b!51111 (= c!6851 (= lt!21135 (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51112 () Bool)

(declare-fun c!6850 () Bool)

(assert (=> b!51112 (= c!6850 (= lt!21135 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!51112 (= e!33112 e!33111)))

(declare-fun d!10273 () Bool)

(declare-fun lt!21134 () SeekEntryResult!224)

(assert (=> d!10273 (and (or ((_ is Undefined!224) lt!21134) (not ((_ is Found!224) lt!21134)) (and (bvsge (index!3019 lt!21134) #b00000000000000000000000000000000) (bvslt (index!3019 lt!21134) (size!1802 (_keys!3537 newMap!16))))) (or ((_ is Undefined!224) lt!21134) ((_ is Found!224) lt!21134) (not ((_ is MissingZero!224) lt!21134)) (and (bvsge (index!3018 lt!21134) #b00000000000000000000000000000000) (bvslt (index!3018 lt!21134) (size!1802 (_keys!3537 newMap!16))))) (or ((_ is Undefined!224) lt!21134) ((_ is Found!224) lt!21134) ((_ is MissingZero!224) lt!21134) (not ((_ is MissingVacant!224) lt!21134)) (and (bvsge (index!3021 lt!21134) #b00000000000000000000000000000000) (bvslt (index!3021 lt!21134) (size!1802 (_keys!3537 newMap!16))))) (or ((_ is Undefined!224) lt!21134) (ite ((_ is Found!224) lt!21134) (= (select (arr!1576 (_keys!3537 newMap!16)) (index!3019 lt!21134)) (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!224) lt!21134) (= (select (arr!1576 (_keys!3537 newMap!16)) (index!3018 lt!21134)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!224) lt!21134) (= (select (arr!1576 (_keys!3537 newMap!16)) (index!3021 lt!21134)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10273 (= lt!21134 e!33110)))

(declare-fun c!6852 () Bool)

(assert (=> d!10273 (= c!6852 (and ((_ is Intermediate!224) lt!21133) (undefined!1036 lt!21133)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3301 (_ BitVec 32)) SeekEntryResult!224)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!10273 (= lt!21133 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000) (mask!5724 newMap!16)) (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000) (_keys!3537 newMap!16) (mask!5724 newMap!16)))))

(assert (=> d!10273 (validMask!0 (mask!5724 newMap!16))))

(assert (=> d!10273 (= (seekEntryOrOpen!0 (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000) (_keys!3537 newMap!16) (mask!5724 newMap!16)) lt!21134)))

(declare-fun b!51113 () Bool)

(assert (=> b!51113 (= e!33110 Undefined!224)))

(declare-fun b!51114 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3301 (_ BitVec 32)) SeekEntryResult!224)

(assert (=> b!51114 (= e!33111 (seekKeyOrZeroReturnVacant!0 (x!9309 lt!21133) (index!3020 lt!21133) (index!3020 lt!21133) (select (arr!1576 (_keys!3537 newMap!16)) #b00000000000000000000000000000000) (_keys!3537 newMap!16) (mask!5724 newMap!16)))))

(assert (= (and d!10273 c!6852) b!51113))

(assert (= (and d!10273 (not c!6852)) b!51111))

(assert (= (and b!51111 c!6851) b!51110))

(assert (= (and b!51111 (not c!6851)) b!51112))

(assert (= (and b!51112 c!6850) b!51109))

(assert (= (and b!51112 (not c!6850)) b!51114))

(declare-fun m!44067 () Bool)

(assert (=> b!51111 m!44067))

(declare-fun m!44069 () Bool)

(assert (=> d!10273 m!44069))

(assert (=> d!10273 m!43987))

(declare-fun m!44071 () Bool)

(assert (=> d!10273 m!44071))

(declare-fun m!44073 () Bool)

(assert (=> d!10273 m!44073))

(assert (=> d!10273 m!43987))

(assert (=> d!10273 m!44069))

(declare-fun m!44075 () Bool)

(assert (=> d!10273 m!44075))

(assert (=> d!10273 m!44015))

(declare-fun m!44077 () Bool)

(assert (=> d!10273 m!44077))

(assert (=> b!51114 m!43987))

(declare-fun m!44079 () Bool)

(assert (=> b!51114 m!44079))

(assert (=> b!51029 d!10273))

(declare-fun d!10275 () Bool)

(assert (=> d!10275 (= (validMask!0 (mask!5724 newMap!16)) (and (or (= (mask!5724 newMap!16) #b00000000000000000000000000000111) (= (mask!5724 newMap!16) #b00000000000000000000000000001111) (= (mask!5724 newMap!16) #b00000000000000000000000000011111) (= (mask!5724 newMap!16) #b00000000000000000000000000111111) (= (mask!5724 newMap!16) #b00000000000000000000000001111111) (= (mask!5724 newMap!16) #b00000000000000000000000011111111) (= (mask!5724 newMap!16) #b00000000000000000000000111111111) (= (mask!5724 newMap!16) #b00000000000000000000001111111111) (= (mask!5724 newMap!16) #b00000000000000000000011111111111) (= (mask!5724 newMap!16) #b00000000000000000000111111111111) (= (mask!5724 newMap!16) #b00000000000000000001111111111111) (= (mask!5724 newMap!16) #b00000000000000000011111111111111) (= (mask!5724 newMap!16) #b00000000000000000111111111111111) (= (mask!5724 newMap!16) #b00000000000000001111111111111111) (= (mask!5724 newMap!16) #b00000000000000011111111111111111) (= (mask!5724 newMap!16) #b00000000000000111111111111111111) (= (mask!5724 newMap!16) #b00000000000001111111111111111111) (= (mask!5724 newMap!16) #b00000000000011111111111111111111) (= (mask!5724 newMap!16) #b00000000000111111111111111111111) (= (mask!5724 newMap!16) #b00000000001111111111111111111111) (= (mask!5724 newMap!16) #b00000000011111111111111111111111) (= (mask!5724 newMap!16) #b00000000111111111111111111111111) (= (mask!5724 newMap!16) #b00000001111111111111111111111111) (= (mask!5724 newMap!16) #b00000011111111111111111111111111) (= (mask!5724 newMap!16) #b00000111111111111111111111111111) (= (mask!5724 newMap!16) #b00001111111111111111111111111111) (= (mask!5724 newMap!16) #b00011111111111111111111111111111) (= (mask!5724 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!5724 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!10249 d!10275))

(assert (=> b!51014 d!10257))

(declare-fun b!51115 () Bool)

(declare-fun res!29308 () Bool)

(declare-fun e!33113 () Bool)

(assert (=> b!51115 (=> (not res!29308) (not e!33113))))

(assert (=> b!51115 (= res!29308 (and (= (size!1803 (_values!1909 (v!2178 (underlying!135 thiss!992)))) (bvadd (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000000000000000000000000001)) (= (size!1802 (_keys!3537 (v!2178 (underlying!135 thiss!992)))) (size!1803 (_values!1909 (v!2178 (underlying!135 thiss!992))))) (bvsge (_size!261 (v!2178 (underlying!135 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!261 (v!2178 (underlying!135 thiss!992))) (bvadd (mask!5724 (v!2178 (underlying!135 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun b!51116 () Bool)

(declare-fun res!29309 () Bool)

(assert (=> b!51116 (=> (not res!29309) (not e!33113))))

(assert (=> b!51116 (= res!29309 (bvsge (size!1808 (v!2178 (underlying!135 thiss!992))) (_size!261 (v!2178 (underlying!135 thiss!992)))))))

(declare-fun b!51118 () Bool)

(assert (=> b!51118 (= e!33113 (and (bvsge (extraKeys!1817 (v!2178 (underlying!135 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1817 (v!2178 (underlying!135 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!261 (v!2178 (underlying!135 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun d!10277 () Bool)

(declare-fun res!29307 () Bool)

(assert (=> d!10277 (=> (not res!29307) (not e!33113))))

(assert (=> d!10277 (= res!29307 (validMask!0 (mask!5724 (v!2178 (underlying!135 thiss!992)))))))

(assert (=> d!10277 (= (simpleValid!36 (v!2178 (underlying!135 thiss!992))) e!33113)))

(declare-fun b!51117 () Bool)

(declare-fun res!29306 () Bool)

(assert (=> b!51117 (=> (not res!29306) (not e!33113))))

(assert (=> b!51117 (= res!29306 (= (size!1808 (v!2178 (underlying!135 thiss!992))) (bvadd (_size!261 (v!2178 (underlying!135 thiss!992))) (bvsdiv (bvadd (extraKeys!1817 (v!2178 (underlying!135 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!10277 res!29307) b!51115))

(assert (= (and b!51115 res!29308) b!51116))

(assert (= (and b!51116 res!29309) b!51117))

(assert (= (and b!51117 res!29306) b!51118))

(declare-fun m!44081 () Bool)

(assert (=> b!51116 m!44081))

(assert (=> d!10277 m!43927))

(assert (=> b!51117 m!44081))

(assert (=> d!10243 d!10277))

(assert (=> b!51053 d!10255))

(declare-fun b!51119 () Bool)

(declare-fun e!33114 () Bool)

(assert (=> b!51119 (= e!33114 tp_is_empty!2203)))

(declare-fun condMapEmpty!2271 () Bool)

(declare-fun mapDefault!2271 () ValueCell!758)

(assert (=> mapNonEmpty!2270 (= condMapEmpty!2271 (= mapRest!2270 ((as const (Array (_ BitVec 32) ValueCell!758)) mapDefault!2271)))))

(declare-fun e!33115 () Bool)

(declare-fun mapRes!2271 () Bool)

(assert (=> mapNonEmpty!2270 (= tp!6824 (and e!33115 mapRes!2271))))

(declare-fun mapIsEmpty!2271 () Bool)

(assert (=> mapIsEmpty!2271 mapRes!2271))

(declare-fun b!51120 () Bool)

(assert (=> b!51120 (= e!33115 tp_is_empty!2203)))

(declare-fun mapNonEmpty!2271 () Bool)

(declare-fun tp!6825 () Bool)

(assert (=> mapNonEmpty!2271 (= mapRes!2271 (and tp!6825 e!33114))))

(declare-fun mapValue!2271 () ValueCell!758)

(declare-fun mapRest!2271 () (Array (_ BitVec 32) ValueCell!758))

(declare-fun mapKey!2271 () (_ BitVec 32))

(assert (=> mapNonEmpty!2271 (= mapRest!2270 (store mapRest!2271 mapKey!2271 mapValue!2271))))

(assert (= (and mapNonEmpty!2270 condMapEmpty!2271) mapIsEmpty!2271))

(assert (= (and mapNonEmpty!2270 (not condMapEmpty!2271)) mapNonEmpty!2271))

(assert (= (and mapNonEmpty!2271 ((_ is ValueCellFull!758) mapValue!2271)) b!51119))

(assert (= (and mapNonEmpty!2270 ((_ is ValueCellFull!758) mapDefault!2271)) b!51120))

(declare-fun m!44083 () Bool)

(assert (=> mapNonEmpty!2271 m!44083))

(declare-fun b!51121 () Bool)

(declare-fun e!33116 () Bool)

(assert (=> b!51121 (= e!33116 tp_is_empty!2203)))

(declare-fun condMapEmpty!2272 () Bool)

(declare-fun mapDefault!2272 () ValueCell!758)

(assert (=> mapNonEmpty!2269 (= condMapEmpty!2272 (= mapRest!2269 ((as const (Array (_ BitVec 32) ValueCell!758)) mapDefault!2272)))))

(declare-fun e!33117 () Bool)

(declare-fun mapRes!2272 () Bool)

(assert (=> mapNonEmpty!2269 (= tp!6823 (and e!33117 mapRes!2272))))

(declare-fun mapIsEmpty!2272 () Bool)

(assert (=> mapIsEmpty!2272 mapRes!2272))

(declare-fun b!51122 () Bool)

(assert (=> b!51122 (= e!33117 tp_is_empty!2203)))

(declare-fun mapNonEmpty!2272 () Bool)

(declare-fun tp!6826 () Bool)

(assert (=> mapNonEmpty!2272 (= mapRes!2272 (and tp!6826 e!33116))))

(declare-fun mapValue!2272 () ValueCell!758)

(declare-fun mapKey!2272 () (_ BitVec 32))

(declare-fun mapRest!2272 () (Array (_ BitVec 32) ValueCell!758))

(assert (=> mapNonEmpty!2272 (= mapRest!2269 (store mapRest!2272 mapKey!2272 mapValue!2272))))

(assert (= (and mapNonEmpty!2269 condMapEmpty!2272) mapIsEmpty!2272))

(assert (= (and mapNonEmpty!2269 (not condMapEmpty!2272)) mapNonEmpty!2272))

(assert (= (and mapNonEmpty!2272 ((_ is ValueCellFull!758) mapValue!2272)) b!51121))

(assert (= (and mapNonEmpty!2269 ((_ is ValueCellFull!758) mapDefault!2272)) b!51122))

(declare-fun m!44085 () Bool)

(assert (=> mapNonEmpty!2272 m!44085))

(check-sat (not mapNonEmpty!2272) b_and!2785 (not d!10269) (not b!51079) (not mapNonEmpty!2271) (not d!10273) (not b!51072) (not b!51068) (not b!51085) (not bm!3926) (not bm!3925) (not d!10253) (not b!51114) tp_is_empty!2203 (not b!51077) (not b!51069) (not b!51078) (not b!51096) (not bm!3927) (not d!10277) (not bm!3923) (not bm!3924) (not b_next!1573) (not b!51090) (not bm!3922) (not b!51070) (not b_next!1575) (not b!51117) (not b!51116) (not b!51081) (not b!51089) b_and!2787 (not b!51061) (not b!51076))
(check-sat b_and!2785 b_and!2787 (not b_next!1573) (not b_next!1575))
