; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96180 () Bool)

(assert start!96180)

(declare-fun b_free!22833 () Bool)

(declare-fun b_next!22833 () Bool)

(assert (=> start!96180 (= b_free!22833 (not b_next!22833))))

(declare-fun tp!80348 () Bool)

(declare-fun b_and!36341 () Bool)

(assert (=> start!96180 (= tp!80348 b_and!36341)))

(declare-fun mapNonEmpty!42007 () Bool)

(declare-fun mapRes!42007 () Bool)

(declare-fun tp!80347 () Bool)

(declare-fun e!623686 () Bool)

(assert (=> mapNonEmpty!42007 (= mapRes!42007 (and tp!80347 e!623686))))

(declare-datatypes ((V!40907 0))(
  ( (V!40908 (val!13474 Int)) )
))
(declare-datatypes ((ValueCell!12708 0))(
  ( (ValueCellFull!12708 (v!16095 V!40907)) (EmptyCell!12708) )
))
(declare-datatypes ((array!70589 0))(
  ( (array!70590 (arr!33968 (Array (_ BitVec 32) ValueCell!12708)) (size!34504 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70589)

(declare-fun mapKey!42007 () (_ BitVec 32))

(declare-fun mapValue!42007 () ValueCell!12708)

(declare-fun mapRest!42007 () (Array (_ BitVec 32) ValueCell!12708))

(assert (=> mapNonEmpty!42007 (= (arr!33968 _values!874) (store mapRest!42007 mapKey!42007 mapValue!42007))))

(declare-fun mapIsEmpty!42007 () Bool)

(assert (=> mapIsEmpty!42007 mapRes!42007))

(declare-fun b!1092075 () Bool)

(declare-fun res!728688 () Bool)

(declare-fun e!623687 () Bool)

(assert (=> b!1092075 (=> (not res!728688) (not e!623687))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70591 0))(
  ( (array!70592 (arr!33969 (Array (_ BitVec 32) (_ BitVec 64))) (size!34505 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70591)

(assert (=> b!1092075 (= res!728688 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34505 _keys!1070))))))

(declare-fun b!1092076 () Bool)

(declare-fun res!728686 () Bool)

(assert (=> b!1092076 (=> (not res!728686) (not e!623687))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092076 (= res!728686 (validKeyInArray!0 k0!904))))

(declare-fun b!1092077 () Bool)

(declare-fun res!728680 () Bool)

(assert (=> b!1092077 (=> (not res!728680) (not e!623687))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70591 (_ BitVec 32)) Bool)

(assert (=> b!1092077 (= res!728680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092078 () Bool)

(declare-fun e!623688 () Bool)

(declare-fun tp_is_empty!26835 () Bool)

(assert (=> b!1092078 (= e!623688 tp_is_empty!26835)))

(declare-fun b!1092079 () Bool)

(assert (=> b!1092079 (= e!623686 tp_is_empty!26835)))

(declare-fun b!1092080 () Bool)

(declare-fun e!623683 () Bool)

(declare-fun e!623684 () Bool)

(assert (=> b!1092080 (= e!623683 e!623684)))

(declare-fun res!728683 () Bool)

(assert (=> b!1092080 (=> res!728683 e!623684)))

(assert (=> b!1092080 (= res!728683 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!17144 0))(
  ( (tuple2!17145 (_1!8583 (_ BitVec 64)) (_2!8583 V!40907)) )
))
(declare-datatypes ((List!23728 0))(
  ( (Nil!23725) (Cons!23724 (h!24933 tuple2!17144) (t!33619 List!23728)) )
))
(declare-datatypes ((ListLongMap!15113 0))(
  ( (ListLongMap!15114 (toList!7572 List!23728)) )
))
(declare-fun lt!487990 () ListLongMap!15113)

(declare-fun lt!487986 () ListLongMap!15113)

(assert (=> b!1092080 (= lt!487990 lt!487986)))

(declare-fun lt!487994 () ListLongMap!15113)

(declare-fun lt!487985 () tuple2!17144)

(declare-fun +!3353 (ListLongMap!15113 tuple2!17144) ListLongMap!15113)

(assert (=> b!1092080 (= lt!487986 (+!3353 lt!487994 lt!487985))))

(declare-fun lt!487987 () ListLongMap!15113)

(declare-fun lt!487984 () ListLongMap!15113)

(assert (=> b!1092080 (= lt!487987 lt!487984)))

(declare-fun lt!487996 () ListLongMap!15113)

(assert (=> b!1092080 (= lt!487984 (+!3353 lt!487996 lt!487985))))

(declare-fun lt!487991 () ListLongMap!15113)

(assert (=> b!1092080 (= lt!487987 (+!3353 lt!487991 lt!487985))))

(declare-fun minValue!831 () V!40907)

(assert (=> b!1092080 (= lt!487985 (tuple2!17145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1092082 () Bool)

(declare-fun res!728679 () Bool)

(declare-fun e!623685 () Bool)

(assert (=> b!1092082 (=> (not res!728679) (not e!623685))))

(declare-fun lt!487992 () array!70591)

(declare-datatypes ((List!23729 0))(
  ( (Nil!23726) (Cons!23725 (h!24934 (_ BitVec 64)) (t!33620 List!23729)) )
))
(declare-fun arrayNoDuplicates!0 (array!70591 (_ BitVec 32) List!23729) Bool)

(assert (=> b!1092082 (= res!728679 (arrayNoDuplicates!0 lt!487992 #b00000000000000000000000000000000 Nil!23726))))

(declare-fun b!1092083 () Bool)

(assert (=> b!1092083 (= e!623684 true)))

(declare-fun -!891 (ListLongMap!15113 (_ BitVec 64)) ListLongMap!15113)

(assert (=> b!1092083 (= (-!891 lt!487986 k0!904) lt!487984)))

(declare-datatypes ((Unit!35948 0))(
  ( (Unit!35949) )
))
(declare-fun lt!487988 () Unit!35948)

(declare-fun addRemoveCommutativeForDiffKeys!112 (ListLongMap!15113 (_ BitVec 64) V!40907 (_ BitVec 64)) Unit!35948)

(assert (=> b!1092083 (= lt!487988 (addRemoveCommutativeForDiffKeys!112 lt!487994 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1092084 () Bool)

(assert (=> b!1092084 (= e!623687 e!623685)))

(declare-fun res!728682 () Bool)

(assert (=> b!1092084 (=> (not res!728682) (not e!623685))))

(assert (=> b!1092084 (= res!728682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487992 mask!1414))))

(assert (=> b!1092084 (= lt!487992 (array!70592 (store (arr!33969 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34505 _keys!1070)))))

(declare-fun b!1092081 () Bool)

(declare-fun res!728678 () Bool)

(assert (=> b!1092081 (=> (not res!728678) (not e!623687))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1092081 (= res!728678 (and (= (size!34504 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34505 _keys!1070) (size!34504 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!728681 () Bool)

(assert (=> start!96180 (=> (not res!728681) (not e!623687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96180 (= res!728681 (validMask!0 mask!1414))))

(assert (=> start!96180 e!623687))

(assert (=> start!96180 tp!80348))

(assert (=> start!96180 true))

(assert (=> start!96180 tp_is_empty!26835))

(declare-fun array_inv!26188 (array!70591) Bool)

(assert (=> start!96180 (array_inv!26188 _keys!1070)))

(declare-fun e!623690 () Bool)

(declare-fun array_inv!26189 (array!70589) Bool)

(assert (=> start!96180 (and (array_inv!26189 _values!874) e!623690)))

(declare-fun b!1092085 () Bool)

(assert (=> b!1092085 (= e!623685 (not e!623683))))

(declare-fun res!728684 () Bool)

(assert (=> b!1092085 (=> res!728684 e!623683)))

(assert (=> b!1092085 (= res!728684 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40907)

(declare-fun getCurrentListMap!4328 (array!70591 array!70589 (_ BitVec 32) (_ BitVec 32) V!40907 V!40907 (_ BitVec 32) Int) ListLongMap!15113)

(assert (=> b!1092085 (= lt!487990 (getCurrentListMap!4328 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487993 () array!70589)

(assert (=> b!1092085 (= lt!487987 (getCurrentListMap!4328 lt!487992 lt!487993 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1092085 (and (= lt!487991 lt!487996) (= lt!487996 lt!487991))))

(assert (=> b!1092085 (= lt!487996 (-!891 lt!487994 k0!904))))

(declare-fun lt!487995 () Unit!35948)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!147 (array!70591 array!70589 (_ BitVec 32) (_ BitVec 32) V!40907 V!40907 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35948)

(assert (=> b!1092085 (= lt!487995 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!147 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4088 (array!70591 array!70589 (_ BitVec 32) (_ BitVec 32) V!40907 V!40907 (_ BitVec 32) Int) ListLongMap!15113)

(assert (=> b!1092085 (= lt!487991 (getCurrentListMapNoExtraKeys!4088 lt!487992 lt!487993 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2225 (Int (_ BitVec 64)) V!40907)

(assert (=> b!1092085 (= lt!487993 (array!70590 (store (arr!33968 _values!874) i!650 (ValueCellFull!12708 (dynLambda!2225 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34504 _values!874)))))

(assert (=> b!1092085 (= lt!487994 (getCurrentListMapNoExtraKeys!4088 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092085 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487989 () Unit!35948)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70591 (_ BitVec 64) (_ BitVec 32)) Unit!35948)

(assert (=> b!1092085 (= lt!487989 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1092086 () Bool)

(assert (=> b!1092086 (= e!623690 (and e!623688 mapRes!42007))))

(declare-fun condMapEmpty!42007 () Bool)

(declare-fun mapDefault!42007 () ValueCell!12708)

(assert (=> b!1092086 (= condMapEmpty!42007 (= (arr!33968 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12708)) mapDefault!42007)))))

(declare-fun b!1092087 () Bool)

(declare-fun res!728687 () Bool)

(assert (=> b!1092087 (=> (not res!728687) (not e!623687))))

(assert (=> b!1092087 (= res!728687 (= (select (arr!33969 _keys!1070) i!650) k0!904))))

(declare-fun b!1092088 () Bool)

(declare-fun res!728685 () Bool)

(assert (=> b!1092088 (=> (not res!728685) (not e!623687))))

(assert (=> b!1092088 (= res!728685 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23726))))

(assert (= (and start!96180 res!728681) b!1092081))

(assert (= (and b!1092081 res!728678) b!1092077))

(assert (= (and b!1092077 res!728680) b!1092088))

(assert (= (and b!1092088 res!728685) b!1092075))

(assert (= (and b!1092075 res!728688) b!1092076))

(assert (= (and b!1092076 res!728686) b!1092087))

(assert (= (and b!1092087 res!728687) b!1092084))

(assert (= (and b!1092084 res!728682) b!1092082))

(assert (= (and b!1092082 res!728679) b!1092085))

(assert (= (and b!1092085 (not res!728684)) b!1092080))

(assert (= (and b!1092080 (not res!728683)) b!1092083))

(assert (= (and b!1092086 condMapEmpty!42007) mapIsEmpty!42007))

(assert (= (and b!1092086 (not condMapEmpty!42007)) mapNonEmpty!42007))

(get-info :version)

(assert (= (and mapNonEmpty!42007 ((_ is ValueCellFull!12708) mapValue!42007)) b!1092079))

(assert (= (and b!1092086 ((_ is ValueCellFull!12708) mapDefault!42007)) b!1092078))

(assert (= start!96180 b!1092086))

(declare-fun b_lambda!17503 () Bool)

(assert (=> (not b_lambda!17503) (not b!1092085)))

(declare-fun t!33618 () Bool)

(declare-fun tb!7711 () Bool)

(assert (=> (and start!96180 (= defaultEntry!882 defaultEntry!882) t!33618) tb!7711))

(declare-fun result!15941 () Bool)

(assert (=> tb!7711 (= result!15941 tp_is_empty!26835)))

(assert (=> b!1092085 t!33618))

(declare-fun b_and!36343 () Bool)

(assert (= b_and!36341 (and (=> t!33618 result!15941) b_and!36343)))

(declare-fun m!1011779 () Bool)

(assert (=> b!1092087 m!1011779))

(declare-fun m!1011781 () Bool)

(assert (=> b!1092085 m!1011781))

(declare-fun m!1011783 () Bool)

(assert (=> b!1092085 m!1011783))

(declare-fun m!1011785 () Bool)

(assert (=> b!1092085 m!1011785))

(declare-fun m!1011787 () Bool)

(assert (=> b!1092085 m!1011787))

(declare-fun m!1011789 () Bool)

(assert (=> b!1092085 m!1011789))

(declare-fun m!1011791 () Bool)

(assert (=> b!1092085 m!1011791))

(declare-fun m!1011793 () Bool)

(assert (=> b!1092085 m!1011793))

(declare-fun m!1011795 () Bool)

(assert (=> b!1092085 m!1011795))

(declare-fun m!1011797 () Bool)

(assert (=> b!1092085 m!1011797))

(declare-fun m!1011799 () Bool)

(assert (=> b!1092085 m!1011799))

(declare-fun m!1011801 () Bool)

(assert (=> b!1092083 m!1011801))

(declare-fun m!1011803 () Bool)

(assert (=> b!1092083 m!1011803))

(declare-fun m!1011805 () Bool)

(assert (=> b!1092077 m!1011805))

(declare-fun m!1011807 () Bool)

(assert (=> mapNonEmpty!42007 m!1011807))

(declare-fun m!1011809 () Bool)

(assert (=> b!1092080 m!1011809))

(declare-fun m!1011811 () Bool)

(assert (=> b!1092080 m!1011811))

(declare-fun m!1011813 () Bool)

(assert (=> b!1092080 m!1011813))

(declare-fun m!1011815 () Bool)

(assert (=> b!1092088 m!1011815))

(declare-fun m!1011817 () Bool)

(assert (=> b!1092082 m!1011817))

(declare-fun m!1011819 () Bool)

(assert (=> b!1092076 m!1011819))

(declare-fun m!1011821 () Bool)

(assert (=> start!96180 m!1011821))

(declare-fun m!1011823 () Bool)

(assert (=> start!96180 m!1011823))

(declare-fun m!1011825 () Bool)

(assert (=> start!96180 m!1011825))

(declare-fun m!1011827 () Bool)

(assert (=> b!1092084 m!1011827))

(declare-fun m!1011829 () Bool)

(assert (=> b!1092084 m!1011829))

(check-sat (not b!1092077) b_and!36343 (not mapNonEmpty!42007) (not b!1092084) (not start!96180) (not b!1092080) (not b_next!22833) (not b!1092088) (not b!1092082) (not b!1092085) (not b!1092083) (not b!1092076) tp_is_empty!26835 (not b_lambda!17503))
(check-sat b_and!36343 (not b_next!22833))
