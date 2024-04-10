; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91144 () Bool)

(assert start!91144)

(declare-fun b!1040362 () Bool)

(declare-fun b_free!21011 () Bool)

(declare-fun b_next!21011 () Bool)

(assert (=> b!1040362 (= b_free!21011 (not b_next!21011))))

(declare-fun tp!74227 () Bool)

(declare-fun b_and!33543 () Bool)

(assert (=> b!1040362 (= tp!74227 b_and!33543)))

(declare-fun b!1040357 () Bool)

(declare-fun res!693622 () Bool)

(declare-fun e!589001 () Bool)

(assert (=> b!1040357 (=> res!693622 e!589001)))

(declare-datatypes ((V!37847 0))(
  ( (V!37848 (val!12416 Int)) )
))
(declare-datatypes ((ValueCell!11662 0))(
  ( (ValueCellFull!11662 (v!15003 V!37847)) (EmptyCell!11662) )
))
(declare-datatypes ((array!65598 0))(
  ( (array!65599 (arr!31565 (Array (_ BitVec 32) (_ BitVec 64))) (size!32096 (_ BitVec 32))) )
))
(declare-datatypes ((array!65600 0))(
  ( (array!65601 (arr!31566 (Array (_ BitVec 32) ValueCell!11662)) (size!32097 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5918 0))(
  ( (LongMapFixedSize!5919 (defaultEntry!6341 Int) (mask!30332 (_ BitVec 32)) (extraKeys!6069 (_ BitVec 32)) (zeroValue!6175 V!37847) (minValue!6175 V!37847) (_size!3014 (_ BitVec 32)) (_keys!11561 array!65598) (_values!6364 array!65600) (_vacant!3014 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5918)

(declare-datatypes ((List!21958 0))(
  ( (Nil!21955) (Cons!21954 (h!23158 (_ BitVec 64)) (t!31172 List!21958)) )
))
(declare-fun arrayNoDuplicates!0 (array!65598 (_ BitVec 32) List!21958) Bool)

(assert (=> b!1040357 (= res!693622 (not (arrayNoDuplicates!0 (_keys!11561 thiss!1427) #b00000000000000000000000000000000 Nil!21955)))))

(declare-fun b!1040358 () Bool)

(declare-fun res!693624 () Bool)

(declare-fun e!589000 () Bool)

(assert (=> b!1040358 (=> (not res!693624) (not e!589000))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1040358 (= res!693624 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!38674 () Bool)

(declare-fun mapRes!38674 () Bool)

(declare-fun tp!74228 () Bool)

(declare-fun e!588999 () Bool)

(assert (=> mapNonEmpty!38674 (= mapRes!38674 (and tp!74228 e!588999))))

(declare-fun mapValue!38674 () ValueCell!11662)

(declare-fun mapRest!38674 () (Array (_ BitVec 32) ValueCell!11662))

(declare-fun mapKey!38674 () (_ BitVec 32))

(assert (=> mapNonEmpty!38674 (= (arr!31566 (_values!6364 thiss!1427)) (store mapRest!38674 mapKey!38674 mapValue!38674))))

(declare-fun b!1040359 () Bool)

(declare-fun tp_is_empty!24731 () Bool)

(assert (=> b!1040359 (= e!588999 tp_is_empty!24731)))

(declare-fun mapIsEmpty!38674 () Bool)

(assert (=> mapIsEmpty!38674 mapRes!38674))

(declare-fun res!693625 () Bool)

(assert (=> start!91144 (=> (not res!693625) (not e!589000))))

(declare-fun valid!2222 (LongMapFixedSize!5918) Bool)

(assert (=> start!91144 (= res!693625 (valid!2222 thiss!1427))))

(assert (=> start!91144 e!589000))

(declare-fun e!588995 () Bool)

(assert (=> start!91144 e!588995))

(assert (=> start!91144 true))

(declare-fun b!1040360 () Bool)

(declare-fun e!588994 () Bool)

(declare-fun e!588996 () Bool)

(assert (=> b!1040360 (= e!588994 (and e!588996 mapRes!38674))))

(declare-fun condMapEmpty!38674 () Bool)

(declare-fun mapDefault!38674 () ValueCell!11662)

