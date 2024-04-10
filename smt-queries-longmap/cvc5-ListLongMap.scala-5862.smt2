; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75702 () Bool)

(assert start!75702)

(declare-fun b!890076 () Bool)

(declare-fun b_free!15673 () Bool)

(declare-fun b_next!15673 () Bool)

(assert (=> b!890076 (= b_free!15673 (not b_next!15673))))

(declare-fun tp!54987 () Bool)

(declare-fun b_and!25913 () Bool)

(assert (=> b!890076 (= tp!54987 b_and!25913)))

(declare-fun mapNonEmpty!28556 () Bool)

(declare-fun mapRes!28556 () Bool)

(declare-fun tp!54988 () Bool)

(declare-fun e!496296 () Bool)

(assert (=> mapNonEmpty!28556 (= mapRes!28556 (and tp!54988 e!496296))))

(declare-datatypes ((V!28967 0))(
  ( (V!28968 (val!9051 Int)) )
))
(declare-datatypes ((ValueCell!8519 0))(
  ( (ValueCellFull!8519 (v!11529 V!28967)) (EmptyCell!8519) )
))
(declare-fun mapValue!28556 () ValueCell!8519)

(declare-datatypes ((array!51982 0))(
  ( (array!51983 (arr!24997 (Array (_ BitVec 32) (_ BitVec 64))) (size!25441 (_ BitVec 32))) )
))
(declare-datatypes ((array!51984 0))(
  ( (array!51985 (arr!24998 (Array (_ BitVec 32) ValueCell!8519)) (size!25442 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4054 0))(
  ( (LongMapFixedSize!4055 (defaultEntry!5224 Int) (mask!25689 (_ BitVec 32)) (extraKeys!4918 (_ BitVec 32)) (zeroValue!5022 V!28967) (minValue!5022 V!28967) (_size!2082 (_ BitVec 32)) (_keys!9907 array!51982) (_values!5209 array!51984) (_vacant!2082 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4054)

(declare-fun mapRest!28556 () (Array (_ BitVec 32) ValueCell!8519))

(declare-fun mapKey!28556 () (_ BitVec 32))

(assert (=> mapNonEmpty!28556 (= (arr!24998 (_values!5209 thiss!1181)) (store mapRest!28556 mapKey!28556 mapValue!28556))))

(declare-fun b!890070 () Bool)

(declare-fun e!496295 () Bool)

(assert (=> b!890070 (= e!496295 (not true))))

(declare-fun e!496298 () Bool)

(assert (=> b!890070 e!496298))

(declare-fun res!603124 () Bool)

(assert (=> b!890070 (=> res!603124 e!496298)))

(declare-datatypes ((SeekEntryResult!8790 0))(
  ( (MissingZero!8790 (index!37531 (_ BitVec 32))) (Found!8790 (index!37532 (_ BitVec 32))) (Intermediate!8790 (undefined!9602 Bool) (index!37533 (_ BitVec 32)) (x!75598 (_ BitVec 32))) (Undefined!8790) (MissingVacant!8790 (index!37534 (_ BitVec 32))) )
))
(declare-fun lt!402177 () SeekEntryResult!8790)

(assert (=> b!890070 (= res!603124 (not (is-Found!8790 lt!402177)))))

(declare-datatypes ((Unit!30284 0))(
  ( (Unit!30285) )
))
(declare-fun lt!402178 () Unit!30284)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!4 (array!51982 array!51984 (_ BitVec 32) (_ BitVec 32) V!28967 V!28967 (_ BitVec 64)) Unit!30284)

(assert (=> b!890070 (= lt!402178 (lemmaSeekEntryGivesInRangeIndex!4 (_keys!9907 thiss!1181) (_values!5209 thiss!1181) (mask!25689 thiss!1181) (extraKeys!4918 thiss!1181) (zeroValue!5022 thiss!1181) (minValue!5022 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51982 (_ BitVec 32)) SeekEntryResult!8790)

(assert (=> b!890070 (= lt!402177 (seekEntry!0 key!785 (_keys!9907 thiss!1181) (mask!25689 thiss!1181)))))

(declare-fun b!890071 () Bool)

(declare-fun tp_is_empty!18001 () Bool)

(assert (=> b!890071 (= e!496296 tp_is_empty!18001)))

(declare-fun res!603125 () Bool)

(assert (=> start!75702 (=> (not res!603125) (not e!496295))))

(declare-fun valid!1574 (LongMapFixedSize!4054) Bool)

(assert (=> start!75702 (= res!603125 (valid!1574 thiss!1181))))

(assert (=> start!75702 e!496295))

(declare-fun e!496297 () Bool)

(assert (=> start!75702 e!496297))

(assert (=> start!75702 true))

(declare-fun b!890072 () Bool)

(declare-fun e!496293 () Bool)

(assert (=> b!890072 (= e!496293 tp_is_empty!18001)))

(declare-fun b!890073 () Bool)

(declare-fun res!603123 () Bool)

(assert (=> b!890073 (=> (not res!603123) (not e!496295))))

(assert (=> b!890073 (= res!603123 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890074 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890074 (= e!496298 (inRange!0 (index!37532 lt!402177) (mask!25689 thiss!1181)))))

(declare-fun mapIsEmpty!28556 () Bool)

(assert (=> mapIsEmpty!28556 mapRes!28556))

(declare-fun b!890075 () Bool)

(declare-fun e!496299 () Bool)

(assert (=> b!890075 (= e!496299 (and e!496293 mapRes!28556))))

(declare-fun condMapEmpty!28556 () Bool)

(declare-fun mapDefault!28556 () ValueCell!8519)

