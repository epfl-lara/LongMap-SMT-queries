; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89264 () Bool)

(assert start!89264)

(declare-fun b!1023572 () Bool)

(declare-fun b_free!20305 () Bool)

(declare-fun b_next!20305 () Bool)

(assert (=> b!1023572 (= b_free!20305 (not b_next!20305))))

(declare-fun tp!71949 () Bool)

(declare-fun b_and!32527 () Bool)

(assert (=> b!1023572 (= tp!71949 b_and!32527)))

(declare-fun mapIsEmpty!37455 () Bool)

(declare-fun mapRes!37455 () Bool)

(assert (=> mapIsEmpty!37455 mapRes!37455))

(declare-fun e!576778 () Bool)

(declare-fun tp_is_empty!24025 () Bool)

(declare-datatypes ((V!36907 0))(
  ( (V!36908 (val!12063 Int)) )
))
(declare-datatypes ((ValueCell!11309 0))(
  ( (ValueCellFull!11309 (v!14632 V!36907)) (EmptyCell!11309) )
))
(declare-datatypes ((array!64094 0))(
  ( (array!64095 (arr!30859 (Array (_ BitVec 32) (_ BitVec 64))) (size!31370 (_ BitVec 32))) )
))
(declare-datatypes ((array!64096 0))(
  ( (array!64097 (arr!30860 (Array (_ BitVec 32) ValueCell!11309)) (size!31371 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5212 0))(
  ( (LongMapFixedSize!5213 (defaultEntry!5958 Int) (mask!29583 (_ BitVec 32)) (extraKeys!5690 (_ BitVec 32)) (zeroValue!5794 V!36907) (minValue!5794 V!36907) (_size!2661 (_ BitVec 32)) (_keys!11103 array!64094) (_values!5981 array!64096) (_vacant!2661 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5212)

(declare-fun e!576781 () Bool)

(declare-fun array_inv!23909 (array!64094) Bool)

(declare-fun array_inv!23910 (array!64096) Bool)

(assert (=> b!1023572 (= e!576781 (and tp!71949 tp_is_empty!24025 (array_inv!23909 (_keys!11103 thiss!1427)) (array_inv!23910 (_values!5981 thiss!1427)) e!576778))))

(declare-fun b!1023573 () Bool)

(declare-fun res!685505 () Bool)

(declare-fun e!576779 () Bool)

(assert (=> b!1023573 (=> (not res!685505) (not e!576779))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023573 (= res!685505 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1023574 () Bool)

(assert (=> b!1023574 (= e!576779 false)))

(declare-fun lt!450423 () Bool)

(declare-datatypes ((List!21716 0))(
  ( (Nil!21713) (Cons!21712 (h!22910 (_ BitVec 64)) (t!30754 List!21716)) )
))
(declare-fun arrayNoDuplicates!0 (array!64094 (_ BitVec 32) List!21716) Bool)

(assert (=> b!1023574 (= lt!450423 (arrayNoDuplicates!0 (_keys!11103 thiss!1427) #b00000000000000000000000000000000 Nil!21713))))

(declare-fun b!1023575 () Bool)

(declare-fun res!685504 () Bool)

(assert (=> b!1023575 (=> (not res!685504) (not e!576779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64094 (_ BitVec 32)) Bool)

(assert (=> b!1023575 (= res!685504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11103 thiss!1427) (mask!29583 thiss!1427)))))

(declare-fun res!685507 () Bool)

(assert (=> start!89264 (=> (not res!685507) (not e!576779))))

(declare-fun valid!1985 (LongMapFixedSize!5212) Bool)

(assert (=> start!89264 (= res!685507 (valid!1985 thiss!1427))))

(assert (=> start!89264 e!576779))

(assert (=> start!89264 e!576781))

(assert (=> start!89264 true))

(declare-fun b!1023576 () Bool)

(declare-fun e!576780 () Bool)

(assert (=> b!1023576 (= e!576780 tp_is_empty!24025)))

(declare-fun b!1023577 () Bool)

(declare-fun res!685506 () Bool)

(assert (=> b!1023577 (=> (not res!685506) (not e!576779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023577 (= res!685506 (validMask!0 (mask!29583 thiss!1427)))))

(declare-fun b!1023578 () Bool)

(declare-fun res!685508 () Bool)

(assert (=> b!1023578 (=> (not res!685508) (not e!576779))))

(assert (=> b!1023578 (= res!685508 (and (= (size!31371 (_values!5981 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29583 thiss!1427))) (= (size!31370 (_keys!11103 thiss!1427)) (size!31371 (_values!5981 thiss!1427))) (bvsge (mask!29583 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5690 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5690 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5690 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5690 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5690 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5690 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5690 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1023579 () Bool)

(declare-fun e!576782 () Bool)

(assert (=> b!1023579 (= e!576778 (and e!576782 mapRes!37455))))

(declare-fun condMapEmpty!37455 () Bool)

(declare-fun mapDefault!37455 () ValueCell!11309)

