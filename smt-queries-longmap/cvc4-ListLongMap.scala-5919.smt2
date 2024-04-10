; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76808 () Bool)

(assert start!76808)

(declare-fun b!898491 () Bool)

(declare-fun b_free!16019 () Bool)

(declare-fun b_next!16019 () Bool)

(assert (=> b!898491 (= b_free!16019 (not b_next!16019))))

(declare-fun tp!56125 () Bool)

(declare-fun b_and!26313 () Bool)

(assert (=> b!898491 (= tp!56125 b_and!26313)))

(declare-fun b!898486 () Bool)

(declare-fun e!502625 () Bool)

(declare-datatypes ((SeekEntryResult!8927 0))(
  ( (MissingZero!8927 (index!38079 (_ BitVec 32))) (Found!8927 (index!38080 (_ BitVec 32))) (Intermediate!8927 (undefined!9739 Bool) (index!38081 (_ BitVec 32)) (x!76574 (_ BitVec 32))) (Undefined!8927) (MissingVacant!8927 (index!38082 (_ BitVec 32))) )
))
(declare-fun lt!405617 () SeekEntryResult!8927)

(declare-datatypes ((array!52732 0))(
  ( (array!52733 (arr!25343 (Array (_ BitVec 32) (_ BitVec 64))) (size!25798 (_ BitVec 32))) )
))
(declare-datatypes ((V!29427 0))(
  ( (V!29428 (val!9224 Int)) )
))
(declare-datatypes ((ValueCell!8692 0))(
  ( (ValueCellFull!8692 (v!11715 V!29427)) (EmptyCell!8692) )
))
(declare-datatypes ((array!52734 0))(
  ( (array!52735 (arr!25344 (Array (_ BitVec 32) ValueCell!8692)) (size!25799 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4400 0))(
  ( (LongMapFixedSize!4401 (defaultEntry!5414 Int) (mask!26144 (_ BitVec 32)) (extraKeys!5130 (_ BitVec 32)) (zeroValue!5234 V!29427) (minValue!5234 V!29427) (_size!2255 (_ BitVec 32)) (_keys!10189 array!52732) (_values!5421 array!52734) (_vacant!2255 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4400)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!898486 (= e!502625 (inRange!0 (index!38080 lt!405617) (mask!26144 thiss!1181)))))

(declare-fun b!898487 () Bool)

(declare-fun e!502624 () Bool)

(declare-fun e!502621 () Bool)

(assert (=> b!898487 (= e!502624 e!502621)))

(declare-fun res!607181 () Bool)

(assert (=> b!898487 (=> res!607181 e!502621)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!898487 (= res!607181 (not (validMask!0 (mask!26144 thiss!1181))))))

(declare-datatypes ((tuple2!12036 0))(
  ( (tuple2!12037 (_1!6029 (_ BitVec 64)) (_2!6029 V!29427)) )
))
(declare-datatypes ((List!17841 0))(
  ( (Nil!17838) (Cons!17837 (h!18979 tuple2!12036) (t!25182 List!17841)) )
))
(declare-datatypes ((ListLongMap!10733 0))(
  ( (ListLongMap!10734 (toList!5382 List!17841)) )
))
(declare-fun contains!4411 (ListLongMap!10733 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2656 (array!52732 array!52734 (_ BitVec 32) (_ BitVec 32) V!29427 V!29427 (_ BitVec 32) Int) ListLongMap!10733)

(assert (=> b!898487 (contains!4411 (getCurrentListMap!2656 (_keys!10189 thiss!1181) (_values!5421 thiss!1181) (mask!26144 thiss!1181) (extraKeys!5130 thiss!1181) (zeroValue!5234 thiss!1181) (minValue!5234 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5414 thiss!1181)) (select (arr!25343 (_keys!10189 thiss!1181)) (index!38080 lt!405617)))))

(declare-datatypes ((Unit!30540 0))(
  ( (Unit!30541) )
))
(declare-fun lt!405616 () Unit!30540)

(declare-fun lemmaValidKeyInArrayIsInListMap!245 (array!52732 array!52734 (_ BitVec 32) (_ BitVec 32) V!29427 V!29427 (_ BitVec 32) Int) Unit!30540)

(assert (=> b!898487 (= lt!405616 (lemmaValidKeyInArrayIsInListMap!245 (_keys!10189 thiss!1181) (_values!5421 thiss!1181) (mask!26144 thiss!1181) (extraKeys!5130 thiss!1181) (zeroValue!5234 thiss!1181) (minValue!5234 thiss!1181) (index!38080 lt!405617) (defaultEntry!5414 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52732 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!898487 (arrayContainsKey!0 (_keys!10189 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405618 () Unit!30540)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52732 (_ BitVec 64) (_ BitVec 32)) Unit!30540)

(assert (=> b!898487 (= lt!405618 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10189 thiss!1181) key!785 (index!38080 lt!405617)))))

(declare-fun b!898488 () Bool)

(declare-fun e!502623 () Bool)

(assert (=> b!898488 (= e!502623 (not e!502624))))

(declare-fun res!607179 () Bool)

(assert (=> b!898488 (=> res!607179 e!502624)))

(assert (=> b!898488 (= res!607179 (not (is-Found!8927 lt!405617)))))

(assert (=> b!898488 e!502625))

(declare-fun res!607178 () Bool)

(assert (=> b!898488 (=> res!607178 e!502625)))

(assert (=> b!898488 (= res!607178 (not (is-Found!8927 lt!405617)))))

(declare-fun lt!405619 () Unit!30540)

(declare-fun lemmaSeekEntryGivesInRangeIndex!92 (array!52732 array!52734 (_ BitVec 32) (_ BitVec 32) V!29427 V!29427 (_ BitVec 64)) Unit!30540)

(assert (=> b!898488 (= lt!405619 (lemmaSeekEntryGivesInRangeIndex!92 (_keys!10189 thiss!1181) (_values!5421 thiss!1181) (mask!26144 thiss!1181) (extraKeys!5130 thiss!1181) (zeroValue!5234 thiss!1181) (minValue!5234 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52732 (_ BitVec 32)) SeekEntryResult!8927)

(assert (=> b!898488 (= lt!405617 (seekEntry!0 key!785 (_keys!10189 thiss!1181) (mask!26144 thiss!1181)))))

(declare-fun b!898489 () Bool)

(declare-fun e!502622 () Bool)

(declare-fun tp_is_empty!18347 () Bool)

(assert (=> b!898489 (= e!502622 tp_is_empty!18347)))

(declare-fun b!898490 () Bool)

(declare-fun e!502620 () Bool)

(assert (=> b!898490 (= e!502620 tp_is_empty!18347)))

(declare-fun e!502626 () Bool)

(declare-fun e!502628 () Bool)

(declare-fun array_inv!19890 (array!52732) Bool)

(declare-fun array_inv!19891 (array!52734) Bool)

(assert (=> b!898491 (= e!502626 (and tp!56125 tp_is_empty!18347 (array_inv!19890 (_keys!10189 thiss!1181)) (array_inv!19891 (_values!5421 thiss!1181)) e!502628))))

(declare-fun res!607182 () Bool)

(assert (=> start!76808 (=> (not res!607182) (not e!502623))))

(declare-fun valid!1692 (LongMapFixedSize!4400) Bool)

(assert (=> start!76808 (= res!607182 (valid!1692 thiss!1181))))

(assert (=> start!76808 e!502623))

(assert (=> start!76808 e!502626))

(assert (=> start!76808 true))

(declare-fun b!898492 () Bool)

(declare-fun res!607180 () Bool)

(assert (=> b!898492 (=> (not res!607180) (not e!502623))))

(assert (=> b!898492 (= res!607180 (not (= key!785 (bvneg key!785))))))

(declare-fun mapNonEmpty!29175 () Bool)

(declare-fun mapRes!29175 () Bool)

(declare-fun tp!56126 () Bool)

(assert (=> mapNonEmpty!29175 (= mapRes!29175 (and tp!56126 e!502620))))

(declare-fun mapKey!29175 () (_ BitVec 32))

(declare-fun mapRest!29175 () (Array (_ BitVec 32) ValueCell!8692))

(declare-fun mapValue!29175 () ValueCell!8692)

(assert (=> mapNonEmpty!29175 (= (arr!25344 (_values!5421 thiss!1181)) (store mapRest!29175 mapKey!29175 mapValue!29175))))

(declare-fun b!898493 () Bool)

(assert (=> b!898493 (= e!502621 (= (size!25799 (_values!5421 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26144 thiss!1181))))))

(declare-fun mapIsEmpty!29175 () Bool)

(assert (=> mapIsEmpty!29175 mapRes!29175))

(declare-fun b!898494 () Bool)

(assert (=> b!898494 (= e!502628 (and e!502622 mapRes!29175))))

(declare-fun condMapEmpty!29175 () Bool)

(declare-fun mapDefault!29175 () ValueCell!8692)

