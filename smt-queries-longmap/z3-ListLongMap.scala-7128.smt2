; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90460 () Bool)

(assert start!90460)

(declare-fun b!1035079 () Bool)

(declare-fun b_free!20823 () Bool)

(declare-fun b_next!20823 () Bool)

(assert (=> b!1035079 (= b_free!20823 (not b_next!20823))))

(declare-fun tp!73586 () Bool)

(declare-fun b_and!33323 () Bool)

(assert (=> b!1035079 (= tp!73586 b_and!33323)))

(declare-fun b!1035075 () Bool)

(declare-fun e!585209 () Bool)

(declare-fun tp_is_empty!24543 () Bool)

(assert (=> b!1035075 (= e!585209 tp_is_empty!24543)))

(declare-fun mapIsEmpty!38314 () Bool)

(declare-fun mapRes!38314 () Bool)

(assert (=> mapIsEmpty!38314 mapRes!38314))

(declare-fun b!1035076 () Bool)

(declare-fun res!691189 () Bool)

(declare-fun e!585207 () Bool)

(assert (=> b!1035076 (=> (not res!691189) (not e!585207))))

(declare-datatypes ((V!37597 0))(
  ( (V!37598 (val!12322 Int)) )
))
(declare-datatypes ((ValueCell!11568 0))(
  ( (ValueCellFull!11568 (v!14902 V!37597)) (EmptyCell!11568) )
))
(declare-datatypes ((array!65174 0))(
  ( (array!65175 (arr!31377 (Array (_ BitVec 32) (_ BitVec 64))) (size!31903 (_ BitVec 32))) )
))
(declare-datatypes ((array!65176 0))(
  ( (array!65177 (arr!31378 (Array (_ BitVec 32) ValueCell!11568)) (size!31904 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5730 0))(
  ( (LongMapFixedSize!5731 (defaultEntry!6243 Int) (mask!30117 (_ BitVec 32)) (extraKeys!5973 (_ BitVec 32)) (zeroValue!6077 V!37597) (minValue!6079 V!37597) (_size!2920 (_ BitVec 32)) (_keys!11428 array!65174) (_values!6266 array!65176) (_vacant!2920 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5730)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035076 (= res!691189 (validMask!0 (mask!30117 thiss!1427)))))

(declare-fun b!1035077 () Bool)

(declare-fun res!691188 () Bool)

(assert (=> b!1035077 (=> (not res!691188) (not e!585207))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035077 (= res!691188 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035078 () Bool)

(declare-fun e!585206 () Bool)

(assert (=> b!1035078 (= e!585206 tp_is_empty!24543)))

(declare-fun res!691190 () Bool)

(assert (=> start!90460 (=> (not res!691190) (not e!585207))))

(declare-fun valid!2164 (LongMapFixedSize!5730) Bool)

(assert (=> start!90460 (= res!691190 (valid!2164 thiss!1427))))

(assert (=> start!90460 e!585207))

(declare-fun e!585208 () Bool)

(assert (=> start!90460 e!585208))

(assert (=> start!90460 true))

(declare-fun e!585205 () Bool)

(declare-fun array_inv!24271 (array!65174) Bool)

(declare-fun array_inv!24272 (array!65176) Bool)

(assert (=> b!1035079 (= e!585208 (and tp!73586 tp_is_empty!24543 (array_inv!24271 (_keys!11428 thiss!1427)) (array_inv!24272 (_values!6266 thiss!1427)) e!585205))))

(declare-fun mapNonEmpty!38314 () Bool)

(declare-fun tp!73585 () Bool)

(assert (=> mapNonEmpty!38314 (= mapRes!38314 (and tp!73585 e!585209))))

(declare-fun mapKey!38314 () (_ BitVec 32))

(declare-fun mapRest!38314 () (Array (_ BitVec 32) ValueCell!11568))

(declare-fun mapValue!38314 () ValueCell!11568)

(assert (=> mapNonEmpty!38314 (= (arr!31378 (_values!6266 thiss!1427)) (store mapRest!38314 mapKey!38314 mapValue!38314))))

(declare-fun b!1035080 () Bool)

(assert (=> b!1035080 (= e!585207 (and (= (size!31904 (_values!6266 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30117 thiss!1427))) (= (size!31903 (_keys!11428 thiss!1427)) (size!31904 (_values!6266 thiss!1427))) (bvslt (mask!30117 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1035081 () Bool)

(assert (=> b!1035081 (= e!585205 (and e!585206 mapRes!38314))))

(declare-fun condMapEmpty!38314 () Bool)

(declare-fun mapDefault!38314 () ValueCell!11568)

(assert (=> b!1035081 (= condMapEmpty!38314 (= (arr!31378 (_values!6266 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11568)) mapDefault!38314)))))

(assert (= (and start!90460 res!691190) b!1035077))

(assert (= (and b!1035077 res!691188) b!1035076))

(assert (= (and b!1035076 res!691189) b!1035080))

(assert (= (and b!1035081 condMapEmpty!38314) mapIsEmpty!38314))

(assert (= (and b!1035081 (not condMapEmpty!38314)) mapNonEmpty!38314))

(get-info :version)

(assert (= (and mapNonEmpty!38314 ((_ is ValueCellFull!11568) mapValue!38314)) b!1035075))

(assert (= (and b!1035081 ((_ is ValueCellFull!11568) mapDefault!38314)) b!1035078))

(assert (= b!1035079 b!1035081))

(assert (= start!90460 b!1035079))

(declare-fun m!955209 () Bool)

(assert (=> b!1035076 m!955209))

(declare-fun m!955211 () Bool)

(assert (=> start!90460 m!955211))

(declare-fun m!955213 () Bool)

(assert (=> b!1035079 m!955213))

(declare-fun m!955215 () Bool)

(assert (=> b!1035079 m!955215))

(declare-fun m!955217 () Bool)

(assert (=> mapNonEmpty!38314 m!955217))

(check-sat (not mapNonEmpty!38314) (not b!1035076) (not b_next!20823) (not start!90460) tp_is_empty!24543 b_and!33323 (not b!1035079))
(check-sat b_and!33323 (not b_next!20823))
(get-model)

(declare-fun d!124479 () Bool)

(declare-fun res!691206 () Bool)

(declare-fun e!585231 () Bool)

(assert (=> d!124479 (=> (not res!691206) (not e!585231))))

(declare-fun simpleValid!409 (LongMapFixedSize!5730) Bool)

(assert (=> d!124479 (= res!691206 (simpleValid!409 thiss!1427))))

(assert (=> d!124479 (= (valid!2164 thiss!1427) e!585231)))

(declare-fun b!1035109 () Bool)

(declare-fun res!691207 () Bool)

(assert (=> b!1035109 (=> (not res!691207) (not e!585231))))

(declare-fun arrayCountValidKeys!0 (array!65174 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1035109 (= res!691207 (= (arrayCountValidKeys!0 (_keys!11428 thiss!1427) #b00000000000000000000000000000000 (size!31903 (_keys!11428 thiss!1427))) (_size!2920 thiss!1427)))))

(declare-fun b!1035110 () Bool)

(declare-fun res!691208 () Bool)

(assert (=> b!1035110 (=> (not res!691208) (not e!585231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65174 (_ BitVec 32)) Bool)

(assert (=> b!1035110 (= res!691208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11428 thiss!1427) (mask!30117 thiss!1427)))))

(declare-fun b!1035111 () Bool)

(declare-datatypes ((List!21911 0))(
  ( (Nil!21908) (Cons!21907 (h!23109 (_ BitVec 64)) (t!31114 List!21911)) )
))
(declare-fun arrayNoDuplicates!0 (array!65174 (_ BitVec 32) List!21911) Bool)

(assert (=> b!1035111 (= e!585231 (arrayNoDuplicates!0 (_keys!11428 thiss!1427) #b00000000000000000000000000000000 Nil!21908))))

(assert (= (and d!124479 res!691206) b!1035109))

(assert (= (and b!1035109 res!691207) b!1035110))

(assert (= (and b!1035110 res!691208) b!1035111))

(declare-fun m!955229 () Bool)

(assert (=> d!124479 m!955229))

(declare-fun m!955231 () Bool)

(assert (=> b!1035109 m!955231))

(declare-fun m!955233 () Bool)

(assert (=> b!1035110 m!955233))

(declare-fun m!955235 () Bool)

(assert (=> b!1035111 m!955235))

(assert (=> start!90460 d!124479))

(declare-fun d!124481 () Bool)

(assert (=> d!124481 (= (validMask!0 (mask!30117 thiss!1427)) (and (or (= (mask!30117 thiss!1427) #b00000000000000000000000000000111) (= (mask!30117 thiss!1427) #b00000000000000000000000000001111) (= (mask!30117 thiss!1427) #b00000000000000000000000000011111) (= (mask!30117 thiss!1427) #b00000000000000000000000000111111) (= (mask!30117 thiss!1427) #b00000000000000000000000001111111) (= (mask!30117 thiss!1427) #b00000000000000000000000011111111) (= (mask!30117 thiss!1427) #b00000000000000000000000111111111) (= (mask!30117 thiss!1427) #b00000000000000000000001111111111) (= (mask!30117 thiss!1427) #b00000000000000000000011111111111) (= (mask!30117 thiss!1427) #b00000000000000000000111111111111) (= (mask!30117 thiss!1427) #b00000000000000000001111111111111) (= (mask!30117 thiss!1427) #b00000000000000000011111111111111) (= (mask!30117 thiss!1427) #b00000000000000000111111111111111) (= (mask!30117 thiss!1427) #b00000000000000001111111111111111) (= (mask!30117 thiss!1427) #b00000000000000011111111111111111) (= (mask!30117 thiss!1427) #b00000000000000111111111111111111) (= (mask!30117 thiss!1427) #b00000000000001111111111111111111) (= (mask!30117 thiss!1427) #b00000000000011111111111111111111) (= (mask!30117 thiss!1427) #b00000000000111111111111111111111) (= (mask!30117 thiss!1427) #b00000000001111111111111111111111) (= (mask!30117 thiss!1427) #b00000000011111111111111111111111) (= (mask!30117 thiss!1427) #b00000000111111111111111111111111) (= (mask!30117 thiss!1427) #b00000001111111111111111111111111) (= (mask!30117 thiss!1427) #b00000011111111111111111111111111) (= (mask!30117 thiss!1427) #b00000111111111111111111111111111) (= (mask!30117 thiss!1427) #b00001111111111111111111111111111) (= (mask!30117 thiss!1427) #b00011111111111111111111111111111) (= (mask!30117 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30117 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1035076 d!124481))

(declare-fun d!124483 () Bool)

(assert (=> d!124483 (= (array_inv!24271 (_keys!11428 thiss!1427)) (bvsge (size!31903 (_keys!11428 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035079 d!124483))

(declare-fun d!124485 () Bool)

(assert (=> d!124485 (= (array_inv!24272 (_values!6266 thiss!1427)) (bvsge (size!31904 (_values!6266 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035079 d!124485))

(declare-fun b!1035118 () Bool)

(declare-fun e!585236 () Bool)

(assert (=> b!1035118 (= e!585236 tp_is_empty!24543)))

(declare-fun mapNonEmpty!38320 () Bool)

(declare-fun mapRes!38320 () Bool)

(declare-fun tp!73595 () Bool)

(assert (=> mapNonEmpty!38320 (= mapRes!38320 (and tp!73595 e!585236))))

(declare-fun mapRest!38320 () (Array (_ BitVec 32) ValueCell!11568))

(declare-fun mapValue!38320 () ValueCell!11568)

(declare-fun mapKey!38320 () (_ BitVec 32))

(assert (=> mapNonEmpty!38320 (= mapRest!38314 (store mapRest!38320 mapKey!38320 mapValue!38320))))

(declare-fun b!1035119 () Bool)

(declare-fun e!585237 () Bool)

(assert (=> b!1035119 (= e!585237 tp_is_empty!24543)))

(declare-fun mapIsEmpty!38320 () Bool)

(assert (=> mapIsEmpty!38320 mapRes!38320))

(declare-fun condMapEmpty!38320 () Bool)

(declare-fun mapDefault!38320 () ValueCell!11568)

(assert (=> mapNonEmpty!38314 (= condMapEmpty!38320 (= mapRest!38314 ((as const (Array (_ BitVec 32) ValueCell!11568)) mapDefault!38320)))))

(assert (=> mapNonEmpty!38314 (= tp!73585 (and e!585237 mapRes!38320))))

(assert (= (and mapNonEmpty!38314 condMapEmpty!38320) mapIsEmpty!38320))

(assert (= (and mapNonEmpty!38314 (not condMapEmpty!38320)) mapNonEmpty!38320))

(assert (= (and mapNonEmpty!38320 ((_ is ValueCellFull!11568) mapValue!38320)) b!1035118))

(assert (= (and mapNonEmpty!38314 ((_ is ValueCellFull!11568) mapDefault!38320)) b!1035119))

(declare-fun m!955237 () Bool)

(assert (=> mapNonEmpty!38320 m!955237))

(check-sat b_and!33323 (not b_next!20823) (not b!1035111) (not d!124479) (not b!1035109) tp_is_empty!24543 (not b!1035110) (not mapNonEmpty!38320))
(check-sat b_and!33323 (not b_next!20823))
