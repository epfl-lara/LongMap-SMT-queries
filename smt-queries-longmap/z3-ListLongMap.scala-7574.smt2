; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95758 () Bool)

(assert start!95758)

(declare-fun b_free!22417 () Bool)

(declare-fun b_next!22417 () Bool)

(assert (=> start!95758 (= b_free!22417 (not b_next!22417))))

(declare-fun tp!79100 () Bool)

(declare-fun b_and!35483 () Bool)

(assert (=> start!95758 (= tp!79100 b_and!35483)))

(declare-fun b!1082982 () Bool)

(declare-fun res!721960 () Bool)

(declare-fun e!618842 () Bool)

(assert (=> b!1082982 (=> (not res!721960) (not e!618842))))

(declare-datatypes ((array!69708 0))(
  ( (array!69709 (arr!33528 (Array (_ BitVec 32) (_ BitVec 64))) (size!34066 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69708)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69708 (_ BitVec 32)) Bool)

(assert (=> b!1082982 (= res!721960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082983 () Bool)

(declare-fun res!721964 () Bool)

(assert (=> b!1082983 (=> (not res!721964) (not e!618842))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082983 (= res!721964 (validKeyInArray!0 k0!904))))

(declare-fun b!1082984 () Bool)

(declare-fun e!618837 () Bool)

(declare-fun tp_is_empty!26419 () Bool)

(assert (=> b!1082984 (= e!618837 tp_is_empty!26419)))

(declare-fun res!721957 () Bool)

(assert (=> start!95758 (=> (not res!721957) (not e!618842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95758 (= res!721957 (validMask!0 mask!1414))))

(assert (=> start!95758 e!618842))

(assert (=> start!95758 tp!79100))

(assert (=> start!95758 true))

(assert (=> start!95758 tp_is_empty!26419))

(declare-fun array_inv!25922 (array!69708) Bool)

(assert (=> start!95758 (array_inv!25922 _keys!1070)))

(declare-datatypes ((V!40353 0))(
  ( (V!40354 (val!13266 Int)) )
))
(declare-datatypes ((ValueCell!12500 0))(
  ( (ValueCellFull!12500 (v!15886 V!40353)) (EmptyCell!12500) )
))
(declare-datatypes ((array!69710 0))(
  ( (array!69711 (arr!33529 (Array (_ BitVec 32) ValueCell!12500)) (size!34067 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69710)

(declare-fun e!618840 () Bool)

(declare-fun array_inv!25923 (array!69710) Bool)

(assert (=> start!95758 (and (array_inv!25923 _values!874) e!618840)))

(declare-fun mapNonEmpty!41383 () Bool)

(declare-fun mapRes!41383 () Bool)

(declare-fun tp!79099 () Bool)

(assert (=> mapNonEmpty!41383 (= mapRes!41383 (and tp!79099 e!618837))))

(declare-fun mapValue!41383 () ValueCell!12500)

(declare-fun mapKey!41383 () (_ BitVec 32))

(declare-fun mapRest!41383 () (Array (_ BitVec 32) ValueCell!12500))

(assert (=> mapNonEmpty!41383 (= (arr!33529 _values!874) (store mapRest!41383 mapKey!41383 mapValue!41383))))

(declare-fun b!1082985 () Bool)

(declare-fun res!721965 () Bool)

(assert (=> b!1082985 (=> (not res!721965) (not e!618842))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1082985 (= res!721965 (and (= (size!34067 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34066 _keys!1070) (size!34067 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082986 () Bool)

(declare-fun e!618839 () Bool)

(assert (=> b!1082986 (= e!618840 (and e!618839 mapRes!41383))))

(declare-fun condMapEmpty!41383 () Bool)

(declare-fun mapDefault!41383 () ValueCell!12500)

(assert (=> b!1082986 (= condMapEmpty!41383 (= (arr!33529 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12500)) mapDefault!41383)))))

(declare-fun b!1082987 () Bool)

(declare-fun res!721961 () Bool)

(assert (=> b!1082987 (=> (not res!721961) (not e!618842))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082987 (= res!721961 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34066 _keys!1070))))))

(declare-fun b!1082988 () Bool)

(assert (=> b!1082988 (= e!618839 tp_is_empty!26419)))

(declare-fun b!1082989 () Bool)

(declare-fun e!618841 () Bool)

(assert (=> b!1082989 (= e!618841 (not true))))

(declare-datatypes ((tuple2!16868 0))(
  ( (tuple2!16869 (_1!8445 (_ BitVec 64)) (_2!8445 V!40353)) )
))
(declare-datatypes ((List!23437 0))(
  ( (Nil!23434) (Cons!23433 (h!24642 tuple2!16868) (t!32903 List!23437)) )
))
(declare-datatypes ((ListLongMap!14837 0))(
  ( (ListLongMap!14838 (toList!7434 List!23437)) )
))
(declare-fun lt!479735 () ListLongMap!14837)

(declare-fun lt!479730 () ListLongMap!14837)

(assert (=> b!1082989 (and (= lt!479735 lt!479730) (= lt!479730 lt!479735))))

(declare-fun lt!479731 () ListLongMap!14837)

(declare-fun -!713 (ListLongMap!14837 (_ BitVec 64)) ListLongMap!14837)

(assert (=> b!1082989 (= lt!479730 (-!713 lt!479731 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((Unit!35461 0))(
  ( (Unit!35462) )
))
(declare-fun lt!479733 () Unit!35461)

(declare-fun zeroValue!831 () V!40353)

(declare-fun minValue!831 () V!40353)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!11 (array!69708 array!69710 (_ BitVec 32) (_ BitVec 32) V!40353 V!40353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35461)

(assert (=> b!1082989 (= lt!479733 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!11 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479732 () array!69708)

(declare-fun getCurrentListMapNoExtraKeys!3997 (array!69708 array!69710 (_ BitVec 32) (_ BitVec 32) V!40353 V!40353 (_ BitVec 32) Int) ListLongMap!14837)

(declare-fun dynLambda!2068 (Int (_ BitVec 64)) V!40353)

(assert (=> b!1082989 (= lt!479735 (getCurrentListMapNoExtraKeys!3997 lt!479732 (array!69711 (store (arr!33529 _values!874) i!650 (ValueCellFull!12500 (dynLambda!2068 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34067 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1082989 (= lt!479731 (getCurrentListMapNoExtraKeys!3997 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69708 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082989 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!479734 () Unit!35461)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69708 (_ BitVec 64) (_ BitVec 32)) Unit!35461)

(assert (=> b!1082989 (= lt!479734 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1082990 () Bool)

(declare-fun res!721958 () Bool)

(assert (=> b!1082990 (=> (not res!721958) (not e!618842))))

(declare-datatypes ((List!23438 0))(
  ( (Nil!23435) (Cons!23434 (h!24643 (_ BitVec 64)) (t!32904 List!23438)) )
))
(declare-fun arrayNoDuplicates!0 (array!69708 (_ BitVec 32) List!23438) Bool)

(assert (=> b!1082990 (= res!721958 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23435))))

(declare-fun b!1082991 () Bool)

(declare-fun res!721959 () Bool)

(assert (=> b!1082991 (=> (not res!721959) (not e!618841))))

(assert (=> b!1082991 (= res!721959 (arrayNoDuplicates!0 lt!479732 #b00000000000000000000000000000000 Nil!23435))))

(declare-fun b!1082992 () Bool)

(declare-fun res!721963 () Bool)

(assert (=> b!1082992 (=> (not res!721963) (not e!618842))))

(assert (=> b!1082992 (= res!721963 (= (select (arr!33528 _keys!1070) i!650) k0!904))))

(declare-fun b!1082993 () Bool)

(assert (=> b!1082993 (= e!618842 e!618841)))

(declare-fun res!721962 () Bool)

(assert (=> b!1082993 (=> (not res!721962) (not e!618841))))

(assert (=> b!1082993 (= res!721962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479732 mask!1414))))

(assert (=> b!1082993 (= lt!479732 (array!69709 (store (arr!33528 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34066 _keys!1070)))))

(declare-fun mapIsEmpty!41383 () Bool)

(assert (=> mapIsEmpty!41383 mapRes!41383))

(assert (= (and start!95758 res!721957) b!1082985))

(assert (= (and b!1082985 res!721965) b!1082982))

(assert (= (and b!1082982 res!721960) b!1082990))

(assert (= (and b!1082990 res!721958) b!1082987))

(assert (= (and b!1082987 res!721961) b!1082983))

(assert (= (and b!1082983 res!721964) b!1082992))

(assert (= (and b!1082992 res!721963) b!1082993))

(assert (= (and b!1082993 res!721962) b!1082991))

(assert (= (and b!1082991 res!721959) b!1082989))

(assert (= (and b!1082986 condMapEmpty!41383) mapIsEmpty!41383))

(assert (= (and b!1082986 (not condMapEmpty!41383)) mapNonEmpty!41383))

(get-info :version)

(assert (= (and mapNonEmpty!41383 ((_ is ValueCellFull!12500) mapValue!41383)) b!1082984))

(assert (= (and b!1082986 ((_ is ValueCellFull!12500) mapDefault!41383)) b!1082988))

(assert (= start!95758 b!1082986))

(declare-fun b_lambda!17065 () Bool)

(assert (=> (not b_lambda!17065) (not b!1082989)))

(declare-fun t!32902 () Bool)

(declare-fun tb!7287 () Bool)

(assert (=> (and start!95758 (= defaultEntry!882 defaultEntry!882) t!32902) tb!7287))

(declare-fun result!15101 () Bool)

(assert (=> tb!7287 (= result!15101 tp_is_empty!26419)))

(assert (=> b!1082989 t!32902))

(declare-fun b_and!35485 () Bool)

(assert (= b_and!35483 (and (=> t!32902 result!15101) b_and!35485)))

(declare-fun m!1000181 () Bool)

(assert (=> b!1082989 m!1000181))

(declare-fun m!1000183 () Bool)

(assert (=> b!1082989 m!1000183))

(declare-fun m!1000185 () Bool)

(assert (=> b!1082989 m!1000185))

(declare-fun m!1000187 () Bool)

(assert (=> b!1082989 m!1000187))

(declare-fun m!1000189 () Bool)

(assert (=> b!1082989 m!1000189))

(declare-fun m!1000191 () Bool)

(assert (=> b!1082989 m!1000191))

(declare-fun m!1000193 () Bool)

(assert (=> b!1082989 m!1000193))

(declare-fun m!1000195 () Bool)

(assert (=> b!1082989 m!1000195))

(declare-fun m!1000197 () Bool)

(assert (=> b!1082991 m!1000197))

(declare-fun m!1000199 () Bool)

(assert (=> b!1082993 m!1000199))

(declare-fun m!1000201 () Bool)

(assert (=> b!1082993 m!1000201))

(declare-fun m!1000203 () Bool)

(assert (=> b!1082992 m!1000203))

(declare-fun m!1000205 () Bool)

(assert (=> b!1082982 m!1000205))

(declare-fun m!1000207 () Bool)

(assert (=> start!95758 m!1000207))

(declare-fun m!1000209 () Bool)

(assert (=> start!95758 m!1000209))

(declare-fun m!1000211 () Bool)

(assert (=> start!95758 m!1000211))

(declare-fun m!1000213 () Bool)

(assert (=> b!1082983 m!1000213))

(declare-fun m!1000215 () Bool)

(assert (=> mapNonEmpty!41383 m!1000215))

(declare-fun m!1000217 () Bool)

(assert (=> b!1082990 m!1000217))

(check-sat (not b!1082982) (not b!1082989) (not b_next!22417) (not start!95758) (not b!1082991) (not b!1082983) b_and!35485 (not b!1082993) (not mapNonEmpty!41383) (not b!1082990) tp_is_empty!26419 (not b_lambda!17065))
(check-sat b_and!35485 (not b_next!22417))
