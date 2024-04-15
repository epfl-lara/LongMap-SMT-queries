; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77170 () Bool)

(assert start!77170)

(declare-fun b!900485 () Bool)

(declare-fun b_free!16057 () Bool)

(declare-fun b_next!16057 () Bool)

(assert (=> b!900485 (= b_free!16057 (not b_next!16057))))

(declare-fun tp!56266 () Bool)

(declare-fun b_and!26355 () Bool)

(assert (=> b!900485 (= tp!56266 b_and!26355)))

(declare-fun b!900483 () Bool)

(declare-fun e!504028 () Bool)

(declare-fun tp_is_empty!18385 () Bool)

(assert (=> b!900483 (= e!504028 tp_is_empty!18385)))

(declare-fun b!900484 () Bool)

(declare-fun e!504030 () Bool)

(declare-fun e!504026 () Bool)

(assert (=> b!900484 (= e!504030 (not e!504026))))

(declare-fun res!608120 () Bool)

(assert (=> b!900484 (=> res!608120 e!504026)))

(declare-datatypes ((SeekEntryResult!8942 0))(
  ( (MissingZero!8942 (index!38139 (_ BitVec 32))) (Found!8942 (index!38140 (_ BitVec 32))) (Intermediate!8942 (undefined!9754 Bool) (index!38141 (_ BitVec 32)) (x!76742 (_ BitVec 32))) (Undefined!8942) (MissingVacant!8942 (index!38142 (_ BitVec 32))) )
))
(declare-fun lt!406794 () SeekEntryResult!8942)

(get-info :version)

(assert (=> b!900484 (= res!608120 (not ((_ is Found!8942) lt!406794)))))

(declare-fun e!504029 () Bool)

(assert (=> b!900484 e!504029))

(declare-fun res!608116 () Bool)

(assert (=> b!900484 (=> res!608116 e!504029)))

(assert (=> b!900484 (= res!608116 (not ((_ is Found!8942) lt!406794)))))

(declare-datatypes ((Unit!30536 0))(
  ( (Unit!30537) )
))
(declare-fun lt!406797 () Unit!30536)

(declare-datatypes ((array!52805 0))(
  ( (array!52806 (arr!25373 (Array (_ BitVec 32) (_ BitVec 64))) (size!25834 (_ BitVec 32))) )
))
(declare-datatypes ((V!29479 0))(
  ( (V!29480 (val!9243 Int)) )
))
(declare-datatypes ((ValueCell!8711 0))(
  ( (ValueCellFull!8711 (v!11738 V!29479)) (EmptyCell!8711) )
))
(declare-datatypes ((array!52807 0))(
  ( (array!52808 (arr!25374 (Array (_ BitVec 32) ValueCell!8711)) (size!25835 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4438 0))(
  ( (LongMapFixedSize!4439 (defaultEntry!5455 Int) (mask!26242 (_ BitVec 32)) (extraKeys!5182 (_ BitVec 32)) (zeroValue!5286 V!29479) (minValue!5286 V!29479) (_size!2274 (_ BitVec 32)) (_keys!10257 array!52805) (_values!5473 array!52807) (_vacant!2274 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4438)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!105 (array!52805 array!52807 (_ BitVec 32) (_ BitVec 32) V!29479 V!29479 (_ BitVec 64)) Unit!30536)

(assert (=> b!900484 (= lt!406797 (lemmaSeekEntryGivesInRangeIndex!105 (_keys!10257 thiss!1181) (_values!5473 thiss!1181) (mask!26242 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52805 (_ BitVec 32)) SeekEntryResult!8942)

(assert (=> b!900484 (= lt!406794 (seekEntry!0 key!785 (_keys!10257 thiss!1181) (mask!26242 thiss!1181)))))

(declare-fun e!504031 () Bool)

(declare-fun e!504025 () Bool)

(declare-fun array_inv!19956 (array!52805) Bool)

(declare-fun array_inv!19957 (array!52807) Bool)

(assert (=> b!900485 (= e!504031 (and tp!56266 tp_is_empty!18385 (array_inv!19956 (_keys!10257 thiss!1181)) (array_inv!19957 (_values!5473 thiss!1181)) e!504025))))

(declare-fun b!900486 () Bool)

(declare-fun e!504027 () Bool)

(declare-datatypes ((tuple2!12082 0))(
  ( (tuple2!12083 (_1!6052 (_ BitVec 64)) (_2!6052 V!29479)) )
))
(declare-datatypes ((List!17870 0))(
  ( (Nil!17867) (Cons!17866 (h!19012 tuple2!12082) (t!25216 List!17870)) )
))
(declare-datatypes ((ListLongMap!10769 0))(
  ( (ListLongMap!10770 (toList!5400 List!17870)) )
))
(declare-fun lt!406796 () ListLongMap!10769)

(declare-fun contains!4404 (ListLongMap!10769 (_ BitVec 64)) Bool)

(assert (=> b!900486 (= e!504027 (contains!4404 lt!406796 key!785))))

(declare-fun b!900487 () Bool)

(declare-fun mapRes!29257 () Bool)

(assert (=> b!900487 (= e!504025 (and e!504028 mapRes!29257))))

(declare-fun condMapEmpty!29257 () Bool)

(declare-fun mapDefault!29257 () ValueCell!8711)

(assert (=> b!900487 (= condMapEmpty!29257 (= (arr!25374 (_values!5473 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8711)) mapDefault!29257)))))

(declare-fun b!900488 () Bool)

(declare-fun res!608121 () Bool)

(assert (=> b!900488 (=> (not res!608121) (not e!504030))))

(assert (=> b!900488 (= res!608121 (not (= key!785 (bvneg key!785))))))

(declare-fun b!900489 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!900489 (= e!504029 (inRange!0 (index!38140 lt!406794) (mask!26242 thiss!1181)))))

(declare-fun b!900490 () Bool)

(declare-fun e!504024 () Bool)

(assert (=> b!900490 (= e!504024 tp_is_empty!18385)))

(declare-fun b!900491 () Bool)

(declare-fun res!608118 () Bool)

(assert (=> b!900491 (=> res!608118 e!504027)))

(declare-datatypes ((List!17871 0))(
  ( (Nil!17868) (Cons!17867 (h!19013 (_ BitVec 64)) (t!25217 List!17871)) )
))
(declare-fun arrayNoDuplicates!0 (array!52805 (_ BitVec 32) List!17871) Bool)

(assert (=> b!900491 (= res!608118 (not (arrayNoDuplicates!0 (_keys!10257 thiss!1181) #b00000000000000000000000000000000 Nil!17868)))))

(declare-fun mapNonEmpty!29257 () Bool)

(declare-fun tp!56265 () Bool)

(assert (=> mapNonEmpty!29257 (= mapRes!29257 (and tp!56265 e!504024))))

(declare-fun mapValue!29257 () ValueCell!8711)

(declare-fun mapKey!29257 () (_ BitVec 32))

(declare-fun mapRest!29257 () (Array (_ BitVec 32) ValueCell!8711))

(assert (=> mapNonEmpty!29257 (= (arr!25374 (_values!5473 thiss!1181)) (store mapRest!29257 mapKey!29257 mapValue!29257))))

(declare-fun mapIsEmpty!29257 () Bool)

(assert (=> mapIsEmpty!29257 mapRes!29257))

(declare-fun b!900492 () Bool)

(assert (=> b!900492 (= e!504026 e!504027)))

(declare-fun res!608123 () Bool)

(assert (=> b!900492 (=> res!608123 e!504027)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!900492 (= res!608123 (not (validMask!0 (mask!26242 thiss!1181))))))

(assert (=> b!900492 (contains!4404 lt!406796 (select (arr!25373 (_keys!10257 thiss!1181)) (index!38140 lt!406794)))))

(declare-fun getCurrentListMap!2619 (array!52805 array!52807 (_ BitVec 32) (_ BitVec 32) V!29479 V!29479 (_ BitVec 32) Int) ListLongMap!10769)

(assert (=> b!900492 (= lt!406796 (getCurrentListMap!2619 (_keys!10257 thiss!1181) (_values!5473 thiss!1181) (mask!26242 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5455 thiss!1181)))))

(declare-fun lt!406795 () Unit!30536)

(declare-fun lemmaValidKeyInArrayIsInListMap!255 (array!52805 array!52807 (_ BitVec 32) (_ BitVec 32) V!29479 V!29479 (_ BitVec 32) Int) Unit!30536)

(assert (=> b!900492 (= lt!406795 (lemmaValidKeyInArrayIsInListMap!255 (_keys!10257 thiss!1181) (_values!5473 thiss!1181) (mask!26242 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) (index!38140 lt!406794) (defaultEntry!5455 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!900492 (arrayContainsKey!0 (_keys!10257 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406798 () Unit!30536)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52805 (_ BitVec 64) (_ BitVec 32)) Unit!30536)

(assert (=> b!900492 (= lt!406798 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10257 thiss!1181) key!785 (index!38140 lt!406794)))))

(declare-fun b!900493 () Bool)

(declare-fun res!608117 () Bool)

(assert (=> b!900493 (=> res!608117 e!504027)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52805 (_ BitVec 32)) Bool)

(assert (=> b!900493 (= res!608117 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10257 thiss!1181) (mask!26242 thiss!1181))))))

(declare-fun res!608122 () Bool)

(assert (=> start!77170 (=> (not res!608122) (not e!504030))))

(declare-fun valid!1713 (LongMapFixedSize!4438) Bool)

(assert (=> start!77170 (= res!608122 (valid!1713 thiss!1181))))

(assert (=> start!77170 e!504030))

(assert (=> start!77170 e!504031))

(assert (=> start!77170 true))

(declare-fun b!900494 () Bool)

(declare-fun res!608119 () Bool)

(assert (=> b!900494 (=> res!608119 e!504027)))

(assert (=> b!900494 (= res!608119 (or (not (= (size!25835 (_values!5473 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26242 thiss!1181)))) (not (= (size!25834 (_keys!10257 thiss!1181)) (size!25835 (_values!5473 thiss!1181)))) (bvslt (mask!26242 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5182 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5182 thiss!1181) #b00000000000000000000000000000011)))))

(assert (= (and start!77170 res!608122) b!900488))

(assert (= (and b!900488 res!608121) b!900484))

(assert (= (and b!900484 (not res!608116)) b!900489))

(assert (= (and b!900484 (not res!608120)) b!900492))

(assert (= (and b!900492 (not res!608123)) b!900494))

(assert (= (and b!900494 (not res!608119)) b!900493))

(assert (= (and b!900493 (not res!608117)) b!900491))

(assert (= (and b!900491 (not res!608118)) b!900486))

(assert (= (and b!900487 condMapEmpty!29257) mapIsEmpty!29257))

(assert (= (and b!900487 (not condMapEmpty!29257)) mapNonEmpty!29257))

(assert (= (and mapNonEmpty!29257 ((_ is ValueCellFull!8711) mapValue!29257)) b!900490))

(assert (= (and b!900487 ((_ is ValueCellFull!8711) mapDefault!29257)) b!900483))

(assert (= b!900485 b!900487))

(assert (= start!77170 b!900485))

(declare-fun m!836359 () Bool)

(assert (=> b!900491 m!836359))

(declare-fun m!836361 () Bool)

(assert (=> mapNonEmpty!29257 m!836361))

(declare-fun m!836363 () Bool)

(assert (=> b!900492 m!836363))

(declare-fun m!836365 () Bool)

(assert (=> b!900492 m!836365))

(declare-fun m!836367 () Bool)

(assert (=> b!900492 m!836367))

(declare-fun m!836369 () Bool)

(assert (=> b!900492 m!836369))

(declare-fun m!836371 () Bool)

(assert (=> b!900492 m!836371))

(declare-fun m!836373 () Bool)

(assert (=> b!900492 m!836373))

(declare-fun m!836375 () Bool)

(assert (=> b!900492 m!836375))

(assert (=> b!900492 m!836363))

(declare-fun m!836377 () Bool)

(assert (=> b!900489 m!836377))

(declare-fun m!836379 () Bool)

(assert (=> start!77170 m!836379))

(declare-fun m!836381 () Bool)

(assert (=> b!900485 m!836381))

(declare-fun m!836383 () Bool)

(assert (=> b!900485 m!836383))

(declare-fun m!836385 () Bool)

(assert (=> b!900486 m!836385))

(declare-fun m!836387 () Bool)

(assert (=> b!900484 m!836387))

(declare-fun m!836389 () Bool)

(assert (=> b!900484 m!836389))

(declare-fun m!836391 () Bool)

(assert (=> b!900493 m!836391))

(check-sat (not b!900484) (not b!900485) (not mapNonEmpty!29257) (not b_next!16057) (not start!77170) b_and!26355 tp_is_empty!18385 (not b!900491) (not b!900493) (not b!900486) (not b!900492) (not b!900489))
(check-sat b_and!26355 (not b_next!16057))
(get-model)

(declare-fun d!111565 () Bool)

(declare-fun e!504089 () Bool)

(assert (=> d!111565 e!504089))

(declare-fun res!608174 () Bool)

(assert (=> d!111565 (=> (not res!608174) (not e!504089))))

(assert (=> d!111565 (= res!608174 (and (bvsge (index!38140 lt!406794) #b00000000000000000000000000000000) (bvslt (index!38140 lt!406794) (size!25834 (_keys!10257 thiss!1181)))))))

(declare-fun lt!406831 () Unit!30536)

(declare-fun choose!1525 (array!52805 array!52807 (_ BitVec 32) (_ BitVec 32) V!29479 V!29479 (_ BitVec 32) Int) Unit!30536)

(assert (=> d!111565 (= lt!406831 (choose!1525 (_keys!10257 thiss!1181) (_values!5473 thiss!1181) (mask!26242 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) (index!38140 lt!406794) (defaultEntry!5455 thiss!1181)))))

(assert (=> d!111565 (validMask!0 (mask!26242 thiss!1181))))

(assert (=> d!111565 (= (lemmaValidKeyInArrayIsInListMap!255 (_keys!10257 thiss!1181) (_values!5473 thiss!1181) (mask!26242 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) (index!38140 lt!406794) (defaultEntry!5455 thiss!1181)) lt!406831)))

(declare-fun b!900569 () Bool)

(assert (=> b!900569 (= e!504089 (contains!4404 (getCurrentListMap!2619 (_keys!10257 thiss!1181) (_values!5473 thiss!1181) (mask!26242 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5455 thiss!1181)) (select (arr!25373 (_keys!10257 thiss!1181)) (index!38140 lt!406794))))))

(assert (= (and d!111565 res!608174) b!900569))

(declare-fun m!836461 () Bool)

(assert (=> d!111565 m!836461))

(assert (=> d!111565 m!836373))

(assert (=> b!900569 m!836375))

(assert (=> b!900569 m!836363))

(assert (=> b!900569 m!836375))

(assert (=> b!900569 m!836363))

(declare-fun m!836463 () Bool)

(assert (=> b!900569 m!836463))

(assert (=> b!900492 d!111565))

(declare-fun d!111567 () Bool)

(assert (=> d!111567 (= (validMask!0 (mask!26242 thiss!1181)) (and (or (= (mask!26242 thiss!1181) #b00000000000000000000000000000111) (= (mask!26242 thiss!1181) #b00000000000000000000000000001111) (= (mask!26242 thiss!1181) #b00000000000000000000000000011111) (= (mask!26242 thiss!1181) #b00000000000000000000000000111111) (= (mask!26242 thiss!1181) #b00000000000000000000000001111111) (= (mask!26242 thiss!1181) #b00000000000000000000000011111111) (= (mask!26242 thiss!1181) #b00000000000000000000000111111111) (= (mask!26242 thiss!1181) #b00000000000000000000001111111111) (= (mask!26242 thiss!1181) #b00000000000000000000011111111111) (= (mask!26242 thiss!1181) #b00000000000000000000111111111111) (= (mask!26242 thiss!1181) #b00000000000000000001111111111111) (= (mask!26242 thiss!1181) #b00000000000000000011111111111111) (= (mask!26242 thiss!1181) #b00000000000000000111111111111111) (= (mask!26242 thiss!1181) #b00000000000000001111111111111111) (= (mask!26242 thiss!1181) #b00000000000000011111111111111111) (= (mask!26242 thiss!1181) #b00000000000000111111111111111111) (= (mask!26242 thiss!1181) #b00000000000001111111111111111111) (= (mask!26242 thiss!1181) #b00000000000011111111111111111111) (= (mask!26242 thiss!1181) #b00000000000111111111111111111111) (= (mask!26242 thiss!1181) #b00000000001111111111111111111111) (= (mask!26242 thiss!1181) #b00000000011111111111111111111111) (= (mask!26242 thiss!1181) #b00000000111111111111111111111111) (= (mask!26242 thiss!1181) #b00000001111111111111111111111111) (= (mask!26242 thiss!1181) #b00000011111111111111111111111111) (= (mask!26242 thiss!1181) #b00000111111111111111111111111111) (= (mask!26242 thiss!1181) #b00001111111111111111111111111111) (= (mask!26242 thiss!1181) #b00011111111111111111111111111111) (= (mask!26242 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26242 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!900492 d!111567))

(declare-fun d!111569 () Bool)

(declare-fun e!504094 () Bool)

(assert (=> d!111569 e!504094))

(declare-fun res!608177 () Bool)

(assert (=> d!111569 (=> res!608177 e!504094)))

(declare-fun lt!406843 () Bool)

(assert (=> d!111569 (= res!608177 (not lt!406843))))

(declare-fun lt!406840 () Bool)

(assert (=> d!111569 (= lt!406843 lt!406840)))

(declare-fun lt!406841 () Unit!30536)

(declare-fun e!504095 () Unit!30536)

(assert (=> d!111569 (= lt!406841 e!504095)))

(declare-fun c!95320 () Bool)

(assert (=> d!111569 (= c!95320 lt!406840)))

(declare-fun containsKey!432 (List!17870 (_ BitVec 64)) Bool)

(assert (=> d!111569 (= lt!406840 (containsKey!432 (toList!5400 lt!406796) (select (arr!25373 (_keys!10257 thiss!1181)) (index!38140 lt!406794))))))

(assert (=> d!111569 (= (contains!4404 lt!406796 (select (arr!25373 (_keys!10257 thiss!1181)) (index!38140 lt!406794))) lt!406843)))

(declare-fun b!900576 () Bool)

(declare-fun lt!406842 () Unit!30536)

(assert (=> b!900576 (= e!504095 lt!406842)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!327 (List!17870 (_ BitVec 64)) Unit!30536)

(assert (=> b!900576 (= lt!406842 (lemmaContainsKeyImpliesGetValueByKeyDefined!327 (toList!5400 lt!406796) (select (arr!25373 (_keys!10257 thiss!1181)) (index!38140 lt!406794))))))

(declare-datatypes ((Option!470 0))(
  ( (Some!469 (v!11741 V!29479)) (None!468) )
))
(declare-fun isDefined!340 (Option!470) Bool)

(declare-fun getValueByKey!464 (List!17870 (_ BitVec 64)) Option!470)

(assert (=> b!900576 (isDefined!340 (getValueByKey!464 (toList!5400 lt!406796) (select (arr!25373 (_keys!10257 thiss!1181)) (index!38140 lt!406794))))))

(declare-fun b!900577 () Bool)

(declare-fun Unit!30542 () Unit!30536)

(assert (=> b!900577 (= e!504095 Unit!30542)))

(declare-fun b!900578 () Bool)

(assert (=> b!900578 (= e!504094 (isDefined!340 (getValueByKey!464 (toList!5400 lt!406796) (select (arr!25373 (_keys!10257 thiss!1181)) (index!38140 lt!406794)))))))

(assert (= (and d!111569 c!95320) b!900576))

(assert (= (and d!111569 (not c!95320)) b!900577))

(assert (= (and d!111569 (not res!608177)) b!900578))

(assert (=> d!111569 m!836363))

(declare-fun m!836465 () Bool)

(assert (=> d!111569 m!836465))

(assert (=> b!900576 m!836363))

(declare-fun m!836467 () Bool)

(assert (=> b!900576 m!836467))

(assert (=> b!900576 m!836363))

(declare-fun m!836469 () Bool)

(assert (=> b!900576 m!836469))

(assert (=> b!900576 m!836469))

(declare-fun m!836471 () Bool)

(assert (=> b!900576 m!836471))

(assert (=> b!900578 m!836363))

(assert (=> b!900578 m!836469))

(assert (=> b!900578 m!836469))

(assert (=> b!900578 m!836471))

(assert (=> b!900492 d!111569))

(declare-fun d!111571 () Bool)

(declare-fun res!608182 () Bool)

(declare-fun e!504100 () Bool)

(assert (=> d!111571 (=> res!608182 e!504100)))

(assert (=> d!111571 (= res!608182 (= (select (arr!25373 (_keys!10257 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111571 (= (arrayContainsKey!0 (_keys!10257 thiss!1181) key!785 #b00000000000000000000000000000000) e!504100)))

(declare-fun b!900583 () Bool)

(declare-fun e!504101 () Bool)

(assert (=> b!900583 (= e!504100 e!504101)))

(declare-fun res!608183 () Bool)

(assert (=> b!900583 (=> (not res!608183) (not e!504101))))

(assert (=> b!900583 (= res!608183 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25834 (_keys!10257 thiss!1181))))))

(declare-fun b!900584 () Bool)

(assert (=> b!900584 (= e!504101 (arrayContainsKey!0 (_keys!10257 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111571 (not res!608182)) b!900583))

(assert (= (and b!900583 res!608183) b!900584))

(declare-fun m!836473 () Bool)

(assert (=> d!111571 m!836473))

(declare-fun m!836475 () Bool)

(assert (=> b!900584 m!836475))

(assert (=> b!900492 d!111571))

(declare-fun d!111573 () Bool)

(assert (=> d!111573 (arrayContainsKey!0 (_keys!10257 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406846 () Unit!30536)

(declare-fun choose!13 (array!52805 (_ BitVec 64) (_ BitVec 32)) Unit!30536)

(assert (=> d!111573 (= lt!406846 (choose!13 (_keys!10257 thiss!1181) key!785 (index!38140 lt!406794)))))

(assert (=> d!111573 (bvsge (index!38140 lt!406794) #b00000000000000000000000000000000)))

(assert (=> d!111573 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10257 thiss!1181) key!785 (index!38140 lt!406794)) lt!406846)))

(declare-fun bs!25261 () Bool)

(assert (= bs!25261 d!111573))

(assert (=> bs!25261 m!836369))

(declare-fun m!836477 () Bool)

(assert (=> bs!25261 m!836477))

(assert (=> b!900492 d!111573))

(declare-fun b!900627 () Bool)

(declare-fun c!95338 () Bool)

(assert (=> b!900627 (= c!95338 (and (not (= (bvand (extraKeys!5182 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5182 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!504140 () ListLongMap!10769)

(declare-fun e!504134 () ListLongMap!10769)

(assert (=> b!900627 (= e!504140 e!504134)))

(declare-fun call!40052 () ListLongMap!10769)

(declare-fun call!40051 () ListLongMap!10769)

(declare-fun call!40050 () ListLongMap!10769)

(declare-fun bm!40046 () Bool)

(declare-fun c!95335 () Bool)

(declare-fun c!95337 () Bool)

(declare-fun call!40055 () ListLongMap!10769)

(declare-fun +!2624 (ListLongMap!10769 tuple2!12082) ListLongMap!10769)

(assert (=> bm!40046 (= call!40052 (+!2624 (ite c!95337 call!40055 (ite c!95335 call!40050 call!40051)) (ite (or c!95337 c!95335) (tuple2!12083 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5286 thiss!1181)) (tuple2!12083 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5286 thiss!1181)))))))

(declare-fun bm!40047 () Bool)

(assert (=> bm!40047 (= call!40051 call!40050)))

(declare-fun b!900628 () Bool)

(declare-fun call!40049 () ListLongMap!10769)

(assert (=> b!900628 (= e!504134 call!40049)))

(declare-fun bm!40048 () Bool)

(declare-fun call!40054 () Bool)

(declare-fun lt!406895 () ListLongMap!10769)

(assert (=> bm!40048 (= call!40054 (contains!4404 lt!406895 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!900629 () Bool)

(assert (=> b!900629 (= e!504134 call!40051)))

(declare-fun bm!40049 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3321 (array!52805 array!52807 (_ BitVec 32) (_ BitVec 32) V!29479 V!29479 (_ BitVec 32) Int) ListLongMap!10769)

(assert (=> bm!40049 (= call!40055 (getCurrentListMapNoExtraKeys!3321 (_keys!10257 thiss!1181) (_values!5473 thiss!1181) (mask!26242 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5455 thiss!1181)))))

(declare-fun b!900630 () Bool)

(declare-fun e!504136 () Bool)

(declare-fun apply!413 (ListLongMap!10769 (_ BitVec 64)) V!29479)

(assert (=> b!900630 (= e!504136 (= (apply!413 lt!406895 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5286 thiss!1181)))))

(declare-fun b!900631 () Bool)

(declare-fun e!504132 () Bool)

(declare-fun call!40053 () Bool)

(assert (=> b!900631 (= e!504132 (not call!40053))))

(declare-fun b!900633 () Bool)

(declare-fun e!504131 () Bool)

(assert (=> b!900633 (= e!504131 e!504132)))

(declare-fun c!95336 () Bool)

(assert (=> b!900633 (= c!95336 (not (= (bvand (extraKeys!5182 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!900634 () Bool)

(declare-fun res!608203 () Bool)

(assert (=> b!900634 (=> (not res!608203) (not e!504131))))

(declare-fun e!504128 () Bool)

(assert (=> b!900634 (= res!608203 e!504128)))

(declare-fun c!95333 () Bool)

(assert (=> b!900634 (= c!95333 (not (= (bvand (extraKeys!5182 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!900635 () Bool)

(declare-fun e!504137 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!900635 (= e!504137 (validKeyInArray!0 (select (arr!25373 (_keys!10257 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!40050 () Bool)

(assert (=> bm!40050 (= call!40053 (contains!4404 lt!406895 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!900636 () Bool)

(assert (=> b!900636 (= e!504128 (not call!40054))))

(declare-fun b!900637 () Bool)

(declare-fun e!504139 () ListLongMap!10769)

(assert (=> b!900637 (= e!504139 (+!2624 call!40052 (tuple2!12083 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5286 thiss!1181))))))

(declare-fun b!900638 () Bool)

(declare-fun e!504135 () Bool)

(declare-fun e!504133 () Bool)

(assert (=> b!900638 (= e!504135 e!504133)))

(declare-fun res!608208 () Bool)

(assert (=> b!900638 (=> (not res!608208) (not e!504133))))

(assert (=> b!900638 (= res!608208 (contains!4404 lt!406895 (select (arr!25373 (_keys!10257 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!900638 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25834 (_keys!10257 thiss!1181))))))

(declare-fun b!900639 () Bool)

(declare-fun res!608207 () Bool)

(assert (=> b!900639 (=> (not res!608207) (not e!504131))))

(assert (=> b!900639 (= res!608207 e!504135)))

(declare-fun res!608209 () Bool)

(assert (=> b!900639 (=> res!608209 e!504135)))

(assert (=> b!900639 (= res!608209 (not e!504137))))

(declare-fun res!608205 () Bool)

(assert (=> b!900639 (=> (not res!608205) (not e!504137))))

(assert (=> b!900639 (= res!608205 (bvslt #b00000000000000000000000000000000 (size!25834 (_keys!10257 thiss!1181))))))

(declare-fun b!900640 () Bool)

(declare-fun get!13354 (ValueCell!8711 V!29479) V!29479)

(declare-fun dynLambda!1307 (Int (_ BitVec 64)) V!29479)

(assert (=> b!900640 (= e!504133 (= (apply!413 lt!406895 (select (arr!25373 (_keys!10257 thiss!1181)) #b00000000000000000000000000000000)) (get!13354 (select (arr!25374 (_values!5473 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1307 (defaultEntry!5455 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!900640 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25835 (_values!5473 thiss!1181))))))

(assert (=> b!900640 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25834 (_keys!10257 thiss!1181))))))

(declare-fun b!900641 () Bool)

(declare-fun e!504130 () Bool)

(assert (=> b!900641 (= e!504130 (validKeyInArray!0 (select (arr!25373 (_keys!10257 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900642 () Bool)

(assert (=> b!900642 (= e!504139 e!504140)))

(assert (=> b!900642 (= c!95335 (and (not (= (bvand (extraKeys!5182 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5182 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!900643 () Bool)

(declare-fun e!504138 () Bool)

(assert (=> b!900643 (= e!504138 (= (apply!413 lt!406895 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5286 thiss!1181)))))

(declare-fun bm!40051 () Bool)

(assert (=> bm!40051 (= call!40050 call!40055)))

(declare-fun b!900644 () Bool)

(assert (=> b!900644 (= e!504132 e!504138)))

(declare-fun res!608206 () Bool)

(assert (=> b!900644 (= res!608206 call!40053)))

(assert (=> b!900644 (=> (not res!608206) (not e!504138))))

(declare-fun b!900645 () Bool)

(declare-fun e!504129 () Unit!30536)

(declare-fun lt!406905 () Unit!30536)

(assert (=> b!900645 (= e!504129 lt!406905)))

(declare-fun lt!406900 () ListLongMap!10769)

(assert (=> b!900645 (= lt!406900 (getCurrentListMapNoExtraKeys!3321 (_keys!10257 thiss!1181) (_values!5473 thiss!1181) (mask!26242 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5455 thiss!1181)))))

(declare-fun lt!406901 () (_ BitVec 64))

(assert (=> b!900645 (= lt!406901 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406893 () (_ BitVec 64))

(assert (=> b!900645 (= lt!406893 (select (arr!25373 (_keys!10257 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406911 () Unit!30536)

(declare-fun addStillContains!339 (ListLongMap!10769 (_ BitVec 64) V!29479 (_ BitVec 64)) Unit!30536)

(assert (=> b!900645 (= lt!406911 (addStillContains!339 lt!406900 lt!406901 (zeroValue!5286 thiss!1181) lt!406893))))

(assert (=> b!900645 (contains!4404 (+!2624 lt!406900 (tuple2!12083 lt!406901 (zeroValue!5286 thiss!1181))) lt!406893)))

(declare-fun lt!406908 () Unit!30536)

(assert (=> b!900645 (= lt!406908 lt!406911)))

(declare-fun lt!406896 () ListLongMap!10769)

(assert (=> b!900645 (= lt!406896 (getCurrentListMapNoExtraKeys!3321 (_keys!10257 thiss!1181) (_values!5473 thiss!1181) (mask!26242 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5455 thiss!1181)))))

(declare-fun lt!406906 () (_ BitVec 64))

(assert (=> b!900645 (= lt!406906 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406898 () (_ BitVec 64))

(assert (=> b!900645 (= lt!406898 (select (arr!25373 (_keys!10257 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406899 () Unit!30536)

(declare-fun addApplyDifferent!339 (ListLongMap!10769 (_ BitVec 64) V!29479 (_ BitVec 64)) Unit!30536)

(assert (=> b!900645 (= lt!406899 (addApplyDifferent!339 lt!406896 lt!406906 (minValue!5286 thiss!1181) lt!406898))))

(assert (=> b!900645 (= (apply!413 (+!2624 lt!406896 (tuple2!12083 lt!406906 (minValue!5286 thiss!1181))) lt!406898) (apply!413 lt!406896 lt!406898))))

(declare-fun lt!406892 () Unit!30536)

(assert (=> b!900645 (= lt!406892 lt!406899)))

(declare-fun lt!406891 () ListLongMap!10769)

(assert (=> b!900645 (= lt!406891 (getCurrentListMapNoExtraKeys!3321 (_keys!10257 thiss!1181) (_values!5473 thiss!1181) (mask!26242 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5455 thiss!1181)))))

(declare-fun lt!406912 () (_ BitVec 64))

(assert (=> b!900645 (= lt!406912 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406897 () (_ BitVec 64))

(assert (=> b!900645 (= lt!406897 (select (arr!25373 (_keys!10257 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406909 () Unit!30536)

(assert (=> b!900645 (= lt!406909 (addApplyDifferent!339 lt!406891 lt!406912 (zeroValue!5286 thiss!1181) lt!406897))))

(assert (=> b!900645 (= (apply!413 (+!2624 lt!406891 (tuple2!12083 lt!406912 (zeroValue!5286 thiss!1181))) lt!406897) (apply!413 lt!406891 lt!406897))))

(declare-fun lt!406902 () Unit!30536)

(assert (=> b!900645 (= lt!406902 lt!406909)))

(declare-fun lt!406907 () ListLongMap!10769)

(assert (=> b!900645 (= lt!406907 (getCurrentListMapNoExtraKeys!3321 (_keys!10257 thiss!1181) (_values!5473 thiss!1181) (mask!26242 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5455 thiss!1181)))))

(declare-fun lt!406894 () (_ BitVec 64))

(assert (=> b!900645 (= lt!406894 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406904 () (_ BitVec 64))

(assert (=> b!900645 (= lt!406904 (select (arr!25373 (_keys!10257 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900645 (= lt!406905 (addApplyDifferent!339 lt!406907 lt!406894 (minValue!5286 thiss!1181) lt!406904))))

(assert (=> b!900645 (= (apply!413 (+!2624 lt!406907 (tuple2!12083 lt!406894 (minValue!5286 thiss!1181))) lt!406904) (apply!413 lt!406907 lt!406904))))

(declare-fun d!111575 () Bool)

(assert (=> d!111575 e!504131))

(declare-fun res!608210 () Bool)

(assert (=> d!111575 (=> (not res!608210) (not e!504131))))

(assert (=> d!111575 (= res!608210 (or (bvsge #b00000000000000000000000000000000 (size!25834 (_keys!10257 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25834 (_keys!10257 thiss!1181))))))))

(declare-fun lt!406910 () ListLongMap!10769)

(assert (=> d!111575 (= lt!406895 lt!406910)))

(declare-fun lt!406903 () Unit!30536)

(assert (=> d!111575 (= lt!406903 e!504129)))

(declare-fun c!95334 () Bool)

(assert (=> d!111575 (= c!95334 e!504130)))

(declare-fun res!608204 () Bool)

(assert (=> d!111575 (=> (not res!608204) (not e!504130))))

(assert (=> d!111575 (= res!608204 (bvslt #b00000000000000000000000000000000 (size!25834 (_keys!10257 thiss!1181))))))

(assert (=> d!111575 (= lt!406910 e!504139)))

(assert (=> d!111575 (= c!95337 (and (not (= (bvand (extraKeys!5182 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5182 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111575 (validMask!0 (mask!26242 thiss!1181))))

(assert (=> d!111575 (= (getCurrentListMap!2619 (_keys!10257 thiss!1181) (_values!5473 thiss!1181) (mask!26242 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5455 thiss!1181)) lt!406895)))

(declare-fun b!900632 () Bool)

(assert (=> b!900632 (= e!504128 e!504136)))

(declare-fun res!608202 () Bool)

(assert (=> b!900632 (= res!608202 call!40054)))

(assert (=> b!900632 (=> (not res!608202) (not e!504136))))

(declare-fun b!900646 () Bool)

(declare-fun Unit!30543 () Unit!30536)

(assert (=> b!900646 (= e!504129 Unit!30543)))

(declare-fun b!900647 () Bool)

(assert (=> b!900647 (= e!504140 call!40049)))

(declare-fun bm!40052 () Bool)

(assert (=> bm!40052 (= call!40049 call!40052)))

(assert (= (and d!111575 c!95337) b!900637))

(assert (= (and d!111575 (not c!95337)) b!900642))

(assert (= (and b!900642 c!95335) b!900647))

(assert (= (and b!900642 (not c!95335)) b!900627))

(assert (= (and b!900627 c!95338) b!900628))

(assert (= (and b!900627 (not c!95338)) b!900629))

(assert (= (or b!900628 b!900629) bm!40047))

(assert (= (or b!900647 bm!40047) bm!40051))

(assert (= (or b!900647 b!900628) bm!40052))

(assert (= (or b!900637 bm!40051) bm!40049))

(assert (= (or b!900637 bm!40052) bm!40046))

(assert (= (and d!111575 res!608204) b!900641))

(assert (= (and d!111575 c!95334) b!900645))

(assert (= (and d!111575 (not c!95334)) b!900646))

(assert (= (and d!111575 res!608210) b!900639))

(assert (= (and b!900639 res!608205) b!900635))

(assert (= (and b!900639 (not res!608209)) b!900638))

(assert (= (and b!900638 res!608208) b!900640))

(assert (= (and b!900639 res!608207) b!900634))

(assert (= (and b!900634 c!95333) b!900632))

(assert (= (and b!900634 (not c!95333)) b!900636))

(assert (= (and b!900632 res!608202) b!900630))

(assert (= (or b!900632 b!900636) bm!40048))

(assert (= (and b!900634 res!608203) b!900633))

(assert (= (and b!900633 c!95336) b!900644))

(assert (= (and b!900633 (not c!95336)) b!900631))

(assert (= (and b!900644 res!608206) b!900643))

(assert (= (or b!900644 b!900631) bm!40050))

(declare-fun b_lambda!13005 () Bool)

(assert (=> (not b_lambda!13005) (not b!900640)))

(declare-fun t!25223 () Bool)

(declare-fun tb!5199 () Bool)

(assert (=> (and b!900485 (= (defaultEntry!5455 thiss!1181) (defaultEntry!5455 thiss!1181)) t!25223) tb!5199))

(declare-fun result!10185 () Bool)

(assert (=> tb!5199 (= result!10185 tp_is_empty!18385)))

(assert (=> b!900640 t!25223))

(declare-fun b_and!26361 () Bool)

(assert (= b_and!26355 (and (=> t!25223 result!10185) b_and!26361)))

(assert (=> b!900635 m!836473))

(assert (=> b!900635 m!836473))

(declare-fun m!836479 () Bool)

(assert (=> b!900635 m!836479))

(declare-fun m!836481 () Bool)

(assert (=> bm!40046 m!836481))

(assert (=> b!900641 m!836473))

(assert (=> b!900641 m!836473))

(assert (=> b!900641 m!836479))

(declare-fun m!836483 () Bool)

(assert (=> b!900643 m!836483))

(declare-fun m!836485 () Bool)

(assert (=> bm!40050 m!836485))

(declare-fun m!836487 () Bool)

(assert (=> b!900630 m!836487))

(declare-fun m!836489 () Bool)

(assert (=> b!900645 m!836489))

(declare-fun m!836491 () Bool)

(assert (=> b!900645 m!836491))

(declare-fun m!836493 () Bool)

(assert (=> b!900645 m!836493))

(declare-fun m!836495 () Bool)

(assert (=> b!900645 m!836495))

(declare-fun m!836497 () Bool)

(assert (=> b!900645 m!836497))

(declare-fun m!836499 () Bool)

(assert (=> b!900645 m!836499))

(assert (=> b!900645 m!836473))

(declare-fun m!836501 () Bool)

(assert (=> b!900645 m!836501))

(declare-fun m!836503 () Bool)

(assert (=> b!900645 m!836503))

(declare-fun m!836505 () Bool)

(assert (=> b!900645 m!836505))

(assert (=> b!900645 m!836505))

(declare-fun m!836507 () Bool)

(assert (=> b!900645 m!836507))

(declare-fun m!836509 () Bool)

(assert (=> b!900645 m!836509))

(declare-fun m!836511 () Bool)

(assert (=> b!900645 m!836511))

(assert (=> b!900645 m!836511))

(declare-fun m!836513 () Bool)

(assert (=> b!900645 m!836513))

(assert (=> b!900645 m!836509))

(declare-fun m!836515 () Bool)

(assert (=> b!900645 m!836515))

(declare-fun m!836517 () Bool)

(assert (=> b!900645 m!836517))

(assert (=> b!900645 m!836491))

(declare-fun m!836519 () Bool)

(assert (=> b!900645 m!836519))

(declare-fun m!836521 () Bool)

(assert (=> b!900637 m!836521))

(declare-fun m!836523 () Bool)

(assert (=> bm!40048 m!836523))

(declare-fun m!836525 () Bool)

(assert (=> b!900640 m!836525))

(assert (=> b!900640 m!836525))

(declare-fun m!836527 () Bool)

(assert (=> b!900640 m!836527))

(declare-fun m!836529 () Bool)

(assert (=> b!900640 m!836529))

(assert (=> b!900640 m!836473))

(declare-fun m!836531 () Bool)

(assert (=> b!900640 m!836531))

(assert (=> b!900640 m!836473))

(assert (=> b!900640 m!836527))

(assert (=> d!111575 m!836373))

(assert (=> b!900638 m!836473))

(assert (=> b!900638 m!836473))

(declare-fun m!836533 () Bool)

(assert (=> b!900638 m!836533))

(assert (=> bm!40049 m!836503))

(assert (=> b!900492 d!111575))

(declare-fun d!111577 () Bool)

(assert (=> d!111577 (= (inRange!0 (index!38140 lt!406794) (mask!26242 thiss!1181)) (and (bvsge (index!38140 lt!406794) #b00000000000000000000000000000000) (bvslt (index!38140 lt!406794) (bvadd (mask!26242 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!900489 d!111577))

(declare-fun d!111579 () Bool)

(declare-fun e!504141 () Bool)

(assert (=> d!111579 e!504141))

(declare-fun res!608211 () Bool)

(assert (=> d!111579 (=> res!608211 e!504141)))

(declare-fun lt!406916 () Bool)

(assert (=> d!111579 (= res!608211 (not lt!406916))))

(declare-fun lt!406913 () Bool)

(assert (=> d!111579 (= lt!406916 lt!406913)))

(declare-fun lt!406914 () Unit!30536)

(declare-fun e!504142 () Unit!30536)

(assert (=> d!111579 (= lt!406914 e!504142)))

(declare-fun c!95339 () Bool)

(assert (=> d!111579 (= c!95339 lt!406913)))

(assert (=> d!111579 (= lt!406913 (containsKey!432 (toList!5400 lt!406796) key!785))))

(assert (=> d!111579 (= (contains!4404 lt!406796 key!785) lt!406916)))

(declare-fun b!900650 () Bool)

(declare-fun lt!406915 () Unit!30536)

(assert (=> b!900650 (= e!504142 lt!406915)))

(assert (=> b!900650 (= lt!406915 (lemmaContainsKeyImpliesGetValueByKeyDefined!327 (toList!5400 lt!406796) key!785))))

(assert (=> b!900650 (isDefined!340 (getValueByKey!464 (toList!5400 lt!406796) key!785))))

(declare-fun b!900651 () Bool)

(declare-fun Unit!30544 () Unit!30536)

(assert (=> b!900651 (= e!504142 Unit!30544)))

(declare-fun b!900652 () Bool)

(assert (=> b!900652 (= e!504141 (isDefined!340 (getValueByKey!464 (toList!5400 lt!406796) key!785)))))

(assert (= (and d!111579 c!95339) b!900650))

(assert (= (and d!111579 (not c!95339)) b!900651))

(assert (= (and d!111579 (not res!608211)) b!900652))

(declare-fun m!836535 () Bool)

(assert (=> d!111579 m!836535))

(declare-fun m!836537 () Bool)

(assert (=> b!900650 m!836537))

(declare-fun m!836539 () Bool)

(assert (=> b!900650 m!836539))

(assert (=> b!900650 m!836539))

(declare-fun m!836541 () Bool)

(assert (=> b!900650 m!836541))

(assert (=> b!900652 m!836539))

(assert (=> b!900652 m!836539))

(assert (=> b!900652 m!836541))

(assert (=> b!900486 d!111579))

(declare-fun b!900663 () Bool)

(declare-fun e!504154 () Bool)

(declare-fun call!40058 () Bool)

(assert (=> b!900663 (= e!504154 call!40058)))

(declare-fun b!900664 () Bool)

(assert (=> b!900664 (= e!504154 call!40058)))

(declare-fun d!111581 () Bool)

(declare-fun res!608219 () Bool)

(declare-fun e!504153 () Bool)

(assert (=> d!111581 (=> res!608219 e!504153)))

(assert (=> d!111581 (= res!608219 (bvsge #b00000000000000000000000000000000 (size!25834 (_keys!10257 thiss!1181))))))

(assert (=> d!111581 (= (arrayNoDuplicates!0 (_keys!10257 thiss!1181) #b00000000000000000000000000000000 Nil!17868) e!504153)))

(declare-fun bm!40055 () Bool)

(declare-fun c!95342 () Bool)

(assert (=> bm!40055 (= call!40058 (arrayNoDuplicates!0 (_keys!10257 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95342 (Cons!17867 (select (arr!25373 (_keys!10257 thiss!1181)) #b00000000000000000000000000000000) Nil!17868) Nil!17868)))))

(declare-fun b!900665 () Bool)

(declare-fun e!504151 () Bool)

(assert (=> b!900665 (= e!504151 e!504154)))

(assert (=> b!900665 (= c!95342 (validKeyInArray!0 (select (arr!25373 (_keys!10257 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900666 () Bool)

(declare-fun e!504152 () Bool)

(declare-fun contains!4407 (List!17871 (_ BitVec 64)) Bool)

(assert (=> b!900666 (= e!504152 (contains!4407 Nil!17868 (select (arr!25373 (_keys!10257 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900667 () Bool)

(assert (=> b!900667 (= e!504153 e!504151)))

(declare-fun res!608218 () Bool)

(assert (=> b!900667 (=> (not res!608218) (not e!504151))))

(assert (=> b!900667 (= res!608218 (not e!504152))))

(declare-fun res!608220 () Bool)

(assert (=> b!900667 (=> (not res!608220) (not e!504152))))

(assert (=> b!900667 (= res!608220 (validKeyInArray!0 (select (arr!25373 (_keys!10257 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111581 (not res!608219)) b!900667))

(assert (= (and b!900667 res!608220) b!900666))

(assert (= (and b!900667 res!608218) b!900665))

(assert (= (and b!900665 c!95342) b!900664))

(assert (= (and b!900665 (not c!95342)) b!900663))

(assert (= (or b!900664 b!900663) bm!40055))

(assert (=> bm!40055 m!836473))

(declare-fun m!836543 () Bool)

(assert (=> bm!40055 m!836543))

(assert (=> b!900665 m!836473))

(assert (=> b!900665 m!836473))

(assert (=> b!900665 m!836479))

(assert (=> b!900666 m!836473))

(assert (=> b!900666 m!836473))

(declare-fun m!836545 () Bool)

(assert (=> b!900666 m!836545))

(assert (=> b!900667 m!836473))

(assert (=> b!900667 m!836473))

(assert (=> b!900667 m!836479))

(assert (=> b!900491 d!111581))

(declare-fun d!111583 () Bool)

(declare-fun res!608227 () Bool)

(declare-fun e!504157 () Bool)

(assert (=> d!111583 (=> (not res!608227) (not e!504157))))

(declare-fun simpleValid!331 (LongMapFixedSize!4438) Bool)

(assert (=> d!111583 (= res!608227 (simpleValid!331 thiss!1181))))

(assert (=> d!111583 (= (valid!1713 thiss!1181) e!504157)))

(declare-fun b!900674 () Bool)

(declare-fun res!608228 () Bool)

(assert (=> b!900674 (=> (not res!608228) (not e!504157))))

(declare-fun arrayCountValidKeys!0 (array!52805 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!900674 (= res!608228 (= (arrayCountValidKeys!0 (_keys!10257 thiss!1181) #b00000000000000000000000000000000 (size!25834 (_keys!10257 thiss!1181))) (_size!2274 thiss!1181)))))

(declare-fun b!900675 () Bool)

(declare-fun res!608229 () Bool)

(assert (=> b!900675 (=> (not res!608229) (not e!504157))))

(assert (=> b!900675 (= res!608229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10257 thiss!1181) (mask!26242 thiss!1181)))))

(declare-fun b!900676 () Bool)

(assert (=> b!900676 (= e!504157 (arrayNoDuplicates!0 (_keys!10257 thiss!1181) #b00000000000000000000000000000000 Nil!17868))))

(assert (= (and d!111583 res!608227) b!900674))

(assert (= (and b!900674 res!608228) b!900675))

(assert (= (and b!900675 res!608229) b!900676))

(declare-fun m!836547 () Bool)

(assert (=> d!111583 m!836547))

(declare-fun m!836549 () Bool)

(assert (=> b!900674 m!836549))

(assert (=> b!900675 m!836391))

(assert (=> b!900676 m!836359))

(assert (=> start!77170 d!111583))

(declare-fun d!111585 () Bool)

(assert (=> d!111585 (= (array_inv!19956 (_keys!10257 thiss!1181)) (bvsge (size!25834 (_keys!10257 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900485 d!111585))

(declare-fun d!111587 () Bool)

(assert (=> d!111587 (= (array_inv!19957 (_values!5473 thiss!1181)) (bvsge (size!25835 (_values!5473 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900485 d!111587))

(declare-fun d!111589 () Bool)

(declare-fun e!504160 () Bool)

(assert (=> d!111589 e!504160))

(declare-fun res!608232 () Bool)

(assert (=> d!111589 (=> res!608232 e!504160)))

(declare-fun lt!406922 () SeekEntryResult!8942)

(assert (=> d!111589 (= res!608232 (not ((_ is Found!8942) lt!406922)))))

(assert (=> d!111589 (= lt!406922 (seekEntry!0 key!785 (_keys!10257 thiss!1181) (mask!26242 thiss!1181)))))

(declare-fun lt!406921 () Unit!30536)

(declare-fun choose!1526 (array!52805 array!52807 (_ BitVec 32) (_ BitVec 32) V!29479 V!29479 (_ BitVec 64)) Unit!30536)

(assert (=> d!111589 (= lt!406921 (choose!1526 (_keys!10257 thiss!1181) (_values!5473 thiss!1181) (mask!26242 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) key!785))))

(assert (=> d!111589 (validMask!0 (mask!26242 thiss!1181))))

(assert (=> d!111589 (= (lemmaSeekEntryGivesInRangeIndex!105 (_keys!10257 thiss!1181) (_values!5473 thiss!1181) (mask!26242 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) key!785) lt!406921)))

(declare-fun b!900679 () Bool)

(assert (=> b!900679 (= e!504160 (inRange!0 (index!38140 lt!406922) (mask!26242 thiss!1181)))))

(assert (= (and d!111589 (not res!608232)) b!900679))

(assert (=> d!111589 m!836389))

(declare-fun m!836551 () Bool)

(assert (=> d!111589 m!836551))

(assert (=> d!111589 m!836373))

(declare-fun m!836553 () Bool)

(assert (=> b!900679 m!836553))

(assert (=> b!900484 d!111589))

(declare-fun b!900692 () Bool)

(declare-fun e!504168 () SeekEntryResult!8942)

(declare-fun lt!406933 () SeekEntryResult!8942)

(assert (=> b!900692 (= e!504168 (Found!8942 (index!38141 lt!406933)))))

(declare-fun d!111591 () Bool)

(declare-fun lt!406932 () SeekEntryResult!8942)

(assert (=> d!111591 (and (or ((_ is MissingVacant!8942) lt!406932) (not ((_ is Found!8942) lt!406932)) (and (bvsge (index!38140 lt!406932) #b00000000000000000000000000000000) (bvslt (index!38140 lt!406932) (size!25834 (_keys!10257 thiss!1181))))) (not ((_ is MissingVacant!8942) lt!406932)) (or (not ((_ is Found!8942) lt!406932)) (= (select (arr!25373 (_keys!10257 thiss!1181)) (index!38140 lt!406932)) key!785)))))

(declare-fun e!504167 () SeekEntryResult!8942)

(assert (=> d!111591 (= lt!406932 e!504167)))

(declare-fun c!95349 () Bool)

(assert (=> d!111591 (= c!95349 (and ((_ is Intermediate!8942) lt!406933) (undefined!9754 lt!406933)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52805 (_ BitVec 32)) SeekEntryResult!8942)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111591 (= lt!406933 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26242 thiss!1181)) key!785 (_keys!10257 thiss!1181) (mask!26242 thiss!1181)))))

(assert (=> d!111591 (validMask!0 (mask!26242 thiss!1181))))

(assert (=> d!111591 (= (seekEntry!0 key!785 (_keys!10257 thiss!1181) (mask!26242 thiss!1181)) lt!406932)))

(declare-fun b!900693 () Bool)

(declare-fun c!95351 () Bool)

(declare-fun lt!406934 () (_ BitVec 64))

(assert (=> b!900693 (= c!95351 (= lt!406934 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!504169 () SeekEntryResult!8942)

(assert (=> b!900693 (= e!504168 e!504169)))

(declare-fun b!900694 () Bool)

(assert (=> b!900694 (= e!504169 (MissingZero!8942 (index!38141 lt!406933)))))

(declare-fun b!900695 () Bool)

(declare-fun lt!406931 () SeekEntryResult!8942)

(assert (=> b!900695 (= e!504169 (ite ((_ is MissingVacant!8942) lt!406931) (MissingZero!8942 (index!38142 lt!406931)) lt!406931))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52805 (_ BitVec 32)) SeekEntryResult!8942)

(assert (=> b!900695 (= lt!406931 (seekKeyOrZeroReturnVacant!0 (x!76742 lt!406933) (index!38141 lt!406933) (index!38141 lt!406933) key!785 (_keys!10257 thiss!1181) (mask!26242 thiss!1181)))))

(declare-fun b!900696 () Bool)

(assert (=> b!900696 (= e!504167 e!504168)))

(assert (=> b!900696 (= lt!406934 (select (arr!25373 (_keys!10257 thiss!1181)) (index!38141 lt!406933)))))

(declare-fun c!95350 () Bool)

(assert (=> b!900696 (= c!95350 (= lt!406934 key!785))))

(declare-fun b!900697 () Bool)

(assert (=> b!900697 (= e!504167 Undefined!8942)))

(assert (= (and d!111591 c!95349) b!900697))

(assert (= (and d!111591 (not c!95349)) b!900696))

(assert (= (and b!900696 c!95350) b!900692))

(assert (= (and b!900696 (not c!95350)) b!900693))

(assert (= (and b!900693 c!95351) b!900694))

(assert (= (and b!900693 (not c!95351)) b!900695))

(declare-fun m!836555 () Bool)

(assert (=> d!111591 m!836555))

(declare-fun m!836557 () Bool)

(assert (=> d!111591 m!836557))

(assert (=> d!111591 m!836557))

(declare-fun m!836559 () Bool)

(assert (=> d!111591 m!836559))

(assert (=> d!111591 m!836373))

(declare-fun m!836561 () Bool)

(assert (=> b!900695 m!836561))

(declare-fun m!836563 () Bool)

(assert (=> b!900696 m!836563))

(assert (=> b!900484 d!111591))

(declare-fun b!900706 () Bool)

(declare-fun e!504176 () Bool)

(declare-fun call!40061 () Bool)

(assert (=> b!900706 (= e!504176 call!40061)))

(declare-fun b!900707 () Bool)

(declare-fun e!504177 () Bool)

(declare-fun e!504178 () Bool)

(assert (=> b!900707 (= e!504177 e!504178)))

(declare-fun c!95354 () Bool)

(assert (=> b!900707 (= c!95354 (validKeyInArray!0 (select (arr!25373 (_keys!10257 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900708 () Bool)

(assert (=> b!900708 (= e!504178 call!40061)))

(declare-fun b!900709 () Bool)

(assert (=> b!900709 (= e!504178 e!504176)))

(declare-fun lt!406941 () (_ BitVec 64))

(assert (=> b!900709 (= lt!406941 (select (arr!25373 (_keys!10257 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406942 () Unit!30536)

(assert (=> b!900709 (= lt!406942 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10257 thiss!1181) lt!406941 #b00000000000000000000000000000000))))

(assert (=> b!900709 (arrayContainsKey!0 (_keys!10257 thiss!1181) lt!406941 #b00000000000000000000000000000000)))

(declare-fun lt!406943 () Unit!30536)

(assert (=> b!900709 (= lt!406943 lt!406942)))

(declare-fun res!608238 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52805 (_ BitVec 32)) SeekEntryResult!8942)

(assert (=> b!900709 (= res!608238 (= (seekEntryOrOpen!0 (select (arr!25373 (_keys!10257 thiss!1181)) #b00000000000000000000000000000000) (_keys!10257 thiss!1181) (mask!26242 thiss!1181)) (Found!8942 #b00000000000000000000000000000000)))))

(assert (=> b!900709 (=> (not res!608238) (not e!504176))))

(declare-fun bm!40058 () Bool)

(assert (=> bm!40058 (= call!40061 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10257 thiss!1181) (mask!26242 thiss!1181)))))

(declare-fun d!111593 () Bool)

(declare-fun res!608237 () Bool)

(assert (=> d!111593 (=> res!608237 e!504177)))

(assert (=> d!111593 (= res!608237 (bvsge #b00000000000000000000000000000000 (size!25834 (_keys!10257 thiss!1181))))))

(assert (=> d!111593 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10257 thiss!1181) (mask!26242 thiss!1181)) e!504177)))

(assert (= (and d!111593 (not res!608237)) b!900707))

(assert (= (and b!900707 c!95354) b!900709))

(assert (= (and b!900707 (not c!95354)) b!900708))

(assert (= (and b!900709 res!608238) b!900706))

(assert (= (or b!900706 b!900708) bm!40058))

(assert (=> b!900707 m!836473))

(assert (=> b!900707 m!836473))

(assert (=> b!900707 m!836479))

(assert (=> b!900709 m!836473))

(declare-fun m!836565 () Bool)

(assert (=> b!900709 m!836565))

(declare-fun m!836567 () Bool)

(assert (=> b!900709 m!836567))

(assert (=> b!900709 m!836473))

(declare-fun m!836569 () Bool)

(assert (=> b!900709 m!836569))

(declare-fun m!836571 () Bool)

(assert (=> bm!40058 m!836571))

(assert (=> b!900493 d!111593))

(declare-fun mapNonEmpty!29266 () Bool)

(declare-fun mapRes!29266 () Bool)

(declare-fun tp!56281 () Bool)

(declare-fun e!504183 () Bool)

(assert (=> mapNonEmpty!29266 (= mapRes!29266 (and tp!56281 e!504183))))

(declare-fun mapKey!29266 () (_ BitVec 32))

(declare-fun mapValue!29266 () ValueCell!8711)

(declare-fun mapRest!29266 () (Array (_ BitVec 32) ValueCell!8711))

(assert (=> mapNonEmpty!29266 (= mapRest!29257 (store mapRest!29266 mapKey!29266 mapValue!29266))))

(declare-fun condMapEmpty!29266 () Bool)

(declare-fun mapDefault!29266 () ValueCell!8711)

(assert (=> mapNonEmpty!29257 (= condMapEmpty!29266 (= mapRest!29257 ((as const (Array (_ BitVec 32) ValueCell!8711)) mapDefault!29266)))))

(declare-fun e!504184 () Bool)

(assert (=> mapNonEmpty!29257 (= tp!56265 (and e!504184 mapRes!29266))))

(declare-fun b!900716 () Bool)

(assert (=> b!900716 (= e!504183 tp_is_empty!18385)))

(declare-fun mapIsEmpty!29266 () Bool)

(assert (=> mapIsEmpty!29266 mapRes!29266))

(declare-fun b!900717 () Bool)

(assert (=> b!900717 (= e!504184 tp_is_empty!18385)))

(assert (= (and mapNonEmpty!29257 condMapEmpty!29266) mapIsEmpty!29266))

(assert (= (and mapNonEmpty!29257 (not condMapEmpty!29266)) mapNonEmpty!29266))

(assert (= (and mapNonEmpty!29266 ((_ is ValueCellFull!8711) mapValue!29266)) b!900716))

(assert (= (and mapNonEmpty!29257 ((_ is ValueCellFull!8711) mapDefault!29266)) b!900717))

(declare-fun m!836573 () Bool)

(assert (=> mapNonEmpty!29266 m!836573))

(declare-fun b_lambda!13007 () Bool)

(assert (= b_lambda!13005 (or (and b!900485 b_free!16057) b_lambda!13007)))

(check-sat tp_is_empty!18385 (not bm!40055) (not b!900675) (not b!900569) (not b!900674) (not b_lambda!13007) (not d!111575) (not bm!40058) (not b!900637) (not b!900643) (not b!900578) (not b!900576) (not b!900652) (not b!900630) (not b!900676) (not d!111591) (not d!111579) (not b_next!16057) (not b!900645) (not b!900666) (not b!900638) (not bm!40048) (not d!111565) (not b!900665) (not d!111583) (not b!900679) (not d!111589) (not b!900641) (not b!900650) (not b!900584) b_and!26361 (not bm!40050) (not bm!40046) (not b!900635) (not d!111569) (not b!900667) (not mapNonEmpty!29266) (not b!900709) (not b!900695) (not b!900640) (not d!111573) (not b!900707) (not bm!40049))
(check-sat b_and!26361 (not b_next!16057))
