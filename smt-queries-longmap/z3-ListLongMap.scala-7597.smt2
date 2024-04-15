; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95896 () Bool)

(assert start!95896)

(declare-fun b_free!22555 () Bool)

(declare-fun b_next!22555 () Bool)

(assert (=> start!95896 (= b_free!22555 (not b_next!22555))))

(declare-fun tp!79513 () Bool)

(declare-fun b_and!35759 () Bool)

(assert (=> start!95896 (= tp!79513 b_and!35759)))

(declare-fun b!1085788 () Bool)

(declare-fun res!724014 () Bool)

(declare-fun e!620254 () Bool)

(assert (=> b!1085788 (=> (not res!724014) (not e!620254))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085788 (= res!724014 (validKeyInArray!0 k0!904))))

(declare-fun b!1085789 () Bool)

(declare-fun res!724012 () Bool)

(assert (=> b!1085789 (=> (not res!724012) (not e!620254))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69972 0))(
  ( (array!69973 (arr!33660 (Array (_ BitVec 32) (_ BitVec 64))) (size!34198 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69972)

(declare-datatypes ((V!40537 0))(
  ( (V!40538 (val!13335 Int)) )
))
(declare-datatypes ((ValueCell!12569 0))(
  ( (ValueCellFull!12569 (v!15955 V!40537)) (EmptyCell!12569) )
))
(declare-datatypes ((array!69974 0))(
  ( (array!69975 (arr!33661 (Array (_ BitVec 32) ValueCell!12569)) (size!34199 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69974)

(assert (=> b!1085789 (= res!724012 (and (= (size!34199 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34198 _keys!1070) (size!34199 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085790 () Bool)

(declare-fun res!724005 () Bool)

(assert (=> b!1085790 (=> (not res!724005) (not e!620254))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085790 (= res!724005 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34198 _keys!1070))))))

(declare-fun b!1085792 () Bool)

(declare-fun e!620255 () Bool)

(declare-fun tp_is_empty!26557 () Bool)

(assert (=> b!1085792 (= e!620255 tp_is_empty!26557)))

(declare-fun b!1085793 () Bool)

(declare-fun res!724004 () Bool)

(assert (=> b!1085793 (=> (not res!724004) (not e!620254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69972 (_ BitVec 32)) Bool)

(assert (=> b!1085793 (= res!724004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41590 () Bool)

(declare-fun mapRes!41590 () Bool)

(assert (=> mapIsEmpty!41590 mapRes!41590))

(declare-fun b!1085794 () Bool)

(declare-fun res!724010 () Bool)

(declare-fun e!620260 () Bool)

(assert (=> b!1085794 (=> (not res!724010) (not e!620260))))

(declare-fun lt!482067 () array!69972)

(declare-datatypes ((List!23537 0))(
  ( (Nil!23534) (Cons!23533 (h!24742 (_ BitVec 64)) (t!33141 List!23537)) )
))
(declare-fun arrayNoDuplicates!0 (array!69972 (_ BitVec 32) List!23537) Bool)

(assert (=> b!1085794 (= res!724010 (arrayNoDuplicates!0 lt!482067 #b00000000000000000000000000000000 Nil!23534))))

(declare-fun b!1085795 () Bool)

(declare-fun e!620256 () Bool)

(assert (=> b!1085795 (= e!620256 (bvsle #b00000000000000000000000000000000 (size!34198 _keys!1070)))))

(declare-datatypes ((tuple2!16966 0))(
  ( (tuple2!16967 (_1!8494 (_ BitVec 64)) (_2!8494 V!40537)) )
))
(declare-fun lt!482074 () tuple2!16966)

(declare-datatypes ((List!23538 0))(
  ( (Nil!23535) (Cons!23534 (h!24743 tuple2!16966) (t!33142 List!23538)) )
))
(declare-datatypes ((ListLongMap!14935 0))(
  ( (ListLongMap!14936 (toList!7483 List!23538)) )
))
(declare-fun lt!482077 () ListLongMap!14935)

(declare-fun lt!482072 () ListLongMap!14935)

(declare-fun -!762 (ListLongMap!14935 (_ BitVec 64)) ListLongMap!14935)

(declare-fun +!3291 (ListLongMap!14935 tuple2!16966) ListLongMap!14935)

(assert (=> b!1085795 (= (-!762 lt!482077 k0!904) (+!3291 lt!482072 lt!482074))))

(declare-fun minValue!831 () V!40537)

(declare-fun lt!482078 () ListLongMap!14935)

(declare-datatypes ((Unit!35559 0))(
  ( (Unit!35560) )
))
(declare-fun lt!482079 () Unit!35559)

(declare-fun addRemoveCommutativeForDiffKeys!20 (ListLongMap!14935 (_ BitVec 64) V!40537 (_ BitVec 64)) Unit!35559)

(assert (=> b!1085795 (= lt!482079 (addRemoveCommutativeForDiffKeys!20 lt!482078 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1085796 () Bool)

(declare-fun e!620261 () Bool)

(assert (=> b!1085796 (= e!620261 e!620256)))

(declare-fun res!724011 () Bool)

(assert (=> b!1085796 (=> res!724011 e!620256)))

(assert (=> b!1085796 (= res!724011 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!482066 () ListLongMap!14935)

(assert (=> b!1085796 (= lt!482072 lt!482066)))

(assert (=> b!1085796 (= lt!482072 (-!762 lt!482078 k0!904))))

(declare-fun lt!482080 () ListLongMap!14935)

(declare-fun lt!482070 () Unit!35559)

(declare-fun zeroValue!831 () V!40537)

(assert (=> b!1085796 (= lt!482070 (addRemoveCommutativeForDiffKeys!20 lt!482080 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!482075 () ListLongMap!14935)

(assert (=> b!1085796 (= lt!482075 (+!3291 lt!482066 lt!482074))))

(declare-fun lt!482071 () ListLongMap!14935)

(declare-fun lt!482076 () tuple2!16966)

(assert (=> b!1085796 (= lt!482066 (+!3291 lt!482071 lt!482076))))

(declare-fun lt!482065 () ListLongMap!14935)

(assert (=> b!1085796 (= lt!482065 lt!482077)))

(assert (=> b!1085796 (= lt!482077 (+!3291 lt!482078 lt!482074))))

(assert (=> b!1085796 (= lt!482078 (+!3291 lt!482080 lt!482076))))

(declare-fun lt!482068 () ListLongMap!14935)

(assert (=> b!1085796 (= lt!482075 (+!3291 (+!3291 lt!482068 lt!482076) lt!482074))))

(assert (=> b!1085796 (= lt!482074 (tuple2!16967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1085796 (= lt!482076 (tuple2!16967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun mapNonEmpty!41590 () Bool)

(declare-fun tp!79514 () Bool)

(assert (=> mapNonEmpty!41590 (= mapRes!41590 (and tp!79514 e!620255))))

(declare-fun mapKey!41590 () (_ BitVec 32))

(declare-fun mapRest!41590 () (Array (_ BitVec 32) ValueCell!12569))

(declare-fun mapValue!41590 () ValueCell!12569)

(assert (=> mapNonEmpty!41590 (= (arr!33661 _values!874) (store mapRest!41590 mapKey!41590 mapValue!41590))))

(declare-fun b!1085797 () Bool)

(declare-fun res!724006 () Bool)

(assert (=> b!1085797 (=> (not res!724006) (not e!620254))))

(assert (=> b!1085797 (= res!724006 (= (select (arr!33660 _keys!1070) i!650) k0!904))))

(declare-fun b!1085798 () Bool)

(declare-fun e!620259 () Bool)

(declare-fun e!620257 () Bool)

(assert (=> b!1085798 (= e!620259 (and e!620257 mapRes!41590))))

(declare-fun condMapEmpty!41590 () Bool)

(declare-fun mapDefault!41590 () ValueCell!12569)

(assert (=> b!1085798 (= condMapEmpty!41590 (= (arr!33661 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12569)) mapDefault!41590)))))

(declare-fun b!1085799 () Bool)

(declare-fun res!724007 () Bool)

(assert (=> b!1085799 (=> (not res!724007) (not e!620254))))

(assert (=> b!1085799 (= res!724007 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23534))))

(declare-fun b!1085791 () Bool)

(assert (=> b!1085791 (= e!620257 tp_is_empty!26557)))

(declare-fun res!724013 () Bool)

(assert (=> start!95896 (=> (not res!724013) (not e!620254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95896 (= res!724013 (validMask!0 mask!1414))))

(assert (=> start!95896 e!620254))

(assert (=> start!95896 tp!79513))

(assert (=> start!95896 true))

(assert (=> start!95896 tp_is_empty!26557))

(declare-fun array_inv!26012 (array!69972) Bool)

(assert (=> start!95896 (array_inv!26012 _keys!1070)))

(declare-fun array_inv!26013 (array!69974) Bool)

(assert (=> start!95896 (and (array_inv!26013 _values!874) e!620259)))

(declare-fun b!1085800 () Bool)

(assert (=> b!1085800 (= e!620260 (not e!620261))))

(declare-fun res!724008 () Bool)

(assert (=> b!1085800 (=> res!724008 e!620261)))

(assert (=> b!1085800 (= res!724008 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4172 (array!69972 array!69974 (_ BitVec 32) (_ BitVec 32) V!40537 V!40537 (_ BitVec 32) Int) ListLongMap!14935)

(assert (=> b!1085800 (= lt!482065 (getCurrentListMap!4172 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482081 () array!69974)

(assert (=> b!1085800 (= lt!482075 (getCurrentListMap!4172 lt!482067 lt!482081 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1085800 (and (= lt!482068 lt!482071) (= lt!482071 lt!482068))))

(assert (=> b!1085800 (= lt!482071 (-!762 lt!482080 k0!904))))

(declare-fun lt!482069 () Unit!35559)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!56 (array!69972 array!69974 (_ BitVec 32) (_ BitVec 32) V!40537 V!40537 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35559)

(assert (=> b!1085800 (= lt!482069 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!56 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4042 (array!69972 array!69974 (_ BitVec 32) (_ BitVec 32) V!40537 V!40537 (_ BitVec 32) Int) ListLongMap!14935)

(assert (=> b!1085800 (= lt!482068 (getCurrentListMapNoExtraKeys!4042 lt!482067 lt!482081 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2113 (Int (_ BitVec 64)) V!40537)

(assert (=> b!1085800 (= lt!482081 (array!69975 (store (arr!33661 _values!874) i!650 (ValueCellFull!12569 (dynLambda!2113 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34199 _values!874)))))

(assert (=> b!1085800 (= lt!482080 (getCurrentListMapNoExtraKeys!4042 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69972 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085800 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!482073 () Unit!35559)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69972 (_ BitVec 64) (_ BitVec 32)) Unit!35559)

(assert (=> b!1085800 (= lt!482073 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1085801 () Bool)

(assert (=> b!1085801 (= e!620254 e!620260)))

(declare-fun res!724009 () Bool)

(assert (=> b!1085801 (=> (not res!724009) (not e!620260))))

(assert (=> b!1085801 (= res!724009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482067 mask!1414))))

(assert (=> b!1085801 (= lt!482067 (array!69973 (store (arr!33660 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34198 _keys!1070)))))

(assert (= (and start!95896 res!724013) b!1085789))

(assert (= (and b!1085789 res!724012) b!1085793))

(assert (= (and b!1085793 res!724004) b!1085799))

(assert (= (and b!1085799 res!724007) b!1085790))

(assert (= (and b!1085790 res!724005) b!1085788))

(assert (= (and b!1085788 res!724014) b!1085797))

(assert (= (and b!1085797 res!724006) b!1085801))

(assert (= (and b!1085801 res!724009) b!1085794))

(assert (= (and b!1085794 res!724010) b!1085800))

(assert (= (and b!1085800 (not res!724008)) b!1085796))

(assert (= (and b!1085796 (not res!724011)) b!1085795))

(assert (= (and b!1085798 condMapEmpty!41590) mapIsEmpty!41590))

(assert (= (and b!1085798 (not condMapEmpty!41590)) mapNonEmpty!41590))

(get-info :version)

(assert (= (and mapNonEmpty!41590 ((_ is ValueCellFull!12569) mapValue!41590)) b!1085792))

(assert (= (and b!1085798 ((_ is ValueCellFull!12569) mapDefault!41590)) b!1085791))

(assert (= start!95896 b!1085798))

(declare-fun b_lambda!17203 () Bool)

(assert (=> (not b_lambda!17203) (not b!1085800)))

(declare-fun t!33140 () Bool)

(declare-fun tb!7425 () Bool)

(assert (=> (and start!95896 (= defaultEntry!882 defaultEntry!882) t!33140) tb!7425))

(declare-fun result!15377 () Bool)

(assert (=> tb!7425 (= result!15377 tp_is_empty!26557)))

(assert (=> b!1085800 t!33140))

(declare-fun b_and!35761 () Bool)

(assert (= b_and!35759 (and (=> t!33140 result!15377) b_and!35761)))

(declare-fun m!1003589 () Bool)

(assert (=> b!1085799 m!1003589))

(declare-fun m!1003591 () Bool)

(assert (=> b!1085794 m!1003591))

(declare-fun m!1003593 () Bool)

(assert (=> b!1085801 m!1003593))

(declare-fun m!1003595 () Bool)

(assert (=> b!1085801 m!1003595))

(declare-fun m!1003597 () Bool)

(assert (=> start!95896 m!1003597))

(declare-fun m!1003599 () Bool)

(assert (=> start!95896 m!1003599))

(declare-fun m!1003601 () Bool)

(assert (=> start!95896 m!1003601))

(declare-fun m!1003603 () Bool)

(assert (=> b!1085800 m!1003603))

(declare-fun m!1003605 () Bool)

(assert (=> b!1085800 m!1003605))

(declare-fun m!1003607 () Bool)

(assert (=> b!1085800 m!1003607))

(declare-fun m!1003609 () Bool)

(assert (=> b!1085800 m!1003609))

(declare-fun m!1003611 () Bool)

(assert (=> b!1085800 m!1003611))

(declare-fun m!1003613 () Bool)

(assert (=> b!1085800 m!1003613))

(declare-fun m!1003615 () Bool)

(assert (=> b!1085800 m!1003615))

(declare-fun m!1003617 () Bool)

(assert (=> b!1085800 m!1003617))

(declare-fun m!1003619 () Bool)

(assert (=> b!1085800 m!1003619))

(declare-fun m!1003621 () Bool)

(assert (=> b!1085800 m!1003621))

(declare-fun m!1003623 () Bool)

(assert (=> mapNonEmpty!41590 m!1003623))

(declare-fun m!1003625 () Bool)

(assert (=> b!1085797 m!1003625))

(declare-fun m!1003627 () Bool)

(assert (=> b!1085796 m!1003627))

(declare-fun m!1003629 () Bool)

(assert (=> b!1085796 m!1003629))

(declare-fun m!1003631 () Bool)

(assert (=> b!1085796 m!1003631))

(declare-fun m!1003633 () Bool)

(assert (=> b!1085796 m!1003633))

(declare-fun m!1003635 () Bool)

(assert (=> b!1085796 m!1003635))

(assert (=> b!1085796 m!1003627))

(declare-fun m!1003637 () Bool)

(assert (=> b!1085796 m!1003637))

(declare-fun m!1003639 () Bool)

(assert (=> b!1085796 m!1003639))

(declare-fun m!1003641 () Bool)

(assert (=> b!1085796 m!1003641))

(declare-fun m!1003643 () Bool)

(assert (=> b!1085788 m!1003643))

(declare-fun m!1003645 () Bool)

(assert (=> b!1085795 m!1003645))

(declare-fun m!1003647 () Bool)

(assert (=> b!1085795 m!1003647))

(declare-fun m!1003649 () Bool)

(assert (=> b!1085795 m!1003649))

(declare-fun m!1003651 () Bool)

(assert (=> b!1085793 m!1003651))

(check-sat b_and!35761 (not b!1085788) (not b!1085794) (not b!1085801) (not b!1085795) (not b_lambda!17203) (not b!1085800) (not start!95896) (not b!1085796) (not b!1085793) (not b_next!22555) (not mapNonEmpty!41590) tp_is_empty!26557 (not b!1085799))
(check-sat b_and!35761 (not b_next!22555))
