; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84364 () Bool)

(assert start!84364)

(declare-fun b_free!19969 () Bool)

(declare-fun b_next!19969 () Bool)

(assert (=> start!84364 (= b_free!19969 (not b_next!19969))))

(declare-fun tp!69683 () Bool)

(declare-fun b_and!31977 () Bool)

(assert (=> start!84364 (= tp!69683 b_and!31977)))

(declare-fun b!986806 () Bool)

(declare-fun res!660238 () Bool)

(declare-fun e!556452 () Bool)

(assert (=> b!986806 (=> (not res!660238) (not e!556452))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62258 0))(
  ( (array!62259 (arr!29987 (Array (_ BitVec 32) (_ BitVec 64))) (size!30468 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62258)

(assert (=> b!986806 (= res!660238 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30468 _keys!1544))))))

(declare-fun b!986808 () Bool)

(declare-fun e!556450 () Bool)

(declare-fun e!556451 () Bool)

(declare-fun mapRes!36806 () Bool)

(assert (=> b!986808 (= e!556450 (and e!556451 mapRes!36806))))

(declare-fun condMapEmpty!36806 () Bool)

(declare-datatypes ((V!35897 0))(
  ( (V!35898 (val!11643 Int)) )
))
(declare-datatypes ((ValueCell!11111 0))(
  ( (ValueCellFull!11111 (v!14204 V!35897)) (EmptyCell!11111) )
))
(declare-datatypes ((array!62260 0))(
  ( (array!62261 (arr!29988 (Array (_ BitVec 32) ValueCell!11111)) (size!30469 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62260)

(declare-fun mapDefault!36806 () ValueCell!11111)

(assert (=> b!986808 (= condMapEmpty!36806 (= (arr!29988 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11111)) mapDefault!36806)))))

(declare-fun b!986809 () Bool)

(assert (=> b!986809 (= e!556452 (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29987 _keys!1544) from!1932)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35897)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14912 0))(
  ( (tuple2!14913 (_1!7467 (_ BitVec 64)) (_2!7467 V!35897)) )
))
(declare-datatypes ((List!20798 0))(
  ( (Nil!20795) (Cons!20794 (h!21956 tuple2!14912) (t!29688 List!20798)) )
))
(declare-datatypes ((ListLongMap!13599 0))(
  ( (ListLongMap!13600 (toList!6815 List!20798)) )
))
(declare-fun lt!437337 () ListLongMap!13599)

(declare-fun minValue!1220 () V!35897)

(declare-fun +!3091 (ListLongMap!13599 tuple2!14912) ListLongMap!13599)

(declare-fun getCurrentListMapNoExtraKeys!3519 (array!62258 array!62260 (_ BitVec 32) (_ BitVec 32) V!35897 V!35897 (_ BitVec 32) Int) ListLongMap!13599)

(assert (=> b!986809 (= lt!437337 (+!3091 (getCurrentListMapNoExtraKeys!3519 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14913 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!986810 () Bool)

(declare-fun res!660243 () Bool)

(assert (=> b!986810 (=> (not res!660243) (not e!556452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62258 (_ BitVec 32)) Bool)

(assert (=> b!986810 (= res!660243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986811 () Bool)

(declare-fun res!660240 () Bool)

(assert (=> b!986811 (=> (not res!660240) (not e!556452))))

(declare-datatypes ((List!20799 0))(
  ( (Nil!20796) (Cons!20795 (h!21957 (_ BitVec 64)) (t!29689 List!20799)) )
))
(declare-fun arrayNoDuplicates!0 (array!62258 (_ BitVec 32) List!20799) Bool)

(assert (=> b!986811 (= res!660240 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20796))))

(declare-fun b!986812 () Bool)

(declare-fun res!660239 () Bool)

(assert (=> b!986812 (=> (not res!660239) (not e!556452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!986812 (= res!660239 (validKeyInArray!0 (select (arr!29987 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!36806 () Bool)

(assert (=> mapIsEmpty!36806 mapRes!36806))

(declare-fun b!986813 () Bool)

(declare-fun res!660242 () Bool)

(assert (=> b!986813 (=> (not res!660242) (not e!556452))))

(assert (=> b!986813 (= res!660242 (and (= (size!30469 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30468 _keys!1544) (size!30469 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36806 () Bool)

(declare-fun tp!69682 () Bool)

(declare-fun e!556454 () Bool)

(assert (=> mapNonEmpty!36806 (= mapRes!36806 (and tp!69682 e!556454))))

(declare-fun mapValue!36806 () ValueCell!11111)

(declare-fun mapKey!36806 () (_ BitVec 32))

(declare-fun mapRest!36806 () (Array (_ BitVec 32) ValueCell!11111))

(assert (=> mapNonEmpty!36806 (= (arr!29988 _values!1278) (store mapRest!36806 mapKey!36806 mapValue!36806))))

(declare-fun res!660241 () Bool)

(assert (=> start!84364 (=> (not res!660241) (not e!556452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84364 (= res!660241 (validMask!0 mask!1948))))

(assert (=> start!84364 e!556452))

(assert (=> start!84364 true))

(declare-fun tp_is_empty!23185 () Bool)

(assert (=> start!84364 tp_is_empty!23185))

(declare-fun array_inv!23179 (array!62260) Bool)

(assert (=> start!84364 (and (array_inv!23179 _values!1278) e!556450)))

(assert (=> start!84364 tp!69683))

(declare-fun array_inv!23180 (array!62258) Bool)

(assert (=> start!84364 (array_inv!23180 _keys!1544)))

(declare-fun b!986807 () Bool)

(assert (=> b!986807 (= e!556454 tp_is_empty!23185)))

(declare-fun b!986814 () Bool)

(assert (=> b!986814 (= e!556451 tp_is_empty!23185)))

(declare-fun b!986815 () Bool)

(declare-fun res!660237 () Bool)

(assert (=> b!986815 (=> (not res!660237) (not e!556452))))

(assert (=> b!986815 (= res!660237 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!84364 res!660241) b!986813))

(assert (= (and b!986813 res!660242) b!986810))

(assert (= (and b!986810 res!660243) b!986811))

(assert (= (and b!986811 res!660240) b!986806))

(assert (= (and b!986806 res!660238) b!986812))

(assert (= (and b!986812 res!660239) b!986815))

(assert (= (and b!986815 res!660237) b!986809))

(assert (= (and b!986808 condMapEmpty!36806) mapIsEmpty!36806))

(assert (= (and b!986808 (not condMapEmpty!36806)) mapNonEmpty!36806))

(get-info :version)

(assert (= (and mapNonEmpty!36806 ((_ is ValueCellFull!11111) mapValue!36806)) b!986807))

(assert (= (and b!986808 ((_ is ValueCellFull!11111) mapDefault!36806)) b!986814))

(assert (= start!84364 b!986808))

(declare-fun m!912905 () Bool)

(assert (=> b!986812 m!912905))

(assert (=> b!986812 m!912905))

(declare-fun m!912907 () Bool)

(assert (=> b!986812 m!912907))

(declare-fun m!912909 () Bool)

(assert (=> b!986810 m!912909))

(assert (=> b!986809 m!912905))

(declare-fun m!912911 () Bool)

(assert (=> b!986809 m!912911))

(assert (=> b!986809 m!912911))

(declare-fun m!912913 () Bool)

(assert (=> b!986809 m!912913))

(declare-fun m!912915 () Bool)

(assert (=> b!986811 m!912915))

(declare-fun m!912917 () Bool)

(assert (=> start!84364 m!912917))

(declare-fun m!912919 () Bool)

(assert (=> start!84364 m!912919))

(declare-fun m!912921 () Bool)

(assert (=> start!84364 m!912921))

(declare-fun m!912923 () Bool)

(assert (=> mapNonEmpty!36806 m!912923))

(check-sat (not b_next!19969) (not b!986811) tp_is_empty!23185 b_and!31977 (not b!986812) (not b!986810) (not b!986809) (not start!84364) (not mapNonEmpty!36806))
(check-sat b_and!31977 (not b_next!19969))
(get-model)

(declare-fun d!116705 () Bool)

(declare-fun e!556487 () Bool)

(assert (=> d!116705 e!556487))

(declare-fun res!660291 () Bool)

(assert (=> d!116705 (=> (not res!660291) (not e!556487))))

(declare-fun lt!437354 () ListLongMap!13599)

(declare-fun contains!5679 (ListLongMap!13599 (_ BitVec 64)) Bool)

(assert (=> d!116705 (= res!660291 (contains!5679 lt!437354 (_1!7467 (tuple2!14913 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun lt!437355 () List!20798)

(assert (=> d!116705 (= lt!437354 (ListLongMap!13600 lt!437355))))

(declare-datatypes ((Unit!32638 0))(
  ( (Unit!32639) )
))
(declare-fun lt!437353 () Unit!32638)

(declare-fun lt!437352 () Unit!32638)

(assert (=> d!116705 (= lt!437353 lt!437352)))

(declare-datatypes ((Option!519 0))(
  ( (Some!518 (v!14207 V!35897)) (None!517) )
))
(declare-fun getValueByKey!513 (List!20798 (_ BitVec 64)) Option!519)

(assert (=> d!116705 (= (getValueByKey!513 lt!437355 (_1!7467 (tuple2!14913 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!518 (_2!7467 (tuple2!14913 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun lemmaContainsTupThenGetReturnValue!270 (List!20798 (_ BitVec 64) V!35897) Unit!32638)

(assert (=> d!116705 (= lt!437352 (lemmaContainsTupThenGetReturnValue!270 lt!437355 (_1!7467 (tuple2!14913 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7467 (tuple2!14913 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun insertStrictlySorted!327 (List!20798 (_ BitVec 64) V!35897) List!20798)

(assert (=> d!116705 (= lt!437355 (insertStrictlySorted!327 (toList!6815 (getCurrentListMapNoExtraKeys!3519 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7467 (tuple2!14913 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7467 (tuple2!14913 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!116705 (= (+!3091 (getCurrentListMapNoExtraKeys!3519 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14913 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) lt!437354)))

(declare-fun b!986880 () Bool)

(declare-fun res!660290 () Bool)

(assert (=> b!986880 (=> (not res!660290) (not e!556487))))

(assert (=> b!986880 (= res!660290 (= (getValueByKey!513 (toList!6815 lt!437354) (_1!7467 (tuple2!14913 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!518 (_2!7467 (tuple2!14913 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))))

(declare-fun b!986881 () Bool)

(declare-fun contains!5680 (List!20798 tuple2!14912) Bool)

(assert (=> b!986881 (= e!556487 (contains!5680 (toList!6815 lt!437354) (tuple2!14913 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (= (and d!116705 res!660291) b!986880))

(assert (= (and b!986880 res!660290) b!986881))

(declare-fun m!912965 () Bool)

(assert (=> d!116705 m!912965))

(declare-fun m!912967 () Bool)

(assert (=> d!116705 m!912967))

(declare-fun m!912969 () Bool)

(assert (=> d!116705 m!912969))

(declare-fun m!912971 () Bool)

(assert (=> d!116705 m!912971))

(declare-fun m!912973 () Bool)

(assert (=> b!986880 m!912973))

(declare-fun m!912975 () Bool)

(assert (=> b!986881 m!912975))

(assert (=> b!986809 d!116705))

(declare-fun e!556503 () Bool)

(declare-fun lt!437370 () ListLongMap!13599)

(declare-fun b!986906 () Bool)

(assert (=> b!986906 (= e!556503 (= lt!437370 (getCurrentListMapNoExtraKeys!3519 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun d!116707 () Bool)

(declare-fun e!556507 () Bool)

(assert (=> d!116707 e!556507))

(declare-fun res!660302 () Bool)

(assert (=> d!116707 (=> (not res!660302) (not e!556507))))

(assert (=> d!116707 (= res!660302 (not (contains!5679 lt!437370 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!556506 () ListLongMap!13599)

(assert (=> d!116707 (= lt!437370 e!556506)))

(declare-fun c!99968 () Bool)

(assert (=> d!116707 (= c!99968 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30468 _keys!1544)))))

(assert (=> d!116707 (validMask!0 mask!1948)))

(assert (=> d!116707 (= (getCurrentListMapNoExtraKeys!3519 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!437370)))

(declare-fun b!986907 () Bool)

(declare-fun isEmpty!723 (ListLongMap!13599) Bool)

(assert (=> b!986907 (= e!556503 (isEmpty!723 lt!437370))))

(declare-fun bm!41767 () Bool)

(declare-fun call!41770 () ListLongMap!13599)

(assert (=> bm!41767 (= call!41770 (getCurrentListMapNoExtraKeys!3519 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!986908 () Bool)

(declare-fun res!660300 () Bool)

(assert (=> b!986908 (=> (not res!660300) (not e!556507))))

(assert (=> b!986908 (= res!660300 (not (contains!5679 lt!437370 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!986909 () Bool)

(declare-fun lt!437375 () Unit!32638)

(declare-fun lt!437371 () Unit!32638)

(assert (=> b!986909 (= lt!437375 lt!437371)))

(declare-fun lt!437373 () (_ BitVec 64))

(declare-fun lt!437374 () (_ BitVec 64))

(declare-fun lt!437372 () ListLongMap!13599)

(declare-fun lt!437376 () V!35897)

(assert (=> b!986909 (not (contains!5679 (+!3091 lt!437372 (tuple2!14913 lt!437374 lt!437376)) lt!437373))))

(declare-fun addStillNotContains!231 (ListLongMap!13599 (_ BitVec 64) V!35897 (_ BitVec 64)) Unit!32638)

(assert (=> b!986909 (= lt!437371 (addStillNotContains!231 lt!437372 lt!437374 lt!437376 lt!437373))))

(assert (=> b!986909 (= lt!437373 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!15570 (ValueCell!11111 V!35897) V!35897)

(declare-fun dynLambda!1842 (Int (_ BitVec 64)) V!35897)

(assert (=> b!986909 (= lt!437376 (get!15570 (select (arr!29988 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1842 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!986909 (= lt!437374 (select (arr!29987 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!986909 (= lt!437372 call!41770)))

(declare-fun e!556502 () ListLongMap!13599)

(assert (=> b!986909 (= e!556502 (+!3091 call!41770 (tuple2!14913 (select (arr!29987 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15570 (select (arr!29988 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1842 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!986910 () Bool)

(declare-fun e!556505 () Bool)

(assert (=> b!986910 (= e!556507 e!556505)))

(declare-fun c!99966 () Bool)

(declare-fun e!556508 () Bool)

(assert (=> b!986910 (= c!99966 e!556508)))

(declare-fun res!660301 () Bool)

(assert (=> b!986910 (=> (not res!660301) (not e!556508))))

(assert (=> b!986910 (= res!660301 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30468 _keys!1544)))))

(declare-fun b!986911 () Bool)

(assert (=> b!986911 (= e!556502 call!41770)))

(declare-fun b!986912 () Bool)

(assert (=> b!986912 (= e!556506 e!556502)))

(declare-fun c!99967 () Bool)

(assert (=> b!986912 (= c!99967 (validKeyInArray!0 (select (arr!29987 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!986913 () Bool)

(assert (=> b!986913 (= e!556508 (validKeyInArray!0 (select (arr!29987 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!986913 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))

(declare-fun b!986914 () Bool)

(assert (=> b!986914 (= e!556505 e!556503)))

(declare-fun c!99969 () Bool)

(assert (=> b!986914 (= c!99969 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30468 _keys!1544)))))

(declare-fun b!986915 () Bool)

(assert (=> b!986915 (= e!556506 (ListLongMap!13600 Nil!20795))))

(declare-fun b!986916 () Bool)

(assert (=> b!986916 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30468 _keys!1544)))))

(assert (=> b!986916 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30469 _values!1278)))))

(declare-fun e!556504 () Bool)

(declare-fun apply!884 (ListLongMap!13599 (_ BitVec 64)) V!35897)

(assert (=> b!986916 (= e!556504 (= (apply!884 lt!437370 (select (arr!29987 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15570 (select (arr!29988 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1842 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!986917 () Bool)

(assert (=> b!986917 (= e!556505 e!556504)))

(assert (=> b!986917 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30468 _keys!1544)))))

(declare-fun res!660303 () Bool)

(assert (=> b!986917 (= res!660303 (contains!5679 lt!437370 (select (arr!29987 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!986917 (=> (not res!660303) (not e!556504))))

(assert (= (and d!116707 c!99968) b!986915))

(assert (= (and d!116707 (not c!99968)) b!986912))

(assert (= (and b!986912 c!99967) b!986909))

(assert (= (and b!986912 (not c!99967)) b!986911))

(assert (= (or b!986909 b!986911) bm!41767))

(assert (= (and d!116707 res!660302) b!986908))

(assert (= (and b!986908 res!660300) b!986910))

(assert (= (and b!986910 res!660301) b!986913))

(assert (= (and b!986910 c!99966) b!986917))

(assert (= (and b!986910 (not c!99966)) b!986914))

(assert (= (and b!986917 res!660303) b!986916))

(assert (= (and b!986914 c!99969) b!986906))

(assert (= (and b!986914 (not c!99969)) b!986907))

(declare-fun b_lambda!14971 () Bool)

(assert (=> (not b_lambda!14971) (not b!986909)))

(declare-fun t!29695 () Bool)

(declare-fun tb!6743 () Bool)

(assert (=> (and start!84364 (= defaultEntry!1281 defaultEntry!1281) t!29695) tb!6743))

(declare-fun result!13483 () Bool)

(assert (=> tb!6743 (= result!13483 tp_is_empty!23185)))

(assert (=> b!986909 t!29695))

(declare-fun b_and!31983 () Bool)

(assert (= b_and!31977 (and (=> t!29695 result!13483) b_and!31983)))

(declare-fun b_lambda!14973 () Bool)

(assert (=> (not b_lambda!14973) (not b!986916)))

(assert (=> b!986916 t!29695))

(declare-fun b_and!31985 () Bool)

(assert (= b_and!31983 (and (=> t!29695 result!13483) b_and!31985)))

(declare-fun m!912977 () Bool)

(assert (=> b!986906 m!912977))

(declare-fun m!912979 () Bool)

(assert (=> b!986916 m!912979))

(declare-fun m!912981 () Bool)

(assert (=> b!986916 m!912981))

(declare-fun m!912983 () Bool)

(assert (=> b!986916 m!912983))

(assert (=> b!986916 m!912979))

(assert (=> b!986916 m!912983))

(declare-fun m!912985 () Bool)

(assert (=> b!986916 m!912985))

(assert (=> b!986916 m!912981))

(declare-fun m!912987 () Bool)

(assert (=> b!986916 m!912987))

(assert (=> b!986917 m!912981))

(assert (=> b!986917 m!912981))

(declare-fun m!912989 () Bool)

(assert (=> b!986917 m!912989))

(assert (=> b!986912 m!912981))

(assert (=> b!986912 m!912981))

(declare-fun m!912991 () Bool)

(assert (=> b!986912 m!912991))

(declare-fun m!912993 () Bool)

(assert (=> b!986908 m!912993))

(declare-fun m!912995 () Bool)

(assert (=> b!986907 m!912995))

(declare-fun m!912997 () Bool)

(assert (=> b!986909 m!912997))

(declare-fun m!912999 () Bool)

(assert (=> b!986909 m!912999))

(assert (=> b!986909 m!912979))

(declare-fun m!913001 () Bool)

(assert (=> b!986909 m!913001))

(assert (=> b!986909 m!912981))

(assert (=> b!986909 m!912983))

(assert (=> b!986909 m!912979))

(assert (=> b!986909 m!912983))

(assert (=> b!986909 m!912985))

(assert (=> b!986909 m!912999))

(declare-fun m!913003 () Bool)

(assert (=> b!986909 m!913003))

(assert (=> b!986913 m!912981))

(assert (=> b!986913 m!912981))

(assert (=> b!986913 m!912991))

(declare-fun m!913005 () Bool)

(assert (=> d!116707 m!913005))

(assert (=> d!116707 m!912917))

(assert (=> bm!41767 m!912977))

(assert (=> b!986809 d!116707))

(declare-fun b!986928 () Bool)

(declare-fun e!556517 () Bool)

(declare-fun e!556516 () Bool)

(assert (=> b!986928 (= e!556517 e!556516)))

(declare-fun lt!437384 () (_ BitVec 64))

(assert (=> b!986928 (= lt!437384 (select (arr!29987 _keys!1544) #b00000000000000000000000000000000))))

(declare-fun lt!437383 () Unit!32638)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62258 (_ BitVec 64) (_ BitVec 32)) Unit!32638)

(assert (=> b!986928 (= lt!437383 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!437384 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62258 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!986928 (arrayContainsKey!0 _keys!1544 lt!437384 #b00000000000000000000000000000000)))

(declare-fun lt!437385 () Unit!32638)

(assert (=> b!986928 (= lt!437385 lt!437383)))

(declare-fun res!660309 () Bool)

(declare-datatypes ((SeekEntryResult!9201 0))(
  ( (MissingZero!9201 (index!39175 (_ BitVec 32))) (Found!9201 (index!39176 (_ BitVec 32))) (Intermediate!9201 (undefined!10013 Bool) (index!39177 (_ BitVec 32)) (x!85880 (_ BitVec 32))) (Undefined!9201) (MissingVacant!9201 (index!39178 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62258 (_ BitVec 32)) SeekEntryResult!9201)

(assert (=> b!986928 (= res!660309 (= (seekEntryOrOpen!0 (select (arr!29987 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9201 #b00000000000000000000000000000000)))))

(assert (=> b!986928 (=> (not res!660309) (not e!556516))))

(declare-fun b!986929 () Bool)

(declare-fun call!41773 () Bool)

(assert (=> b!986929 (= e!556517 call!41773)))

(declare-fun d!116709 () Bool)

(declare-fun res!660308 () Bool)

(declare-fun e!556515 () Bool)

(assert (=> d!116709 (=> res!660308 e!556515)))

(assert (=> d!116709 (= res!660308 (bvsge #b00000000000000000000000000000000 (size!30468 _keys!1544)))))

(assert (=> d!116709 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!556515)))

(declare-fun b!986930 () Bool)

(assert (=> b!986930 (= e!556515 e!556517)))

(declare-fun c!99972 () Bool)

(assert (=> b!986930 (= c!99972 (validKeyInArray!0 (select (arr!29987 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!986931 () Bool)

(assert (=> b!986931 (= e!556516 call!41773)))

(declare-fun bm!41770 () Bool)

(assert (=> bm!41770 (= call!41773 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(assert (= (and d!116709 (not res!660308)) b!986930))

(assert (= (and b!986930 c!99972) b!986928))

(assert (= (and b!986930 (not c!99972)) b!986929))

(assert (= (and b!986928 res!660309) b!986931))

(assert (= (or b!986931 b!986929) bm!41770))

(declare-fun m!913007 () Bool)

(assert (=> b!986928 m!913007))

(declare-fun m!913009 () Bool)

(assert (=> b!986928 m!913009))

(declare-fun m!913011 () Bool)

(assert (=> b!986928 m!913011))

(assert (=> b!986928 m!913007))

(declare-fun m!913013 () Bool)

(assert (=> b!986928 m!913013))

(assert (=> b!986930 m!913007))

(assert (=> b!986930 m!913007))

(declare-fun m!913015 () Bool)

(assert (=> b!986930 m!913015))

(declare-fun m!913017 () Bool)

(assert (=> bm!41770 m!913017))

(assert (=> b!986810 d!116709))

(declare-fun b!986942 () Bool)

(declare-fun e!556526 () Bool)

(declare-fun call!41776 () Bool)

(assert (=> b!986942 (= e!556526 call!41776)))

(declare-fun b!986943 () Bool)

(declare-fun e!556529 () Bool)

(declare-fun contains!5681 (List!20799 (_ BitVec 64)) Bool)

(assert (=> b!986943 (= e!556529 (contains!5681 Nil!20796 (select (arr!29987 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!986944 () Bool)

(declare-fun e!556527 () Bool)

(assert (=> b!986944 (= e!556527 e!556526)))

(declare-fun c!99975 () Bool)

(assert (=> b!986944 (= c!99975 (validKeyInArray!0 (select (arr!29987 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun bm!41773 () Bool)

(assert (=> bm!41773 (= call!41776 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99975 (Cons!20795 (select (arr!29987 _keys!1544) #b00000000000000000000000000000000) Nil!20796) Nil!20796)))))

(declare-fun b!986945 () Bool)

(assert (=> b!986945 (= e!556526 call!41776)))

(declare-fun d!116711 () Bool)

(declare-fun res!660317 () Bool)

(declare-fun e!556528 () Bool)

(assert (=> d!116711 (=> res!660317 e!556528)))

(assert (=> d!116711 (= res!660317 (bvsge #b00000000000000000000000000000000 (size!30468 _keys!1544)))))

(assert (=> d!116711 (= (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20796) e!556528)))

(declare-fun b!986946 () Bool)

(assert (=> b!986946 (= e!556528 e!556527)))

(declare-fun res!660318 () Bool)

(assert (=> b!986946 (=> (not res!660318) (not e!556527))))

(assert (=> b!986946 (= res!660318 (not e!556529))))

(declare-fun res!660316 () Bool)

(assert (=> b!986946 (=> (not res!660316) (not e!556529))))

(assert (=> b!986946 (= res!660316 (validKeyInArray!0 (select (arr!29987 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!116711 (not res!660317)) b!986946))

(assert (= (and b!986946 res!660316) b!986943))

(assert (= (and b!986946 res!660318) b!986944))

(assert (= (and b!986944 c!99975) b!986945))

(assert (= (and b!986944 (not c!99975)) b!986942))

(assert (= (or b!986945 b!986942) bm!41773))

(assert (=> b!986943 m!913007))

(assert (=> b!986943 m!913007))

(declare-fun m!913019 () Bool)

(assert (=> b!986943 m!913019))

(assert (=> b!986944 m!913007))

(assert (=> b!986944 m!913007))

(assert (=> b!986944 m!913015))

(assert (=> bm!41773 m!913007))

(declare-fun m!913021 () Bool)

(assert (=> bm!41773 m!913021))

(assert (=> b!986946 m!913007))

(assert (=> b!986946 m!913007))

(assert (=> b!986946 m!913015))

(assert (=> b!986811 d!116711))

(declare-fun d!116713 () Bool)

(assert (=> d!116713 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!84364 d!116713))

(declare-fun d!116715 () Bool)

(assert (=> d!116715 (= (array_inv!23179 _values!1278) (bvsge (size!30469 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!84364 d!116715))

(declare-fun d!116717 () Bool)

(assert (=> d!116717 (= (array_inv!23180 _keys!1544) (bvsge (size!30468 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!84364 d!116717))

(declare-fun d!116719 () Bool)

(assert (=> d!116719 (= (validKeyInArray!0 (select (arr!29987 _keys!1544) from!1932)) (and (not (= (select (arr!29987 _keys!1544) from!1932) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!29987 _keys!1544) from!1932) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!986812 d!116719))

(declare-fun b!986954 () Bool)

(declare-fun e!556535 () Bool)

(assert (=> b!986954 (= e!556535 tp_is_empty!23185)))

(declare-fun b!986953 () Bool)

(declare-fun e!556534 () Bool)

(assert (=> b!986953 (= e!556534 tp_is_empty!23185)))

(declare-fun condMapEmpty!36815 () Bool)

(declare-fun mapDefault!36815 () ValueCell!11111)

(assert (=> mapNonEmpty!36806 (= condMapEmpty!36815 (= mapRest!36806 ((as const (Array (_ BitVec 32) ValueCell!11111)) mapDefault!36815)))))

(declare-fun mapRes!36815 () Bool)

(assert (=> mapNonEmpty!36806 (= tp!69682 (and e!556535 mapRes!36815))))

(declare-fun mapIsEmpty!36815 () Bool)

(assert (=> mapIsEmpty!36815 mapRes!36815))

(declare-fun mapNonEmpty!36815 () Bool)

(declare-fun tp!69698 () Bool)

(assert (=> mapNonEmpty!36815 (= mapRes!36815 (and tp!69698 e!556534))))

(declare-fun mapValue!36815 () ValueCell!11111)

(declare-fun mapKey!36815 () (_ BitVec 32))

(declare-fun mapRest!36815 () (Array (_ BitVec 32) ValueCell!11111))

(assert (=> mapNonEmpty!36815 (= mapRest!36806 (store mapRest!36815 mapKey!36815 mapValue!36815))))

(assert (= (and mapNonEmpty!36806 condMapEmpty!36815) mapIsEmpty!36815))

(assert (= (and mapNonEmpty!36806 (not condMapEmpty!36815)) mapNonEmpty!36815))

(assert (= (and mapNonEmpty!36815 ((_ is ValueCellFull!11111) mapValue!36815)) b!986953))

(assert (= (and mapNonEmpty!36806 ((_ is ValueCellFull!11111) mapDefault!36815)) b!986954))

(declare-fun m!913023 () Bool)

(assert (=> mapNonEmpty!36815 m!913023))

(declare-fun b_lambda!14975 () Bool)

(assert (= b_lambda!14971 (or (and start!84364 b_free!19969) b_lambda!14975)))

(declare-fun b_lambda!14977 () Bool)

(assert (= b_lambda!14973 (or (and start!84364 b_free!19969) b_lambda!14977)))

(check-sat (not b_next!19969) (not b!986928) tp_is_empty!23185 (not d!116707) (not b!986930) (not b!986912) (not d!116705) (not b!986880) (not bm!41767) (not b!986944) (not b_lambda!14977) (not bm!41770) (not b!986916) (not bm!41773) (not b!986909) (not b_lambda!14975) (not b!986913) (not b!986906) b_and!31985 (not mapNonEmpty!36815) (not b!986946) (not b!986943) (not b!986907) (not b!986917) (not b!986908) (not b!986881))
(check-sat b_and!31985 (not b_next!19969))
