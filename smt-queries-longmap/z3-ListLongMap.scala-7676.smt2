; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96404 () Bool)

(assert start!96404)

(declare-fun b_free!22983 () Bool)

(declare-fun b_next!22983 () Bool)

(assert (=> start!96404 (= b_free!22983 (not b_next!22983))))

(declare-fun tp!80875 () Bool)

(declare-fun b_and!36629 () Bool)

(assert (=> start!96404 (= tp!80875 b_and!36629)))

(declare-fun b!1095763 () Bool)

(declare-fun e!625542 () Bool)

(declare-fun e!625538 () Bool)

(declare-fun mapRes!42310 () Bool)

(assert (=> b!1095763 (= e!625542 (and e!625538 mapRes!42310))))

(declare-fun condMapEmpty!42310 () Bool)

(declare-datatypes ((V!41171 0))(
  ( (V!41172 (val!13573 Int)) )
))
(declare-datatypes ((ValueCell!12807 0))(
  ( (ValueCellFull!12807 (v!16194 V!41171)) (EmptyCell!12807) )
))
(declare-datatypes ((array!70979 0))(
  ( (array!70980 (arr!34161 (Array (_ BitVec 32) ValueCell!12807)) (size!34697 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70979)

(declare-fun mapDefault!42310 () ValueCell!12807)

(assert (=> b!1095763 (= condMapEmpty!42310 (= (arr!34161 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12807)) mapDefault!42310)))))

(declare-fun mapIsEmpty!42310 () Bool)

(assert (=> mapIsEmpty!42310 mapRes!42310))

(declare-fun b!1095764 () Bool)

(declare-fun res!731289 () Bool)

(declare-fun e!625543 () Bool)

(assert (=> b!1095764 (=> (not res!731289) (not e!625543))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095764 (= res!731289 (validKeyInArray!0 k0!904))))

(declare-fun b!1095765 () Bool)

(declare-fun res!731295 () Bool)

(declare-fun e!625541 () Bool)

(assert (=> b!1095765 (=> (not res!731295) (not e!625541))))

(declare-datatypes ((array!70981 0))(
  ( (array!70982 (arr!34162 (Array (_ BitVec 32) (_ BitVec 64))) (size!34698 (_ BitVec 32))) )
))
(declare-fun lt!489935 () array!70981)

(declare-datatypes ((List!23854 0))(
  ( (Nil!23851) (Cons!23850 (h!25059 (_ BitVec 64)) (t!33883 List!23854)) )
))
(declare-fun arrayNoDuplicates!0 (array!70981 (_ BitVec 32) List!23854) Bool)

(assert (=> b!1095765 (= res!731295 (arrayNoDuplicates!0 lt!489935 #b00000000000000000000000000000000 Nil!23851))))

(declare-fun mapNonEmpty!42310 () Bool)

(declare-fun tp!80876 () Bool)

(declare-fun e!625539 () Bool)

(assert (=> mapNonEmpty!42310 (= mapRes!42310 (and tp!80876 e!625539))))

(declare-fun mapKey!42310 () (_ BitVec 32))

(declare-fun mapValue!42310 () ValueCell!12807)

(declare-fun mapRest!42310 () (Array (_ BitVec 32) ValueCell!12807))

(assert (=> mapNonEmpty!42310 (= (arr!34161 _values!874) (store mapRest!42310 mapKey!42310 mapValue!42310))))

(declare-fun b!1095766 () Bool)

(declare-fun res!731296 () Bool)

(assert (=> b!1095766 (=> (not res!731296) (not e!625543))))

(declare-fun _keys!1070 () array!70981)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095766 (= res!731296 (= (select (arr!34162 _keys!1070) i!650) k0!904))))

(declare-fun b!1095767 () Bool)

(declare-fun tp_is_empty!27033 () Bool)

(assert (=> b!1095767 (= e!625538 tp_is_empty!27033)))

(declare-fun b!1095768 () Bool)

(declare-fun res!731288 () Bool)

(assert (=> b!1095768 (=> (not res!731288) (not e!625543))))

(assert (=> b!1095768 (= res!731288 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34698 _keys!1070))))))

(declare-fun b!1095769 () Bool)

(assert (=> b!1095769 (= e!625543 e!625541)))

(declare-fun res!731291 () Bool)

(assert (=> b!1095769 (=> (not res!731291) (not e!625541))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70981 (_ BitVec 32)) Bool)

(assert (=> b!1095769 (= res!731291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489935 mask!1414))))

(assert (=> b!1095769 (= lt!489935 (array!70982 (store (arr!34162 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34698 _keys!1070)))))

(declare-fun b!1095770 () Bool)

(declare-fun res!731294 () Bool)

(assert (=> b!1095770 (=> (not res!731294) (not e!625543))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1095770 (= res!731294 (and (= (size!34697 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34698 _keys!1070) (size!34697 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095762 () Bool)

(declare-fun res!731290 () Bool)

(assert (=> b!1095762 (=> (not res!731290) (not e!625543))))

(assert (=> b!1095762 (= res!731290 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23851))))

(declare-fun res!731292 () Bool)

(assert (=> start!96404 (=> (not res!731292) (not e!625543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96404 (= res!731292 (validMask!0 mask!1414))))

(assert (=> start!96404 e!625543))

(assert (=> start!96404 tp!80875))

(assert (=> start!96404 true))

(assert (=> start!96404 tp_is_empty!27033))

(declare-fun array_inv!26324 (array!70981) Bool)

(assert (=> start!96404 (array_inv!26324 _keys!1070)))

(declare-fun array_inv!26325 (array!70979) Bool)

(assert (=> start!96404 (and (array_inv!26325 _values!874) e!625542)))

(declare-fun b!1095771 () Bool)

(assert (=> b!1095771 (= e!625539 tp_is_empty!27033)))

(declare-fun b!1095772 () Bool)

(assert (=> b!1095772 (= e!625541 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41171)

(declare-datatypes ((tuple2!17234 0))(
  ( (tuple2!17235 (_1!8628 (_ BitVec 64)) (_2!8628 V!41171)) )
))
(declare-datatypes ((List!23855 0))(
  ( (Nil!23852) (Cons!23851 (h!25060 tuple2!17234) (t!33884 List!23855)) )
))
(declare-datatypes ((ListLongMap!15203 0))(
  ( (ListLongMap!15204 (toList!7617 List!23855)) )
))
(declare-fun lt!489937 () ListLongMap!15203)

(declare-fun zeroValue!831 () V!41171)

(declare-fun getCurrentListMapNoExtraKeys!4133 (array!70981 array!70979 (_ BitVec 32) (_ BitVec 32) V!41171 V!41171 (_ BitVec 32) Int) ListLongMap!15203)

(declare-fun dynLambda!2268 (Int (_ BitVec 64)) V!41171)

(assert (=> b!1095772 (= lt!489937 (getCurrentListMapNoExtraKeys!4133 lt!489935 (array!70980 (store (arr!34161 _values!874) i!650 (ValueCellFull!12807 (dynLambda!2268 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34697 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489936 () ListLongMap!15203)

(assert (=> b!1095772 (= lt!489936 (getCurrentListMapNoExtraKeys!4133 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095772 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36046 0))(
  ( (Unit!36047) )
))
(declare-fun lt!489934 () Unit!36046)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70981 (_ BitVec 64) (_ BitVec 32)) Unit!36046)

(assert (=> b!1095772 (= lt!489934 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1095773 () Bool)

(declare-fun res!731293 () Bool)

(assert (=> b!1095773 (=> (not res!731293) (not e!625543))))

(assert (=> b!1095773 (= res!731293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!96404 res!731292) b!1095770))

(assert (= (and b!1095770 res!731294) b!1095773))

(assert (= (and b!1095773 res!731293) b!1095762))

(assert (= (and b!1095762 res!731290) b!1095768))

(assert (= (and b!1095768 res!731288) b!1095764))

(assert (= (and b!1095764 res!731289) b!1095766))

(assert (= (and b!1095766 res!731296) b!1095769))

(assert (= (and b!1095769 res!731291) b!1095765))

(assert (= (and b!1095765 res!731295) b!1095772))

(assert (= (and b!1095763 condMapEmpty!42310) mapIsEmpty!42310))

(assert (= (and b!1095763 (not condMapEmpty!42310)) mapNonEmpty!42310))

(get-info :version)

(assert (= (and mapNonEmpty!42310 ((_ is ValueCellFull!12807) mapValue!42310)) b!1095771))

(assert (= (and b!1095763 ((_ is ValueCellFull!12807) mapDefault!42310)) b!1095767))

(assert (= start!96404 b!1095763))

(declare-fun b_lambda!17641 () Bool)

(assert (=> (not b_lambda!17641) (not b!1095772)))

(declare-fun t!33882 () Bool)

(declare-fun tb!7849 () Bool)

(assert (=> (and start!96404 (= defaultEntry!882 defaultEntry!882) t!33882) tb!7849))

(declare-fun result!16221 () Bool)

(assert (=> tb!7849 (= result!16221 tp_is_empty!27033)))

(assert (=> b!1095772 t!33882))

(declare-fun b_and!36631 () Bool)

(assert (= b_and!36629 (and (=> t!33882 result!16221) b_and!36631)))

(declare-fun m!1015365 () Bool)

(assert (=> start!96404 m!1015365))

(declare-fun m!1015367 () Bool)

(assert (=> start!96404 m!1015367))

(declare-fun m!1015369 () Bool)

(assert (=> start!96404 m!1015369))

(declare-fun m!1015371 () Bool)

(assert (=> mapNonEmpty!42310 m!1015371))

(declare-fun m!1015373 () Bool)

(assert (=> b!1095764 m!1015373))

(declare-fun m!1015375 () Bool)

(assert (=> b!1095769 m!1015375))

(declare-fun m!1015377 () Bool)

(assert (=> b!1095769 m!1015377))

(declare-fun m!1015379 () Bool)

(assert (=> b!1095766 m!1015379))

(declare-fun m!1015381 () Bool)

(assert (=> b!1095773 m!1015381))

(declare-fun m!1015383 () Bool)

(assert (=> b!1095762 m!1015383))

(declare-fun m!1015385 () Bool)

(assert (=> b!1095765 m!1015385))

(declare-fun m!1015387 () Bool)

(assert (=> b!1095772 m!1015387))

(declare-fun m!1015389 () Bool)

(assert (=> b!1095772 m!1015389))

(declare-fun m!1015391 () Bool)

(assert (=> b!1095772 m!1015391))

(declare-fun m!1015393 () Bool)

(assert (=> b!1095772 m!1015393))

(declare-fun m!1015395 () Bool)

(assert (=> b!1095772 m!1015395))

(declare-fun m!1015397 () Bool)

(assert (=> b!1095772 m!1015397))

(check-sat b_and!36631 (not mapNonEmpty!42310) (not start!96404) (not b!1095769) (not b!1095773) (not b_lambda!17641) (not b!1095762) (not b!1095764) (not b_next!22983) tp_is_empty!27033 (not b!1095772) (not b!1095765))
(check-sat b_and!36631 (not b_next!22983))
