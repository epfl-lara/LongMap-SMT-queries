; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70968 () Bool)

(assert start!70968)

(declare-fun b_free!13185 () Bool)

(declare-fun b_next!13185 () Bool)

(assert (=> start!70968 (= b_free!13185 (not b_next!13185))))

(declare-fun tp!46306 () Bool)

(declare-fun b_and!22081 () Bool)

(assert (=> start!70968 (= tp!46306 b_and!22081)))

(declare-fun b!824179 () Bool)

(declare-fun e!458500 () Bool)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((array!45978 0))(
  ( (array!45979 (arr!22037 (Array (_ BitVec 32) (_ BitVec 64))) (size!22458 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45978)

(assert (=> b!824179 (= e!458500 (not (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!22458 _keys!976)))))))

(declare-datatypes ((V!24861 0))(
  ( (V!24862 (val!7495 Int)) )
))
(declare-datatypes ((tuple2!9918 0))(
  ( (tuple2!9919 (_1!4970 (_ BitVec 64)) (_2!4970 V!24861)) )
))
(declare-datatypes ((List!15729 0))(
  ( (Nil!15726) (Cons!15725 (h!16854 tuple2!9918) (t!22070 List!15729)) )
))
(declare-datatypes ((ListLongMap!8741 0))(
  ( (ListLongMap!8742 (toList!4386 List!15729)) )
))
(declare-fun lt!371700 () ListLongMap!8741)

(declare-fun lt!371699 () ListLongMap!8741)

(assert (=> b!824179 (= lt!371700 lt!371699)))

(declare-fun zeroValueBefore!34 () V!24861)

(declare-datatypes ((Unit!28240 0))(
  ( (Unit!28241) )
))
(declare-fun lt!371701 () Unit!28240)

(declare-fun zeroValueAfter!34 () V!24861)

(declare-fun minValue!754 () V!24861)

(declare-datatypes ((ValueCell!7032 0))(
  ( (ValueCellFull!7032 (v!9928 V!24861)) (EmptyCell!7032) )
))
(declare-datatypes ((array!45980 0))(
  ( (array!45981 (arr!22038 (Array (_ BitVec 32) ValueCell!7032)) (size!22459 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45980)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!511 (array!45978 array!45980 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24861 V!24861 V!24861 V!24861 (_ BitVec 32) Int) Unit!28240)

(assert (=> b!824179 (= lt!371701 (lemmaNoChangeToArrayThenSameMapNoExtras!511 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2401 (array!45978 array!45980 (_ BitVec 32) (_ BitVec 32) V!24861 V!24861 (_ BitVec 32) Int) ListLongMap!8741)

(assert (=> b!824179 (= lt!371699 (getCurrentListMapNoExtraKeys!2401 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824179 (= lt!371700 (getCurrentListMapNoExtraKeys!2401 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824180 () Bool)

(declare-fun res!561942 () Bool)

(assert (=> b!824180 (=> (not res!561942) (not e!458500))))

(assert (=> b!824180 (= res!561942 (and (= (size!22459 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22458 _keys!976) (size!22459 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23959 () Bool)

(declare-fun mapRes!23959 () Bool)

(assert (=> mapIsEmpty!23959 mapRes!23959))

(declare-fun b!824181 () Bool)

(declare-fun e!458501 () Bool)

(declare-fun tp_is_empty!14895 () Bool)

(assert (=> b!824181 (= e!458501 tp_is_empty!14895)))

(declare-fun b!824182 () Bool)

(declare-fun res!561943 () Bool)

(assert (=> b!824182 (=> (not res!561943) (not e!458500))))

(declare-datatypes ((List!15730 0))(
  ( (Nil!15727) (Cons!15726 (h!16855 (_ BitVec 64)) (t!22071 List!15730)) )
))
(declare-fun arrayNoDuplicates!0 (array!45978 (_ BitVec 32) List!15730) Bool)

(assert (=> b!824182 (= res!561943 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15727))))

(declare-fun res!561941 () Bool)

(assert (=> start!70968 (=> (not res!561941) (not e!458500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70968 (= res!561941 (validMask!0 mask!1312))))

(assert (=> start!70968 e!458500))

(assert (=> start!70968 tp_is_empty!14895))

(declare-fun array_inv!17585 (array!45978) Bool)

(assert (=> start!70968 (array_inv!17585 _keys!976)))

(assert (=> start!70968 true))

(declare-fun e!458503 () Bool)

(declare-fun array_inv!17586 (array!45980) Bool)

(assert (=> start!70968 (and (array_inv!17586 _values!788) e!458503)))

(assert (=> start!70968 tp!46306))

(declare-fun b!824183 () Bool)

(declare-fun e!458502 () Bool)

(assert (=> b!824183 (= e!458503 (and e!458502 mapRes!23959))))

(declare-fun condMapEmpty!23959 () Bool)

(declare-fun mapDefault!23959 () ValueCell!7032)

(assert (=> b!824183 (= condMapEmpty!23959 (= (arr!22038 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7032)) mapDefault!23959)))))

(declare-fun b!824184 () Bool)

(assert (=> b!824184 (= e!458502 tp_is_empty!14895)))

(declare-fun b!824185 () Bool)

(declare-fun res!561944 () Bool)

(assert (=> b!824185 (=> (not res!561944) (not e!458500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45978 (_ BitVec 32)) Bool)

(assert (=> b!824185 (= res!561944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23959 () Bool)

(declare-fun tp!46305 () Bool)

(assert (=> mapNonEmpty!23959 (= mapRes!23959 (and tp!46305 e!458501))))

(declare-fun mapKey!23959 () (_ BitVec 32))

(declare-fun mapValue!23959 () ValueCell!7032)

(declare-fun mapRest!23959 () (Array (_ BitVec 32) ValueCell!7032))

(assert (=> mapNonEmpty!23959 (= (arr!22038 _values!788) (store mapRest!23959 mapKey!23959 mapValue!23959))))

(assert (= (and start!70968 res!561941) b!824180))

(assert (= (and b!824180 res!561942) b!824185))

(assert (= (and b!824185 res!561944) b!824182))

(assert (= (and b!824182 res!561943) b!824179))

(assert (= (and b!824183 condMapEmpty!23959) mapIsEmpty!23959))

(assert (= (and b!824183 (not condMapEmpty!23959)) mapNonEmpty!23959))

(get-info :version)

(assert (= (and mapNonEmpty!23959 ((_ is ValueCellFull!7032) mapValue!23959)) b!824181))

(assert (= (and b!824183 ((_ is ValueCellFull!7032) mapDefault!23959)) b!824184))

(assert (= start!70968 b!824183))

(declare-fun m!766315 () Bool)

(assert (=> b!824179 m!766315))

(declare-fun m!766317 () Bool)

(assert (=> b!824179 m!766317))

(declare-fun m!766319 () Bool)

(assert (=> b!824179 m!766319))

(declare-fun m!766321 () Bool)

(assert (=> b!824182 m!766321))

(declare-fun m!766323 () Bool)

(assert (=> mapNonEmpty!23959 m!766323))

(declare-fun m!766325 () Bool)

(assert (=> start!70968 m!766325))

(declare-fun m!766327 () Bool)

(assert (=> start!70968 m!766327))

(declare-fun m!766329 () Bool)

(assert (=> start!70968 m!766329))

(declare-fun m!766331 () Bool)

(assert (=> b!824185 m!766331))

(check-sat (not b!824182) (not mapNonEmpty!23959) (not b!824179) (not start!70968) (not b_next!13185) (not b!824185) tp_is_empty!14895 b_and!22081)
(check-sat b_and!22081 (not b_next!13185))
(get-model)

(declare-fun b!824217 () Bool)

(declare-fun e!458527 () Bool)

(declare-fun e!458530 () Bool)

(assert (=> b!824217 (= e!458527 e!458530)))

(declare-fun c!89371 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!824217 (= c!89371 (validKeyInArray!0 (select (arr!22037 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!824218 () Bool)

(declare-fun e!458528 () Bool)

(declare-fun contains!4175 (List!15730 (_ BitVec 64)) Bool)

(assert (=> b!824218 (= e!458528 (contains!4175 Nil!15727 (select (arr!22037 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!824219 () Bool)

(declare-fun call!35832 () Bool)

(assert (=> b!824219 (= e!458530 call!35832)))

(declare-fun b!824220 () Bool)

(declare-fun e!458529 () Bool)

(assert (=> b!824220 (= e!458529 e!458527)))

(declare-fun res!561964 () Bool)

(assert (=> b!824220 (=> (not res!561964) (not e!458527))))

(assert (=> b!824220 (= res!561964 (not e!458528))))

(declare-fun res!561965 () Bool)

(assert (=> b!824220 (=> (not res!561965) (not e!458528))))

(assert (=> b!824220 (= res!561965 (validKeyInArray!0 (select (arr!22037 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35829 () Bool)

(assert (=> bm!35829 (= call!35832 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89371 (Cons!15726 (select (arr!22037 _keys!976) #b00000000000000000000000000000000) Nil!15727) Nil!15727)))))

(declare-fun d!104925 () Bool)

(declare-fun res!561963 () Bool)

(assert (=> d!104925 (=> res!561963 e!458529)))

(assert (=> d!104925 (= res!561963 (bvsge #b00000000000000000000000000000000 (size!22458 _keys!976)))))

(assert (=> d!104925 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15727) e!458529)))

(declare-fun b!824221 () Bool)

(assert (=> b!824221 (= e!458530 call!35832)))

(assert (= (and d!104925 (not res!561963)) b!824220))

(assert (= (and b!824220 res!561965) b!824218))

(assert (= (and b!824220 res!561964) b!824217))

(assert (= (and b!824217 c!89371) b!824221))

(assert (= (and b!824217 (not c!89371)) b!824219))

(assert (= (or b!824221 b!824219) bm!35829))

(declare-fun m!766351 () Bool)

(assert (=> b!824217 m!766351))

(assert (=> b!824217 m!766351))

(declare-fun m!766353 () Bool)

(assert (=> b!824217 m!766353))

(assert (=> b!824218 m!766351))

(assert (=> b!824218 m!766351))

(declare-fun m!766355 () Bool)

(assert (=> b!824218 m!766355))

(assert (=> b!824220 m!766351))

(assert (=> b!824220 m!766351))

(assert (=> b!824220 m!766353))

(assert (=> bm!35829 m!766351))

(declare-fun m!766357 () Bool)

(assert (=> bm!35829 m!766357))

(assert (=> b!824182 d!104925))

(declare-fun d!104927 () Bool)

(assert (=> d!104927 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70968 d!104927))

(declare-fun d!104929 () Bool)

(assert (=> d!104929 (= (array_inv!17585 _keys!976) (bvsge (size!22458 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70968 d!104929))

(declare-fun d!104931 () Bool)

(assert (=> d!104931 (= (array_inv!17586 _values!788) (bvsge (size!22459 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70968 d!104931))

(declare-fun d!104933 () Bool)

(assert (=> d!104933 (= (getCurrentListMapNoExtraKeys!2401 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2401 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371713 () Unit!28240)

(declare-fun choose!1403 (array!45978 array!45980 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24861 V!24861 V!24861 V!24861 (_ BitVec 32) Int) Unit!28240)

(assert (=> d!104933 (= lt!371713 (choose!1403 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104933 (validMask!0 mask!1312)))

(assert (=> d!104933 (= (lemmaNoChangeToArrayThenSameMapNoExtras!511 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371713)))

(declare-fun bs!23015 () Bool)

(assert (= bs!23015 d!104933))

(assert (=> bs!23015 m!766319))

(assert (=> bs!23015 m!766317))

(declare-fun m!766359 () Bool)

(assert (=> bs!23015 m!766359))

(assert (=> bs!23015 m!766325))

(assert (=> b!824179 d!104933))

(declare-fun b!824246 () Bool)

(declare-fun e!458550 () ListLongMap!8741)

(assert (=> b!824246 (= e!458550 (ListLongMap!8742 Nil!15726))))

(declare-fun b!824247 () Bool)

(declare-fun e!458547 () Bool)

(declare-fun e!458551 () Bool)

(assert (=> b!824247 (= e!458547 e!458551)))

(declare-fun c!89381 () Bool)

(assert (=> b!824247 (= c!89381 (bvslt #b00000000000000000000000000000000 (size!22458 _keys!976)))))

(declare-fun b!824249 () Bool)

(declare-fun lt!371734 () ListLongMap!8741)

(declare-fun isEmpty!642 (ListLongMap!8741) Bool)

(assert (=> b!824249 (= e!458551 (isEmpty!642 lt!371734))))

(declare-fun b!824250 () Bool)

(declare-fun e!458545 () ListLongMap!8741)

(declare-fun call!35835 () ListLongMap!8741)

(assert (=> b!824250 (= e!458545 call!35835)))

(declare-fun b!824251 () Bool)

(declare-fun e!458548 () Bool)

(assert (=> b!824251 (= e!458548 (validKeyInArray!0 (select (arr!22037 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!824251 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!824252 () Bool)

(declare-fun e!458549 () Bool)

(assert (=> b!824252 (= e!458549 e!458547)))

(declare-fun c!89382 () Bool)

(assert (=> b!824252 (= c!89382 e!458548)))

(declare-fun res!561975 () Bool)

(assert (=> b!824252 (=> (not res!561975) (not e!458548))))

(assert (=> b!824252 (= res!561975 (bvslt #b00000000000000000000000000000000 (size!22458 _keys!976)))))

(declare-fun b!824253 () Bool)

(declare-fun e!458546 () Bool)

(assert (=> b!824253 (= e!458547 e!458546)))

(assert (=> b!824253 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22458 _keys!976)))))

(declare-fun res!561976 () Bool)

(declare-fun contains!4176 (ListLongMap!8741 (_ BitVec 64)) Bool)

(assert (=> b!824253 (= res!561976 (contains!4176 lt!371734 (select (arr!22037 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!824253 (=> (not res!561976) (not e!458546))))

(declare-fun b!824254 () Bool)

(assert (=> b!824254 (= e!458550 e!458545)))

(declare-fun c!89380 () Bool)

(assert (=> b!824254 (= c!89380 (validKeyInArray!0 (select (arr!22037 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!824255 () Bool)

(assert (=> b!824255 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22458 _keys!976)))))

(assert (=> b!824255 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22459 _values!788)))))

(declare-fun apply!360 (ListLongMap!8741 (_ BitVec 64)) V!24861)

(declare-fun get!11701 (ValueCell!7032 V!24861) V!24861)

(declare-fun dynLambda!971 (Int (_ BitVec 64)) V!24861)

(assert (=> b!824255 (= e!458546 (= (apply!360 lt!371734 (select (arr!22037 _keys!976) #b00000000000000000000000000000000)) (get!11701 (select (arr!22038 _values!788) #b00000000000000000000000000000000) (dynLambda!971 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!104935 () Bool)

(assert (=> d!104935 e!458549))

(declare-fun res!561974 () Bool)

(assert (=> d!104935 (=> (not res!561974) (not e!458549))))

(assert (=> d!104935 (= res!561974 (not (contains!4176 lt!371734 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104935 (= lt!371734 e!458550)))

(declare-fun c!89383 () Bool)

(assert (=> d!104935 (= c!89383 (bvsge #b00000000000000000000000000000000 (size!22458 _keys!976)))))

(assert (=> d!104935 (validMask!0 mask!1312)))

(assert (=> d!104935 (= (getCurrentListMapNoExtraKeys!2401 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371734)))

(declare-fun b!824248 () Bool)

(declare-fun res!561977 () Bool)

(assert (=> b!824248 (=> (not res!561977) (not e!458549))))

(assert (=> b!824248 (= res!561977 (not (contains!4176 lt!371734 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!824256 () Bool)

(declare-fun lt!371731 () Unit!28240)

(declare-fun lt!371733 () Unit!28240)

(assert (=> b!824256 (= lt!371731 lt!371733)))

(declare-fun lt!371730 () (_ BitVec 64))

(declare-fun lt!371729 () V!24861)

(declare-fun lt!371728 () (_ BitVec 64))

(declare-fun lt!371732 () ListLongMap!8741)

(declare-fun +!1914 (ListLongMap!8741 tuple2!9918) ListLongMap!8741)

(assert (=> b!824256 (not (contains!4176 (+!1914 lt!371732 (tuple2!9919 lt!371730 lt!371729)) lt!371728))))

(declare-fun addStillNotContains!185 (ListLongMap!8741 (_ BitVec 64) V!24861 (_ BitVec 64)) Unit!28240)

(assert (=> b!824256 (= lt!371733 (addStillNotContains!185 lt!371732 lt!371730 lt!371729 lt!371728))))

(assert (=> b!824256 (= lt!371728 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!824256 (= lt!371729 (get!11701 (select (arr!22038 _values!788) #b00000000000000000000000000000000) (dynLambda!971 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!824256 (= lt!371730 (select (arr!22037 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!824256 (= lt!371732 call!35835)))

(assert (=> b!824256 (= e!458545 (+!1914 call!35835 (tuple2!9919 (select (arr!22037 _keys!976) #b00000000000000000000000000000000) (get!11701 (select (arr!22038 _values!788) #b00000000000000000000000000000000) (dynLambda!971 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!824257 () Bool)

(assert (=> b!824257 (= e!458551 (= lt!371734 (getCurrentListMapNoExtraKeys!2401 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun bm!35832 () Bool)

(assert (=> bm!35832 (= call!35835 (getCurrentListMapNoExtraKeys!2401 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(assert (= (and d!104935 c!89383) b!824246))

(assert (= (and d!104935 (not c!89383)) b!824254))

(assert (= (and b!824254 c!89380) b!824256))

(assert (= (and b!824254 (not c!89380)) b!824250))

(assert (= (or b!824256 b!824250) bm!35832))

(assert (= (and d!104935 res!561974) b!824248))

(assert (= (and b!824248 res!561977) b!824252))

(assert (= (and b!824252 res!561975) b!824251))

(assert (= (and b!824252 c!89382) b!824253))

(assert (= (and b!824252 (not c!89382)) b!824247))

(assert (= (and b!824253 res!561976) b!824255))

(assert (= (and b!824247 c!89381) b!824257))

(assert (= (and b!824247 (not c!89381)) b!824249))

(declare-fun b_lambda!11079 () Bool)

(assert (=> (not b_lambda!11079) (not b!824255)))

(declare-fun t!22073 () Bool)

(declare-fun tb!4201 () Bool)

(assert (=> (and start!70968 (= defaultEntry!796 defaultEntry!796) t!22073) tb!4201))

(declare-fun result!7943 () Bool)

(assert (=> tb!4201 (= result!7943 tp_is_empty!14895)))

(assert (=> b!824255 t!22073))

(declare-fun b_and!22085 () Bool)

(assert (= b_and!22081 (and (=> t!22073 result!7943) b_and!22085)))

(declare-fun b_lambda!11081 () Bool)

(assert (=> (not b_lambda!11081) (not b!824256)))

(assert (=> b!824256 t!22073))

(declare-fun b_and!22087 () Bool)

(assert (= b_and!22085 (and (=> t!22073 result!7943) b_and!22087)))

(assert (=> b!824255 m!766351))

(assert (=> b!824255 m!766351))

(declare-fun m!766361 () Bool)

(assert (=> b!824255 m!766361))

(declare-fun m!766363 () Bool)

(assert (=> b!824255 m!766363))

(declare-fun m!766365 () Bool)

(assert (=> b!824255 m!766365))

(declare-fun m!766367 () Bool)

(assert (=> b!824255 m!766367))

(assert (=> b!824255 m!766365))

(assert (=> b!824255 m!766363))

(assert (=> b!824253 m!766351))

(assert (=> b!824253 m!766351))

(declare-fun m!766369 () Bool)

(assert (=> b!824253 m!766369))

(declare-fun m!766371 () Bool)

(assert (=> b!824257 m!766371))

(declare-fun m!766373 () Bool)

(assert (=> b!824249 m!766373))

(assert (=> b!824251 m!766351))

(assert (=> b!824251 m!766351))

(assert (=> b!824251 m!766353))

(declare-fun m!766375 () Bool)

(assert (=> b!824248 m!766375))

(declare-fun m!766377 () Bool)

(assert (=> d!104935 m!766377))

(assert (=> d!104935 m!766325))

(assert (=> bm!35832 m!766371))

(assert (=> b!824256 m!766351))

(declare-fun m!766379 () Bool)

(assert (=> b!824256 m!766379))

(assert (=> b!824256 m!766363))

(assert (=> b!824256 m!766365))

(assert (=> b!824256 m!766367))

(assert (=> b!824256 m!766365))

(assert (=> b!824256 m!766363))

(declare-fun m!766381 () Bool)

(assert (=> b!824256 m!766381))

(declare-fun m!766383 () Bool)

(assert (=> b!824256 m!766383))

(assert (=> b!824256 m!766383))

(declare-fun m!766385 () Bool)

(assert (=> b!824256 m!766385))

(assert (=> b!824254 m!766351))

(assert (=> b!824254 m!766351))

(assert (=> b!824254 m!766353))

(assert (=> b!824179 d!104935))

(declare-fun b!824260 () Bool)

(declare-fun e!458557 () ListLongMap!8741)

(assert (=> b!824260 (= e!458557 (ListLongMap!8742 Nil!15726))))

(declare-fun b!824261 () Bool)

(declare-fun e!458554 () Bool)

(declare-fun e!458558 () Bool)

(assert (=> b!824261 (= e!458554 e!458558)))

(declare-fun c!89385 () Bool)

(assert (=> b!824261 (= c!89385 (bvslt #b00000000000000000000000000000000 (size!22458 _keys!976)))))

(declare-fun b!824263 () Bool)

(declare-fun lt!371741 () ListLongMap!8741)

(assert (=> b!824263 (= e!458558 (isEmpty!642 lt!371741))))

(declare-fun b!824264 () Bool)

(declare-fun e!458552 () ListLongMap!8741)

(declare-fun call!35836 () ListLongMap!8741)

(assert (=> b!824264 (= e!458552 call!35836)))

(declare-fun b!824265 () Bool)

(declare-fun e!458555 () Bool)

(assert (=> b!824265 (= e!458555 (validKeyInArray!0 (select (arr!22037 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!824265 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!824266 () Bool)

(declare-fun e!458556 () Bool)

(assert (=> b!824266 (= e!458556 e!458554)))

(declare-fun c!89386 () Bool)

(assert (=> b!824266 (= c!89386 e!458555)))

(declare-fun res!561979 () Bool)

(assert (=> b!824266 (=> (not res!561979) (not e!458555))))

(assert (=> b!824266 (= res!561979 (bvslt #b00000000000000000000000000000000 (size!22458 _keys!976)))))

(declare-fun b!824267 () Bool)

(declare-fun e!458553 () Bool)

(assert (=> b!824267 (= e!458554 e!458553)))

(assert (=> b!824267 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22458 _keys!976)))))

(declare-fun res!561980 () Bool)

(assert (=> b!824267 (= res!561980 (contains!4176 lt!371741 (select (arr!22037 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!824267 (=> (not res!561980) (not e!458553))))

(declare-fun b!824268 () Bool)

(assert (=> b!824268 (= e!458557 e!458552)))

(declare-fun c!89384 () Bool)

(assert (=> b!824268 (= c!89384 (validKeyInArray!0 (select (arr!22037 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!824269 () Bool)

(assert (=> b!824269 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22458 _keys!976)))))

(assert (=> b!824269 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22459 _values!788)))))

(assert (=> b!824269 (= e!458553 (= (apply!360 lt!371741 (select (arr!22037 _keys!976) #b00000000000000000000000000000000)) (get!11701 (select (arr!22038 _values!788) #b00000000000000000000000000000000) (dynLambda!971 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!104937 () Bool)

(assert (=> d!104937 e!458556))

(declare-fun res!561978 () Bool)

(assert (=> d!104937 (=> (not res!561978) (not e!458556))))

(assert (=> d!104937 (= res!561978 (not (contains!4176 lt!371741 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104937 (= lt!371741 e!458557)))

(declare-fun c!89387 () Bool)

(assert (=> d!104937 (= c!89387 (bvsge #b00000000000000000000000000000000 (size!22458 _keys!976)))))

(assert (=> d!104937 (validMask!0 mask!1312)))

(assert (=> d!104937 (= (getCurrentListMapNoExtraKeys!2401 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371741)))

(declare-fun b!824262 () Bool)

(declare-fun res!561981 () Bool)

(assert (=> b!824262 (=> (not res!561981) (not e!458556))))

(assert (=> b!824262 (= res!561981 (not (contains!4176 lt!371741 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!824270 () Bool)

(declare-fun lt!371738 () Unit!28240)

(declare-fun lt!371740 () Unit!28240)

(assert (=> b!824270 (= lt!371738 lt!371740)))

(declare-fun lt!371735 () (_ BitVec 64))

(declare-fun lt!371737 () (_ BitVec 64))

(declare-fun lt!371739 () ListLongMap!8741)

(declare-fun lt!371736 () V!24861)

(assert (=> b!824270 (not (contains!4176 (+!1914 lt!371739 (tuple2!9919 lt!371737 lt!371736)) lt!371735))))

(assert (=> b!824270 (= lt!371740 (addStillNotContains!185 lt!371739 lt!371737 lt!371736 lt!371735))))

(assert (=> b!824270 (= lt!371735 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!824270 (= lt!371736 (get!11701 (select (arr!22038 _values!788) #b00000000000000000000000000000000) (dynLambda!971 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!824270 (= lt!371737 (select (arr!22037 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!824270 (= lt!371739 call!35836)))

(assert (=> b!824270 (= e!458552 (+!1914 call!35836 (tuple2!9919 (select (arr!22037 _keys!976) #b00000000000000000000000000000000) (get!11701 (select (arr!22038 _values!788) #b00000000000000000000000000000000) (dynLambda!971 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!824271 () Bool)

(assert (=> b!824271 (= e!458558 (= lt!371741 (getCurrentListMapNoExtraKeys!2401 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun bm!35833 () Bool)

(assert (=> bm!35833 (= call!35836 (getCurrentListMapNoExtraKeys!2401 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(assert (= (and d!104937 c!89387) b!824260))

(assert (= (and d!104937 (not c!89387)) b!824268))

(assert (= (and b!824268 c!89384) b!824270))

(assert (= (and b!824268 (not c!89384)) b!824264))

(assert (= (or b!824270 b!824264) bm!35833))

(assert (= (and d!104937 res!561978) b!824262))

(assert (= (and b!824262 res!561981) b!824266))

(assert (= (and b!824266 res!561979) b!824265))

(assert (= (and b!824266 c!89386) b!824267))

(assert (= (and b!824266 (not c!89386)) b!824261))

(assert (= (and b!824267 res!561980) b!824269))

(assert (= (and b!824261 c!89385) b!824271))

(assert (= (and b!824261 (not c!89385)) b!824263))

(declare-fun b_lambda!11083 () Bool)

(assert (=> (not b_lambda!11083) (not b!824269)))

(assert (=> b!824269 t!22073))

(declare-fun b_and!22089 () Bool)

(assert (= b_and!22087 (and (=> t!22073 result!7943) b_and!22089)))

(declare-fun b_lambda!11085 () Bool)

(assert (=> (not b_lambda!11085) (not b!824270)))

(assert (=> b!824270 t!22073))

(declare-fun b_and!22091 () Bool)

(assert (= b_and!22089 (and (=> t!22073 result!7943) b_and!22091)))

(assert (=> b!824269 m!766351))

(assert (=> b!824269 m!766351))

(declare-fun m!766387 () Bool)

(assert (=> b!824269 m!766387))

(assert (=> b!824269 m!766363))

(assert (=> b!824269 m!766365))

(assert (=> b!824269 m!766367))

(assert (=> b!824269 m!766365))

(assert (=> b!824269 m!766363))

(assert (=> b!824267 m!766351))

(assert (=> b!824267 m!766351))

(declare-fun m!766389 () Bool)

(assert (=> b!824267 m!766389))

(declare-fun m!766391 () Bool)

(assert (=> b!824271 m!766391))

(declare-fun m!766393 () Bool)

(assert (=> b!824263 m!766393))

(assert (=> b!824265 m!766351))

(assert (=> b!824265 m!766351))

(assert (=> b!824265 m!766353))

(declare-fun m!766395 () Bool)

(assert (=> b!824262 m!766395))

(declare-fun m!766397 () Bool)

(assert (=> d!104937 m!766397))

(assert (=> d!104937 m!766325))

(assert (=> bm!35833 m!766391))

(assert (=> b!824270 m!766351))

(declare-fun m!766399 () Bool)

(assert (=> b!824270 m!766399))

(assert (=> b!824270 m!766363))

(assert (=> b!824270 m!766365))

(assert (=> b!824270 m!766367))

(assert (=> b!824270 m!766365))

(assert (=> b!824270 m!766363))

(declare-fun m!766401 () Bool)

(assert (=> b!824270 m!766401))

(declare-fun m!766403 () Bool)

(assert (=> b!824270 m!766403))

(assert (=> b!824270 m!766403))

(declare-fun m!766405 () Bool)

(assert (=> b!824270 m!766405))

(assert (=> b!824268 m!766351))

(assert (=> b!824268 m!766351))

(assert (=> b!824268 m!766353))

(assert (=> b!824179 d!104937))

(declare-fun bm!35836 () Bool)

(declare-fun call!35839 () Bool)

(assert (=> bm!35836 (= call!35839 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!824280 () Bool)

(declare-fun e!458567 () Bool)

(assert (=> b!824280 (= e!458567 call!35839)))

(declare-fun d!104939 () Bool)

(declare-fun res!561987 () Bool)

(declare-fun e!458565 () Bool)

(assert (=> d!104939 (=> res!561987 e!458565)))

(assert (=> d!104939 (= res!561987 (bvsge #b00000000000000000000000000000000 (size!22458 _keys!976)))))

(assert (=> d!104939 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!458565)))

(declare-fun b!824281 () Bool)

(declare-fun e!458566 () Bool)

(assert (=> b!824281 (= e!458566 e!458567)))

(declare-fun lt!371750 () (_ BitVec 64))

(assert (=> b!824281 (= lt!371750 (select (arr!22037 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371749 () Unit!28240)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45978 (_ BitVec 64) (_ BitVec 32)) Unit!28240)

(assert (=> b!824281 (= lt!371749 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!371750 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45978 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!824281 (arrayContainsKey!0 _keys!976 lt!371750 #b00000000000000000000000000000000)))

(declare-fun lt!371748 () Unit!28240)

(assert (=> b!824281 (= lt!371748 lt!371749)))

(declare-fun res!561986 () Bool)

(declare-datatypes ((SeekEntryResult!8732 0))(
  ( (MissingZero!8732 (index!37299 (_ BitVec 32))) (Found!8732 (index!37300 (_ BitVec 32))) (Intermediate!8732 (undefined!9544 Bool) (index!37301 (_ BitVec 32)) (x!69549 (_ BitVec 32))) (Undefined!8732) (MissingVacant!8732 (index!37302 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45978 (_ BitVec 32)) SeekEntryResult!8732)

(assert (=> b!824281 (= res!561986 (= (seekEntryOrOpen!0 (select (arr!22037 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8732 #b00000000000000000000000000000000)))))

(assert (=> b!824281 (=> (not res!561986) (not e!458567))))

(declare-fun b!824282 () Bool)

(assert (=> b!824282 (= e!458566 call!35839)))

(declare-fun b!824283 () Bool)

(assert (=> b!824283 (= e!458565 e!458566)))

(declare-fun c!89390 () Bool)

(assert (=> b!824283 (= c!89390 (validKeyInArray!0 (select (arr!22037 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104939 (not res!561987)) b!824283))

(assert (= (and b!824283 c!89390) b!824281))

(assert (= (and b!824283 (not c!89390)) b!824282))

(assert (= (and b!824281 res!561986) b!824280))

(assert (= (or b!824280 b!824282) bm!35836))

(declare-fun m!766407 () Bool)

(assert (=> bm!35836 m!766407))

(assert (=> b!824281 m!766351))

(declare-fun m!766409 () Bool)

(assert (=> b!824281 m!766409))

(declare-fun m!766411 () Bool)

(assert (=> b!824281 m!766411))

(assert (=> b!824281 m!766351))

(declare-fun m!766413 () Bool)

(assert (=> b!824281 m!766413))

(assert (=> b!824283 m!766351))

(assert (=> b!824283 m!766351))

(assert (=> b!824283 m!766353))

(assert (=> b!824185 d!104939))

(declare-fun mapIsEmpty!23965 () Bool)

(declare-fun mapRes!23965 () Bool)

(assert (=> mapIsEmpty!23965 mapRes!23965))

(declare-fun b!824290 () Bool)

(declare-fun e!458573 () Bool)

(assert (=> b!824290 (= e!458573 tp_is_empty!14895)))

(declare-fun mapNonEmpty!23965 () Bool)

(declare-fun tp!46315 () Bool)

(assert (=> mapNonEmpty!23965 (= mapRes!23965 (and tp!46315 e!458573))))

(declare-fun mapValue!23965 () ValueCell!7032)

(declare-fun mapRest!23965 () (Array (_ BitVec 32) ValueCell!7032))

(declare-fun mapKey!23965 () (_ BitVec 32))

(assert (=> mapNonEmpty!23965 (= mapRest!23959 (store mapRest!23965 mapKey!23965 mapValue!23965))))

(declare-fun condMapEmpty!23965 () Bool)

(declare-fun mapDefault!23965 () ValueCell!7032)

(assert (=> mapNonEmpty!23959 (= condMapEmpty!23965 (= mapRest!23959 ((as const (Array (_ BitVec 32) ValueCell!7032)) mapDefault!23965)))))

(declare-fun e!458572 () Bool)

(assert (=> mapNonEmpty!23959 (= tp!46305 (and e!458572 mapRes!23965))))

(declare-fun b!824291 () Bool)

(assert (=> b!824291 (= e!458572 tp_is_empty!14895)))

(assert (= (and mapNonEmpty!23959 condMapEmpty!23965) mapIsEmpty!23965))

(assert (= (and mapNonEmpty!23959 (not condMapEmpty!23965)) mapNonEmpty!23965))

(assert (= (and mapNonEmpty!23965 ((_ is ValueCellFull!7032) mapValue!23965)) b!824290))

(assert (= (and mapNonEmpty!23959 ((_ is ValueCellFull!7032) mapDefault!23965)) b!824291))

(declare-fun m!766415 () Bool)

(assert (=> mapNonEmpty!23965 m!766415))

(declare-fun b_lambda!11087 () Bool)

(assert (= b_lambda!11081 (or (and start!70968 b_free!13185) b_lambda!11087)))

(declare-fun b_lambda!11089 () Bool)

(assert (= b_lambda!11085 (or (and start!70968 b_free!13185) b_lambda!11089)))

(declare-fun b_lambda!11091 () Bool)

(assert (= b_lambda!11083 (or (and start!70968 b_free!13185) b_lambda!11091)))

(declare-fun b_lambda!11093 () Bool)

(assert (= b_lambda!11079 (or (and start!70968 b_free!13185) b_lambda!11093)))

(check-sat (not b_lambda!11089) (not bm!35829) (not b_lambda!11087) (not b!824269) (not bm!35836) (not b_next!13185) (not b!824268) (not bm!35832) (not b!824220) (not b!824263) (not b!824271) (not b!824253) (not mapNonEmpty!23965) (not b!824281) (not b_lambda!11093) (not b!824256) (not b_lambda!11091) (not b!824262) (not b!824283) (not b!824218) (not b!824255) (not bm!35833) (not d!104933) (not b!824267) b_and!22091 (not b!824249) (not d!104937) (not b!824265) (not b!824257) (not b!824270) (not d!104935) tp_is_empty!14895 (not b!824254) (not b!824251) (not b!824248) (not b!824217))
(check-sat b_and!22091 (not b_next!13185))
