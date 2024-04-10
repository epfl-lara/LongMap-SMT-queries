; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75712 () Bool)

(assert start!75712)

(declare-fun b!890175 () Bool)

(declare-fun b_free!15683 () Bool)

(declare-fun b_next!15683 () Bool)

(assert (=> b!890175 (= b_free!15683 (not b_next!15683))))

(declare-fun tp!55018 () Bool)

(declare-fun b_and!25923 () Bool)

(assert (=> b!890175 (= tp!55018 b_and!25923)))

(declare-fun mapIsEmpty!28571 () Bool)

(declare-fun mapRes!28571 () Bool)

(assert (=> mapIsEmpty!28571 mapRes!28571))

(declare-fun mapNonEmpty!28571 () Bool)

(declare-fun tp!55017 () Bool)

(declare-fun e!496402 () Bool)

(assert (=> mapNonEmpty!28571 (= mapRes!28571 (and tp!55017 e!496402))))

(declare-fun mapKey!28571 () (_ BitVec 32))

(declare-datatypes ((V!28979 0))(
  ( (V!28980 (val!9056 Int)) )
))
(declare-datatypes ((ValueCell!8524 0))(
  ( (ValueCellFull!8524 (v!11534 V!28979)) (EmptyCell!8524) )
))
(declare-fun mapValue!28571 () ValueCell!8524)

(declare-fun mapRest!28571 () (Array (_ BitVec 32) ValueCell!8524))

(declare-datatypes ((array!52002 0))(
  ( (array!52003 (arr!25007 (Array (_ BitVec 32) (_ BitVec 64))) (size!25451 (_ BitVec 32))) )
))
(declare-datatypes ((array!52004 0))(
  ( (array!52005 (arr!25008 (Array (_ BitVec 32) ValueCell!8524)) (size!25452 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4064 0))(
  ( (LongMapFixedSize!4065 (defaultEntry!5229 Int) (mask!25696 (_ BitVec 32)) (extraKeys!4923 (_ BitVec 32)) (zeroValue!5027 V!28979) (minValue!5027 V!28979) (_size!2087 (_ BitVec 32)) (_keys!9912 array!52002) (_values!5214 array!52004) (_vacant!2087 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4064)

(assert (=> mapNonEmpty!28571 (= (arr!25008 (_values!5214 thiss!1181)) (store mapRest!28571 mapKey!28571 mapValue!28571))))

(declare-fun e!496401 () Bool)

(declare-fun tp_is_empty!18011 () Bool)

(declare-fun e!496403 () Bool)

(declare-fun array_inv!19664 (array!52002) Bool)

(declare-fun array_inv!19665 (array!52004) Bool)

(assert (=> b!890175 (= e!496403 (and tp!55018 tp_is_empty!18011 (array_inv!19664 (_keys!9912 thiss!1181)) (array_inv!19665 (_values!5214 thiss!1181)) e!496401))))

(declare-fun res!603168 () Bool)

(declare-fun e!496400 () Bool)

(assert (=> start!75712 (=> (not res!603168) (not e!496400))))

(declare-fun valid!1577 (LongMapFixedSize!4064) Bool)

(assert (=> start!75712 (= res!603168 (valid!1577 thiss!1181))))

(assert (=> start!75712 e!496400))

(assert (=> start!75712 e!496403))

(assert (=> start!75712 true))

(declare-fun b!890176 () Bool)

(declare-fun res!603170 () Bool)

(assert (=> b!890176 (=> (not res!603170) (not e!496400))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890176 (= res!603170 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890177 () Bool)

(assert (=> b!890177 (= e!496402 tp_is_empty!18011)))

(declare-fun b!890178 () Bool)

(assert (=> b!890178 (= e!496400 (not true))))

(declare-fun e!496404 () Bool)

(assert (=> b!890178 e!496404))

(declare-fun res!603169 () Bool)

(assert (=> b!890178 (=> res!603169 e!496404)))

(declare-datatypes ((SeekEntryResult!8793 0))(
  ( (MissingZero!8793 (index!37543 (_ BitVec 32))) (Found!8793 (index!37544 (_ BitVec 32))) (Intermediate!8793 (undefined!9605 Bool) (index!37545 (_ BitVec 32)) (x!75609 (_ BitVec 32))) (Undefined!8793) (MissingVacant!8793 (index!37546 (_ BitVec 32))) )
))
(declare-fun lt!402208 () SeekEntryResult!8793)

(assert (=> b!890178 (= res!603169 (not (is-Found!8793 lt!402208)))))

(declare-datatypes ((Unit!30290 0))(
  ( (Unit!30291) )
))
(declare-fun lt!402207 () Unit!30290)

(declare-fun lemmaSeekEntryGivesInRangeIndex!7 (array!52002 array!52004 (_ BitVec 32) (_ BitVec 32) V!28979 V!28979 (_ BitVec 64)) Unit!30290)

(assert (=> b!890178 (= lt!402207 (lemmaSeekEntryGivesInRangeIndex!7 (_keys!9912 thiss!1181) (_values!5214 thiss!1181) (mask!25696 thiss!1181) (extraKeys!4923 thiss!1181) (zeroValue!5027 thiss!1181) (minValue!5027 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52002 (_ BitVec 32)) SeekEntryResult!8793)

(assert (=> b!890178 (= lt!402208 (seekEntry!0 key!785 (_keys!9912 thiss!1181) (mask!25696 thiss!1181)))))

(declare-fun b!890179 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890179 (= e!496404 (inRange!0 (index!37544 lt!402208) (mask!25696 thiss!1181)))))

(declare-fun b!890180 () Bool)

(declare-fun e!496399 () Bool)

(assert (=> b!890180 (= e!496399 tp_is_empty!18011)))

(declare-fun b!890181 () Bool)

(assert (=> b!890181 (= e!496401 (and e!496399 mapRes!28571))))

(declare-fun condMapEmpty!28571 () Bool)

(declare-fun mapDefault!28571 () ValueCell!8524)

