; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75738 () Bool)

(assert start!75738)

(declare-fun b!890568 () Bool)

(declare-fun b_free!15709 () Bool)

(declare-fun b_next!15709 () Bool)

(assert (=> b!890568 (= b_free!15709 (not b_next!15709))))

(declare-fun tp!55096 () Bool)

(declare-fun b_and!25949 () Bool)

(assert (=> b!890568 (= tp!55096 b_and!25949)))

(declare-fun b!890564 () Bool)

(declare-fun res!603405 () Bool)

(declare-fun e!496730 () Bool)

(assert (=> b!890564 (=> res!603405 e!496730)))

(declare-datatypes ((array!52054 0))(
  ( (array!52055 (arr!25033 (Array (_ BitVec 32) (_ BitVec 64))) (size!25477 (_ BitVec 32))) )
))
(declare-datatypes ((V!29015 0))(
  ( (V!29016 (val!9069 Int)) )
))
(declare-datatypes ((ValueCell!8537 0))(
  ( (ValueCellFull!8537 (v!11547 V!29015)) (EmptyCell!8537) )
))
(declare-datatypes ((array!52056 0))(
  ( (array!52057 (arr!25034 (Array (_ BitVec 32) ValueCell!8537)) (size!25478 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4090 0))(
  ( (LongMapFixedSize!4091 (defaultEntry!5242 Int) (mask!25719 (_ BitVec 32)) (extraKeys!4936 (_ BitVec 32)) (zeroValue!5040 V!29015) (minValue!5040 V!29015) (_size!2100 (_ BitVec 32)) (_keys!9925 array!52054) (_values!5227 array!52056) (_vacant!2100 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4090)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52054 (_ BitVec 32)) Bool)

(assert (=> b!890564 (= res!603405 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9925 thiss!1181) (mask!25719 thiss!1181))))))

(declare-fun b!890565 () Bool)

(declare-fun e!496734 () Bool)

(declare-fun tp_is_empty!18037 () Bool)

(assert (=> b!890565 (= e!496734 tp_is_empty!18037)))

(declare-fun res!603404 () Bool)

(declare-fun e!496736 () Bool)

(assert (=> start!75738 (=> (not res!603404) (not e!496736))))

(declare-fun valid!1587 (LongMapFixedSize!4090) Bool)

(assert (=> start!75738 (= res!603404 (valid!1587 thiss!1181))))

(assert (=> start!75738 e!496736))

(declare-fun e!496735 () Bool)

(assert (=> start!75738 e!496735))

(assert (=> start!75738 true))

(declare-fun b!890566 () Bool)

(declare-fun e!496731 () Bool)

(assert (=> b!890566 (= e!496731 tp_is_empty!18037)))

(declare-fun b!890567 () Bool)

(declare-fun e!496737 () Bool)

(assert (=> b!890567 (= e!496737 e!496730)))

(declare-fun res!603403 () Bool)

(assert (=> b!890567 (=> res!603403 e!496730)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890567 (= res!603403 (not (validMask!0 (mask!25719 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52054 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890567 (arrayContainsKey!0 (_keys!9925 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30306 0))(
  ( (Unit!30307) )
))
(declare-fun lt!402346 () Unit!30306)

(declare-datatypes ((SeekEntryResult!8803 0))(
  ( (MissingZero!8803 (index!37583 (_ BitVec 32))) (Found!8803 (index!37584 (_ BitVec 32))) (Intermediate!8803 (undefined!9615 Bool) (index!37585 (_ BitVec 32)) (x!75659 (_ BitVec 32))) (Undefined!8803) (MissingVacant!8803 (index!37586 (_ BitVec 32))) )
))
(declare-fun lt!402344 () SeekEntryResult!8803)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52054 (_ BitVec 64) (_ BitVec 32)) Unit!30306)

(assert (=> b!890567 (= lt!402346 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9925 thiss!1181) key!785 (index!37584 lt!402344)))))

(declare-fun e!496733 () Bool)

(declare-fun array_inv!19678 (array!52054) Bool)

(declare-fun array_inv!19679 (array!52056) Bool)

(assert (=> b!890568 (= e!496735 (and tp!55096 tp_is_empty!18037 (array_inv!19678 (_keys!9925 thiss!1181)) (array_inv!19679 (_values!5227 thiss!1181)) e!496733))))

(declare-fun b!890569 () Bool)

(declare-fun res!603407 () Bool)

(assert (=> b!890569 (=> res!603407 e!496730)))

(assert (=> b!890569 (= res!603407 (or (not (= (size!25478 (_values!5227 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25719 thiss!1181)))) (not (= (size!25477 (_keys!9925 thiss!1181)) (size!25478 (_values!5227 thiss!1181)))) (bvslt (mask!25719 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4936 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4936 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!890570 () Bool)

(declare-fun res!603406 () Bool)

(assert (=> b!890570 (=> (not res!603406) (not e!496736))))

(assert (=> b!890570 (= res!603406 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890571 () Bool)

(declare-fun e!496732 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890571 (= e!496732 (inRange!0 (index!37584 lt!402344) (mask!25719 thiss!1181)))))

(declare-fun mapNonEmpty!28610 () Bool)

(declare-fun mapRes!28610 () Bool)

(declare-fun tp!55095 () Bool)

(assert (=> mapNonEmpty!28610 (= mapRes!28610 (and tp!55095 e!496734))))

(declare-fun mapKey!28610 () (_ BitVec 32))

(declare-fun mapRest!28610 () (Array (_ BitVec 32) ValueCell!8537))

(declare-fun mapValue!28610 () ValueCell!8537)

(assert (=> mapNonEmpty!28610 (= (arr!25034 (_values!5227 thiss!1181)) (store mapRest!28610 mapKey!28610 mapValue!28610))))

(declare-fun b!890572 () Bool)

(assert (=> b!890572 (= e!496730 true)))

(declare-fun lt!402343 () Bool)

(declare-datatypes ((List!17721 0))(
  ( (Nil!17718) (Cons!17717 (h!18848 (_ BitVec 64)) (t!25020 List!17721)) )
))
(declare-fun arrayNoDuplicates!0 (array!52054 (_ BitVec 32) List!17721) Bool)

(assert (=> b!890572 (= lt!402343 (arrayNoDuplicates!0 (_keys!9925 thiss!1181) #b00000000000000000000000000000000 Nil!17718))))

(declare-fun b!890573 () Bool)

(assert (=> b!890573 (= e!496736 (not e!496737))))

(declare-fun res!603401 () Bool)

(assert (=> b!890573 (=> res!603401 e!496737)))

(assert (=> b!890573 (= res!603401 (not (is-Found!8803 lt!402344)))))

(assert (=> b!890573 e!496732))

(declare-fun res!603402 () Bool)

(assert (=> b!890573 (=> res!603402 e!496732)))

(assert (=> b!890573 (= res!603402 (not (is-Found!8803 lt!402344)))))

(declare-fun lt!402345 () Unit!30306)

(declare-fun lemmaSeekEntryGivesInRangeIndex!13 (array!52054 array!52056 (_ BitVec 32) (_ BitVec 32) V!29015 V!29015 (_ BitVec 64)) Unit!30306)

(assert (=> b!890573 (= lt!402345 (lemmaSeekEntryGivesInRangeIndex!13 (_keys!9925 thiss!1181) (_values!5227 thiss!1181) (mask!25719 thiss!1181) (extraKeys!4936 thiss!1181) (zeroValue!5040 thiss!1181) (minValue!5040 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52054 (_ BitVec 32)) SeekEntryResult!8803)

(assert (=> b!890573 (= lt!402344 (seekEntry!0 key!785 (_keys!9925 thiss!1181) (mask!25719 thiss!1181)))))

(declare-fun b!890574 () Bool)

(assert (=> b!890574 (= e!496733 (and e!496731 mapRes!28610))))

(declare-fun condMapEmpty!28610 () Bool)

(declare-fun mapDefault!28610 () ValueCell!8537)

