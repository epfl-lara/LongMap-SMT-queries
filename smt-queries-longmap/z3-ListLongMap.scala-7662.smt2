; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96528 () Bool)

(assert start!96528)

(declare-fun b_free!22945 () Bool)

(declare-fun b_next!22945 () Bool)

(assert (=> start!96528 (= b_free!22945 (not b_next!22945))))

(declare-fun tp!80684 () Bool)

(declare-fun b_and!36575 () Bool)

(assert (=> start!96528 (= tp!80684 b_and!36575)))

(declare-fun mapIsEmpty!42175 () Bool)

(declare-fun mapRes!42175 () Bool)

(assert (=> mapIsEmpty!42175 mapRes!42175))

(declare-fun res!730742 () Bool)

(declare-fun e!625574 () Bool)

(assert (=> start!96528 (=> (not res!730742) (not e!625574))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96528 (= res!730742 (validMask!0 mask!1414))))

(assert (=> start!96528 e!625574))

(assert (=> start!96528 tp!80684))

(assert (=> start!96528 true))

(declare-fun tp_is_empty!26947 () Bool)

(assert (=> start!96528 tp_is_empty!26947))

(declare-datatypes ((array!70839 0))(
  ( (array!70840 (arr!34087 (Array (_ BitVec 32) (_ BitVec 64))) (size!34624 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70839)

(declare-fun array_inv!26308 (array!70839) Bool)

(assert (=> start!96528 (array_inv!26308 _keys!1070)))

(declare-datatypes ((V!41057 0))(
  ( (V!41058 (val!13530 Int)) )
))
(declare-datatypes ((ValueCell!12764 0))(
  ( (ValueCellFull!12764 (v!16147 V!41057)) (EmptyCell!12764) )
))
(declare-datatypes ((array!70841 0))(
  ( (array!70842 (arr!34088 (Array (_ BitVec 32) ValueCell!12764)) (size!34625 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70841)

(declare-fun e!625573 () Bool)

(declare-fun array_inv!26309 (array!70841) Bool)

(assert (=> start!96528 (and (array_inv!26309 _values!874) e!625573)))

(declare-fun mapNonEmpty!42175 () Bool)

(declare-fun tp!80683 () Bool)

(declare-fun e!625575 () Bool)

(assert (=> mapNonEmpty!42175 (= mapRes!42175 (and tp!80683 e!625575))))

(declare-fun mapValue!42175 () ValueCell!12764)

(declare-fun mapKey!42175 () (_ BitVec 32))

(declare-fun mapRest!42175 () (Array (_ BitVec 32) ValueCell!12764))

(assert (=> mapNonEmpty!42175 (= (arr!34088 _values!874) (store mapRest!42175 mapKey!42175 mapValue!42175))))

(declare-fun b!1095556 () Bool)

(declare-fun res!730743 () Bool)

(assert (=> b!1095556 (=> (not res!730743) (not e!625574))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095556 (= res!730743 (= (select (arr!34087 _keys!1070) i!650) k0!904))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17222 0))(
  ( (tuple2!17223 (_1!8622 (_ BitVec 64)) (_2!8622 V!41057)) )
))
(declare-datatypes ((List!23821 0))(
  ( (Nil!23818) (Cons!23817 (h!25035 tuple2!17222) (t!33816 List!23821)) )
))
(declare-datatypes ((ListLongMap!15199 0))(
  ( (ListLongMap!15200 (toList!7615 List!23821)) )
))
(declare-fun lt!490082 () ListLongMap!15199)

(declare-fun lt!490079 () ListLongMap!15199)

(declare-fun e!625572 () Bool)

(declare-fun lt!490078 () Bool)

(declare-fun b!1095557 () Bool)

(assert (=> b!1095557 (= e!625572 (not (or (and (not lt!490078) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!490078) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!490078) (not (= lt!490082 lt!490079)) (bvsle #b00000000000000000000000000000000 (size!34624 _keys!1070)))))))

(assert (=> b!1095557 (= lt!490078 (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!882 () Int)

(declare-fun lt!490080 () ListLongMap!15199)

(declare-fun minValue!831 () V!41057)

(declare-fun zeroValue!831 () V!41057)

(declare-fun getCurrentListMap!4363 (array!70839 array!70841 (_ BitVec 32) (_ BitVec 32) V!41057 V!41057 (_ BitVec 32) Int) ListLongMap!15199)

(assert (=> b!1095557 (= lt!490080 (getCurrentListMap!4363 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490075 () array!70841)

(declare-fun lt!490074 () array!70839)

(assert (=> b!1095557 (= lt!490082 (getCurrentListMap!4363 lt!490074 lt!490075 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490076 () ListLongMap!15199)

(assert (=> b!1095557 (and (= lt!490079 lt!490076) (= lt!490076 lt!490079))))

(declare-fun lt!490081 () ListLongMap!15199)

(declare-fun -!920 (ListLongMap!15199 (_ BitVec 64)) ListLongMap!15199)

(assert (=> b!1095557 (= lt!490076 (-!920 lt!490081 k0!904))))

(declare-datatypes ((Unit!36007 0))(
  ( (Unit!36008) )
))
(declare-fun lt!490077 () Unit!36007)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!192 (array!70839 array!70841 (_ BitVec 32) (_ BitVec 32) V!41057 V!41057 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36007)

(assert (=> b!1095557 (= lt!490077 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!192 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4168 (array!70839 array!70841 (_ BitVec 32) (_ BitVec 32) V!41057 V!41057 (_ BitVec 32) Int) ListLongMap!15199)

(assert (=> b!1095557 (= lt!490079 (getCurrentListMapNoExtraKeys!4168 lt!490074 lt!490075 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2289 (Int (_ BitVec 64)) V!41057)

(assert (=> b!1095557 (= lt!490075 (array!70842 (store (arr!34088 _values!874) i!650 (ValueCellFull!12764 (dynLambda!2289 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34625 _values!874)))))

(assert (=> b!1095557 (= lt!490081 (getCurrentListMapNoExtraKeys!4168 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095557 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!490083 () Unit!36007)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70839 (_ BitVec 64) (_ BitVec 32)) Unit!36007)

(assert (=> b!1095557 (= lt!490083 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1095558 () Bool)

(declare-fun e!625576 () Bool)

(assert (=> b!1095558 (= e!625576 tp_is_empty!26947)))

(declare-fun b!1095559 () Bool)

(assert (=> b!1095559 (= e!625575 tp_is_empty!26947)))

(declare-fun b!1095560 () Bool)

(declare-fun res!730739 () Bool)

(assert (=> b!1095560 (=> (not res!730739) (not e!625574))))

(assert (=> b!1095560 (= res!730739 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34624 _keys!1070))))))

(declare-fun b!1095561 () Bool)

(declare-fun res!730741 () Bool)

(assert (=> b!1095561 (=> (not res!730741) (not e!625574))))

(declare-datatypes ((List!23822 0))(
  ( (Nil!23819) (Cons!23818 (h!25036 (_ BitVec 64)) (t!33817 List!23822)) )
))
(declare-fun arrayNoDuplicates!0 (array!70839 (_ BitVec 32) List!23822) Bool)

(assert (=> b!1095561 (= res!730741 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23819))))

(declare-fun b!1095562 () Bool)

(declare-fun res!730746 () Bool)

(assert (=> b!1095562 (=> (not res!730746) (not e!625574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70839 (_ BitVec 32)) Bool)

(assert (=> b!1095562 (= res!730746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095563 () Bool)

(declare-fun res!730740 () Bool)

(assert (=> b!1095563 (=> (not res!730740) (not e!625572))))

(assert (=> b!1095563 (= res!730740 (arrayNoDuplicates!0 lt!490074 #b00000000000000000000000000000000 Nil!23819))))

(declare-fun b!1095564 () Bool)

(assert (=> b!1095564 (= e!625574 e!625572)))

(declare-fun res!730744 () Bool)

(assert (=> b!1095564 (=> (not res!730744) (not e!625572))))

(assert (=> b!1095564 (= res!730744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490074 mask!1414))))

(assert (=> b!1095564 (= lt!490074 (array!70840 (store (arr!34087 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34624 _keys!1070)))))

(declare-fun b!1095565 () Bool)

(assert (=> b!1095565 (= e!625573 (and e!625576 mapRes!42175))))

(declare-fun condMapEmpty!42175 () Bool)

(declare-fun mapDefault!42175 () ValueCell!12764)

(assert (=> b!1095565 (= condMapEmpty!42175 (= (arr!34088 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12764)) mapDefault!42175)))))

(declare-fun b!1095566 () Bool)

(declare-fun res!730745 () Bool)

(assert (=> b!1095566 (=> (not res!730745) (not e!625574))))

(assert (=> b!1095566 (= res!730745 (and (= (size!34625 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34624 _keys!1070) (size!34625 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095567 () Bool)

(declare-fun res!730738 () Bool)

(assert (=> b!1095567 (=> (not res!730738) (not e!625574))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095567 (= res!730738 (validKeyInArray!0 k0!904))))

(assert (= (and start!96528 res!730742) b!1095566))

(assert (= (and b!1095566 res!730745) b!1095562))

(assert (= (and b!1095562 res!730746) b!1095561))

(assert (= (and b!1095561 res!730741) b!1095560))

(assert (= (and b!1095560 res!730739) b!1095567))

(assert (= (and b!1095567 res!730738) b!1095556))

(assert (= (and b!1095556 res!730743) b!1095564))

(assert (= (and b!1095564 res!730744) b!1095563))

(assert (= (and b!1095563 res!730740) b!1095557))

(assert (= (and b!1095565 condMapEmpty!42175) mapIsEmpty!42175))

(assert (= (and b!1095565 (not condMapEmpty!42175)) mapNonEmpty!42175))

(get-info :version)

(assert (= (and mapNonEmpty!42175 ((_ is ValueCellFull!12764) mapValue!42175)) b!1095559))

(assert (= (and b!1095565 ((_ is ValueCellFull!12764) mapDefault!42175)) b!1095558))

(assert (= start!96528 b!1095565))

(declare-fun b_lambda!17625 () Bool)

(assert (=> (not b_lambda!17625) (not b!1095557)))

(declare-fun t!33815 () Bool)

(declare-fun tb!7815 () Bool)

(assert (=> (and start!96528 (= defaultEntry!882 defaultEntry!882) t!33815) tb!7815))

(declare-fun result!16157 () Bool)

(assert (=> tb!7815 (= result!16157 tp_is_empty!26947)))

(assert (=> b!1095557 t!33815))

(declare-fun b_and!36577 () Bool)

(assert (= b_and!36575 (and (=> t!33815 result!16157) b_and!36577)))

(declare-fun m!1015853 () Bool)

(assert (=> b!1095562 m!1015853))

(declare-fun m!1015855 () Bool)

(assert (=> b!1095561 m!1015855))

(declare-fun m!1015857 () Bool)

(assert (=> b!1095557 m!1015857))

(declare-fun m!1015859 () Bool)

(assert (=> b!1095557 m!1015859))

(declare-fun m!1015861 () Bool)

(assert (=> b!1095557 m!1015861))

(declare-fun m!1015863 () Bool)

(assert (=> b!1095557 m!1015863))

(declare-fun m!1015865 () Bool)

(assert (=> b!1095557 m!1015865))

(declare-fun m!1015867 () Bool)

(assert (=> b!1095557 m!1015867))

(declare-fun m!1015869 () Bool)

(assert (=> b!1095557 m!1015869))

(declare-fun m!1015871 () Bool)

(assert (=> b!1095557 m!1015871))

(declare-fun m!1015873 () Bool)

(assert (=> b!1095557 m!1015873))

(declare-fun m!1015875 () Bool)

(assert (=> b!1095557 m!1015875))

(declare-fun m!1015877 () Bool)

(assert (=> b!1095563 m!1015877))

(declare-fun m!1015879 () Bool)

(assert (=> b!1095564 m!1015879))

(declare-fun m!1015881 () Bool)

(assert (=> b!1095564 m!1015881))

(declare-fun m!1015883 () Bool)

(assert (=> mapNonEmpty!42175 m!1015883))

(declare-fun m!1015885 () Bool)

(assert (=> b!1095556 m!1015885))

(declare-fun m!1015887 () Bool)

(assert (=> b!1095567 m!1015887))

(declare-fun m!1015889 () Bool)

(assert (=> start!96528 m!1015889))

(declare-fun m!1015891 () Bool)

(assert (=> start!96528 m!1015891))

(declare-fun m!1015893 () Bool)

(assert (=> start!96528 m!1015893))

(check-sat (not b!1095567) (not start!96528) (not b!1095563) (not b_next!22945) (not b!1095562) (not b!1095564) (not b!1095561) (not b_lambda!17625) b_and!36577 tp_is_empty!26947 (not mapNonEmpty!42175) (not b!1095557))
(check-sat b_and!36577 (not b_next!22945))
