; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95850 () Bool)

(assert start!95850)

(declare-fun b_free!22267 () Bool)

(declare-fun b_next!22267 () Bool)

(assert (=> start!95850 (= b_free!22267 (not b_next!22267))))

(declare-fun tp!78649 () Bool)

(declare-fun b_and!35255 () Bool)

(assert (=> start!95850 (= tp!78649 b_and!35255)))

(declare-fun mapIsEmpty!41158 () Bool)

(declare-fun mapRes!41158 () Bool)

(assert (=> mapIsEmpty!41158 mapRes!41158))

(declare-fun b!1081648 () Bool)

(declare-fun res!720524 () Bool)

(declare-fun e!618436 () Bool)

(assert (=> b!1081648 (=> (not res!720524) (not e!618436))))

(declare-datatypes ((array!69525 0))(
  ( (array!69526 (arr!33430 (Array (_ BitVec 32) (_ BitVec 64))) (size!33967 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69525)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081648 (= res!720524 (= (select (arr!33430 _keys!1070) i!650) k0!904))))

(declare-fun b!1081650 () Bool)

(declare-fun e!618437 () Bool)

(declare-fun e!618439 () Bool)

(assert (=> b!1081650 (= e!618437 (and e!618439 mapRes!41158))))

(declare-fun condMapEmpty!41158 () Bool)

(declare-datatypes ((V!40153 0))(
  ( (V!40154 (val!13191 Int)) )
))
(declare-datatypes ((ValueCell!12425 0))(
  ( (ValueCellFull!12425 (v!15808 V!40153)) (EmptyCell!12425) )
))
(declare-datatypes ((array!69527 0))(
  ( (array!69528 (arr!33431 (Array (_ BitVec 32) ValueCell!12425)) (size!33968 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69527)

(declare-fun mapDefault!41158 () ValueCell!12425)

(assert (=> b!1081650 (= condMapEmpty!41158 (= (arr!33431 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12425)) mapDefault!41158)))))

(declare-fun b!1081651 () Bool)

(declare-fun res!720527 () Bool)

(assert (=> b!1081651 (=> (not res!720527) (not e!618436))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1081651 (= res!720527 (and (= (size!33968 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33967 _keys!1070) (size!33968 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081652 () Bool)

(declare-fun res!720529 () Bool)

(assert (=> b!1081652 (=> (not res!720529) (not e!618436))))

(declare-datatypes ((List!23292 0))(
  ( (Nil!23289) (Cons!23288 (h!24506 (_ BitVec 64)) (t!32643 List!23292)) )
))
(declare-fun arrayNoDuplicates!0 (array!69525 (_ BitVec 32) List!23292) Bool)

(assert (=> b!1081652 (= res!720529 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23289))))

(declare-fun b!1081653 () Bool)

(declare-fun res!720530 () Bool)

(assert (=> b!1081653 (=> (not res!720530) (not e!618436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081653 (= res!720530 (validKeyInArray!0 k0!904))))

(declare-fun b!1081654 () Bool)

(declare-fun res!720523 () Bool)

(assert (=> b!1081654 (=> (not res!720523) (not e!618436))))

(assert (=> b!1081654 (= res!720523 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33967 _keys!1070))))))

(declare-fun b!1081655 () Bool)

(declare-fun e!618438 () Bool)

(assert (=> b!1081655 (= e!618436 e!618438)))

(declare-fun res!720531 () Bool)

(assert (=> b!1081655 (=> (not res!720531) (not e!618438))))

(declare-fun lt!479505 () array!69525)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69525 (_ BitVec 32)) Bool)

(assert (=> b!1081655 (= res!720531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479505 mask!1414))))

(assert (=> b!1081655 (= lt!479505 (array!69526 (store (arr!33430 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33967 _keys!1070)))))

(declare-fun res!720525 () Bool)

(assert (=> start!95850 (=> (not res!720525) (not e!618436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95850 (= res!720525 (validMask!0 mask!1414))))

(assert (=> start!95850 e!618436))

(assert (=> start!95850 tp!78649))

(assert (=> start!95850 true))

(declare-fun tp_is_empty!26269 () Bool)

(assert (=> start!95850 tp_is_empty!26269))

(declare-fun array_inv!25854 (array!69525) Bool)

(assert (=> start!95850 (array_inv!25854 _keys!1070)))

(declare-fun array_inv!25855 (array!69527) Bool)

(assert (=> start!95850 (and (array_inv!25855 _values!874) e!618437)))

(declare-fun b!1081649 () Bool)

(declare-fun res!720528 () Bool)

(assert (=> b!1081649 (=> (not res!720528) (not e!618438))))

(assert (=> b!1081649 (= res!720528 (arrayNoDuplicates!0 lt!479505 #b00000000000000000000000000000000 Nil!23289))))

(declare-fun b!1081656 () Bool)

(assert (=> b!1081656 (= e!618438 (not true))))

(declare-fun minValue!831 () V!40153)

(declare-fun zeroValue!831 () V!40153)

(declare-datatypes ((tuple2!16698 0))(
  ( (tuple2!16699 (_1!8360 (_ BitVec 64)) (_2!8360 V!40153)) )
))
(declare-datatypes ((List!23293 0))(
  ( (Nil!23290) (Cons!23289 (h!24507 tuple2!16698) (t!32644 List!23293)) )
))
(declare-datatypes ((ListLongMap!14675 0))(
  ( (ListLongMap!14676 (toList!7353 List!23293)) )
))
(declare-fun lt!479504 () ListLongMap!14675)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3930 (array!69525 array!69527 (_ BitVec 32) (_ BitVec 32) V!40153 V!40153 (_ BitVec 32) Int) ListLongMap!14675)

(assert (=> b!1081656 (= lt!479504 (getCurrentListMapNoExtraKeys!3930 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081656 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35497 0))(
  ( (Unit!35498) )
))
(declare-fun lt!479503 () Unit!35497)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69525 (_ BitVec 64) (_ BitVec 32)) Unit!35497)

(assert (=> b!1081656 (= lt!479503 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1081657 () Bool)

(declare-fun res!720526 () Bool)

(assert (=> b!1081657 (=> (not res!720526) (not e!618436))))

(assert (=> b!1081657 (= res!720526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081658 () Bool)

(declare-fun e!618435 () Bool)

(assert (=> b!1081658 (= e!618435 tp_is_empty!26269)))

(declare-fun b!1081659 () Bool)

(assert (=> b!1081659 (= e!618439 tp_is_empty!26269)))

(declare-fun mapNonEmpty!41158 () Bool)

(declare-fun tp!78650 () Bool)

(assert (=> mapNonEmpty!41158 (= mapRes!41158 (and tp!78650 e!618435))))

(declare-fun mapRest!41158 () (Array (_ BitVec 32) ValueCell!12425))

(declare-fun mapKey!41158 () (_ BitVec 32))

(declare-fun mapValue!41158 () ValueCell!12425)

(assert (=> mapNonEmpty!41158 (= (arr!33431 _values!874) (store mapRest!41158 mapKey!41158 mapValue!41158))))

(assert (= (and start!95850 res!720525) b!1081651))

(assert (= (and b!1081651 res!720527) b!1081657))

(assert (= (and b!1081657 res!720526) b!1081652))

(assert (= (and b!1081652 res!720529) b!1081654))

(assert (= (and b!1081654 res!720523) b!1081653))

(assert (= (and b!1081653 res!720530) b!1081648))

(assert (= (and b!1081648 res!720524) b!1081655))

(assert (= (and b!1081655 res!720531) b!1081649))

(assert (= (and b!1081649 res!720528) b!1081656))

(assert (= (and b!1081650 condMapEmpty!41158) mapIsEmpty!41158))

(assert (= (and b!1081650 (not condMapEmpty!41158)) mapNonEmpty!41158))

(get-info :version)

(assert (= (and mapNonEmpty!41158 ((_ is ValueCellFull!12425) mapValue!41158)) b!1081658))

(assert (= (and b!1081650 ((_ is ValueCellFull!12425) mapDefault!41158)) b!1081659))

(assert (= start!95850 b!1081650))

(declare-fun m!999977 () Bool)

(assert (=> start!95850 m!999977))

(declare-fun m!999979 () Bool)

(assert (=> start!95850 m!999979))

(declare-fun m!999981 () Bool)

(assert (=> start!95850 m!999981))

(declare-fun m!999983 () Bool)

(assert (=> b!1081655 m!999983))

(declare-fun m!999985 () Bool)

(assert (=> b!1081655 m!999985))

(declare-fun m!999987 () Bool)

(assert (=> b!1081653 m!999987))

(declare-fun m!999989 () Bool)

(assert (=> b!1081649 m!999989))

(declare-fun m!999991 () Bool)

(assert (=> b!1081656 m!999991))

(declare-fun m!999993 () Bool)

(assert (=> b!1081656 m!999993))

(declare-fun m!999995 () Bool)

(assert (=> b!1081656 m!999995))

(declare-fun m!999997 () Bool)

(assert (=> b!1081652 m!999997))

(declare-fun m!999999 () Bool)

(assert (=> b!1081657 m!999999))

(declare-fun m!1000001 () Bool)

(assert (=> mapNonEmpty!41158 m!1000001))

(declare-fun m!1000003 () Bool)

(assert (=> b!1081648 m!1000003))

(check-sat (not b!1081653) (not b!1081652) (not b!1081657) (not start!95850) (not mapNonEmpty!41158) (not b!1081655) tp_is_empty!26269 (not b_next!22267) b_and!35255 (not b!1081649) (not b!1081656))
(check-sat b_and!35255 (not b_next!22267))
