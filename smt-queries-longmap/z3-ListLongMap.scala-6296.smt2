; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80492 () Bool)

(assert start!80492)

(declare-fun b!945232 () Bool)

(declare-fun b_free!18097 () Bool)

(declare-fun b_next!18097 () Bool)

(assert (=> b!945232 (= b_free!18097 (not b_next!18097))))

(declare-fun tp!62810 () Bool)

(declare-fun b_and!29493 () Bool)

(assert (=> b!945232 (= tp!62810 b_and!29493)))

(declare-fun b!945227 () Bool)

(declare-fun e!531630 () Bool)

(declare-fun tp_is_empty!20605 () Bool)

(assert (=> b!945227 (= e!531630 tp_is_empty!20605)))

(declare-fun b!945228 () Bool)

(declare-fun e!531634 () Bool)

(declare-datatypes ((SeekEntryResult!9079 0))(
  ( (MissingZero!9079 (index!38687 (_ BitVec 32))) (Found!9079 (index!38688 (_ BitVec 32))) (Intermediate!9079 (undefined!9891 Bool) (index!38689 (_ BitVec 32)) (x!81221 (_ BitVec 32))) (Undefined!9079) (MissingVacant!9079 (index!38690 (_ BitVec 32))) )
))
(declare-fun lt!425791 () SeekEntryResult!9079)

(get-info :version)

(assert (=> b!945228 (= e!531634 (and ((_ is Found!9079) lt!425791) (bvslt (index!38688 lt!425791) #b00000000000000000000000000000000)))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32439 0))(
  ( (V!32440 (val!10353 Int)) )
))
(declare-datatypes ((ValueCell!9821 0))(
  ( (ValueCellFull!9821 (v!12886 V!32439)) (EmptyCell!9821) )
))
(declare-datatypes ((array!57147 0))(
  ( (array!57148 (arr!27497 (Array (_ BitVec 32) ValueCell!9821)) (size!27967 (_ BitVec 32))) )
))
(declare-datatypes ((array!57149 0))(
  ( (array!57150 (arr!27498 (Array (_ BitVec 32) (_ BitVec 64))) (size!27968 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4792 0))(
  ( (LongMapFixedSize!4793 (defaultEntry!5693 Int) (mask!27354 (_ BitVec 32)) (extraKeys!5425 (_ BitVec 32)) (zeroValue!5529 V!32439) (minValue!5529 V!32439) (_size!2451 (_ BitVec 32)) (_keys!10568 array!57149) (_values!5716 array!57147) (_vacant!2451 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4792)

(declare-fun seekEntry!0 ((_ BitVec 64) array!57149 (_ BitVec 32)) SeekEntryResult!9079)

(assert (=> b!945228 (= lt!425791 (seekEntry!0 key!756 (_keys!10568 thiss!1141) (mask!27354 thiss!1141)))))

(declare-fun mapIsEmpty!32741 () Bool)

(declare-fun mapRes!32741 () Bool)

(assert (=> mapIsEmpty!32741 mapRes!32741))

(declare-fun b!945229 () Bool)

(declare-fun e!531629 () Bool)

(assert (=> b!945229 (= e!531629 tp_is_empty!20605)))

(declare-fun b!945230 () Bool)

(declare-fun res!634887 () Bool)

(assert (=> b!945230 (=> (not res!634887) (not e!531634))))

(assert (=> b!945230 (= res!634887 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!634888 () Bool)

(assert (=> start!80492 (=> (not res!634888) (not e!531634))))

(declare-fun valid!1831 (LongMapFixedSize!4792) Bool)

(assert (=> start!80492 (= res!634888 (valid!1831 thiss!1141))))

(assert (=> start!80492 e!531634))

(declare-fun e!531631 () Bool)

(assert (=> start!80492 e!531631))

(assert (=> start!80492 true))

(declare-fun mapNonEmpty!32741 () Bool)

(declare-fun tp!62809 () Bool)

(assert (=> mapNonEmpty!32741 (= mapRes!32741 (and tp!62809 e!531630))))

(declare-fun mapValue!32741 () ValueCell!9821)

(declare-fun mapRest!32741 () (Array (_ BitVec 32) ValueCell!9821))

(declare-fun mapKey!32741 () (_ BitVec 32))

(assert (=> mapNonEmpty!32741 (= (arr!27497 (_values!5716 thiss!1141)) (store mapRest!32741 mapKey!32741 mapValue!32741))))

(declare-fun b!945231 () Bool)

(declare-fun e!531633 () Bool)

(assert (=> b!945231 (= e!531633 (and e!531629 mapRes!32741))))

(declare-fun condMapEmpty!32741 () Bool)

(declare-fun mapDefault!32741 () ValueCell!9821)

(assert (=> b!945231 (= condMapEmpty!32741 (= (arr!27497 (_values!5716 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9821)) mapDefault!32741)))))

(declare-fun array_inv!21412 (array!57149) Bool)

(declare-fun array_inv!21413 (array!57147) Bool)

(assert (=> b!945232 (= e!531631 (and tp!62810 tp_is_empty!20605 (array_inv!21412 (_keys!10568 thiss!1141)) (array_inv!21413 (_values!5716 thiss!1141)) e!531633))))

(assert (= (and start!80492 res!634888) b!945230))

(assert (= (and b!945230 res!634887) b!945228))

(assert (= (and b!945231 condMapEmpty!32741) mapIsEmpty!32741))

(assert (= (and b!945231 (not condMapEmpty!32741)) mapNonEmpty!32741))

(assert (= (and mapNonEmpty!32741 ((_ is ValueCellFull!9821) mapValue!32741)) b!945227))

(assert (= (and b!945231 ((_ is ValueCellFull!9821) mapDefault!32741)) b!945229))

(assert (= b!945232 b!945231))

(assert (= start!80492 b!945232))

(declare-fun m!878509 () Bool)

(assert (=> b!945228 m!878509))

(declare-fun m!878511 () Bool)

(assert (=> start!80492 m!878511))

(declare-fun m!878513 () Bool)

(assert (=> mapNonEmpty!32741 m!878513))

(declare-fun m!878515 () Bool)

(assert (=> b!945232 m!878515))

(declare-fun m!878517 () Bool)

(assert (=> b!945232 m!878517))

(check-sat (not b_next!18097) (not b!945228) tp_is_empty!20605 b_and!29493 (not b!945232) (not start!80492) (not mapNonEmpty!32741))
(check-sat b_and!29493 (not b_next!18097))
(get-model)

(declare-fun d!114207 () Bool)

(declare-fun res!634907 () Bool)

(declare-fun e!531673 () Bool)

(assert (=> d!114207 (=> (not res!634907) (not e!531673))))

(declare-fun simpleValid!351 (LongMapFixedSize!4792) Bool)

(assert (=> d!114207 (= res!634907 (simpleValid!351 thiss!1141))))

(assert (=> d!114207 (= (valid!1831 thiss!1141) e!531673)))

(declare-fun b!945275 () Bool)

(declare-fun res!634908 () Bool)

(assert (=> b!945275 (=> (not res!634908) (not e!531673))))

(declare-fun arrayCountValidKeys!0 (array!57149 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945275 (= res!634908 (= (arrayCountValidKeys!0 (_keys!10568 thiss!1141) #b00000000000000000000000000000000 (size!27968 (_keys!10568 thiss!1141))) (_size!2451 thiss!1141)))))

(declare-fun b!945276 () Bool)

(declare-fun res!634909 () Bool)

(assert (=> b!945276 (=> (not res!634909) (not e!531673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57149 (_ BitVec 32)) Bool)

(assert (=> b!945276 (= res!634909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10568 thiss!1141) (mask!27354 thiss!1141)))))

(declare-fun b!945277 () Bool)

(declare-datatypes ((List!19296 0))(
  ( (Nil!19293) (Cons!19292 (h!20443 (_ BitVec 64)) (t!27608 List!19296)) )
))
(declare-fun arrayNoDuplicates!0 (array!57149 (_ BitVec 32) List!19296) Bool)

(assert (=> b!945277 (= e!531673 (arrayNoDuplicates!0 (_keys!10568 thiss!1141) #b00000000000000000000000000000000 Nil!19293))))

(assert (= (and d!114207 res!634907) b!945275))

(assert (= (and b!945275 res!634908) b!945276))

(assert (= (and b!945276 res!634909) b!945277))

(declare-fun m!878539 () Bool)

(assert (=> d!114207 m!878539))

(declare-fun m!878541 () Bool)

(assert (=> b!945275 m!878541))

(declare-fun m!878543 () Bool)

(assert (=> b!945276 m!878543))

(declare-fun m!878545 () Bool)

(assert (=> b!945277 m!878545))

(assert (=> start!80492 d!114207))

(declare-fun d!114209 () Bool)

(assert (=> d!114209 (= (array_inv!21412 (_keys!10568 thiss!1141)) (bvsge (size!27968 (_keys!10568 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945232 d!114209))

(declare-fun d!114211 () Bool)

(assert (=> d!114211 (= (array_inv!21413 (_values!5716 thiss!1141)) (bvsge (size!27967 (_values!5716 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945232 d!114211))

(declare-fun b!945290 () Bool)

(declare-fun e!531680 () SeekEntryResult!9079)

(declare-fun lt!425809 () SeekEntryResult!9079)

(assert (=> b!945290 (= e!531680 (MissingZero!9079 (index!38689 lt!425809)))))

(declare-fun b!945291 () Bool)

(declare-fun c!98362 () Bool)

(declare-fun lt!425808 () (_ BitVec 64))

(assert (=> b!945291 (= c!98362 (= lt!425808 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!531682 () SeekEntryResult!9079)

(assert (=> b!945291 (= e!531682 e!531680)))

(declare-fun b!945292 () Bool)

(declare-fun lt!425807 () SeekEntryResult!9079)

(assert (=> b!945292 (= e!531680 (ite ((_ is MissingVacant!9079) lt!425807) (MissingZero!9079 (index!38690 lt!425807)) lt!425807))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57149 (_ BitVec 32)) SeekEntryResult!9079)

(assert (=> b!945292 (= lt!425807 (seekKeyOrZeroReturnVacant!0 (x!81221 lt!425809) (index!38689 lt!425809) (index!38689 lt!425809) key!756 (_keys!10568 thiss!1141) (mask!27354 thiss!1141)))))

(declare-fun d!114213 () Bool)

(declare-fun lt!425806 () SeekEntryResult!9079)

(assert (=> d!114213 (and (or ((_ is MissingVacant!9079) lt!425806) (not ((_ is Found!9079) lt!425806)) (and (bvsge (index!38688 lt!425806) #b00000000000000000000000000000000) (bvslt (index!38688 lt!425806) (size!27968 (_keys!10568 thiss!1141))))) (not ((_ is MissingVacant!9079) lt!425806)) (or (not ((_ is Found!9079) lt!425806)) (= (select (arr!27498 (_keys!10568 thiss!1141)) (index!38688 lt!425806)) key!756)))))

(declare-fun e!531681 () SeekEntryResult!9079)

(assert (=> d!114213 (= lt!425806 e!531681)))

(declare-fun c!98363 () Bool)

(assert (=> d!114213 (= c!98363 (and ((_ is Intermediate!9079) lt!425809) (undefined!9891 lt!425809)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57149 (_ BitVec 32)) SeekEntryResult!9079)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114213 (= lt!425809 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27354 thiss!1141)) key!756 (_keys!10568 thiss!1141) (mask!27354 thiss!1141)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!114213 (validMask!0 (mask!27354 thiss!1141))))

(assert (=> d!114213 (= (seekEntry!0 key!756 (_keys!10568 thiss!1141) (mask!27354 thiss!1141)) lt!425806)))

(declare-fun b!945293 () Bool)

(assert (=> b!945293 (= e!531681 Undefined!9079)))

(declare-fun b!945294 () Bool)

(assert (=> b!945294 (= e!531682 (Found!9079 (index!38689 lt!425809)))))

(declare-fun b!945295 () Bool)

(assert (=> b!945295 (= e!531681 e!531682)))

(assert (=> b!945295 (= lt!425808 (select (arr!27498 (_keys!10568 thiss!1141)) (index!38689 lt!425809)))))

(declare-fun c!98364 () Bool)

(assert (=> b!945295 (= c!98364 (= lt!425808 key!756))))

(assert (= (and d!114213 c!98363) b!945293))

(assert (= (and d!114213 (not c!98363)) b!945295))

(assert (= (and b!945295 c!98364) b!945294))

(assert (= (and b!945295 (not c!98364)) b!945291))

(assert (= (and b!945291 c!98362) b!945290))

(assert (= (and b!945291 (not c!98362)) b!945292))

(declare-fun m!878547 () Bool)

(assert (=> b!945292 m!878547))

(declare-fun m!878549 () Bool)

(assert (=> d!114213 m!878549))

(declare-fun m!878551 () Bool)

(assert (=> d!114213 m!878551))

(assert (=> d!114213 m!878551))

(declare-fun m!878553 () Bool)

(assert (=> d!114213 m!878553))

(declare-fun m!878555 () Bool)

(assert (=> d!114213 m!878555))

(declare-fun m!878557 () Bool)

(assert (=> b!945295 m!878557))

(assert (=> b!945228 d!114213))

(declare-fun mapIsEmpty!32750 () Bool)

(declare-fun mapRes!32750 () Bool)

(assert (=> mapIsEmpty!32750 mapRes!32750))

(declare-fun b!945303 () Bool)

(declare-fun e!531687 () Bool)

(assert (=> b!945303 (= e!531687 tp_is_empty!20605)))

(declare-fun b!945302 () Bool)

(declare-fun e!531688 () Bool)

(assert (=> b!945302 (= e!531688 tp_is_empty!20605)))

(declare-fun condMapEmpty!32750 () Bool)

(declare-fun mapDefault!32750 () ValueCell!9821)

(assert (=> mapNonEmpty!32741 (= condMapEmpty!32750 (= mapRest!32741 ((as const (Array (_ BitVec 32) ValueCell!9821)) mapDefault!32750)))))

(assert (=> mapNonEmpty!32741 (= tp!62809 (and e!531687 mapRes!32750))))

(declare-fun mapNonEmpty!32750 () Bool)

(declare-fun tp!62825 () Bool)

(assert (=> mapNonEmpty!32750 (= mapRes!32750 (and tp!62825 e!531688))))

(declare-fun mapValue!32750 () ValueCell!9821)

(declare-fun mapRest!32750 () (Array (_ BitVec 32) ValueCell!9821))

(declare-fun mapKey!32750 () (_ BitVec 32))

(assert (=> mapNonEmpty!32750 (= mapRest!32741 (store mapRest!32750 mapKey!32750 mapValue!32750))))

(assert (= (and mapNonEmpty!32741 condMapEmpty!32750) mapIsEmpty!32750))

(assert (= (and mapNonEmpty!32741 (not condMapEmpty!32750)) mapNonEmpty!32750))

(assert (= (and mapNonEmpty!32750 ((_ is ValueCellFull!9821) mapValue!32750)) b!945302))

(assert (= (and mapNonEmpty!32741 ((_ is ValueCellFull!9821) mapDefault!32750)) b!945303))

(declare-fun m!878559 () Bool)

(assert (=> mapNonEmpty!32750 m!878559))

(check-sat (not b_next!18097) (not b!945275) (not d!114213) (not b!945277) tp_is_empty!20605 (not b!945292) b_and!29493 (not mapNonEmpty!32750) (not b!945276) (not d!114207))
(check-sat b_and!29493 (not b_next!18097))
