; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7980 () Bool)

(assert start!7980)

(declare-fun b!49942 () Bool)

(declare-fun b_free!1525 () Bool)

(declare-fun b_next!1525 () Bool)

(assert (=> b!49942 (= b_free!1525 (not b_next!1525))))

(declare-fun tp!6624 () Bool)

(declare-fun b_and!2733 () Bool)

(assert (=> b!49942 (= tp!6624 b_and!2733)))

(declare-fun b!49940 () Bool)

(declare-fun b_free!1527 () Bool)

(declare-fun b_next!1527 () Bool)

(assert (=> b!49940 (= b_free!1527 (not b_next!1527))))

(declare-fun tp!6625 () Bool)

(declare-fun b_and!2735 () Bool)

(assert (=> b!49940 (= tp!6625 b_and!2735)))

(declare-fun mapIsEmpty!2155 () Bool)

(declare-fun mapRes!2155 () Bool)

(assert (=> mapIsEmpty!2155 mapRes!2155))

(declare-fun mapNonEmpty!2155 () Bool)

(declare-fun tp!6623 () Bool)

(declare-fun e!32211 () Bool)

(assert (=> mapNonEmpty!2155 (= mapRes!2155 (and tp!6623 e!32211))))

(declare-datatypes ((V!2553 0))(
  ( (V!2554 (val!1134 Int)) )
))
(declare-datatypes ((ValueCell!746 0))(
  ( (ValueCellFull!746 (v!2154 V!2553)) (EmptyCell!746) )
))
(declare-fun mapValue!2156 () ValueCell!746)

(declare-fun mapKey!2156 () (_ BitVec 32))

(declare-datatypes ((array!3253 0))(
  ( (array!3254 (arr!1556 (Array (_ BitVec 32) (_ BitVec 64))) (size!1778 (_ BitVec 32))) )
))
(declare-datatypes ((array!3255 0))(
  ( (array!3256 (arr!1557 (Array (_ BitVec 32) ValueCell!746)) (size!1779 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!400 0))(
  ( (LongMapFixedSize!401 (defaultEntry!1914 Int) (mask!5696 (_ BitVec 32)) (extraKeys!1805 (_ BitVec 32)) (zeroValue!1832 V!2553) (minValue!1832 V!2553) (_size!249 (_ BitVec 32)) (_keys!3520 array!3253) (_values!1897 array!3255) (_vacant!249 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!400)

(declare-fun mapRest!2156 () (Array (_ BitVec 32) ValueCell!746))

(assert (=> mapNonEmpty!2155 (= (arr!1557 (_values!1897 newMap!16)) (store mapRest!2156 mapKey!2156 mapValue!2156))))

(declare-fun b!49930 () Bool)

(declare-fun res!28837 () Bool)

(declare-fun e!32215 () Bool)

(assert (=> b!49930 (=> (not res!28837) (not e!32215))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((Cell!226 0))(
  ( (Cell!227 (v!2155 LongMapFixedSize!400)) )
))
(declare-datatypes ((LongMap!226 0))(
  ( (LongMap!227 (underlying!124 Cell!226)) )
))
(declare-fun thiss!992 () LongMap!226)

(assert (=> b!49930 (= res!28837 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1778 (_keys!3520 (v!2155 (underlying!124 thiss!992)))))))))

(declare-fun b!49931 () Bool)

(declare-fun e!32213 () Bool)

(declare-fun tp_is_empty!2179 () Bool)

(assert (=> b!49931 (= e!32213 tp_is_empty!2179)))

(declare-fun b!49932 () Bool)

(assert (=> b!49932 (= e!32211 tp_is_empty!2179)))

(declare-fun b!49933 () Bool)

(declare-fun e!32214 () Bool)

(declare-fun e!32209 () Bool)

(assert (=> b!49933 (= e!32214 (and e!32209 mapRes!2155))))

(declare-fun condMapEmpty!2155 () Bool)

(declare-fun mapDefault!2156 () ValueCell!746)

(assert (=> b!49933 (= condMapEmpty!2155 (= (arr!1557 (_values!1897 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!746)) mapDefault!2156)))))

(declare-fun b!49934 () Bool)

(declare-fun res!28840 () Bool)

(assert (=> b!49934 (=> (not res!28840) (not e!32215))))

(declare-fun valid!142 (LongMapFixedSize!400) Bool)

(assert (=> b!49934 (= res!28840 (valid!142 newMap!16))))

(declare-fun b!49935 () Bool)

(declare-fun res!28839 () Bool)

(assert (=> b!49935 (=> (not res!28839) (not e!32215))))

(assert (=> b!49935 (= res!28839 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5696 newMap!16)) (_size!249 (v!2155 (underlying!124 thiss!992)))))))

(declare-fun mapIsEmpty!2156 () Bool)

(declare-fun mapRes!2156 () Bool)

(assert (=> mapIsEmpty!2156 mapRes!2156))

(declare-fun b!49936 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!49936 (= e!32215 (not (validMask!0 (mask!5696 (v!2155 (underlying!124 thiss!992))))))))

(declare-fun b!49937 () Bool)

(declare-fun e!32212 () Bool)

(declare-fun e!32210 () Bool)

(assert (=> b!49937 (= e!32212 e!32210)))

(declare-fun b!49938 () Bool)

(declare-fun e!32217 () Bool)

(assert (=> b!49938 (= e!32210 e!32217)))

(declare-fun mapNonEmpty!2156 () Bool)

(declare-fun tp!6626 () Bool)

(assert (=> mapNonEmpty!2156 (= mapRes!2156 (and tp!6626 e!32213))))

(declare-fun mapRest!2155 () (Array (_ BitVec 32) ValueCell!746))

(declare-fun mapKey!2155 () (_ BitVec 32))

(declare-fun mapValue!2155 () ValueCell!746)

(assert (=> mapNonEmpty!2156 (= (arr!1557 (_values!1897 (v!2155 (underlying!124 thiss!992)))) (store mapRest!2155 mapKey!2155 mapValue!2155))))

(declare-fun b!49939 () Bool)

(declare-fun e!32208 () Bool)

(declare-fun e!32207 () Bool)

(assert (=> b!49939 (= e!32208 (and e!32207 mapRes!2156))))

(declare-fun condMapEmpty!2156 () Bool)

(declare-fun mapDefault!2155 () ValueCell!746)

(assert (=> b!49939 (= condMapEmpty!2156 (= (arr!1557 (_values!1897 (v!2155 (underlying!124 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!746)) mapDefault!2155)))))

(declare-fun e!32205 () Bool)

(declare-fun array_inv!937 (array!3253) Bool)

(declare-fun array_inv!938 (array!3255) Bool)

(assert (=> b!49940 (= e!32205 (and tp!6625 tp_is_empty!2179 (array_inv!937 (_keys!3520 newMap!16)) (array_inv!938 (_values!1897 newMap!16)) e!32214))))

(declare-fun res!28838 () Bool)

(assert (=> start!7980 (=> (not res!28838) (not e!32215))))

(declare-fun valid!143 (LongMap!226) Bool)

(assert (=> start!7980 (= res!28838 (valid!143 thiss!992))))

(assert (=> start!7980 e!32215))

(assert (=> start!7980 e!32212))

(assert (=> start!7980 true))

(assert (=> start!7980 e!32205))

(declare-fun b!49941 () Bool)

(assert (=> b!49941 (= e!32207 tp_is_empty!2179)))

(assert (=> b!49942 (= e!32217 (and tp!6624 tp_is_empty!2179 (array_inv!937 (_keys!3520 (v!2155 (underlying!124 thiss!992)))) (array_inv!938 (_values!1897 (v!2155 (underlying!124 thiss!992)))) e!32208))))

(declare-fun b!49943 () Bool)

(assert (=> b!49943 (= e!32209 tp_is_empty!2179)))

(assert (= (and start!7980 res!28838) b!49930))

(assert (= (and b!49930 res!28837) b!49934))

(assert (= (and b!49934 res!28840) b!49935))

(assert (= (and b!49935 res!28839) b!49936))

(assert (= (and b!49939 condMapEmpty!2156) mapIsEmpty!2156))

(assert (= (and b!49939 (not condMapEmpty!2156)) mapNonEmpty!2156))

(get-info :version)

(assert (= (and mapNonEmpty!2156 ((_ is ValueCellFull!746) mapValue!2155)) b!49931))

(assert (= (and b!49939 ((_ is ValueCellFull!746) mapDefault!2155)) b!49941))

(assert (= b!49942 b!49939))

(assert (= b!49938 b!49942))

(assert (= b!49937 b!49938))

(assert (= start!7980 b!49937))

(assert (= (and b!49933 condMapEmpty!2155) mapIsEmpty!2155))

(assert (= (and b!49933 (not condMapEmpty!2155)) mapNonEmpty!2155))

(assert (= (and mapNonEmpty!2155 ((_ is ValueCellFull!746) mapValue!2156)) b!49932))

(assert (= (and b!49933 ((_ is ValueCellFull!746) mapDefault!2156)) b!49943))

(assert (= b!49940 b!49933))

(assert (= start!7980 b!49940))

(declare-fun m!43319 () Bool)

(assert (=> b!49942 m!43319))

(declare-fun m!43321 () Bool)

(assert (=> b!49942 m!43321))

(declare-fun m!43323 () Bool)

(assert (=> mapNonEmpty!2156 m!43323))

(declare-fun m!43325 () Bool)

(assert (=> mapNonEmpty!2155 m!43325))

(declare-fun m!43327 () Bool)

(assert (=> b!49936 m!43327))

(declare-fun m!43329 () Bool)

(assert (=> b!49934 m!43329))

(declare-fun m!43331 () Bool)

(assert (=> b!49940 m!43331))

(declare-fun m!43333 () Bool)

(assert (=> b!49940 m!43333))

(declare-fun m!43335 () Bool)

(assert (=> start!7980 m!43335))

(check-sat (not b_next!1525) (not b!49936) tp_is_empty!2179 (not b!49934) (not b_next!1527) (not mapNonEmpty!2156) (not mapNonEmpty!2155) (not b!49940) b_and!2733 (not b!49942) (not start!7980) b_and!2735)
(check-sat b_and!2733 b_and!2735 (not b_next!1525) (not b_next!1527))
(get-model)

(declare-fun d!10073 () Bool)

(declare-fun res!28871 () Bool)

(declare-fun e!32298 () Bool)

(assert (=> d!10073 (=> (not res!28871) (not e!32298))))

(declare-fun simpleValid!33 (LongMapFixedSize!400) Bool)

(assert (=> d!10073 (= res!28871 (simpleValid!33 newMap!16))))

(assert (=> d!10073 (= (valid!142 newMap!16) e!32298)))

(declare-fun b!50034 () Bool)

(declare-fun res!28872 () Bool)

(assert (=> b!50034 (=> (not res!28872) (not e!32298))))

(declare-fun arrayCountValidKeys!0 (array!3253 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!50034 (= res!28872 (= (arrayCountValidKeys!0 (_keys!3520 newMap!16) #b00000000000000000000000000000000 (size!1778 (_keys!3520 newMap!16))) (_size!249 newMap!16)))))

(declare-fun b!50035 () Bool)

(declare-fun res!28873 () Bool)

(assert (=> b!50035 (=> (not res!28873) (not e!32298))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3253 (_ BitVec 32)) Bool)

(assert (=> b!50035 (= res!28873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3520 newMap!16) (mask!5696 newMap!16)))))

(declare-fun b!50036 () Bool)

(declare-datatypes ((List!1314 0))(
  ( (Nil!1311) (Cons!1310 (h!1890 (_ BitVec 64)) (t!4348 List!1314)) )
))
(declare-fun arrayNoDuplicates!0 (array!3253 (_ BitVec 32) List!1314) Bool)

(assert (=> b!50036 (= e!32298 (arrayNoDuplicates!0 (_keys!3520 newMap!16) #b00000000000000000000000000000000 Nil!1311))))

(assert (= (and d!10073 res!28871) b!50034))

(assert (= (and b!50034 res!28872) b!50035))

(assert (= (and b!50035 res!28873) b!50036))

(declare-fun m!43373 () Bool)

(assert (=> d!10073 m!43373))

(declare-fun m!43375 () Bool)

(assert (=> b!50034 m!43375))

(declare-fun m!43377 () Bool)

(assert (=> b!50035 m!43377))

(declare-fun m!43379 () Bool)

(assert (=> b!50036 m!43379))

(assert (=> b!49934 d!10073))

(declare-fun d!10075 () Bool)

(assert (=> d!10075 (= (valid!143 thiss!992) (valid!142 (v!2155 (underlying!124 thiss!992))))))

(declare-fun bs!2353 () Bool)

(assert (= bs!2353 d!10075))

(declare-fun m!43381 () Bool)

(assert (=> bs!2353 m!43381))

(assert (=> start!7980 d!10075))

(declare-fun d!10077 () Bool)

(assert (=> d!10077 (= (array_inv!937 (_keys!3520 (v!2155 (underlying!124 thiss!992)))) (bvsge (size!1778 (_keys!3520 (v!2155 (underlying!124 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!49942 d!10077))

(declare-fun d!10079 () Bool)

(assert (=> d!10079 (= (array_inv!938 (_values!1897 (v!2155 (underlying!124 thiss!992)))) (bvsge (size!1779 (_values!1897 (v!2155 (underlying!124 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!49942 d!10079))

(declare-fun d!10081 () Bool)

(assert (=> d!10081 (= (array_inv!937 (_keys!3520 newMap!16)) (bvsge (size!1778 (_keys!3520 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!49940 d!10081))

(declare-fun d!10083 () Bool)

(assert (=> d!10083 (= (array_inv!938 (_values!1897 newMap!16)) (bvsge (size!1779 (_values!1897 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!49940 d!10083))

(declare-fun d!10085 () Bool)

(assert (=> d!10085 (= (validMask!0 (mask!5696 (v!2155 (underlying!124 thiss!992)))) (and (or (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000000000000000000000000000111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000000000000000000000000001111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000000000000000000000000011111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000000000000000000000000111111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000000000000000000000001111111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000000000000000000000011111111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000000000000000000000111111111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000000000000000000001111111111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000000000000000000011111111111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000000000000000000111111111111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000000000000000001111111111111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000000000000000011111111111111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000000000000000111111111111111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000000000000001111111111111111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000000000000011111111111111111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000000000000111111111111111111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000000000001111111111111111111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000000000011111111111111111111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000000000111111111111111111111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000000001111111111111111111111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000000011111111111111111111111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000000111111111111111111111111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000001111111111111111111111111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000011111111111111111111111111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000111111111111111111111111111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00001111111111111111111111111111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00011111111111111111111111111111) (= (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!49936 d!10085))

(declare-fun mapNonEmpty!2171 () Bool)

(declare-fun mapRes!2171 () Bool)

(declare-fun tp!6653 () Bool)

(declare-fun e!32303 () Bool)

(assert (=> mapNonEmpty!2171 (= mapRes!2171 (and tp!6653 e!32303))))

(declare-fun mapValue!2171 () ValueCell!746)

(declare-fun mapKey!2171 () (_ BitVec 32))

(declare-fun mapRest!2171 () (Array (_ BitVec 32) ValueCell!746))

(assert (=> mapNonEmpty!2171 (= mapRest!2156 (store mapRest!2171 mapKey!2171 mapValue!2171))))

(declare-fun b!50043 () Bool)

(assert (=> b!50043 (= e!32303 tp_is_empty!2179)))

(declare-fun b!50044 () Bool)

(declare-fun e!32304 () Bool)

(assert (=> b!50044 (= e!32304 tp_is_empty!2179)))

(declare-fun condMapEmpty!2171 () Bool)

(declare-fun mapDefault!2171 () ValueCell!746)

(assert (=> mapNonEmpty!2155 (= condMapEmpty!2171 (= mapRest!2156 ((as const (Array (_ BitVec 32) ValueCell!746)) mapDefault!2171)))))

(assert (=> mapNonEmpty!2155 (= tp!6623 (and e!32304 mapRes!2171))))

(declare-fun mapIsEmpty!2171 () Bool)

(assert (=> mapIsEmpty!2171 mapRes!2171))

(assert (= (and mapNonEmpty!2155 condMapEmpty!2171) mapIsEmpty!2171))

(assert (= (and mapNonEmpty!2155 (not condMapEmpty!2171)) mapNonEmpty!2171))

(assert (= (and mapNonEmpty!2171 ((_ is ValueCellFull!746) mapValue!2171)) b!50043))

(assert (= (and mapNonEmpty!2155 ((_ is ValueCellFull!746) mapDefault!2171)) b!50044))

(declare-fun m!43383 () Bool)

(assert (=> mapNonEmpty!2171 m!43383))

(declare-fun mapNonEmpty!2172 () Bool)

(declare-fun mapRes!2172 () Bool)

(declare-fun tp!6654 () Bool)

(declare-fun e!32305 () Bool)

(assert (=> mapNonEmpty!2172 (= mapRes!2172 (and tp!6654 e!32305))))

(declare-fun mapValue!2172 () ValueCell!746)

(declare-fun mapRest!2172 () (Array (_ BitVec 32) ValueCell!746))

(declare-fun mapKey!2172 () (_ BitVec 32))

(assert (=> mapNonEmpty!2172 (= mapRest!2155 (store mapRest!2172 mapKey!2172 mapValue!2172))))

(declare-fun b!50045 () Bool)

(assert (=> b!50045 (= e!32305 tp_is_empty!2179)))

(declare-fun b!50046 () Bool)

(declare-fun e!32306 () Bool)

(assert (=> b!50046 (= e!32306 tp_is_empty!2179)))

(declare-fun condMapEmpty!2172 () Bool)

(declare-fun mapDefault!2172 () ValueCell!746)

(assert (=> mapNonEmpty!2156 (= condMapEmpty!2172 (= mapRest!2155 ((as const (Array (_ BitVec 32) ValueCell!746)) mapDefault!2172)))))

(assert (=> mapNonEmpty!2156 (= tp!6626 (and e!32306 mapRes!2172))))

(declare-fun mapIsEmpty!2172 () Bool)

(assert (=> mapIsEmpty!2172 mapRes!2172))

(assert (= (and mapNonEmpty!2156 condMapEmpty!2172) mapIsEmpty!2172))

(assert (= (and mapNonEmpty!2156 (not condMapEmpty!2172)) mapNonEmpty!2172))

(assert (= (and mapNonEmpty!2172 ((_ is ValueCellFull!746) mapValue!2172)) b!50045))

(assert (= (and mapNonEmpty!2156 ((_ is ValueCellFull!746) mapDefault!2172)) b!50046))

(declare-fun m!43385 () Bool)

(assert (=> mapNonEmpty!2172 m!43385))

(check-sat (not mapNonEmpty!2172) (not mapNonEmpty!2171) (not b_next!1525) b_and!2735 (not b_next!1527) (not d!10073) (not b!50036) (not b!50035) b_and!2733 (not d!10075) tp_is_empty!2179 (not b!50034))
(check-sat b_and!2733 b_and!2735 (not b_next!1525) (not b_next!1527))
(get-model)

(declare-fun b!50057 () Bool)

(declare-fun e!32315 () Bool)

(declare-fun e!32317 () Bool)

(assert (=> b!50057 (= e!32315 e!32317)))

(declare-fun res!28882 () Bool)

(assert (=> b!50057 (=> (not res!28882) (not e!32317))))

(declare-fun e!32316 () Bool)

(assert (=> b!50057 (= res!28882 (not e!32316))))

(declare-fun res!28881 () Bool)

(assert (=> b!50057 (=> (not res!28881) (not e!32316))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!50057 (= res!28881 (validKeyInArray!0 (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50058 () Bool)

(declare-fun e!32318 () Bool)

(declare-fun call!3860 () Bool)

(assert (=> b!50058 (= e!32318 call!3860)))

(declare-fun b!50059 () Bool)

(assert (=> b!50059 (= e!32317 e!32318)))

(declare-fun c!6746 () Bool)

(assert (=> b!50059 (= c!6746 (validKeyInArray!0 (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!3857 () Bool)

(assert (=> bm!3857 (= call!3860 (arrayNoDuplicates!0 (_keys!3520 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6746 (Cons!1310 (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000) Nil!1311) Nil!1311)))))

(declare-fun b!50060 () Bool)

(declare-fun contains!609 (List!1314 (_ BitVec 64)) Bool)

(assert (=> b!50060 (= e!32316 (contains!609 Nil!1311 (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50061 () Bool)

(assert (=> b!50061 (= e!32318 call!3860)))

(declare-fun d!10087 () Bool)

(declare-fun res!28880 () Bool)

(assert (=> d!10087 (=> res!28880 e!32315)))

(assert (=> d!10087 (= res!28880 (bvsge #b00000000000000000000000000000000 (size!1778 (_keys!3520 newMap!16))))))

(assert (=> d!10087 (= (arrayNoDuplicates!0 (_keys!3520 newMap!16) #b00000000000000000000000000000000 Nil!1311) e!32315)))

(assert (= (and d!10087 (not res!28880)) b!50057))

(assert (= (and b!50057 res!28881) b!50060))

(assert (= (and b!50057 res!28882) b!50059))

(assert (= (and b!50059 c!6746) b!50058))

(assert (= (and b!50059 (not c!6746)) b!50061))

(assert (= (or b!50058 b!50061) bm!3857))

(declare-fun m!43387 () Bool)

(assert (=> b!50057 m!43387))

(assert (=> b!50057 m!43387))

(declare-fun m!43389 () Bool)

(assert (=> b!50057 m!43389))

(assert (=> b!50059 m!43387))

(assert (=> b!50059 m!43387))

(assert (=> b!50059 m!43389))

(assert (=> bm!3857 m!43387))

(declare-fun m!43391 () Bool)

(assert (=> bm!3857 m!43391))

(assert (=> b!50060 m!43387))

(assert (=> b!50060 m!43387))

(declare-fun m!43393 () Bool)

(assert (=> b!50060 m!43393))

(assert (=> b!50036 d!10087))

(declare-fun bm!3860 () Bool)

(declare-fun call!3863 () (_ BitVec 32))

(assert (=> bm!3860 (= call!3863 (arrayCountValidKeys!0 (_keys!3520 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1778 (_keys!3520 newMap!16))))))

(declare-fun b!50070 () Bool)

(declare-fun e!32324 () (_ BitVec 32))

(assert (=> b!50070 (= e!32324 (bvadd #b00000000000000000000000000000001 call!3863))))

(declare-fun b!50071 () Bool)

(assert (=> b!50071 (= e!32324 call!3863)))

(declare-fun d!10089 () Bool)

(declare-fun lt!20971 () (_ BitVec 32))

(assert (=> d!10089 (and (bvsge lt!20971 #b00000000000000000000000000000000) (bvsle lt!20971 (bvsub (size!1778 (_keys!3520 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!32323 () (_ BitVec 32))

(assert (=> d!10089 (= lt!20971 e!32323)))

(declare-fun c!6751 () Bool)

(assert (=> d!10089 (= c!6751 (bvsge #b00000000000000000000000000000000 (size!1778 (_keys!3520 newMap!16))))))

(assert (=> d!10089 (and (bvsle #b00000000000000000000000000000000 (size!1778 (_keys!3520 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1778 (_keys!3520 newMap!16)) (size!1778 (_keys!3520 newMap!16))))))

(assert (=> d!10089 (= (arrayCountValidKeys!0 (_keys!3520 newMap!16) #b00000000000000000000000000000000 (size!1778 (_keys!3520 newMap!16))) lt!20971)))

(declare-fun b!50072 () Bool)

(assert (=> b!50072 (= e!32323 e!32324)))

(declare-fun c!6752 () Bool)

(assert (=> b!50072 (= c!6752 (validKeyInArray!0 (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50073 () Bool)

(assert (=> b!50073 (= e!32323 #b00000000000000000000000000000000)))

(assert (= (and d!10089 c!6751) b!50073))

(assert (= (and d!10089 (not c!6751)) b!50072))

(assert (= (and b!50072 c!6752) b!50070))

(assert (= (and b!50072 (not c!6752)) b!50071))

(assert (= (or b!50070 b!50071) bm!3860))

(declare-fun m!43395 () Bool)

(assert (=> bm!3860 m!43395))

(assert (=> b!50072 m!43387))

(assert (=> b!50072 m!43387))

(assert (=> b!50072 m!43389))

(assert (=> b!50034 d!10089))

(declare-fun d!10091 () Bool)

(declare-fun res!28892 () Bool)

(declare-fun e!32327 () Bool)

(assert (=> d!10091 (=> (not res!28892) (not e!32327))))

(assert (=> d!10091 (= res!28892 (validMask!0 (mask!5696 newMap!16)))))

(assert (=> d!10091 (= (simpleValid!33 newMap!16) e!32327)))

(declare-fun b!50084 () Bool)

(declare-fun res!28891 () Bool)

(assert (=> b!50084 (=> (not res!28891) (not e!32327))))

(declare-fun size!1784 (LongMapFixedSize!400) (_ BitVec 32))

(assert (=> b!50084 (= res!28891 (= (size!1784 newMap!16) (bvadd (_size!249 newMap!16) (bvsdiv (bvadd (extraKeys!1805 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!50085 () Bool)

(assert (=> b!50085 (= e!32327 (and (bvsge (extraKeys!1805 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1805 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!249 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!50082 () Bool)

(declare-fun res!28893 () Bool)

(assert (=> b!50082 (=> (not res!28893) (not e!32327))))

(assert (=> b!50082 (= res!28893 (and (= (size!1779 (_values!1897 newMap!16)) (bvadd (mask!5696 newMap!16) #b00000000000000000000000000000001)) (= (size!1778 (_keys!3520 newMap!16)) (size!1779 (_values!1897 newMap!16))) (bvsge (_size!249 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!249 newMap!16) (bvadd (mask!5696 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!50083 () Bool)

(declare-fun res!28894 () Bool)

(assert (=> b!50083 (=> (not res!28894) (not e!32327))))

(assert (=> b!50083 (= res!28894 (bvsge (size!1784 newMap!16) (_size!249 newMap!16)))))

(assert (= (and d!10091 res!28892) b!50082))

(assert (= (and b!50082 res!28893) b!50083))

(assert (= (and b!50083 res!28894) b!50084))

(assert (= (and b!50084 res!28891) b!50085))

(declare-fun m!43397 () Bool)

(assert (=> d!10091 m!43397))

(declare-fun m!43399 () Bool)

(assert (=> b!50084 m!43399))

(assert (=> b!50083 m!43399))

(assert (=> d!10073 d!10091))

(declare-fun d!10093 () Bool)

(declare-fun res!28895 () Bool)

(declare-fun e!32328 () Bool)

(assert (=> d!10093 (=> (not res!28895) (not e!32328))))

(assert (=> d!10093 (= res!28895 (simpleValid!33 (v!2155 (underlying!124 thiss!992))))))

(assert (=> d!10093 (= (valid!142 (v!2155 (underlying!124 thiss!992))) e!32328)))

(declare-fun b!50086 () Bool)

(declare-fun res!28896 () Bool)

(assert (=> b!50086 (=> (not res!28896) (not e!32328))))

(assert (=> b!50086 (= res!28896 (= (arrayCountValidKeys!0 (_keys!3520 (v!2155 (underlying!124 thiss!992))) #b00000000000000000000000000000000 (size!1778 (_keys!3520 (v!2155 (underlying!124 thiss!992))))) (_size!249 (v!2155 (underlying!124 thiss!992)))))))

(declare-fun b!50087 () Bool)

(declare-fun res!28897 () Bool)

(assert (=> b!50087 (=> (not res!28897) (not e!32328))))

(assert (=> b!50087 (= res!28897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3520 (v!2155 (underlying!124 thiss!992))) (mask!5696 (v!2155 (underlying!124 thiss!992)))))))

(declare-fun b!50088 () Bool)

(assert (=> b!50088 (= e!32328 (arrayNoDuplicates!0 (_keys!3520 (v!2155 (underlying!124 thiss!992))) #b00000000000000000000000000000000 Nil!1311))))

(assert (= (and d!10093 res!28895) b!50086))

(assert (= (and b!50086 res!28896) b!50087))

(assert (= (and b!50087 res!28897) b!50088))

(declare-fun m!43401 () Bool)

(assert (=> d!10093 m!43401))

(declare-fun m!43403 () Bool)

(assert (=> b!50086 m!43403))

(declare-fun m!43405 () Bool)

(assert (=> b!50087 m!43405))

(declare-fun m!43407 () Bool)

(assert (=> b!50088 m!43407))

(assert (=> d!10075 d!10093))

(declare-fun b!50097 () Bool)

(declare-fun e!32336 () Bool)

(declare-fun call!3866 () Bool)

(assert (=> b!50097 (= e!32336 call!3866)))

(declare-fun b!50098 () Bool)

(declare-fun e!32337 () Bool)

(declare-fun e!32335 () Bool)

(assert (=> b!50098 (= e!32337 e!32335)))

(declare-fun c!6755 () Bool)

(assert (=> b!50098 (= c!6755 (validKeyInArray!0 (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50099 () Bool)

(assert (=> b!50099 (= e!32335 call!3866)))

(declare-fun bm!3863 () Bool)

(assert (=> bm!3863 (= call!3866 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3520 newMap!16) (mask!5696 newMap!16)))))

(declare-fun d!10095 () Bool)

(declare-fun res!28903 () Bool)

(assert (=> d!10095 (=> res!28903 e!32337)))

(assert (=> d!10095 (= res!28903 (bvsge #b00000000000000000000000000000000 (size!1778 (_keys!3520 newMap!16))))))

(assert (=> d!10095 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3520 newMap!16) (mask!5696 newMap!16)) e!32337)))

(declare-fun b!50100 () Bool)

(assert (=> b!50100 (= e!32335 e!32336)))

(declare-fun lt!20978 () (_ BitVec 64))

(assert (=> b!50100 (= lt!20978 (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1428 0))(
  ( (Unit!1429) )
))
(declare-fun lt!20979 () Unit!1428)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3253 (_ BitVec 64) (_ BitVec 32)) Unit!1428)

(assert (=> b!50100 (= lt!20979 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3520 newMap!16) lt!20978 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!50100 (arrayContainsKey!0 (_keys!3520 newMap!16) lt!20978 #b00000000000000000000000000000000)))

(declare-fun lt!20980 () Unit!1428)

(assert (=> b!50100 (= lt!20980 lt!20979)))

(declare-fun res!28902 () Bool)

(declare-datatypes ((SeekEntryResult!212 0))(
  ( (MissingZero!212 (index!2970 (_ BitVec 32))) (Found!212 (index!2971 (_ BitVec 32))) (Intermediate!212 (undefined!1024 Bool) (index!2972 (_ BitVec 32)) (x!9152 (_ BitVec 32))) (Undefined!212) (MissingVacant!212 (index!2973 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3253 (_ BitVec 32)) SeekEntryResult!212)

(assert (=> b!50100 (= res!28902 (= (seekEntryOrOpen!0 (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000) (_keys!3520 newMap!16) (mask!5696 newMap!16)) (Found!212 #b00000000000000000000000000000000)))))

(assert (=> b!50100 (=> (not res!28902) (not e!32336))))

(assert (= (and d!10095 (not res!28903)) b!50098))

(assert (= (and b!50098 c!6755) b!50100))

(assert (= (and b!50098 (not c!6755)) b!50099))

(assert (= (and b!50100 res!28902) b!50097))

(assert (= (or b!50097 b!50099) bm!3863))

(assert (=> b!50098 m!43387))

(assert (=> b!50098 m!43387))

(assert (=> b!50098 m!43389))

(declare-fun m!43409 () Bool)

(assert (=> bm!3863 m!43409))

(assert (=> b!50100 m!43387))

(declare-fun m!43411 () Bool)

(assert (=> b!50100 m!43411))

(declare-fun m!43413 () Bool)

(assert (=> b!50100 m!43413))

(assert (=> b!50100 m!43387))

(declare-fun m!43415 () Bool)

(assert (=> b!50100 m!43415))

(assert (=> b!50035 d!10095))

(declare-fun mapNonEmpty!2173 () Bool)

(declare-fun mapRes!2173 () Bool)

(declare-fun tp!6655 () Bool)

(declare-fun e!32338 () Bool)

(assert (=> mapNonEmpty!2173 (= mapRes!2173 (and tp!6655 e!32338))))

(declare-fun mapRest!2173 () (Array (_ BitVec 32) ValueCell!746))

(declare-fun mapValue!2173 () ValueCell!746)

(declare-fun mapKey!2173 () (_ BitVec 32))

(assert (=> mapNonEmpty!2173 (= mapRest!2172 (store mapRest!2173 mapKey!2173 mapValue!2173))))

(declare-fun b!50101 () Bool)

(assert (=> b!50101 (= e!32338 tp_is_empty!2179)))

(declare-fun b!50102 () Bool)

(declare-fun e!32339 () Bool)

(assert (=> b!50102 (= e!32339 tp_is_empty!2179)))

(declare-fun condMapEmpty!2173 () Bool)

(declare-fun mapDefault!2173 () ValueCell!746)

(assert (=> mapNonEmpty!2172 (= condMapEmpty!2173 (= mapRest!2172 ((as const (Array (_ BitVec 32) ValueCell!746)) mapDefault!2173)))))

(assert (=> mapNonEmpty!2172 (= tp!6654 (and e!32339 mapRes!2173))))

(declare-fun mapIsEmpty!2173 () Bool)

(assert (=> mapIsEmpty!2173 mapRes!2173))

(assert (= (and mapNonEmpty!2172 condMapEmpty!2173) mapIsEmpty!2173))

(assert (= (and mapNonEmpty!2172 (not condMapEmpty!2173)) mapNonEmpty!2173))

(assert (= (and mapNonEmpty!2173 ((_ is ValueCellFull!746) mapValue!2173)) b!50101))

(assert (= (and mapNonEmpty!2172 ((_ is ValueCellFull!746) mapDefault!2173)) b!50102))

(declare-fun m!43417 () Bool)

(assert (=> mapNonEmpty!2173 m!43417))

(declare-fun mapNonEmpty!2174 () Bool)

(declare-fun mapRes!2174 () Bool)

(declare-fun tp!6656 () Bool)

(declare-fun e!32340 () Bool)

(assert (=> mapNonEmpty!2174 (= mapRes!2174 (and tp!6656 e!32340))))

(declare-fun mapRest!2174 () (Array (_ BitVec 32) ValueCell!746))

(declare-fun mapValue!2174 () ValueCell!746)

(declare-fun mapKey!2174 () (_ BitVec 32))

(assert (=> mapNonEmpty!2174 (= mapRest!2171 (store mapRest!2174 mapKey!2174 mapValue!2174))))

(declare-fun b!50103 () Bool)

(assert (=> b!50103 (= e!32340 tp_is_empty!2179)))

(declare-fun b!50104 () Bool)

(declare-fun e!32341 () Bool)

(assert (=> b!50104 (= e!32341 tp_is_empty!2179)))

(declare-fun condMapEmpty!2174 () Bool)

(declare-fun mapDefault!2174 () ValueCell!746)

(assert (=> mapNonEmpty!2171 (= condMapEmpty!2174 (= mapRest!2171 ((as const (Array (_ BitVec 32) ValueCell!746)) mapDefault!2174)))))

(assert (=> mapNonEmpty!2171 (= tp!6653 (and e!32341 mapRes!2174))))

(declare-fun mapIsEmpty!2174 () Bool)

(assert (=> mapIsEmpty!2174 mapRes!2174))

(assert (= (and mapNonEmpty!2171 condMapEmpty!2174) mapIsEmpty!2174))

(assert (= (and mapNonEmpty!2171 (not condMapEmpty!2174)) mapNonEmpty!2174))

(assert (= (and mapNonEmpty!2174 ((_ is ValueCellFull!746) mapValue!2174)) b!50103))

(assert (= (and mapNonEmpty!2171 ((_ is ValueCellFull!746) mapDefault!2174)) b!50104))

(declare-fun m!43419 () Bool)

(assert (=> mapNonEmpty!2174 m!43419))

(check-sat (not bm!3863) (not b_next!1525) tp_is_empty!2179 (not b_next!1527) (not b!50060) (not b!50086) (not b!50059) (not b!50098) (not b!50088) (not mapNonEmpty!2173) b_and!2733 (not b!50084) (not b!50057) (not b!50072) (not mapNonEmpty!2174) (not b!50083) b_and!2735 (not b!50087) (not d!10093) (not d!10091) (not b!50100) (not bm!3857) (not bm!3860))
(check-sat b_and!2733 b_and!2735 (not b_next!1525) (not b_next!1527))
(get-model)

(declare-fun d!10097 () Bool)

(assert (=> d!10097 (arrayContainsKey!0 (_keys!3520 newMap!16) lt!20978 #b00000000000000000000000000000000)))

(declare-fun lt!20983 () Unit!1428)

(declare-fun choose!13 (array!3253 (_ BitVec 64) (_ BitVec 32)) Unit!1428)

(assert (=> d!10097 (= lt!20983 (choose!13 (_keys!3520 newMap!16) lt!20978 #b00000000000000000000000000000000))))

(assert (=> d!10097 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!10097 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3520 newMap!16) lt!20978 #b00000000000000000000000000000000) lt!20983)))

(declare-fun bs!2354 () Bool)

(assert (= bs!2354 d!10097))

(assert (=> bs!2354 m!43413))

(declare-fun m!43421 () Bool)

(assert (=> bs!2354 m!43421))

(assert (=> b!50100 d!10097))

(declare-fun d!10099 () Bool)

(declare-fun res!28908 () Bool)

(declare-fun e!32346 () Bool)

(assert (=> d!10099 (=> res!28908 e!32346)))

(assert (=> d!10099 (= res!28908 (= (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000) lt!20978))))

(assert (=> d!10099 (= (arrayContainsKey!0 (_keys!3520 newMap!16) lt!20978 #b00000000000000000000000000000000) e!32346)))

(declare-fun b!50109 () Bool)

(declare-fun e!32347 () Bool)

(assert (=> b!50109 (= e!32346 e!32347)))

(declare-fun res!28909 () Bool)

(assert (=> b!50109 (=> (not res!28909) (not e!32347))))

(assert (=> b!50109 (= res!28909 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1778 (_keys!3520 newMap!16))))))

(declare-fun b!50110 () Bool)

(assert (=> b!50110 (= e!32347 (arrayContainsKey!0 (_keys!3520 newMap!16) lt!20978 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10099 (not res!28908)) b!50109))

(assert (= (and b!50109 res!28909) b!50110))

(assert (=> d!10099 m!43387))

(declare-fun m!43423 () Bool)

(assert (=> b!50110 m!43423))

(assert (=> b!50100 d!10099))

(declare-fun b!50123 () Bool)

(declare-fun c!6762 () Bool)

(declare-fun lt!20990 () (_ BitVec 64))

(assert (=> b!50123 (= c!6762 (= lt!20990 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32356 () SeekEntryResult!212)

(declare-fun e!32354 () SeekEntryResult!212)

(assert (=> b!50123 (= e!32356 e!32354)))

(declare-fun b!50124 () Bool)

(declare-fun lt!20992 () SeekEntryResult!212)

(assert (=> b!50124 (= e!32354 (MissingZero!212 (index!2972 lt!20992)))))

(declare-fun b!50125 () Bool)

(declare-fun e!32355 () SeekEntryResult!212)

(assert (=> b!50125 (= e!32355 e!32356)))

(assert (=> b!50125 (= lt!20990 (select (arr!1556 (_keys!3520 newMap!16)) (index!2972 lt!20992)))))

(declare-fun c!6764 () Bool)

(assert (=> b!50125 (= c!6764 (= lt!20990 (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50127 () Bool)

(assert (=> b!50127 (= e!32356 (Found!212 (index!2972 lt!20992)))))

(declare-fun b!50128 () Bool)

(assert (=> b!50128 (= e!32355 Undefined!212)))

(declare-fun b!50126 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3253 (_ BitVec 32)) SeekEntryResult!212)

(assert (=> b!50126 (= e!32354 (seekKeyOrZeroReturnVacant!0 (x!9152 lt!20992) (index!2972 lt!20992) (index!2972 lt!20992) (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000) (_keys!3520 newMap!16) (mask!5696 newMap!16)))))

(declare-fun d!10101 () Bool)

(declare-fun lt!20991 () SeekEntryResult!212)

(assert (=> d!10101 (and (or ((_ is Undefined!212) lt!20991) (not ((_ is Found!212) lt!20991)) (and (bvsge (index!2971 lt!20991) #b00000000000000000000000000000000) (bvslt (index!2971 lt!20991) (size!1778 (_keys!3520 newMap!16))))) (or ((_ is Undefined!212) lt!20991) ((_ is Found!212) lt!20991) (not ((_ is MissingZero!212) lt!20991)) (and (bvsge (index!2970 lt!20991) #b00000000000000000000000000000000) (bvslt (index!2970 lt!20991) (size!1778 (_keys!3520 newMap!16))))) (or ((_ is Undefined!212) lt!20991) ((_ is Found!212) lt!20991) ((_ is MissingZero!212) lt!20991) (not ((_ is MissingVacant!212) lt!20991)) (and (bvsge (index!2973 lt!20991) #b00000000000000000000000000000000) (bvslt (index!2973 lt!20991) (size!1778 (_keys!3520 newMap!16))))) (or ((_ is Undefined!212) lt!20991) (ite ((_ is Found!212) lt!20991) (= (select (arr!1556 (_keys!3520 newMap!16)) (index!2971 lt!20991)) (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!212) lt!20991) (= (select (arr!1556 (_keys!3520 newMap!16)) (index!2970 lt!20991)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!212) lt!20991) (= (select (arr!1556 (_keys!3520 newMap!16)) (index!2973 lt!20991)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10101 (= lt!20991 e!32355)))

(declare-fun c!6763 () Bool)

(assert (=> d!10101 (= c!6763 (and ((_ is Intermediate!212) lt!20992) (undefined!1024 lt!20992)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3253 (_ BitVec 32)) SeekEntryResult!212)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!10101 (= lt!20992 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000) (mask!5696 newMap!16)) (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000) (_keys!3520 newMap!16) (mask!5696 newMap!16)))))

(assert (=> d!10101 (validMask!0 (mask!5696 newMap!16))))

(assert (=> d!10101 (= (seekEntryOrOpen!0 (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000) (_keys!3520 newMap!16) (mask!5696 newMap!16)) lt!20991)))

(assert (= (and d!10101 c!6763) b!50128))

(assert (= (and d!10101 (not c!6763)) b!50125))

(assert (= (and b!50125 c!6764) b!50127))

(assert (= (and b!50125 (not c!6764)) b!50123))

(assert (= (and b!50123 c!6762) b!50124))

(assert (= (and b!50123 (not c!6762)) b!50126))

(declare-fun m!43425 () Bool)

(assert (=> b!50125 m!43425))

(assert (=> b!50126 m!43387))

(declare-fun m!43427 () Bool)

(assert (=> b!50126 m!43427))

(declare-fun m!43429 () Bool)

(assert (=> d!10101 m!43429))

(assert (=> d!10101 m!43387))

(declare-fun m!43431 () Bool)

(assert (=> d!10101 m!43431))

(assert (=> d!10101 m!43387))

(assert (=> d!10101 m!43429))

(assert (=> d!10101 m!43397))

(declare-fun m!43433 () Bool)

(assert (=> d!10101 m!43433))

(declare-fun m!43435 () Bool)

(assert (=> d!10101 m!43435))

(declare-fun m!43437 () Bool)

(assert (=> d!10101 m!43437))

(assert (=> b!50100 d!10101))

(declare-fun d!10103 () Bool)

(assert (=> d!10103 (= (validKeyInArray!0 (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!50057 d!10103))

(declare-fun d!10105 () Bool)

(assert (=> d!10105 (= (size!1784 newMap!16) (bvadd (_size!249 newMap!16) (bvsdiv (bvadd (extraKeys!1805 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!50083 d!10105))

(assert (=> b!50084 d!10105))

(declare-fun b!50129 () Bool)

(declare-fun e!32358 () Bool)

(declare-fun call!3867 () Bool)

(assert (=> b!50129 (= e!32358 call!3867)))

(declare-fun b!50130 () Bool)

(declare-fun e!32359 () Bool)

(declare-fun e!32357 () Bool)

(assert (=> b!50130 (= e!32359 e!32357)))

(declare-fun c!6765 () Bool)

(assert (=> b!50130 (= c!6765 (validKeyInArray!0 (select (arr!1556 (_keys!3520 (v!2155 (underlying!124 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50131 () Bool)

(assert (=> b!50131 (= e!32357 call!3867)))

(declare-fun bm!3864 () Bool)

(assert (=> bm!3864 (= call!3867 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3520 (v!2155 (underlying!124 thiss!992))) (mask!5696 (v!2155 (underlying!124 thiss!992)))))))

(declare-fun d!10107 () Bool)

(declare-fun res!28911 () Bool)

(assert (=> d!10107 (=> res!28911 e!32359)))

(assert (=> d!10107 (= res!28911 (bvsge #b00000000000000000000000000000000 (size!1778 (_keys!3520 (v!2155 (underlying!124 thiss!992))))))))

(assert (=> d!10107 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3520 (v!2155 (underlying!124 thiss!992))) (mask!5696 (v!2155 (underlying!124 thiss!992)))) e!32359)))

(declare-fun b!50132 () Bool)

(assert (=> b!50132 (= e!32357 e!32358)))

(declare-fun lt!20993 () (_ BitVec 64))

(assert (=> b!50132 (= lt!20993 (select (arr!1556 (_keys!3520 (v!2155 (underlying!124 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!20994 () Unit!1428)

(assert (=> b!50132 (= lt!20994 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3520 (v!2155 (underlying!124 thiss!992))) lt!20993 #b00000000000000000000000000000000))))

(assert (=> b!50132 (arrayContainsKey!0 (_keys!3520 (v!2155 (underlying!124 thiss!992))) lt!20993 #b00000000000000000000000000000000)))

(declare-fun lt!20995 () Unit!1428)

(assert (=> b!50132 (= lt!20995 lt!20994)))

(declare-fun res!28910 () Bool)

(assert (=> b!50132 (= res!28910 (= (seekEntryOrOpen!0 (select (arr!1556 (_keys!3520 (v!2155 (underlying!124 thiss!992)))) #b00000000000000000000000000000000) (_keys!3520 (v!2155 (underlying!124 thiss!992))) (mask!5696 (v!2155 (underlying!124 thiss!992)))) (Found!212 #b00000000000000000000000000000000)))))

(assert (=> b!50132 (=> (not res!28910) (not e!32358))))

(assert (= (and d!10107 (not res!28911)) b!50130))

(assert (= (and b!50130 c!6765) b!50132))

(assert (= (and b!50130 (not c!6765)) b!50131))

(assert (= (and b!50132 res!28910) b!50129))

(assert (= (or b!50129 b!50131) bm!3864))

(declare-fun m!43439 () Bool)

(assert (=> b!50130 m!43439))

(assert (=> b!50130 m!43439))

(declare-fun m!43441 () Bool)

(assert (=> b!50130 m!43441))

(declare-fun m!43443 () Bool)

(assert (=> bm!3864 m!43443))

(assert (=> b!50132 m!43439))

(declare-fun m!43445 () Bool)

(assert (=> b!50132 m!43445))

(declare-fun m!43447 () Bool)

(assert (=> b!50132 m!43447))

(assert (=> b!50132 m!43439))

(declare-fun m!43449 () Bool)

(assert (=> b!50132 m!43449))

(assert (=> b!50087 d!10107))

(declare-fun b!50133 () Bool)

(declare-fun e!32360 () Bool)

(declare-fun e!32362 () Bool)

(assert (=> b!50133 (= e!32360 e!32362)))

(declare-fun res!28914 () Bool)

(assert (=> b!50133 (=> (not res!28914) (not e!32362))))

(declare-fun e!32361 () Bool)

(assert (=> b!50133 (= res!28914 (not e!32361))))

(declare-fun res!28913 () Bool)

(assert (=> b!50133 (=> (not res!28913) (not e!32361))))

(assert (=> b!50133 (= res!28913 (validKeyInArray!0 (select (arr!1556 (_keys!3520 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50134 () Bool)

(declare-fun e!32363 () Bool)

(declare-fun call!3868 () Bool)

(assert (=> b!50134 (= e!32363 call!3868)))

(declare-fun b!50135 () Bool)

(assert (=> b!50135 (= e!32362 e!32363)))

(declare-fun c!6766 () Bool)

(assert (=> b!50135 (= c!6766 (validKeyInArray!0 (select (arr!1556 (_keys!3520 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3865 () Bool)

(assert (=> bm!3865 (= call!3868 (arrayNoDuplicates!0 (_keys!3520 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!6766 (Cons!1310 (select (arr!1556 (_keys!3520 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!6746 (Cons!1310 (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000) Nil!1311) Nil!1311)) (ite c!6746 (Cons!1310 (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000) Nil!1311) Nil!1311))))))

(declare-fun b!50136 () Bool)

(assert (=> b!50136 (= e!32361 (contains!609 (ite c!6746 (Cons!1310 (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000) Nil!1311) Nil!1311) (select (arr!1556 (_keys!3520 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50137 () Bool)

(assert (=> b!50137 (= e!32363 call!3868)))

(declare-fun d!10109 () Bool)

(declare-fun res!28912 () Bool)

(assert (=> d!10109 (=> res!28912 e!32360)))

(assert (=> d!10109 (= res!28912 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1778 (_keys!3520 newMap!16))))))

(assert (=> d!10109 (= (arrayNoDuplicates!0 (_keys!3520 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6746 (Cons!1310 (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000) Nil!1311) Nil!1311)) e!32360)))

(assert (= (and d!10109 (not res!28912)) b!50133))

(assert (= (and b!50133 res!28913) b!50136))

(assert (= (and b!50133 res!28914) b!50135))

(assert (= (and b!50135 c!6766) b!50134))

(assert (= (and b!50135 (not c!6766)) b!50137))

(assert (= (or b!50134 b!50137) bm!3865))

(declare-fun m!43451 () Bool)

(assert (=> b!50133 m!43451))

(assert (=> b!50133 m!43451))

(declare-fun m!43453 () Bool)

(assert (=> b!50133 m!43453))

(assert (=> b!50135 m!43451))

(assert (=> b!50135 m!43451))

(assert (=> b!50135 m!43453))

(assert (=> bm!3865 m!43451))

(declare-fun m!43455 () Bool)

(assert (=> bm!3865 m!43455))

(assert (=> b!50136 m!43451))

(assert (=> b!50136 m!43451))

(declare-fun m!43457 () Bool)

(assert (=> b!50136 m!43457))

(assert (=> bm!3857 d!10109))

(declare-fun bm!3866 () Bool)

(declare-fun call!3869 () (_ BitVec 32))

(assert (=> bm!3866 (= call!3869 (arrayCountValidKeys!0 (_keys!3520 (v!2155 (underlying!124 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1778 (_keys!3520 (v!2155 (underlying!124 thiss!992))))))))

(declare-fun b!50138 () Bool)

(declare-fun e!32365 () (_ BitVec 32))

(assert (=> b!50138 (= e!32365 (bvadd #b00000000000000000000000000000001 call!3869))))

(declare-fun b!50139 () Bool)

(assert (=> b!50139 (= e!32365 call!3869)))

(declare-fun d!10111 () Bool)

(declare-fun lt!20996 () (_ BitVec 32))

(assert (=> d!10111 (and (bvsge lt!20996 #b00000000000000000000000000000000) (bvsle lt!20996 (bvsub (size!1778 (_keys!3520 (v!2155 (underlying!124 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!32364 () (_ BitVec 32))

(assert (=> d!10111 (= lt!20996 e!32364)))

(declare-fun c!6767 () Bool)

(assert (=> d!10111 (= c!6767 (bvsge #b00000000000000000000000000000000 (size!1778 (_keys!3520 (v!2155 (underlying!124 thiss!992))))))))

(assert (=> d!10111 (and (bvsle #b00000000000000000000000000000000 (size!1778 (_keys!3520 (v!2155 (underlying!124 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1778 (_keys!3520 (v!2155 (underlying!124 thiss!992)))) (size!1778 (_keys!3520 (v!2155 (underlying!124 thiss!992))))))))

(assert (=> d!10111 (= (arrayCountValidKeys!0 (_keys!3520 (v!2155 (underlying!124 thiss!992))) #b00000000000000000000000000000000 (size!1778 (_keys!3520 (v!2155 (underlying!124 thiss!992))))) lt!20996)))

(declare-fun b!50140 () Bool)

(assert (=> b!50140 (= e!32364 e!32365)))

(declare-fun c!6768 () Bool)

(assert (=> b!50140 (= c!6768 (validKeyInArray!0 (select (arr!1556 (_keys!3520 (v!2155 (underlying!124 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50141 () Bool)

(assert (=> b!50141 (= e!32364 #b00000000000000000000000000000000)))

(assert (= (and d!10111 c!6767) b!50141))

(assert (= (and d!10111 (not c!6767)) b!50140))

(assert (= (and b!50140 c!6768) b!50138))

(assert (= (and b!50140 (not c!6768)) b!50139))

(assert (= (or b!50138 b!50139) bm!3866))

(declare-fun m!43459 () Bool)

(assert (=> bm!3866 m!43459))

(assert (=> b!50140 m!43439))

(assert (=> b!50140 m!43439))

(assert (=> b!50140 m!43441))

(assert (=> b!50086 d!10111))

(assert (=> b!50059 d!10103))

(declare-fun b!50142 () Bool)

(declare-fun e!32366 () Bool)

(declare-fun e!32368 () Bool)

(assert (=> b!50142 (= e!32366 e!32368)))

(declare-fun res!28917 () Bool)

(assert (=> b!50142 (=> (not res!28917) (not e!32368))))

(declare-fun e!32367 () Bool)

(assert (=> b!50142 (= res!28917 (not e!32367))))

(declare-fun res!28916 () Bool)

(assert (=> b!50142 (=> (not res!28916) (not e!32367))))

(assert (=> b!50142 (= res!28916 (validKeyInArray!0 (select (arr!1556 (_keys!3520 (v!2155 (underlying!124 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50143 () Bool)

(declare-fun e!32369 () Bool)

(declare-fun call!3870 () Bool)

(assert (=> b!50143 (= e!32369 call!3870)))

(declare-fun b!50144 () Bool)

(assert (=> b!50144 (= e!32368 e!32369)))

(declare-fun c!6769 () Bool)

(assert (=> b!50144 (= c!6769 (validKeyInArray!0 (select (arr!1556 (_keys!3520 (v!2155 (underlying!124 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!3867 () Bool)

(assert (=> bm!3867 (= call!3870 (arrayNoDuplicates!0 (_keys!3520 (v!2155 (underlying!124 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6769 (Cons!1310 (select (arr!1556 (_keys!3520 (v!2155 (underlying!124 thiss!992)))) #b00000000000000000000000000000000) Nil!1311) Nil!1311)))))

(declare-fun b!50145 () Bool)

(assert (=> b!50145 (= e!32367 (contains!609 Nil!1311 (select (arr!1556 (_keys!3520 (v!2155 (underlying!124 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50146 () Bool)

(assert (=> b!50146 (= e!32369 call!3870)))

(declare-fun d!10113 () Bool)

(declare-fun res!28915 () Bool)

(assert (=> d!10113 (=> res!28915 e!32366)))

(assert (=> d!10113 (= res!28915 (bvsge #b00000000000000000000000000000000 (size!1778 (_keys!3520 (v!2155 (underlying!124 thiss!992))))))))

(assert (=> d!10113 (= (arrayNoDuplicates!0 (_keys!3520 (v!2155 (underlying!124 thiss!992))) #b00000000000000000000000000000000 Nil!1311) e!32366)))

(assert (= (and d!10113 (not res!28915)) b!50142))

(assert (= (and b!50142 res!28916) b!50145))

(assert (= (and b!50142 res!28917) b!50144))

(assert (= (and b!50144 c!6769) b!50143))

(assert (= (and b!50144 (not c!6769)) b!50146))

(assert (= (or b!50143 b!50146) bm!3867))

(assert (=> b!50142 m!43439))

(assert (=> b!50142 m!43439))

(assert (=> b!50142 m!43441))

(assert (=> b!50144 m!43439))

(assert (=> b!50144 m!43439))

(assert (=> b!50144 m!43441))

(assert (=> bm!3867 m!43439))

(declare-fun m!43461 () Bool)

(assert (=> bm!3867 m!43461))

(assert (=> b!50145 m!43439))

(assert (=> b!50145 m!43439))

(declare-fun m!43463 () Bool)

(assert (=> b!50145 m!43463))

(assert (=> b!50088 d!10113))

(declare-fun d!10115 () Bool)

(declare-fun lt!20999 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!56 (List!1314) (InoxSet (_ BitVec 64)))

(assert (=> d!10115 (= lt!20999 (select (content!56 Nil!1311) (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!32374 () Bool)

(assert (=> d!10115 (= lt!20999 e!32374)))

(declare-fun res!28923 () Bool)

(assert (=> d!10115 (=> (not res!28923) (not e!32374))))

(assert (=> d!10115 (= res!28923 ((_ is Cons!1310) Nil!1311))))

(assert (=> d!10115 (= (contains!609 Nil!1311 (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000)) lt!20999)))

(declare-fun b!50151 () Bool)

(declare-fun e!32375 () Bool)

(assert (=> b!50151 (= e!32374 e!32375)))

(declare-fun res!28922 () Bool)

(assert (=> b!50151 (=> res!28922 e!32375)))

(assert (=> b!50151 (= res!28922 (= (h!1890 Nil!1311) (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50152 () Bool)

(assert (=> b!50152 (= e!32375 (contains!609 (t!4348 Nil!1311) (select (arr!1556 (_keys!3520 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10115 res!28923) b!50151))

(assert (= (and b!50151 (not res!28922)) b!50152))

(declare-fun m!43465 () Bool)

(assert (=> d!10115 m!43465))

(assert (=> d!10115 m!43387))

(declare-fun m!43467 () Bool)

(assert (=> d!10115 m!43467))

(assert (=> b!50152 m!43387))

(declare-fun m!43469 () Bool)

(assert (=> b!50152 m!43469))

(assert (=> b!50060 d!10115))

(declare-fun d!10117 () Bool)

(assert (=> d!10117 (= (validMask!0 (mask!5696 newMap!16)) (and (or (= (mask!5696 newMap!16) #b00000000000000000000000000000111) (= (mask!5696 newMap!16) #b00000000000000000000000000001111) (= (mask!5696 newMap!16) #b00000000000000000000000000011111) (= (mask!5696 newMap!16) #b00000000000000000000000000111111) (= (mask!5696 newMap!16) #b00000000000000000000000001111111) (= (mask!5696 newMap!16) #b00000000000000000000000011111111) (= (mask!5696 newMap!16) #b00000000000000000000000111111111) (= (mask!5696 newMap!16) #b00000000000000000000001111111111) (= (mask!5696 newMap!16) #b00000000000000000000011111111111) (= (mask!5696 newMap!16) #b00000000000000000000111111111111) (= (mask!5696 newMap!16) #b00000000000000000001111111111111) (= (mask!5696 newMap!16) #b00000000000000000011111111111111) (= (mask!5696 newMap!16) #b00000000000000000111111111111111) (= (mask!5696 newMap!16) #b00000000000000001111111111111111) (= (mask!5696 newMap!16) #b00000000000000011111111111111111) (= (mask!5696 newMap!16) #b00000000000000111111111111111111) (= (mask!5696 newMap!16) #b00000000000001111111111111111111) (= (mask!5696 newMap!16) #b00000000000011111111111111111111) (= (mask!5696 newMap!16) #b00000000000111111111111111111111) (= (mask!5696 newMap!16) #b00000000001111111111111111111111) (= (mask!5696 newMap!16) #b00000000011111111111111111111111) (= (mask!5696 newMap!16) #b00000000111111111111111111111111) (= (mask!5696 newMap!16) #b00000001111111111111111111111111) (= (mask!5696 newMap!16) #b00000011111111111111111111111111) (= (mask!5696 newMap!16) #b00000111111111111111111111111111) (= (mask!5696 newMap!16) #b00001111111111111111111111111111) (= (mask!5696 newMap!16) #b00011111111111111111111111111111) (= (mask!5696 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!5696 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!10091 d!10117))

(declare-fun bm!3868 () Bool)

(declare-fun call!3871 () (_ BitVec 32))

(assert (=> bm!3868 (= call!3871 (arrayCountValidKeys!0 (_keys!3520 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1778 (_keys!3520 newMap!16))))))

(declare-fun b!50153 () Bool)

(declare-fun e!32377 () (_ BitVec 32))

(assert (=> b!50153 (= e!32377 (bvadd #b00000000000000000000000000000001 call!3871))))

(declare-fun b!50154 () Bool)

(assert (=> b!50154 (= e!32377 call!3871)))

(declare-fun d!10119 () Bool)

(declare-fun lt!21000 () (_ BitVec 32))

(assert (=> d!10119 (and (bvsge lt!21000 #b00000000000000000000000000000000) (bvsle lt!21000 (bvsub (size!1778 (_keys!3520 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!32376 () (_ BitVec 32))

(assert (=> d!10119 (= lt!21000 e!32376)))

(declare-fun c!6770 () Bool)

(assert (=> d!10119 (= c!6770 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1778 (_keys!3520 newMap!16))))))

(assert (=> d!10119 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1778 (_keys!3520 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1778 (_keys!3520 newMap!16)) (size!1778 (_keys!3520 newMap!16))))))

(assert (=> d!10119 (= (arrayCountValidKeys!0 (_keys!3520 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1778 (_keys!3520 newMap!16))) lt!21000)))

(declare-fun b!50155 () Bool)

(assert (=> b!50155 (= e!32376 e!32377)))

(declare-fun c!6771 () Bool)

(assert (=> b!50155 (= c!6771 (validKeyInArray!0 (select (arr!1556 (_keys!3520 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50156 () Bool)

(assert (=> b!50156 (= e!32376 #b00000000000000000000000000000000)))

(assert (= (and d!10119 c!6770) b!50156))

(assert (= (and d!10119 (not c!6770)) b!50155))

(assert (= (and b!50155 c!6771) b!50153))

(assert (= (and b!50155 (not c!6771)) b!50154))

(assert (= (or b!50153 b!50154) bm!3868))

(declare-fun m!43471 () Bool)

(assert (=> bm!3868 m!43471))

(assert (=> b!50155 m!43451))

(assert (=> b!50155 m!43451))

(assert (=> b!50155 m!43453))

(assert (=> bm!3860 d!10119))

(declare-fun d!10121 () Bool)

(declare-fun res!28925 () Bool)

(declare-fun e!32378 () Bool)

(assert (=> d!10121 (=> (not res!28925) (not e!32378))))

(assert (=> d!10121 (= res!28925 (validMask!0 (mask!5696 (v!2155 (underlying!124 thiss!992)))))))

(assert (=> d!10121 (= (simpleValid!33 (v!2155 (underlying!124 thiss!992))) e!32378)))

(declare-fun b!50159 () Bool)

(declare-fun res!28924 () Bool)

(assert (=> b!50159 (=> (not res!28924) (not e!32378))))

(assert (=> b!50159 (= res!28924 (= (size!1784 (v!2155 (underlying!124 thiss!992))) (bvadd (_size!249 (v!2155 (underlying!124 thiss!992))) (bvsdiv (bvadd (extraKeys!1805 (v!2155 (underlying!124 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!50160 () Bool)

(assert (=> b!50160 (= e!32378 (and (bvsge (extraKeys!1805 (v!2155 (underlying!124 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1805 (v!2155 (underlying!124 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!249 (v!2155 (underlying!124 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!50157 () Bool)

(declare-fun res!28926 () Bool)

(assert (=> b!50157 (=> (not res!28926) (not e!32378))))

(assert (=> b!50157 (= res!28926 (and (= (size!1779 (_values!1897 (v!2155 (underlying!124 thiss!992)))) (bvadd (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000000000000000000000000000001)) (= (size!1778 (_keys!3520 (v!2155 (underlying!124 thiss!992)))) (size!1779 (_values!1897 (v!2155 (underlying!124 thiss!992))))) (bvsge (_size!249 (v!2155 (underlying!124 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!249 (v!2155 (underlying!124 thiss!992))) (bvadd (mask!5696 (v!2155 (underlying!124 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun b!50158 () Bool)

(declare-fun res!28927 () Bool)

(assert (=> b!50158 (=> (not res!28927) (not e!32378))))

(assert (=> b!50158 (= res!28927 (bvsge (size!1784 (v!2155 (underlying!124 thiss!992))) (_size!249 (v!2155 (underlying!124 thiss!992)))))))

(assert (= (and d!10121 res!28925) b!50157))

(assert (= (and b!50157 res!28926) b!50158))

(assert (= (and b!50158 res!28927) b!50159))

(assert (= (and b!50159 res!28924) b!50160))

(assert (=> d!10121 m!43327))

(declare-fun m!43473 () Bool)

(assert (=> b!50159 m!43473))

(assert (=> b!50158 m!43473))

(assert (=> d!10093 d!10121))

(assert (=> b!50098 d!10103))

(declare-fun b!50161 () Bool)

(declare-fun e!32380 () Bool)

(declare-fun call!3872 () Bool)

(assert (=> b!50161 (= e!32380 call!3872)))

(declare-fun b!50162 () Bool)

(declare-fun e!32381 () Bool)

(declare-fun e!32379 () Bool)

(assert (=> b!50162 (= e!32381 e!32379)))

(declare-fun c!6772 () Bool)

(assert (=> b!50162 (= c!6772 (validKeyInArray!0 (select (arr!1556 (_keys!3520 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50163 () Bool)

(assert (=> b!50163 (= e!32379 call!3872)))

(declare-fun bm!3869 () Bool)

(assert (=> bm!3869 (= call!3872 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3520 newMap!16) (mask!5696 newMap!16)))))

(declare-fun d!10123 () Bool)

(declare-fun res!28929 () Bool)

(assert (=> d!10123 (=> res!28929 e!32381)))

(assert (=> d!10123 (= res!28929 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1778 (_keys!3520 newMap!16))))))

(assert (=> d!10123 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3520 newMap!16) (mask!5696 newMap!16)) e!32381)))

(declare-fun b!50164 () Bool)

(assert (=> b!50164 (= e!32379 e!32380)))

(declare-fun lt!21001 () (_ BitVec 64))

(assert (=> b!50164 (= lt!21001 (select (arr!1556 (_keys!3520 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!21002 () Unit!1428)

(assert (=> b!50164 (= lt!21002 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3520 newMap!16) lt!21001 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!50164 (arrayContainsKey!0 (_keys!3520 newMap!16) lt!21001 #b00000000000000000000000000000000)))

(declare-fun lt!21003 () Unit!1428)

(assert (=> b!50164 (= lt!21003 lt!21002)))

(declare-fun res!28928 () Bool)

(assert (=> b!50164 (= res!28928 (= (seekEntryOrOpen!0 (select (arr!1556 (_keys!3520 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3520 newMap!16) (mask!5696 newMap!16)) (Found!212 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!50164 (=> (not res!28928) (not e!32380))))

(assert (= (and d!10123 (not res!28929)) b!50162))

(assert (= (and b!50162 c!6772) b!50164))

(assert (= (and b!50162 (not c!6772)) b!50163))

(assert (= (and b!50164 res!28928) b!50161))

(assert (= (or b!50161 b!50163) bm!3869))

(assert (=> b!50162 m!43451))

(assert (=> b!50162 m!43451))

(assert (=> b!50162 m!43453))

(declare-fun m!43475 () Bool)

(assert (=> bm!3869 m!43475))

(assert (=> b!50164 m!43451))

(declare-fun m!43477 () Bool)

(assert (=> b!50164 m!43477))

(declare-fun m!43479 () Bool)

(assert (=> b!50164 m!43479))

(assert (=> b!50164 m!43451))

(declare-fun m!43481 () Bool)

(assert (=> b!50164 m!43481))

(assert (=> bm!3863 d!10123))

(assert (=> b!50072 d!10103))

(declare-fun mapNonEmpty!2175 () Bool)

(declare-fun mapRes!2175 () Bool)

(declare-fun tp!6657 () Bool)

(declare-fun e!32382 () Bool)

(assert (=> mapNonEmpty!2175 (= mapRes!2175 (and tp!6657 e!32382))))

(declare-fun mapValue!2175 () ValueCell!746)

(declare-fun mapRest!2175 () (Array (_ BitVec 32) ValueCell!746))

(declare-fun mapKey!2175 () (_ BitVec 32))

(assert (=> mapNonEmpty!2175 (= mapRest!2173 (store mapRest!2175 mapKey!2175 mapValue!2175))))

(declare-fun b!50165 () Bool)

(assert (=> b!50165 (= e!32382 tp_is_empty!2179)))

(declare-fun b!50166 () Bool)

(declare-fun e!32383 () Bool)

(assert (=> b!50166 (= e!32383 tp_is_empty!2179)))

(declare-fun condMapEmpty!2175 () Bool)

(declare-fun mapDefault!2175 () ValueCell!746)

(assert (=> mapNonEmpty!2173 (= condMapEmpty!2175 (= mapRest!2173 ((as const (Array (_ BitVec 32) ValueCell!746)) mapDefault!2175)))))

(assert (=> mapNonEmpty!2173 (= tp!6655 (and e!32383 mapRes!2175))))

(declare-fun mapIsEmpty!2175 () Bool)

(assert (=> mapIsEmpty!2175 mapRes!2175))

(assert (= (and mapNonEmpty!2173 condMapEmpty!2175) mapIsEmpty!2175))

(assert (= (and mapNonEmpty!2173 (not condMapEmpty!2175)) mapNonEmpty!2175))

(assert (= (and mapNonEmpty!2175 ((_ is ValueCellFull!746) mapValue!2175)) b!50165))

(assert (= (and mapNonEmpty!2173 ((_ is ValueCellFull!746) mapDefault!2175)) b!50166))

(declare-fun m!43483 () Bool)

(assert (=> mapNonEmpty!2175 m!43483))

(declare-fun mapNonEmpty!2176 () Bool)

(declare-fun mapRes!2176 () Bool)

(declare-fun tp!6658 () Bool)

(declare-fun e!32384 () Bool)

(assert (=> mapNonEmpty!2176 (= mapRes!2176 (and tp!6658 e!32384))))

(declare-fun mapKey!2176 () (_ BitVec 32))

(declare-fun mapValue!2176 () ValueCell!746)

(declare-fun mapRest!2176 () (Array (_ BitVec 32) ValueCell!746))

(assert (=> mapNonEmpty!2176 (= mapRest!2174 (store mapRest!2176 mapKey!2176 mapValue!2176))))

(declare-fun b!50167 () Bool)

(assert (=> b!50167 (= e!32384 tp_is_empty!2179)))

(declare-fun b!50168 () Bool)

(declare-fun e!32385 () Bool)

(assert (=> b!50168 (= e!32385 tp_is_empty!2179)))

(declare-fun condMapEmpty!2176 () Bool)

(declare-fun mapDefault!2176 () ValueCell!746)

(assert (=> mapNonEmpty!2174 (= condMapEmpty!2176 (= mapRest!2174 ((as const (Array (_ BitVec 32) ValueCell!746)) mapDefault!2176)))))

(assert (=> mapNonEmpty!2174 (= tp!6656 (and e!32385 mapRes!2176))))

(declare-fun mapIsEmpty!2176 () Bool)

(assert (=> mapIsEmpty!2176 mapRes!2176))

(assert (= (and mapNonEmpty!2174 condMapEmpty!2176) mapIsEmpty!2176))

(assert (= (and mapNonEmpty!2174 (not condMapEmpty!2176)) mapNonEmpty!2176))

(assert (= (and mapNonEmpty!2176 ((_ is ValueCellFull!746) mapValue!2176)) b!50167))

(assert (= (and mapNonEmpty!2174 ((_ is ValueCellFull!746) mapDefault!2176)) b!50168))

(declare-fun m!43485 () Bool)

(assert (=> mapNonEmpty!2176 m!43485))

(check-sat (not bm!3865) (not b_next!1525) (not bm!3868) (not mapNonEmpty!2175) (not b!50110) (not b!50164) tp_is_empty!2179 b_and!2735 (not b!50142) (not b!50152) (not b!50133) (not b!50144) (not b!50135) (not b!50162) (not d!10121) (not bm!3864) (not bm!3866) (not b!50136) (not b!50155) (not d!10101) (not b!50126) (not d!10115) (not b_next!1527) (not b!50132) (not d!10097) (not bm!3869) (not bm!3867) (not b!50140) (not b!50158) (not b!50145) b_and!2733 (not b!50130) (not mapNonEmpty!2176) (not b!50159))
(check-sat b_and!2733 b_and!2735 (not b_next!1525) (not b_next!1527))
