; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89252 () Bool)

(assert start!89252)

(declare-fun b!1023418 () Bool)

(declare-fun b_free!20293 () Bool)

(declare-fun b_next!20293 () Bool)

(assert (=> b!1023418 (= b_free!20293 (not b_next!20293))))

(declare-fun tp!71914 () Bool)

(declare-fun b_and!32515 () Bool)

(assert (=> b!1023418 (= tp!71914 b_and!32515)))

(declare-fun b!1023410 () Bool)

(declare-fun res!685417 () Bool)

(declare-fun e!576675 () Bool)

(assert (=> b!1023410 (=> (not res!685417) (not e!576675))))

(declare-datatypes ((V!36891 0))(
  ( (V!36892 (val!12057 Int)) )
))
(declare-datatypes ((ValueCell!11303 0))(
  ( (ValueCellFull!11303 (v!14626 V!36891)) (EmptyCell!11303) )
))
(declare-datatypes ((array!64070 0))(
  ( (array!64071 (arr!30847 (Array (_ BitVec 32) (_ BitVec 64))) (size!31358 (_ BitVec 32))) )
))
(declare-datatypes ((array!64072 0))(
  ( (array!64073 (arr!30848 (Array (_ BitVec 32) ValueCell!11303)) (size!31359 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5200 0))(
  ( (LongMapFixedSize!5201 (defaultEntry!5952 Int) (mask!29573 (_ BitVec 32)) (extraKeys!5684 (_ BitVec 32)) (zeroValue!5788 V!36891) (minValue!5788 V!36891) (_size!2655 (_ BitVec 32)) (_keys!11097 array!64070) (_values!5975 array!64072) (_vacant!2655 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5200)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64070 (_ BitVec 32)) Bool)

(assert (=> b!1023410 (= res!685417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11097 thiss!1427) (mask!29573 thiss!1427)))))

(declare-fun res!685414 () Bool)

(assert (=> start!89252 (=> (not res!685414) (not e!576675))))

(declare-fun valid!1981 (LongMapFixedSize!5200) Bool)

(assert (=> start!89252 (= res!685414 (valid!1981 thiss!1427))))

(assert (=> start!89252 e!576675))

(declare-fun e!576671 () Bool)

(assert (=> start!89252 e!576671))

(assert (=> start!89252 true))

(declare-fun mapIsEmpty!37437 () Bool)

(declare-fun mapRes!37437 () Bool)

(assert (=> mapIsEmpty!37437 mapRes!37437))

(declare-fun b!1023411 () Bool)

(assert (=> b!1023411 (= e!576675 false)))

(declare-fun lt!450405 () Bool)

(declare-datatypes ((List!21712 0))(
  ( (Nil!21709) (Cons!21708 (h!22906 (_ BitVec 64)) (t!30750 List!21712)) )
))
(declare-fun arrayNoDuplicates!0 (array!64070 (_ BitVec 32) List!21712) Bool)

(assert (=> b!1023411 (= lt!450405 (arrayNoDuplicates!0 (_keys!11097 thiss!1427) #b00000000000000000000000000000000 Nil!21709))))

(declare-fun b!1023412 () Bool)

(declare-fun res!685416 () Bool)

(assert (=> b!1023412 (=> (not res!685416) (not e!576675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023412 (= res!685416 (validMask!0 (mask!29573 thiss!1427)))))

(declare-fun b!1023413 () Bool)

(declare-fun res!685418 () Bool)

(assert (=> b!1023413 (=> (not res!685418) (not e!576675))))

(assert (=> b!1023413 (= res!685418 (and (= (size!31359 (_values!5975 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29573 thiss!1427))) (= (size!31358 (_keys!11097 thiss!1427)) (size!31359 (_values!5975 thiss!1427))) (bvsge (mask!29573 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5684 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5684 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5684 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5684 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5684 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5684 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5684 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1023414 () Bool)

(declare-fun res!685415 () Bool)

(assert (=> b!1023414 (=> (not res!685415) (not e!576675))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023414 (= res!685415 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1023415 () Bool)

(declare-fun e!576672 () Bool)

(declare-fun tp_is_empty!24013 () Bool)

(assert (=> b!1023415 (= e!576672 tp_is_empty!24013)))

(declare-fun b!1023416 () Bool)

(declare-fun e!576670 () Bool)

(assert (=> b!1023416 (= e!576670 tp_is_empty!24013)))

(declare-fun b!1023417 () Bool)

(declare-fun e!576673 () Bool)

(assert (=> b!1023417 (= e!576673 (and e!576672 mapRes!37437))))

(declare-fun condMapEmpty!37437 () Bool)

(declare-fun mapDefault!37437 () ValueCell!11303)

