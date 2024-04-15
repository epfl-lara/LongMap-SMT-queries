; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95968 () Bool)

(assert start!95968)

(declare-fun b_free!22627 () Bool)

(declare-fun b_next!22627 () Bool)

(assert (=> start!95968 (= b_free!22627 (not b_next!22627))))

(declare-fun tp!79729 () Bool)

(declare-fun b_and!35903 () Bool)

(assert (=> start!95968 (= tp!79729 b_and!35903)))

(declare-fun b!1087381 () Bool)

(declare-fun e!621119 () Bool)

(assert (=> b!1087381 (= e!621119 true)))

(declare-datatypes ((V!40633 0))(
  ( (V!40634 (val!13371 Int)) )
))
(declare-datatypes ((tuple2!17024 0))(
  ( (tuple2!17025 (_1!8523 (_ BitVec 64)) (_2!8523 V!40633)) )
))
(declare-datatypes ((List!23592 0))(
  ( (Nil!23589) (Cons!23588 (h!24797 tuple2!17024) (t!33268 List!23592)) )
))
(declare-datatypes ((ListLongMap!14993 0))(
  ( (ListLongMap!14994 (toList!7512 List!23592)) )
))
(declare-fun lt!483795 () ListLongMap!14993)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!483796 () ListLongMap!14993)

(declare-fun -!791 (ListLongMap!14993 (_ BitVec 64)) ListLongMap!14993)

(assert (=> b!1087381 (= (-!791 lt!483795 k0!904) lt!483796)))

(declare-datatypes ((Unit!35617 0))(
  ( (Unit!35618) )
))
(declare-fun lt!483800 () Unit!35617)

(declare-fun lt!483799 () ListLongMap!14993)

(declare-fun zeroValue!831 () V!40633)

(declare-fun addRemoveCommutativeForDiffKeys!45 (ListLongMap!14993 (_ BitVec 64) V!40633 (_ BitVec 64)) Unit!35617)

(assert (=> b!1087381 (= lt!483800 (addRemoveCommutativeForDiffKeys!45 lt!483799 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun res!725211 () Bool)

(declare-fun e!621125 () Bool)

(assert (=> start!95968 (=> (not res!725211) (not e!621125))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95968 (= res!725211 (validMask!0 mask!1414))))

(assert (=> start!95968 e!621125))

(assert (=> start!95968 tp!79729))

(assert (=> start!95968 true))

(declare-fun tp_is_empty!26629 () Bool)

(assert (=> start!95968 tp_is_empty!26629))

(declare-datatypes ((array!70108 0))(
  ( (array!70109 (arr!33728 (Array (_ BitVec 32) (_ BitVec 64))) (size!34266 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70108)

(declare-fun array_inv!26064 (array!70108) Bool)

(assert (=> start!95968 (array_inv!26064 _keys!1070)))

(declare-datatypes ((ValueCell!12605 0))(
  ( (ValueCellFull!12605 (v!15991 V!40633)) (EmptyCell!12605) )
))
(declare-datatypes ((array!70110 0))(
  ( (array!70111 (arr!33729 (Array (_ BitVec 32) ValueCell!12605)) (size!34267 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70110)

(declare-fun e!621123 () Bool)

(declare-fun array_inv!26065 (array!70110) Bool)

(assert (=> start!95968 (and (array_inv!26065 _values!874) e!621123)))

(declare-fun b!1087382 () Bool)

(declare-fun res!725207 () Bool)

(assert (=> b!1087382 (=> (not res!725207) (not e!621125))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1087382 (= res!725207 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34266 _keys!1070))))))

(declare-fun b!1087383 () Bool)

(declare-fun res!725202 () Bool)

(assert (=> b!1087383 (=> (not res!725202) (not e!621125))))

(declare-datatypes ((List!23593 0))(
  ( (Nil!23590) (Cons!23589 (h!24798 (_ BitVec 64)) (t!33269 List!23593)) )
))
(declare-fun arrayNoDuplicates!0 (array!70108 (_ BitVec 32) List!23593) Bool)

(assert (=> b!1087383 (= res!725202 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23590))))

(declare-fun b!1087384 () Bool)

(declare-fun res!725204 () Bool)

(assert (=> b!1087384 (=> (not res!725204) (not e!621125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087384 (= res!725204 (validKeyInArray!0 k0!904))))

(declare-fun b!1087385 () Bool)

(declare-fun res!725201 () Bool)

(assert (=> b!1087385 (=> (not res!725201) (not e!621125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70108 (_ BitVec 32)) Bool)

(assert (=> b!1087385 (= res!725201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1087386 () Bool)

(declare-fun e!621122 () Bool)

(assert (=> b!1087386 (= e!621122 tp_is_empty!26629)))

(declare-fun b!1087387 () Bool)

(declare-fun res!725210 () Bool)

(assert (=> b!1087387 (=> (not res!725210) (not e!621125))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1087387 (= res!725210 (and (= (size!34267 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34266 _keys!1070) (size!34267 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1087388 () Bool)

(declare-fun res!725205 () Bool)

(assert (=> b!1087388 (=> (not res!725205) (not e!621125))))

(assert (=> b!1087388 (= res!725205 (= (select (arr!33728 _keys!1070) i!650) k0!904))))

(declare-fun b!1087389 () Bool)

(declare-fun e!621124 () Bool)

(assert (=> b!1087389 (= e!621125 e!621124)))

(declare-fun res!725209 () Bool)

(assert (=> b!1087389 (=> (not res!725209) (not e!621124))))

(declare-fun lt!483804 () array!70108)

(assert (=> b!1087389 (= res!725209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!483804 mask!1414))))

(assert (=> b!1087389 (= lt!483804 (array!70109 (store (arr!33728 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34266 _keys!1070)))))

(declare-fun b!1087390 () Bool)

(declare-fun e!621120 () Bool)

(assert (=> b!1087390 (= e!621120 e!621119)))

(declare-fun res!725208 () Bool)

(assert (=> b!1087390 (=> res!725208 e!621119)))

(assert (=> b!1087390 (= res!725208 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!483803 () ListLongMap!14993)

(assert (=> b!1087390 (= lt!483803 lt!483796)))

(declare-fun lt!483797 () ListLongMap!14993)

(declare-fun lt!483801 () tuple2!17024)

(declare-fun +!3318 (ListLongMap!14993 tuple2!17024) ListLongMap!14993)

(assert (=> b!1087390 (= lt!483796 (+!3318 lt!483797 lt!483801))))

(declare-fun lt!483802 () ListLongMap!14993)

(assert (=> b!1087390 (= lt!483802 lt!483795)))

(assert (=> b!1087390 (= lt!483795 (+!3318 lt!483799 lt!483801))))

(declare-fun lt!483794 () ListLongMap!14993)

(assert (=> b!1087390 (= lt!483803 (+!3318 lt!483794 lt!483801))))

(assert (=> b!1087390 (= lt!483801 (tuple2!17025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1087391 () Bool)

(declare-fun e!621121 () Bool)

(assert (=> b!1087391 (= e!621121 tp_is_empty!26629)))

(declare-fun b!1087392 () Bool)

(declare-fun mapRes!41698 () Bool)

(assert (=> b!1087392 (= e!621123 (and e!621122 mapRes!41698))))

(declare-fun condMapEmpty!41698 () Bool)

(declare-fun mapDefault!41698 () ValueCell!12605)

(assert (=> b!1087392 (= condMapEmpty!41698 (= (arr!33729 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12605)) mapDefault!41698)))))

(declare-fun b!1087393 () Bool)

(assert (=> b!1087393 (= e!621124 (not e!621120))))

(declare-fun res!725203 () Bool)

(assert (=> b!1087393 (=> res!725203 e!621120)))

(assert (=> b!1087393 (= res!725203 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40633)

(declare-fun getCurrentListMap!4195 (array!70108 array!70110 (_ BitVec 32) (_ BitVec 32) V!40633 V!40633 (_ BitVec 32) Int) ListLongMap!14993)

(assert (=> b!1087393 (= lt!483802 (getCurrentListMap!4195 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483798 () array!70110)

(assert (=> b!1087393 (= lt!483803 (getCurrentListMap!4195 lt!483804 lt!483798 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1087393 (and (= lt!483794 lt!483797) (= lt!483797 lt!483794))))

(assert (=> b!1087393 (= lt!483797 (-!791 lt!483799 k0!904))))

(declare-fun lt!483805 () Unit!35617)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!79 (array!70108 array!70110 (_ BitVec 32) (_ BitVec 32) V!40633 V!40633 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35617)

(assert (=> b!1087393 (= lt!483805 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!79 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4065 (array!70108 array!70110 (_ BitVec 32) (_ BitVec 32) V!40633 V!40633 (_ BitVec 32) Int) ListLongMap!14993)

(assert (=> b!1087393 (= lt!483794 (getCurrentListMapNoExtraKeys!4065 lt!483804 lt!483798 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2136 (Int (_ BitVec 64)) V!40633)

(assert (=> b!1087393 (= lt!483798 (array!70111 (store (arr!33729 _values!874) i!650 (ValueCellFull!12605 (dynLambda!2136 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34267 _values!874)))))

(assert (=> b!1087393 (= lt!483799 (getCurrentListMapNoExtraKeys!4065 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70108 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087393 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!483806 () Unit!35617)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70108 (_ BitVec 64) (_ BitVec 32)) Unit!35617)

(assert (=> b!1087393 (= lt!483806 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!41698 () Bool)

(assert (=> mapIsEmpty!41698 mapRes!41698))

(declare-fun b!1087394 () Bool)

(declare-fun res!725206 () Bool)

(assert (=> b!1087394 (=> (not res!725206) (not e!621124))))

(assert (=> b!1087394 (= res!725206 (arrayNoDuplicates!0 lt!483804 #b00000000000000000000000000000000 Nil!23590))))

(declare-fun mapNonEmpty!41698 () Bool)

(declare-fun tp!79730 () Bool)

(assert (=> mapNonEmpty!41698 (= mapRes!41698 (and tp!79730 e!621121))))

(declare-fun mapRest!41698 () (Array (_ BitVec 32) ValueCell!12605))

(declare-fun mapKey!41698 () (_ BitVec 32))

(declare-fun mapValue!41698 () ValueCell!12605)

(assert (=> mapNonEmpty!41698 (= (arr!33729 _values!874) (store mapRest!41698 mapKey!41698 mapValue!41698))))

(assert (= (and start!95968 res!725211) b!1087387))

(assert (= (and b!1087387 res!725210) b!1087385))

(assert (= (and b!1087385 res!725201) b!1087383))

(assert (= (and b!1087383 res!725202) b!1087382))

(assert (= (and b!1087382 res!725207) b!1087384))

(assert (= (and b!1087384 res!725204) b!1087388))

(assert (= (and b!1087388 res!725205) b!1087389))

(assert (= (and b!1087389 res!725209) b!1087394))

(assert (= (and b!1087394 res!725206) b!1087393))

(assert (= (and b!1087393 (not res!725203)) b!1087390))

(assert (= (and b!1087390 (not res!725208)) b!1087381))

(assert (= (and b!1087392 condMapEmpty!41698) mapIsEmpty!41698))

(assert (= (and b!1087392 (not condMapEmpty!41698)) mapNonEmpty!41698))

(get-info :version)

(assert (= (and mapNonEmpty!41698 ((_ is ValueCellFull!12605) mapValue!41698)) b!1087391))

(assert (= (and b!1087392 ((_ is ValueCellFull!12605) mapDefault!41698)) b!1087386))

(assert (= start!95968 b!1087392))

(declare-fun b_lambda!17275 () Bool)

(assert (=> (not b_lambda!17275) (not b!1087393)))

(declare-fun t!33267 () Bool)

(declare-fun tb!7497 () Bool)

(assert (=> (and start!95968 (= defaultEntry!882 defaultEntry!882) t!33267) tb!7497))

(declare-fun result!15521 () Bool)

(assert (=> tb!7497 (= result!15521 tp_is_empty!26629)))

(assert (=> b!1087393 t!33267))

(declare-fun b_and!35905 () Bool)

(assert (= b_and!35903 (and (=> t!33267 result!15521) b_and!35905)))

(declare-fun m!1005809 () Bool)

(assert (=> mapNonEmpty!41698 m!1005809))

(declare-fun m!1005811 () Bool)

(assert (=> b!1087388 m!1005811))

(declare-fun m!1005813 () Bool)

(assert (=> b!1087381 m!1005813))

(declare-fun m!1005815 () Bool)

(assert (=> b!1087381 m!1005815))

(declare-fun m!1005817 () Bool)

(assert (=> b!1087385 m!1005817))

(declare-fun m!1005819 () Bool)

(assert (=> b!1087393 m!1005819))

(declare-fun m!1005821 () Bool)

(assert (=> b!1087393 m!1005821))

(declare-fun m!1005823 () Bool)

(assert (=> b!1087393 m!1005823))

(declare-fun m!1005825 () Bool)

(assert (=> b!1087393 m!1005825))

(declare-fun m!1005827 () Bool)

(assert (=> b!1087393 m!1005827))

(declare-fun m!1005829 () Bool)

(assert (=> b!1087393 m!1005829))

(declare-fun m!1005831 () Bool)

(assert (=> b!1087393 m!1005831))

(declare-fun m!1005833 () Bool)

(assert (=> b!1087393 m!1005833))

(declare-fun m!1005835 () Bool)

(assert (=> b!1087393 m!1005835))

(declare-fun m!1005837 () Bool)

(assert (=> b!1087393 m!1005837))

(declare-fun m!1005839 () Bool)

(assert (=> b!1087390 m!1005839))

(declare-fun m!1005841 () Bool)

(assert (=> b!1087390 m!1005841))

(declare-fun m!1005843 () Bool)

(assert (=> b!1087390 m!1005843))

(declare-fun m!1005845 () Bool)

(assert (=> b!1087389 m!1005845))

(declare-fun m!1005847 () Bool)

(assert (=> b!1087389 m!1005847))

(declare-fun m!1005849 () Bool)

(assert (=> start!95968 m!1005849))

(declare-fun m!1005851 () Bool)

(assert (=> start!95968 m!1005851))

(declare-fun m!1005853 () Bool)

(assert (=> start!95968 m!1005853))

(declare-fun m!1005855 () Bool)

(assert (=> b!1087384 m!1005855))

(declare-fun m!1005857 () Bool)

(assert (=> b!1087383 m!1005857))

(declare-fun m!1005859 () Bool)

(assert (=> b!1087394 m!1005859))

(check-sat (not b!1087384) (not b!1087390) (not b!1087385) (not mapNonEmpty!41698) (not b!1087394) (not b!1087383) (not b_next!22627) (not start!95968) (not b_lambda!17275) (not b!1087389) tp_is_empty!26629 (not b!1087393) (not b!1087381) b_and!35905)
(check-sat b_and!35905 (not b_next!22627))
