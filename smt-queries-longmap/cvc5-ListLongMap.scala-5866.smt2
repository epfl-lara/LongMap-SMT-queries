; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75726 () Bool)

(assert start!75726)

(declare-fun b!890375 () Bool)

(declare-fun b_free!15697 () Bool)

(declare-fun b_next!15697 () Bool)

(assert (=> b!890375 (= b_free!15697 (not b_next!15697))))

(declare-fun tp!55059 () Bool)

(declare-fun b_and!25937 () Bool)

(assert (=> b!890375 (= tp!55059 b_and!25937)))

(declare-fun b!890366 () Bool)

(declare-fun e!496568 () Bool)

(declare-fun tp_is_empty!18025 () Bool)

(assert (=> b!890366 (= e!496568 tp_is_empty!18025)))

(declare-fun b!890367 () Bool)

(declare-fun res!603278 () Bool)

(declare-fun e!496571 () Bool)

(assert (=> b!890367 (=> res!603278 e!496571)))

(declare-datatypes ((array!52030 0))(
  ( (array!52031 (arr!25021 (Array (_ BitVec 32) (_ BitVec 64))) (size!25465 (_ BitVec 32))) )
))
(declare-datatypes ((V!28999 0))(
  ( (V!29000 (val!9063 Int)) )
))
(declare-datatypes ((ValueCell!8531 0))(
  ( (ValueCellFull!8531 (v!11541 V!28999)) (EmptyCell!8531) )
))
(declare-datatypes ((array!52032 0))(
  ( (array!52033 (arr!25022 (Array (_ BitVec 32) ValueCell!8531)) (size!25466 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4078 0))(
  ( (LongMapFixedSize!4079 (defaultEntry!5236 Int) (mask!25709 (_ BitVec 32)) (extraKeys!4930 (_ BitVec 32)) (zeroValue!5034 V!28999) (minValue!5034 V!28999) (_size!2094 (_ BitVec 32)) (_keys!9919 array!52030) (_values!5221 array!52032) (_vacant!2094 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4078)

(assert (=> b!890367 (= res!603278 (or (not (= (size!25466 (_values!5221 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25709 thiss!1181)))) (not (= (size!25465 (_keys!9919 thiss!1181)) (size!25466 (_values!5221 thiss!1181)))) (bvslt (mask!25709 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4930 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4930 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!890368 () Bool)

(declare-fun res!603277 () Bool)

(assert (=> b!890368 (=> res!603277 e!496571)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52030 (_ BitVec 32)) Bool)

(assert (=> b!890368 (= res!603277 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9919 thiss!1181) (mask!25709 thiss!1181))))))

(declare-fun b!890369 () Bool)

(declare-fun res!603281 () Bool)

(declare-fun e!496572 () Bool)

(assert (=> b!890369 (=> (not res!603281) (not e!496572))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890369 (= res!603281 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890370 () Bool)

(assert (=> b!890370 (= e!496571 true)))

(declare-fun lt!402271 () Bool)

(declare-datatypes ((List!17717 0))(
  ( (Nil!17714) (Cons!17713 (h!18844 (_ BitVec 64)) (t!25016 List!17717)) )
))
(declare-fun arrayNoDuplicates!0 (array!52030 (_ BitVec 32) List!17717) Bool)

(assert (=> b!890370 (= lt!402271 (arrayNoDuplicates!0 (_keys!9919 thiss!1181) #b00000000000000000000000000000000 Nil!17714))))

(declare-fun res!603279 () Bool)

(assert (=> start!75726 (=> (not res!603279) (not e!496572))))

(declare-fun valid!1582 (LongMapFixedSize!4078) Bool)

(assert (=> start!75726 (= res!603279 (valid!1582 thiss!1181))))

(assert (=> start!75726 e!496572))

(declare-fun e!496569 () Bool)

(assert (=> start!75726 e!496569))

(assert (=> start!75726 true))

(declare-fun b!890371 () Bool)

(declare-fun e!496567 () Bool)

(assert (=> b!890371 (= e!496567 e!496571)))

(declare-fun res!603280 () Bool)

(assert (=> b!890371 (=> res!603280 e!496571)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890371 (= res!603280 (not (validMask!0 (mask!25709 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52030 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890371 (arrayContainsKey!0 (_keys!9919 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30296 0))(
  ( (Unit!30297) )
))
(declare-fun lt!402272 () Unit!30296)

(declare-datatypes ((SeekEntryResult!8798 0))(
  ( (MissingZero!8798 (index!37563 (_ BitVec 32))) (Found!8798 (index!37564 (_ BitVec 32))) (Intermediate!8798 (undefined!9610 Bool) (index!37565 (_ BitVec 32)) (x!75638 (_ BitVec 32))) (Undefined!8798) (MissingVacant!8798 (index!37566 (_ BitVec 32))) )
))
(declare-fun lt!402274 () SeekEntryResult!8798)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52030 (_ BitVec 64) (_ BitVec 32)) Unit!30296)

(assert (=> b!890371 (= lt!402272 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9919 thiss!1181) key!785 (index!37564 lt!402274)))))

(declare-fun mapNonEmpty!28592 () Bool)

(declare-fun mapRes!28592 () Bool)

(declare-fun tp!55060 () Bool)

(assert (=> mapNonEmpty!28592 (= mapRes!28592 (and tp!55060 e!496568))))

(declare-fun mapValue!28592 () ValueCell!8531)

(declare-fun mapRest!28592 () (Array (_ BitVec 32) ValueCell!8531))

(declare-fun mapKey!28592 () (_ BitVec 32))

(assert (=> mapNonEmpty!28592 (= (arr!25022 (_values!5221 thiss!1181)) (store mapRest!28592 mapKey!28592 mapValue!28592))))

(declare-fun b!890372 () Bool)

(declare-fun e!496575 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890372 (= e!496575 (inRange!0 (index!37564 lt!402274) (mask!25709 thiss!1181)))))

(declare-fun b!890373 () Bool)

(declare-fun e!496570 () Bool)

(declare-fun e!496574 () Bool)

(assert (=> b!890373 (= e!496570 (and e!496574 mapRes!28592))))

(declare-fun condMapEmpty!28592 () Bool)

(declare-fun mapDefault!28592 () ValueCell!8531)

