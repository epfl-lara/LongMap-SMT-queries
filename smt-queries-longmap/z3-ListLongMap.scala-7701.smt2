; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96704 () Bool)

(assert start!96704)

(declare-fun b_free!23131 () Bool)

(declare-fun b_next!23131 () Bool)

(assert (=> start!96704 (= b_free!23131 (not b_next!23131))))

(declare-fun tp!81337 () Bool)

(declare-fun b_and!36983 () Bool)

(assert (=> start!96704 (= tp!81337 b_and!36983)))

(declare-fun b!1099801 () Bool)

(declare-fun e!627726 () Bool)

(declare-fun e!627729 () Bool)

(declare-fun mapRes!42550 () Bool)

(assert (=> b!1099801 (= e!627726 (and e!627729 mapRes!42550))))

(declare-fun condMapEmpty!42550 () Bool)

(declare-datatypes ((V!41369 0))(
  ( (V!41370 (val!13647 Int)) )
))
(declare-datatypes ((ValueCell!12881 0))(
  ( (ValueCellFull!12881 (v!16273 V!41369)) (EmptyCell!12881) )
))
(declare-datatypes ((array!71186 0))(
  ( (array!71187 (arr!34259 (Array (_ BitVec 32) ValueCell!12881)) (size!34797 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71186)

(declare-fun mapDefault!42550 () ValueCell!12881)

(assert (=> b!1099801 (= condMapEmpty!42550 (= (arr!34259 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12881)) mapDefault!42550)))))

(declare-fun b!1099802 () Bool)

(declare-fun res!733939 () Bool)

(declare-fun e!627723 () Bool)

(assert (=> b!1099802 (=> (not res!733939) (not e!627723))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!71188 0))(
  ( (array!71189 (arr!34260 (Array (_ BitVec 32) (_ BitVec 64))) (size!34798 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71188)

(assert (=> b!1099802 (= res!733939 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34798 _keys!1070))))))

(declare-fun b!1099803 () Bool)

(declare-fun e!627730 () Bool)

(assert (=> b!1099803 (= e!627723 e!627730)))

(declare-fun res!733941 () Bool)

(assert (=> b!1099803 (=> (not res!733941) (not e!627730))))

(declare-fun lt!492475 () array!71188)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71188 (_ BitVec 32)) Bool)

(assert (=> b!1099803 (= res!733941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492475 mask!1414))))

(assert (=> b!1099803 (= lt!492475 (array!71189 (store (arr!34260 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34798 _keys!1070)))))

(declare-datatypes ((tuple2!17406 0))(
  ( (tuple2!17407 (_1!8714 (_ BitVec 64)) (_2!8714 V!41369)) )
))
(declare-fun lt!492477 () tuple2!17406)

(declare-datatypes ((List!24000 0))(
  ( (Nil!23997) (Cons!23996 (h!25205 tuple2!17406) (t!34168 List!24000)) )
))
(declare-datatypes ((ListLongMap!15375 0))(
  ( (ListLongMap!15376 (toList!7703 List!24000)) )
))
(declare-fun lt!492476 () ListLongMap!15375)

(declare-fun b!1099804 () Bool)

(declare-fun lt!492480 () ListLongMap!15375)

(declare-fun e!627728 () Bool)

(declare-fun +!3414 (ListLongMap!15375 tuple2!17406) ListLongMap!15375)

(assert (=> b!1099804 (= e!627728 (= lt!492480 (+!3414 lt!492476 lt!492477)))))

(declare-fun b!1099805 () Bool)

(declare-fun res!733944 () Bool)

(assert (=> b!1099805 (=> (not res!733944) (not e!627723))))

(assert (=> b!1099805 (= res!733944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!42550 () Bool)

(assert (=> mapIsEmpty!42550 mapRes!42550))

(declare-fun b!1099806 () Bool)

(declare-fun e!627724 () Bool)

(assert (=> b!1099806 (= e!627730 (not e!627724))))

(declare-fun res!733940 () Bool)

(assert (=> b!1099806 (=> res!733940 e!627724)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1099806 (= res!733940 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41369)

(declare-fun lt!492483 () ListLongMap!15375)

(declare-fun zeroValue!831 () V!41369)

(declare-fun getCurrentListMap!4322 (array!71188 array!71186 (_ BitVec 32) (_ BitVec 32) V!41369 V!41369 (_ BitVec 32) Int) ListLongMap!15375)

(assert (=> b!1099806 (= lt!492483 (getCurrentListMap!4322 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492478 () array!71186)

(assert (=> b!1099806 (= lt!492480 (getCurrentListMap!4322 lt!492475 lt!492478 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492481 () ListLongMap!15375)

(assert (=> b!1099806 (and (= lt!492481 lt!492476) (= lt!492476 lt!492481))))

(declare-fun lt!492482 () ListLongMap!15375)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!937 (ListLongMap!15375 (_ BitVec 64)) ListLongMap!15375)

(assert (=> b!1099806 (= lt!492476 (-!937 lt!492482 k0!904))))

(declare-datatypes ((Unit!35993 0))(
  ( (Unit!35994) )
))
(declare-fun lt!492474 () Unit!35993)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!211 (array!71188 array!71186 (_ BitVec 32) (_ BitVec 32) V!41369 V!41369 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35993)

(assert (=> b!1099806 (= lt!492474 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!211 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4229 (array!71188 array!71186 (_ BitVec 32) (_ BitVec 32) V!41369 V!41369 (_ BitVec 32) Int) ListLongMap!15375)

(assert (=> b!1099806 (= lt!492481 (getCurrentListMapNoExtraKeys!4229 lt!492475 lt!492478 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2298 (Int (_ BitVec 64)) V!41369)

(assert (=> b!1099806 (= lt!492478 (array!71187 (store (arr!34259 _values!874) i!650 (ValueCellFull!12881 (dynLambda!2298 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34797 _values!874)))))

(assert (=> b!1099806 (= lt!492482 (getCurrentListMapNoExtraKeys!4229 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71188 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1099806 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492479 () Unit!35993)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71188 (_ BitVec 64) (_ BitVec 32)) Unit!35993)

(assert (=> b!1099806 (= lt!492479 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1099807 () Bool)

(declare-fun e!627725 () Bool)

(declare-fun tp_is_empty!27181 () Bool)

(assert (=> b!1099807 (= e!627725 tp_is_empty!27181)))

(declare-fun res!733943 () Bool)

(assert (=> start!96704 (=> (not res!733943) (not e!627723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96704 (= res!733943 (validMask!0 mask!1414))))

(assert (=> start!96704 e!627723))

(assert (=> start!96704 tp!81337))

(assert (=> start!96704 true))

(assert (=> start!96704 tp_is_empty!27181))

(declare-fun array_inv!26420 (array!71188) Bool)

(assert (=> start!96704 (array_inv!26420 _keys!1070)))

(declare-fun array_inv!26421 (array!71186) Bool)

(assert (=> start!96704 (and (array_inv!26421 _values!874) e!627726)))

(declare-fun mapNonEmpty!42550 () Bool)

(declare-fun tp!81338 () Bool)

(assert (=> mapNonEmpty!42550 (= mapRes!42550 (and tp!81338 e!627725))))

(declare-fun mapValue!42550 () ValueCell!12881)

(declare-fun mapRest!42550 () (Array (_ BitVec 32) ValueCell!12881))

(declare-fun mapKey!42550 () (_ BitVec 32))

(assert (=> mapNonEmpty!42550 (= (arr!34259 _values!874) (store mapRest!42550 mapKey!42550 mapValue!42550))))

(declare-fun b!1099808 () Bool)

(declare-fun res!733946 () Bool)

(assert (=> b!1099808 (=> (not res!733946) (not e!627730))))

(declare-datatypes ((List!24001 0))(
  ( (Nil!23998) (Cons!23997 (h!25206 (_ BitVec 64)) (t!34169 List!24001)) )
))
(declare-fun arrayNoDuplicates!0 (array!71188 (_ BitVec 32) List!24001) Bool)

(assert (=> b!1099808 (= res!733946 (arrayNoDuplicates!0 lt!492475 #b00000000000000000000000000000000 Nil!23998))))

(declare-fun b!1099809 () Bool)

(declare-fun res!733937 () Bool)

(assert (=> b!1099809 (=> (not res!733937) (not e!627723))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1099809 (= res!733937 (validKeyInArray!0 k0!904))))

(declare-fun b!1099810 () Bool)

(assert (=> b!1099810 (= e!627724 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904)))))

(assert (=> b!1099810 e!627728))

(declare-fun res!733947 () Bool)

(assert (=> b!1099810 (=> (not res!733947) (not e!627728))))

(assert (=> b!1099810 (= res!733947 (= lt!492480 (+!3414 lt!492481 lt!492477)))))

(assert (=> b!1099810 (= lt!492477 (tuple2!17407 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1099811 () Bool)

(declare-fun res!733942 () Bool)

(assert (=> b!1099811 (=> (not res!733942) (not e!627728))))

(assert (=> b!1099811 (= res!733942 (= lt!492483 (+!3414 lt!492482 lt!492477)))))

(declare-fun b!1099812 () Bool)

(assert (=> b!1099812 (= e!627729 tp_is_empty!27181)))

(declare-fun b!1099813 () Bool)

(declare-fun res!733938 () Bool)

(assert (=> b!1099813 (=> (not res!733938) (not e!627723))))

(assert (=> b!1099813 (= res!733938 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23998))))

(declare-fun b!1099814 () Bool)

(declare-fun res!733948 () Bool)

(assert (=> b!1099814 (=> (not res!733948) (not e!627723))))

(assert (=> b!1099814 (= res!733948 (= (select (arr!34260 _keys!1070) i!650) k0!904))))

(declare-fun b!1099815 () Bool)

(declare-fun res!733945 () Bool)

(assert (=> b!1099815 (=> (not res!733945) (not e!627723))))

(assert (=> b!1099815 (= res!733945 (and (= (size!34797 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34798 _keys!1070) (size!34797 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!96704 res!733943) b!1099815))

(assert (= (and b!1099815 res!733945) b!1099805))

(assert (= (and b!1099805 res!733944) b!1099813))

(assert (= (and b!1099813 res!733938) b!1099802))

(assert (= (and b!1099802 res!733939) b!1099809))

(assert (= (and b!1099809 res!733937) b!1099814))

(assert (= (and b!1099814 res!733948) b!1099803))

(assert (= (and b!1099803 res!733941) b!1099808))

(assert (= (and b!1099808 res!733946) b!1099806))

(assert (= (and b!1099806 (not res!733940)) b!1099810))

(assert (= (and b!1099810 res!733947) b!1099811))

(assert (= (and b!1099811 res!733942) b!1099804))

(assert (= (and b!1099801 condMapEmpty!42550) mapIsEmpty!42550))

(assert (= (and b!1099801 (not condMapEmpty!42550)) mapNonEmpty!42550))

(get-info :version)

(assert (= (and mapNonEmpty!42550 ((_ is ValueCellFull!12881) mapValue!42550)) b!1099807))

(assert (= (and b!1099801 ((_ is ValueCellFull!12881) mapDefault!42550)) b!1099812))

(assert (= start!96704 b!1099801))

(declare-fun b_lambda!17947 () Bool)

(assert (=> (not b_lambda!17947) (not b!1099806)))

(declare-fun t!34167 () Bool)

(declare-fun tb!7989 () Bool)

(assert (=> (and start!96704 (= defaultEntry!882 defaultEntry!882) t!34167) tb!7989))

(declare-fun result!16521 () Bool)

(assert (=> tb!7989 (= result!16521 tp_is_empty!27181)))

(assert (=> b!1099806 t!34167))

(declare-fun b_and!36985 () Bool)

(assert (= b_and!36983 (and (=> t!34167 result!16521) b_and!36985)))

(declare-fun m!1019343 () Bool)

(assert (=> b!1099814 m!1019343))

(declare-fun m!1019345 () Bool)

(assert (=> mapNonEmpty!42550 m!1019345))

(declare-fun m!1019347 () Bool)

(assert (=> b!1099805 m!1019347))

(declare-fun m!1019349 () Bool)

(assert (=> b!1099806 m!1019349))

(declare-fun m!1019351 () Bool)

(assert (=> b!1099806 m!1019351))

(declare-fun m!1019353 () Bool)

(assert (=> b!1099806 m!1019353))

(declare-fun m!1019355 () Bool)

(assert (=> b!1099806 m!1019355))

(declare-fun m!1019357 () Bool)

(assert (=> b!1099806 m!1019357))

(declare-fun m!1019359 () Bool)

(assert (=> b!1099806 m!1019359))

(declare-fun m!1019361 () Bool)

(assert (=> b!1099806 m!1019361))

(declare-fun m!1019363 () Bool)

(assert (=> b!1099806 m!1019363))

(declare-fun m!1019365 () Bool)

(assert (=> b!1099806 m!1019365))

(declare-fun m!1019367 () Bool)

(assert (=> b!1099806 m!1019367))

(declare-fun m!1019369 () Bool)

(assert (=> b!1099803 m!1019369))

(declare-fun m!1019371 () Bool)

(assert (=> b!1099803 m!1019371))

(declare-fun m!1019373 () Bool)

(assert (=> b!1099813 m!1019373))

(declare-fun m!1019375 () Bool)

(assert (=> b!1099811 m!1019375))

(declare-fun m!1019377 () Bool)

(assert (=> start!96704 m!1019377))

(declare-fun m!1019379 () Bool)

(assert (=> start!96704 m!1019379))

(declare-fun m!1019381 () Bool)

(assert (=> start!96704 m!1019381))

(declare-fun m!1019383 () Bool)

(assert (=> b!1099808 m!1019383))

(declare-fun m!1019385 () Bool)

(assert (=> b!1099810 m!1019385))

(declare-fun m!1019387 () Bool)

(assert (=> b!1099804 m!1019387))

(declare-fun m!1019389 () Bool)

(assert (=> b!1099809 m!1019389))

(check-sat (not b!1099804) (not b!1099808) b_and!36985 (not b!1099809) (not b!1099806) tp_is_empty!27181 (not b!1099810) (not b!1099811) (not b_next!23131) (not start!96704) (not mapNonEmpty!42550) (not b!1099805) (not b_lambda!17947) (not b!1099813) (not b!1099803))
(check-sat b_and!36985 (not b_next!23131))
(get-model)

(declare-fun b_lambda!17953 () Bool)

(assert (= b_lambda!17947 (or (and start!96704 b_free!23131) b_lambda!17953)))

(check-sat (not b!1099804) (not b!1099808) b_and!36985 (not b!1099809) (not b!1099806) (not b_lambda!17953) tp_is_empty!27181 (not b!1099810) (not b!1099811) (not b_next!23131) (not start!96704) (not mapNonEmpty!42550) (not b!1099805) (not b!1099813) (not b!1099803))
(check-sat b_and!36985 (not b_next!23131))
(get-model)

(declare-fun d!130397 () Bool)

(assert (=> d!130397 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1099809 d!130397))

(declare-fun b!1099920 () Bool)

(declare-fun e!627787 () Bool)

(declare-fun call!46020 () Bool)

(assert (=> b!1099920 (= e!627787 call!46020)))

(declare-fun bm!46017 () Bool)

(assert (=> bm!46017 (= call!46020 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1099921 () Bool)

(declare-fun e!627785 () Bool)

(assert (=> b!1099921 (= e!627785 e!627787)))

(declare-fun c!108628 () Bool)

(assert (=> b!1099921 (= c!108628 (validKeyInArray!0 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130399 () Bool)

(declare-fun res!734025 () Bool)

(assert (=> d!130399 (=> res!734025 e!627785)))

(assert (=> d!130399 (= res!734025 (bvsge #b00000000000000000000000000000000 (size!34798 _keys!1070)))))

(assert (=> d!130399 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!627785)))

(declare-fun b!1099922 () Bool)

(declare-fun e!627786 () Bool)

(assert (=> b!1099922 (= e!627786 call!46020)))

(declare-fun b!1099923 () Bool)

(assert (=> b!1099923 (= e!627787 e!627786)))

(declare-fun lt!492552 () (_ BitVec 64))

(assert (=> b!1099923 (= lt!492552 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492550 () Unit!35993)

(assert (=> b!1099923 (= lt!492550 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!492552 #b00000000000000000000000000000000))))

(assert (=> b!1099923 (arrayContainsKey!0 _keys!1070 lt!492552 #b00000000000000000000000000000000)))

(declare-fun lt!492551 () Unit!35993)

(assert (=> b!1099923 (= lt!492551 lt!492550)))

(declare-fun res!734026 () Bool)

(declare-datatypes ((SeekEntryResult!9911 0))(
  ( (MissingZero!9911 (index!42015 (_ BitVec 32))) (Found!9911 (index!42016 (_ BitVec 32))) (Intermediate!9911 (undefined!10723 Bool) (index!42017 (_ BitVec 32)) (x!98932 (_ BitVec 32))) (Undefined!9911) (MissingVacant!9911 (index!42018 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71188 (_ BitVec 32)) SeekEntryResult!9911)

(assert (=> b!1099923 (= res!734026 (= (seekEntryOrOpen!0 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9911 #b00000000000000000000000000000000)))))

(assert (=> b!1099923 (=> (not res!734026) (not e!627786))))

(assert (= (and d!130399 (not res!734025)) b!1099921))

(assert (= (and b!1099921 c!108628) b!1099923))

(assert (= (and b!1099921 (not c!108628)) b!1099920))

(assert (= (and b!1099923 res!734026) b!1099922))

(assert (= (or b!1099922 b!1099920) bm!46017))

(declare-fun m!1019487 () Bool)

(assert (=> bm!46017 m!1019487))

(declare-fun m!1019489 () Bool)

(assert (=> b!1099921 m!1019489))

(assert (=> b!1099921 m!1019489))

(declare-fun m!1019491 () Bool)

(assert (=> b!1099921 m!1019491))

(assert (=> b!1099923 m!1019489))

(declare-fun m!1019493 () Bool)

(assert (=> b!1099923 m!1019493))

(declare-fun m!1019495 () Bool)

(assert (=> b!1099923 m!1019495))

(assert (=> b!1099923 m!1019489))

(declare-fun m!1019497 () Bool)

(assert (=> b!1099923 m!1019497))

(assert (=> b!1099805 d!130399))

(declare-fun d!130401 () Bool)

(declare-fun res!734031 () Bool)

(declare-fun e!627792 () Bool)

(assert (=> d!130401 (=> res!734031 e!627792)))

(assert (=> d!130401 (= res!734031 (= (select (arr!34260 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130401 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!627792)))

(declare-fun b!1099928 () Bool)

(declare-fun e!627793 () Bool)

(assert (=> b!1099928 (= e!627792 e!627793)))

(declare-fun res!734032 () Bool)

(assert (=> b!1099928 (=> (not res!734032) (not e!627793))))

(assert (=> b!1099928 (= res!734032 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34798 _keys!1070)))))

(declare-fun b!1099929 () Bool)

(assert (=> b!1099929 (= e!627793 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130401 (not res!734031)) b!1099928))

(assert (= (and b!1099928 res!734032) b!1099929))

(assert (=> d!130401 m!1019489))

(declare-fun m!1019499 () Bool)

(assert (=> b!1099929 m!1019499))

(assert (=> b!1099806 d!130401))

(declare-fun d!130403 () Bool)

(declare-fun lt!492555 () ListLongMap!15375)

(declare-fun contains!6365 (ListLongMap!15375 (_ BitVec 64)) Bool)

(assert (=> d!130403 (not (contains!6365 lt!492555 k0!904))))

(declare-fun removeStrictlySorted!83 (List!24000 (_ BitVec 64)) List!24000)

(assert (=> d!130403 (= lt!492555 (ListLongMap!15376 (removeStrictlySorted!83 (toList!7703 lt!492482) k0!904)))))

(assert (=> d!130403 (= (-!937 lt!492482 k0!904) lt!492555)))

(declare-fun bs!32272 () Bool)

(assert (= bs!32272 d!130403))

(declare-fun m!1019501 () Bool)

(assert (=> bs!32272 m!1019501))

(declare-fun m!1019503 () Bool)

(assert (=> bs!32272 m!1019503))

(assert (=> b!1099806 d!130403))

(declare-fun call!46041 () ListLongMap!15375)

(declare-fun c!108641 () Bool)

(declare-fun call!46037 () ListLongMap!15375)

(declare-fun bm!46032 () Bool)

(declare-fun call!46035 () ListLongMap!15375)

(declare-fun c!108643 () Bool)

(declare-fun call!46040 () ListLongMap!15375)

(assert (=> bm!46032 (= call!46040 (+!3414 (ite c!108641 call!46041 (ite c!108643 call!46037 call!46035)) (ite (or c!108641 c!108643) (tuple2!17407 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17407 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1099972 () Bool)

(declare-fun e!627824 () Bool)

(declare-fun e!627825 () Bool)

(assert (=> b!1099972 (= e!627824 e!627825)))

(declare-fun res!734052 () Bool)

(declare-fun call!46039 () Bool)

(assert (=> b!1099972 (= res!734052 call!46039)))

(assert (=> b!1099972 (=> (not res!734052) (not e!627825))))

(declare-fun bm!46033 () Bool)

(assert (=> bm!46033 (= call!46041 (getCurrentListMapNoExtraKeys!4229 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!46034 () Bool)

(declare-fun call!46038 () ListLongMap!15375)

(assert (=> bm!46034 (= call!46038 call!46040)))

(declare-fun b!1099973 () Bool)

(declare-fun e!627822 () ListLongMap!15375)

(assert (=> b!1099973 (= e!627822 (+!3414 call!46040 (tuple2!17407 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1099974 () Bool)

(declare-fun e!627828 () Unit!35993)

(declare-fun Unit!35997 () Unit!35993)

(assert (=> b!1099974 (= e!627828 Unit!35997)))

(declare-fun d!130405 () Bool)

(declare-fun e!627823 () Bool)

(assert (=> d!130405 e!627823))

(declare-fun res!734055 () Bool)

(assert (=> d!130405 (=> (not res!734055) (not e!627823))))

(assert (=> d!130405 (= res!734055 (or (bvsge #b00000000000000000000000000000000 (size!34798 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34798 _keys!1070)))))))

(declare-fun lt!492605 () ListLongMap!15375)

(declare-fun lt!492617 () ListLongMap!15375)

(assert (=> d!130405 (= lt!492605 lt!492617)))

(declare-fun lt!492610 () Unit!35993)

(assert (=> d!130405 (= lt!492610 e!627828)))

(declare-fun c!108644 () Bool)

(declare-fun e!627830 () Bool)

(assert (=> d!130405 (= c!108644 e!627830)))

(declare-fun res!734059 () Bool)

(assert (=> d!130405 (=> (not res!734059) (not e!627830))))

(assert (=> d!130405 (= res!734059 (bvslt #b00000000000000000000000000000000 (size!34798 _keys!1070)))))

(assert (=> d!130405 (= lt!492617 e!627822)))

(assert (=> d!130405 (= c!108641 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130405 (validMask!0 mask!1414)))

(assert (=> d!130405 (= (getCurrentListMap!4322 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492605)))

(declare-fun bm!46035 () Bool)

(assert (=> bm!46035 (= call!46035 call!46037)))

(declare-fun b!1099975 () Bool)

(declare-fun lt!492608 () Unit!35993)

(assert (=> b!1099975 (= e!627828 lt!492608)))

(declare-fun lt!492621 () ListLongMap!15375)

(assert (=> b!1099975 (= lt!492621 (getCurrentListMapNoExtraKeys!4229 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492607 () (_ BitVec 64))

(assert (=> b!1099975 (= lt!492607 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492618 () (_ BitVec 64))

(assert (=> b!1099975 (= lt!492618 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492602 () Unit!35993)

(declare-fun addStillContains!655 (ListLongMap!15375 (_ BitVec 64) V!41369 (_ BitVec 64)) Unit!35993)

(assert (=> b!1099975 (= lt!492602 (addStillContains!655 lt!492621 lt!492607 zeroValue!831 lt!492618))))

(assert (=> b!1099975 (contains!6365 (+!3414 lt!492621 (tuple2!17407 lt!492607 zeroValue!831)) lt!492618)))

(declare-fun lt!492613 () Unit!35993)

(assert (=> b!1099975 (= lt!492613 lt!492602)))

(declare-fun lt!492616 () ListLongMap!15375)

(assert (=> b!1099975 (= lt!492616 (getCurrentListMapNoExtraKeys!4229 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492600 () (_ BitVec 64))

(assert (=> b!1099975 (= lt!492600 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492620 () (_ BitVec 64))

(assert (=> b!1099975 (= lt!492620 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492611 () Unit!35993)

(declare-fun addApplyDifferent!511 (ListLongMap!15375 (_ BitVec 64) V!41369 (_ BitVec 64)) Unit!35993)

(assert (=> b!1099975 (= lt!492611 (addApplyDifferent!511 lt!492616 lt!492600 minValue!831 lt!492620))))

(declare-fun apply!942 (ListLongMap!15375 (_ BitVec 64)) V!41369)

(assert (=> b!1099975 (= (apply!942 (+!3414 lt!492616 (tuple2!17407 lt!492600 minValue!831)) lt!492620) (apply!942 lt!492616 lt!492620))))

(declare-fun lt!492614 () Unit!35993)

(assert (=> b!1099975 (= lt!492614 lt!492611)))

(declare-fun lt!492609 () ListLongMap!15375)

(assert (=> b!1099975 (= lt!492609 (getCurrentListMapNoExtraKeys!4229 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492604 () (_ BitVec 64))

(assert (=> b!1099975 (= lt!492604 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492603 () (_ BitVec 64))

(assert (=> b!1099975 (= lt!492603 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492612 () Unit!35993)

(assert (=> b!1099975 (= lt!492612 (addApplyDifferent!511 lt!492609 lt!492604 zeroValue!831 lt!492603))))

(assert (=> b!1099975 (= (apply!942 (+!3414 lt!492609 (tuple2!17407 lt!492604 zeroValue!831)) lt!492603) (apply!942 lt!492609 lt!492603))))

(declare-fun lt!492615 () Unit!35993)

(assert (=> b!1099975 (= lt!492615 lt!492612)))

(declare-fun lt!492601 () ListLongMap!15375)

(assert (=> b!1099975 (= lt!492601 (getCurrentListMapNoExtraKeys!4229 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492619 () (_ BitVec 64))

(assert (=> b!1099975 (= lt!492619 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492606 () (_ BitVec 64))

(assert (=> b!1099975 (= lt!492606 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1099975 (= lt!492608 (addApplyDifferent!511 lt!492601 lt!492619 minValue!831 lt!492606))))

(assert (=> b!1099975 (= (apply!942 (+!3414 lt!492601 (tuple2!17407 lt!492619 minValue!831)) lt!492606) (apply!942 lt!492601 lt!492606))))

(declare-fun b!1099976 () Bool)

(declare-fun res!734051 () Bool)

(assert (=> b!1099976 (=> (not res!734051) (not e!627823))))

(declare-fun e!627820 () Bool)

(assert (=> b!1099976 (= res!734051 e!627820)))

(declare-fun res!734058 () Bool)

(assert (=> b!1099976 (=> res!734058 e!627820)))

(declare-fun e!627826 () Bool)

(assert (=> b!1099976 (= res!734058 (not e!627826))))

(declare-fun res!734053 () Bool)

(assert (=> b!1099976 (=> (not res!734053) (not e!627826))))

(assert (=> b!1099976 (= res!734053 (bvslt #b00000000000000000000000000000000 (size!34798 _keys!1070)))))

(declare-fun b!1099977 () Bool)

(declare-fun e!627831 () ListLongMap!15375)

(assert (=> b!1099977 (= e!627831 call!46038)))

(declare-fun b!1099978 () Bool)

(declare-fun e!627827 () ListLongMap!15375)

(assert (=> b!1099978 (= e!627827 call!46038)))

(declare-fun b!1099979 () Bool)

(declare-fun e!627821 () Bool)

(declare-fun e!627829 () Bool)

(assert (=> b!1099979 (= e!627821 e!627829)))

(declare-fun res!734054 () Bool)

(declare-fun call!46036 () Bool)

(assert (=> b!1099979 (= res!734054 call!46036)))

(assert (=> b!1099979 (=> (not res!734054) (not e!627829))))

(declare-fun b!1099980 () Bool)

(assert (=> b!1099980 (= e!627822 e!627827)))

(assert (=> b!1099980 (= c!108643 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1099981 () Bool)

(assert (=> b!1099981 (= e!627824 (not call!46039))))

(declare-fun e!627832 () Bool)

(declare-fun b!1099982 () Bool)

(declare-fun get!17634 (ValueCell!12881 V!41369) V!41369)

(assert (=> b!1099982 (= e!627832 (= (apply!942 lt!492605 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000)) (get!17634 (select (arr!34259 _values!874) #b00000000000000000000000000000000) (dynLambda!2298 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1099982 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34797 _values!874)))))

(assert (=> b!1099982 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34798 _keys!1070)))))

(declare-fun b!1099983 () Bool)

(assert (=> b!1099983 (= e!627829 (= (apply!942 lt!492605 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1099984 () Bool)

(assert (=> b!1099984 (= e!627823 e!627821)))

(declare-fun c!108645 () Bool)

(assert (=> b!1099984 (= c!108645 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1099985 () Bool)

(assert (=> b!1099985 (= e!627826 (validKeyInArray!0 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!46036 () Bool)

(assert (=> bm!46036 (= call!46036 (contains!6365 lt!492605 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1099986 () Bool)

(declare-fun c!108642 () Bool)

(assert (=> b!1099986 (= c!108642 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1099986 (= e!627827 e!627831)))

(declare-fun bm!46037 () Bool)

(assert (=> bm!46037 (= call!46037 call!46041)))

(declare-fun bm!46038 () Bool)

(assert (=> bm!46038 (= call!46039 (contains!6365 lt!492605 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1099987 () Bool)

(assert (=> b!1099987 (= e!627830 (validKeyInArray!0 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099988 () Bool)

(assert (=> b!1099988 (= e!627821 (not call!46036))))

(declare-fun b!1099989 () Bool)

(assert (=> b!1099989 (= e!627831 call!46035)))

(declare-fun b!1099990 () Bool)

(assert (=> b!1099990 (= e!627820 e!627832)))

(declare-fun res!734057 () Bool)

(assert (=> b!1099990 (=> (not res!734057) (not e!627832))))

(assert (=> b!1099990 (= res!734057 (contains!6365 lt!492605 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1099990 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34798 _keys!1070)))))

(declare-fun b!1099991 () Bool)

(assert (=> b!1099991 (= e!627825 (= (apply!942 lt!492605 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1099992 () Bool)

(declare-fun res!734056 () Bool)

(assert (=> b!1099992 (=> (not res!734056) (not e!627823))))

(assert (=> b!1099992 (= res!734056 e!627824)))

(declare-fun c!108646 () Bool)

(assert (=> b!1099992 (= c!108646 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!130405 c!108641) b!1099973))

(assert (= (and d!130405 (not c!108641)) b!1099980))

(assert (= (and b!1099980 c!108643) b!1099978))

(assert (= (and b!1099980 (not c!108643)) b!1099986))

(assert (= (and b!1099986 c!108642) b!1099977))

(assert (= (and b!1099986 (not c!108642)) b!1099989))

(assert (= (or b!1099977 b!1099989) bm!46035))

(assert (= (or b!1099978 bm!46035) bm!46037))

(assert (= (or b!1099978 b!1099977) bm!46034))

(assert (= (or b!1099973 bm!46037) bm!46033))

(assert (= (or b!1099973 bm!46034) bm!46032))

(assert (= (and d!130405 res!734059) b!1099987))

(assert (= (and d!130405 c!108644) b!1099975))

(assert (= (and d!130405 (not c!108644)) b!1099974))

(assert (= (and d!130405 res!734055) b!1099976))

(assert (= (and b!1099976 res!734053) b!1099985))

(assert (= (and b!1099976 (not res!734058)) b!1099990))

(assert (= (and b!1099990 res!734057) b!1099982))

(assert (= (and b!1099976 res!734051) b!1099992))

(assert (= (and b!1099992 c!108646) b!1099972))

(assert (= (and b!1099992 (not c!108646)) b!1099981))

(assert (= (and b!1099972 res!734052) b!1099991))

(assert (= (or b!1099972 b!1099981) bm!46038))

(assert (= (and b!1099992 res!734056) b!1099984))

(assert (= (and b!1099984 c!108645) b!1099979))

(assert (= (and b!1099984 (not c!108645)) b!1099988))

(assert (= (and b!1099979 res!734054) b!1099983))

(assert (= (or b!1099979 b!1099988) bm!46036))

(declare-fun b_lambda!17955 () Bool)

(assert (=> (not b_lambda!17955) (not b!1099982)))

(assert (=> b!1099982 t!34167))

(declare-fun b_and!36995 () Bool)

(assert (= b_and!36985 (and (=> t!34167 result!16521) b_and!36995)))

(assert (=> d!130405 m!1019377))

(declare-fun m!1019505 () Bool)

(assert (=> bm!46036 m!1019505))

(declare-fun m!1019507 () Bool)

(assert (=> b!1099983 m!1019507))

(declare-fun m!1019509 () Bool)

(assert (=> bm!46032 m!1019509))

(declare-fun m!1019511 () Bool)

(assert (=> bm!46038 m!1019511))

(assert (=> bm!46033 m!1019367))

(declare-fun m!1019513 () Bool)

(assert (=> b!1099991 m!1019513))

(assert (=> b!1099985 m!1019489))

(assert (=> b!1099985 m!1019489))

(assert (=> b!1099985 m!1019491))

(declare-fun m!1019515 () Bool)

(assert (=> b!1099973 m!1019515))

(assert (=> b!1099987 m!1019489))

(assert (=> b!1099987 m!1019489))

(assert (=> b!1099987 m!1019491))

(declare-fun m!1019517 () Bool)

(assert (=> b!1099975 m!1019517))

(declare-fun m!1019519 () Bool)

(assert (=> b!1099975 m!1019519))

(declare-fun m!1019521 () Bool)

(assert (=> b!1099975 m!1019521))

(declare-fun m!1019523 () Bool)

(assert (=> b!1099975 m!1019523))

(declare-fun m!1019525 () Bool)

(assert (=> b!1099975 m!1019525))

(assert (=> b!1099975 m!1019521))

(declare-fun m!1019527 () Bool)

(assert (=> b!1099975 m!1019527))

(assert (=> b!1099975 m!1019367))

(declare-fun m!1019529 () Bool)

(assert (=> b!1099975 m!1019529))

(declare-fun m!1019531 () Bool)

(assert (=> b!1099975 m!1019531))

(assert (=> b!1099975 m!1019517))

(declare-fun m!1019533 () Bool)

(assert (=> b!1099975 m!1019533))

(declare-fun m!1019535 () Bool)

(assert (=> b!1099975 m!1019535))

(assert (=> b!1099975 m!1019531))

(declare-fun m!1019537 () Bool)

(assert (=> b!1099975 m!1019537))

(assert (=> b!1099975 m!1019489))

(declare-fun m!1019539 () Bool)

(assert (=> b!1099975 m!1019539))

(declare-fun m!1019541 () Bool)

(assert (=> b!1099975 m!1019541))

(declare-fun m!1019543 () Bool)

(assert (=> b!1099975 m!1019543))

(assert (=> b!1099975 m!1019519))

(declare-fun m!1019545 () Bool)

(assert (=> b!1099975 m!1019545))

(assert (=> b!1099990 m!1019489))

(assert (=> b!1099990 m!1019489))

(declare-fun m!1019547 () Bool)

(assert (=> b!1099990 m!1019547))

(declare-fun m!1019549 () Bool)

(assert (=> b!1099982 m!1019549))

(assert (=> b!1099982 m!1019549))

(assert (=> b!1099982 m!1019349))

(declare-fun m!1019551 () Bool)

(assert (=> b!1099982 m!1019551))

(assert (=> b!1099982 m!1019489))

(declare-fun m!1019553 () Bool)

(assert (=> b!1099982 m!1019553))

(assert (=> b!1099982 m!1019489))

(assert (=> b!1099982 m!1019349))

(assert (=> b!1099806 d!130405))

(declare-fun call!46047 () ListLongMap!15375)

(declare-fun bm!46043 () Bool)

(assert (=> bm!46043 (= call!46047 (getCurrentListMapNoExtraKeys!4229 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun d!130407 () Bool)

(declare-fun e!627838 () Bool)

(assert (=> d!130407 e!627838))

(declare-fun res!734062 () Bool)

(assert (=> d!130407 (=> (not res!734062) (not e!627838))))

(assert (=> d!130407 (= res!734062 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34798 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34798 _keys!1070))))))))

(declare-fun lt!492624 () Unit!35993)

(declare-fun choose!1776 (array!71188 array!71186 (_ BitVec 32) (_ BitVec 32) V!41369 V!41369 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35993)

(assert (=> d!130407 (= lt!492624 (choose!1776 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130407 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34798 _keys!1070)))))

(assert (=> d!130407 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!211 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!492624)))

(declare-fun call!46046 () ListLongMap!15375)

(declare-fun bm!46044 () Bool)

(assert (=> bm!46044 (= call!46046 (getCurrentListMapNoExtraKeys!4229 (array!71189 (store (arr!34260 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34798 _keys!1070)) (array!71187 (store (arr!34259 _values!874) i!650 (ValueCellFull!12881 (dynLambda!2298 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34797 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1099999 () Bool)

(declare-fun e!627837 () Bool)

(assert (=> b!1099999 (= e!627838 e!627837)))

(declare-fun c!108649 () Bool)

(assert (=> b!1099999 (= c!108649 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun b!1100000 () Bool)

(assert (=> b!1100000 (= e!627837 (= call!46046 call!46047))))

(assert (=> b!1100000 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34797 _values!874)))))

(declare-fun b!1100001 () Bool)

(assert (=> b!1100001 (= e!627837 (= call!46046 (-!937 call!46047 k0!904)))))

(assert (=> b!1100001 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34797 _values!874)))))

(assert (= (and d!130407 res!734062) b!1099999))

(assert (= (and b!1099999 c!108649) b!1100001))

(assert (= (and b!1099999 (not c!108649)) b!1100000))

(assert (= (or b!1100001 b!1100000) bm!46043))

(assert (= (or b!1100001 b!1100000) bm!46044))

(declare-fun b_lambda!17957 () Bool)

(assert (=> (not b_lambda!17957) (not bm!46044)))

(assert (=> bm!46044 t!34167))

(declare-fun b_and!36997 () Bool)

(assert (= b_and!36995 (and (=> t!34167 result!16521) b_and!36997)))

(assert (=> bm!46043 m!1019367))

(declare-fun m!1019555 () Bool)

(assert (=> d!130407 m!1019555))

(assert (=> bm!46044 m!1019371))

(assert (=> bm!46044 m!1019349))

(assert (=> bm!46044 m!1019353))

(declare-fun m!1019557 () Bool)

(assert (=> bm!46044 m!1019557))

(declare-fun m!1019559 () Bool)

(assert (=> b!1100001 m!1019559))

(assert (=> b!1099806 d!130407))

(declare-fun bm!46045 () Bool)

(declare-fun call!46053 () ListLongMap!15375)

(declare-fun call!46048 () ListLongMap!15375)

(declare-fun c!108650 () Bool)

(declare-fun call!46054 () ListLongMap!15375)

(declare-fun call!46050 () ListLongMap!15375)

(declare-fun c!108652 () Bool)

(assert (=> bm!46045 (= call!46053 (+!3414 (ite c!108650 call!46054 (ite c!108652 call!46050 call!46048)) (ite (or c!108650 c!108652) (tuple2!17407 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17407 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1100002 () Bool)

(declare-fun e!627843 () Bool)

(declare-fun e!627844 () Bool)

(assert (=> b!1100002 (= e!627843 e!627844)))

(declare-fun res!734064 () Bool)

(declare-fun call!46052 () Bool)

(assert (=> b!1100002 (= res!734064 call!46052)))

(assert (=> b!1100002 (=> (not res!734064) (not e!627844))))

(declare-fun bm!46046 () Bool)

(assert (=> bm!46046 (= call!46054 (getCurrentListMapNoExtraKeys!4229 lt!492475 lt!492478 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!46047 () Bool)

(declare-fun call!46051 () ListLongMap!15375)

(assert (=> bm!46047 (= call!46051 call!46053)))

(declare-fun b!1100003 () Bool)

(declare-fun e!627841 () ListLongMap!15375)

(assert (=> b!1100003 (= e!627841 (+!3414 call!46053 (tuple2!17407 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1100004 () Bool)

(declare-fun e!627847 () Unit!35993)

(declare-fun Unit!35998 () Unit!35993)

(assert (=> b!1100004 (= e!627847 Unit!35998)))

(declare-fun d!130409 () Bool)

(declare-fun e!627842 () Bool)

(assert (=> d!130409 e!627842))

(declare-fun res!734067 () Bool)

(assert (=> d!130409 (=> (not res!734067) (not e!627842))))

(assert (=> d!130409 (= res!734067 (or (bvsge #b00000000000000000000000000000000 (size!34798 lt!492475)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34798 lt!492475)))))))

(declare-fun lt!492630 () ListLongMap!15375)

(declare-fun lt!492642 () ListLongMap!15375)

(assert (=> d!130409 (= lt!492630 lt!492642)))

(declare-fun lt!492635 () Unit!35993)

(assert (=> d!130409 (= lt!492635 e!627847)))

(declare-fun c!108653 () Bool)

(declare-fun e!627849 () Bool)

(assert (=> d!130409 (= c!108653 e!627849)))

(declare-fun res!734071 () Bool)

(assert (=> d!130409 (=> (not res!734071) (not e!627849))))

(assert (=> d!130409 (= res!734071 (bvslt #b00000000000000000000000000000000 (size!34798 lt!492475)))))

(assert (=> d!130409 (= lt!492642 e!627841)))

(assert (=> d!130409 (= c!108650 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130409 (validMask!0 mask!1414)))

(assert (=> d!130409 (= (getCurrentListMap!4322 lt!492475 lt!492478 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492630)))

(declare-fun bm!46048 () Bool)

(assert (=> bm!46048 (= call!46048 call!46050)))

(declare-fun b!1100005 () Bool)

(declare-fun lt!492633 () Unit!35993)

(assert (=> b!1100005 (= e!627847 lt!492633)))

(declare-fun lt!492646 () ListLongMap!15375)

(assert (=> b!1100005 (= lt!492646 (getCurrentListMapNoExtraKeys!4229 lt!492475 lt!492478 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492632 () (_ BitVec 64))

(assert (=> b!1100005 (= lt!492632 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492643 () (_ BitVec 64))

(assert (=> b!1100005 (= lt!492643 (select (arr!34260 lt!492475) #b00000000000000000000000000000000))))

(declare-fun lt!492627 () Unit!35993)

(assert (=> b!1100005 (= lt!492627 (addStillContains!655 lt!492646 lt!492632 zeroValue!831 lt!492643))))

(assert (=> b!1100005 (contains!6365 (+!3414 lt!492646 (tuple2!17407 lt!492632 zeroValue!831)) lt!492643)))

(declare-fun lt!492638 () Unit!35993)

(assert (=> b!1100005 (= lt!492638 lt!492627)))

(declare-fun lt!492641 () ListLongMap!15375)

(assert (=> b!1100005 (= lt!492641 (getCurrentListMapNoExtraKeys!4229 lt!492475 lt!492478 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492625 () (_ BitVec 64))

(assert (=> b!1100005 (= lt!492625 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492645 () (_ BitVec 64))

(assert (=> b!1100005 (= lt!492645 (select (arr!34260 lt!492475) #b00000000000000000000000000000000))))

(declare-fun lt!492636 () Unit!35993)

(assert (=> b!1100005 (= lt!492636 (addApplyDifferent!511 lt!492641 lt!492625 minValue!831 lt!492645))))

(assert (=> b!1100005 (= (apply!942 (+!3414 lt!492641 (tuple2!17407 lt!492625 minValue!831)) lt!492645) (apply!942 lt!492641 lt!492645))))

(declare-fun lt!492639 () Unit!35993)

(assert (=> b!1100005 (= lt!492639 lt!492636)))

(declare-fun lt!492634 () ListLongMap!15375)

(assert (=> b!1100005 (= lt!492634 (getCurrentListMapNoExtraKeys!4229 lt!492475 lt!492478 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492629 () (_ BitVec 64))

(assert (=> b!1100005 (= lt!492629 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492628 () (_ BitVec 64))

(assert (=> b!1100005 (= lt!492628 (select (arr!34260 lt!492475) #b00000000000000000000000000000000))))

(declare-fun lt!492637 () Unit!35993)

(assert (=> b!1100005 (= lt!492637 (addApplyDifferent!511 lt!492634 lt!492629 zeroValue!831 lt!492628))))

(assert (=> b!1100005 (= (apply!942 (+!3414 lt!492634 (tuple2!17407 lt!492629 zeroValue!831)) lt!492628) (apply!942 lt!492634 lt!492628))))

(declare-fun lt!492640 () Unit!35993)

(assert (=> b!1100005 (= lt!492640 lt!492637)))

(declare-fun lt!492626 () ListLongMap!15375)

(assert (=> b!1100005 (= lt!492626 (getCurrentListMapNoExtraKeys!4229 lt!492475 lt!492478 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492644 () (_ BitVec 64))

(assert (=> b!1100005 (= lt!492644 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492631 () (_ BitVec 64))

(assert (=> b!1100005 (= lt!492631 (select (arr!34260 lt!492475) #b00000000000000000000000000000000))))

(assert (=> b!1100005 (= lt!492633 (addApplyDifferent!511 lt!492626 lt!492644 minValue!831 lt!492631))))

(assert (=> b!1100005 (= (apply!942 (+!3414 lt!492626 (tuple2!17407 lt!492644 minValue!831)) lt!492631) (apply!942 lt!492626 lt!492631))))

(declare-fun b!1100006 () Bool)

(declare-fun res!734063 () Bool)

(assert (=> b!1100006 (=> (not res!734063) (not e!627842))))

(declare-fun e!627839 () Bool)

(assert (=> b!1100006 (= res!734063 e!627839)))

(declare-fun res!734070 () Bool)

(assert (=> b!1100006 (=> res!734070 e!627839)))

(declare-fun e!627845 () Bool)

(assert (=> b!1100006 (= res!734070 (not e!627845))))

(declare-fun res!734065 () Bool)

(assert (=> b!1100006 (=> (not res!734065) (not e!627845))))

(assert (=> b!1100006 (= res!734065 (bvslt #b00000000000000000000000000000000 (size!34798 lt!492475)))))

(declare-fun b!1100007 () Bool)

(declare-fun e!627850 () ListLongMap!15375)

(assert (=> b!1100007 (= e!627850 call!46051)))

(declare-fun b!1100008 () Bool)

(declare-fun e!627846 () ListLongMap!15375)

(assert (=> b!1100008 (= e!627846 call!46051)))

(declare-fun b!1100009 () Bool)

(declare-fun e!627840 () Bool)

(declare-fun e!627848 () Bool)

(assert (=> b!1100009 (= e!627840 e!627848)))

(declare-fun res!734066 () Bool)

(declare-fun call!46049 () Bool)

(assert (=> b!1100009 (= res!734066 call!46049)))

(assert (=> b!1100009 (=> (not res!734066) (not e!627848))))

(declare-fun b!1100010 () Bool)

(assert (=> b!1100010 (= e!627841 e!627846)))

(assert (=> b!1100010 (= c!108652 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1100011 () Bool)

(assert (=> b!1100011 (= e!627843 (not call!46052))))

(declare-fun b!1100012 () Bool)

(declare-fun e!627851 () Bool)

(assert (=> b!1100012 (= e!627851 (= (apply!942 lt!492630 (select (arr!34260 lt!492475) #b00000000000000000000000000000000)) (get!17634 (select (arr!34259 lt!492478) #b00000000000000000000000000000000) (dynLambda!2298 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1100012 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34797 lt!492478)))))

(assert (=> b!1100012 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34798 lt!492475)))))

(declare-fun b!1100013 () Bool)

(assert (=> b!1100013 (= e!627848 (= (apply!942 lt!492630 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1100014 () Bool)

(assert (=> b!1100014 (= e!627842 e!627840)))

(declare-fun c!108654 () Bool)

(assert (=> b!1100014 (= c!108654 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1100015 () Bool)

(assert (=> b!1100015 (= e!627845 (validKeyInArray!0 (select (arr!34260 lt!492475) #b00000000000000000000000000000000)))))

(declare-fun bm!46049 () Bool)

(assert (=> bm!46049 (= call!46049 (contains!6365 lt!492630 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1100016 () Bool)

(declare-fun c!108651 () Bool)

(assert (=> b!1100016 (= c!108651 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1100016 (= e!627846 e!627850)))

(declare-fun bm!46050 () Bool)

(assert (=> bm!46050 (= call!46050 call!46054)))

(declare-fun bm!46051 () Bool)

(assert (=> bm!46051 (= call!46052 (contains!6365 lt!492630 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1100017 () Bool)

(assert (=> b!1100017 (= e!627849 (validKeyInArray!0 (select (arr!34260 lt!492475) #b00000000000000000000000000000000)))))

(declare-fun b!1100018 () Bool)

(assert (=> b!1100018 (= e!627840 (not call!46049))))

(declare-fun b!1100019 () Bool)

(assert (=> b!1100019 (= e!627850 call!46048)))

(declare-fun b!1100020 () Bool)

(assert (=> b!1100020 (= e!627839 e!627851)))

(declare-fun res!734069 () Bool)

(assert (=> b!1100020 (=> (not res!734069) (not e!627851))))

(assert (=> b!1100020 (= res!734069 (contains!6365 lt!492630 (select (arr!34260 lt!492475) #b00000000000000000000000000000000)))))

(assert (=> b!1100020 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34798 lt!492475)))))

(declare-fun b!1100021 () Bool)

(assert (=> b!1100021 (= e!627844 (= (apply!942 lt!492630 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1100022 () Bool)

(declare-fun res!734068 () Bool)

(assert (=> b!1100022 (=> (not res!734068) (not e!627842))))

(assert (=> b!1100022 (= res!734068 e!627843)))

(declare-fun c!108655 () Bool)

(assert (=> b!1100022 (= c!108655 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!130409 c!108650) b!1100003))

(assert (= (and d!130409 (not c!108650)) b!1100010))

(assert (= (and b!1100010 c!108652) b!1100008))

(assert (= (and b!1100010 (not c!108652)) b!1100016))

(assert (= (and b!1100016 c!108651) b!1100007))

(assert (= (and b!1100016 (not c!108651)) b!1100019))

(assert (= (or b!1100007 b!1100019) bm!46048))

(assert (= (or b!1100008 bm!46048) bm!46050))

(assert (= (or b!1100008 b!1100007) bm!46047))

(assert (= (or b!1100003 bm!46050) bm!46046))

(assert (= (or b!1100003 bm!46047) bm!46045))

(assert (= (and d!130409 res!734071) b!1100017))

(assert (= (and d!130409 c!108653) b!1100005))

(assert (= (and d!130409 (not c!108653)) b!1100004))

(assert (= (and d!130409 res!734067) b!1100006))

(assert (= (and b!1100006 res!734065) b!1100015))

(assert (= (and b!1100006 (not res!734070)) b!1100020))

(assert (= (and b!1100020 res!734069) b!1100012))

(assert (= (and b!1100006 res!734063) b!1100022))

(assert (= (and b!1100022 c!108655) b!1100002))

(assert (= (and b!1100022 (not c!108655)) b!1100011))

(assert (= (and b!1100002 res!734064) b!1100021))

(assert (= (or b!1100002 b!1100011) bm!46051))

(assert (= (and b!1100022 res!734068) b!1100014))

(assert (= (and b!1100014 c!108654) b!1100009))

(assert (= (and b!1100014 (not c!108654)) b!1100018))

(assert (= (and b!1100009 res!734066) b!1100013))

(assert (= (or b!1100009 b!1100018) bm!46049))

(declare-fun b_lambda!17959 () Bool)

(assert (=> (not b_lambda!17959) (not b!1100012)))

(assert (=> b!1100012 t!34167))

(declare-fun b_and!36999 () Bool)

(assert (= b_and!36997 (and (=> t!34167 result!16521) b_and!36999)))

(assert (=> d!130409 m!1019377))

(declare-fun m!1019561 () Bool)

(assert (=> bm!46049 m!1019561))

(declare-fun m!1019563 () Bool)

(assert (=> b!1100013 m!1019563))

(declare-fun m!1019565 () Bool)

(assert (=> bm!46045 m!1019565))

(declare-fun m!1019567 () Bool)

(assert (=> bm!46051 m!1019567))

(assert (=> bm!46046 m!1019365))

(declare-fun m!1019569 () Bool)

(assert (=> b!1100021 m!1019569))

(declare-fun m!1019571 () Bool)

(assert (=> b!1100015 m!1019571))

(assert (=> b!1100015 m!1019571))

(declare-fun m!1019573 () Bool)

(assert (=> b!1100015 m!1019573))

(declare-fun m!1019575 () Bool)

(assert (=> b!1100003 m!1019575))

(assert (=> b!1100017 m!1019571))

(assert (=> b!1100017 m!1019571))

(assert (=> b!1100017 m!1019573))

(declare-fun m!1019577 () Bool)

(assert (=> b!1100005 m!1019577))

(declare-fun m!1019579 () Bool)

(assert (=> b!1100005 m!1019579))

(declare-fun m!1019581 () Bool)

(assert (=> b!1100005 m!1019581))

(declare-fun m!1019583 () Bool)

(assert (=> b!1100005 m!1019583))

(declare-fun m!1019585 () Bool)

(assert (=> b!1100005 m!1019585))

(assert (=> b!1100005 m!1019581))

(declare-fun m!1019587 () Bool)

(assert (=> b!1100005 m!1019587))

(assert (=> b!1100005 m!1019365))

(declare-fun m!1019589 () Bool)

(assert (=> b!1100005 m!1019589))

(declare-fun m!1019591 () Bool)

(assert (=> b!1100005 m!1019591))

(assert (=> b!1100005 m!1019577))

(declare-fun m!1019593 () Bool)

(assert (=> b!1100005 m!1019593))

(declare-fun m!1019595 () Bool)

(assert (=> b!1100005 m!1019595))

(assert (=> b!1100005 m!1019591))

(declare-fun m!1019597 () Bool)

(assert (=> b!1100005 m!1019597))

(assert (=> b!1100005 m!1019571))

(declare-fun m!1019599 () Bool)

(assert (=> b!1100005 m!1019599))

(declare-fun m!1019601 () Bool)

(assert (=> b!1100005 m!1019601))

(declare-fun m!1019603 () Bool)

(assert (=> b!1100005 m!1019603))

(assert (=> b!1100005 m!1019579))

(declare-fun m!1019605 () Bool)

(assert (=> b!1100005 m!1019605))

(assert (=> b!1100020 m!1019571))

(assert (=> b!1100020 m!1019571))

(declare-fun m!1019607 () Bool)

(assert (=> b!1100020 m!1019607))

(declare-fun m!1019609 () Bool)

(assert (=> b!1100012 m!1019609))

(assert (=> b!1100012 m!1019609))

(assert (=> b!1100012 m!1019349))

(declare-fun m!1019611 () Bool)

(assert (=> b!1100012 m!1019611))

(assert (=> b!1100012 m!1019571))

(declare-fun m!1019613 () Bool)

(assert (=> b!1100012 m!1019613))

(assert (=> b!1100012 m!1019571))

(assert (=> b!1100012 m!1019349))

(assert (=> b!1099806 d!130409))

(declare-fun b!1100047 () Bool)

(declare-fun e!627871 () ListLongMap!15375)

(declare-fun e!627872 () ListLongMap!15375)

(assert (=> b!1100047 (= e!627871 e!627872)))

(declare-fun c!108666 () Bool)

(assert (=> b!1100047 (= c!108666 (validKeyInArray!0 (select (arr!34260 lt!492475) #b00000000000000000000000000000000)))))

(declare-fun b!1100048 () Bool)

(declare-fun e!627870 () Bool)

(declare-fun e!627868 () Bool)

(assert (=> b!1100048 (= e!627870 e!627868)))

(assert (=> b!1100048 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34798 lt!492475)))))

(declare-fun res!734082 () Bool)

(declare-fun lt!492663 () ListLongMap!15375)

(assert (=> b!1100048 (= res!734082 (contains!6365 lt!492663 (select (arr!34260 lt!492475) #b00000000000000000000000000000000)))))

(assert (=> b!1100048 (=> (not res!734082) (not e!627868))))

(declare-fun b!1100049 () Bool)

(declare-fun e!627867 () Bool)

(assert (=> b!1100049 (= e!627867 e!627870)))

(declare-fun c!108664 () Bool)

(declare-fun e!627866 () Bool)

(assert (=> b!1100049 (= c!108664 e!627866)))

(declare-fun res!734081 () Bool)

(assert (=> b!1100049 (=> (not res!734081) (not e!627866))))

(assert (=> b!1100049 (= res!734081 (bvslt #b00000000000000000000000000000000 (size!34798 lt!492475)))))

(declare-fun d!130411 () Bool)

(assert (=> d!130411 e!627867))

(declare-fun res!734083 () Bool)

(assert (=> d!130411 (=> (not res!734083) (not e!627867))))

(assert (=> d!130411 (= res!734083 (not (contains!6365 lt!492663 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130411 (= lt!492663 e!627871)))

(declare-fun c!108667 () Bool)

(assert (=> d!130411 (= c!108667 (bvsge #b00000000000000000000000000000000 (size!34798 lt!492475)))))

(assert (=> d!130411 (validMask!0 mask!1414)))

(assert (=> d!130411 (= (getCurrentListMapNoExtraKeys!4229 lt!492475 lt!492478 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492663)))

(declare-fun b!1100050 () Bool)

(assert (=> b!1100050 (= e!627871 (ListLongMap!15376 Nil!23997))))

(declare-fun b!1100051 () Bool)

(declare-fun call!46057 () ListLongMap!15375)

(assert (=> b!1100051 (= e!627872 call!46057)))

(declare-fun b!1100052 () Bool)

(declare-fun e!627869 () Bool)

(declare-fun isEmpty!972 (ListLongMap!15375) Bool)

(assert (=> b!1100052 (= e!627869 (isEmpty!972 lt!492663))))

(declare-fun b!1100053 () Bool)

(assert (=> b!1100053 (= e!627870 e!627869)))

(declare-fun c!108665 () Bool)

(assert (=> b!1100053 (= c!108665 (bvslt #b00000000000000000000000000000000 (size!34798 lt!492475)))))

(declare-fun b!1100054 () Bool)

(assert (=> b!1100054 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34798 lt!492475)))))

(assert (=> b!1100054 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34797 lt!492478)))))

(assert (=> b!1100054 (= e!627868 (= (apply!942 lt!492663 (select (arr!34260 lt!492475) #b00000000000000000000000000000000)) (get!17634 (select (arr!34259 lt!492478) #b00000000000000000000000000000000) (dynLambda!2298 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!46054 () Bool)

(assert (=> bm!46054 (= call!46057 (getCurrentListMapNoExtraKeys!4229 lt!492475 lt!492478 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1100055 () Bool)

(declare-fun res!734080 () Bool)

(assert (=> b!1100055 (=> (not res!734080) (not e!627867))))

(assert (=> b!1100055 (= res!734080 (not (contains!6365 lt!492663 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1100056 () Bool)

(assert (=> b!1100056 (= e!627869 (= lt!492663 (getCurrentListMapNoExtraKeys!4229 lt!492475 lt!492478 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1100057 () Bool)

(declare-fun lt!492666 () Unit!35993)

(declare-fun lt!492662 () Unit!35993)

(assert (=> b!1100057 (= lt!492666 lt!492662)))

(declare-fun lt!492661 () V!41369)

(declare-fun lt!492665 () (_ BitVec 64))

(declare-fun lt!492664 () ListLongMap!15375)

(declare-fun lt!492667 () (_ BitVec 64))

(assert (=> b!1100057 (not (contains!6365 (+!3414 lt!492664 (tuple2!17407 lt!492667 lt!492661)) lt!492665))))

(declare-fun addStillNotContains!278 (ListLongMap!15375 (_ BitVec 64) V!41369 (_ BitVec 64)) Unit!35993)

(assert (=> b!1100057 (= lt!492662 (addStillNotContains!278 lt!492664 lt!492667 lt!492661 lt!492665))))

(assert (=> b!1100057 (= lt!492665 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1100057 (= lt!492661 (get!17634 (select (arr!34259 lt!492478) #b00000000000000000000000000000000) (dynLambda!2298 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1100057 (= lt!492667 (select (arr!34260 lt!492475) #b00000000000000000000000000000000))))

(assert (=> b!1100057 (= lt!492664 call!46057)))

(assert (=> b!1100057 (= e!627872 (+!3414 call!46057 (tuple2!17407 (select (arr!34260 lt!492475) #b00000000000000000000000000000000) (get!17634 (select (arr!34259 lt!492478) #b00000000000000000000000000000000) (dynLambda!2298 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1100058 () Bool)

(assert (=> b!1100058 (= e!627866 (validKeyInArray!0 (select (arr!34260 lt!492475) #b00000000000000000000000000000000)))))

(assert (=> b!1100058 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!130411 c!108667) b!1100050))

(assert (= (and d!130411 (not c!108667)) b!1100047))

(assert (= (and b!1100047 c!108666) b!1100057))

(assert (= (and b!1100047 (not c!108666)) b!1100051))

(assert (= (or b!1100057 b!1100051) bm!46054))

(assert (= (and d!130411 res!734083) b!1100055))

(assert (= (and b!1100055 res!734080) b!1100049))

(assert (= (and b!1100049 res!734081) b!1100058))

(assert (= (and b!1100049 c!108664) b!1100048))

(assert (= (and b!1100049 (not c!108664)) b!1100053))

(assert (= (and b!1100048 res!734082) b!1100054))

(assert (= (and b!1100053 c!108665) b!1100056))

(assert (= (and b!1100053 (not c!108665)) b!1100052))

(declare-fun b_lambda!17961 () Bool)

(assert (=> (not b_lambda!17961) (not b!1100054)))

(assert (=> b!1100054 t!34167))

(declare-fun b_and!37001 () Bool)

(assert (= b_and!36999 (and (=> t!34167 result!16521) b_and!37001)))

(declare-fun b_lambda!17963 () Bool)

(assert (=> (not b_lambda!17963) (not b!1100057)))

(assert (=> b!1100057 t!34167))

(declare-fun b_and!37003 () Bool)

(assert (= b_and!37001 (and (=> t!34167 result!16521) b_and!37003)))

(assert (=> b!1100058 m!1019571))

(assert (=> b!1100058 m!1019571))

(assert (=> b!1100058 m!1019573))

(declare-fun m!1019615 () Bool)

(assert (=> b!1100056 m!1019615))

(assert (=> b!1100054 m!1019571))

(declare-fun m!1019617 () Bool)

(assert (=> b!1100054 m!1019617))

(assert (=> b!1100054 m!1019609))

(assert (=> b!1100054 m!1019609))

(assert (=> b!1100054 m!1019349))

(assert (=> b!1100054 m!1019611))

(assert (=> b!1100054 m!1019571))

(assert (=> b!1100054 m!1019349))

(assert (=> b!1100047 m!1019571))

(assert (=> b!1100047 m!1019571))

(assert (=> b!1100047 m!1019573))

(declare-fun m!1019619 () Bool)

(assert (=> b!1100055 m!1019619))

(declare-fun m!1019621 () Bool)

(assert (=> b!1100052 m!1019621))

(declare-fun m!1019623 () Bool)

(assert (=> d!130411 m!1019623))

(assert (=> d!130411 m!1019377))

(assert (=> b!1100048 m!1019571))

(assert (=> b!1100048 m!1019571))

(declare-fun m!1019625 () Bool)

(assert (=> b!1100048 m!1019625))

(assert (=> bm!46054 m!1019615))

(declare-fun m!1019627 () Bool)

(assert (=> b!1100057 m!1019627))

(declare-fun m!1019629 () Bool)

(assert (=> b!1100057 m!1019629))

(declare-fun m!1019631 () Bool)

(assert (=> b!1100057 m!1019631))

(assert (=> b!1100057 m!1019609))

(assert (=> b!1100057 m!1019609))

(assert (=> b!1100057 m!1019349))

(assert (=> b!1100057 m!1019611))

(assert (=> b!1100057 m!1019571))

(assert (=> b!1100057 m!1019349))

(declare-fun m!1019633 () Bool)

(assert (=> b!1100057 m!1019633))

(assert (=> b!1100057 m!1019629))

(assert (=> b!1099806 d!130411))

(declare-fun b!1100059 () Bool)

(declare-fun e!627878 () ListLongMap!15375)

(declare-fun e!627879 () ListLongMap!15375)

(assert (=> b!1100059 (= e!627878 e!627879)))

(declare-fun c!108670 () Bool)

(assert (=> b!1100059 (= c!108670 (validKeyInArray!0 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1100060 () Bool)

(declare-fun e!627877 () Bool)

(declare-fun e!627875 () Bool)

(assert (=> b!1100060 (= e!627877 e!627875)))

(assert (=> b!1100060 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34798 _keys!1070)))))

(declare-fun res!734086 () Bool)

(declare-fun lt!492670 () ListLongMap!15375)

(assert (=> b!1100060 (= res!734086 (contains!6365 lt!492670 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1100060 (=> (not res!734086) (not e!627875))))

(declare-fun b!1100061 () Bool)

(declare-fun e!627874 () Bool)

(assert (=> b!1100061 (= e!627874 e!627877)))

(declare-fun c!108668 () Bool)

(declare-fun e!627873 () Bool)

(assert (=> b!1100061 (= c!108668 e!627873)))

(declare-fun res!734085 () Bool)

(assert (=> b!1100061 (=> (not res!734085) (not e!627873))))

(assert (=> b!1100061 (= res!734085 (bvslt #b00000000000000000000000000000000 (size!34798 _keys!1070)))))

(declare-fun d!130413 () Bool)

(assert (=> d!130413 e!627874))

(declare-fun res!734087 () Bool)

(assert (=> d!130413 (=> (not res!734087) (not e!627874))))

(assert (=> d!130413 (= res!734087 (not (contains!6365 lt!492670 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130413 (= lt!492670 e!627878)))

(declare-fun c!108671 () Bool)

(assert (=> d!130413 (= c!108671 (bvsge #b00000000000000000000000000000000 (size!34798 _keys!1070)))))

(assert (=> d!130413 (validMask!0 mask!1414)))

(assert (=> d!130413 (= (getCurrentListMapNoExtraKeys!4229 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492670)))

(declare-fun b!1100062 () Bool)

(assert (=> b!1100062 (= e!627878 (ListLongMap!15376 Nil!23997))))

(declare-fun b!1100063 () Bool)

(declare-fun call!46058 () ListLongMap!15375)

(assert (=> b!1100063 (= e!627879 call!46058)))

(declare-fun b!1100064 () Bool)

(declare-fun e!627876 () Bool)

(assert (=> b!1100064 (= e!627876 (isEmpty!972 lt!492670))))

(declare-fun b!1100065 () Bool)

(assert (=> b!1100065 (= e!627877 e!627876)))

(declare-fun c!108669 () Bool)

(assert (=> b!1100065 (= c!108669 (bvslt #b00000000000000000000000000000000 (size!34798 _keys!1070)))))

(declare-fun b!1100066 () Bool)

(assert (=> b!1100066 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34798 _keys!1070)))))

(assert (=> b!1100066 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34797 _values!874)))))

(assert (=> b!1100066 (= e!627875 (= (apply!942 lt!492670 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000)) (get!17634 (select (arr!34259 _values!874) #b00000000000000000000000000000000) (dynLambda!2298 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!46055 () Bool)

(assert (=> bm!46055 (= call!46058 (getCurrentListMapNoExtraKeys!4229 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1100067 () Bool)

(declare-fun res!734084 () Bool)

(assert (=> b!1100067 (=> (not res!734084) (not e!627874))))

(assert (=> b!1100067 (= res!734084 (not (contains!6365 lt!492670 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1100068 () Bool)

(assert (=> b!1100068 (= e!627876 (= lt!492670 (getCurrentListMapNoExtraKeys!4229 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1100069 () Bool)

(declare-fun lt!492673 () Unit!35993)

(declare-fun lt!492669 () Unit!35993)

(assert (=> b!1100069 (= lt!492673 lt!492669)))

(declare-fun lt!492668 () V!41369)

(declare-fun lt!492671 () ListLongMap!15375)

(declare-fun lt!492672 () (_ BitVec 64))

(declare-fun lt!492674 () (_ BitVec 64))

(assert (=> b!1100069 (not (contains!6365 (+!3414 lt!492671 (tuple2!17407 lt!492674 lt!492668)) lt!492672))))

(assert (=> b!1100069 (= lt!492669 (addStillNotContains!278 lt!492671 lt!492674 lt!492668 lt!492672))))

(assert (=> b!1100069 (= lt!492672 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1100069 (= lt!492668 (get!17634 (select (arr!34259 _values!874) #b00000000000000000000000000000000) (dynLambda!2298 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1100069 (= lt!492674 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1100069 (= lt!492671 call!46058)))

(assert (=> b!1100069 (= e!627879 (+!3414 call!46058 (tuple2!17407 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000) (get!17634 (select (arr!34259 _values!874) #b00000000000000000000000000000000) (dynLambda!2298 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1100070 () Bool)

(assert (=> b!1100070 (= e!627873 (validKeyInArray!0 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1100070 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!130413 c!108671) b!1100062))

(assert (= (and d!130413 (not c!108671)) b!1100059))

(assert (= (and b!1100059 c!108670) b!1100069))

(assert (= (and b!1100059 (not c!108670)) b!1100063))

(assert (= (or b!1100069 b!1100063) bm!46055))

(assert (= (and d!130413 res!734087) b!1100067))

(assert (= (and b!1100067 res!734084) b!1100061))

(assert (= (and b!1100061 res!734085) b!1100070))

(assert (= (and b!1100061 c!108668) b!1100060))

(assert (= (and b!1100061 (not c!108668)) b!1100065))

(assert (= (and b!1100060 res!734086) b!1100066))

(assert (= (and b!1100065 c!108669) b!1100068))

(assert (= (and b!1100065 (not c!108669)) b!1100064))

(declare-fun b_lambda!17965 () Bool)

(assert (=> (not b_lambda!17965) (not b!1100066)))

(assert (=> b!1100066 t!34167))

(declare-fun b_and!37005 () Bool)

(assert (= b_and!37003 (and (=> t!34167 result!16521) b_and!37005)))

(declare-fun b_lambda!17967 () Bool)

(assert (=> (not b_lambda!17967) (not b!1100069)))

(assert (=> b!1100069 t!34167))

(declare-fun b_and!37007 () Bool)

(assert (= b_and!37005 (and (=> t!34167 result!16521) b_and!37007)))

(assert (=> b!1100070 m!1019489))

(assert (=> b!1100070 m!1019489))

(assert (=> b!1100070 m!1019491))

(declare-fun m!1019635 () Bool)

(assert (=> b!1100068 m!1019635))

(assert (=> b!1100066 m!1019489))

(declare-fun m!1019637 () Bool)

(assert (=> b!1100066 m!1019637))

(assert (=> b!1100066 m!1019549))

(assert (=> b!1100066 m!1019549))

(assert (=> b!1100066 m!1019349))

(assert (=> b!1100066 m!1019551))

(assert (=> b!1100066 m!1019489))

(assert (=> b!1100066 m!1019349))

(assert (=> b!1100059 m!1019489))

(assert (=> b!1100059 m!1019489))

(assert (=> b!1100059 m!1019491))

(declare-fun m!1019639 () Bool)

(assert (=> b!1100067 m!1019639))

(declare-fun m!1019641 () Bool)

(assert (=> b!1100064 m!1019641))

(declare-fun m!1019643 () Bool)

(assert (=> d!130413 m!1019643))

(assert (=> d!130413 m!1019377))

(assert (=> b!1100060 m!1019489))

(assert (=> b!1100060 m!1019489))

(declare-fun m!1019645 () Bool)

(assert (=> b!1100060 m!1019645))

(assert (=> bm!46055 m!1019635))

(declare-fun m!1019647 () Bool)

(assert (=> b!1100069 m!1019647))

(declare-fun m!1019649 () Bool)

(assert (=> b!1100069 m!1019649))

(declare-fun m!1019651 () Bool)

(assert (=> b!1100069 m!1019651))

(assert (=> b!1100069 m!1019549))

(assert (=> b!1100069 m!1019549))

(assert (=> b!1100069 m!1019349))

(assert (=> b!1100069 m!1019551))

(assert (=> b!1100069 m!1019489))

(assert (=> b!1100069 m!1019349))

(declare-fun m!1019653 () Bool)

(assert (=> b!1100069 m!1019653))

(assert (=> b!1100069 m!1019649))

(assert (=> b!1099806 d!130413))

(declare-fun d!130415 () Bool)

(assert (=> d!130415 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492677 () Unit!35993)

(declare-fun choose!13 (array!71188 (_ BitVec 64) (_ BitVec 32)) Unit!35993)

(assert (=> d!130415 (= lt!492677 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130415 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130415 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!492677)))

(declare-fun bs!32273 () Bool)

(assert (= bs!32273 d!130415))

(assert (=> bs!32273 m!1019355))

(declare-fun m!1019655 () Bool)

(assert (=> bs!32273 m!1019655))

(assert (=> b!1099806 d!130415))

(declare-fun d!130417 () Bool)

(declare-fun e!627882 () Bool)

(assert (=> d!130417 e!627882))

(declare-fun res!734092 () Bool)

(assert (=> d!130417 (=> (not res!734092) (not e!627882))))

(declare-fun lt!492687 () ListLongMap!15375)

(assert (=> d!130417 (= res!734092 (contains!6365 lt!492687 (_1!8714 lt!492477)))))

(declare-fun lt!492686 () List!24000)

(assert (=> d!130417 (= lt!492687 (ListLongMap!15376 lt!492686))))

(declare-fun lt!492689 () Unit!35993)

(declare-fun lt!492688 () Unit!35993)

(assert (=> d!130417 (= lt!492689 lt!492688)))

(declare-datatypes ((Option!677 0))(
  ( (Some!676 (v!16276 V!41369)) (None!675) )
))
(declare-fun getValueByKey!626 (List!24000 (_ BitVec 64)) Option!677)

(assert (=> d!130417 (= (getValueByKey!626 lt!492686 (_1!8714 lt!492477)) (Some!676 (_2!8714 lt!492477)))))

(declare-fun lemmaContainsTupThenGetReturnValue!302 (List!24000 (_ BitVec 64) V!41369) Unit!35993)

(assert (=> d!130417 (= lt!492688 (lemmaContainsTupThenGetReturnValue!302 lt!492686 (_1!8714 lt!492477) (_2!8714 lt!492477)))))

(declare-fun insertStrictlySorted!395 (List!24000 (_ BitVec 64) V!41369) List!24000)

(assert (=> d!130417 (= lt!492686 (insertStrictlySorted!395 (toList!7703 lt!492481) (_1!8714 lt!492477) (_2!8714 lt!492477)))))

(assert (=> d!130417 (= (+!3414 lt!492481 lt!492477) lt!492687)))

(declare-fun b!1100075 () Bool)

(declare-fun res!734093 () Bool)

(assert (=> b!1100075 (=> (not res!734093) (not e!627882))))

(assert (=> b!1100075 (= res!734093 (= (getValueByKey!626 (toList!7703 lt!492687) (_1!8714 lt!492477)) (Some!676 (_2!8714 lt!492477))))))

(declare-fun b!1100076 () Bool)

(declare-fun contains!6366 (List!24000 tuple2!17406) Bool)

(assert (=> b!1100076 (= e!627882 (contains!6366 (toList!7703 lt!492687) lt!492477))))

(assert (= (and d!130417 res!734092) b!1100075))

(assert (= (and b!1100075 res!734093) b!1100076))

(declare-fun m!1019657 () Bool)

(assert (=> d!130417 m!1019657))

(declare-fun m!1019659 () Bool)

(assert (=> d!130417 m!1019659))

(declare-fun m!1019661 () Bool)

(assert (=> d!130417 m!1019661))

(declare-fun m!1019663 () Bool)

(assert (=> d!130417 m!1019663))

(declare-fun m!1019665 () Bool)

(assert (=> b!1100075 m!1019665))

(declare-fun m!1019667 () Bool)

(assert (=> b!1100076 m!1019667))

(assert (=> b!1099810 d!130417))

(declare-fun b!1100077 () Bool)

(declare-fun e!627885 () Bool)

(declare-fun call!46059 () Bool)

(assert (=> b!1100077 (= e!627885 call!46059)))

(declare-fun bm!46056 () Bool)

(assert (=> bm!46056 (= call!46059 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!492475 mask!1414))))

(declare-fun b!1100078 () Bool)

(declare-fun e!627883 () Bool)

(assert (=> b!1100078 (= e!627883 e!627885)))

(declare-fun c!108672 () Bool)

(assert (=> b!1100078 (= c!108672 (validKeyInArray!0 (select (arr!34260 lt!492475) #b00000000000000000000000000000000)))))

(declare-fun d!130419 () Bool)

(declare-fun res!734094 () Bool)

(assert (=> d!130419 (=> res!734094 e!627883)))

(assert (=> d!130419 (= res!734094 (bvsge #b00000000000000000000000000000000 (size!34798 lt!492475)))))

(assert (=> d!130419 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492475 mask!1414) e!627883)))

(declare-fun b!1100079 () Bool)

(declare-fun e!627884 () Bool)

(assert (=> b!1100079 (= e!627884 call!46059)))

(declare-fun b!1100080 () Bool)

(assert (=> b!1100080 (= e!627885 e!627884)))

(declare-fun lt!492692 () (_ BitVec 64))

(assert (=> b!1100080 (= lt!492692 (select (arr!34260 lt!492475) #b00000000000000000000000000000000))))

(declare-fun lt!492690 () Unit!35993)

(assert (=> b!1100080 (= lt!492690 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!492475 lt!492692 #b00000000000000000000000000000000))))

(assert (=> b!1100080 (arrayContainsKey!0 lt!492475 lt!492692 #b00000000000000000000000000000000)))

(declare-fun lt!492691 () Unit!35993)

(assert (=> b!1100080 (= lt!492691 lt!492690)))

(declare-fun res!734095 () Bool)

(assert (=> b!1100080 (= res!734095 (= (seekEntryOrOpen!0 (select (arr!34260 lt!492475) #b00000000000000000000000000000000) lt!492475 mask!1414) (Found!9911 #b00000000000000000000000000000000)))))

(assert (=> b!1100080 (=> (not res!734095) (not e!627884))))

(assert (= (and d!130419 (not res!734094)) b!1100078))

(assert (= (and b!1100078 c!108672) b!1100080))

(assert (= (and b!1100078 (not c!108672)) b!1100077))

(assert (= (and b!1100080 res!734095) b!1100079))

(assert (= (or b!1100079 b!1100077) bm!46056))

(declare-fun m!1019669 () Bool)

(assert (=> bm!46056 m!1019669))

(assert (=> b!1100078 m!1019571))

(assert (=> b!1100078 m!1019571))

(assert (=> b!1100078 m!1019573))

(assert (=> b!1100080 m!1019571))

(declare-fun m!1019671 () Bool)

(assert (=> b!1100080 m!1019671))

(declare-fun m!1019673 () Bool)

(assert (=> b!1100080 m!1019673))

(assert (=> b!1100080 m!1019571))

(declare-fun m!1019675 () Bool)

(assert (=> b!1100080 m!1019675))

(assert (=> b!1099803 d!130419))

(declare-fun d!130421 () Bool)

(declare-fun e!627886 () Bool)

(assert (=> d!130421 e!627886))

(declare-fun res!734096 () Bool)

(assert (=> d!130421 (=> (not res!734096) (not e!627886))))

(declare-fun lt!492694 () ListLongMap!15375)

(assert (=> d!130421 (= res!734096 (contains!6365 lt!492694 (_1!8714 lt!492477)))))

(declare-fun lt!492693 () List!24000)

(assert (=> d!130421 (= lt!492694 (ListLongMap!15376 lt!492693))))

(declare-fun lt!492696 () Unit!35993)

(declare-fun lt!492695 () Unit!35993)

(assert (=> d!130421 (= lt!492696 lt!492695)))

(assert (=> d!130421 (= (getValueByKey!626 lt!492693 (_1!8714 lt!492477)) (Some!676 (_2!8714 lt!492477)))))

(assert (=> d!130421 (= lt!492695 (lemmaContainsTupThenGetReturnValue!302 lt!492693 (_1!8714 lt!492477) (_2!8714 lt!492477)))))

(assert (=> d!130421 (= lt!492693 (insertStrictlySorted!395 (toList!7703 lt!492482) (_1!8714 lt!492477) (_2!8714 lt!492477)))))

(assert (=> d!130421 (= (+!3414 lt!492482 lt!492477) lt!492694)))

(declare-fun b!1100081 () Bool)

(declare-fun res!734097 () Bool)

(assert (=> b!1100081 (=> (not res!734097) (not e!627886))))

(assert (=> b!1100081 (= res!734097 (= (getValueByKey!626 (toList!7703 lt!492694) (_1!8714 lt!492477)) (Some!676 (_2!8714 lt!492477))))))

(declare-fun b!1100082 () Bool)

(assert (=> b!1100082 (= e!627886 (contains!6366 (toList!7703 lt!492694) lt!492477))))

(assert (= (and d!130421 res!734096) b!1100081))

(assert (= (and b!1100081 res!734097) b!1100082))

(declare-fun m!1019677 () Bool)

(assert (=> d!130421 m!1019677))

(declare-fun m!1019679 () Bool)

(assert (=> d!130421 m!1019679))

(declare-fun m!1019681 () Bool)

(assert (=> d!130421 m!1019681))

(declare-fun m!1019683 () Bool)

(assert (=> d!130421 m!1019683))

(declare-fun m!1019685 () Bool)

(assert (=> b!1100081 m!1019685))

(declare-fun m!1019687 () Bool)

(assert (=> b!1100082 m!1019687))

(assert (=> b!1099811 d!130421))

(declare-fun d!130423 () Bool)

(assert (=> d!130423 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96704 d!130423))

(declare-fun d!130425 () Bool)

(assert (=> d!130425 (= (array_inv!26420 _keys!1070) (bvsge (size!34798 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96704 d!130425))

(declare-fun d!130427 () Bool)

(assert (=> d!130427 (= (array_inv!26421 _values!874) (bvsge (size!34797 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96704 d!130427))

(declare-fun bm!46059 () Bool)

(declare-fun call!46062 () Bool)

(declare-fun c!108675 () Bool)

(assert (=> bm!46059 (= call!46062 (arrayNoDuplicates!0 lt!492475 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108675 (Cons!23997 (select (arr!34260 lt!492475) #b00000000000000000000000000000000) Nil!23998) Nil!23998)))))

(declare-fun b!1100093 () Bool)

(declare-fun e!627898 () Bool)

(declare-fun e!627897 () Bool)

(assert (=> b!1100093 (= e!627898 e!627897)))

(assert (=> b!1100093 (= c!108675 (validKeyInArray!0 (select (arr!34260 lt!492475) #b00000000000000000000000000000000)))))

(declare-fun b!1100094 () Bool)

(declare-fun e!627895 () Bool)

(declare-fun contains!6367 (List!24001 (_ BitVec 64)) Bool)

(assert (=> b!1100094 (= e!627895 (contains!6367 Nil!23998 (select (arr!34260 lt!492475) #b00000000000000000000000000000000)))))

(declare-fun b!1100095 () Bool)

(assert (=> b!1100095 (= e!627897 call!46062)))

(declare-fun d!130429 () Bool)

(declare-fun res!734106 () Bool)

(declare-fun e!627896 () Bool)

(assert (=> d!130429 (=> res!734106 e!627896)))

(assert (=> d!130429 (= res!734106 (bvsge #b00000000000000000000000000000000 (size!34798 lt!492475)))))

(assert (=> d!130429 (= (arrayNoDuplicates!0 lt!492475 #b00000000000000000000000000000000 Nil!23998) e!627896)))

(declare-fun b!1100096 () Bool)

(assert (=> b!1100096 (= e!627896 e!627898)))

(declare-fun res!734104 () Bool)

(assert (=> b!1100096 (=> (not res!734104) (not e!627898))))

(assert (=> b!1100096 (= res!734104 (not e!627895))))

(declare-fun res!734105 () Bool)

(assert (=> b!1100096 (=> (not res!734105) (not e!627895))))

(assert (=> b!1100096 (= res!734105 (validKeyInArray!0 (select (arr!34260 lt!492475) #b00000000000000000000000000000000)))))

(declare-fun b!1100097 () Bool)

(assert (=> b!1100097 (= e!627897 call!46062)))

(assert (= (and d!130429 (not res!734106)) b!1100096))

(assert (= (and b!1100096 res!734105) b!1100094))

(assert (= (and b!1100096 res!734104) b!1100093))

(assert (= (and b!1100093 c!108675) b!1100095))

(assert (= (and b!1100093 (not c!108675)) b!1100097))

(assert (= (or b!1100095 b!1100097) bm!46059))

(assert (=> bm!46059 m!1019571))

(declare-fun m!1019689 () Bool)

(assert (=> bm!46059 m!1019689))

(assert (=> b!1100093 m!1019571))

(assert (=> b!1100093 m!1019571))

(assert (=> b!1100093 m!1019573))

(assert (=> b!1100094 m!1019571))

(assert (=> b!1100094 m!1019571))

(declare-fun m!1019691 () Bool)

(assert (=> b!1100094 m!1019691))

(assert (=> b!1100096 m!1019571))

(assert (=> b!1100096 m!1019571))

(assert (=> b!1100096 m!1019573))

(assert (=> b!1099808 d!130429))

(declare-fun bm!46060 () Bool)

(declare-fun call!46063 () Bool)

(declare-fun c!108676 () Bool)

(assert (=> bm!46060 (= call!46063 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108676 (Cons!23997 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000) Nil!23998) Nil!23998)))))

(declare-fun b!1100098 () Bool)

(declare-fun e!627902 () Bool)

(declare-fun e!627901 () Bool)

(assert (=> b!1100098 (= e!627902 e!627901)))

(assert (=> b!1100098 (= c!108676 (validKeyInArray!0 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1100099 () Bool)

(declare-fun e!627899 () Bool)

(assert (=> b!1100099 (= e!627899 (contains!6367 Nil!23998 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1100100 () Bool)

(assert (=> b!1100100 (= e!627901 call!46063)))

(declare-fun d!130431 () Bool)

(declare-fun res!734109 () Bool)

(declare-fun e!627900 () Bool)

(assert (=> d!130431 (=> res!734109 e!627900)))

(assert (=> d!130431 (= res!734109 (bvsge #b00000000000000000000000000000000 (size!34798 _keys!1070)))))

(assert (=> d!130431 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23998) e!627900)))

(declare-fun b!1100101 () Bool)

(assert (=> b!1100101 (= e!627900 e!627902)))

(declare-fun res!734107 () Bool)

(assert (=> b!1100101 (=> (not res!734107) (not e!627902))))

(assert (=> b!1100101 (= res!734107 (not e!627899))))

(declare-fun res!734108 () Bool)

(assert (=> b!1100101 (=> (not res!734108) (not e!627899))))

(assert (=> b!1100101 (= res!734108 (validKeyInArray!0 (select (arr!34260 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1100102 () Bool)

(assert (=> b!1100102 (= e!627901 call!46063)))

(assert (= (and d!130431 (not res!734109)) b!1100101))

(assert (= (and b!1100101 res!734108) b!1100099))

(assert (= (and b!1100101 res!734107) b!1100098))

(assert (= (and b!1100098 c!108676) b!1100100))

(assert (= (and b!1100098 (not c!108676)) b!1100102))

(assert (= (or b!1100100 b!1100102) bm!46060))

(assert (=> bm!46060 m!1019489))

(declare-fun m!1019693 () Bool)

(assert (=> bm!46060 m!1019693))

(assert (=> b!1100098 m!1019489))

(assert (=> b!1100098 m!1019489))

(assert (=> b!1100098 m!1019491))

(assert (=> b!1100099 m!1019489))

(assert (=> b!1100099 m!1019489))

(declare-fun m!1019695 () Bool)

(assert (=> b!1100099 m!1019695))

(assert (=> b!1100101 m!1019489))

(assert (=> b!1100101 m!1019489))

(assert (=> b!1100101 m!1019491))

(assert (=> b!1099813 d!130431))

(declare-fun d!130433 () Bool)

(declare-fun e!627903 () Bool)

(assert (=> d!130433 e!627903))

(declare-fun res!734110 () Bool)

(assert (=> d!130433 (=> (not res!734110) (not e!627903))))

(declare-fun lt!492698 () ListLongMap!15375)

(assert (=> d!130433 (= res!734110 (contains!6365 lt!492698 (_1!8714 lt!492477)))))

(declare-fun lt!492697 () List!24000)

(assert (=> d!130433 (= lt!492698 (ListLongMap!15376 lt!492697))))

(declare-fun lt!492700 () Unit!35993)

(declare-fun lt!492699 () Unit!35993)

(assert (=> d!130433 (= lt!492700 lt!492699)))

(assert (=> d!130433 (= (getValueByKey!626 lt!492697 (_1!8714 lt!492477)) (Some!676 (_2!8714 lt!492477)))))

(assert (=> d!130433 (= lt!492699 (lemmaContainsTupThenGetReturnValue!302 lt!492697 (_1!8714 lt!492477) (_2!8714 lt!492477)))))

(assert (=> d!130433 (= lt!492697 (insertStrictlySorted!395 (toList!7703 lt!492476) (_1!8714 lt!492477) (_2!8714 lt!492477)))))

(assert (=> d!130433 (= (+!3414 lt!492476 lt!492477) lt!492698)))

(declare-fun b!1100103 () Bool)

(declare-fun res!734111 () Bool)

(assert (=> b!1100103 (=> (not res!734111) (not e!627903))))

(assert (=> b!1100103 (= res!734111 (= (getValueByKey!626 (toList!7703 lt!492698) (_1!8714 lt!492477)) (Some!676 (_2!8714 lt!492477))))))

(declare-fun b!1100104 () Bool)

(assert (=> b!1100104 (= e!627903 (contains!6366 (toList!7703 lt!492698) lt!492477))))

(assert (= (and d!130433 res!734110) b!1100103))

(assert (= (and b!1100103 res!734111) b!1100104))

(declare-fun m!1019697 () Bool)

(assert (=> d!130433 m!1019697))

(declare-fun m!1019699 () Bool)

(assert (=> d!130433 m!1019699))

(declare-fun m!1019701 () Bool)

(assert (=> d!130433 m!1019701))

(declare-fun m!1019703 () Bool)

(assert (=> d!130433 m!1019703))

(declare-fun m!1019705 () Bool)

(assert (=> b!1100103 m!1019705))

(declare-fun m!1019707 () Bool)

(assert (=> b!1100104 m!1019707))

(assert (=> b!1099804 d!130433))

(declare-fun condMapEmpty!42559 () Bool)

(declare-fun mapDefault!42559 () ValueCell!12881)

(assert (=> mapNonEmpty!42550 (= condMapEmpty!42559 (= mapRest!42550 ((as const (Array (_ BitVec 32) ValueCell!12881)) mapDefault!42559)))))

(declare-fun e!627908 () Bool)

(declare-fun mapRes!42559 () Bool)

(assert (=> mapNonEmpty!42550 (= tp!81338 (and e!627908 mapRes!42559))))

(declare-fun b!1100112 () Bool)

(assert (=> b!1100112 (= e!627908 tp_is_empty!27181)))

(declare-fun mapNonEmpty!42559 () Bool)

(declare-fun tp!81353 () Bool)

(declare-fun e!627909 () Bool)

(assert (=> mapNonEmpty!42559 (= mapRes!42559 (and tp!81353 e!627909))))

(declare-fun mapRest!42559 () (Array (_ BitVec 32) ValueCell!12881))

(declare-fun mapKey!42559 () (_ BitVec 32))

(declare-fun mapValue!42559 () ValueCell!12881)

(assert (=> mapNonEmpty!42559 (= mapRest!42550 (store mapRest!42559 mapKey!42559 mapValue!42559))))

(declare-fun b!1100111 () Bool)

(assert (=> b!1100111 (= e!627909 tp_is_empty!27181)))

(declare-fun mapIsEmpty!42559 () Bool)

(assert (=> mapIsEmpty!42559 mapRes!42559))

(assert (= (and mapNonEmpty!42550 condMapEmpty!42559) mapIsEmpty!42559))

(assert (= (and mapNonEmpty!42550 (not condMapEmpty!42559)) mapNonEmpty!42559))

(assert (= (and mapNonEmpty!42559 ((_ is ValueCellFull!12881) mapValue!42559)) b!1100111))

(assert (= (and mapNonEmpty!42550 ((_ is ValueCellFull!12881) mapDefault!42559)) b!1100112))

(declare-fun m!1019709 () Bool)

(assert (=> mapNonEmpty!42559 m!1019709))

(declare-fun b_lambda!17969 () Bool)

(assert (= b_lambda!17967 (or (and start!96704 b_free!23131) b_lambda!17969)))

(declare-fun b_lambda!17971 () Bool)

(assert (= b_lambda!17955 (or (and start!96704 b_free!23131) b_lambda!17971)))

(declare-fun b_lambda!17973 () Bool)

(assert (= b_lambda!17959 (or (and start!96704 b_free!23131) b_lambda!17973)))

(declare-fun b_lambda!17975 () Bool)

(assert (= b_lambda!17963 (or (and start!96704 b_free!23131) b_lambda!17975)))

(declare-fun b_lambda!17977 () Bool)

(assert (= b_lambda!17957 (or (and start!96704 b_free!23131) b_lambda!17977)))

(declare-fun b_lambda!17979 () Bool)

(assert (= b_lambda!17965 (or (and start!96704 b_free!23131) b_lambda!17979)))

(declare-fun b_lambda!17981 () Bool)

(assert (= b_lambda!17961 (or (and start!96704 b_free!23131) b_lambda!17981)))

(check-sat (not d!130405) (not bm!46060) (not b!1100066) (not b!1099983) (not b!1100104) (not b_lambda!17973) (not b!1099982) (not b!1099985) (not b!1100067) (not b_lambda!17971) (not b!1100057) (not b!1100081) (not d!130415) (not d!130421) (not bm!46017) (not b!1100052) (not bm!46038) b_and!37007 (not b!1100068) (not bm!46059) (not b!1100099) (not b_lambda!17969) (not d!130413) (not b!1100080) (not b!1099990) (not bm!46049) (not bm!46033) (not b!1100094) (not b!1100076) (not d!130403) (not b!1100093) (not bm!46054) (not b_lambda!17977) (not bm!46055) (not b!1099923) (not b!1099987) (not b!1100017) (not d!130433) (not b_lambda!17981) (not mapNonEmpty!42559) (not b!1100020) (not bm!46044) (not bm!46036) (not b!1100078) (not b!1099975) (not d!130409) (not b_lambda!17953) (not b!1100047) (not b!1100103) (not b!1100075) (not b!1100021) (not bm!46051) (not b!1100012) (not b!1099973) (not b!1100054) (not b!1100069) (not d!130407) (not b!1100058) (not b!1100060) (not b_lambda!17975) (not b!1100064) tp_is_empty!27181 (not b!1100101) (not bm!46046) (not b!1099929) (not bm!46056) (not d!130417) (not b!1100056) (not b!1100098) (not d!130411) (not b!1100005) (not b!1100059) (not b!1099991) (not bm!46032) (not b!1100048) (not b!1099921) (not b!1100015) (not bm!46045) (not b!1100070) (not b!1100082) (not b_lambda!17979) (not bm!46043) (not b!1100096) (not b!1100001) (not b!1100013) (not b_next!23131) (not b!1100003) (not b!1100055))
(check-sat b_and!37007 (not b_next!23131))
