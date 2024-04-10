; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75732 () Bool)

(assert start!75732)

(declare-fun b!890469 () Bool)

(declare-fun b_free!15703 () Bool)

(declare-fun b_next!15703 () Bool)

(assert (=> b!890469 (= b_free!15703 (not b_next!15703))))

(declare-fun tp!55077 () Bool)

(declare-fun b_and!25943 () Bool)

(assert (=> b!890469 (= tp!55077 b_and!25943)))

(declare-fun mapNonEmpty!28601 () Bool)

(declare-fun mapRes!28601 () Bool)

(declare-fun tp!55078 () Bool)

(declare-fun e!496653 () Bool)

(assert (=> mapNonEmpty!28601 (= mapRes!28601 (and tp!55078 e!496653))))

(declare-datatypes ((V!29007 0))(
  ( (V!29008 (val!9066 Int)) )
))
(declare-datatypes ((ValueCell!8534 0))(
  ( (ValueCellFull!8534 (v!11544 V!29007)) (EmptyCell!8534) )
))
(declare-fun mapValue!28601 () ValueCell!8534)

(declare-datatypes ((array!52042 0))(
  ( (array!52043 (arr!25027 (Array (_ BitVec 32) (_ BitVec 64))) (size!25471 (_ BitVec 32))) )
))
(declare-datatypes ((array!52044 0))(
  ( (array!52045 (arr!25028 (Array (_ BitVec 32) ValueCell!8534)) (size!25472 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4084 0))(
  ( (LongMapFixedSize!4085 (defaultEntry!5239 Int) (mask!25714 (_ BitVec 32)) (extraKeys!4933 (_ BitVec 32)) (zeroValue!5037 V!29007) (minValue!5037 V!29007) (_size!2097 (_ BitVec 32)) (_keys!9922 array!52042) (_values!5224 array!52044) (_vacant!2097 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4084)

(declare-fun mapRest!28601 () (Array (_ BitVec 32) ValueCell!8534))

(declare-fun mapKey!28601 () (_ BitVec 32))

(assert (=> mapNonEmpty!28601 (= (arr!25028 (_values!5224 thiss!1181)) (store mapRest!28601 mapKey!28601 mapValue!28601))))

(declare-fun b!890465 () Bool)

(declare-fun res!603343 () Bool)

(declare-fun e!496654 () Bool)

(assert (=> b!890465 (=> res!603343 e!496654)))

(assert (=> b!890465 (= res!603343 (or (not (= (size!25472 (_values!5224 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25714 thiss!1181)))) (not (= (size!25471 (_keys!9922 thiss!1181)) (size!25472 (_values!5224 thiss!1181)))) (bvslt (mask!25714 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4933 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4933 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!890466 () Bool)

(declare-fun res!603344 () Bool)

(declare-fun e!496655 () Bool)

(assert (=> b!890466 (=> (not res!603344) (not e!496655))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890466 (= res!603344 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890467 () Bool)

(declare-fun e!496649 () Bool)

(declare-datatypes ((SeekEntryResult!8800 0))(
  ( (MissingZero!8800 (index!37571 (_ BitVec 32))) (Found!8800 (index!37572 (_ BitVec 32))) (Intermediate!8800 (undefined!9612 Bool) (index!37573 (_ BitVec 32)) (x!75648 (_ BitVec 32))) (Undefined!8800) (MissingVacant!8800 (index!37574 (_ BitVec 32))) )
))
(declare-fun lt!402308 () SeekEntryResult!8800)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890467 (= e!496649 (inRange!0 (index!37572 lt!402308) (mask!25714 thiss!1181)))))

(declare-fun res!603342 () Bool)

(assert (=> start!75732 (=> (not res!603342) (not e!496655))))

(declare-fun valid!1584 (LongMapFixedSize!4084) Bool)

(assert (=> start!75732 (= res!603342 (valid!1584 thiss!1181))))

(assert (=> start!75732 e!496655))

(declare-fun e!496651 () Bool)

(assert (=> start!75732 e!496651))

(assert (=> start!75732 true))

(declare-fun b!890468 () Bool)

(declare-fun tp_is_empty!18031 () Bool)

(assert (=> b!890468 (= e!496653 tp_is_empty!18031)))

(declare-fun e!496648 () Bool)

(declare-fun array_inv!19674 (array!52042) Bool)

(declare-fun array_inv!19675 (array!52044) Bool)

(assert (=> b!890469 (= e!496651 (and tp!55077 tp_is_empty!18031 (array_inv!19674 (_keys!9922 thiss!1181)) (array_inv!19675 (_values!5224 thiss!1181)) e!496648))))

(declare-fun b!890470 () Bool)

(declare-fun res!603341 () Bool)

(assert (=> b!890470 (=> res!603341 e!496654)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52042 (_ BitVec 32)) Bool)

(assert (=> b!890470 (= res!603341 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9922 thiss!1181) (mask!25714 thiss!1181))))))

(declare-fun b!890471 () Bool)

(assert (=> b!890471 (= e!496654 true)))

(declare-fun lt!402309 () Bool)

(declare-datatypes ((List!17719 0))(
  ( (Nil!17716) (Cons!17715 (h!18846 (_ BitVec 64)) (t!25018 List!17719)) )
))
(declare-fun arrayNoDuplicates!0 (array!52042 (_ BitVec 32) List!17719) Bool)

(assert (=> b!890471 (= lt!402309 (arrayNoDuplicates!0 (_keys!9922 thiss!1181) #b00000000000000000000000000000000 Nil!17716))))

(declare-fun b!890472 () Bool)

(declare-fun e!496656 () Bool)

(assert (=> b!890472 (= e!496655 (not e!496656))))

(declare-fun res!603339 () Bool)

(assert (=> b!890472 (=> res!603339 e!496656)))

(assert (=> b!890472 (= res!603339 (not (is-Found!8800 lt!402308)))))

(assert (=> b!890472 e!496649))

(declare-fun res!603340 () Bool)

(assert (=> b!890472 (=> res!603340 e!496649)))

(assert (=> b!890472 (= res!603340 (not (is-Found!8800 lt!402308)))))

(declare-datatypes ((Unit!30300 0))(
  ( (Unit!30301) )
))
(declare-fun lt!402307 () Unit!30300)

(declare-fun lemmaSeekEntryGivesInRangeIndex!11 (array!52042 array!52044 (_ BitVec 32) (_ BitVec 32) V!29007 V!29007 (_ BitVec 64)) Unit!30300)

(assert (=> b!890472 (= lt!402307 (lemmaSeekEntryGivesInRangeIndex!11 (_keys!9922 thiss!1181) (_values!5224 thiss!1181) (mask!25714 thiss!1181) (extraKeys!4933 thiss!1181) (zeroValue!5037 thiss!1181) (minValue!5037 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52042 (_ BitVec 32)) SeekEntryResult!8800)

(assert (=> b!890472 (= lt!402308 (seekEntry!0 key!785 (_keys!9922 thiss!1181) (mask!25714 thiss!1181)))))

(declare-fun b!890473 () Bool)

(assert (=> b!890473 (= e!496656 e!496654)))

(declare-fun res!603338 () Bool)

(assert (=> b!890473 (=> res!603338 e!496654)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890473 (= res!603338 (not (validMask!0 (mask!25714 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52042 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890473 (arrayContainsKey!0 (_keys!9922 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402310 () Unit!30300)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52042 (_ BitVec 64) (_ BitVec 32)) Unit!30300)

(assert (=> b!890473 (= lt!402310 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9922 thiss!1181) key!785 (index!37572 lt!402308)))))

(declare-fun b!890474 () Bool)

(declare-fun e!496652 () Bool)

(assert (=> b!890474 (= e!496648 (and e!496652 mapRes!28601))))

(declare-fun condMapEmpty!28601 () Bool)

(declare-fun mapDefault!28601 () ValueCell!8534)

