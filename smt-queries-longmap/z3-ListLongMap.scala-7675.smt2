; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96398 () Bool)

(assert start!96398)

(declare-fun b_free!22977 () Bool)

(declare-fun b_next!22977 () Bool)

(assert (=> start!96398 (= b_free!22977 (not b_next!22977))))

(declare-fun tp!80857 () Bool)

(declare-fun b_and!36617 () Bool)

(assert (=> start!96398 (= tp!80857 b_and!36617)))

(declare-fun b!1095648 () Bool)

(declare-fun res!731207 () Bool)

(declare-fun e!625486 () Bool)

(assert (=> b!1095648 (=> (not res!731207) (not e!625486))))

(declare-datatypes ((array!70967 0))(
  ( (array!70968 (arr!34155 (Array (_ BitVec 32) (_ BitVec 64))) (size!34691 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70967)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095648 (= res!731207 (= (select (arr!34155 _keys!1070) i!650) k0!904))))

(declare-fun b!1095649 () Bool)

(declare-fun e!625488 () Bool)

(declare-fun e!625489 () Bool)

(declare-fun mapRes!42301 () Bool)

(assert (=> b!1095649 (= e!625488 (and e!625489 mapRes!42301))))

(declare-fun condMapEmpty!42301 () Bool)

(declare-datatypes ((V!41163 0))(
  ( (V!41164 (val!13570 Int)) )
))
(declare-datatypes ((ValueCell!12804 0))(
  ( (ValueCellFull!12804 (v!16191 V!41163)) (EmptyCell!12804) )
))
(declare-datatypes ((array!70969 0))(
  ( (array!70970 (arr!34156 (Array (_ BitVec 32) ValueCell!12804)) (size!34692 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70969)

(declare-fun mapDefault!42301 () ValueCell!12804)

(assert (=> b!1095649 (= condMapEmpty!42301 (= (arr!34156 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12804)) mapDefault!42301)))))

(declare-fun b!1095650 () Bool)

(declare-fun e!625487 () Bool)

(assert (=> b!1095650 (= e!625486 e!625487)))

(declare-fun res!731212 () Bool)

(assert (=> b!1095650 (=> (not res!731212) (not e!625487))))

(declare-fun lt!489899 () array!70967)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70967 (_ BitVec 32)) Bool)

(assert (=> b!1095650 (= res!731212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489899 mask!1414))))

(assert (=> b!1095650 (= lt!489899 (array!70968 (store (arr!34155 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34691 _keys!1070)))))

(declare-fun b!1095651 () Bool)

(declare-fun res!731210 () Bool)

(assert (=> b!1095651 (=> (not res!731210) (not e!625487))))

(declare-datatypes ((List!23849 0))(
  ( (Nil!23846) (Cons!23845 (h!25054 (_ BitVec 64)) (t!33872 List!23849)) )
))
(declare-fun arrayNoDuplicates!0 (array!70967 (_ BitVec 32) List!23849) Bool)

(assert (=> b!1095651 (= res!731210 (arrayNoDuplicates!0 lt!489899 #b00000000000000000000000000000000 Nil!23846))))

(declare-fun b!1095652 () Bool)

(declare-fun tp_is_empty!27027 () Bool)

(assert (=> b!1095652 (= e!625489 tp_is_empty!27027)))

(declare-fun mapNonEmpty!42301 () Bool)

(declare-fun tp!80858 () Bool)

(declare-fun e!625484 () Bool)

(assert (=> mapNonEmpty!42301 (= mapRes!42301 (and tp!80858 e!625484))))

(declare-fun mapKey!42301 () (_ BitVec 32))

(declare-fun mapRest!42301 () (Array (_ BitVec 32) ValueCell!12804))

(declare-fun mapValue!42301 () ValueCell!12804)

(assert (=> mapNonEmpty!42301 (= (arr!34156 _values!874) (store mapRest!42301 mapKey!42301 mapValue!42301))))

(declare-fun mapIsEmpty!42301 () Bool)

(assert (=> mapIsEmpty!42301 mapRes!42301))

(declare-fun res!731208 () Bool)

(assert (=> start!96398 (=> (not res!731208) (not e!625486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96398 (= res!731208 (validMask!0 mask!1414))))

(assert (=> start!96398 e!625486))

(assert (=> start!96398 tp!80857))

(assert (=> start!96398 true))

(assert (=> start!96398 tp_is_empty!27027))

(declare-fun array_inv!26318 (array!70967) Bool)

(assert (=> start!96398 (array_inv!26318 _keys!1070)))

(declare-fun array_inv!26319 (array!70969) Bool)

(assert (=> start!96398 (and (array_inv!26319 _values!874) e!625488)))

(declare-fun b!1095653 () Bool)

(declare-fun res!731211 () Bool)

(assert (=> b!1095653 (=> (not res!731211) (not e!625486))))

(assert (=> b!1095653 (= res!731211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095654 () Bool)

(declare-fun res!731214 () Bool)

(assert (=> b!1095654 (=> (not res!731214) (not e!625486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095654 (= res!731214 (validKeyInArray!0 k0!904))))

(declare-fun b!1095655 () Bool)

(assert (=> b!1095655 (= e!625484 tp_is_empty!27027)))

(declare-fun b!1095656 () Bool)

(assert (=> b!1095656 (= e!625487 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41163)

(declare-fun zeroValue!831 () V!41163)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17228 0))(
  ( (tuple2!17229 (_1!8625 (_ BitVec 64)) (_2!8625 V!41163)) )
))
(declare-datatypes ((List!23850 0))(
  ( (Nil!23847) (Cons!23846 (h!25055 tuple2!17228) (t!33873 List!23850)) )
))
(declare-datatypes ((ListLongMap!15197 0))(
  ( (ListLongMap!15198 (toList!7614 List!23850)) )
))
(declare-fun lt!489901 () ListLongMap!15197)

(declare-fun getCurrentListMapNoExtraKeys!4130 (array!70967 array!70969 (_ BitVec 32) (_ BitVec 32) V!41163 V!41163 (_ BitVec 32) Int) ListLongMap!15197)

(declare-fun dynLambda!2265 (Int (_ BitVec 64)) V!41163)

(assert (=> b!1095656 (= lt!489901 (getCurrentListMapNoExtraKeys!4130 lt!489899 (array!70970 (store (arr!34156 _values!874) i!650 (ValueCellFull!12804 (dynLambda!2265 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34692 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489898 () ListLongMap!15197)

(assert (=> b!1095656 (= lt!489898 (getCurrentListMapNoExtraKeys!4130 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095656 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36040 0))(
  ( (Unit!36041) )
))
(declare-fun lt!489900 () Unit!36040)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70967 (_ BitVec 64) (_ BitVec 32)) Unit!36040)

(assert (=> b!1095656 (= lt!489900 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1095657 () Bool)

(declare-fun res!731209 () Bool)

(assert (=> b!1095657 (=> (not res!731209) (not e!625486))))

(assert (=> b!1095657 (= res!731209 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23846))))

(declare-fun b!1095658 () Bool)

(declare-fun res!731215 () Bool)

(assert (=> b!1095658 (=> (not res!731215) (not e!625486))))

(assert (=> b!1095658 (= res!731215 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34691 _keys!1070))))))

(declare-fun b!1095659 () Bool)

(declare-fun res!731213 () Bool)

(assert (=> b!1095659 (=> (not res!731213) (not e!625486))))

(assert (=> b!1095659 (= res!731213 (and (= (size!34692 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34691 _keys!1070) (size!34692 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!96398 res!731208) b!1095659))

(assert (= (and b!1095659 res!731213) b!1095653))

(assert (= (and b!1095653 res!731211) b!1095657))

(assert (= (and b!1095657 res!731209) b!1095658))

(assert (= (and b!1095658 res!731215) b!1095654))

(assert (= (and b!1095654 res!731214) b!1095648))

(assert (= (and b!1095648 res!731207) b!1095650))

(assert (= (and b!1095650 res!731212) b!1095651))

(assert (= (and b!1095651 res!731210) b!1095656))

(assert (= (and b!1095649 condMapEmpty!42301) mapIsEmpty!42301))

(assert (= (and b!1095649 (not condMapEmpty!42301)) mapNonEmpty!42301))

(get-info :version)

(assert (= (and mapNonEmpty!42301 ((_ is ValueCellFull!12804) mapValue!42301)) b!1095655))

(assert (= (and b!1095649 ((_ is ValueCellFull!12804) mapDefault!42301)) b!1095652))

(assert (= start!96398 b!1095649))

(declare-fun b_lambda!17635 () Bool)

(assert (=> (not b_lambda!17635) (not b!1095656)))

(declare-fun t!33871 () Bool)

(declare-fun tb!7843 () Bool)

(assert (=> (and start!96398 (= defaultEntry!882 defaultEntry!882) t!33871) tb!7843))

(declare-fun result!16209 () Bool)

(assert (=> tb!7843 (= result!16209 tp_is_empty!27027)))

(assert (=> b!1095656 t!33871))

(declare-fun b_and!36619 () Bool)

(assert (= b_and!36617 (and (=> t!33871 result!16209) b_and!36619)))

(declare-fun m!1015263 () Bool)

(assert (=> b!1095653 m!1015263))

(declare-fun m!1015265 () Bool)

(assert (=> b!1095650 m!1015265))

(declare-fun m!1015267 () Bool)

(assert (=> b!1095650 m!1015267))

(declare-fun m!1015269 () Bool)

(assert (=> mapNonEmpty!42301 m!1015269))

(declare-fun m!1015271 () Bool)

(assert (=> b!1095654 m!1015271))

(declare-fun m!1015273 () Bool)

(assert (=> start!96398 m!1015273))

(declare-fun m!1015275 () Bool)

(assert (=> start!96398 m!1015275))

(declare-fun m!1015277 () Bool)

(assert (=> start!96398 m!1015277))

(declare-fun m!1015279 () Bool)

(assert (=> b!1095656 m!1015279))

(declare-fun m!1015281 () Bool)

(assert (=> b!1095656 m!1015281))

(declare-fun m!1015283 () Bool)

(assert (=> b!1095656 m!1015283))

(declare-fun m!1015285 () Bool)

(assert (=> b!1095656 m!1015285))

(declare-fun m!1015287 () Bool)

(assert (=> b!1095656 m!1015287))

(declare-fun m!1015289 () Bool)

(assert (=> b!1095656 m!1015289))

(declare-fun m!1015291 () Bool)

(assert (=> b!1095651 m!1015291))

(declare-fun m!1015293 () Bool)

(assert (=> b!1095657 m!1015293))

(declare-fun m!1015295 () Bool)

(assert (=> b!1095648 m!1015295))

(check-sat b_and!36619 tp_is_empty!27027 (not b_next!22977) (not b!1095653) (not b!1095654) (not b!1095650) (not mapNonEmpty!42301) (not b_lambda!17635) (not b!1095651) (not start!96398) (not b!1095657) (not b!1095656))
(check-sat b_and!36619 (not b_next!22977))
