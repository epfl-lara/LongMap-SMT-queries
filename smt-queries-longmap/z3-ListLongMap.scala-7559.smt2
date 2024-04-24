; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95910 () Bool)

(assert start!95910)

(declare-fun b_free!22327 () Bool)

(declare-fun b_next!22327 () Bool)

(assert (=> start!95910 (= b_free!22327 (not b_next!22327))))

(declare-fun tp!78830 () Bool)

(declare-fun b_and!35339 () Bool)

(assert (=> start!95910 (= tp!78830 b_and!35339)))

(declare-fun b!1082752 () Bool)

(declare-fun res!721338 () Bool)

(declare-fun e!618979 () Bool)

(assert (=> b!1082752 (=> (not res!721338) (not e!618979))))

(declare-datatypes ((array!69643 0))(
  ( (array!69644 (arr!33489 (Array (_ BitVec 32) (_ BitVec 64))) (size!34026 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69643)

(declare-datatypes ((List!23339 0))(
  ( (Nil!23336) (Cons!23335 (h!24553 (_ BitVec 64)) (t!32716 List!23339)) )
))
(declare-fun arrayNoDuplicates!0 (array!69643 (_ BitVec 32) List!23339) Bool)

(assert (=> b!1082752 (= res!721338 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23336))))

(declare-fun b!1082753 () Bool)

(declare-fun e!618980 () Bool)

(declare-fun tp_is_empty!26329 () Bool)

(assert (=> b!1082753 (= e!618980 tp_is_empty!26329)))

(declare-fun mapNonEmpty!41248 () Bool)

(declare-fun mapRes!41248 () Bool)

(declare-fun tp!78829 () Bool)

(declare-fun e!618976 () Bool)

(assert (=> mapNonEmpty!41248 (= mapRes!41248 (and tp!78829 e!618976))))

(declare-fun mapKey!41248 () (_ BitVec 32))

(declare-datatypes ((V!40233 0))(
  ( (V!40234 (val!13221 Int)) )
))
(declare-datatypes ((ValueCell!12455 0))(
  ( (ValueCellFull!12455 (v!15838 V!40233)) (EmptyCell!12455) )
))
(declare-fun mapValue!41248 () ValueCell!12455)

(declare-datatypes ((array!69645 0))(
  ( (array!69646 (arr!33490 (Array (_ BitVec 32) ValueCell!12455)) (size!34027 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69645)

(declare-fun mapRest!41248 () (Array (_ BitVec 32) ValueCell!12455))

(assert (=> mapNonEmpty!41248 (= (arr!33490 _values!874) (store mapRest!41248 mapKey!41248 mapValue!41248))))

(declare-fun b!1082754 () Bool)

(declare-fun res!721341 () Bool)

(declare-fun e!618977 () Bool)

(assert (=> b!1082754 (=> (not res!721341) (not e!618977))))

(declare-fun lt!479814 () array!69643)

(assert (=> b!1082754 (= res!721341 (arrayNoDuplicates!0 lt!479814 #b00000000000000000000000000000000 Nil!23336))))

(declare-fun b!1082755 () Bool)

(assert (=> b!1082755 (= e!618979 e!618977)))

(declare-fun res!721339 () Bool)

(assert (=> b!1082755 (=> (not res!721339) (not e!618977))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69643 (_ BitVec 32)) Bool)

(assert (=> b!1082755 (= res!721339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479814 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082755 (= lt!479814 (array!69644 (store (arr!33489 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34026 _keys!1070)))))

(declare-fun mapIsEmpty!41248 () Bool)

(assert (=> mapIsEmpty!41248 mapRes!41248))

(declare-fun b!1082756 () Bool)

(declare-fun res!721333 () Bool)

(assert (=> b!1082756 (=> (not res!721333) (not e!618979))))

(assert (=> b!1082756 (= res!721333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082757 () Bool)

(assert (=> b!1082757 (= e!618977 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40233)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40233)

(declare-datatypes ((tuple2!16750 0))(
  ( (tuple2!16751 (_1!8386 (_ BitVec 64)) (_2!8386 V!40233)) )
))
(declare-datatypes ((List!23340 0))(
  ( (Nil!23337) (Cons!23336 (h!24554 tuple2!16750) (t!32717 List!23340)) )
))
(declare-datatypes ((ListLongMap!14727 0))(
  ( (ListLongMap!14728 (toList!7379 List!23340)) )
))
(declare-fun lt!479811 () ListLongMap!14727)

(declare-fun getCurrentListMapNoExtraKeys!3956 (array!69643 array!69645 (_ BitVec 32) (_ BitVec 32) V!40233 V!40233 (_ BitVec 32) Int) ListLongMap!14727)

(declare-fun dynLambda!2077 (Int (_ BitVec 64)) V!40233)

(assert (=> b!1082757 (= lt!479811 (getCurrentListMapNoExtraKeys!3956 lt!479814 (array!69646 (store (arr!33490 _values!874) i!650 (ValueCellFull!12455 (dynLambda!2077 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34027 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479813 () ListLongMap!14727)

(assert (=> b!1082757 (= lt!479813 (getCurrentListMapNoExtraKeys!3956 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082757 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35549 0))(
  ( (Unit!35550) )
))
(declare-fun lt!479812 () Unit!35549)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69643 (_ BitVec 64) (_ BitVec 32)) Unit!35549)

(assert (=> b!1082757 (= lt!479812 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1082758 () Bool)

(declare-fun res!721340 () Bool)

(assert (=> b!1082758 (=> (not res!721340) (not e!618979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082758 (= res!721340 (validKeyInArray!0 k0!904))))

(declare-fun b!1082760 () Bool)

(assert (=> b!1082760 (= e!618976 tp_is_empty!26329)))

(declare-fun b!1082761 () Bool)

(declare-fun res!721335 () Bool)

(assert (=> b!1082761 (=> (not res!721335) (not e!618979))))

(assert (=> b!1082761 (= res!721335 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34026 _keys!1070))))))

(declare-fun b!1082762 () Bool)

(declare-fun res!721334 () Bool)

(assert (=> b!1082762 (=> (not res!721334) (not e!618979))))

(assert (=> b!1082762 (= res!721334 (= (select (arr!33489 _keys!1070) i!650) k0!904))))

(declare-fun b!1082763 () Bool)

(declare-fun res!721336 () Bool)

(assert (=> b!1082763 (=> (not res!721336) (not e!618979))))

(assert (=> b!1082763 (= res!721336 (and (= (size!34027 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34026 _keys!1070) (size!34027 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082759 () Bool)

(declare-fun e!618975 () Bool)

(assert (=> b!1082759 (= e!618975 (and e!618980 mapRes!41248))))

(declare-fun condMapEmpty!41248 () Bool)

(declare-fun mapDefault!41248 () ValueCell!12455)

(assert (=> b!1082759 (= condMapEmpty!41248 (= (arr!33490 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12455)) mapDefault!41248)))))

(declare-fun res!721337 () Bool)

(assert (=> start!95910 (=> (not res!721337) (not e!618979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95910 (= res!721337 (validMask!0 mask!1414))))

(assert (=> start!95910 e!618979))

(assert (=> start!95910 tp!78830))

(assert (=> start!95910 true))

(assert (=> start!95910 tp_is_empty!26329))

(declare-fun array_inv!25890 (array!69643) Bool)

(assert (=> start!95910 (array_inv!25890 _keys!1070)))

(declare-fun array_inv!25891 (array!69645) Bool)

(assert (=> start!95910 (and (array_inv!25891 _values!874) e!618975)))

(assert (= (and start!95910 res!721337) b!1082763))

(assert (= (and b!1082763 res!721336) b!1082756))

(assert (= (and b!1082756 res!721333) b!1082752))

(assert (= (and b!1082752 res!721338) b!1082761))

(assert (= (and b!1082761 res!721335) b!1082758))

(assert (= (and b!1082758 res!721340) b!1082762))

(assert (= (and b!1082762 res!721334) b!1082755))

(assert (= (and b!1082755 res!721339) b!1082754))

(assert (= (and b!1082754 res!721341) b!1082757))

(assert (= (and b!1082759 condMapEmpty!41248) mapIsEmpty!41248))

(assert (= (and b!1082759 (not condMapEmpty!41248)) mapNonEmpty!41248))

(get-info :version)

(assert (= (and mapNonEmpty!41248 ((_ is ValueCellFull!12455) mapValue!41248)) b!1082760))

(assert (= (and b!1082759 ((_ is ValueCellFull!12455) mapDefault!41248)) b!1082753))

(assert (= start!95910 b!1082759))

(declare-fun b_lambda!17007 () Bool)

(assert (=> (not b_lambda!17007) (not b!1082757)))

(declare-fun t!32715 () Bool)

(declare-fun tb!7197 () Bool)

(assert (=> (and start!95910 (= defaultEntry!882 defaultEntry!882) t!32715) tb!7197))

(declare-fun result!14921 () Bool)

(assert (=> tb!7197 (= result!14921 tp_is_empty!26329)))

(assert (=> b!1082757 t!32715))

(declare-fun b_and!35341 () Bool)

(assert (= b_and!35339 (and (=> t!32715 result!14921) b_and!35341)))

(declare-fun m!1000889 () Bool)

(assert (=> mapNonEmpty!41248 m!1000889))

(declare-fun m!1000891 () Bool)

(assert (=> b!1082754 m!1000891))

(declare-fun m!1000893 () Bool)

(assert (=> b!1082755 m!1000893))

(declare-fun m!1000895 () Bool)

(assert (=> b!1082755 m!1000895))

(declare-fun m!1000897 () Bool)

(assert (=> start!95910 m!1000897))

(declare-fun m!1000899 () Bool)

(assert (=> start!95910 m!1000899))

(declare-fun m!1000901 () Bool)

(assert (=> start!95910 m!1000901))

(declare-fun m!1000903 () Bool)

(assert (=> b!1082756 m!1000903))

(declare-fun m!1000905 () Bool)

(assert (=> b!1082758 m!1000905))

(declare-fun m!1000907 () Bool)

(assert (=> b!1082762 m!1000907))

(declare-fun m!1000909 () Bool)

(assert (=> b!1082752 m!1000909))

(declare-fun m!1000911 () Bool)

(assert (=> b!1082757 m!1000911))

(declare-fun m!1000913 () Bool)

(assert (=> b!1082757 m!1000913))

(declare-fun m!1000915 () Bool)

(assert (=> b!1082757 m!1000915))

(declare-fun m!1000917 () Bool)

(assert (=> b!1082757 m!1000917))

(declare-fun m!1000919 () Bool)

(assert (=> b!1082757 m!1000919))

(declare-fun m!1000921 () Bool)

(assert (=> b!1082757 m!1000921))

(check-sat (not mapNonEmpty!41248) (not b!1082755) (not b_lambda!17007) (not b!1082757) (not b!1082758) (not b!1082754) (not b_next!22327) (not start!95910) (not b!1082752) tp_is_empty!26329 b_and!35341 (not b!1082756))
(check-sat b_and!35341 (not b_next!22327))
