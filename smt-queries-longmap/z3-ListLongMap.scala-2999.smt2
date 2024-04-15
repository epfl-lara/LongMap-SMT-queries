; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42284 () Bool)

(assert start!42284)

(declare-fun b_free!11803 () Bool)

(declare-fun b_next!11803 () Bool)

(assert (=> start!42284 (= b_free!11803 (not b_next!11803))))

(declare-fun tp!41436 () Bool)

(declare-fun b_and!20215 () Bool)

(assert (=> start!42284 (= tp!41436 b_and!20215)))

(declare-fun mapIsEmpty!21553 () Bool)

(declare-fun mapRes!21553 () Bool)

(assert (=> mapIsEmpty!21553 mapRes!21553))

(declare-fun b!471711 () Bool)

(declare-fun res!281817 () Bool)

(declare-fun e!276515 () Bool)

(assert (=> b!471711 (=> (not res!281817) (not e!276515))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30207 0))(
  ( (array!30208 (arr!14525 (Array (_ BitVec 32) (_ BitVec 64))) (size!14878 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30207)

(declare-datatypes ((V!18747 0))(
  ( (V!18748 (val!6660 Int)) )
))
(declare-datatypes ((ValueCell!6272 0))(
  ( (ValueCellFull!6272 (v!8945 V!18747)) (EmptyCell!6272) )
))
(declare-datatypes ((array!30209 0))(
  ( (array!30210 (arr!14526 (Array (_ BitVec 32) ValueCell!6272)) (size!14879 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30209)

(assert (=> b!471711 (= res!281817 (and (= (size!14879 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14878 _keys!1025) (size!14879 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471712 () Bool)

(declare-fun e!276512 () Bool)

(declare-fun tp_is_empty!13231 () Bool)

(assert (=> b!471712 (= e!276512 tp_is_empty!13231)))

(declare-fun mapNonEmpty!21553 () Bool)

(declare-fun tp!41437 () Bool)

(declare-fun e!276516 () Bool)

(assert (=> mapNonEmpty!21553 (= mapRes!21553 (and tp!41437 e!276516))))

(declare-fun mapRest!21553 () (Array (_ BitVec 32) ValueCell!6272))

(declare-fun mapKey!21553 () (_ BitVec 32))

(declare-fun mapValue!21553 () ValueCell!6272)

(assert (=> mapNonEmpty!21553 (= (arr!14526 _values!833) (store mapRest!21553 mapKey!21553 mapValue!21553))))

(declare-fun b!471713 () Bool)

(declare-fun e!276513 () Bool)

(assert (=> b!471713 (= e!276513 (and e!276512 mapRes!21553))))

(declare-fun condMapEmpty!21553 () Bool)

(declare-fun mapDefault!21553 () ValueCell!6272)

(assert (=> b!471713 (= condMapEmpty!21553 (= (arr!14526 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6272)) mapDefault!21553)))))

(declare-fun res!281818 () Bool)

(assert (=> start!42284 (=> (not res!281818) (not e!276515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42284 (= res!281818 (validMask!0 mask!1365))))

(assert (=> start!42284 e!276515))

(assert (=> start!42284 tp_is_empty!13231))

(assert (=> start!42284 tp!41436))

(assert (=> start!42284 true))

(declare-fun array_inv!10564 (array!30207) Bool)

(assert (=> start!42284 (array_inv!10564 _keys!1025)))

(declare-fun array_inv!10565 (array!30209) Bool)

(assert (=> start!42284 (and (array_inv!10565 _values!833) e!276513)))

(declare-fun b!471714 () Bool)

(assert (=> b!471714 (= e!276515 (not (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!14878 _keys!1025)))))))

(declare-datatypes ((tuple2!8806 0))(
  ( (tuple2!8807 (_1!4414 (_ BitVec 64)) (_2!4414 V!18747)) )
))
(declare-datatypes ((List!8880 0))(
  ( (Nil!8877) (Cons!8876 (h!9732 tuple2!8806) (t!14837 List!8880)) )
))
(declare-datatypes ((ListLongMap!7709 0))(
  ( (ListLongMap!7710 (toList!3870 List!8880)) )
))
(declare-fun lt!213888 () ListLongMap!7709)

(declare-fun lt!213890 () ListLongMap!7709)

(assert (=> b!471714 (= lt!213888 lt!213890)))

(declare-fun minValueBefore!38 () V!18747)

(declare-fun zeroValue!794 () V!18747)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18747)

(declare-datatypes ((Unit!13841 0))(
  ( (Unit!13842) )
))
(declare-fun lt!213889 () Unit!13841)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!202 (array!30207 array!30209 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18747 V!18747 V!18747 V!18747 (_ BitVec 32) Int) Unit!13841)

(assert (=> b!471714 (= lt!213889 (lemmaNoChangeToArrayThenSameMapNoExtras!202 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2045 (array!30207 array!30209 (_ BitVec 32) (_ BitVec 32) V!18747 V!18747 (_ BitVec 32) Int) ListLongMap!7709)

(assert (=> b!471714 (= lt!213890 (getCurrentListMapNoExtraKeys!2045 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471714 (= lt!213888 (getCurrentListMapNoExtraKeys!2045 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471715 () Bool)

(declare-fun res!281816 () Bool)

(assert (=> b!471715 (=> (not res!281816) (not e!276515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30207 (_ BitVec 32)) Bool)

(assert (=> b!471715 (= res!281816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471716 () Bool)

(declare-fun res!281819 () Bool)

(assert (=> b!471716 (=> (not res!281819) (not e!276515))))

(declare-datatypes ((List!8881 0))(
  ( (Nil!8878) (Cons!8877 (h!9733 (_ BitVec 64)) (t!14838 List!8881)) )
))
(declare-fun arrayNoDuplicates!0 (array!30207 (_ BitVec 32) List!8881) Bool)

(assert (=> b!471716 (= res!281819 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8878))))

(declare-fun b!471717 () Bool)

(assert (=> b!471717 (= e!276516 tp_is_empty!13231)))

(assert (= (and start!42284 res!281818) b!471711))

(assert (= (and b!471711 res!281817) b!471715))

(assert (= (and b!471715 res!281816) b!471716))

(assert (= (and b!471716 res!281819) b!471714))

(assert (= (and b!471713 condMapEmpty!21553) mapIsEmpty!21553))

(assert (= (and b!471713 (not condMapEmpty!21553)) mapNonEmpty!21553))

(get-info :version)

(assert (= (and mapNonEmpty!21553 ((_ is ValueCellFull!6272) mapValue!21553)) b!471717))

(assert (= (and b!471713 ((_ is ValueCellFull!6272) mapDefault!21553)) b!471712))

(assert (= start!42284 b!471713))

(declare-fun m!453303 () Bool)

(assert (=> b!471716 m!453303))

(declare-fun m!453305 () Bool)

(assert (=> mapNonEmpty!21553 m!453305))

(declare-fun m!453307 () Bool)

(assert (=> b!471714 m!453307))

(declare-fun m!453309 () Bool)

(assert (=> b!471714 m!453309))

(declare-fun m!453311 () Bool)

(assert (=> b!471714 m!453311))

(declare-fun m!453313 () Bool)

(assert (=> start!42284 m!453313))

(declare-fun m!453315 () Bool)

(assert (=> start!42284 m!453315))

(declare-fun m!453317 () Bool)

(assert (=> start!42284 m!453317))

(declare-fun m!453319 () Bool)

(assert (=> b!471715 m!453319))

(check-sat (not start!42284) (not b_next!11803) (not b!471716) tp_is_empty!13231 b_and!20215 (not b!471714) (not mapNonEmpty!21553) (not b!471715))
(check-sat b_and!20215 (not b_next!11803))
(get-model)

(declare-fun b!471770 () Bool)

(declare-fun e!276555 () Bool)

(declare-fun call!30429 () Bool)

(assert (=> b!471770 (= e!276555 call!30429)))

(declare-fun b!471771 () Bool)

(assert (=> b!471771 (= e!276555 call!30429)))

(declare-fun b!471772 () Bool)

(declare-fun e!276558 () Bool)

(declare-fun e!276556 () Bool)

(assert (=> b!471772 (= e!276558 e!276556)))

(declare-fun res!281852 () Bool)

(assert (=> b!471772 (=> (not res!281852) (not e!276556))))

(declare-fun e!276557 () Bool)

(assert (=> b!471772 (= res!281852 (not e!276557))))

(declare-fun res!281850 () Bool)

(assert (=> b!471772 (=> (not res!281850) (not e!276557))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!471772 (= res!281850 (validKeyInArray!0 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!471773 () Bool)

(declare-fun contains!2535 (List!8881 (_ BitVec 64)) Bool)

(assert (=> b!471773 (= e!276557 (contains!2535 Nil!8878 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75229 () Bool)

(declare-fun res!281851 () Bool)

(assert (=> d!75229 (=> res!281851 e!276558)))

(assert (=> d!75229 (= res!281851 (bvsge #b00000000000000000000000000000000 (size!14878 _keys!1025)))))

(assert (=> d!75229 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8878) e!276558)))

(declare-fun bm!30426 () Bool)

(declare-fun c!56918 () Bool)

(assert (=> bm!30426 (= call!30429 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56918 (Cons!8877 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000) Nil!8878) Nil!8878)))))

(declare-fun b!471774 () Bool)

(assert (=> b!471774 (= e!276556 e!276555)))

(assert (=> b!471774 (= c!56918 (validKeyInArray!0 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75229 (not res!281851)) b!471772))

(assert (= (and b!471772 res!281850) b!471773))

(assert (= (and b!471772 res!281852) b!471774))

(assert (= (and b!471774 c!56918) b!471770))

(assert (= (and b!471774 (not c!56918)) b!471771))

(assert (= (or b!471770 b!471771) bm!30426))

(declare-fun m!453357 () Bool)

(assert (=> b!471772 m!453357))

(assert (=> b!471772 m!453357))

(declare-fun m!453359 () Bool)

(assert (=> b!471772 m!453359))

(assert (=> b!471773 m!453357))

(assert (=> b!471773 m!453357))

(declare-fun m!453361 () Bool)

(assert (=> b!471773 m!453361))

(assert (=> bm!30426 m!453357))

(declare-fun m!453363 () Bool)

(assert (=> bm!30426 m!453363))

(assert (=> b!471774 m!453357))

(assert (=> b!471774 m!453357))

(assert (=> b!471774 m!453359))

(assert (=> b!471716 d!75229))

(declare-fun d!75231 () Bool)

(declare-fun res!281858 () Bool)

(declare-fun e!276565 () Bool)

(assert (=> d!75231 (=> res!281858 e!276565)))

(assert (=> d!75231 (= res!281858 (bvsge #b00000000000000000000000000000000 (size!14878 _keys!1025)))))

(assert (=> d!75231 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!276565)))

(declare-fun b!471783 () Bool)

(declare-fun e!276567 () Bool)

(declare-fun call!30432 () Bool)

(assert (=> b!471783 (= e!276567 call!30432)))

(declare-fun b!471784 () Bool)

(declare-fun e!276566 () Bool)

(assert (=> b!471784 (= e!276565 e!276566)))

(declare-fun c!56921 () Bool)

(assert (=> b!471784 (= c!56921 (validKeyInArray!0 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!471785 () Bool)

(assert (=> b!471785 (= e!276566 call!30432)))

(declare-fun bm!30429 () Bool)

(assert (=> bm!30429 (= call!30432 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!471786 () Bool)

(assert (=> b!471786 (= e!276566 e!276567)))

(declare-fun lt!213915 () (_ BitVec 64))

(assert (=> b!471786 (= lt!213915 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213917 () Unit!13841)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30207 (_ BitVec 64) (_ BitVec 32)) Unit!13841)

(assert (=> b!471786 (= lt!213917 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!213915 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!471786 (arrayContainsKey!0 _keys!1025 lt!213915 #b00000000000000000000000000000000)))

(declare-fun lt!213916 () Unit!13841)

(assert (=> b!471786 (= lt!213916 lt!213917)))

(declare-fun res!281857 () Bool)

(declare-datatypes ((SeekEntryResult!3549 0))(
  ( (MissingZero!3549 (index!16375 (_ BitVec 32))) (Found!3549 (index!16376 (_ BitVec 32))) (Intermediate!3549 (undefined!4361 Bool) (index!16377 (_ BitVec 32)) (x!44246 (_ BitVec 32))) (Undefined!3549) (MissingVacant!3549 (index!16378 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30207 (_ BitVec 32)) SeekEntryResult!3549)

(assert (=> b!471786 (= res!281857 (= (seekEntryOrOpen!0 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3549 #b00000000000000000000000000000000)))))

(assert (=> b!471786 (=> (not res!281857) (not e!276567))))

(assert (= (and d!75231 (not res!281858)) b!471784))

(assert (= (and b!471784 c!56921) b!471786))

(assert (= (and b!471784 (not c!56921)) b!471785))

(assert (= (and b!471786 res!281857) b!471783))

(assert (= (or b!471783 b!471785) bm!30429))

(assert (=> b!471784 m!453357))

(assert (=> b!471784 m!453357))

(assert (=> b!471784 m!453359))

(declare-fun m!453365 () Bool)

(assert (=> bm!30429 m!453365))

(assert (=> b!471786 m!453357))

(declare-fun m!453367 () Bool)

(assert (=> b!471786 m!453367))

(declare-fun m!453369 () Bool)

(assert (=> b!471786 m!453369))

(assert (=> b!471786 m!453357))

(declare-fun m!453371 () Bool)

(assert (=> b!471786 m!453371))

(assert (=> b!471715 d!75231))

(declare-fun d!75233 () Bool)

(assert (=> d!75233 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42284 d!75233))

(declare-fun d!75235 () Bool)

(assert (=> d!75235 (= (array_inv!10564 _keys!1025) (bvsge (size!14878 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42284 d!75235))

(declare-fun d!75237 () Bool)

(assert (=> d!75237 (= (array_inv!10565 _values!833) (bvsge (size!14879 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42284 d!75237))

(declare-fun d!75239 () Bool)

(assert (=> d!75239 (= (getCurrentListMapNoExtraKeys!2045 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2045 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213920 () Unit!13841)

(declare-fun choose!1356 (array!30207 array!30209 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18747 V!18747 V!18747 V!18747 (_ BitVec 32) Int) Unit!13841)

(assert (=> d!75239 (= lt!213920 (choose!1356 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75239 (validMask!0 mask!1365)))

(assert (=> d!75239 (= (lemmaNoChangeToArrayThenSameMapNoExtras!202 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213920)))

(declare-fun bs!14946 () Bool)

(assert (= bs!14946 d!75239))

(assert (=> bs!14946 m!453311))

(assert (=> bs!14946 m!453309))

(declare-fun m!453373 () Bool)

(assert (=> bs!14946 m!453373))

(assert (=> bs!14946 m!453313))

(assert (=> b!471714 d!75239))

(declare-fun b!471811 () Bool)

(assert (=> b!471811 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14878 _keys!1025)))))

(assert (=> b!471811 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14879 _values!833)))))

(declare-fun lt!213941 () ListLongMap!7709)

(declare-fun e!276583 () Bool)

(declare-fun apply!330 (ListLongMap!7709 (_ BitVec 64)) V!18747)

(declare-fun get!7083 (ValueCell!6272 V!18747) V!18747)

(declare-fun dynLambda!926 (Int (_ BitVec 64)) V!18747)

(assert (=> b!471811 (= e!276583 (= (apply!330 lt!213941 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000)) (get!7083 (select (arr!14526 _values!833) #b00000000000000000000000000000000) (dynLambda!926 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!471812 () Bool)

(declare-fun e!276587 () Bool)

(assert (=> b!471812 (= e!276587 e!276583)))

(assert (=> b!471812 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14878 _keys!1025)))))

(declare-fun res!281867 () Bool)

(declare-fun contains!2536 (ListLongMap!7709 (_ BitVec 64)) Bool)

(assert (=> b!471812 (= res!281867 (contains!2536 lt!213941 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!471812 (=> (not res!281867) (not e!276583))))

(declare-fun b!471813 () Bool)

(declare-fun e!276582 () ListLongMap!7709)

(declare-fun e!276584 () ListLongMap!7709)

(assert (=> b!471813 (= e!276582 e!276584)))

(declare-fun c!56932 () Bool)

(assert (=> b!471813 (= c!56932 (validKeyInArray!0 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!471814 () Bool)

(declare-fun res!281870 () Bool)

(declare-fun e!276586 () Bool)

(assert (=> b!471814 (=> (not res!281870) (not e!276586))))

(assert (=> b!471814 (= res!281870 (not (contains!2536 lt!213941 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!471815 () Bool)

(declare-fun lt!213936 () Unit!13841)

(declare-fun lt!213939 () Unit!13841)

(assert (=> b!471815 (= lt!213936 lt!213939)))

(declare-fun lt!213935 () ListLongMap!7709)

(declare-fun lt!213940 () (_ BitVec 64))

(declare-fun lt!213937 () (_ BitVec 64))

(declare-fun lt!213938 () V!18747)

(declare-fun +!1746 (ListLongMap!7709 tuple2!8806) ListLongMap!7709)

(assert (=> b!471815 (not (contains!2536 (+!1746 lt!213935 (tuple2!8807 lt!213937 lt!213938)) lt!213940))))

(declare-fun addStillNotContains!164 (ListLongMap!7709 (_ BitVec 64) V!18747 (_ BitVec 64)) Unit!13841)

(assert (=> b!471815 (= lt!213939 (addStillNotContains!164 lt!213935 lt!213937 lt!213938 lt!213940))))

(assert (=> b!471815 (= lt!213940 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!471815 (= lt!213938 (get!7083 (select (arr!14526 _values!833) #b00000000000000000000000000000000) (dynLambda!926 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!471815 (= lt!213937 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30435 () ListLongMap!7709)

(assert (=> b!471815 (= lt!213935 call!30435)))

(assert (=> b!471815 (= e!276584 (+!1746 call!30435 (tuple2!8807 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000) (get!7083 (select (arr!14526 _values!833) #b00000000000000000000000000000000) (dynLambda!926 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!471816 () Bool)

(declare-fun e!276585 () Bool)

(assert (=> b!471816 (= e!276587 e!276585)))

(declare-fun c!56930 () Bool)

(assert (=> b!471816 (= c!56930 (bvslt #b00000000000000000000000000000000 (size!14878 _keys!1025)))))

(declare-fun d!75241 () Bool)

(assert (=> d!75241 e!276586))

(declare-fun res!281869 () Bool)

(assert (=> d!75241 (=> (not res!281869) (not e!276586))))

(assert (=> d!75241 (= res!281869 (not (contains!2536 lt!213941 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75241 (= lt!213941 e!276582)))

(declare-fun c!56931 () Bool)

(assert (=> d!75241 (= c!56931 (bvsge #b00000000000000000000000000000000 (size!14878 _keys!1025)))))

(assert (=> d!75241 (validMask!0 mask!1365)))

(assert (=> d!75241 (= (getCurrentListMapNoExtraKeys!2045 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213941)))

(declare-fun b!471817 () Bool)

(declare-fun isEmpty!581 (ListLongMap!7709) Bool)

(assert (=> b!471817 (= e!276585 (isEmpty!581 lt!213941))))

(declare-fun b!471818 () Bool)

(assert (=> b!471818 (= e!276585 (= lt!213941 (getCurrentListMapNoExtraKeys!2045 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!471819 () Bool)

(declare-fun e!276588 () Bool)

(assert (=> b!471819 (= e!276588 (validKeyInArray!0 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!471819 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!471820 () Bool)

(assert (=> b!471820 (= e!276584 call!30435)))

(declare-fun b!471821 () Bool)

(assert (=> b!471821 (= e!276586 e!276587)))

(declare-fun c!56933 () Bool)

(assert (=> b!471821 (= c!56933 e!276588)))

(declare-fun res!281868 () Bool)

(assert (=> b!471821 (=> (not res!281868) (not e!276588))))

(assert (=> b!471821 (= res!281868 (bvslt #b00000000000000000000000000000000 (size!14878 _keys!1025)))))

(declare-fun b!471822 () Bool)

(assert (=> b!471822 (= e!276582 (ListLongMap!7710 Nil!8877))))

(declare-fun bm!30432 () Bool)

(assert (=> bm!30432 (= call!30435 (getCurrentListMapNoExtraKeys!2045 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(assert (= (and d!75241 c!56931) b!471822))

(assert (= (and d!75241 (not c!56931)) b!471813))

(assert (= (and b!471813 c!56932) b!471815))

(assert (= (and b!471813 (not c!56932)) b!471820))

(assert (= (or b!471815 b!471820) bm!30432))

(assert (= (and d!75241 res!281869) b!471814))

(assert (= (and b!471814 res!281870) b!471821))

(assert (= (and b!471821 res!281868) b!471819))

(assert (= (and b!471821 c!56933) b!471812))

(assert (= (and b!471821 (not c!56933)) b!471816))

(assert (= (and b!471812 res!281867) b!471811))

(assert (= (and b!471816 c!56930) b!471818))

(assert (= (and b!471816 (not c!56930)) b!471817))

(declare-fun b_lambda!10151 () Bool)

(assert (=> (not b_lambda!10151) (not b!471811)))

(declare-fun t!14842 () Bool)

(declare-fun tb!3917 () Bool)

(assert (=> (and start!42284 (= defaultEntry!841 defaultEntry!841) t!14842) tb!3917))

(declare-fun result!7425 () Bool)

(assert (=> tb!3917 (= result!7425 tp_is_empty!13231)))

(assert (=> b!471811 t!14842))

(declare-fun b_and!20221 () Bool)

(assert (= b_and!20215 (and (=> t!14842 result!7425) b_and!20221)))

(declare-fun b_lambda!10153 () Bool)

(assert (=> (not b_lambda!10153) (not b!471815)))

(assert (=> b!471815 t!14842))

(declare-fun b_and!20223 () Bool)

(assert (= b_and!20221 (and (=> t!14842 result!7425) b_and!20223)))

(assert (=> b!471815 m!453357))

(declare-fun m!453375 () Bool)

(assert (=> b!471815 m!453375))

(declare-fun m!453377 () Bool)

(assert (=> b!471815 m!453377))

(declare-fun m!453379 () Bool)

(assert (=> b!471815 m!453379))

(declare-fun m!453381 () Bool)

(assert (=> b!471815 m!453381))

(declare-fun m!453383 () Bool)

(assert (=> b!471815 m!453383))

(assert (=> b!471815 m!453377))

(declare-fun m!453385 () Bool)

(assert (=> b!471815 m!453385))

(assert (=> b!471815 m!453381))

(declare-fun m!453387 () Bool)

(assert (=> b!471815 m!453387))

(assert (=> b!471815 m!453385))

(assert (=> b!471819 m!453357))

(assert (=> b!471819 m!453357))

(assert (=> b!471819 m!453359))

(assert (=> b!471813 m!453357))

(assert (=> b!471813 m!453357))

(assert (=> b!471813 m!453359))

(assert (=> b!471811 m!453357))

(assert (=> b!471811 m!453357))

(declare-fun m!453389 () Bool)

(assert (=> b!471811 m!453389))

(assert (=> b!471811 m!453381))

(assert (=> b!471811 m!453385))

(assert (=> b!471811 m!453381))

(assert (=> b!471811 m!453387))

(assert (=> b!471811 m!453385))

(declare-fun m!453391 () Bool)

(assert (=> b!471818 m!453391))

(declare-fun m!453393 () Bool)

(assert (=> b!471817 m!453393))

(declare-fun m!453395 () Bool)

(assert (=> b!471814 m!453395))

(assert (=> bm!30432 m!453391))

(assert (=> b!471812 m!453357))

(assert (=> b!471812 m!453357))

(declare-fun m!453397 () Bool)

(assert (=> b!471812 m!453397))

(declare-fun m!453399 () Bool)

(assert (=> d!75241 m!453399))

(assert (=> d!75241 m!453313))

(assert (=> b!471714 d!75241))

(declare-fun b!471825 () Bool)

(assert (=> b!471825 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14878 _keys!1025)))))

(assert (=> b!471825 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14879 _values!833)))))

(declare-fun e!276590 () Bool)

(declare-fun lt!213948 () ListLongMap!7709)

(assert (=> b!471825 (= e!276590 (= (apply!330 lt!213948 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000)) (get!7083 (select (arr!14526 _values!833) #b00000000000000000000000000000000) (dynLambda!926 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!471826 () Bool)

(declare-fun e!276594 () Bool)

(assert (=> b!471826 (= e!276594 e!276590)))

(assert (=> b!471826 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14878 _keys!1025)))))

(declare-fun res!281871 () Bool)

(assert (=> b!471826 (= res!281871 (contains!2536 lt!213948 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!471826 (=> (not res!281871) (not e!276590))))

(declare-fun b!471827 () Bool)

(declare-fun e!276589 () ListLongMap!7709)

(declare-fun e!276591 () ListLongMap!7709)

(assert (=> b!471827 (= e!276589 e!276591)))

(declare-fun c!56936 () Bool)

(assert (=> b!471827 (= c!56936 (validKeyInArray!0 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!471828 () Bool)

(declare-fun res!281874 () Bool)

(declare-fun e!276593 () Bool)

(assert (=> b!471828 (=> (not res!281874) (not e!276593))))

(assert (=> b!471828 (= res!281874 (not (contains!2536 lt!213948 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!471829 () Bool)

(declare-fun lt!213943 () Unit!13841)

(declare-fun lt!213946 () Unit!13841)

(assert (=> b!471829 (= lt!213943 lt!213946)))

(declare-fun lt!213944 () (_ BitVec 64))

(declare-fun lt!213947 () (_ BitVec 64))

(declare-fun lt!213942 () ListLongMap!7709)

(declare-fun lt!213945 () V!18747)

(assert (=> b!471829 (not (contains!2536 (+!1746 lt!213942 (tuple2!8807 lt!213944 lt!213945)) lt!213947))))

(assert (=> b!471829 (= lt!213946 (addStillNotContains!164 lt!213942 lt!213944 lt!213945 lt!213947))))

(assert (=> b!471829 (= lt!213947 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!471829 (= lt!213945 (get!7083 (select (arr!14526 _values!833) #b00000000000000000000000000000000) (dynLambda!926 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!471829 (= lt!213944 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30436 () ListLongMap!7709)

(assert (=> b!471829 (= lt!213942 call!30436)))

(assert (=> b!471829 (= e!276591 (+!1746 call!30436 (tuple2!8807 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000) (get!7083 (select (arr!14526 _values!833) #b00000000000000000000000000000000) (dynLambda!926 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!471830 () Bool)

(declare-fun e!276592 () Bool)

(assert (=> b!471830 (= e!276594 e!276592)))

(declare-fun c!56934 () Bool)

(assert (=> b!471830 (= c!56934 (bvslt #b00000000000000000000000000000000 (size!14878 _keys!1025)))))

(declare-fun d!75243 () Bool)

(assert (=> d!75243 e!276593))

(declare-fun res!281873 () Bool)

(assert (=> d!75243 (=> (not res!281873) (not e!276593))))

(assert (=> d!75243 (= res!281873 (not (contains!2536 lt!213948 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75243 (= lt!213948 e!276589)))

(declare-fun c!56935 () Bool)

(assert (=> d!75243 (= c!56935 (bvsge #b00000000000000000000000000000000 (size!14878 _keys!1025)))))

(assert (=> d!75243 (validMask!0 mask!1365)))

(assert (=> d!75243 (= (getCurrentListMapNoExtraKeys!2045 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213948)))

(declare-fun b!471831 () Bool)

(assert (=> b!471831 (= e!276592 (isEmpty!581 lt!213948))))

(declare-fun b!471832 () Bool)

(assert (=> b!471832 (= e!276592 (= lt!213948 (getCurrentListMapNoExtraKeys!2045 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!471833 () Bool)

(declare-fun e!276595 () Bool)

(assert (=> b!471833 (= e!276595 (validKeyInArray!0 (select (arr!14525 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!471833 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!471834 () Bool)

(assert (=> b!471834 (= e!276591 call!30436)))

(declare-fun b!471835 () Bool)

(assert (=> b!471835 (= e!276593 e!276594)))

(declare-fun c!56937 () Bool)

(assert (=> b!471835 (= c!56937 e!276595)))

(declare-fun res!281872 () Bool)

(assert (=> b!471835 (=> (not res!281872) (not e!276595))))

(assert (=> b!471835 (= res!281872 (bvslt #b00000000000000000000000000000000 (size!14878 _keys!1025)))))

(declare-fun b!471836 () Bool)

(assert (=> b!471836 (= e!276589 (ListLongMap!7710 Nil!8877))))

(declare-fun bm!30433 () Bool)

(assert (=> bm!30433 (= call!30436 (getCurrentListMapNoExtraKeys!2045 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(assert (= (and d!75243 c!56935) b!471836))

(assert (= (and d!75243 (not c!56935)) b!471827))

(assert (= (and b!471827 c!56936) b!471829))

(assert (= (and b!471827 (not c!56936)) b!471834))

(assert (= (or b!471829 b!471834) bm!30433))

(assert (= (and d!75243 res!281873) b!471828))

(assert (= (and b!471828 res!281874) b!471835))

(assert (= (and b!471835 res!281872) b!471833))

(assert (= (and b!471835 c!56937) b!471826))

(assert (= (and b!471835 (not c!56937)) b!471830))

(assert (= (and b!471826 res!281871) b!471825))

(assert (= (and b!471830 c!56934) b!471832))

(assert (= (and b!471830 (not c!56934)) b!471831))

(declare-fun b_lambda!10155 () Bool)

(assert (=> (not b_lambda!10155) (not b!471825)))

(assert (=> b!471825 t!14842))

(declare-fun b_and!20225 () Bool)

(assert (= b_and!20223 (and (=> t!14842 result!7425) b_and!20225)))

(declare-fun b_lambda!10157 () Bool)

(assert (=> (not b_lambda!10157) (not b!471829)))

(assert (=> b!471829 t!14842))

(declare-fun b_and!20227 () Bool)

(assert (= b_and!20225 (and (=> t!14842 result!7425) b_and!20227)))

(assert (=> b!471829 m!453357))

(declare-fun m!453401 () Bool)

(assert (=> b!471829 m!453401))

(declare-fun m!453403 () Bool)

(assert (=> b!471829 m!453403))

(declare-fun m!453405 () Bool)

(assert (=> b!471829 m!453405))

(assert (=> b!471829 m!453381))

(declare-fun m!453407 () Bool)

(assert (=> b!471829 m!453407))

(assert (=> b!471829 m!453403))

(assert (=> b!471829 m!453385))

(assert (=> b!471829 m!453381))

(assert (=> b!471829 m!453387))

(assert (=> b!471829 m!453385))

(assert (=> b!471833 m!453357))

(assert (=> b!471833 m!453357))

(assert (=> b!471833 m!453359))

(assert (=> b!471827 m!453357))

(assert (=> b!471827 m!453357))

(assert (=> b!471827 m!453359))

(assert (=> b!471825 m!453357))

(assert (=> b!471825 m!453357))

(declare-fun m!453409 () Bool)

(assert (=> b!471825 m!453409))

(assert (=> b!471825 m!453381))

(assert (=> b!471825 m!453385))

(assert (=> b!471825 m!453381))

(assert (=> b!471825 m!453387))

(assert (=> b!471825 m!453385))

(declare-fun m!453411 () Bool)

(assert (=> b!471832 m!453411))

(declare-fun m!453413 () Bool)

(assert (=> b!471831 m!453413))

(declare-fun m!453415 () Bool)

(assert (=> b!471828 m!453415))

(assert (=> bm!30433 m!453411))

(assert (=> b!471826 m!453357))

(assert (=> b!471826 m!453357))

(declare-fun m!453417 () Bool)

(assert (=> b!471826 m!453417))

(declare-fun m!453419 () Bool)

(assert (=> d!75243 m!453419))

(assert (=> d!75243 m!453313))

(assert (=> b!471714 d!75243))

(declare-fun mapNonEmpty!21562 () Bool)

(declare-fun mapRes!21562 () Bool)

(declare-fun tp!41452 () Bool)

(declare-fun e!276600 () Bool)

(assert (=> mapNonEmpty!21562 (= mapRes!21562 (and tp!41452 e!276600))))

(declare-fun mapValue!21562 () ValueCell!6272)

(declare-fun mapKey!21562 () (_ BitVec 32))

(declare-fun mapRest!21562 () (Array (_ BitVec 32) ValueCell!6272))

(assert (=> mapNonEmpty!21562 (= mapRest!21553 (store mapRest!21562 mapKey!21562 mapValue!21562))))

(declare-fun b!471844 () Bool)

(declare-fun e!276601 () Bool)

(assert (=> b!471844 (= e!276601 tp_is_empty!13231)))

(declare-fun mapIsEmpty!21562 () Bool)

(assert (=> mapIsEmpty!21562 mapRes!21562))

(declare-fun condMapEmpty!21562 () Bool)

(declare-fun mapDefault!21562 () ValueCell!6272)

(assert (=> mapNonEmpty!21553 (= condMapEmpty!21562 (= mapRest!21553 ((as const (Array (_ BitVec 32) ValueCell!6272)) mapDefault!21562)))))

(assert (=> mapNonEmpty!21553 (= tp!41437 (and e!276601 mapRes!21562))))

(declare-fun b!471843 () Bool)

(assert (=> b!471843 (= e!276600 tp_is_empty!13231)))

(assert (= (and mapNonEmpty!21553 condMapEmpty!21562) mapIsEmpty!21562))

(assert (= (and mapNonEmpty!21553 (not condMapEmpty!21562)) mapNonEmpty!21562))

(assert (= (and mapNonEmpty!21562 ((_ is ValueCellFull!6272) mapValue!21562)) b!471843))

(assert (= (and mapNonEmpty!21553 ((_ is ValueCellFull!6272) mapDefault!21562)) b!471844))

(declare-fun m!453421 () Bool)

(assert (=> mapNonEmpty!21562 m!453421))

(declare-fun b_lambda!10159 () Bool)

(assert (= b_lambda!10153 (or (and start!42284 b_free!11803) b_lambda!10159)))

(declare-fun b_lambda!10161 () Bool)

(assert (= b_lambda!10157 (or (and start!42284 b_free!11803) b_lambda!10161)))

(declare-fun b_lambda!10163 () Bool)

(assert (= b_lambda!10151 (or (and start!42284 b_free!11803) b_lambda!10163)))

(declare-fun b_lambda!10165 () Bool)

(assert (= b_lambda!10155 (or (and start!42284 b_free!11803) b_lambda!10165)))

(check-sat (not b_lambda!10159) (not mapNonEmpty!21562) (not d!75243) (not b!471825) (not bm!30433) (not b!471833) (not b!471813) (not b!471818) (not b_lambda!10165) (not b_next!11803) (not b!471814) (not bm!30426) (not b!471773) (not d!75239) (not b!471772) (not b!471774) (not b!471811) (not d!75241) (not b!471831) (not bm!30432) (not b_lambda!10161) (not b!471827) (not b!471812) (not b!471784) (not b!471786) (not b!471817) (not b!471819) (not b!471826) (not b!471832) (not b!471828) (not b!471815) tp_is_empty!13231 b_and!20227 (not bm!30429) (not b!471829) (not b_lambda!10163))
(check-sat b_and!20227 (not b_next!11803))
