; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84550 () Bool)

(assert start!84550)

(declare-fun b_free!19969 () Bool)

(declare-fun b_next!19969 () Bool)

(assert (=> start!84550 (= b_free!19969 (not b_next!19969))))

(declare-fun tp!69682 () Bool)

(declare-fun b_and!32013 () Bool)

(assert (=> start!84550 (= tp!69682 b_and!32013)))

(declare-fun b!987948 () Bool)

(declare-fun e!557181 () Bool)

(declare-datatypes ((array!62372 0))(
  ( (array!62373 (arr!30039 (Array (_ BitVec 32) (_ BitVec 64))) (size!30519 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62372)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!987948 (= e!557181 (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30039 _keys!1544) from!1932)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35897 0))(
  ( (V!35898 (val!11643 Int)) )
))
(declare-fun minValue!1220 () V!35897)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35897)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((ValueCell!11111 0))(
  ( (ValueCellFull!11111 (v!14202 V!35897)) (EmptyCell!11111) )
))
(declare-datatypes ((array!62374 0))(
  ( (array!62375 (arr!30040 (Array (_ BitVec 32) ValueCell!11111)) (size!30520 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62374)

(declare-datatypes ((tuple2!14850 0))(
  ( (tuple2!14851 (_1!7436 (_ BitVec 64)) (_2!7436 V!35897)) )
))
(declare-datatypes ((List!20759 0))(
  ( (Nil!20756) (Cons!20755 (h!21923 tuple2!14850) (t!29650 List!20759)) )
))
(declare-datatypes ((ListLongMap!13549 0))(
  ( (ListLongMap!13550 (toList!6790 List!20759)) )
))
(declare-fun lt!437934 () ListLongMap!13549)

(declare-fun +!3089 (ListLongMap!13549 tuple2!14850) ListLongMap!13549)

(declare-fun getCurrentListMapNoExtraKeys!3519 (array!62372 array!62374 (_ BitVec 32) (_ BitVec 32) V!35897 V!35897 (_ BitVec 32) Int) ListLongMap!13549)

(assert (=> b!987948 (= lt!437934 (+!3089 (getCurrentListMapNoExtraKeys!3519 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!987949 () Bool)

(declare-fun res!660693 () Bool)

(assert (=> b!987949 (=> (not res!660693) (not e!557181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62372 (_ BitVec 32)) Bool)

(assert (=> b!987949 (= res!660693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36806 () Bool)

(declare-fun mapRes!36806 () Bool)

(declare-fun tp!69683 () Bool)

(declare-fun e!557180 () Bool)

(assert (=> mapNonEmpty!36806 (= mapRes!36806 (and tp!69683 e!557180))))

(declare-fun mapRest!36806 () (Array (_ BitVec 32) ValueCell!11111))

(declare-fun mapKey!36806 () (_ BitVec 32))

(declare-fun mapValue!36806 () ValueCell!11111)

(assert (=> mapNonEmpty!36806 (= (arr!30040 _values!1278) (store mapRest!36806 mapKey!36806 mapValue!36806))))

(declare-fun b!987951 () Bool)

(declare-fun e!557184 () Bool)

(declare-fun tp_is_empty!23185 () Bool)

(assert (=> b!987951 (= e!557184 tp_is_empty!23185)))

(declare-fun mapIsEmpty!36806 () Bool)

(assert (=> mapIsEmpty!36806 mapRes!36806))

(declare-fun b!987952 () Bool)

(declare-fun e!557183 () Bool)

(assert (=> b!987952 (= e!557183 (and e!557184 mapRes!36806))))

(declare-fun condMapEmpty!36806 () Bool)

(declare-fun mapDefault!36806 () ValueCell!11111)

(assert (=> b!987952 (= condMapEmpty!36806 (= (arr!30040 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11111)) mapDefault!36806)))))

(declare-fun b!987953 () Bool)

(assert (=> b!987953 (= e!557180 tp_is_empty!23185)))

(declare-fun b!987954 () Bool)

(declare-fun res!660695 () Bool)

(assert (=> b!987954 (=> (not res!660695) (not e!557181))))

(assert (=> b!987954 (= res!660695 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30519 _keys!1544))))))

(declare-fun b!987955 () Bool)

(declare-fun res!660691 () Bool)

(assert (=> b!987955 (=> (not res!660691) (not e!557181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!987955 (= res!660691 (validKeyInArray!0 (select (arr!30039 _keys!1544) from!1932)))))

(declare-fun b!987956 () Bool)

(declare-fun res!660696 () Bool)

(assert (=> b!987956 (=> (not res!660696) (not e!557181))))

(assert (=> b!987956 (= res!660696 (and (= (size!30520 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30519 _keys!1544) (size!30520 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987957 () Bool)

(declare-fun res!660692 () Bool)

(assert (=> b!987957 (=> (not res!660692) (not e!557181))))

(declare-datatypes ((List!20760 0))(
  ( (Nil!20757) (Cons!20756 (h!21924 (_ BitVec 64)) (t!29651 List!20760)) )
))
(declare-fun arrayNoDuplicates!0 (array!62372 (_ BitVec 32) List!20760) Bool)

(assert (=> b!987957 (= res!660692 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20757))))

(declare-fun b!987950 () Bool)

(declare-fun res!660697 () Bool)

(assert (=> b!987950 (=> (not res!660697) (not e!557181))))

(assert (=> b!987950 (= res!660697 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!660694 () Bool)

(assert (=> start!84550 (=> (not res!660694) (not e!557181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84550 (= res!660694 (validMask!0 mask!1948))))

(assert (=> start!84550 e!557181))

(assert (=> start!84550 true))

(assert (=> start!84550 tp_is_empty!23185))

(declare-fun array_inv!23229 (array!62374) Bool)

(assert (=> start!84550 (and (array_inv!23229 _values!1278) e!557183)))

(assert (=> start!84550 tp!69682))

(declare-fun array_inv!23230 (array!62372) Bool)

(assert (=> start!84550 (array_inv!23230 _keys!1544)))

(assert (= (and start!84550 res!660694) b!987956))

(assert (= (and b!987956 res!660696) b!987949))

(assert (= (and b!987949 res!660693) b!987957))

(assert (= (and b!987957 res!660692) b!987954))

(assert (= (and b!987954 res!660695) b!987955))

(assert (= (and b!987955 res!660691) b!987950))

(assert (= (and b!987950 res!660697) b!987948))

(assert (= (and b!987952 condMapEmpty!36806) mapIsEmpty!36806))

(assert (= (and b!987952 (not condMapEmpty!36806)) mapNonEmpty!36806))

(get-info :version)

(assert (= (and mapNonEmpty!36806 ((_ is ValueCellFull!11111) mapValue!36806)) b!987953))

(assert (= (and b!987952 ((_ is ValueCellFull!11111) mapDefault!36806)) b!987951))

(assert (= start!84550 b!987952))

(declare-fun m!914957 () Bool)

(assert (=> b!987949 m!914957))

(declare-fun m!914959 () Bool)

(assert (=> b!987957 m!914959))

(declare-fun m!914961 () Bool)

(assert (=> mapNonEmpty!36806 m!914961))

(declare-fun m!914963 () Bool)

(assert (=> b!987955 m!914963))

(assert (=> b!987955 m!914963))

(declare-fun m!914965 () Bool)

(assert (=> b!987955 m!914965))

(assert (=> b!987948 m!914963))

(declare-fun m!914967 () Bool)

(assert (=> b!987948 m!914967))

(assert (=> b!987948 m!914967))

(declare-fun m!914969 () Bool)

(assert (=> b!987948 m!914969))

(declare-fun m!914971 () Bool)

(assert (=> start!84550 m!914971))

(declare-fun m!914973 () Bool)

(assert (=> start!84550 m!914973))

(declare-fun m!914975 () Bool)

(assert (=> start!84550 m!914975))

(check-sat (not start!84550) (not b!987957) tp_is_empty!23185 (not mapNonEmpty!36806) (not b_next!19969) (not b!987955) b_and!32013 (not b!987949) (not b!987948))
(check-sat b_and!32013 (not b_next!19969))
(get-model)

(declare-fun d!117225 () Bool)

(assert (=> d!117225 (= (validKeyInArray!0 (select (arr!30039 _keys!1544) from!1932)) (and (not (= (select (arr!30039 _keys!1544) from!1932) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30039 _keys!1544) from!1932) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!987955 d!117225))

(declare-fun b!988028 () Bool)

(declare-fun e!557224 () Bool)

(declare-fun e!557226 () Bool)

(assert (=> b!988028 (= e!557224 e!557226)))

(declare-fun res!660748 () Bool)

(assert (=> b!988028 (=> (not res!660748) (not e!557226))))

(declare-fun e!557223 () Bool)

(assert (=> b!988028 (= res!660748 (not e!557223))))

(declare-fun res!660747 () Bool)

(assert (=> b!988028 (=> (not res!660747) (not e!557223))))

(assert (=> b!988028 (= res!660747 (validKeyInArray!0 (select (arr!30039 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!988029 () Bool)

(declare-fun e!557225 () Bool)

(declare-fun call!41841 () Bool)

(assert (=> b!988029 (= e!557225 call!41841)))

(declare-fun d!117227 () Bool)

(declare-fun res!660746 () Bool)

(assert (=> d!117227 (=> res!660746 e!557224)))

(assert (=> d!117227 (= res!660746 (bvsge #b00000000000000000000000000000000 (size!30519 _keys!1544)))))

(assert (=> d!117227 (= (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20757) e!557224)))

(declare-fun b!988030 () Bool)

(assert (=> b!988030 (= e!557226 e!557225)))

(declare-fun c!100307 () Bool)

(assert (=> b!988030 (= c!100307 (validKeyInArray!0 (select (arr!30039 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!988031 () Bool)

(assert (=> b!988031 (= e!557225 call!41841)))

(declare-fun b!988032 () Bool)

(declare-fun contains!5729 (List!20760 (_ BitVec 64)) Bool)

(assert (=> b!988032 (= e!557223 (contains!5729 Nil!20757 (select (arr!30039 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun bm!41838 () Bool)

(assert (=> bm!41838 (= call!41841 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100307 (Cons!20756 (select (arr!30039 _keys!1544) #b00000000000000000000000000000000) Nil!20757) Nil!20757)))))

(assert (= (and d!117227 (not res!660746)) b!988028))

(assert (= (and b!988028 res!660747) b!988032))

(assert (= (and b!988028 res!660748) b!988030))

(assert (= (and b!988030 c!100307) b!988029))

(assert (= (and b!988030 (not c!100307)) b!988031))

(assert (= (or b!988029 b!988031) bm!41838))

(declare-fun m!915017 () Bool)

(assert (=> b!988028 m!915017))

(assert (=> b!988028 m!915017))

(declare-fun m!915019 () Bool)

(assert (=> b!988028 m!915019))

(assert (=> b!988030 m!915017))

(assert (=> b!988030 m!915017))

(assert (=> b!988030 m!915019))

(assert (=> b!988032 m!915017))

(assert (=> b!988032 m!915017))

(declare-fun m!915021 () Bool)

(assert (=> b!988032 m!915021))

(assert (=> bm!41838 m!915017))

(declare-fun m!915023 () Bool)

(assert (=> bm!41838 m!915023))

(assert (=> b!987957 d!117227))

(declare-fun d!117229 () Bool)

(declare-fun e!557229 () Bool)

(assert (=> d!117229 e!557229))

(declare-fun res!660754 () Bool)

(assert (=> d!117229 (=> (not res!660754) (not e!557229))))

(declare-fun lt!437952 () ListLongMap!13549)

(declare-fun contains!5730 (ListLongMap!13549 (_ BitVec 64)) Bool)

(assert (=> d!117229 (= res!660754 (contains!5730 lt!437952 (_1!7436 (tuple2!14851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun lt!437950 () List!20759)

(assert (=> d!117229 (= lt!437952 (ListLongMap!13550 lt!437950))))

(declare-datatypes ((Unit!32752 0))(
  ( (Unit!32753) )
))
(declare-fun lt!437951 () Unit!32752)

(declare-fun lt!437949 () Unit!32752)

(assert (=> d!117229 (= lt!437951 lt!437949)))

(declare-datatypes ((Option!514 0))(
  ( (Some!513 (v!14205 V!35897)) (None!512) )
))
(declare-fun getValueByKey!508 (List!20759 (_ BitVec 64)) Option!514)

(assert (=> d!117229 (= (getValueByKey!508 lt!437950 (_1!7436 (tuple2!14851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!513 (_2!7436 (tuple2!14851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun lemmaContainsTupThenGetReturnValue!270 (List!20759 (_ BitVec 64) V!35897) Unit!32752)

(assert (=> d!117229 (= lt!437949 (lemmaContainsTupThenGetReturnValue!270 lt!437950 (_1!7436 (tuple2!14851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7436 (tuple2!14851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun insertStrictlySorted!327 (List!20759 (_ BitVec 64) V!35897) List!20759)

(assert (=> d!117229 (= lt!437950 (insertStrictlySorted!327 (toList!6790 (getCurrentListMapNoExtraKeys!3519 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7436 (tuple2!14851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7436 (tuple2!14851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117229 (= (+!3089 (getCurrentListMapNoExtraKeys!3519 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) lt!437952)))

(declare-fun b!988037 () Bool)

(declare-fun res!660753 () Bool)

(assert (=> b!988037 (=> (not res!660753) (not e!557229))))

(assert (=> b!988037 (= res!660753 (= (getValueByKey!508 (toList!6790 lt!437952) (_1!7436 (tuple2!14851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!513 (_2!7436 (tuple2!14851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))))

(declare-fun b!988038 () Bool)

(declare-fun contains!5731 (List!20759 tuple2!14850) Bool)

(assert (=> b!988038 (= e!557229 (contains!5731 (toList!6790 lt!437952) (tuple2!14851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (= (and d!117229 res!660754) b!988037))

(assert (= (and b!988037 res!660753) b!988038))

(declare-fun m!915025 () Bool)

(assert (=> d!117229 m!915025))

(declare-fun m!915027 () Bool)

(assert (=> d!117229 m!915027))

(declare-fun m!915029 () Bool)

(assert (=> d!117229 m!915029))

(declare-fun m!915031 () Bool)

(assert (=> d!117229 m!915031))

(declare-fun m!915033 () Bool)

(assert (=> b!988037 m!915033))

(declare-fun m!915035 () Bool)

(assert (=> b!988038 m!915035))

(assert (=> b!987948 d!117229))

(declare-fun b!988063 () Bool)

(declare-fun res!660765 () Bool)

(declare-fun e!557244 () Bool)

(assert (=> b!988063 (=> (not res!660765) (not e!557244))))

(declare-fun lt!437967 () ListLongMap!13549)

(assert (=> b!988063 (= res!660765 (not (contains!5730 lt!437967 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!117231 () Bool)

(assert (=> d!117231 e!557244))

(declare-fun res!660764 () Bool)

(assert (=> d!117231 (=> (not res!660764) (not e!557244))))

(assert (=> d!117231 (= res!660764 (not (contains!5730 lt!437967 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!557249 () ListLongMap!13549)

(assert (=> d!117231 (= lt!437967 e!557249)))

(declare-fun c!100317 () Bool)

(assert (=> d!117231 (= c!100317 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30519 _keys!1544)))))

(assert (=> d!117231 (validMask!0 mask!1948)))

(assert (=> d!117231 (= (getCurrentListMapNoExtraKeys!3519 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!437967)))

(declare-fun b!988064 () Bool)

(declare-fun e!557246 () ListLongMap!13549)

(assert (=> b!988064 (= e!557249 e!557246)))

(declare-fun c!100316 () Bool)

(assert (=> b!988064 (= c!100316 (validKeyInArray!0 (select (arr!30039 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun call!41844 () ListLongMap!13549)

(declare-fun bm!41841 () Bool)

(assert (=> bm!41841 (= call!41844 (getCurrentListMapNoExtraKeys!3519 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!988065 () Bool)

(declare-fun e!557250 () Bool)

(declare-fun isEmpty!724 (ListLongMap!13549) Bool)

(assert (=> b!988065 (= e!557250 (isEmpty!724 lt!437967))))

(declare-fun b!988066 () Bool)

(declare-fun lt!437972 () Unit!32752)

(declare-fun lt!437969 () Unit!32752)

(assert (=> b!988066 (= lt!437972 lt!437969)))

(declare-fun lt!437973 () (_ BitVec 64))

(declare-fun lt!437968 () ListLongMap!13549)

(declare-fun lt!437970 () (_ BitVec 64))

(declare-fun lt!437971 () V!35897)

(assert (=> b!988066 (not (contains!5730 (+!3089 lt!437968 (tuple2!14851 lt!437970 lt!437971)) lt!437973))))

(declare-fun addStillNotContains!232 (ListLongMap!13549 (_ BitVec 64) V!35897 (_ BitVec 64)) Unit!32752)

(assert (=> b!988066 (= lt!437969 (addStillNotContains!232 lt!437968 lt!437970 lt!437971 lt!437973))))

(assert (=> b!988066 (= lt!437973 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!15600 (ValueCell!11111 V!35897) V!35897)

(declare-fun dynLambda!1873 (Int (_ BitVec 64)) V!35897)

(assert (=> b!988066 (= lt!437971 (get!15600 (select (arr!30040 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!988066 (= lt!437970 (select (arr!30039 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!988066 (= lt!437968 call!41844)))

(assert (=> b!988066 (= e!557246 (+!3089 call!41844 (tuple2!14851 (select (arr!30039 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15600 (select (arr!30040 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!988067 () Bool)

(declare-fun e!557247 () Bool)

(assert (=> b!988067 (= e!557244 e!557247)))

(declare-fun c!100318 () Bool)

(declare-fun e!557248 () Bool)

(assert (=> b!988067 (= c!100318 e!557248)))

(declare-fun res!660763 () Bool)

(assert (=> b!988067 (=> (not res!660763) (not e!557248))))

(assert (=> b!988067 (= res!660763 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30519 _keys!1544)))))

(declare-fun b!988068 () Bool)

(assert (=> b!988068 (= e!557250 (= lt!437967 (getCurrentListMapNoExtraKeys!3519 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun b!988069 () Bool)

(assert (=> b!988069 (= e!557248 (validKeyInArray!0 (select (arr!30039 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!988069 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))

(declare-fun b!988070 () Bool)

(assert (=> b!988070 (= e!557247 e!557250)))

(declare-fun c!100319 () Bool)

(assert (=> b!988070 (= c!100319 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30519 _keys!1544)))))

(declare-fun b!988071 () Bool)

(declare-fun e!557245 () Bool)

(assert (=> b!988071 (= e!557247 e!557245)))

(assert (=> b!988071 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30519 _keys!1544)))))

(declare-fun res!660766 () Bool)

(assert (=> b!988071 (= res!660766 (contains!5730 lt!437967 (select (arr!30039 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!988071 (=> (not res!660766) (not e!557245))))

(declare-fun b!988072 () Bool)

(assert (=> b!988072 (= e!557246 call!41844)))

(declare-fun b!988073 () Bool)

(assert (=> b!988073 (= e!557249 (ListLongMap!13550 Nil!20756))))

(declare-fun b!988074 () Bool)

(assert (=> b!988074 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30519 _keys!1544)))))

(assert (=> b!988074 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30520 _values!1278)))))

(declare-fun apply!900 (ListLongMap!13549 (_ BitVec 64)) V!35897)

(assert (=> b!988074 (= e!557245 (= (apply!900 lt!437967 (select (arr!30039 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15600 (select (arr!30040 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!117231 c!100317) b!988073))

(assert (= (and d!117231 (not c!100317)) b!988064))

(assert (= (and b!988064 c!100316) b!988066))

(assert (= (and b!988064 (not c!100316)) b!988072))

(assert (= (or b!988066 b!988072) bm!41841))

(assert (= (and d!117231 res!660764) b!988063))

(assert (= (and b!988063 res!660765) b!988067))

(assert (= (and b!988067 res!660763) b!988069))

(assert (= (and b!988067 c!100318) b!988071))

(assert (= (and b!988067 (not c!100318)) b!988070))

(assert (= (and b!988071 res!660766) b!988074))

(assert (= (and b!988070 c!100319) b!988068))

(assert (= (and b!988070 (not c!100319)) b!988065))

(declare-fun b_lambda!15003 () Bool)

(assert (=> (not b_lambda!15003) (not b!988066)))

(declare-fun t!29653 () Bool)

(declare-fun tb!6743 () Bool)

(assert (=> (and start!84550 (= defaultEntry!1281 defaultEntry!1281) t!29653) tb!6743))

(declare-fun result!13483 () Bool)

(assert (=> tb!6743 (= result!13483 tp_is_empty!23185)))

(assert (=> b!988066 t!29653))

(declare-fun b_and!32019 () Bool)

(assert (= b_and!32013 (and (=> t!29653 result!13483) b_and!32019)))

(declare-fun b_lambda!15005 () Bool)

(assert (=> (not b_lambda!15005) (not b!988074)))

(assert (=> b!988074 t!29653))

(declare-fun b_and!32021 () Bool)

(assert (= b_and!32019 (and (=> t!29653 result!13483) b_and!32021)))

(declare-fun m!915037 () Bool)

(assert (=> b!988074 m!915037))

(declare-fun m!915039 () Bool)

(assert (=> b!988074 m!915039))

(assert (=> b!988074 m!915039))

(assert (=> b!988074 m!915037))

(declare-fun m!915041 () Bool)

(assert (=> b!988074 m!915041))

(declare-fun m!915043 () Bool)

(assert (=> b!988074 m!915043))

(declare-fun m!915045 () Bool)

(assert (=> b!988074 m!915045))

(assert (=> b!988074 m!915043))

(declare-fun m!915047 () Bool)

(assert (=> bm!41841 m!915047))

(assert (=> b!988064 m!915043))

(assert (=> b!988064 m!915043))

(declare-fun m!915049 () Bool)

(assert (=> b!988064 m!915049))

(assert (=> b!988068 m!915047))

(declare-fun m!915051 () Bool)

(assert (=> d!117231 m!915051))

(assert (=> d!117231 m!914971))

(assert (=> b!988069 m!915043))

(assert (=> b!988069 m!915043))

(assert (=> b!988069 m!915049))

(assert (=> b!988066 m!915037))

(assert (=> b!988066 m!915039))

(declare-fun m!915053 () Bool)

(assert (=> b!988066 m!915053))

(declare-fun m!915055 () Bool)

(assert (=> b!988066 m!915055))

(declare-fun m!915057 () Bool)

(assert (=> b!988066 m!915057))

(assert (=> b!988066 m!915039))

(assert (=> b!988066 m!915037))

(assert (=> b!988066 m!915041))

(assert (=> b!988066 m!915053))

(declare-fun m!915059 () Bool)

(assert (=> b!988066 m!915059))

(assert (=> b!988066 m!915043))

(declare-fun m!915061 () Bool)

(assert (=> b!988063 m!915061))

(declare-fun m!915063 () Bool)

(assert (=> b!988065 m!915063))

(assert (=> b!988071 m!915043))

(assert (=> b!988071 m!915043))

(declare-fun m!915065 () Bool)

(assert (=> b!988071 m!915065))

(assert (=> b!987948 d!117231))

(declare-fun d!117233 () Bool)

(declare-fun res!660772 () Bool)

(declare-fun e!557258 () Bool)

(assert (=> d!117233 (=> res!660772 e!557258)))

(assert (=> d!117233 (= res!660772 (bvsge #b00000000000000000000000000000000 (size!30519 _keys!1544)))))

(assert (=> d!117233 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!557258)))

(declare-fun b!988085 () Bool)

(declare-fun e!557257 () Bool)

(declare-fun call!41847 () Bool)

(assert (=> b!988085 (= e!557257 call!41847)))

(declare-fun b!988086 () Bool)

(declare-fun e!557259 () Bool)

(assert (=> b!988086 (= e!557258 e!557259)))

(declare-fun c!100322 () Bool)

(assert (=> b!988086 (= c!100322 (validKeyInArray!0 (select (arr!30039 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!988087 () Bool)

(assert (=> b!988087 (= e!557259 call!41847)))

(declare-fun b!988088 () Bool)

(assert (=> b!988088 (= e!557259 e!557257)))

(declare-fun lt!437980 () (_ BitVec 64))

(assert (=> b!988088 (= lt!437980 (select (arr!30039 _keys!1544) #b00000000000000000000000000000000))))

(declare-fun lt!437982 () Unit!32752)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62372 (_ BitVec 64) (_ BitVec 32)) Unit!32752)

(assert (=> b!988088 (= lt!437982 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!437980 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62372 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!988088 (arrayContainsKey!0 _keys!1544 lt!437980 #b00000000000000000000000000000000)))

(declare-fun lt!437981 () Unit!32752)

(assert (=> b!988088 (= lt!437981 lt!437982)))

(declare-fun res!660771 () Bool)

(declare-datatypes ((SeekEntryResult!9161 0))(
  ( (MissingZero!9161 (index!39015 (_ BitVec 32))) (Found!9161 (index!39016 (_ BitVec 32))) (Intermediate!9161 (undefined!9973 Bool) (index!39017 (_ BitVec 32)) (x!85859 (_ BitVec 32))) (Undefined!9161) (MissingVacant!9161 (index!39018 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62372 (_ BitVec 32)) SeekEntryResult!9161)

(assert (=> b!988088 (= res!660771 (= (seekEntryOrOpen!0 (select (arr!30039 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9161 #b00000000000000000000000000000000)))))

(assert (=> b!988088 (=> (not res!660771) (not e!557257))))

(declare-fun bm!41844 () Bool)

(assert (=> bm!41844 (= call!41847 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(assert (= (and d!117233 (not res!660772)) b!988086))

(assert (= (and b!988086 c!100322) b!988088))

(assert (= (and b!988086 (not c!100322)) b!988087))

(assert (= (and b!988088 res!660771) b!988085))

(assert (= (or b!988085 b!988087) bm!41844))

(assert (=> b!988086 m!915017))

(assert (=> b!988086 m!915017))

(assert (=> b!988086 m!915019))

(assert (=> b!988088 m!915017))

(declare-fun m!915067 () Bool)

(assert (=> b!988088 m!915067))

(declare-fun m!915069 () Bool)

(assert (=> b!988088 m!915069))

(assert (=> b!988088 m!915017))

(declare-fun m!915071 () Bool)

(assert (=> b!988088 m!915071))

(declare-fun m!915073 () Bool)

(assert (=> bm!41844 m!915073))

(assert (=> b!987949 d!117233))

(declare-fun d!117235 () Bool)

(assert (=> d!117235 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!84550 d!117235))

(declare-fun d!117237 () Bool)

(assert (=> d!117237 (= (array_inv!23229 _values!1278) (bvsge (size!30520 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!84550 d!117237))

(declare-fun d!117239 () Bool)

(assert (=> d!117239 (= (array_inv!23230 _keys!1544) (bvsge (size!30519 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!84550 d!117239))

(declare-fun b!988096 () Bool)

(declare-fun e!557264 () Bool)

(assert (=> b!988096 (= e!557264 tp_is_empty!23185)))

(declare-fun condMapEmpty!36815 () Bool)

(declare-fun mapDefault!36815 () ValueCell!11111)

(assert (=> mapNonEmpty!36806 (= condMapEmpty!36815 (= mapRest!36806 ((as const (Array (_ BitVec 32) ValueCell!11111)) mapDefault!36815)))))

(declare-fun mapRes!36815 () Bool)

(assert (=> mapNonEmpty!36806 (= tp!69683 (and e!557264 mapRes!36815))))

(declare-fun b!988095 () Bool)

(declare-fun e!557265 () Bool)

(assert (=> b!988095 (= e!557265 tp_is_empty!23185)))

(declare-fun mapNonEmpty!36815 () Bool)

(declare-fun tp!69698 () Bool)

(assert (=> mapNonEmpty!36815 (= mapRes!36815 (and tp!69698 e!557265))))

(declare-fun mapKey!36815 () (_ BitVec 32))

(declare-fun mapValue!36815 () ValueCell!11111)

(declare-fun mapRest!36815 () (Array (_ BitVec 32) ValueCell!11111))

(assert (=> mapNonEmpty!36815 (= mapRest!36806 (store mapRest!36815 mapKey!36815 mapValue!36815))))

(declare-fun mapIsEmpty!36815 () Bool)

(assert (=> mapIsEmpty!36815 mapRes!36815))

(assert (= (and mapNonEmpty!36806 condMapEmpty!36815) mapIsEmpty!36815))

(assert (= (and mapNonEmpty!36806 (not condMapEmpty!36815)) mapNonEmpty!36815))

(assert (= (and mapNonEmpty!36815 ((_ is ValueCellFull!11111) mapValue!36815)) b!988095))

(assert (= (and mapNonEmpty!36806 ((_ is ValueCellFull!11111) mapDefault!36815)) b!988096))

(declare-fun m!915075 () Bool)

(assert (=> mapNonEmpty!36815 m!915075))

(declare-fun b_lambda!15007 () Bool)

(assert (= b_lambda!15005 (or (and start!84550 b_free!19969) b_lambda!15007)))

(declare-fun b_lambda!15009 () Bool)

(assert (= b_lambda!15003 (or (and start!84550 b_free!19969) b_lambda!15009)))

(check-sat (not b_lambda!15007) tp_is_empty!23185 (not b_lambda!15009) (not b!988028) (not b!988030) (not b!988032) (not b!988064) b_and!32021 (not b!988086) (not b!988038) (not d!117231) (not bm!41841) (not b!988063) (not b!988066) (not b_next!19969) (not b!988069) (not d!117229) (not b!988068) (not b!988065) (not b!988074) (not mapNonEmpty!36815) (not bm!41838) (not b!988037) (not b!988088) (not b!988071) (not bm!41844))
(check-sat b_and!32021 (not b_next!19969))
