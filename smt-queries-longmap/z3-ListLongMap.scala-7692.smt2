; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96544 () Bool)

(assert start!96544)

(declare-fun b_free!23077 () Bool)

(declare-fun b_next!23077 () Bool)

(assert (=> start!96544 (= b_free!23077 (not b_next!23077))))

(declare-fun tp!81163 () Bool)

(declare-fun b_and!36819 () Bool)

(assert (=> start!96544 (= tp!81163 b_and!36819)))

(declare-fun b!1097819 () Bool)

(declare-fun res!732692 () Bool)

(declare-fun e!626576 () Bool)

(assert (=> b!1097819 (=> (not res!732692) (not e!626576))))

(declare-datatypes ((array!71074 0))(
  ( (array!71075 (arr!34207 (Array (_ BitVec 32) (_ BitVec 64))) (size!34745 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71074)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1097819 (= res!732692 (= (select (arr!34207 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!42457 () Bool)

(declare-fun mapRes!42457 () Bool)

(assert (=> mapIsEmpty!42457 mapRes!42457))

(declare-fun b!1097820 () Bool)

(declare-fun res!732701 () Bool)

(assert (=> b!1097820 (=> (not res!732701) (not e!626576))))

(declare-datatypes ((List!23956 0))(
  ( (Nil!23953) (Cons!23952 (h!25161 (_ BitVec 64)) (t!34070 List!23956)) )
))
(declare-fun arrayNoDuplicates!0 (array!71074 (_ BitVec 32) List!23956) Bool)

(assert (=> b!1097820 (= res!732701 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23953))))

(declare-fun b!1097821 () Bool)

(declare-fun res!732693 () Bool)

(assert (=> b!1097821 (=> (not res!732693) (not e!626576))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71074 (_ BitVec 32)) Bool)

(assert (=> b!1097821 (= res!732693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1097822 () Bool)

(declare-fun res!732702 () Bool)

(assert (=> b!1097822 (=> (not res!732702) (not e!626576))))

(assert (=> b!1097822 (= res!732702 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34745 _keys!1070))))))

(declare-datatypes ((V!41297 0))(
  ( (V!41298 (val!13620 Int)) )
))
(declare-datatypes ((tuple2!17362 0))(
  ( (tuple2!17363 (_1!8692 (_ BitVec 64)) (_2!8692 V!41297)) )
))
(declare-fun lt!490795 () tuple2!17362)

(declare-datatypes ((List!23957 0))(
  ( (Nil!23954) (Cons!23953 (h!25162 tuple2!17362) (t!34071 List!23957)) )
))
(declare-datatypes ((ListLongMap!15331 0))(
  ( (ListLongMap!15332 (toList!7681 List!23957)) )
))
(declare-fun lt!490798 () ListLongMap!15331)

(declare-fun e!626579 () Bool)

(declare-fun b!1097823 () Bool)

(declare-fun lt!490789 () tuple2!17362)

(declare-fun lt!490796 () ListLongMap!15331)

(declare-fun +!3393 (ListLongMap!15331 tuple2!17362) ListLongMap!15331)

(assert (=> b!1097823 (= e!626579 (= lt!490798 (+!3393 (+!3393 lt!490796 lt!490789) lt!490795)))))

(declare-fun e!626582 () Bool)

(assert (=> b!1097823 e!626582))

(declare-fun res!732695 () Bool)

(assert (=> b!1097823 (=> (not res!732695) (not e!626582))))

(declare-fun lt!490790 () ListLongMap!15331)

(assert (=> b!1097823 (= res!732695 (= lt!490798 (+!3393 (+!3393 lt!490790 lt!490789) lt!490795)))))

(declare-fun minValue!831 () V!41297)

(assert (=> b!1097823 (= lt!490795 (tuple2!17363 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun zeroValue!831 () V!41297)

(assert (=> b!1097823 (= lt!490789 (tuple2!17363 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun lt!490793 () ListLongMap!15331)

(declare-fun lt!490792 () ListLongMap!15331)

(declare-fun b!1097824 () Bool)

(assert (=> b!1097824 (= e!626582 (= lt!490792 (+!3393 (+!3393 lt!490793 lt!490789) lt!490795)))))

(declare-fun res!732698 () Bool)

(assert (=> start!96544 (=> (not res!732698) (not e!626576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96544 (= res!732698 (validMask!0 mask!1414))))

(assert (=> start!96544 e!626576))

(assert (=> start!96544 tp!81163))

(assert (=> start!96544 true))

(declare-fun tp_is_empty!27127 () Bool)

(assert (=> start!96544 tp_is_empty!27127))

(declare-fun array_inv!26388 (array!71074) Bool)

(assert (=> start!96544 (array_inv!26388 _keys!1070)))

(declare-datatypes ((ValueCell!12854 0))(
  ( (ValueCellFull!12854 (v!16242 V!41297)) (EmptyCell!12854) )
))
(declare-datatypes ((array!71076 0))(
  ( (array!71077 (arr!34208 (Array (_ BitVec 32) ValueCell!12854)) (size!34746 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71076)

(declare-fun e!626575 () Bool)

(declare-fun array_inv!26389 (array!71076) Bool)

(assert (=> start!96544 (and (array_inv!26389 _values!874) e!626575)))

(declare-fun b!1097825 () Bool)

(declare-fun res!732697 () Bool)

(declare-fun e!626580 () Bool)

(assert (=> b!1097825 (=> (not res!732697) (not e!626580))))

(declare-fun lt!490794 () array!71074)

(assert (=> b!1097825 (= res!732697 (arrayNoDuplicates!0 lt!490794 #b00000000000000000000000000000000 Nil!23953))))

(declare-fun b!1097826 () Bool)

(declare-fun res!732694 () Bool)

(assert (=> b!1097826 (=> (not res!732694) (not e!626576))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1097826 (= res!732694 (validKeyInArray!0 k0!904))))

(declare-fun b!1097827 () Bool)

(declare-fun res!732700 () Bool)

(assert (=> b!1097827 (=> (not res!732700) (not e!626576))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1097827 (= res!732700 (and (= (size!34746 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34745 _keys!1070) (size!34746 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1097828 () Bool)

(declare-fun e!626577 () Bool)

(assert (=> b!1097828 (= e!626575 (and e!626577 mapRes!42457))))

(declare-fun condMapEmpty!42457 () Bool)

(declare-fun mapDefault!42457 () ValueCell!12854)

(assert (=> b!1097828 (= condMapEmpty!42457 (= (arr!34208 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12854)) mapDefault!42457)))))

(declare-fun b!1097829 () Bool)

(declare-fun e!626581 () Bool)

(assert (=> b!1097829 (= e!626581 tp_is_empty!27127)))

(declare-fun mapNonEmpty!42457 () Bool)

(declare-fun tp!81164 () Bool)

(assert (=> mapNonEmpty!42457 (= mapRes!42457 (and tp!81164 e!626581))))

(declare-fun mapKey!42457 () (_ BitVec 32))

(declare-fun mapValue!42457 () ValueCell!12854)

(declare-fun mapRest!42457 () (Array (_ BitVec 32) ValueCell!12854))

(assert (=> mapNonEmpty!42457 (= (arr!34208 _values!874) (store mapRest!42457 mapKey!42457 mapValue!42457))))

(declare-fun b!1097830 () Bool)

(assert (=> b!1097830 (= e!626577 tp_is_empty!27127)))

(declare-fun b!1097831 () Bool)

(assert (=> b!1097831 (= e!626576 e!626580)))

(declare-fun res!732699 () Bool)

(assert (=> b!1097831 (=> (not res!732699) (not e!626580))))

(assert (=> b!1097831 (= res!732699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490794 mask!1414))))

(assert (=> b!1097831 (= lt!490794 (array!71075 (store (arr!34207 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34745 _keys!1070)))))

(declare-fun b!1097832 () Bool)

(assert (=> b!1097832 (= e!626580 (not e!626579))))

(declare-fun res!732696 () Bool)

(assert (=> b!1097832 (=> res!732696 e!626579)))

(assert (=> b!1097832 (= res!732696 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4306 (array!71074 array!71076 (_ BitVec 32) (_ BitVec 32) V!41297 V!41297 (_ BitVec 32) Int) ListLongMap!15331)

(assert (=> b!1097832 (= lt!490792 (getCurrentListMap!4306 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490791 () array!71076)

(assert (=> b!1097832 (= lt!490798 (getCurrentListMap!4306 lt!490794 lt!490791 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1097832 (and (= lt!490790 lt!490796) (= lt!490796 lt!490790))))

(declare-fun -!920 (ListLongMap!15331 (_ BitVec 64)) ListLongMap!15331)

(assert (=> b!1097832 (= lt!490796 (-!920 lt!490793 k0!904))))

(declare-datatypes ((Unit!35951 0))(
  ( (Unit!35952) )
))
(declare-fun lt!490788 () Unit!35951)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!195 (array!71074 array!71076 (_ BitVec 32) (_ BitVec 32) V!41297 V!41297 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35951)

(assert (=> b!1097832 (= lt!490788 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!195 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4213 (array!71074 array!71076 (_ BitVec 32) (_ BitVec 32) V!41297 V!41297 (_ BitVec 32) Int) ListLongMap!15331)

(assert (=> b!1097832 (= lt!490790 (getCurrentListMapNoExtraKeys!4213 lt!490794 lt!490791 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2282 (Int (_ BitVec 64)) V!41297)

(assert (=> b!1097832 (= lt!490791 (array!71077 (store (arr!34208 _values!874) i!650 (ValueCellFull!12854 (dynLambda!2282 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34746 _values!874)))))

(assert (=> b!1097832 (= lt!490793 (getCurrentListMapNoExtraKeys!4213 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71074 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097832 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!490797 () Unit!35951)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71074 (_ BitVec 64) (_ BitVec 32)) Unit!35951)

(assert (=> b!1097832 (= lt!490797 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!96544 res!732698) b!1097827))

(assert (= (and b!1097827 res!732700) b!1097821))

(assert (= (and b!1097821 res!732693) b!1097820))

(assert (= (and b!1097820 res!732701) b!1097822))

(assert (= (and b!1097822 res!732702) b!1097826))

(assert (= (and b!1097826 res!732694) b!1097819))

(assert (= (and b!1097819 res!732692) b!1097831))

(assert (= (and b!1097831 res!732699) b!1097825))

(assert (= (and b!1097825 res!732697) b!1097832))

(assert (= (and b!1097832 (not res!732696)) b!1097823))

(assert (= (and b!1097823 res!732695) b!1097824))

(assert (= (and b!1097828 condMapEmpty!42457) mapIsEmpty!42457))

(assert (= (and b!1097828 (not condMapEmpty!42457)) mapNonEmpty!42457))

(get-info :version)

(assert (= (and mapNonEmpty!42457 ((_ is ValueCellFull!12854) mapValue!42457)) b!1097829))

(assert (= (and b!1097828 ((_ is ValueCellFull!12854) mapDefault!42457)) b!1097830))

(assert (= start!96544 b!1097828))

(declare-fun b_lambda!17773 () Bool)

(assert (=> (not b_lambda!17773) (not b!1097832)))

(declare-fun t!34069 () Bool)

(declare-fun tb!7935 () Bool)

(assert (=> (and start!96544 (= defaultEntry!882 defaultEntry!882) t!34069) tb!7935))

(declare-fun result!16405 () Bool)

(assert (=> tb!7935 (= result!16405 tp_is_empty!27127)))

(assert (=> b!1097832 t!34069))

(declare-fun b_and!36821 () Bool)

(assert (= b_and!36819 (and (=> t!34069 result!16405) b_and!36821)))

(declare-fun m!1016905 () Bool)

(assert (=> b!1097823 m!1016905))

(assert (=> b!1097823 m!1016905))

(declare-fun m!1016907 () Bool)

(assert (=> b!1097823 m!1016907))

(declare-fun m!1016909 () Bool)

(assert (=> b!1097823 m!1016909))

(assert (=> b!1097823 m!1016909))

(declare-fun m!1016911 () Bool)

(assert (=> b!1097823 m!1016911))

(declare-fun m!1016913 () Bool)

(assert (=> b!1097826 m!1016913))

(declare-fun m!1016915 () Bool)

(assert (=> b!1097831 m!1016915))

(declare-fun m!1016917 () Bool)

(assert (=> b!1097831 m!1016917))

(declare-fun m!1016919 () Bool)

(assert (=> b!1097821 m!1016919))

(declare-fun m!1016921 () Bool)

(assert (=> b!1097825 m!1016921))

(declare-fun m!1016923 () Bool)

(assert (=> b!1097824 m!1016923))

(assert (=> b!1097824 m!1016923))

(declare-fun m!1016925 () Bool)

(assert (=> b!1097824 m!1016925))

(declare-fun m!1016927 () Bool)

(assert (=> start!96544 m!1016927))

(declare-fun m!1016929 () Bool)

(assert (=> start!96544 m!1016929))

(declare-fun m!1016931 () Bool)

(assert (=> start!96544 m!1016931))

(declare-fun m!1016933 () Bool)

(assert (=> b!1097832 m!1016933))

(declare-fun m!1016935 () Bool)

(assert (=> b!1097832 m!1016935))

(declare-fun m!1016937 () Bool)

(assert (=> b!1097832 m!1016937))

(declare-fun m!1016939 () Bool)

(assert (=> b!1097832 m!1016939))

(declare-fun m!1016941 () Bool)

(assert (=> b!1097832 m!1016941))

(declare-fun m!1016943 () Bool)

(assert (=> b!1097832 m!1016943))

(declare-fun m!1016945 () Bool)

(assert (=> b!1097832 m!1016945))

(declare-fun m!1016947 () Bool)

(assert (=> b!1097832 m!1016947))

(declare-fun m!1016949 () Bool)

(assert (=> b!1097832 m!1016949))

(declare-fun m!1016951 () Bool)

(assert (=> b!1097832 m!1016951))

(declare-fun m!1016953 () Bool)

(assert (=> b!1097820 m!1016953))

(declare-fun m!1016955 () Bool)

(assert (=> mapNonEmpty!42457 m!1016955))

(declare-fun m!1016957 () Bool)

(assert (=> b!1097819 m!1016957))

(check-sat (not b!1097820) b_and!36821 (not b!1097826) (not b_next!23077) (not b!1097825) (not mapNonEmpty!42457) (not b_lambda!17773) (not b!1097831) tp_is_empty!27127 (not b!1097824) (not b!1097821) (not b!1097823) (not start!96544) (not b!1097832))
(check-sat b_and!36821 (not b_next!23077))
