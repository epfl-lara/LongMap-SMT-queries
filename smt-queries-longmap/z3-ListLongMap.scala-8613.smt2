; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104918 () Bool)

(assert start!104918)

(declare-fun b_free!26713 () Bool)

(declare-fun b_next!26713 () Bool)

(assert (=> start!104918 (= b_free!26713 (not b_next!26713))))

(declare-fun tp!93632 () Bool)

(declare-fun b_and!44471 () Bool)

(assert (=> start!104918 (= tp!93632 b_and!44471)))

(declare-fun mapNonEmpty!49186 () Bool)

(declare-fun mapRes!49186 () Bool)

(declare-fun tp!93631 () Bool)

(declare-fun e!709976 () Bool)

(assert (=> mapNonEmpty!49186 (= mapRes!49186 (and tp!93631 e!709976))))

(declare-datatypes ((V!47519 0))(
  ( (V!47520 (val!15870 Int)) )
))
(declare-datatypes ((ValueCell!15044 0))(
  ( (ValueCellFull!15044 (v!18565 V!47519)) (EmptyCell!15044) )
))
(declare-datatypes ((array!80819 0))(
  ( (array!80820 (arr!38976 (Array (_ BitVec 32) ValueCell!15044)) (size!39514 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80819)

(declare-fun mapRest!49186 () (Array (_ BitVec 32) ValueCell!15044))

(declare-fun mapKey!49186 () (_ BitVec 32))

(declare-fun mapValue!49186 () ValueCell!15044)

(assert (=> mapNonEmpty!49186 (= (arr!38976 _values!914) (store mapRest!49186 mapKey!49186 mapValue!49186))))

(declare-fun mapIsEmpty!49186 () Bool)

(assert (=> mapIsEmpty!49186 mapRes!49186))

(declare-fun b!1250537 () Bool)

(declare-fun e!709973 () Bool)

(declare-fun e!709971 () Bool)

(assert (=> b!1250537 (= e!709973 (not e!709971))))

(declare-fun res!834153 () Bool)

(assert (=> b!1250537 (=> res!834153 e!709971)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1250537 (= res!834153 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20538 0))(
  ( (tuple2!20539 (_1!10280 (_ BitVec 64)) (_2!10280 V!47519)) )
))
(declare-datatypes ((List!27761 0))(
  ( (Nil!27758) (Cons!27757 (h!28966 tuple2!20538) (t!41225 List!27761)) )
))
(declare-datatypes ((ListLongMap!18411 0))(
  ( (ListLongMap!18412 (toList!9221 List!27761)) )
))
(declare-fun lt!564149 () ListLongMap!18411)

(declare-fun lt!564152 () ListLongMap!18411)

(assert (=> b!1250537 (= lt!564149 lt!564152)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47519)

(declare-datatypes ((Unit!41406 0))(
  ( (Unit!41407) )
))
(declare-fun lt!564151 () Unit!41406)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47519)

(declare-datatypes ((array!80821 0))(
  ( (array!80822 (arr!38977 (Array (_ BitVec 32) (_ BitVec 64))) (size!39515 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80821)

(declare-fun minValueBefore!43 () V!47519)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!953 (array!80821 array!80819 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47519 V!47519 V!47519 V!47519 (_ BitVec 32) Int) Unit!41406)

(assert (=> b!1250537 (= lt!564151 (lemmaNoChangeToArrayThenSameMapNoExtras!953 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5631 (array!80821 array!80819 (_ BitVec 32) (_ BitVec 32) V!47519 V!47519 (_ BitVec 32) Int) ListLongMap!18411)

(assert (=> b!1250537 (= lt!564152 (getCurrentListMapNoExtraKeys!5631 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250537 (= lt!564149 (getCurrentListMapNoExtraKeys!5631 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250538 () Bool)

(declare-fun e!709975 () Bool)

(assert (=> b!1250538 (= e!709971 e!709975)))

(declare-fun res!834148 () Bool)

(assert (=> b!1250538 (=> res!834148 e!709975)))

(declare-fun lt!564150 () ListLongMap!18411)

(declare-fun contains!7465 (ListLongMap!18411 (_ BitVec 64)) Bool)

(assert (=> b!1250538 (= res!834148 (contains!7465 lt!564150 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4392 (array!80821 array!80819 (_ BitVec 32) (_ BitVec 32) V!47519 V!47519 (_ BitVec 32) Int) ListLongMap!18411)

(assert (=> b!1250538 (= lt!564150 (getCurrentListMap!4392 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250539 () Bool)

(declare-fun e!709974 () Bool)

(declare-fun e!709970 () Bool)

(assert (=> b!1250539 (= e!709974 (and e!709970 mapRes!49186))))

(declare-fun condMapEmpty!49186 () Bool)

(declare-fun mapDefault!49186 () ValueCell!15044)

(assert (=> b!1250539 (= condMapEmpty!49186 (= (arr!38976 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15044)) mapDefault!49186)))))

(declare-fun b!1250540 () Bool)

(assert (=> b!1250540 (= e!709975 (bvsle #b00000000000000000000000000000000 (size!39515 _keys!1118)))))

(declare-fun -!1967 (ListLongMap!18411 (_ BitVec 64)) ListLongMap!18411)

(assert (=> b!1250540 (= (-!1967 lt!564150 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564150)))

(declare-fun lt!564153 () Unit!41406)

(declare-fun removeNotPresentStillSame!95 (ListLongMap!18411 (_ BitVec 64)) Unit!41406)

(assert (=> b!1250540 (= lt!564153 (removeNotPresentStillSame!95 lt!564150 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250541 () Bool)

(declare-fun res!834149 () Bool)

(assert (=> b!1250541 (=> (not res!834149) (not e!709973))))

(assert (=> b!1250541 (= res!834149 (and (= (size!39514 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39515 _keys!1118) (size!39514 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250536 () Bool)

(declare-fun tp_is_empty!31615 () Bool)

(assert (=> b!1250536 (= e!709970 tp_is_empty!31615)))

(declare-fun res!834152 () Bool)

(assert (=> start!104918 (=> (not res!834152) (not e!709973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104918 (= res!834152 (validMask!0 mask!1466))))

(assert (=> start!104918 e!709973))

(assert (=> start!104918 true))

(assert (=> start!104918 tp!93632))

(assert (=> start!104918 tp_is_empty!31615))

(declare-fun array_inv!29865 (array!80821) Bool)

(assert (=> start!104918 (array_inv!29865 _keys!1118)))

(declare-fun array_inv!29866 (array!80819) Bool)

(assert (=> start!104918 (and (array_inv!29866 _values!914) e!709974)))

(declare-fun b!1250542 () Bool)

(declare-fun res!834150 () Bool)

(assert (=> b!1250542 (=> (not res!834150) (not e!709973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80821 (_ BitVec 32)) Bool)

(assert (=> b!1250542 (= res!834150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250543 () Bool)

(declare-fun res!834151 () Bool)

(assert (=> b!1250543 (=> (not res!834151) (not e!709973))))

(declare-datatypes ((List!27762 0))(
  ( (Nil!27759) (Cons!27758 (h!28967 (_ BitVec 64)) (t!41226 List!27762)) )
))
(declare-fun arrayNoDuplicates!0 (array!80821 (_ BitVec 32) List!27762) Bool)

(assert (=> b!1250543 (= res!834151 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27759))))

(declare-fun b!1250544 () Bool)

(assert (=> b!1250544 (= e!709976 tp_is_empty!31615)))

(assert (= (and start!104918 res!834152) b!1250541))

(assert (= (and b!1250541 res!834149) b!1250542))

(assert (= (and b!1250542 res!834150) b!1250543))

(assert (= (and b!1250543 res!834151) b!1250537))

(assert (= (and b!1250537 (not res!834153)) b!1250538))

(assert (= (and b!1250538 (not res!834148)) b!1250540))

(assert (= (and b!1250539 condMapEmpty!49186) mapIsEmpty!49186))

(assert (= (and b!1250539 (not condMapEmpty!49186)) mapNonEmpty!49186))

(get-info :version)

(assert (= (and mapNonEmpty!49186 ((_ is ValueCellFull!15044) mapValue!49186)) b!1250544))

(assert (= (and b!1250539 ((_ is ValueCellFull!15044) mapDefault!49186)) b!1250536))

(assert (= start!104918 b!1250539))

(declare-fun m!1150921 () Bool)

(assert (=> b!1250542 m!1150921))

(declare-fun m!1150923 () Bool)

(assert (=> b!1250537 m!1150923))

(declare-fun m!1150925 () Bool)

(assert (=> b!1250537 m!1150925))

(declare-fun m!1150927 () Bool)

(assert (=> b!1250537 m!1150927))

(declare-fun m!1150929 () Bool)

(assert (=> mapNonEmpty!49186 m!1150929))

(declare-fun m!1150931 () Bool)

(assert (=> b!1250543 m!1150931))

(declare-fun m!1150933 () Bool)

(assert (=> b!1250540 m!1150933))

(declare-fun m!1150935 () Bool)

(assert (=> b!1250540 m!1150935))

(declare-fun m!1150937 () Bool)

(assert (=> b!1250538 m!1150937))

(declare-fun m!1150939 () Bool)

(assert (=> b!1250538 m!1150939))

(declare-fun m!1150941 () Bool)

(assert (=> start!104918 m!1150941))

(declare-fun m!1150943 () Bool)

(assert (=> start!104918 m!1150943))

(declare-fun m!1150945 () Bool)

(assert (=> start!104918 m!1150945))

(check-sat (not b!1250540) (not start!104918) tp_is_empty!31615 (not b!1250537) (not b!1250538) (not mapNonEmpty!49186) (not b!1250542) (not b!1250543) (not b_next!26713) b_and!44471)
(check-sat b_and!44471 (not b_next!26713))
(get-model)

(declare-fun d!137769 () Bool)

(assert (=> d!137769 (= (getCurrentListMapNoExtraKeys!5631 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5631 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564186 () Unit!41406)

(declare-fun choose!1856 (array!80821 array!80819 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47519 V!47519 V!47519 V!47519 (_ BitVec 32) Int) Unit!41406)

(assert (=> d!137769 (= lt!564186 (choose!1856 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!137769 (validMask!0 mask!1466)))

(assert (=> d!137769 (= (lemmaNoChangeToArrayThenSameMapNoExtras!953 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!564186)))

(declare-fun bs!35279 () Bool)

(assert (= bs!35279 d!137769))

(assert (=> bs!35279 m!1150927))

(assert (=> bs!35279 m!1150925))

(declare-fun m!1150999 () Bool)

(assert (=> bs!35279 m!1150999))

(assert (=> bs!35279 m!1150941))

(assert (=> b!1250537 d!137769))

(declare-fun e!710034 () Bool)

(declare-fun lt!564202 () ListLongMap!18411)

(declare-fun b!1250623 () Bool)

(assert (=> b!1250623 (= e!710034 (= lt!564202 (getCurrentListMapNoExtraKeys!5631 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1250624 () Bool)

(declare-fun e!710037 () Bool)

(declare-fun e!710036 () Bool)

(assert (=> b!1250624 (= e!710037 e!710036)))

(declare-fun c!122138 () Bool)

(declare-fun e!710035 () Bool)

(assert (=> b!1250624 (= c!122138 e!710035)))

(declare-fun res!834201 () Bool)

(assert (=> b!1250624 (=> (not res!834201) (not e!710035))))

(assert (=> b!1250624 (= res!834201 (bvslt #b00000000000000000000000000000000 (size!39515 _keys!1118)))))

(declare-fun b!1250625 () Bool)

(declare-fun lt!564204 () Unit!41406)

(declare-fun lt!564205 () Unit!41406)

(assert (=> b!1250625 (= lt!564204 lt!564205)))

(declare-fun lt!564207 () (_ BitVec 64))

(declare-fun lt!564206 () V!47519)

(declare-fun lt!564201 () (_ BitVec 64))

(declare-fun lt!564203 () ListLongMap!18411)

(declare-fun +!4185 (ListLongMap!18411 tuple2!20538) ListLongMap!18411)

(assert (=> b!1250625 (not (contains!7465 (+!4185 lt!564203 (tuple2!20539 lt!564201 lt!564206)) lt!564207))))

(declare-fun addStillNotContains!310 (ListLongMap!18411 (_ BitVec 64) V!47519 (_ BitVec 64)) Unit!41406)

(assert (=> b!1250625 (= lt!564205 (addStillNotContains!310 lt!564203 lt!564201 lt!564206 lt!564207))))

(assert (=> b!1250625 (= lt!564207 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20005 (ValueCell!15044 V!47519) V!47519)

(declare-fun dynLambda!3404 (Int (_ BitVec 64)) V!47519)

(assert (=> b!1250625 (= lt!564206 (get!20005 (select (arr!38976 _values!914) #b00000000000000000000000000000000) (dynLambda!3404 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1250625 (= lt!564201 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61572 () ListLongMap!18411)

(assert (=> b!1250625 (= lt!564203 call!61572)))

(declare-fun e!710033 () ListLongMap!18411)

(assert (=> b!1250625 (= e!710033 (+!4185 call!61572 (tuple2!20539 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000) (get!20005 (select (arr!38976 _values!914) #b00000000000000000000000000000000) (dynLambda!3404 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1250626 () Bool)

(declare-fun e!710039 () ListLongMap!18411)

(assert (=> b!1250626 (= e!710039 e!710033)))

(declare-fun c!122137 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1250626 (= c!122137 (validKeyInArray!0 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1250627 () Bool)

(assert (=> b!1250627 (= e!710035 (validKeyInArray!0 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1250627 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1250628 () Bool)

(assert (=> b!1250628 (= e!710039 (ListLongMap!18412 Nil!27758))))

(declare-fun b!1250629 () Bool)

(assert (=> b!1250629 (= e!710033 call!61572)))

(declare-fun b!1250630 () Bool)

(assert (=> b!1250630 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39515 _keys!1118)))))

(assert (=> b!1250630 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39514 _values!914)))))

(declare-fun e!710038 () Bool)

(declare-fun apply!974 (ListLongMap!18411 (_ BitVec 64)) V!47519)

(assert (=> b!1250630 (= e!710038 (= (apply!974 lt!564202 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)) (get!20005 (select (arr!38976 _values!914) #b00000000000000000000000000000000) (dynLambda!3404 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1250631 () Bool)

(declare-fun isEmpty!1029 (ListLongMap!18411) Bool)

(assert (=> b!1250631 (= e!710034 (isEmpty!1029 lt!564202))))

(declare-fun b!1250632 () Bool)

(assert (=> b!1250632 (= e!710036 e!710034)))

(declare-fun c!122140 () Bool)

(assert (=> b!1250632 (= c!122140 (bvslt #b00000000000000000000000000000000 (size!39515 _keys!1118)))))

(declare-fun b!1250633 () Bool)

(declare-fun res!834200 () Bool)

(assert (=> b!1250633 (=> (not res!834200) (not e!710037))))

(assert (=> b!1250633 (= res!834200 (not (contains!7465 lt!564202 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1250634 () Bool)

(assert (=> b!1250634 (= e!710036 e!710038)))

(assert (=> b!1250634 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39515 _keys!1118)))))

(declare-fun res!834198 () Bool)

(assert (=> b!1250634 (= res!834198 (contains!7465 lt!564202 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1250634 (=> (not res!834198) (not e!710038))))

(declare-fun bm!61569 () Bool)

(assert (=> bm!61569 (= call!61572 (getCurrentListMapNoExtraKeys!5631 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun d!137771 () Bool)

(assert (=> d!137771 e!710037))

(declare-fun res!834199 () Bool)

(assert (=> d!137771 (=> (not res!834199) (not e!710037))))

(assert (=> d!137771 (= res!834199 (not (contains!7465 lt!564202 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137771 (= lt!564202 e!710039)))

(declare-fun c!122139 () Bool)

(assert (=> d!137771 (= c!122139 (bvsge #b00000000000000000000000000000000 (size!39515 _keys!1118)))))

(assert (=> d!137771 (validMask!0 mask!1466)))

(assert (=> d!137771 (= (getCurrentListMapNoExtraKeys!5631 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!564202)))

(assert (= (and d!137771 c!122139) b!1250628))

(assert (= (and d!137771 (not c!122139)) b!1250626))

(assert (= (and b!1250626 c!122137) b!1250625))

(assert (= (and b!1250626 (not c!122137)) b!1250629))

(assert (= (or b!1250625 b!1250629) bm!61569))

(assert (= (and d!137771 res!834199) b!1250633))

(assert (= (and b!1250633 res!834200) b!1250624))

(assert (= (and b!1250624 res!834201) b!1250627))

(assert (= (and b!1250624 c!122138) b!1250634))

(assert (= (and b!1250624 (not c!122138)) b!1250632))

(assert (= (and b!1250634 res!834198) b!1250630))

(assert (= (and b!1250632 c!122140) b!1250623))

(assert (= (and b!1250632 (not c!122140)) b!1250631))

(declare-fun b_lambda!22517 () Bool)

(assert (=> (not b_lambda!22517) (not b!1250625)))

(declare-fun t!41230 () Bool)

(declare-fun tb!11281 () Bool)

(assert (=> (and start!104918 (= defaultEntry!922 defaultEntry!922) t!41230) tb!11281))

(declare-fun result!23267 () Bool)

(assert (=> tb!11281 (= result!23267 tp_is_empty!31615)))

(assert (=> b!1250625 t!41230))

(declare-fun b_and!44477 () Bool)

(assert (= b_and!44471 (and (=> t!41230 result!23267) b_and!44477)))

(declare-fun b_lambda!22519 () Bool)

(assert (=> (not b_lambda!22519) (not b!1250630)))

(assert (=> b!1250630 t!41230))

(declare-fun b_and!44479 () Bool)

(assert (= b_and!44477 (and (=> t!41230 result!23267) b_and!44479)))

(declare-fun m!1151001 () Bool)

(assert (=> bm!61569 m!1151001))

(declare-fun m!1151003 () Bool)

(assert (=> b!1250633 m!1151003))

(declare-fun m!1151005 () Bool)

(assert (=> b!1250626 m!1151005))

(assert (=> b!1250626 m!1151005))

(declare-fun m!1151007 () Bool)

(assert (=> b!1250626 m!1151007))

(declare-fun m!1151009 () Bool)

(assert (=> d!137771 m!1151009))

(assert (=> d!137771 m!1150941))

(declare-fun m!1151011 () Bool)

(assert (=> b!1250630 m!1151011))

(declare-fun m!1151013 () Bool)

(assert (=> b!1250630 m!1151013))

(declare-fun m!1151015 () Bool)

(assert (=> b!1250630 m!1151015))

(assert (=> b!1250630 m!1151013))

(assert (=> b!1250630 m!1151005))

(declare-fun m!1151017 () Bool)

(assert (=> b!1250630 m!1151017))

(assert (=> b!1250630 m!1151005))

(assert (=> b!1250630 m!1151011))

(assert (=> b!1250634 m!1151005))

(assert (=> b!1250634 m!1151005))

(declare-fun m!1151019 () Bool)

(assert (=> b!1250634 m!1151019))

(declare-fun m!1151021 () Bool)

(assert (=> b!1250631 m!1151021))

(declare-fun m!1151023 () Bool)

(assert (=> b!1250625 m!1151023))

(assert (=> b!1250625 m!1151013))

(declare-fun m!1151025 () Bool)

(assert (=> b!1250625 m!1151025))

(declare-fun m!1151027 () Bool)

(assert (=> b!1250625 m!1151027))

(assert (=> b!1250625 m!1151025))

(assert (=> b!1250625 m!1151005))

(assert (=> b!1250625 m!1151011))

(assert (=> b!1250625 m!1151011))

(assert (=> b!1250625 m!1151013))

(assert (=> b!1250625 m!1151015))

(declare-fun m!1151029 () Bool)

(assert (=> b!1250625 m!1151029))

(assert (=> b!1250623 m!1151001))

(assert (=> b!1250627 m!1151005))

(assert (=> b!1250627 m!1151005))

(assert (=> b!1250627 m!1151007))

(assert (=> b!1250537 d!137771))

(declare-fun e!710041 () Bool)

(declare-fun b!1250637 () Bool)

(declare-fun lt!564209 () ListLongMap!18411)

(assert (=> b!1250637 (= e!710041 (= lt!564209 (getCurrentListMapNoExtraKeys!5631 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1250638 () Bool)

(declare-fun e!710044 () Bool)

(declare-fun e!710043 () Bool)

(assert (=> b!1250638 (= e!710044 e!710043)))

(declare-fun c!122142 () Bool)

(declare-fun e!710042 () Bool)

(assert (=> b!1250638 (= c!122142 e!710042)))

(declare-fun res!834205 () Bool)

(assert (=> b!1250638 (=> (not res!834205) (not e!710042))))

(assert (=> b!1250638 (= res!834205 (bvslt #b00000000000000000000000000000000 (size!39515 _keys!1118)))))

(declare-fun b!1250639 () Bool)

(declare-fun lt!564211 () Unit!41406)

(declare-fun lt!564212 () Unit!41406)

(assert (=> b!1250639 (= lt!564211 lt!564212)))

(declare-fun lt!564210 () ListLongMap!18411)

(declare-fun lt!564214 () (_ BitVec 64))

(declare-fun lt!564213 () V!47519)

(declare-fun lt!564208 () (_ BitVec 64))

(assert (=> b!1250639 (not (contains!7465 (+!4185 lt!564210 (tuple2!20539 lt!564208 lt!564213)) lt!564214))))

(assert (=> b!1250639 (= lt!564212 (addStillNotContains!310 lt!564210 lt!564208 lt!564213 lt!564214))))

(assert (=> b!1250639 (= lt!564214 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1250639 (= lt!564213 (get!20005 (select (arr!38976 _values!914) #b00000000000000000000000000000000) (dynLambda!3404 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1250639 (= lt!564208 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61573 () ListLongMap!18411)

(assert (=> b!1250639 (= lt!564210 call!61573)))

(declare-fun e!710040 () ListLongMap!18411)

(assert (=> b!1250639 (= e!710040 (+!4185 call!61573 (tuple2!20539 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000) (get!20005 (select (arr!38976 _values!914) #b00000000000000000000000000000000) (dynLambda!3404 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1250640 () Bool)

(declare-fun e!710046 () ListLongMap!18411)

(assert (=> b!1250640 (= e!710046 e!710040)))

(declare-fun c!122141 () Bool)

(assert (=> b!1250640 (= c!122141 (validKeyInArray!0 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1250641 () Bool)

(assert (=> b!1250641 (= e!710042 (validKeyInArray!0 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1250641 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1250642 () Bool)

(assert (=> b!1250642 (= e!710046 (ListLongMap!18412 Nil!27758))))

(declare-fun b!1250643 () Bool)

(assert (=> b!1250643 (= e!710040 call!61573)))

(declare-fun b!1250644 () Bool)

(assert (=> b!1250644 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39515 _keys!1118)))))

(assert (=> b!1250644 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39514 _values!914)))))

(declare-fun e!710045 () Bool)

(assert (=> b!1250644 (= e!710045 (= (apply!974 lt!564209 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)) (get!20005 (select (arr!38976 _values!914) #b00000000000000000000000000000000) (dynLambda!3404 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1250645 () Bool)

(assert (=> b!1250645 (= e!710041 (isEmpty!1029 lt!564209))))

(declare-fun b!1250646 () Bool)

(assert (=> b!1250646 (= e!710043 e!710041)))

(declare-fun c!122144 () Bool)

(assert (=> b!1250646 (= c!122144 (bvslt #b00000000000000000000000000000000 (size!39515 _keys!1118)))))

(declare-fun b!1250647 () Bool)

(declare-fun res!834204 () Bool)

(assert (=> b!1250647 (=> (not res!834204) (not e!710044))))

(assert (=> b!1250647 (= res!834204 (not (contains!7465 lt!564209 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1250648 () Bool)

(assert (=> b!1250648 (= e!710043 e!710045)))

(assert (=> b!1250648 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39515 _keys!1118)))))

(declare-fun res!834202 () Bool)

(assert (=> b!1250648 (= res!834202 (contains!7465 lt!564209 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1250648 (=> (not res!834202) (not e!710045))))

(declare-fun bm!61570 () Bool)

(assert (=> bm!61570 (= call!61573 (getCurrentListMapNoExtraKeys!5631 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun d!137773 () Bool)

(assert (=> d!137773 e!710044))

(declare-fun res!834203 () Bool)

(assert (=> d!137773 (=> (not res!834203) (not e!710044))))

(assert (=> d!137773 (= res!834203 (not (contains!7465 lt!564209 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137773 (= lt!564209 e!710046)))

(declare-fun c!122143 () Bool)

(assert (=> d!137773 (= c!122143 (bvsge #b00000000000000000000000000000000 (size!39515 _keys!1118)))))

(assert (=> d!137773 (validMask!0 mask!1466)))

(assert (=> d!137773 (= (getCurrentListMapNoExtraKeys!5631 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!564209)))

(assert (= (and d!137773 c!122143) b!1250642))

(assert (= (and d!137773 (not c!122143)) b!1250640))

(assert (= (and b!1250640 c!122141) b!1250639))

(assert (= (and b!1250640 (not c!122141)) b!1250643))

(assert (= (or b!1250639 b!1250643) bm!61570))

(assert (= (and d!137773 res!834203) b!1250647))

(assert (= (and b!1250647 res!834204) b!1250638))

(assert (= (and b!1250638 res!834205) b!1250641))

(assert (= (and b!1250638 c!122142) b!1250648))

(assert (= (and b!1250638 (not c!122142)) b!1250646))

(assert (= (and b!1250648 res!834202) b!1250644))

(assert (= (and b!1250646 c!122144) b!1250637))

(assert (= (and b!1250646 (not c!122144)) b!1250645))

(declare-fun b_lambda!22521 () Bool)

(assert (=> (not b_lambda!22521) (not b!1250639)))

(assert (=> b!1250639 t!41230))

(declare-fun b_and!44481 () Bool)

(assert (= b_and!44479 (and (=> t!41230 result!23267) b_and!44481)))

(declare-fun b_lambda!22523 () Bool)

(assert (=> (not b_lambda!22523) (not b!1250644)))

(assert (=> b!1250644 t!41230))

(declare-fun b_and!44483 () Bool)

(assert (= b_and!44481 (and (=> t!41230 result!23267) b_and!44483)))

(declare-fun m!1151031 () Bool)

(assert (=> bm!61570 m!1151031))

(declare-fun m!1151033 () Bool)

(assert (=> b!1250647 m!1151033))

(assert (=> b!1250640 m!1151005))

(assert (=> b!1250640 m!1151005))

(assert (=> b!1250640 m!1151007))

(declare-fun m!1151035 () Bool)

(assert (=> d!137773 m!1151035))

(assert (=> d!137773 m!1150941))

(assert (=> b!1250644 m!1151011))

(assert (=> b!1250644 m!1151013))

(assert (=> b!1250644 m!1151015))

(assert (=> b!1250644 m!1151013))

(assert (=> b!1250644 m!1151005))

(declare-fun m!1151037 () Bool)

(assert (=> b!1250644 m!1151037))

(assert (=> b!1250644 m!1151005))

(assert (=> b!1250644 m!1151011))

(assert (=> b!1250648 m!1151005))

(assert (=> b!1250648 m!1151005))

(declare-fun m!1151039 () Bool)

(assert (=> b!1250648 m!1151039))

(declare-fun m!1151041 () Bool)

(assert (=> b!1250645 m!1151041))

(declare-fun m!1151043 () Bool)

(assert (=> b!1250639 m!1151043))

(assert (=> b!1250639 m!1151013))

(declare-fun m!1151045 () Bool)

(assert (=> b!1250639 m!1151045))

(declare-fun m!1151047 () Bool)

(assert (=> b!1250639 m!1151047))

(assert (=> b!1250639 m!1151045))

(assert (=> b!1250639 m!1151005))

(assert (=> b!1250639 m!1151011))

(assert (=> b!1250639 m!1151011))

(assert (=> b!1250639 m!1151013))

(assert (=> b!1250639 m!1151015))

(declare-fun m!1151049 () Bool)

(assert (=> b!1250639 m!1151049))

(assert (=> b!1250637 m!1151031))

(assert (=> b!1250641 m!1151005))

(assert (=> b!1250641 m!1151005))

(assert (=> b!1250641 m!1151007))

(assert (=> b!1250537 d!137773))

(declare-fun d!137775 () Bool)

(declare-fun res!834211 () Bool)

(declare-fun e!710054 () Bool)

(assert (=> d!137775 (=> res!834211 e!710054)))

(assert (=> d!137775 (= res!834211 (bvsge #b00000000000000000000000000000000 (size!39515 _keys!1118)))))

(assert (=> d!137775 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!710054)))

(declare-fun b!1250657 () Bool)

(declare-fun e!710055 () Bool)

(declare-fun e!710053 () Bool)

(assert (=> b!1250657 (= e!710055 e!710053)))

(declare-fun lt!564223 () (_ BitVec 64))

(assert (=> b!1250657 (= lt!564223 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!564222 () Unit!41406)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80821 (_ BitVec 64) (_ BitVec 32)) Unit!41406)

(assert (=> b!1250657 (= lt!564222 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!564223 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1250657 (arrayContainsKey!0 _keys!1118 lt!564223 #b00000000000000000000000000000000)))

(declare-fun lt!564221 () Unit!41406)

(assert (=> b!1250657 (= lt!564221 lt!564222)))

(declare-fun res!834210 () Bool)

(declare-datatypes ((SeekEntryResult!9958 0))(
  ( (MissingZero!9958 (index!42203 (_ BitVec 32))) (Found!9958 (index!42204 (_ BitVec 32))) (Intermediate!9958 (undefined!10770 Bool) (index!42205 (_ BitVec 32)) (x!110025 (_ BitVec 32))) (Undefined!9958) (MissingVacant!9958 (index!42206 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80821 (_ BitVec 32)) SeekEntryResult!9958)

(assert (=> b!1250657 (= res!834210 (= (seekEntryOrOpen!0 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9958 #b00000000000000000000000000000000)))))

(assert (=> b!1250657 (=> (not res!834210) (not e!710053))))

(declare-fun b!1250658 () Bool)

(declare-fun call!61576 () Bool)

(assert (=> b!1250658 (= e!710053 call!61576)))

(declare-fun bm!61573 () Bool)

(assert (=> bm!61573 (= call!61576 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1250659 () Bool)

(assert (=> b!1250659 (= e!710054 e!710055)))

(declare-fun c!122147 () Bool)

(assert (=> b!1250659 (= c!122147 (validKeyInArray!0 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1250660 () Bool)

(assert (=> b!1250660 (= e!710055 call!61576)))

(assert (= (and d!137775 (not res!834211)) b!1250659))

(assert (= (and b!1250659 c!122147) b!1250657))

(assert (= (and b!1250659 (not c!122147)) b!1250660))

(assert (= (and b!1250657 res!834210) b!1250658))

(assert (= (or b!1250658 b!1250660) bm!61573))

(assert (=> b!1250657 m!1151005))

(declare-fun m!1151051 () Bool)

(assert (=> b!1250657 m!1151051))

(declare-fun m!1151053 () Bool)

(assert (=> b!1250657 m!1151053))

(assert (=> b!1250657 m!1151005))

(declare-fun m!1151055 () Bool)

(assert (=> b!1250657 m!1151055))

(declare-fun m!1151057 () Bool)

(assert (=> bm!61573 m!1151057))

(assert (=> b!1250659 m!1151005))

(assert (=> b!1250659 m!1151005))

(assert (=> b!1250659 m!1151007))

(assert (=> b!1250542 d!137775))

(declare-fun d!137777 () Bool)

(assert (=> d!137777 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104918 d!137777))

(declare-fun d!137779 () Bool)

(assert (=> d!137779 (= (array_inv!29865 _keys!1118) (bvsge (size!39515 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104918 d!137779))

(declare-fun d!137781 () Bool)

(assert (=> d!137781 (= (array_inv!29866 _values!914) (bvsge (size!39514 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104918 d!137781))

(declare-fun b!1250671 () Bool)

(declare-fun e!710067 () Bool)

(declare-fun call!61579 () Bool)

(assert (=> b!1250671 (= e!710067 call!61579)))

(declare-fun bm!61576 () Bool)

(declare-fun c!122150 () Bool)

(assert (=> bm!61576 (= call!61579 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122150 (Cons!27758 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000) Nil!27759) Nil!27759)))))

(declare-fun b!1250672 () Bool)

(declare-fun e!710065 () Bool)

(declare-fun contains!7467 (List!27762 (_ BitVec 64)) Bool)

(assert (=> b!1250672 (= e!710065 (contains!7467 Nil!27759 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1250673 () Bool)

(declare-fun e!710066 () Bool)

(assert (=> b!1250673 (= e!710066 e!710067)))

(assert (=> b!1250673 (= c!122150 (validKeyInArray!0 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1250674 () Bool)

(declare-fun e!710064 () Bool)

(assert (=> b!1250674 (= e!710064 e!710066)))

(declare-fun res!834220 () Bool)

(assert (=> b!1250674 (=> (not res!834220) (not e!710066))))

(assert (=> b!1250674 (= res!834220 (not e!710065))))

(declare-fun res!834218 () Bool)

(assert (=> b!1250674 (=> (not res!834218) (not e!710065))))

(assert (=> b!1250674 (= res!834218 (validKeyInArray!0 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!137783 () Bool)

(declare-fun res!834219 () Bool)

(assert (=> d!137783 (=> res!834219 e!710064)))

(assert (=> d!137783 (= res!834219 (bvsge #b00000000000000000000000000000000 (size!39515 _keys!1118)))))

(assert (=> d!137783 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27759) e!710064)))

(declare-fun b!1250675 () Bool)

(assert (=> b!1250675 (= e!710067 call!61579)))

(assert (= (and d!137783 (not res!834219)) b!1250674))

(assert (= (and b!1250674 res!834218) b!1250672))

(assert (= (and b!1250674 res!834220) b!1250673))

(assert (= (and b!1250673 c!122150) b!1250675))

(assert (= (and b!1250673 (not c!122150)) b!1250671))

(assert (= (or b!1250675 b!1250671) bm!61576))

(assert (=> bm!61576 m!1151005))

(declare-fun m!1151059 () Bool)

(assert (=> bm!61576 m!1151059))

(assert (=> b!1250672 m!1151005))

(assert (=> b!1250672 m!1151005))

(declare-fun m!1151061 () Bool)

(assert (=> b!1250672 m!1151061))

(assert (=> b!1250673 m!1151005))

(assert (=> b!1250673 m!1151005))

(assert (=> b!1250673 m!1151007))

(assert (=> b!1250674 m!1151005))

(assert (=> b!1250674 m!1151005))

(assert (=> b!1250674 m!1151007))

(assert (=> b!1250543 d!137783))

(declare-fun d!137785 () Bool)

(declare-fun e!710073 () Bool)

(assert (=> d!137785 e!710073))

(declare-fun res!834223 () Bool)

(assert (=> d!137785 (=> res!834223 e!710073)))

(declare-fun lt!564235 () Bool)

(assert (=> d!137785 (= res!834223 (not lt!564235))))

(declare-fun lt!564232 () Bool)

(assert (=> d!137785 (= lt!564235 lt!564232)))

(declare-fun lt!564234 () Unit!41406)

(declare-fun e!710072 () Unit!41406)

(assert (=> d!137785 (= lt!564234 e!710072)))

(declare-fun c!122153 () Bool)

(assert (=> d!137785 (= c!122153 lt!564232)))

(declare-fun containsKey!616 (List!27761 (_ BitVec 64)) Bool)

(assert (=> d!137785 (= lt!564232 (containsKey!616 (toList!9221 lt!564150) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!137785 (= (contains!7465 lt!564150 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564235)))

(declare-fun b!1250682 () Bool)

(declare-fun lt!564233 () Unit!41406)

(assert (=> b!1250682 (= e!710072 lt!564233)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!426 (List!27761 (_ BitVec 64)) Unit!41406)

(assert (=> b!1250682 (= lt!564233 (lemmaContainsKeyImpliesGetValueByKeyDefined!426 (toList!9221 lt!564150) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!705 0))(
  ( (Some!704 (v!18568 V!47519)) (None!703) )
))
(declare-fun isDefined!469 (Option!705) Bool)

(declare-fun getValueByKey!654 (List!27761 (_ BitVec 64)) Option!705)

(assert (=> b!1250682 (isDefined!469 (getValueByKey!654 (toList!9221 lt!564150) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250683 () Bool)

(declare-fun Unit!41410 () Unit!41406)

(assert (=> b!1250683 (= e!710072 Unit!41410)))

(declare-fun b!1250684 () Bool)

(assert (=> b!1250684 (= e!710073 (isDefined!469 (getValueByKey!654 (toList!9221 lt!564150) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!137785 c!122153) b!1250682))

(assert (= (and d!137785 (not c!122153)) b!1250683))

(assert (= (and d!137785 (not res!834223)) b!1250684))

(declare-fun m!1151063 () Bool)

(assert (=> d!137785 m!1151063))

(declare-fun m!1151065 () Bool)

(assert (=> b!1250682 m!1151065))

(declare-fun m!1151067 () Bool)

(assert (=> b!1250682 m!1151067))

(assert (=> b!1250682 m!1151067))

(declare-fun m!1151069 () Bool)

(assert (=> b!1250682 m!1151069))

(assert (=> b!1250684 m!1151067))

(assert (=> b!1250684 m!1151067))

(assert (=> b!1250684 m!1151069))

(assert (=> b!1250538 d!137785))

(declare-fun b!1250727 () Bool)

(declare-fun e!710103 () ListLongMap!18411)

(declare-fun call!61597 () ListLongMap!18411)

(assert (=> b!1250727 (= e!710103 call!61597)))

(declare-fun b!1250728 () Bool)

(declare-fun e!710110 () Bool)

(assert (=> b!1250728 (= e!710110 (validKeyInArray!0 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61591 () Bool)

(declare-fun call!61596 () ListLongMap!18411)

(declare-fun call!61598 () ListLongMap!18411)

(assert (=> bm!61591 (= call!61596 call!61598)))

(declare-fun bm!61592 () Bool)

(declare-fun call!61595 () ListLongMap!18411)

(assert (=> bm!61592 (= call!61595 (getCurrentListMapNoExtraKeys!5631 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun bm!61593 () Bool)

(declare-fun call!61594 () Bool)

(declare-fun lt!564298 () ListLongMap!18411)

(assert (=> bm!61593 (= call!61594 (contains!7465 lt!564298 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250729 () Bool)

(declare-fun e!710109 () Unit!41406)

(declare-fun lt!564282 () Unit!41406)

(assert (=> b!1250729 (= e!710109 lt!564282)))

(declare-fun lt!564281 () ListLongMap!18411)

(assert (=> b!1250729 (= lt!564281 (getCurrentListMapNoExtraKeys!5631 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564292 () (_ BitVec 64))

(assert (=> b!1250729 (= lt!564292 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!564293 () (_ BitVec 64))

(assert (=> b!1250729 (= lt!564293 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!564286 () Unit!41406)

(declare-fun addStillContains!1075 (ListLongMap!18411 (_ BitVec 64) V!47519 (_ BitVec 64)) Unit!41406)

(assert (=> b!1250729 (= lt!564286 (addStillContains!1075 lt!564281 lt!564292 zeroValue!871 lt!564293))))

(assert (=> b!1250729 (contains!7465 (+!4185 lt!564281 (tuple2!20539 lt!564292 zeroValue!871)) lt!564293)))

(declare-fun lt!564284 () Unit!41406)

(assert (=> b!1250729 (= lt!564284 lt!564286)))

(declare-fun lt!564300 () ListLongMap!18411)

(assert (=> b!1250729 (= lt!564300 (getCurrentListMapNoExtraKeys!5631 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564280 () (_ BitVec 64))

(assert (=> b!1250729 (= lt!564280 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!564301 () (_ BitVec 64))

(assert (=> b!1250729 (= lt!564301 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!564291 () Unit!41406)

(declare-fun addApplyDifferent!518 (ListLongMap!18411 (_ BitVec 64) V!47519 (_ BitVec 64)) Unit!41406)

(assert (=> b!1250729 (= lt!564291 (addApplyDifferent!518 lt!564300 lt!564280 minValueBefore!43 lt!564301))))

(assert (=> b!1250729 (= (apply!974 (+!4185 lt!564300 (tuple2!20539 lt!564280 minValueBefore!43)) lt!564301) (apply!974 lt!564300 lt!564301))))

(declare-fun lt!564296 () Unit!41406)

(assert (=> b!1250729 (= lt!564296 lt!564291)))

(declare-fun lt!564295 () ListLongMap!18411)

(assert (=> b!1250729 (= lt!564295 (getCurrentListMapNoExtraKeys!5631 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564283 () (_ BitVec 64))

(assert (=> b!1250729 (= lt!564283 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!564288 () (_ BitVec 64))

(assert (=> b!1250729 (= lt!564288 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!564287 () Unit!41406)

(assert (=> b!1250729 (= lt!564287 (addApplyDifferent!518 lt!564295 lt!564283 zeroValue!871 lt!564288))))

(assert (=> b!1250729 (= (apply!974 (+!4185 lt!564295 (tuple2!20539 lt!564283 zeroValue!871)) lt!564288) (apply!974 lt!564295 lt!564288))))

(declare-fun lt!564289 () Unit!41406)

(assert (=> b!1250729 (= lt!564289 lt!564287)))

(declare-fun lt!564299 () ListLongMap!18411)

(assert (=> b!1250729 (= lt!564299 (getCurrentListMapNoExtraKeys!5631 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564294 () (_ BitVec 64))

(assert (=> b!1250729 (= lt!564294 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!564297 () (_ BitVec 64))

(assert (=> b!1250729 (= lt!564297 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1250729 (= lt!564282 (addApplyDifferent!518 lt!564299 lt!564294 minValueBefore!43 lt!564297))))

(assert (=> b!1250729 (= (apply!974 (+!4185 lt!564299 (tuple2!20539 lt!564294 minValueBefore!43)) lt!564297) (apply!974 lt!564299 lt!564297))))

(declare-fun d!137787 () Bool)

(declare-fun e!710102 () Bool)

(assert (=> d!137787 e!710102))

(declare-fun res!834242 () Bool)

(assert (=> d!137787 (=> (not res!834242) (not e!710102))))

(assert (=> d!137787 (= res!834242 (or (bvsge #b00000000000000000000000000000000 (size!39515 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39515 _keys!1118)))))))

(declare-fun lt!564285 () ListLongMap!18411)

(assert (=> d!137787 (= lt!564298 lt!564285)))

(declare-fun lt!564290 () Unit!41406)

(assert (=> d!137787 (= lt!564290 e!710109)))

(declare-fun c!122167 () Bool)

(declare-fun e!710111 () Bool)

(assert (=> d!137787 (= c!122167 e!710111)))

(declare-fun res!834250 () Bool)

(assert (=> d!137787 (=> (not res!834250) (not e!710111))))

(assert (=> d!137787 (= res!834250 (bvslt #b00000000000000000000000000000000 (size!39515 _keys!1118)))))

(declare-fun e!710106 () ListLongMap!18411)

(assert (=> d!137787 (= lt!564285 e!710106)))

(declare-fun c!122170 () Bool)

(assert (=> d!137787 (= c!122170 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!137787 (validMask!0 mask!1466)))

(assert (=> d!137787 (= (getCurrentListMap!4392 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!564298)))

(declare-fun bm!61594 () Bool)

(assert (=> bm!61594 (= call!61598 call!61595)))

(declare-fun b!1250730 () Bool)

(declare-fun e!710112 () Bool)

(declare-fun e!710104 () Bool)

(assert (=> b!1250730 (= e!710112 e!710104)))

(declare-fun res!834246 () Bool)

(assert (=> b!1250730 (=> (not res!834246) (not e!710104))))

(assert (=> b!1250730 (= res!834246 (contains!7465 lt!564298 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1250730 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39515 _keys!1118)))))

(declare-fun b!1250731 () Bool)

(declare-fun res!834243 () Bool)

(assert (=> b!1250731 (=> (not res!834243) (not e!710102))))

(assert (=> b!1250731 (= res!834243 e!710112)))

(declare-fun res!834245 () Bool)

(assert (=> b!1250731 (=> res!834245 e!710112)))

(assert (=> b!1250731 (= res!834245 (not e!710110))))

(declare-fun res!834244 () Bool)

(assert (=> b!1250731 (=> (not res!834244) (not e!710110))))

(assert (=> b!1250731 (= res!834244 (bvslt #b00000000000000000000000000000000 (size!39515 _keys!1118)))))

(declare-fun b!1250732 () Bool)

(declare-fun Unit!41411 () Unit!41406)

(assert (=> b!1250732 (= e!710109 Unit!41411)))

(declare-fun b!1250733 () Bool)

(declare-fun e!710107 () Bool)

(assert (=> b!1250733 (= e!710107 (not call!61594))))

(declare-fun bm!61595 () Bool)

(declare-fun call!61600 () Bool)

(assert (=> bm!61595 (= call!61600 (contains!7465 lt!564298 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250734 () Bool)

(declare-fun e!710108 () Bool)

(assert (=> b!1250734 (= e!710108 (not call!61600))))

(declare-fun b!1250735 () Bool)

(assert (=> b!1250735 (= e!710104 (= (apply!974 lt!564298 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)) (get!20005 (select (arr!38976 _values!914) #b00000000000000000000000000000000) (dynLambda!3404 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1250735 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39514 _values!914)))))

(assert (=> b!1250735 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39515 _keys!1118)))))

(declare-fun b!1250736 () Bool)

(declare-fun e!710105 () Bool)

(assert (=> b!1250736 (= e!710107 e!710105)))

(declare-fun res!834247 () Bool)

(assert (=> b!1250736 (= res!834247 call!61594)))

(assert (=> b!1250736 (=> (not res!834247) (not e!710105))))

(declare-fun b!1250737 () Bool)

(declare-fun e!710101 () ListLongMap!18411)

(assert (=> b!1250737 (= e!710101 call!61596)))

(declare-fun b!1250738 () Bool)

(assert (=> b!1250738 (= e!710111 (validKeyInArray!0 (select (arr!38977 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1250739 () Bool)

(declare-fun c!122168 () Bool)

(assert (=> b!1250739 (= c!122168 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1250739 (= e!710103 e!710101)))

(declare-fun b!1250740 () Bool)

(declare-fun call!61599 () ListLongMap!18411)

(assert (=> b!1250740 (= e!710106 (+!4185 call!61599 (tuple2!20539 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1250741 () Bool)

(declare-fun e!710100 () Bool)

(assert (=> b!1250741 (= e!710108 e!710100)))

(declare-fun res!834248 () Bool)

(assert (=> b!1250741 (= res!834248 call!61600)))

(assert (=> b!1250741 (=> (not res!834248) (not e!710100))))

(declare-fun bm!61596 () Bool)

(assert (=> bm!61596 (= call!61597 call!61599)))

(declare-fun b!1250742 () Bool)

(assert (=> b!1250742 (= e!710106 e!710103)))

(declare-fun c!122171 () Bool)

(assert (=> b!1250742 (= c!122171 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250743 () Bool)

(assert (=> b!1250743 (= e!710102 e!710108)))

(declare-fun c!122166 () Bool)

(assert (=> b!1250743 (= c!122166 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250744 () Bool)

(assert (=> b!1250744 (= e!710105 (= (apply!974 lt!564298 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1250745 () Bool)

(assert (=> b!1250745 (= e!710101 call!61597)))

(declare-fun bm!61597 () Bool)

(assert (=> bm!61597 (= call!61599 (+!4185 (ite c!122170 call!61595 (ite c!122171 call!61598 call!61596)) (ite (or c!122170 c!122171) (tuple2!20539 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20539 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1250746 () Bool)

(assert (=> b!1250746 (= e!710100 (= (apply!974 lt!564298 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1250747 () Bool)

(declare-fun res!834249 () Bool)

(assert (=> b!1250747 (=> (not res!834249) (not e!710102))))

(assert (=> b!1250747 (= res!834249 e!710107)))

(declare-fun c!122169 () Bool)

(assert (=> b!1250747 (= c!122169 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!137787 c!122170) b!1250740))

(assert (= (and d!137787 (not c!122170)) b!1250742))

(assert (= (and b!1250742 c!122171) b!1250727))

(assert (= (and b!1250742 (not c!122171)) b!1250739))

(assert (= (and b!1250739 c!122168) b!1250745))

(assert (= (and b!1250739 (not c!122168)) b!1250737))

(assert (= (or b!1250745 b!1250737) bm!61591))

(assert (= (or b!1250727 bm!61591) bm!61594))

(assert (= (or b!1250727 b!1250745) bm!61596))

(assert (= (or b!1250740 bm!61594) bm!61592))

(assert (= (or b!1250740 bm!61596) bm!61597))

(assert (= (and d!137787 res!834250) b!1250738))

(assert (= (and d!137787 c!122167) b!1250729))

(assert (= (and d!137787 (not c!122167)) b!1250732))

(assert (= (and d!137787 res!834242) b!1250731))

(assert (= (and b!1250731 res!834244) b!1250728))

(assert (= (and b!1250731 (not res!834245)) b!1250730))

(assert (= (and b!1250730 res!834246) b!1250735))

(assert (= (and b!1250731 res!834243) b!1250747))

(assert (= (and b!1250747 c!122169) b!1250736))

(assert (= (and b!1250747 (not c!122169)) b!1250733))

(assert (= (and b!1250736 res!834247) b!1250744))

(assert (= (or b!1250736 b!1250733) bm!61593))

(assert (= (and b!1250747 res!834249) b!1250743))

(assert (= (and b!1250743 c!122166) b!1250741))

(assert (= (and b!1250743 (not c!122166)) b!1250734))

(assert (= (and b!1250741 res!834248) b!1250746))

(assert (= (or b!1250741 b!1250734) bm!61595))

(declare-fun b_lambda!22525 () Bool)

(assert (=> (not b_lambda!22525) (not b!1250735)))

(assert (=> b!1250735 t!41230))

(declare-fun b_and!44485 () Bool)

(assert (= b_and!44483 (and (=> t!41230 result!23267) b_and!44485)))

(assert (=> b!1250728 m!1151005))

(assert (=> b!1250728 m!1151005))

(assert (=> b!1250728 m!1151007))

(declare-fun m!1151071 () Bool)

(assert (=> b!1250746 m!1151071))

(assert (=> b!1250735 m!1151013))

(assert (=> b!1250735 m!1151011))

(assert (=> b!1250735 m!1151013))

(assert (=> b!1250735 m!1151015))

(assert (=> b!1250735 m!1151005))

(declare-fun m!1151073 () Bool)

(assert (=> b!1250735 m!1151073))

(assert (=> b!1250735 m!1151005))

(assert (=> b!1250735 m!1151011))

(assert (=> b!1250730 m!1151005))

(assert (=> b!1250730 m!1151005))

(declare-fun m!1151075 () Bool)

(assert (=> b!1250730 m!1151075))

(assert (=> bm!61592 m!1150927))

(declare-fun m!1151077 () Bool)

(assert (=> b!1250729 m!1151077))

(assert (=> b!1250729 m!1150927))

(declare-fun m!1151079 () Bool)

(assert (=> b!1250729 m!1151079))

(declare-fun m!1151081 () Bool)

(assert (=> b!1250729 m!1151081))

(declare-fun m!1151083 () Bool)

(assert (=> b!1250729 m!1151083))

(declare-fun m!1151085 () Bool)

(assert (=> b!1250729 m!1151085))

(declare-fun m!1151087 () Bool)

(assert (=> b!1250729 m!1151087))

(declare-fun m!1151089 () Bool)

(assert (=> b!1250729 m!1151089))

(declare-fun m!1151091 () Bool)

(assert (=> b!1250729 m!1151091))

(assert (=> b!1250729 m!1151091))

(declare-fun m!1151093 () Bool)

(assert (=> b!1250729 m!1151093))

(assert (=> b!1250729 m!1151087))

(declare-fun m!1151095 () Bool)

(assert (=> b!1250729 m!1151095))

(declare-fun m!1151097 () Bool)

(assert (=> b!1250729 m!1151097))

(declare-fun m!1151099 () Bool)

(assert (=> b!1250729 m!1151099))

(assert (=> b!1250729 m!1151097))

(declare-fun m!1151101 () Bool)

(assert (=> b!1250729 m!1151101))

(declare-fun m!1151103 () Bool)

(assert (=> b!1250729 m!1151103))

(assert (=> b!1250729 m!1151005))

(assert (=> b!1250729 m!1151101))

(declare-fun m!1151105 () Bool)

(assert (=> b!1250729 m!1151105))

(assert (=> b!1250738 m!1151005))

(assert (=> b!1250738 m!1151005))

(assert (=> b!1250738 m!1151007))

(assert (=> d!137787 m!1150941))

(declare-fun m!1151107 () Bool)

(assert (=> b!1250744 m!1151107))

(declare-fun m!1151109 () Bool)

(assert (=> bm!61597 m!1151109))

(declare-fun m!1151111 () Bool)

(assert (=> bm!61593 m!1151111))

(declare-fun m!1151113 () Bool)

(assert (=> bm!61595 m!1151113))

(declare-fun m!1151115 () Bool)

(assert (=> b!1250740 m!1151115))

(assert (=> b!1250538 d!137787))

(declare-fun d!137789 () Bool)

(declare-fun lt!564304 () ListLongMap!18411)

(assert (=> d!137789 (not (contains!7465 lt!564304 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!136 (List!27761 (_ BitVec 64)) List!27761)

(assert (=> d!137789 (= lt!564304 (ListLongMap!18412 (removeStrictlySorted!136 (toList!9221 lt!564150) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137789 (= (-!1967 lt!564150 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564304)))

(declare-fun bs!35280 () Bool)

(assert (= bs!35280 d!137789))

(declare-fun m!1151117 () Bool)

(assert (=> bs!35280 m!1151117))

(declare-fun m!1151119 () Bool)

(assert (=> bs!35280 m!1151119))

(assert (=> b!1250540 d!137789))

(declare-fun d!137791 () Bool)

(assert (=> d!137791 (= (-!1967 lt!564150 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564150)))

(declare-fun lt!564307 () Unit!41406)

(declare-fun choose!1857 (ListLongMap!18411 (_ BitVec 64)) Unit!41406)

(assert (=> d!137791 (= lt!564307 (choose!1857 lt!564150 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!137791 (not (contains!7465 lt!564150 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!137791 (= (removeNotPresentStillSame!95 lt!564150 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564307)))

(declare-fun bs!35281 () Bool)

(assert (= bs!35281 d!137791))

(assert (=> bs!35281 m!1150933))

(declare-fun m!1151121 () Bool)

(assert (=> bs!35281 m!1151121))

(assert (=> bs!35281 m!1150937))

(assert (=> b!1250540 d!137791))

(declare-fun condMapEmpty!49195 () Bool)

(declare-fun mapDefault!49195 () ValueCell!15044)

(assert (=> mapNonEmpty!49186 (= condMapEmpty!49195 (= mapRest!49186 ((as const (Array (_ BitVec 32) ValueCell!15044)) mapDefault!49195)))))

(declare-fun e!710117 () Bool)

(declare-fun mapRes!49195 () Bool)

(assert (=> mapNonEmpty!49186 (= tp!93631 (and e!710117 mapRes!49195))))

(declare-fun mapIsEmpty!49195 () Bool)

(assert (=> mapIsEmpty!49195 mapRes!49195))

(declare-fun b!1250754 () Bool)

(declare-fun e!710118 () Bool)

(assert (=> b!1250754 (= e!710118 tp_is_empty!31615)))

(declare-fun mapNonEmpty!49195 () Bool)

(declare-fun tp!93647 () Bool)

(assert (=> mapNonEmpty!49195 (= mapRes!49195 (and tp!93647 e!710118))))

(declare-fun mapRest!49195 () (Array (_ BitVec 32) ValueCell!15044))

(declare-fun mapValue!49195 () ValueCell!15044)

(declare-fun mapKey!49195 () (_ BitVec 32))

(assert (=> mapNonEmpty!49195 (= mapRest!49186 (store mapRest!49195 mapKey!49195 mapValue!49195))))

(declare-fun b!1250755 () Bool)

(assert (=> b!1250755 (= e!710117 tp_is_empty!31615)))

(assert (= (and mapNonEmpty!49186 condMapEmpty!49195) mapIsEmpty!49195))

(assert (= (and mapNonEmpty!49186 (not condMapEmpty!49195)) mapNonEmpty!49195))

(assert (= (and mapNonEmpty!49195 ((_ is ValueCellFull!15044) mapValue!49195)) b!1250754))

(assert (= (and mapNonEmpty!49186 ((_ is ValueCellFull!15044) mapDefault!49195)) b!1250755))

(declare-fun m!1151123 () Bool)

(assert (=> mapNonEmpty!49195 m!1151123))

(declare-fun b_lambda!22527 () Bool)

(assert (= b_lambda!22517 (or (and start!104918 b_free!26713) b_lambda!22527)))

(declare-fun b_lambda!22529 () Bool)

(assert (= b_lambda!22521 (or (and start!104918 b_free!26713) b_lambda!22529)))

(declare-fun b_lambda!22531 () Bool)

(assert (= b_lambda!22525 (or (and start!104918 b_free!26713) b_lambda!22531)))

(declare-fun b_lambda!22533 () Bool)

(assert (= b_lambda!22519 (or (and start!104918 b_free!26713) b_lambda!22533)))

(declare-fun b_lambda!22535 () Bool)

(assert (= b_lambda!22523 (or (and start!104918 b_free!26713) b_lambda!22535)))

(check-sat (not d!137791) (not b!1250659) (not b!1250633) (not b!1250674) (not b!1250641) (not b!1250728) (not bm!61593) (not b!1250673) (not b_next!26713) (not b!1250740) (not b!1250631) (not mapNonEmpty!49195) (not b!1250647) (not b!1250730) (not b_lambda!22529) (not b!1250744) (not b!1250630) (not b!1250729) (not b_lambda!22533) (not b!1250746) (not b!1250735) (not b!1250684) (not d!137773) (not b!1250644) (not bm!61569) (not bm!61597) (not bm!61570) tp_is_empty!31615 b_and!44485 (not bm!61595) (not b!1250639) (not b_lambda!22535) (not d!137769) (not d!137785) (not b!1250738) (not b!1250637) (not b!1250640) (not b_lambda!22531) (not d!137787) (not b!1250682) (not b!1250657) (not b!1250627) (not b!1250623) (not b!1250626) (not d!137771) (not b!1250634) (not bm!61592) (not b!1250648) (not b!1250625) (not d!137789) (not b!1250645) (not b!1250672) (not bm!61573) (not b_lambda!22527) (not bm!61576))
(check-sat b_and!44485 (not b_next!26713))
