; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105446 () Bool)

(assert start!105446)

(declare-fun b_free!27105 () Bool)

(declare-fun b_next!27105 () Bool)

(assert (=> start!105446 (= b_free!27105 (not b_next!27105))))

(declare-fun tp!94828 () Bool)

(declare-fun b_and!44951 () Bool)

(assert (=> start!105446 (= tp!94828 b_and!44951)))

(declare-fun res!837550 () Bool)

(declare-fun e!714201 () Bool)

(assert (=> start!105446 (=> (not res!837550) (not e!714201))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105446 (= res!837550 (validMask!0 mask!1466))))

(assert (=> start!105446 e!714201))

(assert (=> start!105446 true))

(assert (=> start!105446 tp!94828))

(declare-fun tp_is_empty!32007 () Bool)

(assert (=> start!105446 tp_is_empty!32007))

(declare-datatypes ((array!81654 0))(
  ( (array!81655 (arr!39386 (Array (_ BitVec 32) (_ BitVec 64))) (size!39922 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81654)

(declare-fun array_inv!30005 (array!81654) Bool)

(assert (=> start!105446 (array_inv!30005 _keys!1118)))

(declare-datatypes ((V!48041 0))(
  ( (V!48042 (val!16066 Int)) )
))
(declare-datatypes ((ValueCell!15240 0))(
  ( (ValueCellFull!15240 (v!18766 V!48041)) (EmptyCell!15240) )
))
(declare-datatypes ((array!81656 0))(
  ( (array!81657 (arr!39387 (Array (_ BitVec 32) ValueCell!15240)) (size!39923 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81656)

(declare-fun e!714203 () Bool)

(declare-fun array_inv!30006 (array!81656) Bool)

(assert (=> start!105446 (and (array_inv!30006 _values!914) e!714203)))

(declare-fun b!1256334 () Bool)

(declare-fun res!837549 () Bool)

(assert (=> b!1256334 (=> (not res!837549) (not e!714201))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1256334 (= res!837549 (and (= (size!39923 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39922 _keys!1118) (size!39923 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256335 () Bool)

(declare-fun res!837546 () Bool)

(assert (=> b!1256335 (=> (not res!837546) (not e!714201))))

(declare-datatypes ((List!27973 0))(
  ( (Nil!27970) (Cons!27969 (h!29178 (_ BitVec 64)) (t!41460 List!27973)) )
))
(declare-fun arrayNoDuplicates!0 (array!81654 (_ BitVec 32) List!27973) Bool)

(assert (=> b!1256335 (= res!837546 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27970))))

(declare-fun b!1256336 () Bool)

(declare-fun e!714202 () Bool)

(assert (=> b!1256336 (= e!714202 tp_is_empty!32007)))

(declare-fun b!1256337 () Bool)

(declare-fun e!714200 () Bool)

(declare-fun mapRes!49795 () Bool)

(assert (=> b!1256337 (= e!714203 (and e!714200 mapRes!49795))))

(declare-fun condMapEmpty!49795 () Bool)

(declare-fun mapDefault!49795 () ValueCell!15240)

(assert (=> b!1256337 (= condMapEmpty!49795 (= (arr!39387 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15240)) mapDefault!49795)))))

(declare-fun b!1256338 () Bool)

(declare-fun res!837547 () Bool)

(assert (=> b!1256338 (=> (not res!837547) (not e!714201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81654 (_ BitVec 32)) Bool)

(assert (=> b!1256338 (= res!837547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256339 () Bool)

(declare-fun e!714197 () Bool)

(declare-fun e!714199 () Bool)

(assert (=> b!1256339 (= e!714197 e!714199)))

(declare-fun res!837548 () Bool)

(assert (=> b!1256339 (=> res!837548 e!714199)))

(declare-datatypes ((tuple2!20756 0))(
  ( (tuple2!20757 (_1!10389 (_ BitVec 64)) (_2!10389 V!48041)) )
))
(declare-datatypes ((List!27974 0))(
  ( (Nil!27971) (Cons!27970 (h!29179 tuple2!20756) (t!41461 List!27974)) )
))
(declare-datatypes ((ListLongMap!18629 0))(
  ( (ListLongMap!18630 (toList!9330 List!27974)) )
))
(declare-fun lt!568061 () ListLongMap!18629)

(declare-fun contains!7547 (ListLongMap!18629 (_ BitVec 64)) Bool)

(assert (=> b!1256339 (= res!837548 (contains!7547 lt!568061 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!48041)

(declare-fun minValueBefore!43 () V!48041)

(declare-fun getCurrentListMap!4553 (array!81654 array!81656 (_ BitVec 32) (_ BitVec 32) V!48041 V!48041 (_ BitVec 32) Int) ListLongMap!18629)

(assert (=> b!1256339 (= lt!568061 (getCurrentListMap!4553 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49795 () Bool)

(declare-fun tp!94829 () Bool)

(assert (=> mapNonEmpty!49795 (= mapRes!49795 (and tp!94829 e!714202))))

(declare-fun mapKey!49795 () (_ BitVec 32))

(declare-fun mapRest!49795 () (Array (_ BitVec 32) ValueCell!15240))

(declare-fun mapValue!49795 () ValueCell!15240)

(assert (=> mapNonEmpty!49795 (= (arr!39387 _values!914) (store mapRest!49795 mapKey!49795 mapValue!49795))))

(declare-fun b!1256340 () Bool)

(assert (=> b!1256340 (= e!714199 (bvsle #b00000000000000000000000000000000 (size!39922 _keys!1118)))))

(declare-fun -!2080 (ListLongMap!18629 (_ BitVec 64)) ListLongMap!18629)

(assert (=> b!1256340 (= (-!2080 lt!568061 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568061)))

(declare-datatypes ((Unit!41842 0))(
  ( (Unit!41843) )
))
(declare-fun lt!568060 () Unit!41842)

(declare-fun removeNotPresentStillSame!133 (ListLongMap!18629 (_ BitVec 64)) Unit!41842)

(assert (=> b!1256340 (= lt!568060 (removeNotPresentStillSame!133 lt!568061 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256341 () Bool)

(assert (=> b!1256341 (= e!714201 (not e!714197))))

(declare-fun res!837551 () Bool)

(assert (=> b!1256341 (=> res!837551 e!714197)))

(assert (=> b!1256341 (= res!837551 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568062 () ListLongMap!18629)

(declare-fun lt!568059 () ListLongMap!18629)

(assert (=> b!1256341 (= lt!568062 lt!568059)))

(declare-fun minValueAfter!43 () V!48041)

(declare-fun lt!568063 () Unit!41842)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1076 (array!81654 array!81656 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48041 V!48041 V!48041 V!48041 (_ BitVec 32) Int) Unit!41842)

(assert (=> b!1256341 (= lt!568063 (lemmaNoChangeToArrayThenSameMapNoExtras!1076 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5712 (array!81654 array!81656 (_ BitVec 32) (_ BitVec 32) V!48041 V!48041 (_ BitVec 32) Int) ListLongMap!18629)

(assert (=> b!1256341 (= lt!568059 (getCurrentListMapNoExtraKeys!5712 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256341 (= lt!568062 (getCurrentListMapNoExtraKeys!5712 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256342 () Bool)

(assert (=> b!1256342 (= e!714200 tp_is_empty!32007)))

(declare-fun mapIsEmpty!49795 () Bool)

(assert (=> mapIsEmpty!49795 mapRes!49795))

(assert (= (and start!105446 res!837550) b!1256334))

(assert (= (and b!1256334 res!837549) b!1256338))

(assert (= (and b!1256338 res!837547) b!1256335))

(assert (= (and b!1256335 res!837546) b!1256341))

(assert (= (and b!1256341 (not res!837551)) b!1256339))

(assert (= (and b!1256339 (not res!837548)) b!1256340))

(assert (= (and b!1256337 condMapEmpty!49795) mapIsEmpty!49795))

(assert (= (and b!1256337 (not condMapEmpty!49795)) mapNonEmpty!49795))

(get-info :version)

(assert (= (and mapNonEmpty!49795 ((_ is ValueCellFull!15240) mapValue!49795)) b!1256336))

(assert (= (and b!1256337 ((_ is ValueCellFull!15240) mapDefault!49795)) b!1256342))

(assert (= start!105446 b!1256337))

(declare-fun m!1157011 () Bool)

(assert (=> b!1256340 m!1157011))

(declare-fun m!1157013 () Bool)

(assert (=> b!1256340 m!1157013))

(declare-fun m!1157015 () Bool)

(assert (=> b!1256339 m!1157015))

(declare-fun m!1157017 () Bool)

(assert (=> b!1256339 m!1157017))

(declare-fun m!1157019 () Bool)

(assert (=> mapNonEmpty!49795 m!1157019))

(declare-fun m!1157021 () Bool)

(assert (=> b!1256335 m!1157021))

(declare-fun m!1157023 () Bool)

(assert (=> b!1256341 m!1157023))

(declare-fun m!1157025 () Bool)

(assert (=> b!1256341 m!1157025))

(declare-fun m!1157027 () Bool)

(assert (=> b!1256341 m!1157027))

(declare-fun m!1157029 () Bool)

(assert (=> b!1256338 m!1157029))

(declare-fun m!1157031 () Bool)

(assert (=> start!105446 m!1157031))

(declare-fun m!1157033 () Bool)

(assert (=> start!105446 m!1157033))

(declare-fun m!1157035 () Bool)

(assert (=> start!105446 m!1157035))

(check-sat (not b!1256335) (not b!1256339) tp_is_empty!32007 b_and!44951 (not start!105446) (not b!1256338) (not b!1256340) (not b_next!27105) (not mapNonEmpty!49795) (not b!1256341))
(check-sat b_and!44951 (not b_next!27105))
(get-model)

(declare-fun d!138185 () Bool)

(assert (=> d!138185 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105446 d!138185))

(declare-fun d!138187 () Bool)

(assert (=> d!138187 (= (array_inv!30005 _keys!1118) (bvsge (size!39922 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105446 d!138187))

(declare-fun d!138189 () Bool)

(assert (=> d!138189 (= (array_inv!30006 _values!914) (bvsge (size!39923 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105446 d!138189))

(declare-fun bm!61777 () Bool)

(declare-fun call!61780 () Bool)

(assert (=> bm!61777 (= call!61780 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun d!138191 () Bool)

(declare-fun res!837574 () Bool)

(declare-fun e!714233 () Bool)

(assert (=> d!138191 (=> res!837574 e!714233)))

(assert (=> d!138191 (= res!837574 (bvsge #b00000000000000000000000000000000 (size!39922 _keys!1118)))))

(assert (=> d!138191 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!714233)))

(declare-fun b!1256378 () Bool)

(declare-fun e!714232 () Bool)

(assert (=> b!1256378 (= e!714232 call!61780)))

(declare-fun b!1256379 () Bool)

(declare-fun e!714231 () Bool)

(assert (=> b!1256379 (= e!714233 e!714231)))

(declare-fun c!122411 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1256379 (= c!122411 (validKeyInArray!0 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1256380 () Bool)

(assert (=> b!1256380 (= e!714231 e!714232)))

(declare-fun lt!568087 () (_ BitVec 64))

(assert (=> b!1256380 (= lt!568087 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!568086 () Unit!41842)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81654 (_ BitVec 64) (_ BitVec 32)) Unit!41842)

(assert (=> b!1256380 (= lt!568086 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!568087 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81654 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1256380 (arrayContainsKey!0 _keys!1118 lt!568087 #b00000000000000000000000000000000)))

(declare-fun lt!568085 () Unit!41842)

(assert (=> b!1256380 (= lt!568085 lt!568086)))

(declare-fun res!837575 () Bool)

(declare-datatypes ((SeekEntryResult!9966 0))(
  ( (MissingZero!9966 (index!42235 (_ BitVec 32))) (Found!9966 (index!42236 (_ BitVec 32))) (Intermediate!9966 (undefined!10778 Bool) (index!42237 (_ BitVec 32)) (x!110633 (_ BitVec 32))) (Undefined!9966) (MissingVacant!9966 (index!42238 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81654 (_ BitVec 32)) SeekEntryResult!9966)

(assert (=> b!1256380 (= res!837575 (= (seekEntryOrOpen!0 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9966 #b00000000000000000000000000000000)))))

(assert (=> b!1256380 (=> (not res!837575) (not e!714232))))

(declare-fun b!1256381 () Bool)

(assert (=> b!1256381 (= e!714231 call!61780)))

(assert (= (and d!138191 (not res!837574)) b!1256379))

(assert (= (and b!1256379 c!122411) b!1256380))

(assert (= (and b!1256379 (not c!122411)) b!1256381))

(assert (= (and b!1256380 res!837575) b!1256378))

(assert (= (or b!1256378 b!1256381) bm!61777))

(declare-fun m!1157063 () Bool)

(assert (=> bm!61777 m!1157063))

(declare-fun m!1157065 () Bool)

(assert (=> b!1256379 m!1157065))

(assert (=> b!1256379 m!1157065))

(declare-fun m!1157067 () Bool)

(assert (=> b!1256379 m!1157067))

(assert (=> b!1256380 m!1157065))

(declare-fun m!1157069 () Bool)

(assert (=> b!1256380 m!1157069))

(declare-fun m!1157071 () Bool)

(assert (=> b!1256380 m!1157071))

(assert (=> b!1256380 m!1157065))

(declare-fun m!1157073 () Bool)

(assert (=> b!1256380 m!1157073))

(assert (=> b!1256338 d!138191))

(declare-fun d!138193 () Bool)

(declare-fun lt!568090 () ListLongMap!18629)

(assert (=> d!138193 (not (contains!7547 lt!568090 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!140 (List!27974 (_ BitVec 64)) List!27974)

(assert (=> d!138193 (= lt!568090 (ListLongMap!18630 (removeStrictlySorted!140 (toList!9330 lt!568061) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138193 (= (-!2080 lt!568061 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568090)))

(declare-fun bs!35519 () Bool)

(assert (= bs!35519 d!138193))

(declare-fun m!1157075 () Bool)

(assert (=> bs!35519 m!1157075))

(declare-fun m!1157077 () Bool)

(assert (=> bs!35519 m!1157077))

(assert (=> b!1256340 d!138193))

(declare-fun d!138195 () Bool)

(assert (=> d!138195 (= (-!2080 lt!568061 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568061)))

(declare-fun lt!568093 () Unit!41842)

(declare-fun choose!1858 (ListLongMap!18629 (_ BitVec 64)) Unit!41842)

(assert (=> d!138195 (= lt!568093 (choose!1858 lt!568061 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138195 (not (contains!7547 lt!568061 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138195 (= (removeNotPresentStillSame!133 lt!568061 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568093)))

(declare-fun bs!35520 () Bool)

(assert (= bs!35520 d!138195))

(assert (=> bs!35520 m!1157011))

(declare-fun m!1157079 () Bool)

(assert (=> bs!35520 m!1157079))

(assert (=> bs!35520 m!1157015))

(assert (=> b!1256340 d!138195))

(declare-fun d!138197 () Bool)

(assert (=> d!138197 (= (getCurrentListMapNoExtraKeys!5712 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5712 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568096 () Unit!41842)

(declare-fun choose!1859 (array!81654 array!81656 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48041 V!48041 V!48041 V!48041 (_ BitVec 32) Int) Unit!41842)

(assert (=> d!138197 (= lt!568096 (choose!1859 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138197 (validMask!0 mask!1466)))

(assert (=> d!138197 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1076 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568096)))

(declare-fun bs!35521 () Bool)

(assert (= bs!35521 d!138197))

(assert (=> bs!35521 m!1157027))

(assert (=> bs!35521 m!1157025))

(declare-fun m!1157081 () Bool)

(assert (=> bs!35521 m!1157081))

(assert (=> bs!35521 m!1157031))

(assert (=> b!1256341 d!138197))

(declare-fun b!1256406 () Bool)

(declare-fun e!714254 () Bool)

(assert (=> b!1256406 (= e!714254 (validKeyInArray!0 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1256406 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1256407 () Bool)

(declare-fun e!714249 () ListLongMap!18629)

(declare-fun call!61783 () ListLongMap!18629)

(assert (=> b!1256407 (= e!714249 call!61783)))

(declare-fun b!1256408 () Bool)

(declare-fun e!714251 () Bool)

(declare-fun e!714250 () Bool)

(assert (=> b!1256408 (= e!714251 e!714250)))

(declare-fun c!122421 () Bool)

(assert (=> b!1256408 (= c!122421 e!714254)))

(declare-fun res!837584 () Bool)

(assert (=> b!1256408 (=> (not res!837584) (not e!714254))))

(assert (=> b!1256408 (= res!837584 (bvslt #b00000000000000000000000000000000 (size!39922 _keys!1118)))))

(declare-fun b!1256409 () Bool)

(declare-fun e!714252 () Bool)

(assert (=> b!1256409 (= e!714250 e!714252)))

(declare-fun c!122423 () Bool)

(assert (=> b!1256409 (= c!122423 (bvslt #b00000000000000000000000000000000 (size!39922 _keys!1118)))))

(declare-fun b!1256410 () Bool)

(declare-fun lt!568111 () Unit!41842)

(declare-fun lt!568114 () Unit!41842)

(assert (=> b!1256410 (= lt!568111 lt!568114)))

(declare-fun lt!568117 () (_ BitVec 64))

(declare-fun lt!568115 () (_ BitVec 64))

(declare-fun lt!568113 () ListLongMap!18629)

(declare-fun lt!568112 () V!48041)

(declare-fun +!4187 (ListLongMap!18629 tuple2!20756) ListLongMap!18629)

(assert (=> b!1256410 (not (contains!7547 (+!4187 lt!568113 (tuple2!20757 lt!568115 lt!568112)) lt!568117))))

(declare-fun addStillNotContains!316 (ListLongMap!18629 (_ BitVec 64) V!48041 (_ BitVec 64)) Unit!41842)

(assert (=> b!1256410 (= lt!568114 (addStillNotContains!316 lt!568113 lt!568115 lt!568112 lt!568117))))

(assert (=> b!1256410 (= lt!568117 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20141 (ValueCell!15240 V!48041) V!48041)

(declare-fun dynLambda!3386 (Int (_ BitVec 64)) V!48041)

(assert (=> b!1256410 (= lt!568112 (get!20141 (select (arr!39387 _values!914) #b00000000000000000000000000000000) (dynLambda!3386 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1256410 (= lt!568115 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1256410 (= lt!568113 call!61783)))

(assert (=> b!1256410 (= e!714249 (+!4187 call!61783 (tuple2!20757 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000) (get!20141 (select (arr!39387 _values!914) #b00000000000000000000000000000000) (dynLambda!3386 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1256412 () Bool)

(declare-fun res!837586 () Bool)

(assert (=> b!1256412 (=> (not res!837586) (not e!714251))))

(declare-fun lt!568116 () ListLongMap!18629)

(assert (=> b!1256412 (= res!837586 (not (contains!7547 lt!568116 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1256413 () Bool)

(assert (=> b!1256413 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39922 _keys!1118)))))

(assert (=> b!1256413 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39923 _values!914)))))

(declare-fun e!714248 () Bool)

(declare-fun apply!988 (ListLongMap!18629 (_ BitVec 64)) V!48041)

(assert (=> b!1256413 (= e!714248 (= (apply!988 lt!568116 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000)) (get!20141 (select (arr!39387 _values!914) #b00000000000000000000000000000000) (dynLambda!3386 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1256414 () Bool)

(declare-fun isEmpty!1030 (ListLongMap!18629) Bool)

(assert (=> b!1256414 (= e!714252 (isEmpty!1030 lt!568116))))

(declare-fun b!1256411 () Bool)

(assert (=> b!1256411 (= e!714252 (= lt!568116 (getCurrentListMapNoExtraKeys!5712 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun d!138199 () Bool)

(assert (=> d!138199 e!714251))

(declare-fun res!837587 () Bool)

(assert (=> d!138199 (=> (not res!837587) (not e!714251))))

(assert (=> d!138199 (= res!837587 (not (contains!7547 lt!568116 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!714253 () ListLongMap!18629)

(assert (=> d!138199 (= lt!568116 e!714253)))

(declare-fun c!122422 () Bool)

(assert (=> d!138199 (= c!122422 (bvsge #b00000000000000000000000000000000 (size!39922 _keys!1118)))))

(assert (=> d!138199 (validMask!0 mask!1466)))

(assert (=> d!138199 (= (getCurrentListMapNoExtraKeys!5712 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568116)))

(declare-fun b!1256415 () Bool)

(assert (=> b!1256415 (= e!714253 e!714249)))

(declare-fun c!122420 () Bool)

(assert (=> b!1256415 (= c!122420 (validKeyInArray!0 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61780 () Bool)

(assert (=> bm!61780 (= call!61783 (getCurrentListMapNoExtraKeys!5712 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1256416 () Bool)

(assert (=> b!1256416 (= e!714250 e!714248)))

(assert (=> b!1256416 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39922 _keys!1118)))))

(declare-fun res!837585 () Bool)

(assert (=> b!1256416 (= res!837585 (contains!7547 lt!568116 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1256416 (=> (not res!837585) (not e!714248))))

(declare-fun b!1256417 () Bool)

(assert (=> b!1256417 (= e!714253 (ListLongMap!18630 Nil!27971))))

(assert (= (and d!138199 c!122422) b!1256417))

(assert (= (and d!138199 (not c!122422)) b!1256415))

(assert (= (and b!1256415 c!122420) b!1256410))

(assert (= (and b!1256415 (not c!122420)) b!1256407))

(assert (= (or b!1256410 b!1256407) bm!61780))

(assert (= (and d!138199 res!837587) b!1256412))

(assert (= (and b!1256412 res!837586) b!1256408))

(assert (= (and b!1256408 res!837584) b!1256406))

(assert (= (and b!1256408 c!122421) b!1256416))

(assert (= (and b!1256408 (not c!122421)) b!1256409))

(assert (= (and b!1256416 res!837585) b!1256413))

(assert (= (and b!1256409 c!122423) b!1256411))

(assert (= (and b!1256409 (not c!122423)) b!1256414))

(declare-fun b_lambda!22667 () Bool)

(assert (=> (not b_lambda!22667) (not b!1256410)))

(declare-fun t!41463 () Bool)

(declare-fun tb!11303 () Bool)

(assert (=> (and start!105446 (= defaultEntry!922 defaultEntry!922) t!41463) tb!11303))

(declare-fun result!23317 () Bool)

(assert (=> tb!11303 (= result!23317 tp_is_empty!32007)))

(assert (=> b!1256410 t!41463))

(declare-fun b_and!44955 () Bool)

(assert (= b_and!44951 (and (=> t!41463 result!23317) b_and!44955)))

(declare-fun b_lambda!22669 () Bool)

(assert (=> (not b_lambda!22669) (not b!1256413)))

(assert (=> b!1256413 t!41463))

(declare-fun b_and!44957 () Bool)

(assert (= b_and!44955 (and (=> t!41463 result!23317) b_and!44957)))

(assert (=> b!1256416 m!1157065))

(assert (=> b!1256416 m!1157065))

(declare-fun m!1157083 () Bool)

(assert (=> b!1256416 m!1157083))

(assert (=> b!1256413 m!1157065))

(declare-fun m!1157085 () Bool)

(assert (=> b!1256413 m!1157085))

(assert (=> b!1256413 m!1157065))

(declare-fun m!1157087 () Bool)

(assert (=> b!1256413 m!1157087))

(declare-fun m!1157089 () Bool)

(assert (=> b!1256413 m!1157089))

(assert (=> b!1256413 m!1157087))

(assert (=> b!1256413 m!1157089))

(declare-fun m!1157091 () Bool)

(assert (=> b!1256413 m!1157091))

(declare-fun m!1157093 () Bool)

(assert (=> b!1256410 m!1157093))

(assert (=> b!1256410 m!1157065))

(declare-fun m!1157095 () Bool)

(assert (=> b!1256410 m!1157095))

(declare-fun m!1157097 () Bool)

(assert (=> b!1256410 m!1157097))

(assert (=> b!1256410 m!1157087))

(assert (=> b!1256410 m!1157089))

(declare-fun m!1157099 () Bool)

(assert (=> b!1256410 m!1157099))

(assert (=> b!1256410 m!1157087))

(assert (=> b!1256410 m!1157089))

(assert (=> b!1256410 m!1157091))

(assert (=> b!1256410 m!1157095))

(declare-fun m!1157101 () Bool)

(assert (=> b!1256414 m!1157101))

(declare-fun m!1157103 () Bool)

(assert (=> d!138199 m!1157103))

(assert (=> d!138199 m!1157031))

(assert (=> b!1256415 m!1157065))

(assert (=> b!1256415 m!1157065))

(assert (=> b!1256415 m!1157067))

(declare-fun m!1157105 () Bool)

(assert (=> bm!61780 m!1157105))

(declare-fun m!1157107 () Bool)

(assert (=> b!1256412 m!1157107))

(assert (=> b!1256406 m!1157065))

(assert (=> b!1256406 m!1157065))

(assert (=> b!1256406 m!1157067))

(assert (=> b!1256411 m!1157105))

(assert (=> b!1256341 d!138199))

(declare-fun b!1256420 () Bool)

(declare-fun e!714261 () Bool)

(assert (=> b!1256420 (= e!714261 (validKeyInArray!0 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1256420 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1256421 () Bool)

(declare-fun e!714256 () ListLongMap!18629)

(declare-fun call!61784 () ListLongMap!18629)

(assert (=> b!1256421 (= e!714256 call!61784)))

(declare-fun b!1256422 () Bool)

(declare-fun e!714258 () Bool)

(declare-fun e!714257 () Bool)

(assert (=> b!1256422 (= e!714258 e!714257)))

(declare-fun c!122425 () Bool)

(assert (=> b!1256422 (= c!122425 e!714261)))

(declare-fun res!837588 () Bool)

(assert (=> b!1256422 (=> (not res!837588) (not e!714261))))

(assert (=> b!1256422 (= res!837588 (bvslt #b00000000000000000000000000000000 (size!39922 _keys!1118)))))

(declare-fun b!1256423 () Bool)

(declare-fun e!714259 () Bool)

(assert (=> b!1256423 (= e!714257 e!714259)))

(declare-fun c!122427 () Bool)

(assert (=> b!1256423 (= c!122427 (bvslt #b00000000000000000000000000000000 (size!39922 _keys!1118)))))

(declare-fun b!1256424 () Bool)

(declare-fun lt!568118 () Unit!41842)

(declare-fun lt!568121 () Unit!41842)

(assert (=> b!1256424 (= lt!568118 lt!568121)))

(declare-fun lt!568124 () (_ BitVec 64))

(declare-fun lt!568120 () ListLongMap!18629)

(declare-fun lt!568122 () (_ BitVec 64))

(declare-fun lt!568119 () V!48041)

(assert (=> b!1256424 (not (contains!7547 (+!4187 lt!568120 (tuple2!20757 lt!568122 lt!568119)) lt!568124))))

(assert (=> b!1256424 (= lt!568121 (addStillNotContains!316 lt!568120 lt!568122 lt!568119 lt!568124))))

(assert (=> b!1256424 (= lt!568124 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1256424 (= lt!568119 (get!20141 (select (arr!39387 _values!914) #b00000000000000000000000000000000) (dynLambda!3386 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1256424 (= lt!568122 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1256424 (= lt!568120 call!61784)))

(assert (=> b!1256424 (= e!714256 (+!4187 call!61784 (tuple2!20757 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000) (get!20141 (select (arr!39387 _values!914) #b00000000000000000000000000000000) (dynLambda!3386 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1256426 () Bool)

(declare-fun res!837590 () Bool)

(assert (=> b!1256426 (=> (not res!837590) (not e!714258))))

(declare-fun lt!568123 () ListLongMap!18629)

(assert (=> b!1256426 (= res!837590 (not (contains!7547 lt!568123 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1256427 () Bool)

(assert (=> b!1256427 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39922 _keys!1118)))))

(assert (=> b!1256427 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39923 _values!914)))))

(declare-fun e!714255 () Bool)

(assert (=> b!1256427 (= e!714255 (= (apply!988 lt!568123 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000)) (get!20141 (select (arr!39387 _values!914) #b00000000000000000000000000000000) (dynLambda!3386 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1256428 () Bool)

(assert (=> b!1256428 (= e!714259 (isEmpty!1030 lt!568123))))

(declare-fun b!1256425 () Bool)

(assert (=> b!1256425 (= e!714259 (= lt!568123 (getCurrentListMapNoExtraKeys!5712 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun d!138201 () Bool)

(assert (=> d!138201 e!714258))

(declare-fun res!837591 () Bool)

(assert (=> d!138201 (=> (not res!837591) (not e!714258))))

(assert (=> d!138201 (= res!837591 (not (contains!7547 lt!568123 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!714260 () ListLongMap!18629)

(assert (=> d!138201 (= lt!568123 e!714260)))

(declare-fun c!122426 () Bool)

(assert (=> d!138201 (= c!122426 (bvsge #b00000000000000000000000000000000 (size!39922 _keys!1118)))))

(assert (=> d!138201 (validMask!0 mask!1466)))

(assert (=> d!138201 (= (getCurrentListMapNoExtraKeys!5712 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568123)))

(declare-fun b!1256429 () Bool)

(assert (=> b!1256429 (= e!714260 e!714256)))

(declare-fun c!122424 () Bool)

(assert (=> b!1256429 (= c!122424 (validKeyInArray!0 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61781 () Bool)

(assert (=> bm!61781 (= call!61784 (getCurrentListMapNoExtraKeys!5712 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1256430 () Bool)

(assert (=> b!1256430 (= e!714257 e!714255)))

(assert (=> b!1256430 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39922 _keys!1118)))))

(declare-fun res!837589 () Bool)

(assert (=> b!1256430 (= res!837589 (contains!7547 lt!568123 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1256430 (=> (not res!837589) (not e!714255))))

(declare-fun b!1256431 () Bool)

(assert (=> b!1256431 (= e!714260 (ListLongMap!18630 Nil!27971))))

(assert (= (and d!138201 c!122426) b!1256431))

(assert (= (and d!138201 (not c!122426)) b!1256429))

(assert (= (and b!1256429 c!122424) b!1256424))

(assert (= (and b!1256429 (not c!122424)) b!1256421))

(assert (= (or b!1256424 b!1256421) bm!61781))

(assert (= (and d!138201 res!837591) b!1256426))

(assert (= (and b!1256426 res!837590) b!1256422))

(assert (= (and b!1256422 res!837588) b!1256420))

(assert (= (and b!1256422 c!122425) b!1256430))

(assert (= (and b!1256422 (not c!122425)) b!1256423))

(assert (= (and b!1256430 res!837589) b!1256427))

(assert (= (and b!1256423 c!122427) b!1256425))

(assert (= (and b!1256423 (not c!122427)) b!1256428))

(declare-fun b_lambda!22671 () Bool)

(assert (=> (not b_lambda!22671) (not b!1256424)))

(assert (=> b!1256424 t!41463))

(declare-fun b_and!44959 () Bool)

(assert (= b_and!44957 (and (=> t!41463 result!23317) b_and!44959)))

(declare-fun b_lambda!22673 () Bool)

(assert (=> (not b_lambda!22673) (not b!1256427)))

(assert (=> b!1256427 t!41463))

(declare-fun b_and!44961 () Bool)

(assert (= b_and!44959 (and (=> t!41463 result!23317) b_and!44961)))

(assert (=> b!1256430 m!1157065))

(assert (=> b!1256430 m!1157065))

(declare-fun m!1157109 () Bool)

(assert (=> b!1256430 m!1157109))

(assert (=> b!1256427 m!1157065))

(declare-fun m!1157111 () Bool)

(assert (=> b!1256427 m!1157111))

(assert (=> b!1256427 m!1157065))

(assert (=> b!1256427 m!1157087))

(assert (=> b!1256427 m!1157089))

(assert (=> b!1256427 m!1157087))

(assert (=> b!1256427 m!1157089))

(assert (=> b!1256427 m!1157091))

(declare-fun m!1157113 () Bool)

(assert (=> b!1256424 m!1157113))

(assert (=> b!1256424 m!1157065))

(declare-fun m!1157115 () Bool)

(assert (=> b!1256424 m!1157115))

(declare-fun m!1157117 () Bool)

(assert (=> b!1256424 m!1157117))

(assert (=> b!1256424 m!1157087))

(assert (=> b!1256424 m!1157089))

(declare-fun m!1157119 () Bool)

(assert (=> b!1256424 m!1157119))

(assert (=> b!1256424 m!1157087))

(assert (=> b!1256424 m!1157089))

(assert (=> b!1256424 m!1157091))

(assert (=> b!1256424 m!1157115))

(declare-fun m!1157121 () Bool)

(assert (=> b!1256428 m!1157121))

(declare-fun m!1157123 () Bool)

(assert (=> d!138201 m!1157123))

(assert (=> d!138201 m!1157031))

(assert (=> b!1256429 m!1157065))

(assert (=> b!1256429 m!1157065))

(assert (=> b!1256429 m!1157067))

(declare-fun m!1157125 () Bool)

(assert (=> bm!61781 m!1157125))

(declare-fun m!1157127 () Bool)

(assert (=> b!1256426 m!1157127))

(assert (=> b!1256420 m!1157065))

(assert (=> b!1256420 m!1157065))

(assert (=> b!1256420 m!1157067))

(assert (=> b!1256425 m!1157125))

(assert (=> b!1256341 d!138201))

(declare-fun b!1256442 () Bool)

(declare-fun e!714271 () Bool)

(declare-fun call!61787 () Bool)

(assert (=> b!1256442 (= e!714271 call!61787)))

(declare-fun d!138203 () Bool)

(declare-fun res!837598 () Bool)

(declare-fun e!714273 () Bool)

(assert (=> d!138203 (=> res!837598 e!714273)))

(assert (=> d!138203 (= res!837598 (bvsge #b00000000000000000000000000000000 (size!39922 _keys!1118)))))

(assert (=> d!138203 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27970) e!714273)))

(declare-fun b!1256443 () Bool)

(assert (=> b!1256443 (= e!714271 call!61787)))

(declare-fun bm!61784 () Bool)

(declare-fun c!122430 () Bool)

(assert (=> bm!61784 (= call!61787 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122430 (Cons!27969 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000) Nil!27970) Nil!27970)))))

(declare-fun b!1256444 () Bool)

(declare-fun e!714270 () Bool)

(assert (=> b!1256444 (= e!714273 e!714270)))

(declare-fun res!837600 () Bool)

(assert (=> b!1256444 (=> (not res!837600) (not e!714270))))

(declare-fun e!714272 () Bool)

(assert (=> b!1256444 (= res!837600 (not e!714272))))

(declare-fun res!837599 () Bool)

(assert (=> b!1256444 (=> (not res!837599) (not e!714272))))

(assert (=> b!1256444 (= res!837599 (validKeyInArray!0 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1256445 () Bool)

(assert (=> b!1256445 (= e!714270 e!714271)))

(assert (=> b!1256445 (= c!122430 (validKeyInArray!0 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1256446 () Bool)

(declare-fun contains!7548 (List!27973 (_ BitVec 64)) Bool)

(assert (=> b!1256446 (= e!714272 (contains!7548 Nil!27970 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138203 (not res!837598)) b!1256444))

(assert (= (and b!1256444 res!837599) b!1256446))

(assert (= (and b!1256444 res!837600) b!1256445))

(assert (= (and b!1256445 c!122430) b!1256443))

(assert (= (and b!1256445 (not c!122430)) b!1256442))

(assert (= (or b!1256443 b!1256442) bm!61784))

(assert (=> bm!61784 m!1157065))

(declare-fun m!1157129 () Bool)

(assert (=> bm!61784 m!1157129))

(assert (=> b!1256444 m!1157065))

(assert (=> b!1256444 m!1157065))

(assert (=> b!1256444 m!1157067))

(assert (=> b!1256445 m!1157065))

(assert (=> b!1256445 m!1157065))

(assert (=> b!1256445 m!1157067))

(assert (=> b!1256446 m!1157065))

(assert (=> b!1256446 m!1157065))

(declare-fun m!1157131 () Bool)

(assert (=> b!1256446 m!1157131))

(assert (=> b!1256335 d!138203))

(declare-fun d!138205 () Bool)

(declare-fun e!714278 () Bool)

(assert (=> d!138205 e!714278))

(declare-fun res!837603 () Bool)

(assert (=> d!138205 (=> res!837603 e!714278)))

(declare-fun lt!568136 () Bool)

(assert (=> d!138205 (= res!837603 (not lt!568136))))

(declare-fun lt!568134 () Bool)

(assert (=> d!138205 (= lt!568136 lt!568134)))

(declare-fun lt!568135 () Unit!41842)

(declare-fun e!714279 () Unit!41842)

(assert (=> d!138205 (= lt!568135 e!714279)))

(declare-fun c!122433 () Bool)

(assert (=> d!138205 (= c!122433 lt!568134)))

(declare-fun containsKey!620 (List!27974 (_ BitVec 64)) Bool)

(assert (=> d!138205 (= lt!568134 (containsKey!620 (toList!9330 lt!568061) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138205 (= (contains!7547 lt!568061 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568136)))

(declare-fun b!1256453 () Bool)

(declare-fun lt!568133 () Unit!41842)

(assert (=> b!1256453 (= e!714279 lt!568133)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!429 (List!27974 (_ BitVec 64)) Unit!41842)

(assert (=> b!1256453 (= lt!568133 (lemmaContainsKeyImpliesGetValueByKeyDefined!429 (toList!9330 lt!568061) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!707 0))(
  ( (Some!706 (v!18768 V!48041)) (None!705) )
))
(declare-fun isDefined!468 (Option!707) Bool)

(declare-fun getValueByKey!656 (List!27974 (_ BitVec 64)) Option!707)

(assert (=> b!1256453 (isDefined!468 (getValueByKey!656 (toList!9330 lt!568061) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256454 () Bool)

(declare-fun Unit!41844 () Unit!41842)

(assert (=> b!1256454 (= e!714279 Unit!41844)))

(declare-fun b!1256455 () Bool)

(assert (=> b!1256455 (= e!714278 (isDefined!468 (getValueByKey!656 (toList!9330 lt!568061) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!138205 c!122433) b!1256453))

(assert (= (and d!138205 (not c!122433)) b!1256454))

(assert (= (and d!138205 (not res!837603)) b!1256455))

(declare-fun m!1157133 () Bool)

(assert (=> d!138205 m!1157133))

(declare-fun m!1157135 () Bool)

(assert (=> b!1256453 m!1157135))

(declare-fun m!1157137 () Bool)

(assert (=> b!1256453 m!1157137))

(assert (=> b!1256453 m!1157137))

(declare-fun m!1157139 () Bool)

(assert (=> b!1256453 m!1157139))

(assert (=> b!1256455 m!1157137))

(assert (=> b!1256455 m!1157137))

(assert (=> b!1256455 m!1157139))

(assert (=> b!1256339 d!138205))

(declare-fun b!1256498 () Bool)

(declare-fun e!714306 () ListLongMap!18629)

(declare-fun call!61803 () ListLongMap!18629)

(assert (=> b!1256498 (= e!714306 call!61803)))

(declare-fun bm!61799 () Bool)

(declare-fun call!61805 () ListLongMap!18629)

(declare-fun call!61808 () ListLongMap!18629)

(assert (=> bm!61799 (= call!61805 call!61808)))

(declare-fun b!1256499 () Bool)

(declare-fun e!714308 () Bool)

(assert (=> b!1256499 (= e!714308 (validKeyInArray!0 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1256500 () Bool)

(declare-fun e!714314 () Unit!41842)

(declare-fun Unit!41845 () Unit!41842)

(assert (=> b!1256500 (= e!714314 Unit!41845)))

(declare-fun b!1256501 () Bool)

(declare-fun c!122450 () Bool)

(assert (=> b!1256501 (= c!122450 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!714309 () ListLongMap!18629)

(assert (=> b!1256501 (= e!714309 e!714306)))

(declare-fun b!1256502 () Bool)

(declare-fun e!714307 () Bool)

(declare-fun e!714315 () Bool)

(assert (=> b!1256502 (= e!714307 e!714315)))

(declare-fun c!122446 () Bool)

(assert (=> b!1256502 (= c!122446 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256503 () Bool)

(declare-fun e!714318 () Bool)

(declare-fun lt!568199 () ListLongMap!18629)

(assert (=> b!1256503 (= e!714318 (= (apply!988 lt!568199 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1256504 () Bool)

(assert (=> b!1256504 (= e!714309 call!61803)))

(declare-fun b!1256505 () Bool)

(declare-fun e!714310 () Bool)

(assert (=> b!1256505 (= e!714310 (= (apply!988 lt!568199 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun bm!61800 () Bool)

(declare-fun call!61807 () ListLongMap!18629)

(assert (=> bm!61800 (= call!61807 (getCurrentListMapNoExtraKeys!5712 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256506 () Bool)

(declare-fun e!714316 () Bool)

(assert (=> b!1256506 (= e!714316 e!714310)))

(declare-fun res!837627 () Bool)

(declare-fun call!61802 () Bool)

(assert (=> b!1256506 (= res!837627 call!61802)))

(assert (=> b!1256506 (=> (not res!837627) (not e!714310))))

(declare-fun b!1256507 () Bool)

(declare-fun call!61804 () Bool)

(assert (=> b!1256507 (= e!714315 (not call!61804))))

(declare-fun b!1256508 () Bool)

(declare-fun e!714313 () ListLongMap!18629)

(declare-fun call!61806 () ListLongMap!18629)

(assert (=> b!1256508 (= e!714313 (+!4187 call!61806 (tuple2!20757 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun c!122449 () Bool)

(declare-fun bm!61801 () Bool)

(declare-fun c!122447 () Bool)

(assert (=> bm!61801 (= call!61806 (+!4187 (ite c!122449 call!61807 (ite c!122447 call!61808 call!61805)) (ite (or c!122449 c!122447) (tuple2!20757 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20757 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun d!138207 () Bool)

(assert (=> d!138207 e!714307))

(declare-fun res!837622 () Bool)

(assert (=> d!138207 (=> (not res!837622) (not e!714307))))

(assert (=> d!138207 (= res!837622 (or (bvsge #b00000000000000000000000000000000 (size!39922 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39922 _keys!1118)))))))

(declare-fun lt!568194 () ListLongMap!18629)

(assert (=> d!138207 (= lt!568199 lt!568194)))

(declare-fun lt!568191 () Unit!41842)

(assert (=> d!138207 (= lt!568191 e!714314)))

(declare-fun c!122448 () Bool)

(declare-fun e!714317 () Bool)

(assert (=> d!138207 (= c!122448 e!714317)))

(declare-fun res!837625 () Bool)

(assert (=> d!138207 (=> (not res!837625) (not e!714317))))

(assert (=> d!138207 (= res!837625 (bvslt #b00000000000000000000000000000000 (size!39922 _keys!1118)))))

(assert (=> d!138207 (= lt!568194 e!714313)))

(assert (=> d!138207 (= c!122449 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138207 (validMask!0 mask!1466)))

(assert (=> d!138207 (= (getCurrentListMap!4553 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568199)))

(declare-fun bm!61802 () Bool)

(assert (=> bm!61802 (= call!61808 call!61807)))

(declare-fun bm!61803 () Bool)

(assert (=> bm!61803 (= call!61804 (contains!7547 lt!568199 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!61804 () Bool)

(assert (=> bm!61804 (= call!61803 call!61806)))

(declare-fun b!1256509 () Bool)

(assert (=> b!1256509 (= e!714313 e!714309)))

(assert (=> b!1256509 (= c!122447 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256510 () Bool)

(assert (=> b!1256510 (= e!714306 call!61805)))

(declare-fun b!1256511 () Bool)

(assert (=> b!1256511 (= e!714316 (not call!61802))))

(declare-fun b!1256512 () Bool)

(assert (=> b!1256512 (= e!714315 e!714318)))

(declare-fun res!837629 () Bool)

(assert (=> b!1256512 (= res!837629 call!61804)))

(assert (=> b!1256512 (=> (not res!837629) (not e!714318))))

(declare-fun e!714312 () Bool)

(declare-fun b!1256513 () Bool)

(assert (=> b!1256513 (= e!714312 (= (apply!988 lt!568199 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000)) (get!20141 (select (arr!39387 _values!914) #b00000000000000000000000000000000) (dynLambda!3386 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1256513 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39923 _values!914)))))

(assert (=> b!1256513 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39922 _keys!1118)))))

(declare-fun b!1256514 () Bool)

(declare-fun e!714311 () Bool)

(assert (=> b!1256514 (= e!714311 e!714312)))

(declare-fun res!837630 () Bool)

(assert (=> b!1256514 (=> (not res!837630) (not e!714312))))

(assert (=> b!1256514 (= res!837630 (contains!7547 lt!568199 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1256514 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39922 _keys!1118)))))

(declare-fun b!1256515 () Bool)

(declare-fun res!837626 () Bool)

(assert (=> b!1256515 (=> (not res!837626) (not e!714307))))

(assert (=> b!1256515 (= res!837626 e!714311)))

(declare-fun res!837624 () Bool)

(assert (=> b!1256515 (=> res!837624 e!714311)))

(assert (=> b!1256515 (= res!837624 (not e!714308))))

(declare-fun res!837623 () Bool)

(assert (=> b!1256515 (=> (not res!837623) (not e!714308))))

(assert (=> b!1256515 (= res!837623 (bvslt #b00000000000000000000000000000000 (size!39922 _keys!1118)))))

(declare-fun b!1256516 () Bool)

(declare-fun lt!568201 () Unit!41842)

(assert (=> b!1256516 (= e!714314 lt!568201)))

(declare-fun lt!568182 () ListLongMap!18629)

(assert (=> b!1256516 (= lt!568182 (getCurrentListMapNoExtraKeys!5712 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568183 () (_ BitVec 64))

(assert (=> b!1256516 (= lt!568183 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!568193 () (_ BitVec 64))

(assert (=> b!1256516 (= lt!568193 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!568202 () Unit!41842)

(declare-fun addStillContains!1080 (ListLongMap!18629 (_ BitVec 64) V!48041 (_ BitVec 64)) Unit!41842)

(assert (=> b!1256516 (= lt!568202 (addStillContains!1080 lt!568182 lt!568183 zeroValue!871 lt!568193))))

(assert (=> b!1256516 (contains!7547 (+!4187 lt!568182 (tuple2!20757 lt!568183 zeroValue!871)) lt!568193)))

(declare-fun lt!568187 () Unit!41842)

(assert (=> b!1256516 (= lt!568187 lt!568202)))

(declare-fun lt!568184 () ListLongMap!18629)

(assert (=> b!1256516 (= lt!568184 (getCurrentListMapNoExtraKeys!5712 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568185 () (_ BitVec 64))

(assert (=> b!1256516 (= lt!568185 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!568192 () (_ BitVec 64))

(assert (=> b!1256516 (= lt!568192 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!568186 () Unit!41842)

(declare-fun addApplyDifferent!534 (ListLongMap!18629 (_ BitVec 64) V!48041 (_ BitVec 64)) Unit!41842)

(assert (=> b!1256516 (= lt!568186 (addApplyDifferent!534 lt!568184 lt!568185 minValueBefore!43 lt!568192))))

(assert (=> b!1256516 (= (apply!988 (+!4187 lt!568184 (tuple2!20757 lt!568185 minValueBefore!43)) lt!568192) (apply!988 lt!568184 lt!568192))))

(declare-fun lt!568198 () Unit!41842)

(assert (=> b!1256516 (= lt!568198 lt!568186)))

(declare-fun lt!568197 () ListLongMap!18629)

(assert (=> b!1256516 (= lt!568197 (getCurrentListMapNoExtraKeys!5712 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568189 () (_ BitVec 64))

(assert (=> b!1256516 (= lt!568189 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!568188 () (_ BitVec 64))

(assert (=> b!1256516 (= lt!568188 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!568195 () Unit!41842)

(assert (=> b!1256516 (= lt!568195 (addApplyDifferent!534 lt!568197 lt!568189 zeroValue!871 lt!568188))))

(assert (=> b!1256516 (= (apply!988 (+!4187 lt!568197 (tuple2!20757 lt!568189 zeroValue!871)) lt!568188) (apply!988 lt!568197 lt!568188))))

(declare-fun lt!568181 () Unit!41842)

(assert (=> b!1256516 (= lt!568181 lt!568195)))

(declare-fun lt!568200 () ListLongMap!18629)

(assert (=> b!1256516 (= lt!568200 (getCurrentListMapNoExtraKeys!5712 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568196 () (_ BitVec 64))

(assert (=> b!1256516 (= lt!568196 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!568190 () (_ BitVec 64))

(assert (=> b!1256516 (= lt!568190 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1256516 (= lt!568201 (addApplyDifferent!534 lt!568200 lt!568196 minValueBefore!43 lt!568190))))

(assert (=> b!1256516 (= (apply!988 (+!4187 lt!568200 (tuple2!20757 lt!568196 minValueBefore!43)) lt!568190) (apply!988 lt!568200 lt!568190))))

(declare-fun b!1256517 () Bool)

(declare-fun res!837628 () Bool)

(assert (=> b!1256517 (=> (not res!837628) (not e!714307))))

(assert (=> b!1256517 (= res!837628 e!714316)))

(declare-fun c!122451 () Bool)

(assert (=> b!1256517 (= c!122451 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!61805 () Bool)

(assert (=> bm!61805 (= call!61802 (contains!7547 lt!568199 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256518 () Bool)

(assert (=> b!1256518 (= e!714317 (validKeyInArray!0 (select (arr!39386 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138207 c!122449) b!1256508))

(assert (= (and d!138207 (not c!122449)) b!1256509))

(assert (= (and b!1256509 c!122447) b!1256504))

(assert (= (and b!1256509 (not c!122447)) b!1256501))

(assert (= (and b!1256501 c!122450) b!1256498))

(assert (= (and b!1256501 (not c!122450)) b!1256510))

(assert (= (or b!1256498 b!1256510) bm!61799))

(assert (= (or b!1256504 bm!61799) bm!61802))

(assert (= (or b!1256504 b!1256498) bm!61804))

(assert (= (or b!1256508 bm!61802) bm!61800))

(assert (= (or b!1256508 bm!61804) bm!61801))

(assert (= (and d!138207 res!837625) b!1256518))

(assert (= (and d!138207 c!122448) b!1256516))

(assert (= (and d!138207 (not c!122448)) b!1256500))

(assert (= (and d!138207 res!837622) b!1256515))

(assert (= (and b!1256515 res!837623) b!1256499))

(assert (= (and b!1256515 (not res!837624)) b!1256514))

(assert (= (and b!1256514 res!837630) b!1256513))

(assert (= (and b!1256515 res!837626) b!1256517))

(assert (= (and b!1256517 c!122451) b!1256506))

(assert (= (and b!1256517 (not c!122451)) b!1256511))

(assert (= (and b!1256506 res!837627) b!1256505))

(assert (= (or b!1256506 b!1256511) bm!61805))

(assert (= (and b!1256517 res!837628) b!1256502))

(assert (= (and b!1256502 c!122446) b!1256512))

(assert (= (and b!1256502 (not c!122446)) b!1256507))

(assert (= (and b!1256512 res!837629) b!1256503))

(assert (= (or b!1256512 b!1256507) bm!61803))

(declare-fun b_lambda!22675 () Bool)

(assert (=> (not b_lambda!22675) (not b!1256513)))

(assert (=> b!1256513 t!41463))

(declare-fun b_and!44963 () Bool)

(assert (= b_and!44961 (and (=> t!41463 result!23317) b_and!44963)))

(declare-fun m!1157141 () Bool)

(assert (=> b!1256503 m!1157141))

(declare-fun m!1157143 () Bool)

(assert (=> bm!61805 m!1157143))

(declare-fun m!1157145 () Bool)

(assert (=> b!1256505 m!1157145))

(assert (=> b!1256513 m!1157065))

(declare-fun m!1157147 () Bool)

(assert (=> b!1256513 m!1157147))

(assert (=> b!1256513 m!1157087))

(assert (=> b!1256513 m!1157089))

(assert (=> b!1256513 m!1157091))

(assert (=> b!1256513 m!1157089))

(assert (=> b!1256513 m!1157065))

(assert (=> b!1256513 m!1157087))

(assert (=> b!1256518 m!1157065))

(assert (=> b!1256518 m!1157065))

(assert (=> b!1256518 m!1157067))

(declare-fun m!1157149 () Bool)

(assert (=> bm!61803 m!1157149))

(declare-fun m!1157151 () Bool)

(assert (=> b!1256516 m!1157151))

(declare-fun m!1157153 () Bool)

(assert (=> b!1256516 m!1157153))

(declare-fun m!1157155 () Bool)

(assert (=> b!1256516 m!1157155))

(declare-fun m!1157157 () Bool)

(assert (=> b!1256516 m!1157157))

(declare-fun m!1157159 () Bool)

(assert (=> b!1256516 m!1157159))

(declare-fun m!1157161 () Bool)

(assert (=> b!1256516 m!1157161))

(declare-fun m!1157163 () Bool)

(assert (=> b!1256516 m!1157163))

(declare-fun m!1157165 () Bool)

(assert (=> b!1256516 m!1157165))

(assert (=> b!1256516 m!1157165))

(declare-fun m!1157167 () Bool)

(assert (=> b!1256516 m!1157167))

(assert (=> b!1256516 m!1157065))

(assert (=> b!1256516 m!1157159))

(declare-fun m!1157169 () Bool)

(assert (=> b!1256516 m!1157169))

(declare-fun m!1157171 () Bool)

(assert (=> b!1256516 m!1157171))

(declare-fun m!1157173 () Bool)

(assert (=> b!1256516 m!1157173))

(assert (=> b!1256516 m!1157027))

(declare-fun m!1157175 () Bool)

(assert (=> b!1256516 m!1157175))

(declare-fun m!1157177 () Bool)

(assert (=> b!1256516 m!1157177))

(assert (=> b!1256516 m!1157151))

(declare-fun m!1157179 () Bool)

(assert (=> b!1256516 m!1157179))

(assert (=> b!1256516 m!1157171))

(assert (=> b!1256514 m!1157065))

(assert (=> b!1256514 m!1157065))

(declare-fun m!1157181 () Bool)

(assert (=> b!1256514 m!1157181))

(assert (=> d!138207 m!1157031))

(assert (=> b!1256499 m!1157065))

(assert (=> b!1256499 m!1157065))

(assert (=> b!1256499 m!1157067))

(declare-fun m!1157183 () Bool)

(assert (=> b!1256508 m!1157183))

(declare-fun m!1157185 () Bool)

(assert (=> bm!61801 m!1157185))

(assert (=> bm!61800 m!1157027))

(assert (=> b!1256339 d!138207))

(declare-fun condMapEmpty!49801 () Bool)

(declare-fun mapDefault!49801 () ValueCell!15240)

(assert (=> mapNonEmpty!49795 (= condMapEmpty!49801 (= mapRest!49795 ((as const (Array (_ BitVec 32) ValueCell!15240)) mapDefault!49801)))))

(declare-fun e!714323 () Bool)

(declare-fun mapRes!49801 () Bool)

(assert (=> mapNonEmpty!49795 (= tp!94829 (and e!714323 mapRes!49801))))

(declare-fun b!1256526 () Bool)

(assert (=> b!1256526 (= e!714323 tp_is_empty!32007)))

(declare-fun mapIsEmpty!49801 () Bool)

(assert (=> mapIsEmpty!49801 mapRes!49801))

(declare-fun b!1256525 () Bool)

(declare-fun e!714324 () Bool)

(assert (=> b!1256525 (= e!714324 tp_is_empty!32007)))

(declare-fun mapNonEmpty!49801 () Bool)

(declare-fun tp!94838 () Bool)

(assert (=> mapNonEmpty!49801 (= mapRes!49801 (and tp!94838 e!714324))))

(declare-fun mapRest!49801 () (Array (_ BitVec 32) ValueCell!15240))

(declare-fun mapValue!49801 () ValueCell!15240)

(declare-fun mapKey!49801 () (_ BitVec 32))

(assert (=> mapNonEmpty!49801 (= mapRest!49795 (store mapRest!49801 mapKey!49801 mapValue!49801))))

(assert (= (and mapNonEmpty!49795 condMapEmpty!49801) mapIsEmpty!49801))

(assert (= (and mapNonEmpty!49795 (not condMapEmpty!49801)) mapNonEmpty!49801))

(assert (= (and mapNonEmpty!49801 ((_ is ValueCellFull!15240) mapValue!49801)) b!1256525))

(assert (= (and mapNonEmpty!49795 ((_ is ValueCellFull!15240) mapDefault!49801)) b!1256526))

(declare-fun m!1157187 () Bool)

(assert (=> mapNonEmpty!49801 m!1157187))

(declare-fun b_lambda!22677 () Bool)

(assert (= b_lambda!22673 (or (and start!105446 b_free!27105) b_lambda!22677)))

(declare-fun b_lambda!22679 () Bool)

(assert (= b_lambda!22671 (or (and start!105446 b_free!27105) b_lambda!22679)))

(declare-fun b_lambda!22681 () Bool)

(assert (= b_lambda!22669 (or (and start!105446 b_free!27105) b_lambda!22681)))

(declare-fun b_lambda!22683 () Bool)

(assert (= b_lambda!22667 (or (and start!105446 b_free!27105) b_lambda!22683)))

(declare-fun b_lambda!22685 () Bool)

(assert (= b_lambda!22675 (or (and start!105446 b_free!27105) b_lambda!22685)))

(check-sat (not bm!61800) (not b!1256444) (not b_lambda!22685) (not b_lambda!22681) (not b!1256413) (not bm!61781) (not bm!61803) b_and!44963 (not bm!61780) (not b!1256406) (not b!1256414) (not b!1256429) (not bm!61805) (not d!138201) (not mapNonEmpty!49801) (not b!1256424) (not bm!61777) (not b!1256412) (not b_lambda!22683) (not b!1256446) (not b!1256416) (not d!138205) (not b!1256514) (not b!1256425) (not b!1256411) (not b!1256508) (not b!1256428) (not bm!61801) (not bm!61784) (not b!1256499) (not b!1256379) tp_is_empty!32007 (not d!138207) (not b!1256513) (not b!1256420) (not b!1256380) (not b!1256453) (not b!1256427) (not b!1256516) (not d!138193) (not b!1256445) (not b!1256410) (not d!138195) (not b!1256518) (not b!1256455) (not b!1256415) (not b!1256505) (not b_lambda!22679) (not b_lambda!22677) (not b_next!27105) (not b!1256430) (not b!1256503) (not d!138199) (not b!1256426) (not d!138197))
(check-sat b_and!44963 (not b_next!27105))
