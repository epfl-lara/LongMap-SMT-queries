; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10140 () Bool)

(assert start!10140)

(declare-fun b!77131 () Bool)

(declare-fun b_free!2161 () Bool)

(declare-fun b_next!2161 () Bool)

(assert (=> b!77131 (= b_free!2161 (not b_next!2161))))

(declare-fun tp!8680 () Bool)

(declare-fun b_and!4725 () Bool)

(assert (=> b!77131 (= tp!8680 b_and!4725)))

(declare-fun b!77139 () Bool)

(declare-fun b_free!2163 () Bool)

(declare-fun b_next!2163 () Bool)

(assert (=> b!77139 (= b_free!2163 (not b_next!2163))))

(declare-fun tp!8681 () Bool)

(declare-fun b_and!4727 () Bool)

(assert (=> b!77139 (= tp!8681 b_and!4727)))

(declare-fun b!77122 () Bool)

(declare-fun e!50371 () Bool)

(declare-fun e!50377 () Bool)

(assert (=> b!77122 (= e!50371 e!50377)))

(declare-fun res!40537 () Bool)

(assert (=> b!77122 (=> (not res!40537) (not e!50377))))

(declare-datatypes ((V!2977 0))(
  ( (V!2978 (val!1293 Int)) )
))
(declare-datatypes ((array!3931 0))(
  ( (array!3932 (arr!1874 (Array (_ BitVec 32) (_ BitVec 64))) (size!2115 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!905 0))(
  ( (ValueCellFull!905 (v!2579 V!2977)) (EmptyCell!905) )
))
(declare-datatypes ((array!3933 0))(
  ( (array!3934 (arr!1875 (Array (_ BitVec 32) ValueCell!905)) (size!2116 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!718 0))(
  ( (LongMapFixedSize!719 (defaultEntry!2262 Int) (mask!6253 (_ BitVec 32)) (extraKeys!2113 (_ BitVec 32)) (zeroValue!2160 V!2977) (minValue!2160 V!2977) (_size!408 (_ BitVec 32)) (_keys!3922 array!3931) (_values!2245 array!3933) (_vacant!408 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!526 0))(
  ( (Cell!527 (v!2580 LongMapFixedSize!718)) )
))
(declare-datatypes ((LongMap!526 0))(
  ( (LongMap!527 (underlying!274 Cell!526)) )
))
(declare-fun thiss!992 () LongMap!526)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!77122 (= res!40537 (and (not (= (select (arr!1874 (_keys!3922 (v!2580 (underlying!274 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1874 (_keys!3922 (v!2580 (underlying!274 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!35287 () V!2977)

(declare-fun get!1172 (ValueCell!905 V!2977) V!2977)

(declare-fun dynLambda!335 (Int (_ BitVec 64)) V!2977)

(assert (=> b!77122 (= lt!35287 (get!1172 (select (arr!1875 (_values!2245 (v!2580 (underlying!274 thiss!992)))) from!355) (dynLambda!335 (defaultEntry!2262 (v!2580 (underlying!274 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!77123 () Bool)

(declare-fun e!50367 () Bool)

(declare-fun tp_is_empty!2497 () Bool)

(assert (=> b!77123 (= e!50367 tp_is_empty!2497)))

(declare-fun b!77124 () Bool)

(declare-datatypes ((Unit!2222 0))(
  ( (Unit!2223) )
))
(declare-fun e!50372 () Unit!2222)

(declare-fun Unit!2224 () Unit!2222)

(assert (=> b!77124 (= e!50372 Unit!2224)))

(declare-fun lt!35280 () Unit!2222)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!49 (array!3931 array!3933 (_ BitVec 32) (_ BitVec 32) V!2977 V!2977 (_ BitVec 64) (_ BitVec 32) Int) Unit!2222)

(assert (=> b!77124 (= lt!35280 (lemmaListMapContainsThenArrayContainsFrom!49 (_keys!3922 (v!2580 (underlying!274 thiss!992))) (_values!2245 (v!2580 (underlying!274 thiss!992))) (mask!6253 (v!2580 (underlying!274 thiss!992))) (extraKeys!2113 (v!2580 (underlying!274 thiss!992))) (zeroValue!2160 (v!2580 (underlying!274 thiss!992))) (minValue!2160 (v!2580 (underlying!274 thiss!992))) (select (arr!1874 (_keys!3922 (v!2580 (underlying!274 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2262 (v!2580 (underlying!274 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!77124 (arrayContainsKey!0 (_keys!3922 (v!2580 (underlying!274 thiss!992))) (select (arr!1874 (_keys!3922 (v!2580 (underlying!274 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!35286 () Unit!2222)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3931 (_ BitVec 32) (_ BitVec 32)) Unit!2222)

(assert (=> b!77124 (= lt!35286 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3922 (v!2580 (underlying!274 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1487 0))(
  ( (Nil!1484) (Cons!1483 (h!2071 (_ BitVec 64)) (t!5101 List!1487)) )
))
(declare-fun arrayNoDuplicates!0 (array!3931 (_ BitVec 32) List!1487) Bool)

(assert (=> b!77124 (arrayNoDuplicates!0 (_keys!3922 (v!2580 (underlying!274 thiss!992))) from!355 Nil!1484)))

(declare-fun lt!35281 () Unit!2222)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3931 (_ BitVec 32) (_ BitVec 64) List!1487) Unit!2222)

(assert (=> b!77124 (= lt!35281 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3922 (v!2580 (underlying!274 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1874 (_keys!3922 (v!2580 (underlying!274 thiss!992)))) from!355) (Cons!1483 (select (arr!1874 (_keys!3922 (v!2580 (underlying!274 thiss!992)))) from!355) Nil!1484)))))

(assert (=> b!77124 false))

(declare-fun b!77125 () Bool)

(declare-fun e!50381 () Bool)

(assert (=> b!77125 (= e!50381 tp_is_empty!2497)))

(declare-fun b!77126 () Bool)

(declare-fun res!40534 () Bool)

(declare-fun e!50379 () Bool)

(assert (=> b!77126 (=> (not res!40534) (not e!50379))))

(declare-fun newMap!16 () LongMapFixedSize!718)

(declare-fun valid!317 (LongMapFixedSize!718) Bool)

(assert (=> b!77126 (= res!40534 (valid!317 newMap!16))))

(declare-fun b!77127 () Bool)

(declare-fun e!50373 () Bool)

(assert (=> b!77127 (= e!50373 (not true))))

(declare-datatypes ((tuple2!2148 0))(
  ( (tuple2!2149 (_1!1085 (_ BitVec 64)) (_2!1085 V!2977)) )
))
(declare-datatypes ((List!1488 0))(
  ( (Nil!1485) (Cons!1484 (h!2072 tuple2!2148) (t!5102 List!1488)) )
))
(declare-datatypes ((ListLongMap!1419 0))(
  ( (ListLongMap!1420 (toList!725 List!1488)) )
))
(declare-fun lt!35282 () ListLongMap!1419)

(declare-fun lt!35284 () tuple2!2148)

(declare-fun lt!35285 () tuple2!2148)

(declare-fun +!98 (ListLongMap!1419 tuple2!2148) ListLongMap!1419)

(assert (=> b!77127 (= (+!98 (+!98 lt!35282 lt!35284) lt!35285) (+!98 (+!98 lt!35282 lt!35285) lt!35284))))

(assert (=> b!77127 (= lt!35285 (tuple2!2149 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2160 (v!2580 (underlying!274 thiss!992)))))))

(assert (=> b!77127 (= lt!35284 (tuple2!2149 (select (arr!1874 (_keys!3922 (v!2580 (underlying!274 thiss!992)))) from!355) lt!35287))))

(declare-fun lt!35289 () Unit!2222)

(declare-fun addCommutativeForDiffKeys!18 (ListLongMap!1419 (_ BitVec 64) V!2977 (_ BitVec 64) V!2977) Unit!2222)

(assert (=> b!77127 (= lt!35289 (addCommutativeForDiffKeys!18 lt!35282 (select (arr!1874 (_keys!3922 (v!2580 (underlying!274 thiss!992)))) from!355) lt!35287 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2160 (v!2580 (underlying!274 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!63 (array!3931 array!3933 (_ BitVec 32) (_ BitVec 32) V!2977 V!2977 (_ BitVec 32) Int) ListLongMap!1419)

(assert (=> b!77127 (= lt!35282 (getCurrentListMapNoExtraKeys!63 (_keys!3922 (v!2580 (underlying!274 thiss!992))) (_values!2245 (v!2580 (underlying!274 thiss!992))) (mask!6253 (v!2580 (underlying!274 thiss!992))) (extraKeys!2113 (v!2580 (underlying!274 thiss!992))) (zeroValue!2160 (v!2580 (underlying!274 thiss!992))) (minValue!2160 (v!2580 (underlying!274 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2262 (v!2580 (underlying!274 thiss!992)))))))

(declare-fun b!77128 () Bool)

(declare-fun e!50382 () Bool)

(declare-fun e!50375 () Bool)

(declare-fun mapRes!3258 () Bool)

(assert (=> b!77128 (= e!50382 (and e!50375 mapRes!3258))))

(declare-fun condMapEmpty!3257 () Bool)

(declare-fun mapDefault!3258 () ValueCell!905)

(assert (=> b!77128 (= condMapEmpty!3257 (= (arr!1875 (_values!2245 (v!2580 (underlying!274 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!905)) mapDefault!3258)))))

(declare-fun b!77129 () Bool)

(assert (=> b!77129 (= e!50375 tp_is_empty!2497)))

(declare-fun mapIsEmpty!3258 () Bool)

(assert (=> mapIsEmpty!3258 mapRes!3258))

(declare-fun b!77130 () Bool)

(declare-fun e!50366 () Bool)

(declare-fun e!50370 () Bool)

(assert (=> b!77130 (= e!50366 e!50370)))

(declare-fun e!50374 () Bool)

(declare-fun array_inv!1149 (array!3931) Bool)

(declare-fun array_inv!1150 (array!3933) Bool)

(assert (=> b!77131 (= e!50374 (and tp!8680 tp_is_empty!2497 (array_inv!1149 (_keys!3922 (v!2580 (underlying!274 thiss!992)))) (array_inv!1150 (_values!2245 (v!2580 (underlying!274 thiss!992)))) e!50382))))

(declare-fun res!40538 () Bool)

(assert (=> start!10140 (=> (not res!40538) (not e!50379))))

(declare-fun valid!318 (LongMap!526) Bool)

(assert (=> start!10140 (= res!40538 (valid!318 thiss!992))))

(assert (=> start!10140 e!50379))

(assert (=> start!10140 e!50366))

(assert (=> start!10140 true))

(declare-fun e!50380 () Bool)

(assert (=> start!10140 e!50380))

(declare-fun mapIsEmpty!3257 () Bool)

(declare-fun mapRes!3257 () Bool)

(assert (=> mapIsEmpty!3257 mapRes!3257))

(declare-fun b!77132 () Bool)

(assert (=> b!77132 (= e!50370 e!50374)))

(declare-fun mapNonEmpty!3257 () Bool)

(declare-fun tp!8682 () Bool)

(assert (=> mapNonEmpty!3257 (= mapRes!3258 (and tp!8682 e!50367))))

(declare-fun mapRest!3257 () (Array (_ BitVec 32) ValueCell!905))

(declare-fun mapValue!3258 () ValueCell!905)

(declare-fun mapKey!3257 () (_ BitVec 32))

(assert (=> mapNonEmpty!3257 (= (arr!1875 (_values!2245 (v!2580 (underlying!274 thiss!992)))) (store mapRest!3257 mapKey!3257 mapValue!3258))))

(declare-fun b!77133 () Bool)

(assert (=> b!77133 (= e!50377 e!50373)))

(declare-fun res!40533 () Bool)

(assert (=> b!77133 (=> (not res!40533) (not e!50373))))

(declare-datatypes ((tuple2!2150 0))(
  ( (tuple2!2151 (_1!1086 Bool) (_2!1086 LongMapFixedSize!718)) )
))
(declare-fun lt!35288 () tuple2!2150)

(assert (=> b!77133 (= res!40533 (and (_1!1086 lt!35288) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!35283 () Unit!2222)

(assert (=> b!77133 (= lt!35283 e!50372)))

(declare-fun lt!35278 () ListLongMap!1419)

(declare-fun c!11792 () Bool)

(declare-fun contains!731 (ListLongMap!1419 (_ BitVec 64)) Bool)

(assert (=> b!77133 (= c!11792 (contains!731 lt!35278 (select (arr!1874 (_keys!3922 (v!2580 (underlying!274 thiss!992)))) from!355)))))

(declare-fun update!115 (LongMapFixedSize!718 (_ BitVec 64) V!2977) tuple2!2150)

(assert (=> b!77133 (= lt!35288 (update!115 newMap!16 (select (arr!1874 (_keys!3922 (v!2580 (underlying!274 thiss!992)))) from!355) lt!35287))))

(declare-fun b!77134 () Bool)

(declare-fun res!40536 () Bool)

(assert (=> b!77134 (=> (not res!40536) (not e!50379))))

(assert (=> b!77134 (= res!40536 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2115 (_keys!3922 (v!2580 (underlying!274 thiss!992)))))))))

(declare-fun b!77135 () Bool)

(assert (=> b!77135 (= e!50379 e!50371)))

(declare-fun res!40539 () Bool)

(assert (=> b!77135 (=> (not res!40539) (not e!50371))))

(declare-fun lt!35279 () ListLongMap!1419)

(assert (=> b!77135 (= res!40539 (= lt!35279 lt!35278))))

(declare-fun map!1175 (LongMapFixedSize!718) ListLongMap!1419)

(assert (=> b!77135 (= lt!35278 (map!1175 newMap!16))))

(declare-fun getCurrentListMap!421 (array!3931 array!3933 (_ BitVec 32) (_ BitVec 32) V!2977 V!2977 (_ BitVec 32) Int) ListLongMap!1419)

(assert (=> b!77135 (= lt!35279 (getCurrentListMap!421 (_keys!3922 (v!2580 (underlying!274 thiss!992))) (_values!2245 (v!2580 (underlying!274 thiss!992))) (mask!6253 (v!2580 (underlying!274 thiss!992))) (extraKeys!2113 (v!2580 (underlying!274 thiss!992))) (zeroValue!2160 (v!2580 (underlying!274 thiss!992))) (minValue!2160 (v!2580 (underlying!274 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2262 (v!2580 (underlying!274 thiss!992)))))))

(declare-fun mapNonEmpty!3258 () Bool)

(declare-fun tp!8679 () Bool)

(assert (=> mapNonEmpty!3258 (= mapRes!3257 (and tp!8679 e!50381))))

(declare-fun mapKey!3258 () (_ BitVec 32))

(declare-fun mapValue!3257 () ValueCell!905)

(declare-fun mapRest!3258 () (Array (_ BitVec 32) ValueCell!905))

(assert (=> mapNonEmpty!3258 (= (arr!1875 (_values!2245 newMap!16)) (store mapRest!3258 mapKey!3258 mapValue!3257))))

(declare-fun b!77136 () Bool)

(declare-fun e!50378 () Bool)

(declare-fun e!50369 () Bool)

(assert (=> b!77136 (= e!50378 (and e!50369 mapRes!3257))))

(declare-fun condMapEmpty!3258 () Bool)

(declare-fun mapDefault!3257 () ValueCell!905)

(assert (=> b!77136 (= condMapEmpty!3258 (= (arr!1875 (_values!2245 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!905)) mapDefault!3257)))))

(declare-fun b!77137 () Bool)

(declare-fun res!40535 () Bool)

(assert (=> b!77137 (=> (not res!40535) (not e!50379))))

(assert (=> b!77137 (= res!40535 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6253 newMap!16)) (_size!408 (v!2580 (underlying!274 thiss!992)))))))

(declare-fun b!77138 () Bool)

(declare-fun Unit!2225 () Unit!2222)

(assert (=> b!77138 (= e!50372 Unit!2225)))

(assert (=> b!77139 (= e!50380 (and tp!8681 tp_is_empty!2497 (array_inv!1149 (_keys!3922 newMap!16)) (array_inv!1150 (_values!2245 newMap!16)) e!50378))))

(declare-fun b!77140 () Bool)

(assert (=> b!77140 (= e!50369 tp_is_empty!2497)))

(assert (= (and start!10140 res!40538) b!77134))

(assert (= (and b!77134 res!40536) b!77126))

(assert (= (and b!77126 res!40534) b!77137))

(assert (= (and b!77137 res!40535) b!77135))

(assert (= (and b!77135 res!40539) b!77122))

(assert (= (and b!77122 res!40537) b!77133))

(assert (= (and b!77133 c!11792) b!77124))

(assert (= (and b!77133 (not c!11792)) b!77138))

(assert (= (and b!77133 res!40533) b!77127))

(assert (= (and b!77128 condMapEmpty!3257) mapIsEmpty!3258))

(assert (= (and b!77128 (not condMapEmpty!3257)) mapNonEmpty!3257))

(get-info :version)

(assert (= (and mapNonEmpty!3257 ((_ is ValueCellFull!905) mapValue!3258)) b!77123))

(assert (= (and b!77128 ((_ is ValueCellFull!905) mapDefault!3258)) b!77129))

(assert (= b!77131 b!77128))

(assert (= b!77132 b!77131))

(assert (= b!77130 b!77132))

(assert (= start!10140 b!77130))

(assert (= (and b!77136 condMapEmpty!3258) mapIsEmpty!3257))

(assert (= (and b!77136 (not condMapEmpty!3258)) mapNonEmpty!3258))

(assert (= (and mapNonEmpty!3258 ((_ is ValueCellFull!905) mapValue!3257)) b!77125))

(assert (= (and b!77136 ((_ is ValueCellFull!905) mapDefault!3257)) b!77140))

(assert (= b!77139 b!77136))

(assert (= start!10140 b!77139))

(declare-fun b_lambda!3467 () Bool)

(assert (=> (not b_lambda!3467) (not b!77122)))

(declare-fun t!5098 () Bool)

(declare-fun tb!1585 () Bool)

(assert (=> (and b!77131 (= (defaultEntry!2262 (v!2580 (underlying!274 thiss!992))) (defaultEntry!2262 (v!2580 (underlying!274 thiss!992)))) t!5098) tb!1585))

(declare-fun result!2763 () Bool)

(assert (=> tb!1585 (= result!2763 tp_is_empty!2497)))

(assert (=> b!77122 t!5098))

(declare-fun b_and!4729 () Bool)

(assert (= b_and!4725 (and (=> t!5098 result!2763) b_and!4729)))

(declare-fun tb!1587 () Bool)

(declare-fun t!5100 () Bool)

(assert (=> (and b!77139 (= (defaultEntry!2262 newMap!16) (defaultEntry!2262 (v!2580 (underlying!274 thiss!992)))) t!5100) tb!1587))

(declare-fun result!2767 () Bool)

(assert (= result!2767 result!2763))

(assert (=> b!77122 t!5100))

(declare-fun b_and!4731 () Bool)

(assert (= b_and!4727 (and (=> t!5100 result!2767) b_and!4731)))

(declare-fun m!77249 () Bool)

(assert (=> b!77124 m!77249))

(declare-fun m!77251 () Bool)

(assert (=> b!77124 m!77251))

(declare-fun m!77253 () Bool)

(assert (=> b!77124 m!77253))

(declare-fun m!77255 () Bool)

(assert (=> b!77124 m!77255))

(assert (=> b!77124 m!77253))

(assert (=> b!77124 m!77253))

(declare-fun m!77257 () Bool)

(assert (=> b!77124 m!77257))

(assert (=> b!77124 m!77253))

(declare-fun m!77259 () Bool)

(assert (=> b!77124 m!77259))

(declare-fun m!77261 () Bool)

(assert (=> b!77126 m!77261))

(assert (=> b!77127 m!77253))

(declare-fun m!77263 () Bool)

(assert (=> b!77127 m!77263))

(declare-fun m!77265 () Bool)

(assert (=> b!77127 m!77265))

(declare-fun m!77267 () Bool)

(assert (=> b!77127 m!77267))

(declare-fun m!77269 () Bool)

(assert (=> b!77127 m!77269))

(declare-fun m!77271 () Bool)

(assert (=> b!77127 m!77271))

(assert (=> b!77127 m!77265))

(assert (=> b!77127 m!77253))

(assert (=> b!77127 m!77269))

(declare-fun m!77273 () Bool)

(assert (=> b!77127 m!77273))

(declare-fun m!77275 () Bool)

(assert (=> start!10140 m!77275))

(declare-fun m!77277 () Bool)

(assert (=> mapNonEmpty!3258 m!77277))

(declare-fun m!77279 () Bool)

(assert (=> b!77139 m!77279))

(declare-fun m!77281 () Bool)

(assert (=> b!77139 m!77281))

(assert (=> b!77122 m!77253))

(declare-fun m!77283 () Bool)

(assert (=> b!77122 m!77283))

(declare-fun m!77285 () Bool)

(assert (=> b!77122 m!77285))

(assert (=> b!77122 m!77283))

(assert (=> b!77122 m!77285))

(declare-fun m!77287 () Bool)

(assert (=> b!77122 m!77287))

(declare-fun m!77289 () Bool)

(assert (=> b!77131 m!77289))

(declare-fun m!77291 () Bool)

(assert (=> b!77131 m!77291))

(assert (=> b!77133 m!77253))

(assert (=> b!77133 m!77253))

(declare-fun m!77293 () Bool)

(assert (=> b!77133 m!77293))

(assert (=> b!77133 m!77253))

(declare-fun m!77295 () Bool)

(assert (=> b!77133 m!77295))

(declare-fun m!77297 () Bool)

(assert (=> mapNonEmpty!3257 m!77297))

(declare-fun m!77299 () Bool)

(assert (=> b!77135 m!77299))

(declare-fun m!77301 () Bool)

(assert (=> b!77135 m!77301))

(check-sat (not mapNonEmpty!3258) (not b!77131) b_and!4731 (not b!77124) (not b_next!2161) (not b!77139) (not b_next!2163) b_and!4729 (not mapNonEmpty!3257) (not b!77126) (not b_lambda!3467) (not b!77135) (not b!77122) (not b!77127) tp_is_empty!2497 (not b!77133) (not start!10140))
(check-sat b_and!4729 b_and!4731 (not b_next!2161) (not b_next!2163))
