; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89214 () Bool)

(assert start!89214)

(declare-fun b!1022897 () Bool)

(declare-fun b_free!20255 () Bool)

(declare-fun b_next!20255 () Bool)

(assert (=> b!1022897 (= b_free!20255 (not b_next!20255))))

(declare-fun tp!71799 () Bool)

(declare-fun b_and!32477 () Bool)

(assert (=> b!1022897 (= tp!71799 b_and!32477)))

(declare-datatypes ((V!36839 0))(
  ( (V!36840 (val!12038 Int)) )
))
(declare-datatypes ((ValueCell!11284 0))(
  ( (ValueCellFull!11284 (v!14607 V!36839)) (EmptyCell!11284) )
))
(declare-datatypes ((array!63994 0))(
  ( (array!63995 (arr!30809 (Array (_ BitVec 32) (_ BitVec 64))) (size!31320 (_ BitVec 32))) )
))
(declare-datatypes ((array!63996 0))(
  ( (array!63997 (arr!30810 (Array (_ BitVec 32) ValueCell!11284)) (size!31321 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5162 0))(
  ( (LongMapFixedSize!5163 (defaultEntry!5933 Int) (mask!29540 (_ BitVec 32)) (extraKeys!5665 (_ BitVec 32)) (zeroValue!5769 V!36839) (minValue!5769 V!36839) (_size!2636 (_ BitVec 32)) (_keys!11078 array!63994) (_values!5956 array!63996) (_vacant!2636 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5162)

(declare-fun tp_is_empty!23975 () Bool)

(declare-fun e!576328 () Bool)

(declare-fun e!576333 () Bool)

(declare-fun array_inv!23873 (array!63994) Bool)

(declare-fun array_inv!23874 (array!63996) Bool)

(assert (=> b!1022897 (= e!576333 (and tp!71799 tp_is_empty!23975 (array_inv!23873 (_keys!11078 thiss!1427)) (array_inv!23874 (_values!5956 thiss!1427)) e!576328))))

(declare-fun b!1022898 () Bool)

(declare-fun e!576332 () Bool)

(assert (=> b!1022898 (= e!576332 false)))

(declare-fun lt!450348 () Bool)

(declare-datatypes ((List!21698 0))(
  ( (Nil!21695) (Cons!21694 (h!22892 (_ BitVec 64)) (t!30736 List!21698)) )
))
(declare-fun arrayNoDuplicates!0 (array!63994 (_ BitVec 32) List!21698) Bool)

(assert (=> b!1022898 (= lt!450348 (arrayNoDuplicates!0 (_keys!11078 thiss!1427) #b00000000000000000000000000000000 Nil!21695))))

(declare-fun b!1022899 () Bool)

(declare-fun res!685132 () Bool)

(assert (=> b!1022899 (=> (not res!685132) (not e!576332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022899 (= res!685132 (validMask!0 (mask!29540 thiss!1427)))))

(declare-fun b!1022900 () Bool)

(declare-fun res!685129 () Bool)

(assert (=> b!1022900 (=> (not res!685129) (not e!576332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63994 (_ BitVec 32)) Bool)

(assert (=> b!1022900 (= res!685129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11078 thiss!1427) (mask!29540 thiss!1427)))))

(declare-fun mapNonEmpty!37380 () Bool)

(declare-fun mapRes!37380 () Bool)

(declare-fun tp!71800 () Bool)

(declare-fun e!576329 () Bool)

(assert (=> mapNonEmpty!37380 (= mapRes!37380 (and tp!71800 e!576329))))

(declare-fun mapKey!37380 () (_ BitVec 32))

(declare-fun mapRest!37380 () (Array (_ BitVec 32) ValueCell!11284))

(declare-fun mapValue!37380 () ValueCell!11284)

(assert (=> mapNonEmpty!37380 (= (arr!30810 (_values!5956 thiss!1427)) (store mapRest!37380 mapKey!37380 mapValue!37380))))

(declare-fun b!1022901 () Bool)

(declare-fun res!685133 () Bool)

(assert (=> b!1022901 (=> (not res!685133) (not e!576332))))

(assert (=> b!1022901 (= res!685133 (and (= (size!31321 (_values!5956 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29540 thiss!1427))) (= (size!31320 (_keys!11078 thiss!1427)) (size!31321 (_values!5956 thiss!1427))) (bvsge (mask!29540 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5665 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5665 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5665 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5665 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5665 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5665 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5665 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1022902 () Bool)

(declare-fun res!685130 () Bool)

(assert (=> b!1022902 (=> (not res!685130) (not e!576332))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022902 (= res!685130 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!685131 () Bool)

(assert (=> start!89214 (=> (not res!685131) (not e!576332))))

(declare-fun valid!1967 (LongMapFixedSize!5162) Bool)

(assert (=> start!89214 (= res!685131 (valid!1967 thiss!1427))))

(assert (=> start!89214 e!576332))

(assert (=> start!89214 e!576333))

(assert (=> start!89214 true))

(declare-fun mapIsEmpty!37380 () Bool)

(assert (=> mapIsEmpty!37380 mapRes!37380))

(declare-fun b!1022903 () Bool)

(declare-fun e!576331 () Bool)

(assert (=> b!1022903 (= e!576331 tp_is_empty!23975)))

(declare-fun b!1022904 () Bool)

(assert (=> b!1022904 (= e!576329 tp_is_empty!23975)))

(declare-fun b!1022905 () Bool)

(assert (=> b!1022905 (= e!576328 (and e!576331 mapRes!37380))))

(declare-fun condMapEmpty!37380 () Bool)

(declare-fun mapDefault!37380 () ValueCell!11284)

