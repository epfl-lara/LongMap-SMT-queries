; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96630 () Bool)

(assert start!96630)

(declare-fun b_free!23103 () Bool)

(declare-fun b_next!23103 () Bool)

(assert (=> start!96630 (= b_free!23103 (not b_next!23103))))

(declare-fun tp!81248 () Bool)

(declare-fun b_and!36925 () Bool)

(assert (=> start!96630 (= tp!81248 b_and!36925)))

(declare-fun b!1098958 () Bool)

(declare-fun res!733393 () Bool)

(declare-fun e!627239 () Bool)

(assert (=> b!1098958 (=> (not res!733393) (not e!627239))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1098958 (= res!733393 (validKeyInArray!0 k0!904))))

(declare-fun res!733394 () Bool)

(assert (=> start!96630 (=> (not res!733394) (not e!627239))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96630 (= res!733394 (validMask!0 mask!1414))))

(assert (=> start!96630 e!627239))

(assert (=> start!96630 tp!81248))

(assert (=> start!96630 true))

(declare-fun tp_is_empty!27153 () Bool)

(assert (=> start!96630 tp_is_empty!27153))

(declare-datatypes ((array!71221 0))(
  ( (array!71222 (arr!34278 (Array (_ BitVec 32) (_ BitVec 64))) (size!34814 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71221)

(declare-fun array_inv!26404 (array!71221) Bool)

(assert (=> start!96630 (array_inv!26404 _keys!1070)))

(declare-datatypes ((V!41331 0))(
  ( (V!41332 (val!13633 Int)) )
))
(declare-datatypes ((ValueCell!12867 0))(
  ( (ValueCellFull!12867 (v!16258 V!41331)) (EmptyCell!12867) )
))
(declare-datatypes ((array!71223 0))(
  ( (array!71224 (arr!34279 (Array (_ BitVec 32) ValueCell!12867)) (size!34815 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71223)

(declare-fun e!627246 () Bool)

(declare-fun array_inv!26405 (array!71223) Bool)

(assert (=> start!96630 (and (array_inv!26405 _values!874) e!627246)))

(declare-fun b!1098959 () Bool)

(declare-fun res!733389 () Bool)

(declare-fun e!627245 () Bool)

(assert (=> b!1098959 (=> (not res!733389) (not e!627245))))

(declare-fun lt!491871 () array!71221)

(declare-datatypes ((List!23938 0))(
  ( (Nil!23935) (Cons!23934 (h!25143 (_ BitVec 64)) (t!34087 List!23938)) )
))
(declare-fun arrayNoDuplicates!0 (array!71221 (_ BitVec 32) List!23938) Bool)

(assert (=> b!1098959 (= res!733389 (arrayNoDuplicates!0 lt!491871 #b00000000000000000000000000000000 Nil!23935))))

(declare-fun b!1098960 () Bool)

(declare-fun res!733391 () Bool)

(assert (=> b!1098960 (=> (not res!733391) (not e!627239))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1098960 (= res!733391 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34814 _keys!1070))))))

(declare-fun b!1098961 () Bool)

(declare-fun e!627241 () Bool)

(assert (=> b!1098961 (= e!627245 (not e!627241))))

(declare-fun res!733390 () Bool)

(assert (=> b!1098961 (=> res!733390 e!627241)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1098961 (= res!733390 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41331)

(declare-fun zeroValue!831 () V!41331)

(declare-datatypes ((tuple2!17318 0))(
  ( (tuple2!17319 (_1!8670 (_ BitVec 64)) (_2!8670 V!41331)) )
))
(declare-datatypes ((List!23939 0))(
  ( (Nil!23936) (Cons!23935 (h!25144 tuple2!17318) (t!34088 List!23939)) )
))
(declare-datatypes ((ListLongMap!15287 0))(
  ( (ListLongMap!15288 (toList!7659 List!23939)) )
))
(declare-fun lt!491873 () ListLongMap!15287)

(declare-fun getCurrentListMap!4376 (array!71221 array!71223 (_ BitVec 32) (_ BitVec 32) V!41331 V!41331 (_ BitVec 32) Int) ListLongMap!15287)

(assert (=> b!1098961 (= lt!491873 (getCurrentListMap!4376 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491884 () ListLongMap!15287)

(declare-fun lt!491879 () array!71223)

(assert (=> b!1098961 (= lt!491884 (getCurrentListMap!4376 lt!491871 lt!491879 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491885 () ListLongMap!15287)

(declare-fun lt!491870 () ListLongMap!15287)

(assert (=> b!1098961 (and (= lt!491885 lt!491870) (= lt!491870 lt!491885))))

(declare-fun lt!491882 () ListLongMap!15287)

(declare-fun -!948 (ListLongMap!15287 (_ BitVec 64)) ListLongMap!15287)

(assert (=> b!1098961 (= lt!491870 (-!948 lt!491882 k0!904))))

(declare-datatypes ((Unit!36136 0))(
  ( (Unit!36137) )
))
(declare-fun lt!491878 () Unit!36136)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!202 (array!71221 array!71223 (_ BitVec 32) (_ BitVec 32) V!41331 V!41331 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36136)

(assert (=> b!1098961 (= lt!491878 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!202 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4172 (array!71221 array!71223 (_ BitVec 32) (_ BitVec 32) V!41331 V!41331 (_ BitVec 32) Int) ListLongMap!15287)

(assert (=> b!1098961 (= lt!491885 (getCurrentListMapNoExtraKeys!4172 lt!491871 lt!491879 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2307 (Int (_ BitVec 64)) V!41331)

(assert (=> b!1098961 (= lt!491879 (array!71224 (store (arr!34279 _values!874) i!650 (ValueCellFull!12867 (dynLambda!2307 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34815 _values!874)))))

(assert (=> b!1098961 (= lt!491882 (getCurrentListMapNoExtraKeys!4172 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1098961 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!491876 () Unit!36136)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71221 (_ BitVec 64) (_ BitVec 32)) Unit!36136)

(assert (=> b!1098961 (= lt!491876 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1098962 () Bool)

(declare-fun e!627240 () Bool)

(assert (=> b!1098962 (= e!627240 tp_is_empty!27153)))

(declare-fun b!1098963 () Bool)

(assert (=> b!1098963 (= e!627239 e!627245)))

(declare-fun res!733392 () Bool)

(assert (=> b!1098963 (=> (not res!733392) (not e!627245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71221 (_ BitVec 32)) Bool)

(assert (=> b!1098963 (= res!733392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491871 mask!1414))))

(assert (=> b!1098963 (= lt!491871 (array!71222 (store (arr!34278 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34814 _keys!1070)))))

(declare-fun b!1098964 () Bool)

(declare-fun e!627242 () Bool)

(assert (=> b!1098964 (= e!627242 tp_is_empty!27153)))

(declare-fun b!1098965 () Bool)

(declare-fun e!627243 () Bool)

(assert (=> b!1098965 (= e!627243 (bvslt i!650 (size!34815 _values!874)))))

(declare-fun lt!491875 () ListLongMap!15287)

(declare-fun lt!491883 () ListLongMap!15287)

(declare-fun lt!491880 () tuple2!17318)

(declare-fun +!3368 (ListLongMap!15287 tuple2!17318) ListLongMap!15287)

(assert (=> b!1098965 (= (-!948 lt!491875 k0!904) (+!3368 lt!491883 lt!491880))))

(declare-fun lt!491877 () Unit!36136)

(declare-fun lt!491872 () ListLongMap!15287)

(declare-fun addRemoveCommutativeForDiffKeys!120 (ListLongMap!15287 (_ BitVec 64) V!41331 (_ BitVec 64)) Unit!36136)

(assert (=> b!1098965 (= lt!491877 (addRemoveCommutativeForDiffKeys!120 lt!491872 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1098966 () Bool)

(assert (=> b!1098966 (= e!627241 e!627243)))

(declare-fun res!733385 () Bool)

(assert (=> b!1098966 (=> res!733385 e!627243)))

(assert (=> b!1098966 (= res!733385 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!491874 () ListLongMap!15287)

(assert (=> b!1098966 (= lt!491883 lt!491874)))

(assert (=> b!1098966 (= lt!491883 (-!948 lt!491872 k0!904))))

(declare-fun lt!491886 () Unit!36136)

(assert (=> b!1098966 (= lt!491886 (addRemoveCommutativeForDiffKeys!120 lt!491882 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (=> b!1098966 (= lt!491884 (+!3368 lt!491874 lt!491880))))

(declare-fun lt!491881 () tuple2!17318)

(assert (=> b!1098966 (= lt!491874 (+!3368 lt!491870 lt!491881))))

(assert (=> b!1098966 (= lt!491873 lt!491875)))

(assert (=> b!1098966 (= lt!491875 (+!3368 lt!491872 lt!491880))))

(assert (=> b!1098966 (= lt!491872 (+!3368 lt!491882 lt!491881))))

(assert (=> b!1098966 (= lt!491884 (+!3368 (+!3368 lt!491885 lt!491881) lt!491880))))

(assert (=> b!1098966 (= lt!491880 (tuple2!17319 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1098966 (= lt!491881 (tuple2!17319 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1098967 () Bool)

(declare-fun mapRes!42502 () Bool)

(assert (=> b!1098967 (= e!627246 (and e!627242 mapRes!42502))))

(declare-fun condMapEmpty!42502 () Bool)

(declare-fun mapDefault!42502 () ValueCell!12867)

(assert (=> b!1098967 (= condMapEmpty!42502 (= (arr!34279 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12867)) mapDefault!42502)))))

(declare-fun b!1098968 () Bool)

(declare-fun res!733388 () Bool)

(assert (=> b!1098968 (=> (not res!733388) (not e!627239))))

(assert (=> b!1098968 (= res!733388 (and (= (size!34815 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34814 _keys!1070) (size!34815 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42502 () Bool)

(assert (=> mapIsEmpty!42502 mapRes!42502))

(declare-fun mapNonEmpty!42502 () Bool)

(declare-fun tp!81247 () Bool)

(assert (=> mapNonEmpty!42502 (= mapRes!42502 (and tp!81247 e!627240))))

(declare-fun mapKey!42502 () (_ BitVec 32))

(declare-fun mapRest!42502 () (Array (_ BitVec 32) ValueCell!12867))

(declare-fun mapValue!42502 () ValueCell!12867)

(assert (=> mapNonEmpty!42502 (= (arr!34279 _values!874) (store mapRest!42502 mapKey!42502 mapValue!42502))))

(declare-fun b!1098969 () Bool)

(declare-fun res!733386 () Bool)

(assert (=> b!1098969 (=> (not res!733386) (not e!627239))))

(assert (=> b!1098969 (= res!733386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1098970 () Bool)

(declare-fun res!733387 () Bool)

(assert (=> b!1098970 (=> (not res!733387) (not e!627239))))

(assert (=> b!1098970 (= res!733387 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23935))))

(declare-fun b!1098971 () Bool)

(declare-fun res!733384 () Bool)

(assert (=> b!1098971 (=> (not res!733384) (not e!627239))))

(assert (=> b!1098971 (= res!733384 (= (select (arr!34278 _keys!1070) i!650) k0!904))))

(assert (= (and start!96630 res!733394) b!1098968))

(assert (= (and b!1098968 res!733388) b!1098969))

(assert (= (and b!1098969 res!733386) b!1098970))

(assert (= (and b!1098970 res!733387) b!1098960))

(assert (= (and b!1098960 res!733391) b!1098958))

(assert (= (and b!1098958 res!733393) b!1098971))

(assert (= (and b!1098971 res!733384) b!1098963))

(assert (= (and b!1098963 res!733392) b!1098959))

(assert (= (and b!1098959 res!733389) b!1098961))

(assert (= (and b!1098961 (not res!733390)) b!1098966))

(assert (= (and b!1098966 (not res!733385)) b!1098965))

(assert (= (and b!1098967 condMapEmpty!42502) mapIsEmpty!42502))

(assert (= (and b!1098967 (not condMapEmpty!42502)) mapNonEmpty!42502))

(get-info :version)

(assert (= (and mapNonEmpty!42502 ((_ is ValueCellFull!12867) mapValue!42502)) b!1098962))

(assert (= (and b!1098967 ((_ is ValueCellFull!12867) mapDefault!42502)) b!1098964))

(assert (= start!96630 b!1098967))

(declare-fun b_lambda!17881 () Bool)

(assert (=> (not b_lambda!17881) (not b!1098961)))

(declare-fun t!34086 () Bool)

(declare-fun tb!7969 () Bool)

(assert (=> (and start!96630 (= defaultEntry!882 defaultEntry!882) t!34086) tb!7969))

(declare-fun result!16469 () Bool)

(assert (=> tb!7969 (= result!16469 tp_is_empty!27153)))

(assert (=> b!1098961 t!34086))

(declare-fun b_and!36927 () Bool)

(assert (= b_and!36925 (and (=> t!34086 result!16469) b_and!36927)))

(declare-fun m!1018817 () Bool)

(assert (=> b!1098969 m!1018817))

(declare-fun m!1018819 () Bool)

(assert (=> b!1098959 m!1018819))

(declare-fun m!1018821 () Bool)

(assert (=> b!1098966 m!1018821))

(declare-fun m!1018823 () Bool)

(assert (=> b!1098966 m!1018823))

(declare-fun m!1018825 () Bool)

(assert (=> b!1098966 m!1018825))

(declare-fun m!1018827 () Bool)

(assert (=> b!1098966 m!1018827))

(declare-fun m!1018829 () Bool)

(assert (=> b!1098966 m!1018829))

(declare-fun m!1018831 () Bool)

(assert (=> b!1098966 m!1018831))

(assert (=> b!1098966 m!1018825))

(declare-fun m!1018833 () Bool)

(assert (=> b!1098966 m!1018833))

(declare-fun m!1018835 () Bool)

(assert (=> b!1098966 m!1018835))

(declare-fun m!1018837 () Bool)

(assert (=> b!1098971 m!1018837))

(declare-fun m!1018839 () Bool)

(assert (=> b!1098963 m!1018839))

(declare-fun m!1018841 () Bool)

(assert (=> b!1098963 m!1018841))

(declare-fun m!1018843 () Bool)

(assert (=> b!1098970 m!1018843))

(declare-fun m!1018845 () Bool)

(assert (=> mapNonEmpty!42502 m!1018845))

(declare-fun m!1018847 () Bool)

(assert (=> b!1098965 m!1018847))

(declare-fun m!1018849 () Bool)

(assert (=> b!1098965 m!1018849))

(declare-fun m!1018851 () Bool)

(assert (=> b!1098965 m!1018851))

(declare-fun m!1018853 () Bool)

(assert (=> b!1098958 m!1018853))

(declare-fun m!1018855 () Bool)

(assert (=> start!96630 m!1018855))

(declare-fun m!1018857 () Bool)

(assert (=> start!96630 m!1018857))

(declare-fun m!1018859 () Bool)

(assert (=> start!96630 m!1018859))

(declare-fun m!1018861 () Bool)

(assert (=> b!1098961 m!1018861))

(declare-fun m!1018863 () Bool)

(assert (=> b!1098961 m!1018863))

(declare-fun m!1018865 () Bool)

(assert (=> b!1098961 m!1018865))

(declare-fun m!1018867 () Bool)

(assert (=> b!1098961 m!1018867))

(declare-fun m!1018869 () Bool)

(assert (=> b!1098961 m!1018869))

(declare-fun m!1018871 () Bool)

(assert (=> b!1098961 m!1018871))

(declare-fun m!1018873 () Bool)

(assert (=> b!1098961 m!1018873))

(declare-fun m!1018875 () Bool)

(assert (=> b!1098961 m!1018875))

(declare-fun m!1018877 () Bool)

(assert (=> b!1098961 m!1018877))

(declare-fun m!1018879 () Bool)

(assert (=> b!1098961 m!1018879))

(check-sat (not b!1098959) (not mapNonEmpty!42502) (not start!96630) b_and!36927 tp_is_empty!27153 (not b!1098961) (not b!1098963) (not b_next!23103) (not b!1098969) (not b!1098965) (not b!1098958) (not b_lambda!17881) (not b!1098970) (not b!1098966))
(check-sat b_and!36927 (not b_next!23103))
