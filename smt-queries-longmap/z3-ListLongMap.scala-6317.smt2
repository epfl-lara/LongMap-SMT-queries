; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81322 () Bool)

(assert start!81322)

(declare-fun b!950655 () Bool)

(declare-fun b_free!18223 () Bool)

(declare-fun b_next!18223 () Bool)

(assert (=> b!950655 (= b_free!18223 (not b_next!18223))))

(declare-fun tp!63260 () Bool)

(declare-fun b_and!29685 () Bool)

(assert (=> b!950655 (= tp!63260 b_and!29685)))

(declare-fun b!950649 () Bool)

(declare-fun e!535277 () Bool)

(declare-datatypes ((V!32607 0))(
  ( (V!32608 (val!10416 Int)) )
))
(declare-datatypes ((ValueCell!9884 0))(
  ( (ValueCellFull!9884 (v!12954 V!32607)) (EmptyCell!9884) )
))
(declare-datatypes ((array!57527 0))(
  ( (array!57528 (arr!27661 (Array (_ BitVec 32) ValueCell!9884)) (size!28139 (_ BitVec 32))) )
))
(declare-datatypes ((array!57529 0))(
  ( (array!57530 (arr!27662 (Array (_ BitVec 32) (_ BitVec 64))) (size!28140 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4918 0))(
  ( (LongMapFixedSize!4919 (defaultEntry!5768 Int) (mask!27599 (_ BitVec 32)) (extraKeys!5500 (_ BitVec 32)) (zeroValue!5604 V!32607) (minValue!5604 V!32607) (_size!2514 (_ BitVec 32)) (_keys!10728 array!57529) (_values!5791 array!57527) (_vacant!2514 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4918)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57529 (_ BitVec 32)) Bool)

(assert (=> b!950649 (= e!535277 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10728 thiss!1141) (mask!27599 thiss!1141))))))

(declare-fun b!950651 () Bool)

(declare-fun e!535280 () Bool)

(declare-fun tp_is_empty!20731 () Bool)

(assert (=> b!950651 (= e!535280 tp_is_empty!20731)))

(declare-fun b!950652 () Bool)

(declare-fun res!637212 () Bool)

(assert (=> b!950652 (=> (not res!637212) (not e!535277))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9097 0))(
  ( (MissingZero!9097 (index!38759 (_ BitVec 32))) (Found!9097 (index!38760 (_ BitVec 32))) (Intermediate!9097 (undefined!9909 Bool) (index!38761 (_ BitVec 32)) (x!81685 (_ BitVec 32))) (Undefined!9097) (MissingVacant!9097 (index!38762 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57529 (_ BitVec 32)) SeekEntryResult!9097)

(assert (=> b!950652 (= res!637212 (not ((_ is Found!9097) (seekEntry!0 key!756 (_keys!10728 thiss!1141) (mask!27599 thiss!1141)))))))

(declare-fun mapIsEmpty!33002 () Bool)

(declare-fun mapRes!33002 () Bool)

(assert (=> mapIsEmpty!33002 mapRes!33002))

(declare-fun b!950653 () Bool)

(declare-fun res!637214 () Bool)

(assert (=> b!950653 (=> (not res!637214) (not e!535277))))

(assert (=> b!950653 (= res!637214 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!950654 () Bool)

(declare-fun res!637215 () Bool)

(assert (=> b!950654 (=> (not res!637215) (not e!535277))))

(declare-datatypes ((tuple2!13524 0))(
  ( (tuple2!13525 (_1!6773 (_ BitVec 64)) (_2!6773 V!32607)) )
))
(declare-datatypes ((List!19318 0))(
  ( (Nil!19315) (Cons!19314 (h!20480 tuple2!13524) (t!27645 List!19318)) )
))
(declare-datatypes ((ListLongMap!12223 0))(
  ( (ListLongMap!12224 (toList!6127 List!19318)) )
))
(declare-fun contains!5228 (ListLongMap!12223 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3360 (array!57529 array!57527 (_ BitVec 32) (_ BitVec 32) V!32607 V!32607 (_ BitVec 32) Int) ListLongMap!12223)

(assert (=> b!950654 (= res!637215 (contains!5228 (getCurrentListMap!3360 (_keys!10728 thiss!1141) (_values!5791 thiss!1141) (mask!27599 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141)) key!756))))

(declare-fun b!950650 () Bool)

(declare-fun res!637211 () Bool)

(assert (=> b!950650 (=> (not res!637211) (not e!535277))))

(assert (=> b!950650 (= res!637211 (and (= (size!28139 (_values!5791 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27599 thiss!1141))) (= (size!28140 (_keys!10728 thiss!1141)) (size!28139 (_values!5791 thiss!1141))) (bvsge (mask!27599 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5500 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5500 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun res!637213 () Bool)

(assert (=> start!81322 (=> (not res!637213) (not e!535277))))

(declare-fun valid!1885 (LongMapFixedSize!4918) Bool)

(assert (=> start!81322 (= res!637213 (valid!1885 thiss!1141))))

(assert (=> start!81322 e!535277))

(declare-fun e!535278 () Bool)

(assert (=> start!81322 e!535278))

(assert (=> start!81322 true))

(declare-fun e!535279 () Bool)

(declare-fun array_inv!21552 (array!57529) Bool)

(declare-fun array_inv!21553 (array!57527) Bool)

(assert (=> b!950655 (= e!535278 (and tp!63260 tp_is_empty!20731 (array_inv!21552 (_keys!10728 thiss!1141)) (array_inv!21553 (_values!5791 thiss!1141)) e!535279))))

(declare-fun b!950656 () Bool)

(assert (=> b!950656 (= e!535279 (and e!535280 mapRes!33002))))

(declare-fun condMapEmpty!33002 () Bool)

(declare-fun mapDefault!33002 () ValueCell!9884)

(assert (=> b!950656 (= condMapEmpty!33002 (= (arr!27661 (_values!5791 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9884)) mapDefault!33002)))))

(declare-fun mapNonEmpty!33002 () Bool)

(declare-fun tp!63259 () Bool)

(declare-fun e!535276 () Bool)

(assert (=> mapNonEmpty!33002 (= mapRes!33002 (and tp!63259 e!535276))))

(declare-fun mapValue!33002 () ValueCell!9884)

(declare-fun mapRest!33002 () (Array (_ BitVec 32) ValueCell!9884))

(declare-fun mapKey!33002 () (_ BitVec 32))

(assert (=> mapNonEmpty!33002 (= (arr!27661 (_values!5791 thiss!1141)) (store mapRest!33002 mapKey!33002 mapValue!33002))))

(declare-fun b!950657 () Bool)

(declare-fun res!637210 () Bool)

(assert (=> b!950657 (=> (not res!637210) (not e!535277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!950657 (= res!637210 (validMask!0 (mask!27599 thiss!1141)))))

(declare-fun b!950658 () Bool)

(assert (=> b!950658 (= e!535276 tp_is_empty!20731)))

(assert (= (and start!81322 res!637213) b!950653))

(assert (= (and b!950653 res!637214) b!950652))

(assert (= (and b!950652 res!637212) b!950654))

(assert (= (and b!950654 res!637215) b!950657))

(assert (= (and b!950657 res!637210) b!950650))

(assert (= (and b!950650 res!637211) b!950649))

(assert (= (and b!950656 condMapEmpty!33002) mapIsEmpty!33002))

(assert (= (and b!950656 (not condMapEmpty!33002)) mapNonEmpty!33002))

(assert (= (and mapNonEmpty!33002 ((_ is ValueCellFull!9884) mapValue!33002)) b!950658))

(assert (= (and b!950656 ((_ is ValueCellFull!9884) mapDefault!33002)) b!950651))

(assert (= b!950655 b!950656))

(assert (= start!81322 b!950655))

(declare-fun m!883665 () Bool)

(assert (=> b!950657 m!883665))

(declare-fun m!883667 () Bool)

(assert (=> start!81322 m!883667))

(declare-fun m!883669 () Bool)

(assert (=> b!950655 m!883669))

(declare-fun m!883671 () Bool)

(assert (=> b!950655 m!883671))

(declare-fun m!883673 () Bool)

(assert (=> b!950649 m!883673))

(declare-fun m!883675 () Bool)

(assert (=> mapNonEmpty!33002 m!883675))

(declare-fun m!883677 () Bool)

(assert (=> b!950654 m!883677))

(assert (=> b!950654 m!883677))

(declare-fun m!883679 () Bool)

(assert (=> b!950654 m!883679))

(declare-fun m!883681 () Bool)

(assert (=> b!950652 m!883681))

(check-sat (not b!950655) b_and!29685 (not mapNonEmpty!33002) (not b!950652) (not b!950649) (not b!950654) (not b!950657) (not start!81322) (not b_next!18223) tp_is_empty!20731)
(check-sat b_and!29685 (not b_next!18223))
(get-model)

(declare-fun bm!41364 () Bool)

(declare-fun call!41367 () Bool)

(assert (=> bm!41364 (= call!41367 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10728 thiss!1141) (mask!27599 thiss!1141)))))

(declare-fun b!950727 () Bool)

(declare-fun e!535324 () Bool)

(assert (=> b!950727 (= e!535324 call!41367)))

(declare-fun b!950728 () Bool)

(declare-fun e!535326 () Bool)

(assert (=> b!950728 (= e!535326 e!535324)))

(declare-fun c!99433 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!950728 (= c!99433 (validKeyInArray!0 (select (arr!27662 (_keys!10728 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950729 () Bool)

(declare-fun e!535325 () Bool)

(assert (=> b!950729 (= e!535324 e!535325)))

(declare-fun lt!428099 () (_ BitVec 64))

(assert (=> b!950729 (= lt!428099 (select (arr!27662 (_keys!10728 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31962 0))(
  ( (Unit!31963) )
))
(declare-fun lt!428100 () Unit!31962)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57529 (_ BitVec 64) (_ BitVec 32)) Unit!31962)

(assert (=> b!950729 (= lt!428100 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10728 thiss!1141) lt!428099 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!950729 (arrayContainsKey!0 (_keys!10728 thiss!1141) lt!428099 #b00000000000000000000000000000000)))

(declare-fun lt!428101 () Unit!31962)

(assert (=> b!950729 (= lt!428101 lt!428100)))

(declare-fun res!637256 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57529 (_ BitVec 32)) SeekEntryResult!9097)

(assert (=> b!950729 (= res!637256 (= (seekEntryOrOpen!0 (select (arr!27662 (_keys!10728 thiss!1141)) #b00000000000000000000000000000000) (_keys!10728 thiss!1141) (mask!27599 thiss!1141)) (Found!9097 #b00000000000000000000000000000000)))))

(assert (=> b!950729 (=> (not res!637256) (not e!535325))))

(declare-fun d!115449 () Bool)

(declare-fun res!637257 () Bool)

(assert (=> d!115449 (=> res!637257 e!535326)))

(assert (=> d!115449 (= res!637257 (bvsge #b00000000000000000000000000000000 (size!28140 (_keys!10728 thiss!1141))))))

(assert (=> d!115449 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10728 thiss!1141) (mask!27599 thiss!1141)) e!535326)))

(declare-fun b!950730 () Bool)

(assert (=> b!950730 (= e!535325 call!41367)))

(assert (= (and d!115449 (not res!637257)) b!950728))

(assert (= (and b!950728 c!99433) b!950729))

(assert (= (and b!950728 (not c!99433)) b!950727))

(assert (= (and b!950729 res!637256) b!950730))

(assert (= (or b!950730 b!950727) bm!41364))

(declare-fun m!883719 () Bool)

(assert (=> bm!41364 m!883719))

(declare-fun m!883721 () Bool)

(assert (=> b!950728 m!883721))

(assert (=> b!950728 m!883721))

(declare-fun m!883723 () Bool)

(assert (=> b!950728 m!883723))

(assert (=> b!950729 m!883721))

(declare-fun m!883725 () Bool)

(assert (=> b!950729 m!883725))

(declare-fun m!883727 () Bool)

(assert (=> b!950729 m!883727))

(assert (=> b!950729 m!883721))

(declare-fun m!883729 () Bool)

(assert (=> b!950729 m!883729))

(assert (=> b!950649 d!115449))

(declare-fun d!115451 () Bool)

(assert (=> d!115451 (= (validMask!0 (mask!27599 thiss!1141)) (and (or (= (mask!27599 thiss!1141) #b00000000000000000000000000000111) (= (mask!27599 thiss!1141) #b00000000000000000000000000001111) (= (mask!27599 thiss!1141) #b00000000000000000000000000011111) (= (mask!27599 thiss!1141) #b00000000000000000000000000111111) (= (mask!27599 thiss!1141) #b00000000000000000000000001111111) (= (mask!27599 thiss!1141) #b00000000000000000000000011111111) (= (mask!27599 thiss!1141) #b00000000000000000000000111111111) (= (mask!27599 thiss!1141) #b00000000000000000000001111111111) (= (mask!27599 thiss!1141) #b00000000000000000000011111111111) (= (mask!27599 thiss!1141) #b00000000000000000000111111111111) (= (mask!27599 thiss!1141) #b00000000000000000001111111111111) (= (mask!27599 thiss!1141) #b00000000000000000011111111111111) (= (mask!27599 thiss!1141) #b00000000000000000111111111111111) (= (mask!27599 thiss!1141) #b00000000000000001111111111111111) (= (mask!27599 thiss!1141) #b00000000000000011111111111111111) (= (mask!27599 thiss!1141) #b00000000000000111111111111111111) (= (mask!27599 thiss!1141) #b00000000000001111111111111111111) (= (mask!27599 thiss!1141) #b00000000000011111111111111111111) (= (mask!27599 thiss!1141) #b00000000000111111111111111111111) (= (mask!27599 thiss!1141) #b00000000001111111111111111111111) (= (mask!27599 thiss!1141) #b00000000011111111111111111111111) (= (mask!27599 thiss!1141) #b00000000111111111111111111111111) (= (mask!27599 thiss!1141) #b00000001111111111111111111111111) (= (mask!27599 thiss!1141) #b00000011111111111111111111111111) (= (mask!27599 thiss!1141) #b00000111111111111111111111111111) (= (mask!27599 thiss!1141) #b00001111111111111111111111111111) (= (mask!27599 thiss!1141) #b00011111111111111111111111111111) (= (mask!27599 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27599 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!950657 d!115451))

(declare-fun d!115453 () Bool)

(declare-fun e!535332 () Bool)

(assert (=> d!115453 e!535332))

(declare-fun res!637260 () Bool)

(assert (=> d!115453 (=> res!637260 e!535332)))

(declare-fun lt!428111 () Bool)

(assert (=> d!115453 (= res!637260 (not lt!428111))))

(declare-fun lt!428113 () Bool)

(assert (=> d!115453 (= lt!428111 lt!428113)))

(declare-fun lt!428110 () Unit!31962)

(declare-fun e!535331 () Unit!31962)

(assert (=> d!115453 (= lt!428110 e!535331)))

(declare-fun c!99436 () Bool)

(assert (=> d!115453 (= c!99436 lt!428113)))

(declare-fun containsKey!464 (List!19318 (_ BitVec 64)) Bool)

(assert (=> d!115453 (= lt!428113 (containsKey!464 (toList!6127 (getCurrentListMap!3360 (_keys!10728 thiss!1141) (_values!5791 thiss!1141) (mask!27599 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141))) key!756))))

(assert (=> d!115453 (= (contains!5228 (getCurrentListMap!3360 (_keys!10728 thiss!1141) (_values!5791 thiss!1141) (mask!27599 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141)) key!756) lt!428111)))

(declare-fun b!950737 () Bool)

(declare-fun lt!428112 () Unit!31962)

(assert (=> b!950737 (= e!535331 lt!428112)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!358 (List!19318 (_ BitVec 64)) Unit!31962)

(assert (=> b!950737 (= lt!428112 (lemmaContainsKeyImpliesGetValueByKeyDefined!358 (toList!6127 (getCurrentListMap!3360 (_keys!10728 thiss!1141) (_values!5791 thiss!1141) (mask!27599 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141))) key!756))))

(declare-datatypes ((Option!499 0))(
  ( (Some!498 (v!12957 V!32607)) (None!497) )
))
(declare-fun isDefined!366 (Option!499) Bool)

(declare-fun getValueByKey!493 (List!19318 (_ BitVec 64)) Option!499)

(assert (=> b!950737 (isDefined!366 (getValueByKey!493 (toList!6127 (getCurrentListMap!3360 (_keys!10728 thiss!1141) (_values!5791 thiss!1141) (mask!27599 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141))) key!756))))

(declare-fun b!950738 () Bool)

(declare-fun Unit!31964 () Unit!31962)

(assert (=> b!950738 (= e!535331 Unit!31964)))

(declare-fun b!950739 () Bool)

(assert (=> b!950739 (= e!535332 (isDefined!366 (getValueByKey!493 (toList!6127 (getCurrentListMap!3360 (_keys!10728 thiss!1141) (_values!5791 thiss!1141) (mask!27599 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141))) key!756)))))

(assert (= (and d!115453 c!99436) b!950737))

(assert (= (and d!115453 (not c!99436)) b!950738))

(assert (= (and d!115453 (not res!637260)) b!950739))

(declare-fun m!883731 () Bool)

(assert (=> d!115453 m!883731))

(declare-fun m!883733 () Bool)

(assert (=> b!950737 m!883733))

(declare-fun m!883735 () Bool)

(assert (=> b!950737 m!883735))

(assert (=> b!950737 m!883735))

(declare-fun m!883737 () Bool)

(assert (=> b!950737 m!883737))

(assert (=> b!950739 m!883735))

(assert (=> b!950739 m!883735))

(assert (=> b!950739 m!883737))

(assert (=> b!950654 d!115453))

(declare-fun bm!41379 () Bool)

(declare-fun call!41385 () ListLongMap!12223)

(declare-fun call!41388 () ListLongMap!12223)

(assert (=> bm!41379 (= call!41385 call!41388)))

(declare-fun bm!41380 () Bool)

(declare-fun call!41386 () ListLongMap!12223)

(declare-fun call!41383 () ListLongMap!12223)

(assert (=> bm!41380 (= call!41386 call!41383)))

(declare-fun b!950782 () Bool)

(declare-fun e!535365 () Bool)

(declare-fun e!535371 () Bool)

(assert (=> b!950782 (= e!535365 e!535371)))

(declare-fun res!637282 () Bool)

(declare-fun call!41387 () Bool)

(assert (=> b!950782 (= res!637282 call!41387)))

(assert (=> b!950782 (=> (not res!637282) (not e!535371))))

(declare-fun b!950783 () Bool)

(declare-fun e!535362 () ListLongMap!12223)

(declare-fun +!2871 (ListLongMap!12223 tuple2!13524) ListLongMap!12223)

(assert (=> b!950783 (= e!535362 (+!2871 call!41388 (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5604 thiss!1141))))))

(declare-fun b!950784 () Bool)

(declare-fun e!535368 () Unit!31962)

(declare-fun Unit!31965 () Unit!31962)

(assert (=> b!950784 (= e!535368 Unit!31965)))

(declare-fun b!950785 () Bool)

(assert (=> b!950785 (= e!535365 (not call!41387))))

(declare-fun bm!41381 () Bool)

(declare-fun lt!428173 () ListLongMap!12223)

(assert (=> bm!41381 (= call!41387 (contains!5228 lt!428173 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!950786 () Bool)

(declare-fun e!535359 () Bool)

(assert (=> b!950786 (= e!535359 (validKeyInArray!0 (select (arr!27662 (_keys!10728 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41382 () Bool)

(declare-fun call!41384 () Bool)

(assert (=> bm!41382 (= call!41384 (contains!5228 lt!428173 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41383 () Bool)

(declare-fun call!41382 () ListLongMap!12223)

(declare-fun getCurrentListMapNoExtraKeys!3359 (array!57529 array!57527 (_ BitVec 32) (_ BitVec 32) V!32607 V!32607 (_ BitVec 32) Int) ListLongMap!12223)

(assert (=> bm!41383 (= call!41382 (getCurrentListMapNoExtraKeys!3359 (_keys!10728 thiss!1141) (_values!5791 thiss!1141) (mask!27599 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141)))))

(declare-fun bm!41384 () Bool)

(declare-fun c!99450 () Bool)

(declare-fun c!99454 () Bool)

(assert (=> bm!41384 (= call!41388 (+!2871 (ite c!99454 call!41382 (ite c!99450 call!41383 call!41386)) (ite (or c!99454 c!99450) (tuple2!13525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5604 thiss!1141)) (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5604 thiss!1141)))))))

(declare-fun b!950787 () Bool)

(declare-fun e!535361 () Bool)

(assert (=> b!950787 (= e!535361 e!535365)))

(declare-fun c!99453 () Bool)

(assert (=> b!950787 (= c!99453 (not (= (bvand (extraKeys!5500 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!950788 () Bool)

(declare-fun e!535366 () Bool)

(declare-fun e!535367 () Bool)

(assert (=> b!950788 (= e!535366 e!535367)))

(declare-fun res!637280 () Bool)

(assert (=> b!950788 (= res!637280 call!41384)))

(assert (=> b!950788 (=> (not res!637280) (not e!535367))))

(declare-fun d!115455 () Bool)

(assert (=> d!115455 e!535361))

(declare-fun res!637286 () Bool)

(assert (=> d!115455 (=> (not res!637286) (not e!535361))))

(assert (=> d!115455 (= res!637286 (or (bvsge #b00000000000000000000000000000000 (size!28140 (_keys!10728 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28140 (_keys!10728 thiss!1141))))))))

(declare-fun lt!428170 () ListLongMap!12223)

(assert (=> d!115455 (= lt!428173 lt!428170)))

(declare-fun lt!428166 () Unit!31962)

(assert (=> d!115455 (= lt!428166 e!535368)))

(declare-fun c!99452 () Bool)

(declare-fun e!535369 () Bool)

(assert (=> d!115455 (= c!99452 e!535369)))

(declare-fun res!637283 () Bool)

(assert (=> d!115455 (=> (not res!637283) (not e!535369))))

(assert (=> d!115455 (= res!637283 (bvslt #b00000000000000000000000000000000 (size!28140 (_keys!10728 thiss!1141))))))

(assert (=> d!115455 (= lt!428170 e!535362)))

(assert (=> d!115455 (= c!99454 (and (not (= (bvand (extraKeys!5500 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5500 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115455 (validMask!0 (mask!27599 thiss!1141))))

(assert (=> d!115455 (= (getCurrentListMap!3360 (_keys!10728 thiss!1141) (_values!5791 thiss!1141) (mask!27599 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141)) lt!428173)))

(declare-fun b!950789 () Bool)

(assert (=> b!950789 (= e!535369 (validKeyInArray!0 (select (arr!27662 (_keys!10728 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950790 () Bool)

(declare-fun e!535364 () Bool)

(declare-fun apply!885 (ListLongMap!12223 (_ BitVec 64)) V!32607)

(declare-fun get!14550 (ValueCell!9884 V!32607) V!32607)

(declare-fun dynLambda!1668 (Int (_ BitVec 64)) V!32607)

(assert (=> b!950790 (= e!535364 (= (apply!885 lt!428173 (select (arr!27662 (_keys!10728 thiss!1141)) #b00000000000000000000000000000000)) (get!14550 (select (arr!27661 (_values!5791 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1668 (defaultEntry!5768 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!950790 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28139 (_values!5791 thiss!1141))))))

(assert (=> b!950790 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28140 (_keys!10728 thiss!1141))))))

(declare-fun b!950791 () Bool)

(declare-fun e!535363 () ListLongMap!12223)

(assert (=> b!950791 (= e!535363 call!41385)))

(declare-fun b!950792 () Bool)

(assert (=> b!950792 (= e!535363 call!41386)))

(declare-fun b!950793 () Bool)

(declare-fun c!99451 () Bool)

(assert (=> b!950793 (= c!99451 (and (not (= (bvand (extraKeys!5500 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5500 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!535360 () ListLongMap!12223)

(assert (=> b!950793 (= e!535360 e!535363)))

(declare-fun b!950794 () Bool)

(assert (=> b!950794 (= e!535366 (not call!41384))))

(declare-fun b!950795 () Bool)

(assert (=> b!950795 (= e!535360 call!41385)))

(declare-fun bm!41385 () Bool)

(assert (=> bm!41385 (= call!41383 call!41382)))

(declare-fun b!950796 () Bool)

(assert (=> b!950796 (= e!535362 e!535360)))

(assert (=> b!950796 (= c!99450 (and (not (= (bvand (extraKeys!5500 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5500 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!950797 () Bool)

(assert (=> b!950797 (= e!535367 (= (apply!885 lt!428173 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5604 thiss!1141)))))

(declare-fun b!950798 () Bool)

(declare-fun lt!428162 () Unit!31962)

(assert (=> b!950798 (= e!535368 lt!428162)))

(declare-fun lt!428168 () ListLongMap!12223)

(assert (=> b!950798 (= lt!428168 (getCurrentListMapNoExtraKeys!3359 (_keys!10728 thiss!1141) (_values!5791 thiss!1141) (mask!27599 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141)))))

(declare-fun lt!428158 () (_ BitVec 64))

(assert (=> b!950798 (= lt!428158 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428175 () (_ BitVec 64))

(assert (=> b!950798 (= lt!428175 (select (arr!27662 (_keys!10728 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428161 () Unit!31962)

(declare-fun addStillContains!574 (ListLongMap!12223 (_ BitVec 64) V!32607 (_ BitVec 64)) Unit!31962)

(assert (=> b!950798 (= lt!428161 (addStillContains!574 lt!428168 lt!428158 (zeroValue!5604 thiss!1141) lt!428175))))

(assert (=> b!950798 (contains!5228 (+!2871 lt!428168 (tuple2!13525 lt!428158 (zeroValue!5604 thiss!1141))) lt!428175)))

(declare-fun lt!428160 () Unit!31962)

(assert (=> b!950798 (= lt!428160 lt!428161)))

(declare-fun lt!428176 () ListLongMap!12223)

(assert (=> b!950798 (= lt!428176 (getCurrentListMapNoExtraKeys!3359 (_keys!10728 thiss!1141) (_values!5791 thiss!1141) (mask!27599 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141)))))

(declare-fun lt!428167 () (_ BitVec 64))

(assert (=> b!950798 (= lt!428167 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428172 () (_ BitVec 64))

(assert (=> b!950798 (= lt!428172 (select (arr!27662 (_keys!10728 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428165 () Unit!31962)

(declare-fun addApplyDifferent!455 (ListLongMap!12223 (_ BitVec 64) V!32607 (_ BitVec 64)) Unit!31962)

(assert (=> b!950798 (= lt!428165 (addApplyDifferent!455 lt!428176 lt!428167 (minValue!5604 thiss!1141) lt!428172))))

(assert (=> b!950798 (= (apply!885 (+!2871 lt!428176 (tuple2!13525 lt!428167 (minValue!5604 thiss!1141))) lt!428172) (apply!885 lt!428176 lt!428172))))

(declare-fun lt!428177 () Unit!31962)

(assert (=> b!950798 (= lt!428177 lt!428165)))

(declare-fun lt!428179 () ListLongMap!12223)

(assert (=> b!950798 (= lt!428179 (getCurrentListMapNoExtraKeys!3359 (_keys!10728 thiss!1141) (_values!5791 thiss!1141) (mask!27599 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141)))))

(declare-fun lt!428169 () (_ BitVec 64))

(assert (=> b!950798 (= lt!428169 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428159 () (_ BitVec 64))

(assert (=> b!950798 (= lt!428159 (select (arr!27662 (_keys!10728 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428164 () Unit!31962)

(assert (=> b!950798 (= lt!428164 (addApplyDifferent!455 lt!428179 lt!428169 (zeroValue!5604 thiss!1141) lt!428159))))

(assert (=> b!950798 (= (apply!885 (+!2871 lt!428179 (tuple2!13525 lt!428169 (zeroValue!5604 thiss!1141))) lt!428159) (apply!885 lt!428179 lt!428159))))

(declare-fun lt!428174 () Unit!31962)

(assert (=> b!950798 (= lt!428174 lt!428164)))

(declare-fun lt!428163 () ListLongMap!12223)

(assert (=> b!950798 (= lt!428163 (getCurrentListMapNoExtraKeys!3359 (_keys!10728 thiss!1141) (_values!5791 thiss!1141) (mask!27599 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141)))))

(declare-fun lt!428171 () (_ BitVec 64))

(assert (=> b!950798 (= lt!428171 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428178 () (_ BitVec 64))

(assert (=> b!950798 (= lt!428178 (select (arr!27662 (_keys!10728 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950798 (= lt!428162 (addApplyDifferent!455 lt!428163 lt!428171 (minValue!5604 thiss!1141) lt!428178))))

(assert (=> b!950798 (= (apply!885 (+!2871 lt!428163 (tuple2!13525 lt!428171 (minValue!5604 thiss!1141))) lt!428178) (apply!885 lt!428163 lt!428178))))

(declare-fun b!950799 () Bool)

(declare-fun res!637279 () Bool)

(assert (=> b!950799 (=> (not res!637279) (not e!535361))))

(declare-fun e!535370 () Bool)

(assert (=> b!950799 (= res!637279 e!535370)))

(declare-fun res!637285 () Bool)

(assert (=> b!950799 (=> res!637285 e!535370)))

(assert (=> b!950799 (= res!637285 (not e!535359))))

(declare-fun res!637287 () Bool)

(assert (=> b!950799 (=> (not res!637287) (not e!535359))))

(assert (=> b!950799 (= res!637287 (bvslt #b00000000000000000000000000000000 (size!28140 (_keys!10728 thiss!1141))))))

(declare-fun b!950800 () Bool)

(declare-fun res!637284 () Bool)

(assert (=> b!950800 (=> (not res!637284) (not e!535361))))

(assert (=> b!950800 (= res!637284 e!535366)))

(declare-fun c!99449 () Bool)

(assert (=> b!950800 (= c!99449 (not (= (bvand (extraKeys!5500 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!950801 () Bool)

(assert (=> b!950801 (= e!535370 e!535364)))

(declare-fun res!637281 () Bool)

(assert (=> b!950801 (=> (not res!637281) (not e!535364))))

(assert (=> b!950801 (= res!637281 (contains!5228 lt!428173 (select (arr!27662 (_keys!10728 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!950801 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28140 (_keys!10728 thiss!1141))))))

(declare-fun b!950802 () Bool)

(assert (=> b!950802 (= e!535371 (= (apply!885 lt!428173 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5604 thiss!1141)))))

(assert (= (and d!115455 c!99454) b!950783))

(assert (= (and d!115455 (not c!99454)) b!950796))

(assert (= (and b!950796 c!99450) b!950795))

(assert (= (and b!950796 (not c!99450)) b!950793))

(assert (= (and b!950793 c!99451) b!950791))

(assert (= (and b!950793 (not c!99451)) b!950792))

(assert (= (or b!950791 b!950792) bm!41380))

(assert (= (or b!950795 bm!41380) bm!41385))

(assert (= (or b!950795 b!950791) bm!41379))

(assert (= (or b!950783 bm!41385) bm!41383))

(assert (= (or b!950783 bm!41379) bm!41384))

(assert (= (and d!115455 res!637283) b!950789))

(assert (= (and d!115455 c!99452) b!950798))

(assert (= (and d!115455 (not c!99452)) b!950784))

(assert (= (and d!115455 res!637286) b!950799))

(assert (= (and b!950799 res!637287) b!950786))

(assert (= (and b!950799 (not res!637285)) b!950801))

(assert (= (and b!950801 res!637281) b!950790))

(assert (= (and b!950799 res!637279) b!950800))

(assert (= (and b!950800 c!99449) b!950788))

(assert (= (and b!950800 (not c!99449)) b!950794))

(assert (= (and b!950788 res!637280) b!950797))

(assert (= (or b!950788 b!950794) bm!41382))

(assert (= (and b!950800 res!637284) b!950787))

(assert (= (and b!950787 c!99453) b!950782))

(assert (= (and b!950787 (not c!99453)) b!950785))

(assert (= (and b!950782 res!637282) b!950802))

(assert (= (or b!950782 b!950785) bm!41381))

(declare-fun b_lambda!14373 () Bool)

(assert (=> (not b_lambda!14373) (not b!950790)))

(declare-fun t!27648 () Bool)

(declare-fun tb!6179 () Bool)

(assert (=> (and b!950655 (= (defaultEntry!5768 thiss!1141) (defaultEntry!5768 thiss!1141)) t!27648) tb!6179))

(declare-fun result!12275 () Bool)

(assert (=> tb!6179 (= result!12275 tp_is_empty!20731)))

(assert (=> b!950790 t!27648))

(declare-fun b_and!29691 () Bool)

(assert (= b_and!29685 (and (=> t!27648 result!12275) b_and!29691)))

(declare-fun m!883739 () Bool)

(assert (=> b!950783 m!883739))

(declare-fun m!883741 () Bool)

(assert (=> b!950797 m!883741))

(assert (=> b!950801 m!883721))

(assert (=> b!950801 m!883721))

(declare-fun m!883743 () Bool)

(assert (=> b!950801 m!883743))

(declare-fun m!883745 () Bool)

(assert (=> b!950798 m!883745))

(declare-fun m!883747 () Bool)

(assert (=> b!950798 m!883747))

(declare-fun m!883749 () Bool)

(assert (=> b!950798 m!883749))

(declare-fun m!883751 () Bool)

(assert (=> b!950798 m!883751))

(declare-fun m!883753 () Bool)

(assert (=> b!950798 m!883753))

(declare-fun m!883755 () Bool)

(assert (=> b!950798 m!883755))

(declare-fun m!883757 () Bool)

(assert (=> b!950798 m!883757))

(assert (=> b!950798 m!883757))

(declare-fun m!883759 () Bool)

(assert (=> b!950798 m!883759))

(declare-fun m!883761 () Bool)

(assert (=> b!950798 m!883761))

(assert (=> b!950798 m!883747))

(declare-fun m!883763 () Bool)

(assert (=> b!950798 m!883763))

(declare-fun m!883765 () Bool)

(assert (=> b!950798 m!883765))

(assert (=> b!950798 m!883751))

(declare-fun m!883767 () Bool)

(assert (=> b!950798 m!883767))

(declare-fun m!883769 () Bool)

(assert (=> b!950798 m!883769))

(assert (=> b!950798 m!883755))

(declare-fun m!883771 () Bool)

(assert (=> b!950798 m!883771))

(declare-fun m!883773 () Bool)

(assert (=> b!950798 m!883773))

(assert (=> b!950798 m!883721))

(declare-fun m!883775 () Bool)

(assert (=> b!950798 m!883775))

(assert (=> d!115455 m!883665))

(declare-fun m!883777 () Bool)

(assert (=> b!950802 m!883777))

(assert (=> b!950786 m!883721))

(assert (=> b!950786 m!883721))

(assert (=> b!950786 m!883723))

(assert (=> b!950789 m!883721))

(assert (=> b!950789 m!883721))

(assert (=> b!950789 m!883723))

(declare-fun m!883779 () Bool)

(assert (=> bm!41381 m!883779))

(declare-fun m!883781 () Bool)

(assert (=> bm!41382 m!883781))

(declare-fun m!883783 () Bool)

(assert (=> b!950790 m!883783))

(declare-fun m!883785 () Bool)

(assert (=> b!950790 m!883785))

(assert (=> b!950790 m!883783))

(declare-fun m!883787 () Bool)

(assert (=> b!950790 m!883787))

(assert (=> b!950790 m!883721))

(declare-fun m!883789 () Bool)

(assert (=> b!950790 m!883789))

(assert (=> b!950790 m!883721))

(assert (=> b!950790 m!883785))

(assert (=> bm!41383 m!883769))

(declare-fun m!883791 () Bool)

(assert (=> bm!41384 m!883791))

(assert (=> b!950654 d!115455))

(declare-fun d!115457 () Bool)

(assert (=> d!115457 (= (array_inv!21552 (_keys!10728 thiss!1141)) (bvsge (size!28140 (_keys!10728 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950655 d!115457))

(declare-fun d!115459 () Bool)

(assert (=> d!115459 (= (array_inv!21553 (_values!5791 thiss!1141)) (bvsge (size!28139 (_values!5791 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950655 d!115459))

(declare-fun d!115461 () Bool)

(declare-fun res!637294 () Bool)

(declare-fun e!535374 () Bool)

(assert (=> d!115461 (=> (not res!637294) (not e!535374))))

(declare-fun simpleValid!372 (LongMapFixedSize!4918) Bool)

(assert (=> d!115461 (= res!637294 (simpleValid!372 thiss!1141))))

(assert (=> d!115461 (= (valid!1885 thiss!1141) e!535374)))

(declare-fun b!950811 () Bool)

(declare-fun res!637295 () Bool)

(assert (=> b!950811 (=> (not res!637295) (not e!535374))))

(declare-fun arrayCountValidKeys!0 (array!57529 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!950811 (= res!637295 (= (arrayCountValidKeys!0 (_keys!10728 thiss!1141) #b00000000000000000000000000000000 (size!28140 (_keys!10728 thiss!1141))) (_size!2514 thiss!1141)))))

(declare-fun b!950812 () Bool)

(declare-fun res!637296 () Bool)

(assert (=> b!950812 (=> (not res!637296) (not e!535374))))

(assert (=> b!950812 (= res!637296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10728 thiss!1141) (mask!27599 thiss!1141)))))

(declare-fun b!950813 () Bool)

(declare-datatypes ((List!19320 0))(
  ( (Nil!19317) (Cons!19316 (h!20482 (_ BitVec 64)) (t!27649 List!19320)) )
))
(declare-fun arrayNoDuplicates!0 (array!57529 (_ BitVec 32) List!19320) Bool)

(assert (=> b!950813 (= e!535374 (arrayNoDuplicates!0 (_keys!10728 thiss!1141) #b00000000000000000000000000000000 Nil!19317))))

(assert (= (and d!115461 res!637294) b!950811))

(assert (= (and b!950811 res!637295) b!950812))

(assert (= (and b!950812 res!637296) b!950813))

(declare-fun m!883793 () Bool)

(assert (=> d!115461 m!883793))

(declare-fun m!883795 () Bool)

(assert (=> b!950811 m!883795))

(assert (=> b!950812 m!883673))

(declare-fun m!883797 () Bool)

(assert (=> b!950813 m!883797))

(assert (=> start!81322 d!115461))

(declare-fun b!950826 () Bool)

(declare-fun e!535382 () SeekEntryResult!9097)

(assert (=> b!950826 (= e!535382 Undefined!9097)))

(declare-fun b!950827 () Bool)

(declare-fun e!535383 () SeekEntryResult!9097)

(assert (=> b!950827 (= e!535382 e!535383)))

(declare-fun lt!428190 () (_ BitVec 64))

(declare-fun lt!428191 () SeekEntryResult!9097)

(assert (=> b!950827 (= lt!428190 (select (arr!27662 (_keys!10728 thiss!1141)) (index!38761 lt!428191)))))

(declare-fun c!99462 () Bool)

(assert (=> b!950827 (= c!99462 (= lt!428190 key!756))))

(declare-fun b!950828 () Bool)

(declare-fun e!535381 () SeekEntryResult!9097)

(declare-fun lt!428189 () SeekEntryResult!9097)

(assert (=> b!950828 (= e!535381 (ite ((_ is MissingVacant!9097) lt!428189) (MissingZero!9097 (index!38762 lt!428189)) lt!428189))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57529 (_ BitVec 32)) SeekEntryResult!9097)

(assert (=> b!950828 (= lt!428189 (seekKeyOrZeroReturnVacant!0 (x!81685 lt!428191) (index!38761 lt!428191) (index!38761 lt!428191) key!756 (_keys!10728 thiss!1141) (mask!27599 thiss!1141)))))

(declare-fun b!950829 () Bool)

(declare-fun c!99461 () Bool)

(assert (=> b!950829 (= c!99461 (= lt!428190 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!950829 (= e!535383 e!535381)))

(declare-fun b!950830 () Bool)

(assert (=> b!950830 (= e!535383 (Found!9097 (index!38761 lt!428191)))))

(declare-fun d!115463 () Bool)

(declare-fun lt!428188 () SeekEntryResult!9097)

(assert (=> d!115463 (and (or ((_ is MissingVacant!9097) lt!428188) (not ((_ is Found!9097) lt!428188)) (and (bvsge (index!38760 lt!428188) #b00000000000000000000000000000000) (bvslt (index!38760 lt!428188) (size!28140 (_keys!10728 thiss!1141))))) (not ((_ is MissingVacant!9097) lt!428188)) (or (not ((_ is Found!9097) lt!428188)) (= (select (arr!27662 (_keys!10728 thiss!1141)) (index!38760 lt!428188)) key!756)))))

(assert (=> d!115463 (= lt!428188 e!535382)))

(declare-fun c!99463 () Bool)

(assert (=> d!115463 (= c!99463 (and ((_ is Intermediate!9097) lt!428191) (undefined!9909 lt!428191)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57529 (_ BitVec 32)) SeekEntryResult!9097)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115463 (= lt!428191 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27599 thiss!1141)) key!756 (_keys!10728 thiss!1141) (mask!27599 thiss!1141)))))

(assert (=> d!115463 (validMask!0 (mask!27599 thiss!1141))))

(assert (=> d!115463 (= (seekEntry!0 key!756 (_keys!10728 thiss!1141) (mask!27599 thiss!1141)) lt!428188)))

(declare-fun b!950831 () Bool)

(assert (=> b!950831 (= e!535381 (MissingZero!9097 (index!38761 lt!428191)))))

(assert (= (and d!115463 c!99463) b!950826))

(assert (= (and d!115463 (not c!99463)) b!950827))

(assert (= (and b!950827 c!99462) b!950830))

(assert (= (and b!950827 (not c!99462)) b!950829))

(assert (= (and b!950829 c!99461) b!950831))

(assert (= (and b!950829 (not c!99461)) b!950828))

(declare-fun m!883799 () Bool)

(assert (=> b!950827 m!883799))

(declare-fun m!883801 () Bool)

(assert (=> b!950828 m!883801))

(declare-fun m!883803 () Bool)

(assert (=> d!115463 m!883803))

(declare-fun m!883805 () Bool)

(assert (=> d!115463 m!883805))

(assert (=> d!115463 m!883805))

(declare-fun m!883807 () Bool)

(assert (=> d!115463 m!883807))

(assert (=> d!115463 m!883665))

(assert (=> b!950652 d!115463))

(declare-fun b!950839 () Bool)

(declare-fun e!535389 () Bool)

(assert (=> b!950839 (= e!535389 tp_is_empty!20731)))

(declare-fun condMapEmpty!33011 () Bool)

(declare-fun mapDefault!33011 () ValueCell!9884)

(assert (=> mapNonEmpty!33002 (= condMapEmpty!33011 (= mapRest!33002 ((as const (Array (_ BitVec 32) ValueCell!9884)) mapDefault!33011)))))

(declare-fun mapRes!33011 () Bool)

(assert (=> mapNonEmpty!33002 (= tp!63259 (and e!535389 mapRes!33011))))

(declare-fun mapIsEmpty!33011 () Bool)

(assert (=> mapIsEmpty!33011 mapRes!33011))

(declare-fun mapNonEmpty!33011 () Bool)

(declare-fun tp!63275 () Bool)

(declare-fun e!535388 () Bool)

(assert (=> mapNonEmpty!33011 (= mapRes!33011 (and tp!63275 e!535388))))

(declare-fun mapRest!33011 () (Array (_ BitVec 32) ValueCell!9884))

(declare-fun mapValue!33011 () ValueCell!9884)

(declare-fun mapKey!33011 () (_ BitVec 32))

(assert (=> mapNonEmpty!33011 (= mapRest!33002 (store mapRest!33011 mapKey!33011 mapValue!33011))))

(declare-fun b!950838 () Bool)

(assert (=> b!950838 (= e!535388 tp_is_empty!20731)))

(assert (= (and mapNonEmpty!33002 condMapEmpty!33011) mapIsEmpty!33011))

(assert (= (and mapNonEmpty!33002 (not condMapEmpty!33011)) mapNonEmpty!33011))

(assert (= (and mapNonEmpty!33011 ((_ is ValueCellFull!9884) mapValue!33011)) b!950838))

(assert (= (and mapNonEmpty!33002 ((_ is ValueCellFull!9884) mapDefault!33011)) b!950839))

(declare-fun m!883809 () Bool)

(assert (=> mapNonEmpty!33011 m!883809))

(declare-fun b_lambda!14375 () Bool)

(assert (= b_lambda!14373 (or (and b!950655 b_free!18223) b_lambda!14375)))

(check-sat (not b!950786) (not bm!41384) (not b!950729) (not d!115453) (not b!950801) (not d!115455) (not b!950813) (not b!950811) (not b_lambda!14375) (not bm!41381) (not d!115461) (not bm!41382) (not b!950789) (not b!950790) b_and!29691 (not mapNonEmpty!33011) (not b!950739) (not b!950828) (not b!950737) (not b!950798) (not b!950783) (not bm!41364) (not b_next!18223) tp_is_empty!20731 (not bm!41383) (not d!115463) (not b!950812) (not b!950728) (not b!950797) (not b!950802))
(check-sat b_and!29691 (not b_next!18223))
