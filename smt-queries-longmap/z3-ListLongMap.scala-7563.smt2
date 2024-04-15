; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95692 () Bool)

(assert start!95692)

(declare-fun b_free!22351 () Bool)

(declare-fun b_next!22351 () Bool)

(assert (=> start!95692 (= b_free!22351 (not b_next!22351))))

(declare-fun tp!78902 () Bool)

(declare-fun b_and!35351 () Bool)

(assert (=> start!95692 (= tp!78902 b_and!35351)))

(declare-fun b!1081728 () Bool)

(declare-fun res!721070 () Bool)

(declare-fun e!618244 () Bool)

(assert (=> b!1081728 (=> (not res!721070) (not e!618244))))

(declare-datatypes ((array!69580 0))(
  ( (array!69581 (arr!33464 (Array (_ BitVec 32) (_ BitVec 64))) (size!34002 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69580)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081728 (= res!721070 (= (select (arr!33464 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!41284 () Bool)

(declare-fun mapRes!41284 () Bool)

(declare-fun tp!78901 () Bool)

(declare-fun e!618243 () Bool)

(assert (=> mapNonEmpty!41284 (= mapRes!41284 (and tp!78901 e!618243))))

(declare-datatypes ((V!40265 0))(
  ( (V!40266 (val!13233 Int)) )
))
(declare-datatypes ((ValueCell!12467 0))(
  ( (ValueCellFull!12467 (v!15853 V!40265)) (EmptyCell!12467) )
))
(declare-datatypes ((array!69582 0))(
  ( (array!69583 (arr!33465 (Array (_ BitVec 32) ValueCell!12467)) (size!34003 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69582)

(declare-fun mapRest!41284 () (Array (_ BitVec 32) ValueCell!12467))

(declare-fun mapKey!41284 () (_ BitVec 32))

(declare-fun mapValue!41284 () ValueCell!12467)

(assert (=> mapNonEmpty!41284 (= (arr!33465 _values!874) (store mapRest!41284 mapKey!41284 mapValue!41284))))

(declare-fun res!721074 () Bool)

(assert (=> start!95692 (=> (not res!721074) (not e!618244))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95692 (= res!721074 (validMask!0 mask!1414))))

(assert (=> start!95692 e!618244))

(assert (=> start!95692 tp!78902))

(assert (=> start!95692 true))

(declare-fun tp_is_empty!26353 () Bool)

(assert (=> start!95692 tp_is_empty!26353))

(declare-fun array_inv!25868 (array!69580) Bool)

(assert (=> start!95692 (array_inv!25868 _keys!1070)))

(declare-fun e!618247 () Bool)

(declare-fun array_inv!25869 (array!69582) Bool)

(assert (=> start!95692 (and (array_inv!25869 _values!874) e!618247)))

(declare-fun b!1081729 () Bool)

(declare-fun res!721072 () Bool)

(assert (=> b!1081729 (=> (not res!721072) (not e!618244))))

(assert (=> b!1081729 (= res!721072 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34002 _keys!1070))))))

(declare-fun b!1081730 () Bool)

(declare-fun res!721067 () Bool)

(assert (=> b!1081730 (=> (not res!721067) (not e!618244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081730 (= res!721067 (validKeyInArray!0 k0!904))))

(declare-fun b!1081731 () Bool)

(declare-fun e!618246 () Bool)

(assert (=> b!1081731 (= e!618246 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40265)

(declare-fun lt!479243 () array!69580)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16826 0))(
  ( (tuple2!16827 (_1!8424 (_ BitVec 64)) (_2!8424 V!40265)) )
))
(declare-datatypes ((List!23390 0))(
  ( (Nil!23387) (Cons!23386 (h!24595 tuple2!16826) (t!32790 List!23390)) )
))
(declare-datatypes ((ListLongMap!14795 0))(
  ( (ListLongMap!14796 (toList!7413 List!23390)) )
))
(declare-fun lt!479242 () ListLongMap!14795)

(declare-fun zeroValue!831 () V!40265)

(declare-fun getCurrentListMapNoExtraKeys!3976 (array!69580 array!69582 (_ BitVec 32) (_ BitVec 32) V!40265 V!40265 (_ BitVec 32) Int) ListLongMap!14795)

(declare-fun dynLambda!2047 (Int (_ BitVec 64)) V!40265)

(assert (=> b!1081731 (= lt!479242 (getCurrentListMapNoExtraKeys!3976 lt!479243 (array!69583 (store (arr!33465 _values!874) i!650 (ValueCellFull!12467 (dynLambda!2047 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34003 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479240 () ListLongMap!14795)

(assert (=> b!1081731 (= lt!479240 (getCurrentListMapNoExtraKeys!3976 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69580 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081731 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35419 0))(
  ( (Unit!35420) )
))
(declare-fun lt!479241 () Unit!35419)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69580 (_ BitVec 64) (_ BitVec 32)) Unit!35419)

(assert (=> b!1081731 (= lt!479241 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1081732 () Bool)

(declare-fun res!721073 () Bool)

(assert (=> b!1081732 (=> (not res!721073) (not e!618244))))

(declare-datatypes ((List!23391 0))(
  ( (Nil!23388) (Cons!23387 (h!24596 (_ BitVec 64)) (t!32791 List!23391)) )
))
(declare-fun arrayNoDuplicates!0 (array!69580 (_ BitVec 32) List!23391) Bool)

(assert (=> b!1081732 (= res!721073 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23388))))

(declare-fun b!1081733 () Bool)

(declare-fun e!618245 () Bool)

(assert (=> b!1081733 (= e!618245 tp_is_empty!26353)))

(declare-fun b!1081734 () Bool)

(declare-fun res!721068 () Bool)

(assert (=> b!1081734 (=> (not res!721068) (not e!618244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69580 (_ BitVec 32)) Bool)

(assert (=> b!1081734 (= res!721068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081735 () Bool)

(declare-fun res!721071 () Bool)

(assert (=> b!1081735 (=> (not res!721071) (not e!618244))))

(assert (=> b!1081735 (= res!721071 (and (= (size!34003 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34002 _keys!1070) (size!34003 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081736 () Bool)

(declare-fun res!721069 () Bool)

(assert (=> b!1081736 (=> (not res!721069) (not e!618246))))

(assert (=> b!1081736 (= res!721069 (arrayNoDuplicates!0 lt!479243 #b00000000000000000000000000000000 Nil!23388))))

(declare-fun mapIsEmpty!41284 () Bool)

(assert (=> mapIsEmpty!41284 mapRes!41284))

(declare-fun b!1081737 () Bool)

(assert (=> b!1081737 (= e!618243 tp_is_empty!26353)))

(declare-fun b!1081738 () Bool)

(assert (=> b!1081738 (= e!618244 e!618246)))

(declare-fun res!721066 () Bool)

(assert (=> b!1081738 (=> (not res!721066) (not e!618246))))

(assert (=> b!1081738 (= res!721066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479243 mask!1414))))

(assert (=> b!1081738 (= lt!479243 (array!69581 (store (arr!33464 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34002 _keys!1070)))))

(declare-fun b!1081739 () Bool)

(assert (=> b!1081739 (= e!618247 (and e!618245 mapRes!41284))))

(declare-fun condMapEmpty!41284 () Bool)

(declare-fun mapDefault!41284 () ValueCell!12467)

(assert (=> b!1081739 (= condMapEmpty!41284 (= (arr!33465 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12467)) mapDefault!41284)))))

(assert (= (and start!95692 res!721074) b!1081735))

(assert (= (and b!1081735 res!721071) b!1081734))

(assert (= (and b!1081734 res!721068) b!1081732))

(assert (= (and b!1081732 res!721073) b!1081729))

(assert (= (and b!1081729 res!721072) b!1081730))

(assert (= (and b!1081730 res!721067) b!1081728))

(assert (= (and b!1081728 res!721070) b!1081738))

(assert (= (and b!1081738 res!721066) b!1081736))

(assert (= (and b!1081736 res!721069) b!1081731))

(assert (= (and b!1081739 condMapEmpty!41284) mapIsEmpty!41284))

(assert (= (and b!1081739 (not condMapEmpty!41284)) mapNonEmpty!41284))

(get-info :version)

(assert (= (and mapNonEmpty!41284 ((_ is ValueCellFull!12467) mapValue!41284)) b!1081737))

(assert (= (and b!1081739 ((_ is ValueCellFull!12467) mapDefault!41284)) b!1081733))

(assert (= start!95692 b!1081739))

(declare-fun b_lambda!16999 () Bool)

(assert (=> (not b_lambda!16999) (not b!1081731)))

(declare-fun t!32789 () Bool)

(declare-fun tb!7221 () Bool)

(assert (=> (and start!95692 (= defaultEntry!882 defaultEntry!882) t!32789) tb!7221))

(declare-fun result!14969 () Bool)

(assert (=> tb!7221 (= result!14969 tp_is_empty!26353)))

(assert (=> b!1081731 t!32789))

(declare-fun b_and!35353 () Bool)

(assert (= b_and!35351 (and (=> t!32789 result!14969) b_and!35353)))

(declare-fun m!998999 () Bool)

(assert (=> b!1081730 m!998999))

(declare-fun m!999001 () Bool)

(assert (=> b!1081736 m!999001))

(declare-fun m!999003 () Bool)

(assert (=> b!1081728 m!999003))

(declare-fun m!999005 () Bool)

(assert (=> mapNonEmpty!41284 m!999005))

(declare-fun m!999007 () Bool)

(assert (=> b!1081734 m!999007))

(declare-fun m!999009 () Bool)

(assert (=> b!1081731 m!999009))

(declare-fun m!999011 () Bool)

(assert (=> b!1081731 m!999011))

(declare-fun m!999013 () Bool)

(assert (=> b!1081731 m!999013))

(declare-fun m!999015 () Bool)

(assert (=> b!1081731 m!999015))

(declare-fun m!999017 () Bool)

(assert (=> b!1081731 m!999017))

(declare-fun m!999019 () Bool)

(assert (=> b!1081731 m!999019))

(declare-fun m!999021 () Bool)

(assert (=> start!95692 m!999021))

(declare-fun m!999023 () Bool)

(assert (=> start!95692 m!999023))

(declare-fun m!999025 () Bool)

(assert (=> start!95692 m!999025))

(declare-fun m!999027 () Bool)

(assert (=> b!1081732 m!999027))

(declare-fun m!999029 () Bool)

(assert (=> b!1081738 m!999029))

(declare-fun m!999031 () Bool)

(assert (=> b!1081738 m!999031))

(check-sat (not b!1081736) (not b_next!22351) (not start!95692) (not b!1081738) tp_is_empty!26353 (not b!1081730) (not b!1081734) b_and!35353 (not mapNonEmpty!41284) (not b!1081732) (not b_lambda!16999) (not b!1081731))
(check-sat b_and!35353 (not b_next!22351))
