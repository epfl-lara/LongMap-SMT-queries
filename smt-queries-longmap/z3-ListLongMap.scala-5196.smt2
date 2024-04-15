; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70156 () Bool)

(assert start!70156)

(declare-fun b_free!12583 () Bool)

(declare-fun b_next!12583 () Bool)

(assert (=> start!70156 (= b_free!12583 (not b_next!12583))))

(declare-fun tp!44467 () Bool)

(declare-fun b_and!21337 () Bool)

(assert (=> start!70156 (= tp!44467 b_and!21337)))

(declare-fun b!815115 () Bool)

(declare-fun e!451963 () Bool)

(declare-fun e!451960 () Bool)

(declare-fun mapRes!23023 () Bool)

(assert (=> b!815115 (= e!451963 (and e!451960 mapRes!23023))))

(declare-fun condMapEmpty!23023 () Bool)

(declare-datatypes ((V!24059 0))(
  ( (V!24060 (val!7194 Int)) )
))
(declare-datatypes ((ValueCell!6731 0))(
  ( (ValueCellFull!6731 (v!9615 V!24059)) (EmptyCell!6731) )
))
(declare-datatypes ((array!44775 0))(
  ( (array!44776 (arr!21447 (Array (_ BitVec 32) ValueCell!6731)) (size!21868 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44775)

(declare-fun mapDefault!23023 () ValueCell!6731)

(assert (=> b!815115 (= condMapEmpty!23023 (= (arr!21447 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6731)) mapDefault!23023)))))

(declare-fun b!815116 () Bool)

(declare-fun res!556683 () Bool)

(declare-fun e!451962 () Bool)

(assert (=> b!815116 (=> (not res!556683) (not e!451962))))

(declare-datatypes ((array!44777 0))(
  ( (array!44778 (arr!21448 (Array (_ BitVec 32) (_ BitVec 64))) (size!21869 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44777)

(declare-datatypes ((List!15285 0))(
  ( (Nil!15282) (Cons!15281 (h!16410 (_ BitVec 64)) (t!21595 List!15285)) )
))
(declare-fun arrayNoDuplicates!0 (array!44777 (_ BitVec 32) List!15285) Bool)

(assert (=> b!815116 (= res!556683 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15282))))

(declare-fun b!815117 () Bool)

(declare-fun res!556681 () Bool)

(assert (=> b!815117 (=> (not res!556681) (not e!451962))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!815117 (= res!556681 (and (= (size!21868 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21869 _keys!976) (size!21868 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815118 () Bool)

(assert (=> b!815118 (= e!451962 (not (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!21869 _keys!976)))))))

(declare-datatypes ((tuple2!9456 0))(
  ( (tuple2!9457 (_1!4739 (_ BitVec 64)) (_2!4739 V!24059)) )
))
(declare-datatypes ((List!15286 0))(
  ( (Nil!15283) (Cons!15282 (h!16411 tuple2!9456) (t!21596 List!15286)) )
))
(declare-datatypes ((ListLongMap!8269 0))(
  ( (ListLongMap!8270 (toList!4150 List!15286)) )
))
(declare-fun lt!364772 () ListLongMap!8269)

(declare-fun lt!364774 () ListLongMap!8269)

(assert (=> b!815118 (= lt!364772 lt!364774)))

(declare-fun zeroValueBefore!34 () V!24059)

(declare-fun zeroValueAfter!34 () V!24059)

(declare-fun minValue!754 () V!24059)

(declare-datatypes ((Unit!27734 0))(
  ( (Unit!27735) )
))
(declare-fun lt!364773 () Unit!27734)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!308 (array!44777 array!44775 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24059 V!24059 V!24059 V!24059 (_ BitVec 32) Int) Unit!27734)

(assert (=> b!815118 (= lt!364773 (lemmaNoChangeToArrayThenSameMapNoExtras!308 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2215 (array!44777 array!44775 (_ BitVec 32) (_ BitVec 32) V!24059 V!24059 (_ BitVec 32) Int) ListLongMap!8269)

(assert (=> b!815118 (= lt!364774 (getCurrentListMapNoExtraKeys!2215 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815118 (= lt!364772 (getCurrentListMapNoExtraKeys!2215 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815119 () Bool)

(declare-fun res!556682 () Bool)

(assert (=> b!815119 (=> (not res!556682) (not e!451962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44777 (_ BitVec 32)) Bool)

(assert (=> b!815119 (= res!556682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23023 () Bool)

(assert (=> mapIsEmpty!23023 mapRes!23023))

(declare-fun b!815120 () Bool)

(declare-fun tp_is_empty!14293 () Bool)

(assert (=> b!815120 (= e!451960 tp_is_empty!14293)))

(declare-fun b!815121 () Bool)

(declare-fun e!451959 () Bool)

(assert (=> b!815121 (= e!451959 tp_is_empty!14293)))

(declare-fun res!556680 () Bool)

(assert (=> start!70156 (=> (not res!556680) (not e!451962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70156 (= res!556680 (validMask!0 mask!1312))))

(assert (=> start!70156 e!451962))

(assert (=> start!70156 tp_is_empty!14293))

(declare-fun array_inv!17241 (array!44777) Bool)

(assert (=> start!70156 (array_inv!17241 _keys!976)))

(assert (=> start!70156 true))

(declare-fun array_inv!17242 (array!44775) Bool)

(assert (=> start!70156 (and (array_inv!17242 _values!788) e!451963)))

(assert (=> start!70156 tp!44467))

(declare-fun mapNonEmpty!23023 () Bool)

(declare-fun tp!44466 () Bool)

(assert (=> mapNonEmpty!23023 (= mapRes!23023 (and tp!44466 e!451959))))

(declare-fun mapRest!23023 () (Array (_ BitVec 32) ValueCell!6731))

(declare-fun mapValue!23023 () ValueCell!6731)

(declare-fun mapKey!23023 () (_ BitVec 32))

(assert (=> mapNonEmpty!23023 (= (arr!21447 _values!788) (store mapRest!23023 mapKey!23023 mapValue!23023))))

(assert (= (and start!70156 res!556680) b!815117))

(assert (= (and b!815117 res!556681) b!815119))

(assert (= (and b!815119 res!556682) b!815116))

(assert (= (and b!815116 res!556683) b!815118))

(assert (= (and b!815115 condMapEmpty!23023) mapIsEmpty!23023))

(assert (= (and b!815115 (not condMapEmpty!23023)) mapNonEmpty!23023))

(get-info :version)

(assert (= (and mapNonEmpty!23023 ((_ is ValueCellFull!6731) mapValue!23023)) b!815121))

(assert (= (and b!815115 ((_ is ValueCellFull!6731) mapDefault!23023)) b!815120))

(assert (= start!70156 b!815115))

(declare-fun m!756285 () Bool)

(assert (=> mapNonEmpty!23023 m!756285))

(declare-fun m!756287 () Bool)

(assert (=> b!815118 m!756287))

(declare-fun m!756289 () Bool)

(assert (=> b!815118 m!756289))

(declare-fun m!756291 () Bool)

(assert (=> b!815118 m!756291))

(declare-fun m!756293 () Bool)

(assert (=> b!815119 m!756293))

(declare-fun m!756295 () Bool)

(assert (=> b!815116 m!756295))

(declare-fun m!756297 () Bool)

(assert (=> start!70156 m!756297))

(declare-fun m!756299 () Bool)

(assert (=> start!70156 m!756299))

(declare-fun m!756301 () Bool)

(assert (=> start!70156 m!756301))

(check-sat b_and!21337 (not b!815116) (not mapNonEmpty!23023) (not start!70156) (not b_next!12583) tp_is_empty!14293 (not b!815118) (not b!815119))
(check-sat b_and!21337 (not b_next!12583))
(get-model)

(declare-fun d!104273 () Bool)

(assert (=> d!104273 (= (getCurrentListMapNoExtraKeys!2215 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2215 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!364795 () Unit!27734)

(declare-fun choose!1397 (array!44777 array!44775 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24059 V!24059 V!24059 V!24059 (_ BitVec 32) Int) Unit!27734)

(assert (=> d!104273 (= lt!364795 (choose!1397 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104273 (validMask!0 mask!1312)))

(assert (=> d!104273 (= (lemmaNoChangeToArrayThenSameMapNoExtras!308 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!364795)))

(declare-fun bs!22668 () Bool)

(assert (= bs!22668 d!104273))

(assert (=> bs!22668 m!756291))

(assert (=> bs!22668 m!756289))

(declare-fun m!756339 () Bool)

(assert (=> bs!22668 m!756339))

(assert (=> bs!22668 m!756297))

(assert (=> b!815118 d!104273))

(declare-fun b!815188 () Bool)

(declare-fun e!452011 () ListLongMap!8269)

(declare-fun e!452014 () ListLongMap!8269)

(assert (=> b!815188 (= e!452011 e!452014)))

(declare-fun c!88888 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!815188 (= c!88888 (validKeyInArray!0 (select (arr!21448 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!815189 () Bool)

(declare-fun lt!364813 () Unit!27734)

(declare-fun lt!364811 () Unit!27734)

(assert (=> b!815189 (= lt!364813 lt!364811)))

(declare-fun lt!364814 () ListLongMap!8269)

(declare-fun lt!364810 () (_ BitVec 64))

(declare-fun lt!364815 () V!24059)

(declare-fun lt!364812 () (_ BitVec 64))

(declare-fun contains!4126 (ListLongMap!8269 (_ BitVec 64)) Bool)

(declare-fun +!1817 (ListLongMap!8269 tuple2!9456) ListLongMap!8269)

(assert (=> b!815189 (not (contains!4126 (+!1817 lt!364814 (tuple2!9457 lt!364812 lt!364815)) lt!364810))))

(declare-fun addStillNotContains!175 (ListLongMap!8269 (_ BitVec 64) V!24059 (_ BitVec 64)) Unit!27734)

(assert (=> b!815189 (= lt!364811 (addStillNotContains!175 lt!364814 lt!364812 lt!364815 lt!364810))))

(assert (=> b!815189 (= lt!364810 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11496 (ValueCell!6731 V!24059) V!24059)

(declare-fun dynLambda!963 (Int (_ BitVec 64)) V!24059)

(assert (=> b!815189 (= lt!364815 (get!11496 (select (arr!21447 _values!788) #b00000000000000000000000000000000) (dynLambda!963 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!815189 (= lt!364812 (select (arr!21448 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35486 () ListLongMap!8269)

(assert (=> b!815189 (= lt!364814 call!35486)))

(assert (=> b!815189 (= e!452014 (+!1817 call!35486 (tuple2!9457 (select (arr!21448 _keys!976) #b00000000000000000000000000000000) (get!11496 (select (arr!21447 _values!788) #b00000000000000000000000000000000) (dynLambda!963 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!815190 () Bool)

(declare-fun e!452012 () Bool)

(declare-fun e!452013 () Bool)

(assert (=> b!815190 (= e!452012 e!452013)))

(assert (=> b!815190 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21869 _keys!976)))))

(declare-fun res!556716 () Bool)

(declare-fun lt!364816 () ListLongMap!8269)

(assert (=> b!815190 (= res!556716 (contains!4126 lt!364816 (select (arr!21448 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!815190 (=> (not res!556716) (not e!452013))))

(declare-fun b!815191 () Bool)

(declare-fun e!452008 () Bool)

(assert (=> b!815191 (= e!452008 (= lt!364816 (getCurrentListMapNoExtraKeys!2215 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!815193 () Bool)

(declare-fun res!556718 () Bool)

(declare-fun e!452009 () Bool)

(assert (=> b!815193 (=> (not res!556718) (not e!452009))))

(assert (=> b!815193 (= res!556718 (not (contains!4126 lt!364816 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!815194 () Bool)

(assert (=> b!815194 (= e!452012 e!452008)))

(declare-fun c!88887 () Bool)

(assert (=> b!815194 (= c!88887 (bvslt #b00000000000000000000000000000000 (size!21869 _keys!976)))))

(declare-fun b!815195 () Bool)

(assert (=> b!815195 (= e!452014 call!35486)))

(declare-fun b!815196 () Bool)

(assert (=> b!815196 (= e!452011 (ListLongMap!8270 Nil!15283))))

(declare-fun b!815197 () Bool)

(declare-fun e!452010 () Bool)

(assert (=> b!815197 (= e!452010 (validKeyInArray!0 (select (arr!21448 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!815197 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!815198 () Bool)

(assert (=> b!815198 (= e!452009 e!452012)))

(declare-fun c!88885 () Bool)

(assert (=> b!815198 (= c!88885 e!452010)))

(declare-fun res!556717 () Bool)

(assert (=> b!815198 (=> (not res!556717) (not e!452010))))

(assert (=> b!815198 (= res!556717 (bvslt #b00000000000000000000000000000000 (size!21869 _keys!976)))))

(declare-fun d!104275 () Bool)

(assert (=> d!104275 e!452009))

(declare-fun res!556719 () Bool)

(assert (=> d!104275 (=> (not res!556719) (not e!452009))))

(assert (=> d!104275 (= res!556719 (not (contains!4126 lt!364816 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104275 (= lt!364816 e!452011)))

(declare-fun c!88886 () Bool)

(assert (=> d!104275 (= c!88886 (bvsge #b00000000000000000000000000000000 (size!21869 _keys!976)))))

(assert (=> d!104275 (validMask!0 mask!1312)))

(assert (=> d!104275 (= (getCurrentListMapNoExtraKeys!2215 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!364816)))

(declare-fun b!815192 () Bool)

(assert (=> b!815192 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21869 _keys!976)))))

(assert (=> b!815192 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21868 _values!788)))))

(declare-fun apply!349 (ListLongMap!8269 (_ BitVec 64)) V!24059)

(assert (=> b!815192 (= e!452013 (= (apply!349 lt!364816 (select (arr!21448 _keys!976) #b00000000000000000000000000000000)) (get!11496 (select (arr!21447 _values!788) #b00000000000000000000000000000000) (dynLambda!963 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!815199 () Bool)

(declare-fun isEmpty!636 (ListLongMap!8269) Bool)

(assert (=> b!815199 (= e!452008 (isEmpty!636 lt!364816))))

(declare-fun bm!35483 () Bool)

(assert (=> bm!35483 (= call!35486 (getCurrentListMapNoExtraKeys!2215 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(assert (= (and d!104275 c!88886) b!815196))

(assert (= (and d!104275 (not c!88886)) b!815188))

(assert (= (and b!815188 c!88888) b!815189))

(assert (= (and b!815188 (not c!88888)) b!815195))

(assert (= (or b!815189 b!815195) bm!35483))

(assert (= (and d!104275 res!556719) b!815193))

(assert (= (and b!815193 res!556718) b!815198))

(assert (= (and b!815198 res!556717) b!815197))

(assert (= (and b!815198 c!88885) b!815190))

(assert (= (and b!815198 (not c!88885)) b!815194))

(assert (= (and b!815190 res!556716) b!815192))

(assert (= (and b!815194 c!88887) b!815191))

(assert (= (and b!815194 (not c!88887)) b!815199))

(declare-fun b_lambda!10829 () Bool)

(assert (=> (not b_lambda!10829) (not b!815189)))

(declare-fun t!21599 () Bool)

(declare-fun tb!4171 () Bool)

(assert (=> (and start!70156 (= defaultEntry!796 defaultEntry!796) t!21599) tb!4171))

(declare-fun result!7869 () Bool)

(assert (=> tb!4171 (= result!7869 tp_is_empty!14293)))

(assert (=> b!815189 t!21599))

(declare-fun b_and!21343 () Bool)

(assert (= b_and!21337 (and (=> t!21599 result!7869) b_and!21343)))

(declare-fun b_lambda!10831 () Bool)

(assert (=> (not b_lambda!10831) (not b!815192)))

(assert (=> b!815192 t!21599))

(declare-fun b_and!21345 () Bool)

(assert (= b_and!21343 (and (=> t!21599 result!7869) b_and!21345)))

(declare-fun m!756341 () Bool)

(assert (=> b!815190 m!756341))

(assert (=> b!815190 m!756341))

(declare-fun m!756343 () Bool)

(assert (=> b!815190 m!756343))

(assert (=> b!815188 m!756341))

(assert (=> b!815188 m!756341))

(declare-fun m!756345 () Bool)

(assert (=> b!815188 m!756345))

(declare-fun m!756347 () Bool)

(assert (=> b!815192 m!756347))

(assert (=> b!815192 m!756341))

(declare-fun m!756349 () Bool)

(assert (=> b!815192 m!756349))

(assert (=> b!815192 m!756341))

(declare-fun m!756351 () Bool)

(assert (=> b!815192 m!756351))

(assert (=> b!815192 m!756347))

(assert (=> b!815192 m!756351))

(declare-fun m!756353 () Bool)

(assert (=> b!815192 m!756353))

(declare-fun m!756355 () Bool)

(assert (=> bm!35483 m!756355))

(assert (=> b!815191 m!756355))

(declare-fun m!756357 () Bool)

(assert (=> b!815199 m!756357))

(declare-fun m!756359 () Bool)

(assert (=> b!815193 m!756359))

(assert (=> b!815197 m!756341))

(assert (=> b!815197 m!756341))

(assert (=> b!815197 m!756345))

(declare-fun m!756361 () Bool)

(assert (=> d!104275 m!756361))

(assert (=> d!104275 m!756297))

(assert (=> b!815189 m!756347))

(declare-fun m!756363 () Bool)

(assert (=> b!815189 m!756363))

(assert (=> b!815189 m!756341))

(assert (=> b!815189 m!756351))

(declare-fun m!756365 () Bool)

(assert (=> b!815189 m!756365))

(declare-fun m!756367 () Bool)

(assert (=> b!815189 m!756367))

(assert (=> b!815189 m!756363))

(declare-fun m!756369 () Bool)

(assert (=> b!815189 m!756369))

(assert (=> b!815189 m!756347))

(assert (=> b!815189 m!756351))

(assert (=> b!815189 m!756353))

(assert (=> b!815118 d!104275))

(declare-fun b!815202 () Bool)

(declare-fun e!452018 () ListLongMap!8269)

(declare-fun e!452021 () ListLongMap!8269)

(assert (=> b!815202 (= e!452018 e!452021)))

(declare-fun c!88892 () Bool)

(assert (=> b!815202 (= c!88892 (validKeyInArray!0 (select (arr!21448 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!815203 () Bool)

(declare-fun lt!364820 () Unit!27734)

(declare-fun lt!364818 () Unit!27734)

(assert (=> b!815203 (= lt!364820 lt!364818)))

(declare-fun lt!364819 () (_ BitVec 64))

(declare-fun lt!364822 () V!24059)

(declare-fun lt!364817 () (_ BitVec 64))

(declare-fun lt!364821 () ListLongMap!8269)

(assert (=> b!815203 (not (contains!4126 (+!1817 lt!364821 (tuple2!9457 lt!364819 lt!364822)) lt!364817))))

(assert (=> b!815203 (= lt!364818 (addStillNotContains!175 lt!364821 lt!364819 lt!364822 lt!364817))))

(assert (=> b!815203 (= lt!364817 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!815203 (= lt!364822 (get!11496 (select (arr!21447 _values!788) #b00000000000000000000000000000000) (dynLambda!963 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!815203 (= lt!364819 (select (arr!21448 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35487 () ListLongMap!8269)

(assert (=> b!815203 (= lt!364821 call!35487)))

(assert (=> b!815203 (= e!452021 (+!1817 call!35487 (tuple2!9457 (select (arr!21448 _keys!976) #b00000000000000000000000000000000) (get!11496 (select (arr!21447 _values!788) #b00000000000000000000000000000000) (dynLambda!963 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!815204 () Bool)

(declare-fun e!452019 () Bool)

(declare-fun e!452020 () Bool)

(assert (=> b!815204 (= e!452019 e!452020)))

(assert (=> b!815204 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21869 _keys!976)))))

(declare-fun res!556720 () Bool)

(declare-fun lt!364823 () ListLongMap!8269)

(assert (=> b!815204 (= res!556720 (contains!4126 lt!364823 (select (arr!21448 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!815204 (=> (not res!556720) (not e!452020))))

(declare-fun b!815205 () Bool)

(declare-fun e!452015 () Bool)

(assert (=> b!815205 (= e!452015 (= lt!364823 (getCurrentListMapNoExtraKeys!2215 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!815207 () Bool)

(declare-fun res!556722 () Bool)

(declare-fun e!452016 () Bool)

(assert (=> b!815207 (=> (not res!556722) (not e!452016))))

(assert (=> b!815207 (= res!556722 (not (contains!4126 lt!364823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!815208 () Bool)

(assert (=> b!815208 (= e!452019 e!452015)))

(declare-fun c!88891 () Bool)

(assert (=> b!815208 (= c!88891 (bvslt #b00000000000000000000000000000000 (size!21869 _keys!976)))))

(declare-fun b!815209 () Bool)

(assert (=> b!815209 (= e!452021 call!35487)))

(declare-fun b!815210 () Bool)

(assert (=> b!815210 (= e!452018 (ListLongMap!8270 Nil!15283))))

(declare-fun b!815211 () Bool)

(declare-fun e!452017 () Bool)

(assert (=> b!815211 (= e!452017 (validKeyInArray!0 (select (arr!21448 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!815211 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!815212 () Bool)

(assert (=> b!815212 (= e!452016 e!452019)))

(declare-fun c!88889 () Bool)

(assert (=> b!815212 (= c!88889 e!452017)))

(declare-fun res!556721 () Bool)

(assert (=> b!815212 (=> (not res!556721) (not e!452017))))

(assert (=> b!815212 (= res!556721 (bvslt #b00000000000000000000000000000000 (size!21869 _keys!976)))))

(declare-fun d!104277 () Bool)

(assert (=> d!104277 e!452016))

(declare-fun res!556723 () Bool)

(assert (=> d!104277 (=> (not res!556723) (not e!452016))))

(assert (=> d!104277 (= res!556723 (not (contains!4126 lt!364823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104277 (= lt!364823 e!452018)))

(declare-fun c!88890 () Bool)

(assert (=> d!104277 (= c!88890 (bvsge #b00000000000000000000000000000000 (size!21869 _keys!976)))))

(assert (=> d!104277 (validMask!0 mask!1312)))

(assert (=> d!104277 (= (getCurrentListMapNoExtraKeys!2215 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!364823)))

(declare-fun b!815206 () Bool)

(assert (=> b!815206 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21869 _keys!976)))))

(assert (=> b!815206 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21868 _values!788)))))

(assert (=> b!815206 (= e!452020 (= (apply!349 lt!364823 (select (arr!21448 _keys!976) #b00000000000000000000000000000000)) (get!11496 (select (arr!21447 _values!788) #b00000000000000000000000000000000) (dynLambda!963 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!815213 () Bool)

(assert (=> b!815213 (= e!452015 (isEmpty!636 lt!364823))))

(declare-fun bm!35484 () Bool)

(assert (=> bm!35484 (= call!35487 (getCurrentListMapNoExtraKeys!2215 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(assert (= (and d!104277 c!88890) b!815210))

(assert (= (and d!104277 (not c!88890)) b!815202))

(assert (= (and b!815202 c!88892) b!815203))

(assert (= (and b!815202 (not c!88892)) b!815209))

(assert (= (or b!815203 b!815209) bm!35484))

(assert (= (and d!104277 res!556723) b!815207))

(assert (= (and b!815207 res!556722) b!815212))

(assert (= (and b!815212 res!556721) b!815211))

(assert (= (and b!815212 c!88889) b!815204))

(assert (= (and b!815212 (not c!88889)) b!815208))

(assert (= (and b!815204 res!556720) b!815206))

(assert (= (and b!815208 c!88891) b!815205))

(assert (= (and b!815208 (not c!88891)) b!815213))

(declare-fun b_lambda!10833 () Bool)

(assert (=> (not b_lambda!10833) (not b!815203)))

(assert (=> b!815203 t!21599))

(declare-fun b_and!21347 () Bool)

(assert (= b_and!21345 (and (=> t!21599 result!7869) b_and!21347)))

(declare-fun b_lambda!10835 () Bool)

(assert (=> (not b_lambda!10835) (not b!815206)))

(assert (=> b!815206 t!21599))

(declare-fun b_and!21349 () Bool)

(assert (= b_and!21347 (and (=> t!21599 result!7869) b_and!21349)))

(assert (=> b!815204 m!756341))

(assert (=> b!815204 m!756341))

(declare-fun m!756371 () Bool)

(assert (=> b!815204 m!756371))

(assert (=> b!815202 m!756341))

(assert (=> b!815202 m!756341))

(assert (=> b!815202 m!756345))

(assert (=> b!815206 m!756347))

(assert (=> b!815206 m!756341))

(declare-fun m!756373 () Bool)

(assert (=> b!815206 m!756373))

(assert (=> b!815206 m!756341))

(assert (=> b!815206 m!756351))

(assert (=> b!815206 m!756347))

(assert (=> b!815206 m!756351))

(assert (=> b!815206 m!756353))

(declare-fun m!756375 () Bool)

(assert (=> bm!35484 m!756375))

(assert (=> b!815205 m!756375))

(declare-fun m!756377 () Bool)

(assert (=> b!815213 m!756377))

(declare-fun m!756379 () Bool)

(assert (=> b!815207 m!756379))

(assert (=> b!815211 m!756341))

(assert (=> b!815211 m!756341))

(assert (=> b!815211 m!756345))

(declare-fun m!756381 () Bool)

(assert (=> d!104277 m!756381))

(assert (=> d!104277 m!756297))

(assert (=> b!815203 m!756347))

(declare-fun m!756383 () Bool)

(assert (=> b!815203 m!756383))

(assert (=> b!815203 m!756341))

(assert (=> b!815203 m!756351))

(declare-fun m!756385 () Bool)

(assert (=> b!815203 m!756385))

(declare-fun m!756387 () Bool)

(assert (=> b!815203 m!756387))

(assert (=> b!815203 m!756383))

(declare-fun m!756389 () Bool)

(assert (=> b!815203 m!756389))

(assert (=> b!815203 m!756347))

(assert (=> b!815203 m!756351))

(assert (=> b!815203 m!756353))

(assert (=> b!815118 d!104277))

(declare-fun b!815222 () Bool)

(declare-fun e!452028 () Bool)

(declare-fun e!452029 () Bool)

(assert (=> b!815222 (= e!452028 e!452029)))

(declare-fun lt!364831 () (_ BitVec 64))

(assert (=> b!815222 (= lt!364831 (select (arr!21448 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!364832 () Unit!27734)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44777 (_ BitVec 64) (_ BitVec 32)) Unit!27734)

(assert (=> b!815222 (= lt!364832 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!364831 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!815222 (arrayContainsKey!0 _keys!976 lt!364831 #b00000000000000000000000000000000)))

(declare-fun lt!364830 () Unit!27734)

(assert (=> b!815222 (= lt!364830 lt!364832)))

(declare-fun res!556729 () Bool)

(declare-datatypes ((SeekEntryResult!8717 0))(
  ( (MissingZero!8717 (index!37239 (_ BitVec 32))) (Found!8717 (index!37240 (_ BitVec 32))) (Intermediate!8717 (undefined!9529 Bool) (index!37241 (_ BitVec 32)) (x!68608 (_ BitVec 32))) (Undefined!8717) (MissingVacant!8717 (index!37242 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44777 (_ BitVec 32)) SeekEntryResult!8717)

(assert (=> b!815222 (= res!556729 (= (seekEntryOrOpen!0 (select (arr!21448 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8717 #b00000000000000000000000000000000)))))

(assert (=> b!815222 (=> (not res!556729) (not e!452029))))

(declare-fun b!815223 () Bool)

(declare-fun call!35490 () Bool)

(assert (=> b!815223 (= e!452028 call!35490)))

(declare-fun bm!35487 () Bool)

(assert (=> bm!35487 (= call!35490 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!815224 () Bool)

(declare-fun e!452030 () Bool)

(assert (=> b!815224 (= e!452030 e!452028)))

(declare-fun c!88895 () Bool)

(assert (=> b!815224 (= c!88895 (validKeyInArray!0 (select (arr!21448 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!815225 () Bool)

(assert (=> b!815225 (= e!452029 call!35490)))

(declare-fun d!104279 () Bool)

(declare-fun res!556728 () Bool)

(assert (=> d!104279 (=> res!556728 e!452030)))

(assert (=> d!104279 (= res!556728 (bvsge #b00000000000000000000000000000000 (size!21869 _keys!976)))))

(assert (=> d!104279 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!452030)))

(assert (= (and d!104279 (not res!556728)) b!815224))

(assert (= (and b!815224 c!88895) b!815222))

(assert (= (and b!815224 (not c!88895)) b!815223))

(assert (= (and b!815222 res!556729) b!815225))

(assert (= (or b!815225 b!815223) bm!35487))

(assert (=> b!815222 m!756341))

(declare-fun m!756391 () Bool)

(assert (=> b!815222 m!756391))

(declare-fun m!756393 () Bool)

(assert (=> b!815222 m!756393))

(assert (=> b!815222 m!756341))

(declare-fun m!756395 () Bool)

(assert (=> b!815222 m!756395))

(declare-fun m!756397 () Bool)

(assert (=> bm!35487 m!756397))

(assert (=> b!815224 m!756341))

(assert (=> b!815224 m!756341))

(assert (=> b!815224 m!756345))

(assert (=> b!815119 d!104279))

(declare-fun d!104281 () Bool)

(assert (=> d!104281 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70156 d!104281))

(declare-fun d!104283 () Bool)

(assert (=> d!104283 (= (array_inv!17241 _keys!976) (bvsge (size!21869 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70156 d!104283))

(declare-fun d!104285 () Bool)

(assert (=> d!104285 (= (array_inv!17242 _values!788) (bvsge (size!21868 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70156 d!104285))

(declare-fun b!815236 () Bool)

(declare-fun e!452042 () Bool)

(declare-fun e!452039 () Bool)

(assert (=> b!815236 (= e!452042 e!452039)))

(declare-fun c!88898 () Bool)

(assert (=> b!815236 (= c!88898 (validKeyInArray!0 (select (arr!21448 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35490 () Bool)

(declare-fun call!35493 () Bool)

(assert (=> bm!35490 (= call!35493 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88898 (Cons!15281 (select (arr!21448 _keys!976) #b00000000000000000000000000000000) Nil!15282) Nil!15282)))))

(declare-fun b!815237 () Bool)

(declare-fun e!452041 () Bool)

(assert (=> b!815237 (= e!452041 e!452042)))

(declare-fun res!556736 () Bool)

(assert (=> b!815237 (=> (not res!556736) (not e!452042))))

(declare-fun e!452040 () Bool)

(assert (=> b!815237 (= res!556736 (not e!452040))))

(declare-fun res!556738 () Bool)

(assert (=> b!815237 (=> (not res!556738) (not e!452040))))

(assert (=> b!815237 (= res!556738 (validKeyInArray!0 (select (arr!21448 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104287 () Bool)

(declare-fun res!556737 () Bool)

(assert (=> d!104287 (=> res!556737 e!452041)))

(assert (=> d!104287 (= res!556737 (bvsge #b00000000000000000000000000000000 (size!21869 _keys!976)))))

(assert (=> d!104287 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15282) e!452041)))

(declare-fun b!815238 () Bool)

(assert (=> b!815238 (= e!452039 call!35493)))

(declare-fun b!815239 () Bool)

(declare-fun contains!4127 (List!15285 (_ BitVec 64)) Bool)

(assert (=> b!815239 (= e!452040 (contains!4127 Nil!15282 (select (arr!21448 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!815240 () Bool)

(assert (=> b!815240 (= e!452039 call!35493)))

(assert (= (and d!104287 (not res!556737)) b!815237))

(assert (= (and b!815237 res!556738) b!815239))

(assert (= (and b!815237 res!556736) b!815236))

(assert (= (and b!815236 c!88898) b!815240))

(assert (= (and b!815236 (not c!88898)) b!815238))

(assert (= (or b!815240 b!815238) bm!35490))

(assert (=> b!815236 m!756341))

(assert (=> b!815236 m!756341))

(assert (=> b!815236 m!756345))

(assert (=> bm!35490 m!756341))

(declare-fun m!756399 () Bool)

(assert (=> bm!35490 m!756399))

(assert (=> b!815237 m!756341))

(assert (=> b!815237 m!756341))

(assert (=> b!815237 m!756345))

(assert (=> b!815239 m!756341))

(assert (=> b!815239 m!756341))

(declare-fun m!756401 () Bool)

(assert (=> b!815239 m!756401))

(assert (=> b!815116 d!104287))

(declare-fun condMapEmpty!23032 () Bool)

(declare-fun mapDefault!23032 () ValueCell!6731)

(assert (=> mapNonEmpty!23023 (= condMapEmpty!23032 (= mapRest!23023 ((as const (Array (_ BitVec 32) ValueCell!6731)) mapDefault!23032)))))

(declare-fun e!452047 () Bool)

(declare-fun mapRes!23032 () Bool)

(assert (=> mapNonEmpty!23023 (= tp!44466 (and e!452047 mapRes!23032))))

(declare-fun b!815247 () Bool)

(declare-fun e!452048 () Bool)

(assert (=> b!815247 (= e!452048 tp_is_empty!14293)))

(declare-fun b!815248 () Bool)

(assert (=> b!815248 (= e!452047 tp_is_empty!14293)))

(declare-fun mapNonEmpty!23032 () Bool)

(declare-fun tp!44482 () Bool)

(assert (=> mapNonEmpty!23032 (= mapRes!23032 (and tp!44482 e!452048))))

(declare-fun mapKey!23032 () (_ BitVec 32))

(declare-fun mapRest!23032 () (Array (_ BitVec 32) ValueCell!6731))

(declare-fun mapValue!23032 () ValueCell!6731)

(assert (=> mapNonEmpty!23032 (= mapRest!23023 (store mapRest!23032 mapKey!23032 mapValue!23032))))

(declare-fun mapIsEmpty!23032 () Bool)

(assert (=> mapIsEmpty!23032 mapRes!23032))

(assert (= (and mapNonEmpty!23023 condMapEmpty!23032) mapIsEmpty!23032))

(assert (= (and mapNonEmpty!23023 (not condMapEmpty!23032)) mapNonEmpty!23032))

(assert (= (and mapNonEmpty!23032 ((_ is ValueCellFull!6731) mapValue!23032)) b!815247))

(assert (= (and mapNonEmpty!23023 ((_ is ValueCellFull!6731) mapDefault!23032)) b!815248))

(declare-fun m!756403 () Bool)

(assert (=> mapNonEmpty!23032 m!756403))

(declare-fun b_lambda!10837 () Bool)

(assert (= b_lambda!10833 (or (and start!70156 b_free!12583) b_lambda!10837)))

(declare-fun b_lambda!10839 () Bool)

(assert (= b_lambda!10831 (or (and start!70156 b_free!12583) b_lambda!10839)))

(declare-fun b_lambda!10841 () Bool)

(assert (= b_lambda!10829 (or (and start!70156 b_free!12583) b_lambda!10841)))

(declare-fun b_lambda!10843 () Bool)

(assert (= b_lambda!10835 (or (and start!70156 b_free!12583) b_lambda!10843)))

(check-sat (not b_lambda!10843) (not b!815222) (not b!815237) (not b!815197) (not b!815236) (not b!815190) (not bm!35483) (not b!815202) (not b_lambda!10839) (not b!815191) (not bm!35487) (not b!815188) (not b!815211) (not b!815224) (not b!815206) (not b!815239) (not b!815199) (not b_lambda!10837) (not mapNonEmpty!23032) (not b!815189) (not d!104273) (not d!104277) (not b_lambda!10841) (not b!815203) (not b!815207) (not d!104275) (not bm!35490) (not b!815205) (not b!815204) (not b_next!12583) (not b!815193) (not b!815192) tp_is_empty!14293 (not b!815213) b_and!21349 (not bm!35484))
(check-sat b_and!21349 (not b_next!12583))
