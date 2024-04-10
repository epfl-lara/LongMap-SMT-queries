; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80792 () Bool)

(assert start!80792)

(declare-fun b!947181 () Bool)

(declare-fun b_free!18165 () Bool)

(declare-fun b_next!18165 () Bool)

(assert (=> b!947181 (= b_free!18165 (not b_next!18165))))

(declare-fun tp!63050 () Bool)

(declare-fun b_and!29587 () Bool)

(assert (=> b!947181 (= tp!63050 b_and!29587)))

(declare-fun mapIsEmpty!32881 () Bool)

(declare-fun mapRes!32881 () Bool)

(assert (=> mapIsEmpty!32881 mapRes!32881))

(declare-fun b!947176 () Bool)

(declare-fun e!533069 () Bool)

(declare-datatypes ((V!32529 0))(
  ( (V!32530 (val!10387 Int)) )
))
(declare-datatypes ((ValueCell!9855 0))(
  ( (ValueCellFull!9855 (v!12921 V!32529)) (EmptyCell!9855) )
))
(declare-datatypes ((array!57340 0))(
  ( (array!57341 (arr!27582 (Array (_ BitVec 32) ValueCell!9855)) (size!28055 (_ BitVec 32))) )
))
(declare-datatypes ((array!57342 0))(
  ( (array!57343 (arr!27583 (Array (_ BitVec 32) (_ BitVec 64))) (size!28056 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4860 0))(
  ( (LongMapFixedSize!4861 (defaultEntry!5727 Int) (mask!27457 (_ BitVec 32)) (extraKeys!5459 (_ BitVec 32)) (zeroValue!5563 V!32529) (minValue!5563 V!32529) (_size!2485 (_ BitVec 32)) (_keys!10634 array!57342) (_values!5750 array!57340) (_vacant!2485 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4860)

(declare-datatypes ((List!19302 0))(
  ( (Nil!19299) (Cons!19298 (h!20454 (_ BitVec 64)) (t!27623 List!19302)) )
))
(declare-fun arrayNoDuplicates!0 (array!57342 (_ BitVec 32) List!19302) Bool)

(assert (=> b!947176 (= e!533069 (arrayNoDuplicates!0 (_keys!10634 thiss!1141) #b00000000000000000000000000000000 Nil!19299))))

(declare-fun b!947177 () Bool)

(declare-fun res!635707 () Bool)

(declare-fun e!533073 () Bool)

(assert (=> b!947177 (=> (not res!635707) (not e!533073))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!947177 (= res!635707 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!947178 () Bool)

(declare-fun e!533070 () Bool)

(assert (=> b!947178 (= e!533070 (not e!533069))))

(declare-fun res!635705 () Bool)

(assert (=> b!947178 (=> res!635705 e!533069)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!947178 (= res!635705 (not (validMask!0 (mask!27457 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57342 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!947178 (arrayContainsKey!0 (_keys!10634 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!9110 0))(
  ( (MissingZero!9110 (index!38811 (_ BitVec 32))) (Found!9110 (index!38812 (_ BitVec 32))) (Intermediate!9110 (undefined!9922 Bool) (index!38813 (_ BitVec 32)) (x!81478 (_ BitVec 32))) (Undefined!9110) (MissingVacant!9110 (index!38814 (_ BitVec 32))) )
))
(declare-fun lt!426509 () SeekEntryResult!9110)

(declare-datatypes ((Unit!31916 0))(
  ( (Unit!31917) )
))
(declare-fun lt!426510 () Unit!31916)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57342 (_ BitVec 64) (_ BitVec 32)) Unit!31916)

(assert (=> b!947178 (= lt!426510 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10634 thiss!1141) key!756 (index!38812 lt!426509)))))

(declare-fun b!947179 () Bool)

(assert (=> b!947179 (= e!533073 e!533070)))

(declare-fun res!635706 () Bool)

(assert (=> b!947179 (=> (not res!635706) (not e!533070))))

(get-info :version)

(assert (=> b!947179 (= res!635706 ((_ is Found!9110) lt!426509))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57342 (_ BitVec 32)) SeekEntryResult!9110)

(assert (=> b!947179 (= lt!426509 (seekEntry!0 key!756 (_keys!10634 thiss!1141) (mask!27457 thiss!1141)))))

(declare-fun b!947180 () Bool)

(declare-fun e!533074 () Bool)

(declare-fun tp_is_empty!20673 () Bool)

(assert (=> b!947180 (= e!533074 tp_is_empty!20673)))

(declare-fun mapNonEmpty!32881 () Bool)

(declare-fun tp!63051 () Bool)

(declare-fun e!533072 () Bool)

(assert (=> mapNonEmpty!32881 (= mapRes!32881 (and tp!63051 e!533072))))

(declare-fun mapValue!32881 () ValueCell!9855)

(declare-fun mapKey!32881 () (_ BitVec 32))

(declare-fun mapRest!32881 () (Array (_ BitVec 32) ValueCell!9855))

(assert (=> mapNonEmpty!32881 (= (arr!27582 (_values!5750 thiss!1141)) (store mapRest!32881 mapKey!32881 mapValue!32881))))

(declare-fun e!533068 () Bool)

(declare-fun e!533075 () Bool)

(declare-fun array_inv!21410 (array!57342) Bool)

(declare-fun array_inv!21411 (array!57340) Bool)

(assert (=> b!947181 (= e!533068 (and tp!63050 tp_is_empty!20673 (array_inv!21410 (_keys!10634 thiss!1141)) (array_inv!21411 (_values!5750 thiss!1141)) e!533075))))

(declare-fun b!947182 () Bool)

(assert (=> b!947182 (= e!533075 (and e!533074 mapRes!32881))))

(declare-fun condMapEmpty!32881 () Bool)

(declare-fun mapDefault!32881 () ValueCell!9855)

(assert (=> b!947182 (= condMapEmpty!32881 (= (arr!27582 (_values!5750 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9855)) mapDefault!32881)))))

(declare-fun b!947183 () Bool)

(declare-fun res!635702 () Bool)

(assert (=> b!947183 (=> res!635702 e!533069)))

(assert (=> b!947183 (= res!635702 (or (not (= (size!28055 (_values!5750 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27457 thiss!1141)))) (not (= (size!28056 (_keys!10634 thiss!1141)) (size!28055 (_values!5750 thiss!1141)))) (bvslt (mask!27457 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5459 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5459 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun res!635703 () Bool)

(assert (=> start!80792 (=> (not res!635703) (not e!533073))))

(declare-fun valid!1851 (LongMapFixedSize!4860) Bool)

(assert (=> start!80792 (= res!635703 (valid!1851 thiss!1141))))

(assert (=> start!80792 e!533073))

(assert (=> start!80792 e!533068))

(assert (=> start!80792 true))

(declare-fun b!947184 () Bool)

(declare-fun res!635704 () Bool)

(assert (=> b!947184 (=> res!635704 e!533069)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57342 (_ BitVec 32)) Bool)

(assert (=> b!947184 (= res!635704 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10634 thiss!1141) (mask!27457 thiss!1141))))))

(declare-fun b!947185 () Bool)

(assert (=> b!947185 (= e!533072 tp_is_empty!20673)))

(assert (= (and start!80792 res!635703) b!947177))

(assert (= (and b!947177 res!635707) b!947179))

(assert (= (and b!947179 res!635706) b!947178))

(assert (= (and b!947178 (not res!635705)) b!947183))

(assert (= (and b!947183 (not res!635702)) b!947184))

(assert (= (and b!947184 (not res!635704)) b!947176))

(assert (= (and b!947182 condMapEmpty!32881) mapIsEmpty!32881))

(assert (= (and b!947182 (not condMapEmpty!32881)) mapNonEmpty!32881))

(assert (= (and mapNonEmpty!32881 ((_ is ValueCellFull!9855) mapValue!32881)) b!947185))

(assert (= (and b!947182 ((_ is ValueCellFull!9855) mapDefault!32881)) b!947180))

(assert (= b!947181 b!947182))

(assert (= start!80792 b!947181))

(declare-fun m!880235 () Bool)

(assert (=> b!947178 m!880235))

(declare-fun m!880237 () Bool)

(assert (=> b!947178 m!880237))

(declare-fun m!880239 () Bool)

(assert (=> b!947178 m!880239))

(declare-fun m!880241 () Bool)

(assert (=> b!947179 m!880241))

(declare-fun m!880243 () Bool)

(assert (=> b!947176 m!880243))

(declare-fun m!880245 () Bool)

(assert (=> b!947184 m!880245))

(declare-fun m!880247 () Bool)

(assert (=> mapNonEmpty!32881 m!880247))

(declare-fun m!880249 () Bool)

(assert (=> b!947181 m!880249))

(declare-fun m!880251 () Bool)

(assert (=> b!947181 m!880251))

(declare-fun m!880253 () Bool)

(assert (=> start!80792 m!880253))

(check-sat (not b!947184) (not b!947181) (not start!80792) (not b_next!18165) b_and!29587 (not b!947179) (not mapNonEmpty!32881) tp_is_empty!20673 (not b!947178) (not b!947176))
(check-sat b_and!29587 (not b_next!18165))
(get-model)

(declare-fun d!114649 () Bool)

(assert (=> d!114649 (= (validMask!0 (mask!27457 thiss!1141)) (and (or (= (mask!27457 thiss!1141) #b00000000000000000000000000000111) (= (mask!27457 thiss!1141) #b00000000000000000000000000001111) (= (mask!27457 thiss!1141) #b00000000000000000000000000011111) (= (mask!27457 thiss!1141) #b00000000000000000000000000111111) (= (mask!27457 thiss!1141) #b00000000000000000000000001111111) (= (mask!27457 thiss!1141) #b00000000000000000000000011111111) (= (mask!27457 thiss!1141) #b00000000000000000000000111111111) (= (mask!27457 thiss!1141) #b00000000000000000000001111111111) (= (mask!27457 thiss!1141) #b00000000000000000000011111111111) (= (mask!27457 thiss!1141) #b00000000000000000000111111111111) (= (mask!27457 thiss!1141) #b00000000000000000001111111111111) (= (mask!27457 thiss!1141) #b00000000000000000011111111111111) (= (mask!27457 thiss!1141) #b00000000000000000111111111111111) (= (mask!27457 thiss!1141) #b00000000000000001111111111111111) (= (mask!27457 thiss!1141) #b00000000000000011111111111111111) (= (mask!27457 thiss!1141) #b00000000000000111111111111111111) (= (mask!27457 thiss!1141) #b00000000000001111111111111111111) (= (mask!27457 thiss!1141) #b00000000000011111111111111111111) (= (mask!27457 thiss!1141) #b00000000000111111111111111111111) (= (mask!27457 thiss!1141) #b00000000001111111111111111111111) (= (mask!27457 thiss!1141) #b00000000011111111111111111111111) (= (mask!27457 thiss!1141) #b00000000111111111111111111111111) (= (mask!27457 thiss!1141) #b00000001111111111111111111111111) (= (mask!27457 thiss!1141) #b00000011111111111111111111111111) (= (mask!27457 thiss!1141) #b00000111111111111111111111111111) (= (mask!27457 thiss!1141) #b00001111111111111111111111111111) (= (mask!27457 thiss!1141) #b00011111111111111111111111111111) (= (mask!27457 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27457 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!947178 d!114649))

(declare-fun d!114651 () Bool)

(declare-fun res!635730 () Bool)

(declare-fun e!533104 () Bool)

(assert (=> d!114651 (=> res!635730 e!533104)))

(assert (=> d!114651 (= res!635730 (= (select (arr!27583 (_keys!10634 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114651 (= (arrayContainsKey!0 (_keys!10634 thiss!1141) key!756 #b00000000000000000000000000000000) e!533104)))

(declare-fun b!947220 () Bool)

(declare-fun e!533105 () Bool)

(assert (=> b!947220 (= e!533104 e!533105)))

(declare-fun res!635731 () Bool)

(assert (=> b!947220 (=> (not res!635731) (not e!533105))))

(assert (=> b!947220 (= res!635731 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28056 (_keys!10634 thiss!1141))))))

(declare-fun b!947221 () Bool)

(assert (=> b!947221 (= e!533105 (arrayContainsKey!0 (_keys!10634 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114651 (not res!635730)) b!947220))

(assert (= (and b!947220 res!635731) b!947221))

(declare-fun m!880275 () Bool)

(assert (=> d!114651 m!880275))

(declare-fun m!880277 () Bool)

(assert (=> b!947221 m!880277))

(assert (=> b!947178 d!114651))

(declare-fun d!114653 () Bool)

(assert (=> d!114653 (arrayContainsKey!0 (_keys!10634 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426519 () Unit!31916)

(declare-fun choose!13 (array!57342 (_ BitVec 64) (_ BitVec 32)) Unit!31916)

(assert (=> d!114653 (= lt!426519 (choose!13 (_keys!10634 thiss!1141) key!756 (index!38812 lt!426509)))))

(assert (=> d!114653 (bvsge (index!38812 lt!426509) #b00000000000000000000000000000000)))

(assert (=> d!114653 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10634 thiss!1141) key!756 (index!38812 lt!426509)) lt!426519)))

(declare-fun bs!26624 () Bool)

(assert (= bs!26624 d!114653))

(assert (=> bs!26624 m!880237))

(declare-fun m!880279 () Bool)

(assert (=> bs!26624 m!880279))

(assert (=> b!947178 d!114653))

(declare-fun b!947235 () Bool)

(declare-fun e!533113 () SeekEntryResult!9110)

(assert (=> b!947235 (= e!533113 Undefined!9110)))

(declare-fun b!947236 () Bool)

(declare-fun e!533112 () SeekEntryResult!9110)

(assert (=> b!947236 (= e!533113 e!533112)))

(declare-fun lt!426530 () (_ BitVec 64))

(declare-fun lt!426528 () SeekEntryResult!9110)

(assert (=> b!947236 (= lt!426530 (select (arr!27583 (_keys!10634 thiss!1141)) (index!38813 lt!426528)))))

(declare-fun c!98679 () Bool)

(assert (=> b!947236 (= c!98679 (= lt!426530 key!756))))

(declare-fun b!947237 () Bool)

(declare-fun c!98680 () Bool)

(assert (=> b!947237 (= c!98680 (= lt!426530 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!533114 () SeekEntryResult!9110)

(assert (=> b!947237 (= e!533112 e!533114)))

(declare-fun b!947238 () Bool)

(assert (=> b!947238 (= e!533114 (MissingZero!9110 (index!38813 lt!426528)))))

(declare-fun b!947239 () Bool)

(assert (=> b!947239 (= e!533112 (Found!9110 (index!38813 lt!426528)))))

(declare-fun b!947234 () Bool)

(declare-fun lt!426529 () SeekEntryResult!9110)

(assert (=> b!947234 (= e!533114 (ite ((_ is MissingVacant!9110) lt!426529) (MissingZero!9110 (index!38814 lt!426529)) lt!426529))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57342 (_ BitVec 32)) SeekEntryResult!9110)

(assert (=> b!947234 (= lt!426529 (seekKeyOrZeroReturnVacant!0 (x!81478 lt!426528) (index!38813 lt!426528) (index!38813 lt!426528) key!756 (_keys!10634 thiss!1141) (mask!27457 thiss!1141)))))

(declare-fun d!114655 () Bool)

(declare-fun lt!426531 () SeekEntryResult!9110)

(assert (=> d!114655 (and (or ((_ is MissingVacant!9110) lt!426531) (not ((_ is Found!9110) lt!426531)) (and (bvsge (index!38812 lt!426531) #b00000000000000000000000000000000) (bvslt (index!38812 lt!426531) (size!28056 (_keys!10634 thiss!1141))))) (not ((_ is MissingVacant!9110) lt!426531)) (or (not ((_ is Found!9110) lt!426531)) (= (select (arr!27583 (_keys!10634 thiss!1141)) (index!38812 lt!426531)) key!756)))))

(assert (=> d!114655 (= lt!426531 e!533113)))

(declare-fun c!98681 () Bool)

(assert (=> d!114655 (= c!98681 (and ((_ is Intermediate!9110) lt!426528) (undefined!9922 lt!426528)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57342 (_ BitVec 32)) SeekEntryResult!9110)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114655 (= lt!426528 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27457 thiss!1141)) key!756 (_keys!10634 thiss!1141) (mask!27457 thiss!1141)))))

(assert (=> d!114655 (validMask!0 (mask!27457 thiss!1141))))

(assert (=> d!114655 (= (seekEntry!0 key!756 (_keys!10634 thiss!1141) (mask!27457 thiss!1141)) lt!426531)))

(assert (= (and d!114655 c!98681) b!947235))

(assert (= (and d!114655 (not c!98681)) b!947236))

(assert (= (and b!947236 c!98679) b!947239))

(assert (= (and b!947236 (not c!98679)) b!947237))

(assert (= (and b!947237 c!98680) b!947238))

(assert (= (and b!947237 (not c!98680)) b!947234))

(declare-fun m!880281 () Bool)

(assert (=> b!947236 m!880281))

(declare-fun m!880283 () Bool)

(assert (=> b!947234 m!880283))

(declare-fun m!880285 () Bool)

(assert (=> d!114655 m!880285))

(declare-fun m!880287 () Bool)

(assert (=> d!114655 m!880287))

(assert (=> d!114655 m!880287))

(declare-fun m!880289 () Bool)

(assert (=> d!114655 m!880289))

(assert (=> d!114655 m!880235))

(assert (=> b!947179 d!114655))

(declare-fun d!114657 () Bool)

(assert (=> d!114657 (= (array_inv!21410 (_keys!10634 thiss!1141)) (bvsge (size!28056 (_keys!10634 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947181 d!114657))

(declare-fun d!114659 () Bool)

(assert (=> d!114659 (= (array_inv!21411 (_values!5750 thiss!1141)) (bvsge (size!28055 (_values!5750 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947181 d!114659))

(declare-fun d!114661 () Bool)

(declare-fun res!635738 () Bool)

(declare-fun e!533117 () Bool)

(assert (=> d!114661 (=> (not res!635738) (not e!533117))))

(declare-fun simpleValid!362 (LongMapFixedSize!4860) Bool)

(assert (=> d!114661 (= res!635738 (simpleValid!362 thiss!1141))))

(assert (=> d!114661 (= (valid!1851 thiss!1141) e!533117)))

(declare-fun b!947246 () Bool)

(declare-fun res!635739 () Bool)

(assert (=> b!947246 (=> (not res!635739) (not e!533117))))

(declare-fun arrayCountValidKeys!0 (array!57342 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!947246 (= res!635739 (= (arrayCountValidKeys!0 (_keys!10634 thiss!1141) #b00000000000000000000000000000000 (size!28056 (_keys!10634 thiss!1141))) (_size!2485 thiss!1141)))))

(declare-fun b!947247 () Bool)

(declare-fun res!635740 () Bool)

(assert (=> b!947247 (=> (not res!635740) (not e!533117))))

(assert (=> b!947247 (= res!635740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10634 thiss!1141) (mask!27457 thiss!1141)))))

(declare-fun b!947248 () Bool)

(assert (=> b!947248 (= e!533117 (arrayNoDuplicates!0 (_keys!10634 thiss!1141) #b00000000000000000000000000000000 Nil!19299))))

(assert (= (and d!114661 res!635738) b!947246))

(assert (= (and b!947246 res!635739) b!947247))

(assert (= (and b!947247 res!635740) b!947248))

(declare-fun m!880291 () Bool)

(assert (=> d!114661 m!880291))

(declare-fun m!880293 () Bool)

(assert (=> b!947246 m!880293))

(assert (=> b!947247 m!880245))

(assert (=> b!947248 m!880243))

(assert (=> start!80792 d!114661))

(declare-fun bm!41106 () Bool)

(declare-fun call!41109 () Bool)

(declare-fun c!98684 () Bool)

(assert (=> bm!41106 (= call!41109 (arrayNoDuplicates!0 (_keys!10634 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98684 (Cons!19298 (select (arr!27583 (_keys!10634 thiss!1141)) #b00000000000000000000000000000000) Nil!19299) Nil!19299)))))

(declare-fun b!947259 () Bool)

(declare-fun e!533126 () Bool)

(declare-fun contains!5198 (List!19302 (_ BitVec 64)) Bool)

(assert (=> b!947259 (= e!533126 (contains!5198 Nil!19299 (select (arr!27583 (_keys!10634 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947260 () Bool)

(declare-fun e!533128 () Bool)

(assert (=> b!947260 (= e!533128 call!41109)))

(declare-fun b!947261 () Bool)

(declare-fun e!533129 () Bool)

(declare-fun e!533127 () Bool)

(assert (=> b!947261 (= e!533129 e!533127)))

(declare-fun res!635747 () Bool)

(assert (=> b!947261 (=> (not res!635747) (not e!533127))))

(assert (=> b!947261 (= res!635747 (not e!533126))))

(declare-fun res!635749 () Bool)

(assert (=> b!947261 (=> (not res!635749) (not e!533126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!947261 (= res!635749 (validKeyInArray!0 (select (arr!27583 (_keys!10634 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947262 () Bool)

(assert (=> b!947262 (= e!533127 e!533128)))

(assert (=> b!947262 (= c!98684 (validKeyInArray!0 (select (arr!27583 (_keys!10634 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114663 () Bool)

(declare-fun res!635748 () Bool)

(assert (=> d!114663 (=> res!635748 e!533129)))

(assert (=> d!114663 (= res!635748 (bvsge #b00000000000000000000000000000000 (size!28056 (_keys!10634 thiss!1141))))))

(assert (=> d!114663 (= (arrayNoDuplicates!0 (_keys!10634 thiss!1141) #b00000000000000000000000000000000 Nil!19299) e!533129)))

(declare-fun b!947263 () Bool)

(assert (=> b!947263 (= e!533128 call!41109)))

(assert (= (and d!114663 (not res!635748)) b!947261))

(assert (= (and b!947261 res!635749) b!947259))

(assert (= (and b!947261 res!635747) b!947262))

(assert (= (and b!947262 c!98684) b!947263))

(assert (= (and b!947262 (not c!98684)) b!947260))

(assert (= (or b!947263 b!947260) bm!41106))

(assert (=> bm!41106 m!880275))

(declare-fun m!880295 () Bool)

(assert (=> bm!41106 m!880295))

(assert (=> b!947259 m!880275))

(assert (=> b!947259 m!880275))

(declare-fun m!880297 () Bool)

(assert (=> b!947259 m!880297))

(assert (=> b!947261 m!880275))

(assert (=> b!947261 m!880275))

(declare-fun m!880299 () Bool)

(assert (=> b!947261 m!880299))

(assert (=> b!947262 m!880275))

(assert (=> b!947262 m!880275))

(assert (=> b!947262 m!880299))

(assert (=> b!947176 d!114663))

(declare-fun b!947273 () Bool)

(declare-fun e!533136 () Bool)

(declare-fun call!41112 () Bool)

(assert (=> b!947273 (= e!533136 call!41112)))

(declare-fun bm!41109 () Bool)

(assert (=> bm!41109 (= call!41112 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10634 thiss!1141) (mask!27457 thiss!1141)))))

(declare-fun b!947274 () Bool)

(declare-fun e!533138 () Bool)

(assert (=> b!947274 (= e!533136 e!533138)))

(declare-fun lt!426539 () (_ BitVec 64))

(assert (=> b!947274 (= lt!426539 (select (arr!27583 (_keys!10634 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426538 () Unit!31916)

(assert (=> b!947274 (= lt!426538 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10634 thiss!1141) lt!426539 #b00000000000000000000000000000000))))

(assert (=> b!947274 (arrayContainsKey!0 (_keys!10634 thiss!1141) lt!426539 #b00000000000000000000000000000000)))

(declare-fun lt!426540 () Unit!31916)

(assert (=> b!947274 (= lt!426540 lt!426538)))

(declare-fun res!635755 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57342 (_ BitVec 32)) SeekEntryResult!9110)

(assert (=> b!947274 (= res!635755 (= (seekEntryOrOpen!0 (select (arr!27583 (_keys!10634 thiss!1141)) #b00000000000000000000000000000000) (_keys!10634 thiss!1141) (mask!27457 thiss!1141)) (Found!9110 #b00000000000000000000000000000000)))))

(assert (=> b!947274 (=> (not res!635755) (not e!533138))))

(declare-fun b!947275 () Bool)

(declare-fun e!533137 () Bool)

(assert (=> b!947275 (= e!533137 e!533136)))

(declare-fun c!98687 () Bool)

(assert (=> b!947275 (= c!98687 (validKeyInArray!0 (select (arr!27583 (_keys!10634 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947272 () Bool)

(assert (=> b!947272 (= e!533138 call!41112)))

(declare-fun d!114665 () Bool)

(declare-fun res!635754 () Bool)

(assert (=> d!114665 (=> res!635754 e!533137)))

(assert (=> d!114665 (= res!635754 (bvsge #b00000000000000000000000000000000 (size!28056 (_keys!10634 thiss!1141))))))

(assert (=> d!114665 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10634 thiss!1141) (mask!27457 thiss!1141)) e!533137)))

(assert (= (and d!114665 (not res!635754)) b!947275))

(assert (= (and b!947275 c!98687) b!947274))

(assert (= (and b!947275 (not c!98687)) b!947273))

(assert (= (and b!947274 res!635755) b!947272))

(assert (= (or b!947272 b!947273) bm!41109))

(declare-fun m!880301 () Bool)

(assert (=> bm!41109 m!880301))

(assert (=> b!947274 m!880275))

(declare-fun m!880303 () Bool)

(assert (=> b!947274 m!880303))

(declare-fun m!880305 () Bool)

(assert (=> b!947274 m!880305))

(assert (=> b!947274 m!880275))

(declare-fun m!880307 () Bool)

(assert (=> b!947274 m!880307))

(assert (=> b!947275 m!880275))

(assert (=> b!947275 m!880275))

(assert (=> b!947275 m!880299))

(assert (=> b!947184 d!114665))

(declare-fun condMapEmpty!32887 () Bool)

(declare-fun mapDefault!32887 () ValueCell!9855)

(assert (=> mapNonEmpty!32881 (= condMapEmpty!32887 (= mapRest!32881 ((as const (Array (_ BitVec 32) ValueCell!9855)) mapDefault!32887)))))

(declare-fun e!533143 () Bool)

(declare-fun mapRes!32887 () Bool)

(assert (=> mapNonEmpty!32881 (= tp!63051 (and e!533143 mapRes!32887))))

(declare-fun mapIsEmpty!32887 () Bool)

(assert (=> mapIsEmpty!32887 mapRes!32887))

(declare-fun b!947282 () Bool)

(declare-fun e!533144 () Bool)

(assert (=> b!947282 (= e!533144 tp_is_empty!20673)))

(declare-fun mapNonEmpty!32887 () Bool)

(declare-fun tp!63060 () Bool)

(assert (=> mapNonEmpty!32887 (= mapRes!32887 (and tp!63060 e!533144))))

(declare-fun mapKey!32887 () (_ BitVec 32))

(declare-fun mapRest!32887 () (Array (_ BitVec 32) ValueCell!9855))

(declare-fun mapValue!32887 () ValueCell!9855)

(assert (=> mapNonEmpty!32887 (= mapRest!32881 (store mapRest!32887 mapKey!32887 mapValue!32887))))

(declare-fun b!947283 () Bool)

(assert (=> b!947283 (= e!533143 tp_is_empty!20673)))

(assert (= (and mapNonEmpty!32881 condMapEmpty!32887) mapIsEmpty!32887))

(assert (= (and mapNonEmpty!32881 (not condMapEmpty!32887)) mapNonEmpty!32887))

(assert (= (and mapNonEmpty!32887 ((_ is ValueCellFull!9855) mapValue!32887)) b!947282))

(assert (= (and mapNonEmpty!32881 ((_ is ValueCellFull!9855) mapDefault!32887)) b!947283))

(declare-fun m!880309 () Bool)

(assert (=> mapNonEmpty!32887 m!880309))

(check-sat (not b!947259) (not d!114661) (not mapNonEmpty!32887) (not b!947221) (not b!947261) (not b!947234) (not b!947248) (not b_next!18165) (not bm!41109) (not b!947246) (not b!947274) (not b!947262) (not b!947247) tp_is_empty!20673 (not b!947275) b_and!29587 (not d!114653) (not bm!41106) (not d!114655))
(check-sat b_and!29587 (not b_next!18165))
