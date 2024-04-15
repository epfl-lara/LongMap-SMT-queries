; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95746 () Bool)

(assert start!95746)

(declare-fun b_free!22405 () Bool)

(declare-fun b_next!22405 () Bool)

(assert (=> start!95746 (= b_free!22405 (not b_next!22405))))

(declare-fun tp!79063 () Bool)

(declare-fun b_and!35459 () Bool)

(assert (=> start!95746 (= tp!79063 b_and!35459)))

(declare-fun b!1082754 () Bool)

(declare-fun res!721803 () Bool)

(declare-fun e!618731 () Bool)

(assert (=> b!1082754 (=> (not res!721803) (not e!618731))))

(declare-datatypes ((array!69684 0))(
  ( (array!69685 (arr!33516 (Array (_ BitVec 32) (_ BitVec 64))) (size!34054 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69684)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082754 (= res!721803 (= (select (arr!33516 _keys!1070) i!650) k0!904))))

(declare-fun res!721801 () Bool)

(assert (=> start!95746 (=> (not res!721801) (not e!618731))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95746 (= res!721801 (validMask!0 mask!1414))))

(assert (=> start!95746 e!618731))

(assert (=> start!95746 tp!79063))

(assert (=> start!95746 true))

(declare-fun tp_is_empty!26407 () Bool)

(assert (=> start!95746 tp_is_empty!26407))

(declare-fun array_inv!25912 (array!69684) Bool)

(assert (=> start!95746 (array_inv!25912 _keys!1070)))

(declare-datatypes ((V!40337 0))(
  ( (V!40338 (val!13260 Int)) )
))
(declare-datatypes ((ValueCell!12494 0))(
  ( (ValueCellFull!12494 (v!15880 V!40337)) (EmptyCell!12494) )
))
(declare-datatypes ((array!69686 0))(
  ( (array!69687 (arr!33517 (Array (_ BitVec 32) ValueCell!12494)) (size!34055 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69686)

(declare-fun e!618732 () Bool)

(declare-fun array_inv!25913 (array!69686) Bool)

(assert (=> start!95746 (and (array_inv!25913 _values!874) e!618732)))

(declare-fun mapIsEmpty!41365 () Bool)

(declare-fun mapRes!41365 () Bool)

(assert (=> mapIsEmpty!41365 mapRes!41365))

(declare-fun b!1082755 () Bool)

(declare-fun res!721795 () Bool)

(assert (=> b!1082755 (=> (not res!721795) (not e!618731))))

(assert (=> b!1082755 (= res!721795 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34054 _keys!1070))))))

(declare-fun b!1082756 () Bool)

(declare-fun res!721799 () Bool)

(assert (=> b!1082756 (=> (not res!721799) (not e!618731))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1082756 (= res!721799 (and (= (size!34055 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34054 _keys!1070) (size!34055 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082757 () Bool)

(declare-fun e!618730 () Bool)

(assert (=> b!1082757 (= e!618730 tp_is_empty!26407)))

(declare-fun b!1082758 () Bool)

(declare-fun res!721797 () Bool)

(assert (=> b!1082758 (=> (not res!721797) (not e!618731))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082758 (= res!721797 (validKeyInArray!0 k0!904))))

(declare-fun b!1082759 () Bool)

(declare-fun e!618729 () Bool)

(assert (=> b!1082759 (= e!618729 (not true))))

(declare-datatypes ((tuple2!16862 0))(
  ( (tuple2!16863 (_1!8442 (_ BitVec 64)) (_2!8442 V!40337)) )
))
(declare-datatypes ((List!23430 0))(
  ( (Nil!23427) (Cons!23426 (h!24635 tuple2!16862) (t!32884 List!23430)) )
))
(declare-datatypes ((ListLongMap!14831 0))(
  ( (ListLongMap!14832 (toList!7431 List!23430)) )
))
(declare-fun lt!479622 () ListLongMap!14831)

(declare-fun lt!479626 () ListLongMap!14831)

(assert (=> b!1082759 (and (= lt!479622 lt!479626) (= lt!479626 lt!479622))))

(declare-fun lt!479623 () ListLongMap!14831)

(declare-fun -!710 (ListLongMap!14831 (_ BitVec 64)) ListLongMap!14831)

(assert (=> b!1082759 (= lt!479626 (-!710 lt!479623 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40337)

(declare-fun zeroValue!831 () V!40337)

(declare-datatypes ((Unit!35455 0))(
  ( (Unit!35456) )
))
(declare-fun lt!479624 () Unit!35455)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!8 (array!69684 array!69686 (_ BitVec 32) (_ BitVec 32) V!40337 V!40337 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35455)

(assert (=> b!1082759 (= lt!479624 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!8 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479627 () array!69684)

(declare-fun getCurrentListMapNoExtraKeys!3994 (array!69684 array!69686 (_ BitVec 32) (_ BitVec 32) V!40337 V!40337 (_ BitVec 32) Int) ListLongMap!14831)

(declare-fun dynLambda!2065 (Int (_ BitVec 64)) V!40337)

(assert (=> b!1082759 (= lt!479622 (getCurrentListMapNoExtraKeys!3994 lt!479627 (array!69687 (store (arr!33517 _values!874) i!650 (ValueCellFull!12494 (dynLambda!2065 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34055 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1082759 (= lt!479623 (getCurrentListMapNoExtraKeys!3994 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082759 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!479625 () Unit!35455)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69684 (_ BitVec 64) (_ BitVec 32)) Unit!35455)

(assert (=> b!1082759 (= lt!479625 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1082760 () Bool)

(declare-fun res!721800 () Bool)

(assert (=> b!1082760 (=> (not res!721800) (not e!618731))))

(declare-datatypes ((List!23431 0))(
  ( (Nil!23428) (Cons!23427 (h!24636 (_ BitVec 64)) (t!32885 List!23431)) )
))
(declare-fun arrayNoDuplicates!0 (array!69684 (_ BitVec 32) List!23431) Bool)

(assert (=> b!1082760 (= res!721800 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23428))))

(declare-fun b!1082761 () Bool)

(declare-fun res!721798 () Bool)

(assert (=> b!1082761 (=> (not res!721798) (not e!618729))))

(assert (=> b!1082761 (= res!721798 (arrayNoDuplicates!0 lt!479627 #b00000000000000000000000000000000 Nil!23428))))

(declare-fun b!1082762 () Bool)

(declare-fun e!618734 () Bool)

(assert (=> b!1082762 (= e!618734 tp_is_empty!26407)))

(declare-fun mapNonEmpty!41365 () Bool)

(declare-fun tp!79064 () Bool)

(assert (=> mapNonEmpty!41365 (= mapRes!41365 (and tp!79064 e!618734))))

(declare-fun mapRest!41365 () (Array (_ BitVec 32) ValueCell!12494))

(declare-fun mapKey!41365 () (_ BitVec 32))

(declare-fun mapValue!41365 () ValueCell!12494)

(assert (=> mapNonEmpty!41365 (= (arr!33517 _values!874) (store mapRest!41365 mapKey!41365 mapValue!41365))))

(declare-fun b!1082763 () Bool)

(assert (=> b!1082763 (= e!618731 e!618729)))

(declare-fun res!721802 () Bool)

(assert (=> b!1082763 (=> (not res!721802) (not e!618729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69684 (_ BitVec 32)) Bool)

(assert (=> b!1082763 (= res!721802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479627 mask!1414))))

(assert (=> b!1082763 (= lt!479627 (array!69685 (store (arr!33516 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34054 _keys!1070)))))

(declare-fun b!1082764 () Bool)

(assert (=> b!1082764 (= e!618732 (and e!618730 mapRes!41365))))

(declare-fun condMapEmpty!41365 () Bool)

(declare-fun mapDefault!41365 () ValueCell!12494)

(assert (=> b!1082764 (= condMapEmpty!41365 (= (arr!33517 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12494)) mapDefault!41365)))))

(declare-fun b!1082765 () Bool)

(declare-fun res!721796 () Bool)

(assert (=> b!1082765 (=> (not res!721796) (not e!618731))))

(assert (=> b!1082765 (= res!721796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!95746 res!721801) b!1082756))

(assert (= (and b!1082756 res!721799) b!1082765))

(assert (= (and b!1082765 res!721796) b!1082760))

(assert (= (and b!1082760 res!721800) b!1082755))

(assert (= (and b!1082755 res!721795) b!1082758))

(assert (= (and b!1082758 res!721797) b!1082754))

(assert (= (and b!1082754 res!721803) b!1082763))

(assert (= (and b!1082763 res!721802) b!1082761))

(assert (= (and b!1082761 res!721798) b!1082759))

(assert (= (and b!1082764 condMapEmpty!41365) mapIsEmpty!41365))

(assert (= (and b!1082764 (not condMapEmpty!41365)) mapNonEmpty!41365))

(get-info :version)

(assert (= (and mapNonEmpty!41365 ((_ is ValueCellFull!12494) mapValue!41365)) b!1082762))

(assert (= (and b!1082764 ((_ is ValueCellFull!12494) mapDefault!41365)) b!1082757))

(assert (= start!95746 b!1082764))

(declare-fun b_lambda!17053 () Bool)

(assert (=> (not b_lambda!17053) (not b!1082759)))

(declare-fun t!32883 () Bool)

(declare-fun tb!7275 () Bool)

(assert (=> (and start!95746 (= defaultEntry!882 defaultEntry!882) t!32883) tb!7275))

(declare-fun result!15077 () Bool)

(assert (=> tb!7275 (= result!15077 tp_is_empty!26407)))

(assert (=> b!1082759 t!32883))

(declare-fun b_and!35461 () Bool)

(assert (= b_and!35459 (and (=> t!32883 result!15077) b_and!35461)))

(declare-fun m!999953 () Bool)

(assert (=> b!1082763 m!999953))

(declare-fun m!999955 () Bool)

(assert (=> b!1082763 m!999955))

(declare-fun m!999957 () Bool)

(assert (=> b!1082754 m!999957))

(declare-fun m!999959 () Bool)

(assert (=> b!1082761 m!999959))

(declare-fun m!999961 () Bool)

(assert (=> b!1082760 m!999961))

(declare-fun m!999963 () Bool)

(assert (=> b!1082759 m!999963))

(declare-fun m!999965 () Bool)

(assert (=> b!1082759 m!999965))

(declare-fun m!999967 () Bool)

(assert (=> b!1082759 m!999967))

(declare-fun m!999969 () Bool)

(assert (=> b!1082759 m!999969))

(declare-fun m!999971 () Bool)

(assert (=> b!1082759 m!999971))

(declare-fun m!999973 () Bool)

(assert (=> b!1082759 m!999973))

(declare-fun m!999975 () Bool)

(assert (=> b!1082759 m!999975))

(declare-fun m!999977 () Bool)

(assert (=> b!1082759 m!999977))

(declare-fun m!999979 () Bool)

(assert (=> mapNonEmpty!41365 m!999979))

(declare-fun m!999981 () Bool)

(assert (=> b!1082758 m!999981))

(declare-fun m!999983 () Bool)

(assert (=> start!95746 m!999983))

(declare-fun m!999985 () Bool)

(assert (=> start!95746 m!999985))

(declare-fun m!999987 () Bool)

(assert (=> start!95746 m!999987))

(declare-fun m!999989 () Bool)

(assert (=> b!1082765 m!999989))

(check-sat (not start!95746) (not b!1082763) (not mapNonEmpty!41365) tp_is_empty!26407 b_and!35461 (not b!1082758) (not b_lambda!17053) (not b!1082759) (not b_next!22405) (not b!1082761) (not b!1082760) (not b!1082765))
(check-sat b_and!35461 (not b_next!22405))
