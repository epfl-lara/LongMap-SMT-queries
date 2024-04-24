; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84834 () Bool)

(assert start!84834)

(declare-fun b_free!20077 () Bool)

(declare-fun b_next!20077 () Bool)

(assert (=> start!84834 (= b_free!20077 (not b_next!20077))))

(declare-fun tp!70026 () Bool)

(declare-fun b_and!32235 () Bool)

(assert (=> start!84834 (= tp!70026 b_and!32235)))

(declare-fun b!991103 () Bool)

(declare-fun res!662482 () Bool)

(declare-fun e!558924 () Bool)

(assert (=> b!991103 (=> (not res!662482) (not e!558924))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!36041 0))(
  ( (V!36042 (val!11697 Int)) )
))
(declare-datatypes ((ValueCell!11165 0))(
  ( (ValueCellFull!11165 (v!14264 V!36041)) (EmptyCell!11165) )
))
(declare-datatypes ((array!62592 0))(
  ( (array!62593 (arr!30143 (Array (_ BitVec 32) ValueCell!11165)) (size!30623 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62592)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62594 0))(
  ( (array!62595 (arr!30144 (Array (_ BitVec 32) (_ BitVec 64))) (size!30624 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62594)

(assert (=> b!991103 (= res!662482 (and (= (size!30623 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30624 _keys!1544) (size!30623 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!991104 () Bool)

(declare-fun e!558923 () Bool)

(declare-fun e!558922 () Bool)

(declare-fun mapRes!36988 () Bool)

(assert (=> b!991104 (= e!558923 (and e!558922 mapRes!36988))))

(declare-fun condMapEmpty!36988 () Bool)

(declare-fun mapDefault!36988 () ValueCell!11165)

(assert (=> b!991104 (= condMapEmpty!36988 (= (arr!30143 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11165)) mapDefault!36988)))))

(declare-fun b!991105 () Bool)

(declare-fun res!662487 () Bool)

(assert (=> b!991105 (=> (not res!662487) (not e!558924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62594 (_ BitVec 32)) Bool)

(assert (=> b!991105 (= res!662487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!991106 () Bool)

(declare-fun res!662486 () Bool)

(assert (=> b!991106 (=> (not res!662486) (not e!558924))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!991106 (= res!662486 (validKeyInArray!0 (select (arr!30144 _keys!1544) from!1932)))))

(declare-fun b!991107 () Bool)

(declare-fun res!662485 () Bool)

(assert (=> b!991107 (=> (not res!662485) (not e!558924))))

(assert (=> b!991107 (= res!662485 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30624 _keys!1544))))))

(declare-fun b!991108 () Bool)

(declare-fun e!558927 () Bool)

(assert (=> b!991108 (= e!558924 e!558927)))

(declare-fun res!662488 () Bool)

(assert (=> b!991108 (=> (not res!662488) (not e!558927))))

(assert (=> b!991108 (= res!662488 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30144 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!439636 () V!36041)

(declare-fun get!15672 (ValueCell!11165 V!36041) V!36041)

(declare-fun dynLambda!1901 (Int (_ BitVec 64)) V!36041)

(assert (=> b!991108 (= lt!439636 (get!15672 (select (arr!30143 _values!1278) from!1932) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!36041)

(declare-datatypes ((tuple2!14928 0))(
  ( (tuple2!14929 (_1!7475 (_ BitVec 64)) (_2!7475 V!36041)) )
))
(declare-datatypes ((List!20836 0))(
  ( (Nil!20833) (Cons!20832 (h!22000 tuple2!14928) (t!29801 List!20836)) )
))
(declare-datatypes ((ListLongMap!13627 0))(
  ( (ListLongMap!13628 (toList!6829 List!20836)) )
))
(declare-fun lt!439632 () ListLongMap!13627)

(declare-fun zeroValue!1220 () V!36041)

(declare-fun getCurrentListMapNoExtraKeys!3557 (array!62594 array!62592 (_ BitVec 32) (_ BitVec 32) V!36041 V!36041 (_ BitVec 32) Int) ListLongMap!13627)

(assert (=> b!991108 (= lt!439632 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapIsEmpty!36988 () Bool)

(assert (=> mapIsEmpty!36988 mapRes!36988))

(declare-fun b!991109 () Bool)

(declare-fun lt!439635 () tuple2!14928)

(declare-fun getCurrentListMap!3876 (array!62594 array!62592 (_ BitVec 32) (_ BitVec 32) V!36041 V!36041 (_ BitVec 32) Int) ListLongMap!13627)

(declare-fun +!3117 (ListLongMap!13627 tuple2!14928) ListLongMap!13627)

(assert (=> b!991109 (= e!558927 (not (= (getCurrentListMap!3876 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) (+!3117 (getCurrentListMap!3876 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!439635))))))

(declare-fun lt!439633 () tuple2!14928)

(assert (=> b!991109 (= (+!3117 (+!3117 lt!439632 lt!439633) lt!439635) (+!3117 (+!3117 lt!439632 lt!439635) lt!439633))))

(assert (=> b!991109 (= lt!439635 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636))))

(assert (=> b!991109 (= lt!439633 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32849 0))(
  ( (Unit!32850) )
))
(declare-fun lt!439634 () Unit!32849)

(declare-fun addCommutativeForDiffKeys!718 (ListLongMap!13627 (_ BitVec 64) V!36041 (_ BitVec 64) V!36041) Unit!32849)

(assert (=> b!991109 (= lt!439634 (addCommutativeForDiffKeys!718 lt!439632 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30144 _keys!1544) from!1932) lt!439636))))

(declare-fun b!991110 () Bool)

(declare-fun res!662484 () Bool)

(assert (=> b!991110 (=> (not res!662484) (not e!558924))))

(assert (=> b!991110 (= res!662484 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!662489 () Bool)

(assert (=> start!84834 (=> (not res!662489) (not e!558924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84834 (= res!662489 (validMask!0 mask!1948))))

(assert (=> start!84834 e!558924))

(assert (=> start!84834 true))

(declare-fun tp_is_empty!23293 () Bool)

(assert (=> start!84834 tp_is_empty!23293))

(declare-fun array_inv!23309 (array!62592) Bool)

(assert (=> start!84834 (and (array_inv!23309 _values!1278) e!558923)))

(assert (=> start!84834 tp!70026))

(declare-fun array_inv!23310 (array!62594) Bool)

(assert (=> start!84834 (array_inv!23310 _keys!1544)))

(declare-fun b!991111 () Bool)

(assert (=> b!991111 (= e!558922 tp_is_empty!23293)))

(declare-fun mapNonEmpty!36988 () Bool)

(declare-fun tp!70027 () Bool)

(declare-fun e!558926 () Bool)

(assert (=> mapNonEmpty!36988 (= mapRes!36988 (and tp!70027 e!558926))))

(declare-fun mapKey!36988 () (_ BitVec 32))

(declare-fun mapRest!36988 () (Array (_ BitVec 32) ValueCell!11165))

(declare-fun mapValue!36988 () ValueCell!11165)

(assert (=> mapNonEmpty!36988 (= (arr!30143 _values!1278) (store mapRest!36988 mapKey!36988 mapValue!36988))))

(declare-fun b!991112 () Bool)

(assert (=> b!991112 (= e!558926 tp_is_empty!23293)))

(declare-fun b!991113 () Bool)

(declare-fun res!662483 () Bool)

(assert (=> b!991113 (=> (not res!662483) (not e!558924))))

(declare-datatypes ((List!20837 0))(
  ( (Nil!20834) (Cons!20833 (h!22001 (_ BitVec 64)) (t!29802 List!20837)) )
))
(declare-fun arrayNoDuplicates!0 (array!62594 (_ BitVec 32) List!20837) Bool)

(assert (=> b!991113 (= res!662483 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20834))))

(assert (= (and start!84834 res!662489) b!991103))

(assert (= (and b!991103 res!662482) b!991105))

(assert (= (and b!991105 res!662487) b!991113))

(assert (= (and b!991113 res!662483) b!991107))

(assert (= (and b!991107 res!662485) b!991106))

(assert (= (and b!991106 res!662486) b!991110))

(assert (= (and b!991110 res!662484) b!991108))

(assert (= (and b!991108 res!662488) b!991109))

(assert (= (and b!991104 condMapEmpty!36988) mapIsEmpty!36988))

(assert (= (and b!991104 (not condMapEmpty!36988)) mapNonEmpty!36988))

(get-info :version)

(assert (= (and mapNonEmpty!36988 ((_ is ValueCellFull!11165) mapValue!36988)) b!991112))

(assert (= (and b!991104 ((_ is ValueCellFull!11165) mapDefault!36988)) b!991111))

(assert (= start!84834 b!991104))

(declare-fun b_lambda!15171 () Bool)

(assert (=> (not b_lambda!15171) (not b!991108)))

(declare-fun t!29800 () Bool)

(declare-fun tb!6815 () Bool)

(assert (=> (and start!84834 (= defaultEntry!1281 defaultEntry!1281) t!29800) tb!6815))

(declare-fun result!13639 () Bool)

(assert (=> tb!6815 (= result!13639 tp_is_empty!23293)))

(assert (=> b!991108 t!29800))

(declare-fun b_and!32237 () Bool)

(assert (= b_and!32235 (and (=> t!29800 result!13639) b_and!32237)))

(declare-fun m!918897 () Bool)

(assert (=> b!991109 m!918897))

(declare-fun m!918899 () Bool)

(assert (=> b!991109 m!918899))

(assert (=> b!991109 m!918897))

(declare-fun m!918901 () Bool)

(assert (=> b!991109 m!918901))

(declare-fun m!918903 () Bool)

(assert (=> b!991109 m!918903))

(assert (=> b!991109 m!918901))

(declare-fun m!918905 () Bool)

(assert (=> b!991109 m!918905))

(assert (=> b!991109 m!918905))

(declare-fun m!918907 () Bool)

(assert (=> b!991109 m!918907))

(declare-fun m!918909 () Bool)

(assert (=> b!991109 m!918909))

(assert (=> b!991109 m!918909))

(declare-fun m!918911 () Bool)

(assert (=> b!991109 m!918911))

(declare-fun m!918913 () Bool)

(assert (=> b!991109 m!918913))

(declare-fun m!918915 () Bool)

(assert (=> b!991105 m!918915))

(declare-fun m!918917 () Bool)

(assert (=> mapNonEmpty!36988 m!918917))

(assert (=> b!991106 m!918897))

(assert (=> b!991106 m!918897))

(declare-fun m!918919 () Bool)

(assert (=> b!991106 m!918919))

(declare-fun m!918921 () Bool)

(assert (=> b!991113 m!918921))

(assert (=> b!991108 m!918897))

(declare-fun m!918923 () Bool)

(assert (=> b!991108 m!918923))

(declare-fun m!918925 () Bool)

(assert (=> b!991108 m!918925))

(declare-fun m!918927 () Bool)

(assert (=> b!991108 m!918927))

(assert (=> b!991108 m!918923))

(assert (=> b!991108 m!918927))

(declare-fun m!918929 () Bool)

(assert (=> b!991108 m!918929))

(declare-fun m!918931 () Bool)

(assert (=> start!84834 m!918931))

(declare-fun m!918933 () Bool)

(assert (=> start!84834 m!918933))

(declare-fun m!918935 () Bool)

(assert (=> start!84834 m!918935))

(check-sat (not start!84834) (not b!991113) (not b_lambda!15171) (not mapNonEmpty!36988) (not b!991106) tp_is_empty!23293 (not b_next!20077) (not b!991108) (not b!991105) (not b!991109) b_and!32237)
(check-sat b_and!32237 (not b_next!20077))
(get-model)

(declare-fun b_lambda!15177 () Bool)

(assert (= b_lambda!15171 (or (and start!84834 b_free!20077) b_lambda!15177)))

(check-sat (not start!84834) (not b!991113) (not mapNonEmpty!36988) (not b!991106) tp_is_empty!23293 (not b_next!20077) (not b!991108) (not b_lambda!15177) (not b!991105) (not b!991109) b_and!32237)
(check-sat b_and!32237 (not b_next!20077))
(get-model)

(declare-fun d!117863 () Bool)

(assert (=> d!117863 (= (validKeyInArray!0 (select (arr!30144 _keys!1544) from!1932)) (and (not (= (select (arr!30144 _keys!1544) from!1932) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30144 _keys!1544) from!1932) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!991106 d!117863))

(declare-fun b!991194 () Bool)

(declare-fun e!558971 () Bool)

(declare-fun e!558970 () Bool)

(assert (=> b!991194 (= e!558971 e!558970)))

(declare-fun lt!439673 () (_ BitVec 64))

(assert (=> b!991194 (= lt!439673 (select (arr!30144 _keys!1544) #b00000000000000000000000000000000))))

(declare-fun lt!439674 () Unit!32849)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62594 (_ BitVec 64) (_ BitVec 32)) Unit!32849)

(assert (=> b!991194 (= lt!439674 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!439673 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!991194 (arrayContainsKey!0 _keys!1544 lt!439673 #b00000000000000000000000000000000)))

(declare-fun lt!439675 () Unit!32849)

(assert (=> b!991194 (= lt!439675 lt!439674)))

(declare-fun res!662542 () Bool)

(declare-datatypes ((SeekEntryResult!9167 0))(
  ( (MissingZero!9167 (index!39039 (_ BitVec 32))) (Found!9167 (index!39040 (_ BitVec 32))) (Intermediate!9167 (undefined!9979 Bool) (index!39041 (_ BitVec 32)) (x!86155 (_ BitVec 32))) (Undefined!9167) (MissingVacant!9167 (index!39042 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62594 (_ BitVec 32)) SeekEntryResult!9167)

(assert (=> b!991194 (= res!662542 (= (seekEntryOrOpen!0 (select (arr!30144 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9167 #b00000000000000000000000000000000)))))

(assert (=> b!991194 (=> (not res!662542) (not e!558970))))

(declare-fun d!117865 () Bool)

(declare-fun res!662543 () Bool)

(declare-fun e!558972 () Bool)

(assert (=> d!117865 (=> res!662543 e!558972)))

(assert (=> d!117865 (= res!662543 (bvsge #b00000000000000000000000000000000 (size!30624 _keys!1544)))))

(assert (=> d!117865 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!558972)))

(declare-fun b!991195 () Bool)

(assert (=> b!991195 (= e!558972 e!558971)))

(declare-fun c!100681 () Bool)

(assert (=> b!991195 (= c!100681 (validKeyInArray!0 (select (arr!30144 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!991196 () Bool)

(declare-fun call!42010 () Bool)

(assert (=> b!991196 (= e!558971 call!42010)))

(declare-fun b!991197 () Bool)

(assert (=> b!991197 (= e!558970 call!42010)))

(declare-fun bm!42007 () Bool)

(assert (=> bm!42007 (= call!42010 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(assert (= (and d!117865 (not res!662543)) b!991195))

(assert (= (and b!991195 c!100681) b!991194))

(assert (= (and b!991195 (not c!100681)) b!991196))

(assert (= (and b!991194 res!662542) b!991197))

(assert (= (or b!991197 b!991196) bm!42007))

(declare-fun m!919017 () Bool)

(assert (=> b!991194 m!919017))

(declare-fun m!919019 () Bool)

(assert (=> b!991194 m!919019))

(declare-fun m!919021 () Bool)

(assert (=> b!991194 m!919021))

(assert (=> b!991194 m!919017))

(declare-fun m!919023 () Bool)

(assert (=> b!991194 m!919023))

(assert (=> b!991195 m!919017))

(assert (=> b!991195 m!919017))

(declare-fun m!919025 () Bool)

(assert (=> b!991195 m!919025))

(declare-fun m!919027 () Bool)

(assert (=> bm!42007 m!919027))

(assert (=> b!991105 d!117865))

(declare-fun d!117867 () Bool)

(assert (=> d!117867 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!84834 d!117867))

(declare-fun d!117869 () Bool)

(assert (=> d!117869 (= (array_inv!23309 _values!1278) (bvsge (size!30623 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!84834 d!117869))

(declare-fun d!117871 () Bool)

(assert (=> d!117871 (= (array_inv!23310 _keys!1544) (bvsge (size!30624 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!84834 d!117871))

(declare-fun b!991208 () Bool)

(declare-fun e!558981 () Bool)

(declare-fun call!42013 () Bool)

(assert (=> b!991208 (= e!558981 call!42013)))

(declare-fun d!117873 () Bool)

(declare-fun res!662551 () Bool)

(declare-fun e!558984 () Bool)

(assert (=> d!117873 (=> res!662551 e!558984)))

(assert (=> d!117873 (= res!662551 (bvsge #b00000000000000000000000000000000 (size!30624 _keys!1544)))))

(assert (=> d!117873 (= (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20834) e!558984)))

(declare-fun b!991209 () Bool)

(declare-fun e!558982 () Bool)

(assert (=> b!991209 (= e!558982 e!558981)))

(declare-fun c!100684 () Bool)

(assert (=> b!991209 (= c!100684 (validKeyInArray!0 (select (arr!30144 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!991210 () Bool)

(declare-fun e!558983 () Bool)

(declare-fun contains!5745 (List!20837 (_ BitVec 64)) Bool)

(assert (=> b!991210 (= e!558983 (contains!5745 Nil!20834 (select (arr!30144 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun bm!42010 () Bool)

(assert (=> bm!42010 (= call!42013 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100684 (Cons!20833 (select (arr!30144 _keys!1544) #b00000000000000000000000000000000) Nil!20834) Nil!20834)))))

(declare-fun b!991211 () Bool)

(assert (=> b!991211 (= e!558981 call!42013)))

(declare-fun b!991212 () Bool)

(assert (=> b!991212 (= e!558984 e!558982)))

(declare-fun res!662550 () Bool)

(assert (=> b!991212 (=> (not res!662550) (not e!558982))))

(assert (=> b!991212 (= res!662550 (not e!558983))))

(declare-fun res!662552 () Bool)

(assert (=> b!991212 (=> (not res!662552) (not e!558983))))

(assert (=> b!991212 (= res!662552 (validKeyInArray!0 (select (arr!30144 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!117873 (not res!662551)) b!991212))

(assert (= (and b!991212 res!662552) b!991210))

(assert (= (and b!991212 res!662550) b!991209))

(assert (= (and b!991209 c!100684) b!991208))

(assert (= (and b!991209 (not c!100684)) b!991211))

(assert (= (or b!991208 b!991211) bm!42010))

(assert (=> b!991209 m!919017))

(assert (=> b!991209 m!919017))

(assert (=> b!991209 m!919025))

(assert (=> b!991210 m!919017))

(assert (=> b!991210 m!919017))

(declare-fun m!919029 () Bool)

(assert (=> b!991210 m!919029))

(assert (=> bm!42010 m!919017))

(declare-fun m!919031 () Bool)

(assert (=> bm!42010 m!919031))

(assert (=> b!991212 m!919017))

(assert (=> b!991212 m!919017))

(assert (=> b!991212 m!919025))

(assert (=> b!991113 d!117873))

(declare-fun d!117875 () Bool)

(declare-fun e!558987 () Bool)

(assert (=> d!117875 e!558987))

(declare-fun res!662558 () Bool)

(assert (=> d!117875 (=> (not res!662558) (not e!558987))))

(declare-fun lt!439685 () ListLongMap!13627)

(declare-fun contains!5746 (ListLongMap!13627 (_ BitVec 64)) Bool)

(assert (=> d!117875 (= res!662558 (contains!5746 lt!439685 (_1!7475 lt!439635)))))

(declare-fun lt!439684 () List!20836)

(assert (=> d!117875 (= lt!439685 (ListLongMap!13628 lt!439684))))

(declare-fun lt!439686 () Unit!32849)

(declare-fun lt!439687 () Unit!32849)

(assert (=> d!117875 (= lt!439686 lt!439687)))

(declare-datatypes ((Option!518 0))(
  ( (Some!517 (v!14267 V!36041)) (None!516) )
))
(declare-fun getValueByKey!512 (List!20836 (_ BitVec 64)) Option!518)

(assert (=> d!117875 (= (getValueByKey!512 lt!439684 (_1!7475 lt!439635)) (Some!517 (_2!7475 lt!439635)))))

(declare-fun lemmaContainsTupThenGetReturnValue!274 (List!20836 (_ BitVec 64) V!36041) Unit!32849)

(assert (=> d!117875 (= lt!439687 (lemmaContainsTupThenGetReturnValue!274 lt!439684 (_1!7475 lt!439635) (_2!7475 lt!439635)))))

(declare-fun insertStrictlySorted!331 (List!20836 (_ BitVec 64) V!36041) List!20836)

(assert (=> d!117875 (= lt!439684 (insertStrictlySorted!331 (toList!6829 lt!439632) (_1!7475 lt!439635) (_2!7475 lt!439635)))))

(assert (=> d!117875 (= (+!3117 lt!439632 lt!439635) lt!439685)))

(declare-fun b!991217 () Bool)

(declare-fun res!662557 () Bool)

(assert (=> b!991217 (=> (not res!662557) (not e!558987))))

(assert (=> b!991217 (= res!662557 (= (getValueByKey!512 (toList!6829 lt!439685) (_1!7475 lt!439635)) (Some!517 (_2!7475 lt!439635))))))

(declare-fun b!991218 () Bool)

(declare-fun contains!5747 (List!20836 tuple2!14928) Bool)

(assert (=> b!991218 (= e!558987 (contains!5747 (toList!6829 lt!439685) lt!439635))))

(assert (= (and d!117875 res!662558) b!991217))

(assert (= (and b!991217 res!662557) b!991218))

(declare-fun m!919033 () Bool)

(assert (=> d!117875 m!919033))

(declare-fun m!919035 () Bool)

(assert (=> d!117875 m!919035))

(declare-fun m!919037 () Bool)

(assert (=> d!117875 m!919037))

(declare-fun m!919039 () Bool)

(assert (=> d!117875 m!919039))

(declare-fun m!919041 () Bool)

(assert (=> b!991217 m!919041))

(declare-fun m!919043 () Bool)

(assert (=> b!991218 m!919043))

(assert (=> b!991109 d!117875))

(declare-fun d!117877 () Bool)

(assert (=> d!117877 (= (+!3117 (+!3117 lt!439632 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636)) (+!3117 (+!3117 lt!439632 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636)) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun lt!439690 () Unit!32849)

(declare-fun choose!1621 (ListLongMap!13627 (_ BitVec 64) V!36041 (_ BitVec 64) V!36041) Unit!32849)

(assert (=> d!117877 (= lt!439690 (choose!1621 lt!439632 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30144 _keys!1544) from!1932) lt!439636))))

(assert (=> d!117877 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30144 _keys!1544) from!1932)))))

(assert (=> d!117877 (= (addCommutativeForDiffKeys!718 lt!439632 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30144 _keys!1544) from!1932) lt!439636) lt!439690)))

(declare-fun bs!28132 () Bool)

(assert (= bs!28132 d!117877))

(assert (=> bs!28132 m!918897))

(declare-fun m!919045 () Bool)

(assert (=> bs!28132 m!919045))

(declare-fun m!919047 () Bool)

(assert (=> bs!28132 m!919047))

(assert (=> bs!28132 m!919047))

(declare-fun m!919049 () Bool)

(assert (=> bs!28132 m!919049))

(declare-fun m!919051 () Bool)

(assert (=> bs!28132 m!919051))

(assert (=> bs!28132 m!919051))

(declare-fun m!919053 () Bool)

(assert (=> bs!28132 m!919053))

(assert (=> b!991109 d!117877))

(declare-fun d!117879 () Bool)

(declare-fun e!558988 () Bool)

(assert (=> d!117879 e!558988))

(declare-fun res!662560 () Bool)

(assert (=> d!117879 (=> (not res!662560) (not e!558988))))

(declare-fun lt!439692 () ListLongMap!13627)

(assert (=> d!117879 (= res!662560 (contains!5746 lt!439692 (_1!7475 lt!439633)))))

(declare-fun lt!439691 () List!20836)

(assert (=> d!117879 (= lt!439692 (ListLongMap!13628 lt!439691))))

(declare-fun lt!439693 () Unit!32849)

(declare-fun lt!439694 () Unit!32849)

(assert (=> d!117879 (= lt!439693 lt!439694)))

(assert (=> d!117879 (= (getValueByKey!512 lt!439691 (_1!7475 lt!439633)) (Some!517 (_2!7475 lt!439633)))))

(assert (=> d!117879 (= lt!439694 (lemmaContainsTupThenGetReturnValue!274 lt!439691 (_1!7475 lt!439633) (_2!7475 lt!439633)))))

(assert (=> d!117879 (= lt!439691 (insertStrictlySorted!331 (toList!6829 lt!439632) (_1!7475 lt!439633) (_2!7475 lt!439633)))))

(assert (=> d!117879 (= (+!3117 lt!439632 lt!439633) lt!439692)))

(declare-fun b!991219 () Bool)

(declare-fun res!662559 () Bool)

(assert (=> b!991219 (=> (not res!662559) (not e!558988))))

(assert (=> b!991219 (= res!662559 (= (getValueByKey!512 (toList!6829 lt!439692) (_1!7475 lt!439633)) (Some!517 (_2!7475 lt!439633))))))

(declare-fun b!991220 () Bool)

(assert (=> b!991220 (= e!558988 (contains!5747 (toList!6829 lt!439692) lt!439633))))

(assert (= (and d!117879 res!662560) b!991219))

(assert (= (and b!991219 res!662559) b!991220))

(declare-fun m!919055 () Bool)

(assert (=> d!117879 m!919055))

(declare-fun m!919057 () Bool)

(assert (=> d!117879 m!919057))

(declare-fun m!919059 () Bool)

(assert (=> d!117879 m!919059))

(declare-fun m!919061 () Bool)

(assert (=> d!117879 m!919061))

(declare-fun m!919063 () Bool)

(assert (=> b!991219 m!919063))

(declare-fun m!919065 () Bool)

(assert (=> b!991220 m!919065))

(assert (=> b!991109 d!117879))

(declare-fun d!117881 () Bool)

(declare-fun e!558989 () Bool)

(assert (=> d!117881 e!558989))

(declare-fun res!662562 () Bool)

(assert (=> d!117881 (=> (not res!662562) (not e!558989))))

(declare-fun lt!439696 () ListLongMap!13627)

(assert (=> d!117881 (= res!662562 (contains!5746 lt!439696 (_1!7475 lt!439635)))))

(declare-fun lt!439695 () List!20836)

(assert (=> d!117881 (= lt!439696 (ListLongMap!13628 lt!439695))))

(declare-fun lt!439697 () Unit!32849)

(declare-fun lt!439698 () Unit!32849)

(assert (=> d!117881 (= lt!439697 lt!439698)))

(assert (=> d!117881 (= (getValueByKey!512 lt!439695 (_1!7475 lt!439635)) (Some!517 (_2!7475 lt!439635)))))

(assert (=> d!117881 (= lt!439698 (lemmaContainsTupThenGetReturnValue!274 lt!439695 (_1!7475 lt!439635) (_2!7475 lt!439635)))))

(assert (=> d!117881 (= lt!439695 (insertStrictlySorted!331 (toList!6829 (+!3117 lt!439632 lt!439633)) (_1!7475 lt!439635) (_2!7475 lt!439635)))))

(assert (=> d!117881 (= (+!3117 (+!3117 lt!439632 lt!439633) lt!439635) lt!439696)))

(declare-fun b!991221 () Bool)

(declare-fun res!662561 () Bool)

(assert (=> b!991221 (=> (not res!662561) (not e!558989))))

(assert (=> b!991221 (= res!662561 (= (getValueByKey!512 (toList!6829 lt!439696) (_1!7475 lt!439635)) (Some!517 (_2!7475 lt!439635))))))

(declare-fun b!991222 () Bool)

(assert (=> b!991222 (= e!558989 (contains!5747 (toList!6829 lt!439696) lt!439635))))

(assert (= (and d!117881 res!662562) b!991221))

(assert (= (and b!991221 res!662561) b!991222))

(declare-fun m!919067 () Bool)

(assert (=> d!117881 m!919067))

(declare-fun m!919069 () Bool)

(assert (=> d!117881 m!919069))

(declare-fun m!919071 () Bool)

(assert (=> d!117881 m!919071))

(declare-fun m!919073 () Bool)

(assert (=> d!117881 m!919073))

(declare-fun m!919075 () Bool)

(assert (=> b!991221 m!919075))

(declare-fun m!919077 () Bool)

(assert (=> b!991222 m!919077))

(assert (=> b!991109 d!117881))

(declare-fun bm!42025 () Bool)

(declare-fun call!42028 () ListLongMap!13627)

(declare-fun call!42032 () ListLongMap!13627)

(assert (=> bm!42025 (= call!42028 call!42032)))

(declare-fun b!991265 () Bool)

(declare-fun e!559025 () Bool)

(assert (=> b!991265 (= e!559025 (validKeyInArray!0 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!991266 () Bool)

(declare-fun e!559026 () ListLongMap!13627)

(assert (=> b!991266 (= e!559026 call!42028)))

(declare-fun bm!42026 () Bool)

(declare-fun call!42034 () ListLongMap!13627)

(declare-fun call!42030 () ListLongMap!13627)

(assert (=> bm!42026 (= call!42034 call!42030)))

(declare-fun b!991267 () Bool)

(declare-fun e!559027 () ListLongMap!13627)

(assert (=> b!991267 (= e!559027 call!42034)))

(declare-fun call!42029 () ListLongMap!13627)

(declare-fun bm!42027 () Bool)

(declare-fun c!100700 () Bool)

(declare-fun c!100698 () Bool)

(assert (=> bm!42027 (= call!42030 (+!3117 (ite c!100698 call!42029 (ite c!100700 call!42032 call!42028)) (ite (or c!100698 c!100700) (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun b!991268 () Bool)

(declare-fun e!559017 () ListLongMap!13627)

(assert (=> b!991268 (= e!559017 e!559027)))

(assert (=> b!991268 (= c!100700 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!991269 () Bool)

(declare-fun e!559019 () Bool)

(declare-fun e!559022 () Bool)

(assert (=> b!991269 (= e!559019 e!559022)))

(declare-fun c!100697 () Bool)

(assert (=> b!991269 (= c!100697 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!991270 () Bool)

(declare-fun e!559016 () Bool)

(declare-fun lt!439760 () ListLongMap!13627)

(declare-fun apply!906 (ListLongMap!13627 (_ BitVec 64)) V!36041)

(assert (=> b!991270 (= e!559016 (= (apply!906 lt!439760 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1220))))

(declare-fun b!991271 () Bool)

(declare-fun e!559018 () Unit!32849)

(declare-fun lt!439749 () Unit!32849)

(assert (=> b!991271 (= e!559018 lt!439749)))

(declare-fun lt!439758 () ListLongMap!13627)

(assert (=> b!991271 (= lt!439758 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439752 () (_ BitVec 64))

(assert (=> b!991271 (= lt!439752 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439753 () (_ BitVec 64))

(assert (=> b!991271 (= lt!439753 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!439750 () Unit!32849)

(declare-fun addStillContains!616 (ListLongMap!13627 (_ BitVec 64) V!36041 (_ BitVec 64)) Unit!32849)

(assert (=> b!991271 (= lt!439750 (addStillContains!616 lt!439758 lt!439752 zeroValue!1220 lt!439753))))

(assert (=> b!991271 (contains!5746 (+!3117 lt!439758 (tuple2!14929 lt!439752 zeroValue!1220)) lt!439753)))

(declare-fun lt!439757 () Unit!32849)

(assert (=> b!991271 (= lt!439757 lt!439750)))

(declare-fun lt!439748 () ListLongMap!13627)

(assert (=> b!991271 (= lt!439748 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439743 () (_ BitVec 64))

(assert (=> b!991271 (= lt!439743 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439755 () (_ BitVec 64))

(assert (=> b!991271 (= lt!439755 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!439763 () Unit!32849)

(declare-fun addApplyDifferent!472 (ListLongMap!13627 (_ BitVec 64) V!36041 (_ BitVec 64)) Unit!32849)

(assert (=> b!991271 (= lt!439763 (addApplyDifferent!472 lt!439748 lt!439743 minValue!1220 lt!439755))))

(assert (=> b!991271 (= (apply!906 (+!3117 lt!439748 (tuple2!14929 lt!439743 minValue!1220)) lt!439755) (apply!906 lt!439748 lt!439755))))

(declare-fun lt!439759 () Unit!32849)

(assert (=> b!991271 (= lt!439759 lt!439763)))

(declare-fun lt!439744 () ListLongMap!13627)

(assert (=> b!991271 (= lt!439744 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439745 () (_ BitVec 64))

(assert (=> b!991271 (= lt!439745 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439754 () (_ BitVec 64))

(assert (=> b!991271 (= lt!439754 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!439761 () Unit!32849)

(assert (=> b!991271 (= lt!439761 (addApplyDifferent!472 lt!439744 lt!439745 zeroValue!1220 lt!439754))))

(assert (=> b!991271 (= (apply!906 (+!3117 lt!439744 (tuple2!14929 lt!439745 zeroValue!1220)) lt!439754) (apply!906 lt!439744 lt!439754))))

(declare-fun lt!439746 () Unit!32849)

(assert (=> b!991271 (= lt!439746 lt!439761)))

(declare-fun lt!439756 () ListLongMap!13627)

(assert (=> b!991271 (= lt!439756 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439747 () (_ BitVec 64))

(assert (=> b!991271 (= lt!439747 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439764 () (_ BitVec 64))

(assert (=> b!991271 (= lt!439764 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!991271 (= lt!439749 (addApplyDifferent!472 lt!439756 lt!439747 minValue!1220 lt!439764))))

(assert (=> b!991271 (= (apply!906 (+!3117 lt!439756 (tuple2!14929 lt!439747 minValue!1220)) lt!439764) (apply!906 lt!439756 lt!439764))))

(declare-fun b!991272 () Bool)

(assert (=> b!991272 (= e!559017 (+!3117 call!42030 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun b!991273 () Bool)

(declare-fun e!559023 () Bool)

(assert (=> b!991273 (= e!559023 (= (apply!906 lt!439760 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1220))))

(declare-fun d!117883 () Bool)

(assert (=> d!117883 e!559019))

(declare-fun res!662581 () Bool)

(assert (=> d!117883 (=> (not res!662581) (not e!559019))))

(assert (=> d!117883 (= res!662581 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30624 _keys!1544)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30624 _keys!1544)))))))

(declare-fun lt!439751 () ListLongMap!13627)

(assert (=> d!117883 (= lt!439760 lt!439751)))

(declare-fun lt!439762 () Unit!32849)

(assert (=> d!117883 (= lt!439762 e!559018)))

(declare-fun c!100702 () Bool)

(assert (=> d!117883 (= c!100702 e!559025)))

(declare-fun res!662586 () Bool)

(assert (=> d!117883 (=> (not res!662586) (not e!559025))))

(assert (=> d!117883 (= res!662586 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30624 _keys!1544)))))

(assert (=> d!117883 (= lt!439751 e!559017)))

(assert (=> d!117883 (= c!100698 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!117883 (validMask!0 mask!1948)))

(assert (=> d!117883 (= (getCurrentListMap!3876 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!439760)))

(declare-fun bm!42028 () Bool)

(declare-fun call!42031 () Bool)

(assert (=> bm!42028 (= call!42031 (contains!5746 lt!439760 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!42029 () Bool)

(assert (=> bm!42029 (= call!42032 call!42029)))

(declare-fun bm!42030 () Bool)

(assert (=> bm!42030 (= call!42029 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!991274 () Bool)

(assert (=> b!991274 (= e!559022 e!559023)))

(declare-fun res!662583 () Bool)

(declare-fun call!42033 () Bool)

(assert (=> b!991274 (= res!662583 call!42033)))

(assert (=> b!991274 (=> (not res!662583) (not e!559023))))

(declare-fun b!991275 () Bool)

(declare-fun res!662588 () Bool)

(assert (=> b!991275 (=> (not res!662588) (not e!559019))))

(declare-fun e!559021 () Bool)

(assert (=> b!991275 (= res!662588 e!559021)))

(declare-fun c!100701 () Bool)

(assert (=> b!991275 (= c!100701 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!991276 () Bool)

(declare-fun e!559028 () Bool)

(declare-fun e!559020 () Bool)

(assert (=> b!991276 (= e!559028 e!559020)))

(declare-fun res!662587 () Bool)

(assert (=> b!991276 (=> (not res!662587) (not e!559020))))

(assert (=> b!991276 (= res!662587 (contains!5746 lt!439760 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!991276 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30624 _keys!1544)))))

(declare-fun b!991277 () Bool)

(assert (=> b!991277 (= e!559020 (= (apply!906 lt!439760 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15672 (select (arr!30143 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!991277 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30623 _values!1278)))))

(assert (=> b!991277 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30624 _keys!1544)))))

(declare-fun b!991278 () Bool)

(declare-fun c!100699 () Bool)

(assert (=> b!991278 (= c!100699 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!991278 (= e!559027 e!559026)))

(declare-fun bm!42031 () Bool)

(assert (=> bm!42031 (= call!42033 (contains!5746 lt!439760 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991279 () Bool)

(assert (=> b!991279 (= e!559022 (not call!42033))))

(declare-fun b!991280 () Bool)

(assert (=> b!991280 (= e!559021 e!559016)))

(declare-fun res!662585 () Bool)

(assert (=> b!991280 (= res!662585 call!42031)))

(assert (=> b!991280 (=> (not res!662585) (not e!559016))))

(declare-fun b!991281 () Bool)

(declare-fun e!559024 () Bool)

(assert (=> b!991281 (= e!559024 (validKeyInArray!0 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!991282 () Bool)

(declare-fun Unit!32851 () Unit!32849)

(assert (=> b!991282 (= e!559018 Unit!32851)))

(declare-fun b!991283 () Bool)

(declare-fun res!662584 () Bool)

(assert (=> b!991283 (=> (not res!662584) (not e!559019))))

(assert (=> b!991283 (= res!662584 e!559028)))

(declare-fun res!662582 () Bool)

(assert (=> b!991283 (=> res!662582 e!559028)))

(assert (=> b!991283 (= res!662582 (not e!559024))))

(declare-fun res!662589 () Bool)

(assert (=> b!991283 (=> (not res!662589) (not e!559024))))

(assert (=> b!991283 (= res!662589 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30624 _keys!1544)))))

(declare-fun b!991284 () Bool)

(assert (=> b!991284 (= e!559026 call!42034)))

(declare-fun b!991285 () Bool)

(assert (=> b!991285 (= e!559021 (not call!42031))))

(assert (= (and d!117883 c!100698) b!991272))

(assert (= (and d!117883 (not c!100698)) b!991268))

(assert (= (and b!991268 c!100700) b!991267))

(assert (= (and b!991268 (not c!100700)) b!991278))

(assert (= (and b!991278 c!100699) b!991284))

(assert (= (and b!991278 (not c!100699)) b!991266))

(assert (= (or b!991284 b!991266) bm!42025))

(assert (= (or b!991267 bm!42025) bm!42029))

(assert (= (or b!991267 b!991284) bm!42026))

(assert (= (or b!991272 bm!42029) bm!42030))

(assert (= (or b!991272 bm!42026) bm!42027))

(assert (= (and d!117883 res!662586) b!991265))

(assert (= (and d!117883 c!100702) b!991271))

(assert (= (and d!117883 (not c!100702)) b!991282))

(assert (= (and d!117883 res!662581) b!991283))

(assert (= (and b!991283 res!662589) b!991281))

(assert (= (and b!991283 (not res!662582)) b!991276))

(assert (= (and b!991276 res!662587) b!991277))

(assert (= (and b!991283 res!662584) b!991275))

(assert (= (and b!991275 c!100701) b!991280))

(assert (= (and b!991275 (not c!100701)) b!991285))

(assert (= (and b!991280 res!662585) b!991270))

(assert (= (or b!991280 b!991285) bm!42028))

(assert (= (and b!991275 res!662588) b!991269))

(assert (= (and b!991269 c!100697) b!991274))

(assert (= (and b!991269 (not c!100697)) b!991279))

(assert (= (and b!991274 res!662583) b!991273))

(assert (= (or b!991274 b!991279) bm!42031))

(declare-fun b_lambda!15179 () Bool)

(assert (=> (not b_lambda!15179) (not b!991277)))

(assert (=> b!991277 t!29800))

(declare-fun b_and!32247 () Bool)

(assert (= b_and!32237 (and (=> t!29800 result!13639) b_and!32247)))

(declare-fun m!919079 () Bool)

(assert (=> b!991281 m!919079))

(assert (=> b!991281 m!919079))

(declare-fun m!919081 () Bool)

(assert (=> b!991281 m!919081))

(assert (=> b!991265 m!919079))

(assert (=> b!991265 m!919079))

(assert (=> b!991265 m!919081))

(assert (=> d!117883 m!918931))

(declare-fun m!919083 () Bool)

(assert (=> b!991273 m!919083))

(declare-fun m!919085 () Bool)

(assert (=> bm!42028 m!919085))

(assert (=> bm!42030 m!918925))

(declare-fun m!919087 () Bool)

(assert (=> b!991271 m!919087))

(declare-fun m!919089 () Bool)

(assert (=> b!991271 m!919089))

(declare-fun m!919091 () Bool)

(assert (=> b!991271 m!919091))

(assert (=> b!991271 m!919087))

(declare-fun m!919093 () Bool)

(assert (=> b!991271 m!919093))

(declare-fun m!919095 () Bool)

(assert (=> b!991271 m!919095))

(declare-fun m!919097 () Bool)

(assert (=> b!991271 m!919097))

(declare-fun m!919099 () Bool)

(assert (=> b!991271 m!919099))

(declare-fun m!919101 () Bool)

(assert (=> b!991271 m!919101))

(declare-fun m!919103 () Bool)

(assert (=> b!991271 m!919103))

(assert (=> b!991271 m!918925))

(assert (=> b!991271 m!919079))

(declare-fun m!919105 () Bool)

(assert (=> b!991271 m!919105))

(declare-fun m!919107 () Bool)

(assert (=> b!991271 m!919107))

(assert (=> b!991271 m!919099))

(declare-fun m!919109 () Bool)

(assert (=> b!991271 m!919109))

(declare-fun m!919111 () Bool)

(assert (=> b!991271 m!919111))

(declare-fun m!919113 () Bool)

(assert (=> b!991271 m!919113))

(assert (=> b!991271 m!919097))

(declare-fun m!919115 () Bool)

(assert (=> b!991271 m!919115))

(assert (=> b!991271 m!919089))

(assert (=> b!991277 m!919079))

(declare-fun m!919117 () Bool)

(assert (=> b!991277 m!919117))

(declare-fun m!919119 () Bool)

(assert (=> b!991277 m!919119))

(assert (=> b!991277 m!918927))

(declare-fun m!919121 () Bool)

(assert (=> b!991277 m!919121))

(assert (=> b!991277 m!918927))

(assert (=> b!991277 m!919119))

(assert (=> b!991277 m!919079))

(assert (=> b!991276 m!919079))

(assert (=> b!991276 m!919079))

(declare-fun m!919123 () Bool)

(assert (=> b!991276 m!919123))

(declare-fun m!919125 () Bool)

(assert (=> b!991270 m!919125))

(declare-fun m!919127 () Bool)

(assert (=> bm!42031 m!919127))

(declare-fun m!919129 () Bool)

(assert (=> b!991272 m!919129))

(declare-fun m!919131 () Bool)

(assert (=> bm!42027 m!919131))

(assert (=> b!991109 d!117883))

(declare-fun bm!42032 () Bool)

(declare-fun call!42035 () ListLongMap!13627)

(declare-fun call!42039 () ListLongMap!13627)

(assert (=> bm!42032 (= call!42035 call!42039)))

(declare-fun b!991286 () Bool)

(declare-fun e!559038 () Bool)

(assert (=> b!991286 (= e!559038 (validKeyInArray!0 (select (arr!30144 _keys!1544) from!1932)))))

(declare-fun b!991287 () Bool)

(declare-fun e!559039 () ListLongMap!13627)

(assert (=> b!991287 (= e!559039 call!42035)))

(declare-fun bm!42033 () Bool)

(declare-fun call!42041 () ListLongMap!13627)

(declare-fun call!42037 () ListLongMap!13627)

(assert (=> bm!42033 (= call!42041 call!42037)))

(declare-fun b!991288 () Bool)

(declare-fun e!559040 () ListLongMap!13627)

(assert (=> b!991288 (= e!559040 call!42041)))

(declare-fun c!100704 () Bool)

(declare-fun c!100706 () Bool)

(declare-fun call!42036 () ListLongMap!13627)

(declare-fun bm!42034 () Bool)

(assert (=> bm!42034 (= call!42037 (+!3117 (ite c!100704 call!42036 (ite c!100706 call!42039 call!42035)) (ite (or c!100704 c!100706) (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun b!991289 () Bool)

(declare-fun e!559030 () ListLongMap!13627)

(assert (=> b!991289 (= e!559030 e!559040)))

(assert (=> b!991289 (= c!100706 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!991290 () Bool)

(declare-fun e!559032 () Bool)

(declare-fun e!559035 () Bool)

(assert (=> b!991290 (= e!559032 e!559035)))

(declare-fun c!100703 () Bool)

(assert (=> b!991290 (= c!100703 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!991291 () Bool)

(declare-fun e!559029 () Bool)

(declare-fun lt!439782 () ListLongMap!13627)

(assert (=> b!991291 (= e!559029 (= (apply!906 lt!439782 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1220))))

(declare-fun b!991292 () Bool)

(declare-fun e!559031 () Unit!32849)

(declare-fun lt!439771 () Unit!32849)

(assert (=> b!991292 (= e!559031 lt!439771)))

(declare-fun lt!439780 () ListLongMap!13627)

(assert (=> b!991292 (= lt!439780 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!439774 () (_ BitVec 64))

(assert (=> b!991292 (= lt!439774 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439775 () (_ BitVec 64))

(assert (=> b!991292 (= lt!439775 (select (arr!30144 _keys!1544) from!1932))))

(declare-fun lt!439772 () Unit!32849)

(assert (=> b!991292 (= lt!439772 (addStillContains!616 lt!439780 lt!439774 zeroValue!1220 lt!439775))))

(assert (=> b!991292 (contains!5746 (+!3117 lt!439780 (tuple2!14929 lt!439774 zeroValue!1220)) lt!439775)))

(declare-fun lt!439779 () Unit!32849)

(assert (=> b!991292 (= lt!439779 lt!439772)))

(declare-fun lt!439770 () ListLongMap!13627)

(assert (=> b!991292 (= lt!439770 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!439765 () (_ BitVec 64))

(assert (=> b!991292 (= lt!439765 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439777 () (_ BitVec 64))

(assert (=> b!991292 (= lt!439777 (select (arr!30144 _keys!1544) from!1932))))

(declare-fun lt!439785 () Unit!32849)

(assert (=> b!991292 (= lt!439785 (addApplyDifferent!472 lt!439770 lt!439765 minValue!1220 lt!439777))))

(assert (=> b!991292 (= (apply!906 (+!3117 lt!439770 (tuple2!14929 lt!439765 minValue!1220)) lt!439777) (apply!906 lt!439770 lt!439777))))

(declare-fun lt!439781 () Unit!32849)

(assert (=> b!991292 (= lt!439781 lt!439785)))

(declare-fun lt!439766 () ListLongMap!13627)

(assert (=> b!991292 (= lt!439766 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!439767 () (_ BitVec 64))

(assert (=> b!991292 (= lt!439767 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439776 () (_ BitVec 64))

(assert (=> b!991292 (= lt!439776 (select (arr!30144 _keys!1544) from!1932))))

(declare-fun lt!439783 () Unit!32849)

(assert (=> b!991292 (= lt!439783 (addApplyDifferent!472 lt!439766 lt!439767 zeroValue!1220 lt!439776))))

(assert (=> b!991292 (= (apply!906 (+!3117 lt!439766 (tuple2!14929 lt!439767 zeroValue!1220)) lt!439776) (apply!906 lt!439766 lt!439776))))

(declare-fun lt!439768 () Unit!32849)

(assert (=> b!991292 (= lt!439768 lt!439783)))

(declare-fun lt!439778 () ListLongMap!13627)

(assert (=> b!991292 (= lt!439778 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!439769 () (_ BitVec 64))

(assert (=> b!991292 (= lt!439769 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439786 () (_ BitVec 64))

(assert (=> b!991292 (= lt!439786 (select (arr!30144 _keys!1544) from!1932))))

(assert (=> b!991292 (= lt!439771 (addApplyDifferent!472 lt!439778 lt!439769 minValue!1220 lt!439786))))

(assert (=> b!991292 (= (apply!906 (+!3117 lt!439778 (tuple2!14929 lt!439769 minValue!1220)) lt!439786) (apply!906 lt!439778 lt!439786))))

(declare-fun b!991293 () Bool)

(assert (=> b!991293 (= e!559030 (+!3117 call!42037 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun b!991294 () Bool)

(declare-fun e!559036 () Bool)

(assert (=> b!991294 (= e!559036 (= (apply!906 lt!439782 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1220))))

(declare-fun d!117885 () Bool)

(assert (=> d!117885 e!559032))

(declare-fun res!662590 () Bool)

(assert (=> d!117885 (=> (not res!662590) (not e!559032))))

(assert (=> d!117885 (= res!662590 (or (bvsge from!1932 (size!30624 _keys!1544)) (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30624 _keys!1544)))))))

(declare-fun lt!439773 () ListLongMap!13627)

(assert (=> d!117885 (= lt!439782 lt!439773)))

(declare-fun lt!439784 () Unit!32849)

(assert (=> d!117885 (= lt!439784 e!559031)))

(declare-fun c!100708 () Bool)

(assert (=> d!117885 (= c!100708 e!559038)))

(declare-fun res!662595 () Bool)

(assert (=> d!117885 (=> (not res!662595) (not e!559038))))

(assert (=> d!117885 (= res!662595 (bvslt from!1932 (size!30624 _keys!1544)))))

(assert (=> d!117885 (= lt!439773 e!559030)))

(assert (=> d!117885 (= c!100704 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!117885 (validMask!0 mask!1948)))

(assert (=> d!117885 (= (getCurrentListMap!3876 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) lt!439782)))

(declare-fun bm!42035 () Bool)

(declare-fun call!42038 () Bool)

(assert (=> bm!42035 (= call!42038 (contains!5746 lt!439782 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!42036 () Bool)

(assert (=> bm!42036 (= call!42039 call!42036)))

(declare-fun bm!42037 () Bool)

(assert (=> bm!42037 (= call!42036 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun b!991295 () Bool)

(assert (=> b!991295 (= e!559035 e!559036)))

(declare-fun res!662592 () Bool)

(declare-fun call!42040 () Bool)

(assert (=> b!991295 (= res!662592 call!42040)))

(assert (=> b!991295 (=> (not res!662592) (not e!559036))))

(declare-fun b!991296 () Bool)

(declare-fun res!662597 () Bool)

(assert (=> b!991296 (=> (not res!662597) (not e!559032))))

(declare-fun e!559034 () Bool)

(assert (=> b!991296 (= res!662597 e!559034)))

(declare-fun c!100707 () Bool)

(assert (=> b!991296 (= c!100707 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!991297 () Bool)

(declare-fun e!559041 () Bool)

(declare-fun e!559033 () Bool)

(assert (=> b!991297 (= e!559041 e!559033)))

(declare-fun res!662596 () Bool)

(assert (=> b!991297 (=> (not res!662596) (not e!559033))))

(assert (=> b!991297 (= res!662596 (contains!5746 lt!439782 (select (arr!30144 _keys!1544) from!1932)))))

(assert (=> b!991297 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30624 _keys!1544)))))

(declare-fun b!991298 () Bool)

(assert (=> b!991298 (= e!559033 (= (apply!906 lt!439782 (select (arr!30144 _keys!1544) from!1932)) (get!15672 (select (arr!30143 _values!1278) from!1932) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!991298 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30623 _values!1278)))))

(assert (=> b!991298 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30624 _keys!1544)))))

(declare-fun b!991299 () Bool)

(declare-fun c!100705 () Bool)

(assert (=> b!991299 (= c!100705 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!991299 (= e!559040 e!559039)))

(declare-fun bm!42038 () Bool)

(assert (=> bm!42038 (= call!42040 (contains!5746 lt!439782 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991300 () Bool)

(assert (=> b!991300 (= e!559035 (not call!42040))))

(declare-fun b!991301 () Bool)

(assert (=> b!991301 (= e!559034 e!559029)))

(declare-fun res!662594 () Bool)

(assert (=> b!991301 (= res!662594 call!42038)))

(assert (=> b!991301 (=> (not res!662594) (not e!559029))))

(declare-fun b!991302 () Bool)

(declare-fun e!559037 () Bool)

(assert (=> b!991302 (= e!559037 (validKeyInArray!0 (select (arr!30144 _keys!1544) from!1932)))))

(declare-fun b!991303 () Bool)

(declare-fun Unit!32852 () Unit!32849)

(assert (=> b!991303 (= e!559031 Unit!32852)))

(declare-fun b!991304 () Bool)

(declare-fun res!662593 () Bool)

(assert (=> b!991304 (=> (not res!662593) (not e!559032))))

(assert (=> b!991304 (= res!662593 e!559041)))

(declare-fun res!662591 () Bool)

(assert (=> b!991304 (=> res!662591 e!559041)))

(assert (=> b!991304 (= res!662591 (not e!559037))))

(declare-fun res!662598 () Bool)

(assert (=> b!991304 (=> (not res!662598) (not e!559037))))

(assert (=> b!991304 (= res!662598 (bvslt from!1932 (size!30624 _keys!1544)))))

(declare-fun b!991305 () Bool)

(assert (=> b!991305 (= e!559039 call!42041)))

(declare-fun b!991306 () Bool)

(assert (=> b!991306 (= e!559034 (not call!42038))))

(assert (= (and d!117885 c!100704) b!991293))

(assert (= (and d!117885 (not c!100704)) b!991289))

(assert (= (and b!991289 c!100706) b!991288))

(assert (= (and b!991289 (not c!100706)) b!991299))

(assert (= (and b!991299 c!100705) b!991305))

(assert (= (and b!991299 (not c!100705)) b!991287))

(assert (= (or b!991305 b!991287) bm!42032))

(assert (= (or b!991288 bm!42032) bm!42036))

(assert (= (or b!991288 b!991305) bm!42033))

(assert (= (or b!991293 bm!42036) bm!42037))

(assert (= (or b!991293 bm!42033) bm!42034))

(assert (= (and d!117885 res!662595) b!991286))

(assert (= (and d!117885 c!100708) b!991292))

(assert (= (and d!117885 (not c!100708)) b!991303))

(assert (= (and d!117885 res!662590) b!991304))

(assert (= (and b!991304 res!662598) b!991302))

(assert (= (and b!991304 (not res!662591)) b!991297))

(assert (= (and b!991297 res!662596) b!991298))

(assert (= (and b!991304 res!662593) b!991296))

(assert (= (and b!991296 c!100707) b!991301))

(assert (= (and b!991296 (not c!100707)) b!991306))

(assert (= (and b!991301 res!662594) b!991291))

(assert (= (or b!991301 b!991306) bm!42035))

(assert (= (and b!991296 res!662597) b!991290))

(assert (= (and b!991290 c!100703) b!991295))

(assert (= (and b!991290 (not c!100703)) b!991300))

(assert (= (and b!991295 res!662592) b!991294))

(assert (= (or b!991295 b!991300) bm!42038))

(declare-fun b_lambda!15181 () Bool)

(assert (=> (not b_lambda!15181) (not b!991298)))

(assert (=> b!991298 t!29800))

(declare-fun b_and!32249 () Bool)

(assert (= b_and!32247 (and (=> t!29800 result!13639) b_and!32249)))

(assert (=> b!991302 m!918897))

(assert (=> b!991302 m!918897))

(assert (=> b!991302 m!918919))

(assert (=> b!991286 m!918897))

(assert (=> b!991286 m!918897))

(assert (=> b!991286 m!918919))

(assert (=> d!117885 m!918931))

(declare-fun m!919133 () Bool)

(assert (=> b!991294 m!919133))

(declare-fun m!919135 () Bool)

(assert (=> bm!42035 m!919135))

(declare-fun m!919137 () Bool)

(assert (=> bm!42037 m!919137))

(declare-fun m!919139 () Bool)

(assert (=> b!991292 m!919139))

(declare-fun m!919141 () Bool)

(assert (=> b!991292 m!919141))

(declare-fun m!919143 () Bool)

(assert (=> b!991292 m!919143))

(assert (=> b!991292 m!919139))

(declare-fun m!919145 () Bool)

(assert (=> b!991292 m!919145))

(declare-fun m!919147 () Bool)

(assert (=> b!991292 m!919147))

(declare-fun m!919149 () Bool)

(assert (=> b!991292 m!919149))

(declare-fun m!919151 () Bool)

(assert (=> b!991292 m!919151))

(declare-fun m!919153 () Bool)

(assert (=> b!991292 m!919153))

(declare-fun m!919155 () Bool)

(assert (=> b!991292 m!919155))

(assert (=> b!991292 m!919137))

(assert (=> b!991292 m!918897))

(declare-fun m!919157 () Bool)

(assert (=> b!991292 m!919157))

(declare-fun m!919159 () Bool)

(assert (=> b!991292 m!919159))

(assert (=> b!991292 m!919151))

(declare-fun m!919161 () Bool)

(assert (=> b!991292 m!919161))

(declare-fun m!919163 () Bool)

(assert (=> b!991292 m!919163))

(declare-fun m!919165 () Bool)

(assert (=> b!991292 m!919165))

(assert (=> b!991292 m!919149))

(declare-fun m!919167 () Bool)

(assert (=> b!991292 m!919167))

(assert (=> b!991292 m!919141))

(assert (=> b!991298 m!918897))

(declare-fun m!919169 () Bool)

(assert (=> b!991298 m!919169))

(assert (=> b!991298 m!918923))

(assert (=> b!991298 m!918927))

(assert (=> b!991298 m!918929))

(assert (=> b!991298 m!918927))

(assert (=> b!991298 m!918923))

(assert (=> b!991298 m!918897))

(assert (=> b!991297 m!918897))

(assert (=> b!991297 m!918897))

(declare-fun m!919171 () Bool)

(assert (=> b!991297 m!919171))

(declare-fun m!919173 () Bool)

(assert (=> b!991291 m!919173))

(declare-fun m!919175 () Bool)

(assert (=> bm!42038 m!919175))

(declare-fun m!919177 () Bool)

(assert (=> b!991293 m!919177))

(declare-fun m!919179 () Bool)

(assert (=> bm!42034 m!919179))

(assert (=> b!991109 d!117885))

(declare-fun d!117887 () Bool)

(declare-fun e!559042 () Bool)

(assert (=> d!117887 e!559042))

(declare-fun res!662600 () Bool)

(assert (=> d!117887 (=> (not res!662600) (not e!559042))))

(declare-fun lt!439788 () ListLongMap!13627)

(assert (=> d!117887 (= res!662600 (contains!5746 lt!439788 (_1!7475 lt!439635)))))

(declare-fun lt!439787 () List!20836)

(assert (=> d!117887 (= lt!439788 (ListLongMap!13628 lt!439787))))

(declare-fun lt!439789 () Unit!32849)

(declare-fun lt!439790 () Unit!32849)

(assert (=> d!117887 (= lt!439789 lt!439790)))

(assert (=> d!117887 (= (getValueByKey!512 lt!439787 (_1!7475 lt!439635)) (Some!517 (_2!7475 lt!439635)))))

(assert (=> d!117887 (= lt!439790 (lemmaContainsTupThenGetReturnValue!274 lt!439787 (_1!7475 lt!439635) (_2!7475 lt!439635)))))

(assert (=> d!117887 (= lt!439787 (insertStrictlySorted!331 (toList!6829 (getCurrentListMap!3876 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7475 lt!439635) (_2!7475 lt!439635)))))

(assert (=> d!117887 (= (+!3117 (getCurrentListMap!3876 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!439635) lt!439788)))

(declare-fun b!991307 () Bool)

(declare-fun res!662599 () Bool)

(assert (=> b!991307 (=> (not res!662599) (not e!559042))))

(assert (=> b!991307 (= res!662599 (= (getValueByKey!512 (toList!6829 lt!439788) (_1!7475 lt!439635)) (Some!517 (_2!7475 lt!439635))))))

(declare-fun b!991308 () Bool)

(assert (=> b!991308 (= e!559042 (contains!5747 (toList!6829 lt!439788) lt!439635))))

(assert (= (and d!117887 res!662600) b!991307))

(assert (= (and b!991307 res!662599) b!991308))

(declare-fun m!919181 () Bool)

(assert (=> d!117887 m!919181))

(declare-fun m!919183 () Bool)

(assert (=> d!117887 m!919183))

(declare-fun m!919185 () Bool)

(assert (=> d!117887 m!919185))

(declare-fun m!919187 () Bool)

(assert (=> d!117887 m!919187))

(declare-fun m!919189 () Bool)

(assert (=> b!991307 m!919189))

(declare-fun m!919191 () Bool)

(assert (=> b!991308 m!919191))

(assert (=> b!991109 d!117887))

(declare-fun d!117889 () Bool)

(declare-fun e!559043 () Bool)

(assert (=> d!117889 e!559043))

(declare-fun res!662602 () Bool)

(assert (=> d!117889 (=> (not res!662602) (not e!559043))))

(declare-fun lt!439792 () ListLongMap!13627)

(assert (=> d!117889 (= res!662602 (contains!5746 lt!439792 (_1!7475 lt!439633)))))

(declare-fun lt!439791 () List!20836)

(assert (=> d!117889 (= lt!439792 (ListLongMap!13628 lt!439791))))

(declare-fun lt!439793 () Unit!32849)

(declare-fun lt!439794 () Unit!32849)

(assert (=> d!117889 (= lt!439793 lt!439794)))

(assert (=> d!117889 (= (getValueByKey!512 lt!439791 (_1!7475 lt!439633)) (Some!517 (_2!7475 lt!439633)))))

(assert (=> d!117889 (= lt!439794 (lemmaContainsTupThenGetReturnValue!274 lt!439791 (_1!7475 lt!439633) (_2!7475 lt!439633)))))

(assert (=> d!117889 (= lt!439791 (insertStrictlySorted!331 (toList!6829 (+!3117 lt!439632 lt!439635)) (_1!7475 lt!439633) (_2!7475 lt!439633)))))

(assert (=> d!117889 (= (+!3117 (+!3117 lt!439632 lt!439635) lt!439633) lt!439792)))

(declare-fun b!991309 () Bool)

(declare-fun res!662601 () Bool)

(assert (=> b!991309 (=> (not res!662601) (not e!559043))))

(assert (=> b!991309 (= res!662601 (= (getValueByKey!512 (toList!6829 lt!439792) (_1!7475 lt!439633)) (Some!517 (_2!7475 lt!439633))))))

(declare-fun b!991310 () Bool)

(assert (=> b!991310 (= e!559043 (contains!5747 (toList!6829 lt!439792) lt!439633))))

(assert (= (and d!117889 res!662602) b!991309))

(assert (= (and b!991309 res!662601) b!991310))

(declare-fun m!919193 () Bool)

(assert (=> d!117889 m!919193))

(declare-fun m!919195 () Bool)

(assert (=> d!117889 m!919195))

(declare-fun m!919197 () Bool)

(assert (=> d!117889 m!919197))

(declare-fun m!919199 () Bool)

(assert (=> d!117889 m!919199))

(declare-fun m!919201 () Bool)

(assert (=> b!991309 m!919201))

(declare-fun m!919203 () Bool)

(assert (=> b!991310 m!919203))

(assert (=> b!991109 d!117889))

(declare-fun d!117891 () Bool)

(declare-fun c!100711 () Bool)

(assert (=> d!117891 (= c!100711 ((_ is ValueCellFull!11165) (select (arr!30143 _values!1278) from!1932)))))

(declare-fun e!559046 () V!36041)

(assert (=> d!117891 (= (get!15672 (select (arr!30143 _values!1278) from!1932) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!559046)))

(declare-fun b!991315 () Bool)

(declare-fun get!15673 (ValueCell!11165 V!36041) V!36041)

(assert (=> b!991315 (= e!559046 (get!15673 (select (arr!30143 _values!1278) from!1932) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!991316 () Bool)

(declare-fun get!15674 (ValueCell!11165 V!36041) V!36041)

(assert (=> b!991316 (= e!559046 (get!15674 (select (arr!30143 _values!1278) from!1932) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117891 c!100711) b!991315))

(assert (= (and d!117891 (not c!100711)) b!991316))

(assert (=> b!991315 m!918923))

(assert (=> b!991315 m!918927))

(declare-fun m!919205 () Bool)

(assert (=> b!991315 m!919205))

(assert (=> b!991316 m!918923))

(assert (=> b!991316 m!918927))

(declare-fun m!919207 () Bool)

(assert (=> b!991316 m!919207))

(assert (=> b!991108 d!117891))

(declare-fun b!991342 () Bool)

(declare-fun e!559066 () Bool)

(assert (=> b!991342 (= e!559066 (validKeyInArray!0 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!991342 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))

(declare-fun b!991343 () Bool)

(declare-fun e!559064 () Bool)

(declare-fun lt!439811 () ListLongMap!13627)

(assert (=> b!991343 (= e!559064 (= lt!439811 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun b!991344 () Bool)

(declare-fun e!559065 () ListLongMap!13627)

(assert (=> b!991344 (= e!559065 (ListLongMap!13628 Nil!20833))))

(declare-fun b!991345 () Bool)

(declare-fun e!559062 () ListLongMap!13627)

(assert (=> b!991345 (= e!559065 e!559062)))

(declare-fun c!100721 () Bool)

(assert (=> b!991345 (= c!100721 (validKeyInArray!0 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun bm!42041 () Bool)

(declare-fun call!42044 () ListLongMap!13627)

(assert (=> bm!42041 (= call!42044 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!991346 () Bool)

(assert (=> b!991346 (= e!559062 call!42044)))

(declare-fun b!991347 () Bool)

(declare-fun isEmpty!732 (ListLongMap!13627) Bool)

(assert (=> b!991347 (= e!559064 (isEmpty!732 lt!439811))))

(declare-fun b!991348 () Bool)

(declare-fun e!559067 () Bool)

(declare-fun e!559063 () Bool)

(assert (=> b!991348 (= e!559067 e!559063)))

(declare-fun c!100720 () Bool)

(assert (=> b!991348 (= c!100720 e!559066)))

(declare-fun res!662613 () Bool)

(assert (=> b!991348 (=> (not res!662613) (not e!559066))))

(assert (=> b!991348 (= res!662613 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30624 _keys!1544)))))

(declare-fun b!991349 () Bool)

(declare-fun lt!439814 () Unit!32849)

(declare-fun lt!439810 () Unit!32849)

(assert (=> b!991349 (= lt!439814 lt!439810)))

(declare-fun lt!439815 () ListLongMap!13627)

(declare-fun lt!439813 () (_ BitVec 64))

(declare-fun lt!439809 () (_ BitVec 64))

(declare-fun lt!439812 () V!36041)

(assert (=> b!991349 (not (contains!5746 (+!3117 lt!439815 (tuple2!14929 lt!439809 lt!439812)) lt!439813))))

(declare-fun addStillNotContains!238 (ListLongMap!13627 (_ BitVec 64) V!36041 (_ BitVec 64)) Unit!32849)

(assert (=> b!991349 (= lt!439810 (addStillNotContains!238 lt!439815 lt!439809 lt!439812 lt!439813))))

(assert (=> b!991349 (= lt!439813 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!991349 (= lt!439812 (get!15672 (select (arr!30143 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!991349 (= lt!439809 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!991349 (= lt!439815 call!42044)))

(assert (=> b!991349 (= e!559062 (+!3117 call!42044 (tuple2!14929 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15672 (select (arr!30143 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!991350 () Bool)

(assert (=> b!991350 (= e!559063 e!559064)))

(declare-fun c!100723 () Bool)

(assert (=> b!991350 (= c!100723 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30624 _keys!1544)))))

(declare-fun b!991351 () Bool)

(declare-fun res!662614 () Bool)

(assert (=> b!991351 (=> (not res!662614) (not e!559067))))

(assert (=> b!991351 (= res!662614 (not (contains!5746 lt!439811 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!991352 () Bool)

(assert (=> b!991352 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30624 _keys!1544)))))

(assert (=> b!991352 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30623 _values!1278)))))

(declare-fun e!559061 () Bool)

(assert (=> b!991352 (= e!559061 (= (apply!906 lt!439811 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15672 (select (arr!30143 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!117893 () Bool)

(assert (=> d!117893 e!559067))

(declare-fun res!662611 () Bool)

(assert (=> d!117893 (=> (not res!662611) (not e!559067))))

(assert (=> d!117893 (= res!662611 (not (contains!5746 lt!439811 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117893 (= lt!439811 e!559065)))

(declare-fun c!100722 () Bool)

(assert (=> d!117893 (= c!100722 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30624 _keys!1544)))))

(assert (=> d!117893 (validMask!0 mask!1948)))

(assert (=> d!117893 (= (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!439811)))

(declare-fun b!991341 () Bool)

(assert (=> b!991341 (= e!559063 e!559061)))

(assert (=> b!991341 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30624 _keys!1544)))))

(declare-fun res!662612 () Bool)

(assert (=> b!991341 (= res!662612 (contains!5746 lt!439811 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!991341 (=> (not res!662612) (not e!559061))))

(assert (= (and d!117893 c!100722) b!991344))

(assert (= (and d!117893 (not c!100722)) b!991345))

(assert (= (and b!991345 c!100721) b!991349))

(assert (= (and b!991345 (not c!100721)) b!991346))

(assert (= (or b!991349 b!991346) bm!42041))

(assert (= (and d!117893 res!662611) b!991351))

(assert (= (and b!991351 res!662614) b!991348))

(assert (= (and b!991348 res!662613) b!991342))

(assert (= (and b!991348 c!100720) b!991341))

(assert (= (and b!991348 (not c!100720)) b!991350))

(assert (= (and b!991341 res!662612) b!991352))

(assert (= (and b!991350 c!100723) b!991343))

(assert (= (and b!991350 (not c!100723)) b!991347))

(declare-fun b_lambda!15183 () Bool)

(assert (=> (not b_lambda!15183) (not b!991349)))

(assert (=> b!991349 t!29800))

(declare-fun b_and!32251 () Bool)

(assert (= b_and!32249 (and (=> t!29800 result!13639) b_and!32251)))

(declare-fun b_lambda!15185 () Bool)

(assert (=> (not b_lambda!15185) (not b!991352)))

(assert (=> b!991352 t!29800))

(declare-fun b_and!32253 () Bool)

(assert (= b_and!32251 (and (=> t!29800 result!13639) b_and!32253)))

(declare-fun m!919209 () Bool)

(assert (=> bm!42041 m!919209))

(assert (=> b!991342 m!919079))

(assert (=> b!991342 m!919079))

(assert (=> b!991342 m!919081))

(declare-fun m!919211 () Bool)

(assert (=> b!991351 m!919211))

(assert (=> b!991343 m!919209))

(declare-fun m!919213 () Bool)

(assert (=> b!991347 m!919213))

(assert (=> b!991349 m!919119))

(assert (=> b!991349 m!918927))

(assert (=> b!991349 m!919121))

(assert (=> b!991349 m!918927))

(assert (=> b!991349 m!919119))

(declare-fun m!919215 () Bool)

(assert (=> b!991349 m!919215))

(declare-fun m!919217 () Bool)

(assert (=> b!991349 m!919217))

(assert (=> b!991349 m!919079))

(declare-fun m!919219 () Bool)

(assert (=> b!991349 m!919219))

(declare-fun m!919221 () Bool)

(assert (=> b!991349 m!919221))

(assert (=> b!991349 m!919219))

(assert (=> b!991352 m!919119))

(assert (=> b!991352 m!918927))

(assert (=> b!991352 m!919121))

(assert (=> b!991352 m!918927))

(assert (=> b!991352 m!919119))

(assert (=> b!991352 m!919079))

(declare-fun m!919223 () Bool)

(assert (=> b!991352 m!919223))

(assert (=> b!991352 m!919079))

(declare-fun m!919225 () Bool)

(assert (=> d!117893 m!919225))

(assert (=> d!117893 m!918931))

(assert (=> b!991341 m!919079))

(assert (=> b!991341 m!919079))

(declare-fun m!919227 () Bool)

(assert (=> b!991341 m!919227))

(assert (=> b!991345 m!919079))

(assert (=> b!991345 m!919079))

(assert (=> b!991345 m!919081))

(assert (=> b!991108 d!117893))

(declare-fun mapNonEmpty!36997 () Bool)

(declare-fun mapRes!36997 () Bool)

(declare-fun tp!70042 () Bool)

(declare-fun e!559072 () Bool)

(assert (=> mapNonEmpty!36997 (= mapRes!36997 (and tp!70042 e!559072))))

(declare-fun mapValue!36997 () ValueCell!11165)

(declare-fun mapRest!36997 () (Array (_ BitVec 32) ValueCell!11165))

(declare-fun mapKey!36997 () (_ BitVec 32))

(assert (=> mapNonEmpty!36997 (= mapRest!36988 (store mapRest!36997 mapKey!36997 mapValue!36997))))

(declare-fun b!991359 () Bool)

(assert (=> b!991359 (= e!559072 tp_is_empty!23293)))

(declare-fun b!991360 () Bool)

(declare-fun e!559073 () Bool)

(assert (=> b!991360 (= e!559073 tp_is_empty!23293)))

(declare-fun condMapEmpty!36997 () Bool)

(declare-fun mapDefault!36997 () ValueCell!11165)

(assert (=> mapNonEmpty!36988 (= condMapEmpty!36997 (= mapRest!36988 ((as const (Array (_ BitVec 32) ValueCell!11165)) mapDefault!36997)))))

(assert (=> mapNonEmpty!36988 (= tp!70027 (and e!559073 mapRes!36997))))

(declare-fun mapIsEmpty!36997 () Bool)

(assert (=> mapIsEmpty!36997 mapRes!36997))

(assert (= (and mapNonEmpty!36988 condMapEmpty!36997) mapIsEmpty!36997))

(assert (= (and mapNonEmpty!36988 (not condMapEmpty!36997)) mapNonEmpty!36997))

(assert (= (and mapNonEmpty!36997 ((_ is ValueCellFull!11165) mapValue!36997)) b!991359))

(assert (= (and mapNonEmpty!36988 ((_ is ValueCellFull!11165) mapDefault!36997)) b!991360))

(declare-fun m!919229 () Bool)

(assert (=> mapNonEmpty!36997 m!919229))

(declare-fun b_lambda!15187 () Bool)

(assert (= b_lambda!15185 (or (and start!84834 b_free!20077) b_lambda!15187)))

(declare-fun b_lambda!15189 () Bool)

(assert (= b_lambda!15181 (or (and start!84834 b_free!20077) b_lambda!15189)))

(declare-fun b_lambda!15191 () Bool)

(assert (= b_lambda!15183 (or (and start!84834 b_free!20077) b_lambda!15191)))

(declare-fun b_lambda!15193 () Bool)

(assert (= b_lambda!15179 (or (and start!84834 b_free!20077) b_lambda!15193)))

(check-sat (not b!991220) (not b!991315) (not bm!42028) (not d!117879) (not bm!42034) (not b!991310) (not b!991277) (not d!117889) (not b_lambda!15187) (not b!991265) (not b!991309) (not b!991273) (not b!991195) (not b!991276) (not b!991270) (not b!991351) (not b_lambda!15191) (not d!117885) (not b!991316) (not b!991281) (not bm!42035) (not b!991342) (not b!991298) (not d!117893) (not d!117875) (not b!991307) (not mapNonEmpty!36997) (not b!991291) (not bm!42041) (not b!991343) b_and!32253 (not b!991271) (not d!117887) (not b!991345) (not b!991209) (not bm!42007) (not bm!42030) (not b!991219) (not b!991218) (not b!991297) (not bm!42037) (not b!991212) (not bm!42031) (not bm!42027) (not b!991308) (not b!991194) (not d!117877) (not b_lambda!15189) tp_is_empty!23293 (not b!991341) (not b!991352) (not b!991347) (not b!991293) (not b!991292) (not b_next!20077) (not b!991302) (not b!991294) (not d!117883) (not b!991286) (not bm!42010) (not b!991272) (not b!991222) (not b_lambda!15193) (not d!117881) (not b!991210) (not bm!42038) (not b!991217) (not b_lambda!15177) (not b!991221) (not b!991349))
(check-sat b_and!32253 (not b_next!20077))
(get-model)

(declare-fun d!117895 () Bool)

(declare-fun e!559074 () Bool)

(assert (=> d!117895 e!559074))

(declare-fun res!662616 () Bool)

(assert (=> d!117895 (=> (not res!662616) (not e!559074))))

(declare-fun lt!439817 () ListLongMap!13627)

(assert (=> d!117895 (= res!662616 (contains!5746 lt!439817 (_1!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!439816 () List!20836)

(assert (=> d!117895 (= lt!439817 (ListLongMap!13628 lt!439816))))

(declare-fun lt!439818 () Unit!32849)

(declare-fun lt!439819 () Unit!32849)

(assert (=> d!117895 (= lt!439818 lt!439819)))

(assert (=> d!117895 (= (getValueByKey!512 lt!439816 (_1!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!517 (_2!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117895 (= lt!439819 (lemmaContainsTupThenGetReturnValue!274 lt!439816 (_1!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117895 (= lt!439816 (insertStrictlySorted!331 (toList!6829 call!42037) (_1!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117895 (= (+!3117 call!42037 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!439817)))

(declare-fun b!991361 () Bool)

(declare-fun res!662615 () Bool)

(assert (=> b!991361 (=> (not res!662615) (not e!559074))))

(assert (=> b!991361 (= res!662615 (= (getValueByKey!512 (toList!6829 lt!439817) (_1!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!517 (_2!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!991362 () Bool)

(assert (=> b!991362 (= e!559074 (contains!5747 (toList!6829 lt!439817) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117895 res!662616) b!991361))

(assert (= (and b!991361 res!662615) b!991362))

(declare-fun m!919231 () Bool)

(assert (=> d!117895 m!919231))

(declare-fun m!919233 () Bool)

(assert (=> d!117895 m!919233))

(declare-fun m!919235 () Bool)

(assert (=> d!117895 m!919235))

(declare-fun m!919237 () Bool)

(assert (=> d!117895 m!919237))

(declare-fun m!919239 () Bool)

(assert (=> b!991361 m!919239))

(declare-fun m!919241 () Bool)

(assert (=> b!991362 m!919241))

(assert (=> b!991293 d!117895))

(declare-fun d!117897 () Bool)

(declare-fun lt!439822 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!422 (List!20836) (InoxSet tuple2!14928))

(assert (=> d!117897 (= lt!439822 (select (content!422 (toList!6829 lt!439696)) lt!439635))))

(declare-fun e!559079 () Bool)

(assert (=> d!117897 (= lt!439822 e!559079)))

(declare-fun res!662621 () Bool)

(assert (=> d!117897 (=> (not res!662621) (not e!559079))))

(assert (=> d!117897 (= res!662621 ((_ is Cons!20832) (toList!6829 lt!439696)))))

(assert (=> d!117897 (= (contains!5747 (toList!6829 lt!439696) lt!439635) lt!439822)))

(declare-fun b!991367 () Bool)

(declare-fun e!559080 () Bool)

(assert (=> b!991367 (= e!559079 e!559080)))

(declare-fun res!662622 () Bool)

(assert (=> b!991367 (=> res!662622 e!559080)))

(assert (=> b!991367 (= res!662622 (= (h!22000 (toList!6829 lt!439696)) lt!439635))))

(declare-fun b!991368 () Bool)

(assert (=> b!991368 (= e!559080 (contains!5747 (t!29801 (toList!6829 lt!439696)) lt!439635))))

(assert (= (and d!117897 res!662621) b!991367))

(assert (= (and b!991367 (not res!662622)) b!991368))

(declare-fun m!919243 () Bool)

(assert (=> d!117897 m!919243))

(declare-fun m!919245 () Bool)

(assert (=> d!117897 m!919245))

(declare-fun m!919247 () Bool)

(assert (=> b!991368 m!919247))

(assert (=> b!991222 d!117897))

(declare-fun d!117899 () Bool)

(declare-fun get!15675 (Option!518) V!36041)

(assert (=> d!117899 (= (apply!906 lt!439782 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15675 (getValueByKey!512 (toList!6829 lt!439782) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28133 () Bool)

(assert (= bs!28133 d!117899))

(declare-fun m!919249 () Bool)

(assert (=> bs!28133 m!919249))

(assert (=> bs!28133 m!919249))

(declare-fun m!919251 () Bool)

(assert (=> bs!28133 m!919251))

(assert (=> b!991291 d!117899))

(declare-fun d!117901 () Bool)

(assert (=> d!117901 (= (validKeyInArray!0 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (and (not (= (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!991281 d!117901))

(declare-fun d!117903 () Bool)

(declare-fun lt!439823 () Bool)

(assert (=> d!117903 (= lt!439823 (select (content!422 (toList!6829 lt!439692)) lt!439633))))

(declare-fun e!559081 () Bool)

(assert (=> d!117903 (= lt!439823 e!559081)))

(declare-fun res!662623 () Bool)

(assert (=> d!117903 (=> (not res!662623) (not e!559081))))

(assert (=> d!117903 (= res!662623 ((_ is Cons!20832) (toList!6829 lt!439692)))))

(assert (=> d!117903 (= (contains!5747 (toList!6829 lt!439692) lt!439633) lt!439823)))

(declare-fun b!991369 () Bool)

(declare-fun e!559082 () Bool)

(assert (=> b!991369 (= e!559081 e!559082)))

(declare-fun res!662624 () Bool)

(assert (=> b!991369 (=> res!662624 e!559082)))

(assert (=> b!991369 (= res!662624 (= (h!22000 (toList!6829 lt!439692)) lt!439633))))

(declare-fun b!991370 () Bool)

(assert (=> b!991370 (= e!559082 (contains!5747 (t!29801 (toList!6829 lt!439692)) lt!439633))))

(assert (= (and d!117903 res!662623) b!991369))

(assert (= (and b!991369 (not res!662624)) b!991370))

(declare-fun m!919253 () Bool)

(assert (=> d!117903 m!919253))

(declare-fun m!919255 () Bool)

(assert (=> d!117903 m!919255))

(declare-fun m!919257 () Bool)

(assert (=> b!991370 m!919257))

(assert (=> b!991220 d!117903))

(declare-fun d!117905 () Bool)

(declare-fun lt!439826 () Bool)

(declare-fun content!423 (List!20837) (InoxSet (_ BitVec 64)))

(assert (=> d!117905 (= lt!439826 (select (content!423 Nil!20834) (select (arr!30144 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun e!559087 () Bool)

(assert (=> d!117905 (= lt!439826 e!559087)))

(declare-fun res!662630 () Bool)

(assert (=> d!117905 (=> (not res!662630) (not e!559087))))

(assert (=> d!117905 (= res!662630 ((_ is Cons!20833) Nil!20834))))

(assert (=> d!117905 (= (contains!5745 Nil!20834 (select (arr!30144 _keys!1544) #b00000000000000000000000000000000)) lt!439826)))

(declare-fun b!991375 () Bool)

(declare-fun e!559088 () Bool)

(assert (=> b!991375 (= e!559087 e!559088)))

(declare-fun res!662629 () Bool)

(assert (=> b!991375 (=> res!662629 e!559088)))

(assert (=> b!991375 (= res!662629 (= (h!22001 Nil!20834) (select (arr!30144 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!991376 () Bool)

(assert (=> b!991376 (= e!559088 (contains!5745 (t!29802 Nil!20834) (select (arr!30144 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!117905 res!662630) b!991375))

(assert (= (and b!991375 (not res!662629)) b!991376))

(declare-fun m!919259 () Bool)

(assert (=> d!117905 m!919259))

(assert (=> d!117905 m!919017))

(declare-fun m!919261 () Bool)

(assert (=> d!117905 m!919261))

(assert (=> b!991376 m!919017))

(declare-fun m!919263 () Bool)

(assert (=> b!991376 m!919263))

(assert (=> b!991210 d!117905))

(declare-fun d!117907 () Bool)

(declare-fun lt!439827 () Bool)

(assert (=> d!117907 (= lt!439827 (select (content!422 (toList!6829 lt!439792)) lt!439633))))

(declare-fun e!559089 () Bool)

(assert (=> d!117907 (= lt!439827 e!559089)))

(declare-fun res!662631 () Bool)

(assert (=> d!117907 (=> (not res!662631) (not e!559089))))

(assert (=> d!117907 (= res!662631 ((_ is Cons!20832) (toList!6829 lt!439792)))))

(assert (=> d!117907 (= (contains!5747 (toList!6829 lt!439792) lt!439633) lt!439827)))

(declare-fun b!991377 () Bool)

(declare-fun e!559090 () Bool)

(assert (=> b!991377 (= e!559089 e!559090)))

(declare-fun res!662632 () Bool)

(assert (=> b!991377 (=> res!662632 e!559090)))

(assert (=> b!991377 (= res!662632 (= (h!22000 (toList!6829 lt!439792)) lt!439633))))

(declare-fun b!991378 () Bool)

(assert (=> b!991378 (= e!559090 (contains!5747 (t!29801 (toList!6829 lt!439792)) lt!439633))))

(assert (= (and d!117907 res!662631) b!991377))

(assert (= (and b!991377 (not res!662632)) b!991378))

(declare-fun m!919265 () Bool)

(assert (=> d!117907 m!919265))

(declare-fun m!919267 () Bool)

(assert (=> d!117907 m!919267))

(declare-fun m!919269 () Bool)

(assert (=> b!991378 m!919269))

(assert (=> b!991310 d!117907))

(declare-fun d!117909 () Bool)

(declare-fun lt!439828 () Bool)

(assert (=> d!117909 (= lt!439828 (select (content!422 (toList!6829 lt!439788)) lt!439635))))

(declare-fun e!559091 () Bool)

(assert (=> d!117909 (= lt!439828 e!559091)))

(declare-fun res!662633 () Bool)

(assert (=> d!117909 (=> (not res!662633) (not e!559091))))

(assert (=> d!117909 (= res!662633 ((_ is Cons!20832) (toList!6829 lt!439788)))))

(assert (=> d!117909 (= (contains!5747 (toList!6829 lt!439788) lt!439635) lt!439828)))

(declare-fun b!991379 () Bool)

(declare-fun e!559092 () Bool)

(assert (=> b!991379 (= e!559091 e!559092)))

(declare-fun res!662634 () Bool)

(assert (=> b!991379 (=> res!662634 e!559092)))

(assert (=> b!991379 (= res!662634 (= (h!22000 (toList!6829 lt!439788)) lt!439635))))

(declare-fun b!991380 () Bool)

(assert (=> b!991380 (= e!559092 (contains!5747 (t!29801 (toList!6829 lt!439788)) lt!439635))))

(assert (= (and d!117909 res!662633) b!991379))

(assert (= (and b!991379 (not res!662634)) b!991380))

(declare-fun m!919271 () Bool)

(assert (=> d!117909 m!919271))

(declare-fun m!919273 () Bool)

(assert (=> d!117909 m!919273))

(declare-fun m!919275 () Bool)

(assert (=> b!991380 m!919275))

(assert (=> b!991308 d!117909))

(assert (=> b!991345 d!117901))

(declare-fun d!117911 () Bool)

(declare-fun lt!439829 () Bool)

(assert (=> d!117911 (= lt!439829 (select (content!422 (toList!6829 lt!439685)) lt!439635))))

(declare-fun e!559093 () Bool)

(assert (=> d!117911 (= lt!439829 e!559093)))

(declare-fun res!662635 () Bool)

(assert (=> d!117911 (=> (not res!662635) (not e!559093))))

(assert (=> d!117911 (= res!662635 ((_ is Cons!20832) (toList!6829 lt!439685)))))

(assert (=> d!117911 (= (contains!5747 (toList!6829 lt!439685) lt!439635) lt!439829)))

(declare-fun b!991381 () Bool)

(declare-fun e!559094 () Bool)

(assert (=> b!991381 (= e!559093 e!559094)))

(declare-fun res!662636 () Bool)

(assert (=> b!991381 (=> res!662636 e!559094)))

(assert (=> b!991381 (= res!662636 (= (h!22000 (toList!6829 lt!439685)) lt!439635))))

(declare-fun b!991382 () Bool)

(assert (=> b!991382 (= e!559094 (contains!5747 (t!29801 (toList!6829 lt!439685)) lt!439635))))

(assert (= (and d!117911 res!662635) b!991381))

(assert (= (and b!991381 (not res!662636)) b!991382))

(declare-fun m!919277 () Bool)

(assert (=> d!117911 m!919277))

(declare-fun m!919279 () Bool)

(assert (=> d!117911 m!919279))

(declare-fun m!919281 () Bool)

(assert (=> b!991382 m!919281))

(assert (=> b!991218 d!117911))

(declare-fun b!991384 () Bool)

(declare-fun e!559100 () Bool)

(assert (=> b!991384 (= e!559100 (validKeyInArray!0 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(assert (=> b!991384 (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun lt!439832 () ListLongMap!13627)

(declare-fun e!559098 () Bool)

(declare-fun b!991385 () Bool)

(assert (=> b!991385 (= e!559098 (= lt!439832 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun b!991386 () Bool)

(declare-fun e!559099 () ListLongMap!13627)

(assert (=> b!991386 (= e!559099 (ListLongMap!13628 Nil!20833))))

(declare-fun b!991387 () Bool)

(declare-fun e!559096 () ListLongMap!13627)

(assert (=> b!991387 (= e!559099 e!559096)))

(declare-fun c!100725 () Bool)

(assert (=> b!991387 (= c!100725 (validKeyInArray!0 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(declare-fun bm!42042 () Bool)

(declare-fun call!42045 () ListLongMap!13627)

(assert (=> bm!42042 (= call!42045 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!991388 () Bool)

(assert (=> b!991388 (= e!559096 call!42045)))

(declare-fun b!991389 () Bool)

(assert (=> b!991389 (= e!559098 (isEmpty!732 lt!439832))))

(declare-fun b!991390 () Bool)

(declare-fun e!559101 () Bool)

(declare-fun e!559097 () Bool)

(assert (=> b!991390 (= e!559101 e!559097)))

(declare-fun c!100724 () Bool)

(assert (=> b!991390 (= c!100724 e!559100)))

(declare-fun res!662639 () Bool)

(assert (=> b!991390 (=> (not res!662639) (not e!559100))))

(assert (=> b!991390 (= res!662639 (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30624 _keys!1544)))))

(declare-fun b!991391 () Bool)

(declare-fun lt!439835 () Unit!32849)

(declare-fun lt!439831 () Unit!32849)

(assert (=> b!991391 (= lt!439835 lt!439831)))

(declare-fun lt!439830 () (_ BitVec 64))

(declare-fun lt!439833 () V!36041)

(declare-fun lt!439834 () (_ BitVec 64))

(declare-fun lt!439836 () ListLongMap!13627)

(assert (=> b!991391 (not (contains!5746 (+!3117 lt!439836 (tuple2!14929 lt!439830 lt!439833)) lt!439834))))

(assert (=> b!991391 (= lt!439831 (addStillNotContains!238 lt!439836 lt!439830 lt!439833 lt!439834))))

(assert (=> b!991391 (= lt!439834 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!991391 (= lt!439833 (get!15672 (select (arr!30143 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!991391 (= lt!439830 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)))))

(assert (=> b!991391 (= lt!439836 call!42045)))

(assert (=> b!991391 (= e!559096 (+!3117 call!42045 (tuple2!14929 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (get!15672 (select (arr!30143 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!991392 () Bool)

(assert (=> b!991392 (= e!559097 e!559098)))

(declare-fun c!100727 () Bool)

(assert (=> b!991392 (= c!100727 (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30624 _keys!1544)))))

(declare-fun b!991393 () Bool)

(declare-fun res!662640 () Bool)

(assert (=> b!991393 (=> (not res!662640) (not e!559101))))

(assert (=> b!991393 (= res!662640 (not (contains!5746 lt!439832 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!991394 () Bool)

(assert (=> b!991394 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30624 _keys!1544)))))

(assert (=> b!991394 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30623 _values!1278)))))

(declare-fun e!559095 () Bool)

(assert (=> b!991394 (= e!559095 (= (apply!906 lt!439832 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))) (get!15672 (select (arr!30143 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!117913 () Bool)

(assert (=> d!117913 e!559101))

(declare-fun res!662637 () Bool)

(assert (=> d!117913 (=> (not res!662637) (not e!559101))))

(assert (=> d!117913 (= res!662637 (not (contains!5746 lt!439832 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117913 (= lt!439832 e!559099)))

(declare-fun c!100726 () Bool)

(assert (=> d!117913 (= c!100726 (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30624 _keys!1544)))))

(assert (=> d!117913 (validMask!0 mask!1948)))

(assert (=> d!117913 (= (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281) lt!439832)))

(declare-fun b!991383 () Bool)

(assert (=> b!991383 (= e!559097 e!559095)))

(assert (=> b!991383 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30624 _keys!1544)))))

(declare-fun res!662638 () Bool)

(assert (=> b!991383 (= res!662638 (contains!5746 lt!439832 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(assert (=> b!991383 (=> (not res!662638) (not e!559095))))

(assert (= (and d!117913 c!100726) b!991386))

(assert (= (and d!117913 (not c!100726)) b!991387))

(assert (= (and b!991387 c!100725) b!991391))

(assert (= (and b!991387 (not c!100725)) b!991388))

(assert (= (or b!991391 b!991388) bm!42042))

(assert (= (and d!117913 res!662637) b!991393))

(assert (= (and b!991393 res!662640) b!991390))

(assert (= (and b!991390 res!662639) b!991384))

(assert (= (and b!991390 c!100724) b!991383))

(assert (= (and b!991390 (not c!100724)) b!991392))

(assert (= (and b!991383 res!662638) b!991394))

(assert (= (and b!991392 c!100727) b!991385))

(assert (= (and b!991392 (not c!100727)) b!991389))

(declare-fun b_lambda!15195 () Bool)

(assert (=> (not b_lambda!15195) (not b!991391)))

(assert (=> b!991391 t!29800))

(declare-fun b_and!32255 () Bool)

(assert (= b_and!32253 (and (=> t!29800 result!13639) b_and!32255)))

(declare-fun b_lambda!15197 () Bool)

(assert (=> (not b_lambda!15197) (not b!991394)))

(assert (=> b!991394 t!29800))

(declare-fun b_and!32257 () Bool)

(assert (= b_and!32255 (and (=> t!29800 result!13639) b_and!32257)))

(declare-fun m!919283 () Bool)

(assert (=> bm!42042 m!919283))

(declare-fun m!919285 () Bool)

(assert (=> b!991384 m!919285))

(assert (=> b!991384 m!919285))

(declare-fun m!919287 () Bool)

(assert (=> b!991384 m!919287))

(declare-fun m!919289 () Bool)

(assert (=> b!991393 m!919289))

(assert (=> b!991385 m!919283))

(declare-fun m!919291 () Bool)

(assert (=> b!991389 m!919291))

(declare-fun m!919293 () Bool)

(assert (=> b!991391 m!919293))

(assert (=> b!991391 m!918927))

(declare-fun m!919295 () Bool)

(assert (=> b!991391 m!919295))

(assert (=> b!991391 m!918927))

(assert (=> b!991391 m!919293))

(declare-fun m!919297 () Bool)

(assert (=> b!991391 m!919297))

(declare-fun m!919299 () Bool)

(assert (=> b!991391 m!919299))

(assert (=> b!991391 m!919285))

(declare-fun m!919301 () Bool)

(assert (=> b!991391 m!919301))

(declare-fun m!919303 () Bool)

(assert (=> b!991391 m!919303))

(assert (=> b!991391 m!919301))

(assert (=> b!991394 m!919293))

(assert (=> b!991394 m!918927))

(assert (=> b!991394 m!919295))

(assert (=> b!991394 m!918927))

(assert (=> b!991394 m!919293))

(assert (=> b!991394 m!919285))

(declare-fun m!919305 () Bool)

(assert (=> b!991394 m!919305))

(assert (=> b!991394 m!919285))

(declare-fun m!919307 () Bool)

(assert (=> d!117913 m!919307))

(assert (=> d!117913 m!918931))

(assert (=> b!991383 m!919285))

(assert (=> b!991383 m!919285))

(declare-fun m!919309 () Bool)

(assert (=> b!991383 m!919309))

(assert (=> b!991387 m!919285))

(assert (=> b!991387 m!919285))

(assert (=> b!991387 m!919287))

(assert (=> b!991343 d!117913))

(assert (=> b!991302 d!117863))

(declare-fun d!117915 () Bool)

(declare-fun e!559106 () Bool)

(assert (=> d!117915 e!559106))

(declare-fun res!662643 () Bool)

(assert (=> d!117915 (=> res!662643 e!559106)))

(declare-fun lt!439845 () Bool)

(assert (=> d!117915 (= res!662643 (not lt!439845))))

(declare-fun lt!439848 () Bool)

(assert (=> d!117915 (= lt!439845 lt!439848)))

(declare-fun lt!439847 () Unit!32849)

(declare-fun e!559107 () Unit!32849)

(assert (=> d!117915 (= lt!439847 e!559107)))

(declare-fun c!100730 () Bool)

(assert (=> d!117915 (= c!100730 lt!439848)))

(declare-fun containsKey!481 (List!20836 (_ BitVec 64)) Bool)

(assert (=> d!117915 (= lt!439848 (containsKey!481 (toList!6829 lt!439811) (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> d!117915 (= (contains!5746 lt!439811 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) lt!439845)))

(declare-fun b!991401 () Bool)

(declare-fun lt!439846 () Unit!32849)

(assert (=> b!991401 (= e!559107 lt!439846)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!375 (List!20836 (_ BitVec 64)) Unit!32849)

(assert (=> b!991401 (= lt!439846 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6829 lt!439811) (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun isDefined!383 (Option!518) Bool)

(assert (=> b!991401 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439811) (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!991402 () Bool)

(declare-fun Unit!32853 () Unit!32849)

(assert (=> b!991402 (= e!559107 Unit!32853)))

(declare-fun b!991403 () Bool)

(assert (=> b!991403 (= e!559106 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439811) (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(assert (= (and d!117915 c!100730) b!991401))

(assert (= (and d!117915 (not c!100730)) b!991402))

(assert (= (and d!117915 (not res!662643)) b!991403))

(assert (=> d!117915 m!919079))

(declare-fun m!919311 () Bool)

(assert (=> d!117915 m!919311))

(assert (=> b!991401 m!919079))

(declare-fun m!919313 () Bool)

(assert (=> b!991401 m!919313))

(assert (=> b!991401 m!919079))

(declare-fun m!919315 () Bool)

(assert (=> b!991401 m!919315))

(assert (=> b!991401 m!919315))

(declare-fun m!919317 () Bool)

(assert (=> b!991401 m!919317))

(assert (=> b!991403 m!919079))

(assert (=> b!991403 m!919315))

(assert (=> b!991403 m!919315))

(assert (=> b!991403 m!919317))

(assert (=> b!991341 d!117915))

(declare-fun d!117917 () Bool)

(declare-fun e!559108 () Bool)

(assert (=> d!117917 e!559108))

(declare-fun res!662644 () Bool)

(assert (=> d!117917 (=> res!662644 e!559108)))

(declare-fun lt!439849 () Bool)

(assert (=> d!117917 (= res!662644 (not lt!439849))))

(declare-fun lt!439852 () Bool)

(assert (=> d!117917 (= lt!439849 lt!439852)))

(declare-fun lt!439851 () Unit!32849)

(declare-fun e!559109 () Unit!32849)

(assert (=> d!117917 (= lt!439851 e!559109)))

(declare-fun c!100731 () Bool)

(assert (=> d!117917 (= c!100731 lt!439852)))

(assert (=> d!117917 (= lt!439852 (containsKey!481 (toList!6829 lt!439760) (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> d!117917 (= (contains!5746 lt!439760 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) lt!439849)))

(declare-fun b!991404 () Bool)

(declare-fun lt!439850 () Unit!32849)

(assert (=> b!991404 (= e!559109 lt!439850)))

(assert (=> b!991404 (= lt!439850 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6829 lt!439760) (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!991404 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439760) (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!991405 () Bool)

(declare-fun Unit!32854 () Unit!32849)

(assert (=> b!991405 (= e!559109 Unit!32854)))

(declare-fun b!991406 () Bool)

(assert (=> b!991406 (= e!559108 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439760) (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(assert (= (and d!117917 c!100731) b!991404))

(assert (= (and d!117917 (not c!100731)) b!991405))

(assert (= (and d!117917 (not res!662644)) b!991406))

(assert (=> d!117917 m!919079))

(declare-fun m!919319 () Bool)

(assert (=> d!117917 m!919319))

(assert (=> b!991404 m!919079))

(declare-fun m!919321 () Bool)

(assert (=> b!991404 m!919321))

(assert (=> b!991404 m!919079))

(declare-fun m!919323 () Bool)

(assert (=> b!991404 m!919323))

(assert (=> b!991404 m!919323))

(declare-fun m!919325 () Bool)

(assert (=> b!991404 m!919325))

(assert (=> b!991406 m!919079))

(assert (=> b!991406 m!919323))

(assert (=> b!991406 m!919323))

(assert (=> b!991406 m!919325))

(assert (=> b!991276 d!117917))

(declare-fun d!117919 () Bool)

(declare-fun e!559110 () Bool)

(assert (=> d!117919 e!559110))

(declare-fun res!662645 () Bool)

(assert (=> d!117919 (=> res!662645 e!559110)))

(declare-fun lt!439853 () Bool)

(assert (=> d!117919 (= res!662645 (not lt!439853))))

(declare-fun lt!439856 () Bool)

(assert (=> d!117919 (= lt!439853 lt!439856)))

(declare-fun lt!439855 () Unit!32849)

(declare-fun e!559111 () Unit!32849)

(assert (=> d!117919 (= lt!439855 e!559111)))

(declare-fun c!100732 () Bool)

(assert (=> d!117919 (= c!100732 lt!439856)))

(assert (=> d!117919 (= lt!439856 (containsKey!481 (toList!6829 lt!439811) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117919 (= (contains!5746 lt!439811 #b0000000000000000000000000000000000000000000000000000000000000000) lt!439853)))

(declare-fun b!991407 () Bool)

(declare-fun lt!439854 () Unit!32849)

(assert (=> b!991407 (= e!559111 lt!439854)))

(assert (=> b!991407 (= lt!439854 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6829 lt!439811) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!991407 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439811) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991408 () Bool)

(declare-fun Unit!32855 () Unit!32849)

(assert (=> b!991408 (= e!559111 Unit!32855)))

(declare-fun b!991409 () Bool)

(assert (=> b!991409 (= e!559110 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439811) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117919 c!100732) b!991407))

(assert (= (and d!117919 (not c!100732)) b!991408))

(assert (= (and d!117919 (not res!662645)) b!991409))

(declare-fun m!919327 () Bool)

(assert (=> d!117919 m!919327))

(declare-fun m!919329 () Bool)

(assert (=> b!991407 m!919329))

(declare-fun m!919331 () Bool)

(assert (=> b!991407 m!919331))

(assert (=> b!991407 m!919331))

(declare-fun m!919333 () Bool)

(assert (=> b!991407 m!919333))

(assert (=> b!991409 m!919331))

(assert (=> b!991409 m!919331))

(assert (=> b!991409 m!919333))

(assert (=> d!117893 d!117919))

(assert (=> d!117893 d!117867))

(declare-fun d!117921 () Bool)

(declare-fun e!559112 () Bool)

(assert (=> d!117921 e!559112))

(declare-fun res!662646 () Bool)

(assert (=> d!117921 (=> res!662646 e!559112)))

(declare-fun lt!439857 () Bool)

(assert (=> d!117921 (= res!662646 (not lt!439857))))

(declare-fun lt!439860 () Bool)

(assert (=> d!117921 (= lt!439857 lt!439860)))

(declare-fun lt!439859 () Unit!32849)

(declare-fun e!559113 () Unit!32849)

(assert (=> d!117921 (= lt!439859 e!559113)))

(declare-fun c!100733 () Bool)

(assert (=> d!117921 (= c!100733 lt!439860)))

(assert (=> d!117921 (= lt!439860 (containsKey!481 (toList!6829 lt!439782) (select (arr!30144 _keys!1544) from!1932)))))

(assert (=> d!117921 (= (contains!5746 lt!439782 (select (arr!30144 _keys!1544) from!1932)) lt!439857)))

(declare-fun b!991410 () Bool)

(declare-fun lt!439858 () Unit!32849)

(assert (=> b!991410 (= e!559113 lt!439858)))

(assert (=> b!991410 (= lt!439858 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6829 lt!439782) (select (arr!30144 _keys!1544) from!1932)))))

(assert (=> b!991410 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439782) (select (arr!30144 _keys!1544) from!1932)))))

(declare-fun b!991411 () Bool)

(declare-fun Unit!32856 () Unit!32849)

(assert (=> b!991411 (= e!559113 Unit!32856)))

(declare-fun b!991412 () Bool)

(assert (=> b!991412 (= e!559112 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439782) (select (arr!30144 _keys!1544) from!1932))))))

(assert (= (and d!117921 c!100733) b!991410))

(assert (= (and d!117921 (not c!100733)) b!991411))

(assert (= (and d!117921 (not res!662646)) b!991412))

(assert (=> d!117921 m!918897))

(declare-fun m!919335 () Bool)

(assert (=> d!117921 m!919335))

(assert (=> b!991410 m!918897))

(declare-fun m!919337 () Bool)

(assert (=> b!991410 m!919337))

(assert (=> b!991410 m!918897))

(declare-fun m!919339 () Bool)

(assert (=> b!991410 m!919339))

(assert (=> b!991410 m!919339))

(declare-fun m!919341 () Bool)

(assert (=> b!991410 m!919341))

(assert (=> b!991412 m!918897))

(assert (=> b!991412 m!919339))

(assert (=> b!991412 m!919339))

(assert (=> b!991412 m!919341))

(assert (=> b!991297 d!117921))

(declare-fun d!117923 () Bool)

(assert (=> d!117923 (= (apply!906 lt!439760 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15675 (getValueByKey!512 (toList!6829 lt!439760) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28134 () Bool)

(assert (= bs!28134 d!117923))

(declare-fun m!919343 () Bool)

(assert (=> bs!28134 m!919343))

(assert (=> bs!28134 m!919343))

(declare-fun m!919345 () Bool)

(assert (=> bs!28134 m!919345))

(assert (=> b!991273 d!117923))

(declare-fun d!117925 () Bool)

(assert (=> d!117925 (= (get!15674 (select (arr!30143 _values!1278) from!1932) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!991316 d!117925))

(declare-fun d!117927 () Bool)

(declare-fun e!559114 () Bool)

(assert (=> d!117927 e!559114))

(declare-fun res!662647 () Bool)

(assert (=> d!117927 (=> res!662647 e!559114)))

(declare-fun lt!439861 () Bool)

(assert (=> d!117927 (= res!662647 (not lt!439861))))

(declare-fun lt!439864 () Bool)

(assert (=> d!117927 (= lt!439861 lt!439864)))

(declare-fun lt!439863 () Unit!32849)

(declare-fun e!559115 () Unit!32849)

(assert (=> d!117927 (= lt!439863 e!559115)))

(declare-fun c!100734 () Bool)

(assert (=> d!117927 (= c!100734 lt!439864)))

(assert (=> d!117927 (= lt!439864 (containsKey!481 (toList!6829 lt!439685) (_1!7475 lt!439635)))))

(assert (=> d!117927 (= (contains!5746 lt!439685 (_1!7475 lt!439635)) lt!439861)))

(declare-fun b!991413 () Bool)

(declare-fun lt!439862 () Unit!32849)

(assert (=> b!991413 (= e!559115 lt!439862)))

(assert (=> b!991413 (= lt!439862 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6829 lt!439685) (_1!7475 lt!439635)))))

(assert (=> b!991413 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439685) (_1!7475 lt!439635)))))

(declare-fun b!991414 () Bool)

(declare-fun Unit!32857 () Unit!32849)

(assert (=> b!991414 (= e!559115 Unit!32857)))

(declare-fun b!991415 () Bool)

(assert (=> b!991415 (= e!559114 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439685) (_1!7475 lt!439635))))))

(assert (= (and d!117927 c!100734) b!991413))

(assert (= (and d!117927 (not c!100734)) b!991414))

(assert (= (and d!117927 (not res!662647)) b!991415))

(declare-fun m!919347 () Bool)

(assert (=> d!117927 m!919347))

(declare-fun m!919349 () Bool)

(assert (=> b!991413 m!919349))

(assert (=> b!991413 m!919041))

(assert (=> b!991413 m!919041))

(declare-fun m!919351 () Bool)

(assert (=> b!991413 m!919351))

(assert (=> b!991415 m!919041))

(assert (=> b!991415 m!919041))

(assert (=> b!991415 m!919351))

(assert (=> d!117875 d!117927))

(declare-fun b!991427 () Bool)

(declare-fun e!559121 () Option!518)

(assert (=> b!991427 (= e!559121 None!516)))

(declare-fun b!991424 () Bool)

(declare-fun e!559120 () Option!518)

(assert (=> b!991424 (= e!559120 (Some!517 (_2!7475 (h!22000 lt!439684))))))

(declare-fun d!117929 () Bool)

(declare-fun c!100739 () Bool)

(assert (=> d!117929 (= c!100739 (and ((_ is Cons!20832) lt!439684) (= (_1!7475 (h!22000 lt!439684)) (_1!7475 lt!439635))))))

(assert (=> d!117929 (= (getValueByKey!512 lt!439684 (_1!7475 lt!439635)) e!559120)))

(declare-fun b!991425 () Bool)

(assert (=> b!991425 (= e!559120 e!559121)))

(declare-fun c!100740 () Bool)

(assert (=> b!991425 (= c!100740 (and ((_ is Cons!20832) lt!439684) (not (= (_1!7475 (h!22000 lt!439684)) (_1!7475 lt!439635)))))))

(declare-fun b!991426 () Bool)

(assert (=> b!991426 (= e!559121 (getValueByKey!512 (t!29801 lt!439684) (_1!7475 lt!439635)))))

(assert (= (and d!117929 c!100739) b!991424))

(assert (= (and d!117929 (not c!100739)) b!991425))

(assert (= (and b!991425 c!100740) b!991426))

(assert (= (and b!991425 (not c!100740)) b!991427))

(declare-fun m!919353 () Bool)

(assert (=> b!991426 m!919353))

(assert (=> d!117875 d!117929))

(declare-fun d!117931 () Bool)

(assert (=> d!117931 (= (getValueByKey!512 lt!439684 (_1!7475 lt!439635)) (Some!517 (_2!7475 lt!439635)))))

(declare-fun lt!439867 () Unit!32849)

(declare-fun choose!1622 (List!20836 (_ BitVec 64) V!36041) Unit!32849)

(assert (=> d!117931 (= lt!439867 (choose!1622 lt!439684 (_1!7475 lt!439635) (_2!7475 lt!439635)))))

(declare-fun e!559124 () Bool)

(assert (=> d!117931 e!559124))

(declare-fun res!662652 () Bool)

(assert (=> d!117931 (=> (not res!662652) (not e!559124))))

(declare-fun isStrictlySorted!505 (List!20836) Bool)

(assert (=> d!117931 (= res!662652 (isStrictlySorted!505 lt!439684))))

(assert (=> d!117931 (= (lemmaContainsTupThenGetReturnValue!274 lt!439684 (_1!7475 lt!439635) (_2!7475 lt!439635)) lt!439867)))

(declare-fun b!991432 () Bool)

(declare-fun res!662653 () Bool)

(assert (=> b!991432 (=> (not res!662653) (not e!559124))))

(assert (=> b!991432 (= res!662653 (containsKey!481 lt!439684 (_1!7475 lt!439635)))))

(declare-fun b!991433 () Bool)

(assert (=> b!991433 (= e!559124 (contains!5747 lt!439684 (tuple2!14929 (_1!7475 lt!439635) (_2!7475 lt!439635))))))

(assert (= (and d!117931 res!662652) b!991432))

(assert (= (and b!991432 res!662653) b!991433))

(assert (=> d!117931 m!919035))

(declare-fun m!919355 () Bool)

(assert (=> d!117931 m!919355))

(declare-fun m!919357 () Bool)

(assert (=> d!117931 m!919357))

(declare-fun m!919359 () Bool)

(assert (=> b!991432 m!919359))

(declare-fun m!919361 () Bool)

(assert (=> b!991433 m!919361))

(assert (=> d!117875 d!117931))

(declare-fun b!991454 () Bool)

(declare-fun c!100752 () Bool)

(declare-fun c!100749 () Bool)

(declare-fun e!559138 () List!20836)

(assert (=> b!991454 (= e!559138 (ite c!100752 (t!29801 (toList!6829 lt!439632)) (ite c!100749 (Cons!20832 (h!22000 (toList!6829 lt!439632)) (t!29801 (toList!6829 lt!439632))) Nil!20833)))))

(declare-fun bm!42049 () Bool)

(declare-fun call!42053 () List!20836)

(declare-fun call!42054 () List!20836)

(assert (=> bm!42049 (= call!42053 call!42054)))

(declare-fun bm!42050 () Bool)

(declare-fun c!100751 () Bool)

(declare-fun $colon$colon!555 (List!20836 tuple2!14928) List!20836)

(assert (=> bm!42050 (= call!42054 ($colon$colon!555 e!559138 (ite c!100751 (h!22000 (toList!6829 lt!439632)) (tuple2!14929 (_1!7475 lt!439635) (_2!7475 lt!439635)))))))

(declare-fun c!100750 () Bool)

(assert (=> bm!42050 (= c!100750 c!100751)))

(declare-fun b!991455 () Bool)

(declare-fun e!559139 () Bool)

(declare-fun lt!439870 () List!20836)

(assert (=> b!991455 (= e!559139 (contains!5747 lt!439870 (tuple2!14929 (_1!7475 lt!439635) (_2!7475 lt!439635))))))

(declare-fun b!991456 () Bool)

(declare-fun e!559136 () List!20836)

(assert (=> b!991456 (= e!559136 call!42054)))

(declare-fun b!991457 () Bool)

(declare-fun res!662659 () Bool)

(assert (=> b!991457 (=> (not res!662659) (not e!559139))))

(assert (=> b!991457 (= res!662659 (containsKey!481 lt!439870 (_1!7475 lt!439635)))))

(declare-fun b!991458 () Bool)

(declare-fun e!559137 () List!20836)

(declare-fun call!42052 () List!20836)

(assert (=> b!991458 (= e!559137 call!42052)))

(declare-fun d!117933 () Bool)

(assert (=> d!117933 e!559139))

(declare-fun res!662658 () Bool)

(assert (=> d!117933 (=> (not res!662658) (not e!559139))))

(assert (=> d!117933 (= res!662658 (isStrictlySorted!505 lt!439870))))

(assert (=> d!117933 (= lt!439870 e!559136)))

(assert (=> d!117933 (= c!100751 (and ((_ is Cons!20832) (toList!6829 lt!439632)) (bvslt (_1!7475 (h!22000 (toList!6829 lt!439632))) (_1!7475 lt!439635))))))

(assert (=> d!117933 (isStrictlySorted!505 (toList!6829 lt!439632))))

(assert (=> d!117933 (= (insertStrictlySorted!331 (toList!6829 lt!439632) (_1!7475 lt!439635) (_2!7475 lt!439635)) lt!439870)))

(declare-fun b!991459 () Bool)

(assert (=> b!991459 (= e!559138 (insertStrictlySorted!331 (t!29801 (toList!6829 lt!439632)) (_1!7475 lt!439635) (_2!7475 lt!439635)))))

(declare-fun b!991460 () Bool)

(assert (=> b!991460 (= e!559137 call!42052)))

(declare-fun b!991461 () Bool)

(declare-fun e!559135 () List!20836)

(assert (=> b!991461 (= e!559136 e!559135)))

(assert (=> b!991461 (= c!100752 (and ((_ is Cons!20832) (toList!6829 lt!439632)) (= (_1!7475 (h!22000 (toList!6829 lt!439632))) (_1!7475 lt!439635))))))

(declare-fun b!991462 () Bool)

(assert (=> b!991462 (= e!559135 call!42053)))

(declare-fun b!991463 () Bool)

(assert (=> b!991463 (= c!100749 (and ((_ is Cons!20832) (toList!6829 lt!439632)) (bvsgt (_1!7475 (h!22000 (toList!6829 lt!439632))) (_1!7475 lt!439635))))))

(assert (=> b!991463 (= e!559135 e!559137)))

(declare-fun bm!42051 () Bool)

(assert (=> bm!42051 (= call!42052 call!42053)))

(assert (= (and d!117933 c!100751) b!991456))

(assert (= (and d!117933 (not c!100751)) b!991461))

(assert (= (and b!991461 c!100752) b!991462))

(assert (= (and b!991461 (not c!100752)) b!991463))

(assert (= (and b!991463 c!100749) b!991460))

(assert (= (and b!991463 (not c!100749)) b!991458))

(assert (= (or b!991460 b!991458) bm!42051))

(assert (= (or b!991462 bm!42051) bm!42049))

(assert (= (or b!991456 bm!42049) bm!42050))

(assert (= (and bm!42050 c!100750) b!991459))

(assert (= (and bm!42050 (not c!100750)) b!991454))

(assert (= (and d!117933 res!662658) b!991457))

(assert (= (and b!991457 res!662659) b!991455))

(declare-fun m!919363 () Bool)

(assert (=> bm!42050 m!919363))

(declare-fun m!919365 () Bool)

(assert (=> b!991459 m!919365))

(declare-fun m!919367 () Bool)

(assert (=> d!117933 m!919367))

(declare-fun m!919369 () Bool)

(assert (=> d!117933 m!919369))

(declare-fun m!919371 () Bool)

(assert (=> b!991455 m!919371))

(declare-fun m!919373 () Bool)

(assert (=> b!991457 m!919373))

(assert (=> d!117875 d!117933))

(declare-fun d!117935 () Bool)

(assert (=> d!117935 (= (validKeyInArray!0 (select (arr!30144 _keys!1544) #b00000000000000000000000000000000)) (and (not (= (select (arr!30144 _keys!1544) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30144 _keys!1544) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!991195 d!117935))

(declare-fun d!117937 () Bool)

(assert (=> d!117937 (contains!5746 (+!3117 lt!439758 (tuple2!14929 lt!439752 zeroValue!1220)) lt!439753)))

(declare-fun lt!439873 () Unit!32849)

(declare-fun choose!1623 (ListLongMap!13627 (_ BitVec 64) V!36041 (_ BitVec 64)) Unit!32849)

(assert (=> d!117937 (= lt!439873 (choose!1623 lt!439758 lt!439752 zeroValue!1220 lt!439753))))

(assert (=> d!117937 (contains!5746 lt!439758 lt!439753)))

(assert (=> d!117937 (= (addStillContains!616 lt!439758 lt!439752 zeroValue!1220 lt!439753) lt!439873)))

(declare-fun bs!28135 () Bool)

(assert (= bs!28135 d!117937))

(assert (=> bs!28135 m!919087))

(assert (=> bs!28135 m!919087))

(assert (=> bs!28135 m!919093))

(declare-fun m!919375 () Bool)

(assert (=> bs!28135 m!919375))

(declare-fun m!919377 () Bool)

(assert (=> bs!28135 m!919377))

(assert (=> b!991271 d!117937))

(declare-fun d!117939 () Bool)

(declare-fun e!559140 () Bool)

(assert (=> d!117939 e!559140))

(declare-fun res!662661 () Bool)

(assert (=> d!117939 (=> (not res!662661) (not e!559140))))

(declare-fun lt!439875 () ListLongMap!13627)

(assert (=> d!117939 (= res!662661 (contains!5746 lt!439875 (_1!7475 (tuple2!14929 lt!439752 zeroValue!1220))))))

(declare-fun lt!439874 () List!20836)

(assert (=> d!117939 (= lt!439875 (ListLongMap!13628 lt!439874))))

(declare-fun lt!439876 () Unit!32849)

(declare-fun lt!439877 () Unit!32849)

(assert (=> d!117939 (= lt!439876 lt!439877)))

(assert (=> d!117939 (= (getValueByKey!512 lt!439874 (_1!7475 (tuple2!14929 lt!439752 zeroValue!1220))) (Some!517 (_2!7475 (tuple2!14929 lt!439752 zeroValue!1220))))))

(assert (=> d!117939 (= lt!439877 (lemmaContainsTupThenGetReturnValue!274 lt!439874 (_1!7475 (tuple2!14929 lt!439752 zeroValue!1220)) (_2!7475 (tuple2!14929 lt!439752 zeroValue!1220))))))

(assert (=> d!117939 (= lt!439874 (insertStrictlySorted!331 (toList!6829 lt!439758) (_1!7475 (tuple2!14929 lt!439752 zeroValue!1220)) (_2!7475 (tuple2!14929 lt!439752 zeroValue!1220))))))

(assert (=> d!117939 (= (+!3117 lt!439758 (tuple2!14929 lt!439752 zeroValue!1220)) lt!439875)))

(declare-fun b!991465 () Bool)

(declare-fun res!662660 () Bool)

(assert (=> b!991465 (=> (not res!662660) (not e!559140))))

(assert (=> b!991465 (= res!662660 (= (getValueByKey!512 (toList!6829 lt!439875) (_1!7475 (tuple2!14929 lt!439752 zeroValue!1220))) (Some!517 (_2!7475 (tuple2!14929 lt!439752 zeroValue!1220)))))))

(declare-fun b!991466 () Bool)

(assert (=> b!991466 (= e!559140 (contains!5747 (toList!6829 lt!439875) (tuple2!14929 lt!439752 zeroValue!1220)))))

(assert (= (and d!117939 res!662661) b!991465))

(assert (= (and b!991465 res!662660) b!991466))

(declare-fun m!919379 () Bool)

(assert (=> d!117939 m!919379))

(declare-fun m!919381 () Bool)

(assert (=> d!117939 m!919381))

(declare-fun m!919383 () Bool)

(assert (=> d!117939 m!919383))

(declare-fun m!919385 () Bool)

(assert (=> d!117939 m!919385))

(declare-fun m!919387 () Bool)

(assert (=> b!991465 m!919387))

(declare-fun m!919389 () Bool)

(assert (=> b!991466 m!919389))

(assert (=> b!991271 d!117939))

(declare-fun d!117941 () Bool)

(declare-fun e!559141 () Bool)

(assert (=> d!117941 e!559141))

(declare-fun res!662663 () Bool)

(assert (=> d!117941 (=> (not res!662663) (not e!559141))))

(declare-fun lt!439879 () ListLongMap!13627)

(assert (=> d!117941 (= res!662663 (contains!5746 lt!439879 (_1!7475 (tuple2!14929 lt!439745 zeroValue!1220))))))

(declare-fun lt!439878 () List!20836)

(assert (=> d!117941 (= lt!439879 (ListLongMap!13628 lt!439878))))

(declare-fun lt!439880 () Unit!32849)

(declare-fun lt!439881 () Unit!32849)

(assert (=> d!117941 (= lt!439880 lt!439881)))

(assert (=> d!117941 (= (getValueByKey!512 lt!439878 (_1!7475 (tuple2!14929 lt!439745 zeroValue!1220))) (Some!517 (_2!7475 (tuple2!14929 lt!439745 zeroValue!1220))))))

(assert (=> d!117941 (= lt!439881 (lemmaContainsTupThenGetReturnValue!274 lt!439878 (_1!7475 (tuple2!14929 lt!439745 zeroValue!1220)) (_2!7475 (tuple2!14929 lt!439745 zeroValue!1220))))))

(assert (=> d!117941 (= lt!439878 (insertStrictlySorted!331 (toList!6829 lt!439744) (_1!7475 (tuple2!14929 lt!439745 zeroValue!1220)) (_2!7475 (tuple2!14929 lt!439745 zeroValue!1220))))))

(assert (=> d!117941 (= (+!3117 lt!439744 (tuple2!14929 lt!439745 zeroValue!1220)) lt!439879)))

(declare-fun b!991467 () Bool)

(declare-fun res!662662 () Bool)

(assert (=> b!991467 (=> (not res!662662) (not e!559141))))

(assert (=> b!991467 (= res!662662 (= (getValueByKey!512 (toList!6829 lt!439879) (_1!7475 (tuple2!14929 lt!439745 zeroValue!1220))) (Some!517 (_2!7475 (tuple2!14929 lt!439745 zeroValue!1220)))))))

(declare-fun b!991468 () Bool)

(assert (=> b!991468 (= e!559141 (contains!5747 (toList!6829 lt!439879) (tuple2!14929 lt!439745 zeroValue!1220)))))

(assert (= (and d!117941 res!662663) b!991467))

(assert (= (and b!991467 res!662662) b!991468))

(declare-fun m!919391 () Bool)

(assert (=> d!117941 m!919391))

(declare-fun m!919393 () Bool)

(assert (=> d!117941 m!919393))

(declare-fun m!919395 () Bool)

(assert (=> d!117941 m!919395))

(declare-fun m!919397 () Bool)

(assert (=> d!117941 m!919397))

(declare-fun m!919399 () Bool)

(assert (=> b!991467 m!919399))

(declare-fun m!919401 () Bool)

(assert (=> b!991468 m!919401))

(assert (=> b!991271 d!117941))

(declare-fun d!117943 () Bool)

(assert (=> d!117943 (= (apply!906 (+!3117 lt!439756 (tuple2!14929 lt!439747 minValue!1220)) lt!439764) (apply!906 lt!439756 lt!439764))))

(declare-fun lt!439884 () Unit!32849)

(declare-fun choose!1624 (ListLongMap!13627 (_ BitVec 64) V!36041 (_ BitVec 64)) Unit!32849)

(assert (=> d!117943 (= lt!439884 (choose!1624 lt!439756 lt!439747 minValue!1220 lt!439764))))

(declare-fun e!559144 () Bool)

(assert (=> d!117943 e!559144))

(declare-fun res!662666 () Bool)

(assert (=> d!117943 (=> (not res!662666) (not e!559144))))

(assert (=> d!117943 (= res!662666 (contains!5746 lt!439756 lt!439764))))

(assert (=> d!117943 (= (addApplyDifferent!472 lt!439756 lt!439747 minValue!1220 lt!439764) lt!439884)))

(declare-fun b!991472 () Bool)

(assert (=> b!991472 (= e!559144 (not (= lt!439764 lt!439747)))))

(assert (= (and d!117943 res!662666) b!991472))

(declare-fun m!919403 () Bool)

(assert (=> d!117943 m!919403))

(assert (=> d!117943 m!919099))

(assert (=> d!117943 m!919109))

(declare-fun m!919405 () Bool)

(assert (=> d!117943 m!919405))

(assert (=> d!117943 m!919103))

(assert (=> d!117943 m!919099))

(assert (=> b!991271 d!117943))

(declare-fun d!117945 () Bool)

(assert (=> d!117945 (= (apply!906 (+!3117 lt!439744 (tuple2!14929 lt!439745 zeroValue!1220)) lt!439754) (get!15675 (getValueByKey!512 (toList!6829 (+!3117 lt!439744 (tuple2!14929 lt!439745 zeroValue!1220))) lt!439754)))))

(declare-fun bs!28136 () Bool)

(assert (= bs!28136 d!117945))

(declare-fun m!919407 () Bool)

(assert (=> bs!28136 m!919407))

(assert (=> bs!28136 m!919407))

(declare-fun m!919409 () Bool)

(assert (=> bs!28136 m!919409))

(assert (=> b!991271 d!117945))

(assert (=> b!991271 d!117893))

(declare-fun d!117947 () Bool)

(assert (=> d!117947 (= (apply!906 (+!3117 lt!439748 (tuple2!14929 lt!439743 minValue!1220)) lt!439755) (apply!906 lt!439748 lt!439755))))

(declare-fun lt!439885 () Unit!32849)

(assert (=> d!117947 (= lt!439885 (choose!1624 lt!439748 lt!439743 minValue!1220 lt!439755))))

(declare-fun e!559145 () Bool)

(assert (=> d!117947 e!559145))

(declare-fun res!662667 () Bool)

(assert (=> d!117947 (=> (not res!662667) (not e!559145))))

(assert (=> d!117947 (= res!662667 (contains!5746 lt!439748 lt!439755))))

(assert (=> d!117947 (= (addApplyDifferent!472 lt!439748 lt!439743 minValue!1220 lt!439755) lt!439885)))

(declare-fun b!991473 () Bool)

(assert (=> b!991473 (= e!559145 (not (= lt!439755 lt!439743)))))

(assert (= (and d!117947 res!662667) b!991473))

(declare-fun m!919411 () Bool)

(assert (=> d!117947 m!919411))

(assert (=> d!117947 m!919097))

(assert (=> d!117947 m!919115))

(declare-fun m!919413 () Bool)

(assert (=> d!117947 m!919413))

(assert (=> d!117947 m!919105))

(assert (=> d!117947 m!919097))

(assert (=> b!991271 d!117947))

(declare-fun d!117949 () Bool)

(declare-fun e!559146 () Bool)

(assert (=> d!117949 e!559146))

(declare-fun res!662668 () Bool)

(assert (=> d!117949 (=> res!662668 e!559146)))

(declare-fun lt!439886 () Bool)

(assert (=> d!117949 (= res!662668 (not lt!439886))))

(declare-fun lt!439889 () Bool)

(assert (=> d!117949 (= lt!439886 lt!439889)))

(declare-fun lt!439888 () Unit!32849)

(declare-fun e!559147 () Unit!32849)

(assert (=> d!117949 (= lt!439888 e!559147)))

(declare-fun c!100753 () Bool)

(assert (=> d!117949 (= c!100753 lt!439889)))

(assert (=> d!117949 (= lt!439889 (containsKey!481 (toList!6829 (+!3117 lt!439758 (tuple2!14929 lt!439752 zeroValue!1220))) lt!439753))))

(assert (=> d!117949 (= (contains!5746 (+!3117 lt!439758 (tuple2!14929 lt!439752 zeroValue!1220)) lt!439753) lt!439886)))

(declare-fun b!991474 () Bool)

(declare-fun lt!439887 () Unit!32849)

(assert (=> b!991474 (= e!559147 lt!439887)))

(assert (=> b!991474 (= lt!439887 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6829 (+!3117 lt!439758 (tuple2!14929 lt!439752 zeroValue!1220))) lt!439753))))

(assert (=> b!991474 (isDefined!383 (getValueByKey!512 (toList!6829 (+!3117 lt!439758 (tuple2!14929 lt!439752 zeroValue!1220))) lt!439753))))

(declare-fun b!991475 () Bool)

(declare-fun Unit!32858 () Unit!32849)

(assert (=> b!991475 (= e!559147 Unit!32858)))

(declare-fun b!991476 () Bool)

(assert (=> b!991476 (= e!559146 (isDefined!383 (getValueByKey!512 (toList!6829 (+!3117 lt!439758 (tuple2!14929 lt!439752 zeroValue!1220))) lt!439753)))))

(assert (= (and d!117949 c!100753) b!991474))

(assert (= (and d!117949 (not c!100753)) b!991475))

(assert (= (and d!117949 (not res!662668)) b!991476))

(declare-fun m!919415 () Bool)

(assert (=> d!117949 m!919415))

(declare-fun m!919417 () Bool)

(assert (=> b!991474 m!919417))

(declare-fun m!919419 () Bool)

(assert (=> b!991474 m!919419))

(assert (=> b!991474 m!919419))

(declare-fun m!919421 () Bool)

(assert (=> b!991474 m!919421))

(assert (=> b!991476 m!919419))

(assert (=> b!991476 m!919419))

(assert (=> b!991476 m!919421))

(assert (=> b!991271 d!117949))

(declare-fun d!117951 () Bool)

(declare-fun e!559148 () Bool)

(assert (=> d!117951 e!559148))

(declare-fun res!662670 () Bool)

(assert (=> d!117951 (=> (not res!662670) (not e!559148))))

(declare-fun lt!439891 () ListLongMap!13627)

(assert (=> d!117951 (= res!662670 (contains!5746 lt!439891 (_1!7475 (tuple2!14929 lt!439747 minValue!1220))))))

(declare-fun lt!439890 () List!20836)

(assert (=> d!117951 (= lt!439891 (ListLongMap!13628 lt!439890))))

(declare-fun lt!439892 () Unit!32849)

(declare-fun lt!439893 () Unit!32849)

(assert (=> d!117951 (= lt!439892 lt!439893)))

(assert (=> d!117951 (= (getValueByKey!512 lt!439890 (_1!7475 (tuple2!14929 lt!439747 minValue!1220))) (Some!517 (_2!7475 (tuple2!14929 lt!439747 minValue!1220))))))

(assert (=> d!117951 (= lt!439893 (lemmaContainsTupThenGetReturnValue!274 lt!439890 (_1!7475 (tuple2!14929 lt!439747 minValue!1220)) (_2!7475 (tuple2!14929 lt!439747 minValue!1220))))))

(assert (=> d!117951 (= lt!439890 (insertStrictlySorted!331 (toList!6829 lt!439756) (_1!7475 (tuple2!14929 lt!439747 minValue!1220)) (_2!7475 (tuple2!14929 lt!439747 minValue!1220))))))

(assert (=> d!117951 (= (+!3117 lt!439756 (tuple2!14929 lt!439747 minValue!1220)) lt!439891)))

(declare-fun b!991477 () Bool)

(declare-fun res!662669 () Bool)

(assert (=> b!991477 (=> (not res!662669) (not e!559148))))

(assert (=> b!991477 (= res!662669 (= (getValueByKey!512 (toList!6829 lt!439891) (_1!7475 (tuple2!14929 lt!439747 minValue!1220))) (Some!517 (_2!7475 (tuple2!14929 lt!439747 minValue!1220)))))))

(declare-fun b!991478 () Bool)

(assert (=> b!991478 (= e!559148 (contains!5747 (toList!6829 lt!439891) (tuple2!14929 lt!439747 minValue!1220)))))

(assert (= (and d!117951 res!662670) b!991477))

(assert (= (and b!991477 res!662669) b!991478))

(declare-fun m!919423 () Bool)

(assert (=> d!117951 m!919423))

(declare-fun m!919425 () Bool)

(assert (=> d!117951 m!919425))

(declare-fun m!919427 () Bool)

(assert (=> d!117951 m!919427))

(declare-fun m!919429 () Bool)

(assert (=> d!117951 m!919429))

(declare-fun m!919431 () Bool)

(assert (=> b!991477 m!919431))

(declare-fun m!919433 () Bool)

(assert (=> b!991478 m!919433))

(assert (=> b!991271 d!117951))

(declare-fun d!117953 () Bool)

(declare-fun e!559149 () Bool)

(assert (=> d!117953 e!559149))

(declare-fun res!662672 () Bool)

(assert (=> d!117953 (=> (not res!662672) (not e!559149))))

(declare-fun lt!439895 () ListLongMap!13627)

(assert (=> d!117953 (= res!662672 (contains!5746 lt!439895 (_1!7475 (tuple2!14929 lt!439743 minValue!1220))))))

(declare-fun lt!439894 () List!20836)

(assert (=> d!117953 (= lt!439895 (ListLongMap!13628 lt!439894))))

(declare-fun lt!439896 () Unit!32849)

(declare-fun lt!439897 () Unit!32849)

(assert (=> d!117953 (= lt!439896 lt!439897)))

(assert (=> d!117953 (= (getValueByKey!512 lt!439894 (_1!7475 (tuple2!14929 lt!439743 minValue!1220))) (Some!517 (_2!7475 (tuple2!14929 lt!439743 minValue!1220))))))

(assert (=> d!117953 (= lt!439897 (lemmaContainsTupThenGetReturnValue!274 lt!439894 (_1!7475 (tuple2!14929 lt!439743 minValue!1220)) (_2!7475 (tuple2!14929 lt!439743 minValue!1220))))))

(assert (=> d!117953 (= lt!439894 (insertStrictlySorted!331 (toList!6829 lt!439748) (_1!7475 (tuple2!14929 lt!439743 minValue!1220)) (_2!7475 (tuple2!14929 lt!439743 minValue!1220))))))

(assert (=> d!117953 (= (+!3117 lt!439748 (tuple2!14929 lt!439743 minValue!1220)) lt!439895)))

(declare-fun b!991479 () Bool)

(declare-fun res!662671 () Bool)

(assert (=> b!991479 (=> (not res!662671) (not e!559149))))

(assert (=> b!991479 (= res!662671 (= (getValueByKey!512 (toList!6829 lt!439895) (_1!7475 (tuple2!14929 lt!439743 minValue!1220))) (Some!517 (_2!7475 (tuple2!14929 lt!439743 minValue!1220)))))))

(declare-fun b!991480 () Bool)

(assert (=> b!991480 (= e!559149 (contains!5747 (toList!6829 lt!439895) (tuple2!14929 lt!439743 minValue!1220)))))

(assert (= (and d!117953 res!662672) b!991479))

(assert (= (and b!991479 res!662671) b!991480))

(declare-fun m!919435 () Bool)

(assert (=> d!117953 m!919435))

(declare-fun m!919437 () Bool)

(assert (=> d!117953 m!919437))

(declare-fun m!919439 () Bool)

(assert (=> d!117953 m!919439))

(declare-fun m!919441 () Bool)

(assert (=> d!117953 m!919441))

(declare-fun m!919443 () Bool)

(assert (=> b!991479 m!919443))

(declare-fun m!919445 () Bool)

(assert (=> b!991480 m!919445))

(assert (=> b!991271 d!117953))

(declare-fun d!117955 () Bool)

(assert (=> d!117955 (= (apply!906 (+!3117 lt!439744 (tuple2!14929 lt!439745 zeroValue!1220)) lt!439754) (apply!906 lt!439744 lt!439754))))

(declare-fun lt!439898 () Unit!32849)

(assert (=> d!117955 (= lt!439898 (choose!1624 lt!439744 lt!439745 zeroValue!1220 lt!439754))))

(declare-fun e!559150 () Bool)

(assert (=> d!117955 e!559150))

(declare-fun res!662673 () Bool)

(assert (=> d!117955 (=> (not res!662673) (not e!559150))))

(assert (=> d!117955 (= res!662673 (contains!5746 lt!439744 lt!439754))))

(assert (=> d!117955 (= (addApplyDifferent!472 lt!439744 lt!439745 zeroValue!1220 lt!439754) lt!439898)))

(declare-fun b!991481 () Bool)

(assert (=> b!991481 (= e!559150 (not (= lt!439754 lt!439745)))))

(assert (= (and d!117955 res!662673) b!991481))

(declare-fun m!919447 () Bool)

(assert (=> d!117955 m!919447))

(assert (=> d!117955 m!919089))

(assert (=> d!117955 m!919091))

(declare-fun m!919449 () Bool)

(assert (=> d!117955 m!919449))

(assert (=> d!117955 m!919111))

(assert (=> d!117955 m!919089))

(assert (=> b!991271 d!117955))

(declare-fun d!117957 () Bool)

(assert (=> d!117957 (= (apply!906 (+!3117 lt!439748 (tuple2!14929 lt!439743 minValue!1220)) lt!439755) (get!15675 (getValueByKey!512 (toList!6829 (+!3117 lt!439748 (tuple2!14929 lt!439743 minValue!1220))) lt!439755)))))

(declare-fun bs!28137 () Bool)

(assert (= bs!28137 d!117957))

(declare-fun m!919451 () Bool)

(assert (=> bs!28137 m!919451))

(assert (=> bs!28137 m!919451))

(declare-fun m!919453 () Bool)

(assert (=> bs!28137 m!919453))

(assert (=> b!991271 d!117957))

(declare-fun d!117959 () Bool)

(assert (=> d!117959 (= (apply!906 lt!439744 lt!439754) (get!15675 (getValueByKey!512 (toList!6829 lt!439744) lt!439754)))))

(declare-fun bs!28138 () Bool)

(assert (= bs!28138 d!117959))

(declare-fun m!919455 () Bool)

(assert (=> bs!28138 m!919455))

(assert (=> bs!28138 m!919455))

(declare-fun m!919457 () Bool)

(assert (=> bs!28138 m!919457))

(assert (=> b!991271 d!117959))

(declare-fun d!117961 () Bool)

(assert (=> d!117961 (= (apply!906 (+!3117 lt!439756 (tuple2!14929 lt!439747 minValue!1220)) lt!439764) (get!15675 (getValueByKey!512 (toList!6829 (+!3117 lt!439756 (tuple2!14929 lt!439747 minValue!1220))) lt!439764)))))

(declare-fun bs!28139 () Bool)

(assert (= bs!28139 d!117961))

(declare-fun m!919459 () Bool)

(assert (=> bs!28139 m!919459))

(assert (=> bs!28139 m!919459))

(declare-fun m!919461 () Bool)

(assert (=> bs!28139 m!919461))

(assert (=> b!991271 d!117961))

(declare-fun d!117963 () Bool)

(assert (=> d!117963 (= (apply!906 lt!439748 lt!439755) (get!15675 (getValueByKey!512 (toList!6829 lt!439748) lt!439755)))))

(declare-fun bs!28140 () Bool)

(assert (= bs!28140 d!117963))

(declare-fun m!919463 () Bool)

(assert (=> bs!28140 m!919463))

(assert (=> bs!28140 m!919463))

(declare-fun m!919465 () Bool)

(assert (=> bs!28140 m!919465))

(assert (=> b!991271 d!117963))

(declare-fun d!117965 () Bool)

(assert (=> d!117965 (= (apply!906 lt!439756 lt!439764) (get!15675 (getValueByKey!512 (toList!6829 lt!439756) lt!439764)))))

(declare-fun bs!28141 () Bool)

(assert (= bs!28141 d!117965))

(declare-fun m!919467 () Bool)

(assert (=> bs!28141 m!919467))

(assert (=> bs!28141 m!919467))

(declare-fun m!919469 () Bool)

(assert (=> bs!28141 m!919469))

(assert (=> b!991271 d!117965))

(declare-fun d!117967 () Bool)

(declare-fun e!559151 () Bool)

(assert (=> d!117967 e!559151))

(declare-fun res!662674 () Bool)

(assert (=> d!117967 (=> res!662674 e!559151)))

(declare-fun lt!439899 () Bool)

(assert (=> d!117967 (= res!662674 (not lt!439899))))

(declare-fun lt!439902 () Bool)

(assert (=> d!117967 (= lt!439899 lt!439902)))

(declare-fun lt!439901 () Unit!32849)

(declare-fun e!559152 () Unit!32849)

(assert (=> d!117967 (= lt!439901 e!559152)))

(declare-fun c!100754 () Bool)

(assert (=> d!117967 (= c!100754 lt!439902)))

(assert (=> d!117967 (= lt!439902 (containsKey!481 (toList!6829 lt!439811) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117967 (= (contains!5746 lt!439811 #b1000000000000000000000000000000000000000000000000000000000000000) lt!439899)))

(declare-fun b!991482 () Bool)

(declare-fun lt!439900 () Unit!32849)

(assert (=> b!991482 (= e!559152 lt!439900)))

(assert (=> b!991482 (= lt!439900 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6829 lt!439811) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!991482 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439811) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991483 () Bool)

(declare-fun Unit!32859 () Unit!32849)

(assert (=> b!991483 (= e!559152 Unit!32859)))

(declare-fun b!991484 () Bool)

(assert (=> b!991484 (= e!559151 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439811) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117967 c!100754) b!991482))

(assert (= (and d!117967 (not c!100754)) b!991483))

(assert (= (and d!117967 (not res!662674)) b!991484))

(declare-fun m!919471 () Bool)

(assert (=> d!117967 m!919471))

(declare-fun m!919473 () Bool)

(assert (=> b!991482 m!919473))

(declare-fun m!919475 () Bool)

(assert (=> b!991482 m!919475))

(assert (=> b!991482 m!919475))

(declare-fun m!919477 () Bool)

(assert (=> b!991482 m!919477))

(assert (=> b!991484 m!919475))

(assert (=> b!991484 m!919475))

(assert (=> b!991484 m!919477))

(assert (=> b!991351 d!117967))

(declare-fun d!117969 () Bool)

(assert (=> d!117969 (= (apply!906 lt!439782 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15675 (getValueByKey!512 (toList!6829 lt!439782) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28142 () Bool)

(assert (= bs!28142 d!117969))

(declare-fun m!919479 () Bool)

(assert (=> bs!28142 m!919479))

(assert (=> bs!28142 m!919479))

(declare-fun m!919481 () Bool)

(assert (=> bs!28142 m!919481))

(assert (=> b!991294 d!117969))

(assert (=> b!991212 d!117935))

(declare-fun d!117971 () Bool)

(declare-fun e!559153 () Bool)

(assert (=> d!117971 e!559153))

(declare-fun res!662676 () Bool)

(assert (=> d!117971 (=> (not res!662676) (not e!559153))))

(declare-fun lt!439904 () ListLongMap!13627)

(assert (=> d!117971 (= res!662676 (contains!5746 lt!439904 (_1!7475 (ite (or c!100698 c!100700) (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun lt!439903 () List!20836)

(assert (=> d!117971 (= lt!439904 (ListLongMap!13628 lt!439903))))

(declare-fun lt!439905 () Unit!32849)

(declare-fun lt!439906 () Unit!32849)

(assert (=> d!117971 (= lt!439905 lt!439906)))

(assert (=> d!117971 (= (getValueByKey!512 lt!439903 (_1!7475 (ite (or c!100698 c!100700) (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!517 (_2!7475 (ite (or c!100698 c!100700) (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117971 (= lt!439906 (lemmaContainsTupThenGetReturnValue!274 lt!439903 (_1!7475 (ite (or c!100698 c!100700) (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7475 (ite (or c!100698 c!100700) (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117971 (= lt!439903 (insertStrictlySorted!331 (toList!6829 (ite c!100698 call!42029 (ite c!100700 call!42032 call!42028))) (_1!7475 (ite (or c!100698 c!100700) (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7475 (ite (or c!100698 c!100700) (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117971 (= (+!3117 (ite c!100698 call!42029 (ite c!100700 call!42032 call!42028)) (ite (or c!100698 c!100700) (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) lt!439904)))

(declare-fun b!991485 () Bool)

(declare-fun res!662675 () Bool)

(assert (=> b!991485 (=> (not res!662675) (not e!559153))))

(assert (=> b!991485 (= res!662675 (= (getValueByKey!512 (toList!6829 lt!439904) (_1!7475 (ite (or c!100698 c!100700) (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!517 (_2!7475 (ite (or c!100698 c!100700) (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))))

(declare-fun b!991486 () Bool)

(assert (=> b!991486 (= e!559153 (contains!5747 (toList!6829 lt!439904) (ite (or c!100698 c!100700) (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!117971 res!662676) b!991485))

(assert (= (and b!991485 res!662675) b!991486))

(declare-fun m!919483 () Bool)

(assert (=> d!117971 m!919483))

(declare-fun m!919485 () Bool)

(assert (=> d!117971 m!919485))

(declare-fun m!919487 () Bool)

(assert (=> d!117971 m!919487))

(declare-fun m!919489 () Bool)

(assert (=> d!117971 m!919489))

(declare-fun m!919491 () Bool)

(assert (=> b!991485 m!919491))

(declare-fun m!919493 () Bool)

(assert (=> b!991486 m!919493))

(assert (=> bm!42027 d!117971))

(declare-fun d!117973 () Bool)

(declare-fun e!559154 () Bool)

(assert (=> d!117973 e!559154))

(declare-fun res!662678 () Bool)

(assert (=> d!117973 (=> (not res!662678) (not e!559154))))

(declare-fun lt!439908 () ListLongMap!13627)

(assert (=> d!117973 (= res!662678 (contains!5746 lt!439908 (_1!7475 (tuple2!14929 lt!439809 lt!439812))))))

(declare-fun lt!439907 () List!20836)

(assert (=> d!117973 (= lt!439908 (ListLongMap!13628 lt!439907))))

(declare-fun lt!439909 () Unit!32849)

(declare-fun lt!439910 () Unit!32849)

(assert (=> d!117973 (= lt!439909 lt!439910)))

(assert (=> d!117973 (= (getValueByKey!512 lt!439907 (_1!7475 (tuple2!14929 lt!439809 lt!439812))) (Some!517 (_2!7475 (tuple2!14929 lt!439809 lt!439812))))))

(assert (=> d!117973 (= lt!439910 (lemmaContainsTupThenGetReturnValue!274 lt!439907 (_1!7475 (tuple2!14929 lt!439809 lt!439812)) (_2!7475 (tuple2!14929 lt!439809 lt!439812))))))

(assert (=> d!117973 (= lt!439907 (insertStrictlySorted!331 (toList!6829 lt!439815) (_1!7475 (tuple2!14929 lt!439809 lt!439812)) (_2!7475 (tuple2!14929 lt!439809 lt!439812))))))

(assert (=> d!117973 (= (+!3117 lt!439815 (tuple2!14929 lt!439809 lt!439812)) lt!439908)))

(declare-fun b!991487 () Bool)

(declare-fun res!662677 () Bool)

(assert (=> b!991487 (=> (not res!662677) (not e!559154))))

(assert (=> b!991487 (= res!662677 (= (getValueByKey!512 (toList!6829 lt!439908) (_1!7475 (tuple2!14929 lt!439809 lt!439812))) (Some!517 (_2!7475 (tuple2!14929 lt!439809 lt!439812)))))))

(declare-fun b!991488 () Bool)

(assert (=> b!991488 (= e!559154 (contains!5747 (toList!6829 lt!439908) (tuple2!14929 lt!439809 lt!439812)))))

(assert (= (and d!117973 res!662678) b!991487))

(assert (= (and b!991487 res!662677) b!991488))

(declare-fun m!919495 () Bool)

(assert (=> d!117973 m!919495))

(declare-fun m!919497 () Bool)

(assert (=> d!117973 m!919497))

(declare-fun m!919499 () Bool)

(assert (=> d!117973 m!919499))

(declare-fun m!919501 () Bool)

(assert (=> d!117973 m!919501))

(declare-fun m!919503 () Bool)

(assert (=> b!991487 m!919503))

(declare-fun m!919505 () Bool)

(assert (=> b!991488 m!919505))

(assert (=> b!991349 d!117973))

(declare-fun d!117975 () Bool)

(assert (=> d!117975 (not (contains!5746 (+!3117 lt!439815 (tuple2!14929 lt!439809 lt!439812)) lt!439813))))

(declare-fun lt!439913 () Unit!32849)

(declare-fun choose!1625 (ListLongMap!13627 (_ BitVec 64) V!36041 (_ BitVec 64)) Unit!32849)

(assert (=> d!117975 (= lt!439913 (choose!1625 lt!439815 lt!439809 lt!439812 lt!439813))))

(declare-fun e!559157 () Bool)

(assert (=> d!117975 e!559157))

(declare-fun res!662681 () Bool)

(assert (=> d!117975 (=> (not res!662681) (not e!559157))))

(assert (=> d!117975 (= res!662681 (not (contains!5746 lt!439815 lt!439813)))))

(assert (=> d!117975 (= (addStillNotContains!238 lt!439815 lt!439809 lt!439812 lt!439813) lt!439913)))

(declare-fun b!991492 () Bool)

(assert (=> b!991492 (= e!559157 (not (= lt!439809 lt!439813)))))

(assert (= (and d!117975 res!662681) b!991492))

(assert (=> d!117975 m!919219))

(assert (=> d!117975 m!919219))

(assert (=> d!117975 m!919221))

(declare-fun m!919507 () Bool)

(assert (=> d!117975 m!919507))

(declare-fun m!919509 () Bool)

(assert (=> d!117975 m!919509))

(assert (=> b!991349 d!117975))

(declare-fun d!117977 () Bool)

(declare-fun c!100755 () Bool)

(assert (=> d!117977 (= c!100755 ((_ is ValueCellFull!11165) (select (arr!30143 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun e!559158 () V!36041)

(assert (=> d!117977 (= (get!15672 (select (arr!30143 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!559158)))

(declare-fun b!991493 () Bool)

(assert (=> b!991493 (= e!559158 (get!15673 (select (arr!30143 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!991494 () Bool)

(assert (=> b!991494 (= e!559158 (get!15674 (select (arr!30143 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117977 c!100755) b!991493))

(assert (= (and d!117977 (not c!100755)) b!991494))

(assert (=> b!991493 m!919119))

(assert (=> b!991493 m!918927))

(declare-fun m!919511 () Bool)

(assert (=> b!991493 m!919511))

(assert (=> b!991494 m!919119))

(assert (=> b!991494 m!918927))

(declare-fun m!919513 () Bool)

(assert (=> b!991494 m!919513))

(assert (=> b!991349 d!117977))

(declare-fun d!117979 () Bool)

(declare-fun e!559159 () Bool)

(assert (=> d!117979 e!559159))

(declare-fun res!662683 () Bool)

(assert (=> d!117979 (=> (not res!662683) (not e!559159))))

(declare-fun lt!439915 () ListLongMap!13627)

(assert (=> d!117979 (= res!662683 (contains!5746 lt!439915 (_1!7475 (tuple2!14929 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15672 (select (arr!30143 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!439914 () List!20836)

(assert (=> d!117979 (= lt!439915 (ListLongMap!13628 lt!439914))))

(declare-fun lt!439916 () Unit!32849)

(declare-fun lt!439917 () Unit!32849)

(assert (=> d!117979 (= lt!439916 lt!439917)))

(assert (=> d!117979 (= (getValueByKey!512 lt!439914 (_1!7475 (tuple2!14929 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15672 (select (arr!30143 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!517 (_2!7475 (tuple2!14929 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15672 (select (arr!30143 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117979 (= lt!439917 (lemmaContainsTupThenGetReturnValue!274 lt!439914 (_1!7475 (tuple2!14929 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15672 (select (arr!30143 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7475 (tuple2!14929 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15672 (select (arr!30143 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117979 (= lt!439914 (insertStrictlySorted!331 (toList!6829 call!42044) (_1!7475 (tuple2!14929 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15672 (select (arr!30143 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7475 (tuple2!14929 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15672 (select (arr!30143 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117979 (= (+!3117 call!42044 (tuple2!14929 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15672 (select (arr!30143 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!439915)))

(declare-fun b!991495 () Bool)

(declare-fun res!662682 () Bool)

(assert (=> b!991495 (=> (not res!662682) (not e!559159))))

(assert (=> b!991495 (= res!662682 (= (getValueByKey!512 (toList!6829 lt!439915) (_1!7475 (tuple2!14929 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15672 (select (arr!30143 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!517 (_2!7475 (tuple2!14929 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15672 (select (arr!30143 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!991496 () Bool)

(assert (=> b!991496 (= e!559159 (contains!5747 (toList!6829 lt!439915) (tuple2!14929 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15672 (select (arr!30143 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!117979 res!662683) b!991495))

(assert (= (and b!991495 res!662682) b!991496))

(declare-fun m!919515 () Bool)

(assert (=> d!117979 m!919515))

(declare-fun m!919517 () Bool)

(assert (=> d!117979 m!919517))

(declare-fun m!919519 () Bool)

(assert (=> d!117979 m!919519))

(declare-fun m!919521 () Bool)

(assert (=> d!117979 m!919521))

(declare-fun m!919523 () Bool)

(assert (=> b!991495 m!919523))

(declare-fun m!919525 () Bool)

(assert (=> b!991496 m!919525))

(assert (=> b!991349 d!117979))

(declare-fun d!117981 () Bool)

(declare-fun e!559160 () Bool)

(assert (=> d!117981 e!559160))

(declare-fun res!662684 () Bool)

(assert (=> d!117981 (=> res!662684 e!559160)))

(declare-fun lt!439918 () Bool)

(assert (=> d!117981 (= res!662684 (not lt!439918))))

(declare-fun lt!439921 () Bool)

(assert (=> d!117981 (= lt!439918 lt!439921)))

(declare-fun lt!439920 () Unit!32849)

(declare-fun e!559161 () Unit!32849)

(assert (=> d!117981 (= lt!439920 e!559161)))

(declare-fun c!100756 () Bool)

(assert (=> d!117981 (= c!100756 lt!439921)))

(assert (=> d!117981 (= lt!439921 (containsKey!481 (toList!6829 (+!3117 lt!439815 (tuple2!14929 lt!439809 lt!439812))) lt!439813))))

(assert (=> d!117981 (= (contains!5746 (+!3117 lt!439815 (tuple2!14929 lt!439809 lt!439812)) lt!439813) lt!439918)))

(declare-fun b!991497 () Bool)

(declare-fun lt!439919 () Unit!32849)

(assert (=> b!991497 (= e!559161 lt!439919)))

(assert (=> b!991497 (= lt!439919 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6829 (+!3117 lt!439815 (tuple2!14929 lt!439809 lt!439812))) lt!439813))))

(assert (=> b!991497 (isDefined!383 (getValueByKey!512 (toList!6829 (+!3117 lt!439815 (tuple2!14929 lt!439809 lt!439812))) lt!439813))))

(declare-fun b!991498 () Bool)

(declare-fun Unit!32860 () Unit!32849)

(assert (=> b!991498 (= e!559161 Unit!32860)))

(declare-fun b!991499 () Bool)

(assert (=> b!991499 (= e!559160 (isDefined!383 (getValueByKey!512 (toList!6829 (+!3117 lt!439815 (tuple2!14929 lt!439809 lt!439812))) lt!439813)))))

(assert (= (and d!117981 c!100756) b!991497))

(assert (= (and d!117981 (not c!100756)) b!991498))

(assert (= (and d!117981 (not res!662684)) b!991499))

(declare-fun m!919527 () Bool)

(assert (=> d!117981 m!919527))

(declare-fun m!919529 () Bool)

(assert (=> b!991497 m!919529))

(declare-fun m!919531 () Bool)

(assert (=> b!991497 m!919531))

(assert (=> b!991497 m!919531))

(declare-fun m!919533 () Bool)

(assert (=> b!991497 m!919533))

(assert (=> b!991499 m!919531))

(assert (=> b!991499 m!919531))

(assert (=> b!991499 m!919533))

(assert (=> b!991349 d!117981))

(declare-fun d!117983 () Bool)

(declare-fun e!559162 () Bool)

(assert (=> d!117983 e!559162))

(declare-fun res!662686 () Bool)

(assert (=> d!117983 (=> (not res!662686) (not e!559162))))

(declare-fun lt!439923 () ListLongMap!13627)

(assert (=> d!117983 (= res!662686 (contains!5746 lt!439923 (_1!7475 (tuple2!14929 lt!439767 zeroValue!1220))))))

(declare-fun lt!439922 () List!20836)

(assert (=> d!117983 (= lt!439923 (ListLongMap!13628 lt!439922))))

(declare-fun lt!439924 () Unit!32849)

(declare-fun lt!439925 () Unit!32849)

(assert (=> d!117983 (= lt!439924 lt!439925)))

(assert (=> d!117983 (= (getValueByKey!512 lt!439922 (_1!7475 (tuple2!14929 lt!439767 zeroValue!1220))) (Some!517 (_2!7475 (tuple2!14929 lt!439767 zeroValue!1220))))))

(assert (=> d!117983 (= lt!439925 (lemmaContainsTupThenGetReturnValue!274 lt!439922 (_1!7475 (tuple2!14929 lt!439767 zeroValue!1220)) (_2!7475 (tuple2!14929 lt!439767 zeroValue!1220))))))

(assert (=> d!117983 (= lt!439922 (insertStrictlySorted!331 (toList!6829 lt!439766) (_1!7475 (tuple2!14929 lt!439767 zeroValue!1220)) (_2!7475 (tuple2!14929 lt!439767 zeroValue!1220))))))

(assert (=> d!117983 (= (+!3117 lt!439766 (tuple2!14929 lt!439767 zeroValue!1220)) lt!439923)))

(declare-fun b!991500 () Bool)

(declare-fun res!662685 () Bool)

(assert (=> b!991500 (=> (not res!662685) (not e!559162))))

(assert (=> b!991500 (= res!662685 (= (getValueByKey!512 (toList!6829 lt!439923) (_1!7475 (tuple2!14929 lt!439767 zeroValue!1220))) (Some!517 (_2!7475 (tuple2!14929 lt!439767 zeroValue!1220)))))))

(declare-fun b!991501 () Bool)

(assert (=> b!991501 (= e!559162 (contains!5747 (toList!6829 lt!439923) (tuple2!14929 lt!439767 zeroValue!1220)))))

(assert (= (and d!117983 res!662686) b!991500))

(assert (= (and b!991500 res!662685) b!991501))

(declare-fun m!919535 () Bool)

(assert (=> d!117983 m!919535))

(declare-fun m!919537 () Bool)

(assert (=> d!117983 m!919537))

(declare-fun m!919539 () Bool)

(assert (=> d!117983 m!919539))

(declare-fun m!919541 () Bool)

(assert (=> d!117983 m!919541))

(declare-fun m!919543 () Bool)

(assert (=> b!991500 m!919543))

(declare-fun m!919545 () Bool)

(assert (=> b!991501 m!919545))

(assert (=> b!991292 d!117983))

(declare-fun d!117985 () Bool)

(declare-fun e!559163 () Bool)

(assert (=> d!117985 e!559163))

(declare-fun res!662687 () Bool)

(assert (=> d!117985 (=> res!662687 e!559163)))

(declare-fun lt!439926 () Bool)

(assert (=> d!117985 (= res!662687 (not lt!439926))))

(declare-fun lt!439929 () Bool)

(assert (=> d!117985 (= lt!439926 lt!439929)))

(declare-fun lt!439928 () Unit!32849)

(declare-fun e!559164 () Unit!32849)

(assert (=> d!117985 (= lt!439928 e!559164)))

(declare-fun c!100757 () Bool)

(assert (=> d!117985 (= c!100757 lt!439929)))

(assert (=> d!117985 (= lt!439929 (containsKey!481 (toList!6829 (+!3117 lt!439780 (tuple2!14929 lt!439774 zeroValue!1220))) lt!439775))))

(assert (=> d!117985 (= (contains!5746 (+!3117 lt!439780 (tuple2!14929 lt!439774 zeroValue!1220)) lt!439775) lt!439926)))

(declare-fun b!991502 () Bool)

(declare-fun lt!439927 () Unit!32849)

(assert (=> b!991502 (= e!559164 lt!439927)))

(assert (=> b!991502 (= lt!439927 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6829 (+!3117 lt!439780 (tuple2!14929 lt!439774 zeroValue!1220))) lt!439775))))

(assert (=> b!991502 (isDefined!383 (getValueByKey!512 (toList!6829 (+!3117 lt!439780 (tuple2!14929 lt!439774 zeroValue!1220))) lt!439775))))

(declare-fun b!991503 () Bool)

(declare-fun Unit!32861 () Unit!32849)

(assert (=> b!991503 (= e!559164 Unit!32861)))

(declare-fun b!991504 () Bool)

(assert (=> b!991504 (= e!559163 (isDefined!383 (getValueByKey!512 (toList!6829 (+!3117 lt!439780 (tuple2!14929 lt!439774 zeroValue!1220))) lt!439775)))))

(assert (= (and d!117985 c!100757) b!991502))

(assert (= (and d!117985 (not c!100757)) b!991503))

(assert (= (and d!117985 (not res!662687)) b!991504))

(declare-fun m!919547 () Bool)

(assert (=> d!117985 m!919547))

(declare-fun m!919549 () Bool)

(assert (=> b!991502 m!919549))

(declare-fun m!919551 () Bool)

(assert (=> b!991502 m!919551))

(assert (=> b!991502 m!919551))

(declare-fun m!919553 () Bool)

(assert (=> b!991502 m!919553))

(assert (=> b!991504 m!919551))

(assert (=> b!991504 m!919551))

(assert (=> b!991504 m!919553))

(assert (=> b!991292 d!117985))

(declare-fun d!117987 () Bool)

(assert (=> d!117987 (= (apply!906 lt!439778 lt!439786) (get!15675 (getValueByKey!512 (toList!6829 lt!439778) lt!439786)))))

(declare-fun bs!28143 () Bool)

(assert (= bs!28143 d!117987))

(declare-fun m!919555 () Bool)

(assert (=> bs!28143 m!919555))

(assert (=> bs!28143 m!919555))

(declare-fun m!919557 () Bool)

(assert (=> bs!28143 m!919557))

(assert (=> b!991292 d!117987))

(declare-fun b!991506 () Bool)

(declare-fun e!559170 () Bool)

(assert (=> b!991506 (= e!559170 (validKeyInArray!0 (select (arr!30144 _keys!1544) from!1932)))))

(assert (=> b!991506 (bvsge from!1932 #b00000000000000000000000000000000)))

(declare-fun lt!439932 () ListLongMap!13627)

(declare-fun e!559168 () Bool)

(declare-fun b!991507 () Bool)

(assert (=> b!991507 (= e!559168 (= lt!439932 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun b!991508 () Bool)

(declare-fun e!559169 () ListLongMap!13627)

(assert (=> b!991508 (= e!559169 (ListLongMap!13628 Nil!20833))))

(declare-fun b!991509 () Bool)

(declare-fun e!559166 () ListLongMap!13627)

(assert (=> b!991509 (= e!559169 e!559166)))

(declare-fun c!100759 () Bool)

(assert (=> b!991509 (= c!100759 (validKeyInArray!0 (select (arr!30144 _keys!1544) from!1932)))))

(declare-fun call!42055 () ListLongMap!13627)

(declare-fun bm!42052 () Bool)

(assert (=> bm!42052 (= call!42055 (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!991510 () Bool)

(assert (=> b!991510 (= e!559166 call!42055)))

(declare-fun b!991511 () Bool)

(assert (=> b!991511 (= e!559168 (isEmpty!732 lt!439932))))

(declare-fun b!991512 () Bool)

(declare-fun e!559171 () Bool)

(declare-fun e!559167 () Bool)

(assert (=> b!991512 (= e!559171 e!559167)))

(declare-fun c!100758 () Bool)

(assert (=> b!991512 (= c!100758 e!559170)))

(declare-fun res!662690 () Bool)

(assert (=> b!991512 (=> (not res!662690) (not e!559170))))

(assert (=> b!991512 (= res!662690 (bvslt from!1932 (size!30624 _keys!1544)))))

(declare-fun b!991513 () Bool)

(declare-fun lt!439935 () Unit!32849)

(declare-fun lt!439931 () Unit!32849)

(assert (=> b!991513 (= lt!439935 lt!439931)))

(declare-fun lt!439930 () (_ BitVec 64))

(declare-fun lt!439934 () (_ BitVec 64))

(declare-fun lt!439933 () V!36041)

(declare-fun lt!439936 () ListLongMap!13627)

(assert (=> b!991513 (not (contains!5746 (+!3117 lt!439936 (tuple2!14929 lt!439930 lt!439933)) lt!439934))))

(assert (=> b!991513 (= lt!439931 (addStillNotContains!238 lt!439936 lt!439930 lt!439933 lt!439934))))

(assert (=> b!991513 (= lt!439934 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!991513 (= lt!439933 (get!15672 (select (arr!30143 _values!1278) from!1932) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!991513 (= lt!439930 (select (arr!30144 _keys!1544) from!1932))))

(assert (=> b!991513 (= lt!439936 call!42055)))

(assert (=> b!991513 (= e!559166 (+!3117 call!42055 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) (get!15672 (select (arr!30143 _values!1278) from!1932) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!991514 () Bool)

(assert (=> b!991514 (= e!559167 e!559168)))

(declare-fun c!100761 () Bool)

(assert (=> b!991514 (= c!100761 (bvslt from!1932 (size!30624 _keys!1544)))))

(declare-fun b!991515 () Bool)

(declare-fun res!662691 () Bool)

(assert (=> b!991515 (=> (not res!662691) (not e!559171))))

(assert (=> b!991515 (= res!662691 (not (contains!5746 lt!439932 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!991516 () Bool)

(assert (=> b!991516 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30624 _keys!1544)))))

(assert (=> b!991516 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30623 _values!1278)))))

(declare-fun e!559165 () Bool)

(assert (=> b!991516 (= e!559165 (= (apply!906 lt!439932 (select (arr!30144 _keys!1544) from!1932)) (get!15672 (select (arr!30143 _values!1278) from!1932) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!117989 () Bool)

(assert (=> d!117989 e!559171))

(declare-fun res!662688 () Bool)

(assert (=> d!117989 (=> (not res!662688) (not e!559171))))

(assert (=> d!117989 (= res!662688 (not (contains!5746 lt!439932 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117989 (= lt!439932 e!559169)))

(declare-fun c!100760 () Bool)

(assert (=> d!117989 (= c!100760 (bvsge from!1932 (size!30624 _keys!1544)))))

(assert (=> d!117989 (validMask!0 mask!1948)))

(assert (=> d!117989 (= (getCurrentListMapNoExtraKeys!3557 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) lt!439932)))

(declare-fun b!991505 () Bool)

(assert (=> b!991505 (= e!559167 e!559165)))

(assert (=> b!991505 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30624 _keys!1544)))))

(declare-fun res!662689 () Bool)

(assert (=> b!991505 (= res!662689 (contains!5746 lt!439932 (select (arr!30144 _keys!1544) from!1932)))))

(assert (=> b!991505 (=> (not res!662689) (not e!559165))))

(assert (= (and d!117989 c!100760) b!991508))

(assert (= (and d!117989 (not c!100760)) b!991509))

(assert (= (and b!991509 c!100759) b!991513))

(assert (= (and b!991509 (not c!100759)) b!991510))

(assert (= (or b!991513 b!991510) bm!42052))

(assert (= (and d!117989 res!662688) b!991515))

(assert (= (and b!991515 res!662691) b!991512))

(assert (= (and b!991512 res!662690) b!991506))

(assert (= (and b!991512 c!100758) b!991505))

(assert (= (and b!991512 (not c!100758)) b!991514))

(assert (= (and b!991505 res!662689) b!991516))

(assert (= (and b!991514 c!100761) b!991507))

(assert (= (and b!991514 (not c!100761)) b!991511))

(declare-fun b_lambda!15199 () Bool)

(assert (=> (not b_lambda!15199) (not b!991513)))

(assert (=> b!991513 t!29800))

(declare-fun b_and!32259 () Bool)

(assert (= b_and!32257 (and (=> t!29800 result!13639) b_and!32259)))

(declare-fun b_lambda!15201 () Bool)

(assert (=> (not b_lambda!15201) (not b!991516)))

(assert (=> b!991516 t!29800))

(declare-fun b_and!32261 () Bool)

(assert (= b_and!32259 (and (=> t!29800 result!13639) b_and!32261)))

(declare-fun m!919559 () Bool)

(assert (=> bm!42052 m!919559))

(assert (=> b!991506 m!918897))

(assert (=> b!991506 m!918897))

(assert (=> b!991506 m!918919))

(declare-fun m!919561 () Bool)

(assert (=> b!991515 m!919561))

(assert (=> b!991507 m!919559))

(declare-fun m!919563 () Bool)

(assert (=> b!991511 m!919563))

(assert (=> b!991513 m!918923))

(assert (=> b!991513 m!918927))

(assert (=> b!991513 m!918929))

(assert (=> b!991513 m!918927))

(assert (=> b!991513 m!918923))

(declare-fun m!919565 () Bool)

(assert (=> b!991513 m!919565))

(declare-fun m!919567 () Bool)

(assert (=> b!991513 m!919567))

(assert (=> b!991513 m!918897))

(declare-fun m!919569 () Bool)

(assert (=> b!991513 m!919569))

(declare-fun m!919571 () Bool)

(assert (=> b!991513 m!919571))

(assert (=> b!991513 m!919569))

(assert (=> b!991516 m!918923))

(assert (=> b!991516 m!918927))

(assert (=> b!991516 m!918929))

(assert (=> b!991516 m!918927))

(assert (=> b!991516 m!918923))

(assert (=> b!991516 m!918897))

(declare-fun m!919573 () Bool)

(assert (=> b!991516 m!919573))

(assert (=> b!991516 m!918897))

(declare-fun m!919575 () Bool)

(assert (=> d!117989 m!919575))

(assert (=> d!117989 m!918931))

(assert (=> b!991505 m!918897))

(assert (=> b!991505 m!918897))

(declare-fun m!919577 () Bool)

(assert (=> b!991505 m!919577))

(assert (=> b!991509 m!918897))

(assert (=> b!991509 m!918897))

(assert (=> b!991509 m!918919))

(assert (=> b!991292 d!117989))

(declare-fun d!117991 () Bool)

(declare-fun e!559172 () Bool)

(assert (=> d!117991 e!559172))

(declare-fun res!662693 () Bool)

(assert (=> d!117991 (=> (not res!662693) (not e!559172))))

(declare-fun lt!439938 () ListLongMap!13627)

(assert (=> d!117991 (= res!662693 (contains!5746 lt!439938 (_1!7475 (tuple2!14929 lt!439769 minValue!1220))))))

(declare-fun lt!439937 () List!20836)

(assert (=> d!117991 (= lt!439938 (ListLongMap!13628 lt!439937))))

(declare-fun lt!439939 () Unit!32849)

(declare-fun lt!439940 () Unit!32849)

(assert (=> d!117991 (= lt!439939 lt!439940)))

(assert (=> d!117991 (= (getValueByKey!512 lt!439937 (_1!7475 (tuple2!14929 lt!439769 minValue!1220))) (Some!517 (_2!7475 (tuple2!14929 lt!439769 minValue!1220))))))

(assert (=> d!117991 (= lt!439940 (lemmaContainsTupThenGetReturnValue!274 lt!439937 (_1!7475 (tuple2!14929 lt!439769 minValue!1220)) (_2!7475 (tuple2!14929 lt!439769 minValue!1220))))))

(assert (=> d!117991 (= lt!439937 (insertStrictlySorted!331 (toList!6829 lt!439778) (_1!7475 (tuple2!14929 lt!439769 minValue!1220)) (_2!7475 (tuple2!14929 lt!439769 minValue!1220))))))

(assert (=> d!117991 (= (+!3117 lt!439778 (tuple2!14929 lt!439769 minValue!1220)) lt!439938)))

(declare-fun b!991517 () Bool)

(declare-fun res!662692 () Bool)

(assert (=> b!991517 (=> (not res!662692) (not e!559172))))

(assert (=> b!991517 (= res!662692 (= (getValueByKey!512 (toList!6829 lt!439938) (_1!7475 (tuple2!14929 lt!439769 minValue!1220))) (Some!517 (_2!7475 (tuple2!14929 lt!439769 minValue!1220)))))))

(declare-fun b!991518 () Bool)

(assert (=> b!991518 (= e!559172 (contains!5747 (toList!6829 lt!439938) (tuple2!14929 lt!439769 minValue!1220)))))

(assert (= (and d!117991 res!662693) b!991517))

(assert (= (and b!991517 res!662692) b!991518))

(declare-fun m!919579 () Bool)

(assert (=> d!117991 m!919579))

(declare-fun m!919581 () Bool)

(assert (=> d!117991 m!919581))

(declare-fun m!919583 () Bool)

(assert (=> d!117991 m!919583))

(declare-fun m!919585 () Bool)

(assert (=> d!117991 m!919585))

(declare-fun m!919587 () Bool)

(assert (=> b!991517 m!919587))

(declare-fun m!919589 () Bool)

(assert (=> b!991518 m!919589))

(assert (=> b!991292 d!117991))

(declare-fun d!117993 () Bool)

(assert (=> d!117993 (= (apply!906 lt!439766 lt!439776) (get!15675 (getValueByKey!512 (toList!6829 lt!439766) lt!439776)))))

(declare-fun bs!28144 () Bool)

(assert (= bs!28144 d!117993))

(declare-fun m!919591 () Bool)

(assert (=> bs!28144 m!919591))

(assert (=> bs!28144 m!919591))

(declare-fun m!919593 () Bool)

(assert (=> bs!28144 m!919593))

(assert (=> b!991292 d!117993))

(declare-fun d!117995 () Bool)

(assert (=> d!117995 (contains!5746 (+!3117 lt!439780 (tuple2!14929 lt!439774 zeroValue!1220)) lt!439775)))

(declare-fun lt!439941 () Unit!32849)

(assert (=> d!117995 (= lt!439941 (choose!1623 lt!439780 lt!439774 zeroValue!1220 lt!439775))))

(assert (=> d!117995 (contains!5746 lt!439780 lt!439775)))

(assert (=> d!117995 (= (addStillContains!616 lt!439780 lt!439774 zeroValue!1220 lt!439775) lt!439941)))

(declare-fun bs!28145 () Bool)

(assert (= bs!28145 d!117995))

(assert (=> bs!28145 m!919139))

(assert (=> bs!28145 m!919139))

(assert (=> bs!28145 m!919145))

(declare-fun m!919595 () Bool)

(assert (=> bs!28145 m!919595))

(declare-fun m!919597 () Bool)

(assert (=> bs!28145 m!919597))

(assert (=> b!991292 d!117995))

(declare-fun d!117997 () Bool)

(assert (=> d!117997 (= (apply!906 (+!3117 lt!439778 (tuple2!14929 lt!439769 minValue!1220)) lt!439786) (apply!906 lt!439778 lt!439786))))

(declare-fun lt!439942 () Unit!32849)

(assert (=> d!117997 (= lt!439942 (choose!1624 lt!439778 lt!439769 minValue!1220 lt!439786))))

(declare-fun e!559173 () Bool)

(assert (=> d!117997 e!559173))

(declare-fun res!662694 () Bool)

(assert (=> d!117997 (=> (not res!662694) (not e!559173))))

(assert (=> d!117997 (= res!662694 (contains!5746 lt!439778 lt!439786))))

(assert (=> d!117997 (= (addApplyDifferent!472 lt!439778 lt!439769 minValue!1220 lt!439786) lt!439942)))

(declare-fun b!991519 () Bool)

(assert (=> b!991519 (= e!559173 (not (= lt!439786 lt!439769)))))

(assert (= (and d!117997 res!662694) b!991519))

(declare-fun m!919599 () Bool)

(assert (=> d!117997 m!919599))

(assert (=> d!117997 m!919151))

(assert (=> d!117997 m!919161))

(declare-fun m!919601 () Bool)

(assert (=> d!117997 m!919601))

(assert (=> d!117997 m!919155))

(assert (=> d!117997 m!919151))

(assert (=> b!991292 d!117997))

(declare-fun d!117999 () Bool)

(assert (=> d!117999 (= (apply!906 (+!3117 lt!439770 (tuple2!14929 lt!439765 minValue!1220)) lt!439777) (get!15675 (getValueByKey!512 (toList!6829 (+!3117 lt!439770 (tuple2!14929 lt!439765 minValue!1220))) lt!439777)))))

(declare-fun bs!28146 () Bool)

(assert (= bs!28146 d!117999))

(declare-fun m!919603 () Bool)

(assert (=> bs!28146 m!919603))

(assert (=> bs!28146 m!919603))

(declare-fun m!919605 () Bool)

(assert (=> bs!28146 m!919605))

(assert (=> b!991292 d!117999))

(declare-fun d!118001 () Bool)

(assert (=> d!118001 (= (apply!906 (+!3117 lt!439778 (tuple2!14929 lt!439769 minValue!1220)) lt!439786) (get!15675 (getValueByKey!512 (toList!6829 (+!3117 lt!439778 (tuple2!14929 lt!439769 minValue!1220))) lt!439786)))))

(declare-fun bs!28147 () Bool)

(assert (= bs!28147 d!118001))

(declare-fun m!919607 () Bool)

(assert (=> bs!28147 m!919607))

(assert (=> bs!28147 m!919607))

(declare-fun m!919609 () Bool)

(assert (=> bs!28147 m!919609))

(assert (=> b!991292 d!118001))

(declare-fun d!118003 () Bool)

(assert (=> d!118003 (= (apply!906 (+!3117 lt!439766 (tuple2!14929 lt!439767 zeroValue!1220)) lt!439776) (apply!906 lt!439766 lt!439776))))

(declare-fun lt!439943 () Unit!32849)

(assert (=> d!118003 (= lt!439943 (choose!1624 lt!439766 lt!439767 zeroValue!1220 lt!439776))))

(declare-fun e!559174 () Bool)

(assert (=> d!118003 e!559174))

(declare-fun res!662695 () Bool)

(assert (=> d!118003 (=> (not res!662695) (not e!559174))))

(assert (=> d!118003 (= res!662695 (contains!5746 lt!439766 lt!439776))))

(assert (=> d!118003 (= (addApplyDifferent!472 lt!439766 lt!439767 zeroValue!1220 lt!439776) lt!439943)))

(declare-fun b!991520 () Bool)

(assert (=> b!991520 (= e!559174 (not (= lt!439776 lt!439767)))))

(assert (= (and d!118003 res!662695) b!991520))

(declare-fun m!919611 () Bool)

(assert (=> d!118003 m!919611))

(assert (=> d!118003 m!919141))

(assert (=> d!118003 m!919143))

(declare-fun m!919613 () Bool)

(assert (=> d!118003 m!919613))

(assert (=> d!118003 m!919163))

(assert (=> d!118003 m!919141))

(assert (=> b!991292 d!118003))

(declare-fun d!118005 () Bool)

(declare-fun e!559175 () Bool)

(assert (=> d!118005 e!559175))

(declare-fun res!662697 () Bool)

(assert (=> d!118005 (=> (not res!662697) (not e!559175))))

(declare-fun lt!439945 () ListLongMap!13627)

(assert (=> d!118005 (= res!662697 (contains!5746 lt!439945 (_1!7475 (tuple2!14929 lt!439765 minValue!1220))))))

(declare-fun lt!439944 () List!20836)

(assert (=> d!118005 (= lt!439945 (ListLongMap!13628 lt!439944))))

(declare-fun lt!439946 () Unit!32849)

(declare-fun lt!439947 () Unit!32849)

(assert (=> d!118005 (= lt!439946 lt!439947)))

(assert (=> d!118005 (= (getValueByKey!512 lt!439944 (_1!7475 (tuple2!14929 lt!439765 minValue!1220))) (Some!517 (_2!7475 (tuple2!14929 lt!439765 minValue!1220))))))

(assert (=> d!118005 (= lt!439947 (lemmaContainsTupThenGetReturnValue!274 lt!439944 (_1!7475 (tuple2!14929 lt!439765 minValue!1220)) (_2!7475 (tuple2!14929 lt!439765 minValue!1220))))))

(assert (=> d!118005 (= lt!439944 (insertStrictlySorted!331 (toList!6829 lt!439770) (_1!7475 (tuple2!14929 lt!439765 minValue!1220)) (_2!7475 (tuple2!14929 lt!439765 minValue!1220))))))

(assert (=> d!118005 (= (+!3117 lt!439770 (tuple2!14929 lt!439765 minValue!1220)) lt!439945)))

(declare-fun b!991521 () Bool)

(declare-fun res!662696 () Bool)

(assert (=> b!991521 (=> (not res!662696) (not e!559175))))

(assert (=> b!991521 (= res!662696 (= (getValueByKey!512 (toList!6829 lt!439945) (_1!7475 (tuple2!14929 lt!439765 minValue!1220))) (Some!517 (_2!7475 (tuple2!14929 lt!439765 minValue!1220)))))))

(declare-fun b!991522 () Bool)

(assert (=> b!991522 (= e!559175 (contains!5747 (toList!6829 lt!439945) (tuple2!14929 lt!439765 minValue!1220)))))

(assert (= (and d!118005 res!662697) b!991521))

(assert (= (and b!991521 res!662696) b!991522))

(declare-fun m!919615 () Bool)

(assert (=> d!118005 m!919615))

(declare-fun m!919617 () Bool)

(assert (=> d!118005 m!919617))

(declare-fun m!919619 () Bool)

(assert (=> d!118005 m!919619))

(declare-fun m!919621 () Bool)

(assert (=> d!118005 m!919621))

(declare-fun m!919623 () Bool)

(assert (=> b!991521 m!919623))

(declare-fun m!919625 () Bool)

(assert (=> b!991522 m!919625))

(assert (=> b!991292 d!118005))

(declare-fun d!118007 () Bool)

(assert (=> d!118007 (= (apply!906 lt!439770 lt!439777) (get!15675 (getValueByKey!512 (toList!6829 lt!439770) lt!439777)))))

(declare-fun bs!28148 () Bool)

(assert (= bs!28148 d!118007))

(declare-fun m!919627 () Bool)

(assert (=> bs!28148 m!919627))

(assert (=> bs!28148 m!919627))

(declare-fun m!919629 () Bool)

(assert (=> bs!28148 m!919629))

(assert (=> b!991292 d!118007))

(declare-fun d!118009 () Bool)

(assert (=> d!118009 (= (apply!906 (+!3117 lt!439770 (tuple2!14929 lt!439765 minValue!1220)) lt!439777) (apply!906 lt!439770 lt!439777))))

(declare-fun lt!439948 () Unit!32849)

(assert (=> d!118009 (= lt!439948 (choose!1624 lt!439770 lt!439765 minValue!1220 lt!439777))))

(declare-fun e!559176 () Bool)

(assert (=> d!118009 e!559176))

(declare-fun res!662698 () Bool)

(assert (=> d!118009 (=> (not res!662698) (not e!559176))))

(assert (=> d!118009 (= res!662698 (contains!5746 lt!439770 lt!439777))))

(assert (=> d!118009 (= (addApplyDifferent!472 lt!439770 lt!439765 minValue!1220 lt!439777) lt!439948)))

(declare-fun b!991523 () Bool)

(assert (=> b!991523 (= e!559176 (not (= lt!439777 lt!439765)))))

(assert (= (and d!118009 res!662698) b!991523))

(declare-fun m!919631 () Bool)

(assert (=> d!118009 m!919631))

(assert (=> d!118009 m!919149))

(assert (=> d!118009 m!919167))

(declare-fun m!919633 () Bool)

(assert (=> d!118009 m!919633))

(assert (=> d!118009 m!919157))

(assert (=> d!118009 m!919149))

(assert (=> b!991292 d!118009))

(declare-fun d!118011 () Bool)

(assert (=> d!118011 (= (apply!906 (+!3117 lt!439766 (tuple2!14929 lt!439767 zeroValue!1220)) lt!439776) (get!15675 (getValueByKey!512 (toList!6829 (+!3117 lt!439766 (tuple2!14929 lt!439767 zeroValue!1220))) lt!439776)))))

(declare-fun bs!28149 () Bool)

(assert (= bs!28149 d!118011))

(declare-fun m!919635 () Bool)

(assert (=> bs!28149 m!919635))

(assert (=> bs!28149 m!919635))

(declare-fun m!919637 () Bool)

(assert (=> bs!28149 m!919637))

(assert (=> b!991292 d!118011))

(declare-fun d!118013 () Bool)

(declare-fun e!559177 () Bool)

(assert (=> d!118013 e!559177))

(declare-fun res!662700 () Bool)

(assert (=> d!118013 (=> (not res!662700) (not e!559177))))

(declare-fun lt!439950 () ListLongMap!13627)

(assert (=> d!118013 (= res!662700 (contains!5746 lt!439950 (_1!7475 (tuple2!14929 lt!439774 zeroValue!1220))))))

(declare-fun lt!439949 () List!20836)

(assert (=> d!118013 (= lt!439950 (ListLongMap!13628 lt!439949))))

(declare-fun lt!439951 () Unit!32849)

(declare-fun lt!439952 () Unit!32849)

(assert (=> d!118013 (= lt!439951 lt!439952)))

(assert (=> d!118013 (= (getValueByKey!512 lt!439949 (_1!7475 (tuple2!14929 lt!439774 zeroValue!1220))) (Some!517 (_2!7475 (tuple2!14929 lt!439774 zeroValue!1220))))))

(assert (=> d!118013 (= lt!439952 (lemmaContainsTupThenGetReturnValue!274 lt!439949 (_1!7475 (tuple2!14929 lt!439774 zeroValue!1220)) (_2!7475 (tuple2!14929 lt!439774 zeroValue!1220))))))

(assert (=> d!118013 (= lt!439949 (insertStrictlySorted!331 (toList!6829 lt!439780) (_1!7475 (tuple2!14929 lt!439774 zeroValue!1220)) (_2!7475 (tuple2!14929 lt!439774 zeroValue!1220))))))

(assert (=> d!118013 (= (+!3117 lt!439780 (tuple2!14929 lt!439774 zeroValue!1220)) lt!439950)))

(declare-fun b!991524 () Bool)

(declare-fun res!662699 () Bool)

(assert (=> b!991524 (=> (not res!662699) (not e!559177))))

(assert (=> b!991524 (= res!662699 (= (getValueByKey!512 (toList!6829 lt!439950) (_1!7475 (tuple2!14929 lt!439774 zeroValue!1220))) (Some!517 (_2!7475 (tuple2!14929 lt!439774 zeroValue!1220)))))))

(declare-fun b!991525 () Bool)

(assert (=> b!991525 (= e!559177 (contains!5747 (toList!6829 lt!439950) (tuple2!14929 lt!439774 zeroValue!1220)))))

(assert (= (and d!118013 res!662700) b!991524))

(assert (= (and b!991524 res!662699) b!991525))

(declare-fun m!919639 () Bool)

(assert (=> d!118013 m!919639))

(declare-fun m!919641 () Bool)

(assert (=> d!118013 m!919641))

(declare-fun m!919643 () Bool)

(assert (=> d!118013 m!919643))

(declare-fun m!919645 () Bool)

(assert (=> d!118013 m!919645))

(declare-fun m!919647 () Bool)

(assert (=> b!991524 m!919647))

(declare-fun m!919649 () Bool)

(assert (=> b!991525 m!919649))

(assert (=> b!991292 d!118013))

(declare-fun d!118015 () Bool)

(declare-fun isEmpty!733 (List!20836) Bool)

(assert (=> d!118015 (= (isEmpty!732 lt!439811) (isEmpty!733 (toList!6829 lt!439811)))))

(declare-fun bs!28150 () Bool)

(assert (= bs!28150 d!118015))

(declare-fun m!919651 () Bool)

(assert (=> bs!28150 m!919651))

(assert (=> b!991347 d!118015))

(declare-fun b!991526 () Bool)

(declare-fun e!559178 () Bool)

(declare-fun call!42056 () Bool)

(assert (=> b!991526 (= e!559178 call!42056)))

(declare-fun d!118017 () Bool)

(declare-fun res!662702 () Bool)

(declare-fun e!559181 () Bool)

(assert (=> d!118017 (=> res!662702 e!559181)))

(assert (=> d!118017 (= res!662702 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30624 _keys!1544)))))

(assert (=> d!118017 (= (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100684 (Cons!20833 (select (arr!30144 _keys!1544) #b00000000000000000000000000000000) Nil!20834) Nil!20834)) e!559181)))

(declare-fun b!991527 () Bool)

(declare-fun e!559179 () Bool)

(assert (=> b!991527 (= e!559179 e!559178)))

(declare-fun c!100762 () Bool)

(assert (=> b!991527 (= c!100762 (validKeyInArray!0 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!991528 () Bool)

(declare-fun e!559180 () Bool)

(assert (=> b!991528 (= e!559180 (contains!5745 (ite c!100684 (Cons!20833 (select (arr!30144 _keys!1544) #b00000000000000000000000000000000) Nil!20834) Nil!20834) (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!42053 () Bool)

(assert (=> bm!42053 (= call!42056 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!100762 (Cons!20833 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!100684 (Cons!20833 (select (arr!30144 _keys!1544) #b00000000000000000000000000000000) Nil!20834) Nil!20834)) (ite c!100684 (Cons!20833 (select (arr!30144 _keys!1544) #b00000000000000000000000000000000) Nil!20834) Nil!20834))))))

(declare-fun b!991529 () Bool)

(assert (=> b!991529 (= e!559178 call!42056)))

(declare-fun b!991530 () Bool)

(assert (=> b!991530 (= e!559181 e!559179)))

(declare-fun res!662701 () Bool)

(assert (=> b!991530 (=> (not res!662701) (not e!559179))))

(assert (=> b!991530 (= res!662701 (not e!559180))))

(declare-fun res!662703 () Bool)

(assert (=> b!991530 (=> (not res!662703) (not e!559180))))

(assert (=> b!991530 (= res!662703 (validKeyInArray!0 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!118017 (not res!662702)) b!991530))

(assert (= (and b!991530 res!662703) b!991528))

(assert (= (and b!991530 res!662701) b!991527))

(assert (= (and b!991527 c!100762) b!991526))

(assert (= (and b!991527 (not c!100762)) b!991529))

(assert (= (or b!991526 b!991529) bm!42053))

(declare-fun m!919653 () Bool)

(assert (=> b!991527 m!919653))

(assert (=> b!991527 m!919653))

(declare-fun m!919655 () Bool)

(assert (=> b!991527 m!919655))

(assert (=> b!991528 m!919653))

(assert (=> b!991528 m!919653))

(declare-fun m!919657 () Bool)

(assert (=> b!991528 m!919657))

(assert (=> bm!42053 m!919653))

(declare-fun m!919659 () Bool)

(assert (=> bm!42053 m!919659))

(assert (=> b!991530 m!919653))

(assert (=> b!991530 m!919653))

(assert (=> b!991530 m!919655))

(assert (=> bm!42010 d!118017))

(declare-fun b!991534 () Bool)

(declare-fun e!559183 () Option!518)

(assert (=> b!991534 (= e!559183 None!516)))

(declare-fun b!991531 () Bool)

(declare-fun e!559182 () Option!518)

(assert (=> b!991531 (= e!559182 (Some!517 (_2!7475 (h!22000 (toList!6829 lt!439696)))))))

(declare-fun d!118019 () Bool)

(declare-fun c!100763 () Bool)

(assert (=> d!118019 (= c!100763 (and ((_ is Cons!20832) (toList!6829 lt!439696)) (= (_1!7475 (h!22000 (toList!6829 lt!439696))) (_1!7475 lt!439635))))))

(assert (=> d!118019 (= (getValueByKey!512 (toList!6829 lt!439696) (_1!7475 lt!439635)) e!559182)))

(declare-fun b!991532 () Bool)

(assert (=> b!991532 (= e!559182 e!559183)))

(declare-fun c!100764 () Bool)

(assert (=> b!991532 (= c!100764 (and ((_ is Cons!20832) (toList!6829 lt!439696)) (not (= (_1!7475 (h!22000 (toList!6829 lt!439696))) (_1!7475 lt!439635)))))))

(declare-fun b!991533 () Bool)

(assert (=> b!991533 (= e!559183 (getValueByKey!512 (t!29801 (toList!6829 lt!439696)) (_1!7475 lt!439635)))))

(assert (= (and d!118019 c!100763) b!991531))

(assert (= (and d!118019 (not c!100763)) b!991532))

(assert (= (and b!991532 c!100764) b!991533))

(assert (= (and b!991532 (not c!100764)) b!991534))

(declare-fun m!919661 () Bool)

(assert (=> b!991533 m!919661))

(assert (=> b!991221 d!118019))

(assert (=> d!117885 d!117867))

(declare-fun b!991538 () Bool)

(declare-fun e!559185 () Option!518)

(assert (=> b!991538 (= e!559185 None!516)))

(declare-fun b!991535 () Bool)

(declare-fun e!559184 () Option!518)

(assert (=> b!991535 (= e!559184 (Some!517 (_2!7475 (h!22000 (toList!6829 lt!439692)))))))

(declare-fun d!118021 () Bool)

(declare-fun c!100765 () Bool)

(assert (=> d!118021 (= c!100765 (and ((_ is Cons!20832) (toList!6829 lt!439692)) (= (_1!7475 (h!22000 (toList!6829 lt!439692))) (_1!7475 lt!439633))))))

(assert (=> d!118021 (= (getValueByKey!512 (toList!6829 lt!439692) (_1!7475 lt!439633)) e!559184)))

(declare-fun b!991536 () Bool)

(assert (=> b!991536 (= e!559184 e!559185)))

(declare-fun c!100766 () Bool)

(assert (=> b!991536 (= c!100766 (and ((_ is Cons!20832) (toList!6829 lt!439692)) (not (= (_1!7475 (h!22000 (toList!6829 lt!439692))) (_1!7475 lt!439633)))))))

(declare-fun b!991537 () Bool)

(assert (=> b!991537 (= e!559185 (getValueByKey!512 (t!29801 (toList!6829 lt!439692)) (_1!7475 lt!439633)))))

(assert (= (and d!118021 c!100765) b!991535))

(assert (= (and d!118021 (not c!100765)) b!991536))

(assert (= (and b!991536 c!100766) b!991537))

(assert (= (and b!991536 (not c!100766)) b!991538))

(declare-fun m!919663 () Bool)

(assert (=> b!991537 m!919663))

(assert (=> b!991219 d!118021))

(assert (=> b!991209 d!117935))

(declare-fun b!991542 () Bool)

(declare-fun e!559187 () Option!518)

(assert (=> b!991542 (= e!559187 None!516)))

(declare-fun b!991539 () Bool)

(declare-fun e!559186 () Option!518)

(assert (=> b!991539 (= e!559186 (Some!517 (_2!7475 (h!22000 (toList!6829 lt!439792)))))))

(declare-fun d!118023 () Bool)

(declare-fun c!100767 () Bool)

(assert (=> d!118023 (= c!100767 (and ((_ is Cons!20832) (toList!6829 lt!439792)) (= (_1!7475 (h!22000 (toList!6829 lt!439792))) (_1!7475 lt!439633))))))

(assert (=> d!118023 (= (getValueByKey!512 (toList!6829 lt!439792) (_1!7475 lt!439633)) e!559186)))

(declare-fun b!991540 () Bool)

(assert (=> b!991540 (= e!559186 e!559187)))

(declare-fun c!100768 () Bool)

(assert (=> b!991540 (= c!100768 (and ((_ is Cons!20832) (toList!6829 lt!439792)) (not (= (_1!7475 (h!22000 (toList!6829 lt!439792))) (_1!7475 lt!439633)))))))

(declare-fun b!991541 () Bool)

(assert (=> b!991541 (= e!559187 (getValueByKey!512 (t!29801 (toList!6829 lt!439792)) (_1!7475 lt!439633)))))

(assert (= (and d!118023 c!100767) b!991539))

(assert (= (and d!118023 (not c!100767)) b!991540))

(assert (= (and b!991540 c!100768) b!991541))

(assert (= (and b!991540 (not c!100768)) b!991542))

(declare-fun m!919665 () Bool)

(assert (=> b!991541 m!919665))

(assert (=> b!991309 d!118023))

(assert (=> b!991265 d!117901))

(assert (=> bm!42041 d!117913))

(declare-fun d!118025 () Bool)

(declare-fun e!559188 () Bool)

(assert (=> d!118025 e!559188))

(declare-fun res!662705 () Bool)

(assert (=> d!118025 (=> (not res!662705) (not e!559188))))

(declare-fun lt!439954 () ListLongMap!13627)

(assert (=> d!118025 (= res!662705 (contains!5746 lt!439954 (_1!7475 (ite (or c!100704 c!100706) (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun lt!439953 () List!20836)

(assert (=> d!118025 (= lt!439954 (ListLongMap!13628 lt!439953))))

(declare-fun lt!439955 () Unit!32849)

(declare-fun lt!439956 () Unit!32849)

(assert (=> d!118025 (= lt!439955 lt!439956)))

(assert (=> d!118025 (= (getValueByKey!512 lt!439953 (_1!7475 (ite (or c!100704 c!100706) (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!517 (_2!7475 (ite (or c!100704 c!100706) (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!118025 (= lt!439956 (lemmaContainsTupThenGetReturnValue!274 lt!439953 (_1!7475 (ite (or c!100704 c!100706) (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7475 (ite (or c!100704 c!100706) (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!118025 (= lt!439953 (insertStrictlySorted!331 (toList!6829 (ite c!100704 call!42036 (ite c!100706 call!42039 call!42035))) (_1!7475 (ite (or c!100704 c!100706) (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7475 (ite (or c!100704 c!100706) (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!118025 (= (+!3117 (ite c!100704 call!42036 (ite c!100706 call!42039 call!42035)) (ite (or c!100704 c!100706) (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) lt!439954)))

(declare-fun b!991543 () Bool)

(declare-fun res!662704 () Bool)

(assert (=> b!991543 (=> (not res!662704) (not e!559188))))

(assert (=> b!991543 (= res!662704 (= (getValueByKey!512 (toList!6829 lt!439954) (_1!7475 (ite (or c!100704 c!100706) (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!517 (_2!7475 (ite (or c!100704 c!100706) (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))))

(declare-fun b!991544 () Bool)

(assert (=> b!991544 (= e!559188 (contains!5747 (toList!6829 lt!439954) (ite (or c!100704 c!100706) (tuple2!14929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!118025 res!662705) b!991543))

(assert (= (and b!991543 res!662704) b!991544))

(declare-fun m!919667 () Bool)

(assert (=> d!118025 m!919667))

(declare-fun m!919669 () Bool)

(assert (=> d!118025 m!919669))

(declare-fun m!919671 () Bool)

(assert (=> d!118025 m!919671))

(declare-fun m!919673 () Bool)

(assert (=> d!118025 m!919673))

(declare-fun m!919675 () Bool)

(assert (=> b!991543 m!919675))

(declare-fun m!919677 () Bool)

(assert (=> b!991544 m!919677))

(assert (=> bm!42034 d!118025))

(declare-fun d!118027 () Bool)

(declare-fun e!559189 () Bool)

(assert (=> d!118027 e!559189))

(declare-fun res!662706 () Bool)

(assert (=> d!118027 (=> res!662706 e!559189)))

(declare-fun lt!439957 () Bool)

(assert (=> d!118027 (= res!662706 (not lt!439957))))

(declare-fun lt!439960 () Bool)

(assert (=> d!118027 (= lt!439957 lt!439960)))

(declare-fun lt!439959 () Unit!32849)

(declare-fun e!559190 () Unit!32849)

(assert (=> d!118027 (= lt!439959 e!559190)))

(declare-fun c!100769 () Bool)

(assert (=> d!118027 (= c!100769 lt!439960)))

(assert (=> d!118027 (= lt!439960 (containsKey!481 (toList!6829 lt!439760) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!118027 (= (contains!5746 lt!439760 #b1000000000000000000000000000000000000000000000000000000000000000) lt!439957)))

(declare-fun b!991545 () Bool)

(declare-fun lt!439958 () Unit!32849)

(assert (=> b!991545 (= e!559190 lt!439958)))

(assert (=> b!991545 (= lt!439958 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6829 lt!439760) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!991545 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439760) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991546 () Bool)

(declare-fun Unit!32862 () Unit!32849)

(assert (=> b!991546 (= e!559190 Unit!32862)))

(declare-fun b!991547 () Bool)

(assert (=> b!991547 (= e!559189 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439760) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!118027 c!100769) b!991545))

(assert (= (and d!118027 (not c!100769)) b!991546))

(assert (= (and d!118027 (not res!662706)) b!991547))

(declare-fun m!919679 () Bool)

(assert (=> d!118027 m!919679))

(declare-fun m!919681 () Bool)

(assert (=> b!991545 m!919681))

(assert (=> b!991545 m!919343))

(assert (=> b!991545 m!919343))

(declare-fun m!919683 () Bool)

(assert (=> b!991545 m!919683))

(assert (=> b!991547 m!919343))

(assert (=> b!991547 m!919343))

(assert (=> b!991547 m!919683))

(assert (=> bm!42031 d!118027))

(declare-fun b!991551 () Bool)

(declare-fun e!559192 () Option!518)

(assert (=> b!991551 (= e!559192 None!516)))

(declare-fun b!991548 () Bool)

(declare-fun e!559191 () Option!518)

(assert (=> b!991548 (= e!559191 (Some!517 (_2!7475 (h!22000 (toList!6829 lt!439788)))))))

(declare-fun d!118029 () Bool)

(declare-fun c!100770 () Bool)

(assert (=> d!118029 (= c!100770 (and ((_ is Cons!20832) (toList!6829 lt!439788)) (= (_1!7475 (h!22000 (toList!6829 lt!439788))) (_1!7475 lt!439635))))))

(assert (=> d!118029 (= (getValueByKey!512 (toList!6829 lt!439788) (_1!7475 lt!439635)) e!559191)))

(declare-fun b!991549 () Bool)

(assert (=> b!991549 (= e!559191 e!559192)))

(declare-fun c!100771 () Bool)

(assert (=> b!991549 (= c!100771 (and ((_ is Cons!20832) (toList!6829 lt!439788)) (not (= (_1!7475 (h!22000 (toList!6829 lt!439788))) (_1!7475 lt!439635)))))))

(declare-fun b!991550 () Bool)

(assert (=> b!991550 (= e!559192 (getValueByKey!512 (t!29801 (toList!6829 lt!439788)) (_1!7475 lt!439635)))))

(assert (= (and d!118029 c!100770) b!991548))

(assert (= (and d!118029 (not c!100770)) b!991549))

(assert (= (and b!991549 c!100771) b!991550))

(assert (= (and b!991549 (not c!100771)) b!991551))

(declare-fun m!919685 () Bool)

(assert (=> b!991550 m!919685))

(assert (=> b!991307 d!118029))

(declare-fun b!991555 () Bool)

(declare-fun e!559194 () Option!518)

(assert (=> b!991555 (= e!559194 None!516)))

(declare-fun b!991552 () Bool)

(declare-fun e!559193 () Option!518)

(assert (=> b!991552 (= e!559193 (Some!517 (_2!7475 (h!22000 (toList!6829 lt!439685)))))))

(declare-fun d!118031 () Bool)

(declare-fun c!100772 () Bool)

(assert (=> d!118031 (= c!100772 (and ((_ is Cons!20832) (toList!6829 lt!439685)) (= (_1!7475 (h!22000 (toList!6829 lt!439685))) (_1!7475 lt!439635))))))

(assert (=> d!118031 (= (getValueByKey!512 (toList!6829 lt!439685) (_1!7475 lt!439635)) e!559193)))

(declare-fun b!991553 () Bool)

(assert (=> b!991553 (= e!559193 e!559194)))

(declare-fun c!100773 () Bool)

(assert (=> b!991553 (= c!100773 (and ((_ is Cons!20832) (toList!6829 lt!439685)) (not (= (_1!7475 (h!22000 (toList!6829 lt!439685))) (_1!7475 lt!439635)))))))

(declare-fun b!991554 () Bool)

(assert (=> b!991554 (= e!559194 (getValueByKey!512 (t!29801 (toList!6829 lt!439685)) (_1!7475 lt!439635)))))

(assert (= (and d!118031 c!100772) b!991552))

(assert (= (and d!118031 (not c!100772)) b!991553))

(assert (= (and b!991553 c!100773) b!991554))

(assert (= (and b!991553 (not c!100773)) b!991555))

(declare-fun m!919687 () Bool)

(assert (=> b!991554 m!919687))

(assert (=> b!991217 d!118031))

(assert (=> d!117883 d!117867))

(assert (=> b!991342 d!117901))

(assert (=> b!991286 d!117863))

(declare-fun d!118033 () Bool)

(assert (=> d!118033 (= (apply!906 lt!439760 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15675 (getValueByKey!512 (toList!6829 lt!439760) (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(declare-fun bs!28151 () Bool)

(assert (= bs!28151 d!118033))

(assert (=> bs!28151 m!919079))

(assert (=> bs!28151 m!919323))

(assert (=> bs!28151 m!919323))

(declare-fun m!919689 () Bool)

(assert (=> bs!28151 m!919689))

(assert (=> b!991277 d!118033))

(assert (=> b!991277 d!117977))

(declare-fun d!118035 () Bool)

(declare-fun e!559195 () Bool)

(assert (=> d!118035 e!559195))

(declare-fun res!662707 () Bool)

(assert (=> d!118035 (=> res!662707 e!559195)))

(declare-fun lt!439961 () Bool)

(assert (=> d!118035 (= res!662707 (not lt!439961))))

(declare-fun lt!439964 () Bool)

(assert (=> d!118035 (= lt!439961 lt!439964)))

(declare-fun lt!439963 () Unit!32849)

(declare-fun e!559196 () Unit!32849)

(assert (=> d!118035 (= lt!439963 e!559196)))

(declare-fun c!100774 () Bool)

(assert (=> d!118035 (= c!100774 lt!439964)))

(assert (=> d!118035 (= lt!439964 (containsKey!481 (toList!6829 lt!439696) (_1!7475 lt!439635)))))

(assert (=> d!118035 (= (contains!5746 lt!439696 (_1!7475 lt!439635)) lt!439961)))

(declare-fun b!991556 () Bool)

(declare-fun lt!439962 () Unit!32849)

(assert (=> b!991556 (= e!559196 lt!439962)))

(assert (=> b!991556 (= lt!439962 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6829 lt!439696) (_1!7475 lt!439635)))))

(assert (=> b!991556 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439696) (_1!7475 lt!439635)))))

(declare-fun b!991557 () Bool)

(declare-fun Unit!32863 () Unit!32849)

(assert (=> b!991557 (= e!559196 Unit!32863)))

(declare-fun b!991558 () Bool)

(assert (=> b!991558 (= e!559195 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439696) (_1!7475 lt!439635))))))

(assert (= (and d!118035 c!100774) b!991556))

(assert (= (and d!118035 (not c!100774)) b!991557))

(assert (= (and d!118035 (not res!662707)) b!991558))

(declare-fun m!919691 () Bool)

(assert (=> d!118035 m!919691))

(declare-fun m!919693 () Bool)

(assert (=> b!991556 m!919693))

(assert (=> b!991556 m!919075))

(assert (=> b!991556 m!919075))

(declare-fun m!919695 () Bool)

(assert (=> b!991556 m!919695))

(assert (=> b!991558 m!919075))

(assert (=> b!991558 m!919075))

(assert (=> b!991558 m!919695))

(assert (=> d!117881 d!118035))

(declare-fun b!991562 () Bool)

(declare-fun e!559198 () Option!518)

(assert (=> b!991562 (= e!559198 None!516)))

(declare-fun b!991559 () Bool)

(declare-fun e!559197 () Option!518)

(assert (=> b!991559 (= e!559197 (Some!517 (_2!7475 (h!22000 lt!439695))))))

(declare-fun d!118037 () Bool)

(declare-fun c!100775 () Bool)

(assert (=> d!118037 (= c!100775 (and ((_ is Cons!20832) lt!439695) (= (_1!7475 (h!22000 lt!439695)) (_1!7475 lt!439635))))))

(assert (=> d!118037 (= (getValueByKey!512 lt!439695 (_1!7475 lt!439635)) e!559197)))

(declare-fun b!991560 () Bool)

(assert (=> b!991560 (= e!559197 e!559198)))

(declare-fun c!100776 () Bool)

(assert (=> b!991560 (= c!100776 (and ((_ is Cons!20832) lt!439695) (not (= (_1!7475 (h!22000 lt!439695)) (_1!7475 lt!439635)))))))

(declare-fun b!991561 () Bool)

(assert (=> b!991561 (= e!559198 (getValueByKey!512 (t!29801 lt!439695) (_1!7475 lt!439635)))))

(assert (= (and d!118037 c!100775) b!991559))

(assert (= (and d!118037 (not c!100775)) b!991560))

(assert (= (and b!991560 c!100776) b!991561))

(assert (= (and b!991560 (not c!100776)) b!991562))

(declare-fun m!919697 () Bool)

(assert (=> b!991561 m!919697))

(assert (=> d!117881 d!118037))

(declare-fun d!118039 () Bool)

(assert (=> d!118039 (= (getValueByKey!512 lt!439695 (_1!7475 lt!439635)) (Some!517 (_2!7475 lt!439635)))))

(declare-fun lt!439965 () Unit!32849)

(assert (=> d!118039 (= lt!439965 (choose!1622 lt!439695 (_1!7475 lt!439635) (_2!7475 lt!439635)))))

(declare-fun e!559199 () Bool)

(assert (=> d!118039 e!559199))

(declare-fun res!662708 () Bool)

(assert (=> d!118039 (=> (not res!662708) (not e!559199))))

(assert (=> d!118039 (= res!662708 (isStrictlySorted!505 lt!439695))))

(assert (=> d!118039 (= (lemmaContainsTupThenGetReturnValue!274 lt!439695 (_1!7475 lt!439635) (_2!7475 lt!439635)) lt!439965)))

(declare-fun b!991563 () Bool)

(declare-fun res!662709 () Bool)

(assert (=> b!991563 (=> (not res!662709) (not e!559199))))

(assert (=> b!991563 (= res!662709 (containsKey!481 lt!439695 (_1!7475 lt!439635)))))

(declare-fun b!991564 () Bool)

(assert (=> b!991564 (= e!559199 (contains!5747 lt!439695 (tuple2!14929 (_1!7475 lt!439635) (_2!7475 lt!439635))))))

(assert (= (and d!118039 res!662708) b!991563))

(assert (= (and b!991563 res!662709) b!991564))

(assert (=> d!118039 m!919069))

(declare-fun m!919699 () Bool)

(assert (=> d!118039 m!919699))

(declare-fun m!919701 () Bool)

(assert (=> d!118039 m!919701))

(declare-fun m!919703 () Bool)

(assert (=> b!991563 m!919703))

(declare-fun m!919705 () Bool)

(assert (=> b!991564 m!919705))

(assert (=> d!117881 d!118039))

(declare-fun b!991565 () Bool)

(declare-fun c!100780 () Bool)

(declare-fun c!100777 () Bool)

(declare-fun e!559203 () List!20836)

(assert (=> b!991565 (= e!559203 (ite c!100780 (t!29801 (toList!6829 (+!3117 lt!439632 lt!439633))) (ite c!100777 (Cons!20832 (h!22000 (toList!6829 (+!3117 lt!439632 lt!439633))) (t!29801 (toList!6829 (+!3117 lt!439632 lt!439633)))) Nil!20833)))))

(declare-fun bm!42054 () Bool)

(declare-fun call!42058 () List!20836)

(declare-fun call!42059 () List!20836)

(assert (=> bm!42054 (= call!42058 call!42059)))

(declare-fun bm!42055 () Bool)

(declare-fun c!100779 () Bool)

(assert (=> bm!42055 (= call!42059 ($colon$colon!555 e!559203 (ite c!100779 (h!22000 (toList!6829 (+!3117 lt!439632 lt!439633))) (tuple2!14929 (_1!7475 lt!439635) (_2!7475 lt!439635)))))))

(declare-fun c!100778 () Bool)

(assert (=> bm!42055 (= c!100778 c!100779)))

(declare-fun b!991566 () Bool)

(declare-fun e!559204 () Bool)

(declare-fun lt!439966 () List!20836)

(assert (=> b!991566 (= e!559204 (contains!5747 lt!439966 (tuple2!14929 (_1!7475 lt!439635) (_2!7475 lt!439635))))))

(declare-fun b!991567 () Bool)

(declare-fun e!559201 () List!20836)

(assert (=> b!991567 (= e!559201 call!42059)))

(declare-fun b!991568 () Bool)

(declare-fun res!662711 () Bool)

(assert (=> b!991568 (=> (not res!662711) (not e!559204))))

(assert (=> b!991568 (= res!662711 (containsKey!481 lt!439966 (_1!7475 lt!439635)))))

(declare-fun b!991569 () Bool)

(declare-fun e!559202 () List!20836)

(declare-fun call!42057 () List!20836)

(assert (=> b!991569 (= e!559202 call!42057)))

(declare-fun d!118041 () Bool)

(assert (=> d!118041 e!559204))

(declare-fun res!662710 () Bool)

(assert (=> d!118041 (=> (not res!662710) (not e!559204))))

(assert (=> d!118041 (= res!662710 (isStrictlySorted!505 lt!439966))))

(assert (=> d!118041 (= lt!439966 e!559201)))

(assert (=> d!118041 (= c!100779 (and ((_ is Cons!20832) (toList!6829 (+!3117 lt!439632 lt!439633))) (bvslt (_1!7475 (h!22000 (toList!6829 (+!3117 lt!439632 lt!439633)))) (_1!7475 lt!439635))))))

(assert (=> d!118041 (isStrictlySorted!505 (toList!6829 (+!3117 lt!439632 lt!439633)))))

(assert (=> d!118041 (= (insertStrictlySorted!331 (toList!6829 (+!3117 lt!439632 lt!439633)) (_1!7475 lt!439635) (_2!7475 lt!439635)) lt!439966)))

(declare-fun b!991570 () Bool)

(assert (=> b!991570 (= e!559203 (insertStrictlySorted!331 (t!29801 (toList!6829 (+!3117 lt!439632 lt!439633))) (_1!7475 lt!439635) (_2!7475 lt!439635)))))

(declare-fun b!991571 () Bool)

(assert (=> b!991571 (= e!559202 call!42057)))

(declare-fun b!991572 () Bool)

(declare-fun e!559200 () List!20836)

(assert (=> b!991572 (= e!559201 e!559200)))

(assert (=> b!991572 (= c!100780 (and ((_ is Cons!20832) (toList!6829 (+!3117 lt!439632 lt!439633))) (= (_1!7475 (h!22000 (toList!6829 (+!3117 lt!439632 lt!439633)))) (_1!7475 lt!439635))))))

(declare-fun b!991573 () Bool)

(assert (=> b!991573 (= e!559200 call!42058)))

(declare-fun b!991574 () Bool)

(assert (=> b!991574 (= c!100777 (and ((_ is Cons!20832) (toList!6829 (+!3117 lt!439632 lt!439633))) (bvsgt (_1!7475 (h!22000 (toList!6829 (+!3117 lt!439632 lt!439633)))) (_1!7475 lt!439635))))))

(assert (=> b!991574 (= e!559200 e!559202)))

(declare-fun bm!42056 () Bool)

(assert (=> bm!42056 (= call!42057 call!42058)))

(assert (= (and d!118041 c!100779) b!991567))

(assert (= (and d!118041 (not c!100779)) b!991572))

(assert (= (and b!991572 c!100780) b!991573))

(assert (= (and b!991572 (not c!100780)) b!991574))

(assert (= (and b!991574 c!100777) b!991571))

(assert (= (and b!991574 (not c!100777)) b!991569))

(assert (= (or b!991571 b!991569) bm!42056))

(assert (= (or b!991573 bm!42056) bm!42054))

(assert (= (or b!991567 bm!42054) bm!42055))

(assert (= (and bm!42055 c!100778) b!991570))

(assert (= (and bm!42055 (not c!100778)) b!991565))

(assert (= (and d!118041 res!662710) b!991568))

(assert (= (and b!991568 res!662711) b!991566))

(declare-fun m!919707 () Bool)

(assert (=> bm!42055 m!919707))

(declare-fun m!919709 () Bool)

(assert (=> b!991570 m!919709))

(declare-fun m!919711 () Bool)

(assert (=> d!118041 m!919711))

(declare-fun m!919713 () Bool)

(assert (=> d!118041 m!919713))

(declare-fun m!919715 () Bool)

(assert (=> b!991566 m!919715))

(declare-fun m!919717 () Bool)

(assert (=> b!991568 m!919717))

(assert (=> d!117881 d!118041))

(declare-fun d!118043 () Bool)

(declare-fun e!559205 () Bool)

(assert (=> d!118043 e!559205))

(declare-fun res!662712 () Bool)

(assert (=> d!118043 (=> res!662712 e!559205)))

(declare-fun lt!439967 () Bool)

(assert (=> d!118043 (= res!662712 (not lt!439967))))

(declare-fun lt!439970 () Bool)

(assert (=> d!118043 (= lt!439967 lt!439970)))

(declare-fun lt!439969 () Unit!32849)

(declare-fun e!559206 () Unit!32849)

(assert (=> d!118043 (= lt!439969 e!559206)))

(declare-fun c!100781 () Bool)

(assert (=> d!118043 (= c!100781 lt!439970)))

(assert (=> d!118043 (= lt!439970 (containsKey!481 (toList!6829 lt!439692) (_1!7475 lt!439633)))))

(assert (=> d!118043 (= (contains!5746 lt!439692 (_1!7475 lt!439633)) lt!439967)))

(declare-fun b!991575 () Bool)

(declare-fun lt!439968 () Unit!32849)

(assert (=> b!991575 (= e!559206 lt!439968)))

(assert (=> b!991575 (= lt!439968 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6829 lt!439692) (_1!7475 lt!439633)))))

(assert (=> b!991575 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439692) (_1!7475 lt!439633)))))

(declare-fun b!991576 () Bool)

(declare-fun Unit!32864 () Unit!32849)

(assert (=> b!991576 (= e!559206 Unit!32864)))

(declare-fun b!991577 () Bool)

(assert (=> b!991577 (= e!559205 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439692) (_1!7475 lt!439633))))))

(assert (= (and d!118043 c!100781) b!991575))

(assert (= (and d!118043 (not c!100781)) b!991576))

(assert (= (and d!118043 (not res!662712)) b!991577))

(declare-fun m!919719 () Bool)

(assert (=> d!118043 m!919719))

(declare-fun m!919721 () Bool)

(assert (=> b!991575 m!919721))

(assert (=> b!991575 m!919063))

(assert (=> b!991575 m!919063))

(declare-fun m!919723 () Bool)

(assert (=> b!991575 m!919723))

(assert (=> b!991577 m!919063))

(assert (=> b!991577 m!919063))

(assert (=> b!991577 m!919723))

(assert (=> d!117879 d!118043))

(declare-fun b!991581 () Bool)

(declare-fun e!559208 () Option!518)

(assert (=> b!991581 (= e!559208 None!516)))

(declare-fun b!991578 () Bool)

(declare-fun e!559207 () Option!518)

(assert (=> b!991578 (= e!559207 (Some!517 (_2!7475 (h!22000 lt!439691))))))

(declare-fun d!118045 () Bool)

(declare-fun c!100782 () Bool)

(assert (=> d!118045 (= c!100782 (and ((_ is Cons!20832) lt!439691) (= (_1!7475 (h!22000 lt!439691)) (_1!7475 lt!439633))))))

(assert (=> d!118045 (= (getValueByKey!512 lt!439691 (_1!7475 lt!439633)) e!559207)))

(declare-fun b!991579 () Bool)

(assert (=> b!991579 (= e!559207 e!559208)))

(declare-fun c!100783 () Bool)

(assert (=> b!991579 (= c!100783 (and ((_ is Cons!20832) lt!439691) (not (= (_1!7475 (h!22000 lt!439691)) (_1!7475 lt!439633)))))))

(declare-fun b!991580 () Bool)

(assert (=> b!991580 (= e!559208 (getValueByKey!512 (t!29801 lt!439691) (_1!7475 lt!439633)))))

(assert (= (and d!118045 c!100782) b!991578))

(assert (= (and d!118045 (not c!100782)) b!991579))

(assert (= (and b!991579 c!100783) b!991580))

(assert (= (and b!991579 (not c!100783)) b!991581))

(declare-fun m!919725 () Bool)

(assert (=> b!991580 m!919725))

(assert (=> d!117879 d!118045))

(declare-fun d!118047 () Bool)

(assert (=> d!118047 (= (getValueByKey!512 lt!439691 (_1!7475 lt!439633)) (Some!517 (_2!7475 lt!439633)))))

(declare-fun lt!439971 () Unit!32849)

(assert (=> d!118047 (= lt!439971 (choose!1622 lt!439691 (_1!7475 lt!439633) (_2!7475 lt!439633)))))

(declare-fun e!559209 () Bool)

(assert (=> d!118047 e!559209))

(declare-fun res!662713 () Bool)

(assert (=> d!118047 (=> (not res!662713) (not e!559209))))

(assert (=> d!118047 (= res!662713 (isStrictlySorted!505 lt!439691))))

(assert (=> d!118047 (= (lemmaContainsTupThenGetReturnValue!274 lt!439691 (_1!7475 lt!439633) (_2!7475 lt!439633)) lt!439971)))

(declare-fun b!991582 () Bool)

(declare-fun res!662714 () Bool)

(assert (=> b!991582 (=> (not res!662714) (not e!559209))))

(assert (=> b!991582 (= res!662714 (containsKey!481 lt!439691 (_1!7475 lt!439633)))))

(declare-fun b!991583 () Bool)

(assert (=> b!991583 (= e!559209 (contains!5747 lt!439691 (tuple2!14929 (_1!7475 lt!439633) (_2!7475 lt!439633))))))

(assert (= (and d!118047 res!662713) b!991582))

(assert (= (and b!991582 res!662714) b!991583))

(assert (=> d!118047 m!919057))

(declare-fun m!919727 () Bool)

(assert (=> d!118047 m!919727))

(declare-fun m!919729 () Bool)

(assert (=> d!118047 m!919729))

(declare-fun m!919731 () Bool)

(assert (=> b!991582 m!919731))

(declare-fun m!919733 () Bool)

(assert (=> b!991583 m!919733))

(assert (=> d!117879 d!118047))

(declare-fun c!100787 () Bool)

(declare-fun b!991584 () Bool)

(declare-fun e!559213 () List!20836)

(declare-fun c!100784 () Bool)

(assert (=> b!991584 (= e!559213 (ite c!100787 (t!29801 (toList!6829 lt!439632)) (ite c!100784 (Cons!20832 (h!22000 (toList!6829 lt!439632)) (t!29801 (toList!6829 lt!439632))) Nil!20833)))))

(declare-fun bm!42057 () Bool)

(declare-fun call!42061 () List!20836)

(declare-fun call!42062 () List!20836)

(assert (=> bm!42057 (= call!42061 call!42062)))

(declare-fun c!100786 () Bool)

(declare-fun bm!42058 () Bool)

(assert (=> bm!42058 (= call!42062 ($colon$colon!555 e!559213 (ite c!100786 (h!22000 (toList!6829 lt!439632)) (tuple2!14929 (_1!7475 lt!439633) (_2!7475 lt!439633)))))))

(declare-fun c!100785 () Bool)

(assert (=> bm!42058 (= c!100785 c!100786)))

(declare-fun b!991585 () Bool)

(declare-fun e!559214 () Bool)

(declare-fun lt!439972 () List!20836)

(assert (=> b!991585 (= e!559214 (contains!5747 lt!439972 (tuple2!14929 (_1!7475 lt!439633) (_2!7475 lt!439633))))))

(declare-fun b!991586 () Bool)

(declare-fun e!559211 () List!20836)

(assert (=> b!991586 (= e!559211 call!42062)))

(declare-fun b!991587 () Bool)

(declare-fun res!662716 () Bool)

(assert (=> b!991587 (=> (not res!662716) (not e!559214))))

(assert (=> b!991587 (= res!662716 (containsKey!481 lt!439972 (_1!7475 lt!439633)))))

(declare-fun b!991588 () Bool)

(declare-fun e!559212 () List!20836)

(declare-fun call!42060 () List!20836)

(assert (=> b!991588 (= e!559212 call!42060)))

(declare-fun d!118049 () Bool)

(assert (=> d!118049 e!559214))

(declare-fun res!662715 () Bool)

(assert (=> d!118049 (=> (not res!662715) (not e!559214))))

(assert (=> d!118049 (= res!662715 (isStrictlySorted!505 lt!439972))))

(assert (=> d!118049 (= lt!439972 e!559211)))

(assert (=> d!118049 (= c!100786 (and ((_ is Cons!20832) (toList!6829 lt!439632)) (bvslt (_1!7475 (h!22000 (toList!6829 lt!439632))) (_1!7475 lt!439633))))))

(assert (=> d!118049 (isStrictlySorted!505 (toList!6829 lt!439632))))

(assert (=> d!118049 (= (insertStrictlySorted!331 (toList!6829 lt!439632) (_1!7475 lt!439633) (_2!7475 lt!439633)) lt!439972)))

(declare-fun b!991589 () Bool)

(assert (=> b!991589 (= e!559213 (insertStrictlySorted!331 (t!29801 (toList!6829 lt!439632)) (_1!7475 lt!439633) (_2!7475 lt!439633)))))

(declare-fun b!991590 () Bool)

(assert (=> b!991590 (= e!559212 call!42060)))

(declare-fun b!991591 () Bool)

(declare-fun e!559210 () List!20836)

(assert (=> b!991591 (= e!559211 e!559210)))

(assert (=> b!991591 (= c!100787 (and ((_ is Cons!20832) (toList!6829 lt!439632)) (= (_1!7475 (h!22000 (toList!6829 lt!439632))) (_1!7475 lt!439633))))))

(declare-fun b!991592 () Bool)

(assert (=> b!991592 (= e!559210 call!42061)))

(declare-fun b!991593 () Bool)

(assert (=> b!991593 (= c!100784 (and ((_ is Cons!20832) (toList!6829 lt!439632)) (bvsgt (_1!7475 (h!22000 (toList!6829 lt!439632))) (_1!7475 lt!439633))))))

(assert (=> b!991593 (= e!559210 e!559212)))

(declare-fun bm!42059 () Bool)

(assert (=> bm!42059 (= call!42060 call!42061)))

(assert (= (and d!118049 c!100786) b!991586))

(assert (= (and d!118049 (not c!100786)) b!991591))

(assert (= (and b!991591 c!100787) b!991592))

(assert (= (and b!991591 (not c!100787)) b!991593))

(assert (= (and b!991593 c!100784) b!991590))

(assert (= (and b!991593 (not c!100784)) b!991588))

(assert (= (or b!991590 b!991588) bm!42059))

(assert (= (or b!991592 bm!42059) bm!42057))

(assert (= (or b!991586 bm!42057) bm!42058))

(assert (= (and bm!42058 c!100785) b!991589))

(assert (= (and bm!42058 (not c!100785)) b!991584))

(assert (= (and d!118049 res!662715) b!991587))

(assert (= (and b!991587 res!662716) b!991585))

(declare-fun m!919735 () Bool)

(assert (=> bm!42058 m!919735))

(declare-fun m!919737 () Bool)

(assert (=> b!991589 m!919737))

(declare-fun m!919739 () Bool)

(assert (=> d!118049 m!919739))

(assert (=> d!118049 m!919369))

(declare-fun m!919741 () Bool)

(assert (=> b!991585 m!919741))

(declare-fun m!919743 () Bool)

(assert (=> b!991587 m!919743))

(assert (=> d!117879 d!118049))

(declare-fun d!118051 () Bool)

(declare-fun e!559215 () Bool)

(assert (=> d!118051 e!559215))

(declare-fun res!662717 () Bool)

(assert (=> d!118051 (=> res!662717 e!559215)))

(declare-fun lt!439973 () Bool)

(assert (=> d!118051 (= res!662717 (not lt!439973))))

(declare-fun lt!439976 () Bool)

(assert (=> d!118051 (= lt!439973 lt!439976)))

(declare-fun lt!439975 () Unit!32849)

(declare-fun e!559216 () Unit!32849)

(assert (=> d!118051 (= lt!439975 e!559216)))

(declare-fun c!100788 () Bool)

(assert (=> d!118051 (= c!100788 lt!439976)))

(assert (=> d!118051 (= lt!439976 (containsKey!481 (toList!6829 lt!439782) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!118051 (= (contains!5746 lt!439782 #b1000000000000000000000000000000000000000000000000000000000000000) lt!439973)))

(declare-fun b!991594 () Bool)

(declare-fun lt!439974 () Unit!32849)

(assert (=> b!991594 (= e!559216 lt!439974)))

(assert (=> b!991594 (= lt!439974 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6829 lt!439782) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!991594 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439782) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991595 () Bool)

(declare-fun Unit!32865 () Unit!32849)

(assert (=> b!991595 (= e!559216 Unit!32865)))

(declare-fun b!991596 () Bool)

(assert (=> b!991596 (= e!559215 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439782) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!118051 c!100788) b!991594))

(assert (= (and d!118051 (not c!100788)) b!991595))

(assert (= (and d!118051 (not res!662717)) b!991596))

(declare-fun m!919745 () Bool)

(assert (=> d!118051 m!919745))

(declare-fun m!919747 () Bool)

(assert (=> b!991594 m!919747))

(assert (=> b!991594 m!919479))

(assert (=> b!991594 m!919479))

(declare-fun m!919749 () Bool)

(assert (=> b!991594 m!919749))

(assert (=> b!991596 m!919479))

(assert (=> b!991596 m!919479))

(assert (=> b!991596 m!919749))

(assert (=> bm!42038 d!118051))

(declare-fun d!118053 () Bool)

(assert (=> d!118053 (= (apply!906 lt!439782 (select (arr!30144 _keys!1544) from!1932)) (get!15675 (getValueByKey!512 (toList!6829 lt!439782) (select (arr!30144 _keys!1544) from!1932))))))

(declare-fun bs!28152 () Bool)

(assert (= bs!28152 d!118053))

(assert (=> bs!28152 m!918897))

(assert (=> bs!28152 m!919339))

(assert (=> bs!28152 m!919339))

(declare-fun m!919751 () Bool)

(assert (=> bs!28152 m!919751))

(assert (=> b!991298 d!118053))

(assert (=> b!991298 d!117891))

(declare-fun d!118055 () Bool)

(declare-fun e!559217 () Bool)

(assert (=> d!118055 e!559217))

(declare-fun res!662718 () Bool)

(assert (=> d!118055 (=> res!662718 e!559217)))

(declare-fun lt!439977 () Bool)

(assert (=> d!118055 (= res!662718 (not lt!439977))))

(declare-fun lt!439980 () Bool)

(assert (=> d!118055 (= lt!439977 lt!439980)))

(declare-fun lt!439979 () Unit!32849)

(declare-fun e!559218 () Unit!32849)

(assert (=> d!118055 (= lt!439979 e!559218)))

(declare-fun c!100789 () Bool)

(assert (=> d!118055 (= c!100789 lt!439980)))

(assert (=> d!118055 (= lt!439980 (containsKey!481 (toList!6829 lt!439792) (_1!7475 lt!439633)))))

(assert (=> d!118055 (= (contains!5746 lt!439792 (_1!7475 lt!439633)) lt!439977)))

(declare-fun b!991597 () Bool)

(declare-fun lt!439978 () Unit!32849)

(assert (=> b!991597 (= e!559218 lt!439978)))

(assert (=> b!991597 (= lt!439978 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6829 lt!439792) (_1!7475 lt!439633)))))

(assert (=> b!991597 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439792) (_1!7475 lt!439633)))))

(declare-fun b!991598 () Bool)

(declare-fun Unit!32866 () Unit!32849)

(assert (=> b!991598 (= e!559218 Unit!32866)))

(declare-fun b!991599 () Bool)

(assert (=> b!991599 (= e!559217 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439792) (_1!7475 lt!439633))))))

(assert (= (and d!118055 c!100789) b!991597))

(assert (= (and d!118055 (not c!100789)) b!991598))

(assert (= (and d!118055 (not res!662718)) b!991599))

(declare-fun m!919753 () Bool)

(assert (=> d!118055 m!919753))

(declare-fun m!919755 () Bool)

(assert (=> b!991597 m!919755))

(assert (=> b!991597 m!919201))

(assert (=> b!991597 m!919201))

(declare-fun m!919757 () Bool)

(assert (=> b!991597 m!919757))

(assert (=> b!991599 m!919201))

(assert (=> b!991599 m!919201))

(assert (=> b!991599 m!919757))

(assert (=> d!117889 d!118055))

(declare-fun b!991603 () Bool)

(declare-fun e!559220 () Option!518)

(assert (=> b!991603 (= e!559220 None!516)))

(declare-fun b!991600 () Bool)

(declare-fun e!559219 () Option!518)

(assert (=> b!991600 (= e!559219 (Some!517 (_2!7475 (h!22000 lt!439791))))))

(declare-fun d!118057 () Bool)

(declare-fun c!100790 () Bool)

(assert (=> d!118057 (= c!100790 (and ((_ is Cons!20832) lt!439791) (= (_1!7475 (h!22000 lt!439791)) (_1!7475 lt!439633))))))

(assert (=> d!118057 (= (getValueByKey!512 lt!439791 (_1!7475 lt!439633)) e!559219)))

(declare-fun b!991601 () Bool)

(assert (=> b!991601 (= e!559219 e!559220)))

(declare-fun c!100791 () Bool)

(assert (=> b!991601 (= c!100791 (and ((_ is Cons!20832) lt!439791) (not (= (_1!7475 (h!22000 lt!439791)) (_1!7475 lt!439633)))))))

(declare-fun b!991602 () Bool)

(assert (=> b!991602 (= e!559220 (getValueByKey!512 (t!29801 lt!439791) (_1!7475 lt!439633)))))

(assert (= (and d!118057 c!100790) b!991600))

(assert (= (and d!118057 (not c!100790)) b!991601))

(assert (= (and b!991601 c!100791) b!991602))

(assert (= (and b!991601 (not c!100791)) b!991603))

(declare-fun m!919759 () Bool)

(assert (=> b!991602 m!919759))

(assert (=> d!117889 d!118057))

(declare-fun d!118059 () Bool)

(assert (=> d!118059 (= (getValueByKey!512 lt!439791 (_1!7475 lt!439633)) (Some!517 (_2!7475 lt!439633)))))

(declare-fun lt!439981 () Unit!32849)

(assert (=> d!118059 (= lt!439981 (choose!1622 lt!439791 (_1!7475 lt!439633) (_2!7475 lt!439633)))))

(declare-fun e!559221 () Bool)

(assert (=> d!118059 e!559221))

(declare-fun res!662719 () Bool)

(assert (=> d!118059 (=> (not res!662719) (not e!559221))))

(assert (=> d!118059 (= res!662719 (isStrictlySorted!505 lt!439791))))

(assert (=> d!118059 (= (lemmaContainsTupThenGetReturnValue!274 lt!439791 (_1!7475 lt!439633) (_2!7475 lt!439633)) lt!439981)))

(declare-fun b!991604 () Bool)

(declare-fun res!662720 () Bool)

(assert (=> b!991604 (=> (not res!662720) (not e!559221))))

(assert (=> b!991604 (= res!662720 (containsKey!481 lt!439791 (_1!7475 lt!439633)))))

(declare-fun b!991605 () Bool)

(assert (=> b!991605 (= e!559221 (contains!5747 lt!439791 (tuple2!14929 (_1!7475 lt!439633) (_2!7475 lt!439633))))))

(assert (= (and d!118059 res!662719) b!991604))

(assert (= (and b!991604 res!662720) b!991605))

(assert (=> d!118059 m!919195))

(declare-fun m!919761 () Bool)

(assert (=> d!118059 m!919761))

(declare-fun m!919763 () Bool)

(assert (=> d!118059 m!919763))

(declare-fun m!919765 () Bool)

(assert (=> b!991604 m!919765))

(declare-fun m!919767 () Bool)

(assert (=> b!991605 m!919767))

(assert (=> d!117889 d!118059))

(declare-fun b!991606 () Bool)

(declare-fun e!559225 () List!20836)

(declare-fun c!100792 () Bool)

(declare-fun c!100795 () Bool)

(assert (=> b!991606 (= e!559225 (ite c!100795 (t!29801 (toList!6829 (+!3117 lt!439632 lt!439635))) (ite c!100792 (Cons!20832 (h!22000 (toList!6829 (+!3117 lt!439632 lt!439635))) (t!29801 (toList!6829 (+!3117 lt!439632 lt!439635)))) Nil!20833)))))

(declare-fun bm!42060 () Bool)

(declare-fun call!42064 () List!20836)

(declare-fun call!42065 () List!20836)

(assert (=> bm!42060 (= call!42064 call!42065)))

(declare-fun bm!42061 () Bool)

(declare-fun c!100794 () Bool)

(assert (=> bm!42061 (= call!42065 ($colon$colon!555 e!559225 (ite c!100794 (h!22000 (toList!6829 (+!3117 lt!439632 lt!439635))) (tuple2!14929 (_1!7475 lt!439633) (_2!7475 lt!439633)))))))

(declare-fun c!100793 () Bool)

(assert (=> bm!42061 (= c!100793 c!100794)))

(declare-fun b!991607 () Bool)

(declare-fun e!559226 () Bool)

(declare-fun lt!439982 () List!20836)

(assert (=> b!991607 (= e!559226 (contains!5747 lt!439982 (tuple2!14929 (_1!7475 lt!439633) (_2!7475 lt!439633))))))

(declare-fun b!991608 () Bool)

(declare-fun e!559223 () List!20836)

(assert (=> b!991608 (= e!559223 call!42065)))

(declare-fun b!991609 () Bool)

(declare-fun res!662722 () Bool)

(assert (=> b!991609 (=> (not res!662722) (not e!559226))))

(assert (=> b!991609 (= res!662722 (containsKey!481 lt!439982 (_1!7475 lt!439633)))))

(declare-fun b!991610 () Bool)

(declare-fun e!559224 () List!20836)

(declare-fun call!42063 () List!20836)

(assert (=> b!991610 (= e!559224 call!42063)))

(declare-fun d!118061 () Bool)

(assert (=> d!118061 e!559226))

(declare-fun res!662721 () Bool)

(assert (=> d!118061 (=> (not res!662721) (not e!559226))))

(assert (=> d!118061 (= res!662721 (isStrictlySorted!505 lt!439982))))

(assert (=> d!118061 (= lt!439982 e!559223)))

(assert (=> d!118061 (= c!100794 (and ((_ is Cons!20832) (toList!6829 (+!3117 lt!439632 lt!439635))) (bvslt (_1!7475 (h!22000 (toList!6829 (+!3117 lt!439632 lt!439635)))) (_1!7475 lt!439633))))))

(assert (=> d!118061 (isStrictlySorted!505 (toList!6829 (+!3117 lt!439632 lt!439635)))))

(assert (=> d!118061 (= (insertStrictlySorted!331 (toList!6829 (+!3117 lt!439632 lt!439635)) (_1!7475 lt!439633) (_2!7475 lt!439633)) lt!439982)))

(declare-fun b!991611 () Bool)

(assert (=> b!991611 (= e!559225 (insertStrictlySorted!331 (t!29801 (toList!6829 (+!3117 lt!439632 lt!439635))) (_1!7475 lt!439633) (_2!7475 lt!439633)))))

(declare-fun b!991612 () Bool)

(assert (=> b!991612 (= e!559224 call!42063)))

(declare-fun b!991613 () Bool)

(declare-fun e!559222 () List!20836)

(assert (=> b!991613 (= e!559223 e!559222)))

(assert (=> b!991613 (= c!100795 (and ((_ is Cons!20832) (toList!6829 (+!3117 lt!439632 lt!439635))) (= (_1!7475 (h!22000 (toList!6829 (+!3117 lt!439632 lt!439635)))) (_1!7475 lt!439633))))))

(declare-fun b!991614 () Bool)

(assert (=> b!991614 (= e!559222 call!42064)))

(declare-fun b!991615 () Bool)

(assert (=> b!991615 (= c!100792 (and ((_ is Cons!20832) (toList!6829 (+!3117 lt!439632 lt!439635))) (bvsgt (_1!7475 (h!22000 (toList!6829 (+!3117 lt!439632 lt!439635)))) (_1!7475 lt!439633))))))

(assert (=> b!991615 (= e!559222 e!559224)))

(declare-fun bm!42062 () Bool)

(assert (=> bm!42062 (= call!42063 call!42064)))

(assert (= (and d!118061 c!100794) b!991608))

(assert (= (and d!118061 (not c!100794)) b!991613))

(assert (= (and b!991613 c!100795) b!991614))

(assert (= (and b!991613 (not c!100795)) b!991615))

(assert (= (and b!991615 c!100792) b!991612))

(assert (= (and b!991615 (not c!100792)) b!991610))

(assert (= (or b!991612 b!991610) bm!42062))

(assert (= (or b!991614 bm!42062) bm!42060))

(assert (= (or b!991608 bm!42060) bm!42061))

(assert (= (and bm!42061 c!100793) b!991611))

(assert (= (and bm!42061 (not c!100793)) b!991606))

(assert (= (and d!118061 res!662721) b!991609))

(assert (= (and b!991609 res!662722) b!991607))

(declare-fun m!919769 () Bool)

(assert (=> bm!42061 m!919769))

(declare-fun m!919771 () Bool)

(assert (=> b!991611 m!919771))

(declare-fun m!919773 () Bool)

(assert (=> d!118061 m!919773))

(declare-fun m!919775 () Bool)

(assert (=> d!118061 m!919775))

(declare-fun m!919777 () Bool)

(assert (=> b!991607 m!919777))

(declare-fun m!919779 () Bool)

(assert (=> b!991609 m!919779))

(assert (=> d!117889 d!118061))

(assert (=> bm!42030 d!117893))

(declare-fun d!118063 () Bool)

(assert (=> d!118063 (= (+!3117 (+!3117 lt!439632 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636)) (+!3117 (+!3117 lt!439632 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636)) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (=> d!118063 true))

(declare-fun _$28!191 () Unit!32849)

(assert (=> d!118063 (= (choose!1621 lt!439632 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30144 _keys!1544) from!1932) lt!439636) _$28!191)))

(declare-fun bs!28153 () Bool)

(assert (= bs!28153 d!118063))

(assert (=> bs!28153 m!919051))

(assert (=> bs!28153 m!919051))

(assert (=> bs!28153 m!919053))

(assert (=> bs!28153 m!919047))

(assert (=> bs!28153 m!919047))

(assert (=> bs!28153 m!919049))

(assert (=> d!117877 d!118063))

(declare-fun d!118065 () Bool)

(declare-fun e!559227 () Bool)

(assert (=> d!118065 e!559227))

(declare-fun res!662724 () Bool)

(assert (=> d!118065 (=> (not res!662724) (not e!559227))))

(declare-fun lt!439984 () ListLongMap!13627)

(assert (=> d!118065 (= res!662724 (contains!5746 lt!439984 (_1!7475 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636))))))

(declare-fun lt!439983 () List!20836)

(assert (=> d!118065 (= lt!439984 (ListLongMap!13628 lt!439983))))

(declare-fun lt!439985 () Unit!32849)

(declare-fun lt!439986 () Unit!32849)

(assert (=> d!118065 (= lt!439985 lt!439986)))

(assert (=> d!118065 (= (getValueByKey!512 lt!439983 (_1!7475 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636))) (Some!517 (_2!7475 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636))))))

(assert (=> d!118065 (= lt!439986 (lemmaContainsTupThenGetReturnValue!274 lt!439983 (_1!7475 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636)) (_2!7475 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636))))))

(assert (=> d!118065 (= lt!439983 (insertStrictlySorted!331 (toList!6829 lt!439632) (_1!7475 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636)) (_2!7475 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636))))))

(assert (=> d!118065 (= (+!3117 lt!439632 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636)) lt!439984)))

(declare-fun b!991616 () Bool)

(declare-fun res!662723 () Bool)

(assert (=> b!991616 (=> (not res!662723) (not e!559227))))

(assert (=> b!991616 (= res!662723 (= (getValueByKey!512 (toList!6829 lt!439984) (_1!7475 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636))) (Some!517 (_2!7475 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636)))))))

(declare-fun b!991617 () Bool)

(assert (=> b!991617 (= e!559227 (contains!5747 (toList!6829 lt!439984) (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636)))))

(assert (= (and d!118065 res!662724) b!991616))

(assert (= (and b!991616 res!662723) b!991617))

(declare-fun m!919781 () Bool)

(assert (=> d!118065 m!919781))

(declare-fun m!919783 () Bool)

(assert (=> d!118065 m!919783))

(declare-fun m!919785 () Bool)

(assert (=> d!118065 m!919785))

(declare-fun m!919787 () Bool)

(assert (=> d!118065 m!919787))

(declare-fun m!919789 () Bool)

(assert (=> b!991616 m!919789))

(declare-fun m!919791 () Bool)

(assert (=> b!991617 m!919791))

(assert (=> d!117877 d!118065))

(declare-fun d!118067 () Bool)

(declare-fun e!559228 () Bool)

(assert (=> d!118067 e!559228))

(declare-fun res!662726 () Bool)

(assert (=> d!118067 (=> (not res!662726) (not e!559228))))

(declare-fun lt!439988 () ListLongMap!13627)

(assert (=> d!118067 (= res!662726 (contains!5746 lt!439988 (_1!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!439987 () List!20836)

(assert (=> d!118067 (= lt!439988 (ListLongMap!13628 lt!439987))))

(declare-fun lt!439989 () Unit!32849)

(declare-fun lt!439990 () Unit!32849)

(assert (=> d!118067 (= lt!439989 lt!439990)))

(assert (=> d!118067 (= (getValueByKey!512 lt!439987 (_1!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!517 (_2!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!118067 (= lt!439990 (lemmaContainsTupThenGetReturnValue!274 lt!439987 (_1!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!118067 (= lt!439987 (insertStrictlySorted!331 (toList!6829 (+!3117 lt!439632 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636))) (_1!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!118067 (= (+!3117 (+!3117 lt!439632 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636)) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!439988)))

(declare-fun b!991618 () Bool)

(declare-fun res!662725 () Bool)

(assert (=> b!991618 (=> (not res!662725) (not e!559228))))

(assert (=> b!991618 (= res!662725 (= (getValueByKey!512 (toList!6829 lt!439988) (_1!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!517 (_2!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!991619 () Bool)

(assert (=> b!991619 (= e!559228 (contains!5747 (toList!6829 lt!439988) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!118067 res!662726) b!991618))

(assert (= (and b!991618 res!662725) b!991619))

(declare-fun m!919793 () Bool)

(assert (=> d!118067 m!919793))

(declare-fun m!919795 () Bool)

(assert (=> d!118067 m!919795))

(declare-fun m!919797 () Bool)

(assert (=> d!118067 m!919797))

(declare-fun m!919799 () Bool)

(assert (=> d!118067 m!919799))

(declare-fun m!919801 () Bool)

(assert (=> b!991618 m!919801))

(declare-fun m!919803 () Bool)

(assert (=> b!991619 m!919803))

(assert (=> d!117877 d!118067))

(declare-fun d!118069 () Bool)

(declare-fun e!559229 () Bool)

(assert (=> d!118069 e!559229))

(declare-fun res!662728 () Bool)

(assert (=> d!118069 (=> (not res!662728) (not e!559229))))

(declare-fun lt!439992 () ListLongMap!13627)

(assert (=> d!118069 (= res!662728 (contains!5746 lt!439992 (_1!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!439991 () List!20836)

(assert (=> d!118069 (= lt!439992 (ListLongMap!13628 lt!439991))))

(declare-fun lt!439993 () Unit!32849)

(declare-fun lt!439994 () Unit!32849)

(assert (=> d!118069 (= lt!439993 lt!439994)))

(assert (=> d!118069 (= (getValueByKey!512 lt!439991 (_1!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!517 (_2!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!118069 (= lt!439994 (lemmaContainsTupThenGetReturnValue!274 lt!439991 (_1!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!118069 (= lt!439991 (insertStrictlySorted!331 (toList!6829 lt!439632) (_1!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!118069 (= (+!3117 lt!439632 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!439992)))

(declare-fun b!991620 () Bool)

(declare-fun res!662727 () Bool)

(assert (=> b!991620 (=> (not res!662727) (not e!559229))))

(assert (=> b!991620 (= res!662727 (= (getValueByKey!512 (toList!6829 lt!439992) (_1!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!517 (_2!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!991621 () Bool)

(assert (=> b!991621 (= e!559229 (contains!5747 (toList!6829 lt!439992) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!118069 res!662728) b!991620))

(assert (= (and b!991620 res!662727) b!991621))

(declare-fun m!919805 () Bool)

(assert (=> d!118069 m!919805))

(declare-fun m!919807 () Bool)

(assert (=> d!118069 m!919807))

(declare-fun m!919809 () Bool)

(assert (=> d!118069 m!919809))

(declare-fun m!919811 () Bool)

(assert (=> d!118069 m!919811))

(declare-fun m!919813 () Bool)

(assert (=> b!991620 m!919813))

(declare-fun m!919815 () Bool)

(assert (=> b!991621 m!919815))

(assert (=> d!117877 d!118069))

(declare-fun d!118071 () Bool)

(declare-fun e!559230 () Bool)

(assert (=> d!118071 e!559230))

(declare-fun res!662730 () Bool)

(assert (=> d!118071 (=> (not res!662730) (not e!559230))))

(declare-fun lt!439996 () ListLongMap!13627)

(assert (=> d!118071 (= res!662730 (contains!5746 lt!439996 (_1!7475 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636))))))

(declare-fun lt!439995 () List!20836)

(assert (=> d!118071 (= lt!439996 (ListLongMap!13628 lt!439995))))

(declare-fun lt!439997 () Unit!32849)

(declare-fun lt!439998 () Unit!32849)

(assert (=> d!118071 (= lt!439997 lt!439998)))

(assert (=> d!118071 (= (getValueByKey!512 lt!439995 (_1!7475 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636))) (Some!517 (_2!7475 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636))))))

(assert (=> d!118071 (= lt!439998 (lemmaContainsTupThenGetReturnValue!274 lt!439995 (_1!7475 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636)) (_2!7475 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636))))))

(assert (=> d!118071 (= lt!439995 (insertStrictlySorted!331 (toList!6829 (+!3117 lt!439632 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_1!7475 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636)) (_2!7475 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636))))))

(assert (=> d!118071 (= (+!3117 (+!3117 lt!439632 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636)) lt!439996)))

(declare-fun b!991622 () Bool)

(declare-fun res!662729 () Bool)

(assert (=> b!991622 (=> (not res!662729) (not e!559230))))

(assert (=> b!991622 (= res!662729 (= (getValueByKey!512 (toList!6829 lt!439996) (_1!7475 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636))) (Some!517 (_2!7475 (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636)))))))

(declare-fun b!991623 () Bool)

(assert (=> b!991623 (= e!559230 (contains!5747 (toList!6829 lt!439996) (tuple2!14929 (select (arr!30144 _keys!1544) from!1932) lt!439636)))))

(assert (= (and d!118071 res!662730) b!991622))

(assert (= (and b!991622 res!662729) b!991623))

(declare-fun m!919817 () Bool)

(assert (=> d!118071 m!919817))

(declare-fun m!919819 () Bool)

(assert (=> d!118071 m!919819))

(declare-fun m!919821 () Bool)

(assert (=> d!118071 m!919821))

(declare-fun m!919823 () Bool)

(assert (=> d!118071 m!919823))

(declare-fun m!919825 () Bool)

(assert (=> b!991622 m!919825))

(declare-fun m!919827 () Bool)

(assert (=> b!991623 m!919827))

(assert (=> d!117877 d!118071))

(declare-fun d!118073 () Bool)

(declare-fun e!559231 () Bool)

(assert (=> d!118073 e!559231))

(declare-fun res!662731 () Bool)

(assert (=> d!118073 (=> res!662731 e!559231)))

(declare-fun lt!439999 () Bool)

(assert (=> d!118073 (= res!662731 (not lt!439999))))

(declare-fun lt!440002 () Bool)

(assert (=> d!118073 (= lt!439999 lt!440002)))

(declare-fun lt!440001 () Unit!32849)

(declare-fun e!559232 () Unit!32849)

(assert (=> d!118073 (= lt!440001 e!559232)))

(declare-fun c!100796 () Bool)

(assert (=> d!118073 (= c!100796 lt!440002)))

(assert (=> d!118073 (= lt!440002 (containsKey!481 (toList!6829 lt!439760) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!118073 (= (contains!5746 lt!439760 #b0000000000000000000000000000000000000000000000000000000000000000) lt!439999)))

(declare-fun b!991624 () Bool)

(declare-fun lt!440000 () Unit!32849)

(assert (=> b!991624 (= e!559232 lt!440000)))

(assert (=> b!991624 (= lt!440000 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6829 lt!439760) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!991624 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439760) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991625 () Bool)

(declare-fun Unit!32867 () Unit!32849)

(assert (=> b!991625 (= e!559232 Unit!32867)))

(declare-fun b!991626 () Bool)

(assert (=> b!991626 (= e!559231 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439760) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!118073 c!100796) b!991624))

(assert (= (and d!118073 (not c!100796)) b!991625))

(assert (= (and d!118073 (not res!662731)) b!991626))

(declare-fun m!919829 () Bool)

(assert (=> d!118073 m!919829))

(declare-fun m!919831 () Bool)

(assert (=> b!991624 m!919831))

(declare-fun m!919833 () Bool)

(assert (=> b!991624 m!919833))

(assert (=> b!991624 m!919833))

(declare-fun m!919835 () Bool)

(assert (=> b!991624 m!919835))

(assert (=> b!991626 m!919833))

(assert (=> b!991626 m!919833))

(assert (=> b!991626 m!919835))

(assert (=> bm!42028 d!118073))

(declare-fun d!118075 () Bool)

(declare-fun e!559233 () Bool)

(assert (=> d!118075 e!559233))

(declare-fun res!662732 () Bool)

(assert (=> d!118075 (=> res!662732 e!559233)))

(declare-fun lt!440003 () Bool)

(assert (=> d!118075 (= res!662732 (not lt!440003))))

(declare-fun lt!440006 () Bool)

(assert (=> d!118075 (= lt!440003 lt!440006)))

(declare-fun lt!440005 () Unit!32849)

(declare-fun e!559234 () Unit!32849)

(assert (=> d!118075 (= lt!440005 e!559234)))

(declare-fun c!100797 () Bool)

(assert (=> d!118075 (= c!100797 lt!440006)))

(assert (=> d!118075 (= lt!440006 (containsKey!481 (toList!6829 lt!439788) (_1!7475 lt!439635)))))

(assert (=> d!118075 (= (contains!5746 lt!439788 (_1!7475 lt!439635)) lt!440003)))

(declare-fun b!991627 () Bool)

(declare-fun lt!440004 () Unit!32849)

(assert (=> b!991627 (= e!559234 lt!440004)))

(assert (=> b!991627 (= lt!440004 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6829 lt!439788) (_1!7475 lt!439635)))))

(assert (=> b!991627 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439788) (_1!7475 lt!439635)))))

(declare-fun b!991628 () Bool)

(declare-fun Unit!32868 () Unit!32849)

(assert (=> b!991628 (= e!559234 Unit!32868)))

(declare-fun b!991629 () Bool)

(assert (=> b!991629 (= e!559233 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439788) (_1!7475 lt!439635))))))

(assert (= (and d!118075 c!100797) b!991627))

(assert (= (and d!118075 (not c!100797)) b!991628))

(assert (= (and d!118075 (not res!662732)) b!991629))

(declare-fun m!919837 () Bool)

(assert (=> d!118075 m!919837))

(declare-fun m!919839 () Bool)

(assert (=> b!991627 m!919839))

(assert (=> b!991627 m!919189))

(assert (=> b!991627 m!919189))

(declare-fun m!919841 () Bool)

(assert (=> b!991627 m!919841))

(assert (=> b!991629 m!919189))

(assert (=> b!991629 m!919189))

(assert (=> b!991629 m!919841))

(assert (=> d!117887 d!118075))

(declare-fun b!991633 () Bool)

(declare-fun e!559236 () Option!518)

(assert (=> b!991633 (= e!559236 None!516)))

(declare-fun b!991630 () Bool)

(declare-fun e!559235 () Option!518)

(assert (=> b!991630 (= e!559235 (Some!517 (_2!7475 (h!22000 lt!439787))))))

(declare-fun d!118077 () Bool)

(declare-fun c!100798 () Bool)

(assert (=> d!118077 (= c!100798 (and ((_ is Cons!20832) lt!439787) (= (_1!7475 (h!22000 lt!439787)) (_1!7475 lt!439635))))))

(assert (=> d!118077 (= (getValueByKey!512 lt!439787 (_1!7475 lt!439635)) e!559235)))

(declare-fun b!991631 () Bool)

(assert (=> b!991631 (= e!559235 e!559236)))

(declare-fun c!100799 () Bool)

(assert (=> b!991631 (= c!100799 (and ((_ is Cons!20832) lt!439787) (not (= (_1!7475 (h!22000 lt!439787)) (_1!7475 lt!439635)))))))

(declare-fun b!991632 () Bool)

(assert (=> b!991632 (= e!559236 (getValueByKey!512 (t!29801 lt!439787) (_1!7475 lt!439635)))))

(assert (= (and d!118077 c!100798) b!991630))

(assert (= (and d!118077 (not c!100798)) b!991631))

(assert (= (and b!991631 c!100799) b!991632))

(assert (= (and b!991631 (not c!100799)) b!991633))

(declare-fun m!919843 () Bool)

(assert (=> b!991632 m!919843))

(assert (=> d!117887 d!118077))

(declare-fun d!118079 () Bool)

(assert (=> d!118079 (= (getValueByKey!512 lt!439787 (_1!7475 lt!439635)) (Some!517 (_2!7475 lt!439635)))))

(declare-fun lt!440007 () Unit!32849)

(assert (=> d!118079 (= lt!440007 (choose!1622 lt!439787 (_1!7475 lt!439635) (_2!7475 lt!439635)))))

(declare-fun e!559237 () Bool)

(assert (=> d!118079 e!559237))

(declare-fun res!662733 () Bool)

(assert (=> d!118079 (=> (not res!662733) (not e!559237))))

(assert (=> d!118079 (= res!662733 (isStrictlySorted!505 lt!439787))))

(assert (=> d!118079 (= (lemmaContainsTupThenGetReturnValue!274 lt!439787 (_1!7475 lt!439635) (_2!7475 lt!439635)) lt!440007)))

(declare-fun b!991634 () Bool)

(declare-fun res!662734 () Bool)

(assert (=> b!991634 (=> (not res!662734) (not e!559237))))

(assert (=> b!991634 (= res!662734 (containsKey!481 lt!439787 (_1!7475 lt!439635)))))

(declare-fun b!991635 () Bool)

(assert (=> b!991635 (= e!559237 (contains!5747 lt!439787 (tuple2!14929 (_1!7475 lt!439635) (_2!7475 lt!439635))))))

(assert (= (and d!118079 res!662733) b!991634))

(assert (= (and b!991634 res!662734) b!991635))

(assert (=> d!118079 m!919183))

(declare-fun m!919845 () Bool)

(assert (=> d!118079 m!919845))

(declare-fun m!919847 () Bool)

(assert (=> d!118079 m!919847))

(declare-fun m!919849 () Bool)

(assert (=> b!991634 m!919849))

(declare-fun m!919851 () Bool)

(assert (=> b!991635 m!919851))

(assert (=> d!117887 d!118079))

(declare-fun c!100800 () Bool)

(declare-fun c!100803 () Bool)

(declare-fun e!559241 () List!20836)

(declare-fun b!991636 () Bool)

(assert (=> b!991636 (= e!559241 (ite c!100803 (t!29801 (toList!6829 (getCurrentListMap!3876 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (ite c!100800 (Cons!20832 (h!22000 (toList!6829 (getCurrentListMap!3876 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (t!29801 (toList!6829 (getCurrentListMap!3876 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) Nil!20833)))))

(declare-fun bm!42063 () Bool)

(declare-fun call!42067 () List!20836)

(declare-fun call!42068 () List!20836)

(assert (=> bm!42063 (= call!42067 call!42068)))

(declare-fun bm!42064 () Bool)

(declare-fun c!100802 () Bool)

(assert (=> bm!42064 (= call!42068 ($colon$colon!555 e!559241 (ite c!100802 (h!22000 (toList!6829 (getCurrentListMap!3876 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (tuple2!14929 (_1!7475 lt!439635) (_2!7475 lt!439635)))))))

(declare-fun c!100801 () Bool)

(assert (=> bm!42064 (= c!100801 c!100802)))

(declare-fun b!991637 () Bool)

(declare-fun e!559242 () Bool)

(declare-fun lt!440008 () List!20836)

(assert (=> b!991637 (= e!559242 (contains!5747 lt!440008 (tuple2!14929 (_1!7475 lt!439635) (_2!7475 lt!439635))))))

(declare-fun b!991638 () Bool)

(declare-fun e!559239 () List!20836)

(assert (=> b!991638 (= e!559239 call!42068)))

(declare-fun b!991639 () Bool)

(declare-fun res!662736 () Bool)

(assert (=> b!991639 (=> (not res!662736) (not e!559242))))

(assert (=> b!991639 (= res!662736 (containsKey!481 lt!440008 (_1!7475 lt!439635)))))

(declare-fun b!991640 () Bool)

(declare-fun e!559240 () List!20836)

(declare-fun call!42066 () List!20836)

(assert (=> b!991640 (= e!559240 call!42066)))

(declare-fun d!118081 () Bool)

(assert (=> d!118081 e!559242))

(declare-fun res!662735 () Bool)

(assert (=> d!118081 (=> (not res!662735) (not e!559242))))

(assert (=> d!118081 (= res!662735 (isStrictlySorted!505 lt!440008))))

(assert (=> d!118081 (= lt!440008 e!559239)))

(assert (=> d!118081 (= c!100802 (and ((_ is Cons!20832) (toList!6829 (getCurrentListMap!3876 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (bvslt (_1!7475 (h!22000 (toList!6829 (getCurrentListMap!3876 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7475 lt!439635))))))

(assert (=> d!118081 (isStrictlySorted!505 (toList!6829 (getCurrentListMap!3876 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))))

(assert (=> d!118081 (= (insertStrictlySorted!331 (toList!6829 (getCurrentListMap!3876 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7475 lt!439635) (_2!7475 lt!439635)) lt!440008)))

(declare-fun b!991641 () Bool)

(assert (=> b!991641 (= e!559241 (insertStrictlySorted!331 (t!29801 (toList!6829 (getCurrentListMap!3876 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (_1!7475 lt!439635) (_2!7475 lt!439635)))))

(declare-fun b!991642 () Bool)

(assert (=> b!991642 (= e!559240 call!42066)))

(declare-fun b!991643 () Bool)

(declare-fun e!559238 () List!20836)

(assert (=> b!991643 (= e!559239 e!559238)))

(assert (=> b!991643 (= c!100803 (and ((_ is Cons!20832) (toList!6829 (getCurrentListMap!3876 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (= (_1!7475 (h!22000 (toList!6829 (getCurrentListMap!3876 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7475 lt!439635))))))

(declare-fun b!991644 () Bool)

(assert (=> b!991644 (= e!559238 call!42067)))

(declare-fun b!991645 () Bool)

(assert (=> b!991645 (= c!100800 (and ((_ is Cons!20832) (toList!6829 (getCurrentListMap!3876 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (bvsgt (_1!7475 (h!22000 (toList!6829 (getCurrentListMap!3876 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7475 lt!439635))))))

(assert (=> b!991645 (= e!559238 e!559240)))

(declare-fun bm!42065 () Bool)

(assert (=> bm!42065 (= call!42066 call!42067)))

(assert (= (and d!118081 c!100802) b!991638))

(assert (= (and d!118081 (not c!100802)) b!991643))

(assert (= (and b!991643 c!100803) b!991644))

(assert (= (and b!991643 (not c!100803)) b!991645))

(assert (= (and b!991645 c!100800) b!991642))

(assert (= (and b!991645 (not c!100800)) b!991640))

(assert (= (or b!991642 b!991640) bm!42065))

(assert (= (or b!991644 bm!42065) bm!42063))

(assert (= (or b!991638 bm!42063) bm!42064))

(assert (= (and bm!42064 c!100801) b!991641))

(assert (= (and bm!42064 (not c!100801)) b!991636))

(assert (= (and d!118081 res!662735) b!991639))

(assert (= (and b!991639 res!662736) b!991637))

(declare-fun m!919853 () Bool)

(assert (=> bm!42064 m!919853))

(declare-fun m!919855 () Bool)

(assert (=> b!991641 m!919855))

(declare-fun m!919857 () Bool)

(assert (=> d!118081 m!919857))

(declare-fun m!919859 () Bool)

(assert (=> d!118081 m!919859))

(declare-fun m!919861 () Bool)

(assert (=> b!991637 m!919861))

(declare-fun m!919863 () Bool)

(assert (=> b!991639 m!919863))

(assert (=> d!117887 d!118081))

(declare-fun b!991646 () Bool)

(declare-fun e!559244 () Bool)

(declare-fun e!559243 () Bool)

(assert (=> b!991646 (= e!559244 e!559243)))

(declare-fun lt!440009 () (_ BitVec 64))

(assert (=> b!991646 (= lt!440009 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!440010 () Unit!32849)

(assert (=> b!991646 (= lt!440010 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!440009 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!991646 (arrayContainsKey!0 _keys!1544 lt!440009 #b00000000000000000000000000000000)))

(declare-fun lt!440011 () Unit!32849)

(assert (=> b!991646 (= lt!440011 lt!440010)))

(declare-fun res!662737 () Bool)

(assert (=> b!991646 (= res!662737 (= (seekEntryOrOpen!0 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1544 mask!1948) (Found!9167 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!991646 (=> (not res!662737) (not e!559243))))

(declare-fun d!118083 () Bool)

(declare-fun res!662738 () Bool)

(declare-fun e!559245 () Bool)

(assert (=> d!118083 (=> res!662738 e!559245)))

(assert (=> d!118083 (= res!662738 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30624 _keys!1544)))))

(assert (=> d!118083 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948) e!559245)))

(declare-fun b!991647 () Bool)

(assert (=> b!991647 (= e!559245 e!559244)))

(declare-fun c!100804 () Bool)

(assert (=> b!991647 (= c!100804 (validKeyInArray!0 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!991648 () Bool)

(declare-fun call!42069 () Bool)

(assert (=> b!991648 (= e!559244 call!42069)))

(declare-fun b!991649 () Bool)

(assert (=> b!991649 (= e!559243 call!42069)))

(declare-fun bm!42066 () Bool)

(assert (=> bm!42066 (= call!42069 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(assert (= (and d!118083 (not res!662738)) b!991647))

(assert (= (and b!991647 c!100804) b!991646))

(assert (= (and b!991647 (not c!100804)) b!991648))

(assert (= (and b!991646 res!662737) b!991649))

(assert (= (or b!991649 b!991648) bm!42066))

(assert (=> b!991646 m!919653))

(declare-fun m!919865 () Bool)

(assert (=> b!991646 m!919865))

(declare-fun m!919867 () Bool)

(assert (=> b!991646 m!919867))

(assert (=> b!991646 m!919653))

(declare-fun m!919869 () Bool)

(assert (=> b!991646 m!919869))

(assert (=> b!991647 m!919653))

(assert (=> b!991647 m!919653))

(assert (=> b!991647 m!919655))

(declare-fun m!919871 () Bool)

(assert (=> bm!42066 m!919871))

(assert (=> bm!42007 d!118083))

(declare-fun d!118085 () Bool)

(assert (=> d!118085 (= (get!15673 (select (arr!30143 _values!1278) from!1932) (dynLambda!1901 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14264 (select (arr!30143 _values!1278) from!1932)))))

(assert (=> b!991315 d!118085))

(assert (=> bm!42037 d!117989))

(declare-fun d!118087 () Bool)

(declare-fun e!559246 () Bool)

(assert (=> d!118087 e!559246))

(declare-fun res!662740 () Bool)

(assert (=> d!118087 (=> (not res!662740) (not e!559246))))

(declare-fun lt!440013 () ListLongMap!13627)

(assert (=> d!118087 (= res!662740 (contains!5746 lt!440013 (_1!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!440012 () List!20836)

(assert (=> d!118087 (= lt!440013 (ListLongMap!13628 lt!440012))))

(declare-fun lt!440014 () Unit!32849)

(declare-fun lt!440015 () Unit!32849)

(assert (=> d!118087 (= lt!440014 lt!440015)))

(assert (=> d!118087 (= (getValueByKey!512 lt!440012 (_1!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!517 (_2!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!118087 (= lt!440015 (lemmaContainsTupThenGetReturnValue!274 lt!440012 (_1!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!118087 (= lt!440012 (insertStrictlySorted!331 (toList!6829 call!42030) (_1!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!118087 (= (+!3117 call!42030 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!440013)))

(declare-fun b!991650 () Bool)

(declare-fun res!662739 () Bool)

(assert (=> b!991650 (=> (not res!662739) (not e!559246))))

(assert (=> b!991650 (= res!662739 (= (getValueByKey!512 (toList!6829 lt!440013) (_1!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!517 (_2!7475 (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!991651 () Bool)

(assert (=> b!991651 (= e!559246 (contains!5747 (toList!6829 lt!440013) (tuple2!14929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!118087 res!662740) b!991650))

(assert (= (and b!991650 res!662739) b!991651))

(declare-fun m!919873 () Bool)

(assert (=> d!118087 m!919873))

(declare-fun m!919875 () Bool)

(assert (=> d!118087 m!919875))

(declare-fun m!919877 () Bool)

(assert (=> d!118087 m!919877))

(declare-fun m!919879 () Bool)

(assert (=> d!118087 m!919879))

(declare-fun m!919881 () Bool)

(assert (=> b!991650 m!919881))

(declare-fun m!919883 () Bool)

(assert (=> b!991651 m!919883))

(assert (=> b!991272 d!118087))

(declare-fun d!118089 () Bool)

(assert (=> d!118089 (= (apply!906 lt!439760 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15675 (getValueByKey!512 (toList!6829 lt!439760) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28154 () Bool)

(assert (= bs!28154 d!118089))

(assert (=> bs!28154 m!919833))

(assert (=> bs!28154 m!919833))

(declare-fun m!919885 () Bool)

(assert (=> bs!28154 m!919885))

(assert (=> b!991270 d!118089))

(declare-fun d!118091 () Bool)

(assert (=> d!118091 (= (apply!906 lt!439811 (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15675 (getValueByKey!512 (toList!6829 lt!439811) (select (arr!30144 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(declare-fun bs!28155 () Bool)

(assert (= bs!28155 d!118091))

(assert (=> bs!28155 m!919079))

(assert (=> bs!28155 m!919315))

(assert (=> bs!28155 m!919315))

(declare-fun m!919887 () Bool)

(assert (=> bs!28155 m!919887))

(assert (=> b!991352 d!118091))

(assert (=> b!991352 d!117977))

(declare-fun d!118093 () Bool)

(declare-fun e!559247 () Bool)

(assert (=> d!118093 e!559247))

(declare-fun res!662741 () Bool)

(assert (=> d!118093 (=> res!662741 e!559247)))

(declare-fun lt!440016 () Bool)

(assert (=> d!118093 (= res!662741 (not lt!440016))))

(declare-fun lt!440019 () Bool)

(assert (=> d!118093 (= lt!440016 lt!440019)))

(declare-fun lt!440018 () Unit!32849)

(declare-fun e!559248 () Unit!32849)

(assert (=> d!118093 (= lt!440018 e!559248)))

(declare-fun c!100805 () Bool)

(assert (=> d!118093 (= c!100805 lt!440019)))

(assert (=> d!118093 (= lt!440019 (containsKey!481 (toList!6829 lt!439782) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!118093 (= (contains!5746 lt!439782 #b0000000000000000000000000000000000000000000000000000000000000000) lt!440016)))

(declare-fun b!991652 () Bool)

(declare-fun lt!440017 () Unit!32849)

(assert (=> b!991652 (= e!559248 lt!440017)))

(assert (=> b!991652 (= lt!440017 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6829 lt!439782) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!991652 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439782) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991653 () Bool)

(declare-fun Unit!32869 () Unit!32849)

(assert (=> b!991653 (= e!559248 Unit!32869)))

(declare-fun b!991654 () Bool)

(assert (=> b!991654 (= e!559247 (isDefined!383 (getValueByKey!512 (toList!6829 lt!439782) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!118093 c!100805) b!991652))

(assert (= (and d!118093 (not c!100805)) b!991653))

(assert (= (and d!118093 (not res!662741)) b!991654))

(declare-fun m!919889 () Bool)

(assert (=> d!118093 m!919889))

(declare-fun m!919891 () Bool)

(assert (=> b!991652 m!919891))

(assert (=> b!991652 m!919249))

(assert (=> b!991652 m!919249))

(declare-fun m!919893 () Bool)

(assert (=> b!991652 m!919893))

(assert (=> b!991654 m!919249))

(assert (=> b!991654 m!919249))

(assert (=> b!991654 m!919893))

(assert (=> bm!42035 d!118093))

(declare-fun d!118095 () Bool)

(assert (=> d!118095 (arrayContainsKey!0 _keys!1544 lt!439673 #b00000000000000000000000000000000)))

(declare-fun lt!440022 () Unit!32849)

(declare-fun choose!13 (array!62594 (_ BitVec 64) (_ BitVec 32)) Unit!32849)

(assert (=> d!118095 (= lt!440022 (choose!13 _keys!1544 lt!439673 #b00000000000000000000000000000000))))

(assert (=> d!118095 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!118095 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!439673 #b00000000000000000000000000000000) lt!440022)))

(declare-fun bs!28156 () Bool)

(assert (= bs!28156 d!118095))

(assert (=> bs!28156 m!919021))

(declare-fun m!919895 () Bool)

(assert (=> bs!28156 m!919895))

(assert (=> b!991194 d!118095))

(declare-fun d!118097 () Bool)

(declare-fun res!662746 () Bool)

(declare-fun e!559253 () Bool)

(assert (=> d!118097 (=> res!662746 e!559253)))

(assert (=> d!118097 (= res!662746 (= (select (arr!30144 _keys!1544) #b00000000000000000000000000000000) lt!439673))))

(assert (=> d!118097 (= (arrayContainsKey!0 _keys!1544 lt!439673 #b00000000000000000000000000000000) e!559253)))

(declare-fun b!991659 () Bool)

(declare-fun e!559254 () Bool)

(assert (=> b!991659 (= e!559253 e!559254)))

(declare-fun res!662747 () Bool)

(assert (=> b!991659 (=> (not res!662747) (not e!559254))))

(assert (=> b!991659 (= res!662747 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30624 _keys!1544)))))

(declare-fun b!991660 () Bool)

(assert (=> b!991660 (= e!559254 (arrayContainsKey!0 _keys!1544 lt!439673 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!118097 (not res!662746)) b!991659))

(assert (= (and b!991659 res!662747) b!991660))

(assert (=> d!118097 m!919017))

(declare-fun m!919897 () Bool)

(assert (=> b!991660 m!919897))

(assert (=> b!991194 d!118097))

(declare-fun b!991673 () Bool)

(declare-fun e!559261 () SeekEntryResult!9167)

(declare-fun lt!440029 () SeekEntryResult!9167)

(assert (=> b!991673 (= e!559261 (MissingZero!9167 (index!39041 lt!440029)))))

(declare-fun b!991674 () Bool)

(declare-fun e!559262 () SeekEntryResult!9167)

(assert (=> b!991674 (= e!559262 Undefined!9167)))

(declare-fun b!991675 () Bool)

(declare-fun e!559263 () SeekEntryResult!9167)

(assert (=> b!991675 (= e!559262 e!559263)))

(declare-fun lt!440030 () (_ BitVec 64))

(assert (=> b!991675 (= lt!440030 (select (arr!30144 _keys!1544) (index!39041 lt!440029)))))

(declare-fun c!100814 () Bool)

(assert (=> b!991675 (= c!100814 (= lt!440030 (select (arr!30144 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!991676 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62594 (_ BitVec 32)) SeekEntryResult!9167)

(assert (=> b!991676 (= e!559261 (seekKeyOrZeroReturnVacant!0 (x!86155 lt!440029) (index!39041 lt!440029) (index!39041 lt!440029) (select (arr!30144 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948))))

(declare-fun b!991677 () Bool)

(declare-fun c!100813 () Bool)

(assert (=> b!991677 (= c!100813 (= lt!440030 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!991677 (= e!559263 e!559261)))

(declare-fun b!991678 () Bool)

(assert (=> b!991678 (= e!559263 (Found!9167 (index!39041 lt!440029)))))

(declare-fun d!118099 () Bool)

(declare-fun lt!440031 () SeekEntryResult!9167)

(assert (=> d!118099 (and (or ((_ is Undefined!9167) lt!440031) (not ((_ is Found!9167) lt!440031)) (and (bvsge (index!39040 lt!440031) #b00000000000000000000000000000000) (bvslt (index!39040 lt!440031) (size!30624 _keys!1544)))) (or ((_ is Undefined!9167) lt!440031) ((_ is Found!9167) lt!440031) (not ((_ is MissingZero!9167) lt!440031)) (and (bvsge (index!39039 lt!440031) #b00000000000000000000000000000000) (bvslt (index!39039 lt!440031) (size!30624 _keys!1544)))) (or ((_ is Undefined!9167) lt!440031) ((_ is Found!9167) lt!440031) ((_ is MissingZero!9167) lt!440031) (not ((_ is MissingVacant!9167) lt!440031)) (and (bvsge (index!39042 lt!440031) #b00000000000000000000000000000000) (bvslt (index!39042 lt!440031) (size!30624 _keys!1544)))) (or ((_ is Undefined!9167) lt!440031) (ite ((_ is Found!9167) lt!440031) (= (select (arr!30144 _keys!1544) (index!39040 lt!440031)) (select (arr!30144 _keys!1544) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9167) lt!440031) (= (select (arr!30144 _keys!1544) (index!39039 lt!440031)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9167) lt!440031) (= (select (arr!30144 _keys!1544) (index!39042 lt!440031)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!118099 (= lt!440031 e!559262)))

(declare-fun c!100812 () Bool)

(assert (=> d!118099 (= c!100812 (and ((_ is Intermediate!9167) lt!440029) (undefined!9979 lt!440029)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62594 (_ BitVec 32)) SeekEntryResult!9167)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!118099 (= lt!440029 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30144 _keys!1544) #b00000000000000000000000000000000) mask!1948) (select (arr!30144 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948))))

(assert (=> d!118099 (validMask!0 mask!1948)))

(assert (=> d!118099 (= (seekEntryOrOpen!0 (select (arr!30144 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) lt!440031)))

(assert (= (and d!118099 c!100812) b!991674))

(assert (= (and d!118099 (not c!100812)) b!991675))

(assert (= (and b!991675 c!100814) b!991678))

(assert (= (and b!991675 (not c!100814)) b!991677))

(assert (= (and b!991677 c!100813) b!991673))

(assert (= (and b!991677 (not c!100813)) b!991676))

(declare-fun m!919899 () Bool)

(assert (=> b!991675 m!919899))

(assert (=> b!991676 m!919017))

(declare-fun m!919901 () Bool)

(assert (=> b!991676 m!919901))

(assert (=> d!118099 m!918931))

(declare-fun m!919903 () Bool)

(assert (=> d!118099 m!919903))

(assert (=> d!118099 m!919017))

(declare-fun m!919905 () Bool)

(assert (=> d!118099 m!919905))

(declare-fun m!919907 () Bool)

(assert (=> d!118099 m!919907))

(assert (=> d!118099 m!919017))

(assert (=> d!118099 m!919903))

(declare-fun m!919909 () Bool)

(assert (=> d!118099 m!919909))

(declare-fun m!919911 () Bool)

(assert (=> d!118099 m!919911))

(assert (=> b!991194 d!118099))

(declare-fun mapNonEmpty!36998 () Bool)

(declare-fun mapRes!36998 () Bool)

(declare-fun tp!70043 () Bool)

(declare-fun e!559264 () Bool)

(assert (=> mapNonEmpty!36998 (= mapRes!36998 (and tp!70043 e!559264))))

(declare-fun mapRest!36998 () (Array (_ BitVec 32) ValueCell!11165))

(declare-fun mapKey!36998 () (_ BitVec 32))

(declare-fun mapValue!36998 () ValueCell!11165)

(assert (=> mapNonEmpty!36998 (= mapRest!36997 (store mapRest!36998 mapKey!36998 mapValue!36998))))

(declare-fun b!991679 () Bool)

(assert (=> b!991679 (= e!559264 tp_is_empty!23293)))

(declare-fun b!991680 () Bool)

(declare-fun e!559265 () Bool)

(assert (=> b!991680 (= e!559265 tp_is_empty!23293)))

(declare-fun condMapEmpty!36998 () Bool)

(declare-fun mapDefault!36998 () ValueCell!11165)

(assert (=> mapNonEmpty!36997 (= condMapEmpty!36998 (= mapRest!36997 ((as const (Array (_ BitVec 32) ValueCell!11165)) mapDefault!36998)))))

(assert (=> mapNonEmpty!36997 (= tp!70042 (and e!559265 mapRes!36998))))

(declare-fun mapIsEmpty!36998 () Bool)

(assert (=> mapIsEmpty!36998 mapRes!36998))

(assert (= (and mapNonEmpty!36997 condMapEmpty!36998) mapIsEmpty!36998))

(assert (= (and mapNonEmpty!36997 (not condMapEmpty!36998)) mapNonEmpty!36998))

(assert (= (and mapNonEmpty!36998 ((_ is ValueCellFull!11165) mapValue!36998)) b!991679))

(assert (= (and mapNonEmpty!36997 ((_ is ValueCellFull!11165) mapDefault!36998)) b!991680))

(declare-fun m!919913 () Bool)

(assert (=> mapNonEmpty!36998 m!919913))

(declare-fun b_lambda!15203 () Bool)

(assert (= b_lambda!15201 (or (and start!84834 b_free!20077) b_lambda!15203)))

(declare-fun b_lambda!15205 () Bool)

(assert (= b_lambda!15195 (or (and start!84834 b_free!20077) b_lambda!15205)))

(declare-fun b_lambda!15207 () Bool)

(assert (= b_lambda!15197 (or (and start!84834 b_free!20077) b_lambda!15207)))

(declare-fun b_lambda!15209 () Bool)

(assert (= b_lambda!15199 (or (and start!84834 b_free!20077) b_lambda!15209)))

(check-sat (not b!991626) (not d!117993) (not bm!42064) (not b!991617) (not b!991524) (not b!991676) (not b_lambda!15187) (not d!117969) (not b!991433) (not b!991550) (not d!118069) (not d!118041) (not d!117981) (not b!991504) (not b!991554) (not bm!42055) (not b!991604) (not d!118063) (not b!991488) (not b!991647) (not d!117895) (not b!991497) (not b!991646) (not b_lambda!15191) (not d!117905) (not bm!42053) (not b!991415) (not d!118087) (not b!991616) (not d!117983) (not b!991515) (not bm!42061) (not b!991393) (not b!991516) (not d!117965) (not d!117941) (not d!117921) (not b!991499) (not d!118051) (not b!991641) (not b!991634) (not b!991517) (not b!991618) (not bm!42066) (not b!991570) (not d!118073) (not b!991487) (not b!991525) (not d!118099) (not b!991556) (not b!991596) (not b!991583) (not d!117899) (not b!991506) (not b!991401) (not d!117957) (not b!991383) (not d!117951) (not b!991479) (not b!991637) (not b!991543) (not d!117913) (not d!118009) (not mapNonEmpty!36998) (not d!117943) (not b_lambda!15205) (not b!991457) (not d!118049) (not b!991575) (not d!118067) (not d!118005) (not d!117909) (not b!991654) (not b!991513) (not b!991541) (not b!991378) (not b!991486) (not d!117989) (not b!991484) (not d!118033) (not d!118093) (not b!991459) (not b!991629) (not b!991482) (not d!117917) (not b!991568) (not b!991623) (not b!991620) (not d!117991) (not d!117927) (not b!991561) (not bm!42050) (not d!118071) (not d!117997) (not b!991599) (not b!991545) (not b!991522) (not b!991558) (not d!117971) (not b!991585) (not b!991566) (not d!117955) (not d!117933) (not b!991493) (not b!991507) (not d!118075) (not d!118089) (not b!991455) (not b!991476) (not b!991594) (not b!991650) (not d!117911) (not d!117963) (not d!117931) (not b!991426) (not b!991389) (not d!117987) (not b_lambda!15207) (not b!991660) (not b!991580) (not b!991528) (not d!118007) (not d!117907) (not bm!42052) (not b!991632) (not b!991412) (not d!118043) (not b!991406) (not d!118035) (not d!118059) (not b!991527) (not d!118079) (not d!118081) (not b!991485) (not b!991474) (not b!991368) (not b!991404) (not d!118065) (not d!117949) (not bm!42042) (not b!991432) (not d!118053) (not d!117985) (not b!991589) (not b!991500) (not b!991609) (not b!991387) (not d!117937) (not d!118003) (not d!118039) (not b!991621) (not d!117975) (not b!991391) (not b!991478) (not d!118047) (not b!991511) (not b!991495) (not b!991502) (not b_lambda!15189) (not b!991530) (not b!991413) (not b!991652) (not b!991597) tp_is_empty!23293 (not d!118015) (not b!991611) b_and!32261 (not b!991537) (not b!991582) (not b!991624) (not b!991501) (not d!117961) (not b!991376) (not d!117967) (not b!991605) (not b!991477) (not b_next!20077) (not b!991509) (not b!991466) (not d!117897) (not b!991521) (not d!118055) (not d!118061) (not b!991480) (not b_lambda!15209) (not b!991587) (not b!991547) (not d!117947) (not b!991505) (not b!991496) (not b!991602) (not b!991651) (not d!117923) (not d!117939) (not b!991409) (not b!991407) (not d!118011) (not b!991563) (not d!117945) (not b!991494) (not d!117959) (not d!118013) (not b!991384) (not b!991382) (not d!117953) (not d!117979) (not d!117995) (not b!991370) (not bm!42058) (not b!991467) (not d!117919) (not b!991362) (not b_lambda!15203) (not b!991403) (not b!991533) (not d!117915) (not b!991361) (not b!991394) (not d!118025) (not d!118001) (not d!117903) (not b!991607) (not d!118027) (not b!991627) (not b!991564) (not b!991639) (not b!991544) (not d!117973) (not b!991635) (not b_lambda!15193) (not b!991619) (not d!118091) (not b!991518) (not d!117999) (not b!991577) (not b!991410) (not d!118095) (not b_lambda!15177) (not b!991385) (not b!991465) (not b!991622) (not b!991380) (not b!991468))
(check-sat b_and!32261 (not b_next!20077))
