; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90186 () Bool)

(assert start!90186)

(declare-fun b!1032770 () Bool)

(declare-fun b_free!20745 () Bool)

(declare-fun b_next!20745 () Bool)

(assert (=> b!1032770 (= b_free!20745 (not b_next!20745))))

(declare-fun tp!73318 () Bool)

(declare-fun b_and!33213 () Bool)

(assert (=> b!1032770 (= tp!73318 b_and!33213)))

(declare-fun b!1032768 () Bool)

(declare-fun res!690196 () Bool)

(declare-fun e!583610 () Bool)

(assert (=> b!1032768 (=> (not res!690196) (not e!583610))))

(declare-datatypes ((V!37493 0))(
  ( (V!37494 (val!12283 Int)) )
))
(declare-datatypes ((ValueCell!11529 0))(
  ( (ValueCellFull!11529 (v!14860 V!37493)) (EmptyCell!11529) )
))
(declare-datatypes ((array!65000 0))(
  ( (array!65001 (arr!31299 (Array (_ BitVec 32) (_ BitVec 64))) (size!31819 (_ BitVec 32))) )
))
(declare-datatypes ((array!65002 0))(
  ( (array!65003 (arr!31300 (Array (_ BitVec 32) ValueCell!11529)) (size!31820 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5652 0))(
  ( (LongMapFixedSize!5653 (defaultEntry!6200 Int) (mask!30030 (_ BitVec 32)) (extraKeys!5932 (_ BitVec 32)) (zeroValue!6036 V!37493) (minValue!6036 V!37493) (_size!2881 (_ BitVec 32)) (_keys!11376 array!65000) (_values!6223 array!65002) (_vacant!2881 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5652)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032768 (= res!690196 (validMask!0 (mask!30030 thiss!1427)))))

(declare-fun b!1032769 () Bool)

(declare-fun e!583613 () Bool)

(declare-fun tp_is_empty!24465 () Bool)

(assert (=> b!1032769 (= e!583613 tp_is_empty!24465)))

(declare-fun e!583614 () Bool)

(declare-fun e!583612 () Bool)

(declare-fun array_inv!24223 (array!65000) Bool)

(declare-fun array_inv!24224 (array!65002) Bool)

(assert (=> b!1032770 (= e!583612 (and tp!73318 tp_is_empty!24465 (array_inv!24223 (_keys!11376 thiss!1427)) (array_inv!24224 (_values!6223 thiss!1427)) e!583614))))

(declare-fun mapNonEmpty!38163 () Bool)

(declare-fun mapRes!38163 () Bool)

(declare-fun tp!73317 () Bool)

(assert (=> mapNonEmpty!38163 (= mapRes!38163 (and tp!73317 e!583613))))

(declare-fun mapKey!38163 () (_ BitVec 32))

(declare-fun mapRest!38163 () (Array (_ BitVec 32) ValueCell!11529))

(declare-fun mapValue!38163 () ValueCell!11529)

(assert (=> mapNonEmpty!38163 (= (arr!31300 (_values!6223 thiss!1427)) (store mapRest!38163 mapKey!38163 mapValue!38163))))

(declare-fun b!1032771 () Bool)

(declare-fun res!690197 () Bool)

(assert (=> b!1032771 (=> (not res!690197) (not e!583610))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032771 (= res!690197 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!38163 () Bool)

(assert (=> mapIsEmpty!38163 mapRes!38163))

(declare-fun b!1032772 () Bool)

(declare-fun e!583611 () Bool)

(assert (=> b!1032772 (= e!583614 (and e!583611 mapRes!38163))))

(declare-fun condMapEmpty!38163 () Bool)

(declare-fun mapDefault!38163 () ValueCell!11529)

(assert (=> b!1032772 (= condMapEmpty!38163 (= (arr!31300 (_values!6223 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11529)) mapDefault!38163)))))

(declare-fun b!1032773 () Bool)

(assert (=> b!1032773 (= e!583611 tp_is_empty!24465)))

(declare-fun b!1032767 () Bool)

(assert (=> b!1032767 (= e!583610 (and (= (size!31820 (_values!6223 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30030 thiss!1427))) (= (size!31819 (_keys!11376 thiss!1427)) (size!31820 (_values!6223 thiss!1427))) (bvslt (mask!30030 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun res!690195 () Bool)

(assert (=> start!90186 (=> (not res!690195) (not e!583610))))

(declare-fun valid!2138 (LongMapFixedSize!5652) Bool)

(assert (=> start!90186 (= res!690195 (valid!2138 thiss!1427))))

(assert (=> start!90186 e!583610))

(assert (=> start!90186 e!583612))

(assert (=> start!90186 true))

(assert (= (and start!90186 res!690195) b!1032771))

(assert (= (and b!1032771 res!690197) b!1032768))

(assert (= (and b!1032768 res!690196) b!1032767))

(assert (= (and b!1032772 condMapEmpty!38163) mapIsEmpty!38163))

(assert (= (and b!1032772 (not condMapEmpty!38163)) mapNonEmpty!38163))

(get-info :version)

(assert (= (and mapNonEmpty!38163 ((_ is ValueCellFull!11529) mapValue!38163)) b!1032769))

(assert (= (and b!1032772 ((_ is ValueCellFull!11529) mapDefault!38163)) b!1032773))

(assert (= b!1032770 b!1032772))

(assert (= start!90186 b!1032770))

(declare-fun m!952873 () Bool)

(assert (=> b!1032768 m!952873))

(declare-fun m!952875 () Bool)

(assert (=> b!1032770 m!952875))

(declare-fun m!952877 () Bool)

(assert (=> b!1032770 m!952877))

(declare-fun m!952879 () Bool)

(assert (=> mapNonEmpty!38163 m!952879))

(declare-fun m!952881 () Bool)

(assert (=> start!90186 m!952881))

(check-sat (not b!1032768) (not b!1032770) b_and!33213 (not mapNonEmpty!38163) (not b_next!20745) (not start!90186) tp_is_empty!24465)
(check-sat b_and!33213 (not b_next!20745))
(get-model)

(declare-fun d!123725 () Bool)

(assert (=> d!123725 (= (validMask!0 (mask!30030 thiss!1427)) (and (or (= (mask!30030 thiss!1427) #b00000000000000000000000000000111) (= (mask!30030 thiss!1427) #b00000000000000000000000000001111) (= (mask!30030 thiss!1427) #b00000000000000000000000000011111) (= (mask!30030 thiss!1427) #b00000000000000000000000000111111) (= (mask!30030 thiss!1427) #b00000000000000000000000001111111) (= (mask!30030 thiss!1427) #b00000000000000000000000011111111) (= (mask!30030 thiss!1427) #b00000000000000000000000111111111) (= (mask!30030 thiss!1427) #b00000000000000000000001111111111) (= (mask!30030 thiss!1427) #b00000000000000000000011111111111) (= (mask!30030 thiss!1427) #b00000000000000000000111111111111) (= (mask!30030 thiss!1427) #b00000000000000000001111111111111) (= (mask!30030 thiss!1427) #b00000000000000000011111111111111) (= (mask!30030 thiss!1427) #b00000000000000000111111111111111) (= (mask!30030 thiss!1427) #b00000000000000001111111111111111) (= (mask!30030 thiss!1427) #b00000000000000011111111111111111) (= (mask!30030 thiss!1427) #b00000000000000111111111111111111) (= (mask!30030 thiss!1427) #b00000000000001111111111111111111) (= (mask!30030 thiss!1427) #b00000000000011111111111111111111) (= (mask!30030 thiss!1427) #b00000000000111111111111111111111) (= (mask!30030 thiss!1427) #b00000000001111111111111111111111) (= (mask!30030 thiss!1427) #b00000000011111111111111111111111) (= (mask!30030 thiss!1427) #b00000000111111111111111111111111) (= (mask!30030 thiss!1427) #b00000001111111111111111111111111) (= (mask!30030 thiss!1427) #b00000011111111111111111111111111) (= (mask!30030 thiss!1427) #b00000111111111111111111111111111) (= (mask!30030 thiss!1427) #b00001111111111111111111111111111) (= (mask!30030 thiss!1427) #b00011111111111111111111111111111) (= (mask!30030 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30030 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1032768 d!123725))

(declare-fun d!123727 () Bool)

(declare-fun res!690213 () Bool)

(declare-fun e!583635 () Bool)

(assert (=> d!123727 (=> (not res!690213) (not e!583635))))

(declare-fun simpleValid!400 (LongMapFixedSize!5652) Bool)

(assert (=> d!123727 (= res!690213 (simpleValid!400 thiss!1427))))

(assert (=> d!123727 (= (valid!2138 thiss!1427) e!583635)))

(declare-fun b!1032801 () Bool)

(declare-fun res!690214 () Bool)

(assert (=> b!1032801 (=> (not res!690214) (not e!583635))))

(declare-fun arrayCountValidKeys!0 (array!65000 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1032801 (= res!690214 (= (arrayCountValidKeys!0 (_keys!11376 thiss!1427) #b00000000000000000000000000000000 (size!31819 (_keys!11376 thiss!1427))) (_size!2881 thiss!1427)))))

(declare-fun b!1032802 () Bool)

(declare-fun res!690215 () Bool)

(assert (=> b!1032802 (=> (not res!690215) (not e!583635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65000 (_ BitVec 32)) Bool)

(assert (=> b!1032802 (= res!690215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11376 thiss!1427) (mask!30030 thiss!1427)))))

(declare-fun b!1032803 () Bool)

(declare-datatypes ((List!21898 0))(
  ( (Nil!21895) (Cons!21894 (h!23096 (_ BitVec 64)) (t!31092 List!21898)) )
))
(declare-fun arrayNoDuplicates!0 (array!65000 (_ BitVec 32) List!21898) Bool)

(assert (=> b!1032803 (= e!583635 (arrayNoDuplicates!0 (_keys!11376 thiss!1427) #b00000000000000000000000000000000 Nil!21895))))

(assert (= (and d!123727 res!690213) b!1032801))

(assert (= (and b!1032801 res!690214) b!1032802))

(assert (= (and b!1032802 res!690215) b!1032803))

(declare-fun m!952893 () Bool)

(assert (=> d!123727 m!952893))

(declare-fun m!952895 () Bool)

(assert (=> b!1032801 m!952895))

(declare-fun m!952897 () Bool)

(assert (=> b!1032802 m!952897))

(declare-fun m!952899 () Bool)

(assert (=> b!1032803 m!952899))

(assert (=> start!90186 d!123727))

(declare-fun d!123729 () Bool)

(assert (=> d!123729 (= (array_inv!24223 (_keys!11376 thiss!1427)) (bvsge (size!31819 (_keys!11376 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1032770 d!123729))

(declare-fun d!123731 () Bool)

(assert (=> d!123731 (= (array_inv!24224 (_values!6223 thiss!1427)) (bvsge (size!31820 (_values!6223 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1032770 d!123731))

(declare-fun b!1032810 () Bool)

(declare-fun e!583640 () Bool)

(assert (=> b!1032810 (= e!583640 tp_is_empty!24465)))

(declare-fun condMapEmpty!38169 () Bool)

(declare-fun mapDefault!38169 () ValueCell!11529)

(assert (=> mapNonEmpty!38163 (= condMapEmpty!38169 (= mapRest!38163 ((as const (Array (_ BitVec 32) ValueCell!11529)) mapDefault!38169)))))

(declare-fun e!583641 () Bool)

(declare-fun mapRes!38169 () Bool)

(assert (=> mapNonEmpty!38163 (= tp!73317 (and e!583641 mapRes!38169))))

(declare-fun mapIsEmpty!38169 () Bool)

(assert (=> mapIsEmpty!38169 mapRes!38169))

(declare-fun mapNonEmpty!38169 () Bool)

(declare-fun tp!73327 () Bool)

(assert (=> mapNonEmpty!38169 (= mapRes!38169 (and tp!73327 e!583640))))

(declare-fun mapKey!38169 () (_ BitVec 32))

(declare-fun mapValue!38169 () ValueCell!11529)

(declare-fun mapRest!38169 () (Array (_ BitVec 32) ValueCell!11529))

(assert (=> mapNonEmpty!38169 (= mapRest!38163 (store mapRest!38169 mapKey!38169 mapValue!38169))))

(declare-fun b!1032811 () Bool)

(assert (=> b!1032811 (= e!583641 tp_is_empty!24465)))

(assert (= (and mapNonEmpty!38163 condMapEmpty!38169) mapIsEmpty!38169))

(assert (= (and mapNonEmpty!38163 (not condMapEmpty!38169)) mapNonEmpty!38169))

(assert (= (and mapNonEmpty!38169 ((_ is ValueCellFull!11529) mapValue!38169)) b!1032810))

(assert (= (and mapNonEmpty!38163 ((_ is ValueCellFull!11529) mapDefault!38169)) b!1032811))

(declare-fun m!952901 () Bool)

(assert (=> mapNonEmpty!38169 m!952901))

(check-sat (not mapNonEmpty!38169) (not b!1032802) b_and!33213 (not d!123727) (not b!1032801) (not b_next!20745) tp_is_empty!24465 (not b!1032803))
(check-sat b_and!33213 (not b_next!20745))
