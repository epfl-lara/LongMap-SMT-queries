; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80982 () Bool)

(assert start!80982)

(declare-fun b!948210 () Bool)

(declare-fun b_free!18169 () Bool)

(declare-fun b_next!18169 () Bool)

(assert (=> b!948210 (= b_free!18169 (not b_next!18169))))

(declare-fun tp!63066 () Bool)

(declare-fun b_and!29601 () Bool)

(assert (=> b!948210 (= tp!63066 b_and!29601)))

(declare-fun b!948209 () Bool)

(declare-fun e!533745 () Bool)

(declare-fun e!533749 () Bool)

(assert (=> b!948209 (= e!533745 (not e!533749))))

(declare-fun res!636118 () Bool)

(assert (=> b!948209 (=> res!636118 e!533749)))

(declare-datatypes ((V!32535 0))(
  ( (V!32536 (val!10389 Int)) )
))
(declare-datatypes ((ValueCell!9857 0))(
  ( (ValueCellFull!9857 (v!12920 V!32535)) (EmptyCell!9857) )
))
(declare-datatypes ((array!57401 0))(
  ( (array!57402 (arr!27607 (Array (_ BitVec 32) ValueCell!9857)) (size!28081 (_ BitVec 32))) )
))
(declare-datatypes ((array!57403 0))(
  ( (array!57404 (arr!27608 (Array (_ BitVec 32) (_ BitVec 64))) (size!28082 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4864 0))(
  ( (LongMapFixedSize!4865 (defaultEntry!5729 Int) (mask!27507 (_ BitVec 32)) (extraKeys!5461 (_ BitVec 32)) (zeroValue!5565 V!32535) (minValue!5565 V!32535) (_size!2487 (_ BitVec 32)) (_keys!10666 array!57403) (_values!5752 array!57401) (_vacant!2487 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4864)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!948209 (= res!636118 (not (validMask!0 (mask!27507 thiss!1141))))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!57403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!948209 (arrayContainsKey!0 (_keys!10666 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!9075 0))(
  ( (MissingZero!9075 (index!38671 (_ BitVec 32))) (Found!9075 (index!38672 (_ BitVec 32))) (Intermediate!9075 (undefined!9887 Bool) (index!38673 (_ BitVec 32)) (x!81473 (_ BitVec 32))) (Undefined!9075) (MissingVacant!9075 (index!38674 (_ BitVec 32))) )
))
(declare-fun lt!426906 () SeekEntryResult!9075)

(declare-datatypes ((Unit!31907 0))(
  ( (Unit!31908) )
))
(declare-fun lt!426907 () Unit!31907)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57403 (_ BitVec 64) (_ BitVec 32)) Unit!31907)

(assert (=> b!948209 (= lt!426907 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10666 thiss!1141) key!756 (index!38672 lt!426906)))))

(declare-fun tp_is_empty!20677 () Bool)

(declare-fun e!533748 () Bool)

(declare-fun e!533746 () Bool)

(declare-fun array_inv!21520 (array!57403) Bool)

(declare-fun array_inv!21521 (array!57401) Bool)

(assert (=> b!948210 (= e!533746 (and tp!63066 tp_is_empty!20677 (array_inv!21520 (_keys!10666 thiss!1141)) (array_inv!21521 (_values!5752 thiss!1141)) e!533748))))

(declare-fun res!636120 () Bool)

(declare-fun e!533750 () Bool)

(assert (=> start!80982 (=> (not res!636120) (not e!533750))))

(declare-fun valid!1865 (LongMapFixedSize!4864) Bool)

(assert (=> start!80982 (= res!636120 (valid!1865 thiss!1141))))

(assert (=> start!80982 e!533750))

(assert (=> start!80982 e!533746))

(assert (=> start!80982 true))

(declare-fun b!948211 () Bool)

(declare-fun res!636119 () Bool)

(assert (=> b!948211 (=> (not res!636119) (not e!533750))))

(assert (=> b!948211 (= res!636119 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!948212 () Bool)

(declare-fun e!533743 () Bool)

(assert (=> b!948212 (= e!533743 tp_is_empty!20677)))

(declare-fun b!948213 () Bool)

(declare-fun e!533744 () Bool)

(assert (=> b!948213 (= e!533744 tp_is_empty!20677)))

(declare-fun mapIsEmpty!32890 () Bool)

(declare-fun mapRes!32890 () Bool)

(assert (=> mapIsEmpty!32890 mapRes!32890))

(declare-fun mapNonEmpty!32890 () Bool)

(declare-fun tp!63067 () Bool)

(assert (=> mapNonEmpty!32890 (= mapRes!32890 (and tp!63067 e!533744))))

(declare-fun mapRest!32890 () (Array (_ BitVec 32) ValueCell!9857))

(declare-fun mapKey!32890 () (_ BitVec 32))

(declare-fun mapValue!32890 () ValueCell!9857)

(assert (=> mapNonEmpty!32890 (= (arr!27607 (_values!5752 thiss!1141)) (store mapRest!32890 mapKey!32890 mapValue!32890))))

(declare-fun b!948214 () Bool)

(declare-fun res!636117 () Bool)

(assert (=> b!948214 (=> res!636117 e!533749)))

(declare-datatypes ((List!19289 0))(
  ( (Nil!19286) (Cons!19285 (h!20447 (_ BitVec 64)) (t!27602 List!19289)) )
))
(declare-fun arrayNoDuplicates!0 (array!57403 (_ BitVec 32) List!19289) Bool)

(assert (=> b!948214 (= res!636117 (not (arrayNoDuplicates!0 (_keys!10666 thiss!1141) #b00000000000000000000000000000000 Nil!19286)))))

(declare-fun b!948215 () Bool)

(declare-fun res!636114 () Bool)

(assert (=> b!948215 (=> res!636114 e!533749)))

(assert (=> b!948215 (= res!636114 (or (not (= (size!28081 (_values!5752 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27507 thiss!1141)))) (not (= (size!28082 (_keys!10666 thiss!1141)) (size!28081 (_values!5752 thiss!1141)))) (bvslt (mask!27507 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5461 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5461 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!948216 () Bool)

(assert (=> b!948216 (= e!533748 (and e!533743 mapRes!32890))))

(declare-fun condMapEmpty!32890 () Bool)

(declare-fun mapDefault!32890 () ValueCell!9857)

(assert (=> b!948216 (= condMapEmpty!32890 (= (arr!27607 (_values!5752 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9857)) mapDefault!32890)))))

(declare-fun b!948217 () Bool)

(assert (=> b!948217 (= e!533749 (and (bvsge (index!38672 lt!426906) #b00000000000000000000000000000000) (bvslt (index!38672 lt!426906) (size!28082 (_keys!10666 thiss!1141)))))))

(declare-fun b!948218 () Bool)

(declare-fun res!636115 () Bool)

(assert (=> b!948218 (=> res!636115 e!533749)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57403 (_ BitVec 32)) Bool)

(assert (=> b!948218 (= res!636115 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10666 thiss!1141) (mask!27507 thiss!1141))))))

(declare-fun b!948219 () Bool)

(assert (=> b!948219 (= e!533750 e!533745)))

(declare-fun res!636116 () Bool)

(assert (=> b!948219 (=> (not res!636116) (not e!533745))))

(get-info :version)

(assert (=> b!948219 (= res!636116 ((_ is Found!9075) lt!426906))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57403 (_ BitVec 32)) SeekEntryResult!9075)

(assert (=> b!948219 (= lt!426906 (seekEntry!0 key!756 (_keys!10666 thiss!1141) (mask!27507 thiss!1141)))))

(assert (= (and start!80982 res!636120) b!948211))

(assert (= (and b!948211 res!636119) b!948219))

(assert (= (and b!948219 res!636116) b!948209))

(assert (= (and b!948209 (not res!636118)) b!948215))

(assert (= (and b!948215 (not res!636114)) b!948218))

(assert (= (and b!948218 (not res!636115)) b!948214))

(assert (= (and b!948214 (not res!636117)) b!948217))

(assert (= (and b!948216 condMapEmpty!32890) mapIsEmpty!32890))

(assert (= (and b!948216 (not condMapEmpty!32890)) mapNonEmpty!32890))

(assert (= (and mapNonEmpty!32890 ((_ is ValueCellFull!9857) mapValue!32890)) b!948213))

(assert (= (and b!948216 ((_ is ValueCellFull!9857) mapDefault!32890)) b!948212))

(assert (= b!948210 b!948216))

(assert (= start!80982 b!948210))

(declare-fun m!881605 () Bool)

(assert (=> start!80982 m!881605))

(declare-fun m!881607 () Bool)

(assert (=> b!948218 m!881607))

(declare-fun m!881609 () Bool)

(assert (=> b!948214 m!881609))

(declare-fun m!881611 () Bool)

(assert (=> mapNonEmpty!32890 m!881611))

(declare-fun m!881613 () Bool)

(assert (=> b!948210 m!881613))

(declare-fun m!881615 () Bool)

(assert (=> b!948210 m!881615))

(declare-fun m!881617 () Bool)

(assert (=> b!948209 m!881617))

(declare-fun m!881619 () Bool)

(assert (=> b!948209 m!881619))

(declare-fun m!881621 () Bool)

(assert (=> b!948209 m!881621))

(declare-fun m!881623 () Bool)

(assert (=> b!948219 m!881623))

(check-sat (not b!948218) (not b!948209) (not b!948219) (not b_next!18169) (not mapNonEmpty!32890) tp_is_empty!20677 (not b!948210) (not b!948214) b_and!29601 (not start!80982))
(check-sat b_and!29601 (not b_next!18169))
(get-model)

(declare-fun b!948298 () Bool)

(declare-fun e!533807 () SeekEntryResult!9075)

(declare-fun lt!426930 () SeekEntryResult!9075)

(assert (=> b!948298 (= e!533807 (Found!9075 (index!38673 lt!426930)))))

(declare-fun b!948299 () Bool)

(declare-fun e!533806 () SeekEntryResult!9075)

(assert (=> b!948299 (= e!533806 Undefined!9075)))

(declare-fun b!948300 () Bool)

(assert (=> b!948300 (= e!533806 e!533807)))

(declare-fun lt!426928 () (_ BitVec 64))

(assert (=> b!948300 (= lt!426928 (select (arr!27608 (_keys!10666 thiss!1141)) (index!38673 lt!426930)))))

(declare-fun c!98977 () Bool)

(assert (=> b!948300 (= c!98977 (= lt!426928 key!756))))

(declare-fun d!114991 () Bool)

(declare-fun lt!426929 () SeekEntryResult!9075)

(assert (=> d!114991 (and (or ((_ is MissingVacant!9075) lt!426929) (not ((_ is Found!9075) lt!426929)) (and (bvsge (index!38672 lt!426929) #b00000000000000000000000000000000) (bvslt (index!38672 lt!426929) (size!28082 (_keys!10666 thiss!1141))))) (not ((_ is MissingVacant!9075) lt!426929)) (or (not ((_ is Found!9075) lt!426929)) (= (select (arr!27608 (_keys!10666 thiss!1141)) (index!38672 lt!426929)) key!756)))))

(assert (=> d!114991 (= lt!426929 e!533806)))

(declare-fun c!98978 () Bool)

(assert (=> d!114991 (= c!98978 (and ((_ is Intermediate!9075) lt!426930) (undefined!9887 lt!426930)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57403 (_ BitVec 32)) SeekEntryResult!9075)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114991 (= lt!426930 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27507 thiss!1141)) key!756 (_keys!10666 thiss!1141) (mask!27507 thiss!1141)))))

(assert (=> d!114991 (validMask!0 (mask!27507 thiss!1141))))

(assert (=> d!114991 (= (seekEntry!0 key!756 (_keys!10666 thiss!1141) (mask!27507 thiss!1141)) lt!426929)))

(declare-fun b!948301 () Bool)

(declare-fun c!98976 () Bool)

(assert (=> b!948301 (= c!98976 (= lt!426928 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!533805 () SeekEntryResult!9075)

(assert (=> b!948301 (= e!533807 e!533805)))

(declare-fun b!948302 () Bool)

(declare-fun lt!426931 () SeekEntryResult!9075)

(assert (=> b!948302 (= e!533805 (ite ((_ is MissingVacant!9075) lt!426931) (MissingZero!9075 (index!38674 lt!426931)) lt!426931))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57403 (_ BitVec 32)) SeekEntryResult!9075)

(assert (=> b!948302 (= lt!426931 (seekKeyOrZeroReturnVacant!0 (x!81473 lt!426930) (index!38673 lt!426930) (index!38673 lt!426930) key!756 (_keys!10666 thiss!1141) (mask!27507 thiss!1141)))))

(declare-fun b!948303 () Bool)

(assert (=> b!948303 (= e!533805 (MissingZero!9075 (index!38673 lt!426930)))))

(assert (= (and d!114991 c!98978) b!948299))

(assert (= (and d!114991 (not c!98978)) b!948300))

(assert (= (and b!948300 c!98977) b!948298))

(assert (= (and b!948300 (not c!98977)) b!948301))

(assert (= (and b!948301 c!98976) b!948303))

(assert (= (and b!948301 (not c!98976)) b!948302))

(declare-fun m!881665 () Bool)

(assert (=> b!948300 m!881665))

(declare-fun m!881667 () Bool)

(assert (=> d!114991 m!881667))

(declare-fun m!881669 () Bool)

(assert (=> d!114991 m!881669))

(assert (=> d!114991 m!881669))

(declare-fun m!881671 () Bool)

(assert (=> d!114991 m!881671))

(assert (=> d!114991 m!881617))

(declare-fun m!881673 () Bool)

(assert (=> b!948302 m!881673))

(assert (=> b!948219 d!114991))

(declare-fun b!948314 () Bool)

(declare-fun e!533819 () Bool)

(declare-fun contains!5201 (List!19289 (_ BitVec 64)) Bool)

(assert (=> b!948314 (= e!533819 (contains!5201 Nil!19286 (select (arr!27608 (_keys!10666 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948315 () Bool)

(declare-fun e!533818 () Bool)

(declare-fun e!533817 () Bool)

(assert (=> b!948315 (= e!533818 e!533817)))

(declare-fun c!98981 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!948315 (= c!98981 (validKeyInArray!0 (select (arr!27608 (_keys!10666 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948316 () Bool)

(declare-fun e!533816 () Bool)

(assert (=> b!948316 (= e!533816 e!533818)))

(declare-fun res!636170 () Bool)

(assert (=> b!948316 (=> (not res!636170) (not e!533818))))

(assert (=> b!948316 (= res!636170 (not e!533819))))

(declare-fun res!636169 () Bool)

(assert (=> b!948316 (=> (not res!636169) (not e!533819))))

(assert (=> b!948316 (= res!636169 (validKeyInArray!0 (select (arr!27608 (_keys!10666 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41157 () Bool)

(declare-fun call!41160 () Bool)

(assert (=> bm!41157 (= call!41160 (arrayNoDuplicates!0 (_keys!10666 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98981 (Cons!19285 (select (arr!27608 (_keys!10666 thiss!1141)) #b00000000000000000000000000000000) Nil!19286) Nil!19286)))))

(declare-fun b!948317 () Bool)

(assert (=> b!948317 (= e!533817 call!41160)))

(declare-fun b!948318 () Bool)

(assert (=> b!948318 (= e!533817 call!41160)))

(declare-fun d!114993 () Bool)

(declare-fun res!636171 () Bool)

(assert (=> d!114993 (=> res!636171 e!533816)))

(assert (=> d!114993 (= res!636171 (bvsge #b00000000000000000000000000000000 (size!28082 (_keys!10666 thiss!1141))))))

(assert (=> d!114993 (= (arrayNoDuplicates!0 (_keys!10666 thiss!1141) #b00000000000000000000000000000000 Nil!19286) e!533816)))

(assert (= (and d!114993 (not res!636171)) b!948316))

(assert (= (and b!948316 res!636169) b!948314))

(assert (= (and b!948316 res!636170) b!948315))

(assert (= (and b!948315 c!98981) b!948317))

(assert (= (and b!948315 (not c!98981)) b!948318))

(assert (= (or b!948317 b!948318) bm!41157))

(declare-fun m!881675 () Bool)

(assert (=> b!948314 m!881675))

(assert (=> b!948314 m!881675))

(declare-fun m!881677 () Bool)

(assert (=> b!948314 m!881677))

(assert (=> b!948315 m!881675))

(assert (=> b!948315 m!881675))

(declare-fun m!881679 () Bool)

(assert (=> b!948315 m!881679))

(assert (=> b!948316 m!881675))

(assert (=> b!948316 m!881675))

(assert (=> b!948316 m!881679))

(assert (=> bm!41157 m!881675))

(declare-fun m!881681 () Bool)

(assert (=> bm!41157 m!881681))

(assert (=> b!948214 d!114993))

(declare-fun d!114995 () Bool)

(declare-fun res!636178 () Bool)

(declare-fun e!533822 () Bool)

(assert (=> d!114995 (=> (not res!636178) (not e!533822))))

(declare-fun simpleValid!363 (LongMapFixedSize!4864) Bool)

(assert (=> d!114995 (= res!636178 (simpleValid!363 thiss!1141))))

(assert (=> d!114995 (= (valid!1865 thiss!1141) e!533822)))

(declare-fun b!948325 () Bool)

(declare-fun res!636179 () Bool)

(assert (=> b!948325 (=> (not res!636179) (not e!533822))))

(declare-fun arrayCountValidKeys!0 (array!57403 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!948325 (= res!636179 (= (arrayCountValidKeys!0 (_keys!10666 thiss!1141) #b00000000000000000000000000000000 (size!28082 (_keys!10666 thiss!1141))) (_size!2487 thiss!1141)))))

(declare-fun b!948326 () Bool)

(declare-fun res!636180 () Bool)

(assert (=> b!948326 (=> (not res!636180) (not e!533822))))

(assert (=> b!948326 (= res!636180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10666 thiss!1141) (mask!27507 thiss!1141)))))

(declare-fun b!948327 () Bool)

(assert (=> b!948327 (= e!533822 (arrayNoDuplicates!0 (_keys!10666 thiss!1141) #b00000000000000000000000000000000 Nil!19286))))

(assert (= (and d!114995 res!636178) b!948325))

(assert (= (and b!948325 res!636179) b!948326))

(assert (= (and b!948326 res!636180) b!948327))

(declare-fun m!881683 () Bool)

(assert (=> d!114995 m!881683))

(declare-fun m!881685 () Bool)

(assert (=> b!948325 m!881685))

(assert (=> b!948326 m!881607))

(assert (=> b!948327 m!881609))

(assert (=> start!80982 d!114995))

(declare-fun d!114997 () Bool)

(assert (=> d!114997 (= (validMask!0 (mask!27507 thiss!1141)) (and (or (= (mask!27507 thiss!1141) #b00000000000000000000000000000111) (= (mask!27507 thiss!1141) #b00000000000000000000000000001111) (= (mask!27507 thiss!1141) #b00000000000000000000000000011111) (= (mask!27507 thiss!1141) #b00000000000000000000000000111111) (= (mask!27507 thiss!1141) #b00000000000000000000000001111111) (= (mask!27507 thiss!1141) #b00000000000000000000000011111111) (= (mask!27507 thiss!1141) #b00000000000000000000000111111111) (= (mask!27507 thiss!1141) #b00000000000000000000001111111111) (= (mask!27507 thiss!1141) #b00000000000000000000011111111111) (= (mask!27507 thiss!1141) #b00000000000000000000111111111111) (= (mask!27507 thiss!1141) #b00000000000000000001111111111111) (= (mask!27507 thiss!1141) #b00000000000000000011111111111111) (= (mask!27507 thiss!1141) #b00000000000000000111111111111111) (= (mask!27507 thiss!1141) #b00000000000000001111111111111111) (= (mask!27507 thiss!1141) #b00000000000000011111111111111111) (= (mask!27507 thiss!1141) #b00000000000000111111111111111111) (= (mask!27507 thiss!1141) #b00000000000001111111111111111111) (= (mask!27507 thiss!1141) #b00000000000011111111111111111111) (= (mask!27507 thiss!1141) #b00000000000111111111111111111111) (= (mask!27507 thiss!1141) #b00000000001111111111111111111111) (= (mask!27507 thiss!1141) #b00000000011111111111111111111111) (= (mask!27507 thiss!1141) #b00000000111111111111111111111111) (= (mask!27507 thiss!1141) #b00000001111111111111111111111111) (= (mask!27507 thiss!1141) #b00000011111111111111111111111111) (= (mask!27507 thiss!1141) #b00000111111111111111111111111111) (= (mask!27507 thiss!1141) #b00001111111111111111111111111111) (= (mask!27507 thiss!1141) #b00011111111111111111111111111111) (= (mask!27507 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27507 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!948209 d!114997))

(declare-fun d!114999 () Bool)

(declare-fun res!636185 () Bool)

(declare-fun e!533827 () Bool)

(assert (=> d!114999 (=> res!636185 e!533827)))

(assert (=> d!114999 (= res!636185 (= (select (arr!27608 (_keys!10666 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114999 (= (arrayContainsKey!0 (_keys!10666 thiss!1141) key!756 #b00000000000000000000000000000000) e!533827)))

(declare-fun b!948332 () Bool)

(declare-fun e!533828 () Bool)

(assert (=> b!948332 (= e!533827 e!533828)))

(declare-fun res!636186 () Bool)

(assert (=> b!948332 (=> (not res!636186) (not e!533828))))

(assert (=> b!948332 (= res!636186 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28082 (_keys!10666 thiss!1141))))))

(declare-fun b!948333 () Bool)

(assert (=> b!948333 (= e!533828 (arrayContainsKey!0 (_keys!10666 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114999 (not res!636185)) b!948332))

(assert (= (and b!948332 res!636186) b!948333))

(assert (=> d!114999 m!881675))

(declare-fun m!881687 () Bool)

(assert (=> b!948333 m!881687))

(assert (=> b!948209 d!114999))

(declare-fun d!115001 () Bool)

(assert (=> d!115001 (arrayContainsKey!0 (_keys!10666 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426934 () Unit!31907)

(declare-fun choose!13 (array!57403 (_ BitVec 64) (_ BitVec 32)) Unit!31907)

(assert (=> d!115001 (= lt!426934 (choose!13 (_keys!10666 thiss!1141) key!756 (index!38672 lt!426906)))))

(assert (=> d!115001 (bvsge (index!38672 lt!426906) #b00000000000000000000000000000000)))

(assert (=> d!115001 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10666 thiss!1141) key!756 (index!38672 lt!426906)) lt!426934)))

(declare-fun bs!26641 () Bool)

(assert (= bs!26641 d!115001))

(assert (=> bs!26641 m!881619))

(declare-fun m!881689 () Bool)

(assert (=> bs!26641 m!881689))

(assert (=> b!948209 d!115001))

(declare-fun b!948342 () Bool)

(declare-fun e!533837 () Bool)

(declare-fun e!533836 () Bool)

(assert (=> b!948342 (= e!533837 e!533836)))

(declare-fun c!98984 () Bool)

(assert (=> b!948342 (= c!98984 (validKeyInArray!0 (select (arr!27608 (_keys!10666 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41160 () Bool)

(declare-fun call!41163 () Bool)

(assert (=> bm!41160 (= call!41163 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10666 thiss!1141) (mask!27507 thiss!1141)))))

(declare-fun b!948343 () Bool)

(assert (=> b!948343 (= e!533836 call!41163)))

(declare-fun d!115003 () Bool)

(declare-fun res!636192 () Bool)

(assert (=> d!115003 (=> res!636192 e!533837)))

(assert (=> d!115003 (= res!636192 (bvsge #b00000000000000000000000000000000 (size!28082 (_keys!10666 thiss!1141))))))

(assert (=> d!115003 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10666 thiss!1141) (mask!27507 thiss!1141)) e!533837)))

(declare-fun b!948344 () Bool)

(declare-fun e!533835 () Bool)

(assert (=> b!948344 (= e!533835 call!41163)))

(declare-fun b!948345 () Bool)

(assert (=> b!948345 (= e!533836 e!533835)))

(declare-fun lt!426942 () (_ BitVec 64))

(assert (=> b!948345 (= lt!426942 (select (arr!27608 (_keys!10666 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426943 () Unit!31907)

(assert (=> b!948345 (= lt!426943 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10666 thiss!1141) lt!426942 #b00000000000000000000000000000000))))

(assert (=> b!948345 (arrayContainsKey!0 (_keys!10666 thiss!1141) lt!426942 #b00000000000000000000000000000000)))

(declare-fun lt!426941 () Unit!31907)

(assert (=> b!948345 (= lt!426941 lt!426943)))

(declare-fun res!636191 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57403 (_ BitVec 32)) SeekEntryResult!9075)

(assert (=> b!948345 (= res!636191 (= (seekEntryOrOpen!0 (select (arr!27608 (_keys!10666 thiss!1141)) #b00000000000000000000000000000000) (_keys!10666 thiss!1141) (mask!27507 thiss!1141)) (Found!9075 #b00000000000000000000000000000000)))))

(assert (=> b!948345 (=> (not res!636191) (not e!533835))))

(assert (= (and d!115003 (not res!636192)) b!948342))

(assert (= (and b!948342 c!98984) b!948345))

(assert (= (and b!948342 (not c!98984)) b!948343))

(assert (= (and b!948345 res!636191) b!948344))

(assert (= (or b!948344 b!948343) bm!41160))

(assert (=> b!948342 m!881675))

(assert (=> b!948342 m!881675))

(assert (=> b!948342 m!881679))

(declare-fun m!881691 () Bool)

(assert (=> bm!41160 m!881691))

(assert (=> b!948345 m!881675))

(declare-fun m!881693 () Bool)

(assert (=> b!948345 m!881693))

(declare-fun m!881695 () Bool)

(assert (=> b!948345 m!881695))

(assert (=> b!948345 m!881675))

(declare-fun m!881697 () Bool)

(assert (=> b!948345 m!881697))

(assert (=> b!948218 d!115003))

(declare-fun d!115005 () Bool)

(assert (=> d!115005 (= (array_inv!21520 (_keys!10666 thiss!1141)) (bvsge (size!28082 (_keys!10666 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948210 d!115005))

(declare-fun d!115007 () Bool)

(assert (=> d!115007 (= (array_inv!21521 (_values!5752 thiss!1141)) (bvsge (size!28081 (_values!5752 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948210 d!115007))

(declare-fun condMapEmpty!32899 () Bool)

(declare-fun mapDefault!32899 () ValueCell!9857)

(assert (=> mapNonEmpty!32890 (= condMapEmpty!32899 (= mapRest!32890 ((as const (Array (_ BitVec 32) ValueCell!9857)) mapDefault!32899)))))

(declare-fun e!533842 () Bool)

(declare-fun mapRes!32899 () Bool)

(assert (=> mapNonEmpty!32890 (= tp!63067 (and e!533842 mapRes!32899))))

(declare-fun b!948353 () Bool)

(assert (=> b!948353 (= e!533842 tp_is_empty!20677)))

(declare-fun mapIsEmpty!32899 () Bool)

(assert (=> mapIsEmpty!32899 mapRes!32899))

(declare-fun mapNonEmpty!32899 () Bool)

(declare-fun tp!63082 () Bool)

(declare-fun e!533843 () Bool)

(assert (=> mapNonEmpty!32899 (= mapRes!32899 (and tp!63082 e!533843))))

(declare-fun mapRest!32899 () (Array (_ BitVec 32) ValueCell!9857))

(declare-fun mapKey!32899 () (_ BitVec 32))

(declare-fun mapValue!32899 () ValueCell!9857)

(assert (=> mapNonEmpty!32899 (= mapRest!32890 (store mapRest!32899 mapKey!32899 mapValue!32899))))

(declare-fun b!948352 () Bool)

(assert (=> b!948352 (= e!533843 tp_is_empty!20677)))

(assert (= (and mapNonEmpty!32890 condMapEmpty!32899) mapIsEmpty!32899))

(assert (= (and mapNonEmpty!32890 (not condMapEmpty!32899)) mapNonEmpty!32899))

(assert (= (and mapNonEmpty!32899 ((_ is ValueCellFull!9857) mapValue!32899)) b!948352))

(assert (= (and mapNonEmpty!32890 ((_ is ValueCellFull!9857) mapDefault!32899)) b!948353))

(declare-fun m!881699 () Bool)

(assert (=> mapNonEmpty!32899 m!881699))

(check-sat (not b!948345) (not b!948315) (not b!948325) (not b!948302) (not b!948326) (not b!948316) (not d!115001) (not b!948314) (not d!114991) (not bm!41157) (not bm!41160) b_and!29601 (not b!948342) (not b_next!18169) (not b!948333) tp_is_empty!20677 (not b!948327) (not mapNonEmpty!32899) (not d!114995))
(check-sat b_and!29601 (not b_next!18169))
