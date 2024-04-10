; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89246 () Bool)

(assert start!89246)

(declare-fun b!1023335 () Bool)

(declare-fun b_free!20287 () Bool)

(declare-fun b_next!20287 () Bool)

(assert (=> b!1023335 (= b_free!20287 (not b_next!20287))))

(declare-fun tp!71896 () Bool)

(declare-fun b_and!32509 () Bool)

(assert (=> b!1023335 (= tp!71896 b_and!32509)))

(declare-fun mapNonEmpty!37428 () Bool)

(declare-fun mapRes!37428 () Bool)

(declare-fun tp!71895 () Bool)

(declare-fun e!576619 () Bool)

(assert (=> mapNonEmpty!37428 (= mapRes!37428 (and tp!71895 e!576619))))

(declare-fun mapKey!37428 () (_ BitVec 32))

(declare-datatypes ((V!36883 0))(
  ( (V!36884 (val!12054 Int)) )
))
(declare-datatypes ((ValueCell!11300 0))(
  ( (ValueCellFull!11300 (v!14623 V!36883)) (EmptyCell!11300) )
))
(declare-fun mapValue!37428 () ValueCell!11300)

(declare-fun mapRest!37428 () (Array (_ BitVec 32) ValueCell!11300))

(declare-datatypes ((array!64058 0))(
  ( (array!64059 (arr!30841 (Array (_ BitVec 32) (_ BitVec 64))) (size!31352 (_ BitVec 32))) )
))
(declare-datatypes ((array!64060 0))(
  ( (array!64061 (arr!30842 (Array (_ BitVec 32) ValueCell!11300)) (size!31353 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5194 0))(
  ( (LongMapFixedSize!5195 (defaultEntry!5949 Int) (mask!29568 (_ BitVec 32)) (extraKeys!5681 (_ BitVec 32)) (zeroValue!5785 V!36883) (minValue!5785 V!36883) (_size!2652 (_ BitVec 32)) (_keys!11094 array!64058) (_values!5972 array!64060) (_vacant!2652 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5194)

(assert (=> mapNonEmpty!37428 (= (arr!30842 (_values!5972 thiss!1427)) (store mapRest!37428 mapKey!37428 mapValue!37428))))

(declare-fun b!1023329 () Bool)

(declare-fun e!576618 () Bool)

(assert (=> b!1023329 (= e!576618 false)))

(declare-fun lt!450396 () Bool)

(declare-datatypes ((List!21710 0))(
  ( (Nil!21707) (Cons!21706 (h!22904 (_ BitVec 64)) (t!30748 List!21710)) )
))
(declare-fun arrayNoDuplicates!0 (array!64058 (_ BitVec 32) List!21710) Bool)

(assert (=> b!1023329 (= lt!450396 (arrayNoDuplicates!0 (_keys!11094 thiss!1427) #b00000000000000000000000000000000 Nil!21707))))

(declare-fun b!1023330 () Bool)

(declare-fun res!685370 () Bool)

(assert (=> b!1023330 (=> (not res!685370) (not e!576618))))

(assert (=> b!1023330 (= res!685370 (and (= (size!31353 (_values!5972 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29568 thiss!1427))) (= (size!31352 (_keys!11094 thiss!1427)) (size!31353 (_values!5972 thiss!1427))) (bvsge (mask!29568 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5681 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5681 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5681 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5681 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5681 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5681 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5681 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1023332 () Bool)

(declare-fun res!685372 () Bool)

(assert (=> b!1023332 (=> (not res!685372) (not e!576618))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023332 (= res!685372 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1023333 () Bool)

(declare-fun e!576616 () Bool)

(declare-fun tp_is_empty!24007 () Bool)

(assert (=> b!1023333 (= e!576616 tp_is_empty!24007)))

(declare-fun mapIsEmpty!37428 () Bool)

(assert (=> mapIsEmpty!37428 mapRes!37428))

(declare-fun b!1023334 () Bool)

(declare-fun res!685373 () Bool)

(assert (=> b!1023334 (=> (not res!685373) (not e!576618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023334 (= res!685373 (validMask!0 (mask!29568 thiss!1427)))))

(declare-fun e!576621 () Bool)

(declare-fun e!576617 () Bool)

(declare-fun array_inv!23899 (array!64058) Bool)

(declare-fun array_inv!23900 (array!64060) Bool)

(assert (=> b!1023335 (= e!576621 (and tp!71896 tp_is_empty!24007 (array_inv!23899 (_keys!11094 thiss!1427)) (array_inv!23900 (_values!5972 thiss!1427)) e!576617))))

(declare-fun b!1023331 () Bool)

(assert (=> b!1023331 (= e!576617 (and e!576616 mapRes!37428))))

(declare-fun condMapEmpty!37428 () Bool)

(declare-fun mapDefault!37428 () ValueCell!11300)

