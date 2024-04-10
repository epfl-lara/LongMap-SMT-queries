; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105000 () Bool)

(assert start!105000)

(declare-fun b_free!26769 () Bool)

(declare-fun b_next!26769 () Bool)

(assert (=> start!105000 (= b_free!26769 (not b_next!26769))))

(declare-fun tp!93803 () Bool)

(declare-fun b_and!44555 () Bool)

(assert (=> start!105000 (= tp!93803 b_and!44555)))

(declare-fun b!1251531 () Bool)

(declare-fun e!710703 () Bool)

(declare-fun e!710709 () Bool)

(assert (=> b!1251531 (= e!710703 e!710709)))

(declare-fun res!834757 () Bool)

(assert (=> b!1251531 (=> res!834757 e!710709)))

(declare-datatypes ((V!47593 0))(
  ( (V!47594 (val!15898 Int)) )
))
(declare-datatypes ((tuple2!20500 0))(
  ( (tuple2!20501 (_1!10261 (_ BitVec 64)) (_2!10261 V!47593)) )
))
(declare-datatypes ((List!27732 0))(
  ( (Nil!27729) (Cons!27728 (h!28937 tuple2!20500) (t!41207 List!27732)) )
))
(declare-datatypes ((ListLongMap!18373 0))(
  ( (ListLongMap!18374 (toList!9202 List!27732)) )
))
(declare-fun lt!564873 () ListLongMap!18373)

(declare-fun contains!7510 (ListLongMap!18373 (_ BitVec 64)) Bool)

(assert (=> b!1251531 (= res!834757 (contains!7510 lt!564873 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47593)

(declare-datatypes ((array!81006 0))(
  ( (array!81007 (arr!39068 (Array (_ BitVec 32) (_ BitVec 64))) (size!39604 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81006)

(declare-datatypes ((ValueCell!15072 0))(
  ( (ValueCellFull!15072 (v!18595 V!47593)) (EmptyCell!15072) )
))
(declare-datatypes ((array!81008 0))(
  ( (array!81009 (arr!39069 (Array (_ BitVec 32) ValueCell!15072)) (size!39605 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81008)

(declare-fun minValueBefore!43 () V!47593)

(declare-fun getCurrentListMap!4470 (array!81006 array!81008 (_ BitVec 32) (_ BitVec 32) V!47593 V!47593 (_ BitVec 32) Int) ListLongMap!18373)

(assert (=> b!1251531 (= lt!564873 (getCurrentListMap!4470 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49273 () Bool)

(declare-fun mapRes!49273 () Bool)

(assert (=> mapIsEmpty!49273 mapRes!49273))

(declare-fun mapNonEmpty!49273 () Bool)

(declare-fun tp!93802 () Bool)

(declare-fun e!710706 () Bool)

(assert (=> mapNonEmpty!49273 (= mapRes!49273 (and tp!93802 e!710706))))

(declare-fun mapValue!49273 () ValueCell!15072)

(declare-fun mapRest!49273 () (Array (_ BitVec 32) ValueCell!15072))

(declare-fun mapKey!49273 () (_ BitVec 32))

(assert (=> mapNonEmpty!49273 (= (arr!39069 _values!914) (store mapRest!49273 mapKey!49273 mapValue!49273))))

(declare-fun b!1251532 () Bool)

(declare-fun res!834754 () Bool)

(declare-fun e!710707 () Bool)

(assert (=> b!1251532 (=> (not res!834754) (not e!710707))))

(declare-datatypes ((List!27733 0))(
  ( (Nil!27730) (Cons!27729 (h!28938 (_ BitVec 64)) (t!41208 List!27733)) )
))
(declare-fun arrayNoDuplicates!0 (array!81006 (_ BitVec 32) List!27733) Bool)

(assert (=> b!1251532 (= res!834754 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27730))))

(declare-fun b!1251533 () Bool)

(declare-fun tp_is_empty!31671 () Bool)

(assert (=> b!1251533 (= e!710706 tp_is_empty!31671)))

(declare-fun b!1251534 () Bool)

(assert (=> b!1251534 (= e!710707 (not e!710703))))

(declare-fun res!834758 () Bool)

(assert (=> b!1251534 (=> res!834758 e!710703)))

(assert (=> b!1251534 (= res!834758 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564875 () ListLongMap!18373)

(declare-fun lt!564876 () ListLongMap!18373)

(assert (=> b!1251534 (= lt!564875 lt!564876)))

(declare-datatypes ((Unit!41591 0))(
  ( (Unit!41592) )
))
(declare-fun lt!564872 () Unit!41591)

(declare-fun minValueAfter!43 () V!47593)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!962 (array!81006 array!81008 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47593 V!47593 V!47593 V!47593 (_ BitVec 32) Int) Unit!41591)

(assert (=> b!1251534 (= lt!564872 (lemmaNoChangeToArrayThenSameMapNoExtras!962 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5598 (array!81006 array!81008 (_ BitVec 32) (_ BitVec 32) V!47593 V!47593 (_ BitVec 32) Int) ListLongMap!18373)

(assert (=> b!1251534 (= lt!564876 (getCurrentListMapNoExtraKeys!5598 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251534 (= lt!564875 (getCurrentListMapNoExtraKeys!5598 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!834756 () Bool)

(assert (=> start!105000 (=> (not res!834756) (not e!710707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105000 (= res!834756 (validMask!0 mask!1466))))

(assert (=> start!105000 e!710707))

(assert (=> start!105000 true))

(assert (=> start!105000 tp!93803))

(assert (=> start!105000 tp_is_empty!31671))

(declare-fun array_inv!29799 (array!81006) Bool)

(assert (=> start!105000 (array_inv!29799 _keys!1118)))

(declare-fun e!710704 () Bool)

(declare-fun array_inv!29800 (array!81008) Bool)

(assert (=> start!105000 (and (array_inv!29800 _values!914) e!710704)))

(declare-fun b!1251535 () Bool)

(declare-fun res!834755 () Bool)

(assert (=> b!1251535 (=> (not res!834755) (not e!710707))))

(assert (=> b!1251535 (= res!834755 (and (= (size!39605 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39604 _keys!1118) (size!39605 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251536 () Bool)

(assert (=> b!1251536 (= e!710709 (bvsle #b00000000000000000000000000000000 (size!39604 _keys!1118)))))

(declare-fun -!2020 (ListLongMap!18373 (_ BitVec 64)) ListLongMap!18373)

(assert (=> b!1251536 (= (-!2020 lt!564873 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564873)))

(declare-fun lt!564874 () Unit!41591)

(declare-fun removeNotPresentStillSame!115 (ListLongMap!18373 (_ BitVec 64)) Unit!41591)

(assert (=> b!1251536 (= lt!564874 (removeNotPresentStillSame!115 lt!564873 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1251537 () Bool)

(declare-fun e!710705 () Bool)

(assert (=> b!1251537 (= e!710705 tp_is_empty!31671)))

(declare-fun b!1251538 () Bool)

(assert (=> b!1251538 (= e!710704 (and e!710705 mapRes!49273))))

(declare-fun condMapEmpty!49273 () Bool)

(declare-fun mapDefault!49273 () ValueCell!15072)

(assert (=> b!1251538 (= condMapEmpty!49273 (= (arr!39069 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15072)) mapDefault!49273)))))

(declare-fun b!1251539 () Bool)

(declare-fun res!834753 () Bool)

(assert (=> b!1251539 (=> (not res!834753) (not e!710707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81006 (_ BitVec 32)) Bool)

(assert (=> b!1251539 (= res!834753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105000 res!834756) b!1251535))

(assert (= (and b!1251535 res!834755) b!1251539))

(assert (= (and b!1251539 res!834753) b!1251532))

(assert (= (and b!1251532 res!834754) b!1251534))

(assert (= (and b!1251534 (not res!834758)) b!1251531))

(assert (= (and b!1251531 (not res!834757)) b!1251536))

(assert (= (and b!1251538 condMapEmpty!49273) mapIsEmpty!49273))

(assert (= (and b!1251538 (not condMapEmpty!49273)) mapNonEmpty!49273))

(get-info :version)

(assert (= (and mapNonEmpty!49273 ((_ is ValueCellFull!15072) mapValue!49273)) b!1251533))

(assert (= (and b!1251538 ((_ is ValueCellFull!15072) mapDefault!49273)) b!1251537))

(assert (= start!105000 b!1251538))

(declare-fun m!1152295 () Bool)

(assert (=> start!105000 m!1152295))

(declare-fun m!1152297 () Bool)

(assert (=> start!105000 m!1152297))

(declare-fun m!1152299 () Bool)

(assert (=> start!105000 m!1152299))

(declare-fun m!1152301 () Bool)

(assert (=> b!1251534 m!1152301))

(declare-fun m!1152303 () Bool)

(assert (=> b!1251534 m!1152303))

(declare-fun m!1152305 () Bool)

(assert (=> b!1251534 m!1152305))

(declare-fun m!1152307 () Bool)

(assert (=> b!1251539 m!1152307))

(declare-fun m!1152309 () Bool)

(assert (=> b!1251531 m!1152309))

(declare-fun m!1152311 () Bool)

(assert (=> b!1251531 m!1152311))

(declare-fun m!1152313 () Bool)

(assert (=> b!1251536 m!1152313))

(declare-fun m!1152315 () Bool)

(assert (=> b!1251536 m!1152315))

(declare-fun m!1152317 () Bool)

(assert (=> mapNonEmpty!49273 m!1152317))

(declare-fun m!1152319 () Bool)

(assert (=> b!1251532 m!1152319))

(check-sat (not b!1251536) (not b!1251539) (not mapNonEmpty!49273) b_and!44555 (not b!1251531) (not b!1251534) (not b_next!26769) (not b!1251532) (not start!105000) tp_is_empty!31671)
(check-sat b_and!44555 (not b_next!26769))
(get-model)

(declare-fun d!137943 () Bool)

(assert (=> d!137943 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105000 d!137943))

(declare-fun d!137945 () Bool)

(assert (=> d!137945 (= (array_inv!29799 _keys!1118) (bvsge (size!39604 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105000 d!137945))

(declare-fun d!137947 () Bool)

(assert (=> d!137947 (= (array_inv!29800 _values!914) (bvsge (size!39605 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105000 d!137947))

(declare-fun b!1251577 () Bool)

(declare-fun e!710741 () Bool)

(declare-fun e!710739 () Bool)

(assert (=> b!1251577 (= e!710741 e!710739)))

(declare-fun c!122192 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1251577 (= c!122192 (validKeyInArray!0 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1251579 () Bool)

(declare-fun call!61622 () Bool)

(assert (=> b!1251579 (= e!710739 call!61622)))

(declare-fun b!1251580 () Bool)

(declare-fun e!710742 () Bool)

(assert (=> b!1251580 (= e!710742 e!710741)))

(declare-fun res!834783 () Bool)

(assert (=> b!1251580 (=> (not res!834783) (not e!710741))))

(declare-fun e!710740 () Bool)

(assert (=> b!1251580 (= res!834783 (not e!710740))))

(declare-fun res!834784 () Bool)

(assert (=> b!1251580 (=> (not res!834784) (not e!710740))))

(assert (=> b!1251580 (= res!834784 (validKeyInArray!0 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61619 () Bool)

(assert (=> bm!61619 (= call!61622 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122192 (Cons!27729 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000) Nil!27730) Nil!27730)))))

(declare-fun b!1251581 () Bool)

(declare-fun contains!7512 (List!27733 (_ BitVec 64)) Bool)

(assert (=> b!1251581 (= e!710740 (contains!7512 Nil!27730 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1251578 () Bool)

(assert (=> b!1251578 (= e!710739 call!61622)))

(declare-fun d!137949 () Bool)

(declare-fun res!834785 () Bool)

(assert (=> d!137949 (=> res!834785 e!710742)))

(assert (=> d!137949 (= res!834785 (bvsge #b00000000000000000000000000000000 (size!39604 _keys!1118)))))

(assert (=> d!137949 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27730) e!710742)))

(assert (= (and d!137949 (not res!834785)) b!1251580))

(assert (= (and b!1251580 res!834784) b!1251581))

(assert (= (and b!1251580 res!834783) b!1251577))

(assert (= (and b!1251577 c!122192) b!1251578))

(assert (= (and b!1251577 (not c!122192)) b!1251579))

(assert (= (or b!1251578 b!1251579) bm!61619))

(declare-fun m!1152347 () Bool)

(assert (=> b!1251577 m!1152347))

(assert (=> b!1251577 m!1152347))

(declare-fun m!1152349 () Bool)

(assert (=> b!1251577 m!1152349))

(assert (=> b!1251580 m!1152347))

(assert (=> b!1251580 m!1152347))

(assert (=> b!1251580 m!1152349))

(assert (=> bm!61619 m!1152347))

(declare-fun m!1152351 () Bool)

(assert (=> bm!61619 m!1152351))

(assert (=> b!1251581 m!1152347))

(assert (=> b!1251581 m!1152347))

(declare-fun m!1152353 () Bool)

(assert (=> b!1251581 m!1152353))

(assert (=> b!1251532 d!137949))

(declare-fun d!137951 () Bool)

(assert (=> d!137951 (= (getCurrentListMapNoExtraKeys!5598 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5598 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564894 () Unit!41591)

(declare-fun choose!1849 (array!81006 array!81008 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47593 V!47593 V!47593 V!47593 (_ BitVec 32) Int) Unit!41591)

(assert (=> d!137951 (= lt!564894 (choose!1849 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!137951 (validMask!0 mask!1466)))

(assert (=> d!137951 (= (lemmaNoChangeToArrayThenSameMapNoExtras!962 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!564894)))

(declare-fun bs!35337 () Bool)

(assert (= bs!35337 d!137951))

(assert (=> bs!35337 m!1152305))

(assert (=> bs!35337 m!1152303))

(declare-fun m!1152355 () Bool)

(assert (=> bs!35337 m!1152355))

(assert (=> bs!35337 m!1152295))

(assert (=> b!1251534 d!137951))

(declare-fun b!1251606 () Bool)

(assert (=> b!1251606 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39604 _keys!1118)))))

(assert (=> b!1251606 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39605 _values!914)))))

(declare-fun e!710763 () Bool)

(declare-fun lt!564911 () ListLongMap!18373)

(declare-fun apply!982 (ListLongMap!18373 (_ BitVec 64)) V!47593)

(declare-fun get!20023 (ValueCell!15072 V!47593) V!47593)

(declare-fun dynLambda!3380 (Int (_ BitVec 64)) V!47593)

(assert (=> b!1251606 (= e!710763 (= (apply!982 lt!564911 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000)) (get!20023 (select (arr!39069 _values!914) #b00000000000000000000000000000000) (dynLambda!3380 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1251607 () Bool)

(declare-fun lt!564910 () Unit!41591)

(declare-fun lt!564913 () Unit!41591)

(assert (=> b!1251607 (= lt!564910 lt!564913)))

(declare-fun lt!564915 () V!47593)

(declare-fun lt!564912 () (_ BitVec 64))

(declare-fun lt!564909 () (_ BitVec 64))

(declare-fun lt!564914 () ListLongMap!18373)

(declare-fun +!4138 (ListLongMap!18373 tuple2!20500) ListLongMap!18373)

(assert (=> b!1251607 (not (contains!7510 (+!4138 lt!564914 (tuple2!20501 lt!564909 lt!564915)) lt!564912))))

(declare-fun addStillNotContains!310 (ListLongMap!18373 (_ BitVec 64) V!47593 (_ BitVec 64)) Unit!41591)

(assert (=> b!1251607 (= lt!564913 (addStillNotContains!310 lt!564914 lt!564909 lt!564915 lt!564912))))

(assert (=> b!1251607 (= lt!564912 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1251607 (= lt!564915 (get!20023 (select (arr!39069 _values!914) #b00000000000000000000000000000000) (dynLambda!3380 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1251607 (= lt!564909 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61625 () ListLongMap!18373)

(assert (=> b!1251607 (= lt!564914 call!61625)))

(declare-fun e!710758 () ListLongMap!18373)

(assert (=> b!1251607 (= e!710758 (+!4138 call!61625 (tuple2!20501 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000) (get!20023 (select (arr!39069 _values!914) #b00000000000000000000000000000000) (dynLambda!3380 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1251608 () Bool)

(declare-fun e!710762 () Bool)

(declare-fun isEmpty!1024 (ListLongMap!18373) Bool)

(assert (=> b!1251608 (= e!710762 (isEmpty!1024 lt!564911))))

(declare-fun b!1251609 () Bool)

(declare-fun e!710760 () Bool)

(assert (=> b!1251609 (= e!710760 e!710762)))

(declare-fun c!122202 () Bool)

(assert (=> b!1251609 (= c!122202 (bvslt #b00000000000000000000000000000000 (size!39604 _keys!1118)))))

(declare-fun b!1251610 () Bool)

(assert (=> b!1251610 (= e!710762 (= lt!564911 (getCurrentListMapNoExtraKeys!5598 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1251611 () Bool)

(declare-fun e!710759 () ListLongMap!18373)

(assert (=> b!1251611 (= e!710759 e!710758)))

(declare-fun c!122203 () Bool)

(assert (=> b!1251611 (= c!122203 (validKeyInArray!0 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1251612 () Bool)

(declare-fun e!710761 () Bool)

(assert (=> b!1251612 (= e!710761 e!710760)))

(declare-fun c!122204 () Bool)

(declare-fun e!710757 () Bool)

(assert (=> b!1251612 (= c!122204 e!710757)))

(declare-fun res!834797 () Bool)

(assert (=> b!1251612 (=> (not res!834797) (not e!710757))))

(assert (=> b!1251612 (= res!834797 (bvslt #b00000000000000000000000000000000 (size!39604 _keys!1118)))))

(declare-fun b!1251613 () Bool)

(assert (=> b!1251613 (= e!710758 call!61625)))

(declare-fun bm!61622 () Bool)

(assert (=> bm!61622 (= call!61625 (getCurrentListMapNoExtraKeys!5598 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1251614 () Bool)

(assert (=> b!1251614 (= e!710759 (ListLongMap!18374 Nil!27729))))

(declare-fun b!1251615 () Bool)

(assert (=> b!1251615 (= e!710760 e!710763)))

(assert (=> b!1251615 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39604 _keys!1118)))))

(declare-fun res!834795 () Bool)

(assert (=> b!1251615 (= res!834795 (contains!7510 lt!564911 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1251615 (=> (not res!834795) (not e!710763))))

(declare-fun d!137953 () Bool)

(assert (=> d!137953 e!710761))

(declare-fun res!834794 () Bool)

(assert (=> d!137953 (=> (not res!834794) (not e!710761))))

(assert (=> d!137953 (= res!834794 (not (contains!7510 lt!564911 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137953 (= lt!564911 e!710759)))

(declare-fun c!122201 () Bool)

(assert (=> d!137953 (= c!122201 (bvsge #b00000000000000000000000000000000 (size!39604 _keys!1118)))))

(assert (=> d!137953 (validMask!0 mask!1466)))

(assert (=> d!137953 (= (getCurrentListMapNoExtraKeys!5598 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!564911)))

(declare-fun b!1251616 () Bool)

(declare-fun res!834796 () Bool)

(assert (=> b!1251616 (=> (not res!834796) (not e!710761))))

(assert (=> b!1251616 (= res!834796 (not (contains!7510 lt!564911 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1251617 () Bool)

(assert (=> b!1251617 (= e!710757 (validKeyInArray!0 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1251617 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!137953 c!122201) b!1251614))

(assert (= (and d!137953 (not c!122201)) b!1251611))

(assert (= (and b!1251611 c!122203) b!1251607))

(assert (= (and b!1251611 (not c!122203)) b!1251613))

(assert (= (or b!1251607 b!1251613) bm!61622))

(assert (= (and d!137953 res!834794) b!1251616))

(assert (= (and b!1251616 res!834796) b!1251612))

(assert (= (and b!1251612 res!834797) b!1251617))

(assert (= (and b!1251612 c!122204) b!1251615))

(assert (= (and b!1251612 (not c!122204)) b!1251609))

(assert (= (and b!1251615 res!834795) b!1251606))

(assert (= (and b!1251609 c!122202) b!1251610))

(assert (= (and b!1251609 (not c!122202)) b!1251608))

(declare-fun b_lambda!22547 () Bool)

(assert (=> (not b_lambda!22547) (not b!1251606)))

(declare-fun t!41211 () Bool)

(declare-fun tb!11291 () Bool)

(assert (=> (and start!105000 (= defaultEntry!922 defaultEntry!922) t!41211) tb!11291))

(declare-fun result!23281 () Bool)

(assert (=> tb!11291 (= result!23281 tp_is_empty!31671)))

(assert (=> b!1251606 t!41211))

(declare-fun b_and!44559 () Bool)

(assert (= b_and!44555 (and (=> t!41211 result!23281) b_and!44559)))

(declare-fun b_lambda!22549 () Bool)

(assert (=> (not b_lambda!22549) (not b!1251607)))

(assert (=> b!1251607 t!41211))

(declare-fun b_and!44561 () Bool)

(assert (= b_and!44559 (and (=> t!41211 result!23281) b_and!44561)))

(declare-fun m!1152357 () Bool)

(assert (=> b!1251610 m!1152357))

(assert (=> b!1251611 m!1152347))

(assert (=> b!1251611 m!1152347))

(assert (=> b!1251611 m!1152349))

(assert (=> bm!61622 m!1152357))

(declare-fun m!1152359 () Bool)

(assert (=> b!1251607 m!1152359))

(declare-fun m!1152361 () Bool)

(assert (=> b!1251607 m!1152361))

(declare-fun m!1152363 () Bool)

(assert (=> b!1251607 m!1152363))

(declare-fun m!1152365 () Bool)

(assert (=> b!1251607 m!1152365))

(declare-fun m!1152367 () Bool)

(assert (=> b!1251607 m!1152367))

(declare-fun m!1152369 () Bool)

(assert (=> b!1251607 m!1152369))

(declare-fun m!1152371 () Bool)

(assert (=> b!1251607 m!1152371))

(assert (=> b!1251607 m!1152361))

(assert (=> b!1251607 m!1152359))

(assert (=> b!1251607 m!1152367))

(assert (=> b!1251607 m!1152347))

(declare-fun m!1152373 () Bool)

(assert (=> b!1251608 m!1152373))

(declare-fun m!1152375 () Bool)

(assert (=> b!1251616 m!1152375))

(assert (=> b!1251615 m!1152347))

(assert (=> b!1251615 m!1152347))

(declare-fun m!1152377 () Bool)

(assert (=> b!1251615 m!1152377))

(assert (=> b!1251617 m!1152347))

(assert (=> b!1251617 m!1152347))

(assert (=> b!1251617 m!1152349))

(assert (=> b!1251606 m!1152347))

(declare-fun m!1152379 () Bool)

(assert (=> b!1251606 m!1152379))

(assert (=> b!1251606 m!1152359))

(assert (=> b!1251606 m!1152361))

(assert (=> b!1251606 m!1152363))

(assert (=> b!1251606 m!1152361))

(assert (=> b!1251606 m!1152359))

(assert (=> b!1251606 m!1152347))

(declare-fun m!1152381 () Bool)

(assert (=> d!137953 m!1152381))

(assert (=> d!137953 m!1152295))

(assert (=> b!1251534 d!137953))

(declare-fun b!1251620 () Bool)

(assert (=> b!1251620 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39604 _keys!1118)))))

(assert (=> b!1251620 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39605 _values!914)))))

(declare-fun lt!564918 () ListLongMap!18373)

(declare-fun e!710770 () Bool)

(assert (=> b!1251620 (= e!710770 (= (apply!982 lt!564918 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000)) (get!20023 (select (arr!39069 _values!914) #b00000000000000000000000000000000) (dynLambda!3380 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1251621 () Bool)

(declare-fun lt!564917 () Unit!41591)

(declare-fun lt!564920 () Unit!41591)

(assert (=> b!1251621 (= lt!564917 lt!564920)))

(declare-fun lt!564919 () (_ BitVec 64))

(declare-fun lt!564921 () ListLongMap!18373)

(declare-fun lt!564916 () (_ BitVec 64))

(declare-fun lt!564922 () V!47593)

(assert (=> b!1251621 (not (contains!7510 (+!4138 lt!564921 (tuple2!20501 lt!564916 lt!564922)) lt!564919))))

(assert (=> b!1251621 (= lt!564920 (addStillNotContains!310 lt!564921 lt!564916 lt!564922 lt!564919))))

(assert (=> b!1251621 (= lt!564919 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1251621 (= lt!564922 (get!20023 (select (arr!39069 _values!914) #b00000000000000000000000000000000) (dynLambda!3380 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1251621 (= lt!564916 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61626 () ListLongMap!18373)

(assert (=> b!1251621 (= lt!564921 call!61626)))

(declare-fun e!710765 () ListLongMap!18373)

(assert (=> b!1251621 (= e!710765 (+!4138 call!61626 (tuple2!20501 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000) (get!20023 (select (arr!39069 _values!914) #b00000000000000000000000000000000) (dynLambda!3380 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1251622 () Bool)

(declare-fun e!710769 () Bool)

(assert (=> b!1251622 (= e!710769 (isEmpty!1024 lt!564918))))

(declare-fun b!1251623 () Bool)

(declare-fun e!710767 () Bool)

(assert (=> b!1251623 (= e!710767 e!710769)))

(declare-fun c!122206 () Bool)

(assert (=> b!1251623 (= c!122206 (bvslt #b00000000000000000000000000000000 (size!39604 _keys!1118)))))

(declare-fun b!1251624 () Bool)

(assert (=> b!1251624 (= e!710769 (= lt!564918 (getCurrentListMapNoExtraKeys!5598 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1251625 () Bool)

(declare-fun e!710766 () ListLongMap!18373)

(assert (=> b!1251625 (= e!710766 e!710765)))

(declare-fun c!122207 () Bool)

(assert (=> b!1251625 (= c!122207 (validKeyInArray!0 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1251626 () Bool)

(declare-fun e!710768 () Bool)

(assert (=> b!1251626 (= e!710768 e!710767)))

(declare-fun c!122208 () Bool)

(declare-fun e!710764 () Bool)

(assert (=> b!1251626 (= c!122208 e!710764)))

(declare-fun res!834801 () Bool)

(assert (=> b!1251626 (=> (not res!834801) (not e!710764))))

(assert (=> b!1251626 (= res!834801 (bvslt #b00000000000000000000000000000000 (size!39604 _keys!1118)))))

(declare-fun b!1251627 () Bool)

(assert (=> b!1251627 (= e!710765 call!61626)))

(declare-fun bm!61623 () Bool)

(assert (=> bm!61623 (= call!61626 (getCurrentListMapNoExtraKeys!5598 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1251628 () Bool)

(assert (=> b!1251628 (= e!710766 (ListLongMap!18374 Nil!27729))))

(declare-fun b!1251629 () Bool)

(assert (=> b!1251629 (= e!710767 e!710770)))

(assert (=> b!1251629 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39604 _keys!1118)))))

(declare-fun res!834799 () Bool)

(assert (=> b!1251629 (= res!834799 (contains!7510 lt!564918 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1251629 (=> (not res!834799) (not e!710770))))

(declare-fun d!137955 () Bool)

(assert (=> d!137955 e!710768))

(declare-fun res!834798 () Bool)

(assert (=> d!137955 (=> (not res!834798) (not e!710768))))

(assert (=> d!137955 (= res!834798 (not (contains!7510 lt!564918 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137955 (= lt!564918 e!710766)))

(declare-fun c!122205 () Bool)

(assert (=> d!137955 (= c!122205 (bvsge #b00000000000000000000000000000000 (size!39604 _keys!1118)))))

(assert (=> d!137955 (validMask!0 mask!1466)))

(assert (=> d!137955 (= (getCurrentListMapNoExtraKeys!5598 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!564918)))

(declare-fun b!1251630 () Bool)

(declare-fun res!834800 () Bool)

(assert (=> b!1251630 (=> (not res!834800) (not e!710768))))

(assert (=> b!1251630 (= res!834800 (not (contains!7510 lt!564918 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1251631 () Bool)

(assert (=> b!1251631 (= e!710764 (validKeyInArray!0 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1251631 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!137955 c!122205) b!1251628))

(assert (= (and d!137955 (not c!122205)) b!1251625))

(assert (= (and b!1251625 c!122207) b!1251621))

(assert (= (and b!1251625 (not c!122207)) b!1251627))

(assert (= (or b!1251621 b!1251627) bm!61623))

(assert (= (and d!137955 res!834798) b!1251630))

(assert (= (and b!1251630 res!834800) b!1251626))

(assert (= (and b!1251626 res!834801) b!1251631))

(assert (= (and b!1251626 c!122208) b!1251629))

(assert (= (and b!1251626 (not c!122208)) b!1251623))

(assert (= (and b!1251629 res!834799) b!1251620))

(assert (= (and b!1251623 c!122206) b!1251624))

(assert (= (and b!1251623 (not c!122206)) b!1251622))

(declare-fun b_lambda!22551 () Bool)

(assert (=> (not b_lambda!22551) (not b!1251620)))

(assert (=> b!1251620 t!41211))

(declare-fun b_and!44563 () Bool)

(assert (= b_and!44561 (and (=> t!41211 result!23281) b_and!44563)))

(declare-fun b_lambda!22553 () Bool)

(assert (=> (not b_lambda!22553) (not b!1251621)))

(assert (=> b!1251621 t!41211))

(declare-fun b_and!44565 () Bool)

(assert (= b_and!44563 (and (=> t!41211 result!23281) b_and!44565)))

(declare-fun m!1152383 () Bool)

(assert (=> b!1251624 m!1152383))

(assert (=> b!1251625 m!1152347))

(assert (=> b!1251625 m!1152347))

(assert (=> b!1251625 m!1152349))

(assert (=> bm!61623 m!1152383))

(assert (=> b!1251621 m!1152359))

(assert (=> b!1251621 m!1152361))

(assert (=> b!1251621 m!1152363))

(declare-fun m!1152385 () Bool)

(assert (=> b!1251621 m!1152385))

(declare-fun m!1152387 () Bool)

(assert (=> b!1251621 m!1152387))

(declare-fun m!1152389 () Bool)

(assert (=> b!1251621 m!1152389))

(declare-fun m!1152391 () Bool)

(assert (=> b!1251621 m!1152391))

(assert (=> b!1251621 m!1152361))

(assert (=> b!1251621 m!1152359))

(assert (=> b!1251621 m!1152387))

(assert (=> b!1251621 m!1152347))

(declare-fun m!1152393 () Bool)

(assert (=> b!1251622 m!1152393))

(declare-fun m!1152395 () Bool)

(assert (=> b!1251630 m!1152395))

(assert (=> b!1251629 m!1152347))

(assert (=> b!1251629 m!1152347))

(declare-fun m!1152397 () Bool)

(assert (=> b!1251629 m!1152397))

(assert (=> b!1251631 m!1152347))

(assert (=> b!1251631 m!1152347))

(assert (=> b!1251631 m!1152349))

(assert (=> b!1251620 m!1152347))

(declare-fun m!1152399 () Bool)

(assert (=> b!1251620 m!1152399))

(assert (=> b!1251620 m!1152359))

(assert (=> b!1251620 m!1152361))

(assert (=> b!1251620 m!1152363))

(assert (=> b!1251620 m!1152361))

(assert (=> b!1251620 m!1152359))

(assert (=> b!1251620 m!1152347))

(declare-fun m!1152401 () Bool)

(assert (=> d!137955 m!1152401))

(assert (=> d!137955 m!1152295))

(assert (=> b!1251534 d!137955))

(declare-fun d!137957 () Bool)

(declare-fun e!710775 () Bool)

(assert (=> d!137957 e!710775))

(declare-fun res!834804 () Bool)

(assert (=> d!137957 (=> res!834804 e!710775)))

(declare-fun lt!564931 () Bool)

(assert (=> d!137957 (= res!834804 (not lt!564931))))

(declare-fun lt!564933 () Bool)

(assert (=> d!137957 (= lt!564931 lt!564933)))

(declare-fun lt!564934 () Unit!41591)

(declare-fun e!710776 () Unit!41591)

(assert (=> d!137957 (= lt!564934 e!710776)))

(declare-fun c!122211 () Bool)

(assert (=> d!137957 (= c!122211 lt!564933)))

(declare-fun containsKey!619 (List!27732 (_ BitVec 64)) Bool)

(assert (=> d!137957 (= lt!564933 (containsKey!619 (toList!9202 lt!564873) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!137957 (= (contains!7510 lt!564873 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564931)))

(declare-fun b!1251638 () Bool)

(declare-fun lt!564932 () Unit!41591)

(assert (=> b!1251638 (= e!710776 lt!564932)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!428 (List!27732 (_ BitVec 64)) Unit!41591)

(assert (=> b!1251638 (= lt!564932 (lemmaContainsKeyImpliesGetValueByKeyDefined!428 (toList!9202 lt!564873) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!704 0))(
  ( (Some!703 (v!18597 V!47593)) (None!702) )
))
(declare-fun isDefined!467 (Option!704) Bool)

(declare-fun getValueByKey!653 (List!27732 (_ BitVec 64)) Option!704)

(assert (=> b!1251638 (isDefined!467 (getValueByKey!653 (toList!9202 lt!564873) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1251639 () Bool)

(declare-fun Unit!41595 () Unit!41591)

(assert (=> b!1251639 (= e!710776 Unit!41595)))

(declare-fun b!1251640 () Bool)

(assert (=> b!1251640 (= e!710775 (isDefined!467 (getValueByKey!653 (toList!9202 lt!564873) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!137957 c!122211) b!1251638))

(assert (= (and d!137957 (not c!122211)) b!1251639))

(assert (= (and d!137957 (not res!834804)) b!1251640))

(declare-fun m!1152403 () Bool)

(assert (=> d!137957 m!1152403))

(declare-fun m!1152405 () Bool)

(assert (=> b!1251638 m!1152405))

(declare-fun m!1152407 () Bool)

(assert (=> b!1251638 m!1152407))

(assert (=> b!1251638 m!1152407))

(declare-fun m!1152409 () Bool)

(assert (=> b!1251638 m!1152409))

(assert (=> b!1251640 m!1152407))

(assert (=> b!1251640 m!1152407))

(assert (=> b!1251640 m!1152409))

(assert (=> b!1251531 d!137957))

(declare-fun b!1251683 () Bool)

(declare-fun e!710809 () ListLongMap!18373)

(declare-fun call!61646 () ListLongMap!18373)

(assert (=> b!1251683 (= e!710809 (+!4138 call!61646 (tuple2!20501 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1251685 () Bool)

(declare-fun e!710808 () Unit!41591)

(declare-fun Unit!41596 () Unit!41591)

(assert (=> b!1251685 (= e!710808 Unit!41596)))

(declare-fun bm!61638 () Bool)

(declare-fun call!61645 () ListLongMap!18373)

(declare-fun call!61643 () ListLongMap!18373)

(assert (=> bm!61638 (= call!61645 call!61643)))

(declare-fun b!1251686 () Bool)

(declare-fun e!710814 () Bool)

(declare-fun lt!564993 () ListLongMap!18373)

(assert (=> b!1251686 (= e!710814 (= (apply!982 lt!564993 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1251687 () Bool)

(declare-fun e!710815 () Bool)

(declare-fun call!61642 () Bool)

(assert (=> b!1251687 (= e!710815 (not call!61642))))

(declare-fun b!1251688 () Bool)

(declare-fun c!122224 () Bool)

(assert (=> b!1251688 (= c!122224 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!710805 () ListLongMap!18373)

(declare-fun e!710804 () ListLongMap!18373)

(assert (=> b!1251688 (= e!710805 e!710804)))

(declare-fun b!1251689 () Bool)

(declare-fun e!710810 () Bool)

(declare-fun call!61647 () Bool)

(assert (=> b!1251689 (= e!710810 (not call!61647))))

(declare-fun e!710806 () Bool)

(declare-fun b!1251690 () Bool)

(assert (=> b!1251690 (= e!710806 (= (apply!982 lt!564993 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000)) (get!20023 (select (arr!39069 _values!914) #b00000000000000000000000000000000) (dynLambda!3380 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1251690 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39605 _values!914)))))

(assert (=> b!1251690 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39604 _keys!1118)))))

(declare-fun b!1251691 () Bool)

(assert (=> b!1251691 (= e!710815 e!710814)))

(declare-fun res!834827 () Bool)

(assert (=> b!1251691 (= res!834827 call!61642)))

(assert (=> b!1251691 (=> (not res!834827) (not e!710814))))

(declare-fun b!1251692 () Bool)

(declare-fun lt!565000 () Unit!41591)

(assert (=> b!1251692 (= e!710808 lt!565000)))

(declare-fun lt!564986 () ListLongMap!18373)

(assert (=> b!1251692 (= lt!564986 (getCurrentListMapNoExtraKeys!5598 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564987 () (_ BitVec 64))

(assert (=> b!1251692 (= lt!564987 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!564997 () (_ BitVec 64))

(assert (=> b!1251692 (= lt!564997 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!564981 () Unit!41591)

(declare-fun addStillContains!1076 (ListLongMap!18373 (_ BitVec 64) V!47593 (_ BitVec 64)) Unit!41591)

(assert (=> b!1251692 (= lt!564981 (addStillContains!1076 lt!564986 lt!564987 zeroValue!871 lt!564997))))

(assert (=> b!1251692 (contains!7510 (+!4138 lt!564986 (tuple2!20501 lt!564987 zeroValue!871)) lt!564997)))

(declare-fun lt!564982 () Unit!41591)

(assert (=> b!1251692 (= lt!564982 lt!564981)))

(declare-fun lt!564992 () ListLongMap!18373)

(assert (=> b!1251692 (= lt!564992 (getCurrentListMapNoExtraKeys!5598 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564999 () (_ BitVec 64))

(assert (=> b!1251692 (= lt!564999 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!564995 () (_ BitVec 64))

(assert (=> b!1251692 (= lt!564995 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!564979 () Unit!41591)

(declare-fun addApplyDifferent!530 (ListLongMap!18373 (_ BitVec 64) V!47593 (_ BitVec 64)) Unit!41591)

(assert (=> b!1251692 (= lt!564979 (addApplyDifferent!530 lt!564992 lt!564999 minValueBefore!43 lt!564995))))

(assert (=> b!1251692 (= (apply!982 (+!4138 lt!564992 (tuple2!20501 lt!564999 minValueBefore!43)) lt!564995) (apply!982 lt!564992 lt!564995))))

(declare-fun lt!564989 () Unit!41591)

(assert (=> b!1251692 (= lt!564989 lt!564979)))

(declare-fun lt!564985 () ListLongMap!18373)

(assert (=> b!1251692 (= lt!564985 (getCurrentListMapNoExtraKeys!5598 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564988 () (_ BitVec 64))

(assert (=> b!1251692 (= lt!564988 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!564998 () (_ BitVec 64))

(assert (=> b!1251692 (= lt!564998 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!564984 () Unit!41591)

(assert (=> b!1251692 (= lt!564984 (addApplyDifferent!530 lt!564985 lt!564988 zeroValue!871 lt!564998))))

(assert (=> b!1251692 (= (apply!982 (+!4138 lt!564985 (tuple2!20501 lt!564988 zeroValue!871)) lt!564998) (apply!982 lt!564985 lt!564998))))

(declare-fun lt!564990 () Unit!41591)

(assert (=> b!1251692 (= lt!564990 lt!564984)))

(declare-fun lt!564994 () ListLongMap!18373)

(assert (=> b!1251692 (= lt!564994 (getCurrentListMapNoExtraKeys!5598 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564980 () (_ BitVec 64))

(assert (=> b!1251692 (= lt!564980 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!564983 () (_ BitVec 64))

(assert (=> b!1251692 (= lt!564983 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1251692 (= lt!565000 (addApplyDifferent!530 lt!564994 lt!564980 minValueBefore!43 lt!564983))))

(assert (=> b!1251692 (= (apply!982 (+!4138 lt!564994 (tuple2!20501 lt!564980 minValueBefore!43)) lt!564983) (apply!982 lt!564994 lt!564983))))

(declare-fun b!1251684 () Bool)

(assert (=> b!1251684 (= e!710809 e!710805)))

(declare-fun c!122229 () Bool)

(assert (=> b!1251684 (= c!122229 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!137959 () Bool)

(declare-fun e!710812 () Bool)

(assert (=> d!137959 e!710812))

(declare-fun res!834830 () Bool)

(assert (=> d!137959 (=> (not res!834830) (not e!710812))))

(assert (=> d!137959 (= res!834830 (or (bvsge #b00000000000000000000000000000000 (size!39604 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39604 _keys!1118)))))))

(declare-fun lt!564996 () ListLongMap!18373)

(assert (=> d!137959 (= lt!564993 lt!564996)))

(declare-fun lt!564991 () Unit!41591)

(assert (=> d!137959 (= lt!564991 e!710808)))

(declare-fun c!122227 () Bool)

(declare-fun e!710813 () Bool)

(assert (=> d!137959 (= c!122227 e!710813)))

(declare-fun res!834825 () Bool)

(assert (=> d!137959 (=> (not res!834825) (not e!710813))))

(assert (=> d!137959 (= res!834825 (bvslt #b00000000000000000000000000000000 (size!39604 _keys!1118)))))

(assert (=> d!137959 (= lt!564996 e!710809)))

(declare-fun c!122228 () Bool)

(assert (=> d!137959 (= c!122228 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!137959 (validMask!0 mask!1466)))

(assert (=> d!137959 (= (getCurrentListMap!4470 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!564993)))

(declare-fun call!61641 () ListLongMap!18373)

(declare-fun bm!61639 () Bool)

(assert (=> bm!61639 (= call!61646 (+!4138 (ite c!122228 call!61643 (ite c!122229 call!61645 call!61641)) (ite (or c!122228 c!122229) (tuple2!20501 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20501 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun bm!61640 () Bool)

(assert (=> bm!61640 (= call!61643 (getCurrentListMapNoExtraKeys!5598 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251693 () Bool)

(declare-fun call!61644 () ListLongMap!18373)

(assert (=> b!1251693 (= e!710804 call!61644)))

(declare-fun b!1251694 () Bool)

(declare-fun e!710803 () Bool)

(assert (=> b!1251694 (= e!710803 e!710806)))

(declare-fun res!834828 () Bool)

(assert (=> b!1251694 (=> (not res!834828) (not e!710806))))

(assert (=> b!1251694 (= res!834828 (contains!7510 lt!564993 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1251694 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39604 _keys!1118)))))

(declare-fun b!1251695 () Bool)

(declare-fun e!710811 () Bool)

(assert (=> b!1251695 (= e!710811 (validKeyInArray!0 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1251696 () Bool)

(declare-fun res!834823 () Bool)

(assert (=> b!1251696 (=> (not res!834823) (not e!710812))))

(assert (=> b!1251696 (= res!834823 e!710803)))

(declare-fun res!834824 () Bool)

(assert (=> b!1251696 (=> res!834824 e!710803)))

(assert (=> b!1251696 (= res!834824 (not e!710811))))

(declare-fun res!834829 () Bool)

(assert (=> b!1251696 (=> (not res!834829) (not e!710811))))

(assert (=> b!1251696 (= res!834829 (bvslt #b00000000000000000000000000000000 (size!39604 _keys!1118)))))

(declare-fun b!1251697 () Bool)

(declare-fun res!834831 () Bool)

(assert (=> b!1251697 (=> (not res!834831) (not e!710812))))

(assert (=> b!1251697 (= res!834831 e!710810)))

(declare-fun c!122225 () Bool)

(assert (=> b!1251697 (= c!122225 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!61641 () Bool)

(assert (=> bm!61641 (= call!61647 (contains!7510 lt!564993 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1251698 () Bool)

(assert (=> b!1251698 (= e!710813 (validKeyInArray!0 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1251699 () Bool)

(declare-fun e!710807 () Bool)

(assert (=> b!1251699 (= e!710807 (= (apply!982 lt!564993 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1251700 () Bool)

(assert (=> b!1251700 (= e!710804 call!61641)))

(declare-fun bm!61642 () Bool)

(assert (=> bm!61642 (= call!61641 call!61645)))

(declare-fun b!1251701 () Bool)

(assert (=> b!1251701 (= e!710805 call!61644)))

(declare-fun b!1251702 () Bool)

(assert (=> b!1251702 (= e!710812 e!710815)))

(declare-fun c!122226 () Bool)

(assert (=> b!1251702 (= c!122226 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251703 () Bool)

(assert (=> b!1251703 (= e!710810 e!710807)))

(declare-fun res!834826 () Bool)

(assert (=> b!1251703 (= res!834826 call!61647)))

(assert (=> b!1251703 (=> (not res!834826) (not e!710807))))

(declare-fun bm!61643 () Bool)

(assert (=> bm!61643 (= call!61642 (contains!7510 lt!564993 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!61644 () Bool)

(assert (=> bm!61644 (= call!61644 call!61646)))

(assert (= (and d!137959 c!122228) b!1251683))

(assert (= (and d!137959 (not c!122228)) b!1251684))

(assert (= (and b!1251684 c!122229) b!1251701))

(assert (= (and b!1251684 (not c!122229)) b!1251688))

(assert (= (and b!1251688 c!122224) b!1251693))

(assert (= (and b!1251688 (not c!122224)) b!1251700))

(assert (= (or b!1251693 b!1251700) bm!61642))

(assert (= (or b!1251701 bm!61642) bm!61638))

(assert (= (or b!1251701 b!1251693) bm!61644))

(assert (= (or b!1251683 bm!61638) bm!61640))

(assert (= (or b!1251683 bm!61644) bm!61639))

(assert (= (and d!137959 res!834825) b!1251698))

(assert (= (and d!137959 c!122227) b!1251692))

(assert (= (and d!137959 (not c!122227)) b!1251685))

(assert (= (and d!137959 res!834830) b!1251696))

(assert (= (and b!1251696 res!834829) b!1251695))

(assert (= (and b!1251696 (not res!834824)) b!1251694))

(assert (= (and b!1251694 res!834828) b!1251690))

(assert (= (and b!1251696 res!834823) b!1251697))

(assert (= (and b!1251697 c!122225) b!1251703))

(assert (= (and b!1251697 (not c!122225)) b!1251689))

(assert (= (and b!1251703 res!834826) b!1251699))

(assert (= (or b!1251703 b!1251689) bm!61641))

(assert (= (and b!1251697 res!834831) b!1251702))

(assert (= (and b!1251702 c!122226) b!1251691))

(assert (= (and b!1251702 (not c!122226)) b!1251687))

(assert (= (and b!1251691 res!834827) b!1251686))

(assert (= (or b!1251691 b!1251687) bm!61643))

(declare-fun b_lambda!22555 () Bool)

(assert (=> (not b_lambda!22555) (not b!1251690)))

(assert (=> b!1251690 t!41211))

(declare-fun b_and!44567 () Bool)

(assert (= b_and!44565 (and (=> t!41211 result!23281) b_and!44567)))

(assert (=> bm!61640 m!1152305))

(declare-fun m!1152411 () Bool)

(assert (=> b!1251683 m!1152411))

(declare-fun m!1152413 () Bool)

(assert (=> b!1251699 m!1152413))

(declare-fun m!1152415 () Bool)

(assert (=> bm!61641 m!1152415))

(declare-fun m!1152417 () Bool)

(assert (=> b!1251692 m!1152417))

(declare-fun m!1152419 () Bool)

(assert (=> b!1251692 m!1152419))

(assert (=> b!1251692 m!1152347))

(declare-fun m!1152421 () Bool)

(assert (=> b!1251692 m!1152421))

(declare-fun m!1152423 () Bool)

(assert (=> b!1251692 m!1152423))

(declare-fun m!1152425 () Bool)

(assert (=> b!1251692 m!1152425))

(assert (=> b!1251692 m!1152419))

(declare-fun m!1152427 () Bool)

(assert (=> b!1251692 m!1152427))

(assert (=> b!1251692 m!1152417))

(declare-fun m!1152429 () Bool)

(assert (=> b!1251692 m!1152429))

(assert (=> b!1251692 m!1152421))

(declare-fun m!1152431 () Bool)

(assert (=> b!1251692 m!1152431))

(declare-fun m!1152433 () Bool)

(assert (=> b!1251692 m!1152433))

(declare-fun m!1152435 () Bool)

(assert (=> b!1251692 m!1152435))

(declare-fun m!1152437 () Bool)

(assert (=> b!1251692 m!1152437))

(assert (=> b!1251692 m!1152305))

(assert (=> b!1251692 m!1152425))

(declare-fun m!1152439 () Bool)

(assert (=> b!1251692 m!1152439))

(declare-fun m!1152441 () Bool)

(assert (=> b!1251692 m!1152441))

(declare-fun m!1152443 () Bool)

(assert (=> b!1251692 m!1152443))

(declare-fun m!1152445 () Bool)

(assert (=> b!1251692 m!1152445))

(declare-fun m!1152447 () Bool)

(assert (=> bm!61639 m!1152447))

(declare-fun m!1152449 () Bool)

(assert (=> bm!61643 m!1152449))

(assert (=> d!137959 m!1152295))

(assert (=> b!1251698 m!1152347))

(assert (=> b!1251698 m!1152347))

(assert (=> b!1251698 m!1152349))

(assert (=> b!1251694 m!1152347))

(assert (=> b!1251694 m!1152347))

(declare-fun m!1152451 () Bool)

(assert (=> b!1251694 m!1152451))

(declare-fun m!1152453 () Bool)

(assert (=> b!1251686 m!1152453))

(assert (=> b!1251690 m!1152359))

(assert (=> b!1251690 m!1152347))

(declare-fun m!1152455 () Bool)

(assert (=> b!1251690 m!1152455))

(assert (=> b!1251690 m!1152347))

(assert (=> b!1251690 m!1152359))

(assert (=> b!1251690 m!1152361))

(assert (=> b!1251690 m!1152363))

(assert (=> b!1251690 m!1152361))

(assert (=> b!1251695 m!1152347))

(assert (=> b!1251695 m!1152347))

(assert (=> b!1251695 m!1152349))

(assert (=> b!1251531 d!137959))

(declare-fun b!1251712 () Bool)

(declare-fun e!710824 () Bool)

(declare-fun call!61650 () Bool)

(assert (=> b!1251712 (= e!710824 call!61650)))

(declare-fun b!1251713 () Bool)

(declare-fun e!710822 () Bool)

(assert (=> b!1251713 (= e!710824 e!710822)))

(declare-fun lt!565008 () (_ BitVec 64))

(assert (=> b!1251713 (= lt!565008 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!565007 () Unit!41591)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81006 (_ BitVec 64) (_ BitVec 32)) Unit!41591)

(assert (=> b!1251713 (= lt!565007 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!565008 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81006 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1251713 (arrayContainsKey!0 _keys!1118 lt!565008 #b00000000000000000000000000000000)))

(declare-fun lt!565009 () Unit!41591)

(assert (=> b!1251713 (= lt!565009 lt!565007)))

(declare-fun res!834837 () Bool)

(declare-datatypes ((SeekEntryResult!9960 0))(
  ( (MissingZero!9960 (index!42211 (_ BitVec 32))) (Found!9960 (index!42212 (_ BitVec 32))) (Intermediate!9960 (undefined!10772 Bool) (index!42213 (_ BitVec 32)) (x!110113 (_ BitVec 32))) (Undefined!9960) (MissingVacant!9960 (index!42214 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81006 (_ BitVec 32)) SeekEntryResult!9960)

(assert (=> b!1251713 (= res!834837 (= (seekEntryOrOpen!0 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9960 #b00000000000000000000000000000000)))))

(assert (=> b!1251713 (=> (not res!834837) (not e!710822))))

(declare-fun bm!61647 () Bool)

(assert (=> bm!61647 (= call!61650 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun d!137961 () Bool)

(declare-fun res!834836 () Bool)

(declare-fun e!710823 () Bool)

(assert (=> d!137961 (=> res!834836 e!710823)))

(assert (=> d!137961 (= res!834836 (bvsge #b00000000000000000000000000000000 (size!39604 _keys!1118)))))

(assert (=> d!137961 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!710823)))

(declare-fun b!1251714 () Bool)

(assert (=> b!1251714 (= e!710822 call!61650)))

(declare-fun b!1251715 () Bool)

(assert (=> b!1251715 (= e!710823 e!710824)))

(declare-fun c!122232 () Bool)

(assert (=> b!1251715 (= c!122232 (validKeyInArray!0 (select (arr!39068 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!137961 (not res!834836)) b!1251715))

(assert (= (and b!1251715 c!122232) b!1251713))

(assert (= (and b!1251715 (not c!122232)) b!1251712))

(assert (= (and b!1251713 res!834837) b!1251714))

(assert (= (or b!1251714 b!1251712) bm!61647))

(assert (=> b!1251713 m!1152347))

(declare-fun m!1152457 () Bool)

(assert (=> b!1251713 m!1152457))

(declare-fun m!1152459 () Bool)

(assert (=> b!1251713 m!1152459))

(assert (=> b!1251713 m!1152347))

(declare-fun m!1152461 () Bool)

(assert (=> b!1251713 m!1152461))

(declare-fun m!1152463 () Bool)

(assert (=> bm!61647 m!1152463))

(assert (=> b!1251715 m!1152347))

(assert (=> b!1251715 m!1152347))

(assert (=> b!1251715 m!1152349))

(assert (=> b!1251539 d!137961))

(declare-fun d!137963 () Bool)

(declare-fun lt!565012 () ListLongMap!18373)

(assert (=> d!137963 (not (contains!7510 lt!565012 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!137 (List!27732 (_ BitVec 64)) List!27732)

(assert (=> d!137963 (= lt!565012 (ListLongMap!18374 (removeStrictlySorted!137 (toList!9202 lt!564873) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137963 (= (-!2020 lt!564873 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565012)))

(declare-fun bs!35338 () Bool)

(assert (= bs!35338 d!137963))

(declare-fun m!1152465 () Bool)

(assert (=> bs!35338 m!1152465))

(declare-fun m!1152467 () Bool)

(assert (=> bs!35338 m!1152467))

(assert (=> b!1251536 d!137963))

(declare-fun d!137965 () Bool)

(assert (=> d!137965 (= (-!2020 lt!564873 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564873)))

(declare-fun lt!565015 () Unit!41591)

(declare-fun choose!1850 (ListLongMap!18373 (_ BitVec 64)) Unit!41591)

(assert (=> d!137965 (= lt!565015 (choose!1850 lt!564873 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!137965 (not (contains!7510 lt!564873 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!137965 (= (removeNotPresentStillSame!115 lt!564873 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565015)))

(declare-fun bs!35339 () Bool)

(assert (= bs!35339 d!137965))

(assert (=> bs!35339 m!1152313))

(declare-fun m!1152469 () Bool)

(assert (=> bs!35339 m!1152469))

(assert (=> bs!35339 m!1152309))

(assert (=> b!1251536 d!137965))

(declare-fun condMapEmpty!49279 () Bool)

(declare-fun mapDefault!49279 () ValueCell!15072)

(assert (=> mapNonEmpty!49273 (= condMapEmpty!49279 (= mapRest!49273 ((as const (Array (_ BitVec 32) ValueCell!15072)) mapDefault!49279)))))

(declare-fun e!710829 () Bool)

(declare-fun mapRes!49279 () Bool)

(assert (=> mapNonEmpty!49273 (= tp!93802 (and e!710829 mapRes!49279))))

(declare-fun b!1251722 () Bool)

(declare-fun e!710830 () Bool)

(assert (=> b!1251722 (= e!710830 tp_is_empty!31671)))

(declare-fun b!1251723 () Bool)

(assert (=> b!1251723 (= e!710829 tp_is_empty!31671)))

(declare-fun mapIsEmpty!49279 () Bool)

(assert (=> mapIsEmpty!49279 mapRes!49279))

(declare-fun mapNonEmpty!49279 () Bool)

(declare-fun tp!93812 () Bool)

(assert (=> mapNonEmpty!49279 (= mapRes!49279 (and tp!93812 e!710830))))

(declare-fun mapRest!49279 () (Array (_ BitVec 32) ValueCell!15072))

(declare-fun mapKey!49279 () (_ BitVec 32))

(declare-fun mapValue!49279 () ValueCell!15072)

(assert (=> mapNonEmpty!49279 (= mapRest!49273 (store mapRest!49279 mapKey!49279 mapValue!49279))))

(assert (= (and mapNonEmpty!49273 condMapEmpty!49279) mapIsEmpty!49279))

(assert (= (and mapNonEmpty!49273 (not condMapEmpty!49279)) mapNonEmpty!49279))

(assert (= (and mapNonEmpty!49279 ((_ is ValueCellFull!15072) mapValue!49279)) b!1251722))

(assert (= (and mapNonEmpty!49273 ((_ is ValueCellFull!15072) mapDefault!49279)) b!1251723))

(declare-fun m!1152471 () Bool)

(assert (=> mapNonEmpty!49279 m!1152471))

(declare-fun b_lambda!22557 () Bool)

(assert (= b_lambda!22549 (or (and start!105000 b_free!26769) b_lambda!22557)))

(declare-fun b_lambda!22559 () Bool)

(assert (= b_lambda!22547 (or (and start!105000 b_free!26769) b_lambda!22559)))

(declare-fun b_lambda!22561 () Bool)

(assert (= b_lambda!22551 (or (and start!105000 b_free!26769) b_lambda!22561)))

(declare-fun b_lambda!22563 () Bool)

(assert (= b_lambda!22555 (or (and start!105000 b_free!26769) b_lambda!22563)))

(declare-fun b_lambda!22565 () Bool)

(assert (= b_lambda!22553 (or (and start!105000 b_free!26769) b_lambda!22565)))

(check-sat (not b!1251617) (not b!1251620) (not bm!61647) (not b!1251713) (not d!137957) (not b!1251611) (not b!1251640) (not bm!61639) (not b!1251581) (not bm!61641) (not bm!61640) (not b!1251699) (not d!137959) (not b!1251607) (not b!1251631) (not b_lambda!22565) (not b_lambda!22563) b_and!44567 (not b!1251683) (not b!1251625) (not b!1251692) (not b!1251616) (not b_lambda!22561) (not bm!61643) (not b!1251695) (not b!1251698) (not b!1251615) (not b!1251630) (not b!1251608) (not b!1251610) tp_is_empty!31671 (not d!137951) (not b!1251686) (not b!1251621) (not b!1251694) (not d!137963) (not b!1251715) (not b_lambda!22557) (not b!1251638) (not b!1251606) (not d!137953) (not bm!61622) (not b!1251624) (not bm!61619) (not d!137955) (not d!137965) (not b!1251629) (not b_lambda!22559) (not b!1251577) (not b!1251580) (not b_next!26769) (not mapNonEmpty!49279) (not b!1251622) (not b!1251690) (not bm!61623))
(check-sat b_and!44567 (not b_next!26769))
