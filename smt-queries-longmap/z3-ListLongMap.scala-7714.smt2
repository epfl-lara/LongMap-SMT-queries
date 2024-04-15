; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96910 () Bool)

(assert start!96910)

(declare-fun b_free!23209 () Bool)

(declare-fun b_next!23209 () Bool)

(assert (=> start!96910 (= b_free!23209 (not b_next!23209))))

(declare-fun tp!81587 () Bool)

(declare-fun b_and!37209 () Bool)

(assert (=> start!96910 (= tp!81587 b_and!37209)))

(declare-fun b!1102466 () Bool)

(declare-fun res!735626 () Bool)

(declare-fun e!629252 () Bool)

(assert (=> b!1102466 (=> (not res!735626) (not e!629252))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1102466 (= res!735626 (validKeyInArray!0 k0!904))))

(declare-fun b!1102467 () Bool)

(declare-fun res!735629 () Bool)

(assert (=> b!1102467 (=> (not res!735629) (not e!629252))))

(declare-datatypes ((array!71348 0))(
  ( (array!71349 (arr!34335 (Array (_ BitVec 32) (_ BitVec 64))) (size!34873 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71348)

(declare-datatypes ((List!24059 0))(
  ( (Nil!24056) (Cons!24055 (h!25264 (_ BitVec 64)) (t!34305 List!24059)) )
))
(declare-fun arrayNoDuplicates!0 (array!71348 (_ BitVec 32) List!24059) Bool)

(assert (=> b!1102467 (= res!735629 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24056))))

(declare-fun b!1102468 () Bool)

(declare-fun e!629254 () Bool)

(declare-fun e!629251 () Bool)

(declare-fun mapRes!42682 () Bool)

(assert (=> b!1102468 (= e!629254 (and e!629251 mapRes!42682))))

(declare-fun condMapEmpty!42682 () Bool)

(declare-datatypes ((V!41473 0))(
  ( (V!41474 (val!13686 Int)) )
))
(declare-datatypes ((ValueCell!12920 0))(
  ( (ValueCellFull!12920 (v!16316 V!41473)) (EmptyCell!12920) )
))
(declare-datatypes ((array!71350 0))(
  ( (array!71351 (arr!34336 (Array (_ BitVec 32) ValueCell!12920)) (size!34874 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71350)

(declare-fun mapDefault!42682 () ValueCell!12920)

(assert (=> b!1102468 (= condMapEmpty!42682 (= (arr!34336 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12920)) mapDefault!42682)))))

(declare-fun b!1102469 () Bool)

(declare-fun res!735625 () Bool)

(assert (=> b!1102469 (=> (not res!735625) (not e!629252))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1102469 (= res!735625 (= (select (arr!34335 _keys!1070) i!650) k0!904))))

(declare-fun b!1102470 () Bool)

(declare-fun e!629249 () Bool)

(assert (=> b!1102470 (= e!629252 e!629249)))

(declare-fun res!735624 () Bool)

(assert (=> b!1102470 (=> (not res!735624) (not e!629249))))

(declare-fun lt!494548 () array!71348)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71348 (_ BitVec 32)) Bool)

(assert (=> b!1102470 (= res!735624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494548 mask!1414))))

(assert (=> b!1102470 (= lt!494548 (array!71349 (store (arr!34335 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34873 _keys!1070)))))

(declare-fun mapIsEmpty!42682 () Bool)

(assert (=> mapIsEmpty!42682 mapRes!42682))

(declare-fun b!1102471 () Bool)

(declare-fun res!735628 () Bool)

(assert (=> b!1102471 (=> (not res!735628) (not e!629249))))

(assert (=> b!1102471 (= res!735628 (arrayNoDuplicates!0 lt!494548 #b00000000000000000000000000000000 Nil!24056))))

(declare-fun mapNonEmpty!42682 () Bool)

(declare-fun tp!81586 () Bool)

(declare-fun e!629253 () Bool)

(assert (=> mapNonEmpty!42682 (= mapRes!42682 (and tp!81586 e!629253))))

(declare-fun mapKey!42682 () (_ BitVec 32))

(declare-fun mapValue!42682 () ValueCell!12920)

(declare-fun mapRest!42682 () (Array (_ BitVec 32) ValueCell!12920))

(assert (=> mapNonEmpty!42682 (= (arr!34336 _values!874) (store mapRest!42682 mapKey!42682 mapValue!42682))))

(declare-fun b!1102472 () Bool)

(declare-fun res!735627 () Bool)

(assert (=> b!1102472 (=> (not res!735627) (not e!629252))))

(assert (=> b!1102472 (= res!735627 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34873 _keys!1070))))))

(declare-fun b!1102473 () Bool)

(declare-fun tp_is_empty!27259 () Bool)

(assert (=> b!1102473 (= e!629253 tp_is_empty!27259)))

(declare-fun b!1102474 () Bool)

(assert (=> b!1102474 (= e!629251 tp_is_empty!27259)))

(declare-fun b!1102475 () Bool)

(declare-fun res!735631 () Bool)

(assert (=> b!1102475 (=> (not res!735631) (not e!629252))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1102475 (= res!735631 (and (= (size!34874 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34873 _keys!1070) (size!34874 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!17468 0))(
  ( (tuple2!17469 (_1!8745 (_ BitVec 64)) (_2!8745 V!41473)) )
))
(declare-datatypes ((List!24060 0))(
  ( (Nil!24057) (Cons!24056 (h!25265 tuple2!17468) (t!34306 List!24060)) )
))
(declare-datatypes ((ListLongMap!15437 0))(
  ( (ListLongMap!15438 (toList!7734 List!24060)) )
))
(declare-fun lt!494546 () ListLongMap!15437)

(declare-fun lt!494547 () ListLongMap!15437)

(declare-fun lt!494549 () Bool)

(declare-fun b!1102476 () Bool)

(assert (=> b!1102476 (= e!629249 (not (or (and (not lt!494549) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!494549) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!494549) (not (= lt!494547 lt!494546)) (bvslt i!650 (size!34874 _values!874)))))))

(assert (=> b!1102476 (= lt!494549 (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!41473)

(declare-fun minValue!831 () V!41473)

(declare-fun lt!494545 () ListLongMap!15437)

(declare-fun getCurrentListMap!4346 (array!71348 array!71350 (_ BitVec 32) (_ BitVec 32) V!41473 V!41473 (_ BitVec 32) Int) ListLongMap!15437)

(assert (=> b!1102476 (= lt!494545 (getCurrentListMap!4346 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494553 () array!71350)

(assert (=> b!1102476 (= lt!494547 (getCurrentListMap!4346 lt!494548 lt!494553 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494550 () ListLongMap!15437)

(assert (=> b!1102476 (and (= lt!494546 lt!494550) (= lt!494550 lt!494546))))

(declare-fun lt!494552 () ListLongMap!15437)

(declare-fun -!961 (ListLongMap!15437 (_ BitVec 64)) ListLongMap!15437)

(assert (=> b!1102476 (= lt!494550 (-!961 lt!494552 k0!904))))

(declare-datatypes ((Unit!36051 0))(
  ( (Unit!36052) )
))
(declare-fun lt!494554 () Unit!36051)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!235 (array!71348 array!71350 (_ BitVec 32) (_ BitVec 32) V!41473 V!41473 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36051)

(assert (=> b!1102476 (= lt!494554 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!235 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4253 (array!71348 array!71350 (_ BitVec 32) (_ BitVec 32) V!41473 V!41473 (_ BitVec 32) Int) ListLongMap!15437)

(assert (=> b!1102476 (= lt!494546 (getCurrentListMapNoExtraKeys!4253 lt!494548 lt!494553 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2322 (Int (_ BitVec 64)) V!41473)

(assert (=> b!1102476 (= lt!494553 (array!71351 (store (arr!34336 _values!874) i!650 (ValueCellFull!12920 (dynLambda!2322 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34874 _values!874)))))

(assert (=> b!1102476 (= lt!494552 (getCurrentListMapNoExtraKeys!4253 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71348 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1102476 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494551 () Unit!36051)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71348 (_ BitVec 64) (_ BitVec 32)) Unit!36051)

(assert (=> b!1102476 (= lt!494551 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!735630 () Bool)

(assert (=> start!96910 (=> (not res!735630) (not e!629252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96910 (= res!735630 (validMask!0 mask!1414))))

(assert (=> start!96910 e!629252))

(assert (=> start!96910 tp!81587))

(assert (=> start!96910 true))

(assert (=> start!96910 tp_is_empty!27259))

(declare-fun array_inv!26478 (array!71348) Bool)

(assert (=> start!96910 (array_inv!26478 _keys!1070)))

(declare-fun array_inv!26479 (array!71350) Bool)

(assert (=> start!96910 (and (array_inv!26479 _values!874) e!629254)))

(declare-fun b!1102477 () Bool)

(declare-fun res!735623 () Bool)

(assert (=> b!1102477 (=> (not res!735623) (not e!629252))))

(assert (=> b!1102477 (= res!735623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!96910 res!735630) b!1102475))

(assert (= (and b!1102475 res!735631) b!1102477))

(assert (= (and b!1102477 res!735623) b!1102467))

(assert (= (and b!1102467 res!735629) b!1102472))

(assert (= (and b!1102472 res!735627) b!1102466))

(assert (= (and b!1102466 res!735626) b!1102469))

(assert (= (and b!1102469 res!735625) b!1102470))

(assert (= (and b!1102470 res!735624) b!1102471))

(assert (= (and b!1102471 res!735628) b!1102476))

(assert (= (and b!1102468 condMapEmpty!42682) mapIsEmpty!42682))

(assert (= (and b!1102468 (not condMapEmpty!42682)) mapNonEmpty!42682))

(get-info :version)

(assert (= (and mapNonEmpty!42682 ((_ is ValueCellFull!12920) mapValue!42682)) b!1102473))

(assert (= (and b!1102468 ((_ is ValueCellFull!12920) mapDefault!42682)) b!1102474))

(assert (= start!96910 b!1102468))

(declare-fun b_lambda!18175 () Bool)

(assert (=> (not b_lambda!18175) (not b!1102476)))

(declare-fun t!34304 () Bool)

(declare-fun tb!8067 () Bool)

(assert (=> (and start!96910 (= defaultEntry!882 defaultEntry!882) t!34304) tb!8067))

(declare-fun result!16687 () Bool)

(assert (=> tb!8067 (= result!16687 tp_is_empty!27259)))

(assert (=> b!1102476 t!34304))

(declare-fun b_and!37211 () Bool)

(assert (= b_and!37209 (and (=> t!34304 result!16687) b_and!37211)))

(declare-fun m!1022305 () Bool)

(assert (=> b!1102470 m!1022305))

(declare-fun m!1022307 () Bool)

(assert (=> b!1102470 m!1022307))

(declare-fun m!1022309 () Bool)

(assert (=> b!1102471 m!1022309))

(declare-fun m!1022311 () Bool)

(assert (=> b!1102469 m!1022311))

(declare-fun m!1022313 () Bool)

(assert (=> mapNonEmpty!42682 m!1022313))

(declare-fun m!1022315 () Bool)

(assert (=> b!1102467 m!1022315))

(declare-fun m!1022317 () Bool)

(assert (=> b!1102476 m!1022317))

(declare-fun m!1022319 () Bool)

(assert (=> b!1102476 m!1022319))

(declare-fun m!1022321 () Bool)

(assert (=> b!1102476 m!1022321))

(declare-fun m!1022323 () Bool)

(assert (=> b!1102476 m!1022323))

(declare-fun m!1022325 () Bool)

(assert (=> b!1102476 m!1022325))

(declare-fun m!1022327 () Bool)

(assert (=> b!1102476 m!1022327))

(declare-fun m!1022329 () Bool)

(assert (=> b!1102476 m!1022329))

(declare-fun m!1022331 () Bool)

(assert (=> b!1102476 m!1022331))

(declare-fun m!1022333 () Bool)

(assert (=> b!1102476 m!1022333))

(declare-fun m!1022335 () Bool)

(assert (=> b!1102476 m!1022335))

(declare-fun m!1022337 () Bool)

(assert (=> b!1102477 m!1022337))

(declare-fun m!1022339 () Bool)

(assert (=> b!1102466 m!1022339))

(declare-fun m!1022341 () Bool)

(assert (=> start!96910 m!1022341))

(declare-fun m!1022343 () Bool)

(assert (=> start!96910 m!1022343))

(declare-fun m!1022345 () Bool)

(assert (=> start!96910 m!1022345))

(check-sat (not b!1102476) (not start!96910) tp_is_empty!27259 (not b_lambda!18175) (not b_next!23209) b_and!37211 (not b!1102466) (not mapNonEmpty!42682) (not b!1102470) (not b!1102471) (not b!1102467) (not b!1102477))
(check-sat b_and!37211 (not b_next!23209))
