; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95802 () Bool)

(assert start!95802)

(declare-fun res!719875 () Bool)

(declare-fun e!618004 () Bool)

(assert (=> start!95802 (=> (not res!719875) (not e!618004))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95802 (= res!719875 (validMask!0 mask!1414))))

(assert (=> start!95802 e!618004))

(assert (=> start!95802 true))

(declare-datatypes ((array!69431 0))(
  ( (array!69432 (arr!33383 (Array (_ BitVec 32) (_ BitVec 64))) (size!33920 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69431)

(declare-fun array_inv!25816 (array!69431) Bool)

(assert (=> start!95802 (array_inv!25816 _keys!1070)))

(declare-datatypes ((V!40089 0))(
  ( (V!40090 (val!13167 Int)) )
))
(declare-datatypes ((ValueCell!12401 0))(
  ( (ValueCellFull!12401 (v!15784 V!40089)) (EmptyCell!12401) )
))
(declare-datatypes ((array!69433 0))(
  ( (array!69434 (arr!33384 (Array (_ BitVec 32) ValueCell!12401)) (size!33921 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69433)

(declare-fun e!618006 () Bool)

(declare-fun array_inv!25817 (array!69433) Bool)

(assert (=> start!95802 (and (array_inv!25817 _values!874) e!618006)))

(declare-fun b!1080784 () Bool)

(declare-fun res!719881 () Bool)

(assert (=> b!1080784 (=> (not res!719881) (not e!618004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69431 (_ BitVec 32)) Bool)

(assert (=> b!1080784 (= res!719881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080785 () Bool)

(declare-fun res!719879 () Bool)

(assert (=> b!1080785 (=> (not res!719879) (not e!618004))))

(declare-datatypes ((List!23267 0))(
  ( (Nil!23264) (Cons!23263 (h!24481 (_ BitVec 64)) (t!32618 List!23267)) )
))
(declare-fun arrayNoDuplicates!0 (array!69431 (_ BitVec 32) List!23267) Bool)

(assert (=> b!1080785 (= res!719879 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23264))))

(declare-fun b!1080786 () Bool)

(declare-fun e!618007 () Bool)

(declare-fun tp_is_empty!26221 () Bool)

(assert (=> b!1080786 (= e!618007 tp_is_empty!26221)))

(declare-fun b!1080787 () Bool)

(declare-fun e!618003 () Bool)

(assert (=> b!1080787 (= e!618003 tp_is_empty!26221)))

(declare-fun b!1080788 () Bool)

(declare-fun mapRes!41086 () Bool)

(assert (=> b!1080788 (= e!618006 (and e!618003 mapRes!41086))))

(declare-fun condMapEmpty!41086 () Bool)

(declare-fun mapDefault!41086 () ValueCell!12401)

(assert (=> b!1080788 (= condMapEmpty!41086 (= (arr!33384 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12401)) mapDefault!41086)))))

(declare-fun b!1080789 () Bool)

(declare-fun e!618005 () Bool)

(assert (=> b!1080789 (= e!618004 e!618005)))

(declare-fun res!719883 () Bool)

(assert (=> b!1080789 (=> (not res!719883) (not e!618005))))

(declare-fun lt!479330 () array!69431)

(assert (=> b!1080789 (= res!719883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479330 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1080789 (= lt!479330 (array!69432 (store (arr!33383 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33920 _keys!1070)))))

(declare-fun b!1080790 () Bool)

(declare-fun res!719876 () Bool)

(assert (=> b!1080790 (=> (not res!719876) (not e!618004))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1080790 (= res!719876 (and (= (size!33921 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33920 _keys!1070) (size!33921 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1080791 () Bool)

(declare-fun res!719877 () Bool)

(assert (=> b!1080791 (=> (not res!719877) (not e!618005))))

(assert (=> b!1080791 (= res!719877 (arrayNoDuplicates!0 lt!479330 #b00000000000000000000000000000000 Nil!23264))))

(declare-fun b!1080792 () Bool)

(declare-fun res!719882 () Bool)

(assert (=> b!1080792 (=> (not res!719882) (not e!618004))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1080792 (= res!719882 (= (select (arr!33383 _keys!1070) i!650) k0!904))))

(declare-fun b!1080793 () Bool)

(declare-fun res!719878 () Bool)

(assert (=> b!1080793 (=> (not res!719878) (not e!618004))))

(assert (=> b!1080793 (= res!719878 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33920 _keys!1070))))))

(declare-fun b!1080794 () Bool)

(declare-fun res!719880 () Bool)

(assert (=> b!1080794 (=> (not res!719880) (not e!618004))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080794 (= res!719880 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!41086 () Bool)

(declare-fun tp!78548 () Bool)

(assert (=> mapNonEmpty!41086 (= mapRes!41086 (and tp!78548 e!618007))))

(declare-fun mapKey!41086 () (_ BitVec 32))

(declare-fun mapValue!41086 () ValueCell!12401)

(declare-fun mapRest!41086 () (Array (_ BitVec 32) ValueCell!12401))

(assert (=> mapNonEmpty!41086 (= (arr!33384 _values!874) (store mapRest!41086 mapKey!41086 mapValue!41086))))

(declare-fun b!1080795 () Bool)

(assert (=> b!1080795 (= e!618005 (not true))))

(declare-fun arrayContainsKey!0 (array!69431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080795 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35467 0))(
  ( (Unit!35468) )
))
(declare-fun lt!479331 () Unit!35467)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69431 (_ BitVec 64) (_ BitVec 32)) Unit!35467)

(assert (=> b!1080795 (= lt!479331 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!41086 () Bool)

(assert (=> mapIsEmpty!41086 mapRes!41086))

(assert (= (and start!95802 res!719875) b!1080790))

(assert (= (and b!1080790 res!719876) b!1080784))

(assert (= (and b!1080784 res!719881) b!1080785))

(assert (= (and b!1080785 res!719879) b!1080793))

(assert (= (and b!1080793 res!719878) b!1080794))

(assert (= (and b!1080794 res!719880) b!1080792))

(assert (= (and b!1080792 res!719882) b!1080789))

(assert (= (and b!1080789 res!719883) b!1080791))

(assert (= (and b!1080791 res!719877) b!1080795))

(assert (= (and b!1080788 condMapEmpty!41086) mapIsEmpty!41086))

(assert (= (and b!1080788 (not condMapEmpty!41086)) mapNonEmpty!41086))

(get-info :version)

(assert (= (and mapNonEmpty!41086 ((_ is ValueCellFull!12401) mapValue!41086)) b!1080786))

(assert (= (and b!1080788 ((_ is ValueCellFull!12401) mapDefault!41086)) b!1080787))

(assert (= start!95802 b!1080788))

(declare-fun m!999335 () Bool)

(assert (=> b!1080789 m!999335))

(declare-fun m!999337 () Bool)

(assert (=> b!1080789 m!999337))

(declare-fun m!999339 () Bool)

(assert (=> b!1080785 m!999339))

(declare-fun m!999341 () Bool)

(assert (=> b!1080784 m!999341))

(declare-fun m!999343 () Bool)

(assert (=> b!1080791 m!999343))

(declare-fun m!999345 () Bool)

(assert (=> start!95802 m!999345))

(declare-fun m!999347 () Bool)

(assert (=> start!95802 m!999347))

(declare-fun m!999349 () Bool)

(assert (=> start!95802 m!999349))

(declare-fun m!999351 () Bool)

(assert (=> b!1080792 m!999351))

(declare-fun m!999353 () Bool)

(assert (=> mapNonEmpty!41086 m!999353))

(declare-fun m!999355 () Bool)

(assert (=> b!1080795 m!999355))

(declare-fun m!999357 () Bool)

(assert (=> b!1080795 m!999357))

(declare-fun m!999359 () Bool)

(assert (=> b!1080794 m!999359))

(check-sat (not b!1080795) (not b!1080785) (not b!1080794) (not b!1080784) (not start!95802) (not b!1080791) (not b!1080789) (not mapNonEmpty!41086) tp_is_empty!26221)
(check-sat)
