; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96240 () Bool)

(assert start!96240)

(declare-fun b_free!22657 () Bool)

(declare-fun b_next!22657 () Bool)

(assert (=> start!96240 (= b_free!22657 (not b_next!22657))))

(declare-fun tp!79820 () Bool)

(declare-fun b_and!35999 () Bool)

(assert (=> start!96240 (= tp!79820 b_and!35999)))

(declare-fun b!1089521 () Bool)

(declare-fun res!726297 () Bool)

(declare-fun e!622432 () Bool)

(assert (=> b!1089521 (=> (not res!726297) (not e!622432))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70283 0))(
  ( (array!70284 (arr!33809 (Array (_ BitVec 32) (_ BitVec 64))) (size!34346 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70283)

(declare-datatypes ((V!40673 0))(
  ( (V!40674 (val!13386 Int)) )
))
(declare-datatypes ((ValueCell!12620 0))(
  ( (ValueCellFull!12620 (v!16003 V!40673)) (EmptyCell!12620) )
))
(declare-datatypes ((array!70285 0))(
  ( (array!70286 (arr!33810 (Array (_ BitVec 32) ValueCell!12620)) (size!34347 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70285)

(assert (=> b!1089521 (= res!726297 (and (= (size!34347 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34346 _keys!1070) (size!34347 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089522 () Bool)

(declare-fun res!726292 () Bool)

(assert (=> b!1089522 (=> (not res!726292) (not e!622432))))

(declare-datatypes ((List!23600 0))(
  ( (Nil!23597) (Cons!23596 (h!24814 (_ BitVec 64)) (t!33307 List!23600)) )
))
(declare-fun arrayNoDuplicates!0 (array!70283 (_ BitVec 32) List!23600) Bool)

(assert (=> b!1089522 (= res!726292 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23597))))

(declare-fun res!726293 () Bool)

(assert (=> start!96240 (=> (not res!726293) (not e!622432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96240 (= res!726293 (validMask!0 mask!1414))))

(assert (=> start!96240 e!622432))

(assert (=> start!96240 tp!79820))

(assert (=> start!96240 true))

(declare-fun tp_is_empty!26659 () Bool)

(assert (=> start!96240 tp_is_empty!26659))

(declare-fun array_inv!26126 (array!70283) Bool)

(assert (=> start!96240 (array_inv!26126 _keys!1070)))

(declare-fun e!622433 () Bool)

(declare-fun array_inv!26127 (array!70285) Bool)

(assert (=> start!96240 (and (array_inv!26127 _values!874) e!622433)))

(declare-fun b!1089523 () Bool)

(declare-fun e!622430 () Bool)

(declare-fun mapRes!41743 () Bool)

(assert (=> b!1089523 (= e!622433 (and e!622430 mapRes!41743))))

(declare-fun condMapEmpty!41743 () Bool)

(declare-fun mapDefault!41743 () ValueCell!12620)

(assert (=> b!1089523 (= condMapEmpty!41743 (= (arr!33810 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12620)) mapDefault!41743)))))

(declare-fun b!1089524 () Bool)

(declare-fun e!622428 () Bool)

(assert (=> b!1089524 (= e!622432 e!622428)))

(declare-fun res!726288 () Bool)

(assert (=> b!1089524 (=> (not res!726288) (not e!622428))))

(declare-fun lt!485094 () array!70283)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70283 (_ BitVec 32)) Bool)

(assert (=> b!1089524 (= res!726288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485094 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1089524 (= lt!485094 (array!70284 (store (arr!33809 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34346 _keys!1070)))))

(declare-fun b!1089525 () Bool)

(assert (=> b!1089525 (= e!622430 tp_is_empty!26659)))

(declare-fun mapIsEmpty!41743 () Bool)

(assert (=> mapIsEmpty!41743 mapRes!41743))

(declare-fun b!1089526 () Bool)

(declare-fun e!622426 () Bool)

(assert (=> b!1089526 (= e!622428 (not e!622426))))

(declare-fun res!726294 () Bool)

(assert (=> b!1089526 (=> res!726294 e!622426)))

(assert (=> b!1089526 (= res!726294 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40673)

(declare-datatypes ((tuple2!17008 0))(
  ( (tuple2!17009 (_1!8515 (_ BitVec 64)) (_2!8515 V!40673)) )
))
(declare-datatypes ((List!23601 0))(
  ( (Nil!23598) (Cons!23597 (h!24815 tuple2!17008) (t!33308 List!23601)) )
))
(declare-datatypes ((ListLongMap!14985 0))(
  ( (ListLongMap!14986 (toList!7508 List!23601)) )
))
(declare-fun lt!485105 () ListLongMap!14985)

(declare-fun zeroValue!831 () V!40673)

(declare-fun getCurrentListMap!4267 (array!70283 array!70285 (_ BitVec 32) (_ BitVec 32) V!40673 V!40673 (_ BitVec 32) Int) ListLongMap!14985)

(assert (=> b!1089526 (= lt!485105 (getCurrentListMap!4267 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485097 () ListLongMap!14985)

(declare-fun lt!485103 () array!70285)

(assert (=> b!1089526 (= lt!485097 (getCurrentListMap!4267 lt!485094 lt!485103 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485101 () ListLongMap!14985)

(declare-fun lt!485099 () ListLongMap!14985)

(assert (=> b!1089526 (and (= lt!485101 lt!485099) (= lt!485099 lt!485101))))

(declare-fun lt!485106 () ListLongMap!14985)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!819 (ListLongMap!14985 (_ BitVec 64)) ListLongMap!14985)

(assert (=> b!1089526 (= lt!485099 (-!819 lt!485106 k0!904))))

(declare-datatypes ((Unit!35805 0))(
  ( (Unit!35806) )
))
(declare-fun lt!485104 () Unit!35805)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!96 (array!70283 array!70285 (_ BitVec 32) (_ BitVec 32) V!40673 V!40673 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35805)

(assert (=> b!1089526 (= lt!485104 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!96 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4072 (array!70283 array!70285 (_ BitVec 32) (_ BitVec 32) V!40673 V!40673 (_ BitVec 32) Int) ListLongMap!14985)

(assert (=> b!1089526 (= lt!485101 (getCurrentListMapNoExtraKeys!4072 lt!485094 lt!485103 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2193 (Int (_ BitVec 64)) V!40673)

(assert (=> b!1089526 (= lt!485103 (array!70286 (store (arr!33810 _values!874) i!650 (ValueCellFull!12620 (dynLambda!2193 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34347 _values!874)))))

(assert (=> b!1089526 (= lt!485106 (getCurrentListMapNoExtraKeys!4072 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089526 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485100 () Unit!35805)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70283 (_ BitVec 64) (_ BitVec 32)) Unit!35805)

(assert (=> b!1089526 (= lt!485100 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1089527 () Bool)

(declare-fun res!726290 () Bool)

(assert (=> b!1089527 (=> (not res!726290) (not e!622428))))

(assert (=> b!1089527 (= res!726290 (arrayNoDuplicates!0 lt!485094 #b00000000000000000000000000000000 Nil!23597))))

(declare-fun b!1089528 () Bool)

(declare-fun res!726296 () Bool)

(assert (=> b!1089528 (=> (not res!726296) (not e!622432))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089528 (= res!726296 (validKeyInArray!0 k0!904))))

(declare-fun b!1089529 () Bool)

(declare-fun res!726287 () Bool)

(assert (=> b!1089529 (=> (not res!726287) (not e!622432))))

(assert (=> b!1089529 (= res!726287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1089530 () Bool)

(declare-fun res!726295 () Bool)

(assert (=> b!1089530 (=> (not res!726295) (not e!622432))))

(assert (=> b!1089530 (= res!726295 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34346 _keys!1070))))))

(declare-fun b!1089531 () Bool)

(declare-fun e!622427 () Bool)

(assert (=> b!1089531 (= e!622426 e!622427)))

(declare-fun res!726291 () Bool)

(assert (=> b!1089531 (=> res!726291 e!622427)))

(assert (=> b!1089531 (= res!726291 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!485095 () ListLongMap!14985)

(assert (=> b!1089531 (= lt!485097 lt!485095)))

(declare-fun lt!485096 () tuple2!17008)

(declare-fun +!3329 (ListLongMap!14985 tuple2!17008) ListLongMap!14985)

(assert (=> b!1089531 (= lt!485095 (+!3329 lt!485099 lt!485096))))

(declare-fun lt!485102 () ListLongMap!14985)

(assert (=> b!1089531 (= lt!485105 lt!485102)))

(assert (=> b!1089531 (= lt!485102 (+!3329 lt!485106 lt!485096))))

(assert (=> b!1089531 (= lt!485097 (+!3329 lt!485101 lt!485096))))

(assert (=> b!1089531 (= lt!485096 (tuple2!17009 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1089532 () Bool)

(assert (=> b!1089532 (= e!622427 true)))

(assert (=> b!1089532 (= (-!819 lt!485102 k0!904) lt!485095)))

(declare-fun lt!485098 () Unit!35805)

(declare-fun addRemoveCommutativeForDiffKeys!60 (ListLongMap!14985 (_ BitVec 64) V!40673 (_ BitVec 64)) Unit!35805)

(assert (=> b!1089532 (= lt!485098 (addRemoveCommutativeForDiffKeys!60 lt!485106 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1089533 () Bool)

(declare-fun e!622431 () Bool)

(assert (=> b!1089533 (= e!622431 tp_is_empty!26659)))

(declare-fun mapNonEmpty!41743 () Bool)

(declare-fun tp!79819 () Bool)

(assert (=> mapNonEmpty!41743 (= mapRes!41743 (and tp!79819 e!622431))))

(declare-fun mapRest!41743 () (Array (_ BitVec 32) ValueCell!12620))

(declare-fun mapKey!41743 () (_ BitVec 32))

(declare-fun mapValue!41743 () ValueCell!12620)

(assert (=> mapNonEmpty!41743 (= (arr!33810 _values!874) (store mapRest!41743 mapKey!41743 mapValue!41743))))

(declare-fun b!1089534 () Bool)

(declare-fun res!726289 () Bool)

(assert (=> b!1089534 (=> (not res!726289) (not e!622432))))

(assert (=> b!1089534 (= res!726289 (= (select (arr!33809 _keys!1070) i!650) k0!904))))

(assert (= (and start!96240 res!726293) b!1089521))

(assert (= (and b!1089521 res!726297) b!1089529))

(assert (= (and b!1089529 res!726287) b!1089522))

(assert (= (and b!1089522 res!726292) b!1089530))

(assert (= (and b!1089530 res!726295) b!1089528))

(assert (= (and b!1089528 res!726296) b!1089534))

(assert (= (and b!1089534 res!726289) b!1089524))

(assert (= (and b!1089524 res!726288) b!1089527))

(assert (= (and b!1089527 res!726290) b!1089526))

(assert (= (and b!1089526 (not res!726294)) b!1089531))

(assert (= (and b!1089531 (not res!726291)) b!1089532))

(assert (= (and b!1089523 condMapEmpty!41743) mapIsEmpty!41743))

(assert (= (and b!1089523 (not condMapEmpty!41743)) mapNonEmpty!41743))

(get-info :version)

(assert (= (and mapNonEmpty!41743 ((_ is ValueCellFull!12620) mapValue!41743)) b!1089533))

(assert (= (and b!1089523 ((_ is ValueCellFull!12620) mapDefault!41743)) b!1089525))

(assert (= start!96240 b!1089523))

(declare-fun b_lambda!17337 () Bool)

(assert (=> (not b_lambda!17337) (not b!1089526)))

(declare-fun t!33306 () Bool)

(declare-fun tb!7527 () Bool)

(assert (=> (and start!96240 (= defaultEntry!882 defaultEntry!882) t!33306) tb!7527))

(declare-fun result!15581 () Bool)

(assert (=> tb!7527 (= result!15581 tp_is_empty!26659)))

(assert (=> b!1089526 t!33306))

(declare-fun b_and!36001 () Bool)

(assert (= b_and!35999 (and (=> t!33306 result!15581) b_and!36001)))

(declare-fun m!1008887 () Bool)

(assert (=> b!1089526 m!1008887))

(declare-fun m!1008889 () Bool)

(assert (=> b!1089526 m!1008889))

(declare-fun m!1008891 () Bool)

(assert (=> b!1089526 m!1008891))

(declare-fun m!1008893 () Bool)

(assert (=> b!1089526 m!1008893))

(declare-fun m!1008895 () Bool)

(assert (=> b!1089526 m!1008895))

(declare-fun m!1008897 () Bool)

(assert (=> b!1089526 m!1008897))

(declare-fun m!1008899 () Bool)

(assert (=> b!1089526 m!1008899))

(declare-fun m!1008901 () Bool)

(assert (=> b!1089526 m!1008901))

(declare-fun m!1008903 () Bool)

(assert (=> b!1089526 m!1008903))

(declare-fun m!1008905 () Bool)

(assert (=> b!1089526 m!1008905))

(declare-fun m!1008907 () Bool)

(assert (=> start!96240 m!1008907))

(declare-fun m!1008909 () Bool)

(assert (=> start!96240 m!1008909))

(declare-fun m!1008911 () Bool)

(assert (=> start!96240 m!1008911))

(declare-fun m!1008913 () Bool)

(assert (=> b!1089522 m!1008913))

(declare-fun m!1008915 () Bool)

(assert (=> b!1089534 m!1008915))

(declare-fun m!1008917 () Bool)

(assert (=> b!1089529 m!1008917))

(declare-fun m!1008919 () Bool)

(assert (=> mapNonEmpty!41743 m!1008919))

(declare-fun m!1008921 () Bool)

(assert (=> b!1089524 m!1008921))

(declare-fun m!1008923 () Bool)

(assert (=> b!1089524 m!1008923))

(declare-fun m!1008925 () Bool)

(assert (=> b!1089531 m!1008925))

(declare-fun m!1008927 () Bool)

(assert (=> b!1089531 m!1008927))

(declare-fun m!1008929 () Bool)

(assert (=> b!1089531 m!1008929))

(declare-fun m!1008931 () Bool)

(assert (=> b!1089527 m!1008931))

(declare-fun m!1008933 () Bool)

(assert (=> b!1089528 m!1008933))

(declare-fun m!1008935 () Bool)

(assert (=> b!1089532 m!1008935))

(declare-fun m!1008937 () Bool)

(assert (=> b!1089532 m!1008937))

(check-sat (not b_next!22657) (not start!96240) b_and!36001 (not b!1089524) tp_is_empty!26659 (not b!1089532) (not b!1089529) (not b!1089528) (not b!1089526) (not b!1089531) (not b!1089522) (not b!1089527) (not mapNonEmpty!41743) (not b_lambda!17337))
(check-sat b_and!36001 (not b_next!22657))
