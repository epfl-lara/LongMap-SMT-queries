; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95682 () Bool)

(assert start!95682)

(declare-fun b_free!22335 () Bool)

(declare-fun b_next!22335 () Bool)

(assert (=> start!95682 (= b_free!22335 (not b_next!22335))))

(declare-fun tp!78854 () Bool)

(declare-fun b_and!35345 () Bool)

(assert (=> start!95682 (= tp!78854 b_and!35345)))

(declare-fun b!1081577 () Bool)

(declare-fun res!720927 () Bool)

(declare-fun e!618194 () Bool)

(assert (=> b!1081577 (=> (not res!720927) (not e!618194))))

(declare-datatypes ((array!69621 0))(
  ( (array!69622 (arr!33484 (Array (_ BitVec 32) (_ BitVec 64))) (size!34020 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69621)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081577 (= res!720927 (= (select (arr!33484 _keys!1070) i!650) k0!904))))

(declare-fun res!720926 () Bool)

(assert (=> start!95682 (=> (not res!720926) (not e!618194))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95682 (= res!720926 (validMask!0 mask!1414))))

(assert (=> start!95682 e!618194))

(assert (=> start!95682 tp!78854))

(assert (=> start!95682 true))

(declare-fun tp_is_empty!26337 () Bool)

(assert (=> start!95682 tp_is_empty!26337))

(declare-fun array_inv!25850 (array!69621) Bool)

(assert (=> start!95682 (array_inv!25850 _keys!1070)))

(declare-datatypes ((V!40243 0))(
  ( (V!40244 (val!13225 Int)) )
))
(declare-datatypes ((ValueCell!12459 0))(
  ( (ValueCellFull!12459 (v!15846 V!40243)) (EmptyCell!12459) )
))
(declare-datatypes ((array!69623 0))(
  ( (array!69624 (arr!33485 (Array (_ BitVec 32) ValueCell!12459)) (size!34021 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69623)

(declare-fun e!618192 () Bool)

(declare-fun array_inv!25851 (array!69623) Bool)

(assert (=> start!95682 (and (array_inv!25851 _values!874) e!618192)))

(declare-fun mapIsEmpty!41260 () Bool)

(declare-fun mapRes!41260 () Bool)

(assert (=> mapIsEmpty!41260 mapRes!41260))

(declare-fun b!1081578 () Bool)

(declare-fun res!720922 () Bool)

(assert (=> b!1081578 (=> (not res!720922) (not e!618194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081578 (= res!720922 (validKeyInArray!0 k0!904))))

(declare-fun b!1081579 () Bool)

(declare-fun e!618195 () Bool)

(assert (=> b!1081579 (= e!618195 tp_is_empty!26337)))

(declare-fun b!1081580 () Bool)

(declare-fun e!618193 () Bool)

(assert (=> b!1081580 (= e!618194 e!618193)))

(declare-fun res!720919 () Bool)

(assert (=> b!1081580 (=> (not res!720919) (not e!618193))))

(declare-fun lt!479346 () array!69621)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69621 (_ BitVec 32)) Bool)

(assert (=> b!1081580 (= res!720919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479346 mask!1414))))

(assert (=> b!1081580 (= lt!479346 (array!69622 (store (arr!33484 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34020 _keys!1070)))))

(declare-fun b!1081581 () Bool)

(declare-fun res!720920 () Bool)

(assert (=> b!1081581 (=> (not res!720920) (not e!618194))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1081581 (= res!720920 (and (= (size!34021 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34020 _keys!1070) (size!34021 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081582 () Bool)

(declare-fun res!720921 () Bool)

(assert (=> b!1081582 (=> (not res!720921) (not e!618194))))

(assert (=> b!1081582 (= res!720921 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34020 _keys!1070))))))

(declare-fun b!1081583 () Bool)

(declare-fun res!720925 () Bool)

(assert (=> b!1081583 (=> (not res!720925) (not e!618194))))

(assert (=> b!1081583 (= res!720925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081584 () Bool)

(declare-fun res!720923 () Bool)

(assert (=> b!1081584 (=> (not res!720923) (not e!618194))))

(declare-datatypes ((List!23336 0))(
  ( (Nil!23333) (Cons!23332 (h!24541 (_ BitVec 64)) (t!32729 List!23336)) )
))
(declare-fun arrayNoDuplicates!0 (array!69621 (_ BitVec 32) List!23336) Bool)

(assert (=> b!1081584 (= res!720923 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23333))))

(declare-fun b!1081585 () Bool)

(assert (=> b!1081585 (= e!618192 (and e!618195 mapRes!41260))))

(declare-fun condMapEmpty!41260 () Bool)

(declare-fun mapDefault!41260 () ValueCell!12459)

(assert (=> b!1081585 (= condMapEmpty!41260 (= (arr!33485 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12459)) mapDefault!41260)))))

(declare-fun b!1081586 () Bool)

(declare-fun e!618197 () Bool)

(assert (=> b!1081586 (= e!618197 tp_is_empty!26337)))

(declare-fun b!1081587 () Bool)

(declare-fun res!720924 () Bool)

(assert (=> b!1081587 (=> (not res!720924) (not e!618193))))

(assert (=> b!1081587 (= res!720924 (arrayNoDuplicates!0 lt!479346 #b00000000000000000000000000000000 Nil!23333))))

(declare-fun mapNonEmpty!41260 () Bool)

(declare-fun tp!78853 () Bool)

(assert (=> mapNonEmpty!41260 (= mapRes!41260 (and tp!78853 e!618197))))

(declare-fun mapValue!41260 () ValueCell!12459)

(declare-fun mapRest!41260 () (Array (_ BitVec 32) ValueCell!12459))

(declare-fun mapKey!41260 () (_ BitVec 32))

(assert (=> mapNonEmpty!41260 (= (arr!33485 _values!874) (store mapRest!41260 mapKey!41260 mapValue!41260))))

(declare-fun b!1081588 () Bool)

(assert (=> b!1081588 (= e!618193 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40243)

(declare-fun zeroValue!831 () V!40243)

(declare-datatypes ((tuple2!16758 0))(
  ( (tuple2!16759 (_1!8390 (_ BitVec 64)) (_2!8390 V!40243)) )
))
(declare-datatypes ((List!23337 0))(
  ( (Nil!23334) (Cons!23333 (h!24542 tuple2!16758) (t!32730 List!23337)) )
))
(declare-datatypes ((ListLongMap!14727 0))(
  ( (ListLongMap!14728 (toList!7379 List!23337)) )
))
(declare-fun lt!479345 () ListLongMap!14727)

(declare-fun getCurrentListMapNoExtraKeys!3927 (array!69621 array!69623 (_ BitVec 32) (_ BitVec 32) V!40243 V!40243 (_ BitVec 32) Int) ListLongMap!14727)

(declare-fun dynLambda!2064 (Int (_ BitVec 64)) V!40243)

(assert (=> b!1081588 (= lt!479345 (getCurrentListMapNoExtraKeys!3927 lt!479346 (array!69624 (store (arr!33485 _values!874) i!650 (ValueCellFull!12459 (dynLambda!2064 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34021 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479344 () ListLongMap!14727)

(assert (=> b!1081588 (= lt!479344 (getCurrentListMapNoExtraKeys!3927 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081588 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35578 0))(
  ( (Unit!35579) )
))
(declare-fun lt!479347 () Unit!35578)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69621 (_ BitVec 64) (_ BitVec 32)) Unit!35578)

(assert (=> b!1081588 (= lt!479347 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!95682 res!720926) b!1081581))

(assert (= (and b!1081581 res!720920) b!1081583))

(assert (= (and b!1081583 res!720925) b!1081584))

(assert (= (and b!1081584 res!720923) b!1081582))

(assert (= (and b!1081582 res!720921) b!1081578))

(assert (= (and b!1081578 res!720922) b!1081577))

(assert (= (and b!1081577 res!720927) b!1081580))

(assert (= (and b!1081580 res!720919) b!1081587))

(assert (= (and b!1081587 res!720924) b!1081588))

(assert (= (and b!1081585 condMapEmpty!41260) mapIsEmpty!41260))

(assert (= (and b!1081585 (not condMapEmpty!41260)) mapNonEmpty!41260))

(get-info :version)

(assert (= (and mapNonEmpty!41260 ((_ is ValueCellFull!12459) mapValue!41260)) b!1081586))

(assert (= (and b!1081585 ((_ is ValueCellFull!12459) mapDefault!41260)) b!1081579))

(assert (= start!95682 b!1081585))

(declare-fun b_lambda!17005 () Bool)

(assert (=> (not b_lambda!17005) (not b!1081588)))

(declare-fun t!32728 () Bool)

(declare-fun tb!7213 () Bool)

(assert (=> (and start!95682 (= defaultEntry!882 defaultEntry!882) t!32728) tb!7213))

(declare-fun result!14945 () Bool)

(assert (=> tb!7213 (= result!14945 tp_is_empty!26337)))

(assert (=> b!1081588 t!32728))

(declare-fun b_and!35347 () Bool)

(assert (= b_and!35345 (and (=> t!32728 result!14945) b_and!35347)))

(declare-fun m!999353 () Bool)

(assert (=> b!1081587 m!999353))

(declare-fun m!999355 () Bool)

(assert (=> b!1081578 m!999355))

(declare-fun m!999357 () Bool)

(assert (=> b!1081583 m!999357))

(declare-fun m!999359 () Bool)

(assert (=> b!1081580 m!999359))

(declare-fun m!999361 () Bool)

(assert (=> b!1081580 m!999361))

(declare-fun m!999363 () Bool)

(assert (=> b!1081588 m!999363))

(declare-fun m!999365 () Bool)

(assert (=> b!1081588 m!999365))

(declare-fun m!999367 () Bool)

(assert (=> b!1081588 m!999367))

(declare-fun m!999369 () Bool)

(assert (=> b!1081588 m!999369))

(declare-fun m!999371 () Bool)

(assert (=> b!1081588 m!999371))

(declare-fun m!999373 () Bool)

(assert (=> b!1081588 m!999373))

(declare-fun m!999375 () Bool)

(assert (=> b!1081577 m!999375))

(declare-fun m!999377 () Bool)

(assert (=> mapNonEmpty!41260 m!999377))

(declare-fun m!999379 () Bool)

(assert (=> b!1081584 m!999379))

(declare-fun m!999381 () Bool)

(assert (=> start!95682 m!999381))

(declare-fun m!999383 () Bool)

(assert (=> start!95682 m!999383))

(declare-fun m!999385 () Bool)

(assert (=> start!95682 m!999385))

(check-sat (not b!1081587) (not b!1081578) b_and!35347 (not start!95682) (not b!1081583) tp_is_empty!26337 (not b_next!22335) (not b_lambda!17005) (not mapNonEmpty!41260) (not b!1081584) (not b!1081580) (not b!1081588))
(check-sat b_and!35347 (not b_next!22335))
