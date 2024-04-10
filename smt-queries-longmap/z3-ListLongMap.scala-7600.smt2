; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95922 () Bool)

(assert start!95922)

(declare-fun b_free!22575 () Bool)

(declare-fun b_next!22575 () Bool)

(assert (=> start!95922 (= b_free!22575 (not b_next!22575))))

(declare-fun tp!79573 () Bool)

(declare-fun b_and!35825 () Bool)

(assert (=> start!95922 (= tp!79573 b_and!35825)))

(declare-fun b!1086381 () Bool)

(declare-fun e!620593 () Bool)

(declare-fun tp_is_empty!26577 () Bool)

(assert (=> b!1086381 (= e!620593 tp_is_empty!26577)))

(declare-fun mapIsEmpty!41620 () Bool)

(declare-fun mapRes!41620 () Bool)

(assert (=> mapIsEmpty!41620 mapRes!41620))

(declare-fun b!1086382 () Bool)

(declare-fun e!620589 () Bool)

(declare-fun e!620592 () Bool)

(assert (=> b!1086382 (= e!620589 (not e!620592))))

(declare-fun res!724409 () Bool)

(assert (=> b!1086382 (=> res!724409 e!620592)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1086382 (= res!724409 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40563 0))(
  ( (V!40564 (val!13345 Int)) )
))
(declare-datatypes ((tuple2!16928 0))(
  ( (tuple2!16929 (_1!8475 (_ BitVec 64)) (_2!8475 V!40563)) )
))
(declare-datatypes ((List!23518 0))(
  ( (Nil!23515) (Cons!23514 (h!24723 tuple2!16928) (t!33151 List!23518)) )
))
(declare-datatypes ((ListLongMap!14897 0))(
  ( (ListLongMap!14898 (toList!7464 List!23518)) )
))
(declare-fun lt!482787 () ListLongMap!14897)

(declare-fun minValue!831 () V!40563)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40563)

(declare-datatypes ((array!70089 0))(
  ( (array!70090 (arr!33718 (Array (_ BitVec 32) (_ BitVec 64))) (size!34254 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70089)

(declare-datatypes ((ValueCell!12579 0))(
  ( (ValueCellFull!12579 (v!15966 V!40563)) (EmptyCell!12579) )
))
(declare-datatypes ((array!70091 0))(
  ( (array!70092 (arr!33719 (Array (_ BitVec 32) ValueCell!12579)) (size!34255 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70091)

(declare-fun getCurrentListMap!4244 (array!70089 array!70091 (_ BitVec 32) (_ BitVec 32) V!40563 V!40563 (_ BitVec 32) Int) ListLongMap!14897)

(assert (=> b!1086382 (= lt!482787 (getCurrentListMap!4244 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482785 () ListLongMap!14897)

(declare-fun lt!482777 () array!70089)

(declare-fun lt!482788 () array!70091)

(assert (=> b!1086382 (= lt!482785 (getCurrentListMap!4244 lt!482777 lt!482788 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482776 () ListLongMap!14897)

(declare-fun lt!482789 () ListLongMap!14897)

(assert (=> b!1086382 (and (= lt!482776 lt!482789) (= lt!482789 lt!482776))))

(declare-fun lt!482780 () ListLongMap!14897)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!790 (ListLongMap!14897 (_ BitVec 64)) ListLongMap!14897)

(assert (=> b!1086382 (= lt!482789 (-!790 lt!482780 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35746 0))(
  ( (Unit!35747) )
))
(declare-fun lt!482781 () Unit!35746)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!63 (array!70089 array!70091 (_ BitVec 32) (_ BitVec 32) V!40563 V!40563 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35746)

(assert (=> b!1086382 (= lt!482781 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!63 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4004 (array!70089 array!70091 (_ BitVec 32) (_ BitVec 32) V!40563 V!40563 (_ BitVec 32) Int) ListLongMap!14897)

(assert (=> b!1086382 (= lt!482776 (getCurrentListMapNoExtraKeys!4004 lt!482777 lt!482788 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2141 (Int (_ BitVec 64)) V!40563)

(assert (=> b!1086382 (= lt!482788 (array!70092 (store (arr!33719 _values!874) i!650 (ValueCellFull!12579 (dynLambda!2141 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34255 _values!874)))))

(assert (=> b!1086382 (= lt!482780 (getCurrentListMapNoExtraKeys!4004 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086382 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!482775 () Unit!35746)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70089 (_ BitVec 64) (_ BitVec 32)) Unit!35746)

(assert (=> b!1086382 (= lt!482775 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1086383 () Bool)

(declare-fun res!724407 () Bool)

(assert (=> b!1086383 (=> (not res!724407) (not e!620589))))

(declare-datatypes ((List!23519 0))(
  ( (Nil!23516) (Cons!23515 (h!24724 (_ BitVec 64)) (t!33152 List!23519)) )
))
(declare-fun arrayNoDuplicates!0 (array!70089 (_ BitVec 32) List!23519) Bool)

(assert (=> b!1086383 (= res!724407 (arrayNoDuplicates!0 lt!482777 #b00000000000000000000000000000000 Nil!23516))))

(declare-fun b!1086384 () Bool)

(declare-fun e!620591 () Bool)

(assert (=> b!1086384 (= e!620592 e!620591)))

(declare-fun res!724406 () Bool)

(assert (=> b!1086384 (=> res!724406 e!620591)))

(assert (=> b!1086384 (= res!724406 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!482782 () ListLongMap!14897)

(declare-fun lt!482784 () ListLongMap!14897)

(assert (=> b!1086384 (= lt!482782 lt!482784)))

(declare-fun lt!482790 () ListLongMap!14897)

(assert (=> b!1086384 (= lt!482782 (-!790 lt!482790 k0!904))))

(declare-fun lt!482783 () Unit!35746)

(declare-fun addRemoveCommutativeForDiffKeys!27 (ListLongMap!14897 (_ BitVec 64) V!40563 (_ BitVec 64)) Unit!35746)

(assert (=> b!1086384 (= lt!482783 (addRemoveCommutativeForDiffKeys!27 lt!482780 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!482791 () tuple2!16928)

(declare-fun +!3271 (ListLongMap!14897 tuple2!16928) ListLongMap!14897)

(assert (=> b!1086384 (= lt!482785 (+!3271 lt!482784 lt!482791))))

(declare-fun lt!482778 () tuple2!16928)

(assert (=> b!1086384 (= lt!482784 (+!3271 lt!482789 lt!482778))))

(declare-fun lt!482786 () ListLongMap!14897)

(assert (=> b!1086384 (= lt!482787 lt!482786)))

(assert (=> b!1086384 (= lt!482786 (+!3271 lt!482790 lt!482791))))

(assert (=> b!1086384 (= lt!482790 (+!3271 lt!482780 lt!482778))))

(assert (=> b!1086384 (= lt!482785 (+!3271 (+!3271 lt!482776 lt!482778) lt!482791))))

(assert (=> b!1086384 (= lt!482791 (tuple2!16929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086384 (= lt!482778 (tuple2!16929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1086385 () Bool)

(declare-fun e!620594 () Bool)

(assert (=> b!1086385 (= e!620594 (and e!620593 mapRes!41620))))

(declare-fun condMapEmpty!41620 () Bool)

(declare-fun mapDefault!41620 () ValueCell!12579)

(assert (=> b!1086385 (= condMapEmpty!41620 (= (arr!33719 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12579)) mapDefault!41620)))))

(declare-fun b!1086387 () Bool)

(declare-fun res!724403 () Bool)

(declare-fun e!620588 () Bool)

(assert (=> b!1086387 (=> (not res!724403) (not e!620588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70089 (_ BitVec 32)) Bool)

(assert (=> b!1086387 (= res!724403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1086388 () Bool)

(declare-fun res!724405 () Bool)

(assert (=> b!1086388 (=> (not res!724405) (not e!620588))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086388 (= res!724405 (validKeyInArray!0 k0!904))))

(declare-fun b!1086389 () Bool)

(declare-fun res!724408 () Bool)

(assert (=> b!1086389 (=> (not res!724408) (not e!620588))))

(assert (=> b!1086389 (= res!724408 (and (= (size!34255 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34254 _keys!1070) (size!34255 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1086390 () Bool)

(assert (=> b!1086390 (= e!620591 true)))

(assert (=> b!1086390 (= (-!790 lt!482786 k0!904) (+!3271 lt!482782 lt!482791))))

(declare-fun lt!482779 () Unit!35746)

(assert (=> b!1086390 (= lt!482779 (addRemoveCommutativeForDiffKeys!27 lt!482790 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1086391 () Bool)

(declare-fun res!724411 () Bool)

(assert (=> b!1086391 (=> (not res!724411) (not e!620588))))

(assert (=> b!1086391 (= res!724411 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23516))))

(declare-fun b!1086392 () Bool)

(declare-fun res!724404 () Bool)

(assert (=> b!1086392 (=> (not res!724404) (not e!620588))))

(assert (=> b!1086392 (= res!724404 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34254 _keys!1070))))))

(declare-fun mapNonEmpty!41620 () Bool)

(declare-fun tp!79574 () Bool)

(declare-fun e!620590 () Bool)

(assert (=> mapNonEmpty!41620 (= mapRes!41620 (and tp!79574 e!620590))))

(declare-fun mapValue!41620 () ValueCell!12579)

(declare-fun mapKey!41620 () (_ BitVec 32))

(declare-fun mapRest!41620 () (Array (_ BitVec 32) ValueCell!12579))

(assert (=> mapNonEmpty!41620 (= (arr!33719 _values!874) (store mapRest!41620 mapKey!41620 mapValue!41620))))

(declare-fun b!1086386 () Bool)

(declare-fun res!724410 () Bool)

(assert (=> b!1086386 (=> (not res!724410) (not e!620588))))

(assert (=> b!1086386 (= res!724410 (= (select (arr!33718 _keys!1070) i!650) k0!904))))

(declare-fun res!724413 () Bool)

(assert (=> start!95922 (=> (not res!724413) (not e!620588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95922 (= res!724413 (validMask!0 mask!1414))))

(assert (=> start!95922 e!620588))

(assert (=> start!95922 tp!79573))

(assert (=> start!95922 true))

(assert (=> start!95922 tp_is_empty!26577))

(declare-fun array_inv!26018 (array!70089) Bool)

(assert (=> start!95922 (array_inv!26018 _keys!1070)))

(declare-fun array_inv!26019 (array!70091) Bool)

(assert (=> start!95922 (and (array_inv!26019 _values!874) e!620594)))

(declare-fun b!1086393 () Bool)

(assert (=> b!1086393 (= e!620590 tp_is_empty!26577)))

(declare-fun b!1086394 () Bool)

(assert (=> b!1086394 (= e!620588 e!620589)))

(declare-fun res!724412 () Bool)

(assert (=> b!1086394 (=> (not res!724412) (not e!620589))))

(assert (=> b!1086394 (= res!724412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482777 mask!1414))))

(assert (=> b!1086394 (= lt!482777 (array!70090 (store (arr!33718 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34254 _keys!1070)))))

(assert (= (and start!95922 res!724413) b!1086389))

(assert (= (and b!1086389 res!724408) b!1086387))

(assert (= (and b!1086387 res!724403) b!1086391))

(assert (= (and b!1086391 res!724411) b!1086392))

(assert (= (and b!1086392 res!724404) b!1086388))

(assert (= (and b!1086388 res!724405) b!1086386))

(assert (= (and b!1086386 res!724410) b!1086394))

(assert (= (and b!1086394 res!724412) b!1086383))

(assert (= (and b!1086383 res!724407) b!1086382))

(assert (= (and b!1086382 (not res!724409)) b!1086384))

(assert (= (and b!1086384 (not res!724406)) b!1086390))

(assert (= (and b!1086385 condMapEmpty!41620) mapIsEmpty!41620))

(assert (= (and b!1086385 (not condMapEmpty!41620)) mapNonEmpty!41620))

(get-info :version)

(assert (= (and mapNonEmpty!41620 ((_ is ValueCellFull!12579) mapValue!41620)) b!1086393))

(assert (= (and b!1086385 ((_ is ValueCellFull!12579) mapDefault!41620)) b!1086381))

(assert (= start!95922 b!1086385))

(declare-fun b_lambda!17245 () Bool)

(assert (=> (not b_lambda!17245) (not b!1086382)))

(declare-fun t!33150 () Bool)

(declare-fun tb!7453 () Bool)

(assert (=> (and start!95922 (= defaultEntry!882 defaultEntry!882) t!33150) tb!7453))

(declare-fun result!15425 () Bool)

(assert (=> tb!7453 (= result!15425 tp_is_empty!26577)))

(assert (=> b!1086382 t!33150))

(declare-fun b_and!35827 () Bool)

(assert (= b_and!35825 (and (=> t!33150 result!15425) b_and!35827)))

(declare-fun m!1004855 () Bool)

(assert (=> b!1086394 m!1004855))

(declare-fun m!1004857 () Bool)

(assert (=> b!1086394 m!1004857))

(declare-fun m!1004859 () Bool)

(assert (=> b!1086387 m!1004859))

(declare-fun m!1004861 () Bool)

(assert (=> b!1086391 m!1004861))

(declare-fun m!1004863 () Bool)

(assert (=> b!1086383 m!1004863))

(declare-fun m!1004865 () Bool)

(assert (=> mapNonEmpty!41620 m!1004865))

(declare-fun m!1004867 () Bool)

(assert (=> b!1086388 m!1004867))

(declare-fun m!1004869 () Bool)

(assert (=> start!95922 m!1004869))

(declare-fun m!1004871 () Bool)

(assert (=> start!95922 m!1004871))

(declare-fun m!1004873 () Bool)

(assert (=> start!95922 m!1004873))

(declare-fun m!1004875 () Bool)

(assert (=> b!1086390 m!1004875))

(declare-fun m!1004877 () Bool)

(assert (=> b!1086390 m!1004877))

(declare-fun m!1004879 () Bool)

(assert (=> b!1086390 m!1004879))

(declare-fun m!1004881 () Bool)

(assert (=> b!1086382 m!1004881))

(declare-fun m!1004883 () Bool)

(assert (=> b!1086382 m!1004883))

(declare-fun m!1004885 () Bool)

(assert (=> b!1086382 m!1004885))

(declare-fun m!1004887 () Bool)

(assert (=> b!1086382 m!1004887))

(declare-fun m!1004889 () Bool)

(assert (=> b!1086382 m!1004889))

(declare-fun m!1004891 () Bool)

(assert (=> b!1086382 m!1004891))

(declare-fun m!1004893 () Bool)

(assert (=> b!1086382 m!1004893))

(declare-fun m!1004895 () Bool)

(assert (=> b!1086382 m!1004895))

(declare-fun m!1004897 () Bool)

(assert (=> b!1086382 m!1004897))

(declare-fun m!1004899 () Bool)

(assert (=> b!1086382 m!1004899))

(declare-fun m!1004901 () Bool)

(assert (=> b!1086384 m!1004901))

(declare-fun m!1004903 () Bool)

(assert (=> b!1086384 m!1004903))

(assert (=> b!1086384 m!1004901))

(declare-fun m!1004905 () Bool)

(assert (=> b!1086384 m!1004905))

(declare-fun m!1004907 () Bool)

(assert (=> b!1086384 m!1004907))

(declare-fun m!1004909 () Bool)

(assert (=> b!1086384 m!1004909))

(declare-fun m!1004911 () Bool)

(assert (=> b!1086384 m!1004911))

(declare-fun m!1004913 () Bool)

(assert (=> b!1086384 m!1004913))

(declare-fun m!1004915 () Bool)

(assert (=> b!1086384 m!1004915))

(declare-fun m!1004917 () Bool)

(assert (=> b!1086386 m!1004917))

(check-sat (not b!1086390) (not b_next!22575) (not b!1086382) b_and!35827 (not b!1086387) (not b!1086388) tp_is_empty!26577 (not start!95922) (not b!1086394) (not b!1086384) (not b!1086391) (not b_lambda!17245) (not b!1086383) (not mapNonEmpty!41620))
(check-sat b_and!35827 (not b_next!22575))
