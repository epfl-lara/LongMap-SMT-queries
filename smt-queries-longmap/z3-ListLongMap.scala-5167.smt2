; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69978 () Bool)

(assert start!69978)

(declare-fun b_free!12411 () Bool)

(declare-fun b_next!12411 () Bool)

(assert (=> start!69978 (= b_free!12411 (not b_next!12411))))

(declare-fun tp!43944 () Bool)

(declare-fun b_and!21179 () Bool)

(assert (=> start!69978 (= tp!43944 b_and!21179)))

(declare-fun b!813397 () Bool)

(declare-fun e!450719 () Bool)

(declare-fun tp_is_empty!14121 () Bool)

(assert (=> b!813397 (= e!450719 tp_is_empty!14121)))

(declare-fun b!813398 () Bool)

(declare-fun res!555696 () Bool)

(declare-fun e!450718 () Bool)

(assert (=> b!813398 (=> (not res!555696) (not e!450718))))

(declare-datatypes ((array!44450 0))(
  ( (array!44451 (arr!21286 (Array (_ BitVec 32) (_ BitVec 64))) (size!21707 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44450)

(declare-datatypes ((List!15139 0))(
  ( (Nil!15136) (Cons!15135 (h!16264 (_ BitVec 64)) (t!21454 List!15139)) )
))
(declare-fun arrayNoDuplicates!0 (array!44450 (_ BitVec 32) List!15139) Bool)

(assert (=> b!813398 (= res!555696 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15136))))

(declare-fun mapNonEmpty!22759 () Bool)

(declare-fun mapRes!22759 () Bool)

(declare-fun tp!43945 () Bool)

(declare-fun e!450717 () Bool)

(assert (=> mapNonEmpty!22759 (= mapRes!22759 (and tp!43945 e!450717))))

(declare-datatypes ((V!23829 0))(
  ( (V!23830 (val!7108 Int)) )
))
(declare-datatypes ((ValueCell!6645 0))(
  ( (ValueCellFull!6645 (v!9535 V!23829)) (EmptyCell!6645) )
))
(declare-fun mapValue!22759 () ValueCell!6645)

(declare-datatypes ((array!44452 0))(
  ( (array!44453 (arr!21287 (Array (_ BitVec 32) ValueCell!6645)) (size!21708 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44452)

(declare-fun mapRest!22759 () (Array (_ BitVec 32) ValueCell!6645))

(declare-fun mapKey!22759 () (_ BitVec 32))

(assert (=> mapNonEmpty!22759 (= (arr!21287 _values!788) (store mapRest!22759 mapKey!22759 mapValue!22759))))

(declare-fun mapIsEmpty!22759 () Bool)

(assert (=> mapIsEmpty!22759 mapRes!22759))

(declare-fun b!813400 () Bool)

(declare-fun res!555698 () Bool)

(assert (=> b!813400 (=> (not res!555698) (not e!450718))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44450 (_ BitVec 32)) Bool)

(assert (=> b!813400 (= res!555698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813401 () Bool)

(assert (=> b!813401 (= e!450717 tp_is_empty!14121)))

(declare-fun b!813402 () Bool)

(assert (=> b!813402 (= e!450718 (bvsgt #b00000000000000000000000000000000 (size!21707 _keys!976)))))

(declare-fun zeroValueBefore!34 () V!23829)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!23829)

(declare-datatypes ((tuple2!9306 0))(
  ( (tuple2!9307 (_1!4664 (_ BitVec 64)) (_2!4664 V!23829)) )
))
(declare-datatypes ((List!15140 0))(
  ( (Nil!15137) (Cons!15136 (h!16265 tuple2!9306) (t!21455 List!15140)) )
))
(declare-datatypes ((ListLongMap!8129 0))(
  ( (ListLongMap!8130 (toList!4080 List!15140)) )
))
(declare-fun lt!364278 () ListLongMap!8129)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2130 (array!44450 array!44452 (_ BitVec 32) (_ BitVec 32) V!23829 V!23829 (_ BitVec 32) Int) ListLongMap!8129)

(assert (=> b!813402 (= lt!364278 (getCurrentListMapNoExtraKeys!2130 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813403 () Bool)

(declare-fun res!555699 () Bool)

(assert (=> b!813403 (=> (not res!555699) (not e!450718))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813403 (= res!555699 (and (= (size!21708 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21707 _keys!976) (size!21708 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!555697 () Bool)

(assert (=> start!69978 (=> (not res!555697) (not e!450718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69978 (= res!555697 (validMask!0 mask!1312))))

(assert (=> start!69978 e!450718))

(assert (=> start!69978 tp_is_empty!14121))

(declare-fun array_inv!17047 (array!44450) Bool)

(assert (=> start!69978 (array_inv!17047 _keys!976)))

(assert (=> start!69978 true))

(declare-fun e!450716 () Bool)

(declare-fun array_inv!17048 (array!44452) Bool)

(assert (=> start!69978 (and (array_inv!17048 _values!788) e!450716)))

(assert (=> start!69978 tp!43944))

(declare-fun b!813399 () Bool)

(assert (=> b!813399 (= e!450716 (and e!450719 mapRes!22759))))

(declare-fun condMapEmpty!22759 () Bool)

(declare-fun mapDefault!22759 () ValueCell!6645)

(assert (=> b!813399 (= condMapEmpty!22759 (= (arr!21287 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6645)) mapDefault!22759)))))

(assert (= (and start!69978 res!555697) b!813403))

(assert (= (and b!813403 res!555699) b!813400))

(assert (= (and b!813400 res!555698) b!813398))

(assert (= (and b!813398 res!555696) b!813402))

(assert (= (and b!813399 condMapEmpty!22759) mapIsEmpty!22759))

(assert (= (and b!813399 (not condMapEmpty!22759)) mapNonEmpty!22759))

(get-info :version)

(assert (= (and mapNonEmpty!22759 ((_ is ValueCellFull!6645) mapValue!22759)) b!813401))

(assert (= (and b!813399 ((_ is ValueCellFull!6645) mapDefault!22759)) b!813397))

(assert (= start!69978 b!813399))

(declare-fun m!755453 () Bool)

(assert (=> b!813402 m!755453))

(declare-fun m!755455 () Bool)

(assert (=> mapNonEmpty!22759 m!755455))

(declare-fun m!755457 () Bool)

(assert (=> b!813398 m!755457))

(declare-fun m!755459 () Bool)

(assert (=> b!813400 m!755459))

(declare-fun m!755461 () Bool)

(assert (=> start!69978 m!755461))

(declare-fun m!755463 () Bool)

(assert (=> start!69978 m!755463))

(declare-fun m!755465 () Bool)

(assert (=> start!69978 m!755465))

(check-sat (not start!69978) (not b!813400) (not b!813402) tp_is_empty!14121 (not b_next!12411) (not mapNonEmpty!22759) b_and!21179 (not b!813398))
(check-sat b_and!21179 (not b_next!12411))
(get-model)

(declare-fun b!813435 () Bool)

(declare-fun e!450745 () Bool)

(declare-fun e!450744 () Bool)

(assert (=> b!813435 (= e!450745 e!450744)))

(declare-fun c!88909 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!813435 (= c!88909 (validKeyInArray!0 (select (arr!21286 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104383 () Bool)

(declare-fun res!555719 () Bool)

(declare-fun e!450746 () Bool)

(assert (=> d!104383 (=> res!555719 e!450746)))

(assert (=> d!104383 (= res!555719 (bvsge #b00000000000000000000000000000000 (size!21707 _keys!976)))))

(assert (=> d!104383 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15136) e!450746)))

(declare-fun b!813436 () Bool)

(declare-fun call!35493 () Bool)

(assert (=> b!813436 (= e!450744 call!35493)))

(declare-fun bm!35490 () Bool)

(assert (=> bm!35490 (= call!35493 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88909 (Cons!15135 (select (arr!21286 _keys!976) #b00000000000000000000000000000000) Nil!15136) Nil!15136)))))

(declare-fun b!813437 () Bool)

(assert (=> b!813437 (= e!450744 call!35493)))

(declare-fun b!813438 () Bool)

(assert (=> b!813438 (= e!450746 e!450745)))

(declare-fun res!555718 () Bool)

(assert (=> b!813438 (=> (not res!555718) (not e!450745))))

(declare-fun e!450747 () Bool)

(assert (=> b!813438 (= res!555718 (not e!450747))))

(declare-fun res!555720 () Bool)

(assert (=> b!813438 (=> (not res!555720) (not e!450747))))

(assert (=> b!813438 (= res!555720 (validKeyInArray!0 (select (arr!21286 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!813439 () Bool)

(declare-fun contains!4143 (List!15139 (_ BitVec 64)) Bool)

(assert (=> b!813439 (= e!450747 (contains!4143 Nil!15136 (select (arr!21286 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104383 (not res!555719)) b!813438))

(assert (= (and b!813438 res!555720) b!813439))

(assert (= (and b!813438 res!555718) b!813435))

(assert (= (and b!813435 c!88909) b!813436))

(assert (= (and b!813435 (not c!88909)) b!813437))

(assert (= (or b!813436 b!813437) bm!35490))

(declare-fun m!755481 () Bool)

(assert (=> b!813435 m!755481))

(assert (=> b!813435 m!755481))

(declare-fun m!755483 () Bool)

(assert (=> b!813435 m!755483))

(assert (=> bm!35490 m!755481))

(declare-fun m!755485 () Bool)

(assert (=> bm!35490 m!755485))

(assert (=> b!813438 m!755481))

(assert (=> b!813438 m!755481))

(assert (=> b!813438 m!755483))

(assert (=> b!813439 m!755481))

(assert (=> b!813439 m!755481))

(declare-fun m!755487 () Bool)

(assert (=> b!813439 m!755487))

(assert (=> b!813398 d!104383))

(declare-fun d!104385 () Bool)

(declare-fun res!555726 () Bool)

(declare-fun e!450755 () Bool)

(assert (=> d!104385 (=> res!555726 e!450755)))

(assert (=> d!104385 (= res!555726 (bvsge #b00000000000000000000000000000000 (size!21707 _keys!976)))))

(assert (=> d!104385 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!450755)))

(declare-fun b!813448 () Bool)

(declare-fun e!450754 () Bool)

(assert (=> b!813448 (= e!450755 e!450754)))

(declare-fun c!88912 () Bool)

(assert (=> b!813448 (= c!88912 (validKeyInArray!0 (select (arr!21286 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35493 () Bool)

(declare-fun call!35496 () Bool)

(assert (=> bm!35493 (= call!35496 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!813449 () Bool)

(assert (=> b!813449 (= e!450754 call!35496)))

(declare-fun b!813450 () Bool)

(declare-fun e!450756 () Bool)

(assert (=> b!813450 (= e!450754 e!450756)))

(declare-fun lt!364288 () (_ BitVec 64))

(assert (=> b!813450 (= lt!364288 (select (arr!21286 _keys!976) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27712 0))(
  ( (Unit!27713) )
))
(declare-fun lt!364290 () Unit!27712)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44450 (_ BitVec 64) (_ BitVec 32)) Unit!27712)

(assert (=> b!813450 (= lt!364290 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!364288 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44450 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!813450 (arrayContainsKey!0 _keys!976 lt!364288 #b00000000000000000000000000000000)))

(declare-fun lt!364289 () Unit!27712)

(assert (=> b!813450 (= lt!364289 lt!364290)))

(declare-fun res!555725 () Bool)

(declare-datatypes ((SeekEntryResult!8719 0))(
  ( (MissingZero!8719 (index!37247 (_ BitVec 32))) (Found!8719 (index!37248 (_ BitVec 32))) (Intermediate!8719 (undefined!9531 Bool) (index!37249 (_ BitVec 32)) (x!68361 (_ BitVec 32))) (Undefined!8719) (MissingVacant!8719 (index!37250 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44450 (_ BitVec 32)) SeekEntryResult!8719)

(assert (=> b!813450 (= res!555725 (= (seekEntryOrOpen!0 (select (arr!21286 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8719 #b00000000000000000000000000000000)))))

(assert (=> b!813450 (=> (not res!555725) (not e!450756))))

(declare-fun b!813451 () Bool)

(assert (=> b!813451 (= e!450756 call!35496)))

(assert (= (and d!104385 (not res!555726)) b!813448))

(assert (= (and b!813448 c!88912) b!813450))

(assert (= (and b!813448 (not c!88912)) b!813449))

(assert (= (and b!813450 res!555725) b!813451))

(assert (= (or b!813451 b!813449) bm!35493))

(assert (=> b!813448 m!755481))

(assert (=> b!813448 m!755481))

(assert (=> b!813448 m!755483))

(declare-fun m!755489 () Bool)

(assert (=> bm!35493 m!755489))

(assert (=> b!813450 m!755481))

(declare-fun m!755491 () Bool)

(assert (=> b!813450 m!755491))

(declare-fun m!755493 () Bool)

(assert (=> b!813450 m!755493))

(assert (=> b!813450 m!755481))

(declare-fun m!755495 () Bool)

(assert (=> b!813450 m!755495))

(assert (=> b!813400 d!104385))

(declare-fun d!104387 () Bool)

(assert (=> d!104387 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!69978 d!104387))

(declare-fun d!104389 () Bool)

(assert (=> d!104389 (= (array_inv!17047 _keys!976) (bvsge (size!21707 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!69978 d!104389))

(declare-fun d!104391 () Bool)

(assert (=> d!104391 (= (array_inv!17048 _values!788) (bvsge (size!21708 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!69978 d!104391))

(declare-fun b!813476 () Bool)

(declare-fun e!450771 () Bool)

(declare-fun lt!364307 () ListLongMap!8129)

(declare-fun isEmpty!629 (ListLongMap!8129) Bool)

(assert (=> b!813476 (= e!450771 (isEmpty!629 lt!364307))))

(declare-fun b!813477 () Bool)

(assert (=> b!813477 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21707 _keys!976)))))

(assert (=> b!813477 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21708 _values!788)))))

(declare-fun e!450773 () Bool)

(declare-fun apply!347 (ListLongMap!8129 (_ BitVec 64)) V!23829)

(declare-fun get!11430 (ValueCell!6645 V!23829) V!23829)

(declare-fun dynLambda!958 (Int (_ BitVec 64)) V!23829)

(assert (=> b!813477 (= e!450773 (= (apply!347 lt!364307 (select (arr!21286 _keys!976) #b00000000000000000000000000000000)) (get!11430 (select (arr!21287 _values!788) #b00000000000000000000000000000000) (dynLambda!958 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!813479 () Bool)

(declare-fun e!450772 () Bool)

(assert (=> b!813479 (= e!450772 e!450773)))

(assert (=> b!813479 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21707 _keys!976)))))

(declare-fun res!555735 () Bool)

(declare-fun contains!4144 (ListLongMap!8129 (_ BitVec 64)) Bool)

(assert (=> b!813479 (= res!555735 (contains!4144 lt!364307 (select (arr!21286 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!813479 (=> (not res!555735) (not e!450773))))

(declare-fun b!813480 () Bool)

(declare-fun lt!364311 () Unit!27712)

(declare-fun lt!364310 () Unit!27712)

(assert (=> b!813480 (= lt!364311 lt!364310)))

(declare-fun lt!364305 () ListLongMap!8129)

(declare-fun lt!364306 () V!23829)

(declare-fun lt!364308 () (_ BitVec 64))

(declare-fun lt!364309 () (_ BitVec 64))

(declare-fun +!1779 (ListLongMap!8129 tuple2!9306) ListLongMap!8129)

(assert (=> b!813480 (not (contains!4144 (+!1779 lt!364305 (tuple2!9307 lt!364308 lt!364306)) lt!364309))))

(declare-fun addStillNotContains!172 (ListLongMap!8129 (_ BitVec 64) V!23829 (_ BitVec 64)) Unit!27712)

(assert (=> b!813480 (= lt!364310 (addStillNotContains!172 lt!364305 lt!364308 lt!364306 lt!364309))))

(assert (=> b!813480 (= lt!364309 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!813480 (= lt!364306 (get!11430 (select (arr!21287 _values!788) #b00000000000000000000000000000000) (dynLambda!958 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!813480 (= lt!364308 (select (arr!21286 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35499 () ListLongMap!8129)

(assert (=> b!813480 (= lt!364305 call!35499)))

(declare-fun e!450775 () ListLongMap!8129)

(assert (=> b!813480 (= e!450775 (+!1779 call!35499 (tuple2!9307 (select (arr!21286 _keys!976) #b00000000000000000000000000000000) (get!11430 (select (arr!21287 _values!788) #b00000000000000000000000000000000) (dynLambda!958 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!813481 () Bool)

(assert (=> b!813481 (= e!450771 (= lt!364307 (getCurrentListMapNoExtraKeys!2130 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!813482 () Bool)

(assert (=> b!813482 (= e!450772 e!450771)))

(declare-fun c!88923 () Bool)

(assert (=> b!813482 (= c!88923 (bvslt #b00000000000000000000000000000000 (size!21707 _keys!976)))))

(declare-fun b!813483 () Bool)

(declare-fun res!555736 () Bool)

(declare-fun e!450777 () Bool)

(assert (=> b!813483 (=> (not res!555736) (not e!450777))))

(assert (=> b!813483 (= res!555736 (not (contains!4144 lt!364307 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!813484 () Bool)

(declare-fun e!450776 () Bool)

(assert (=> b!813484 (= e!450776 (validKeyInArray!0 (select (arr!21286 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!813484 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!813485 () Bool)

(declare-fun e!450774 () ListLongMap!8129)

(assert (=> b!813485 (= e!450774 (ListLongMap!8130 Nil!15137))))

(declare-fun b!813486 () Bool)

(assert (=> b!813486 (= e!450777 e!450772)))

(declare-fun c!88921 () Bool)

(assert (=> b!813486 (= c!88921 e!450776)))

(declare-fun res!555737 () Bool)

(assert (=> b!813486 (=> (not res!555737) (not e!450776))))

(assert (=> b!813486 (= res!555737 (bvslt #b00000000000000000000000000000000 (size!21707 _keys!976)))))

(declare-fun d!104393 () Bool)

(assert (=> d!104393 e!450777))

(declare-fun res!555738 () Bool)

(assert (=> d!104393 (=> (not res!555738) (not e!450777))))

(assert (=> d!104393 (= res!555738 (not (contains!4144 lt!364307 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104393 (= lt!364307 e!450774)))

(declare-fun c!88922 () Bool)

(assert (=> d!104393 (= c!88922 (bvsge #b00000000000000000000000000000000 (size!21707 _keys!976)))))

(assert (=> d!104393 (validMask!0 mask!1312)))

(assert (=> d!104393 (= (getCurrentListMapNoExtraKeys!2130 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!364307)))

(declare-fun b!813478 () Bool)

(assert (=> b!813478 (= e!450775 call!35499)))

(declare-fun b!813487 () Bool)

(assert (=> b!813487 (= e!450774 e!450775)))

(declare-fun c!88924 () Bool)

(assert (=> b!813487 (= c!88924 (validKeyInArray!0 (select (arr!21286 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35496 () Bool)

(assert (=> bm!35496 (= call!35499 (getCurrentListMapNoExtraKeys!2130 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(assert (= (and d!104393 c!88922) b!813485))

(assert (= (and d!104393 (not c!88922)) b!813487))

(assert (= (and b!813487 c!88924) b!813480))

(assert (= (and b!813487 (not c!88924)) b!813478))

(assert (= (or b!813480 b!813478) bm!35496))

(assert (= (and d!104393 res!555738) b!813483))

(assert (= (and b!813483 res!555736) b!813486))

(assert (= (and b!813486 res!555737) b!813484))

(assert (= (and b!813486 c!88921) b!813479))

(assert (= (and b!813486 (not c!88921)) b!813482))

(assert (= (and b!813479 res!555735) b!813477))

(assert (= (and b!813482 c!88923) b!813481))

(assert (= (and b!813482 (not c!88923)) b!813476))

(declare-fun b_lambda!10823 () Bool)

(assert (=> (not b_lambda!10823) (not b!813477)))

(declare-fun t!21458 () Bool)

(declare-fun tb!4175 () Bool)

(assert (=> (and start!69978 (= defaultEntry!796 defaultEntry!796) t!21458) tb!4175))

(declare-fun result!7865 () Bool)

(assert (=> tb!4175 (= result!7865 tp_is_empty!14121)))

(assert (=> b!813477 t!21458))

(declare-fun b_and!21183 () Bool)

(assert (= b_and!21179 (and (=> t!21458 result!7865) b_and!21183)))

(declare-fun b_lambda!10825 () Bool)

(assert (=> (not b_lambda!10825) (not b!813480)))

(assert (=> b!813480 t!21458))

(declare-fun b_and!21185 () Bool)

(assert (= b_and!21183 (and (=> t!21458 result!7865) b_and!21185)))

(declare-fun m!755497 () Bool)

(assert (=> d!104393 m!755497))

(assert (=> d!104393 m!755461))

(declare-fun m!755499 () Bool)

(assert (=> b!813480 m!755499))

(declare-fun m!755501 () Bool)

(assert (=> b!813480 m!755501))

(declare-fun m!755503 () Bool)

(assert (=> b!813480 m!755503))

(assert (=> b!813480 m!755481))

(declare-fun m!755505 () Bool)

(assert (=> b!813480 m!755505))

(assert (=> b!813480 m!755501))

(declare-fun m!755507 () Bool)

(assert (=> b!813480 m!755507))

(assert (=> b!813480 m!755507))

(declare-fun m!755509 () Bool)

(assert (=> b!813480 m!755509))

(declare-fun m!755511 () Bool)

(assert (=> b!813480 m!755511))

(assert (=> b!813480 m!755509))

(declare-fun m!755513 () Bool)

(assert (=> b!813481 m!755513))

(assert (=> b!813487 m!755481))

(assert (=> b!813487 m!755481))

(assert (=> b!813487 m!755483))

(declare-fun m!755515 () Bool)

(assert (=> b!813483 m!755515))

(declare-fun m!755517 () Bool)

(assert (=> b!813476 m!755517))

(assert (=> b!813477 m!755481))

(assert (=> b!813477 m!755507))

(assert (=> b!813477 m!755481))

(declare-fun m!755519 () Bool)

(assert (=> b!813477 m!755519))

(assert (=> b!813477 m!755507))

(assert (=> b!813477 m!755509))

(assert (=> b!813477 m!755511))

(assert (=> b!813477 m!755509))

(assert (=> bm!35496 m!755513))

(assert (=> b!813479 m!755481))

(assert (=> b!813479 m!755481))

(declare-fun m!755521 () Bool)

(assert (=> b!813479 m!755521))

(assert (=> b!813484 m!755481))

(assert (=> b!813484 m!755481))

(assert (=> b!813484 m!755483))

(assert (=> b!813402 d!104393))

(declare-fun condMapEmpty!22765 () Bool)

(declare-fun mapDefault!22765 () ValueCell!6645)

(assert (=> mapNonEmpty!22759 (= condMapEmpty!22765 (= mapRest!22759 ((as const (Array (_ BitVec 32) ValueCell!6645)) mapDefault!22765)))))

(declare-fun e!450782 () Bool)

(declare-fun mapRes!22765 () Bool)

(assert (=> mapNonEmpty!22759 (= tp!43945 (and e!450782 mapRes!22765))))

(declare-fun b!813496 () Bool)

(declare-fun e!450783 () Bool)

(assert (=> b!813496 (= e!450783 tp_is_empty!14121)))

(declare-fun b!813497 () Bool)

(assert (=> b!813497 (= e!450782 tp_is_empty!14121)))

(declare-fun mapNonEmpty!22765 () Bool)

(declare-fun tp!43954 () Bool)

(assert (=> mapNonEmpty!22765 (= mapRes!22765 (and tp!43954 e!450783))))

(declare-fun mapKey!22765 () (_ BitVec 32))

(declare-fun mapRest!22765 () (Array (_ BitVec 32) ValueCell!6645))

(declare-fun mapValue!22765 () ValueCell!6645)

(assert (=> mapNonEmpty!22765 (= mapRest!22759 (store mapRest!22765 mapKey!22765 mapValue!22765))))

(declare-fun mapIsEmpty!22765 () Bool)

(assert (=> mapIsEmpty!22765 mapRes!22765))

(assert (= (and mapNonEmpty!22759 condMapEmpty!22765) mapIsEmpty!22765))

(assert (= (and mapNonEmpty!22759 (not condMapEmpty!22765)) mapNonEmpty!22765))

(assert (= (and mapNonEmpty!22765 ((_ is ValueCellFull!6645) mapValue!22765)) b!813496))

(assert (= (and mapNonEmpty!22759 ((_ is ValueCellFull!6645) mapDefault!22765)) b!813497))

(declare-fun m!755523 () Bool)

(assert (=> mapNonEmpty!22765 m!755523))

(declare-fun b_lambda!10827 () Bool)

(assert (= b_lambda!10823 (or (and start!69978 b_free!12411) b_lambda!10827)))

(declare-fun b_lambda!10829 () Bool)

(assert (= b_lambda!10825 (or (and start!69978 b_free!12411) b_lambda!10829)))

(check-sat (not bm!35490) (not b!813480) tp_is_empty!14121 (not b!813439) (not bm!35493) (not b!813484) (not b_lambda!10827) (not b!813481) (not b!813448) (not d!104393) (not bm!35496) (not b!813438) (not b!813477) (not b!813479) (not b_lambda!10829) b_and!21185 (not b!813487) (not mapNonEmpty!22765) (not b_next!12411) (not b!813435) (not b!813476) (not b!813483) (not b!813450))
(check-sat b_and!21185 (not b_next!12411))
