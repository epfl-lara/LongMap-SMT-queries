; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89504 () Bool)

(assert start!89504)

(declare-fun b!1026491 () Bool)

(declare-fun b_free!20503 () Bool)

(declare-fun b_next!20503 () Bool)

(assert (=> b!1026491 (= b_free!20503 (not b_next!20503))))

(declare-fun tp!72554 () Bool)

(declare-fun b_and!32749 () Bool)

(assert (=> b!1026491 (= tp!72554 b_and!32749)))

(declare-fun e!579088 () Bool)

(declare-fun e!579093 () Bool)

(declare-fun tp_is_empty!24223 () Bool)

(declare-datatypes ((V!37171 0))(
  ( (V!37172 (val!12162 Int)) )
))
(declare-datatypes ((ValueCell!11408 0))(
  ( (ValueCellFull!11408 (v!14731 V!37171)) (EmptyCell!11408) )
))
(declare-datatypes ((array!64496 0))(
  ( (array!64497 (arr!31057 (Array (_ BitVec 32) (_ BitVec 64))) (size!31570 (_ BitVec 32))) )
))
(declare-datatypes ((array!64498 0))(
  ( (array!64499 (arr!31058 (Array (_ BitVec 32) ValueCell!11408)) (size!31571 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5410 0))(
  ( (LongMapFixedSize!5411 (defaultEntry!6057 Int) (mask!29753 (_ BitVec 32)) (extraKeys!5789 (_ BitVec 32)) (zeroValue!5893 V!37171) (minValue!5893 V!37171) (_size!2760 (_ BitVec 32)) (_keys!11204 array!64496) (_values!6080 array!64498) (_vacant!2760 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5410)

(declare-fun array_inv!24047 (array!64496) Bool)

(declare-fun array_inv!24048 (array!64498) Bool)

(assert (=> b!1026491 (= e!579088 (and tp!72554 tp_is_empty!24223 (array_inv!24047 (_keys!11204 thiss!1427)) (array_inv!24048 (_values!6080 thiss!1427)) e!579093))))

(declare-fun b!1026492 () Bool)

(declare-fun res!687140 () Bool)

(declare-fun e!579090 () Bool)

(assert (=> b!1026492 (=> (not res!687140) (not e!579090))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1026492 (= res!687140 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37763 () Bool)

(declare-fun mapRes!37763 () Bool)

(assert (=> mapIsEmpty!37763 mapRes!37763))

(declare-fun b!1026493 () Bool)

(declare-fun e!579087 () Bool)

(assert (=> b!1026493 (= e!579087 tp_is_empty!24223)))

(declare-fun b!1026494 () Bool)

(declare-fun e!579092 () Bool)

(assert (=> b!1026494 (= e!579092 tp_is_empty!24223)))

(declare-fun mapNonEmpty!37763 () Bool)

(declare-fun tp!72555 () Bool)

(assert (=> mapNonEmpty!37763 (= mapRes!37763 (and tp!72555 e!579087))))

(declare-fun mapValue!37763 () ValueCell!11408)

(declare-fun mapKey!37763 () (_ BitVec 32))

(declare-fun mapRest!37763 () (Array (_ BitVec 32) ValueCell!11408))

(assert (=> mapNonEmpty!37763 (= (arr!31058 (_values!6080 thiss!1427)) (store mapRest!37763 mapKey!37763 mapValue!37763))))

(declare-fun res!687139 () Bool)

(assert (=> start!89504 (=> (not res!687139) (not e!579090))))

(declare-fun valid!2054 (LongMapFixedSize!5410) Bool)

(assert (=> start!89504 (= res!687139 (valid!2054 thiss!1427))))

(assert (=> start!89504 e!579090))

(assert (=> start!89504 e!579088))

(assert (=> start!89504 true))

(declare-fun b!1026495 () Bool)

(declare-fun e!579094 () Bool)

(assert (=> b!1026495 (= e!579094 true)))

(declare-fun lt!451598 () Bool)

(declare-datatypes ((List!21782 0))(
  ( (Nil!21779) (Cons!21778 (h!22976 (_ BitVec 64)) (t!30844 List!21782)) )
))
(declare-fun arrayNoDuplicates!0 (array!64496 (_ BitVec 32) List!21782) Bool)

(assert (=> b!1026495 (= lt!451598 (arrayNoDuplicates!0 (_keys!11204 thiss!1427) #b00000000000000000000000000000000 Nil!21779))))

(declare-fun b!1026496 () Bool)

(declare-fun res!687136 () Bool)

(assert (=> b!1026496 (=> res!687136 e!579094)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64496 (_ BitVec 32)) Bool)

(assert (=> b!1026496 (= res!687136 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11204 thiss!1427) (mask!29753 thiss!1427))))))

(declare-fun b!1026497 () Bool)

(assert (=> b!1026497 (= e!579093 (and e!579092 mapRes!37763))))

(declare-fun condMapEmpty!37763 () Bool)

(declare-fun mapDefault!37763 () ValueCell!11408)

