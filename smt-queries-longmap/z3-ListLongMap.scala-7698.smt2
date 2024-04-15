; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96634 () Bool)

(assert start!96634)

(declare-fun b_free!23113 () Bool)

(declare-fun b_next!23113 () Bool)

(assert (=> start!96634 (= b_free!23113 (not b_next!23113))))

(declare-fun tp!81278 () Bool)

(declare-fun b_and!36919 () Bool)

(assert (=> start!96634 (= tp!81278 b_and!36919)))

(declare-fun b!1099023 () Bool)

(declare-fun e!627270 () Bool)

(declare-fun e!627268 () Bool)

(assert (=> b!1099023 (= e!627270 (not e!627268))))

(declare-fun res!733479 () Bool)

(assert (=> b!1099023 (=> res!733479 e!627268)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1099023 (= res!733479 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((V!41345 0))(
  ( (V!41346 (val!13638 Int)) )
))
(declare-fun zeroValue!831 () V!41345)

(declare-datatypes ((array!71146 0))(
  ( (array!71147 (arr!34241 (Array (_ BitVec 32) (_ BitVec 64))) (size!34779 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71146)

(declare-datatypes ((ValueCell!12872 0))(
  ( (ValueCellFull!12872 (v!16262 V!41345)) (EmptyCell!12872) )
))
(declare-datatypes ((array!71148 0))(
  ( (array!71149 (arr!34242 (Array (_ BitVec 32) ValueCell!12872)) (size!34780 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71148)

(declare-fun minValue!831 () V!41345)

(declare-datatypes ((tuple2!17394 0))(
  ( (tuple2!17395 (_1!8708 (_ BitVec 64)) (_2!8708 V!41345)) )
))
(declare-datatypes ((List!23985 0))(
  ( (Nil!23982) (Cons!23981 (h!25190 tuple2!17394) (t!34135 List!23985)) )
))
(declare-datatypes ((ListLongMap!15363 0))(
  ( (ListLongMap!15364 (toList!7697 List!23985)) )
))
(declare-fun lt!491913 () ListLongMap!15363)

(declare-fun getCurrentListMap!4317 (array!71146 array!71148 (_ BitVec 32) (_ BitVec 32) V!41345 V!41345 (_ BitVec 32) Int) ListLongMap!15363)

(assert (=> b!1099023 (= lt!491913 (getCurrentListMap!4317 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491917 () ListLongMap!15363)

(declare-fun lt!491909 () array!71148)

(declare-fun lt!491910 () array!71146)

(assert (=> b!1099023 (= lt!491917 (getCurrentListMap!4317 lt!491910 lt!491909 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491915 () ListLongMap!15363)

(declare-fun lt!491916 () ListLongMap!15363)

(assert (=> b!1099023 (and (= lt!491915 lt!491916) (= lt!491916 lt!491915))))

(declare-fun lt!491911 () ListLongMap!15363)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!932 (ListLongMap!15363 (_ BitVec 64)) ListLongMap!15363)

(assert (=> b!1099023 (= lt!491916 (-!932 lt!491911 k0!904))))

(declare-datatypes ((Unit!35979 0))(
  ( (Unit!35980) )
))
(declare-fun lt!491914 () Unit!35979)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!206 (array!71146 array!71148 (_ BitVec 32) (_ BitVec 32) V!41345 V!41345 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35979)

(assert (=> b!1099023 (= lt!491914 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!206 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4224 (array!71146 array!71148 (_ BitVec 32) (_ BitVec 32) V!41345 V!41345 (_ BitVec 32) Int) ListLongMap!15363)

(assert (=> b!1099023 (= lt!491915 (getCurrentListMapNoExtraKeys!4224 lt!491910 lt!491909 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2293 (Int (_ BitVec 64)) V!41345)

(assert (=> b!1099023 (= lt!491909 (array!71149 (store (arr!34242 _values!874) i!650 (ValueCellFull!12872 (dynLambda!2293 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34780 _values!874)))))

(assert (=> b!1099023 (= lt!491911 (getCurrentListMapNoExtraKeys!4224 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71146 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1099023 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!491912 () Unit!35979)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71146 (_ BitVec 64) (_ BitVec 32)) Unit!35979)

(assert (=> b!1099023 (= lt!491912 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1099024 () Bool)

(declare-fun res!733482 () Bool)

(declare-fun e!627264 () Bool)

(assert (=> b!1099024 (=> (not res!733482) (not e!627264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71146 (_ BitVec 32)) Bool)

(assert (=> b!1099024 (= res!733482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!733486 () Bool)

(assert (=> start!96634 (=> (not res!733486) (not e!627264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96634 (= res!733486 (validMask!0 mask!1414))))

(assert (=> start!96634 e!627264))

(assert (=> start!96634 tp!81278))

(assert (=> start!96634 true))

(declare-fun tp_is_empty!27163 () Bool)

(assert (=> start!96634 tp_is_empty!27163))

(declare-fun array_inv!26410 (array!71146) Bool)

(assert (=> start!96634 (array_inv!26410 _keys!1070)))

(declare-fun e!627267 () Bool)

(declare-fun array_inv!26411 (array!71148) Bool)

(assert (=> start!96634 (and (array_inv!26411 _values!874) e!627267)))

(declare-fun b!1099025 () Bool)

(assert (=> b!1099025 (= e!627264 e!627270)))

(declare-fun res!733487 () Bool)

(assert (=> b!1099025 (=> (not res!733487) (not e!627270))))

(assert (=> b!1099025 (= res!733487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491910 mask!1414))))

(assert (=> b!1099025 (= lt!491910 (array!71147 (store (arr!34241 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34779 _keys!1070)))))

(declare-fun b!1099026 () Bool)

(declare-fun res!733483 () Bool)

(assert (=> b!1099026 (=> (not res!733483) (not e!627264))))

(declare-datatypes ((List!23986 0))(
  ( (Nil!23983) (Cons!23982 (h!25191 (_ BitVec 64)) (t!34136 List!23986)) )
))
(declare-fun arrayNoDuplicates!0 (array!71146 (_ BitVec 32) List!23986) Bool)

(assert (=> b!1099026 (= res!733483 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23983))))

(declare-fun b!1099027 () Bool)

(declare-fun res!733485 () Bool)

(assert (=> b!1099027 (=> (not res!733485) (not e!627264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1099027 (= res!733485 (validKeyInArray!0 k0!904))))

(declare-fun b!1099028 () Bool)

(declare-fun res!733478 () Bool)

(assert (=> b!1099028 (=> (not res!733478) (not e!627270))))

(assert (=> b!1099028 (= res!733478 (arrayNoDuplicates!0 lt!491910 #b00000000000000000000000000000000 Nil!23983))))

(declare-fun b!1099029 () Bool)

(declare-fun res!733480 () Bool)

(assert (=> b!1099029 (=> (not res!733480) (not e!627264))))

(assert (=> b!1099029 (= res!733480 (and (= (size!34780 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34779 _keys!1070) (size!34780 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42517 () Bool)

(declare-fun mapRes!42517 () Bool)

(declare-fun tp!81277 () Bool)

(declare-fun e!627265 () Bool)

(assert (=> mapNonEmpty!42517 (= mapRes!42517 (and tp!81277 e!627265))))

(declare-fun mapValue!42517 () ValueCell!12872)

(declare-fun mapRest!42517 () (Array (_ BitVec 32) ValueCell!12872))

(declare-fun mapKey!42517 () (_ BitVec 32))

(assert (=> mapNonEmpty!42517 (= (arr!34242 _values!874) (store mapRest!42517 mapKey!42517 mapValue!42517))))

(declare-fun b!1099030 () Bool)

(assert (=> b!1099030 (= e!627265 tp_is_empty!27163)))

(declare-fun b!1099031 () Bool)

(declare-fun +!3409 (ListLongMap!15363 tuple2!17394) ListLongMap!15363)

(assert (=> b!1099031 (= e!627268 (= lt!491917 (+!3409 lt!491915 (tuple2!17395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(declare-fun b!1099032 () Bool)

(declare-fun e!627266 () Bool)

(assert (=> b!1099032 (= e!627266 tp_is_empty!27163)))

(declare-fun b!1099033 () Bool)

(declare-fun res!733484 () Bool)

(assert (=> b!1099033 (=> (not res!733484) (not e!627264))))

(assert (=> b!1099033 (= res!733484 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34779 _keys!1070))))))

(declare-fun b!1099034 () Bool)

(assert (=> b!1099034 (= e!627267 (and e!627266 mapRes!42517))))

(declare-fun condMapEmpty!42517 () Bool)

(declare-fun mapDefault!42517 () ValueCell!12872)

(assert (=> b!1099034 (= condMapEmpty!42517 (= (arr!34242 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12872)) mapDefault!42517)))))

(declare-fun mapIsEmpty!42517 () Bool)

(assert (=> mapIsEmpty!42517 mapRes!42517))

(declare-fun b!1099035 () Bool)

(declare-fun res!733481 () Bool)

(assert (=> b!1099035 (=> (not res!733481) (not e!627264))))

(assert (=> b!1099035 (= res!733481 (= (select (arr!34241 _keys!1070) i!650) k0!904))))

(assert (= (and start!96634 res!733486) b!1099029))

(assert (= (and b!1099029 res!733480) b!1099024))

(assert (= (and b!1099024 res!733482) b!1099026))

(assert (= (and b!1099026 res!733483) b!1099033))

(assert (= (and b!1099033 res!733484) b!1099027))

(assert (= (and b!1099027 res!733485) b!1099035))

(assert (= (and b!1099035 res!733481) b!1099025))

(assert (= (and b!1099025 res!733487) b!1099028))

(assert (= (and b!1099028 res!733478) b!1099023))

(assert (= (and b!1099023 (not res!733479)) b!1099031))

(assert (= (and b!1099034 condMapEmpty!42517) mapIsEmpty!42517))

(assert (= (and b!1099034 (not condMapEmpty!42517)) mapNonEmpty!42517))

(get-info :version)

(assert (= (and mapNonEmpty!42517 ((_ is ValueCellFull!12872) mapValue!42517)) b!1099030))

(assert (= (and b!1099034 ((_ is ValueCellFull!12872) mapDefault!42517)) b!1099032))

(assert (= start!96634 b!1099034))

(declare-fun b_lambda!17869 () Bool)

(assert (=> (not b_lambda!17869) (not b!1099023)))

(declare-fun t!34134 () Bool)

(declare-fun tb!7971 () Bool)

(assert (=> (and start!96634 (= defaultEntry!882 defaultEntry!882) t!34134) tb!7971))

(declare-fun result!16481 () Bool)

(assert (=> tb!7971 (= result!16481 tp_is_empty!27163)))

(assert (=> b!1099023 t!34134))

(declare-fun b_and!36921 () Bool)

(assert (= b_and!36919 (and (=> t!34134 result!16481) b_and!36921)))

(declare-fun m!1018517 () Bool)

(assert (=> mapNonEmpty!42517 m!1018517))

(declare-fun m!1018519 () Bool)

(assert (=> b!1099028 m!1018519))

(declare-fun m!1018521 () Bool)

(assert (=> b!1099035 m!1018521))

(declare-fun m!1018523 () Bool)

(assert (=> start!96634 m!1018523))

(declare-fun m!1018525 () Bool)

(assert (=> start!96634 m!1018525))

(declare-fun m!1018527 () Bool)

(assert (=> start!96634 m!1018527))

(declare-fun m!1018529 () Bool)

(assert (=> b!1099027 m!1018529))

(declare-fun m!1018531 () Bool)

(assert (=> b!1099026 m!1018531))

(declare-fun m!1018533 () Bool)

(assert (=> b!1099025 m!1018533))

(declare-fun m!1018535 () Bool)

(assert (=> b!1099025 m!1018535))

(declare-fun m!1018537 () Bool)

(assert (=> b!1099024 m!1018537))

(declare-fun m!1018539 () Bool)

(assert (=> b!1099023 m!1018539))

(declare-fun m!1018541 () Bool)

(assert (=> b!1099023 m!1018541))

(declare-fun m!1018543 () Bool)

(assert (=> b!1099023 m!1018543))

(declare-fun m!1018545 () Bool)

(assert (=> b!1099023 m!1018545))

(declare-fun m!1018547 () Bool)

(assert (=> b!1099023 m!1018547))

(declare-fun m!1018549 () Bool)

(assert (=> b!1099023 m!1018549))

(declare-fun m!1018551 () Bool)

(assert (=> b!1099023 m!1018551))

(declare-fun m!1018553 () Bool)

(assert (=> b!1099023 m!1018553))

(declare-fun m!1018555 () Bool)

(assert (=> b!1099023 m!1018555))

(declare-fun m!1018557 () Bool)

(assert (=> b!1099023 m!1018557))

(declare-fun m!1018559 () Bool)

(assert (=> b!1099031 m!1018559))

(check-sat (not b_lambda!17869) (not b!1099031) (not start!96634) (not b!1099026) (not b!1099024) b_and!36921 (not b!1099025) (not mapNonEmpty!42517) (not b!1099027) (not b_next!23113) tp_is_empty!27163 (not b!1099028) (not b!1099023))
(check-sat b_and!36921 (not b_next!23113))
(get-model)

(declare-fun b_lambda!17875 () Bool)

(assert (= b_lambda!17869 (or (and start!96634 b_free!23113) b_lambda!17875)))

(check-sat (not b!1099031) (not b!1099026) (not b!1099024) b_and!36921 (not b!1099025) (not mapNonEmpty!42517) (not b!1099027) (not b_next!23113) tp_is_empty!27163 (not b!1099028) (not b!1099023) (not start!96634) (not b_lambda!17875))
(check-sat b_and!36921 (not b_next!23113))
(get-model)

(declare-fun b!1099128 () Bool)

(declare-fun e!627321 () Bool)

(declare-fun e!627319 () Bool)

(assert (=> b!1099128 (= e!627321 e!627319)))

(declare-fun lt!491978 () (_ BitVec 64))

(assert (=> b!1099128 (= lt!491978 (select (arr!34241 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491979 () Unit!35979)

(assert (=> b!1099128 (= lt!491979 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!491978 #b00000000000000000000000000000000))))

(assert (=> b!1099128 (arrayContainsKey!0 _keys!1070 lt!491978 #b00000000000000000000000000000000)))

(declare-fun lt!491980 () Unit!35979)

(assert (=> b!1099128 (= lt!491980 lt!491979)))

(declare-fun res!733552 () Bool)

(declare-datatypes ((SeekEntryResult!9909 0))(
  ( (MissingZero!9909 (index!42007 (_ BitVec 32))) (Found!9909 (index!42008 (_ BitVec 32))) (Intermediate!9909 (undefined!10721 Bool) (index!42009 (_ BitVec 32)) (x!98866 (_ BitVec 32))) (Undefined!9909) (MissingVacant!9909 (index!42010 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71146 (_ BitVec 32)) SeekEntryResult!9909)

(assert (=> b!1099128 (= res!733552 (= (seekEntryOrOpen!0 (select (arr!34241 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9909 #b00000000000000000000000000000000)))))

(assert (=> b!1099128 (=> (not res!733552) (not e!627319))))

(declare-fun d!130321 () Bool)

(declare-fun res!733553 () Bool)

(declare-fun e!627320 () Bool)

(assert (=> d!130321 (=> res!733553 e!627320)))

(assert (=> d!130321 (= res!733553 (bvsge #b00000000000000000000000000000000 (size!34779 _keys!1070)))))

(assert (=> d!130321 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!627320)))

(declare-fun b!1099129 () Bool)

(declare-fun call!45928 () Bool)

(assert (=> b!1099129 (= e!627319 call!45928)))

(declare-fun b!1099130 () Bool)

(assert (=> b!1099130 (= e!627321 call!45928)))

(declare-fun bm!45925 () Bool)

(assert (=> bm!45925 (= call!45928 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1099131 () Bool)

(assert (=> b!1099131 (= e!627320 e!627321)))

(declare-fun c!108526 () Bool)

(assert (=> b!1099131 (= c!108526 (validKeyInArray!0 (select (arr!34241 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130321 (not res!733553)) b!1099131))

(assert (= (and b!1099131 c!108526) b!1099128))

(assert (= (and b!1099131 (not c!108526)) b!1099130))

(assert (= (and b!1099128 res!733552) b!1099129))

(assert (= (or b!1099129 b!1099130) bm!45925))

(declare-fun m!1018649 () Bool)

(assert (=> b!1099128 m!1018649))

(declare-fun m!1018651 () Bool)

(assert (=> b!1099128 m!1018651))

(declare-fun m!1018653 () Bool)

(assert (=> b!1099128 m!1018653))

(assert (=> b!1099128 m!1018649))

(declare-fun m!1018655 () Bool)

(assert (=> b!1099128 m!1018655))

(declare-fun m!1018657 () Bool)

(assert (=> bm!45925 m!1018657))

(assert (=> b!1099131 m!1018649))

(assert (=> b!1099131 m!1018649))

(declare-fun m!1018659 () Bool)

(assert (=> b!1099131 m!1018659))

(assert (=> b!1099024 d!130321))

(declare-fun d!130323 () Bool)

(declare-fun res!733558 () Bool)

(declare-fun e!627326 () Bool)

(assert (=> d!130323 (=> res!733558 e!627326)))

(assert (=> d!130323 (= res!733558 (= (select (arr!34241 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130323 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!627326)))

(declare-fun b!1099136 () Bool)

(declare-fun e!627327 () Bool)

(assert (=> b!1099136 (= e!627326 e!627327)))

(declare-fun res!733559 () Bool)

(assert (=> b!1099136 (=> (not res!733559) (not e!627327))))

(assert (=> b!1099136 (= res!733559 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34779 _keys!1070)))))

(declare-fun b!1099137 () Bool)

(assert (=> b!1099137 (= e!627327 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130323 (not res!733558)) b!1099136))

(assert (= (and b!1099136 res!733559) b!1099137))

(assert (=> d!130323 m!1018649))

(declare-fun m!1018661 () Bool)

(assert (=> b!1099137 m!1018661))

(assert (=> b!1099023 d!130323))

(declare-fun b!1099180 () Bool)

(declare-fun e!627355 () ListLongMap!15363)

(declare-fun call!45944 () ListLongMap!15363)

(assert (=> b!1099180 (= e!627355 (+!3409 call!45944 (tuple2!17395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun d!130325 () Bool)

(declare-fun e!627366 () Bool)

(assert (=> d!130325 e!627366))

(declare-fun res!733578 () Bool)

(assert (=> d!130325 (=> (not res!733578) (not e!627366))))

(assert (=> d!130325 (= res!733578 (or (bvsge #b00000000000000000000000000000000 (size!34779 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34779 _keys!1070)))))))

(declare-fun lt!492031 () ListLongMap!15363)

(declare-fun lt!492039 () ListLongMap!15363)

(assert (=> d!130325 (= lt!492031 lt!492039)))

(declare-fun lt!492027 () Unit!35979)

(declare-fun e!627356 () Unit!35979)

(assert (=> d!130325 (= lt!492027 e!627356)))

(declare-fun c!108541 () Bool)

(declare-fun e!627365 () Bool)

(assert (=> d!130325 (= c!108541 e!627365)))

(declare-fun res!733579 () Bool)

(assert (=> d!130325 (=> (not res!733579) (not e!627365))))

(assert (=> d!130325 (= res!733579 (bvslt #b00000000000000000000000000000000 (size!34779 _keys!1070)))))

(assert (=> d!130325 (= lt!492039 e!627355)))

(declare-fun c!108540 () Bool)

(assert (=> d!130325 (= c!108540 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130325 (validMask!0 mask!1414)))

(assert (=> d!130325 (= (getCurrentListMap!4317 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492031)))

(declare-fun bm!45940 () Bool)

(declare-fun call!45949 () ListLongMap!15363)

(assert (=> bm!45940 (= call!45949 call!45944)))

(declare-fun b!1099181 () Bool)

(declare-fun e!627360 () ListLongMap!15363)

(assert (=> b!1099181 (= e!627355 e!627360)))

(declare-fun c!108539 () Bool)

(assert (=> b!1099181 (= c!108539 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1099182 () Bool)

(declare-fun e!627359 () Bool)

(declare-fun apply!940 (ListLongMap!15363 (_ BitVec 64)) V!41345)

(assert (=> b!1099182 (= e!627359 (= (apply!940 lt!492031 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1099183 () Bool)

(declare-fun e!627363 () Bool)

(declare-fun get!17626 (ValueCell!12872 V!41345) V!41345)

(assert (=> b!1099183 (= e!627363 (= (apply!940 lt!492031 (select (arr!34241 _keys!1070) #b00000000000000000000000000000000)) (get!17626 (select (arr!34242 _values!874) #b00000000000000000000000000000000) (dynLambda!2293 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1099183 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34780 _values!874)))))

(assert (=> b!1099183 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34779 _keys!1070)))))

(declare-fun b!1099184 () Bool)

(declare-fun res!733582 () Bool)

(assert (=> b!1099184 (=> (not res!733582) (not e!627366))))

(declare-fun e!627362 () Bool)

(assert (=> b!1099184 (= res!733582 e!627362)))

(declare-fun res!733580 () Bool)

(assert (=> b!1099184 (=> res!733580 e!627362)))

(declare-fun e!627361 () Bool)

(assert (=> b!1099184 (= res!733580 (not e!627361))))

(declare-fun res!733586 () Bool)

(assert (=> b!1099184 (=> (not res!733586) (not e!627361))))

(assert (=> b!1099184 (= res!733586 (bvslt #b00000000000000000000000000000000 (size!34779 _keys!1070)))))

(declare-fun bm!45941 () Bool)

(declare-fun call!45945 () Bool)

(declare-fun contains!6359 (ListLongMap!15363 (_ BitVec 64)) Bool)

(assert (=> bm!45941 (= call!45945 (contains!6359 lt!492031 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45942 () Bool)

(declare-fun call!45943 () ListLongMap!15363)

(declare-fun call!45946 () ListLongMap!15363)

(assert (=> bm!45942 (= call!45943 call!45946)))

(declare-fun bm!45943 () Bool)

(declare-fun call!45947 () ListLongMap!15363)

(assert (=> bm!45943 (= call!45946 call!45947)))

(declare-fun b!1099185 () Bool)

(declare-fun e!627354 () Bool)

(assert (=> b!1099185 (= e!627354 e!627359)))

(declare-fun res!733585 () Bool)

(assert (=> b!1099185 (= res!733585 call!45945)))

(assert (=> b!1099185 (=> (not res!733585) (not e!627359))))

(declare-fun bm!45944 () Bool)

(declare-fun call!45948 () Bool)

(assert (=> bm!45944 (= call!45948 (contains!6359 lt!492031 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1099186 () Bool)

(declare-fun e!627364 () ListLongMap!15363)

(assert (=> b!1099186 (= e!627364 call!45949)))

(declare-fun b!1099187 () Bool)

(declare-fun e!627357 () Bool)

(assert (=> b!1099187 (= e!627357 (= (apply!940 lt!492031 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1099188 () Bool)

(assert (=> b!1099188 (= e!627365 (validKeyInArray!0 (select (arr!34241 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099189 () Bool)

(assert (=> b!1099189 (= e!627364 call!45943)))

(declare-fun b!1099190 () Bool)

(declare-fun e!627358 () Bool)

(assert (=> b!1099190 (= e!627358 e!627357)))

(declare-fun res!733583 () Bool)

(assert (=> b!1099190 (= res!733583 call!45948)))

(assert (=> b!1099190 (=> (not res!733583) (not e!627357))))

(declare-fun b!1099191 () Bool)

(assert (=> b!1099191 (= e!627358 (not call!45948))))

(declare-fun b!1099192 () Bool)

(assert (=> b!1099192 (= e!627354 (not call!45945))))

(declare-fun b!1099193 () Bool)

(assert (=> b!1099193 (= e!627362 e!627363)))

(declare-fun res!733581 () Bool)

(assert (=> b!1099193 (=> (not res!733581) (not e!627363))))

(assert (=> b!1099193 (= res!733581 (contains!6359 lt!492031 (select (arr!34241 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1099193 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34779 _keys!1070)))))

(declare-fun b!1099194 () Bool)

(declare-fun res!733584 () Bool)

(assert (=> b!1099194 (=> (not res!733584) (not e!627366))))

(assert (=> b!1099194 (= res!733584 e!627354)))

(declare-fun c!108542 () Bool)

(assert (=> b!1099194 (= c!108542 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1099195 () Bool)

(declare-fun Unit!35983 () Unit!35979)

(assert (=> b!1099195 (= e!627356 Unit!35983)))

(declare-fun bm!45945 () Bool)

(assert (=> bm!45945 (= call!45944 (+!3409 (ite c!108540 call!45947 (ite c!108539 call!45946 call!45943)) (ite (or c!108540 c!108539) (tuple2!17395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1099196 () Bool)

(declare-fun lt!492028 () Unit!35979)

(assert (=> b!1099196 (= e!627356 lt!492028)))

(declare-fun lt!492038 () ListLongMap!15363)

(assert (=> b!1099196 (= lt!492038 (getCurrentListMapNoExtraKeys!4224 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492040 () (_ BitVec 64))

(assert (=> b!1099196 (= lt!492040 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492041 () (_ BitVec 64))

(assert (=> b!1099196 (= lt!492041 (select (arr!34241 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492030 () Unit!35979)

(declare-fun addStillContains!653 (ListLongMap!15363 (_ BitVec 64) V!41345 (_ BitVec 64)) Unit!35979)

(assert (=> b!1099196 (= lt!492030 (addStillContains!653 lt!492038 lt!492040 zeroValue!831 lt!492041))))

(assert (=> b!1099196 (contains!6359 (+!3409 lt!492038 (tuple2!17395 lt!492040 zeroValue!831)) lt!492041)))

(declare-fun lt!492044 () Unit!35979)

(assert (=> b!1099196 (= lt!492044 lt!492030)))

(declare-fun lt!492025 () ListLongMap!15363)

(assert (=> b!1099196 (= lt!492025 (getCurrentListMapNoExtraKeys!4224 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492045 () (_ BitVec 64))

(assert (=> b!1099196 (= lt!492045 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492035 () (_ BitVec 64))

(assert (=> b!1099196 (= lt!492035 (select (arr!34241 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492037 () Unit!35979)

(declare-fun addApplyDifferent!509 (ListLongMap!15363 (_ BitVec 64) V!41345 (_ BitVec 64)) Unit!35979)

(assert (=> b!1099196 (= lt!492037 (addApplyDifferent!509 lt!492025 lt!492045 minValue!831 lt!492035))))

(assert (=> b!1099196 (= (apply!940 (+!3409 lt!492025 (tuple2!17395 lt!492045 minValue!831)) lt!492035) (apply!940 lt!492025 lt!492035))))

(declare-fun lt!492033 () Unit!35979)

(assert (=> b!1099196 (= lt!492033 lt!492037)))

(declare-fun lt!492042 () ListLongMap!15363)

(assert (=> b!1099196 (= lt!492042 (getCurrentListMapNoExtraKeys!4224 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492036 () (_ BitVec 64))

(assert (=> b!1099196 (= lt!492036 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492046 () (_ BitVec 64))

(assert (=> b!1099196 (= lt!492046 (select (arr!34241 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492043 () Unit!35979)

(assert (=> b!1099196 (= lt!492043 (addApplyDifferent!509 lt!492042 lt!492036 zeroValue!831 lt!492046))))

(assert (=> b!1099196 (= (apply!940 (+!3409 lt!492042 (tuple2!17395 lt!492036 zeroValue!831)) lt!492046) (apply!940 lt!492042 lt!492046))))

(declare-fun lt!492029 () Unit!35979)

(assert (=> b!1099196 (= lt!492029 lt!492043)))

(declare-fun lt!492034 () ListLongMap!15363)

(assert (=> b!1099196 (= lt!492034 (getCurrentListMapNoExtraKeys!4224 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492026 () (_ BitVec 64))

(assert (=> b!1099196 (= lt!492026 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492032 () (_ BitVec 64))

(assert (=> b!1099196 (= lt!492032 (select (arr!34241 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1099196 (= lt!492028 (addApplyDifferent!509 lt!492034 lt!492026 minValue!831 lt!492032))))

(assert (=> b!1099196 (= (apply!940 (+!3409 lt!492034 (tuple2!17395 lt!492026 minValue!831)) lt!492032) (apply!940 lt!492034 lt!492032))))

(declare-fun b!1099197 () Bool)

(declare-fun c!108544 () Bool)

(assert (=> b!1099197 (= c!108544 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1099197 (= e!627360 e!627364)))

(declare-fun bm!45946 () Bool)

(assert (=> bm!45946 (= call!45947 (getCurrentListMapNoExtraKeys!4224 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1099198 () Bool)

(assert (=> b!1099198 (= e!627361 (validKeyInArray!0 (select (arr!34241 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099199 () Bool)

(assert (=> b!1099199 (= e!627360 call!45949)))

(declare-fun b!1099200 () Bool)

(assert (=> b!1099200 (= e!627366 e!627358)))

(declare-fun c!108543 () Bool)

(assert (=> b!1099200 (= c!108543 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!130325 c!108540) b!1099180))

(assert (= (and d!130325 (not c!108540)) b!1099181))

(assert (= (and b!1099181 c!108539) b!1099199))

(assert (= (and b!1099181 (not c!108539)) b!1099197))

(assert (= (and b!1099197 c!108544) b!1099186))

(assert (= (and b!1099197 (not c!108544)) b!1099189))

(assert (= (or b!1099186 b!1099189) bm!45942))

(assert (= (or b!1099199 bm!45942) bm!45943))

(assert (= (or b!1099199 b!1099186) bm!45940))

(assert (= (or b!1099180 bm!45943) bm!45946))

(assert (= (or b!1099180 bm!45940) bm!45945))

(assert (= (and d!130325 res!733579) b!1099188))

(assert (= (and d!130325 c!108541) b!1099196))

(assert (= (and d!130325 (not c!108541)) b!1099195))

(assert (= (and d!130325 res!733578) b!1099184))

(assert (= (and b!1099184 res!733586) b!1099198))

(assert (= (and b!1099184 (not res!733580)) b!1099193))

(assert (= (and b!1099193 res!733581) b!1099183))

(assert (= (and b!1099184 res!733582) b!1099194))

(assert (= (and b!1099194 c!108542) b!1099185))

(assert (= (and b!1099194 (not c!108542)) b!1099192))

(assert (= (and b!1099185 res!733585) b!1099182))

(assert (= (or b!1099185 b!1099192) bm!45941))

(assert (= (and b!1099194 res!733584) b!1099200))

(assert (= (and b!1099200 c!108543) b!1099190))

(assert (= (and b!1099200 (not c!108543)) b!1099191))

(assert (= (and b!1099190 res!733583) b!1099187))

(assert (= (or b!1099190 b!1099191) bm!45944))

(declare-fun b_lambda!17877 () Bool)

(assert (=> (not b_lambda!17877) (not b!1099183)))

(assert (=> b!1099183 t!34134))

(declare-fun b_and!36931 () Bool)

(assert (= b_and!36921 (and (=> t!34134 result!16481) b_and!36931)))

(assert (=> b!1099193 m!1018649))

(assert (=> b!1099193 m!1018649))

(declare-fun m!1018663 () Bool)

(assert (=> b!1099193 m!1018663))

(declare-fun m!1018665 () Bool)

(assert (=> b!1099196 m!1018665))

(declare-fun m!1018667 () Bool)

(assert (=> b!1099196 m!1018667))

(assert (=> b!1099196 m!1018549))

(declare-fun m!1018669 () Bool)

(assert (=> b!1099196 m!1018669))

(assert (=> b!1099196 m!1018665))

(declare-fun m!1018671 () Bool)

(assert (=> b!1099196 m!1018671))

(assert (=> b!1099196 m!1018667))

(declare-fun m!1018673 () Bool)

(assert (=> b!1099196 m!1018673))

(assert (=> b!1099196 m!1018649))

(declare-fun m!1018675 () Bool)

(assert (=> b!1099196 m!1018675))

(declare-fun m!1018677 () Bool)

(assert (=> b!1099196 m!1018677))

(declare-fun m!1018679 () Bool)

(assert (=> b!1099196 m!1018679))

(declare-fun m!1018681 () Bool)

(assert (=> b!1099196 m!1018681))

(declare-fun m!1018683 () Bool)

(assert (=> b!1099196 m!1018683))

(assert (=> b!1099196 m!1018677))

(declare-fun m!1018685 () Bool)

(assert (=> b!1099196 m!1018685))

(declare-fun m!1018687 () Bool)

(assert (=> b!1099196 m!1018687))

(declare-fun m!1018689 () Bool)

(assert (=> b!1099196 m!1018689))

(declare-fun m!1018691 () Bool)

(assert (=> b!1099196 m!1018691))

(assert (=> b!1099196 m!1018669))

(declare-fun m!1018693 () Bool)

(assert (=> b!1099196 m!1018693))

(declare-fun m!1018695 () Bool)

(assert (=> b!1099183 m!1018695))

(assert (=> b!1099183 m!1018649))

(declare-fun m!1018697 () Bool)

(assert (=> b!1099183 m!1018697))

(assert (=> b!1099183 m!1018649))

(assert (=> b!1099183 m!1018695))

(assert (=> b!1099183 m!1018539))

(declare-fun m!1018699 () Bool)

(assert (=> b!1099183 m!1018699))

(assert (=> b!1099183 m!1018539))

(assert (=> bm!45946 m!1018549))

(assert (=> b!1099188 m!1018649))

(assert (=> b!1099188 m!1018649))

(assert (=> b!1099188 m!1018659))

(declare-fun m!1018701 () Bool)

(assert (=> bm!45944 m!1018701))

(declare-fun m!1018703 () Bool)

(assert (=> b!1099187 m!1018703))

(declare-fun m!1018705 () Bool)

(assert (=> b!1099182 m!1018705))

(declare-fun m!1018707 () Bool)

(assert (=> bm!45945 m!1018707))

(assert (=> d!130325 m!1018523))

(declare-fun m!1018709 () Bool)

(assert (=> b!1099180 m!1018709))

(declare-fun m!1018711 () Bool)

(assert (=> bm!45941 m!1018711))

(assert (=> b!1099198 m!1018649))

(assert (=> b!1099198 m!1018649))

(assert (=> b!1099198 m!1018659))

(assert (=> b!1099023 d!130325))

(declare-fun b!1099201 () Bool)

(declare-fun e!627368 () ListLongMap!15363)

(declare-fun call!45951 () ListLongMap!15363)

(assert (=> b!1099201 (= e!627368 (+!3409 call!45951 (tuple2!17395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun d!130327 () Bool)

(declare-fun e!627379 () Bool)

(assert (=> d!130327 e!627379))

(declare-fun res!733587 () Bool)

(assert (=> d!130327 (=> (not res!733587) (not e!627379))))

(assert (=> d!130327 (= res!733587 (or (bvsge #b00000000000000000000000000000000 (size!34779 lt!491910)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34779 lt!491910)))))))

(declare-fun lt!492053 () ListLongMap!15363)

(declare-fun lt!492061 () ListLongMap!15363)

(assert (=> d!130327 (= lt!492053 lt!492061)))

(declare-fun lt!492049 () Unit!35979)

(declare-fun e!627369 () Unit!35979)

(assert (=> d!130327 (= lt!492049 e!627369)))

(declare-fun c!108547 () Bool)

(declare-fun e!627378 () Bool)

(assert (=> d!130327 (= c!108547 e!627378)))

(declare-fun res!733588 () Bool)

(assert (=> d!130327 (=> (not res!733588) (not e!627378))))

(assert (=> d!130327 (= res!733588 (bvslt #b00000000000000000000000000000000 (size!34779 lt!491910)))))

(assert (=> d!130327 (= lt!492061 e!627368)))

(declare-fun c!108546 () Bool)

(assert (=> d!130327 (= c!108546 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130327 (validMask!0 mask!1414)))

(assert (=> d!130327 (= (getCurrentListMap!4317 lt!491910 lt!491909 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492053)))

(declare-fun bm!45947 () Bool)

(declare-fun call!45956 () ListLongMap!15363)

(assert (=> bm!45947 (= call!45956 call!45951)))

(declare-fun b!1099202 () Bool)

(declare-fun e!627373 () ListLongMap!15363)

(assert (=> b!1099202 (= e!627368 e!627373)))

(declare-fun c!108545 () Bool)

(assert (=> b!1099202 (= c!108545 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1099203 () Bool)

(declare-fun e!627372 () Bool)

(assert (=> b!1099203 (= e!627372 (= (apply!940 lt!492053 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun e!627376 () Bool)

(declare-fun b!1099204 () Bool)

(assert (=> b!1099204 (= e!627376 (= (apply!940 lt!492053 (select (arr!34241 lt!491910) #b00000000000000000000000000000000)) (get!17626 (select (arr!34242 lt!491909) #b00000000000000000000000000000000) (dynLambda!2293 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1099204 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34780 lt!491909)))))

(assert (=> b!1099204 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34779 lt!491910)))))

(declare-fun b!1099205 () Bool)

(declare-fun res!733591 () Bool)

(assert (=> b!1099205 (=> (not res!733591) (not e!627379))))

(declare-fun e!627375 () Bool)

(assert (=> b!1099205 (= res!733591 e!627375)))

(declare-fun res!733589 () Bool)

(assert (=> b!1099205 (=> res!733589 e!627375)))

(declare-fun e!627374 () Bool)

(assert (=> b!1099205 (= res!733589 (not e!627374))))

(declare-fun res!733595 () Bool)

(assert (=> b!1099205 (=> (not res!733595) (not e!627374))))

(assert (=> b!1099205 (= res!733595 (bvslt #b00000000000000000000000000000000 (size!34779 lt!491910)))))

(declare-fun bm!45948 () Bool)

(declare-fun call!45952 () Bool)

(assert (=> bm!45948 (= call!45952 (contains!6359 lt!492053 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45949 () Bool)

(declare-fun call!45950 () ListLongMap!15363)

(declare-fun call!45953 () ListLongMap!15363)

(assert (=> bm!45949 (= call!45950 call!45953)))

(declare-fun bm!45950 () Bool)

(declare-fun call!45954 () ListLongMap!15363)

(assert (=> bm!45950 (= call!45953 call!45954)))

(declare-fun b!1099206 () Bool)

(declare-fun e!627367 () Bool)

(assert (=> b!1099206 (= e!627367 e!627372)))

(declare-fun res!733594 () Bool)

(assert (=> b!1099206 (= res!733594 call!45952)))

(assert (=> b!1099206 (=> (not res!733594) (not e!627372))))

(declare-fun bm!45951 () Bool)

(declare-fun call!45955 () Bool)

(assert (=> bm!45951 (= call!45955 (contains!6359 lt!492053 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1099207 () Bool)

(declare-fun e!627377 () ListLongMap!15363)

(assert (=> b!1099207 (= e!627377 call!45956)))

(declare-fun b!1099208 () Bool)

(declare-fun e!627370 () Bool)

(assert (=> b!1099208 (= e!627370 (= (apply!940 lt!492053 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1099209 () Bool)

(assert (=> b!1099209 (= e!627378 (validKeyInArray!0 (select (arr!34241 lt!491910) #b00000000000000000000000000000000)))))

(declare-fun b!1099210 () Bool)

(assert (=> b!1099210 (= e!627377 call!45950)))

(declare-fun b!1099211 () Bool)

(declare-fun e!627371 () Bool)

(assert (=> b!1099211 (= e!627371 e!627370)))

(declare-fun res!733592 () Bool)

(assert (=> b!1099211 (= res!733592 call!45955)))

(assert (=> b!1099211 (=> (not res!733592) (not e!627370))))

(declare-fun b!1099212 () Bool)

(assert (=> b!1099212 (= e!627371 (not call!45955))))

(declare-fun b!1099213 () Bool)

(assert (=> b!1099213 (= e!627367 (not call!45952))))

(declare-fun b!1099214 () Bool)

(assert (=> b!1099214 (= e!627375 e!627376)))

(declare-fun res!733590 () Bool)

(assert (=> b!1099214 (=> (not res!733590) (not e!627376))))

(assert (=> b!1099214 (= res!733590 (contains!6359 lt!492053 (select (arr!34241 lt!491910) #b00000000000000000000000000000000)))))

(assert (=> b!1099214 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34779 lt!491910)))))

(declare-fun b!1099215 () Bool)

(declare-fun res!733593 () Bool)

(assert (=> b!1099215 (=> (not res!733593) (not e!627379))))

(assert (=> b!1099215 (= res!733593 e!627367)))

(declare-fun c!108548 () Bool)

(assert (=> b!1099215 (= c!108548 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1099216 () Bool)

(declare-fun Unit!35984 () Unit!35979)

(assert (=> b!1099216 (= e!627369 Unit!35984)))

(declare-fun bm!45952 () Bool)

(assert (=> bm!45952 (= call!45951 (+!3409 (ite c!108546 call!45954 (ite c!108545 call!45953 call!45950)) (ite (or c!108546 c!108545) (tuple2!17395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1099217 () Bool)

(declare-fun lt!492050 () Unit!35979)

(assert (=> b!1099217 (= e!627369 lt!492050)))

(declare-fun lt!492060 () ListLongMap!15363)

(assert (=> b!1099217 (= lt!492060 (getCurrentListMapNoExtraKeys!4224 lt!491910 lt!491909 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492062 () (_ BitVec 64))

(assert (=> b!1099217 (= lt!492062 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492063 () (_ BitVec 64))

(assert (=> b!1099217 (= lt!492063 (select (arr!34241 lt!491910) #b00000000000000000000000000000000))))

(declare-fun lt!492052 () Unit!35979)

(assert (=> b!1099217 (= lt!492052 (addStillContains!653 lt!492060 lt!492062 zeroValue!831 lt!492063))))

(assert (=> b!1099217 (contains!6359 (+!3409 lt!492060 (tuple2!17395 lt!492062 zeroValue!831)) lt!492063)))

(declare-fun lt!492066 () Unit!35979)

(assert (=> b!1099217 (= lt!492066 lt!492052)))

(declare-fun lt!492047 () ListLongMap!15363)

(assert (=> b!1099217 (= lt!492047 (getCurrentListMapNoExtraKeys!4224 lt!491910 lt!491909 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492067 () (_ BitVec 64))

(assert (=> b!1099217 (= lt!492067 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492057 () (_ BitVec 64))

(assert (=> b!1099217 (= lt!492057 (select (arr!34241 lt!491910) #b00000000000000000000000000000000))))

(declare-fun lt!492059 () Unit!35979)

(assert (=> b!1099217 (= lt!492059 (addApplyDifferent!509 lt!492047 lt!492067 minValue!831 lt!492057))))

(assert (=> b!1099217 (= (apply!940 (+!3409 lt!492047 (tuple2!17395 lt!492067 minValue!831)) lt!492057) (apply!940 lt!492047 lt!492057))))

(declare-fun lt!492055 () Unit!35979)

(assert (=> b!1099217 (= lt!492055 lt!492059)))

(declare-fun lt!492064 () ListLongMap!15363)

(assert (=> b!1099217 (= lt!492064 (getCurrentListMapNoExtraKeys!4224 lt!491910 lt!491909 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492058 () (_ BitVec 64))

(assert (=> b!1099217 (= lt!492058 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492068 () (_ BitVec 64))

(assert (=> b!1099217 (= lt!492068 (select (arr!34241 lt!491910) #b00000000000000000000000000000000))))

(declare-fun lt!492065 () Unit!35979)

(assert (=> b!1099217 (= lt!492065 (addApplyDifferent!509 lt!492064 lt!492058 zeroValue!831 lt!492068))))

(assert (=> b!1099217 (= (apply!940 (+!3409 lt!492064 (tuple2!17395 lt!492058 zeroValue!831)) lt!492068) (apply!940 lt!492064 lt!492068))))

(declare-fun lt!492051 () Unit!35979)

(assert (=> b!1099217 (= lt!492051 lt!492065)))

(declare-fun lt!492056 () ListLongMap!15363)

(assert (=> b!1099217 (= lt!492056 (getCurrentListMapNoExtraKeys!4224 lt!491910 lt!491909 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492048 () (_ BitVec 64))

(assert (=> b!1099217 (= lt!492048 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492054 () (_ BitVec 64))

(assert (=> b!1099217 (= lt!492054 (select (arr!34241 lt!491910) #b00000000000000000000000000000000))))

(assert (=> b!1099217 (= lt!492050 (addApplyDifferent!509 lt!492056 lt!492048 minValue!831 lt!492054))))

(assert (=> b!1099217 (= (apply!940 (+!3409 lt!492056 (tuple2!17395 lt!492048 minValue!831)) lt!492054) (apply!940 lt!492056 lt!492054))))

(declare-fun b!1099218 () Bool)

(declare-fun c!108550 () Bool)

(assert (=> b!1099218 (= c!108550 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1099218 (= e!627373 e!627377)))

(declare-fun bm!45953 () Bool)

(assert (=> bm!45953 (= call!45954 (getCurrentListMapNoExtraKeys!4224 lt!491910 lt!491909 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1099219 () Bool)

(assert (=> b!1099219 (= e!627374 (validKeyInArray!0 (select (arr!34241 lt!491910) #b00000000000000000000000000000000)))))

(declare-fun b!1099220 () Bool)

(assert (=> b!1099220 (= e!627373 call!45956)))

(declare-fun b!1099221 () Bool)

(assert (=> b!1099221 (= e!627379 e!627371)))

(declare-fun c!108549 () Bool)

(assert (=> b!1099221 (= c!108549 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!130327 c!108546) b!1099201))

(assert (= (and d!130327 (not c!108546)) b!1099202))

(assert (= (and b!1099202 c!108545) b!1099220))

(assert (= (and b!1099202 (not c!108545)) b!1099218))

(assert (= (and b!1099218 c!108550) b!1099207))

(assert (= (and b!1099218 (not c!108550)) b!1099210))

(assert (= (or b!1099207 b!1099210) bm!45949))

(assert (= (or b!1099220 bm!45949) bm!45950))

(assert (= (or b!1099220 b!1099207) bm!45947))

(assert (= (or b!1099201 bm!45950) bm!45953))

(assert (= (or b!1099201 bm!45947) bm!45952))

(assert (= (and d!130327 res!733588) b!1099209))

(assert (= (and d!130327 c!108547) b!1099217))

(assert (= (and d!130327 (not c!108547)) b!1099216))

(assert (= (and d!130327 res!733587) b!1099205))

(assert (= (and b!1099205 res!733595) b!1099219))

(assert (= (and b!1099205 (not res!733589)) b!1099214))

(assert (= (and b!1099214 res!733590) b!1099204))

(assert (= (and b!1099205 res!733591) b!1099215))

(assert (= (and b!1099215 c!108548) b!1099206))

(assert (= (and b!1099215 (not c!108548)) b!1099213))

(assert (= (and b!1099206 res!733594) b!1099203))

(assert (= (or b!1099206 b!1099213) bm!45948))

(assert (= (and b!1099215 res!733593) b!1099221))

(assert (= (and b!1099221 c!108549) b!1099211))

(assert (= (and b!1099221 (not c!108549)) b!1099212))

(assert (= (and b!1099211 res!733592) b!1099208))

(assert (= (or b!1099211 b!1099212) bm!45951))

(declare-fun b_lambda!17879 () Bool)

(assert (=> (not b_lambda!17879) (not b!1099204)))

(assert (=> b!1099204 t!34134))

(declare-fun b_and!36933 () Bool)

(assert (= b_and!36931 (and (=> t!34134 result!16481) b_and!36933)))

(declare-fun m!1018713 () Bool)

(assert (=> b!1099214 m!1018713))

(assert (=> b!1099214 m!1018713))

(declare-fun m!1018715 () Bool)

(assert (=> b!1099214 m!1018715))

(declare-fun m!1018717 () Bool)

(assert (=> b!1099217 m!1018717))

(declare-fun m!1018719 () Bool)

(assert (=> b!1099217 m!1018719))

(assert (=> b!1099217 m!1018543))

(declare-fun m!1018721 () Bool)

(assert (=> b!1099217 m!1018721))

(assert (=> b!1099217 m!1018717))

(declare-fun m!1018723 () Bool)

(assert (=> b!1099217 m!1018723))

(assert (=> b!1099217 m!1018719))

(declare-fun m!1018725 () Bool)

(assert (=> b!1099217 m!1018725))

(assert (=> b!1099217 m!1018713))

(declare-fun m!1018727 () Bool)

(assert (=> b!1099217 m!1018727))

(declare-fun m!1018729 () Bool)

(assert (=> b!1099217 m!1018729))

(declare-fun m!1018731 () Bool)

(assert (=> b!1099217 m!1018731))

(declare-fun m!1018733 () Bool)

(assert (=> b!1099217 m!1018733))

(declare-fun m!1018735 () Bool)

(assert (=> b!1099217 m!1018735))

(assert (=> b!1099217 m!1018729))

(declare-fun m!1018737 () Bool)

(assert (=> b!1099217 m!1018737))

(declare-fun m!1018739 () Bool)

(assert (=> b!1099217 m!1018739))

(declare-fun m!1018741 () Bool)

(assert (=> b!1099217 m!1018741))

(declare-fun m!1018743 () Bool)

(assert (=> b!1099217 m!1018743))

(assert (=> b!1099217 m!1018721))

(declare-fun m!1018745 () Bool)

(assert (=> b!1099217 m!1018745))

(declare-fun m!1018747 () Bool)

(assert (=> b!1099204 m!1018747))

(assert (=> b!1099204 m!1018713))

(declare-fun m!1018749 () Bool)

(assert (=> b!1099204 m!1018749))

(assert (=> b!1099204 m!1018713))

(assert (=> b!1099204 m!1018747))

(assert (=> b!1099204 m!1018539))

(declare-fun m!1018751 () Bool)

(assert (=> b!1099204 m!1018751))

(assert (=> b!1099204 m!1018539))

(assert (=> bm!45953 m!1018543))

(assert (=> b!1099209 m!1018713))

(assert (=> b!1099209 m!1018713))

(declare-fun m!1018753 () Bool)

(assert (=> b!1099209 m!1018753))

(declare-fun m!1018755 () Bool)

(assert (=> bm!45951 m!1018755))

(declare-fun m!1018757 () Bool)

(assert (=> b!1099208 m!1018757))

(declare-fun m!1018759 () Bool)

(assert (=> b!1099203 m!1018759))

(declare-fun m!1018761 () Bool)

(assert (=> bm!45952 m!1018761))

(assert (=> d!130327 m!1018523))

(declare-fun m!1018763 () Bool)

(assert (=> b!1099201 m!1018763))

(declare-fun m!1018765 () Bool)

(assert (=> bm!45948 m!1018765))

(assert (=> b!1099219 m!1018713))

(assert (=> b!1099219 m!1018713))

(assert (=> b!1099219 m!1018753))

(assert (=> b!1099023 d!130327))

(declare-fun e!627384 () Bool)

(declare-fun call!45962 () ListLongMap!15363)

(declare-fun call!45961 () ListLongMap!15363)

(declare-fun b!1099228 () Bool)

(assert (=> b!1099228 (= e!627384 (= call!45961 (-!932 call!45962 k0!904)))))

(assert (=> b!1099228 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34780 _values!874)))))

(declare-fun bm!45958 () Bool)

(assert (=> bm!45958 (= call!45962 (getCurrentListMapNoExtraKeys!4224 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!45959 () Bool)

(assert (=> bm!45959 (= call!45961 (getCurrentListMapNoExtraKeys!4224 (array!71147 (store (arr!34241 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34779 _keys!1070)) (array!71149 (store (arr!34242 _values!874) i!650 (ValueCellFull!12872 (dynLambda!2293 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34780 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1099229 () Bool)

(assert (=> b!1099229 (= e!627384 (= call!45961 call!45962))))

(assert (=> b!1099229 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34780 _values!874)))))

(declare-fun d!130329 () Bool)

(declare-fun e!627385 () Bool)

(assert (=> d!130329 e!627385))

(declare-fun res!733598 () Bool)

(assert (=> d!130329 (=> (not res!733598) (not e!627385))))

(assert (=> d!130329 (= res!733598 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34779 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34779 _keys!1070))))))))

(declare-fun lt!492071 () Unit!35979)

(declare-fun choose!1774 (array!71146 array!71148 (_ BitVec 32) (_ BitVec 32) V!41345 V!41345 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35979)

(assert (=> d!130329 (= lt!492071 (choose!1774 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130329 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34779 _keys!1070)))))

(assert (=> d!130329 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!206 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!492071)))

(declare-fun b!1099230 () Bool)

(assert (=> b!1099230 (= e!627385 e!627384)))

(declare-fun c!108553 () Bool)

(assert (=> b!1099230 (= c!108553 (bvsle #b00000000000000000000000000000000 i!650))))

(assert (= (and d!130329 res!733598) b!1099230))

(assert (= (and b!1099230 c!108553) b!1099228))

(assert (= (and b!1099230 (not c!108553)) b!1099229))

(assert (= (or b!1099228 b!1099229) bm!45958))

(assert (= (or b!1099228 b!1099229) bm!45959))

(declare-fun b_lambda!17881 () Bool)

(assert (=> (not b_lambda!17881) (not bm!45959)))

(assert (=> bm!45959 t!34134))

(declare-fun b_and!36935 () Bool)

(assert (= b_and!36933 (and (=> t!34134 result!16481) b_and!36935)))

(declare-fun m!1018767 () Bool)

(assert (=> b!1099228 m!1018767))

(assert (=> bm!45958 m!1018549))

(assert (=> bm!45959 m!1018535))

(assert (=> bm!45959 m!1018539))

(assert (=> bm!45959 m!1018541))

(declare-fun m!1018769 () Bool)

(assert (=> bm!45959 m!1018769))

(declare-fun m!1018771 () Bool)

(assert (=> d!130329 m!1018771))

(assert (=> b!1099023 d!130329))

(declare-fun b!1099255 () Bool)

(declare-fun lt!492090 () Unit!35979)

(declare-fun lt!492089 () Unit!35979)

(assert (=> b!1099255 (= lt!492090 lt!492089)))

(declare-fun lt!492091 () ListLongMap!15363)

(declare-fun lt!492086 () (_ BitVec 64))

(declare-fun lt!492088 () (_ BitVec 64))

(declare-fun lt!492087 () V!41345)

(assert (=> b!1099255 (not (contains!6359 (+!3409 lt!492091 (tuple2!17395 lt!492086 lt!492087)) lt!492088))))

(declare-fun addStillNotContains!276 (ListLongMap!15363 (_ BitVec 64) V!41345 (_ BitVec 64)) Unit!35979)

(assert (=> b!1099255 (= lt!492089 (addStillNotContains!276 lt!492091 lt!492086 lt!492087 lt!492088))))

(assert (=> b!1099255 (= lt!492088 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1099255 (= lt!492087 (get!17626 (select (arr!34242 lt!491909) #b00000000000000000000000000000000) (dynLambda!2293 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1099255 (= lt!492086 (select (arr!34241 lt!491910) #b00000000000000000000000000000000))))

(declare-fun call!45965 () ListLongMap!15363)

(assert (=> b!1099255 (= lt!492091 call!45965)))

(declare-fun e!627402 () ListLongMap!15363)

(assert (=> b!1099255 (= e!627402 (+!3409 call!45965 (tuple2!17395 (select (arr!34241 lt!491910) #b00000000000000000000000000000000) (get!17626 (select (arr!34242 lt!491909) #b00000000000000000000000000000000) (dynLambda!2293 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1099256 () Bool)

(declare-fun res!733607 () Bool)

(declare-fun e!627403 () Bool)

(assert (=> b!1099256 (=> (not res!733607) (not e!627403))))

(declare-fun lt!492092 () ListLongMap!15363)

(assert (=> b!1099256 (= res!733607 (not (contains!6359 lt!492092 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1099257 () Bool)

(declare-fun e!627406 () Bool)

(assert (=> b!1099257 (= e!627406 (validKeyInArray!0 (select (arr!34241 lt!491910) #b00000000000000000000000000000000)))))

(assert (=> b!1099257 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1099259 () Bool)

(declare-fun e!627401 () Bool)

(declare-fun isEmpty!970 (ListLongMap!15363) Bool)

(assert (=> b!1099259 (= e!627401 (isEmpty!970 lt!492092))))

(declare-fun b!1099260 () Bool)

(assert (=> b!1099260 (= e!627402 call!45965)))

(declare-fun b!1099261 () Bool)

(declare-fun e!627400 () Bool)

(assert (=> b!1099261 (= e!627400 e!627401)))

(declare-fun c!108563 () Bool)

(assert (=> b!1099261 (= c!108563 (bvslt #b00000000000000000000000000000000 (size!34779 lt!491910)))))

(declare-fun b!1099262 () Bool)

(assert (=> b!1099262 (= e!627401 (= lt!492092 (getCurrentListMapNoExtraKeys!4224 lt!491910 lt!491909 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun bm!45962 () Bool)

(assert (=> bm!45962 (= call!45965 (getCurrentListMapNoExtraKeys!4224 lt!491910 lt!491909 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1099263 () Bool)

(declare-fun e!627405 () ListLongMap!15363)

(assert (=> b!1099263 (= e!627405 (ListLongMap!15364 Nil!23982))))

(declare-fun b!1099264 () Bool)

(assert (=> b!1099264 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34779 lt!491910)))))

(assert (=> b!1099264 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34780 lt!491909)))))

(declare-fun e!627404 () Bool)

(assert (=> b!1099264 (= e!627404 (= (apply!940 lt!492092 (select (arr!34241 lt!491910) #b00000000000000000000000000000000)) (get!17626 (select (arr!34242 lt!491909) #b00000000000000000000000000000000) (dynLambda!2293 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1099265 () Bool)

(assert (=> b!1099265 (= e!627403 e!627400)))

(declare-fun c!108565 () Bool)

(assert (=> b!1099265 (= c!108565 e!627406)))

(declare-fun res!733609 () Bool)

(assert (=> b!1099265 (=> (not res!733609) (not e!627406))))

(assert (=> b!1099265 (= res!733609 (bvslt #b00000000000000000000000000000000 (size!34779 lt!491910)))))

(declare-fun b!1099266 () Bool)

(assert (=> b!1099266 (= e!627400 e!627404)))

(assert (=> b!1099266 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34779 lt!491910)))))

(declare-fun res!733608 () Bool)

(assert (=> b!1099266 (= res!733608 (contains!6359 lt!492092 (select (arr!34241 lt!491910) #b00000000000000000000000000000000)))))

(assert (=> b!1099266 (=> (not res!733608) (not e!627404))))

(declare-fun d!130331 () Bool)

(assert (=> d!130331 e!627403))

(declare-fun res!733610 () Bool)

(assert (=> d!130331 (=> (not res!733610) (not e!627403))))

(assert (=> d!130331 (= res!733610 (not (contains!6359 lt!492092 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130331 (= lt!492092 e!627405)))

(declare-fun c!108564 () Bool)

(assert (=> d!130331 (= c!108564 (bvsge #b00000000000000000000000000000000 (size!34779 lt!491910)))))

(assert (=> d!130331 (validMask!0 mask!1414)))

(assert (=> d!130331 (= (getCurrentListMapNoExtraKeys!4224 lt!491910 lt!491909 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492092)))

(declare-fun b!1099258 () Bool)

(assert (=> b!1099258 (= e!627405 e!627402)))

(declare-fun c!108562 () Bool)

(assert (=> b!1099258 (= c!108562 (validKeyInArray!0 (select (arr!34241 lt!491910) #b00000000000000000000000000000000)))))

(assert (= (and d!130331 c!108564) b!1099263))

(assert (= (and d!130331 (not c!108564)) b!1099258))

(assert (= (and b!1099258 c!108562) b!1099255))

(assert (= (and b!1099258 (not c!108562)) b!1099260))

(assert (= (or b!1099255 b!1099260) bm!45962))

(assert (= (and d!130331 res!733610) b!1099256))

(assert (= (and b!1099256 res!733607) b!1099265))

(assert (= (and b!1099265 res!733609) b!1099257))

(assert (= (and b!1099265 c!108565) b!1099266))

(assert (= (and b!1099265 (not c!108565)) b!1099261))

(assert (= (and b!1099266 res!733608) b!1099264))

(assert (= (and b!1099261 c!108563) b!1099262))

(assert (= (and b!1099261 (not c!108563)) b!1099259))

(declare-fun b_lambda!17883 () Bool)

(assert (=> (not b_lambda!17883) (not b!1099255)))

(assert (=> b!1099255 t!34134))

(declare-fun b_and!36937 () Bool)

(assert (= b_and!36935 (and (=> t!34134 result!16481) b_and!36937)))

(declare-fun b_lambda!17885 () Bool)

(assert (=> (not b_lambda!17885) (not b!1099264)))

(assert (=> b!1099264 t!34134))

(declare-fun b_and!36939 () Bool)

(assert (= b_and!36937 (and (=> t!34134 result!16481) b_and!36939)))

(declare-fun m!1018773 () Bool)

(assert (=> b!1099259 m!1018773))

(declare-fun m!1018775 () Bool)

(assert (=> b!1099262 m!1018775))

(assert (=> b!1099264 m!1018713))

(assert (=> b!1099264 m!1018747))

(assert (=> b!1099264 m!1018713))

(declare-fun m!1018777 () Bool)

(assert (=> b!1099264 m!1018777))

(assert (=> b!1099264 m!1018747))

(assert (=> b!1099264 m!1018539))

(assert (=> b!1099264 m!1018751))

(assert (=> b!1099264 m!1018539))

(declare-fun m!1018779 () Bool)

(assert (=> b!1099256 m!1018779))

(assert (=> b!1099257 m!1018713))

(assert (=> b!1099257 m!1018713))

(assert (=> b!1099257 m!1018753))

(assert (=> b!1099258 m!1018713))

(assert (=> b!1099258 m!1018713))

(assert (=> b!1099258 m!1018753))

(assert (=> b!1099266 m!1018713))

(assert (=> b!1099266 m!1018713))

(declare-fun m!1018781 () Bool)

(assert (=> b!1099266 m!1018781))

(assert (=> bm!45962 m!1018775))

(declare-fun m!1018783 () Bool)

(assert (=> d!130331 m!1018783))

(assert (=> d!130331 m!1018523))

(assert (=> b!1099255 m!1018713))

(assert (=> b!1099255 m!1018747))

(declare-fun m!1018785 () Bool)

(assert (=> b!1099255 m!1018785))

(declare-fun m!1018787 () Bool)

(assert (=> b!1099255 m!1018787))

(assert (=> b!1099255 m!1018747))

(assert (=> b!1099255 m!1018539))

(assert (=> b!1099255 m!1018751))

(assert (=> b!1099255 m!1018539))

(declare-fun m!1018789 () Bool)

(assert (=> b!1099255 m!1018789))

(assert (=> b!1099255 m!1018789))

(declare-fun m!1018791 () Bool)

(assert (=> b!1099255 m!1018791))

(assert (=> b!1099023 d!130331))

(declare-fun d!130333 () Bool)

(declare-fun lt!492095 () ListLongMap!15363)

(assert (=> d!130333 (not (contains!6359 lt!492095 k0!904))))

(declare-fun removeStrictlySorted!81 (List!23985 (_ BitVec 64)) List!23985)

(assert (=> d!130333 (= lt!492095 (ListLongMap!15364 (removeStrictlySorted!81 (toList!7697 lt!491911) k0!904)))))

(assert (=> d!130333 (= (-!932 lt!491911 k0!904) lt!492095)))

(declare-fun bs!32259 () Bool)

(assert (= bs!32259 d!130333))

(declare-fun m!1018793 () Bool)

(assert (=> bs!32259 m!1018793))

(declare-fun m!1018795 () Bool)

(assert (=> bs!32259 m!1018795))

(assert (=> b!1099023 d!130333))

(declare-fun b!1099267 () Bool)

(declare-fun lt!492100 () Unit!35979)

(declare-fun lt!492099 () Unit!35979)

(assert (=> b!1099267 (= lt!492100 lt!492099)))

(declare-fun lt!492097 () V!41345)

(declare-fun lt!492098 () (_ BitVec 64))

(declare-fun lt!492096 () (_ BitVec 64))

(declare-fun lt!492101 () ListLongMap!15363)

(assert (=> b!1099267 (not (contains!6359 (+!3409 lt!492101 (tuple2!17395 lt!492096 lt!492097)) lt!492098))))

(assert (=> b!1099267 (= lt!492099 (addStillNotContains!276 lt!492101 lt!492096 lt!492097 lt!492098))))

(assert (=> b!1099267 (= lt!492098 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1099267 (= lt!492097 (get!17626 (select (arr!34242 _values!874) #b00000000000000000000000000000000) (dynLambda!2293 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1099267 (= lt!492096 (select (arr!34241 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun call!45966 () ListLongMap!15363)

(assert (=> b!1099267 (= lt!492101 call!45966)))

(declare-fun e!627409 () ListLongMap!15363)

(assert (=> b!1099267 (= e!627409 (+!3409 call!45966 (tuple2!17395 (select (arr!34241 _keys!1070) #b00000000000000000000000000000000) (get!17626 (select (arr!34242 _values!874) #b00000000000000000000000000000000) (dynLambda!2293 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1099268 () Bool)

(declare-fun res!733611 () Bool)

(declare-fun e!627410 () Bool)

(assert (=> b!1099268 (=> (not res!733611) (not e!627410))))

(declare-fun lt!492102 () ListLongMap!15363)

(assert (=> b!1099268 (= res!733611 (not (contains!6359 lt!492102 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1099269 () Bool)

(declare-fun e!627413 () Bool)

(assert (=> b!1099269 (= e!627413 (validKeyInArray!0 (select (arr!34241 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1099269 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1099271 () Bool)

(declare-fun e!627408 () Bool)

(assert (=> b!1099271 (= e!627408 (isEmpty!970 lt!492102))))

(declare-fun b!1099272 () Bool)

(assert (=> b!1099272 (= e!627409 call!45966)))

(declare-fun b!1099273 () Bool)

(declare-fun e!627407 () Bool)

(assert (=> b!1099273 (= e!627407 e!627408)))

(declare-fun c!108567 () Bool)

(assert (=> b!1099273 (= c!108567 (bvslt #b00000000000000000000000000000000 (size!34779 _keys!1070)))))

(declare-fun b!1099274 () Bool)

(assert (=> b!1099274 (= e!627408 (= lt!492102 (getCurrentListMapNoExtraKeys!4224 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun bm!45963 () Bool)

(assert (=> bm!45963 (= call!45966 (getCurrentListMapNoExtraKeys!4224 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1099275 () Bool)

(declare-fun e!627412 () ListLongMap!15363)

(assert (=> b!1099275 (= e!627412 (ListLongMap!15364 Nil!23982))))

(declare-fun b!1099276 () Bool)

(assert (=> b!1099276 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34779 _keys!1070)))))

(assert (=> b!1099276 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34780 _values!874)))))

(declare-fun e!627411 () Bool)

(assert (=> b!1099276 (= e!627411 (= (apply!940 lt!492102 (select (arr!34241 _keys!1070) #b00000000000000000000000000000000)) (get!17626 (select (arr!34242 _values!874) #b00000000000000000000000000000000) (dynLambda!2293 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1099277 () Bool)

(assert (=> b!1099277 (= e!627410 e!627407)))

(declare-fun c!108569 () Bool)

(assert (=> b!1099277 (= c!108569 e!627413)))

(declare-fun res!733613 () Bool)

(assert (=> b!1099277 (=> (not res!733613) (not e!627413))))

(assert (=> b!1099277 (= res!733613 (bvslt #b00000000000000000000000000000000 (size!34779 _keys!1070)))))

(declare-fun b!1099278 () Bool)

(assert (=> b!1099278 (= e!627407 e!627411)))

(assert (=> b!1099278 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34779 _keys!1070)))))

(declare-fun res!733612 () Bool)

(assert (=> b!1099278 (= res!733612 (contains!6359 lt!492102 (select (arr!34241 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1099278 (=> (not res!733612) (not e!627411))))

(declare-fun d!130335 () Bool)

(assert (=> d!130335 e!627410))

(declare-fun res!733614 () Bool)

(assert (=> d!130335 (=> (not res!733614) (not e!627410))))

(assert (=> d!130335 (= res!733614 (not (contains!6359 lt!492102 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130335 (= lt!492102 e!627412)))

(declare-fun c!108568 () Bool)

(assert (=> d!130335 (= c!108568 (bvsge #b00000000000000000000000000000000 (size!34779 _keys!1070)))))

(assert (=> d!130335 (validMask!0 mask!1414)))

(assert (=> d!130335 (= (getCurrentListMapNoExtraKeys!4224 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492102)))

(declare-fun b!1099270 () Bool)

(assert (=> b!1099270 (= e!627412 e!627409)))

(declare-fun c!108566 () Bool)

(assert (=> b!1099270 (= c!108566 (validKeyInArray!0 (select (arr!34241 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130335 c!108568) b!1099275))

(assert (= (and d!130335 (not c!108568)) b!1099270))

(assert (= (and b!1099270 c!108566) b!1099267))

(assert (= (and b!1099270 (not c!108566)) b!1099272))

(assert (= (or b!1099267 b!1099272) bm!45963))

(assert (= (and d!130335 res!733614) b!1099268))

(assert (= (and b!1099268 res!733611) b!1099277))

(assert (= (and b!1099277 res!733613) b!1099269))

(assert (= (and b!1099277 c!108569) b!1099278))

(assert (= (and b!1099277 (not c!108569)) b!1099273))

(assert (= (and b!1099278 res!733612) b!1099276))

(assert (= (and b!1099273 c!108567) b!1099274))

(assert (= (and b!1099273 (not c!108567)) b!1099271))

(declare-fun b_lambda!17887 () Bool)

(assert (=> (not b_lambda!17887) (not b!1099267)))

(assert (=> b!1099267 t!34134))

(declare-fun b_and!36941 () Bool)

(assert (= b_and!36939 (and (=> t!34134 result!16481) b_and!36941)))

(declare-fun b_lambda!17889 () Bool)

(assert (=> (not b_lambda!17889) (not b!1099276)))

(assert (=> b!1099276 t!34134))

(declare-fun b_and!36943 () Bool)

(assert (= b_and!36941 (and (=> t!34134 result!16481) b_and!36943)))

(declare-fun m!1018797 () Bool)

(assert (=> b!1099271 m!1018797))

(declare-fun m!1018799 () Bool)

(assert (=> b!1099274 m!1018799))

(assert (=> b!1099276 m!1018649))

(assert (=> b!1099276 m!1018695))

(assert (=> b!1099276 m!1018649))

(declare-fun m!1018801 () Bool)

(assert (=> b!1099276 m!1018801))

(assert (=> b!1099276 m!1018695))

(assert (=> b!1099276 m!1018539))

(assert (=> b!1099276 m!1018699))

(assert (=> b!1099276 m!1018539))

(declare-fun m!1018803 () Bool)

(assert (=> b!1099268 m!1018803))

(assert (=> b!1099269 m!1018649))

(assert (=> b!1099269 m!1018649))

(assert (=> b!1099269 m!1018659))

(assert (=> b!1099270 m!1018649))

(assert (=> b!1099270 m!1018649))

(assert (=> b!1099270 m!1018659))

(assert (=> b!1099278 m!1018649))

(assert (=> b!1099278 m!1018649))

(declare-fun m!1018805 () Bool)

(assert (=> b!1099278 m!1018805))

(assert (=> bm!45963 m!1018799))

(declare-fun m!1018807 () Bool)

(assert (=> d!130335 m!1018807))

(assert (=> d!130335 m!1018523))

(assert (=> b!1099267 m!1018649))

(assert (=> b!1099267 m!1018695))

(declare-fun m!1018809 () Bool)

(assert (=> b!1099267 m!1018809))

(declare-fun m!1018811 () Bool)

(assert (=> b!1099267 m!1018811))

(assert (=> b!1099267 m!1018695))

(assert (=> b!1099267 m!1018539))

(assert (=> b!1099267 m!1018699))

(assert (=> b!1099267 m!1018539))

(declare-fun m!1018813 () Bool)

(assert (=> b!1099267 m!1018813))

(assert (=> b!1099267 m!1018813))

(declare-fun m!1018815 () Bool)

(assert (=> b!1099267 m!1018815))

(assert (=> b!1099023 d!130335))

(declare-fun d!130337 () Bool)

(assert (=> d!130337 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492105 () Unit!35979)

(declare-fun choose!13 (array!71146 (_ BitVec 64) (_ BitVec 32)) Unit!35979)

(assert (=> d!130337 (= lt!492105 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130337 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130337 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!492105)))

(declare-fun bs!32260 () Bool)

(assert (= bs!32260 d!130337))

(assert (=> bs!32260 m!1018545))

(declare-fun m!1018817 () Bool)

(assert (=> bs!32260 m!1018817))

(assert (=> b!1099023 d!130337))

(declare-fun b!1099289 () Bool)

(declare-fun e!627425 () Bool)

(declare-fun e!627423 () Bool)

(assert (=> b!1099289 (= e!627425 e!627423)))

(declare-fun c!108572 () Bool)

(assert (=> b!1099289 (= c!108572 (validKeyInArray!0 (select (arr!34241 lt!491910) #b00000000000000000000000000000000)))))

(declare-fun bm!45966 () Bool)

(declare-fun call!45969 () Bool)

(assert (=> bm!45966 (= call!45969 (arrayNoDuplicates!0 lt!491910 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108572 (Cons!23982 (select (arr!34241 lt!491910) #b00000000000000000000000000000000) Nil!23983) Nil!23983)))))

(declare-fun b!1099290 () Bool)

(assert (=> b!1099290 (= e!627423 call!45969)))

(declare-fun b!1099291 () Bool)

(declare-fun e!627422 () Bool)

(assert (=> b!1099291 (= e!627422 e!627425)))

(declare-fun res!733623 () Bool)

(assert (=> b!1099291 (=> (not res!733623) (not e!627425))))

(declare-fun e!627424 () Bool)

(assert (=> b!1099291 (= res!733623 (not e!627424))))

(declare-fun res!733622 () Bool)

(assert (=> b!1099291 (=> (not res!733622) (not e!627424))))

(assert (=> b!1099291 (= res!733622 (validKeyInArray!0 (select (arr!34241 lt!491910) #b00000000000000000000000000000000)))))

(declare-fun d!130339 () Bool)

(declare-fun res!733621 () Bool)

(assert (=> d!130339 (=> res!733621 e!627422)))

(assert (=> d!130339 (= res!733621 (bvsge #b00000000000000000000000000000000 (size!34779 lt!491910)))))

(assert (=> d!130339 (= (arrayNoDuplicates!0 lt!491910 #b00000000000000000000000000000000 Nil!23983) e!627422)))

(declare-fun b!1099292 () Bool)

(declare-fun contains!6360 (List!23986 (_ BitVec 64)) Bool)

(assert (=> b!1099292 (= e!627424 (contains!6360 Nil!23983 (select (arr!34241 lt!491910) #b00000000000000000000000000000000)))))

(declare-fun b!1099293 () Bool)

(assert (=> b!1099293 (= e!627423 call!45969)))

(assert (= (and d!130339 (not res!733621)) b!1099291))

(assert (= (and b!1099291 res!733622) b!1099292))

(assert (= (and b!1099291 res!733623) b!1099289))

(assert (= (and b!1099289 c!108572) b!1099290))

(assert (= (and b!1099289 (not c!108572)) b!1099293))

(assert (= (or b!1099290 b!1099293) bm!45966))

(assert (=> b!1099289 m!1018713))

(assert (=> b!1099289 m!1018713))

(assert (=> b!1099289 m!1018753))

(assert (=> bm!45966 m!1018713))

(declare-fun m!1018819 () Bool)

(assert (=> bm!45966 m!1018819))

(assert (=> b!1099291 m!1018713))

(assert (=> b!1099291 m!1018713))

(assert (=> b!1099291 m!1018753))

(assert (=> b!1099292 m!1018713))

(assert (=> b!1099292 m!1018713))

(declare-fun m!1018821 () Bool)

(assert (=> b!1099292 m!1018821))

(assert (=> b!1099028 d!130339))

(declare-fun d!130341 () Bool)

(assert (=> d!130341 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1099027 d!130341))

(declare-fun d!130343 () Bool)

(assert (=> d!130343 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96634 d!130343))

(declare-fun d!130345 () Bool)

(assert (=> d!130345 (= (array_inv!26410 _keys!1070) (bvsge (size!34779 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96634 d!130345))

(declare-fun d!130347 () Bool)

(assert (=> d!130347 (= (array_inv!26411 _values!874) (bvsge (size!34780 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96634 d!130347))

(declare-fun d!130349 () Bool)

(declare-fun e!627428 () Bool)

(assert (=> d!130349 e!627428))

(declare-fun res!733629 () Bool)

(assert (=> d!130349 (=> (not res!733629) (not e!627428))))

(declare-fun lt!492117 () ListLongMap!15363)

(assert (=> d!130349 (= res!733629 (contains!6359 lt!492117 (_1!8708 (tuple2!17395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(declare-fun lt!492116 () List!23985)

(assert (=> d!130349 (= lt!492117 (ListLongMap!15364 lt!492116))))

(declare-fun lt!492115 () Unit!35979)

(declare-fun lt!492114 () Unit!35979)

(assert (=> d!130349 (= lt!492115 lt!492114)))

(declare-datatypes ((Option!675 0))(
  ( (Some!674 (v!16265 V!41345)) (None!673) )
))
(declare-fun getValueByKey!624 (List!23985 (_ BitVec 64)) Option!675)

(assert (=> d!130349 (= (getValueByKey!624 lt!492116 (_1!8708 (tuple2!17395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))) (Some!674 (_2!8708 (tuple2!17395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(declare-fun lemmaContainsTupThenGetReturnValue!300 (List!23985 (_ BitVec 64) V!41345) Unit!35979)

(assert (=> d!130349 (= lt!492114 (lemmaContainsTupThenGetReturnValue!300 lt!492116 (_1!8708 (tuple2!17395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) (_2!8708 (tuple2!17395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(declare-fun insertStrictlySorted!393 (List!23985 (_ BitVec 64) V!41345) List!23985)

(assert (=> d!130349 (= lt!492116 (insertStrictlySorted!393 (toList!7697 lt!491915) (_1!8708 (tuple2!17395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) (_2!8708 (tuple2!17395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(assert (=> d!130349 (= (+!3409 lt!491915 (tuple2!17395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) lt!492117)))

(declare-fun b!1099298 () Bool)

(declare-fun res!733628 () Bool)

(assert (=> b!1099298 (=> (not res!733628) (not e!627428))))

(assert (=> b!1099298 (= res!733628 (= (getValueByKey!624 (toList!7697 lt!492117) (_1!8708 (tuple2!17395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))) (Some!674 (_2!8708 (tuple2!17395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)))))))

(declare-fun b!1099299 () Bool)

(declare-fun contains!6361 (List!23985 tuple2!17394) Bool)

(assert (=> b!1099299 (= e!627428 (contains!6361 (toList!7697 lt!492117) (tuple2!17395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)))))

(assert (= (and d!130349 res!733629) b!1099298))

(assert (= (and b!1099298 res!733628) b!1099299))

(declare-fun m!1018823 () Bool)

(assert (=> d!130349 m!1018823))

(declare-fun m!1018825 () Bool)

(assert (=> d!130349 m!1018825))

(declare-fun m!1018827 () Bool)

(assert (=> d!130349 m!1018827))

(declare-fun m!1018829 () Bool)

(assert (=> d!130349 m!1018829))

(declare-fun m!1018831 () Bool)

(assert (=> b!1099298 m!1018831))

(declare-fun m!1018833 () Bool)

(assert (=> b!1099299 m!1018833))

(assert (=> b!1099031 d!130349))

(declare-fun b!1099300 () Bool)

(declare-fun e!627432 () Bool)

(declare-fun e!627430 () Bool)

(assert (=> b!1099300 (= e!627432 e!627430)))

(declare-fun c!108573 () Bool)

(assert (=> b!1099300 (= c!108573 (validKeyInArray!0 (select (arr!34241 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45967 () Bool)

(declare-fun call!45970 () Bool)

(assert (=> bm!45967 (= call!45970 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108573 (Cons!23982 (select (arr!34241 _keys!1070) #b00000000000000000000000000000000) Nil!23983) Nil!23983)))))

(declare-fun b!1099301 () Bool)

(assert (=> b!1099301 (= e!627430 call!45970)))

(declare-fun b!1099302 () Bool)

(declare-fun e!627429 () Bool)

(assert (=> b!1099302 (= e!627429 e!627432)))

(declare-fun res!733632 () Bool)

(assert (=> b!1099302 (=> (not res!733632) (not e!627432))))

(declare-fun e!627431 () Bool)

(assert (=> b!1099302 (= res!733632 (not e!627431))))

(declare-fun res!733631 () Bool)

(assert (=> b!1099302 (=> (not res!733631) (not e!627431))))

(assert (=> b!1099302 (= res!733631 (validKeyInArray!0 (select (arr!34241 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130351 () Bool)

(declare-fun res!733630 () Bool)

(assert (=> d!130351 (=> res!733630 e!627429)))

(assert (=> d!130351 (= res!733630 (bvsge #b00000000000000000000000000000000 (size!34779 _keys!1070)))))

(assert (=> d!130351 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23983) e!627429)))

(declare-fun b!1099303 () Bool)

(assert (=> b!1099303 (= e!627431 (contains!6360 Nil!23983 (select (arr!34241 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099304 () Bool)

(assert (=> b!1099304 (= e!627430 call!45970)))

(assert (= (and d!130351 (not res!733630)) b!1099302))

(assert (= (and b!1099302 res!733631) b!1099303))

(assert (= (and b!1099302 res!733632) b!1099300))

(assert (= (and b!1099300 c!108573) b!1099301))

(assert (= (and b!1099300 (not c!108573)) b!1099304))

(assert (= (or b!1099301 b!1099304) bm!45967))

(assert (=> b!1099300 m!1018649))

(assert (=> b!1099300 m!1018649))

(assert (=> b!1099300 m!1018659))

(assert (=> bm!45967 m!1018649))

(declare-fun m!1018835 () Bool)

(assert (=> bm!45967 m!1018835))

(assert (=> b!1099302 m!1018649))

(assert (=> b!1099302 m!1018649))

(assert (=> b!1099302 m!1018659))

(assert (=> b!1099303 m!1018649))

(assert (=> b!1099303 m!1018649))

(declare-fun m!1018837 () Bool)

(assert (=> b!1099303 m!1018837))

(assert (=> b!1099026 d!130351))

(declare-fun b!1099305 () Bool)

(declare-fun e!627435 () Bool)

(declare-fun e!627433 () Bool)

(assert (=> b!1099305 (= e!627435 e!627433)))

(declare-fun lt!492118 () (_ BitVec 64))

(assert (=> b!1099305 (= lt!492118 (select (arr!34241 lt!491910) #b00000000000000000000000000000000))))

(declare-fun lt!492119 () Unit!35979)

(assert (=> b!1099305 (= lt!492119 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!491910 lt!492118 #b00000000000000000000000000000000))))

(assert (=> b!1099305 (arrayContainsKey!0 lt!491910 lt!492118 #b00000000000000000000000000000000)))

(declare-fun lt!492120 () Unit!35979)

(assert (=> b!1099305 (= lt!492120 lt!492119)))

(declare-fun res!733633 () Bool)

(assert (=> b!1099305 (= res!733633 (= (seekEntryOrOpen!0 (select (arr!34241 lt!491910) #b00000000000000000000000000000000) lt!491910 mask!1414) (Found!9909 #b00000000000000000000000000000000)))))

(assert (=> b!1099305 (=> (not res!733633) (not e!627433))))

(declare-fun d!130353 () Bool)

(declare-fun res!733634 () Bool)

(declare-fun e!627434 () Bool)

(assert (=> d!130353 (=> res!733634 e!627434)))

(assert (=> d!130353 (= res!733634 (bvsge #b00000000000000000000000000000000 (size!34779 lt!491910)))))

(assert (=> d!130353 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491910 mask!1414) e!627434)))

(declare-fun b!1099306 () Bool)

(declare-fun call!45971 () Bool)

(assert (=> b!1099306 (= e!627433 call!45971)))

(declare-fun b!1099307 () Bool)

(assert (=> b!1099307 (= e!627435 call!45971)))

(declare-fun bm!45968 () Bool)

(assert (=> bm!45968 (= call!45971 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!491910 mask!1414))))

(declare-fun b!1099308 () Bool)

(assert (=> b!1099308 (= e!627434 e!627435)))

(declare-fun c!108574 () Bool)

(assert (=> b!1099308 (= c!108574 (validKeyInArray!0 (select (arr!34241 lt!491910) #b00000000000000000000000000000000)))))

(assert (= (and d!130353 (not res!733634)) b!1099308))

(assert (= (and b!1099308 c!108574) b!1099305))

(assert (= (and b!1099308 (not c!108574)) b!1099307))

(assert (= (and b!1099305 res!733633) b!1099306))

(assert (= (or b!1099306 b!1099307) bm!45968))

(assert (=> b!1099305 m!1018713))

(declare-fun m!1018839 () Bool)

(assert (=> b!1099305 m!1018839))

(declare-fun m!1018841 () Bool)

(assert (=> b!1099305 m!1018841))

(assert (=> b!1099305 m!1018713))

(declare-fun m!1018843 () Bool)

(assert (=> b!1099305 m!1018843))

(declare-fun m!1018845 () Bool)

(assert (=> bm!45968 m!1018845))

(assert (=> b!1099308 m!1018713))

(assert (=> b!1099308 m!1018713))

(assert (=> b!1099308 m!1018753))

(assert (=> b!1099025 d!130353))

(declare-fun mapIsEmpty!42526 () Bool)

(declare-fun mapRes!42526 () Bool)

(assert (=> mapIsEmpty!42526 mapRes!42526))

(declare-fun mapNonEmpty!42526 () Bool)

(declare-fun tp!81293 () Bool)

(declare-fun e!627440 () Bool)

(assert (=> mapNonEmpty!42526 (= mapRes!42526 (and tp!81293 e!627440))))

(declare-fun mapRest!42526 () (Array (_ BitVec 32) ValueCell!12872))

(declare-fun mapKey!42526 () (_ BitVec 32))

(declare-fun mapValue!42526 () ValueCell!12872)

(assert (=> mapNonEmpty!42526 (= mapRest!42517 (store mapRest!42526 mapKey!42526 mapValue!42526))))

(declare-fun condMapEmpty!42526 () Bool)

(declare-fun mapDefault!42526 () ValueCell!12872)

(assert (=> mapNonEmpty!42517 (= condMapEmpty!42526 (= mapRest!42517 ((as const (Array (_ BitVec 32) ValueCell!12872)) mapDefault!42526)))))

(declare-fun e!627441 () Bool)

(assert (=> mapNonEmpty!42517 (= tp!81277 (and e!627441 mapRes!42526))))

(declare-fun b!1099316 () Bool)

(assert (=> b!1099316 (= e!627441 tp_is_empty!27163)))

(declare-fun b!1099315 () Bool)

(assert (=> b!1099315 (= e!627440 tp_is_empty!27163)))

(assert (= (and mapNonEmpty!42517 condMapEmpty!42526) mapIsEmpty!42526))

(assert (= (and mapNonEmpty!42517 (not condMapEmpty!42526)) mapNonEmpty!42526))

(assert (= (and mapNonEmpty!42526 ((_ is ValueCellFull!12872) mapValue!42526)) b!1099315))

(assert (= (and mapNonEmpty!42517 ((_ is ValueCellFull!12872) mapDefault!42526)) b!1099316))

(declare-fun m!1018847 () Bool)

(assert (=> mapNonEmpty!42526 m!1018847))

(declare-fun b_lambda!17891 () Bool)

(assert (= b_lambda!17885 (or (and start!96634 b_free!23113) b_lambda!17891)))

(declare-fun b_lambda!17893 () Bool)

(assert (= b_lambda!17887 (or (and start!96634 b_free!23113) b_lambda!17893)))

(declare-fun b_lambda!17895 () Bool)

(assert (= b_lambda!17879 (or (and start!96634 b_free!23113) b_lambda!17895)))

(declare-fun b_lambda!17897 () Bool)

(assert (= b_lambda!17889 (or (and start!96634 b_free!23113) b_lambda!17897)))

(declare-fun b_lambda!17899 () Bool)

(assert (= b_lambda!17883 (or (and start!96634 b_free!23113) b_lambda!17899)))

(declare-fun b_lambda!17901 () Bool)

(assert (= b_lambda!17881 (or (and start!96634 b_free!23113) b_lambda!17901)))

(declare-fun b_lambda!17903 () Bool)

(assert (= b_lambda!17877 (or (and start!96634 b_free!23113) b_lambda!17903)))

(check-sat (not bm!45963) (not b_lambda!17897) (not b!1099203) (not b!1099180) (not b!1099204) (not d!130329) (not b!1099268) (not b!1099308) (not b!1099276) (not b!1099128) (not b!1099196) (not bm!45958) (not d!130331) (not b!1099269) (not d!130333) (not b!1099267) (not b_lambda!17895) (not b!1099198) (not b!1099131) (not b_lambda!17903) (not b!1099289) (not b!1099201) (not bm!45945) (not bm!45967) (not b!1099278) (not bm!45953) (not b!1099219) (not d!130327) (not b!1099187) b_and!36943 (not bm!45951) (not bm!45959) (not b!1099256) (not bm!45962) (not bm!45966) (not b!1099266) (not b_lambda!17875) (not bm!45925) (not b!1099137) (not b!1099182) (not b!1099298) (not bm!45941) (not b!1099291) (not b_lambda!17899) (not b!1099274) (not bm!45968) (not bm!45946) (not b_lambda!17891) (not d!130337) (not b!1099214) (not b!1099302) (not b!1099193) (not b!1099217) (not b!1099299) (not bm!45952) (not b!1099188) (not b!1099300) (not b!1099305) (not b!1099270) (not b!1099264) (not d!130349) (not mapNonEmpty!42526) (not b!1099271) (not b!1099262) (not b!1099228) (not b!1099208) (not b!1099303) (not b!1099258) (not b!1099257) (not b!1099292) (not b_lambda!17901) (not b!1099183) (not b_next!23113) (not bm!45948) (not b!1099209) tp_is_empty!27163 (not b!1099259) (not d!130325) (not d!130335) (not bm!45944) (not b_lambda!17893) (not b!1099255))
(check-sat b_and!36943 (not b_next!23113))
