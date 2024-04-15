; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70368 () Bool)

(assert start!70368)

(declare-fun b_free!12745 () Bool)

(declare-fun b_next!12745 () Bool)

(assert (=> start!70368 (= b_free!12745 (not b_next!12745))))

(declare-fun tp!44961 () Bool)

(declare-fun b_and!21531 () Bool)

(assert (=> start!70368 (= tp!44961 b_and!21531)))

(declare-fun b!817431 () Bool)

(declare-fun res!558012 () Bool)

(declare-fun e!453615 () Bool)

(assert (=> b!817431 (=> (not res!558012) (not e!453615))))

(declare-datatypes ((array!45087 0))(
  ( (array!45088 (arr!21600 (Array (_ BitVec 32) (_ BitVec 64))) (size!22021 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45087)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45087 (_ BitVec 32)) Bool)

(assert (=> b!817431 (= res!558012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817432 () Bool)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!817432 (= e!453615 (not (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!22021 _keys!976)))))))

(declare-datatypes ((V!24275 0))(
  ( (V!24276 (val!7275 Int)) )
))
(declare-datatypes ((tuple2!9578 0))(
  ( (tuple2!9579 (_1!4800 (_ BitVec 64)) (_2!4800 V!24275)) )
))
(declare-datatypes ((List!15401 0))(
  ( (Nil!15398) (Cons!15397 (h!16526 tuple2!9578) (t!21717 List!15401)) )
))
(declare-datatypes ((ListLongMap!8391 0))(
  ( (ListLongMap!8392 (toList!4211 List!15401)) )
))
(declare-fun lt!366110 () ListLongMap!8391)

(declare-fun lt!366109 () ListLongMap!8391)

(assert (=> b!817432 (= lt!366110 lt!366109)))

(declare-fun zeroValueBefore!34 () V!24275)

(declare-fun zeroValueAfter!34 () V!24275)

(declare-fun minValue!754 () V!24275)

(declare-datatypes ((ValueCell!6812 0))(
  ( (ValueCellFull!6812 (v!9698 V!24275)) (EmptyCell!6812) )
))
(declare-datatypes ((array!45089 0))(
  ( (array!45090 (arr!21601 (Array (_ BitVec 32) ValueCell!6812)) (size!22022 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45089)

(declare-datatypes ((Unit!27850 0))(
  ( (Unit!27851) )
))
(declare-fun lt!366111 () Unit!27850)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!364 (array!45087 array!45089 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24275 V!24275 V!24275 V!24275 (_ BitVec 32) Int) Unit!27850)

(assert (=> b!817432 (= lt!366111 (lemmaNoChangeToArrayThenSameMapNoExtras!364 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2271 (array!45087 array!45089 (_ BitVec 32) (_ BitVec 32) V!24275 V!24275 (_ BitVec 32) Int) ListLongMap!8391)

(assert (=> b!817432 (= lt!366109 (getCurrentListMapNoExtraKeys!2271 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817432 (= lt!366110 (getCurrentListMapNoExtraKeys!2271 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817433 () Bool)

(declare-fun res!558011 () Bool)

(assert (=> b!817433 (=> (not res!558011) (not e!453615))))

(declare-datatypes ((List!15402 0))(
  ( (Nil!15399) (Cons!15398 (h!16527 (_ BitVec 64)) (t!21718 List!15402)) )
))
(declare-fun arrayNoDuplicates!0 (array!45087 (_ BitVec 32) List!15402) Bool)

(assert (=> b!817433 (= res!558011 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15399))))

(declare-fun b!817434 () Bool)

(declare-fun e!453614 () Bool)

(declare-fun tp_is_empty!14455 () Bool)

(assert (=> b!817434 (= e!453614 tp_is_empty!14455)))

(declare-fun b!817435 () Bool)

(declare-fun e!453613 () Bool)

(assert (=> b!817435 (= e!453613 tp_is_empty!14455)))

(declare-fun mapNonEmpty!23275 () Bool)

(declare-fun mapRes!23275 () Bool)

(declare-fun tp!44962 () Bool)

(assert (=> mapNonEmpty!23275 (= mapRes!23275 (and tp!44962 e!453613))))

(declare-fun mapKey!23275 () (_ BitVec 32))

(declare-fun mapValue!23275 () ValueCell!6812)

(declare-fun mapRest!23275 () (Array (_ BitVec 32) ValueCell!6812))

(assert (=> mapNonEmpty!23275 (= (arr!21601 _values!788) (store mapRest!23275 mapKey!23275 mapValue!23275))))

(declare-fun res!558010 () Bool)

(assert (=> start!70368 (=> (not res!558010) (not e!453615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70368 (= res!558010 (validMask!0 mask!1312))))

(assert (=> start!70368 e!453615))

(assert (=> start!70368 tp_is_empty!14455))

(declare-fun array_inv!17345 (array!45087) Bool)

(assert (=> start!70368 (array_inv!17345 _keys!976)))

(assert (=> start!70368 true))

(declare-fun e!453612 () Bool)

(declare-fun array_inv!17346 (array!45089) Bool)

(assert (=> start!70368 (and (array_inv!17346 _values!788) e!453612)))

(assert (=> start!70368 tp!44961))

(declare-fun b!817436 () Bool)

(assert (=> b!817436 (= e!453612 (and e!453614 mapRes!23275))))

(declare-fun condMapEmpty!23275 () Bool)

(declare-fun mapDefault!23275 () ValueCell!6812)

(assert (=> b!817436 (= condMapEmpty!23275 (= (arr!21601 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6812)) mapDefault!23275)))))

(declare-fun mapIsEmpty!23275 () Bool)

(assert (=> mapIsEmpty!23275 mapRes!23275))

(declare-fun b!817437 () Bool)

(declare-fun res!558009 () Bool)

(assert (=> b!817437 (=> (not res!558009) (not e!453615))))

(assert (=> b!817437 (= res!558009 (and (= (size!22022 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22021 _keys!976) (size!22022 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70368 res!558010) b!817437))

(assert (= (and b!817437 res!558009) b!817431))

(assert (= (and b!817431 res!558012) b!817433))

(assert (= (and b!817433 res!558011) b!817432))

(assert (= (and b!817436 condMapEmpty!23275) mapIsEmpty!23275))

(assert (= (and b!817436 (not condMapEmpty!23275)) mapNonEmpty!23275))

(get-info :version)

(assert (= (and mapNonEmpty!23275 ((_ is ValueCellFull!6812) mapValue!23275)) b!817435))

(assert (= (and b!817436 ((_ is ValueCellFull!6812) mapDefault!23275)) b!817434))

(assert (= start!70368 b!817436))

(declare-fun m!758473 () Bool)

(assert (=> mapNonEmpty!23275 m!758473))

(declare-fun m!758475 () Bool)

(assert (=> b!817432 m!758475))

(declare-fun m!758477 () Bool)

(assert (=> b!817432 m!758477))

(declare-fun m!758479 () Bool)

(assert (=> b!817432 m!758479))

(declare-fun m!758481 () Bool)

(assert (=> b!817431 m!758481))

(declare-fun m!758483 () Bool)

(assert (=> b!817433 m!758483))

(declare-fun m!758485 () Bool)

(assert (=> start!70368 m!758485))

(declare-fun m!758487 () Bool)

(assert (=> start!70368 m!758487))

(declare-fun m!758489 () Bool)

(assert (=> start!70368 m!758489))

(check-sat (not mapNonEmpty!23275) (not b!817433) tp_is_empty!14455 (not b!817431) (not start!70368) (not b!817432) b_and!21531 (not b_next!12745))
(check-sat b_and!21531 (not b_next!12745))
(get-model)

(declare-fun d!104387 () Bool)

(declare-fun res!558043 () Bool)

(declare-fun e!453655 () Bool)

(assert (=> d!104387 (=> res!558043 e!453655)))

(assert (=> d!104387 (= res!558043 (bvsge #b00000000000000000000000000000000 (size!22021 _keys!976)))))

(assert (=> d!104387 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15399) e!453655)))

(declare-fun b!817490 () Bool)

(declare-fun e!453657 () Bool)

(declare-fun call!35572 () Bool)

(assert (=> b!817490 (= e!453657 call!35572)))

(declare-fun b!817491 () Bool)

(declare-fun e!453654 () Bool)

(declare-fun contains!4134 (List!15402 (_ BitVec 64)) Bool)

(assert (=> b!817491 (= e!453654 (contains!4134 Nil!15399 (select (arr!21600 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35569 () Bool)

(declare-fun c!88993 () Bool)

(assert (=> bm!35569 (= call!35572 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88993 (Cons!15398 (select (arr!21600 _keys!976) #b00000000000000000000000000000000) Nil!15399) Nil!15399)))))

(declare-fun b!817492 () Bool)

(declare-fun e!453656 () Bool)

(assert (=> b!817492 (= e!453656 e!453657)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!817492 (= c!88993 (validKeyInArray!0 (select (arr!21600 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!817493 () Bool)

(assert (=> b!817493 (= e!453657 call!35572)))

(declare-fun b!817494 () Bool)

(assert (=> b!817494 (= e!453655 e!453656)))

(declare-fun res!558045 () Bool)

(assert (=> b!817494 (=> (not res!558045) (not e!453656))))

(assert (=> b!817494 (= res!558045 (not e!453654))))

(declare-fun res!558044 () Bool)

(assert (=> b!817494 (=> (not res!558044) (not e!453654))))

(assert (=> b!817494 (= res!558044 (validKeyInArray!0 (select (arr!21600 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104387 (not res!558043)) b!817494))

(assert (= (and b!817494 res!558044) b!817491))

(assert (= (and b!817494 res!558045) b!817492))

(assert (= (and b!817492 c!88993) b!817493))

(assert (= (and b!817492 (not c!88993)) b!817490))

(assert (= (or b!817493 b!817490) bm!35569))

(declare-fun m!758527 () Bool)

(assert (=> b!817491 m!758527))

(assert (=> b!817491 m!758527))

(declare-fun m!758529 () Bool)

(assert (=> b!817491 m!758529))

(assert (=> bm!35569 m!758527))

(declare-fun m!758531 () Bool)

(assert (=> bm!35569 m!758531))

(assert (=> b!817492 m!758527))

(assert (=> b!817492 m!758527))

(declare-fun m!758533 () Bool)

(assert (=> b!817492 m!758533))

(assert (=> b!817494 m!758527))

(assert (=> b!817494 m!758527))

(assert (=> b!817494 m!758533))

(assert (=> b!817433 d!104387))

(declare-fun d!104389 () Bool)

(assert (=> d!104389 (= (getCurrentListMapNoExtraKeys!2271 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2271 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366132 () Unit!27850)

(declare-fun choose!1400 (array!45087 array!45089 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24275 V!24275 V!24275 V!24275 (_ BitVec 32) Int) Unit!27850)

(assert (=> d!104389 (= lt!366132 (choose!1400 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104389 (validMask!0 mask!1312)))

(assert (=> d!104389 (= (lemmaNoChangeToArrayThenSameMapNoExtras!364 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366132)))

(declare-fun bs!22752 () Bool)

(assert (= bs!22752 d!104389))

(assert (=> bs!22752 m!758479))

(assert (=> bs!22752 m!758477))

(declare-fun m!758535 () Bool)

(assert (=> bs!22752 m!758535))

(assert (=> bs!22752 m!758485))

(assert (=> b!817432 d!104389))

(declare-fun b!817519 () Bool)

(declare-fun e!453677 () Bool)

(declare-fun e!453673 () Bool)

(assert (=> b!817519 (= e!453677 e!453673)))

(declare-fun c!89004 () Bool)

(declare-fun e!453678 () Bool)

(assert (=> b!817519 (= c!89004 e!453678)))

(declare-fun res!558056 () Bool)

(assert (=> b!817519 (=> (not res!558056) (not e!453678))))

(assert (=> b!817519 (= res!558056 (bvslt #b00000000000000000000000000000000 (size!22021 _keys!976)))))

(declare-fun b!817520 () Bool)

(declare-fun e!453674 () Bool)

(declare-fun lt!366149 () ListLongMap!8391)

(declare-fun isEmpty!639 (ListLongMap!8391) Bool)

(assert (=> b!817520 (= e!453674 (isEmpty!639 lt!366149))))

(declare-fun d!104391 () Bool)

(assert (=> d!104391 e!453677))

(declare-fun res!558055 () Bool)

(assert (=> d!104391 (=> (not res!558055) (not e!453677))))

(declare-fun contains!4135 (ListLongMap!8391 (_ BitVec 64)) Bool)

(assert (=> d!104391 (= res!558055 (not (contains!4135 lt!366149 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!453675 () ListLongMap!8391)

(assert (=> d!104391 (= lt!366149 e!453675)))

(declare-fun c!89002 () Bool)

(assert (=> d!104391 (= c!89002 (bvsge #b00000000000000000000000000000000 (size!22021 _keys!976)))))

(assert (=> d!104391 (validMask!0 mask!1312)))

(assert (=> d!104391 (= (getCurrentListMapNoExtraKeys!2271 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366149)))

(declare-fun b!817521 () Bool)

(assert (=> b!817521 (= e!453673 e!453674)))

(declare-fun c!89005 () Bool)

(assert (=> b!817521 (= c!89005 (bvslt #b00000000000000000000000000000000 (size!22021 _keys!976)))))

(declare-fun b!817522 () Bool)

(assert (=> b!817522 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22021 _keys!976)))))

(assert (=> b!817522 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22022 _values!788)))))

(declare-fun e!453672 () Bool)

(declare-fun apply!352 (ListLongMap!8391 (_ BitVec 64)) V!24275)

(declare-fun get!11553 (ValueCell!6812 V!24275) V!24275)

(declare-fun dynLambda!966 (Int (_ BitVec 64)) V!24275)

(assert (=> b!817522 (= e!453672 (= (apply!352 lt!366149 (select (arr!21600 _keys!976) #b00000000000000000000000000000000)) (get!11553 (select (arr!21601 _values!788) #b00000000000000000000000000000000) (dynLambda!966 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!817523 () Bool)

(assert (=> b!817523 (= e!453678 (validKeyInArray!0 (select (arr!21600 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!817523 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!817524 () Bool)

(assert (=> b!817524 (= e!453674 (= lt!366149 (getCurrentListMapNoExtraKeys!2271 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!817525 () Bool)

(declare-fun e!453676 () ListLongMap!8391)

(declare-fun call!35575 () ListLongMap!8391)

(assert (=> b!817525 (= e!453676 call!35575)))

(declare-fun b!817526 () Bool)

(assert (=> b!817526 (= e!453673 e!453672)))

(assert (=> b!817526 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22021 _keys!976)))))

(declare-fun res!558054 () Bool)

(assert (=> b!817526 (= res!558054 (contains!4135 lt!366149 (select (arr!21600 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!817526 (=> (not res!558054) (not e!453672))))

(declare-fun b!817527 () Bool)

(declare-fun lt!366152 () Unit!27850)

(declare-fun lt!366150 () Unit!27850)

(assert (=> b!817527 (= lt!366152 lt!366150)))

(declare-fun lt!366148 () V!24275)

(declare-fun lt!366153 () ListLongMap!8391)

(declare-fun lt!366147 () (_ BitVec 64))

(declare-fun lt!366151 () (_ BitVec 64))

(declare-fun +!1854 (ListLongMap!8391 tuple2!9578) ListLongMap!8391)

(assert (=> b!817527 (not (contains!4135 (+!1854 lt!366153 (tuple2!9579 lt!366147 lt!366148)) lt!366151))))

(declare-fun addStillNotContains!178 (ListLongMap!8391 (_ BitVec 64) V!24275 (_ BitVec 64)) Unit!27850)

(assert (=> b!817527 (= lt!366150 (addStillNotContains!178 lt!366153 lt!366147 lt!366148 lt!366151))))

(assert (=> b!817527 (= lt!366151 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!817527 (= lt!366148 (get!11553 (select (arr!21601 _values!788) #b00000000000000000000000000000000) (dynLambda!966 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!817527 (= lt!366147 (select (arr!21600 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!817527 (= lt!366153 call!35575)))

(assert (=> b!817527 (= e!453676 (+!1854 call!35575 (tuple2!9579 (select (arr!21600 _keys!976) #b00000000000000000000000000000000) (get!11553 (select (arr!21601 _values!788) #b00000000000000000000000000000000) (dynLambda!966 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!817528 () Bool)

(assert (=> b!817528 (= e!453675 e!453676)))

(declare-fun c!89003 () Bool)

(assert (=> b!817528 (= c!89003 (validKeyInArray!0 (select (arr!21600 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!817529 () Bool)

(declare-fun res!558057 () Bool)

(assert (=> b!817529 (=> (not res!558057) (not e!453677))))

(assert (=> b!817529 (= res!558057 (not (contains!4135 lt!366149 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!35572 () Bool)

(assert (=> bm!35572 (= call!35575 (getCurrentListMapNoExtraKeys!2271 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!817530 () Bool)

(assert (=> b!817530 (= e!453675 (ListLongMap!8392 Nil!15398))))

(assert (= (and d!104391 c!89002) b!817530))

(assert (= (and d!104391 (not c!89002)) b!817528))

(assert (= (and b!817528 c!89003) b!817527))

(assert (= (and b!817528 (not c!89003)) b!817525))

(assert (= (or b!817527 b!817525) bm!35572))

(assert (= (and d!104391 res!558055) b!817529))

(assert (= (and b!817529 res!558057) b!817519))

(assert (= (and b!817519 res!558056) b!817523))

(assert (= (and b!817519 c!89004) b!817526))

(assert (= (and b!817519 (not c!89004)) b!817521))

(assert (= (and b!817526 res!558054) b!817522))

(assert (= (and b!817521 c!89005) b!817524))

(assert (= (and b!817521 (not c!89005)) b!817520))

(declare-fun b_lambda!10893 () Bool)

(assert (=> (not b_lambda!10893) (not b!817522)))

(declare-fun t!21722 () Bool)

(declare-fun tb!4177 () Bool)

(assert (=> (and start!70368 (= defaultEntry!796 defaultEntry!796) t!21722) tb!4177))

(declare-fun result!7887 () Bool)

(assert (=> tb!4177 (= result!7887 tp_is_empty!14455)))

(assert (=> b!817522 t!21722))

(declare-fun b_and!21537 () Bool)

(assert (= b_and!21531 (and (=> t!21722 result!7887) b_and!21537)))

(declare-fun b_lambda!10895 () Bool)

(assert (=> (not b_lambda!10895) (not b!817527)))

(assert (=> b!817527 t!21722))

(declare-fun b_and!21539 () Bool)

(assert (= b_and!21537 (and (=> t!21722 result!7887) b_and!21539)))

(declare-fun m!758537 () Bool)

(assert (=> b!817529 m!758537))

(assert (=> b!817522 m!758527))

(declare-fun m!758539 () Bool)

(assert (=> b!817522 m!758539))

(assert (=> b!817522 m!758527))

(declare-fun m!758541 () Bool)

(assert (=> b!817522 m!758541))

(assert (=> b!817522 m!758541))

(declare-fun m!758543 () Bool)

(assert (=> b!817522 m!758543))

(declare-fun m!758545 () Bool)

(assert (=> b!817522 m!758545))

(assert (=> b!817522 m!758543))

(assert (=> b!817528 m!758527))

(assert (=> b!817528 m!758527))

(assert (=> b!817528 m!758533))

(declare-fun m!758547 () Bool)

(assert (=> b!817527 m!758547))

(assert (=> b!817527 m!758547))

(declare-fun m!758549 () Bool)

(assert (=> b!817527 m!758549))

(assert (=> b!817527 m!758527))

(assert (=> b!817527 m!758541))

(assert (=> b!817527 m!758541))

(assert (=> b!817527 m!758543))

(assert (=> b!817527 m!758545))

(assert (=> b!817527 m!758543))

(declare-fun m!758551 () Bool)

(assert (=> b!817527 m!758551))

(declare-fun m!758553 () Bool)

(assert (=> b!817527 m!758553))

(declare-fun m!758555 () Bool)

(assert (=> b!817524 m!758555))

(declare-fun m!758557 () Bool)

(assert (=> d!104391 m!758557))

(assert (=> d!104391 m!758485))

(assert (=> b!817526 m!758527))

(assert (=> b!817526 m!758527))

(declare-fun m!758559 () Bool)

(assert (=> b!817526 m!758559))

(declare-fun m!758561 () Bool)

(assert (=> b!817520 m!758561))

(assert (=> bm!35572 m!758555))

(assert (=> b!817523 m!758527))

(assert (=> b!817523 m!758527))

(assert (=> b!817523 m!758533))

(assert (=> b!817432 d!104391))

(declare-fun b!817533 () Bool)

(declare-fun e!453684 () Bool)

(declare-fun e!453680 () Bool)

(assert (=> b!817533 (= e!453684 e!453680)))

(declare-fun c!89008 () Bool)

(declare-fun e!453685 () Bool)

(assert (=> b!817533 (= c!89008 e!453685)))

(declare-fun res!558060 () Bool)

(assert (=> b!817533 (=> (not res!558060) (not e!453685))))

(assert (=> b!817533 (= res!558060 (bvslt #b00000000000000000000000000000000 (size!22021 _keys!976)))))

(declare-fun b!817534 () Bool)

(declare-fun e!453681 () Bool)

(declare-fun lt!366156 () ListLongMap!8391)

(assert (=> b!817534 (= e!453681 (isEmpty!639 lt!366156))))

(declare-fun d!104393 () Bool)

(assert (=> d!104393 e!453684))

(declare-fun res!558059 () Bool)

(assert (=> d!104393 (=> (not res!558059) (not e!453684))))

(assert (=> d!104393 (= res!558059 (not (contains!4135 lt!366156 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!453682 () ListLongMap!8391)

(assert (=> d!104393 (= lt!366156 e!453682)))

(declare-fun c!89006 () Bool)

(assert (=> d!104393 (= c!89006 (bvsge #b00000000000000000000000000000000 (size!22021 _keys!976)))))

(assert (=> d!104393 (validMask!0 mask!1312)))

(assert (=> d!104393 (= (getCurrentListMapNoExtraKeys!2271 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366156)))

(declare-fun b!817535 () Bool)

(assert (=> b!817535 (= e!453680 e!453681)))

(declare-fun c!89009 () Bool)

(assert (=> b!817535 (= c!89009 (bvslt #b00000000000000000000000000000000 (size!22021 _keys!976)))))

(declare-fun b!817536 () Bool)

(assert (=> b!817536 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22021 _keys!976)))))

(assert (=> b!817536 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22022 _values!788)))))

(declare-fun e!453679 () Bool)

(assert (=> b!817536 (= e!453679 (= (apply!352 lt!366156 (select (arr!21600 _keys!976) #b00000000000000000000000000000000)) (get!11553 (select (arr!21601 _values!788) #b00000000000000000000000000000000) (dynLambda!966 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!817537 () Bool)

(assert (=> b!817537 (= e!453685 (validKeyInArray!0 (select (arr!21600 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!817537 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!817538 () Bool)

(assert (=> b!817538 (= e!453681 (= lt!366156 (getCurrentListMapNoExtraKeys!2271 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!817539 () Bool)

(declare-fun e!453683 () ListLongMap!8391)

(declare-fun call!35576 () ListLongMap!8391)

(assert (=> b!817539 (= e!453683 call!35576)))

(declare-fun b!817540 () Bool)

(assert (=> b!817540 (= e!453680 e!453679)))

(assert (=> b!817540 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22021 _keys!976)))))

(declare-fun res!558058 () Bool)

(assert (=> b!817540 (= res!558058 (contains!4135 lt!366156 (select (arr!21600 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!817540 (=> (not res!558058) (not e!453679))))

(declare-fun b!817541 () Bool)

(declare-fun lt!366159 () Unit!27850)

(declare-fun lt!366157 () Unit!27850)

(assert (=> b!817541 (= lt!366159 lt!366157)))

(declare-fun lt!366154 () (_ BitVec 64))

(declare-fun lt!366158 () (_ BitVec 64))

(declare-fun lt!366160 () ListLongMap!8391)

(declare-fun lt!366155 () V!24275)

(assert (=> b!817541 (not (contains!4135 (+!1854 lt!366160 (tuple2!9579 lt!366154 lt!366155)) lt!366158))))

(assert (=> b!817541 (= lt!366157 (addStillNotContains!178 lt!366160 lt!366154 lt!366155 lt!366158))))

(assert (=> b!817541 (= lt!366158 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!817541 (= lt!366155 (get!11553 (select (arr!21601 _values!788) #b00000000000000000000000000000000) (dynLambda!966 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!817541 (= lt!366154 (select (arr!21600 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!817541 (= lt!366160 call!35576)))

(assert (=> b!817541 (= e!453683 (+!1854 call!35576 (tuple2!9579 (select (arr!21600 _keys!976) #b00000000000000000000000000000000) (get!11553 (select (arr!21601 _values!788) #b00000000000000000000000000000000) (dynLambda!966 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!817542 () Bool)

(assert (=> b!817542 (= e!453682 e!453683)))

(declare-fun c!89007 () Bool)

(assert (=> b!817542 (= c!89007 (validKeyInArray!0 (select (arr!21600 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!817543 () Bool)

(declare-fun res!558061 () Bool)

(assert (=> b!817543 (=> (not res!558061) (not e!453684))))

(assert (=> b!817543 (= res!558061 (not (contains!4135 lt!366156 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!35573 () Bool)

(assert (=> bm!35573 (= call!35576 (getCurrentListMapNoExtraKeys!2271 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!817544 () Bool)

(assert (=> b!817544 (= e!453682 (ListLongMap!8392 Nil!15398))))

(assert (= (and d!104393 c!89006) b!817544))

(assert (= (and d!104393 (not c!89006)) b!817542))

(assert (= (and b!817542 c!89007) b!817541))

(assert (= (and b!817542 (not c!89007)) b!817539))

(assert (= (or b!817541 b!817539) bm!35573))

(assert (= (and d!104393 res!558059) b!817543))

(assert (= (and b!817543 res!558061) b!817533))

(assert (= (and b!817533 res!558060) b!817537))

(assert (= (and b!817533 c!89008) b!817540))

(assert (= (and b!817533 (not c!89008)) b!817535))

(assert (= (and b!817540 res!558058) b!817536))

(assert (= (and b!817535 c!89009) b!817538))

(assert (= (and b!817535 (not c!89009)) b!817534))

(declare-fun b_lambda!10897 () Bool)

(assert (=> (not b_lambda!10897) (not b!817536)))

(assert (=> b!817536 t!21722))

(declare-fun b_and!21541 () Bool)

(assert (= b_and!21539 (and (=> t!21722 result!7887) b_and!21541)))

(declare-fun b_lambda!10899 () Bool)

(assert (=> (not b_lambda!10899) (not b!817541)))

(assert (=> b!817541 t!21722))

(declare-fun b_and!21543 () Bool)

(assert (= b_and!21541 (and (=> t!21722 result!7887) b_and!21543)))

(declare-fun m!758563 () Bool)

(assert (=> b!817543 m!758563))

(assert (=> b!817536 m!758527))

(declare-fun m!758565 () Bool)

(assert (=> b!817536 m!758565))

(assert (=> b!817536 m!758527))

(assert (=> b!817536 m!758541))

(assert (=> b!817536 m!758541))

(assert (=> b!817536 m!758543))

(assert (=> b!817536 m!758545))

(assert (=> b!817536 m!758543))

(assert (=> b!817542 m!758527))

(assert (=> b!817542 m!758527))

(assert (=> b!817542 m!758533))

(declare-fun m!758567 () Bool)

(assert (=> b!817541 m!758567))

(assert (=> b!817541 m!758567))

(declare-fun m!758569 () Bool)

(assert (=> b!817541 m!758569))

(assert (=> b!817541 m!758527))

(assert (=> b!817541 m!758541))

(assert (=> b!817541 m!758541))

(assert (=> b!817541 m!758543))

(assert (=> b!817541 m!758545))

(assert (=> b!817541 m!758543))

(declare-fun m!758571 () Bool)

(assert (=> b!817541 m!758571))

(declare-fun m!758573 () Bool)

(assert (=> b!817541 m!758573))

(declare-fun m!758575 () Bool)

(assert (=> b!817538 m!758575))

(declare-fun m!758577 () Bool)

(assert (=> d!104393 m!758577))

(assert (=> d!104393 m!758485))

(assert (=> b!817540 m!758527))

(assert (=> b!817540 m!758527))

(declare-fun m!758579 () Bool)

(assert (=> b!817540 m!758579))

(declare-fun m!758581 () Bool)

(assert (=> b!817534 m!758581))

(assert (=> bm!35573 m!758575))

(assert (=> b!817537 m!758527))

(assert (=> b!817537 m!758527))

(assert (=> b!817537 m!758533))

(assert (=> b!817432 d!104393))

(declare-fun b!817553 () Bool)

(declare-fun e!453692 () Bool)

(declare-fun e!453694 () Bool)

(assert (=> b!817553 (= e!453692 e!453694)))

(declare-fun lt!366167 () (_ BitVec 64))

(assert (=> b!817553 (= lt!366167 (select (arr!21600 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366169 () Unit!27850)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45087 (_ BitVec 64) (_ BitVec 32)) Unit!27850)

(assert (=> b!817553 (= lt!366169 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!366167 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!817553 (arrayContainsKey!0 _keys!976 lt!366167 #b00000000000000000000000000000000)))

(declare-fun lt!366168 () Unit!27850)

(assert (=> b!817553 (= lt!366168 lt!366169)))

(declare-fun res!558066 () Bool)

(declare-datatypes ((SeekEntryResult!8720 0))(
  ( (MissingZero!8720 (index!37251 (_ BitVec 32))) (Found!8720 (index!37252 (_ BitVec 32))) (Intermediate!8720 (undefined!9532 Bool) (index!37253 (_ BitVec 32)) (x!68860 (_ BitVec 32))) (Undefined!8720) (MissingVacant!8720 (index!37254 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45087 (_ BitVec 32)) SeekEntryResult!8720)

(assert (=> b!817553 (= res!558066 (= (seekEntryOrOpen!0 (select (arr!21600 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8720 #b00000000000000000000000000000000)))))

(assert (=> b!817553 (=> (not res!558066) (not e!453694))))

(declare-fun b!817554 () Bool)

(declare-fun e!453693 () Bool)

(assert (=> b!817554 (= e!453693 e!453692)))

(declare-fun c!89012 () Bool)

(assert (=> b!817554 (= c!89012 (validKeyInArray!0 (select (arr!21600 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!817556 () Bool)

(declare-fun call!35579 () Bool)

(assert (=> b!817556 (= e!453692 call!35579)))

(declare-fun bm!35576 () Bool)

(assert (=> bm!35576 (= call!35579 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun d!104395 () Bool)

(declare-fun res!558067 () Bool)

(assert (=> d!104395 (=> res!558067 e!453693)))

(assert (=> d!104395 (= res!558067 (bvsge #b00000000000000000000000000000000 (size!22021 _keys!976)))))

(assert (=> d!104395 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!453693)))

(declare-fun b!817555 () Bool)

(assert (=> b!817555 (= e!453694 call!35579)))

(assert (= (and d!104395 (not res!558067)) b!817554))

(assert (= (and b!817554 c!89012) b!817553))

(assert (= (and b!817554 (not c!89012)) b!817556))

(assert (= (and b!817553 res!558066) b!817555))

(assert (= (or b!817555 b!817556) bm!35576))

(assert (=> b!817553 m!758527))

(declare-fun m!758583 () Bool)

(assert (=> b!817553 m!758583))

(declare-fun m!758585 () Bool)

(assert (=> b!817553 m!758585))

(assert (=> b!817553 m!758527))

(declare-fun m!758587 () Bool)

(assert (=> b!817553 m!758587))

(assert (=> b!817554 m!758527))

(assert (=> b!817554 m!758527))

(assert (=> b!817554 m!758533))

(declare-fun m!758589 () Bool)

(assert (=> bm!35576 m!758589))

(assert (=> b!817431 d!104395))

(declare-fun d!104397 () Bool)

(assert (=> d!104397 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70368 d!104397))

(declare-fun d!104399 () Bool)

(assert (=> d!104399 (= (array_inv!17345 _keys!976) (bvsge (size!22021 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70368 d!104399))

(declare-fun d!104401 () Bool)

(assert (=> d!104401 (= (array_inv!17346 _values!788) (bvsge (size!22022 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70368 d!104401))

(declare-fun b!817564 () Bool)

(declare-fun e!453699 () Bool)

(assert (=> b!817564 (= e!453699 tp_is_empty!14455)))

(declare-fun mapNonEmpty!23284 () Bool)

(declare-fun mapRes!23284 () Bool)

(declare-fun tp!44977 () Bool)

(declare-fun e!453700 () Bool)

(assert (=> mapNonEmpty!23284 (= mapRes!23284 (and tp!44977 e!453700))))

(declare-fun mapValue!23284 () ValueCell!6812)

(declare-fun mapRest!23284 () (Array (_ BitVec 32) ValueCell!6812))

(declare-fun mapKey!23284 () (_ BitVec 32))

(assert (=> mapNonEmpty!23284 (= mapRest!23275 (store mapRest!23284 mapKey!23284 mapValue!23284))))

(declare-fun condMapEmpty!23284 () Bool)

(declare-fun mapDefault!23284 () ValueCell!6812)

(assert (=> mapNonEmpty!23275 (= condMapEmpty!23284 (= mapRest!23275 ((as const (Array (_ BitVec 32) ValueCell!6812)) mapDefault!23284)))))

(assert (=> mapNonEmpty!23275 (= tp!44962 (and e!453699 mapRes!23284))))

(declare-fun mapIsEmpty!23284 () Bool)

(assert (=> mapIsEmpty!23284 mapRes!23284))

(declare-fun b!817563 () Bool)

(assert (=> b!817563 (= e!453700 tp_is_empty!14455)))

(assert (= (and mapNonEmpty!23275 condMapEmpty!23284) mapIsEmpty!23284))

(assert (= (and mapNonEmpty!23275 (not condMapEmpty!23284)) mapNonEmpty!23284))

(assert (= (and mapNonEmpty!23284 ((_ is ValueCellFull!6812) mapValue!23284)) b!817563))

(assert (= (and mapNonEmpty!23275 ((_ is ValueCellFull!6812) mapDefault!23284)) b!817564))

(declare-fun m!758591 () Bool)

(assert (=> mapNonEmpty!23284 m!758591))

(declare-fun b_lambda!10901 () Bool)

(assert (= b_lambda!10899 (or (and start!70368 b_free!12745) b_lambda!10901)))

(declare-fun b_lambda!10903 () Bool)

(assert (= b_lambda!10897 (or (and start!70368 b_free!12745) b_lambda!10903)))

(declare-fun b_lambda!10905 () Bool)

(assert (= b_lambda!10893 (or (and start!70368 b_free!12745) b_lambda!10905)))

(declare-fun b_lambda!10907 () Bool)

(assert (= b_lambda!10895 (or (and start!70368 b_free!12745) b_lambda!10907)))

(check-sat (not b_lambda!10905) (not b!817520) (not b_next!12745) (not bm!35569) (not b!817537) (not b!817524) (not b_lambda!10901) (not d!104389) (not b!817522) (not b!817554) (not b!817541) (not bm!35572) (not b!817534) (not d!104393) (not b!817492) (not b_lambda!10907) (not b!817491) (not b!817528) (not b!817526) (not b!817523) (not b!817542) (not b!817553) (not b!817543) (not d!104391) (not b!817529) b_and!21543 (not bm!35576) tp_is_empty!14455 (not bm!35573) (not b!817536) (not b_lambda!10903) (not b!817538) (not b!817527) (not mapNonEmpty!23284) (not b!817494) (not b!817540))
(check-sat b_and!21543 (not b_next!12745))
