; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89270 () Bool)

(assert start!89270)

(declare-fun b!1023647 () Bool)

(declare-fun b_free!20311 () Bool)

(declare-fun b_next!20311 () Bool)

(assert (=> b!1023647 (= b_free!20311 (not b_next!20311))))

(declare-fun tp!71968 () Bool)

(declare-fun b_and!32533 () Bool)

(assert (=> b!1023647 (= tp!71968 b_and!32533)))

(declare-fun e!576837 () Bool)

(declare-fun e!576833 () Bool)

(declare-datatypes ((V!36915 0))(
  ( (V!36916 (val!12066 Int)) )
))
(declare-datatypes ((ValueCell!11312 0))(
  ( (ValueCellFull!11312 (v!14635 V!36915)) (EmptyCell!11312) )
))
(declare-datatypes ((array!64106 0))(
  ( (array!64107 (arr!30865 (Array (_ BitVec 32) (_ BitVec 64))) (size!31376 (_ BitVec 32))) )
))
(declare-datatypes ((array!64108 0))(
  ( (array!64109 (arr!30866 (Array (_ BitVec 32) ValueCell!11312)) (size!31377 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5218 0))(
  ( (LongMapFixedSize!5219 (defaultEntry!5961 Int) (mask!29588 (_ BitVec 32)) (extraKeys!5693 (_ BitVec 32)) (zeroValue!5797 V!36915) (minValue!5797 V!36915) (_size!2664 (_ BitVec 32)) (_keys!11106 array!64106) (_values!5984 array!64108) (_vacant!2664 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5218)

(declare-fun tp_is_empty!24031 () Bool)

(declare-fun array_inv!23915 (array!64106) Bool)

(declare-fun array_inv!23916 (array!64108) Bool)

(assert (=> b!1023647 (= e!576833 (and tp!71968 tp_is_empty!24031 (array_inv!23915 (_keys!11106 thiss!1427)) (array_inv!23916 (_values!5984 thiss!1427)) e!576837))))

(declare-fun b!1023648 () Bool)

(declare-fun res!685543 () Bool)

(declare-fun e!576832 () Bool)

(assert (=> b!1023648 (=> (not res!685543) (not e!576832))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023648 (= res!685543 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1023649 () Bool)

(declare-fun e!576835 () Bool)

(assert (=> b!1023649 (= e!576835 tp_is_empty!24031)))

(declare-fun res!685544 () Bool)

(assert (=> start!89270 (=> (not res!685544) (not e!576832))))

(declare-fun valid!1988 (LongMapFixedSize!5218) Bool)

(assert (=> start!89270 (= res!685544 (valid!1988 thiss!1427))))

(assert (=> start!89270 e!576832))

(assert (=> start!89270 e!576833))

(assert (=> start!89270 true))

(declare-fun mapNonEmpty!37464 () Bool)

(declare-fun mapRes!37464 () Bool)

(declare-fun tp!71967 () Bool)

(declare-fun e!576834 () Bool)

(assert (=> mapNonEmpty!37464 (= mapRes!37464 (and tp!71967 e!576834))))

(declare-fun mapValue!37464 () ValueCell!11312)

(declare-fun mapKey!37464 () (_ BitVec 32))

(declare-fun mapRest!37464 () (Array (_ BitVec 32) ValueCell!11312))

(assert (=> mapNonEmpty!37464 (= (arr!30866 (_values!5984 thiss!1427)) (store mapRest!37464 mapKey!37464 mapValue!37464))))

(declare-fun b!1023650 () Bool)

(assert (=> b!1023650 (= e!576837 (and e!576835 mapRes!37464))))

(declare-fun condMapEmpty!37464 () Bool)

(declare-fun mapDefault!37464 () ValueCell!11312)

