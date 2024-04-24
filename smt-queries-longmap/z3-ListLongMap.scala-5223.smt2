; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70554 () Bool)

(assert start!70554)

(declare-fun b_free!12745 () Bool)

(declare-fun b_next!12745 () Bool)

(assert (=> start!70554 (= b_free!12745 (not b_next!12745))))

(declare-fun tp!44962 () Bool)

(declare-fun b_and!21567 () Bool)

(assert (=> start!70554 (= tp!44962 b_and!21567)))

(declare-fun b!818571 () Bool)

(declare-fun res!558462 () Bool)

(declare-fun e!454340 () Bool)

(assert (=> b!818571 (=> (not res!558462) (not e!454340))))

(declare-datatypes ((array!45107 0))(
  ( (array!45108 (arr!21605 (Array (_ BitVec 32) (_ BitVec 64))) (size!22025 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45107)

(declare-datatypes ((List!15281 0))(
  ( (Nil!15278) (Cons!15277 (h!16412 (_ BitVec 64)) (t!21598 List!15281)) )
))
(declare-fun arrayNoDuplicates!0 (array!45107 (_ BitVec 32) List!15281) Bool)

(assert (=> b!818571 (= res!558462 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15278))))

(declare-fun res!558461 () Bool)

(assert (=> start!70554 (=> (not res!558461) (not e!454340))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70554 (= res!558461 (validMask!0 mask!1312))))

(assert (=> start!70554 e!454340))

(declare-fun tp_is_empty!14455 () Bool)

(assert (=> start!70554 tp_is_empty!14455))

(declare-fun array_inv!17307 (array!45107) Bool)

(assert (=> start!70554 (array_inv!17307 _keys!976)))

(assert (=> start!70554 true))

(declare-datatypes ((V!24275 0))(
  ( (V!24276 (val!7275 Int)) )
))
(declare-datatypes ((ValueCell!6812 0))(
  ( (ValueCellFull!6812 (v!9704 V!24275)) (EmptyCell!6812) )
))
(declare-datatypes ((array!45109 0))(
  ( (array!45110 (arr!21606 (Array (_ BitVec 32) ValueCell!6812)) (size!22026 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45109)

(declare-fun e!454341 () Bool)

(declare-fun array_inv!17308 (array!45109) Bool)

(assert (=> start!70554 (and (array_inv!17308 _values!788) e!454341)))

(assert (=> start!70554 tp!44962))

(declare-fun mapIsEmpty!23275 () Bool)

(declare-fun mapRes!23275 () Bool)

(assert (=> mapIsEmpty!23275 mapRes!23275))

(declare-fun mapNonEmpty!23275 () Bool)

(declare-fun tp!44961 () Bool)

(declare-fun e!454343 () Bool)

(assert (=> mapNonEmpty!23275 (= mapRes!23275 (and tp!44961 e!454343))))

(declare-fun mapRest!23275 () (Array (_ BitVec 32) ValueCell!6812))

(declare-fun mapValue!23275 () ValueCell!6812)

(declare-fun mapKey!23275 () (_ BitVec 32))

(assert (=> mapNonEmpty!23275 (= (arr!21606 _values!788) (store mapRest!23275 mapKey!23275 mapValue!23275))))

(declare-fun b!818572 () Bool)

(declare-fun e!454339 () Bool)

(assert (=> b!818572 (= e!454341 (and e!454339 mapRes!23275))))

(declare-fun condMapEmpty!23275 () Bool)

(declare-fun mapDefault!23275 () ValueCell!6812)

(assert (=> b!818572 (= condMapEmpty!23275 (= (arr!21606 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6812)) mapDefault!23275)))))

(declare-fun b!818573 () Bool)

(assert (=> b!818573 (= e!454343 tp_is_empty!14455)))

(declare-fun b!818574 () Bool)

(declare-fun res!558464 () Bool)

(assert (=> b!818574 (=> (not res!558464) (not e!454340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45107 (_ BitVec 32)) Bool)

(assert (=> b!818574 (= res!558464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818575 () Bool)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!818575 (= e!454340 (not (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!22025 _keys!976)))))))

(declare-datatypes ((tuple2!9468 0))(
  ( (tuple2!9469 (_1!4745 (_ BitVec 64)) (_2!4745 V!24275)) )
))
(declare-datatypes ((List!15282 0))(
  ( (Nil!15279) (Cons!15278 (h!16413 tuple2!9468) (t!21599 List!15282)) )
))
(declare-datatypes ((ListLongMap!8293 0))(
  ( (ListLongMap!8294 (toList!4162 List!15282)) )
))
(declare-fun lt!366707 () ListLongMap!8293)

(declare-fun lt!366708 () ListLongMap!8293)

(assert (=> b!818575 (= lt!366707 lt!366708)))

(declare-fun zeroValueBefore!34 () V!24275)

(declare-fun zeroValueAfter!34 () V!24275)

(declare-fun minValue!754 () V!24275)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27879 0))(
  ( (Unit!27880) )
))
(declare-fun lt!366706 () Unit!27879)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!349 (array!45107 array!45109 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24275 V!24275 V!24275 V!24275 (_ BitVec 32) Int) Unit!27879)

(assert (=> b!818575 (= lt!366706 (lemmaNoChangeToArrayThenSameMapNoExtras!349 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2261 (array!45107 array!45109 (_ BitVec 32) (_ BitVec 32) V!24275 V!24275 (_ BitVec 32) Int) ListLongMap!8293)

(assert (=> b!818575 (= lt!366708 (getCurrentListMapNoExtraKeys!2261 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818575 (= lt!366707 (getCurrentListMapNoExtraKeys!2261 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818576 () Bool)

(declare-fun res!558463 () Bool)

(assert (=> b!818576 (=> (not res!558463) (not e!454340))))

(assert (=> b!818576 (= res!558463 (and (= (size!22026 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22025 _keys!976) (size!22026 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818577 () Bool)

(assert (=> b!818577 (= e!454339 tp_is_empty!14455)))

(assert (= (and start!70554 res!558461) b!818576))

(assert (= (and b!818576 res!558463) b!818574))

(assert (= (and b!818574 res!558464) b!818571))

(assert (= (and b!818571 res!558462) b!818575))

(assert (= (and b!818572 condMapEmpty!23275) mapIsEmpty!23275))

(assert (= (and b!818572 (not condMapEmpty!23275)) mapNonEmpty!23275))

(get-info :version)

(assert (= (and mapNonEmpty!23275 ((_ is ValueCellFull!6812) mapValue!23275)) b!818573))

(assert (= (and b!818572 ((_ is ValueCellFull!6812) mapDefault!23275)) b!818577))

(assert (= start!70554 b!818572))

(declare-fun m!760507 () Bool)

(assert (=> b!818574 m!760507))

(declare-fun m!760509 () Bool)

(assert (=> b!818575 m!760509))

(declare-fun m!760511 () Bool)

(assert (=> b!818575 m!760511))

(declare-fun m!760513 () Bool)

(assert (=> b!818575 m!760513))

(declare-fun m!760515 () Bool)

(assert (=> start!70554 m!760515))

(declare-fun m!760517 () Bool)

(assert (=> start!70554 m!760517))

(declare-fun m!760519 () Bool)

(assert (=> start!70554 m!760519))

(declare-fun m!760521 () Bool)

(assert (=> mapNonEmpty!23275 m!760521))

(declare-fun m!760523 () Bool)

(assert (=> b!818571 m!760523))

(check-sat (not b!818574) (not mapNonEmpty!23275) tp_is_empty!14455 (not b_next!12745) (not b!818575) (not start!70554) b_and!21567 (not b!818571))
(check-sat b_and!21567 (not b_next!12745))
(get-model)

(declare-fun bm!35640 () Bool)

(declare-fun call!35643 () Bool)

(assert (=> bm!35640 (= call!35643 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!818628 () Bool)

(declare-fun e!454381 () Bool)

(declare-fun e!454380 () Bool)

(assert (=> b!818628 (= e!454381 e!454380)))

(declare-fun lt!366735 () (_ BitVec 64))

(assert (=> b!818628 (= lt!366735 (select (arr!21605 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366733 () Unit!27879)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45107 (_ BitVec 64) (_ BitVec 32)) Unit!27879)

(assert (=> b!818628 (= lt!366733 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!366735 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!818628 (arrayContainsKey!0 _keys!976 lt!366735 #b00000000000000000000000000000000)))

(declare-fun lt!366734 () Unit!27879)

(assert (=> b!818628 (= lt!366734 lt!366733)))

(declare-fun res!558493 () Bool)

(declare-datatypes ((SeekEntryResult!8675 0))(
  ( (MissingZero!8675 (index!37071 (_ BitVec 32))) (Found!8675 (index!37072 (_ BitVec 32))) (Intermediate!8675 (undefined!9487 Bool) (index!37073 (_ BitVec 32)) (x!68834 (_ BitVec 32))) (Undefined!8675) (MissingVacant!8675 (index!37074 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45107 (_ BitVec 32)) SeekEntryResult!8675)

(assert (=> b!818628 (= res!558493 (= (seekEntryOrOpen!0 (select (arr!21605 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8675 #b00000000000000000000000000000000)))))

(assert (=> b!818628 (=> (not res!558493) (not e!454380))))

(declare-fun b!818630 () Bool)

(declare-fun e!454382 () Bool)

(assert (=> b!818630 (= e!454382 e!454381)))

(declare-fun c!89340 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!818630 (= c!89340 (validKeyInArray!0 (select (arr!21605 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!818631 () Bool)

(assert (=> b!818631 (= e!454380 call!35643)))

(declare-fun b!818629 () Bool)

(assert (=> b!818629 (= e!454381 call!35643)))

(declare-fun d!104903 () Bool)

(declare-fun res!558494 () Bool)

(assert (=> d!104903 (=> res!558494 e!454382)))

(assert (=> d!104903 (= res!558494 (bvsge #b00000000000000000000000000000000 (size!22025 _keys!976)))))

(assert (=> d!104903 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!454382)))

(assert (= (and d!104903 (not res!558494)) b!818630))

(assert (= (and b!818630 c!89340) b!818628))

(assert (= (and b!818630 (not c!89340)) b!818629))

(assert (= (and b!818628 res!558493) b!818631))

(assert (= (or b!818631 b!818629) bm!35640))

(declare-fun m!760561 () Bool)

(assert (=> bm!35640 m!760561))

(declare-fun m!760563 () Bool)

(assert (=> b!818628 m!760563))

(declare-fun m!760565 () Bool)

(assert (=> b!818628 m!760565))

(declare-fun m!760567 () Bool)

(assert (=> b!818628 m!760567))

(assert (=> b!818628 m!760563))

(declare-fun m!760569 () Bool)

(assert (=> b!818628 m!760569))

(assert (=> b!818630 m!760563))

(assert (=> b!818630 m!760563))

(declare-fun m!760571 () Bool)

(assert (=> b!818630 m!760571))

(assert (=> b!818574 d!104903))

(declare-fun bm!35643 () Bool)

(declare-fun call!35646 () Bool)

(declare-fun c!89343 () Bool)

(assert (=> bm!35643 (= call!35646 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89343 (Cons!15277 (select (arr!21605 _keys!976) #b00000000000000000000000000000000) Nil!15278) Nil!15278)))))

(declare-fun b!818642 () Bool)

(declare-fun e!454391 () Bool)

(assert (=> b!818642 (= e!454391 call!35646)))

(declare-fun b!818643 () Bool)

(declare-fun e!454394 () Bool)

(assert (=> b!818643 (= e!454394 e!454391)))

(assert (=> b!818643 (= c!89343 (validKeyInArray!0 (select (arr!21605 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104905 () Bool)

(declare-fun res!558502 () Bool)

(declare-fun e!454392 () Bool)

(assert (=> d!104905 (=> res!558502 e!454392)))

(assert (=> d!104905 (= res!558502 (bvsge #b00000000000000000000000000000000 (size!22025 _keys!976)))))

(assert (=> d!104905 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15278) e!454392)))

(declare-fun b!818644 () Bool)

(assert (=> b!818644 (= e!454392 e!454394)))

(declare-fun res!558501 () Bool)

(assert (=> b!818644 (=> (not res!558501) (not e!454394))))

(declare-fun e!454393 () Bool)

(assert (=> b!818644 (= res!558501 (not e!454393))))

(declare-fun res!558503 () Bool)

(assert (=> b!818644 (=> (not res!558503) (not e!454393))))

(assert (=> b!818644 (= res!558503 (validKeyInArray!0 (select (arr!21605 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!818645 () Bool)

(assert (=> b!818645 (= e!454391 call!35646)))

(declare-fun b!818646 () Bool)

(declare-fun contains!4133 (List!15281 (_ BitVec 64)) Bool)

(assert (=> b!818646 (= e!454393 (contains!4133 Nil!15278 (select (arr!21605 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104905 (not res!558502)) b!818644))

(assert (= (and b!818644 res!558503) b!818646))

(assert (= (and b!818644 res!558501) b!818643))

(assert (= (and b!818643 c!89343) b!818642))

(assert (= (and b!818643 (not c!89343)) b!818645))

(assert (= (or b!818642 b!818645) bm!35643))

(assert (=> bm!35643 m!760563))

(declare-fun m!760573 () Bool)

(assert (=> bm!35643 m!760573))

(assert (=> b!818643 m!760563))

(assert (=> b!818643 m!760563))

(assert (=> b!818643 m!760571))

(assert (=> b!818644 m!760563))

(assert (=> b!818644 m!760563))

(assert (=> b!818644 m!760571))

(assert (=> b!818646 m!760563))

(assert (=> b!818646 m!760563))

(declare-fun m!760575 () Bool)

(assert (=> b!818646 m!760575))

(assert (=> b!818571 d!104905))

(declare-fun d!104907 () Bool)

(assert (=> d!104907 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70554 d!104907))

(declare-fun d!104909 () Bool)

(assert (=> d!104909 (= (array_inv!17307 _keys!976) (bvsge (size!22025 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70554 d!104909))

(declare-fun d!104911 () Bool)

(assert (=> d!104911 (= (array_inv!17308 _values!788) (bvsge (size!22026 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70554 d!104911))

(declare-fun d!104913 () Bool)

(assert (=> d!104913 (= (getCurrentListMapNoExtraKeys!2261 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2261 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366738 () Unit!27879)

(declare-fun choose!1397 (array!45107 array!45109 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24275 V!24275 V!24275 V!24275 (_ BitVec 32) Int) Unit!27879)

(assert (=> d!104913 (= lt!366738 (choose!1397 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104913 (validMask!0 mask!1312)))

(assert (=> d!104913 (= (lemmaNoChangeToArrayThenSameMapNoExtras!349 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366738)))

(declare-fun bs!22798 () Bool)

(assert (= bs!22798 d!104913))

(assert (=> bs!22798 m!760513))

(assert (=> bs!22798 m!760511))

(declare-fun m!760577 () Bool)

(assert (=> bs!22798 m!760577))

(assert (=> bs!22798 m!760515))

(assert (=> b!818575 d!104913))

(declare-fun b!818671 () Bool)

(assert (=> b!818671 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22025 _keys!976)))))

(assert (=> b!818671 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22026 _values!788)))))

(declare-fun lt!366758 () ListLongMap!8293)

(declare-fun e!454413 () Bool)

(declare-fun apply!352 (ListLongMap!8293 (_ BitVec 64)) V!24275)

(declare-fun get!11550 (ValueCell!6812 V!24275) V!24275)

(declare-fun dynLambda!960 (Int (_ BitVec 64)) V!24275)

(assert (=> b!818671 (= e!454413 (= (apply!352 lt!366758 (select (arr!21605 _keys!976) #b00000000000000000000000000000000)) (get!11550 (select (arr!21606 _values!788) #b00000000000000000000000000000000) (dynLambda!960 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!818672 () Bool)

(declare-fun e!454410 () Bool)

(assert (=> b!818672 (= e!454410 (validKeyInArray!0 (select (arr!21605 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!818672 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!818673 () Bool)

(declare-fun e!454411 () Bool)

(assert (=> b!818673 (= e!454411 (= lt!366758 (getCurrentListMapNoExtraKeys!2261 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun call!35649 () ListLongMap!8293)

(declare-fun bm!35646 () Bool)

(assert (=> bm!35646 (= call!35649 (getCurrentListMapNoExtraKeys!2261 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun d!104915 () Bool)

(declare-fun e!454409 () Bool)

(assert (=> d!104915 e!454409))

(declare-fun res!558512 () Bool)

(assert (=> d!104915 (=> (not res!558512) (not e!454409))))

(declare-fun contains!4134 (ListLongMap!8293 (_ BitVec 64)) Bool)

(assert (=> d!104915 (= res!558512 (not (contains!4134 lt!366758 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!454414 () ListLongMap!8293)

(assert (=> d!104915 (= lt!366758 e!454414)))

(declare-fun c!89352 () Bool)

(assert (=> d!104915 (= c!89352 (bvsge #b00000000000000000000000000000000 (size!22025 _keys!976)))))

(assert (=> d!104915 (validMask!0 mask!1312)))

(assert (=> d!104915 (= (getCurrentListMapNoExtraKeys!2261 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366758)))

(declare-fun b!818674 () Bool)

(declare-fun res!558515 () Bool)

(assert (=> b!818674 (=> (not res!558515) (not e!454409))))

(assert (=> b!818674 (= res!558515 (not (contains!4134 lt!366758 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!818675 () Bool)

(declare-fun e!454412 () ListLongMap!8293)

(assert (=> b!818675 (= e!454414 e!454412)))

(declare-fun c!89354 () Bool)

(assert (=> b!818675 (= c!89354 (validKeyInArray!0 (select (arr!21605 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!818676 () Bool)

(declare-fun e!454415 () Bool)

(assert (=> b!818676 (= e!454409 e!454415)))

(declare-fun c!89355 () Bool)

(assert (=> b!818676 (= c!89355 e!454410)))

(declare-fun res!558514 () Bool)

(assert (=> b!818676 (=> (not res!558514) (not e!454410))))

(assert (=> b!818676 (= res!558514 (bvslt #b00000000000000000000000000000000 (size!22025 _keys!976)))))

(declare-fun b!818677 () Bool)

(assert (=> b!818677 (= e!454415 e!454413)))

(assert (=> b!818677 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22025 _keys!976)))))

(declare-fun res!558513 () Bool)

(assert (=> b!818677 (= res!558513 (contains!4134 lt!366758 (select (arr!21605 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!818677 (=> (not res!558513) (not e!454413))))

(declare-fun b!818678 () Bool)

(declare-fun isEmpty!640 (ListLongMap!8293) Bool)

(assert (=> b!818678 (= e!454411 (isEmpty!640 lt!366758))))

(declare-fun b!818679 () Bool)

(assert (=> b!818679 (= e!454415 e!454411)))

(declare-fun c!89353 () Bool)

(assert (=> b!818679 (= c!89353 (bvslt #b00000000000000000000000000000000 (size!22025 _keys!976)))))

(declare-fun b!818680 () Bool)

(assert (=> b!818680 (= e!454412 call!35649)))

(declare-fun b!818681 () Bool)

(declare-fun lt!366759 () Unit!27879)

(declare-fun lt!366757 () Unit!27879)

(assert (=> b!818681 (= lt!366759 lt!366757)))

(declare-fun lt!366756 () (_ BitVec 64))

(declare-fun lt!366755 () ListLongMap!8293)

(declare-fun lt!366754 () (_ BitVec 64))

(declare-fun lt!366753 () V!24275)

(declare-fun +!1822 (ListLongMap!8293 tuple2!9468) ListLongMap!8293)

(assert (=> b!818681 (not (contains!4134 (+!1822 lt!366755 (tuple2!9469 lt!366756 lt!366753)) lt!366754))))

(declare-fun addStillNotContains!179 (ListLongMap!8293 (_ BitVec 64) V!24275 (_ BitVec 64)) Unit!27879)

(assert (=> b!818681 (= lt!366757 (addStillNotContains!179 lt!366755 lt!366756 lt!366753 lt!366754))))

(assert (=> b!818681 (= lt!366754 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!818681 (= lt!366753 (get!11550 (select (arr!21606 _values!788) #b00000000000000000000000000000000) (dynLambda!960 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!818681 (= lt!366756 (select (arr!21605 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!818681 (= lt!366755 call!35649)))

(assert (=> b!818681 (= e!454412 (+!1822 call!35649 (tuple2!9469 (select (arr!21605 _keys!976) #b00000000000000000000000000000000) (get!11550 (select (arr!21606 _values!788) #b00000000000000000000000000000000) (dynLambda!960 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!818682 () Bool)

(assert (=> b!818682 (= e!454414 (ListLongMap!8294 Nil!15279))))

(assert (= (and d!104915 c!89352) b!818682))

(assert (= (and d!104915 (not c!89352)) b!818675))

(assert (= (and b!818675 c!89354) b!818681))

(assert (= (and b!818675 (not c!89354)) b!818680))

(assert (= (or b!818681 b!818680) bm!35646))

(assert (= (and d!104915 res!558512) b!818674))

(assert (= (and b!818674 res!558515) b!818676))

(assert (= (and b!818676 res!558514) b!818672))

(assert (= (and b!818676 c!89355) b!818677))

(assert (= (and b!818676 (not c!89355)) b!818679))

(assert (= (and b!818677 res!558513) b!818671))

(assert (= (and b!818679 c!89353) b!818673))

(assert (= (and b!818679 (not c!89353)) b!818678))

(declare-fun b_lambda!10925 () Bool)

(assert (=> (not b_lambda!10925) (not b!818671)))

(declare-fun t!21604 () Bool)

(declare-fun tb!4177 () Bool)

(assert (=> (and start!70554 (= defaultEntry!796 defaultEntry!796) t!21604) tb!4177))

(declare-fun result!7887 () Bool)

(assert (=> tb!4177 (= result!7887 tp_is_empty!14455)))

(assert (=> b!818671 t!21604))

(declare-fun b_and!21573 () Bool)

(assert (= b_and!21567 (and (=> t!21604 result!7887) b_and!21573)))

(declare-fun b_lambda!10927 () Bool)

(assert (=> (not b_lambda!10927) (not b!818681)))

(assert (=> b!818681 t!21604))

(declare-fun b_and!21575 () Bool)

(assert (= b_and!21573 (and (=> t!21604 result!7887) b_and!21575)))

(declare-fun m!760579 () Bool)

(assert (=> bm!35646 m!760579))

(declare-fun m!760581 () Bool)

(assert (=> b!818681 m!760581))

(declare-fun m!760583 () Bool)

(assert (=> b!818681 m!760583))

(assert (=> b!818681 m!760581))

(declare-fun m!760585 () Bool)

(assert (=> b!818681 m!760585))

(declare-fun m!760587 () Bool)

(assert (=> b!818681 m!760587))

(declare-fun m!760589 () Bool)

(assert (=> b!818681 m!760589))

(declare-fun m!760591 () Bool)

(assert (=> b!818681 m!760591))

(assert (=> b!818681 m!760589))

(declare-fun m!760593 () Bool)

(assert (=> b!818681 m!760593))

(assert (=> b!818681 m!760563))

(assert (=> b!818681 m!760587))

(assert (=> b!818677 m!760563))

(assert (=> b!818677 m!760563))

(declare-fun m!760595 () Bool)

(assert (=> b!818677 m!760595))

(declare-fun m!760597 () Bool)

(assert (=> b!818678 m!760597))

(assert (=> b!818672 m!760563))

(assert (=> b!818672 m!760563))

(assert (=> b!818672 m!760571))

(assert (=> b!818673 m!760579))

(assert (=> b!818675 m!760563))

(assert (=> b!818675 m!760563))

(assert (=> b!818675 m!760571))

(declare-fun m!760599 () Bool)

(assert (=> d!104915 m!760599))

(assert (=> d!104915 m!760515))

(assert (=> b!818671 m!760587))

(assert (=> b!818671 m!760589))

(assert (=> b!818671 m!760591))

(assert (=> b!818671 m!760563))

(declare-fun m!760601 () Bool)

(assert (=> b!818671 m!760601))

(assert (=> b!818671 m!760589))

(assert (=> b!818671 m!760563))

(assert (=> b!818671 m!760587))

(declare-fun m!760603 () Bool)

(assert (=> b!818674 m!760603))

(assert (=> b!818575 d!104915))

(declare-fun b!818685 () Bool)

(assert (=> b!818685 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22025 _keys!976)))))

(assert (=> b!818685 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22026 _values!788)))))

(declare-fun e!454420 () Bool)

(declare-fun lt!366765 () ListLongMap!8293)

(assert (=> b!818685 (= e!454420 (= (apply!352 lt!366765 (select (arr!21605 _keys!976) #b00000000000000000000000000000000)) (get!11550 (select (arr!21606 _values!788) #b00000000000000000000000000000000) (dynLambda!960 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!818686 () Bool)

(declare-fun e!454417 () Bool)

(assert (=> b!818686 (= e!454417 (validKeyInArray!0 (select (arr!21605 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!818686 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun e!454418 () Bool)

(declare-fun b!818687 () Bool)

(assert (=> b!818687 (= e!454418 (= lt!366765 (getCurrentListMapNoExtraKeys!2261 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun call!35650 () ListLongMap!8293)

(declare-fun bm!35647 () Bool)

(assert (=> bm!35647 (= call!35650 (getCurrentListMapNoExtraKeys!2261 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun d!104917 () Bool)

(declare-fun e!454416 () Bool)

(assert (=> d!104917 e!454416))

(declare-fun res!558516 () Bool)

(assert (=> d!104917 (=> (not res!558516) (not e!454416))))

(assert (=> d!104917 (= res!558516 (not (contains!4134 lt!366765 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!454421 () ListLongMap!8293)

(assert (=> d!104917 (= lt!366765 e!454421)))

(declare-fun c!89356 () Bool)

(assert (=> d!104917 (= c!89356 (bvsge #b00000000000000000000000000000000 (size!22025 _keys!976)))))

(assert (=> d!104917 (validMask!0 mask!1312)))

(assert (=> d!104917 (= (getCurrentListMapNoExtraKeys!2261 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366765)))

(declare-fun b!818688 () Bool)

(declare-fun res!558519 () Bool)

(assert (=> b!818688 (=> (not res!558519) (not e!454416))))

(assert (=> b!818688 (= res!558519 (not (contains!4134 lt!366765 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!818689 () Bool)

(declare-fun e!454419 () ListLongMap!8293)

(assert (=> b!818689 (= e!454421 e!454419)))

(declare-fun c!89358 () Bool)

(assert (=> b!818689 (= c!89358 (validKeyInArray!0 (select (arr!21605 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!818690 () Bool)

(declare-fun e!454422 () Bool)

(assert (=> b!818690 (= e!454416 e!454422)))

(declare-fun c!89359 () Bool)

(assert (=> b!818690 (= c!89359 e!454417)))

(declare-fun res!558518 () Bool)

(assert (=> b!818690 (=> (not res!558518) (not e!454417))))

(assert (=> b!818690 (= res!558518 (bvslt #b00000000000000000000000000000000 (size!22025 _keys!976)))))

(declare-fun b!818691 () Bool)

(assert (=> b!818691 (= e!454422 e!454420)))

(assert (=> b!818691 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22025 _keys!976)))))

(declare-fun res!558517 () Bool)

(assert (=> b!818691 (= res!558517 (contains!4134 lt!366765 (select (arr!21605 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!818691 (=> (not res!558517) (not e!454420))))

(declare-fun b!818692 () Bool)

(assert (=> b!818692 (= e!454418 (isEmpty!640 lt!366765))))

(declare-fun b!818693 () Bool)

(assert (=> b!818693 (= e!454422 e!454418)))

(declare-fun c!89357 () Bool)

(assert (=> b!818693 (= c!89357 (bvslt #b00000000000000000000000000000000 (size!22025 _keys!976)))))

(declare-fun b!818694 () Bool)

(assert (=> b!818694 (= e!454419 call!35650)))

(declare-fun b!818695 () Bool)

(declare-fun lt!366766 () Unit!27879)

(declare-fun lt!366764 () Unit!27879)

(assert (=> b!818695 (= lt!366766 lt!366764)))

(declare-fun lt!366761 () (_ BitVec 64))

(declare-fun lt!366760 () V!24275)

(declare-fun lt!366763 () (_ BitVec 64))

(declare-fun lt!366762 () ListLongMap!8293)

(assert (=> b!818695 (not (contains!4134 (+!1822 lt!366762 (tuple2!9469 lt!366763 lt!366760)) lt!366761))))

(assert (=> b!818695 (= lt!366764 (addStillNotContains!179 lt!366762 lt!366763 lt!366760 lt!366761))))

(assert (=> b!818695 (= lt!366761 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!818695 (= lt!366760 (get!11550 (select (arr!21606 _values!788) #b00000000000000000000000000000000) (dynLambda!960 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!818695 (= lt!366763 (select (arr!21605 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!818695 (= lt!366762 call!35650)))

(assert (=> b!818695 (= e!454419 (+!1822 call!35650 (tuple2!9469 (select (arr!21605 _keys!976) #b00000000000000000000000000000000) (get!11550 (select (arr!21606 _values!788) #b00000000000000000000000000000000) (dynLambda!960 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!818696 () Bool)

(assert (=> b!818696 (= e!454421 (ListLongMap!8294 Nil!15279))))

(assert (= (and d!104917 c!89356) b!818696))

(assert (= (and d!104917 (not c!89356)) b!818689))

(assert (= (and b!818689 c!89358) b!818695))

(assert (= (and b!818689 (not c!89358)) b!818694))

(assert (= (or b!818695 b!818694) bm!35647))

(assert (= (and d!104917 res!558516) b!818688))

(assert (= (and b!818688 res!558519) b!818690))

(assert (= (and b!818690 res!558518) b!818686))

(assert (= (and b!818690 c!89359) b!818691))

(assert (= (and b!818690 (not c!89359)) b!818693))

(assert (= (and b!818691 res!558517) b!818685))

(assert (= (and b!818693 c!89357) b!818687))

(assert (= (and b!818693 (not c!89357)) b!818692))

(declare-fun b_lambda!10929 () Bool)

(assert (=> (not b_lambda!10929) (not b!818685)))

(assert (=> b!818685 t!21604))

(declare-fun b_and!21577 () Bool)

(assert (= b_and!21575 (and (=> t!21604 result!7887) b_and!21577)))

(declare-fun b_lambda!10931 () Bool)

(assert (=> (not b_lambda!10931) (not b!818695)))

(assert (=> b!818695 t!21604))

(declare-fun b_and!21579 () Bool)

(assert (= b_and!21577 (and (=> t!21604 result!7887) b_and!21579)))

(declare-fun m!760605 () Bool)

(assert (=> bm!35647 m!760605))

(declare-fun m!760607 () Bool)

(assert (=> b!818695 m!760607))

(declare-fun m!760609 () Bool)

(assert (=> b!818695 m!760609))

(assert (=> b!818695 m!760607))

(declare-fun m!760611 () Bool)

(assert (=> b!818695 m!760611))

(assert (=> b!818695 m!760587))

(assert (=> b!818695 m!760589))

(assert (=> b!818695 m!760591))

(assert (=> b!818695 m!760589))

(declare-fun m!760613 () Bool)

(assert (=> b!818695 m!760613))

(assert (=> b!818695 m!760563))

(assert (=> b!818695 m!760587))

(assert (=> b!818691 m!760563))

(assert (=> b!818691 m!760563))

(declare-fun m!760615 () Bool)

(assert (=> b!818691 m!760615))

(declare-fun m!760617 () Bool)

(assert (=> b!818692 m!760617))

(assert (=> b!818686 m!760563))

(assert (=> b!818686 m!760563))

(assert (=> b!818686 m!760571))

(assert (=> b!818687 m!760605))

(assert (=> b!818689 m!760563))

(assert (=> b!818689 m!760563))

(assert (=> b!818689 m!760571))

(declare-fun m!760619 () Bool)

(assert (=> d!104917 m!760619))

(assert (=> d!104917 m!760515))

(assert (=> b!818685 m!760587))

(assert (=> b!818685 m!760589))

(assert (=> b!818685 m!760591))

(assert (=> b!818685 m!760563))

(declare-fun m!760621 () Bool)

(assert (=> b!818685 m!760621))

(assert (=> b!818685 m!760589))

(assert (=> b!818685 m!760563))

(assert (=> b!818685 m!760587))

(declare-fun m!760623 () Bool)

(assert (=> b!818688 m!760623))

(assert (=> b!818575 d!104917))

(declare-fun mapNonEmpty!23284 () Bool)

(declare-fun mapRes!23284 () Bool)

(declare-fun tp!44977 () Bool)

(declare-fun e!454428 () Bool)

(assert (=> mapNonEmpty!23284 (= mapRes!23284 (and tp!44977 e!454428))))

(declare-fun mapValue!23284 () ValueCell!6812)

(declare-fun mapRest!23284 () (Array (_ BitVec 32) ValueCell!6812))

(declare-fun mapKey!23284 () (_ BitVec 32))

(assert (=> mapNonEmpty!23284 (= mapRest!23275 (store mapRest!23284 mapKey!23284 mapValue!23284))))

(declare-fun condMapEmpty!23284 () Bool)

(declare-fun mapDefault!23284 () ValueCell!6812)

(assert (=> mapNonEmpty!23275 (= condMapEmpty!23284 (= mapRest!23275 ((as const (Array (_ BitVec 32) ValueCell!6812)) mapDefault!23284)))))

(declare-fun e!454427 () Bool)

(assert (=> mapNonEmpty!23275 (= tp!44961 (and e!454427 mapRes!23284))))

(declare-fun mapIsEmpty!23284 () Bool)

(assert (=> mapIsEmpty!23284 mapRes!23284))

(declare-fun b!818703 () Bool)

(assert (=> b!818703 (= e!454428 tp_is_empty!14455)))

(declare-fun b!818704 () Bool)

(assert (=> b!818704 (= e!454427 tp_is_empty!14455)))

(assert (= (and mapNonEmpty!23275 condMapEmpty!23284) mapIsEmpty!23284))

(assert (= (and mapNonEmpty!23275 (not condMapEmpty!23284)) mapNonEmpty!23284))

(assert (= (and mapNonEmpty!23284 ((_ is ValueCellFull!6812) mapValue!23284)) b!818703))

(assert (= (and mapNonEmpty!23275 ((_ is ValueCellFull!6812) mapDefault!23284)) b!818704))

(declare-fun m!760625 () Bool)

(assert (=> mapNonEmpty!23284 m!760625))

(declare-fun b_lambda!10933 () Bool)

(assert (= b_lambda!10929 (or (and start!70554 b_free!12745) b_lambda!10933)))

(declare-fun b_lambda!10935 () Bool)

(assert (= b_lambda!10927 (or (and start!70554 b_free!12745) b_lambda!10935)))

(declare-fun b_lambda!10937 () Bool)

(assert (= b_lambda!10931 (or (and start!70554 b_free!12745) b_lambda!10937)))

(declare-fun b_lambda!10939 () Bool)

(assert (= b_lambda!10925 (or (and start!70554 b_free!12745) b_lambda!10939)))

(check-sat (not b!818646) (not bm!35640) (not b_lambda!10935) (not b!818687) tp_is_empty!14455 (not b!818681) (not b!818673) (not b!818630) (not b!818674) (not b_lambda!10937) (not b_lambda!10933) (not b!818643) (not b_next!12745) (not b_lambda!10939) (not b!818685) (not b!818686) (not mapNonEmpty!23284) (not b!818691) (not bm!35643) (not bm!35647) b_and!21579 (not b!818628) (not b!818678) (not d!104917) (not d!104915) (not b!818675) (not b!818672) (not bm!35646) (not b!818644) (not b!818689) (not b!818695) (not d!104913) (not b!818677) (not b!818692) (not b!818671) (not b!818688))
(check-sat b_and!21579 (not b_next!12745))
