; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96046 () Bool)

(assert start!96046)

(declare-fun b_free!22705 () Bool)

(declare-fun b_next!22705 () Bool)

(assert (=> start!96046 (= b_free!22705 (not b_next!22705))))

(declare-fun tp!79964 () Bool)

(declare-fun b_and!36059 () Bool)

(assert (=> start!96046 (= tp!79964 b_and!36059)))

(declare-fun b!1089097 () Bool)

(declare-fun e!622057 () Bool)

(declare-fun e!622054 () Bool)

(assert (=> b!1089097 (= e!622057 e!622054)))

(declare-fun res!726491 () Bool)

(assert (=> b!1089097 (=> (not res!726491) (not e!622054))))

(declare-datatypes ((array!70260 0))(
  ( (array!70261 (arr!33804 (Array (_ BitVec 32) (_ BitVec 64))) (size!34342 (_ BitVec 32))) )
))
(declare-fun lt!485320 () array!70260)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70260 (_ BitVec 32)) Bool)

(assert (=> b!1089097 (= res!726491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485320 mask!1414))))

(declare-fun _keys!1070 () array!70260)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1089097 (= lt!485320 (array!70261 (store (arr!33804 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34342 _keys!1070)))))

(declare-fun b!1089098 () Bool)

(declare-fun e!622060 () Bool)

(assert (=> b!1089098 (= e!622060 true)))

(declare-datatypes ((V!40737 0))(
  ( (V!40738 (val!13410 Int)) )
))
(declare-datatypes ((tuple2!17088 0))(
  ( (tuple2!17089 (_1!8555 (_ BitVec 64)) (_2!8555 V!40737)) )
))
(declare-datatypes ((List!23657 0))(
  ( (Nil!23654) (Cons!23653 (h!24862 tuple2!17088) (t!33411 List!23657)) )
))
(declare-datatypes ((ListLongMap!15057 0))(
  ( (ListLongMap!15058 (toList!7544 List!23657)) )
))
(declare-fun lt!485316 () ListLongMap!15057)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!485323 () ListLongMap!15057)

(declare-fun -!820 (ListLongMap!15057 (_ BitVec 64)) ListLongMap!15057)

(assert (=> b!1089098 (= (-!820 lt!485316 k0!904) lt!485323)))

(declare-fun lt!485319 () ListLongMap!15057)

(declare-fun zeroValue!831 () V!40737)

(declare-datatypes ((Unit!35675 0))(
  ( (Unit!35676) )
))
(declare-fun lt!485315 () Unit!35675)

(declare-fun addRemoveCommutativeForDiffKeys!71 (ListLongMap!15057 (_ BitVec 64) V!40737 (_ BitVec 64)) Unit!35675)

(assert (=> b!1089098 (= lt!485315 (addRemoveCommutativeForDiffKeys!71 lt!485319 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1089099 () Bool)

(declare-fun res!726497 () Bool)

(assert (=> b!1089099 (=> (not res!726497) (not e!622057))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12644 0))(
  ( (ValueCellFull!12644 (v!16030 V!40737)) (EmptyCell!12644) )
))
(declare-datatypes ((array!70262 0))(
  ( (array!70263 (arr!33805 (Array (_ BitVec 32) ValueCell!12644)) (size!34343 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70262)

(assert (=> b!1089099 (= res!726497 (and (= (size!34343 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34342 _keys!1070) (size!34343 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089100 () Bool)

(declare-fun res!726494 () Bool)

(assert (=> b!1089100 (=> (not res!726494) (not e!622057))))

(declare-datatypes ((List!23658 0))(
  ( (Nil!23655) (Cons!23654 (h!24863 (_ BitVec 64)) (t!33412 List!23658)) )
))
(declare-fun arrayNoDuplicates!0 (array!70260 (_ BitVec 32) List!23658) Bool)

(assert (=> b!1089100 (= res!726494 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23655))))

(declare-fun b!1089101 () Bool)

(declare-fun res!726496 () Bool)

(assert (=> b!1089101 (=> (not res!726496) (not e!622054))))

(assert (=> b!1089101 (= res!726496 (arrayNoDuplicates!0 lt!485320 #b00000000000000000000000000000000 Nil!23655))))

(declare-fun b!1089102 () Bool)

(declare-fun e!622061 () Bool)

(declare-fun e!622055 () Bool)

(declare-fun mapRes!41815 () Bool)

(assert (=> b!1089102 (= e!622061 (and e!622055 mapRes!41815))))

(declare-fun condMapEmpty!41815 () Bool)

(declare-fun mapDefault!41815 () ValueCell!12644)

(assert (=> b!1089102 (= condMapEmpty!41815 (= (arr!33805 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12644)) mapDefault!41815)))))

(declare-fun b!1089103 () Bool)

(declare-fun e!622058 () Bool)

(assert (=> b!1089103 (= e!622054 (not e!622058))))

(declare-fun res!726488 () Bool)

(assert (=> b!1089103 (=> res!726488 e!622058)))

(assert (=> b!1089103 (= res!726488 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40737)

(declare-fun lt!485325 () ListLongMap!15057)

(declare-fun getCurrentListMap!4221 (array!70260 array!70262 (_ BitVec 32) (_ BitVec 32) V!40737 V!40737 (_ BitVec 32) Int) ListLongMap!15057)

(assert (=> b!1089103 (= lt!485325 (getCurrentListMap!4221 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485327 () ListLongMap!15057)

(declare-fun lt!485317 () array!70262)

(assert (=> b!1089103 (= lt!485327 (getCurrentListMap!4221 lt!485320 lt!485317 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485318 () ListLongMap!15057)

(declare-fun lt!485321 () ListLongMap!15057)

(assert (=> b!1089103 (and (= lt!485318 lt!485321) (= lt!485321 lt!485318))))

(assert (=> b!1089103 (= lt!485321 (-!820 lt!485319 k0!904))))

(declare-fun lt!485322 () Unit!35675)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!105 (array!70260 array!70262 (_ BitVec 32) (_ BitVec 32) V!40737 V!40737 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35675)

(assert (=> b!1089103 (= lt!485322 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!105 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4091 (array!70260 array!70262 (_ BitVec 32) (_ BitVec 32) V!40737 V!40737 (_ BitVec 32) Int) ListLongMap!15057)

(assert (=> b!1089103 (= lt!485318 (getCurrentListMapNoExtraKeys!4091 lt!485320 lt!485317 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2162 (Int (_ BitVec 64)) V!40737)

(assert (=> b!1089103 (= lt!485317 (array!70263 (store (arr!33805 _values!874) i!650 (ValueCellFull!12644 (dynLambda!2162 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34343 _values!874)))))

(assert (=> b!1089103 (= lt!485319 (getCurrentListMapNoExtraKeys!4091 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70260 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089103 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485326 () Unit!35675)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70260 (_ BitVec 64) (_ BitVec 32)) Unit!35675)

(assert (=> b!1089103 (= lt!485326 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1089104 () Bool)

(declare-fun res!726492 () Bool)

(assert (=> b!1089104 (=> (not res!726492) (not e!622057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089104 (= res!726492 (validKeyInArray!0 k0!904))))

(declare-fun b!1089105 () Bool)

(declare-fun e!622059 () Bool)

(declare-fun tp_is_empty!26707 () Bool)

(assert (=> b!1089105 (= e!622059 tp_is_empty!26707)))

(declare-fun b!1089106 () Bool)

(assert (=> b!1089106 (= e!622058 e!622060)))

(declare-fun res!726489 () Bool)

(assert (=> b!1089106 (=> res!726489 e!622060)))

(assert (=> b!1089106 (= res!726489 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1089106 (= lt!485327 lt!485323)))

(declare-fun lt!485324 () tuple2!17088)

(declare-fun +!3344 (ListLongMap!15057 tuple2!17088) ListLongMap!15057)

(assert (=> b!1089106 (= lt!485323 (+!3344 lt!485321 lt!485324))))

(assert (=> b!1089106 (= lt!485325 lt!485316)))

(assert (=> b!1089106 (= lt!485316 (+!3344 lt!485319 lt!485324))))

(assert (=> b!1089106 (= lt!485327 (+!3344 lt!485318 lt!485324))))

(assert (=> b!1089106 (= lt!485324 (tuple2!17089 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1089107 () Bool)

(declare-fun res!726495 () Bool)

(assert (=> b!1089107 (=> (not res!726495) (not e!622057))))

(assert (=> b!1089107 (= res!726495 (= (select (arr!33804 _keys!1070) i!650) k0!904))))

(declare-fun b!1089108 () Bool)

(declare-fun res!726493 () Bool)

(assert (=> b!1089108 (=> (not res!726493) (not e!622057))))

(assert (=> b!1089108 (= res!726493 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34342 _keys!1070))))))

(declare-fun b!1089109 () Bool)

(assert (=> b!1089109 (= e!622055 tp_is_empty!26707)))

(declare-fun res!726490 () Bool)

(assert (=> start!96046 (=> (not res!726490) (not e!622057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96046 (= res!726490 (validMask!0 mask!1414))))

(assert (=> start!96046 e!622057))

(assert (=> start!96046 tp!79964))

(assert (=> start!96046 true))

(assert (=> start!96046 tp_is_empty!26707))

(declare-fun array_inv!26112 (array!70260) Bool)

(assert (=> start!96046 (array_inv!26112 _keys!1070)))

(declare-fun array_inv!26113 (array!70262) Bool)

(assert (=> start!96046 (and (array_inv!26113 _values!874) e!622061)))

(declare-fun mapIsEmpty!41815 () Bool)

(assert (=> mapIsEmpty!41815 mapRes!41815))

(declare-fun mapNonEmpty!41815 () Bool)

(declare-fun tp!79963 () Bool)

(assert (=> mapNonEmpty!41815 (= mapRes!41815 (and tp!79963 e!622059))))

(declare-fun mapValue!41815 () ValueCell!12644)

(declare-fun mapKey!41815 () (_ BitVec 32))

(declare-fun mapRest!41815 () (Array (_ BitVec 32) ValueCell!12644))

(assert (=> mapNonEmpty!41815 (= (arr!33805 _values!874) (store mapRest!41815 mapKey!41815 mapValue!41815))))

(declare-fun b!1089110 () Bool)

(declare-fun res!726498 () Bool)

(assert (=> b!1089110 (=> (not res!726498) (not e!622057))))

(assert (=> b!1089110 (= res!726498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!96046 res!726490) b!1089099))

(assert (= (and b!1089099 res!726497) b!1089110))

(assert (= (and b!1089110 res!726498) b!1089100))

(assert (= (and b!1089100 res!726494) b!1089108))

(assert (= (and b!1089108 res!726493) b!1089104))

(assert (= (and b!1089104 res!726492) b!1089107))

(assert (= (and b!1089107 res!726495) b!1089097))

(assert (= (and b!1089097 res!726491) b!1089101))

(assert (= (and b!1089101 res!726496) b!1089103))

(assert (= (and b!1089103 (not res!726488)) b!1089106))

(assert (= (and b!1089106 (not res!726489)) b!1089098))

(assert (= (and b!1089102 condMapEmpty!41815) mapIsEmpty!41815))

(assert (= (and b!1089102 (not condMapEmpty!41815)) mapNonEmpty!41815))

(get-info :version)

(assert (= (and mapNonEmpty!41815 ((_ is ValueCellFull!12644) mapValue!41815)) b!1089105))

(assert (= (and b!1089102 ((_ is ValueCellFull!12644) mapDefault!41815)) b!1089109))

(assert (= start!96046 b!1089102))

(declare-fun b_lambda!17353 () Bool)

(assert (=> (not b_lambda!17353) (not b!1089103)))

(declare-fun t!33410 () Bool)

(declare-fun tb!7575 () Bool)

(assert (=> (and start!96046 (= defaultEntry!882 defaultEntry!882) t!33410) tb!7575))

(declare-fun result!15677 () Bool)

(assert (=> tb!7575 (= result!15677 tp_is_empty!26707)))

(assert (=> b!1089103 t!33410))

(declare-fun b_and!36061 () Bool)

(assert (= b_and!36059 (and (=> t!33410 result!15677) b_and!36061)))

(declare-fun m!1007837 () Bool)

(assert (=> b!1089106 m!1007837))

(declare-fun m!1007839 () Bool)

(assert (=> b!1089106 m!1007839))

(declare-fun m!1007841 () Bool)

(assert (=> b!1089106 m!1007841))

(declare-fun m!1007843 () Bool)

(assert (=> b!1089107 m!1007843))

(declare-fun m!1007845 () Bool)

(assert (=> b!1089110 m!1007845))

(declare-fun m!1007847 () Bool)

(assert (=> b!1089101 m!1007847))

(declare-fun m!1007849 () Bool)

(assert (=> b!1089104 m!1007849))

(declare-fun m!1007851 () Bool)

(assert (=> b!1089100 m!1007851))

(declare-fun m!1007853 () Bool)

(assert (=> b!1089103 m!1007853))

(declare-fun m!1007855 () Bool)

(assert (=> b!1089103 m!1007855))

(declare-fun m!1007857 () Bool)

(assert (=> b!1089103 m!1007857))

(declare-fun m!1007859 () Bool)

(assert (=> b!1089103 m!1007859))

(declare-fun m!1007861 () Bool)

(assert (=> b!1089103 m!1007861))

(declare-fun m!1007863 () Bool)

(assert (=> b!1089103 m!1007863))

(declare-fun m!1007865 () Bool)

(assert (=> b!1089103 m!1007865))

(declare-fun m!1007867 () Bool)

(assert (=> b!1089103 m!1007867))

(declare-fun m!1007869 () Bool)

(assert (=> b!1089103 m!1007869))

(declare-fun m!1007871 () Bool)

(assert (=> b!1089103 m!1007871))

(declare-fun m!1007873 () Bool)

(assert (=> b!1089098 m!1007873))

(declare-fun m!1007875 () Bool)

(assert (=> b!1089098 m!1007875))

(declare-fun m!1007877 () Bool)

(assert (=> start!96046 m!1007877))

(declare-fun m!1007879 () Bool)

(assert (=> start!96046 m!1007879))

(declare-fun m!1007881 () Bool)

(assert (=> start!96046 m!1007881))

(declare-fun m!1007883 () Bool)

(assert (=> b!1089097 m!1007883))

(declare-fun m!1007885 () Bool)

(assert (=> b!1089097 m!1007885))

(declare-fun m!1007887 () Bool)

(assert (=> mapNonEmpty!41815 m!1007887))

(check-sat (not b!1089101) (not mapNonEmpty!41815) (not b_lambda!17353) (not b!1089103) (not start!96046) (not b!1089106) (not b_next!22705) tp_is_empty!26707 (not b!1089097) (not b!1089100) (not b!1089098) b_and!36061 (not b!1089110) (not b!1089104))
(check-sat b_and!36061 (not b_next!22705))
