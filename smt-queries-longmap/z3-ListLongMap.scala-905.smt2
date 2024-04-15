; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20530 () Bool)

(assert start!20530)

(declare-fun b_free!5185 () Bool)

(declare-fun b_next!5185 () Bool)

(assert (=> start!20530 (= b_free!5185 (not b_next!5185))))

(declare-fun tp!18587 () Bool)

(declare-fun b_and!11905 () Bool)

(assert (=> start!20530 (= tp!18587 b_and!11905)))

(declare-fun b!203820 () Bool)

(declare-fun res!98062 () Bool)

(declare-fun e!133391 () Bool)

(assert (=> b!203820 (=> (not res!98062) (not e!133391))))

(declare-datatypes ((array!9287 0))(
  ( (array!9288 (arr!4393 (Array (_ BitVec 32) (_ BitVec 64))) (size!4719 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9287)

(declare-datatypes ((List!2776 0))(
  ( (Nil!2773) (Cons!2772 (h!3414 (_ BitVec 64)) (t!7698 List!2776)) )
))
(declare-fun arrayNoDuplicates!0 (array!9287 (_ BitVec 32) List!2776) Bool)

(assert (=> b!203820 (= res!98062 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2773))))

(declare-fun b!203821 () Bool)

(declare-fun res!98060 () Bool)

(assert (=> b!203821 (=> (not res!98060) (not e!133391))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!203821 (= res!98060 (= (select (arr!4393 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8630 () Bool)

(declare-fun mapRes!8630 () Bool)

(assert (=> mapIsEmpty!8630 mapRes!8630))

(declare-fun b!203822 () Bool)

(declare-fun e!133395 () Bool)

(declare-fun e!133393 () Bool)

(assert (=> b!203822 (= e!133395 e!133393)))

(declare-fun res!98055 () Bool)

(assert (=> b!203822 (=> res!98055 e!133393)))

(assert (=> b!203822 (= res!98055 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6369 0))(
  ( (V!6370 (val!2565 Int)) )
))
(declare-datatypes ((tuple2!3868 0))(
  ( (tuple2!3869 (_1!1945 (_ BitVec 64)) (_2!1945 V!6369)) )
))
(declare-datatypes ((List!2777 0))(
  ( (Nil!2774) (Cons!2773 (h!3415 tuple2!3868) (t!7699 List!2777)) )
))
(declare-datatypes ((ListLongMap!2771 0))(
  ( (ListLongMap!2772 (toList!1401 List!2777)) )
))
(declare-fun lt!102966 () ListLongMap!2771)

(declare-fun lt!102967 () ListLongMap!2771)

(assert (=> b!203822 (= lt!102966 lt!102967)))

(declare-fun lt!102964 () ListLongMap!2771)

(declare-fun lt!102972 () tuple2!3868)

(declare-fun +!450 (ListLongMap!2771 tuple2!3868) ListLongMap!2771)

(assert (=> b!203822 (= lt!102967 (+!450 lt!102964 lt!102972))))

(declare-fun lt!102974 () ListLongMap!2771)

(declare-fun lt!102965 () ListLongMap!2771)

(assert (=> b!203822 (= lt!102974 lt!102965)))

(declare-fun lt!102973 () ListLongMap!2771)

(assert (=> b!203822 (= lt!102965 (+!450 lt!102973 lt!102972))))

(declare-fun lt!102963 () ListLongMap!2771)

(assert (=> b!203822 (= lt!102966 (+!450 lt!102963 lt!102972))))

(declare-fun zeroValue!615 () V!6369)

(assert (=> b!203822 (= lt!102972 (tuple2!3869 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun res!98059 () Bool)

(assert (=> start!20530 (=> (not res!98059) (not e!133391))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20530 (= res!98059 (validMask!0 mask!1149))))

(assert (=> start!20530 e!133391))

(declare-datatypes ((ValueCell!2177 0))(
  ( (ValueCellFull!2177 (v!4529 V!6369)) (EmptyCell!2177) )
))
(declare-datatypes ((array!9289 0))(
  ( (array!9290 (arr!4394 (Array (_ BitVec 32) ValueCell!2177)) (size!4720 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9289)

(declare-fun e!133392 () Bool)

(declare-fun array_inv!2881 (array!9289) Bool)

(assert (=> start!20530 (and (array_inv!2881 _values!649) e!133392)))

(assert (=> start!20530 true))

(declare-fun tp_is_empty!5041 () Bool)

(assert (=> start!20530 tp_is_empty!5041))

(declare-fun array_inv!2882 (array!9287) Bool)

(assert (=> start!20530 (array_inv!2882 _keys!825)))

(assert (=> start!20530 tp!18587))

(declare-fun b!203823 () Bool)

(declare-fun res!98057 () Bool)

(assert (=> b!203823 (=> (not res!98057) (not e!133391))))

(assert (=> b!203823 (= res!98057 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4719 _keys!825))))))

(declare-fun b!203824 () Bool)

(declare-fun e!133389 () Bool)

(assert (=> b!203824 (= e!133389 tp_is_empty!5041)))

(declare-fun b!203825 () Bool)

(assert (=> b!203825 (= e!133393 true)))

(declare-fun lt!102970 () tuple2!3868)

(assert (=> b!203825 (= lt!102967 (+!450 lt!102965 lt!102970))))

(declare-datatypes ((Unit!6146 0))(
  ( (Unit!6147) )
))
(declare-fun lt!102969 () Unit!6146)

(declare-fun v!520 () V!6369)

(declare-fun addCommutativeForDiffKeys!146 (ListLongMap!2771 (_ BitVec 64) V!6369 (_ BitVec 64) V!6369) Unit!6146)

(assert (=> b!203825 (= lt!102969 (addCommutativeForDiffKeys!146 lt!102973 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203826 () Bool)

(declare-fun res!98061 () Bool)

(assert (=> b!203826 (=> (not res!98061) (not e!133391))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203826 (= res!98061 (and (= (size!4720 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4719 _keys!825) (size!4720 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203827 () Bool)

(assert (=> b!203827 (= e!133392 (and e!133389 mapRes!8630))))

(declare-fun condMapEmpty!8630 () Bool)

(declare-fun mapDefault!8630 () ValueCell!2177)

(assert (=> b!203827 (= condMapEmpty!8630 (= (arr!4394 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2177)) mapDefault!8630)))))

(declare-fun b!203828 () Bool)

(declare-fun res!98056 () Bool)

(assert (=> b!203828 (=> (not res!98056) (not e!133391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203828 (= res!98056 (validKeyInArray!0 k0!843))))

(declare-fun b!203829 () Bool)

(declare-fun res!98058 () Bool)

(assert (=> b!203829 (=> (not res!98058) (not e!133391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9287 (_ BitVec 32)) Bool)

(assert (=> b!203829 (= res!98058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203830 () Bool)

(declare-fun e!133394 () Bool)

(assert (=> b!203830 (= e!133394 tp_is_empty!5041)))

(declare-fun mapNonEmpty!8630 () Bool)

(declare-fun tp!18586 () Bool)

(assert (=> mapNonEmpty!8630 (= mapRes!8630 (and tp!18586 e!133394))))

(declare-fun mapRest!8630 () (Array (_ BitVec 32) ValueCell!2177))

(declare-fun mapKey!8630 () (_ BitVec 32))

(declare-fun mapValue!8630 () ValueCell!2177)

(assert (=> mapNonEmpty!8630 (= (arr!4394 _values!649) (store mapRest!8630 mapKey!8630 mapValue!8630))))

(declare-fun b!203831 () Bool)

(assert (=> b!203831 (= e!133391 (not e!133395))))

(declare-fun res!98063 () Bool)

(assert (=> b!203831 (=> res!98063 e!133395)))

(assert (=> b!203831 (= res!98063 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6369)

(declare-fun getCurrentListMap!951 (array!9287 array!9289 (_ BitVec 32) (_ BitVec 32) V!6369 V!6369 (_ BitVec 32) Int) ListLongMap!2771)

(assert (=> b!203831 (= lt!102974 (getCurrentListMap!951 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102971 () array!9289)

(assert (=> b!203831 (= lt!102966 (getCurrentListMap!951 _keys!825 lt!102971 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203831 (and (= lt!102963 lt!102964) (= lt!102964 lt!102963))))

(assert (=> b!203831 (= lt!102964 (+!450 lt!102973 lt!102970))))

(assert (=> b!203831 (= lt!102970 (tuple2!3869 k0!843 v!520))))

(declare-fun lt!102968 () Unit!6146)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!110 (array!9287 array!9289 (_ BitVec 32) (_ BitVec 32) V!6369 V!6369 (_ BitVec 32) (_ BitVec 64) V!6369 (_ BitVec 32) Int) Unit!6146)

(assert (=> b!203831 (= lt!102968 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!110 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!361 (array!9287 array!9289 (_ BitVec 32) (_ BitVec 32) V!6369 V!6369 (_ BitVec 32) Int) ListLongMap!2771)

(assert (=> b!203831 (= lt!102963 (getCurrentListMapNoExtraKeys!361 _keys!825 lt!102971 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203831 (= lt!102971 (array!9290 (store (arr!4394 _values!649) i!601 (ValueCellFull!2177 v!520)) (size!4720 _values!649)))))

(assert (=> b!203831 (= lt!102973 (getCurrentListMapNoExtraKeys!361 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20530 res!98059) b!203826))

(assert (= (and b!203826 res!98061) b!203829))

(assert (= (and b!203829 res!98058) b!203820))

(assert (= (and b!203820 res!98062) b!203823))

(assert (= (and b!203823 res!98057) b!203828))

(assert (= (and b!203828 res!98056) b!203821))

(assert (= (and b!203821 res!98060) b!203831))

(assert (= (and b!203831 (not res!98063)) b!203822))

(assert (= (and b!203822 (not res!98055)) b!203825))

(assert (= (and b!203827 condMapEmpty!8630) mapIsEmpty!8630))

(assert (= (and b!203827 (not condMapEmpty!8630)) mapNonEmpty!8630))

(get-info :version)

(assert (= (and mapNonEmpty!8630 ((_ is ValueCellFull!2177) mapValue!8630)) b!203830))

(assert (= (and b!203827 ((_ is ValueCellFull!2177) mapDefault!8630)) b!203824))

(assert (= start!20530 b!203827))

(declare-fun m!230835 () Bool)

(assert (=> mapNonEmpty!8630 m!230835))

(declare-fun m!230837 () Bool)

(assert (=> b!203825 m!230837))

(declare-fun m!230839 () Bool)

(assert (=> b!203825 m!230839))

(declare-fun m!230841 () Bool)

(assert (=> b!203829 m!230841))

(declare-fun m!230843 () Bool)

(assert (=> b!203821 m!230843))

(declare-fun m!230845 () Bool)

(assert (=> b!203820 m!230845))

(declare-fun m!230847 () Bool)

(assert (=> start!20530 m!230847))

(declare-fun m!230849 () Bool)

(assert (=> start!20530 m!230849))

(declare-fun m!230851 () Bool)

(assert (=> start!20530 m!230851))

(declare-fun m!230853 () Bool)

(assert (=> b!203828 m!230853))

(declare-fun m!230855 () Bool)

(assert (=> b!203822 m!230855))

(declare-fun m!230857 () Bool)

(assert (=> b!203822 m!230857))

(declare-fun m!230859 () Bool)

(assert (=> b!203822 m!230859))

(declare-fun m!230861 () Bool)

(assert (=> b!203831 m!230861))

(declare-fun m!230863 () Bool)

(assert (=> b!203831 m!230863))

(declare-fun m!230865 () Bool)

(assert (=> b!203831 m!230865))

(declare-fun m!230867 () Bool)

(assert (=> b!203831 m!230867))

(declare-fun m!230869 () Bool)

(assert (=> b!203831 m!230869))

(declare-fun m!230871 () Bool)

(assert (=> b!203831 m!230871))

(declare-fun m!230873 () Bool)

(assert (=> b!203831 m!230873))

(check-sat tp_is_empty!5041 (not b!203822) (not b!203828) (not b!203820) (not b!203829) b_and!11905 (not mapNonEmpty!8630) (not b_next!5185) (not b!203831) (not start!20530) (not b!203825))
(check-sat b_and!11905 (not b_next!5185))
