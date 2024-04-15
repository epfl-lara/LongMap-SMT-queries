; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96256 () Bool)

(assert start!96256)

(declare-fun b_free!22915 () Bool)

(declare-fun b_next!22915 () Bool)

(assert (=> start!96256 (= b_free!22915 (not b_next!22915))))

(declare-fun tp!80593 () Bool)

(declare-fun b_and!36479 () Bool)

(assert (=> start!96256 (= tp!80593 b_and!36479)))

(declare-fun b!1093506 () Bool)

(declare-fun e!624359 () Bool)

(declare-fun tp_is_empty!26917 () Bool)

(assert (=> b!1093506 (= e!624359 tp_is_empty!26917)))

(declare-fun b!1093507 () Bool)

(declare-fun e!624356 () Bool)

(assert (=> b!1093507 (= e!624356 tp_is_empty!26917)))

(declare-fun b!1093509 () Bool)

(declare-fun res!729747 () Bool)

(declare-fun e!624357 () Bool)

(assert (=> b!1093509 (=> (not res!729747) (not e!624357))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70664 0))(
  ( (array!70665 (arr!34006 (Array (_ BitVec 32) (_ BitVec 64))) (size!34544 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70664)

(assert (=> b!1093509 (= res!729747 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34544 _keys!1070))))))

(declare-fun b!1093510 () Bool)

(declare-fun res!729745 () Bool)

(assert (=> b!1093510 (=> (not res!729745) (not e!624357))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!41017 0))(
  ( (V!41018 (val!13515 Int)) )
))
(declare-datatypes ((ValueCell!12749 0))(
  ( (ValueCellFull!12749 (v!16135 V!41017)) (EmptyCell!12749) )
))
(declare-datatypes ((array!70666 0))(
  ( (array!70667 (arr!34007 (Array (_ BitVec 32) ValueCell!12749)) (size!34545 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70666)

(assert (=> b!1093510 (= res!729745 (and (= (size!34545 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34544 _keys!1070) (size!34545 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093511 () Bool)

(declare-fun res!729749 () Bool)

(assert (=> b!1093511 (=> (not res!729749) (not e!624357))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1093511 (= res!729749 (= (select (arr!34006 _keys!1070) i!650) k0!904))))

(declare-fun b!1093512 () Bool)

(declare-fun res!729743 () Bool)

(assert (=> b!1093512 (=> (not res!729743) (not e!624357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70664 (_ BitVec 32)) Bool)

(assert (=> b!1093512 (= res!729743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1093513 () Bool)

(declare-fun res!729744 () Bool)

(declare-fun e!624358 () Bool)

(assert (=> b!1093513 (=> (not res!729744) (not e!624358))))

(declare-fun lt!488960 () array!70664)

(declare-datatypes ((List!23821 0))(
  ( (Nil!23818) (Cons!23817 (h!25026 (_ BitVec 64)) (t!33785 List!23821)) )
))
(declare-fun arrayNoDuplicates!0 (array!70664 (_ BitVec 32) List!23821) Bool)

(assert (=> b!1093513 (= res!729744 (arrayNoDuplicates!0 lt!488960 #b00000000000000000000000000000000 Nil!23818))))

(declare-fun b!1093514 () Bool)

(declare-fun res!729742 () Bool)

(assert (=> b!1093514 (=> (not res!729742) (not e!624357))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093514 (= res!729742 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!42130 () Bool)

(declare-fun mapRes!42130 () Bool)

(declare-fun tp!80594 () Bool)

(assert (=> mapNonEmpty!42130 (= mapRes!42130 (and tp!80594 e!624356))))

(declare-fun mapKey!42130 () (_ BitVec 32))

(declare-fun mapRest!42130 () (Array (_ BitVec 32) ValueCell!12749))

(declare-fun mapValue!42130 () ValueCell!12749)

(assert (=> mapNonEmpty!42130 (= (arr!34007 _values!874) (store mapRest!42130 mapKey!42130 mapValue!42130))))

(declare-fun mapIsEmpty!42130 () Bool)

(assert (=> mapIsEmpty!42130 mapRes!42130))

(declare-fun b!1093515 () Bool)

(assert (=> b!1093515 (= e!624357 e!624358)))

(declare-fun res!729748 () Bool)

(assert (=> b!1093515 (=> (not res!729748) (not e!624358))))

(assert (=> b!1093515 (= res!729748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488960 mask!1414))))

(assert (=> b!1093515 (= lt!488960 (array!70665 (store (arr!34006 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34544 _keys!1070)))))

(declare-fun b!1093508 () Bool)

(declare-fun e!624354 () Bool)

(assert (=> b!1093508 (= e!624354 (and e!624359 mapRes!42130))))

(declare-fun condMapEmpty!42130 () Bool)

(declare-fun mapDefault!42130 () ValueCell!12749)

(assert (=> b!1093508 (= condMapEmpty!42130 (= (arr!34007 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12749)) mapDefault!42130)))))

(declare-fun res!729750 () Bool)

(assert (=> start!96256 (=> (not res!729750) (not e!624357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96256 (= res!729750 (validMask!0 mask!1414))))

(assert (=> start!96256 e!624357))

(assert (=> start!96256 tp!80593))

(assert (=> start!96256 true))

(assert (=> start!96256 tp_is_empty!26917))

(declare-fun array_inv!26252 (array!70664) Bool)

(assert (=> start!96256 (array_inv!26252 _keys!1070)))

(declare-fun array_inv!26253 (array!70666) Bool)

(assert (=> start!96256 (and (array_inv!26253 _values!874) e!624354)))

(declare-fun b!1093516 () Bool)

(assert (=> b!1093516 (= e!624358 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41017)

(declare-datatypes ((tuple2!17254 0))(
  ( (tuple2!17255 (_1!8638 (_ BitVec 64)) (_2!8638 V!41017)) )
))
(declare-datatypes ((List!23822 0))(
  ( (Nil!23819) (Cons!23818 (h!25027 tuple2!17254) (t!33786 List!23822)) )
))
(declare-datatypes ((ListLongMap!15223 0))(
  ( (ListLongMap!15224 (toList!7627 List!23822)) )
))
(declare-fun lt!488952 () ListLongMap!15223)

(declare-fun zeroValue!831 () V!41017)

(declare-fun getCurrentListMap!4290 (array!70664 array!70666 (_ BitVec 32) (_ BitVec 32) V!41017 V!41017 (_ BitVec 32) Int) ListLongMap!15223)

(assert (=> b!1093516 (= lt!488952 (getCurrentListMap!4290 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488957 () array!70666)

(declare-fun lt!488956 () ListLongMap!15223)

(assert (=> b!1093516 (= lt!488956 (getCurrentListMap!4290 lt!488960 lt!488957 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488958 () ListLongMap!15223)

(declare-fun lt!488959 () ListLongMap!15223)

(assert (=> b!1093516 (and (= lt!488958 lt!488959) (= lt!488959 lt!488958))))

(declare-fun lt!488953 () ListLongMap!15223)

(declare-fun -!899 (ListLongMap!15223 (_ BitVec 64)) ListLongMap!15223)

(assert (=> b!1093516 (= lt!488959 (-!899 lt!488953 k0!904))))

(declare-datatypes ((Unit!35833 0))(
  ( (Unit!35834) )
))
(declare-fun lt!488954 () Unit!35833)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!174 (array!70664 array!70666 (_ BitVec 32) (_ BitVec 32) V!41017 V!41017 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35833)

(assert (=> b!1093516 (= lt!488954 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!174 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4160 (array!70664 array!70666 (_ BitVec 32) (_ BitVec 32) V!41017 V!41017 (_ BitVec 32) Int) ListLongMap!15223)

(assert (=> b!1093516 (= lt!488958 (getCurrentListMapNoExtraKeys!4160 lt!488960 lt!488957 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2231 (Int (_ BitVec 64)) V!41017)

(assert (=> b!1093516 (= lt!488957 (array!70667 (store (arr!34007 _values!874) i!650 (ValueCellFull!12749 (dynLambda!2231 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34545 _values!874)))))

(assert (=> b!1093516 (= lt!488953 (getCurrentListMapNoExtraKeys!4160 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70664 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093516 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488955 () Unit!35833)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70664 (_ BitVec 64) (_ BitVec 32)) Unit!35833)

(assert (=> b!1093516 (= lt!488955 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1093517 () Bool)

(declare-fun res!729746 () Bool)

(assert (=> b!1093517 (=> (not res!729746) (not e!624357))))

(assert (=> b!1093517 (= res!729746 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23818))))

(assert (= (and start!96256 res!729750) b!1093510))

(assert (= (and b!1093510 res!729745) b!1093512))

(assert (= (and b!1093512 res!729743) b!1093517))

(assert (= (and b!1093517 res!729746) b!1093509))

(assert (= (and b!1093509 res!729747) b!1093514))

(assert (= (and b!1093514 res!729742) b!1093511))

(assert (= (and b!1093511 res!729749) b!1093515))

(assert (= (and b!1093515 res!729748) b!1093513))

(assert (= (and b!1093513 res!729744) b!1093516))

(assert (= (and b!1093508 condMapEmpty!42130) mapIsEmpty!42130))

(assert (= (and b!1093508 (not condMapEmpty!42130)) mapNonEmpty!42130))

(get-info :version)

(assert (= (and mapNonEmpty!42130 ((_ is ValueCellFull!12749) mapValue!42130)) b!1093507))

(assert (= (and b!1093508 ((_ is ValueCellFull!12749) mapDefault!42130)) b!1093506))

(assert (= start!96256 b!1093508))

(declare-fun b_lambda!17563 () Bool)

(assert (=> (not b_lambda!17563) (not b!1093516)))

(declare-fun t!33784 () Bool)

(declare-fun tb!7785 () Bool)

(assert (=> (and start!96256 (= defaultEntry!882 defaultEntry!882) t!33784) tb!7785))

(declare-fun result!16097 () Bool)

(assert (=> tb!7785 (= result!16097 tp_is_empty!26917)))

(assert (=> b!1093516 t!33784))

(declare-fun b_and!36481 () Bool)

(assert (= b_and!36479 (and (=> t!33784 result!16097) b_and!36481)))

(declare-fun m!1012925 () Bool)

(assert (=> b!1093516 m!1012925))

(declare-fun m!1012927 () Bool)

(assert (=> b!1093516 m!1012927))

(declare-fun m!1012929 () Bool)

(assert (=> b!1093516 m!1012929))

(declare-fun m!1012931 () Bool)

(assert (=> b!1093516 m!1012931))

(declare-fun m!1012933 () Bool)

(assert (=> b!1093516 m!1012933))

(declare-fun m!1012935 () Bool)

(assert (=> b!1093516 m!1012935))

(declare-fun m!1012937 () Bool)

(assert (=> b!1093516 m!1012937))

(declare-fun m!1012939 () Bool)

(assert (=> b!1093516 m!1012939))

(declare-fun m!1012941 () Bool)

(assert (=> b!1093516 m!1012941))

(declare-fun m!1012943 () Bool)

(assert (=> b!1093516 m!1012943))

(declare-fun m!1012945 () Bool)

(assert (=> b!1093513 m!1012945))

(declare-fun m!1012947 () Bool)

(assert (=> b!1093512 m!1012947))

(declare-fun m!1012949 () Bool)

(assert (=> b!1093515 m!1012949))

(declare-fun m!1012951 () Bool)

(assert (=> b!1093515 m!1012951))

(declare-fun m!1012953 () Bool)

(assert (=> b!1093514 m!1012953))

(declare-fun m!1012955 () Bool)

(assert (=> b!1093517 m!1012955))

(declare-fun m!1012957 () Bool)

(assert (=> start!96256 m!1012957))

(declare-fun m!1012959 () Bool)

(assert (=> start!96256 m!1012959))

(declare-fun m!1012961 () Bool)

(assert (=> start!96256 m!1012961))

(declare-fun m!1012963 () Bool)

(assert (=> mapNonEmpty!42130 m!1012963))

(declare-fun m!1012965 () Bool)

(assert (=> b!1093511 m!1012965))

(check-sat (not b!1093514) (not b!1093516) (not b!1093513) (not mapNonEmpty!42130) (not b!1093517) tp_is_empty!26917 (not b!1093512) b_and!36481 (not b!1093515) (not b_next!22915) (not start!96256) (not b_lambda!17563))
(check-sat b_and!36481 (not b_next!22915))
