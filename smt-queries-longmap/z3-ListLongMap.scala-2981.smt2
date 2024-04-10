; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42164 () Bool)

(assert start!42164)

(declare-fun b_free!11697 () Bool)

(declare-fun b_next!11697 () Bool)

(assert (=> start!42164 (= b_free!11697 (not b_next!11697))))

(declare-fun tp!41113 () Bool)

(declare-fun b_and!20119 () Bool)

(assert (=> start!42164 (= tp!41113 b_and!20119)))

(declare-fun b!470699 () Bool)

(declare-fun e!275781 () Bool)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!30017 0))(
  ( (array!30018 (arr!14432 (Array (_ BitVec 32) (_ BitVec 64))) (size!14784 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30017)

(assert (=> b!470699 (= e!275781 (not (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!14784 _keys!1025)))))))

(declare-datatypes ((V!18605 0))(
  ( (V!18606 (val!6607 Int)) )
))
(declare-datatypes ((tuple2!8702 0))(
  ( (tuple2!8703 (_1!4362 (_ BitVec 64)) (_2!4362 V!18605)) )
))
(declare-datatypes ((List!8781 0))(
  ( (Nil!8778) (Cons!8777 (h!9633 tuple2!8702) (t!14743 List!8781)) )
))
(declare-datatypes ((ListLongMap!7615 0))(
  ( (ListLongMap!7616 (toList!3823 List!8781)) )
))
(declare-fun lt!213565 () ListLongMap!7615)

(declare-fun lt!213567 () ListLongMap!7615)

(assert (=> b!470699 (= lt!213565 lt!213567)))

(declare-fun minValueBefore!38 () V!18605)

(declare-fun zeroValue!794 () V!18605)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13805 0))(
  ( (Unit!13806) )
))
(declare-fun lt!213566 () Unit!13805)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6219 0))(
  ( (ValueCellFull!6219 (v!8898 V!18605)) (EmptyCell!6219) )
))
(declare-datatypes ((array!30019 0))(
  ( (array!30020 (arr!14433 (Array (_ BitVec 32) ValueCell!6219)) (size!14785 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30019)

(declare-fun minValueAfter!38 () V!18605)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!166 (array!30017 array!30019 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18605 V!18605 V!18605 V!18605 (_ BitVec 32) Int) Unit!13805)

(assert (=> b!470699 (= lt!213566 (lemmaNoChangeToArrayThenSameMapNoExtras!166 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1986 (array!30017 array!30019 (_ BitVec 32) (_ BitVec 32) V!18605 V!18605 (_ BitVec 32) Int) ListLongMap!7615)

(assert (=> b!470699 (= lt!213567 (getCurrentListMapNoExtraKeys!1986 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470699 (= lt!213565 (getCurrentListMapNoExtraKeys!1986 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!281247 () Bool)

(assert (=> start!42164 (=> (not res!281247) (not e!275781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42164 (= res!281247 (validMask!0 mask!1365))))

(assert (=> start!42164 e!275781))

(declare-fun tp_is_empty!13125 () Bool)

(assert (=> start!42164 tp_is_empty!13125))

(assert (=> start!42164 tp!41113))

(assert (=> start!42164 true))

(declare-fun array_inv!10412 (array!30017) Bool)

(assert (=> start!42164 (array_inv!10412 _keys!1025)))

(declare-fun e!275785 () Bool)

(declare-fun array_inv!10413 (array!30019) Bool)

(assert (=> start!42164 (and (array_inv!10413 _values!833) e!275785)))

(declare-fun b!470700 () Bool)

(declare-fun res!281250 () Bool)

(assert (=> b!470700 (=> (not res!281250) (not e!275781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30017 (_ BitVec 32)) Bool)

(assert (=> b!470700 (= res!281250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470701 () Bool)

(declare-fun e!275782 () Bool)

(declare-fun mapRes!21388 () Bool)

(assert (=> b!470701 (= e!275785 (and e!275782 mapRes!21388))))

(declare-fun condMapEmpty!21388 () Bool)

(declare-fun mapDefault!21388 () ValueCell!6219)

(assert (=> b!470701 (= condMapEmpty!21388 (= (arr!14433 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6219)) mapDefault!21388)))))

(declare-fun mapNonEmpty!21388 () Bool)

(declare-fun tp!41112 () Bool)

(declare-fun e!275783 () Bool)

(assert (=> mapNonEmpty!21388 (= mapRes!21388 (and tp!41112 e!275783))))

(declare-fun mapRest!21388 () (Array (_ BitVec 32) ValueCell!6219))

(declare-fun mapValue!21388 () ValueCell!6219)

(declare-fun mapKey!21388 () (_ BitVec 32))

(assert (=> mapNonEmpty!21388 (= (arr!14433 _values!833) (store mapRest!21388 mapKey!21388 mapValue!21388))))

(declare-fun b!470702 () Bool)

(assert (=> b!470702 (= e!275783 tp_is_empty!13125)))

(declare-fun b!470703 () Bool)

(declare-fun res!281249 () Bool)

(assert (=> b!470703 (=> (not res!281249) (not e!275781))))

(declare-datatypes ((List!8782 0))(
  ( (Nil!8779) (Cons!8778 (h!9634 (_ BitVec 64)) (t!14744 List!8782)) )
))
(declare-fun arrayNoDuplicates!0 (array!30017 (_ BitVec 32) List!8782) Bool)

(assert (=> b!470703 (= res!281249 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8779))))

(declare-fun b!470704 () Bool)

(assert (=> b!470704 (= e!275782 tp_is_empty!13125)))

(declare-fun b!470705 () Bool)

(declare-fun res!281248 () Bool)

(assert (=> b!470705 (=> (not res!281248) (not e!275781))))

(assert (=> b!470705 (= res!281248 (and (= (size!14785 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14784 _keys!1025) (size!14785 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21388 () Bool)

(assert (=> mapIsEmpty!21388 mapRes!21388))

(assert (= (and start!42164 res!281247) b!470705))

(assert (= (and b!470705 res!281248) b!470700))

(assert (= (and b!470700 res!281250) b!470703))

(assert (= (and b!470703 res!281249) b!470699))

(assert (= (and b!470701 condMapEmpty!21388) mapIsEmpty!21388))

(assert (= (and b!470701 (not condMapEmpty!21388)) mapNonEmpty!21388))

(get-info :version)

(assert (= (and mapNonEmpty!21388 ((_ is ValueCellFull!6219) mapValue!21388)) b!470702))

(assert (= (and b!470701 ((_ is ValueCellFull!6219) mapDefault!21388)) b!470704))

(assert (= start!42164 b!470701))

(declare-fun m!452951 () Bool)

(assert (=> b!470700 m!452951))

(declare-fun m!452953 () Bool)

(assert (=> b!470703 m!452953))

(declare-fun m!452955 () Bool)

(assert (=> b!470699 m!452955))

(declare-fun m!452957 () Bool)

(assert (=> b!470699 m!452957))

(declare-fun m!452959 () Bool)

(assert (=> b!470699 m!452959))

(declare-fun m!452961 () Bool)

(assert (=> mapNonEmpty!21388 m!452961))

(declare-fun m!452963 () Bool)

(assert (=> start!42164 m!452963))

(declare-fun m!452965 () Bool)

(assert (=> start!42164 m!452965))

(declare-fun m!452967 () Bool)

(assert (=> start!42164 m!452967))

(check-sat (not b!470699) (not b!470703) (not b!470700) tp_is_empty!13125 b_and!20119 (not mapNonEmpty!21388) (not start!42164) (not b_next!11697))
(check-sat b_and!20119 (not b_next!11697))
(get-model)

(declare-fun b!470735 () Bool)

(declare-fun e!275807 () Bool)

(declare-fun call!30434 () Bool)

(assert (=> b!470735 (= e!275807 call!30434)))

(declare-fun b!470736 () Bool)

(declare-fun e!275808 () Bool)

(assert (=> b!470736 (= e!275808 e!275807)))

(declare-fun lt!213583 () (_ BitVec 64))

(assert (=> b!470736 (= lt!213583 (select (arr!14432 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213585 () Unit!13805)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30017 (_ BitVec 64) (_ BitVec 32)) Unit!13805)

(assert (=> b!470736 (= lt!213585 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!213583 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!470736 (arrayContainsKey!0 _keys!1025 lt!213583 #b00000000000000000000000000000000)))

(declare-fun lt!213584 () Unit!13805)

(assert (=> b!470736 (= lt!213584 lt!213585)))

(declare-fun res!281268 () Bool)

(declare-datatypes ((SeekEntryResult!3552 0))(
  ( (MissingZero!3552 (index!16387 (_ BitVec 32))) (Found!3552 (index!16388 (_ BitVec 32))) (Intermediate!3552 (undefined!4364 Bool) (index!16389 (_ BitVec 32)) (x!44088 (_ BitVec 32))) (Undefined!3552) (MissingVacant!3552 (index!16390 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30017 (_ BitVec 32)) SeekEntryResult!3552)

(assert (=> b!470736 (= res!281268 (= (seekEntryOrOpen!0 (select (arr!14432 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3552 #b00000000000000000000000000000000)))))

(assert (=> b!470736 (=> (not res!281268) (not e!275807))))

(declare-fun d!75365 () Bool)

(declare-fun res!281267 () Bool)

(declare-fun e!275809 () Bool)

(assert (=> d!75365 (=> res!281267 e!275809)))

(assert (=> d!75365 (= res!281267 (bvsge #b00000000000000000000000000000000 (size!14784 _keys!1025)))))

(assert (=> d!75365 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!275809)))

(declare-fun b!470737 () Bool)

(assert (=> b!470737 (= e!275809 e!275808)))

(declare-fun c!56945 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!470737 (= c!56945 (validKeyInArray!0 (select (arr!14432 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!470738 () Bool)

(assert (=> b!470738 (= e!275808 call!30434)))

(declare-fun bm!30431 () Bool)

(assert (=> bm!30431 (= call!30434 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(assert (= (and d!75365 (not res!281267)) b!470737))

(assert (= (and b!470737 c!56945) b!470736))

(assert (= (and b!470737 (not c!56945)) b!470738))

(assert (= (and b!470736 res!281268) b!470735))

(assert (= (or b!470735 b!470738) bm!30431))

(declare-fun m!452987 () Bool)

(assert (=> b!470736 m!452987))

(declare-fun m!452989 () Bool)

(assert (=> b!470736 m!452989))

(declare-fun m!452991 () Bool)

(assert (=> b!470736 m!452991))

(assert (=> b!470736 m!452987))

(declare-fun m!452993 () Bool)

(assert (=> b!470736 m!452993))

(assert (=> b!470737 m!452987))

(assert (=> b!470737 m!452987))

(declare-fun m!452995 () Bool)

(assert (=> b!470737 m!452995))

(declare-fun m!452997 () Bool)

(assert (=> bm!30431 m!452997))

(assert (=> b!470700 d!75365))

(declare-fun b!470749 () Bool)

(declare-fun e!275821 () Bool)

(declare-fun e!275819 () Bool)

(assert (=> b!470749 (= e!275821 e!275819)))

(declare-fun res!281276 () Bool)

(assert (=> b!470749 (=> (not res!281276) (not e!275819))))

(declare-fun e!275818 () Bool)

(assert (=> b!470749 (= res!281276 (not e!275818))))

(declare-fun res!281277 () Bool)

(assert (=> b!470749 (=> (not res!281277) (not e!275818))))

(assert (=> b!470749 (= res!281277 (validKeyInArray!0 (select (arr!14432 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!470750 () Bool)

(declare-fun e!275820 () Bool)

(assert (=> b!470750 (= e!275819 e!275820)))

(declare-fun c!56948 () Bool)

(assert (=> b!470750 (= c!56948 (validKeyInArray!0 (select (arr!14432 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75367 () Bool)

(declare-fun res!281275 () Bool)

(assert (=> d!75367 (=> res!281275 e!275821)))

(assert (=> d!75367 (= res!281275 (bvsge #b00000000000000000000000000000000 (size!14784 _keys!1025)))))

(assert (=> d!75367 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8779) e!275821)))

(declare-fun bm!30434 () Bool)

(declare-fun call!30437 () Bool)

(assert (=> bm!30434 (= call!30437 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56948 (Cons!8778 (select (arr!14432 _keys!1025) #b00000000000000000000000000000000) Nil!8779) Nil!8779)))))

(declare-fun b!470751 () Bool)

(assert (=> b!470751 (= e!275820 call!30437)))

(declare-fun b!470752 () Bool)

(declare-fun contains!2540 (List!8782 (_ BitVec 64)) Bool)

(assert (=> b!470752 (= e!275818 (contains!2540 Nil!8779 (select (arr!14432 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!470753 () Bool)

(assert (=> b!470753 (= e!275820 call!30437)))

(assert (= (and d!75367 (not res!281275)) b!470749))

(assert (= (and b!470749 res!281277) b!470752))

(assert (= (and b!470749 res!281276) b!470750))

(assert (= (and b!470750 c!56948) b!470753))

(assert (= (and b!470750 (not c!56948)) b!470751))

(assert (= (or b!470753 b!470751) bm!30434))

(assert (=> b!470749 m!452987))

(assert (=> b!470749 m!452987))

(assert (=> b!470749 m!452995))

(assert (=> b!470750 m!452987))

(assert (=> b!470750 m!452987))

(assert (=> b!470750 m!452995))

(assert (=> bm!30434 m!452987))

(declare-fun m!452999 () Bool)

(assert (=> bm!30434 m!452999))

(assert (=> b!470752 m!452987))

(assert (=> b!470752 m!452987))

(declare-fun m!453001 () Bool)

(assert (=> b!470752 m!453001))

(assert (=> b!470703 d!75367))

(declare-fun d!75369 () Bool)

(assert (=> d!75369 (= (getCurrentListMapNoExtraKeys!1986 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1986 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213588 () Unit!13805)

(declare-fun choose!1347 (array!30017 array!30019 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18605 V!18605 V!18605 V!18605 (_ BitVec 32) Int) Unit!13805)

(assert (=> d!75369 (= lt!213588 (choose!1347 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75369 (validMask!0 mask!1365)))

(assert (=> d!75369 (= (lemmaNoChangeToArrayThenSameMapNoExtras!166 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213588)))

(declare-fun bs!14920 () Bool)

(assert (= bs!14920 d!75369))

(assert (=> bs!14920 m!452959))

(assert (=> bs!14920 m!452957))

(declare-fun m!453003 () Bool)

(assert (=> bs!14920 m!453003))

(assert (=> bs!14920 m!452963))

(assert (=> b!470699 d!75369))

(declare-fun b!470779 () Bool)

(assert (=> b!470779 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14784 _keys!1025)))))

(assert (=> b!470779 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14785 _values!833)))))

(declare-fun e!275837 () Bool)

(declare-fun lt!213604 () ListLongMap!7615)

(declare-fun apply!328 (ListLongMap!7615 (_ BitVec 64)) V!18605)

(declare-fun get!7039 (ValueCell!6219 V!18605) V!18605)

(declare-fun dynLambda!921 (Int (_ BitVec 64)) V!18605)

(assert (=> b!470779 (= e!275837 (= (apply!328 lt!213604 (select (arr!14432 _keys!1025) #b00000000000000000000000000000000)) (get!7039 (select (arr!14433 _values!833) #b00000000000000000000000000000000) (dynLambda!921 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!470780 () Bool)

(declare-fun e!275840 () ListLongMap!7615)

(assert (=> b!470780 (= e!275840 (ListLongMap!7616 Nil!8778))))

(declare-fun b!470781 () Bool)

(declare-fun e!275838 () ListLongMap!7615)

(declare-fun call!30440 () ListLongMap!7615)

(assert (=> b!470781 (= e!275838 call!30440)))

(declare-fun b!470782 () Bool)

(declare-fun e!275839 () Bool)

(assert (=> b!470782 (= e!275839 (= lt!213604 (getCurrentListMapNoExtraKeys!1986 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!470783 () Bool)

(declare-fun e!275836 () Bool)

(assert (=> b!470783 (= e!275836 e!275837)))

(assert (=> b!470783 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14784 _keys!1025)))))

(declare-fun res!281287 () Bool)

(declare-fun contains!2541 (ListLongMap!7615 (_ BitVec 64)) Bool)

(assert (=> b!470783 (= res!281287 (contains!2541 lt!213604 (select (arr!14432 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!470783 (=> (not res!281287) (not e!275837))))

(declare-fun b!470784 () Bool)

(assert (=> b!470784 (= e!275840 e!275838)))

(declare-fun c!56960 () Bool)

(assert (=> b!470784 (= c!56960 (validKeyInArray!0 (select (arr!14432 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!470778 () Bool)

(declare-fun e!275842 () Bool)

(assert (=> b!470778 (= e!275842 e!275836)))

(declare-fun c!56959 () Bool)

(declare-fun e!275841 () Bool)

(assert (=> b!470778 (= c!56959 e!275841)))

(declare-fun res!281289 () Bool)

(assert (=> b!470778 (=> (not res!281289) (not e!275841))))

(assert (=> b!470778 (= res!281289 (bvslt #b00000000000000000000000000000000 (size!14784 _keys!1025)))))

(declare-fun d!75371 () Bool)

(assert (=> d!75371 e!275842))

(declare-fun res!281288 () Bool)

(assert (=> d!75371 (=> (not res!281288) (not e!275842))))

(assert (=> d!75371 (= res!281288 (not (contains!2541 lt!213604 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75371 (= lt!213604 e!275840)))

(declare-fun c!56958 () Bool)

(assert (=> d!75371 (= c!56958 (bvsge #b00000000000000000000000000000000 (size!14784 _keys!1025)))))

(assert (=> d!75371 (validMask!0 mask!1365)))

(assert (=> d!75371 (= (getCurrentListMapNoExtraKeys!1986 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213604)))

(declare-fun b!470785 () Bool)

(assert (=> b!470785 (= e!275836 e!275839)))

(declare-fun c!56957 () Bool)

(assert (=> b!470785 (= c!56957 (bvslt #b00000000000000000000000000000000 (size!14784 _keys!1025)))))

(declare-fun b!470786 () Bool)

(declare-fun res!281286 () Bool)

(assert (=> b!470786 (=> (not res!281286) (not e!275842))))

(assert (=> b!470786 (= res!281286 (not (contains!2541 lt!213604 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!30437 () Bool)

(assert (=> bm!30437 (= call!30440 (getCurrentListMapNoExtraKeys!1986 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!470787 () Bool)

(declare-fun lt!213609 () Unit!13805)

(declare-fun lt!213608 () Unit!13805)

(assert (=> b!470787 (= lt!213609 lt!213608)))

(declare-fun lt!213605 () (_ BitVec 64))

(declare-fun lt!213606 () (_ BitVec 64))

(declare-fun lt!213607 () V!18605)

(declare-fun lt!213603 () ListLongMap!7615)

(declare-fun +!1714 (ListLongMap!7615 tuple2!8702) ListLongMap!7615)

(assert (=> b!470787 (not (contains!2541 (+!1714 lt!213603 (tuple2!8703 lt!213606 lt!213607)) lt!213605))))

(declare-fun addStillNotContains!161 (ListLongMap!7615 (_ BitVec 64) V!18605 (_ BitVec 64)) Unit!13805)

(assert (=> b!470787 (= lt!213608 (addStillNotContains!161 lt!213603 lt!213606 lt!213607 lt!213605))))

(assert (=> b!470787 (= lt!213605 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!470787 (= lt!213607 (get!7039 (select (arr!14433 _values!833) #b00000000000000000000000000000000) (dynLambda!921 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!470787 (= lt!213606 (select (arr!14432 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!470787 (= lt!213603 call!30440)))

(assert (=> b!470787 (= e!275838 (+!1714 call!30440 (tuple2!8703 (select (arr!14432 _keys!1025) #b00000000000000000000000000000000) (get!7039 (select (arr!14433 _values!833) #b00000000000000000000000000000000) (dynLambda!921 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!470788 () Bool)

(assert (=> b!470788 (= e!275841 (validKeyInArray!0 (select (arr!14432 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!470788 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!470789 () Bool)

(declare-fun isEmpty!575 (ListLongMap!7615) Bool)

(assert (=> b!470789 (= e!275839 (isEmpty!575 lt!213604))))

(assert (= (and d!75371 c!56958) b!470780))

(assert (= (and d!75371 (not c!56958)) b!470784))

(assert (= (and b!470784 c!56960) b!470787))

(assert (= (and b!470784 (not c!56960)) b!470781))

(assert (= (or b!470787 b!470781) bm!30437))

(assert (= (and d!75371 res!281288) b!470786))

(assert (= (and b!470786 res!281286) b!470778))

(assert (= (and b!470778 res!281289) b!470788))

(assert (= (and b!470778 c!56959) b!470783))

(assert (= (and b!470778 (not c!56959)) b!470785))

(assert (= (and b!470783 res!281287) b!470779))

(assert (= (and b!470785 c!56957) b!470782))

(assert (= (and b!470785 (not c!56957)) b!470789))

(declare-fun b_lambda!10137 () Bool)

(assert (=> (not b_lambda!10137) (not b!470779)))

(declare-fun t!14747 () Bool)

(declare-fun tb!3921 () Bool)

(assert (=> (and start!42164 (= defaultEntry!841 defaultEntry!841) t!14747) tb!3921))

(declare-fun result!7421 () Bool)

(assert (=> tb!3921 (= result!7421 tp_is_empty!13125)))

(assert (=> b!470779 t!14747))

(declare-fun b_and!20123 () Bool)

(assert (= b_and!20119 (and (=> t!14747 result!7421) b_and!20123)))

(declare-fun b_lambda!10139 () Bool)

(assert (=> (not b_lambda!10139) (not b!470787)))

(assert (=> b!470787 t!14747))

(declare-fun b_and!20125 () Bool)

(assert (= b_and!20123 (and (=> t!14747 result!7421) b_and!20125)))

(declare-fun m!453005 () Bool)

(assert (=> b!470786 m!453005))

(assert (=> b!470784 m!452987))

(assert (=> b!470784 m!452987))

(assert (=> b!470784 m!452995))

(declare-fun m!453007 () Bool)

(assert (=> b!470789 m!453007))

(declare-fun m!453009 () Bool)

(assert (=> b!470787 m!453009))

(declare-fun m!453011 () Bool)

(assert (=> b!470787 m!453011))

(declare-fun m!453013 () Bool)

(assert (=> b!470787 m!453013))

(declare-fun m!453015 () Bool)

(assert (=> b!470787 m!453015))

(assert (=> b!470787 m!453009))

(assert (=> b!470787 m!453011))

(declare-fun m!453017 () Bool)

(assert (=> b!470787 m!453017))

(assert (=> b!470787 m!453013))

(declare-fun m!453019 () Bool)

(assert (=> b!470787 m!453019))

(assert (=> b!470787 m!452987))

(declare-fun m!453021 () Bool)

(assert (=> b!470787 m!453021))

(declare-fun m!453023 () Bool)

(assert (=> b!470782 m!453023))

(declare-fun m!453025 () Bool)

(assert (=> d!75371 m!453025))

(assert (=> d!75371 m!452963))

(assert (=> b!470788 m!452987))

(assert (=> b!470788 m!452987))

(assert (=> b!470788 m!452995))

(assert (=> b!470779 m!452987))

(declare-fun m!453027 () Bool)

(assert (=> b!470779 m!453027))

(assert (=> b!470779 m!453009))

(assert (=> b!470779 m!453011))

(assert (=> b!470779 m!452987))

(assert (=> b!470779 m!453009))

(assert (=> b!470779 m!453011))

(assert (=> b!470779 m!453017))

(assert (=> b!470783 m!452987))

(assert (=> b!470783 m!452987))

(declare-fun m!453029 () Bool)

(assert (=> b!470783 m!453029))

(assert (=> bm!30437 m!453023))

(assert (=> b!470699 d!75371))

(declare-fun b!470793 () Bool)

(assert (=> b!470793 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14784 _keys!1025)))))

(assert (=> b!470793 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14785 _values!833)))))

(declare-fun lt!213611 () ListLongMap!7615)

(declare-fun e!275844 () Bool)

(assert (=> b!470793 (= e!275844 (= (apply!328 lt!213611 (select (arr!14432 _keys!1025) #b00000000000000000000000000000000)) (get!7039 (select (arr!14433 _values!833) #b00000000000000000000000000000000) (dynLambda!921 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!470794 () Bool)

(declare-fun e!275847 () ListLongMap!7615)

(assert (=> b!470794 (= e!275847 (ListLongMap!7616 Nil!8778))))

(declare-fun b!470795 () Bool)

(declare-fun e!275845 () ListLongMap!7615)

(declare-fun call!30441 () ListLongMap!7615)

(assert (=> b!470795 (= e!275845 call!30441)))

(declare-fun e!275846 () Bool)

(declare-fun b!470796 () Bool)

(assert (=> b!470796 (= e!275846 (= lt!213611 (getCurrentListMapNoExtraKeys!1986 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!470797 () Bool)

(declare-fun e!275843 () Bool)

(assert (=> b!470797 (= e!275843 e!275844)))

(assert (=> b!470797 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14784 _keys!1025)))))

(declare-fun res!281291 () Bool)

(assert (=> b!470797 (= res!281291 (contains!2541 lt!213611 (select (arr!14432 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!470797 (=> (not res!281291) (not e!275844))))

(declare-fun b!470798 () Bool)

(assert (=> b!470798 (= e!275847 e!275845)))

(declare-fun c!56964 () Bool)

(assert (=> b!470798 (= c!56964 (validKeyInArray!0 (select (arr!14432 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!470792 () Bool)

(declare-fun e!275849 () Bool)

(assert (=> b!470792 (= e!275849 e!275843)))

(declare-fun c!56963 () Bool)

(declare-fun e!275848 () Bool)

(assert (=> b!470792 (= c!56963 e!275848)))

(declare-fun res!281293 () Bool)

(assert (=> b!470792 (=> (not res!281293) (not e!275848))))

(assert (=> b!470792 (= res!281293 (bvslt #b00000000000000000000000000000000 (size!14784 _keys!1025)))))

(declare-fun d!75373 () Bool)

(assert (=> d!75373 e!275849))

(declare-fun res!281292 () Bool)

(assert (=> d!75373 (=> (not res!281292) (not e!275849))))

(assert (=> d!75373 (= res!281292 (not (contains!2541 lt!213611 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75373 (= lt!213611 e!275847)))

(declare-fun c!56962 () Bool)

(assert (=> d!75373 (= c!56962 (bvsge #b00000000000000000000000000000000 (size!14784 _keys!1025)))))

(assert (=> d!75373 (validMask!0 mask!1365)))

(assert (=> d!75373 (= (getCurrentListMapNoExtraKeys!1986 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213611)))

(declare-fun b!470799 () Bool)

(assert (=> b!470799 (= e!275843 e!275846)))

(declare-fun c!56961 () Bool)

(assert (=> b!470799 (= c!56961 (bvslt #b00000000000000000000000000000000 (size!14784 _keys!1025)))))

(declare-fun b!470800 () Bool)

(declare-fun res!281290 () Bool)

(assert (=> b!470800 (=> (not res!281290) (not e!275849))))

(assert (=> b!470800 (= res!281290 (not (contains!2541 lt!213611 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!30438 () Bool)

(assert (=> bm!30438 (= call!30441 (getCurrentListMapNoExtraKeys!1986 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!470801 () Bool)

(declare-fun lt!213616 () Unit!13805)

(declare-fun lt!213615 () Unit!13805)

(assert (=> b!470801 (= lt!213616 lt!213615)))

(declare-fun lt!213610 () ListLongMap!7615)

(declare-fun lt!213612 () (_ BitVec 64))

(declare-fun lt!213614 () V!18605)

(declare-fun lt!213613 () (_ BitVec 64))

(assert (=> b!470801 (not (contains!2541 (+!1714 lt!213610 (tuple2!8703 lt!213613 lt!213614)) lt!213612))))

(assert (=> b!470801 (= lt!213615 (addStillNotContains!161 lt!213610 lt!213613 lt!213614 lt!213612))))

(assert (=> b!470801 (= lt!213612 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!470801 (= lt!213614 (get!7039 (select (arr!14433 _values!833) #b00000000000000000000000000000000) (dynLambda!921 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!470801 (= lt!213613 (select (arr!14432 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!470801 (= lt!213610 call!30441)))

(assert (=> b!470801 (= e!275845 (+!1714 call!30441 (tuple2!8703 (select (arr!14432 _keys!1025) #b00000000000000000000000000000000) (get!7039 (select (arr!14433 _values!833) #b00000000000000000000000000000000) (dynLambda!921 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!470802 () Bool)

(assert (=> b!470802 (= e!275848 (validKeyInArray!0 (select (arr!14432 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!470802 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!470803 () Bool)

(assert (=> b!470803 (= e!275846 (isEmpty!575 lt!213611))))

(assert (= (and d!75373 c!56962) b!470794))

(assert (= (and d!75373 (not c!56962)) b!470798))

(assert (= (and b!470798 c!56964) b!470801))

(assert (= (and b!470798 (not c!56964)) b!470795))

(assert (= (or b!470801 b!470795) bm!30438))

(assert (= (and d!75373 res!281292) b!470800))

(assert (= (and b!470800 res!281290) b!470792))

(assert (= (and b!470792 res!281293) b!470802))

(assert (= (and b!470792 c!56963) b!470797))

(assert (= (and b!470792 (not c!56963)) b!470799))

(assert (= (and b!470797 res!281291) b!470793))

(assert (= (and b!470799 c!56961) b!470796))

(assert (= (and b!470799 (not c!56961)) b!470803))

(declare-fun b_lambda!10141 () Bool)

(assert (=> (not b_lambda!10141) (not b!470793)))

(assert (=> b!470793 t!14747))

(declare-fun b_and!20127 () Bool)

(assert (= b_and!20125 (and (=> t!14747 result!7421) b_and!20127)))

(declare-fun b_lambda!10143 () Bool)

(assert (=> (not b_lambda!10143) (not b!470801)))

(assert (=> b!470801 t!14747))

(declare-fun b_and!20129 () Bool)

(assert (= b_and!20127 (and (=> t!14747 result!7421) b_and!20129)))

(declare-fun m!453031 () Bool)

(assert (=> b!470800 m!453031))

(assert (=> b!470798 m!452987))

(assert (=> b!470798 m!452987))

(assert (=> b!470798 m!452995))

(declare-fun m!453033 () Bool)

(assert (=> b!470803 m!453033))

(assert (=> b!470801 m!453009))

(assert (=> b!470801 m!453011))

(declare-fun m!453035 () Bool)

(assert (=> b!470801 m!453035))

(declare-fun m!453037 () Bool)

(assert (=> b!470801 m!453037))

(assert (=> b!470801 m!453009))

(assert (=> b!470801 m!453011))

(assert (=> b!470801 m!453017))

(assert (=> b!470801 m!453035))

(declare-fun m!453039 () Bool)

(assert (=> b!470801 m!453039))

(assert (=> b!470801 m!452987))

(declare-fun m!453041 () Bool)

(assert (=> b!470801 m!453041))

(declare-fun m!453043 () Bool)

(assert (=> b!470796 m!453043))

(declare-fun m!453045 () Bool)

(assert (=> d!75373 m!453045))

(assert (=> d!75373 m!452963))

(assert (=> b!470802 m!452987))

(assert (=> b!470802 m!452987))

(assert (=> b!470802 m!452995))

(assert (=> b!470793 m!452987))

(declare-fun m!453047 () Bool)

(assert (=> b!470793 m!453047))

(assert (=> b!470793 m!453009))

(assert (=> b!470793 m!453011))

(assert (=> b!470793 m!452987))

(assert (=> b!470793 m!453009))

(assert (=> b!470793 m!453011))

(assert (=> b!470793 m!453017))

(assert (=> b!470797 m!452987))

(assert (=> b!470797 m!452987))

(declare-fun m!453049 () Bool)

(assert (=> b!470797 m!453049))

(assert (=> bm!30438 m!453043))

(assert (=> b!470699 d!75373))

(declare-fun d!75375 () Bool)

(assert (=> d!75375 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42164 d!75375))

(declare-fun d!75377 () Bool)

(assert (=> d!75377 (= (array_inv!10412 _keys!1025) (bvsge (size!14784 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42164 d!75377))

(declare-fun d!75379 () Bool)

(assert (=> d!75379 (= (array_inv!10413 _values!833) (bvsge (size!14785 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42164 d!75379))

(declare-fun b!470811 () Bool)

(declare-fun e!275854 () Bool)

(assert (=> b!470811 (= e!275854 tp_is_empty!13125)))

(declare-fun b!470810 () Bool)

(declare-fun e!275855 () Bool)

(assert (=> b!470810 (= e!275855 tp_is_empty!13125)))

(declare-fun condMapEmpty!21394 () Bool)

(declare-fun mapDefault!21394 () ValueCell!6219)

(assert (=> mapNonEmpty!21388 (= condMapEmpty!21394 (= mapRest!21388 ((as const (Array (_ BitVec 32) ValueCell!6219)) mapDefault!21394)))))

(declare-fun mapRes!21394 () Bool)

(assert (=> mapNonEmpty!21388 (= tp!41112 (and e!275854 mapRes!21394))))

(declare-fun mapIsEmpty!21394 () Bool)

(assert (=> mapIsEmpty!21394 mapRes!21394))

(declare-fun mapNonEmpty!21394 () Bool)

(declare-fun tp!41122 () Bool)

(assert (=> mapNonEmpty!21394 (= mapRes!21394 (and tp!41122 e!275855))))

(declare-fun mapKey!21394 () (_ BitVec 32))

(declare-fun mapValue!21394 () ValueCell!6219)

(declare-fun mapRest!21394 () (Array (_ BitVec 32) ValueCell!6219))

(assert (=> mapNonEmpty!21394 (= mapRest!21388 (store mapRest!21394 mapKey!21394 mapValue!21394))))

(assert (= (and mapNonEmpty!21388 condMapEmpty!21394) mapIsEmpty!21394))

(assert (= (and mapNonEmpty!21388 (not condMapEmpty!21394)) mapNonEmpty!21394))

(assert (= (and mapNonEmpty!21394 ((_ is ValueCellFull!6219) mapValue!21394)) b!470810))

(assert (= (and mapNonEmpty!21388 ((_ is ValueCellFull!6219) mapDefault!21394)) b!470811))

(declare-fun m!453051 () Bool)

(assert (=> mapNonEmpty!21394 m!453051))

(declare-fun b_lambda!10145 () Bool)

(assert (= b_lambda!10137 (or (and start!42164 b_free!11697) b_lambda!10145)))

(declare-fun b_lambda!10147 () Bool)

(assert (= b_lambda!10141 (or (and start!42164 b_free!11697) b_lambda!10147)))

(declare-fun b_lambda!10149 () Bool)

(assert (= b_lambda!10143 (or (and start!42164 b_free!11697) b_lambda!10149)))

(declare-fun b_lambda!10151 () Bool)

(assert (= b_lambda!10139 (or (and start!42164 b_free!11697) b_lambda!10151)))

(check-sat (not b!470788) (not b!470752) (not bm!30438) (not b_lambda!10147) (not b!470784) (not b!470802) (not b!470783) (not b!470803) (not b_next!11697) (not b!470750) (not d!75369) (not b_lambda!10145) (not b!470797) (not b_lambda!10149) (not b!470779) (not b!470801) (not b!470749) (not b!470800) (not bm!30434) (not d!75371) (not b!470786) (not b!470789) (not b!470796) (not bm!30431) (not d!75373) (not b!470798) tp_is_empty!13125 (not b!470782) b_and!20129 (not b!470737) (not b!470787) (not b!470736) (not mapNonEmpty!21394) (not b!470793) (not b_lambda!10151) (not bm!30437))
(check-sat b_and!20129 (not b_next!11697))
