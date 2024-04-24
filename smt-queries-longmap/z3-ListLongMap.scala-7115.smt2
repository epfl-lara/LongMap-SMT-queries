; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90418 () Bool)

(assert start!90418)

(declare-fun b!1034064 () Bool)

(declare-fun b_free!20743 () Bool)

(declare-fun b_next!20743 () Bool)

(assert (=> b!1034064 (= b_free!20743 (not b_next!20743))))

(declare-fun tp!73311 () Bool)

(declare-fun b_and!33221 () Bool)

(assert (=> b!1034064 (= tp!73311 b_and!33221)))

(declare-fun b!1034061 () Bool)

(declare-fun e!584434 () Bool)

(declare-fun tp_is_empty!24463 () Bool)

(assert (=> b!1034061 (= e!584434 tp_is_empty!24463)))

(declare-fun b!1034062 () Bool)

(declare-fun e!584439 () Bool)

(assert (=> b!1034062 (= e!584439 tp_is_empty!24463)))

(declare-fun b!1034063 () Bool)

(declare-fun res!690697 () Bool)

(declare-fun e!584435 () Bool)

(assert (=> b!1034063 (=> (not res!690697) (not e!584435))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1034063 (= res!690697 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!584437 () Bool)

(declare-fun e!584436 () Bool)

(declare-datatypes ((V!37491 0))(
  ( (V!37492 (val!12282 Int)) )
))
(declare-datatypes ((ValueCell!11528 0))(
  ( (ValueCellFull!11528 (v!14855 V!37491)) (EmptyCell!11528) )
))
(declare-datatypes ((array!65045 0))(
  ( (array!65046 (arr!31315 (Array (_ BitVec 32) (_ BitVec 64))) (size!31836 (_ BitVec 32))) )
))
(declare-datatypes ((array!65047 0))(
  ( (array!65048 (arr!31316 (Array (_ BitVec 32) ValueCell!11528)) (size!31837 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5650 0))(
  ( (LongMapFixedSize!5651 (defaultEntry!6199 Int) (mask!30089 (_ BitVec 32)) (extraKeys!5931 (_ BitVec 32)) (zeroValue!6035 V!37491) (minValue!6035 V!37491) (_size!2880 (_ BitVec 32)) (_keys!11413 array!65045) (_values!6222 array!65047) (_vacant!2880 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5650)

(declare-fun array_inv!24243 (array!65045) Bool)

(declare-fun array_inv!24244 (array!65047) Bool)

(assert (=> b!1034064 (= e!584437 (and tp!73311 tp_is_empty!24463 (array_inv!24243 (_keys!11413 thiss!1427)) (array_inv!24244 (_values!6222 thiss!1427)) e!584436))))

(declare-fun b!1034065 () Bool)

(declare-fun res!690698 () Bool)

(assert (=> b!1034065 (=> (not res!690698) (not e!584435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1034065 (= res!690698 (validMask!0 (mask!30089 thiss!1427)))))

(declare-fun res!690696 () Bool)

(assert (=> start!90418 (=> (not res!690696) (not e!584435))))

(declare-fun valid!2144 (LongMapFixedSize!5650) Bool)

(assert (=> start!90418 (= res!690696 (valid!2144 thiss!1427))))

(assert (=> start!90418 e!584435))

(assert (=> start!90418 e!584437))

(assert (=> start!90418 true))

(declare-fun mapNonEmpty!38160 () Bool)

(declare-fun mapRes!38160 () Bool)

(declare-fun tp!73312 () Bool)

(assert (=> mapNonEmpty!38160 (= mapRes!38160 (and tp!73312 e!584439))))

(declare-fun mapValue!38160 () ValueCell!11528)

(declare-fun mapKey!38160 () (_ BitVec 32))

(declare-fun mapRest!38160 () (Array (_ BitVec 32) ValueCell!11528))

(assert (=> mapNonEmpty!38160 (= (arr!31316 (_values!6222 thiss!1427)) (store mapRest!38160 mapKey!38160 mapValue!38160))))

(declare-fun mapIsEmpty!38160 () Bool)

(assert (=> mapIsEmpty!38160 mapRes!38160))

(declare-fun b!1034066 () Bool)

(assert (=> b!1034066 (= e!584436 (and e!584434 mapRes!38160))))

(declare-fun condMapEmpty!38160 () Bool)

(declare-fun mapDefault!38160 () ValueCell!11528)

(assert (=> b!1034066 (= condMapEmpty!38160 (= (arr!31316 (_values!6222 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11528)) mapDefault!38160)))))

(declare-fun b!1034067 () Bool)

(assert (=> b!1034067 (= e!584435 (and (= (size!31837 (_values!6222 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30089 thiss!1427))) (= (size!31836 (_keys!11413 thiss!1427)) (size!31837 (_values!6222 thiss!1427))) (bvslt (mask!30089 thiss!1427) #b00000000000000000000000000000000)))))

(assert (= (and start!90418 res!690696) b!1034063))

(assert (= (and b!1034063 res!690697) b!1034065))

(assert (= (and b!1034065 res!690698) b!1034067))

(assert (= (and b!1034066 condMapEmpty!38160) mapIsEmpty!38160))

(assert (= (and b!1034066 (not condMapEmpty!38160)) mapNonEmpty!38160))

(get-info :version)

(assert (= (and mapNonEmpty!38160 ((_ is ValueCellFull!11528) mapValue!38160)) b!1034062))

(assert (= (and b!1034066 ((_ is ValueCellFull!11528) mapDefault!38160)) b!1034061))

(assert (= b!1034064 b!1034066))

(assert (= start!90418 b!1034064))

(declare-fun m!954527 () Bool)

(assert (=> b!1034064 m!954527))

(declare-fun m!954529 () Bool)

(assert (=> b!1034064 m!954529))

(declare-fun m!954531 () Bool)

(assert (=> b!1034065 m!954531))

(declare-fun m!954533 () Bool)

(assert (=> start!90418 m!954533))

(declare-fun m!954535 () Bool)

(assert (=> mapNonEmpty!38160 m!954535))

(check-sat (not start!90418) b_and!33221 (not b!1034065) (not mapNonEmpty!38160) tp_is_empty!24463 (not b!1034064) (not b_next!20743))
(check-sat b_and!33221 (not b_next!20743))
(get-model)

(declare-fun d!124187 () Bool)

(assert (=> d!124187 (= (validMask!0 (mask!30089 thiss!1427)) (and (or (= (mask!30089 thiss!1427) #b00000000000000000000000000000111) (= (mask!30089 thiss!1427) #b00000000000000000000000000001111) (= (mask!30089 thiss!1427) #b00000000000000000000000000011111) (= (mask!30089 thiss!1427) #b00000000000000000000000000111111) (= (mask!30089 thiss!1427) #b00000000000000000000000001111111) (= (mask!30089 thiss!1427) #b00000000000000000000000011111111) (= (mask!30089 thiss!1427) #b00000000000000000000000111111111) (= (mask!30089 thiss!1427) #b00000000000000000000001111111111) (= (mask!30089 thiss!1427) #b00000000000000000000011111111111) (= (mask!30089 thiss!1427) #b00000000000000000000111111111111) (= (mask!30089 thiss!1427) #b00000000000000000001111111111111) (= (mask!30089 thiss!1427) #b00000000000000000011111111111111) (= (mask!30089 thiss!1427) #b00000000000000000111111111111111) (= (mask!30089 thiss!1427) #b00000000000000001111111111111111) (= (mask!30089 thiss!1427) #b00000000000000011111111111111111) (= (mask!30089 thiss!1427) #b00000000000000111111111111111111) (= (mask!30089 thiss!1427) #b00000000000001111111111111111111) (= (mask!30089 thiss!1427) #b00000000000011111111111111111111) (= (mask!30089 thiss!1427) #b00000000000111111111111111111111) (= (mask!30089 thiss!1427) #b00000000001111111111111111111111) (= (mask!30089 thiss!1427) #b00000000011111111111111111111111) (= (mask!30089 thiss!1427) #b00000000111111111111111111111111) (= (mask!30089 thiss!1427) #b00000001111111111111111111111111) (= (mask!30089 thiss!1427) #b00000011111111111111111111111111) (= (mask!30089 thiss!1427) #b00000111111111111111111111111111) (= (mask!30089 thiss!1427) #b00001111111111111111111111111111) (= (mask!30089 thiss!1427) #b00011111111111111111111111111111) (= (mask!30089 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30089 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1034065 d!124187))

(declare-fun d!124189 () Bool)

(assert (=> d!124189 (= (array_inv!24243 (_keys!11413 thiss!1427)) (bvsge (size!31836 (_keys!11413 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034064 d!124189))

(declare-fun d!124191 () Bool)

(assert (=> d!124191 (= (array_inv!24244 (_values!6222 thiss!1427)) (bvsge (size!31837 (_values!6222 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034064 d!124191))

(declare-fun d!124193 () Bool)

(declare-fun res!690723 () Bool)

(declare-fun e!584478 () Bool)

(assert (=> d!124193 (=> (not res!690723) (not e!584478))))

(declare-fun simpleValid!400 (LongMapFixedSize!5650) Bool)

(assert (=> d!124193 (= res!690723 (simpleValid!400 thiss!1427))))

(assert (=> d!124193 (= (valid!2144 thiss!1427) e!584478)))

(declare-fun b!1034116 () Bool)

(declare-fun res!690724 () Bool)

(assert (=> b!1034116 (=> (not res!690724) (not e!584478))))

(declare-fun arrayCountValidKeys!0 (array!65045 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1034116 (= res!690724 (= (arrayCountValidKeys!0 (_keys!11413 thiss!1427) #b00000000000000000000000000000000 (size!31836 (_keys!11413 thiss!1427))) (_size!2880 thiss!1427)))))

(declare-fun b!1034117 () Bool)

(declare-fun res!690725 () Bool)

(assert (=> b!1034117 (=> (not res!690725) (not e!584478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65045 (_ BitVec 32)) Bool)

(assert (=> b!1034117 (= res!690725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11413 thiss!1427) (mask!30089 thiss!1427)))))

(declare-fun b!1034118 () Bool)

(declare-datatypes ((List!21885 0))(
  ( (Nil!21882) (Cons!21881 (h!23092 (_ BitVec 64)) (t!31071 List!21885)) )
))
(declare-fun arrayNoDuplicates!0 (array!65045 (_ BitVec 32) List!21885) Bool)

(assert (=> b!1034118 (= e!584478 (arrayNoDuplicates!0 (_keys!11413 thiss!1427) #b00000000000000000000000000000000 Nil!21882))))

(assert (= (and d!124193 res!690723) b!1034116))

(assert (= (and b!1034116 res!690724) b!1034117))

(assert (= (and b!1034117 res!690725) b!1034118))

(declare-fun m!954557 () Bool)

(assert (=> d!124193 m!954557))

(declare-fun m!954559 () Bool)

(assert (=> b!1034116 m!954559))

(declare-fun m!954561 () Bool)

(assert (=> b!1034117 m!954561))

(declare-fun m!954563 () Bool)

(assert (=> b!1034118 m!954563))

(assert (=> start!90418 d!124193))

(declare-fun mapNonEmpty!38169 () Bool)

(declare-fun mapRes!38169 () Bool)

(declare-fun tp!73327 () Bool)

(declare-fun e!584484 () Bool)

(assert (=> mapNonEmpty!38169 (= mapRes!38169 (and tp!73327 e!584484))))

(declare-fun mapValue!38169 () ValueCell!11528)

(declare-fun mapRest!38169 () (Array (_ BitVec 32) ValueCell!11528))

(declare-fun mapKey!38169 () (_ BitVec 32))

(assert (=> mapNonEmpty!38169 (= mapRest!38160 (store mapRest!38169 mapKey!38169 mapValue!38169))))

(declare-fun mapIsEmpty!38169 () Bool)

(assert (=> mapIsEmpty!38169 mapRes!38169))

(declare-fun condMapEmpty!38169 () Bool)

(declare-fun mapDefault!38169 () ValueCell!11528)

(assert (=> mapNonEmpty!38160 (= condMapEmpty!38169 (= mapRest!38160 ((as const (Array (_ BitVec 32) ValueCell!11528)) mapDefault!38169)))))

(declare-fun e!584483 () Bool)

(assert (=> mapNonEmpty!38160 (= tp!73312 (and e!584483 mapRes!38169))))

(declare-fun b!1034125 () Bool)

(assert (=> b!1034125 (= e!584484 tp_is_empty!24463)))

(declare-fun b!1034126 () Bool)

(assert (=> b!1034126 (= e!584483 tp_is_empty!24463)))

(assert (= (and mapNonEmpty!38160 condMapEmpty!38169) mapIsEmpty!38169))

(assert (= (and mapNonEmpty!38160 (not condMapEmpty!38169)) mapNonEmpty!38169))

(assert (= (and mapNonEmpty!38169 ((_ is ValueCellFull!11528) mapValue!38169)) b!1034125))

(assert (= (and mapNonEmpty!38160 ((_ is ValueCellFull!11528) mapDefault!38169)) b!1034126))

(declare-fun m!954565 () Bool)

(assert (=> mapNonEmpty!38169 m!954565))

(check-sat (not b!1034116) (not mapNonEmpty!38169) b_and!33221 (not b!1034118) (not d!124193) tp_is_empty!24463 (not b!1034117) (not b_next!20743))
(check-sat b_and!33221 (not b_next!20743))
