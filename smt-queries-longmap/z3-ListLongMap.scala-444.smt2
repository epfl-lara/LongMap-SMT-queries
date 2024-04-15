; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8280 () Bool)

(assert start!8280)

(declare-fun b!53276 () Bool)

(declare-fun b_free!1717 () Bool)

(declare-fun b_next!1717 () Bool)

(assert (=> b!53276 (= b_free!1717 (not b_next!1717))))

(declare-fun tp!7251 () Bool)

(declare-fun b_and!2977 () Bool)

(assert (=> b!53276 (= tp!7251 b_and!2977)))

(declare-fun b!53277 () Bool)

(declare-fun b_free!1719 () Bool)

(declare-fun b_next!1719 () Bool)

(assert (=> b!53277 (= b_free!1719 (not b_next!1719))))

(declare-fun tp!7254 () Bool)

(declare-fun b_and!2979 () Bool)

(assert (=> b!53277 (= tp!7254 b_and!2979)))

(declare-fun b!53274 () Bool)

(declare-fun e!34754 () Bool)

(declare-fun tp_is_empty!2275 () Bool)

(assert (=> b!53274 (= e!34754 tp_is_empty!2275)))

(declare-fun b!53275 () Bool)

(declare-fun res!30232 () Bool)

(declare-fun e!34748 () Bool)

(assert (=> b!53275 (=> (not res!30232) (not e!34748))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!2681 0))(
  ( (V!2682 (val!1182 Int)) )
))
(declare-datatypes ((array!3453 0))(
  ( (array!3454 (arr!1648 (Array (_ BitVec 32) (_ BitVec 64))) (size!1878 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!794 0))(
  ( (ValueCellFull!794 (v!2249 V!2681)) (EmptyCell!794) )
))
(declare-datatypes ((array!3455 0))(
  ( (array!3456 (arr!1649 (Array (_ BitVec 32) ValueCell!794)) (size!1879 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!496 0))(
  ( (LongMapFixedSize!497 (defaultEntry!1962 Int) (mask!5796 (_ BitVec 32)) (extraKeys!1853 (_ BitVec 32)) (zeroValue!1880 V!2681) (minValue!1880 V!2681) (_size!297 (_ BitVec 32)) (_keys!3581 array!3453) (_values!1945 array!3455) (_vacant!297 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!314 0))(
  ( (Cell!315 (v!2250 LongMapFixedSize!496)) )
))
(declare-datatypes ((LongMap!314 0))(
  ( (LongMap!315 (underlying!168 Cell!314)) )
))
(declare-fun thiss!992 () LongMap!314)

(assert (=> b!53275 (= res!30232 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1878 (_keys!3581 (v!2250 (underlying!168 thiss!992)))))))))

(declare-fun mapIsEmpty!2495 () Bool)

(declare-fun mapRes!2496 () Bool)

(assert (=> mapIsEmpty!2495 mapRes!2496))

(declare-fun mapIsEmpty!2496 () Bool)

(declare-fun mapRes!2495 () Bool)

(assert (=> mapIsEmpty!2496 mapRes!2495))

(declare-fun e!34759 () Bool)

(declare-fun e!34750 () Bool)

(declare-fun array_inv!1007 (array!3453) Bool)

(declare-fun array_inv!1008 (array!3455) Bool)

(assert (=> b!53276 (= e!34759 (and tp!7251 tp_is_empty!2275 (array_inv!1007 (_keys!3581 (v!2250 (underlying!168 thiss!992)))) (array_inv!1008 (_values!1945 (v!2250 (underlying!168 thiss!992)))) e!34750))))

(declare-fun e!34751 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!496)

(declare-fun e!34752 () Bool)

(assert (=> b!53277 (= e!34751 (and tp!7254 tp_is_empty!2275 (array_inv!1007 (_keys!3581 newMap!16)) (array_inv!1008 (_values!1945 newMap!16)) e!34752))))

(declare-fun b!53278 () Bool)

(declare-fun res!30228 () Bool)

(declare-fun e!34755 () Bool)

(assert (=> b!53278 (=> (not res!30228) (not e!34755))))

(declare-datatypes ((List!1354 0))(
  ( (Nil!1351) (Cons!1350 (h!1930 (_ BitVec 64)) (t!4439 List!1354)) )
))
(declare-fun arrayNoDuplicates!0 (array!3453 (_ BitVec 32) List!1354) Bool)

(assert (=> b!53278 (= res!30228 (arrayNoDuplicates!0 (_keys!3581 (v!2250 (underlying!168 thiss!992))) #b00000000000000000000000000000000 Nil!1351))))

(declare-fun b!53279 () Bool)

(declare-fun e!34747 () Bool)

(declare-fun e!34758 () Bool)

(assert (=> b!53279 (= e!34747 e!34758)))

(declare-fun b!53280 () Bool)

(declare-fun res!30236 () Bool)

(assert (=> b!53280 (=> (not res!30236) (not e!34755))))

(assert (=> b!53280 (= res!30236 (and (= (size!1879 (_values!1945 (v!2250 (underlying!168 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5796 (v!2250 (underlying!168 thiss!992))))) (= (size!1878 (_keys!3581 (v!2250 (underlying!168 thiss!992)))) (size!1879 (_values!1945 (v!2250 (underlying!168 thiss!992))))) (bvsge (mask!5796 (v!2250 (underlying!168 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1853 (v!2250 (underlying!168 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1853 (v!2250 (underlying!168 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!53282 () Bool)

(declare-fun res!30235 () Bool)

(assert (=> b!53282 (=> (not res!30235) (not e!34748))))

(assert (=> b!53282 (= res!30235 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5796 newMap!16)) (_size!297 (v!2250 (underlying!168 thiss!992)))))))

(declare-fun b!53283 () Bool)

(declare-fun e!34746 () Bool)

(assert (=> b!53283 (= e!34748 e!34746)))

(declare-fun res!30234 () Bool)

(assert (=> b!53283 (=> (not res!30234) (not e!34746))))

(declare-datatypes ((tuple2!1888 0))(
  ( (tuple2!1889 (_1!955 (_ BitVec 64)) (_2!955 V!2681)) )
))
(declare-datatypes ((List!1355 0))(
  ( (Nil!1352) (Cons!1351 (h!1931 tuple2!1888) (t!4440 List!1355)) )
))
(declare-datatypes ((ListLongMap!1275 0))(
  ( (ListLongMap!1276 (toList!653 List!1355)) )
))
(declare-fun lt!21433 () ListLongMap!1275)

(declare-fun lt!21431 () ListLongMap!1275)

(assert (=> b!53283 (= res!30234 (and (= lt!21431 lt!21433) (not (= (select (arr!1648 (_keys!3581 (v!2250 (underlying!168 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1648 (_keys!3581 (v!2250 (underlying!168 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1031 (LongMapFixedSize!496) ListLongMap!1275)

(assert (=> b!53283 (= lt!21433 (map!1031 newMap!16))))

(declare-fun getCurrentListMap!357 (array!3453 array!3455 (_ BitVec 32) (_ BitVec 32) V!2681 V!2681 (_ BitVec 32) Int) ListLongMap!1275)

(assert (=> b!53283 (= lt!21431 (getCurrentListMap!357 (_keys!3581 (v!2250 (underlying!168 thiss!992))) (_values!1945 (v!2250 (underlying!168 thiss!992))) (mask!5796 (v!2250 (underlying!168 thiss!992))) (extraKeys!1853 (v!2250 (underlying!168 thiss!992))) (zeroValue!1880 (v!2250 (underlying!168 thiss!992))) (minValue!1880 (v!2250 (underlying!168 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1962 (v!2250 (underlying!168 thiss!992)))))))

(declare-fun b!53284 () Bool)

(declare-fun e!34753 () Bool)

(assert (=> b!53284 (= e!34753 tp_is_empty!2275)))

(declare-fun b!53285 () Bool)

(assert (=> b!53285 (= e!34758 e!34759)))

(declare-fun mapNonEmpty!2495 () Bool)

(declare-fun tp!7253 () Bool)

(declare-fun e!34756 () Bool)

(assert (=> mapNonEmpty!2495 (= mapRes!2496 (and tp!7253 e!34756))))

(declare-fun mapRest!2496 () (Array (_ BitVec 32) ValueCell!794))

(declare-fun mapKey!2496 () (_ BitVec 32))

(declare-fun mapValue!2495 () ValueCell!794)

(assert (=> mapNonEmpty!2495 (= (arr!1649 (_values!1945 (v!2250 (underlying!168 thiss!992)))) (store mapRest!2496 mapKey!2496 mapValue!2495))))

(declare-fun b!53286 () Bool)

(assert (=> b!53286 (= e!34752 (and e!34753 mapRes!2495))))

(declare-fun condMapEmpty!2496 () Bool)

(declare-fun mapDefault!2496 () ValueCell!794)

(assert (=> b!53286 (= condMapEmpty!2496 (= (arr!1649 (_values!1945 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!794)) mapDefault!2496)))))

(declare-fun b!53287 () Bool)

(declare-fun res!30229 () Bool)

(assert (=> b!53287 (=> (not res!30229) (not e!34755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!53287 (= res!30229 (validMask!0 (mask!5796 (v!2250 (underlying!168 thiss!992)))))))

(declare-fun mapNonEmpty!2496 () Bool)

(declare-fun tp!7252 () Bool)

(declare-fun e!34749 () Bool)

(assert (=> mapNonEmpty!2496 (= mapRes!2495 (and tp!7252 e!34749))))

(declare-fun mapRest!2495 () (Array (_ BitVec 32) ValueCell!794))

(declare-fun mapKey!2495 () (_ BitVec 32))

(declare-fun mapValue!2496 () ValueCell!794)

(assert (=> mapNonEmpty!2496 (= (arr!1649 (_values!1945 newMap!16)) (store mapRest!2495 mapKey!2495 mapValue!2496))))

(declare-fun b!53288 () Bool)

(declare-fun res!30237 () Bool)

(assert (=> b!53288 (=> (not res!30237) (not e!34748))))

(declare-fun valid!191 (LongMapFixedSize!496) Bool)

(assert (=> b!53288 (= res!30237 (valid!191 newMap!16))))

(declare-fun b!53289 () Bool)

(assert (=> b!53289 (= e!34749 tp_is_empty!2275)))

(declare-fun res!30231 () Bool)

(assert (=> start!8280 (=> (not res!30231) (not e!34748))))

(declare-fun valid!192 (LongMap!314) Bool)

(assert (=> start!8280 (= res!30231 (valid!192 thiss!992))))

(assert (=> start!8280 e!34748))

(assert (=> start!8280 e!34747))

(assert (=> start!8280 true))

(assert (=> start!8280 e!34751))

(declare-fun b!53281 () Bool)

(assert (=> b!53281 (= e!34755 false)))

(declare-fun lt!21432 () Bool)

(declare-fun contains!630 (ListLongMap!1275 (_ BitVec 64)) Bool)

(assert (=> b!53281 (= lt!21432 (contains!630 lt!21431 (select (arr!1648 (_keys!3581 (v!2250 (underlying!168 thiss!992)))) from!355)))))

(declare-fun b!53290 () Bool)

(assert (=> b!53290 (= e!34746 e!34755)))

(declare-fun res!30227 () Bool)

(assert (=> b!53290 (=> (not res!30227) (not e!34755))))

(assert (=> b!53290 (= res!30227 (contains!630 lt!21433 (select (arr!1648 (_keys!3581 (v!2250 (underlying!168 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1890 0))(
  ( (tuple2!1891 (_1!956 Bool) (_2!956 LongMapFixedSize!496)) )
))
(declare-fun lt!21434 () tuple2!1890)

(declare-fun update!51 (LongMapFixedSize!496 (_ BitVec 64) V!2681) tuple2!1890)

(declare-fun get!995 (ValueCell!794 V!2681) V!2681)

(declare-fun dynLambda!275 (Int (_ BitVec 64)) V!2681)

(assert (=> b!53290 (= lt!21434 (update!51 newMap!16 (select (arr!1648 (_keys!3581 (v!2250 (underlying!168 thiss!992)))) from!355) (get!995 (select (arr!1649 (_values!1945 (v!2250 (underlying!168 thiss!992)))) from!355) (dynLambda!275 (defaultEntry!1962 (v!2250 (underlying!168 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!53291 () Bool)

(assert (=> b!53291 (= e!34756 tp_is_empty!2275)))

(declare-fun b!53292 () Bool)

(declare-fun res!30230 () Bool)

(assert (=> b!53292 (=> (not res!30230) (not e!34755))))

(assert (=> b!53292 (= res!30230 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1878 (_keys!3581 (v!2250 (underlying!168 thiss!992)))))))))

(declare-fun b!53293 () Bool)

(assert (=> b!53293 (= e!34750 (and e!34754 mapRes!2496))))

(declare-fun condMapEmpty!2495 () Bool)

(declare-fun mapDefault!2495 () ValueCell!794)

(assert (=> b!53293 (= condMapEmpty!2495 (= (arr!1649 (_values!1945 (v!2250 (underlying!168 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!794)) mapDefault!2495)))))

(declare-fun b!53294 () Bool)

(declare-fun res!30233 () Bool)

(assert (=> b!53294 (=> (not res!30233) (not e!34755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3453 (_ BitVec 32)) Bool)

(assert (=> b!53294 (= res!30233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3581 (v!2250 (underlying!168 thiss!992))) (mask!5796 (v!2250 (underlying!168 thiss!992)))))))

(assert (= (and start!8280 res!30231) b!53275))

(assert (= (and b!53275 res!30232) b!53288))

(assert (= (and b!53288 res!30237) b!53282))

(assert (= (and b!53282 res!30235) b!53283))

(assert (= (and b!53283 res!30234) b!53290))

(assert (= (and b!53290 res!30227) b!53287))

(assert (= (and b!53287 res!30229) b!53280))

(assert (= (and b!53280 res!30236) b!53294))

(assert (= (and b!53294 res!30233) b!53278))

(assert (= (and b!53278 res!30228) b!53292))

(assert (= (and b!53292 res!30230) b!53281))

(assert (= (and b!53293 condMapEmpty!2495) mapIsEmpty!2495))

(assert (= (and b!53293 (not condMapEmpty!2495)) mapNonEmpty!2495))

(get-info :version)

(assert (= (and mapNonEmpty!2495 ((_ is ValueCellFull!794) mapValue!2495)) b!53291))

(assert (= (and b!53293 ((_ is ValueCellFull!794) mapDefault!2495)) b!53274))

(assert (= b!53276 b!53293))

(assert (= b!53285 b!53276))

(assert (= b!53279 b!53285))

(assert (= start!8280 b!53279))

(assert (= (and b!53286 condMapEmpty!2496) mapIsEmpty!2496))

(assert (= (and b!53286 (not condMapEmpty!2496)) mapNonEmpty!2496))

(assert (= (and mapNonEmpty!2496 ((_ is ValueCellFull!794) mapValue!2496)) b!53289))

(assert (= (and b!53286 ((_ is ValueCellFull!794) mapDefault!2496)) b!53284))

(assert (= b!53277 b!53286))

(assert (= start!8280 b!53277))

(declare-fun b_lambda!2373 () Bool)

(assert (=> (not b_lambda!2373) (not b!53290)))

(declare-fun t!4436 () Bool)

(declare-fun tb!1061 () Bool)

(assert (=> (and b!53276 (= (defaultEntry!1962 (v!2250 (underlying!168 thiss!992))) (defaultEntry!1962 (v!2250 (underlying!168 thiss!992)))) t!4436) tb!1061))

(declare-fun result!1989 () Bool)

(assert (=> tb!1061 (= result!1989 tp_is_empty!2275)))

(assert (=> b!53290 t!4436))

(declare-fun b_and!2981 () Bool)

(assert (= b_and!2977 (and (=> t!4436 result!1989) b_and!2981)))

(declare-fun tb!1063 () Bool)

(declare-fun t!4438 () Bool)

(assert (=> (and b!53277 (= (defaultEntry!1962 newMap!16) (defaultEntry!1962 (v!2250 (underlying!168 thiss!992)))) t!4438) tb!1063))

(declare-fun result!1993 () Bool)

(assert (= result!1993 result!1989))

(assert (=> b!53290 t!4438))

(declare-fun b_and!2983 () Bool)

(assert (= b_and!2979 (and (=> t!4438 result!1993) b_and!2983)))

(declare-fun m!45283 () Bool)

(assert (=> b!53288 m!45283))

(declare-fun m!45285 () Bool)

(assert (=> b!53283 m!45285))

(declare-fun m!45287 () Bool)

(assert (=> b!53283 m!45287))

(declare-fun m!45289 () Bool)

(assert (=> b!53283 m!45289))

(assert (=> b!53281 m!45285))

(assert (=> b!53281 m!45285))

(declare-fun m!45291 () Bool)

(assert (=> b!53281 m!45291))

(declare-fun m!45293 () Bool)

(assert (=> b!53276 m!45293))

(declare-fun m!45295 () Bool)

(assert (=> b!53276 m!45295))

(declare-fun m!45297 () Bool)

(assert (=> b!53277 m!45297))

(declare-fun m!45299 () Bool)

(assert (=> b!53277 m!45299))

(declare-fun m!45301 () Bool)

(assert (=> mapNonEmpty!2495 m!45301))

(declare-fun m!45303 () Bool)

(assert (=> b!53287 m!45303))

(declare-fun m!45305 () Bool)

(assert (=> start!8280 m!45305))

(declare-fun m!45307 () Bool)

(assert (=> b!53278 m!45307))

(declare-fun m!45309 () Bool)

(assert (=> mapNonEmpty!2496 m!45309))

(declare-fun m!45311 () Bool)

(assert (=> b!53294 m!45311))

(declare-fun m!45313 () Bool)

(assert (=> b!53290 m!45313))

(declare-fun m!45315 () Bool)

(assert (=> b!53290 m!45315))

(declare-fun m!45317 () Bool)

(assert (=> b!53290 m!45317))

(assert (=> b!53290 m!45285))

(assert (=> b!53290 m!45315))

(assert (=> b!53290 m!45285))

(declare-fun m!45319 () Bool)

(assert (=> b!53290 m!45319))

(assert (=> b!53290 m!45285))

(assert (=> b!53290 m!45317))

(declare-fun m!45321 () Bool)

(assert (=> b!53290 m!45321))

(assert (=> b!53290 m!45313))

(check-sat (not b!53287) (not b_next!1719) tp_is_empty!2275 (not b!53294) b_and!2981 (not b_lambda!2373) (not mapNonEmpty!2496) (not start!8280) (not b!53283) (not b!53276) (not mapNonEmpty!2495) (not b!53288) b_and!2983 (not b!53281) (not b!53278) (not b!53290) (not b_next!1717) (not b!53277))
(check-sat b_and!2981 b_and!2983 (not b_next!1717) (not b_next!1719))
