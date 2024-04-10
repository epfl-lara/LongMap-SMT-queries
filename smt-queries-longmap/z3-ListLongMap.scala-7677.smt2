; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96410 () Bool)

(assert start!96410)

(declare-fun b_free!22989 () Bool)

(declare-fun b_next!22989 () Bool)

(assert (=> start!96410 (= b_free!22989 (not b_next!22989))))

(declare-fun tp!80894 () Bool)

(declare-fun b_and!36641 () Bool)

(assert (=> start!96410 (= tp!80894 b_and!36641)))

(declare-fun b!1095876 () Bool)

(declare-fun e!625596 () Bool)

(declare-fun e!625593 () Bool)

(assert (=> b!1095876 (= e!625596 e!625593)))

(declare-fun res!731377 () Bool)

(assert (=> b!1095876 (=> (not res!731377) (not e!625593))))

(declare-datatypes ((array!70991 0))(
  ( (array!70992 (arr!34167 (Array (_ BitVec 32) (_ BitVec 64))) (size!34703 (_ BitVec 32))) )
))
(declare-fun lt!489972 () array!70991)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70991 (_ BitVec 32)) Bool)

(assert (=> b!1095876 (= res!731377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489972 mask!1414))))

(declare-fun _keys!1070 () array!70991)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095876 (= lt!489972 (array!70992 (store (arr!34167 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34703 _keys!1070)))))

(declare-fun b!1095877 () Bool)

(declare-fun e!625595 () Bool)

(declare-fun tp_is_empty!27039 () Bool)

(assert (=> b!1095877 (= e!625595 tp_is_empty!27039)))

(declare-fun b!1095878 () Bool)

(declare-fun res!731372 () Bool)

(assert (=> b!1095878 (=> (not res!731372) (not e!625596))))

(declare-datatypes ((V!41179 0))(
  ( (V!41180 (val!13576 Int)) )
))
(declare-datatypes ((ValueCell!12810 0))(
  ( (ValueCellFull!12810 (v!16197 V!41179)) (EmptyCell!12810) )
))
(declare-datatypes ((array!70993 0))(
  ( (array!70994 (arr!34168 (Array (_ BitVec 32) ValueCell!12810)) (size!34704 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70993)

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1095878 (= res!731372 (and (= (size!34704 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34703 _keys!1070) (size!34704 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095879 () Bool)

(declare-fun res!731373 () Bool)

(assert (=> b!1095879 (=> (not res!731373) (not e!625596))))

(declare-datatypes ((List!23858 0))(
  ( (Nil!23855) (Cons!23854 (h!25063 (_ BitVec 64)) (t!33893 List!23858)) )
))
(declare-fun arrayNoDuplicates!0 (array!70991 (_ BitVec 32) List!23858) Bool)

(assert (=> b!1095879 (= res!731373 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23855))))

(declare-fun b!1095880 () Bool)

(declare-fun res!731369 () Bool)

(assert (=> b!1095880 (=> (not res!731369) (not e!625596))))

(assert (=> b!1095880 (= res!731369 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34703 _keys!1070))))))

(declare-fun b!1095881 () Bool)

(declare-fun res!731370 () Bool)

(assert (=> b!1095881 (=> (not res!731370) (not e!625596))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095881 (= res!731370 (validKeyInArray!0 k0!904))))

(declare-fun b!1095882 () Bool)

(declare-fun e!625592 () Bool)

(assert (=> b!1095882 (= e!625592 tp_is_empty!27039)))

(declare-fun b!1095883 () Bool)

(declare-fun e!625597 () Bool)

(declare-fun mapRes!42319 () Bool)

(assert (=> b!1095883 (= e!625597 (and e!625595 mapRes!42319))))

(declare-fun condMapEmpty!42319 () Bool)

(declare-fun mapDefault!42319 () ValueCell!12810)

(assert (=> b!1095883 (= condMapEmpty!42319 (= (arr!34168 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12810)) mapDefault!42319)))))

(declare-fun b!1095884 () Bool)

(declare-fun res!731375 () Bool)

(assert (=> b!1095884 (=> (not res!731375) (not e!625593))))

(assert (=> b!1095884 (= res!731375 (arrayNoDuplicates!0 lt!489972 #b00000000000000000000000000000000 Nil!23855))))

(declare-fun res!731371 () Bool)

(assert (=> start!96410 (=> (not res!731371) (not e!625596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96410 (= res!731371 (validMask!0 mask!1414))))

(assert (=> start!96410 e!625596))

(assert (=> start!96410 tp!80894))

(assert (=> start!96410 true))

(assert (=> start!96410 tp_is_empty!27039))

(declare-fun array_inv!26328 (array!70991) Bool)

(assert (=> start!96410 (array_inv!26328 _keys!1070)))

(declare-fun array_inv!26329 (array!70993) Bool)

(assert (=> start!96410 (and (array_inv!26329 _values!874) e!625597)))

(declare-fun mapIsEmpty!42319 () Bool)

(assert (=> mapIsEmpty!42319 mapRes!42319))

(declare-fun b!1095885 () Bool)

(declare-fun res!731374 () Bool)

(assert (=> b!1095885 (=> (not res!731374) (not e!625596))))

(assert (=> b!1095885 (= res!731374 (= (select (arr!34167 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!42319 () Bool)

(declare-fun tp!80893 () Bool)

(assert (=> mapNonEmpty!42319 (= mapRes!42319 (and tp!80893 e!625592))))

(declare-fun mapRest!42319 () (Array (_ BitVec 32) ValueCell!12810))

(declare-fun mapKey!42319 () (_ BitVec 32))

(declare-fun mapValue!42319 () ValueCell!12810)

(assert (=> mapNonEmpty!42319 (= (arr!34168 _values!874) (store mapRest!42319 mapKey!42319 mapValue!42319))))

(declare-fun b!1095886 () Bool)

(declare-fun res!731376 () Bool)

(assert (=> b!1095886 (=> (not res!731376) (not e!625596))))

(assert (=> b!1095886 (= res!731376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095887 () Bool)

(assert (=> b!1095887 (= e!625593 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!17238 0))(
  ( (tuple2!17239 (_1!8630 (_ BitVec 64)) (_2!8630 V!41179)) )
))
(declare-datatypes ((List!23859 0))(
  ( (Nil!23856) (Cons!23855 (h!25064 tuple2!17238) (t!33894 List!23859)) )
))
(declare-datatypes ((ListLongMap!15207 0))(
  ( (ListLongMap!15208 (toList!7619 List!23859)) )
))
(declare-fun lt!489971 () ListLongMap!15207)

(declare-fun minValue!831 () V!41179)

(declare-fun zeroValue!831 () V!41179)

(declare-fun getCurrentListMapNoExtraKeys!4135 (array!70991 array!70993 (_ BitVec 32) (_ BitVec 32) V!41179 V!41179 (_ BitVec 32) Int) ListLongMap!15207)

(declare-fun dynLambda!2270 (Int (_ BitVec 64)) V!41179)

(assert (=> b!1095887 (= lt!489971 (getCurrentListMapNoExtraKeys!4135 lt!489972 (array!70994 (store (arr!34168 _values!874) i!650 (ValueCellFull!12810 (dynLambda!2270 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34704 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489970 () ListLongMap!15207)

(assert (=> b!1095887 (= lt!489970 (getCurrentListMapNoExtraKeys!4135 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095887 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36050 0))(
  ( (Unit!36051) )
))
(declare-fun lt!489973 () Unit!36050)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70991 (_ BitVec 64) (_ BitVec 32)) Unit!36050)

(assert (=> b!1095887 (= lt!489973 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!96410 res!731371) b!1095878))

(assert (= (and b!1095878 res!731372) b!1095886))

(assert (= (and b!1095886 res!731376) b!1095879))

(assert (= (and b!1095879 res!731373) b!1095880))

(assert (= (and b!1095880 res!731369) b!1095881))

(assert (= (and b!1095881 res!731370) b!1095885))

(assert (= (and b!1095885 res!731374) b!1095876))

(assert (= (and b!1095876 res!731377) b!1095884))

(assert (= (and b!1095884 res!731375) b!1095887))

(assert (= (and b!1095883 condMapEmpty!42319) mapIsEmpty!42319))

(assert (= (and b!1095883 (not condMapEmpty!42319)) mapNonEmpty!42319))

(get-info :version)

(assert (= (and mapNonEmpty!42319 ((_ is ValueCellFull!12810) mapValue!42319)) b!1095882))

(assert (= (and b!1095883 ((_ is ValueCellFull!12810) mapDefault!42319)) b!1095877))

(assert (= start!96410 b!1095883))

(declare-fun b_lambda!17647 () Bool)

(assert (=> (not b_lambda!17647) (not b!1095887)))

(declare-fun t!33892 () Bool)

(declare-fun tb!7855 () Bool)

(assert (=> (and start!96410 (= defaultEntry!882 defaultEntry!882) t!33892) tb!7855))

(declare-fun result!16233 () Bool)

(assert (=> tb!7855 (= result!16233 tp_is_empty!27039)))

(assert (=> b!1095887 t!33892))

(declare-fun b_and!36643 () Bool)

(assert (= b_and!36641 (and (=> t!33892 result!16233) b_and!36643)))

(declare-fun m!1015467 () Bool)

(assert (=> b!1095879 m!1015467))

(declare-fun m!1015469 () Bool)

(assert (=> b!1095884 m!1015469))

(declare-fun m!1015471 () Bool)

(assert (=> b!1095876 m!1015471))

(declare-fun m!1015473 () Bool)

(assert (=> b!1095876 m!1015473))

(declare-fun m!1015475 () Bool)

(assert (=> mapNonEmpty!42319 m!1015475))

(declare-fun m!1015477 () Bool)

(assert (=> start!96410 m!1015477))

(declare-fun m!1015479 () Bool)

(assert (=> start!96410 m!1015479))

(declare-fun m!1015481 () Bool)

(assert (=> start!96410 m!1015481))

(declare-fun m!1015483 () Bool)

(assert (=> b!1095887 m!1015483))

(declare-fun m!1015485 () Bool)

(assert (=> b!1095887 m!1015485))

(declare-fun m!1015487 () Bool)

(assert (=> b!1095887 m!1015487))

(declare-fun m!1015489 () Bool)

(assert (=> b!1095887 m!1015489))

(declare-fun m!1015491 () Bool)

(assert (=> b!1095887 m!1015491))

(declare-fun m!1015493 () Bool)

(assert (=> b!1095887 m!1015493))

(declare-fun m!1015495 () Bool)

(assert (=> b!1095881 m!1015495))

(declare-fun m!1015497 () Bool)

(assert (=> b!1095885 m!1015497))

(declare-fun m!1015499 () Bool)

(assert (=> b!1095886 m!1015499))

(check-sat (not mapNonEmpty!42319) tp_is_empty!27039 (not start!96410) (not b!1095887) (not b!1095879) (not b!1095876) (not b!1095884) (not b_lambda!17647) b_and!36643 (not b!1095881) (not b!1095886) (not b_next!22989))
(check-sat b_and!36643 (not b_next!22989))
