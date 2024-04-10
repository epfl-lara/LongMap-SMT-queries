; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96294 () Bool)

(assert start!96294)

(declare-fun b_free!22947 () Bool)

(declare-fun b_next!22947 () Bool)

(assert (=> start!96294 (= b_free!22947 (not b_next!22947))))

(declare-fun tp!80689 () Bool)

(declare-fun b_and!36569 () Bool)

(assert (=> start!96294 (= tp!80689 b_and!36569)))

(declare-fun b!1094267 () Bool)

(declare-fun res!730245 () Bool)

(declare-fun e!624739 () Bool)

(assert (=> b!1094267 (=> (not res!730245) (not e!624739))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094267 (= res!730245 (validKeyInArray!0 k0!904))))

(declare-fun b!1094268 () Bool)

(declare-fun e!624740 () Bool)

(declare-fun e!624737 () Bool)

(declare-fun mapRes!42178 () Bool)

(assert (=> b!1094268 (= e!624740 (and e!624737 mapRes!42178))))

(declare-fun condMapEmpty!42178 () Bool)

(declare-datatypes ((V!41059 0))(
  ( (V!41060 (val!13531 Int)) )
))
(declare-datatypes ((ValueCell!12765 0))(
  ( (ValueCellFull!12765 (v!16152 V!41059)) (EmptyCell!12765) )
))
(declare-datatypes ((array!70813 0))(
  ( (array!70814 (arr!34080 (Array (_ BitVec 32) ValueCell!12765)) (size!34616 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70813)

(declare-fun mapDefault!42178 () ValueCell!12765)

(assert (=> b!1094268 (= condMapEmpty!42178 (= (arr!34080 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12765)) mapDefault!42178)))))

(declare-fun b!1094269 () Bool)

(declare-fun tp_is_empty!26949 () Bool)

(assert (=> b!1094269 (= e!624737 tp_is_empty!26949)))

(declare-fun lt!489597 () Bool)

(declare-datatypes ((tuple2!17214 0))(
  ( (tuple2!17215 (_1!8618 (_ BitVec 64)) (_2!8618 V!41059)) )
))
(declare-datatypes ((List!23811 0))(
  ( (Nil!23808) (Cons!23807 (h!25016 tuple2!17214) (t!33816 List!23811)) )
))
(declare-datatypes ((ListLongMap!15183 0))(
  ( (ListLongMap!15184 (toList!7607 List!23811)) )
))
(declare-fun lt!489590 () ListLongMap!15183)

(declare-datatypes ((array!70815 0))(
  ( (array!70816 (arr!34081 (Array (_ BitVec 32) (_ BitVec 64))) (size!34617 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70815)

(declare-fun lt!489596 () ListLongMap!15183)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun b!1094270 () Bool)

(declare-fun e!624735 () Bool)

(assert (=> b!1094270 (= e!624735 (not (or (and (not lt!489597) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!489597) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!489597) (not (= lt!489596 lt!489590)) (bvsle #b00000000000000000000000000000000 (size!34617 _keys!1070)))))))

(assert (=> b!1094270 (= lt!489597 (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!489598 () ListLongMap!15183)

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41059)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41059)

(declare-fun getCurrentListMap!4363 (array!70815 array!70813 (_ BitVec 32) (_ BitVec 32) V!41059 V!41059 (_ BitVec 32) Int) ListLongMap!15183)

(assert (=> b!1094270 (= lt!489598 (getCurrentListMap!4363 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489591 () array!70815)

(declare-fun lt!489592 () array!70813)

(assert (=> b!1094270 (= lt!489596 (getCurrentListMap!4363 lt!489591 lt!489592 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489589 () ListLongMap!15183)

(assert (=> b!1094270 (and (= lt!489590 lt!489589) (= lt!489589 lt!489590))))

(declare-fun lt!489595 () ListLongMap!15183)

(declare-fun -!926 (ListLongMap!15183 (_ BitVec 64)) ListLongMap!15183)

(assert (=> b!1094270 (= lt!489589 (-!926 lt!489595 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36018 0))(
  ( (Unit!36019) )
))
(declare-fun lt!489594 () Unit!36018)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!182 (array!70815 array!70813 (_ BitVec 32) (_ BitVec 32) V!41059 V!41059 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36018)

(assert (=> b!1094270 (= lt!489594 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!182 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4123 (array!70815 array!70813 (_ BitVec 32) (_ BitVec 32) V!41059 V!41059 (_ BitVec 32) Int) ListLongMap!15183)

(assert (=> b!1094270 (= lt!489590 (getCurrentListMapNoExtraKeys!4123 lt!489591 lt!489592 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2260 (Int (_ BitVec 64)) V!41059)

(assert (=> b!1094270 (= lt!489592 (array!70814 (store (arr!34080 _values!874) i!650 (ValueCellFull!12765 (dynLambda!2260 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34616 _values!874)))))

(assert (=> b!1094270 (= lt!489595 (getCurrentListMapNoExtraKeys!4123 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1094270 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489593 () Unit!36018)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70815 (_ BitVec 64) (_ BitVec 32)) Unit!36018)

(assert (=> b!1094270 (= lt!489593 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!730250 () Bool)

(assert (=> start!96294 (=> (not res!730250) (not e!624739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96294 (= res!730250 (validMask!0 mask!1414))))

(assert (=> start!96294 e!624739))

(assert (=> start!96294 tp!80689))

(assert (=> start!96294 true))

(assert (=> start!96294 tp_is_empty!26949))

(declare-fun array_inv!26264 (array!70815) Bool)

(assert (=> start!96294 (array_inv!26264 _keys!1070)))

(declare-fun array_inv!26265 (array!70813) Bool)

(assert (=> start!96294 (and (array_inv!26265 _values!874) e!624740)))

(declare-fun b!1094271 () Bool)

(declare-fun res!730246 () Bool)

(assert (=> b!1094271 (=> (not res!730246) (not e!624739))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70815 (_ BitVec 32)) Bool)

(assert (=> b!1094271 (= res!730246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094272 () Bool)

(assert (=> b!1094272 (= e!624739 e!624735)))

(declare-fun res!730249 () Bool)

(assert (=> b!1094272 (=> (not res!730249) (not e!624735))))

(assert (=> b!1094272 (= res!730249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489591 mask!1414))))

(assert (=> b!1094272 (= lt!489591 (array!70816 (store (arr!34081 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34617 _keys!1070)))))

(declare-fun b!1094273 () Bool)

(declare-fun e!624736 () Bool)

(assert (=> b!1094273 (= e!624736 tp_is_empty!26949)))

(declare-fun mapIsEmpty!42178 () Bool)

(assert (=> mapIsEmpty!42178 mapRes!42178))

(declare-fun b!1094274 () Bool)

(declare-fun res!730247 () Bool)

(assert (=> b!1094274 (=> (not res!730247) (not e!624739))))

(assert (=> b!1094274 (= res!730247 (and (= (size!34616 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34617 _keys!1070) (size!34616 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094275 () Bool)

(declare-fun res!730243 () Bool)

(assert (=> b!1094275 (=> (not res!730243) (not e!624739))))

(assert (=> b!1094275 (= res!730243 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34617 _keys!1070))))))

(declare-fun mapNonEmpty!42178 () Bool)

(declare-fun tp!80690 () Bool)

(assert (=> mapNonEmpty!42178 (= mapRes!42178 (and tp!80690 e!624736))))

(declare-fun mapValue!42178 () ValueCell!12765)

(declare-fun mapKey!42178 () (_ BitVec 32))

(declare-fun mapRest!42178 () (Array (_ BitVec 32) ValueCell!12765))

(assert (=> mapNonEmpty!42178 (= (arr!34080 _values!874) (store mapRest!42178 mapKey!42178 mapValue!42178))))

(declare-fun b!1094276 () Bool)

(declare-fun res!730251 () Bool)

(assert (=> b!1094276 (=> (not res!730251) (not e!624739))))

(declare-datatypes ((List!23812 0))(
  ( (Nil!23809) (Cons!23808 (h!25017 (_ BitVec 64)) (t!33817 List!23812)) )
))
(declare-fun arrayNoDuplicates!0 (array!70815 (_ BitVec 32) List!23812) Bool)

(assert (=> b!1094276 (= res!730251 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23809))))

(declare-fun b!1094277 () Bool)

(declare-fun res!730248 () Bool)

(assert (=> b!1094277 (=> (not res!730248) (not e!624735))))

(assert (=> b!1094277 (= res!730248 (arrayNoDuplicates!0 lt!489591 #b00000000000000000000000000000000 Nil!23809))))

(declare-fun b!1094278 () Bool)

(declare-fun res!730244 () Bool)

(assert (=> b!1094278 (=> (not res!730244) (not e!624739))))

(assert (=> b!1094278 (= res!730244 (= (select (arr!34081 _keys!1070) i!650) k0!904))))

(assert (= (and start!96294 res!730250) b!1094274))

(assert (= (and b!1094274 res!730247) b!1094271))

(assert (= (and b!1094271 res!730246) b!1094276))

(assert (= (and b!1094276 res!730251) b!1094275))

(assert (= (and b!1094275 res!730243) b!1094267))

(assert (= (and b!1094267 res!730245) b!1094278))

(assert (= (and b!1094278 res!730244) b!1094272))

(assert (= (and b!1094272 res!730249) b!1094277))

(assert (= (and b!1094277 res!730248) b!1094270))

(assert (= (and b!1094268 condMapEmpty!42178) mapIsEmpty!42178))

(assert (= (and b!1094268 (not condMapEmpty!42178)) mapNonEmpty!42178))

(get-info :version)

(assert (= (and mapNonEmpty!42178 ((_ is ValueCellFull!12765) mapValue!42178)) b!1094273))

(assert (= (and b!1094268 ((_ is ValueCellFull!12765) mapDefault!42178)) b!1094269))

(assert (= start!96294 b!1094268))

(declare-fun b_lambda!17617 () Bool)

(assert (=> (not b_lambda!17617) (not b!1094270)))

(declare-fun t!33815 () Bool)

(declare-fun tb!7825 () Bool)

(assert (=> (and start!96294 (= defaultEntry!882 defaultEntry!882) t!33815) tb!7825))

(declare-fun result!16169 () Bool)

(assert (=> tb!7825 (= result!16169 tp_is_empty!26949)))

(assert (=> b!1094270 t!33815))

(declare-fun b_and!36571 () Bool)

(assert (= b_and!36569 (and (=> t!33815 result!16169) b_and!36571)))

(declare-fun m!1014223 () Bool)

(assert (=> b!1094271 m!1014223))

(declare-fun m!1014225 () Bool)

(assert (=> b!1094267 m!1014225))

(declare-fun m!1014227 () Bool)

(assert (=> b!1094277 m!1014227))

(declare-fun m!1014229 () Bool)

(assert (=> start!96294 m!1014229))

(declare-fun m!1014231 () Bool)

(assert (=> start!96294 m!1014231))

(declare-fun m!1014233 () Bool)

(assert (=> start!96294 m!1014233))

(declare-fun m!1014235 () Bool)

(assert (=> mapNonEmpty!42178 m!1014235))

(declare-fun m!1014237 () Bool)

(assert (=> b!1094278 m!1014237))

(declare-fun m!1014239 () Bool)

(assert (=> b!1094270 m!1014239))

(declare-fun m!1014241 () Bool)

(assert (=> b!1094270 m!1014241))

(declare-fun m!1014243 () Bool)

(assert (=> b!1094270 m!1014243))

(declare-fun m!1014245 () Bool)

(assert (=> b!1094270 m!1014245))

(declare-fun m!1014247 () Bool)

(assert (=> b!1094270 m!1014247))

(declare-fun m!1014249 () Bool)

(assert (=> b!1094270 m!1014249))

(declare-fun m!1014251 () Bool)

(assert (=> b!1094270 m!1014251))

(declare-fun m!1014253 () Bool)

(assert (=> b!1094270 m!1014253))

(declare-fun m!1014255 () Bool)

(assert (=> b!1094270 m!1014255))

(declare-fun m!1014257 () Bool)

(assert (=> b!1094270 m!1014257))

(declare-fun m!1014259 () Bool)

(assert (=> b!1094272 m!1014259))

(declare-fun m!1014261 () Bool)

(assert (=> b!1094272 m!1014261))

(declare-fun m!1014263 () Bool)

(assert (=> b!1094276 m!1014263))

(check-sat (not b!1094277) (not b!1094272) (not b_next!22947) (not b_lambda!17617) (not mapNonEmpty!42178) (not start!96294) (not b!1094276) (not b!1094270) b_and!36571 (not b!1094271) tp_is_empty!26949 (not b!1094267))
(check-sat b_and!36571 (not b_next!22947))
