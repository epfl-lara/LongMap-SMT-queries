; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89234 () Bool)

(assert start!89234)

(declare-fun b!1023169 () Bool)

(declare-fun b_free!20275 () Bool)

(declare-fun b_next!20275 () Bool)

(assert (=> b!1023169 (= b_free!20275 (not b_next!20275))))

(declare-fun tp!71859 () Bool)

(declare-fun b_and!32497 () Bool)

(assert (=> b!1023169 (= tp!71859 b_and!32497)))

(declare-fun res!685281 () Bool)

(declare-fun e!576512 () Bool)

(assert (=> start!89234 (=> (not res!685281) (not e!576512))))

(declare-datatypes ((V!36867 0))(
  ( (V!36868 (val!12048 Int)) )
))
(declare-datatypes ((ValueCell!11294 0))(
  ( (ValueCellFull!11294 (v!14617 V!36867)) (EmptyCell!11294) )
))
(declare-datatypes ((array!64034 0))(
  ( (array!64035 (arr!30829 (Array (_ BitVec 32) (_ BitVec 64))) (size!31340 (_ BitVec 32))) )
))
(declare-datatypes ((array!64036 0))(
  ( (array!64037 (arr!30830 (Array (_ BitVec 32) ValueCell!11294)) (size!31341 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5182 0))(
  ( (LongMapFixedSize!5183 (defaultEntry!5943 Int) (mask!29558 (_ BitVec 32)) (extraKeys!5675 (_ BitVec 32)) (zeroValue!5779 V!36867) (minValue!5779 V!36867) (_size!2646 (_ BitVec 32)) (_keys!11088 array!64034) (_values!5966 array!64036) (_vacant!2646 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5182)

(declare-fun valid!1974 (LongMapFixedSize!5182) Bool)

(assert (=> start!89234 (= res!685281 (valid!1974 thiss!1427))))

(assert (=> start!89234 e!576512))

(declare-fun e!576511 () Bool)

(assert (=> start!89234 e!576511))

(assert (=> start!89234 true))

(declare-fun b!1023167 () Bool)

(declare-fun res!685282 () Bool)

(assert (=> b!1023167 (=> (not res!685282) (not e!576512))))

(assert (=> b!1023167 (= res!685282 (and (= (size!31341 (_values!5966 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29558 thiss!1427))) (= (size!31340 (_keys!11088 thiss!1427)) (size!31341 (_values!5966 thiss!1427))) (bvsge (mask!29558 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5675 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5675 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5675 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5675 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5675 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5675 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5675 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1023168 () Bool)

(declare-fun res!685279 () Bool)

(assert (=> b!1023168 (=> (not res!685279) (not e!576512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64034 (_ BitVec 32)) Bool)

(assert (=> b!1023168 (= res!685279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11088 thiss!1427) (mask!29558 thiss!1427)))))

(declare-fun e!576509 () Bool)

(declare-fun tp_is_empty!23995 () Bool)

(declare-fun array_inv!23887 (array!64034) Bool)

(declare-fun array_inv!23888 (array!64036) Bool)

(assert (=> b!1023169 (= e!576511 (and tp!71859 tp_is_empty!23995 (array_inv!23887 (_keys!11088 thiss!1427)) (array_inv!23888 (_values!5966 thiss!1427)) e!576509))))

(declare-fun mapIsEmpty!37410 () Bool)

(declare-fun mapRes!37410 () Bool)

(assert (=> mapIsEmpty!37410 mapRes!37410))

(declare-fun b!1023170 () Bool)

(declare-fun res!685283 () Bool)

(assert (=> b!1023170 (=> (not res!685283) (not e!576512))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023170 (= res!685283 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1023171 () Bool)

(declare-fun res!685280 () Bool)

(assert (=> b!1023171 (=> (not res!685280) (not e!576512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023171 (= res!685280 (validMask!0 (mask!29558 thiss!1427)))))

(declare-fun mapNonEmpty!37410 () Bool)

(declare-fun tp!71860 () Bool)

(declare-fun e!576508 () Bool)

(assert (=> mapNonEmpty!37410 (= mapRes!37410 (and tp!71860 e!576508))))

(declare-fun mapKey!37410 () (_ BitVec 32))

(declare-fun mapValue!37410 () ValueCell!11294)

(declare-fun mapRest!37410 () (Array (_ BitVec 32) ValueCell!11294))

(assert (=> mapNonEmpty!37410 (= (arr!30830 (_values!5966 thiss!1427)) (store mapRest!37410 mapKey!37410 mapValue!37410))))

(declare-fun b!1023172 () Bool)

(declare-fun e!576510 () Bool)

(assert (=> b!1023172 (= e!576509 (and e!576510 mapRes!37410))))

(declare-fun condMapEmpty!37410 () Bool)

(declare-fun mapDefault!37410 () ValueCell!11294)

