; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89338 () Bool)

(assert start!89338)

(declare-fun b!1024148 () Bool)

(declare-fun b_free!20347 () Bool)

(declare-fun b_next!20347 () Bool)

(assert (=> b!1024148 (= b_free!20347 (not b_next!20347))))

(declare-fun tp!72083 () Bool)

(declare-fun b_and!32593 () Bool)

(assert (=> b!1024148 (= tp!72083 b_and!32593)))

(declare-fun mapNonEmpty!37526 () Bool)

(declare-fun mapRes!37526 () Bool)

(declare-fun tp!72084 () Bool)

(declare-fun e!577243 () Bool)

(assert (=> mapNonEmpty!37526 (= mapRes!37526 (and tp!72084 e!577243))))

(declare-datatypes ((V!36963 0))(
  ( (V!36964 (val!12084 Int)) )
))
(declare-datatypes ((ValueCell!11330 0))(
  ( (ValueCellFull!11330 (v!14653 V!36963)) (EmptyCell!11330) )
))
(declare-fun mapValue!37526 () ValueCell!11330)

(declare-fun mapRest!37526 () (Array (_ BitVec 32) ValueCell!11330))

(declare-datatypes ((array!64182 0))(
  ( (array!64183 (arr!30901 (Array (_ BitVec 32) (_ BitVec 64))) (size!31414 (_ BitVec 32))) )
))
(declare-datatypes ((array!64184 0))(
  ( (array!64185 (arr!30902 (Array (_ BitVec 32) ValueCell!11330)) (size!31415 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5254 0))(
  ( (LongMapFixedSize!5255 (defaultEntry!5979 Int) (mask!29622 (_ BitVec 32)) (extraKeys!5711 (_ BitVec 32)) (zeroValue!5815 V!36963) (minValue!5815 V!36963) (_size!2682 (_ BitVec 32)) (_keys!11126 array!64182) (_values!6002 array!64184) (_vacant!2682 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5254)

(declare-fun mapKey!37526 () (_ BitVec 32))

(assert (=> mapNonEmpty!37526 (= (arr!30902 (_values!6002 thiss!1427)) (store mapRest!37526 mapKey!37526 mapValue!37526))))

(declare-fun e!577242 () Bool)

(declare-fun e!577241 () Bool)

(declare-fun tp_is_empty!24067 () Bool)

(declare-fun array_inv!23939 (array!64182) Bool)

(declare-fun array_inv!23940 (array!64184) Bool)

(assert (=> b!1024148 (= e!577241 (and tp!72083 tp_is_empty!24067 (array_inv!23939 (_keys!11126 thiss!1427)) (array_inv!23940 (_values!6002 thiss!1427)) e!577242))))

(declare-fun b!1024149 () Bool)

(declare-fun res!685736 () Bool)

(declare-fun e!577239 () Bool)

(assert (=> b!1024149 (=> (not res!685736) (not e!577239))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024149 (= res!685736 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1024150 () Bool)

(declare-fun res!685737 () Bool)

(assert (=> b!1024150 (=> (not res!685737) (not e!577239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1024150 (= res!685737 (validMask!0 (mask!29622 thiss!1427)))))

(declare-fun mapIsEmpty!37526 () Bool)

(assert (=> mapIsEmpty!37526 mapRes!37526))

(declare-fun b!1024152 () Bool)

(declare-fun res!685738 () Bool)

(assert (=> b!1024152 (=> (not res!685738) (not e!577239))))

(assert (=> b!1024152 (= res!685738 (= (size!31414 (_keys!11126 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29622 thiss!1427))))))

(declare-fun b!1024153 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1024153 (= e!577239 (not (validKeyInArray!0 key!909)))))

(declare-fun b!1024154 () Bool)

(declare-fun e!577238 () Bool)

(assert (=> b!1024154 (= e!577238 tp_is_empty!24067)))

(declare-fun b!1024155 () Bool)

(assert (=> b!1024155 (= e!577243 tp_is_empty!24067)))

(declare-fun b!1024151 () Bool)

(assert (=> b!1024151 (= e!577242 (and e!577238 mapRes!37526))))

(declare-fun condMapEmpty!37526 () Bool)

(declare-fun mapDefault!37526 () ValueCell!11330)

