; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96616 () Bool)

(assert start!96616)

(declare-fun b_free!23095 () Bool)

(declare-fun b_next!23095 () Bool)

(assert (=> start!96616 (= b_free!23095 (not b_next!23095))))

(declare-fun tp!81223 () Bool)

(declare-fun b_and!36883 () Bool)

(assert (=> start!96616 (= tp!81223 b_and!36883)))

(declare-fun b!1098629 () Bool)

(declare-fun res!733186 () Bool)

(declare-fun e!627054 () Bool)

(assert (=> b!1098629 (=> (not res!733186) (not e!627054))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!71112 0))(
  ( (array!71113 (arr!34224 (Array (_ BitVec 32) (_ BitVec 64))) (size!34762 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71112)

(assert (=> b!1098629 (= res!733186 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34762 _keys!1070))))))

(declare-fun mapIsEmpty!42490 () Bool)

(declare-fun mapRes!42490 () Bool)

(assert (=> mapIsEmpty!42490 mapRes!42490))

(declare-fun b!1098630 () Bool)

(declare-fun res!733193 () Bool)

(assert (=> b!1098630 (=> (not res!733193) (not e!627054))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1098630 (= res!733193 (= (select (arr!34224 _keys!1070) i!650) k0!904))))

(declare-fun b!1098631 () Bool)

(declare-fun e!627053 () Bool)

(declare-fun e!627050 () Bool)

(assert (=> b!1098631 (= e!627053 (and e!627050 mapRes!42490))))

(declare-fun condMapEmpty!42490 () Bool)

(declare-datatypes ((V!41321 0))(
  ( (V!41322 (val!13629 Int)) )
))
(declare-datatypes ((ValueCell!12863 0))(
  ( (ValueCellFull!12863 (v!16253 V!41321)) (EmptyCell!12863) )
))
(declare-datatypes ((array!71114 0))(
  ( (array!71115 (arr!34225 (Array (_ BitVec 32) ValueCell!12863)) (size!34763 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71114)

(declare-fun mapDefault!42490 () ValueCell!12863)

(assert (=> b!1098631 (= condMapEmpty!42490 (= (arr!34225 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12863)) mapDefault!42490)))))

(declare-fun b!1098632 () Bool)

(declare-fun res!733192 () Bool)

(assert (=> b!1098632 (=> (not res!733192) (not e!627054))))

(declare-datatypes ((List!23971 0))(
  ( (Nil!23968) (Cons!23967 (h!25176 (_ BitVec 64)) (t!34103 List!23971)) )
))
(declare-fun arrayNoDuplicates!0 (array!71112 (_ BitVec 32) List!23971) Bool)

(assert (=> b!1098632 (= res!733192 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23968))))

(declare-fun b!1098633 () Bool)

(declare-fun e!627057 () Bool)

(assert (=> b!1098633 (= e!627057 true)))

(declare-datatypes ((tuple2!17380 0))(
  ( (tuple2!17381 (_1!8701 (_ BitVec 64)) (_2!8701 V!41321)) )
))
(declare-datatypes ((List!23972 0))(
  ( (Nil!23969) (Cons!23968 (h!25177 tuple2!17380) (t!34104 List!23972)) )
))
(declare-datatypes ((ListLongMap!15349 0))(
  ( (ListLongMap!15350 (toList!7690 List!23972)) )
))
(declare-fun lt!491469 () ListLongMap!15349)

(declare-fun lt!491471 () tuple2!17380)

(declare-fun lt!491477 () ListLongMap!15349)

(declare-fun -!925 (ListLongMap!15349 (_ BitVec 64)) ListLongMap!15349)

(declare-fun +!3402 (ListLongMap!15349 tuple2!17380) ListLongMap!15349)

(assert (=> b!1098633 (= (-!925 lt!491477 k0!904) (+!3402 lt!491469 lt!491471))))

(declare-fun minValue!831 () V!41321)

(declare-datatypes ((Unit!35965 0))(
  ( (Unit!35966) )
))
(declare-fun lt!491482 () Unit!35965)

(declare-fun lt!491481 () ListLongMap!15349)

(declare-fun addRemoveCommutativeForDiffKeys!120 (ListLongMap!15349 (_ BitVec 64) V!41321 (_ BitVec 64)) Unit!35965)

(assert (=> b!1098633 (= lt!491482 (addRemoveCommutativeForDiffKeys!120 lt!491481 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1098634 () Bool)

(declare-fun tp_is_empty!27145 () Bool)

(assert (=> b!1098634 (= e!627050 tp_is_empty!27145)))

(declare-fun b!1098635 () Bool)

(declare-fun e!627052 () Bool)

(declare-fun e!627055 () Bool)

(assert (=> b!1098635 (= e!627052 (not e!627055))))

(declare-fun res!733188 () Bool)

(assert (=> b!1098635 (=> res!733188 e!627055)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1098635 (= res!733188 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!491472 () ListLongMap!15349)

(declare-fun defaultEntry!882 () Int)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41321)

(declare-fun getCurrentListMap!4311 (array!71112 array!71114 (_ BitVec 32) (_ BitVec 32) V!41321 V!41321 (_ BitVec 32) Int) ListLongMap!15349)

(assert (=> b!1098635 (= lt!491472 (getCurrentListMap!4311 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491480 () array!71112)

(declare-fun lt!491473 () array!71114)

(declare-fun lt!491474 () ListLongMap!15349)

(assert (=> b!1098635 (= lt!491474 (getCurrentListMap!4311 lt!491480 lt!491473 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491467 () ListLongMap!15349)

(declare-fun lt!491478 () ListLongMap!15349)

(assert (=> b!1098635 (and (= lt!491467 lt!491478) (= lt!491478 lt!491467))))

(declare-fun lt!491468 () ListLongMap!15349)

(assert (=> b!1098635 (= lt!491478 (-!925 lt!491468 k0!904))))

(declare-fun lt!491476 () Unit!35965)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!200 (array!71112 array!71114 (_ BitVec 32) (_ BitVec 32) V!41321 V!41321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35965)

(assert (=> b!1098635 (= lt!491476 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!200 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4218 (array!71112 array!71114 (_ BitVec 32) (_ BitVec 32) V!41321 V!41321 (_ BitVec 32) Int) ListLongMap!15349)

(assert (=> b!1098635 (= lt!491467 (getCurrentListMapNoExtraKeys!4218 lt!491480 lt!491473 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2287 (Int (_ BitVec 64)) V!41321)

(assert (=> b!1098635 (= lt!491473 (array!71115 (store (arr!34225 _values!874) i!650 (ValueCellFull!12863 (dynLambda!2287 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34763 _values!874)))))

(assert (=> b!1098635 (= lt!491468 (getCurrentListMapNoExtraKeys!4218 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71112 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1098635 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!491466 () Unit!35965)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71112 (_ BitVec 64) (_ BitVec 32)) Unit!35965)

(assert (=> b!1098635 (= lt!491466 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1098636 () Bool)

(assert (=> b!1098636 (= e!627055 e!627057)))

(declare-fun res!733184 () Bool)

(assert (=> b!1098636 (=> res!733184 e!627057)))

(assert (=> b!1098636 (= res!733184 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!491479 () ListLongMap!15349)

(assert (=> b!1098636 (= lt!491469 lt!491479)))

(assert (=> b!1098636 (= lt!491469 (-!925 lt!491481 k0!904))))

(declare-fun lt!491470 () Unit!35965)

(assert (=> b!1098636 (= lt!491470 (addRemoveCommutativeForDiffKeys!120 lt!491468 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (=> b!1098636 (= lt!491474 (+!3402 lt!491479 lt!491471))))

(declare-fun lt!491475 () tuple2!17380)

(assert (=> b!1098636 (= lt!491479 (+!3402 lt!491478 lt!491475))))

(assert (=> b!1098636 (= lt!491472 lt!491477)))

(assert (=> b!1098636 (= lt!491477 (+!3402 lt!491481 lt!491471))))

(assert (=> b!1098636 (= lt!491481 (+!3402 lt!491468 lt!491475))))

(assert (=> b!1098636 (= lt!491474 (+!3402 (+!3402 lt!491467 lt!491475) lt!491471))))

(assert (=> b!1098636 (= lt!491471 (tuple2!17381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1098636 (= lt!491475 (tuple2!17381 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun res!733189 () Bool)

(assert (=> start!96616 (=> (not res!733189) (not e!627054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96616 (= res!733189 (validMask!0 mask!1414))))

(assert (=> start!96616 e!627054))

(assert (=> start!96616 tp!81223))

(assert (=> start!96616 true))

(assert (=> start!96616 tp_is_empty!27145))

(declare-fun array_inv!26400 (array!71112) Bool)

(assert (=> start!96616 (array_inv!26400 _keys!1070)))

(declare-fun array_inv!26401 (array!71114) Bool)

(assert (=> start!96616 (and (array_inv!26401 _values!874) e!627053)))

(declare-fun b!1098637 () Bool)

(declare-fun res!733191 () Bool)

(assert (=> b!1098637 (=> (not res!733191) (not e!627054))))

(assert (=> b!1098637 (= res!733191 (and (= (size!34763 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34762 _keys!1070) (size!34763 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1098638 () Bool)

(declare-fun res!733185 () Bool)

(assert (=> b!1098638 (=> (not res!733185) (not e!627054))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1098638 (= res!733185 (validKeyInArray!0 k0!904))))

(declare-fun b!1098639 () Bool)

(declare-fun e!627051 () Bool)

(assert (=> b!1098639 (= e!627051 tp_is_empty!27145)))

(declare-fun b!1098640 () Bool)

(declare-fun res!733190 () Bool)

(assert (=> b!1098640 (=> (not res!733190) (not e!627054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71112 (_ BitVec 32)) Bool)

(assert (=> b!1098640 (= res!733190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!42490 () Bool)

(declare-fun tp!81224 () Bool)

(assert (=> mapNonEmpty!42490 (= mapRes!42490 (and tp!81224 e!627051))))

(declare-fun mapKey!42490 () (_ BitVec 32))

(declare-fun mapValue!42490 () ValueCell!12863)

(declare-fun mapRest!42490 () (Array (_ BitVec 32) ValueCell!12863))

(assert (=> mapNonEmpty!42490 (= (arr!34225 _values!874) (store mapRest!42490 mapKey!42490 mapValue!42490))))

(declare-fun b!1098641 () Bool)

(assert (=> b!1098641 (= e!627054 e!627052)))

(declare-fun res!733183 () Bool)

(assert (=> b!1098641 (=> (not res!733183) (not e!627052))))

(assert (=> b!1098641 (= res!733183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491480 mask!1414))))

(assert (=> b!1098641 (= lt!491480 (array!71113 (store (arr!34224 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34762 _keys!1070)))))

(declare-fun b!1098642 () Bool)

(declare-fun res!733187 () Bool)

(assert (=> b!1098642 (=> (not res!733187) (not e!627052))))

(assert (=> b!1098642 (= res!733187 (arrayNoDuplicates!0 lt!491480 #b00000000000000000000000000000000 Nil!23968))))

(assert (= (and start!96616 res!733189) b!1098637))

(assert (= (and b!1098637 res!733191) b!1098640))

(assert (= (and b!1098640 res!733190) b!1098632))

(assert (= (and b!1098632 res!733192) b!1098629))

(assert (= (and b!1098629 res!733186) b!1098638))

(assert (= (and b!1098638 res!733185) b!1098630))

(assert (= (and b!1098630 res!733193) b!1098641))

(assert (= (and b!1098641 res!733183) b!1098642))

(assert (= (and b!1098642 res!733187) b!1098635))

(assert (= (and b!1098635 (not res!733188)) b!1098636))

(assert (= (and b!1098636 (not res!733184)) b!1098633))

(assert (= (and b!1098631 condMapEmpty!42490) mapIsEmpty!42490))

(assert (= (and b!1098631 (not condMapEmpty!42490)) mapNonEmpty!42490))

(get-info :version)

(assert (= (and mapNonEmpty!42490 ((_ is ValueCellFull!12863) mapValue!42490)) b!1098639))

(assert (= (and b!1098631 ((_ is ValueCellFull!12863) mapDefault!42490)) b!1098634))

(assert (= start!96616 b!1098631))

(declare-fun b_lambda!17851 () Bool)

(assert (=> (not b_lambda!17851) (not b!1098635)))

(declare-fun t!34102 () Bool)

(declare-fun tb!7953 () Bool)

(assert (=> (and start!96616 (= defaultEntry!882 defaultEntry!882) t!34102) tb!7953))

(declare-fun result!16445 () Bool)

(assert (=> tb!7953 (= result!16445 tp_is_empty!27145)))

(assert (=> b!1098635 t!34102))

(declare-fun b_and!36885 () Bool)

(assert (= b_and!36883 (and (=> t!34102 result!16445) b_and!36885)))

(declare-fun m!1017935 () Bool)

(assert (=> b!1098632 m!1017935))

(declare-fun m!1017937 () Bool)

(assert (=> b!1098641 m!1017937))

(declare-fun m!1017939 () Bool)

(assert (=> b!1098641 m!1017939))

(declare-fun m!1017941 () Bool)

(assert (=> b!1098640 m!1017941))

(declare-fun m!1017943 () Bool)

(assert (=> mapNonEmpty!42490 m!1017943))

(declare-fun m!1017945 () Bool)

(assert (=> start!96616 m!1017945))

(declare-fun m!1017947 () Bool)

(assert (=> start!96616 m!1017947))

(declare-fun m!1017949 () Bool)

(assert (=> start!96616 m!1017949))

(declare-fun m!1017951 () Bool)

(assert (=> b!1098633 m!1017951))

(declare-fun m!1017953 () Bool)

(assert (=> b!1098633 m!1017953))

(declare-fun m!1017955 () Bool)

(assert (=> b!1098633 m!1017955))

(declare-fun m!1017957 () Bool)

(assert (=> b!1098636 m!1017957))

(declare-fun m!1017959 () Bool)

(assert (=> b!1098636 m!1017959))

(declare-fun m!1017961 () Bool)

(assert (=> b!1098636 m!1017961))

(declare-fun m!1017963 () Bool)

(assert (=> b!1098636 m!1017963))

(declare-fun m!1017965 () Bool)

(assert (=> b!1098636 m!1017965))

(assert (=> b!1098636 m!1017959))

(declare-fun m!1017967 () Bool)

(assert (=> b!1098636 m!1017967))

(declare-fun m!1017969 () Bool)

(assert (=> b!1098636 m!1017969))

(declare-fun m!1017971 () Bool)

(assert (=> b!1098636 m!1017971))

(declare-fun m!1017973 () Bool)

(assert (=> b!1098642 m!1017973))

(declare-fun m!1017975 () Bool)

(assert (=> b!1098638 m!1017975))

(declare-fun m!1017977 () Bool)

(assert (=> b!1098630 m!1017977))

(declare-fun m!1017979 () Bool)

(assert (=> b!1098635 m!1017979))

(declare-fun m!1017981 () Bool)

(assert (=> b!1098635 m!1017981))

(declare-fun m!1017983 () Bool)

(assert (=> b!1098635 m!1017983))

(declare-fun m!1017985 () Bool)

(assert (=> b!1098635 m!1017985))

(declare-fun m!1017987 () Bool)

(assert (=> b!1098635 m!1017987))

(declare-fun m!1017989 () Bool)

(assert (=> b!1098635 m!1017989))

(declare-fun m!1017991 () Bool)

(assert (=> b!1098635 m!1017991))

(declare-fun m!1017993 () Bool)

(assert (=> b!1098635 m!1017993))

(declare-fun m!1017995 () Bool)

(assert (=> b!1098635 m!1017995))

(declare-fun m!1017997 () Bool)

(assert (=> b!1098635 m!1017997))

(check-sat (not mapNonEmpty!42490) tp_is_empty!27145 (not start!96616) (not b_lambda!17851) b_and!36885 (not b!1098641) (not b!1098633) (not b!1098642) (not b!1098635) (not b_next!23095) (not b!1098632) (not b!1098638) (not b!1098636) (not b!1098640))
(check-sat b_and!36885 (not b_next!23095))
