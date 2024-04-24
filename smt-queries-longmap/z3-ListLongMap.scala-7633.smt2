; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96354 () Bool)

(assert start!96354)

(declare-fun b_free!22771 () Bool)

(declare-fun b_next!22771 () Bool)

(assert (=> start!96354 (= b_free!22771 (not b_next!22771))))

(declare-fun tp!80161 () Bool)

(declare-fun b_and!36227 () Bool)

(assert (=> start!96354 (= tp!80161 b_and!36227)))

(declare-fun b!1092038 () Bool)

(declare-fun res!728187 () Bool)

(declare-fun e!623799 () Bool)

(assert (=> b!1092038 (=> (not res!728187) (not e!623799))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092038 (= res!728187 (validKeyInArray!0 k0!904))))

(declare-fun b!1092039 () Bool)

(declare-fun res!728179 () Bool)

(assert (=> b!1092039 (=> (not res!728179) (not e!623799))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70503 0))(
  ( (array!70504 (arr!33919 (Array (_ BitVec 32) (_ BitVec 64))) (size!34456 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70503)

(declare-datatypes ((V!40825 0))(
  ( (V!40826 (val!13443 Int)) )
))
(declare-datatypes ((ValueCell!12677 0))(
  ( (ValueCellFull!12677 (v!16060 V!40825)) (EmptyCell!12677) )
))
(declare-datatypes ((array!70505 0))(
  ( (array!70506 (arr!33920 (Array (_ BitVec 32) ValueCell!12677)) (size!34457 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70505)

(assert (=> b!1092039 (= res!728179 (and (= (size!34457 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34456 _keys!1070) (size!34457 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092040 () Bool)

(declare-fun e!623801 () Bool)

(declare-fun tp_is_empty!26773 () Bool)

(assert (=> b!1092040 (= e!623801 tp_is_empty!26773)))

(declare-fun b!1092041 () Bool)

(declare-fun res!728182 () Bool)

(assert (=> b!1092041 (=> (not res!728182) (not e!623799))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1092041 (= res!728182 (= (select (arr!33919 _keys!1070) i!650) k0!904))))

(declare-fun b!1092042 () Bool)

(declare-fun e!623797 () Bool)

(declare-fun mapRes!41914 () Bool)

(assert (=> b!1092042 (= e!623797 (and e!623801 mapRes!41914))))

(declare-fun condMapEmpty!41914 () Bool)

(declare-fun mapDefault!41914 () ValueCell!12677)

(assert (=> b!1092042 (= condMapEmpty!41914 (= (arr!33920 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12677)) mapDefault!41914)))))

(declare-fun b!1092043 () Bool)

(declare-fun e!623794 () Bool)

(declare-fun e!623796 () Bool)

(assert (=> b!1092043 (= e!623794 (not e!623796))))

(declare-fun res!728186 () Bool)

(assert (=> b!1092043 (=> res!728186 e!623796)))

(assert (=> b!1092043 (= res!728186 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40825)

(declare-fun zeroValue!831 () V!40825)

(declare-datatypes ((tuple2!17100 0))(
  ( (tuple2!17101 (_1!8561 (_ BitVec 64)) (_2!8561 V!40825)) )
))
(declare-datatypes ((List!23691 0))(
  ( (Nil!23688) (Cons!23687 (h!24905 tuple2!17100) (t!33512 List!23691)) )
))
(declare-datatypes ((ListLongMap!15077 0))(
  ( (ListLongMap!15078 (toList!7554 List!23691)) )
))
(declare-fun lt!487300 () ListLongMap!15077)

(declare-fun getCurrentListMap!4306 (array!70503 array!70505 (_ BitVec 32) (_ BitVec 32) V!40825 V!40825 (_ BitVec 32) Int) ListLongMap!15077)

(assert (=> b!1092043 (= lt!487300 (getCurrentListMap!4306 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487295 () array!70503)

(declare-fun lt!487296 () array!70505)

(declare-fun lt!487291 () ListLongMap!15077)

(assert (=> b!1092043 (= lt!487291 (getCurrentListMap!4306 lt!487295 lt!487296 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487301 () ListLongMap!15077)

(declare-fun lt!487297 () ListLongMap!15077)

(assert (=> b!1092043 (and (= lt!487301 lt!487297) (= lt!487297 lt!487301))))

(declare-fun lt!487294 () ListLongMap!15077)

(declare-fun -!860 (ListLongMap!15077 (_ BitVec 64)) ListLongMap!15077)

(assert (=> b!1092043 (= lt!487297 (-!860 lt!487294 k0!904))))

(declare-datatypes ((Unit!35887 0))(
  ( (Unit!35888) )
))
(declare-fun lt!487290 () Unit!35887)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!135 (array!70503 array!70505 (_ BitVec 32) (_ BitVec 32) V!40825 V!40825 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35887)

(assert (=> b!1092043 (= lt!487290 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!135 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4111 (array!70503 array!70505 (_ BitVec 32) (_ BitVec 32) V!40825 V!40825 (_ BitVec 32) Int) ListLongMap!15077)

(assert (=> b!1092043 (= lt!487301 (getCurrentListMapNoExtraKeys!4111 lt!487295 lt!487296 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2232 (Int (_ BitVec 64)) V!40825)

(assert (=> b!1092043 (= lt!487296 (array!70506 (store (arr!33920 _values!874) i!650 (ValueCellFull!12677 (dynLambda!2232 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34457 _values!874)))))

(assert (=> b!1092043 (= lt!487294 (getCurrentListMapNoExtraKeys!4111 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092043 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487299 () Unit!35887)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70503 (_ BitVec 64) (_ BitVec 32)) Unit!35887)

(assert (=> b!1092043 (= lt!487299 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1092044 () Bool)

(assert (=> b!1092044 (= e!623799 e!623794)))

(declare-fun res!728177 () Bool)

(assert (=> b!1092044 (=> (not res!728177) (not e!623794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70503 (_ BitVec 32)) Bool)

(assert (=> b!1092044 (= res!728177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487295 mask!1414))))

(assert (=> b!1092044 (= lt!487295 (array!70504 (store (arr!33919 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34456 _keys!1070)))))

(declare-fun b!1092045 () Bool)

(declare-fun res!728181 () Bool)

(assert (=> b!1092045 (=> (not res!728181) (not e!623799))))

(declare-datatypes ((List!23692 0))(
  ( (Nil!23689) (Cons!23688 (h!24906 (_ BitVec 64)) (t!33513 List!23692)) )
))
(declare-fun arrayNoDuplicates!0 (array!70503 (_ BitVec 32) List!23692) Bool)

(assert (=> b!1092045 (= res!728181 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23689))))

(declare-fun res!728185 () Bool)

(assert (=> start!96354 (=> (not res!728185) (not e!623799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96354 (= res!728185 (validMask!0 mask!1414))))

(assert (=> start!96354 e!623799))

(assert (=> start!96354 tp!80161))

(assert (=> start!96354 true))

(assert (=> start!96354 tp_is_empty!26773))

(declare-fun array_inv!26202 (array!70503) Bool)

(assert (=> start!96354 (array_inv!26202 _keys!1070)))

(declare-fun array_inv!26203 (array!70505) Bool)

(assert (=> start!96354 (and (array_inv!26203 _values!874) e!623797)))

(declare-fun b!1092046 () Bool)

(declare-fun res!728178 () Bool)

(assert (=> b!1092046 (=> (not res!728178) (not e!623799))))

(assert (=> b!1092046 (= res!728178 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34456 _keys!1070))))))

(declare-fun b!1092047 () Bool)

(declare-fun res!728183 () Bool)

(assert (=> b!1092047 (=> (not res!728183) (not e!623794))))

(assert (=> b!1092047 (= res!728183 (arrayNoDuplicates!0 lt!487295 #b00000000000000000000000000000000 Nil!23689))))

(declare-fun mapIsEmpty!41914 () Bool)

(assert (=> mapIsEmpty!41914 mapRes!41914))

(declare-fun b!1092048 () Bool)

(declare-fun e!623800 () Bool)

(assert (=> b!1092048 (= e!623800 tp_is_empty!26773)))

(declare-fun b!1092049 () Bool)

(declare-fun e!623798 () Bool)

(assert (=> b!1092049 (= e!623798 true)))

(declare-fun lt!487292 () ListLongMap!15077)

(declare-fun lt!487302 () ListLongMap!15077)

(assert (=> b!1092049 (= (-!860 lt!487292 k0!904) lt!487302)))

(declare-fun lt!487293 () Unit!35887)

(declare-fun addRemoveCommutativeForDiffKeys!94 (ListLongMap!15077 (_ BitVec 64) V!40825 (_ BitVec 64)) Unit!35887)

(assert (=> b!1092049 (= lt!487293 (addRemoveCommutativeForDiffKeys!94 lt!487294 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1092050 () Bool)

(declare-fun res!728180 () Bool)

(assert (=> b!1092050 (=> (not res!728180) (not e!623799))))

(assert (=> b!1092050 (= res!728180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092051 () Bool)

(assert (=> b!1092051 (= e!623796 e!623798)))

(declare-fun res!728184 () Bool)

(assert (=> b!1092051 (=> res!728184 e!623798)))

(assert (=> b!1092051 (= res!728184 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1092051 (= lt!487300 lt!487292)))

(declare-fun lt!487298 () tuple2!17100)

(declare-fun +!3369 (ListLongMap!15077 tuple2!17100) ListLongMap!15077)

(assert (=> b!1092051 (= lt!487292 (+!3369 lt!487294 lt!487298))))

(assert (=> b!1092051 (= lt!487291 lt!487302)))

(assert (=> b!1092051 (= lt!487302 (+!3369 lt!487297 lt!487298))))

(assert (=> b!1092051 (= lt!487291 (+!3369 lt!487301 lt!487298))))

(assert (=> b!1092051 (= lt!487298 (tuple2!17101 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun mapNonEmpty!41914 () Bool)

(declare-fun tp!80162 () Bool)

(assert (=> mapNonEmpty!41914 (= mapRes!41914 (and tp!80162 e!623800))))

(declare-fun mapValue!41914 () ValueCell!12677)

(declare-fun mapRest!41914 () (Array (_ BitVec 32) ValueCell!12677))

(declare-fun mapKey!41914 () (_ BitVec 32))

(assert (=> mapNonEmpty!41914 (= (arr!33920 _values!874) (store mapRest!41914 mapKey!41914 mapValue!41914))))

(assert (= (and start!96354 res!728185) b!1092039))

(assert (= (and b!1092039 res!728179) b!1092050))

(assert (= (and b!1092050 res!728180) b!1092045))

(assert (= (and b!1092045 res!728181) b!1092046))

(assert (= (and b!1092046 res!728178) b!1092038))

(assert (= (and b!1092038 res!728187) b!1092041))

(assert (= (and b!1092041 res!728182) b!1092044))

(assert (= (and b!1092044 res!728177) b!1092047))

(assert (= (and b!1092047 res!728183) b!1092043))

(assert (= (and b!1092043 (not res!728186)) b!1092051))

(assert (= (and b!1092051 (not res!728184)) b!1092049))

(assert (= (and b!1092042 condMapEmpty!41914) mapIsEmpty!41914))

(assert (= (and b!1092042 (not condMapEmpty!41914)) mapNonEmpty!41914))

(get-info :version)

(assert (= (and mapNonEmpty!41914 ((_ is ValueCellFull!12677) mapValue!41914)) b!1092048))

(assert (= (and b!1092042 ((_ is ValueCellFull!12677) mapDefault!41914)) b!1092040))

(assert (= start!96354 b!1092042))

(declare-fun b_lambda!17451 () Bool)

(assert (=> (not b_lambda!17451) (not b!1092043)))

(declare-fun t!33511 () Bool)

(declare-fun tb!7641 () Bool)

(assert (=> (and start!96354 (= defaultEntry!882 defaultEntry!882) t!33511) tb!7641))

(declare-fun result!15809 () Bool)

(assert (=> tb!7641 (= result!15809 tp_is_empty!26773)))

(assert (=> b!1092043 t!33511))

(declare-fun b_and!36229 () Bool)

(assert (= b_and!36227 (and (=> t!33511 result!15809) b_and!36229)))

(declare-fun m!1011839 () Bool)

(assert (=> b!1092044 m!1011839))

(declare-fun m!1011841 () Bool)

(assert (=> b!1092044 m!1011841))

(declare-fun m!1011843 () Bool)

(assert (=> start!96354 m!1011843))

(declare-fun m!1011845 () Bool)

(assert (=> start!96354 m!1011845))

(declare-fun m!1011847 () Bool)

(assert (=> start!96354 m!1011847))

(declare-fun m!1011849 () Bool)

(assert (=> b!1092051 m!1011849))

(declare-fun m!1011851 () Bool)

(assert (=> b!1092051 m!1011851))

(declare-fun m!1011853 () Bool)

(assert (=> b!1092051 m!1011853))

(declare-fun m!1011855 () Bool)

(assert (=> b!1092050 m!1011855))

(declare-fun m!1011857 () Bool)

(assert (=> b!1092045 m!1011857))

(declare-fun m!1011859 () Bool)

(assert (=> b!1092038 m!1011859))

(declare-fun m!1011861 () Bool)

(assert (=> b!1092041 m!1011861))

(declare-fun m!1011863 () Bool)

(assert (=> b!1092043 m!1011863))

(declare-fun m!1011865 () Bool)

(assert (=> b!1092043 m!1011865))

(declare-fun m!1011867 () Bool)

(assert (=> b!1092043 m!1011867))

(declare-fun m!1011869 () Bool)

(assert (=> b!1092043 m!1011869))

(declare-fun m!1011871 () Bool)

(assert (=> b!1092043 m!1011871))

(declare-fun m!1011873 () Bool)

(assert (=> b!1092043 m!1011873))

(declare-fun m!1011875 () Bool)

(assert (=> b!1092043 m!1011875))

(declare-fun m!1011877 () Bool)

(assert (=> b!1092043 m!1011877))

(declare-fun m!1011879 () Bool)

(assert (=> b!1092043 m!1011879))

(declare-fun m!1011881 () Bool)

(assert (=> b!1092043 m!1011881))

(declare-fun m!1011883 () Bool)

(assert (=> mapNonEmpty!41914 m!1011883))

(declare-fun m!1011885 () Bool)

(assert (=> b!1092047 m!1011885))

(declare-fun m!1011887 () Bool)

(assert (=> b!1092049 m!1011887))

(declare-fun m!1011889 () Bool)

(assert (=> b!1092049 m!1011889))

(check-sat (not start!96354) tp_is_empty!26773 (not b!1092051) (not b_lambda!17451) (not b!1092045) (not b!1092049) (not b!1092047) (not b!1092044) (not b_next!22771) (not mapNonEmpty!41914) (not b!1092043) (not b!1092038) b_and!36229 (not b!1092050))
(check-sat b_and!36229 (not b_next!22771))
