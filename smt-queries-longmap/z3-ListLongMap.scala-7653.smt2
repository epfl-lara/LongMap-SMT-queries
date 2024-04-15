; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96232 () Bool)

(assert start!96232)

(declare-fun b_free!22891 () Bool)

(declare-fun b_next!22891 () Bool)

(assert (=> start!96232 (= b_free!22891 (not b_next!22891))))

(declare-fun tp!80522 () Bool)

(declare-fun b_and!36431 () Bool)

(assert (=> start!96232 (= tp!80522 b_and!36431)))

(declare-fun b!1093050 () Bool)

(declare-fun res!729418 () Bool)

(declare-fun e!624139 () Bool)

(assert (=> b!1093050 (=> (not res!729418) (not e!624139))))

(declare-datatypes ((array!70618 0))(
  ( (array!70619 (arr!33983 (Array (_ BitVec 32) (_ BitVec 64))) (size!34521 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70618)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70618 (_ BitVec 32)) Bool)

(assert (=> b!1093050 (= res!729418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun e!624140 () Bool)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40985 0))(
  ( (V!40986 (val!13503 Int)) )
))
(declare-datatypes ((tuple2!17238 0))(
  ( (tuple2!17239 (_1!8630 (_ BitVec 64)) (_2!8630 V!40985)) )
))
(declare-datatypes ((List!23804 0))(
  ( (Nil!23801) (Cons!23800 (h!25009 tuple2!17238) (t!33744 List!23804)) )
))
(declare-datatypes ((ListLongMap!15207 0))(
  ( (ListLongMap!15208 (toList!7619 List!23804)) )
))
(declare-fun lt!488624 () ListLongMap!15207)

(declare-fun lt!488628 () Bool)

(declare-fun lt!488629 () ListLongMap!15207)

(declare-fun b!1093051 () Bool)

(assert (=> b!1093051 (= e!624140 (not (or (and (not lt!488628) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!488628) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!488628) (not (= lt!488629 lt!488624)) (bvsle #b00000000000000000000000000000000 (size!34521 _keys!1070)))))))

(assert (=> b!1093051 (= lt!488628 (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40985)

(declare-fun lt!488626 () ListLongMap!15207)

(declare-fun zeroValue!831 () V!40985)

(declare-datatypes ((ValueCell!12737 0))(
  ( (ValueCellFull!12737 (v!16123 V!40985)) (EmptyCell!12737) )
))
(declare-datatypes ((array!70620 0))(
  ( (array!70621 (arr!33984 (Array (_ BitVec 32) ValueCell!12737)) (size!34522 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70620)

(declare-fun getCurrentListMap!4282 (array!70618 array!70620 (_ BitVec 32) (_ BitVec 32) V!40985 V!40985 (_ BitVec 32) Int) ListLongMap!15207)

(assert (=> b!1093051 (= lt!488626 (getCurrentListMap!4282 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488623 () array!70618)

(declare-fun lt!488625 () array!70620)

(assert (=> b!1093051 (= lt!488629 (getCurrentListMap!4282 lt!488623 lt!488625 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488627 () ListLongMap!15207)

(assert (=> b!1093051 (and (= lt!488624 lt!488627) (= lt!488627 lt!488624))))

(declare-fun lt!488621 () ListLongMap!15207)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!891 (ListLongMap!15207 (_ BitVec 64)) ListLongMap!15207)

(assert (=> b!1093051 (= lt!488627 (-!891 lt!488621 k0!904))))

(declare-datatypes ((Unit!35817 0))(
  ( (Unit!35818) )
))
(declare-fun lt!488630 () Unit!35817)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!166 (array!70618 array!70620 (_ BitVec 32) (_ BitVec 32) V!40985 V!40985 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35817)

(assert (=> b!1093051 (= lt!488630 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!166 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4152 (array!70618 array!70620 (_ BitVec 32) (_ BitVec 32) V!40985 V!40985 (_ BitVec 32) Int) ListLongMap!15207)

(assert (=> b!1093051 (= lt!488624 (getCurrentListMapNoExtraKeys!4152 lt!488623 lt!488625 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2223 (Int (_ BitVec 64)) V!40985)

(assert (=> b!1093051 (= lt!488625 (array!70621 (store (arr!33984 _values!874) i!650 (ValueCellFull!12737 (dynLambda!2223 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34522 _values!874)))))

(assert (=> b!1093051 (= lt!488621 (getCurrentListMapNoExtraKeys!4152 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70618 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093051 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488622 () Unit!35817)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70618 (_ BitVec 64) (_ BitVec 32)) Unit!35817)

(assert (=> b!1093051 (= lt!488622 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!729423 () Bool)

(assert (=> start!96232 (=> (not res!729423) (not e!624139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96232 (= res!729423 (validMask!0 mask!1414))))

(assert (=> start!96232 e!624139))

(assert (=> start!96232 tp!80522))

(assert (=> start!96232 true))

(declare-fun tp_is_empty!26893 () Bool)

(assert (=> start!96232 tp_is_empty!26893))

(declare-fun array_inv!26234 (array!70618) Bool)

(assert (=> start!96232 (array_inv!26234 _keys!1070)))

(declare-fun e!624143 () Bool)

(declare-fun array_inv!26235 (array!70620) Bool)

(assert (=> start!96232 (and (array_inv!26235 _values!874) e!624143)))

(declare-fun b!1093052 () Bool)

(declare-fun res!729425 () Bool)

(assert (=> b!1093052 (=> (not res!729425) (not e!624139))))

(declare-datatypes ((List!23805 0))(
  ( (Nil!23802) (Cons!23801 (h!25010 (_ BitVec 64)) (t!33745 List!23805)) )
))
(declare-fun arrayNoDuplicates!0 (array!70618 (_ BitVec 32) List!23805) Bool)

(assert (=> b!1093052 (= res!729425 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23802))))

(declare-fun b!1093053 () Bool)

(declare-fun res!729419 () Bool)

(assert (=> b!1093053 (=> (not res!729419) (not e!624139))))

(assert (=> b!1093053 (= res!729419 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34521 _keys!1070))))))

(declare-fun b!1093054 () Bool)

(assert (=> b!1093054 (= e!624139 e!624140)))

(declare-fun res!729422 () Bool)

(assert (=> b!1093054 (=> (not res!729422) (not e!624140))))

(assert (=> b!1093054 (= res!729422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488623 mask!1414))))

(assert (=> b!1093054 (= lt!488623 (array!70619 (store (arr!33983 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34521 _keys!1070)))))

(declare-fun b!1093055 () Bool)

(declare-fun e!624138 () Bool)

(assert (=> b!1093055 (= e!624138 tp_is_empty!26893)))

(declare-fun b!1093056 () Bool)

(declare-fun res!729426 () Bool)

(assert (=> b!1093056 (=> (not res!729426) (not e!624140))))

(assert (=> b!1093056 (= res!729426 (arrayNoDuplicates!0 lt!488623 #b00000000000000000000000000000000 Nil!23802))))

(declare-fun mapIsEmpty!42094 () Bool)

(declare-fun mapRes!42094 () Bool)

(assert (=> mapIsEmpty!42094 mapRes!42094))

(declare-fun b!1093057 () Bool)

(declare-fun res!729424 () Bool)

(assert (=> b!1093057 (=> (not res!729424) (not e!624139))))

(assert (=> b!1093057 (= res!729424 (= (select (arr!33983 _keys!1070) i!650) k0!904))))

(declare-fun b!1093058 () Bool)

(declare-fun res!729420 () Bool)

(assert (=> b!1093058 (=> (not res!729420) (not e!624139))))

(assert (=> b!1093058 (= res!729420 (and (= (size!34522 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34521 _keys!1070) (size!34522 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093059 () Bool)

(declare-fun e!624142 () Bool)

(assert (=> b!1093059 (= e!624142 tp_is_empty!26893)))

(declare-fun mapNonEmpty!42094 () Bool)

(declare-fun tp!80521 () Bool)

(assert (=> mapNonEmpty!42094 (= mapRes!42094 (and tp!80521 e!624138))))

(declare-fun mapKey!42094 () (_ BitVec 32))

(declare-fun mapValue!42094 () ValueCell!12737)

(declare-fun mapRest!42094 () (Array (_ BitVec 32) ValueCell!12737))

(assert (=> mapNonEmpty!42094 (= (arr!33984 _values!874) (store mapRest!42094 mapKey!42094 mapValue!42094))))

(declare-fun b!1093060 () Bool)

(declare-fun res!729421 () Bool)

(assert (=> b!1093060 (=> (not res!729421) (not e!624139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093060 (= res!729421 (validKeyInArray!0 k0!904))))

(declare-fun b!1093061 () Bool)

(assert (=> b!1093061 (= e!624143 (and e!624142 mapRes!42094))))

(declare-fun condMapEmpty!42094 () Bool)

(declare-fun mapDefault!42094 () ValueCell!12737)

(assert (=> b!1093061 (= condMapEmpty!42094 (= (arr!33984 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12737)) mapDefault!42094)))))

(assert (= (and start!96232 res!729423) b!1093058))

(assert (= (and b!1093058 res!729420) b!1093050))

(assert (= (and b!1093050 res!729418) b!1093052))

(assert (= (and b!1093052 res!729425) b!1093053))

(assert (= (and b!1093053 res!729419) b!1093060))

(assert (= (and b!1093060 res!729421) b!1093057))

(assert (= (and b!1093057 res!729424) b!1093054))

(assert (= (and b!1093054 res!729422) b!1093056))

(assert (= (and b!1093056 res!729426) b!1093051))

(assert (= (and b!1093061 condMapEmpty!42094) mapIsEmpty!42094))

(assert (= (and b!1093061 (not condMapEmpty!42094)) mapNonEmpty!42094))

(get-info :version)

(assert (= (and mapNonEmpty!42094 ((_ is ValueCellFull!12737) mapValue!42094)) b!1093055))

(assert (= (and b!1093061 ((_ is ValueCellFull!12737) mapDefault!42094)) b!1093059))

(assert (= start!96232 b!1093061))

(declare-fun b_lambda!17539 () Bool)

(assert (=> (not b_lambda!17539) (not b!1093051)))

(declare-fun t!33743 () Bool)

(declare-fun tb!7761 () Bool)

(assert (=> (and start!96232 (= defaultEntry!882 defaultEntry!882) t!33743) tb!7761))

(declare-fun result!16049 () Bool)

(assert (=> tb!7761 (= result!16049 tp_is_empty!26893)))

(assert (=> b!1093051 t!33743))

(declare-fun b_and!36433 () Bool)

(assert (= b_and!36431 (and (=> t!33743 result!16049) b_and!36433)))

(declare-fun m!1012421 () Bool)

(assert (=> b!1093054 m!1012421))

(declare-fun m!1012423 () Bool)

(assert (=> b!1093054 m!1012423))

(declare-fun m!1012425 () Bool)

(assert (=> b!1093051 m!1012425))

(declare-fun m!1012427 () Bool)

(assert (=> b!1093051 m!1012427))

(declare-fun m!1012429 () Bool)

(assert (=> b!1093051 m!1012429))

(declare-fun m!1012431 () Bool)

(assert (=> b!1093051 m!1012431))

(declare-fun m!1012433 () Bool)

(assert (=> b!1093051 m!1012433))

(declare-fun m!1012435 () Bool)

(assert (=> b!1093051 m!1012435))

(declare-fun m!1012437 () Bool)

(assert (=> b!1093051 m!1012437))

(declare-fun m!1012439 () Bool)

(assert (=> b!1093051 m!1012439))

(declare-fun m!1012441 () Bool)

(assert (=> b!1093051 m!1012441))

(declare-fun m!1012443 () Bool)

(assert (=> b!1093051 m!1012443))

(declare-fun m!1012445 () Bool)

(assert (=> b!1093050 m!1012445))

(declare-fun m!1012447 () Bool)

(assert (=> b!1093057 m!1012447))

(declare-fun m!1012449 () Bool)

(assert (=> start!96232 m!1012449))

(declare-fun m!1012451 () Bool)

(assert (=> start!96232 m!1012451))

(declare-fun m!1012453 () Bool)

(assert (=> start!96232 m!1012453))

(declare-fun m!1012455 () Bool)

(assert (=> mapNonEmpty!42094 m!1012455))

(declare-fun m!1012457 () Bool)

(assert (=> b!1093060 m!1012457))

(declare-fun m!1012459 () Bool)

(assert (=> b!1093056 m!1012459))

(declare-fun m!1012461 () Bool)

(assert (=> b!1093052 m!1012461))

(check-sat (not b!1093052) (not b_lambda!17539) tp_is_empty!26893 (not mapNonEmpty!42094) (not b!1093051) (not b!1093054) (not start!96232) b_and!36433 (not b!1093050) (not b!1093056) (not b_next!22891) (not b!1093060))
(check-sat b_and!36433 (not b_next!22891))
