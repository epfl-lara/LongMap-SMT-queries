; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106120 () Bool)

(assert start!106120)

(declare-fun b_free!27513 () Bool)

(declare-fun b_next!27513 () Bool)

(assert (=> start!106120 (= b_free!27513 (not b_next!27513))))

(declare-fun tp!96095 () Bool)

(declare-fun b_and!45509 () Bool)

(assert (=> start!106120 (= tp!96095 b_and!45509)))

(declare-fun b!1263554 () Bool)

(declare-fun e!719389 () Bool)

(declare-fun tp_is_empty!32415 () Bool)

(assert (=> b!1263554 (= e!719389 tp_is_empty!32415)))

(declare-fun res!841620 () Bool)

(declare-fun e!719391 () Bool)

(assert (=> start!106120 (=> (not res!841620) (not e!719391))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106120 (= res!841620 (validMask!0 mask!1466))))

(assert (=> start!106120 e!719391))

(assert (=> start!106120 true))

(assert (=> start!106120 tp!96095))

(assert (=> start!106120 tp_is_empty!32415))

(declare-datatypes ((array!82454 0))(
  ( (array!82455 (arr!39772 (Array (_ BitVec 32) (_ BitVec 64))) (size!40308 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82454)

(declare-fun array_inv!30269 (array!82454) Bool)

(assert (=> start!106120 (array_inv!30269 _keys!1118)))

(declare-datatypes ((V!48585 0))(
  ( (V!48586 (val!16270 Int)) )
))
(declare-datatypes ((ValueCell!15444 0))(
  ( (ValueCellFull!15444 (v!18981 V!48585)) (EmptyCell!15444) )
))
(declare-datatypes ((array!82456 0))(
  ( (array!82457 (arr!39773 (Array (_ BitVec 32) ValueCell!15444)) (size!40309 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82456)

(declare-fun e!719394 () Bool)

(declare-fun array_inv!30270 (array!82456) Bool)

(assert (=> start!106120 (and (array_inv!30270 _values!914) e!719394)))

(declare-fun mapIsEmpty!50449 () Bool)

(declare-fun mapRes!50449 () Bool)

(assert (=> mapIsEmpty!50449 mapRes!50449))

(declare-fun b!1263555 () Bool)

(declare-fun e!719393 () Bool)

(assert (=> b!1263555 (= e!719391 (not e!719393))))

(declare-fun res!841619 () Bool)

(assert (=> b!1263555 (=> res!841619 e!719393)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1263555 (= res!841619 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!21066 0))(
  ( (tuple2!21067 (_1!10544 (_ BitVec 64)) (_2!10544 V!48585)) )
))
(declare-datatypes ((List!28256 0))(
  ( (Nil!28253) (Cons!28252 (h!29461 tuple2!21066) (t!41771 List!28256)) )
))
(declare-datatypes ((ListLongMap!18939 0))(
  ( (ListLongMap!18940 (toList!9485 List!28256)) )
))
(declare-fun lt!573078 () ListLongMap!18939)

(declare-fun lt!573079 () ListLongMap!18939)

(assert (=> b!1263555 (= lt!573078 lt!573079)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48585)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48585)

(declare-fun minValueBefore!43 () V!48585)

(declare-datatypes ((Unit!42120 0))(
  ( (Unit!42121) )
))
(declare-fun lt!573076 () Unit!42120)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1190 (array!82454 array!82456 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48585 V!48585 V!48585 V!48585 (_ BitVec 32) Int) Unit!42120)

(assert (=> b!1263555 (= lt!573076 (lemmaNoChangeToArrayThenSameMapNoExtras!1190 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5848 (array!82454 array!82456 (_ BitVec 32) (_ BitVec 32) V!48585 V!48585 (_ BitVec 32) Int) ListLongMap!18939)

(assert (=> b!1263555 (= lt!573079 (getCurrentListMapNoExtraKeys!5848 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1263555 (= lt!573078 (getCurrentListMapNoExtraKeys!5848 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263556 () Bool)

(assert (=> b!1263556 (= e!719394 (and e!719389 mapRes!50449))))

(declare-fun condMapEmpty!50449 () Bool)

(declare-fun mapDefault!50449 () ValueCell!15444)

(assert (=> b!1263556 (= condMapEmpty!50449 (= (arr!39773 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15444)) mapDefault!50449)))))

(declare-fun b!1263557 () Bool)

(declare-fun e!719392 () Bool)

(assert (=> b!1263557 (= e!719392 tp_is_empty!32415)))

(declare-fun b!1263558 () Bool)

(declare-fun getCurrentListMap!4652 (array!82454 array!82456 (_ BitVec 32) (_ BitVec 32) V!48585 V!48585 (_ BitVec 32) Int) ListLongMap!18939)

(declare-fun +!4255 (ListLongMap!18939 tuple2!21066) ListLongMap!18939)

(assert (=> b!1263558 (= e!719393 (= (getCurrentListMap!4652 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (+!4255 (+!4255 lt!573078 (tuple2!21067 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (tuple2!21067 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!573077 () ListLongMap!18939)

(assert (=> b!1263558 (= lt!573077 (getCurrentListMap!4652 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263559 () Bool)

(declare-fun res!841616 () Bool)

(assert (=> b!1263559 (=> (not res!841616) (not e!719391))))

(declare-datatypes ((List!28257 0))(
  ( (Nil!28254) (Cons!28253 (h!29462 (_ BitVec 64)) (t!41772 List!28257)) )
))
(declare-fun arrayNoDuplicates!0 (array!82454 (_ BitVec 32) List!28257) Bool)

(assert (=> b!1263559 (= res!841616 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28254))))

(declare-fun mapNonEmpty!50449 () Bool)

(declare-fun tp!96094 () Bool)

(assert (=> mapNonEmpty!50449 (= mapRes!50449 (and tp!96094 e!719392))))

(declare-fun mapRest!50449 () (Array (_ BitVec 32) ValueCell!15444))

(declare-fun mapKey!50449 () (_ BitVec 32))

(declare-fun mapValue!50449 () ValueCell!15444)

(assert (=> mapNonEmpty!50449 (= (arr!39773 _values!914) (store mapRest!50449 mapKey!50449 mapValue!50449))))

(declare-fun b!1263560 () Bool)

(declare-fun res!841617 () Bool)

(assert (=> b!1263560 (=> (not res!841617) (not e!719391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82454 (_ BitVec 32)) Bool)

(assert (=> b!1263560 (= res!841617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1263561 () Bool)

(declare-fun res!841618 () Bool)

(assert (=> b!1263561 (=> (not res!841618) (not e!719391))))

(assert (=> b!1263561 (= res!841618 (and (= (size!40309 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40308 _keys!1118) (size!40309 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!106120 res!841620) b!1263561))

(assert (= (and b!1263561 res!841618) b!1263560))

(assert (= (and b!1263560 res!841617) b!1263559))

(assert (= (and b!1263559 res!841616) b!1263555))

(assert (= (and b!1263555 (not res!841619)) b!1263558))

(assert (= (and b!1263556 condMapEmpty!50449) mapIsEmpty!50449))

(assert (= (and b!1263556 (not condMapEmpty!50449)) mapNonEmpty!50449))

(get-info :version)

(assert (= (and mapNonEmpty!50449 ((_ is ValueCellFull!15444) mapValue!50449)) b!1263557))

(assert (= (and b!1263556 ((_ is ValueCellFull!15444) mapDefault!50449)) b!1263554))

(assert (= start!106120 b!1263556))

(declare-fun m!1164039 () Bool)

(assert (=> b!1263555 m!1164039))

(declare-fun m!1164041 () Bool)

(assert (=> b!1263555 m!1164041))

(declare-fun m!1164043 () Bool)

(assert (=> b!1263555 m!1164043))

(declare-fun m!1164045 () Bool)

(assert (=> b!1263558 m!1164045))

(declare-fun m!1164047 () Bool)

(assert (=> b!1263558 m!1164047))

(assert (=> b!1263558 m!1164047))

(declare-fun m!1164049 () Bool)

(assert (=> b!1263558 m!1164049))

(declare-fun m!1164051 () Bool)

(assert (=> b!1263558 m!1164051))

(declare-fun m!1164053 () Bool)

(assert (=> start!106120 m!1164053))

(declare-fun m!1164055 () Bool)

(assert (=> start!106120 m!1164055))

(declare-fun m!1164057 () Bool)

(assert (=> start!106120 m!1164057))

(declare-fun m!1164059 () Bool)

(assert (=> b!1263559 m!1164059))

(declare-fun m!1164061 () Bool)

(assert (=> mapNonEmpty!50449 m!1164061))

(declare-fun m!1164063 () Bool)

(assert (=> b!1263560 m!1164063))

(check-sat (not b!1263558) b_and!45509 (not b!1263559) tp_is_empty!32415 (not b!1263560) (not start!106120) (not b_next!27513) (not b!1263555) (not mapNonEmpty!50449))
(check-sat b_and!45509 (not b_next!27513))
(get-model)

(declare-fun bm!62230 () Bool)

(declare-fun call!62239 () Bool)

(declare-fun lt!573157 () ListLongMap!18939)

(declare-fun contains!7606 (ListLongMap!18939 (_ BitVec 64)) Bool)

(assert (=> bm!62230 (= call!62239 (contains!7606 lt!573157 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263628 () Bool)

(declare-fun e!719443 () Bool)

(assert (=> b!1263628 (= e!719443 (not call!62239))))

(declare-fun b!1263629 () Bool)

(declare-fun e!719448 () Bool)

(declare-fun apply!1002 (ListLongMap!18939 (_ BitVec 64)) V!48585)

(assert (=> b!1263629 (= e!719448 (= (apply!1002 lt!573157 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1263630 () Bool)

(declare-fun c!123010 () Bool)

(assert (=> b!1263630 (= c!123010 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!719449 () ListLongMap!18939)

(declare-fun e!719446 () ListLongMap!18939)

(assert (=> b!1263630 (= e!719449 e!719446)))

(declare-fun d!138641 () Bool)

(declare-fun e!719442 () Bool)

(assert (=> d!138641 e!719442))

(declare-fun res!841662 () Bool)

(assert (=> d!138641 (=> (not res!841662) (not e!719442))))

(assert (=> d!138641 (= res!841662 (or (bvsge #b00000000000000000000000000000000 (size!40308 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40308 _keys!1118)))))))

(declare-fun lt!573147 () ListLongMap!18939)

(assert (=> d!138641 (= lt!573157 lt!573147)))

(declare-fun lt!573151 () Unit!42120)

(declare-fun e!719444 () Unit!42120)

(assert (=> d!138641 (= lt!573151 e!719444)))

(declare-fun c!123013 () Bool)

(declare-fun e!719447 () Bool)

(assert (=> d!138641 (= c!123013 e!719447)))

(declare-fun res!841655 () Bool)

(assert (=> d!138641 (=> (not res!841655) (not e!719447))))

(assert (=> d!138641 (= res!841655 (bvslt #b00000000000000000000000000000000 (size!40308 _keys!1118)))))

(declare-fun e!719440 () ListLongMap!18939)

(assert (=> d!138641 (= lt!573147 e!719440)))

(declare-fun c!123012 () Bool)

(assert (=> d!138641 (= c!123012 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138641 (validMask!0 mask!1466)))

(assert (=> d!138641 (= (getCurrentListMap!4652 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573157)))

(declare-fun b!1263631 () Bool)

(declare-fun e!719450 () Bool)

(assert (=> b!1263631 (= e!719442 e!719450)))

(declare-fun c!123008 () Bool)

(assert (=> b!1263631 (= c!123008 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263632 () Bool)

(declare-fun call!62235 () ListLongMap!18939)

(assert (=> b!1263632 (= e!719446 call!62235)))

(declare-fun b!1263633 () Bool)

(declare-fun lt!573153 () Unit!42120)

(assert (=> b!1263633 (= e!719444 lt!573153)))

(declare-fun lt!573140 () ListLongMap!18939)

(assert (=> b!1263633 (= lt!573140 (getCurrentListMapNoExtraKeys!5848 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573156 () (_ BitVec 64))

(assert (=> b!1263633 (= lt!573156 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573139 () (_ BitVec 64))

(assert (=> b!1263633 (= lt!573139 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573152 () Unit!42120)

(declare-fun addStillContains!1092 (ListLongMap!18939 (_ BitVec 64) V!48585 (_ BitVec 64)) Unit!42120)

(assert (=> b!1263633 (= lt!573152 (addStillContains!1092 lt!573140 lt!573156 zeroValue!871 lt!573139))))

(assert (=> b!1263633 (contains!7606 (+!4255 lt!573140 (tuple2!21067 lt!573156 zeroValue!871)) lt!573139)))

(declare-fun lt!573154 () Unit!42120)

(assert (=> b!1263633 (= lt!573154 lt!573152)))

(declare-fun lt!573136 () ListLongMap!18939)

(assert (=> b!1263633 (= lt!573136 (getCurrentListMapNoExtraKeys!5848 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573142 () (_ BitVec 64))

(assert (=> b!1263633 (= lt!573142 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573149 () (_ BitVec 64))

(assert (=> b!1263633 (= lt!573149 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573144 () Unit!42120)

(declare-fun addApplyDifferent!546 (ListLongMap!18939 (_ BitVec 64) V!48585 (_ BitVec 64)) Unit!42120)

(assert (=> b!1263633 (= lt!573144 (addApplyDifferent!546 lt!573136 lt!573142 minValueBefore!43 lt!573149))))

(assert (=> b!1263633 (= (apply!1002 (+!4255 lt!573136 (tuple2!21067 lt!573142 minValueBefore!43)) lt!573149) (apply!1002 lt!573136 lt!573149))))

(declare-fun lt!573138 () Unit!42120)

(assert (=> b!1263633 (= lt!573138 lt!573144)))

(declare-fun lt!573148 () ListLongMap!18939)

(assert (=> b!1263633 (= lt!573148 (getCurrentListMapNoExtraKeys!5848 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573150 () (_ BitVec 64))

(assert (=> b!1263633 (= lt!573150 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573146 () (_ BitVec 64))

(assert (=> b!1263633 (= lt!573146 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573141 () Unit!42120)

(assert (=> b!1263633 (= lt!573141 (addApplyDifferent!546 lt!573148 lt!573150 zeroValue!871 lt!573146))))

(assert (=> b!1263633 (= (apply!1002 (+!4255 lt!573148 (tuple2!21067 lt!573150 zeroValue!871)) lt!573146) (apply!1002 lt!573148 lt!573146))))

(declare-fun lt!573145 () Unit!42120)

(assert (=> b!1263633 (= lt!573145 lt!573141)))

(declare-fun lt!573137 () ListLongMap!18939)

(assert (=> b!1263633 (= lt!573137 (getCurrentListMapNoExtraKeys!5848 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573143 () (_ BitVec 64))

(assert (=> b!1263633 (= lt!573143 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573155 () (_ BitVec 64))

(assert (=> b!1263633 (= lt!573155 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263633 (= lt!573153 (addApplyDifferent!546 lt!573137 lt!573143 minValueBefore!43 lt!573155))))

(assert (=> b!1263633 (= (apply!1002 (+!4255 lt!573137 (tuple2!21067 lt!573143 minValueBefore!43)) lt!573155) (apply!1002 lt!573137 lt!573155))))

(declare-fun b!1263634 () Bool)

(declare-fun call!62233 () ListLongMap!18939)

(assert (=> b!1263634 (= e!719449 call!62233)))

(declare-fun b!1263635 () Bool)

(declare-fun call!62236 () Bool)

(assert (=> b!1263635 (= e!719450 (not call!62236))))

(declare-fun b!1263636 () Bool)

(declare-fun e!719439 () Bool)

(assert (=> b!1263636 (= e!719439 (= (apply!1002 lt!573157 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1263637 () Bool)

(assert (=> b!1263637 (= e!719440 e!719449)))

(declare-fun c!123011 () Bool)

(assert (=> b!1263637 (= c!123011 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263638 () Bool)

(declare-fun Unit!42122 () Unit!42120)

(assert (=> b!1263638 (= e!719444 Unit!42122)))

(declare-fun b!1263639 () Bool)

(assert (=> b!1263639 (= e!719450 e!719448)))

(declare-fun res!841661 () Bool)

(assert (=> b!1263639 (= res!841661 call!62236)))

(assert (=> b!1263639 (=> (not res!841661) (not e!719448))))

(declare-fun call!62237 () ListLongMap!18939)

(declare-fun bm!62231 () Bool)

(declare-fun call!62234 () ListLongMap!18939)

(declare-fun call!62238 () ListLongMap!18939)

(assert (=> bm!62231 (= call!62237 (+!4255 (ite c!123012 call!62234 (ite c!123011 call!62238 call!62235)) (ite (or c!123012 c!123011) (tuple2!21067 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21067 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun bm!62232 () Bool)

(assert (=> bm!62232 (= call!62236 (contains!7606 lt!573157 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62233 () Bool)

(assert (=> bm!62233 (= call!62234 (getCurrentListMapNoExtraKeys!5848 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263640 () Bool)

(declare-fun res!841657 () Bool)

(assert (=> b!1263640 (=> (not res!841657) (not e!719442))))

(assert (=> b!1263640 (= res!841657 e!719443)))

(declare-fun c!123009 () Bool)

(assert (=> b!1263640 (= c!123009 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1263641 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1263641 (= e!719447 (validKeyInArray!0 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263642 () Bool)

(declare-fun res!841656 () Bool)

(assert (=> b!1263642 (=> (not res!841656) (not e!719442))))

(declare-fun e!719441 () Bool)

(assert (=> b!1263642 (= res!841656 e!719441)))

(declare-fun res!841658 () Bool)

(assert (=> b!1263642 (=> res!841658 e!719441)))

(declare-fun e!719451 () Bool)

(assert (=> b!1263642 (= res!841658 (not e!719451))))

(declare-fun res!841660 () Bool)

(assert (=> b!1263642 (=> (not res!841660) (not e!719451))))

(assert (=> b!1263642 (= res!841660 (bvslt #b00000000000000000000000000000000 (size!40308 _keys!1118)))))

(declare-fun bm!62234 () Bool)

(assert (=> bm!62234 (= call!62235 call!62238)))

(declare-fun bm!62235 () Bool)

(assert (=> bm!62235 (= call!62238 call!62234)))

(declare-fun b!1263643 () Bool)

(assert (=> b!1263643 (= e!719443 e!719439)))

(declare-fun res!841654 () Bool)

(assert (=> b!1263643 (= res!841654 call!62239)))

(assert (=> b!1263643 (=> (not res!841654) (not e!719439))))

(declare-fun b!1263644 () Bool)

(assert (=> b!1263644 (= e!719440 (+!4255 call!62237 (tuple2!21067 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun bm!62236 () Bool)

(assert (=> bm!62236 (= call!62233 call!62237)))

(declare-fun b!1263645 () Bool)

(assert (=> b!1263645 (= e!719446 call!62233)))

(declare-fun b!1263646 () Bool)

(declare-fun e!719445 () Bool)

(assert (=> b!1263646 (= e!719441 e!719445)))

(declare-fun res!841659 () Bool)

(assert (=> b!1263646 (=> (not res!841659) (not e!719445))))

(assert (=> b!1263646 (= res!841659 (contains!7606 lt!573157 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263646 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40308 _keys!1118)))))

(declare-fun b!1263647 () Bool)

(declare-fun get!20291 (ValueCell!15444 V!48585) V!48585)

(declare-fun dynLambda!3400 (Int (_ BitVec 64)) V!48585)

(assert (=> b!1263647 (= e!719445 (= (apply!1002 lt!573157 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000)) (get!20291 (select (arr!39773 _values!914) #b00000000000000000000000000000000) (dynLambda!3400 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1263647 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40309 _values!914)))))

(assert (=> b!1263647 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40308 _keys!1118)))))

(declare-fun b!1263648 () Bool)

(assert (=> b!1263648 (= e!719451 (validKeyInArray!0 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138641 c!123012) b!1263644))

(assert (= (and d!138641 (not c!123012)) b!1263637))

(assert (= (and b!1263637 c!123011) b!1263634))

(assert (= (and b!1263637 (not c!123011)) b!1263630))

(assert (= (and b!1263630 c!123010) b!1263645))

(assert (= (and b!1263630 (not c!123010)) b!1263632))

(assert (= (or b!1263645 b!1263632) bm!62234))

(assert (= (or b!1263634 bm!62234) bm!62235))

(assert (= (or b!1263634 b!1263645) bm!62236))

(assert (= (or b!1263644 bm!62235) bm!62233))

(assert (= (or b!1263644 bm!62236) bm!62231))

(assert (= (and d!138641 res!841655) b!1263641))

(assert (= (and d!138641 c!123013) b!1263633))

(assert (= (and d!138641 (not c!123013)) b!1263638))

(assert (= (and d!138641 res!841662) b!1263642))

(assert (= (and b!1263642 res!841660) b!1263648))

(assert (= (and b!1263642 (not res!841658)) b!1263646))

(assert (= (and b!1263646 res!841659) b!1263647))

(assert (= (and b!1263642 res!841656) b!1263640))

(assert (= (and b!1263640 c!123009) b!1263643))

(assert (= (and b!1263640 (not c!123009)) b!1263628))

(assert (= (and b!1263643 res!841654) b!1263636))

(assert (= (or b!1263643 b!1263628) bm!62230))

(assert (= (and b!1263640 res!841657) b!1263631))

(assert (= (and b!1263631 c!123008) b!1263639))

(assert (= (and b!1263631 (not c!123008)) b!1263635))

(assert (= (and b!1263639 res!841661) b!1263629))

(assert (= (or b!1263639 b!1263635) bm!62232))

(declare-fun b_lambda!22967 () Bool)

(assert (=> (not b_lambda!22967) (not b!1263647)))

(declare-fun t!41775 () Bool)

(declare-fun tb!11331 () Bool)

(assert (=> (and start!106120 (= defaultEntry!922 defaultEntry!922) t!41775) tb!11331))

(declare-fun result!23401 () Bool)

(assert (=> tb!11331 (= result!23401 tp_is_empty!32415)))

(assert (=> b!1263647 t!41775))

(declare-fun b_and!45513 () Bool)

(assert (= b_and!45509 (and (=> t!41775 result!23401) b_and!45513)))

(assert (=> d!138641 m!1164053))

(declare-fun m!1164091 () Bool)

(assert (=> b!1263644 m!1164091))

(declare-fun m!1164093 () Bool)

(assert (=> b!1263648 m!1164093))

(assert (=> b!1263648 m!1164093))

(declare-fun m!1164095 () Bool)

(assert (=> b!1263648 m!1164095))

(assert (=> b!1263633 m!1164093))

(declare-fun m!1164097 () Bool)

(assert (=> b!1263633 m!1164097))

(declare-fun m!1164099 () Bool)

(assert (=> b!1263633 m!1164099))

(assert (=> b!1263633 m!1164097))

(declare-fun m!1164101 () Bool)

(assert (=> b!1263633 m!1164101))

(declare-fun m!1164103 () Bool)

(assert (=> b!1263633 m!1164103))

(declare-fun m!1164105 () Bool)

(assert (=> b!1263633 m!1164105))

(assert (=> b!1263633 m!1164043))

(declare-fun m!1164107 () Bool)

(assert (=> b!1263633 m!1164107))

(declare-fun m!1164109 () Bool)

(assert (=> b!1263633 m!1164109))

(declare-fun m!1164111 () Bool)

(assert (=> b!1263633 m!1164111))

(declare-fun m!1164113 () Bool)

(assert (=> b!1263633 m!1164113))

(assert (=> b!1263633 m!1164109))

(declare-fun m!1164115 () Bool)

(assert (=> b!1263633 m!1164115))

(declare-fun m!1164117 () Bool)

(assert (=> b!1263633 m!1164117))

(declare-fun m!1164119 () Bool)

(assert (=> b!1263633 m!1164119))

(assert (=> b!1263633 m!1164099))

(declare-fun m!1164121 () Bool)

(assert (=> b!1263633 m!1164121))

(declare-fun m!1164123 () Bool)

(assert (=> b!1263633 m!1164123))

(assert (=> b!1263633 m!1164117))

(declare-fun m!1164125 () Bool)

(assert (=> b!1263633 m!1164125))

(assert (=> b!1263646 m!1164093))

(assert (=> b!1263646 m!1164093))

(declare-fun m!1164127 () Bool)

(assert (=> b!1263646 m!1164127))

(assert (=> b!1263647 m!1164093))

(assert (=> b!1263647 m!1164093))

(declare-fun m!1164129 () Bool)

(assert (=> b!1263647 m!1164129))

(declare-fun m!1164131 () Bool)

(assert (=> b!1263647 m!1164131))

(declare-fun m!1164133 () Bool)

(assert (=> b!1263647 m!1164133))

(declare-fun m!1164135 () Bool)

(assert (=> b!1263647 m!1164135))

(assert (=> b!1263647 m!1164133))

(assert (=> b!1263647 m!1164131))

(assert (=> b!1263641 m!1164093))

(assert (=> b!1263641 m!1164093))

(assert (=> b!1263641 m!1164095))

(assert (=> bm!62233 m!1164043))

(declare-fun m!1164137 () Bool)

(assert (=> bm!62232 m!1164137))

(declare-fun m!1164139 () Bool)

(assert (=> b!1263636 m!1164139))

(declare-fun m!1164141 () Bool)

(assert (=> bm!62230 m!1164141))

(declare-fun m!1164143 () Bool)

(assert (=> b!1263629 m!1164143))

(declare-fun m!1164145 () Bool)

(assert (=> bm!62231 m!1164145))

(assert (=> b!1263558 d!138641))

(declare-fun d!138643 () Bool)

(declare-fun e!719454 () Bool)

(assert (=> d!138643 e!719454))

(declare-fun res!841667 () Bool)

(assert (=> d!138643 (=> (not res!841667) (not e!719454))))

(declare-fun lt!573166 () ListLongMap!18939)

(assert (=> d!138643 (= res!841667 (contains!7606 lt!573166 (_1!10544 (tuple2!21067 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!573167 () List!28256)

(assert (=> d!138643 (= lt!573166 (ListLongMap!18940 lt!573167))))

(declare-fun lt!573169 () Unit!42120)

(declare-fun lt!573168 () Unit!42120)

(assert (=> d!138643 (= lt!573169 lt!573168)))

(declare-datatypes ((Option!718 0))(
  ( (Some!717 (v!18983 V!48585)) (None!716) )
))
(declare-fun getValueByKey!667 (List!28256 (_ BitVec 64)) Option!718)

(assert (=> d!138643 (= (getValueByKey!667 lt!573167 (_1!10544 (tuple2!21067 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!717 (_2!10544 (tuple2!21067 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lemmaContainsTupThenGetReturnValue!336 (List!28256 (_ BitVec 64) V!48585) Unit!42120)

(assert (=> d!138643 (= lt!573168 (lemmaContainsTupThenGetReturnValue!336 lt!573167 (_1!10544 (tuple2!21067 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10544 (tuple2!21067 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun insertStrictlySorted!450 (List!28256 (_ BitVec 64) V!48585) List!28256)

(assert (=> d!138643 (= lt!573167 (insertStrictlySorted!450 (toList!9485 (+!4255 lt!573078 (tuple2!21067 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))) (_1!10544 (tuple2!21067 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10544 (tuple2!21067 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138643 (= (+!4255 (+!4255 lt!573078 (tuple2!21067 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (tuple2!21067 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!573166)))

(declare-fun b!1263655 () Bool)

(declare-fun res!841668 () Bool)

(assert (=> b!1263655 (=> (not res!841668) (not e!719454))))

(assert (=> b!1263655 (= res!841668 (= (getValueByKey!667 (toList!9485 lt!573166) (_1!10544 (tuple2!21067 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!717 (_2!10544 (tuple2!21067 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1263656 () Bool)

(declare-fun contains!7607 (List!28256 tuple2!21066) Bool)

(assert (=> b!1263656 (= e!719454 (contains!7607 (toList!9485 lt!573166) (tuple2!21067 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!138643 res!841667) b!1263655))

(assert (= (and b!1263655 res!841668) b!1263656))

(declare-fun m!1164147 () Bool)

(assert (=> d!138643 m!1164147))

(declare-fun m!1164149 () Bool)

(assert (=> d!138643 m!1164149))

(declare-fun m!1164151 () Bool)

(assert (=> d!138643 m!1164151))

(declare-fun m!1164153 () Bool)

(assert (=> d!138643 m!1164153))

(declare-fun m!1164155 () Bool)

(assert (=> b!1263655 m!1164155))

(declare-fun m!1164157 () Bool)

(assert (=> b!1263656 m!1164157))

(assert (=> b!1263558 d!138643))

(declare-fun d!138645 () Bool)

(declare-fun e!719455 () Bool)

(assert (=> d!138645 e!719455))

(declare-fun res!841669 () Bool)

(assert (=> d!138645 (=> (not res!841669) (not e!719455))))

(declare-fun lt!573170 () ListLongMap!18939)

(assert (=> d!138645 (= res!841669 (contains!7606 lt!573170 (_1!10544 (tuple2!21067 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(declare-fun lt!573171 () List!28256)

(assert (=> d!138645 (= lt!573170 (ListLongMap!18940 lt!573171))))

(declare-fun lt!573173 () Unit!42120)

(declare-fun lt!573172 () Unit!42120)

(assert (=> d!138645 (= lt!573173 lt!573172)))

(assert (=> d!138645 (= (getValueByKey!667 lt!573171 (_1!10544 (tuple2!21067 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))) (Some!717 (_2!10544 (tuple2!21067 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!138645 (= lt!573172 (lemmaContainsTupThenGetReturnValue!336 lt!573171 (_1!10544 (tuple2!21067 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (_2!10544 (tuple2!21067 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!138645 (= lt!573171 (insertStrictlySorted!450 (toList!9485 lt!573078) (_1!10544 (tuple2!21067 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (_2!10544 (tuple2!21067 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!138645 (= (+!4255 lt!573078 (tuple2!21067 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) lt!573170)))

(declare-fun b!1263657 () Bool)

(declare-fun res!841670 () Bool)

(assert (=> b!1263657 (=> (not res!841670) (not e!719455))))

(assert (=> b!1263657 (= res!841670 (= (getValueByKey!667 (toList!9485 lt!573170) (_1!10544 (tuple2!21067 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))) (Some!717 (_2!10544 (tuple2!21067 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)))))))

(declare-fun b!1263658 () Bool)

(assert (=> b!1263658 (= e!719455 (contains!7607 (toList!9485 lt!573170) (tuple2!21067 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)))))

(assert (= (and d!138645 res!841669) b!1263657))

(assert (= (and b!1263657 res!841670) b!1263658))

(declare-fun m!1164159 () Bool)

(assert (=> d!138645 m!1164159))

(declare-fun m!1164161 () Bool)

(assert (=> d!138645 m!1164161))

(declare-fun m!1164163 () Bool)

(assert (=> d!138645 m!1164163))

(declare-fun m!1164165 () Bool)

(assert (=> d!138645 m!1164165))

(declare-fun m!1164167 () Bool)

(assert (=> b!1263657 m!1164167))

(declare-fun m!1164169 () Bool)

(assert (=> b!1263658 m!1164169))

(assert (=> b!1263558 d!138645))

(declare-fun bm!62237 () Bool)

(declare-fun call!62246 () Bool)

(declare-fun lt!573195 () ListLongMap!18939)

(assert (=> bm!62237 (= call!62246 (contains!7606 lt!573195 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263659 () Bool)

(declare-fun e!719460 () Bool)

(assert (=> b!1263659 (= e!719460 (not call!62246))))

(declare-fun b!1263660 () Bool)

(declare-fun e!719465 () Bool)

(assert (=> b!1263660 (= e!719465 (= (apply!1002 lt!573195 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun b!1263661 () Bool)

(declare-fun c!123016 () Bool)

(assert (=> b!1263661 (= c!123016 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!719466 () ListLongMap!18939)

(declare-fun e!719463 () ListLongMap!18939)

(assert (=> b!1263661 (= e!719466 e!719463)))

(declare-fun d!138647 () Bool)

(declare-fun e!719459 () Bool)

(assert (=> d!138647 e!719459))

(declare-fun res!841679 () Bool)

(assert (=> d!138647 (=> (not res!841679) (not e!719459))))

(assert (=> d!138647 (= res!841679 (or (bvsge #b00000000000000000000000000000000 (size!40308 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40308 _keys!1118)))))))

(declare-fun lt!573185 () ListLongMap!18939)

(assert (=> d!138647 (= lt!573195 lt!573185)))

(declare-fun lt!573189 () Unit!42120)

(declare-fun e!719461 () Unit!42120)

(assert (=> d!138647 (= lt!573189 e!719461)))

(declare-fun c!123019 () Bool)

(declare-fun e!719464 () Bool)

(assert (=> d!138647 (= c!123019 e!719464)))

(declare-fun res!841672 () Bool)

(assert (=> d!138647 (=> (not res!841672) (not e!719464))))

(assert (=> d!138647 (= res!841672 (bvslt #b00000000000000000000000000000000 (size!40308 _keys!1118)))))

(declare-fun e!719457 () ListLongMap!18939)

(assert (=> d!138647 (= lt!573185 e!719457)))

(declare-fun c!123018 () Bool)

(assert (=> d!138647 (= c!123018 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138647 (validMask!0 mask!1466)))

(assert (=> d!138647 (= (getCurrentListMap!4652 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573195)))

(declare-fun b!1263662 () Bool)

(declare-fun e!719467 () Bool)

(assert (=> b!1263662 (= e!719459 e!719467)))

(declare-fun c!123014 () Bool)

(assert (=> b!1263662 (= c!123014 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263663 () Bool)

(declare-fun call!62242 () ListLongMap!18939)

(assert (=> b!1263663 (= e!719463 call!62242)))

(declare-fun b!1263664 () Bool)

(declare-fun lt!573191 () Unit!42120)

(assert (=> b!1263664 (= e!719461 lt!573191)))

(declare-fun lt!573178 () ListLongMap!18939)

(assert (=> b!1263664 (= lt!573178 (getCurrentListMapNoExtraKeys!5848 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573194 () (_ BitVec 64))

(assert (=> b!1263664 (= lt!573194 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573177 () (_ BitVec 64))

(assert (=> b!1263664 (= lt!573177 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573190 () Unit!42120)

(assert (=> b!1263664 (= lt!573190 (addStillContains!1092 lt!573178 lt!573194 zeroValue!871 lt!573177))))

(assert (=> b!1263664 (contains!7606 (+!4255 lt!573178 (tuple2!21067 lt!573194 zeroValue!871)) lt!573177)))

(declare-fun lt!573192 () Unit!42120)

(assert (=> b!1263664 (= lt!573192 lt!573190)))

(declare-fun lt!573174 () ListLongMap!18939)

(assert (=> b!1263664 (= lt!573174 (getCurrentListMapNoExtraKeys!5848 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573180 () (_ BitVec 64))

(assert (=> b!1263664 (= lt!573180 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573187 () (_ BitVec 64))

(assert (=> b!1263664 (= lt!573187 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573182 () Unit!42120)

(assert (=> b!1263664 (= lt!573182 (addApplyDifferent!546 lt!573174 lt!573180 minValueAfter!43 lt!573187))))

(assert (=> b!1263664 (= (apply!1002 (+!4255 lt!573174 (tuple2!21067 lt!573180 minValueAfter!43)) lt!573187) (apply!1002 lt!573174 lt!573187))))

(declare-fun lt!573176 () Unit!42120)

(assert (=> b!1263664 (= lt!573176 lt!573182)))

(declare-fun lt!573186 () ListLongMap!18939)

(assert (=> b!1263664 (= lt!573186 (getCurrentListMapNoExtraKeys!5848 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573188 () (_ BitVec 64))

(assert (=> b!1263664 (= lt!573188 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573184 () (_ BitVec 64))

(assert (=> b!1263664 (= lt!573184 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573179 () Unit!42120)

(assert (=> b!1263664 (= lt!573179 (addApplyDifferent!546 lt!573186 lt!573188 zeroValue!871 lt!573184))))

(assert (=> b!1263664 (= (apply!1002 (+!4255 lt!573186 (tuple2!21067 lt!573188 zeroValue!871)) lt!573184) (apply!1002 lt!573186 lt!573184))))

(declare-fun lt!573183 () Unit!42120)

(assert (=> b!1263664 (= lt!573183 lt!573179)))

(declare-fun lt!573175 () ListLongMap!18939)

(assert (=> b!1263664 (= lt!573175 (getCurrentListMapNoExtraKeys!5848 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573181 () (_ BitVec 64))

(assert (=> b!1263664 (= lt!573181 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573193 () (_ BitVec 64))

(assert (=> b!1263664 (= lt!573193 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263664 (= lt!573191 (addApplyDifferent!546 lt!573175 lt!573181 minValueAfter!43 lt!573193))))

(assert (=> b!1263664 (= (apply!1002 (+!4255 lt!573175 (tuple2!21067 lt!573181 minValueAfter!43)) lt!573193) (apply!1002 lt!573175 lt!573193))))

(declare-fun b!1263665 () Bool)

(declare-fun call!62240 () ListLongMap!18939)

(assert (=> b!1263665 (= e!719466 call!62240)))

(declare-fun b!1263666 () Bool)

(declare-fun call!62243 () Bool)

(assert (=> b!1263666 (= e!719467 (not call!62243))))

(declare-fun b!1263667 () Bool)

(declare-fun e!719456 () Bool)

(assert (=> b!1263667 (= e!719456 (= (apply!1002 lt!573195 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1263668 () Bool)

(assert (=> b!1263668 (= e!719457 e!719466)))

(declare-fun c!123017 () Bool)

(assert (=> b!1263668 (= c!123017 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263669 () Bool)

(declare-fun Unit!42123 () Unit!42120)

(assert (=> b!1263669 (= e!719461 Unit!42123)))

(declare-fun b!1263670 () Bool)

(assert (=> b!1263670 (= e!719467 e!719465)))

(declare-fun res!841678 () Bool)

(assert (=> b!1263670 (= res!841678 call!62243)))

(assert (=> b!1263670 (=> (not res!841678) (not e!719465))))

(declare-fun call!62245 () ListLongMap!18939)

(declare-fun bm!62238 () Bool)

(declare-fun call!62241 () ListLongMap!18939)

(declare-fun call!62244 () ListLongMap!18939)

(assert (=> bm!62238 (= call!62244 (+!4255 (ite c!123018 call!62241 (ite c!123017 call!62245 call!62242)) (ite (or c!123018 c!123017) (tuple2!21067 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21067 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun bm!62239 () Bool)

(assert (=> bm!62239 (= call!62243 (contains!7606 lt!573195 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62240 () Bool)

(assert (=> bm!62240 (= call!62241 (getCurrentListMapNoExtraKeys!5848 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263671 () Bool)

(declare-fun res!841674 () Bool)

(assert (=> b!1263671 (=> (not res!841674) (not e!719459))))

(assert (=> b!1263671 (= res!841674 e!719460)))

(declare-fun c!123015 () Bool)

(assert (=> b!1263671 (= c!123015 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1263672 () Bool)

(assert (=> b!1263672 (= e!719464 (validKeyInArray!0 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263673 () Bool)

(declare-fun res!841673 () Bool)

(assert (=> b!1263673 (=> (not res!841673) (not e!719459))))

(declare-fun e!719458 () Bool)

(assert (=> b!1263673 (= res!841673 e!719458)))

(declare-fun res!841675 () Bool)

(assert (=> b!1263673 (=> res!841675 e!719458)))

(declare-fun e!719468 () Bool)

(assert (=> b!1263673 (= res!841675 (not e!719468))))

(declare-fun res!841677 () Bool)

(assert (=> b!1263673 (=> (not res!841677) (not e!719468))))

(assert (=> b!1263673 (= res!841677 (bvslt #b00000000000000000000000000000000 (size!40308 _keys!1118)))))

(declare-fun bm!62241 () Bool)

(assert (=> bm!62241 (= call!62242 call!62245)))

(declare-fun bm!62242 () Bool)

(assert (=> bm!62242 (= call!62245 call!62241)))

(declare-fun b!1263674 () Bool)

(assert (=> b!1263674 (= e!719460 e!719456)))

(declare-fun res!841671 () Bool)

(assert (=> b!1263674 (= res!841671 call!62246)))

(assert (=> b!1263674 (=> (not res!841671) (not e!719456))))

(declare-fun b!1263675 () Bool)

(assert (=> b!1263675 (= e!719457 (+!4255 call!62244 (tuple2!21067 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun bm!62243 () Bool)

(assert (=> bm!62243 (= call!62240 call!62244)))

(declare-fun b!1263676 () Bool)

(assert (=> b!1263676 (= e!719463 call!62240)))

(declare-fun b!1263677 () Bool)

(declare-fun e!719462 () Bool)

(assert (=> b!1263677 (= e!719458 e!719462)))

(declare-fun res!841676 () Bool)

(assert (=> b!1263677 (=> (not res!841676) (not e!719462))))

(assert (=> b!1263677 (= res!841676 (contains!7606 lt!573195 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263677 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40308 _keys!1118)))))

(declare-fun b!1263678 () Bool)

(assert (=> b!1263678 (= e!719462 (= (apply!1002 lt!573195 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000)) (get!20291 (select (arr!39773 _values!914) #b00000000000000000000000000000000) (dynLambda!3400 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1263678 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40309 _values!914)))))

(assert (=> b!1263678 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40308 _keys!1118)))))

(declare-fun b!1263679 () Bool)

(assert (=> b!1263679 (= e!719468 (validKeyInArray!0 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138647 c!123018) b!1263675))

(assert (= (and d!138647 (not c!123018)) b!1263668))

(assert (= (and b!1263668 c!123017) b!1263665))

(assert (= (and b!1263668 (not c!123017)) b!1263661))

(assert (= (and b!1263661 c!123016) b!1263676))

(assert (= (and b!1263661 (not c!123016)) b!1263663))

(assert (= (or b!1263676 b!1263663) bm!62241))

(assert (= (or b!1263665 bm!62241) bm!62242))

(assert (= (or b!1263665 b!1263676) bm!62243))

(assert (= (or b!1263675 bm!62242) bm!62240))

(assert (= (or b!1263675 bm!62243) bm!62238))

(assert (= (and d!138647 res!841672) b!1263672))

(assert (= (and d!138647 c!123019) b!1263664))

(assert (= (and d!138647 (not c!123019)) b!1263669))

(assert (= (and d!138647 res!841679) b!1263673))

(assert (= (and b!1263673 res!841677) b!1263679))

(assert (= (and b!1263673 (not res!841675)) b!1263677))

(assert (= (and b!1263677 res!841676) b!1263678))

(assert (= (and b!1263673 res!841673) b!1263671))

(assert (= (and b!1263671 c!123015) b!1263674))

(assert (= (and b!1263671 (not c!123015)) b!1263659))

(assert (= (and b!1263674 res!841671) b!1263667))

(assert (= (or b!1263674 b!1263659) bm!62237))

(assert (= (and b!1263671 res!841674) b!1263662))

(assert (= (and b!1263662 c!123014) b!1263670))

(assert (= (and b!1263662 (not c!123014)) b!1263666))

(assert (= (and b!1263670 res!841678) b!1263660))

(assert (= (or b!1263670 b!1263666) bm!62239))

(declare-fun b_lambda!22969 () Bool)

(assert (=> (not b_lambda!22969) (not b!1263678)))

(assert (=> b!1263678 t!41775))

(declare-fun b_and!45515 () Bool)

(assert (= b_and!45513 (and (=> t!41775 result!23401) b_and!45515)))

(assert (=> d!138647 m!1164053))

(declare-fun m!1164171 () Bool)

(assert (=> b!1263675 m!1164171))

(assert (=> b!1263679 m!1164093))

(assert (=> b!1263679 m!1164093))

(assert (=> b!1263679 m!1164095))

(assert (=> b!1263664 m!1164093))

(declare-fun m!1164173 () Bool)

(assert (=> b!1263664 m!1164173))

(declare-fun m!1164175 () Bool)

(assert (=> b!1263664 m!1164175))

(assert (=> b!1263664 m!1164173))

(declare-fun m!1164177 () Bool)

(assert (=> b!1263664 m!1164177))

(declare-fun m!1164179 () Bool)

(assert (=> b!1263664 m!1164179))

(declare-fun m!1164181 () Bool)

(assert (=> b!1263664 m!1164181))

(assert (=> b!1263664 m!1164041))

(declare-fun m!1164183 () Bool)

(assert (=> b!1263664 m!1164183))

(declare-fun m!1164185 () Bool)

(assert (=> b!1263664 m!1164185))

(declare-fun m!1164187 () Bool)

(assert (=> b!1263664 m!1164187))

(declare-fun m!1164189 () Bool)

(assert (=> b!1263664 m!1164189))

(assert (=> b!1263664 m!1164185))

(declare-fun m!1164191 () Bool)

(assert (=> b!1263664 m!1164191))

(declare-fun m!1164193 () Bool)

(assert (=> b!1263664 m!1164193))

(declare-fun m!1164195 () Bool)

(assert (=> b!1263664 m!1164195))

(assert (=> b!1263664 m!1164175))

(declare-fun m!1164197 () Bool)

(assert (=> b!1263664 m!1164197))

(declare-fun m!1164199 () Bool)

(assert (=> b!1263664 m!1164199))

(assert (=> b!1263664 m!1164193))

(declare-fun m!1164201 () Bool)

(assert (=> b!1263664 m!1164201))

(assert (=> b!1263677 m!1164093))

(assert (=> b!1263677 m!1164093))

(declare-fun m!1164203 () Bool)

(assert (=> b!1263677 m!1164203))

(assert (=> b!1263678 m!1164093))

(assert (=> b!1263678 m!1164093))

(declare-fun m!1164205 () Bool)

(assert (=> b!1263678 m!1164205))

(assert (=> b!1263678 m!1164131))

(assert (=> b!1263678 m!1164133))

(assert (=> b!1263678 m!1164135))

(assert (=> b!1263678 m!1164133))

(assert (=> b!1263678 m!1164131))

(assert (=> b!1263672 m!1164093))

(assert (=> b!1263672 m!1164093))

(assert (=> b!1263672 m!1164095))

(assert (=> bm!62240 m!1164041))

(declare-fun m!1164207 () Bool)

(assert (=> bm!62239 m!1164207))

(declare-fun m!1164209 () Bool)

(assert (=> b!1263667 m!1164209))

(declare-fun m!1164211 () Bool)

(assert (=> bm!62237 m!1164211))

(declare-fun m!1164213 () Bool)

(assert (=> b!1263660 m!1164213))

(declare-fun m!1164215 () Bool)

(assert (=> bm!62238 m!1164215))

(assert (=> b!1263558 d!138647))

(declare-fun d!138649 () Bool)

(assert (=> d!138649 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106120 d!138649))

(declare-fun d!138651 () Bool)

(assert (=> d!138651 (= (array_inv!30269 _keys!1118) (bvsge (size!40308 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106120 d!138651))

(declare-fun d!138653 () Bool)

(assert (=> d!138653 (= (array_inv!30270 _values!914) (bvsge (size!40309 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106120 d!138653))

(declare-fun b!1263688 () Bool)

(declare-fun e!719475 () Bool)

(declare-fun call!62249 () Bool)

(assert (=> b!1263688 (= e!719475 call!62249)))

(declare-fun d!138655 () Bool)

(declare-fun res!841685 () Bool)

(declare-fun e!719477 () Bool)

(assert (=> d!138655 (=> res!841685 e!719477)))

(assert (=> d!138655 (= res!841685 (bvsge #b00000000000000000000000000000000 (size!40308 _keys!1118)))))

(assert (=> d!138655 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!719477)))

(declare-fun b!1263689 () Bool)

(declare-fun e!719476 () Bool)

(assert (=> b!1263689 (= e!719476 call!62249)))

(declare-fun bm!62246 () Bool)

(assert (=> bm!62246 (= call!62249 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1263690 () Bool)

(assert (=> b!1263690 (= e!719476 e!719475)))

(declare-fun lt!573203 () (_ BitVec 64))

(assert (=> b!1263690 (= lt!573203 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573202 () Unit!42120)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82454 (_ BitVec 64) (_ BitVec 32)) Unit!42120)

(assert (=> b!1263690 (= lt!573202 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!573203 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82454 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1263690 (arrayContainsKey!0 _keys!1118 lt!573203 #b00000000000000000000000000000000)))

(declare-fun lt!573204 () Unit!42120)

(assert (=> b!1263690 (= lt!573204 lt!573202)))

(declare-fun res!841684 () Bool)

(declare-datatypes ((SeekEntryResult!9980 0))(
  ( (MissingZero!9980 (index!42291 (_ BitVec 32))) (Found!9980 (index!42292 (_ BitVec 32))) (Intermediate!9980 (undefined!10792 Bool) (index!42293 (_ BitVec 32)) (x!111345 (_ BitVec 32))) (Undefined!9980) (MissingVacant!9980 (index!42294 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82454 (_ BitVec 32)) SeekEntryResult!9980)

(assert (=> b!1263690 (= res!841684 (= (seekEntryOrOpen!0 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9980 #b00000000000000000000000000000000)))))

(assert (=> b!1263690 (=> (not res!841684) (not e!719475))))

(declare-fun b!1263691 () Bool)

(assert (=> b!1263691 (= e!719477 e!719476)))

(declare-fun c!123022 () Bool)

(assert (=> b!1263691 (= c!123022 (validKeyInArray!0 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138655 (not res!841685)) b!1263691))

(assert (= (and b!1263691 c!123022) b!1263690))

(assert (= (and b!1263691 (not c!123022)) b!1263689))

(assert (= (and b!1263690 res!841684) b!1263688))

(assert (= (or b!1263688 b!1263689) bm!62246))

(declare-fun m!1164217 () Bool)

(assert (=> bm!62246 m!1164217))

(assert (=> b!1263690 m!1164093))

(declare-fun m!1164219 () Bool)

(assert (=> b!1263690 m!1164219))

(declare-fun m!1164221 () Bool)

(assert (=> b!1263690 m!1164221))

(assert (=> b!1263690 m!1164093))

(declare-fun m!1164223 () Bool)

(assert (=> b!1263690 m!1164223))

(assert (=> b!1263691 m!1164093))

(assert (=> b!1263691 m!1164093))

(assert (=> b!1263691 m!1164095))

(assert (=> b!1263560 d!138655))

(declare-fun d!138657 () Bool)

(assert (=> d!138657 (= (getCurrentListMapNoExtraKeys!5848 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5848 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573207 () Unit!42120)

(declare-fun choose!1877 (array!82454 array!82456 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48585 V!48585 V!48585 V!48585 (_ BitVec 32) Int) Unit!42120)

(assert (=> d!138657 (= lt!573207 (choose!1877 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138657 (validMask!0 mask!1466)))

(assert (=> d!138657 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1190 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573207)))

(declare-fun bs!35750 () Bool)

(assert (= bs!35750 d!138657))

(assert (=> bs!35750 m!1164043))

(assert (=> bs!35750 m!1164041))

(declare-fun m!1164225 () Bool)

(assert (=> bs!35750 m!1164225))

(assert (=> bs!35750 m!1164053))

(assert (=> b!1263555 d!138657))

(declare-fun b!1263716 () Bool)

(declare-fun lt!573224 () Unit!42120)

(declare-fun lt!573226 () Unit!42120)

(assert (=> b!1263716 (= lt!573224 lt!573226)))

(declare-fun lt!573223 () (_ BitVec 64))

(declare-fun lt!573228 () ListLongMap!18939)

(declare-fun lt!573227 () V!48585)

(declare-fun lt!573225 () (_ BitVec 64))

(assert (=> b!1263716 (not (contains!7606 (+!4255 lt!573228 (tuple2!21067 lt!573225 lt!573227)) lt!573223))))

(declare-fun addStillNotContains!330 (ListLongMap!18939 (_ BitVec 64) V!48585 (_ BitVec 64)) Unit!42120)

(assert (=> b!1263716 (= lt!573226 (addStillNotContains!330 lt!573228 lt!573225 lt!573227 lt!573223))))

(assert (=> b!1263716 (= lt!573223 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1263716 (= lt!573227 (get!20291 (select (arr!39773 _values!914) #b00000000000000000000000000000000) (dynLambda!3400 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1263716 (= lt!573225 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!62252 () ListLongMap!18939)

(assert (=> b!1263716 (= lt!573228 call!62252)))

(declare-fun e!719496 () ListLongMap!18939)

(assert (=> b!1263716 (= e!719496 (+!4255 call!62252 (tuple2!21067 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000) (get!20291 (select (arr!39773 _values!914) #b00000000000000000000000000000000) (dynLambda!3400 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1263717 () Bool)

(assert (=> b!1263717 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40308 _keys!1118)))))

(assert (=> b!1263717 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40309 _values!914)))))

(declare-fun lt!573222 () ListLongMap!18939)

(declare-fun e!719497 () Bool)

(assert (=> b!1263717 (= e!719497 (= (apply!1002 lt!573222 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000)) (get!20291 (select (arr!39773 _values!914) #b00000000000000000000000000000000) (dynLambda!3400 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!62249 () Bool)

(assert (=> bm!62249 (= call!62252 (getCurrentListMapNoExtraKeys!5848 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1263718 () Bool)

(declare-fun e!719498 () Bool)

(declare-fun e!719492 () Bool)

(assert (=> b!1263718 (= e!719498 e!719492)))

(declare-fun c!123032 () Bool)

(declare-fun e!719493 () Bool)

(assert (=> b!1263718 (= c!123032 e!719493)))

(declare-fun res!841694 () Bool)

(assert (=> b!1263718 (=> (not res!841694) (not e!719493))))

(assert (=> b!1263718 (= res!841694 (bvslt #b00000000000000000000000000000000 (size!40308 _keys!1118)))))

(declare-fun d!138659 () Bool)

(assert (=> d!138659 e!719498))

(declare-fun res!841695 () Bool)

(assert (=> d!138659 (=> (not res!841695) (not e!719498))))

(assert (=> d!138659 (= res!841695 (not (contains!7606 lt!573222 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!719494 () ListLongMap!18939)

(assert (=> d!138659 (= lt!573222 e!719494)))

(declare-fun c!123034 () Bool)

(assert (=> d!138659 (= c!123034 (bvsge #b00000000000000000000000000000000 (size!40308 _keys!1118)))))

(assert (=> d!138659 (validMask!0 mask!1466)))

(assert (=> d!138659 (= (getCurrentListMapNoExtraKeys!5848 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573222)))

(declare-fun b!1263719 () Bool)

(assert (=> b!1263719 (= e!719493 (validKeyInArray!0 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263719 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1263720 () Bool)

(assert (=> b!1263720 (= e!719496 call!62252)))

(declare-fun b!1263721 () Bool)

(declare-fun e!719495 () Bool)

(assert (=> b!1263721 (= e!719492 e!719495)))

(declare-fun c!123033 () Bool)

(assert (=> b!1263721 (= c!123033 (bvslt #b00000000000000000000000000000000 (size!40308 _keys!1118)))))

(declare-fun b!1263722 () Bool)

(assert (=> b!1263722 (= e!719494 (ListLongMap!18940 Nil!28253))))

(declare-fun b!1263723 () Bool)

(assert (=> b!1263723 (= e!719495 (= lt!573222 (getCurrentListMapNoExtraKeys!5848 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1263724 () Bool)

(declare-fun isEmpty!1044 (ListLongMap!18939) Bool)

(assert (=> b!1263724 (= e!719495 (isEmpty!1044 lt!573222))))

(declare-fun b!1263725 () Bool)

(declare-fun res!841696 () Bool)

(assert (=> b!1263725 (=> (not res!841696) (not e!719498))))

(assert (=> b!1263725 (= res!841696 (not (contains!7606 lt!573222 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1263726 () Bool)

(assert (=> b!1263726 (= e!719494 e!719496)))

(declare-fun c!123031 () Bool)

(assert (=> b!1263726 (= c!123031 (validKeyInArray!0 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263727 () Bool)

(assert (=> b!1263727 (= e!719492 e!719497)))

(assert (=> b!1263727 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40308 _keys!1118)))))

(declare-fun res!841697 () Bool)

(assert (=> b!1263727 (= res!841697 (contains!7606 lt!573222 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263727 (=> (not res!841697) (not e!719497))))

(assert (= (and d!138659 c!123034) b!1263722))

(assert (= (and d!138659 (not c!123034)) b!1263726))

(assert (= (and b!1263726 c!123031) b!1263716))

(assert (= (and b!1263726 (not c!123031)) b!1263720))

(assert (= (or b!1263716 b!1263720) bm!62249))

(assert (= (and d!138659 res!841695) b!1263725))

(assert (= (and b!1263725 res!841696) b!1263718))

(assert (= (and b!1263718 res!841694) b!1263719))

(assert (= (and b!1263718 c!123032) b!1263727))

(assert (= (and b!1263718 (not c!123032)) b!1263721))

(assert (= (and b!1263727 res!841697) b!1263717))

(assert (= (and b!1263721 c!123033) b!1263723))

(assert (= (and b!1263721 (not c!123033)) b!1263724))

(declare-fun b_lambda!22971 () Bool)

(assert (=> (not b_lambda!22971) (not b!1263716)))

(assert (=> b!1263716 t!41775))

(declare-fun b_and!45517 () Bool)

(assert (= b_and!45515 (and (=> t!41775 result!23401) b_and!45517)))

(declare-fun b_lambda!22973 () Bool)

(assert (=> (not b_lambda!22973) (not b!1263717)))

(assert (=> b!1263717 t!41775))

(declare-fun b_and!45519 () Bool)

(assert (= b_and!45517 (and (=> t!41775 result!23401) b_and!45519)))

(assert (=> b!1263727 m!1164093))

(assert (=> b!1263727 m!1164093))

(declare-fun m!1164227 () Bool)

(assert (=> b!1263727 m!1164227))

(assert (=> b!1263719 m!1164093))

(assert (=> b!1263719 m!1164093))

(assert (=> b!1263719 m!1164095))

(assert (=> b!1263726 m!1164093))

(assert (=> b!1263726 m!1164093))

(assert (=> b!1263726 m!1164095))

(declare-fun m!1164229 () Bool)

(assert (=> d!138659 m!1164229))

(assert (=> d!138659 m!1164053))

(declare-fun m!1164231 () Bool)

(assert (=> bm!62249 m!1164231))

(declare-fun m!1164233 () Bool)

(assert (=> b!1263724 m!1164233))

(assert (=> b!1263723 m!1164231))

(declare-fun m!1164235 () Bool)

(assert (=> b!1263725 m!1164235))

(assert (=> b!1263716 m!1164131))

(assert (=> b!1263716 m!1164133))

(assert (=> b!1263716 m!1164135))

(assert (=> b!1263716 m!1164131))

(declare-fun m!1164237 () Bool)

(assert (=> b!1263716 m!1164237))

(declare-fun m!1164239 () Bool)

(assert (=> b!1263716 m!1164239))

(declare-fun m!1164241 () Bool)

(assert (=> b!1263716 m!1164241))

(assert (=> b!1263716 m!1164133))

(assert (=> b!1263716 m!1164237))

(declare-fun m!1164243 () Bool)

(assert (=> b!1263716 m!1164243))

(assert (=> b!1263716 m!1164093))

(assert (=> b!1263717 m!1164131))

(assert (=> b!1263717 m!1164133))

(assert (=> b!1263717 m!1164135))

(assert (=> b!1263717 m!1164131))

(assert (=> b!1263717 m!1164133))

(assert (=> b!1263717 m!1164093))

(assert (=> b!1263717 m!1164093))

(declare-fun m!1164245 () Bool)

(assert (=> b!1263717 m!1164245))

(assert (=> b!1263555 d!138659))

(declare-fun b!1263728 () Bool)

(declare-fun lt!573231 () Unit!42120)

(declare-fun lt!573233 () Unit!42120)

(assert (=> b!1263728 (= lt!573231 lt!573233)))

(declare-fun lt!573235 () ListLongMap!18939)

(declare-fun lt!573232 () (_ BitVec 64))

(declare-fun lt!573230 () (_ BitVec 64))

(declare-fun lt!573234 () V!48585)

(assert (=> b!1263728 (not (contains!7606 (+!4255 lt!573235 (tuple2!21067 lt!573232 lt!573234)) lt!573230))))

(assert (=> b!1263728 (= lt!573233 (addStillNotContains!330 lt!573235 lt!573232 lt!573234 lt!573230))))

(assert (=> b!1263728 (= lt!573230 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1263728 (= lt!573234 (get!20291 (select (arr!39773 _values!914) #b00000000000000000000000000000000) (dynLambda!3400 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1263728 (= lt!573232 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!62253 () ListLongMap!18939)

(assert (=> b!1263728 (= lt!573235 call!62253)))

(declare-fun e!719503 () ListLongMap!18939)

(assert (=> b!1263728 (= e!719503 (+!4255 call!62253 (tuple2!21067 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000) (get!20291 (select (arr!39773 _values!914) #b00000000000000000000000000000000) (dynLambda!3400 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1263729 () Bool)

(assert (=> b!1263729 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40308 _keys!1118)))))

(assert (=> b!1263729 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40309 _values!914)))))

(declare-fun lt!573229 () ListLongMap!18939)

(declare-fun e!719504 () Bool)

(assert (=> b!1263729 (= e!719504 (= (apply!1002 lt!573229 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000)) (get!20291 (select (arr!39773 _values!914) #b00000000000000000000000000000000) (dynLambda!3400 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!62250 () Bool)

(assert (=> bm!62250 (= call!62253 (getCurrentListMapNoExtraKeys!5848 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1263730 () Bool)

(declare-fun e!719505 () Bool)

(declare-fun e!719499 () Bool)

(assert (=> b!1263730 (= e!719505 e!719499)))

(declare-fun c!123036 () Bool)

(declare-fun e!719500 () Bool)

(assert (=> b!1263730 (= c!123036 e!719500)))

(declare-fun res!841698 () Bool)

(assert (=> b!1263730 (=> (not res!841698) (not e!719500))))

(assert (=> b!1263730 (= res!841698 (bvslt #b00000000000000000000000000000000 (size!40308 _keys!1118)))))

(declare-fun d!138661 () Bool)

(assert (=> d!138661 e!719505))

(declare-fun res!841699 () Bool)

(assert (=> d!138661 (=> (not res!841699) (not e!719505))))

(assert (=> d!138661 (= res!841699 (not (contains!7606 lt!573229 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!719501 () ListLongMap!18939)

(assert (=> d!138661 (= lt!573229 e!719501)))

(declare-fun c!123038 () Bool)

(assert (=> d!138661 (= c!123038 (bvsge #b00000000000000000000000000000000 (size!40308 _keys!1118)))))

(assert (=> d!138661 (validMask!0 mask!1466)))

(assert (=> d!138661 (= (getCurrentListMapNoExtraKeys!5848 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573229)))

(declare-fun b!1263731 () Bool)

(assert (=> b!1263731 (= e!719500 (validKeyInArray!0 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263731 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1263732 () Bool)

(assert (=> b!1263732 (= e!719503 call!62253)))

(declare-fun b!1263733 () Bool)

(declare-fun e!719502 () Bool)

(assert (=> b!1263733 (= e!719499 e!719502)))

(declare-fun c!123037 () Bool)

(assert (=> b!1263733 (= c!123037 (bvslt #b00000000000000000000000000000000 (size!40308 _keys!1118)))))

(declare-fun b!1263734 () Bool)

(assert (=> b!1263734 (= e!719501 (ListLongMap!18940 Nil!28253))))

(declare-fun b!1263735 () Bool)

(assert (=> b!1263735 (= e!719502 (= lt!573229 (getCurrentListMapNoExtraKeys!5848 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1263736 () Bool)

(assert (=> b!1263736 (= e!719502 (isEmpty!1044 lt!573229))))

(declare-fun b!1263737 () Bool)

(declare-fun res!841700 () Bool)

(assert (=> b!1263737 (=> (not res!841700) (not e!719505))))

(assert (=> b!1263737 (= res!841700 (not (contains!7606 lt!573229 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1263738 () Bool)

(assert (=> b!1263738 (= e!719501 e!719503)))

(declare-fun c!123035 () Bool)

(assert (=> b!1263738 (= c!123035 (validKeyInArray!0 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263739 () Bool)

(assert (=> b!1263739 (= e!719499 e!719504)))

(assert (=> b!1263739 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40308 _keys!1118)))))

(declare-fun res!841701 () Bool)

(assert (=> b!1263739 (= res!841701 (contains!7606 lt!573229 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263739 (=> (not res!841701) (not e!719504))))

(assert (= (and d!138661 c!123038) b!1263734))

(assert (= (and d!138661 (not c!123038)) b!1263738))

(assert (= (and b!1263738 c!123035) b!1263728))

(assert (= (and b!1263738 (not c!123035)) b!1263732))

(assert (= (or b!1263728 b!1263732) bm!62250))

(assert (= (and d!138661 res!841699) b!1263737))

(assert (= (and b!1263737 res!841700) b!1263730))

(assert (= (and b!1263730 res!841698) b!1263731))

(assert (= (and b!1263730 c!123036) b!1263739))

(assert (= (and b!1263730 (not c!123036)) b!1263733))

(assert (= (and b!1263739 res!841701) b!1263729))

(assert (= (and b!1263733 c!123037) b!1263735))

(assert (= (and b!1263733 (not c!123037)) b!1263736))

(declare-fun b_lambda!22975 () Bool)

(assert (=> (not b_lambda!22975) (not b!1263728)))

(assert (=> b!1263728 t!41775))

(declare-fun b_and!45521 () Bool)

(assert (= b_and!45519 (and (=> t!41775 result!23401) b_and!45521)))

(declare-fun b_lambda!22977 () Bool)

(assert (=> (not b_lambda!22977) (not b!1263729)))

(assert (=> b!1263729 t!41775))

(declare-fun b_and!45523 () Bool)

(assert (= b_and!45521 (and (=> t!41775 result!23401) b_and!45523)))

(assert (=> b!1263739 m!1164093))

(assert (=> b!1263739 m!1164093))

(declare-fun m!1164247 () Bool)

(assert (=> b!1263739 m!1164247))

(assert (=> b!1263731 m!1164093))

(assert (=> b!1263731 m!1164093))

(assert (=> b!1263731 m!1164095))

(assert (=> b!1263738 m!1164093))

(assert (=> b!1263738 m!1164093))

(assert (=> b!1263738 m!1164095))

(declare-fun m!1164249 () Bool)

(assert (=> d!138661 m!1164249))

(assert (=> d!138661 m!1164053))

(declare-fun m!1164251 () Bool)

(assert (=> bm!62250 m!1164251))

(declare-fun m!1164253 () Bool)

(assert (=> b!1263736 m!1164253))

(assert (=> b!1263735 m!1164251))

(declare-fun m!1164255 () Bool)

(assert (=> b!1263737 m!1164255))

(assert (=> b!1263728 m!1164131))

(assert (=> b!1263728 m!1164133))

(assert (=> b!1263728 m!1164135))

(assert (=> b!1263728 m!1164131))

(declare-fun m!1164257 () Bool)

(assert (=> b!1263728 m!1164257))

(declare-fun m!1164259 () Bool)

(assert (=> b!1263728 m!1164259))

(declare-fun m!1164261 () Bool)

(assert (=> b!1263728 m!1164261))

(assert (=> b!1263728 m!1164133))

(assert (=> b!1263728 m!1164257))

(declare-fun m!1164263 () Bool)

(assert (=> b!1263728 m!1164263))

(assert (=> b!1263728 m!1164093))

(assert (=> b!1263729 m!1164131))

(assert (=> b!1263729 m!1164133))

(assert (=> b!1263729 m!1164135))

(assert (=> b!1263729 m!1164131))

(assert (=> b!1263729 m!1164133))

(assert (=> b!1263729 m!1164093))

(assert (=> b!1263729 m!1164093))

(declare-fun m!1164265 () Bool)

(assert (=> b!1263729 m!1164265))

(assert (=> b!1263555 d!138661))

(declare-fun bm!62253 () Bool)

(declare-fun call!62256 () Bool)

(declare-fun c!123041 () Bool)

(assert (=> bm!62253 (= call!62256 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123041 (Cons!28253 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000) Nil!28254) Nil!28254)))))

(declare-fun b!1263750 () Bool)

(declare-fun e!719515 () Bool)

(declare-fun contains!7608 (List!28257 (_ BitVec 64)) Bool)

(assert (=> b!1263750 (= e!719515 (contains!7608 Nil!28254 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263751 () Bool)

(declare-fun e!719516 () Bool)

(declare-fun e!719517 () Bool)

(assert (=> b!1263751 (= e!719516 e!719517)))

(assert (=> b!1263751 (= c!123041 (validKeyInArray!0 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263752 () Bool)

(declare-fun e!719514 () Bool)

(assert (=> b!1263752 (= e!719514 e!719516)))

(declare-fun res!841709 () Bool)

(assert (=> b!1263752 (=> (not res!841709) (not e!719516))))

(assert (=> b!1263752 (= res!841709 (not e!719515))))

(declare-fun res!841708 () Bool)

(assert (=> b!1263752 (=> (not res!841708) (not e!719515))))

(assert (=> b!1263752 (= res!841708 (validKeyInArray!0 (select (arr!39772 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263753 () Bool)

(assert (=> b!1263753 (= e!719517 call!62256)))

(declare-fun d!138663 () Bool)

(declare-fun res!841710 () Bool)

(assert (=> d!138663 (=> res!841710 e!719514)))

(assert (=> d!138663 (= res!841710 (bvsge #b00000000000000000000000000000000 (size!40308 _keys!1118)))))

(assert (=> d!138663 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28254) e!719514)))

(declare-fun b!1263754 () Bool)

(assert (=> b!1263754 (= e!719517 call!62256)))

(assert (= (and d!138663 (not res!841710)) b!1263752))

(assert (= (and b!1263752 res!841708) b!1263750))

(assert (= (and b!1263752 res!841709) b!1263751))

(assert (= (and b!1263751 c!123041) b!1263753))

(assert (= (and b!1263751 (not c!123041)) b!1263754))

(assert (= (or b!1263753 b!1263754) bm!62253))

(assert (=> bm!62253 m!1164093))

(declare-fun m!1164267 () Bool)

(assert (=> bm!62253 m!1164267))

(assert (=> b!1263750 m!1164093))

(assert (=> b!1263750 m!1164093))

(declare-fun m!1164269 () Bool)

(assert (=> b!1263750 m!1164269))

(assert (=> b!1263751 m!1164093))

(assert (=> b!1263751 m!1164093))

(assert (=> b!1263751 m!1164095))

(assert (=> b!1263752 m!1164093))

(assert (=> b!1263752 m!1164093))

(assert (=> b!1263752 m!1164095))

(assert (=> b!1263559 d!138663))

(declare-fun condMapEmpty!50455 () Bool)

(declare-fun mapDefault!50455 () ValueCell!15444)

(assert (=> mapNonEmpty!50449 (= condMapEmpty!50455 (= mapRest!50449 ((as const (Array (_ BitVec 32) ValueCell!15444)) mapDefault!50455)))))

(declare-fun e!719522 () Bool)

(declare-fun mapRes!50455 () Bool)

(assert (=> mapNonEmpty!50449 (= tp!96094 (and e!719522 mapRes!50455))))

(declare-fun b!1263762 () Bool)

(assert (=> b!1263762 (= e!719522 tp_is_empty!32415)))

(declare-fun mapNonEmpty!50455 () Bool)

(declare-fun tp!96104 () Bool)

(declare-fun e!719523 () Bool)

(assert (=> mapNonEmpty!50455 (= mapRes!50455 (and tp!96104 e!719523))))

(declare-fun mapValue!50455 () ValueCell!15444)

(declare-fun mapKey!50455 () (_ BitVec 32))

(declare-fun mapRest!50455 () (Array (_ BitVec 32) ValueCell!15444))

(assert (=> mapNonEmpty!50455 (= mapRest!50449 (store mapRest!50455 mapKey!50455 mapValue!50455))))

(declare-fun b!1263761 () Bool)

(assert (=> b!1263761 (= e!719523 tp_is_empty!32415)))

(declare-fun mapIsEmpty!50455 () Bool)

(assert (=> mapIsEmpty!50455 mapRes!50455))

(assert (= (and mapNonEmpty!50449 condMapEmpty!50455) mapIsEmpty!50455))

(assert (= (and mapNonEmpty!50449 (not condMapEmpty!50455)) mapNonEmpty!50455))

(assert (= (and mapNonEmpty!50455 ((_ is ValueCellFull!15444) mapValue!50455)) b!1263761))

(assert (= (and mapNonEmpty!50449 ((_ is ValueCellFull!15444) mapDefault!50455)) b!1263762))

(declare-fun m!1164271 () Bool)

(assert (=> mapNonEmpty!50455 m!1164271))

(declare-fun b_lambda!22979 () Bool)

(assert (= b_lambda!22973 (or (and start!106120 b_free!27513) b_lambda!22979)))

(declare-fun b_lambda!22981 () Bool)

(assert (= b_lambda!22977 (or (and start!106120 b_free!27513) b_lambda!22981)))

(declare-fun b_lambda!22983 () Bool)

(assert (= b_lambda!22967 (or (and start!106120 b_free!27513) b_lambda!22983)))

(declare-fun b_lambda!22985 () Bool)

(assert (= b_lambda!22971 (or (and start!106120 b_free!27513) b_lambda!22985)))

(declare-fun b_lambda!22987 () Bool)

(assert (= b_lambda!22975 (or (and start!106120 b_free!27513) b_lambda!22987)))

(declare-fun b_lambda!22989 () Bool)

(assert (= b_lambda!22969 (or (and start!106120 b_free!27513) b_lambda!22989)))

(check-sat (not b!1263726) (not b!1263633) (not b!1263655) (not b!1263731) (not b!1263750) (not b!1263648) (not d!138647) (not b!1263716) (not b!1263691) (not b!1263725) (not b!1263690) (not b!1263728) (not b!1263672) (not b!1263641) (not b!1263737) b_and!45523 (not bm!62239) (not bm!62246) (not b!1263647) (not bm!62232) (not b!1263667) (not b!1263658) (not d!138661) (not d!138643) (not b!1263727) (not d!138657) (not b_lambda!22981) (not b!1263739) (not b!1263675) (not d!138641) (not b!1263656) (not bm!62233) (not b!1263678) (not b!1263679) (not b!1263646) (not b!1263660) (not bm!62250) (not b!1263723) (not b!1263736) (not b!1263729) (not bm!62230) (not d!138659) (not b_lambda!22985) (not b_lambda!22983) (not b!1263735) (not bm!62238) (not b!1263644) (not b!1263664) (not b!1263717) (not b!1263738) (not bm!62237) (not bm!62249) (not b!1263636) (not b_lambda!22987) (not bm!62253) (not b_lambda!22989) tp_is_empty!32415 (not bm!62231) (not b!1263724) (not b!1263752) (not b_next!27513) (not bm!62240) (not b!1263751) (not b_lambda!22979) (not mapNonEmpty!50455) (not b!1263657) (not b!1263719) (not d!138645) (not b!1263629) (not b!1263677))
(check-sat b_and!45523 (not b_next!27513))
