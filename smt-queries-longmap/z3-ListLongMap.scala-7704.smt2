; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96990 () Bool)

(assert start!96990)

(declare-fun b_free!23149 () Bool)

(declare-fun b_next!23149 () Bool)

(assert (=> start!96990 (= b_free!23149 (not b_next!23149))))

(declare-fun tp!81394 () Bool)

(declare-fun b_and!37069 () Bool)

(assert (=> start!96990 (= tp!81394 b_and!37069)))

(declare-fun b!1101885 () Bool)

(declare-fun e!629020 () Bool)

(declare-fun e!629022 () Bool)

(declare-fun mapRes!42580 () Bool)

(assert (=> b!1101885 (= e!629020 (and e!629022 mapRes!42580))))

(declare-fun condMapEmpty!42580 () Bool)

(declare-datatypes ((V!41393 0))(
  ( (V!41394 (val!13656 Int)) )
))
(declare-datatypes ((ValueCell!12890 0))(
  ( (ValueCellFull!12890 (v!16280 V!41393)) (EmptyCell!12890) )
))
(declare-datatypes ((array!71351 0))(
  ( (array!71352 (arr!34334 (Array (_ BitVec 32) ValueCell!12890)) (size!34871 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71351)

(declare-fun mapDefault!42580 () ValueCell!12890)

(assert (=> b!1101885 (= condMapEmpty!42580 (= (arr!34334 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12890)) mapDefault!42580)))))

(declare-fun b!1101886 () Bool)

(declare-fun res!734933 () Bool)

(declare-fun e!629019 () Bool)

(assert (=> b!1101886 (=> (not res!734933) (not e!629019))))

(declare-datatypes ((array!71353 0))(
  ( (array!71354 (arr!34335 (Array (_ BitVec 32) (_ BitVec 64))) (size!34872 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71353)

(declare-datatypes ((List!23995 0))(
  ( (Nil!23992) (Cons!23991 (h!25209 (_ BitVec 64)) (t!34182 List!23995)) )
))
(declare-fun arrayNoDuplicates!0 (array!71353 (_ BitVec 32) List!23995) Bool)

(assert (=> b!1101886 (= res!734933 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23992))))

(declare-fun b!1101887 () Bool)

(declare-fun res!734931 () Bool)

(assert (=> b!1101887 (=> (not res!734931) (not e!629019))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1101887 (= res!734931 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34872 _keys!1070))))))

(declare-fun b!1101888 () Bool)

(declare-fun e!629021 () Bool)

(declare-fun e!629023 () Bool)

(assert (=> b!1101888 (= e!629021 e!629023)))

(declare-fun res!734923 () Bool)

(assert (=> b!1101888 (=> res!734923 e!629023)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1101888 (= res!734923 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!17376 0))(
  ( (tuple2!17377 (_1!8699 (_ BitVec 64)) (_2!8699 V!41393)) )
))
(declare-datatypes ((List!23996 0))(
  ( (Nil!23993) (Cons!23992 (h!25210 tuple2!17376) (t!34183 List!23996)) )
))
(declare-datatypes ((ListLongMap!15353 0))(
  ( (ListLongMap!15354 (toList!7692 List!23996)) )
))
(declare-fun lt!493687 () ListLongMap!15353)

(declare-fun lt!493686 () ListLongMap!15353)

(assert (=> b!1101888 (= lt!493687 lt!493686)))

(declare-fun lt!493682 () ListLongMap!15353)

(declare-fun lt!493676 () tuple2!17376)

(declare-fun +!3423 (ListLongMap!15353 tuple2!17376) ListLongMap!15353)

(assert (=> b!1101888 (= lt!493686 (+!3423 lt!493682 lt!493676))))

(declare-fun lt!493678 () ListLongMap!15353)

(declare-fun lt!493684 () ListLongMap!15353)

(assert (=> b!1101888 (= lt!493678 lt!493684)))

(declare-fun lt!493683 () ListLongMap!15353)

(assert (=> b!1101888 (= lt!493684 (+!3423 lt!493683 lt!493676))))

(declare-fun lt!493681 () ListLongMap!15353)

(assert (=> b!1101888 (= lt!493687 (+!3423 lt!493681 lt!493676))))

(declare-fun zeroValue!831 () V!41393)

(assert (=> b!1101888 (= lt!493676 (tuple2!17377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1101889 () Bool)

(declare-fun res!734925 () Bool)

(assert (=> b!1101889 (=> (not res!734925) (not e!629019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1101889 (= res!734925 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!42580 () Bool)

(assert (=> mapIsEmpty!42580 mapRes!42580))

(declare-fun b!1101890 () Bool)

(declare-fun res!734929 () Bool)

(declare-fun e!629018 () Bool)

(assert (=> b!1101890 (=> (not res!734929) (not e!629018))))

(declare-fun lt!493679 () array!71353)

(assert (=> b!1101890 (= res!734929 (arrayNoDuplicates!0 lt!493679 #b00000000000000000000000000000000 Nil!23992))))

(declare-fun res!734924 () Bool)

(assert (=> start!96990 (=> (not res!734924) (not e!629019))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96990 (= res!734924 (validMask!0 mask!1414))))

(assert (=> start!96990 e!629019))

(assert (=> start!96990 tp!81394))

(assert (=> start!96990 true))

(declare-fun tp_is_empty!27199 () Bool)

(assert (=> start!96990 tp_is_empty!27199))

(declare-fun array_inv!26472 (array!71353) Bool)

(assert (=> start!96990 (array_inv!26472 _keys!1070)))

(declare-fun array_inv!26473 (array!71351) Bool)

(assert (=> start!96990 (and (array_inv!26473 _values!874) e!629020)))

(declare-fun b!1101891 () Bool)

(assert (=> b!1101891 (= e!629018 (not e!629021))))

(declare-fun res!734930 () Bool)

(assert (=> b!1101891 (=> res!734930 e!629021)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1101891 (= res!734930 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41393)

(declare-fun getCurrentListMap!4396 (array!71353 array!71351 (_ BitVec 32) (_ BitVec 32) V!41393 V!41393 (_ BitVec 32) Int) ListLongMap!15353)

(assert (=> b!1101891 (= lt!493678 (getCurrentListMap!4396 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493688 () array!71351)

(assert (=> b!1101891 (= lt!493687 (getCurrentListMap!4396 lt!493679 lt!493688 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1101891 (and (= lt!493681 lt!493682) (= lt!493682 lt!493681))))

(declare-fun -!960 (ListLongMap!15353 (_ BitVec 64)) ListLongMap!15353)

(assert (=> b!1101891 (= lt!493682 (-!960 lt!493683 k0!904))))

(declare-datatypes ((Unit!36173 0))(
  ( (Unit!36174) )
))
(declare-fun lt!493677 () Unit!36173)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!230 (array!71353 array!71351 (_ BitVec 32) (_ BitVec 32) V!41393 V!41393 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36173)

(assert (=> b!1101891 (= lt!493677 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!230 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4237 (array!71353 array!71351 (_ BitVec 32) (_ BitVec 32) V!41393 V!41393 (_ BitVec 32) Int) ListLongMap!15353)

(assert (=> b!1101891 (= lt!493681 (getCurrentListMapNoExtraKeys!4237 lt!493679 lt!493688 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2355 (Int (_ BitVec 64)) V!41393)

(assert (=> b!1101891 (= lt!493688 (array!71352 (store (arr!34334 _values!874) i!650 (ValueCellFull!12890 (dynLambda!2355 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34871 _values!874)))))

(assert (=> b!1101891 (= lt!493683 (getCurrentListMapNoExtraKeys!4237 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1101891 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493680 () Unit!36173)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71353 (_ BitVec 64) (_ BitVec 32)) Unit!36173)

(assert (=> b!1101891 (= lt!493680 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1101892 () Bool)

(declare-fun res!734926 () Bool)

(assert (=> b!1101892 (=> (not res!734926) (not e!629019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71353 (_ BitVec 32)) Bool)

(assert (=> b!1101892 (= res!734926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1101893 () Bool)

(assert (=> b!1101893 (= e!629019 e!629018)))

(declare-fun res!734927 () Bool)

(assert (=> b!1101893 (=> (not res!734927) (not e!629018))))

(assert (=> b!1101893 (= res!734927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493679 mask!1414))))

(assert (=> b!1101893 (= lt!493679 (array!71354 (store (arr!34335 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34872 _keys!1070)))))

(declare-fun b!1101894 () Bool)

(assert (=> b!1101894 (= e!629023 (= (-!960 lt!493678 k0!904) lt!493687))))

(assert (=> b!1101894 (= (-!960 lt!493684 k0!904) lt!493686)))

(declare-fun lt!493685 () Unit!36173)

(declare-fun addRemoveCommutativeForDiffKeys!129 (ListLongMap!15353 (_ BitVec 64) V!41393 (_ BitVec 64)) Unit!36173)

(assert (=> b!1101894 (= lt!493685 (addRemoveCommutativeForDiffKeys!129 lt!493683 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1101895 () Bool)

(declare-fun e!629025 () Bool)

(assert (=> b!1101895 (= e!629025 tp_is_empty!27199)))

(declare-fun b!1101896 () Bool)

(declare-fun res!734928 () Bool)

(assert (=> b!1101896 (=> (not res!734928) (not e!629019))))

(assert (=> b!1101896 (= res!734928 (= (select (arr!34335 _keys!1070) i!650) k0!904))))

(declare-fun b!1101897 () Bool)

(declare-fun res!734932 () Bool)

(assert (=> b!1101897 (=> (not res!734932) (not e!629019))))

(assert (=> b!1101897 (= res!734932 (and (= (size!34871 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34872 _keys!1070) (size!34871 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42580 () Bool)

(declare-fun tp!81395 () Bool)

(assert (=> mapNonEmpty!42580 (= mapRes!42580 (and tp!81395 e!629025))))

(declare-fun mapValue!42580 () ValueCell!12890)

(declare-fun mapRest!42580 () (Array (_ BitVec 32) ValueCell!12890))

(declare-fun mapKey!42580 () (_ BitVec 32))

(assert (=> mapNonEmpty!42580 (= (arr!34334 _values!874) (store mapRest!42580 mapKey!42580 mapValue!42580))))

(declare-fun b!1101898 () Bool)

(assert (=> b!1101898 (= e!629022 tp_is_empty!27199)))

(assert (= (and start!96990 res!734924) b!1101897))

(assert (= (and b!1101897 res!734932) b!1101892))

(assert (= (and b!1101892 res!734926) b!1101886))

(assert (= (and b!1101886 res!734933) b!1101887))

(assert (= (and b!1101887 res!734931) b!1101889))

(assert (= (and b!1101889 res!734925) b!1101896))

(assert (= (and b!1101896 res!734928) b!1101893))

(assert (= (and b!1101893 res!734927) b!1101890))

(assert (= (and b!1101890 res!734929) b!1101891))

(assert (= (and b!1101891 (not res!734930)) b!1101888))

(assert (= (and b!1101888 (not res!734923)) b!1101894))

(assert (= (and b!1101885 condMapEmpty!42580) mapIsEmpty!42580))

(assert (= (and b!1101885 (not condMapEmpty!42580)) mapNonEmpty!42580))

(get-info :version)

(assert (= (and mapNonEmpty!42580 ((_ is ValueCellFull!12890) mapValue!42580)) b!1101895))

(assert (= (and b!1101885 ((_ is ValueCellFull!12890) mapDefault!42580)) b!1101898))

(assert (= start!96990 b!1101885))

(declare-fun b_lambda!18027 () Bool)

(assert (=> (not b_lambda!18027) (not b!1101891)))

(declare-fun t!34181 () Bool)

(declare-fun tb!8007 () Bool)

(assert (=> (and start!96990 (= defaultEntry!882 defaultEntry!882) t!34181) tb!8007))

(declare-fun result!16559 () Bool)

(assert (=> tb!8007 (= result!16559 tp_is_empty!27199)))

(assert (=> b!1101891 t!34181))

(declare-fun b_and!37071 () Bool)

(assert (= b_and!37069 (and (=> t!34181 result!16559) b_and!37071)))

(declare-fun m!1022321 () Bool)

(assert (=> b!1101889 m!1022321))

(declare-fun m!1022323 () Bool)

(assert (=> b!1101891 m!1022323))

(declare-fun m!1022325 () Bool)

(assert (=> b!1101891 m!1022325))

(declare-fun m!1022327 () Bool)

(assert (=> b!1101891 m!1022327))

(declare-fun m!1022329 () Bool)

(assert (=> b!1101891 m!1022329))

(declare-fun m!1022331 () Bool)

(assert (=> b!1101891 m!1022331))

(declare-fun m!1022333 () Bool)

(assert (=> b!1101891 m!1022333))

(declare-fun m!1022335 () Bool)

(assert (=> b!1101891 m!1022335))

(declare-fun m!1022337 () Bool)

(assert (=> b!1101891 m!1022337))

(declare-fun m!1022339 () Bool)

(assert (=> b!1101891 m!1022339))

(declare-fun m!1022341 () Bool)

(assert (=> b!1101891 m!1022341))

(declare-fun m!1022343 () Bool)

(assert (=> b!1101894 m!1022343))

(declare-fun m!1022345 () Bool)

(assert (=> b!1101894 m!1022345))

(declare-fun m!1022347 () Bool)

(assert (=> b!1101894 m!1022347))

(declare-fun m!1022349 () Bool)

(assert (=> b!1101896 m!1022349))

(declare-fun m!1022351 () Bool)

(assert (=> b!1101893 m!1022351))

(declare-fun m!1022353 () Bool)

(assert (=> b!1101893 m!1022353))

(declare-fun m!1022355 () Bool)

(assert (=> b!1101890 m!1022355))

(declare-fun m!1022357 () Bool)

(assert (=> start!96990 m!1022357))

(declare-fun m!1022359 () Bool)

(assert (=> start!96990 m!1022359))

(declare-fun m!1022361 () Bool)

(assert (=> start!96990 m!1022361))

(declare-fun m!1022363 () Bool)

(assert (=> b!1101886 m!1022363))

(declare-fun m!1022365 () Bool)

(assert (=> b!1101892 m!1022365))

(declare-fun m!1022367 () Bool)

(assert (=> b!1101888 m!1022367))

(declare-fun m!1022369 () Bool)

(assert (=> b!1101888 m!1022369))

(declare-fun m!1022371 () Bool)

(assert (=> b!1101888 m!1022371))

(declare-fun m!1022373 () Bool)

(assert (=> mapNonEmpty!42580 m!1022373))

(check-sat (not b!1101888) b_and!37071 tp_is_empty!27199 (not start!96990) (not b_lambda!18027) (not b!1101889) (not mapNonEmpty!42580) (not b!1101890) (not b!1101892) (not b_next!23149) (not b!1101891) (not b!1101893) (not b!1101886) (not b!1101894))
(check-sat b_and!37071 (not b_next!23149))
