; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81044 () Bool)

(assert start!81044)

(declare-fun b!949001 () Bool)

(declare-fun b_free!18213 () Bool)

(declare-fun b_next!18213 () Bool)

(assert (=> b!949001 (= b_free!18213 (not b_next!18213))))

(declare-fun tp!63221 () Bool)

(declare-fun b_and!29653 () Bool)

(assert (=> b!949001 (= tp!63221 b_and!29653)))

(declare-fun b!948999 () Bool)

(declare-fun e!534251 () Bool)

(declare-fun e!534249 () Bool)

(declare-fun mapRes!32979 () Bool)

(assert (=> b!948999 (= e!534251 (and e!534249 mapRes!32979))))

(declare-fun condMapEmpty!32979 () Bool)

(declare-datatypes ((V!32593 0))(
  ( (V!32594 (val!10411 Int)) )
))
(declare-datatypes ((ValueCell!9879 0))(
  ( (ValueCellFull!9879 (v!12950 V!32593)) (EmptyCell!9879) )
))
(declare-datatypes ((array!57452 0))(
  ( (array!57453 (arr!27630 (Array (_ BitVec 32) ValueCell!9879)) (size!28105 (_ BitVec 32))) )
))
(declare-datatypes ((array!57454 0))(
  ( (array!57455 (arr!27631 (Array (_ BitVec 32) (_ BitVec 64))) (size!28106 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4908 0))(
  ( (LongMapFixedSize!4909 (defaultEntry!5759 Int) (mask!27531 (_ BitVec 32)) (extraKeys!5491 (_ BitVec 32)) (zeroValue!5595 V!32593) (minValue!5595 V!32593) (_size!2509 (_ BitVec 32)) (_keys!10683 array!57454) (_values!5782 array!57452) (_vacant!2509 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4908)

(declare-fun mapDefault!32979 () ValueCell!9879)

(assert (=> b!948999 (= condMapEmpty!32979 (= (arr!27630 (_values!5782 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9879)) mapDefault!32979)))))

(declare-fun tp_is_empty!20721 () Bool)

(declare-fun e!534246 () Bool)

(declare-fun array_inv!21450 (array!57454) Bool)

(declare-fun array_inv!21451 (array!57452) Bool)

(assert (=> b!949001 (= e!534246 (and tp!63221 tp_is_empty!20721 (array_inv!21450 (_keys!10683 thiss!1141)) (array_inv!21451 (_values!5782 thiss!1141)) e!534251))))

(declare-fun b!949002 () Bool)

(declare-fun res!636548 () Bool)

(declare-fun e!534247 () Bool)

(assert (=> b!949002 (=> (not res!636548) (not e!534247))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9131 0))(
  ( (MissingZero!9131 (index!38895 (_ BitVec 32))) (Found!9131 (index!38896 (_ BitVec 32))) (Intermediate!9131 (undefined!9943 Bool) (index!38897 (_ BitVec 32)) (x!81653 (_ BitVec 32))) (Undefined!9131) (MissingVacant!9131 (index!38898 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57454 (_ BitVec 32)) SeekEntryResult!9131)

(assert (=> b!949002 (= res!636548 (not ((_ is Found!9131) (seekEntry!0 key!756 (_keys!10683 thiss!1141) (mask!27531 thiss!1141)))))))

(declare-fun b!949003 () Bool)

(assert (=> b!949003 (= e!534247 (and (= (size!28105 (_values!5782 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27531 thiss!1141))) (= (size!28106 (_keys!10683 thiss!1141)) (size!28105 (_values!5782 thiss!1141))) (bvsge (mask!27531 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5491 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!949004 () Bool)

(declare-fun res!636545 () Bool)

(assert (=> b!949004 (=> (not res!636545) (not e!534247))))

(declare-datatypes ((tuple2!13532 0))(
  ( (tuple2!13533 (_1!6777 (_ BitVec 64)) (_2!6777 V!32593)) )
))
(declare-datatypes ((List!19324 0))(
  ( (Nil!19321) (Cons!19320 (h!20478 tuple2!13532) (t!27655 List!19324)) )
))
(declare-datatypes ((ListLongMap!12229 0))(
  ( (ListLongMap!12230 (toList!6130 List!19324)) )
))
(declare-fun contains!5216 (ListLongMap!12229 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3363 (array!57454 array!57452 (_ BitVec 32) (_ BitVec 32) V!32593 V!32593 (_ BitVec 32) Int) ListLongMap!12229)

(assert (=> b!949004 (= res!636545 (contains!5216 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141)) key!756))))

(declare-fun b!949005 () Bool)

(assert (=> b!949005 (= e!534249 tp_is_empty!20721)))

(declare-fun b!949006 () Bool)

(declare-fun res!636547 () Bool)

(assert (=> b!949006 (=> (not res!636547) (not e!534247))))

(assert (=> b!949006 (= res!636547 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!32979 () Bool)

(assert (=> mapIsEmpty!32979 mapRes!32979))

(declare-fun mapNonEmpty!32979 () Bool)

(declare-fun tp!63220 () Bool)

(declare-fun e!534250 () Bool)

(assert (=> mapNonEmpty!32979 (= mapRes!32979 (and tp!63220 e!534250))))

(declare-fun mapValue!32979 () ValueCell!9879)

(declare-fun mapRest!32979 () (Array (_ BitVec 32) ValueCell!9879))

(declare-fun mapKey!32979 () (_ BitVec 32))

(assert (=> mapNonEmpty!32979 (= (arr!27630 (_values!5782 thiss!1141)) (store mapRest!32979 mapKey!32979 mapValue!32979))))

(declare-fun b!949007 () Bool)

(declare-fun res!636549 () Bool)

(assert (=> b!949007 (=> (not res!636549) (not e!534247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!949007 (= res!636549 (validMask!0 (mask!27531 thiss!1141)))))

(declare-fun res!636546 () Bool)

(assert (=> start!81044 (=> (not res!636546) (not e!534247))))

(declare-fun valid!1870 (LongMapFixedSize!4908) Bool)

(assert (=> start!81044 (= res!636546 (valid!1870 thiss!1141))))

(assert (=> start!81044 e!534247))

(assert (=> start!81044 e!534246))

(assert (=> start!81044 true))

(declare-fun b!949000 () Bool)

(assert (=> b!949000 (= e!534250 tp_is_empty!20721)))

(assert (= (and start!81044 res!636546) b!949006))

(assert (= (and b!949006 res!636547) b!949002))

(assert (= (and b!949002 res!636548) b!949004))

(assert (= (and b!949004 res!636545) b!949007))

(assert (= (and b!949007 res!636549) b!949003))

(assert (= (and b!948999 condMapEmpty!32979) mapIsEmpty!32979))

(assert (= (and b!948999 (not condMapEmpty!32979)) mapNonEmpty!32979))

(assert (= (and mapNonEmpty!32979 ((_ is ValueCellFull!9879) mapValue!32979)) b!949000))

(assert (= (and b!948999 ((_ is ValueCellFull!9879) mapDefault!32979)) b!949005))

(assert (= b!949001 b!948999))

(assert (= start!81044 b!949001))

(declare-fun m!881683 () Bool)

(assert (=> b!949002 m!881683))

(declare-fun m!881685 () Bool)

(assert (=> start!81044 m!881685))

(declare-fun m!881687 () Bool)

(assert (=> b!949007 m!881687))

(declare-fun m!881689 () Bool)

(assert (=> b!949001 m!881689))

(declare-fun m!881691 () Bool)

(assert (=> b!949001 m!881691))

(declare-fun m!881693 () Bool)

(assert (=> b!949004 m!881693))

(assert (=> b!949004 m!881693))

(declare-fun m!881695 () Bool)

(assert (=> b!949004 m!881695))

(declare-fun m!881697 () Bool)

(assert (=> mapNonEmpty!32979 m!881697))

(check-sat (not b!949002) (not start!81044) (not b!949001) b_and!29653 (not mapNonEmpty!32979) (not b!949007) (not b_next!18213) tp_is_empty!20721 (not b!949004))
(check-sat b_and!29653 (not b_next!18213))
(get-model)

(declare-fun d!114947 () Bool)

(assert (=> d!114947 (= (validMask!0 (mask!27531 thiss!1141)) (and (or (= (mask!27531 thiss!1141) #b00000000000000000000000000000111) (= (mask!27531 thiss!1141) #b00000000000000000000000000001111) (= (mask!27531 thiss!1141) #b00000000000000000000000000011111) (= (mask!27531 thiss!1141) #b00000000000000000000000000111111) (= (mask!27531 thiss!1141) #b00000000000000000000000001111111) (= (mask!27531 thiss!1141) #b00000000000000000000000011111111) (= (mask!27531 thiss!1141) #b00000000000000000000000111111111) (= (mask!27531 thiss!1141) #b00000000000000000000001111111111) (= (mask!27531 thiss!1141) #b00000000000000000000011111111111) (= (mask!27531 thiss!1141) #b00000000000000000000111111111111) (= (mask!27531 thiss!1141) #b00000000000000000001111111111111) (= (mask!27531 thiss!1141) #b00000000000000000011111111111111) (= (mask!27531 thiss!1141) #b00000000000000000111111111111111) (= (mask!27531 thiss!1141) #b00000000000000001111111111111111) (= (mask!27531 thiss!1141) #b00000000000000011111111111111111) (= (mask!27531 thiss!1141) #b00000000000000111111111111111111) (= (mask!27531 thiss!1141) #b00000000000001111111111111111111) (= (mask!27531 thiss!1141) #b00000000000011111111111111111111) (= (mask!27531 thiss!1141) #b00000000000111111111111111111111) (= (mask!27531 thiss!1141) #b00000000001111111111111111111111) (= (mask!27531 thiss!1141) #b00000000011111111111111111111111) (= (mask!27531 thiss!1141) #b00000000111111111111111111111111) (= (mask!27531 thiss!1141) #b00000001111111111111111111111111) (= (mask!27531 thiss!1141) #b00000011111111111111111111111111) (= (mask!27531 thiss!1141) #b00000111111111111111111111111111) (= (mask!27531 thiss!1141) #b00001111111111111111111111111111) (= (mask!27531 thiss!1141) #b00011111111111111111111111111111) (= (mask!27531 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27531 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!949007 d!114947))

(declare-fun d!114949 () Bool)

(declare-fun e!534275 () Bool)

(assert (=> d!114949 e!534275))

(declare-fun res!636567 () Bool)

(assert (=> d!114949 (=> res!636567 e!534275)))

(declare-fun lt!427341 () Bool)

(assert (=> d!114949 (= res!636567 (not lt!427341))))

(declare-fun lt!427340 () Bool)

(assert (=> d!114949 (= lt!427341 lt!427340)))

(declare-datatypes ((Unit!31965 0))(
  ( (Unit!31966) )
))
(declare-fun lt!427342 () Unit!31965)

(declare-fun e!534274 () Unit!31965)

(assert (=> d!114949 (= lt!427342 e!534274)))

(declare-fun c!98981 () Bool)

(assert (=> d!114949 (= c!98981 lt!427340)))

(declare-fun containsKey!460 (List!19324 (_ BitVec 64)) Bool)

(assert (=> d!114949 (= lt!427340 (containsKey!460 (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141))) key!756))))

(assert (=> d!114949 (= (contains!5216 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141)) key!756) lt!427341)))

(declare-fun b!949041 () Bool)

(declare-fun lt!427343 () Unit!31965)

(assert (=> b!949041 (= e!534274 lt!427343)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!356 (List!19324 (_ BitVec 64)) Unit!31965)

(assert (=> b!949041 (= lt!427343 (lemmaContainsKeyImpliesGetValueByKeyDefined!356 (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141))) key!756))))

(declare-datatypes ((Option!499 0))(
  ( (Some!498 (v!12952 V!32593)) (None!497) )
))
(declare-fun isDefined!365 (Option!499) Bool)

(declare-fun getValueByKey!493 (List!19324 (_ BitVec 64)) Option!499)

(assert (=> b!949041 (isDefined!365 (getValueByKey!493 (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141))) key!756))))

(declare-fun b!949042 () Bool)

(declare-fun Unit!31967 () Unit!31965)

(assert (=> b!949042 (= e!534274 Unit!31967)))

(declare-fun b!949043 () Bool)

(assert (=> b!949043 (= e!534275 (isDefined!365 (getValueByKey!493 (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141))) key!756)))))

(assert (= (and d!114949 c!98981) b!949041))

(assert (= (and d!114949 (not c!98981)) b!949042))

(assert (= (and d!114949 (not res!636567)) b!949043))

(declare-fun m!881715 () Bool)

(assert (=> d!114949 m!881715))

(declare-fun m!881717 () Bool)

(assert (=> b!949041 m!881717))

(declare-fun m!881719 () Bool)

(assert (=> b!949041 m!881719))

(assert (=> b!949041 m!881719))

(declare-fun m!881721 () Bool)

(assert (=> b!949041 m!881721))

(assert (=> b!949043 m!881719))

(assert (=> b!949043 m!881719))

(assert (=> b!949043 m!881721))

(assert (=> b!949004 d!114949))

(declare-fun b!949086 () Bool)

(declare-fun e!534312 () Bool)

(declare-fun lt!427405 () ListLongMap!12229)

(declare-fun apply!874 (ListLongMap!12229 (_ BitVec 64)) V!32593)

(declare-fun get!14515 (ValueCell!9879 V!32593) V!32593)

(declare-fun dynLambda!1647 (Int (_ BitVec 64)) V!32593)

(assert (=> b!949086 (= e!534312 (= (apply!874 lt!427405 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000)) (get!14515 (select (arr!27630 (_values!5782 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1647 (defaultEntry!5759 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!949086 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28105 (_values!5782 thiss!1141))))))

(assert (=> b!949086 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28106 (_keys!10683 thiss!1141))))))

(declare-fun b!949087 () Bool)

(declare-fun e!534305 () ListLongMap!12229)

(declare-fun call!41268 () ListLongMap!12229)

(assert (=> b!949087 (= e!534305 call!41268)))

(declare-fun b!949088 () Bool)

(declare-fun e!534306 () ListLongMap!12229)

(declare-fun e!534310 () ListLongMap!12229)

(assert (=> b!949088 (= e!534306 e!534310)))

(declare-fun c!98994 () Bool)

(assert (=> b!949088 (= c!98994 (and (not (= (bvand (extraKeys!5491 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5491 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!949089 () Bool)

(declare-fun e!534304 () Bool)

(declare-fun call!41270 () Bool)

(assert (=> b!949089 (= e!534304 (not call!41270))))

(declare-fun b!949090 () Bool)

(declare-fun e!534308 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!949090 (= e!534308 (validKeyInArray!0 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41265 () Bool)

(declare-fun call!41271 () ListLongMap!12229)

(assert (=> bm!41265 (= call!41268 call!41271)))

(declare-fun d!114951 () Bool)

(declare-fun e!534314 () Bool)

(assert (=> d!114951 e!534314))

(declare-fun res!636589 () Bool)

(assert (=> d!114951 (=> (not res!636589) (not e!534314))))

(assert (=> d!114951 (= res!636589 (or (bvsge #b00000000000000000000000000000000 (size!28106 (_keys!10683 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28106 (_keys!10683 thiss!1141))))))))

(declare-fun lt!427404 () ListLongMap!12229)

(assert (=> d!114951 (= lt!427405 lt!427404)))

(declare-fun lt!427391 () Unit!31965)

(declare-fun e!534309 () Unit!31965)

(assert (=> d!114951 (= lt!427391 e!534309)))

(declare-fun c!98999 () Bool)

(declare-fun e!534313 () Bool)

(assert (=> d!114951 (= c!98999 e!534313)))

(declare-fun res!636592 () Bool)

(assert (=> d!114951 (=> (not res!636592) (not e!534313))))

(assert (=> d!114951 (= res!636592 (bvslt #b00000000000000000000000000000000 (size!28106 (_keys!10683 thiss!1141))))))

(assert (=> d!114951 (= lt!427404 e!534306)))

(declare-fun c!98997 () Bool)

(assert (=> d!114951 (= c!98997 (and (not (= (bvand (extraKeys!5491 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5491 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!114951 (validMask!0 (mask!27531 thiss!1141))))

(assert (=> d!114951 (= (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141)) lt!427405)))

(declare-fun b!949091 () Bool)

(declare-fun call!41269 () ListLongMap!12229)

(assert (=> b!949091 (= e!534305 call!41269)))

(declare-fun b!949092 () Bool)

(declare-fun e!534307 () Bool)

(assert (=> b!949092 (= e!534307 (= (apply!874 lt!427405 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5595 thiss!1141)))))

(declare-fun b!949093 () Bool)

(declare-fun lt!427395 () Unit!31965)

(assert (=> b!949093 (= e!534309 lt!427395)))

(declare-fun lt!427396 () ListLongMap!12229)

(declare-fun getCurrentListMapNoExtraKeys!3313 (array!57454 array!57452 (_ BitVec 32) (_ BitVec 32) V!32593 V!32593 (_ BitVec 32) Int) ListLongMap!12229)

(assert (=> b!949093 (= lt!427396 (getCurrentListMapNoExtraKeys!3313 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141)))))

(declare-fun lt!427402 () (_ BitVec 64))

(assert (=> b!949093 (= lt!427402 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427390 () (_ BitVec 64))

(assert (=> b!949093 (= lt!427390 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427403 () Unit!31965)

(declare-fun addStillContains!577 (ListLongMap!12229 (_ BitVec 64) V!32593 (_ BitVec 64)) Unit!31965)

(assert (=> b!949093 (= lt!427403 (addStillContains!577 lt!427396 lt!427402 (zeroValue!5595 thiss!1141) lt!427390))))

(declare-fun +!2858 (ListLongMap!12229 tuple2!13532) ListLongMap!12229)

(assert (=> b!949093 (contains!5216 (+!2858 lt!427396 (tuple2!13533 lt!427402 (zeroValue!5595 thiss!1141))) lt!427390)))

(declare-fun lt!427408 () Unit!31965)

(assert (=> b!949093 (= lt!427408 lt!427403)))

(declare-fun lt!427401 () ListLongMap!12229)

(assert (=> b!949093 (= lt!427401 (getCurrentListMapNoExtraKeys!3313 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141)))))

(declare-fun lt!427388 () (_ BitVec 64))

(assert (=> b!949093 (= lt!427388 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427389 () (_ BitVec 64))

(assert (=> b!949093 (= lt!427389 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427392 () Unit!31965)

(declare-fun addApplyDifferent!457 (ListLongMap!12229 (_ BitVec 64) V!32593 (_ BitVec 64)) Unit!31965)

(assert (=> b!949093 (= lt!427392 (addApplyDifferent!457 lt!427401 lt!427388 (minValue!5595 thiss!1141) lt!427389))))

(assert (=> b!949093 (= (apply!874 (+!2858 lt!427401 (tuple2!13533 lt!427388 (minValue!5595 thiss!1141))) lt!427389) (apply!874 lt!427401 lt!427389))))

(declare-fun lt!427393 () Unit!31965)

(assert (=> b!949093 (= lt!427393 lt!427392)))

(declare-fun lt!427409 () ListLongMap!12229)

(assert (=> b!949093 (= lt!427409 (getCurrentListMapNoExtraKeys!3313 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141)))))

(declare-fun lt!427407 () (_ BitVec 64))

(assert (=> b!949093 (= lt!427407 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427398 () (_ BitVec 64))

(assert (=> b!949093 (= lt!427398 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427406 () Unit!31965)

(assert (=> b!949093 (= lt!427406 (addApplyDifferent!457 lt!427409 lt!427407 (zeroValue!5595 thiss!1141) lt!427398))))

(assert (=> b!949093 (= (apply!874 (+!2858 lt!427409 (tuple2!13533 lt!427407 (zeroValue!5595 thiss!1141))) lt!427398) (apply!874 lt!427409 lt!427398))))

(declare-fun lt!427397 () Unit!31965)

(assert (=> b!949093 (= lt!427397 lt!427406)))

(declare-fun lt!427399 () ListLongMap!12229)

(assert (=> b!949093 (= lt!427399 (getCurrentListMapNoExtraKeys!3313 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141)))))

(declare-fun lt!427400 () (_ BitVec 64))

(assert (=> b!949093 (= lt!427400 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427394 () (_ BitVec 64))

(assert (=> b!949093 (= lt!427394 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949093 (= lt!427395 (addApplyDifferent!457 lt!427399 lt!427400 (minValue!5595 thiss!1141) lt!427394))))

(assert (=> b!949093 (= (apply!874 (+!2858 lt!427399 (tuple2!13533 lt!427400 (minValue!5595 thiss!1141))) lt!427394) (apply!874 lt!427399 lt!427394))))

(declare-fun b!949094 () Bool)

(declare-fun c!98995 () Bool)

(assert (=> b!949094 (= c!98995 (and (not (= (bvand (extraKeys!5491 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5491 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!949094 (= e!534310 e!534305)))

(declare-fun b!949095 () Bool)

(declare-fun res!636587 () Bool)

(assert (=> b!949095 (=> (not res!636587) (not e!534314))))

(assert (=> b!949095 (= res!636587 e!534304)))

(declare-fun c!98998 () Bool)

(assert (=> b!949095 (= c!98998 (not (= (bvand (extraKeys!5491 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41266 () Bool)

(declare-fun call!41272 () ListLongMap!12229)

(assert (=> bm!41266 (= call!41269 call!41272)))

(declare-fun b!949096 () Bool)

(declare-fun e!534302 () Bool)

(assert (=> b!949096 (= e!534302 (= (apply!874 lt!427405 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5595 thiss!1141)))))

(declare-fun b!949097 () Bool)

(assert (=> b!949097 (= e!534306 (+!2858 call!41271 (tuple2!13533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5595 thiss!1141))))))

(declare-fun bm!41267 () Bool)

(declare-fun call!41274 () ListLongMap!12229)

(assert (=> bm!41267 (= call!41272 call!41274)))

(declare-fun b!949098 () Bool)

(declare-fun e!534303 () Bool)

(assert (=> b!949098 (= e!534303 e!534312)))

(declare-fun res!636586 () Bool)

(assert (=> b!949098 (=> (not res!636586) (not e!534312))))

(assert (=> b!949098 (= res!636586 (contains!5216 lt!427405 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!949098 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28106 (_keys!10683 thiss!1141))))))

(declare-fun bm!41268 () Bool)

(assert (=> bm!41268 (= call!41271 (+!2858 (ite c!98997 call!41274 (ite c!98994 call!41272 call!41269)) (ite (or c!98997 c!98994) (tuple2!13533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5595 thiss!1141)) (tuple2!13533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5595 thiss!1141)))))))

(declare-fun b!949099 () Bool)

(assert (=> b!949099 (= e!534310 call!41268)))

(declare-fun bm!41269 () Bool)

(assert (=> bm!41269 (= call!41274 (getCurrentListMapNoExtraKeys!3313 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141)))))

(declare-fun bm!41270 () Bool)

(declare-fun call!41273 () Bool)

(assert (=> bm!41270 (= call!41273 (contains!5216 lt!427405 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949100 () Bool)

(declare-fun Unit!31968 () Unit!31965)

(assert (=> b!949100 (= e!534309 Unit!31968)))

(declare-fun b!949101 () Bool)

(declare-fun e!534311 () Bool)

(assert (=> b!949101 (= e!534311 (not call!41273))))

(declare-fun b!949102 () Bool)

(declare-fun res!636590 () Bool)

(assert (=> b!949102 (=> (not res!636590) (not e!534314))))

(assert (=> b!949102 (= res!636590 e!534303)))

(declare-fun res!636591 () Bool)

(assert (=> b!949102 (=> res!636591 e!534303)))

(assert (=> b!949102 (= res!636591 (not e!534308))))

(declare-fun res!636594 () Bool)

(assert (=> b!949102 (=> (not res!636594) (not e!534308))))

(assert (=> b!949102 (= res!636594 (bvslt #b00000000000000000000000000000000 (size!28106 (_keys!10683 thiss!1141))))))

(declare-fun b!949103 () Bool)

(assert (=> b!949103 (= e!534311 e!534302)))

(declare-fun res!636593 () Bool)

(assert (=> b!949103 (= res!636593 call!41273)))

(assert (=> b!949103 (=> (not res!636593) (not e!534302))))

(declare-fun b!949104 () Bool)

(assert (=> b!949104 (= e!534304 e!534307)))

(declare-fun res!636588 () Bool)

(assert (=> b!949104 (= res!636588 call!41270)))

(assert (=> b!949104 (=> (not res!636588) (not e!534307))))

(declare-fun b!949105 () Bool)

(assert (=> b!949105 (= e!534313 (validKeyInArray!0 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949106 () Bool)

(assert (=> b!949106 (= e!534314 e!534311)))

(declare-fun c!98996 () Bool)

(assert (=> b!949106 (= c!98996 (not (= (bvand (extraKeys!5491 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41271 () Bool)

(assert (=> bm!41271 (= call!41270 (contains!5216 lt!427405 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!114951 c!98997) b!949097))

(assert (= (and d!114951 (not c!98997)) b!949088))

(assert (= (and b!949088 c!98994) b!949099))

(assert (= (and b!949088 (not c!98994)) b!949094))

(assert (= (and b!949094 c!98995) b!949087))

(assert (= (and b!949094 (not c!98995)) b!949091))

(assert (= (or b!949087 b!949091) bm!41266))

(assert (= (or b!949099 bm!41266) bm!41267))

(assert (= (or b!949099 b!949087) bm!41265))

(assert (= (or b!949097 bm!41267) bm!41269))

(assert (= (or b!949097 bm!41265) bm!41268))

(assert (= (and d!114951 res!636592) b!949105))

(assert (= (and d!114951 c!98999) b!949093))

(assert (= (and d!114951 (not c!98999)) b!949100))

(assert (= (and d!114951 res!636589) b!949102))

(assert (= (and b!949102 res!636594) b!949090))

(assert (= (and b!949102 (not res!636591)) b!949098))

(assert (= (and b!949098 res!636586) b!949086))

(assert (= (and b!949102 res!636590) b!949095))

(assert (= (and b!949095 c!98998) b!949104))

(assert (= (and b!949095 (not c!98998)) b!949089))

(assert (= (and b!949104 res!636588) b!949092))

(assert (= (or b!949104 b!949089) bm!41271))

(assert (= (and b!949095 res!636587) b!949106))

(assert (= (and b!949106 c!98996) b!949103))

(assert (= (and b!949106 (not c!98996)) b!949101))

(assert (= (and b!949103 res!636593) b!949096))

(assert (= (or b!949103 b!949101) bm!41270))

(declare-fun b_lambda!14335 () Bool)

(assert (=> (not b_lambda!14335) (not b!949086)))

(declare-fun t!27657 () Bool)

(declare-fun tb!6183 () Bool)

(assert (=> (and b!949001 (= (defaultEntry!5759 thiss!1141) (defaultEntry!5759 thiss!1141)) t!27657) tb!6183))

(declare-fun result!12271 () Bool)

(assert (=> tb!6183 (= result!12271 tp_is_empty!20721)))

(assert (=> b!949086 t!27657))

(declare-fun b_and!29657 () Bool)

(assert (= b_and!29653 (and (=> t!27657 result!12271) b_and!29657)))

(declare-fun m!881723 () Bool)

(assert (=> b!949086 m!881723))

(declare-fun m!881725 () Bool)

(assert (=> b!949086 m!881725))

(assert (=> b!949086 m!881723))

(declare-fun m!881727 () Bool)

(assert (=> b!949086 m!881727))

(assert (=> b!949086 m!881727))

(declare-fun m!881729 () Bool)

(assert (=> b!949086 m!881729))

(declare-fun m!881731 () Bool)

(assert (=> b!949086 m!881731))

(assert (=> b!949086 m!881729))

(declare-fun m!881733 () Bool)

(assert (=> bm!41269 m!881733))

(assert (=> b!949090 m!881723))

(assert (=> b!949090 m!881723))

(declare-fun m!881735 () Bool)

(assert (=> b!949090 m!881735))

(declare-fun m!881737 () Bool)

(assert (=> bm!41270 m!881737))

(assert (=> b!949093 m!881723))

(declare-fun m!881739 () Bool)

(assert (=> b!949093 m!881739))

(declare-fun m!881741 () Bool)

(assert (=> b!949093 m!881741))

(declare-fun m!881743 () Bool)

(assert (=> b!949093 m!881743))

(declare-fun m!881745 () Bool)

(assert (=> b!949093 m!881745))

(declare-fun m!881747 () Bool)

(assert (=> b!949093 m!881747))

(declare-fun m!881749 () Bool)

(assert (=> b!949093 m!881749))

(declare-fun m!881751 () Bool)

(assert (=> b!949093 m!881751))

(declare-fun m!881753 () Bool)

(assert (=> b!949093 m!881753))

(assert (=> b!949093 m!881733))

(assert (=> b!949093 m!881739))

(declare-fun m!881755 () Bool)

(assert (=> b!949093 m!881755))

(declare-fun m!881757 () Bool)

(assert (=> b!949093 m!881757))

(declare-fun m!881759 () Bool)

(assert (=> b!949093 m!881759))

(declare-fun m!881761 () Bool)

(assert (=> b!949093 m!881761))

(declare-fun m!881763 () Bool)

(assert (=> b!949093 m!881763))

(assert (=> b!949093 m!881759))

(declare-fun m!881765 () Bool)

(assert (=> b!949093 m!881765))

(assert (=> b!949093 m!881747))

(assert (=> b!949093 m!881753))

(declare-fun m!881767 () Bool)

(assert (=> b!949093 m!881767))

(assert (=> d!114951 m!881687))

(declare-fun m!881769 () Bool)

(assert (=> bm!41271 m!881769))

(declare-fun m!881771 () Bool)

(assert (=> b!949096 m!881771))

(declare-fun m!881773 () Bool)

(assert (=> bm!41268 m!881773))

(declare-fun m!881775 () Bool)

(assert (=> b!949092 m!881775))

(assert (=> b!949105 m!881723))

(assert (=> b!949105 m!881723))

(assert (=> b!949105 m!881735))

(assert (=> b!949098 m!881723))

(assert (=> b!949098 m!881723))

(declare-fun m!881777 () Bool)

(assert (=> b!949098 m!881777))

(declare-fun m!881779 () Bool)

(assert (=> b!949097 m!881779))

(assert (=> b!949004 d!114951))

(declare-fun d!114953 () Bool)

(assert (=> d!114953 (= (array_inv!21450 (_keys!10683 thiss!1141)) (bvsge (size!28106 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949001 d!114953))

(declare-fun d!114955 () Bool)

(assert (=> d!114955 (= (array_inv!21451 (_values!5782 thiss!1141)) (bvsge (size!28105 (_values!5782 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949001 d!114955))

(declare-fun d!114957 () Bool)

(declare-fun res!636601 () Bool)

(declare-fun e!534317 () Bool)

(assert (=> d!114957 (=> (not res!636601) (not e!534317))))

(declare-fun simpleValid!370 (LongMapFixedSize!4908) Bool)

(assert (=> d!114957 (= res!636601 (simpleValid!370 thiss!1141))))

(assert (=> d!114957 (= (valid!1870 thiss!1141) e!534317)))

(declare-fun b!949115 () Bool)

(declare-fun res!636602 () Bool)

(assert (=> b!949115 (=> (not res!636602) (not e!534317))))

(declare-fun arrayCountValidKeys!0 (array!57454 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!949115 (= res!636602 (= (arrayCountValidKeys!0 (_keys!10683 thiss!1141) #b00000000000000000000000000000000 (size!28106 (_keys!10683 thiss!1141))) (_size!2509 thiss!1141)))))

(declare-fun b!949116 () Bool)

(declare-fun res!636603 () Bool)

(assert (=> b!949116 (=> (not res!636603) (not e!534317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57454 (_ BitVec 32)) Bool)

(assert (=> b!949116 (= res!636603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10683 thiss!1141) (mask!27531 thiss!1141)))))

(declare-fun b!949117 () Bool)

(declare-datatypes ((List!19325 0))(
  ( (Nil!19322) (Cons!19321 (h!20479 (_ BitVec 64)) (t!27658 List!19325)) )
))
(declare-fun arrayNoDuplicates!0 (array!57454 (_ BitVec 32) List!19325) Bool)

(assert (=> b!949117 (= e!534317 (arrayNoDuplicates!0 (_keys!10683 thiss!1141) #b00000000000000000000000000000000 Nil!19322))))

(assert (= (and d!114957 res!636601) b!949115))

(assert (= (and b!949115 res!636602) b!949116))

(assert (= (and b!949116 res!636603) b!949117))

(declare-fun m!881781 () Bool)

(assert (=> d!114957 m!881781))

(declare-fun m!881783 () Bool)

(assert (=> b!949115 m!881783))

(declare-fun m!881785 () Bool)

(assert (=> b!949116 m!881785))

(declare-fun m!881787 () Bool)

(assert (=> b!949117 m!881787))

(assert (=> start!81044 d!114957))

(declare-fun b!949130 () Bool)

(declare-fun c!99006 () Bool)

(declare-fun lt!427419 () (_ BitVec 64))

(assert (=> b!949130 (= c!99006 (= lt!427419 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!534325 () SeekEntryResult!9131)

(declare-fun e!534324 () SeekEntryResult!9131)

(assert (=> b!949130 (= e!534325 e!534324)))

(declare-fun d!114959 () Bool)

(declare-fun lt!427421 () SeekEntryResult!9131)

(assert (=> d!114959 (and (or ((_ is MissingVacant!9131) lt!427421) (not ((_ is Found!9131) lt!427421)) (and (bvsge (index!38896 lt!427421) #b00000000000000000000000000000000) (bvslt (index!38896 lt!427421) (size!28106 (_keys!10683 thiss!1141))))) (not ((_ is MissingVacant!9131) lt!427421)) (or (not ((_ is Found!9131) lt!427421)) (= (select (arr!27631 (_keys!10683 thiss!1141)) (index!38896 lt!427421)) key!756)))))

(declare-fun e!534326 () SeekEntryResult!9131)

(assert (=> d!114959 (= lt!427421 e!534326)))

(declare-fun c!99007 () Bool)

(declare-fun lt!427418 () SeekEntryResult!9131)

(assert (=> d!114959 (= c!99007 (and ((_ is Intermediate!9131) lt!427418) (undefined!9943 lt!427418)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57454 (_ BitVec 32)) SeekEntryResult!9131)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114959 (= lt!427418 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27531 thiss!1141)) key!756 (_keys!10683 thiss!1141) (mask!27531 thiss!1141)))))

(assert (=> d!114959 (validMask!0 (mask!27531 thiss!1141))))

(assert (=> d!114959 (= (seekEntry!0 key!756 (_keys!10683 thiss!1141) (mask!27531 thiss!1141)) lt!427421)))

(declare-fun b!949131 () Bool)

(declare-fun lt!427420 () SeekEntryResult!9131)

(assert (=> b!949131 (= e!534324 (ite ((_ is MissingVacant!9131) lt!427420) (MissingZero!9131 (index!38898 lt!427420)) lt!427420))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57454 (_ BitVec 32)) SeekEntryResult!9131)

(assert (=> b!949131 (= lt!427420 (seekKeyOrZeroReturnVacant!0 (x!81653 lt!427418) (index!38897 lt!427418) (index!38897 lt!427418) key!756 (_keys!10683 thiss!1141) (mask!27531 thiss!1141)))))

(declare-fun b!949132 () Bool)

(assert (=> b!949132 (= e!534326 Undefined!9131)))

(declare-fun b!949133 () Bool)

(assert (=> b!949133 (= e!534325 (Found!9131 (index!38897 lt!427418)))))

(declare-fun b!949134 () Bool)

(assert (=> b!949134 (= e!534326 e!534325)))

(assert (=> b!949134 (= lt!427419 (select (arr!27631 (_keys!10683 thiss!1141)) (index!38897 lt!427418)))))

(declare-fun c!99008 () Bool)

(assert (=> b!949134 (= c!99008 (= lt!427419 key!756))))

(declare-fun b!949135 () Bool)

(assert (=> b!949135 (= e!534324 (MissingZero!9131 (index!38897 lt!427418)))))

(assert (= (and d!114959 c!99007) b!949132))

(assert (= (and d!114959 (not c!99007)) b!949134))

(assert (= (and b!949134 c!99008) b!949133))

(assert (= (and b!949134 (not c!99008)) b!949130))

(assert (= (and b!949130 c!99006) b!949135))

(assert (= (and b!949130 (not c!99006)) b!949131))

(declare-fun m!881789 () Bool)

(assert (=> d!114959 m!881789))

(declare-fun m!881791 () Bool)

(assert (=> d!114959 m!881791))

(assert (=> d!114959 m!881791))

(declare-fun m!881793 () Bool)

(assert (=> d!114959 m!881793))

(assert (=> d!114959 m!881687))

(declare-fun m!881795 () Bool)

(assert (=> b!949131 m!881795))

(declare-fun m!881797 () Bool)

(assert (=> b!949134 m!881797))

(assert (=> b!949002 d!114959))

(declare-fun mapNonEmpty!32985 () Bool)

(declare-fun mapRes!32985 () Bool)

(declare-fun tp!63230 () Bool)

(declare-fun e!534331 () Bool)

(assert (=> mapNonEmpty!32985 (= mapRes!32985 (and tp!63230 e!534331))))

(declare-fun mapKey!32985 () (_ BitVec 32))

(declare-fun mapValue!32985 () ValueCell!9879)

(declare-fun mapRest!32985 () (Array (_ BitVec 32) ValueCell!9879))

(assert (=> mapNonEmpty!32985 (= mapRest!32979 (store mapRest!32985 mapKey!32985 mapValue!32985))))

(declare-fun b!949143 () Bool)

(declare-fun e!534332 () Bool)

(assert (=> b!949143 (= e!534332 tp_is_empty!20721)))

(declare-fun mapIsEmpty!32985 () Bool)

(assert (=> mapIsEmpty!32985 mapRes!32985))

(declare-fun b!949142 () Bool)

(assert (=> b!949142 (= e!534331 tp_is_empty!20721)))

(declare-fun condMapEmpty!32985 () Bool)

(declare-fun mapDefault!32985 () ValueCell!9879)

(assert (=> mapNonEmpty!32979 (= condMapEmpty!32985 (= mapRest!32979 ((as const (Array (_ BitVec 32) ValueCell!9879)) mapDefault!32985)))))

(assert (=> mapNonEmpty!32979 (= tp!63220 (and e!534332 mapRes!32985))))

(assert (= (and mapNonEmpty!32979 condMapEmpty!32985) mapIsEmpty!32985))

(assert (= (and mapNonEmpty!32979 (not condMapEmpty!32985)) mapNonEmpty!32985))

(assert (= (and mapNonEmpty!32985 ((_ is ValueCellFull!9879) mapValue!32985)) b!949142))

(assert (= (and mapNonEmpty!32979 ((_ is ValueCellFull!9879) mapDefault!32985)) b!949143))

(declare-fun m!881799 () Bool)

(assert (=> mapNonEmpty!32985 m!881799))

(declare-fun b_lambda!14337 () Bool)

(assert (= b_lambda!14335 (or (and b!949001 b_free!18213) b_lambda!14337)))

(check-sat (not b!949096) (not b_lambda!14337) (not d!114957) (not b!949105) (not bm!41268) tp_is_empty!20721 (not d!114949) (not b!949116) b_and!29657 (not b!949043) (not b!949097) (not bm!41271) (not b!949131) (not b!949086) (not b_next!18213) (not d!114951) (not b!949093) (not b!949092) (not b!949117) (not b!949041) (not b!949090) (not b!949098) (not bm!41269) (not b!949115) (not bm!41270) (not mapNonEmpty!32985) (not d!114959))
(check-sat b_and!29657 (not b_next!18213))
(get-model)

(declare-fun d!114961 () Bool)

(declare-fun res!636608 () Bool)

(declare-fun e!534337 () Bool)

(assert (=> d!114961 (=> res!636608 e!534337)))

(assert (=> d!114961 (= res!636608 (and ((_ is Cons!19320) (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141)))) (= (_1!6777 (h!20478 (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141))))) key!756)))))

(assert (=> d!114961 (= (containsKey!460 (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141))) key!756) e!534337)))

(declare-fun b!949148 () Bool)

(declare-fun e!534338 () Bool)

(assert (=> b!949148 (= e!534337 e!534338)))

(declare-fun res!636609 () Bool)

(assert (=> b!949148 (=> (not res!636609) (not e!534338))))

(assert (=> b!949148 (= res!636609 (and (or (not ((_ is Cons!19320) (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141))))) (bvsle (_1!6777 (h!20478 (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141))))) key!756)) ((_ is Cons!19320) (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141)))) (bvslt (_1!6777 (h!20478 (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141))))) key!756)))))

(declare-fun b!949149 () Bool)

(assert (=> b!949149 (= e!534338 (containsKey!460 (t!27655 (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141)))) key!756))))

(assert (= (and d!114961 (not res!636608)) b!949148))

(assert (= (and b!949148 res!636609) b!949149))

(declare-fun m!881801 () Bool)

(assert (=> b!949149 m!881801))

(assert (=> d!114949 d!114961))

(declare-fun d!114963 () Bool)

(assert (=> d!114963 (= (validKeyInArray!0 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000)) (and (not (= (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!949090 d!114963))

(assert (=> b!949105 d!114963))

(declare-fun d!114965 () Bool)

(declare-fun e!534340 () Bool)

(assert (=> d!114965 e!534340))

(declare-fun res!636610 () Bool)

(assert (=> d!114965 (=> res!636610 e!534340)))

(declare-fun lt!427423 () Bool)

(assert (=> d!114965 (= res!636610 (not lt!427423))))

(declare-fun lt!427422 () Bool)

(assert (=> d!114965 (= lt!427423 lt!427422)))

(declare-fun lt!427424 () Unit!31965)

(declare-fun e!534339 () Unit!31965)

(assert (=> d!114965 (= lt!427424 e!534339)))

(declare-fun c!99009 () Bool)

(assert (=> d!114965 (= c!99009 lt!427422)))

(assert (=> d!114965 (= lt!427422 (containsKey!460 (toList!6130 lt!427405) (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114965 (= (contains!5216 lt!427405 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000)) lt!427423)))

(declare-fun b!949150 () Bool)

(declare-fun lt!427425 () Unit!31965)

(assert (=> b!949150 (= e!534339 lt!427425)))

(assert (=> b!949150 (= lt!427425 (lemmaContainsKeyImpliesGetValueByKeyDefined!356 (toList!6130 lt!427405) (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!949150 (isDefined!365 (getValueByKey!493 (toList!6130 lt!427405) (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949151 () Bool)

(declare-fun Unit!31969 () Unit!31965)

(assert (=> b!949151 (= e!534339 Unit!31969)))

(declare-fun b!949152 () Bool)

(assert (=> b!949152 (= e!534340 (isDefined!365 (getValueByKey!493 (toList!6130 lt!427405) (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000))))))

(assert (= (and d!114965 c!99009) b!949150))

(assert (= (and d!114965 (not c!99009)) b!949151))

(assert (= (and d!114965 (not res!636610)) b!949152))

(assert (=> d!114965 m!881723))

(declare-fun m!881803 () Bool)

(assert (=> d!114965 m!881803))

(assert (=> b!949150 m!881723))

(declare-fun m!881805 () Bool)

(assert (=> b!949150 m!881805))

(assert (=> b!949150 m!881723))

(declare-fun m!881807 () Bool)

(assert (=> b!949150 m!881807))

(assert (=> b!949150 m!881807))

(declare-fun m!881809 () Bool)

(assert (=> b!949150 m!881809))

(assert (=> b!949152 m!881723))

(assert (=> b!949152 m!881807))

(assert (=> b!949152 m!881807))

(assert (=> b!949152 m!881809))

(assert (=> b!949098 d!114965))

(declare-fun d!114967 () Bool)

(declare-fun e!534343 () Bool)

(assert (=> d!114967 e!534343))

(declare-fun res!636616 () Bool)

(assert (=> d!114967 (=> (not res!636616) (not e!534343))))

(declare-fun lt!427434 () ListLongMap!12229)

(assert (=> d!114967 (= res!636616 (contains!5216 lt!427434 (_1!6777 (ite (or c!98997 c!98994) (tuple2!13533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5595 thiss!1141)) (tuple2!13533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5595 thiss!1141))))))))

(declare-fun lt!427437 () List!19324)

(assert (=> d!114967 (= lt!427434 (ListLongMap!12230 lt!427437))))

(declare-fun lt!427436 () Unit!31965)

(declare-fun lt!427435 () Unit!31965)

(assert (=> d!114967 (= lt!427436 lt!427435)))

(assert (=> d!114967 (= (getValueByKey!493 lt!427437 (_1!6777 (ite (or c!98997 c!98994) (tuple2!13533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5595 thiss!1141)) (tuple2!13533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5595 thiss!1141))))) (Some!498 (_2!6777 (ite (or c!98997 c!98994) (tuple2!13533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5595 thiss!1141)) (tuple2!13533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5595 thiss!1141))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!264 (List!19324 (_ BitVec 64) V!32593) Unit!31965)

(assert (=> d!114967 (= lt!427435 (lemmaContainsTupThenGetReturnValue!264 lt!427437 (_1!6777 (ite (or c!98997 c!98994) (tuple2!13533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5595 thiss!1141)) (tuple2!13533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5595 thiss!1141)))) (_2!6777 (ite (or c!98997 c!98994) (tuple2!13533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5595 thiss!1141)) (tuple2!13533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5595 thiss!1141))))))))

(declare-fun insertStrictlySorted!321 (List!19324 (_ BitVec 64) V!32593) List!19324)

(assert (=> d!114967 (= lt!427437 (insertStrictlySorted!321 (toList!6130 (ite c!98997 call!41274 (ite c!98994 call!41272 call!41269))) (_1!6777 (ite (or c!98997 c!98994) (tuple2!13533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5595 thiss!1141)) (tuple2!13533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5595 thiss!1141)))) (_2!6777 (ite (or c!98997 c!98994) (tuple2!13533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5595 thiss!1141)) (tuple2!13533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5595 thiss!1141))))))))

(assert (=> d!114967 (= (+!2858 (ite c!98997 call!41274 (ite c!98994 call!41272 call!41269)) (ite (or c!98997 c!98994) (tuple2!13533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5595 thiss!1141)) (tuple2!13533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5595 thiss!1141)))) lt!427434)))

(declare-fun b!949157 () Bool)

(declare-fun res!636615 () Bool)

(assert (=> b!949157 (=> (not res!636615) (not e!534343))))

(assert (=> b!949157 (= res!636615 (= (getValueByKey!493 (toList!6130 lt!427434) (_1!6777 (ite (or c!98997 c!98994) (tuple2!13533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5595 thiss!1141)) (tuple2!13533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5595 thiss!1141))))) (Some!498 (_2!6777 (ite (or c!98997 c!98994) (tuple2!13533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5595 thiss!1141)) (tuple2!13533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5595 thiss!1141)))))))))

(declare-fun b!949158 () Bool)

(declare-fun contains!5217 (List!19324 tuple2!13532) Bool)

(assert (=> b!949158 (= e!534343 (contains!5217 (toList!6130 lt!427434) (ite (or c!98997 c!98994) (tuple2!13533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5595 thiss!1141)) (tuple2!13533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5595 thiss!1141)))))))

(assert (= (and d!114967 res!636616) b!949157))

(assert (= (and b!949157 res!636615) b!949158))

(declare-fun m!881811 () Bool)

(assert (=> d!114967 m!881811))

(declare-fun m!881813 () Bool)

(assert (=> d!114967 m!881813))

(declare-fun m!881815 () Bool)

(assert (=> d!114967 m!881815))

(declare-fun m!881817 () Bool)

(assert (=> d!114967 m!881817))

(declare-fun m!881819 () Bool)

(assert (=> b!949157 m!881819))

(declare-fun m!881821 () Bool)

(assert (=> b!949158 m!881821))

(assert (=> bm!41268 d!114967))

(declare-fun b!949171 () Bool)

(declare-fun e!534352 () SeekEntryResult!9131)

(declare-fun e!534350 () SeekEntryResult!9131)

(assert (=> b!949171 (= e!534352 e!534350)))

(declare-fun c!99017 () Bool)

(declare-fun lt!427442 () (_ BitVec 64))

(assert (=> b!949171 (= c!99017 (= lt!427442 key!756))))

(declare-fun b!949172 () Bool)

(assert (=> b!949172 (= e!534352 Undefined!9131)))

(declare-fun b!949173 () Bool)

(assert (=> b!949173 (= e!534350 (Found!9131 (index!38897 lt!427418)))))

(declare-fun lt!427443 () SeekEntryResult!9131)

(declare-fun d!114969 () Bool)

(assert (=> d!114969 (and (or ((_ is Undefined!9131) lt!427443) (not ((_ is Found!9131) lt!427443)) (and (bvsge (index!38896 lt!427443) #b00000000000000000000000000000000) (bvslt (index!38896 lt!427443) (size!28106 (_keys!10683 thiss!1141))))) (or ((_ is Undefined!9131) lt!427443) ((_ is Found!9131) lt!427443) (not ((_ is MissingVacant!9131) lt!427443)) (not (= (index!38898 lt!427443) (index!38897 lt!427418))) (and (bvsge (index!38898 lt!427443) #b00000000000000000000000000000000) (bvslt (index!38898 lt!427443) (size!28106 (_keys!10683 thiss!1141))))) (or ((_ is Undefined!9131) lt!427443) (ite ((_ is Found!9131) lt!427443) (= (select (arr!27631 (_keys!10683 thiss!1141)) (index!38896 lt!427443)) key!756) (and ((_ is MissingVacant!9131) lt!427443) (= (index!38898 lt!427443) (index!38897 lt!427418)) (= (select (arr!27631 (_keys!10683 thiss!1141)) (index!38898 lt!427443)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!114969 (= lt!427443 e!534352)))

(declare-fun c!99018 () Bool)

(assert (=> d!114969 (= c!99018 (bvsge (x!81653 lt!427418) #b01111111111111111111111111111110))))

(assert (=> d!114969 (= lt!427442 (select (arr!27631 (_keys!10683 thiss!1141)) (index!38897 lt!427418)))))

(assert (=> d!114969 (validMask!0 (mask!27531 thiss!1141))))

(assert (=> d!114969 (= (seekKeyOrZeroReturnVacant!0 (x!81653 lt!427418) (index!38897 lt!427418) (index!38897 lt!427418) key!756 (_keys!10683 thiss!1141) (mask!27531 thiss!1141)) lt!427443)))

(declare-fun b!949174 () Bool)

(declare-fun c!99016 () Bool)

(assert (=> b!949174 (= c!99016 (= lt!427442 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!534351 () SeekEntryResult!9131)

(assert (=> b!949174 (= e!534350 e!534351)))

(declare-fun b!949175 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!949175 (= e!534351 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81653 lt!427418) #b00000000000000000000000000000001) (nextIndex!0 (index!38897 lt!427418) (x!81653 lt!427418) (mask!27531 thiss!1141)) (index!38897 lt!427418) key!756 (_keys!10683 thiss!1141) (mask!27531 thiss!1141)))))

(declare-fun b!949176 () Bool)

(assert (=> b!949176 (= e!534351 (MissingVacant!9131 (index!38897 lt!427418)))))

(assert (= (and d!114969 c!99018) b!949172))

(assert (= (and d!114969 (not c!99018)) b!949171))

(assert (= (and b!949171 c!99017) b!949173))

(assert (= (and b!949171 (not c!99017)) b!949174))

(assert (= (and b!949174 c!99016) b!949176))

(assert (= (and b!949174 (not c!99016)) b!949175))

(declare-fun m!881823 () Bool)

(assert (=> d!114969 m!881823))

(declare-fun m!881825 () Bool)

(assert (=> d!114969 m!881825))

(assert (=> d!114969 m!881797))

(assert (=> d!114969 m!881687))

(declare-fun m!881827 () Bool)

(assert (=> b!949175 m!881827))

(assert (=> b!949175 m!881827))

(declare-fun m!881829 () Bool)

(assert (=> b!949175 m!881829))

(assert (=> b!949131 d!114969))

(declare-fun d!114971 () Bool)

(declare-fun get!14516 (Option!499) V!32593)

(assert (=> d!114971 (= (apply!874 lt!427405 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14516 (getValueByKey!493 (toList!6130 lt!427405) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26675 () Bool)

(assert (= bs!26675 d!114971))

(declare-fun m!881831 () Bool)

(assert (=> bs!26675 m!881831))

(assert (=> bs!26675 m!881831))

(declare-fun m!881833 () Bool)

(assert (=> bs!26675 m!881833))

(assert (=> b!949096 d!114971))

(declare-fun d!114973 () Bool)

(declare-fun e!534353 () Bool)

(assert (=> d!114973 e!534353))

(declare-fun res!636618 () Bool)

(assert (=> d!114973 (=> (not res!636618) (not e!534353))))

(declare-fun lt!427444 () ListLongMap!12229)

(assert (=> d!114973 (= res!636618 (contains!5216 lt!427444 (_1!6777 (tuple2!13533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5595 thiss!1141)))))))

(declare-fun lt!427447 () List!19324)

(assert (=> d!114973 (= lt!427444 (ListLongMap!12230 lt!427447))))

(declare-fun lt!427446 () Unit!31965)

(declare-fun lt!427445 () Unit!31965)

(assert (=> d!114973 (= lt!427446 lt!427445)))

(assert (=> d!114973 (= (getValueByKey!493 lt!427447 (_1!6777 (tuple2!13533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5595 thiss!1141)))) (Some!498 (_2!6777 (tuple2!13533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5595 thiss!1141)))))))

(assert (=> d!114973 (= lt!427445 (lemmaContainsTupThenGetReturnValue!264 lt!427447 (_1!6777 (tuple2!13533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5595 thiss!1141))) (_2!6777 (tuple2!13533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5595 thiss!1141)))))))

(assert (=> d!114973 (= lt!427447 (insertStrictlySorted!321 (toList!6130 call!41271) (_1!6777 (tuple2!13533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5595 thiss!1141))) (_2!6777 (tuple2!13533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5595 thiss!1141)))))))

(assert (=> d!114973 (= (+!2858 call!41271 (tuple2!13533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5595 thiss!1141))) lt!427444)))

(declare-fun b!949177 () Bool)

(declare-fun res!636617 () Bool)

(assert (=> b!949177 (=> (not res!636617) (not e!534353))))

(assert (=> b!949177 (= res!636617 (= (getValueByKey!493 (toList!6130 lt!427444) (_1!6777 (tuple2!13533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5595 thiss!1141)))) (Some!498 (_2!6777 (tuple2!13533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5595 thiss!1141))))))))

(declare-fun b!949178 () Bool)

(assert (=> b!949178 (= e!534353 (contains!5217 (toList!6130 lt!427444) (tuple2!13533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5595 thiss!1141))))))

(assert (= (and d!114973 res!636618) b!949177))

(assert (= (and b!949177 res!636617) b!949178))

(declare-fun m!881835 () Bool)

(assert (=> d!114973 m!881835))

(declare-fun m!881837 () Bool)

(assert (=> d!114973 m!881837))

(declare-fun m!881839 () Bool)

(assert (=> d!114973 m!881839))

(declare-fun m!881841 () Bool)

(assert (=> d!114973 m!881841))

(declare-fun m!881843 () Bool)

(assert (=> b!949177 m!881843))

(declare-fun m!881845 () Bool)

(assert (=> b!949178 m!881845))

(assert (=> b!949097 d!114973))

(declare-fun b!949197 () Bool)

(declare-fun e!534364 () SeekEntryResult!9131)

(assert (=> b!949197 (= e!534364 (Intermediate!9131 false (toIndex!0 key!756 (mask!27531 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!949198 () Bool)

(declare-fun e!534365 () Bool)

(declare-fun lt!427452 () SeekEntryResult!9131)

(assert (=> b!949198 (= e!534365 (bvsge (x!81653 lt!427452) #b01111111111111111111111111111110))))

(declare-fun b!949199 () Bool)

(declare-fun e!534368 () SeekEntryResult!9131)

(assert (=> b!949199 (= e!534368 e!534364)))

(declare-fun c!99025 () Bool)

(declare-fun lt!427453 () (_ BitVec 64))

(assert (=> b!949199 (= c!99025 (or (= lt!427453 key!756) (= (bvadd lt!427453 lt!427453) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!949200 () Bool)

(assert (=> b!949200 (and (bvsge (index!38897 lt!427452) #b00000000000000000000000000000000) (bvslt (index!38897 lt!427452) (size!28106 (_keys!10683 thiss!1141))))))

(declare-fun e!534366 () Bool)

(assert (=> b!949200 (= e!534366 (= (select (arr!27631 (_keys!10683 thiss!1141)) (index!38897 lt!427452)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949201 () Bool)

(declare-fun e!534367 () Bool)

(assert (=> b!949201 (= e!534365 e!534367)))

(declare-fun res!636626 () Bool)

(assert (=> b!949201 (= res!636626 (and ((_ is Intermediate!9131) lt!427452) (not (undefined!9943 lt!427452)) (bvslt (x!81653 lt!427452) #b01111111111111111111111111111110) (bvsge (x!81653 lt!427452) #b00000000000000000000000000000000) (bvsge (x!81653 lt!427452) #b00000000000000000000000000000000)))))

(assert (=> b!949201 (=> (not res!636626) (not e!534367))))

(declare-fun b!949202 () Bool)

(assert (=> b!949202 (= e!534368 (Intermediate!9131 true (toIndex!0 key!756 (mask!27531 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!949204 () Bool)

(assert (=> b!949204 (and (bvsge (index!38897 lt!427452) #b00000000000000000000000000000000) (bvslt (index!38897 lt!427452) (size!28106 (_keys!10683 thiss!1141))))))

(declare-fun res!636625 () Bool)

(assert (=> b!949204 (= res!636625 (= (select (arr!27631 (_keys!10683 thiss!1141)) (index!38897 lt!427452)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!949204 (=> res!636625 e!534366)))

(declare-fun b!949205 () Bool)

(assert (=> b!949205 (and (bvsge (index!38897 lt!427452) #b00000000000000000000000000000000) (bvslt (index!38897 lt!427452) (size!28106 (_keys!10683 thiss!1141))))))

(declare-fun res!636627 () Bool)

(assert (=> b!949205 (= res!636627 (= (select (arr!27631 (_keys!10683 thiss!1141)) (index!38897 lt!427452)) key!756))))

(assert (=> b!949205 (=> res!636627 e!534366)))

(assert (=> b!949205 (= e!534367 e!534366)))

(declare-fun b!949203 () Bool)

(assert (=> b!949203 (= e!534364 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27531 thiss!1141)) #b00000000000000000000000000000000 (mask!27531 thiss!1141)) key!756 (_keys!10683 thiss!1141) (mask!27531 thiss!1141)))))

(declare-fun d!114975 () Bool)

(assert (=> d!114975 e!534365))

(declare-fun c!99026 () Bool)

(assert (=> d!114975 (= c!99026 (and ((_ is Intermediate!9131) lt!427452) (undefined!9943 lt!427452)))))

(assert (=> d!114975 (= lt!427452 e!534368)))

(declare-fun c!99027 () Bool)

(assert (=> d!114975 (= c!99027 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!114975 (= lt!427453 (select (arr!27631 (_keys!10683 thiss!1141)) (toIndex!0 key!756 (mask!27531 thiss!1141))))))

(assert (=> d!114975 (validMask!0 (mask!27531 thiss!1141))))

(assert (=> d!114975 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27531 thiss!1141)) key!756 (_keys!10683 thiss!1141) (mask!27531 thiss!1141)) lt!427452)))

(assert (= (and d!114975 c!99027) b!949202))

(assert (= (and d!114975 (not c!99027)) b!949199))

(assert (= (and b!949199 c!99025) b!949197))

(assert (= (and b!949199 (not c!99025)) b!949203))

(assert (= (and d!114975 c!99026) b!949198))

(assert (= (and d!114975 (not c!99026)) b!949201))

(assert (= (and b!949201 res!636626) b!949205))

(assert (= (and b!949205 (not res!636627)) b!949204))

(assert (= (and b!949204 (not res!636625)) b!949200))

(declare-fun m!881847 () Bool)

(assert (=> b!949204 m!881847))

(assert (=> d!114975 m!881791))

(declare-fun m!881849 () Bool)

(assert (=> d!114975 m!881849))

(assert (=> d!114975 m!881687))

(assert (=> b!949205 m!881847))

(assert (=> b!949203 m!881791))

(declare-fun m!881851 () Bool)

(assert (=> b!949203 m!881851))

(assert (=> b!949203 m!881851))

(declare-fun m!881853 () Bool)

(assert (=> b!949203 m!881853))

(assert (=> b!949200 m!881847))

(assert (=> d!114959 d!114975))

(declare-fun d!114977 () Bool)

(declare-fun lt!427459 () (_ BitVec 32))

(declare-fun lt!427458 () (_ BitVec 32))

(assert (=> d!114977 (= lt!427459 (bvmul (bvxor lt!427458 (bvlshr lt!427458 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114977 (= lt!427458 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114977 (and (bvsge (mask!27531 thiss!1141) #b00000000000000000000000000000000) (let ((res!636628 (let ((h!20480 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81670 (bvmul (bvxor h!20480 (bvlshr h!20480 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81670 (bvlshr x!81670 #b00000000000000000000000000001101)) (mask!27531 thiss!1141)))))) (and (bvslt res!636628 (bvadd (mask!27531 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!636628 #b00000000000000000000000000000000))))))

(assert (=> d!114977 (= (toIndex!0 key!756 (mask!27531 thiss!1141)) (bvand (bvxor lt!427459 (bvlshr lt!427459 #b00000000000000000000000000001101)) (mask!27531 thiss!1141)))))

(assert (=> d!114959 d!114977))

(assert (=> d!114959 d!114947))

(declare-fun d!114979 () Bool)

(declare-fun e!534370 () Bool)

(assert (=> d!114979 e!534370))

(declare-fun res!636629 () Bool)

(assert (=> d!114979 (=> res!636629 e!534370)))

(declare-fun lt!427461 () Bool)

(assert (=> d!114979 (= res!636629 (not lt!427461))))

(declare-fun lt!427460 () Bool)

(assert (=> d!114979 (= lt!427461 lt!427460)))

(declare-fun lt!427462 () Unit!31965)

(declare-fun e!534369 () Unit!31965)

(assert (=> d!114979 (= lt!427462 e!534369)))

(declare-fun c!99028 () Bool)

(assert (=> d!114979 (= c!99028 lt!427460)))

(assert (=> d!114979 (= lt!427460 (containsKey!460 (toList!6130 lt!427405) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114979 (= (contains!5216 lt!427405 #b1000000000000000000000000000000000000000000000000000000000000000) lt!427461)))

(declare-fun b!949206 () Bool)

(declare-fun lt!427463 () Unit!31965)

(assert (=> b!949206 (= e!534369 lt!427463)))

(assert (=> b!949206 (= lt!427463 (lemmaContainsKeyImpliesGetValueByKeyDefined!356 (toList!6130 lt!427405) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!949206 (isDefined!365 (getValueByKey!493 (toList!6130 lt!427405) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949207 () Bool)

(declare-fun Unit!31970 () Unit!31965)

(assert (=> b!949207 (= e!534369 Unit!31970)))

(declare-fun b!949208 () Bool)

(assert (=> b!949208 (= e!534370 (isDefined!365 (getValueByKey!493 (toList!6130 lt!427405) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114979 c!99028) b!949206))

(assert (= (and d!114979 (not c!99028)) b!949207))

(assert (= (and d!114979 (not res!636629)) b!949208))

(declare-fun m!881855 () Bool)

(assert (=> d!114979 m!881855))

(declare-fun m!881857 () Bool)

(assert (=> b!949206 m!881857))

(assert (=> b!949206 m!881831))

(assert (=> b!949206 m!881831))

(declare-fun m!881859 () Bool)

(assert (=> b!949206 m!881859))

(assert (=> b!949208 m!881831))

(assert (=> b!949208 m!881831))

(assert (=> b!949208 m!881859))

(assert (=> bm!41270 d!114979))

(declare-fun b!949219 () Bool)

(declare-fun e!534382 () Bool)

(declare-fun call!41277 () Bool)

(assert (=> b!949219 (= e!534382 call!41277)))

(declare-fun b!949220 () Bool)

(assert (=> b!949220 (= e!534382 call!41277)))

(declare-fun b!949221 () Bool)

(declare-fun e!534380 () Bool)

(assert (=> b!949221 (= e!534380 e!534382)))

(declare-fun c!99031 () Bool)

(assert (=> b!949221 (= c!99031 (validKeyInArray!0 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41274 () Bool)

(assert (=> bm!41274 (= call!41277 (arrayNoDuplicates!0 (_keys!10683 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99031 (Cons!19321 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000) Nil!19322) Nil!19322)))))

(declare-fun b!949223 () Bool)

(declare-fun e!534381 () Bool)

(declare-fun contains!5218 (List!19325 (_ BitVec 64)) Bool)

(assert (=> b!949223 (= e!534381 (contains!5218 Nil!19322 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949222 () Bool)

(declare-fun e!534379 () Bool)

(assert (=> b!949222 (= e!534379 e!534380)))

(declare-fun res!636638 () Bool)

(assert (=> b!949222 (=> (not res!636638) (not e!534380))))

(assert (=> b!949222 (= res!636638 (not e!534381))))

(declare-fun res!636637 () Bool)

(assert (=> b!949222 (=> (not res!636637) (not e!534381))))

(assert (=> b!949222 (= res!636637 (validKeyInArray!0 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114981 () Bool)

(declare-fun res!636636 () Bool)

(assert (=> d!114981 (=> res!636636 e!534379)))

(assert (=> d!114981 (= res!636636 (bvsge #b00000000000000000000000000000000 (size!28106 (_keys!10683 thiss!1141))))))

(assert (=> d!114981 (= (arrayNoDuplicates!0 (_keys!10683 thiss!1141) #b00000000000000000000000000000000 Nil!19322) e!534379)))

(assert (= (and d!114981 (not res!636636)) b!949222))

(assert (= (and b!949222 res!636637) b!949223))

(assert (= (and b!949222 res!636638) b!949221))

(assert (= (and b!949221 c!99031) b!949219))

(assert (= (and b!949221 (not c!99031)) b!949220))

(assert (= (or b!949219 b!949220) bm!41274))

(assert (=> b!949221 m!881723))

(assert (=> b!949221 m!881723))

(assert (=> b!949221 m!881735))

(assert (=> bm!41274 m!881723))

(declare-fun m!881861 () Bool)

(assert (=> bm!41274 m!881861))

(assert (=> b!949223 m!881723))

(assert (=> b!949223 m!881723))

(declare-fun m!881863 () Bool)

(assert (=> b!949223 m!881863))

(assert (=> b!949222 m!881723))

(assert (=> b!949222 m!881723))

(assert (=> b!949222 m!881735))

(assert (=> b!949117 d!114981))

(declare-fun d!114983 () Bool)

(assert (=> d!114983 (= (apply!874 lt!427405 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000)) (get!14516 (getValueByKey!493 (toList!6130 lt!427405) (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000))))))

(declare-fun bs!26676 () Bool)

(assert (= bs!26676 d!114983))

(assert (=> bs!26676 m!881723))

(assert (=> bs!26676 m!881807))

(assert (=> bs!26676 m!881807))

(declare-fun m!881865 () Bool)

(assert (=> bs!26676 m!881865))

(assert (=> b!949086 d!114983))

(declare-fun d!114985 () Bool)

(declare-fun c!99034 () Bool)

(assert (=> d!114985 (= c!99034 ((_ is ValueCellFull!9879) (select (arr!27630 (_values!5782 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!534385 () V!32593)

(assert (=> d!114985 (= (get!14515 (select (arr!27630 (_values!5782 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1647 (defaultEntry!5759 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)) e!534385)))

(declare-fun b!949228 () Bool)

(declare-fun get!14517 (ValueCell!9879 V!32593) V!32593)

(assert (=> b!949228 (= e!534385 (get!14517 (select (arr!27630 (_values!5782 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1647 (defaultEntry!5759 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!949229 () Bool)

(declare-fun get!14518 (ValueCell!9879 V!32593) V!32593)

(assert (=> b!949229 (= e!534385 (get!14518 (select (arr!27630 (_values!5782 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1647 (defaultEntry!5759 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114985 c!99034) b!949228))

(assert (= (and d!114985 (not c!99034)) b!949229))

(assert (=> b!949228 m!881727))

(assert (=> b!949228 m!881729))

(declare-fun m!881867 () Bool)

(assert (=> b!949228 m!881867))

(assert (=> b!949229 m!881727))

(assert (=> b!949229 m!881729))

(declare-fun m!881869 () Bool)

(assert (=> b!949229 m!881869))

(assert (=> b!949086 d!114985))

(declare-fun d!114987 () Bool)

(declare-fun e!534387 () Bool)

(assert (=> d!114987 e!534387))

(declare-fun res!636639 () Bool)

(assert (=> d!114987 (=> res!636639 e!534387)))

(declare-fun lt!427465 () Bool)

(assert (=> d!114987 (= res!636639 (not lt!427465))))

(declare-fun lt!427464 () Bool)

(assert (=> d!114987 (= lt!427465 lt!427464)))

(declare-fun lt!427466 () Unit!31965)

(declare-fun e!534386 () Unit!31965)

(assert (=> d!114987 (= lt!427466 e!534386)))

(declare-fun c!99035 () Bool)

(assert (=> d!114987 (= c!99035 lt!427464)))

(assert (=> d!114987 (= lt!427464 (containsKey!460 (toList!6130 lt!427405) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114987 (= (contains!5216 lt!427405 #b0000000000000000000000000000000000000000000000000000000000000000) lt!427465)))

(declare-fun b!949230 () Bool)

(declare-fun lt!427467 () Unit!31965)

(assert (=> b!949230 (= e!534386 lt!427467)))

(assert (=> b!949230 (= lt!427467 (lemmaContainsKeyImpliesGetValueByKeyDefined!356 (toList!6130 lt!427405) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!949230 (isDefined!365 (getValueByKey!493 (toList!6130 lt!427405) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949231 () Bool)

(declare-fun Unit!31971 () Unit!31965)

(assert (=> b!949231 (= e!534386 Unit!31971)))

(declare-fun b!949232 () Bool)

(assert (=> b!949232 (= e!534387 (isDefined!365 (getValueByKey!493 (toList!6130 lt!427405) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114987 c!99035) b!949230))

(assert (= (and d!114987 (not c!99035)) b!949231))

(assert (= (and d!114987 (not res!636639)) b!949232))

(declare-fun m!881871 () Bool)

(assert (=> d!114987 m!881871))

(declare-fun m!881873 () Bool)

(assert (=> b!949230 m!881873))

(declare-fun m!881875 () Bool)

(assert (=> b!949230 m!881875))

(assert (=> b!949230 m!881875))

(declare-fun m!881877 () Bool)

(assert (=> b!949230 m!881877))

(assert (=> b!949232 m!881875))

(assert (=> b!949232 m!881875))

(assert (=> b!949232 m!881877))

(assert (=> bm!41271 d!114987))

(declare-fun d!114989 () Bool)

(assert (=> d!114989 (isDefined!365 (getValueByKey!493 (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141))) key!756))))

(declare-fun lt!427470 () Unit!31965)

(declare-fun choose!1578 (List!19324 (_ BitVec 64)) Unit!31965)

(assert (=> d!114989 (= lt!427470 (choose!1578 (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141))) key!756))))

(declare-fun e!534390 () Bool)

(assert (=> d!114989 e!534390))

(declare-fun res!636642 () Bool)

(assert (=> d!114989 (=> (not res!636642) (not e!534390))))

(declare-fun isStrictlySorted!510 (List!19324) Bool)

(assert (=> d!114989 (= res!636642 (isStrictlySorted!510 (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141)))))))

(assert (=> d!114989 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!356 (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141))) key!756) lt!427470)))

(declare-fun b!949235 () Bool)

(assert (=> b!949235 (= e!534390 (containsKey!460 (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141))) key!756))))

(assert (= (and d!114989 res!636642) b!949235))

(assert (=> d!114989 m!881719))

(assert (=> d!114989 m!881719))

(assert (=> d!114989 m!881721))

(declare-fun m!881879 () Bool)

(assert (=> d!114989 m!881879))

(declare-fun m!881881 () Bool)

(assert (=> d!114989 m!881881))

(assert (=> b!949235 m!881715))

(assert (=> b!949041 d!114989))

(declare-fun d!114991 () Bool)

(declare-fun isEmpty!708 (Option!499) Bool)

(assert (=> d!114991 (= (isDefined!365 (getValueByKey!493 (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141))) key!756)) (not (isEmpty!708 (getValueByKey!493 (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141))) key!756))))))

(declare-fun bs!26677 () Bool)

(assert (= bs!26677 d!114991))

(assert (=> bs!26677 m!881719))

(declare-fun m!881883 () Bool)

(assert (=> bs!26677 m!881883))

(assert (=> b!949041 d!114991))

(declare-fun b!949245 () Bool)

(declare-fun e!534395 () Option!499)

(declare-fun e!534396 () Option!499)

(assert (=> b!949245 (= e!534395 e!534396)))

(declare-fun c!99041 () Bool)

(assert (=> b!949245 (= c!99041 (and ((_ is Cons!19320) (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141)))) (not (= (_1!6777 (h!20478 (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141))))) key!756))))))

(declare-fun b!949246 () Bool)

(assert (=> b!949246 (= e!534396 (getValueByKey!493 (t!27655 (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141)))) key!756))))

(declare-fun d!114993 () Bool)

(declare-fun c!99040 () Bool)

(assert (=> d!114993 (= c!99040 (and ((_ is Cons!19320) (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141)))) (= (_1!6777 (h!20478 (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141))))) key!756)))))

(assert (=> d!114993 (= (getValueByKey!493 (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141))) key!756) e!534395)))

(declare-fun b!949247 () Bool)

(assert (=> b!949247 (= e!534396 None!497)))

(declare-fun b!949244 () Bool)

(assert (=> b!949244 (= e!534395 (Some!498 (_2!6777 (h!20478 (toList!6130 (getCurrentListMap!3363 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141)))))))))

(assert (= (and d!114993 c!99040) b!949244))

(assert (= (and d!114993 (not c!99040)) b!949245))

(assert (= (and b!949245 c!99041) b!949246))

(assert (= (and b!949245 (not c!99041)) b!949247))

(declare-fun m!881885 () Bool)

(assert (=> b!949246 m!881885))

(assert (=> b!949041 d!114993))

(declare-fun b!949258 () Bool)

(declare-fun res!636652 () Bool)

(declare-fun e!534399 () Bool)

(assert (=> b!949258 (=> (not res!636652) (not e!534399))))

(declare-fun size!28109 (LongMapFixedSize!4908) (_ BitVec 32))

(assert (=> b!949258 (= res!636652 (= (size!28109 thiss!1141) (bvadd (_size!2509 thiss!1141) (bvsdiv (bvadd (extraKeys!5491 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!949256 () Bool)

(declare-fun res!636651 () Bool)

(assert (=> b!949256 (=> (not res!636651) (not e!534399))))

(assert (=> b!949256 (= res!636651 (and (= (size!28105 (_values!5782 thiss!1141)) (bvadd (mask!27531 thiss!1141) #b00000000000000000000000000000001)) (= (size!28106 (_keys!10683 thiss!1141)) (size!28105 (_values!5782 thiss!1141))) (bvsge (_size!2509 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2509 thiss!1141) (bvadd (mask!27531 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!949257 () Bool)

(declare-fun res!636654 () Bool)

(assert (=> b!949257 (=> (not res!636654) (not e!534399))))

(assert (=> b!949257 (= res!636654 (bvsge (size!28109 thiss!1141) (_size!2509 thiss!1141)))))

(declare-fun d!114995 () Bool)

(declare-fun res!636653 () Bool)

(assert (=> d!114995 (=> (not res!636653) (not e!534399))))

(assert (=> d!114995 (= res!636653 (validMask!0 (mask!27531 thiss!1141)))))

(assert (=> d!114995 (= (simpleValid!370 thiss!1141) e!534399)))

(declare-fun b!949259 () Bool)

(assert (=> b!949259 (= e!534399 (and (bvsge (extraKeys!5491 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5491 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2509 thiss!1141) #b00000000000000000000000000000000)))))

(assert (= (and d!114995 res!636653) b!949256))

(assert (= (and b!949256 res!636651) b!949257))

(assert (= (and b!949257 res!636654) b!949258))

(assert (= (and b!949258 res!636652) b!949259))

(declare-fun m!881887 () Bool)

(assert (=> b!949258 m!881887))

(assert (=> b!949257 m!881887))

(assert (=> d!114995 m!881687))

(assert (=> d!114957 d!114995))

(declare-fun b!949284 () Bool)

(declare-fun e!534415 () Bool)

(assert (=> b!949284 (= e!534415 (validKeyInArray!0 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!949284 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!949285 () Bool)

(declare-fun e!534419 () Bool)

(declare-fun lt!427486 () ListLongMap!12229)

(assert (=> b!949285 (= e!534419 (= lt!427486 (getCurrentListMapNoExtraKeys!3313 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5759 thiss!1141))))))

(declare-fun b!949286 () Bool)

(declare-fun e!534414 () ListLongMap!12229)

(assert (=> b!949286 (= e!534414 (ListLongMap!12230 Nil!19321))))

(declare-fun b!949287 () Bool)

(declare-fun e!534417 () ListLongMap!12229)

(declare-fun call!41280 () ListLongMap!12229)

(assert (=> b!949287 (= e!534417 call!41280)))

(declare-fun b!949288 () Bool)

(declare-fun e!534416 () Bool)

(assert (=> b!949288 (= e!534416 e!534419)))

(declare-fun c!99050 () Bool)

(assert (=> b!949288 (= c!99050 (bvslt #b00000000000000000000000000000000 (size!28106 (_keys!10683 thiss!1141))))))

(declare-fun d!114997 () Bool)

(declare-fun e!534418 () Bool)

(assert (=> d!114997 e!534418))

(declare-fun res!636663 () Bool)

(assert (=> d!114997 (=> (not res!636663) (not e!534418))))

(assert (=> d!114997 (= res!636663 (not (contains!5216 lt!427486 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!114997 (= lt!427486 e!534414)))

(declare-fun c!99051 () Bool)

(assert (=> d!114997 (= c!99051 (bvsge #b00000000000000000000000000000000 (size!28106 (_keys!10683 thiss!1141))))))

(assert (=> d!114997 (validMask!0 (mask!27531 thiss!1141))))

(assert (=> d!114997 (= (getCurrentListMapNoExtraKeys!3313 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5759 thiss!1141)) lt!427486)))

(declare-fun b!949289 () Bool)

(assert (=> b!949289 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28106 (_keys!10683 thiss!1141))))))

(assert (=> b!949289 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28105 (_values!5782 thiss!1141))))))

(declare-fun e!534420 () Bool)

(assert (=> b!949289 (= e!534420 (= (apply!874 lt!427486 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000)) (get!14515 (select (arr!27630 (_values!5782 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1647 (defaultEntry!5759 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!949290 () Bool)

(declare-fun lt!427489 () Unit!31965)

(declare-fun lt!427487 () Unit!31965)

(assert (=> b!949290 (= lt!427489 lt!427487)))

(declare-fun lt!427491 () V!32593)

(declare-fun lt!427490 () (_ BitVec 64))

(declare-fun lt!427488 () ListLongMap!12229)

(declare-fun lt!427485 () (_ BitVec 64))

(assert (=> b!949290 (not (contains!5216 (+!2858 lt!427488 (tuple2!13533 lt!427490 lt!427491)) lt!427485))))

(declare-fun addStillNotContains!225 (ListLongMap!12229 (_ BitVec 64) V!32593 (_ BitVec 64)) Unit!31965)

(assert (=> b!949290 (= lt!427487 (addStillNotContains!225 lt!427488 lt!427490 lt!427491 lt!427485))))

(assert (=> b!949290 (= lt!427485 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!949290 (= lt!427491 (get!14515 (select (arr!27630 (_values!5782 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1647 (defaultEntry!5759 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!949290 (= lt!427490 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949290 (= lt!427488 call!41280)))

(assert (=> b!949290 (= e!534417 (+!2858 call!41280 (tuple2!13533 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000) (get!14515 (select (arr!27630 (_values!5782 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1647 (defaultEntry!5759 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!949291 () Bool)

(declare-fun isEmpty!709 (ListLongMap!12229) Bool)

(assert (=> b!949291 (= e!534419 (isEmpty!709 lt!427486))))

(declare-fun b!949292 () Bool)

(assert (=> b!949292 (= e!534414 e!534417)))

(declare-fun c!99052 () Bool)

(assert (=> b!949292 (= c!99052 (validKeyInArray!0 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949293 () Bool)

(assert (=> b!949293 (= e!534418 e!534416)))

(declare-fun c!99053 () Bool)

(assert (=> b!949293 (= c!99053 e!534415)))

(declare-fun res!636666 () Bool)

(assert (=> b!949293 (=> (not res!636666) (not e!534415))))

(assert (=> b!949293 (= res!636666 (bvslt #b00000000000000000000000000000000 (size!28106 (_keys!10683 thiss!1141))))))

(declare-fun b!949294 () Bool)

(assert (=> b!949294 (= e!534416 e!534420)))

(assert (=> b!949294 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28106 (_keys!10683 thiss!1141))))))

(declare-fun res!636664 () Bool)

(assert (=> b!949294 (= res!636664 (contains!5216 lt!427486 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!949294 (=> (not res!636664) (not e!534420))))

(declare-fun b!949295 () Bool)

(declare-fun res!636665 () Bool)

(assert (=> b!949295 (=> (not res!636665) (not e!534418))))

(assert (=> b!949295 (= res!636665 (not (contains!5216 lt!427486 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!41277 () Bool)

(assert (=> bm!41277 (= call!41280 (getCurrentListMapNoExtraKeys!3313 (_keys!10683 thiss!1141) (_values!5782 thiss!1141) (mask!27531 thiss!1141) (extraKeys!5491 thiss!1141) (zeroValue!5595 thiss!1141) (minValue!5595 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5759 thiss!1141)))))

(assert (= (and d!114997 c!99051) b!949286))

(assert (= (and d!114997 (not c!99051)) b!949292))

(assert (= (and b!949292 c!99052) b!949290))

(assert (= (and b!949292 (not c!99052)) b!949287))

(assert (= (or b!949290 b!949287) bm!41277))

(assert (= (and d!114997 res!636663) b!949295))

(assert (= (and b!949295 res!636665) b!949293))

(assert (= (and b!949293 res!636666) b!949284))

(assert (= (and b!949293 c!99053) b!949294))

(assert (= (and b!949293 (not c!99053)) b!949288))

(assert (= (and b!949294 res!636664) b!949289))

(assert (= (and b!949288 c!99050) b!949285))

(assert (= (and b!949288 (not c!99050)) b!949291))

(declare-fun b_lambda!14339 () Bool)

(assert (=> (not b_lambda!14339) (not b!949289)))

(assert (=> b!949289 t!27657))

(declare-fun b_and!29659 () Bool)

(assert (= b_and!29657 (and (=> t!27657 result!12271) b_and!29659)))

(declare-fun b_lambda!14341 () Bool)

(assert (=> (not b_lambda!14341) (not b!949290)))

(assert (=> b!949290 t!27657))

(declare-fun b_and!29661 () Bool)

(assert (= b_and!29659 (and (=> t!27657 result!12271) b_and!29661)))

(assert (=> b!949294 m!881723))

(assert (=> b!949294 m!881723))

(declare-fun m!881889 () Bool)

(assert (=> b!949294 m!881889))

(assert (=> b!949284 m!881723))

(assert (=> b!949284 m!881723))

(assert (=> b!949284 m!881735))

(assert (=> b!949289 m!881727))

(assert (=> b!949289 m!881729))

(assert (=> b!949289 m!881731))

(assert (=> b!949289 m!881723))

(declare-fun m!881891 () Bool)

(assert (=> b!949289 m!881891))

(assert (=> b!949289 m!881729))

(assert (=> b!949289 m!881723))

(assert (=> b!949289 m!881727))

(declare-fun m!881893 () Bool)

(assert (=> b!949285 m!881893))

(declare-fun m!881895 () Bool)

(assert (=> d!114997 m!881895))

(assert (=> d!114997 m!881687))

(assert (=> b!949292 m!881723))

(assert (=> b!949292 m!881723))

(assert (=> b!949292 m!881735))

(declare-fun m!881897 () Bool)

(assert (=> b!949290 m!881897))

(assert (=> b!949290 m!881727))

(assert (=> b!949290 m!881729))

(assert (=> b!949290 m!881731))

(declare-fun m!881899 () Bool)

(assert (=> b!949290 m!881899))

(assert (=> b!949290 m!881723))

(assert (=> b!949290 m!881727))

(declare-fun m!881901 () Bool)

(assert (=> b!949290 m!881901))

(assert (=> b!949290 m!881897))

(declare-fun m!881903 () Bool)

(assert (=> b!949290 m!881903))

(assert (=> b!949290 m!881729))

(declare-fun m!881905 () Bool)

(assert (=> b!949295 m!881905))

(declare-fun m!881907 () Bool)

(assert (=> b!949291 m!881907))

(assert (=> bm!41277 m!881893))

(assert (=> bm!41269 d!114997))

(assert (=> b!949043 d!114991))

(assert (=> b!949043 d!114993))

(declare-fun b!949304 () Bool)

(declare-fun e!534425 () (_ BitVec 32))

(assert (=> b!949304 (= e!534425 #b00000000000000000000000000000000)))

(declare-fun b!949305 () Bool)

(declare-fun e!534426 () (_ BitVec 32))

(declare-fun call!41283 () (_ BitVec 32))

(assert (=> b!949305 (= e!534426 call!41283)))

(declare-fun b!949306 () Bool)

(assert (=> b!949306 (= e!534426 (bvadd #b00000000000000000000000000000001 call!41283))))

(declare-fun d!114999 () Bool)

(declare-fun lt!427494 () (_ BitVec 32))

(assert (=> d!114999 (and (bvsge lt!427494 #b00000000000000000000000000000000) (bvsle lt!427494 (bvsub (size!28106 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114999 (= lt!427494 e!534425)))

(declare-fun c!99058 () Bool)

(assert (=> d!114999 (= c!99058 (bvsge #b00000000000000000000000000000000 (size!28106 (_keys!10683 thiss!1141))))))

(assert (=> d!114999 (and (bvsle #b00000000000000000000000000000000 (size!28106 (_keys!10683 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28106 (_keys!10683 thiss!1141)) (size!28106 (_keys!10683 thiss!1141))))))

(assert (=> d!114999 (= (arrayCountValidKeys!0 (_keys!10683 thiss!1141) #b00000000000000000000000000000000 (size!28106 (_keys!10683 thiss!1141))) lt!427494)))

(declare-fun bm!41280 () Bool)

(assert (=> bm!41280 (= call!41283 (arrayCountValidKeys!0 (_keys!10683 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28106 (_keys!10683 thiss!1141))))))

(declare-fun b!949307 () Bool)

(assert (=> b!949307 (= e!534425 e!534426)))

(declare-fun c!99059 () Bool)

(assert (=> b!949307 (= c!99059 (validKeyInArray!0 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114999 c!99058) b!949304))

(assert (= (and d!114999 (not c!99058)) b!949307))

(assert (= (and b!949307 c!99059) b!949306))

(assert (= (and b!949307 (not c!99059)) b!949305))

(assert (= (or b!949306 b!949305) bm!41280))

(declare-fun m!881909 () Bool)

(assert (=> bm!41280 m!881909))

(assert (=> b!949307 m!881723))

(assert (=> b!949307 m!881723))

(assert (=> b!949307 m!881735))

(assert (=> b!949115 d!114999))

(declare-fun d!115001 () Bool)

(assert (=> d!115001 (= (apply!874 lt!427405 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14516 (getValueByKey!493 (toList!6130 lt!427405) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26678 () Bool)

(assert (= bs!26678 d!115001))

(assert (=> bs!26678 m!881875))

(assert (=> bs!26678 m!881875))

(declare-fun m!881911 () Bool)

(assert (=> bs!26678 m!881911))

(assert (=> b!949092 d!115001))

(declare-fun b!949316 () Bool)

(declare-fun e!534435 () Bool)

(declare-fun e!534434 () Bool)

(assert (=> b!949316 (= e!534435 e!534434)))

(declare-fun c!99062 () Bool)

(assert (=> b!949316 (= c!99062 (validKeyInArray!0 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949317 () Bool)

(declare-fun call!41286 () Bool)

(assert (=> b!949317 (= e!534434 call!41286)))

(declare-fun b!949318 () Bool)

(declare-fun e!534433 () Bool)

(assert (=> b!949318 (= e!534434 e!534433)))

(declare-fun lt!427503 () (_ BitVec 64))

(assert (=> b!949318 (= lt!427503 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427501 () Unit!31965)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57454 (_ BitVec 64) (_ BitVec 32)) Unit!31965)

(assert (=> b!949318 (= lt!427501 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10683 thiss!1141) lt!427503 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57454 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!949318 (arrayContainsKey!0 (_keys!10683 thiss!1141) lt!427503 #b00000000000000000000000000000000)))

(declare-fun lt!427502 () Unit!31965)

(assert (=> b!949318 (= lt!427502 lt!427501)))

(declare-fun res!636672 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57454 (_ BitVec 32)) SeekEntryResult!9131)

(assert (=> b!949318 (= res!636672 (= (seekEntryOrOpen!0 (select (arr!27631 (_keys!10683 thiss!1141)) #b00000000000000000000000000000000) (_keys!10683 thiss!1141) (mask!27531 thiss!1141)) (Found!9131 #b00000000000000000000000000000000)))))

(assert (=> b!949318 (=> (not res!636672) (not e!534433))))

(declare-fun bm!41283 () Bool)

(assert (=> bm!41283 (= call!41286 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10683 thiss!1141) (mask!27531 thiss!1141)))))

(declare-fun b!949319 () Bool)

(assert (=> b!949319 (= e!534433 call!41286)))

(declare-fun d!115003 () Bool)

(declare-fun res!636671 () Bool)

(assert (=> d!115003 (=> res!636671 e!534435)))

(assert (=> d!115003 (= res!636671 (bvsge #b00000000000000000000000000000000 (size!28106 (_keys!10683 thiss!1141))))))

(assert (=> d!115003 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10683 thiss!1141) (mask!27531 thiss!1141)) e!534435)))

(assert (= (and d!115003 (not res!636671)) b!949316))

(assert (= (and b!949316 c!99062) b!949318))

(assert (= (and b!949316 (not c!99062)) b!949317))

(assert (= (and b!949318 res!636672) b!949319))

(assert (= (or b!949319 b!949317) bm!41283))

(assert (=> b!949316 m!881723))

(assert (=> b!949316 m!881723))

(assert (=> b!949316 m!881735))

(assert (=> b!949318 m!881723))

(declare-fun m!881913 () Bool)

(assert (=> b!949318 m!881913))

(declare-fun m!881915 () Bool)

(assert (=> b!949318 m!881915))

(assert (=> b!949318 m!881723))

(declare-fun m!881917 () Bool)

(assert (=> b!949318 m!881917))

(declare-fun m!881919 () Bool)

(assert (=> bm!41283 m!881919))

(assert (=> b!949116 d!115003))

(declare-fun d!115005 () Bool)

(declare-fun e!534436 () Bool)

(assert (=> d!115005 e!534436))

(declare-fun res!636674 () Bool)

(assert (=> d!115005 (=> (not res!636674) (not e!534436))))

(declare-fun lt!427504 () ListLongMap!12229)

(assert (=> d!115005 (= res!636674 (contains!5216 lt!427504 (_1!6777 (tuple2!13533 lt!427400 (minValue!5595 thiss!1141)))))))

(declare-fun lt!427507 () List!19324)

(assert (=> d!115005 (= lt!427504 (ListLongMap!12230 lt!427507))))

(declare-fun lt!427506 () Unit!31965)

(declare-fun lt!427505 () Unit!31965)

(assert (=> d!115005 (= lt!427506 lt!427505)))

(assert (=> d!115005 (= (getValueByKey!493 lt!427507 (_1!6777 (tuple2!13533 lt!427400 (minValue!5595 thiss!1141)))) (Some!498 (_2!6777 (tuple2!13533 lt!427400 (minValue!5595 thiss!1141)))))))

(assert (=> d!115005 (= lt!427505 (lemmaContainsTupThenGetReturnValue!264 lt!427507 (_1!6777 (tuple2!13533 lt!427400 (minValue!5595 thiss!1141))) (_2!6777 (tuple2!13533 lt!427400 (minValue!5595 thiss!1141)))))))

(assert (=> d!115005 (= lt!427507 (insertStrictlySorted!321 (toList!6130 lt!427399) (_1!6777 (tuple2!13533 lt!427400 (minValue!5595 thiss!1141))) (_2!6777 (tuple2!13533 lt!427400 (minValue!5595 thiss!1141)))))))

(assert (=> d!115005 (= (+!2858 lt!427399 (tuple2!13533 lt!427400 (minValue!5595 thiss!1141))) lt!427504)))

(declare-fun b!949320 () Bool)

(declare-fun res!636673 () Bool)

(assert (=> b!949320 (=> (not res!636673) (not e!534436))))

(assert (=> b!949320 (= res!636673 (= (getValueByKey!493 (toList!6130 lt!427504) (_1!6777 (tuple2!13533 lt!427400 (minValue!5595 thiss!1141)))) (Some!498 (_2!6777 (tuple2!13533 lt!427400 (minValue!5595 thiss!1141))))))))

(declare-fun b!949321 () Bool)

(assert (=> b!949321 (= e!534436 (contains!5217 (toList!6130 lt!427504) (tuple2!13533 lt!427400 (minValue!5595 thiss!1141))))))

(assert (= (and d!115005 res!636674) b!949320))

(assert (= (and b!949320 res!636673) b!949321))

(declare-fun m!881921 () Bool)

(assert (=> d!115005 m!881921))

(declare-fun m!881923 () Bool)

(assert (=> d!115005 m!881923))

(declare-fun m!881925 () Bool)

(assert (=> d!115005 m!881925))

(declare-fun m!881927 () Bool)

(assert (=> d!115005 m!881927))

(declare-fun m!881929 () Bool)

(assert (=> b!949320 m!881929))

(declare-fun m!881931 () Bool)

(assert (=> b!949321 m!881931))

(assert (=> b!949093 d!115005))

(declare-fun d!115007 () Bool)

(assert (=> d!115007 (= (apply!874 (+!2858 lt!427399 (tuple2!13533 lt!427400 (minValue!5595 thiss!1141))) lt!427394) (apply!874 lt!427399 lt!427394))))

(declare-fun lt!427510 () Unit!31965)

(declare-fun choose!1579 (ListLongMap!12229 (_ BitVec 64) V!32593 (_ BitVec 64)) Unit!31965)

(assert (=> d!115007 (= lt!427510 (choose!1579 lt!427399 lt!427400 (minValue!5595 thiss!1141) lt!427394))))

(declare-fun e!534439 () Bool)

(assert (=> d!115007 e!534439))

(declare-fun res!636677 () Bool)

(assert (=> d!115007 (=> (not res!636677) (not e!534439))))

(assert (=> d!115007 (= res!636677 (contains!5216 lt!427399 lt!427394))))

(assert (=> d!115007 (= (addApplyDifferent!457 lt!427399 lt!427400 (minValue!5595 thiss!1141) lt!427394) lt!427510)))

(declare-fun b!949325 () Bool)

(assert (=> b!949325 (= e!534439 (not (= lt!427394 lt!427400)))))

(assert (= (and d!115007 res!636677) b!949325))

(declare-fun m!881933 () Bool)

(assert (=> d!115007 m!881933))

(assert (=> d!115007 m!881759))

(assert (=> d!115007 m!881761))

(assert (=> d!115007 m!881759))

(assert (=> d!115007 m!881765))

(declare-fun m!881935 () Bool)

(assert (=> d!115007 m!881935))

(assert (=> b!949093 d!115007))

(declare-fun d!115009 () Bool)

(assert (=> d!115009 (= (apply!874 lt!427401 lt!427389) (get!14516 (getValueByKey!493 (toList!6130 lt!427401) lt!427389)))))

(declare-fun bs!26679 () Bool)

(assert (= bs!26679 d!115009))

(declare-fun m!881937 () Bool)

(assert (=> bs!26679 m!881937))

(assert (=> bs!26679 m!881937))

(declare-fun m!881939 () Bool)

(assert (=> bs!26679 m!881939))

(assert (=> b!949093 d!115009))

(declare-fun d!115011 () Bool)

(assert (=> d!115011 (= (apply!874 (+!2858 lt!427409 (tuple2!13533 lt!427407 (zeroValue!5595 thiss!1141))) lt!427398) (apply!874 lt!427409 lt!427398))))

(declare-fun lt!427511 () Unit!31965)

(assert (=> d!115011 (= lt!427511 (choose!1579 lt!427409 lt!427407 (zeroValue!5595 thiss!1141) lt!427398))))

(declare-fun e!534440 () Bool)

(assert (=> d!115011 e!534440))

(declare-fun res!636678 () Bool)

(assert (=> d!115011 (=> (not res!636678) (not e!534440))))

(assert (=> d!115011 (= res!636678 (contains!5216 lt!427409 lt!427398))))

(assert (=> d!115011 (= (addApplyDifferent!457 lt!427409 lt!427407 (zeroValue!5595 thiss!1141) lt!427398) lt!427511)))

(declare-fun b!949326 () Bool)

(assert (=> b!949326 (= e!534440 (not (= lt!427398 lt!427407)))))

(assert (= (and d!115011 res!636678) b!949326))

(declare-fun m!881941 () Bool)

(assert (=> d!115011 m!881941))

(assert (=> d!115011 m!881753))

(assert (=> d!115011 m!881755))

(assert (=> d!115011 m!881753))

(assert (=> d!115011 m!881767))

(declare-fun m!881943 () Bool)

(assert (=> d!115011 m!881943))

(assert (=> b!949093 d!115011))

(declare-fun d!115013 () Bool)

(declare-fun e!534441 () Bool)

(assert (=> d!115013 e!534441))

(declare-fun res!636680 () Bool)

(assert (=> d!115013 (=> (not res!636680) (not e!534441))))

(declare-fun lt!427512 () ListLongMap!12229)

(assert (=> d!115013 (= res!636680 (contains!5216 lt!427512 (_1!6777 (tuple2!13533 lt!427402 (zeroValue!5595 thiss!1141)))))))

(declare-fun lt!427515 () List!19324)

(assert (=> d!115013 (= lt!427512 (ListLongMap!12230 lt!427515))))

(declare-fun lt!427514 () Unit!31965)

(declare-fun lt!427513 () Unit!31965)

(assert (=> d!115013 (= lt!427514 lt!427513)))

(assert (=> d!115013 (= (getValueByKey!493 lt!427515 (_1!6777 (tuple2!13533 lt!427402 (zeroValue!5595 thiss!1141)))) (Some!498 (_2!6777 (tuple2!13533 lt!427402 (zeroValue!5595 thiss!1141)))))))

(assert (=> d!115013 (= lt!427513 (lemmaContainsTupThenGetReturnValue!264 lt!427515 (_1!6777 (tuple2!13533 lt!427402 (zeroValue!5595 thiss!1141))) (_2!6777 (tuple2!13533 lt!427402 (zeroValue!5595 thiss!1141)))))))

(assert (=> d!115013 (= lt!427515 (insertStrictlySorted!321 (toList!6130 lt!427396) (_1!6777 (tuple2!13533 lt!427402 (zeroValue!5595 thiss!1141))) (_2!6777 (tuple2!13533 lt!427402 (zeroValue!5595 thiss!1141)))))))

(assert (=> d!115013 (= (+!2858 lt!427396 (tuple2!13533 lt!427402 (zeroValue!5595 thiss!1141))) lt!427512)))

(declare-fun b!949327 () Bool)

(declare-fun res!636679 () Bool)

(assert (=> b!949327 (=> (not res!636679) (not e!534441))))

(assert (=> b!949327 (= res!636679 (= (getValueByKey!493 (toList!6130 lt!427512) (_1!6777 (tuple2!13533 lt!427402 (zeroValue!5595 thiss!1141)))) (Some!498 (_2!6777 (tuple2!13533 lt!427402 (zeroValue!5595 thiss!1141))))))))

(declare-fun b!949328 () Bool)

(assert (=> b!949328 (= e!534441 (contains!5217 (toList!6130 lt!427512) (tuple2!13533 lt!427402 (zeroValue!5595 thiss!1141))))))

(assert (= (and d!115013 res!636680) b!949327))

(assert (= (and b!949327 res!636679) b!949328))

(declare-fun m!881945 () Bool)

(assert (=> d!115013 m!881945))

(declare-fun m!881947 () Bool)

(assert (=> d!115013 m!881947))

(declare-fun m!881949 () Bool)

(assert (=> d!115013 m!881949))

(declare-fun m!881951 () Bool)

(assert (=> d!115013 m!881951))

(declare-fun m!881953 () Bool)

(assert (=> b!949327 m!881953))

(declare-fun m!881955 () Bool)

(assert (=> b!949328 m!881955))

(assert (=> b!949093 d!115013))

(declare-fun d!115015 () Bool)

(assert (=> d!115015 (= (apply!874 (+!2858 lt!427399 (tuple2!13533 lt!427400 (minValue!5595 thiss!1141))) lt!427394) (get!14516 (getValueByKey!493 (toList!6130 (+!2858 lt!427399 (tuple2!13533 lt!427400 (minValue!5595 thiss!1141)))) lt!427394)))))

(declare-fun bs!26680 () Bool)

(assert (= bs!26680 d!115015))

(declare-fun m!881957 () Bool)

(assert (=> bs!26680 m!881957))

(assert (=> bs!26680 m!881957))

(declare-fun m!881959 () Bool)

(assert (=> bs!26680 m!881959))

(assert (=> b!949093 d!115015))

(declare-fun d!115017 () Bool)

(assert (=> d!115017 (= (apply!874 (+!2858 lt!427409 (tuple2!13533 lt!427407 (zeroValue!5595 thiss!1141))) lt!427398) (get!14516 (getValueByKey!493 (toList!6130 (+!2858 lt!427409 (tuple2!13533 lt!427407 (zeroValue!5595 thiss!1141)))) lt!427398)))))

(declare-fun bs!26681 () Bool)

(assert (= bs!26681 d!115017))

(declare-fun m!881961 () Bool)

(assert (=> bs!26681 m!881961))

(assert (=> bs!26681 m!881961))

(declare-fun m!881963 () Bool)

(assert (=> bs!26681 m!881963))

(assert (=> b!949093 d!115017))

(declare-fun d!115019 () Bool)

(declare-fun e!534442 () Bool)

(assert (=> d!115019 e!534442))

(declare-fun res!636682 () Bool)

(assert (=> d!115019 (=> (not res!636682) (not e!534442))))

(declare-fun lt!427516 () ListLongMap!12229)

(assert (=> d!115019 (= res!636682 (contains!5216 lt!427516 (_1!6777 (tuple2!13533 lt!427407 (zeroValue!5595 thiss!1141)))))))

(declare-fun lt!427519 () List!19324)

(assert (=> d!115019 (= lt!427516 (ListLongMap!12230 lt!427519))))

(declare-fun lt!427518 () Unit!31965)

(declare-fun lt!427517 () Unit!31965)

(assert (=> d!115019 (= lt!427518 lt!427517)))

(assert (=> d!115019 (= (getValueByKey!493 lt!427519 (_1!6777 (tuple2!13533 lt!427407 (zeroValue!5595 thiss!1141)))) (Some!498 (_2!6777 (tuple2!13533 lt!427407 (zeroValue!5595 thiss!1141)))))))

(assert (=> d!115019 (= lt!427517 (lemmaContainsTupThenGetReturnValue!264 lt!427519 (_1!6777 (tuple2!13533 lt!427407 (zeroValue!5595 thiss!1141))) (_2!6777 (tuple2!13533 lt!427407 (zeroValue!5595 thiss!1141)))))))

(assert (=> d!115019 (= lt!427519 (insertStrictlySorted!321 (toList!6130 lt!427409) (_1!6777 (tuple2!13533 lt!427407 (zeroValue!5595 thiss!1141))) (_2!6777 (tuple2!13533 lt!427407 (zeroValue!5595 thiss!1141)))))))

(assert (=> d!115019 (= (+!2858 lt!427409 (tuple2!13533 lt!427407 (zeroValue!5595 thiss!1141))) lt!427516)))

(declare-fun b!949329 () Bool)

(declare-fun res!636681 () Bool)

(assert (=> b!949329 (=> (not res!636681) (not e!534442))))

(assert (=> b!949329 (= res!636681 (= (getValueByKey!493 (toList!6130 lt!427516) (_1!6777 (tuple2!13533 lt!427407 (zeroValue!5595 thiss!1141)))) (Some!498 (_2!6777 (tuple2!13533 lt!427407 (zeroValue!5595 thiss!1141))))))))

(declare-fun b!949330 () Bool)

(assert (=> b!949330 (= e!534442 (contains!5217 (toList!6130 lt!427516) (tuple2!13533 lt!427407 (zeroValue!5595 thiss!1141))))))

(assert (= (and d!115019 res!636682) b!949329))

(assert (= (and b!949329 res!636681) b!949330))

(declare-fun m!881965 () Bool)

(assert (=> d!115019 m!881965))

(declare-fun m!881967 () Bool)

(assert (=> d!115019 m!881967))

(declare-fun m!881969 () Bool)

(assert (=> d!115019 m!881969))

(declare-fun m!881971 () Bool)

(assert (=> d!115019 m!881971))

(declare-fun m!881973 () Bool)

(assert (=> b!949329 m!881973))

(declare-fun m!881975 () Bool)

(assert (=> b!949330 m!881975))

(assert (=> b!949093 d!115019))

(declare-fun d!115021 () Bool)

(assert (=> d!115021 (= (apply!874 lt!427399 lt!427394) (get!14516 (getValueByKey!493 (toList!6130 lt!427399) lt!427394)))))

(declare-fun bs!26682 () Bool)

(assert (= bs!26682 d!115021))

(declare-fun m!881977 () Bool)

(assert (=> bs!26682 m!881977))

(assert (=> bs!26682 m!881977))

(declare-fun m!881979 () Bool)

(assert (=> bs!26682 m!881979))

(assert (=> b!949093 d!115021))

(declare-fun d!115023 () Bool)

(assert (=> d!115023 (= (apply!874 lt!427409 lt!427398) (get!14516 (getValueByKey!493 (toList!6130 lt!427409) lt!427398)))))

(declare-fun bs!26683 () Bool)

(assert (= bs!26683 d!115023))

(declare-fun m!881981 () Bool)

(assert (=> bs!26683 m!881981))

(assert (=> bs!26683 m!881981))

(declare-fun m!881983 () Bool)

(assert (=> bs!26683 m!881983))

(assert (=> b!949093 d!115023))

(declare-fun d!115025 () Bool)

(assert (=> d!115025 (= (apply!874 (+!2858 lt!427401 (tuple2!13533 lt!427388 (minValue!5595 thiss!1141))) lt!427389) (apply!874 lt!427401 lt!427389))))

(declare-fun lt!427520 () Unit!31965)

(assert (=> d!115025 (= lt!427520 (choose!1579 lt!427401 lt!427388 (minValue!5595 thiss!1141) lt!427389))))

(declare-fun e!534443 () Bool)

(assert (=> d!115025 e!534443))

(declare-fun res!636683 () Bool)

(assert (=> d!115025 (=> (not res!636683) (not e!534443))))

(assert (=> d!115025 (= res!636683 (contains!5216 lt!427401 lt!427389))))

(assert (=> d!115025 (= (addApplyDifferent!457 lt!427401 lt!427388 (minValue!5595 thiss!1141) lt!427389) lt!427520)))

(declare-fun b!949331 () Bool)

(assert (=> b!949331 (= e!534443 (not (= lt!427389 lt!427388)))))

(assert (= (and d!115025 res!636683) b!949331))

(declare-fun m!881985 () Bool)

(assert (=> d!115025 m!881985))

(assert (=> d!115025 m!881739))

(assert (=> d!115025 m!881745))

(assert (=> d!115025 m!881739))

(assert (=> d!115025 m!881741))

(declare-fun m!881987 () Bool)

(assert (=> d!115025 m!881987))

(assert (=> b!949093 d!115025))

(declare-fun d!115027 () Bool)

(declare-fun e!534445 () Bool)

(assert (=> d!115027 e!534445))

(declare-fun res!636684 () Bool)

(assert (=> d!115027 (=> res!636684 e!534445)))

(declare-fun lt!427522 () Bool)

(assert (=> d!115027 (= res!636684 (not lt!427522))))

(declare-fun lt!427521 () Bool)

(assert (=> d!115027 (= lt!427522 lt!427521)))

(declare-fun lt!427523 () Unit!31965)

(declare-fun e!534444 () Unit!31965)

(assert (=> d!115027 (= lt!427523 e!534444)))

(declare-fun c!99063 () Bool)

(assert (=> d!115027 (= c!99063 lt!427521)))

(assert (=> d!115027 (= lt!427521 (containsKey!460 (toList!6130 (+!2858 lt!427396 (tuple2!13533 lt!427402 (zeroValue!5595 thiss!1141)))) lt!427390))))

(assert (=> d!115027 (= (contains!5216 (+!2858 lt!427396 (tuple2!13533 lt!427402 (zeroValue!5595 thiss!1141))) lt!427390) lt!427522)))

(declare-fun b!949332 () Bool)

(declare-fun lt!427524 () Unit!31965)

(assert (=> b!949332 (= e!534444 lt!427524)))

(assert (=> b!949332 (= lt!427524 (lemmaContainsKeyImpliesGetValueByKeyDefined!356 (toList!6130 (+!2858 lt!427396 (tuple2!13533 lt!427402 (zeroValue!5595 thiss!1141)))) lt!427390))))

(assert (=> b!949332 (isDefined!365 (getValueByKey!493 (toList!6130 (+!2858 lt!427396 (tuple2!13533 lt!427402 (zeroValue!5595 thiss!1141)))) lt!427390))))

(declare-fun b!949333 () Bool)

(declare-fun Unit!31972 () Unit!31965)

(assert (=> b!949333 (= e!534444 Unit!31972)))

(declare-fun b!949334 () Bool)

(assert (=> b!949334 (= e!534445 (isDefined!365 (getValueByKey!493 (toList!6130 (+!2858 lt!427396 (tuple2!13533 lt!427402 (zeroValue!5595 thiss!1141)))) lt!427390)))))

(assert (= (and d!115027 c!99063) b!949332))

(assert (= (and d!115027 (not c!99063)) b!949333))

(assert (= (and d!115027 (not res!636684)) b!949334))

(declare-fun m!881989 () Bool)

(assert (=> d!115027 m!881989))

(declare-fun m!881991 () Bool)

(assert (=> b!949332 m!881991))

(declare-fun m!881993 () Bool)

(assert (=> b!949332 m!881993))

(assert (=> b!949332 m!881993))

(declare-fun m!881995 () Bool)

(assert (=> b!949332 m!881995))

(assert (=> b!949334 m!881993))

(assert (=> b!949334 m!881993))

(assert (=> b!949334 m!881995))

(assert (=> b!949093 d!115027))

(declare-fun d!115029 () Bool)

(declare-fun e!534446 () Bool)

(assert (=> d!115029 e!534446))

(declare-fun res!636686 () Bool)

(assert (=> d!115029 (=> (not res!636686) (not e!534446))))

(declare-fun lt!427525 () ListLongMap!12229)

(assert (=> d!115029 (= res!636686 (contains!5216 lt!427525 (_1!6777 (tuple2!13533 lt!427388 (minValue!5595 thiss!1141)))))))

(declare-fun lt!427528 () List!19324)

(assert (=> d!115029 (= lt!427525 (ListLongMap!12230 lt!427528))))

(declare-fun lt!427527 () Unit!31965)

(declare-fun lt!427526 () Unit!31965)

(assert (=> d!115029 (= lt!427527 lt!427526)))

(assert (=> d!115029 (= (getValueByKey!493 lt!427528 (_1!6777 (tuple2!13533 lt!427388 (minValue!5595 thiss!1141)))) (Some!498 (_2!6777 (tuple2!13533 lt!427388 (minValue!5595 thiss!1141)))))))

(assert (=> d!115029 (= lt!427526 (lemmaContainsTupThenGetReturnValue!264 lt!427528 (_1!6777 (tuple2!13533 lt!427388 (minValue!5595 thiss!1141))) (_2!6777 (tuple2!13533 lt!427388 (minValue!5595 thiss!1141)))))))

(assert (=> d!115029 (= lt!427528 (insertStrictlySorted!321 (toList!6130 lt!427401) (_1!6777 (tuple2!13533 lt!427388 (minValue!5595 thiss!1141))) (_2!6777 (tuple2!13533 lt!427388 (minValue!5595 thiss!1141)))))))

(assert (=> d!115029 (= (+!2858 lt!427401 (tuple2!13533 lt!427388 (minValue!5595 thiss!1141))) lt!427525)))

(declare-fun b!949335 () Bool)

(declare-fun res!636685 () Bool)

(assert (=> b!949335 (=> (not res!636685) (not e!534446))))

(assert (=> b!949335 (= res!636685 (= (getValueByKey!493 (toList!6130 lt!427525) (_1!6777 (tuple2!13533 lt!427388 (minValue!5595 thiss!1141)))) (Some!498 (_2!6777 (tuple2!13533 lt!427388 (minValue!5595 thiss!1141))))))))

(declare-fun b!949336 () Bool)

(assert (=> b!949336 (= e!534446 (contains!5217 (toList!6130 lt!427525) (tuple2!13533 lt!427388 (minValue!5595 thiss!1141))))))

(assert (= (and d!115029 res!636686) b!949335))

(assert (= (and b!949335 res!636685) b!949336))

(declare-fun m!881997 () Bool)

(assert (=> d!115029 m!881997))

(declare-fun m!881999 () Bool)

(assert (=> d!115029 m!881999))

(declare-fun m!882001 () Bool)

(assert (=> d!115029 m!882001))

(declare-fun m!882003 () Bool)

(assert (=> d!115029 m!882003))

(declare-fun m!882005 () Bool)

(assert (=> b!949335 m!882005))

(declare-fun m!882007 () Bool)

(assert (=> b!949336 m!882007))

(assert (=> b!949093 d!115029))

(declare-fun d!115031 () Bool)

(assert (=> d!115031 (= (apply!874 (+!2858 lt!427401 (tuple2!13533 lt!427388 (minValue!5595 thiss!1141))) lt!427389) (get!14516 (getValueByKey!493 (toList!6130 (+!2858 lt!427401 (tuple2!13533 lt!427388 (minValue!5595 thiss!1141)))) lt!427389)))))

(declare-fun bs!26684 () Bool)

(assert (= bs!26684 d!115031))

(declare-fun m!882009 () Bool)

(assert (=> bs!26684 m!882009))

(assert (=> bs!26684 m!882009))

(declare-fun m!882011 () Bool)

(assert (=> bs!26684 m!882011))

(assert (=> b!949093 d!115031))

(assert (=> b!949093 d!114997))

(declare-fun d!115033 () Bool)

(assert (=> d!115033 (contains!5216 (+!2858 lt!427396 (tuple2!13533 lt!427402 (zeroValue!5595 thiss!1141))) lt!427390)))

(declare-fun lt!427531 () Unit!31965)

(declare-fun choose!1580 (ListLongMap!12229 (_ BitVec 64) V!32593 (_ BitVec 64)) Unit!31965)

(assert (=> d!115033 (= lt!427531 (choose!1580 lt!427396 lt!427402 (zeroValue!5595 thiss!1141) lt!427390))))

(assert (=> d!115033 (contains!5216 lt!427396 lt!427390)))

(assert (=> d!115033 (= (addStillContains!577 lt!427396 lt!427402 (zeroValue!5595 thiss!1141) lt!427390) lt!427531)))

(declare-fun bs!26685 () Bool)

(assert (= bs!26685 d!115033))

(assert (=> bs!26685 m!881747))

(assert (=> bs!26685 m!881747))

(assert (=> bs!26685 m!881749))

(declare-fun m!882013 () Bool)

(assert (=> bs!26685 m!882013))

(declare-fun m!882015 () Bool)

(assert (=> bs!26685 m!882015))

(assert (=> b!949093 d!115033))

(assert (=> d!114951 d!114947))

(declare-fun mapNonEmpty!32986 () Bool)

(declare-fun mapRes!32986 () Bool)

(declare-fun tp!63231 () Bool)

(declare-fun e!534447 () Bool)

(assert (=> mapNonEmpty!32986 (= mapRes!32986 (and tp!63231 e!534447))))

(declare-fun mapKey!32986 () (_ BitVec 32))

(declare-fun mapValue!32986 () ValueCell!9879)

(declare-fun mapRest!32986 () (Array (_ BitVec 32) ValueCell!9879))

(assert (=> mapNonEmpty!32986 (= mapRest!32985 (store mapRest!32986 mapKey!32986 mapValue!32986))))

(declare-fun b!949339 () Bool)

(declare-fun e!534448 () Bool)

(assert (=> b!949339 (= e!534448 tp_is_empty!20721)))

(declare-fun mapIsEmpty!32986 () Bool)

(assert (=> mapIsEmpty!32986 mapRes!32986))

(declare-fun b!949338 () Bool)

(assert (=> b!949338 (= e!534447 tp_is_empty!20721)))

(declare-fun condMapEmpty!32986 () Bool)

(declare-fun mapDefault!32986 () ValueCell!9879)

(assert (=> mapNonEmpty!32985 (= condMapEmpty!32986 (= mapRest!32985 ((as const (Array (_ BitVec 32) ValueCell!9879)) mapDefault!32986)))))

(assert (=> mapNonEmpty!32985 (= tp!63230 (and e!534448 mapRes!32986))))

(assert (= (and mapNonEmpty!32985 condMapEmpty!32986) mapIsEmpty!32986))

(assert (= (and mapNonEmpty!32985 (not condMapEmpty!32986)) mapNonEmpty!32986))

(assert (= (and mapNonEmpty!32986 ((_ is ValueCellFull!9879) mapValue!32986)) b!949338))

(assert (= (and mapNonEmpty!32985 ((_ is ValueCellFull!9879) mapDefault!32986)) b!949339))

(declare-fun m!882017 () Bool)

(assert (=> mapNonEmpty!32986 m!882017))

(declare-fun b_lambda!14343 () Bool)

(assert (= b_lambda!14341 (or (and b!949001 b_free!18213) b_lambda!14343)))

(declare-fun b_lambda!14345 () Bool)

(assert (= b_lambda!14339 (or (and b!949001 b_free!18213) b_lambda!14345)))

(check-sat (not b!949177) (not b!949307) (not d!114997) (not b!949320) (not b!949335) (not b!949327) (not b_lambda!14337) (not d!115019) (not d!115009) (not b!949290) (not b!949229) (not d!114989) (not b!949328) (not b!949321) (not b!949257) (not b!949150) (not b!949223) (not b!949235) (not b!949221) (not b!949152) (not d!114973) (not d!115031) (not b!949285) (not b!949222) (not d!115017) (not b!949294) (not b!949157) (not d!114995) tp_is_empty!20721 (not b!949258) (not b!949175) (not d!115011) (not b!949295) (not b!949336) (not d!115023) (not b!949284) (not d!115007) (not d!115005) (not d!114967) (not b_lambda!14345) (not b!949206) (not d!115025) (not d!115021) (not b!949329) (not d!115013) (not d!115033) (not d!115029) b_and!29661 (not b!949230) (not bm!41280) (not d!114971) (not b!949289) (not d!115001) (not d!114975) (not b!949178) (not b!949318) (not d!114969) (not b!949291) (not b!949203) (not bm!41277) (not b_lambda!14343) (not d!114965) (not d!114979) (not b!949246) (not b!949228) (not b!949158) (not b!949316) (not d!114987) (not b!949149) (not b!949232) (not d!114983) (not mapNonEmpty!32986) (not d!114991) (not b!949332) (not d!115015) (not b_next!18213) (not b!949208) (not bm!41274) (not d!115027) (not bm!41283) (not b!949292) (not b!949330) (not b!949334))
(check-sat b_and!29661 (not b_next!18213))
