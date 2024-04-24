; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84908 () Bool)

(assert start!84908)

(declare-fun b_free!20095 () Bool)

(declare-fun b_next!20095 () Bool)

(assert (=> start!84908 (= b_free!20095 (not b_next!20095))))

(declare-fun tp!70084 () Bool)

(declare-fun b_and!32275 () Bool)

(assert (=> start!84908 (= tp!70084 b_and!32275)))

(declare-fun b!991882 () Bool)

(declare-fun e!559387 () Bool)

(declare-fun e!559386 () Bool)

(declare-fun mapRes!37019 () Bool)

(assert (=> b!991882 (= e!559387 (and e!559386 mapRes!37019))))

(declare-fun condMapEmpty!37019 () Bool)

(declare-datatypes ((V!36065 0))(
  ( (V!36066 (val!11706 Int)) )
))
(declare-datatypes ((ValueCell!11174 0))(
  ( (ValueCellFull!11174 (v!14276 V!36065)) (EmptyCell!11174) )
))
(declare-datatypes ((array!62630 0))(
  ( (array!62631 (arr!30161 (Array (_ BitVec 32) ValueCell!11174)) (size!30641 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62630)

(declare-fun mapDefault!37019 () ValueCell!11174)

(assert (=> b!991882 (= condMapEmpty!37019 (= (arr!30161 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11174)) mapDefault!37019)))))

(declare-fun mapIsEmpty!37019 () Bool)

(assert (=> mapIsEmpty!37019 mapRes!37019))

(declare-fun b!991883 () Bool)

(declare-fun res!662889 () Bool)

(declare-fun e!559390 () Bool)

(assert (=> b!991883 (=> (not res!662889) (not e!559390))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62632 0))(
  ( (array!62633 (arr!30162 (Array (_ BitVec 32) (_ BitVec 64))) (size!30642 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62632)

(assert (=> b!991883 (= res!662889 (and (= (size!30641 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30642 _keys!1544) (size!30641 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!991884 () Bool)

(declare-fun res!662891 () Bool)

(assert (=> b!991884 (=> (not res!662891) (not e!559390))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!991884 (= res!662891 (validKeyInArray!0 (select (arr!30162 _keys!1544) from!1932)))))

(declare-fun b!991885 () Bool)

(declare-fun res!662888 () Bool)

(assert (=> b!991885 (=> (not res!662888) (not e!559390))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62632 (_ BitVec 32)) Bool)

(assert (=> b!991885 (= res!662888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!991886 () Bool)

(declare-fun e!559391 () Bool)

(assert (=> b!991886 (= e!559390 e!559391)))

(declare-fun res!662892 () Bool)

(assert (=> b!991886 (=> (not res!662892) (not e!559391))))

(declare-fun lt!440070 () Bool)

(assert (=> b!991886 (= res!662892 (and (or lt!440070 (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (or lt!440070 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (or (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not lt!440070))))))

(assert (=> b!991886 (= lt!440070 (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!991887 () Bool)

(declare-fun tp_is_empty!23311 () Bool)

(assert (=> b!991887 (= e!559386 tp_is_empty!23311)))

(declare-fun b!991888 () Bool)

(declare-fun res!662890 () Bool)

(assert (=> b!991888 (=> (not res!662890) (not e!559390))))

(assert (=> b!991888 (= res!662890 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30642 _keys!1544))))))

(declare-fun mapNonEmpty!37019 () Bool)

(declare-fun tp!70085 () Bool)

(declare-fun e!559388 () Bool)

(assert (=> mapNonEmpty!37019 (= mapRes!37019 (and tp!70085 e!559388))))

(declare-fun mapRest!37019 () (Array (_ BitVec 32) ValueCell!11174))

(declare-fun mapKey!37019 () (_ BitVec 32))

(declare-fun mapValue!37019 () ValueCell!11174)

(assert (=> mapNonEmpty!37019 (= (arr!30161 _values!1278) (store mapRest!37019 mapKey!37019 mapValue!37019))))

(declare-fun b!991881 () Bool)

(assert (=> b!991881 (= e!559388 tp_is_empty!23311)))

(declare-fun res!662894 () Bool)

(assert (=> start!84908 (=> (not res!662894) (not e!559390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84908 (= res!662894 (validMask!0 mask!1948))))

(assert (=> start!84908 e!559390))

(assert (=> start!84908 true))

(assert (=> start!84908 tp_is_empty!23311))

(declare-fun array_inv!23319 (array!62630) Bool)

(assert (=> start!84908 (and (array_inv!23319 _values!1278) e!559387)))

(assert (=> start!84908 tp!70084))

(declare-fun array_inv!23320 (array!62632) Bool)

(assert (=> start!84908 (array_inv!23320 _keys!1544)))

(declare-fun minValue!1220 () V!36065)

(declare-fun b!991889 () Bool)

(declare-fun zeroValue!1220 () V!36065)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14936 0))(
  ( (tuple2!14937 (_1!7479 (_ BitVec 64)) (_2!7479 V!36065)) )
))
(declare-datatypes ((List!20844 0))(
  ( (Nil!20841) (Cons!20840 (h!22008 tuple2!14936) (t!29815 List!20844)) )
))
(declare-datatypes ((ListLongMap!13635 0))(
  ( (ListLongMap!13636 (toList!6833 List!20844)) )
))
(declare-fun getCurrentListMap!3880 (array!62632 array!62630 (_ BitVec 32) (_ BitVec 32) V!36065 V!36065 (_ BitVec 32) Int) ListLongMap!13635)

(declare-fun +!3118 (ListLongMap!13635 tuple2!14936) ListLongMap!13635)

(declare-fun get!15682 (ValueCell!11174 V!36065) V!36065)

(declare-fun dynLambda!1902 (Int (_ BitVec 64)) V!36065)

(assert (=> b!991889 (= e!559391 (not (= (getCurrentListMap!3880 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) (+!3118 (getCurrentListMap!3880 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!991890 () Bool)

(declare-fun res!662893 () Bool)

(assert (=> b!991890 (=> (not res!662893) (not e!559390))))

(declare-datatypes ((List!20845 0))(
  ( (Nil!20842) (Cons!20841 (h!22009 (_ BitVec 64)) (t!29816 List!20845)) )
))
(declare-fun arrayNoDuplicates!0 (array!62632 (_ BitVec 32) List!20845) Bool)

(assert (=> b!991890 (= res!662893 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20842))))

(assert (= (and start!84908 res!662894) b!991883))

(assert (= (and b!991883 res!662889) b!991885))

(assert (= (and b!991885 res!662888) b!991890))

(assert (= (and b!991890 res!662893) b!991888))

(assert (= (and b!991888 res!662890) b!991884))

(assert (= (and b!991884 res!662891) b!991886))

(assert (= (and b!991886 res!662892) b!991889))

(assert (= (and b!991882 condMapEmpty!37019) mapIsEmpty!37019))

(assert (= (and b!991882 (not condMapEmpty!37019)) mapNonEmpty!37019))

(get-info :version)

(assert (= (and mapNonEmpty!37019 ((_ is ValueCellFull!11174) mapValue!37019)) b!991881))

(assert (= (and b!991882 ((_ is ValueCellFull!11174) mapDefault!37019)) b!991887))

(assert (= start!84908 b!991882))

(declare-fun b_lambda!15211 () Bool)

(assert (=> (not b_lambda!15211) (not b!991889)))

(declare-fun t!29814 () Bool)

(declare-fun tb!6821 () Bool)

(assert (=> (and start!84908 (= defaultEntry!1281 defaultEntry!1281) t!29814) tb!6821))

(declare-fun result!13653 () Bool)

(assert (=> tb!6821 (= result!13653 tp_is_empty!23311)))

(assert (=> b!991889 t!29814))

(declare-fun b_and!32277 () Bool)

(assert (= b_and!32275 (and (=> t!29814 result!13653) b_and!32277)))

(declare-fun m!920023 () Bool)

(assert (=> b!991885 m!920023))

(declare-fun m!920025 () Bool)

(assert (=> start!84908 m!920025))

(declare-fun m!920027 () Bool)

(assert (=> start!84908 m!920027))

(declare-fun m!920029 () Bool)

(assert (=> start!84908 m!920029))

(declare-fun m!920031 () Bool)

(assert (=> mapNonEmpty!37019 m!920031))

(declare-fun m!920033 () Bool)

(assert (=> b!991889 m!920033))

(declare-fun m!920035 () Bool)

(assert (=> b!991889 m!920035))

(declare-fun m!920037 () Bool)

(assert (=> b!991889 m!920037))

(assert (=> b!991889 m!920037))

(declare-fun m!920039 () Bool)

(assert (=> b!991889 m!920039))

(declare-fun m!920041 () Bool)

(assert (=> b!991889 m!920041))

(declare-fun m!920043 () Bool)

(assert (=> b!991889 m!920043))

(assert (=> b!991889 m!920035))

(assert (=> b!991889 m!920043))

(declare-fun m!920045 () Bool)

(assert (=> b!991889 m!920045))

(assert (=> b!991884 m!920033))

(assert (=> b!991884 m!920033))

(declare-fun m!920047 () Bool)

(assert (=> b!991884 m!920047))

(declare-fun m!920049 () Bool)

(assert (=> b!991890 m!920049))

(check-sat (not b_next!20095) (not b!991884) (not b!991885) (not b!991890) (not start!84908) tp_is_empty!23311 b_and!32277 (not mapNonEmpty!37019) (not b_lambda!15211) (not b!991889))
(check-sat b_and!32277 (not b_next!20095))
(get-model)

(declare-fun b_lambda!15217 () Bool)

(assert (= b_lambda!15211 (or (and start!84908 b_free!20095) b_lambda!15217)))

(check-sat (not b_next!20095) (not b!991884) (not b!991885) (not b_lambda!15217) (not b!991889) (not b!991890) (not start!84908) tp_is_empty!23311 b_and!32277 (not mapNonEmpty!37019))
(check-sat b_and!32277 (not b_next!20095))
(get-model)

(declare-fun b!991999 () Bool)

(declare-fun res!662962 () Bool)

(declare-fun e!559454 () Bool)

(assert (=> b!991999 (=> (not res!662962) (not e!559454))))

(declare-fun e!559456 () Bool)

(assert (=> b!991999 (= res!662962 e!559456)))

(declare-fun c!100828 () Bool)

(assert (=> b!991999 (= c!100828 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!992000 () Bool)

(declare-fun e!559460 () Bool)

(assert (=> b!992000 (= e!559456 e!559460)))

(declare-fun res!662961 () Bool)

(declare-fun call!42087 () Bool)

(assert (=> b!992000 (= res!662961 call!42087)))

(assert (=> b!992000 (=> (not res!662961) (not e!559460))))

(declare-fun bm!42081 () Bool)

(declare-fun call!42090 () ListLongMap!13635)

(declare-fun call!42086 () ListLongMap!13635)

(assert (=> bm!42081 (= call!42090 call!42086)))

(declare-fun call!42088 () ListLongMap!13635)

(declare-fun bm!42082 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3558 (array!62632 array!62630 (_ BitVec 32) (_ BitVec 32) V!36065 V!36065 (_ BitVec 32) Int) ListLongMap!13635)

(assert (=> bm!42082 (= call!42088 (getCurrentListMapNoExtraKeys!3558 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun bm!42083 () Bool)

(declare-fun call!42084 () ListLongMap!13635)

(assert (=> bm!42083 (= call!42084 call!42088)))

(declare-fun bm!42084 () Bool)

(declare-fun call!42085 () Bool)

(declare-fun lt!440125 () ListLongMap!13635)

(declare-fun contains!5748 (ListLongMap!13635 (_ BitVec 64)) Bool)

(assert (=> bm!42084 (= call!42085 (contains!5748 lt!440125 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!992001 () Bool)

(declare-datatypes ((Unit!32870 0))(
  ( (Unit!32871) )
))
(declare-fun e!559459 () Unit!32870)

(declare-fun Unit!32872 () Unit!32870)

(assert (=> b!992001 (= e!559459 Unit!32872)))

(declare-fun b!992002 () Bool)

(declare-fun e!559466 () Bool)

(declare-fun e!559463 () Bool)

(assert (=> b!992002 (= e!559466 e!559463)))

(declare-fun res!662958 () Bool)

(assert (=> b!992002 (= res!662958 call!42085)))

(assert (=> b!992002 (=> (not res!662958) (not e!559463))))

(declare-fun d!118107 () Bool)

(assert (=> d!118107 e!559454))

(declare-fun res!662957 () Bool)

(assert (=> d!118107 (=> (not res!662957) (not e!559454))))

(assert (=> d!118107 (= res!662957 (or (bvsge from!1932 (size!30642 _keys!1544)) (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30642 _keys!1544)))))))

(declare-fun lt!440121 () ListLongMap!13635)

(assert (=> d!118107 (= lt!440125 lt!440121)))

(declare-fun lt!440141 () Unit!32870)

(assert (=> d!118107 (= lt!440141 e!559459)))

(declare-fun c!100830 () Bool)

(declare-fun e!559461 () Bool)

(assert (=> d!118107 (= c!100830 e!559461)))

(declare-fun res!662955 () Bool)

(assert (=> d!118107 (=> (not res!662955) (not e!559461))))

(assert (=> d!118107 (= res!662955 (bvslt from!1932 (size!30642 _keys!1544)))))

(declare-fun e!559462 () ListLongMap!13635)

(assert (=> d!118107 (= lt!440121 e!559462)))

(declare-fun c!100831 () Bool)

(assert (=> d!118107 (= c!100831 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!118107 (validMask!0 mask!1948)))

(assert (=> d!118107 (= (getCurrentListMap!3880 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) lt!440125)))

(declare-fun b!992003 () Bool)

(declare-fun e!559455 () ListLongMap!13635)

(assert (=> b!992003 (= e!559462 e!559455)))

(declare-fun c!100832 () Bool)

(assert (=> b!992003 (= c!100832 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!42085 () Bool)

(declare-fun call!42089 () ListLongMap!13635)

(assert (=> bm!42085 (= call!42089 call!42084)))

(declare-fun b!992004 () Bool)

(assert (=> b!992004 (= e!559466 (not call!42085))))

(declare-fun b!992005 () Bool)

(assert (=> b!992005 (= e!559461 (validKeyInArray!0 (select (arr!30162 _keys!1544) from!1932)))))

(declare-fun b!992006 () Bool)

(declare-fun apply!907 (ListLongMap!13635 (_ BitVec 64)) V!36065)

(assert (=> b!992006 (= e!559463 (= (apply!907 lt!440125 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1220))))

(declare-fun b!992007 () Bool)

(declare-fun e!559457 () Bool)

(declare-fun e!559464 () Bool)

(assert (=> b!992007 (= e!559457 e!559464)))

(declare-fun res!662960 () Bool)

(assert (=> b!992007 (=> (not res!662960) (not e!559464))))

(assert (=> b!992007 (= res!662960 (contains!5748 lt!440125 (select (arr!30162 _keys!1544) from!1932)))))

(assert (=> b!992007 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30642 _keys!1544)))))

(declare-fun b!992008 () Bool)

(assert (=> b!992008 (= e!559456 (not call!42087))))

(declare-fun b!992009 () Bool)

(assert (=> b!992009 (= e!559460 (= (apply!907 lt!440125 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1220))))

(declare-fun b!992010 () Bool)

(declare-fun e!559465 () ListLongMap!13635)

(assert (=> b!992010 (= e!559465 call!42089)))

(declare-fun b!992011 () Bool)

(declare-fun lt!440132 () Unit!32870)

(assert (=> b!992011 (= e!559459 lt!440132)))

(declare-fun lt!440123 () ListLongMap!13635)

(assert (=> b!992011 (= lt!440123 (getCurrentListMapNoExtraKeys!3558 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!440129 () (_ BitVec 64))

(assert (=> b!992011 (= lt!440129 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!440124 () (_ BitVec 64))

(assert (=> b!992011 (= lt!440124 (select (arr!30162 _keys!1544) from!1932))))

(declare-fun lt!440140 () Unit!32870)

(declare-fun addStillContains!617 (ListLongMap!13635 (_ BitVec 64) V!36065 (_ BitVec 64)) Unit!32870)

(assert (=> b!992011 (= lt!440140 (addStillContains!617 lt!440123 lt!440129 zeroValue!1220 lt!440124))))

(assert (=> b!992011 (contains!5748 (+!3118 lt!440123 (tuple2!14937 lt!440129 zeroValue!1220)) lt!440124)))

(declare-fun lt!440136 () Unit!32870)

(assert (=> b!992011 (= lt!440136 lt!440140)))

(declare-fun lt!440139 () ListLongMap!13635)

(assert (=> b!992011 (= lt!440139 (getCurrentListMapNoExtraKeys!3558 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!440128 () (_ BitVec 64))

(assert (=> b!992011 (= lt!440128 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!440127 () (_ BitVec 64))

(assert (=> b!992011 (= lt!440127 (select (arr!30162 _keys!1544) from!1932))))

(declare-fun lt!440126 () Unit!32870)

(declare-fun addApplyDifferent!473 (ListLongMap!13635 (_ BitVec 64) V!36065 (_ BitVec 64)) Unit!32870)

(assert (=> b!992011 (= lt!440126 (addApplyDifferent!473 lt!440139 lt!440128 minValue!1220 lt!440127))))

(assert (=> b!992011 (= (apply!907 (+!3118 lt!440139 (tuple2!14937 lt!440128 minValue!1220)) lt!440127) (apply!907 lt!440139 lt!440127))))

(declare-fun lt!440138 () Unit!32870)

(assert (=> b!992011 (= lt!440138 lt!440126)))

(declare-fun lt!440133 () ListLongMap!13635)

(assert (=> b!992011 (= lt!440133 (getCurrentListMapNoExtraKeys!3558 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!440130 () (_ BitVec 64))

(assert (=> b!992011 (= lt!440130 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!440134 () (_ BitVec 64))

(assert (=> b!992011 (= lt!440134 (select (arr!30162 _keys!1544) from!1932))))

(declare-fun lt!440131 () Unit!32870)

(assert (=> b!992011 (= lt!440131 (addApplyDifferent!473 lt!440133 lt!440130 zeroValue!1220 lt!440134))))

(assert (=> b!992011 (= (apply!907 (+!3118 lt!440133 (tuple2!14937 lt!440130 zeroValue!1220)) lt!440134) (apply!907 lt!440133 lt!440134))))

(declare-fun lt!440122 () Unit!32870)

(assert (=> b!992011 (= lt!440122 lt!440131)))

(declare-fun lt!440135 () ListLongMap!13635)

(assert (=> b!992011 (= lt!440135 (getCurrentListMapNoExtraKeys!3558 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!440137 () (_ BitVec 64))

(assert (=> b!992011 (= lt!440137 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!440142 () (_ BitVec 64))

(assert (=> b!992011 (= lt!440142 (select (arr!30162 _keys!1544) from!1932))))

(assert (=> b!992011 (= lt!440132 (addApplyDifferent!473 lt!440135 lt!440137 minValue!1220 lt!440142))))

(assert (=> b!992011 (= (apply!907 (+!3118 lt!440135 (tuple2!14937 lt!440137 minValue!1220)) lt!440142) (apply!907 lt!440135 lt!440142))))

(declare-fun b!992012 () Bool)

(assert (=> b!992012 (= e!559454 e!559466)))

(declare-fun c!100829 () Bool)

(assert (=> b!992012 (= c!100829 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!42086 () Bool)

(assert (=> bm!42086 (= call!42087 (contains!5748 lt!440125 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!992013 () Bool)

(assert (=> b!992013 (= e!559455 call!42090)))

(declare-fun b!992014 () Bool)

(declare-fun c!100827 () Bool)

(assert (=> b!992014 (= c!100827 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!992014 (= e!559455 e!559465)))

(declare-fun b!992015 () Bool)

(assert (=> b!992015 (= e!559465 call!42090)))

(declare-fun b!992016 () Bool)

(declare-fun res!662959 () Bool)

(assert (=> b!992016 (=> (not res!662959) (not e!559454))))

(assert (=> b!992016 (= res!662959 e!559457)))

(declare-fun res!662963 () Bool)

(assert (=> b!992016 (=> res!662963 e!559457)))

(declare-fun e!559458 () Bool)

(assert (=> b!992016 (= res!662963 (not e!559458))))

(declare-fun res!662956 () Bool)

(assert (=> b!992016 (=> (not res!662956) (not e!559458))))

(assert (=> b!992016 (= res!662956 (bvslt from!1932 (size!30642 _keys!1544)))))

(declare-fun b!992017 () Bool)

(assert (=> b!992017 (= e!559458 (validKeyInArray!0 (select (arr!30162 _keys!1544) from!1932)))))

(declare-fun b!992018 () Bool)

(assert (=> b!992018 (= e!559462 (+!3118 call!42086 (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun b!992019 () Bool)

(assert (=> b!992019 (= e!559464 (= (apply!907 lt!440125 (select (arr!30162 _keys!1544) from!1932)) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!992019 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30641 _values!1278)))))

(assert (=> b!992019 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30642 _keys!1544)))))

(declare-fun bm!42087 () Bool)

(assert (=> bm!42087 (= call!42086 (+!3118 (ite c!100831 call!42088 (ite c!100832 call!42084 call!42089)) (ite (or c!100831 c!100832) (tuple2!14937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!118107 c!100831) b!992018))

(assert (= (and d!118107 (not c!100831)) b!992003))

(assert (= (and b!992003 c!100832) b!992013))

(assert (= (and b!992003 (not c!100832)) b!992014))

(assert (= (and b!992014 c!100827) b!992015))

(assert (= (and b!992014 (not c!100827)) b!992010))

(assert (= (or b!992015 b!992010) bm!42085))

(assert (= (or b!992013 bm!42085) bm!42083))

(assert (= (or b!992013 b!992015) bm!42081))

(assert (= (or b!992018 bm!42083) bm!42082))

(assert (= (or b!992018 bm!42081) bm!42087))

(assert (= (and d!118107 res!662955) b!992005))

(assert (= (and d!118107 c!100830) b!992011))

(assert (= (and d!118107 (not c!100830)) b!992001))

(assert (= (and d!118107 res!662957) b!992016))

(assert (= (and b!992016 res!662956) b!992017))

(assert (= (and b!992016 (not res!662963)) b!992007))

(assert (= (and b!992007 res!662960) b!992019))

(assert (= (and b!992016 res!662959) b!991999))

(assert (= (and b!991999 c!100828) b!992000))

(assert (= (and b!991999 (not c!100828)) b!992008))

(assert (= (and b!992000 res!662961) b!992009))

(assert (= (or b!992000 b!992008) bm!42086))

(assert (= (and b!991999 res!662962) b!992012))

(assert (= (and b!992012 c!100829) b!992002))

(assert (= (and b!992012 (not c!100829)) b!992004))

(assert (= (and b!992002 res!662958) b!992006))

(assert (= (or b!992002 b!992004) bm!42084))

(declare-fun b_lambda!15219 () Bool)

(assert (=> (not b_lambda!15219) (not b!992019)))

(assert (=> b!992019 t!29814))

(declare-fun b_and!32287 () Bool)

(assert (= b_and!32277 (and (=> t!29814 result!13653) b_and!32287)))

(declare-fun m!920107 () Bool)

(assert (=> b!992009 m!920107))

(assert (=> b!992007 m!920033))

(assert (=> b!992007 m!920033))

(declare-fun m!920109 () Bool)

(assert (=> b!992007 m!920109))

(declare-fun m!920111 () Bool)

(assert (=> b!992018 m!920111))

(assert (=> b!992017 m!920033))

(assert (=> b!992017 m!920033))

(assert (=> b!992017 m!920047))

(declare-fun m!920113 () Bool)

(assert (=> bm!42087 m!920113))

(assert (=> d!118107 m!920025))

(declare-fun m!920115 () Bool)

(assert (=> bm!42086 m!920115))

(declare-fun m!920117 () Bool)

(assert (=> b!992011 m!920117))

(declare-fun m!920119 () Bool)

(assert (=> b!992011 m!920119))

(declare-fun m!920121 () Bool)

(assert (=> b!992011 m!920121))

(declare-fun m!920123 () Bool)

(assert (=> b!992011 m!920123))

(assert (=> b!992011 m!920033))

(declare-fun m!920125 () Bool)

(assert (=> b!992011 m!920125))

(declare-fun m!920127 () Bool)

(assert (=> b!992011 m!920127))

(declare-fun m!920129 () Bool)

(assert (=> b!992011 m!920129))

(declare-fun m!920131 () Bool)

(assert (=> b!992011 m!920131))

(declare-fun m!920133 () Bool)

(assert (=> b!992011 m!920133))

(declare-fun m!920135 () Bool)

(assert (=> b!992011 m!920135))

(declare-fun m!920137 () Bool)

(assert (=> b!992011 m!920137))

(assert (=> b!992011 m!920123))

(declare-fun m!920139 () Bool)

(assert (=> b!992011 m!920139))

(declare-fun m!920141 () Bool)

(assert (=> b!992011 m!920141))

(declare-fun m!920143 () Bool)

(assert (=> b!992011 m!920143))

(assert (=> b!992011 m!920129))

(declare-fun m!920145 () Bool)

(assert (=> b!992011 m!920145))

(assert (=> b!992011 m!920125))

(declare-fun m!920147 () Bool)

(assert (=> b!992011 m!920147))

(assert (=> b!992011 m!920141))

(declare-fun m!920149 () Bool)

(assert (=> bm!42084 m!920149))

(assert (=> b!992019 m!920035))

(assert (=> b!992019 m!920033))

(declare-fun m!920151 () Bool)

(assert (=> b!992019 m!920151))

(assert (=> b!992019 m!920035))

(assert (=> b!992019 m!920043))

(assert (=> b!992019 m!920045))

(assert (=> b!992019 m!920043))

(assert (=> b!992019 m!920033))

(assert (=> b!992005 m!920033))

(assert (=> b!992005 m!920033))

(assert (=> b!992005 m!920047))

(declare-fun m!920153 () Bool)

(assert (=> b!992006 m!920153))

(assert (=> bm!42082 m!920135))

(assert (=> b!991889 d!118107))

(declare-fun d!118109 () Bool)

(declare-fun e!559469 () Bool)

(assert (=> d!118109 e!559469))

(declare-fun res!662969 () Bool)

(assert (=> d!118109 (=> (not res!662969) (not e!559469))))

(declare-fun lt!440153 () ListLongMap!13635)

(assert (=> d!118109 (= res!662969 (contains!5748 lt!440153 (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!440152 () List!20844)

(assert (=> d!118109 (= lt!440153 (ListLongMap!13636 lt!440152))))

(declare-fun lt!440151 () Unit!32870)

(declare-fun lt!440154 () Unit!32870)

(assert (=> d!118109 (= lt!440151 lt!440154)))

(declare-datatypes ((Option!519 0))(
  ( (Some!518 (v!14279 V!36065)) (None!517) )
))
(declare-fun getValueByKey!513 (List!20844 (_ BitVec 64)) Option!519)

(assert (=> d!118109 (= (getValueByKey!513 lt!440152 (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!518 (_2!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!275 (List!20844 (_ BitVec 64) V!36065) Unit!32870)

(assert (=> d!118109 (= lt!440154 (lemmaContainsTupThenGetReturnValue!275 lt!440152 (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!332 (List!20844 (_ BitVec 64) V!36065) List!20844)

(assert (=> d!118109 (= lt!440152 (insertStrictlySorted!332 (toList!6833 (getCurrentListMap!3880 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!118109 (= (+!3118 (getCurrentListMap!3880 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!440153)))

(declare-fun b!992024 () Bool)

(declare-fun res!662968 () Bool)

(assert (=> b!992024 (=> (not res!662968) (not e!559469))))

(assert (=> b!992024 (= res!662968 (= (getValueByKey!513 (toList!6833 lt!440153) (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!518 (_2!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!992025 () Bool)

(declare-fun contains!5749 (List!20844 tuple2!14936) Bool)

(assert (=> b!992025 (= e!559469 (contains!5749 (toList!6833 lt!440153) (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!118109 res!662969) b!992024))

(assert (= (and b!992024 res!662968) b!992025))

(declare-fun m!920155 () Bool)

(assert (=> d!118109 m!920155))

(declare-fun m!920157 () Bool)

(assert (=> d!118109 m!920157))

(declare-fun m!920159 () Bool)

(assert (=> d!118109 m!920159))

(declare-fun m!920161 () Bool)

(assert (=> d!118109 m!920161))

(declare-fun m!920163 () Bool)

(assert (=> b!992024 m!920163))

(declare-fun m!920165 () Bool)

(assert (=> b!992025 m!920165))

(assert (=> b!991889 d!118109))

(declare-fun b!992026 () Bool)

(declare-fun res!662977 () Bool)

(declare-fun e!559470 () Bool)

(assert (=> b!992026 (=> (not res!662977) (not e!559470))))

(declare-fun e!559472 () Bool)

(assert (=> b!992026 (= res!662977 e!559472)))

(declare-fun c!100834 () Bool)

(assert (=> b!992026 (= c!100834 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!992027 () Bool)

(declare-fun e!559476 () Bool)

(assert (=> b!992027 (= e!559472 e!559476)))

(declare-fun res!662976 () Bool)

(declare-fun call!42094 () Bool)

(assert (=> b!992027 (= res!662976 call!42094)))

(assert (=> b!992027 (=> (not res!662976) (not e!559476))))

(declare-fun bm!42088 () Bool)

(declare-fun call!42097 () ListLongMap!13635)

(declare-fun call!42093 () ListLongMap!13635)

(assert (=> bm!42088 (= call!42097 call!42093)))

(declare-fun call!42095 () ListLongMap!13635)

(declare-fun bm!42089 () Bool)

(assert (=> bm!42089 (= call!42095 (getCurrentListMapNoExtraKeys!3558 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun bm!42090 () Bool)

(declare-fun call!42091 () ListLongMap!13635)

(assert (=> bm!42090 (= call!42091 call!42095)))

(declare-fun bm!42091 () Bool)

(declare-fun call!42092 () Bool)

(declare-fun lt!440159 () ListLongMap!13635)

(assert (=> bm!42091 (= call!42092 (contains!5748 lt!440159 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!992028 () Bool)

(declare-fun e!559475 () Unit!32870)

(declare-fun Unit!32873 () Unit!32870)

(assert (=> b!992028 (= e!559475 Unit!32873)))

(declare-fun b!992029 () Bool)

(declare-fun e!559482 () Bool)

(declare-fun e!559479 () Bool)

(assert (=> b!992029 (= e!559482 e!559479)))

(declare-fun res!662973 () Bool)

(assert (=> b!992029 (= res!662973 call!42092)))

(assert (=> b!992029 (=> (not res!662973) (not e!559479))))

(declare-fun d!118111 () Bool)

(assert (=> d!118111 e!559470))

(declare-fun res!662972 () Bool)

(assert (=> d!118111 (=> (not res!662972) (not e!559470))))

(assert (=> d!118111 (= res!662972 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30642 _keys!1544)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30642 _keys!1544)))))))

(declare-fun lt!440155 () ListLongMap!13635)

(assert (=> d!118111 (= lt!440159 lt!440155)))

(declare-fun lt!440175 () Unit!32870)

(assert (=> d!118111 (= lt!440175 e!559475)))

(declare-fun c!100836 () Bool)

(declare-fun e!559477 () Bool)

(assert (=> d!118111 (= c!100836 e!559477)))

(declare-fun res!662970 () Bool)

(assert (=> d!118111 (=> (not res!662970) (not e!559477))))

(assert (=> d!118111 (= res!662970 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30642 _keys!1544)))))

(declare-fun e!559478 () ListLongMap!13635)

(assert (=> d!118111 (= lt!440155 e!559478)))

(declare-fun c!100837 () Bool)

(assert (=> d!118111 (= c!100837 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!118111 (validMask!0 mask!1948)))

(assert (=> d!118111 (= (getCurrentListMap!3880 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!440159)))

(declare-fun b!992030 () Bool)

(declare-fun e!559471 () ListLongMap!13635)

(assert (=> b!992030 (= e!559478 e!559471)))

(declare-fun c!100838 () Bool)

(assert (=> b!992030 (= c!100838 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!42092 () Bool)

(declare-fun call!42096 () ListLongMap!13635)

(assert (=> bm!42092 (= call!42096 call!42091)))

(declare-fun b!992031 () Bool)

(assert (=> b!992031 (= e!559482 (not call!42092))))

(declare-fun b!992032 () Bool)

(assert (=> b!992032 (= e!559477 (validKeyInArray!0 (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!992033 () Bool)

(assert (=> b!992033 (= e!559479 (= (apply!907 lt!440159 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1220))))

(declare-fun b!992034 () Bool)

(declare-fun e!559473 () Bool)

(declare-fun e!559480 () Bool)

(assert (=> b!992034 (= e!559473 e!559480)))

(declare-fun res!662975 () Bool)

(assert (=> b!992034 (=> (not res!662975) (not e!559480))))

(assert (=> b!992034 (= res!662975 (contains!5748 lt!440159 (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!992034 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30642 _keys!1544)))))

(declare-fun b!992035 () Bool)

(assert (=> b!992035 (= e!559472 (not call!42094))))

(declare-fun b!992036 () Bool)

(assert (=> b!992036 (= e!559476 (= (apply!907 lt!440159 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1220))))

(declare-fun b!992037 () Bool)

(declare-fun e!559481 () ListLongMap!13635)

(assert (=> b!992037 (= e!559481 call!42096)))

(declare-fun b!992038 () Bool)

(declare-fun lt!440166 () Unit!32870)

(assert (=> b!992038 (= e!559475 lt!440166)))

(declare-fun lt!440157 () ListLongMap!13635)

(assert (=> b!992038 (= lt!440157 (getCurrentListMapNoExtraKeys!3558 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!440163 () (_ BitVec 64))

(assert (=> b!992038 (= lt!440163 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!440158 () (_ BitVec 64))

(assert (=> b!992038 (= lt!440158 (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!440174 () Unit!32870)

(assert (=> b!992038 (= lt!440174 (addStillContains!617 lt!440157 lt!440163 zeroValue!1220 lt!440158))))

(assert (=> b!992038 (contains!5748 (+!3118 lt!440157 (tuple2!14937 lt!440163 zeroValue!1220)) lt!440158)))

(declare-fun lt!440170 () Unit!32870)

(assert (=> b!992038 (= lt!440170 lt!440174)))

(declare-fun lt!440173 () ListLongMap!13635)

(assert (=> b!992038 (= lt!440173 (getCurrentListMapNoExtraKeys!3558 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!440162 () (_ BitVec 64))

(assert (=> b!992038 (= lt!440162 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!440161 () (_ BitVec 64))

(assert (=> b!992038 (= lt!440161 (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!440160 () Unit!32870)

(assert (=> b!992038 (= lt!440160 (addApplyDifferent!473 lt!440173 lt!440162 minValue!1220 lt!440161))))

(assert (=> b!992038 (= (apply!907 (+!3118 lt!440173 (tuple2!14937 lt!440162 minValue!1220)) lt!440161) (apply!907 lt!440173 lt!440161))))

(declare-fun lt!440172 () Unit!32870)

(assert (=> b!992038 (= lt!440172 lt!440160)))

(declare-fun lt!440167 () ListLongMap!13635)

(assert (=> b!992038 (= lt!440167 (getCurrentListMapNoExtraKeys!3558 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!440164 () (_ BitVec 64))

(assert (=> b!992038 (= lt!440164 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!440168 () (_ BitVec 64))

(assert (=> b!992038 (= lt!440168 (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!440165 () Unit!32870)

(assert (=> b!992038 (= lt!440165 (addApplyDifferent!473 lt!440167 lt!440164 zeroValue!1220 lt!440168))))

(assert (=> b!992038 (= (apply!907 (+!3118 lt!440167 (tuple2!14937 lt!440164 zeroValue!1220)) lt!440168) (apply!907 lt!440167 lt!440168))))

(declare-fun lt!440156 () Unit!32870)

(assert (=> b!992038 (= lt!440156 lt!440165)))

(declare-fun lt!440169 () ListLongMap!13635)

(assert (=> b!992038 (= lt!440169 (getCurrentListMapNoExtraKeys!3558 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!440171 () (_ BitVec 64))

(assert (=> b!992038 (= lt!440171 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!440176 () (_ BitVec 64))

(assert (=> b!992038 (= lt!440176 (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!992038 (= lt!440166 (addApplyDifferent!473 lt!440169 lt!440171 minValue!1220 lt!440176))))

(assert (=> b!992038 (= (apply!907 (+!3118 lt!440169 (tuple2!14937 lt!440171 minValue!1220)) lt!440176) (apply!907 lt!440169 lt!440176))))

(declare-fun b!992039 () Bool)

(assert (=> b!992039 (= e!559470 e!559482)))

(declare-fun c!100835 () Bool)

(assert (=> b!992039 (= c!100835 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!42093 () Bool)

(assert (=> bm!42093 (= call!42094 (contains!5748 lt!440159 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!992040 () Bool)

(assert (=> b!992040 (= e!559471 call!42097)))

(declare-fun b!992041 () Bool)

(declare-fun c!100833 () Bool)

(assert (=> b!992041 (= c!100833 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!992041 (= e!559471 e!559481)))

(declare-fun b!992042 () Bool)

(assert (=> b!992042 (= e!559481 call!42097)))

(declare-fun b!992043 () Bool)

(declare-fun res!662974 () Bool)

(assert (=> b!992043 (=> (not res!662974) (not e!559470))))

(assert (=> b!992043 (= res!662974 e!559473)))

(declare-fun res!662978 () Bool)

(assert (=> b!992043 (=> res!662978 e!559473)))

(declare-fun e!559474 () Bool)

(assert (=> b!992043 (= res!662978 (not e!559474))))

(declare-fun res!662971 () Bool)

(assert (=> b!992043 (=> (not res!662971) (not e!559474))))

(assert (=> b!992043 (= res!662971 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30642 _keys!1544)))))

(declare-fun b!992044 () Bool)

(assert (=> b!992044 (= e!559474 (validKeyInArray!0 (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!992045 () Bool)

(assert (=> b!992045 (= e!559478 (+!3118 call!42093 (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun b!992046 () Bool)

(assert (=> b!992046 (= e!559480 (= (apply!907 lt!440159 (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15682 (select (arr!30161 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!992046 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30641 _values!1278)))))

(assert (=> b!992046 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30642 _keys!1544)))))

(declare-fun bm!42094 () Bool)

(assert (=> bm!42094 (= call!42093 (+!3118 (ite c!100837 call!42095 (ite c!100838 call!42091 call!42096)) (ite (or c!100837 c!100838) (tuple2!14937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!118111 c!100837) b!992045))

(assert (= (and d!118111 (not c!100837)) b!992030))

(assert (= (and b!992030 c!100838) b!992040))

(assert (= (and b!992030 (not c!100838)) b!992041))

(assert (= (and b!992041 c!100833) b!992042))

(assert (= (and b!992041 (not c!100833)) b!992037))

(assert (= (or b!992042 b!992037) bm!42092))

(assert (= (or b!992040 bm!42092) bm!42090))

(assert (= (or b!992040 b!992042) bm!42088))

(assert (= (or b!992045 bm!42090) bm!42089))

(assert (= (or b!992045 bm!42088) bm!42094))

(assert (= (and d!118111 res!662970) b!992032))

(assert (= (and d!118111 c!100836) b!992038))

(assert (= (and d!118111 (not c!100836)) b!992028))

(assert (= (and d!118111 res!662972) b!992043))

(assert (= (and b!992043 res!662971) b!992044))

(assert (= (and b!992043 (not res!662978)) b!992034))

(assert (= (and b!992034 res!662975) b!992046))

(assert (= (and b!992043 res!662974) b!992026))

(assert (= (and b!992026 c!100834) b!992027))

(assert (= (and b!992026 (not c!100834)) b!992035))

(assert (= (and b!992027 res!662976) b!992036))

(assert (= (or b!992027 b!992035) bm!42093))

(assert (= (and b!992026 res!662977) b!992039))

(assert (= (and b!992039 c!100835) b!992029))

(assert (= (and b!992039 (not c!100835)) b!992031))

(assert (= (and b!992029 res!662973) b!992033))

(assert (= (or b!992029 b!992031) bm!42091))

(declare-fun b_lambda!15221 () Bool)

(assert (=> (not b_lambda!15221) (not b!992046)))

(assert (=> b!992046 t!29814))

(declare-fun b_and!32289 () Bool)

(assert (= b_and!32287 (and (=> t!29814 result!13653) b_and!32289)))

(declare-fun m!920167 () Bool)

(assert (=> b!992036 m!920167))

(declare-fun m!920169 () Bool)

(assert (=> b!992034 m!920169))

(assert (=> b!992034 m!920169))

(declare-fun m!920171 () Bool)

(assert (=> b!992034 m!920171))

(declare-fun m!920173 () Bool)

(assert (=> b!992045 m!920173))

(assert (=> b!992044 m!920169))

(assert (=> b!992044 m!920169))

(declare-fun m!920175 () Bool)

(assert (=> b!992044 m!920175))

(declare-fun m!920177 () Bool)

(assert (=> bm!42094 m!920177))

(assert (=> d!118111 m!920025))

(declare-fun m!920179 () Bool)

(assert (=> bm!42093 m!920179))

(declare-fun m!920181 () Bool)

(assert (=> b!992038 m!920181))

(declare-fun m!920183 () Bool)

(assert (=> b!992038 m!920183))

(declare-fun m!920185 () Bool)

(assert (=> b!992038 m!920185))

(declare-fun m!920187 () Bool)

(assert (=> b!992038 m!920187))

(assert (=> b!992038 m!920169))

(declare-fun m!920189 () Bool)

(assert (=> b!992038 m!920189))

(declare-fun m!920191 () Bool)

(assert (=> b!992038 m!920191))

(declare-fun m!920193 () Bool)

(assert (=> b!992038 m!920193))

(declare-fun m!920195 () Bool)

(assert (=> b!992038 m!920195))

(declare-fun m!920197 () Bool)

(assert (=> b!992038 m!920197))

(declare-fun m!920199 () Bool)

(assert (=> b!992038 m!920199))

(declare-fun m!920201 () Bool)

(assert (=> b!992038 m!920201))

(assert (=> b!992038 m!920187))

(declare-fun m!920203 () Bool)

(assert (=> b!992038 m!920203))

(declare-fun m!920205 () Bool)

(assert (=> b!992038 m!920205))

(declare-fun m!920207 () Bool)

(assert (=> b!992038 m!920207))

(assert (=> b!992038 m!920193))

(declare-fun m!920209 () Bool)

(assert (=> b!992038 m!920209))

(assert (=> b!992038 m!920189))

(declare-fun m!920211 () Bool)

(assert (=> b!992038 m!920211))

(assert (=> b!992038 m!920205))

(declare-fun m!920213 () Bool)

(assert (=> bm!42091 m!920213))

(declare-fun m!920215 () Bool)

(assert (=> b!992046 m!920215))

(assert (=> b!992046 m!920169))

(declare-fun m!920217 () Bool)

(assert (=> b!992046 m!920217))

(assert (=> b!992046 m!920215))

(assert (=> b!992046 m!920043))

(declare-fun m!920219 () Bool)

(assert (=> b!992046 m!920219))

(assert (=> b!992046 m!920043))

(assert (=> b!992046 m!920169))

(assert (=> b!992032 m!920169))

(assert (=> b!992032 m!920169))

(assert (=> b!992032 m!920175))

(declare-fun m!920221 () Bool)

(assert (=> b!992033 m!920221))

(assert (=> bm!42089 m!920199))

(assert (=> b!991889 d!118111))

(declare-fun d!118113 () Bool)

(declare-fun c!100841 () Bool)

(assert (=> d!118113 (= c!100841 ((_ is ValueCellFull!11174) (select (arr!30161 _values!1278) from!1932)))))

(declare-fun e!559485 () V!36065)

(assert (=> d!118113 (= (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!559485)))

(declare-fun b!992051 () Bool)

(declare-fun get!15683 (ValueCell!11174 V!36065) V!36065)

(assert (=> b!992051 (= e!559485 (get!15683 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!992052 () Bool)

(declare-fun get!15684 (ValueCell!11174 V!36065) V!36065)

(assert (=> b!992052 (= e!559485 (get!15684 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!118113 c!100841) b!992051))

(assert (= (and d!118113 (not c!100841)) b!992052))

(assert (=> b!992051 m!920035))

(assert (=> b!992051 m!920043))

(declare-fun m!920223 () Bool)

(assert (=> b!992051 m!920223))

(assert (=> b!992052 m!920035))

(assert (=> b!992052 m!920043))

(declare-fun m!920225 () Bool)

(assert (=> b!992052 m!920225))

(assert (=> b!991889 d!118113))

(declare-fun bm!42097 () Bool)

(declare-fun call!42100 () Bool)

(assert (=> bm!42097 (= call!42100 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!992061 () Bool)

(declare-fun e!559493 () Bool)

(declare-fun e!559494 () Bool)

(assert (=> b!992061 (= e!559493 e!559494)))

(declare-fun lt!440183 () (_ BitVec 64))

(assert (=> b!992061 (= lt!440183 (select (arr!30162 _keys!1544) #b00000000000000000000000000000000))))

(declare-fun lt!440184 () Unit!32870)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62632 (_ BitVec 64) (_ BitVec 32)) Unit!32870)

(assert (=> b!992061 (= lt!440184 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!440183 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62632 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!992061 (arrayContainsKey!0 _keys!1544 lt!440183 #b00000000000000000000000000000000)))

(declare-fun lt!440185 () Unit!32870)

(assert (=> b!992061 (= lt!440185 lt!440184)))

(declare-fun res!662983 () Bool)

(declare-datatypes ((SeekEntryResult!9168 0))(
  ( (MissingZero!9168 (index!39043 (_ BitVec 32))) (Found!9168 (index!39044 (_ BitVec 32))) (Intermediate!9168 (undefined!9980 Bool) (index!39045 (_ BitVec 32)) (x!86200 (_ BitVec 32))) (Undefined!9168) (MissingVacant!9168 (index!39046 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62632 (_ BitVec 32)) SeekEntryResult!9168)

(assert (=> b!992061 (= res!662983 (= (seekEntryOrOpen!0 (select (arr!30162 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9168 #b00000000000000000000000000000000)))))

(assert (=> b!992061 (=> (not res!662983) (not e!559494))))

(declare-fun b!992062 () Bool)

(declare-fun e!559492 () Bool)

(assert (=> b!992062 (= e!559492 e!559493)))

(declare-fun c!100844 () Bool)

(assert (=> b!992062 (= c!100844 (validKeyInArray!0 (select (arr!30162 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun d!118115 () Bool)

(declare-fun res!662984 () Bool)

(assert (=> d!118115 (=> res!662984 e!559492)))

(assert (=> d!118115 (= res!662984 (bvsge #b00000000000000000000000000000000 (size!30642 _keys!1544)))))

(assert (=> d!118115 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!559492)))

(declare-fun b!992063 () Bool)

(assert (=> b!992063 (= e!559494 call!42100)))

(declare-fun b!992064 () Bool)

(assert (=> b!992064 (= e!559493 call!42100)))

(assert (= (and d!118115 (not res!662984)) b!992062))

(assert (= (and b!992062 c!100844) b!992061))

(assert (= (and b!992062 (not c!100844)) b!992064))

(assert (= (and b!992061 res!662983) b!992063))

(assert (= (or b!992063 b!992064) bm!42097))

(declare-fun m!920227 () Bool)

(assert (=> bm!42097 m!920227))

(declare-fun m!920229 () Bool)

(assert (=> b!992061 m!920229))

(declare-fun m!920231 () Bool)

(assert (=> b!992061 m!920231))

(declare-fun m!920233 () Bool)

(assert (=> b!992061 m!920233))

(assert (=> b!992061 m!920229))

(declare-fun m!920235 () Bool)

(assert (=> b!992061 m!920235))

(assert (=> b!992062 m!920229))

(assert (=> b!992062 m!920229))

(declare-fun m!920237 () Bool)

(assert (=> b!992062 m!920237))

(assert (=> b!991885 d!118115))

(declare-fun d!118117 () Bool)

(assert (=> d!118117 (= (validKeyInArray!0 (select (arr!30162 _keys!1544) from!1932)) (and (not (= (select (arr!30162 _keys!1544) from!1932) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30162 _keys!1544) from!1932) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!991884 d!118117))

(declare-fun bm!42100 () Bool)

(declare-fun call!42103 () Bool)

(declare-fun c!100847 () Bool)

(assert (=> bm!42100 (= call!42103 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100847 (Cons!20841 (select (arr!30162 _keys!1544) #b00000000000000000000000000000000) Nil!20842) Nil!20842)))))

(declare-fun b!992075 () Bool)

(declare-fun e!559503 () Bool)

(declare-fun contains!5750 (List!20845 (_ BitVec 64)) Bool)

(assert (=> b!992075 (= e!559503 (contains!5750 Nil!20842 (select (arr!30162 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!992076 () Bool)

(declare-fun e!559505 () Bool)

(declare-fun e!559506 () Bool)

(assert (=> b!992076 (= e!559505 e!559506)))

(assert (=> b!992076 (= c!100847 (validKeyInArray!0 (select (arr!30162 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun d!118119 () Bool)

(declare-fun res!662993 () Bool)

(declare-fun e!559504 () Bool)

(assert (=> d!118119 (=> res!662993 e!559504)))

(assert (=> d!118119 (= res!662993 (bvsge #b00000000000000000000000000000000 (size!30642 _keys!1544)))))

(assert (=> d!118119 (= (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20842) e!559504)))

(declare-fun b!992077 () Bool)

(assert (=> b!992077 (= e!559506 call!42103)))

(declare-fun b!992078 () Bool)

(assert (=> b!992078 (= e!559504 e!559505)))

(declare-fun res!662991 () Bool)

(assert (=> b!992078 (=> (not res!662991) (not e!559505))))

(assert (=> b!992078 (= res!662991 (not e!559503))))

(declare-fun res!662992 () Bool)

(assert (=> b!992078 (=> (not res!662992) (not e!559503))))

(assert (=> b!992078 (= res!662992 (validKeyInArray!0 (select (arr!30162 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!992079 () Bool)

(assert (=> b!992079 (= e!559506 call!42103)))

(assert (= (and d!118119 (not res!662993)) b!992078))

(assert (= (and b!992078 res!662992) b!992075))

(assert (= (and b!992078 res!662991) b!992076))

(assert (= (and b!992076 c!100847) b!992077))

(assert (= (and b!992076 (not c!100847)) b!992079))

(assert (= (or b!992077 b!992079) bm!42100))

(assert (=> bm!42100 m!920229))

(declare-fun m!920239 () Bool)

(assert (=> bm!42100 m!920239))

(assert (=> b!992075 m!920229))

(assert (=> b!992075 m!920229))

(declare-fun m!920241 () Bool)

(assert (=> b!992075 m!920241))

(assert (=> b!992076 m!920229))

(assert (=> b!992076 m!920229))

(assert (=> b!992076 m!920237))

(assert (=> b!992078 m!920229))

(assert (=> b!992078 m!920229))

(assert (=> b!992078 m!920237))

(assert (=> b!991890 d!118119))

(declare-fun d!118121 () Bool)

(assert (=> d!118121 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!84908 d!118121))

(declare-fun d!118123 () Bool)

(assert (=> d!118123 (= (array_inv!23319 _values!1278) (bvsge (size!30641 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!84908 d!118123))

(declare-fun d!118125 () Bool)

(assert (=> d!118125 (= (array_inv!23320 _keys!1544) (bvsge (size!30642 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!84908 d!118125))

(declare-fun mapIsEmpty!37028 () Bool)

(declare-fun mapRes!37028 () Bool)

(assert (=> mapIsEmpty!37028 mapRes!37028))

(declare-fun mapNonEmpty!37028 () Bool)

(declare-fun tp!70100 () Bool)

(declare-fun e!559512 () Bool)

(assert (=> mapNonEmpty!37028 (= mapRes!37028 (and tp!70100 e!559512))))

(declare-fun mapRest!37028 () (Array (_ BitVec 32) ValueCell!11174))

(declare-fun mapKey!37028 () (_ BitVec 32))

(declare-fun mapValue!37028 () ValueCell!11174)

(assert (=> mapNonEmpty!37028 (= mapRest!37019 (store mapRest!37028 mapKey!37028 mapValue!37028))))

(declare-fun b!992087 () Bool)

(declare-fun e!559511 () Bool)

(assert (=> b!992087 (= e!559511 tp_is_empty!23311)))

(declare-fun condMapEmpty!37028 () Bool)

(declare-fun mapDefault!37028 () ValueCell!11174)

(assert (=> mapNonEmpty!37019 (= condMapEmpty!37028 (= mapRest!37019 ((as const (Array (_ BitVec 32) ValueCell!11174)) mapDefault!37028)))))

(assert (=> mapNonEmpty!37019 (= tp!70085 (and e!559511 mapRes!37028))))

(declare-fun b!992086 () Bool)

(assert (=> b!992086 (= e!559512 tp_is_empty!23311)))

(assert (= (and mapNonEmpty!37019 condMapEmpty!37028) mapIsEmpty!37028))

(assert (= (and mapNonEmpty!37019 (not condMapEmpty!37028)) mapNonEmpty!37028))

(assert (= (and mapNonEmpty!37028 ((_ is ValueCellFull!11174) mapValue!37028)) b!992086))

(assert (= (and mapNonEmpty!37019 ((_ is ValueCellFull!11174) mapDefault!37028)) b!992087))

(declare-fun m!920243 () Bool)

(assert (=> mapNonEmpty!37028 m!920243))

(declare-fun b_lambda!15223 () Bool)

(assert (= b_lambda!15219 (or (and start!84908 b_free!20095) b_lambda!15223)))

(declare-fun b_lambda!15225 () Bool)

(assert (= b_lambda!15221 (or (and start!84908 b_free!20095) b_lambda!15225)))

(check-sat (not b!992011) (not b!992033) (not d!118109) (not bm!42084) (not b!992006) (not bm!42097) (not bm!42093) (not bm!42094) (not b!992024) (not b!992078) (not b!992045) (not d!118107) (not bm!42100) (not b!992025) (not b_next!20095) (not b!992019) (not bm!42086) (not mapNonEmpty!37028) tp_is_empty!23311 (not b!992009) (not b!992044) (not bm!42091) (not d!118111) (not b!992032) (not b!992061) (not b_lambda!15217) (not b_lambda!15223) (not b!992036) (not b_lambda!15225) (not b!992075) (not b!992062) (not b!992046) (not b!992051) (not b!992076) (not b!992005) (not b!992038) (not bm!42082) (not b!992052) (not b!992034) (not b!992018) b_and!32289 (not b!992007) (not b!992017) (not bm!42089) (not bm!42087))
(check-sat b_and!32289 (not b_next!20095))
(get-model)

(declare-fun d!118127 () Bool)

(assert (=> d!118127 (= (validKeyInArray!0 (select (arr!30162 _keys!1544) #b00000000000000000000000000000000)) (and (not (= (select (arr!30162 _keys!1544) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30162 _keys!1544) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!992078 d!118127))

(declare-fun d!118129 () Bool)

(declare-fun e!559517 () Bool)

(assert (=> d!118129 e!559517))

(declare-fun res!662996 () Bool)

(assert (=> d!118129 (=> res!662996 e!559517)))

(declare-fun lt!440194 () Bool)

(assert (=> d!118129 (= res!662996 (not lt!440194))))

(declare-fun lt!440197 () Bool)

(assert (=> d!118129 (= lt!440194 lt!440197)))

(declare-fun lt!440195 () Unit!32870)

(declare-fun e!559518 () Unit!32870)

(assert (=> d!118129 (= lt!440195 e!559518)))

(declare-fun c!100850 () Bool)

(assert (=> d!118129 (= c!100850 lt!440197)))

(declare-fun containsKey!482 (List!20844 (_ BitVec 64)) Bool)

(assert (=> d!118129 (= lt!440197 (containsKey!482 (toList!6833 (+!3118 lt!440157 (tuple2!14937 lt!440163 zeroValue!1220))) lt!440158))))

(assert (=> d!118129 (= (contains!5748 (+!3118 lt!440157 (tuple2!14937 lt!440163 zeroValue!1220)) lt!440158) lt!440194)))

(declare-fun b!992094 () Bool)

(declare-fun lt!440196 () Unit!32870)

(assert (=> b!992094 (= e!559518 lt!440196)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!376 (List!20844 (_ BitVec 64)) Unit!32870)

(assert (=> b!992094 (= lt!440196 (lemmaContainsKeyImpliesGetValueByKeyDefined!376 (toList!6833 (+!3118 lt!440157 (tuple2!14937 lt!440163 zeroValue!1220))) lt!440158))))

(declare-fun isDefined!384 (Option!519) Bool)

(assert (=> b!992094 (isDefined!384 (getValueByKey!513 (toList!6833 (+!3118 lt!440157 (tuple2!14937 lt!440163 zeroValue!1220))) lt!440158))))

(declare-fun b!992095 () Bool)

(declare-fun Unit!32874 () Unit!32870)

(assert (=> b!992095 (= e!559518 Unit!32874)))

(declare-fun b!992096 () Bool)

(assert (=> b!992096 (= e!559517 (isDefined!384 (getValueByKey!513 (toList!6833 (+!3118 lt!440157 (tuple2!14937 lt!440163 zeroValue!1220))) lt!440158)))))

(assert (= (and d!118129 c!100850) b!992094))

(assert (= (and d!118129 (not c!100850)) b!992095))

(assert (= (and d!118129 (not res!662996)) b!992096))

(declare-fun m!920245 () Bool)

(assert (=> d!118129 m!920245))

(declare-fun m!920247 () Bool)

(assert (=> b!992094 m!920247))

(declare-fun m!920249 () Bool)

(assert (=> b!992094 m!920249))

(assert (=> b!992094 m!920249))

(declare-fun m!920251 () Bool)

(assert (=> b!992094 m!920251))

(assert (=> b!992096 m!920249))

(assert (=> b!992096 m!920249))

(assert (=> b!992096 m!920251))

(assert (=> b!992038 d!118129))

(declare-fun d!118131 () Bool)

(assert (=> d!118131 (= (apply!907 (+!3118 lt!440167 (tuple2!14937 lt!440164 zeroValue!1220)) lt!440168) (apply!907 lt!440167 lt!440168))))

(declare-fun lt!440200 () Unit!32870)

(declare-fun choose!1626 (ListLongMap!13635 (_ BitVec 64) V!36065 (_ BitVec 64)) Unit!32870)

(assert (=> d!118131 (= lt!440200 (choose!1626 lt!440167 lt!440164 zeroValue!1220 lt!440168))))

(declare-fun e!559521 () Bool)

(assert (=> d!118131 e!559521))

(declare-fun res!662999 () Bool)

(assert (=> d!118131 (=> (not res!662999) (not e!559521))))

(assert (=> d!118131 (= res!662999 (contains!5748 lt!440167 lt!440168))))

(assert (=> d!118131 (= (addApplyDifferent!473 lt!440167 lt!440164 zeroValue!1220 lt!440168) lt!440200)))

(declare-fun b!992100 () Bool)

(assert (=> b!992100 (= e!559521 (not (= lt!440168 lt!440164)))))

(assert (= (and d!118131 res!662999) b!992100))

(declare-fun m!920253 () Bool)

(assert (=> d!118131 m!920253))

(assert (=> d!118131 m!920197))

(declare-fun m!920255 () Bool)

(assert (=> d!118131 m!920255))

(assert (=> d!118131 m!920205))

(assert (=> d!118131 m!920205))

(assert (=> d!118131 m!920207))

(assert (=> b!992038 d!118131))

(declare-fun d!118133 () Bool)

(declare-fun e!559522 () Bool)

(assert (=> d!118133 e!559522))

(declare-fun res!663001 () Bool)

(assert (=> d!118133 (=> (not res!663001) (not e!559522))))

(declare-fun lt!440203 () ListLongMap!13635)

(assert (=> d!118133 (= res!663001 (contains!5748 lt!440203 (_1!7479 (tuple2!14937 lt!440164 zeroValue!1220))))))

(declare-fun lt!440202 () List!20844)

(assert (=> d!118133 (= lt!440203 (ListLongMap!13636 lt!440202))))

(declare-fun lt!440201 () Unit!32870)

(declare-fun lt!440204 () Unit!32870)

(assert (=> d!118133 (= lt!440201 lt!440204)))

(assert (=> d!118133 (= (getValueByKey!513 lt!440202 (_1!7479 (tuple2!14937 lt!440164 zeroValue!1220))) (Some!518 (_2!7479 (tuple2!14937 lt!440164 zeroValue!1220))))))

(assert (=> d!118133 (= lt!440204 (lemmaContainsTupThenGetReturnValue!275 lt!440202 (_1!7479 (tuple2!14937 lt!440164 zeroValue!1220)) (_2!7479 (tuple2!14937 lt!440164 zeroValue!1220))))))

(assert (=> d!118133 (= lt!440202 (insertStrictlySorted!332 (toList!6833 lt!440167) (_1!7479 (tuple2!14937 lt!440164 zeroValue!1220)) (_2!7479 (tuple2!14937 lt!440164 zeroValue!1220))))))

(assert (=> d!118133 (= (+!3118 lt!440167 (tuple2!14937 lt!440164 zeroValue!1220)) lt!440203)))

(declare-fun b!992101 () Bool)

(declare-fun res!663000 () Bool)

(assert (=> b!992101 (=> (not res!663000) (not e!559522))))

(assert (=> b!992101 (= res!663000 (= (getValueByKey!513 (toList!6833 lt!440203) (_1!7479 (tuple2!14937 lt!440164 zeroValue!1220))) (Some!518 (_2!7479 (tuple2!14937 lt!440164 zeroValue!1220)))))))

(declare-fun b!992102 () Bool)

(assert (=> b!992102 (= e!559522 (contains!5749 (toList!6833 lt!440203) (tuple2!14937 lt!440164 zeroValue!1220)))))

(assert (= (and d!118133 res!663001) b!992101))

(assert (= (and b!992101 res!663000) b!992102))

(declare-fun m!920257 () Bool)

(assert (=> d!118133 m!920257))

(declare-fun m!920259 () Bool)

(assert (=> d!118133 m!920259))

(declare-fun m!920261 () Bool)

(assert (=> d!118133 m!920261))

(declare-fun m!920263 () Bool)

(assert (=> d!118133 m!920263))

(declare-fun m!920265 () Bool)

(assert (=> b!992101 m!920265))

(declare-fun m!920267 () Bool)

(assert (=> b!992102 m!920267))

(assert (=> b!992038 d!118133))

(declare-fun d!118135 () Bool)

(declare-fun e!559523 () Bool)

(assert (=> d!118135 e!559523))

(declare-fun res!663003 () Bool)

(assert (=> d!118135 (=> (not res!663003) (not e!559523))))

(declare-fun lt!440207 () ListLongMap!13635)

(assert (=> d!118135 (= res!663003 (contains!5748 lt!440207 (_1!7479 (tuple2!14937 lt!440162 minValue!1220))))))

(declare-fun lt!440206 () List!20844)

(assert (=> d!118135 (= lt!440207 (ListLongMap!13636 lt!440206))))

(declare-fun lt!440205 () Unit!32870)

(declare-fun lt!440208 () Unit!32870)

(assert (=> d!118135 (= lt!440205 lt!440208)))

(assert (=> d!118135 (= (getValueByKey!513 lt!440206 (_1!7479 (tuple2!14937 lt!440162 minValue!1220))) (Some!518 (_2!7479 (tuple2!14937 lt!440162 minValue!1220))))))

(assert (=> d!118135 (= lt!440208 (lemmaContainsTupThenGetReturnValue!275 lt!440206 (_1!7479 (tuple2!14937 lt!440162 minValue!1220)) (_2!7479 (tuple2!14937 lt!440162 minValue!1220))))))

(assert (=> d!118135 (= lt!440206 (insertStrictlySorted!332 (toList!6833 lt!440173) (_1!7479 (tuple2!14937 lt!440162 minValue!1220)) (_2!7479 (tuple2!14937 lt!440162 minValue!1220))))))

(assert (=> d!118135 (= (+!3118 lt!440173 (tuple2!14937 lt!440162 minValue!1220)) lt!440207)))

(declare-fun b!992103 () Bool)

(declare-fun res!663002 () Bool)

(assert (=> b!992103 (=> (not res!663002) (not e!559523))))

(assert (=> b!992103 (= res!663002 (= (getValueByKey!513 (toList!6833 lt!440207) (_1!7479 (tuple2!14937 lt!440162 minValue!1220))) (Some!518 (_2!7479 (tuple2!14937 lt!440162 minValue!1220)))))))

(declare-fun b!992104 () Bool)

(assert (=> b!992104 (= e!559523 (contains!5749 (toList!6833 lt!440207) (tuple2!14937 lt!440162 minValue!1220)))))

(assert (= (and d!118135 res!663003) b!992103))

(assert (= (and b!992103 res!663002) b!992104))

(declare-fun m!920269 () Bool)

(assert (=> d!118135 m!920269))

(declare-fun m!920271 () Bool)

(assert (=> d!118135 m!920271))

(declare-fun m!920273 () Bool)

(assert (=> d!118135 m!920273))

(declare-fun m!920275 () Bool)

(assert (=> d!118135 m!920275))

(declare-fun m!920277 () Bool)

(assert (=> b!992103 m!920277))

(declare-fun m!920279 () Bool)

(assert (=> b!992104 m!920279))

(assert (=> b!992038 d!118135))

(declare-fun d!118137 () Bool)

(declare-fun get!15685 (Option!519) V!36065)

(assert (=> d!118137 (= (apply!907 (+!3118 lt!440169 (tuple2!14937 lt!440171 minValue!1220)) lt!440176) (get!15685 (getValueByKey!513 (toList!6833 (+!3118 lt!440169 (tuple2!14937 lt!440171 minValue!1220))) lt!440176)))))

(declare-fun bs!28166 () Bool)

(assert (= bs!28166 d!118137))

(declare-fun m!920281 () Bool)

(assert (=> bs!28166 m!920281))

(assert (=> bs!28166 m!920281))

(declare-fun m!920283 () Bool)

(assert (=> bs!28166 m!920283))

(assert (=> b!992038 d!118137))

(declare-fun d!118139 () Bool)

(assert (=> d!118139 (= (apply!907 lt!440173 lt!440161) (get!15685 (getValueByKey!513 (toList!6833 lt!440173) lt!440161)))))

(declare-fun bs!28167 () Bool)

(assert (= bs!28167 d!118139))

(declare-fun m!920285 () Bool)

(assert (=> bs!28167 m!920285))

(assert (=> bs!28167 m!920285))

(declare-fun m!920287 () Bool)

(assert (=> bs!28167 m!920287))

(assert (=> b!992038 d!118139))

(declare-fun d!118141 () Bool)

(assert (=> d!118141 (contains!5748 (+!3118 lt!440157 (tuple2!14937 lt!440163 zeroValue!1220)) lt!440158)))

(declare-fun lt!440211 () Unit!32870)

(declare-fun choose!1627 (ListLongMap!13635 (_ BitVec 64) V!36065 (_ BitVec 64)) Unit!32870)

(assert (=> d!118141 (= lt!440211 (choose!1627 lt!440157 lt!440163 zeroValue!1220 lt!440158))))

(assert (=> d!118141 (contains!5748 lt!440157 lt!440158)))

(assert (=> d!118141 (= (addStillContains!617 lt!440157 lt!440163 zeroValue!1220 lt!440158) lt!440211)))

(declare-fun bs!28168 () Bool)

(assert (= bs!28168 d!118141))

(assert (=> bs!28168 m!920187))

(assert (=> bs!28168 m!920187))

(assert (=> bs!28168 m!920203))

(declare-fun m!920289 () Bool)

(assert (=> bs!28168 m!920289))

(declare-fun m!920291 () Bool)

(assert (=> bs!28168 m!920291))

(assert (=> b!992038 d!118141))

(declare-fun d!118143 () Bool)

(assert (=> d!118143 (= (apply!907 (+!3118 lt!440173 (tuple2!14937 lt!440162 minValue!1220)) lt!440161) (get!15685 (getValueByKey!513 (toList!6833 (+!3118 lt!440173 (tuple2!14937 lt!440162 minValue!1220))) lt!440161)))))

(declare-fun bs!28169 () Bool)

(assert (= bs!28169 d!118143))

(declare-fun m!920293 () Bool)

(assert (=> bs!28169 m!920293))

(assert (=> bs!28169 m!920293))

(declare-fun m!920295 () Bool)

(assert (=> bs!28169 m!920295))

(assert (=> b!992038 d!118143))

(declare-fun d!118145 () Bool)

(assert (=> d!118145 (= (apply!907 lt!440169 lt!440176) (get!15685 (getValueByKey!513 (toList!6833 lt!440169) lt!440176)))))

(declare-fun bs!28170 () Bool)

(assert (= bs!28170 d!118145))

(declare-fun m!920297 () Bool)

(assert (=> bs!28170 m!920297))

(assert (=> bs!28170 m!920297))

(declare-fun m!920299 () Bool)

(assert (=> bs!28170 m!920299))

(assert (=> b!992038 d!118145))

(declare-fun d!118147 () Bool)

(assert (=> d!118147 (= (apply!907 (+!3118 lt!440167 (tuple2!14937 lt!440164 zeroValue!1220)) lt!440168) (get!15685 (getValueByKey!513 (toList!6833 (+!3118 lt!440167 (tuple2!14937 lt!440164 zeroValue!1220))) lt!440168)))))

(declare-fun bs!28171 () Bool)

(assert (= bs!28171 d!118147))

(declare-fun m!920301 () Bool)

(assert (=> bs!28171 m!920301))

(assert (=> bs!28171 m!920301))

(declare-fun m!920303 () Bool)

(assert (=> bs!28171 m!920303))

(assert (=> b!992038 d!118147))

(declare-fun d!118149 () Bool)

(assert (=> d!118149 (= (apply!907 (+!3118 lt!440169 (tuple2!14937 lt!440171 minValue!1220)) lt!440176) (apply!907 lt!440169 lt!440176))))

(declare-fun lt!440212 () Unit!32870)

(assert (=> d!118149 (= lt!440212 (choose!1626 lt!440169 lt!440171 minValue!1220 lt!440176))))

(declare-fun e!559524 () Bool)

(assert (=> d!118149 e!559524))

(declare-fun res!663004 () Bool)

(assert (=> d!118149 (=> (not res!663004) (not e!559524))))

(assert (=> d!118149 (= res!663004 (contains!5748 lt!440169 lt!440176))))

(assert (=> d!118149 (= (addApplyDifferent!473 lt!440169 lt!440171 minValue!1220 lt!440176) lt!440212)))

(declare-fun b!992106 () Bool)

(assert (=> b!992106 (= e!559524 (not (= lt!440176 lt!440171)))))

(assert (= (and d!118149 res!663004) b!992106))

(declare-fun m!920305 () Bool)

(assert (=> d!118149 m!920305))

(assert (=> d!118149 m!920191))

(declare-fun m!920307 () Bool)

(assert (=> d!118149 m!920307))

(assert (=> d!118149 m!920193))

(assert (=> d!118149 m!920193))

(assert (=> d!118149 m!920209))

(assert (=> b!992038 d!118149))

(declare-fun d!118151 () Bool)

(assert (=> d!118151 (= (apply!907 (+!3118 lt!440173 (tuple2!14937 lt!440162 minValue!1220)) lt!440161) (apply!907 lt!440173 lt!440161))))

(declare-fun lt!440213 () Unit!32870)

(assert (=> d!118151 (= lt!440213 (choose!1626 lt!440173 lt!440162 minValue!1220 lt!440161))))

(declare-fun e!559525 () Bool)

(assert (=> d!118151 e!559525))

(declare-fun res!663005 () Bool)

(assert (=> d!118151 (=> (not res!663005) (not e!559525))))

(assert (=> d!118151 (= res!663005 (contains!5748 lt!440173 lt!440161))))

(assert (=> d!118151 (= (addApplyDifferent!473 lt!440173 lt!440162 minValue!1220 lt!440161) lt!440213)))

(declare-fun b!992107 () Bool)

(assert (=> b!992107 (= e!559525 (not (= lt!440161 lt!440162)))))

(assert (= (and d!118151 res!663005) b!992107))

(declare-fun m!920309 () Bool)

(assert (=> d!118151 m!920309))

(assert (=> d!118151 m!920201))

(declare-fun m!920311 () Bool)

(assert (=> d!118151 m!920311))

(assert (=> d!118151 m!920189))

(assert (=> d!118151 m!920189))

(assert (=> d!118151 m!920211))

(assert (=> b!992038 d!118151))

(declare-fun d!118153 () Bool)

(declare-fun e!559526 () Bool)

(assert (=> d!118153 e!559526))

(declare-fun res!663007 () Bool)

(assert (=> d!118153 (=> (not res!663007) (not e!559526))))

(declare-fun lt!440216 () ListLongMap!13635)

(assert (=> d!118153 (= res!663007 (contains!5748 lt!440216 (_1!7479 (tuple2!14937 lt!440171 minValue!1220))))))

(declare-fun lt!440215 () List!20844)

(assert (=> d!118153 (= lt!440216 (ListLongMap!13636 lt!440215))))

(declare-fun lt!440214 () Unit!32870)

(declare-fun lt!440217 () Unit!32870)

(assert (=> d!118153 (= lt!440214 lt!440217)))

(assert (=> d!118153 (= (getValueByKey!513 lt!440215 (_1!7479 (tuple2!14937 lt!440171 minValue!1220))) (Some!518 (_2!7479 (tuple2!14937 lt!440171 minValue!1220))))))

(assert (=> d!118153 (= lt!440217 (lemmaContainsTupThenGetReturnValue!275 lt!440215 (_1!7479 (tuple2!14937 lt!440171 minValue!1220)) (_2!7479 (tuple2!14937 lt!440171 minValue!1220))))))

(assert (=> d!118153 (= lt!440215 (insertStrictlySorted!332 (toList!6833 lt!440169) (_1!7479 (tuple2!14937 lt!440171 minValue!1220)) (_2!7479 (tuple2!14937 lt!440171 minValue!1220))))))

(assert (=> d!118153 (= (+!3118 lt!440169 (tuple2!14937 lt!440171 minValue!1220)) lt!440216)))

(declare-fun b!992108 () Bool)

(declare-fun res!663006 () Bool)

(assert (=> b!992108 (=> (not res!663006) (not e!559526))))

(assert (=> b!992108 (= res!663006 (= (getValueByKey!513 (toList!6833 lt!440216) (_1!7479 (tuple2!14937 lt!440171 minValue!1220))) (Some!518 (_2!7479 (tuple2!14937 lt!440171 minValue!1220)))))))

(declare-fun b!992109 () Bool)

(assert (=> b!992109 (= e!559526 (contains!5749 (toList!6833 lt!440216) (tuple2!14937 lt!440171 minValue!1220)))))

(assert (= (and d!118153 res!663007) b!992108))

(assert (= (and b!992108 res!663006) b!992109))

(declare-fun m!920313 () Bool)

(assert (=> d!118153 m!920313))

(declare-fun m!920315 () Bool)

(assert (=> d!118153 m!920315))

(declare-fun m!920317 () Bool)

(assert (=> d!118153 m!920317))

(declare-fun m!920319 () Bool)

(assert (=> d!118153 m!920319))

(declare-fun m!920321 () Bool)

(assert (=> b!992108 m!920321))

(declare-fun m!920323 () Bool)

(assert (=> b!992109 m!920323))

(assert (=> b!992038 d!118153))

(declare-fun b!992134 () Bool)

(declare-fun e!559543 () Bool)

(assert (=> b!992134 (= e!559543 (validKeyInArray!0 (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!992134 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))

(declare-fun b!992135 () Bool)

(declare-fun e!559541 () Bool)

(declare-fun e!559542 () Bool)

(assert (=> b!992135 (= e!559541 e!559542)))

(declare-fun c!100860 () Bool)

(assert (=> b!992135 (= c!100860 e!559543)))

(declare-fun res!663018 () Bool)

(assert (=> b!992135 (=> (not res!663018) (not e!559543))))

(assert (=> b!992135 (= res!663018 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30642 _keys!1544)))))

(declare-fun bm!42103 () Bool)

(declare-fun call!42106 () ListLongMap!13635)

(assert (=> bm!42103 (= call!42106 (getCurrentListMapNoExtraKeys!3558 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!992136 () Bool)

(declare-fun e!559545 () Bool)

(declare-fun lt!440237 () ListLongMap!13635)

(declare-fun isEmpty!734 (ListLongMap!13635) Bool)

(assert (=> b!992136 (= e!559545 (isEmpty!734 lt!440237))))

(declare-fun b!992137 () Bool)

(assert (=> b!992137 (= e!559545 (= lt!440237 (getCurrentListMapNoExtraKeys!3558 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun b!992138 () Bool)

(declare-fun e!559547 () ListLongMap!13635)

(assert (=> b!992138 (= e!559547 call!42106)))

(declare-fun b!992139 () Bool)

(declare-fun e!559544 () Bool)

(assert (=> b!992139 (= e!559542 e!559544)))

(assert (=> b!992139 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30642 _keys!1544)))))

(declare-fun res!663016 () Bool)

(assert (=> b!992139 (= res!663016 (contains!5748 lt!440237 (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!992139 (=> (not res!663016) (not e!559544))))

(declare-fun b!992140 () Bool)

(declare-fun e!559546 () ListLongMap!13635)

(assert (=> b!992140 (= e!559546 e!559547)))

(declare-fun c!100861 () Bool)

(assert (=> b!992140 (= c!100861 (validKeyInArray!0 (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!992141 () Bool)

(declare-fun lt!440233 () Unit!32870)

(declare-fun lt!440236 () Unit!32870)

(assert (=> b!992141 (= lt!440233 lt!440236)))

(declare-fun lt!440234 () ListLongMap!13635)

(declare-fun lt!440232 () (_ BitVec 64))

(declare-fun lt!440238 () V!36065)

(declare-fun lt!440235 () (_ BitVec 64))

(assert (=> b!992141 (not (contains!5748 (+!3118 lt!440234 (tuple2!14937 lt!440232 lt!440238)) lt!440235))))

(declare-fun addStillNotContains!239 (ListLongMap!13635 (_ BitVec 64) V!36065 (_ BitVec 64)) Unit!32870)

(assert (=> b!992141 (= lt!440236 (addStillNotContains!239 lt!440234 lt!440232 lt!440238 lt!440235))))

(assert (=> b!992141 (= lt!440235 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!992141 (= lt!440238 (get!15682 (select (arr!30161 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!992141 (= lt!440232 (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!992141 (= lt!440234 call!42106)))

(assert (=> b!992141 (= e!559547 (+!3118 call!42106 (tuple2!14937 (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15682 (select (arr!30161 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!992142 () Bool)

(assert (=> b!992142 (= e!559542 e!559545)))

(declare-fun c!100859 () Bool)

(assert (=> b!992142 (= c!100859 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30642 _keys!1544)))))

(declare-fun b!992143 () Bool)

(assert (=> b!992143 (= e!559546 (ListLongMap!13636 Nil!20841))))

(declare-fun d!118155 () Bool)

(assert (=> d!118155 e!559541))

(declare-fun res!663019 () Bool)

(assert (=> d!118155 (=> (not res!663019) (not e!559541))))

(assert (=> d!118155 (= res!663019 (not (contains!5748 lt!440237 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!118155 (= lt!440237 e!559546)))

(declare-fun c!100862 () Bool)

(assert (=> d!118155 (= c!100862 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30642 _keys!1544)))))

(assert (=> d!118155 (validMask!0 mask!1948)))

(assert (=> d!118155 (= (getCurrentListMapNoExtraKeys!3558 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!440237)))

(declare-fun b!992144 () Bool)

(assert (=> b!992144 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30642 _keys!1544)))))

(assert (=> b!992144 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30641 _values!1278)))))

(assert (=> b!992144 (= e!559544 (= (apply!907 lt!440237 (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15682 (select (arr!30161 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!992145 () Bool)

(declare-fun res!663017 () Bool)

(assert (=> b!992145 (=> (not res!663017) (not e!559541))))

(assert (=> b!992145 (= res!663017 (not (contains!5748 lt!440237 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!118155 c!100862) b!992143))

(assert (= (and d!118155 (not c!100862)) b!992140))

(assert (= (and b!992140 c!100861) b!992141))

(assert (= (and b!992140 (not c!100861)) b!992138))

(assert (= (or b!992141 b!992138) bm!42103))

(assert (= (and d!118155 res!663019) b!992145))

(assert (= (and b!992145 res!663017) b!992135))

(assert (= (and b!992135 res!663018) b!992134))

(assert (= (and b!992135 c!100860) b!992139))

(assert (= (and b!992135 (not c!100860)) b!992142))

(assert (= (and b!992139 res!663016) b!992144))

(assert (= (and b!992142 c!100859) b!992137))

(assert (= (and b!992142 (not c!100859)) b!992136))

(declare-fun b_lambda!15227 () Bool)

(assert (=> (not b_lambda!15227) (not b!992141)))

(assert (=> b!992141 t!29814))

(declare-fun b_and!32291 () Bool)

(assert (= b_and!32289 (and (=> t!29814 result!13653) b_and!32291)))

(declare-fun b_lambda!15229 () Bool)

(assert (=> (not b_lambda!15229) (not b!992144)))

(assert (=> b!992144 t!29814))

(declare-fun b_and!32293 () Bool)

(assert (= b_and!32291 (and (=> t!29814 result!13653) b_and!32293)))

(assert (=> b!992140 m!920169))

(assert (=> b!992140 m!920169))

(assert (=> b!992140 m!920175))

(declare-fun m!920325 () Bool)

(assert (=> b!992137 m!920325))

(declare-fun m!920327 () Bool)

(assert (=> b!992136 m!920327))

(assert (=> b!992134 m!920169))

(assert (=> b!992134 m!920169))

(assert (=> b!992134 m!920175))

(declare-fun m!920329 () Bool)

(assert (=> d!118155 m!920329))

(assert (=> d!118155 m!920025))

(assert (=> b!992144 m!920169))

(declare-fun m!920331 () Bool)

(assert (=> b!992144 m!920331))

(assert (=> b!992144 m!920215))

(assert (=> b!992144 m!920043))

(assert (=> b!992144 m!920219))

(assert (=> b!992144 m!920169))

(assert (=> b!992144 m!920043))

(assert (=> b!992144 m!920215))

(declare-fun m!920333 () Bool)

(assert (=> b!992141 m!920333))

(declare-fun m!920335 () Bool)

(assert (=> b!992141 m!920335))

(assert (=> b!992141 m!920215))

(assert (=> b!992141 m!920043))

(assert (=> b!992141 m!920219))

(assert (=> b!992141 m!920333))

(declare-fun m!920337 () Bool)

(assert (=> b!992141 m!920337))

(declare-fun m!920339 () Bool)

(assert (=> b!992141 m!920339))

(assert (=> b!992141 m!920169))

(assert (=> b!992141 m!920043))

(assert (=> b!992141 m!920215))

(declare-fun m!920341 () Bool)

(assert (=> b!992145 m!920341))

(assert (=> b!992139 m!920169))

(assert (=> b!992139 m!920169))

(declare-fun m!920343 () Bool)

(assert (=> b!992139 m!920343))

(assert (=> bm!42103 m!920325))

(assert (=> b!992038 d!118155))

(declare-fun d!118157 () Bool)

(assert (=> d!118157 (= (apply!907 lt!440167 lt!440168) (get!15685 (getValueByKey!513 (toList!6833 lt!440167) lt!440168)))))

(declare-fun bs!28172 () Bool)

(assert (= bs!28172 d!118157))

(declare-fun m!920345 () Bool)

(assert (=> bs!28172 m!920345))

(assert (=> bs!28172 m!920345))

(declare-fun m!920347 () Bool)

(assert (=> bs!28172 m!920347))

(assert (=> b!992038 d!118157))

(declare-fun d!118159 () Bool)

(declare-fun e!559548 () Bool)

(assert (=> d!118159 e!559548))

(declare-fun res!663021 () Bool)

(assert (=> d!118159 (=> (not res!663021) (not e!559548))))

(declare-fun lt!440241 () ListLongMap!13635)

(assert (=> d!118159 (= res!663021 (contains!5748 lt!440241 (_1!7479 (tuple2!14937 lt!440163 zeroValue!1220))))))

(declare-fun lt!440240 () List!20844)

(assert (=> d!118159 (= lt!440241 (ListLongMap!13636 lt!440240))))

(declare-fun lt!440239 () Unit!32870)

(declare-fun lt!440242 () Unit!32870)

(assert (=> d!118159 (= lt!440239 lt!440242)))

(assert (=> d!118159 (= (getValueByKey!513 lt!440240 (_1!7479 (tuple2!14937 lt!440163 zeroValue!1220))) (Some!518 (_2!7479 (tuple2!14937 lt!440163 zeroValue!1220))))))

(assert (=> d!118159 (= lt!440242 (lemmaContainsTupThenGetReturnValue!275 lt!440240 (_1!7479 (tuple2!14937 lt!440163 zeroValue!1220)) (_2!7479 (tuple2!14937 lt!440163 zeroValue!1220))))))

(assert (=> d!118159 (= lt!440240 (insertStrictlySorted!332 (toList!6833 lt!440157) (_1!7479 (tuple2!14937 lt!440163 zeroValue!1220)) (_2!7479 (tuple2!14937 lt!440163 zeroValue!1220))))))

(assert (=> d!118159 (= (+!3118 lt!440157 (tuple2!14937 lt!440163 zeroValue!1220)) lt!440241)))

(declare-fun b!992146 () Bool)

(declare-fun res!663020 () Bool)

(assert (=> b!992146 (=> (not res!663020) (not e!559548))))

(assert (=> b!992146 (= res!663020 (= (getValueByKey!513 (toList!6833 lt!440241) (_1!7479 (tuple2!14937 lt!440163 zeroValue!1220))) (Some!518 (_2!7479 (tuple2!14937 lt!440163 zeroValue!1220)))))))

(declare-fun b!992147 () Bool)

(assert (=> b!992147 (= e!559548 (contains!5749 (toList!6833 lt!440241) (tuple2!14937 lt!440163 zeroValue!1220)))))

(assert (= (and d!118159 res!663021) b!992146))

(assert (= (and b!992146 res!663020) b!992147))

(declare-fun m!920349 () Bool)

(assert (=> d!118159 m!920349))

(declare-fun m!920351 () Bool)

(assert (=> d!118159 m!920351))

(declare-fun m!920353 () Bool)

(assert (=> d!118159 m!920353))

(declare-fun m!920355 () Bool)

(assert (=> d!118159 m!920355))

(declare-fun m!920357 () Bool)

(assert (=> b!992146 m!920357))

(declare-fun m!920359 () Bool)

(assert (=> b!992147 m!920359))

(assert (=> b!992038 d!118159))

(declare-fun d!118161 () Bool)

(declare-fun lt!440245 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!424 (List!20844) (InoxSet tuple2!14936))

(assert (=> d!118161 (= lt!440245 (select (content!424 (toList!6833 lt!440153)) (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!559553 () Bool)

(assert (=> d!118161 (= lt!440245 e!559553)))

(declare-fun res!663027 () Bool)

(assert (=> d!118161 (=> (not res!663027) (not e!559553))))

(assert (=> d!118161 (= res!663027 ((_ is Cons!20840) (toList!6833 lt!440153)))))

(assert (=> d!118161 (= (contains!5749 (toList!6833 lt!440153) (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!440245)))

(declare-fun b!992152 () Bool)

(declare-fun e!559554 () Bool)

(assert (=> b!992152 (= e!559553 e!559554)))

(declare-fun res!663026 () Bool)

(assert (=> b!992152 (=> res!663026 e!559554)))

(assert (=> b!992152 (= res!663026 (= (h!22008 (toList!6833 lt!440153)) (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!992153 () Bool)

(assert (=> b!992153 (= e!559554 (contains!5749 (t!29815 (toList!6833 lt!440153)) (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!118161 res!663027) b!992152))

(assert (= (and b!992152 (not res!663026)) b!992153))

(declare-fun m!920361 () Bool)

(assert (=> d!118161 m!920361))

(declare-fun m!920363 () Bool)

(assert (=> d!118161 m!920363))

(declare-fun m!920365 () Bool)

(assert (=> b!992153 m!920365))

(assert (=> b!992025 d!118161))

(declare-fun d!118163 () Bool)

(declare-fun e!559555 () Bool)

(assert (=> d!118163 e!559555))

(declare-fun res!663028 () Bool)

(assert (=> d!118163 (=> res!663028 e!559555)))

(declare-fun lt!440246 () Bool)

(assert (=> d!118163 (= res!663028 (not lt!440246))))

(declare-fun lt!440249 () Bool)

(assert (=> d!118163 (= lt!440246 lt!440249)))

(declare-fun lt!440247 () Unit!32870)

(declare-fun e!559556 () Unit!32870)

(assert (=> d!118163 (= lt!440247 e!559556)))

(declare-fun c!100863 () Bool)

(assert (=> d!118163 (= c!100863 lt!440249)))

(assert (=> d!118163 (= lt!440249 (containsKey!482 (toList!6833 lt!440159) (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> d!118163 (= (contains!5748 lt!440159 (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) lt!440246)))

(declare-fun b!992154 () Bool)

(declare-fun lt!440248 () Unit!32870)

(assert (=> b!992154 (= e!559556 lt!440248)))

(assert (=> b!992154 (= lt!440248 (lemmaContainsKeyImpliesGetValueByKeyDefined!376 (toList!6833 lt!440159) (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!992154 (isDefined!384 (getValueByKey!513 (toList!6833 lt!440159) (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!992155 () Bool)

(declare-fun Unit!32875 () Unit!32870)

(assert (=> b!992155 (= e!559556 Unit!32875)))

(declare-fun b!992156 () Bool)

(assert (=> b!992156 (= e!559555 (isDefined!384 (getValueByKey!513 (toList!6833 lt!440159) (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(assert (= (and d!118163 c!100863) b!992154))

(assert (= (and d!118163 (not c!100863)) b!992155))

(assert (= (and d!118163 (not res!663028)) b!992156))

(assert (=> d!118163 m!920169))

(declare-fun m!920367 () Bool)

(assert (=> d!118163 m!920367))

(assert (=> b!992154 m!920169))

(declare-fun m!920369 () Bool)

(assert (=> b!992154 m!920369))

(assert (=> b!992154 m!920169))

(declare-fun m!920371 () Bool)

(assert (=> b!992154 m!920371))

(assert (=> b!992154 m!920371))

(declare-fun m!920373 () Bool)

(assert (=> b!992154 m!920373))

(assert (=> b!992156 m!920169))

(assert (=> b!992156 m!920371))

(assert (=> b!992156 m!920371))

(assert (=> b!992156 m!920373))

(assert (=> b!992034 d!118163))

(declare-fun d!118165 () Bool)

(declare-fun e!559557 () Bool)

(assert (=> d!118165 e!559557))

(declare-fun res!663029 () Bool)

(assert (=> d!118165 (=> res!663029 e!559557)))

(declare-fun lt!440250 () Bool)

(assert (=> d!118165 (= res!663029 (not lt!440250))))

(declare-fun lt!440253 () Bool)

(assert (=> d!118165 (= lt!440250 lt!440253)))

(declare-fun lt!440251 () Unit!32870)

(declare-fun e!559558 () Unit!32870)

(assert (=> d!118165 (= lt!440251 e!559558)))

(declare-fun c!100864 () Bool)

(assert (=> d!118165 (= c!100864 lt!440253)))

(assert (=> d!118165 (= lt!440253 (containsKey!482 (toList!6833 lt!440125) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!118165 (= (contains!5748 lt!440125 #b1000000000000000000000000000000000000000000000000000000000000000) lt!440250)))

(declare-fun b!992157 () Bool)

(declare-fun lt!440252 () Unit!32870)

(assert (=> b!992157 (= e!559558 lt!440252)))

(assert (=> b!992157 (= lt!440252 (lemmaContainsKeyImpliesGetValueByKeyDefined!376 (toList!6833 lt!440125) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!992157 (isDefined!384 (getValueByKey!513 (toList!6833 lt!440125) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!992158 () Bool)

(declare-fun Unit!32876 () Unit!32870)

(assert (=> b!992158 (= e!559558 Unit!32876)))

(declare-fun b!992159 () Bool)

(assert (=> b!992159 (= e!559557 (isDefined!384 (getValueByKey!513 (toList!6833 lt!440125) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!118165 c!100864) b!992157))

(assert (= (and d!118165 (not c!100864)) b!992158))

(assert (= (and d!118165 (not res!663029)) b!992159))

(declare-fun m!920375 () Bool)

(assert (=> d!118165 m!920375))

(declare-fun m!920377 () Bool)

(assert (=> b!992157 m!920377))

(declare-fun m!920379 () Bool)

(assert (=> b!992157 m!920379))

(assert (=> b!992157 m!920379))

(declare-fun m!920381 () Bool)

(assert (=> b!992157 m!920381))

(assert (=> b!992159 m!920379))

(assert (=> b!992159 m!920379))

(assert (=> b!992159 m!920381))

(assert (=> bm!42084 d!118165))

(assert (=> b!992076 d!118127))

(declare-fun d!118167 () Bool)

(declare-fun e!559559 () Bool)

(assert (=> d!118167 e!559559))

(declare-fun res!663031 () Bool)

(assert (=> d!118167 (=> (not res!663031) (not e!559559))))

(declare-fun lt!440256 () ListLongMap!13635)

(assert (=> d!118167 (= res!663031 (contains!5748 lt!440256 (_1!7479 (ite (or c!100831 c!100832) (tuple2!14937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun lt!440255 () List!20844)

(assert (=> d!118167 (= lt!440256 (ListLongMap!13636 lt!440255))))

(declare-fun lt!440254 () Unit!32870)

(declare-fun lt!440257 () Unit!32870)

(assert (=> d!118167 (= lt!440254 lt!440257)))

(assert (=> d!118167 (= (getValueByKey!513 lt!440255 (_1!7479 (ite (or c!100831 c!100832) (tuple2!14937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!518 (_2!7479 (ite (or c!100831 c!100832) (tuple2!14937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!118167 (= lt!440257 (lemmaContainsTupThenGetReturnValue!275 lt!440255 (_1!7479 (ite (or c!100831 c!100832) (tuple2!14937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7479 (ite (or c!100831 c!100832) (tuple2!14937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!118167 (= lt!440255 (insertStrictlySorted!332 (toList!6833 (ite c!100831 call!42088 (ite c!100832 call!42084 call!42089))) (_1!7479 (ite (or c!100831 c!100832) (tuple2!14937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7479 (ite (or c!100831 c!100832) (tuple2!14937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!118167 (= (+!3118 (ite c!100831 call!42088 (ite c!100832 call!42084 call!42089)) (ite (or c!100831 c!100832) (tuple2!14937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) lt!440256)))

(declare-fun b!992160 () Bool)

(declare-fun res!663030 () Bool)

(assert (=> b!992160 (=> (not res!663030) (not e!559559))))

(assert (=> b!992160 (= res!663030 (= (getValueByKey!513 (toList!6833 lt!440256) (_1!7479 (ite (or c!100831 c!100832) (tuple2!14937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!518 (_2!7479 (ite (or c!100831 c!100832) (tuple2!14937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))))

(declare-fun b!992161 () Bool)

(assert (=> b!992161 (= e!559559 (contains!5749 (toList!6833 lt!440256) (ite (or c!100831 c!100832) (tuple2!14937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!118167 res!663031) b!992160))

(assert (= (and b!992160 res!663030) b!992161))

(declare-fun m!920383 () Bool)

(assert (=> d!118167 m!920383))

(declare-fun m!920385 () Bool)

(assert (=> d!118167 m!920385))

(declare-fun m!920387 () Bool)

(assert (=> d!118167 m!920387))

(declare-fun m!920389 () Bool)

(assert (=> d!118167 m!920389))

(declare-fun m!920391 () Bool)

(assert (=> b!992160 m!920391))

(declare-fun m!920393 () Bool)

(assert (=> b!992161 m!920393))

(assert (=> bm!42087 d!118167))

(declare-fun d!118169 () Bool)

(assert (=> d!118169 (= (apply!907 lt!440159 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15685 (getValueByKey!513 (toList!6833 lt!440159) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28173 () Bool)

(assert (= bs!28173 d!118169))

(declare-fun m!920395 () Bool)

(assert (=> bs!28173 m!920395))

(assert (=> bs!28173 m!920395))

(declare-fun m!920397 () Bool)

(assert (=> bs!28173 m!920397))

(assert (=> b!992036 d!118169))

(assert (=> b!992017 d!118117))

(declare-fun d!118171 () Bool)

(assert (=> d!118171 (= (validKeyInArray!0 (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (and (not (= (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!992032 d!118171))

(declare-fun b!992162 () Bool)

(declare-fun e!559562 () Bool)

(assert (=> b!992162 (= e!559562 (validKeyInArray!0 (select (arr!30162 _keys!1544) from!1932)))))

(assert (=> b!992162 (bvsge from!1932 #b00000000000000000000000000000000)))

(declare-fun b!992163 () Bool)

(declare-fun e!559560 () Bool)

(declare-fun e!559561 () Bool)

(assert (=> b!992163 (= e!559560 e!559561)))

(declare-fun c!100866 () Bool)

(assert (=> b!992163 (= c!100866 e!559562)))

(declare-fun res!663034 () Bool)

(assert (=> b!992163 (=> (not res!663034) (not e!559562))))

(assert (=> b!992163 (= res!663034 (bvslt from!1932 (size!30642 _keys!1544)))))

(declare-fun bm!42104 () Bool)

(declare-fun call!42107 () ListLongMap!13635)

(assert (=> bm!42104 (= call!42107 (getCurrentListMapNoExtraKeys!3558 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!992164 () Bool)

(declare-fun e!559564 () Bool)

(declare-fun lt!440263 () ListLongMap!13635)

(assert (=> b!992164 (= e!559564 (isEmpty!734 lt!440263))))

(declare-fun b!992165 () Bool)

(assert (=> b!992165 (= e!559564 (= lt!440263 (getCurrentListMapNoExtraKeys!3558 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun b!992166 () Bool)

(declare-fun e!559566 () ListLongMap!13635)

(assert (=> b!992166 (= e!559566 call!42107)))

(declare-fun b!992167 () Bool)

(declare-fun e!559563 () Bool)

(assert (=> b!992167 (= e!559561 e!559563)))

(assert (=> b!992167 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30642 _keys!1544)))))

(declare-fun res!663032 () Bool)

(assert (=> b!992167 (= res!663032 (contains!5748 lt!440263 (select (arr!30162 _keys!1544) from!1932)))))

(assert (=> b!992167 (=> (not res!663032) (not e!559563))))

(declare-fun b!992168 () Bool)

(declare-fun e!559565 () ListLongMap!13635)

(assert (=> b!992168 (= e!559565 e!559566)))

(declare-fun c!100867 () Bool)

(assert (=> b!992168 (= c!100867 (validKeyInArray!0 (select (arr!30162 _keys!1544) from!1932)))))

(declare-fun b!992169 () Bool)

(declare-fun lt!440259 () Unit!32870)

(declare-fun lt!440262 () Unit!32870)

(assert (=> b!992169 (= lt!440259 lt!440262)))

(declare-fun lt!440261 () (_ BitVec 64))

(declare-fun lt!440258 () (_ BitVec 64))

(declare-fun lt!440260 () ListLongMap!13635)

(declare-fun lt!440264 () V!36065)

(assert (=> b!992169 (not (contains!5748 (+!3118 lt!440260 (tuple2!14937 lt!440258 lt!440264)) lt!440261))))

(assert (=> b!992169 (= lt!440262 (addStillNotContains!239 lt!440260 lt!440258 lt!440264 lt!440261))))

(assert (=> b!992169 (= lt!440261 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!992169 (= lt!440264 (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!992169 (= lt!440258 (select (arr!30162 _keys!1544) from!1932))))

(assert (=> b!992169 (= lt!440260 call!42107)))

(assert (=> b!992169 (= e!559566 (+!3118 call!42107 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!992170 () Bool)

(assert (=> b!992170 (= e!559561 e!559564)))

(declare-fun c!100865 () Bool)

(assert (=> b!992170 (= c!100865 (bvslt from!1932 (size!30642 _keys!1544)))))

(declare-fun b!992171 () Bool)

(assert (=> b!992171 (= e!559565 (ListLongMap!13636 Nil!20841))))

(declare-fun d!118173 () Bool)

(assert (=> d!118173 e!559560))

(declare-fun res!663035 () Bool)

(assert (=> d!118173 (=> (not res!663035) (not e!559560))))

(assert (=> d!118173 (= res!663035 (not (contains!5748 lt!440263 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!118173 (= lt!440263 e!559565)))

(declare-fun c!100868 () Bool)

(assert (=> d!118173 (= c!100868 (bvsge from!1932 (size!30642 _keys!1544)))))

(assert (=> d!118173 (validMask!0 mask!1948)))

(assert (=> d!118173 (= (getCurrentListMapNoExtraKeys!3558 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) lt!440263)))

(declare-fun b!992172 () Bool)

(assert (=> b!992172 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30642 _keys!1544)))))

(assert (=> b!992172 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30641 _values!1278)))))

(assert (=> b!992172 (= e!559563 (= (apply!907 lt!440263 (select (arr!30162 _keys!1544) from!1932)) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!992173 () Bool)

(declare-fun res!663033 () Bool)

(assert (=> b!992173 (=> (not res!663033) (not e!559560))))

(assert (=> b!992173 (= res!663033 (not (contains!5748 lt!440263 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!118173 c!100868) b!992171))

(assert (= (and d!118173 (not c!100868)) b!992168))

(assert (= (and b!992168 c!100867) b!992169))

(assert (= (and b!992168 (not c!100867)) b!992166))

(assert (= (or b!992169 b!992166) bm!42104))

(assert (= (and d!118173 res!663035) b!992173))

(assert (= (and b!992173 res!663033) b!992163))

(assert (= (and b!992163 res!663034) b!992162))

(assert (= (and b!992163 c!100866) b!992167))

(assert (= (and b!992163 (not c!100866)) b!992170))

(assert (= (and b!992167 res!663032) b!992172))

(assert (= (and b!992170 c!100865) b!992165))

(assert (= (and b!992170 (not c!100865)) b!992164))

(declare-fun b_lambda!15231 () Bool)

(assert (=> (not b_lambda!15231) (not b!992169)))

(assert (=> b!992169 t!29814))

(declare-fun b_and!32295 () Bool)

(assert (= b_and!32293 (and (=> t!29814 result!13653) b_and!32295)))

(declare-fun b_lambda!15233 () Bool)

(assert (=> (not b_lambda!15233) (not b!992172)))

(assert (=> b!992172 t!29814))

(declare-fun b_and!32297 () Bool)

(assert (= b_and!32295 (and (=> t!29814 result!13653) b_and!32297)))

(assert (=> b!992168 m!920033))

(assert (=> b!992168 m!920033))

(assert (=> b!992168 m!920047))

(declare-fun m!920399 () Bool)

(assert (=> b!992165 m!920399))

(declare-fun m!920401 () Bool)

(assert (=> b!992164 m!920401))

(assert (=> b!992162 m!920033))

(assert (=> b!992162 m!920033))

(assert (=> b!992162 m!920047))

(declare-fun m!920403 () Bool)

(assert (=> d!118173 m!920403))

(assert (=> d!118173 m!920025))

(assert (=> b!992172 m!920033))

(declare-fun m!920405 () Bool)

(assert (=> b!992172 m!920405))

(assert (=> b!992172 m!920035))

(assert (=> b!992172 m!920043))

(assert (=> b!992172 m!920045))

(assert (=> b!992172 m!920033))

(assert (=> b!992172 m!920043))

(assert (=> b!992172 m!920035))

(declare-fun m!920407 () Bool)

(assert (=> b!992169 m!920407))

(declare-fun m!920409 () Bool)

(assert (=> b!992169 m!920409))

(assert (=> b!992169 m!920035))

(assert (=> b!992169 m!920043))

(assert (=> b!992169 m!920045))

(assert (=> b!992169 m!920407))

(declare-fun m!920411 () Bool)

(assert (=> b!992169 m!920411))

(declare-fun m!920413 () Bool)

(assert (=> b!992169 m!920413))

(assert (=> b!992169 m!920033))

(assert (=> b!992169 m!920043))

(assert (=> b!992169 m!920035))

(declare-fun m!920415 () Bool)

(assert (=> b!992173 m!920415))

(assert (=> b!992167 m!920033))

(assert (=> b!992167 m!920033))

(declare-fun m!920417 () Bool)

(assert (=> b!992167 m!920417))

(assert (=> bm!42104 m!920399))

(assert (=> bm!42082 d!118173))

(declare-fun d!118175 () Bool)

(assert (=> d!118175 (= (apply!907 lt!440159 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15685 (getValueByKey!513 (toList!6833 lt!440159) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28174 () Bool)

(assert (= bs!28174 d!118175))

(declare-fun m!920419 () Bool)

(assert (=> bs!28174 m!920419))

(assert (=> bs!28174 m!920419))

(declare-fun m!920421 () Bool)

(assert (=> bs!28174 m!920421))

(assert (=> b!992033 d!118175))

(declare-fun c!100869 () Bool)

(declare-fun bm!42105 () Bool)

(declare-fun call!42108 () Bool)

(assert (=> bm!42105 (= call!42108 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!100869 (Cons!20841 (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!100847 (Cons!20841 (select (arr!30162 _keys!1544) #b00000000000000000000000000000000) Nil!20842) Nil!20842)) (ite c!100847 (Cons!20841 (select (arr!30162 _keys!1544) #b00000000000000000000000000000000) Nil!20842) Nil!20842))))))

(declare-fun b!992174 () Bool)

(declare-fun e!559567 () Bool)

(assert (=> b!992174 (= e!559567 (contains!5750 (ite c!100847 (Cons!20841 (select (arr!30162 _keys!1544) #b00000000000000000000000000000000) Nil!20842) Nil!20842) (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!992175 () Bool)

(declare-fun e!559569 () Bool)

(declare-fun e!559570 () Bool)

(assert (=> b!992175 (= e!559569 e!559570)))

(assert (=> b!992175 (= c!100869 (validKeyInArray!0 (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!118177 () Bool)

(declare-fun res!663038 () Bool)

(declare-fun e!559568 () Bool)

(assert (=> d!118177 (=> res!663038 e!559568)))

(assert (=> d!118177 (= res!663038 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30642 _keys!1544)))))

(assert (=> d!118177 (= (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100847 (Cons!20841 (select (arr!30162 _keys!1544) #b00000000000000000000000000000000) Nil!20842) Nil!20842)) e!559568)))

(declare-fun b!992176 () Bool)

(assert (=> b!992176 (= e!559570 call!42108)))

(declare-fun b!992177 () Bool)

(assert (=> b!992177 (= e!559568 e!559569)))

(declare-fun res!663036 () Bool)

(assert (=> b!992177 (=> (not res!663036) (not e!559569))))

(assert (=> b!992177 (= res!663036 (not e!559567))))

(declare-fun res!663037 () Bool)

(assert (=> b!992177 (=> (not res!663037) (not e!559567))))

(assert (=> b!992177 (= res!663037 (validKeyInArray!0 (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!992178 () Bool)

(assert (=> b!992178 (= e!559570 call!42108)))

(assert (= (and d!118177 (not res!663038)) b!992177))

(assert (= (and b!992177 res!663037) b!992174))

(assert (= (and b!992177 res!663036) b!992175))

(assert (= (and b!992175 c!100869) b!992176))

(assert (= (and b!992175 (not c!100869)) b!992178))

(assert (= (or b!992176 b!992178) bm!42105))

(declare-fun m!920423 () Bool)

(assert (=> bm!42105 m!920423))

(declare-fun m!920425 () Bool)

(assert (=> bm!42105 m!920425))

(assert (=> b!992174 m!920423))

(assert (=> b!992174 m!920423))

(declare-fun m!920427 () Bool)

(assert (=> b!992174 m!920427))

(assert (=> b!992175 m!920423))

(assert (=> b!992175 m!920423))

(declare-fun m!920429 () Bool)

(assert (=> b!992175 m!920429))

(assert (=> b!992177 m!920423))

(assert (=> b!992177 m!920423))

(assert (=> b!992177 m!920429))

(assert (=> bm!42100 d!118177))

(declare-fun d!118179 () Bool)

(declare-fun e!559571 () Bool)

(assert (=> d!118179 e!559571))

(declare-fun res!663040 () Bool)

(assert (=> d!118179 (=> (not res!663040) (not e!559571))))

(declare-fun lt!440267 () ListLongMap!13635)

(assert (=> d!118179 (= res!663040 (contains!5748 lt!440267 (_1!7479 (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!440266 () List!20844)

(assert (=> d!118179 (= lt!440267 (ListLongMap!13636 lt!440266))))

(declare-fun lt!440265 () Unit!32870)

(declare-fun lt!440268 () Unit!32870)

(assert (=> d!118179 (= lt!440265 lt!440268)))

(assert (=> d!118179 (= (getValueByKey!513 lt!440266 (_1!7479 (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!518 (_2!7479 (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!118179 (= lt!440268 (lemmaContainsTupThenGetReturnValue!275 lt!440266 (_1!7479 (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7479 (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!118179 (= lt!440266 (insertStrictlySorted!332 (toList!6833 call!42086) (_1!7479 (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7479 (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!118179 (= (+!3118 call!42086 (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!440267)))

(declare-fun b!992179 () Bool)

(declare-fun res!663039 () Bool)

(assert (=> b!992179 (=> (not res!663039) (not e!559571))))

(assert (=> b!992179 (= res!663039 (= (getValueByKey!513 (toList!6833 lt!440267) (_1!7479 (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!518 (_2!7479 (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!992180 () Bool)

(assert (=> b!992180 (= e!559571 (contains!5749 (toList!6833 lt!440267) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!118179 res!663040) b!992179))

(assert (= (and b!992179 res!663039) b!992180))

(declare-fun m!920431 () Bool)

(assert (=> d!118179 m!920431))

(declare-fun m!920433 () Bool)

(assert (=> d!118179 m!920433))

(declare-fun m!920435 () Bool)

(assert (=> d!118179 m!920435))

(declare-fun m!920437 () Bool)

(assert (=> d!118179 m!920437))

(declare-fun m!920439 () Bool)

(assert (=> b!992179 m!920439))

(declare-fun m!920441 () Bool)

(assert (=> b!992180 m!920441))

(assert (=> b!992018 d!118179))

(declare-fun d!118181 () Bool)

(declare-fun lt!440271 () Bool)

(declare-fun content!425 (List!20845) (InoxSet (_ BitVec 64)))

(assert (=> d!118181 (= lt!440271 (select (content!425 Nil!20842) (select (arr!30162 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun e!559577 () Bool)

(assert (=> d!118181 (= lt!440271 e!559577)))

(declare-fun res!663046 () Bool)

(assert (=> d!118181 (=> (not res!663046) (not e!559577))))

(assert (=> d!118181 (= res!663046 ((_ is Cons!20841) Nil!20842))))

(assert (=> d!118181 (= (contains!5750 Nil!20842 (select (arr!30162 _keys!1544) #b00000000000000000000000000000000)) lt!440271)))

(declare-fun b!992185 () Bool)

(declare-fun e!559576 () Bool)

(assert (=> b!992185 (= e!559577 e!559576)))

(declare-fun res!663045 () Bool)

(assert (=> b!992185 (=> res!663045 e!559576)))

(assert (=> b!992185 (= res!663045 (= (h!22009 Nil!20842) (select (arr!30162 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!992186 () Bool)

(assert (=> b!992186 (= e!559576 (contains!5750 (t!29816 Nil!20842) (select (arr!30162 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!118181 res!663046) b!992185))

(assert (= (and b!992185 (not res!663045)) b!992186))

(declare-fun m!920443 () Bool)

(assert (=> d!118181 m!920443))

(assert (=> d!118181 m!920229))

(declare-fun m!920445 () Bool)

(assert (=> d!118181 m!920445))

(assert (=> b!992186 m!920229))

(declare-fun m!920447 () Bool)

(assert (=> b!992186 m!920447))

(assert (=> b!992075 d!118181))

(declare-fun d!118183 () Bool)

(assert (=> d!118183 (= (apply!907 lt!440125 (select (arr!30162 _keys!1544) from!1932)) (get!15685 (getValueByKey!513 (toList!6833 lt!440125) (select (arr!30162 _keys!1544) from!1932))))))

(declare-fun bs!28175 () Bool)

(assert (= bs!28175 d!118183))

(assert (=> bs!28175 m!920033))

(declare-fun m!920449 () Bool)

(assert (=> bs!28175 m!920449))

(assert (=> bs!28175 m!920449))

(declare-fun m!920451 () Bool)

(assert (=> bs!28175 m!920451))

(assert (=> b!992019 d!118183))

(assert (=> b!992019 d!118113))

(declare-fun c!100874 () Bool)

(declare-fun d!118185 () Bool)

(assert (=> d!118185 (= c!100874 (and ((_ is Cons!20840) (toList!6833 lt!440153)) (= (_1!7479 (h!22008 (toList!6833 lt!440153))) (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!559582 () Option!519)

(assert (=> d!118185 (= (getValueByKey!513 (toList!6833 lt!440153) (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!559582)))

(declare-fun e!559583 () Option!519)

(declare-fun b!992197 () Bool)

(assert (=> b!992197 (= e!559583 (getValueByKey!513 (t!29815 (toList!6833 lt!440153)) (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!992196 () Bool)

(assert (=> b!992196 (= e!559582 e!559583)))

(declare-fun c!100875 () Bool)

(assert (=> b!992196 (= c!100875 (and ((_ is Cons!20840) (toList!6833 lt!440153)) (not (= (_1!7479 (h!22008 (toList!6833 lt!440153))) (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!992198 () Bool)

(assert (=> b!992198 (= e!559583 None!517)))

(declare-fun b!992195 () Bool)

(assert (=> b!992195 (= e!559582 (Some!518 (_2!7479 (h!22008 (toList!6833 lt!440153)))))))

(assert (= (and d!118185 c!100874) b!992195))

(assert (= (and d!118185 (not c!100874)) b!992196))

(assert (= (and b!992196 c!100875) b!992197))

(assert (= (and b!992196 (not c!100875)) b!992198))

(declare-fun m!920453 () Bool)

(assert (=> b!992197 m!920453))

(assert (=> b!992024 d!118185))

(declare-fun bm!42106 () Bool)

(declare-fun call!42109 () Bool)

(assert (=> bm!42106 (= call!42109 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!992199 () Bool)

(declare-fun e!559585 () Bool)

(declare-fun e!559586 () Bool)

(assert (=> b!992199 (= e!559585 e!559586)))

(declare-fun lt!440272 () (_ BitVec 64))

(assert (=> b!992199 (= lt!440272 (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!440273 () Unit!32870)

(assert (=> b!992199 (= lt!440273 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!440272 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!992199 (arrayContainsKey!0 _keys!1544 lt!440272 #b00000000000000000000000000000000)))

(declare-fun lt!440274 () Unit!32870)

(assert (=> b!992199 (= lt!440274 lt!440273)))

(declare-fun res!663047 () Bool)

(assert (=> b!992199 (= res!663047 (= (seekEntryOrOpen!0 (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1544 mask!1948) (Found!9168 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!992199 (=> (not res!663047) (not e!559586))))

(declare-fun b!992200 () Bool)

(declare-fun e!559584 () Bool)

(assert (=> b!992200 (= e!559584 e!559585)))

(declare-fun c!100876 () Bool)

(assert (=> b!992200 (= c!100876 (validKeyInArray!0 (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!118187 () Bool)

(declare-fun res!663048 () Bool)

(assert (=> d!118187 (=> res!663048 e!559584)))

(assert (=> d!118187 (= res!663048 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30642 _keys!1544)))))

(assert (=> d!118187 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948) e!559584)))

(declare-fun b!992201 () Bool)

(assert (=> b!992201 (= e!559586 call!42109)))

(declare-fun b!992202 () Bool)

(assert (=> b!992202 (= e!559585 call!42109)))

(assert (= (and d!118187 (not res!663048)) b!992200))

(assert (= (and b!992200 c!100876) b!992199))

(assert (= (and b!992200 (not c!100876)) b!992202))

(assert (= (and b!992199 res!663047) b!992201))

(assert (= (or b!992201 b!992202) bm!42106))

(declare-fun m!920455 () Bool)

(assert (=> bm!42106 m!920455))

(assert (=> b!992199 m!920423))

(declare-fun m!920457 () Bool)

(assert (=> b!992199 m!920457))

(declare-fun m!920459 () Bool)

(assert (=> b!992199 m!920459))

(assert (=> b!992199 m!920423))

(declare-fun m!920461 () Bool)

(assert (=> b!992199 m!920461))

(assert (=> b!992200 m!920423))

(assert (=> b!992200 m!920423))

(assert (=> b!992200 m!920429))

(assert (=> bm!42097 d!118187))

(declare-fun d!118189 () Bool)

(assert (=> d!118189 (arrayContainsKey!0 _keys!1544 lt!440183 #b00000000000000000000000000000000)))

(declare-fun lt!440277 () Unit!32870)

(declare-fun choose!13 (array!62632 (_ BitVec 64) (_ BitVec 32)) Unit!32870)

(assert (=> d!118189 (= lt!440277 (choose!13 _keys!1544 lt!440183 #b00000000000000000000000000000000))))

(assert (=> d!118189 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!118189 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!440183 #b00000000000000000000000000000000) lt!440277)))

(declare-fun bs!28176 () Bool)

(assert (= bs!28176 d!118189))

(assert (=> bs!28176 m!920233))

(declare-fun m!920463 () Bool)

(assert (=> bs!28176 m!920463))

(assert (=> b!992061 d!118189))

(declare-fun d!118191 () Bool)

(declare-fun res!663053 () Bool)

(declare-fun e!559591 () Bool)

(assert (=> d!118191 (=> res!663053 e!559591)))

(assert (=> d!118191 (= res!663053 (= (select (arr!30162 _keys!1544) #b00000000000000000000000000000000) lt!440183))))

(assert (=> d!118191 (= (arrayContainsKey!0 _keys!1544 lt!440183 #b00000000000000000000000000000000) e!559591)))

(declare-fun b!992207 () Bool)

(declare-fun e!559592 () Bool)

(assert (=> b!992207 (= e!559591 e!559592)))

(declare-fun res!663054 () Bool)

(assert (=> b!992207 (=> (not res!663054) (not e!559592))))

(assert (=> b!992207 (= res!663054 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30642 _keys!1544)))))

(declare-fun b!992208 () Bool)

(assert (=> b!992208 (= e!559592 (arrayContainsKey!0 _keys!1544 lt!440183 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!118191 (not res!663053)) b!992207))

(assert (= (and b!992207 res!663054) b!992208))

(assert (=> d!118191 m!920229))

(declare-fun m!920465 () Bool)

(assert (=> b!992208 m!920465))

(assert (=> b!992061 d!118191))

(declare-fun b!992221 () Bool)

(declare-fun c!100885 () Bool)

(declare-fun lt!440284 () (_ BitVec 64))

(assert (=> b!992221 (= c!100885 (= lt!440284 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!559600 () SeekEntryResult!9168)

(declare-fun e!559599 () SeekEntryResult!9168)

(assert (=> b!992221 (= e!559600 e!559599)))

(declare-fun b!992223 () Bool)

(declare-fun e!559601 () SeekEntryResult!9168)

(assert (=> b!992223 (= e!559601 e!559600)))

(declare-fun lt!440285 () SeekEntryResult!9168)

(assert (=> b!992223 (= lt!440284 (select (arr!30162 _keys!1544) (index!39045 lt!440285)))))

(declare-fun c!100883 () Bool)

(assert (=> b!992223 (= c!100883 (= lt!440284 (select (arr!30162 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!992224 () Bool)

(assert (=> b!992224 (= e!559599 (MissingZero!9168 (index!39045 lt!440285)))))

(declare-fun b!992225 () Bool)

(assert (=> b!992225 (= e!559600 (Found!9168 (index!39045 lt!440285)))))

(declare-fun b!992226 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62632 (_ BitVec 32)) SeekEntryResult!9168)

(assert (=> b!992226 (= e!559599 (seekKeyOrZeroReturnVacant!0 (x!86200 lt!440285) (index!39045 lt!440285) (index!39045 lt!440285) (select (arr!30162 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948))))

(declare-fun d!118193 () Bool)

(declare-fun lt!440286 () SeekEntryResult!9168)

(assert (=> d!118193 (and (or ((_ is Undefined!9168) lt!440286) (not ((_ is Found!9168) lt!440286)) (and (bvsge (index!39044 lt!440286) #b00000000000000000000000000000000) (bvslt (index!39044 lt!440286) (size!30642 _keys!1544)))) (or ((_ is Undefined!9168) lt!440286) ((_ is Found!9168) lt!440286) (not ((_ is MissingZero!9168) lt!440286)) (and (bvsge (index!39043 lt!440286) #b00000000000000000000000000000000) (bvslt (index!39043 lt!440286) (size!30642 _keys!1544)))) (or ((_ is Undefined!9168) lt!440286) ((_ is Found!9168) lt!440286) ((_ is MissingZero!9168) lt!440286) (not ((_ is MissingVacant!9168) lt!440286)) (and (bvsge (index!39046 lt!440286) #b00000000000000000000000000000000) (bvslt (index!39046 lt!440286) (size!30642 _keys!1544)))) (or ((_ is Undefined!9168) lt!440286) (ite ((_ is Found!9168) lt!440286) (= (select (arr!30162 _keys!1544) (index!39044 lt!440286)) (select (arr!30162 _keys!1544) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9168) lt!440286) (= (select (arr!30162 _keys!1544) (index!39043 lt!440286)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9168) lt!440286) (= (select (arr!30162 _keys!1544) (index!39046 lt!440286)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!118193 (= lt!440286 e!559601)))

(declare-fun c!100884 () Bool)

(assert (=> d!118193 (= c!100884 (and ((_ is Intermediate!9168) lt!440285) (undefined!9980 lt!440285)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62632 (_ BitVec 32)) SeekEntryResult!9168)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!118193 (= lt!440285 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30162 _keys!1544) #b00000000000000000000000000000000) mask!1948) (select (arr!30162 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948))))

(assert (=> d!118193 (validMask!0 mask!1948)))

(assert (=> d!118193 (= (seekEntryOrOpen!0 (select (arr!30162 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) lt!440286)))

(declare-fun b!992222 () Bool)

(assert (=> b!992222 (= e!559601 Undefined!9168)))

(assert (= (and d!118193 c!100884) b!992222))

(assert (= (and d!118193 (not c!100884)) b!992223))

(assert (= (and b!992223 c!100883) b!992225))

(assert (= (and b!992223 (not c!100883)) b!992221))

(assert (= (and b!992221 c!100885) b!992224))

(assert (= (and b!992221 (not c!100885)) b!992226))

(declare-fun m!920467 () Bool)

(assert (=> b!992223 m!920467))

(assert (=> b!992226 m!920229))

(declare-fun m!920469 () Bool)

(assert (=> b!992226 m!920469))

(declare-fun m!920471 () Bool)

(assert (=> d!118193 m!920471))

(declare-fun m!920473 () Bool)

(assert (=> d!118193 m!920473))

(declare-fun m!920475 () Bool)

(assert (=> d!118193 m!920475))

(assert (=> d!118193 m!920025))

(assert (=> d!118193 m!920229))

(declare-fun m!920477 () Bool)

(assert (=> d!118193 m!920477))

(assert (=> d!118193 m!920477))

(assert (=> d!118193 m!920229))

(declare-fun m!920479 () Bool)

(assert (=> d!118193 m!920479))

(assert (=> b!992061 d!118193))

(assert (=> b!992062 d!118127))

(declare-fun d!118195 () Bool)

(declare-fun e!559602 () Bool)

(assert (=> d!118195 e!559602))

(declare-fun res!663055 () Bool)

(assert (=> d!118195 (=> res!663055 e!559602)))

(declare-fun lt!440287 () Bool)

(assert (=> d!118195 (= res!663055 (not lt!440287))))

(declare-fun lt!440290 () Bool)

(assert (=> d!118195 (= lt!440287 lt!440290)))

(declare-fun lt!440288 () Unit!32870)

(declare-fun e!559603 () Unit!32870)

(assert (=> d!118195 (= lt!440288 e!559603)))

(declare-fun c!100886 () Bool)

(assert (=> d!118195 (= c!100886 lt!440290)))

(assert (=> d!118195 (= lt!440290 (containsKey!482 (toList!6833 lt!440159) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!118195 (= (contains!5748 lt!440159 #b1000000000000000000000000000000000000000000000000000000000000000) lt!440287)))

(declare-fun b!992227 () Bool)

(declare-fun lt!440289 () Unit!32870)

(assert (=> b!992227 (= e!559603 lt!440289)))

(assert (=> b!992227 (= lt!440289 (lemmaContainsKeyImpliesGetValueByKeyDefined!376 (toList!6833 lt!440159) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!992227 (isDefined!384 (getValueByKey!513 (toList!6833 lt!440159) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!992228 () Bool)

(declare-fun Unit!32877 () Unit!32870)

(assert (=> b!992228 (= e!559603 Unit!32877)))

(declare-fun b!992229 () Bool)

(assert (=> b!992229 (= e!559602 (isDefined!384 (getValueByKey!513 (toList!6833 lt!440159) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!118195 c!100886) b!992227))

(assert (= (and d!118195 (not c!100886)) b!992228))

(assert (= (and d!118195 (not res!663055)) b!992229))

(declare-fun m!920481 () Bool)

(assert (=> d!118195 m!920481))

(declare-fun m!920483 () Bool)

(assert (=> b!992227 m!920483))

(assert (=> b!992227 m!920419))

(assert (=> b!992227 m!920419))

(declare-fun m!920485 () Bool)

(assert (=> b!992227 m!920485))

(assert (=> b!992229 m!920419))

(assert (=> b!992229 m!920419))

(assert (=> b!992229 m!920485))

(assert (=> bm!42091 d!118195))

(assert (=> d!118111 d!118121))

(declare-fun d!118197 () Bool)

(declare-fun e!559604 () Bool)

(assert (=> d!118197 e!559604))

(declare-fun res!663057 () Bool)

(assert (=> d!118197 (=> (not res!663057) (not e!559604))))

(declare-fun lt!440293 () ListLongMap!13635)

(assert (=> d!118197 (= res!663057 (contains!5748 lt!440293 (_1!7479 (ite (or c!100837 c!100838) (tuple2!14937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun lt!440292 () List!20844)

(assert (=> d!118197 (= lt!440293 (ListLongMap!13636 lt!440292))))

(declare-fun lt!440291 () Unit!32870)

(declare-fun lt!440294 () Unit!32870)

(assert (=> d!118197 (= lt!440291 lt!440294)))

(assert (=> d!118197 (= (getValueByKey!513 lt!440292 (_1!7479 (ite (or c!100837 c!100838) (tuple2!14937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!518 (_2!7479 (ite (or c!100837 c!100838) (tuple2!14937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!118197 (= lt!440294 (lemmaContainsTupThenGetReturnValue!275 lt!440292 (_1!7479 (ite (or c!100837 c!100838) (tuple2!14937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7479 (ite (or c!100837 c!100838) (tuple2!14937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!118197 (= lt!440292 (insertStrictlySorted!332 (toList!6833 (ite c!100837 call!42095 (ite c!100838 call!42091 call!42096))) (_1!7479 (ite (or c!100837 c!100838) (tuple2!14937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7479 (ite (or c!100837 c!100838) (tuple2!14937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!118197 (= (+!3118 (ite c!100837 call!42095 (ite c!100838 call!42091 call!42096)) (ite (or c!100837 c!100838) (tuple2!14937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) lt!440293)))

(declare-fun b!992230 () Bool)

(declare-fun res!663056 () Bool)

(assert (=> b!992230 (=> (not res!663056) (not e!559604))))

(assert (=> b!992230 (= res!663056 (= (getValueByKey!513 (toList!6833 lt!440293) (_1!7479 (ite (or c!100837 c!100838) (tuple2!14937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!518 (_2!7479 (ite (or c!100837 c!100838) (tuple2!14937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))))

(declare-fun b!992231 () Bool)

(assert (=> b!992231 (= e!559604 (contains!5749 (toList!6833 lt!440293) (ite (or c!100837 c!100838) (tuple2!14937 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!118197 res!663057) b!992230))

(assert (= (and b!992230 res!663056) b!992231))

(declare-fun m!920487 () Bool)

(assert (=> d!118197 m!920487))

(declare-fun m!920489 () Bool)

(assert (=> d!118197 m!920489))

(declare-fun m!920491 () Bool)

(assert (=> d!118197 m!920491))

(declare-fun m!920493 () Bool)

(assert (=> d!118197 m!920493))

(declare-fun m!920495 () Bool)

(assert (=> b!992230 m!920495))

(declare-fun m!920497 () Bool)

(assert (=> b!992231 m!920497))

(assert (=> bm!42094 d!118197))

(declare-fun d!118199 () Bool)

(declare-fun e!559605 () Bool)

(assert (=> d!118199 e!559605))

(declare-fun res!663058 () Bool)

(assert (=> d!118199 (=> res!663058 e!559605)))

(declare-fun lt!440295 () Bool)

(assert (=> d!118199 (= res!663058 (not lt!440295))))

(declare-fun lt!440298 () Bool)

(assert (=> d!118199 (= lt!440295 lt!440298)))

(declare-fun lt!440296 () Unit!32870)

(declare-fun e!559606 () Unit!32870)

(assert (=> d!118199 (= lt!440296 e!559606)))

(declare-fun c!100887 () Bool)

(assert (=> d!118199 (= c!100887 lt!440298)))

(assert (=> d!118199 (= lt!440298 (containsKey!482 (toList!6833 lt!440125) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!118199 (= (contains!5748 lt!440125 #b0000000000000000000000000000000000000000000000000000000000000000) lt!440295)))

(declare-fun b!992232 () Bool)

(declare-fun lt!440297 () Unit!32870)

(assert (=> b!992232 (= e!559606 lt!440297)))

(assert (=> b!992232 (= lt!440297 (lemmaContainsKeyImpliesGetValueByKeyDefined!376 (toList!6833 lt!440125) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!992232 (isDefined!384 (getValueByKey!513 (toList!6833 lt!440125) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!992233 () Bool)

(declare-fun Unit!32878 () Unit!32870)

(assert (=> b!992233 (= e!559606 Unit!32878)))

(declare-fun b!992234 () Bool)

(assert (=> b!992234 (= e!559605 (isDefined!384 (getValueByKey!513 (toList!6833 lt!440125) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!118199 c!100887) b!992232))

(assert (= (and d!118199 (not c!100887)) b!992233))

(assert (= (and d!118199 (not res!663058)) b!992234))

(declare-fun m!920499 () Bool)

(assert (=> d!118199 m!920499))

(declare-fun m!920501 () Bool)

(assert (=> b!992232 m!920501))

(declare-fun m!920503 () Bool)

(assert (=> b!992232 m!920503))

(assert (=> b!992232 m!920503))

(declare-fun m!920505 () Bool)

(assert (=> b!992232 m!920505))

(assert (=> b!992234 m!920503))

(assert (=> b!992234 m!920503))

(assert (=> b!992234 m!920505))

(assert (=> bm!42086 d!118199))

(assert (=> b!992044 d!118171))

(assert (=> bm!42089 d!118155))

(declare-fun d!118201 () Bool)

(declare-fun e!559607 () Bool)

(assert (=> d!118201 e!559607))

(declare-fun res!663060 () Bool)

(assert (=> d!118201 (=> (not res!663060) (not e!559607))))

(declare-fun lt!440301 () ListLongMap!13635)

(assert (=> d!118201 (= res!663060 (contains!5748 lt!440301 (_1!7479 (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!440300 () List!20844)

(assert (=> d!118201 (= lt!440301 (ListLongMap!13636 lt!440300))))

(declare-fun lt!440299 () Unit!32870)

(declare-fun lt!440302 () Unit!32870)

(assert (=> d!118201 (= lt!440299 lt!440302)))

(assert (=> d!118201 (= (getValueByKey!513 lt!440300 (_1!7479 (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!518 (_2!7479 (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!118201 (= lt!440302 (lemmaContainsTupThenGetReturnValue!275 lt!440300 (_1!7479 (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7479 (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!118201 (= lt!440300 (insertStrictlySorted!332 (toList!6833 call!42093) (_1!7479 (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7479 (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!118201 (= (+!3118 call!42093 (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!440301)))

(declare-fun b!992235 () Bool)

(declare-fun res!663059 () Bool)

(assert (=> b!992235 (=> (not res!663059) (not e!559607))))

(assert (=> b!992235 (= res!663059 (= (getValueByKey!513 (toList!6833 lt!440301) (_1!7479 (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!518 (_2!7479 (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!992236 () Bool)

(assert (=> b!992236 (= e!559607 (contains!5749 (toList!6833 lt!440301) (tuple2!14937 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!118201 res!663060) b!992235))

(assert (= (and b!992235 res!663059) b!992236))

(declare-fun m!920507 () Bool)

(assert (=> d!118201 m!920507))

(declare-fun m!920509 () Bool)

(assert (=> d!118201 m!920509))

(declare-fun m!920511 () Bool)

(assert (=> d!118201 m!920511))

(declare-fun m!920513 () Bool)

(assert (=> d!118201 m!920513))

(declare-fun m!920515 () Bool)

(assert (=> b!992235 m!920515))

(declare-fun m!920517 () Bool)

(assert (=> b!992236 m!920517))

(assert (=> b!992045 d!118201))

(declare-fun d!118203 () Bool)

(declare-fun e!559608 () Bool)

(assert (=> d!118203 e!559608))

(declare-fun res!663061 () Bool)

(assert (=> d!118203 (=> res!663061 e!559608)))

(declare-fun lt!440303 () Bool)

(assert (=> d!118203 (= res!663061 (not lt!440303))))

(declare-fun lt!440306 () Bool)

(assert (=> d!118203 (= lt!440303 lt!440306)))

(declare-fun lt!440304 () Unit!32870)

(declare-fun e!559609 () Unit!32870)

(assert (=> d!118203 (= lt!440304 e!559609)))

(declare-fun c!100888 () Bool)

(assert (=> d!118203 (= c!100888 lt!440306)))

(assert (=> d!118203 (= lt!440306 (containsKey!482 (toList!6833 lt!440153) (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!118203 (= (contains!5748 lt!440153 (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!440303)))

(declare-fun b!992237 () Bool)

(declare-fun lt!440305 () Unit!32870)

(assert (=> b!992237 (= e!559609 lt!440305)))

(assert (=> b!992237 (= lt!440305 (lemmaContainsKeyImpliesGetValueByKeyDefined!376 (toList!6833 lt!440153) (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!992237 (isDefined!384 (getValueByKey!513 (toList!6833 lt!440153) (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!992238 () Bool)

(declare-fun Unit!32879 () Unit!32870)

(assert (=> b!992238 (= e!559609 Unit!32879)))

(declare-fun b!992239 () Bool)

(assert (=> b!992239 (= e!559608 (isDefined!384 (getValueByKey!513 (toList!6833 lt!440153) (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!118203 c!100888) b!992237))

(assert (= (and d!118203 (not c!100888)) b!992238))

(assert (= (and d!118203 (not res!663061)) b!992239))

(declare-fun m!920519 () Bool)

(assert (=> d!118203 m!920519))

(declare-fun m!920521 () Bool)

(assert (=> b!992237 m!920521))

(assert (=> b!992237 m!920163))

(assert (=> b!992237 m!920163))

(declare-fun m!920523 () Bool)

(assert (=> b!992237 m!920523))

(assert (=> b!992239 m!920163))

(assert (=> b!992239 m!920163))

(assert (=> b!992239 m!920523))

(assert (=> d!118109 d!118203))

(declare-fun c!100889 () Bool)

(declare-fun d!118205 () Bool)

(assert (=> d!118205 (= c!100889 (and ((_ is Cons!20840) lt!440152) (= (_1!7479 (h!22008 lt!440152)) (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!559610 () Option!519)

(assert (=> d!118205 (= (getValueByKey!513 lt!440152 (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!559610)))

(declare-fun e!559611 () Option!519)

(declare-fun b!992242 () Bool)

(assert (=> b!992242 (= e!559611 (getValueByKey!513 (t!29815 lt!440152) (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!992241 () Bool)

(assert (=> b!992241 (= e!559610 e!559611)))

(declare-fun c!100890 () Bool)

(assert (=> b!992241 (= c!100890 (and ((_ is Cons!20840) lt!440152) (not (= (_1!7479 (h!22008 lt!440152)) (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!992243 () Bool)

(assert (=> b!992243 (= e!559611 None!517)))

(declare-fun b!992240 () Bool)

(assert (=> b!992240 (= e!559610 (Some!518 (_2!7479 (h!22008 lt!440152))))))

(assert (= (and d!118205 c!100889) b!992240))

(assert (= (and d!118205 (not c!100889)) b!992241))

(assert (= (and b!992241 c!100890) b!992242))

(assert (= (and b!992241 (not c!100890)) b!992243))

(declare-fun m!920525 () Bool)

(assert (=> b!992242 m!920525))

(assert (=> d!118109 d!118205))

(declare-fun d!118207 () Bool)

(assert (=> d!118207 (= (getValueByKey!513 lt!440152 (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!518 (_2!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!440309 () Unit!32870)

(declare-fun choose!1628 (List!20844 (_ BitVec 64) V!36065) Unit!32870)

(assert (=> d!118207 (= lt!440309 (choose!1628 lt!440152 (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!559614 () Bool)

(assert (=> d!118207 e!559614))

(declare-fun res!663066 () Bool)

(assert (=> d!118207 (=> (not res!663066) (not e!559614))))

(declare-fun isStrictlySorted!506 (List!20844) Bool)

(assert (=> d!118207 (= res!663066 (isStrictlySorted!506 lt!440152))))

(assert (=> d!118207 (= (lemmaContainsTupThenGetReturnValue!275 lt!440152 (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!440309)))

(declare-fun b!992248 () Bool)

(declare-fun res!663067 () Bool)

(assert (=> b!992248 (=> (not res!663067) (not e!559614))))

(assert (=> b!992248 (= res!663067 (containsKey!482 lt!440152 (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!992249 () Bool)

(assert (=> b!992249 (= e!559614 (contains!5749 lt!440152 (tuple2!14937 (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!118207 res!663066) b!992248))

(assert (= (and b!992248 res!663067) b!992249))

(assert (=> d!118207 m!920157))

(declare-fun m!920527 () Bool)

(assert (=> d!118207 m!920527))

(declare-fun m!920529 () Bool)

(assert (=> d!118207 m!920529))

(declare-fun m!920531 () Bool)

(assert (=> b!992248 m!920531))

(declare-fun m!920533 () Bool)

(assert (=> b!992249 m!920533))

(assert (=> d!118109 d!118207))

(declare-fun b!992270 () Bool)

(declare-fun e!559626 () List!20844)

(assert (=> b!992270 (= e!559626 (insertStrictlySorted!332 (t!29815 (toList!6833 (getCurrentListMap!3880 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!100899 () Bool)

(declare-fun c!100900 () Bool)

(declare-fun b!992271 () Bool)

(assert (=> b!992271 (= e!559626 (ite c!100900 (t!29815 (toList!6833 (getCurrentListMap!3880 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (ite c!100899 (Cons!20840 (h!22008 (toList!6833 (getCurrentListMap!3880 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (t!29815 (toList!6833 (getCurrentListMap!3880 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) Nil!20841)))))

(declare-fun b!992272 () Bool)

(declare-fun e!559627 () List!20844)

(declare-fun e!559625 () List!20844)

(assert (=> b!992272 (= e!559627 e!559625)))

(assert (=> b!992272 (= c!100900 (and ((_ is Cons!20840) (toList!6833 (getCurrentListMap!3880 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (= (_1!7479 (h!22008 (toList!6833 (getCurrentListMap!3880 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!992273 () Bool)

(assert (=> b!992273 (= c!100899 (and ((_ is Cons!20840) (toList!6833 (getCurrentListMap!3880 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (bvsgt (_1!7479 (h!22008 (toList!6833 (getCurrentListMap!3880 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!559629 () List!20844)

(assert (=> b!992273 (= e!559625 e!559629)))

(declare-fun b!992274 () Bool)

(declare-fun call!42117 () List!20844)

(assert (=> b!992274 (= e!559627 call!42117)))

(declare-fun bm!42113 () Bool)

(declare-fun call!42116 () List!20844)

(declare-fun call!42118 () List!20844)

(assert (=> bm!42113 (= call!42116 call!42118)))

(declare-fun bm!42114 () Bool)

(assert (=> bm!42114 (= call!42118 call!42117)))

(declare-fun b!992275 () Bool)

(assert (=> b!992275 (= e!559629 call!42116)))

(declare-fun bm!42115 () Bool)

(declare-fun c!100902 () Bool)

(declare-fun $colon$colon!556 (List!20844 tuple2!14936) List!20844)

(assert (=> bm!42115 (= call!42117 ($colon$colon!556 e!559626 (ite c!100902 (h!22008 (toList!6833 (getCurrentListMap!3880 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (tuple2!14937 (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!100901 () Bool)

(assert (=> bm!42115 (= c!100901 c!100902)))

(declare-fun b!992276 () Bool)

(declare-fun res!663073 () Bool)

(declare-fun e!559628 () Bool)

(assert (=> b!992276 (=> (not res!663073) (not e!559628))))

(declare-fun lt!440312 () List!20844)

(assert (=> b!992276 (= res!663073 (containsKey!482 lt!440312 (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!992277 () Bool)

(assert (=> b!992277 (= e!559625 call!42118)))

(declare-fun d!118209 () Bool)

(assert (=> d!118209 e!559628))

(declare-fun res!663072 () Bool)

(assert (=> d!118209 (=> (not res!663072) (not e!559628))))

(assert (=> d!118209 (= res!663072 (isStrictlySorted!506 lt!440312))))

(assert (=> d!118209 (= lt!440312 e!559627)))

(assert (=> d!118209 (= c!100902 (and ((_ is Cons!20840) (toList!6833 (getCurrentListMap!3880 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (bvslt (_1!7479 (h!22008 (toList!6833 (getCurrentListMap!3880 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!118209 (isStrictlySorted!506 (toList!6833 (getCurrentListMap!3880 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))))

(assert (=> d!118209 (= (insertStrictlySorted!332 (toList!6833 (getCurrentListMap!3880 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!440312)))

(declare-fun b!992278 () Bool)

(assert (=> b!992278 (= e!559629 call!42116)))

(declare-fun b!992279 () Bool)

(assert (=> b!992279 (= e!559628 (contains!5749 lt!440312 (tuple2!14937 (_1!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7479 (tuple2!14937 (select (arr!30162 _keys!1544) from!1932) (get!15682 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!118209 c!100902) b!992274))

(assert (= (and d!118209 (not c!100902)) b!992272))

(assert (= (and b!992272 c!100900) b!992277))

(assert (= (and b!992272 (not c!100900)) b!992273))

(assert (= (and b!992273 c!100899) b!992278))

(assert (= (and b!992273 (not c!100899)) b!992275))

(assert (= (or b!992278 b!992275) bm!42113))

(assert (= (or b!992277 bm!42113) bm!42114))

(assert (= (or b!992274 bm!42114) bm!42115))

(assert (= (and bm!42115 c!100901) b!992270))

(assert (= (and bm!42115 (not c!100901)) b!992271))

(assert (= (and d!118209 res!663072) b!992276))

(assert (= (and b!992276 res!663073) b!992279))

(declare-fun m!920535 () Bool)

(assert (=> b!992279 m!920535))

(declare-fun m!920537 () Bool)

(assert (=> d!118209 m!920537))

(declare-fun m!920539 () Bool)

(assert (=> d!118209 m!920539))

(declare-fun m!920541 () Bool)

(assert (=> b!992276 m!920541))

(declare-fun m!920543 () Bool)

(assert (=> bm!42115 m!920543))

(declare-fun m!920545 () Bool)

(assert (=> b!992270 m!920545))

(assert (=> d!118109 d!118209))

(declare-fun d!118211 () Bool)

(assert (=> d!118211 (= (apply!907 (+!3118 lt!440133 (tuple2!14937 lt!440130 zeroValue!1220)) lt!440134) (get!15685 (getValueByKey!513 (toList!6833 (+!3118 lt!440133 (tuple2!14937 lt!440130 zeroValue!1220))) lt!440134)))))

(declare-fun bs!28177 () Bool)

(assert (= bs!28177 d!118211))

(declare-fun m!920547 () Bool)

(assert (=> bs!28177 m!920547))

(assert (=> bs!28177 m!920547))

(declare-fun m!920549 () Bool)

(assert (=> bs!28177 m!920549))

(assert (=> b!992011 d!118211))

(declare-fun d!118213 () Bool)

(declare-fun e!559630 () Bool)

(assert (=> d!118213 e!559630))

(declare-fun res!663075 () Bool)

(assert (=> d!118213 (=> (not res!663075) (not e!559630))))

(declare-fun lt!440315 () ListLongMap!13635)

(assert (=> d!118213 (= res!663075 (contains!5748 lt!440315 (_1!7479 (tuple2!14937 lt!440130 zeroValue!1220))))))

(declare-fun lt!440314 () List!20844)

(assert (=> d!118213 (= lt!440315 (ListLongMap!13636 lt!440314))))

(declare-fun lt!440313 () Unit!32870)

(declare-fun lt!440316 () Unit!32870)

(assert (=> d!118213 (= lt!440313 lt!440316)))

(assert (=> d!118213 (= (getValueByKey!513 lt!440314 (_1!7479 (tuple2!14937 lt!440130 zeroValue!1220))) (Some!518 (_2!7479 (tuple2!14937 lt!440130 zeroValue!1220))))))

(assert (=> d!118213 (= lt!440316 (lemmaContainsTupThenGetReturnValue!275 lt!440314 (_1!7479 (tuple2!14937 lt!440130 zeroValue!1220)) (_2!7479 (tuple2!14937 lt!440130 zeroValue!1220))))))

(assert (=> d!118213 (= lt!440314 (insertStrictlySorted!332 (toList!6833 lt!440133) (_1!7479 (tuple2!14937 lt!440130 zeroValue!1220)) (_2!7479 (tuple2!14937 lt!440130 zeroValue!1220))))))

(assert (=> d!118213 (= (+!3118 lt!440133 (tuple2!14937 lt!440130 zeroValue!1220)) lt!440315)))

(declare-fun b!992280 () Bool)

(declare-fun res!663074 () Bool)

(assert (=> b!992280 (=> (not res!663074) (not e!559630))))

(assert (=> b!992280 (= res!663074 (= (getValueByKey!513 (toList!6833 lt!440315) (_1!7479 (tuple2!14937 lt!440130 zeroValue!1220))) (Some!518 (_2!7479 (tuple2!14937 lt!440130 zeroValue!1220)))))))

(declare-fun b!992281 () Bool)

(assert (=> b!992281 (= e!559630 (contains!5749 (toList!6833 lt!440315) (tuple2!14937 lt!440130 zeroValue!1220)))))

(assert (= (and d!118213 res!663075) b!992280))

(assert (= (and b!992280 res!663074) b!992281))

(declare-fun m!920551 () Bool)

(assert (=> d!118213 m!920551))

(declare-fun m!920553 () Bool)

(assert (=> d!118213 m!920553))

(declare-fun m!920555 () Bool)

(assert (=> d!118213 m!920555))

(declare-fun m!920557 () Bool)

(assert (=> d!118213 m!920557))

(declare-fun m!920559 () Bool)

(assert (=> b!992280 m!920559))

(declare-fun m!920561 () Bool)

(assert (=> b!992281 m!920561))

(assert (=> b!992011 d!118213))

(declare-fun d!118215 () Bool)

(declare-fun e!559631 () Bool)

(assert (=> d!118215 e!559631))

(declare-fun res!663077 () Bool)

(assert (=> d!118215 (=> (not res!663077) (not e!559631))))

(declare-fun lt!440319 () ListLongMap!13635)

(assert (=> d!118215 (= res!663077 (contains!5748 lt!440319 (_1!7479 (tuple2!14937 lt!440137 minValue!1220))))))

(declare-fun lt!440318 () List!20844)

(assert (=> d!118215 (= lt!440319 (ListLongMap!13636 lt!440318))))

(declare-fun lt!440317 () Unit!32870)

(declare-fun lt!440320 () Unit!32870)

(assert (=> d!118215 (= lt!440317 lt!440320)))

(assert (=> d!118215 (= (getValueByKey!513 lt!440318 (_1!7479 (tuple2!14937 lt!440137 minValue!1220))) (Some!518 (_2!7479 (tuple2!14937 lt!440137 minValue!1220))))))

(assert (=> d!118215 (= lt!440320 (lemmaContainsTupThenGetReturnValue!275 lt!440318 (_1!7479 (tuple2!14937 lt!440137 minValue!1220)) (_2!7479 (tuple2!14937 lt!440137 minValue!1220))))))

(assert (=> d!118215 (= lt!440318 (insertStrictlySorted!332 (toList!6833 lt!440135) (_1!7479 (tuple2!14937 lt!440137 minValue!1220)) (_2!7479 (tuple2!14937 lt!440137 minValue!1220))))))

(assert (=> d!118215 (= (+!3118 lt!440135 (tuple2!14937 lt!440137 minValue!1220)) lt!440319)))

(declare-fun b!992282 () Bool)

(declare-fun res!663076 () Bool)

(assert (=> b!992282 (=> (not res!663076) (not e!559631))))

(assert (=> b!992282 (= res!663076 (= (getValueByKey!513 (toList!6833 lt!440319) (_1!7479 (tuple2!14937 lt!440137 minValue!1220))) (Some!518 (_2!7479 (tuple2!14937 lt!440137 minValue!1220)))))))

(declare-fun b!992283 () Bool)

(assert (=> b!992283 (= e!559631 (contains!5749 (toList!6833 lt!440319) (tuple2!14937 lt!440137 minValue!1220)))))

(assert (= (and d!118215 res!663077) b!992282))

(assert (= (and b!992282 res!663076) b!992283))

(declare-fun m!920563 () Bool)

(assert (=> d!118215 m!920563))

(declare-fun m!920565 () Bool)

(assert (=> d!118215 m!920565))

(declare-fun m!920567 () Bool)

(assert (=> d!118215 m!920567))

(declare-fun m!920569 () Bool)

(assert (=> d!118215 m!920569))

(declare-fun m!920571 () Bool)

(assert (=> b!992282 m!920571))

(declare-fun m!920573 () Bool)

(assert (=> b!992283 m!920573))

(assert (=> b!992011 d!118215))

(declare-fun d!118217 () Bool)

(declare-fun e!559632 () Bool)

(assert (=> d!118217 e!559632))

(declare-fun res!663079 () Bool)

(assert (=> d!118217 (=> (not res!663079) (not e!559632))))

(declare-fun lt!440323 () ListLongMap!13635)

(assert (=> d!118217 (= res!663079 (contains!5748 lt!440323 (_1!7479 (tuple2!14937 lt!440129 zeroValue!1220))))))

(declare-fun lt!440322 () List!20844)

(assert (=> d!118217 (= lt!440323 (ListLongMap!13636 lt!440322))))

(declare-fun lt!440321 () Unit!32870)

(declare-fun lt!440324 () Unit!32870)

(assert (=> d!118217 (= lt!440321 lt!440324)))

(assert (=> d!118217 (= (getValueByKey!513 lt!440322 (_1!7479 (tuple2!14937 lt!440129 zeroValue!1220))) (Some!518 (_2!7479 (tuple2!14937 lt!440129 zeroValue!1220))))))

(assert (=> d!118217 (= lt!440324 (lemmaContainsTupThenGetReturnValue!275 lt!440322 (_1!7479 (tuple2!14937 lt!440129 zeroValue!1220)) (_2!7479 (tuple2!14937 lt!440129 zeroValue!1220))))))

(assert (=> d!118217 (= lt!440322 (insertStrictlySorted!332 (toList!6833 lt!440123) (_1!7479 (tuple2!14937 lt!440129 zeroValue!1220)) (_2!7479 (tuple2!14937 lt!440129 zeroValue!1220))))))

(assert (=> d!118217 (= (+!3118 lt!440123 (tuple2!14937 lt!440129 zeroValue!1220)) lt!440323)))

(declare-fun b!992284 () Bool)

(declare-fun res!663078 () Bool)

(assert (=> b!992284 (=> (not res!663078) (not e!559632))))

(assert (=> b!992284 (= res!663078 (= (getValueByKey!513 (toList!6833 lt!440323) (_1!7479 (tuple2!14937 lt!440129 zeroValue!1220))) (Some!518 (_2!7479 (tuple2!14937 lt!440129 zeroValue!1220)))))))

(declare-fun b!992285 () Bool)

(assert (=> b!992285 (= e!559632 (contains!5749 (toList!6833 lt!440323) (tuple2!14937 lt!440129 zeroValue!1220)))))

(assert (= (and d!118217 res!663079) b!992284))

(assert (= (and b!992284 res!663078) b!992285))

(declare-fun m!920575 () Bool)

(assert (=> d!118217 m!920575))

(declare-fun m!920577 () Bool)

(assert (=> d!118217 m!920577))

(declare-fun m!920579 () Bool)

(assert (=> d!118217 m!920579))

(declare-fun m!920581 () Bool)

(assert (=> d!118217 m!920581))

(declare-fun m!920583 () Bool)

(assert (=> b!992284 m!920583))

(declare-fun m!920585 () Bool)

(assert (=> b!992285 m!920585))

(assert (=> b!992011 d!118217))

(declare-fun d!118219 () Bool)

(declare-fun e!559633 () Bool)

(assert (=> d!118219 e!559633))

(declare-fun res!663081 () Bool)

(assert (=> d!118219 (=> (not res!663081) (not e!559633))))

(declare-fun lt!440327 () ListLongMap!13635)

(assert (=> d!118219 (= res!663081 (contains!5748 lt!440327 (_1!7479 (tuple2!14937 lt!440128 minValue!1220))))))

(declare-fun lt!440326 () List!20844)

(assert (=> d!118219 (= lt!440327 (ListLongMap!13636 lt!440326))))

(declare-fun lt!440325 () Unit!32870)

(declare-fun lt!440328 () Unit!32870)

(assert (=> d!118219 (= lt!440325 lt!440328)))

(assert (=> d!118219 (= (getValueByKey!513 lt!440326 (_1!7479 (tuple2!14937 lt!440128 minValue!1220))) (Some!518 (_2!7479 (tuple2!14937 lt!440128 minValue!1220))))))

(assert (=> d!118219 (= lt!440328 (lemmaContainsTupThenGetReturnValue!275 lt!440326 (_1!7479 (tuple2!14937 lt!440128 minValue!1220)) (_2!7479 (tuple2!14937 lt!440128 minValue!1220))))))

(assert (=> d!118219 (= lt!440326 (insertStrictlySorted!332 (toList!6833 lt!440139) (_1!7479 (tuple2!14937 lt!440128 minValue!1220)) (_2!7479 (tuple2!14937 lt!440128 minValue!1220))))))

(assert (=> d!118219 (= (+!3118 lt!440139 (tuple2!14937 lt!440128 minValue!1220)) lt!440327)))

(declare-fun b!992286 () Bool)

(declare-fun res!663080 () Bool)

(assert (=> b!992286 (=> (not res!663080) (not e!559633))))

(assert (=> b!992286 (= res!663080 (= (getValueByKey!513 (toList!6833 lt!440327) (_1!7479 (tuple2!14937 lt!440128 minValue!1220))) (Some!518 (_2!7479 (tuple2!14937 lt!440128 minValue!1220)))))))

(declare-fun b!992287 () Bool)

(assert (=> b!992287 (= e!559633 (contains!5749 (toList!6833 lt!440327) (tuple2!14937 lt!440128 minValue!1220)))))

(assert (= (and d!118219 res!663081) b!992286))

(assert (= (and b!992286 res!663080) b!992287))

(declare-fun m!920587 () Bool)

(assert (=> d!118219 m!920587))

(declare-fun m!920589 () Bool)

(assert (=> d!118219 m!920589))

(declare-fun m!920591 () Bool)

(assert (=> d!118219 m!920591))

(declare-fun m!920593 () Bool)

(assert (=> d!118219 m!920593))

(declare-fun m!920595 () Bool)

(assert (=> b!992286 m!920595))

(declare-fun m!920597 () Bool)

(assert (=> b!992287 m!920597))

(assert (=> b!992011 d!118219))

(declare-fun d!118221 () Bool)

(assert (=> d!118221 (= (apply!907 lt!440133 lt!440134) (get!15685 (getValueByKey!513 (toList!6833 lt!440133) lt!440134)))))

(declare-fun bs!28178 () Bool)

(assert (= bs!28178 d!118221))

(declare-fun m!920599 () Bool)

(assert (=> bs!28178 m!920599))

(assert (=> bs!28178 m!920599))

(declare-fun m!920601 () Bool)

(assert (=> bs!28178 m!920601))

(assert (=> b!992011 d!118221))

(declare-fun d!118223 () Bool)

(declare-fun e!559634 () Bool)

(assert (=> d!118223 e!559634))

(declare-fun res!663082 () Bool)

(assert (=> d!118223 (=> res!663082 e!559634)))

(declare-fun lt!440329 () Bool)

(assert (=> d!118223 (= res!663082 (not lt!440329))))

(declare-fun lt!440332 () Bool)

(assert (=> d!118223 (= lt!440329 lt!440332)))

(declare-fun lt!440330 () Unit!32870)

(declare-fun e!559635 () Unit!32870)

(assert (=> d!118223 (= lt!440330 e!559635)))

(declare-fun c!100903 () Bool)

(assert (=> d!118223 (= c!100903 lt!440332)))

(assert (=> d!118223 (= lt!440332 (containsKey!482 (toList!6833 (+!3118 lt!440123 (tuple2!14937 lt!440129 zeroValue!1220))) lt!440124))))

(assert (=> d!118223 (= (contains!5748 (+!3118 lt!440123 (tuple2!14937 lt!440129 zeroValue!1220)) lt!440124) lt!440329)))

(declare-fun b!992288 () Bool)

(declare-fun lt!440331 () Unit!32870)

(assert (=> b!992288 (= e!559635 lt!440331)))

(assert (=> b!992288 (= lt!440331 (lemmaContainsKeyImpliesGetValueByKeyDefined!376 (toList!6833 (+!3118 lt!440123 (tuple2!14937 lt!440129 zeroValue!1220))) lt!440124))))

(assert (=> b!992288 (isDefined!384 (getValueByKey!513 (toList!6833 (+!3118 lt!440123 (tuple2!14937 lt!440129 zeroValue!1220))) lt!440124))))

(declare-fun b!992289 () Bool)

(declare-fun Unit!32880 () Unit!32870)

(assert (=> b!992289 (= e!559635 Unit!32880)))

(declare-fun b!992290 () Bool)

(assert (=> b!992290 (= e!559634 (isDefined!384 (getValueByKey!513 (toList!6833 (+!3118 lt!440123 (tuple2!14937 lt!440129 zeroValue!1220))) lt!440124)))))

(assert (= (and d!118223 c!100903) b!992288))

(assert (= (and d!118223 (not c!100903)) b!992289))

(assert (= (and d!118223 (not res!663082)) b!992290))

(declare-fun m!920603 () Bool)

(assert (=> d!118223 m!920603))

(declare-fun m!920605 () Bool)

(assert (=> b!992288 m!920605))

(declare-fun m!920607 () Bool)

(assert (=> b!992288 m!920607))

(assert (=> b!992288 m!920607))

(declare-fun m!920609 () Bool)

(assert (=> b!992288 m!920609))

(assert (=> b!992290 m!920607))

(assert (=> b!992290 m!920607))

(assert (=> b!992290 m!920609))

(assert (=> b!992011 d!118223))

(assert (=> b!992011 d!118173))

(declare-fun d!118225 () Bool)

(assert (=> d!118225 (= (apply!907 (+!3118 lt!440135 (tuple2!14937 lt!440137 minValue!1220)) lt!440142) (get!15685 (getValueByKey!513 (toList!6833 (+!3118 lt!440135 (tuple2!14937 lt!440137 minValue!1220))) lt!440142)))))

(declare-fun bs!28179 () Bool)

(assert (= bs!28179 d!118225))

(declare-fun m!920611 () Bool)

(assert (=> bs!28179 m!920611))

(assert (=> bs!28179 m!920611))

(declare-fun m!920613 () Bool)

(assert (=> bs!28179 m!920613))

(assert (=> b!992011 d!118225))

(declare-fun d!118227 () Bool)

(assert (=> d!118227 (= (apply!907 (+!3118 lt!440139 (tuple2!14937 lt!440128 minValue!1220)) lt!440127) (get!15685 (getValueByKey!513 (toList!6833 (+!3118 lt!440139 (tuple2!14937 lt!440128 minValue!1220))) lt!440127)))))

(declare-fun bs!28180 () Bool)

(assert (= bs!28180 d!118227))

(declare-fun m!920615 () Bool)

(assert (=> bs!28180 m!920615))

(assert (=> bs!28180 m!920615))

(declare-fun m!920617 () Bool)

(assert (=> bs!28180 m!920617))

(assert (=> b!992011 d!118227))

(declare-fun d!118229 () Bool)

(assert (=> d!118229 (= (apply!907 (+!3118 lt!440133 (tuple2!14937 lt!440130 zeroValue!1220)) lt!440134) (apply!907 lt!440133 lt!440134))))

(declare-fun lt!440333 () Unit!32870)

(assert (=> d!118229 (= lt!440333 (choose!1626 lt!440133 lt!440130 zeroValue!1220 lt!440134))))

(declare-fun e!559636 () Bool)

(assert (=> d!118229 e!559636))

(declare-fun res!663083 () Bool)

(assert (=> d!118229 (=> (not res!663083) (not e!559636))))

(assert (=> d!118229 (= res!663083 (contains!5748 lt!440133 lt!440134))))

(assert (=> d!118229 (= (addApplyDifferent!473 lt!440133 lt!440130 zeroValue!1220 lt!440134) lt!440333)))

(declare-fun b!992291 () Bool)

(assert (=> b!992291 (= e!559636 (not (= lt!440134 lt!440130)))))

(assert (= (and d!118229 res!663083) b!992291))

(declare-fun m!920619 () Bool)

(assert (=> d!118229 m!920619))

(assert (=> d!118229 m!920133))

(declare-fun m!920621 () Bool)

(assert (=> d!118229 m!920621))

(assert (=> d!118229 m!920141))

(assert (=> d!118229 m!920141))

(assert (=> d!118229 m!920143))

(assert (=> b!992011 d!118229))

(declare-fun d!118231 () Bool)

(assert (=> d!118231 (= (apply!907 lt!440139 lt!440127) (get!15685 (getValueByKey!513 (toList!6833 lt!440139) lt!440127)))))

(declare-fun bs!28181 () Bool)

(assert (= bs!28181 d!118231))

(declare-fun m!920623 () Bool)

(assert (=> bs!28181 m!920623))

(assert (=> bs!28181 m!920623))

(declare-fun m!920625 () Bool)

(assert (=> bs!28181 m!920625))

(assert (=> b!992011 d!118231))

(declare-fun d!118233 () Bool)

(assert (=> d!118233 (contains!5748 (+!3118 lt!440123 (tuple2!14937 lt!440129 zeroValue!1220)) lt!440124)))

(declare-fun lt!440334 () Unit!32870)

(assert (=> d!118233 (= lt!440334 (choose!1627 lt!440123 lt!440129 zeroValue!1220 lt!440124))))

(assert (=> d!118233 (contains!5748 lt!440123 lt!440124)))

(assert (=> d!118233 (= (addStillContains!617 lt!440123 lt!440129 zeroValue!1220 lt!440124) lt!440334)))

(declare-fun bs!28182 () Bool)

(assert (= bs!28182 d!118233))

(assert (=> bs!28182 m!920123))

(assert (=> bs!28182 m!920123))

(assert (=> bs!28182 m!920139))

(declare-fun m!920627 () Bool)

(assert (=> bs!28182 m!920627))

(declare-fun m!920629 () Bool)

(assert (=> bs!28182 m!920629))

(assert (=> b!992011 d!118233))

(declare-fun d!118235 () Bool)

(assert (=> d!118235 (= (apply!907 lt!440135 lt!440142) (get!15685 (getValueByKey!513 (toList!6833 lt!440135) lt!440142)))))

(declare-fun bs!28183 () Bool)

(assert (= bs!28183 d!118235))

(declare-fun m!920631 () Bool)

(assert (=> bs!28183 m!920631))

(assert (=> bs!28183 m!920631))

(declare-fun m!920633 () Bool)

(assert (=> bs!28183 m!920633))

(assert (=> b!992011 d!118235))

(declare-fun d!118237 () Bool)

(assert (=> d!118237 (= (apply!907 (+!3118 lt!440135 (tuple2!14937 lt!440137 minValue!1220)) lt!440142) (apply!907 lt!440135 lt!440142))))

(declare-fun lt!440335 () Unit!32870)

(assert (=> d!118237 (= lt!440335 (choose!1626 lt!440135 lt!440137 minValue!1220 lt!440142))))

(declare-fun e!559637 () Bool)

(assert (=> d!118237 e!559637))

(declare-fun res!663084 () Bool)

(assert (=> d!118237 (=> (not res!663084) (not e!559637))))

(assert (=> d!118237 (= res!663084 (contains!5748 lt!440135 lt!440142))))

(assert (=> d!118237 (= (addApplyDifferent!473 lt!440135 lt!440137 minValue!1220 lt!440142) lt!440335)))

(declare-fun b!992292 () Bool)

(assert (=> b!992292 (= e!559637 (not (= lt!440142 lt!440137)))))

(assert (= (and d!118237 res!663084) b!992292))

(declare-fun m!920635 () Bool)

(assert (=> d!118237 m!920635))

(assert (=> d!118237 m!920127))

(declare-fun m!920637 () Bool)

(assert (=> d!118237 m!920637))

(assert (=> d!118237 m!920129))

(assert (=> d!118237 m!920129))

(assert (=> d!118237 m!920145))

(assert (=> b!992011 d!118237))

(declare-fun d!118239 () Bool)

(assert (=> d!118239 (= (apply!907 (+!3118 lt!440139 (tuple2!14937 lt!440128 minValue!1220)) lt!440127) (apply!907 lt!440139 lt!440127))))

(declare-fun lt!440336 () Unit!32870)

(assert (=> d!118239 (= lt!440336 (choose!1626 lt!440139 lt!440128 minValue!1220 lt!440127))))

(declare-fun e!559638 () Bool)

(assert (=> d!118239 e!559638))

(declare-fun res!663085 () Bool)

(assert (=> d!118239 (=> (not res!663085) (not e!559638))))

(assert (=> d!118239 (= res!663085 (contains!5748 lt!440139 lt!440127))))

(assert (=> d!118239 (= (addApplyDifferent!473 lt!440139 lt!440128 minValue!1220 lt!440127) lt!440336)))

(declare-fun b!992293 () Bool)

(assert (=> b!992293 (= e!559638 (not (= lt!440127 lt!440128)))))

(assert (= (and d!118239 res!663085) b!992293))

(declare-fun m!920639 () Bool)

(assert (=> d!118239 m!920639))

(assert (=> d!118239 m!920137))

(declare-fun m!920641 () Bool)

(assert (=> d!118239 m!920641))

(assert (=> d!118239 m!920125))

(assert (=> d!118239 m!920125))

(assert (=> d!118239 m!920147))

(assert (=> b!992011 d!118239))

(declare-fun d!118241 () Bool)

(assert (=> d!118241 (= (apply!907 lt!440159 (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15685 (getValueByKey!513 (toList!6833 lt!440159) (select (arr!30162 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(declare-fun bs!28184 () Bool)

(assert (= bs!28184 d!118241))

(assert (=> bs!28184 m!920169))

(assert (=> bs!28184 m!920371))

(assert (=> bs!28184 m!920371))

(declare-fun m!920643 () Bool)

(assert (=> bs!28184 m!920643))

(assert (=> b!992046 d!118241))

(declare-fun d!118243 () Bool)

(declare-fun c!100904 () Bool)

(assert (=> d!118243 (= c!100904 ((_ is ValueCellFull!11174) (select (arr!30161 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun e!559639 () V!36065)

(assert (=> d!118243 (= (get!15682 (select (arr!30161 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!559639)))

(declare-fun b!992294 () Bool)

(assert (=> b!992294 (= e!559639 (get!15683 (select (arr!30161 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!992295 () Bool)

(assert (=> b!992295 (= e!559639 (get!15684 (select (arr!30161 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!118243 c!100904) b!992294))

(assert (= (and d!118243 (not c!100904)) b!992295))

(assert (=> b!992294 m!920215))

(assert (=> b!992294 m!920043))

(declare-fun m!920645 () Bool)

(assert (=> b!992294 m!920645))

(assert (=> b!992295 m!920215))

(assert (=> b!992295 m!920043))

(declare-fun m!920647 () Bool)

(assert (=> b!992295 m!920647))

(assert (=> b!992046 d!118243))

(assert (=> d!118107 d!118121))

(declare-fun d!118245 () Bool)

(declare-fun e!559640 () Bool)

(assert (=> d!118245 e!559640))

(declare-fun res!663086 () Bool)

(assert (=> d!118245 (=> res!663086 e!559640)))

(declare-fun lt!440337 () Bool)

(assert (=> d!118245 (= res!663086 (not lt!440337))))

(declare-fun lt!440340 () Bool)

(assert (=> d!118245 (= lt!440337 lt!440340)))

(declare-fun lt!440338 () Unit!32870)

(declare-fun e!559641 () Unit!32870)

(assert (=> d!118245 (= lt!440338 e!559641)))

(declare-fun c!100905 () Bool)

(assert (=> d!118245 (= c!100905 lt!440340)))

(assert (=> d!118245 (= lt!440340 (containsKey!482 (toList!6833 lt!440125) (select (arr!30162 _keys!1544) from!1932)))))

(assert (=> d!118245 (= (contains!5748 lt!440125 (select (arr!30162 _keys!1544) from!1932)) lt!440337)))

(declare-fun b!992296 () Bool)

(declare-fun lt!440339 () Unit!32870)

(assert (=> b!992296 (= e!559641 lt!440339)))

(assert (=> b!992296 (= lt!440339 (lemmaContainsKeyImpliesGetValueByKeyDefined!376 (toList!6833 lt!440125) (select (arr!30162 _keys!1544) from!1932)))))

(assert (=> b!992296 (isDefined!384 (getValueByKey!513 (toList!6833 lt!440125) (select (arr!30162 _keys!1544) from!1932)))))

(declare-fun b!992297 () Bool)

(declare-fun Unit!32881 () Unit!32870)

(assert (=> b!992297 (= e!559641 Unit!32881)))

(declare-fun b!992298 () Bool)

(assert (=> b!992298 (= e!559640 (isDefined!384 (getValueByKey!513 (toList!6833 lt!440125) (select (arr!30162 _keys!1544) from!1932))))))

(assert (= (and d!118245 c!100905) b!992296))

(assert (= (and d!118245 (not c!100905)) b!992297))

(assert (= (and d!118245 (not res!663086)) b!992298))

(assert (=> d!118245 m!920033))

(declare-fun m!920649 () Bool)

(assert (=> d!118245 m!920649))

(assert (=> b!992296 m!920033))

(declare-fun m!920651 () Bool)

(assert (=> b!992296 m!920651))

(assert (=> b!992296 m!920033))

(assert (=> b!992296 m!920449))

(assert (=> b!992296 m!920449))

(declare-fun m!920653 () Bool)

(assert (=> b!992296 m!920653))

(assert (=> b!992298 m!920033))

(assert (=> b!992298 m!920449))

(assert (=> b!992298 m!920449))

(assert (=> b!992298 m!920653))

(assert (=> b!992007 d!118245))

(declare-fun d!118247 () Bool)

(assert (=> d!118247 (= (apply!907 lt!440125 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15685 (getValueByKey!513 (toList!6833 lt!440125) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28185 () Bool)

(assert (= bs!28185 d!118247))

(assert (=> bs!28185 m!920503))

(assert (=> bs!28185 m!920503))

(declare-fun m!920655 () Bool)

(assert (=> bs!28185 m!920655))

(assert (=> b!992009 d!118247))

(declare-fun d!118249 () Bool)

(assert (=> d!118249 (= (get!15683 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14276 (select (arr!30161 _values!1278) from!1932)))))

(assert (=> b!992051 d!118249))

(declare-fun d!118251 () Bool)

(declare-fun e!559642 () Bool)

(assert (=> d!118251 e!559642))

(declare-fun res!663087 () Bool)

(assert (=> d!118251 (=> res!663087 e!559642)))

(declare-fun lt!440341 () Bool)

(assert (=> d!118251 (= res!663087 (not lt!440341))))

(declare-fun lt!440344 () Bool)

(assert (=> d!118251 (= lt!440341 lt!440344)))

(declare-fun lt!440342 () Unit!32870)

(declare-fun e!559643 () Unit!32870)

(assert (=> d!118251 (= lt!440342 e!559643)))

(declare-fun c!100906 () Bool)

(assert (=> d!118251 (= c!100906 lt!440344)))

(assert (=> d!118251 (= lt!440344 (containsKey!482 (toList!6833 lt!440159) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!118251 (= (contains!5748 lt!440159 #b0000000000000000000000000000000000000000000000000000000000000000) lt!440341)))

(declare-fun b!992299 () Bool)

(declare-fun lt!440343 () Unit!32870)

(assert (=> b!992299 (= e!559643 lt!440343)))

(assert (=> b!992299 (= lt!440343 (lemmaContainsKeyImpliesGetValueByKeyDefined!376 (toList!6833 lt!440159) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!992299 (isDefined!384 (getValueByKey!513 (toList!6833 lt!440159) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!992300 () Bool)

(declare-fun Unit!32882 () Unit!32870)

(assert (=> b!992300 (= e!559643 Unit!32882)))

(declare-fun b!992301 () Bool)

(assert (=> b!992301 (= e!559642 (isDefined!384 (getValueByKey!513 (toList!6833 lt!440159) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!118251 c!100906) b!992299))

(assert (= (and d!118251 (not c!100906)) b!992300))

(assert (= (and d!118251 (not res!663087)) b!992301))

(declare-fun m!920657 () Bool)

(assert (=> d!118251 m!920657))

(declare-fun m!920659 () Bool)

(assert (=> b!992299 m!920659))

(assert (=> b!992299 m!920395))

(assert (=> b!992299 m!920395))

(declare-fun m!920661 () Bool)

(assert (=> b!992299 m!920661))

(assert (=> b!992301 m!920395))

(assert (=> b!992301 m!920395))

(assert (=> b!992301 m!920661))

(assert (=> bm!42093 d!118251))

(assert (=> b!992005 d!118117))

(declare-fun d!118253 () Bool)

(assert (=> d!118253 (= (apply!907 lt!440125 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15685 (getValueByKey!513 (toList!6833 lt!440125) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28186 () Bool)

(assert (= bs!28186 d!118253))

(assert (=> bs!28186 m!920379))

(assert (=> bs!28186 m!920379))

(declare-fun m!920663 () Bool)

(assert (=> bs!28186 m!920663))

(assert (=> b!992006 d!118253))

(declare-fun d!118255 () Bool)

(assert (=> d!118255 (= (get!15684 (select (arr!30161 _values!1278) from!1932) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1902 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!992052 d!118255))

(declare-fun mapIsEmpty!37029 () Bool)

(declare-fun mapRes!37029 () Bool)

(assert (=> mapIsEmpty!37029 mapRes!37029))

(declare-fun mapNonEmpty!37029 () Bool)

(declare-fun tp!70101 () Bool)

(declare-fun e!559645 () Bool)

(assert (=> mapNonEmpty!37029 (= mapRes!37029 (and tp!70101 e!559645))))

(declare-fun mapValue!37029 () ValueCell!11174)

(declare-fun mapKey!37029 () (_ BitVec 32))

(declare-fun mapRest!37029 () (Array (_ BitVec 32) ValueCell!11174))

(assert (=> mapNonEmpty!37029 (= mapRest!37028 (store mapRest!37029 mapKey!37029 mapValue!37029))))

(declare-fun b!992303 () Bool)

(declare-fun e!559644 () Bool)

(assert (=> b!992303 (= e!559644 tp_is_empty!23311)))

(declare-fun condMapEmpty!37029 () Bool)

(declare-fun mapDefault!37029 () ValueCell!11174)

(assert (=> mapNonEmpty!37028 (= condMapEmpty!37029 (= mapRest!37028 ((as const (Array (_ BitVec 32) ValueCell!11174)) mapDefault!37029)))))

(assert (=> mapNonEmpty!37028 (= tp!70100 (and e!559644 mapRes!37029))))

(declare-fun b!992302 () Bool)

(assert (=> b!992302 (= e!559645 tp_is_empty!23311)))

(assert (= (and mapNonEmpty!37028 condMapEmpty!37029) mapIsEmpty!37029))

(assert (= (and mapNonEmpty!37028 (not condMapEmpty!37029)) mapNonEmpty!37029))

(assert (= (and mapNonEmpty!37029 ((_ is ValueCellFull!11174) mapValue!37029)) b!992302))

(assert (= (and mapNonEmpty!37028 ((_ is ValueCellFull!11174) mapDefault!37029)) b!992303))

(declare-fun m!920665 () Bool)

(assert (=> mapNonEmpty!37029 m!920665))

(declare-fun b_lambda!15235 () Bool)

(assert (= b_lambda!15229 (or (and start!84908 b_free!20095) b_lambda!15235)))

(declare-fun b_lambda!15237 () Bool)

(assert (= b_lambda!15227 (or (and start!84908 b_free!20095) b_lambda!15237)))

(declare-fun b_lambda!15239 () Bool)

(assert (= b_lambda!15233 (or (and start!84908 b_free!20095) b_lambda!15239)))

(declare-fun b_lambda!15241 () Bool)

(assert (= b_lambda!15231 (or (and start!84908 b_free!20095) b_lambda!15241)))

(check-sat (not d!118251) (not b!992094) (not d!118223) (not b_next!20095) (not b_lambda!15235) (not d!118129) (not d!118169) (not d!118225) (not b!992208) (not b!992160) (not mapNonEmpty!37029) (not d!118131) (not b!992102) (not bm!42115) (not b!992156) (not d!118175) (not d!118217) (not b!992281) (not b!992175) (not b!992232) (not b!992186) (not b!992174) (not b!992298) (not b!992236) (not bm!42106) tp_is_empty!23311 (not d!118213) (not b!992231) (not d!118161) b_and!32297 (not bm!42103) (not d!118245) (not b!992139) (not b!992096) (not b!992109) (not d!118181) (not b!992144) (not b!992227) (not d!118199) (not b!992101) (not d!118197) (not d!118167) (not d!118153) (not d!118239) (not b!992248) (not d!118237) (not b!992179) (not b_lambda!15237) (not b!992229) (not b!992294) (not d!118221) (not b!992197) (not b!992154) (not d!118133) (not b_lambda!15239) (not d!118135) (not b!992287) (not d!118141) (not d!118201) (not b!992276) (not d!118183) (not b!992239) (not b!992282) (not b!992295) (not b!992157) (not b!992140) (not b!992288) (not b!992237) (not b!992145) (not b!992153) (not bm!42105) (not d!118247) (not d!118231) (not b!992284) (not d!118137) (not d!118143) (not b!992242) (not b!992299) (not b!992164) (not b_lambda!15217) (not b_lambda!15223) (not b!992180) (not b!992279) (not b_lambda!15225) (not d!118235) (not d!118241) (not b!992146) (not d!118149) (not b!992234) (not b!992168) (not b!992108) (not b!992134) (not b!992270) (not d!118173) (not d!118159) (not b!992141) (not b!992283) (not b!992235) (not b!992280) (not b!992167) (not d!118147) (not d!118195) (not b!992169) (not d!118209) (not b!992159) (not b!992165) (not d!118165) (not d!118253) (not b!992172) (not b!992301) (not b!992136) (not b!992226) (not d!118151) (not b!992177) (not d!118229) (not b!992147) (not b!992249) (not d!118157) (not b!992286) (not b!992199) (not d!118145) (not d!118233) (not b!992161) (not b!992137) (not b!992103) (not d!118207) (not d!118155) (not b!992104) (not d!118179) (not d!118227) (not b_lambda!15241) (not b!992173) (not d!118189) (not d!118211) (not d!118139) (not b!992285) (not b!992230) (not b!992200) (not d!118163) (not bm!42104) (not b!992162) (not d!118219) (not b!992290) (not d!118193) (not d!118215) (not b!992296) (not d!118203))
(check-sat b_and!32297 (not b_next!20095))
