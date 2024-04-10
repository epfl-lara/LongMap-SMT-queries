; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84562 () Bool)

(assert start!84562)

(declare-fun b_free!20043 () Bool)

(declare-fun b_next!20043 () Bool)

(assert (=> start!84562 (= b_free!20043 (not b_next!20043))))

(declare-fun tp!69917 () Bool)

(declare-fun b_and!32155 () Bool)

(assert (=> start!84562 (= tp!69917 b_and!32155)))

(declare-fun b!989082 () Bool)

(declare-fun res!661524 () Bool)

(declare-fun e!557713 () Bool)

(assert (=> b!989082 (=> (not res!661524) (not e!557713))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35995 0))(
  ( (V!35996 (val!11680 Int)) )
))
(declare-datatypes ((ValueCell!11148 0))(
  ( (ValueCellFull!11148 (v!14247 V!35995)) (EmptyCell!11148) )
))
(declare-datatypes ((array!62477 0))(
  ( (array!62478 (arr!30092 (Array (_ BitVec 32) ValueCell!11148)) (size!30571 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62477)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62479 0))(
  ( (array!62480 (arr!30093 (Array (_ BitVec 32) (_ BitVec 64))) (size!30572 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62479)

(assert (=> b!989082 (= res!661524 (and (= (size!30571 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30572 _keys!1544) (size!30571 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!661520 () Bool)

(assert (=> start!84562 (=> (not res!661520) (not e!557713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84562 (= res!661520 (validMask!0 mask!1948))))

(assert (=> start!84562 e!557713))

(assert (=> start!84562 true))

(declare-fun tp_is_empty!23259 () Bool)

(assert (=> start!84562 tp_is_empty!23259))

(declare-fun e!557715 () Bool)

(declare-fun array_inv!23247 (array!62477) Bool)

(assert (=> start!84562 (and (array_inv!23247 _values!1278) e!557715)))

(assert (=> start!84562 tp!69917))

(declare-fun array_inv!23248 (array!62479) Bool)

(assert (=> start!84562 (array_inv!23248 _keys!1544)))

(declare-fun b!989083 () Bool)

(declare-fun res!661525 () Bool)

(assert (=> b!989083 (=> (not res!661525) (not e!557713))))

(assert (=> b!989083 (= res!661525 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun minValue!1220 () V!35995)

(declare-fun e!557712 () Bool)

(declare-fun zeroValue!1220 () V!35995)

(declare-fun defaultEntry!1281 () Int)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun b!989084 () Bool)

(declare-datatypes ((tuple2!14886 0))(
  ( (tuple2!14887 (_1!7454 (_ BitVec 64)) (_2!7454 V!35995)) )
))
(declare-fun lt!438711 () tuple2!14886)

(declare-datatypes ((List!20815 0))(
  ( (Nil!20812) (Cons!20811 (h!21973 tuple2!14886) (t!29770 List!20815)) )
))
(declare-datatypes ((ListLongMap!13583 0))(
  ( (ListLongMap!13584 (toList!6807 List!20815)) )
))
(declare-fun getCurrentListMap!3866 (array!62479 array!62477 (_ BitVec 32) (_ BitVec 32) V!35995 V!35995 (_ BitVec 32) Int) ListLongMap!13583)

(declare-fun +!3085 (ListLongMap!13583 tuple2!14886) ListLongMap!13583)

(assert (=> b!989084 (= e!557712 (not (= (getCurrentListMap!3866 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) (+!3085 (getCurrentListMap!3866 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!438711))))))

(declare-fun lt!438712 () ListLongMap!13583)

(declare-fun lt!438713 () tuple2!14886)

(assert (=> b!989084 (= (+!3085 (+!3085 lt!438712 lt!438713) lt!438711) (+!3085 (+!3085 lt!438712 lt!438711) lt!438713))))

(declare-fun lt!438714 () V!35995)

(assert (=> b!989084 (= lt!438711 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714))))

(assert (=> b!989084 (= lt!438713 (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32825 0))(
  ( (Unit!32826) )
))
(declare-fun lt!438715 () Unit!32825)

(declare-fun addCommutativeForDiffKeys!708 (ListLongMap!13583 (_ BitVec 64) V!35995 (_ BitVec 64) V!35995) Unit!32825)

(assert (=> b!989084 (= lt!438715 (addCommutativeForDiffKeys!708 lt!438712 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30093 _keys!1544) from!1932) lt!438714))))

(declare-fun b!989085 () Bool)

(declare-fun e!557714 () Bool)

(assert (=> b!989085 (= e!557714 tp_is_empty!23259)))

(declare-fun b!989086 () Bool)

(declare-fun res!661523 () Bool)

(assert (=> b!989086 (=> (not res!661523) (not e!557713))))

(assert (=> b!989086 (= res!661523 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30572 _keys!1544))))))

(declare-fun mapIsEmpty!36930 () Bool)

(declare-fun mapRes!36930 () Bool)

(assert (=> mapIsEmpty!36930 mapRes!36930))

(declare-fun b!989087 () Bool)

(declare-fun res!661527 () Bool)

(assert (=> b!989087 (=> (not res!661527) (not e!557713))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62479 (_ BitVec 32)) Bool)

(assert (=> b!989087 (= res!661527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!989088 () Bool)

(declare-fun res!661522 () Bool)

(assert (=> b!989088 (=> (not res!661522) (not e!557713))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!989088 (= res!661522 (validKeyInArray!0 (select (arr!30093 _keys!1544) from!1932)))))

(declare-fun b!989089 () Bool)

(assert (=> b!989089 (= e!557713 e!557712)))

(declare-fun res!661521 () Bool)

(assert (=> b!989089 (=> (not res!661521) (not e!557712))))

(assert (=> b!989089 (= res!661521 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30093 _keys!1544) from!1932))))))

(declare-fun get!15619 (ValueCell!11148 V!35995) V!35995)

(declare-fun dynLambda!1867 (Int (_ BitVec 64)) V!35995)

(assert (=> b!989089 (= lt!438714 (get!15619 (select (arr!30092 _values!1278) from!1932) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!3497 (array!62479 array!62477 (_ BitVec 32) (_ BitVec 32) V!35995 V!35995 (_ BitVec 32) Int) ListLongMap!13583)

(assert (=> b!989089 (= lt!438712 (getCurrentListMapNoExtraKeys!3497 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!989090 () Bool)

(declare-fun e!557711 () Bool)

(assert (=> b!989090 (= e!557715 (and e!557711 mapRes!36930))))

(declare-fun condMapEmpty!36930 () Bool)

(declare-fun mapDefault!36930 () ValueCell!11148)

(assert (=> b!989090 (= condMapEmpty!36930 (= (arr!30092 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11148)) mapDefault!36930)))))

(declare-fun b!989091 () Bool)

(assert (=> b!989091 (= e!557711 tp_is_empty!23259)))

(declare-fun mapNonEmpty!36930 () Bool)

(declare-fun tp!69916 () Bool)

(assert (=> mapNonEmpty!36930 (= mapRes!36930 (and tp!69916 e!557714))))

(declare-fun mapKey!36930 () (_ BitVec 32))

(declare-fun mapValue!36930 () ValueCell!11148)

(declare-fun mapRest!36930 () (Array (_ BitVec 32) ValueCell!11148))

(assert (=> mapNonEmpty!36930 (= (arr!30092 _values!1278) (store mapRest!36930 mapKey!36930 mapValue!36930))))

(declare-fun b!989092 () Bool)

(declare-fun res!661526 () Bool)

(assert (=> b!989092 (=> (not res!661526) (not e!557713))))

(declare-datatypes ((List!20816 0))(
  ( (Nil!20813) (Cons!20812 (h!21974 (_ BitVec 64)) (t!29771 List!20816)) )
))
(declare-fun arrayNoDuplicates!0 (array!62479 (_ BitVec 32) List!20816) Bool)

(assert (=> b!989092 (= res!661526 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20813))))

(assert (= (and start!84562 res!661520) b!989082))

(assert (= (and b!989082 res!661524) b!989087))

(assert (= (and b!989087 res!661527) b!989092))

(assert (= (and b!989092 res!661526) b!989086))

(assert (= (and b!989086 res!661523) b!989088))

(assert (= (and b!989088 res!661522) b!989083))

(assert (= (and b!989083 res!661525) b!989089))

(assert (= (and b!989089 res!661521) b!989084))

(assert (= (and b!989090 condMapEmpty!36930) mapIsEmpty!36930))

(assert (= (and b!989090 (not condMapEmpty!36930)) mapNonEmpty!36930))

(get-info :version)

(assert (= (and mapNonEmpty!36930 ((_ is ValueCellFull!11148) mapValue!36930)) b!989085))

(assert (= (and b!989090 ((_ is ValueCellFull!11148) mapDefault!36930)) b!989091))

(assert (= start!84562 b!989090))

(declare-fun b_lambda!15099 () Bool)

(assert (=> (not b_lambda!15099) (not b!989089)))

(declare-fun t!29769 () Bool)

(declare-fun tb!6805 () Bool)

(assert (=> (and start!84562 (= defaultEntry!1281 defaultEntry!1281) t!29769) tb!6805))

(declare-fun result!13607 () Bool)

(assert (=> tb!6805 (= result!13607 tp_is_empty!23259)))

(assert (=> b!989089 t!29769))

(declare-fun b_and!32157 () Bool)

(assert (= b_and!32155 (and (=> t!29769 result!13607) b_and!32157)))

(declare-fun m!916199 () Bool)

(assert (=> mapNonEmpty!36930 m!916199))

(declare-fun m!916201 () Bool)

(assert (=> b!989088 m!916201))

(assert (=> b!989088 m!916201))

(declare-fun m!916203 () Bool)

(assert (=> b!989088 m!916203))

(assert (=> b!989089 m!916201))

(declare-fun m!916205 () Bool)

(assert (=> b!989089 m!916205))

(declare-fun m!916207 () Bool)

(assert (=> b!989089 m!916207))

(declare-fun m!916209 () Bool)

(assert (=> b!989089 m!916209))

(assert (=> b!989089 m!916205))

(assert (=> b!989089 m!916209))

(declare-fun m!916211 () Bool)

(assert (=> b!989089 m!916211))

(declare-fun m!916213 () Bool)

(assert (=> b!989087 m!916213))

(declare-fun m!916215 () Bool)

(assert (=> b!989092 m!916215))

(declare-fun m!916217 () Bool)

(assert (=> start!84562 m!916217))

(declare-fun m!916219 () Bool)

(assert (=> start!84562 m!916219))

(declare-fun m!916221 () Bool)

(assert (=> start!84562 m!916221))

(assert (=> b!989084 m!916201))

(assert (=> b!989084 m!916201))

(declare-fun m!916223 () Bool)

(assert (=> b!989084 m!916223))

(declare-fun m!916225 () Bool)

(assert (=> b!989084 m!916225))

(declare-fun m!916227 () Bool)

(assert (=> b!989084 m!916227))

(declare-fun m!916229 () Bool)

(assert (=> b!989084 m!916229))

(assert (=> b!989084 m!916225))

(declare-fun m!916231 () Bool)

(assert (=> b!989084 m!916231))

(declare-fun m!916233 () Bool)

(assert (=> b!989084 m!916233))

(declare-fun m!916235 () Bool)

(assert (=> b!989084 m!916235))

(declare-fun m!916237 () Bool)

(assert (=> b!989084 m!916237))

(assert (=> b!989084 m!916233))

(assert (=> b!989084 m!916227))

(check-sat (not b!989087) (not b!989089) (not b_next!20043) (not b_lambda!15099) (not start!84562) (not mapNonEmpty!36930) tp_is_empty!23259 b_and!32157 (not b!989092) (not b!989088) (not b!989084))
(check-sat b_and!32157 (not b_next!20043))
(get-model)

(declare-fun b_lambda!15103 () Bool)

(assert (= b_lambda!15099 (or (and start!84562 b_free!20043) b_lambda!15103)))

(check-sat (not b!989087) (not b!989089) (not b_next!20043) (not b_lambda!15103) (not start!84562) (not mapNonEmpty!36930) tp_is_empty!23259 b_and!32157 (not b!989092) (not b!989088) (not b!989084))
(check-sat b_and!32157 (not b_next!20043))
(get-model)

(declare-fun b!989138 () Bool)

(declare-fun e!557741 () Bool)

(declare-fun call!41894 () Bool)

(assert (=> b!989138 (= e!557741 call!41894)))

(declare-fun b!989139 () Bool)

(declare-fun e!557742 () Bool)

(assert (=> b!989139 (= e!557742 e!557741)))

(declare-fun c!100245 () Bool)

(assert (=> b!989139 (= c!100245 (validKeyInArray!0 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun bm!41891 () Bool)

(assert (=> bm!41891 (= call!41894 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun d!117277 () Bool)

(declare-fun res!661556 () Bool)

(assert (=> d!117277 (=> res!661556 e!557742)))

(assert (=> d!117277 (= res!661556 (bvsge #b00000000000000000000000000000000 (size!30572 _keys!1544)))))

(assert (=> d!117277 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!557742)))

(declare-fun b!989140 () Bool)

(declare-fun e!557743 () Bool)

(assert (=> b!989140 (= e!557743 call!41894)))

(declare-fun b!989141 () Bool)

(assert (=> b!989141 (= e!557741 e!557743)))

(declare-fun lt!438739 () (_ BitVec 64))

(assert (=> b!989141 (= lt!438739 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000))))

(declare-fun lt!438737 () Unit!32825)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62479 (_ BitVec 64) (_ BitVec 32)) Unit!32825)

(assert (=> b!989141 (= lt!438737 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!438739 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!989141 (arrayContainsKey!0 _keys!1544 lt!438739 #b00000000000000000000000000000000)))

(declare-fun lt!438738 () Unit!32825)

(assert (=> b!989141 (= lt!438738 lt!438737)))

(declare-fun res!661557 () Bool)

(declare-datatypes ((SeekEntryResult!9210 0))(
  ( (MissingZero!9210 (index!39211 (_ BitVec 32))) (Found!9210 (index!39212 (_ BitVec 32))) (Intermediate!9210 (undefined!10022 Bool) (index!39213 (_ BitVec 32)) (x!86092 (_ BitVec 32))) (Undefined!9210) (MissingVacant!9210 (index!39214 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62479 (_ BitVec 32)) SeekEntryResult!9210)

(assert (=> b!989141 (= res!661557 (= (seekEntryOrOpen!0 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9210 #b00000000000000000000000000000000)))))

(assert (=> b!989141 (=> (not res!661557) (not e!557743))))

(assert (= (and d!117277 (not res!661556)) b!989139))

(assert (= (and b!989139 c!100245) b!989141))

(assert (= (and b!989139 (not c!100245)) b!989138))

(assert (= (and b!989141 res!661557) b!989140))

(assert (= (or b!989140 b!989138) bm!41891))

(declare-fun m!916279 () Bool)

(assert (=> b!989139 m!916279))

(assert (=> b!989139 m!916279))

(declare-fun m!916281 () Bool)

(assert (=> b!989139 m!916281))

(declare-fun m!916283 () Bool)

(assert (=> bm!41891 m!916283))

(assert (=> b!989141 m!916279))

(declare-fun m!916285 () Bool)

(assert (=> b!989141 m!916285))

(declare-fun m!916287 () Bool)

(assert (=> b!989141 m!916287))

(assert (=> b!989141 m!916279))

(declare-fun m!916289 () Bool)

(assert (=> b!989141 m!916289))

(assert (=> b!989087 d!117277))

(declare-fun d!117279 () Bool)

(declare-fun res!661565 () Bool)

(declare-fun e!557754 () Bool)

(assert (=> d!117279 (=> res!661565 e!557754)))

(assert (=> d!117279 (= res!661565 (bvsge #b00000000000000000000000000000000 (size!30572 _keys!1544)))))

(assert (=> d!117279 (= (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20813) e!557754)))

(declare-fun b!989152 () Bool)

(declare-fun e!557752 () Bool)

(declare-fun call!41897 () Bool)

(assert (=> b!989152 (= e!557752 call!41897)))

(declare-fun b!989153 () Bool)

(assert (=> b!989153 (= e!557752 call!41897)))

(declare-fun bm!41894 () Bool)

(declare-fun c!100248 () Bool)

(assert (=> bm!41894 (= call!41897 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100248 (Cons!20812 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) Nil!20813) Nil!20813)))))

(declare-fun b!989154 () Bool)

(declare-fun e!557755 () Bool)

(declare-fun contains!5718 (List!20816 (_ BitVec 64)) Bool)

(assert (=> b!989154 (= e!557755 (contains!5718 Nil!20813 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!989155 () Bool)

(declare-fun e!557753 () Bool)

(assert (=> b!989155 (= e!557753 e!557752)))

(assert (=> b!989155 (= c!100248 (validKeyInArray!0 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!989156 () Bool)

(assert (=> b!989156 (= e!557754 e!557753)))

(declare-fun res!661566 () Bool)

(assert (=> b!989156 (=> (not res!661566) (not e!557753))))

(assert (=> b!989156 (= res!661566 (not e!557755))))

(declare-fun res!661564 () Bool)

(assert (=> b!989156 (=> (not res!661564) (not e!557755))))

(assert (=> b!989156 (= res!661564 (validKeyInArray!0 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!117279 (not res!661565)) b!989156))

(assert (= (and b!989156 res!661564) b!989154))

(assert (= (and b!989156 res!661566) b!989155))

(assert (= (and b!989155 c!100248) b!989152))

(assert (= (and b!989155 (not c!100248)) b!989153))

(assert (= (or b!989152 b!989153) bm!41894))

(assert (=> bm!41894 m!916279))

(declare-fun m!916291 () Bool)

(assert (=> bm!41894 m!916291))

(assert (=> b!989154 m!916279))

(assert (=> b!989154 m!916279))

(declare-fun m!916293 () Bool)

(assert (=> b!989154 m!916293))

(assert (=> b!989155 m!916279))

(assert (=> b!989155 m!916279))

(assert (=> b!989155 m!916281))

(assert (=> b!989156 m!916279))

(assert (=> b!989156 m!916279))

(assert (=> b!989156 m!916281))

(assert (=> b!989092 d!117279))

(declare-fun d!117281 () Bool)

(declare-fun e!557758 () Bool)

(assert (=> d!117281 e!557758))

(declare-fun res!661572 () Bool)

(assert (=> d!117281 (=> (not res!661572) (not e!557758))))

(declare-fun lt!438751 () ListLongMap!13583)

(declare-fun contains!5719 (ListLongMap!13583 (_ BitVec 64)) Bool)

(assert (=> d!117281 (= res!661572 (contains!5719 lt!438751 (_1!7454 lt!438713)))))

(declare-fun lt!438748 () List!20815)

(assert (=> d!117281 (= lt!438751 (ListLongMap!13584 lt!438748))))

(declare-fun lt!438749 () Unit!32825)

(declare-fun lt!438750 () Unit!32825)

(assert (=> d!117281 (= lt!438749 lt!438750)))

(declare-datatypes ((Option!519 0))(
  ( (Some!518 (v!14249 V!35995)) (None!517) )
))
(declare-fun getValueByKey!513 (List!20815 (_ BitVec 64)) Option!519)

(assert (=> d!117281 (= (getValueByKey!513 lt!438748 (_1!7454 lt!438713)) (Some!518 (_2!7454 lt!438713)))))

(declare-fun lemmaContainsTupThenGetReturnValue!272 (List!20815 (_ BitVec 64) V!35995) Unit!32825)

(assert (=> d!117281 (= lt!438750 (lemmaContainsTupThenGetReturnValue!272 lt!438748 (_1!7454 lt!438713) (_2!7454 lt!438713)))))

(declare-fun insertStrictlySorted!329 (List!20815 (_ BitVec 64) V!35995) List!20815)

(assert (=> d!117281 (= lt!438748 (insertStrictlySorted!329 (toList!6807 lt!438712) (_1!7454 lt!438713) (_2!7454 lt!438713)))))

(assert (=> d!117281 (= (+!3085 lt!438712 lt!438713) lt!438751)))

(declare-fun b!989161 () Bool)

(declare-fun res!661571 () Bool)

(assert (=> b!989161 (=> (not res!661571) (not e!557758))))

(assert (=> b!989161 (= res!661571 (= (getValueByKey!513 (toList!6807 lt!438751) (_1!7454 lt!438713)) (Some!518 (_2!7454 lt!438713))))))

(declare-fun b!989162 () Bool)

(declare-fun contains!5720 (List!20815 tuple2!14886) Bool)

(assert (=> b!989162 (= e!557758 (contains!5720 (toList!6807 lt!438751) lt!438713))))

(assert (= (and d!117281 res!661572) b!989161))

(assert (= (and b!989161 res!661571) b!989162))

(declare-fun m!916295 () Bool)

(assert (=> d!117281 m!916295))

(declare-fun m!916297 () Bool)

(assert (=> d!117281 m!916297))

(declare-fun m!916299 () Bool)

(assert (=> d!117281 m!916299))

(declare-fun m!916301 () Bool)

(assert (=> d!117281 m!916301))

(declare-fun m!916303 () Bool)

(assert (=> b!989161 m!916303))

(declare-fun m!916305 () Bool)

(assert (=> b!989162 m!916305))

(assert (=> b!989084 d!117281))

(declare-fun d!117283 () Bool)

(assert (=> d!117283 (= (+!3085 (+!3085 lt!438712 (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714)) (+!3085 (+!3085 lt!438712 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714)) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun lt!438754 () Unit!32825)

(declare-fun choose!1610 (ListLongMap!13583 (_ BitVec 64) V!35995 (_ BitVec 64) V!35995) Unit!32825)

(assert (=> d!117283 (= lt!438754 (choose!1610 lt!438712 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30093 _keys!1544) from!1932) lt!438714))))

(assert (=> d!117283 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30093 _keys!1544) from!1932)))))

(assert (=> d!117283 (= (addCommutativeForDiffKeys!708 lt!438712 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30093 _keys!1544) from!1932) lt!438714) lt!438754)))

(declare-fun bs!28076 () Bool)

(assert (= bs!28076 d!117283))

(declare-fun m!916307 () Bool)

(assert (=> bs!28076 m!916307))

(declare-fun m!916309 () Bool)

(assert (=> bs!28076 m!916309))

(declare-fun m!916311 () Bool)

(assert (=> bs!28076 m!916311))

(assert (=> bs!28076 m!916201))

(declare-fun m!916313 () Bool)

(assert (=> bs!28076 m!916313))

(assert (=> bs!28076 m!916307))

(declare-fun m!916315 () Bool)

(assert (=> bs!28076 m!916315))

(assert (=> bs!28076 m!916309))

(assert (=> b!989084 d!117283))

(declare-fun d!117285 () Bool)

(declare-fun e!557759 () Bool)

(assert (=> d!117285 e!557759))

(declare-fun res!661574 () Bool)

(assert (=> d!117285 (=> (not res!661574) (not e!557759))))

(declare-fun lt!438758 () ListLongMap!13583)

(assert (=> d!117285 (= res!661574 (contains!5719 lt!438758 (_1!7454 lt!438711)))))

(declare-fun lt!438755 () List!20815)

(assert (=> d!117285 (= lt!438758 (ListLongMap!13584 lt!438755))))

(declare-fun lt!438756 () Unit!32825)

(declare-fun lt!438757 () Unit!32825)

(assert (=> d!117285 (= lt!438756 lt!438757)))

(assert (=> d!117285 (= (getValueByKey!513 lt!438755 (_1!7454 lt!438711)) (Some!518 (_2!7454 lt!438711)))))

(assert (=> d!117285 (= lt!438757 (lemmaContainsTupThenGetReturnValue!272 lt!438755 (_1!7454 lt!438711) (_2!7454 lt!438711)))))

(assert (=> d!117285 (= lt!438755 (insertStrictlySorted!329 (toList!6807 (getCurrentListMap!3866 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7454 lt!438711) (_2!7454 lt!438711)))))

(assert (=> d!117285 (= (+!3085 (getCurrentListMap!3866 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!438711) lt!438758)))

(declare-fun b!989163 () Bool)

(declare-fun res!661573 () Bool)

(assert (=> b!989163 (=> (not res!661573) (not e!557759))))

(assert (=> b!989163 (= res!661573 (= (getValueByKey!513 (toList!6807 lt!438758) (_1!7454 lt!438711)) (Some!518 (_2!7454 lt!438711))))))

(declare-fun b!989164 () Bool)

(assert (=> b!989164 (= e!557759 (contains!5720 (toList!6807 lt!438758) lt!438711))))

(assert (= (and d!117285 res!661574) b!989163))

(assert (= (and b!989163 res!661573) b!989164))

(declare-fun m!916317 () Bool)

(assert (=> d!117285 m!916317))

(declare-fun m!916319 () Bool)

(assert (=> d!117285 m!916319))

(declare-fun m!916321 () Bool)

(assert (=> d!117285 m!916321))

(declare-fun m!916323 () Bool)

(assert (=> d!117285 m!916323))

(declare-fun m!916325 () Bool)

(assert (=> b!989163 m!916325))

(declare-fun m!916327 () Bool)

(assert (=> b!989164 m!916327))

(assert (=> b!989084 d!117285))

(declare-fun b!989207 () Bool)

(declare-fun e!557787 () ListLongMap!13583)

(declare-fun call!41912 () ListLongMap!13583)

(assert (=> b!989207 (= e!557787 call!41912)))

(declare-fun b!989208 () Bool)

(declare-fun c!100263 () Bool)

(assert (=> b!989208 (= c!100263 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!557789 () ListLongMap!13583)

(assert (=> b!989208 (= e!557789 e!557787)))

(declare-fun b!989209 () Bool)

(declare-fun e!557795 () Bool)

(declare-fun lt!438815 () ListLongMap!13583)

(declare-fun apply!895 (ListLongMap!13583 (_ BitVec 64)) V!35995)

(assert (=> b!989209 (= e!557795 (= (apply!895 lt!438815 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1220))))

(declare-fun bm!41909 () Bool)

(declare-fun call!41915 () ListLongMap!13583)

(assert (=> bm!41909 (= call!41915 (getCurrentListMapNoExtraKeys!3497 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun c!100261 () Bool)

(declare-fun call!41913 () ListLongMap!13583)

(declare-fun call!41917 () ListLongMap!13583)

(declare-fun c!100264 () Bool)

(declare-fun bm!41910 () Bool)

(declare-fun call!41918 () ListLongMap!13583)

(assert (=> bm!41910 (= call!41918 (+!3085 (ite c!100261 call!41915 (ite c!100264 call!41913 call!41917)) (ite (or c!100261 c!100264) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun bm!41911 () Bool)

(assert (=> bm!41911 (= call!41912 call!41918)))

(declare-fun b!989210 () Bool)

(declare-fun res!661598 () Bool)

(declare-fun e!557790 () Bool)

(assert (=> b!989210 (=> (not res!661598) (not e!557790))))

(declare-fun e!557791 () Bool)

(assert (=> b!989210 (= res!661598 e!557791)))

(declare-fun res!661596 () Bool)

(assert (=> b!989210 (=> res!661596 e!557791)))

(declare-fun e!557794 () Bool)

(assert (=> b!989210 (= res!661596 (not e!557794))))

(declare-fun res!661593 () Bool)

(assert (=> b!989210 (=> (not res!661593) (not e!557794))))

(assert (=> b!989210 (= res!661593 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30572 _keys!1544)))))

(declare-fun b!989211 () Bool)

(declare-fun e!557796 () Bool)

(declare-fun call!41916 () Bool)

(assert (=> b!989211 (= e!557796 (not call!41916))))

(declare-fun b!989212 () Bool)

(assert (=> b!989212 (= e!557790 e!557796)))

(declare-fun c!100266 () Bool)

(assert (=> b!989212 (= c!100266 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41912 () Bool)

(assert (=> bm!41912 (= call!41916 (contains!5719 lt!438815 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989213 () Bool)

(declare-fun e!557786 () Bool)

(assert (=> b!989213 (= e!557786 e!557795)))

(declare-fun res!661599 () Bool)

(declare-fun call!41914 () Bool)

(assert (=> b!989213 (= res!661599 call!41914)))

(assert (=> b!989213 (=> (not res!661599) (not e!557795))))

(declare-fun b!989214 () Bool)

(assert (=> b!989214 (= e!557794 (validKeyInArray!0 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!989215 () Bool)

(declare-fun e!557798 () Bool)

(assert (=> b!989215 (= e!557798 (= (apply!895 lt!438815 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15619 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!989215 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30571 _values!1278)))))

(assert (=> b!989215 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30572 _keys!1544)))))

(declare-fun b!989216 () Bool)

(declare-fun e!557788 () Bool)

(assert (=> b!989216 (= e!557788 (= (apply!895 lt!438815 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1220))))

(declare-fun b!989217 () Bool)

(declare-fun e!557797 () Unit!32825)

(declare-fun Unit!32827 () Unit!32825)

(assert (=> b!989217 (= e!557797 Unit!32827)))

(declare-fun b!989218 () Bool)

(declare-fun lt!438823 () Unit!32825)

(assert (=> b!989218 (= e!557797 lt!438823)))

(declare-fun lt!438807 () ListLongMap!13583)

(assert (=> b!989218 (= lt!438807 (getCurrentListMapNoExtraKeys!3497 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438803 () (_ BitVec 64))

(assert (=> b!989218 (= lt!438803 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438804 () (_ BitVec 64))

(assert (=> b!989218 (= lt!438804 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!438824 () Unit!32825)

(declare-fun addStillContains!615 (ListLongMap!13583 (_ BitVec 64) V!35995 (_ BitVec 64)) Unit!32825)

(assert (=> b!989218 (= lt!438824 (addStillContains!615 lt!438807 lt!438803 zeroValue!1220 lt!438804))))

(assert (=> b!989218 (contains!5719 (+!3085 lt!438807 (tuple2!14887 lt!438803 zeroValue!1220)) lt!438804)))

(declare-fun lt!438805 () Unit!32825)

(assert (=> b!989218 (= lt!438805 lt!438824)))

(declare-fun lt!438808 () ListLongMap!13583)

(assert (=> b!989218 (= lt!438808 (getCurrentListMapNoExtraKeys!3497 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438812 () (_ BitVec 64))

(assert (=> b!989218 (= lt!438812 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438821 () (_ BitVec 64))

(assert (=> b!989218 (= lt!438821 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!438820 () Unit!32825)

(declare-fun addApplyDifferent!475 (ListLongMap!13583 (_ BitVec 64) V!35995 (_ BitVec 64)) Unit!32825)

(assert (=> b!989218 (= lt!438820 (addApplyDifferent!475 lt!438808 lt!438812 minValue!1220 lt!438821))))

(assert (=> b!989218 (= (apply!895 (+!3085 lt!438808 (tuple2!14887 lt!438812 minValue!1220)) lt!438821) (apply!895 lt!438808 lt!438821))))

(declare-fun lt!438809 () Unit!32825)

(assert (=> b!989218 (= lt!438809 lt!438820)))

(declare-fun lt!438814 () ListLongMap!13583)

(assert (=> b!989218 (= lt!438814 (getCurrentListMapNoExtraKeys!3497 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438818 () (_ BitVec 64))

(assert (=> b!989218 (= lt!438818 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438822 () (_ BitVec 64))

(assert (=> b!989218 (= lt!438822 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!438810 () Unit!32825)

(assert (=> b!989218 (= lt!438810 (addApplyDifferent!475 lt!438814 lt!438818 zeroValue!1220 lt!438822))))

(assert (=> b!989218 (= (apply!895 (+!3085 lt!438814 (tuple2!14887 lt!438818 zeroValue!1220)) lt!438822) (apply!895 lt!438814 lt!438822))))

(declare-fun lt!438819 () Unit!32825)

(assert (=> b!989218 (= lt!438819 lt!438810)))

(declare-fun lt!438813 () ListLongMap!13583)

(assert (=> b!989218 (= lt!438813 (getCurrentListMapNoExtraKeys!3497 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438811 () (_ BitVec 64))

(assert (=> b!989218 (= lt!438811 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438806 () (_ BitVec 64))

(assert (=> b!989218 (= lt!438806 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!989218 (= lt!438823 (addApplyDifferent!475 lt!438813 lt!438811 minValue!1220 lt!438806))))

(assert (=> b!989218 (= (apply!895 (+!3085 lt!438813 (tuple2!14887 lt!438811 minValue!1220)) lt!438806) (apply!895 lt!438813 lt!438806))))

(declare-fun bm!41913 () Bool)

(assert (=> bm!41913 (= call!41914 (contains!5719 lt!438815 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989219 () Bool)

(assert (=> b!989219 (= e!557791 e!557798)))

(declare-fun res!661601 () Bool)

(assert (=> b!989219 (=> (not res!661601) (not e!557798))))

(assert (=> b!989219 (= res!661601 (contains!5719 lt!438815 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!989219 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30572 _keys!1544)))))

(declare-fun b!989220 () Bool)

(declare-fun res!661594 () Bool)

(assert (=> b!989220 (=> (not res!661594) (not e!557790))))

(assert (=> b!989220 (= res!661594 e!557786)))

(declare-fun c!100262 () Bool)

(assert (=> b!989220 (= c!100262 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!989221 () Bool)

(assert (=> b!989221 (= e!557786 (not call!41914))))

(declare-fun b!989222 () Bool)

(assert (=> b!989222 (= e!557796 e!557788)))

(declare-fun res!661595 () Bool)

(assert (=> b!989222 (= res!661595 call!41916)))

(assert (=> b!989222 (=> (not res!661595) (not e!557788))))

(declare-fun b!989223 () Bool)

(assert (=> b!989223 (= e!557787 call!41917)))

(declare-fun b!989224 () Bool)

(declare-fun e!557793 () ListLongMap!13583)

(assert (=> b!989224 (= e!557793 e!557789)))

(assert (=> b!989224 (= c!100264 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!989225 () Bool)

(assert (=> b!989225 (= e!557793 (+!3085 call!41918 (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun bm!41914 () Bool)

(assert (=> bm!41914 (= call!41917 call!41913)))

(declare-fun bm!41915 () Bool)

(assert (=> bm!41915 (= call!41913 call!41915)))

(declare-fun b!989226 () Bool)

(declare-fun e!557792 () Bool)

(assert (=> b!989226 (= e!557792 (validKeyInArray!0 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!989227 () Bool)

(assert (=> b!989227 (= e!557789 call!41912)))

(declare-fun d!117287 () Bool)

(assert (=> d!117287 e!557790))

(declare-fun res!661600 () Bool)

(assert (=> d!117287 (=> (not res!661600) (not e!557790))))

(assert (=> d!117287 (= res!661600 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30572 _keys!1544)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30572 _keys!1544)))))))

(declare-fun lt!438817 () ListLongMap!13583)

(assert (=> d!117287 (= lt!438815 lt!438817)))

(declare-fun lt!438816 () Unit!32825)

(assert (=> d!117287 (= lt!438816 e!557797)))

(declare-fun c!100265 () Bool)

(assert (=> d!117287 (= c!100265 e!557792)))

(declare-fun res!661597 () Bool)

(assert (=> d!117287 (=> (not res!661597) (not e!557792))))

(assert (=> d!117287 (= res!661597 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30572 _keys!1544)))))

(assert (=> d!117287 (= lt!438817 e!557793)))

(assert (=> d!117287 (= c!100261 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!117287 (validMask!0 mask!1948)))

(assert (=> d!117287 (= (getCurrentListMap!3866 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!438815)))

(assert (= (and d!117287 c!100261) b!989225))

(assert (= (and d!117287 (not c!100261)) b!989224))

(assert (= (and b!989224 c!100264) b!989227))

(assert (= (and b!989224 (not c!100264)) b!989208))

(assert (= (and b!989208 c!100263) b!989207))

(assert (= (and b!989208 (not c!100263)) b!989223))

(assert (= (or b!989207 b!989223) bm!41914))

(assert (= (or b!989227 bm!41914) bm!41915))

(assert (= (or b!989227 b!989207) bm!41911))

(assert (= (or b!989225 bm!41915) bm!41909))

(assert (= (or b!989225 bm!41911) bm!41910))

(assert (= (and d!117287 res!661597) b!989226))

(assert (= (and d!117287 c!100265) b!989218))

(assert (= (and d!117287 (not c!100265)) b!989217))

(assert (= (and d!117287 res!661600) b!989210))

(assert (= (and b!989210 res!661593) b!989214))

(assert (= (and b!989210 (not res!661596)) b!989219))

(assert (= (and b!989219 res!661601) b!989215))

(assert (= (and b!989210 res!661598) b!989220))

(assert (= (and b!989220 c!100262) b!989213))

(assert (= (and b!989220 (not c!100262)) b!989221))

(assert (= (and b!989213 res!661599) b!989209))

(assert (= (or b!989213 b!989221) bm!41913))

(assert (= (and b!989220 res!661594) b!989212))

(assert (= (and b!989212 c!100266) b!989222))

(assert (= (and b!989212 (not c!100266)) b!989211))

(assert (= (and b!989222 res!661595) b!989216))

(assert (= (or b!989222 b!989211) bm!41912))

(declare-fun b_lambda!15105 () Bool)

(assert (=> (not b_lambda!15105) (not b!989215)))

(assert (=> b!989215 t!29769))

(declare-fun b_and!32163 () Bool)

(assert (= b_and!32157 (and (=> t!29769 result!13607) b_and!32163)))

(declare-fun m!916329 () Bool)

(assert (=> b!989219 m!916329))

(assert (=> b!989219 m!916329))

(declare-fun m!916331 () Bool)

(assert (=> b!989219 m!916331))

(declare-fun m!916333 () Bool)

(assert (=> b!989216 m!916333))

(declare-fun m!916335 () Bool)

(assert (=> b!989209 m!916335))

(declare-fun m!916337 () Bool)

(assert (=> b!989218 m!916337))

(declare-fun m!916339 () Bool)

(assert (=> b!989218 m!916339))

(declare-fun m!916341 () Bool)

(assert (=> b!989218 m!916341))

(declare-fun m!916343 () Bool)

(assert (=> b!989218 m!916343))

(assert (=> b!989218 m!916329))

(declare-fun m!916345 () Bool)

(assert (=> b!989218 m!916345))

(assert (=> b!989218 m!916207))

(declare-fun m!916347 () Bool)

(assert (=> b!989218 m!916347))

(declare-fun m!916349 () Bool)

(assert (=> b!989218 m!916349))

(declare-fun m!916351 () Bool)

(assert (=> b!989218 m!916351))

(declare-fun m!916353 () Bool)

(assert (=> b!989218 m!916353))

(assert (=> b!989218 m!916337))

(declare-fun m!916355 () Bool)

(assert (=> b!989218 m!916355))

(declare-fun m!916357 () Bool)

(assert (=> b!989218 m!916357))

(declare-fun m!916359 () Bool)

(assert (=> b!989218 m!916359))

(declare-fun m!916361 () Bool)

(assert (=> b!989218 m!916361))

(assert (=> b!989218 m!916351))

(assert (=> b!989218 m!916341))

(declare-fun m!916363 () Bool)

(assert (=> b!989218 m!916363))

(assert (=> b!989218 m!916345))

(declare-fun m!916365 () Bool)

(assert (=> b!989218 m!916365))

(assert (=> d!117287 m!916217))

(declare-fun m!916367 () Bool)

(assert (=> bm!41913 m!916367))

(assert (=> b!989215 m!916329))

(declare-fun m!916369 () Bool)

(assert (=> b!989215 m!916369))

(assert (=> b!989215 m!916329))

(declare-fun m!916371 () Bool)

(assert (=> b!989215 m!916371))

(assert (=> b!989215 m!916371))

(assert (=> b!989215 m!916209))

(declare-fun m!916373 () Bool)

(assert (=> b!989215 m!916373))

(assert (=> b!989215 m!916209))

(assert (=> b!989226 m!916329))

(assert (=> b!989226 m!916329))

(declare-fun m!916375 () Bool)

(assert (=> b!989226 m!916375))

(assert (=> b!989214 m!916329))

(assert (=> b!989214 m!916329))

(assert (=> b!989214 m!916375))

(assert (=> bm!41909 m!916207))

(declare-fun m!916377 () Bool)

(assert (=> bm!41910 m!916377))

(declare-fun m!916379 () Bool)

(assert (=> b!989225 m!916379))

(declare-fun m!916381 () Bool)

(assert (=> bm!41912 m!916381))

(assert (=> b!989084 d!117287))

(declare-fun d!117289 () Bool)

(declare-fun e!557799 () Bool)

(assert (=> d!117289 e!557799))

(declare-fun res!661603 () Bool)

(assert (=> d!117289 (=> (not res!661603) (not e!557799))))

(declare-fun lt!438828 () ListLongMap!13583)

(assert (=> d!117289 (= res!661603 (contains!5719 lt!438828 (_1!7454 lt!438711)))))

(declare-fun lt!438825 () List!20815)

(assert (=> d!117289 (= lt!438828 (ListLongMap!13584 lt!438825))))

(declare-fun lt!438826 () Unit!32825)

(declare-fun lt!438827 () Unit!32825)

(assert (=> d!117289 (= lt!438826 lt!438827)))

(assert (=> d!117289 (= (getValueByKey!513 lt!438825 (_1!7454 lt!438711)) (Some!518 (_2!7454 lt!438711)))))

(assert (=> d!117289 (= lt!438827 (lemmaContainsTupThenGetReturnValue!272 lt!438825 (_1!7454 lt!438711) (_2!7454 lt!438711)))))

(assert (=> d!117289 (= lt!438825 (insertStrictlySorted!329 (toList!6807 lt!438712) (_1!7454 lt!438711) (_2!7454 lt!438711)))))

(assert (=> d!117289 (= (+!3085 lt!438712 lt!438711) lt!438828)))

(declare-fun b!989228 () Bool)

(declare-fun res!661602 () Bool)

(assert (=> b!989228 (=> (not res!661602) (not e!557799))))

(assert (=> b!989228 (= res!661602 (= (getValueByKey!513 (toList!6807 lt!438828) (_1!7454 lt!438711)) (Some!518 (_2!7454 lt!438711))))))

(declare-fun b!989229 () Bool)

(assert (=> b!989229 (= e!557799 (contains!5720 (toList!6807 lt!438828) lt!438711))))

(assert (= (and d!117289 res!661603) b!989228))

(assert (= (and b!989228 res!661602) b!989229))

(declare-fun m!916383 () Bool)

(assert (=> d!117289 m!916383))

(declare-fun m!916385 () Bool)

(assert (=> d!117289 m!916385))

(declare-fun m!916387 () Bool)

(assert (=> d!117289 m!916387))

(declare-fun m!916389 () Bool)

(assert (=> d!117289 m!916389))

(declare-fun m!916391 () Bool)

(assert (=> b!989228 m!916391))

(declare-fun m!916393 () Bool)

(assert (=> b!989229 m!916393))

(assert (=> b!989084 d!117289))

(declare-fun d!117291 () Bool)

(declare-fun e!557800 () Bool)

(assert (=> d!117291 e!557800))

(declare-fun res!661605 () Bool)

(assert (=> d!117291 (=> (not res!661605) (not e!557800))))

(declare-fun lt!438832 () ListLongMap!13583)

(assert (=> d!117291 (= res!661605 (contains!5719 lt!438832 (_1!7454 lt!438713)))))

(declare-fun lt!438829 () List!20815)

(assert (=> d!117291 (= lt!438832 (ListLongMap!13584 lt!438829))))

(declare-fun lt!438830 () Unit!32825)

(declare-fun lt!438831 () Unit!32825)

(assert (=> d!117291 (= lt!438830 lt!438831)))

(assert (=> d!117291 (= (getValueByKey!513 lt!438829 (_1!7454 lt!438713)) (Some!518 (_2!7454 lt!438713)))))

(assert (=> d!117291 (= lt!438831 (lemmaContainsTupThenGetReturnValue!272 lt!438829 (_1!7454 lt!438713) (_2!7454 lt!438713)))))

(assert (=> d!117291 (= lt!438829 (insertStrictlySorted!329 (toList!6807 (+!3085 lt!438712 lt!438711)) (_1!7454 lt!438713) (_2!7454 lt!438713)))))

(assert (=> d!117291 (= (+!3085 (+!3085 lt!438712 lt!438711) lt!438713) lt!438832)))

(declare-fun b!989230 () Bool)

(declare-fun res!661604 () Bool)

(assert (=> b!989230 (=> (not res!661604) (not e!557800))))

(assert (=> b!989230 (= res!661604 (= (getValueByKey!513 (toList!6807 lt!438832) (_1!7454 lt!438713)) (Some!518 (_2!7454 lt!438713))))))

(declare-fun b!989231 () Bool)

(assert (=> b!989231 (= e!557800 (contains!5720 (toList!6807 lt!438832) lt!438713))))

(assert (= (and d!117291 res!661605) b!989230))

(assert (= (and b!989230 res!661604) b!989231))

(declare-fun m!916395 () Bool)

(assert (=> d!117291 m!916395))

(declare-fun m!916397 () Bool)

(assert (=> d!117291 m!916397))

(declare-fun m!916399 () Bool)

(assert (=> d!117291 m!916399))

(declare-fun m!916401 () Bool)

(assert (=> d!117291 m!916401))

(declare-fun m!916403 () Bool)

(assert (=> b!989230 m!916403))

(declare-fun m!916405 () Bool)

(assert (=> b!989231 m!916405))

(assert (=> b!989084 d!117291))

(declare-fun b!989232 () Bool)

(declare-fun e!557802 () ListLongMap!13583)

(declare-fun call!41919 () ListLongMap!13583)

(assert (=> b!989232 (= e!557802 call!41919)))

(declare-fun b!989233 () Bool)

(declare-fun c!100269 () Bool)

(assert (=> b!989233 (= c!100269 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!557804 () ListLongMap!13583)

(assert (=> b!989233 (= e!557804 e!557802)))

(declare-fun b!989234 () Bool)

(declare-fun e!557810 () Bool)

(declare-fun lt!438845 () ListLongMap!13583)

(assert (=> b!989234 (= e!557810 (= (apply!895 lt!438845 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1220))))

(declare-fun call!41922 () ListLongMap!13583)

(declare-fun bm!41916 () Bool)

(assert (=> bm!41916 (= call!41922 (getCurrentListMapNoExtraKeys!3497 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun bm!41917 () Bool)

(declare-fun call!41920 () ListLongMap!13583)

(declare-fun call!41925 () ListLongMap!13583)

(declare-fun c!100270 () Bool)

(declare-fun call!41924 () ListLongMap!13583)

(declare-fun c!100267 () Bool)

(assert (=> bm!41917 (= call!41925 (+!3085 (ite c!100267 call!41922 (ite c!100270 call!41920 call!41924)) (ite (or c!100267 c!100270) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun bm!41918 () Bool)

(assert (=> bm!41918 (= call!41919 call!41925)))

(declare-fun b!989235 () Bool)

(declare-fun res!661611 () Bool)

(declare-fun e!557805 () Bool)

(assert (=> b!989235 (=> (not res!661611) (not e!557805))))

(declare-fun e!557806 () Bool)

(assert (=> b!989235 (= res!661611 e!557806)))

(declare-fun res!661609 () Bool)

(assert (=> b!989235 (=> res!661609 e!557806)))

(declare-fun e!557809 () Bool)

(assert (=> b!989235 (= res!661609 (not e!557809))))

(declare-fun res!661606 () Bool)

(assert (=> b!989235 (=> (not res!661606) (not e!557809))))

(assert (=> b!989235 (= res!661606 (bvslt from!1932 (size!30572 _keys!1544)))))

(declare-fun b!989236 () Bool)

(declare-fun e!557811 () Bool)

(declare-fun call!41923 () Bool)

(assert (=> b!989236 (= e!557811 (not call!41923))))

(declare-fun b!989237 () Bool)

(assert (=> b!989237 (= e!557805 e!557811)))

(declare-fun c!100272 () Bool)

(assert (=> b!989237 (= c!100272 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41919 () Bool)

(assert (=> bm!41919 (= call!41923 (contains!5719 lt!438845 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989238 () Bool)

(declare-fun e!557801 () Bool)

(assert (=> b!989238 (= e!557801 e!557810)))

(declare-fun res!661612 () Bool)

(declare-fun call!41921 () Bool)

(assert (=> b!989238 (= res!661612 call!41921)))

(assert (=> b!989238 (=> (not res!661612) (not e!557810))))

(declare-fun b!989239 () Bool)

(assert (=> b!989239 (= e!557809 (validKeyInArray!0 (select (arr!30093 _keys!1544) from!1932)))))

(declare-fun e!557813 () Bool)

(declare-fun b!989240 () Bool)

(assert (=> b!989240 (= e!557813 (= (apply!895 lt!438845 (select (arr!30093 _keys!1544) from!1932)) (get!15619 (select (arr!30092 _values!1278) from!1932) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!989240 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30571 _values!1278)))))

(assert (=> b!989240 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30572 _keys!1544)))))

(declare-fun b!989241 () Bool)

(declare-fun e!557803 () Bool)

(assert (=> b!989241 (= e!557803 (= (apply!895 lt!438845 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1220))))

(declare-fun b!989242 () Bool)

(declare-fun e!557812 () Unit!32825)

(declare-fun Unit!32828 () Unit!32825)

(assert (=> b!989242 (= e!557812 Unit!32828)))

(declare-fun b!989243 () Bool)

(declare-fun lt!438853 () Unit!32825)

(assert (=> b!989243 (= e!557812 lt!438853)))

(declare-fun lt!438837 () ListLongMap!13583)

(assert (=> b!989243 (= lt!438837 (getCurrentListMapNoExtraKeys!3497 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!438833 () (_ BitVec 64))

(assert (=> b!989243 (= lt!438833 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438834 () (_ BitVec 64))

(assert (=> b!989243 (= lt!438834 (select (arr!30093 _keys!1544) from!1932))))

(declare-fun lt!438854 () Unit!32825)

(assert (=> b!989243 (= lt!438854 (addStillContains!615 lt!438837 lt!438833 zeroValue!1220 lt!438834))))

(assert (=> b!989243 (contains!5719 (+!3085 lt!438837 (tuple2!14887 lt!438833 zeroValue!1220)) lt!438834)))

(declare-fun lt!438835 () Unit!32825)

(assert (=> b!989243 (= lt!438835 lt!438854)))

(declare-fun lt!438838 () ListLongMap!13583)

(assert (=> b!989243 (= lt!438838 (getCurrentListMapNoExtraKeys!3497 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!438842 () (_ BitVec 64))

(assert (=> b!989243 (= lt!438842 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438851 () (_ BitVec 64))

(assert (=> b!989243 (= lt!438851 (select (arr!30093 _keys!1544) from!1932))))

(declare-fun lt!438850 () Unit!32825)

(assert (=> b!989243 (= lt!438850 (addApplyDifferent!475 lt!438838 lt!438842 minValue!1220 lt!438851))))

(assert (=> b!989243 (= (apply!895 (+!3085 lt!438838 (tuple2!14887 lt!438842 minValue!1220)) lt!438851) (apply!895 lt!438838 lt!438851))))

(declare-fun lt!438839 () Unit!32825)

(assert (=> b!989243 (= lt!438839 lt!438850)))

(declare-fun lt!438844 () ListLongMap!13583)

(assert (=> b!989243 (= lt!438844 (getCurrentListMapNoExtraKeys!3497 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!438848 () (_ BitVec 64))

(assert (=> b!989243 (= lt!438848 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438852 () (_ BitVec 64))

(assert (=> b!989243 (= lt!438852 (select (arr!30093 _keys!1544) from!1932))))

(declare-fun lt!438840 () Unit!32825)

(assert (=> b!989243 (= lt!438840 (addApplyDifferent!475 lt!438844 lt!438848 zeroValue!1220 lt!438852))))

(assert (=> b!989243 (= (apply!895 (+!3085 lt!438844 (tuple2!14887 lt!438848 zeroValue!1220)) lt!438852) (apply!895 lt!438844 lt!438852))))

(declare-fun lt!438849 () Unit!32825)

(assert (=> b!989243 (= lt!438849 lt!438840)))

(declare-fun lt!438843 () ListLongMap!13583)

(assert (=> b!989243 (= lt!438843 (getCurrentListMapNoExtraKeys!3497 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!438841 () (_ BitVec 64))

(assert (=> b!989243 (= lt!438841 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438836 () (_ BitVec 64))

(assert (=> b!989243 (= lt!438836 (select (arr!30093 _keys!1544) from!1932))))

(assert (=> b!989243 (= lt!438853 (addApplyDifferent!475 lt!438843 lt!438841 minValue!1220 lt!438836))))

(assert (=> b!989243 (= (apply!895 (+!3085 lt!438843 (tuple2!14887 lt!438841 minValue!1220)) lt!438836) (apply!895 lt!438843 lt!438836))))

(declare-fun bm!41920 () Bool)

(assert (=> bm!41920 (= call!41921 (contains!5719 lt!438845 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989244 () Bool)

(assert (=> b!989244 (= e!557806 e!557813)))

(declare-fun res!661614 () Bool)

(assert (=> b!989244 (=> (not res!661614) (not e!557813))))

(assert (=> b!989244 (= res!661614 (contains!5719 lt!438845 (select (arr!30093 _keys!1544) from!1932)))))

(assert (=> b!989244 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30572 _keys!1544)))))

(declare-fun b!989245 () Bool)

(declare-fun res!661607 () Bool)

(assert (=> b!989245 (=> (not res!661607) (not e!557805))))

(assert (=> b!989245 (= res!661607 e!557801)))

(declare-fun c!100268 () Bool)

(assert (=> b!989245 (= c!100268 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!989246 () Bool)

(assert (=> b!989246 (= e!557801 (not call!41921))))

(declare-fun b!989247 () Bool)

(assert (=> b!989247 (= e!557811 e!557803)))

(declare-fun res!661608 () Bool)

(assert (=> b!989247 (= res!661608 call!41923)))

(assert (=> b!989247 (=> (not res!661608) (not e!557803))))

(declare-fun b!989248 () Bool)

(assert (=> b!989248 (= e!557802 call!41924)))

(declare-fun b!989249 () Bool)

(declare-fun e!557808 () ListLongMap!13583)

(assert (=> b!989249 (= e!557808 e!557804)))

(assert (=> b!989249 (= c!100270 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!989250 () Bool)

(assert (=> b!989250 (= e!557808 (+!3085 call!41925 (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun bm!41921 () Bool)

(assert (=> bm!41921 (= call!41924 call!41920)))

(declare-fun bm!41922 () Bool)

(assert (=> bm!41922 (= call!41920 call!41922)))

(declare-fun b!989251 () Bool)

(declare-fun e!557807 () Bool)

(assert (=> b!989251 (= e!557807 (validKeyInArray!0 (select (arr!30093 _keys!1544) from!1932)))))

(declare-fun b!989252 () Bool)

(assert (=> b!989252 (= e!557804 call!41919)))

(declare-fun d!117293 () Bool)

(assert (=> d!117293 e!557805))

(declare-fun res!661613 () Bool)

(assert (=> d!117293 (=> (not res!661613) (not e!557805))))

(assert (=> d!117293 (= res!661613 (or (bvsge from!1932 (size!30572 _keys!1544)) (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30572 _keys!1544)))))))

(declare-fun lt!438847 () ListLongMap!13583)

(assert (=> d!117293 (= lt!438845 lt!438847)))

(declare-fun lt!438846 () Unit!32825)

(assert (=> d!117293 (= lt!438846 e!557812)))

(declare-fun c!100271 () Bool)

(assert (=> d!117293 (= c!100271 e!557807)))

(declare-fun res!661610 () Bool)

(assert (=> d!117293 (=> (not res!661610) (not e!557807))))

(assert (=> d!117293 (= res!661610 (bvslt from!1932 (size!30572 _keys!1544)))))

(assert (=> d!117293 (= lt!438847 e!557808)))

(assert (=> d!117293 (= c!100267 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!117293 (validMask!0 mask!1948)))

(assert (=> d!117293 (= (getCurrentListMap!3866 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) lt!438845)))

(assert (= (and d!117293 c!100267) b!989250))

(assert (= (and d!117293 (not c!100267)) b!989249))

(assert (= (and b!989249 c!100270) b!989252))

(assert (= (and b!989249 (not c!100270)) b!989233))

(assert (= (and b!989233 c!100269) b!989232))

(assert (= (and b!989233 (not c!100269)) b!989248))

(assert (= (or b!989232 b!989248) bm!41921))

(assert (= (or b!989252 bm!41921) bm!41922))

(assert (= (or b!989252 b!989232) bm!41918))

(assert (= (or b!989250 bm!41922) bm!41916))

(assert (= (or b!989250 bm!41918) bm!41917))

(assert (= (and d!117293 res!661610) b!989251))

(assert (= (and d!117293 c!100271) b!989243))

(assert (= (and d!117293 (not c!100271)) b!989242))

(assert (= (and d!117293 res!661613) b!989235))

(assert (= (and b!989235 res!661606) b!989239))

(assert (= (and b!989235 (not res!661609)) b!989244))

(assert (= (and b!989244 res!661614) b!989240))

(assert (= (and b!989235 res!661611) b!989245))

(assert (= (and b!989245 c!100268) b!989238))

(assert (= (and b!989245 (not c!100268)) b!989246))

(assert (= (and b!989238 res!661612) b!989234))

(assert (= (or b!989238 b!989246) bm!41920))

(assert (= (and b!989245 res!661607) b!989237))

(assert (= (and b!989237 c!100272) b!989247))

(assert (= (and b!989237 (not c!100272)) b!989236))

(assert (= (and b!989247 res!661608) b!989241))

(assert (= (or b!989247 b!989236) bm!41919))

(declare-fun b_lambda!15107 () Bool)

(assert (=> (not b_lambda!15107) (not b!989240)))

(assert (=> b!989240 t!29769))

(declare-fun b_and!32165 () Bool)

(assert (= b_and!32163 (and (=> t!29769 result!13607) b_and!32165)))

(assert (=> b!989244 m!916201))

(assert (=> b!989244 m!916201))

(declare-fun m!916407 () Bool)

(assert (=> b!989244 m!916407))

(declare-fun m!916409 () Bool)

(assert (=> b!989241 m!916409))

(declare-fun m!916411 () Bool)

(assert (=> b!989234 m!916411))

(declare-fun m!916413 () Bool)

(assert (=> b!989243 m!916413))

(declare-fun m!916415 () Bool)

(assert (=> b!989243 m!916415))

(declare-fun m!916417 () Bool)

(assert (=> b!989243 m!916417))

(declare-fun m!916419 () Bool)

(assert (=> b!989243 m!916419))

(assert (=> b!989243 m!916201))

(declare-fun m!916421 () Bool)

(assert (=> b!989243 m!916421))

(declare-fun m!916423 () Bool)

(assert (=> b!989243 m!916423))

(declare-fun m!916425 () Bool)

(assert (=> b!989243 m!916425))

(declare-fun m!916427 () Bool)

(assert (=> b!989243 m!916427))

(declare-fun m!916429 () Bool)

(assert (=> b!989243 m!916429))

(declare-fun m!916431 () Bool)

(assert (=> b!989243 m!916431))

(assert (=> b!989243 m!916413))

(declare-fun m!916433 () Bool)

(assert (=> b!989243 m!916433))

(declare-fun m!916435 () Bool)

(assert (=> b!989243 m!916435))

(declare-fun m!916437 () Bool)

(assert (=> b!989243 m!916437))

(declare-fun m!916439 () Bool)

(assert (=> b!989243 m!916439))

(assert (=> b!989243 m!916429))

(assert (=> b!989243 m!916417))

(declare-fun m!916441 () Bool)

(assert (=> b!989243 m!916441))

(assert (=> b!989243 m!916421))

(declare-fun m!916443 () Bool)

(assert (=> b!989243 m!916443))

(assert (=> d!117293 m!916217))

(declare-fun m!916445 () Bool)

(assert (=> bm!41920 m!916445))

(assert (=> b!989240 m!916201))

(declare-fun m!916447 () Bool)

(assert (=> b!989240 m!916447))

(assert (=> b!989240 m!916201))

(assert (=> b!989240 m!916205))

(assert (=> b!989240 m!916205))

(assert (=> b!989240 m!916209))

(assert (=> b!989240 m!916211))

(assert (=> b!989240 m!916209))

(assert (=> b!989251 m!916201))

(assert (=> b!989251 m!916201))

(assert (=> b!989251 m!916203))

(assert (=> b!989239 m!916201))

(assert (=> b!989239 m!916201))

(assert (=> b!989239 m!916203))

(assert (=> bm!41916 m!916423))

(declare-fun m!916449 () Bool)

(assert (=> bm!41917 m!916449))

(declare-fun m!916451 () Bool)

(assert (=> b!989250 m!916451))

(declare-fun m!916453 () Bool)

(assert (=> bm!41919 m!916453))

(assert (=> b!989084 d!117293))

(declare-fun d!117295 () Bool)

(declare-fun e!557814 () Bool)

(assert (=> d!117295 e!557814))

(declare-fun res!661616 () Bool)

(assert (=> d!117295 (=> (not res!661616) (not e!557814))))

(declare-fun lt!438858 () ListLongMap!13583)

(assert (=> d!117295 (= res!661616 (contains!5719 lt!438858 (_1!7454 lt!438711)))))

(declare-fun lt!438855 () List!20815)

(assert (=> d!117295 (= lt!438858 (ListLongMap!13584 lt!438855))))

(declare-fun lt!438856 () Unit!32825)

(declare-fun lt!438857 () Unit!32825)

(assert (=> d!117295 (= lt!438856 lt!438857)))

(assert (=> d!117295 (= (getValueByKey!513 lt!438855 (_1!7454 lt!438711)) (Some!518 (_2!7454 lt!438711)))))

(assert (=> d!117295 (= lt!438857 (lemmaContainsTupThenGetReturnValue!272 lt!438855 (_1!7454 lt!438711) (_2!7454 lt!438711)))))

(assert (=> d!117295 (= lt!438855 (insertStrictlySorted!329 (toList!6807 (+!3085 lt!438712 lt!438713)) (_1!7454 lt!438711) (_2!7454 lt!438711)))))

(assert (=> d!117295 (= (+!3085 (+!3085 lt!438712 lt!438713) lt!438711) lt!438858)))

(declare-fun b!989253 () Bool)

(declare-fun res!661615 () Bool)

(assert (=> b!989253 (=> (not res!661615) (not e!557814))))

(assert (=> b!989253 (= res!661615 (= (getValueByKey!513 (toList!6807 lt!438858) (_1!7454 lt!438711)) (Some!518 (_2!7454 lt!438711))))))

(declare-fun b!989254 () Bool)

(assert (=> b!989254 (= e!557814 (contains!5720 (toList!6807 lt!438858) lt!438711))))

(assert (= (and d!117295 res!661616) b!989253))

(assert (= (and b!989253 res!661615) b!989254))

(declare-fun m!916455 () Bool)

(assert (=> d!117295 m!916455))

(declare-fun m!916457 () Bool)

(assert (=> d!117295 m!916457))

(declare-fun m!916459 () Bool)

(assert (=> d!117295 m!916459))

(declare-fun m!916461 () Bool)

(assert (=> d!117295 m!916461))

(declare-fun m!916463 () Bool)

(assert (=> b!989253 m!916463))

(declare-fun m!916465 () Bool)

(assert (=> b!989254 m!916465))

(assert (=> b!989084 d!117295))

(declare-fun d!117297 () Bool)

(assert (=> d!117297 (= (validKeyInArray!0 (select (arr!30093 _keys!1544) from!1932)) (and (not (= (select (arr!30093 _keys!1544) from!1932) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30093 _keys!1544) from!1932) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!989088 d!117297))

(declare-fun d!117299 () Bool)

(declare-fun c!100275 () Bool)

(assert (=> d!117299 (= c!100275 ((_ is ValueCellFull!11148) (select (arr!30092 _values!1278) from!1932)))))

(declare-fun e!557817 () V!35995)

(assert (=> d!117299 (= (get!15619 (select (arr!30092 _values!1278) from!1932) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!557817)))

(declare-fun b!989259 () Bool)

(declare-fun get!15621 (ValueCell!11148 V!35995) V!35995)

(assert (=> b!989259 (= e!557817 (get!15621 (select (arr!30092 _values!1278) from!1932) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!989260 () Bool)

(declare-fun get!15622 (ValueCell!11148 V!35995) V!35995)

(assert (=> b!989260 (= e!557817 (get!15622 (select (arr!30092 _values!1278) from!1932) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117299 c!100275) b!989259))

(assert (= (and d!117299 (not c!100275)) b!989260))

(assert (=> b!989259 m!916205))

(assert (=> b!989259 m!916209))

(declare-fun m!916467 () Bool)

(assert (=> b!989259 m!916467))

(assert (=> b!989260 m!916205))

(assert (=> b!989260 m!916209))

(declare-fun m!916469 () Bool)

(assert (=> b!989260 m!916469))

(assert (=> b!989089 d!117299))

(declare-fun b!989285 () Bool)

(declare-fun e!557832 () Bool)

(declare-fun e!557837 () Bool)

(assert (=> b!989285 (= e!557832 e!557837)))

(declare-fun c!100284 () Bool)

(assert (=> b!989285 (= c!100284 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30572 _keys!1544)))))

(declare-fun b!989286 () Bool)

(declare-fun e!557836 () ListLongMap!13583)

(assert (=> b!989286 (= e!557836 (ListLongMap!13584 Nil!20812))))

(declare-fun b!989287 () Bool)

(declare-fun lt!438873 () Unit!32825)

(declare-fun lt!438874 () Unit!32825)

(assert (=> b!989287 (= lt!438873 lt!438874)))

(declare-fun lt!438876 () V!35995)

(declare-fun lt!438879 () (_ BitVec 64))

(declare-fun lt!438877 () (_ BitVec 64))

(declare-fun lt!438878 () ListLongMap!13583)

(assert (=> b!989287 (not (contains!5719 (+!3085 lt!438878 (tuple2!14887 lt!438879 lt!438876)) lt!438877))))

(declare-fun addStillNotContains!234 (ListLongMap!13583 (_ BitVec 64) V!35995 (_ BitVec 64)) Unit!32825)

(assert (=> b!989287 (= lt!438874 (addStillNotContains!234 lt!438878 lt!438879 lt!438876 lt!438877))))

(assert (=> b!989287 (= lt!438877 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!989287 (= lt!438876 (get!15619 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!989287 (= lt!438879 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun call!41928 () ListLongMap!13583)

(assert (=> b!989287 (= lt!438878 call!41928)))

(declare-fun e!557838 () ListLongMap!13583)

(assert (=> b!989287 (= e!557838 (+!3085 call!41928 (tuple2!14887 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15619 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!989288 () Bool)

(declare-fun e!557834 () Bool)

(assert (=> b!989288 (= e!557832 e!557834)))

(assert (=> b!989288 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30572 _keys!1544)))))

(declare-fun lt!438875 () ListLongMap!13583)

(declare-fun res!661626 () Bool)

(assert (=> b!989288 (= res!661626 (contains!5719 lt!438875 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!989288 (=> (not res!661626) (not e!557834))))

(declare-fun b!989289 () Bool)

(assert (=> b!989289 (= e!557836 e!557838)))

(declare-fun c!100287 () Bool)

(assert (=> b!989289 (= c!100287 (validKeyInArray!0 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun bm!41925 () Bool)

(assert (=> bm!41925 (= call!41928 (getCurrentListMapNoExtraKeys!3497 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!989290 () Bool)

(declare-fun res!661628 () Bool)

(declare-fun e!557833 () Bool)

(assert (=> b!989290 (=> (not res!661628) (not e!557833))))

(assert (=> b!989290 (= res!661628 (not (contains!5719 lt!438875 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!989291 () Bool)

(assert (=> b!989291 (= e!557838 call!41928)))

(declare-fun b!989292 () Bool)

(assert (=> b!989292 (= e!557837 (= lt!438875 (getCurrentListMapNoExtraKeys!3497 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun b!989293 () Bool)

(assert (=> b!989293 (= e!557833 e!557832)))

(declare-fun c!100285 () Bool)

(declare-fun e!557835 () Bool)

(assert (=> b!989293 (= c!100285 e!557835)))

(declare-fun res!661627 () Bool)

(assert (=> b!989293 (=> (not res!661627) (not e!557835))))

(assert (=> b!989293 (= res!661627 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30572 _keys!1544)))))

(declare-fun b!989295 () Bool)

(assert (=> b!989295 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30572 _keys!1544)))))

(assert (=> b!989295 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30571 _values!1278)))))

(assert (=> b!989295 (= e!557834 (= (apply!895 lt!438875 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15619 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!989296 () Bool)

(declare-fun isEmpty!723 (ListLongMap!13583) Bool)

(assert (=> b!989296 (= e!557837 (isEmpty!723 lt!438875))))

(declare-fun d!117301 () Bool)

(assert (=> d!117301 e!557833))

(declare-fun res!661625 () Bool)

(assert (=> d!117301 (=> (not res!661625) (not e!557833))))

(assert (=> d!117301 (= res!661625 (not (contains!5719 lt!438875 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117301 (= lt!438875 e!557836)))

(declare-fun c!100286 () Bool)

(assert (=> d!117301 (= c!100286 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30572 _keys!1544)))))

(assert (=> d!117301 (validMask!0 mask!1948)))

(assert (=> d!117301 (= (getCurrentListMapNoExtraKeys!3497 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!438875)))

(declare-fun b!989294 () Bool)

(assert (=> b!989294 (= e!557835 (validKeyInArray!0 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!989294 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))

(assert (= (and d!117301 c!100286) b!989286))

(assert (= (and d!117301 (not c!100286)) b!989289))

(assert (= (and b!989289 c!100287) b!989287))

(assert (= (and b!989289 (not c!100287)) b!989291))

(assert (= (or b!989287 b!989291) bm!41925))

(assert (= (and d!117301 res!661625) b!989290))

(assert (= (and b!989290 res!661628) b!989293))

(assert (= (and b!989293 res!661627) b!989294))

(assert (= (and b!989293 c!100285) b!989288))

(assert (= (and b!989293 (not c!100285)) b!989285))

(assert (= (and b!989288 res!661626) b!989295))

(assert (= (and b!989285 c!100284) b!989292))

(assert (= (and b!989285 (not c!100284)) b!989296))

(declare-fun b_lambda!15109 () Bool)

(assert (=> (not b_lambda!15109) (not b!989287)))

(assert (=> b!989287 t!29769))

(declare-fun b_and!32167 () Bool)

(assert (= b_and!32165 (and (=> t!29769 result!13607) b_and!32167)))

(declare-fun b_lambda!15111 () Bool)

(assert (=> (not b_lambda!15111) (not b!989295)))

(assert (=> b!989295 t!29769))

(declare-fun b_and!32169 () Bool)

(assert (= b_and!32167 (and (=> t!29769 result!13607) b_and!32169)))

(declare-fun m!916471 () Bool)

(assert (=> d!117301 m!916471))

(assert (=> d!117301 m!916217))

(declare-fun m!916473 () Bool)

(assert (=> bm!41925 m!916473))

(declare-fun m!916475 () Bool)

(assert (=> b!989290 m!916475))

(assert (=> b!989292 m!916473))

(assert (=> b!989289 m!916329))

(assert (=> b!989289 m!916329))

(assert (=> b!989289 m!916375))

(assert (=> b!989288 m!916329))

(assert (=> b!989288 m!916329))

(declare-fun m!916477 () Bool)

(assert (=> b!989288 m!916477))

(declare-fun m!916479 () Bool)

(assert (=> b!989296 m!916479))

(assert (=> b!989294 m!916329))

(assert (=> b!989294 m!916329))

(assert (=> b!989294 m!916375))

(declare-fun m!916481 () Bool)

(assert (=> b!989287 m!916481))

(declare-fun m!916483 () Bool)

(assert (=> b!989287 m!916483))

(assert (=> b!989287 m!916371))

(assert (=> b!989287 m!916209))

(assert (=> b!989287 m!916373))

(declare-fun m!916485 () Bool)

(assert (=> b!989287 m!916485))

(assert (=> b!989287 m!916329))

(assert (=> b!989287 m!916209))

(assert (=> b!989287 m!916481))

(assert (=> b!989287 m!916371))

(declare-fun m!916487 () Bool)

(assert (=> b!989287 m!916487))

(assert (=> b!989295 m!916371))

(assert (=> b!989295 m!916209))

(assert (=> b!989295 m!916373))

(assert (=> b!989295 m!916209))

(assert (=> b!989295 m!916329))

(assert (=> b!989295 m!916329))

(declare-fun m!916489 () Bool)

(assert (=> b!989295 m!916489))

(assert (=> b!989295 m!916371))

(assert (=> b!989089 d!117301))

(declare-fun d!117303 () Bool)

(assert (=> d!117303 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!84562 d!117303))

(declare-fun d!117305 () Bool)

(assert (=> d!117305 (= (array_inv!23247 _values!1278) (bvsge (size!30571 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!84562 d!117305))

(declare-fun d!117307 () Bool)

(assert (=> d!117307 (= (array_inv!23248 _keys!1544) (bvsge (size!30572 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!84562 d!117307))

(declare-fun mapNonEmpty!36936 () Bool)

(declare-fun mapRes!36936 () Bool)

(declare-fun tp!69926 () Bool)

(declare-fun e!557843 () Bool)

(assert (=> mapNonEmpty!36936 (= mapRes!36936 (and tp!69926 e!557843))))

(declare-fun mapKey!36936 () (_ BitVec 32))

(declare-fun mapValue!36936 () ValueCell!11148)

(declare-fun mapRest!36936 () (Array (_ BitVec 32) ValueCell!11148))

(assert (=> mapNonEmpty!36936 (= mapRest!36930 (store mapRest!36936 mapKey!36936 mapValue!36936))))

(declare-fun condMapEmpty!36936 () Bool)

(declare-fun mapDefault!36936 () ValueCell!11148)

(assert (=> mapNonEmpty!36930 (= condMapEmpty!36936 (= mapRest!36930 ((as const (Array (_ BitVec 32) ValueCell!11148)) mapDefault!36936)))))

(declare-fun e!557844 () Bool)

(assert (=> mapNonEmpty!36930 (= tp!69916 (and e!557844 mapRes!36936))))

(declare-fun mapIsEmpty!36936 () Bool)

(assert (=> mapIsEmpty!36936 mapRes!36936))

(declare-fun b!989303 () Bool)

(assert (=> b!989303 (= e!557843 tp_is_empty!23259)))

(declare-fun b!989304 () Bool)

(assert (=> b!989304 (= e!557844 tp_is_empty!23259)))

(assert (= (and mapNonEmpty!36930 condMapEmpty!36936) mapIsEmpty!36936))

(assert (= (and mapNonEmpty!36930 (not condMapEmpty!36936)) mapNonEmpty!36936))

(assert (= (and mapNonEmpty!36936 ((_ is ValueCellFull!11148) mapValue!36936)) b!989303))

(assert (= (and mapNonEmpty!36930 ((_ is ValueCellFull!11148) mapDefault!36936)) b!989304))

(declare-fun m!916491 () Bool)

(assert (=> mapNonEmpty!36936 m!916491))

(declare-fun b_lambda!15113 () Bool)

(assert (= b_lambda!15111 (or (and start!84562 b_free!20043) b_lambda!15113)))

(declare-fun b_lambda!15115 () Bool)

(assert (= b_lambda!15109 (or (and start!84562 b_free!20043) b_lambda!15115)))

(declare-fun b_lambda!15117 () Bool)

(assert (= b_lambda!15105 (or (and start!84562 b_free!20043) b_lambda!15117)))

(declare-fun b_lambda!15119 () Bool)

(assert (= b_lambda!15107 (or (and start!84562 b_free!20043) b_lambda!15119)))

(check-sat (not b!989288) (not b_lambda!15113) (not b!989292) (not b!989219) (not d!117281) (not b!989218) (not bm!41912) (not b!989215) (not bm!41917) (not b!989164) (not b_next!20043) (not b!989294) (not b!989234) (not mapNonEmpty!36936) (not b!989229) (not d!117295) (not b!989225) (not b!989241) (not bm!41913) (not bm!41891) (not bm!41910) (not b!989162) (not b!989226) (not b!989141) (not b!989251) (not d!117287) (not b!989254) (not b!989253) (not d!117289) (not b_lambda!15119) (not b!989260) (not bm!41919) (not b!989290) (not b_lambda!15115) (not bm!41920) (not bm!41894) b_and!32169 (not b!989209) (not b_lambda!15103) (not bm!41925) (not b!989250) (not b!989154) (not b!989240) (not b_lambda!15117) (not b!989228) (not b!989243) (not b!989139) (not d!117293) (not b!989287) (not b!989231) tp_is_empty!23259 (not b!989296) (not bm!41909) (not b!989214) (not b!989230) (not d!117283) (not b!989163) (not b!989259) (not d!117285) (not b!989155) (not b!989239) (not d!117301) (not b!989161) (not b!989289) (not d!117291) (not b!989295) (not b!989156) (not bm!41916) (not b!989244) (not b!989216))
(check-sat b_and!32169 (not b_next!20043))
(get-model)

(declare-fun d!117309 () Bool)

(declare-fun e!557849 () Bool)

(assert (=> d!117309 e!557849))

(declare-fun res!661631 () Bool)

(assert (=> d!117309 (=> res!661631 e!557849)))

(declare-fun lt!438889 () Bool)

(assert (=> d!117309 (= res!661631 (not lt!438889))))

(declare-fun lt!438891 () Bool)

(assert (=> d!117309 (= lt!438889 lt!438891)))

(declare-fun lt!438890 () Unit!32825)

(declare-fun e!557850 () Unit!32825)

(assert (=> d!117309 (= lt!438890 e!557850)))

(declare-fun c!100290 () Bool)

(assert (=> d!117309 (= c!100290 lt!438891)))

(declare-fun containsKey!478 (List!20815 (_ BitVec 64)) Bool)

(assert (=> d!117309 (= lt!438891 (containsKey!478 (toList!6807 lt!438832) (_1!7454 lt!438713)))))

(assert (=> d!117309 (= (contains!5719 lt!438832 (_1!7454 lt!438713)) lt!438889)))

(declare-fun b!989311 () Bool)

(declare-fun lt!438888 () Unit!32825)

(assert (=> b!989311 (= e!557850 lt!438888)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!374 (List!20815 (_ BitVec 64)) Unit!32825)

(assert (=> b!989311 (= lt!438888 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6807 lt!438832) (_1!7454 lt!438713)))))

(declare-fun isDefined!383 (Option!519) Bool)

(assert (=> b!989311 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438832) (_1!7454 lt!438713)))))

(declare-fun b!989312 () Bool)

(declare-fun Unit!32829 () Unit!32825)

(assert (=> b!989312 (= e!557850 Unit!32829)))

(declare-fun b!989313 () Bool)

(assert (=> b!989313 (= e!557849 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438832) (_1!7454 lt!438713))))))

(assert (= (and d!117309 c!100290) b!989311))

(assert (= (and d!117309 (not c!100290)) b!989312))

(assert (= (and d!117309 (not res!661631)) b!989313))

(declare-fun m!916493 () Bool)

(assert (=> d!117309 m!916493))

(declare-fun m!916495 () Bool)

(assert (=> b!989311 m!916495))

(assert (=> b!989311 m!916403))

(assert (=> b!989311 m!916403))

(declare-fun m!916497 () Bool)

(assert (=> b!989311 m!916497))

(assert (=> b!989313 m!916403))

(assert (=> b!989313 m!916403))

(assert (=> b!989313 m!916497))

(assert (=> d!117291 d!117309))

(declare-fun d!117311 () Bool)

(declare-fun c!100295 () Bool)

(assert (=> d!117311 (= c!100295 (and ((_ is Cons!20811) lt!438829) (= (_1!7454 (h!21973 lt!438829)) (_1!7454 lt!438713))))))

(declare-fun e!557855 () Option!519)

(assert (=> d!117311 (= (getValueByKey!513 lt!438829 (_1!7454 lt!438713)) e!557855)))

(declare-fun b!989325 () Bool)

(declare-fun e!557856 () Option!519)

(assert (=> b!989325 (= e!557856 None!517)))

(declare-fun b!989323 () Bool)

(assert (=> b!989323 (= e!557855 e!557856)))

(declare-fun c!100296 () Bool)

(assert (=> b!989323 (= c!100296 (and ((_ is Cons!20811) lt!438829) (not (= (_1!7454 (h!21973 lt!438829)) (_1!7454 lt!438713)))))))

(declare-fun b!989322 () Bool)

(assert (=> b!989322 (= e!557855 (Some!518 (_2!7454 (h!21973 lt!438829))))))

(declare-fun b!989324 () Bool)

(assert (=> b!989324 (= e!557856 (getValueByKey!513 (t!29770 lt!438829) (_1!7454 lt!438713)))))

(assert (= (and d!117311 c!100295) b!989322))

(assert (= (and d!117311 (not c!100295)) b!989323))

(assert (= (and b!989323 c!100296) b!989324))

(assert (= (and b!989323 (not c!100296)) b!989325))

(declare-fun m!916499 () Bool)

(assert (=> b!989324 m!916499))

(assert (=> d!117291 d!117311))

(declare-fun d!117313 () Bool)

(assert (=> d!117313 (= (getValueByKey!513 lt!438829 (_1!7454 lt!438713)) (Some!518 (_2!7454 lt!438713)))))

(declare-fun lt!438894 () Unit!32825)

(declare-fun choose!1611 (List!20815 (_ BitVec 64) V!35995) Unit!32825)

(assert (=> d!117313 (= lt!438894 (choose!1611 lt!438829 (_1!7454 lt!438713) (_2!7454 lt!438713)))))

(declare-fun e!557859 () Bool)

(assert (=> d!117313 e!557859))

(declare-fun res!661636 () Bool)

(assert (=> d!117313 (=> (not res!661636) (not e!557859))))

(declare-fun isStrictlySorted!516 (List!20815) Bool)

(assert (=> d!117313 (= res!661636 (isStrictlySorted!516 lt!438829))))

(assert (=> d!117313 (= (lemmaContainsTupThenGetReturnValue!272 lt!438829 (_1!7454 lt!438713) (_2!7454 lt!438713)) lt!438894)))

(declare-fun b!989330 () Bool)

(declare-fun res!661637 () Bool)

(assert (=> b!989330 (=> (not res!661637) (not e!557859))))

(assert (=> b!989330 (= res!661637 (containsKey!478 lt!438829 (_1!7454 lt!438713)))))

(declare-fun b!989331 () Bool)

(assert (=> b!989331 (= e!557859 (contains!5720 lt!438829 (tuple2!14887 (_1!7454 lt!438713) (_2!7454 lt!438713))))))

(assert (= (and d!117313 res!661636) b!989330))

(assert (= (and b!989330 res!661637) b!989331))

(assert (=> d!117313 m!916397))

(declare-fun m!916501 () Bool)

(assert (=> d!117313 m!916501))

(declare-fun m!916503 () Bool)

(assert (=> d!117313 m!916503))

(declare-fun m!916505 () Bool)

(assert (=> b!989330 m!916505))

(declare-fun m!916507 () Bool)

(assert (=> b!989331 m!916507))

(assert (=> d!117291 d!117313))

(declare-fun d!117315 () Bool)

(declare-fun e!557873 () Bool)

(assert (=> d!117315 e!557873))

(declare-fun res!661642 () Bool)

(assert (=> d!117315 (=> (not res!661642) (not e!557873))))

(declare-fun lt!438897 () List!20815)

(assert (=> d!117315 (= res!661642 (isStrictlySorted!516 lt!438897))))

(declare-fun e!557874 () List!20815)

(assert (=> d!117315 (= lt!438897 e!557874)))

(declare-fun c!100308 () Bool)

(assert (=> d!117315 (= c!100308 (and ((_ is Cons!20811) (toList!6807 (+!3085 lt!438712 lt!438711))) (bvslt (_1!7454 (h!21973 (toList!6807 (+!3085 lt!438712 lt!438711)))) (_1!7454 lt!438713))))))

(assert (=> d!117315 (isStrictlySorted!516 (toList!6807 (+!3085 lt!438712 lt!438711)))))

(assert (=> d!117315 (= (insertStrictlySorted!329 (toList!6807 (+!3085 lt!438712 lt!438711)) (_1!7454 lt!438713) (_2!7454 lt!438713)) lt!438897)))

(declare-fun bm!41932 () Bool)

(declare-fun call!41937 () List!20815)

(declare-fun call!41935 () List!20815)

(assert (=> bm!41932 (= call!41937 call!41935)))

(declare-fun c!100306 () Bool)

(declare-fun e!557872 () List!20815)

(declare-fun b!989352 () Bool)

(declare-fun c!100305 () Bool)

(assert (=> b!989352 (= e!557872 (ite c!100305 (t!29770 (toList!6807 (+!3085 lt!438712 lt!438711))) (ite c!100306 (Cons!20811 (h!21973 (toList!6807 (+!3085 lt!438712 lt!438711))) (t!29770 (toList!6807 (+!3085 lt!438712 lt!438711)))) Nil!20812)))))

(declare-fun b!989353 () Bool)

(assert (=> b!989353 (= e!557873 (contains!5720 lt!438897 (tuple2!14887 (_1!7454 lt!438713) (_2!7454 lt!438713))))))

(declare-fun b!989354 () Bool)

(declare-fun e!557871 () List!20815)

(assert (=> b!989354 (= e!557871 call!41937)))

(declare-fun b!989355 () Bool)

(assert (=> b!989355 (= e!557871 call!41937)))

(declare-fun b!989356 () Bool)

(assert (=> b!989356 (= c!100306 (and ((_ is Cons!20811) (toList!6807 (+!3085 lt!438712 lt!438711))) (bvsgt (_1!7454 (h!21973 (toList!6807 (+!3085 lt!438712 lt!438711)))) (_1!7454 lt!438713))))))

(declare-fun e!557870 () List!20815)

(assert (=> b!989356 (= e!557870 e!557871)))

(declare-fun bm!41933 () Bool)

(declare-fun call!41936 () List!20815)

(assert (=> bm!41933 (= call!41935 call!41936)))

(declare-fun b!989357 () Bool)

(assert (=> b!989357 (= e!557874 e!557870)))

(assert (=> b!989357 (= c!100305 (and ((_ is Cons!20811) (toList!6807 (+!3085 lt!438712 lt!438711))) (= (_1!7454 (h!21973 (toList!6807 (+!3085 lt!438712 lt!438711)))) (_1!7454 lt!438713))))))

(declare-fun b!989358 () Bool)

(assert (=> b!989358 (= e!557874 call!41936)))

(declare-fun b!989359 () Bool)

(declare-fun res!661643 () Bool)

(assert (=> b!989359 (=> (not res!661643) (not e!557873))))

(assert (=> b!989359 (= res!661643 (containsKey!478 lt!438897 (_1!7454 lt!438713)))))

(declare-fun b!989360 () Bool)

(assert (=> b!989360 (= e!557870 call!41935)))

(declare-fun b!989361 () Bool)

(assert (=> b!989361 (= e!557872 (insertStrictlySorted!329 (t!29770 (toList!6807 (+!3085 lt!438712 lt!438711))) (_1!7454 lt!438713) (_2!7454 lt!438713)))))

(declare-fun bm!41934 () Bool)

(declare-fun $colon$colon!555 (List!20815 tuple2!14886) List!20815)

(assert (=> bm!41934 (= call!41936 ($colon$colon!555 e!557872 (ite c!100308 (h!21973 (toList!6807 (+!3085 lt!438712 lt!438711))) (tuple2!14887 (_1!7454 lt!438713) (_2!7454 lt!438713)))))))

(declare-fun c!100307 () Bool)

(assert (=> bm!41934 (= c!100307 c!100308)))

(assert (= (and d!117315 c!100308) b!989358))

(assert (= (and d!117315 (not c!100308)) b!989357))

(assert (= (and b!989357 c!100305) b!989360))

(assert (= (and b!989357 (not c!100305)) b!989356))

(assert (= (and b!989356 c!100306) b!989355))

(assert (= (and b!989356 (not c!100306)) b!989354))

(assert (= (or b!989355 b!989354) bm!41932))

(assert (= (or b!989360 bm!41932) bm!41933))

(assert (= (or b!989358 bm!41933) bm!41934))

(assert (= (and bm!41934 c!100307) b!989361))

(assert (= (and bm!41934 (not c!100307)) b!989352))

(assert (= (and d!117315 res!661642) b!989359))

(assert (= (and b!989359 res!661643) b!989353))

(declare-fun m!916509 () Bool)

(assert (=> d!117315 m!916509))

(declare-fun m!916511 () Bool)

(assert (=> d!117315 m!916511))

(declare-fun m!916513 () Bool)

(assert (=> b!989353 m!916513))

(declare-fun m!916515 () Bool)

(assert (=> b!989359 m!916515))

(declare-fun m!916517 () Bool)

(assert (=> b!989361 m!916517))

(declare-fun m!916519 () Bool)

(assert (=> bm!41934 m!916519))

(assert (=> d!117291 d!117315))

(declare-fun d!117317 () Bool)

(assert (=> d!117317 (= (validKeyInArray!0 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000)) (and (not (= (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!989139 d!117317))

(assert (=> bm!41909 d!117301))

(declare-fun d!117319 () Bool)

(declare-fun c!100309 () Bool)

(assert (=> d!117319 (= c!100309 (and ((_ is Cons!20811) (toList!6807 lt!438758)) (= (_1!7454 (h!21973 (toList!6807 lt!438758))) (_1!7454 lt!438711))))))

(declare-fun e!557875 () Option!519)

(assert (=> d!117319 (= (getValueByKey!513 (toList!6807 lt!438758) (_1!7454 lt!438711)) e!557875)))

(declare-fun b!989365 () Bool)

(declare-fun e!557876 () Option!519)

(assert (=> b!989365 (= e!557876 None!517)))

(declare-fun b!989363 () Bool)

(assert (=> b!989363 (= e!557875 e!557876)))

(declare-fun c!100310 () Bool)

(assert (=> b!989363 (= c!100310 (and ((_ is Cons!20811) (toList!6807 lt!438758)) (not (= (_1!7454 (h!21973 (toList!6807 lt!438758))) (_1!7454 lt!438711)))))))

(declare-fun b!989362 () Bool)

(assert (=> b!989362 (= e!557875 (Some!518 (_2!7454 (h!21973 (toList!6807 lt!438758)))))))

(declare-fun b!989364 () Bool)

(assert (=> b!989364 (= e!557876 (getValueByKey!513 (t!29770 (toList!6807 lt!438758)) (_1!7454 lt!438711)))))

(assert (= (and d!117319 c!100309) b!989362))

(assert (= (and d!117319 (not c!100309)) b!989363))

(assert (= (and b!989363 c!100310) b!989364))

(assert (= (and b!989363 (not c!100310)) b!989365))

(declare-fun m!916521 () Bool)

(assert (=> b!989364 m!916521))

(assert (=> b!989163 d!117319))

(assert (=> b!989251 d!117297))

(declare-fun d!117321 () Bool)

(assert (=> d!117321 (= (validKeyInArray!0 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (and (not (= (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!989226 d!117321))

(declare-fun d!117323 () Bool)

(declare-fun e!557877 () Bool)

(assert (=> d!117323 e!557877))

(declare-fun res!661644 () Bool)

(assert (=> d!117323 (=> res!661644 e!557877)))

(declare-fun lt!438899 () Bool)

(assert (=> d!117323 (= res!661644 (not lt!438899))))

(declare-fun lt!438901 () Bool)

(assert (=> d!117323 (= lt!438899 lt!438901)))

(declare-fun lt!438900 () Unit!32825)

(declare-fun e!557878 () Unit!32825)

(assert (=> d!117323 (= lt!438900 e!557878)))

(declare-fun c!100311 () Bool)

(assert (=> d!117323 (= c!100311 lt!438901)))

(assert (=> d!117323 (= lt!438901 (containsKey!478 (toList!6807 (+!3085 lt!438878 (tuple2!14887 lt!438879 lt!438876))) lt!438877))))

(assert (=> d!117323 (= (contains!5719 (+!3085 lt!438878 (tuple2!14887 lt!438879 lt!438876)) lt!438877) lt!438899)))

(declare-fun b!989366 () Bool)

(declare-fun lt!438898 () Unit!32825)

(assert (=> b!989366 (= e!557878 lt!438898)))

(assert (=> b!989366 (= lt!438898 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6807 (+!3085 lt!438878 (tuple2!14887 lt!438879 lt!438876))) lt!438877))))

(assert (=> b!989366 (isDefined!383 (getValueByKey!513 (toList!6807 (+!3085 lt!438878 (tuple2!14887 lt!438879 lt!438876))) lt!438877))))

(declare-fun b!989367 () Bool)

(declare-fun Unit!32830 () Unit!32825)

(assert (=> b!989367 (= e!557878 Unit!32830)))

(declare-fun b!989368 () Bool)

(assert (=> b!989368 (= e!557877 (isDefined!383 (getValueByKey!513 (toList!6807 (+!3085 lt!438878 (tuple2!14887 lt!438879 lt!438876))) lt!438877)))))

(assert (= (and d!117323 c!100311) b!989366))

(assert (= (and d!117323 (not c!100311)) b!989367))

(assert (= (and d!117323 (not res!661644)) b!989368))

(declare-fun m!916523 () Bool)

(assert (=> d!117323 m!916523))

(declare-fun m!916525 () Bool)

(assert (=> b!989366 m!916525))

(declare-fun m!916527 () Bool)

(assert (=> b!989366 m!916527))

(assert (=> b!989366 m!916527))

(declare-fun m!916529 () Bool)

(assert (=> b!989366 m!916529))

(assert (=> b!989368 m!916527))

(assert (=> b!989368 m!916527))

(assert (=> b!989368 m!916529))

(assert (=> b!989287 d!117323))

(declare-fun d!117325 () Bool)

(declare-fun e!557879 () Bool)

(assert (=> d!117325 e!557879))

(declare-fun res!661646 () Bool)

(assert (=> d!117325 (=> (not res!661646) (not e!557879))))

(declare-fun lt!438905 () ListLongMap!13583)

(assert (=> d!117325 (= res!661646 (contains!5719 lt!438905 (_1!7454 (tuple2!14887 lt!438879 lt!438876))))))

(declare-fun lt!438902 () List!20815)

(assert (=> d!117325 (= lt!438905 (ListLongMap!13584 lt!438902))))

(declare-fun lt!438903 () Unit!32825)

(declare-fun lt!438904 () Unit!32825)

(assert (=> d!117325 (= lt!438903 lt!438904)))

(assert (=> d!117325 (= (getValueByKey!513 lt!438902 (_1!7454 (tuple2!14887 lt!438879 lt!438876))) (Some!518 (_2!7454 (tuple2!14887 lt!438879 lt!438876))))))

(assert (=> d!117325 (= lt!438904 (lemmaContainsTupThenGetReturnValue!272 lt!438902 (_1!7454 (tuple2!14887 lt!438879 lt!438876)) (_2!7454 (tuple2!14887 lt!438879 lt!438876))))))

(assert (=> d!117325 (= lt!438902 (insertStrictlySorted!329 (toList!6807 lt!438878) (_1!7454 (tuple2!14887 lt!438879 lt!438876)) (_2!7454 (tuple2!14887 lt!438879 lt!438876))))))

(assert (=> d!117325 (= (+!3085 lt!438878 (tuple2!14887 lt!438879 lt!438876)) lt!438905)))

(declare-fun b!989369 () Bool)

(declare-fun res!661645 () Bool)

(assert (=> b!989369 (=> (not res!661645) (not e!557879))))

(assert (=> b!989369 (= res!661645 (= (getValueByKey!513 (toList!6807 lt!438905) (_1!7454 (tuple2!14887 lt!438879 lt!438876))) (Some!518 (_2!7454 (tuple2!14887 lt!438879 lt!438876)))))))

(declare-fun b!989370 () Bool)

(assert (=> b!989370 (= e!557879 (contains!5720 (toList!6807 lt!438905) (tuple2!14887 lt!438879 lt!438876)))))

(assert (= (and d!117325 res!661646) b!989369))

(assert (= (and b!989369 res!661645) b!989370))

(declare-fun m!916531 () Bool)

(assert (=> d!117325 m!916531))

(declare-fun m!916533 () Bool)

(assert (=> d!117325 m!916533))

(declare-fun m!916535 () Bool)

(assert (=> d!117325 m!916535))

(declare-fun m!916537 () Bool)

(assert (=> d!117325 m!916537))

(declare-fun m!916539 () Bool)

(assert (=> b!989369 m!916539))

(declare-fun m!916541 () Bool)

(assert (=> b!989370 m!916541))

(assert (=> b!989287 d!117325))

(declare-fun d!117327 () Bool)

(declare-fun c!100312 () Bool)

(assert (=> d!117327 (= c!100312 ((_ is ValueCellFull!11148) (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun e!557880 () V!35995)

(assert (=> d!117327 (= (get!15619 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!557880)))

(declare-fun b!989371 () Bool)

(assert (=> b!989371 (= e!557880 (get!15621 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!989372 () Bool)

(assert (=> b!989372 (= e!557880 (get!15622 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117327 c!100312) b!989371))

(assert (= (and d!117327 (not c!100312)) b!989372))

(assert (=> b!989371 m!916371))

(assert (=> b!989371 m!916209))

(declare-fun m!916543 () Bool)

(assert (=> b!989371 m!916543))

(assert (=> b!989372 m!916371))

(assert (=> b!989372 m!916209))

(declare-fun m!916545 () Bool)

(assert (=> b!989372 m!916545))

(assert (=> b!989287 d!117327))

(declare-fun d!117329 () Bool)

(declare-fun e!557881 () Bool)

(assert (=> d!117329 e!557881))

(declare-fun res!661648 () Bool)

(assert (=> d!117329 (=> (not res!661648) (not e!557881))))

(declare-fun lt!438909 () ListLongMap!13583)

(assert (=> d!117329 (= res!661648 (contains!5719 lt!438909 (_1!7454 (tuple2!14887 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15619 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!438906 () List!20815)

(assert (=> d!117329 (= lt!438909 (ListLongMap!13584 lt!438906))))

(declare-fun lt!438907 () Unit!32825)

(declare-fun lt!438908 () Unit!32825)

(assert (=> d!117329 (= lt!438907 lt!438908)))

(assert (=> d!117329 (= (getValueByKey!513 lt!438906 (_1!7454 (tuple2!14887 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15619 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!518 (_2!7454 (tuple2!14887 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15619 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117329 (= lt!438908 (lemmaContainsTupThenGetReturnValue!272 lt!438906 (_1!7454 (tuple2!14887 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15619 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7454 (tuple2!14887 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15619 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117329 (= lt!438906 (insertStrictlySorted!329 (toList!6807 call!41928) (_1!7454 (tuple2!14887 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15619 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7454 (tuple2!14887 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15619 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117329 (= (+!3085 call!41928 (tuple2!14887 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15619 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!438909)))

(declare-fun b!989373 () Bool)

(declare-fun res!661647 () Bool)

(assert (=> b!989373 (=> (not res!661647) (not e!557881))))

(assert (=> b!989373 (= res!661647 (= (getValueByKey!513 (toList!6807 lt!438909) (_1!7454 (tuple2!14887 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15619 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!518 (_2!7454 (tuple2!14887 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15619 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!989374 () Bool)

(assert (=> b!989374 (= e!557881 (contains!5720 (toList!6807 lt!438909) (tuple2!14887 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15619 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!117329 res!661648) b!989373))

(assert (= (and b!989373 res!661647) b!989374))

(declare-fun m!916547 () Bool)

(assert (=> d!117329 m!916547))

(declare-fun m!916549 () Bool)

(assert (=> d!117329 m!916549))

(declare-fun m!916551 () Bool)

(assert (=> d!117329 m!916551))

(declare-fun m!916553 () Bool)

(assert (=> d!117329 m!916553))

(declare-fun m!916555 () Bool)

(assert (=> b!989373 m!916555))

(declare-fun m!916557 () Bool)

(assert (=> b!989374 m!916557))

(assert (=> b!989287 d!117329))

(declare-fun d!117331 () Bool)

(assert (=> d!117331 (not (contains!5719 (+!3085 lt!438878 (tuple2!14887 lt!438879 lt!438876)) lt!438877))))

(declare-fun lt!438912 () Unit!32825)

(declare-fun choose!1612 (ListLongMap!13583 (_ BitVec 64) V!35995 (_ BitVec 64)) Unit!32825)

(assert (=> d!117331 (= lt!438912 (choose!1612 lt!438878 lt!438879 lt!438876 lt!438877))))

(declare-fun e!557884 () Bool)

(assert (=> d!117331 e!557884))

(declare-fun res!661651 () Bool)

(assert (=> d!117331 (=> (not res!661651) (not e!557884))))

(assert (=> d!117331 (= res!661651 (not (contains!5719 lt!438878 lt!438877)))))

(assert (=> d!117331 (= (addStillNotContains!234 lt!438878 lt!438879 lt!438876 lt!438877) lt!438912)))

(declare-fun b!989378 () Bool)

(assert (=> b!989378 (= e!557884 (not (= lt!438879 lt!438877)))))

(assert (= (and d!117331 res!661651) b!989378))

(assert (=> d!117331 m!916481))

(assert (=> d!117331 m!916481))

(assert (=> d!117331 m!916483))

(declare-fun m!916559 () Bool)

(assert (=> d!117331 m!916559))

(declare-fun m!916561 () Bool)

(assert (=> d!117331 m!916561))

(assert (=> b!989287 d!117331))

(declare-fun d!117333 () Bool)

(declare-fun lt!438915 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!420 (List!20816) (InoxSet (_ BitVec 64)))

(assert (=> d!117333 (= lt!438915 (select (content!420 Nil!20813) (select (arr!30093 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun e!557889 () Bool)

(assert (=> d!117333 (= lt!438915 e!557889)))

(declare-fun res!661656 () Bool)

(assert (=> d!117333 (=> (not res!661656) (not e!557889))))

(assert (=> d!117333 (= res!661656 ((_ is Cons!20812) Nil!20813))))

(assert (=> d!117333 (= (contains!5718 Nil!20813 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000)) lt!438915)))

(declare-fun b!989383 () Bool)

(declare-fun e!557890 () Bool)

(assert (=> b!989383 (= e!557889 e!557890)))

(declare-fun res!661657 () Bool)

(assert (=> b!989383 (=> res!661657 e!557890)))

(assert (=> b!989383 (= res!661657 (= (h!21974 Nil!20813) (select (arr!30093 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!989384 () Bool)

(assert (=> b!989384 (= e!557890 (contains!5718 (t!29771 Nil!20813) (select (arr!30093 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!117333 res!661656) b!989383))

(assert (= (and b!989383 (not res!661657)) b!989384))

(declare-fun m!916563 () Bool)

(assert (=> d!117333 m!916563))

(assert (=> d!117333 m!916279))

(declare-fun m!916565 () Bool)

(assert (=> d!117333 m!916565))

(assert (=> b!989384 m!916279))

(declare-fun m!916567 () Bool)

(assert (=> b!989384 m!916567))

(assert (=> b!989154 d!117333))

(assert (=> d!117293 d!117303))

(declare-fun d!117335 () Bool)

(declare-fun e!557891 () Bool)

(assert (=> d!117335 e!557891))

(declare-fun res!661658 () Bool)

(assert (=> d!117335 (=> res!661658 e!557891)))

(declare-fun lt!438917 () Bool)

(assert (=> d!117335 (= res!661658 (not lt!438917))))

(declare-fun lt!438919 () Bool)

(assert (=> d!117335 (= lt!438917 lt!438919)))

(declare-fun lt!438918 () Unit!32825)

(declare-fun e!557892 () Unit!32825)

(assert (=> d!117335 (= lt!438918 e!557892)))

(declare-fun c!100313 () Bool)

(assert (=> d!117335 (= c!100313 lt!438919)))

(assert (=> d!117335 (= lt!438919 (containsKey!478 (toList!6807 lt!438828) (_1!7454 lt!438711)))))

(assert (=> d!117335 (= (contains!5719 lt!438828 (_1!7454 lt!438711)) lt!438917)))

(declare-fun b!989385 () Bool)

(declare-fun lt!438916 () Unit!32825)

(assert (=> b!989385 (= e!557892 lt!438916)))

(assert (=> b!989385 (= lt!438916 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6807 lt!438828) (_1!7454 lt!438711)))))

(assert (=> b!989385 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438828) (_1!7454 lt!438711)))))

(declare-fun b!989386 () Bool)

(declare-fun Unit!32831 () Unit!32825)

(assert (=> b!989386 (= e!557892 Unit!32831)))

(declare-fun b!989387 () Bool)

(assert (=> b!989387 (= e!557891 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438828) (_1!7454 lt!438711))))))

(assert (= (and d!117335 c!100313) b!989385))

(assert (= (and d!117335 (not c!100313)) b!989386))

(assert (= (and d!117335 (not res!661658)) b!989387))

(declare-fun m!916569 () Bool)

(assert (=> d!117335 m!916569))

(declare-fun m!916571 () Bool)

(assert (=> b!989385 m!916571))

(assert (=> b!989385 m!916391))

(assert (=> b!989385 m!916391))

(declare-fun m!916573 () Bool)

(assert (=> b!989385 m!916573))

(assert (=> b!989387 m!916391))

(assert (=> b!989387 m!916391))

(assert (=> b!989387 m!916573))

(assert (=> d!117289 d!117335))

(declare-fun d!117337 () Bool)

(declare-fun c!100314 () Bool)

(assert (=> d!117337 (= c!100314 (and ((_ is Cons!20811) lt!438825) (= (_1!7454 (h!21973 lt!438825)) (_1!7454 lt!438711))))))

(declare-fun e!557893 () Option!519)

(assert (=> d!117337 (= (getValueByKey!513 lt!438825 (_1!7454 lt!438711)) e!557893)))

(declare-fun b!989391 () Bool)

(declare-fun e!557894 () Option!519)

(assert (=> b!989391 (= e!557894 None!517)))

(declare-fun b!989389 () Bool)

(assert (=> b!989389 (= e!557893 e!557894)))

(declare-fun c!100315 () Bool)

(assert (=> b!989389 (= c!100315 (and ((_ is Cons!20811) lt!438825) (not (= (_1!7454 (h!21973 lt!438825)) (_1!7454 lt!438711)))))))

(declare-fun b!989388 () Bool)

(assert (=> b!989388 (= e!557893 (Some!518 (_2!7454 (h!21973 lt!438825))))))

(declare-fun b!989390 () Bool)

(assert (=> b!989390 (= e!557894 (getValueByKey!513 (t!29770 lt!438825) (_1!7454 lt!438711)))))

(assert (= (and d!117337 c!100314) b!989388))

(assert (= (and d!117337 (not c!100314)) b!989389))

(assert (= (and b!989389 c!100315) b!989390))

(assert (= (and b!989389 (not c!100315)) b!989391))

(declare-fun m!916575 () Bool)

(assert (=> b!989390 m!916575))

(assert (=> d!117289 d!117337))

(declare-fun d!117339 () Bool)

(assert (=> d!117339 (= (getValueByKey!513 lt!438825 (_1!7454 lt!438711)) (Some!518 (_2!7454 lt!438711)))))

(declare-fun lt!438920 () Unit!32825)

(assert (=> d!117339 (= lt!438920 (choose!1611 lt!438825 (_1!7454 lt!438711) (_2!7454 lt!438711)))))

(declare-fun e!557895 () Bool)

(assert (=> d!117339 e!557895))

(declare-fun res!661659 () Bool)

(assert (=> d!117339 (=> (not res!661659) (not e!557895))))

(assert (=> d!117339 (= res!661659 (isStrictlySorted!516 lt!438825))))

(assert (=> d!117339 (= (lemmaContainsTupThenGetReturnValue!272 lt!438825 (_1!7454 lt!438711) (_2!7454 lt!438711)) lt!438920)))

(declare-fun b!989392 () Bool)

(declare-fun res!661660 () Bool)

(assert (=> b!989392 (=> (not res!661660) (not e!557895))))

(assert (=> b!989392 (= res!661660 (containsKey!478 lt!438825 (_1!7454 lt!438711)))))

(declare-fun b!989393 () Bool)

(assert (=> b!989393 (= e!557895 (contains!5720 lt!438825 (tuple2!14887 (_1!7454 lt!438711) (_2!7454 lt!438711))))))

(assert (= (and d!117339 res!661659) b!989392))

(assert (= (and b!989392 res!661660) b!989393))

(assert (=> d!117339 m!916385))

(declare-fun m!916577 () Bool)

(assert (=> d!117339 m!916577))

(declare-fun m!916579 () Bool)

(assert (=> d!117339 m!916579))

(declare-fun m!916581 () Bool)

(assert (=> b!989392 m!916581))

(declare-fun m!916583 () Bool)

(assert (=> b!989393 m!916583))

(assert (=> d!117289 d!117339))

(declare-fun d!117341 () Bool)

(declare-fun e!557899 () Bool)

(assert (=> d!117341 e!557899))

(declare-fun res!661661 () Bool)

(assert (=> d!117341 (=> (not res!661661) (not e!557899))))

(declare-fun lt!438921 () List!20815)

(assert (=> d!117341 (= res!661661 (isStrictlySorted!516 lt!438921))))

(declare-fun e!557900 () List!20815)

(assert (=> d!117341 (= lt!438921 e!557900)))

(declare-fun c!100319 () Bool)

(assert (=> d!117341 (= c!100319 (and ((_ is Cons!20811) (toList!6807 lt!438712)) (bvslt (_1!7454 (h!21973 (toList!6807 lt!438712))) (_1!7454 lt!438711))))))

(assert (=> d!117341 (isStrictlySorted!516 (toList!6807 lt!438712))))

(assert (=> d!117341 (= (insertStrictlySorted!329 (toList!6807 lt!438712) (_1!7454 lt!438711) (_2!7454 lt!438711)) lt!438921)))

(declare-fun bm!41935 () Bool)

(declare-fun call!41940 () List!20815)

(declare-fun call!41938 () List!20815)

(assert (=> bm!41935 (= call!41940 call!41938)))

(declare-fun b!989394 () Bool)

(declare-fun c!100317 () Bool)

(declare-fun c!100316 () Bool)

(declare-fun e!557898 () List!20815)

(assert (=> b!989394 (= e!557898 (ite c!100316 (t!29770 (toList!6807 lt!438712)) (ite c!100317 (Cons!20811 (h!21973 (toList!6807 lt!438712)) (t!29770 (toList!6807 lt!438712))) Nil!20812)))))

(declare-fun b!989395 () Bool)

(assert (=> b!989395 (= e!557899 (contains!5720 lt!438921 (tuple2!14887 (_1!7454 lt!438711) (_2!7454 lt!438711))))))

(declare-fun b!989396 () Bool)

(declare-fun e!557897 () List!20815)

(assert (=> b!989396 (= e!557897 call!41940)))

(declare-fun b!989397 () Bool)

(assert (=> b!989397 (= e!557897 call!41940)))

(declare-fun b!989398 () Bool)

(assert (=> b!989398 (= c!100317 (and ((_ is Cons!20811) (toList!6807 lt!438712)) (bvsgt (_1!7454 (h!21973 (toList!6807 lt!438712))) (_1!7454 lt!438711))))))

(declare-fun e!557896 () List!20815)

(assert (=> b!989398 (= e!557896 e!557897)))

(declare-fun bm!41936 () Bool)

(declare-fun call!41939 () List!20815)

(assert (=> bm!41936 (= call!41938 call!41939)))

(declare-fun b!989399 () Bool)

(assert (=> b!989399 (= e!557900 e!557896)))

(assert (=> b!989399 (= c!100316 (and ((_ is Cons!20811) (toList!6807 lt!438712)) (= (_1!7454 (h!21973 (toList!6807 lt!438712))) (_1!7454 lt!438711))))))

(declare-fun b!989400 () Bool)

(assert (=> b!989400 (= e!557900 call!41939)))

(declare-fun b!989401 () Bool)

(declare-fun res!661662 () Bool)

(assert (=> b!989401 (=> (not res!661662) (not e!557899))))

(assert (=> b!989401 (= res!661662 (containsKey!478 lt!438921 (_1!7454 lt!438711)))))

(declare-fun b!989402 () Bool)

(assert (=> b!989402 (= e!557896 call!41938)))

(declare-fun b!989403 () Bool)

(assert (=> b!989403 (= e!557898 (insertStrictlySorted!329 (t!29770 (toList!6807 lt!438712)) (_1!7454 lt!438711) (_2!7454 lt!438711)))))

(declare-fun bm!41937 () Bool)

(assert (=> bm!41937 (= call!41939 ($colon$colon!555 e!557898 (ite c!100319 (h!21973 (toList!6807 lt!438712)) (tuple2!14887 (_1!7454 lt!438711) (_2!7454 lt!438711)))))))

(declare-fun c!100318 () Bool)

(assert (=> bm!41937 (= c!100318 c!100319)))

(assert (= (and d!117341 c!100319) b!989400))

(assert (= (and d!117341 (not c!100319)) b!989399))

(assert (= (and b!989399 c!100316) b!989402))

(assert (= (and b!989399 (not c!100316)) b!989398))

(assert (= (and b!989398 c!100317) b!989397))

(assert (= (and b!989398 (not c!100317)) b!989396))

(assert (= (or b!989397 b!989396) bm!41935))

(assert (= (or b!989402 bm!41935) bm!41936))

(assert (= (or b!989400 bm!41936) bm!41937))

(assert (= (and bm!41937 c!100318) b!989403))

(assert (= (and bm!41937 (not c!100318)) b!989394))

(assert (= (and d!117341 res!661661) b!989401))

(assert (= (and b!989401 res!661662) b!989395))

(declare-fun m!916585 () Bool)

(assert (=> d!117341 m!916585))

(declare-fun m!916587 () Bool)

(assert (=> d!117341 m!916587))

(declare-fun m!916589 () Bool)

(assert (=> b!989395 m!916589))

(declare-fun m!916591 () Bool)

(assert (=> b!989401 m!916591))

(declare-fun m!916593 () Bool)

(assert (=> b!989403 m!916593))

(declare-fun m!916595 () Bool)

(assert (=> bm!41937 m!916595))

(assert (=> d!117289 d!117341))

(declare-fun d!117343 () Bool)

(declare-fun e!557901 () Bool)

(assert (=> d!117343 e!557901))

(declare-fun res!661663 () Bool)

(assert (=> d!117343 (=> res!661663 e!557901)))

(declare-fun lt!438923 () Bool)

(assert (=> d!117343 (= res!661663 (not lt!438923))))

(declare-fun lt!438925 () Bool)

(assert (=> d!117343 (= lt!438923 lt!438925)))

(declare-fun lt!438924 () Unit!32825)

(declare-fun e!557902 () Unit!32825)

(assert (=> d!117343 (= lt!438924 e!557902)))

(declare-fun c!100320 () Bool)

(assert (=> d!117343 (= c!100320 lt!438925)))

(assert (=> d!117343 (= lt!438925 (containsKey!478 (toList!6807 lt!438875) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117343 (= (contains!5719 lt!438875 #b0000000000000000000000000000000000000000000000000000000000000000) lt!438923)))

(declare-fun b!989404 () Bool)

(declare-fun lt!438922 () Unit!32825)

(assert (=> b!989404 (= e!557902 lt!438922)))

(assert (=> b!989404 (= lt!438922 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6807 lt!438875) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!989404 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438875) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989405 () Bool)

(declare-fun Unit!32832 () Unit!32825)

(assert (=> b!989405 (= e!557902 Unit!32832)))

(declare-fun b!989406 () Bool)

(assert (=> b!989406 (= e!557901 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438875) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117343 c!100320) b!989404))

(assert (= (and d!117343 (not c!100320)) b!989405))

(assert (= (and d!117343 (not res!661663)) b!989406))

(declare-fun m!916597 () Bool)

(assert (=> d!117343 m!916597))

(declare-fun m!916599 () Bool)

(assert (=> b!989404 m!916599))

(declare-fun m!916601 () Bool)

(assert (=> b!989404 m!916601))

(assert (=> b!989404 m!916601))

(declare-fun m!916603 () Bool)

(assert (=> b!989404 m!916603))

(assert (=> b!989406 m!916601))

(assert (=> b!989406 m!916601))

(assert (=> b!989406 m!916603))

(assert (=> d!117301 d!117343))

(assert (=> d!117301 d!117303))

(declare-fun b!989407 () Bool)

(declare-fun e!557903 () Bool)

(declare-fun e!557908 () Bool)

(assert (=> b!989407 (= e!557903 e!557908)))

(declare-fun c!100321 () Bool)

(assert (=> b!989407 (= c!100321 (bvslt from!1932 (size!30572 _keys!1544)))))

(declare-fun b!989408 () Bool)

(declare-fun e!557907 () ListLongMap!13583)

(assert (=> b!989408 (= e!557907 (ListLongMap!13584 Nil!20812))))

(declare-fun b!989409 () Bool)

(declare-fun lt!438926 () Unit!32825)

(declare-fun lt!438927 () Unit!32825)

(assert (=> b!989409 (= lt!438926 lt!438927)))

(declare-fun lt!438931 () ListLongMap!13583)

(declare-fun lt!438929 () V!35995)

(declare-fun lt!438930 () (_ BitVec 64))

(declare-fun lt!438932 () (_ BitVec 64))

(assert (=> b!989409 (not (contains!5719 (+!3085 lt!438931 (tuple2!14887 lt!438932 lt!438929)) lt!438930))))

(assert (=> b!989409 (= lt!438927 (addStillNotContains!234 lt!438931 lt!438932 lt!438929 lt!438930))))

(assert (=> b!989409 (= lt!438930 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!989409 (= lt!438929 (get!15619 (select (arr!30092 _values!1278) from!1932) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!989409 (= lt!438932 (select (arr!30093 _keys!1544) from!1932))))

(declare-fun call!41941 () ListLongMap!13583)

(assert (=> b!989409 (= lt!438931 call!41941)))

(declare-fun e!557909 () ListLongMap!13583)

(assert (=> b!989409 (= e!557909 (+!3085 call!41941 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) (get!15619 (select (arr!30092 _values!1278) from!1932) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!989410 () Bool)

(declare-fun e!557905 () Bool)

(assert (=> b!989410 (= e!557903 e!557905)))

(assert (=> b!989410 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30572 _keys!1544)))))

(declare-fun lt!438928 () ListLongMap!13583)

(declare-fun res!661665 () Bool)

(assert (=> b!989410 (= res!661665 (contains!5719 lt!438928 (select (arr!30093 _keys!1544) from!1932)))))

(assert (=> b!989410 (=> (not res!661665) (not e!557905))))

(declare-fun b!989411 () Bool)

(assert (=> b!989411 (= e!557907 e!557909)))

(declare-fun c!100324 () Bool)

(assert (=> b!989411 (= c!100324 (validKeyInArray!0 (select (arr!30093 _keys!1544) from!1932)))))

(declare-fun bm!41938 () Bool)

(assert (=> bm!41938 (= call!41941 (getCurrentListMapNoExtraKeys!3497 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!989412 () Bool)

(declare-fun res!661667 () Bool)

(declare-fun e!557904 () Bool)

(assert (=> b!989412 (=> (not res!661667) (not e!557904))))

(assert (=> b!989412 (= res!661667 (not (contains!5719 lt!438928 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!989413 () Bool)

(assert (=> b!989413 (= e!557909 call!41941)))

(declare-fun b!989414 () Bool)

(assert (=> b!989414 (= e!557908 (= lt!438928 (getCurrentListMapNoExtraKeys!3497 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun b!989415 () Bool)

(assert (=> b!989415 (= e!557904 e!557903)))

(declare-fun c!100322 () Bool)

(declare-fun e!557906 () Bool)

(assert (=> b!989415 (= c!100322 e!557906)))

(declare-fun res!661666 () Bool)

(assert (=> b!989415 (=> (not res!661666) (not e!557906))))

(assert (=> b!989415 (= res!661666 (bvslt from!1932 (size!30572 _keys!1544)))))

(declare-fun b!989417 () Bool)

(assert (=> b!989417 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30572 _keys!1544)))))

(assert (=> b!989417 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30571 _values!1278)))))

(assert (=> b!989417 (= e!557905 (= (apply!895 lt!438928 (select (arr!30093 _keys!1544) from!1932)) (get!15619 (select (arr!30092 _values!1278) from!1932) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!989418 () Bool)

(assert (=> b!989418 (= e!557908 (isEmpty!723 lt!438928))))

(declare-fun d!117345 () Bool)

(assert (=> d!117345 e!557904))

(declare-fun res!661664 () Bool)

(assert (=> d!117345 (=> (not res!661664) (not e!557904))))

(assert (=> d!117345 (= res!661664 (not (contains!5719 lt!438928 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117345 (= lt!438928 e!557907)))

(declare-fun c!100323 () Bool)

(assert (=> d!117345 (= c!100323 (bvsge from!1932 (size!30572 _keys!1544)))))

(assert (=> d!117345 (validMask!0 mask!1948)))

(assert (=> d!117345 (= (getCurrentListMapNoExtraKeys!3497 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) lt!438928)))

(declare-fun b!989416 () Bool)

(assert (=> b!989416 (= e!557906 (validKeyInArray!0 (select (arr!30093 _keys!1544) from!1932)))))

(assert (=> b!989416 (bvsge from!1932 #b00000000000000000000000000000000)))

(assert (= (and d!117345 c!100323) b!989408))

(assert (= (and d!117345 (not c!100323)) b!989411))

(assert (= (and b!989411 c!100324) b!989409))

(assert (= (and b!989411 (not c!100324)) b!989413))

(assert (= (or b!989409 b!989413) bm!41938))

(assert (= (and d!117345 res!661664) b!989412))

(assert (= (and b!989412 res!661667) b!989415))

(assert (= (and b!989415 res!661666) b!989416))

(assert (= (and b!989415 c!100322) b!989410))

(assert (= (and b!989415 (not c!100322)) b!989407))

(assert (= (and b!989410 res!661665) b!989417))

(assert (= (and b!989407 c!100321) b!989414))

(assert (= (and b!989407 (not c!100321)) b!989418))

(declare-fun b_lambda!15121 () Bool)

(assert (=> (not b_lambda!15121) (not b!989409)))

(assert (=> b!989409 t!29769))

(declare-fun b_and!32171 () Bool)

(assert (= b_and!32169 (and (=> t!29769 result!13607) b_and!32171)))

(declare-fun b_lambda!15123 () Bool)

(assert (=> (not b_lambda!15123) (not b!989417)))

(assert (=> b!989417 t!29769))

(declare-fun b_and!32173 () Bool)

(assert (= b_and!32171 (and (=> t!29769 result!13607) b_and!32173)))

(declare-fun m!916605 () Bool)

(assert (=> d!117345 m!916605))

(assert (=> d!117345 m!916217))

(declare-fun m!916607 () Bool)

(assert (=> bm!41938 m!916607))

(declare-fun m!916609 () Bool)

(assert (=> b!989412 m!916609))

(assert (=> b!989414 m!916607))

(assert (=> b!989411 m!916201))

(assert (=> b!989411 m!916201))

(assert (=> b!989411 m!916203))

(assert (=> b!989410 m!916201))

(assert (=> b!989410 m!916201))

(declare-fun m!916611 () Bool)

(assert (=> b!989410 m!916611))

(declare-fun m!916613 () Bool)

(assert (=> b!989418 m!916613))

(assert (=> b!989416 m!916201))

(assert (=> b!989416 m!916201))

(assert (=> b!989416 m!916203))

(declare-fun m!916615 () Bool)

(assert (=> b!989409 m!916615))

(declare-fun m!916617 () Bool)

(assert (=> b!989409 m!916617))

(assert (=> b!989409 m!916205))

(assert (=> b!989409 m!916209))

(assert (=> b!989409 m!916211))

(declare-fun m!916619 () Bool)

(assert (=> b!989409 m!916619))

(assert (=> b!989409 m!916201))

(assert (=> b!989409 m!916209))

(assert (=> b!989409 m!916615))

(assert (=> b!989409 m!916205))

(declare-fun m!916621 () Bool)

(assert (=> b!989409 m!916621))

(assert (=> b!989417 m!916205))

(assert (=> b!989417 m!916209))

(assert (=> b!989417 m!916211))

(assert (=> b!989417 m!916209))

(assert (=> b!989417 m!916201))

(assert (=> b!989417 m!916201))

(declare-fun m!916623 () Bool)

(assert (=> b!989417 m!916623))

(assert (=> b!989417 m!916205))

(assert (=> bm!41916 d!117345))

(declare-fun d!117347 () Bool)

(declare-fun c!100325 () Bool)

(assert (=> d!117347 (= c!100325 (and ((_ is Cons!20811) (toList!6807 lt!438858)) (= (_1!7454 (h!21973 (toList!6807 lt!438858))) (_1!7454 lt!438711))))))

(declare-fun e!557910 () Option!519)

(assert (=> d!117347 (= (getValueByKey!513 (toList!6807 lt!438858) (_1!7454 lt!438711)) e!557910)))

(declare-fun b!989422 () Bool)

(declare-fun e!557911 () Option!519)

(assert (=> b!989422 (= e!557911 None!517)))

(declare-fun b!989420 () Bool)

(assert (=> b!989420 (= e!557910 e!557911)))

(declare-fun c!100326 () Bool)

(assert (=> b!989420 (= c!100326 (and ((_ is Cons!20811) (toList!6807 lt!438858)) (not (= (_1!7454 (h!21973 (toList!6807 lt!438858))) (_1!7454 lt!438711)))))))

(declare-fun b!989419 () Bool)

(assert (=> b!989419 (= e!557910 (Some!518 (_2!7454 (h!21973 (toList!6807 lt!438858)))))))

(declare-fun b!989421 () Bool)

(assert (=> b!989421 (= e!557911 (getValueByKey!513 (t!29770 (toList!6807 lt!438858)) (_1!7454 lt!438711)))))

(assert (= (and d!117347 c!100325) b!989419))

(assert (= (and d!117347 (not c!100325)) b!989420))

(assert (= (and b!989420 c!100326) b!989421))

(assert (= (and b!989420 (not c!100326)) b!989422))

(declare-fun m!916625 () Bool)

(assert (=> b!989421 m!916625))

(assert (=> b!989253 d!117347))

(declare-fun d!117349 () Bool)

(declare-fun e!557912 () Bool)

(assert (=> d!117349 e!557912))

(declare-fun res!661668 () Bool)

(assert (=> d!117349 (=> res!661668 e!557912)))

(declare-fun lt!438934 () Bool)

(assert (=> d!117349 (= res!661668 (not lt!438934))))

(declare-fun lt!438936 () Bool)

(assert (=> d!117349 (= lt!438934 lt!438936)))

(declare-fun lt!438935 () Unit!32825)

(declare-fun e!557913 () Unit!32825)

(assert (=> d!117349 (= lt!438935 e!557913)))

(declare-fun c!100327 () Bool)

(assert (=> d!117349 (= c!100327 lt!438936)))

(assert (=> d!117349 (= lt!438936 (containsKey!478 (toList!6807 lt!438875) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117349 (= (contains!5719 lt!438875 #b1000000000000000000000000000000000000000000000000000000000000000) lt!438934)))

(declare-fun b!989423 () Bool)

(declare-fun lt!438933 () Unit!32825)

(assert (=> b!989423 (= e!557913 lt!438933)))

(assert (=> b!989423 (= lt!438933 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6807 lt!438875) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!989423 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438875) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989424 () Bool)

(declare-fun Unit!32833 () Unit!32825)

(assert (=> b!989424 (= e!557913 Unit!32833)))

(declare-fun b!989425 () Bool)

(assert (=> b!989425 (= e!557912 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438875) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117349 c!100327) b!989423))

(assert (= (and d!117349 (not c!100327)) b!989424))

(assert (= (and d!117349 (not res!661668)) b!989425))

(declare-fun m!916627 () Bool)

(assert (=> d!117349 m!916627))

(declare-fun m!916629 () Bool)

(assert (=> b!989423 m!916629))

(declare-fun m!916631 () Bool)

(assert (=> b!989423 m!916631))

(assert (=> b!989423 m!916631))

(declare-fun m!916633 () Bool)

(assert (=> b!989423 m!916633))

(assert (=> b!989425 m!916631))

(assert (=> b!989425 m!916631))

(assert (=> b!989425 m!916633))

(assert (=> b!989290 d!117349))

(declare-fun d!117351 () Bool)

(declare-fun e!557914 () Bool)

(assert (=> d!117351 e!557914))

(declare-fun res!661669 () Bool)

(assert (=> d!117351 (=> res!661669 e!557914)))

(declare-fun lt!438938 () Bool)

(assert (=> d!117351 (= res!661669 (not lt!438938))))

(declare-fun lt!438940 () Bool)

(assert (=> d!117351 (= lt!438938 lt!438940)))

(declare-fun lt!438939 () Unit!32825)

(declare-fun e!557915 () Unit!32825)

(assert (=> d!117351 (= lt!438939 e!557915)))

(declare-fun c!100328 () Bool)

(assert (=> d!117351 (= c!100328 lt!438940)))

(assert (=> d!117351 (= lt!438940 (containsKey!478 (toList!6807 lt!438815) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117351 (= (contains!5719 lt!438815 #b1000000000000000000000000000000000000000000000000000000000000000) lt!438938)))

(declare-fun b!989426 () Bool)

(declare-fun lt!438937 () Unit!32825)

(assert (=> b!989426 (= e!557915 lt!438937)))

(assert (=> b!989426 (= lt!438937 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6807 lt!438815) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!989426 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438815) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989427 () Bool)

(declare-fun Unit!32834 () Unit!32825)

(assert (=> b!989427 (= e!557915 Unit!32834)))

(declare-fun b!989428 () Bool)

(assert (=> b!989428 (= e!557914 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438815) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117351 c!100328) b!989426))

(assert (= (and d!117351 (not c!100328)) b!989427))

(assert (= (and d!117351 (not res!661669)) b!989428))

(declare-fun m!916635 () Bool)

(assert (=> d!117351 m!916635))

(declare-fun m!916637 () Bool)

(assert (=> b!989426 m!916637))

(declare-fun m!916639 () Bool)

(assert (=> b!989426 m!916639))

(assert (=> b!989426 m!916639))

(declare-fun m!916641 () Bool)

(assert (=> b!989426 m!916641))

(assert (=> b!989428 m!916639))

(assert (=> b!989428 m!916639))

(assert (=> b!989428 m!916641))

(assert (=> bm!41912 d!117351))

(declare-fun d!117353 () Bool)

(declare-fun c!100329 () Bool)

(assert (=> d!117353 (= c!100329 (and ((_ is Cons!20811) (toList!6807 lt!438828)) (= (_1!7454 (h!21973 (toList!6807 lt!438828))) (_1!7454 lt!438711))))))

(declare-fun e!557916 () Option!519)

(assert (=> d!117353 (= (getValueByKey!513 (toList!6807 lt!438828) (_1!7454 lt!438711)) e!557916)))

(declare-fun b!989432 () Bool)

(declare-fun e!557917 () Option!519)

(assert (=> b!989432 (= e!557917 None!517)))

(declare-fun b!989430 () Bool)

(assert (=> b!989430 (= e!557916 e!557917)))

(declare-fun c!100330 () Bool)

(assert (=> b!989430 (= c!100330 (and ((_ is Cons!20811) (toList!6807 lt!438828)) (not (= (_1!7454 (h!21973 (toList!6807 lt!438828))) (_1!7454 lt!438711)))))))

(declare-fun b!989429 () Bool)

(assert (=> b!989429 (= e!557916 (Some!518 (_2!7454 (h!21973 (toList!6807 lt!438828)))))))

(declare-fun b!989431 () Bool)

(assert (=> b!989431 (= e!557917 (getValueByKey!513 (t!29770 (toList!6807 lt!438828)) (_1!7454 lt!438711)))))

(assert (= (and d!117353 c!100329) b!989429))

(assert (= (and d!117353 (not c!100329)) b!989430))

(assert (= (and b!989430 c!100330) b!989431))

(assert (= (and b!989430 (not c!100330)) b!989432))

(declare-fun m!916643 () Bool)

(assert (=> b!989431 m!916643))

(assert (=> b!989228 d!117353))

(assert (=> b!989239 d!117297))

(declare-fun b!989433 () Bool)

(declare-fun e!557918 () Bool)

(declare-fun e!557923 () Bool)

(assert (=> b!989433 (= e!557918 e!557923)))

(declare-fun c!100331 () Bool)

(assert (=> b!989433 (= c!100331 (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30572 _keys!1544)))))

(declare-fun b!989434 () Bool)

(declare-fun e!557922 () ListLongMap!13583)

(assert (=> b!989434 (= e!557922 (ListLongMap!13584 Nil!20812))))

(declare-fun b!989435 () Bool)

(declare-fun lt!438941 () Unit!32825)

(declare-fun lt!438942 () Unit!32825)

(assert (=> b!989435 (= lt!438941 lt!438942)))

(declare-fun lt!438947 () (_ BitVec 64))

(declare-fun lt!438945 () (_ BitVec 64))

(declare-fun lt!438944 () V!35995)

(declare-fun lt!438946 () ListLongMap!13583)

(assert (=> b!989435 (not (contains!5719 (+!3085 lt!438946 (tuple2!14887 lt!438947 lt!438944)) lt!438945))))

(assert (=> b!989435 (= lt!438942 (addStillNotContains!234 lt!438946 lt!438947 lt!438944 lt!438945))))

(assert (=> b!989435 (= lt!438945 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!989435 (= lt!438944 (get!15619 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!989435 (= lt!438947 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)))))

(declare-fun call!41942 () ListLongMap!13583)

(assert (=> b!989435 (= lt!438946 call!41942)))

(declare-fun e!557924 () ListLongMap!13583)

(assert (=> b!989435 (= e!557924 (+!3085 call!41942 (tuple2!14887 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (get!15619 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!989436 () Bool)

(declare-fun e!557920 () Bool)

(assert (=> b!989436 (= e!557918 e!557920)))

(assert (=> b!989436 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30572 _keys!1544)))))

(declare-fun res!661671 () Bool)

(declare-fun lt!438943 () ListLongMap!13583)

(assert (=> b!989436 (= res!661671 (contains!5719 lt!438943 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(assert (=> b!989436 (=> (not res!661671) (not e!557920))))

(declare-fun b!989437 () Bool)

(assert (=> b!989437 (= e!557922 e!557924)))

(declare-fun c!100334 () Bool)

(assert (=> b!989437 (= c!100334 (validKeyInArray!0 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(declare-fun bm!41939 () Bool)

(assert (=> bm!41939 (= call!41942 (getCurrentListMapNoExtraKeys!3497 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!989438 () Bool)

(declare-fun res!661673 () Bool)

(declare-fun e!557919 () Bool)

(assert (=> b!989438 (=> (not res!661673) (not e!557919))))

(assert (=> b!989438 (= res!661673 (not (contains!5719 lt!438943 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!989439 () Bool)

(assert (=> b!989439 (= e!557924 call!41942)))

(declare-fun b!989440 () Bool)

(assert (=> b!989440 (= e!557923 (= lt!438943 (getCurrentListMapNoExtraKeys!3497 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun b!989441 () Bool)

(assert (=> b!989441 (= e!557919 e!557918)))

(declare-fun c!100332 () Bool)

(declare-fun e!557921 () Bool)

(assert (=> b!989441 (= c!100332 e!557921)))

(declare-fun res!661672 () Bool)

(assert (=> b!989441 (=> (not res!661672) (not e!557921))))

(assert (=> b!989441 (= res!661672 (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30572 _keys!1544)))))

(declare-fun b!989443 () Bool)

(assert (=> b!989443 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30572 _keys!1544)))))

(assert (=> b!989443 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30571 _values!1278)))))

(assert (=> b!989443 (= e!557920 (= (apply!895 lt!438943 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))) (get!15619 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!989444 () Bool)

(assert (=> b!989444 (= e!557923 (isEmpty!723 lt!438943))))

(declare-fun d!117355 () Bool)

(assert (=> d!117355 e!557919))

(declare-fun res!661670 () Bool)

(assert (=> d!117355 (=> (not res!661670) (not e!557919))))

(assert (=> d!117355 (= res!661670 (not (contains!5719 lt!438943 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117355 (= lt!438943 e!557922)))

(declare-fun c!100333 () Bool)

(assert (=> d!117355 (= c!100333 (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30572 _keys!1544)))))

(assert (=> d!117355 (validMask!0 mask!1948)))

(assert (=> d!117355 (= (getCurrentListMapNoExtraKeys!3497 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281) lt!438943)))

(declare-fun b!989442 () Bool)

(assert (=> b!989442 (= e!557921 (validKeyInArray!0 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(assert (=> b!989442 (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (= (and d!117355 c!100333) b!989434))

(assert (= (and d!117355 (not c!100333)) b!989437))

(assert (= (and b!989437 c!100334) b!989435))

(assert (= (and b!989437 (not c!100334)) b!989439))

(assert (= (or b!989435 b!989439) bm!41939))

(assert (= (and d!117355 res!661670) b!989438))

(assert (= (and b!989438 res!661673) b!989441))

(assert (= (and b!989441 res!661672) b!989442))

(assert (= (and b!989441 c!100332) b!989436))

(assert (= (and b!989441 (not c!100332)) b!989433))

(assert (= (and b!989436 res!661671) b!989443))

(assert (= (and b!989433 c!100331) b!989440))

(assert (= (and b!989433 (not c!100331)) b!989444))

(declare-fun b_lambda!15125 () Bool)

(assert (=> (not b_lambda!15125) (not b!989435)))

(assert (=> b!989435 t!29769))

(declare-fun b_and!32175 () Bool)

(assert (= b_and!32173 (and (=> t!29769 result!13607) b_and!32175)))

(declare-fun b_lambda!15127 () Bool)

(assert (=> (not b_lambda!15127) (not b!989443)))

(assert (=> b!989443 t!29769))

(declare-fun b_and!32177 () Bool)

(assert (= b_and!32175 (and (=> t!29769 result!13607) b_and!32177)))

(declare-fun m!916645 () Bool)

(assert (=> d!117355 m!916645))

(assert (=> d!117355 m!916217))

(declare-fun m!916647 () Bool)

(assert (=> bm!41939 m!916647))

(declare-fun m!916649 () Bool)

(assert (=> b!989438 m!916649))

(assert (=> b!989440 m!916647))

(declare-fun m!916651 () Bool)

(assert (=> b!989437 m!916651))

(assert (=> b!989437 m!916651))

(declare-fun m!916653 () Bool)

(assert (=> b!989437 m!916653))

(assert (=> b!989436 m!916651))

(assert (=> b!989436 m!916651))

(declare-fun m!916655 () Bool)

(assert (=> b!989436 m!916655))

(declare-fun m!916657 () Bool)

(assert (=> b!989444 m!916657))

(assert (=> b!989442 m!916651))

(assert (=> b!989442 m!916651))

(assert (=> b!989442 m!916653))

(declare-fun m!916659 () Bool)

(assert (=> b!989435 m!916659))

(declare-fun m!916661 () Bool)

(assert (=> b!989435 m!916661))

(declare-fun m!916663 () Bool)

(assert (=> b!989435 m!916663))

(assert (=> b!989435 m!916209))

(declare-fun m!916665 () Bool)

(assert (=> b!989435 m!916665))

(declare-fun m!916667 () Bool)

(assert (=> b!989435 m!916667))

(assert (=> b!989435 m!916651))

(assert (=> b!989435 m!916209))

(assert (=> b!989435 m!916659))

(assert (=> b!989435 m!916663))

(declare-fun m!916669 () Bool)

(assert (=> b!989435 m!916669))

(assert (=> b!989443 m!916663))

(assert (=> b!989443 m!916209))

(assert (=> b!989443 m!916665))

(assert (=> b!989443 m!916209))

(assert (=> b!989443 m!916651))

(assert (=> b!989443 m!916651))

(declare-fun m!916671 () Bool)

(assert (=> b!989443 m!916671))

(assert (=> b!989443 m!916663))

(assert (=> b!989292 d!117355))

(assert (=> b!989289 d!117321))

(assert (=> b!989156 d!117317))

(declare-fun d!117357 () Bool)

(declare-fun e!557925 () Bool)

(assert (=> d!117357 e!557925))

(declare-fun res!661674 () Bool)

(assert (=> d!117357 (=> res!661674 e!557925)))

(declare-fun lt!438949 () Bool)

(assert (=> d!117357 (= res!661674 (not lt!438949))))

(declare-fun lt!438951 () Bool)

(assert (=> d!117357 (= lt!438949 lt!438951)))

(declare-fun lt!438950 () Unit!32825)

(declare-fun e!557926 () Unit!32825)

(assert (=> d!117357 (= lt!438950 e!557926)))

(declare-fun c!100335 () Bool)

(assert (=> d!117357 (= c!100335 lt!438951)))

(assert (=> d!117357 (= lt!438951 (containsKey!478 (toList!6807 lt!438845) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117357 (= (contains!5719 lt!438845 #b1000000000000000000000000000000000000000000000000000000000000000) lt!438949)))

(declare-fun b!989445 () Bool)

(declare-fun lt!438948 () Unit!32825)

(assert (=> b!989445 (= e!557926 lt!438948)))

(assert (=> b!989445 (= lt!438948 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6807 lt!438845) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!989445 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438845) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989446 () Bool)

(declare-fun Unit!32835 () Unit!32825)

(assert (=> b!989446 (= e!557926 Unit!32835)))

(declare-fun b!989447 () Bool)

(assert (=> b!989447 (= e!557925 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438845) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117357 c!100335) b!989445))

(assert (= (and d!117357 (not c!100335)) b!989446))

(assert (= (and d!117357 (not res!661674)) b!989447))

(declare-fun m!916673 () Bool)

(assert (=> d!117357 m!916673))

(declare-fun m!916675 () Bool)

(assert (=> b!989445 m!916675))

(declare-fun m!916677 () Bool)

(assert (=> b!989445 m!916677))

(assert (=> b!989445 m!916677))

(declare-fun m!916679 () Bool)

(assert (=> b!989445 m!916679))

(assert (=> b!989447 m!916677))

(assert (=> b!989447 m!916677))

(assert (=> b!989447 m!916679))

(assert (=> bm!41919 d!117357))

(declare-fun d!117359 () Bool)

(declare-fun e!557927 () Bool)

(assert (=> d!117359 e!557927))

(declare-fun res!661676 () Bool)

(assert (=> d!117359 (=> (not res!661676) (not e!557927))))

(declare-fun lt!438955 () ListLongMap!13583)

(assert (=> d!117359 (= res!661676 (contains!5719 lt!438955 (_1!7454 (tuple2!14887 lt!438842 minValue!1220))))))

(declare-fun lt!438952 () List!20815)

(assert (=> d!117359 (= lt!438955 (ListLongMap!13584 lt!438952))))

(declare-fun lt!438953 () Unit!32825)

(declare-fun lt!438954 () Unit!32825)

(assert (=> d!117359 (= lt!438953 lt!438954)))

(assert (=> d!117359 (= (getValueByKey!513 lt!438952 (_1!7454 (tuple2!14887 lt!438842 minValue!1220))) (Some!518 (_2!7454 (tuple2!14887 lt!438842 minValue!1220))))))

(assert (=> d!117359 (= lt!438954 (lemmaContainsTupThenGetReturnValue!272 lt!438952 (_1!7454 (tuple2!14887 lt!438842 minValue!1220)) (_2!7454 (tuple2!14887 lt!438842 minValue!1220))))))

(assert (=> d!117359 (= lt!438952 (insertStrictlySorted!329 (toList!6807 lt!438838) (_1!7454 (tuple2!14887 lt!438842 minValue!1220)) (_2!7454 (tuple2!14887 lt!438842 minValue!1220))))))

(assert (=> d!117359 (= (+!3085 lt!438838 (tuple2!14887 lt!438842 minValue!1220)) lt!438955)))

(declare-fun b!989448 () Bool)

(declare-fun res!661675 () Bool)

(assert (=> b!989448 (=> (not res!661675) (not e!557927))))

(assert (=> b!989448 (= res!661675 (= (getValueByKey!513 (toList!6807 lt!438955) (_1!7454 (tuple2!14887 lt!438842 minValue!1220))) (Some!518 (_2!7454 (tuple2!14887 lt!438842 minValue!1220)))))))

(declare-fun b!989449 () Bool)

(assert (=> b!989449 (= e!557927 (contains!5720 (toList!6807 lt!438955) (tuple2!14887 lt!438842 minValue!1220)))))

(assert (= (and d!117359 res!661676) b!989448))

(assert (= (and b!989448 res!661675) b!989449))

(declare-fun m!916681 () Bool)

(assert (=> d!117359 m!916681))

(declare-fun m!916683 () Bool)

(assert (=> d!117359 m!916683))

(declare-fun m!916685 () Bool)

(assert (=> d!117359 m!916685))

(declare-fun m!916687 () Bool)

(assert (=> d!117359 m!916687))

(declare-fun m!916689 () Bool)

(assert (=> b!989448 m!916689))

(declare-fun m!916691 () Bool)

(assert (=> b!989449 m!916691))

(assert (=> b!989243 d!117359))

(declare-fun d!117361 () Bool)

(assert (=> d!117361 (= (apply!895 (+!3085 lt!438843 (tuple2!14887 lt!438841 minValue!1220)) lt!438836) (apply!895 lt!438843 lt!438836))))

(declare-fun lt!438958 () Unit!32825)

(declare-fun choose!1613 (ListLongMap!13583 (_ BitVec 64) V!35995 (_ BitVec 64)) Unit!32825)

(assert (=> d!117361 (= lt!438958 (choose!1613 lt!438843 lt!438841 minValue!1220 lt!438836))))

(declare-fun e!557930 () Bool)

(assert (=> d!117361 e!557930))

(declare-fun res!661679 () Bool)

(assert (=> d!117361 (=> (not res!661679) (not e!557930))))

(assert (=> d!117361 (= res!661679 (contains!5719 lt!438843 lt!438836))))

(assert (=> d!117361 (= (addApplyDifferent!475 lt!438843 lt!438841 minValue!1220 lt!438836) lt!438958)))

(declare-fun b!989453 () Bool)

(assert (=> b!989453 (= e!557930 (not (= lt!438836 lt!438841)))))

(assert (= (and d!117361 res!661679) b!989453))

(assert (=> d!117361 m!916417))

(assert (=> d!117361 m!916441))

(declare-fun m!916693 () Bool)

(assert (=> d!117361 m!916693))

(declare-fun m!916695 () Bool)

(assert (=> d!117361 m!916695))

(assert (=> d!117361 m!916417))

(assert (=> d!117361 m!916425))

(assert (=> b!989243 d!117361))

(declare-fun d!117363 () Bool)

(assert (=> d!117363 (= (apply!895 (+!3085 lt!438844 (tuple2!14887 lt!438848 zeroValue!1220)) lt!438852) (apply!895 lt!438844 lt!438852))))

(declare-fun lt!438959 () Unit!32825)

(assert (=> d!117363 (= lt!438959 (choose!1613 lt!438844 lt!438848 zeroValue!1220 lt!438852))))

(declare-fun e!557931 () Bool)

(assert (=> d!117363 e!557931))

(declare-fun res!661680 () Bool)

(assert (=> d!117363 (=> (not res!661680) (not e!557931))))

(assert (=> d!117363 (= res!661680 (contains!5719 lt!438844 lt!438852))))

(assert (=> d!117363 (= (addApplyDifferent!475 lt!438844 lt!438848 zeroValue!1220 lt!438852) lt!438959)))

(declare-fun b!989454 () Bool)

(assert (=> b!989454 (= e!557931 (not (= lt!438852 lt!438848)))))

(assert (= (and d!117363 res!661680) b!989454))

(assert (=> d!117363 m!916413))

(assert (=> d!117363 m!916415))

(declare-fun m!916697 () Bool)

(assert (=> d!117363 m!916697))

(declare-fun m!916699 () Bool)

(assert (=> d!117363 m!916699))

(assert (=> d!117363 m!916413))

(assert (=> d!117363 m!916435))

(assert (=> b!989243 d!117363))

(declare-fun d!117365 () Bool)

(declare-fun e!557932 () Bool)

(assert (=> d!117365 e!557932))

(declare-fun res!661682 () Bool)

(assert (=> d!117365 (=> (not res!661682) (not e!557932))))

(declare-fun lt!438963 () ListLongMap!13583)

(assert (=> d!117365 (= res!661682 (contains!5719 lt!438963 (_1!7454 (tuple2!14887 lt!438841 minValue!1220))))))

(declare-fun lt!438960 () List!20815)

(assert (=> d!117365 (= lt!438963 (ListLongMap!13584 lt!438960))))

(declare-fun lt!438961 () Unit!32825)

(declare-fun lt!438962 () Unit!32825)

(assert (=> d!117365 (= lt!438961 lt!438962)))

(assert (=> d!117365 (= (getValueByKey!513 lt!438960 (_1!7454 (tuple2!14887 lt!438841 minValue!1220))) (Some!518 (_2!7454 (tuple2!14887 lt!438841 minValue!1220))))))

(assert (=> d!117365 (= lt!438962 (lemmaContainsTupThenGetReturnValue!272 lt!438960 (_1!7454 (tuple2!14887 lt!438841 minValue!1220)) (_2!7454 (tuple2!14887 lt!438841 minValue!1220))))))

(assert (=> d!117365 (= lt!438960 (insertStrictlySorted!329 (toList!6807 lt!438843) (_1!7454 (tuple2!14887 lt!438841 minValue!1220)) (_2!7454 (tuple2!14887 lt!438841 minValue!1220))))))

(assert (=> d!117365 (= (+!3085 lt!438843 (tuple2!14887 lt!438841 minValue!1220)) lt!438963)))

(declare-fun b!989455 () Bool)

(declare-fun res!661681 () Bool)

(assert (=> b!989455 (=> (not res!661681) (not e!557932))))

(assert (=> b!989455 (= res!661681 (= (getValueByKey!513 (toList!6807 lt!438963) (_1!7454 (tuple2!14887 lt!438841 minValue!1220))) (Some!518 (_2!7454 (tuple2!14887 lt!438841 minValue!1220)))))))

(declare-fun b!989456 () Bool)

(assert (=> b!989456 (= e!557932 (contains!5720 (toList!6807 lt!438963) (tuple2!14887 lt!438841 minValue!1220)))))

(assert (= (and d!117365 res!661682) b!989455))

(assert (= (and b!989455 res!661681) b!989456))

(declare-fun m!916701 () Bool)

(assert (=> d!117365 m!916701))

(declare-fun m!916703 () Bool)

(assert (=> d!117365 m!916703))

(declare-fun m!916705 () Bool)

(assert (=> d!117365 m!916705))

(declare-fun m!916707 () Bool)

(assert (=> d!117365 m!916707))

(declare-fun m!916709 () Bool)

(assert (=> b!989455 m!916709))

(declare-fun m!916711 () Bool)

(assert (=> b!989456 m!916711))

(assert (=> b!989243 d!117365))

(assert (=> b!989243 d!117345))

(declare-fun d!117367 () Bool)

(declare-fun get!15623 (Option!519) V!35995)

(assert (=> d!117367 (= (apply!895 (+!3085 lt!438843 (tuple2!14887 lt!438841 minValue!1220)) lt!438836) (get!15623 (getValueByKey!513 (toList!6807 (+!3085 lt!438843 (tuple2!14887 lt!438841 minValue!1220))) lt!438836)))))

(declare-fun bs!28077 () Bool)

(assert (= bs!28077 d!117367))

(declare-fun m!916713 () Bool)

(assert (=> bs!28077 m!916713))

(assert (=> bs!28077 m!916713))

(declare-fun m!916715 () Bool)

(assert (=> bs!28077 m!916715))

(assert (=> b!989243 d!117367))

(declare-fun d!117369 () Bool)

(declare-fun e!557933 () Bool)

(assert (=> d!117369 e!557933))

(declare-fun res!661684 () Bool)

(assert (=> d!117369 (=> (not res!661684) (not e!557933))))

(declare-fun lt!438967 () ListLongMap!13583)

(assert (=> d!117369 (= res!661684 (contains!5719 lt!438967 (_1!7454 (tuple2!14887 lt!438848 zeroValue!1220))))))

(declare-fun lt!438964 () List!20815)

(assert (=> d!117369 (= lt!438967 (ListLongMap!13584 lt!438964))))

(declare-fun lt!438965 () Unit!32825)

(declare-fun lt!438966 () Unit!32825)

(assert (=> d!117369 (= lt!438965 lt!438966)))

(assert (=> d!117369 (= (getValueByKey!513 lt!438964 (_1!7454 (tuple2!14887 lt!438848 zeroValue!1220))) (Some!518 (_2!7454 (tuple2!14887 lt!438848 zeroValue!1220))))))

(assert (=> d!117369 (= lt!438966 (lemmaContainsTupThenGetReturnValue!272 lt!438964 (_1!7454 (tuple2!14887 lt!438848 zeroValue!1220)) (_2!7454 (tuple2!14887 lt!438848 zeroValue!1220))))))

(assert (=> d!117369 (= lt!438964 (insertStrictlySorted!329 (toList!6807 lt!438844) (_1!7454 (tuple2!14887 lt!438848 zeroValue!1220)) (_2!7454 (tuple2!14887 lt!438848 zeroValue!1220))))))

(assert (=> d!117369 (= (+!3085 lt!438844 (tuple2!14887 lt!438848 zeroValue!1220)) lt!438967)))

(declare-fun b!989457 () Bool)

(declare-fun res!661683 () Bool)

(assert (=> b!989457 (=> (not res!661683) (not e!557933))))

(assert (=> b!989457 (= res!661683 (= (getValueByKey!513 (toList!6807 lt!438967) (_1!7454 (tuple2!14887 lt!438848 zeroValue!1220))) (Some!518 (_2!7454 (tuple2!14887 lt!438848 zeroValue!1220)))))))

(declare-fun b!989458 () Bool)

(assert (=> b!989458 (= e!557933 (contains!5720 (toList!6807 lt!438967) (tuple2!14887 lt!438848 zeroValue!1220)))))

(assert (= (and d!117369 res!661684) b!989457))

(assert (= (and b!989457 res!661683) b!989458))

(declare-fun m!916717 () Bool)

(assert (=> d!117369 m!916717))

(declare-fun m!916719 () Bool)

(assert (=> d!117369 m!916719))

(declare-fun m!916721 () Bool)

(assert (=> d!117369 m!916721))

(declare-fun m!916723 () Bool)

(assert (=> d!117369 m!916723))

(declare-fun m!916725 () Bool)

(assert (=> b!989457 m!916725))

(declare-fun m!916727 () Bool)

(assert (=> b!989458 m!916727))

(assert (=> b!989243 d!117369))

(declare-fun d!117371 () Bool)

(assert (=> d!117371 (= (apply!895 (+!3085 lt!438844 (tuple2!14887 lt!438848 zeroValue!1220)) lt!438852) (get!15623 (getValueByKey!513 (toList!6807 (+!3085 lt!438844 (tuple2!14887 lt!438848 zeroValue!1220))) lt!438852)))))

(declare-fun bs!28078 () Bool)

(assert (= bs!28078 d!117371))

(declare-fun m!916729 () Bool)

(assert (=> bs!28078 m!916729))

(assert (=> bs!28078 m!916729))

(declare-fun m!916731 () Bool)

(assert (=> bs!28078 m!916731))

(assert (=> b!989243 d!117371))

(declare-fun d!117373 () Bool)

(assert (=> d!117373 (= (apply!895 (+!3085 lt!438838 (tuple2!14887 lt!438842 minValue!1220)) lt!438851) (apply!895 lt!438838 lt!438851))))

(declare-fun lt!438968 () Unit!32825)

(assert (=> d!117373 (= lt!438968 (choose!1613 lt!438838 lt!438842 minValue!1220 lt!438851))))

(declare-fun e!557934 () Bool)

(assert (=> d!117373 e!557934))

(declare-fun res!661685 () Bool)

(assert (=> d!117373 (=> (not res!661685) (not e!557934))))

(assert (=> d!117373 (= res!661685 (contains!5719 lt!438838 lt!438851))))

(assert (=> d!117373 (= (addApplyDifferent!475 lt!438838 lt!438842 minValue!1220 lt!438851) lt!438968)))

(declare-fun b!989459 () Bool)

(assert (=> b!989459 (= e!557934 (not (= lt!438851 lt!438842)))))

(assert (= (and d!117373 res!661685) b!989459))

(assert (=> d!117373 m!916421))

(assert (=> d!117373 m!916443))

(declare-fun m!916733 () Bool)

(assert (=> d!117373 m!916733))

(declare-fun m!916735 () Bool)

(assert (=> d!117373 m!916735))

(assert (=> d!117373 m!916421))

(assert (=> d!117373 m!916433))

(assert (=> b!989243 d!117373))

(declare-fun d!117375 () Bool)

(declare-fun e!557935 () Bool)

(assert (=> d!117375 e!557935))

(declare-fun res!661686 () Bool)

(assert (=> d!117375 (=> res!661686 e!557935)))

(declare-fun lt!438970 () Bool)

(assert (=> d!117375 (= res!661686 (not lt!438970))))

(declare-fun lt!438972 () Bool)

(assert (=> d!117375 (= lt!438970 lt!438972)))

(declare-fun lt!438971 () Unit!32825)

(declare-fun e!557936 () Unit!32825)

(assert (=> d!117375 (= lt!438971 e!557936)))

(declare-fun c!100336 () Bool)

(assert (=> d!117375 (= c!100336 lt!438972)))

(assert (=> d!117375 (= lt!438972 (containsKey!478 (toList!6807 (+!3085 lt!438837 (tuple2!14887 lt!438833 zeroValue!1220))) lt!438834))))

(assert (=> d!117375 (= (contains!5719 (+!3085 lt!438837 (tuple2!14887 lt!438833 zeroValue!1220)) lt!438834) lt!438970)))

(declare-fun b!989460 () Bool)

(declare-fun lt!438969 () Unit!32825)

(assert (=> b!989460 (= e!557936 lt!438969)))

(assert (=> b!989460 (= lt!438969 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6807 (+!3085 lt!438837 (tuple2!14887 lt!438833 zeroValue!1220))) lt!438834))))

(assert (=> b!989460 (isDefined!383 (getValueByKey!513 (toList!6807 (+!3085 lt!438837 (tuple2!14887 lt!438833 zeroValue!1220))) lt!438834))))

(declare-fun b!989461 () Bool)

(declare-fun Unit!32836 () Unit!32825)

(assert (=> b!989461 (= e!557936 Unit!32836)))

(declare-fun b!989462 () Bool)

(assert (=> b!989462 (= e!557935 (isDefined!383 (getValueByKey!513 (toList!6807 (+!3085 lt!438837 (tuple2!14887 lt!438833 zeroValue!1220))) lt!438834)))))

(assert (= (and d!117375 c!100336) b!989460))

(assert (= (and d!117375 (not c!100336)) b!989461))

(assert (= (and d!117375 (not res!661686)) b!989462))

(declare-fun m!916737 () Bool)

(assert (=> d!117375 m!916737))

(declare-fun m!916739 () Bool)

(assert (=> b!989460 m!916739))

(declare-fun m!916741 () Bool)

(assert (=> b!989460 m!916741))

(assert (=> b!989460 m!916741))

(declare-fun m!916743 () Bool)

(assert (=> b!989460 m!916743))

(assert (=> b!989462 m!916741))

(assert (=> b!989462 m!916741))

(assert (=> b!989462 m!916743))

(assert (=> b!989243 d!117375))

(declare-fun d!117377 () Bool)

(assert (=> d!117377 (= (apply!895 lt!438838 lt!438851) (get!15623 (getValueByKey!513 (toList!6807 lt!438838) lt!438851)))))

(declare-fun bs!28079 () Bool)

(assert (= bs!28079 d!117377))

(declare-fun m!916745 () Bool)

(assert (=> bs!28079 m!916745))

(assert (=> bs!28079 m!916745))

(declare-fun m!916747 () Bool)

(assert (=> bs!28079 m!916747))

(assert (=> b!989243 d!117377))

(declare-fun d!117379 () Bool)

(assert (=> d!117379 (contains!5719 (+!3085 lt!438837 (tuple2!14887 lt!438833 zeroValue!1220)) lt!438834)))

(declare-fun lt!438975 () Unit!32825)

(declare-fun choose!1614 (ListLongMap!13583 (_ BitVec 64) V!35995 (_ BitVec 64)) Unit!32825)

(assert (=> d!117379 (= lt!438975 (choose!1614 lt!438837 lt!438833 zeroValue!1220 lt!438834))))

(assert (=> d!117379 (contains!5719 lt!438837 lt!438834)))

(assert (=> d!117379 (= (addStillContains!615 lt!438837 lt!438833 zeroValue!1220 lt!438834) lt!438975)))

(declare-fun bs!28080 () Bool)

(assert (= bs!28080 d!117379))

(assert (=> bs!28080 m!916429))

(assert (=> bs!28080 m!916429))

(assert (=> bs!28080 m!916431))

(declare-fun m!916749 () Bool)

(assert (=> bs!28080 m!916749))

(declare-fun m!916751 () Bool)

(assert (=> bs!28080 m!916751))

(assert (=> b!989243 d!117379))

(declare-fun d!117381 () Bool)

(assert (=> d!117381 (= (apply!895 lt!438844 lt!438852) (get!15623 (getValueByKey!513 (toList!6807 lt!438844) lt!438852)))))

(declare-fun bs!28081 () Bool)

(assert (= bs!28081 d!117381))

(declare-fun m!916753 () Bool)

(assert (=> bs!28081 m!916753))

(assert (=> bs!28081 m!916753))

(declare-fun m!916755 () Bool)

(assert (=> bs!28081 m!916755))

(assert (=> b!989243 d!117381))

(declare-fun d!117383 () Bool)

(assert (=> d!117383 (= (apply!895 lt!438843 lt!438836) (get!15623 (getValueByKey!513 (toList!6807 lt!438843) lt!438836)))))

(declare-fun bs!28082 () Bool)

(assert (= bs!28082 d!117383))

(declare-fun m!916757 () Bool)

(assert (=> bs!28082 m!916757))

(assert (=> bs!28082 m!916757))

(declare-fun m!916759 () Bool)

(assert (=> bs!28082 m!916759))

(assert (=> b!989243 d!117383))

(declare-fun d!117385 () Bool)

(assert (=> d!117385 (= (apply!895 (+!3085 lt!438838 (tuple2!14887 lt!438842 minValue!1220)) lt!438851) (get!15623 (getValueByKey!513 (toList!6807 (+!3085 lt!438838 (tuple2!14887 lt!438842 minValue!1220))) lt!438851)))))

(declare-fun bs!28083 () Bool)

(assert (= bs!28083 d!117385))

(declare-fun m!916761 () Bool)

(assert (=> bs!28083 m!916761))

(assert (=> bs!28083 m!916761))

(declare-fun m!916763 () Bool)

(assert (=> bs!28083 m!916763))

(assert (=> b!989243 d!117385))

(declare-fun d!117387 () Bool)

(declare-fun e!557937 () Bool)

(assert (=> d!117387 e!557937))

(declare-fun res!661688 () Bool)

(assert (=> d!117387 (=> (not res!661688) (not e!557937))))

(declare-fun lt!438979 () ListLongMap!13583)

(assert (=> d!117387 (= res!661688 (contains!5719 lt!438979 (_1!7454 (tuple2!14887 lt!438833 zeroValue!1220))))))

(declare-fun lt!438976 () List!20815)

(assert (=> d!117387 (= lt!438979 (ListLongMap!13584 lt!438976))))

(declare-fun lt!438977 () Unit!32825)

(declare-fun lt!438978 () Unit!32825)

(assert (=> d!117387 (= lt!438977 lt!438978)))

(assert (=> d!117387 (= (getValueByKey!513 lt!438976 (_1!7454 (tuple2!14887 lt!438833 zeroValue!1220))) (Some!518 (_2!7454 (tuple2!14887 lt!438833 zeroValue!1220))))))

(assert (=> d!117387 (= lt!438978 (lemmaContainsTupThenGetReturnValue!272 lt!438976 (_1!7454 (tuple2!14887 lt!438833 zeroValue!1220)) (_2!7454 (tuple2!14887 lt!438833 zeroValue!1220))))))

(assert (=> d!117387 (= lt!438976 (insertStrictlySorted!329 (toList!6807 lt!438837) (_1!7454 (tuple2!14887 lt!438833 zeroValue!1220)) (_2!7454 (tuple2!14887 lt!438833 zeroValue!1220))))))

(assert (=> d!117387 (= (+!3085 lt!438837 (tuple2!14887 lt!438833 zeroValue!1220)) lt!438979)))

(declare-fun b!989464 () Bool)

(declare-fun res!661687 () Bool)

(assert (=> b!989464 (=> (not res!661687) (not e!557937))))

(assert (=> b!989464 (= res!661687 (= (getValueByKey!513 (toList!6807 lt!438979) (_1!7454 (tuple2!14887 lt!438833 zeroValue!1220))) (Some!518 (_2!7454 (tuple2!14887 lt!438833 zeroValue!1220)))))))

(declare-fun b!989465 () Bool)

(assert (=> b!989465 (= e!557937 (contains!5720 (toList!6807 lt!438979) (tuple2!14887 lt!438833 zeroValue!1220)))))

(assert (= (and d!117387 res!661688) b!989464))

(assert (= (and b!989464 res!661687) b!989465))

(declare-fun m!916765 () Bool)

(assert (=> d!117387 m!916765))

(declare-fun m!916767 () Bool)

(assert (=> d!117387 m!916767))

(declare-fun m!916769 () Bool)

(assert (=> d!117387 m!916769))

(declare-fun m!916771 () Bool)

(assert (=> d!117387 m!916771))

(declare-fun m!916773 () Bool)

(assert (=> b!989464 m!916773))

(declare-fun m!916775 () Bool)

(assert (=> b!989465 m!916775))

(assert (=> b!989243 d!117387))

(declare-fun d!117389 () Bool)

(declare-fun isEmpty!724 (List!20815) Bool)

(assert (=> d!117389 (= (isEmpty!723 lt!438875) (isEmpty!724 (toList!6807 lt!438875)))))

(declare-fun bs!28084 () Bool)

(assert (= bs!28084 d!117389))

(declare-fun m!916777 () Bool)

(assert (=> bs!28084 m!916777))

(assert (=> b!989296 d!117389))

(declare-fun d!117391 () Bool)

(assert (=> d!117391 (= (apply!895 (+!3085 lt!438813 (tuple2!14887 lt!438811 minValue!1220)) lt!438806) (apply!895 lt!438813 lt!438806))))

(declare-fun lt!438980 () Unit!32825)

(assert (=> d!117391 (= lt!438980 (choose!1613 lt!438813 lt!438811 minValue!1220 lt!438806))))

(declare-fun e!557938 () Bool)

(assert (=> d!117391 e!557938))

(declare-fun res!661689 () Bool)

(assert (=> d!117391 (=> (not res!661689) (not e!557938))))

(assert (=> d!117391 (= res!661689 (contains!5719 lt!438813 lt!438806))))

(assert (=> d!117391 (= (addApplyDifferent!475 lt!438813 lt!438811 minValue!1220 lt!438806) lt!438980)))

(declare-fun b!989466 () Bool)

(assert (=> b!989466 (= e!557938 (not (= lt!438806 lt!438811)))))

(assert (= (and d!117391 res!661689) b!989466))

(assert (=> d!117391 m!916341))

(assert (=> d!117391 m!916363))

(declare-fun m!916779 () Bool)

(assert (=> d!117391 m!916779))

(declare-fun m!916781 () Bool)

(assert (=> d!117391 m!916781))

(assert (=> d!117391 m!916341))

(assert (=> d!117391 m!916347))

(assert (=> b!989218 d!117391))

(declare-fun d!117393 () Bool)

(declare-fun e!557939 () Bool)

(assert (=> d!117393 e!557939))

(declare-fun res!661690 () Bool)

(assert (=> d!117393 (=> res!661690 e!557939)))

(declare-fun lt!438982 () Bool)

(assert (=> d!117393 (= res!661690 (not lt!438982))))

(declare-fun lt!438984 () Bool)

(assert (=> d!117393 (= lt!438982 lt!438984)))

(declare-fun lt!438983 () Unit!32825)

(declare-fun e!557940 () Unit!32825)

(assert (=> d!117393 (= lt!438983 e!557940)))

(declare-fun c!100337 () Bool)

(assert (=> d!117393 (= c!100337 lt!438984)))

(assert (=> d!117393 (= lt!438984 (containsKey!478 (toList!6807 (+!3085 lt!438807 (tuple2!14887 lt!438803 zeroValue!1220))) lt!438804))))

(assert (=> d!117393 (= (contains!5719 (+!3085 lt!438807 (tuple2!14887 lt!438803 zeroValue!1220)) lt!438804) lt!438982)))

(declare-fun b!989467 () Bool)

(declare-fun lt!438981 () Unit!32825)

(assert (=> b!989467 (= e!557940 lt!438981)))

(assert (=> b!989467 (= lt!438981 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6807 (+!3085 lt!438807 (tuple2!14887 lt!438803 zeroValue!1220))) lt!438804))))

(assert (=> b!989467 (isDefined!383 (getValueByKey!513 (toList!6807 (+!3085 lt!438807 (tuple2!14887 lt!438803 zeroValue!1220))) lt!438804))))

(declare-fun b!989468 () Bool)

(declare-fun Unit!32837 () Unit!32825)

(assert (=> b!989468 (= e!557940 Unit!32837)))

(declare-fun b!989469 () Bool)

(assert (=> b!989469 (= e!557939 (isDefined!383 (getValueByKey!513 (toList!6807 (+!3085 lt!438807 (tuple2!14887 lt!438803 zeroValue!1220))) lt!438804)))))

(assert (= (and d!117393 c!100337) b!989467))

(assert (= (and d!117393 (not c!100337)) b!989468))

(assert (= (and d!117393 (not res!661690)) b!989469))

(declare-fun m!916783 () Bool)

(assert (=> d!117393 m!916783))

(declare-fun m!916785 () Bool)

(assert (=> b!989467 m!916785))

(declare-fun m!916787 () Bool)

(assert (=> b!989467 m!916787))

(assert (=> b!989467 m!916787))

(declare-fun m!916789 () Bool)

(assert (=> b!989467 m!916789))

(assert (=> b!989469 m!916787))

(assert (=> b!989469 m!916787))

(assert (=> b!989469 m!916789))

(assert (=> b!989218 d!117393))

(declare-fun d!117395 () Bool)

(declare-fun e!557941 () Bool)

(assert (=> d!117395 e!557941))

(declare-fun res!661692 () Bool)

(assert (=> d!117395 (=> (not res!661692) (not e!557941))))

(declare-fun lt!438988 () ListLongMap!13583)

(assert (=> d!117395 (= res!661692 (contains!5719 lt!438988 (_1!7454 (tuple2!14887 lt!438812 minValue!1220))))))

(declare-fun lt!438985 () List!20815)

(assert (=> d!117395 (= lt!438988 (ListLongMap!13584 lt!438985))))

(declare-fun lt!438986 () Unit!32825)

(declare-fun lt!438987 () Unit!32825)

(assert (=> d!117395 (= lt!438986 lt!438987)))

(assert (=> d!117395 (= (getValueByKey!513 lt!438985 (_1!7454 (tuple2!14887 lt!438812 minValue!1220))) (Some!518 (_2!7454 (tuple2!14887 lt!438812 minValue!1220))))))

(assert (=> d!117395 (= lt!438987 (lemmaContainsTupThenGetReturnValue!272 lt!438985 (_1!7454 (tuple2!14887 lt!438812 minValue!1220)) (_2!7454 (tuple2!14887 lt!438812 minValue!1220))))))

(assert (=> d!117395 (= lt!438985 (insertStrictlySorted!329 (toList!6807 lt!438808) (_1!7454 (tuple2!14887 lt!438812 minValue!1220)) (_2!7454 (tuple2!14887 lt!438812 minValue!1220))))))

(assert (=> d!117395 (= (+!3085 lt!438808 (tuple2!14887 lt!438812 minValue!1220)) lt!438988)))

(declare-fun b!989470 () Bool)

(declare-fun res!661691 () Bool)

(assert (=> b!989470 (=> (not res!661691) (not e!557941))))

(assert (=> b!989470 (= res!661691 (= (getValueByKey!513 (toList!6807 lt!438988) (_1!7454 (tuple2!14887 lt!438812 minValue!1220))) (Some!518 (_2!7454 (tuple2!14887 lt!438812 minValue!1220)))))))

(declare-fun b!989471 () Bool)

(assert (=> b!989471 (= e!557941 (contains!5720 (toList!6807 lt!438988) (tuple2!14887 lt!438812 minValue!1220)))))

(assert (= (and d!117395 res!661692) b!989470))

(assert (= (and b!989470 res!661691) b!989471))

(declare-fun m!916791 () Bool)

(assert (=> d!117395 m!916791))

(declare-fun m!916793 () Bool)

(assert (=> d!117395 m!916793))

(declare-fun m!916795 () Bool)

(assert (=> d!117395 m!916795))

(declare-fun m!916797 () Bool)

(assert (=> d!117395 m!916797))

(declare-fun m!916799 () Bool)

(assert (=> b!989470 m!916799))

(declare-fun m!916801 () Bool)

(assert (=> b!989471 m!916801))

(assert (=> b!989218 d!117395))

(assert (=> b!989218 d!117301))

(declare-fun d!117397 () Bool)

(assert (=> d!117397 (= (apply!895 (+!3085 lt!438808 (tuple2!14887 lt!438812 minValue!1220)) lt!438821) (apply!895 lt!438808 lt!438821))))

(declare-fun lt!438989 () Unit!32825)

(assert (=> d!117397 (= lt!438989 (choose!1613 lt!438808 lt!438812 minValue!1220 lt!438821))))

(declare-fun e!557942 () Bool)

(assert (=> d!117397 e!557942))

(declare-fun res!661693 () Bool)

(assert (=> d!117397 (=> (not res!661693) (not e!557942))))

(assert (=> d!117397 (= res!661693 (contains!5719 lt!438808 lt!438821))))

(assert (=> d!117397 (= (addApplyDifferent!475 lt!438808 lt!438812 minValue!1220 lt!438821) lt!438989)))

(declare-fun b!989472 () Bool)

(assert (=> b!989472 (= e!557942 (not (= lt!438821 lt!438812)))))

(assert (= (and d!117397 res!661693) b!989472))

(assert (=> d!117397 m!916345))

(assert (=> d!117397 m!916365))

(declare-fun m!916803 () Bool)

(assert (=> d!117397 m!916803))

(declare-fun m!916805 () Bool)

(assert (=> d!117397 m!916805))

(assert (=> d!117397 m!916345))

(assert (=> d!117397 m!916355))

(assert (=> b!989218 d!117397))

(declare-fun d!117399 () Bool)

(assert (=> d!117399 (= (apply!895 (+!3085 lt!438813 (tuple2!14887 lt!438811 minValue!1220)) lt!438806) (get!15623 (getValueByKey!513 (toList!6807 (+!3085 lt!438813 (tuple2!14887 lt!438811 minValue!1220))) lt!438806)))))

(declare-fun bs!28085 () Bool)

(assert (= bs!28085 d!117399))

(declare-fun m!916807 () Bool)

(assert (=> bs!28085 m!916807))

(assert (=> bs!28085 m!916807))

(declare-fun m!916809 () Bool)

(assert (=> bs!28085 m!916809))

(assert (=> b!989218 d!117399))

(declare-fun d!117401 () Bool)

(assert (=> d!117401 (= (apply!895 (+!3085 lt!438808 (tuple2!14887 lt!438812 minValue!1220)) lt!438821) (get!15623 (getValueByKey!513 (toList!6807 (+!3085 lt!438808 (tuple2!14887 lt!438812 minValue!1220))) lt!438821)))))

(declare-fun bs!28086 () Bool)

(assert (= bs!28086 d!117401))

(declare-fun m!916811 () Bool)

(assert (=> bs!28086 m!916811))

(assert (=> bs!28086 m!916811))

(declare-fun m!916813 () Bool)

(assert (=> bs!28086 m!916813))

(assert (=> b!989218 d!117401))

(declare-fun d!117403 () Bool)

(assert (=> d!117403 (= (apply!895 (+!3085 lt!438814 (tuple2!14887 lt!438818 zeroValue!1220)) lt!438822) (apply!895 lt!438814 lt!438822))))

(declare-fun lt!438990 () Unit!32825)

(assert (=> d!117403 (= lt!438990 (choose!1613 lt!438814 lt!438818 zeroValue!1220 lt!438822))))

(declare-fun e!557943 () Bool)

(assert (=> d!117403 e!557943))

(declare-fun res!661694 () Bool)

(assert (=> d!117403 (=> (not res!661694) (not e!557943))))

(assert (=> d!117403 (= res!661694 (contains!5719 lt!438814 lt!438822))))

(assert (=> d!117403 (= (addApplyDifferent!475 lt!438814 lt!438818 zeroValue!1220 lt!438822) lt!438990)))

(declare-fun b!989473 () Bool)

(assert (=> b!989473 (= e!557943 (not (= lt!438822 lt!438818)))))

(assert (= (and d!117403 res!661694) b!989473))

(assert (=> d!117403 m!916337))

(assert (=> d!117403 m!916339))

(declare-fun m!916815 () Bool)

(assert (=> d!117403 m!916815))

(declare-fun m!916817 () Bool)

(assert (=> d!117403 m!916817))

(assert (=> d!117403 m!916337))

(assert (=> d!117403 m!916357))

(assert (=> b!989218 d!117403))

(declare-fun d!117405 () Bool)

(assert (=> d!117405 (contains!5719 (+!3085 lt!438807 (tuple2!14887 lt!438803 zeroValue!1220)) lt!438804)))

(declare-fun lt!438991 () Unit!32825)

(assert (=> d!117405 (= lt!438991 (choose!1614 lt!438807 lt!438803 zeroValue!1220 lt!438804))))

(assert (=> d!117405 (contains!5719 lt!438807 lt!438804)))

(assert (=> d!117405 (= (addStillContains!615 lt!438807 lt!438803 zeroValue!1220 lt!438804) lt!438991)))

(declare-fun bs!28087 () Bool)

(assert (= bs!28087 d!117405))

(assert (=> bs!28087 m!916351))

(assert (=> bs!28087 m!916351))

(assert (=> bs!28087 m!916353))

(declare-fun m!916819 () Bool)

(assert (=> bs!28087 m!916819))

(declare-fun m!916821 () Bool)

(assert (=> bs!28087 m!916821))

(assert (=> b!989218 d!117405))

(declare-fun d!117407 () Bool)

(declare-fun e!557944 () Bool)

(assert (=> d!117407 e!557944))

(declare-fun res!661696 () Bool)

(assert (=> d!117407 (=> (not res!661696) (not e!557944))))

(declare-fun lt!438995 () ListLongMap!13583)

(assert (=> d!117407 (= res!661696 (contains!5719 lt!438995 (_1!7454 (tuple2!14887 lt!438818 zeroValue!1220))))))

(declare-fun lt!438992 () List!20815)

(assert (=> d!117407 (= lt!438995 (ListLongMap!13584 lt!438992))))

(declare-fun lt!438993 () Unit!32825)

(declare-fun lt!438994 () Unit!32825)

(assert (=> d!117407 (= lt!438993 lt!438994)))

(assert (=> d!117407 (= (getValueByKey!513 lt!438992 (_1!7454 (tuple2!14887 lt!438818 zeroValue!1220))) (Some!518 (_2!7454 (tuple2!14887 lt!438818 zeroValue!1220))))))

(assert (=> d!117407 (= lt!438994 (lemmaContainsTupThenGetReturnValue!272 lt!438992 (_1!7454 (tuple2!14887 lt!438818 zeroValue!1220)) (_2!7454 (tuple2!14887 lt!438818 zeroValue!1220))))))

(assert (=> d!117407 (= lt!438992 (insertStrictlySorted!329 (toList!6807 lt!438814) (_1!7454 (tuple2!14887 lt!438818 zeroValue!1220)) (_2!7454 (tuple2!14887 lt!438818 zeroValue!1220))))))

(assert (=> d!117407 (= (+!3085 lt!438814 (tuple2!14887 lt!438818 zeroValue!1220)) lt!438995)))

(declare-fun b!989474 () Bool)

(declare-fun res!661695 () Bool)

(assert (=> b!989474 (=> (not res!661695) (not e!557944))))

(assert (=> b!989474 (= res!661695 (= (getValueByKey!513 (toList!6807 lt!438995) (_1!7454 (tuple2!14887 lt!438818 zeroValue!1220))) (Some!518 (_2!7454 (tuple2!14887 lt!438818 zeroValue!1220)))))))

(declare-fun b!989475 () Bool)

(assert (=> b!989475 (= e!557944 (contains!5720 (toList!6807 lt!438995) (tuple2!14887 lt!438818 zeroValue!1220)))))

(assert (= (and d!117407 res!661696) b!989474))

(assert (= (and b!989474 res!661695) b!989475))

(declare-fun m!916823 () Bool)

(assert (=> d!117407 m!916823))

(declare-fun m!916825 () Bool)

(assert (=> d!117407 m!916825))

(declare-fun m!916827 () Bool)

(assert (=> d!117407 m!916827))

(declare-fun m!916829 () Bool)

(assert (=> d!117407 m!916829))

(declare-fun m!916831 () Bool)

(assert (=> b!989474 m!916831))

(declare-fun m!916833 () Bool)

(assert (=> b!989475 m!916833))

(assert (=> b!989218 d!117407))

(declare-fun d!117409 () Bool)

(assert (=> d!117409 (= (apply!895 lt!438813 lt!438806) (get!15623 (getValueByKey!513 (toList!6807 lt!438813) lt!438806)))))

(declare-fun bs!28088 () Bool)

(assert (= bs!28088 d!117409))

(declare-fun m!916835 () Bool)

(assert (=> bs!28088 m!916835))

(assert (=> bs!28088 m!916835))

(declare-fun m!916837 () Bool)

(assert (=> bs!28088 m!916837))

(assert (=> b!989218 d!117409))

(declare-fun d!117411 () Bool)

(assert (=> d!117411 (= (apply!895 lt!438814 lt!438822) (get!15623 (getValueByKey!513 (toList!6807 lt!438814) lt!438822)))))

(declare-fun bs!28089 () Bool)

(assert (= bs!28089 d!117411))

(declare-fun m!916839 () Bool)

(assert (=> bs!28089 m!916839))

(assert (=> bs!28089 m!916839))

(declare-fun m!916841 () Bool)

(assert (=> bs!28089 m!916841))

(assert (=> b!989218 d!117411))

(declare-fun d!117413 () Bool)

(declare-fun e!557945 () Bool)

(assert (=> d!117413 e!557945))

(declare-fun res!661698 () Bool)

(assert (=> d!117413 (=> (not res!661698) (not e!557945))))

(declare-fun lt!438999 () ListLongMap!13583)

(assert (=> d!117413 (= res!661698 (contains!5719 lt!438999 (_1!7454 (tuple2!14887 lt!438811 minValue!1220))))))

(declare-fun lt!438996 () List!20815)

(assert (=> d!117413 (= lt!438999 (ListLongMap!13584 lt!438996))))

(declare-fun lt!438997 () Unit!32825)

(declare-fun lt!438998 () Unit!32825)

(assert (=> d!117413 (= lt!438997 lt!438998)))

(assert (=> d!117413 (= (getValueByKey!513 lt!438996 (_1!7454 (tuple2!14887 lt!438811 minValue!1220))) (Some!518 (_2!7454 (tuple2!14887 lt!438811 minValue!1220))))))

(assert (=> d!117413 (= lt!438998 (lemmaContainsTupThenGetReturnValue!272 lt!438996 (_1!7454 (tuple2!14887 lt!438811 minValue!1220)) (_2!7454 (tuple2!14887 lt!438811 minValue!1220))))))

(assert (=> d!117413 (= lt!438996 (insertStrictlySorted!329 (toList!6807 lt!438813) (_1!7454 (tuple2!14887 lt!438811 minValue!1220)) (_2!7454 (tuple2!14887 lt!438811 minValue!1220))))))

(assert (=> d!117413 (= (+!3085 lt!438813 (tuple2!14887 lt!438811 minValue!1220)) lt!438999)))

(declare-fun b!989476 () Bool)

(declare-fun res!661697 () Bool)

(assert (=> b!989476 (=> (not res!661697) (not e!557945))))

(assert (=> b!989476 (= res!661697 (= (getValueByKey!513 (toList!6807 lt!438999) (_1!7454 (tuple2!14887 lt!438811 minValue!1220))) (Some!518 (_2!7454 (tuple2!14887 lt!438811 minValue!1220)))))))

(declare-fun b!989477 () Bool)

(assert (=> b!989477 (= e!557945 (contains!5720 (toList!6807 lt!438999) (tuple2!14887 lt!438811 minValue!1220)))))

(assert (= (and d!117413 res!661698) b!989476))

(assert (= (and b!989476 res!661697) b!989477))

(declare-fun m!916843 () Bool)

(assert (=> d!117413 m!916843))

(declare-fun m!916845 () Bool)

(assert (=> d!117413 m!916845))

(declare-fun m!916847 () Bool)

(assert (=> d!117413 m!916847))

(declare-fun m!916849 () Bool)

(assert (=> d!117413 m!916849))

(declare-fun m!916851 () Bool)

(assert (=> b!989476 m!916851))

(declare-fun m!916853 () Bool)

(assert (=> b!989477 m!916853))

(assert (=> b!989218 d!117413))

(declare-fun d!117415 () Bool)

(assert (=> d!117415 (= (apply!895 lt!438808 lt!438821) (get!15623 (getValueByKey!513 (toList!6807 lt!438808) lt!438821)))))

(declare-fun bs!28090 () Bool)

(assert (= bs!28090 d!117415))

(declare-fun m!916855 () Bool)

(assert (=> bs!28090 m!916855))

(assert (=> bs!28090 m!916855))

(declare-fun m!916857 () Bool)

(assert (=> bs!28090 m!916857))

(assert (=> b!989218 d!117415))

(declare-fun d!117417 () Bool)

(declare-fun e!557946 () Bool)

(assert (=> d!117417 e!557946))

(declare-fun res!661700 () Bool)

(assert (=> d!117417 (=> (not res!661700) (not e!557946))))

(declare-fun lt!439003 () ListLongMap!13583)

(assert (=> d!117417 (= res!661700 (contains!5719 lt!439003 (_1!7454 (tuple2!14887 lt!438803 zeroValue!1220))))))

(declare-fun lt!439000 () List!20815)

(assert (=> d!117417 (= lt!439003 (ListLongMap!13584 lt!439000))))

(declare-fun lt!439001 () Unit!32825)

(declare-fun lt!439002 () Unit!32825)

(assert (=> d!117417 (= lt!439001 lt!439002)))

(assert (=> d!117417 (= (getValueByKey!513 lt!439000 (_1!7454 (tuple2!14887 lt!438803 zeroValue!1220))) (Some!518 (_2!7454 (tuple2!14887 lt!438803 zeroValue!1220))))))

(assert (=> d!117417 (= lt!439002 (lemmaContainsTupThenGetReturnValue!272 lt!439000 (_1!7454 (tuple2!14887 lt!438803 zeroValue!1220)) (_2!7454 (tuple2!14887 lt!438803 zeroValue!1220))))))

(assert (=> d!117417 (= lt!439000 (insertStrictlySorted!329 (toList!6807 lt!438807) (_1!7454 (tuple2!14887 lt!438803 zeroValue!1220)) (_2!7454 (tuple2!14887 lt!438803 zeroValue!1220))))))

(assert (=> d!117417 (= (+!3085 lt!438807 (tuple2!14887 lt!438803 zeroValue!1220)) lt!439003)))

(declare-fun b!989478 () Bool)

(declare-fun res!661699 () Bool)

(assert (=> b!989478 (=> (not res!661699) (not e!557946))))

(assert (=> b!989478 (= res!661699 (= (getValueByKey!513 (toList!6807 lt!439003) (_1!7454 (tuple2!14887 lt!438803 zeroValue!1220))) (Some!518 (_2!7454 (tuple2!14887 lt!438803 zeroValue!1220)))))))

(declare-fun b!989479 () Bool)

(assert (=> b!989479 (= e!557946 (contains!5720 (toList!6807 lt!439003) (tuple2!14887 lt!438803 zeroValue!1220)))))

(assert (= (and d!117417 res!661700) b!989478))

(assert (= (and b!989478 res!661699) b!989479))

(declare-fun m!916859 () Bool)

(assert (=> d!117417 m!916859))

(declare-fun m!916861 () Bool)

(assert (=> d!117417 m!916861))

(declare-fun m!916863 () Bool)

(assert (=> d!117417 m!916863))

(declare-fun m!916865 () Bool)

(assert (=> d!117417 m!916865))

(declare-fun m!916867 () Bool)

(assert (=> b!989478 m!916867))

(declare-fun m!916869 () Bool)

(assert (=> b!989479 m!916869))

(assert (=> b!989218 d!117417))

(declare-fun d!117419 () Bool)

(assert (=> d!117419 (= (apply!895 (+!3085 lt!438814 (tuple2!14887 lt!438818 zeroValue!1220)) lt!438822) (get!15623 (getValueByKey!513 (toList!6807 (+!3085 lt!438814 (tuple2!14887 lt!438818 zeroValue!1220))) lt!438822)))))

(declare-fun bs!28091 () Bool)

(assert (= bs!28091 d!117419))

(declare-fun m!916871 () Bool)

(assert (=> bs!28091 m!916871))

(assert (=> bs!28091 m!916871))

(declare-fun m!916873 () Bool)

(assert (=> bs!28091 m!916873))

(assert (=> b!989218 d!117419))

(declare-fun d!117421 () Bool)

(declare-fun e!557947 () Bool)

(assert (=> d!117421 e!557947))

(declare-fun res!661701 () Bool)

(assert (=> d!117421 (=> res!661701 e!557947)))

(declare-fun lt!439005 () Bool)

(assert (=> d!117421 (= res!661701 (not lt!439005))))

(declare-fun lt!439007 () Bool)

(assert (=> d!117421 (= lt!439005 lt!439007)))

(declare-fun lt!439006 () Unit!32825)

(declare-fun e!557948 () Unit!32825)

(assert (=> d!117421 (= lt!439006 e!557948)))

(declare-fun c!100338 () Bool)

(assert (=> d!117421 (= c!100338 lt!439007)))

(assert (=> d!117421 (= lt!439007 (containsKey!478 (toList!6807 lt!438845) (select (arr!30093 _keys!1544) from!1932)))))

(assert (=> d!117421 (= (contains!5719 lt!438845 (select (arr!30093 _keys!1544) from!1932)) lt!439005)))

(declare-fun b!989480 () Bool)

(declare-fun lt!439004 () Unit!32825)

(assert (=> b!989480 (= e!557948 lt!439004)))

(assert (=> b!989480 (= lt!439004 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6807 lt!438845) (select (arr!30093 _keys!1544) from!1932)))))

(assert (=> b!989480 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438845) (select (arr!30093 _keys!1544) from!1932)))))

(declare-fun b!989481 () Bool)

(declare-fun Unit!32838 () Unit!32825)

(assert (=> b!989481 (= e!557948 Unit!32838)))

(declare-fun b!989482 () Bool)

(assert (=> b!989482 (= e!557947 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438845) (select (arr!30093 _keys!1544) from!1932))))))

(assert (= (and d!117421 c!100338) b!989480))

(assert (= (and d!117421 (not c!100338)) b!989481))

(assert (= (and d!117421 (not res!661701)) b!989482))

(assert (=> d!117421 m!916201))

(declare-fun m!916875 () Bool)

(assert (=> d!117421 m!916875))

(assert (=> b!989480 m!916201))

(declare-fun m!916877 () Bool)

(assert (=> b!989480 m!916877))

(assert (=> b!989480 m!916201))

(declare-fun m!916879 () Bool)

(assert (=> b!989480 m!916879))

(assert (=> b!989480 m!916879))

(declare-fun m!916881 () Bool)

(assert (=> b!989480 m!916881))

(assert (=> b!989482 m!916201))

(assert (=> b!989482 m!916879))

(assert (=> b!989482 m!916879))

(assert (=> b!989482 m!916881))

(assert (=> b!989244 d!117421))

(declare-fun d!117423 () Bool)

(declare-fun c!100339 () Bool)

(assert (=> d!117423 (= c!100339 (and ((_ is Cons!20811) (toList!6807 lt!438832)) (= (_1!7454 (h!21973 (toList!6807 lt!438832))) (_1!7454 lt!438713))))))

(declare-fun e!557949 () Option!519)

(assert (=> d!117423 (= (getValueByKey!513 (toList!6807 lt!438832) (_1!7454 lt!438713)) e!557949)))

(declare-fun b!989486 () Bool)

(declare-fun e!557950 () Option!519)

(assert (=> b!989486 (= e!557950 None!517)))

(declare-fun b!989484 () Bool)

(assert (=> b!989484 (= e!557949 e!557950)))

(declare-fun c!100340 () Bool)

(assert (=> b!989484 (= c!100340 (and ((_ is Cons!20811) (toList!6807 lt!438832)) (not (= (_1!7454 (h!21973 (toList!6807 lt!438832))) (_1!7454 lt!438713)))))))

(declare-fun b!989483 () Bool)

(assert (=> b!989483 (= e!557949 (Some!518 (_2!7454 (h!21973 (toList!6807 lt!438832)))))))

(declare-fun b!989485 () Bool)

(assert (=> b!989485 (= e!557950 (getValueByKey!513 (t!29770 (toList!6807 lt!438832)) (_1!7454 lt!438713)))))

(assert (= (and d!117423 c!100339) b!989483))

(assert (= (and d!117423 (not c!100339)) b!989484))

(assert (= (and b!989484 c!100340) b!989485))

(assert (= (and b!989484 (not c!100340)) b!989486))

(declare-fun m!916883 () Bool)

(assert (=> b!989485 m!916883))

(assert (=> b!989230 d!117423))

(assert (=> b!989214 d!117321))

(declare-fun d!117425 () Bool)

(assert (=> d!117425 (= (apply!895 lt!438845 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15623 (getValueByKey!513 (toList!6807 lt!438845) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28092 () Bool)

(assert (= bs!28092 d!117425))

(assert (=> bs!28092 m!916677))

(assert (=> bs!28092 m!916677))

(declare-fun m!916885 () Bool)

(assert (=> bs!28092 m!916885))

(assert (=> b!989241 d!117425))

(assert (=> b!989294 d!117321))

(declare-fun d!117427 () Bool)

(declare-fun e!557951 () Bool)

(assert (=> d!117427 e!557951))

(declare-fun res!661702 () Bool)

(assert (=> d!117427 (=> res!661702 e!557951)))

(declare-fun lt!439009 () Bool)

(assert (=> d!117427 (= res!661702 (not lt!439009))))

(declare-fun lt!439011 () Bool)

(assert (=> d!117427 (= lt!439009 lt!439011)))

(declare-fun lt!439010 () Unit!32825)

(declare-fun e!557952 () Unit!32825)

(assert (=> d!117427 (= lt!439010 e!557952)))

(declare-fun c!100341 () Bool)

(assert (=> d!117427 (= c!100341 lt!439011)))

(assert (=> d!117427 (= lt!439011 (containsKey!478 (toList!6807 lt!438751) (_1!7454 lt!438713)))))

(assert (=> d!117427 (= (contains!5719 lt!438751 (_1!7454 lt!438713)) lt!439009)))

(declare-fun b!989487 () Bool)

(declare-fun lt!439008 () Unit!32825)

(assert (=> b!989487 (= e!557952 lt!439008)))

(assert (=> b!989487 (= lt!439008 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6807 lt!438751) (_1!7454 lt!438713)))))

(assert (=> b!989487 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438751) (_1!7454 lt!438713)))))

(declare-fun b!989488 () Bool)

(declare-fun Unit!32839 () Unit!32825)

(assert (=> b!989488 (= e!557952 Unit!32839)))

(declare-fun b!989489 () Bool)

(assert (=> b!989489 (= e!557951 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438751) (_1!7454 lt!438713))))))

(assert (= (and d!117427 c!100341) b!989487))

(assert (= (and d!117427 (not c!100341)) b!989488))

(assert (= (and d!117427 (not res!661702)) b!989489))

(declare-fun m!916887 () Bool)

(assert (=> d!117427 m!916887))

(declare-fun m!916889 () Bool)

(assert (=> b!989487 m!916889))

(assert (=> b!989487 m!916303))

(assert (=> b!989487 m!916303))

(declare-fun m!916891 () Bool)

(assert (=> b!989487 m!916891))

(assert (=> b!989489 m!916303))

(assert (=> b!989489 m!916303))

(assert (=> b!989489 m!916891))

(assert (=> d!117281 d!117427))

(declare-fun d!117429 () Bool)

(declare-fun c!100342 () Bool)

(assert (=> d!117429 (= c!100342 (and ((_ is Cons!20811) lt!438748) (= (_1!7454 (h!21973 lt!438748)) (_1!7454 lt!438713))))))

(declare-fun e!557953 () Option!519)

(assert (=> d!117429 (= (getValueByKey!513 lt!438748 (_1!7454 lt!438713)) e!557953)))

(declare-fun b!989493 () Bool)

(declare-fun e!557954 () Option!519)

(assert (=> b!989493 (= e!557954 None!517)))

(declare-fun b!989491 () Bool)

(assert (=> b!989491 (= e!557953 e!557954)))

(declare-fun c!100343 () Bool)

(assert (=> b!989491 (= c!100343 (and ((_ is Cons!20811) lt!438748) (not (= (_1!7454 (h!21973 lt!438748)) (_1!7454 lt!438713)))))))

(declare-fun b!989490 () Bool)

(assert (=> b!989490 (= e!557953 (Some!518 (_2!7454 (h!21973 lt!438748))))))

(declare-fun b!989492 () Bool)

(assert (=> b!989492 (= e!557954 (getValueByKey!513 (t!29770 lt!438748) (_1!7454 lt!438713)))))

(assert (= (and d!117429 c!100342) b!989490))

(assert (= (and d!117429 (not c!100342)) b!989491))

(assert (= (and b!989491 c!100343) b!989492))

(assert (= (and b!989491 (not c!100343)) b!989493))

(declare-fun m!916893 () Bool)

(assert (=> b!989492 m!916893))

(assert (=> d!117281 d!117429))

(declare-fun d!117431 () Bool)

(assert (=> d!117431 (= (getValueByKey!513 lt!438748 (_1!7454 lt!438713)) (Some!518 (_2!7454 lt!438713)))))

(declare-fun lt!439012 () Unit!32825)

(assert (=> d!117431 (= lt!439012 (choose!1611 lt!438748 (_1!7454 lt!438713) (_2!7454 lt!438713)))))

(declare-fun e!557955 () Bool)

(assert (=> d!117431 e!557955))

(declare-fun res!661703 () Bool)

(assert (=> d!117431 (=> (not res!661703) (not e!557955))))

(assert (=> d!117431 (= res!661703 (isStrictlySorted!516 lt!438748))))

(assert (=> d!117431 (= (lemmaContainsTupThenGetReturnValue!272 lt!438748 (_1!7454 lt!438713) (_2!7454 lt!438713)) lt!439012)))

(declare-fun b!989494 () Bool)

(declare-fun res!661704 () Bool)

(assert (=> b!989494 (=> (not res!661704) (not e!557955))))

(assert (=> b!989494 (= res!661704 (containsKey!478 lt!438748 (_1!7454 lt!438713)))))

(declare-fun b!989495 () Bool)

(assert (=> b!989495 (= e!557955 (contains!5720 lt!438748 (tuple2!14887 (_1!7454 lt!438713) (_2!7454 lt!438713))))))

(assert (= (and d!117431 res!661703) b!989494))

(assert (= (and b!989494 res!661704) b!989495))

(assert (=> d!117431 m!916297))

(declare-fun m!916895 () Bool)

(assert (=> d!117431 m!916895))

(declare-fun m!916897 () Bool)

(assert (=> d!117431 m!916897))

(declare-fun m!916899 () Bool)

(assert (=> b!989494 m!916899))

(declare-fun m!916901 () Bool)

(assert (=> b!989495 m!916901))

(assert (=> d!117281 d!117431))

(declare-fun d!117433 () Bool)

(declare-fun e!557959 () Bool)

(assert (=> d!117433 e!557959))

(declare-fun res!661705 () Bool)

(assert (=> d!117433 (=> (not res!661705) (not e!557959))))

(declare-fun lt!439013 () List!20815)

(assert (=> d!117433 (= res!661705 (isStrictlySorted!516 lt!439013))))

(declare-fun e!557960 () List!20815)

(assert (=> d!117433 (= lt!439013 e!557960)))

(declare-fun c!100347 () Bool)

(assert (=> d!117433 (= c!100347 (and ((_ is Cons!20811) (toList!6807 lt!438712)) (bvslt (_1!7454 (h!21973 (toList!6807 lt!438712))) (_1!7454 lt!438713))))))

(assert (=> d!117433 (isStrictlySorted!516 (toList!6807 lt!438712))))

(assert (=> d!117433 (= (insertStrictlySorted!329 (toList!6807 lt!438712) (_1!7454 lt!438713) (_2!7454 lt!438713)) lt!439013)))

(declare-fun bm!41940 () Bool)

(declare-fun call!41945 () List!20815)

(declare-fun call!41943 () List!20815)

(assert (=> bm!41940 (= call!41945 call!41943)))

(declare-fun b!989496 () Bool)

(declare-fun e!557958 () List!20815)

(declare-fun c!100344 () Bool)

(declare-fun c!100345 () Bool)

(assert (=> b!989496 (= e!557958 (ite c!100344 (t!29770 (toList!6807 lt!438712)) (ite c!100345 (Cons!20811 (h!21973 (toList!6807 lt!438712)) (t!29770 (toList!6807 lt!438712))) Nil!20812)))))

(declare-fun b!989497 () Bool)

(assert (=> b!989497 (= e!557959 (contains!5720 lt!439013 (tuple2!14887 (_1!7454 lt!438713) (_2!7454 lt!438713))))))

(declare-fun b!989498 () Bool)

(declare-fun e!557957 () List!20815)

(assert (=> b!989498 (= e!557957 call!41945)))

(declare-fun b!989499 () Bool)

(assert (=> b!989499 (= e!557957 call!41945)))

(declare-fun b!989500 () Bool)

(assert (=> b!989500 (= c!100345 (and ((_ is Cons!20811) (toList!6807 lt!438712)) (bvsgt (_1!7454 (h!21973 (toList!6807 lt!438712))) (_1!7454 lt!438713))))))

(declare-fun e!557956 () List!20815)

(assert (=> b!989500 (= e!557956 e!557957)))

(declare-fun bm!41941 () Bool)

(declare-fun call!41944 () List!20815)

(assert (=> bm!41941 (= call!41943 call!41944)))

(declare-fun b!989501 () Bool)

(assert (=> b!989501 (= e!557960 e!557956)))

(assert (=> b!989501 (= c!100344 (and ((_ is Cons!20811) (toList!6807 lt!438712)) (= (_1!7454 (h!21973 (toList!6807 lt!438712))) (_1!7454 lt!438713))))))

(declare-fun b!989502 () Bool)

(assert (=> b!989502 (= e!557960 call!41944)))

(declare-fun b!989503 () Bool)

(declare-fun res!661706 () Bool)

(assert (=> b!989503 (=> (not res!661706) (not e!557959))))

(assert (=> b!989503 (= res!661706 (containsKey!478 lt!439013 (_1!7454 lt!438713)))))

(declare-fun b!989504 () Bool)

(assert (=> b!989504 (= e!557956 call!41943)))

(declare-fun b!989505 () Bool)

(assert (=> b!989505 (= e!557958 (insertStrictlySorted!329 (t!29770 (toList!6807 lt!438712)) (_1!7454 lt!438713) (_2!7454 lt!438713)))))

(declare-fun bm!41942 () Bool)

(assert (=> bm!41942 (= call!41944 ($colon$colon!555 e!557958 (ite c!100347 (h!21973 (toList!6807 lt!438712)) (tuple2!14887 (_1!7454 lt!438713) (_2!7454 lt!438713)))))))

(declare-fun c!100346 () Bool)

(assert (=> bm!41942 (= c!100346 c!100347)))

(assert (= (and d!117433 c!100347) b!989502))

(assert (= (and d!117433 (not c!100347)) b!989501))

(assert (= (and b!989501 c!100344) b!989504))

(assert (= (and b!989501 (not c!100344)) b!989500))

(assert (= (and b!989500 c!100345) b!989499))

(assert (= (and b!989500 (not c!100345)) b!989498))

(assert (= (or b!989499 b!989498) bm!41940))

(assert (= (or b!989504 bm!41940) bm!41941))

(assert (= (or b!989502 bm!41941) bm!41942))

(assert (= (and bm!41942 c!100346) b!989505))

(assert (= (and bm!41942 (not c!100346)) b!989496))

(assert (= (and d!117433 res!661705) b!989503))

(assert (= (and b!989503 res!661706) b!989497))

(declare-fun m!916903 () Bool)

(assert (=> d!117433 m!916903))

(assert (=> d!117433 m!916587))

(declare-fun m!916905 () Bool)

(assert (=> b!989497 m!916905))

(declare-fun m!916907 () Bool)

(assert (=> b!989503 m!916907))

(declare-fun m!916909 () Bool)

(assert (=> b!989505 m!916909))

(declare-fun m!916911 () Bool)

(assert (=> bm!41942 m!916911))

(assert (=> d!117281 d!117433))

(declare-fun d!117435 () Bool)

(assert (=> d!117435 (= (apply!895 lt!438815 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15623 (getValueByKey!513 (toList!6807 lt!438815) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28093 () Bool)

(assert (= bs!28093 d!117435))

(assert (=> bs!28093 m!916639))

(assert (=> bs!28093 m!916639))

(declare-fun m!916913 () Bool)

(assert (=> bs!28093 m!916913))

(assert (=> b!989216 d!117435))

(declare-fun d!117437 () Bool)

(assert (=> d!117437 (= (get!15621 (select (arr!30092 _values!1278) from!1932) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14247 (select (arr!30092 _values!1278) from!1932)))))

(assert (=> b!989259 d!117437))

(declare-fun d!117439 () Bool)

(declare-fun e!557961 () Bool)

(assert (=> d!117439 e!557961))

(declare-fun res!661707 () Bool)

(assert (=> d!117439 (=> res!661707 e!557961)))

(declare-fun lt!439015 () Bool)

(assert (=> d!117439 (= res!661707 (not lt!439015))))

(declare-fun lt!439017 () Bool)

(assert (=> d!117439 (= lt!439015 lt!439017)))

(declare-fun lt!439016 () Unit!32825)

(declare-fun e!557962 () Unit!32825)

(assert (=> d!117439 (= lt!439016 e!557962)))

(declare-fun c!100348 () Bool)

(assert (=> d!117439 (= c!100348 lt!439017)))

(assert (=> d!117439 (= lt!439017 (containsKey!478 (toList!6807 lt!438815) (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> d!117439 (= (contains!5719 lt!438815 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) lt!439015)))

(declare-fun b!989506 () Bool)

(declare-fun lt!439014 () Unit!32825)

(assert (=> b!989506 (= e!557962 lt!439014)))

(assert (=> b!989506 (= lt!439014 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6807 lt!438815) (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!989506 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438815) (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!989507 () Bool)

(declare-fun Unit!32840 () Unit!32825)

(assert (=> b!989507 (= e!557962 Unit!32840)))

(declare-fun b!989508 () Bool)

(assert (=> b!989508 (= e!557961 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438815) (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(assert (= (and d!117439 c!100348) b!989506))

(assert (= (and d!117439 (not c!100348)) b!989507))

(assert (= (and d!117439 (not res!661707)) b!989508))

(assert (=> d!117439 m!916329))

(declare-fun m!916915 () Bool)

(assert (=> d!117439 m!916915))

(assert (=> b!989506 m!916329))

(declare-fun m!916917 () Bool)

(assert (=> b!989506 m!916917))

(assert (=> b!989506 m!916329))

(declare-fun m!916919 () Bool)

(assert (=> b!989506 m!916919))

(assert (=> b!989506 m!916919))

(declare-fun m!916921 () Bool)

(assert (=> b!989506 m!916921))

(assert (=> b!989508 m!916329))

(assert (=> b!989508 m!916919))

(assert (=> b!989508 m!916919))

(assert (=> b!989508 m!916921))

(assert (=> b!989219 d!117439))

(declare-fun d!117441 () Bool)

(declare-fun res!661709 () Bool)

(declare-fun e!557965 () Bool)

(assert (=> d!117441 (=> res!661709 e!557965)))

(assert (=> d!117441 (= res!661709 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30572 _keys!1544)))))

(assert (=> d!117441 (= (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100248 (Cons!20812 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) Nil!20813) Nil!20813)) e!557965)))

(declare-fun b!989509 () Bool)

(declare-fun e!557963 () Bool)

(declare-fun call!41946 () Bool)

(assert (=> b!989509 (= e!557963 call!41946)))

(declare-fun b!989510 () Bool)

(assert (=> b!989510 (= e!557963 call!41946)))

(declare-fun bm!41943 () Bool)

(declare-fun c!100349 () Bool)

(assert (=> bm!41943 (= call!41946 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!100349 (Cons!20812 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!100248 (Cons!20812 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) Nil!20813) Nil!20813)) (ite c!100248 (Cons!20812 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) Nil!20813) Nil!20813))))))

(declare-fun b!989511 () Bool)

(declare-fun e!557966 () Bool)

(assert (=> b!989511 (= e!557966 (contains!5718 (ite c!100248 (Cons!20812 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) Nil!20813) Nil!20813) (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!989512 () Bool)

(declare-fun e!557964 () Bool)

(assert (=> b!989512 (= e!557964 e!557963)))

(assert (=> b!989512 (= c!100349 (validKeyInArray!0 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!989513 () Bool)

(assert (=> b!989513 (= e!557965 e!557964)))

(declare-fun res!661710 () Bool)

(assert (=> b!989513 (=> (not res!661710) (not e!557964))))

(assert (=> b!989513 (= res!661710 (not e!557966))))

(declare-fun res!661708 () Bool)

(assert (=> b!989513 (=> (not res!661708) (not e!557966))))

(assert (=> b!989513 (= res!661708 (validKeyInArray!0 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!117441 (not res!661709)) b!989513))

(assert (= (and b!989513 res!661708) b!989511))

(assert (= (and b!989513 res!661710) b!989512))

(assert (= (and b!989512 c!100349) b!989509))

(assert (= (and b!989512 (not c!100349)) b!989510))

(assert (= (or b!989509 b!989510) bm!41943))

(declare-fun m!916923 () Bool)

(assert (=> bm!41943 m!916923))

(declare-fun m!916925 () Bool)

(assert (=> bm!41943 m!916925))

(assert (=> b!989511 m!916923))

(assert (=> b!989511 m!916923))

(declare-fun m!916927 () Bool)

(assert (=> b!989511 m!916927))

(assert (=> b!989512 m!916923))

(assert (=> b!989512 m!916923))

(declare-fun m!916929 () Bool)

(assert (=> b!989512 m!916929))

(assert (=> b!989513 m!916923))

(assert (=> b!989513 m!916923))

(assert (=> b!989513 m!916929))

(assert (=> bm!41894 d!117441))

(declare-fun d!117443 () Bool)

(declare-fun e!557967 () Bool)

(assert (=> d!117443 e!557967))

(declare-fun res!661712 () Bool)

(assert (=> d!117443 (=> (not res!661712) (not e!557967))))

(declare-fun lt!439021 () ListLongMap!13583)

(assert (=> d!117443 (= res!661712 (contains!5719 lt!439021 (_1!7454 (ite (or c!100267 c!100270) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun lt!439018 () List!20815)

(assert (=> d!117443 (= lt!439021 (ListLongMap!13584 lt!439018))))

(declare-fun lt!439019 () Unit!32825)

(declare-fun lt!439020 () Unit!32825)

(assert (=> d!117443 (= lt!439019 lt!439020)))

(assert (=> d!117443 (= (getValueByKey!513 lt!439018 (_1!7454 (ite (or c!100267 c!100270) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!518 (_2!7454 (ite (or c!100267 c!100270) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117443 (= lt!439020 (lemmaContainsTupThenGetReturnValue!272 lt!439018 (_1!7454 (ite (or c!100267 c!100270) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7454 (ite (or c!100267 c!100270) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117443 (= lt!439018 (insertStrictlySorted!329 (toList!6807 (ite c!100267 call!41922 (ite c!100270 call!41920 call!41924))) (_1!7454 (ite (or c!100267 c!100270) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7454 (ite (or c!100267 c!100270) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117443 (= (+!3085 (ite c!100267 call!41922 (ite c!100270 call!41920 call!41924)) (ite (or c!100267 c!100270) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) lt!439021)))

(declare-fun b!989514 () Bool)

(declare-fun res!661711 () Bool)

(assert (=> b!989514 (=> (not res!661711) (not e!557967))))

(assert (=> b!989514 (= res!661711 (= (getValueByKey!513 (toList!6807 lt!439021) (_1!7454 (ite (or c!100267 c!100270) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!518 (_2!7454 (ite (or c!100267 c!100270) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))))

(declare-fun b!989515 () Bool)

(assert (=> b!989515 (= e!557967 (contains!5720 (toList!6807 lt!439021) (ite (or c!100267 c!100270) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!117443 res!661712) b!989514))

(assert (= (and b!989514 res!661711) b!989515))

(declare-fun m!916931 () Bool)

(assert (=> d!117443 m!916931))

(declare-fun m!916933 () Bool)

(assert (=> d!117443 m!916933))

(declare-fun m!916935 () Bool)

(assert (=> d!117443 m!916935))

(declare-fun m!916937 () Bool)

(assert (=> d!117443 m!916937))

(declare-fun m!916939 () Bool)

(assert (=> b!989514 m!916939))

(declare-fun m!916941 () Bool)

(assert (=> b!989515 m!916941))

(assert (=> bm!41917 d!117443))

(declare-fun d!117445 () Bool)

(declare-fun e!557968 () Bool)

(assert (=> d!117445 e!557968))

(declare-fun res!661714 () Bool)

(assert (=> d!117445 (=> (not res!661714) (not e!557968))))

(declare-fun lt!439025 () ListLongMap!13583)

(assert (=> d!117445 (= res!661714 (contains!5719 lt!439025 (_1!7454 (ite (or c!100261 c!100264) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun lt!439022 () List!20815)

(assert (=> d!117445 (= lt!439025 (ListLongMap!13584 lt!439022))))

(declare-fun lt!439023 () Unit!32825)

(declare-fun lt!439024 () Unit!32825)

(assert (=> d!117445 (= lt!439023 lt!439024)))

(assert (=> d!117445 (= (getValueByKey!513 lt!439022 (_1!7454 (ite (or c!100261 c!100264) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!518 (_2!7454 (ite (or c!100261 c!100264) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117445 (= lt!439024 (lemmaContainsTupThenGetReturnValue!272 lt!439022 (_1!7454 (ite (or c!100261 c!100264) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7454 (ite (or c!100261 c!100264) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117445 (= lt!439022 (insertStrictlySorted!329 (toList!6807 (ite c!100261 call!41915 (ite c!100264 call!41913 call!41917))) (_1!7454 (ite (or c!100261 c!100264) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7454 (ite (or c!100261 c!100264) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117445 (= (+!3085 (ite c!100261 call!41915 (ite c!100264 call!41913 call!41917)) (ite (or c!100261 c!100264) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) lt!439025)))

(declare-fun b!989516 () Bool)

(declare-fun res!661713 () Bool)

(assert (=> b!989516 (=> (not res!661713) (not e!557968))))

(assert (=> b!989516 (= res!661713 (= (getValueByKey!513 (toList!6807 lt!439025) (_1!7454 (ite (or c!100261 c!100264) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!518 (_2!7454 (ite (or c!100261 c!100264) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))))

(declare-fun b!989517 () Bool)

(assert (=> b!989517 (= e!557968 (contains!5720 (toList!6807 lt!439025) (ite (or c!100261 c!100264) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!117445 res!661714) b!989516))

(assert (= (and b!989516 res!661713) b!989517))

(declare-fun m!916943 () Bool)

(assert (=> d!117445 m!916943))

(declare-fun m!916945 () Bool)

(assert (=> d!117445 m!916945))

(declare-fun m!916947 () Bool)

(assert (=> d!117445 m!916947))

(declare-fun m!916949 () Bool)

(assert (=> d!117445 m!916949))

(declare-fun m!916951 () Bool)

(assert (=> b!989516 m!916951))

(declare-fun m!916953 () Bool)

(assert (=> b!989517 m!916953))

(assert (=> bm!41910 d!117445))

(declare-fun d!117447 () Bool)

(declare-fun lt!439028 () Bool)

(declare-fun content!421 (List!20815) (InoxSet tuple2!14886))

(assert (=> d!117447 (= lt!439028 (select (content!421 (toList!6807 lt!438758)) lt!438711))))

(declare-fun e!557974 () Bool)

(assert (=> d!117447 (= lt!439028 e!557974)))

(declare-fun res!661719 () Bool)

(assert (=> d!117447 (=> (not res!661719) (not e!557974))))

(assert (=> d!117447 (= res!661719 ((_ is Cons!20811) (toList!6807 lt!438758)))))

(assert (=> d!117447 (= (contains!5720 (toList!6807 lt!438758) lt!438711) lt!439028)))

(declare-fun b!989522 () Bool)

(declare-fun e!557973 () Bool)

(assert (=> b!989522 (= e!557974 e!557973)))

(declare-fun res!661720 () Bool)

(assert (=> b!989522 (=> res!661720 e!557973)))

(assert (=> b!989522 (= res!661720 (= (h!21973 (toList!6807 lt!438758)) lt!438711))))

(declare-fun b!989523 () Bool)

(assert (=> b!989523 (= e!557973 (contains!5720 (t!29770 (toList!6807 lt!438758)) lt!438711))))

(assert (= (and d!117447 res!661719) b!989522))

(assert (= (and b!989522 (not res!661720)) b!989523))

(declare-fun m!916955 () Bool)

(assert (=> d!117447 m!916955))

(declare-fun m!916957 () Bool)

(assert (=> d!117447 m!916957))

(declare-fun m!916959 () Bool)

(assert (=> b!989523 m!916959))

(assert (=> b!989164 d!117447))

(declare-fun d!117449 () Bool)

(declare-fun lt!439029 () Bool)

(assert (=> d!117449 (= lt!439029 (select (content!421 (toList!6807 lt!438858)) lt!438711))))

(declare-fun e!557976 () Bool)

(assert (=> d!117449 (= lt!439029 e!557976)))

(declare-fun res!661721 () Bool)

(assert (=> d!117449 (=> (not res!661721) (not e!557976))))

(assert (=> d!117449 (= res!661721 ((_ is Cons!20811) (toList!6807 lt!438858)))))

(assert (=> d!117449 (= (contains!5720 (toList!6807 lt!438858) lt!438711) lt!439029)))

(declare-fun b!989524 () Bool)

(declare-fun e!557975 () Bool)

(assert (=> b!989524 (= e!557976 e!557975)))

(declare-fun res!661722 () Bool)

(assert (=> b!989524 (=> res!661722 e!557975)))

(assert (=> b!989524 (= res!661722 (= (h!21973 (toList!6807 lt!438858)) lt!438711))))

(declare-fun b!989525 () Bool)

(assert (=> b!989525 (= e!557975 (contains!5720 (t!29770 (toList!6807 lt!438858)) lt!438711))))

(assert (= (and d!117449 res!661721) b!989524))

(assert (= (and b!989524 (not res!661722)) b!989525))

(declare-fun m!916961 () Bool)

(assert (=> d!117449 m!916961))

(declare-fun m!916963 () Bool)

(assert (=> d!117449 m!916963))

(declare-fun m!916965 () Bool)

(assert (=> b!989525 m!916965))

(assert (=> b!989254 d!117449))

(declare-fun b!989526 () Bool)

(declare-fun e!557977 () Bool)

(declare-fun call!41947 () Bool)

(assert (=> b!989526 (= e!557977 call!41947)))

(declare-fun b!989527 () Bool)

(declare-fun e!557978 () Bool)

(assert (=> b!989527 (= e!557978 e!557977)))

(declare-fun c!100350 () Bool)

(assert (=> b!989527 (= c!100350 (validKeyInArray!0 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!41944 () Bool)

(assert (=> bm!41944 (= call!41947 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun d!117451 () Bool)

(declare-fun res!661723 () Bool)

(assert (=> d!117451 (=> res!661723 e!557978)))

(assert (=> d!117451 (= res!661723 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30572 _keys!1544)))))

(assert (=> d!117451 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948) e!557978)))

(declare-fun b!989528 () Bool)

(declare-fun e!557979 () Bool)

(assert (=> b!989528 (= e!557979 call!41947)))

(declare-fun b!989529 () Bool)

(assert (=> b!989529 (= e!557977 e!557979)))

(declare-fun lt!439032 () (_ BitVec 64))

(assert (=> b!989529 (= lt!439032 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!439030 () Unit!32825)

(assert (=> b!989529 (= lt!439030 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!439032 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!989529 (arrayContainsKey!0 _keys!1544 lt!439032 #b00000000000000000000000000000000)))

(declare-fun lt!439031 () Unit!32825)

(assert (=> b!989529 (= lt!439031 lt!439030)))

(declare-fun res!661724 () Bool)

(assert (=> b!989529 (= res!661724 (= (seekEntryOrOpen!0 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1544 mask!1948) (Found!9210 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!989529 (=> (not res!661724) (not e!557979))))

(assert (= (and d!117451 (not res!661723)) b!989527))

(assert (= (and b!989527 c!100350) b!989529))

(assert (= (and b!989527 (not c!100350)) b!989526))

(assert (= (and b!989529 res!661724) b!989528))

(assert (= (or b!989528 b!989526) bm!41944))

(assert (=> b!989527 m!916923))

(assert (=> b!989527 m!916923))

(assert (=> b!989527 m!916929))

(declare-fun m!916967 () Bool)

(assert (=> bm!41944 m!916967))

(assert (=> b!989529 m!916923))

(declare-fun m!916969 () Bool)

(assert (=> b!989529 m!916969))

(declare-fun m!916971 () Bool)

(assert (=> b!989529 m!916971))

(assert (=> b!989529 m!916923))

(declare-fun m!916973 () Bool)

(assert (=> b!989529 m!916973))

(assert (=> bm!41891 d!117451))

(assert (=> b!989155 d!117317))

(declare-fun d!117453 () Bool)

(declare-fun e!557980 () Bool)

(assert (=> d!117453 e!557980))

(declare-fun res!661725 () Bool)

(assert (=> d!117453 (=> res!661725 e!557980)))

(declare-fun lt!439034 () Bool)

(assert (=> d!117453 (= res!661725 (not lt!439034))))

(declare-fun lt!439036 () Bool)

(assert (=> d!117453 (= lt!439034 lt!439036)))

(declare-fun lt!439035 () Unit!32825)

(declare-fun e!557981 () Unit!32825)

(assert (=> d!117453 (= lt!439035 e!557981)))

(declare-fun c!100351 () Bool)

(assert (=> d!117453 (= c!100351 lt!439036)))

(assert (=> d!117453 (= lt!439036 (containsKey!478 (toList!6807 lt!438875) (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> d!117453 (= (contains!5719 lt!438875 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) lt!439034)))

(declare-fun b!989530 () Bool)

(declare-fun lt!439033 () Unit!32825)

(assert (=> b!989530 (= e!557981 lt!439033)))

(assert (=> b!989530 (= lt!439033 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6807 lt!438875) (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!989530 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438875) (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!989531 () Bool)

(declare-fun Unit!32841 () Unit!32825)

(assert (=> b!989531 (= e!557981 Unit!32841)))

(declare-fun b!989532 () Bool)

(assert (=> b!989532 (= e!557980 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438875) (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(assert (= (and d!117453 c!100351) b!989530))

(assert (= (and d!117453 (not c!100351)) b!989531))

(assert (= (and d!117453 (not res!661725)) b!989532))

(assert (=> d!117453 m!916329))

(declare-fun m!916975 () Bool)

(assert (=> d!117453 m!916975))

(assert (=> b!989530 m!916329))

(declare-fun m!916977 () Bool)

(assert (=> b!989530 m!916977))

(assert (=> b!989530 m!916329))

(declare-fun m!916979 () Bool)

(assert (=> b!989530 m!916979))

(assert (=> b!989530 m!916979))

(declare-fun m!916981 () Bool)

(assert (=> b!989530 m!916981))

(assert (=> b!989532 m!916329))

(assert (=> b!989532 m!916979))

(assert (=> b!989532 m!916979))

(assert (=> b!989532 m!916981))

(assert (=> b!989288 d!117453))

(declare-fun d!117455 () Bool)

(declare-fun lt!439037 () Bool)

(assert (=> d!117455 (= lt!439037 (select (content!421 (toList!6807 lt!438751)) lt!438713))))

(declare-fun e!557983 () Bool)

(assert (=> d!117455 (= lt!439037 e!557983)))

(declare-fun res!661726 () Bool)

(assert (=> d!117455 (=> (not res!661726) (not e!557983))))

(assert (=> d!117455 (= res!661726 ((_ is Cons!20811) (toList!6807 lt!438751)))))

(assert (=> d!117455 (= (contains!5720 (toList!6807 lt!438751) lt!438713) lt!439037)))

(declare-fun b!989533 () Bool)

(declare-fun e!557982 () Bool)

(assert (=> b!989533 (= e!557983 e!557982)))

(declare-fun res!661727 () Bool)

(assert (=> b!989533 (=> res!661727 e!557982)))

(assert (=> b!989533 (= res!661727 (= (h!21973 (toList!6807 lt!438751)) lt!438713))))

(declare-fun b!989534 () Bool)

(assert (=> b!989534 (= e!557982 (contains!5720 (t!29770 (toList!6807 lt!438751)) lt!438713))))

(assert (= (and d!117455 res!661726) b!989533))

(assert (= (and b!989533 (not res!661727)) b!989534))

(declare-fun m!916983 () Bool)

(assert (=> d!117455 m!916983))

(declare-fun m!916985 () Bool)

(assert (=> d!117455 m!916985))

(declare-fun m!916987 () Bool)

(assert (=> b!989534 m!916987))

(assert (=> b!989162 d!117455))

(declare-fun d!117457 () Bool)

(declare-fun e!557984 () Bool)

(assert (=> d!117457 e!557984))

(declare-fun res!661729 () Bool)

(assert (=> d!117457 (=> (not res!661729) (not e!557984))))

(declare-fun lt!439041 () ListLongMap!13583)

(assert (=> d!117457 (= res!661729 (contains!5719 lt!439041 (_1!7454 (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!439038 () List!20815)

(assert (=> d!117457 (= lt!439041 (ListLongMap!13584 lt!439038))))

(declare-fun lt!439039 () Unit!32825)

(declare-fun lt!439040 () Unit!32825)

(assert (=> d!117457 (= lt!439039 lt!439040)))

(assert (=> d!117457 (= (getValueByKey!513 lt!439038 (_1!7454 (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!518 (_2!7454 (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117457 (= lt!439040 (lemmaContainsTupThenGetReturnValue!272 lt!439038 (_1!7454 (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7454 (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117457 (= lt!439038 (insertStrictlySorted!329 (toList!6807 call!41925) (_1!7454 (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7454 (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117457 (= (+!3085 call!41925 (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!439041)))

(declare-fun b!989535 () Bool)

(declare-fun res!661728 () Bool)

(assert (=> b!989535 (=> (not res!661728) (not e!557984))))

(assert (=> b!989535 (= res!661728 (= (getValueByKey!513 (toList!6807 lt!439041) (_1!7454 (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!518 (_2!7454 (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!989536 () Bool)

(assert (=> b!989536 (= e!557984 (contains!5720 (toList!6807 lt!439041) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117457 res!661729) b!989535))

(assert (= (and b!989535 res!661728) b!989536))

(declare-fun m!916989 () Bool)

(assert (=> d!117457 m!916989))

(declare-fun m!916991 () Bool)

(assert (=> d!117457 m!916991))

(declare-fun m!916993 () Bool)

(assert (=> d!117457 m!916993))

(declare-fun m!916995 () Bool)

(assert (=> d!117457 m!916995))

(declare-fun m!916997 () Bool)

(assert (=> b!989535 m!916997))

(declare-fun m!916999 () Bool)

(assert (=> b!989536 m!916999))

(assert (=> b!989250 d!117457))

(declare-fun d!117459 () Bool)

(assert (=> d!117459 (= (apply!895 lt!438845 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15623 (getValueByKey!513 (toList!6807 lt!438845) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28094 () Bool)

(assert (= bs!28094 d!117459))

(declare-fun m!917001 () Bool)

(assert (=> bs!28094 m!917001))

(assert (=> bs!28094 m!917001))

(declare-fun m!917003 () Bool)

(assert (=> bs!28094 m!917003))

(assert (=> b!989234 d!117459))

(declare-fun d!117461 () Bool)

(assert (=> d!117461 (= (apply!895 lt!438815 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15623 (getValueByKey!513 (toList!6807 lt!438815) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28095 () Bool)

(assert (= bs!28095 d!117461))

(declare-fun m!917005 () Bool)

(assert (=> bs!28095 m!917005))

(assert (=> bs!28095 m!917005))

(declare-fun m!917007 () Bool)

(assert (=> bs!28095 m!917007))

(assert (=> b!989209 d!117461))

(declare-fun d!117463 () Bool)

(declare-fun e!557985 () Bool)

(assert (=> d!117463 e!557985))

(declare-fun res!661731 () Bool)

(assert (=> d!117463 (=> (not res!661731) (not e!557985))))

(declare-fun lt!439045 () ListLongMap!13583)

(assert (=> d!117463 (= res!661731 (contains!5719 lt!439045 (_1!7454 (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!439042 () List!20815)

(assert (=> d!117463 (= lt!439045 (ListLongMap!13584 lt!439042))))

(declare-fun lt!439043 () Unit!32825)

(declare-fun lt!439044 () Unit!32825)

(assert (=> d!117463 (= lt!439043 lt!439044)))

(assert (=> d!117463 (= (getValueByKey!513 lt!439042 (_1!7454 (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!518 (_2!7454 (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117463 (= lt!439044 (lemmaContainsTupThenGetReturnValue!272 lt!439042 (_1!7454 (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7454 (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117463 (= lt!439042 (insertStrictlySorted!329 (toList!6807 call!41918) (_1!7454 (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7454 (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117463 (= (+!3085 call!41918 (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!439045)))

(declare-fun b!989537 () Bool)

(declare-fun res!661730 () Bool)

(assert (=> b!989537 (=> (not res!661730) (not e!557985))))

(assert (=> b!989537 (= res!661730 (= (getValueByKey!513 (toList!6807 lt!439045) (_1!7454 (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!518 (_2!7454 (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!989538 () Bool)

(assert (=> b!989538 (= e!557985 (contains!5720 (toList!6807 lt!439045) (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117463 res!661731) b!989537))

(assert (= (and b!989537 res!661730) b!989538))

(declare-fun m!917009 () Bool)

(assert (=> d!117463 m!917009))

(declare-fun m!917011 () Bool)

(assert (=> d!117463 m!917011))

(declare-fun m!917013 () Bool)

(assert (=> d!117463 m!917013))

(declare-fun m!917015 () Bool)

(assert (=> d!117463 m!917015))

(declare-fun m!917017 () Bool)

(assert (=> b!989537 m!917017))

(declare-fun m!917019 () Bool)

(assert (=> b!989538 m!917019))

(assert (=> b!989225 d!117463))

(declare-fun d!117465 () Bool)

(declare-fun lt!439046 () Bool)

(assert (=> d!117465 (= lt!439046 (select (content!421 (toList!6807 lt!438828)) lt!438711))))

(declare-fun e!557987 () Bool)

(assert (=> d!117465 (= lt!439046 e!557987)))

(declare-fun res!661732 () Bool)

(assert (=> d!117465 (=> (not res!661732) (not e!557987))))

(assert (=> d!117465 (= res!661732 ((_ is Cons!20811) (toList!6807 lt!438828)))))

(assert (=> d!117465 (= (contains!5720 (toList!6807 lt!438828) lt!438711) lt!439046)))

(declare-fun b!989539 () Bool)

(declare-fun e!557986 () Bool)

(assert (=> b!989539 (= e!557987 e!557986)))

(declare-fun res!661733 () Bool)

(assert (=> b!989539 (=> res!661733 e!557986)))

(assert (=> b!989539 (= res!661733 (= (h!21973 (toList!6807 lt!438828)) lt!438711))))

(declare-fun b!989540 () Bool)

(assert (=> b!989540 (= e!557986 (contains!5720 (t!29770 (toList!6807 lt!438828)) lt!438711))))

(assert (= (and d!117465 res!661732) b!989539))

(assert (= (and b!989539 (not res!661733)) b!989540))

(declare-fun m!917021 () Bool)

(assert (=> d!117465 m!917021))

(declare-fun m!917023 () Bool)

(assert (=> d!117465 m!917023))

(declare-fun m!917025 () Bool)

(assert (=> b!989540 m!917025))

(assert (=> b!989229 d!117465))

(declare-fun d!117467 () Bool)

(assert (=> d!117467 (arrayContainsKey!0 _keys!1544 lt!438739 #b00000000000000000000000000000000)))

(declare-fun lt!439049 () Unit!32825)

(declare-fun choose!13 (array!62479 (_ BitVec 64) (_ BitVec 32)) Unit!32825)

(assert (=> d!117467 (= lt!439049 (choose!13 _keys!1544 lt!438739 #b00000000000000000000000000000000))))

(assert (=> d!117467 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!117467 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!438739 #b00000000000000000000000000000000) lt!439049)))

(declare-fun bs!28096 () Bool)

(assert (= bs!28096 d!117467))

(assert (=> bs!28096 m!916287))

(declare-fun m!917027 () Bool)

(assert (=> bs!28096 m!917027))

(assert (=> b!989141 d!117467))

(declare-fun d!117469 () Bool)

(declare-fun res!661738 () Bool)

(declare-fun e!557992 () Bool)

(assert (=> d!117469 (=> res!661738 e!557992)))

(assert (=> d!117469 (= res!661738 (= (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) lt!438739))))

(assert (=> d!117469 (= (arrayContainsKey!0 _keys!1544 lt!438739 #b00000000000000000000000000000000) e!557992)))

(declare-fun b!989545 () Bool)

(declare-fun e!557993 () Bool)

(assert (=> b!989545 (= e!557992 e!557993)))

(declare-fun res!661739 () Bool)

(assert (=> b!989545 (=> (not res!661739) (not e!557993))))

(assert (=> b!989545 (= res!661739 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30572 _keys!1544)))))

(declare-fun b!989546 () Bool)

(assert (=> b!989546 (= e!557993 (arrayContainsKey!0 _keys!1544 lt!438739 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!117469 (not res!661738)) b!989545))

(assert (= (and b!989545 res!661739) b!989546))

(assert (=> d!117469 m!916279))

(declare-fun m!917029 () Bool)

(assert (=> b!989546 m!917029))

(assert (=> b!989141 d!117469))

(declare-fun b!989559 () Bool)

(declare-fun e!558000 () SeekEntryResult!9210)

(assert (=> b!989559 (= e!558000 Undefined!9210)))

(declare-fun d!117471 () Bool)

(declare-fun lt!439057 () SeekEntryResult!9210)

(assert (=> d!117471 (and (or ((_ is Undefined!9210) lt!439057) (not ((_ is Found!9210) lt!439057)) (and (bvsge (index!39212 lt!439057) #b00000000000000000000000000000000) (bvslt (index!39212 lt!439057) (size!30572 _keys!1544)))) (or ((_ is Undefined!9210) lt!439057) ((_ is Found!9210) lt!439057) (not ((_ is MissingZero!9210) lt!439057)) (and (bvsge (index!39211 lt!439057) #b00000000000000000000000000000000) (bvslt (index!39211 lt!439057) (size!30572 _keys!1544)))) (or ((_ is Undefined!9210) lt!439057) ((_ is Found!9210) lt!439057) ((_ is MissingZero!9210) lt!439057) (not ((_ is MissingVacant!9210) lt!439057)) (and (bvsge (index!39214 lt!439057) #b00000000000000000000000000000000) (bvslt (index!39214 lt!439057) (size!30572 _keys!1544)))) (or ((_ is Undefined!9210) lt!439057) (ite ((_ is Found!9210) lt!439057) (= (select (arr!30093 _keys!1544) (index!39212 lt!439057)) (select (arr!30093 _keys!1544) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9210) lt!439057) (= (select (arr!30093 _keys!1544) (index!39211 lt!439057)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9210) lt!439057) (= (select (arr!30093 _keys!1544) (index!39214 lt!439057)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117471 (= lt!439057 e!558000)))

(declare-fun c!100358 () Bool)

(declare-fun lt!439056 () SeekEntryResult!9210)

(assert (=> d!117471 (= c!100358 (and ((_ is Intermediate!9210) lt!439056) (undefined!10022 lt!439056)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62479 (_ BitVec 32)) SeekEntryResult!9210)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!117471 (= lt!439056 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) mask!1948) (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948))))

(assert (=> d!117471 (validMask!0 mask!1948)))

(assert (=> d!117471 (= (seekEntryOrOpen!0 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) lt!439057)))

(declare-fun b!989560 () Bool)

(declare-fun e!558001 () SeekEntryResult!9210)

(assert (=> b!989560 (= e!558001 (Found!9210 (index!39213 lt!439056)))))

(declare-fun b!989561 () Bool)

(declare-fun c!100359 () Bool)

(declare-fun lt!439058 () (_ BitVec 64))

(assert (=> b!989561 (= c!100359 (= lt!439058 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!558002 () SeekEntryResult!9210)

(assert (=> b!989561 (= e!558001 e!558002)))

(declare-fun b!989562 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62479 (_ BitVec 32)) SeekEntryResult!9210)

(assert (=> b!989562 (= e!558002 (seekKeyOrZeroReturnVacant!0 (x!86092 lt!439056) (index!39213 lt!439056) (index!39213 lt!439056) (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948))))

(declare-fun b!989563 () Bool)

(assert (=> b!989563 (= e!558002 (MissingZero!9210 (index!39213 lt!439056)))))

(declare-fun b!989564 () Bool)

(assert (=> b!989564 (= e!558000 e!558001)))

(assert (=> b!989564 (= lt!439058 (select (arr!30093 _keys!1544) (index!39213 lt!439056)))))

(declare-fun c!100360 () Bool)

(assert (=> b!989564 (= c!100360 (= lt!439058 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!117471 c!100358) b!989559))

(assert (= (and d!117471 (not c!100358)) b!989564))

(assert (= (and b!989564 c!100360) b!989560))

(assert (= (and b!989564 (not c!100360)) b!989561))

(assert (= (and b!989561 c!100359) b!989563))

(assert (= (and b!989561 (not c!100359)) b!989562))

(assert (=> d!117471 m!916217))

(declare-fun m!917031 () Bool)

(assert (=> d!117471 m!917031))

(declare-fun m!917033 () Bool)

(assert (=> d!117471 m!917033))

(assert (=> d!117471 m!916279))

(declare-fun m!917035 () Bool)

(assert (=> d!117471 m!917035))

(declare-fun m!917037 () Bool)

(assert (=> d!117471 m!917037))

(assert (=> d!117471 m!917035))

(assert (=> d!117471 m!916279))

(declare-fun m!917039 () Bool)

(assert (=> d!117471 m!917039))

(assert (=> b!989562 m!916279))

(declare-fun m!917041 () Bool)

(assert (=> b!989562 m!917041))

(declare-fun m!917043 () Bool)

(assert (=> b!989564 m!917043))

(assert (=> b!989141 d!117471))

(assert (=> bm!41925 d!117355))

(declare-fun d!117473 () Bool)

(assert (=> d!117473 (= (+!3085 (+!3085 lt!438712 (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714)) (+!3085 (+!3085 lt!438712 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714)) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (=> d!117473 true))

(declare-fun _$28!188 () Unit!32825)

(assert (=> d!117473 (= (choose!1610 lt!438712 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30093 _keys!1544) from!1932) lt!438714) _$28!188)))

(declare-fun bs!28097 () Bool)

(assert (= bs!28097 d!117473))

(assert (=> bs!28097 m!916309))

(assert (=> bs!28097 m!916309))

(assert (=> bs!28097 m!916311))

(assert (=> bs!28097 m!916307))

(assert (=> bs!28097 m!916307))

(assert (=> bs!28097 m!916315))

(assert (=> d!117283 d!117473))

(declare-fun d!117475 () Bool)

(declare-fun e!558003 () Bool)

(assert (=> d!117475 e!558003))

(declare-fun res!661741 () Bool)

(assert (=> d!117475 (=> (not res!661741) (not e!558003))))

(declare-fun lt!439062 () ListLongMap!13583)

(assert (=> d!117475 (= res!661741 (contains!5719 lt!439062 (_1!7454 (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun lt!439059 () List!20815)

(assert (=> d!117475 (= lt!439062 (ListLongMap!13584 lt!439059))))

(declare-fun lt!439060 () Unit!32825)

(declare-fun lt!439061 () Unit!32825)

(assert (=> d!117475 (= lt!439060 lt!439061)))

(assert (=> d!117475 (= (getValueByKey!513 lt!439059 (_1!7454 (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!518 (_2!7454 (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117475 (= lt!439061 (lemmaContainsTupThenGetReturnValue!272 lt!439059 (_1!7454 (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7454 (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117475 (= lt!439059 (insertStrictlySorted!329 (toList!6807 lt!438712) (_1!7454 (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7454 (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117475 (= (+!3085 lt!438712 (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) lt!439062)))

(declare-fun b!989565 () Bool)

(declare-fun res!661740 () Bool)

(assert (=> b!989565 (=> (not res!661740) (not e!558003))))

(assert (=> b!989565 (= res!661740 (= (getValueByKey!513 (toList!6807 lt!439062) (_1!7454 (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!518 (_2!7454 (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))))

(declare-fun b!989566 () Bool)

(assert (=> b!989566 (= e!558003 (contains!5720 (toList!6807 lt!439062) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (= (and d!117475 res!661741) b!989565))

(assert (= (and b!989565 res!661740) b!989566))

(declare-fun m!917045 () Bool)

(assert (=> d!117475 m!917045))

(declare-fun m!917047 () Bool)

(assert (=> d!117475 m!917047))

(declare-fun m!917049 () Bool)

(assert (=> d!117475 m!917049))

(declare-fun m!917051 () Bool)

(assert (=> d!117475 m!917051))

(declare-fun m!917053 () Bool)

(assert (=> b!989565 m!917053))

(declare-fun m!917055 () Bool)

(assert (=> b!989566 m!917055))

(assert (=> d!117283 d!117475))

(declare-fun d!117477 () Bool)

(declare-fun e!558004 () Bool)

(assert (=> d!117477 e!558004))

(declare-fun res!661743 () Bool)

(assert (=> d!117477 (=> (not res!661743) (not e!558004))))

(declare-fun lt!439066 () ListLongMap!13583)

(assert (=> d!117477 (= res!661743 (contains!5719 lt!439066 (_1!7454 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714))))))

(declare-fun lt!439063 () List!20815)

(assert (=> d!117477 (= lt!439066 (ListLongMap!13584 lt!439063))))

(declare-fun lt!439064 () Unit!32825)

(declare-fun lt!439065 () Unit!32825)

(assert (=> d!117477 (= lt!439064 lt!439065)))

(assert (=> d!117477 (= (getValueByKey!513 lt!439063 (_1!7454 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714))) (Some!518 (_2!7454 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714))))))

(assert (=> d!117477 (= lt!439065 (lemmaContainsTupThenGetReturnValue!272 lt!439063 (_1!7454 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714)) (_2!7454 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714))))))

(assert (=> d!117477 (= lt!439063 (insertStrictlySorted!329 (toList!6807 (+!3085 lt!438712 (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (_1!7454 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714)) (_2!7454 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714))))))

(assert (=> d!117477 (= (+!3085 (+!3085 lt!438712 (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714)) lt!439066)))

(declare-fun b!989567 () Bool)

(declare-fun res!661742 () Bool)

(assert (=> b!989567 (=> (not res!661742) (not e!558004))))

(assert (=> b!989567 (= res!661742 (= (getValueByKey!513 (toList!6807 lt!439066) (_1!7454 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714))) (Some!518 (_2!7454 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714)))))))

(declare-fun b!989568 () Bool)

(assert (=> b!989568 (= e!558004 (contains!5720 (toList!6807 lt!439066) (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714)))))

(assert (= (and d!117477 res!661743) b!989567))

(assert (= (and b!989567 res!661742) b!989568))

(declare-fun m!917057 () Bool)

(assert (=> d!117477 m!917057))

(declare-fun m!917059 () Bool)

(assert (=> d!117477 m!917059))

(declare-fun m!917061 () Bool)

(assert (=> d!117477 m!917061))

(declare-fun m!917063 () Bool)

(assert (=> d!117477 m!917063))

(declare-fun m!917065 () Bool)

(assert (=> b!989567 m!917065))

(declare-fun m!917067 () Bool)

(assert (=> b!989568 m!917067))

(assert (=> d!117283 d!117477))

(declare-fun d!117479 () Bool)

(declare-fun e!558005 () Bool)

(assert (=> d!117479 e!558005))

(declare-fun res!661745 () Bool)

(assert (=> d!117479 (=> (not res!661745) (not e!558005))))

(declare-fun lt!439070 () ListLongMap!13583)

(assert (=> d!117479 (= res!661745 (contains!5719 lt!439070 (_1!7454 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714))))))

(declare-fun lt!439067 () List!20815)

(assert (=> d!117479 (= lt!439070 (ListLongMap!13584 lt!439067))))

(declare-fun lt!439068 () Unit!32825)

(declare-fun lt!439069 () Unit!32825)

(assert (=> d!117479 (= lt!439068 lt!439069)))

(assert (=> d!117479 (= (getValueByKey!513 lt!439067 (_1!7454 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714))) (Some!518 (_2!7454 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714))))))

(assert (=> d!117479 (= lt!439069 (lemmaContainsTupThenGetReturnValue!272 lt!439067 (_1!7454 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714)) (_2!7454 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714))))))

(assert (=> d!117479 (= lt!439067 (insertStrictlySorted!329 (toList!6807 lt!438712) (_1!7454 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714)) (_2!7454 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714))))))

(assert (=> d!117479 (= (+!3085 lt!438712 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714)) lt!439070)))

(declare-fun b!989569 () Bool)

(declare-fun res!661744 () Bool)

(assert (=> b!989569 (=> (not res!661744) (not e!558005))))

(assert (=> b!989569 (= res!661744 (= (getValueByKey!513 (toList!6807 lt!439070) (_1!7454 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714))) (Some!518 (_2!7454 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714)))))))

(declare-fun b!989570 () Bool)

(assert (=> b!989570 (= e!558005 (contains!5720 (toList!6807 lt!439070) (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714)))))

(assert (= (and d!117479 res!661745) b!989569))

(assert (= (and b!989569 res!661744) b!989570))

(declare-fun m!917069 () Bool)

(assert (=> d!117479 m!917069))

(declare-fun m!917071 () Bool)

(assert (=> d!117479 m!917071))

(declare-fun m!917073 () Bool)

(assert (=> d!117479 m!917073))

(declare-fun m!917075 () Bool)

(assert (=> d!117479 m!917075))

(declare-fun m!917077 () Bool)

(assert (=> b!989569 m!917077))

(declare-fun m!917079 () Bool)

(assert (=> b!989570 m!917079))

(assert (=> d!117283 d!117479))

(declare-fun d!117481 () Bool)

(declare-fun e!558006 () Bool)

(assert (=> d!117481 e!558006))

(declare-fun res!661747 () Bool)

(assert (=> d!117481 (=> (not res!661747) (not e!558006))))

(declare-fun lt!439074 () ListLongMap!13583)

(assert (=> d!117481 (= res!661747 (contains!5719 lt!439074 (_1!7454 (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun lt!439071 () List!20815)

(assert (=> d!117481 (= lt!439074 (ListLongMap!13584 lt!439071))))

(declare-fun lt!439072 () Unit!32825)

(declare-fun lt!439073 () Unit!32825)

(assert (=> d!117481 (= lt!439072 lt!439073)))

(assert (=> d!117481 (= (getValueByKey!513 lt!439071 (_1!7454 (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!518 (_2!7454 (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117481 (= lt!439073 (lemmaContainsTupThenGetReturnValue!272 lt!439071 (_1!7454 (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7454 (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117481 (= lt!439071 (insertStrictlySorted!329 (toList!6807 (+!3085 lt!438712 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714))) (_1!7454 (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7454 (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117481 (= (+!3085 (+!3085 lt!438712 (tuple2!14887 (select (arr!30093 _keys!1544) from!1932) lt!438714)) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) lt!439074)))

(declare-fun b!989571 () Bool)

(declare-fun res!661746 () Bool)

(assert (=> b!989571 (=> (not res!661746) (not e!558006))))

(assert (=> b!989571 (= res!661746 (= (getValueByKey!513 (toList!6807 lt!439074) (_1!7454 (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!518 (_2!7454 (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))))

(declare-fun b!989572 () Bool)

(assert (=> b!989572 (= e!558006 (contains!5720 (toList!6807 lt!439074) (tuple2!14887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (= (and d!117481 res!661747) b!989571))

(assert (= (and b!989571 res!661746) b!989572))

(declare-fun m!917081 () Bool)

(assert (=> d!117481 m!917081))

(declare-fun m!917083 () Bool)

(assert (=> d!117481 m!917083))

(declare-fun m!917085 () Bool)

(assert (=> d!117481 m!917085))

(declare-fun m!917087 () Bool)

(assert (=> d!117481 m!917087))

(declare-fun m!917089 () Bool)

(assert (=> b!989571 m!917089))

(declare-fun m!917091 () Bool)

(assert (=> b!989572 m!917091))

(assert (=> d!117283 d!117481))

(declare-fun d!117483 () Bool)

(declare-fun e!558007 () Bool)

(assert (=> d!117483 e!558007))

(declare-fun res!661748 () Bool)

(assert (=> d!117483 (=> res!661748 e!558007)))

(declare-fun lt!439076 () Bool)

(assert (=> d!117483 (= res!661748 (not lt!439076))))

(declare-fun lt!439078 () Bool)

(assert (=> d!117483 (= lt!439076 lt!439078)))

(declare-fun lt!439077 () Unit!32825)

(declare-fun e!558008 () Unit!32825)

(assert (=> d!117483 (= lt!439077 e!558008)))

(declare-fun c!100361 () Bool)

(assert (=> d!117483 (= c!100361 lt!439078)))

(assert (=> d!117483 (= lt!439078 (containsKey!478 (toList!6807 lt!438845) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117483 (= (contains!5719 lt!438845 #b0000000000000000000000000000000000000000000000000000000000000000) lt!439076)))

(declare-fun b!989573 () Bool)

(declare-fun lt!439075 () Unit!32825)

(assert (=> b!989573 (= e!558008 lt!439075)))

(assert (=> b!989573 (= lt!439075 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6807 lt!438845) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!989573 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438845) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989574 () Bool)

(declare-fun Unit!32842 () Unit!32825)

(assert (=> b!989574 (= e!558008 Unit!32842)))

(declare-fun b!989575 () Bool)

(assert (=> b!989575 (= e!558007 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438845) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117483 c!100361) b!989573))

(assert (= (and d!117483 (not c!100361)) b!989574))

(assert (= (and d!117483 (not res!661748)) b!989575))

(declare-fun m!917093 () Bool)

(assert (=> d!117483 m!917093))

(declare-fun m!917095 () Bool)

(assert (=> b!989573 m!917095))

(assert (=> b!989573 m!917001))

(assert (=> b!989573 m!917001))

(declare-fun m!917097 () Bool)

(assert (=> b!989573 m!917097))

(assert (=> b!989575 m!917001))

(assert (=> b!989575 m!917001))

(assert (=> b!989575 m!917097))

(assert (=> bm!41920 d!117483))

(declare-fun d!117485 () Bool)

(declare-fun e!558009 () Bool)

(assert (=> d!117485 e!558009))

(declare-fun res!661749 () Bool)

(assert (=> d!117485 (=> res!661749 e!558009)))

(declare-fun lt!439080 () Bool)

(assert (=> d!117485 (= res!661749 (not lt!439080))))

(declare-fun lt!439082 () Bool)

(assert (=> d!117485 (= lt!439080 lt!439082)))

(declare-fun lt!439081 () Unit!32825)

(declare-fun e!558010 () Unit!32825)

(assert (=> d!117485 (= lt!439081 e!558010)))

(declare-fun c!100362 () Bool)

(assert (=> d!117485 (= c!100362 lt!439082)))

(assert (=> d!117485 (= lt!439082 (containsKey!478 (toList!6807 lt!438815) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117485 (= (contains!5719 lt!438815 #b0000000000000000000000000000000000000000000000000000000000000000) lt!439080)))

(declare-fun b!989576 () Bool)

(declare-fun lt!439079 () Unit!32825)

(assert (=> b!989576 (= e!558010 lt!439079)))

(assert (=> b!989576 (= lt!439079 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6807 lt!438815) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!989576 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438815) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989577 () Bool)

(declare-fun Unit!32843 () Unit!32825)

(assert (=> b!989577 (= e!558010 Unit!32843)))

(declare-fun b!989578 () Bool)

(assert (=> b!989578 (= e!558009 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438815) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117485 c!100362) b!989576))

(assert (= (and d!117485 (not c!100362)) b!989577))

(assert (= (and d!117485 (not res!661749)) b!989578))

(declare-fun m!917099 () Bool)

(assert (=> d!117485 m!917099))

(declare-fun m!917101 () Bool)

(assert (=> b!989576 m!917101))

(assert (=> b!989576 m!917005))

(assert (=> b!989576 m!917005))

(declare-fun m!917103 () Bool)

(assert (=> b!989576 m!917103))

(assert (=> b!989578 m!917005))

(assert (=> b!989578 m!917005))

(assert (=> b!989578 m!917103))

(assert (=> bm!41913 d!117485))

(declare-fun d!117487 () Bool)

(declare-fun e!558011 () Bool)

(assert (=> d!117487 e!558011))

(declare-fun res!661750 () Bool)

(assert (=> d!117487 (=> res!661750 e!558011)))

(declare-fun lt!439084 () Bool)

(assert (=> d!117487 (= res!661750 (not lt!439084))))

(declare-fun lt!439086 () Bool)

(assert (=> d!117487 (= lt!439084 lt!439086)))

(declare-fun lt!439085 () Unit!32825)

(declare-fun e!558012 () Unit!32825)

(assert (=> d!117487 (= lt!439085 e!558012)))

(declare-fun c!100363 () Bool)

(assert (=> d!117487 (= c!100363 lt!439086)))

(assert (=> d!117487 (= lt!439086 (containsKey!478 (toList!6807 lt!438858) (_1!7454 lt!438711)))))

(assert (=> d!117487 (= (contains!5719 lt!438858 (_1!7454 lt!438711)) lt!439084)))

(declare-fun b!989579 () Bool)

(declare-fun lt!439083 () Unit!32825)

(assert (=> b!989579 (= e!558012 lt!439083)))

(assert (=> b!989579 (= lt!439083 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6807 lt!438858) (_1!7454 lt!438711)))))

(assert (=> b!989579 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438858) (_1!7454 lt!438711)))))

(declare-fun b!989580 () Bool)

(declare-fun Unit!32844 () Unit!32825)

(assert (=> b!989580 (= e!558012 Unit!32844)))

(declare-fun b!989581 () Bool)

(assert (=> b!989581 (= e!558011 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438858) (_1!7454 lt!438711))))))

(assert (= (and d!117487 c!100363) b!989579))

(assert (= (and d!117487 (not c!100363)) b!989580))

(assert (= (and d!117487 (not res!661750)) b!989581))

(declare-fun m!917105 () Bool)

(assert (=> d!117487 m!917105))

(declare-fun m!917107 () Bool)

(assert (=> b!989579 m!917107))

(assert (=> b!989579 m!916463))

(assert (=> b!989579 m!916463))

(declare-fun m!917109 () Bool)

(assert (=> b!989579 m!917109))

(assert (=> b!989581 m!916463))

(assert (=> b!989581 m!916463))

(assert (=> b!989581 m!917109))

(assert (=> d!117295 d!117487))

(declare-fun d!117489 () Bool)

(declare-fun c!100364 () Bool)

(assert (=> d!117489 (= c!100364 (and ((_ is Cons!20811) lt!438855) (= (_1!7454 (h!21973 lt!438855)) (_1!7454 lt!438711))))))

(declare-fun e!558013 () Option!519)

(assert (=> d!117489 (= (getValueByKey!513 lt!438855 (_1!7454 lt!438711)) e!558013)))

(declare-fun b!989585 () Bool)

(declare-fun e!558014 () Option!519)

(assert (=> b!989585 (= e!558014 None!517)))

(declare-fun b!989583 () Bool)

(assert (=> b!989583 (= e!558013 e!558014)))

(declare-fun c!100365 () Bool)

(assert (=> b!989583 (= c!100365 (and ((_ is Cons!20811) lt!438855) (not (= (_1!7454 (h!21973 lt!438855)) (_1!7454 lt!438711)))))))

(declare-fun b!989582 () Bool)

(assert (=> b!989582 (= e!558013 (Some!518 (_2!7454 (h!21973 lt!438855))))))

(declare-fun b!989584 () Bool)

(assert (=> b!989584 (= e!558014 (getValueByKey!513 (t!29770 lt!438855) (_1!7454 lt!438711)))))

(assert (= (and d!117489 c!100364) b!989582))

(assert (= (and d!117489 (not c!100364)) b!989583))

(assert (= (and b!989583 c!100365) b!989584))

(assert (= (and b!989583 (not c!100365)) b!989585))

(declare-fun m!917111 () Bool)

(assert (=> b!989584 m!917111))

(assert (=> d!117295 d!117489))

(declare-fun d!117491 () Bool)

(assert (=> d!117491 (= (getValueByKey!513 lt!438855 (_1!7454 lt!438711)) (Some!518 (_2!7454 lt!438711)))))

(declare-fun lt!439087 () Unit!32825)

(assert (=> d!117491 (= lt!439087 (choose!1611 lt!438855 (_1!7454 lt!438711) (_2!7454 lt!438711)))))

(declare-fun e!558015 () Bool)

(assert (=> d!117491 e!558015))

(declare-fun res!661751 () Bool)

(assert (=> d!117491 (=> (not res!661751) (not e!558015))))

(assert (=> d!117491 (= res!661751 (isStrictlySorted!516 lt!438855))))

(assert (=> d!117491 (= (lemmaContainsTupThenGetReturnValue!272 lt!438855 (_1!7454 lt!438711) (_2!7454 lt!438711)) lt!439087)))

(declare-fun b!989586 () Bool)

(declare-fun res!661752 () Bool)

(assert (=> b!989586 (=> (not res!661752) (not e!558015))))

(assert (=> b!989586 (= res!661752 (containsKey!478 lt!438855 (_1!7454 lt!438711)))))

(declare-fun b!989587 () Bool)

(assert (=> b!989587 (= e!558015 (contains!5720 lt!438855 (tuple2!14887 (_1!7454 lt!438711) (_2!7454 lt!438711))))))

(assert (= (and d!117491 res!661751) b!989586))

(assert (= (and b!989586 res!661752) b!989587))

(assert (=> d!117491 m!916457))

(declare-fun m!917113 () Bool)

(assert (=> d!117491 m!917113))

(declare-fun m!917115 () Bool)

(assert (=> d!117491 m!917115))

(declare-fun m!917117 () Bool)

(assert (=> b!989586 m!917117))

(declare-fun m!917119 () Bool)

(assert (=> b!989587 m!917119))

(assert (=> d!117295 d!117491))

(declare-fun d!117493 () Bool)

(declare-fun e!558019 () Bool)

(assert (=> d!117493 e!558019))

(declare-fun res!661753 () Bool)

(assert (=> d!117493 (=> (not res!661753) (not e!558019))))

(declare-fun lt!439088 () List!20815)

(assert (=> d!117493 (= res!661753 (isStrictlySorted!516 lt!439088))))

(declare-fun e!558020 () List!20815)

(assert (=> d!117493 (= lt!439088 e!558020)))

(declare-fun c!100369 () Bool)

(assert (=> d!117493 (= c!100369 (and ((_ is Cons!20811) (toList!6807 (+!3085 lt!438712 lt!438713))) (bvslt (_1!7454 (h!21973 (toList!6807 (+!3085 lt!438712 lt!438713)))) (_1!7454 lt!438711))))))

(assert (=> d!117493 (isStrictlySorted!516 (toList!6807 (+!3085 lt!438712 lt!438713)))))

(assert (=> d!117493 (= (insertStrictlySorted!329 (toList!6807 (+!3085 lt!438712 lt!438713)) (_1!7454 lt!438711) (_2!7454 lt!438711)) lt!439088)))

(declare-fun bm!41945 () Bool)

(declare-fun call!41950 () List!20815)

(declare-fun call!41948 () List!20815)

(assert (=> bm!41945 (= call!41950 call!41948)))

(declare-fun c!100366 () Bool)

(declare-fun c!100367 () Bool)

(declare-fun e!558018 () List!20815)

(declare-fun b!989588 () Bool)

(assert (=> b!989588 (= e!558018 (ite c!100366 (t!29770 (toList!6807 (+!3085 lt!438712 lt!438713))) (ite c!100367 (Cons!20811 (h!21973 (toList!6807 (+!3085 lt!438712 lt!438713))) (t!29770 (toList!6807 (+!3085 lt!438712 lt!438713)))) Nil!20812)))))

(declare-fun b!989589 () Bool)

(assert (=> b!989589 (= e!558019 (contains!5720 lt!439088 (tuple2!14887 (_1!7454 lt!438711) (_2!7454 lt!438711))))))

(declare-fun b!989590 () Bool)

(declare-fun e!558017 () List!20815)

(assert (=> b!989590 (= e!558017 call!41950)))

(declare-fun b!989591 () Bool)

(assert (=> b!989591 (= e!558017 call!41950)))

(declare-fun b!989592 () Bool)

(assert (=> b!989592 (= c!100367 (and ((_ is Cons!20811) (toList!6807 (+!3085 lt!438712 lt!438713))) (bvsgt (_1!7454 (h!21973 (toList!6807 (+!3085 lt!438712 lt!438713)))) (_1!7454 lt!438711))))))

(declare-fun e!558016 () List!20815)

(assert (=> b!989592 (= e!558016 e!558017)))

(declare-fun bm!41946 () Bool)

(declare-fun call!41949 () List!20815)

(assert (=> bm!41946 (= call!41948 call!41949)))

(declare-fun b!989593 () Bool)

(assert (=> b!989593 (= e!558020 e!558016)))

(assert (=> b!989593 (= c!100366 (and ((_ is Cons!20811) (toList!6807 (+!3085 lt!438712 lt!438713))) (= (_1!7454 (h!21973 (toList!6807 (+!3085 lt!438712 lt!438713)))) (_1!7454 lt!438711))))))

(declare-fun b!989594 () Bool)

(assert (=> b!989594 (= e!558020 call!41949)))

(declare-fun b!989595 () Bool)

(declare-fun res!661754 () Bool)

(assert (=> b!989595 (=> (not res!661754) (not e!558019))))

(assert (=> b!989595 (= res!661754 (containsKey!478 lt!439088 (_1!7454 lt!438711)))))

(declare-fun b!989596 () Bool)

(assert (=> b!989596 (= e!558016 call!41948)))

(declare-fun b!989597 () Bool)

(assert (=> b!989597 (= e!558018 (insertStrictlySorted!329 (t!29770 (toList!6807 (+!3085 lt!438712 lt!438713))) (_1!7454 lt!438711) (_2!7454 lt!438711)))))

(declare-fun bm!41947 () Bool)

(assert (=> bm!41947 (= call!41949 ($colon$colon!555 e!558018 (ite c!100369 (h!21973 (toList!6807 (+!3085 lt!438712 lt!438713))) (tuple2!14887 (_1!7454 lt!438711) (_2!7454 lt!438711)))))))

(declare-fun c!100368 () Bool)

(assert (=> bm!41947 (= c!100368 c!100369)))

(assert (= (and d!117493 c!100369) b!989594))

(assert (= (and d!117493 (not c!100369)) b!989593))

(assert (= (and b!989593 c!100366) b!989596))

(assert (= (and b!989593 (not c!100366)) b!989592))

(assert (= (and b!989592 c!100367) b!989591))

(assert (= (and b!989592 (not c!100367)) b!989590))

(assert (= (or b!989591 b!989590) bm!41945))

(assert (= (or b!989596 bm!41945) bm!41946))

(assert (= (or b!989594 bm!41946) bm!41947))

(assert (= (and bm!41947 c!100368) b!989597))

(assert (= (and bm!41947 (not c!100368)) b!989588))

(assert (= (and d!117493 res!661753) b!989595))

(assert (= (and b!989595 res!661754) b!989589))

(declare-fun m!917121 () Bool)

(assert (=> d!117493 m!917121))

(declare-fun m!917123 () Bool)

(assert (=> d!117493 m!917123))

(declare-fun m!917125 () Bool)

(assert (=> b!989589 m!917125))

(declare-fun m!917127 () Bool)

(assert (=> b!989595 m!917127))

(declare-fun m!917129 () Bool)

(assert (=> b!989597 m!917129))

(declare-fun m!917131 () Bool)

(assert (=> bm!41947 m!917131))

(assert (=> d!117295 d!117493))

(declare-fun d!117495 () Bool)

(assert (=> d!117495 (= (apply!895 lt!438845 (select (arr!30093 _keys!1544) from!1932)) (get!15623 (getValueByKey!513 (toList!6807 lt!438845) (select (arr!30093 _keys!1544) from!1932))))))

(declare-fun bs!28098 () Bool)

(assert (= bs!28098 d!117495))

(assert (=> bs!28098 m!916201))

(assert (=> bs!28098 m!916879))

(assert (=> bs!28098 m!916879))

(declare-fun m!917133 () Bool)

(assert (=> bs!28098 m!917133))

(assert (=> b!989240 d!117495))

(assert (=> b!989240 d!117299))

(declare-fun d!117497 () Bool)

(assert (=> d!117497 (= (apply!895 lt!438815 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15623 (getValueByKey!513 (toList!6807 lt!438815) (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(declare-fun bs!28099 () Bool)

(assert (= bs!28099 d!117497))

(assert (=> bs!28099 m!916329))

(assert (=> bs!28099 m!916919))

(assert (=> bs!28099 m!916919))

(declare-fun m!917135 () Bool)

(assert (=> bs!28099 m!917135))

(assert (=> b!989215 d!117497))

(assert (=> b!989215 d!117327))

(declare-fun d!117499 () Bool)

(declare-fun lt!439089 () Bool)

(assert (=> d!117499 (= lt!439089 (select (content!421 (toList!6807 lt!438832)) lt!438713))))

(declare-fun e!558022 () Bool)

(assert (=> d!117499 (= lt!439089 e!558022)))

(declare-fun res!661755 () Bool)

(assert (=> d!117499 (=> (not res!661755) (not e!558022))))

(assert (=> d!117499 (= res!661755 ((_ is Cons!20811) (toList!6807 lt!438832)))))

(assert (=> d!117499 (= (contains!5720 (toList!6807 lt!438832) lt!438713) lt!439089)))

(declare-fun b!989598 () Bool)

(declare-fun e!558021 () Bool)

(assert (=> b!989598 (= e!558022 e!558021)))

(declare-fun res!661756 () Bool)

(assert (=> b!989598 (=> res!661756 e!558021)))

(assert (=> b!989598 (= res!661756 (= (h!21973 (toList!6807 lt!438832)) lt!438713))))

(declare-fun b!989599 () Bool)

(assert (=> b!989599 (= e!558021 (contains!5720 (t!29770 (toList!6807 lt!438832)) lt!438713))))

(assert (= (and d!117499 res!661755) b!989598))

(assert (= (and b!989598 (not res!661756)) b!989599))

(declare-fun m!917137 () Bool)

(assert (=> d!117499 m!917137))

(declare-fun m!917139 () Bool)

(assert (=> d!117499 m!917139))

(declare-fun m!917141 () Bool)

(assert (=> b!989599 m!917141))

(assert (=> b!989231 d!117499))

(declare-fun d!117501 () Bool)

(assert (=> d!117501 (= (apply!895 lt!438875 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15623 (getValueByKey!513 (toList!6807 lt!438875) (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(declare-fun bs!28100 () Bool)

(assert (= bs!28100 d!117501))

(assert (=> bs!28100 m!916329))

(assert (=> bs!28100 m!916979))

(assert (=> bs!28100 m!916979))

(declare-fun m!917143 () Bool)

(assert (=> bs!28100 m!917143))

(assert (=> b!989295 d!117501))

(assert (=> b!989295 d!117327))

(declare-fun d!117503 () Bool)

(declare-fun c!100370 () Bool)

(assert (=> d!117503 (= c!100370 (and ((_ is Cons!20811) (toList!6807 lt!438751)) (= (_1!7454 (h!21973 (toList!6807 lt!438751))) (_1!7454 lt!438713))))))

(declare-fun e!558023 () Option!519)

(assert (=> d!117503 (= (getValueByKey!513 (toList!6807 lt!438751) (_1!7454 lt!438713)) e!558023)))

(declare-fun b!989603 () Bool)

(declare-fun e!558024 () Option!519)

(assert (=> b!989603 (= e!558024 None!517)))

(declare-fun b!989601 () Bool)

(assert (=> b!989601 (= e!558023 e!558024)))

(declare-fun c!100371 () Bool)

(assert (=> b!989601 (= c!100371 (and ((_ is Cons!20811) (toList!6807 lt!438751)) (not (= (_1!7454 (h!21973 (toList!6807 lt!438751))) (_1!7454 lt!438713)))))))

(declare-fun b!989600 () Bool)

(assert (=> b!989600 (= e!558023 (Some!518 (_2!7454 (h!21973 (toList!6807 lt!438751)))))))

(declare-fun b!989602 () Bool)

(assert (=> b!989602 (= e!558024 (getValueByKey!513 (t!29770 (toList!6807 lt!438751)) (_1!7454 lt!438713)))))

(assert (= (and d!117503 c!100370) b!989600))

(assert (= (and d!117503 (not c!100370)) b!989601))

(assert (= (and b!989601 c!100371) b!989602))

(assert (= (and b!989601 (not c!100371)) b!989603))

(declare-fun m!917145 () Bool)

(assert (=> b!989602 m!917145))

(assert (=> b!989161 d!117503))

(declare-fun d!117505 () Bool)

(declare-fun e!558025 () Bool)

(assert (=> d!117505 e!558025))

(declare-fun res!661757 () Bool)

(assert (=> d!117505 (=> res!661757 e!558025)))

(declare-fun lt!439091 () Bool)

(assert (=> d!117505 (= res!661757 (not lt!439091))))

(declare-fun lt!439093 () Bool)

(assert (=> d!117505 (= lt!439091 lt!439093)))

(declare-fun lt!439092 () Unit!32825)

(declare-fun e!558026 () Unit!32825)

(assert (=> d!117505 (= lt!439092 e!558026)))

(declare-fun c!100372 () Bool)

(assert (=> d!117505 (= c!100372 lt!439093)))

(assert (=> d!117505 (= lt!439093 (containsKey!478 (toList!6807 lt!438758) (_1!7454 lt!438711)))))

(assert (=> d!117505 (= (contains!5719 lt!438758 (_1!7454 lt!438711)) lt!439091)))

(declare-fun b!989604 () Bool)

(declare-fun lt!439090 () Unit!32825)

(assert (=> b!989604 (= e!558026 lt!439090)))

(assert (=> b!989604 (= lt!439090 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6807 lt!438758) (_1!7454 lt!438711)))))

(assert (=> b!989604 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438758) (_1!7454 lt!438711)))))

(declare-fun b!989605 () Bool)

(declare-fun Unit!32845 () Unit!32825)

(assert (=> b!989605 (= e!558026 Unit!32845)))

(declare-fun b!989606 () Bool)

(assert (=> b!989606 (= e!558025 (isDefined!383 (getValueByKey!513 (toList!6807 lt!438758) (_1!7454 lt!438711))))))

(assert (= (and d!117505 c!100372) b!989604))

(assert (= (and d!117505 (not c!100372)) b!989605))

(assert (= (and d!117505 (not res!661757)) b!989606))

(declare-fun m!917147 () Bool)

(assert (=> d!117505 m!917147))

(declare-fun m!917149 () Bool)

(assert (=> b!989604 m!917149))

(assert (=> b!989604 m!916325))

(assert (=> b!989604 m!916325))

(declare-fun m!917151 () Bool)

(assert (=> b!989604 m!917151))

(assert (=> b!989606 m!916325))

(assert (=> b!989606 m!916325))

(assert (=> b!989606 m!917151))

(assert (=> d!117285 d!117505))

(declare-fun d!117507 () Bool)

(declare-fun c!100373 () Bool)

(assert (=> d!117507 (= c!100373 (and ((_ is Cons!20811) lt!438755) (= (_1!7454 (h!21973 lt!438755)) (_1!7454 lt!438711))))))

(declare-fun e!558027 () Option!519)

(assert (=> d!117507 (= (getValueByKey!513 lt!438755 (_1!7454 lt!438711)) e!558027)))

(declare-fun b!989610 () Bool)

(declare-fun e!558028 () Option!519)

(assert (=> b!989610 (= e!558028 None!517)))

(declare-fun b!989608 () Bool)

(assert (=> b!989608 (= e!558027 e!558028)))

(declare-fun c!100374 () Bool)

(assert (=> b!989608 (= c!100374 (and ((_ is Cons!20811) lt!438755) (not (= (_1!7454 (h!21973 lt!438755)) (_1!7454 lt!438711)))))))

(declare-fun b!989607 () Bool)

(assert (=> b!989607 (= e!558027 (Some!518 (_2!7454 (h!21973 lt!438755))))))

(declare-fun b!989609 () Bool)

(assert (=> b!989609 (= e!558028 (getValueByKey!513 (t!29770 lt!438755) (_1!7454 lt!438711)))))

(assert (= (and d!117507 c!100373) b!989607))

(assert (= (and d!117507 (not c!100373)) b!989608))

(assert (= (and b!989608 c!100374) b!989609))

(assert (= (and b!989608 (not c!100374)) b!989610))

(declare-fun m!917153 () Bool)

(assert (=> b!989609 m!917153))

(assert (=> d!117285 d!117507))

(declare-fun d!117509 () Bool)

(assert (=> d!117509 (= (getValueByKey!513 lt!438755 (_1!7454 lt!438711)) (Some!518 (_2!7454 lt!438711)))))

(declare-fun lt!439094 () Unit!32825)

(assert (=> d!117509 (= lt!439094 (choose!1611 lt!438755 (_1!7454 lt!438711) (_2!7454 lt!438711)))))

(declare-fun e!558029 () Bool)

(assert (=> d!117509 e!558029))

(declare-fun res!661758 () Bool)

(assert (=> d!117509 (=> (not res!661758) (not e!558029))))

(assert (=> d!117509 (= res!661758 (isStrictlySorted!516 lt!438755))))

(assert (=> d!117509 (= (lemmaContainsTupThenGetReturnValue!272 lt!438755 (_1!7454 lt!438711) (_2!7454 lt!438711)) lt!439094)))

(declare-fun b!989611 () Bool)

(declare-fun res!661759 () Bool)

(assert (=> b!989611 (=> (not res!661759) (not e!558029))))

(assert (=> b!989611 (= res!661759 (containsKey!478 lt!438755 (_1!7454 lt!438711)))))

(declare-fun b!989612 () Bool)

(assert (=> b!989612 (= e!558029 (contains!5720 lt!438755 (tuple2!14887 (_1!7454 lt!438711) (_2!7454 lt!438711))))))

(assert (= (and d!117509 res!661758) b!989611))

(assert (= (and b!989611 res!661759) b!989612))

(assert (=> d!117509 m!916319))

(declare-fun m!917155 () Bool)

(assert (=> d!117509 m!917155))

(declare-fun m!917157 () Bool)

(assert (=> d!117509 m!917157))

(declare-fun m!917159 () Bool)

(assert (=> b!989611 m!917159))

(declare-fun m!917161 () Bool)

(assert (=> b!989612 m!917161))

(assert (=> d!117285 d!117509))

(declare-fun d!117511 () Bool)

(declare-fun e!558033 () Bool)

(assert (=> d!117511 e!558033))

(declare-fun res!661760 () Bool)

(assert (=> d!117511 (=> (not res!661760) (not e!558033))))

(declare-fun lt!439095 () List!20815)

(assert (=> d!117511 (= res!661760 (isStrictlySorted!516 lt!439095))))

(declare-fun e!558034 () List!20815)

(assert (=> d!117511 (= lt!439095 e!558034)))

(declare-fun c!100378 () Bool)

(assert (=> d!117511 (= c!100378 (and ((_ is Cons!20811) (toList!6807 (getCurrentListMap!3866 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (bvslt (_1!7454 (h!21973 (toList!6807 (getCurrentListMap!3866 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7454 lt!438711))))))

(assert (=> d!117511 (isStrictlySorted!516 (toList!6807 (getCurrentListMap!3866 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))))

(assert (=> d!117511 (= (insertStrictlySorted!329 (toList!6807 (getCurrentListMap!3866 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7454 lt!438711) (_2!7454 lt!438711)) lt!439095)))

(declare-fun bm!41948 () Bool)

(declare-fun call!41953 () List!20815)

(declare-fun call!41951 () List!20815)

(assert (=> bm!41948 (= call!41953 call!41951)))

(declare-fun c!100376 () Bool)

(declare-fun e!558032 () List!20815)

(declare-fun c!100375 () Bool)

(declare-fun b!989613 () Bool)

(assert (=> b!989613 (= e!558032 (ite c!100375 (t!29770 (toList!6807 (getCurrentListMap!3866 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (ite c!100376 (Cons!20811 (h!21973 (toList!6807 (getCurrentListMap!3866 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (t!29770 (toList!6807 (getCurrentListMap!3866 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) Nil!20812)))))

(declare-fun b!989614 () Bool)

(assert (=> b!989614 (= e!558033 (contains!5720 lt!439095 (tuple2!14887 (_1!7454 lt!438711) (_2!7454 lt!438711))))))

(declare-fun b!989615 () Bool)

(declare-fun e!558031 () List!20815)

(assert (=> b!989615 (= e!558031 call!41953)))

(declare-fun b!989616 () Bool)

(assert (=> b!989616 (= e!558031 call!41953)))

(declare-fun b!989617 () Bool)

(assert (=> b!989617 (= c!100376 (and ((_ is Cons!20811) (toList!6807 (getCurrentListMap!3866 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (bvsgt (_1!7454 (h!21973 (toList!6807 (getCurrentListMap!3866 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7454 lt!438711))))))

(declare-fun e!558030 () List!20815)

(assert (=> b!989617 (= e!558030 e!558031)))

(declare-fun bm!41949 () Bool)

(declare-fun call!41952 () List!20815)

(assert (=> bm!41949 (= call!41951 call!41952)))

(declare-fun b!989618 () Bool)

(assert (=> b!989618 (= e!558034 e!558030)))

(assert (=> b!989618 (= c!100375 (and ((_ is Cons!20811) (toList!6807 (getCurrentListMap!3866 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (= (_1!7454 (h!21973 (toList!6807 (getCurrentListMap!3866 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7454 lt!438711))))))

(declare-fun b!989619 () Bool)

(assert (=> b!989619 (= e!558034 call!41952)))

(declare-fun b!989620 () Bool)

(declare-fun res!661761 () Bool)

(assert (=> b!989620 (=> (not res!661761) (not e!558033))))

(assert (=> b!989620 (= res!661761 (containsKey!478 lt!439095 (_1!7454 lt!438711)))))

(declare-fun b!989621 () Bool)

(assert (=> b!989621 (= e!558030 call!41951)))

(declare-fun b!989622 () Bool)

(assert (=> b!989622 (= e!558032 (insertStrictlySorted!329 (t!29770 (toList!6807 (getCurrentListMap!3866 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (_1!7454 lt!438711) (_2!7454 lt!438711)))))

(declare-fun bm!41950 () Bool)

(assert (=> bm!41950 (= call!41952 ($colon$colon!555 e!558032 (ite c!100378 (h!21973 (toList!6807 (getCurrentListMap!3866 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (tuple2!14887 (_1!7454 lt!438711) (_2!7454 lt!438711)))))))

(declare-fun c!100377 () Bool)

(assert (=> bm!41950 (= c!100377 c!100378)))

(assert (= (and d!117511 c!100378) b!989619))

(assert (= (and d!117511 (not c!100378)) b!989618))

(assert (= (and b!989618 c!100375) b!989621))

(assert (= (and b!989618 (not c!100375)) b!989617))

(assert (= (and b!989617 c!100376) b!989616))

(assert (= (and b!989617 (not c!100376)) b!989615))

(assert (= (or b!989616 b!989615) bm!41948))

(assert (= (or b!989621 bm!41948) bm!41949))

(assert (= (or b!989619 bm!41949) bm!41950))

(assert (= (and bm!41950 c!100377) b!989622))

(assert (= (and bm!41950 (not c!100377)) b!989613))

(assert (= (and d!117511 res!661760) b!989620))

(assert (= (and b!989620 res!661761) b!989614))

(declare-fun m!917163 () Bool)

(assert (=> d!117511 m!917163))

(declare-fun m!917165 () Bool)

(assert (=> d!117511 m!917165))

(declare-fun m!917167 () Bool)

(assert (=> b!989614 m!917167))

(declare-fun m!917169 () Bool)

(assert (=> b!989620 m!917169))

(declare-fun m!917171 () Bool)

(assert (=> b!989622 m!917171))

(declare-fun m!917173 () Bool)

(assert (=> bm!41950 m!917173))

(assert (=> d!117285 d!117511))

(declare-fun d!117513 () Bool)

(assert (=> d!117513 (= (get!15622 (select (arr!30092 _values!1278) from!1932) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1867 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!989260 d!117513))

(assert (=> d!117287 d!117303))

(declare-fun mapNonEmpty!36937 () Bool)

(declare-fun mapRes!36937 () Bool)

(declare-fun tp!69927 () Bool)

(declare-fun e!558035 () Bool)

(assert (=> mapNonEmpty!36937 (= mapRes!36937 (and tp!69927 e!558035))))

(declare-fun mapKey!36937 () (_ BitVec 32))

(declare-fun mapRest!36937 () (Array (_ BitVec 32) ValueCell!11148))

(declare-fun mapValue!36937 () ValueCell!11148)

(assert (=> mapNonEmpty!36937 (= mapRest!36936 (store mapRest!36937 mapKey!36937 mapValue!36937))))

(declare-fun condMapEmpty!36937 () Bool)

(declare-fun mapDefault!36937 () ValueCell!11148)

(assert (=> mapNonEmpty!36936 (= condMapEmpty!36937 (= mapRest!36936 ((as const (Array (_ BitVec 32) ValueCell!11148)) mapDefault!36937)))))

(declare-fun e!558036 () Bool)

(assert (=> mapNonEmpty!36936 (= tp!69926 (and e!558036 mapRes!36937))))

(declare-fun mapIsEmpty!36937 () Bool)

(assert (=> mapIsEmpty!36937 mapRes!36937))

(declare-fun b!989623 () Bool)

(assert (=> b!989623 (= e!558035 tp_is_empty!23259)))

(declare-fun b!989624 () Bool)

(assert (=> b!989624 (= e!558036 tp_is_empty!23259)))

(assert (= (and mapNonEmpty!36936 condMapEmpty!36937) mapIsEmpty!36937))

(assert (= (and mapNonEmpty!36936 (not condMapEmpty!36937)) mapNonEmpty!36937))

(assert (= (and mapNonEmpty!36937 ((_ is ValueCellFull!11148) mapValue!36937)) b!989623))

(assert (= (and mapNonEmpty!36936 ((_ is ValueCellFull!11148) mapDefault!36937)) b!989624))

(declare-fun m!917175 () Bool)

(assert (=> mapNonEmpty!36937 m!917175))

(declare-fun b_lambda!15129 () Bool)

(assert (= b_lambda!15121 (or (and start!84562 b_free!20043) b_lambda!15129)))

(declare-fun b_lambda!15131 () Bool)

(assert (= b_lambda!15123 (or (and start!84562 b_free!20043) b_lambda!15131)))

(declare-fun b_lambda!15133 () Bool)

(assert (= b_lambda!15125 (or (and start!84562 b_free!20043) b_lambda!15133)))

(declare-fun b_lambda!15135 () Bool)

(assert (= b_lambda!15127 (or (and start!84562 b_free!20043) b_lambda!15135)))

(check-sat (not b!989444) (not d!117395) (not d!117509) (not b!989535) (not d!117485) (not d!117371) (not b!989447) (not d!117479) (not d!117495) (not b!989373) (not b!989527) (not b!989586) (not b!989538) (not b!989512) (not d!117421) (not d!117361) (not b!989523) (not b!989311) (not b!989487) (not b!989614) (not b!989478) (not b!989515) (not b!989476) (not d!117425) (not b!989384) (not b!989570) (not d!117427) (not b!989437) (not b!989477) (not b!989517) (not b!989494) (not b!989418) (not d!117475) (not b!989458) (not b!989532) (not b!989313) (not d!117449) (not b!989457) (not bm!41947) (not b!989403) (not b_next!20043) (not b!989536) (not b!989425) (not b!989525) (not b!989385) (not b!989587) (not d!117455) (not b!989546) (not d!117397) (not b!989462) (not d!117315) (not b!989414) (not d!117385) (not b!989330) (not bm!41942) (not b_lambda!15113) (not d!117333) (not b!989565) (not d!117383) (not d!117399) (not b!989436) (not b!989589) (not b!989503) (not b!989366) (not b!989540) (not b!989475) (not b_lambda!15129) (not d!117471) (not b!989467) (not b!989368) (not d!117405) (not b!989562) (not b_lambda!15133) (not d!117341) (not b!989456) (not b!989471) (not d!117403) (not d!117417) (not d!117369) (not b_lambda!15135) (not b!989410) (not b!989497) (not b!989581) (not b!989480) (not d!117325) (not b!989575) (not b!989438) (not b!989421) (not b!989460) (not d!117391) (not b!989511) (not b!989566) (not b!989395) (not b!989612) (not b!989369) (not d!117453) (not d!117329) (not b!989573) (not d!117433) (not b_lambda!15119) (not b!989568) (not b!989571) (not d!117419) (not b!989423) (not d!117497) (not d!117477) (not b!989392) (not b!989455) (not b!989428) (not d!117309) (not d!117439) (not b!989426) (not b!989495) (not b!989516) (not b!989609) (not d!117375) (not b!989431) (not b!989443) (not b!989464) (not b_lambda!15115) (not d!117411) (not b!989359) (not d!117473) (not b_lambda!15103) (not b_lambda!15131) (not d!117393) (not d!117365) (not d!117483) (not d!117487) (not mapNonEmpty!36937) (not bm!41938) (not d!117505) (not b!989599) (not d!117313) (not b!989579) (not b!989370) (not b!989469) (not d!117379) (not b!989449) (not d!117355) (not d!117459) (not b!989371) (not b_lambda!15117) (not b!989602) (not d!117349) (not d!117339) (not d!117343) (not b!989569) (not b!989411) (not b!989572) (not b!989353) (not b!989435) (not b!989597) (not b!989514) (not b!989440) (not b!989578) (not bm!41944) (not d!117345) (not bm!41934) (not b!989442) (not d!117491) (not b!989584) (not d!117389) (not d!117407) (not b!989492) (not b!989576) (not d!117457) (not d!117481) (not b!989416) (not d!117357) (not b!989401) (not b!989482) (not b!989489) (not bm!41939) (not d!117445) (not b!989537) (not d!117511) (not d!117373) (not d!117367) (not d!117363) (not d!117359) (not d!117387) (not b!989611) (not b!989513) b_and!32177 (not b!989530) tp_is_empty!23259 (not d!117377) (not d!117401) (not d!117465) (not b!989404) (not d!117467) (not b!989448) (not b!989406) (not b!989372) (not b!989412) (not d!117447) (not b!989508) (not d!117461) (not b!989479) (not d!117443) (not b!989465) (not b!989620) (not d!117351) (not b!989485) (not b!989361) (not b!989534) (not bm!41943) (not d!117431) (not b!989324) (not d!117463) (not b!989622) (not b!989393) (not d!117335) (not b!989331) (not d!117413) (not d!117435) (not b!989474) (not b!989390) (not b!989445) (not b!989387) (not d!117409) (not d!117381) (not b!989529) (not bm!41937) (not b!989506) (not b!989409) (not b!989505) (not d!117493) (not b!989604) (not b!989567) (not b!989595) (not bm!41950) (not b!989374) (not b!989606) (not d!117323) (not d!117501) (not d!117331) (not b!989417) (not d!117415) (not d!117499) (not b!989470) (not b!989364))
(check-sat b_and!32177 (not b_next!20043))
