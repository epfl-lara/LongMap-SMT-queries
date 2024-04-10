; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95486 () Bool)

(assert start!95486)

(declare-fun b!1078286 () Bool)

(declare-fun e!616536 () Bool)

(declare-fun tp_is_empty!26157 () Bool)

(assert (=> b!1078286 (= e!616536 tp_is_empty!26157)))

(declare-fun b!1078287 () Bool)

(declare-fun res!718499 () Bool)

(declare-fun e!616535 () Bool)

(assert (=> b!1078287 (=> (not res!718499) (not e!616535))))

(declare-datatypes ((array!69269 0))(
  ( (array!69270 (arr!33309 (Array (_ BitVec 32) (_ BitVec 64))) (size!33845 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69269)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69269 (_ BitVec 32)) Bool)

(assert (=> b!1078287 (= res!718499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078288 () Bool)

(declare-fun e!616537 () Bool)

(assert (=> b!1078288 (= e!616537 tp_is_empty!26157)))

(declare-fun mapIsEmpty!40987 () Bool)

(declare-fun mapRes!40987 () Bool)

(assert (=> mapIsEmpty!40987 mapRes!40987))

(declare-fun res!718495 () Bool)

(assert (=> start!95486 (=> (not res!718495) (not e!616535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95486 (= res!718495 (validMask!0 mask!1414))))

(assert (=> start!95486 e!616535))

(assert (=> start!95486 true))

(declare-fun array_inv!25728 (array!69269) Bool)

(assert (=> start!95486 (array_inv!25728 _keys!1070)))

(declare-datatypes ((V!40003 0))(
  ( (V!40004 (val!13135 Int)) )
))
(declare-datatypes ((ValueCell!12369 0))(
  ( (ValueCellFull!12369 (v!15756 V!40003)) (EmptyCell!12369) )
))
(declare-datatypes ((array!69271 0))(
  ( (array!69272 (arr!33310 (Array (_ BitVec 32) ValueCell!12369)) (size!33846 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69271)

(declare-fun e!616534 () Bool)

(declare-fun array_inv!25729 (array!69271) Bool)

(assert (=> start!95486 (and (array_inv!25729 _values!874) e!616534)))

(declare-fun b!1078289 () Bool)

(declare-fun res!718497 () Bool)

(assert (=> b!1078289 (=> (not res!718497) (not e!616535))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1078289 (= res!718497 (= (select (arr!33309 _keys!1070) i!650) k0!904))))

(declare-fun b!1078290 () Bool)

(declare-fun e!616532 () Bool)

(assert (=> b!1078290 (= e!616532 false)))

(declare-fun lt!478609 () Bool)

(declare-fun lt!478608 () array!69269)

(declare-datatypes ((List!23234 0))(
  ( (Nil!23231) (Cons!23230 (h!24439 (_ BitVec 64)) (t!32593 List!23234)) )
))
(declare-fun arrayNoDuplicates!0 (array!69269 (_ BitVec 32) List!23234) Bool)

(assert (=> b!1078290 (= lt!478609 (arrayNoDuplicates!0 lt!478608 #b00000000000000000000000000000000 Nil!23231))))

(declare-fun b!1078291 () Bool)

(declare-fun res!718496 () Bool)

(assert (=> b!1078291 (=> (not res!718496) (not e!616535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078291 (= res!718496 (validKeyInArray!0 k0!904))))

(declare-fun b!1078292 () Bool)

(declare-fun res!718498 () Bool)

(assert (=> b!1078292 (=> (not res!718498) (not e!616535))))

(assert (=> b!1078292 (= res!718498 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23231))))

(declare-fun mapNonEmpty!40987 () Bool)

(declare-fun tp!78449 () Bool)

(assert (=> mapNonEmpty!40987 (= mapRes!40987 (and tp!78449 e!616537))))

(declare-fun mapRest!40987 () (Array (_ BitVec 32) ValueCell!12369))

(declare-fun mapKey!40987 () (_ BitVec 32))

(declare-fun mapValue!40987 () ValueCell!12369)

(assert (=> mapNonEmpty!40987 (= (arr!33310 _values!874) (store mapRest!40987 mapKey!40987 mapValue!40987))))

(declare-fun b!1078293 () Bool)

(declare-fun res!718494 () Bool)

(assert (=> b!1078293 (=> (not res!718494) (not e!616535))))

(assert (=> b!1078293 (= res!718494 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33845 _keys!1070))))))

(declare-fun b!1078294 () Bool)

(assert (=> b!1078294 (= e!616535 e!616532)))

(declare-fun res!718500 () Bool)

(assert (=> b!1078294 (=> (not res!718500) (not e!616532))))

(assert (=> b!1078294 (= res!718500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478608 mask!1414))))

(assert (=> b!1078294 (= lt!478608 (array!69270 (store (arr!33309 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33845 _keys!1070)))))

(declare-fun b!1078295 () Bool)

(declare-fun res!718501 () Bool)

(assert (=> b!1078295 (=> (not res!718501) (not e!616535))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078295 (= res!718501 (and (= (size!33846 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33845 _keys!1070) (size!33846 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078296 () Bool)

(assert (=> b!1078296 (= e!616534 (and e!616536 mapRes!40987))))

(declare-fun condMapEmpty!40987 () Bool)

(declare-fun mapDefault!40987 () ValueCell!12369)

(assert (=> b!1078296 (= condMapEmpty!40987 (= (arr!33310 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12369)) mapDefault!40987)))))

(assert (= (and start!95486 res!718495) b!1078295))

(assert (= (and b!1078295 res!718501) b!1078287))

(assert (= (and b!1078287 res!718499) b!1078292))

(assert (= (and b!1078292 res!718498) b!1078293))

(assert (= (and b!1078293 res!718494) b!1078291))

(assert (= (and b!1078291 res!718496) b!1078289))

(assert (= (and b!1078289 res!718497) b!1078294))

(assert (= (and b!1078294 res!718500) b!1078290))

(assert (= (and b!1078296 condMapEmpty!40987) mapIsEmpty!40987))

(assert (= (and b!1078296 (not condMapEmpty!40987)) mapNonEmpty!40987))

(get-info :version)

(assert (= (and mapNonEmpty!40987 ((_ is ValueCellFull!12369) mapValue!40987)) b!1078288))

(assert (= (and b!1078296 ((_ is ValueCellFull!12369) mapDefault!40987)) b!1078286))

(assert (= start!95486 b!1078296))

(declare-fun m!996837 () Bool)

(assert (=> start!95486 m!996837))

(declare-fun m!996839 () Bool)

(assert (=> start!95486 m!996839))

(declare-fun m!996841 () Bool)

(assert (=> start!95486 m!996841))

(declare-fun m!996843 () Bool)

(assert (=> b!1078289 m!996843))

(declare-fun m!996845 () Bool)

(assert (=> b!1078287 m!996845))

(declare-fun m!996847 () Bool)

(assert (=> b!1078294 m!996847))

(declare-fun m!996849 () Bool)

(assert (=> b!1078294 m!996849))

(declare-fun m!996851 () Bool)

(assert (=> mapNonEmpty!40987 m!996851))

(declare-fun m!996853 () Bool)

(assert (=> b!1078292 m!996853))

(declare-fun m!996855 () Bool)

(assert (=> b!1078290 m!996855))

(declare-fun m!996857 () Bool)

(assert (=> b!1078291 m!996857))

(check-sat tp_is_empty!26157 (not b!1078292) (not b!1078290) (not start!95486) (not mapNonEmpty!40987) (not b!1078294) (not b!1078291) (not b!1078287))
(check-sat)
