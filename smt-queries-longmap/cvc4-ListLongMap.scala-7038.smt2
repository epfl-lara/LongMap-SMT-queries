; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89244 () Bool)

(assert start!89244)

(declare-fun b!1023306 () Bool)

(declare-fun b_free!20285 () Bool)

(declare-fun b_next!20285 () Bool)

(assert (=> b!1023306 (= b_free!20285 (not b_next!20285))))

(declare-fun tp!71890 () Bool)

(declare-fun b_and!32507 () Bool)

(assert (=> b!1023306 (= tp!71890 b_and!32507)))

(declare-fun b!1023302 () Bool)

(declare-fun res!685355 () Bool)

(declare-fun e!576600 () Bool)

(assert (=> b!1023302 (=> (not res!685355) (not e!576600))))

(declare-datatypes ((V!36879 0))(
  ( (V!36880 (val!12053 Int)) )
))
(declare-datatypes ((ValueCell!11299 0))(
  ( (ValueCellFull!11299 (v!14622 V!36879)) (EmptyCell!11299) )
))
(declare-datatypes ((array!64054 0))(
  ( (array!64055 (arr!30839 (Array (_ BitVec 32) (_ BitVec 64))) (size!31350 (_ BitVec 32))) )
))
(declare-datatypes ((array!64056 0))(
  ( (array!64057 (arr!30840 (Array (_ BitVec 32) ValueCell!11299)) (size!31351 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5192 0))(
  ( (LongMapFixedSize!5193 (defaultEntry!5948 Int) (mask!29565 (_ BitVec 32)) (extraKeys!5680 (_ BitVec 32)) (zeroValue!5784 V!36879) (minValue!5784 V!36879) (_size!2651 (_ BitVec 32)) (_keys!11093 array!64054) (_values!5971 array!64056) (_vacant!2651 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5192)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64054 (_ BitVec 32)) Bool)

(assert (=> b!1023302 (= res!685355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11093 thiss!1427) (mask!29565 thiss!1427)))))

(declare-fun mapNonEmpty!37425 () Bool)

(declare-fun mapRes!37425 () Bool)

(declare-fun tp!71889 () Bool)

(declare-fun e!576598 () Bool)

(assert (=> mapNonEmpty!37425 (= mapRes!37425 (and tp!71889 e!576598))))

(declare-fun mapKey!37425 () (_ BitVec 32))

(declare-fun mapValue!37425 () ValueCell!11299)

(declare-fun mapRest!37425 () (Array (_ BitVec 32) ValueCell!11299))

(assert (=> mapNonEmpty!37425 (= (arr!30840 (_values!5971 thiss!1427)) (store mapRest!37425 mapKey!37425 mapValue!37425))))

(declare-fun b!1023303 () Bool)

(declare-fun tp_is_empty!24005 () Bool)

(assert (=> b!1023303 (= e!576598 tp_is_empty!24005)))

(declare-fun b!1023304 () Bool)

(declare-fun res!685356 () Bool)

(assert (=> b!1023304 (=> (not res!685356) (not e!576600))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023304 (= res!685356 (validMask!0 (mask!29565 thiss!1427)))))

(declare-fun res!685357 () Bool)

(assert (=> start!89244 (=> (not res!685357) (not e!576600))))

(declare-fun valid!1978 (LongMapFixedSize!5192) Bool)

(assert (=> start!89244 (= res!685357 (valid!1978 thiss!1427))))

(assert (=> start!89244 e!576600))

(declare-fun e!576601 () Bool)

(assert (=> start!89244 e!576601))

(assert (=> start!89244 true))

(declare-fun b!1023305 () Bool)

(declare-fun e!576602 () Bool)

(assert (=> b!1023305 (= e!576602 tp_is_empty!24005)))

(declare-fun e!576603 () Bool)

(declare-fun array_inv!23897 (array!64054) Bool)

(declare-fun array_inv!23898 (array!64056) Bool)

(assert (=> b!1023306 (= e!576601 (and tp!71890 tp_is_empty!24005 (array_inv!23897 (_keys!11093 thiss!1427)) (array_inv!23898 (_values!5971 thiss!1427)) e!576603))))

(declare-fun b!1023307 () Bool)

(declare-fun res!685358 () Bool)

(assert (=> b!1023307 (=> (not res!685358) (not e!576600))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023307 (= res!685358 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1023308 () Bool)

(declare-fun res!685354 () Bool)

(assert (=> b!1023308 (=> (not res!685354) (not e!576600))))

(assert (=> b!1023308 (= res!685354 (and (= (size!31351 (_values!5971 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29565 thiss!1427))) (= (size!31350 (_keys!11093 thiss!1427)) (size!31351 (_values!5971 thiss!1427))) (bvsge (mask!29565 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5680 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5680 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5680 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5680 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5680 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5680 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5680 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1023309 () Bool)

(assert (=> b!1023309 (= e!576603 (and e!576602 mapRes!37425))))

(declare-fun condMapEmpty!37425 () Bool)

(declare-fun mapDefault!37425 () ValueCell!11299)

