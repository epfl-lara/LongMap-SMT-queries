; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96824 () Bool)

(assert start!96824)

(declare-fun b_free!23089 () Bool)

(declare-fun b_next!23089 () Bool)

(assert (=> start!96824 (= b_free!23089 (not b_next!23089))))

(declare-fun tp!81203 () Bool)

(declare-fun b_and!36893 () Bool)

(assert (=> start!96824 (= tp!81203 b_and!36893)))

(declare-fun b!1099777 () Bool)

(declare-fun e!627801 () Bool)

(declare-fun tp_is_empty!27139 () Bool)

(assert (=> b!1099777 (= e!627801 tp_is_empty!27139)))

(declare-fun b!1099778 () Bool)

(declare-fun res!733588 () Bool)

(declare-fun e!627803 () Bool)

(assert (=> b!1099778 (=> (not res!733588) (not e!627803))))

(declare-datatypes ((array!71225 0))(
  ( (array!71226 (arr!34275 (Array (_ BitVec 32) (_ BitVec 64))) (size!34812 (_ BitVec 32))) )
))
(declare-fun lt!491879 () array!71225)

(declare-datatypes ((List!23944 0))(
  ( (Nil!23941) (Cons!23940 (h!25158 (_ BitVec 64)) (t!34071 List!23944)) )
))
(declare-fun arrayNoDuplicates!0 (array!71225 (_ BitVec 32) List!23944) Bool)

(assert (=> b!1099778 (= res!733588 (arrayNoDuplicates!0 lt!491879 #b00000000000000000000000000000000 Nil!23941))))

(declare-fun b!1099779 () Bool)

(declare-fun e!627799 () Bool)

(assert (=> b!1099779 (= e!627803 (not e!627799))))

(declare-fun res!733585 () Bool)

(assert (=> b!1099779 (=> res!733585 e!627799)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1099779 (= res!733585 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((V!41313 0))(
  ( (V!41314 (val!13626 Int)) )
))
(declare-fun zeroValue!831 () V!41313)

(declare-fun _keys!1070 () array!71225)

(declare-datatypes ((ValueCell!12860 0))(
  ( (ValueCellFull!12860 (v!16246 V!41313)) (EmptyCell!12860) )
))
(declare-datatypes ((array!71227 0))(
  ( (array!71228 (arr!34276 (Array (_ BitVec 32) ValueCell!12860)) (size!34813 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71227)

(declare-datatypes ((tuple2!17322 0))(
  ( (tuple2!17323 (_1!8672 (_ BitVec 64)) (_2!8672 V!41313)) )
))
(declare-datatypes ((List!23945 0))(
  ( (Nil!23942) (Cons!23941 (h!25159 tuple2!17322) (t!34072 List!23945)) )
))
(declare-datatypes ((ListLongMap!15299 0))(
  ( (ListLongMap!15300 (toList!7665 List!23945)) )
))
(declare-fun lt!491876 () ListLongMap!15299)

(declare-fun minValue!831 () V!41313)

(declare-fun getCurrentListMap!4375 (array!71225 array!71227 (_ BitVec 32) (_ BitVec 32) V!41313 V!41313 (_ BitVec 32) Int) ListLongMap!15299)

(assert (=> b!1099779 (= lt!491876 (getCurrentListMap!4375 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491877 () array!71227)

(declare-fun lt!491883 () ListLongMap!15299)

(assert (=> b!1099779 (= lt!491883 (getCurrentListMap!4375 lt!491879 lt!491877 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491888 () ListLongMap!15299)

(declare-fun lt!491886 () ListLongMap!15299)

(assert (=> b!1099779 (and (= lt!491888 lt!491886) (= lt!491886 lt!491888))))

(declare-fun lt!491881 () ListLongMap!15299)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!937 (ListLongMap!15299 (_ BitVec 64)) ListLongMap!15299)

(assert (=> b!1099779 (= lt!491886 (-!937 lt!491881 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36119 0))(
  ( (Unit!36120) )
))
(declare-fun lt!491885 () Unit!36119)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!209 (array!71225 array!71227 (_ BitVec 32) (_ BitVec 32) V!41313 V!41313 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36119)

(assert (=> b!1099779 (= lt!491885 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4216 (array!71225 array!71227 (_ BitVec 32) (_ BitVec 32) V!41313 V!41313 (_ BitVec 32) Int) ListLongMap!15299)

(assert (=> b!1099779 (= lt!491888 (getCurrentListMapNoExtraKeys!4216 lt!491879 lt!491877 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2334 (Int (_ BitVec 64)) V!41313)

(assert (=> b!1099779 (= lt!491877 (array!71228 (store (arr!34276 _values!874) i!650 (ValueCellFull!12860 (dynLambda!2334 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34813 _values!874)))))

(assert (=> b!1099779 (= lt!491881 (getCurrentListMapNoExtraKeys!4216 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1099779 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!491887 () Unit!36119)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71225 (_ BitVec 64) (_ BitVec 32)) Unit!36119)

(assert (=> b!1099779 (= lt!491887 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!42478 () Bool)

(declare-fun mapRes!42478 () Bool)

(assert (=> mapIsEmpty!42478 mapRes!42478))

(declare-fun b!1099780 () Bool)

(declare-fun res!733592 () Bool)

(declare-fun e!627802 () Bool)

(assert (=> b!1099780 (=> (not res!733592) (not e!627802))))

(assert (=> b!1099780 (= res!733592 (= (select (arr!34275 _keys!1070) i!650) k0!904))))

(declare-fun res!733594 () Bool)

(assert (=> start!96824 (=> (not res!733594) (not e!627802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96824 (= res!733594 (validMask!0 mask!1414))))

(assert (=> start!96824 e!627802))

(assert (=> start!96824 tp!81203))

(assert (=> start!96824 true))

(assert (=> start!96824 tp_is_empty!27139))

(declare-fun array_inv!26428 (array!71225) Bool)

(assert (=> start!96824 (array_inv!26428 _keys!1070)))

(declare-fun e!627800 () Bool)

(declare-fun array_inv!26429 (array!71227) Bool)

(assert (=> start!96824 (and (array_inv!26429 _values!874) e!627800)))

(declare-fun b!1099781 () Bool)

(declare-fun res!733590 () Bool)

(assert (=> b!1099781 (=> (not res!733590) (not e!627802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71225 (_ BitVec 32)) Bool)

(assert (=> b!1099781 (= res!733590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1099782 () Bool)

(assert (=> b!1099782 (= e!627802 e!627803)))

(declare-fun res!733587 () Bool)

(assert (=> b!1099782 (=> (not res!733587) (not e!627803))))

(assert (=> b!1099782 (= res!733587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491879 mask!1414))))

(assert (=> b!1099782 (= lt!491879 (array!71226 (store (arr!34275 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34812 _keys!1070)))))

(declare-fun b!1099783 () Bool)

(assert (=> b!1099783 (= e!627800 (and e!627801 mapRes!42478))))

(declare-fun condMapEmpty!42478 () Bool)

(declare-fun mapDefault!42478 () ValueCell!12860)

(assert (=> b!1099783 (= condMapEmpty!42478 (= (arr!34276 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12860)) mapDefault!42478)))))

(declare-fun b!1099784 () Bool)

(declare-fun res!733593 () Bool)

(assert (=> b!1099784 (=> (not res!733593) (not e!627802))))

(assert (=> b!1099784 (= res!733593 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34812 _keys!1070))))))

(declare-fun b!1099785 () Bool)

(declare-fun res!733591 () Bool)

(assert (=> b!1099785 (=> (not res!733591) (not e!627802))))

(assert (=> b!1099785 (= res!733591 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23941))))

(declare-fun b!1099786 () Bool)

(assert (=> b!1099786 (= e!627799 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904)))))

(declare-fun lt!491878 () ListLongMap!15299)

(declare-fun lt!491882 () ListLongMap!15299)

(assert (=> b!1099786 (= (-!937 lt!491878 k0!904) lt!491882)))

(declare-fun lt!491880 () Unit!36119)

(declare-fun addRemoveCommutativeForDiffKeys!116 (ListLongMap!15299 (_ BitVec 64) V!41313 (_ BitVec 64)) Unit!36119)

(assert (=> b!1099786 (= lt!491880 (addRemoveCommutativeForDiffKeys!116 lt!491881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!491884 () tuple2!17322)

(declare-fun +!3399 (ListLongMap!15299 tuple2!17322) ListLongMap!15299)

(assert (=> b!1099786 (= lt!491883 (+!3399 lt!491882 lt!491884))))

(declare-fun lt!491889 () tuple2!17322)

(assert (=> b!1099786 (= lt!491882 (+!3399 lt!491886 lt!491889))))

(assert (=> b!1099786 (= lt!491876 (+!3399 lt!491878 lt!491884))))

(assert (=> b!1099786 (= lt!491878 (+!3399 lt!491881 lt!491889))))

(assert (=> b!1099786 (= lt!491883 (+!3399 (+!3399 lt!491888 lt!491889) lt!491884))))

(assert (=> b!1099786 (= lt!491884 (tuple2!17323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1099786 (= lt!491889 (tuple2!17323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1099787 () Bool)

(declare-fun res!733586 () Bool)

(assert (=> b!1099787 (=> (not res!733586) (not e!627802))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1099787 (= res!733586 (validKeyInArray!0 k0!904))))

(declare-fun b!1099788 () Bool)

(declare-fun res!733589 () Bool)

(assert (=> b!1099788 (=> (not res!733589) (not e!627802))))

(assert (=> b!1099788 (= res!733589 (and (= (size!34813 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34812 _keys!1070) (size!34813 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1099789 () Bool)

(declare-fun e!627804 () Bool)

(assert (=> b!1099789 (= e!627804 tp_is_empty!27139)))

(declare-fun mapNonEmpty!42478 () Bool)

(declare-fun tp!81202 () Bool)

(assert (=> mapNonEmpty!42478 (= mapRes!42478 (and tp!81202 e!627804))))

(declare-fun mapRest!42478 () (Array (_ BitVec 32) ValueCell!12860))

(declare-fun mapKey!42478 () (_ BitVec 32))

(declare-fun mapValue!42478 () ValueCell!12860)

(assert (=> mapNonEmpty!42478 (= (arr!34276 _values!874) (store mapRest!42478 mapKey!42478 mapValue!42478))))

(assert (= (and start!96824 res!733594) b!1099788))

(assert (= (and b!1099788 res!733589) b!1099781))

(assert (= (and b!1099781 res!733590) b!1099785))

(assert (= (and b!1099785 res!733591) b!1099784))

(assert (= (and b!1099784 res!733593) b!1099787))

(assert (= (and b!1099787 res!733586) b!1099780))

(assert (= (and b!1099780 res!733592) b!1099782))

(assert (= (and b!1099782 res!733587) b!1099778))

(assert (= (and b!1099778 res!733588) b!1099779))

(assert (= (and b!1099779 (not res!733585)) b!1099786))

(assert (= (and b!1099783 condMapEmpty!42478) mapIsEmpty!42478))

(assert (= (and b!1099783 (not condMapEmpty!42478)) mapNonEmpty!42478))

(get-info :version)

(assert (= (and mapNonEmpty!42478 ((_ is ValueCellFull!12860) mapValue!42478)) b!1099789))

(assert (= (and b!1099783 ((_ is ValueCellFull!12860) mapDefault!42478)) b!1099777))

(assert (= start!96824 b!1099783))

(declare-fun b_lambda!17847 () Bool)

(assert (=> (not b_lambda!17847) (not b!1099779)))

(declare-fun t!34070 () Bool)

(declare-fun tb!7947 () Bool)

(assert (=> (and start!96824 (= defaultEntry!882 defaultEntry!882) t!34070) tb!7947))

(declare-fun result!16431 () Bool)

(assert (=> tb!7947 (= result!16431 tp_is_empty!27139)))

(assert (=> b!1099779 t!34070))

(declare-fun b_and!36895 () Bool)

(assert (= b_and!36893 (and (=> t!34070 result!16431) b_and!36895)))

(declare-fun m!1019787 () Bool)

(assert (=> b!1099779 m!1019787))

(declare-fun m!1019789 () Bool)

(assert (=> b!1099779 m!1019789))

(declare-fun m!1019791 () Bool)

(assert (=> b!1099779 m!1019791))

(declare-fun m!1019793 () Bool)

(assert (=> b!1099779 m!1019793))

(declare-fun m!1019795 () Bool)

(assert (=> b!1099779 m!1019795))

(declare-fun m!1019797 () Bool)

(assert (=> b!1099779 m!1019797))

(declare-fun m!1019799 () Bool)

(assert (=> b!1099779 m!1019799))

(declare-fun m!1019801 () Bool)

(assert (=> b!1099779 m!1019801))

(declare-fun m!1019803 () Bool)

(assert (=> b!1099779 m!1019803))

(declare-fun m!1019805 () Bool)

(assert (=> b!1099779 m!1019805))

(declare-fun m!1019807 () Bool)

(assert (=> b!1099785 m!1019807))

(declare-fun m!1019809 () Bool)

(assert (=> b!1099786 m!1019809))

(declare-fun m!1019811 () Bool)

(assert (=> b!1099786 m!1019811))

(declare-fun m!1019813 () Bool)

(assert (=> b!1099786 m!1019813))

(declare-fun m!1019815 () Bool)

(assert (=> b!1099786 m!1019815))

(declare-fun m!1019817 () Bool)

(assert (=> b!1099786 m!1019817))

(declare-fun m!1019819 () Bool)

(assert (=> b!1099786 m!1019819))

(declare-fun m!1019821 () Bool)

(assert (=> b!1099786 m!1019821))

(assert (=> b!1099786 m!1019809))

(declare-fun m!1019823 () Bool)

(assert (=> b!1099786 m!1019823))

(declare-fun m!1019825 () Bool)

(assert (=> mapNonEmpty!42478 m!1019825))

(declare-fun m!1019827 () Bool)

(assert (=> b!1099787 m!1019827))

(declare-fun m!1019829 () Bool)

(assert (=> b!1099782 m!1019829))

(declare-fun m!1019831 () Bool)

(assert (=> b!1099782 m!1019831))

(declare-fun m!1019833 () Bool)

(assert (=> b!1099780 m!1019833))

(declare-fun m!1019835 () Bool)

(assert (=> start!96824 m!1019835))

(declare-fun m!1019837 () Bool)

(assert (=> start!96824 m!1019837))

(declare-fun m!1019839 () Bool)

(assert (=> start!96824 m!1019839))

(declare-fun m!1019841 () Bool)

(assert (=> b!1099778 m!1019841))

(declare-fun m!1019843 () Bool)

(assert (=> b!1099781 m!1019843))

(check-sat (not b!1099786) (not b!1099785) b_and!36895 (not b!1099782) (not b!1099779) (not b_next!23089) (not b!1099787) (not b_lambda!17847) tp_is_empty!27139 (not b!1099778) (not start!96824) (not mapNonEmpty!42478) (not b!1099781))
(check-sat b_and!36895 (not b_next!23089))
(get-model)

(declare-fun b_lambda!17853 () Bool)

(assert (= b_lambda!17847 (or (and start!96824 b_free!23089) b_lambda!17853)))

(check-sat (not b!1099786) (not b!1099785) b_and!36895 (not b!1099782) (not b_lambda!17853) (not b!1099779) (not b_next!23089) (not b!1099787) tp_is_empty!27139 (not b!1099778) (not start!96824) (not mapNonEmpty!42478) (not b!1099781))
(check-sat b_and!36895 (not b_next!23089))
(get-model)

(declare-fun b!1099884 () Bool)

(declare-fun e!627857 () Bool)

(declare-fun contains!6410 (List!23944 (_ BitVec 64)) Bool)

(assert (=> b!1099884 (= e!627857 (contains!6410 Nil!23941 (select (arr!34275 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099885 () Bool)

(declare-fun e!627856 () Bool)

(declare-fun call!45972 () Bool)

(assert (=> b!1099885 (= e!627856 call!45972)))

(declare-fun b!1099886 () Bool)

(declare-fun e!627858 () Bool)

(declare-fun e!627859 () Bool)

(assert (=> b!1099886 (= e!627858 e!627859)))

(declare-fun res!733661 () Bool)

(assert (=> b!1099886 (=> (not res!733661) (not e!627859))))

(assert (=> b!1099886 (= res!733661 (not e!627857))))

(declare-fun res!733663 () Bool)

(assert (=> b!1099886 (=> (not res!733663) (not e!627857))))

(assert (=> b!1099886 (= res!733663 (validKeyInArray!0 (select (arr!34275 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099887 () Bool)

(assert (=> b!1099887 (= e!627859 e!627856)))

(declare-fun c!108924 () Bool)

(assert (=> b!1099887 (= c!108924 (validKeyInArray!0 (select (arr!34275 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130885 () Bool)

(declare-fun res!733662 () Bool)

(assert (=> d!130885 (=> res!733662 e!627858)))

(assert (=> d!130885 (= res!733662 (bvsge #b00000000000000000000000000000000 (size!34812 _keys!1070)))))

(assert (=> d!130885 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23941) e!627858)))

(declare-fun bm!45969 () Bool)

(assert (=> bm!45969 (= call!45972 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108924 (Cons!23940 (select (arr!34275 _keys!1070) #b00000000000000000000000000000000) Nil!23941) Nil!23941)))))

(declare-fun b!1099888 () Bool)

(assert (=> b!1099888 (= e!627856 call!45972)))

(assert (= (and d!130885 (not res!733662)) b!1099886))

(assert (= (and b!1099886 res!733663) b!1099884))

(assert (= (and b!1099886 res!733661) b!1099887))

(assert (= (and b!1099887 c!108924) b!1099885))

(assert (= (and b!1099887 (not c!108924)) b!1099888))

(assert (= (or b!1099885 b!1099888) bm!45969))

(declare-fun m!1019961 () Bool)

(assert (=> b!1099884 m!1019961))

(assert (=> b!1099884 m!1019961))

(declare-fun m!1019963 () Bool)

(assert (=> b!1099884 m!1019963))

(assert (=> b!1099886 m!1019961))

(assert (=> b!1099886 m!1019961))

(declare-fun m!1019965 () Bool)

(assert (=> b!1099886 m!1019965))

(assert (=> b!1099887 m!1019961))

(assert (=> b!1099887 m!1019961))

(assert (=> b!1099887 m!1019965))

(assert (=> bm!45969 m!1019961))

(declare-fun m!1019967 () Bool)

(assert (=> bm!45969 m!1019967))

(assert (=> b!1099785 d!130885))

(declare-fun d!130887 () Bool)

(declare-fun res!733668 () Bool)

(declare-fun e!627864 () Bool)

(assert (=> d!130887 (=> res!733668 e!627864)))

(assert (=> d!130887 (= res!733668 (= (select (arr!34275 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130887 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!627864)))

(declare-fun b!1099893 () Bool)

(declare-fun e!627865 () Bool)

(assert (=> b!1099893 (= e!627864 e!627865)))

(declare-fun res!733669 () Bool)

(assert (=> b!1099893 (=> (not res!733669) (not e!627865))))

(assert (=> b!1099893 (= res!733669 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34812 _keys!1070)))))

(declare-fun b!1099894 () Bool)

(assert (=> b!1099894 (= e!627865 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130887 (not res!733668)) b!1099893))

(assert (= (and b!1099893 res!733669) b!1099894))

(assert (=> d!130887 m!1019961))

(declare-fun m!1019969 () Bool)

(assert (=> b!1099894 m!1019969))

(assert (=> b!1099779 d!130887))

(declare-fun b!1099937 () Bool)

(declare-fun res!733696 () Bool)

(declare-fun e!627892 () Bool)

(assert (=> b!1099937 (=> (not res!733696) (not e!627892))))

(declare-fun e!627898 () Bool)

(assert (=> b!1099937 (= res!733696 e!627898)))

(declare-fun c!108937 () Bool)

(assert (=> b!1099937 (= c!108937 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1099938 () Bool)

(declare-fun e!627900 () Unit!36119)

(declare-fun lt!492035 () Unit!36119)

(assert (=> b!1099938 (= e!627900 lt!492035)))

(declare-fun lt!492032 () ListLongMap!15299)

(assert (=> b!1099938 (= lt!492032 (getCurrentListMapNoExtraKeys!4216 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492018 () (_ BitVec 64))

(assert (=> b!1099938 (= lt!492018 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492039 () (_ BitVec 64))

(assert (=> b!1099938 (= lt!492039 (select (arr!34275 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492026 () Unit!36119)

(declare-fun addStillContains!659 (ListLongMap!15299 (_ BitVec 64) V!41313 (_ BitVec 64)) Unit!36119)

(assert (=> b!1099938 (= lt!492026 (addStillContains!659 lt!492032 lt!492018 zeroValue!831 lt!492039))))

(declare-fun contains!6411 (ListLongMap!15299 (_ BitVec 64)) Bool)

(assert (=> b!1099938 (contains!6411 (+!3399 lt!492032 (tuple2!17323 lt!492018 zeroValue!831)) lt!492039)))

(declare-fun lt!492028 () Unit!36119)

(assert (=> b!1099938 (= lt!492028 lt!492026)))

(declare-fun lt!492027 () ListLongMap!15299)

(assert (=> b!1099938 (= lt!492027 (getCurrentListMapNoExtraKeys!4216 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492030 () (_ BitVec 64))

(assert (=> b!1099938 (= lt!492030 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492024 () (_ BitVec 64))

(assert (=> b!1099938 (= lt!492024 (select (arr!34275 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492037 () Unit!36119)

(declare-fun addApplyDifferent!515 (ListLongMap!15299 (_ BitVec 64) V!41313 (_ BitVec 64)) Unit!36119)

(assert (=> b!1099938 (= lt!492037 (addApplyDifferent!515 lt!492027 lt!492030 minValue!831 lt!492024))))

(declare-fun apply!955 (ListLongMap!15299 (_ BitVec 64)) V!41313)

(assert (=> b!1099938 (= (apply!955 (+!3399 lt!492027 (tuple2!17323 lt!492030 minValue!831)) lt!492024) (apply!955 lt!492027 lt!492024))))

(declare-fun lt!492023 () Unit!36119)

(assert (=> b!1099938 (= lt!492023 lt!492037)))

(declare-fun lt!492025 () ListLongMap!15299)

(assert (=> b!1099938 (= lt!492025 (getCurrentListMapNoExtraKeys!4216 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492031 () (_ BitVec 64))

(assert (=> b!1099938 (= lt!492031 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492019 () (_ BitVec 64))

(assert (=> b!1099938 (= lt!492019 (select (arr!34275 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492033 () Unit!36119)

(assert (=> b!1099938 (= lt!492033 (addApplyDifferent!515 lt!492025 lt!492031 zeroValue!831 lt!492019))))

(assert (=> b!1099938 (= (apply!955 (+!3399 lt!492025 (tuple2!17323 lt!492031 zeroValue!831)) lt!492019) (apply!955 lt!492025 lt!492019))))

(declare-fun lt!492021 () Unit!36119)

(assert (=> b!1099938 (= lt!492021 lt!492033)))

(declare-fun lt!492038 () ListLongMap!15299)

(assert (=> b!1099938 (= lt!492038 (getCurrentListMapNoExtraKeys!4216 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492029 () (_ BitVec 64))

(assert (=> b!1099938 (= lt!492029 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492036 () (_ BitVec 64))

(assert (=> b!1099938 (= lt!492036 (select (arr!34275 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1099938 (= lt!492035 (addApplyDifferent!515 lt!492038 lt!492029 minValue!831 lt!492036))))

(assert (=> b!1099938 (= (apply!955 (+!3399 lt!492038 (tuple2!17323 lt!492029 minValue!831)) lt!492036) (apply!955 lt!492038 lt!492036))))

(declare-fun call!45988 () ListLongMap!15299)

(declare-fun bm!45984 () Bool)

(assert (=> bm!45984 (= call!45988 (getCurrentListMapNoExtraKeys!4216 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1099939 () Bool)

(declare-fun e!627895 () Bool)

(declare-fun lt!492022 () ListLongMap!15299)

(assert (=> b!1099939 (= e!627895 (= (apply!955 lt!492022 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1099940 () Bool)

(declare-fun call!45993 () Bool)

(assert (=> b!1099940 (= e!627898 (not call!45993))))

(declare-fun bm!45985 () Bool)

(declare-fun call!45992 () ListLongMap!15299)

(declare-fun call!45987 () ListLongMap!15299)

(assert (=> bm!45985 (= call!45992 call!45987)))

(declare-fun b!1099941 () Bool)

(declare-fun res!733694 () Bool)

(assert (=> b!1099941 (=> (not res!733694) (not e!627892))))

(declare-fun e!627904 () Bool)

(assert (=> b!1099941 (= res!733694 e!627904)))

(declare-fun res!733690 () Bool)

(assert (=> b!1099941 (=> res!733690 e!627904)))

(declare-fun e!627903 () Bool)

(assert (=> b!1099941 (= res!733690 (not e!627903))))

(declare-fun res!733692 () Bool)

(assert (=> b!1099941 (=> (not res!733692) (not e!627903))))

(assert (=> b!1099941 (= res!733692 (bvslt #b00000000000000000000000000000000 (size!34812 _keys!1070)))))

(declare-fun b!1099942 () Bool)

(declare-fun e!627893 () ListLongMap!15299)

(declare-fun call!45989 () ListLongMap!15299)

(assert (=> b!1099942 (= e!627893 call!45989)))

(declare-fun bm!45986 () Bool)

(assert (=> bm!45986 (= call!45987 call!45988)))

(declare-fun d!130889 () Bool)

(assert (=> d!130889 e!627892))

(declare-fun res!733689 () Bool)

(assert (=> d!130889 (=> (not res!733689) (not e!627892))))

(assert (=> d!130889 (= res!733689 (or (bvsge #b00000000000000000000000000000000 (size!34812 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34812 _keys!1070)))))))

(declare-fun lt!492034 () ListLongMap!15299)

(assert (=> d!130889 (= lt!492022 lt!492034)))

(declare-fun lt!492020 () Unit!36119)

(assert (=> d!130889 (= lt!492020 e!627900)))

(declare-fun c!108941 () Bool)

(declare-fun e!627894 () Bool)

(assert (=> d!130889 (= c!108941 e!627894)))

(declare-fun res!733693 () Bool)

(assert (=> d!130889 (=> (not res!733693) (not e!627894))))

(assert (=> d!130889 (= res!733693 (bvslt #b00000000000000000000000000000000 (size!34812 _keys!1070)))))

(declare-fun e!627899 () ListLongMap!15299)

(assert (=> d!130889 (= lt!492034 e!627899)))

(declare-fun c!108940 () Bool)

(assert (=> d!130889 (= c!108940 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130889 (validMask!0 mask!1414)))

(assert (=> d!130889 (= (getCurrentListMap!4375 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492022)))

(declare-fun bm!45987 () Bool)

(assert (=> bm!45987 (= call!45993 (contains!6411 lt!492022 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45988 () Bool)

(declare-fun call!45990 () ListLongMap!15299)

(assert (=> bm!45988 (= call!45989 call!45990)))

(declare-fun b!1099943 () Bool)

(declare-fun e!627901 () Bool)

(assert (=> b!1099943 (= e!627892 e!627901)))

(declare-fun c!108942 () Bool)

(assert (=> b!1099943 (= c!108942 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!627897 () Bool)

(declare-fun b!1099944 () Bool)

(declare-fun get!17651 (ValueCell!12860 V!41313) V!41313)

(assert (=> b!1099944 (= e!627897 (= (apply!955 lt!492022 (select (arr!34275 _keys!1070) #b00000000000000000000000000000000)) (get!17651 (select (arr!34276 _values!874) #b00000000000000000000000000000000) (dynLambda!2334 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1099944 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34813 _values!874)))))

(assert (=> b!1099944 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34812 _keys!1070)))))

(declare-fun c!108938 () Bool)

(declare-fun bm!45989 () Bool)

(assert (=> bm!45989 (= call!45990 (+!3399 (ite c!108940 call!45988 (ite c!108938 call!45987 call!45992)) (ite (or c!108940 c!108938) (tuple2!17323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1099945 () Bool)

(assert (=> b!1099945 (= e!627904 e!627897)))

(declare-fun res!733688 () Bool)

(assert (=> b!1099945 (=> (not res!733688) (not e!627897))))

(assert (=> b!1099945 (= res!733688 (contains!6411 lt!492022 (select (arr!34275 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1099945 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34812 _keys!1070)))))

(declare-fun b!1099946 () Bool)

(declare-fun e!627902 () Bool)

(assert (=> b!1099946 (= e!627901 e!627902)))

(declare-fun res!733691 () Bool)

(declare-fun call!45991 () Bool)

(assert (=> b!1099946 (= res!733691 call!45991)))

(assert (=> b!1099946 (=> (not res!733691) (not e!627902))))

(declare-fun b!1099947 () Bool)

(assert (=> b!1099947 (= e!627898 e!627895)))

(declare-fun res!733695 () Bool)

(assert (=> b!1099947 (= res!733695 call!45993)))

(assert (=> b!1099947 (=> (not res!733695) (not e!627895))))

(declare-fun b!1099948 () Bool)

(declare-fun e!627896 () ListLongMap!15299)

(assert (=> b!1099948 (= e!627899 e!627896)))

(assert (=> b!1099948 (= c!108938 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1099949 () Bool)

(assert (=> b!1099949 (= e!627899 (+!3399 call!45990 (tuple2!17323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1099950 () Bool)

(assert (=> b!1099950 (= e!627894 (validKeyInArray!0 (select (arr!34275 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099951 () Bool)

(assert (=> b!1099951 (= e!627902 (= (apply!955 lt!492022 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1099952 () Bool)

(declare-fun c!108939 () Bool)

(assert (=> b!1099952 (= c!108939 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1099952 (= e!627896 e!627893)))

(declare-fun bm!45990 () Bool)

(assert (=> bm!45990 (= call!45991 (contains!6411 lt!492022 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1099953 () Bool)

(assert (=> b!1099953 (= e!627896 call!45989)))

(declare-fun b!1099954 () Bool)

(assert (=> b!1099954 (= e!627901 (not call!45991))))

(declare-fun b!1099955 () Bool)

(assert (=> b!1099955 (= e!627903 (validKeyInArray!0 (select (arr!34275 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099956 () Bool)

(declare-fun Unit!36125 () Unit!36119)

(assert (=> b!1099956 (= e!627900 Unit!36125)))

(declare-fun b!1099957 () Bool)

(assert (=> b!1099957 (= e!627893 call!45992)))

(assert (= (and d!130889 c!108940) b!1099949))

(assert (= (and d!130889 (not c!108940)) b!1099948))

(assert (= (and b!1099948 c!108938) b!1099953))

(assert (= (and b!1099948 (not c!108938)) b!1099952))

(assert (= (and b!1099952 c!108939) b!1099942))

(assert (= (and b!1099952 (not c!108939)) b!1099957))

(assert (= (or b!1099942 b!1099957) bm!45985))

(assert (= (or b!1099953 bm!45985) bm!45986))

(assert (= (or b!1099953 b!1099942) bm!45988))

(assert (= (or b!1099949 bm!45986) bm!45984))

(assert (= (or b!1099949 bm!45988) bm!45989))

(assert (= (and d!130889 res!733693) b!1099950))

(assert (= (and d!130889 c!108941) b!1099938))

(assert (= (and d!130889 (not c!108941)) b!1099956))

(assert (= (and d!130889 res!733689) b!1099941))

(assert (= (and b!1099941 res!733692) b!1099955))

(assert (= (and b!1099941 (not res!733690)) b!1099945))

(assert (= (and b!1099945 res!733688) b!1099944))

(assert (= (and b!1099941 res!733694) b!1099937))

(assert (= (and b!1099937 c!108937) b!1099947))

(assert (= (and b!1099937 (not c!108937)) b!1099940))

(assert (= (and b!1099947 res!733695) b!1099939))

(assert (= (or b!1099947 b!1099940) bm!45987))

(assert (= (and b!1099937 res!733696) b!1099943))

(assert (= (and b!1099943 c!108942) b!1099946))

(assert (= (and b!1099943 (not c!108942)) b!1099954))

(assert (= (and b!1099946 res!733691) b!1099951))

(assert (= (or b!1099946 b!1099954) bm!45990))

(declare-fun b_lambda!17855 () Bool)

(assert (=> (not b_lambda!17855) (not b!1099944)))

(assert (=> b!1099944 t!34070))

(declare-fun b_and!36905 () Bool)

(assert (= b_and!36895 (and (=> t!34070 result!16431) b_and!36905)))

(declare-fun m!1019971 () Bool)

(assert (=> b!1099951 m!1019971))

(declare-fun m!1019973 () Bool)

(assert (=> b!1099939 m!1019973))

(declare-fun m!1019975 () Bool)

(assert (=> bm!45990 m!1019975))

(declare-fun m!1019977 () Bool)

(assert (=> bm!45989 m!1019977))

(declare-fun m!1019979 () Bool)

(assert (=> b!1099938 m!1019979))

(assert (=> b!1099938 m!1019961))

(declare-fun m!1019981 () Bool)

(assert (=> b!1099938 m!1019981))

(declare-fun m!1019983 () Bool)

(assert (=> b!1099938 m!1019983))

(declare-fun m!1019985 () Bool)

(assert (=> b!1099938 m!1019985))

(declare-fun m!1019987 () Bool)

(assert (=> b!1099938 m!1019987))

(declare-fun m!1019989 () Bool)

(assert (=> b!1099938 m!1019989))

(declare-fun m!1019991 () Bool)

(assert (=> b!1099938 m!1019991))

(declare-fun m!1019993 () Bool)

(assert (=> b!1099938 m!1019993))

(declare-fun m!1019995 () Bool)

(assert (=> b!1099938 m!1019995))

(declare-fun m!1019997 () Bool)

(assert (=> b!1099938 m!1019997))

(declare-fun m!1019999 () Bool)

(assert (=> b!1099938 m!1019999))

(assert (=> b!1099938 m!1019989))

(declare-fun m!1020001 () Bool)

(assert (=> b!1099938 m!1020001))

(assert (=> b!1099938 m!1019981))

(assert (=> b!1099938 m!1019993))

(declare-fun m!1020003 () Bool)

(assert (=> b!1099938 m!1020003))

(assert (=> b!1099938 m!1019987))

(declare-fun m!1020005 () Bool)

(assert (=> b!1099938 m!1020005))

(declare-fun m!1020007 () Bool)

(assert (=> b!1099938 m!1020007))

(assert (=> b!1099938 m!1019793))

(assert (=> b!1099944 m!1019961))

(assert (=> b!1099944 m!1019787))

(declare-fun m!1020009 () Bool)

(assert (=> b!1099944 m!1020009))

(assert (=> b!1099944 m!1019961))

(declare-fun m!1020011 () Bool)

(assert (=> b!1099944 m!1020011))

(assert (=> b!1099944 m!1020009))

(assert (=> b!1099944 m!1019787))

(declare-fun m!1020013 () Bool)

(assert (=> b!1099944 m!1020013))

(assert (=> b!1099950 m!1019961))

(assert (=> b!1099950 m!1019961))

(assert (=> b!1099950 m!1019965))

(assert (=> bm!45984 m!1019793))

(declare-fun m!1020015 () Bool)

(assert (=> bm!45987 m!1020015))

(assert (=> b!1099945 m!1019961))

(assert (=> b!1099945 m!1019961))

(declare-fun m!1020017 () Bool)

(assert (=> b!1099945 m!1020017))

(declare-fun m!1020019 () Bool)

(assert (=> b!1099949 m!1020019))

(assert (=> d!130889 m!1019835))

(assert (=> b!1099955 m!1019961))

(assert (=> b!1099955 m!1019961))

(assert (=> b!1099955 m!1019965))

(assert (=> b!1099779 d!130889))

(declare-fun b!1099982 () Bool)

(declare-fun e!627922 () ListLongMap!15299)

(assert (=> b!1099982 (= e!627922 (ListLongMap!15300 Nil!23942))))

(declare-fun call!45996 () ListLongMap!15299)

(declare-fun bm!45993 () Bool)

(assert (=> bm!45993 (= call!45996 (getCurrentListMapNoExtraKeys!4216 lt!491879 lt!491877 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1099983 () Bool)

(declare-fun e!627921 () Bool)

(assert (=> b!1099983 (= e!627921 (validKeyInArray!0 (select (arr!34275 lt!491879) #b00000000000000000000000000000000)))))

(assert (=> b!1099983 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1099984 () Bool)

(declare-fun e!627923 () Bool)

(declare-fun lt!492058 () ListLongMap!15299)

(assert (=> b!1099984 (= e!627923 (= lt!492058 (getCurrentListMapNoExtraKeys!4216 lt!491879 lt!491877 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1099985 () Bool)

(declare-fun e!627924 () Bool)

(assert (=> b!1099985 (= e!627924 e!627923)))

(declare-fun c!108953 () Bool)

(assert (=> b!1099985 (= c!108953 (bvslt #b00000000000000000000000000000000 (size!34812 lt!491879)))))

(declare-fun b!1099986 () Bool)

(assert (=> b!1099986 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34812 lt!491879)))))

(assert (=> b!1099986 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34813 lt!491877)))))

(declare-fun e!627920 () Bool)

(assert (=> b!1099986 (= e!627920 (= (apply!955 lt!492058 (select (arr!34275 lt!491879) #b00000000000000000000000000000000)) (get!17651 (select (arr!34276 lt!491877) #b00000000000000000000000000000000) (dynLambda!2334 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1099988 () Bool)

(assert (=> b!1099988 (= e!627924 e!627920)))

(assert (=> b!1099988 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34812 lt!491879)))))

(declare-fun res!733707 () Bool)

(assert (=> b!1099988 (= res!733707 (contains!6411 lt!492058 (select (arr!34275 lt!491879) #b00000000000000000000000000000000)))))

(assert (=> b!1099988 (=> (not res!733707) (not e!627920))))

(declare-fun b!1099989 () Bool)

(declare-fun e!627925 () Bool)

(assert (=> b!1099989 (= e!627925 e!627924)))

(declare-fun c!108952 () Bool)

(assert (=> b!1099989 (= c!108952 e!627921)))

(declare-fun res!733706 () Bool)

(assert (=> b!1099989 (=> (not res!733706) (not e!627921))))

(assert (=> b!1099989 (= res!733706 (bvslt #b00000000000000000000000000000000 (size!34812 lt!491879)))))

(declare-fun b!1099990 () Bool)

(declare-fun isEmpty!968 (ListLongMap!15299) Bool)

(assert (=> b!1099990 (= e!627923 (isEmpty!968 lt!492058))))

(declare-fun b!1099991 () Bool)

(declare-fun lt!492055 () Unit!36119)

(declare-fun lt!492060 () Unit!36119)

(assert (=> b!1099991 (= lt!492055 lt!492060)))

(declare-fun lt!492057 () V!41313)

(declare-fun lt!492054 () (_ BitVec 64))

(declare-fun lt!492059 () ListLongMap!15299)

(declare-fun lt!492056 () (_ BitVec 64))

(assert (=> b!1099991 (not (contains!6411 (+!3399 lt!492059 (tuple2!17323 lt!492056 lt!492057)) lt!492054))))

(declare-fun addStillNotContains!276 (ListLongMap!15299 (_ BitVec 64) V!41313 (_ BitVec 64)) Unit!36119)

(assert (=> b!1099991 (= lt!492060 (addStillNotContains!276 lt!492059 lt!492056 lt!492057 lt!492054))))

(assert (=> b!1099991 (= lt!492054 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1099991 (= lt!492057 (get!17651 (select (arr!34276 lt!491877) #b00000000000000000000000000000000) (dynLambda!2334 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1099991 (= lt!492056 (select (arr!34275 lt!491879) #b00000000000000000000000000000000))))

(assert (=> b!1099991 (= lt!492059 call!45996)))

(declare-fun e!627919 () ListLongMap!15299)

(assert (=> b!1099991 (= e!627919 (+!3399 call!45996 (tuple2!17323 (select (arr!34275 lt!491879) #b00000000000000000000000000000000) (get!17651 (select (arr!34276 lt!491877) #b00000000000000000000000000000000) (dynLambda!2334 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1099987 () Bool)

(declare-fun res!733708 () Bool)

(assert (=> b!1099987 (=> (not res!733708) (not e!627925))))

(assert (=> b!1099987 (= res!733708 (not (contains!6411 lt!492058 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!130891 () Bool)

(assert (=> d!130891 e!627925))

(declare-fun res!733705 () Bool)

(assert (=> d!130891 (=> (not res!733705) (not e!627925))))

(assert (=> d!130891 (= res!733705 (not (contains!6411 lt!492058 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130891 (= lt!492058 e!627922)))

(declare-fun c!108951 () Bool)

(assert (=> d!130891 (= c!108951 (bvsge #b00000000000000000000000000000000 (size!34812 lt!491879)))))

(assert (=> d!130891 (validMask!0 mask!1414)))

(assert (=> d!130891 (= (getCurrentListMapNoExtraKeys!4216 lt!491879 lt!491877 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492058)))

(declare-fun b!1099992 () Bool)

(assert (=> b!1099992 (= e!627922 e!627919)))

(declare-fun c!108954 () Bool)

(assert (=> b!1099992 (= c!108954 (validKeyInArray!0 (select (arr!34275 lt!491879) #b00000000000000000000000000000000)))))

(declare-fun b!1099993 () Bool)

(assert (=> b!1099993 (= e!627919 call!45996)))

(assert (= (and d!130891 c!108951) b!1099982))

(assert (= (and d!130891 (not c!108951)) b!1099992))

(assert (= (and b!1099992 c!108954) b!1099991))

(assert (= (and b!1099992 (not c!108954)) b!1099993))

(assert (= (or b!1099991 b!1099993) bm!45993))

(assert (= (and d!130891 res!733705) b!1099987))

(assert (= (and b!1099987 res!733708) b!1099989))

(assert (= (and b!1099989 res!733706) b!1099983))

(assert (= (and b!1099989 c!108952) b!1099988))

(assert (= (and b!1099989 (not c!108952)) b!1099985))

(assert (= (and b!1099988 res!733707) b!1099986))

(assert (= (and b!1099985 c!108953) b!1099984))

(assert (= (and b!1099985 (not c!108953)) b!1099990))

(declare-fun b_lambda!17857 () Bool)

(assert (=> (not b_lambda!17857) (not b!1099986)))

(assert (=> b!1099986 t!34070))

(declare-fun b_and!36907 () Bool)

(assert (= b_and!36905 (and (=> t!34070 result!16431) b_and!36907)))

(declare-fun b_lambda!17859 () Bool)

(assert (=> (not b_lambda!17859) (not b!1099991)))

(assert (=> b!1099991 t!34070))

(declare-fun b_and!36909 () Bool)

(assert (= b_and!36907 (and (=> t!34070 result!16431) b_and!36909)))

(declare-fun m!1020021 () Bool)

(assert (=> b!1099983 m!1020021))

(assert (=> b!1099983 m!1020021))

(declare-fun m!1020023 () Bool)

(assert (=> b!1099983 m!1020023))

(declare-fun m!1020025 () Bool)

(assert (=> d!130891 m!1020025))

(assert (=> d!130891 m!1019835))

(assert (=> b!1099986 m!1019787))

(assert (=> b!1099986 m!1020021))

(declare-fun m!1020027 () Bool)

(assert (=> b!1099986 m!1020027))

(assert (=> b!1099986 m!1020021))

(declare-fun m!1020029 () Bool)

(assert (=> b!1099986 m!1020029))

(assert (=> b!1099986 m!1020029))

(assert (=> b!1099986 m!1019787))

(declare-fun m!1020031 () Bool)

(assert (=> b!1099986 m!1020031))

(assert (=> b!1099988 m!1020021))

(assert (=> b!1099988 m!1020021))

(declare-fun m!1020033 () Bool)

(assert (=> b!1099988 m!1020033))

(assert (=> b!1099992 m!1020021))

(assert (=> b!1099992 m!1020021))

(assert (=> b!1099992 m!1020023))

(declare-fun m!1020035 () Bool)

(assert (=> b!1099984 m!1020035))

(assert (=> b!1099991 m!1019787))

(declare-fun m!1020037 () Bool)

(assert (=> b!1099991 m!1020037))

(declare-fun m!1020039 () Bool)

(assert (=> b!1099991 m!1020039))

(declare-fun m!1020041 () Bool)

(assert (=> b!1099991 m!1020041))

(assert (=> b!1099991 m!1020037))

(assert (=> b!1099991 m!1020021))

(assert (=> b!1099991 m!1020029))

(assert (=> b!1099991 m!1019787))

(assert (=> b!1099991 m!1020031))

(declare-fun m!1020043 () Bool)

(assert (=> b!1099991 m!1020043))

(assert (=> b!1099991 m!1020029))

(assert (=> bm!45993 m!1020035))

(declare-fun m!1020045 () Bool)

(assert (=> b!1099987 m!1020045))

(declare-fun m!1020047 () Bool)

(assert (=> b!1099990 m!1020047))

(assert (=> b!1099779 d!130891))

(declare-fun d!130893 () Bool)

(declare-fun lt!492063 () ListLongMap!15299)

(assert (=> d!130893 (not (contains!6411 lt!492063 k0!904))))

(declare-fun removeStrictlySorted!79 (List!23945 (_ BitVec 64)) List!23945)

(assert (=> d!130893 (= lt!492063 (ListLongMap!15300 (removeStrictlySorted!79 (toList!7665 lt!491881) k0!904)))))

(assert (=> d!130893 (= (-!937 lt!491881 k0!904) lt!492063)))

(declare-fun bs!32292 () Bool)

(assert (= bs!32292 d!130893))

(declare-fun m!1020049 () Bool)

(assert (=> bs!32292 m!1020049))

(declare-fun m!1020051 () Bool)

(assert (=> bs!32292 m!1020051))

(assert (=> b!1099779 d!130893))

(declare-fun b!1099994 () Bool)

(declare-fun e!627929 () ListLongMap!15299)

(assert (=> b!1099994 (= e!627929 (ListLongMap!15300 Nil!23942))))

(declare-fun bm!45994 () Bool)

(declare-fun call!45997 () ListLongMap!15299)

(assert (=> bm!45994 (= call!45997 (getCurrentListMapNoExtraKeys!4216 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1099995 () Bool)

(declare-fun e!627928 () Bool)

(assert (=> b!1099995 (= e!627928 (validKeyInArray!0 (select (arr!34275 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1099995 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun lt!492068 () ListLongMap!15299)

(declare-fun e!627930 () Bool)

(declare-fun b!1099996 () Bool)

(assert (=> b!1099996 (= e!627930 (= lt!492068 (getCurrentListMapNoExtraKeys!4216 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1099997 () Bool)

(declare-fun e!627931 () Bool)

(assert (=> b!1099997 (= e!627931 e!627930)))

(declare-fun c!108957 () Bool)

(assert (=> b!1099997 (= c!108957 (bvslt #b00000000000000000000000000000000 (size!34812 _keys!1070)))))

(declare-fun b!1099998 () Bool)

(assert (=> b!1099998 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34812 _keys!1070)))))

(assert (=> b!1099998 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34813 _values!874)))))

(declare-fun e!627927 () Bool)

(assert (=> b!1099998 (= e!627927 (= (apply!955 lt!492068 (select (arr!34275 _keys!1070) #b00000000000000000000000000000000)) (get!17651 (select (arr!34276 _values!874) #b00000000000000000000000000000000) (dynLambda!2334 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1100000 () Bool)

(assert (=> b!1100000 (= e!627931 e!627927)))

(assert (=> b!1100000 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34812 _keys!1070)))))

(declare-fun res!733711 () Bool)

(assert (=> b!1100000 (= res!733711 (contains!6411 lt!492068 (select (arr!34275 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1100000 (=> (not res!733711) (not e!627927))))

(declare-fun b!1100001 () Bool)

(declare-fun e!627932 () Bool)

(assert (=> b!1100001 (= e!627932 e!627931)))

(declare-fun c!108956 () Bool)

(assert (=> b!1100001 (= c!108956 e!627928)))

(declare-fun res!733710 () Bool)

(assert (=> b!1100001 (=> (not res!733710) (not e!627928))))

(assert (=> b!1100001 (= res!733710 (bvslt #b00000000000000000000000000000000 (size!34812 _keys!1070)))))

(declare-fun b!1100002 () Bool)

(assert (=> b!1100002 (= e!627930 (isEmpty!968 lt!492068))))

(declare-fun b!1100003 () Bool)

(declare-fun lt!492065 () Unit!36119)

(declare-fun lt!492070 () Unit!36119)

(assert (=> b!1100003 (= lt!492065 lt!492070)))

(declare-fun lt!492069 () ListLongMap!15299)

(declare-fun lt!492064 () (_ BitVec 64))

(declare-fun lt!492066 () (_ BitVec 64))

(declare-fun lt!492067 () V!41313)

(assert (=> b!1100003 (not (contains!6411 (+!3399 lt!492069 (tuple2!17323 lt!492066 lt!492067)) lt!492064))))

(assert (=> b!1100003 (= lt!492070 (addStillNotContains!276 lt!492069 lt!492066 lt!492067 lt!492064))))

(assert (=> b!1100003 (= lt!492064 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1100003 (= lt!492067 (get!17651 (select (arr!34276 _values!874) #b00000000000000000000000000000000) (dynLambda!2334 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1100003 (= lt!492066 (select (arr!34275 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1100003 (= lt!492069 call!45997)))

(declare-fun e!627926 () ListLongMap!15299)

(assert (=> b!1100003 (= e!627926 (+!3399 call!45997 (tuple2!17323 (select (arr!34275 _keys!1070) #b00000000000000000000000000000000) (get!17651 (select (arr!34276 _values!874) #b00000000000000000000000000000000) (dynLambda!2334 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1099999 () Bool)

(declare-fun res!733712 () Bool)

(assert (=> b!1099999 (=> (not res!733712) (not e!627932))))

(assert (=> b!1099999 (= res!733712 (not (contains!6411 lt!492068 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!130895 () Bool)

(assert (=> d!130895 e!627932))

(declare-fun res!733709 () Bool)

(assert (=> d!130895 (=> (not res!733709) (not e!627932))))

(assert (=> d!130895 (= res!733709 (not (contains!6411 lt!492068 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130895 (= lt!492068 e!627929)))

(declare-fun c!108955 () Bool)

(assert (=> d!130895 (= c!108955 (bvsge #b00000000000000000000000000000000 (size!34812 _keys!1070)))))

(assert (=> d!130895 (validMask!0 mask!1414)))

(assert (=> d!130895 (= (getCurrentListMapNoExtraKeys!4216 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492068)))

(declare-fun b!1100004 () Bool)

(assert (=> b!1100004 (= e!627929 e!627926)))

(declare-fun c!108958 () Bool)

(assert (=> b!1100004 (= c!108958 (validKeyInArray!0 (select (arr!34275 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1100005 () Bool)

(assert (=> b!1100005 (= e!627926 call!45997)))

(assert (= (and d!130895 c!108955) b!1099994))

(assert (= (and d!130895 (not c!108955)) b!1100004))

(assert (= (and b!1100004 c!108958) b!1100003))

(assert (= (and b!1100004 (not c!108958)) b!1100005))

(assert (= (or b!1100003 b!1100005) bm!45994))

(assert (= (and d!130895 res!733709) b!1099999))

(assert (= (and b!1099999 res!733712) b!1100001))

(assert (= (and b!1100001 res!733710) b!1099995))

(assert (= (and b!1100001 c!108956) b!1100000))

(assert (= (and b!1100001 (not c!108956)) b!1099997))

(assert (= (and b!1100000 res!733711) b!1099998))

(assert (= (and b!1099997 c!108957) b!1099996))

(assert (= (and b!1099997 (not c!108957)) b!1100002))

(declare-fun b_lambda!17861 () Bool)

(assert (=> (not b_lambda!17861) (not b!1099998)))

(assert (=> b!1099998 t!34070))

(declare-fun b_and!36911 () Bool)

(assert (= b_and!36909 (and (=> t!34070 result!16431) b_and!36911)))

(declare-fun b_lambda!17863 () Bool)

(assert (=> (not b_lambda!17863) (not b!1100003)))

(assert (=> b!1100003 t!34070))

(declare-fun b_and!36913 () Bool)

(assert (= b_and!36911 (and (=> t!34070 result!16431) b_and!36913)))

(assert (=> b!1099995 m!1019961))

(assert (=> b!1099995 m!1019961))

(assert (=> b!1099995 m!1019965))

(declare-fun m!1020053 () Bool)

(assert (=> d!130895 m!1020053))

(assert (=> d!130895 m!1019835))

(assert (=> b!1099998 m!1019787))

(assert (=> b!1099998 m!1019961))

(declare-fun m!1020055 () Bool)

(assert (=> b!1099998 m!1020055))

(assert (=> b!1099998 m!1019961))

(assert (=> b!1099998 m!1020009))

(assert (=> b!1099998 m!1020009))

(assert (=> b!1099998 m!1019787))

(assert (=> b!1099998 m!1020013))

(assert (=> b!1100000 m!1019961))

(assert (=> b!1100000 m!1019961))

(declare-fun m!1020057 () Bool)

(assert (=> b!1100000 m!1020057))

(assert (=> b!1100004 m!1019961))

(assert (=> b!1100004 m!1019961))

(assert (=> b!1100004 m!1019965))

(declare-fun m!1020059 () Bool)

(assert (=> b!1099996 m!1020059))

(assert (=> b!1100003 m!1019787))

(declare-fun m!1020061 () Bool)

(assert (=> b!1100003 m!1020061))

(declare-fun m!1020063 () Bool)

(assert (=> b!1100003 m!1020063))

(declare-fun m!1020065 () Bool)

(assert (=> b!1100003 m!1020065))

(assert (=> b!1100003 m!1020061))

(assert (=> b!1100003 m!1019961))

(assert (=> b!1100003 m!1020009))

(assert (=> b!1100003 m!1019787))

(assert (=> b!1100003 m!1020013))

(declare-fun m!1020067 () Bool)

(assert (=> b!1100003 m!1020067))

(assert (=> b!1100003 m!1020009))

(assert (=> bm!45994 m!1020059))

(declare-fun m!1020069 () Bool)

(assert (=> b!1099999 m!1020069))

(declare-fun m!1020071 () Bool)

(assert (=> b!1100002 m!1020071))

(assert (=> b!1099779 d!130895))

(declare-fun d!130897 () Bool)

(assert (=> d!130897 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492073 () Unit!36119)

(declare-fun choose!13 (array!71225 (_ BitVec 64) (_ BitVec 32)) Unit!36119)

(assert (=> d!130897 (= lt!492073 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130897 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130897 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!492073)))

(declare-fun bs!32293 () Bool)

(assert (= bs!32293 d!130897))

(assert (=> bs!32293 m!1019799))

(declare-fun m!1020073 () Bool)

(assert (=> bs!32293 m!1020073))

(assert (=> b!1099779 d!130897))

(declare-fun call!46002 () ListLongMap!15299)

(declare-fun bm!45999 () Bool)

(assert (=> bm!45999 (= call!46002 (getCurrentListMapNoExtraKeys!4216 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1100012 () Bool)

(declare-fun e!627937 () Bool)

(declare-fun call!46003 () ListLongMap!15299)

(assert (=> b!1100012 (= e!627937 (= call!46003 call!46002))))

(assert (=> b!1100012 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34813 _values!874)))))

(declare-fun d!130899 () Bool)

(declare-fun e!627938 () Bool)

(assert (=> d!130899 e!627938))

(declare-fun res!733715 () Bool)

(assert (=> d!130899 (=> (not res!733715) (not e!627938))))

(assert (=> d!130899 (= res!733715 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34812 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34812 _keys!1070))))))))

(declare-fun lt!492076 () Unit!36119)

(declare-fun choose!1769 (array!71225 array!71227 (_ BitVec 32) (_ BitVec 32) V!41313 V!41313 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36119)

(assert (=> d!130899 (= lt!492076 (choose!1769 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130899 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34812 _keys!1070)))))

(assert (=> d!130899 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!492076)))

(declare-fun b!1100013 () Bool)

(assert (=> b!1100013 (= e!627938 e!627937)))

(declare-fun c!108961 () Bool)

(assert (=> b!1100013 (= c!108961 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun bm!46000 () Bool)

(assert (=> bm!46000 (= call!46003 (getCurrentListMapNoExtraKeys!4216 (array!71226 (store (arr!34275 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34812 _keys!1070)) (array!71228 (store (arr!34276 _values!874) i!650 (ValueCellFull!12860 (dynLambda!2334 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34813 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1100014 () Bool)

(assert (=> b!1100014 (= e!627937 (= call!46003 (-!937 call!46002 k0!904)))))

(assert (=> b!1100014 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34813 _values!874)))))

(assert (= (and d!130899 res!733715) b!1100013))

(assert (= (and b!1100013 c!108961) b!1100014))

(assert (= (and b!1100013 (not c!108961)) b!1100012))

(assert (= (or b!1100014 b!1100012) bm!45999))

(assert (= (or b!1100014 b!1100012) bm!46000))

(declare-fun b_lambda!17865 () Bool)

(assert (=> (not b_lambda!17865) (not bm!46000)))

(assert (=> bm!46000 t!34070))

(declare-fun b_and!36915 () Bool)

(assert (= b_and!36913 (and (=> t!34070 result!16431) b_and!36915)))

(assert (=> bm!45999 m!1019793))

(declare-fun m!1020075 () Bool)

(assert (=> d!130899 m!1020075))

(assert (=> bm!46000 m!1019831))

(assert (=> bm!46000 m!1019787))

(assert (=> bm!46000 m!1019789))

(declare-fun m!1020077 () Bool)

(assert (=> bm!46000 m!1020077))

(declare-fun m!1020079 () Bool)

(assert (=> b!1100014 m!1020079))

(assert (=> b!1099779 d!130899))

(declare-fun b!1100015 () Bool)

(declare-fun res!733724 () Bool)

(declare-fun e!627939 () Bool)

(assert (=> b!1100015 (=> (not res!733724) (not e!627939))))

(declare-fun e!627945 () Bool)

(assert (=> b!1100015 (= res!733724 e!627945)))

(declare-fun c!108962 () Bool)

(assert (=> b!1100015 (= c!108962 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1100016 () Bool)

(declare-fun e!627947 () Unit!36119)

(declare-fun lt!492094 () Unit!36119)

(assert (=> b!1100016 (= e!627947 lt!492094)))

(declare-fun lt!492091 () ListLongMap!15299)

(assert (=> b!1100016 (= lt!492091 (getCurrentListMapNoExtraKeys!4216 lt!491879 lt!491877 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492077 () (_ BitVec 64))

(assert (=> b!1100016 (= lt!492077 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492098 () (_ BitVec 64))

(assert (=> b!1100016 (= lt!492098 (select (arr!34275 lt!491879) #b00000000000000000000000000000000))))

(declare-fun lt!492085 () Unit!36119)

(assert (=> b!1100016 (= lt!492085 (addStillContains!659 lt!492091 lt!492077 zeroValue!831 lt!492098))))

(assert (=> b!1100016 (contains!6411 (+!3399 lt!492091 (tuple2!17323 lt!492077 zeroValue!831)) lt!492098)))

(declare-fun lt!492087 () Unit!36119)

(assert (=> b!1100016 (= lt!492087 lt!492085)))

(declare-fun lt!492086 () ListLongMap!15299)

(assert (=> b!1100016 (= lt!492086 (getCurrentListMapNoExtraKeys!4216 lt!491879 lt!491877 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492089 () (_ BitVec 64))

(assert (=> b!1100016 (= lt!492089 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492083 () (_ BitVec 64))

(assert (=> b!1100016 (= lt!492083 (select (arr!34275 lt!491879) #b00000000000000000000000000000000))))

(declare-fun lt!492096 () Unit!36119)

(assert (=> b!1100016 (= lt!492096 (addApplyDifferent!515 lt!492086 lt!492089 minValue!831 lt!492083))))

(assert (=> b!1100016 (= (apply!955 (+!3399 lt!492086 (tuple2!17323 lt!492089 minValue!831)) lt!492083) (apply!955 lt!492086 lt!492083))))

(declare-fun lt!492082 () Unit!36119)

(assert (=> b!1100016 (= lt!492082 lt!492096)))

(declare-fun lt!492084 () ListLongMap!15299)

(assert (=> b!1100016 (= lt!492084 (getCurrentListMapNoExtraKeys!4216 lt!491879 lt!491877 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492090 () (_ BitVec 64))

(assert (=> b!1100016 (= lt!492090 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492078 () (_ BitVec 64))

(assert (=> b!1100016 (= lt!492078 (select (arr!34275 lt!491879) #b00000000000000000000000000000000))))

(declare-fun lt!492092 () Unit!36119)

(assert (=> b!1100016 (= lt!492092 (addApplyDifferent!515 lt!492084 lt!492090 zeroValue!831 lt!492078))))

(assert (=> b!1100016 (= (apply!955 (+!3399 lt!492084 (tuple2!17323 lt!492090 zeroValue!831)) lt!492078) (apply!955 lt!492084 lt!492078))))

(declare-fun lt!492080 () Unit!36119)

(assert (=> b!1100016 (= lt!492080 lt!492092)))

(declare-fun lt!492097 () ListLongMap!15299)

(assert (=> b!1100016 (= lt!492097 (getCurrentListMapNoExtraKeys!4216 lt!491879 lt!491877 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492088 () (_ BitVec 64))

(assert (=> b!1100016 (= lt!492088 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!492095 () (_ BitVec 64))

(assert (=> b!1100016 (= lt!492095 (select (arr!34275 lt!491879) #b00000000000000000000000000000000))))

(assert (=> b!1100016 (= lt!492094 (addApplyDifferent!515 lt!492097 lt!492088 minValue!831 lt!492095))))

(assert (=> b!1100016 (= (apply!955 (+!3399 lt!492097 (tuple2!17323 lt!492088 minValue!831)) lt!492095) (apply!955 lt!492097 lt!492095))))

(declare-fun call!46005 () ListLongMap!15299)

(declare-fun bm!46001 () Bool)

(assert (=> bm!46001 (= call!46005 (getCurrentListMapNoExtraKeys!4216 lt!491879 lt!491877 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1100017 () Bool)

(declare-fun e!627942 () Bool)

(declare-fun lt!492081 () ListLongMap!15299)

(assert (=> b!1100017 (= e!627942 (= (apply!955 lt!492081 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1100018 () Bool)

(declare-fun call!46010 () Bool)

(assert (=> b!1100018 (= e!627945 (not call!46010))))

(declare-fun bm!46002 () Bool)

(declare-fun call!46009 () ListLongMap!15299)

(declare-fun call!46004 () ListLongMap!15299)

(assert (=> bm!46002 (= call!46009 call!46004)))

(declare-fun b!1100019 () Bool)

(declare-fun res!733722 () Bool)

(assert (=> b!1100019 (=> (not res!733722) (not e!627939))))

(declare-fun e!627951 () Bool)

(assert (=> b!1100019 (= res!733722 e!627951)))

(declare-fun res!733718 () Bool)

(assert (=> b!1100019 (=> res!733718 e!627951)))

(declare-fun e!627950 () Bool)

(assert (=> b!1100019 (= res!733718 (not e!627950))))

(declare-fun res!733720 () Bool)

(assert (=> b!1100019 (=> (not res!733720) (not e!627950))))

(assert (=> b!1100019 (= res!733720 (bvslt #b00000000000000000000000000000000 (size!34812 lt!491879)))))

(declare-fun b!1100020 () Bool)

(declare-fun e!627940 () ListLongMap!15299)

(declare-fun call!46006 () ListLongMap!15299)

(assert (=> b!1100020 (= e!627940 call!46006)))

(declare-fun bm!46003 () Bool)

(assert (=> bm!46003 (= call!46004 call!46005)))

(declare-fun d!130901 () Bool)

(assert (=> d!130901 e!627939))

(declare-fun res!733717 () Bool)

(assert (=> d!130901 (=> (not res!733717) (not e!627939))))

(assert (=> d!130901 (= res!733717 (or (bvsge #b00000000000000000000000000000000 (size!34812 lt!491879)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34812 lt!491879)))))))

(declare-fun lt!492093 () ListLongMap!15299)

(assert (=> d!130901 (= lt!492081 lt!492093)))

(declare-fun lt!492079 () Unit!36119)

(assert (=> d!130901 (= lt!492079 e!627947)))

(declare-fun c!108966 () Bool)

(declare-fun e!627941 () Bool)

(assert (=> d!130901 (= c!108966 e!627941)))

(declare-fun res!733721 () Bool)

(assert (=> d!130901 (=> (not res!733721) (not e!627941))))

(assert (=> d!130901 (= res!733721 (bvslt #b00000000000000000000000000000000 (size!34812 lt!491879)))))

(declare-fun e!627946 () ListLongMap!15299)

(assert (=> d!130901 (= lt!492093 e!627946)))

(declare-fun c!108965 () Bool)

(assert (=> d!130901 (= c!108965 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130901 (validMask!0 mask!1414)))

(assert (=> d!130901 (= (getCurrentListMap!4375 lt!491879 lt!491877 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!492081)))

(declare-fun bm!46004 () Bool)

(assert (=> bm!46004 (= call!46010 (contains!6411 lt!492081 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!46005 () Bool)

(declare-fun call!46007 () ListLongMap!15299)

(assert (=> bm!46005 (= call!46006 call!46007)))

(declare-fun b!1100021 () Bool)

(declare-fun e!627948 () Bool)

(assert (=> b!1100021 (= e!627939 e!627948)))

(declare-fun c!108967 () Bool)

(assert (=> b!1100021 (= c!108967 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1100022 () Bool)

(declare-fun e!627944 () Bool)

(assert (=> b!1100022 (= e!627944 (= (apply!955 lt!492081 (select (arr!34275 lt!491879) #b00000000000000000000000000000000)) (get!17651 (select (arr!34276 lt!491877) #b00000000000000000000000000000000) (dynLambda!2334 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1100022 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34813 lt!491877)))))

(assert (=> b!1100022 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34812 lt!491879)))))

(declare-fun bm!46006 () Bool)

(declare-fun c!108963 () Bool)

(assert (=> bm!46006 (= call!46007 (+!3399 (ite c!108965 call!46005 (ite c!108963 call!46004 call!46009)) (ite (or c!108965 c!108963) (tuple2!17323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1100023 () Bool)

(assert (=> b!1100023 (= e!627951 e!627944)))

(declare-fun res!733716 () Bool)

(assert (=> b!1100023 (=> (not res!733716) (not e!627944))))

(assert (=> b!1100023 (= res!733716 (contains!6411 lt!492081 (select (arr!34275 lt!491879) #b00000000000000000000000000000000)))))

(assert (=> b!1100023 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34812 lt!491879)))))

(declare-fun b!1100024 () Bool)

(declare-fun e!627949 () Bool)

(assert (=> b!1100024 (= e!627948 e!627949)))

(declare-fun res!733719 () Bool)

(declare-fun call!46008 () Bool)

(assert (=> b!1100024 (= res!733719 call!46008)))

(assert (=> b!1100024 (=> (not res!733719) (not e!627949))))

(declare-fun b!1100025 () Bool)

(assert (=> b!1100025 (= e!627945 e!627942)))

(declare-fun res!733723 () Bool)

(assert (=> b!1100025 (= res!733723 call!46010)))

(assert (=> b!1100025 (=> (not res!733723) (not e!627942))))

(declare-fun b!1100026 () Bool)

(declare-fun e!627943 () ListLongMap!15299)

(assert (=> b!1100026 (= e!627946 e!627943)))

(assert (=> b!1100026 (= c!108963 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1100027 () Bool)

(assert (=> b!1100027 (= e!627946 (+!3399 call!46007 (tuple2!17323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1100028 () Bool)

(assert (=> b!1100028 (= e!627941 (validKeyInArray!0 (select (arr!34275 lt!491879) #b00000000000000000000000000000000)))))

(declare-fun b!1100029 () Bool)

(assert (=> b!1100029 (= e!627949 (= (apply!955 lt!492081 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1100030 () Bool)

(declare-fun c!108964 () Bool)

(assert (=> b!1100030 (= c!108964 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1100030 (= e!627943 e!627940)))

(declare-fun bm!46007 () Bool)

(assert (=> bm!46007 (= call!46008 (contains!6411 lt!492081 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1100031 () Bool)

(assert (=> b!1100031 (= e!627943 call!46006)))

(declare-fun b!1100032 () Bool)

(assert (=> b!1100032 (= e!627948 (not call!46008))))

(declare-fun b!1100033 () Bool)

(assert (=> b!1100033 (= e!627950 (validKeyInArray!0 (select (arr!34275 lt!491879) #b00000000000000000000000000000000)))))

(declare-fun b!1100034 () Bool)

(declare-fun Unit!36126 () Unit!36119)

(assert (=> b!1100034 (= e!627947 Unit!36126)))

(declare-fun b!1100035 () Bool)

(assert (=> b!1100035 (= e!627940 call!46009)))

(assert (= (and d!130901 c!108965) b!1100027))

(assert (= (and d!130901 (not c!108965)) b!1100026))

(assert (= (and b!1100026 c!108963) b!1100031))

(assert (= (and b!1100026 (not c!108963)) b!1100030))

(assert (= (and b!1100030 c!108964) b!1100020))

(assert (= (and b!1100030 (not c!108964)) b!1100035))

(assert (= (or b!1100020 b!1100035) bm!46002))

(assert (= (or b!1100031 bm!46002) bm!46003))

(assert (= (or b!1100031 b!1100020) bm!46005))

(assert (= (or b!1100027 bm!46003) bm!46001))

(assert (= (or b!1100027 bm!46005) bm!46006))

(assert (= (and d!130901 res!733721) b!1100028))

(assert (= (and d!130901 c!108966) b!1100016))

(assert (= (and d!130901 (not c!108966)) b!1100034))

(assert (= (and d!130901 res!733717) b!1100019))

(assert (= (and b!1100019 res!733720) b!1100033))

(assert (= (and b!1100019 (not res!733718)) b!1100023))

(assert (= (and b!1100023 res!733716) b!1100022))

(assert (= (and b!1100019 res!733722) b!1100015))

(assert (= (and b!1100015 c!108962) b!1100025))

(assert (= (and b!1100015 (not c!108962)) b!1100018))

(assert (= (and b!1100025 res!733723) b!1100017))

(assert (= (or b!1100025 b!1100018) bm!46004))

(assert (= (and b!1100015 res!733724) b!1100021))

(assert (= (and b!1100021 c!108967) b!1100024))

(assert (= (and b!1100021 (not c!108967)) b!1100032))

(assert (= (and b!1100024 res!733719) b!1100029))

(assert (= (or b!1100024 b!1100032) bm!46007))

(declare-fun b_lambda!17867 () Bool)

(assert (=> (not b_lambda!17867) (not b!1100022)))

(assert (=> b!1100022 t!34070))

(declare-fun b_and!36917 () Bool)

(assert (= b_and!36915 (and (=> t!34070 result!16431) b_and!36917)))

(declare-fun m!1020081 () Bool)

(assert (=> b!1100029 m!1020081))

(declare-fun m!1020083 () Bool)

(assert (=> b!1100017 m!1020083))

(declare-fun m!1020085 () Bool)

(assert (=> bm!46007 m!1020085))

(declare-fun m!1020087 () Bool)

(assert (=> bm!46006 m!1020087))

(declare-fun m!1020089 () Bool)

(assert (=> b!1100016 m!1020089))

(assert (=> b!1100016 m!1020021))

(declare-fun m!1020091 () Bool)

(assert (=> b!1100016 m!1020091))

(declare-fun m!1020093 () Bool)

(assert (=> b!1100016 m!1020093))

(declare-fun m!1020095 () Bool)

(assert (=> b!1100016 m!1020095))

(declare-fun m!1020097 () Bool)

(assert (=> b!1100016 m!1020097))

(declare-fun m!1020099 () Bool)

(assert (=> b!1100016 m!1020099))

(declare-fun m!1020101 () Bool)

(assert (=> b!1100016 m!1020101))

(declare-fun m!1020103 () Bool)

(assert (=> b!1100016 m!1020103))

(declare-fun m!1020105 () Bool)

(assert (=> b!1100016 m!1020105))

(declare-fun m!1020107 () Bool)

(assert (=> b!1100016 m!1020107))

(declare-fun m!1020109 () Bool)

(assert (=> b!1100016 m!1020109))

(assert (=> b!1100016 m!1020099))

(declare-fun m!1020111 () Bool)

(assert (=> b!1100016 m!1020111))

(assert (=> b!1100016 m!1020091))

(assert (=> b!1100016 m!1020103))

(declare-fun m!1020113 () Bool)

(assert (=> b!1100016 m!1020113))

(assert (=> b!1100016 m!1020097))

(declare-fun m!1020115 () Bool)

(assert (=> b!1100016 m!1020115))

(declare-fun m!1020117 () Bool)

(assert (=> b!1100016 m!1020117))

(assert (=> b!1100016 m!1019795))

(assert (=> b!1100022 m!1020021))

(assert (=> b!1100022 m!1019787))

(assert (=> b!1100022 m!1020029))

(assert (=> b!1100022 m!1020021))

(declare-fun m!1020119 () Bool)

(assert (=> b!1100022 m!1020119))

(assert (=> b!1100022 m!1020029))

(assert (=> b!1100022 m!1019787))

(assert (=> b!1100022 m!1020031))

(assert (=> b!1100028 m!1020021))

(assert (=> b!1100028 m!1020021))

(assert (=> b!1100028 m!1020023))

(assert (=> bm!46001 m!1019795))

(declare-fun m!1020121 () Bool)

(assert (=> bm!46004 m!1020121))

(assert (=> b!1100023 m!1020021))

(assert (=> b!1100023 m!1020021))

(declare-fun m!1020123 () Bool)

(assert (=> b!1100023 m!1020123))

(declare-fun m!1020125 () Bool)

(assert (=> b!1100027 m!1020125))

(assert (=> d!130901 m!1019835))

(assert (=> b!1100033 m!1020021))

(assert (=> b!1100033 m!1020021))

(assert (=> b!1100033 m!1020023))

(assert (=> b!1099779 d!130901))

(declare-fun d!130903 () Bool)

(assert (=> d!130903 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1099787 d!130903))

(declare-fun b!1100036 () Bool)

(declare-fun e!627953 () Bool)

(assert (=> b!1100036 (= e!627953 (contains!6410 Nil!23941 (select (arr!34275 lt!491879) #b00000000000000000000000000000000)))))

(declare-fun b!1100037 () Bool)

(declare-fun e!627952 () Bool)

(declare-fun call!46011 () Bool)

(assert (=> b!1100037 (= e!627952 call!46011)))

(declare-fun b!1100038 () Bool)

(declare-fun e!627954 () Bool)

(declare-fun e!627955 () Bool)

(assert (=> b!1100038 (= e!627954 e!627955)))

(declare-fun res!733725 () Bool)

(assert (=> b!1100038 (=> (not res!733725) (not e!627955))))

(assert (=> b!1100038 (= res!733725 (not e!627953))))

(declare-fun res!733727 () Bool)

(assert (=> b!1100038 (=> (not res!733727) (not e!627953))))

(assert (=> b!1100038 (= res!733727 (validKeyInArray!0 (select (arr!34275 lt!491879) #b00000000000000000000000000000000)))))

(declare-fun b!1100039 () Bool)

(assert (=> b!1100039 (= e!627955 e!627952)))

(declare-fun c!108968 () Bool)

(assert (=> b!1100039 (= c!108968 (validKeyInArray!0 (select (arr!34275 lt!491879) #b00000000000000000000000000000000)))))

(declare-fun d!130905 () Bool)

(declare-fun res!733726 () Bool)

(assert (=> d!130905 (=> res!733726 e!627954)))

(assert (=> d!130905 (= res!733726 (bvsge #b00000000000000000000000000000000 (size!34812 lt!491879)))))

(assert (=> d!130905 (= (arrayNoDuplicates!0 lt!491879 #b00000000000000000000000000000000 Nil!23941) e!627954)))

(declare-fun bm!46008 () Bool)

(assert (=> bm!46008 (= call!46011 (arrayNoDuplicates!0 lt!491879 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108968 (Cons!23940 (select (arr!34275 lt!491879) #b00000000000000000000000000000000) Nil!23941) Nil!23941)))))

(declare-fun b!1100040 () Bool)

(assert (=> b!1100040 (= e!627952 call!46011)))

(assert (= (and d!130905 (not res!733726)) b!1100038))

(assert (= (and b!1100038 res!733727) b!1100036))

(assert (= (and b!1100038 res!733725) b!1100039))

(assert (= (and b!1100039 c!108968) b!1100037))

(assert (= (and b!1100039 (not c!108968)) b!1100040))

(assert (= (or b!1100037 b!1100040) bm!46008))

(assert (=> b!1100036 m!1020021))

(assert (=> b!1100036 m!1020021))

(declare-fun m!1020127 () Bool)

(assert (=> b!1100036 m!1020127))

(assert (=> b!1100038 m!1020021))

(assert (=> b!1100038 m!1020021))

(assert (=> b!1100038 m!1020023))

(assert (=> b!1100039 m!1020021))

(assert (=> b!1100039 m!1020021))

(assert (=> b!1100039 m!1020023))

(assert (=> bm!46008 m!1020021))

(declare-fun m!1020129 () Bool)

(assert (=> bm!46008 m!1020129))

(assert (=> b!1099778 d!130905))

(declare-fun bm!46011 () Bool)

(declare-fun call!46014 () Bool)

(assert (=> bm!46011 (= call!46014 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!491879 mask!1414))))

(declare-fun b!1100049 () Bool)

(declare-fun e!627962 () Bool)

(declare-fun e!627964 () Bool)

(assert (=> b!1100049 (= e!627962 e!627964)))

(declare-fun lt!492106 () (_ BitVec 64))

(assert (=> b!1100049 (= lt!492106 (select (arr!34275 lt!491879) #b00000000000000000000000000000000))))

(declare-fun lt!492107 () Unit!36119)

(assert (=> b!1100049 (= lt!492107 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!491879 lt!492106 #b00000000000000000000000000000000))))

(assert (=> b!1100049 (arrayContainsKey!0 lt!491879 lt!492106 #b00000000000000000000000000000000)))

(declare-fun lt!492105 () Unit!36119)

(assert (=> b!1100049 (= lt!492105 lt!492107)))

(declare-fun res!733733 () Bool)

(declare-datatypes ((SeekEntryResult!9865 0))(
  ( (MissingZero!9865 (index!41831 (_ BitVec 32))) (Found!9865 (index!41832 (_ BitVec 32))) (Intermediate!9865 (undefined!10677 Bool) (index!41833 (_ BitVec 32)) (x!98780 (_ BitVec 32))) (Undefined!9865) (MissingVacant!9865 (index!41834 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71225 (_ BitVec 32)) SeekEntryResult!9865)

(assert (=> b!1100049 (= res!733733 (= (seekEntryOrOpen!0 (select (arr!34275 lt!491879) #b00000000000000000000000000000000) lt!491879 mask!1414) (Found!9865 #b00000000000000000000000000000000)))))

(assert (=> b!1100049 (=> (not res!733733) (not e!627964))))

(declare-fun d!130907 () Bool)

(declare-fun res!733732 () Bool)

(declare-fun e!627963 () Bool)

(assert (=> d!130907 (=> res!733732 e!627963)))

(assert (=> d!130907 (= res!733732 (bvsge #b00000000000000000000000000000000 (size!34812 lt!491879)))))

(assert (=> d!130907 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491879 mask!1414) e!627963)))

(declare-fun b!1100050 () Bool)

(assert (=> b!1100050 (= e!627962 call!46014)))

(declare-fun b!1100051 () Bool)

(assert (=> b!1100051 (= e!627964 call!46014)))

(declare-fun b!1100052 () Bool)

(assert (=> b!1100052 (= e!627963 e!627962)))

(declare-fun c!108971 () Bool)

(assert (=> b!1100052 (= c!108971 (validKeyInArray!0 (select (arr!34275 lt!491879) #b00000000000000000000000000000000)))))

(assert (= (and d!130907 (not res!733732)) b!1100052))

(assert (= (and b!1100052 c!108971) b!1100049))

(assert (= (and b!1100052 (not c!108971)) b!1100050))

(assert (= (and b!1100049 res!733733) b!1100051))

(assert (= (or b!1100051 b!1100050) bm!46011))

(declare-fun m!1020131 () Bool)

(assert (=> bm!46011 m!1020131))

(assert (=> b!1100049 m!1020021))

(declare-fun m!1020133 () Bool)

(assert (=> b!1100049 m!1020133))

(declare-fun m!1020135 () Bool)

(assert (=> b!1100049 m!1020135))

(assert (=> b!1100049 m!1020021))

(declare-fun m!1020137 () Bool)

(assert (=> b!1100049 m!1020137))

(assert (=> b!1100052 m!1020021))

(assert (=> b!1100052 m!1020021))

(assert (=> b!1100052 m!1020023))

(assert (=> b!1099782 d!130907))

(declare-fun bm!46012 () Bool)

(declare-fun call!46015 () Bool)

(assert (=> bm!46012 (= call!46015 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1100053 () Bool)

(declare-fun e!627965 () Bool)

(declare-fun e!627967 () Bool)

(assert (=> b!1100053 (= e!627965 e!627967)))

(declare-fun lt!492109 () (_ BitVec 64))

(assert (=> b!1100053 (= lt!492109 (select (arr!34275 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!492110 () Unit!36119)

(assert (=> b!1100053 (= lt!492110 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!492109 #b00000000000000000000000000000000))))

(assert (=> b!1100053 (arrayContainsKey!0 _keys!1070 lt!492109 #b00000000000000000000000000000000)))

(declare-fun lt!492108 () Unit!36119)

(assert (=> b!1100053 (= lt!492108 lt!492110)))

(declare-fun res!733735 () Bool)

(assert (=> b!1100053 (= res!733735 (= (seekEntryOrOpen!0 (select (arr!34275 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9865 #b00000000000000000000000000000000)))))

(assert (=> b!1100053 (=> (not res!733735) (not e!627967))))

(declare-fun d!130909 () Bool)

(declare-fun res!733734 () Bool)

(declare-fun e!627966 () Bool)

(assert (=> d!130909 (=> res!733734 e!627966)))

(assert (=> d!130909 (= res!733734 (bvsge #b00000000000000000000000000000000 (size!34812 _keys!1070)))))

(assert (=> d!130909 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!627966)))

(declare-fun b!1100054 () Bool)

(assert (=> b!1100054 (= e!627965 call!46015)))

(declare-fun b!1100055 () Bool)

(assert (=> b!1100055 (= e!627967 call!46015)))

(declare-fun b!1100056 () Bool)

(assert (=> b!1100056 (= e!627966 e!627965)))

(declare-fun c!108972 () Bool)

(assert (=> b!1100056 (= c!108972 (validKeyInArray!0 (select (arr!34275 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130909 (not res!733734)) b!1100056))

(assert (= (and b!1100056 c!108972) b!1100053))

(assert (= (and b!1100056 (not c!108972)) b!1100054))

(assert (= (and b!1100053 res!733735) b!1100055))

(assert (= (or b!1100055 b!1100054) bm!46012))

(declare-fun m!1020139 () Bool)

(assert (=> bm!46012 m!1020139))

(assert (=> b!1100053 m!1019961))

(declare-fun m!1020141 () Bool)

(assert (=> b!1100053 m!1020141))

(declare-fun m!1020143 () Bool)

(assert (=> b!1100053 m!1020143))

(assert (=> b!1100053 m!1019961))

(declare-fun m!1020145 () Bool)

(assert (=> b!1100053 m!1020145))

(assert (=> b!1100056 m!1019961))

(assert (=> b!1100056 m!1019961))

(assert (=> b!1100056 m!1019965))

(assert (=> b!1099781 d!130909))

(declare-fun d!130911 () Bool)

(assert (=> d!130911 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96824 d!130911))

(declare-fun d!130913 () Bool)

(assert (=> d!130913 (= (array_inv!26428 _keys!1070) (bvsge (size!34812 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96824 d!130913))

(declare-fun d!130915 () Bool)

(assert (=> d!130915 (= (array_inv!26429 _values!874) (bvsge (size!34813 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96824 d!130915))

(declare-fun d!130917 () Bool)

(declare-fun e!627970 () Bool)

(assert (=> d!130917 e!627970))

(declare-fun res!733740 () Bool)

(assert (=> d!130917 (=> (not res!733740) (not e!627970))))

(declare-fun lt!492119 () ListLongMap!15299)

(assert (=> d!130917 (= res!733740 (contains!6411 lt!492119 (_1!8672 lt!491889)))))

(declare-fun lt!492122 () List!23945)

(assert (=> d!130917 (= lt!492119 (ListLongMap!15300 lt!492122))))

(declare-fun lt!492121 () Unit!36119)

(declare-fun lt!492120 () Unit!36119)

(assert (=> d!130917 (= lt!492121 lt!492120)))

(declare-datatypes ((Option!668 0))(
  ( (Some!667 (v!16249 V!41313)) (None!666) )
))
(declare-fun getValueByKey!617 (List!23945 (_ BitVec 64)) Option!668)

(assert (=> d!130917 (= (getValueByKey!617 lt!492122 (_1!8672 lt!491889)) (Some!667 (_2!8672 lt!491889)))))

(declare-fun lemmaContainsTupThenGetReturnValue!299 (List!23945 (_ BitVec 64) V!41313) Unit!36119)

(assert (=> d!130917 (= lt!492120 (lemmaContainsTupThenGetReturnValue!299 lt!492122 (_1!8672 lt!491889) (_2!8672 lt!491889)))))

(declare-fun insertStrictlySorted!392 (List!23945 (_ BitVec 64) V!41313) List!23945)

(assert (=> d!130917 (= lt!492122 (insertStrictlySorted!392 (toList!7665 lt!491888) (_1!8672 lt!491889) (_2!8672 lt!491889)))))

(assert (=> d!130917 (= (+!3399 lt!491888 lt!491889) lt!492119)))

(declare-fun b!1100061 () Bool)

(declare-fun res!733741 () Bool)

(assert (=> b!1100061 (=> (not res!733741) (not e!627970))))

(assert (=> b!1100061 (= res!733741 (= (getValueByKey!617 (toList!7665 lt!492119) (_1!8672 lt!491889)) (Some!667 (_2!8672 lt!491889))))))

(declare-fun b!1100062 () Bool)

(declare-fun contains!6412 (List!23945 tuple2!17322) Bool)

(assert (=> b!1100062 (= e!627970 (contains!6412 (toList!7665 lt!492119) lt!491889))))

(assert (= (and d!130917 res!733740) b!1100061))

(assert (= (and b!1100061 res!733741) b!1100062))

(declare-fun m!1020147 () Bool)

(assert (=> d!130917 m!1020147))

(declare-fun m!1020149 () Bool)

(assert (=> d!130917 m!1020149))

(declare-fun m!1020151 () Bool)

(assert (=> d!130917 m!1020151))

(declare-fun m!1020153 () Bool)

(assert (=> d!130917 m!1020153))

(declare-fun m!1020155 () Bool)

(assert (=> b!1100061 m!1020155))

(declare-fun m!1020157 () Bool)

(assert (=> b!1100062 m!1020157))

(assert (=> b!1099786 d!130917))

(declare-fun d!130919 () Bool)

(declare-fun e!627971 () Bool)

(assert (=> d!130919 e!627971))

(declare-fun res!733742 () Bool)

(assert (=> d!130919 (=> (not res!733742) (not e!627971))))

(declare-fun lt!492123 () ListLongMap!15299)

(assert (=> d!130919 (= res!733742 (contains!6411 lt!492123 (_1!8672 lt!491884)))))

(declare-fun lt!492126 () List!23945)

(assert (=> d!130919 (= lt!492123 (ListLongMap!15300 lt!492126))))

(declare-fun lt!492125 () Unit!36119)

(declare-fun lt!492124 () Unit!36119)

(assert (=> d!130919 (= lt!492125 lt!492124)))

(assert (=> d!130919 (= (getValueByKey!617 lt!492126 (_1!8672 lt!491884)) (Some!667 (_2!8672 lt!491884)))))

(assert (=> d!130919 (= lt!492124 (lemmaContainsTupThenGetReturnValue!299 lt!492126 (_1!8672 lt!491884) (_2!8672 lt!491884)))))

(assert (=> d!130919 (= lt!492126 (insertStrictlySorted!392 (toList!7665 (+!3399 lt!491888 lt!491889)) (_1!8672 lt!491884) (_2!8672 lt!491884)))))

(assert (=> d!130919 (= (+!3399 (+!3399 lt!491888 lt!491889) lt!491884) lt!492123)))

(declare-fun b!1100063 () Bool)

(declare-fun res!733743 () Bool)

(assert (=> b!1100063 (=> (not res!733743) (not e!627971))))

(assert (=> b!1100063 (= res!733743 (= (getValueByKey!617 (toList!7665 lt!492123) (_1!8672 lt!491884)) (Some!667 (_2!8672 lt!491884))))))

(declare-fun b!1100064 () Bool)

(assert (=> b!1100064 (= e!627971 (contains!6412 (toList!7665 lt!492123) lt!491884))))

(assert (= (and d!130919 res!733742) b!1100063))

(assert (= (and b!1100063 res!733743) b!1100064))

(declare-fun m!1020159 () Bool)

(assert (=> d!130919 m!1020159))

(declare-fun m!1020161 () Bool)

(assert (=> d!130919 m!1020161))

(declare-fun m!1020163 () Bool)

(assert (=> d!130919 m!1020163))

(declare-fun m!1020165 () Bool)

(assert (=> d!130919 m!1020165))

(declare-fun m!1020167 () Bool)

(assert (=> b!1100063 m!1020167))

(declare-fun m!1020169 () Bool)

(assert (=> b!1100064 m!1020169))

(assert (=> b!1099786 d!130919))

(declare-fun d!130921 () Bool)

(declare-fun lt!492127 () ListLongMap!15299)

(assert (=> d!130921 (not (contains!6411 lt!492127 k0!904))))

(assert (=> d!130921 (= lt!492127 (ListLongMap!15300 (removeStrictlySorted!79 (toList!7665 lt!491878) k0!904)))))

(assert (=> d!130921 (= (-!937 lt!491878 k0!904) lt!492127)))

(declare-fun bs!32294 () Bool)

(assert (= bs!32294 d!130921))

(declare-fun m!1020171 () Bool)

(assert (=> bs!32294 m!1020171))

(declare-fun m!1020173 () Bool)

(assert (=> bs!32294 m!1020173))

(assert (=> b!1099786 d!130921))

(declare-fun d!130923 () Bool)

(declare-fun e!627972 () Bool)

(assert (=> d!130923 e!627972))

(declare-fun res!733744 () Bool)

(assert (=> d!130923 (=> (not res!733744) (not e!627972))))

(declare-fun lt!492128 () ListLongMap!15299)

(assert (=> d!130923 (= res!733744 (contains!6411 lt!492128 (_1!8672 lt!491884)))))

(declare-fun lt!492131 () List!23945)

(assert (=> d!130923 (= lt!492128 (ListLongMap!15300 lt!492131))))

(declare-fun lt!492130 () Unit!36119)

(declare-fun lt!492129 () Unit!36119)

(assert (=> d!130923 (= lt!492130 lt!492129)))

(assert (=> d!130923 (= (getValueByKey!617 lt!492131 (_1!8672 lt!491884)) (Some!667 (_2!8672 lt!491884)))))

(assert (=> d!130923 (= lt!492129 (lemmaContainsTupThenGetReturnValue!299 lt!492131 (_1!8672 lt!491884) (_2!8672 lt!491884)))))

(assert (=> d!130923 (= lt!492131 (insertStrictlySorted!392 (toList!7665 lt!491882) (_1!8672 lt!491884) (_2!8672 lt!491884)))))

(assert (=> d!130923 (= (+!3399 lt!491882 lt!491884) lt!492128)))

(declare-fun b!1100065 () Bool)

(declare-fun res!733745 () Bool)

(assert (=> b!1100065 (=> (not res!733745) (not e!627972))))

(assert (=> b!1100065 (= res!733745 (= (getValueByKey!617 (toList!7665 lt!492128) (_1!8672 lt!491884)) (Some!667 (_2!8672 lt!491884))))))

(declare-fun b!1100066 () Bool)

(assert (=> b!1100066 (= e!627972 (contains!6412 (toList!7665 lt!492128) lt!491884))))

(assert (= (and d!130923 res!733744) b!1100065))

(assert (= (and b!1100065 res!733745) b!1100066))

(declare-fun m!1020175 () Bool)

(assert (=> d!130923 m!1020175))

(declare-fun m!1020177 () Bool)

(assert (=> d!130923 m!1020177))

(declare-fun m!1020179 () Bool)

(assert (=> d!130923 m!1020179))

(declare-fun m!1020181 () Bool)

(assert (=> d!130923 m!1020181))

(declare-fun m!1020183 () Bool)

(assert (=> b!1100065 m!1020183))

(declare-fun m!1020185 () Bool)

(assert (=> b!1100066 m!1020185))

(assert (=> b!1099786 d!130923))

(declare-fun d!130925 () Bool)

(declare-fun e!627973 () Bool)

(assert (=> d!130925 e!627973))

(declare-fun res!733746 () Bool)

(assert (=> d!130925 (=> (not res!733746) (not e!627973))))

(declare-fun lt!492132 () ListLongMap!15299)

(assert (=> d!130925 (= res!733746 (contains!6411 lt!492132 (_1!8672 lt!491889)))))

(declare-fun lt!492135 () List!23945)

(assert (=> d!130925 (= lt!492132 (ListLongMap!15300 lt!492135))))

(declare-fun lt!492134 () Unit!36119)

(declare-fun lt!492133 () Unit!36119)

(assert (=> d!130925 (= lt!492134 lt!492133)))

(assert (=> d!130925 (= (getValueByKey!617 lt!492135 (_1!8672 lt!491889)) (Some!667 (_2!8672 lt!491889)))))

(assert (=> d!130925 (= lt!492133 (lemmaContainsTupThenGetReturnValue!299 lt!492135 (_1!8672 lt!491889) (_2!8672 lt!491889)))))

(assert (=> d!130925 (= lt!492135 (insertStrictlySorted!392 (toList!7665 lt!491881) (_1!8672 lt!491889) (_2!8672 lt!491889)))))

(assert (=> d!130925 (= (+!3399 lt!491881 lt!491889) lt!492132)))

(declare-fun b!1100067 () Bool)

(declare-fun res!733747 () Bool)

(assert (=> b!1100067 (=> (not res!733747) (not e!627973))))

(assert (=> b!1100067 (= res!733747 (= (getValueByKey!617 (toList!7665 lt!492132) (_1!8672 lt!491889)) (Some!667 (_2!8672 lt!491889))))))

(declare-fun b!1100068 () Bool)

(assert (=> b!1100068 (= e!627973 (contains!6412 (toList!7665 lt!492132) lt!491889))))

(assert (= (and d!130925 res!733746) b!1100067))

(assert (= (and b!1100067 res!733747) b!1100068))

(declare-fun m!1020187 () Bool)

(assert (=> d!130925 m!1020187))

(declare-fun m!1020189 () Bool)

(assert (=> d!130925 m!1020189))

(declare-fun m!1020191 () Bool)

(assert (=> d!130925 m!1020191))

(declare-fun m!1020193 () Bool)

(assert (=> d!130925 m!1020193))

(declare-fun m!1020195 () Bool)

(assert (=> b!1100067 m!1020195))

(declare-fun m!1020197 () Bool)

(assert (=> b!1100068 m!1020197))

(assert (=> b!1099786 d!130925))

(declare-fun d!130927 () Bool)

(assert (=> d!130927 (= (-!937 (+!3399 lt!491881 (tuple2!17323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) k0!904) (+!3399 (-!937 lt!491881 k0!904) (tuple2!17323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)))))

(declare-fun lt!492138 () Unit!36119)

(declare-fun choose!1770 (ListLongMap!15299 (_ BitVec 64) V!41313 (_ BitVec 64)) Unit!36119)

(assert (=> d!130927 (= lt!492138 (choose!1770 lt!491881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (=> d!130927 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> d!130927 (= (addRemoveCommutativeForDiffKeys!116 lt!491881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904) lt!492138)))

(declare-fun bs!32295 () Bool)

(assert (= bs!32295 d!130927))

(declare-fun m!1020199 () Bool)

(assert (=> bs!32295 m!1020199))

(declare-fun m!1020201 () Bool)

(assert (=> bs!32295 m!1020201))

(declare-fun m!1020203 () Bool)

(assert (=> bs!32295 m!1020203))

(assert (=> bs!32295 m!1020199))

(assert (=> bs!32295 m!1019801))

(declare-fun m!1020205 () Bool)

(assert (=> bs!32295 m!1020205))

(assert (=> bs!32295 m!1019801))

(assert (=> b!1099786 d!130927))

(declare-fun d!130929 () Bool)

(declare-fun e!627974 () Bool)

(assert (=> d!130929 e!627974))

(declare-fun res!733748 () Bool)

(assert (=> d!130929 (=> (not res!733748) (not e!627974))))

(declare-fun lt!492139 () ListLongMap!15299)

(assert (=> d!130929 (= res!733748 (contains!6411 lt!492139 (_1!8672 lt!491889)))))

(declare-fun lt!492142 () List!23945)

(assert (=> d!130929 (= lt!492139 (ListLongMap!15300 lt!492142))))

(declare-fun lt!492141 () Unit!36119)

(declare-fun lt!492140 () Unit!36119)

(assert (=> d!130929 (= lt!492141 lt!492140)))

(assert (=> d!130929 (= (getValueByKey!617 lt!492142 (_1!8672 lt!491889)) (Some!667 (_2!8672 lt!491889)))))

(assert (=> d!130929 (= lt!492140 (lemmaContainsTupThenGetReturnValue!299 lt!492142 (_1!8672 lt!491889) (_2!8672 lt!491889)))))

(assert (=> d!130929 (= lt!492142 (insertStrictlySorted!392 (toList!7665 lt!491886) (_1!8672 lt!491889) (_2!8672 lt!491889)))))

(assert (=> d!130929 (= (+!3399 lt!491886 lt!491889) lt!492139)))

(declare-fun b!1100069 () Bool)

(declare-fun res!733749 () Bool)

(assert (=> b!1100069 (=> (not res!733749) (not e!627974))))

(assert (=> b!1100069 (= res!733749 (= (getValueByKey!617 (toList!7665 lt!492139) (_1!8672 lt!491889)) (Some!667 (_2!8672 lt!491889))))))

(declare-fun b!1100070 () Bool)

(assert (=> b!1100070 (= e!627974 (contains!6412 (toList!7665 lt!492139) lt!491889))))

(assert (= (and d!130929 res!733748) b!1100069))

(assert (= (and b!1100069 res!733749) b!1100070))

(declare-fun m!1020207 () Bool)

(assert (=> d!130929 m!1020207))

(declare-fun m!1020209 () Bool)

(assert (=> d!130929 m!1020209))

(declare-fun m!1020211 () Bool)

(assert (=> d!130929 m!1020211))

(declare-fun m!1020213 () Bool)

(assert (=> d!130929 m!1020213))

(declare-fun m!1020215 () Bool)

(assert (=> b!1100069 m!1020215))

(declare-fun m!1020217 () Bool)

(assert (=> b!1100070 m!1020217))

(assert (=> b!1099786 d!130929))

(declare-fun d!130931 () Bool)

(declare-fun e!627975 () Bool)

(assert (=> d!130931 e!627975))

(declare-fun res!733750 () Bool)

(assert (=> d!130931 (=> (not res!733750) (not e!627975))))

(declare-fun lt!492143 () ListLongMap!15299)

(assert (=> d!130931 (= res!733750 (contains!6411 lt!492143 (_1!8672 lt!491884)))))

(declare-fun lt!492146 () List!23945)

(assert (=> d!130931 (= lt!492143 (ListLongMap!15300 lt!492146))))

(declare-fun lt!492145 () Unit!36119)

(declare-fun lt!492144 () Unit!36119)

(assert (=> d!130931 (= lt!492145 lt!492144)))

(assert (=> d!130931 (= (getValueByKey!617 lt!492146 (_1!8672 lt!491884)) (Some!667 (_2!8672 lt!491884)))))

(assert (=> d!130931 (= lt!492144 (lemmaContainsTupThenGetReturnValue!299 lt!492146 (_1!8672 lt!491884) (_2!8672 lt!491884)))))

(assert (=> d!130931 (= lt!492146 (insertStrictlySorted!392 (toList!7665 lt!491878) (_1!8672 lt!491884) (_2!8672 lt!491884)))))

(assert (=> d!130931 (= (+!3399 lt!491878 lt!491884) lt!492143)))

(declare-fun b!1100071 () Bool)

(declare-fun res!733751 () Bool)

(assert (=> b!1100071 (=> (not res!733751) (not e!627975))))

(assert (=> b!1100071 (= res!733751 (= (getValueByKey!617 (toList!7665 lt!492143) (_1!8672 lt!491884)) (Some!667 (_2!8672 lt!491884))))))

(declare-fun b!1100072 () Bool)

(assert (=> b!1100072 (= e!627975 (contains!6412 (toList!7665 lt!492143) lt!491884))))

(assert (= (and d!130931 res!733750) b!1100071))

(assert (= (and b!1100071 res!733751) b!1100072))

(declare-fun m!1020219 () Bool)

(assert (=> d!130931 m!1020219))

(declare-fun m!1020221 () Bool)

(assert (=> d!130931 m!1020221))

(declare-fun m!1020223 () Bool)

(assert (=> d!130931 m!1020223))

(declare-fun m!1020225 () Bool)

(assert (=> d!130931 m!1020225))

(declare-fun m!1020227 () Bool)

(assert (=> b!1100071 m!1020227))

(declare-fun m!1020229 () Bool)

(assert (=> b!1100072 m!1020229))

(assert (=> b!1099786 d!130931))

(declare-fun b!1100080 () Bool)

(declare-fun e!627980 () Bool)

(assert (=> b!1100080 (= e!627980 tp_is_empty!27139)))

(declare-fun b!1100079 () Bool)

(declare-fun e!627981 () Bool)

(assert (=> b!1100079 (= e!627981 tp_is_empty!27139)))

(declare-fun condMapEmpty!42487 () Bool)

(declare-fun mapDefault!42487 () ValueCell!12860)

(assert (=> mapNonEmpty!42478 (= condMapEmpty!42487 (= mapRest!42478 ((as const (Array (_ BitVec 32) ValueCell!12860)) mapDefault!42487)))))

(declare-fun mapRes!42487 () Bool)

(assert (=> mapNonEmpty!42478 (= tp!81202 (and e!627980 mapRes!42487))))

(declare-fun mapNonEmpty!42487 () Bool)

(declare-fun tp!81218 () Bool)

(assert (=> mapNonEmpty!42487 (= mapRes!42487 (and tp!81218 e!627981))))

(declare-fun mapRest!42487 () (Array (_ BitVec 32) ValueCell!12860))

(declare-fun mapValue!42487 () ValueCell!12860)

(declare-fun mapKey!42487 () (_ BitVec 32))

(assert (=> mapNonEmpty!42487 (= mapRest!42478 (store mapRest!42487 mapKey!42487 mapValue!42487))))

(declare-fun mapIsEmpty!42487 () Bool)

(assert (=> mapIsEmpty!42487 mapRes!42487))

(assert (= (and mapNonEmpty!42478 condMapEmpty!42487) mapIsEmpty!42487))

(assert (= (and mapNonEmpty!42478 (not condMapEmpty!42487)) mapNonEmpty!42487))

(assert (= (and mapNonEmpty!42487 ((_ is ValueCellFull!12860) mapValue!42487)) b!1100079))

(assert (= (and mapNonEmpty!42478 ((_ is ValueCellFull!12860) mapDefault!42487)) b!1100080))

(declare-fun m!1020231 () Bool)

(assert (=> mapNonEmpty!42487 m!1020231))

(declare-fun b_lambda!17869 () Bool)

(assert (= b_lambda!17863 (or (and start!96824 b_free!23089) b_lambda!17869)))

(declare-fun b_lambda!17871 () Bool)

(assert (= b_lambda!17865 (or (and start!96824 b_free!23089) b_lambda!17871)))

(declare-fun b_lambda!17873 () Bool)

(assert (= b_lambda!17867 (or (and start!96824 b_free!23089) b_lambda!17873)))

(declare-fun b_lambda!17875 () Bool)

(assert (= b_lambda!17857 (or (and start!96824 b_free!23089) b_lambda!17875)))

(declare-fun b_lambda!17877 () Bool)

(assert (= b_lambda!17859 (or (and start!96824 b_free!23089) b_lambda!17877)))

(declare-fun b_lambda!17879 () Bool)

(assert (= b_lambda!17861 (or (and start!96824 b_free!23089) b_lambda!17879)))

(declare-fun b_lambda!17881 () Bool)

(assert (= b_lambda!17855 (or (and start!96824 b_free!23089) b_lambda!17881)))

(check-sat (not d!130921) (not b!1099939) (not b!1100036) (not b!1100029) (not b!1100056) (not b!1100039) (not d!130925) (not bm!45990) (not b!1100065) (not d!130929) (not b!1100071) (not b!1099995) (not b!1099987) (not b!1100072) (not bm!46004) (not b!1100022) (not b!1099938) (not d!130891) (not d!130923) (not b!1099950) (not b!1100014) (not b!1099992) (not b!1099986) (not d!130927) (not b!1099894) (not b!1100038) (not b!1100049) (not b_lambda!17871) (not d!130919) (not d!130917) (not b!1100069) (not b!1099999) (not b!1100063) (not d!130901) (not b!1099945) (not bm!46000) (not b!1099983) (not bm!46012) (not b!1099998) (not bm!46008) (not b!1099886) (not d!130889) (not bm!46006) (not b!1100004) (not b!1100028) (not b_lambda!17877) (not bm!45969) (not b!1100062) (not b_lambda!17875) (not b!1099955) (not d!130895) (not b!1100064) (not b!1100023) (not b!1100061) (not d!130899) (not b!1100067) (not b!1100052) (not b_lambda!17853) (not b_lambda!17881) (not d!130931) (not b!1100016) (not bm!45999) (not b_next!23089) (not b!1099951) (not bm!46007) (not b!1100003) (not b!1099988) b_and!36917 (not b!1100053) (not b!1100017) (not b!1099884) (not bm!45987) (not b!1099887) (not b!1099944) (not b!1100033) (not b!1099996) (not b!1100000) (not b!1100068) (not b!1099990) (not bm!45993) (not b!1100002) (not b_lambda!17879) (not d!130897) (not b_lambda!17873) (not d!130893) (not b_lambda!17869) (not b!1100066) (not mapNonEmpty!42487) (not bm!45989) (not b!1100070) (not b!1099984) (not bm!45994) (not b!1099949) (not bm!46011) (not bm!45984) (not b!1099991) (not bm!46001) tp_is_empty!27139 (not b!1100027))
(check-sat b_and!36917 (not b_next!23089))
