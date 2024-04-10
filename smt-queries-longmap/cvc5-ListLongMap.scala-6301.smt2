; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80604 () Bool)

(assert start!80604)

(declare-fun b!946049 () Bool)

(declare-fun b_free!18127 () Bool)

(declare-fun b_next!18127 () Bool)

(assert (=> b!946049 (= b_free!18127 (not b_next!18127))))

(declare-fun tp!62915 () Bool)

(declare-fun b_and!29549 () Bool)

(assert (=> b!946049 (= tp!62915 b_and!29549)))

(declare-fun b!946043 () Bool)

(declare-fun e!532227 () Bool)

(declare-fun e!532231 () Bool)

(assert (=> b!946043 (= e!532227 (not e!532231))))

(declare-fun res!635206 () Bool)

(assert (=> b!946043 (=> res!635206 e!532231)))

(declare-datatypes ((V!32479 0))(
  ( (V!32480 (val!10368 Int)) )
))
(declare-datatypes ((ValueCell!9836 0))(
  ( (ValueCellFull!9836 (v!12902 V!32479)) (EmptyCell!9836) )
))
(declare-datatypes ((array!57252 0))(
  ( (array!57253 (arr!27544 (Array (_ BitVec 32) ValueCell!9836)) (size!28013 (_ BitVec 32))) )
))
(declare-datatypes ((array!57254 0))(
  ( (array!57255 (arr!27545 (Array (_ BitVec 32) (_ BitVec 64))) (size!28014 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4822 0))(
  ( (LongMapFixedSize!4823 (defaultEntry!5708 Int) (mask!27397 (_ BitVec 32)) (extraKeys!5440 (_ BitVec 32)) (zeroValue!5544 V!32479) (minValue!5544 V!32479) (_size!2466 (_ BitVec 32)) (_keys!10596 array!57254) (_values!5731 array!57252) (_vacant!2466 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4822)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!946043 (= res!635206 (not (validMask!0 (mask!27397 thiss!1141))))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!57254 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!946043 (arrayContainsKey!0 (_keys!10596 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31896 0))(
  ( (Unit!31897) )
))
(declare-fun lt!426177 () Unit!31896)

(declare-datatypes ((SeekEntryResult!9097 0))(
  ( (MissingZero!9097 (index!38759 (_ BitVec 32))) (Found!9097 (index!38760 (_ BitVec 32))) (Intermediate!9097 (undefined!9909 Bool) (index!38761 (_ BitVec 32)) (x!81333 (_ BitVec 32))) (Undefined!9097) (MissingVacant!9097 (index!38762 (_ BitVec 32))) )
))
(declare-fun lt!426176 () SeekEntryResult!9097)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57254 (_ BitVec 64) (_ BitVec 32)) Unit!31896)

(assert (=> b!946043 (= lt!426177 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10596 thiss!1141) key!756 (index!38760 lt!426176)))))

(declare-fun res!635205 () Bool)

(declare-fun e!532230 () Bool)

(assert (=> start!80604 (=> (not res!635205) (not e!532230))))

(declare-fun valid!1841 (LongMapFixedSize!4822) Bool)

(assert (=> start!80604 (= res!635205 (valid!1841 thiss!1141))))

(assert (=> start!80604 e!532230))

(declare-fun e!532229 () Bool)

(assert (=> start!80604 e!532229))

(assert (=> start!80604 true))

(declare-fun b!946044 () Bool)

(declare-fun e!532232 () Bool)

(declare-fun tp_is_empty!20635 () Bool)

(assert (=> b!946044 (= e!532232 tp_is_empty!20635)))

(declare-fun b!946045 () Bool)

(declare-fun e!532234 () Bool)

(declare-fun e!532233 () Bool)

(declare-fun mapRes!32802 () Bool)

(assert (=> b!946045 (= e!532234 (and e!532233 mapRes!32802))))

(declare-fun condMapEmpty!32802 () Bool)

(declare-fun mapDefault!32802 () ValueCell!9836)

