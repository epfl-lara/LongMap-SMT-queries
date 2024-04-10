; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96030 () Bool)

(assert start!96030)

(declare-fun b_free!22683 () Bool)

(declare-fun b_next!22683 () Bool)

(assert (=> start!96030 (= b_free!22683 (not b_next!22683))))

(declare-fun tp!79897 () Bool)

(declare-fun b_and!36041 () Bool)

(assert (=> start!96030 (= tp!79897 b_and!36041)))

(declare-fun b!1088766 () Bool)

(declare-fun e!621885 () Bool)

(declare-fun e!621889 () Bool)

(assert (=> b!1088766 (= e!621885 e!621889)))

(declare-fun res!726199 () Bool)

(assert (=> b!1088766 (=> res!726199 e!621889)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1088766 (= res!726199 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!40707 0))(
  ( (V!40708 (val!13399 Int)) )
))
(declare-datatypes ((tuple2!17014 0))(
  ( (tuple2!17015 (_1!8518 (_ BitVec 64)) (_2!8518 V!40707)) )
))
(declare-datatypes ((List!23602 0))(
  ( (Nil!23599) (Cons!23598 (h!24807 tuple2!17014) (t!33343 List!23602)) )
))
(declare-datatypes ((ListLongMap!14983 0))(
  ( (ListLongMap!14984 (toList!7507 List!23602)) )
))
(declare-fun lt!485095 () ListLongMap!14983)

(declare-fun lt!485092 () ListLongMap!14983)

(assert (=> b!1088766 (= lt!485095 lt!485092)))

(declare-fun lt!485098 () ListLongMap!14983)

(declare-fun lt!485088 () tuple2!17014)

(declare-fun +!3306 (ListLongMap!14983 tuple2!17014) ListLongMap!14983)

(assert (=> b!1088766 (= lt!485092 (+!3306 lt!485098 lt!485088))))

(declare-fun lt!485090 () ListLongMap!14983)

(declare-fun lt!485096 () ListLongMap!14983)

(assert (=> b!1088766 (= lt!485090 lt!485096)))

(declare-fun lt!485091 () ListLongMap!14983)

(assert (=> b!1088766 (= lt!485096 (+!3306 lt!485091 lt!485088))))

(declare-fun lt!485087 () ListLongMap!14983)

(assert (=> b!1088766 (= lt!485095 (+!3306 lt!485087 lt!485088))))

(declare-fun zeroValue!831 () V!40707)

(assert (=> b!1088766 (= lt!485088 (tuple2!17015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088768 () Bool)

(declare-fun e!621883 () Bool)

(declare-fun tp_is_empty!26685 () Bool)

(assert (=> b!1088768 (= e!621883 tp_is_empty!26685)))

(declare-fun b!1088769 () Bool)

(declare-fun e!621888 () Bool)

(declare-fun e!621886 () Bool)

(assert (=> b!1088769 (= e!621888 e!621886)))

(declare-fun res!726203 () Bool)

(assert (=> b!1088769 (=> (not res!726203) (not e!621886))))

(declare-datatypes ((array!70295 0))(
  ( (array!70296 (arr!33821 (Array (_ BitVec 32) (_ BitVec 64))) (size!34357 (_ BitVec 32))) )
))
(declare-fun lt!485093 () array!70295)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70295 (_ BitVec 32)) Bool)

(assert (=> b!1088769 (= res!726203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485093 mask!1414))))

(declare-fun _keys!1070 () array!70295)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088769 (= lt!485093 (array!70296 (store (arr!33821 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34357 _keys!1070)))))

(declare-fun b!1088770 () Bool)

(declare-fun e!621884 () Bool)

(assert (=> b!1088770 (= e!621884 tp_is_empty!26685)))

(declare-fun b!1088771 () Bool)

(declare-fun res!726200 () Bool)

(assert (=> b!1088771 (=> (not res!726200) (not e!621886))))

(declare-datatypes ((List!23603 0))(
  ( (Nil!23600) (Cons!23599 (h!24808 (_ BitVec 64)) (t!33344 List!23603)) )
))
(declare-fun arrayNoDuplicates!0 (array!70295 (_ BitVec 32) List!23603) Bool)

(assert (=> b!1088771 (= res!726200 (arrayNoDuplicates!0 lt!485093 #b00000000000000000000000000000000 Nil!23600))))

(declare-fun b!1088772 () Bool)

(declare-fun res!726201 () Bool)

(assert (=> b!1088772 (=> (not res!726201) (not e!621888))))

(assert (=> b!1088772 (= res!726201 (= (select (arr!33821 _keys!1070) i!650) k0!904))))

(declare-fun b!1088773 () Bool)

(declare-fun res!726197 () Bool)

(assert (=> b!1088773 (=> (not res!726197) (not e!621888))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12633 0))(
  ( (ValueCellFull!12633 (v!16020 V!40707)) (EmptyCell!12633) )
))
(declare-datatypes ((array!70297 0))(
  ( (array!70298 (arr!33822 (Array (_ BitVec 32) ValueCell!12633)) (size!34358 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70297)

(assert (=> b!1088773 (= res!726197 (and (= (size!34358 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34357 _keys!1070) (size!34358 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41782 () Bool)

(declare-fun mapRes!41782 () Bool)

(declare-fun tp!79898 () Bool)

(assert (=> mapNonEmpty!41782 (= mapRes!41782 (and tp!79898 e!621884))))

(declare-fun mapRest!41782 () (Array (_ BitVec 32) ValueCell!12633))

(declare-fun mapValue!41782 () ValueCell!12633)

(declare-fun mapKey!41782 () (_ BitVec 32))

(assert (=> mapNonEmpty!41782 (= (arr!33822 _values!874) (store mapRest!41782 mapKey!41782 mapValue!41782))))

(declare-fun b!1088774 () Bool)

(declare-fun res!726196 () Bool)

(assert (=> b!1088774 (=> (not res!726196) (not e!621888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088774 (= res!726196 (validKeyInArray!0 k0!904))))

(declare-fun b!1088775 () Bool)

(declare-fun res!726198 () Bool)

(assert (=> b!1088775 (=> (not res!726198) (not e!621888))))

(assert (=> b!1088775 (= res!726198 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34357 _keys!1070))))))

(declare-fun b!1088776 () Bool)

(declare-fun res!726202 () Bool)

(assert (=> b!1088776 (=> (not res!726202) (not e!621888))))

(assert (=> b!1088776 (= res!726202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088777 () Bool)

(declare-fun e!621890 () Bool)

(assert (=> b!1088777 (= e!621890 (and e!621883 mapRes!41782))))

(declare-fun condMapEmpty!41782 () Bool)

(declare-fun mapDefault!41782 () ValueCell!12633)

(assert (=> b!1088777 (= condMapEmpty!41782 (= (arr!33822 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12633)) mapDefault!41782)))))

(declare-fun mapIsEmpty!41782 () Bool)

(assert (=> mapIsEmpty!41782 mapRes!41782))

(declare-fun b!1088767 () Bool)

(assert (=> b!1088767 (= e!621886 (not e!621885))))

(declare-fun res!726194 () Bool)

(assert (=> b!1088767 (=> res!726194 e!621885)))

(assert (=> b!1088767 (= res!726194 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40707)

(declare-fun getCurrentListMap!4280 (array!70295 array!70297 (_ BitVec 32) (_ BitVec 32) V!40707 V!40707 (_ BitVec 32) Int) ListLongMap!14983)

(assert (=> b!1088767 (= lt!485090 (getCurrentListMap!4280 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485089 () array!70297)

(assert (=> b!1088767 (= lt!485095 (getCurrentListMap!4280 lt!485093 lt!485089 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1088767 (and (= lt!485087 lt!485098) (= lt!485098 lt!485087))))

(declare-fun -!832 (ListLongMap!14983 (_ BitVec 64)) ListLongMap!14983)

(assert (=> b!1088767 (= lt!485098 (-!832 lt!485091 k0!904))))

(declare-datatypes ((Unit!35830 0))(
  ( (Unit!35831) )
))
(declare-fun lt!485086 () Unit!35830)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!99 (array!70295 array!70297 (_ BitVec 32) (_ BitVec 32) V!40707 V!40707 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35830)

(assert (=> b!1088767 (= lt!485086 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!99 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4040 (array!70295 array!70297 (_ BitVec 32) (_ BitVec 32) V!40707 V!40707 (_ BitVec 32) Int) ListLongMap!14983)

(assert (=> b!1088767 (= lt!485087 (getCurrentListMapNoExtraKeys!4040 lt!485093 lt!485089 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2177 (Int (_ BitVec 64)) V!40707)

(assert (=> b!1088767 (= lt!485089 (array!70298 (store (arr!33822 _values!874) i!650 (ValueCellFull!12633 (dynLambda!2177 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34358 _values!874)))))

(assert (=> b!1088767 (= lt!485091 (getCurrentListMapNoExtraKeys!4040 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088767 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485094 () Unit!35830)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70295 (_ BitVec 64) (_ BitVec 32)) Unit!35830)

(assert (=> b!1088767 (= lt!485094 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!726204 () Bool)

(assert (=> start!96030 (=> (not res!726204) (not e!621888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96030 (= res!726204 (validMask!0 mask!1414))))

(assert (=> start!96030 e!621888))

(assert (=> start!96030 tp!79897))

(assert (=> start!96030 true))

(assert (=> start!96030 tp_is_empty!26685))

(declare-fun array_inv!26084 (array!70295) Bool)

(assert (=> start!96030 (array_inv!26084 _keys!1070)))

(declare-fun array_inv!26085 (array!70297) Bool)

(assert (=> start!96030 (and (array_inv!26085 _values!874) e!621890)))

(declare-fun b!1088778 () Bool)

(assert (=> b!1088778 (= e!621889 true)))

(assert (=> b!1088778 (= (-!832 lt!485096 k0!904) lt!485092)))

(declare-fun lt!485097 () Unit!35830)

(declare-fun addRemoveCommutativeForDiffKeys!60 (ListLongMap!14983 (_ BitVec 64) V!40707 (_ BitVec 64)) Unit!35830)

(assert (=> b!1088778 (= lt!485097 (addRemoveCommutativeForDiffKeys!60 lt!485091 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1088779 () Bool)

(declare-fun res!726195 () Bool)

(assert (=> b!1088779 (=> (not res!726195) (not e!621888))))

(assert (=> b!1088779 (= res!726195 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23600))))

(assert (= (and start!96030 res!726204) b!1088773))

(assert (= (and b!1088773 res!726197) b!1088776))

(assert (= (and b!1088776 res!726202) b!1088779))

(assert (= (and b!1088779 res!726195) b!1088775))

(assert (= (and b!1088775 res!726198) b!1088774))

(assert (= (and b!1088774 res!726196) b!1088772))

(assert (= (and b!1088772 res!726201) b!1088769))

(assert (= (and b!1088769 res!726203) b!1088771))

(assert (= (and b!1088771 res!726200) b!1088767))

(assert (= (and b!1088767 (not res!726194)) b!1088766))

(assert (= (and b!1088766 (not res!726199)) b!1088778))

(assert (= (and b!1088777 condMapEmpty!41782) mapIsEmpty!41782))

(assert (= (and b!1088777 (not condMapEmpty!41782)) mapNonEmpty!41782))

(get-info :version)

(assert (= (and mapNonEmpty!41782 ((_ is ValueCellFull!12633) mapValue!41782)) b!1088770))

(assert (= (and b!1088777 ((_ is ValueCellFull!12633) mapDefault!41782)) b!1088768))

(assert (= start!96030 b!1088777))

(declare-fun b_lambda!17353 () Bool)

(assert (=> (not b_lambda!17353) (not b!1088767)))

(declare-fun t!33342 () Bool)

(declare-fun tb!7561 () Bool)

(assert (=> (and start!96030 (= defaultEntry!882 defaultEntry!882) t!33342) tb!7561))

(declare-fun result!15641 () Bool)

(assert (=> tb!7561 (= result!15641 tp_is_empty!26685)))

(assert (=> b!1088767 t!33342))

(declare-fun b_and!36043 () Bool)

(assert (= b_and!36041 (and (=> t!33342 result!15641) b_and!36043)))

(declare-fun m!1007891 () Bool)

(assert (=> b!1088771 m!1007891))

(declare-fun m!1007893 () Bool)

(assert (=> b!1088766 m!1007893))

(declare-fun m!1007895 () Bool)

(assert (=> b!1088766 m!1007895))

(declare-fun m!1007897 () Bool)

(assert (=> b!1088766 m!1007897))

(declare-fun m!1007899 () Bool)

(assert (=> b!1088772 m!1007899))

(declare-fun m!1007901 () Bool)

(assert (=> b!1088769 m!1007901))

(declare-fun m!1007903 () Bool)

(assert (=> b!1088769 m!1007903))

(declare-fun m!1007905 () Bool)

(assert (=> mapNonEmpty!41782 m!1007905))

(declare-fun m!1007907 () Bool)

(assert (=> start!96030 m!1007907))

(declare-fun m!1007909 () Bool)

(assert (=> start!96030 m!1007909))

(declare-fun m!1007911 () Bool)

(assert (=> start!96030 m!1007911))

(declare-fun m!1007913 () Bool)

(assert (=> b!1088779 m!1007913))

(declare-fun m!1007915 () Bool)

(assert (=> b!1088774 m!1007915))

(declare-fun m!1007917 () Bool)

(assert (=> b!1088767 m!1007917))

(declare-fun m!1007919 () Bool)

(assert (=> b!1088767 m!1007919))

(declare-fun m!1007921 () Bool)

(assert (=> b!1088767 m!1007921))

(declare-fun m!1007923 () Bool)

(assert (=> b!1088767 m!1007923))

(declare-fun m!1007925 () Bool)

(assert (=> b!1088767 m!1007925))

(declare-fun m!1007927 () Bool)

(assert (=> b!1088767 m!1007927))

(declare-fun m!1007929 () Bool)

(assert (=> b!1088767 m!1007929))

(declare-fun m!1007931 () Bool)

(assert (=> b!1088767 m!1007931))

(declare-fun m!1007933 () Bool)

(assert (=> b!1088767 m!1007933))

(declare-fun m!1007935 () Bool)

(assert (=> b!1088767 m!1007935))

(declare-fun m!1007937 () Bool)

(assert (=> b!1088778 m!1007937))

(declare-fun m!1007939 () Bool)

(assert (=> b!1088778 m!1007939))

(declare-fun m!1007941 () Bool)

(assert (=> b!1088776 m!1007941))

(check-sat (not b!1088776) (not b!1088779) (not b!1088767) (not b!1088771) (not b!1088778) (not start!96030) b_and!36043 (not b!1088769) (not b_next!22683) (not mapNonEmpty!41782) (not b!1088766) tp_is_empty!26685 (not b!1088774) (not b_lambda!17353))
(check-sat b_and!36043 (not b_next!22683))
