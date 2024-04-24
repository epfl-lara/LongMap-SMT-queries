; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106366 () Bool)

(assert start!106366)

(declare-fun b_free!27517 () Bool)

(declare-fun b_next!27517 () Bool)

(assert (=> start!106366 (= b_free!27517 (not b_next!27517))))

(declare-fun tp!96110 () Bool)

(declare-fun b_and!45527 () Bool)

(assert (=> start!106366 (= tp!96110 b_and!45527)))

(declare-fun b!1265088 () Bool)

(declare-fun e!720392 () Bool)

(declare-fun e!720390 () Bool)

(assert (=> b!1265088 (= e!720392 e!720390)))

(declare-fun res!842246 () Bool)

(assert (=> b!1265088 (=> res!842246 e!720390)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1265088 (= res!842246 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1265089 () Bool)

(declare-fun e!720394 () Bool)

(declare-fun e!720391 () Bool)

(declare-fun mapRes!50458 () Bool)

(assert (=> b!1265089 (= e!720394 (and e!720391 mapRes!50458))))

(declare-fun condMapEmpty!50458 () Bool)

(declare-datatypes ((V!48591 0))(
  ( (V!48592 (val!16272 Int)) )
))
(declare-datatypes ((ValueCell!15446 0))(
  ( (ValueCellFull!15446 (v!18980 V!48591)) (EmptyCell!15446) )
))
(declare-datatypes ((array!82507 0))(
  ( (array!82508 (arr!39793 (Array (_ BitVec 32) ValueCell!15446)) (size!40330 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82507)

(declare-fun mapDefault!50458 () ValueCell!15446)

(assert (=> b!1265089 (= condMapEmpty!50458 (= (arr!39793 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15446)) mapDefault!50458)))))

(declare-fun res!842247 () Bool)

(declare-fun e!720389 () Bool)

(assert (=> start!106366 (=> (not res!842247) (not e!720389))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106366 (= res!842247 (validMask!0 mask!1466))))

(assert (=> start!106366 e!720389))

(assert (=> start!106366 true))

(assert (=> start!106366 tp!96110))

(declare-fun tp_is_empty!32419 () Bool)

(assert (=> start!106366 tp_is_empty!32419))

(declare-datatypes ((array!82509 0))(
  ( (array!82510 (arr!39794 (Array (_ BitVec 32) (_ BitVec 64))) (size!40331 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82509)

(declare-fun array_inv!30447 (array!82509) Bool)

(assert (=> start!106366 (array_inv!30447 _keys!1118)))

(declare-fun array_inv!30448 (array!82507) Bool)

(assert (=> start!106366 (and (array_inv!30448 _values!914) e!720394)))

(declare-fun b!1265090 () Bool)

(declare-fun res!842250 () Bool)

(assert (=> b!1265090 (=> (not res!842250) (not e!720389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82509 (_ BitVec 32)) Bool)

(assert (=> b!1265090 (= res!842250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1265091 () Bool)

(declare-fun e!720387 () Bool)

(assert (=> b!1265091 (= e!720387 tp_is_empty!32419)))

(declare-fun mapNonEmpty!50458 () Bool)

(declare-fun tp!96109 () Bool)

(assert (=> mapNonEmpty!50458 (= mapRes!50458 (and tp!96109 e!720387))))

(declare-fun mapRest!50458 () (Array (_ BitVec 32) ValueCell!15446))

(declare-fun mapKey!50458 () (_ BitVec 32))

(declare-fun mapValue!50458 () ValueCell!15446)

(assert (=> mapNonEmpty!50458 (= (arr!39793 _values!914) (store mapRest!50458 mapKey!50458 mapValue!50458))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48591)

(declare-datatypes ((tuple2!21074 0))(
  ( (tuple2!21075 (_1!10548 (_ BitVec 64)) (_2!10548 V!48591)) )
))
(declare-datatypes ((List!28295 0))(
  ( (Nil!28292) (Cons!28291 (h!29509 tuple2!21074) (t!41804 List!28295)) )
))
(declare-datatypes ((ListLongMap!18955 0))(
  ( (ListLongMap!18956 (toList!9493 List!28295)) )
))
(declare-fun lt!573726 () ListLongMap!18955)

(declare-fun zeroValue!871 () V!48591)

(declare-fun e!720388 () Bool)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun b!1265092 () Bool)

(declare-fun getCurrentListMap!4645 (array!82509 array!82507 (_ BitVec 32) (_ BitVec 32) V!48591 V!48591 (_ BitVec 32) Int) ListLongMap!18955)

(declare-fun +!4301 (ListLongMap!18955 tuple2!21074) ListLongMap!18955)

(assert (=> b!1265092 (= e!720388 (= (getCurrentListMap!4645 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) (+!4301 lt!573726 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(declare-fun mapIsEmpty!50458 () Bool)

(assert (=> mapIsEmpty!50458 mapRes!50458))

(declare-fun b!1265093 () Bool)

(assert (=> b!1265093 (= e!720391 tp_is_empty!32419)))

(declare-fun b!1265094 () Bool)

(declare-fun minValueBefore!43 () V!48591)

(declare-fun lt!573727 () ListLongMap!18955)

(assert (=> b!1265094 (= e!720390 (= (getCurrentListMap!4645 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (+!4301 (+!4301 lt!573727 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1265095 () Bool)

(assert (=> b!1265095 (= e!720389 (not e!720388))))

(declare-fun res!842245 () Bool)

(assert (=> b!1265095 (=> res!842245 e!720388)))

(assert (=> b!1265095 (= res!842245 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1265095 e!720392))

(declare-fun res!842248 () Bool)

(assert (=> b!1265095 (=> (not res!842248) (not e!720392))))

(assert (=> b!1265095 (= res!842248 (= lt!573727 lt!573726))))

(declare-datatypes ((Unit!42093 0))(
  ( (Unit!42094) )
))
(declare-fun lt!573728 () Unit!42093)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1186 (array!82509 array!82507 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48591 V!48591 V!48591 V!48591 (_ BitVec 32) Int) Unit!42093)

(assert (=> b!1265095 (= lt!573728 (lemmaNoChangeToArrayThenSameMapNoExtras!1186 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5896 (array!82509 array!82507 (_ BitVec 32) (_ BitVec 32) V!48591 V!48591 (_ BitVec 32) Int) ListLongMap!18955)

(assert (=> b!1265095 (= lt!573726 (getCurrentListMapNoExtraKeys!5896 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1265095 (= lt!573727 (getCurrentListMapNoExtraKeys!5896 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1265096 () Bool)

(declare-fun res!842249 () Bool)

(assert (=> b!1265096 (=> (not res!842249) (not e!720389))))

(assert (=> b!1265096 (= res!842249 (and (= (size!40330 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40331 _keys!1118) (size!40330 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1265097 () Bool)

(declare-fun res!842251 () Bool)

(assert (=> b!1265097 (=> (not res!842251) (not e!720389))))

(declare-datatypes ((List!28296 0))(
  ( (Nil!28293) (Cons!28292 (h!29510 (_ BitVec 64)) (t!41805 List!28296)) )
))
(declare-fun arrayNoDuplicates!0 (array!82509 (_ BitVec 32) List!28296) Bool)

(assert (=> b!1265097 (= res!842251 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28293))))

(assert (= (and start!106366 res!842247) b!1265096))

(assert (= (and b!1265096 res!842249) b!1265090))

(assert (= (and b!1265090 res!842250) b!1265097))

(assert (= (and b!1265097 res!842251) b!1265095))

(assert (= (and b!1265095 res!842248) b!1265088))

(assert (= (and b!1265088 (not res!842246)) b!1265094))

(assert (= (and b!1265095 (not res!842245)) b!1265092))

(assert (= (and b!1265089 condMapEmpty!50458) mapIsEmpty!50458))

(assert (= (and b!1265089 (not condMapEmpty!50458)) mapNonEmpty!50458))

(get-info :version)

(assert (= (and mapNonEmpty!50458 ((_ is ValueCellFull!15446) mapValue!50458)) b!1265091))

(assert (= (and b!1265089 ((_ is ValueCellFull!15446) mapDefault!50458)) b!1265093))

(assert (= start!106366 b!1265089))

(declare-fun m!1165885 () Bool)

(assert (=> start!106366 m!1165885))

(declare-fun m!1165887 () Bool)

(assert (=> start!106366 m!1165887))

(declare-fun m!1165889 () Bool)

(assert (=> start!106366 m!1165889))

(declare-fun m!1165891 () Bool)

(assert (=> b!1265095 m!1165891))

(declare-fun m!1165893 () Bool)

(assert (=> b!1265095 m!1165893))

(declare-fun m!1165895 () Bool)

(assert (=> b!1265095 m!1165895))

(declare-fun m!1165897 () Bool)

(assert (=> b!1265092 m!1165897))

(declare-fun m!1165899 () Bool)

(assert (=> b!1265092 m!1165899))

(declare-fun m!1165901 () Bool)

(assert (=> b!1265090 m!1165901))

(declare-fun m!1165903 () Bool)

(assert (=> mapNonEmpty!50458 m!1165903))

(declare-fun m!1165905 () Bool)

(assert (=> b!1265097 m!1165905))

(declare-fun m!1165907 () Bool)

(assert (=> b!1265094 m!1165907))

(declare-fun m!1165909 () Bool)

(assert (=> b!1265094 m!1165909))

(assert (=> b!1265094 m!1165909))

(declare-fun m!1165911 () Bool)

(assert (=> b!1265094 m!1165911))

(check-sat (not start!106366) (not b!1265097) (not b!1265092) tp_is_empty!32419 (not b_next!27517) (not b!1265095) (not b!1265094) (not b!1265090) b_and!45527 (not mapNonEmpty!50458))
(check-sat b_and!45527 (not b_next!27517))
(get-model)

(declare-fun b!1265200 () Bool)

(declare-fun e!720472 () ListLongMap!18955)

(declare-fun call!62339 () ListLongMap!18955)

(assert (=> b!1265200 (= e!720472 call!62339)))

(declare-fun b!1265201 () Bool)

(declare-fun e!720477 () Bool)

(declare-fun e!720471 () Bool)

(assert (=> b!1265201 (= e!720477 e!720471)))

(declare-fun res!842314 () Bool)

(assert (=> b!1265201 (=> (not res!842314) (not e!720471))))

(declare-fun lt!573795 () ListLongMap!18955)

(declare-fun contains!7634 (ListLongMap!18955 (_ BitVec 64)) Bool)

(assert (=> b!1265201 (= res!842314 (contains!7634 lt!573795 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1265201 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40331 _keys!1118)))))

(declare-fun b!1265202 () Bool)

(declare-fun call!62340 () ListLongMap!18955)

(assert (=> b!1265202 (= e!720472 call!62340)))

(declare-fun b!1265203 () Bool)

(declare-fun e!720475 () Bool)

(declare-fun call!62342 () Bool)

(assert (=> b!1265203 (= e!720475 (not call!62342))))

(declare-fun bm!62333 () Bool)

(declare-fun call!62337 () ListLongMap!18955)

(assert (=> bm!62333 (= call!62340 call!62337)))

(declare-fun b!1265204 () Bool)

(declare-fun e!720469 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1265204 (= e!720469 (validKeyInArray!0 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1265205 () Bool)

(declare-fun c!123458 () Bool)

(assert (=> b!1265205 (= c!123458 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!720481 () ListLongMap!18955)

(assert (=> b!1265205 (= e!720481 e!720472)))

(declare-fun b!1265207 () Bool)

(declare-fun e!720480 () Bool)

(assert (=> b!1265207 (= e!720480 e!720475)))

(declare-fun c!123456 () Bool)

(assert (=> b!1265207 (= c!123456 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62334 () Bool)

(assert (=> bm!62334 (= call!62342 (contains!7634 lt!573795 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!123457 () Bool)

(declare-fun call!62336 () ListLongMap!18955)

(declare-fun c!123455 () Bool)

(declare-fun bm!62335 () Bool)

(declare-fun call!62341 () ListLongMap!18955)

(assert (=> bm!62335 (= call!62341 (+!4301 (ite c!123455 call!62336 (ite c!123457 call!62337 call!62340)) (ite (or c!123455 c!123457) (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1265208 () Bool)

(declare-fun e!720478 () ListLongMap!18955)

(assert (=> b!1265208 (= e!720478 (+!4301 call!62341 (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1265209 () Bool)

(declare-fun res!842320 () Bool)

(assert (=> b!1265209 (=> (not res!842320) (not e!720480))))

(assert (=> b!1265209 (= res!842320 e!720477)))

(declare-fun res!842312 () Bool)

(assert (=> b!1265209 (=> res!842312 e!720477)))

(assert (=> b!1265209 (= res!842312 (not e!720469))))

(declare-fun res!842316 () Bool)

(assert (=> b!1265209 (=> (not res!842316) (not e!720469))))

(assert (=> b!1265209 (= res!842316 (bvslt #b00000000000000000000000000000000 (size!40331 _keys!1118)))))

(declare-fun b!1265210 () Bool)

(declare-fun e!720470 () Bool)

(declare-fun apply!1012 (ListLongMap!18955 (_ BitVec 64)) V!48591)

(assert (=> b!1265210 (= e!720470 (= (apply!1012 lt!573795 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun bm!62336 () Bool)

(assert (=> bm!62336 (= call!62339 call!62341)))

(declare-fun b!1265211 () Bool)

(declare-fun e!720479 () Bool)

(assert (=> b!1265211 (= e!720479 (= (apply!1012 lt!573795 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1265212 () Bool)

(declare-fun get!20345 (ValueCell!15446 V!48591) V!48591)

(declare-fun dynLambda!3464 (Int (_ BitVec 64)) V!48591)

(assert (=> b!1265212 (= e!720471 (= (apply!1012 lt!573795 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000)) (get!20345 (select (arr!39793 _values!914) #b00000000000000000000000000000000) (dynLambda!3464 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1265212 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40330 _values!914)))))

(assert (=> b!1265212 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40331 _keys!1118)))))

(declare-fun b!1265213 () Bool)

(assert (=> b!1265213 (= e!720478 e!720481)))

(assert (=> b!1265213 (= c!123457 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1265214 () Bool)

(declare-fun e!720474 () Unit!42093)

(declare-fun lt!573803 () Unit!42093)

(assert (=> b!1265214 (= e!720474 lt!573803)))

(declare-fun lt!573811 () ListLongMap!18955)

(assert (=> b!1265214 (= lt!573811 (getCurrentListMapNoExtraKeys!5896 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573791 () (_ BitVec 64))

(assert (=> b!1265214 (= lt!573791 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573805 () (_ BitVec 64))

(assert (=> b!1265214 (= lt!573805 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573798 () Unit!42093)

(declare-fun addStillContains!1101 (ListLongMap!18955 (_ BitVec 64) V!48591 (_ BitVec 64)) Unit!42093)

(assert (=> b!1265214 (= lt!573798 (addStillContains!1101 lt!573811 lt!573791 zeroValue!871 lt!573805))))

(assert (=> b!1265214 (contains!7634 (+!4301 lt!573811 (tuple2!21075 lt!573791 zeroValue!871)) lt!573805)))

(declare-fun lt!573799 () Unit!42093)

(assert (=> b!1265214 (= lt!573799 lt!573798)))

(declare-fun lt!573804 () ListLongMap!18955)

(assert (=> b!1265214 (= lt!573804 (getCurrentListMapNoExtraKeys!5896 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573794 () (_ BitVec 64))

(assert (=> b!1265214 (= lt!573794 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573809 () (_ BitVec 64))

(assert (=> b!1265214 (= lt!573809 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573812 () Unit!42093)

(declare-fun addApplyDifferent!543 (ListLongMap!18955 (_ BitVec 64) V!48591 (_ BitVec 64)) Unit!42093)

(assert (=> b!1265214 (= lt!573812 (addApplyDifferent!543 lt!573804 lt!573794 minValueBefore!43 lt!573809))))

(assert (=> b!1265214 (= (apply!1012 (+!4301 lt!573804 (tuple2!21075 lt!573794 minValueBefore!43)) lt!573809) (apply!1012 lt!573804 lt!573809))))

(declare-fun lt!573806 () Unit!42093)

(assert (=> b!1265214 (= lt!573806 lt!573812)))

(declare-fun lt!573797 () ListLongMap!18955)

(assert (=> b!1265214 (= lt!573797 (getCurrentListMapNoExtraKeys!5896 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573801 () (_ BitVec 64))

(assert (=> b!1265214 (= lt!573801 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573796 () (_ BitVec 64))

(assert (=> b!1265214 (= lt!573796 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573807 () Unit!42093)

(assert (=> b!1265214 (= lt!573807 (addApplyDifferent!543 lt!573797 lt!573801 zeroValue!871 lt!573796))))

(assert (=> b!1265214 (= (apply!1012 (+!4301 lt!573797 (tuple2!21075 lt!573801 zeroValue!871)) lt!573796) (apply!1012 lt!573797 lt!573796))))

(declare-fun lt!573800 () Unit!42093)

(assert (=> b!1265214 (= lt!573800 lt!573807)))

(declare-fun lt!573810 () ListLongMap!18955)

(assert (=> b!1265214 (= lt!573810 (getCurrentListMapNoExtraKeys!5896 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573792 () (_ BitVec 64))

(assert (=> b!1265214 (= lt!573792 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573793 () (_ BitVec 64))

(assert (=> b!1265214 (= lt!573793 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1265214 (= lt!573803 (addApplyDifferent!543 lt!573810 lt!573792 minValueBefore!43 lt!573793))))

(assert (=> b!1265214 (= (apply!1012 (+!4301 lt!573810 (tuple2!21075 lt!573792 minValueBefore!43)) lt!573793) (apply!1012 lt!573810 lt!573793))))

(declare-fun bm!62337 () Bool)

(declare-fun call!62338 () Bool)

(assert (=> bm!62337 (= call!62338 (contains!7634 lt!573795 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1265206 () Bool)

(declare-fun e!720476 () Bool)

(assert (=> b!1265206 (= e!720476 (not call!62338))))

(declare-fun d!139115 () Bool)

(assert (=> d!139115 e!720480))

(declare-fun res!842317 () Bool)

(assert (=> d!139115 (=> (not res!842317) (not e!720480))))

(assert (=> d!139115 (= res!842317 (or (bvsge #b00000000000000000000000000000000 (size!40331 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40331 _keys!1118)))))))

(declare-fun lt!573808 () ListLongMap!18955)

(assert (=> d!139115 (= lt!573795 lt!573808)))

(declare-fun lt!573802 () Unit!42093)

(assert (=> d!139115 (= lt!573802 e!720474)))

(declare-fun c!123454 () Bool)

(declare-fun e!720473 () Bool)

(assert (=> d!139115 (= c!123454 e!720473)))

(declare-fun res!842319 () Bool)

(assert (=> d!139115 (=> (not res!842319) (not e!720473))))

(assert (=> d!139115 (= res!842319 (bvslt #b00000000000000000000000000000000 (size!40331 _keys!1118)))))

(assert (=> d!139115 (= lt!573808 e!720478)))

(assert (=> d!139115 (= c!123455 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!139115 (validMask!0 mask!1466)))

(assert (=> d!139115 (= (getCurrentListMap!4645 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573795)))

(declare-fun b!1265215 () Bool)

(assert (=> b!1265215 (= e!720481 call!62339)))

(declare-fun b!1265216 () Bool)

(assert (=> b!1265216 (= e!720475 e!720479)))

(declare-fun res!842315 () Bool)

(assert (=> b!1265216 (= res!842315 call!62342)))

(assert (=> b!1265216 (=> (not res!842315) (not e!720479))))

(declare-fun b!1265217 () Bool)

(assert (=> b!1265217 (= e!720473 (validKeyInArray!0 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62338 () Bool)

(assert (=> bm!62338 (= call!62337 call!62336)))

(declare-fun b!1265218 () Bool)

(assert (=> b!1265218 (= e!720476 e!720470)))

(declare-fun res!842318 () Bool)

(assert (=> b!1265218 (= res!842318 call!62338)))

(assert (=> b!1265218 (=> (not res!842318) (not e!720470))))

(declare-fun b!1265219 () Bool)

(declare-fun Unit!42099 () Unit!42093)

(assert (=> b!1265219 (= e!720474 Unit!42099)))

(declare-fun b!1265220 () Bool)

(declare-fun res!842313 () Bool)

(assert (=> b!1265220 (=> (not res!842313) (not e!720480))))

(assert (=> b!1265220 (= res!842313 e!720476)))

(declare-fun c!123459 () Bool)

(assert (=> b!1265220 (= c!123459 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!62339 () Bool)

(assert (=> bm!62339 (= call!62336 (getCurrentListMapNoExtraKeys!5896 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and d!139115 c!123455) b!1265208))

(assert (= (and d!139115 (not c!123455)) b!1265213))

(assert (= (and b!1265213 c!123457) b!1265215))

(assert (= (and b!1265213 (not c!123457)) b!1265205))

(assert (= (and b!1265205 c!123458) b!1265200))

(assert (= (and b!1265205 (not c!123458)) b!1265202))

(assert (= (or b!1265200 b!1265202) bm!62333))

(assert (= (or b!1265215 bm!62333) bm!62338))

(assert (= (or b!1265215 b!1265200) bm!62336))

(assert (= (or b!1265208 bm!62338) bm!62339))

(assert (= (or b!1265208 bm!62336) bm!62335))

(assert (= (and d!139115 res!842319) b!1265217))

(assert (= (and d!139115 c!123454) b!1265214))

(assert (= (and d!139115 (not c!123454)) b!1265219))

(assert (= (and d!139115 res!842317) b!1265209))

(assert (= (and b!1265209 res!842316) b!1265204))

(assert (= (and b!1265209 (not res!842312)) b!1265201))

(assert (= (and b!1265201 res!842314) b!1265212))

(assert (= (and b!1265209 res!842320) b!1265220))

(assert (= (and b!1265220 c!123459) b!1265218))

(assert (= (and b!1265220 (not c!123459)) b!1265206))

(assert (= (and b!1265218 res!842318) b!1265210))

(assert (= (or b!1265218 b!1265206) bm!62337))

(assert (= (and b!1265220 res!842313) b!1265207))

(assert (= (and b!1265207 c!123456) b!1265216))

(assert (= (and b!1265207 (not c!123456)) b!1265203))

(assert (= (and b!1265216 res!842315) b!1265211))

(assert (= (or b!1265216 b!1265203) bm!62334))

(declare-fun b_lambda!22985 () Bool)

(assert (=> (not b_lambda!22985) (not b!1265212)))

(declare-fun t!41810 () Bool)

(declare-fun tb!11325 () Bool)

(assert (=> (and start!106366 (= defaultEntry!922 defaultEntry!922) t!41810) tb!11325))

(declare-fun result!23399 () Bool)

(assert (=> tb!11325 (= result!23399 tp_is_empty!32419)))

(assert (=> b!1265212 t!41810))

(declare-fun b_and!45533 () Bool)

(assert (= b_and!45527 (and (=> t!41810 result!23399) b_and!45533)))

(declare-fun m!1165969 () Bool)

(assert (=> b!1265210 m!1165969))

(declare-fun m!1165971 () Bool)

(assert (=> b!1265204 m!1165971))

(assert (=> b!1265204 m!1165971))

(declare-fun m!1165973 () Bool)

(assert (=> b!1265204 m!1165973))

(assert (=> bm!62339 m!1165895))

(declare-fun m!1165975 () Bool)

(assert (=> b!1265211 m!1165975))

(declare-fun m!1165977 () Bool)

(assert (=> bm!62337 m!1165977))

(assert (=> b!1265212 m!1165971))

(declare-fun m!1165979 () Bool)

(assert (=> b!1265212 m!1165979))

(assert (=> b!1265212 m!1165971))

(declare-fun m!1165981 () Bool)

(assert (=> b!1265212 m!1165981))

(declare-fun m!1165983 () Bool)

(assert (=> b!1265212 m!1165983))

(declare-fun m!1165985 () Bool)

(assert (=> b!1265212 m!1165985))

(assert (=> b!1265212 m!1165983))

(assert (=> b!1265212 m!1165981))

(assert (=> d!139115 m!1165885))

(declare-fun m!1165987 () Bool)

(assert (=> b!1265214 m!1165987))

(declare-fun m!1165989 () Bool)

(assert (=> b!1265214 m!1165989))

(assert (=> b!1265214 m!1165971))

(declare-fun m!1165991 () Bool)

(assert (=> b!1265214 m!1165991))

(declare-fun m!1165993 () Bool)

(assert (=> b!1265214 m!1165993))

(assert (=> b!1265214 m!1165895))

(declare-fun m!1165995 () Bool)

(assert (=> b!1265214 m!1165995))

(declare-fun m!1165997 () Bool)

(assert (=> b!1265214 m!1165997))

(declare-fun m!1165999 () Bool)

(assert (=> b!1265214 m!1165999))

(declare-fun m!1166001 () Bool)

(assert (=> b!1265214 m!1166001))

(declare-fun m!1166003 () Bool)

(assert (=> b!1265214 m!1166003))

(declare-fun m!1166005 () Bool)

(assert (=> b!1265214 m!1166005))

(declare-fun m!1166007 () Bool)

(assert (=> b!1265214 m!1166007))

(assert (=> b!1265214 m!1166005))

(assert (=> b!1265214 m!1165999))

(assert (=> b!1265214 m!1165993))

(declare-fun m!1166009 () Bool)

(assert (=> b!1265214 m!1166009))

(declare-fun m!1166011 () Bool)

(assert (=> b!1265214 m!1166011))

(declare-fun m!1166013 () Bool)

(assert (=> b!1265214 m!1166013))

(assert (=> b!1265214 m!1165997))

(declare-fun m!1166015 () Bool)

(assert (=> b!1265214 m!1166015))

(declare-fun m!1166017 () Bool)

(assert (=> b!1265208 m!1166017))

(assert (=> b!1265201 m!1165971))

(assert (=> b!1265201 m!1165971))

(declare-fun m!1166019 () Bool)

(assert (=> b!1265201 m!1166019))

(declare-fun m!1166021 () Bool)

(assert (=> bm!62335 m!1166021))

(assert (=> b!1265217 m!1165971))

(assert (=> b!1265217 m!1165971))

(assert (=> b!1265217 m!1165973))

(declare-fun m!1166023 () Bool)

(assert (=> bm!62334 m!1166023))

(assert (=> b!1265094 d!139115))

(declare-fun d!139117 () Bool)

(declare-fun e!720484 () Bool)

(assert (=> d!139117 e!720484))

(declare-fun res!842326 () Bool)

(assert (=> d!139117 (=> (not res!842326) (not e!720484))))

(declare-fun lt!573824 () ListLongMap!18955)

(assert (=> d!139117 (= res!842326 (contains!7634 lt!573824 (_1!10548 (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!573823 () List!28295)

(assert (=> d!139117 (= lt!573824 (ListLongMap!18956 lt!573823))))

(declare-fun lt!573821 () Unit!42093)

(declare-fun lt!573822 () Unit!42093)

(assert (=> d!139117 (= lt!573821 lt!573822)))

(declare-datatypes ((Option!715 0))(
  ( (Some!714 (v!18983 V!48591)) (None!713) )
))
(declare-fun getValueByKey!664 (List!28295 (_ BitVec 64)) Option!715)

(assert (=> d!139117 (= (getValueByKey!664 lt!573823 (_1!10548 (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!714 (_2!10548 (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lemmaContainsTupThenGetReturnValue!338 (List!28295 (_ BitVec 64) V!48591) Unit!42093)

(assert (=> d!139117 (= lt!573822 (lemmaContainsTupThenGetReturnValue!338 lt!573823 (_1!10548 (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10548 (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun insertStrictlySorted!452 (List!28295 (_ BitVec 64) V!48591) List!28295)

(assert (=> d!139117 (= lt!573823 (insertStrictlySorted!452 (toList!9493 (+!4301 lt!573727 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))) (_1!10548 (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10548 (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!139117 (= (+!4301 (+!4301 lt!573727 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!573824)))

(declare-fun b!1265227 () Bool)

(declare-fun res!842325 () Bool)

(assert (=> b!1265227 (=> (not res!842325) (not e!720484))))

(assert (=> b!1265227 (= res!842325 (= (getValueByKey!664 (toList!9493 lt!573824) (_1!10548 (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!714 (_2!10548 (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1265228 () Bool)

(declare-fun contains!7635 (List!28295 tuple2!21074) Bool)

(assert (=> b!1265228 (= e!720484 (contains!7635 (toList!9493 lt!573824) (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!139117 res!842326) b!1265227))

(assert (= (and b!1265227 res!842325) b!1265228))

(declare-fun m!1166025 () Bool)

(assert (=> d!139117 m!1166025))

(declare-fun m!1166027 () Bool)

(assert (=> d!139117 m!1166027))

(declare-fun m!1166029 () Bool)

(assert (=> d!139117 m!1166029))

(declare-fun m!1166031 () Bool)

(assert (=> d!139117 m!1166031))

(declare-fun m!1166033 () Bool)

(assert (=> b!1265227 m!1166033))

(declare-fun m!1166035 () Bool)

(assert (=> b!1265228 m!1166035))

(assert (=> b!1265094 d!139117))

(declare-fun d!139119 () Bool)

(declare-fun e!720485 () Bool)

(assert (=> d!139119 e!720485))

(declare-fun res!842328 () Bool)

(assert (=> d!139119 (=> (not res!842328) (not e!720485))))

(declare-fun lt!573828 () ListLongMap!18955)

(assert (=> d!139119 (= res!842328 (contains!7634 lt!573828 (_1!10548 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(declare-fun lt!573827 () List!28295)

(assert (=> d!139119 (= lt!573828 (ListLongMap!18956 lt!573827))))

(declare-fun lt!573825 () Unit!42093)

(declare-fun lt!573826 () Unit!42093)

(assert (=> d!139119 (= lt!573825 lt!573826)))

(assert (=> d!139119 (= (getValueByKey!664 lt!573827 (_1!10548 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))) (Some!714 (_2!10548 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!139119 (= lt!573826 (lemmaContainsTupThenGetReturnValue!338 lt!573827 (_1!10548 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (_2!10548 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!139119 (= lt!573827 (insertStrictlySorted!452 (toList!9493 lt!573727) (_1!10548 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (_2!10548 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!139119 (= (+!4301 lt!573727 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) lt!573828)))

(declare-fun b!1265229 () Bool)

(declare-fun res!842327 () Bool)

(assert (=> b!1265229 (=> (not res!842327) (not e!720485))))

(assert (=> b!1265229 (= res!842327 (= (getValueByKey!664 (toList!9493 lt!573828) (_1!10548 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))) (Some!714 (_2!10548 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)))))))

(declare-fun b!1265230 () Bool)

(assert (=> b!1265230 (= e!720485 (contains!7635 (toList!9493 lt!573828) (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)))))

(assert (= (and d!139119 res!842328) b!1265229))

(assert (= (and b!1265229 res!842327) b!1265230))

(declare-fun m!1166037 () Bool)

(assert (=> d!139119 m!1166037))

(declare-fun m!1166039 () Bool)

(assert (=> d!139119 m!1166039))

(declare-fun m!1166041 () Bool)

(assert (=> d!139119 m!1166041))

(declare-fun m!1166043 () Bool)

(assert (=> d!139119 m!1166043))

(declare-fun m!1166045 () Bool)

(assert (=> b!1265229 m!1166045))

(declare-fun m!1166047 () Bool)

(assert (=> b!1265230 m!1166047))

(assert (=> b!1265094 d!139119))

(declare-fun bm!62342 () Bool)

(declare-fun call!62345 () Bool)

(assert (=> bm!62342 (= call!62345 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1265239 () Bool)

(declare-fun e!720492 () Bool)

(declare-fun e!720494 () Bool)

(assert (=> b!1265239 (= e!720492 e!720494)))

(declare-fun c!123462 () Bool)

(assert (=> b!1265239 (= c!123462 (validKeyInArray!0 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!139121 () Bool)

(declare-fun res!842334 () Bool)

(assert (=> d!139121 (=> res!842334 e!720492)))

(assert (=> d!139121 (= res!842334 (bvsge #b00000000000000000000000000000000 (size!40331 _keys!1118)))))

(assert (=> d!139121 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!720492)))

(declare-fun b!1265240 () Bool)

(declare-fun e!720493 () Bool)

(assert (=> b!1265240 (= e!720494 e!720493)))

(declare-fun lt!573837 () (_ BitVec 64))

(assert (=> b!1265240 (= lt!573837 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573835 () Unit!42093)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82509 (_ BitVec 64) (_ BitVec 32)) Unit!42093)

(assert (=> b!1265240 (= lt!573835 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!573837 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1265240 (arrayContainsKey!0 _keys!1118 lt!573837 #b00000000000000000000000000000000)))

(declare-fun lt!573836 () Unit!42093)

(assert (=> b!1265240 (= lt!573836 lt!573835)))

(declare-fun res!842333 () Bool)

(declare-datatypes ((SeekEntryResult!9937 0))(
  ( (MissingZero!9937 (index!42119 (_ BitVec 32))) (Found!9937 (index!42120 (_ BitVec 32))) (Intermediate!9937 (undefined!10749 Bool) (index!42121 (_ BitVec 32)) (x!111343 (_ BitVec 32))) (Undefined!9937) (MissingVacant!9937 (index!42122 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82509 (_ BitVec 32)) SeekEntryResult!9937)

(assert (=> b!1265240 (= res!842333 (= (seekEntryOrOpen!0 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9937 #b00000000000000000000000000000000)))))

(assert (=> b!1265240 (=> (not res!842333) (not e!720493))))

(declare-fun b!1265241 () Bool)

(assert (=> b!1265241 (= e!720494 call!62345)))

(declare-fun b!1265242 () Bool)

(assert (=> b!1265242 (= e!720493 call!62345)))

(assert (= (and d!139121 (not res!842334)) b!1265239))

(assert (= (and b!1265239 c!123462) b!1265240))

(assert (= (and b!1265239 (not c!123462)) b!1265241))

(assert (= (and b!1265240 res!842333) b!1265242))

(assert (= (or b!1265242 b!1265241) bm!62342))

(declare-fun m!1166049 () Bool)

(assert (=> bm!62342 m!1166049))

(assert (=> b!1265239 m!1165971))

(assert (=> b!1265239 m!1165971))

(assert (=> b!1265239 m!1165973))

(assert (=> b!1265240 m!1165971))

(declare-fun m!1166051 () Bool)

(assert (=> b!1265240 m!1166051))

(declare-fun m!1166053 () Bool)

(assert (=> b!1265240 m!1166053))

(assert (=> b!1265240 m!1165971))

(declare-fun m!1166055 () Bool)

(assert (=> b!1265240 m!1166055))

(assert (=> b!1265090 d!139121))

(declare-fun d!139123 () Bool)

(assert (=> d!139123 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106366 d!139123))

(declare-fun d!139125 () Bool)

(assert (=> d!139125 (= (array_inv!30447 _keys!1118) (bvsge (size!40331 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106366 d!139125))

(declare-fun d!139127 () Bool)

(assert (=> d!139127 (= (array_inv!30448 _values!914) (bvsge (size!40330 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106366 d!139127))

(declare-fun b!1265253 () Bool)

(declare-fun e!720503 () Bool)

(declare-fun e!720506 () Bool)

(assert (=> b!1265253 (= e!720503 e!720506)))

(declare-fun res!842341 () Bool)

(assert (=> b!1265253 (=> (not res!842341) (not e!720506))))

(declare-fun e!720505 () Bool)

(assert (=> b!1265253 (= res!842341 (not e!720505))))

(declare-fun res!842343 () Bool)

(assert (=> b!1265253 (=> (not res!842343) (not e!720505))))

(assert (=> b!1265253 (= res!842343 (validKeyInArray!0 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!139129 () Bool)

(declare-fun res!842342 () Bool)

(assert (=> d!139129 (=> res!842342 e!720503)))

(assert (=> d!139129 (= res!842342 (bvsge #b00000000000000000000000000000000 (size!40331 _keys!1118)))))

(assert (=> d!139129 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28293) e!720503)))

(declare-fun b!1265254 () Bool)

(declare-fun e!720504 () Bool)

(assert (=> b!1265254 (= e!720506 e!720504)))

(declare-fun c!123465 () Bool)

(assert (=> b!1265254 (= c!123465 (validKeyInArray!0 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1265255 () Bool)

(declare-fun contains!7636 (List!28296 (_ BitVec 64)) Bool)

(assert (=> b!1265255 (= e!720505 (contains!7636 Nil!28293 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1265256 () Bool)

(declare-fun call!62348 () Bool)

(assert (=> b!1265256 (= e!720504 call!62348)))

(declare-fun bm!62345 () Bool)

(assert (=> bm!62345 (= call!62348 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123465 (Cons!28292 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000) Nil!28293) Nil!28293)))))

(declare-fun b!1265257 () Bool)

(assert (=> b!1265257 (= e!720504 call!62348)))

(assert (= (and d!139129 (not res!842342)) b!1265253))

(assert (= (and b!1265253 res!842343) b!1265255))

(assert (= (and b!1265253 res!842341) b!1265254))

(assert (= (and b!1265254 c!123465) b!1265256))

(assert (= (and b!1265254 (not c!123465)) b!1265257))

(assert (= (or b!1265256 b!1265257) bm!62345))

(assert (=> b!1265253 m!1165971))

(assert (=> b!1265253 m!1165971))

(assert (=> b!1265253 m!1165973))

(assert (=> b!1265254 m!1165971))

(assert (=> b!1265254 m!1165971))

(assert (=> b!1265254 m!1165973))

(assert (=> b!1265255 m!1165971))

(assert (=> b!1265255 m!1165971))

(declare-fun m!1166057 () Bool)

(assert (=> b!1265255 m!1166057))

(assert (=> bm!62345 m!1165971))

(declare-fun m!1166059 () Bool)

(assert (=> bm!62345 m!1166059))

(assert (=> b!1265097 d!139129))

(declare-fun b!1265258 () Bool)

(declare-fun e!720510 () ListLongMap!18955)

(declare-fun call!62352 () ListLongMap!18955)

(assert (=> b!1265258 (= e!720510 call!62352)))

(declare-fun b!1265259 () Bool)

(declare-fun e!720515 () Bool)

(declare-fun e!720509 () Bool)

(assert (=> b!1265259 (= e!720515 e!720509)))

(declare-fun res!842346 () Bool)

(assert (=> b!1265259 (=> (not res!842346) (not e!720509))))

(declare-fun lt!573842 () ListLongMap!18955)

(assert (=> b!1265259 (= res!842346 (contains!7634 lt!573842 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1265259 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40331 _keys!1118)))))

(declare-fun b!1265260 () Bool)

(declare-fun call!62353 () ListLongMap!18955)

(assert (=> b!1265260 (= e!720510 call!62353)))

(declare-fun b!1265261 () Bool)

(declare-fun e!720513 () Bool)

(declare-fun call!62355 () Bool)

(assert (=> b!1265261 (= e!720513 (not call!62355))))

(declare-fun bm!62346 () Bool)

(declare-fun call!62350 () ListLongMap!18955)

(assert (=> bm!62346 (= call!62353 call!62350)))

(declare-fun b!1265262 () Bool)

(declare-fun e!720507 () Bool)

(assert (=> b!1265262 (= e!720507 (validKeyInArray!0 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1265263 () Bool)

(declare-fun c!123470 () Bool)

(assert (=> b!1265263 (= c!123470 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!720519 () ListLongMap!18955)

(assert (=> b!1265263 (= e!720519 e!720510)))

(declare-fun b!1265265 () Bool)

(declare-fun e!720518 () Bool)

(assert (=> b!1265265 (= e!720518 e!720513)))

(declare-fun c!123468 () Bool)

(assert (=> b!1265265 (= c!123468 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62347 () Bool)

(assert (=> bm!62347 (= call!62355 (contains!7634 lt!573842 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!62354 () ListLongMap!18955)

(declare-fun c!123469 () Bool)

(declare-fun bm!62348 () Bool)

(declare-fun call!62349 () ListLongMap!18955)

(declare-fun c!123467 () Bool)

(assert (=> bm!62348 (= call!62354 (+!4301 (ite c!123467 call!62349 (ite c!123469 call!62350 call!62353)) (ite (or c!123467 c!123469) (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1265266 () Bool)

(declare-fun e!720516 () ListLongMap!18955)

(assert (=> b!1265266 (= e!720516 (+!4301 call!62354 (tuple2!21075 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun b!1265267 () Bool)

(declare-fun res!842352 () Bool)

(assert (=> b!1265267 (=> (not res!842352) (not e!720518))))

(assert (=> b!1265267 (= res!842352 e!720515)))

(declare-fun res!842344 () Bool)

(assert (=> b!1265267 (=> res!842344 e!720515)))

(assert (=> b!1265267 (= res!842344 (not e!720507))))

(declare-fun res!842348 () Bool)

(assert (=> b!1265267 (=> (not res!842348) (not e!720507))))

(assert (=> b!1265267 (= res!842348 (bvslt #b00000000000000000000000000000000 (size!40331 _keys!1118)))))

(declare-fun b!1265268 () Bool)

(declare-fun e!720508 () Bool)

(assert (=> b!1265268 (= e!720508 (= (apply!1012 lt!573842 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun bm!62349 () Bool)

(assert (=> bm!62349 (= call!62352 call!62354)))

(declare-fun b!1265269 () Bool)

(declare-fun e!720517 () Bool)

(assert (=> b!1265269 (= e!720517 (= (apply!1012 lt!573842 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun b!1265270 () Bool)

(assert (=> b!1265270 (= e!720509 (= (apply!1012 lt!573842 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000)) (get!20345 (select (arr!39793 _values!914) #b00000000000000000000000000000000) (dynLambda!3464 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1265270 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40330 _values!914)))))

(assert (=> b!1265270 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40331 _keys!1118)))))

(declare-fun b!1265271 () Bool)

(assert (=> b!1265271 (= e!720516 e!720519)))

(assert (=> b!1265271 (= c!123469 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1265272 () Bool)

(declare-fun e!720512 () Unit!42093)

(declare-fun lt!573850 () Unit!42093)

(assert (=> b!1265272 (= e!720512 lt!573850)))

(declare-fun lt!573858 () ListLongMap!18955)

(assert (=> b!1265272 (= lt!573858 (getCurrentListMapNoExtraKeys!5896 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573838 () (_ BitVec 64))

(assert (=> b!1265272 (= lt!573838 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573852 () (_ BitVec 64))

(assert (=> b!1265272 (= lt!573852 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573845 () Unit!42093)

(assert (=> b!1265272 (= lt!573845 (addStillContains!1101 lt!573858 lt!573838 zeroValue!871 lt!573852))))

(assert (=> b!1265272 (contains!7634 (+!4301 lt!573858 (tuple2!21075 lt!573838 zeroValue!871)) lt!573852)))

(declare-fun lt!573846 () Unit!42093)

(assert (=> b!1265272 (= lt!573846 lt!573845)))

(declare-fun lt!573851 () ListLongMap!18955)

(assert (=> b!1265272 (= lt!573851 (getCurrentListMapNoExtraKeys!5896 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573841 () (_ BitVec 64))

(assert (=> b!1265272 (= lt!573841 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573856 () (_ BitVec 64))

(assert (=> b!1265272 (= lt!573856 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573859 () Unit!42093)

(assert (=> b!1265272 (= lt!573859 (addApplyDifferent!543 lt!573851 lt!573841 minValueAfter!43 lt!573856))))

(assert (=> b!1265272 (= (apply!1012 (+!4301 lt!573851 (tuple2!21075 lt!573841 minValueAfter!43)) lt!573856) (apply!1012 lt!573851 lt!573856))))

(declare-fun lt!573853 () Unit!42093)

(assert (=> b!1265272 (= lt!573853 lt!573859)))

(declare-fun lt!573844 () ListLongMap!18955)

(assert (=> b!1265272 (= lt!573844 (getCurrentListMapNoExtraKeys!5896 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573848 () (_ BitVec 64))

(assert (=> b!1265272 (= lt!573848 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573843 () (_ BitVec 64))

(assert (=> b!1265272 (= lt!573843 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573854 () Unit!42093)

(assert (=> b!1265272 (= lt!573854 (addApplyDifferent!543 lt!573844 lt!573848 zeroValue!871 lt!573843))))

(assert (=> b!1265272 (= (apply!1012 (+!4301 lt!573844 (tuple2!21075 lt!573848 zeroValue!871)) lt!573843) (apply!1012 lt!573844 lt!573843))))

(declare-fun lt!573847 () Unit!42093)

(assert (=> b!1265272 (= lt!573847 lt!573854)))

(declare-fun lt!573857 () ListLongMap!18955)

(assert (=> b!1265272 (= lt!573857 (getCurrentListMapNoExtraKeys!5896 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573839 () (_ BitVec 64))

(assert (=> b!1265272 (= lt!573839 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573840 () (_ BitVec 64))

(assert (=> b!1265272 (= lt!573840 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1265272 (= lt!573850 (addApplyDifferent!543 lt!573857 lt!573839 minValueAfter!43 lt!573840))))

(assert (=> b!1265272 (= (apply!1012 (+!4301 lt!573857 (tuple2!21075 lt!573839 minValueAfter!43)) lt!573840) (apply!1012 lt!573857 lt!573840))))

(declare-fun bm!62350 () Bool)

(declare-fun call!62351 () Bool)

(assert (=> bm!62350 (= call!62351 (contains!7634 lt!573842 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1265264 () Bool)

(declare-fun e!720514 () Bool)

(assert (=> b!1265264 (= e!720514 (not call!62351))))

(declare-fun d!139131 () Bool)

(assert (=> d!139131 e!720518))

(declare-fun res!842349 () Bool)

(assert (=> d!139131 (=> (not res!842349) (not e!720518))))

(assert (=> d!139131 (= res!842349 (or (bvsge #b00000000000000000000000000000000 (size!40331 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40331 _keys!1118)))))))

(declare-fun lt!573855 () ListLongMap!18955)

(assert (=> d!139131 (= lt!573842 lt!573855)))

(declare-fun lt!573849 () Unit!42093)

(assert (=> d!139131 (= lt!573849 e!720512)))

(declare-fun c!123466 () Bool)

(declare-fun e!720511 () Bool)

(assert (=> d!139131 (= c!123466 e!720511)))

(declare-fun res!842351 () Bool)

(assert (=> d!139131 (=> (not res!842351) (not e!720511))))

(assert (=> d!139131 (= res!842351 (bvslt #b00000000000000000000000000000000 (size!40331 _keys!1118)))))

(assert (=> d!139131 (= lt!573855 e!720516)))

(assert (=> d!139131 (= c!123467 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!139131 (validMask!0 mask!1466)))

(assert (=> d!139131 (= (getCurrentListMap!4645 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573842)))

(declare-fun b!1265273 () Bool)

(assert (=> b!1265273 (= e!720519 call!62352)))

(declare-fun b!1265274 () Bool)

(assert (=> b!1265274 (= e!720513 e!720517)))

(declare-fun res!842347 () Bool)

(assert (=> b!1265274 (= res!842347 call!62355)))

(assert (=> b!1265274 (=> (not res!842347) (not e!720517))))

(declare-fun b!1265275 () Bool)

(assert (=> b!1265275 (= e!720511 (validKeyInArray!0 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62351 () Bool)

(assert (=> bm!62351 (= call!62350 call!62349)))

(declare-fun b!1265276 () Bool)

(assert (=> b!1265276 (= e!720514 e!720508)))

(declare-fun res!842350 () Bool)

(assert (=> b!1265276 (= res!842350 call!62351)))

(assert (=> b!1265276 (=> (not res!842350) (not e!720508))))

(declare-fun b!1265277 () Bool)

(declare-fun Unit!42100 () Unit!42093)

(assert (=> b!1265277 (= e!720512 Unit!42100)))

(declare-fun b!1265278 () Bool)

(declare-fun res!842345 () Bool)

(assert (=> b!1265278 (=> (not res!842345) (not e!720518))))

(assert (=> b!1265278 (= res!842345 e!720514)))

(declare-fun c!123471 () Bool)

(assert (=> b!1265278 (= c!123471 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!62352 () Bool)

(assert (=> bm!62352 (= call!62349 (getCurrentListMapNoExtraKeys!5896 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and d!139131 c!123467) b!1265266))

(assert (= (and d!139131 (not c!123467)) b!1265271))

(assert (= (and b!1265271 c!123469) b!1265273))

(assert (= (and b!1265271 (not c!123469)) b!1265263))

(assert (= (and b!1265263 c!123470) b!1265258))

(assert (= (and b!1265263 (not c!123470)) b!1265260))

(assert (= (or b!1265258 b!1265260) bm!62346))

(assert (= (or b!1265273 bm!62346) bm!62351))

(assert (= (or b!1265273 b!1265258) bm!62349))

(assert (= (or b!1265266 bm!62351) bm!62352))

(assert (= (or b!1265266 bm!62349) bm!62348))

(assert (= (and d!139131 res!842351) b!1265275))

(assert (= (and d!139131 c!123466) b!1265272))

(assert (= (and d!139131 (not c!123466)) b!1265277))

(assert (= (and d!139131 res!842349) b!1265267))

(assert (= (and b!1265267 res!842348) b!1265262))

(assert (= (and b!1265267 (not res!842344)) b!1265259))

(assert (= (and b!1265259 res!842346) b!1265270))

(assert (= (and b!1265267 res!842352) b!1265278))

(assert (= (and b!1265278 c!123471) b!1265276))

(assert (= (and b!1265278 (not c!123471)) b!1265264))

(assert (= (and b!1265276 res!842350) b!1265268))

(assert (= (or b!1265276 b!1265264) bm!62350))

(assert (= (and b!1265278 res!842345) b!1265265))

(assert (= (and b!1265265 c!123468) b!1265274))

(assert (= (and b!1265265 (not c!123468)) b!1265261))

(assert (= (and b!1265274 res!842347) b!1265269))

(assert (= (or b!1265274 b!1265261) bm!62347))

(declare-fun b_lambda!22987 () Bool)

(assert (=> (not b_lambda!22987) (not b!1265270)))

(assert (=> b!1265270 t!41810))

(declare-fun b_and!45535 () Bool)

(assert (= b_and!45533 (and (=> t!41810 result!23399) b_and!45535)))

(declare-fun m!1166061 () Bool)

(assert (=> b!1265268 m!1166061))

(assert (=> b!1265262 m!1165971))

(assert (=> b!1265262 m!1165971))

(assert (=> b!1265262 m!1165973))

(assert (=> bm!62352 m!1165893))

(declare-fun m!1166063 () Bool)

(assert (=> b!1265269 m!1166063))

(declare-fun m!1166065 () Bool)

(assert (=> bm!62350 m!1166065))

(assert (=> b!1265270 m!1165971))

(declare-fun m!1166067 () Bool)

(assert (=> b!1265270 m!1166067))

(assert (=> b!1265270 m!1165971))

(assert (=> b!1265270 m!1165981))

(assert (=> b!1265270 m!1165983))

(assert (=> b!1265270 m!1165985))

(assert (=> b!1265270 m!1165983))

(assert (=> b!1265270 m!1165981))

(assert (=> d!139131 m!1165885))

(declare-fun m!1166069 () Bool)

(assert (=> b!1265272 m!1166069))

(declare-fun m!1166071 () Bool)

(assert (=> b!1265272 m!1166071))

(assert (=> b!1265272 m!1165971))

(declare-fun m!1166073 () Bool)

(assert (=> b!1265272 m!1166073))

(declare-fun m!1166075 () Bool)

(assert (=> b!1265272 m!1166075))

(assert (=> b!1265272 m!1165893))

(declare-fun m!1166077 () Bool)

(assert (=> b!1265272 m!1166077))

(declare-fun m!1166079 () Bool)

(assert (=> b!1265272 m!1166079))

(declare-fun m!1166081 () Bool)

(assert (=> b!1265272 m!1166081))

(declare-fun m!1166083 () Bool)

(assert (=> b!1265272 m!1166083))

(declare-fun m!1166085 () Bool)

(assert (=> b!1265272 m!1166085))

(declare-fun m!1166087 () Bool)

(assert (=> b!1265272 m!1166087))

(declare-fun m!1166089 () Bool)

(assert (=> b!1265272 m!1166089))

(assert (=> b!1265272 m!1166087))

(assert (=> b!1265272 m!1166081))

(assert (=> b!1265272 m!1166075))

(declare-fun m!1166091 () Bool)

(assert (=> b!1265272 m!1166091))

(declare-fun m!1166093 () Bool)

(assert (=> b!1265272 m!1166093))

(declare-fun m!1166095 () Bool)

(assert (=> b!1265272 m!1166095))

(assert (=> b!1265272 m!1166079))

(declare-fun m!1166097 () Bool)

(assert (=> b!1265272 m!1166097))

(declare-fun m!1166099 () Bool)

(assert (=> b!1265266 m!1166099))

(assert (=> b!1265259 m!1165971))

(assert (=> b!1265259 m!1165971))

(declare-fun m!1166101 () Bool)

(assert (=> b!1265259 m!1166101))

(declare-fun m!1166103 () Bool)

(assert (=> bm!62348 m!1166103))

(assert (=> b!1265275 m!1165971))

(assert (=> b!1265275 m!1165971))

(assert (=> b!1265275 m!1165973))

(declare-fun m!1166105 () Bool)

(assert (=> bm!62347 m!1166105))

(assert (=> b!1265092 d!139131))

(declare-fun d!139133 () Bool)

(declare-fun e!720520 () Bool)

(assert (=> d!139133 e!720520))

(declare-fun res!842354 () Bool)

(assert (=> d!139133 (=> (not res!842354) (not e!720520))))

(declare-fun lt!573863 () ListLongMap!18955)

(assert (=> d!139133 (= res!842354 (contains!7634 lt!573863 (_1!10548 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(declare-fun lt!573862 () List!28295)

(assert (=> d!139133 (= lt!573863 (ListLongMap!18956 lt!573862))))

(declare-fun lt!573860 () Unit!42093)

(declare-fun lt!573861 () Unit!42093)

(assert (=> d!139133 (= lt!573860 lt!573861)))

(assert (=> d!139133 (= (getValueByKey!664 lt!573862 (_1!10548 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))) (Some!714 (_2!10548 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!139133 (= lt!573861 (lemmaContainsTupThenGetReturnValue!338 lt!573862 (_1!10548 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (_2!10548 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!139133 (= lt!573862 (insertStrictlySorted!452 (toList!9493 lt!573726) (_1!10548 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (_2!10548 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!139133 (= (+!4301 lt!573726 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) lt!573863)))

(declare-fun b!1265279 () Bool)

(declare-fun res!842353 () Bool)

(assert (=> b!1265279 (=> (not res!842353) (not e!720520))))

(assert (=> b!1265279 (= res!842353 (= (getValueByKey!664 (toList!9493 lt!573863) (_1!10548 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))) (Some!714 (_2!10548 (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)))))))

(declare-fun b!1265280 () Bool)

(assert (=> b!1265280 (= e!720520 (contains!7635 (toList!9493 lt!573863) (tuple2!21075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)))))

(assert (= (and d!139133 res!842354) b!1265279))

(assert (= (and b!1265279 res!842353) b!1265280))

(declare-fun m!1166107 () Bool)

(assert (=> d!139133 m!1166107))

(declare-fun m!1166109 () Bool)

(assert (=> d!139133 m!1166109))

(declare-fun m!1166111 () Bool)

(assert (=> d!139133 m!1166111))

(declare-fun m!1166113 () Bool)

(assert (=> d!139133 m!1166113))

(declare-fun m!1166115 () Bool)

(assert (=> b!1265279 m!1166115))

(declare-fun m!1166117 () Bool)

(assert (=> b!1265280 m!1166117))

(assert (=> b!1265092 d!139133))

(declare-fun d!139135 () Bool)

(assert (=> d!139135 (= (getCurrentListMapNoExtraKeys!5896 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5896 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573866 () Unit!42093)

(declare-fun choose!1882 (array!82509 array!82507 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48591 V!48591 V!48591 V!48591 (_ BitVec 32) Int) Unit!42093)

(assert (=> d!139135 (= lt!573866 (choose!1882 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!139135 (validMask!0 mask!1466)))

(assert (=> d!139135 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1186 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573866)))

(declare-fun bs!35770 () Bool)

(assert (= bs!35770 d!139135))

(assert (=> bs!35770 m!1165895))

(assert (=> bs!35770 m!1165893))

(declare-fun m!1166119 () Bool)

(assert (=> bs!35770 m!1166119))

(assert (=> bs!35770 m!1165885))

(assert (=> b!1265095 d!139135))

(declare-fun b!1265306 () Bool)

(declare-fun e!720536 () Bool)

(declare-fun e!720538 () Bool)

(assert (=> b!1265306 (= e!720536 e!720538)))

(assert (=> b!1265306 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40331 _keys!1118)))))

(declare-fun res!842366 () Bool)

(declare-fun lt!573885 () ListLongMap!18955)

(assert (=> b!1265306 (= res!842366 (contains!7634 lt!573885 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1265306 (=> (not res!842366) (not e!720538))))

(declare-fun b!1265307 () Bool)

(declare-fun e!720540 () ListLongMap!18955)

(assert (=> b!1265307 (= e!720540 (ListLongMap!18956 Nil!28292))))

(declare-fun b!1265308 () Bool)

(declare-fun e!720537 () Bool)

(assert (=> b!1265308 (= e!720536 e!720537)))

(declare-fun c!123483 () Bool)

(assert (=> b!1265308 (= c!123483 (bvslt #b00000000000000000000000000000000 (size!40331 _keys!1118)))))

(declare-fun b!1265309 () Bool)

(assert (=> b!1265309 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40331 _keys!1118)))))

(assert (=> b!1265309 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40330 _values!914)))))

(assert (=> b!1265309 (= e!720538 (= (apply!1012 lt!573885 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000)) (get!20345 (select (arr!39793 _values!914) #b00000000000000000000000000000000) (dynLambda!3464 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1265310 () Bool)

(declare-fun e!720539 () ListLongMap!18955)

(declare-fun call!62358 () ListLongMap!18955)

(assert (=> b!1265310 (= e!720539 call!62358)))

(declare-fun b!1265311 () Bool)

(declare-fun e!720535 () Bool)

(assert (=> b!1265311 (= e!720535 (validKeyInArray!0 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1265311 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1265312 () Bool)

(declare-fun res!842365 () Bool)

(declare-fun e!720541 () Bool)

(assert (=> b!1265312 (=> (not res!842365) (not e!720541))))

(assert (=> b!1265312 (= res!842365 (not (contains!7634 lt!573885 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1265313 () Bool)

(declare-fun isEmpty!1049 (ListLongMap!18955) Bool)

(assert (=> b!1265313 (= e!720537 (isEmpty!1049 lt!573885))))

(declare-fun b!1265314 () Bool)

(declare-fun lt!573881 () Unit!42093)

(declare-fun lt!573882 () Unit!42093)

(assert (=> b!1265314 (= lt!573881 lt!573882)))

(declare-fun lt!573883 () (_ BitVec 64))

(declare-fun lt!573886 () (_ BitVec 64))

(declare-fun lt!573884 () V!48591)

(declare-fun lt!573887 () ListLongMap!18955)

(assert (=> b!1265314 (not (contains!7634 (+!4301 lt!573887 (tuple2!21075 lt!573883 lt!573884)) lt!573886))))

(declare-fun addStillNotContains!333 (ListLongMap!18955 (_ BitVec 64) V!48591 (_ BitVec 64)) Unit!42093)

(assert (=> b!1265314 (= lt!573882 (addStillNotContains!333 lt!573887 lt!573883 lt!573884 lt!573886))))

(assert (=> b!1265314 (= lt!573886 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1265314 (= lt!573884 (get!20345 (select (arr!39793 _values!914) #b00000000000000000000000000000000) (dynLambda!3464 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1265314 (= lt!573883 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1265314 (= lt!573887 call!62358)))

(assert (=> b!1265314 (= e!720539 (+!4301 call!62358 (tuple2!21075 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000) (get!20345 (select (arr!39793 _values!914) #b00000000000000000000000000000000) (dynLambda!3464 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1265315 () Bool)

(assert (=> b!1265315 (= e!720541 e!720536)))

(declare-fun c!123481 () Bool)

(assert (=> b!1265315 (= c!123481 e!720535)))

(declare-fun res!842364 () Bool)

(assert (=> b!1265315 (=> (not res!842364) (not e!720535))))

(assert (=> b!1265315 (= res!842364 (bvslt #b00000000000000000000000000000000 (size!40331 _keys!1118)))))

(declare-fun b!1265305 () Bool)

(assert (=> b!1265305 (= e!720537 (= lt!573885 (getCurrentListMapNoExtraKeys!5896 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun d!139137 () Bool)

(assert (=> d!139137 e!720541))

(declare-fun res!842363 () Bool)

(assert (=> d!139137 (=> (not res!842363) (not e!720541))))

(assert (=> d!139137 (= res!842363 (not (contains!7634 lt!573885 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!139137 (= lt!573885 e!720540)))

(declare-fun c!123480 () Bool)

(assert (=> d!139137 (= c!123480 (bvsge #b00000000000000000000000000000000 (size!40331 _keys!1118)))))

(assert (=> d!139137 (validMask!0 mask!1466)))

(assert (=> d!139137 (= (getCurrentListMapNoExtraKeys!5896 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573885)))

(declare-fun b!1265316 () Bool)

(assert (=> b!1265316 (= e!720540 e!720539)))

(declare-fun c!123482 () Bool)

(assert (=> b!1265316 (= c!123482 (validKeyInArray!0 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62355 () Bool)

(assert (=> bm!62355 (= call!62358 (getCurrentListMapNoExtraKeys!5896 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(assert (= (and d!139137 c!123480) b!1265307))

(assert (= (and d!139137 (not c!123480)) b!1265316))

(assert (= (and b!1265316 c!123482) b!1265314))

(assert (= (and b!1265316 (not c!123482)) b!1265310))

(assert (= (or b!1265314 b!1265310) bm!62355))

(assert (= (and d!139137 res!842363) b!1265312))

(assert (= (and b!1265312 res!842365) b!1265315))

(assert (= (and b!1265315 res!842364) b!1265311))

(assert (= (and b!1265315 c!123481) b!1265306))

(assert (= (and b!1265315 (not c!123481)) b!1265308))

(assert (= (and b!1265306 res!842366) b!1265309))

(assert (= (and b!1265308 c!123483) b!1265305))

(assert (= (and b!1265308 (not c!123483)) b!1265313))

(declare-fun b_lambda!22989 () Bool)

(assert (=> (not b_lambda!22989) (not b!1265309)))

(assert (=> b!1265309 t!41810))

(declare-fun b_and!45537 () Bool)

(assert (= b_and!45535 (and (=> t!41810 result!23399) b_and!45537)))

(declare-fun b_lambda!22991 () Bool)

(assert (=> (not b_lambda!22991) (not b!1265314)))

(assert (=> b!1265314 t!41810))

(declare-fun b_and!45539 () Bool)

(assert (= b_and!45537 (and (=> t!41810 result!23399) b_and!45539)))

(assert (=> b!1265309 m!1165981))

(assert (=> b!1265309 m!1165971))

(assert (=> b!1265309 m!1165983))

(assert (=> b!1265309 m!1165981))

(assert (=> b!1265309 m!1165983))

(assert (=> b!1265309 m!1165985))

(assert (=> b!1265309 m!1165971))

(declare-fun m!1166121 () Bool)

(assert (=> b!1265309 m!1166121))

(declare-fun m!1166123 () Bool)

(assert (=> d!139137 m!1166123))

(assert (=> d!139137 m!1165885))

(assert (=> b!1265311 m!1165971))

(assert (=> b!1265311 m!1165971))

(assert (=> b!1265311 m!1165973))

(assert (=> b!1265314 m!1165981))

(declare-fun m!1166125 () Bool)

(assert (=> b!1265314 m!1166125))

(declare-fun m!1166127 () Bool)

(assert (=> b!1265314 m!1166127))

(declare-fun m!1166129 () Bool)

(assert (=> b!1265314 m!1166129))

(assert (=> b!1265314 m!1165971))

(assert (=> b!1265314 m!1166127))

(declare-fun m!1166131 () Bool)

(assert (=> b!1265314 m!1166131))

(assert (=> b!1265314 m!1165983))

(assert (=> b!1265314 m!1165981))

(assert (=> b!1265314 m!1165983))

(assert (=> b!1265314 m!1165985))

(assert (=> b!1265316 m!1165971))

(assert (=> b!1265316 m!1165971))

(assert (=> b!1265316 m!1165973))

(declare-fun m!1166133 () Bool)

(assert (=> b!1265313 m!1166133))

(declare-fun m!1166135 () Bool)

(assert (=> b!1265305 m!1166135))

(assert (=> b!1265306 m!1165971))

(assert (=> b!1265306 m!1165971))

(declare-fun m!1166137 () Bool)

(assert (=> b!1265306 m!1166137))

(assert (=> bm!62355 m!1166135))

(declare-fun m!1166139 () Bool)

(assert (=> b!1265312 m!1166139))

(assert (=> b!1265095 d!139137))

(declare-fun b!1265318 () Bool)

(declare-fun e!720543 () Bool)

(declare-fun e!720545 () Bool)

(assert (=> b!1265318 (= e!720543 e!720545)))

(assert (=> b!1265318 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40331 _keys!1118)))))

(declare-fun res!842370 () Bool)

(declare-fun lt!573892 () ListLongMap!18955)

(assert (=> b!1265318 (= res!842370 (contains!7634 lt!573892 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1265318 (=> (not res!842370) (not e!720545))))

(declare-fun b!1265319 () Bool)

(declare-fun e!720547 () ListLongMap!18955)

(assert (=> b!1265319 (= e!720547 (ListLongMap!18956 Nil!28292))))

(declare-fun b!1265320 () Bool)

(declare-fun e!720544 () Bool)

(assert (=> b!1265320 (= e!720543 e!720544)))

(declare-fun c!123487 () Bool)

(assert (=> b!1265320 (= c!123487 (bvslt #b00000000000000000000000000000000 (size!40331 _keys!1118)))))

(declare-fun b!1265321 () Bool)

(assert (=> b!1265321 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40331 _keys!1118)))))

(assert (=> b!1265321 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40330 _values!914)))))

(assert (=> b!1265321 (= e!720545 (= (apply!1012 lt!573892 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000)) (get!20345 (select (arr!39793 _values!914) #b00000000000000000000000000000000) (dynLambda!3464 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1265322 () Bool)

(declare-fun e!720546 () ListLongMap!18955)

(declare-fun call!62359 () ListLongMap!18955)

(assert (=> b!1265322 (= e!720546 call!62359)))

(declare-fun b!1265323 () Bool)

(declare-fun e!720542 () Bool)

(assert (=> b!1265323 (= e!720542 (validKeyInArray!0 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1265323 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1265324 () Bool)

(declare-fun res!842369 () Bool)

(declare-fun e!720548 () Bool)

(assert (=> b!1265324 (=> (not res!842369) (not e!720548))))

(assert (=> b!1265324 (= res!842369 (not (contains!7634 lt!573892 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1265325 () Bool)

(assert (=> b!1265325 (= e!720544 (isEmpty!1049 lt!573892))))

(declare-fun b!1265326 () Bool)

(declare-fun lt!573888 () Unit!42093)

(declare-fun lt!573889 () Unit!42093)

(assert (=> b!1265326 (= lt!573888 lt!573889)))

(declare-fun lt!573891 () V!48591)

(declare-fun lt!573893 () (_ BitVec 64))

(declare-fun lt!573890 () (_ BitVec 64))

(declare-fun lt!573894 () ListLongMap!18955)

(assert (=> b!1265326 (not (contains!7634 (+!4301 lt!573894 (tuple2!21075 lt!573890 lt!573891)) lt!573893))))

(assert (=> b!1265326 (= lt!573889 (addStillNotContains!333 lt!573894 lt!573890 lt!573891 lt!573893))))

(assert (=> b!1265326 (= lt!573893 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1265326 (= lt!573891 (get!20345 (select (arr!39793 _values!914) #b00000000000000000000000000000000) (dynLambda!3464 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1265326 (= lt!573890 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1265326 (= lt!573894 call!62359)))

(assert (=> b!1265326 (= e!720546 (+!4301 call!62359 (tuple2!21075 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000) (get!20345 (select (arr!39793 _values!914) #b00000000000000000000000000000000) (dynLambda!3464 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1265327 () Bool)

(assert (=> b!1265327 (= e!720548 e!720543)))

(declare-fun c!123485 () Bool)

(assert (=> b!1265327 (= c!123485 e!720542)))

(declare-fun res!842368 () Bool)

(assert (=> b!1265327 (=> (not res!842368) (not e!720542))))

(assert (=> b!1265327 (= res!842368 (bvslt #b00000000000000000000000000000000 (size!40331 _keys!1118)))))

(declare-fun b!1265317 () Bool)

(assert (=> b!1265317 (= e!720544 (= lt!573892 (getCurrentListMapNoExtraKeys!5896 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun d!139139 () Bool)

(assert (=> d!139139 e!720548))

(declare-fun res!842367 () Bool)

(assert (=> d!139139 (=> (not res!842367) (not e!720548))))

(assert (=> d!139139 (= res!842367 (not (contains!7634 lt!573892 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!139139 (= lt!573892 e!720547)))

(declare-fun c!123484 () Bool)

(assert (=> d!139139 (= c!123484 (bvsge #b00000000000000000000000000000000 (size!40331 _keys!1118)))))

(assert (=> d!139139 (validMask!0 mask!1466)))

(assert (=> d!139139 (= (getCurrentListMapNoExtraKeys!5896 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573892)))

(declare-fun b!1265328 () Bool)

(assert (=> b!1265328 (= e!720547 e!720546)))

(declare-fun c!123486 () Bool)

(assert (=> b!1265328 (= c!123486 (validKeyInArray!0 (select (arr!39794 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62356 () Bool)

(assert (=> bm!62356 (= call!62359 (getCurrentListMapNoExtraKeys!5896 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(assert (= (and d!139139 c!123484) b!1265319))

(assert (= (and d!139139 (not c!123484)) b!1265328))

(assert (= (and b!1265328 c!123486) b!1265326))

(assert (= (and b!1265328 (not c!123486)) b!1265322))

(assert (= (or b!1265326 b!1265322) bm!62356))

(assert (= (and d!139139 res!842367) b!1265324))

(assert (= (and b!1265324 res!842369) b!1265327))

(assert (= (and b!1265327 res!842368) b!1265323))

(assert (= (and b!1265327 c!123485) b!1265318))

(assert (= (and b!1265327 (not c!123485)) b!1265320))

(assert (= (and b!1265318 res!842370) b!1265321))

(assert (= (and b!1265320 c!123487) b!1265317))

(assert (= (and b!1265320 (not c!123487)) b!1265325))

(declare-fun b_lambda!22993 () Bool)

(assert (=> (not b_lambda!22993) (not b!1265321)))

(assert (=> b!1265321 t!41810))

(declare-fun b_and!45541 () Bool)

(assert (= b_and!45539 (and (=> t!41810 result!23399) b_and!45541)))

(declare-fun b_lambda!22995 () Bool)

(assert (=> (not b_lambda!22995) (not b!1265326)))

(assert (=> b!1265326 t!41810))

(declare-fun b_and!45543 () Bool)

(assert (= b_and!45541 (and (=> t!41810 result!23399) b_and!45543)))

(assert (=> b!1265321 m!1165981))

(assert (=> b!1265321 m!1165971))

(assert (=> b!1265321 m!1165983))

(assert (=> b!1265321 m!1165981))

(assert (=> b!1265321 m!1165983))

(assert (=> b!1265321 m!1165985))

(assert (=> b!1265321 m!1165971))

(declare-fun m!1166141 () Bool)

(assert (=> b!1265321 m!1166141))

(declare-fun m!1166143 () Bool)

(assert (=> d!139139 m!1166143))

(assert (=> d!139139 m!1165885))

(assert (=> b!1265323 m!1165971))

(assert (=> b!1265323 m!1165971))

(assert (=> b!1265323 m!1165973))

(assert (=> b!1265326 m!1165981))

(declare-fun m!1166145 () Bool)

(assert (=> b!1265326 m!1166145))

(declare-fun m!1166147 () Bool)

(assert (=> b!1265326 m!1166147))

(declare-fun m!1166149 () Bool)

(assert (=> b!1265326 m!1166149))

(assert (=> b!1265326 m!1165971))

(assert (=> b!1265326 m!1166147))

(declare-fun m!1166151 () Bool)

(assert (=> b!1265326 m!1166151))

(assert (=> b!1265326 m!1165983))

(assert (=> b!1265326 m!1165981))

(assert (=> b!1265326 m!1165983))

(assert (=> b!1265326 m!1165985))

(assert (=> b!1265328 m!1165971))

(assert (=> b!1265328 m!1165971))

(assert (=> b!1265328 m!1165973))

(declare-fun m!1166153 () Bool)

(assert (=> b!1265325 m!1166153))

(declare-fun m!1166155 () Bool)

(assert (=> b!1265317 m!1166155))

(assert (=> b!1265318 m!1165971))

(assert (=> b!1265318 m!1165971))

(declare-fun m!1166157 () Bool)

(assert (=> b!1265318 m!1166157))

(assert (=> bm!62356 m!1166155))

(declare-fun m!1166159 () Bool)

(assert (=> b!1265324 m!1166159))

(assert (=> b!1265095 d!139139))

(declare-fun condMapEmpty!50467 () Bool)

(declare-fun mapDefault!50467 () ValueCell!15446)

(assert (=> mapNonEmpty!50458 (= condMapEmpty!50467 (= mapRest!50458 ((as const (Array (_ BitVec 32) ValueCell!15446)) mapDefault!50467)))))

(declare-fun e!720553 () Bool)

(declare-fun mapRes!50467 () Bool)

(assert (=> mapNonEmpty!50458 (= tp!96109 (and e!720553 mapRes!50467))))

(declare-fun b!1265335 () Bool)

(declare-fun e!720554 () Bool)

(assert (=> b!1265335 (= e!720554 tp_is_empty!32419)))

(declare-fun mapNonEmpty!50467 () Bool)

(declare-fun tp!96125 () Bool)

(assert (=> mapNonEmpty!50467 (= mapRes!50467 (and tp!96125 e!720554))))

(declare-fun mapRest!50467 () (Array (_ BitVec 32) ValueCell!15446))

(declare-fun mapKey!50467 () (_ BitVec 32))

(declare-fun mapValue!50467 () ValueCell!15446)

(assert (=> mapNonEmpty!50467 (= mapRest!50458 (store mapRest!50467 mapKey!50467 mapValue!50467))))

(declare-fun mapIsEmpty!50467 () Bool)

(assert (=> mapIsEmpty!50467 mapRes!50467))

(declare-fun b!1265336 () Bool)

(assert (=> b!1265336 (= e!720553 tp_is_empty!32419)))

(assert (= (and mapNonEmpty!50458 condMapEmpty!50467) mapIsEmpty!50467))

(assert (= (and mapNonEmpty!50458 (not condMapEmpty!50467)) mapNonEmpty!50467))

(assert (= (and mapNonEmpty!50467 ((_ is ValueCellFull!15446) mapValue!50467)) b!1265335))

(assert (= (and mapNonEmpty!50458 ((_ is ValueCellFull!15446) mapDefault!50467)) b!1265336))

(declare-fun m!1166161 () Bool)

(assert (=> mapNonEmpty!50467 m!1166161))

(declare-fun b_lambda!22997 () Bool)

(assert (= b_lambda!22995 (or (and start!106366 b_free!27517) b_lambda!22997)))

(declare-fun b_lambda!22999 () Bool)

(assert (= b_lambda!22993 (or (and start!106366 b_free!27517) b_lambda!22999)))

(declare-fun b_lambda!23001 () Bool)

(assert (= b_lambda!22991 (or (and start!106366 b_free!27517) b_lambda!23001)))

(declare-fun b_lambda!23003 () Bool)

(assert (= b_lambda!22987 (or (and start!106366 b_free!27517) b_lambda!23003)))

(declare-fun b_lambda!23005 () Bool)

(assert (= b_lambda!22989 (or (and start!106366 b_free!27517) b_lambda!23005)))

(declare-fun b_lambda!23007 () Bool)

(assert (= b_lambda!22985 (or (and start!106366 b_free!27517) b_lambda!23007)))

(check-sat (not b!1265317) (not d!139139) (not bm!62347) (not b!1265328) (not b!1265255) (not bm!62342) (not b!1265230) (not bm!62350) (not b!1265313) (not b!1265280) (not bm!62356) (not mapNonEmpty!50467) (not b!1265266) (not b!1265309) (not b!1265211) (not b!1265305) (not b!1265229) (not b!1265272) (not b!1265253) (not b!1265325) (not b!1265210) (not bm!62339) (not bm!62337) (not b!1265314) (not bm!62355) (not d!139133) (not b!1265228) (not b_lambda!23001) (not b!1265311) (not d!139115) (not bm!62335) (not b!1265268) (not d!139131) (not b!1265254) (not b_lambda!22997) tp_is_empty!32419 (not b_lambda!23007) (not bm!62345) (not b!1265275) (not d!139137) (not b!1265279) (not b_lambda!23005) (not bm!62348) (not b!1265208) (not b!1265240) (not d!139117) (not d!139135) (not b!1265214) (not b!1265318) (not b!1265316) b_and!45543 (not b!1265201) (not b_next!27517) (not b!1265306) (not b!1265227) (not b!1265239) (not b!1265204) (not bm!62334) (not b_lambda!22999) (not b!1265212) (not b!1265270) (not d!139119) (not b!1265217) (not b!1265326) (not b!1265321) (not b_lambda!23003) (not b!1265269) (not b!1265262) (not bm!62352) (not b!1265324) (not b!1265259) (not b!1265312) (not b!1265323))
(check-sat b_and!45543 (not b_next!27517))
