; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77266 () Bool)

(assert start!77266)

(declare-fun b!901478 () Bool)

(declare-fun b_free!16079 () Bool)

(declare-fun b_next!16079 () Bool)

(assert (=> b!901478 (= b_free!16079 (not b_next!16079))))

(declare-fun tp!56337 () Bool)

(declare-fun b_and!26411 () Bool)

(assert (=> b!901478 (= tp!56337 b_and!26411)))

(declare-fun b!901467 () Bool)

(declare-fun e!504691 () Bool)

(declare-fun e!504699 () Bool)

(assert (=> b!901467 (= e!504691 e!504699)))

(declare-fun c!95474 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!901467 (= c!95474 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!901468 () Bool)

(declare-fun res!608635 () Bool)

(declare-fun e!504696 () Bool)

(assert (=> b!901468 (=> (not res!608635) (not e!504696))))

(assert (=> b!901468 (= res!608635 (not (= key!785 (bvneg key!785))))))

(declare-fun bm!40128 () Bool)

(declare-datatypes ((V!29507 0))(
  ( (V!29508 (val!9254 Int)) )
))
(declare-fun call!40131 () V!29507)

(declare-datatypes ((tuple2!12074 0))(
  ( (tuple2!12075 (_1!6048 (_ BitVec 64)) (_2!6048 V!29507)) )
))
(declare-datatypes ((List!17875 0))(
  ( (Nil!17872) (Cons!17871 (h!19017 tuple2!12074) (t!25240 List!17875)) )
))
(declare-datatypes ((ListLongMap!10771 0))(
  ( (ListLongMap!10772 (toList!5401 List!17875)) )
))
(declare-fun lt!407437 () ListLongMap!10771)

(declare-fun apply!420 (ListLongMap!10771 (_ BitVec 64)) V!29507)

(assert (=> bm!40128 (= call!40131 (apply!420 lt!407437 key!785))))

(declare-fun b!901469 () Bool)

(declare-fun e!504695 () Bool)

(declare-fun tp_is_empty!18407 () Bool)

(assert (=> b!901469 (= e!504695 tp_is_empty!18407)))

(declare-fun b!901470 () Bool)

(declare-fun e!504692 () Bool)

(assert (=> b!901470 (= e!504692 tp_is_empty!18407)))

(declare-fun b!901471 () Bool)

(declare-fun e!504690 () Bool)

(declare-datatypes ((SeekEntryResult!8952 0))(
  ( (MissingZero!8952 (index!38179 (_ BitVec 32))) (Found!8952 (index!38180 (_ BitVec 32))) (Intermediate!8952 (undefined!9764 Bool) (index!38181 (_ BitVec 32)) (x!76807 (_ BitVec 32))) (Undefined!8952) (MissingVacant!8952 (index!38182 (_ BitVec 32))) )
))
(declare-fun lt!407434 () SeekEntryResult!8952)

(declare-datatypes ((array!52870 0))(
  ( (array!52871 (arr!25403 (Array (_ BitVec 32) (_ BitVec 64))) (size!25862 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8722 0))(
  ( (ValueCellFull!8722 (v!11754 V!29507)) (EmptyCell!8722) )
))
(declare-datatypes ((array!52872 0))(
  ( (array!52873 (arr!25404 (Array (_ BitVec 32) ValueCell!8722)) (size!25863 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4460 0))(
  ( (LongMapFixedSize!4461 (defaultEntry!5470 Int) (mask!26280 (_ BitVec 32)) (extraKeys!5199 (_ BitVec 32)) (zeroValue!5303 V!29507) (minValue!5303 V!29507) (_size!2285 (_ BitVec 32)) (_keys!10283 array!52870) (_values!5490 array!52872) (_vacant!2285 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4460)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!901471 (= e!504690 (inRange!0 (index!38180 lt!407434) (mask!26280 thiss!1181)))))

(declare-fun mapIsEmpty!29296 () Bool)

(declare-fun mapRes!29296 () Bool)

(assert (=> mapIsEmpty!29296 mapRes!29296))

(declare-fun b!901472 () Bool)

(declare-fun res!608639 () Bool)

(declare-fun e!504700 () Bool)

(assert (=> b!901472 (=> (not res!608639) (not e!504700))))

(assert (=> b!901472 (= res!608639 (not (= (bvand (extraKeys!5199 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!901472 (= e!504699 e!504700)))

(declare-fun b!901473 () Bool)

(declare-fun call!40132 () V!29507)

(assert (=> b!901473 (= e!504700 (= call!40132 (minValue!5303 thiss!1181)))))

(declare-fun b!901474 () Bool)

(declare-fun e!504689 () Bool)

(assert (=> b!901474 (= e!504689 (= call!40131 (zeroValue!5303 thiss!1181)))))

(declare-fun b!901475 () Bool)

(declare-fun get!13364 (ValueCell!8722 V!29507) V!29507)

(declare-fun dynLambda!1314 (Int (_ BitVec 64)) V!29507)

(assert (=> b!901475 (= e!504699 (= call!40132 (get!13364 (select (arr!25404 (_values!5490 thiss!1181)) (index!38180 lt!407434)) (dynLambda!1314 (defaultEntry!5470 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!29296 () Bool)

(declare-fun tp!56336 () Bool)

(assert (=> mapNonEmpty!29296 (= mapRes!29296 (and tp!56336 e!504692))))

(declare-fun mapKey!29296 () (_ BitVec 32))

(declare-fun mapValue!29296 () ValueCell!8722)

(declare-fun mapRest!29296 () (Array (_ BitVec 32) ValueCell!8722))

(assert (=> mapNonEmpty!29296 (= (arr!25404 (_values!5490 thiss!1181)) (store mapRest!29296 mapKey!29296 mapValue!29296))))

(declare-fun res!608638 () Bool)

(assert (=> start!77266 (=> (not res!608638) (not e!504696))))

(declare-fun valid!1712 (LongMapFixedSize!4460) Bool)

(assert (=> start!77266 (= res!608638 (valid!1712 thiss!1181))))

(assert (=> start!77266 e!504696))

(declare-fun e!504693 () Bool)

(assert (=> start!77266 e!504693))

(assert (=> start!77266 true))

(declare-fun bm!40129 () Bool)

(assert (=> bm!40129 (= call!40132 call!40131)))

(declare-fun b!901476 () Bool)

(declare-fun e!504694 () Bool)

(assert (=> b!901476 (= e!504696 (not e!504694))))

(declare-fun res!608640 () Bool)

(assert (=> b!901476 (=> res!608640 e!504694)))

(assert (=> b!901476 (= res!608640 (not (is-Found!8952 lt!407434)))))

(assert (=> b!901476 e!504690))

(declare-fun res!608637 () Bool)

(assert (=> b!901476 (=> res!608637 e!504690)))

(assert (=> b!901476 (= res!608637 (not (is-Found!8952 lt!407434)))))

(declare-datatypes ((Unit!30618 0))(
  ( (Unit!30619) )
))
(declare-fun lt!407436 () Unit!30618)

(declare-fun lemmaSeekEntryGivesInRangeIndex!111 (array!52870 array!52872 (_ BitVec 32) (_ BitVec 32) V!29507 V!29507 (_ BitVec 64)) Unit!30618)

(assert (=> b!901476 (= lt!407436 (lemmaSeekEntryGivesInRangeIndex!111 (_keys!10283 thiss!1181) (_values!5490 thiss!1181) (mask!26280 thiss!1181) (extraKeys!5199 thiss!1181) (zeroValue!5303 thiss!1181) (minValue!5303 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52870 (_ BitVec 32)) SeekEntryResult!8952)

(assert (=> b!901476 (= lt!407434 (seekEntry!0 key!785 (_keys!10283 thiss!1181) (mask!26280 thiss!1181)))))

(declare-fun b!901477 () Bool)

(assert (=> b!901477 (= e!504691 e!504689)))

(declare-fun res!608636 () Bool)

(assert (=> b!901477 (= res!608636 (not (= (bvand (extraKeys!5199 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!901477 (=> (not res!608636) (not e!504689))))

(declare-fun e!504697 () Bool)

(declare-fun array_inv!19922 (array!52870) Bool)

(declare-fun array_inv!19923 (array!52872) Bool)

(assert (=> b!901478 (= e!504693 (and tp!56337 tp_is_empty!18407 (array_inv!19922 (_keys!10283 thiss!1181)) (array_inv!19923 (_values!5490 thiss!1181)) e!504697))))

(declare-fun b!901479 () Bool)

(assert (=> b!901479 (= e!504694 (and (bvsge (index!38180 lt!407434) #b00000000000000000000000000000000) (bvslt (index!38180 lt!407434) (size!25863 (_values!5490 thiss!1181)))))))

(assert (=> b!901479 e!504691))

(declare-fun c!95473 () Bool)

(assert (=> b!901479 (= c!95473 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!407438 () Unit!30618)

(declare-fun lemmaKeyInListMapThenSameValueInArray!12 (array!52870 array!52872 (_ BitVec 32) (_ BitVec 32) V!29507 V!29507 (_ BitVec 64) (_ BitVec 32) Int) Unit!30618)

(assert (=> b!901479 (= lt!407438 (lemmaKeyInListMapThenSameValueInArray!12 (_keys!10283 thiss!1181) (_values!5490 thiss!1181) (mask!26280 thiss!1181) (extraKeys!5199 thiss!1181) (zeroValue!5303 thiss!1181) (minValue!5303 thiss!1181) key!785 (index!38180 lt!407434) (defaultEntry!5470 thiss!1181)))))

(declare-fun contains!4441 (ListLongMap!10771 (_ BitVec 64)) Bool)

(assert (=> b!901479 (contains!4441 lt!407437 (select (arr!25403 (_keys!10283 thiss!1181)) (index!38180 lt!407434)))))

(declare-fun getCurrentListMap!2671 (array!52870 array!52872 (_ BitVec 32) (_ BitVec 32) V!29507 V!29507 (_ BitVec 32) Int) ListLongMap!10771)

(assert (=> b!901479 (= lt!407437 (getCurrentListMap!2671 (_keys!10283 thiss!1181) (_values!5490 thiss!1181) (mask!26280 thiss!1181) (extraKeys!5199 thiss!1181) (zeroValue!5303 thiss!1181) (minValue!5303 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5470 thiss!1181)))))

(declare-fun lt!407435 () Unit!30618)

(declare-fun lemmaValidKeyInArrayIsInListMap!260 (array!52870 array!52872 (_ BitVec 32) (_ BitVec 32) V!29507 V!29507 (_ BitVec 32) Int) Unit!30618)

(assert (=> b!901479 (= lt!407435 (lemmaValidKeyInArrayIsInListMap!260 (_keys!10283 thiss!1181) (_values!5490 thiss!1181) (mask!26280 thiss!1181) (extraKeys!5199 thiss!1181) (zeroValue!5303 thiss!1181) (minValue!5303 thiss!1181) (index!38180 lt!407434) (defaultEntry!5470 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52870 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!901479 (arrayContainsKey!0 (_keys!10283 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407433 () Unit!30618)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52870 (_ BitVec 64) (_ BitVec 32)) Unit!30618)

(assert (=> b!901479 (= lt!407433 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10283 thiss!1181) key!785 (index!38180 lt!407434)))))

(declare-fun b!901480 () Bool)

(assert (=> b!901480 (= e!504697 (and e!504695 mapRes!29296))))

(declare-fun condMapEmpty!29296 () Bool)

(declare-fun mapDefault!29296 () ValueCell!8722)

