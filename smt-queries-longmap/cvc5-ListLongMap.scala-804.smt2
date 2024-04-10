; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19318 () Bool)

(assert start!19318)

(declare-fun b!190057 () Bool)

(declare-fun b_free!4663 () Bool)

(declare-fun b_next!4663 () Bool)

(assert (=> b!190057 (= b_free!4663 (not b_next!4663))))

(declare-fun tp!16828 () Bool)

(declare-fun b_and!11309 () Bool)

(assert (=> b!190057 (= tp!16828 b_and!11309)))

(declare-fun b!190053 () Bool)

(declare-fun e!125084 () Bool)

(declare-fun tp_is_empty!4435 () Bool)

(assert (=> b!190053 (= e!125084 tp_is_empty!4435)))

(declare-fun b!190054 () Bool)

(declare-datatypes ((Unit!5740 0))(
  ( (Unit!5741) )
))
(declare-fun e!125087 () Unit!5740)

(declare-fun lt!94168 () Unit!5740)

(assert (=> b!190054 (= e!125087 lt!94168)))

(declare-datatypes ((V!5561 0))(
  ( (V!5562 (val!2262 Int)) )
))
(declare-datatypes ((ValueCell!1874 0))(
  ( (ValueCellFull!1874 (v!4189 V!5561)) (EmptyCell!1874) )
))
(declare-datatypes ((array!8103 0))(
  ( (array!8104 (arr!3819 (Array (_ BitVec 32) (_ BitVec 64))) (size!4139 (_ BitVec 32))) )
))
(declare-datatypes ((array!8105 0))(
  ( (array!8106 (arr!3820 (Array (_ BitVec 32) ValueCell!1874)) (size!4140 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2656 0))(
  ( (LongMapFixedSize!2657 (defaultEntry!3880 Int) (mask!9078 (_ BitVec 32)) (extraKeys!3617 (_ BitVec 32)) (zeroValue!3721 V!5561) (minValue!3721 V!5561) (_size!1377 (_ BitVec 32)) (_keys!5849 array!8103) (_values!3863 array!8105) (_vacant!1377 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2656)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!169 (array!8103 array!8105 (_ BitVec 32) (_ BitVec 32) V!5561 V!5561 (_ BitVec 64) Int) Unit!5740)

(assert (=> b!190054 (= lt!94168 (lemmaInListMapThenSeekEntryOrOpenFindsIt!169 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) key!828 (defaultEntry!3880 thiss!1248)))))

(declare-fun res!89856 () Bool)

(declare-datatypes ((SeekEntryResult!671 0))(
  ( (MissingZero!671 (index!4854 (_ BitVec 32))) (Found!671 (index!4855 (_ BitVec 32))) (Intermediate!671 (undefined!1483 Bool) (index!4856 (_ BitVec 32)) (x!20473 (_ BitVec 32))) (Undefined!671) (MissingVacant!671 (index!4857 (_ BitVec 32))) )
))
(declare-fun lt!94167 () SeekEntryResult!671)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!190054 (= res!89856 (inRange!0 (index!4855 lt!94167) (mask!9078 thiss!1248)))))

(declare-fun e!125085 () Bool)

(assert (=> b!190054 (=> (not res!89856) (not e!125085))))

(assert (=> b!190054 e!125085))

(declare-fun b!190055 () Bool)

(declare-fun Unit!5742 () Unit!5740)

(assert (=> b!190055 (= e!125087 Unit!5742)))

(declare-fun lt!94169 () Unit!5740)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!173 (array!8103 array!8105 (_ BitVec 32) (_ BitVec 32) V!5561 V!5561 (_ BitVec 64) Int) Unit!5740)

(assert (=> b!190055 (= lt!94169 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!173 (_keys!5849 thiss!1248) (_values!3863 thiss!1248) (mask!9078 thiss!1248) (extraKeys!3617 thiss!1248) (zeroValue!3721 thiss!1248) (minValue!3721 thiss!1248) key!828 (defaultEntry!3880 thiss!1248)))))

(assert (=> b!190055 false))

(declare-fun res!89854 () Bool)

(declare-fun e!125083 () Bool)

(assert (=> start!19318 (=> (not res!89854) (not e!125083))))

(declare-fun valid!1091 (LongMapFixedSize!2656) Bool)

(assert (=> start!19318 (= res!89854 (valid!1091 thiss!1248))))

(assert (=> start!19318 e!125083))

(declare-fun e!125081 () Bool)

(assert (=> start!19318 e!125081))

(assert (=> start!19318 true))

(assert (=> start!19318 tp_is_empty!4435))

(declare-fun b!190056 () Bool)

(assert (=> b!190056 (= e!125085 (= (select (arr!3819 (_keys!5849 thiss!1248)) (index!4855 lt!94167)) key!828))))

(declare-fun e!125078 () Bool)

(declare-fun array_inv!2475 (array!8103) Bool)

(declare-fun array_inv!2476 (array!8105) Bool)

(assert (=> b!190057 (= e!125081 (and tp!16828 tp_is_empty!4435 (array_inv!2475 (_keys!5849 thiss!1248)) (array_inv!2476 (_values!3863 thiss!1248)) e!125078))))

(declare-fun mapNonEmpty!7654 () Bool)

(declare-fun mapRes!7654 () Bool)

(declare-fun tp!16827 () Bool)

(declare-fun e!125079 () Bool)

(assert (=> mapNonEmpty!7654 (= mapRes!7654 (and tp!16827 e!125079))))

(declare-fun mapRest!7654 () (Array (_ BitVec 32) ValueCell!1874))

(declare-fun mapValue!7654 () ValueCell!1874)

(declare-fun mapKey!7654 () (_ BitVec 32))

(assert (=> mapNonEmpty!7654 (= (arr!3820 (_values!3863 thiss!1248)) (store mapRest!7654 mapKey!7654 mapValue!7654))))

(declare-fun b!190058 () Bool)

(declare-fun e!125082 () Bool)

(assert (=> b!190058 (= e!125083 e!125082)))

(declare-fun res!89853 () Bool)

(assert (=> b!190058 (=> (not res!89853) (not e!125082))))

(assert (=> b!190058 (= res!89853 (and (not (is-Undefined!671 lt!94167)) (not (is-MissingVacant!671 lt!94167)) (not (is-MissingZero!671 lt!94167)) (is-Found!671 lt!94167)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8103 (_ BitVec 32)) SeekEntryResult!671)

(assert (=> b!190058 (= lt!94167 (seekEntryOrOpen!0 key!828 (_keys!5849 thiss!1248) (mask!9078 thiss!1248)))))

(declare-fun b!190059 () Bool)

(declare-fun res!89857 () Bool)

(assert (=> b!190059 (=> (not res!89857) (not e!125083))))

(assert (=> b!190059 (= res!89857 (not (= key!828 (bvneg key!828))))))

(declare-fun b!190060 () Bool)

(declare-fun e!125086 () Bool)

(assert (=> b!190060 (= e!125086 (= (size!4140 (_values!3863 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9078 thiss!1248))))))

(declare-fun b!190061 () Bool)

(assert (=> b!190061 (= e!125078 (and e!125084 mapRes!7654))))

(declare-fun condMapEmpty!7654 () Bool)

(declare-fun mapDefault!7654 () ValueCell!1874)

