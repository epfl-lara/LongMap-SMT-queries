; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77228 () Bool)

(assert start!77228)

(declare-fun b!901115 () Bool)

(declare-fun b_free!16069 () Bool)

(declare-fun b_next!16069 () Bool)

(assert (=> b!901115 (= b_free!16069 (not b_next!16069))))

(declare-fun tp!56304 () Bool)

(declare-fun b_and!26395 () Bool)

(assert (=> b!901115 (= tp!56304 b_and!26395)))

(declare-fun res!608454 () Bool)

(declare-fun e!504439 () Bool)

(assert (=> start!77228 (=> (not res!608454) (not e!504439))))

(declare-datatypes ((array!52848 0))(
  ( (array!52849 (arr!25393 (Array (_ BitVec 32) (_ BitVec 64))) (size!25852 (_ BitVec 32))) )
))
(declare-datatypes ((V!29495 0))(
  ( (V!29496 (val!9249 Int)) )
))
(declare-datatypes ((ValueCell!8717 0))(
  ( (ValueCellFull!8717 (v!11748 V!29495)) (EmptyCell!8717) )
))
(declare-datatypes ((array!52850 0))(
  ( (array!52851 (arr!25394 (Array (_ BitVec 32) ValueCell!8717)) (size!25853 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4450 0))(
  ( (LongMapFixedSize!4451 (defaultEntry!5463 Int) (mask!26266 (_ BitVec 32)) (extraKeys!5191 (_ BitVec 32)) (zeroValue!5295 V!29495) (minValue!5295 V!29495) (_size!2280 (_ BitVec 32)) (_keys!10273 array!52848) (_values!5482 array!52850) (_vacant!2280 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4450)

(declare-fun valid!1707 (LongMapFixedSize!4450) Bool)

(assert (=> start!77228 (= res!608454 (valid!1707 thiss!1181))))

(assert (=> start!77228 e!504439))

(declare-fun e!504437 () Bool)

(assert (=> start!77228 e!504437))

(assert (=> start!77228 true))

(declare-fun b!901102 () Bool)

(declare-fun res!608451 () Bool)

(assert (=> b!901102 (=> (not res!608451) (not e!504439))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!901102 (= res!608451 (not (= key!785 (bvneg key!785))))))

(declare-fun b!901103 () Bool)

(declare-fun res!608458 () Bool)

(declare-fun e!504432 () Bool)

(assert (=> b!901103 (=> res!608458 e!504432)))

(declare-datatypes ((SeekEntryResult!8947 0))(
  ( (MissingZero!8947 (index!38159 (_ BitVec 32))) (Found!8947 (index!38160 (_ BitVec 32))) (Intermediate!8947 (undefined!9759 Bool) (index!38161 (_ BitVec 32)) (x!76778 (_ BitVec 32))) (Undefined!8947) (MissingVacant!8947 (index!38162 (_ BitVec 32))) )
))
(declare-fun lt!407237 () SeekEntryResult!8947)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!901103 (= res!608458 (not (inRange!0 (index!38160 lt!407237) (mask!26266 thiss!1181))))))

(declare-fun b!901104 () Bool)

(declare-fun res!608455 () Bool)

(assert (=> b!901104 (=> res!608455 e!504432)))

(declare-datatypes ((List!17868 0))(
  ( (Nil!17865) (Cons!17864 (h!19010 (_ BitVec 64)) (t!25225 List!17868)) )
))
(declare-fun arrayNoDuplicates!0 (array!52848 (_ BitVec 32) List!17868) Bool)

(assert (=> b!901104 (= res!608455 (not (arrayNoDuplicates!0 (_keys!10273 thiss!1181) #b00000000000000000000000000000000 Nil!17865)))))

(declare-fun b!901105 () Bool)

(assert (=> b!901105 (= e!504432 (= (select (arr!25393 (_keys!10273 thiss!1181)) (index!38160 lt!407237)) key!785))))

(declare-fun b!901106 () Bool)

(declare-fun res!608457 () Bool)

(assert (=> b!901106 (=> res!608457 e!504432)))

(declare-datatypes ((tuple2!12064 0))(
  ( (tuple2!12065 (_1!6043 (_ BitVec 64)) (_2!6043 V!29495)) )
))
(declare-datatypes ((List!17869 0))(
  ( (Nil!17866) (Cons!17865 (h!19011 tuple2!12064) (t!25226 List!17869)) )
))
(declare-datatypes ((ListLongMap!10761 0))(
  ( (ListLongMap!10762 (toList!5396 List!17869)) )
))
(declare-fun lt!407235 () ListLongMap!10761)

(declare-fun contains!4435 (ListLongMap!10761 (_ BitVec 64)) Bool)

(assert (=> b!901106 (= res!608457 (not (contains!4435 lt!407235 key!785)))))

(declare-fun b!901107 () Bool)

(declare-fun e!504435 () Bool)

(declare-fun tp_is_empty!18397 () Bool)

(assert (=> b!901107 (= e!504435 tp_is_empty!18397)))

(declare-fun b!901108 () Bool)

(declare-fun e!504438 () Bool)

(assert (=> b!901108 (= e!504439 (not e!504438))))

(declare-fun res!608453 () Bool)

(assert (=> b!901108 (=> res!608453 e!504438)))

(assert (=> b!901108 (= res!608453 (not (is-Found!8947 lt!407237)))))

(declare-fun e!504440 () Bool)

(assert (=> b!901108 e!504440))

(declare-fun res!608456 () Bool)

(assert (=> b!901108 (=> res!608456 e!504440)))

(assert (=> b!901108 (= res!608456 (not (is-Found!8947 lt!407237)))))

(declare-datatypes ((Unit!30607 0))(
  ( (Unit!30608) )
))
(declare-fun lt!407239 () Unit!30607)

(declare-fun lemmaSeekEntryGivesInRangeIndex!108 (array!52848 array!52850 (_ BitVec 32) (_ BitVec 32) V!29495 V!29495 (_ BitVec 64)) Unit!30607)

(assert (=> b!901108 (= lt!407239 (lemmaSeekEntryGivesInRangeIndex!108 (_keys!10273 thiss!1181) (_values!5482 thiss!1181) (mask!26266 thiss!1181) (extraKeys!5191 thiss!1181) (zeroValue!5295 thiss!1181) (minValue!5295 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52848 (_ BitVec 32)) SeekEntryResult!8947)

(assert (=> b!901108 (= lt!407237 (seekEntry!0 key!785 (_keys!10273 thiss!1181) (mask!26266 thiss!1181)))))

(declare-fun b!901109 () Bool)

(declare-fun res!608450 () Bool)

(assert (=> b!901109 (=> res!608450 e!504432)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52848 (_ BitVec 32)) Bool)

(assert (=> b!901109 (= res!608450 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10273 thiss!1181) (mask!26266 thiss!1181))))))

(declare-fun mapNonEmpty!29278 () Bool)

(declare-fun mapRes!29278 () Bool)

(declare-fun tp!56303 () Bool)

(assert (=> mapNonEmpty!29278 (= mapRes!29278 (and tp!56303 e!504435))))

(declare-fun mapValue!29278 () ValueCell!8717)

(declare-fun mapKey!29278 () (_ BitVec 32))

(declare-fun mapRest!29278 () (Array (_ BitVec 32) ValueCell!8717))

(assert (=> mapNonEmpty!29278 (= (arr!25394 (_values!5482 thiss!1181)) (store mapRest!29278 mapKey!29278 mapValue!29278))))

(declare-fun mapIsEmpty!29278 () Bool)

(assert (=> mapIsEmpty!29278 mapRes!29278))

(declare-fun b!901110 () Bool)

(declare-fun e!504436 () Bool)

(declare-fun e!504433 () Bool)

(assert (=> b!901110 (= e!504436 (and e!504433 mapRes!29278))))

(declare-fun condMapEmpty!29278 () Bool)

(declare-fun mapDefault!29278 () ValueCell!8717)

