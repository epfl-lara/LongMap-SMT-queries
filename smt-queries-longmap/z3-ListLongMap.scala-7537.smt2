; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95778 () Bool)

(assert start!95778)

(declare-fun b!1080352 () Bool)

(declare-fun e!617789 () Bool)

(assert (=> b!1080352 (= e!617789 (not true))))

(declare-datatypes ((array!69385 0))(
  ( (array!69386 (arr!33360 (Array (_ BitVec 32) (_ BitVec 64))) (size!33897 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69385)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080352 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35451 0))(
  ( (Unit!35452) )
))
(declare-fun lt!479258 () Unit!35451)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69385 (_ BitVec 64) (_ BitVec 32)) Unit!35451)

(assert (=> b!1080352 (= lt!479258 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1080353 () Bool)

(declare-fun res!719559 () Bool)

(declare-fun e!617787 () Bool)

(assert (=> b!1080353 (=> (not res!719559) (not e!617787))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69385 (_ BitVec 32)) Bool)

(assert (=> b!1080353 (= res!719559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080354 () Bool)

(declare-fun res!719558 () Bool)

(assert (=> b!1080354 (=> (not res!719558) (not e!617787))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080354 (= res!719558 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!41050 () Bool)

(declare-fun mapRes!41050 () Bool)

(assert (=> mapIsEmpty!41050 mapRes!41050))

(declare-fun b!1080355 () Bool)

(declare-fun res!719553 () Bool)

(assert (=> b!1080355 (=> (not res!719553) (not e!617787))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40057 0))(
  ( (V!40058 (val!13155 Int)) )
))
(declare-datatypes ((ValueCell!12389 0))(
  ( (ValueCellFull!12389 (v!15772 V!40057)) (EmptyCell!12389) )
))
(declare-datatypes ((array!69387 0))(
  ( (array!69388 (arr!33361 (Array (_ BitVec 32) ValueCell!12389)) (size!33898 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69387)

(assert (=> b!1080355 (= res!719553 (and (= (size!33898 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33897 _keys!1070) (size!33898 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!719555 () Bool)

(assert (=> start!95778 (=> (not res!719555) (not e!617787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95778 (= res!719555 (validMask!0 mask!1414))))

(assert (=> start!95778 e!617787))

(assert (=> start!95778 true))

(declare-fun array_inv!25802 (array!69385) Bool)

(assert (=> start!95778 (array_inv!25802 _keys!1070)))

(declare-fun e!617792 () Bool)

(declare-fun array_inv!25803 (array!69387) Bool)

(assert (=> start!95778 (and (array_inv!25803 _values!874) e!617792)))

(declare-fun b!1080356 () Bool)

(declare-fun res!719556 () Bool)

(assert (=> b!1080356 (=> (not res!719556) (not e!617789))))

(declare-fun lt!479259 () array!69385)

(declare-datatypes ((List!23259 0))(
  ( (Nil!23256) (Cons!23255 (h!24473 (_ BitVec 64)) (t!32610 List!23259)) )
))
(declare-fun arrayNoDuplicates!0 (array!69385 (_ BitVec 32) List!23259) Bool)

(assert (=> b!1080356 (= res!719556 (arrayNoDuplicates!0 lt!479259 #b00000000000000000000000000000000 Nil!23256))))

(declare-fun b!1080357 () Bool)

(declare-fun res!719554 () Bool)

(assert (=> b!1080357 (=> (not res!719554) (not e!617787))))

(assert (=> b!1080357 (= res!719554 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33897 _keys!1070))))))

(declare-fun b!1080358 () Bool)

(declare-fun e!617790 () Bool)

(declare-fun tp_is_empty!26197 () Bool)

(assert (=> b!1080358 (= e!617790 tp_is_empty!26197)))

(declare-fun b!1080359 () Bool)

(assert (=> b!1080359 (= e!617787 e!617789)))

(declare-fun res!719552 () Bool)

(assert (=> b!1080359 (=> (not res!719552) (not e!617789))))

(assert (=> b!1080359 (= res!719552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479259 mask!1414))))

(assert (=> b!1080359 (= lt!479259 (array!69386 (store (arr!33360 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33897 _keys!1070)))))

(declare-fun b!1080360 () Bool)

(declare-fun e!617791 () Bool)

(assert (=> b!1080360 (= e!617791 tp_is_empty!26197)))

(declare-fun b!1080361 () Bool)

(declare-fun res!719557 () Bool)

(assert (=> b!1080361 (=> (not res!719557) (not e!617787))))

(assert (=> b!1080361 (= res!719557 (= (select (arr!33360 _keys!1070) i!650) k0!904))))

(declare-fun b!1080362 () Bool)

(assert (=> b!1080362 (= e!617792 (and e!617790 mapRes!41050))))

(declare-fun condMapEmpty!41050 () Bool)

(declare-fun mapDefault!41050 () ValueCell!12389)

(assert (=> b!1080362 (= condMapEmpty!41050 (= (arr!33361 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12389)) mapDefault!41050)))))

(declare-fun b!1080363 () Bool)

(declare-fun res!719551 () Bool)

(assert (=> b!1080363 (=> (not res!719551) (not e!617787))))

(assert (=> b!1080363 (= res!719551 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23256))))

(declare-fun mapNonEmpty!41050 () Bool)

(declare-fun tp!78512 () Bool)

(assert (=> mapNonEmpty!41050 (= mapRes!41050 (and tp!78512 e!617791))))

(declare-fun mapKey!41050 () (_ BitVec 32))

(declare-fun mapRest!41050 () (Array (_ BitVec 32) ValueCell!12389))

(declare-fun mapValue!41050 () ValueCell!12389)

(assert (=> mapNonEmpty!41050 (= (arr!33361 _values!874) (store mapRest!41050 mapKey!41050 mapValue!41050))))

(assert (= (and start!95778 res!719555) b!1080355))

(assert (= (and b!1080355 res!719553) b!1080353))

(assert (= (and b!1080353 res!719559) b!1080363))

(assert (= (and b!1080363 res!719551) b!1080357))

(assert (= (and b!1080357 res!719554) b!1080354))

(assert (= (and b!1080354 res!719558) b!1080361))

(assert (= (and b!1080361 res!719557) b!1080359))

(assert (= (and b!1080359 res!719552) b!1080356))

(assert (= (and b!1080356 res!719556) b!1080352))

(assert (= (and b!1080362 condMapEmpty!41050) mapIsEmpty!41050))

(assert (= (and b!1080362 (not condMapEmpty!41050)) mapNonEmpty!41050))

(get-info :version)

(assert (= (and mapNonEmpty!41050 ((_ is ValueCellFull!12389) mapValue!41050)) b!1080360))

(assert (= (and b!1080362 ((_ is ValueCellFull!12389) mapDefault!41050)) b!1080358))

(assert (= start!95778 b!1080362))

(declare-fun m!999023 () Bool)

(assert (=> b!1080363 m!999023))

(declare-fun m!999025 () Bool)

(assert (=> b!1080359 m!999025))

(declare-fun m!999027 () Bool)

(assert (=> b!1080359 m!999027))

(declare-fun m!999029 () Bool)

(assert (=> b!1080353 m!999029))

(declare-fun m!999031 () Bool)

(assert (=> b!1080361 m!999031))

(declare-fun m!999033 () Bool)

(assert (=> b!1080356 m!999033))

(declare-fun m!999035 () Bool)

(assert (=> b!1080352 m!999035))

(declare-fun m!999037 () Bool)

(assert (=> b!1080352 m!999037))

(declare-fun m!999039 () Bool)

(assert (=> start!95778 m!999039))

(declare-fun m!999041 () Bool)

(assert (=> start!95778 m!999041))

(declare-fun m!999043 () Bool)

(assert (=> start!95778 m!999043))

(declare-fun m!999045 () Bool)

(assert (=> mapNonEmpty!41050 m!999045))

(declare-fun m!999047 () Bool)

(assert (=> b!1080354 m!999047))

(check-sat (not b!1080359) (not b!1080356) (not b!1080353) (not mapNonEmpty!41050) (not b!1080354) (not b!1080352) tp_is_empty!26197 (not b!1080363) (not start!95778))
(check-sat)
