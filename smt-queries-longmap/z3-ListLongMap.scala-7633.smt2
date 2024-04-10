; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96120 () Bool)

(assert start!96120)

(declare-fun b_free!22773 () Bool)

(declare-fun b_next!22773 () Bool)

(assert (=> start!96120 (= b_free!22773 (not b_next!22773))))

(declare-fun tp!80168 () Bool)

(declare-fun b_and!36221 () Bool)

(assert (=> start!96120 (= tp!80168 b_and!36221)))

(declare-fun b!1090756 () Bool)

(declare-fun res!727695 () Bool)

(declare-fun e!622966 () Bool)

(assert (=> b!1090756 (=> (not res!727695) (not e!622966))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70471 0))(
  ( (array!70472 (arr!33909 (Array (_ BitVec 32) (_ BitVec 64))) (size!34445 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70471)

(assert (=> b!1090756 (= res!727695 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34445 _keys!1070))))))

(declare-fun mapIsEmpty!41917 () Bool)

(declare-fun mapRes!41917 () Bool)

(assert (=> mapIsEmpty!41917 mapRes!41917))

(declare-fun b!1090757 () Bool)

(declare-fun res!727694 () Bool)

(assert (=> b!1090757 (=> (not res!727694) (not e!622966))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090757 (= res!727694 (validKeyInArray!0 k0!904))))

(declare-fun b!1090758 () Bool)

(declare-fun e!622965 () Bool)

(assert (=> b!1090758 (= e!622966 e!622965)))

(declare-fun res!727691 () Bool)

(assert (=> b!1090758 (=> (not res!727691) (not e!622965))))

(declare-fun lt!486818 () array!70471)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70471 (_ BitVec 32)) Bool)

(assert (=> b!1090758 (= res!727691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486818 mask!1414))))

(assert (=> b!1090758 (= lt!486818 (array!70472 (store (arr!33909 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34445 _keys!1070)))))

(declare-fun b!1090759 () Bool)

(declare-fun e!622969 () Bool)

(declare-fun e!622970 () Bool)

(assert (=> b!1090759 (= e!622969 e!622970)))

(declare-fun res!727696 () Bool)

(assert (=> b!1090759 (=> res!727696 e!622970)))

(assert (=> b!1090759 (= res!727696 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!40827 0))(
  ( (V!40828 (val!13444 Int)) )
))
(declare-datatypes ((tuple2!17092 0))(
  ( (tuple2!17093 (_1!8557 (_ BitVec 64)) (_2!8557 V!40827)) )
))
(declare-datatypes ((List!23679 0))(
  ( (Nil!23676) (Cons!23675 (h!24884 tuple2!17092) (t!33510 List!23679)) )
))
(declare-datatypes ((ListLongMap!15061 0))(
  ( (ListLongMap!15062 (toList!7546 List!23679)) )
))
(declare-fun lt!486815 () ListLongMap!15061)

(declare-fun lt!486817 () ListLongMap!15061)

(assert (=> b!1090759 (= lt!486815 lt!486817)))

(declare-fun lt!486816 () ListLongMap!15061)

(declare-fun lt!486821 () tuple2!17092)

(declare-fun +!3334 (ListLongMap!15061 tuple2!17092) ListLongMap!15061)

(assert (=> b!1090759 (= lt!486817 (+!3334 lt!486816 lt!486821))))

(declare-fun lt!486824 () ListLongMap!15061)

(declare-fun lt!486823 () ListLongMap!15061)

(assert (=> b!1090759 (= lt!486824 lt!486823)))

(declare-fun lt!486826 () ListLongMap!15061)

(assert (=> b!1090759 (= lt!486823 (+!3334 lt!486826 lt!486821))))

(declare-fun lt!486825 () ListLongMap!15061)

(assert (=> b!1090759 (= lt!486824 (+!3334 lt!486825 lt!486821))))

(declare-fun minValue!831 () V!40827)

(assert (=> b!1090759 (= lt!486821 (tuple2!17093 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1090760 () Bool)

(declare-fun res!727688 () Bool)

(assert (=> b!1090760 (=> (not res!727688) (not e!622966))))

(declare-datatypes ((List!23680 0))(
  ( (Nil!23677) (Cons!23676 (h!24885 (_ BitVec 64)) (t!33511 List!23680)) )
))
(declare-fun arrayNoDuplicates!0 (array!70471 (_ BitVec 32) List!23680) Bool)

(assert (=> b!1090760 (= res!727688 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23677))))

(declare-fun b!1090761 () Bool)

(assert (=> b!1090761 (= e!622965 (not e!622969))))

(declare-fun res!727698 () Bool)

(assert (=> b!1090761 (=> res!727698 e!622969)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1090761 (= res!727698 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40827)

(declare-datatypes ((ValueCell!12678 0))(
  ( (ValueCellFull!12678 (v!16065 V!40827)) (EmptyCell!12678) )
))
(declare-datatypes ((array!70473 0))(
  ( (array!70474 (arr!33910 (Array (_ BitVec 32) ValueCell!12678)) (size!34446 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70473)

(declare-fun getCurrentListMap!4311 (array!70471 array!70473 (_ BitVec 32) (_ BitVec 32) V!40827 V!40827 (_ BitVec 32) Int) ListLongMap!15061)

(assert (=> b!1090761 (= lt!486815 (getCurrentListMap!4311 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486822 () array!70473)

(assert (=> b!1090761 (= lt!486824 (getCurrentListMap!4311 lt!486818 lt!486822 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1090761 (and (= lt!486825 lt!486826) (= lt!486826 lt!486825))))

(declare-fun -!869 (ListLongMap!15061 (_ BitVec 64)) ListLongMap!15061)

(assert (=> b!1090761 (= lt!486826 (-!869 lt!486816 k0!904))))

(declare-datatypes ((Unit!35904 0))(
  ( (Unit!35905) )
))
(declare-fun lt!486819 () Unit!35904)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!130 (array!70471 array!70473 (_ BitVec 32) (_ BitVec 32) V!40827 V!40827 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35904)

(assert (=> b!1090761 (= lt!486819 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!130 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4071 (array!70471 array!70473 (_ BitVec 32) (_ BitVec 32) V!40827 V!40827 (_ BitVec 32) Int) ListLongMap!15061)

(assert (=> b!1090761 (= lt!486825 (getCurrentListMapNoExtraKeys!4071 lt!486818 lt!486822 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2208 (Int (_ BitVec 64)) V!40827)

(assert (=> b!1090761 (= lt!486822 (array!70474 (store (arr!33910 _values!874) i!650 (ValueCellFull!12678 (dynLambda!2208 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34446 _values!874)))))

(assert (=> b!1090761 (= lt!486816 (getCurrentListMapNoExtraKeys!4071 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090761 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486820 () Unit!35904)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70471 (_ BitVec 64) (_ BitVec 32)) Unit!35904)

(assert (=> b!1090761 (= lt!486820 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1090762 () Bool)

(declare-fun e!622967 () Bool)

(declare-fun tp_is_empty!26775 () Bool)

(assert (=> b!1090762 (= e!622967 tp_is_empty!26775)))

(declare-fun mapNonEmpty!41917 () Bool)

(declare-fun tp!80167 () Bool)

(assert (=> mapNonEmpty!41917 (= mapRes!41917 (and tp!80167 e!622967))))

(declare-fun mapKey!41917 () (_ BitVec 32))

(declare-fun mapRest!41917 () (Array (_ BitVec 32) ValueCell!12678))

(declare-fun mapValue!41917 () ValueCell!12678)

(assert (=> mapNonEmpty!41917 (= (arr!33910 _values!874) (store mapRest!41917 mapKey!41917 mapValue!41917))))

(declare-fun b!1090763 () Bool)

(declare-fun res!727689 () Bool)

(assert (=> b!1090763 (=> (not res!727689) (not e!622966))))

(assert (=> b!1090763 (= res!727689 (= (select (arr!33909 _keys!1070) i!650) k0!904))))

(declare-fun b!1090764 () Bool)

(declare-fun res!727697 () Bool)

(assert (=> b!1090764 (=> (not res!727697) (not e!622966))))

(assert (=> b!1090764 (= res!727697 (and (= (size!34446 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34445 _keys!1070) (size!34446 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!727692 () Bool)

(assert (=> start!96120 (=> (not res!727692) (not e!622966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96120 (= res!727692 (validMask!0 mask!1414))))

(assert (=> start!96120 e!622966))

(assert (=> start!96120 tp!80168))

(assert (=> start!96120 true))

(assert (=> start!96120 tp_is_empty!26775))

(declare-fun array_inv!26148 (array!70471) Bool)

(assert (=> start!96120 (array_inv!26148 _keys!1070)))

(declare-fun e!622963 () Bool)

(declare-fun array_inv!26149 (array!70473) Bool)

(assert (=> start!96120 (and (array_inv!26149 _values!874) e!622963)))

(declare-fun b!1090755 () Bool)

(declare-fun e!622968 () Bool)

(assert (=> b!1090755 (= e!622968 tp_is_empty!26775)))

(declare-fun b!1090765 () Bool)

(declare-fun res!727690 () Bool)

(assert (=> b!1090765 (=> (not res!727690) (not e!622966))))

(assert (=> b!1090765 (= res!727690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090766 () Bool)

(assert (=> b!1090766 (= e!622963 (and e!622968 mapRes!41917))))

(declare-fun condMapEmpty!41917 () Bool)

(declare-fun mapDefault!41917 () ValueCell!12678)

(assert (=> b!1090766 (= condMapEmpty!41917 (= (arr!33910 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12678)) mapDefault!41917)))))

(declare-fun b!1090767 () Bool)

(assert (=> b!1090767 (= e!622970 true)))

(assert (=> b!1090767 (= (-!869 lt!486817 k0!904) lt!486823)))

(declare-fun lt!486814 () Unit!35904)

(declare-fun addRemoveCommutativeForDiffKeys!93 (ListLongMap!15061 (_ BitVec 64) V!40827 (_ BitVec 64)) Unit!35904)

(assert (=> b!1090767 (= lt!486814 (addRemoveCommutativeForDiffKeys!93 lt!486816 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1090768 () Bool)

(declare-fun res!727693 () Bool)

(assert (=> b!1090768 (=> (not res!727693) (not e!622965))))

(assert (=> b!1090768 (= res!727693 (arrayNoDuplicates!0 lt!486818 #b00000000000000000000000000000000 Nil!23677))))

(assert (= (and start!96120 res!727692) b!1090764))

(assert (= (and b!1090764 res!727697) b!1090765))

(assert (= (and b!1090765 res!727690) b!1090760))

(assert (= (and b!1090760 res!727688) b!1090756))

(assert (= (and b!1090756 res!727695) b!1090757))

(assert (= (and b!1090757 res!727694) b!1090763))

(assert (= (and b!1090763 res!727689) b!1090758))

(assert (= (and b!1090758 res!727691) b!1090768))

(assert (= (and b!1090768 res!727693) b!1090761))

(assert (= (and b!1090761 (not res!727698)) b!1090759))

(assert (= (and b!1090759 (not res!727696)) b!1090767))

(assert (= (and b!1090766 condMapEmpty!41917) mapIsEmpty!41917))

(assert (= (and b!1090766 (not condMapEmpty!41917)) mapNonEmpty!41917))

(get-info :version)

(assert (= (and mapNonEmpty!41917 ((_ is ValueCellFull!12678) mapValue!41917)) b!1090762))

(assert (= (and b!1090766 ((_ is ValueCellFull!12678) mapDefault!41917)) b!1090755))

(assert (= start!96120 b!1090766))

(declare-fun b_lambda!17443 () Bool)

(assert (=> (not b_lambda!17443) (not b!1090761)))

(declare-fun t!33509 () Bool)

(declare-fun tb!7651 () Bool)

(assert (=> (and start!96120 (= defaultEntry!882 defaultEntry!882) t!33509) tb!7651))

(declare-fun result!15821 () Bool)

(assert (=> tb!7651 (= result!15821 tp_is_empty!26775)))

(assert (=> b!1090761 t!33509))

(declare-fun b_and!36223 () Bool)

(assert (= b_and!36221 (and (=> t!33509 result!15821) b_and!36223)))

(declare-fun m!1010219 () Bool)

(assert (=> b!1090757 m!1010219))

(declare-fun m!1010221 () Bool)

(assert (=> start!96120 m!1010221))

(declare-fun m!1010223 () Bool)

(assert (=> start!96120 m!1010223))

(declare-fun m!1010225 () Bool)

(assert (=> start!96120 m!1010225))

(declare-fun m!1010227 () Bool)

(assert (=> b!1090767 m!1010227))

(declare-fun m!1010229 () Bool)

(assert (=> b!1090767 m!1010229))

(declare-fun m!1010231 () Bool)

(assert (=> b!1090768 m!1010231))

(declare-fun m!1010233 () Bool)

(assert (=> mapNonEmpty!41917 m!1010233))

(declare-fun m!1010235 () Bool)

(assert (=> b!1090763 m!1010235))

(declare-fun m!1010237 () Bool)

(assert (=> b!1090761 m!1010237))

(declare-fun m!1010239 () Bool)

(assert (=> b!1090761 m!1010239))

(declare-fun m!1010241 () Bool)

(assert (=> b!1090761 m!1010241))

(declare-fun m!1010243 () Bool)

(assert (=> b!1090761 m!1010243))

(declare-fun m!1010245 () Bool)

(assert (=> b!1090761 m!1010245))

(declare-fun m!1010247 () Bool)

(assert (=> b!1090761 m!1010247))

(declare-fun m!1010249 () Bool)

(assert (=> b!1090761 m!1010249))

(declare-fun m!1010251 () Bool)

(assert (=> b!1090761 m!1010251))

(declare-fun m!1010253 () Bool)

(assert (=> b!1090761 m!1010253))

(declare-fun m!1010255 () Bool)

(assert (=> b!1090761 m!1010255))

(declare-fun m!1010257 () Bool)

(assert (=> b!1090760 m!1010257))

(declare-fun m!1010259 () Bool)

(assert (=> b!1090765 m!1010259))

(declare-fun m!1010261 () Bool)

(assert (=> b!1090759 m!1010261))

(declare-fun m!1010263 () Bool)

(assert (=> b!1090759 m!1010263))

(declare-fun m!1010265 () Bool)

(assert (=> b!1090759 m!1010265))

(declare-fun m!1010267 () Bool)

(assert (=> b!1090758 m!1010267))

(declare-fun m!1010269 () Bool)

(assert (=> b!1090758 m!1010269))

(check-sat (not b!1090759) (not start!96120) b_and!36223 (not b!1090767) (not b_lambda!17443) (not mapNonEmpty!41917) (not b!1090768) (not b_next!22773) (not b!1090760) (not b!1090765) (not b!1090761) (not b!1090758) tp_is_empty!26775 (not b!1090757))
(check-sat b_and!36223 (not b_next!22773))
