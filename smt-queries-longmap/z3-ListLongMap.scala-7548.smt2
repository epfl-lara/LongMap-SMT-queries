; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95844 () Bool)

(assert start!95844)

(declare-fun b_free!22261 () Bool)

(declare-fun b_next!22261 () Bool)

(assert (=> start!95844 (= b_free!22261 (not b_next!22261))))

(declare-fun tp!78632 () Bool)

(declare-fun b_and!35249 () Bool)

(assert (=> start!95844 (= tp!78632 b_and!35249)))

(declare-fun b!1081540 () Bool)

(declare-fun res!720450 () Bool)

(declare-fun e!618382 () Bool)

(assert (=> b!1081540 (=> (not res!720450) (not e!618382))))

(declare-datatypes ((array!69515 0))(
  ( (array!69516 (arr!33425 (Array (_ BitVec 32) (_ BitVec 64))) (size!33962 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69515)

(declare-datatypes ((List!23288 0))(
  ( (Nil!23285) (Cons!23284 (h!24502 (_ BitVec 64)) (t!32639 List!23288)) )
))
(declare-fun arrayNoDuplicates!0 (array!69515 (_ BitVec 32) List!23288) Bool)

(assert (=> b!1081540 (= res!720450 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23285))))

(declare-fun b!1081541 () Bool)

(declare-fun e!618381 () Bool)

(declare-fun tp_is_empty!26263 () Bool)

(assert (=> b!1081541 (= e!618381 tp_is_empty!26263)))

(declare-fun mapNonEmpty!41149 () Bool)

(declare-fun mapRes!41149 () Bool)

(declare-fun tp!78631 () Bool)

(declare-fun e!618386 () Bool)

(assert (=> mapNonEmpty!41149 (= mapRes!41149 (and tp!78631 e!618386))))

(declare-datatypes ((V!40145 0))(
  ( (V!40146 (val!13188 Int)) )
))
(declare-datatypes ((ValueCell!12422 0))(
  ( (ValueCellFull!12422 (v!15805 V!40145)) (EmptyCell!12422) )
))
(declare-datatypes ((array!69517 0))(
  ( (array!69518 (arr!33426 (Array (_ BitVec 32) ValueCell!12422)) (size!33963 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69517)

(declare-fun mapKey!41149 () (_ BitVec 32))

(declare-fun mapRest!41149 () (Array (_ BitVec 32) ValueCell!12422))

(declare-fun mapValue!41149 () ValueCell!12422)

(assert (=> mapNonEmpty!41149 (= (arr!33426 _values!874) (store mapRest!41149 mapKey!41149 mapValue!41149))))

(declare-fun b!1081542 () Bool)

(declare-fun res!720442 () Bool)

(assert (=> b!1081542 (=> (not res!720442) (not e!618382))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69515 (_ BitVec 32)) Bool)

(assert (=> b!1081542 (= res!720442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081543 () Bool)

(declare-fun res!720449 () Bool)

(declare-fun e!618383 () Bool)

(assert (=> b!1081543 (=> (not res!720449) (not e!618383))))

(declare-fun lt!479476 () array!69515)

(assert (=> b!1081543 (= res!720449 (arrayNoDuplicates!0 lt!479476 #b00000000000000000000000000000000 Nil!23285))))

(declare-fun b!1081544 () Bool)

(declare-fun res!720448 () Bool)

(assert (=> b!1081544 (=> (not res!720448) (not e!618382))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081544 (= res!720448 (validKeyInArray!0 k0!904))))

(declare-fun b!1081545 () Bool)

(declare-fun res!720444 () Bool)

(assert (=> b!1081545 (=> (not res!720444) (not e!618382))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081545 (= res!720444 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33962 _keys!1070))))))

(declare-fun b!1081546 () Bool)

(declare-fun res!720443 () Bool)

(assert (=> b!1081546 (=> (not res!720443) (not e!618382))))

(assert (=> b!1081546 (= res!720443 (= (select (arr!33425 _keys!1070) i!650) k0!904))))

(declare-fun b!1081547 () Bool)

(declare-fun e!618385 () Bool)

(assert (=> b!1081547 (= e!618385 (and e!618381 mapRes!41149))))

(declare-fun condMapEmpty!41149 () Bool)

(declare-fun mapDefault!41149 () ValueCell!12422)

(assert (=> b!1081547 (= condMapEmpty!41149 (= (arr!33426 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12422)) mapDefault!41149)))))

(declare-fun res!720445 () Bool)

(assert (=> start!95844 (=> (not res!720445) (not e!618382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95844 (= res!720445 (validMask!0 mask!1414))))

(assert (=> start!95844 e!618382))

(assert (=> start!95844 tp!78632))

(assert (=> start!95844 true))

(assert (=> start!95844 tp_is_empty!26263))

(declare-fun array_inv!25850 (array!69515) Bool)

(assert (=> start!95844 (array_inv!25850 _keys!1070)))

(declare-fun array_inv!25851 (array!69517) Bool)

(assert (=> start!95844 (and (array_inv!25851 _values!874) e!618385)))

(declare-fun b!1081548 () Bool)

(declare-fun res!720447 () Bool)

(assert (=> b!1081548 (=> (not res!720447) (not e!618382))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1081548 (= res!720447 (and (= (size!33963 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33962 _keys!1070) (size!33963 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!41149 () Bool)

(assert (=> mapIsEmpty!41149 mapRes!41149))

(declare-fun b!1081549 () Bool)

(assert (=> b!1081549 (= e!618386 tp_is_empty!26263)))

(declare-fun b!1081550 () Bool)

(assert (=> b!1081550 (= e!618383 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40145)

(declare-fun zeroValue!831 () V!40145)

(declare-datatypes ((tuple2!16694 0))(
  ( (tuple2!16695 (_1!8358 (_ BitVec 64)) (_2!8358 V!40145)) )
))
(declare-datatypes ((List!23289 0))(
  ( (Nil!23286) (Cons!23285 (h!24503 tuple2!16694) (t!32640 List!23289)) )
))
(declare-datatypes ((ListLongMap!14671 0))(
  ( (ListLongMap!14672 (toList!7351 List!23289)) )
))
(declare-fun lt!479477 () ListLongMap!14671)

(declare-fun getCurrentListMapNoExtraKeys!3928 (array!69515 array!69517 (_ BitVec 32) (_ BitVec 32) V!40145 V!40145 (_ BitVec 32) Int) ListLongMap!14671)

(assert (=> b!1081550 (= lt!479477 (getCurrentListMapNoExtraKeys!3928 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081550 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35493 0))(
  ( (Unit!35494) )
))
(declare-fun lt!479478 () Unit!35493)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69515 (_ BitVec 64) (_ BitVec 32)) Unit!35493)

(assert (=> b!1081550 (= lt!479478 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1081551 () Bool)

(assert (=> b!1081551 (= e!618382 e!618383)))

(declare-fun res!720446 () Bool)

(assert (=> b!1081551 (=> (not res!720446) (not e!618383))))

(assert (=> b!1081551 (= res!720446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479476 mask!1414))))

(assert (=> b!1081551 (= lt!479476 (array!69516 (store (arr!33425 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33962 _keys!1070)))))

(assert (= (and start!95844 res!720445) b!1081548))

(assert (= (and b!1081548 res!720447) b!1081542))

(assert (= (and b!1081542 res!720442) b!1081540))

(assert (= (and b!1081540 res!720450) b!1081545))

(assert (= (and b!1081545 res!720444) b!1081544))

(assert (= (and b!1081544 res!720448) b!1081546))

(assert (= (and b!1081546 res!720443) b!1081551))

(assert (= (and b!1081551 res!720446) b!1081543))

(assert (= (and b!1081543 res!720449) b!1081550))

(assert (= (and b!1081547 condMapEmpty!41149) mapIsEmpty!41149))

(assert (= (and b!1081547 (not condMapEmpty!41149)) mapNonEmpty!41149))

(get-info :version)

(assert (= (and mapNonEmpty!41149 ((_ is ValueCellFull!12422) mapValue!41149)) b!1081549))

(assert (= (and b!1081547 ((_ is ValueCellFull!12422) mapDefault!41149)) b!1081541))

(assert (= start!95844 b!1081547))

(declare-fun m!999893 () Bool)

(assert (=> b!1081550 m!999893))

(declare-fun m!999895 () Bool)

(assert (=> b!1081550 m!999895))

(declare-fun m!999897 () Bool)

(assert (=> b!1081550 m!999897))

(declare-fun m!999899 () Bool)

(assert (=> b!1081551 m!999899))

(declare-fun m!999901 () Bool)

(assert (=> b!1081551 m!999901))

(declare-fun m!999903 () Bool)

(assert (=> b!1081543 m!999903))

(declare-fun m!999905 () Bool)

(assert (=> b!1081540 m!999905))

(declare-fun m!999907 () Bool)

(assert (=> start!95844 m!999907))

(declare-fun m!999909 () Bool)

(assert (=> start!95844 m!999909))

(declare-fun m!999911 () Bool)

(assert (=> start!95844 m!999911))

(declare-fun m!999913 () Bool)

(assert (=> mapNonEmpty!41149 m!999913))

(declare-fun m!999915 () Bool)

(assert (=> b!1081546 m!999915))

(declare-fun m!999917 () Bool)

(assert (=> b!1081544 m!999917))

(declare-fun m!999919 () Bool)

(assert (=> b!1081542 m!999919))

(check-sat (not b_next!22261) (not b!1081550) (not b!1081551) b_and!35249 (not b!1081542) (not start!95844) (not b!1081544) (not mapNonEmpty!41149) (not b!1081543) tp_is_empty!26263 (not b!1081540))
(check-sat b_and!35249 (not b_next!22261))
