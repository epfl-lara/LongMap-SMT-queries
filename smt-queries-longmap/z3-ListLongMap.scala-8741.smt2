; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106024 () Bool)

(assert start!106024)

(declare-fun b_free!27481 () Bool)

(declare-fun b_next!27481 () Bool)

(assert (=> start!106024 (= b_free!27481 (not b_next!27481))))

(declare-fun tp!95990 () Bool)

(declare-fun b_and!45425 () Bool)

(assert (=> start!106024 (= tp!95990 b_and!45425)))

(declare-fun b!1262553 () Bool)

(declare-fun e!718716 () Bool)

(declare-datatypes ((V!48543 0))(
  ( (V!48544 (val!16254 Int)) )
))
(declare-datatypes ((tuple2!21116 0))(
  ( (tuple2!21117 (_1!10569 (_ BitVec 64)) (_2!10569 V!48543)) )
))
(declare-datatypes ((List!28317 0))(
  ( (Nil!28314) (Cons!28313 (h!29522 tuple2!21116) (t!41817 List!28317)) )
))
(declare-datatypes ((ListLongMap!18989 0))(
  ( (ListLongMap!18990 (toList!9510 List!28317)) )
))
(declare-fun lt!572211 () ListLongMap!18989)

(declare-fun lt!572214 () ListLongMap!18989)

(assert (=> b!1262553 (= e!718716 (= lt!572211 lt!572214))))

(declare-fun res!841113 () Bool)

(declare-fun e!718714 () Bool)

(assert (=> start!106024 (=> (not res!841113) (not e!718714))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106024 (= res!841113 (validMask!0 mask!1466))))

(assert (=> start!106024 e!718714))

(assert (=> start!106024 true))

(assert (=> start!106024 tp!95990))

(declare-fun tp_is_empty!32383 () Bool)

(assert (=> start!106024 tp_is_empty!32383))

(declare-datatypes ((array!82309 0))(
  ( (array!82310 (arr!39703 (Array (_ BitVec 32) (_ BitVec 64))) (size!40241 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82309)

(declare-fun array_inv!30373 (array!82309) Bool)

(assert (=> start!106024 (array_inv!30373 _keys!1118)))

(declare-datatypes ((ValueCell!15428 0))(
  ( (ValueCellFull!15428 (v!18961 V!48543)) (EmptyCell!15428) )
))
(declare-datatypes ((array!82311 0))(
  ( (array!82312 (arr!39704 (Array (_ BitVec 32) ValueCell!15428)) (size!40242 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82311)

(declare-fun e!718717 () Bool)

(declare-fun array_inv!30374 (array!82311) Bool)

(assert (=> start!106024 (and (array_inv!30374 _values!914) e!718717)))

(declare-fun mapNonEmpty!50392 () Bool)

(declare-fun mapRes!50392 () Bool)

(declare-fun tp!95989 () Bool)

(declare-fun e!718713 () Bool)

(assert (=> mapNonEmpty!50392 (= mapRes!50392 (and tp!95989 e!718713))))

(declare-fun mapValue!50392 () ValueCell!15428)

(declare-fun mapKey!50392 () (_ BitVec 32))

(declare-fun mapRest!50392 () (Array (_ BitVec 32) ValueCell!15428))

(assert (=> mapNonEmpty!50392 (= (arr!39704 _values!914) (store mapRest!50392 mapKey!50392 mapValue!50392))))

(declare-fun b!1262554 () Bool)

(declare-fun e!718715 () Bool)

(assert (=> b!1262554 (= e!718715 tp_is_empty!32383)))

(declare-fun b!1262555 () Bool)

(declare-fun res!841116 () Bool)

(assert (=> b!1262555 (=> (not res!841116) (not e!718714))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1262555 (= res!841116 (and (= (size!40242 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40241 _keys!1118) (size!40242 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262556 () Bool)

(declare-fun e!718711 () Bool)

(declare-fun lt!572210 () ListLongMap!18989)

(declare-fun contains!7565 (ListLongMap!18989 (_ BitVec 64)) Bool)

(assert (=> b!1262556 (= e!718711 (not (contains!7565 lt!572210 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1262556 e!718716))

(declare-fun res!841114 () Bool)

(assert (=> b!1262556 (=> (not res!841114) (not e!718716))))

(declare-fun lt!572212 () ListLongMap!18989)

(declare-fun minValueBefore!43 () V!48543)

(declare-fun +!4283 (ListLongMap!18989 tuple2!21116) ListLongMap!18989)

(assert (=> b!1262556 (= res!841114 (= lt!572212 (+!4283 lt!572210 (tuple2!21117 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48543)

(declare-fun zeroValue!871 () V!48543)

(declare-fun getCurrentListMap!4566 (array!82309 array!82311 (_ BitVec 32) (_ BitVec 32) V!48543 V!48543 (_ BitVec 32) Int) ListLongMap!18989)

(assert (=> b!1262556 (= lt!572211 (getCurrentListMap!4566 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1262556 (= lt!572212 (getCurrentListMap!4566 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262557 () Bool)

(assert (=> b!1262557 (= e!718714 (not e!718711))))

(declare-fun res!841118 () Bool)

(assert (=> b!1262557 (=> res!841118 e!718711)))

(assert (=> b!1262557 (= res!841118 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1262557 (= lt!572210 lt!572214)))

(declare-datatypes ((Unit!41931 0))(
  ( (Unit!41932) )
))
(declare-fun lt!572213 () Unit!41931)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1177 (array!82309 array!82311 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48543 V!48543 V!48543 V!48543 (_ BitVec 32) Int) Unit!41931)

(assert (=> b!1262557 (= lt!572213 (lemmaNoChangeToArrayThenSameMapNoExtras!1177 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5877 (array!82309 array!82311 (_ BitVec 32) (_ BitVec 32) V!48543 V!48543 (_ BitVec 32) Int) ListLongMap!18989)

(assert (=> b!1262557 (= lt!572214 (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1262557 (= lt!572210 (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262558 () Bool)

(declare-fun res!841117 () Bool)

(assert (=> b!1262558 (=> (not res!841117) (not e!718714))))

(declare-datatypes ((List!28318 0))(
  ( (Nil!28315) (Cons!28314 (h!29523 (_ BitVec 64)) (t!41818 List!28318)) )
))
(declare-fun arrayNoDuplicates!0 (array!82309 (_ BitVec 32) List!28318) Bool)

(assert (=> b!1262558 (= res!841117 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28315))))

(declare-fun b!1262559 () Bool)

(declare-fun res!841115 () Bool)

(assert (=> b!1262559 (=> (not res!841115) (not e!718714))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82309 (_ BitVec 32)) Bool)

(assert (=> b!1262559 (= res!841115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1262560 () Bool)

(assert (=> b!1262560 (= e!718717 (and e!718715 mapRes!50392))))

(declare-fun condMapEmpty!50392 () Bool)

(declare-fun mapDefault!50392 () ValueCell!15428)

(assert (=> b!1262560 (= condMapEmpty!50392 (= (arr!39704 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15428)) mapDefault!50392)))))

(declare-fun mapIsEmpty!50392 () Bool)

(assert (=> mapIsEmpty!50392 mapRes!50392))

(declare-fun b!1262561 () Bool)

(assert (=> b!1262561 (= e!718713 tp_is_empty!32383)))

(assert (= (and start!106024 res!841113) b!1262555))

(assert (= (and b!1262555 res!841116) b!1262559))

(assert (= (and b!1262559 res!841115) b!1262558))

(assert (= (and b!1262558 res!841117) b!1262557))

(assert (= (and b!1262557 (not res!841118)) b!1262556))

(assert (= (and b!1262556 res!841114) b!1262553))

(assert (= (and b!1262560 condMapEmpty!50392) mapIsEmpty!50392))

(assert (= (and b!1262560 (not condMapEmpty!50392)) mapNonEmpty!50392))

(get-info :version)

(assert (= (and mapNonEmpty!50392 ((_ is ValueCellFull!15428) mapValue!50392)) b!1262561))

(assert (= (and b!1262560 ((_ is ValueCellFull!15428) mapDefault!50392)) b!1262554))

(assert (= start!106024 b!1262560))

(declare-fun m!1162615 () Bool)

(assert (=> b!1262556 m!1162615))

(declare-fun m!1162617 () Bool)

(assert (=> b!1262556 m!1162617))

(declare-fun m!1162619 () Bool)

(assert (=> b!1262556 m!1162619))

(declare-fun m!1162621 () Bool)

(assert (=> b!1262556 m!1162621))

(declare-fun m!1162623 () Bool)

(assert (=> b!1262558 m!1162623))

(declare-fun m!1162625 () Bool)

(assert (=> start!106024 m!1162625))

(declare-fun m!1162627 () Bool)

(assert (=> start!106024 m!1162627))

(declare-fun m!1162629 () Bool)

(assert (=> start!106024 m!1162629))

(declare-fun m!1162631 () Bool)

(assert (=> b!1262557 m!1162631))

(declare-fun m!1162633 () Bool)

(assert (=> b!1262557 m!1162633))

(declare-fun m!1162635 () Bool)

(assert (=> b!1262557 m!1162635))

(declare-fun m!1162637 () Bool)

(assert (=> b!1262559 m!1162637))

(declare-fun m!1162639 () Bool)

(assert (=> mapNonEmpty!50392 m!1162639))

(check-sat (not b_next!27481) (not mapNonEmpty!50392) (not b!1262557) (not b!1262559) (not b!1262556) (not b!1262558) b_and!45425 (not start!106024) tp_is_empty!32383)
(check-sat b_and!45425 (not b_next!27481))
(get-model)

(declare-fun b!1262624 () Bool)

(declare-fun e!718766 () Bool)

(declare-fun call!62095 () Bool)

(assert (=> b!1262624 (= e!718766 call!62095)))

(declare-fun b!1262625 () Bool)

(declare-fun e!718767 () Bool)

(assert (=> b!1262625 (= e!718767 call!62095)))

(declare-fun bm!62092 () Bool)

(assert (=> bm!62092 (= call!62095 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1262627 () Bool)

(assert (=> b!1262627 (= e!718767 e!718766)))

(declare-fun lt!572251 () (_ BitVec 64))

(assert (=> b!1262627 (= lt!572251 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572252 () Unit!41931)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82309 (_ BitVec 64) (_ BitVec 32)) Unit!41931)

(assert (=> b!1262627 (= lt!572252 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!572251 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1262627 (arrayContainsKey!0 _keys!1118 lt!572251 #b00000000000000000000000000000000)))

(declare-fun lt!572253 () Unit!41931)

(assert (=> b!1262627 (= lt!572253 lt!572252)))

(declare-fun res!841159 () Bool)

(declare-datatypes ((SeekEntryResult!9976 0))(
  ( (MissingZero!9976 (index!42275 (_ BitVec 32))) (Found!9976 (index!42276 (_ BitVec 32))) (Intermediate!9976 (undefined!10788 Bool) (index!42277 (_ BitVec 32)) (x!111265 (_ BitVec 32))) (Undefined!9976) (MissingVacant!9976 (index!42278 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82309 (_ BitVec 32)) SeekEntryResult!9976)

(assert (=> b!1262627 (= res!841159 (= (seekEntryOrOpen!0 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9976 #b00000000000000000000000000000000)))))

(assert (=> b!1262627 (=> (not res!841159) (not e!718766))))

(declare-fun b!1262626 () Bool)

(declare-fun e!718768 () Bool)

(assert (=> b!1262626 (= e!718768 e!718767)))

(declare-fun c!122839 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1262626 (= c!122839 (validKeyInArray!0 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138429 () Bool)

(declare-fun res!841160 () Bool)

(assert (=> d!138429 (=> res!841160 e!718768)))

(assert (=> d!138429 (= res!841160 (bvsge #b00000000000000000000000000000000 (size!40241 _keys!1118)))))

(assert (=> d!138429 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!718768)))

(assert (= (and d!138429 (not res!841160)) b!1262626))

(assert (= (and b!1262626 c!122839) b!1262627))

(assert (= (and b!1262626 (not c!122839)) b!1262625))

(assert (= (and b!1262627 res!841159) b!1262624))

(assert (= (or b!1262624 b!1262625) bm!62092))

(declare-fun m!1162693 () Bool)

(assert (=> bm!62092 m!1162693))

(declare-fun m!1162695 () Bool)

(assert (=> b!1262627 m!1162695))

(declare-fun m!1162697 () Bool)

(assert (=> b!1262627 m!1162697))

(declare-fun m!1162699 () Bool)

(assert (=> b!1262627 m!1162699))

(assert (=> b!1262627 m!1162695))

(declare-fun m!1162701 () Bool)

(assert (=> b!1262627 m!1162701))

(assert (=> b!1262626 m!1162695))

(assert (=> b!1262626 m!1162695))

(declare-fun m!1162703 () Bool)

(assert (=> b!1262626 m!1162703))

(assert (=> b!1262559 d!138429))

(declare-fun d!138431 () Bool)

(assert (=> d!138431 (= (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572256 () Unit!41931)

(declare-fun choose!1882 (array!82309 array!82311 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48543 V!48543 V!48543 V!48543 (_ BitVec 32) Int) Unit!41931)

(assert (=> d!138431 (= lt!572256 (choose!1882 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138431 (validMask!0 mask!1466)))

(assert (=> d!138431 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1177 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572256)))

(declare-fun bs!35702 () Bool)

(assert (= bs!35702 d!138431))

(assert (=> bs!35702 m!1162635))

(assert (=> bs!35702 m!1162633))

(declare-fun m!1162705 () Bool)

(assert (=> bs!35702 m!1162705))

(assert (=> bs!35702 m!1162625))

(assert (=> b!1262557 d!138431))

(declare-fun b!1262652 () Bool)

(declare-fun e!718783 () Bool)

(declare-fun lt!572277 () ListLongMap!18989)

(assert (=> b!1262652 (= e!718783 (= lt!572277 (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1262653 () Bool)

(assert (=> b!1262653 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40241 _keys!1118)))))

(assert (=> b!1262653 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40242 _values!914)))))

(declare-fun e!718788 () Bool)

(declare-fun apply!992 (ListLongMap!18989 (_ BitVec 64)) V!48543)

(declare-fun get!20279 (ValueCell!15428 V!48543) V!48543)

(declare-fun dynLambda!3422 (Int (_ BitVec 64)) V!48543)

(assert (=> b!1262653 (= e!718788 (= (apply!992 lt!572277 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000)) (get!20279 (select (arr!39704 _values!914) #b00000000000000000000000000000000) (dynLambda!3422 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!62098 () ListLongMap!18989)

(declare-fun bm!62095 () Bool)

(assert (=> bm!62095 (= call!62098 (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1262654 () Bool)

(declare-fun e!718787 () Bool)

(assert (=> b!1262654 (= e!718787 e!718788)))

(assert (=> b!1262654 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40241 _keys!1118)))))

(declare-fun res!841171 () Bool)

(assert (=> b!1262654 (= res!841171 (contains!7565 lt!572277 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262654 (=> (not res!841171) (not e!718788))))

(declare-fun b!1262656 () Bool)

(declare-fun e!718786 () ListLongMap!18989)

(assert (=> b!1262656 (= e!718786 (ListLongMap!18990 Nil!28314))))

(declare-fun b!1262657 () Bool)

(assert (=> b!1262657 (= e!718787 e!718783)))

(declare-fun c!122848 () Bool)

(assert (=> b!1262657 (= c!122848 (bvslt #b00000000000000000000000000000000 (size!40241 _keys!1118)))))

(declare-fun b!1262658 () Bool)

(declare-fun e!718789 () ListLongMap!18989)

(assert (=> b!1262658 (= e!718786 e!718789)))

(declare-fun c!122851 () Bool)

(assert (=> b!1262658 (= c!122851 (validKeyInArray!0 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262659 () Bool)

(declare-fun e!718785 () Bool)

(assert (=> b!1262659 (= e!718785 (validKeyInArray!0 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262659 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1262660 () Bool)

(declare-fun lt!572276 () Unit!41931)

(declare-fun lt!572275 () Unit!41931)

(assert (=> b!1262660 (= lt!572276 lt!572275)))

(declare-fun lt!572273 () (_ BitVec 64))

(declare-fun lt!572274 () V!48543)

(declare-fun lt!572271 () (_ BitVec 64))

(declare-fun lt!572272 () ListLongMap!18989)

(assert (=> b!1262660 (not (contains!7565 (+!4283 lt!572272 (tuple2!21117 lt!572271 lt!572274)) lt!572273))))

(declare-fun addStillNotContains!328 (ListLongMap!18989 (_ BitVec 64) V!48543 (_ BitVec 64)) Unit!41931)

(assert (=> b!1262660 (= lt!572275 (addStillNotContains!328 lt!572272 lt!572271 lt!572274 lt!572273))))

(assert (=> b!1262660 (= lt!572273 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1262660 (= lt!572274 (get!20279 (select (arr!39704 _values!914) #b00000000000000000000000000000000) (dynLambda!3422 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1262660 (= lt!572271 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262660 (= lt!572272 call!62098)))

(assert (=> b!1262660 (= e!718789 (+!4283 call!62098 (tuple2!21117 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000) (get!20279 (select (arr!39704 _values!914) #b00000000000000000000000000000000) (dynLambda!3422 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1262661 () Bool)

(declare-fun isEmpty!1047 (ListLongMap!18989) Bool)

(assert (=> b!1262661 (= e!718783 (isEmpty!1047 lt!572277))))

(declare-fun b!1262662 () Bool)

(assert (=> b!1262662 (= e!718789 call!62098)))

(declare-fun b!1262663 () Bool)

(declare-fun e!718784 () Bool)

(assert (=> b!1262663 (= e!718784 e!718787)))

(declare-fun c!122850 () Bool)

(assert (=> b!1262663 (= c!122850 e!718785)))

(declare-fun res!841169 () Bool)

(assert (=> b!1262663 (=> (not res!841169) (not e!718785))))

(assert (=> b!1262663 (= res!841169 (bvslt #b00000000000000000000000000000000 (size!40241 _keys!1118)))))

(declare-fun b!1262655 () Bool)

(declare-fun res!841172 () Bool)

(assert (=> b!1262655 (=> (not res!841172) (not e!718784))))

(assert (=> b!1262655 (= res!841172 (not (contains!7565 lt!572277 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!138433 () Bool)

(assert (=> d!138433 e!718784))

(declare-fun res!841170 () Bool)

(assert (=> d!138433 (=> (not res!841170) (not e!718784))))

(assert (=> d!138433 (= res!841170 (not (contains!7565 lt!572277 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138433 (= lt!572277 e!718786)))

(declare-fun c!122849 () Bool)

(assert (=> d!138433 (= c!122849 (bvsge #b00000000000000000000000000000000 (size!40241 _keys!1118)))))

(assert (=> d!138433 (validMask!0 mask!1466)))

(assert (=> d!138433 (= (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572277)))

(assert (= (and d!138433 c!122849) b!1262656))

(assert (= (and d!138433 (not c!122849)) b!1262658))

(assert (= (and b!1262658 c!122851) b!1262660))

(assert (= (and b!1262658 (not c!122851)) b!1262662))

(assert (= (or b!1262660 b!1262662) bm!62095))

(assert (= (and d!138433 res!841170) b!1262655))

(assert (= (and b!1262655 res!841172) b!1262663))

(assert (= (and b!1262663 res!841169) b!1262659))

(assert (= (and b!1262663 c!122850) b!1262654))

(assert (= (and b!1262663 (not c!122850)) b!1262657))

(assert (= (and b!1262654 res!841171) b!1262653))

(assert (= (and b!1262657 c!122848) b!1262652))

(assert (= (and b!1262657 (not c!122848)) b!1262661))

(declare-fun b_lambda!22889 () Bool)

(assert (=> (not b_lambda!22889) (not b!1262653)))

(declare-fun t!41822 () Bool)

(declare-fun tb!11317 () Bool)

(assert (=> (and start!106024 (= defaultEntry!922 defaultEntry!922) t!41822) tb!11317))

(declare-fun result!23375 () Bool)

(assert (=> tb!11317 (= result!23375 tp_is_empty!32383)))

(assert (=> b!1262653 t!41822))

(declare-fun b_and!45431 () Bool)

(assert (= b_and!45425 (and (=> t!41822 result!23375) b_and!45431)))

(declare-fun b_lambda!22891 () Bool)

(assert (=> (not b_lambda!22891) (not b!1262660)))

(assert (=> b!1262660 t!41822))

(declare-fun b_and!45433 () Bool)

(assert (= b_and!45431 (and (=> t!41822 result!23375) b_and!45433)))

(declare-fun m!1162707 () Bool)

(assert (=> bm!62095 m!1162707))

(declare-fun m!1162709 () Bool)

(assert (=> b!1262660 m!1162709))

(declare-fun m!1162711 () Bool)

(assert (=> b!1262660 m!1162711))

(declare-fun m!1162713 () Bool)

(assert (=> b!1262660 m!1162713))

(assert (=> b!1262660 m!1162695))

(declare-fun m!1162715 () Bool)

(assert (=> b!1262660 m!1162715))

(declare-fun m!1162717 () Bool)

(assert (=> b!1262660 m!1162717))

(assert (=> b!1262660 m!1162715))

(assert (=> b!1262660 m!1162717))

(declare-fun m!1162719 () Bool)

(assert (=> b!1262660 m!1162719))

(declare-fun m!1162721 () Bool)

(assert (=> b!1262660 m!1162721))

(assert (=> b!1262660 m!1162711))

(assert (=> b!1262659 m!1162695))

(assert (=> b!1262659 m!1162695))

(assert (=> b!1262659 m!1162703))

(assert (=> b!1262658 m!1162695))

(assert (=> b!1262658 m!1162695))

(assert (=> b!1262658 m!1162703))

(assert (=> b!1262653 m!1162695))

(declare-fun m!1162723 () Bool)

(assert (=> b!1262653 m!1162723))

(assert (=> b!1262653 m!1162695))

(assert (=> b!1262653 m!1162715))

(assert (=> b!1262653 m!1162717))

(assert (=> b!1262653 m!1162715))

(assert (=> b!1262653 m!1162717))

(assert (=> b!1262653 m!1162719))

(assert (=> b!1262652 m!1162707))

(declare-fun m!1162725 () Bool)

(assert (=> d!138433 m!1162725))

(assert (=> d!138433 m!1162625))

(declare-fun m!1162727 () Bool)

(assert (=> b!1262655 m!1162727))

(assert (=> b!1262654 m!1162695))

(assert (=> b!1262654 m!1162695))

(declare-fun m!1162729 () Bool)

(assert (=> b!1262654 m!1162729))

(declare-fun m!1162731 () Bool)

(assert (=> b!1262661 m!1162731))

(assert (=> b!1262557 d!138433))

(declare-fun e!718790 () Bool)

(declare-fun lt!572284 () ListLongMap!18989)

(declare-fun b!1262666 () Bool)

(assert (=> b!1262666 (= e!718790 (= lt!572284 (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1262667 () Bool)

(assert (=> b!1262667 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40241 _keys!1118)))))

(assert (=> b!1262667 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40242 _values!914)))))

(declare-fun e!718795 () Bool)

(assert (=> b!1262667 (= e!718795 (= (apply!992 lt!572284 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000)) (get!20279 (select (arr!39704 _values!914) #b00000000000000000000000000000000) (dynLambda!3422 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!62099 () ListLongMap!18989)

(declare-fun bm!62096 () Bool)

(assert (=> bm!62096 (= call!62099 (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1262668 () Bool)

(declare-fun e!718794 () Bool)

(assert (=> b!1262668 (= e!718794 e!718795)))

(assert (=> b!1262668 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40241 _keys!1118)))))

(declare-fun res!841175 () Bool)

(assert (=> b!1262668 (= res!841175 (contains!7565 lt!572284 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262668 (=> (not res!841175) (not e!718795))))

(declare-fun b!1262670 () Bool)

(declare-fun e!718793 () ListLongMap!18989)

(assert (=> b!1262670 (= e!718793 (ListLongMap!18990 Nil!28314))))

(declare-fun b!1262671 () Bool)

(assert (=> b!1262671 (= e!718794 e!718790)))

(declare-fun c!122852 () Bool)

(assert (=> b!1262671 (= c!122852 (bvslt #b00000000000000000000000000000000 (size!40241 _keys!1118)))))

(declare-fun b!1262672 () Bool)

(declare-fun e!718796 () ListLongMap!18989)

(assert (=> b!1262672 (= e!718793 e!718796)))

(declare-fun c!122855 () Bool)

(assert (=> b!1262672 (= c!122855 (validKeyInArray!0 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262673 () Bool)

(declare-fun e!718792 () Bool)

(assert (=> b!1262673 (= e!718792 (validKeyInArray!0 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262673 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1262674 () Bool)

(declare-fun lt!572283 () Unit!41931)

(declare-fun lt!572282 () Unit!41931)

(assert (=> b!1262674 (= lt!572283 lt!572282)))

(declare-fun lt!572278 () (_ BitVec 64))

(declare-fun lt!572281 () V!48543)

(declare-fun lt!572280 () (_ BitVec 64))

(declare-fun lt!572279 () ListLongMap!18989)

(assert (=> b!1262674 (not (contains!7565 (+!4283 lt!572279 (tuple2!21117 lt!572278 lt!572281)) lt!572280))))

(assert (=> b!1262674 (= lt!572282 (addStillNotContains!328 lt!572279 lt!572278 lt!572281 lt!572280))))

(assert (=> b!1262674 (= lt!572280 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1262674 (= lt!572281 (get!20279 (select (arr!39704 _values!914) #b00000000000000000000000000000000) (dynLambda!3422 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1262674 (= lt!572278 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262674 (= lt!572279 call!62099)))

(assert (=> b!1262674 (= e!718796 (+!4283 call!62099 (tuple2!21117 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000) (get!20279 (select (arr!39704 _values!914) #b00000000000000000000000000000000) (dynLambda!3422 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1262675 () Bool)

(assert (=> b!1262675 (= e!718790 (isEmpty!1047 lt!572284))))

(declare-fun b!1262676 () Bool)

(assert (=> b!1262676 (= e!718796 call!62099)))

(declare-fun b!1262677 () Bool)

(declare-fun e!718791 () Bool)

(assert (=> b!1262677 (= e!718791 e!718794)))

(declare-fun c!122854 () Bool)

(assert (=> b!1262677 (= c!122854 e!718792)))

(declare-fun res!841173 () Bool)

(assert (=> b!1262677 (=> (not res!841173) (not e!718792))))

(assert (=> b!1262677 (= res!841173 (bvslt #b00000000000000000000000000000000 (size!40241 _keys!1118)))))

(declare-fun b!1262669 () Bool)

(declare-fun res!841176 () Bool)

(assert (=> b!1262669 (=> (not res!841176) (not e!718791))))

(assert (=> b!1262669 (= res!841176 (not (contains!7565 lt!572284 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!138435 () Bool)

(assert (=> d!138435 e!718791))

(declare-fun res!841174 () Bool)

(assert (=> d!138435 (=> (not res!841174) (not e!718791))))

(assert (=> d!138435 (= res!841174 (not (contains!7565 lt!572284 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138435 (= lt!572284 e!718793)))

(declare-fun c!122853 () Bool)

(assert (=> d!138435 (= c!122853 (bvsge #b00000000000000000000000000000000 (size!40241 _keys!1118)))))

(assert (=> d!138435 (validMask!0 mask!1466)))

(assert (=> d!138435 (= (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572284)))

(assert (= (and d!138435 c!122853) b!1262670))

(assert (= (and d!138435 (not c!122853)) b!1262672))

(assert (= (and b!1262672 c!122855) b!1262674))

(assert (= (and b!1262672 (not c!122855)) b!1262676))

(assert (= (or b!1262674 b!1262676) bm!62096))

(assert (= (and d!138435 res!841174) b!1262669))

(assert (= (and b!1262669 res!841176) b!1262677))

(assert (= (and b!1262677 res!841173) b!1262673))

(assert (= (and b!1262677 c!122854) b!1262668))

(assert (= (and b!1262677 (not c!122854)) b!1262671))

(assert (= (and b!1262668 res!841175) b!1262667))

(assert (= (and b!1262671 c!122852) b!1262666))

(assert (= (and b!1262671 (not c!122852)) b!1262675))

(declare-fun b_lambda!22893 () Bool)

(assert (=> (not b_lambda!22893) (not b!1262667)))

(assert (=> b!1262667 t!41822))

(declare-fun b_and!45435 () Bool)

(assert (= b_and!45433 (and (=> t!41822 result!23375) b_and!45435)))

(declare-fun b_lambda!22895 () Bool)

(assert (=> (not b_lambda!22895) (not b!1262674)))

(assert (=> b!1262674 t!41822))

(declare-fun b_and!45437 () Bool)

(assert (= b_and!45435 (and (=> t!41822 result!23375) b_and!45437)))

(declare-fun m!1162733 () Bool)

(assert (=> bm!62096 m!1162733))

(declare-fun m!1162735 () Bool)

(assert (=> b!1262674 m!1162735))

(declare-fun m!1162737 () Bool)

(assert (=> b!1262674 m!1162737))

(declare-fun m!1162739 () Bool)

(assert (=> b!1262674 m!1162739))

(assert (=> b!1262674 m!1162695))

(assert (=> b!1262674 m!1162715))

(assert (=> b!1262674 m!1162717))

(assert (=> b!1262674 m!1162715))

(assert (=> b!1262674 m!1162717))

(assert (=> b!1262674 m!1162719))

(declare-fun m!1162741 () Bool)

(assert (=> b!1262674 m!1162741))

(assert (=> b!1262674 m!1162737))

(assert (=> b!1262673 m!1162695))

(assert (=> b!1262673 m!1162695))

(assert (=> b!1262673 m!1162703))

(assert (=> b!1262672 m!1162695))

(assert (=> b!1262672 m!1162695))

(assert (=> b!1262672 m!1162703))

(assert (=> b!1262667 m!1162695))

(declare-fun m!1162743 () Bool)

(assert (=> b!1262667 m!1162743))

(assert (=> b!1262667 m!1162695))

(assert (=> b!1262667 m!1162715))

(assert (=> b!1262667 m!1162717))

(assert (=> b!1262667 m!1162715))

(assert (=> b!1262667 m!1162717))

(assert (=> b!1262667 m!1162719))

(assert (=> b!1262666 m!1162733))

(declare-fun m!1162745 () Bool)

(assert (=> d!138435 m!1162745))

(assert (=> d!138435 m!1162625))

(declare-fun m!1162747 () Bool)

(assert (=> b!1262669 m!1162747))

(assert (=> b!1262668 m!1162695))

(assert (=> b!1262668 m!1162695))

(declare-fun m!1162749 () Bool)

(assert (=> b!1262668 m!1162749))

(declare-fun m!1162751 () Bool)

(assert (=> b!1262675 m!1162751))

(assert (=> b!1262557 d!138435))

(declare-fun b!1262688 () Bool)

(declare-fun e!718808 () Bool)

(declare-fun call!62102 () Bool)

(assert (=> b!1262688 (= e!718808 call!62102)))

(declare-fun b!1262689 () Bool)

(declare-fun e!718805 () Bool)

(assert (=> b!1262689 (= e!718805 e!718808)))

(declare-fun c!122858 () Bool)

(assert (=> b!1262689 (= c!122858 (validKeyInArray!0 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262690 () Bool)

(declare-fun e!718807 () Bool)

(declare-fun contains!7567 (List!28318 (_ BitVec 64)) Bool)

(assert (=> b!1262690 (= e!718807 (contains!7567 Nil!28315 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262691 () Bool)

(declare-fun e!718806 () Bool)

(assert (=> b!1262691 (= e!718806 e!718805)))

(declare-fun res!841184 () Bool)

(assert (=> b!1262691 (=> (not res!841184) (not e!718805))))

(assert (=> b!1262691 (= res!841184 (not e!718807))))

(declare-fun res!841183 () Bool)

(assert (=> b!1262691 (=> (not res!841183) (not e!718807))))

(assert (=> b!1262691 (= res!841183 (validKeyInArray!0 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138437 () Bool)

(declare-fun res!841185 () Bool)

(assert (=> d!138437 (=> res!841185 e!718806)))

(assert (=> d!138437 (= res!841185 (bvsge #b00000000000000000000000000000000 (size!40241 _keys!1118)))))

(assert (=> d!138437 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28315) e!718806)))

(declare-fun bm!62099 () Bool)

(assert (=> bm!62099 (= call!62102 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122858 (Cons!28314 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000) Nil!28315) Nil!28315)))))

(declare-fun b!1262692 () Bool)

(assert (=> b!1262692 (= e!718808 call!62102)))

(assert (= (and d!138437 (not res!841185)) b!1262691))

(assert (= (and b!1262691 res!841183) b!1262690))

(assert (= (and b!1262691 res!841184) b!1262689))

(assert (= (and b!1262689 c!122858) b!1262692))

(assert (= (and b!1262689 (not c!122858)) b!1262688))

(assert (= (or b!1262692 b!1262688) bm!62099))

(assert (=> b!1262689 m!1162695))

(assert (=> b!1262689 m!1162695))

(assert (=> b!1262689 m!1162703))

(assert (=> b!1262690 m!1162695))

(assert (=> b!1262690 m!1162695))

(declare-fun m!1162753 () Bool)

(assert (=> b!1262690 m!1162753))

(assert (=> b!1262691 m!1162695))

(assert (=> b!1262691 m!1162695))

(assert (=> b!1262691 m!1162703))

(assert (=> bm!62099 m!1162695))

(declare-fun m!1162755 () Bool)

(assert (=> bm!62099 m!1162755))

(assert (=> b!1262558 d!138437))

(declare-fun d!138439 () Bool)

(declare-fun e!718813 () Bool)

(assert (=> d!138439 e!718813))

(declare-fun res!841188 () Bool)

(assert (=> d!138439 (=> res!841188 e!718813)))

(declare-fun lt!572296 () Bool)

(assert (=> d!138439 (= res!841188 (not lt!572296))))

(declare-fun lt!572294 () Bool)

(assert (=> d!138439 (= lt!572296 lt!572294)))

(declare-fun lt!572293 () Unit!41931)

(declare-fun e!718814 () Unit!41931)

(assert (=> d!138439 (= lt!572293 e!718814)))

(declare-fun c!122861 () Bool)

(assert (=> d!138439 (= c!122861 lt!572294)))

(declare-fun containsKey!622 (List!28317 (_ BitVec 64)) Bool)

(assert (=> d!138439 (= lt!572294 (containsKey!622 (toList!9510 lt!572210) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138439 (= (contains!7565 lt!572210 #b1000000000000000000000000000000000000000000000000000000000000000) lt!572296)))

(declare-fun b!1262699 () Bool)

(declare-fun lt!572295 () Unit!41931)

(assert (=> b!1262699 (= e!718814 lt!572295)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!432 (List!28317 (_ BitVec 64)) Unit!41931)

(assert (=> b!1262699 (= lt!572295 (lemmaContainsKeyImpliesGetValueByKeyDefined!432 (toList!9510 lt!572210) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!717 0))(
  ( (Some!716 (v!18964 V!48543)) (None!715) )
))
(declare-fun isDefined!475 (Option!717) Bool)

(declare-fun getValueByKey!666 (List!28317 (_ BitVec 64)) Option!717)

(assert (=> b!1262699 (isDefined!475 (getValueByKey!666 (toList!9510 lt!572210) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1262700 () Bool)

(declare-fun Unit!41935 () Unit!41931)

(assert (=> b!1262700 (= e!718814 Unit!41935)))

(declare-fun b!1262701 () Bool)

(assert (=> b!1262701 (= e!718813 (isDefined!475 (getValueByKey!666 (toList!9510 lt!572210) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!138439 c!122861) b!1262699))

(assert (= (and d!138439 (not c!122861)) b!1262700))

(assert (= (and d!138439 (not res!841188)) b!1262701))

(declare-fun m!1162757 () Bool)

(assert (=> d!138439 m!1162757))

(declare-fun m!1162759 () Bool)

(assert (=> b!1262699 m!1162759))

(declare-fun m!1162761 () Bool)

(assert (=> b!1262699 m!1162761))

(assert (=> b!1262699 m!1162761))

(declare-fun m!1162763 () Bool)

(assert (=> b!1262699 m!1162763))

(assert (=> b!1262701 m!1162761))

(assert (=> b!1262701 m!1162761))

(assert (=> b!1262701 m!1162763))

(assert (=> b!1262556 d!138439))

(declare-fun d!138441 () Bool)

(declare-fun e!718817 () Bool)

(assert (=> d!138441 e!718817))

(declare-fun res!841194 () Bool)

(assert (=> d!138441 (=> (not res!841194) (not e!718817))))

(declare-fun lt!572305 () ListLongMap!18989)

(assert (=> d!138441 (= res!841194 (contains!7565 lt!572305 (_1!10569 (tuple2!21117 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!572307 () List!28317)

(assert (=> d!138441 (= lt!572305 (ListLongMap!18990 lt!572307))))

(declare-fun lt!572308 () Unit!41931)

(declare-fun lt!572306 () Unit!41931)

(assert (=> d!138441 (= lt!572308 lt!572306)))

(assert (=> d!138441 (= (getValueByKey!666 lt!572307 (_1!10569 (tuple2!21117 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!716 (_2!10569 (tuple2!21117 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lemmaContainsTupThenGetReturnValue!336 (List!28317 (_ BitVec 64) V!48543) Unit!41931)

(assert (=> d!138441 (= lt!572306 (lemmaContainsTupThenGetReturnValue!336 lt!572307 (_1!10569 (tuple2!21117 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10569 (tuple2!21117 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun insertStrictlySorted!450 (List!28317 (_ BitVec 64) V!48543) List!28317)

(assert (=> d!138441 (= lt!572307 (insertStrictlySorted!450 (toList!9510 lt!572210) (_1!10569 (tuple2!21117 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10569 (tuple2!21117 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138441 (= (+!4283 lt!572210 (tuple2!21117 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!572305)))

(declare-fun b!1262706 () Bool)

(declare-fun res!841193 () Bool)

(assert (=> b!1262706 (=> (not res!841193) (not e!718817))))

(assert (=> b!1262706 (= res!841193 (= (getValueByKey!666 (toList!9510 lt!572305) (_1!10569 (tuple2!21117 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!716 (_2!10569 (tuple2!21117 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1262707 () Bool)

(declare-fun contains!7568 (List!28317 tuple2!21116) Bool)

(assert (=> b!1262707 (= e!718817 (contains!7568 (toList!9510 lt!572305) (tuple2!21117 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!138441 res!841194) b!1262706))

(assert (= (and b!1262706 res!841193) b!1262707))

(declare-fun m!1162765 () Bool)

(assert (=> d!138441 m!1162765))

(declare-fun m!1162767 () Bool)

(assert (=> d!138441 m!1162767))

(declare-fun m!1162769 () Bool)

(assert (=> d!138441 m!1162769))

(declare-fun m!1162771 () Bool)

(assert (=> d!138441 m!1162771))

(declare-fun m!1162773 () Bool)

(assert (=> b!1262706 m!1162773))

(declare-fun m!1162775 () Bool)

(assert (=> b!1262707 m!1162775))

(assert (=> b!1262556 d!138441))

(declare-fun b!1262750 () Bool)

(declare-fun e!718845 () Bool)

(declare-fun e!718850 () Bool)

(assert (=> b!1262750 (= e!718845 e!718850)))

(declare-fun c!122874 () Bool)

(assert (=> b!1262750 (= c!122874 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!718856 () Bool)

(declare-fun b!1262751 () Bool)

(declare-fun lt!572374 () ListLongMap!18989)

(assert (=> b!1262751 (= e!718856 (= (apply!992 lt!572374 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000)) (get!20279 (select (arr!39704 _values!914) #b00000000000000000000000000000000) (dynLambda!3422 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1262751 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40242 _values!914)))))

(assert (=> b!1262751 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40241 _keys!1118)))))

(declare-fun call!62119 () ListLongMap!18989)

(declare-fun bm!62114 () Bool)

(assert (=> bm!62114 (= call!62119 (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262752 () Bool)

(declare-fun e!718844 () Unit!41931)

(declare-fun Unit!41936 () Unit!41931)

(assert (=> b!1262752 (= e!718844 Unit!41936)))

(declare-fun b!1262753 () Bool)

(declare-fun e!718848 () ListLongMap!18989)

(declare-fun call!62120 () ListLongMap!18989)

(assert (=> b!1262753 (= e!718848 call!62120)))

(declare-fun bm!62115 () Bool)

(declare-fun call!62122 () ListLongMap!18989)

(assert (=> bm!62115 (= call!62120 call!62122)))

(declare-fun b!1262754 () Bool)

(declare-fun res!841220 () Bool)

(assert (=> b!1262754 (=> (not res!841220) (not e!718845))))

(declare-fun e!718847 () Bool)

(assert (=> b!1262754 (= res!841220 e!718847)))

(declare-fun c!122877 () Bool)

(assert (=> b!1262754 (= c!122877 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1262755 () Bool)

(declare-fun e!718852 () Bool)

(assert (=> b!1262755 (= e!718852 (validKeyInArray!0 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62116 () Bool)

(declare-fun call!62117 () Bool)

(assert (=> bm!62116 (= call!62117 (contains!7565 lt!572374 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62117 () Bool)

(declare-fun call!62121 () Bool)

(assert (=> bm!62117 (= call!62121 (contains!7565 lt!572374 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1262756 () Bool)

(declare-fun e!718855 () Bool)

(assert (=> b!1262756 (= e!718847 e!718855)))

(declare-fun res!841215 () Bool)

(assert (=> b!1262756 (= res!841215 call!62117)))

(assert (=> b!1262756 (=> (not res!841215) (not e!718855))))

(declare-fun b!1262757 () Bool)

(declare-fun e!718853 () ListLongMap!18989)

(declare-fun call!62118 () ListLongMap!18989)

(assert (=> b!1262757 (= e!718853 (+!4283 call!62118 (tuple2!21117 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun b!1262758 () Bool)

(declare-fun c!122879 () Bool)

(assert (=> b!1262758 (= c!122879 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!718854 () ListLongMap!18989)

(assert (=> b!1262758 (= e!718854 e!718848)))

(declare-fun b!1262759 () Bool)

(declare-fun call!62123 () ListLongMap!18989)

(assert (=> b!1262759 (= e!718854 call!62123)))

(declare-fun b!1262760 () Bool)

(assert (=> b!1262760 (= e!718850 (not call!62121))))

(declare-fun b!1262761 () Bool)

(assert (=> b!1262761 (= e!718855 (= (apply!992 lt!572374 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun bm!62118 () Bool)

(assert (=> bm!62118 (= call!62123 call!62118)))

(declare-fun b!1262762 () Bool)

(declare-fun res!841218 () Bool)

(assert (=> b!1262762 (=> (not res!841218) (not e!718845))))

(declare-fun e!718849 () Bool)

(assert (=> b!1262762 (= res!841218 e!718849)))

(declare-fun res!841221 () Bool)

(assert (=> b!1262762 (=> res!841221 e!718849)))

(declare-fun e!718851 () Bool)

(assert (=> b!1262762 (= res!841221 (not e!718851))))

(declare-fun res!841217 () Bool)

(assert (=> b!1262762 (=> (not res!841217) (not e!718851))))

(assert (=> b!1262762 (= res!841217 (bvslt #b00000000000000000000000000000000 (size!40241 _keys!1118)))))

(declare-fun b!1262763 () Bool)

(assert (=> b!1262763 (= e!718847 (not call!62117))))

(declare-fun b!1262764 () Bool)

(declare-fun lt!572354 () Unit!41931)

(assert (=> b!1262764 (= e!718844 lt!572354)))

(declare-fun lt!572366 () ListLongMap!18989)

(assert (=> b!1262764 (= lt!572366 (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572368 () (_ BitVec 64))

(assert (=> b!1262764 (= lt!572368 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572369 () (_ BitVec 64))

(assert (=> b!1262764 (= lt!572369 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572367 () Unit!41931)

(declare-fun addStillContains!1089 (ListLongMap!18989 (_ BitVec 64) V!48543 (_ BitVec 64)) Unit!41931)

(assert (=> b!1262764 (= lt!572367 (addStillContains!1089 lt!572366 lt!572368 zeroValue!871 lt!572369))))

(assert (=> b!1262764 (contains!7565 (+!4283 lt!572366 (tuple2!21117 lt!572368 zeroValue!871)) lt!572369)))

(declare-fun lt!572356 () Unit!41931)

(assert (=> b!1262764 (= lt!572356 lt!572367)))

(declare-fun lt!572360 () ListLongMap!18989)

(assert (=> b!1262764 (= lt!572360 (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572363 () (_ BitVec 64))

(assert (=> b!1262764 (= lt!572363 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572364 () (_ BitVec 64))

(assert (=> b!1262764 (= lt!572364 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572362 () Unit!41931)

(declare-fun addApplyDifferent!532 (ListLongMap!18989 (_ BitVec 64) V!48543 (_ BitVec 64)) Unit!41931)

(assert (=> b!1262764 (= lt!572362 (addApplyDifferent!532 lt!572360 lt!572363 minValueAfter!43 lt!572364))))

(assert (=> b!1262764 (= (apply!992 (+!4283 lt!572360 (tuple2!21117 lt!572363 minValueAfter!43)) lt!572364) (apply!992 lt!572360 lt!572364))))

(declare-fun lt!572372 () Unit!41931)

(assert (=> b!1262764 (= lt!572372 lt!572362)))

(declare-fun lt!572359 () ListLongMap!18989)

(assert (=> b!1262764 (= lt!572359 (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572357 () (_ BitVec 64))

(assert (=> b!1262764 (= lt!572357 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572361 () (_ BitVec 64))

(assert (=> b!1262764 (= lt!572361 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572373 () Unit!41931)

(assert (=> b!1262764 (= lt!572373 (addApplyDifferent!532 lt!572359 lt!572357 zeroValue!871 lt!572361))))

(assert (=> b!1262764 (= (apply!992 (+!4283 lt!572359 (tuple2!21117 lt!572357 zeroValue!871)) lt!572361) (apply!992 lt!572359 lt!572361))))

(declare-fun lt!572365 () Unit!41931)

(assert (=> b!1262764 (= lt!572365 lt!572373)))

(declare-fun lt!572371 () ListLongMap!18989)

(assert (=> b!1262764 (= lt!572371 (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572353 () (_ BitVec 64))

(assert (=> b!1262764 (= lt!572353 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572358 () (_ BitVec 64))

(assert (=> b!1262764 (= lt!572358 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262764 (= lt!572354 (addApplyDifferent!532 lt!572371 lt!572353 minValueAfter!43 lt!572358))))

(assert (=> b!1262764 (= (apply!992 (+!4283 lt!572371 (tuple2!21117 lt!572353 minValueAfter!43)) lt!572358) (apply!992 lt!572371 lt!572358))))

(declare-fun d!138443 () Bool)

(assert (=> d!138443 e!718845))

(declare-fun res!841216 () Bool)

(assert (=> d!138443 (=> (not res!841216) (not e!718845))))

(assert (=> d!138443 (= res!841216 (or (bvsge #b00000000000000000000000000000000 (size!40241 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40241 _keys!1118)))))))

(declare-fun lt!572370 () ListLongMap!18989)

(assert (=> d!138443 (= lt!572374 lt!572370)))

(declare-fun lt!572355 () Unit!41931)

(assert (=> d!138443 (= lt!572355 e!718844)))

(declare-fun c!122876 () Bool)

(assert (=> d!138443 (= c!122876 e!718852)))

(declare-fun res!841213 () Bool)

(assert (=> d!138443 (=> (not res!841213) (not e!718852))))

(assert (=> d!138443 (= res!841213 (bvslt #b00000000000000000000000000000000 (size!40241 _keys!1118)))))

(assert (=> d!138443 (= lt!572370 e!718853)))

(declare-fun c!122878 () Bool)

(assert (=> d!138443 (= c!122878 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138443 (validMask!0 mask!1466)))

(assert (=> d!138443 (= (getCurrentListMap!4566 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572374)))

(declare-fun c!122875 () Bool)

(declare-fun bm!62119 () Bool)

(assert (=> bm!62119 (= call!62118 (+!4283 (ite c!122878 call!62119 (ite c!122875 call!62122 call!62120)) (ite (or c!122878 c!122875) (tuple2!21117 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21117 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1262765 () Bool)

(assert (=> b!1262765 (= e!718853 e!718854)))

(assert (=> b!1262765 (= c!122875 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62120 () Bool)

(assert (=> bm!62120 (= call!62122 call!62119)))

(declare-fun b!1262766 () Bool)

(assert (=> b!1262766 (= e!718848 call!62123)))

(declare-fun b!1262767 () Bool)

(assert (=> b!1262767 (= e!718851 (validKeyInArray!0 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262768 () Bool)

(assert (=> b!1262768 (= e!718849 e!718856)))

(declare-fun res!841214 () Bool)

(assert (=> b!1262768 (=> (not res!841214) (not e!718856))))

(assert (=> b!1262768 (= res!841214 (contains!7565 lt!572374 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262768 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40241 _keys!1118)))))

(declare-fun b!1262769 () Bool)

(declare-fun e!718846 () Bool)

(assert (=> b!1262769 (= e!718850 e!718846)))

(declare-fun res!841219 () Bool)

(assert (=> b!1262769 (= res!841219 call!62121)))

(assert (=> b!1262769 (=> (not res!841219) (not e!718846))))

(declare-fun b!1262770 () Bool)

(assert (=> b!1262770 (= e!718846 (= (apply!992 lt!572374 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(assert (= (and d!138443 c!122878) b!1262757))

(assert (= (and d!138443 (not c!122878)) b!1262765))

(assert (= (and b!1262765 c!122875) b!1262759))

(assert (= (and b!1262765 (not c!122875)) b!1262758))

(assert (= (and b!1262758 c!122879) b!1262766))

(assert (= (and b!1262758 (not c!122879)) b!1262753))

(assert (= (or b!1262766 b!1262753) bm!62115))

(assert (= (or b!1262759 bm!62115) bm!62120))

(assert (= (or b!1262759 b!1262766) bm!62118))

(assert (= (or b!1262757 bm!62120) bm!62114))

(assert (= (or b!1262757 bm!62118) bm!62119))

(assert (= (and d!138443 res!841213) b!1262755))

(assert (= (and d!138443 c!122876) b!1262764))

(assert (= (and d!138443 (not c!122876)) b!1262752))

(assert (= (and d!138443 res!841216) b!1262762))

(assert (= (and b!1262762 res!841217) b!1262767))

(assert (= (and b!1262762 (not res!841221)) b!1262768))

(assert (= (and b!1262768 res!841214) b!1262751))

(assert (= (and b!1262762 res!841218) b!1262754))

(assert (= (and b!1262754 c!122877) b!1262756))

(assert (= (and b!1262754 (not c!122877)) b!1262763))

(assert (= (and b!1262756 res!841215) b!1262761))

(assert (= (or b!1262756 b!1262763) bm!62116))

(assert (= (and b!1262754 res!841220) b!1262750))

(assert (= (and b!1262750 c!122874) b!1262769))

(assert (= (and b!1262750 (not c!122874)) b!1262760))

(assert (= (and b!1262769 res!841219) b!1262770))

(assert (= (or b!1262769 b!1262760) bm!62117))

(declare-fun b_lambda!22897 () Bool)

(assert (=> (not b_lambda!22897) (not b!1262751)))

(assert (=> b!1262751 t!41822))

(declare-fun b_and!45439 () Bool)

(assert (= b_and!45437 (and (=> t!41822 result!23375) b_and!45439)))

(declare-fun m!1162777 () Bool)

(assert (=> bm!62119 m!1162777))

(declare-fun m!1162779 () Bool)

(assert (=> bm!62116 m!1162779))

(declare-fun m!1162781 () Bool)

(assert (=> b!1262761 m!1162781))

(declare-fun m!1162783 () Bool)

(assert (=> bm!62117 m!1162783))

(assert (=> d!138443 m!1162625))

(declare-fun m!1162785 () Bool)

(assert (=> b!1262770 m!1162785))

(declare-fun m!1162787 () Bool)

(assert (=> b!1262757 m!1162787))

(assert (=> b!1262767 m!1162695))

(assert (=> b!1262767 m!1162695))

(assert (=> b!1262767 m!1162703))

(assert (=> b!1262751 m!1162715))

(assert (=> b!1262751 m!1162717))

(assert (=> b!1262751 m!1162719))

(assert (=> b!1262751 m!1162695))

(declare-fun m!1162789 () Bool)

(assert (=> b!1262751 m!1162789))

(assert (=> b!1262751 m!1162715))

(assert (=> b!1262751 m!1162695))

(assert (=> b!1262751 m!1162717))

(assert (=> bm!62114 m!1162633))

(assert (=> b!1262768 m!1162695))

(assert (=> b!1262768 m!1162695))

(declare-fun m!1162791 () Bool)

(assert (=> b!1262768 m!1162791))

(declare-fun m!1162793 () Bool)

(assert (=> b!1262764 m!1162793))

(declare-fun m!1162795 () Bool)

(assert (=> b!1262764 m!1162795))

(declare-fun m!1162797 () Bool)

(assert (=> b!1262764 m!1162797))

(declare-fun m!1162799 () Bool)

(assert (=> b!1262764 m!1162799))

(assert (=> b!1262764 m!1162795))

(declare-fun m!1162801 () Bool)

(assert (=> b!1262764 m!1162801))

(declare-fun m!1162803 () Bool)

(assert (=> b!1262764 m!1162803))

(assert (=> b!1262764 m!1162803))

(declare-fun m!1162805 () Bool)

(assert (=> b!1262764 m!1162805))

(declare-fun m!1162807 () Bool)

(assert (=> b!1262764 m!1162807))

(declare-fun m!1162809 () Bool)

(assert (=> b!1262764 m!1162809))

(declare-fun m!1162811 () Bool)

(assert (=> b!1262764 m!1162811))

(assert (=> b!1262764 m!1162799))

(declare-fun m!1162813 () Bool)

(assert (=> b!1262764 m!1162813))

(declare-fun m!1162815 () Bool)

(assert (=> b!1262764 m!1162815))

(declare-fun m!1162817 () Bool)

(assert (=> b!1262764 m!1162817))

(declare-fun m!1162819 () Bool)

(assert (=> b!1262764 m!1162819))

(declare-fun m!1162821 () Bool)

(assert (=> b!1262764 m!1162821))

(assert (=> b!1262764 m!1162695))

(assert (=> b!1262764 m!1162809))

(assert (=> b!1262764 m!1162633))

(assert (=> b!1262755 m!1162695))

(assert (=> b!1262755 m!1162695))

(assert (=> b!1262755 m!1162703))

(assert (=> b!1262556 d!138443))

(declare-fun b!1262771 () Bool)

(declare-fun e!718858 () Bool)

(declare-fun e!718863 () Bool)

(assert (=> b!1262771 (= e!718858 e!718863)))

(declare-fun c!122880 () Bool)

(assert (=> b!1262771 (= c!122880 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!718869 () Bool)

(declare-fun b!1262772 () Bool)

(declare-fun lt!572396 () ListLongMap!18989)

(assert (=> b!1262772 (= e!718869 (= (apply!992 lt!572396 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000)) (get!20279 (select (arr!39704 _values!914) #b00000000000000000000000000000000) (dynLambda!3422 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1262772 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40242 _values!914)))))

(assert (=> b!1262772 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40241 _keys!1118)))))

(declare-fun bm!62121 () Bool)

(declare-fun call!62126 () ListLongMap!18989)

(assert (=> bm!62121 (= call!62126 (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262773 () Bool)

(declare-fun e!718857 () Unit!41931)

(declare-fun Unit!41937 () Unit!41931)

(assert (=> b!1262773 (= e!718857 Unit!41937)))

(declare-fun b!1262774 () Bool)

(declare-fun e!718861 () ListLongMap!18989)

(declare-fun call!62127 () ListLongMap!18989)

(assert (=> b!1262774 (= e!718861 call!62127)))

(declare-fun bm!62122 () Bool)

(declare-fun call!62129 () ListLongMap!18989)

(assert (=> bm!62122 (= call!62127 call!62129)))

(declare-fun b!1262775 () Bool)

(declare-fun res!841229 () Bool)

(assert (=> b!1262775 (=> (not res!841229) (not e!718858))))

(declare-fun e!718860 () Bool)

(assert (=> b!1262775 (= res!841229 e!718860)))

(declare-fun c!122883 () Bool)

(assert (=> b!1262775 (= c!122883 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1262776 () Bool)

(declare-fun e!718865 () Bool)

(assert (=> b!1262776 (= e!718865 (validKeyInArray!0 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62123 () Bool)

(declare-fun call!62124 () Bool)

(assert (=> bm!62123 (= call!62124 (contains!7565 lt!572396 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62124 () Bool)

(declare-fun call!62128 () Bool)

(assert (=> bm!62124 (= call!62128 (contains!7565 lt!572396 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1262777 () Bool)

(declare-fun e!718868 () Bool)

(assert (=> b!1262777 (= e!718860 e!718868)))

(declare-fun res!841224 () Bool)

(assert (=> b!1262777 (= res!841224 call!62124)))

(assert (=> b!1262777 (=> (not res!841224) (not e!718868))))

(declare-fun b!1262778 () Bool)

(declare-fun e!718866 () ListLongMap!18989)

(declare-fun call!62125 () ListLongMap!18989)

(assert (=> b!1262778 (= e!718866 (+!4283 call!62125 (tuple2!21117 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1262779 () Bool)

(declare-fun c!122885 () Bool)

(assert (=> b!1262779 (= c!122885 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!718867 () ListLongMap!18989)

(assert (=> b!1262779 (= e!718867 e!718861)))

(declare-fun b!1262780 () Bool)

(declare-fun call!62130 () ListLongMap!18989)

(assert (=> b!1262780 (= e!718867 call!62130)))

(declare-fun b!1262781 () Bool)

(assert (=> b!1262781 (= e!718863 (not call!62128))))

(declare-fun b!1262782 () Bool)

(assert (=> b!1262782 (= e!718868 (= (apply!992 lt!572396 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun bm!62125 () Bool)

(assert (=> bm!62125 (= call!62130 call!62125)))

(declare-fun b!1262783 () Bool)

(declare-fun res!841227 () Bool)

(assert (=> b!1262783 (=> (not res!841227) (not e!718858))))

(declare-fun e!718862 () Bool)

(assert (=> b!1262783 (= res!841227 e!718862)))

(declare-fun res!841230 () Bool)

(assert (=> b!1262783 (=> res!841230 e!718862)))

(declare-fun e!718864 () Bool)

(assert (=> b!1262783 (= res!841230 (not e!718864))))

(declare-fun res!841226 () Bool)

(assert (=> b!1262783 (=> (not res!841226) (not e!718864))))

(assert (=> b!1262783 (= res!841226 (bvslt #b00000000000000000000000000000000 (size!40241 _keys!1118)))))

(declare-fun b!1262784 () Bool)

(assert (=> b!1262784 (= e!718860 (not call!62124))))

(declare-fun b!1262785 () Bool)

(declare-fun lt!572376 () Unit!41931)

(assert (=> b!1262785 (= e!718857 lt!572376)))

(declare-fun lt!572388 () ListLongMap!18989)

(assert (=> b!1262785 (= lt!572388 (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572390 () (_ BitVec 64))

(assert (=> b!1262785 (= lt!572390 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572391 () (_ BitVec 64))

(assert (=> b!1262785 (= lt!572391 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572389 () Unit!41931)

(assert (=> b!1262785 (= lt!572389 (addStillContains!1089 lt!572388 lt!572390 zeroValue!871 lt!572391))))

(assert (=> b!1262785 (contains!7565 (+!4283 lt!572388 (tuple2!21117 lt!572390 zeroValue!871)) lt!572391)))

(declare-fun lt!572378 () Unit!41931)

(assert (=> b!1262785 (= lt!572378 lt!572389)))

(declare-fun lt!572382 () ListLongMap!18989)

(assert (=> b!1262785 (= lt!572382 (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572385 () (_ BitVec 64))

(assert (=> b!1262785 (= lt!572385 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572386 () (_ BitVec 64))

(assert (=> b!1262785 (= lt!572386 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572384 () Unit!41931)

(assert (=> b!1262785 (= lt!572384 (addApplyDifferent!532 lt!572382 lt!572385 minValueBefore!43 lt!572386))))

(assert (=> b!1262785 (= (apply!992 (+!4283 lt!572382 (tuple2!21117 lt!572385 minValueBefore!43)) lt!572386) (apply!992 lt!572382 lt!572386))))

(declare-fun lt!572394 () Unit!41931)

(assert (=> b!1262785 (= lt!572394 lt!572384)))

(declare-fun lt!572381 () ListLongMap!18989)

(assert (=> b!1262785 (= lt!572381 (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572379 () (_ BitVec 64))

(assert (=> b!1262785 (= lt!572379 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572383 () (_ BitVec 64))

(assert (=> b!1262785 (= lt!572383 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572395 () Unit!41931)

(assert (=> b!1262785 (= lt!572395 (addApplyDifferent!532 lt!572381 lt!572379 zeroValue!871 lt!572383))))

(assert (=> b!1262785 (= (apply!992 (+!4283 lt!572381 (tuple2!21117 lt!572379 zeroValue!871)) lt!572383) (apply!992 lt!572381 lt!572383))))

(declare-fun lt!572387 () Unit!41931)

(assert (=> b!1262785 (= lt!572387 lt!572395)))

(declare-fun lt!572393 () ListLongMap!18989)

(assert (=> b!1262785 (= lt!572393 (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572375 () (_ BitVec 64))

(assert (=> b!1262785 (= lt!572375 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572380 () (_ BitVec 64))

(assert (=> b!1262785 (= lt!572380 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262785 (= lt!572376 (addApplyDifferent!532 lt!572393 lt!572375 minValueBefore!43 lt!572380))))

(assert (=> b!1262785 (= (apply!992 (+!4283 lt!572393 (tuple2!21117 lt!572375 minValueBefore!43)) lt!572380) (apply!992 lt!572393 lt!572380))))

(declare-fun d!138445 () Bool)

(assert (=> d!138445 e!718858))

(declare-fun res!841225 () Bool)

(assert (=> d!138445 (=> (not res!841225) (not e!718858))))

(assert (=> d!138445 (= res!841225 (or (bvsge #b00000000000000000000000000000000 (size!40241 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40241 _keys!1118)))))))

(declare-fun lt!572392 () ListLongMap!18989)

(assert (=> d!138445 (= lt!572396 lt!572392)))

(declare-fun lt!572377 () Unit!41931)

(assert (=> d!138445 (= lt!572377 e!718857)))

(declare-fun c!122882 () Bool)

(assert (=> d!138445 (= c!122882 e!718865)))

(declare-fun res!841222 () Bool)

(assert (=> d!138445 (=> (not res!841222) (not e!718865))))

(assert (=> d!138445 (= res!841222 (bvslt #b00000000000000000000000000000000 (size!40241 _keys!1118)))))

(assert (=> d!138445 (= lt!572392 e!718866)))

(declare-fun c!122884 () Bool)

(assert (=> d!138445 (= c!122884 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138445 (validMask!0 mask!1466)))

(assert (=> d!138445 (= (getCurrentListMap!4566 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572396)))

(declare-fun c!122881 () Bool)

(declare-fun bm!62126 () Bool)

(assert (=> bm!62126 (= call!62125 (+!4283 (ite c!122884 call!62126 (ite c!122881 call!62129 call!62127)) (ite (or c!122884 c!122881) (tuple2!21117 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21117 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1262786 () Bool)

(assert (=> b!1262786 (= e!718866 e!718867)))

(assert (=> b!1262786 (= c!122881 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62127 () Bool)

(assert (=> bm!62127 (= call!62129 call!62126)))

(declare-fun b!1262787 () Bool)

(assert (=> b!1262787 (= e!718861 call!62130)))

(declare-fun b!1262788 () Bool)

(assert (=> b!1262788 (= e!718864 (validKeyInArray!0 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262789 () Bool)

(assert (=> b!1262789 (= e!718862 e!718869)))

(declare-fun res!841223 () Bool)

(assert (=> b!1262789 (=> (not res!841223) (not e!718869))))

(assert (=> b!1262789 (= res!841223 (contains!7565 lt!572396 (select (arr!39703 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262789 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40241 _keys!1118)))))

(declare-fun b!1262790 () Bool)

(declare-fun e!718859 () Bool)

(assert (=> b!1262790 (= e!718863 e!718859)))

(declare-fun res!841228 () Bool)

(assert (=> b!1262790 (= res!841228 call!62128)))

(assert (=> b!1262790 (=> (not res!841228) (not e!718859))))

(declare-fun b!1262791 () Bool)

(assert (=> b!1262791 (= e!718859 (= (apply!992 lt!572396 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(assert (= (and d!138445 c!122884) b!1262778))

(assert (= (and d!138445 (not c!122884)) b!1262786))

(assert (= (and b!1262786 c!122881) b!1262780))

(assert (= (and b!1262786 (not c!122881)) b!1262779))

(assert (= (and b!1262779 c!122885) b!1262787))

(assert (= (and b!1262779 (not c!122885)) b!1262774))

(assert (= (or b!1262787 b!1262774) bm!62122))

(assert (= (or b!1262780 bm!62122) bm!62127))

(assert (= (or b!1262780 b!1262787) bm!62125))

(assert (= (or b!1262778 bm!62127) bm!62121))

(assert (= (or b!1262778 bm!62125) bm!62126))

(assert (= (and d!138445 res!841222) b!1262776))

(assert (= (and d!138445 c!122882) b!1262785))

(assert (= (and d!138445 (not c!122882)) b!1262773))

(assert (= (and d!138445 res!841225) b!1262783))

(assert (= (and b!1262783 res!841226) b!1262788))

(assert (= (and b!1262783 (not res!841230)) b!1262789))

(assert (= (and b!1262789 res!841223) b!1262772))

(assert (= (and b!1262783 res!841227) b!1262775))

(assert (= (and b!1262775 c!122883) b!1262777))

(assert (= (and b!1262775 (not c!122883)) b!1262784))

(assert (= (and b!1262777 res!841224) b!1262782))

(assert (= (or b!1262777 b!1262784) bm!62123))

(assert (= (and b!1262775 res!841229) b!1262771))

(assert (= (and b!1262771 c!122880) b!1262790))

(assert (= (and b!1262771 (not c!122880)) b!1262781))

(assert (= (and b!1262790 res!841228) b!1262791))

(assert (= (or b!1262790 b!1262781) bm!62124))

(declare-fun b_lambda!22899 () Bool)

(assert (=> (not b_lambda!22899) (not b!1262772)))

(assert (=> b!1262772 t!41822))

(declare-fun b_and!45441 () Bool)

(assert (= b_and!45439 (and (=> t!41822 result!23375) b_and!45441)))

(declare-fun m!1162823 () Bool)

(assert (=> bm!62126 m!1162823))

(declare-fun m!1162825 () Bool)

(assert (=> bm!62123 m!1162825))

(declare-fun m!1162827 () Bool)

(assert (=> b!1262782 m!1162827))

(declare-fun m!1162829 () Bool)

(assert (=> bm!62124 m!1162829))

(assert (=> d!138445 m!1162625))

(declare-fun m!1162831 () Bool)

(assert (=> b!1262791 m!1162831))

(declare-fun m!1162833 () Bool)

(assert (=> b!1262778 m!1162833))

(assert (=> b!1262788 m!1162695))

(assert (=> b!1262788 m!1162695))

(assert (=> b!1262788 m!1162703))

(assert (=> b!1262772 m!1162715))

(assert (=> b!1262772 m!1162717))

(assert (=> b!1262772 m!1162719))

(assert (=> b!1262772 m!1162695))

(declare-fun m!1162835 () Bool)

(assert (=> b!1262772 m!1162835))

(assert (=> b!1262772 m!1162715))

(assert (=> b!1262772 m!1162695))

(assert (=> b!1262772 m!1162717))

(assert (=> bm!62121 m!1162635))

(assert (=> b!1262789 m!1162695))

(assert (=> b!1262789 m!1162695))

(declare-fun m!1162837 () Bool)

(assert (=> b!1262789 m!1162837))

(declare-fun m!1162839 () Bool)

(assert (=> b!1262785 m!1162839))

(declare-fun m!1162841 () Bool)

(assert (=> b!1262785 m!1162841))

(declare-fun m!1162843 () Bool)

(assert (=> b!1262785 m!1162843))

(declare-fun m!1162845 () Bool)

(assert (=> b!1262785 m!1162845))

(assert (=> b!1262785 m!1162841))

(declare-fun m!1162847 () Bool)

(assert (=> b!1262785 m!1162847))

(declare-fun m!1162849 () Bool)

(assert (=> b!1262785 m!1162849))

(assert (=> b!1262785 m!1162849))

(declare-fun m!1162851 () Bool)

(assert (=> b!1262785 m!1162851))

(declare-fun m!1162853 () Bool)

(assert (=> b!1262785 m!1162853))

(declare-fun m!1162855 () Bool)

(assert (=> b!1262785 m!1162855))

(declare-fun m!1162857 () Bool)

(assert (=> b!1262785 m!1162857))

(assert (=> b!1262785 m!1162845))

(declare-fun m!1162859 () Bool)

(assert (=> b!1262785 m!1162859))

(declare-fun m!1162861 () Bool)

(assert (=> b!1262785 m!1162861))

(declare-fun m!1162863 () Bool)

(assert (=> b!1262785 m!1162863))

(declare-fun m!1162865 () Bool)

(assert (=> b!1262785 m!1162865))

(declare-fun m!1162867 () Bool)

(assert (=> b!1262785 m!1162867))

(assert (=> b!1262785 m!1162695))

(assert (=> b!1262785 m!1162855))

(assert (=> b!1262785 m!1162635))

(assert (=> b!1262776 m!1162695))

(assert (=> b!1262776 m!1162695))

(assert (=> b!1262776 m!1162703))

(assert (=> b!1262556 d!138445))

(declare-fun d!138447 () Bool)

(assert (=> d!138447 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106024 d!138447))

(declare-fun d!138449 () Bool)

(assert (=> d!138449 (= (array_inv!30373 _keys!1118) (bvsge (size!40241 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106024 d!138449))

(declare-fun d!138451 () Bool)

(assert (=> d!138451 (= (array_inv!30374 _values!914) (bvsge (size!40242 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106024 d!138451))

(declare-fun b!1262798 () Bool)

(declare-fun e!718875 () Bool)

(assert (=> b!1262798 (= e!718875 tp_is_empty!32383)))

(declare-fun b!1262799 () Bool)

(declare-fun e!718874 () Bool)

(assert (=> b!1262799 (= e!718874 tp_is_empty!32383)))

(declare-fun mapNonEmpty!50401 () Bool)

(declare-fun mapRes!50401 () Bool)

(declare-fun tp!96005 () Bool)

(assert (=> mapNonEmpty!50401 (= mapRes!50401 (and tp!96005 e!718875))))

(declare-fun mapRest!50401 () (Array (_ BitVec 32) ValueCell!15428))

(declare-fun mapValue!50401 () ValueCell!15428)

(declare-fun mapKey!50401 () (_ BitVec 32))

(assert (=> mapNonEmpty!50401 (= mapRest!50392 (store mapRest!50401 mapKey!50401 mapValue!50401))))

(declare-fun condMapEmpty!50401 () Bool)

(declare-fun mapDefault!50401 () ValueCell!15428)

(assert (=> mapNonEmpty!50392 (= condMapEmpty!50401 (= mapRest!50392 ((as const (Array (_ BitVec 32) ValueCell!15428)) mapDefault!50401)))))

(assert (=> mapNonEmpty!50392 (= tp!95989 (and e!718874 mapRes!50401))))

(declare-fun mapIsEmpty!50401 () Bool)

(assert (=> mapIsEmpty!50401 mapRes!50401))

(assert (= (and mapNonEmpty!50392 condMapEmpty!50401) mapIsEmpty!50401))

(assert (= (and mapNonEmpty!50392 (not condMapEmpty!50401)) mapNonEmpty!50401))

(assert (= (and mapNonEmpty!50401 ((_ is ValueCellFull!15428) mapValue!50401)) b!1262798))

(assert (= (and mapNonEmpty!50392 ((_ is ValueCellFull!15428) mapDefault!50401)) b!1262799))

(declare-fun m!1162869 () Bool)

(assert (=> mapNonEmpty!50401 m!1162869))

(declare-fun b_lambda!22901 () Bool)

(assert (= b_lambda!22889 (or (and start!106024 b_free!27481) b_lambda!22901)))

(declare-fun b_lambda!22903 () Bool)

(assert (= b_lambda!22893 (or (and start!106024 b_free!27481) b_lambda!22903)))

(declare-fun b_lambda!22905 () Bool)

(assert (= b_lambda!22895 (or (and start!106024 b_free!27481) b_lambda!22905)))

(declare-fun b_lambda!22907 () Bool)

(assert (= b_lambda!22897 (or (and start!106024 b_free!27481) b_lambda!22907)))

(declare-fun b_lambda!22909 () Bool)

(assert (= b_lambda!22891 (or (and start!106024 b_free!27481) b_lambda!22909)))

(declare-fun b_lambda!22911 () Bool)

(assert (= b_lambda!22899 (or (and start!106024 b_free!27481) b_lambda!22911)))

(check-sat (not d!138439) (not b!1262675) (not bm!62117) (not bm!62121) (not b_lambda!22901) (not b!1262706) (not d!138433) (not b!1262707) (not b_next!27481) (not b!1262699) (not b!1262660) (not b!1262673) (not d!138445) (not d!138435) tp_is_empty!32383 (not bm!62114) (not b!1262672) (not b!1262751) (not b!1262627) (not bm!62126) (not bm!62116) (not b!1262701) (not bm!62099) (not b!1262772) (not bm!62092) (not b!1262653) (not b!1262768) (not b!1262757) (not b!1262652) (not b!1262655) (not bm!62096) (not b!1262788) (not b!1262776) (not b!1262764) (not bm!62124) (not b_lambda!22905) (not b!1262654) (not b!1262691) (not b!1262761) (not b_lambda!22911) (not b!1262789) (not b!1262659) (not b!1262770) (not b!1262658) (not b_lambda!22907) (not d!138441) (not b!1262626) (not b!1262785) (not b!1262782) (not b!1262767) (not d!138443) (not bm!62119) (not b!1262755) (not b!1262690) (not b!1262666) (not b!1262689) (not b!1262778) (not bm!62123) (not b_lambda!22909) b_and!45441 (not b!1262667) (not b!1262674) (not b!1262668) (not bm!62095) (not d!138431) (not b_lambda!22903) (not b!1262669) (not b!1262791) (not mapNonEmpty!50401) (not b!1262661))
(check-sat b_and!45441 (not b_next!27481))
