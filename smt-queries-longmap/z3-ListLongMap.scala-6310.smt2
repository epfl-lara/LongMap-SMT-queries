; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80866 () Bool)

(assert start!80866)

(declare-fun b!947668 () Bool)

(declare-fun b_free!18183 () Bool)

(declare-fun b_next!18183 () Bool)

(assert (=> b!947668 (= b_free!18183 (not b_next!18183))))

(declare-fun tp!63113 () Bool)

(declare-fun b_and!29605 () Bool)

(assert (=> b!947668 (= tp!63113 b_and!29605)))

(declare-fun b!947662 () Bool)

(declare-fun e!533414 () Bool)

(declare-fun e!533416 () Bool)

(declare-fun mapRes!32917 () Bool)

(assert (=> b!947662 (= e!533414 (and e!533416 mapRes!32917))))

(declare-fun condMapEmpty!32917 () Bool)

(declare-datatypes ((V!32553 0))(
  ( (V!32554 (val!10396 Int)) )
))
(declare-datatypes ((ValueCell!9864 0))(
  ( (ValueCellFull!9864 (v!12930 V!32553)) (EmptyCell!9864) )
))
(declare-datatypes ((array!57382 0))(
  ( (array!57383 (arr!27600 (Array (_ BitVec 32) ValueCell!9864)) (size!28073 (_ BitVec 32))) )
))
(declare-datatypes ((array!57384 0))(
  ( (array!57385 (arr!27601 (Array (_ BitVec 32) (_ BitVec 64))) (size!28074 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4878 0))(
  ( (LongMapFixedSize!4879 (defaultEntry!5736 Int) (mask!27481 (_ BitVec 32)) (extraKeys!5468 (_ BitVec 32)) (zeroValue!5572 V!32553) (minValue!5572 V!32553) (_size!2494 (_ BitVec 32)) (_keys!10649 array!57384) (_values!5759 array!57382) (_vacant!2494 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4878)

(declare-fun mapDefault!32917 () ValueCell!9864)

(assert (=> b!947662 (= condMapEmpty!32917 (= (arr!27600 (_values!5759 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9864)) mapDefault!32917)))))

(declare-fun mapNonEmpty!32917 () Bool)

(declare-fun tp!63114 () Bool)

(declare-fun e!533420 () Bool)

(assert (=> mapNonEmpty!32917 (= mapRes!32917 (and tp!63114 e!533420))))

(declare-fun mapValue!32917 () ValueCell!9864)

(declare-fun mapRest!32917 () (Array (_ BitVec 32) ValueCell!9864))

(declare-fun mapKey!32917 () (_ BitVec 32))

(assert (=> mapNonEmpty!32917 (= (arr!27600 (_values!5759 thiss!1141)) (store mapRest!32917 mapKey!32917 mapValue!32917))))

(declare-fun mapIsEmpty!32917 () Bool)

(assert (=> mapIsEmpty!32917 mapRes!32917))

(declare-fun b!947663 () Bool)

(declare-fun e!533418 () Bool)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13512 0))(
  ( (tuple2!13513 (_1!6767 (_ BitVec 64)) (_2!6767 V!32553)) )
))
(declare-datatypes ((List!19309 0))(
  ( (Nil!19306) (Cons!19305 (h!20461 tuple2!13512) (t!27630 List!19309)) )
))
(declare-datatypes ((ListLongMap!12209 0))(
  ( (ListLongMap!12210 (toList!6120 List!19309)) )
))
(declare-fun contains!5202 (ListLongMap!12209 (_ BitVec 64)) Bool)

(declare-fun map!13065 (LongMapFixedSize!4878) ListLongMap!12209)

(assert (=> b!947663 (= e!533418 (not (contains!5202 (map!13065 thiss!1141) key!756)))))

(declare-datatypes ((SeekEntryResult!9119 0))(
  ( (MissingZero!9119 (index!38847 (_ BitVec 32))) (Found!9119 (index!38848 (_ BitVec 32))) (Intermediate!9119 (undefined!9931 Bool) (index!38849 (_ BitVec 32)) (x!81535 (_ BitVec 32))) (Undefined!9119) (MissingVacant!9119 (index!38850 (_ BitVec 32))) )
))
(declare-fun lt!426641 () SeekEntryResult!9119)

(declare-fun getCurrentListMap!3353 (array!57384 array!57382 (_ BitVec 32) (_ BitVec 32) V!32553 V!32553 (_ BitVec 32) Int) ListLongMap!12209)

(assert (=> b!947663 (contains!5202 (getCurrentListMap!3353 (_keys!10649 thiss!1141) (_values!5759 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5468 thiss!1141) (zeroValue!5572 thiss!1141) (minValue!5572 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5736 thiss!1141)) (select (arr!27601 (_keys!10649 thiss!1141)) (index!38848 lt!426641)))))

(declare-datatypes ((Unit!31934 0))(
  ( (Unit!31935) )
))
(declare-fun lt!426640 () Unit!31934)

(declare-fun lemmaValidKeyInArrayIsInListMap!267 (array!57384 array!57382 (_ BitVec 32) (_ BitVec 32) V!32553 V!32553 (_ BitVec 32) Int) Unit!31934)

(assert (=> b!947663 (= lt!426640 (lemmaValidKeyInArrayIsInListMap!267 (_keys!10649 thiss!1141) (_values!5759 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5468 thiss!1141) (zeroValue!5572 thiss!1141) (minValue!5572 thiss!1141) (index!38848 lt!426641) (defaultEntry!5736 thiss!1141)))))

(declare-fun arrayContainsKey!0 (array!57384 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!947663 (arrayContainsKey!0 (_keys!10649 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426642 () Unit!31934)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57384 (_ BitVec 64) (_ BitVec 32)) Unit!31934)

(assert (=> b!947663 (= lt!426642 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10649 thiss!1141) key!756 (index!38848 lt!426641)))))

(declare-fun b!947664 () Bool)

(declare-fun res!635968 () Bool)

(declare-fun e!533415 () Bool)

(assert (=> b!947664 (=> (not res!635968) (not e!533415))))

(assert (=> b!947664 (= res!635968 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!947665 () Bool)

(declare-fun tp_is_empty!20691 () Bool)

(assert (=> b!947665 (= e!533416 tp_is_empty!20691)))

(declare-fun b!947666 () Bool)

(assert (=> b!947666 (= e!533420 tp_is_empty!20691)))

(declare-fun res!635967 () Bool)

(assert (=> start!80866 (=> (not res!635967) (not e!533415))))

(declare-fun valid!1857 (LongMapFixedSize!4878) Bool)

(assert (=> start!80866 (= res!635967 (valid!1857 thiss!1141))))

(assert (=> start!80866 e!533415))

(declare-fun e!533417 () Bool)

(assert (=> start!80866 e!533417))

(assert (=> start!80866 true))

(declare-fun b!947667 () Bool)

(assert (=> b!947667 (= e!533415 e!533418)))

(declare-fun res!635966 () Bool)

(assert (=> b!947667 (=> (not res!635966) (not e!533418))))

(get-info :version)

(assert (=> b!947667 (= res!635966 ((_ is Found!9119) lt!426641))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57384 (_ BitVec 32)) SeekEntryResult!9119)

(assert (=> b!947667 (= lt!426641 (seekEntry!0 key!756 (_keys!10649 thiss!1141) (mask!27481 thiss!1141)))))

(declare-fun array_inv!21424 (array!57384) Bool)

(declare-fun array_inv!21425 (array!57382) Bool)

(assert (=> b!947668 (= e!533417 (and tp!63113 tp_is_empty!20691 (array_inv!21424 (_keys!10649 thiss!1141)) (array_inv!21425 (_values!5759 thiss!1141)) e!533414))))

(assert (= (and start!80866 res!635967) b!947664))

(assert (= (and b!947664 res!635968) b!947667))

(assert (= (and b!947667 res!635966) b!947663))

(assert (= (and b!947662 condMapEmpty!32917) mapIsEmpty!32917))

(assert (= (and b!947662 (not condMapEmpty!32917)) mapNonEmpty!32917))

(assert (= (and mapNonEmpty!32917 ((_ is ValueCellFull!9864) mapValue!32917)) b!947666))

(assert (= (and b!947662 ((_ is ValueCellFull!9864) mapDefault!32917)) b!947665))

(assert (= b!947668 b!947662))

(assert (= start!80866 b!947668))

(declare-fun m!880541 () Bool)

(assert (=> start!80866 m!880541))

(declare-fun m!880543 () Bool)

(assert (=> b!947667 m!880543))

(declare-fun m!880545 () Bool)

(assert (=> b!947668 m!880545))

(declare-fun m!880547 () Bool)

(assert (=> b!947668 m!880547))

(declare-fun m!880549 () Bool)

(assert (=> mapNonEmpty!32917 m!880549))

(declare-fun m!880551 () Bool)

(assert (=> b!947663 m!880551))

(declare-fun m!880553 () Bool)

(assert (=> b!947663 m!880553))

(declare-fun m!880555 () Bool)

(assert (=> b!947663 m!880555))

(assert (=> b!947663 m!880551))

(declare-fun m!880557 () Bool)

(assert (=> b!947663 m!880557))

(declare-fun m!880559 () Bool)

(assert (=> b!947663 m!880559))

(declare-fun m!880561 () Bool)

(assert (=> b!947663 m!880561))

(assert (=> b!947663 m!880555))

(declare-fun m!880563 () Bool)

(assert (=> b!947663 m!880563))

(declare-fun m!880565 () Bool)

(assert (=> b!947663 m!880565))

(assert (=> b!947663 m!880559))

(check-sat tp_is_empty!20691 (not b_next!18183) (not b!947667) (not mapNonEmpty!32917) (not b!947668) (not b!947663) (not start!80866) b_and!29605)
(check-sat b_and!29605 (not b_next!18183))
(get-model)

(declare-fun d!114711 () Bool)

(declare-fun res!635984 () Bool)

(declare-fun e!533444 () Bool)

(assert (=> d!114711 (=> (not res!635984) (not e!533444))))

(declare-fun simpleValid!365 (LongMapFixedSize!4878) Bool)

(assert (=> d!114711 (= res!635984 (simpleValid!365 thiss!1141))))

(assert (=> d!114711 (= (valid!1857 thiss!1141) e!533444)))

(declare-fun b!947696 () Bool)

(declare-fun res!635985 () Bool)

(assert (=> b!947696 (=> (not res!635985) (not e!533444))))

(declare-fun arrayCountValidKeys!0 (array!57384 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!947696 (= res!635985 (= (arrayCountValidKeys!0 (_keys!10649 thiss!1141) #b00000000000000000000000000000000 (size!28074 (_keys!10649 thiss!1141))) (_size!2494 thiss!1141)))))

(declare-fun b!947697 () Bool)

(declare-fun res!635986 () Bool)

(assert (=> b!947697 (=> (not res!635986) (not e!533444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57384 (_ BitVec 32)) Bool)

(assert (=> b!947697 (= res!635986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10649 thiss!1141) (mask!27481 thiss!1141)))))

(declare-fun b!947698 () Bool)

(declare-datatypes ((List!19311 0))(
  ( (Nil!19308) (Cons!19307 (h!20463 (_ BitVec 64)) (t!27634 List!19311)) )
))
(declare-fun arrayNoDuplicates!0 (array!57384 (_ BitVec 32) List!19311) Bool)

(assert (=> b!947698 (= e!533444 (arrayNoDuplicates!0 (_keys!10649 thiss!1141) #b00000000000000000000000000000000 Nil!19308))))

(assert (= (and d!114711 res!635984) b!947696))

(assert (= (and b!947696 res!635985) b!947697))

(assert (= (and b!947697 res!635986) b!947698))

(declare-fun m!880593 () Bool)

(assert (=> d!114711 m!880593))

(declare-fun m!880595 () Bool)

(assert (=> b!947696 m!880595))

(declare-fun m!880597 () Bool)

(assert (=> b!947697 m!880597))

(declare-fun m!880599 () Bool)

(assert (=> b!947698 m!880599))

(assert (=> start!80866 d!114711))

(declare-fun b!947711 () Bool)

(declare-fun e!533452 () SeekEntryResult!9119)

(declare-fun e!533453 () SeekEntryResult!9119)

(assert (=> b!947711 (= e!533452 e!533453)))

(declare-fun lt!426662 () (_ BitVec 64))

(declare-fun lt!426663 () SeekEntryResult!9119)

(assert (=> b!947711 (= lt!426662 (select (arr!27601 (_keys!10649 thiss!1141)) (index!38849 lt!426663)))))

(declare-fun c!98724 () Bool)

(assert (=> b!947711 (= c!98724 (= lt!426662 key!756))))

(declare-fun b!947712 () Bool)

(declare-fun c!98725 () Bool)

(assert (=> b!947712 (= c!98725 (= lt!426662 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!533451 () SeekEntryResult!9119)

(assert (=> b!947712 (= e!533453 e!533451)))

(declare-fun b!947713 () Bool)

(declare-fun lt!426661 () SeekEntryResult!9119)

(assert (=> b!947713 (= e!533451 (ite ((_ is MissingVacant!9119) lt!426661) (MissingZero!9119 (index!38850 lt!426661)) lt!426661))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57384 (_ BitVec 32)) SeekEntryResult!9119)

(assert (=> b!947713 (= lt!426661 (seekKeyOrZeroReturnVacant!0 (x!81535 lt!426663) (index!38849 lt!426663) (index!38849 lt!426663) key!756 (_keys!10649 thiss!1141) (mask!27481 thiss!1141)))))

(declare-fun d!114713 () Bool)

(declare-fun lt!426660 () SeekEntryResult!9119)

(assert (=> d!114713 (and (or ((_ is MissingVacant!9119) lt!426660) (not ((_ is Found!9119) lt!426660)) (and (bvsge (index!38848 lt!426660) #b00000000000000000000000000000000) (bvslt (index!38848 lt!426660) (size!28074 (_keys!10649 thiss!1141))))) (not ((_ is MissingVacant!9119) lt!426660)) (or (not ((_ is Found!9119) lt!426660)) (= (select (arr!27601 (_keys!10649 thiss!1141)) (index!38848 lt!426660)) key!756)))))

(assert (=> d!114713 (= lt!426660 e!533452)))

(declare-fun c!98726 () Bool)

(assert (=> d!114713 (= c!98726 (and ((_ is Intermediate!9119) lt!426663) (undefined!9931 lt!426663)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57384 (_ BitVec 32)) SeekEntryResult!9119)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114713 (= lt!426663 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27481 thiss!1141)) key!756 (_keys!10649 thiss!1141) (mask!27481 thiss!1141)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!114713 (validMask!0 (mask!27481 thiss!1141))))

(assert (=> d!114713 (= (seekEntry!0 key!756 (_keys!10649 thiss!1141) (mask!27481 thiss!1141)) lt!426660)))

(declare-fun b!947714 () Bool)

(assert (=> b!947714 (= e!533453 (Found!9119 (index!38849 lt!426663)))))

(declare-fun b!947715 () Bool)

(assert (=> b!947715 (= e!533451 (MissingZero!9119 (index!38849 lt!426663)))))

(declare-fun b!947716 () Bool)

(assert (=> b!947716 (= e!533452 Undefined!9119)))

(assert (= (and d!114713 c!98726) b!947716))

(assert (= (and d!114713 (not c!98726)) b!947711))

(assert (= (and b!947711 c!98724) b!947714))

(assert (= (and b!947711 (not c!98724)) b!947712))

(assert (= (and b!947712 c!98725) b!947715))

(assert (= (and b!947712 (not c!98725)) b!947713))

(declare-fun m!880601 () Bool)

(assert (=> b!947711 m!880601))

(declare-fun m!880603 () Bool)

(assert (=> b!947713 m!880603))

(declare-fun m!880605 () Bool)

(assert (=> d!114713 m!880605))

(declare-fun m!880607 () Bool)

(assert (=> d!114713 m!880607))

(assert (=> d!114713 m!880607))

(declare-fun m!880609 () Bool)

(assert (=> d!114713 m!880609))

(declare-fun m!880611 () Bool)

(assert (=> d!114713 m!880611))

(assert (=> b!947667 d!114713))

(declare-fun d!114715 () Bool)

(assert (=> d!114715 (= (array_inv!21424 (_keys!10649 thiss!1141)) (bvsge (size!28074 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947668 d!114715))

(declare-fun d!114717 () Bool)

(assert (=> d!114717 (= (array_inv!21425 (_values!5759 thiss!1141)) (bvsge (size!28073 (_values!5759 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947668 d!114717))

(declare-fun b!947759 () Bool)

(declare-fun e!533483 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!947759 (= e!533483 (validKeyInArray!0 (select (arr!27601 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947760 () Bool)

(declare-fun e!533487 () Bool)

(declare-fun e!533492 () Bool)

(assert (=> b!947760 (= e!533487 e!533492)))

(declare-fun res!636008 () Bool)

(declare-fun call!41140 () Bool)

(assert (=> b!947760 (= res!636008 call!41140)))

(assert (=> b!947760 (=> (not res!636008) (not e!533492))))

(declare-fun b!947761 () Bool)

(declare-fun e!533488 () Bool)

(assert (=> b!947761 (= e!533488 (validKeyInArray!0 (select (arr!27601 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41136 () Bool)

(declare-fun call!41139 () ListLongMap!12209)

(declare-fun call!41145 () ListLongMap!12209)

(assert (=> bm!41136 (= call!41139 call!41145)))

(declare-fun b!947762 () Bool)

(declare-fun res!636011 () Bool)

(declare-fun e!533481 () Bool)

(assert (=> b!947762 (=> (not res!636011) (not e!533481))))

(declare-fun e!533482 () Bool)

(assert (=> b!947762 (= res!636011 e!533482)))

(declare-fun res!636009 () Bool)

(assert (=> b!947762 (=> res!636009 e!533482)))

(assert (=> b!947762 (= res!636009 (not e!533488))))

(declare-fun res!636010 () Bool)

(assert (=> b!947762 (=> (not res!636010) (not e!533488))))

(assert (=> b!947762 (= res!636010 (bvslt #b00000000000000000000000000000000 (size!28074 (_keys!10649 thiss!1141))))))

(declare-fun b!947763 () Bool)

(declare-fun e!533489 () Unit!31934)

(declare-fun Unit!31938 () Unit!31934)

(assert (=> b!947763 (= e!533489 Unit!31938)))

(declare-fun b!947764 () Bool)

(declare-fun e!533486 () ListLongMap!12209)

(declare-fun e!533484 () ListLongMap!12209)

(assert (=> b!947764 (= e!533486 e!533484)))

(declare-fun c!98741 () Bool)

(assert (=> b!947764 (= c!98741 (and (not (= (bvand (extraKeys!5468 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5468 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41137 () Bool)

(declare-fun call!41144 () ListLongMap!12209)

(declare-fun getCurrentListMapNoExtraKeys!3308 (array!57384 array!57382 (_ BitVec 32) (_ BitVec 32) V!32553 V!32553 (_ BitVec 32) Int) ListLongMap!12209)

(assert (=> bm!41137 (= call!41144 (getCurrentListMapNoExtraKeys!3308 (_keys!10649 thiss!1141) (_values!5759 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5468 thiss!1141) (zeroValue!5572 thiss!1141) (minValue!5572 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5736 thiss!1141)))))

(declare-fun b!947765 () Bool)

(declare-fun c!98739 () Bool)

(assert (=> b!947765 (= c!98739 (and (not (= (bvand (extraKeys!5468 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5468 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!533480 () ListLongMap!12209)

(assert (=> b!947765 (= e!533484 e!533480)))

(declare-fun d!114719 () Bool)

(assert (=> d!114719 e!533481))

(declare-fun res!636007 () Bool)

(assert (=> d!114719 (=> (not res!636007) (not e!533481))))

(assert (=> d!114719 (= res!636007 (or (bvsge #b00000000000000000000000000000000 (size!28074 (_keys!10649 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28074 (_keys!10649 thiss!1141))))))))

(declare-fun lt!426722 () ListLongMap!12209)

(declare-fun lt!426710 () ListLongMap!12209)

(assert (=> d!114719 (= lt!426722 lt!426710)))

(declare-fun lt!426719 () Unit!31934)

(assert (=> d!114719 (= lt!426719 e!533489)))

(declare-fun c!98740 () Bool)

(assert (=> d!114719 (= c!98740 e!533483)))

(declare-fun res!636013 () Bool)

(assert (=> d!114719 (=> (not res!636013) (not e!533483))))

(assert (=> d!114719 (= res!636013 (bvslt #b00000000000000000000000000000000 (size!28074 (_keys!10649 thiss!1141))))))

(assert (=> d!114719 (= lt!426710 e!533486)))

(declare-fun c!98742 () Bool)

(assert (=> d!114719 (= c!98742 (and (not (= (bvand (extraKeys!5468 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5468 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!114719 (validMask!0 (mask!27481 thiss!1141))))

(assert (=> d!114719 (= (getCurrentListMap!3353 (_keys!10649 thiss!1141) (_values!5759 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5468 thiss!1141) (zeroValue!5572 thiss!1141) (minValue!5572 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5736 thiss!1141)) lt!426722)))

(declare-fun b!947766 () Bool)

(declare-fun lt!426725 () Unit!31934)

(assert (=> b!947766 (= e!533489 lt!426725)))

(declare-fun lt!426723 () ListLongMap!12209)

(assert (=> b!947766 (= lt!426723 (getCurrentListMapNoExtraKeys!3308 (_keys!10649 thiss!1141) (_values!5759 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5468 thiss!1141) (zeroValue!5572 thiss!1141) (minValue!5572 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5736 thiss!1141)))))

(declare-fun lt!426724 () (_ BitVec 64))

(assert (=> b!947766 (= lt!426724 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426709 () (_ BitVec 64))

(assert (=> b!947766 (= lt!426709 (select (arr!27601 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426715 () Unit!31934)

(declare-fun addStillContains!572 (ListLongMap!12209 (_ BitVec 64) V!32553 (_ BitVec 64)) Unit!31934)

(assert (=> b!947766 (= lt!426715 (addStillContains!572 lt!426723 lt!426724 (zeroValue!5572 thiss!1141) lt!426709))))

(declare-fun +!2853 (ListLongMap!12209 tuple2!13512) ListLongMap!12209)

(assert (=> b!947766 (contains!5202 (+!2853 lt!426723 (tuple2!13513 lt!426724 (zeroValue!5572 thiss!1141))) lt!426709)))

(declare-fun lt!426729 () Unit!31934)

(assert (=> b!947766 (= lt!426729 lt!426715)))

(declare-fun lt!426720 () ListLongMap!12209)

(assert (=> b!947766 (= lt!426720 (getCurrentListMapNoExtraKeys!3308 (_keys!10649 thiss!1141) (_values!5759 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5468 thiss!1141) (zeroValue!5572 thiss!1141) (minValue!5572 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5736 thiss!1141)))))

(declare-fun lt!426713 () (_ BitVec 64))

(assert (=> b!947766 (= lt!426713 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426708 () (_ BitVec 64))

(assert (=> b!947766 (= lt!426708 (select (arr!27601 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426712 () Unit!31934)

(declare-fun addApplyDifferent!452 (ListLongMap!12209 (_ BitVec 64) V!32553 (_ BitVec 64)) Unit!31934)

(assert (=> b!947766 (= lt!426712 (addApplyDifferent!452 lt!426720 lt!426713 (minValue!5572 thiss!1141) lt!426708))))

(declare-fun apply!869 (ListLongMap!12209 (_ BitVec 64)) V!32553)

(assert (=> b!947766 (= (apply!869 (+!2853 lt!426720 (tuple2!13513 lt!426713 (minValue!5572 thiss!1141))) lt!426708) (apply!869 lt!426720 lt!426708))))

(declare-fun lt!426727 () Unit!31934)

(assert (=> b!947766 (= lt!426727 lt!426712)))

(declare-fun lt!426716 () ListLongMap!12209)

(assert (=> b!947766 (= lt!426716 (getCurrentListMapNoExtraKeys!3308 (_keys!10649 thiss!1141) (_values!5759 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5468 thiss!1141) (zeroValue!5572 thiss!1141) (minValue!5572 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5736 thiss!1141)))))

(declare-fun lt!426714 () (_ BitVec 64))

(assert (=> b!947766 (= lt!426714 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426728 () (_ BitVec 64))

(assert (=> b!947766 (= lt!426728 (select (arr!27601 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426711 () Unit!31934)

(assert (=> b!947766 (= lt!426711 (addApplyDifferent!452 lt!426716 lt!426714 (zeroValue!5572 thiss!1141) lt!426728))))

(assert (=> b!947766 (= (apply!869 (+!2853 lt!426716 (tuple2!13513 lt!426714 (zeroValue!5572 thiss!1141))) lt!426728) (apply!869 lt!426716 lt!426728))))

(declare-fun lt!426718 () Unit!31934)

(assert (=> b!947766 (= lt!426718 lt!426711)))

(declare-fun lt!426717 () ListLongMap!12209)

(assert (=> b!947766 (= lt!426717 (getCurrentListMapNoExtraKeys!3308 (_keys!10649 thiss!1141) (_values!5759 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5468 thiss!1141) (zeroValue!5572 thiss!1141) (minValue!5572 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5736 thiss!1141)))))

(declare-fun lt!426721 () (_ BitVec 64))

(assert (=> b!947766 (= lt!426721 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426726 () (_ BitVec 64))

(assert (=> b!947766 (= lt!426726 (select (arr!27601 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947766 (= lt!426725 (addApplyDifferent!452 lt!426717 lt!426721 (minValue!5572 thiss!1141) lt!426726))))

(assert (=> b!947766 (= (apply!869 (+!2853 lt!426717 (tuple2!13513 lt!426721 (minValue!5572 thiss!1141))) lt!426726) (apply!869 lt!426717 lt!426726))))

(declare-fun bm!41138 () Bool)

(assert (=> bm!41138 (= call!41140 (contains!5202 lt!426722 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!947767 () Bool)

(declare-fun e!533485 () Bool)

(declare-fun e!533491 () Bool)

(assert (=> b!947767 (= e!533485 e!533491)))

(declare-fun res!636005 () Bool)

(declare-fun call!41143 () Bool)

(assert (=> b!947767 (= res!636005 call!41143)))

(assert (=> b!947767 (=> (not res!636005) (not e!533491))))

(declare-fun bm!41139 () Bool)

(declare-fun call!41141 () ListLongMap!12209)

(assert (=> bm!41139 (= call!41141 call!41144)))

(declare-fun b!947768 () Bool)

(assert (=> b!947768 (= e!533492 (= (apply!869 lt!426722 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5572 thiss!1141)))))

(declare-fun b!947769 () Bool)

(assert (=> b!947769 (= e!533480 call!41139)))

(declare-fun b!947770 () Bool)

(assert (=> b!947770 (= e!533486 (+!2853 call!41145 (tuple2!13513 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5572 thiss!1141))))))

(declare-fun b!947771 () Bool)

(declare-fun e!533490 () Bool)

(declare-fun get!14494 (ValueCell!9864 V!32553) V!32553)

(declare-fun dynLambda!1642 (Int (_ BitVec 64)) V!32553)

(assert (=> b!947771 (= e!533490 (= (apply!869 lt!426722 (select (arr!27601 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000)) (get!14494 (select (arr!27600 (_values!5759 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1642 (defaultEntry!5736 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!947771 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28073 (_values!5759 thiss!1141))))))

(assert (=> b!947771 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28074 (_keys!10649 thiss!1141))))))

(declare-fun b!947772 () Bool)

(assert (=> b!947772 (= e!533485 (not call!41143))))

(declare-fun b!947773 () Bool)

(assert (=> b!947773 (= e!533491 (= (apply!869 lt!426722 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5572 thiss!1141)))))

(declare-fun b!947774 () Bool)

(assert (=> b!947774 (= e!533487 (not call!41140))))

(declare-fun bm!41140 () Bool)

(declare-fun call!41142 () ListLongMap!12209)

(assert (=> bm!41140 (= call!41142 call!41141)))

(declare-fun b!947775 () Bool)

(assert (=> b!947775 (= e!533484 call!41139)))

(declare-fun bm!41141 () Bool)

(assert (=> bm!41141 (= call!41143 (contains!5202 lt!426722 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!947776 () Bool)

(assert (=> b!947776 (= e!533480 call!41142)))

(declare-fun bm!41142 () Bool)

(assert (=> bm!41142 (= call!41145 (+!2853 (ite c!98742 call!41144 (ite c!98741 call!41141 call!41142)) (ite (or c!98742 c!98741) (tuple2!13513 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5572 thiss!1141)) (tuple2!13513 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5572 thiss!1141)))))))

(declare-fun b!947777 () Bool)

(assert (=> b!947777 (= e!533481 e!533487)))

(declare-fun c!98743 () Bool)

(assert (=> b!947777 (= c!98743 (not (= (bvand (extraKeys!5468 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!947778 () Bool)

(assert (=> b!947778 (= e!533482 e!533490)))

(declare-fun res!636012 () Bool)

(assert (=> b!947778 (=> (not res!636012) (not e!533490))))

(assert (=> b!947778 (= res!636012 (contains!5202 lt!426722 (select (arr!27601 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!947778 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28074 (_keys!10649 thiss!1141))))))

(declare-fun b!947779 () Bool)

(declare-fun res!636006 () Bool)

(assert (=> b!947779 (=> (not res!636006) (not e!533481))))

(assert (=> b!947779 (= res!636006 e!533485)))

(declare-fun c!98744 () Bool)

(assert (=> b!947779 (= c!98744 (not (= (bvand (extraKeys!5468 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!114719 c!98742) b!947770))

(assert (= (and d!114719 (not c!98742)) b!947764))

(assert (= (and b!947764 c!98741) b!947775))

(assert (= (and b!947764 (not c!98741)) b!947765))

(assert (= (and b!947765 c!98739) b!947769))

(assert (= (and b!947765 (not c!98739)) b!947776))

(assert (= (or b!947769 b!947776) bm!41140))

(assert (= (or b!947775 bm!41140) bm!41139))

(assert (= (or b!947775 b!947769) bm!41136))

(assert (= (or b!947770 bm!41139) bm!41137))

(assert (= (or b!947770 bm!41136) bm!41142))

(assert (= (and d!114719 res!636013) b!947759))

(assert (= (and d!114719 c!98740) b!947766))

(assert (= (and d!114719 (not c!98740)) b!947763))

(assert (= (and d!114719 res!636007) b!947762))

(assert (= (and b!947762 res!636010) b!947761))

(assert (= (and b!947762 (not res!636009)) b!947778))

(assert (= (and b!947778 res!636012) b!947771))

(assert (= (and b!947762 res!636011) b!947779))

(assert (= (and b!947779 c!98744) b!947767))

(assert (= (and b!947779 (not c!98744)) b!947772))

(assert (= (and b!947767 res!636005) b!947773))

(assert (= (or b!947767 b!947772) bm!41141))

(assert (= (and b!947779 res!636006) b!947777))

(assert (= (and b!947777 c!98743) b!947760))

(assert (= (and b!947777 (not c!98743)) b!947774))

(assert (= (and b!947760 res!636008) b!947768))

(assert (= (or b!947760 b!947774) bm!41138))

(declare-fun b_lambda!14299 () Bool)

(assert (=> (not b_lambda!14299) (not b!947771)))

(declare-fun t!27633 () Bool)

(declare-fun tb!6173 () Bool)

(assert (=> (and b!947668 (= (defaultEntry!5736 thiss!1141) (defaultEntry!5736 thiss!1141)) t!27633) tb!6173))

(declare-fun result!12241 () Bool)

(assert (=> tb!6173 (= result!12241 tp_is_empty!20691)))

(assert (=> b!947771 t!27633))

(declare-fun b_and!29609 () Bool)

(assert (= b_and!29605 (and (=> t!27633 result!12241) b_and!29609)))

(declare-fun m!880613 () Bool)

(assert (=> b!947771 m!880613))

(declare-fun m!880615 () Bool)

(assert (=> b!947771 m!880615))

(assert (=> b!947771 m!880613))

(declare-fun m!880617 () Bool)

(assert (=> b!947771 m!880617))

(declare-fun m!880619 () Bool)

(assert (=> b!947771 m!880619))

(declare-fun m!880621 () Bool)

(assert (=> b!947771 m!880621))

(assert (=> b!947771 m!880615))

(assert (=> b!947771 m!880619))

(assert (=> b!947778 m!880619))

(assert (=> b!947778 m!880619))

(declare-fun m!880623 () Bool)

(assert (=> b!947778 m!880623))

(declare-fun m!880625 () Bool)

(assert (=> b!947773 m!880625))

(declare-fun m!880627 () Bool)

(assert (=> b!947768 m!880627))

(declare-fun m!880629 () Bool)

(assert (=> bm!41137 m!880629))

(declare-fun m!880631 () Bool)

(assert (=> b!947766 m!880631))

(declare-fun m!880633 () Bool)

(assert (=> b!947766 m!880633))

(assert (=> b!947766 m!880629))

(declare-fun m!880635 () Bool)

(assert (=> b!947766 m!880635))

(declare-fun m!880637 () Bool)

(assert (=> b!947766 m!880637))

(declare-fun m!880639 () Bool)

(assert (=> b!947766 m!880639))

(declare-fun m!880641 () Bool)

(assert (=> b!947766 m!880641))

(declare-fun m!880643 () Bool)

(assert (=> b!947766 m!880643))

(assert (=> b!947766 m!880641))

(declare-fun m!880645 () Bool)

(assert (=> b!947766 m!880645))

(assert (=> b!947766 m!880637))

(declare-fun m!880647 () Bool)

(assert (=> b!947766 m!880647))

(assert (=> b!947766 m!880631))

(declare-fun m!880649 () Bool)

(assert (=> b!947766 m!880649))

(declare-fun m!880651 () Bool)

(assert (=> b!947766 m!880651))

(assert (=> b!947766 m!880619))

(assert (=> b!947766 m!880635))

(declare-fun m!880653 () Bool)

(assert (=> b!947766 m!880653))

(declare-fun m!880655 () Bool)

(assert (=> b!947766 m!880655))

(declare-fun m!880657 () Bool)

(assert (=> b!947766 m!880657))

(declare-fun m!880659 () Bool)

(assert (=> b!947766 m!880659))

(assert (=> d!114719 m!880611))

(declare-fun m!880661 () Bool)

(assert (=> bm!41142 m!880661))

(declare-fun m!880663 () Bool)

(assert (=> bm!41138 m!880663))

(assert (=> b!947759 m!880619))

(assert (=> b!947759 m!880619))

(declare-fun m!880665 () Bool)

(assert (=> b!947759 m!880665))

(declare-fun m!880667 () Bool)

(assert (=> bm!41141 m!880667))

(assert (=> b!947761 m!880619))

(assert (=> b!947761 m!880619))

(assert (=> b!947761 m!880665))

(declare-fun m!880669 () Bool)

(assert (=> b!947770 m!880669))

(assert (=> b!947663 d!114719))

(declare-fun d!114721 () Bool)

(assert (=> d!114721 (= (map!13065 thiss!1141) (getCurrentListMap!3353 (_keys!10649 thiss!1141) (_values!5759 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5468 thiss!1141) (zeroValue!5572 thiss!1141) (minValue!5572 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5736 thiss!1141)))))

(declare-fun bs!26636 () Bool)

(assert (= bs!26636 d!114721))

(assert (=> bs!26636 m!880555))

(assert (=> b!947663 d!114721))

(declare-fun d!114723 () Bool)

(declare-fun e!533495 () Bool)

(assert (=> d!114723 e!533495))

(declare-fun res!636016 () Bool)

(assert (=> d!114723 (=> (not res!636016) (not e!533495))))

(assert (=> d!114723 (= res!636016 (and (bvsge (index!38848 lt!426641) #b00000000000000000000000000000000) (bvslt (index!38848 lt!426641) (size!28074 (_keys!10649 thiss!1141)))))))

(declare-fun lt!426732 () Unit!31934)

(declare-fun choose!1571 (array!57384 array!57382 (_ BitVec 32) (_ BitVec 32) V!32553 V!32553 (_ BitVec 32) Int) Unit!31934)

(assert (=> d!114723 (= lt!426732 (choose!1571 (_keys!10649 thiss!1141) (_values!5759 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5468 thiss!1141) (zeroValue!5572 thiss!1141) (minValue!5572 thiss!1141) (index!38848 lt!426641) (defaultEntry!5736 thiss!1141)))))

(assert (=> d!114723 (validMask!0 (mask!27481 thiss!1141))))

(assert (=> d!114723 (= (lemmaValidKeyInArrayIsInListMap!267 (_keys!10649 thiss!1141) (_values!5759 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5468 thiss!1141) (zeroValue!5572 thiss!1141) (minValue!5572 thiss!1141) (index!38848 lt!426641) (defaultEntry!5736 thiss!1141)) lt!426732)))

(declare-fun b!947784 () Bool)

(assert (=> b!947784 (= e!533495 (contains!5202 (getCurrentListMap!3353 (_keys!10649 thiss!1141) (_values!5759 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5468 thiss!1141) (zeroValue!5572 thiss!1141) (minValue!5572 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5736 thiss!1141)) (select (arr!27601 (_keys!10649 thiss!1141)) (index!38848 lt!426641))))))

(assert (= (and d!114723 res!636016) b!947784))

(declare-fun m!880671 () Bool)

(assert (=> d!114723 m!880671))

(assert (=> d!114723 m!880611))

(assert (=> b!947784 m!880555))

(assert (=> b!947784 m!880551))

(assert (=> b!947784 m!880555))

(assert (=> b!947784 m!880551))

(assert (=> b!947784 m!880557))

(assert (=> b!947663 d!114723))

(declare-fun d!114725 () Bool)

(declare-fun e!533501 () Bool)

(assert (=> d!114725 e!533501))

(declare-fun res!636019 () Bool)

(assert (=> d!114725 (=> res!636019 e!533501)))

(declare-fun lt!426743 () Bool)

(assert (=> d!114725 (= res!636019 (not lt!426743))))

(declare-fun lt!426741 () Bool)

(assert (=> d!114725 (= lt!426743 lt!426741)))

(declare-fun lt!426744 () Unit!31934)

(declare-fun e!533500 () Unit!31934)

(assert (=> d!114725 (= lt!426744 e!533500)))

(declare-fun c!98747 () Bool)

(assert (=> d!114725 (= c!98747 lt!426741)))

(declare-fun containsKey!455 (List!19309 (_ BitVec 64)) Bool)

(assert (=> d!114725 (= lt!426741 (containsKey!455 (toList!6120 (map!13065 thiss!1141)) key!756))))

(assert (=> d!114725 (= (contains!5202 (map!13065 thiss!1141) key!756) lt!426743)))

(declare-fun b!947791 () Bool)

(declare-fun lt!426742 () Unit!31934)

(assert (=> b!947791 (= e!533500 lt!426742)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!351 (List!19309 (_ BitVec 64)) Unit!31934)

(assert (=> b!947791 (= lt!426742 (lemmaContainsKeyImpliesGetValueByKeyDefined!351 (toList!6120 (map!13065 thiss!1141)) key!756))))

(declare-datatypes ((Option!494 0))(
  ( (Some!493 (v!12932 V!32553)) (None!492) )
))
(declare-fun isDefined!360 (Option!494) Bool)

(declare-fun getValueByKey!488 (List!19309 (_ BitVec 64)) Option!494)

(assert (=> b!947791 (isDefined!360 (getValueByKey!488 (toList!6120 (map!13065 thiss!1141)) key!756))))

(declare-fun b!947792 () Bool)

(declare-fun Unit!31939 () Unit!31934)

(assert (=> b!947792 (= e!533500 Unit!31939)))

(declare-fun b!947793 () Bool)

(assert (=> b!947793 (= e!533501 (isDefined!360 (getValueByKey!488 (toList!6120 (map!13065 thiss!1141)) key!756)))))

(assert (= (and d!114725 c!98747) b!947791))

(assert (= (and d!114725 (not c!98747)) b!947792))

(assert (= (and d!114725 (not res!636019)) b!947793))

(declare-fun m!880673 () Bool)

(assert (=> d!114725 m!880673))

(declare-fun m!880675 () Bool)

(assert (=> b!947791 m!880675))

(declare-fun m!880677 () Bool)

(assert (=> b!947791 m!880677))

(assert (=> b!947791 m!880677))

(declare-fun m!880679 () Bool)

(assert (=> b!947791 m!880679))

(assert (=> b!947793 m!880677))

(assert (=> b!947793 m!880677))

(assert (=> b!947793 m!880679))

(assert (=> b!947663 d!114725))

(declare-fun d!114727 () Bool)

(assert (=> d!114727 (arrayContainsKey!0 (_keys!10649 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426747 () Unit!31934)

(declare-fun choose!13 (array!57384 (_ BitVec 64) (_ BitVec 32)) Unit!31934)

(assert (=> d!114727 (= lt!426747 (choose!13 (_keys!10649 thiss!1141) key!756 (index!38848 lt!426641)))))

(assert (=> d!114727 (bvsge (index!38848 lt!426641) #b00000000000000000000000000000000)))

(assert (=> d!114727 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10649 thiss!1141) key!756 (index!38848 lt!426641)) lt!426747)))

(declare-fun bs!26637 () Bool)

(assert (= bs!26637 d!114727))

(assert (=> bs!26637 m!880565))

(declare-fun m!880681 () Bool)

(assert (=> bs!26637 m!880681))

(assert (=> b!947663 d!114727))

(declare-fun d!114729 () Bool)

(declare-fun res!636024 () Bool)

(declare-fun e!533506 () Bool)

(assert (=> d!114729 (=> res!636024 e!533506)))

(assert (=> d!114729 (= res!636024 (= (select (arr!27601 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114729 (= (arrayContainsKey!0 (_keys!10649 thiss!1141) key!756 #b00000000000000000000000000000000) e!533506)))

(declare-fun b!947798 () Bool)

(declare-fun e!533507 () Bool)

(assert (=> b!947798 (= e!533506 e!533507)))

(declare-fun res!636025 () Bool)

(assert (=> b!947798 (=> (not res!636025) (not e!533507))))

(assert (=> b!947798 (= res!636025 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28074 (_keys!10649 thiss!1141))))))

(declare-fun b!947799 () Bool)

(assert (=> b!947799 (= e!533507 (arrayContainsKey!0 (_keys!10649 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114729 (not res!636024)) b!947798))

(assert (= (and b!947798 res!636025) b!947799))

(assert (=> d!114729 m!880619))

(declare-fun m!880683 () Bool)

(assert (=> b!947799 m!880683))

(assert (=> b!947663 d!114729))

(declare-fun d!114731 () Bool)

(declare-fun e!533509 () Bool)

(assert (=> d!114731 e!533509))

(declare-fun res!636026 () Bool)

(assert (=> d!114731 (=> res!636026 e!533509)))

(declare-fun lt!426750 () Bool)

(assert (=> d!114731 (= res!636026 (not lt!426750))))

(declare-fun lt!426748 () Bool)

(assert (=> d!114731 (= lt!426750 lt!426748)))

(declare-fun lt!426751 () Unit!31934)

(declare-fun e!533508 () Unit!31934)

(assert (=> d!114731 (= lt!426751 e!533508)))

(declare-fun c!98748 () Bool)

(assert (=> d!114731 (= c!98748 lt!426748)))

(assert (=> d!114731 (= lt!426748 (containsKey!455 (toList!6120 (getCurrentListMap!3353 (_keys!10649 thiss!1141) (_values!5759 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5468 thiss!1141) (zeroValue!5572 thiss!1141) (minValue!5572 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5736 thiss!1141))) (select (arr!27601 (_keys!10649 thiss!1141)) (index!38848 lt!426641))))))

(assert (=> d!114731 (= (contains!5202 (getCurrentListMap!3353 (_keys!10649 thiss!1141) (_values!5759 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5468 thiss!1141) (zeroValue!5572 thiss!1141) (minValue!5572 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5736 thiss!1141)) (select (arr!27601 (_keys!10649 thiss!1141)) (index!38848 lt!426641))) lt!426750)))

(declare-fun b!947800 () Bool)

(declare-fun lt!426749 () Unit!31934)

(assert (=> b!947800 (= e!533508 lt!426749)))

(assert (=> b!947800 (= lt!426749 (lemmaContainsKeyImpliesGetValueByKeyDefined!351 (toList!6120 (getCurrentListMap!3353 (_keys!10649 thiss!1141) (_values!5759 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5468 thiss!1141) (zeroValue!5572 thiss!1141) (minValue!5572 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5736 thiss!1141))) (select (arr!27601 (_keys!10649 thiss!1141)) (index!38848 lt!426641))))))

(assert (=> b!947800 (isDefined!360 (getValueByKey!488 (toList!6120 (getCurrentListMap!3353 (_keys!10649 thiss!1141) (_values!5759 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5468 thiss!1141) (zeroValue!5572 thiss!1141) (minValue!5572 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5736 thiss!1141))) (select (arr!27601 (_keys!10649 thiss!1141)) (index!38848 lt!426641))))))

(declare-fun b!947801 () Bool)

(declare-fun Unit!31940 () Unit!31934)

(assert (=> b!947801 (= e!533508 Unit!31940)))

(declare-fun b!947802 () Bool)

(assert (=> b!947802 (= e!533509 (isDefined!360 (getValueByKey!488 (toList!6120 (getCurrentListMap!3353 (_keys!10649 thiss!1141) (_values!5759 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5468 thiss!1141) (zeroValue!5572 thiss!1141) (minValue!5572 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5736 thiss!1141))) (select (arr!27601 (_keys!10649 thiss!1141)) (index!38848 lt!426641)))))))

(assert (= (and d!114731 c!98748) b!947800))

(assert (= (and d!114731 (not c!98748)) b!947801))

(assert (= (and d!114731 (not res!636026)) b!947802))

(assert (=> d!114731 m!880551))

(declare-fun m!880685 () Bool)

(assert (=> d!114731 m!880685))

(assert (=> b!947800 m!880551))

(declare-fun m!880687 () Bool)

(assert (=> b!947800 m!880687))

(assert (=> b!947800 m!880551))

(declare-fun m!880689 () Bool)

(assert (=> b!947800 m!880689))

(assert (=> b!947800 m!880689))

(declare-fun m!880691 () Bool)

(assert (=> b!947800 m!880691))

(assert (=> b!947802 m!880551))

(assert (=> b!947802 m!880689))

(assert (=> b!947802 m!880689))

(assert (=> b!947802 m!880691))

(assert (=> b!947663 d!114731))

(declare-fun mapNonEmpty!32923 () Bool)

(declare-fun mapRes!32923 () Bool)

(declare-fun tp!63123 () Bool)

(declare-fun e!533514 () Bool)

(assert (=> mapNonEmpty!32923 (= mapRes!32923 (and tp!63123 e!533514))))

(declare-fun mapKey!32923 () (_ BitVec 32))

(declare-fun mapRest!32923 () (Array (_ BitVec 32) ValueCell!9864))

(declare-fun mapValue!32923 () ValueCell!9864)

(assert (=> mapNonEmpty!32923 (= mapRest!32917 (store mapRest!32923 mapKey!32923 mapValue!32923))))

(declare-fun mapIsEmpty!32923 () Bool)

(assert (=> mapIsEmpty!32923 mapRes!32923))

(declare-fun condMapEmpty!32923 () Bool)

(declare-fun mapDefault!32923 () ValueCell!9864)

(assert (=> mapNonEmpty!32917 (= condMapEmpty!32923 (= mapRest!32917 ((as const (Array (_ BitVec 32) ValueCell!9864)) mapDefault!32923)))))

(declare-fun e!533515 () Bool)

(assert (=> mapNonEmpty!32917 (= tp!63114 (and e!533515 mapRes!32923))))

(declare-fun b!947810 () Bool)

(assert (=> b!947810 (= e!533515 tp_is_empty!20691)))

(declare-fun b!947809 () Bool)

(assert (=> b!947809 (= e!533514 tp_is_empty!20691)))

(assert (= (and mapNonEmpty!32917 condMapEmpty!32923) mapIsEmpty!32923))

(assert (= (and mapNonEmpty!32917 (not condMapEmpty!32923)) mapNonEmpty!32923))

(assert (= (and mapNonEmpty!32923 ((_ is ValueCellFull!9864) mapValue!32923)) b!947809))

(assert (= (and mapNonEmpty!32917 ((_ is ValueCellFull!9864) mapDefault!32923)) b!947810))

(declare-fun m!880693 () Bool)

(assert (=> mapNonEmpty!32923 m!880693))

(declare-fun b_lambda!14301 () Bool)

(assert (= b_lambda!14299 (or (and b!947668 b_free!18183) b_lambda!14301)))

(check-sat tp_is_empty!20691 (not b!947766) (not d!114727) (not b!947778) (not b_next!18183) (not d!114725) (not b!947800) (not b!947759) (not b!947771) (not d!114711) (not b!947696) (not bm!41141) (not b!947799) (not b!947773) (not mapNonEmpty!32923) (not b!947770) b_and!29609 (not bm!41142) (not b!947768) (not bm!41138) (not b!947698) (not d!114719) (not b!947697) (not b!947713) (not d!114721) (not b!947761) (not b_lambda!14301) (not d!114731) (not b!947791) (not d!114723) (not b!947793) (not bm!41137) (not b!947802) (not d!114713) (not b!947784))
(check-sat b_and!29609 (not b_next!18183))
