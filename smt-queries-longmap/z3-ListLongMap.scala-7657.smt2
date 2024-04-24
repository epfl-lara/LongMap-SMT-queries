; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96498 () Bool)

(assert start!96498)

(declare-fun b_free!22915 () Bool)

(declare-fun b_next!22915 () Bool)

(assert (=> start!96498 (= b_free!22915 (not b_next!22915))))

(declare-fun tp!80593 () Bool)

(declare-fun b_and!36515 () Bool)

(assert (=> start!96498 (= tp!80593 b_and!36515)))

(declare-fun mapNonEmpty!42130 () Bool)

(declare-fun mapRes!42130 () Bool)

(declare-fun tp!80594 () Bool)

(declare-fun e!625302 () Bool)

(assert (=> mapNonEmpty!42130 (= mapRes!42130 (and tp!80594 e!625302))))

(declare-datatypes ((V!41017 0))(
  ( (V!41018 (val!13515 Int)) )
))
(declare-datatypes ((ValueCell!12749 0))(
  ( (ValueCellFull!12749 (v!16132 V!41017)) (EmptyCell!12749) )
))
(declare-datatypes ((array!70779 0))(
  ( (array!70780 (arr!34057 (Array (_ BitVec 32) ValueCell!12749)) (size!34594 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70779)

(declare-fun mapKey!42130 () (_ BitVec 32))

(declare-fun mapValue!42130 () ValueCell!12749)

(declare-fun mapRest!42130 () (Array (_ BitVec 32) ValueCell!12749))

(assert (=> mapNonEmpty!42130 (= (arr!34057 _values!874) (store mapRest!42130 mapKey!42130 mapValue!42130))))

(declare-fun res!730341 () Bool)

(declare-fun e!625305 () Bool)

(assert (=> start!96498 (=> (not res!730341) (not e!625305))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96498 (= res!730341 (validMask!0 mask!1414))))

(assert (=> start!96498 e!625305))

(assert (=> start!96498 tp!80593))

(assert (=> start!96498 true))

(declare-fun tp_is_empty!26917 () Bool)

(assert (=> start!96498 tp_is_empty!26917))

(declare-datatypes ((array!70781 0))(
  ( (array!70782 (arr!34058 (Array (_ BitVec 32) (_ BitVec 64))) (size!34595 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70781)

(declare-fun array_inv!26288 (array!70781) Bool)

(assert (=> start!96498 (array_inv!26288 _keys!1070)))

(declare-fun e!625307 () Bool)

(declare-fun array_inv!26289 (array!70779) Bool)

(assert (=> start!96498 (and (array_inv!26289 _values!874) e!625307)))

(declare-fun b!1094986 () Bool)

(declare-fun e!625303 () Bool)

(assert (=> b!1094986 (= e!625305 e!625303)))

(declare-fun res!730334 () Bool)

(assert (=> b!1094986 (=> (not res!730334) (not e!625303))))

(declare-fun lt!489673 () array!70781)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70781 (_ BitVec 32)) Bool)

(assert (=> b!1094986 (= res!730334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489673 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1094986 (= lt!489673 (array!70782 (store (arr!34058 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34595 _keys!1070)))))

(declare-fun b!1094987 () Bool)

(declare-fun e!625304 () Bool)

(assert (=> b!1094987 (= e!625304 tp_is_empty!26917)))

(declare-fun b!1094988 () Bool)

(assert (=> b!1094988 (= e!625307 (and e!625304 mapRes!42130))))

(declare-fun condMapEmpty!42130 () Bool)

(declare-fun mapDefault!42130 () ValueCell!12749)

(assert (=> b!1094988 (= condMapEmpty!42130 (= (arr!34057 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12749)) mapDefault!42130)))))

(declare-fun mapIsEmpty!42130 () Bool)

(assert (=> mapIsEmpty!42130 mapRes!42130))

(declare-fun b!1094989 () Bool)

(assert (=> b!1094989 (= e!625303 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!17198 0))(
  ( (tuple2!17199 (_1!8610 (_ BitVec 64)) (_2!8610 V!41017)) )
))
(declare-datatypes ((List!23795 0))(
  ( (Nil!23792) (Cons!23791 (h!25009 tuple2!17198) (t!33760 List!23795)) )
))
(declare-datatypes ((ListLongMap!15175 0))(
  ( (ListLongMap!15176 (toList!7603 List!23795)) )
))
(declare-fun lt!489674 () ListLongMap!15175)

(declare-fun minValue!831 () V!41017)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41017)

(declare-fun getCurrentListMap!4351 (array!70781 array!70779 (_ BitVec 32) (_ BitVec 32) V!41017 V!41017 (_ BitVec 32) Int) ListLongMap!15175)

(assert (=> b!1094989 (= lt!489674 (getCurrentListMap!4351 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489670 () array!70779)

(declare-fun lt!489672 () ListLongMap!15175)

(assert (=> b!1094989 (= lt!489672 (getCurrentListMap!4351 lt!489673 lt!489670 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489668 () ListLongMap!15175)

(declare-fun lt!489669 () ListLongMap!15175)

(assert (=> b!1094989 (and (= lt!489668 lt!489669) (= lt!489669 lt!489668))))

(declare-fun lt!489675 () ListLongMap!15175)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!908 (ListLongMap!15175 (_ BitVec 64)) ListLongMap!15175)

(assert (=> b!1094989 (= lt!489669 (-!908 lt!489675 k0!904))))

(declare-datatypes ((Unit!35983 0))(
  ( (Unit!35984) )
))
(declare-fun lt!489667 () Unit!35983)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!180 (array!70781 array!70779 (_ BitVec 32) (_ BitVec 32) V!41017 V!41017 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35983)

(assert (=> b!1094989 (= lt!489667 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!180 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4156 (array!70781 array!70779 (_ BitVec 32) (_ BitVec 32) V!41017 V!41017 (_ BitVec 32) Int) ListLongMap!15175)

(assert (=> b!1094989 (= lt!489668 (getCurrentListMapNoExtraKeys!4156 lt!489673 lt!489670 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2277 (Int (_ BitVec 64)) V!41017)

(assert (=> b!1094989 (= lt!489670 (array!70780 (store (arr!34057 _values!874) i!650 (ValueCellFull!12749 (dynLambda!2277 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34594 _values!874)))))

(assert (=> b!1094989 (= lt!489675 (getCurrentListMapNoExtraKeys!4156 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70781 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1094989 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489671 () Unit!35983)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70781 (_ BitVec 64) (_ BitVec 32)) Unit!35983)

(assert (=> b!1094989 (= lt!489671 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1094990 () Bool)

(declare-fun res!730339 () Bool)

(assert (=> b!1094990 (=> (not res!730339) (not e!625305))))

(assert (=> b!1094990 (= res!730339 (= (select (arr!34058 _keys!1070) i!650) k0!904))))

(declare-fun b!1094991 () Bool)

(declare-fun res!730337 () Bool)

(assert (=> b!1094991 (=> (not res!730337) (not e!625305))))

(assert (=> b!1094991 (= res!730337 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34595 _keys!1070))))))

(declare-fun b!1094992 () Bool)

(declare-fun res!730333 () Bool)

(assert (=> b!1094992 (=> (not res!730333) (not e!625303))))

(declare-datatypes ((List!23796 0))(
  ( (Nil!23793) (Cons!23792 (h!25010 (_ BitVec 64)) (t!33761 List!23796)) )
))
(declare-fun arrayNoDuplicates!0 (array!70781 (_ BitVec 32) List!23796) Bool)

(assert (=> b!1094992 (= res!730333 (arrayNoDuplicates!0 lt!489673 #b00000000000000000000000000000000 Nil!23793))))

(declare-fun b!1094993 () Bool)

(declare-fun res!730338 () Bool)

(assert (=> b!1094993 (=> (not res!730338) (not e!625305))))

(assert (=> b!1094993 (= res!730338 (and (= (size!34594 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34595 _keys!1070) (size!34594 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094994 () Bool)

(assert (=> b!1094994 (= e!625302 tp_is_empty!26917)))

(declare-fun b!1094995 () Bool)

(declare-fun res!730335 () Bool)

(assert (=> b!1094995 (=> (not res!730335) (not e!625305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094995 (= res!730335 (validKeyInArray!0 k0!904))))

(declare-fun b!1094996 () Bool)

(declare-fun res!730336 () Bool)

(assert (=> b!1094996 (=> (not res!730336) (not e!625305))))

(assert (=> b!1094996 (= res!730336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094997 () Bool)

(declare-fun res!730340 () Bool)

(assert (=> b!1094997 (=> (not res!730340) (not e!625305))))

(assert (=> b!1094997 (= res!730340 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23793))))

(assert (= (and start!96498 res!730341) b!1094993))

(assert (= (and b!1094993 res!730338) b!1094996))

(assert (= (and b!1094996 res!730336) b!1094997))

(assert (= (and b!1094997 res!730340) b!1094991))

(assert (= (and b!1094991 res!730337) b!1094995))

(assert (= (and b!1094995 res!730335) b!1094990))

(assert (= (and b!1094990 res!730339) b!1094986))

(assert (= (and b!1094986 res!730334) b!1094992))

(assert (= (and b!1094992 res!730333) b!1094989))

(assert (= (and b!1094988 condMapEmpty!42130) mapIsEmpty!42130))

(assert (= (and b!1094988 (not condMapEmpty!42130)) mapNonEmpty!42130))

(get-info :version)

(assert (= (and mapNonEmpty!42130 ((_ is ValueCellFull!12749) mapValue!42130)) b!1094994))

(assert (= (and b!1094988 ((_ is ValueCellFull!12749) mapDefault!42130)) b!1094987))

(assert (= start!96498 b!1094988))

(declare-fun b_lambda!17595 () Bool)

(assert (=> (not b_lambda!17595) (not b!1094989)))

(declare-fun t!33759 () Bool)

(declare-fun tb!7785 () Bool)

(assert (=> (and start!96498 (= defaultEntry!882 defaultEntry!882) t!33759) tb!7785))

(declare-fun result!16097 () Bool)

(assert (=> tb!7785 (= result!16097 tp_is_empty!26917)))

(assert (=> b!1094989 t!33759))

(declare-fun b_and!36517 () Bool)

(assert (= b_and!36515 (and (=> t!33759 result!16097) b_and!36517)))

(declare-fun m!1015223 () Bool)

(assert (=> b!1094996 m!1015223))

(declare-fun m!1015225 () Bool)

(assert (=> b!1094995 m!1015225))

(declare-fun m!1015227 () Bool)

(assert (=> b!1094990 m!1015227))

(declare-fun m!1015229 () Bool)

(assert (=> b!1094992 m!1015229))

(declare-fun m!1015231 () Bool)

(assert (=> mapNonEmpty!42130 m!1015231))

(declare-fun m!1015233 () Bool)

(assert (=> b!1094989 m!1015233))

(declare-fun m!1015235 () Bool)

(assert (=> b!1094989 m!1015235))

(declare-fun m!1015237 () Bool)

(assert (=> b!1094989 m!1015237))

(declare-fun m!1015239 () Bool)

(assert (=> b!1094989 m!1015239))

(declare-fun m!1015241 () Bool)

(assert (=> b!1094989 m!1015241))

(declare-fun m!1015243 () Bool)

(assert (=> b!1094989 m!1015243))

(declare-fun m!1015245 () Bool)

(assert (=> b!1094989 m!1015245))

(declare-fun m!1015247 () Bool)

(assert (=> b!1094989 m!1015247))

(declare-fun m!1015249 () Bool)

(assert (=> b!1094989 m!1015249))

(declare-fun m!1015251 () Bool)

(assert (=> b!1094989 m!1015251))

(declare-fun m!1015253 () Bool)

(assert (=> b!1094986 m!1015253))

(declare-fun m!1015255 () Bool)

(assert (=> b!1094986 m!1015255))

(declare-fun m!1015257 () Bool)

(assert (=> start!96498 m!1015257))

(declare-fun m!1015259 () Bool)

(assert (=> start!96498 m!1015259))

(declare-fun m!1015261 () Bool)

(assert (=> start!96498 m!1015261))

(declare-fun m!1015263 () Bool)

(assert (=> b!1094997 m!1015263))

(check-sat (not b!1094989) (not b_lambda!17595) (not b!1094995) (not start!96498) (not b_next!22915) (not b!1094992) (not mapNonEmpty!42130) (not b!1094996) (not b!1094986) tp_is_empty!26917 (not b!1094997) b_and!36517)
(check-sat b_and!36517 (not b_next!22915))
