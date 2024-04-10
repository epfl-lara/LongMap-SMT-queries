; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96024 () Bool)

(assert start!96024)

(declare-fun b_free!22677 () Bool)

(declare-fun b_next!22677 () Bool)

(assert (=> start!96024 (= b_free!22677 (not b_next!22677))))

(declare-fun tp!79879 () Bool)

(declare-fun b_and!36029 () Bool)

(assert (=> start!96024 (= tp!79879 b_and!36029)))

(declare-fun b!1088634 () Bool)

(declare-fun e!621818 () Bool)

(declare-fun e!621817 () Bool)

(declare-fun mapRes!41773 () Bool)

(assert (=> b!1088634 (= e!621818 (and e!621817 mapRes!41773))))

(declare-fun condMapEmpty!41773 () Bool)

(declare-datatypes ((V!40699 0))(
  ( (V!40700 (val!13396 Int)) )
))
(declare-datatypes ((ValueCell!12630 0))(
  ( (ValueCellFull!12630 (v!16017 V!40699)) (EmptyCell!12630) )
))
(declare-datatypes ((array!70283 0))(
  ( (array!70284 (arr!33815 (Array (_ BitVec 32) ValueCell!12630)) (size!34351 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70283)

(declare-fun mapDefault!41773 () ValueCell!12630)

(assert (=> b!1088634 (= condMapEmpty!41773 (= (arr!33815 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12630)) mapDefault!41773)))))

(declare-fun b!1088635 () Bool)

(declare-fun res!726103 () Bool)

(declare-fun e!621816 () Bool)

(assert (=> b!1088635 (=> (not res!726103) (not e!621816))))

(declare-datatypes ((array!70285 0))(
  ( (array!70286 (arr!33816 (Array (_ BitVec 32) (_ BitVec 64))) (size!34352 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70285)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088635 (= res!726103 (= (select (arr!33816 _keys!1070) i!650) k0!904))))

(declare-fun b!1088636 () Bool)

(declare-fun res!726105 () Bool)

(assert (=> b!1088636 (=> (not res!726105) (not e!621816))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088636 (= res!726105 (validKeyInArray!0 k0!904))))

(declare-fun b!1088638 () Bool)

(declare-fun res!726098 () Bool)

(assert (=> b!1088638 (=> (not res!726098) (not e!621816))))

(assert (=> b!1088638 (= res!726098 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34352 _keys!1070))))))

(declare-fun b!1088639 () Bool)

(declare-fun e!621812 () Bool)

(assert (=> b!1088639 (= e!621816 e!621812)))

(declare-fun res!726095 () Bool)

(assert (=> b!1088639 (=> (not res!726095) (not e!621812))))

(declare-fun lt!484981 () array!70285)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70285 (_ BitVec 32)) Bool)

(assert (=> b!1088639 (= res!726095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484981 mask!1414))))

(assert (=> b!1088639 (= lt!484981 (array!70286 (store (arr!33816 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34352 _keys!1070)))))

(declare-fun mapIsEmpty!41773 () Bool)

(assert (=> mapIsEmpty!41773 mapRes!41773))

(declare-fun b!1088640 () Bool)

(declare-fun res!726102 () Bool)

(assert (=> b!1088640 (=> (not res!726102) (not e!621816))))

(declare-datatypes ((List!23596 0))(
  ( (Nil!23593) (Cons!23592 (h!24801 (_ BitVec 64)) (t!33331 List!23596)) )
))
(declare-fun arrayNoDuplicates!0 (array!70285 (_ BitVec 32) List!23596) Bool)

(assert (=> b!1088640 (= res!726102 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23593))))

(declare-fun mapNonEmpty!41773 () Bool)

(declare-fun tp!79880 () Bool)

(declare-fun e!621813 () Bool)

(assert (=> mapNonEmpty!41773 (= mapRes!41773 (and tp!79880 e!621813))))

(declare-fun mapKey!41773 () (_ BitVec 32))

(declare-fun mapRest!41773 () (Array (_ BitVec 32) ValueCell!12630))

(declare-fun mapValue!41773 () ValueCell!12630)

(assert (=> mapNonEmpty!41773 (= (arr!33815 _values!874) (store mapRest!41773 mapKey!41773 mapValue!41773))))

(declare-fun b!1088641 () Bool)

(declare-fun tp_is_empty!26679 () Bool)

(assert (=> b!1088641 (= e!621813 tp_is_empty!26679)))

(declare-fun b!1088642 () Bool)

(declare-fun res!726097 () Bool)

(assert (=> b!1088642 (=> (not res!726097) (not e!621812))))

(assert (=> b!1088642 (= res!726097 (arrayNoDuplicates!0 lt!484981 #b00000000000000000000000000000000 Nil!23593))))

(declare-fun b!1088643 () Bool)

(declare-fun res!726096 () Bool)

(assert (=> b!1088643 (=> (not res!726096) (not e!621816))))

(assert (=> b!1088643 (= res!726096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088644 () Bool)

(assert (=> b!1088644 (= e!621817 tp_is_empty!26679)))

(declare-fun b!1088645 () Bool)

(declare-fun res!726101 () Bool)

(assert (=> b!1088645 (=> (not res!726101) (not e!621816))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088645 (= res!726101 (and (= (size!34351 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34352 _keys!1070) (size!34351 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088646 () Bool)

(declare-fun e!621811 () Bool)

(assert (=> b!1088646 (= e!621811 true)))

(declare-datatypes ((tuple2!17008 0))(
  ( (tuple2!17009 (_1!8515 (_ BitVec 64)) (_2!8515 V!40699)) )
))
(declare-datatypes ((List!23597 0))(
  ( (Nil!23594) (Cons!23593 (h!24802 tuple2!17008) (t!33332 List!23597)) )
))
(declare-datatypes ((ListLongMap!14977 0))(
  ( (ListLongMap!14978 (toList!7504 List!23597)) )
))
(declare-fun lt!484978 () ListLongMap!14977)

(declare-fun lt!484970 () ListLongMap!14977)

(declare-fun -!829 (ListLongMap!14977 (_ BitVec 64)) ListLongMap!14977)

(assert (=> b!1088646 (= (-!829 lt!484978 k0!904) lt!484970)))

(declare-datatypes ((Unit!35824 0))(
  ( (Unit!35825) )
))
(declare-fun lt!484977 () Unit!35824)

(declare-fun lt!484976 () ListLongMap!14977)

(declare-fun zeroValue!831 () V!40699)

(declare-fun addRemoveCommutativeForDiffKeys!58 (ListLongMap!14977 (_ BitVec 64) V!40699 (_ BitVec 64)) Unit!35824)

(assert (=> b!1088646 (= lt!484977 (addRemoveCommutativeForDiffKeys!58 lt!484976 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1088647 () Bool)

(declare-fun e!621815 () Bool)

(assert (=> b!1088647 (= e!621815 e!621811)))

(declare-fun res!726104 () Bool)

(assert (=> b!1088647 (=> res!726104 e!621811)))

(assert (=> b!1088647 (= res!726104 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!484973 () ListLongMap!14977)

(assert (=> b!1088647 (= lt!484973 lt!484970)))

(declare-fun lt!484979 () ListLongMap!14977)

(declare-fun lt!484974 () tuple2!17008)

(declare-fun +!3303 (ListLongMap!14977 tuple2!17008) ListLongMap!14977)

(assert (=> b!1088647 (= lt!484970 (+!3303 lt!484979 lt!484974))))

(declare-fun lt!484975 () ListLongMap!14977)

(assert (=> b!1088647 (= lt!484975 lt!484978)))

(assert (=> b!1088647 (= lt!484978 (+!3303 lt!484976 lt!484974))))

(declare-fun lt!484972 () ListLongMap!14977)

(assert (=> b!1088647 (= lt!484973 (+!3303 lt!484972 lt!484974))))

(assert (=> b!1088647 (= lt!484974 (tuple2!17009 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088637 () Bool)

(assert (=> b!1088637 (= e!621812 (not e!621815))))

(declare-fun res!726100 () Bool)

(assert (=> b!1088637 (=> res!726100 e!621815)))

(assert (=> b!1088637 (= res!726100 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40699)

(declare-fun getCurrentListMap!4277 (array!70285 array!70283 (_ BitVec 32) (_ BitVec 32) V!40699 V!40699 (_ BitVec 32) Int) ListLongMap!14977)

(assert (=> b!1088637 (= lt!484975 (getCurrentListMap!4277 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484971 () array!70283)

(assert (=> b!1088637 (= lt!484973 (getCurrentListMap!4277 lt!484981 lt!484971 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1088637 (and (= lt!484972 lt!484979) (= lt!484979 lt!484972))))

(assert (=> b!1088637 (= lt!484979 (-!829 lt!484976 k0!904))))

(declare-fun lt!484969 () Unit!35824)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!96 (array!70285 array!70283 (_ BitVec 32) (_ BitVec 32) V!40699 V!40699 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35824)

(assert (=> b!1088637 (= lt!484969 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!96 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4037 (array!70285 array!70283 (_ BitVec 32) (_ BitVec 32) V!40699 V!40699 (_ BitVec 32) Int) ListLongMap!14977)

(assert (=> b!1088637 (= lt!484972 (getCurrentListMapNoExtraKeys!4037 lt!484981 lt!484971 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2174 (Int (_ BitVec 64)) V!40699)

(assert (=> b!1088637 (= lt!484971 (array!70284 (store (arr!33815 _values!874) i!650 (ValueCellFull!12630 (dynLambda!2174 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34351 _values!874)))))

(assert (=> b!1088637 (= lt!484976 (getCurrentListMapNoExtraKeys!4037 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088637 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484980 () Unit!35824)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70285 (_ BitVec 64) (_ BitVec 32)) Unit!35824)

(assert (=> b!1088637 (= lt!484980 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!726099 () Bool)

(assert (=> start!96024 (=> (not res!726099) (not e!621816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96024 (= res!726099 (validMask!0 mask!1414))))

(assert (=> start!96024 e!621816))

(assert (=> start!96024 tp!79879))

(assert (=> start!96024 true))

(assert (=> start!96024 tp_is_empty!26679))

(declare-fun array_inv!26078 (array!70285) Bool)

(assert (=> start!96024 (array_inv!26078 _keys!1070)))

(declare-fun array_inv!26079 (array!70283) Bool)

(assert (=> start!96024 (and (array_inv!26079 _values!874) e!621818)))

(assert (= (and start!96024 res!726099) b!1088645))

(assert (= (and b!1088645 res!726101) b!1088643))

(assert (= (and b!1088643 res!726096) b!1088640))

(assert (= (and b!1088640 res!726102) b!1088638))

(assert (= (and b!1088638 res!726098) b!1088636))

(assert (= (and b!1088636 res!726105) b!1088635))

(assert (= (and b!1088635 res!726103) b!1088639))

(assert (= (and b!1088639 res!726095) b!1088642))

(assert (= (and b!1088642 res!726097) b!1088637))

(assert (= (and b!1088637 (not res!726100)) b!1088647))

(assert (= (and b!1088647 (not res!726104)) b!1088646))

(assert (= (and b!1088634 condMapEmpty!41773) mapIsEmpty!41773))

(assert (= (and b!1088634 (not condMapEmpty!41773)) mapNonEmpty!41773))

(get-info :version)

(assert (= (and mapNonEmpty!41773 ((_ is ValueCellFull!12630) mapValue!41773)) b!1088641))

(assert (= (and b!1088634 ((_ is ValueCellFull!12630) mapDefault!41773)) b!1088644))

(assert (= start!96024 b!1088634))

(declare-fun b_lambda!17347 () Bool)

(assert (=> (not b_lambda!17347) (not b!1088637)))

(declare-fun t!33330 () Bool)

(declare-fun tb!7555 () Bool)

(assert (=> (and start!96024 (= defaultEntry!882 defaultEntry!882) t!33330) tb!7555))

(declare-fun result!15629 () Bool)

(assert (=> tb!7555 (= result!15629 tp_is_empty!26679)))

(assert (=> b!1088637 t!33330))

(declare-fun b_and!36031 () Bool)

(assert (= b_and!36029 (and (=> t!33330 result!15629) b_and!36031)))

(declare-fun m!1007735 () Bool)

(assert (=> b!1088636 m!1007735))

(declare-fun m!1007737 () Bool)

(assert (=> start!96024 m!1007737))

(declare-fun m!1007739 () Bool)

(assert (=> start!96024 m!1007739))

(declare-fun m!1007741 () Bool)

(assert (=> start!96024 m!1007741))

(declare-fun m!1007743 () Bool)

(assert (=> b!1088642 m!1007743))

(declare-fun m!1007745 () Bool)

(assert (=> mapNonEmpty!41773 m!1007745))

(declare-fun m!1007747 () Bool)

(assert (=> b!1088646 m!1007747))

(declare-fun m!1007749 () Bool)

(assert (=> b!1088646 m!1007749))

(declare-fun m!1007751 () Bool)

(assert (=> b!1088647 m!1007751))

(declare-fun m!1007753 () Bool)

(assert (=> b!1088647 m!1007753))

(declare-fun m!1007755 () Bool)

(assert (=> b!1088647 m!1007755))

(declare-fun m!1007757 () Bool)

(assert (=> b!1088635 m!1007757))

(declare-fun m!1007759 () Bool)

(assert (=> b!1088643 m!1007759))

(declare-fun m!1007761 () Bool)

(assert (=> b!1088639 m!1007761))

(declare-fun m!1007763 () Bool)

(assert (=> b!1088639 m!1007763))

(declare-fun m!1007765 () Bool)

(assert (=> b!1088637 m!1007765))

(declare-fun m!1007767 () Bool)

(assert (=> b!1088637 m!1007767))

(declare-fun m!1007769 () Bool)

(assert (=> b!1088637 m!1007769))

(declare-fun m!1007771 () Bool)

(assert (=> b!1088637 m!1007771))

(declare-fun m!1007773 () Bool)

(assert (=> b!1088637 m!1007773))

(declare-fun m!1007775 () Bool)

(assert (=> b!1088637 m!1007775))

(declare-fun m!1007777 () Bool)

(assert (=> b!1088637 m!1007777))

(declare-fun m!1007779 () Bool)

(assert (=> b!1088637 m!1007779))

(declare-fun m!1007781 () Bool)

(assert (=> b!1088637 m!1007781))

(declare-fun m!1007783 () Bool)

(assert (=> b!1088637 m!1007783))

(declare-fun m!1007785 () Bool)

(assert (=> b!1088640 m!1007785))

(check-sat (not b!1088637) b_and!36031 (not b!1088646) (not b!1088640) (not b!1088639) (not b!1088636) (not b_next!22677) (not b!1088647) tp_is_empty!26679 (not b!1088642) (not b!1088643) (not mapNonEmpty!41773) (not start!96024) (not b_lambda!17347))
(check-sat b_and!36031 (not b_next!22677))
