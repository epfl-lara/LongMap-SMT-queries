; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8280 () Bool)

(assert start!8280)

(declare-fun b!53287 () Bool)

(declare-fun b_free!1717 () Bool)

(declare-fun b_next!1717 () Bool)

(assert (=> b!53287 (= b_free!1717 (not b_next!1717))))

(declare-fun tp!7253 () Bool)

(declare-fun b_and!2973 () Bool)

(assert (=> b!53287 (= tp!7253 b_and!2973)))

(declare-fun b!53303 () Bool)

(declare-fun b_free!1719 () Bool)

(declare-fun b_next!1719 () Bool)

(assert (=> b!53303 (= b_free!1719 (not b_next!1719))))

(declare-fun tp!7252 () Bool)

(declare-fun b_and!2975 () Bool)

(assert (=> b!53303 (= tp!7252 b_and!2975)))

(declare-fun b!53283 () Bool)

(declare-fun res!30225 () Bool)

(declare-fun e!34759 () Bool)

(assert (=> b!53283 (=> (not res!30225) (not e!34759))))

(declare-datatypes ((V!2681 0))(
  ( (V!2682 (val!1182 Int)) )
))
(declare-datatypes ((array!3459 0))(
  ( (array!3460 (arr!1652 (Array (_ BitVec 32) (_ BitVec 64))) (size!1881 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!794 0))(
  ( (ValueCellFull!794 (v!2253 V!2681)) (EmptyCell!794) )
))
(declare-datatypes ((array!3461 0))(
  ( (array!3462 (arr!1653 (Array (_ BitVec 32) ValueCell!794)) (size!1882 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!496 0))(
  ( (LongMapFixedSize!497 (defaultEntry!1962 Int) (mask!5797 (_ BitVec 32)) (extraKeys!1853 (_ BitVec 32)) (zeroValue!1880 V!2681) (minValue!1880 V!2681) (_size!297 (_ BitVec 32)) (_keys!3582 array!3459) (_values!1945 array!3461) (_vacant!297 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!316 0))(
  ( (Cell!317 (v!2254 LongMapFixedSize!496)) )
))
(declare-datatypes ((LongMap!316 0))(
  ( (LongMap!317 (underlying!169 Cell!316)) )
))
(declare-fun thiss!992 () LongMap!316)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!53283 (= res!30225 (validMask!0 (mask!5797 (v!2254 (underlying!169 thiss!992)))))))

(declare-fun res!30224 () Bool)

(declare-fun e!34751 () Bool)

(assert (=> start!8280 (=> (not res!30224) (not e!34751))))

(declare-fun valid!192 (LongMap!316) Bool)

(assert (=> start!8280 (= res!30224 (valid!192 thiss!992))))

(assert (=> start!8280 e!34751))

(declare-fun e!34761 () Bool)

(assert (=> start!8280 e!34761))

(assert (=> start!8280 true))

(declare-fun e!34762 () Bool)

(assert (=> start!8280 e!34762))

(declare-fun b!53284 () Bool)

(declare-fun res!30231 () Bool)

(assert (=> b!53284 (=> (not res!30231) (not e!34751))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!53284 (= res!30231 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1881 (_keys!3582 (v!2254 (underlying!169 thiss!992)))))))))

(declare-fun b!53285 () Bool)

(declare-fun e!34756 () Bool)

(declare-fun tp_is_empty!2275 () Bool)

(assert (=> b!53285 (= e!34756 tp_is_empty!2275)))

(declare-fun mapNonEmpty!2495 () Bool)

(declare-fun mapRes!2495 () Bool)

(declare-fun tp!7251 () Bool)

(declare-fun e!34763 () Bool)

(assert (=> mapNonEmpty!2495 (= mapRes!2495 (and tp!7251 e!34763))))

(declare-fun mapKey!2496 () (_ BitVec 32))

(declare-fun mapValue!2495 () ValueCell!794)

(declare-fun newMap!16 () LongMapFixedSize!496)

(declare-fun mapRest!2495 () (Array (_ BitVec 32) ValueCell!794))

(assert (=> mapNonEmpty!2495 (= (arr!1653 (_values!1945 newMap!16)) (store mapRest!2495 mapKey!2496 mapValue!2495))))

(declare-fun b!53286 () Bool)

(declare-fun res!30229 () Bool)

(assert (=> b!53286 (=> (not res!30229) (not e!34759))))

(assert (=> b!53286 (= res!30229 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1881 (_keys!3582 (v!2254 (underlying!169 thiss!992)))))))))

(declare-fun e!34765 () Bool)

(declare-fun e!34753 () Bool)

(declare-fun array_inv!1005 (array!3459) Bool)

(declare-fun array_inv!1006 (array!3461) Bool)

(assert (=> b!53287 (= e!34753 (and tp!7253 tp_is_empty!2275 (array_inv!1005 (_keys!3582 (v!2254 (underlying!169 thiss!992)))) (array_inv!1006 (_values!1945 (v!2254 (underlying!169 thiss!992)))) e!34765))))

(declare-fun b!53288 () Bool)

(declare-fun res!30232 () Bool)

(assert (=> b!53288 (=> (not res!30232) (not e!34751))))

(declare-fun valid!193 (LongMapFixedSize!496) Bool)

(assert (=> b!53288 (= res!30232 (valid!193 newMap!16))))

(declare-fun b!53289 () Bool)

(assert (=> b!53289 (= e!34763 tp_is_empty!2275)))

(declare-fun b!53290 () Bool)

(declare-fun e!34758 () Bool)

(assert (=> b!53290 (= e!34758 e!34759)))

(declare-fun res!30228 () Bool)

(assert (=> b!53290 (=> (not res!30228) (not e!34759))))

(declare-datatypes ((tuple2!1864 0))(
  ( (tuple2!1865 (_1!943 (_ BitVec 64)) (_2!943 V!2681)) )
))
(declare-datatypes ((List!1340 0))(
  ( (Nil!1337) (Cons!1336 (h!1916 tuple2!1864) (t!4426 List!1340)) )
))
(declare-datatypes ((ListLongMap!1259 0))(
  ( (ListLongMap!1260 (toList!645 List!1340)) )
))
(declare-fun lt!21406 () ListLongMap!1259)

(declare-fun contains!624 (ListLongMap!1259 (_ BitVec 64)) Bool)

(assert (=> b!53290 (= res!30228 (contains!624 lt!21406 (select (arr!1652 (_keys!3582 (v!2254 (underlying!169 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1866 0))(
  ( (tuple2!1867 (_1!944 Bool) (_2!944 LongMapFixedSize!496)) )
))
(declare-fun lt!21405 () tuple2!1866)

(declare-fun update!53 (LongMapFixedSize!496 (_ BitVec 64) V!2681) tuple2!1866)

(declare-fun get!994 (ValueCell!794 V!2681) V!2681)

(declare-fun dynLambda!271 (Int (_ BitVec 64)) V!2681)

(assert (=> b!53290 (= lt!21405 (update!53 newMap!16 (select (arr!1652 (_keys!3582 (v!2254 (underlying!169 thiss!992)))) from!355) (get!994 (select (arr!1653 (_values!1945 (v!2254 (underlying!169 thiss!992)))) from!355) (dynLambda!271 (defaultEntry!1962 (v!2254 (underlying!169 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!53291 () Bool)

(declare-fun e!34757 () Bool)

(assert (=> b!53291 (= e!34761 e!34757)))

(declare-fun b!53292 () Bool)

(assert (=> b!53292 (= e!34757 e!34753)))

(declare-fun b!53293 () Bool)

(declare-fun res!30223 () Bool)

(assert (=> b!53293 (=> (not res!30223) (not e!34759))))

(assert (=> b!53293 (= res!30223 (and (= (size!1882 (_values!1945 (v!2254 (underlying!169 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5797 (v!2254 (underlying!169 thiss!992))))) (= (size!1881 (_keys!3582 (v!2254 (underlying!169 thiss!992)))) (size!1882 (_values!1945 (v!2254 (underlying!169 thiss!992))))) (bvsge (mask!5797 (v!2254 (underlying!169 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1853 (v!2254 (underlying!169 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1853 (v!2254 (underlying!169 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!2495 () Bool)

(assert (=> mapIsEmpty!2495 mapRes!2495))

(declare-fun b!53294 () Bool)

(declare-fun res!30230 () Bool)

(assert (=> b!53294 (=> (not res!30230) (not e!34759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3459 (_ BitVec 32)) Bool)

(assert (=> b!53294 (= res!30230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3582 (v!2254 (underlying!169 thiss!992))) (mask!5797 (v!2254 (underlying!169 thiss!992)))))))

(declare-fun b!53295 () Bool)

(declare-fun e!34764 () Bool)

(declare-fun e!34754 () Bool)

(assert (=> b!53295 (= e!34764 (and e!34754 mapRes!2495))))

(declare-fun condMapEmpty!2496 () Bool)

(declare-fun mapDefault!2496 () ValueCell!794)

(assert (=> b!53295 (= condMapEmpty!2496 (= (arr!1653 (_values!1945 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!794)) mapDefault!2496)))))

(declare-fun b!53296 () Bool)

(declare-fun res!30222 () Bool)

(assert (=> b!53296 (=> (not res!30222) (not e!34759))))

(declare-datatypes ((List!1341 0))(
  ( (Nil!1338) (Cons!1337 (h!1917 (_ BitVec 64)) (t!4427 List!1341)) )
))
(declare-fun arrayNoDuplicates!0 (array!3459 (_ BitVec 32) List!1341) Bool)

(assert (=> b!53296 (= res!30222 (arrayNoDuplicates!0 (_keys!3582 (v!2254 (underlying!169 thiss!992))) #b00000000000000000000000000000000 Nil!1338))))

(declare-fun b!53297 () Bool)

(assert (=> b!53297 (= e!34754 tp_is_empty!2275)))

(declare-fun b!53298 () Bool)

(declare-fun e!34760 () Bool)

(assert (=> b!53298 (= e!34760 tp_is_empty!2275)))

(declare-fun b!53299 () Bool)

(assert (=> b!53299 (= e!34759 false)))

(declare-fun lt!21407 () Bool)

(declare-fun lt!21404 () ListLongMap!1259)

(assert (=> b!53299 (= lt!21407 (contains!624 lt!21404 (select (arr!1652 (_keys!3582 (v!2254 (underlying!169 thiss!992)))) from!355)))))

(declare-fun b!53300 () Bool)

(declare-fun mapRes!2496 () Bool)

(assert (=> b!53300 (= e!34765 (and e!34756 mapRes!2496))))

(declare-fun condMapEmpty!2495 () Bool)

(declare-fun mapDefault!2495 () ValueCell!794)

(assert (=> b!53300 (= condMapEmpty!2495 (= (arr!1653 (_values!1945 (v!2254 (underlying!169 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!794)) mapDefault!2495)))))

(declare-fun b!53301 () Bool)

(assert (=> b!53301 (= e!34751 e!34758)))

(declare-fun res!30226 () Bool)

(assert (=> b!53301 (=> (not res!30226) (not e!34758))))

(assert (=> b!53301 (= res!30226 (and (= lt!21404 lt!21406) (not (= (select (arr!1652 (_keys!3582 (v!2254 (underlying!169 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1652 (_keys!3582 (v!2254 (underlying!169 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1030 (LongMapFixedSize!496) ListLongMap!1259)

(assert (=> b!53301 (= lt!21406 (map!1030 newMap!16))))

(declare-fun getCurrentListMap!350 (array!3459 array!3461 (_ BitVec 32) (_ BitVec 32) V!2681 V!2681 (_ BitVec 32) Int) ListLongMap!1259)

(assert (=> b!53301 (= lt!21404 (getCurrentListMap!350 (_keys!3582 (v!2254 (underlying!169 thiss!992))) (_values!1945 (v!2254 (underlying!169 thiss!992))) (mask!5797 (v!2254 (underlying!169 thiss!992))) (extraKeys!1853 (v!2254 (underlying!169 thiss!992))) (zeroValue!1880 (v!2254 (underlying!169 thiss!992))) (minValue!1880 (v!2254 (underlying!169 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1962 (v!2254 (underlying!169 thiss!992)))))))

(declare-fun b!53302 () Bool)

(declare-fun res!30227 () Bool)

(assert (=> b!53302 (=> (not res!30227) (not e!34751))))

(assert (=> b!53302 (= res!30227 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5797 newMap!16)) (_size!297 (v!2254 (underlying!169 thiss!992)))))))

(declare-fun mapIsEmpty!2496 () Bool)

(assert (=> mapIsEmpty!2496 mapRes!2496))

(assert (=> b!53303 (= e!34762 (and tp!7252 tp_is_empty!2275 (array_inv!1005 (_keys!3582 newMap!16)) (array_inv!1006 (_values!1945 newMap!16)) e!34764))))

(declare-fun mapNonEmpty!2496 () Bool)

(declare-fun tp!7254 () Bool)

(assert (=> mapNonEmpty!2496 (= mapRes!2496 (and tp!7254 e!34760))))

(declare-fun mapValue!2496 () ValueCell!794)

(declare-fun mapKey!2495 () (_ BitVec 32))

(declare-fun mapRest!2496 () (Array (_ BitVec 32) ValueCell!794))

(assert (=> mapNonEmpty!2496 (= (arr!1653 (_values!1945 (v!2254 (underlying!169 thiss!992)))) (store mapRest!2496 mapKey!2495 mapValue!2496))))

(assert (= (and start!8280 res!30224) b!53284))

(assert (= (and b!53284 res!30231) b!53288))

(assert (= (and b!53288 res!30232) b!53302))

(assert (= (and b!53302 res!30227) b!53301))

(assert (= (and b!53301 res!30226) b!53290))

(assert (= (and b!53290 res!30228) b!53283))

(assert (= (and b!53283 res!30225) b!53293))

(assert (= (and b!53293 res!30223) b!53294))

(assert (= (and b!53294 res!30230) b!53296))

(assert (= (and b!53296 res!30222) b!53286))

(assert (= (and b!53286 res!30229) b!53299))

(assert (= (and b!53300 condMapEmpty!2495) mapIsEmpty!2496))

(assert (= (and b!53300 (not condMapEmpty!2495)) mapNonEmpty!2496))

(get-info :version)

(assert (= (and mapNonEmpty!2496 ((_ is ValueCellFull!794) mapValue!2496)) b!53298))

(assert (= (and b!53300 ((_ is ValueCellFull!794) mapDefault!2495)) b!53285))

(assert (= b!53287 b!53300))

(assert (= b!53292 b!53287))

(assert (= b!53291 b!53292))

(assert (= start!8280 b!53291))

(assert (= (and b!53295 condMapEmpty!2496) mapIsEmpty!2495))

(assert (= (and b!53295 (not condMapEmpty!2496)) mapNonEmpty!2495))

(assert (= (and mapNonEmpty!2495 ((_ is ValueCellFull!794) mapValue!2495)) b!53289))

(assert (= (and b!53295 ((_ is ValueCellFull!794) mapDefault!2496)) b!53297))

(assert (= b!53303 b!53295))

(assert (= start!8280 b!53303))

(declare-fun b_lambda!2369 () Bool)

(assert (=> (not b_lambda!2369) (not b!53290)))

(declare-fun t!4423 () Bool)

(declare-fun tb!1061 () Bool)

(assert (=> (and b!53287 (= (defaultEntry!1962 (v!2254 (underlying!169 thiss!992))) (defaultEntry!1962 (v!2254 (underlying!169 thiss!992)))) t!4423) tb!1061))

(declare-fun result!1989 () Bool)

(assert (=> tb!1061 (= result!1989 tp_is_empty!2275)))

(assert (=> b!53290 t!4423))

(declare-fun b_and!2977 () Bool)

(assert (= b_and!2973 (and (=> t!4423 result!1989) b_and!2977)))

(declare-fun t!4425 () Bool)

(declare-fun tb!1063 () Bool)

(assert (=> (and b!53303 (= (defaultEntry!1962 newMap!16) (defaultEntry!1962 (v!2254 (underlying!169 thiss!992)))) t!4425) tb!1063))

(declare-fun result!1993 () Bool)

(assert (= result!1993 result!1989))

(assert (=> b!53290 t!4425))

(declare-fun b_and!2979 () Bool)

(assert (= b_and!2975 (and (=> t!4425 result!1993) b_and!2979)))

(declare-fun m!45241 () Bool)

(assert (=> b!53301 m!45241))

(declare-fun m!45243 () Bool)

(assert (=> b!53301 m!45243))

(declare-fun m!45245 () Bool)

(assert (=> b!53301 m!45245))

(declare-fun m!45247 () Bool)

(assert (=> start!8280 m!45247))

(declare-fun m!45249 () Bool)

(assert (=> b!53294 m!45249))

(declare-fun m!45251 () Bool)

(assert (=> b!53288 m!45251))

(declare-fun m!45253 () Bool)

(assert (=> b!53283 m!45253))

(declare-fun m!45255 () Bool)

(assert (=> mapNonEmpty!2496 m!45255))

(declare-fun m!45257 () Bool)

(assert (=> b!53296 m!45257))

(assert (=> b!53290 m!45241))

(declare-fun m!45259 () Bool)

(assert (=> b!53290 m!45259))

(declare-fun m!45261 () Bool)

(assert (=> b!53290 m!45261))

(declare-fun m!45263 () Bool)

(assert (=> b!53290 m!45263))

(declare-fun m!45265 () Bool)

(assert (=> b!53290 m!45265))

(assert (=> b!53290 m!45241))

(assert (=> b!53290 m!45263))

(assert (=> b!53290 m!45241))

(assert (=> b!53290 m!45265))

(declare-fun m!45267 () Bool)

(assert (=> b!53290 m!45267))

(assert (=> b!53290 m!45261))

(declare-fun m!45269 () Bool)

(assert (=> b!53303 m!45269))

(declare-fun m!45271 () Bool)

(assert (=> b!53303 m!45271))

(assert (=> b!53299 m!45241))

(assert (=> b!53299 m!45241))

(declare-fun m!45273 () Bool)

(assert (=> b!53299 m!45273))

(declare-fun m!45275 () Bool)

(assert (=> b!53287 m!45275))

(declare-fun m!45277 () Bool)

(assert (=> b!53287 m!45277))

(declare-fun m!45279 () Bool)

(assert (=> mapNonEmpty!2495 m!45279))

(check-sat b_and!2979 (not b!53299) (not b!53301) (not b!53288) (not b_next!1719) (not b!53283) (not b_lambda!2369) (not start!8280) b_and!2977 (not b!53294) (not b_next!1717) (not b!53296) (not b!53287) tp_is_empty!2275 (not b!53290) (not mapNonEmpty!2496) (not mapNonEmpty!2495) (not b!53303))
(check-sat b_and!2977 b_and!2979 (not b_next!1717) (not b_next!1719))
