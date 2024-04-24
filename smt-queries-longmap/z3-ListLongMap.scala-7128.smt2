; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90692 () Bool)

(assert start!90692)

(declare-fun b!1036372 () Bool)

(declare-fun b_free!20821 () Bool)

(declare-fun b_next!20821 () Bool)

(assert (=> b!1036372 (= b_free!20821 (not b_next!20821))))

(declare-fun tp!73579 () Bool)

(declare-fun b_and!33331 () Bool)

(assert (=> b!1036372 (= tp!73579 b_and!33331)))

(declare-fun mapIsEmpty!38311 () Bool)

(declare-fun mapRes!38311 () Bool)

(assert (=> mapIsEmpty!38311 mapRes!38311))

(declare-fun b!1036369 () Bool)

(declare-fun e!586032 () Bool)

(declare-fun tp_is_empty!24541 () Bool)

(assert (=> b!1036369 (= e!586032 tp_is_empty!24541)))

(declare-fun b!1036370 () Bool)

(declare-fun res!691690 () Bool)

(declare-fun e!586034 () Bool)

(assert (=> b!1036370 (=> (not res!691690) (not e!586034))))

(declare-datatypes ((V!37595 0))(
  ( (V!37596 (val!12321 Int)) )
))
(declare-datatypes ((ValueCell!11567 0))(
  ( (ValueCellFull!11567 (v!14897 V!37595)) (EmptyCell!11567) )
))
(declare-datatypes ((array!65219 0))(
  ( (array!65220 (arr!31393 (Array (_ BitVec 32) (_ BitVec 64))) (size!31920 (_ BitVec 32))) )
))
(declare-datatypes ((array!65221 0))(
  ( (array!65222 (arr!31394 (Array (_ BitVec 32) ValueCell!11567)) (size!31921 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5728 0))(
  ( (LongMapFixedSize!5729 (defaultEntry!6242 Int) (mask!30176 (_ BitVec 32)) (extraKeys!5972 (_ BitVec 32)) (zeroValue!6076 V!37595) (minValue!6078 V!37595) (_size!2919 (_ BitVec 32)) (_keys!11465 array!65219) (_values!6265 array!65221) (_vacant!2919 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5728)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1036370 (= res!691690 (validMask!0 (mask!30176 thiss!1427)))))

(declare-fun b!1036371 () Bool)

(declare-fun res!691691 () Bool)

(assert (=> b!1036371 (=> (not res!691691) (not e!586034))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1036371 (= res!691691 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!586030 () Bool)

(declare-fun e!586035 () Bool)

(declare-fun array_inv!24299 (array!65219) Bool)

(declare-fun array_inv!24300 (array!65221) Bool)

(assert (=> b!1036372 (= e!586035 (and tp!73579 tp_is_empty!24541 (array_inv!24299 (_keys!11465 thiss!1427)) (array_inv!24300 (_values!6265 thiss!1427)) e!586030))))

(declare-fun res!691689 () Bool)

(assert (=> start!90692 (=> (not res!691689) (not e!586034))))

(declare-fun valid!2171 (LongMapFixedSize!5728) Bool)

(assert (=> start!90692 (= res!691689 (valid!2171 thiss!1427))))

(assert (=> start!90692 e!586034))

(assert (=> start!90692 e!586035))

(assert (=> start!90692 true))

(declare-fun b!1036373 () Bool)

(declare-fun e!586033 () Bool)

(assert (=> b!1036373 (= e!586030 (and e!586033 mapRes!38311))))

(declare-fun condMapEmpty!38311 () Bool)

(declare-fun mapDefault!38311 () ValueCell!11567)

(assert (=> b!1036373 (= condMapEmpty!38311 (= (arr!31394 (_values!6265 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11567)) mapDefault!38311)))))

(declare-fun b!1036374 () Bool)

(assert (=> b!1036374 (= e!586034 (and (= (size!31921 (_values!6265 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30176 thiss!1427))) (= (size!31920 (_keys!11465 thiss!1427)) (size!31921 (_values!6265 thiss!1427))) (bvslt (mask!30176 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!38311 () Bool)

(declare-fun tp!73580 () Bool)

(assert (=> mapNonEmpty!38311 (= mapRes!38311 (and tp!73580 e!586032))))

(declare-fun mapValue!38311 () ValueCell!11567)

(declare-fun mapRest!38311 () (Array (_ BitVec 32) ValueCell!11567))

(declare-fun mapKey!38311 () (_ BitVec 32))

(assert (=> mapNonEmpty!38311 (= (arr!31394 (_values!6265 thiss!1427)) (store mapRest!38311 mapKey!38311 mapValue!38311))))

(declare-fun b!1036375 () Bool)

(assert (=> b!1036375 (= e!586033 tp_is_empty!24541)))

(assert (= (and start!90692 res!691689) b!1036371))

(assert (= (and b!1036371 res!691691) b!1036370))

(assert (= (and b!1036370 res!691690) b!1036374))

(assert (= (and b!1036373 condMapEmpty!38311) mapIsEmpty!38311))

(assert (= (and b!1036373 (not condMapEmpty!38311)) mapNonEmpty!38311))

(get-info :version)

(assert (= (and mapNonEmpty!38311 ((_ is ValueCellFull!11567) mapValue!38311)) b!1036369))

(assert (= (and b!1036373 ((_ is ValueCellFull!11567) mapDefault!38311)) b!1036375))

(assert (= b!1036372 b!1036373))

(assert (= start!90692 b!1036372))

(declare-fun m!956863 () Bool)

(assert (=> b!1036370 m!956863))

(declare-fun m!956865 () Bool)

(assert (=> b!1036372 m!956865))

(declare-fun m!956867 () Bool)

(assert (=> b!1036372 m!956867))

(declare-fun m!956869 () Bool)

(assert (=> start!90692 m!956869))

(declare-fun m!956871 () Bool)

(assert (=> mapNonEmpty!38311 m!956871))

(check-sat tp_is_empty!24541 (not mapNonEmpty!38311) (not b!1036370) (not b_next!20821) b_and!33331 (not start!90692) (not b!1036372))
(check-sat b_and!33331 (not b_next!20821))
(get-model)

(declare-fun d!124941 () Bool)

(assert (=> d!124941 (= (array_inv!24299 (_keys!11465 thiss!1427)) (bvsge (size!31920 (_keys!11465 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1036372 d!124941))

(declare-fun d!124943 () Bool)

(assert (=> d!124943 (= (array_inv!24300 (_values!6265 thiss!1427)) (bvsge (size!31921 (_values!6265 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1036372 d!124943))

(declare-fun d!124945 () Bool)

(declare-fun res!691716 () Bool)

(declare-fun e!586074 () Bool)

(assert (=> d!124945 (=> (not res!691716) (not e!586074))))

(declare-fun simpleValid!409 (LongMapFixedSize!5728) Bool)

(assert (=> d!124945 (= res!691716 (simpleValid!409 thiss!1427))))

(assert (=> d!124945 (= (valid!2171 thiss!1427) e!586074)))

(declare-fun b!1036424 () Bool)

(declare-fun res!691717 () Bool)

(assert (=> b!1036424 (=> (not res!691717) (not e!586074))))

(declare-fun arrayCountValidKeys!0 (array!65219 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1036424 (= res!691717 (= (arrayCountValidKeys!0 (_keys!11465 thiss!1427) #b00000000000000000000000000000000 (size!31920 (_keys!11465 thiss!1427))) (_size!2919 thiss!1427)))))

(declare-fun b!1036425 () Bool)

(declare-fun res!691718 () Bool)

(assert (=> b!1036425 (=> (not res!691718) (not e!586074))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65219 (_ BitVec 32)) Bool)

(assert (=> b!1036425 (= res!691718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11465 thiss!1427) (mask!30176 thiss!1427)))))

(declare-fun b!1036426 () Bool)

(declare-datatypes ((List!21897 0))(
  ( (Nil!21894) (Cons!21893 (h!23104 (_ BitVec 64)) (t!31092 List!21897)) )
))
(declare-fun arrayNoDuplicates!0 (array!65219 (_ BitVec 32) List!21897) Bool)

(assert (=> b!1036426 (= e!586074 (arrayNoDuplicates!0 (_keys!11465 thiss!1427) #b00000000000000000000000000000000 Nil!21894))))

(assert (= (and d!124945 res!691716) b!1036424))

(assert (= (and b!1036424 res!691717) b!1036425))

(assert (= (and b!1036425 res!691718) b!1036426))

(declare-fun m!956893 () Bool)

(assert (=> d!124945 m!956893))

(declare-fun m!956895 () Bool)

(assert (=> b!1036424 m!956895))

(declare-fun m!956897 () Bool)

(assert (=> b!1036425 m!956897))

(declare-fun m!956899 () Bool)

(assert (=> b!1036426 m!956899))

(assert (=> start!90692 d!124945))

(declare-fun d!124947 () Bool)

(assert (=> d!124947 (= (validMask!0 (mask!30176 thiss!1427)) (and (or (= (mask!30176 thiss!1427) #b00000000000000000000000000000111) (= (mask!30176 thiss!1427) #b00000000000000000000000000001111) (= (mask!30176 thiss!1427) #b00000000000000000000000000011111) (= (mask!30176 thiss!1427) #b00000000000000000000000000111111) (= (mask!30176 thiss!1427) #b00000000000000000000000001111111) (= (mask!30176 thiss!1427) #b00000000000000000000000011111111) (= (mask!30176 thiss!1427) #b00000000000000000000000111111111) (= (mask!30176 thiss!1427) #b00000000000000000000001111111111) (= (mask!30176 thiss!1427) #b00000000000000000000011111111111) (= (mask!30176 thiss!1427) #b00000000000000000000111111111111) (= (mask!30176 thiss!1427) #b00000000000000000001111111111111) (= (mask!30176 thiss!1427) #b00000000000000000011111111111111) (= (mask!30176 thiss!1427) #b00000000000000000111111111111111) (= (mask!30176 thiss!1427) #b00000000000000001111111111111111) (= (mask!30176 thiss!1427) #b00000000000000011111111111111111) (= (mask!30176 thiss!1427) #b00000000000000111111111111111111) (= (mask!30176 thiss!1427) #b00000000000001111111111111111111) (= (mask!30176 thiss!1427) #b00000000000011111111111111111111) (= (mask!30176 thiss!1427) #b00000000000111111111111111111111) (= (mask!30176 thiss!1427) #b00000000001111111111111111111111) (= (mask!30176 thiss!1427) #b00000000011111111111111111111111) (= (mask!30176 thiss!1427) #b00000000111111111111111111111111) (= (mask!30176 thiss!1427) #b00000001111111111111111111111111) (= (mask!30176 thiss!1427) #b00000011111111111111111111111111) (= (mask!30176 thiss!1427) #b00000111111111111111111111111111) (= (mask!30176 thiss!1427) #b00001111111111111111111111111111) (= (mask!30176 thiss!1427) #b00011111111111111111111111111111) (= (mask!30176 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30176 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1036370 d!124947))

(declare-fun b!1036433 () Bool)

(declare-fun e!586079 () Bool)

(assert (=> b!1036433 (= e!586079 tp_is_empty!24541)))

(declare-fun mapNonEmpty!38320 () Bool)

(declare-fun mapRes!38320 () Bool)

(declare-fun tp!73595 () Bool)

(assert (=> mapNonEmpty!38320 (= mapRes!38320 (and tp!73595 e!586079))))

(declare-fun mapValue!38320 () ValueCell!11567)

(declare-fun mapRest!38320 () (Array (_ BitVec 32) ValueCell!11567))

(declare-fun mapKey!38320 () (_ BitVec 32))

(assert (=> mapNonEmpty!38320 (= mapRest!38311 (store mapRest!38320 mapKey!38320 mapValue!38320))))

(declare-fun mapIsEmpty!38320 () Bool)

(assert (=> mapIsEmpty!38320 mapRes!38320))

(declare-fun condMapEmpty!38320 () Bool)

(declare-fun mapDefault!38320 () ValueCell!11567)

(assert (=> mapNonEmpty!38311 (= condMapEmpty!38320 (= mapRest!38311 ((as const (Array (_ BitVec 32) ValueCell!11567)) mapDefault!38320)))))

(declare-fun e!586080 () Bool)

(assert (=> mapNonEmpty!38311 (= tp!73580 (and e!586080 mapRes!38320))))

(declare-fun b!1036434 () Bool)

(assert (=> b!1036434 (= e!586080 tp_is_empty!24541)))

(assert (= (and mapNonEmpty!38311 condMapEmpty!38320) mapIsEmpty!38320))

(assert (= (and mapNonEmpty!38311 (not condMapEmpty!38320)) mapNonEmpty!38320))

(assert (= (and mapNonEmpty!38320 ((_ is ValueCellFull!11567) mapValue!38320)) b!1036433))

(assert (= (and mapNonEmpty!38311 ((_ is ValueCellFull!11567) mapDefault!38320)) b!1036434))

(declare-fun m!956901 () Bool)

(assert (=> mapNonEmpty!38320 m!956901))

(check-sat tp_is_empty!24541 (not d!124945) (not b_next!20821) (not b!1036426) (not b!1036425) (not b!1036424) b_and!33331 (not mapNonEmpty!38320))
(check-sat b_and!33331 (not b_next!20821))
