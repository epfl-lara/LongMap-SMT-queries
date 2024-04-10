; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107392 () Bool)

(assert start!107392)

(declare-fun b!1272485 () Bool)

(declare-fun b_free!27669 () Bool)

(declare-fun b_next!27669 () Bool)

(assert (=> b!1272485 (= b_free!27669 (not b_next!27669))))

(declare-fun tp!97522 () Bool)

(declare-fun b_and!45725 () Bool)

(assert (=> b!1272485 (= tp!97522 b_and!45725)))

(declare-fun b!1272482 () Bool)

(declare-fun res!846416 () Bool)

(declare-fun e!725803 () Bool)

(assert (=> b!1272482 (=> (not res!846416) (not e!725803))))

(declare-datatypes ((V!49245 0))(
  ( (V!49246 (val!16594 Int)) )
))
(declare-datatypes ((ValueCell!15666 0))(
  ( (ValueCellFull!15666 (v!19231 V!49245)) (EmptyCell!15666) )
))
(declare-datatypes ((array!83332 0))(
  ( (array!83333 (arr!40200 (Array (_ BitVec 32) ValueCell!15666)) (size!40737 (_ BitVec 32))) )
))
(declare-datatypes ((array!83334 0))(
  ( (array!83335 (arr!40201 (Array (_ BitVec 32) (_ BitVec 64))) (size!40738 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6096 0))(
  ( (LongMapFixedSize!6097 (defaultEntry!6694 Int) (mask!34442 (_ BitVec 32)) (extraKeys!6373 (_ BitVec 32)) (zeroValue!6479 V!49245) (minValue!6479 V!49245) (_size!3103 (_ BitVec 32)) (_keys!12101 array!83334) (_values!6717 array!83332) (_vacant!3103 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6096)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1272482 (= res!846416 (validMask!0 (mask!34442 thiss!1559)))))

(declare-fun mapIsEmpty!51149 () Bool)

(declare-fun mapRes!51149 () Bool)

(assert (=> mapIsEmpty!51149 mapRes!51149))

(declare-fun b!1272483 () Bool)

(assert (=> b!1272483 (= e!725803 (not (= (size!40737 (_values!6717 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34442 thiss!1559)))))))

(declare-fun mapNonEmpty!51149 () Bool)

(declare-fun tp!97523 () Bool)

(declare-fun e!725808 () Bool)

(assert (=> mapNonEmpty!51149 (= mapRes!51149 (and tp!97523 e!725808))))

(declare-fun mapKey!51149 () (_ BitVec 32))

(declare-fun mapRest!51149 () (Array (_ BitVec 32) ValueCell!15666))

(declare-fun mapValue!51149 () ValueCell!15666)

(assert (=> mapNonEmpty!51149 (= (arr!40200 (_values!6717 thiss!1559)) (store mapRest!51149 mapKey!51149 mapValue!51149))))

(declare-fun b!1272484 () Bool)

(declare-fun tp_is_empty!33039 () Bool)

(assert (=> b!1272484 (= e!725808 tp_is_empty!33039)))

(declare-fun e!725805 () Bool)

(declare-fun e!725807 () Bool)

(declare-fun array_inv!30577 (array!83334) Bool)

(declare-fun array_inv!30578 (array!83332) Bool)

(assert (=> b!1272485 (= e!725807 (and tp!97522 tp_is_empty!33039 (array_inv!30577 (_keys!12101 thiss!1559)) (array_inv!30578 (_values!6717 thiss!1559)) e!725805))))

(declare-fun b!1272486 () Bool)

(declare-fun e!725806 () Bool)

(assert (=> b!1272486 (= e!725806 tp_is_empty!33039)))

(declare-fun res!846417 () Bool)

(assert (=> start!107392 (=> (not res!846417) (not e!725803))))

(declare-fun valid!2288 (LongMapFixedSize!6096) Bool)

(assert (=> start!107392 (= res!846417 (valid!2288 thiss!1559))))

(assert (=> start!107392 e!725803))

(assert (=> start!107392 e!725807))

(declare-fun b!1272487 () Bool)

(assert (=> b!1272487 (= e!725805 (and e!725806 mapRes!51149))))

(declare-fun condMapEmpty!51149 () Bool)

(declare-fun mapDefault!51149 () ValueCell!15666)

(assert (=> b!1272487 (= condMapEmpty!51149 (= (arr!40200 (_values!6717 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15666)) mapDefault!51149)))))

(assert (= (and start!107392 res!846417) b!1272482))

(assert (= (and b!1272482 res!846416) b!1272483))

(assert (= (and b!1272487 condMapEmpty!51149) mapIsEmpty!51149))

(assert (= (and b!1272487 (not condMapEmpty!51149)) mapNonEmpty!51149))

(get-info :version)

(assert (= (and mapNonEmpty!51149 ((_ is ValueCellFull!15666) mapValue!51149)) b!1272484))

(assert (= (and b!1272487 ((_ is ValueCellFull!15666) mapDefault!51149)) b!1272486))

(assert (= b!1272485 b!1272487))

(assert (= start!107392 b!1272485))

(declare-fun m!1170131 () Bool)

(assert (=> b!1272482 m!1170131))

(declare-fun m!1170133 () Bool)

(assert (=> mapNonEmpty!51149 m!1170133))

(declare-fun m!1170135 () Bool)

(assert (=> b!1272485 m!1170135))

(declare-fun m!1170137 () Bool)

(assert (=> b!1272485 m!1170137))

(declare-fun m!1170139 () Bool)

(assert (=> start!107392 m!1170139))

(check-sat tp_is_empty!33039 (not b!1272485) (not b!1272482) b_and!45725 (not start!107392) (not b_next!27669) (not mapNonEmpty!51149))
(check-sat b_and!45725 (not b_next!27669))
(get-model)

(declare-fun d!139863 () Bool)

(assert (=> d!139863 (= (validMask!0 (mask!34442 thiss!1559)) (and (or (= (mask!34442 thiss!1559) #b00000000000000000000000000000111) (= (mask!34442 thiss!1559) #b00000000000000000000000000001111) (= (mask!34442 thiss!1559) #b00000000000000000000000000011111) (= (mask!34442 thiss!1559) #b00000000000000000000000000111111) (= (mask!34442 thiss!1559) #b00000000000000000000000001111111) (= (mask!34442 thiss!1559) #b00000000000000000000000011111111) (= (mask!34442 thiss!1559) #b00000000000000000000000111111111) (= (mask!34442 thiss!1559) #b00000000000000000000001111111111) (= (mask!34442 thiss!1559) #b00000000000000000000011111111111) (= (mask!34442 thiss!1559) #b00000000000000000000111111111111) (= (mask!34442 thiss!1559) #b00000000000000000001111111111111) (= (mask!34442 thiss!1559) #b00000000000000000011111111111111) (= (mask!34442 thiss!1559) #b00000000000000000111111111111111) (= (mask!34442 thiss!1559) #b00000000000000001111111111111111) (= (mask!34442 thiss!1559) #b00000000000000011111111111111111) (= (mask!34442 thiss!1559) #b00000000000000111111111111111111) (= (mask!34442 thiss!1559) #b00000000000001111111111111111111) (= (mask!34442 thiss!1559) #b00000000000011111111111111111111) (= (mask!34442 thiss!1559) #b00000000000111111111111111111111) (= (mask!34442 thiss!1559) #b00000000001111111111111111111111) (= (mask!34442 thiss!1559) #b00000000011111111111111111111111) (= (mask!34442 thiss!1559) #b00000000111111111111111111111111) (= (mask!34442 thiss!1559) #b00000001111111111111111111111111) (= (mask!34442 thiss!1559) #b00000011111111111111111111111111) (= (mask!34442 thiss!1559) #b00000111111111111111111111111111) (= (mask!34442 thiss!1559) #b00001111111111111111111111111111) (= (mask!34442 thiss!1559) #b00011111111111111111111111111111) (= (mask!34442 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34442 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1272482 d!139863))

(declare-fun d!139865 () Bool)

(assert (=> d!139865 (= (array_inv!30577 (_keys!12101 thiss!1559)) (bvsge (size!40738 (_keys!12101 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272485 d!139865))

(declare-fun d!139867 () Bool)

(assert (=> d!139867 (= (array_inv!30578 (_values!6717 thiss!1559)) (bvsge (size!40737 (_values!6717 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272485 d!139867))

(declare-fun d!139869 () Bool)

(declare-fun res!846430 () Bool)

(declare-fun e!725829 () Bool)

(assert (=> d!139869 (=> (not res!846430) (not e!725829))))

(declare-fun simpleValid!456 (LongMapFixedSize!6096) Bool)

(assert (=> d!139869 (= res!846430 (simpleValid!456 thiss!1559))))

(assert (=> d!139869 (= (valid!2288 thiss!1559) e!725829)))

(declare-fun b!1272512 () Bool)

(declare-fun res!846431 () Bool)

(assert (=> b!1272512 (=> (not res!846431) (not e!725829))))

(declare-fun arrayCountValidKeys!0 (array!83334 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1272512 (= res!846431 (= (arrayCountValidKeys!0 (_keys!12101 thiss!1559) #b00000000000000000000000000000000 (size!40738 (_keys!12101 thiss!1559))) (_size!3103 thiss!1559)))))

(declare-fun b!1272513 () Bool)

(declare-fun res!846432 () Bool)

(assert (=> b!1272513 (=> (not res!846432) (not e!725829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83334 (_ BitVec 32)) Bool)

(assert (=> b!1272513 (= res!846432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12101 thiss!1559) (mask!34442 thiss!1559)))))

(declare-fun b!1272514 () Bool)

(declare-datatypes ((List!28559 0))(
  ( (Nil!28556) (Cons!28555 (h!29764 (_ BitVec 64)) (t!42092 List!28559)) )
))
(declare-fun arrayNoDuplicates!0 (array!83334 (_ BitVec 32) List!28559) Bool)

(assert (=> b!1272514 (= e!725829 (arrayNoDuplicates!0 (_keys!12101 thiss!1559) #b00000000000000000000000000000000 Nil!28556))))

(assert (= (and d!139869 res!846430) b!1272512))

(assert (= (and b!1272512 res!846431) b!1272513))

(assert (= (and b!1272513 res!846432) b!1272514))

(declare-fun m!1170151 () Bool)

(assert (=> d!139869 m!1170151))

(declare-fun m!1170153 () Bool)

(assert (=> b!1272512 m!1170153))

(declare-fun m!1170155 () Bool)

(assert (=> b!1272513 m!1170155))

(declare-fun m!1170157 () Bool)

(assert (=> b!1272514 m!1170157))

(assert (=> start!107392 d!139869))

(declare-fun mapIsEmpty!51155 () Bool)

(declare-fun mapRes!51155 () Bool)

(assert (=> mapIsEmpty!51155 mapRes!51155))

(declare-fun b!1272522 () Bool)

(declare-fun e!725835 () Bool)

(assert (=> b!1272522 (= e!725835 tp_is_empty!33039)))

(declare-fun mapNonEmpty!51155 () Bool)

(declare-fun tp!97532 () Bool)

(declare-fun e!725834 () Bool)

(assert (=> mapNonEmpty!51155 (= mapRes!51155 (and tp!97532 e!725834))))

(declare-fun mapValue!51155 () ValueCell!15666)

(declare-fun mapKey!51155 () (_ BitVec 32))

(declare-fun mapRest!51155 () (Array (_ BitVec 32) ValueCell!15666))

(assert (=> mapNonEmpty!51155 (= mapRest!51149 (store mapRest!51155 mapKey!51155 mapValue!51155))))

(declare-fun b!1272521 () Bool)

(assert (=> b!1272521 (= e!725834 tp_is_empty!33039)))

(declare-fun condMapEmpty!51155 () Bool)

(declare-fun mapDefault!51155 () ValueCell!15666)

(assert (=> mapNonEmpty!51149 (= condMapEmpty!51155 (= mapRest!51149 ((as const (Array (_ BitVec 32) ValueCell!15666)) mapDefault!51155)))))

(assert (=> mapNonEmpty!51149 (= tp!97523 (and e!725835 mapRes!51155))))

(assert (= (and mapNonEmpty!51149 condMapEmpty!51155) mapIsEmpty!51155))

(assert (= (and mapNonEmpty!51149 (not condMapEmpty!51155)) mapNonEmpty!51155))

(assert (= (and mapNonEmpty!51155 ((_ is ValueCellFull!15666) mapValue!51155)) b!1272521))

(assert (= (and mapNonEmpty!51149 ((_ is ValueCellFull!15666) mapDefault!51155)) b!1272522))

(declare-fun m!1170159 () Bool)

(assert (=> mapNonEmpty!51155 m!1170159))

(check-sat (not b!1272512) (not mapNonEmpty!51155) tp_is_empty!33039 (not b_next!27669) (not b!1272514) b_and!45725 (not d!139869) (not b!1272513))
(check-sat b_and!45725 (not b_next!27669))
(get-model)

(declare-fun b!1272531 () Bool)

(declare-fun e!725841 () (_ BitVec 32))

(assert (=> b!1272531 (= e!725841 #b00000000000000000000000000000000)))

(declare-fun b!1272532 () Bool)

(declare-fun e!725840 () (_ BitVec 32))

(declare-fun call!62549 () (_ BitVec 32))

(assert (=> b!1272532 (= e!725840 (bvadd #b00000000000000000000000000000001 call!62549))))

(declare-fun b!1272533 () Bool)

(assert (=> b!1272533 (= e!725841 e!725840)))

(declare-fun c!123701 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1272533 (= c!123701 (validKeyInArray!0 (select (arr!40201 (_keys!12101 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1272534 () Bool)

(assert (=> b!1272534 (= e!725840 call!62549)))

(declare-fun bm!62546 () Bool)

(assert (=> bm!62546 (= call!62549 (arrayCountValidKeys!0 (_keys!12101 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40738 (_keys!12101 thiss!1559))))))

(declare-fun d!139871 () Bool)

(declare-fun lt!575059 () (_ BitVec 32))

(assert (=> d!139871 (and (bvsge lt!575059 #b00000000000000000000000000000000) (bvsle lt!575059 (bvsub (size!40738 (_keys!12101 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (=> d!139871 (= lt!575059 e!725841)))

(declare-fun c!123702 () Bool)

(assert (=> d!139871 (= c!123702 (bvsge #b00000000000000000000000000000000 (size!40738 (_keys!12101 thiss!1559))))))

(assert (=> d!139871 (and (bvsle #b00000000000000000000000000000000 (size!40738 (_keys!12101 thiss!1559))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40738 (_keys!12101 thiss!1559)) (size!40738 (_keys!12101 thiss!1559))))))

(assert (=> d!139871 (= (arrayCountValidKeys!0 (_keys!12101 thiss!1559) #b00000000000000000000000000000000 (size!40738 (_keys!12101 thiss!1559))) lt!575059)))

(assert (= (and d!139871 c!123702) b!1272531))

(assert (= (and d!139871 (not c!123702)) b!1272533))

(assert (= (and b!1272533 c!123701) b!1272532))

(assert (= (and b!1272533 (not c!123701)) b!1272534))

(assert (= (or b!1272532 b!1272534) bm!62546))

(declare-fun m!1170161 () Bool)

(assert (=> b!1272533 m!1170161))

(assert (=> b!1272533 m!1170161))

(declare-fun m!1170163 () Bool)

(assert (=> b!1272533 m!1170163))

(declare-fun m!1170165 () Bool)

(assert (=> bm!62546 m!1170165))

(assert (=> b!1272512 d!139871))

(declare-fun b!1272545 () Bool)

(declare-fun e!725853 () Bool)

(declare-fun contains!7669 (List!28559 (_ BitVec 64)) Bool)

(assert (=> b!1272545 (= e!725853 (contains!7669 Nil!28556 (select (arr!40201 (_keys!12101 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1272546 () Bool)

(declare-fun e!725850 () Bool)

(declare-fun e!725852 () Bool)

(assert (=> b!1272546 (= e!725850 e!725852)))

(declare-fun c!123705 () Bool)

(assert (=> b!1272546 (= c!123705 (validKeyInArray!0 (select (arr!40201 (_keys!12101 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1272547 () Bool)

(declare-fun call!62552 () Bool)

(assert (=> b!1272547 (= e!725852 call!62552)))

(declare-fun b!1272548 () Bool)

(declare-fun e!725851 () Bool)

(assert (=> b!1272548 (= e!725851 e!725850)))

(declare-fun res!846440 () Bool)

(assert (=> b!1272548 (=> (not res!846440) (not e!725850))))

(assert (=> b!1272548 (= res!846440 (not e!725853))))

(declare-fun res!846441 () Bool)

(assert (=> b!1272548 (=> (not res!846441) (not e!725853))))

(assert (=> b!1272548 (= res!846441 (validKeyInArray!0 (select (arr!40201 (_keys!12101 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1272549 () Bool)

(assert (=> b!1272549 (= e!725852 call!62552)))

(declare-fun bm!62549 () Bool)

(assert (=> bm!62549 (= call!62552 (arrayNoDuplicates!0 (_keys!12101 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123705 (Cons!28555 (select (arr!40201 (_keys!12101 thiss!1559)) #b00000000000000000000000000000000) Nil!28556) Nil!28556)))))

(declare-fun d!139873 () Bool)

(declare-fun res!846439 () Bool)

(assert (=> d!139873 (=> res!846439 e!725851)))

(assert (=> d!139873 (= res!846439 (bvsge #b00000000000000000000000000000000 (size!40738 (_keys!12101 thiss!1559))))))

(assert (=> d!139873 (= (arrayNoDuplicates!0 (_keys!12101 thiss!1559) #b00000000000000000000000000000000 Nil!28556) e!725851)))

(assert (= (and d!139873 (not res!846439)) b!1272548))

(assert (= (and b!1272548 res!846441) b!1272545))

(assert (= (and b!1272548 res!846440) b!1272546))

(assert (= (and b!1272546 c!123705) b!1272547))

(assert (= (and b!1272546 (not c!123705)) b!1272549))

(assert (= (or b!1272547 b!1272549) bm!62549))

(assert (=> b!1272545 m!1170161))

(assert (=> b!1272545 m!1170161))

(declare-fun m!1170167 () Bool)

(assert (=> b!1272545 m!1170167))

(assert (=> b!1272546 m!1170161))

(assert (=> b!1272546 m!1170161))

(assert (=> b!1272546 m!1170163))

(assert (=> b!1272548 m!1170161))

(assert (=> b!1272548 m!1170161))

(assert (=> b!1272548 m!1170163))

(assert (=> bm!62549 m!1170161))

(declare-fun m!1170169 () Bool)

(assert (=> bm!62549 m!1170169))

(assert (=> b!1272514 d!139873))

(declare-fun b!1272559 () Bool)

(declare-fun e!725862 () Bool)

(declare-fun call!62555 () Bool)

(assert (=> b!1272559 (= e!725862 call!62555)))

(declare-fun b!1272560 () Bool)

(declare-fun e!725861 () Bool)

(assert (=> b!1272560 (= e!725861 call!62555)))

(declare-fun b!1272561 () Bool)

(declare-fun e!725860 () Bool)

(assert (=> b!1272561 (= e!725860 e!725861)))

(declare-fun c!123708 () Bool)

(assert (=> b!1272561 (= c!123708 (validKeyInArray!0 (select (arr!40201 (_keys!12101 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun bm!62552 () Bool)

(assert (=> bm!62552 (= call!62555 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12101 thiss!1559) (mask!34442 thiss!1559)))))

(declare-fun d!139875 () Bool)

(declare-fun res!846447 () Bool)

(assert (=> d!139875 (=> res!846447 e!725860)))

(assert (=> d!139875 (= res!846447 (bvsge #b00000000000000000000000000000000 (size!40738 (_keys!12101 thiss!1559))))))

(assert (=> d!139875 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12101 thiss!1559) (mask!34442 thiss!1559)) e!725860)))

(declare-fun b!1272558 () Bool)

(assert (=> b!1272558 (= e!725861 e!725862)))

(declare-fun lt!575068 () (_ BitVec 64))

(assert (=> b!1272558 (= lt!575068 (select (arr!40201 (_keys!12101 thiss!1559)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42320 0))(
  ( (Unit!42321) )
))
(declare-fun lt!575066 () Unit!42320)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83334 (_ BitVec 64) (_ BitVec 32)) Unit!42320)

(assert (=> b!1272558 (= lt!575066 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12101 thiss!1559) lt!575068 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83334 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1272558 (arrayContainsKey!0 (_keys!12101 thiss!1559) lt!575068 #b00000000000000000000000000000000)))

(declare-fun lt!575067 () Unit!42320)

(assert (=> b!1272558 (= lt!575067 lt!575066)))

(declare-fun res!846446 () Bool)

(declare-datatypes ((SeekEntryResult!9990 0))(
  ( (MissingZero!9990 (index!42331 (_ BitVec 32))) (Found!9990 (index!42332 (_ BitVec 32))) (Intermediate!9990 (undefined!10802 Bool) (index!42333 (_ BitVec 32)) (x!112433 (_ BitVec 32))) (Undefined!9990) (MissingVacant!9990 (index!42334 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83334 (_ BitVec 32)) SeekEntryResult!9990)

(assert (=> b!1272558 (= res!846446 (= (seekEntryOrOpen!0 (select (arr!40201 (_keys!12101 thiss!1559)) #b00000000000000000000000000000000) (_keys!12101 thiss!1559) (mask!34442 thiss!1559)) (Found!9990 #b00000000000000000000000000000000)))))

(assert (=> b!1272558 (=> (not res!846446) (not e!725862))))

(assert (= (and d!139875 (not res!846447)) b!1272561))

(assert (= (and b!1272561 c!123708) b!1272558))

(assert (= (and b!1272561 (not c!123708)) b!1272560))

(assert (= (and b!1272558 res!846446) b!1272559))

(assert (= (or b!1272559 b!1272560) bm!62552))

(assert (=> b!1272561 m!1170161))

(assert (=> b!1272561 m!1170161))

(assert (=> b!1272561 m!1170163))

(declare-fun m!1170171 () Bool)

(assert (=> bm!62552 m!1170171))

(assert (=> b!1272558 m!1170161))

(declare-fun m!1170173 () Bool)

(assert (=> b!1272558 m!1170173))

(declare-fun m!1170175 () Bool)

(assert (=> b!1272558 m!1170175))

(assert (=> b!1272558 m!1170161))

(declare-fun m!1170177 () Bool)

(assert (=> b!1272558 m!1170177))

(assert (=> b!1272513 d!139875))

(declare-fun d!139877 () Bool)

(declare-fun res!846459 () Bool)

(declare-fun e!725865 () Bool)

(assert (=> d!139877 (=> (not res!846459) (not e!725865))))

(assert (=> d!139877 (= res!846459 (validMask!0 (mask!34442 thiss!1559)))))

(assert (=> d!139877 (= (simpleValid!456 thiss!1559) e!725865)))

(declare-fun b!1272572 () Bool)

(declare-fun res!846458 () Bool)

(assert (=> b!1272572 (=> (not res!846458) (not e!725865))))

(declare-fun size!40741 (LongMapFixedSize!6096) (_ BitVec 32))

(assert (=> b!1272572 (= res!846458 (= (size!40741 thiss!1559) (bvadd (_size!3103 thiss!1559) (bvsdiv (bvadd (extraKeys!6373 thiss!1559) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1272571 () Bool)

(declare-fun res!846456 () Bool)

(assert (=> b!1272571 (=> (not res!846456) (not e!725865))))

(assert (=> b!1272571 (= res!846456 (bvsge (size!40741 thiss!1559) (_size!3103 thiss!1559)))))

(declare-fun b!1272573 () Bool)

(assert (=> b!1272573 (= e!725865 (and (bvsge (extraKeys!6373 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6373 thiss!1559) #b00000000000000000000000000000011) (bvsge (_vacant!3103 thiss!1559) #b00000000000000000000000000000000)))))

(declare-fun b!1272570 () Bool)

(declare-fun res!846457 () Bool)

(assert (=> b!1272570 (=> (not res!846457) (not e!725865))))

(assert (=> b!1272570 (= res!846457 (and (= (size!40737 (_values!6717 thiss!1559)) (bvadd (mask!34442 thiss!1559) #b00000000000000000000000000000001)) (= (size!40738 (_keys!12101 thiss!1559)) (size!40737 (_values!6717 thiss!1559))) (bvsge (_size!3103 thiss!1559) #b00000000000000000000000000000000) (bvsle (_size!3103 thiss!1559) (bvadd (mask!34442 thiss!1559) #b00000000000000000000000000000001))))))

(assert (= (and d!139877 res!846459) b!1272570))

(assert (= (and b!1272570 res!846457) b!1272571))

(assert (= (and b!1272571 res!846456) b!1272572))

(assert (= (and b!1272572 res!846458) b!1272573))

(assert (=> d!139877 m!1170131))

(declare-fun m!1170179 () Bool)

(assert (=> b!1272572 m!1170179))

(assert (=> b!1272571 m!1170179))

(assert (=> d!139869 d!139877))

(declare-fun mapIsEmpty!51156 () Bool)

(declare-fun mapRes!51156 () Bool)

(assert (=> mapIsEmpty!51156 mapRes!51156))

(declare-fun b!1272575 () Bool)

(declare-fun e!725867 () Bool)

(assert (=> b!1272575 (= e!725867 tp_is_empty!33039)))

(declare-fun mapNonEmpty!51156 () Bool)

(declare-fun tp!97533 () Bool)

(declare-fun e!725866 () Bool)

(assert (=> mapNonEmpty!51156 (= mapRes!51156 (and tp!97533 e!725866))))

(declare-fun mapValue!51156 () ValueCell!15666)

(declare-fun mapRest!51156 () (Array (_ BitVec 32) ValueCell!15666))

(declare-fun mapKey!51156 () (_ BitVec 32))

(assert (=> mapNonEmpty!51156 (= mapRest!51155 (store mapRest!51156 mapKey!51156 mapValue!51156))))

(declare-fun b!1272574 () Bool)

(assert (=> b!1272574 (= e!725866 tp_is_empty!33039)))

(declare-fun condMapEmpty!51156 () Bool)

(declare-fun mapDefault!51156 () ValueCell!15666)

(assert (=> mapNonEmpty!51155 (= condMapEmpty!51156 (= mapRest!51155 ((as const (Array (_ BitVec 32) ValueCell!15666)) mapDefault!51156)))))

(assert (=> mapNonEmpty!51155 (= tp!97532 (and e!725867 mapRes!51156))))

(assert (= (and mapNonEmpty!51155 condMapEmpty!51156) mapIsEmpty!51156))

(assert (= (and mapNonEmpty!51155 (not condMapEmpty!51156)) mapNonEmpty!51156))

(assert (= (and mapNonEmpty!51156 ((_ is ValueCellFull!15666) mapValue!51156)) b!1272574))

(assert (= (and mapNonEmpty!51155 ((_ is ValueCellFull!15666) mapDefault!51156)) b!1272575))

(declare-fun m!1170181 () Bool)

(assert (=> mapNonEmpty!51156 m!1170181))

(check-sat (not b_next!27669) (not mapNonEmpty!51156) (not bm!62552) (not b!1272572) (not b!1272545) (not d!139877) (not b!1272571) b_and!45725 (not b!1272548) (not b!1272546) (not b!1272533) (not b!1272561) (not b!1272558) (not bm!62546) tp_is_empty!33039 (not bm!62549))
(check-sat b_and!45725 (not b_next!27669))
