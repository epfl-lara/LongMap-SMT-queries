; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80900 () Bool)

(assert start!80900)

(declare-fun b!947700 () Bool)

(declare-fun b_free!18151 () Bool)

(declare-fun b_next!18151 () Bool)

(assert (=> b!947700 (= b_free!18151 (not b_next!18151))))

(declare-fun tp!63002 () Bool)

(declare-fun b_and!29583 () Bool)

(assert (=> b!947700 (= tp!63002 b_and!29583)))

(declare-fun b!947698 () Bool)

(declare-fun e!533373 () Bool)

(declare-fun e!533370 () Bool)

(assert (=> b!947698 (= e!533373 (not e!533370))))

(declare-fun res!635870 () Bool)

(assert (=> b!947698 (=> res!635870 e!533370)))

(declare-datatypes ((V!32511 0))(
  ( (V!32512 (val!10380 Int)) )
))
(declare-datatypes ((ValueCell!9848 0))(
  ( (ValueCellFull!9848 (v!12911 V!32511)) (EmptyCell!9848) )
))
(declare-datatypes ((array!57359 0))(
  ( (array!57360 (arr!27589 (Array (_ BitVec 32) ValueCell!9848)) (size!28062 (_ BitVec 32))) )
))
(declare-datatypes ((array!57361 0))(
  ( (array!57362 (arr!27590 (Array (_ BitVec 32) (_ BitVec 64))) (size!28063 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4846 0))(
  ( (LongMapFixedSize!4847 (defaultEntry!5720 Int) (mask!27480 (_ BitVec 32)) (extraKeys!5452 (_ BitVec 32)) (zeroValue!5556 V!32511) (minValue!5556 V!32511) (_size!2478 (_ BitVec 32)) (_keys!10649 array!57361) (_values!5743 array!57359) (_vacant!2478 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4846)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!947698 (= res!635870 (not (validMask!0 (mask!27480 thiss!1141))))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!57361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!947698 (arrayContainsKey!0 (_keys!10649 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31891 0))(
  ( (Unit!31892) )
))
(declare-fun lt!426760 () Unit!31891)

(declare-datatypes ((SeekEntryResult!9067 0))(
  ( (MissingZero!9067 (index!38639 (_ BitVec 32))) (Found!9067 (index!38640 (_ BitVec 32))) (Intermediate!9067 (undefined!9879 Bool) (index!38641 (_ BitVec 32)) (x!81408 (_ BitVec 32))) (Undefined!9067) (MissingVacant!9067 (index!38642 (_ BitVec 32))) )
))
(declare-fun lt!426759 () SeekEntryResult!9067)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57361 (_ BitVec 64) (_ BitVec 32)) Unit!31891)

(assert (=> b!947698 (= lt!426760 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10649 thiss!1141) key!756 (index!38640 lt!426759)))))

(declare-fun b!947699 () Bool)

(declare-fun e!533372 () Bool)

(declare-fun tp_is_empty!20659 () Bool)

(assert (=> b!947699 (= e!533372 tp_is_empty!20659)))

(declare-fun e!533368 () Bool)

(declare-fun e!533369 () Bool)

(declare-fun array_inv!21510 (array!57361) Bool)

(declare-fun array_inv!21511 (array!57359) Bool)

(assert (=> b!947700 (= e!533369 (and tp!63002 tp_is_empty!20659 (array_inv!21510 (_keys!10649 thiss!1141)) (array_inv!21511 (_values!5743 thiss!1141)) e!533368))))

(declare-fun b!947701 () Bool)

(declare-fun e!533367 () Bool)

(assert (=> b!947701 (= e!533367 tp_is_empty!20659)))

(declare-fun res!635868 () Bool)

(declare-fun e!533374 () Bool)

(assert (=> start!80900 (=> (not res!635868) (not e!533374))))

(declare-fun valid!1856 (LongMapFixedSize!4846) Bool)

(assert (=> start!80900 (= res!635868 (valid!1856 thiss!1141))))

(assert (=> start!80900 e!533374))

(assert (=> start!80900 e!533369))

(assert (=> start!80900 true))

(declare-fun mapIsEmpty!32853 () Bool)

(declare-fun mapRes!32853 () Bool)

(assert (=> mapIsEmpty!32853 mapRes!32853))

(declare-fun b!947702 () Bool)

(assert (=> b!947702 (= e!533368 (and e!533372 mapRes!32853))))

(declare-fun condMapEmpty!32853 () Bool)

(declare-fun mapDefault!32853 () ValueCell!9848)

(assert (=> b!947702 (= condMapEmpty!32853 (= (arr!27589 (_values!5743 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9848)) mapDefault!32853)))))

(declare-fun b!947703 () Bool)

(assert (=> b!947703 (= e!533374 e!533373)))

(declare-fun res!635871 () Bool)

(assert (=> b!947703 (=> (not res!635871) (not e!533373))))

(get-info :version)

(assert (=> b!947703 (= res!635871 ((_ is Found!9067) lt!426759))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57361 (_ BitVec 32)) SeekEntryResult!9067)

(assert (=> b!947703 (= lt!426759 (seekEntry!0 key!756 (_keys!10649 thiss!1141) (mask!27480 thiss!1141)))))

(declare-fun mapNonEmpty!32853 () Bool)

(declare-fun tp!63003 () Bool)

(assert (=> mapNonEmpty!32853 (= mapRes!32853 (and tp!63003 e!533367))))

(declare-fun mapRest!32853 () (Array (_ BitVec 32) ValueCell!9848))

(declare-fun mapValue!32853 () ValueCell!9848)

(declare-fun mapKey!32853 () (_ BitVec 32))

(assert (=> mapNonEmpty!32853 (= (arr!27589 (_values!5743 thiss!1141)) (store mapRest!32853 mapKey!32853 mapValue!32853))))

(declare-fun b!947704 () Bool)

(declare-fun res!635869 () Bool)

(assert (=> b!947704 (=> (not res!635869) (not e!533374))))

(assert (=> b!947704 (= res!635869 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!947705 () Bool)

(assert (=> b!947705 (= e!533370 (or (not (= (size!28062 (_values!5743 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27480 thiss!1141)))) (not (= (size!28063 (_keys!10649 thiss!1141)) (size!28062 (_values!5743 thiss!1141)))) (bvslt (mask!27480 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5452 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5452 thiss!1141) #b00000000000000000000000000000011)))))

(assert (= (and start!80900 res!635868) b!947704))

(assert (= (and b!947704 res!635869) b!947703))

(assert (= (and b!947703 res!635871) b!947698))

(assert (= (and b!947698 (not res!635870)) b!947705))

(assert (= (and b!947702 condMapEmpty!32853) mapIsEmpty!32853))

(assert (= (and b!947702 (not condMapEmpty!32853)) mapNonEmpty!32853))

(assert (= (and mapNonEmpty!32853 ((_ is ValueCellFull!9848) mapValue!32853)) b!947701))

(assert (= (and b!947702 ((_ is ValueCellFull!9848) mapDefault!32853)) b!947699))

(assert (= b!947700 b!947702))

(assert (= start!80900 b!947700))

(declare-fun m!881307 () Bool)

(assert (=> b!947703 m!881307))

(declare-fun m!881309 () Bool)

(assert (=> b!947698 m!881309))

(declare-fun m!881311 () Bool)

(assert (=> b!947698 m!881311))

(declare-fun m!881313 () Bool)

(assert (=> b!947698 m!881313))

(declare-fun m!881315 () Bool)

(assert (=> mapNonEmpty!32853 m!881315))

(declare-fun m!881317 () Bool)

(assert (=> start!80900 m!881317))

(declare-fun m!881319 () Bool)

(assert (=> b!947700 m!881319))

(declare-fun m!881321 () Bool)

(assert (=> b!947700 m!881321))

(check-sat (not b!947700) (not b!947698) (not mapNonEmpty!32853) (not b_next!18151) tp_is_empty!20659 b_and!29583 (not start!80900) (not b!947703))
(check-sat b_and!29583 (not b_next!18151))
(get-model)

(declare-fun d!114919 () Bool)

(assert (=> d!114919 (= (array_inv!21510 (_keys!10649 thiss!1141)) (bvsge (size!28063 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947700 d!114919))

(declare-fun d!114921 () Bool)

(assert (=> d!114921 (= (array_inv!21511 (_values!5743 thiss!1141)) (bvsge (size!28062 (_values!5743 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947700 d!114921))

(declare-fun d!114923 () Bool)

(assert (=> d!114923 (= (validMask!0 (mask!27480 thiss!1141)) (and (or (= (mask!27480 thiss!1141) #b00000000000000000000000000000111) (= (mask!27480 thiss!1141) #b00000000000000000000000000001111) (= (mask!27480 thiss!1141) #b00000000000000000000000000011111) (= (mask!27480 thiss!1141) #b00000000000000000000000000111111) (= (mask!27480 thiss!1141) #b00000000000000000000000001111111) (= (mask!27480 thiss!1141) #b00000000000000000000000011111111) (= (mask!27480 thiss!1141) #b00000000000000000000000111111111) (= (mask!27480 thiss!1141) #b00000000000000000000001111111111) (= (mask!27480 thiss!1141) #b00000000000000000000011111111111) (= (mask!27480 thiss!1141) #b00000000000000000000111111111111) (= (mask!27480 thiss!1141) #b00000000000000000001111111111111) (= (mask!27480 thiss!1141) #b00000000000000000011111111111111) (= (mask!27480 thiss!1141) #b00000000000000000111111111111111) (= (mask!27480 thiss!1141) #b00000000000000001111111111111111) (= (mask!27480 thiss!1141) #b00000000000000011111111111111111) (= (mask!27480 thiss!1141) #b00000000000000111111111111111111) (= (mask!27480 thiss!1141) #b00000000000001111111111111111111) (= (mask!27480 thiss!1141) #b00000000000011111111111111111111) (= (mask!27480 thiss!1141) #b00000000000111111111111111111111) (= (mask!27480 thiss!1141) #b00000000001111111111111111111111) (= (mask!27480 thiss!1141) #b00000000011111111111111111111111) (= (mask!27480 thiss!1141) #b00000000111111111111111111111111) (= (mask!27480 thiss!1141) #b00000001111111111111111111111111) (= (mask!27480 thiss!1141) #b00000011111111111111111111111111) (= (mask!27480 thiss!1141) #b00000111111111111111111111111111) (= (mask!27480 thiss!1141) #b00001111111111111111111111111111) (= (mask!27480 thiss!1141) #b00011111111111111111111111111111) (= (mask!27480 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27480 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!947698 d!114923))

(declare-fun d!114925 () Bool)

(declare-fun res!635900 () Bool)

(declare-fun e!533427 () Bool)

(assert (=> d!114925 (=> res!635900 e!533427)))

(assert (=> d!114925 (= res!635900 (= (select (arr!27590 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114925 (= (arrayContainsKey!0 (_keys!10649 thiss!1141) key!756 #b00000000000000000000000000000000) e!533427)))

(declare-fun b!947758 () Bool)

(declare-fun e!533428 () Bool)

(assert (=> b!947758 (= e!533427 e!533428)))

(declare-fun res!635901 () Bool)

(assert (=> b!947758 (=> (not res!635901) (not e!533428))))

(assert (=> b!947758 (= res!635901 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28063 (_keys!10649 thiss!1141))))))

(declare-fun b!947759 () Bool)

(assert (=> b!947759 (= e!533428 (arrayContainsKey!0 (_keys!10649 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114925 (not res!635900)) b!947758))

(assert (= (and b!947758 res!635901) b!947759))

(declare-fun m!881355 () Bool)

(assert (=> d!114925 m!881355))

(declare-fun m!881357 () Bool)

(assert (=> b!947759 m!881357))

(assert (=> b!947698 d!114925))

(declare-fun d!114927 () Bool)

(assert (=> d!114927 (arrayContainsKey!0 (_keys!10649 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426775 () Unit!31891)

(declare-fun choose!13 (array!57361 (_ BitVec 64) (_ BitVec 32)) Unit!31891)

(assert (=> d!114927 (= lt!426775 (choose!13 (_keys!10649 thiss!1141) key!756 (index!38640 lt!426759)))))

(assert (=> d!114927 (bvsge (index!38640 lt!426759) #b00000000000000000000000000000000)))

(assert (=> d!114927 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10649 thiss!1141) key!756 (index!38640 lt!426759)) lt!426775)))

(declare-fun bs!26628 () Bool)

(assert (= bs!26628 d!114927))

(assert (=> bs!26628 m!881311))

(declare-fun m!881359 () Bool)

(assert (=> bs!26628 m!881359))

(assert (=> b!947698 d!114927))

(declare-fun d!114929 () Bool)

(declare-fun res!635908 () Bool)

(declare-fun e!533431 () Bool)

(assert (=> d!114929 (=> (not res!635908) (not e!533431))))

(declare-fun simpleValid!360 (LongMapFixedSize!4846) Bool)

(assert (=> d!114929 (= res!635908 (simpleValid!360 thiss!1141))))

(assert (=> d!114929 (= (valid!1856 thiss!1141) e!533431)))

(declare-fun b!947766 () Bool)

(declare-fun res!635909 () Bool)

(assert (=> b!947766 (=> (not res!635909) (not e!533431))))

(declare-fun arrayCountValidKeys!0 (array!57361 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!947766 (= res!635909 (= (arrayCountValidKeys!0 (_keys!10649 thiss!1141) #b00000000000000000000000000000000 (size!28063 (_keys!10649 thiss!1141))) (_size!2478 thiss!1141)))))

(declare-fun b!947767 () Bool)

(declare-fun res!635910 () Bool)

(assert (=> b!947767 (=> (not res!635910) (not e!533431))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57361 (_ BitVec 32)) Bool)

(assert (=> b!947767 (= res!635910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10649 thiss!1141) (mask!27480 thiss!1141)))))

(declare-fun b!947768 () Bool)

(declare-datatypes ((List!19285 0))(
  ( (Nil!19282) (Cons!19281 (h!20442 (_ BitVec 64)) (t!27598 List!19285)) )
))
(declare-fun arrayNoDuplicates!0 (array!57361 (_ BitVec 32) List!19285) Bool)

(assert (=> b!947768 (= e!533431 (arrayNoDuplicates!0 (_keys!10649 thiss!1141) #b00000000000000000000000000000000 Nil!19282))))

(assert (= (and d!114929 res!635908) b!947766))

(assert (= (and b!947766 res!635909) b!947767))

(assert (= (and b!947767 res!635910) b!947768))

(declare-fun m!881361 () Bool)

(assert (=> d!114929 m!881361))

(declare-fun m!881363 () Bool)

(assert (=> b!947766 m!881363))

(declare-fun m!881365 () Bool)

(assert (=> b!947767 m!881365))

(declare-fun m!881367 () Bool)

(assert (=> b!947768 m!881367))

(assert (=> start!80900 d!114929))

(declare-fun b!947781 () Bool)

(declare-fun e!533439 () SeekEntryResult!9067)

(assert (=> b!947781 (= e!533439 Undefined!9067)))

(declare-fun b!947782 () Bool)

(declare-fun c!98911 () Bool)

(declare-fun lt!426784 () (_ BitVec 64))

(assert (=> b!947782 (= c!98911 (= lt!426784 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!533438 () SeekEntryResult!9067)

(declare-fun e!533440 () SeekEntryResult!9067)

(assert (=> b!947782 (= e!533438 e!533440)))

(declare-fun b!947783 () Bool)

(assert (=> b!947783 (= e!533439 e!533438)))

(declare-fun lt!426785 () SeekEntryResult!9067)

(assert (=> b!947783 (= lt!426784 (select (arr!27590 (_keys!10649 thiss!1141)) (index!38641 lt!426785)))))

(declare-fun c!98910 () Bool)

(assert (=> b!947783 (= c!98910 (= lt!426784 key!756))))

(declare-fun b!947785 () Bool)

(declare-fun lt!426787 () SeekEntryResult!9067)

(assert (=> b!947785 (= e!533440 (ite ((_ is MissingVacant!9067) lt!426787) (MissingZero!9067 (index!38642 lt!426787)) lt!426787))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57361 (_ BitVec 32)) SeekEntryResult!9067)

(assert (=> b!947785 (= lt!426787 (seekKeyOrZeroReturnVacant!0 (x!81408 lt!426785) (index!38641 lt!426785) (index!38641 lt!426785) key!756 (_keys!10649 thiss!1141) (mask!27480 thiss!1141)))))

(declare-fun b!947786 () Bool)

(assert (=> b!947786 (= e!533440 (MissingZero!9067 (index!38641 lt!426785)))))

(declare-fun b!947784 () Bool)

(assert (=> b!947784 (= e!533438 (Found!9067 (index!38641 lt!426785)))))

(declare-fun d!114931 () Bool)

(declare-fun lt!426786 () SeekEntryResult!9067)

(assert (=> d!114931 (and (or ((_ is MissingVacant!9067) lt!426786) (not ((_ is Found!9067) lt!426786)) (and (bvsge (index!38640 lt!426786) #b00000000000000000000000000000000) (bvslt (index!38640 lt!426786) (size!28063 (_keys!10649 thiss!1141))))) (not ((_ is MissingVacant!9067) lt!426786)) (or (not ((_ is Found!9067) lt!426786)) (= (select (arr!27590 (_keys!10649 thiss!1141)) (index!38640 lt!426786)) key!756)))))

(assert (=> d!114931 (= lt!426786 e!533439)))

(declare-fun c!98912 () Bool)

(assert (=> d!114931 (= c!98912 (and ((_ is Intermediate!9067) lt!426785) (undefined!9879 lt!426785)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57361 (_ BitVec 32)) SeekEntryResult!9067)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114931 (= lt!426785 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27480 thiss!1141)) key!756 (_keys!10649 thiss!1141) (mask!27480 thiss!1141)))))

(assert (=> d!114931 (validMask!0 (mask!27480 thiss!1141))))

(assert (=> d!114931 (= (seekEntry!0 key!756 (_keys!10649 thiss!1141) (mask!27480 thiss!1141)) lt!426786)))

(assert (= (and d!114931 c!98912) b!947781))

(assert (= (and d!114931 (not c!98912)) b!947783))

(assert (= (and b!947783 c!98910) b!947784))

(assert (= (and b!947783 (not c!98910)) b!947782))

(assert (= (and b!947782 c!98911) b!947786))

(assert (= (and b!947782 (not c!98911)) b!947785))

(declare-fun m!881369 () Bool)

(assert (=> b!947783 m!881369))

(declare-fun m!881371 () Bool)

(assert (=> b!947785 m!881371))

(declare-fun m!881373 () Bool)

(assert (=> d!114931 m!881373))

(declare-fun m!881375 () Bool)

(assert (=> d!114931 m!881375))

(assert (=> d!114931 m!881375))

(declare-fun m!881377 () Bool)

(assert (=> d!114931 m!881377))

(assert (=> d!114931 m!881309))

(assert (=> b!947703 d!114931))

(declare-fun b!947794 () Bool)

(declare-fun e!533446 () Bool)

(assert (=> b!947794 (= e!533446 tp_is_empty!20659)))

(declare-fun b!947793 () Bool)

(declare-fun e!533445 () Bool)

(assert (=> b!947793 (= e!533445 tp_is_empty!20659)))

(declare-fun mapIsEmpty!32862 () Bool)

(declare-fun mapRes!32862 () Bool)

(assert (=> mapIsEmpty!32862 mapRes!32862))

(declare-fun condMapEmpty!32862 () Bool)

(declare-fun mapDefault!32862 () ValueCell!9848)

(assert (=> mapNonEmpty!32853 (= condMapEmpty!32862 (= mapRest!32853 ((as const (Array (_ BitVec 32) ValueCell!9848)) mapDefault!32862)))))

(assert (=> mapNonEmpty!32853 (= tp!63003 (and e!533446 mapRes!32862))))

(declare-fun mapNonEmpty!32862 () Bool)

(declare-fun tp!63018 () Bool)

(assert (=> mapNonEmpty!32862 (= mapRes!32862 (and tp!63018 e!533445))))

(declare-fun mapKey!32862 () (_ BitVec 32))

(declare-fun mapValue!32862 () ValueCell!9848)

(declare-fun mapRest!32862 () (Array (_ BitVec 32) ValueCell!9848))

(assert (=> mapNonEmpty!32862 (= mapRest!32853 (store mapRest!32862 mapKey!32862 mapValue!32862))))

(assert (= (and mapNonEmpty!32853 condMapEmpty!32862) mapIsEmpty!32862))

(assert (= (and mapNonEmpty!32853 (not condMapEmpty!32862)) mapNonEmpty!32862))

(assert (= (and mapNonEmpty!32862 ((_ is ValueCellFull!9848) mapValue!32862)) b!947793))

(assert (= (and mapNonEmpty!32853 ((_ is ValueCellFull!9848) mapDefault!32862)) b!947794))

(declare-fun m!881379 () Bool)

(assert (=> mapNonEmpty!32862 m!881379))

(check-sat (not mapNonEmpty!32862) (not b!947766) (not b_next!18151) tp_is_empty!20659 (not b!947768) (not b!947759) b_and!29583 (not b!947785) (not d!114927) (not d!114931) (not d!114929) (not b!947767))
(check-sat b_and!29583 (not b_next!18151))
(get-model)

(assert (=> d!114927 d!114925))

(declare-fun d!114933 () Bool)

(assert (=> d!114933 (arrayContainsKey!0 (_keys!10649 thiss!1141) key!756 #b00000000000000000000000000000000)))

(assert (=> d!114933 true))

(declare-fun _$60!439 () Unit!31891)

(assert (=> d!114933 (= (choose!13 (_keys!10649 thiss!1141) key!756 (index!38640 lt!426759)) _$60!439)))

(declare-fun bs!26629 () Bool)

(assert (= bs!26629 d!114933))

(assert (=> bs!26629 m!881311))

(assert (=> d!114927 d!114933))

(declare-fun d!114935 () Bool)

(declare-fun res!635911 () Bool)

(declare-fun e!533447 () Bool)

(assert (=> d!114935 (=> res!635911 e!533447)))

(assert (=> d!114935 (= res!635911 (= (select (arr!27590 (_keys!10649 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!114935 (= (arrayContainsKey!0 (_keys!10649 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!533447)))

(declare-fun b!947795 () Bool)

(declare-fun e!533448 () Bool)

(assert (=> b!947795 (= e!533447 e!533448)))

(declare-fun res!635912 () Bool)

(assert (=> b!947795 (=> (not res!635912) (not e!533448))))

(assert (=> b!947795 (= res!635912 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!28063 (_keys!10649 thiss!1141))))))

(declare-fun b!947796 () Bool)

(assert (=> b!947796 (= e!533448 (arrayContainsKey!0 (_keys!10649 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!114935 (not res!635911)) b!947795))

(assert (= (and b!947795 res!635912) b!947796))

(declare-fun m!881381 () Bool)

(assert (=> d!114935 m!881381))

(declare-fun m!881383 () Bool)

(assert (=> b!947796 m!881383))

(assert (=> b!947759 d!114935))

(declare-fun bm!41139 () Bool)

(declare-fun call!41142 () Bool)

(declare-fun c!98915 () Bool)

(assert (=> bm!41139 (= call!41142 (arrayNoDuplicates!0 (_keys!10649 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98915 (Cons!19281 (select (arr!27590 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000) Nil!19282) Nil!19282)))))

(declare-fun b!947807 () Bool)

(declare-fun e!533458 () Bool)

(assert (=> b!947807 (= e!533458 call!41142)))

(declare-fun b!947808 () Bool)

(declare-fun e!533459 () Bool)

(declare-fun contains!5199 (List!19285 (_ BitVec 64)) Bool)

(assert (=> b!947808 (= e!533459 (contains!5199 Nil!19282 (select (arr!27590 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114937 () Bool)

(declare-fun res!635919 () Bool)

(declare-fun e!533457 () Bool)

(assert (=> d!114937 (=> res!635919 e!533457)))

(assert (=> d!114937 (= res!635919 (bvsge #b00000000000000000000000000000000 (size!28063 (_keys!10649 thiss!1141))))))

(assert (=> d!114937 (= (arrayNoDuplicates!0 (_keys!10649 thiss!1141) #b00000000000000000000000000000000 Nil!19282) e!533457)))

(declare-fun b!947809 () Bool)

(assert (=> b!947809 (= e!533458 call!41142)))

(declare-fun b!947810 () Bool)

(declare-fun e!533460 () Bool)

(assert (=> b!947810 (= e!533457 e!533460)))

(declare-fun res!635921 () Bool)

(assert (=> b!947810 (=> (not res!635921) (not e!533460))))

(assert (=> b!947810 (= res!635921 (not e!533459))))

(declare-fun res!635920 () Bool)

(assert (=> b!947810 (=> (not res!635920) (not e!533459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!947810 (= res!635920 (validKeyInArray!0 (select (arr!27590 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947811 () Bool)

(assert (=> b!947811 (= e!533460 e!533458)))

(assert (=> b!947811 (= c!98915 (validKeyInArray!0 (select (arr!27590 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114937 (not res!635919)) b!947810))

(assert (= (and b!947810 res!635920) b!947808))

(assert (= (and b!947810 res!635921) b!947811))

(assert (= (and b!947811 c!98915) b!947809))

(assert (= (and b!947811 (not c!98915)) b!947807))

(assert (= (or b!947809 b!947807) bm!41139))

(assert (=> bm!41139 m!881355))

(declare-fun m!881385 () Bool)

(assert (=> bm!41139 m!881385))

(assert (=> b!947808 m!881355))

(assert (=> b!947808 m!881355))

(declare-fun m!881387 () Bool)

(assert (=> b!947808 m!881387))

(assert (=> b!947810 m!881355))

(assert (=> b!947810 m!881355))

(declare-fun m!881389 () Bool)

(assert (=> b!947810 m!881389))

(assert (=> b!947811 m!881355))

(assert (=> b!947811 m!881355))

(assert (=> b!947811 m!881389))

(assert (=> b!947768 d!114937))

(declare-fun b!947820 () Bool)

(declare-fun e!533466 () (_ BitVec 32))

(declare-fun call!41145 () (_ BitVec 32))

(assert (=> b!947820 (= e!533466 (bvadd #b00000000000000000000000000000001 call!41145))))

(declare-fun b!947821 () Bool)

(assert (=> b!947821 (= e!533466 call!41145)))

(declare-fun bm!41142 () Bool)

(assert (=> bm!41142 (= call!41145 (arrayCountValidKeys!0 (_keys!10649 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28063 (_keys!10649 thiss!1141))))))

(declare-fun b!947822 () Bool)

(declare-fun e!533465 () (_ BitVec 32))

(assert (=> b!947822 (= e!533465 e!533466)))

(declare-fun c!98920 () Bool)

(assert (=> b!947822 (= c!98920 (validKeyInArray!0 (select (arr!27590 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114939 () Bool)

(declare-fun lt!426790 () (_ BitVec 32))

(assert (=> d!114939 (and (bvsge lt!426790 #b00000000000000000000000000000000) (bvsle lt!426790 (bvsub (size!28063 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114939 (= lt!426790 e!533465)))

(declare-fun c!98921 () Bool)

(assert (=> d!114939 (= c!98921 (bvsge #b00000000000000000000000000000000 (size!28063 (_keys!10649 thiss!1141))))))

(assert (=> d!114939 (and (bvsle #b00000000000000000000000000000000 (size!28063 (_keys!10649 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28063 (_keys!10649 thiss!1141)) (size!28063 (_keys!10649 thiss!1141))))))

(assert (=> d!114939 (= (arrayCountValidKeys!0 (_keys!10649 thiss!1141) #b00000000000000000000000000000000 (size!28063 (_keys!10649 thiss!1141))) lt!426790)))

(declare-fun b!947823 () Bool)

(assert (=> b!947823 (= e!533465 #b00000000000000000000000000000000)))

(assert (= (and d!114939 c!98921) b!947823))

(assert (= (and d!114939 (not c!98921)) b!947822))

(assert (= (and b!947822 c!98920) b!947820))

(assert (= (and b!947822 (not c!98920)) b!947821))

(assert (= (or b!947820 b!947821) bm!41142))

(declare-fun m!881391 () Bool)

(assert (=> bm!41142 m!881391))

(assert (=> b!947822 m!881355))

(assert (=> b!947822 m!881355))

(assert (=> b!947822 m!881389))

(assert (=> b!947766 d!114939))

(declare-fun b!947835 () Bool)

(declare-fun e!533469 () Bool)

(assert (=> b!947835 (= e!533469 (and (bvsge (extraKeys!5452 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5452 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2478 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun d!114941 () Bool)

(declare-fun res!635932 () Bool)

(assert (=> d!114941 (=> (not res!635932) (not e!533469))))

(assert (=> d!114941 (= res!635932 (validMask!0 (mask!27480 thiss!1141)))))

(assert (=> d!114941 (= (simpleValid!360 thiss!1141) e!533469)))

(declare-fun b!947834 () Bool)

(declare-fun res!635931 () Bool)

(assert (=> b!947834 (=> (not res!635931) (not e!533469))))

(declare-fun size!28068 (LongMapFixedSize!4846) (_ BitVec 32))

(assert (=> b!947834 (= res!635931 (= (size!28068 thiss!1141) (bvadd (_size!2478 thiss!1141) (bvsdiv (bvadd (extraKeys!5452 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!947833 () Bool)

(declare-fun res!635933 () Bool)

(assert (=> b!947833 (=> (not res!635933) (not e!533469))))

(assert (=> b!947833 (= res!635933 (bvsge (size!28068 thiss!1141) (_size!2478 thiss!1141)))))

(declare-fun b!947832 () Bool)

(declare-fun res!635930 () Bool)

(assert (=> b!947832 (=> (not res!635930) (not e!533469))))

(assert (=> b!947832 (= res!635930 (and (= (size!28062 (_values!5743 thiss!1141)) (bvadd (mask!27480 thiss!1141) #b00000000000000000000000000000001)) (= (size!28063 (_keys!10649 thiss!1141)) (size!28062 (_values!5743 thiss!1141))) (bvsge (_size!2478 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2478 thiss!1141) (bvadd (mask!27480 thiss!1141) #b00000000000000000000000000000001))))))

(assert (= (and d!114941 res!635932) b!947832))

(assert (= (and b!947832 res!635930) b!947833))

(assert (= (and b!947833 res!635933) b!947834))

(assert (= (and b!947834 res!635931) b!947835))

(assert (=> d!114941 m!881309))

(declare-fun m!881393 () Bool)

(assert (=> b!947834 m!881393))

(assert (=> b!947833 m!881393))

(assert (=> d!114929 d!114941))

(declare-fun e!533476 () SeekEntryResult!9067)

(declare-fun b!947848 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!947848 (= e!533476 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81408 lt!426785) #b00000000000000000000000000000001) (nextIndex!0 (index!38641 lt!426785) (bvadd (x!81408 lt!426785) #b00000000000000000000000000000001) (mask!27480 thiss!1141)) (index!38641 lt!426785) key!756 (_keys!10649 thiss!1141) (mask!27480 thiss!1141)))))

(declare-fun b!947850 () Bool)

(declare-fun e!533478 () SeekEntryResult!9067)

(declare-fun e!533477 () SeekEntryResult!9067)

(assert (=> b!947850 (= e!533478 e!533477)))

(declare-fun c!98928 () Bool)

(declare-fun lt!426796 () (_ BitVec 64))

(assert (=> b!947850 (= c!98928 (= lt!426796 key!756))))

(declare-fun b!947851 () Bool)

(assert (=> b!947851 (= e!533476 (MissingVacant!9067 (index!38641 lt!426785)))))

(declare-fun b!947852 () Bool)

(assert (=> b!947852 (= e!533477 (Found!9067 (index!38641 lt!426785)))))

(declare-fun b!947853 () Bool)

(assert (=> b!947853 (= e!533478 Undefined!9067)))

(declare-fun b!947849 () Bool)

(declare-fun c!98930 () Bool)

(assert (=> b!947849 (= c!98930 (= lt!426796 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!947849 (= e!533477 e!533476)))

(declare-fun lt!426795 () SeekEntryResult!9067)

(declare-fun d!114943 () Bool)

(assert (=> d!114943 (and (or ((_ is Undefined!9067) lt!426795) (not ((_ is Found!9067) lt!426795)) (and (bvsge (index!38640 lt!426795) #b00000000000000000000000000000000) (bvslt (index!38640 lt!426795) (size!28063 (_keys!10649 thiss!1141))))) (or ((_ is Undefined!9067) lt!426795) ((_ is Found!9067) lt!426795) (not ((_ is MissingVacant!9067) lt!426795)) (not (= (index!38642 lt!426795) (index!38641 lt!426785))) (and (bvsge (index!38642 lt!426795) #b00000000000000000000000000000000) (bvslt (index!38642 lt!426795) (size!28063 (_keys!10649 thiss!1141))))) (or ((_ is Undefined!9067) lt!426795) (ite ((_ is Found!9067) lt!426795) (= (select (arr!27590 (_keys!10649 thiss!1141)) (index!38640 lt!426795)) key!756) (and ((_ is MissingVacant!9067) lt!426795) (= (index!38642 lt!426795) (index!38641 lt!426785)) (= (select (arr!27590 (_keys!10649 thiss!1141)) (index!38642 lt!426795)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!114943 (= lt!426795 e!533478)))

(declare-fun c!98929 () Bool)

(assert (=> d!114943 (= c!98929 (bvsge (x!81408 lt!426785) #b01111111111111111111111111111110))))

(assert (=> d!114943 (= lt!426796 (select (arr!27590 (_keys!10649 thiss!1141)) (index!38641 lt!426785)))))

(assert (=> d!114943 (validMask!0 (mask!27480 thiss!1141))))

(assert (=> d!114943 (= (seekKeyOrZeroReturnVacant!0 (x!81408 lt!426785) (index!38641 lt!426785) (index!38641 lt!426785) key!756 (_keys!10649 thiss!1141) (mask!27480 thiss!1141)) lt!426795)))

(assert (= (and d!114943 c!98929) b!947853))

(assert (= (and d!114943 (not c!98929)) b!947850))

(assert (= (and b!947850 c!98928) b!947852))

(assert (= (and b!947850 (not c!98928)) b!947849))

(assert (= (and b!947849 c!98930) b!947851))

(assert (= (and b!947849 (not c!98930)) b!947848))

(declare-fun m!881395 () Bool)

(assert (=> b!947848 m!881395))

(assert (=> b!947848 m!881395))

(declare-fun m!881397 () Bool)

(assert (=> b!947848 m!881397))

(declare-fun m!881399 () Bool)

(assert (=> d!114943 m!881399))

(declare-fun m!881401 () Bool)

(assert (=> d!114943 m!881401))

(assert (=> d!114943 m!881369))

(assert (=> d!114943 m!881309))

(assert (=> b!947785 d!114943))

(declare-fun bm!41145 () Bool)

(declare-fun call!41148 () Bool)

(assert (=> bm!41145 (= call!41148 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10649 thiss!1141) (mask!27480 thiss!1141)))))

(declare-fun d!114945 () Bool)

(declare-fun res!635939 () Bool)

(declare-fun e!533487 () Bool)

(assert (=> d!114945 (=> res!635939 e!533487)))

(assert (=> d!114945 (= res!635939 (bvsge #b00000000000000000000000000000000 (size!28063 (_keys!10649 thiss!1141))))))

(assert (=> d!114945 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10649 thiss!1141) (mask!27480 thiss!1141)) e!533487)))

(declare-fun b!947862 () Bool)

(declare-fun e!533486 () Bool)

(declare-fun e!533485 () Bool)

(assert (=> b!947862 (= e!533486 e!533485)))

(declare-fun lt!426804 () (_ BitVec 64))

(assert (=> b!947862 (= lt!426804 (select (arr!27590 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426805 () Unit!31891)

(assert (=> b!947862 (= lt!426805 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10649 thiss!1141) lt!426804 #b00000000000000000000000000000000))))

(assert (=> b!947862 (arrayContainsKey!0 (_keys!10649 thiss!1141) lt!426804 #b00000000000000000000000000000000)))

(declare-fun lt!426803 () Unit!31891)

(assert (=> b!947862 (= lt!426803 lt!426805)))

(declare-fun res!635938 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57361 (_ BitVec 32)) SeekEntryResult!9067)

(assert (=> b!947862 (= res!635938 (= (seekEntryOrOpen!0 (select (arr!27590 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000) (_keys!10649 thiss!1141) (mask!27480 thiss!1141)) (Found!9067 #b00000000000000000000000000000000)))))

(assert (=> b!947862 (=> (not res!635938) (not e!533485))))

(declare-fun b!947863 () Bool)

(assert (=> b!947863 (= e!533486 call!41148)))

(declare-fun b!947864 () Bool)

(assert (=> b!947864 (= e!533485 call!41148)))

(declare-fun b!947865 () Bool)

(assert (=> b!947865 (= e!533487 e!533486)))

(declare-fun c!98933 () Bool)

(assert (=> b!947865 (= c!98933 (validKeyInArray!0 (select (arr!27590 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114945 (not res!635939)) b!947865))

(assert (= (and b!947865 c!98933) b!947862))

(assert (= (and b!947865 (not c!98933)) b!947863))

(assert (= (and b!947862 res!635938) b!947864))

(assert (= (or b!947864 b!947863) bm!41145))

(declare-fun m!881403 () Bool)

(assert (=> bm!41145 m!881403))

(assert (=> b!947862 m!881355))

(declare-fun m!881405 () Bool)

(assert (=> b!947862 m!881405))

(declare-fun m!881407 () Bool)

(assert (=> b!947862 m!881407))

(assert (=> b!947862 m!881355))

(declare-fun m!881409 () Bool)

(assert (=> b!947862 m!881409))

(assert (=> b!947865 m!881355))

(assert (=> b!947865 m!881355))

(assert (=> b!947865 m!881389))

(assert (=> b!947767 d!114945))

(declare-fun b!947884 () Bool)

(declare-fun e!533498 () SeekEntryResult!9067)

(declare-fun e!533499 () SeekEntryResult!9067)

(assert (=> b!947884 (= e!533498 e!533499)))

(declare-fun c!98942 () Bool)

(declare-fun lt!426811 () (_ BitVec 64))

(assert (=> b!947884 (= c!98942 (or (= lt!426811 key!756) (= (bvadd lt!426811 lt!426811) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!947885 () Bool)

(assert (=> b!947885 (= e!533499 (Intermediate!9067 false (toIndex!0 key!756 (mask!27480 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!947886 () Bool)

(assert (=> b!947886 (= e!533499 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27480 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!27480 thiss!1141)) key!756 (_keys!10649 thiss!1141) (mask!27480 thiss!1141)))))

(declare-fun b!947887 () Bool)

(declare-fun lt!426810 () SeekEntryResult!9067)

(assert (=> b!947887 (and (bvsge (index!38641 lt!426810) #b00000000000000000000000000000000) (bvslt (index!38641 lt!426810) (size!28063 (_keys!10649 thiss!1141))))))

(declare-fun res!635947 () Bool)

(assert (=> b!947887 (= res!635947 (= (select (arr!27590 (_keys!10649 thiss!1141)) (index!38641 lt!426810)) key!756))))

(declare-fun e!533500 () Bool)

(assert (=> b!947887 (=> res!635947 e!533500)))

(declare-fun e!533502 () Bool)

(assert (=> b!947887 (= e!533502 e!533500)))

(declare-fun b!947888 () Bool)

(assert (=> b!947888 (and (bvsge (index!38641 lt!426810) #b00000000000000000000000000000000) (bvslt (index!38641 lt!426810) (size!28063 (_keys!10649 thiss!1141))))))

(assert (=> b!947888 (= e!533500 (= (select (arr!27590 (_keys!10649 thiss!1141)) (index!38641 lt!426810)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!947889 () Bool)

(declare-fun e!533501 () Bool)

(assert (=> b!947889 (= e!533501 (bvsge (x!81408 lt!426810) #b01111111111111111111111111111110))))

(declare-fun b!947890 () Bool)

(assert (=> b!947890 (and (bvsge (index!38641 lt!426810) #b00000000000000000000000000000000) (bvslt (index!38641 lt!426810) (size!28063 (_keys!10649 thiss!1141))))))

(declare-fun res!635948 () Bool)

(assert (=> b!947890 (= res!635948 (= (select (arr!27590 (_keys!10649 thiss!1141)) (index!38641 lt!426810)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!947890 (=> res!635948 e!533500)))

(declare-fun d!114947 () Bool)

(assert (=> d!114947 e!533501))

(declare-fun c!98941 () Bool)

(assert (=> d!114947 (= c!98941 (and ((_ is Intermediate!9067) lt!426810) (undefined!9879 lt!426810)))))

(assert (=> d!114947 (= lt!426810 e!533498)))

(declare-fun c!98940 () Bool)

(assert (=> d!114947 (= c!98940 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!114947 (= lt!426811 (select (arr!27590 (_keys!10649 thiss!1141)) (toIndex!0 key!756 (mask!27480 thiss!1141))))))

(assert (=> d!114947 (validMask!0 (mask!27480 thiss!1141))))

(assert (=> d!114947 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27480 thiss!1141)) key!756 (_keys!10649 thiss!1141) (mask!27480 thiss!1141)) lt!426810)))

(declare-fun b!947891 () Bool)

(assert (=> b!947891 (= e!533498 (Intermediate!9067 true (toIndex!0 key!756 (mask!27480 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!947892 () Bool)

(assert (=> b!947892 (= e!533501 e!533502)))

(declare-fun res!635946 () Bool)

(assert (=> b!947892 (= res!635946 (and ((_ is Intermediate!9067) lt!426810) (not (undefined!9879 lt!426810)) (bvslt (x!81408 lt!426810) #b01111111111111111111111111111110) (bvsge (x!81408 lt!426810) #b00000000000000000000000000000000) (bvsge (x!81408 lt!426810) #b00000000000000000000000000000000)))))

(assert (=> b!947892 (=> (not res!635946) (not e!533502))))

(assert (= (and d!114947 c!98940) b!947891))

(assert (= (and d!114947 (not c!98940)) b!947884))

(assert (= (and b!947884 c!98942) b!947885))

(assert (= (and b!947884 (not c!98942)) b!947886))

(assert (= (and d!114947 c!98941) b!947889))

(assert (= (and d!114947 (not c!98941)) b!947892))

(assert (= (and b!947892 res!635946) b!947887))

(assert (= (and b!947887 (not res!635947)) b!947890))

(assert (= (and b!947890 (not res!635948)) b!947888))

(assert (=> d!114947 m!881375))

(declare-fun m!881411 () Bool)

(assert (=> d!114947 m!881411))

(assert (=> d!114947 m!881309))

(declare-fun m!881413 () Bool)

(assert (=> b!947890 m!881413))

(assert (=> b!947886 m!881375))

(declare-fun m!881415 () Bool)

(assert (=> b!947886 m!881415))

(assert (=> b!947886 m!881415))

(declare-fun m!881417 () Bool)

(assert (=> b!947886 m!881417))

(assert (=> b!947887 m!881413))

(assert (=> b!947888 m!881413))

(assert (=> d!114931 d!114947))

(declare-fun d!114949 () Bool)

(declare-fun lt!426817 () (_ BitVec 32))

(declare-fun lt!426816 () (_ BitVec 32))

(assert (=> d!114949 (= lt!426817 (bvmul (bvxor lt!426816 (bvlshr lt!426816 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114949 (= lt!426816 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114949 (and (bvsge (mask!27480 thiss!1141) #b00000000000000000000000000000000) (let ((res!635949 (let ((h!20443 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81427 (bvmul (bvxor h!20443 (bvlshr h!20443 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81427 (bvlshr x!81427 #b00000000000000000000000000001101)) (mask!27480 thiss!1141)))))) (and (bvslt res!635949 (bvadd (mask!27480 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!635949 #b00000000000000000000000000000000))))))

(assert (=> d!114949 (= (toIndex!0 key!756 (mask!27480 thiss!1141)) (bvand (bvxor lt!426817 (bvlshr lt!426817 #b00000000000000000000000000001101)) (mask!27480 thiss!1141)))))

(assert (=> d!114931 d!114949))

(assert (=> d!114931 d!114923))

(declare-fun b!947894 () Bool)

(declare-fun e!533504 () Bool)

(assert (=> b!947894 (= e!533504 tp_is_empty!20659)))

(declare-fun b!947893 () Bool)

(declare-fun e!533503 () Bool)

(assert (=> b!947893 (= e!533503 tp_is_empty!20659)))

(declare-fun mapIsEmpty!32863 () Bool)

(declare-fun mapRes!32863 () Bool)

(assert (=> mapIsEmpty!32863 mapRes!32863))

(declare-fun condMapEmpty!32863 () Bool)

(declare-fun mapDefault!32863 () ValueCell!9848)

(assert (=> mapNonEmpty!32862 (= condMapEmpty!32863 (= mapRest!32862 ((as const (Array (_ BitVec 32) ValueCell!9848)) mapDefault!32863)))))

(assert (=> mapNonEmpty!32862 (= tp!63018 (and e!533504 mapRes!32863))))

(declare-fun mapNonEmpty!32863 () Bool)

(declare-fun tp!63019 () Bool)

(assert (=> mapNonEmpty!32863 (= mapRes!32863 (and tp!63019 e!533503))))

(declare-fun mapRest!32863 () (Array (_ BitVec 32) ValueCell!9848))

(declare-fun mapValue!32863 () ValueCell!9848)

(declare-fun mapKey!32863 () (_ BitVec 32))

(assert (=> mapNonEmpty!32863 (= mapRest!32862 (store mapRest!32863 mapKey!32863 mapValue!32863))))

(assert (= (and mapNonEmpty!32862 condMapEmpty!32863) mapIsEmpty!32863))

(assert (= (and mapNonEmpty!32862 (not condMapEmpty!32863)) mapNonEmpty!32863))

(assert (= (and mapNonEmpty!32863 ((_ is ValueCellFull!9848) mapValue!32863)) b!947893))

(assert (= (and mapNonEmpty!32862 ((_ is ValueCellFull!9848) mapDefault!32863)) b!947894))

(declare-fun m!881419 () Bool)

(assert (=> mapNonEmpty!32863 m!881419))

(check-sat (not b!947810) (not bm!41139) (not b!947822) (not mapNonEmpty!32863) (not d!114947) (not b!947796) tp_is_empty!20659 (not b!947886) (not d!114943) (not b!947862) (not d!114933) (not b!947811) (not d!114941) (not b!947865) (not b!947808) (not bm!41142) (not b!947848) (not b!947833) (not b_next!18151) (not bm!41145) (not b!947834) b_and!29583)
(check-sat b_and!29583 (not b_next!18151))
