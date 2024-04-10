; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89218 () Bool)

(assert start!89218)

(declare-fun b!1022951 () Bool)

(declare-fun b_free!20259 () Bool)

(declare-fun b_next!20259 () Bool)

(assert (=> b!1022951 (= b_free!20259 (not b_next!20259))))

(declare-fun tp!71812 () Bool)

(declare-fun b_and!32481 () Bool)

(assert (=> b!1022951 (= tp!71812 b_and!32481)))

(declare-fun mapIsEmpty!37386 () Bool)

(declare-fun mapRes!37386 () Bool)

(assert (=> mapIsEmpty!37386 mapRes!37386))

(declare-fun mapNonEmpty!37386 () Bool)

(declare-fun tp!71811 () Bool)

(declare-fun e!576364 () Bool)

(assert (=> mapNonEmpty!37386 (= mapRes!37386 (and tp!71811 e!576364))))

(declare-datatypes ((V!36845 0))(
  ( (V!36846 (val!12040 Int)) )
))
(declare-datatypes ((ValueCell!11286 0))(
  ( (ValueCellFull!11286 (v!14609 V!36845)) (EmptyCell!11286) )
))
(declare-fun mapRest!37386 () (Array (_ BitVec 32) ValueCell!11286))

(declare-fun mapValue!37386 () ValueCell!11286)

(declare-fun mapKey!37386 () (_ BitVec 32))

(declare-datatypes ((array!64002 0))(
  ( (array!64003 (arr!30813 (Array (_ BitVec 32) (_ BitVec 64))) (size!31324 (_ BitVec 32))) )
))
(declare-datatypes ((array!64004 0))(
  ( (array!64005 (arr!30814 (Array (_ BitVec 32) ValueCell!11286)) (size!31325 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5166 0))(
  ( (LongMapFixedSize!5167 (defaultEntry!5935 Int) (mask!29544 (_ BitVec 32)) (extraKeys!5667 (_ BitVec 32)) (zeroValue!5771 V!36845) (minValue!5771 V!36845) (_size!2638 (_ BitVec 32)) (_keys!11080 array!64002) (_values!5958 array!64004) (_vacant!2638 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5166)

(assert (=> mapNonEmpty!37386 (= (arr!30814 (_values!5958 thiss!1427)) (store mapRest!37386 mapKey!37386 mapValue!37386))))

(declare-fun res!685160 () Bool)

(declare-fun e!576368 () Bool)

(assert (=> start!89218 (=> (not res!685160) (not e!576368))))

(declare-fun valid!1968 (LongMapFixedSize!5166) Bool)

(assert (=> start!89218 (= res!685160 (valid!1968 thiss!1427))))

(assert (=> start!89218 e!576368))

(declare-fun e!576366 () Bool)

(assert (=> start!89218 e!576366))

(assert (=> start!89218 true))

(declare-fun tp_is_empty!23979 () Bool)

(declare-fun e!576367 () Bool)

(declare-fun array_inv!23875 (array!64002) Bool)

(declare-fun array_inv!23876 (array!64004) Bool)

(assert (=> b!1022951 (= e!576366 (and tp!71812 tp_is_empty!23979 (array_inv!23875 (_keys!11080 thiss!1427)) (array_inv!23876 (_values!5958 thiss!1427)) e!576367))))

(declare-fun b!1022952 () Bool)

(declare-fun res!685159 () Bool)

(assert (=> b!1022952 (=> (not res!685159) (not e!576368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022952 (= res!685159 (validMask!0 (mask!29544 thiss!1427)))))

(declare-fun b!1022953 () Bool)

(assert (=> b!1022953 (= e!576364 tp_is_empty!23979)))

(declare-fun b!1022954 () Bool)

(declare-fun res!685163 () Bool)

(assert (=> b!1022954 (=> (not res!685163) (not e!576368))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64002 (_ BitVec 32)) Bool)

(assert (=> b!1022954 (= res!685163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11080 thiss!1427) (mask!29544 thiss!1427)))))

(declare-fun b!1022955 () Bool)

(declare-fun e!576365 () Bool)

(assert (=> b!1022955 (= e!576367 (and e!576365 mapRes!37386))))

(declare-fun condMapEmpty!37386 () Bool)

(declare-fun mapDefault!37386 () ValueCell!11286)

(assert (=> b!1022955 (= condMapEmpty!37386 (= (arr!30814 (_values!5958 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11286)) mapDefault!37386)))))

(declare-fun b!1022956 () Bool)

(assert (=> b!1022956 (= e!576365 tp_is_empty!23979)))

(declare-fun b!1022957 () Bool)

(declare-fun res!685161 () Bool)

(assert (=> b!1022957 (=> (not res!685161) (not e!576368))))

(assert (=> b!1022957 (= res!685161 (and (= (size!31325 (_values!5958 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29544 thiss!1427))) (= (size!31324 (_keys!11080 thiss!1427)) (size!31325 (_values!5958 thiss!1427))) (bvsge (mask!29544 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5667 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5667 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5667 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5667 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5667 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5667 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5667 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1022958 () Bool)

(assert (=> b!1022958 (= e!576368 false)))

(declare-fun lt!450354 () Bool)

(declare-datatypes ((List!21699 0))(
  ( (Nil!21696) (Cons!21695 (h!22893 (_ BitVec 64)) (t!30737 List!21699)) )
))
(declare-fun arrayNoDuplicates!0 (array!64002 (_ BitVec 32) List!21699) Bool)

(assert (=> b!1022958 (= lt!450354 (arrayNoDuplicates!0 (_keys!11080 thiss!1427) #b00000000000000000000000000000000 Nil!21696))))

(declare-fun b!1022959 () Bool)

(declare-fun res!685162 () Bool)

(assert (=> b!1022959 (=> (not res!685162) (not e!576368))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022959 (= res!685162 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!89218 res!685160) b!1022959))

(assert (= (and b!1022959 res!685162) b!1022952))

(assert (= (and b!1022952 res!685159) b!1022957))

(assert (= (and b!1022957 res!685161) b!1022954))

(assert (= (and b!1022954 res!685163) b!1022958))

(assert (= (and b!1022955 condMapEmpty!37386) mapIsEmpty!37386))

(assert (= (and b!1022955 (not condMapEmpty!37386)) mapNonEmpty!37386))

(get-info :version)

(assert (= (and mapNonEmpty!37386 ((_ is ValueCellFull!11286) mapValue!37386)) b!1022953))

(assert (= (and b!1022955 ((_ is ValueCellFull!11286) mapDefault!37386)) b!1022956))

(assert (= b!1022951 b!1022955))

(assert (= start!89218 b!1022951))

(declare-fun m!941869 () Bool)

(assert (=> mapNonEmpty!37386 m!941869))

(declare-fun m!941871 () Bool)

(assert (=> b!1022952 m!941871))

(declare-fun m!941873 () Bool)

(assert (=> b!1022954 m!941873))

(declare-fun m!941875 () Bool)

(assert (=> b!1022951 m!941875))

(declare-fun m!941877 () Bool)

(assert (=> b!1022951 m!941877))

(declare-fun m!941879 () Bool)

(assert (=> b!1022958 m!941879))

(declare-fun m!941881 () Bool)

(assert (=> start!89218 m!941881))

(check-sat (not b!1022951) tp_is_empty!23979 (not b!1022954) (not b_next!20259) (not start!89218) (not b!1022958) (not b!1022952) b_and!32481 (not mapNonEmpty!37386))
(check-sat b_and!32481 (not b_next!20259))
