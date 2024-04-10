; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95688 () Bool)

(assert start!95688)

(declare-fun b_free!22341 () Bool)

(declare-fun b_next!22341 () Bool)

(assert (=> start!95688 (= b_free!22341 (not b_next!22341))))

(declare-fun tp!78871 () Bool)

(declare-fun b_and!35357 () Bool)

(assert (=> start!95688 (= tp!78871 b_and!35357)))

(declare-fun res!721008 () Bool)

(declare-fun e!618249 () Bool)

(assert (=> start!95688 (=> (not res!721008) (not e!618249))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95688 (= res!721008 (validMask!0 mask!1414))))

(assert (=> start!95688 e!618249))

(assert (=> start!95688 tp!78871))

(assert (=> start!95688 true))

(declare-fun tp_is_empty!26343 () Bool)

(assert (=> start!95688 tp_is_empty!26343))

(declare-datatypes ((array!69633 0))(
  ( (array!69634 (arr!33490 (Array (_ BitVec 32) (_ BitVec 64))) (size!34026 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69633)

(declare-fun array_inv!25854 (array!69633) Bool)

(assert (=> start!95688 (array_inv!25854 _keys!1070)))

(declare-datatypes ((V!40251 0))(
  ( (V!40252 (val!13228 Int)) )
))
(declare-datatypes ((ValueCell!12462 0))(
  ( (ValueCellFull!12462 (v!15849 V!40251)) (EmptyCell!12462) )
))
(declare-datatypes ((array!69635 0))(
  ( (array!69636 (arr!33491 (Array (_ BitVec 32) ValueCell!12462)) (size!34027 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69635)

(declare-fun e!618246 () Bool)

(declare-fun array_inv!25855 (array!69635) Bool)

(assert (=> start!95688 (and (array_inv!25855 _values!874) e!618246)))

(declare-fun b!1081691 () Bool)

(declare-fun res!721005 () Bool)

(assert (=> b!1081691 (=> (not res!721005) (not e!618249))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081691 (= res!721005 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34026 _keys!1070))))))

(declare-fun mapNonEmpty!41269 () Bool)

(declare-fun mapRes!41269 () Bool)

(declare-fun tp!78872 () Bool)

(declare-fun e!618247 () Bool)

(assert (=> mapNonEmpty!41269 (= mapRes!41269 (and tp!78872 e!618247))))

(declare-fun mapKey!41269 () (_ BitVec 32))

(declare-fun mapRest!41269 () (Array (_ BitVec 32) ValueCell!12462))

(declare-fun mapValue!41269 () ValueCell!12462)

(assert (=> mapNonEmpty!41269 (= (arr!33491 _values!874) (store mapRest!41269 mapKey!41269 mapValue!41269))))

(declare-fun b!1081692 () Bool)

(declare-fun res!721000 () Bool)

(assert (=> b!1081692 (=> (not res!721000) (not e!618249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69633 (_ BitVec 32)) Bool)

(assert (=> b!1081692 (= res!721000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081693 () Bool)

(declare-fun e!618248 () Bool)

(assert (=> b!1081693 (= e!618248 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40251)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16762 0))(
  ( (tuple2!16763 (_1!8392 (_ BitVec 64)) (_2!8392 V!40251)) )
))
(declare-datatypes ((List!23341 0))(
  ( (Nil!23338) (Cons!23337 (h!24546 tuple2!16762) (t!32740 List!23341)) )
))
(declare-datatypes ((ListLongMap!14731 0))(
  ( (ListLongMap!14732 (toList!7381 List!23341)) )
))
(declare-fun lt!479381 () ListLongMap!14731)

(declare-fun lt!479380 () array!69633)

(declare-fun zeroValue!831 () V!40251)

(declare-fun getCurrentListMapNoExtraKeys!3929 (array!69633 array!69635 (_ BitVec 32) (_ BitVec 32) V!40251 V!40251 (_ BitVec 32) Int) ListLongMap!14731)

(declare-fun dynLambda!2066 (Int (_ BitVec 64)) V!40251)

(assert (=> b!1081693 (= lt!479381 (getCurrentListMapNoExtraKeys!3929 lt!479380 (array!69636 (store (arr!33491 _values!874) i!650 (ValueCellFull!12462 (dynLambda!2066 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34027 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479383 () ListLongMap!14731)

(assert (=> b!1081693 (= lt!479383 (getCurrentListMapNoExtraKeys!3929 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081693 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35582 0))(
  ( (Unit!35583) )
))
(declare-fun lt!479382 () Unit!35582)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69633 (_ BitVec 64) (_ BitVec 32)) Unit!35582)

(assert (=> b!1081693 (= lt!479382 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1081694 () Bool)

(declare-fun res!721003 () Bool)

(assert (=> b!1081694 (=> (not res!721003) (not e!618249))))

(assert (=> b!1081694 (= res!721003 (and (= (size!34027 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34026 _keys!1070) (size!34027 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081695 () Bool)

(declare-fun e!618251 () Bool)

(assert (=> b!1081695 (= e!618246 (and e!618251 mapRes!41269))))

(declare-fun condMapEmpty!41269 () Bool)

(declare-fun mapDefault!41269 () ValueCell!12462)

(assert (=> b!1081695 (= condMapEmpty!41269 (= (arr!33491 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12462)) mapDefault!41269)))))

(declare-fun b!1081696 () Bool)

(declare-fun res!721007 () Bool)

(assert (=> b!1081696 (=> (not res!721007) (not e!618249))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081696 (= res!721007 (validKeyInArray!0 k0!904))))

(declare-fun b!1081697 () Bool)

(declare-fun res!721004 () Bool)

(assert (=> b!1081697 (=> (not res!721004) (not e!618249))))

(declare-datatypes ((List!23342 0))(
  ( (Nil!23339) (Cons!23338 (h!24547 (_ BitVec 64)) (t!32741 List!23342)) )
))
(declare-fun arrayNoDuplicates!0 (array!69633 (_ BitVec 32) List!23342) Bool)

(assert (=> b!1081697 (= res!721004 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23339))))

(declare-fun b!1081698 () Bool)

(assert (=> b!1081698 (= e!618249 e!618248)))

(declare-fun res!721006 () Bool)

(assert (=> b!1081698 (=> (not res!721006) (not e!618248))))

(assert (=> b!1081698 (= res!721006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479380 mask!1414))))

(assert (=> b!1081698 (= lt!479380 (array!69634 (store (arr!33490 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34026 _keys!1070)))))

(declare-fun b!1081699 () Bool)

(declare-fun res!721001 () Bool)

(assert (=> b!1081699 (=> (not res!721001) (not e!618248))))

(assert (=> b!1081699 (= res!721001 (arrayNoDuplicates!0 lt!479380 #b00000000000000000000000000000000 Nil!23339))))

(declare-fun b!1081700 () Bool)

(assert (=> b!1081700 (= e!618251 tp_is_empty!26343)))

(declare-fun b!1081701 () Bool)

(declare-fun res!721002 () Bool)

(assert (=> b!1081701 (=> (not res!721002) (not e!618249))))

(assert (=> b!1081701 (= res!721002 (= (select (arr!33490 _keys!1070) i!650) k0!904))))

(declare-fun b!1081702 () Bool)

(assert (=> b!1081702 (= e!618247 tp_is_empty!26343)))

(declare-fun mapIsEmpty!41269 () Bool)

(assert (=> mapIsEmpty!41269 mapRes!41269))

(assert (= (and start!95688 res!721008) b!1081694))

(assert (= (and b!1081694 res!721003) b!1081692))

(assert (= (and b!1081692 res!721000) b!1081697))

(assert (= (and b!1081697 res!721004) b!1081691))

(assert (= (and b!1081691 res!721005) b!1081696))

(assert (= (and b!1081696 res!721007) b!1081701))

(assert (= (and b!1081701 res!721002) b!1081698))

(assert (= (and b!1081698 res!721006) b!1081699))

(assert (= (and b!1081699 res!721001) b!1081693))

(assert (= (and b!1081695 condMapEmpty!41269) mapIsEmpty!41269))

(assert (= (and b!1081695 (not condMapEmpty!41269)) mapNonEmpty!41269))

(get-info :version)

(assert (= (and mapNonEmpty!41269 ((_ is ValueCellFull!12462) mapValue!41269)) b!1081702))

(assert (= (and b!1081695 ((_ is ValueCellFull!12462) mapDefault!41269)) b!1081700))

(assert (= start!95688 b!1081695))

(declare-fun b_lambda!17011 () Bool)

(assert (=> (not b_lambda!17011) (not b!1081693)))

(declare-fun t!32739 () Bool)

(declare-fun tb!7219 () Bool)

(assert (=> (and start!95688 (= defaultEntry!882 defaultEntry!882) t!32739) tb!7219))

(declare-fun result!14957 () Bool)

(assert (=> tb!7219 (= result!14957 tp_is_empty!26343)))

(assert (=> b!1081693 t!32739))

(declare-fun b_and!35359 () Bool)

(assert (= b_and!35357 (and (=> t!32739 result!14957) b_and!35359)))

(declare-fun m!999455 () Bool)

(assert (=> b!1081693 m!999455))

(declare-fun m!999457 () Bool)

(assert (=> b!1081693 m!999457))

(declare-fun m!999459 () Bool)

(assert (=> b!1081693 m!999459))

(declare-fun m!999461 () Bool)

(assert (=> b!1081693 m!999461))

(declare-fun m!999463 () Bool)

(assert (=> b!1081693 m!999463))

(declare-fun m!999465 () Bool)

(assert (=> b!1081693 m!999465))

(declare-fun m!999467 () Bool)

(assert (=> b!1081701 m!999467))

(declare-fun m!999469 () Bool)

(assert (=> mapNonEmpty!41269 m!999469))

(declare-fun m!999471 () Bool)

(assert (=> b!1081697 m!999471))

(declare-fun m!999473 () Bool)

(assert (=> start!95688 m!999473))

(declare-fun m!999475 () Bool)

(assert (=> start!95688 m!999475))

(declare-fun m!999477 () Bool)

(assert (=> start!95688 m!999477))

(declare-fun m!999479 () Bool)

(assert (=> b!1081696 m!999479))

(declare-fun m!999481 () Bool)

(assert (=> b!1081692 m!999481))

(declare-fun m!999483 () Bool)

(assert (=> b!1081698 m!999483))

(declare-fun m!999485 () Bool)

(assert (=> b!1081698 m!999485))

(declare-fun m!999487 () Bool)

(assert (=> b!1081699 m!999487))

(check-sat (not b!1081693) tp_is_empty!26343 (not mapNonEmpty!41269) (not b!1081696) (not b_next!22341) (not start!95688) b_and!35359 (not b_lambda!17011) (not b!1081697) (not b!1081699) (not b!1081692) (not b!1081698))
(check-sat b_and!35359 (not b_next!22341))
