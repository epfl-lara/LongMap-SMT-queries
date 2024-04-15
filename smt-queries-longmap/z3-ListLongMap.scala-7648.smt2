; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96202 () Bool)

(assert start!96202)

(declare-fun b_free!22861 () Bool)

(declare-fun b_next!22861 () Bool)

(assert (=> start!96202 (= b_free!22861 (not b_next!22861))))

(declare-fun tp!80431 () Bool)

(declare-fun b_and!36371 () Bool)

(assert (=> start!96202 (= tp!80431 b_and!36371)))

(declare-fun b!1092480 () Bool)

(declare-fun res!729019 () Bool)

(declare-fun e!623871 () Bool)

(assert (=> b!1092480 (=> (not res!729019) (not e!623871))))

(declare-datatypes ((array!70560 0))(
  ( (array!70561 (arr!33954 (Array (_ BitVec 32) (_ BitVec 64))) (size!34492 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70560)

(declare-datatypes ((List!23781 0))(
  ( (Nil!23778) (Cons!23777 (h!24986 (_ BitVec 64)) (t!33691 List!23781)) )
))
(declare-fun arrayNoDuplicates!0 (array!70560 (_ BitVec 32) List!23781) Bool)

(assert (=> b!1092480 (= res!729019 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23778))))

(declare-fun res!729020 () Bool)

(assert (=> start!96202 (=> (not res!729020) (not e!623871))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96202 (= res!729020 (validMask!0 mask!1414))))

(assert (=> start!96202 e!623871))

(assert (=> start!96202 tp!80431))

(assert (=> start!96202 true))

(declare-fun tp_is_empty!26863 () Bool)

(assert (=> start!96202 tp_is_empty!26863))

(declare-fun array_inv!26212 (array!70560) Bool)

(assert (=> start!96202 (array_inv!26212 _keys!1070)))

(declare-datatypes ((V!40945 0))(
  ( (V!40946 (val!13488 Int)) )
))
(declare-datatypes ((ValueCell!12722 0))(
  ( (ValueCellFull!12722 (v!16108 V!40945)) (EmptyCell!12722) )
))
(declare-datatypes ((array!70562 0))(
  ( (array!70563 (arr!33955 (Array (_ BitVec 32) ValueCell!12722)) (size!34493 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70562)

(declare-fun e!623873 () Bool)

(declare-fun array_inv!26213 (array!70562) Bool)

(assert (=> start!96202 (and (array_inv!26213 _values!874) e!623873)))

(declare-fun b!1092481 () Bool)

(declare-fun res!729014 () Bool)

(assert (=> b!1092481 (=> (not res!729014) (not e!623871))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1092481 (= res!729014 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34492 _keys!1070))))))

(declare-fun b!1092482 () Bool)

(declare-fun res!729017 () Bool)

(declare-fun e!623869 () Bool)

(assert (=> b!1092482 (=> (not res!729017) (not e!623869))))

(declare-fun lt!488221 () array!70560)

(assert (=> b!1092482 (= res!729017 (arrayNoDuplicates!0 lt!488221 #b00000000000000000000000000000000 Nil!23778))))

(declare-fun b!1092483 () Bool)

(assert (=> b!1092483 (= e!623869 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40945)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40945)

(declare-datatypes ((tuple2!17218 0))(
  ( (tuple2!17219 (_1!8620 (_ BitVec 64)) (_2!8620 V!40945)) )
))
(declare-datatypes ((List!23782 0))(
  ( (Nil!23779) (Cons!23778 (h!24987 tuple2!17218) (t!33692 List!23782)) )
))
(declare-datatypes ((ListLongMap!15187 0))(
  ( (ListLongMap!15188 (toList!7609 List!23782)) )
))
(declare-fun lt!488219 () ListLongMap!15187)

(declare-fun getCurrentListMap!4272 (array!70560 array!70562 (_ BitVec 32) (_ BitVec 32) V!40945 V!40945 (_ BitVec 32) Int) ListLongMap!15187)

(assert (=> b!1092483 (= lt!488219 (getCurrentListMap!4272 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488222 () ListLongMap!15187)

(declare-fun lt!488215 () array!70562)

(assert (=> b!1092483 (= lt!488222 (getCurrentListMap!4272 lt!488221 lt!488215 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488220 () ListLongMap!15187)

(declare-fun lt!488218 () ListLongMap!15187)

(assert (=> b!1092483 (and (= lt!488220 lt!488218) (= lt!488218 lt!488220))))

(declare-fun lt!488217 () ListLongMap!15187)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!881 (ListLongMap!15187 (_ BitVec 64)) ListLongMap!15187)

(assert (=> b!1092483 (= lt!488218 (-!881 lt!488217 k0!904))))

(declare-datatypes ((Unit!35797 0))(
  ( (Unit!35798) )
))
(declare-fun lt!488214 () Unit!35797)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!156 (array!70560 array!70562 (_ BitVec 32) (_ BitVec 32) V!40945 V!40945 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35797)

(assert (=> b!1092483 (= lt!488214 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!156 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4142 (array!70560 array!70562 (_ BitVec 32) (_ BitVec 32) V!40945 V!40945 (_ BitVec 32) Int) ListLongMap!15187)

(assert (=> b!1092483 (= lt!488220 (getCurrentListMapNoExtraKeys!4142 lt!488221 lt!488215 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2213 (Int (_ BitVec 64)) V!40945)

(assert (=> b!1092483 (= lt!488215 (array!70563 (store (arr!33955 _values!874) i!650 (ValueCellFull!12722 (dynLambda!2213 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34493 _values!874)))))

(assert (=> b!1092483 (= lt!488217 (getCurrentListMapNoExtraKeys!4142 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092483 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488216 () Unit!35797)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70560 (_ BitVec 64) (_ BitVec 32)) Unit!35797)

(assert (=> b!1092483 (= lt!488216 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1092484 () Bool)

(declare-fun res!729015 () Bool)

(assert (=> b!1092484 (=> (not res!729015) (not e!623871))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092484 (= res!729015 (validKeyInArray!0 k0!904))))

(declare-fun b!1092485 () Bool)

(declare-fun res!729021 () Bool)

(assert (=> b!1092485 (=> (not res!729021) (not e!623871))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70560 (_ BitVec 32)) Bool)

(assert (=> b!1092485 (= res!729021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!42049 () Bool)

(declare-fun mapRes!42049 () Bool)

(declare-fun tp!80432 () Bool)

(declare-fun e!623872 () Bool)

(assert (=> mapNonEmpty!42049 (= mapRes!42049 (and tp!80432 e!623872))))

(declare-fun mapRest!42049 () (Array (_ BitVec 32) ValueCell!12722))

(declare-fun mapValue!42049 () ValueCell!12722)

(declare-fun mapKey!42049 () (_ BitVec 32))

(assert (=> mapNonEmpty!42049 (= (arr!33955 _values!874) (store mapRest!42049 mapKey!42049 mapValue!42049))))

(declare-fun b!1092486 () Bool)

(assert (=> b!1092486 (= e!623871 e!623869)))

(declare-fun res!729018 () Bool)

(assert (=> b!1092486 (=> (not res!729018) (not e!623869))))

(assert (=> b!1092486 (= res!729018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488221 mask!1414))))

(assert (=> b!1092486 (= lt!488221 (array!70561 (store (arr!33954 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34492 _keys!1070)))))

(declare-fun b!1092487 () Bool)

(declare-fun res!729016 () Bool)

(assert (=> b!1092487 (=> (not res!729016) (not e!623871))))

(assert (=> b!1092487 (= res!729016 (= (select (arr!33954 _keys!1070) i!650) k0!904))))

(declare-fun b!1092488 () Bool)

(declare-fun e!623868 () Bool)

(assert (=> b!1092488 (= e!623873 (and e!623868 mapRes!42049))))

(declare-fun condMapEmpty!42049 () Bool)

(declare-fun mapDefault!42049 () ValueCell!12722)

(assert (=> b!1092488 (= condMapEmpty!42049 (= (arr!33955 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12722)) mapDefault!42049)))))

(declare-fun mapIsEmpty!42049 () Bool)

(assert (=> mapIsEmpty!42049 mapRes!42049))

(declare-fun b!1092489 () Bool)

(declare-fun res!729013 () Bool)

(assert (=> b!1092489 (=> (not res!729013) (not e!623871))))

(assert (=> b!1092489 (= res!729013 (and (= (size!34493 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34492 _keys!1070) (size!34493 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092490 () Bool)

(assert (=> b!1092490 (= e!623868 tp_is_empty!26863)))

(declare-fun b!1092491 () Bool)

(assert (=> b!1092491 (= e!623872 tp_is_empty!26863)))

(assert (= (and start!96202 res!729020) b!1092489))

(assert (= (and b!1092489 res!729013) b!1092485))

(assert (= (and b!1092485 res!729021) b!1092480))

(assert (= (and b!1092480 res!729019) b!1092481))

(assert (= (and b!1092481 res!729014) b!1092484))

(assert (= (and b!1092484 res!729015) b!1092487))

(assert (= (and b!1092487 res!729016) b!1092486))

(assert (= (and b!1092486 res!729018) b!1092482))

(assert (= (and b!1092482 res!729017) b!1092483))

(assert (= (and b!1092488 condMapEmpty!42049) mapIsEmpty!42049))

(assert (= (and b!1092488 (not condMapEmpty!42049)) mapNonEmpty!42049))

(get-info :version)

(assert (= (and mapNonEmpty!42049 ((_ is ValueCellFull!12722) mapValue!42049)) b!1092491))

(assert (= (and b!1092488 ((_ is ValueCellFull!12722) mapDefault!42049)) b!1092490))

(assert (= start!96202 b!1092488))

(declare-fun b_lambda!17509 () Bool)

(assert (=> (not b_lambda!17509) (not b!1092483)))

(declare-fun t!33690 () Bool)

(declare-fun tb!7731 () Bool)

(assert (=> (and start!96202 (= defaultEntry!882 defaultEntry!882) t!33690) tb!7731))

(declare-fun result!15989 () Bool)

(assert (=> tb!7731 (= result!15989 tp_is_empty!26863)))

(assert (=> b!1092483 t!33690))

(declare-fun b_and!36373 () Bool)

(assert (= b_and!36371 (and (=> t!33690 result!15989) b_and!36373)))

(declare-fun m!1011791 () Bool)

(assert (=> b!1092485 m!1011791))

(declare-fun m!1011793 () Bool)

(assert (=> b!1092484 m!1011793))

(declare-fun m!1011795 () Bool)

(assert (=> b!1092487 m!1011795))

(declare-fun m!1011797 () Bool)

(assert (=> start!96202 m!1011797))

(declare-fun m!1011799 () Bool)

(assert (=> start!96202 m!1011799))

(declare-fun m!1011801 () Bool)

(assert (=> start!96202 m!1011801))

(declare-fun m!1011803 () Bool)

(assert (=> b!1092483 m!1011803))

(declare-fun m!1011805 () Bool)

(assert (=> b!1092483 m!1011805))

(declare-fun m!1011807 () Bool)

(assert (=> b!1092483 m!1011807))

(declare-fun m!1011809 () Bool)

(assert (=> b!1092483 m!1011809))

(declare-fun m!1011811 () Bool)

(assert (=> b!1092483 m!1011811))

(declare-fun m!1011813 () Bool)

(assert (=> b!1092483 m!1011813))

(declare-fun m!1011815 () Bool)

(assert (=> b!1092483 m!1011815))

(declare-fun m!1011817 () Bool)

(assert (=> b!1092483 m!1011817))

(declare-fun m!1011819 () Bool)

(assert (=> b!1092483 m!1011819))

(declare-fun m!1011821 () Bool)

(assert (=> b!1092483 m!1011821))

(declare-fun m!1011823 () Bool)

(assert (=> b!1092480 m!1011823))

(declare-fun m!1011825 () Bool)

(assert (=> b!1092486 m!1011825))

(declare-fun m!1011827 () Bool)

(assert (=> b!1092486 m!1011827))

(declare-fun m!1011829 () Bool)

(assert (=> mapNonEmpty!42049 m!1011829))

(declare-fun m!1011831 () Bool)

(assert (=> b!1092482 m!1011831))

(check-sat (not b_lambda!17509) (not b!1092482) (not b_next!22861) (not b!1092484) (not mapNonEmpty!42049) b_and!36373 (not b!1092486) (not b!1092480) (not b!1092483) tp_is_empty!26863 (not b!1092485) (not start!96202))
(check-sat b_and!36373 (not b_next!22861))
