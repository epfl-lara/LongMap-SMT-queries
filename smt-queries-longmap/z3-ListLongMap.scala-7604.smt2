; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95946 () Bool)

(assert start!95946)

(declare-fun b_free!22599 () Bool)

(declare-fun b_next!22599 () Bool)

(assert (=> start!95946 (= b_free!22599 (not b_next!22599))))

(declare-fun tp!79646 () Bool)

(declare-fun b_and!35873 () Bool)

(assert (=> start!95946 (= tp!79646 b_and!35873)))

(declare-fun mapIsEmpty!41656 () Bool)

(declare-fun mapRes!41656 () Bool)

(assert (=> mapIsEmpty!41656 mapRes!41656))

(declare-fun b!1086909 () Bool)

(declare-fun res!724804 () Bool)

(declare-fun e!620879 () Bool)

(assert (=> b!1086909 (=> (not res!724804) (not e!620879))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086909 (= res!724804 (validKeyInArray!0 k0!904))))

(declare-fun b!1086910 () Bool)

(declare-fun e!620875 () Bool)

(assert (=> b!1086910 (= e!620879 e!620875)))

(declare-fun res!724805 () Bool)

(assert (=> b!1086910 (=> (not res!724805) (not e!620875))))

(declare-datatypes ((array!70131 0))(
  ( (array!70132 (arr!33739 (Array (_ BitVec 32) (_ BitVec 64))) (size!34275 (_ BitVec 32))) )
))
(declare-fun lt!483403 () array!70131)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70131 (_ BitVec 32)) Bool)

(assert (=> b!1086910 (= res!724805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!483403 mask!1414))))

(declare-fun _keys!1070 () array!70131)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1086910 (= lt!483403 (array!70132 (store (arr!33739 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34275 _keys!1070)))))

(declare-fun b!1086911 () Bool)

(declare-fun res!724806 () Bool)

(assert (=> b!1086911 (=> (not res!724806) (not e!620875))))

(declare-datatypes ((List!23535 0))(
  ( (Nil!23532) (Cons!23531 (h!24740 (_ BitVec 64)) (t!33192 List!23535)) )
))
(declare-fun arrayNoDuplicates!0 (array!70131 (_ BitVec 32) List!23535) Bool)

(assert (=> b!1086911 (= res!724806 (arrayNoDuplicates!0 lt!483403 #b00000000000000000000000000000000 Nil!23532))))

(declare-fun b!1086912 () Bool)

(declare-fun e!620880 () Bool)

(assert (=> b!1086912 (= e!620875 (not e!620880))))

(declare-fun res!724809 () Bool)

(assert (=> b!1086912 (=> res!724809 e!620880)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1086912 (= res!724809 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40595 0))(
  ( (V!40596 (val!13357 Int)) )
))
(declare-fun minValue!831 () V!40595)

(declare-fun zeroValue!831 () V!40595)

(declare-datatypes ((ValueCell!12591 0))(
  ( (ValueCellFull!12591 (v!15978 V!40595)) (EmptyCell!12591) )
))
(declare-datatypes ((array!70133 0))(
  ( (array!70134 (arr!33740 (Array (_ BitVec 32) ValueCell!12591)) (size!34276 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70133)

(declare-datatypes ((tuple2!16946 0))(
  ( (tuple2!16947 (_1!8484 (_ BitVec 64)) (_2!8484 V!40595)) )
))
(declare-datatypes ((List!23536 0))(
  ( (Nil!23533) (Cons!23532 (h!24741 tuple2!16946) (t!33193 List!23536)) )
))
(declare-datatypes ((ListLongMap!14915 0))(
  ( (ListLongMap!14916 (toList!7473 List!23536)) )
))
(declare-fun lt!483401 () ListLongMap!14915)

(declare-fun getCurrentListMap!4251 (array!70131 array!70133 (_ BitVec 32) (_ BitVec 32) V!40595 V!40595 (_ BitVec 32) Int) ListLongMap!14915)

(assert (=> b!1086912 (= lt!483401 (getCurrentListMap!4251 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483395 () ListLongMap!14915)

(declare-fun lt!483390 () array!70133)

(assert (=> b!1086912 (= lt!483395 (getCurrentListMap!4251 lt!483403 lt!483390 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483402 () ListLongMap!14915)

(declare-fun lt!483393 () ListLongMap!14915)

(assert (=> b!1086912 (and (= lt!483402 lt!483393) (= lt!483393 lt!483402))))

(declare-fun lt!483388 () ListLongMap!14915)

(declare-fun -!799 (ListLongMap!14915 (_ BitVec 64)) ListLongMap!14915)

(assert (=> b!1086912 (= lt!483393 (-!799 lt!483388 k0!904))))

(declare-datatypes ((Unit!35764 0))(
  ( (Unit!35765) )
))
(declare-fun lt!483400 () Unit!35764)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!70 (array!70131 array!70133 (_ BitVec 32) (_ BitVec 32) V!40595 V!40595 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35764)

(assert (=> b!1086912 (= lt!483400 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!70 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4011 (array!70131 array!70133 (_ BitVec 32) (_ BitVec 32) V!40595 V!40595 (_ BitVec 32) Int) ListLongMap!14915)

(assert (=> b!1086912 (= lt!483402 (getCurrentListMapNoExtraKeys!4011 lt!483403 lt!483390 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2148 (Int (_ BitVec 64)) V!40595)

(assert (=> b!1086912 (= lt!483390 (array!70134 (store (arr!33740 _values!874) i!650 (ValueCellFull!12591 (dynLambda!2148 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34276 _values!874)))))

(assert (=> b!1086912 (= lt!483388 (getCurrentListMapNoExtraKeys!4011 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086912 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!483399 () Unit!35764)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70131 (_ BitVec 64) (_ BitVec 32)) Unit!35764)

(assert (=> b!1086912 (= lt!483399 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!724802 () Bool)

(assert (=> start!95946 (=> (not res!724802) (not e!620879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95946 (= res!724802 (validMask!0 mask!1414))))

(assert (=> start!95946 e!620879))

(assert (=> start!95946 tp!79646))

(assert (=> start!95946 true))

(declare-fun tp_is_empty!26601 () Bool)

(assert (=> start!95946 tp_is_empty!26601))

(declare-fun array_inv!26030 (array!70131) Bool)

(assert (=> start!95946 (array_inv!26030 _keys!1070)))

(declare-fun e!620878 () Bool)

(declare-fun array_inv!26031 (array!70133) Bool)

(assert (=> start!95946 (and (array_inv!26031 _values!874) e!620878)))

(declare-fun b!1086913 () Bool)

(declare-fun e!620876 () Bool)

(assert (=> b!1086913 (= e!620876 tp_is_empty!26601)))

(declare-fun b!1086914 () Bool)

(declare-fun res!724808 () Bool)

(assert (=> b!1086914 (=> (not res!724808) (not e!620879))))

(assert (=> b!1086914 (= res!724808 (and (= (size!34276 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34275 _keys!1070) (size!34276 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1086915 () Bool)

(declare-fun e!620881 () Bool)

(assert (=> b!1086915 (= e!620880 e!620881)))

(declare-fun res!724807 () Bool)

(assert (=> b!1086915 (=> res!724807 e!620881)))

(assert (=> b!1086915 (= res!724807 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!483396 () ListLongMap!14915)

(declare-fun lt!483387 () ListLongMap!14915)

(assert (=> b!1086915 (= lt!483396 lt!483387)))

(declare-fun lt!483394 () ListLongMap!14915)

(assert (=> b!1086915 (= lt!483396 (-!799 lt!483394 k0!904))))

(declare-fun lt!483397 () Unit!35764)

(declare-fun addRemoveCommutativeForDiffKeys!35 (ListLongMap!14915 (_ BitVec 64) V!40595 (_ BitVec 64)) Unit!35764)

(assert (=> b!1086915 (= lt!483397 (addRemoveCommutativeForDiffKeys!35 lt!483388 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!483398 () tuple2!16946)

(declare-fun +!3279 (ListLongMap!14915 tuple2!16946) ListLongMap!14915)

(assert (=> b!1086915 (= lt!483395 (+!3279 lt!483387 lt!483398))))

(declare-fun lt!483391 () tuple2!16946)

(assert (=> b!1086915 (= lt!483387 (+!3279 lt!483393 lt!483391))))

(declare-fun lt!483392 () ListLongMap!14915)

(assert (=> b!1086915 (= lt!483401 lt!483392)))

(assert (=> b!1086915 (= lt!483392 (+!3279 lt!483394 lt!483398))))

(assert (=> b!1086915 (= lt!483394 (+!3279 lt!483388 lt!483391))))

(assert (=> b!1086915 (= lt!483395 (+!3279 (+!3279 lt!483402 lt!483391) lt!483398))))

(assert (=> b!1086915 (= lt!483398 (tuple2!16947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086915 (= lt!483391 (tuple2!16947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1086916 () Bool)

(declare-fun res!724799 () Bool)

(assert (=> b!1086916 (=> (not res!724799) (not e!620879))))

(assert (=> b!1086916 (= res!724799 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34275 _keys!1070))))))

(declare-fun b!1086917 () Bool)

(assert (=> b!1086917 (= e!620881 true)))

(assert (=> b!1086917 (= (-!799 lt!483392 k0!904) (+!3279 lt!483396 lt!483398))))

(declare-fun lt!483389 () Unit!35764)

(assert (=> b!1086917 (= lt!483389 (addRemoveCommutativeForDiffKeys!35 lt!483394 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1086918 () Bool)

(declare-fun res!724800 () Bool)

(assert (=> b!1086918 (=> (not res!724800) (not e!620879))))

(assert (=> b!1086918 (= res!724800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41656 () Bool)

(declare-fun tp!79645 () Bool)

(assert (=> mapNonEmpty!41656 (= mapRes!41656 (and tp!79645 e!620876))))

(declare-fun mapValue!41656 () ValueCell!12591)

(declare-fun mapKey!41656 () (_ BitVec 32))

(declare-fun mapRest!41656 () (Array (_ BitVec 32) ValueCell!12591))

(assert (=> mapNonEmpty!41656 (= (arr!33740 _values!874) (store mapRest!41656 mapKey!41656 mapValue!41656))))

(declare-fun b!1086919 () Bool)

(declare-fun res!724803 () Bool)

(assert (=> b!1086919 (=> (not res!724803) (not e!620879))))

(assert (=> b!1086919 (= res!724803 (= (select (arr!33739 _keys!1070) i!650) k0!904))))

(declare-fun b!1086920 () Bool)

(declare-fun res!724801 () Bool)

(assert (=> b!1086920 (=> (not res!724801) (not e!620879))))

(assert (=> b!1086920 (= res!724801 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23532))))

(declare-fun b!1086921 () Bool)

(declare-fun e!620877 () Bool)

(assert (=> b!1086921 (= e!620878 (and e!620877 mapRes!41656))))

(declare-fun condMapEmpty!41656 () Bool)

(declare-fun mapDefault!41656 () ValueCell!12591)

(assert (=> b!1086921 (= condMapEmpty!41656 (= (arr!33740 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12591)) mapDefault!41656)))))

(declare-fun b!1086922 () Bool)

(assert (=> b!1086922 (= e!620877 tp_is_empty!26601)))

(assert (= (and start!95946 res!724802) b!1086914))

(assert (= (and b!1086914 res!724808) b!1086918))

(assert (= (and b!1086918 res!724800) b!1086920))

(assert (= (and b!1086920 res!724801) b!1086916))

(assert (= (and b!1086916 res!724799) b!1086909))

(assert (= (and b!1086909 res!724804) b!1086919))

(assert (= (and b!1086919 res!724803) b!1086910))

(assert (= (and b!1086910 res!724805) b!1086911))

(assert (= (and b!1086911 res!724806) b!1086912))

(assert (= (and b!1086912 (not res!724809)) b!1086915))

(assert (= (and b!1086915 (not res!724807)) b!1086917))

(assert (= (and b!1086921 condMapEmpty!41656) mapIsEmpty!41656))

(assert (= (and b!1086921 (not condMapEmpty!41656)) mapNonEmpty!41656))

(get-info :version)

(assert (= (and mapNonEmpty!41656 ((_ is ValueCellFull!12591) mapValue!41656)) b!1086913))

(assert (= (and b!1086921 ((_ is ValueCellFull!12591) mapDefault!41656)) b!1086922))

(assert (= start!95946 b!1086921))

(declare-fun b_lambda!17269 () Bool)

(assert (=> (not b_lambda!17269) (not b!1086912)))

(declare-fun t!33191 () Bool)

(declare-fun tb!7477 () Bool)

(assert (=> (and start!95946 (= defaultEntry!882 defaultEntry!882) t!33191) tb!7477))

(declare-fun result!15473 () Bool)

(assert (=> tb!7477 (= result!15473 tp_is_empty!26601)))

(assert (=> b!1086912 t!33191))

(declare-fun b_and!35875 () Bool)

(assert (= b_and!35873 (and (=> t!33191 result!15473) b_and!35875)))

(declare-fun m!1005623 () Bool)

(assert (=> start!95946 m!1005623))

(declare-fun m!1005625 () Bool)

(assert (=> start!95946 m!1005625))

(declare-fun m!1005627 () Bool)

(assert (=> start!95946 m!1005627))

(declare-fun m!1005629 () Bool)

(assert (=> b!1086911 m!1005629))

(declare-fun m!1005631 () Bool)

(assert (=> b!1086919 m!1005631))

(declare-fun m!1005633 () Bool)

(assert (=> b!1086920 m!1005633))

(declare-fun m!1005635 () Bool)

(assert (=> b!1086910 m!1005635))

(declare-fun m!1005637 () Bool)

(assert (=> b!1086910 m!1005637))

(declare-fun m!1005639 () Bool)

(assert (=> b!1086917 m!1005639))

(declare-fun m!1005641 () Bool)

(assert (=> b!1086917 m!1005641))

(declare-fun m!1005643 () Bool)

(assert (=> b!1086917 m!1005643))

(declare-fun m!1005645 () Bool)

(assert (=> b!1086912 m!1005645))

(declare-fun m!1005647 () Bool)

(assert (=> b!1086912 m!1005647))

(declare-fun m!1005649 () Bool)

(assert (=> b!1086912 m!1005649))

(declare-fun m!1005651 () Bool)

(assert (=> b!1086912 m!1005651))

(declare-fun m!1005653 () Bool)

(assert (=> b!1086912 m!1005653))

(declare-fun m!1005655 () Bool)

(assert (=> b!1086912 m!1005655))

(declare-fun m!1005657 () Bool)

(assert (=> b!1086912 m!1005657))

(declare-fun m!1005659 () Bool)

(assert (=> b!1086912 m!1005659))

(declare-fun m!1005661 () Bool)

(assert (=> b!1086912 m!1005661))

(declare-fun m!1005663 () Bool)

(assert (=> b!1086912 m!1005663))

(declare-fun m!1005665 () Bool)

(assert (=> mapNonEmpty!41656 m!1005665))

(declare-fun m!1005667 () Bool)

(assert (=> b!1086915 m!1005667))

(declare-fun m!1005669 () Bool)

(assert (=> b!1086915 m!1005669))

(declare-fun m!1005671 () Bool)

(assert (=> b!1086915 m!1005671))

(declare-fun m!1005673 () Bool)

(assert (=> b!1086915 m!1005673))

(declare-fun m!1005675 () Bool)

(assert (=> b!1086915 m!1005675))

(declare-fun m!1005677 () Bool)

(assert (=> b!1086915 m!1005677))

(declare-fun m!1005679 () Bool)

(assert (=> b!1086915 m!1005679))

(assert (=> b!1086915 m!1005675))

(declare-fun m!1005681 () Bool)

(assert (=> b!1086915 m!1005681))

(declare-fun m!1005683 () Bool)

(assert (=> b!1086909 m!1005683))

(declare-fun m!1005685 () Bool)

(assert (=> b!1086918 m!1005685))

(check-sat (not b!1086920) (not b!1086912) (not b!1086911) b_and!35875 (not b_next!22599) (not b!1086918) (not b!1086917) (not mapNonEmpty!41656) (not b!1086915) tp_is_empty!26601 (not start!95946) (not b!1086910) (not b!1086909) (not b_lambda!17269))
(check-sat b_and!35875 (not b_next!22599))
