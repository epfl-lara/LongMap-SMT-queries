; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95832 () Bool)

(assert start!95832)

(declare-fun b_free!22249 () Bool)

(declare-fun b_next!22249 () Bool)

(assert (=> start!95832 (= b_free!22249 (not b_next!22249))))

(declare-fun tp!78595 () Bool)

(declare-fun b_and!35237 () Bool)

(assert (=> start!95832 (= tp!78595 b_and!35237)))

(declare-fun b!1081325 () Bool)

(declare-fun e!618278 () Bool)

(declare-fun e!618277 () Bool)

(declare-fun mapRes!41131 () Bool)

(assert (=> b!1081325 (= e!618278 (and e!618277 mapRes!41131))))

(declare-fun condMapEmpty!41131 () Bool)

(declare-datatypes ((V!40129 0))(
  ( (V!40130 (val!13182 Int)) )
))
(declare-datatypes ((ValueCell!12416 0))(
  ( (ValueCellFull!12416 (v!15799 V!40129)) (EmptyCell!12416) )
))
(declare-datatypes ((array!69491 0))(
  ( (array!69492 (arr!33413 (Array (_ BitVec 32) ValueCell!12416)) (size!33950 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69491)

(declare-fun mapDefault!41131 () ValueCell!12416)

(assert (=> b!1081325 (= condMapEmpty!41131 (= (arr!33413 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12416)) mapDefault!41131)))))

(declare-fun b!1081326 () Bool)

(declare-fun e!618274 () Bool)

(declare-fun e!618275 () Bool)

(assert (=> b!1081326 (= e!618274 e!618275)))

(declare-fun res!720282 () Bool)

(assert (=> b!1081326 (=> (not res!720282) (not e!618275))))

(declare-datatypes ((array!69493 0))(
  ( (array!69494 (arr!33414 (Array (_ BitVec 32) (_ BitVec 64))) (size!33951 (_ BitVec 32))) )
))
(declare-fun lt!479422 () array!69493)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69493 (_ BitVec 32)) Bool)

(assert (=> b!1081326 (= res!720282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479422 mask!1414))))

(declare-fun _keys!1070 () array!69493)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081326 (= lt!479422 (array!69494 (store (arr!33414 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33951 _keys!1070)))))

(declare-fun mapIsEmpty!41131 () Bool)

(assert (=> mapIsEmpty!41131 mapRes!41131))

(declare-fun b!1081327 () Bool)

(declare-fun res!720285 () Bool)

(assert (=> b!1081327 (=> (not res!720285) (not e!618274))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081327 (= res!720285 (validKeyInArray!0 k0!904))))

(declare-fun b!1081328 () Bool)

(declare-fun res!720288 () Bool)

(assert (=> b!1081328 (=> (not res!720288) (not e!618274))))

(declare-datatypes ((List!23279 0))(
  ( (Nil!23276) (Cons!23275 (h!24493 (_ BitVec 64)) (t!32630 List!23279)) )
))
(declare-fun arrayNoDuplicates!0 (array!69493 (_ BitVec 32) List!23279) Bool)

(assert (=> b!1081328 (= res!720288 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23276))))

(declare-fun b!1081329 () Bool)

(declare-fun res!720284 () Bool)

(assert (=> b!1081329 (=> (not res!720284) (not e!618274))))

(assert (=> b!1081329 (= res!720284 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33951 _keys!1070))))))

(declare-fun b!1081330 () Bool)

(declare-fun tp_is_empty!26251 () Bool)

(assert (=> b!1081330 (= e!618277 tp_is_empty!26251)))

(declare-fun b!1081331 () Bool)

(assert (=> b!1081331 (= e!618275 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40129)

(declare-datatypes ((tuple2!16686 0))(
  ( (tuple2!16687 (_1!8354 (_ BitVec 64)) (_2!8354 V!40129)) )
))
(declare-datatypes ((List!23280 0))(
  ( (Nil!23277) (Cons!23276 (h!24494 tuple2!16686) (t!32631 List!23280)) )
))
(declare-datatypes ((ListLongMap!14663 0))(
  ( (ListLongMap!14664 (toList!7347 List!23280)) )
))
(declare-fun lt!479423 () ListLongMap!14663)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40129)

(declare-fun getCurrentListMapNoExtraKeys!3924 (array!69493 array!69491 (_ BitVec 32) (_ BitVec 32) V!40129 V!40129 (_ BitVec 32) Int) ListLongMap!14663)

(assert (=> b!1081331 (= lt!479423 (getCurrentListMapNoExtraKeys!3924 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081331 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35485 0))(
  ( (Unit!35486) )
))
(declare-fun lt!479424 () Unit!35485)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69493 (_ BitVec 64) (_ BitVec 32)) Unit!35485)

(assert (=> b!1081331 (= lt!479424 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!41131 () Bool)

(declare-fun tp!78596 () Bool)

(declare-fun e!618276 () Bool)

(assert (=> mapNonEmpty!41131 (= mapRes!41131 (and tp!78596 e!618276))))

(declare-fun mapValue!41131 () ValueCell!12416)

(declare-fun mapKey!41131 () (_ BitVec 32))

(declare-fun mapRest!41131 () (Array (_ BitVec 32) ValueCell!12416))

(assert (=> mapNonEmpty!41131 (= (arr!33413 _values!874) (store mapRest!41131 mapKey!41131 mapValue!41131))))

(declare-fun b!1081324 () Bool)

(declare-fun res!720287 () Bool)

(assert (=> b!1081324 (=> (not res!720287) (not e!618274))))

(assert (=> b!1081324 (= res!720287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!720280 () Bool)

(assert (=> start!95832 (=> (not res!720280) (not e!618274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95832 (= res!720280 (validMask!0 mask!1414))))

(assert (=> start!95832 e!618274))

(assert (=> start!95832 tp!78595))

(assert (=> start!95832 true))

(assert (=> start!95832 tp_is_empty!26251))

(declare-fun array_inv!25838 (array!69493) Bool)

(assert (=> start!95832 (array_inv!25838 _keys!1070)))

(declare-fun array_inv!25839 (array!69491) Bool)

(assert (=> start!95832 (and (array_inv!25839 _values!874) e!618278)))

(declare-fun b!1081332 () Bool)

(declare-fun res!720286 () Bool)

(assert (=> b!1081332 (=> (not res!720286) (not e!618274))))

(assert (=> b!1081332 (= res!720286 (= (select (arr!33414 _keys!1070) i!650) k0!904))))

(declare-fun b!1081333 () Bool)

(declare-fun res!720283 () Bool)

(assert (=> b!1081333 (=> (not res!720283) (not e!618274))))

(assert (=> b!1081333 (= res!720283 (and (= (size!33950 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33951 _keys!1070) (size!33950 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081334 () Bool)

(assert (=> b!1081334 (= e!618276 tp_is_empty!26251)))

(declare-fun b!1081335 () Bool)

(declare-fun res!720281 () Bool)

(assert (=> b!1081335 (=> (not res!720281) (not e!618275))))

(assert (=> b!1081335 (= res!720281 (arrayNoDuplicates!0 lt!479422 #b00000000000000000000000000000000 Nil!23276))))

(assert (= (and start!95832 res!720280) b!1081333))

(assert (= (and b!1081333 res!720283) b!1081324))

(assert (= (and b!1081324 res!720287) b!1081328))

(assert (= (and b!1081328 res!720288) b!1081329))

(assert (= (and b!1081329 res!720284) b!1081327))

(assert (= (and b!1081327 res!720285) b!1081332))

(assert (= (and b!1081332 res!720286) b!1081326))

(assert (= (and b!1081326 res!720282) b!1081335))

(assert (= (and b!1081335 res!720281) b!1081331))

(assert (= (and b!1081325 condMapEmpty!41131) mapIsEmpty!41131))

(assert (= (and b!1081325 (not condMapEmpty!41131)) mapNonEmpty!41131))

(get-info :version)

(assert (= (and mapNonEmpty!41131 ((_ is ValueCellFull!12416) mapValue!41131)) b!1081334))

(assert (= (and b!1081325 ((_ is ValueCellFull!12416) mapDefault!41131)) b!1081330))

(assert (= start!95832 b!1081325))

(declare-fun m!999725 () Bool)

(assert (=> b!1081328 m!999725))

(declare-fun m!999727 () Bool)

(assert (=> b!1081324 m!999727))

(declare-fun m!999729 () Bool)

(assert (=> b!1081335 m!999729))

(declare-fun m!999731 () Bool)

(assert (=> b!1081331 m!999731))

(declare-fun m!999733 () Bool)

(assert (=> b!1081331 m!999733))

(declare-fun m!999735 () Bool)

(assert (=> b!1081331 m!999735))

(declare-fun m!999737 () Bool)

(assert (=> b!1081332 m!999737))

(declare-fun m!999739 () Bool)

(assert (=> b!1081326 m!999739))

(declare-fun m!999741 () Bool)

(assert (=> b!1081326 m!999741))

(declare-fun m!999743 () Bool)

(assert (=> mapNonEmpty!41131 m!999743))

(declare-fun m!999745 () Bool)

(assert (=> b!1081327 m!999745))

(declare-fun m!999747 () Bool)

(assert (=> start!95832 m!999747))

(declare-fun m!999749 () Bool)

(assert (=> start!95832 m!999749))

(declare-fun m!999751 () Bool)

(assert (=> start!95832 m!999751))

(check-sat (not mapNonEmpty!41131) (not b!1081328) (not b!1081327) b_and!35237 (not start!95832) (not b!1081331) (not b!1081326) tp_is_empty!26251 (not b!1081324) (not b_next!22249) (not b!1081335))
(check-sat b_and!35237 (not b_next!22249))
