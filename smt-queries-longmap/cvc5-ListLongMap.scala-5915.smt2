; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76688 () Bool)

(assert start!76688)

(declare-fun b!897712 () Bool)

(declare-fun b_free!15991 () Bool)

(declare-fun b_next!15991 () Bool)

(assert (=> b!897712 (= b_free!15991 (not b_next!15991))))

(declare-fun tp!56030 () Bool)

(declare-fun b_and!26283 () Bool)

(assert (=> b!897712 (= tp!56030 b_and!26283)))

(declare-fun b!897706 () Bool)

(declare-fun e!502040 () Bool)

(declare-fun tp_is_empty!18319 () Bool)

(assert (=> b!897706 (= e!502040 tp_is_empty!18319)))

(declare-fun b!897707 () Bool)

(declare-fun res!606752 () Bool)

(declare-fun e!502034 () Bool)

(assert (=> b!897707 (=> (not res!606752) (not e!502034))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!897707 (= res!606752 (not (= key!785 (bvneg key!785))))))

(declare-fun b!897708 () Bool)

(declare-fun res!606751 () Bool)

(declare-fun e!502032 () Bool)

(assert (=> b!897708 (=> res!606751 e!502032)))

(declare-datatypes ((array!52668 0))(
  ( (array!52669 (arr!25315 (Array (_ BitVec 32) (_ BitVec 64))) (size!25770 (_ BitVec 32))) )
))
(declare-datatypes ((V!29391 0))(
  ( (V!29392 (val!9210 Int)) )
))
(declare-datatypes ((ValueCell!8678 0))(
  ( (ValueCellFull!8678 (v!11700 V!29391)) (EmptyCell!8678) )
))
(declare-datatypes ((array!52670 0))(
  ( (array!52671 (arr!25316 (Array (_ BitVec 32) ValueCell!8678)) (size!25771 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4372 0))(
  ( (LongMapFixedSize!4373 (defaultEntry!5398 Int) (mask!26101 (_ BitVec 32)) (extraKeys!5110 (_ BitVec 32)) (zeroValue!5214 V!29391) (minValue!5214 V!29391) (_size!2241 (_ BitVec 32)) (_keys!10162 array!52668) (_values!5401 array!52670) (_vacant!2241 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4372)

(assert (=> b!897708 (= res!606751 (or (not (= (size!25771 (_values!5401 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26101 thiss!1181)))) (not (= (size!25770 (_keys!10162 thiss!1181)) (size!25771 (_values!5401 thiss!1181)))) (bvslt (mask!26101 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5110 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5110 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun res!606753 () Bool)

(assert (=> start!76688 (=> (not res!606753) (not e!502034))))

(declare-fun valid!1683 (LongMapFixedSize!4372) Bool)

(assert (=> start!76688 (= res!606753 (valid!1683 thiss!1181))))

(assert (=> start!76688 e!502034))

(declare-fun e!502038 () Bool)

(assert (=> start!76688 e!502038))

(assert (=> start!76688 true))

(declare-fun mapIsEmpty!29121 () Bool)

(declare-fun mapRes!29121 () Bool)

(assert (=> mapIsEmpty!29121 mapRes!29121))

(declare-fun b!897709 () Bool)

(declare-fun e!502039 () Bool)

(assert (=> b!897709 (= e!502039 tp_is_empty!18319)))

(declare-fun b!897710 () Bool)

(declare-fun e!502033 () Bool)

(assert (=> b!897710 (= e!502034 (not e!502033))))

(declare-fun res!606755 () Bool)

(assert (=> b!897710 (=> res!606755 e!502033)))

(declare-datatypes ((SeekEntryResult!8913 0))(
  ( (MissingZero!8913 (index!38023 (_ BitVec 32))) (Found!8913 (index!38024 (_ BitVec 32))) (Intermediate!8913 (undefined!9725 Bool) (index!38025 (_ BitVec 32)) (x!76494 (_ BitVec 32))) (Undefined!8913) (MissingVacant!8913 (index!38026 (_ BitVec 32))) )
))
(declare-fun lt!405283 () SeekEntryResult!8913)

(assert (=> b!897710 (= res!606755 (not (is-Found!8913 lt!405283)))))

(declare-fun e!502036 () Bool)

(assert (=> b!897710 e!502036))

(declare-fun res!606754 () Bool)

(assert (=> b!897710 (=> res!606754 e!502036)))

(assert (=> b!897710 (= res!606754 (not (is-Found!8913 lt!405283)))))

(declare-datatypes ((Unit!30516 0))(
  ( (Unit!30517) )
))
(declare-fun lt!405281 () Unit!30516)

(declare-fun lemmaSeekEntryGivesInRangeIndex!83 (array!52668 array!52670 (_ BitVec 32) (_ BitVec 32) V!29391 V!29391 (_ BitVec 64)) Unit!30516)

(assert (=> b!897710 (= lt!405281 (lemmaSeekEntryGivesInRangeIndex!83 (_keys!10162 thiss!1181) (_values!5401 thiss!1181) (mask!26101 thiss!1181) (extraKeys!5110 thiss!1181) (zeroValue!5214 thiss!1181) (minValue!5214 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52668 (_ BitVec 32)) SeekEntryResult!8913)

(assert (=> b!897710 (= lt!405283 (seekEntry!0 key!785 (_keys!10162 thiss!1181) (mask!26101 thiss!1181)))))

(declare-fun mapNonEmpty!29121 () Bool)

(declare-fun tp!56029 () Bool)

(assert (=> mapNonEmpty!29121 (= mapRes!29121 (and tp!56029 e!502039))))

(declare-fun mapKey!29121 () (_ BitVec 32))

(declare-fun mapRest!29121 () (Array (_ BitVec 32) ValueCell!8678))

(declare-fun mapValue!29121 () ValueCell!8678)

(assert (=> mapNonEmpty!29121 (= (arr!25316 (_values!5401 thiss!1181)) (store mapRest!29121 mapKey!29121 mapValue!29121))))

(declare-fun b!897711 () Bool)

(declare-fun res!606750 () Bool)

(assert (=> b!897711 (=> res!606750 e!502032)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52668 (_ BitVec 32)) Bool)

(assert (=> b!897711 (= res!606750 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10162 thiss!1181) (mask!26101 thiss!1181))))))

(declare-fun e!502037 () Bool)

(declare-fun array_inv!19870 (array!52668) Bool)

(declare-fun array_inv!19871 (array!52670) Bool)

(assert (=> b!897712 (= e!502038 (and tp!56030 tp_is_empty!18319 (array_inv!19870 (_keys!10162 thiss!1181)) (array_inv!19871 (_values!5401 thiss!1181)) e!502037))))

(declare-fun b!897713 () Bool)

(assert (=> b!897713 (= e!502037 (and e!502040 mapRes!29121))))

(declare-fun condMapEmpty!29121 () Bool)

(declare-fun mapDefault!29121 () ValueCell!8678)

