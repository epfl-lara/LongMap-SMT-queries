; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80610 () Bool)

(assert start!80610)

(declare-fun b!945936 () Bool)

(declare-fun b_free!18085 () Bool)

(declare-fun b_next!18085 () Bool)

(assert (=> b!945936 (= b_free!18085 (not b_next!18085))))

(declare-fun tp!62765 () Bool)

(declare-fun b_and!29513 () Bool)

(assert (=> b!945936 (= tp!62765 b_and!29513)))

(declare-fun b!945931 () Bool)

(declare-fun res!635155 () Bool)

(declare-fun e!532054 () Bool)

(assert (=> b!945931 (=> (not res!635155) (not e!532054))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!945931 (= res!635155 (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!32715 () Bool)

(declare-fun mapRes!32715 () Bool)

(assert (=> mapIsEmpty!32715 mapRes!32715))

(declare-fun res!635156 () Bool)

(assert (=> start!80610 (=> (not res!635156) (not e!532054))))

(declare-datatypes ((V!32423 0))(
  ( (V!32424 (val!10347 Int)) )
))
(declare-datatypes ((ValueCell!9815 0))(
  ( (ValueCellFull!9815 (v!12876 V!32423)) (EmptyCell!9815) )
))
(declare-datatypes ((array!57205 0))(
  ( (array!57206 (arr!27523 (Array (_ BitVec 32) ValueCell!9815)) (size!27990 (_ BitVec 32))) )
))
(declare-datatypes ((array!57207 0))(
  ( (array!57208 (arr!27524 (Array (_ BitVec 32) (_ BitVec 64))) (size!27991 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4780 0))(
  ( (LongMapFixedSize!4781 (defaultEntry!5685 Int) (mask!27390 (_ BitVec 32)) (extraKeys!5417 (_ BitVec 32)) (zeroValue!5521 V!32423) (minValue!5521 V!32423) (_size!2445 (_ BitVec 32)) (_keys!10591 array!57207) (_values!5708 array!57205) (_vacant!2445 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4780)

(declare-fun valid!1834 (LongMapFixedSize!4780) Bool)

(assert (=> start!80610 (= res!635156 (valid!1834 thiss!1141))))

(assert (=> start!80610 e!532054))

(declare-fun e!532050 () Bool)

(assert (=> start!80610 e!532050))

(assert (=> start!80610 true))

(declare-fun mapNonEmpty!32715 () Bool)

(declare-fun tp!62766 () Bool)

(declare-fun e!532049 () Bool)

(assert (=> mapNonEmpty!32715 (= mapRes!32715 (and tp!62766 e!532049))))

(declare-fun mapKey!32715 () (_ BitVec 32))

(declare-fun mapRest!32715 () (Array (_ BitVec 32) ValueCell!9815))

(declare-fun mapValue!32715 () ValueCell!9815)

(assert (=> mapNonEmpty!32715 (= (arr!27523 (_values!5708 thiss!1141)) (store mapRest!32715 mapKey!32715 mapValue!32715))))

(declare-fun b!945932 () Bool)

(declare-fun e!532053 () Bool)

(declare-fun e!532052 () Bool)

(assert (=> b!945932 (= e!532053 (and e!532052 mapRes!32715))))

(declare-fun condMapEmpty!32715 () Bool)

(declare-fun mapDefault!32715 () ValueCell!9815)

(assert (=> b!945932 (= condMapEmpty!32715 (= (arr!27523 (_values!5708 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9815)) mapDefault!32715)))))

(declare-fun b!945933 () Bool)

(declare-fun tp_is_empty!20593 () Bool)

(assert (=> b!945933 (= e!532052 tp_is_empty!20593)))

(declare-fun b!945934 () Bool)

(declare-datatypes ((tuple2!13484 0))(
  ( (tuple2!13485 (_1!6753 (_ BitVec 64)) (_2!6753 V!32423)) )
))
(declare-datatypes ((List!19271 0))(
  ( (Nil!19268) (Cons!19267 (h!20424 tuple2!13484) (t!27580 List!19271)) )
))
(declare-datatypes ((ListLongMap!12183 0))(
  ( (ListLongMap!12184 (toList!6107 List!19271)) )
))
(declare-fun contains!5190 (ListLongMap!12183 (_ BitVec 64)) Bool)

(declare-fun map!13015 (LongMapFixedSize!4780) ListLongMap!12183)

(assert (=> b!945934 (= e!532054 (not (= (not (= (bvand (extraKeys!5417 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (contains!5190 (map!13015 thiss!1141) key!756))))))

(declare-fun b!945935 () Bool)

(assert (=> b!945935 (= e!532049 tp_is_empty!20593)))

(declare-fun array_inv!21462 (array!57207) Bool)

(declare-fun array_inv!21463 (array!57205) Bool)

(assert (=> b!945936 (= e!532050 (and tp!62765 tp_is_empty!20593 (array_inv!21462 (_keys!10591 thiss!1141)) (array_inv!21463 (_values!5708 thiss!1141)) e!532053))))

(assert (= (and start!80610 res!635156) b!945931))

(assert (= (and b!945931 res!635155) b!945934))

(assert (= (and b!945932 condMapEmpty!32715) mapIsEmpty!32715))

(assert (= (and b!945932 (not condMapEmpty!32715)) mapNonEmpty!32715))

(get-info :version)

(assert (= (and mapNonEmpty!32715 ((_ is ValueCellFull!9815) mapValue!32715)) b!945935))

(assert (= (and b!945932 ((_ is ValueCellFull!9815) mapDefault!32715)) b!945933))

(assert (= b!945936 b!945932))

(assert (= start!80610 b!945936))

(declare-fun m!880273 () Bool)

(assert (=> start!80610 m!880273))

(declare-fun m!880275 () Bool)

(assert (=> mapNonEmpty!32715 m!880275))

(declare-fun m!880277 () Bool)

(assert (=> b!945934 m!880277))

(assert (=> b!945934 m!880277))

(declare-fun m!880279 () Bool)

(assert (=> b!945934 m!880279))

(declare-fun m!880281 () Bool)

(assert (=> b!945936 m!880281))

(declare-fun m!880283 () Bool)

(assert (=> b!945936 m!880283))

(check-sat (not b!945936) b_and!29513 (not b_next!18085) (not b!945934) (not mapNonEmpty!32715) (not start!80610) tp_is_empty!20593)
(check-sat b_and!29513 (not b_next!18085))
(get-model)

(declare-fun d!114667 () Bool)

(declare-fun e!532095 () Bool)

(assert (=> d!114667 e!532095))

(declare-fun res!635171 () Bool)

(assert (=> d!114667 (=> res!635171 e!532095)))

(declare-fun lt!426211 () Bool)

(assert (=> d!114667 (= res!635171 (not lt!426211))))

(declare-fun lt!426208 () Bool)

(assert (=> d!114667 (= lt!426211 lt!426208)))

(declare-datatypes ((Unit!31857 0))(
  ( (Unit!31858) )
))
(declare-fun lt!426209 () Unit!31857)

(declare-fun e!532096 () Unit!31857)

(assert (=> d!114667 (= lt!426209 e!532096)))

(declare-fun c!98627 () Bool)

(assert (=> d!114667 (= c!98627 lt!426208)))

(declare-fun containsKey!455 (List!19271 (_ BitVec 64)) Bool)

(assert (=> d!114667 (= lt!426208 (containsKey!455 (toList!6107 (map!13015 thiss!1141)) key!756))))

(assert (=> d!114667 (= (contains!5190 (map!13015 thiss!1141) key!756) lt!426211)))

(declare-fun b!945979 () Bool)

(declare-fun lt!426210 () Unit!31857)

(assert (=> b!945979 (= e!532096 lt!426210)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!349 (List!19271 (_ BitVec 64)) Unit!31857)

(assert (=> b!945979 (= lt!426210 (lemmaContainsKeyImpliesGetValueByKeyDefined!349 (toList!6107 (map!13015 thiss!1141)) key!756))))

(declare-datatypes ((Option!490 0))(
  ( (Some!489 (v!12879 V!32423)) (None!488) )
))
(declare-fun isDefined!357 (Option!490) Bool)

(declare-fun getValueByKey!484 (List!19271 (_ BitVec 64)) Option!490)

(assert (=> b!945979 (isDefined!357 (getValueByKey!484 (toList!6107 (map!13015 thiss!1141)) key!756))))

(declare-fun b!945980 () Bool)

(declare-fun Unit!31859 () Unit!31857)

(assert (=> b!945980 (= e!532096 Unit!31859)))

(declare-fun b!945981 () Bool)

(assert (=> b!945981 (= e!532095 (isDefined!357 (getValueByKey!484 (toList!6107 (map!13015 thiss!1141)) key!756)))))

(assert (= (and d!114667 c!98627) b!945979))

(assert (= (and d!114667 (not c!98627)) b!945980))

(assert (= (and d!114667 (not res!635171)) b!945981))

(declare-fun m!880309 () Bool)

(assert (=> d!114667 m!880309))

(declare-fun m!880311 () Bool)

(assert (=> b!945979 m!880311))

(declare-fun m!880313 () Bool)

(assert (=> b!945979 m!880313))

(assert (=> b!945979 m!880313))

(declare-fun m!880315 () Bool)

(assert (=> b!945979 m!880315))

(assert (=> b!945981 m!880313))

(assert (=> b!945981 m!880313))

(assert (=> b!945981 m!880315))

(assert (=> b!945934 d!114667))

(declare-fun d!114669 () Bool)

(declare-fun getCurrentListMap!3341 (array!57207 array!57205 (_ BitVec 32) (_ BitVec 32) V!32423 V!32423 (_ BitVec 32) Int) ListLongMap!12183)

(assert (=> d!114669 (= (map!13015 thiss!1141) (getCurrentListMap!3341 (_keys!10591 thiss!1141) (_values!5708 thiss!1141) (mask!27390 thiss!1141) (extraKeys!5417 thiss!1141) (zeroValue!5521 thiss!1141) (minValue!5521 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5685 thiss!1141)))))

(declare-fun bs!26583 () Bool)

(assert (= bs!26583 d!114669))

(declare-fun m!880317 () Bool)

(assert (=> bs!26583 m!880317))

(assert (=> b!945934 d!114669))

(declare-fun d!114671 () Bool)

(assert (=> d!114671 (= (array_inv!21462 (_keys!10591 thiss!1141)) (bvsge (size!27991 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945936 d!114671))

(declare-fun d!114673 () Bool)

(assert (=> d!114673 (= (array_inv!21463 (_values!5708 thiss!1141)) (bvsge (size!27990 (_values!5708 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945936 d!114673))

(declare-fun d!114675 () Bool)

(declare-fun res!635178 () Bool)

(declare-fun e!532099 () Bool)

(assert (=> d!114675 (=> (not res!635178) (not e!532099))))

(declare-fun simpleValid!349 (LongMapFixedSize!4780) Bool)

(assert (=> d!114675 (= res!635178 (simpleValid!349 thiss!1141))))

(assert (=> d!114675 (= (valid!1834 thiss!1141) e!532099)))

(declare-fun b!945988 () Bool)

(declare-fun res!635179 () Bool)

(assert (=> b!945988 (=> (not res!635179) (not e!532099))))

(declare-fun arrayCountValidKeys!0 (array!57207 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945988 (= res!635179 (= (arrayCountValidKeys!0 (_keys!10591 thiss!1141) #b00000000000000000000000000000000 (size!27991 (_keys!10591 thiss!1141))) (_size!2445 thiss!1141)))))

(declare-fun b!945989 () Bool)

(declare-fun res!635180 () Bool)

(assert (=> b!945989 (=> (not res!635180) (not e!532099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57207 (_ BitVec 32)) Bool)

(assert (=> b!945989 (= res!635180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10591 thiss!1141) (mask!27390 thiss!1141)))))

(declare-fun b!945990 () Bool)

(declare-datatypes ((List!19272 0))(
  ( (Nil!19269) (Cons!19268 (h!20425 (_ BitVec 64)) (t!27581 List!19272)) )
))
(declare-fun arrayNoDuplicates!0 (array!57207 (_ BitVec 32) List!19272) Bool)

(assert (=> b!945990 (= e!532099 (arrayNoDuplicates!0 (_keys!10591 thiss!1141) #b00000000000000000000000000000000 Nil!19269))))

(assert (= (and d!114675 res!635178) b!945988))

(assert (= (and b!945988 res!635179) b!945989))

(assert (= (and b!945989 res!635180) b!945990))

(declare-fun m!880319 () Bool)

(assert (=> d!114675 m!880319))

(declare-fun m!880321 () Bool)

(assert (=> b!945988 m!880321))

(declare-fun m!880323 () Bool)

(assert (=> b!945989 m!880323))

(declare-fun m!880325 () Bool)

(assert (=> b!945990 m!880325))

(assert (=> start!80610 d!114675))

(declare-fun condMapEmpty!32724 () Bool)

(declare-fun mapDefault!32724 () ValueCell!9815)

(assert (=> mapNonEmpty!32715 (= condMapEmpty!32724 (= mapRest!32715 ((as const (Array (_ BitVec 32) ValueCell!9815)) mapDefault!32724)))))

(declare-fun e!532105 () Bool)

(declare-fun mapRes!32724 () Bool)

(assert (=> mapNonEmpty!32715 (= tp!62766 (and e!532105 mapRes!32724))))

(declare-fun mapIsEmpty!32724 () Bool)

(assert (=> mapIsEmpty!32724 mapRes!32724))

(declare-fun b!945997 () Bool)

(declare-fun e!532104 () Bool)

(assert (=> b!945997 (= e!532104 tp_is_empty!20593)))

(declare-fun mapNonEmpty!32724 () Bool)

(declare-fun tp!62781 () Bool)

(assert (=> mapNonEmpty!32724 (= mapRes!32724 (and tp!62781 e!532104))))

(declare-fun mapKey!32724 () (_ BitVec 32))

(declare-fun mapRest!32724 () (Array (_ BitVec 32) ValueCell!9815))

(declare-fun mapValue!32724 () ValueCell!9815)

(assert (=> mapNonEmpty!32724 (= mapRest!32715 (store mapRest!32724 mapKey!32724 mapValue!32724))))

(declare-fun b!945998 () Bool)

(assert (=> b!945998 (= e!532105 tp_is_empty!20593)))

(assert (= (and mapNonEmpty!32715 condMapEmpty!32724) mapIsEmpty!32724))

(assert (= (and mapNonEmpty!32715 (not condMapEmpty!32724)) mapNonEmpty!32724))

(assert (= (and mapNonEmpty!32724 ((_ is ValueCellFull!9815) mapValue!32724)) b!945997))

(assert (= (and mapNonEmpty!32715 ((_ is ValueCellFull!9815) mapDefault!32724)) b!945998))

(declare-fun m!880327 () Bool)

(assert (=> mapNonEmpty!32724 m!880327))

(check-sat (not b_next!18085) (not b!945990) (not b!945989) tp_is_empty!20593 (not b!945988) (not b!945979) b_and!29513 (not d!114675) (not b!945981) (not mapNonEmpty!32724) (not d!114667) (not d!114669))
(check-sat b_and!29513 (not b_next!18085))
(get-model)

(declare-fun b!946007 () Bool)

(declare-fun e!532111 () (_ BitVec 32))

(assert (=> b!946007 (= e!532111 #b00000000000000000000000000000000)))

(declare-fun b!946008 () Bool)

(declare-fun e!532110 () (_ BitVec 32))

(declare-fun call!41046 () (_ BitVec 32))

(assert (=> b!946008 (= e!532110 call!41046)))

(declare-fun d!114677 () Bool)

(declare-fun lt!426214 () (_ BitVec 32))

(assert (=> d!114677 (and (bvsge lt!426214 #b00000000000000000000000000000000) (bvsle lt!426214 (bvsub (size!27991 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114677 (= lt!426214 e!532111)))

(declare-fun c!98633 () Bool)

(assert (=> d!114677 (= c!98633 (bvsge #b00000000000000000000000000000000 (size!27991 (_keys!10591 thiss!1141))))))

(assert (=> d!114677 (and (bvsle #b00000000000000000000000000000000 (size!27991 (_keys!10591 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27991 (_keys!10591 thiss!1141)) (size!27991 (_keys!10591 thiss!1141))))))

(assert (=> d!114677 (= (arrayCountValidKeys!0 (_keys!10591 thiss!1141) #b00000000000000000000000000000000 (size!27991 (_keys!10591 thiss!1141))) lt!426214)))

(declare-fun bm!41043 () Bool)

(assert (=> bm!41043 (= call!41046 (arrayCountValidKeys!0 (_keys!10591 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27991 (_keys!10591 thiss!1141))))))

(declare-fun b!946009 () Bool)

(assert (=> b!946009 (= e!532111 e!532110)))

(declare-fun c!98632 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!946009 (= c!98632 (validKeyInArray!0 (select (arr!27524 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946010 () Bool)

(assert (=> b!946010 (= e!532110 (bvadd #b00000000000000000000000000000001 call!41046))))

(assert (= (and d!114677 c!98633) b!946007))

(assert (= (and d!114677 (not c!98633)) b!946009))

(assert (= (and b!946009 c!98632) b!946010))

(assert (= (and b!946009 (not c!98632)) b!946008))

(assert (= (or b!946010 b!946008) bm!41043))

(declare-fun m!880329 () Bool)

(assert (=> bm!41043 m!880329))

(declare-fun m!880331 () Bool)

(assert (=> b!946009 m!880331))

(assert (=> b!946009 m!880331))

(declare-fun m!880333 () Bool)

(assert (=> b!946009 m!880333))

(assert (=> b!945988 d!114677))

(declare-fun d!114679 () Bool)

(declare-fun res!635185 () Bool)

(declare-fun e!532116 () Bool)

(assert (=> d!114679 (=> res!635185 e!532116)))

(assert (=> d!114679 (= res!635185 (and ((_ is Cons!19267) (toList!6107 (map!13015 thiss!1141))) (= (_1!6753 (h!20424 (toList!6107 (map!13015 thiss!1141)))) key!756)))))

(assert (=> d!114679 (= (containsKey!455 (toList!6107 (map!13015 thiss!1141)) key!756) e!532116)))

(declare-fun b!946015 () Bool)

(declare-fun e!532117 () Bool)

(assert (=> b!946015 (= e!532116 e!532117)))

(declare-fun res!635186 () Bool)

(assert (=> b!946015 (=> (not res!635186) (not e!532117))))

(assert (=> b!946015 (= res!635186 (and (or (not ((_ is Cons!19267) (toList!6107 (map!13015 thiss!1141)))) (bvsle (_1!6753 (h!20424 (toList!6107 (map!13015 thiss!1141)))) key!756)) ((_ is Cons!19267) (toList!6107 (map!13015 thiss!1141))) (bvslt (_1!6753 (h!20424 (toList!6107 (map!13015 thiss!1141)))) key!756)))))

(declare-fun b!946016 () Bool)

(assert (=> b!946016 (= e!532117 (containsKey!455 (t!27580 (toList!6107 (map!13015 thiss!1141))) key!756))))

(assert (= (and d!114679 (not res!635185)) b!946015))

(assert (= (and b!946015 res!635186) b!946016))

(declare-fun m!880335 () Bool)

(assert (=> b!946016 m!880335))

(assert (=> d!114667 d!114679))

(declare-fun b!946026 () Bool)

(declare-fun res!635196 () Bool)

(declare-fun e!532120 () Bool)

(assert (=> b!946026 (=> (not res!635196) (not e!532120))))

(declare-fun size!27996 (LongMapFixedSize!4780) (_ BitVec 32))

(assert (=> b!946026 (= res!635196 (bvsge (size!27996 thiss!1141) (_size!2445 thiss!1141)))))

(declare-fun b!946025 () Bool)

(declare-fun res!635198 () Bool)

(assert (=> b!946025 (=> (not res!635198) (not e!532120))))

(assert (=> b!946025 (= res!635198 (and (= (size!27990 (_values!5708 thiss!1141)) (bvadd (mask!27390 thiss!1141) #b00000000000000000000000000000001)) (= (size!27991 (_keys!10591 thiss!1141)) (size!27990 (_values!5708 thiss!1141))) (bvsge (_size!2445 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2445 thiss!1141) (bvadd (mask!27390 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!946028 () Bool)

(assert (=> b!946028 (= e!532120 (and (bvsge (extraKeys!5417 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5417 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2445 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun d!114681 () Bool)

(declare-fun res!635195 () Bool)

(assert (=> d!114681 (=> (not res!635195) (not e!532120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!114681 (= res!635195 (validMask!0 (mask!27390 thiss!1141)))))

(assert (=> d!114681 (= (simpleValid!349 thiss!1141) e!532120)))

(declare-fun b!946027 () Bool)

(declare-fun res!635197 () Bool)

(assert (=> b!946027 (=> (not res!635197) (not e!532120))))

(assert (=> b!946027 (= res!635197 (= (size!27996 thiss!1141) (bvadd (_size!2445 thiss!1141) (bvsdiv (bvadd (extraKeys!5417 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!114681 res!635195) b!946025))

(assert (= (and b!946025 res!635198) b!946026))

(assert (= (and b!946026 res!635196) b!946027))

(assert (= (and b!946027 res!635197) b!946028))

(declare-fun m!880337 () Bool)

(assert (=> b!946026 m!880337))

(declare-fun m!880339 () Bool)

(assert (=> d!114681 m!880339))

(assert (=> b!946027 m!880337))

(assert (=> d!114675 d!114681))

(declare-fun b!946071 () Bool)

(declare-fun e!532156 () Bool)

(declare-fun e!532157 () Bool)

(assert (=> b!946071 (= e!532156 e!532157)))

(declare-fun res!635221 () Bool)

(assert (=> b!946071 (=> (not res!635221) (not e!532157))))

(declare-fun lt!426263 () ListLongMap!12183)

(assert (=> b!946071 (= res!635221 (contains!5190 lt!426263 (select (arr!27524 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!946071 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27991 (_keys!10591 thiss!1141))))))

(declare-fun bm!41058 () Bool)

(declare-fun call!41064 () ListLongMap!12183)

(declare-fun call!41067 () ListLongMap!12183)

(assert (=> bm!41058 (= call!41064 call!41067)))

(declare-fun b!946072 () Bool)

(declare-fun e!532147 () Bool)

(declare-fun call!41061 () Bool)

(assert (=> b!946072 (= e!532147 (not call!41061))))

(declare-fun b!946073 () Bool)

(declare-fun e!532159 () Bool)

(declare-fun e!532150 () Bool)

(assert (=> b!946073 (= e!532159 e!532150)))

(declare-fun res!635224 () Bool)

(declare-fun call!41062 () Bool)

(assert (=> b!946073 (= res!635224 call!41062)))

(assert (=> b!946073 (=> (not res!635224) (not e!532150))))

(declare-fun b!946074 () Bool)

(declare-fun e!532154 () ListLongMap!12183)

(declare-fun call!41065 () ListLongMap!12183)

(assert (=> b!946074 (= e!532154 call!41065)))

(declare-fun b!946076 () Bool)

(declare-fun e!532148 () Bool)

(assert (=> b!946076 (= e!532147 e!532148)))

(declare-fun res!635220 () Bool)

(assert (=> b!946076 (= res!635220 call!41061)))

(assert (=> b!946076 (=> (not res!635220) (not e!532148))))

(declare-fun b!946077 () Bool)

(assert (=> b!946077 (= e!532159 (not call!41062))))

(declare-fun b!946078 () Bool)

(declare-fun e!532153 () Bool)

(assert (=> b!946078 (= e!532153 (validKeyInArray!0 (select (arr!27524 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946079 () Bool)

(declare-fun e!532155 () Bool)

(assert (=> b!946079 (= e!532155 (validKeyInArray!0 (select (arr!27524 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946080 () Bool)

(declare-fun res!635218 () Bool)

(declare-fun e!532149 () Bool)

(assert (=> b!946080 (=> (not res!635218) (not e!532149))))

(assert (=> b!946080 (= res!635218 e!532156)))

(declare-fun res!635225 () Bool)

(assert (=> b!946080 (=> res!635225 e!532156)))

(assert (=> b!946080 (= res!635225 (not e!532155))))

(declare-fun res!635223 () Bool)

(assert (=> b!946080 (=> (not res!635223) (not e!532155))))

(assert (=> b!946080 (= res!635223 (bvslt #b00000000000000000000000000000000 (size!27991 (_keys!10591 thiss!1141))))))

(declare-fun b!946081 () Bool)

(declare-fun apply!876 (ListLongMap!12183 (_ BitVec 64)) V!32423)

(assert (=> b!946081 (= e!532148 (= (apply!876 lt!426263 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5521 thiss!1141)))))

(declare-fun b!946082 () Bool)

(declare-fun get!14483 (ValueCell!9815 V!32423) V!32423)

(declare-fun dynLambda!1659 (Int (_ BitVec 64)) V!32423)

(assert (=> b!946082 (= e!532157 (= (apply!876 lt!426263 (select (arr!27524 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000)) (get!14483 (select (arr!27523 (_values!5708 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1659 (defaultEntry!5685 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!946082 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27990 (_values!5708 thiss!1141))))))

(assert (=> b!946082 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27991 (_keys!10591 thiss!1141))))))

(declare-fun b!946083 () Bool)

(declare-fun e!532152 () Unit!31857)

(declare-fun lt!426266 () Unit!31857)

(assert (=> b!946083 (= e!532152 lt!426266)))

(declare-fun lt!426278 () ListLongMap!12183)

(declare-fun getCurrentListMapNoExtraKeys!3350 (array!57207 array!57205 (_ BitVec 32) (_ BitVec 32) V!32423 V!32423 (_ BitVec 32) Int) ListLongMap!12183)

(assert (=> b!946083 (= lt!426278 (getCurrentListMapNoExtraKeys!3350 (_keys!10591 thiss!1141) (_values!5708 thiss!1141) (mask!27390 thiss!1141) (extraKeys!5417 thiss!1141) (zeroValue!5521 thiss!1141) (minValue!5521 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5685 thiss!1141)))))

(declare-fun lt!426267 () (_ BitVec 64))

(assert (=> b!946083 (= lt!426267 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426273 () (_ BitVec 64))

(assert (=> b!946083 (= lt!426273 (select (arr!27524 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426262 () Unit!31857)

(declare-fun addStillContains!565 (ListLongMap!12183 (_ BitVec 64) V!32423 (_ BitVec 64)) Unit!31857)

(assert (=> b!946083 (= lt!426262 (addStillContains!565 lt!426278 lt!426267 (zeroValue!5521 thiss!1141) lt!426273))))

(declare-fun +!2862 (ListLongMap!12183 tuple2!13484) ListLongMap!12183)

(assert (=> b!946083 (contains!5190 (+!2862 lt!426278 (tuple2!13485 lt!426267 (zeroValue!5521 thiss!1141))) lt!426273)))

(declare-fun lt!426264 () Unit!31857)

(assert (=> b!946083 (= lt!426264 lt!426262)))

(declare-fun lt!426260 () ListLongMap!12183)

(assert (=> b!946083 (= lt!426260 (getCurrentListMapNoExtraKeys!3350 (_keys!10591 thiss!1141) (_values!5708 thiss!1141) (mask!27390 thiss!1141) (extraKeys!5417 thiss!1141) (zeroValue!5521 thiss!1141) (minValue!5521 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5685 thiss!1141)))))

(declare-fun lt!426279 () (_ BitVec 64))

(assert (=> b!946083 (= lt!426279 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426271 () (_ BitVec 64))

(assert (=> b!946083 (= lt!426271 (select (arr!27524 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426265 () Unit!31857)

(declare-fun addApplyDifferent!446 (ListLongMap!12183 (_ BitVec 64) V!32423 (_ BitVec 64)) Unit!31857)

(assert (=> b!946083 (= lt!426265 (addApplyDifferent!446 lt!426260 lt!426279 (minValue!5521 thiss!1141) lt!426271))))

(assert (=> b!946083 (= (apply!876 (+!2862 lt!426260 (tuple2!13485 lt!426279 (minValue!5521 thiss!1141))) lt!426271) (apply!876 lt!426260 lt!426271))))

(declare-fun lt!426269 () Unit!31857)

(assert (=> b!946083 (= lt!426269 lt!426265)))

(declare-fun lt!426280 () ListLongMap!12183)

(assert (=> b!946083 (= lt!426280 (getCurrentListMapNoExtraKeys!3350 (_keys!10591 thiss!1141) (_values!5708 thiss!1141) (mask!27390 thiss!1141) (extraKeys!5417 thiss!1141) (zeroValue!5521 thiss!1141) (minValue!5521 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5685 thiss!1141)))))

(declare-fun lt!426270 () (_ BitVec 64))

(assert (=> b!946083 (= lt!426270 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426268 () (_ BitVec 64))

(assert (=> b!946083 (= lt!426268 (select (arr!27524 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426277 () Unit!31857)

(assert (=> b!946083 (= lt!426277 (addApplyDifferent!446 lt!426280 lt!426270 (zeroValue!5521 thiss!1141) lt!426268))))

(assert (=> b!946083 (= (apply!876 (+!2862 lt!426280 (tuple2!13485 lt!426270 (zeroValue!5521 thiss!1141))) lt!426268) (apply!876 lt!426280 lt!426268))))

(declare-fun lt!426261 () Unit!31857)

(assert (=> b!946083 (= lt!426261 lt!426277)))

(declare-fun lt!426275 () ListLongMap!12183)

(assert (=> b!946083 (= lt!426275 (getCurrentListMapNoExtraKeys!3350 (_keys!10591 thiss!1141) (_values!5708 thiss!1141) (mask!27390 thiss!1141) (extraKeys!5417 thiss!1141) (zeroValue!5521 thiss!1141) (minValue!5521 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5685 thiss!1141)))))

(declare-fun lt!426274 () (_ BitVec 64))

(assert (=> b!946083 (= lt!426274 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426272 () (_ BitVec 64))

(assert (=> b!946083 (= lt!426272 (select (arr!27524 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946083 (= lt!426266 (addApplyDifferent!446 lt!426275 lt!426274 (minValue!5521 thiss!1141) lt!426272))))

(assert (=> b!946083 (= (apply!876 (+!2862 lt!426275 (tuple2!13485 lt!426274 (minValue!5521 thiss!1141))) lt!426272) (apply!876 lt!426275 lt!426272))))

(declare-fun b!946084 () Bool)

(declare-fun call!41063 () ListLongMap!12183)

(assert (=> b!946084 (= e!532154 call!41063)))

(declare-fun b!946085 () Bool)

(assert (=> b!946085 (= e!532149 e!532147)))

(declare-fun c!98647 () Bool)

(assert (=> b!946085 (= c!98647 (not (= (bvand (extraKeys!5417 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41059 () Bool)

(assert (=> bm!41059 (= call!41061 (contains!5190 lt!426263 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!946086 () Bool)

(declare-fun res!635219 () Bool)

(assert (=> b!946086 (=> (not res!635219) (not e!532149))))

(assert (=> b!946086 (= res!635219 e!532159)))

(declare-fun c!98651 () Bool)

(assert (=> b!946086 (= c!98651 (not (= (bvand (extraKeys!5417 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41060 () Bool)

(assert (=> bm!41060 (= call!41065 call!41064)))

(declare-fun b!946075 () Bool)

(declare-fun Unit!31860 () Unit!31857)

(assert (=> b!946075 (= e!532152 Unit!31860)))

(declare-fun d!114683 () Bool)

(assert (=> d!114683 e!532149))

(declare-fun res!635222 () Bool)

(assert (=> d!114683 (=> (not res!635222) (not e!532149))))

(assert (=> d!114683 (= res!635222 (or (bvsge #b00000000000000000000000000000000 (size!27991 (_keys!10591 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27991 (_keys!10591 thiss!1141))))))))

(declare-fun lt!426276 () ListLongMap!12183)

(assert (=> d!114683 (= lt!426263 lt!426276)))

(declare-fun lt!426259 () Unit!31857)

(assert (=> d!114683 (= lt!426259 e!532152)))

(declare-fun c!98646 () Bool)

(assert (=> d!114683 (= c!98646 e!532153)))

(declare-fun res!635217 () Bool)

(assert (=> d!114683 (=> (not res!635217) (not e!532153))))

(assert (=> d!114683 (= res!635217 (bvslt #b00000000000000000000000000000000 (size!27991 (_keys!10591 thiss!1141))))))

(declare-fun e!532158 () ListLongMap!12183)

(assert (=> d!114683 (= lt!426276 e!532158)))

(declare-fun c!98650 () Bool)

(assert (=> d!114683 (= c!98650 (and (not (= (bvand (extraKeys!5417 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5417 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!114683 (validMask!0 (mask!27390 thiss!1141))))

(assert (=> d!114683 (= (getCurrentListMap!3341 (_keys!10591 thiss!1141) (_values!5708 thiss!1141) (mask!27390 thiss!1141) (extraKeys!5417 thiss!1141) (zeroValue!5521 thiss!1141) (minValue!5521 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5685 thiss!1141)) lt!426263)))

(declare-fun b!946087 () Bool)

(declare-fun e!532151 () ListLongMap!12183)

(assert (=> b!946087 (= e!532151 call!41063)))

(declare-fun bm!41061 () Bool)

(declare-fun c!98648 () Bool)

(declare-fun call!41066 () ListLongMap!12183)

(assert (=> bm!41061 (= call!41066 (+!2862 (ite c!98650 call!41067 (ite c!98648 call!41064 call!41065)) (ite (or c!98650 c!98648) (tuple2!13485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5521 thiss!1141)) (tuple2!13485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5521 thiss!1141)))))))

(declare-fun b!946088 () Bool)

(assert (=> b!946088 (= e!532158 e!532151)))

(assert (=> b!946088 (= c!98648 (and (not (= (bvand (extraKeys!5417 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5417 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41062 () Bool)

(assert (=> bm!41062 (= call!41062 (contains!5190 lt!426263 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41063 () Bool)

(assert (=> bm!41063 (= call!41063 call!41066)))

(declare-fun b!946089 () Bool)

(assert (=> b!946089 (= e!532150 (= (apply!876 lt!426263 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5521 thiss!1141)))))

(declare-fun b!946090 () Bool)

(assert (=> b!946090 (= e!532158 (+!2862 call!41066 (tuple2!13485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5521 thiss!1141))))))

(declare-fun b!946091 () Bool)

(declare-fun c!98649 () Bool)

(assert (=> b!946091 (= c!98649 (and (not (= (bvand (extraKeys!5417 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5417 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!946091 (= e!532151 e!532154)))

(declare-fun bm!41064 () Bool)

(assert (=> bm!41064 (= call!41067 (getCurrentListMapNoExtraKeys!3350 (_keys!10591 thiss!1141) (_values!5708 thiss!1141) (mask!27390 thiss!1141) (extraKeys!5417 thiss!1141) (zeroValue!5521 thiss!1141) (minValue!5521 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5685 thiss!1141)))))

(assert (= (and d!114683 c!98650) b!946090))

(assert (= (and d!114683 (not c!98650)) b!946088))

(assert (= (and b!946088 c!98648) b!946087))

(assert (= (and b!946088 (not c!98648)) b!946091))

(assert (= (and b!946091 c!98649) b!946084))

(assert (= (and b!946091 (not c!98649)) b!946074))

(assert (= (or b!946084 b!946074) bm!41060))

(assert (= (or b!946087 bm!41060) bm!41058))

(assert (= (or b!946087 b!946084) bm!41063))

(assert (= (or b!946090 bm!41058) bm!41064))

(assert (= (or b!946090 bm!41063) bm!41061))

(assert (= (and d!114683 res!635217) b!946078))

(assert (= (and d!114683 c!98646) b!946083))

(assert (= (and d!114683 (not c!98646)) b!946075))

(assert (= (and d!114683 res!635222) b!946080))

(assert (= (and b!946080 res!635223) b!946079))

(assert (= (and b!946080 (not res!635225)) b!946071))

(assert (= (and b!946071 res!635221) b!946082))

(assert (= (and b!946080 res!635218) b!946086))

(assert (= (and b!946086 c!98651) b!946073))

(assert (= (and b!946086 (not c!98651)) b!946077))

(assert (= (and b!946073 res!635224) b!946089))

(assert (= (or b!946073 b!946077) bm!41062))

(assert (= (and b!946086 res!635219) b!946085))

(assert (= (and b!946085 c!98647) b!946076))

(assert (= (and b!946085 (not c!98647)) b!946072))

(assert (= (and b!946076 res!635220) b!946081))

(assert (= (or b!946076 b!946072) bm!41059))

(declare-fun b_lambda!14305 () Bool)

(assert (=> (not b_lambda!14305) (not b!946082)))

(declare-fun t!27583 () Bool)

(declare-fun tb!6161 () Bool)

(assert (=> (and b!945936 (= (defaultEntry!5685 thiss!1141) (defaultEntry!5685 thiss!1141)) t!27583) tb!6161))

(declare-fun result!12195 () Bool)

(assert (=> tb!6161 (= result!12195 tp_is_empty!20593)))

(assert (=> b!946082 t!27583))

(declare-fun b_and!29519 () Bool)

(assert (= b_and!29513 (and (=> t!27583 result!12195) b_and!29519)))

(assert (=> b!946078 m!880331))

(assert (=> b!946078 m!880331))

(assert (=> b!946078 m!880333))

(declare-fun m!880341 () Bool)

(assert (=> b!946089 m!880341))

(declare-fun m!880343 () Bool)

(assert (=> b!946083 m!880343))

(declare-fun m!880345 () Bool)

(assert (=> b!946083 m!880345))

(declare-fun m!880347 () Bool)

(assert (=> b!946083 m!880347))

(declare-fun m!880349 () Bool)

(assert (=> b!946083 m!880349))

(declare-fun m!880351 () Bool)

(assert (=> b!946083 m!880351))

(declare-fun m!880353 () Bool)

(assert (=> b!946083 m!880353))

(assert (=> b!946083 m!880331))

(declare-fun m!880355 () Bool)

(assert (=> b!946083 m!880355))

(declare-fun m!880357 () Bool)

(assert (=> b!946083 m!880357))

(declare-fun m!880359 () Bool)

(assert (=> b!946083 m!880359))

(assert (=> b!946083 m!880359))

(declare-fun m!880361 () Bool)

(assert (=> b!946083 m!880361))

(declare-fun m!880363 () Bool)

(assert (=> b!946083 m!880363))

(assert (=> b!946083 m!880345))

(declare-fun m!880365 () Bool)

(assert (=> b!946083 m!880365))

(declare-fun m!880367 () Bool)

(assert (=> b!946083 m!880367))

(assert (=> b!946083 m!880355))

(declare-fun m!880369 () Bool)

(assert (=> b!946083 m!880369))

(assert (=> b!946083 m!880349))

(declare-fun m!880371 () Bool)

(assert (=> b!946083 m!880371))

(declare-fun m!880373 () Bool)

(assert (=> b!946083 m!880373))

(assert (=> b!946071 m!880331))

(assert (=> b!946071 m!880331))

(declare-fun m!880375 () Bool)

(assert (=> b!946071 m!880375))

(assert (=> b!946079 m!880331))

(assert (=> b!946079 m!880331))

(assert (=> b!946079 m!880333))

(declare-fun m!880377 () Bool)

(assert (=> b!946081 m!880377))

(assert (=> bm!41064 m!880353))

(declare-fun m!880379 () Bool)

(assert (=> b!946082 m!880379))

(declare-fun m!880381 () Bool)

(assert (=> b!946082 m!880381))

(declare-fun m!880383 () Bool)

(assert (=> b!946082 m!880383))

(assert (=> b!946082 m!880379))

(assert (=> b!946082 m!880381))

(assert (=> b!946082 m!880331))

(assert (=> b!946082 m!880331))

(declare-fun m!880385 () Bool)

(assert (=> b!946082 m!880385))

(declare-fun m!880387 () Bool)

(assert (=> bm!41061 m!880387))

(declare-fun m!880389 () Bool)

(assert (=> b!946090 m!880389))

(declare-fun m!880391 () Bool)

(assert (=> bm!41062 m!880391))

(declare-fun m!880393 () Bool)

(assert (=> bm!41059 m!880393))

(assert (=> d!114683 m!880339))

(assert (=> d!114669 d!114683))

(declare-fun d!114685 () Bool)

(declare-fun isEmpty!708 (Option!490) Bool)

(assert (=> d!114685 (= (isDefined!357 (getValueByKey!484 (toList!6107 (map!13015 thiss!1141)) key!756)) (not (isEmpty!708 (getValueByKey!484 (toList!6107 (map!13015 thiss!1141)) key!756))))))

(declare-fun bs!26584 () Bool)

(assert (= bs!26584 d!114685))

(assert (=> bs!26584 m!880313))

(declare-fun m!880395 () Bool)

(assert (=> bs!26584 m!880395))

(assert (=> b!945981 d!114685))

(declare-fun b!946104 () Bool)

(declare-fun e!532165 () Option!490)

(assert (=> b!946104 (= e!532165 (getValueByKey!484 (t!27580 (toList!6107 (map!13015 thiss!1141))) key!756))))

(declare-fun b!946105 () Bool)

(assert (=> b!946105 (= e!532165 None!488)))

(declare-fun b!946102 () Bool)

(declare-fun e!532164 () Option!490)

(assert (=> b!946102 (= e!532164 (Some!489 (_2!6753 (h!20424 (toList!6107 (map!13015 thiss!1141))))))))

(declare-fun b!946103 () Bool)

(assert (=> b!946103 (= e!532164 e!532165)))

(declare-fun c!98657 () Bool)

(assert (=> b!946103 (= c!98657 (and ((_ is Cons!19267) (toList!6107 (map!13015 thiss!1141))) (not (= (_1!6753 (h!20424 (toList!6107 (map!13015 thiss!1141)))) key!756))))))

(declare-fun d!114687 () Bool)

(declare-fun c!98656 () Bool)

(assert (=> d!114687 (= c!98656 (and ((_ is Cons!19267) (toList!6107 (map!13015 thiss!1141))) (= (_1!6753 (h!20424 (toList!6107 (map!13015 thiss!1141)))) key!756)))))

(assert (=> d!114687 (= (getValueByKey!484 (toList!6107 (map!13015 thiss!1141)) key!756) e!532164)))

(assert (= (and d!114687 c!98656) b!946102))

(assert (= (and d!114687 (not c!98656)) b!946103))

(assert (= (and b!946103 c!98657) b!946104))

(assert (= (and b!946103 (not c!98657)) b!946105))

(declare-fun m!880397 () Bool)

(assert (=> b!946104 m!880397))

(assert (=> b!945981 d!114687))

(declare-fun d!114689 () Bool)

(assert (=> d!114689 (isDefined!357 (getValueByKey!484 (toList!6107 (map!13015 thiss!1141)) key!756))))

(declare-fun lt!426283 () Unit!31857)

(declare-fun choose!1575 (List!19271 (_ BitVec 64)) Unit!31857)

(assert (=> d!114689 (= lt!426283 (choose!1575 (toList!6107 (map!13015 thiss!1141)) key!756))))

(declare-fun e!532168 () Bool)

(assert (=> d!114689 e!532168))

(declare-fun res!635228 () Bool)

(assert (=> d!114689 (=> (not res!635228) (not e!532168))))

(declare-fun isStrictlySorted!494 (List!19271) Bool)

(assert (=> d!114689 (= res!635228 (isStrictlySorted!494 (toList!6107 (map!13015 thiss!1141))))))

(assert (=> d!114689 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!349 (toList!6107 (map!13015 thiss!1141)) key!756) lt!426283)))

(declare-fun b!946108 () Bool)

(assert (=> b!946108 (= e!532168 (containsKey!455 (toList!6107 (map!13015 thiss!1141)) key!756))))

(assert (= (and d!114689 res!635228) b!946108))

(assert (=> d!114689 m!880313))

(assert (=> d!114689 m!880313))

(assert (=> d!114689 m!880315))

(declare-fun m!880399 () Bool)

(assert (=> d!114689 m!880399))

(declare-fun m!880401 () Bool)

(assert (=> d!114689 m!880401))

(assert (=> b!946108 m!880309))

(assert (=> b!945979 d!114689))

(assert (=> b!945979 d!114685))

(assert (=> b!945979 d!114687))

(declare-fun b!946118 () Bool)

(declare-fun e!532177 () Bool)

(declare-fun call!41070 () Bool)

(assert (=> b!946118 (= e!532177 call!41070)))

(declare-fun b!946119 () Bool)

(declare-fun e!532175 () Bool)

(assert (=> b!946119 (= e!532175 call!41070)))

(declare-fun b!946120 () Bool)

(assert (=> b!946120 (= e!532175 e!532177)))

(declare-fun lt!426292 () (_ BitVec 64))

(assert (=> b!946120 (= lt!426292 (select (arr!27524 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426291 () Unit!31857)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57207 (_ BitVec 64) (_ BitVec 32)) Unit!31857)

(assert (=> b!946120 (= lt!426291 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10591 thiss!1141) lt!426292 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!946120 (arrayContainsKey!0 (_keys!10591 thiss!1141) lt!426292 #b00000000000000000000000000000000)))

(declare-fun lt!426290 () Unit!31857)

(assert (=> b!946120 (= lt!426290 lt!426291)))

(declare-fun res!635234 () Bool)

(declare-datatypes ((SeekEntryResult!9042 0))(
  ( (MissingZero!9042 (index!38539 (_ BitVec 32))) (Found!9042 (index!38540 (_ BitVec 32))) (Intermediate!9042 (undefined!9854 Bool) (index!38541 (_ BitVec 32)) (x!81171 (_ BitVec 32))) (Undefined!9042) (MissingVacant!9042 (index!38542 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57207 (_ BitVec 32)) SeekEntryResult!9042)

(assert (=> b!946120 (= res!635234 (= (seekEntryOrOpen!0 (select (arr!27524 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000) (_keys!10591 thiss!1141) (mask!27390 thiss!1141)) (Found!9042 #b00000000000000000000000000000000)))))

(assert (=> b!946120 (=> (not res!635234) (not e!532177))))

(declare-fun bm!41067 () Bool)

(assert (=> bm!41067 (= call!41070 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10591 thiss!1141) (mask!27390 thiss!1141)))))

(declare-fun d!114691 () Bool)

(declare-fun res!635233 () Bool)

(declare-fun e!532176 () Bool)

(assert (=> d!114691 (=> res!635233 e!532176)))

(assert (=> d!114691 (= res!635233 (bvsge #b00000000000000000000000000000000 (size!27991 (_keys!10591 thiss!1141))))))

(assert (=> d!114691 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10591 thiss!1141) (mask!27390 thiss!1141)) e!532176)))

(declare-fun b!946117 () Bool)

(assert (=> b!946117 (= e!532176 e!532175)))

(declare-fun c!98660 () Bool)

(assert (=> b!946117 (= c!98660 (validKeyInArray!0 (select (arr!27524 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114691 (not res!635233)) b!946117))

(assert (= (and b!946117 c!98660) b!946120))

(assert (= (and b!946117 (not c!98660)) b!946119))

(assert (= (and b!946120 res!635234) b!946118))

(assert (= (or b!946118 b!946119) bm!41067))

(assert (=> b!946120 m!880331))

(declare-fun m!880403 () Bool)

(assert (=> b!946120 m!880403))

(declare-fun m!880405 () Bool)

(assert (=> b!946120 m!880405))

(assert (=> b!946120 m!880331))

(declare-fun m!880407 () Bool)

(assert (=> b!946120 m!880407))

(declare-fun m!880409 () Bool)

(assert (=> bm!41067 m!880409))

(assert (=> b!946117 m!880331))

(assert (=> b!946117 m!880331))

(assert (=> b!946117 m!880333))

(assert (=> b!945989 d!114691))

(declare-fun b!946131 () Bool)

(declare-fun e!532188 () Bool)

(declare-fun call!41073 () Bool)

(assert (=> b!946131 (= e!532188 call!41073)))

(declare-fun d!114693 () Bool)

(declare-fun res!635242 () Bool)

(declare-fun e!532189 () Bool)

(assert (=> d!114693 (=> res!635242 e!532189)))

(assert (=> d!114693 (= res!635242 (bvsge #b00000000000000000000000000000000 (size!27991 (_keys!10591 thiss!1141))))))

(assert (=> d!114693 (= (arrayNoDuplicates!0 (_keys!10591 thiss!1141) #b00000000000000000000000000000000 Nil!19269) e!532189)))

(declare-fun b!946132 () Bool)

(declare-fun e!532187 () Bool)

(declare-fun contains!5191 (List!19272 (_ BitVec 64)) Bool)

(assert (=> b!946132 (= e!532187 (contains!5191 Nil!19269 (select (arr!27524 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946133 () Bool)

(assert (=> b!946133 (= e!532188 call!41073)))

(declare-fun b!946134 () Bool)

(declare-fun e!532186 () Bool)

(assert (=> b!946134 (= e!532189 e!532186)))

(declare-fun res!635241 () Bool)

(assert (=> b!946134 (=> (not res!635241) (not e!532186))))

(assert (=> b!946134 (= res!635241 (not e!532187))))

(declare-fun res!635243 () Bool)

(assert (=> b!946134 (=> (not res!635243) (not e!532187))))

(assert (=> b!946134 (= res!635243 (validKeyInArray!0 (select (arr!27524 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41070 () Bool)

(declare-fun c!98663 () Bool)

(assert (=> bm!41070 (= call!41073 (arrayNoDuplicates!0 (_keys!10591 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98663 (Cons!19268 (select (arr!27524 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000) Nil!19269) Nil!19269)))))

(declare-fun b!946135 () Bool)

(assert (=> b!946135 (= e!532186 e!532188)))

(assert (=> b!946135 (= c!98663 (validKeyInArray!0 (select (arr!27524 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114693 (not res!635242)) b!946134))

(assert (= (and b!946134 res!635243) b!946132))

(assert (= (and b!946134 res!635241) b!946135))

(assert (= (and b!946135 c!98663) b!946131))

(assert (= (and b!946135 (not c!98663)) b!946133))

(assert (= (or b!946131 b!946133) bm!41070))

(assert (=> b!946132 m!880331))

(assert (=> b!946132 m!880331))

(declare-fun m!880411 () Bool)

(assert (=> b!946132 m!880411))

(assert (=> b!946134 m!880331))

(assert (=> b!946134 m!880331))

(assert (=> b!946134 m!880333))

(assert (=> bm!41070 m!880331))

(declare-fun m!880413 () Bool)

(assert (=> bm!41070 m!880413))

(assert (=> b!946135 m!880331))

(assert (=> b!946135 m!880331))

(assert (=> b!946135 m!880333))

(assert (=> b!945990 d!114693))

(declare-fun condMapEmpty!32725 () Bool)

(declare-fun mapDefault!32725 () ValueCell!9815)

(assert (=> mapNonEmpty!32724 (= condMapEmpty!32725 (= mapRest!32724 ((as const (Array (_ BitVec 32) ValueCell!9815)) mapDefault!32725)))))

(declare-fun e!532191 () Bool)

(declare-fun mapRes!32725 () Bool)

(assert (=> mapNonEmpty!32724 (= tp!62781 (and e!532191 mapRes!32725))))

(declare-fun mapIsEmpty!32725 () Bool)

(assert (=> mapIsEmpty!32725 mapRes!32725))

(declare-fun b!946136 () Bool)

(declare-fun e!532190 () Bool)

(assert (=> b!946136 (= e!532190 tp_is_empty!20593)))

(declare-fun mapNonEmpty!32725 () Bool)

(declare-fun tp!62782 () Bool)

(assert (=> mapNonEmpty!32725 (= mapRes!32725 (and tp!62782 e!532190))))

(declare-fun mapValue!32725 () ValueCell!9815)

(declare-fun mapRest!32725 () (Array (_ BitVec 32) ValueCell!9815))

(declare-fun mapKey!32725 () (_ BitVec 32))

(assert (=> mapNonEmpty!32725 (= mapRest!32724 (store mapRest!32725 mapKey!32725 mapValue!32725))))

(declare-fun b!946137 () Bool)

(assert (=> b!946137 (= e!532191 tp_is_empty!20593)))

(assert (= (and mapNonEmpty!32724 condMapEmpty!32725) mapIsEmpty!32725))

(assert (= (and mapNonEmpty!32724 (not condMapEmpty!32725)) mapNonEmpty!32725))

(assert (= (and mapNonEmpty!32725 ((_ is ValueCellFull!9815) mapValue!32725)) b!946136))

(assert (= (and mapNonEmpty!32724 ((_ is ValueCellFull!9815) mapDefault!32725)) b!946137))

(declare-fun m!880415 () Bool)

(assert (=> mapNonEmpty!32725 m!880415))

(declare-fun b_lambda!14307 () Bool)

(assert (= b_lambda!14305 (or (and b!945936 b_free!18085) b_lambda!14307)))

(check-sat (not b!946078) (not b_next!18085) (not b!946079) (not b_lambda!14307) (not b!946090) (not b!946026) (not bm!41067) (not b!946089) tp_is_empty!20593 (not d!114681) (not bm!41070) (not bm!41059) (not b!946081) (not d!114689) (not b!946071) (not mapNonEmpty!32725) (not b!946016) (not b!946132) (not bm!41064) (not bm!41062) (not b!946027) (not b!946108) (not b!946083) (not bm!41061) (not b!946135) (not b!946082) (not bm!41043) (not d!114685) (not b!946009) b_and!29519 (not d!114683) (not b!946134) (not b!946104) (not b!946120) (not b!946117))
(check-sat b_and!29519 (not b_next!18085))
