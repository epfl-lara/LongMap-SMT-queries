; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95616 () Bool)

(assert start!95616)

(declare-fun b_free!22269 () Bool)

(declare-fun b_next!22269 () Bool)

(assert (=> start!95616 (= b_free!22269 (not b_next!22269))))

(declare-fun tp!78655 () Bool)

(declare-fun b_and!35247 () Bool)

(assert (=> start!95616 (= tp!78655 b_and!35247)))

(declare-fun b!1080357 () Bool)

(declare-fun res!720028 () Bool)

(declare-fun e!617603 () Bool)

(assert (=> b!1080357 (=> (not res!720028) (not e!617603))))

(declare-datatypes ((array!69493 0))(
  ( (array!69494 (arr!33420 (Array (_ BitVec 32) (_ BitVec 64))) (size!33956 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69493)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1080357 (= res!720028 (= (select (arr!33420 _keys!1070) i!650) k0!904))))

(declare-fun b!1080358 () Bool)

(declare-fun e!617598 () Bool)

(assert (=> b!1080358 (= e!617598 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40155 0))(
  ( (V!40156 (val!13192 Int)) )
))
(declare-datatypes ((tuple2!16706 0))(
  ( (tuple2!16707 (_1!8364 (_ BitVec 64)) (_2!8364 V!40155)) )
))
(declare-datatypes ((List!23286 0))(
  ( (Nil!23283) (Cons!23282 (h!24491 tuple2!16706) (t!32645 List!23286)) )
))
(declare-datatypes ((ListLongMap!14675 0))(
  ( (ListLongMap!14676 (toList!7353 List!23286)) )
))
(declare-fun lt!478998 () ListLongMap!14675)

(declare-fun minValue!831 () V!40155)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40155)

(declare-datatypes ((ValueCell!12426 0))(
  ( (ValueCellFull!12426 (v!15813 V!40155)) (EmptyCell!12426) )
))
(declare-datatypes ((array!69495 0))(
  ( (array!69496 (arr!33421 (Array (_ BitVec 32) ValueCell!12426)) (size!33957 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69495)

(declare-fun getCurrentListMapNoExtraKeys!3901 (array!69493 array!69495 (_ BitVec 32) (_ BitVec 32) V!40155 V!40155 (_ BitVec 32) Int) ListLongMap!14675)

(assert (=> b!1080358 (= lt!478998 (getCurrentListMapNoExtraKeys!3901 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080358 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35526 0))(
  ( (Unit!35527) )
))
(declare-fun lt!478999 () Unit!35526)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69493 (_ BitVec 64) (_ BitVec 32)) Unit!35526)

(assert (=> b!1080358 (= lt!478999 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1080359 () Bool)

(declare-fun e!617602 () Bool)

(declare-fun tp_is_empty!26271 () Bool)

(assert (=> b!1080359 (= e!617602 tp_is_empty!26271)))

(declare-fun res!720035 () Bool)

(assert (=> start!95616 (=> (not res!720035) (not e!617603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95616 (= res!720035 (validMask!0 mask!1414))))

(assert (=> start!95616 e!617603))

(assert (=> start!95616 tp!78655))

(assert (=> start!95616 true))

(assert (=> start!95616 tp_is_empty!26271))

(declare-fun array_inv!25804 (array!69493) Bool)

(assert (=> start!95616 (array_inv!25804 _keys!1070)))

(declare-fun e!617601 () Bool)

(declare-fun array_inv!25805 (array!69495) Bool)

(assert (=> start!95616 (and (array_inv!25805 _values!874) e!617601)))

(declare-fun b!1080360 () Bool)

(declare-fun res!720032 () Bool)

(assert (=> b!1080360 (=> (not res!720032) (not e!617598))))

(declare-fun lt!478997 () array!69493)

(declare-datatypes ((List!23287 0))(
  ( (Nil!23284) (Cons!23283 (h!24492 (_ BitVec 64)) (t!32646 List!23287)) )
))
(declare-fun arrayNoDuplicates!0 (array!69493 (_ BitVec 32) List!23287) Bool)

(assert (=> b!1080360 (= res!720032 (arrayNoDuplicates!0 lt!478997 #b00000000000000000000000000000000 Nil!23284))))

(declare-fun b!1080361 () Bool)

(declare-fun mapRes!41161 () Bool)

(assert (=> b!1080361 (= e!617601 (and e!617602 mapRes!41161))))

(declare-fun condMapEmpty!41161 () Bool)

(declare-fun mapDefault!41161 () ValueCell!12426)

(assert (=> b!1080361 (= condMapEmpty!41161 (= (arr!33421 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12426)) mapDefault!41161)))))

(declare-fun b!1080362 () Bool)

(declare-fun res!720036 () Bool)

(assert (=> b!1080362 (=> (not res!720036) (not e!617603))))

(assert (=> b!1080362 (= res!720036 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23284))))

(declare-fun mapIsEmpty!41161 () Bool)

(assert (=> mapIsEmpty!41161 mapRes!41161))

(declare-fun b!1080363 () Bool)

(declare-fun res!720033 () Bool)

(assert (=> b!1080363 (=> (not res!720033) (not e!617603))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080363 (= res!720033 (validKeyInArray!0 k0!904))))

(declare-fun b!1080364 () Bool)

(declare-fun res!720034 () Bool)

(assert (=> b!1080364 (=> (not res!720034) (not e!617603))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69493 (_ BitVec 32)) Bool)

(assert (=> b!1080364 (= res!720034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41161 () Bool)

(declare-fun tp!78656 () Bool)

(declare-fun e!617600 () Bool)

(assert (=> mapNonEmpty!41161 (= mapRes!41161 (and tp!78656 e!617600))))

(declare-fun mapKey!41161 () (_ BitVec 32))

(declare-fun mapRest!41161 () (Array (_ BitVec 32) ValueCell!12426))

(declare-fun mapValue!41161 () ValueCell!12426)

(assert (=> mapNonEmpty!41161 (= (arr!33421 _values!874) (store mapRest!41161 mapKey!41161 mapValue!41161))))

(declare-fun b!1080365 () Bool)

(declare-fun res!720031 () Bool)

(assert (=> b!1080365 (=> (not res!720031) (not e!617603))))

(assert (=> b!1080365 (= res!720031 (and (= (size!33957 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33956 _keys!1070) (size!33957 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1080366 () Bool)

(declare-fun res!720030 () Bool)

(assert (=> b!1080366 (=> (not res!720030) (not e!617603))))

(assert (=> b!1080366 (= res!720030 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33956 _keys!1070))))))

(declare-fun b!1080367 () Bool)

(assert (=> b!1080367 (= e!617603 e!617598)))

(declare-fun res!720029 () Bool)

(assert (=> b!1080367 (=> (not res!720029) (not e!617598))))

(assert (=> b!1080367 (= res!720029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478997 mask!1414))))

(assert (=> b!1080367 (= lt!478997 (array!69494 (store (arr!33420 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33956 _keys!1070)))))

(declare-fun b!1080368 () Bool)

(assert (=> b!1080368 (= e!617600 tp_is_empty!26271)))

(assert (= (and start!95616 res!720035) b!1080365))

(assert (= (and b!1080365 res!720031) b!1080364))

(assert (= (and b!1080364 res!720034) b!1080362))

(assert (= (and b!1080362 res!720036) b!1080366))

(assert (= (and b!1080366 res!720030) b!1080363))

(assert (= (and b!1080363 res!720033) b!1080357))

(assert (= (and b!1080357 res!720028) b!1080367))

(assert (= (and b!1080367 res!720029) b!1080360))

(assert (= (and b!1080360 res!720032) b!1080358))

(assert (= (and b!1080361 condMapEmpty!41161) mapIsEmpty!41161))

(assert (= (and b!1080361 (not condMapEmpty!41161)) mapNonEmpty!41161))

(get-info :version)

(assert (= (and mapNonEmpty!41161 ((_ is ValueCellFull!12426) mapValue!41161)) b!1080368))

(assert (= (and b!1080361 ((_ is ValueCellFull!12426) mapDefault!41161)) b!1080359))

(assert (= start!95616 b!1080361))

(declare-fun m!998333 () Bool)

(assert (=> b!1080367 m!998333))

(declare-fun m!998335 () Bool)

(assert (=> b!1080367 m!998335))

(declare-fun m!998337 () Bool)

(assert (=> b!1080357 m!998337))

(declare-fun m!998339 () Bool)

(assert (=> start!95616 m!998339))

(declare-fun m!998341 () Bool)

(assert (=> start!95616 m!998341))

(declare-fun m!998343 () Bool)

(assert (=> start!95616 m!998343))

(declare-fun m!998345 () Bool)

(assert (=> b!1080360 m!998345))

(declare-fun m!998347 () Bool)

(assert (=> b!1080362 m!998347))

(declare-fun m!998349 () Bool)

(assert (=> b!1080358 m!998349))

(declare-fun m!998351 () Bool)

(assert (=> b!1080358 m!998351))

(declare-fun m!998353 () Bool)

(assert (=> b!1080358 m!998353))

(declare-fun m!998355 () Bool)

(assert (=> mapNonEmpty!41161 m!998355))

(declare-fun m!998357 () Bool)

(assert (=> b!1080363 m!998357))

(declare-fun m!998359 () Bool)

(assert (=> b!1080364 m!998359))

(check-sat (not b!1080360) (not start!95616) (not b!1080367) (not b!1080362) tp_is_empty!26271 (not mapNonEmpty!41161) (not b_next!22269) b_and!35247 (not b!1080358) (not b!1080363) (not b!1080364))
(check-sat b_and!35247 (not b_next!22269))
