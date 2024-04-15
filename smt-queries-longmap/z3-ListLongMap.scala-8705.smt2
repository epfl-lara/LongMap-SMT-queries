; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105660 () Bool)

(assert start!105660)

(declare-fun b_free!27265 () Bool)

(declare-fun b_next!27265 () Bool)

(assert (=> start!105660 (= b_free!27265 (not b_next!27265))))

(declare-fun tp!95317 () Bool)

(declare-fun b_and!45121 () Bool)

(assert (=> start!105660 (= tp!95317 b_and!45121)))

(declare-fun res!838865 () Bool)

(declare-fun e!715854 () Bool)

(assert (=> start!105660 (=> (not res!838865) (not e!715854))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105660 (= res!838865 (validMask!0 mask!1466))))

(assert (=> start!105660 e!715854))

(assert (=> start!105660 true))

(assert (=> start!105660 tp!95317))

(declare-fun tp_is_empty!32167 () Bool)

(assert (=> start!105660 tp_is_empty!32167))

(declare-datatypes ((array!81881 0))(
  ( (array!81882 (arr!39497 (Array (_ BitVec 32) (_ BitVec 64))) (size!40035 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81881)

(declare-fun array_inv!30217 (array!81881) Bool)

(assert (=> start!105660 (array_inv!30217 _keys!1118)))

(declare-datatypes ((V!48255 0))(
  ( (V!48256 (val!16146 Int)) )
))
(declare-datatypes ((ValueCell!15320 0))(
  ( (ValueCellFull!15320 (v!18847 V!48255)) (EmptyCell!15320) )
))
(declare-datatypes ((array!81883 0))(
  ( (array!81884 (arr!39498 (Array (_ BitVec 32) ValueCell!15320)) (size!40036 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81883)

(declare-fun e!715852 () Bool)

(declare-fun array_inv!30218 (array!81883) Bool)

(assert (=> start!105660 (and (array_inv!30218 _values!914) e!715852)))

(declare-fun b!1258575 () Bool)

(declare-fun e!715853 () Bool)

(assert (=> b!1258575 (= e!715853 tp_is_empty!32167)))

(declare-fun b!1258576 () Bool)

(declare-fun e!715856 () Bool)

(assert (=> b!1258576 (= e!715854 (not e!715856))))

(declare-fun res!838864 () Bool)

(assert (=> b!1258576 (=> res!838864 e!715856)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1258576 (= res!838864 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20948 0))(
  ( (tuple2!20949 (_1!10485 (_ BitVec 64)) (_2!10485 V!48255)) )
))
(declare-datatypes ((List!28155 0))(
  ( (Nil!28152) (Cons!28151 (h!29360 tuple2!20948) (t!41639 List!28155)) )
))
(declare-datatypes ((ListLongMap!18821 0))(
  ( (ListLongMap!18822 (toList!9426 List!28155)) )
))
(declare-fun lt!569135 () ListLongMap!18821)

(declare-fun lt!569133 () ListLongMap!18821)

(assert (=> b!1258576 (= lt!569135 lt!569133)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48255)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48255)

(declare-datatypes ((Unit!41799 0))(
  ( (Unit!41800) )
))
(declare-fun lt!569132 () Unit!41799)

(declare-fun minValueBefore!43 () V!48255)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1124 (array!81881 array!81883 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48255 V!48255 V!48255 V!48255 (_ BitVec 32) Int) Unit!41799)

(assert (=> b!1258576 (= lt!569132 (lemmaNoChangeToArrayThenSameMapNoExtras!1124 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5802 (array!81881 array!81883 (_ BitVec 32) (_ BitVec 32) V!48255 V!48255 (_ BitVec 32) Int) ListLongMap!18821)

(assert (=> b!1258576 (= lt!569133 (getCurrentListMapNoExtraKeys!5802 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258576 (= lt!569135 (getCurrentListMapNoExtraKeys!5802 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258577 () Bool)

(declare-fun res!838863 () Bool)

(assert (=> b!1258577 (=> (not res!838863) (not e!715854))))

(declare-datatypes ((List!28156 0))(
  ( (Nil!28153) (Cons!28152 (h!29361 (_ BitVec 64)) (t!41640 List!28156)) )
))
(declare-fun arrayNoDuplicates!0 (array!81881 (_ BitVec 32) List!28156) Bool)

(assert (=> b!1258577 (= res!838863 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28153))))

(declare-fun mapNonEmpty!50044 () Bool)

(declare-fun mapRes!50044 () Bool)

(declare-fun tp!95318 () Bool)

(declare-fun e!715855 () Bool)

(assert (=> mapNonEmpty!50044 (= mapRes!50044 (and tp!95318 e!715855))))

(declare-fun mapRest!50044 () (Array (_ BitVec 32) ValueCell!15320))

(declare-fun mapValue!50044 () ValueCell!15320)

(declare-fun mapKey!50044 () (_ BitVec 32))

(assert (=> mapNonEmpty!50044 (= (arr!39498 _values!914) (store mapRest!50044 mapKey!50044 mapValue!50044))))

(declare-fun b!1258578 () Bool)

(declare-fun res!838866 () Bool)

(assert (=> b!1258578 (=> (not res!838866) (not e!715854))))

(assert (=> b!1258578 (= res!838866 (and (= (size!40036 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40035 _keys!1118) (size!40036 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258579 () Bool)

(assert (=> b!1258579 (= e!715855 tp_is_empty!32167)))

(declare-fun b!1258580 () Bool)

(assert (=> b!1258580 (= e!715852 (and e!715853 mapRes!50044))))

(declare-fun condMapEmpty!50044 () Bool)

(declare-fun mapDefault!50044 () ValueCell!15320)

(assert (=> b!1258580 (= condMapEmpty!50044 (= (arr!39498 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15320)) mapDefault!50044)))))

(declare-fun mapIsEmpty!50044 () Bool)

(assert (=> mapIsEmpty!50044 mapRes!50044))

(declare-fun b!1258581 () Bool)

(assert (=> b!1258581 (= e!715856 (bvsle #b00000000000000000000000000000000 (size!40035 _keys!1118)))))

(declare-fun lt!569134 () ListLongMap!18821)

(declare-fun getCurrentListMap!4517 (array!81881 array!81883 (_ BitVec 32) (_ BitVec 32) V!48255 V!48255 (_ BitVec 32) Int) ListLongMap!18821)

(assert (=> b!1258581 (= lt!569134 (getCurrentListMap!4517 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258582 () Bool)

(declare-fun res!838867 () Bool)

(assert (=> b!1258582 (=> (not res!838867) (not e!715854))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81881 (_ BitVec 32)) Bool)

(assert (=> b!1258582 (= res!838867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105660 res!838865) b!1258578))

(assert (= (and b!1258578 res!838866) b!1258582))

(assert (= (and b!1258582 res!838867) b!1258577))

(assert (= (and b!1258577 res!838863) b!1258576))

(assert (= (and b!1258576 (not res!838864)) b!1258581))

(assert (= (and b!1258580 condMapEmpty!50044) mapIsEmpty!50044))

(assert (= (and b!1258580 (not condMapEmpty!50044)) mapNonEmpty!50044))

(get-info :version)

(assert (= (and mapNonEmpty!50044 ((_ is ValueCellFull!15320) mapValue!50044)) b!1258579))

(assert (= (and b!1258580 ((_ is ValueCellFull!15320) mapDefault!50044)) b!1258575))

(assert (= start!105660 b!1258580))

(declare-fun m!1158529 () Bool)

(assert (=> mapNonEmpty!50044 m!1158529))

(declare-fun m!1158531 () Bool)

(assert (=> b!1258581 m!1158531))

(declare-fun m!1158533 () Bool)

(assert (=> b!1258576 m!1158533))

(declare-fun m!1158535 () Bool)

(assert (=> b!1258576 m!1158535))

(declare-fun m!1158537 () Bool)

(assert (=> b!1258576 m!1158537))

(declare-fun m!1158539 () Bool)

(assert (=> b!1258577 m!1158539))

(declare-fun m!1158541 () Bool)

(assert (=> start!105660 m!1158541))

(declare-fun m!1158543 () Bool)

(assert (=> start!105660 m!1158543))

(declare-fun m!1158545 () Bool)

(assert (=> start!105660 m!1158545))

(declare-fun m!1158547 () Bool)

(assert (=> b!1258582 m!1158547))

(check-sat (not b!1258577) b_and!45121 (not mapNonEmpty!50044) (not b!1258582) (not b!1258581) tp_is_empty!32167 (not b!1258576) (not b_next!27265) (not start!105660))
(check-sat b_and!45121 (not b_next!27265))
(get-model)

(declare-fun b!1258641 () Bool)

(declare-fun e!715903 () Bool)

(declare-fun contains!7543 (List!28156 (_ BitVec 64)) Bool)

(assert (=> b!1258641 (= e!715903 (contains!7543 Nil!28153 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1258642 () Bool)

(declare-fun e!715901 () Bool)

(declare-fun call!61833 () Bool)

(assert (=> b!1258642 (= e!715901 call!61833)))

(declare-fun b!1258643 () Bool)

(declare-fun e!715904 () Bool)

(declare-fun e!715902 () Bool)

(assert (=> b!1258643 (= e!715904 e!715902)))

(declare-fun res!838905 () Bool)

(assert (=> b!1258643 (=> (not res!838905) (not e!715902))))

(assert (=> b!1258643 (= res!838905 (not e!715903))))

(declare-fun res!838906 () Bool)

(assert (=> b!1258643 (=> (not res!838906) (not e!715903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1258643 (= res!838906 (validKeyInArray!0 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138171 () Bool)

(declare-fun res!838904 () Bool)

(assert (=> d!138171 (=> res!838904 e!715904)))

(assert (=> d!138171 (= res!838904 (bvsge #b00000000000000000000000000000000 (size!40035 _keys!1118)))))

(assert (=> d!138171 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28153) e!715904)))

(declare-fun b!1258644 () Bool)

(assert (=> b!1258644 (= e!715902 e!715901)))

(declare-fun c!122501 () Bool)

(assert (=> b!1258644 (= c!122501 (validKeyInArray!0 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61830 () Bool)

(assert (=> bm!61830 (= call!61833 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122501 (Cons!28152 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000) Nil!28153) Nil!28153)))))

(declare-fun b!1258645 () Bool)

(assert (=> b!1258645 (= e!715901 call!61833)))

(assert (= (and d!138171 (not res!838904)) b!1258643))

(assert (= (and b!1258643 res!838906) b!1258641))

(assert (= (and b!1258643 res!838905) b!1258644))

(assert (= (and b!1258644 c!122501) b!1258642))

(assert (= (and b!1258644 (not c!122501)) b!1258645))

(assert (= (or b!1258642 b!1258645) bm!61830))

(declare-fun m!1158589 () Bool)

(assert (=> b!1258641 m!1158589))

(assert (=> b!1258641 m!1158589))

(declare-fun m!1158591 () Bool)

(assert (=> b!1258641 m!1158591))

(assert (=> b!1258643 m!1158589))

(assert (=> b!1258643 m!1158589))

(declare-fun m!1158593 () Bool)

(assert (=> b!1258643 m!1158593))

(assert (=> b!1258644 m!1158589))

(assert (=> b!1258644 m!1158589))

(assert (=> b!1258644 m!1158593))

(assert (=> bm!61830 m!1158589))

(declare-fun m!1158595 () Bool)

(assert (=> bm!61830 m!1158595))

(assert (=> b!1258577 d!138171))

(declare-fun b!1258654 () Bool)

(declare-fun e!715911 () Bool)

(declare-fun e!715913 () Bool)

(assert (=> b!1258654 (= e!715911 e!715913)))

(declare-fun lt!569167 () (_ BitVec 64))

(assert (=> b!1258654 (= lt!569167 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!569166 () Unit!41799)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81881 (_ BitVec 64) (_ BitVec 32)) Unit!41799)

(assert (=> b!1258654 (= lt!569166 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!569167 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1258654 (arrayContainsKey!0 _keys!1118 lt!569167 #b00000000000000000000000000000000)))

(declare-fun lt!569168 () Unit!41799)

(assert (=> b!1258654 (= lt!569168 lt!569166)))

(declare-fun res!838912 () Bool)

(declare-datatypes ((SeekEntryResult!9968 0))(
  ( (MissingZero!9968 (index!42243 (_ BitVec 32))) (Found!9968 (index!42244 (_ BitVec 32))) (Intermediate!9968 (undefined!10780 Bool) (index!42245 (_ BitVec 32)) (x!110881 (_ BitVec 32))) (Undefined!9968) (MissingVacant!9968 (index!42246 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81881 (_ BitVec 32)) SeekEntryResult!9968)

(assert (=> b!1258654 (= res!838912 (= (seekEntryOrOpen!0 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9968 #b00000000000000000000000000000000)))))

(assert (=> b!1258654 (=> (not res!838912) (not e!715913))))

(declare-fun b!1258655 () Bool)

(declare-fun e!715912 () Bool)

(assert (=> b!1258655 (= e!715912 e!715911)))

(declare-fun c!122504 () Bool)

(assert (=> b!1258655 (= c!122504 (validKeyInArray!0 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138173 () Bool)

(declare-fun res!838911 () Bool)

(assert (=> d!138173 (=> res!838911 e!715912)))

(assert (=> d!138173 (= res!838911 (bvsge #b00000000000000000000000000000000 (size!40035 _keys!1118)))))

(assert (=> d!138173 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!715912)))

(declare-fun b!1258656 () Bool)

(declare-fun call!61836 () Bool)

(assert (=> b!1258656 (= e!715911 call!61836)))

(declare-fun bm!61833 () Bool)

(assert (=> bm!61833 (= call!61836 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1258657 () Bool)

(assert (=> b!1258657 (= e!715913 call!61836)))

(assert (= (and d!138173 (not res!838911)) b!1258655))

(assert (= (and b!1258655 c!122504) b!1258654))

(assert (= (and b!1258655 (not c!122504)) b!1258656))

(assert (= (and b!1258654 res!838912) b!1258657))

(assert (= (or b!1258657 b!1258656) bm!61833))

(assert (=> b!1258654 m!1158589))

(declare-fun m!1158597 () Bool)

(assert (=> b!1258654 m!1158597))

(declare-fun m!1158599 () Bool)

(assert (=> b!1258654 m!1158599))

(assert (=> b!1258654 m!1158589))

(declare-fun m!1158601 () Bool)

(assert (=> b!1258654 m!1158601))

(assert (=> b!1258655 m!1158589))

(assert (=> b!1258655 m!1158589))

(assert (=> b!1258655 m!1158593))

(declare-fun m!1158603 () Bool)

(assert (=> bm!61833 m!1158603))

(assert (=> b!1258582 d!138173))

(declare-fun b!1258700 () Bool)

(declare-fun lt!569216 () ListLongMap!18821)

(declare-fun e!715944 () Bool)

(declare-fun apply!984 (ListLongMap!18821 (_ BitVec 64)) V!48255)

(declare-fun get!20199 (ValueCell!15320 V!48255) V!48255)

(declare-fun dynLambda!3414 (Int (_ BitVec 64)) V!48255)

(assert (=> b!1258700 (= e!715944 (= (apply!984 lt!569216 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000)) (get!20199 (select (arr!39498 _values!914) #b00000000000000000000000000000000) (dynLambda!3414 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1258700 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40036 _values!914)))))

(assert (=> b!1258700 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40035 _keys!1118)))))

(declare-fun bm!61848 () Bool)

(declare-fun call!61852 () Bool)

(declare-fun contains!7544 (ListLongMap!18821 (_ BitVec 64)) Bool)

(assert (=> bm!61848 (= call!61852 (contains!7544 lt!569216 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1258701 () Bool)

(declare-fun e!715952 () ListLongMap!18821)

(declare-fun call!61857 () ListLongMap!18821)

(assert (=> b!1258701 (= e!715952 call!61857)))

(declare-fun b!1258702 () Bool)

(declare-fun res!838936 () Bool)

(declare-fun e!715943 () Bool)

(assert (=> b!1258702 (=> (not res!838936) (not e!715943))))

(declare-fun e!715947 () Bool)

(assert (=> b!1258702 (= res!838936 e!715947)))

(declare-fun res!838939 () Bool)

(assert (=> b!1258702 (=> res!838939 e!715947)))

(declare-fun e!715945 () Bool)

(assert (=> b!1258702 (= res!838939 (not e!715945))))

(declare-fun res!838938 () Bool)

(assert (=> b!1258702 (=> (not res!838938) (not e!715945))))

(assert (=> b!1258702 (= res!838938 (bvslt #b00000000000000000000000000000000 (size!40035 _keys!1118)))))

(declare-fun b!1258703 () Bool)

(declare-fun e!715950 () Bool)

(assert (=> b!1258703 (= e!715950 (= (apply!984 lt!569216 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1258704 () Bool)

(declare-fun e!715942 () ListLongMap!18821)

(declare-fun call!61856 () ListLongMap!18821)

(declare-fun +!4229 (ListLongMap!18821 tuple2!20948) ListLongMap!18821)

(assert (=> b!1258704 (= e!715942 (+!4229 call!61856 (tuple2!20949 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1258705 () Bool)

(declare-fun e!715941 () Unit!41799)

(declare-fun Unit!41803 () Unit!41799)

(assert (=> b!1258705 (= e!715941 Unit!41803)))

(declare-fun bm!61849 () Bool)

(declare-fun call!61851 () Bool)

(assert (=> bm!61849 (= call!61851 (contains!7544 lt!569216 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1258706 () Bool)

(declare-fun c!122520 () Bool)

(assert (=> b!1258706 (= c!122520 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!715946 () ListLongMap!18821)

(assert (=> b!1258706 (= e!715952 e!715946)))

(declare-fun bm!61850 () Bool)

(declare-fun call!61855 () ListLongMap!18821)

(declare-fun call!61853 () ListLongMap!18821)

(assert (=> bm!61850 (= call!61855 call!61853)))

(declare-fun b!1258707 () Bool)

(assert (=> b!1258707 (= e!715942 e!715952)))

(declare-fun c!122517 () Bool)

(assert (=> b!1258707 (= c!122517 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258708 () Bool)

(declare-fun res!838932 () Bool)

(assert (=> b!1258708 (=> (not res!838932) (not e!715943))))

(declare-fun e!715940 () Bool)

(assert (=> b!1258708 (= res!838932 e!715940)))

(declare-fun c!122522 () Bool)

(assert (=> b!1258708 (= c!122522 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!61851 () Bool)

(declare-fun call!61854 () ListLongMap!18821)

(assert (=> bm!61851 (= call!61853 call!61854)))

(declare-fun b!1258709 () Bool)

(assert (=> b!1258709 (= e!715946 call!61855)))

(declare-fun b!1258710 () Bool)

(assert (=> b!1258710 (= e!715940 (not call!61852))))

(declare-fun b!1258711 () Bool)

(declare-fun e!715949 () Bool)

(assert (=> b!1258711 (= e!715940 e!715949)))

(declare-fun res!838933 () Bool)

(assert (=> b!1258711 (= res!838933 call!61852)))

(assert (=> b!1258711 (=> (not res!838933) (not e!715949))))

(declare-fun b!1258712 () Bool)

(declare-fun e!715951 () Bool)

(assert (=> b!1258712 (= e!715943 e!715951)))

(declare-fun c!122518 () Bool)

(assert (=> b!1258712 (= c!122518 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258713 () Bool)

(assert (=> b!1258713 (= e!715951 e!715950)))

(declare-fun res!838934 () Bool)

(assert (=> b!1258713 (= res!838934 call!61851)))

(assert (=> b!1258713 (=> (not res!838934) (not e!715950))))

(declare-fun bm!61852 () Bool)

(assert (=> bm!61852 (= call!61854 (getCurrentListMapNoExtraKeys!5802 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun bm!61853 () Bool)

(assert (=> bm!61853 (= call!61857 call!61856)))

(declare-fun b!1258714 () Bool)

(assert (=> b!1258714 (= e!715949 (= (apply!984 lt!569216 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1258715 () Bool)

(declare-fun lt!569223 () Unit!41799)

(assert (=> b!1258715 (= e!715941 lt!569223)))

(declare-fun lt!569229 () ListLongMap!18821)

(assert (=> b!1258715 (= lt!569229 (getCurrentListMapNoExtraKeys!5802 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!569218 () (_ BitVec 64))

(assert (=> b!1258715 (= lt!569218 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!569234 () (_ BitVec 64))

(assert (=> b!1258715 (= lt!569234 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!569222 () Unit!41799)

(declare-fun addStillContains!1082 (ListLongMap!18821 (_ BitVec 64) V!48255 (_ BitVec 64)) Unit!41799)

(assert (=> b!1258715 (= lt!569222 (addStillContains!1082 lt!569229 lt!569218 zeroValue!871 lt!569234))))

(assert (=> b!1258715 (contains!7544 (+!4229 lt!569229 (tuple2!20949 lt!569218 zeroValue!871)) lt!569234)))

(declare-fun lt!569217 () Unit!41799)

(assert (=> b!1258715 (= lt!569217 lt!569222)))

(declare-fun lt!569220 () ListLongMap!18821)

(assert (=> b!1258715 (= lt!569220 (getCurrentListMapNoExtraKeys!5802 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!569232 () (_ BitVec 64))

(assert (=> b!1258715 (= lt!569232 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!569230 () (_ BitVec 64))

(assert (=> b!1258715 (= lt!569230 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!569213 () Unit!41799)

(declare-fun addApplyDifferent!525 (ListLongMap!18821 (_ BitVec 64) V!48255 (_ BitVec 64)) Unit!41799)

(assert (=> b!1258715 (= lt!569213 (addApplyDifferent!525 lt!569220 lt!569232 minValueBefore!43 lt!569230))))

(assert (=> b!1258715 (= (apply!984 (+!4229 lt!569220 (tuple2!20949 lt!569232 minValueBefore!43)) lt!569230) (apply!984 lt!569220 lt!569230))))

(declare-fun lt!569224 () Unit!41799)

(assert (=> b!1258715 (= lt!569224 lt!569213)))

(declare-fun lt!569233 () ListLongMap!18821)

(assert (=> b!1258715 (= lt!569233 (getCurrentListMapNoExtraKeys!5802 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!569227 () (_ BitVec 64))

(assert (=> b!1258715 (= lt!569227 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!569228 () (_ BitVec 64))

(assert (=> b!1258715 (= lt!569228 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!569226 () Unit!41799)

(assert (=> b!1258715 (= lt!569226 (addApplyDifferent!525 lt!569233 lt!569227 zeroValue!871 lt!569228))))

(assert (=> b!1258715 (= (apply!984 (+!4229 lt!569233 (tuple2!20949 lt!569227 zeroValue!871)) lt!569228) (apply!984 lt!569233 lt!569228))))

(declare-fun lt!569221 () Unit!41799)

(assert (=> b!1258715 (= lt!569221 lt!569226)))

(declare-fun lt!569215 () ListLongMap!18821)

(assert (=> b!1258715 (= lt!569215 (getCurrentListMapNoExtraKeys!5802 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!569219 () (_ BitVec 64))

(assert (=> b!1258715 (= lt!569219 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!569231 () (_ BitVec 64))

(assert (=> b!1258715 (= lt!569231 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1258715 (= lt!569223 (addApplyDifferent!525 lt!569215 lt!569219 minValueBefore!43 lt!569231))))

(assert (=> b!1258715 (= (apply!984 (+!4229 lt!569215 (tuple2!20949 lt!569219 minValueBefore!43)) lt!569231) (apply!984 lt!569215 lt!569231))))

(declare-fun d!138175 () Bool)

(assert (=> d!138175 e!715943))

(declare-fun res!838937 () Bool)

(assert (=> d!138175 (=> (not res!838937) (not e!715943))))

(assert (=> d!138175 (= res!838937 (or (bvsge #b00000000000000000000000000000000 (size!40035 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40035 _keys!1118)))))))

(declare-fun lt!569214 () ListLongMap!18821)

(assert (=> d!138175 (= lt!569216 lt!569214)))

(declare-fun lt!569225 () Unit!41799)

(assert (=> d!138175 (= lt!569225 e!715941)))

(declare-fun c!122521 () Bool)

(declare-fun e!715948 () Bool)

(assert (=> d!138175 (= c!122521 e!715948)))

(declare-fun res!838931 () Bool)

(assert (=> d!138175 (=> (not res!838931) (not e!715948))))

(assert (=> d!138175 (= res!838931 (bvslt #b00000000000000000000000000000000 (size!40035 _keys!1118)))))

(assert (=> d!138175 (= lt!569214 e!715942)))

(declare-fun c!122519 () Bool)

(assert (=> d!138175 (= c!122519 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138175 (validMask!0 mask!1466)))

(assert (=> d!138175 (= (getCurrentListMap!4517 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!569216)))

(declare-fun b!1258716 () Bool)

(assert (=> b!1258716 (= e!715948 (validKeyInArray!0 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1258717 () Bool)

(assert (=> b!1258717 (= e!715946 call!61857)))

(declare-fun b!1258718 () Bool)

(assert (=> b!1258718 (= e!715947 e!715944)))

(declare-fun res!838935 () Bool)

(assert (=> b!1258718 (=> (not res!838935) (not e!715944))))

(assert (=> b!1258718 (= res!838935 (contains!7544 lt!569216 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1258718 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40035 _keys!1118)))))

(declare-fun bm!61854 () Bool)

(assert (=> bm!61854 (= call!61856 (+!4229 (ite c!122519 call!61854 (ite c!122517 call!61853 call!61855)) (ite (or c!122519 c!122517) (tuple2!20949 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20949 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1258719 () Bool)

(assert (=> b!1258719 (= e!715951 (not call!61851))))

(declare-fun b!1258720 () Bool)

(assert (=> b!1258720 (= e!715945 (validKeyInArray!0 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138175 c!122519) b!1258704))

(assert (= (and d!138175 (not c!122519)) b!1258707))

(assert (= (and b!1258707 c!122517) b!1258701))

(assert (= (and b!1258707 (not c!122517)) b!1258706))

(assert (= (and b!1258706 c!122520) b!1258717))

(assert (= (and b!1258706 (not c!122520)) b!1258709))

(assert (= (or b!1258717 b!1258709) bm!61850))

(assert (= (or b!1258701 bm!61850) bm!61851))

(assert (= (or b!1258701 b!1258717) bm!61853))

(assert (= (or b!1258704 bm!61851) bm!61852))

(assert (= (or b!1258704 bm!61853) bm!61854))

(assert (= (and d!138175 res!838931) b!1258716))

(assert (= (and d!138175 c!122521) b!1258715))

(assert (= (and d!138175 (not c!122521)) b!1258705))

(assert (= (and d!138175 res!838937) b!1258702))

(assert (= (and b!1258702 res!838938) b!1258720))

(assert (= (and b!1258702 (not res!838939)) b!1258718))

(assert (= (and b!1258718 res!838935) b!1258700))

(assert (= (and b!1258702 res!838936) b!1258708))

(assert (= (and b!1258708 c!122522) b!1258711))

(assert (= (and b!1258708 (not c!122522)) b!1258710))

(assert (= (and b!1258711 res!838933) b!1258714))

(assert (= (or b!1258711 b!1258710) bm!61848))

(assert (= (and b!1258708 res!838932) b!1258712))

(assert (= (and b!1258712 c!122518) b!1258713))

(assert (= (and b!1258712 (not c!122518)) b!1258719))

(assert (= (and b!1258713 res!838934) b!1258703))

(assert (= (or b!1258713 b!1258719) bm!61849))

(declare-fun b_lambda!22713 () Bool)

(assert (=> (not b_lambda!22713) (not b!1258700)))

(declare-fun t!41645 () Bool)

(declare-fun tb!11301 () Bool)

(assert (=> (and start!105660 (= defaultEntry!922 defaultEntry!922) t!41645) tb!11301))

(declare-fun result!23327 () Bool)

(assert (=> tb!11301 (= result!23327 tp_is_empty!32167)))

(assert (=> b!1258700 t!41645))

(declare-fun b_and!45127 () Bool)

(assert (= b_and!45121 (and (=> t!41645 result!23327) b_and!45127)))

(declare-fun m!1158605 () Bool)

(assert (=> bm!61848 m!1158605))

(assert (=> d!138175 m!1158541))

(assert (=> b!1258720 m!1158589))

(assert (=> b!1258720 m!1158589))

(assert (=> b!1258720 m!1158593))

(declare-fun m!1158607 () Bool)

(assert (=> b!1258704 m!1158607))

(assert (=> bm!61852 m!1158537))

(assert (=> b!1258716 m!1158589))

(assert (=> b!1258716 m!1158589))

(assert (=> b!1258716 m!1158593))

(declare-fun m!1158609 () Bool)

(assert (=> b!1258715 m!1158609))

(declare-fun m!1158611 () Bool)

(assert (=> b!1258715 m!1158611))

(declare-fun m!1158613 () Bool)

(assert (=> b!1258715 m!1158613))

(assert (=> b!1258715 m!1158537))

(assert (=> b!1258715 m!1158589))

(declare-fun m!1158615 () Bool)

(assert (=> b!1258715 m!1158615))

(declare-fun m!1158617 () Bool)

(assert (=> b!1258715 m!1158617))

(declare-fun m!1158619 () Bool)

(assert (=> b!1258715 m!1158619))

(declare-fun m!1158621 () Bool)

(assert (=> b!1258715 m!1158621))

(declare-fun m!1158623 () Bool)

(assert (=> b!1258715 m!1158623))

(assert (=> b!1258715 m!1158613))

(declare-fun m!1158625 () Bool)

(assert (=> b!1258715 m!1158625))

(assert (=> b!1258715 m!1158615))

(declare-fun m!1158627 () Bool)

(assert (=> b!1258715 m!1158627))

(declare-fun m!1158629 () Bool)

(assert (=> b!1258715 m!1158629))

(declare-fun m!1158631 () Bool)

(assert (=> b!1258715 m!1158631))

(assert (=> b!1258715 m!1158609))

(declare-fun m!1158633 () Bool)

(assert (=> b!1258715 m!1158633))

(assert (=> b!1258715 m!1158619))

(declare-fun m!1158635 () Bool)

(assert (=> b!1258715 m!1158635))

(declare-fun m!1158637 () Bool)

(assert (=> b!1258715 m!1158637))

(declare-fun m!1158639 () Bool)

(assert (=> b!1258703 m!1158639))

(declare-fun m!1158641 () Bool)

(assert (=> bm!61849 m!1158641))

(declare-fun m!1158643 () Bool)

(assert (=> b!1258700 m!1158643))

(declare-fun m!1158645 () Bool)

(assert (=> b!1258700 m!1158645))

(assert (=> b!1258700 m!1158643))

(declare-fun m!1158647 () Bool)

(assert (=> b!1258700 m!1158647))

(assert (=> b!1258700 m!1158645))

(assert (=> b!1258700 m!1158589))

(declare-fun m!1158649 () Bool)

(assert (=> b!1258700 m!1158649))

(assert (=> b!1258700 m!1158589))

(declare-fun m!1158651 () Bool)

(assert (=> b!1258714 m!1158651))

(declare-fun m!1158653 () Bool)

(assert (=> bm!61854 m!1158653))

(assert (=> b!1258718 m!1158589))

(assert (=> b!1258718 m!1158589))

(declare-fun m!1158655 () Bool)

(assert (=> b!1258718 m!1158655))

(assert (=> b!1258581 d!138175))

(declare-fun d!138177 () Bool)

(assert (=> d!138177 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105660 d!138177))

(declare-fun d!138179 () Bool)

(assert (=> d!138179 (= (array_inv!30217 _keys!1118) (bvsge (size!40035 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105660 d!138179))

(declare-fun d!138181 () Bool)

(assert (=> d!138181 (= (array_inv!30218 _values!914) (bvsge (size!40036 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105660 d!138181))

(declare-fun d!138183 () Bool)

(assert (=> d!138183 (= (getCurrentListMapNoExtraKeys!5802 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5802 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!569237 () Unit!41799)

(declare-fun choose!1872 (array!81881 array!81883 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48255 V!48255 V!48255 V!48255 (_ BitVec 32) Int) Unit!41799)

(assert (=> d!138183 (= lt!569237 (choose!1872 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138183 (validMask!0 mask!1466)))

(assert (=> d!138183 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1124 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!569237)))

(declare-fun bs!35579 () Bool)

(assert (= bs!35579 d!138183))

(assert (=> bs!35579 m!1158537))

(assert (=> bs!35579 m!1158535))

(declare-fun m!1158657 () Bool)

(assert (=> bs!35579 m!1158657))

(assert (=> bs!35579 m!1158541))

(assert (=> b!1258576 d!138183))

(declare-fun call!61860 () ListLongMap!18821)

(declare-fun bm!61857 () Bool)

(assert (=> bm!61857 (= call!61860 (getCurrentListMapNoExtraKeys!5802 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1258747 () Bool)

(declare-fun e!715969 () ListLongMap!18821)

(declare-fun e!715970 () ListLongMap!18821)

(assert (=> b!1258747 (= e!715969 e!715970)))

(declare-fun c!122533 () Bool)

(assert (=> b!1258747 (= c!122533 (validKeyInArray!0 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1258748 () Bool)

(declare-fun lt!569256 () ListLongMap!18821)

(declare-fun e!715972 () Bool)

(assert (=> b!1258748 (= e!715972 (= lt!569256 (getCurrentListMapNoExtraKeys!5802 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun d!138185 () Bool)

(declare-fun e!715973 () Bool)

(assert (=> d!138185 e!715973))

(declare-fun res!838950 () Bool)

(assert (=> d!138185 (=> (not res!838950) (not e!715973))))

(assert (=> d!138185 (= res!838950 (not (contains!7544 lt!569256 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138185 (= lt!569256 e!715969)))

(declare-fun c!122534 () Bool)

(assert (=> d!138185 (= c!122534 (bvsge #b00000000000000000000000000000000 (size!40035 _keys!1118)))))

(assert (=> d!138185 (validMask!0 mask!1466)))

(assert (=> d!138185 (= (getCurrentListMapNoExtraKeys!5802 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!569256)))

(declare-fun b!1258749 () Bool)

(declare-fun res!838949 () Bool)

(assert (=> b!1258749 (=> (not res!838949) (not e!715973))))

(assert (=> b!1258749 (= res!838949 (not (contains!7544 lt!569256 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1258750 () Bool)

(assert (=> b!1258750 (= e!715969 (ListLongMap!18822 Nil!28152))))

(declare-fun b!1258751 () Bool)

(declare-fun e!715968 () Bool)

(assert (=> b!1258751 (= e!715973 e!715968)))

(declare-fun c!122531 () Bool)

(declare-fun e!715971 () Bool)

(assert (=> b!1258751 (= c!122531 e!715971)))

(declare-fun res!838951 () Bool)

(assert (=> b!1258751 (=> (not res!838951) (not e!715971))))

(assert (=> b!1258751 (= res!838951 (bvslt #b00000000000000000000000000000000 (size!40035 _keys!1118)))))

(declare-fun b!1258752 () Bool)

(declare-fun isEmpty!1039 (ListLongMap!18821) Bool)

(assert (=> b!1258752 (= e!715972 (isEmpty!1039 lt!569256))))

(declare-fun b!1258753 () Bool)

(declare-fun lt!569254 () Unit!41799)

(declare-fun lt!569252 () Unit!41799)

(assert (=> b!1258753 (= lt!569254 lt!569252)))

(declare-fun lt!569253 () V!48255)

(declare-fun lt!569258 () (_ BitVec 64))

(declare-fun lt!569257 () ListLongMap!18821)

(declare-fun lt!569255 () (_ BitVec 64))

(assert (=> b!1258753 (not (contains!7544 (+!4229 lt!569257 (tuple2!20949 lt!569255 lt!569253)) lt!569258))))

(declare-fun addStillNotContains!320 (ListLongMap!18821 (_ BitVec 64) V!48255 (_ BitVec 64)) Unit!41799)

(assert (=> b!1258753 (= lt!569252 (addStillNotContains!320 lt!569257 lt!569255 lt!569253 lt!569258))))

(assert (=> b!1258753 (= lt!569258 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1258753 (= lt!569253 (get!20199 (select (arr!39498 _values!914) #b00000000000000000000000000000000) (dynLambda!3414 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1258753 (= lt!569255 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1258753 (= lt!569257 call!61860)))

(assert (=> b!1258753 (= e!715970 (+!4229 call!61860 (tuple2!20949 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000) (get!20199 (select (arr!39498 _values!914) #b00000000000000000000000000000000) (dynLambda!3414 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1258754 () Bool)

(assert (=> b!1258754 (= e!715968 e!715972)))

(declare-fun c!122532 () Bool)

(assert (=> b!1258754 (= c!122532 (bvslt #b00000000000000000000000000000000 (size!40035 _keys!1118)))))

(declare-fun b!1258755 () Bool)

(assert (=> b!1258755 (= e!715971 (validKeyInArray!0 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1258755 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1258756 () Bool)

(declare-fun e!715967 () Bool)

(assert (=> b!1258756 (= e!715968 e!715967)))

(assert (=> b!1258756 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40035 _keys!1118)))))

(declare-fun res!838948 () Bool)

(assert (=> b!1258756 (= res!838948 (contains!7544 lt!569256 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1258756 (=> (not res!838948) (not e!715967))))

(declare-fun b!1258757 () Bool)

(assert (=> b!1258757 (= e!715970 call!61860)))

(declare-fun b!1258758 () Bool)

(assert (=> b!1258758 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40035 _keys!1118)))))

(assert (=> b!1258758 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40036 _values!914)))))

(assert (=> b!1258758 (= e!715967 (= (apply!984 lt!569256 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000)) (get!20199 (select (arr!39498 _values!914) #b00000000000000000000000000000000) (dynLambda!3414 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!138185 c!122534) b!1258750))

(assert (= (and d!138185 (not c!122534)) b!1258747))

(assert (= (and b!1258747 c!122533) b!1258753))

(assert (= (and b!1258747 (not c!122533)) b!1258757))

(assert (= (or b!1258753 b!1258757) bm!61857))

(assert (= (and d!138185 res!838950) b!1258749))

(assert (= (and b!1258749 res!838949) b!1258751))

(assert (= (and b!1258751 res!838951) b!1258755))

(assert (= (and b!1258751 c!122531) b!1258756))

(assert (= (and b!1258751 (not c!122531)) b!1258754))

(assert (= (and b!1258756 res!838948) b!1258758))

(assert (= (and b!1258754 c!122532) b!1258748))

(assert (= (and b!1258754 (not c!122532)) b!1258752))

(declare-fun b_lambda!22715 () Bool)

(assert (=> (not b_lambda!22715) (not b!1258753)))

(assert (=> b!1258753 t!41645))

(declare-fun b_and!45129 () Bool)

(assert (= b_and!45127 (and (=> t!41645 result!23327) b_and!45129)))

(declare-fun b_lambda!22717 () Bool)

(assert (=> (not b_lambda!22717) (not b!1258758)))

(assert (=> b!1258758 t!41645))

(declare-fun b_and!45131 () Bool)

(assert (= b_and!45129 (and (=> t!41645 result!23327) b_and!45131)))

(assert (=> b!1258758 m!1158645))

(assert (=> b!1258758 m!1158645))

(assert (=> b!1258758 m!1158643))

(assert (=> b!1258758 m!1158647))

(assert (=> b!1258758 m!1158643))

(assert (=> b!1258758 m!1158589))

(declare-fun m!1158659 () Bool)

(assert (=> b!1258758 m!1158659))

(assert (=> b!1258758 m!1158589))

(assert (=> b!1258756 m!1158589))

(assert (=> b!1258756 m!1158589))

(declare-fun m!1158661 () Bool)

(assert (=> b!1258756 m!1158661))

(declare-fun m!1158663 () Bool)

(assert (=> b!1258749 m!1158663))

(declare-fun m!1158665 () Bool)

(assert (=> bm!61857 m!1158665))

(assert (=> b!1258747 m!1158589))

(assert (=> b!1258747 m!1158589))

(assert (=> b!1258747 m!1158593))

(assert (=> b!1258748 m!1158665))

(assert (=> b!1258755 m!1158589))

(assert (=> b!1258755 m!1158589))

(assert (=> b!1258755 m!1158593))

(assert (=> b!1258753 m!1158645))

(assert (=> b!1258753 m!1158645))

(assert (=> b!1258753 m!1158643))

(assert (=> b!1258753 m!1158647))

(declare-fun m!1158667 () Bool)

(assert (=> b!1258753 m!1158667))

(declare-fun m!1158669 () Bool)

(assert (=> b!1258753 m!1158669))

(declare-fun m!1158671 () Bool)

(assert (=> b!1258753 m!1158671))

(assert (=> b!1258753 m!1158669))

(assert (=> b!1258753 m!1158589))

(declare-fun m!1158673 () Bool)

(assert (=> b!1258753 m!1158673))

(assert (=> b!1258753 m!1158643))

(declare-fun m!1158675 () Bool)

(assert (=> b!1258752 m!1158675))

(declare-fun m!1158677 () Bool)

(assert (=> d!138185 m!1158677))

(assert (=> d!138185 m!1158541))

(assert (=> b!1258576 d!138185))

(declare-fun call!61861 () ListLongMap!18821)

(declare-fun bm!61858 () Bool)

(assert (=> bm!61858 (= call!61861 (getCurrentListMapNoExtraKeys!5802 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1258759 () Bool)

(declare-fun e!715976 () ListLongMap!18821)

(declare-fun e!715977 () ListLongMap!18821)

(assert (=> b!1258759 (= e!715976 e!715977)))

(declare-fun c!122537 () Bool)

(assert (=> b!1258759 (= c!122537 (validKeyInArray!0 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1258760 () Bool)

(declare-fun lt!569263 () ListLongMap!18821)

(declare-fun e!715979 () Bool)

(assert (=> b!1258760 (= e!715979 (= lt!569263 (getCurrentListMapNoExtraKeys!5802 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun d!138187 () Bool)

(declare-fun e!715980 () Bool)

(assert (=> d!138187 e!715980))

(declare-fun res!838954 () Bool)

(assert (=> d!138187 (=> (not res!838954) (not e!715980))))

(assert (=> d!138187 (= res!838954 (not (contains!7544 lt!569263 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138187 (= lt!569263 e!715976)))

(declare-fun c!122538 () Bool)

(assert (=> d!138187 (= c!122538 (bvsge #b00000000000000000000000000000000 (size!40035 _keys!1118)))))

(assert (=> d!138187 (validMask!0 mask!1466)))

(assert (=> d!138187 (= (getCurrentListMapNoExtraKeys!5802 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!569263)))

(declare-fun b!1258761 () Bool)

(declare-fun res!838953 () Bool)

(assert (=> b!1258761 (=> (not res!838953) (not e!715980))))

(assert (=> b!1258761 (= res!838953 (not (contains!7544 lt!569263 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1258762 () Bool)

(assert (=> b!1258762 (= e!715976 (ListLongMap!18822 Nil!28152))))

(declare-fun b!1258763 () Bool)

(declare-fun e!715975 () Bool)

(assert (=> b!1258763 (= e!715980 e!715975)))

(declare-fun c!122535 () Bool)

(declare-fun e!715978 () Bool)

(assert (=> b!1258763 (= c!122535 e!715978)))

(declare-fun res!838955 () Bool)

(assert (=> b!1258763 (=> (not res!838955) (not e!715978))))

(assert (=> b!1258763 (= res!838955 (bvslt #b00000000000000000000000000000000 (size!40035 _keys!1118)))))

(declare-fun b!1258764 () Bool)

(assert (=> b!1258764 (= e!715979 (isEmpty!1039 lt!569263))))

(declare-fun b!1258765 () Bool)

(declare-fun lt!569261 () Unit!41799)

(declare-fun lt!569259 () Unit!41799)

(assert (=> b!1258765 (= lt!569261 lt!569259)))

(declare-fun lt!569260 () V!48255)

(declare-fun lt!569262 () (_ BitVec 64))

(declare-fun lt!569264 () ListLongMap!18821)

(declare-fun lt!569265 () (_ BitVec 64))

(assert (=> b!1258765 (not (contains!7544 (+!4229 lt!569264 (tuple2!20949 lt!569262 lt!569260)) lt!569265))))

(assert (=> b!1258765 (= lt!569259 (addStillNotContains!320 lt!569264 lt!569262 lt!569260 lt!569265))))

(assert (=> b!1258765 (= lt!569265 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1258765 (= lt!569260 (get!20199 (select (arr!39498 _values!914) #b00000000000000000000000000000000) (dynLambda!3414 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1258765 (= lt!569262 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1258765 (= lt!569264 call!61861)))

(assert (=> b!1258765 (= e!715977 (+!4229 call!61861 (tuple2!20949 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000) (get!20199 (select (arr!39498 _values!914) #b00000000000000000000000000000000) (dynLambda!3414 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1258766 () Bool)

(assert (=> b!1258766 (= e!715975 e!715979)))

(declare-fun c!122536 () Bool)

(assert (=> b!1258766 (= c!122536 (bvslt #b00000000000000000000000000000000 (size!40035 _keys!1118)))))

(declare-fun b!1258767 () Bool)

(assert (=> b!1258767 (= e!715978 (validKeyInArray!0 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1258767 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1258768 () Bool)

(declare-fun e!715974 () Bool)

(assert (=> b!1258768 (= e!715975 e!715974)))

(assert (=> b!1258768 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40035 _keys!1118)))))

(declare-fun res!838952 () Bool)

(assert (=> b!1258768 (= res!838952 (contains!7544 lt!569263 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1258768 (=> (not res!838952) (not e!715974))))

(declare-fun b!1258769 () Bool)

(assert (=> b!1258769 (= e!715977 call!61861)))

(declare-fun b!1258770 () Bool)

(assert (=> b!1258770 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40035 _keys!1118)))))

(assert (=> b!1258770 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40036 _values!914)))))

(assert (=> b!1258770 (= e!715974 (= (apply!984 lt!569263 (select (arr!39497 _keys!1118) #b00000000000000000000000000000000)) (get!20199 (select (arr!39498 _values!914) #b00000000000000000000000000000000) (dynLambda!3414 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!138187 c!122538) b!1258762))

(assert (= (and d!138187 (not c!122538)) b!1258759))

(assert (= (and b!1258759 c!122537) b!1258765))

(assert (= (and b!1258759 (not c!122537)) b!1258769))

(assert (= (or b!1258765 b!1258769) bm!61858))

(assert (= (and d!138187 res!838954) b!1258761))

(assert (= (and b!1258761 res!838953) b!1258763))

(assert (= (and b!1258763 res!838955) b!1258767))

(assert (= (and b!1258763 c!122535) b!1258768))

(assert (= (and b!1258763 (not c!122535)) b!1258766))

(assert (= (and b!1258768 res!838952) b!1258770))

(assert (= (and b!1258766 c!122536) b!1258760))

(assert (= (and b!1258766 (not c!122536)) b!1258764))

(declare-fun b_lambda!22719 () Bool)

(assert (=> (not b_lambda!22719) (not b!1258765)))

(assert (=> b!1258765 t!41645))

(declare-fun b_and!45133 () Bool)

(assert (= b_and!45131 (and (=> t!41645 result!23327) b_and!45133)))

(declare-fun b_lambda!22721 () Bool)

(assert (=> (not b_lambda!22721) (not b!1258770)))

(assert (=> b!1258770 t!41645))

(declare-fun b_and!45135 () Bool)

(assert (= b_and!45133 (and (=> t!41645 result!23327) b_and!45135)))

(assert (=> b!1258770 m!1158645))

(assert (=> b!1258770 m!1158645))

(assert (=> b!1258770 m!1158643))

(assert (=> b!1258770 m!1158647))

(assert (=> b!1258770 m!1158643))

(assert (=> b!1258770 m!1158589))

(declare-fun m!1158679 () Bool)

(assert (=> b!1258770 m!1158679))

(assert (=> b!1258770 m!1158589))

(assert (=> b!1258768 m!1158589))

(assert (=> b!1258768 m!1158589))

(declare-fun m!1158681 () Bool)

(assert (=> b!1258768 m!1158681))

(declare-fun m!1158683 () Bool)

(assert (=> b!1258761 m!1158683))

(declare-fun m!1158685 () Bool)

(assert (=> bm!61858 m!1158685))

(assert (=> b!1258759 m!1158589))

(assert (=> b!1258759 m!1158589))

(assert (=> b!1258759 m!1158593))

(assert (=> b!1258760 m!1158685))

(assert (=> b!1258767 m!1158589))

(assert (=> b!1258767 m!1158589))

(assert (=> b!1258767 m!1158593))

(assert (=> b!1258765 m!1158645))

(assert (=> b!1258765 m!1158645))

(assert (=> b!1258765 m!1158643))

(assert (=> b!1258765 m!1158647))

(declare-fun m!1158687 () Bool)

(assert (=> b!1258765 m!1158687))

(declare-fun m!1158689 () Bool)

(assert (=> b!1258765 m!1158689))

(declare-fun m!1158691 () Bool)

(assert (=> b!1258765 m!1158691))

(assert (=> b!1258765 m!1158689))

(assert (=> b!1258765 m!1158589))

(declare-fun m!1158693 () Bool)

(assert (=> b!1258765 m!1158693))

(assert (=> b!1258765 m!1158643))

(declare-fun m!1158695 () Bool)

(assert (=> b!1258764 m!1158695))

(declare-fun m!1158697 () Bool)

(assert (=> d!138187 m!1158697))

(assert (=> d!138187 m!1158541))

(assert (=> b!1258576 d!138187))

(declare-fun mapIsEmpty!50053 () Bool)

(declare-fun mapRes!50053 () Bool)

(assert (=> mapIsEmpty!50053 mapRes!50053))

(declare-fun b!1258778 () Bool)

(declare-fun e!715985 () Bool)

(assert (=> b!1258778 (= e!715985 tp_is_empty!32167)))

(declare-fun b!1258777 () Bool)

(declare-fun e!715986 () Bool)

(assert (=> b!1258777 (= e!715986 tp_is_empty!32167)))

(declare-fun mapNonEmpty!50053 () Bool)

(declare-fun tp!95333 () Bool)

(assert (=> mapNonEmpty!50053 (= mapRes!50053 (and tp!95333 e!715986))))

(declare-fun mapRest!50053 () (Array (_ BitVec 32) ValueCell!15320))

(declare-fun mapValue!50053 () ValueCell!15320)

(declare-fun mapKey!50053 () (_ BitVec 32))

(assert (=> mapNonEmpty!50053 (= mapRest!50044 (store mapRest!50053 mapKey!50053 mapValue!50053))))

(declare-fun condMapEmpty!50053 () Bool)

(declare-fun mapDefault!50053 () ValueCell!15320)

(assert (=> mapNonEmpty!50044 (= condMapEmpty!50053 (= mapRest!50044 ((as const (Array (_ BitVec 32) ValueCell!15320)) mapDefault!50053)))))

(assert (=> mapNonEmpty!50044 (= tp!95318 (and e!715985 mapRes!50053))))

(assert (= (and mapNonEmpty!50044 condMapEmpty!50053) mapIsEmpty!50053))

(assert (= (and mapNonEmpty!50044 (not condMapEmpty!50053)) mapNonEmpty!50053))

(assert (= (and mapNonEmpty!50053 ((_ is ValueCellFull!15320) mapValue!50053)) b!1258777))

(assert (= (and mapNonEmpty!50044 ((_ is ValueCellFull!15320) mapDefault!50053)) b!1258778))

(declare-fun m!1158699 () Bool)

(assert (=> mapNonEmpty!50053 m!1158699))

(declare-fun b_lambda!22723 () Bool)

(assert (= b_lambda!22715 (or (and start!105660 b_free!27265) b_lambda!22723)))

(declare-fun b_lambda!22725 () Bool)

(assert (= b_lambda!22717 (or (and start!105660 b_free!27265) b_lambda!22725)))

(declare-fun b_lambda!22727 () Bool)

(assert (= b_lambda!22713 (or (and start!105660 b_free!27265) b_lambda!22727)))

(declare-fun b_lambda!22729 () Bool)

(assert (= b_lambda!22719 (or (and start!105660 b_free!27265) b_lambda!22729)))

(declare-fun b_lambda!22731 () Bool)

(assert (= b_lambda!22721 (or (and start!105660 b_free!27265) b_lambda!22731)))

(check-sat (not b!1258758) (not b!1258753) (not b!1258748) (not b!1258765) (not b!1258714) (not b!1258749) (not b!1258770) (not b_next!27265) (not b!1258756) (not b!1258703) (not b!1258654) (not b!1258752) (not b!1258641) (not mapNonEmpty!50053) (not b!1258716) (not b!1258759) (not b!1258720) (not d!138187) (not bm!61830) (not bm!61858) (not d!138175) (not b!1258718) (not b_lambda!22723) (not b!1258704) (not b!1258715) (not b!1258760) (not d!138185) (not bm!61854) (not b!1258767) (not bm!61857) (not b_lambda!22725) (not bm!61833) (not b!1258643) (not b!1258655) (not b!1258768) (not b_lambda!22729) tp_is_empty!32167 (not b_lambda!22727) (not b!1258644) (not bm!61852) (not b!1258764) (not b!1258700) (not bm!61848) (not b!1258761) (not d!138183) (not b_lambda!22731) (not bm!61849) (not b!1258747) (not b!1258755) b_and!45135)
(check-sat b_and!45135 (not b_next!27265))
