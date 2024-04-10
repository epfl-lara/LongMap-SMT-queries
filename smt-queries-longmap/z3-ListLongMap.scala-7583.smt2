; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95820 () Bool)

(assert start!95820)

(declare-fun b_free!22473 () Bool)

(declare-fun b_next!22473 () Bool)

(assert (=> start!95820 (= b_free!22473 (not b_next!22473))))

(declare-fun tp!79267 () Bool)

(declare-fun b_and!35621 () Bool)

(assert (=> start!95820 (= tp!79267 b_and!35621)))

(declare-fun b!1084199 () Bool)

(declare-fun e!619435 () Bool)

(declare-fun e!619438 () Bool)

(assert (=> b!1084199 (= e!619435 e!619438)))

(declare-fun res!722788 () Bool)

(assert (=> b!1084199 (=> (not res!722788) (not e!619438))))

(declare-datatypes ((array!69891 0))(
  ( (array!69892 (arr!33619 (Array (_ BitVec 32) (_ BitVec 64))) (size!34155 (_ BitVec 32))) )
))
(declare-fun lt!480538 () array!69891)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69891 (_ BitVec 32)) Bool)

(assert (=> b!1084199 (= res!722788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480538 mask!1414))))

(declare-fun _keys!1070 () array!69891)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084199 (= lt!480538 (array!69892 (store (arr!33619 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34155 _keys!1070)))))

(declare-fun b!1084200 () Bool)

(declare-fun res!722787 () Bool)

(assert (=> b!1084200 (=> (not res!722787) (not e!619435))))

(declare-datatypes ((List!23438 0))(
  ( (Nil!23435) (Cons!23434 (h!24643 (_ BitVec 64)) (t!32969 List!23438)) )
))
(declare-fun arrayNoDuplicates!0 (array!69891 (_ BitVec 32) List!23438) Bool)

(assert (=> b!1084200 (= res!722787 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23435))))

(declare-fun b!1084201 () Bool)

(declare-fun res!722790 () Bool)

(assert (=> b!1084201 (=> (not res!722790) (not e!619435))))

(assert (=> b!1084201 (= res!722790 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34155 _keys!1070))))))

(declare-fun b!1084202 () Bool)

(declare-fun e!619434 () Bool)

(declare-fun tp_is_empty!26475 () Bool)

(assert (=> b!1084202 (= e!619434 tp_is_empty!26475)))

(declare-fun b!1084203 () Bool)

(declare-fun res!722783 () Bool)

(assert (=> b!1084203 (=> (not res!722783) (not e!619438))))

(assert (=> b!1084203 (= res!722783 (arrayNoDuplicates!0 lt!480538 #b00000000000000000000000000000000 Nil!23435))))

(declare-fun b!1084204 () Bool)

(declare-fun res!722789 () Bool)

(assert (=> b!1084204 (=> (not res!722789) (not e!619435))))

(assert (=> b!1084204 (= res!722789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084205 () Bool)

(declare-fun res!722786 () Bool)

(assert (=> b!1084205 (=> (not res!722786) (not e!619435))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1084205 (= res!722786 (= (select (arr!33619 _keys!1070) i!650) k0!904))))

(declare-fun b!1084206 () Bool)

(declare-fun res!722782 () Bool)

(assert (=> b!1084206 (=> (not res!722782) (not e!619435))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084206 (= res!722782 (validKeyInArray!0 k0!904))))

(declare-fun b!1084207 () Bool)

(declare-fun e!619436 () Bool)

(declare-fun e!619437 () Bool)

(declare-fun mapRes!41467 () Bool)

(assert (=> b!1084207 (= e!619436 (and e!619437 mapRes!41467))))

(declare-fun condMapEmpty!41467 () Bool)

(declare-datatypes ((V!40427 0))(
  ( (V!40428 (val!13294 Int)) )
))
(declare-datatypes ((ValueCell!12528 0))(
  ( (ValueCellFull!12528 (v!15915 V!40427)) (EmptyCell!12528) )
))
(declare-datatypes ((array!69893 0))(
  ( (array!69894 (arr!33620 (Array (_ BitVec 32) ValueCell!12528)) (size!34156 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69893)

(declare-fun mapDefault!41467 () ValueCell!12528)

(assert (=> b!1084207 (= condMapEmpty!41467 (= (arr!33620 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12528)) mapDefault!41467)))))

(declare-fun mapNonEmpty!41467 () Bool)

(declare-fun tp!79268 () Bool)

(assert (=> mapNonEmpty!41467 (= mapRes!41467 (and tp!79268 e!619434))))

(declare-fun mapRest!41467 () (Array (_ BitVec 32) ValueCell!12528))

(declare-fun mapKey!41467 () (_ BitVec 32))

(declare-fun mapValue!41467 () ValueCell!12528)

(assert (=> mapNonEmpty!41467 (= (arr!33620 _values!874) (store mapRest!41467 mapKey!41467 mapValue!41467))))

(declare-fun b!1084208 () Bool)

(assert (=> b!1084208 (= e!619437 tp_is_empty!26475)))

(declare-fun b!1084209 () Bool)

(declare-fun res!722784 () Bool)

(assert (=> b!1084209 (=> (not res!722784) (not e!619435))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1084209 (= res!722784 (and (= (size!34156 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34155 _keys!1070) (size!34156 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084210 () Bool)

(assert (=> b!1084210 (= e!619438 (not true))))

(declare-fun lt!480537 () array!69893)

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40427)

(declare-datatypes ((tuple2!16850 0))(
  ( (tuple2!16851 (_1!8436 (_ BitVec 64)) (_2!8436 V!40427)) )
))
(declare-datatypes ((List!23439 0))(
  ( (Nil!23436) (Cons!23435 (h!24644 tuple2!16850) (t!32970 List!23439)) )
))
(declare-datatypes ((ListLongMap!14819 0))(
  ( (ListLongMap!14820 (toList!7425 List!23439)) )
))
(declare-fun lt!480541 () ListLongMap!14819)

(declare-fun zeroValue!831 () V!40427)

(declare-fun getCurrentListMap!4213 (array!69891 array!69893 (_ BitVec 32) (_ BitVec 32) V!40427 V!40427 (_ BitVec 32) Int) ListLongMap!14819)

(assert (=> b!1084210 (= lt!480541 (getCurrentListMap!4213 lt!480538 lt!480537 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480534 () ListLongMap!14819)

(declare-fun lt!480540 () ListLongMap!14819)

(assert (=> b!1084210 (and (= lt!480534 lt!480540) (= lt!480540 lt!480534))))

(declare-fun lt!480535 () ListLongMap!14819)

(declare-fun -!752 (ListLongMap!14819 (_ BitVec 64)) ListLongMap!14819)

(assert (=> b!1084210 (= lt!480540 (-!752 lt!480535 k0!904))))

(declare-datatypes ((Unit!35670 0))(
  ( (Unit!35671) )
))
(declare-fun lt!480539 () Unit!35670)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!32 (array!69891 array!69893 (_ BitVec 32) (_ BitVec 32) V!40427 V!40427 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35670)

(assert (=> b!1084210 (= lt!480539 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!32 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3973 (array!69891 array!69893 (_ BitVec 32) (_ BitVec 32) V!40427 V!40427 (_ BitVec 32) Int) ListLongMap!14819)

(assert (=> b!1084210 (= lt!480534 (getCurrentListMapNoExtraKeys!3973 lt!480538 lt!480537 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2110 (Int (_ BitVec 64)) V!40427)

(assert (=> b!1084210 (= lt!480537 (array!69894 (store (arr!33620 _values!874) i!650 (ValueCellFull!12528 (dynLambda!2110 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34156 _values!874)))))

(assert (=> b!1084210 (= lt!480535 (getCurrentListMapNoExtraKeys!3973 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084210 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480536 () Unit!35670)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69891 (_ BitVec 64) (_ BitVec 32)) Unit!35670)

(assert (=> b!1084210 (= lt!480536 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!41467 () Bool)

(assert (=> mapIsEmpty!41467 mapRes!41467))

(declare-fun res!722785 () Bool)

(assert (=> start!95820 (=> (not res!722785) (not e!619435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95820 (= res!722785 (validMask!0 mask!1414))))

(assert (=> start!95820 e!619435))

(assert (=> start!95820 tp!79267))

(assert (=> start!95820 true))

(assert (=> start!95820 tp_is_empty!26475))

(declare-fun array_inv!25946 (array!69891) Bool)

(assert (=> start!95820 (array_inv!25946 _keys!1070)))

(declare-fun array_inv!25947 (array!69893) Bool)

(assert (=> start!95820 (and (array_inv!25947 _values!874) e!619436)))

(assert (= (and start!95820 res!722785) b!1084209))

(assert (= (and b!1084209 res!722784) b!1084204))

(assert (= (and b!1084204 res!722789) b!1084200))

(assert (= (and b!1084200 res!722787) b!1084201))

(assert (= (and b!1084201 res!722790) b!1084206))

(assert (= (and b!1084206 res!722782) b!1084205))

(assert (= (and b!1084205 res!722786) b!1084199))

(assert (= (and b!1084199 res!722788) b!1084203))

(assert (= (and b!1084203 res!722783) b!1084210))

(assert (= (and b!1084207 condMapEmpty!41467) mapIsEmpty!41467))

(assert (= (and b!1084207 (not condMapEmpty!41467)) mapNonEmpty!41467))

(get-info :version)

(assert (= (and mapNonEmpty!41467 ((_ is ValueCellFull!12528) mapValue!41467)) b!1084202))

(assert (= (and b!1084207 ((_ is ValueCellFull!12528) mapDefault!41467)) b!1084208))

(assert (= start!95820 b!1084207))

(declare-fun b_lambda!17143 () Bool)

(assert (=> (not b_lambda!17143) (not b!1084210)))

(declare-fun t!32968 () Bool)

(declare-fun tb!7351 () Bool)

(assert (=> (and start!95820 (= defaultEntry!882 defaultEntry!882) t!32968) tb!7351))

(declare-fun result!15221 () Bool)

(assert (=> tb!7351 (= result!15221 tp_is_empty!26475)))

(assert (=> b!1084210 t!32968))

(declare-fun b_and!35623 () Bool)

(assert (= b_and!35621 (and (=> t!32968 result!15221) b_and!35623)))

(declare-fun m!1001903 () Bool)

(assert (=> start!95820 m!1001903))

(declare-fun m!1001905 () Bool)

(assert (=> start!95820 m!1001905))

(declare-fun m!1001907 () Bool)

(assert (=> start!95820 m!1001907))

(declare-fun m!1001909 () Bool)

(assert (=> b!1084205 m!1001909))

(declare-fun m!1001911 () Bool)

(assert (=> b!1084199 m!1001911))

(declare-fun m!1001913 () Bool)

(assert (=> b!1084199 m!1001913))

(declare-fun m!1001915 () Bool)

(assert (=> mapNonEmpty!41467 m!1001915))

(declare-fun m!1001917 () Bool)

(assert (=> b!1084206 m!1001917))

(declare-fun m!1001919 () Bool)

(assert (=> b!1084200 m!1001919))

(declare-fun m!1001921 () Bool)

(assert (=> b!1084210 m!1001921))

(declare-fun m!1001923 () Bool)

(assert (=> b!1084210 m!1001923))

(declare-fun m!1001925 () Bool)

(assert (=> b!1084210 m!1001925))

(declare-fun m!1001927 () Bool)

(assert (=> b!1084210 m!1001927))

(declare-fun m!1001929 () Bool)

(assert (=> b!1084210 m!1001929))

(declare-fun m!1001931 () Bool)

(assert (=> b!1084210 m!1001931))

(declare-fun m!1001933 () Bool)

(assert (=> b!1084210 m!1001933))

(declare-fun m!1001935 () Bool)

(assert (=> b!1084210 m!1001935))

(declare-fun m!1001937 () Bool)

(assert (=> b!1084210 m!1001937))

(declare-fun m!1001939 () Bool)

(assert (=> b!1084203 m!1001939))

(declare-fun m!1001941 () Bool)

(assert (=> b!1084204 m!1001941))

(check-sat (not b_lambda!17143) (not b!1084204) (not b!1084206) (not b!1084199) (not b_next!22473) (not b!1084203) tp_is_empty!26475 (not mapNonEmpty!41467) b_and!35623 (not b!1084200) (not b!1084210) (not start!95820))
(check-sat b_and!35623 (not b_next!22473))
