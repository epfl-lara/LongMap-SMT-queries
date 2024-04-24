; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42422 () Bool)

(assert start!42422)

(declare-fun b_free!11911 () Bool)

(declare-fun b_next!11911 () Bool)

(assert (=> start!42422 (= b_free!11911 (not b_next!11911))))

(declare-fun tp!41766 () Bool)

(declare-fun b_and!20377 () Bool)

(assert (=> start!42422 (= tp!41766 b_and!20377)))

(declare-fun b!473443 () Bool)

(declare-fun e!277762 () Bool)

(declare-fun tp_is_empty!13339 () Bool)

(assert (=> b!473443 (= e!277762 tp_is_empty!13339)))

(declare-fun b!473444 () Bool)

(declare-fun res!282833 () Bool)

(declare-fun e!277764 () Bool)

(assert (=> b!473444 (=> (not res!282833) (not e!277764))))

(declare-datatypes ((array!30410 0))(
  ( (array!30411 (arr!14624 (Array (_ BitVec 32) (_ BitVec 64))) (size!14976 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30410)

(declare-datatypes ((List!8836 0))(
  ( (Nil!8833) (Cons!8832 (h!9688 (_ BitVec 64)) (t!14798 List!8836)) )
))
(declare-fun arrayNoDuplicates!0 (array!30410 (_ BitVec 32) List!8836) Bool)

(assert (=> b!473444 (= res!282833 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8833))))

(declare-fun mapIsEmpty!21721 () Bool)

(declare-fun mapRes!21721 () Bool)

(assert (=> mapIsEmpty!21721 mapRes!21721))

(declare-fun b!473445 () Bool)

(declare-fun e!277766 () Bool)

(assert (=> b!473445 (= e!277766 tp_is_empty!13339)))

(declare-fun b!473446 () Bool)

(declare-fun e!277761 () Bool)

(assert (=> b!473446 (= e!277761 (bvsle #b00000000000000000000000000000000 (size!14976 _keys!1025)))))

(declare-datatypes ((V!18891 0))(
  ( (V!18892 (val!6714 Int)) )
))
(declare-datatypes ((tuple2!8774 0))(
  ( (tuple2!8775 (_1!4398 (_ BitVec 64)) (_2!4398 V!18891)) )
))
(declare-datatypes ((List!8837 0))(
  ( (Nil!8834) (Cons!8833 (h!9689 tuple2!8774) (t!14799 List!8837)) )
))
(declare-datatypes ((ListLongMap!7689 0))(
  ( (ListLongMap!7690 (toList!3860 List!8837)) )
))
(declare-fun lt!215222 () ListLongMap!7689)

(declare-fun lt!215218 () tuple2!8774)

(declare-fun minValueBefore!38 () V!18891)

(declare-fun +!1743 (ListLongMap!7689 tuple2!8774) ListLongMap!7689)

(assert (=> b!473446 (= (+!1743 lt!215222 lt!215218) (+!1743 (+!1743 lt!215222 (tuple2!8775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215218))))

(declare-fun minValueAfter!38 () V!18891)

(assert (=> b!473446 (= lt!215218 (tuple2!8775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13924 0))(
  ( (Unit!13925) )
))
(declare-fun lt!215224 () Unit!13924)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!145 (ListLongMap!7689 (_ BitVec 64) V!18891 V!18891) Unit!13924)

(assert (=> b!473446 (= lt!215224 (addSameAsAddTwiceSameKeyDiffValues!145 lt!215222 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215217 () ListLongMap!7689)

(declare-fun zeroValue!794 () V!18891)

(assert (=> b!473446 (= lt!215222 (+!1743 lt!215217 (tuple2!8775 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!215223 () ListLongMap!7689)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6326 0))(
  ( (ValueCellFull!6326 (v!9006 V!18891)) (EmptyCell!6326) )
))
(declare-datatypes ((array!30412 0))(
  ( (array!30413 (arr!14625 (Array (_ BitVec 32) ValueCell!6326)) (size!14977 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30412)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2223 (array!30410 array!30412 (_ BitVec 32) (_ BitVec 32) V!18891 V!18891 (_ BitVec 32) Int) ListLongMap!7689)

(assert (=> b!473446 (= lt!215223 (getCurrentListMap!2223 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215221 () ListLongMap!7689)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473446 (= lt!215221 (getCurrentListMap!2223 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473447 () Bool)

(assert (=> b!473447 (= e!277764 (not e!277761))))

(declare-fun res!282832 () Bool)

(assert (=> b!473447 (=> res!282832 e!277761)))

(assert (=> b!473447 (= res!282832 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215220 () ListLongMap!7689)

(assert (=> b!473447 (= lt!215217 lt!215220)))

(declare-fun lt!215219 () Unit!13924)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!229 (array!30410 array!30412 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18891 V!18891 V!18891 V!18891 (_ BitVec 32) Int) Unit!13924)

(assert (=> b!473447 (= lt!215219 (lemmaNoChangeToArrayThenSameMapNoExtras!229 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2069 (array!30410 array!30412 (_ BitVec 32) (_ BitVec 32) V!18891 V!18891 (_ BitVec 32) Int) ListLongMap!7689)

(assert (=> b!473447 (= lt!215220 (getCurrentListMapNoExtraKeys!2069 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473447 (= lt!215217 (getCurrentListMapNoExtraKeys!2069 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473448 () Bool)

(declare-fun e!277765 () Bool)

(assert (=> b!473448 (= e!277765 (and e!277762 mapRes!21721))))

(declare-fun condMapEmpty!21721 () Bool)

(declare-fun mapDefault!21721 () ValueCell!6326)

(assert (=> b!473448 (= condMapEmpty!21721 (= (arr!14625 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6326)) mapDefault!21721)))))

(declare-fun b!473449 () Bool)

(declare-fun res!282834 () Bool)

(assert (=> b!473449 (=> (not res!282834) (not e!277764))))

(assert (=> b!473449 (= res!282834 (and (= (size!14977 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14976 _keys!1025) (size!14977 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473450 () Bool)

(declare-fun res!282830 () Bool)

(assert (=> b!473450 (=> (not res!282830) (not e!277764))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30410 (_ BitVec 32)) Bool)

(assert (=> b!473450 (= res!282830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21721 () Bool)

(declare-fun tp!41767 () Bool)

(assert (=> mapNonEmpty!21721 (= mapRes!21721 (and tp!41767 e!277766))))

(declare-fun mapValue!21721 () ValueCell!6326)

(declare-fun mapKey!21721 () (_ BitVec 32))

(declare-fun mapRest!21721 () (Array (_ BitVec 32) ValueCell!6326))

(assert (=> mapNonEmpty!21721 (= (arr!14625 _values!833) (store mapRest!21721 mapKey!21721 mapValue!21721))))

(declare-fun res!282831 () Bool)

(assert (=> start!42422 (=> (not res!282831) (not e!277764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42422 (= res!282831 (validMask!0 mask!1365))))

(assert (=> start!42422 e!277764))

(assert (=> start!42422 tp_is_empty!13339))

(assert (=> start!42422 tp!41766))

(assert (=> start!42422 true))

(declare-fun array_inv!10632 (array!30410) Bool)

(assert (=> start!42422 (array_inv!10632 _keys!1025)))

(declare-fun array_inv!10633 (array!30412) Bool)

(assert (=> start!42422 (and (array_inv!10633 _values!833) e!277765)))

(assert (= (and start!42422 res!282831) b!473449))

(assert (= (and b!473449 res!282834) b!473450))

(assert (= (and b!473450 res!282830) b!473444))

(assert (= (and b!473444 res!282833) b!473447))

(assert (= (and b!473447 (not res!282832)) b!473446))

(assert (= (and b!473448 condMapEmpty!21721) mapIsEmpty!21721))

(assert (= (and b!473448 (not condMapEmpty!21721)) mapNonEmpty!21721))

(get-info :version)

(assert (= (and mapNonEmpty!21721 ((_ is ValueCellFull!6326) mapValue!21721)) b!473445))

(assert (= (and b!473448 ((_ is ValueCellFull!6326) mapDefault!21721)) b!473443))

(assert (= start!42422 b!473448))

(declare-fun m!455759 () Bool)

(assert (=> b!473446 m!455759))

(declare-fun m!455761 () Bool)

(assert (=> b!473446 m!455761))

(declare-fun m!455763 () Bool)

(assert (=> b!473446 m!455763))

(declare-fun m!455765 () Bool)

(assert (=> b!473446 m!455765))

(assert (=> b!473446 m!455761))

(declare-fun m!455767 () Bool)

(assert (=> b!473446 m!455767))

(declare-fun m!455769 () Bool)

(assert (=> b!473446 m!455769))

(declare-fun m!455771 () Bool)

(assert (=> b!473446 m!455771))

(declare-fun m!455773 () Bool)

(assert (=> b!473447 m!455773))

(declare-fun m!455775 () Bool)

(assert (=> b!473447 m!455775))

(declare-fun m!455777 () Bool)

(assert (=> b!473447 m!455777))

(declare-fun m!455779 () Bool)

(assert (=> start!42422 m!455779))

(declare-fun m!455781 () Bool)

(assert (=> start!42422 m!455781))

(declare-fun m!455783 () Bool)

(assert (=> start!42422 m!455783))

(declare-fun m!455785 () Bool)

(assert (=> b!473450 m!455785))

(declare-fun m!455787 () Bool)

(assert (=> mapNonEmpty!21721 m!455787))

(declare-fun m!455789 () Bool)

(assert (=> b!473444 m!455789))

(check-sat (not b!473447) (not mapNonEmpty!21721) b_and!20377 tp_is_empty!13339 (not b!473450) (not start!42422) (not b!473446) (not b_next!11911) (not b!473444))
(check-sat b_and!20377 (not b_next!11911))
(get-model)

(declare-fun b!473507 () Bool)

(declare-fun e!277810 () Bool)

(declare-fun call!30481 () Bool)

(assert (=> b!473507 (= e!277810 call!30481)))

(declare-fun bm!30478 () Bool)

(assert (=> bm!30478 (= call!30481 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!473508 () Bool)

(declare-fun e!277809 () Bool)

(assert (=> b!473508 (= e!277810 e!277809)))

(declare-fun lt!215280 () (_ BitVec 64))

(assert (=> b!473508 (= lt!215280 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215279 () Unit!13924)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30410 (_ BitVec 64) (_ BitVec 32)) Unit!13924)

(assert (=> b!473508 (= lt!215279 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!215280 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30410 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!473508 (arrayContainsKey!0 _keys!1025 lt!215280 #b00000000000000000000000000000000)))

(declare-fun lt!215281 () Unit!13924)

(assert (=> b!473508 (= lt!215281 lt!215279)))

(declare-fun res!282870 () Bool)

(declare-datatypes ((SeekEntryResult!3505 0))(
  ( (MissingZero!3505 (index!16199 (_ BitVec 32))) (Found!3505 (index!16200 (_ BitVec 32))) (Intermediate!3505 (undefined!4317 Bool) (index!16201 (_ BitVec 32)) (x!44370 (_ BitVec 32))) (Undefined!3505) (MissingVacant!3505 (index!16202 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30410 (_ BitVec 32)) SeekEntryResult!3505)

(assert (=> b!473508 (= res!282870 (= (seekEntryOrOpen!0 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3505 #b00000000000000000000000000000000)))))

(assert (=> b!473508 (=> (not res!282870) (not e!277809))))

(declare-fun d!75531 () Bool)

(declare-fun res!282869 () Bool)

(declare-fun e!277811 () Bool)

(assert (=> d!75531 (=> res!282869 e!277811)))

(assert (=> d!75531 (= res!282869 (bvsge #b00000000000000000000000000000000 (size!14976 _keys!1025)))))

(assert (=> d!75531 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!277811)))

(declare-fun b!473509 () Bool)

(assert (=> b!473509 (= e!277809 call!30481)))

(declare-fun b!473510 () Bool)

(assert (=> b!473510 (= e!277811 e!277810)))

(declare-fun c!57024 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!473510 (= c!57024 (validKeyInArray!0 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75531 (not res!282869)) b!473510))

(assert (= (and b!473510 c!57024) b!473508))

(assert (= (and b!473510 (not c!57024)) b!473507))

(assert (= (and b!473508 res!282870) b!473509))

(assert (= (or b!473509 b!473507) bm!30478))

(declare-fun m!455855 () Bool)

(assert (=> bm!30478 m!455855))

(declare-fun m!455857 () Bool)

(assert (=> b!473508 m!455857))

(declare-fun m!455859 () Bool)

(assert (=> b!473508 m!455859))

(declare-fun m!455861 () Bool)

(assert (=> b!473508 m!455861))

(assert (=> b!473508 m!455857))

(declare-fun m!455863 () Bool)

(assert (=> b!473508 m!455863))

(assert (=> b!473510 m!455857))

(assert (=> b!473510 m!455857))

(declare-fun m!455865 () Bool)

(assert (=> b!473510 m!455865))

(assert (=> b!473450 d!75531))

(declare-fun d!75533 () Bool)

(assert (=> d!75533 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42422 d!75533))

(declare-fun d!75535 () Bool)

(assert (=> d!75535 (= (array_inv!10632 _keys!1025) (bvsge (size!14976 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42422 d!75535))

(declare-fun d!75537 () Bool)

(assert (=> d!75537 (= (array_inv!10633 _values!833) (bvsge (size!14977 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42422 d!75537))

(declare-fun bm!30481 () Bool)

(declare-fun call!30484 () Bool)

(declare-fun c!57027 () Bool)

(assert (=> bm!30481 (= call!30484 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57027 (Cons!8832 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000) Nil!8833) Nil!8833)))))

(declare-fun b!473521 () Bool)

(declare-fun e!277823 () Bool)

(declare-fun e!277822 () Bool)

(assert (=> b!473521 (= e!277823 e!277822)))

(assert (=> b!473521 (= c!57027 (validKeyInArray!0 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!473522 () Bool)

(declare-fun e!277821 () Bool)

(declare-fun contains!2529 (List!8836 (_ BitVec 64)) Bool)

(assert (=> b!473522 (= e!277821 (contains!2529 Nil!8833 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!473523 () Bool)

(assert (=> b!473523 (= e!277822 call!30484)))

(declare-fun b!473524 () Bool)

(assert (=> b!473524 (= e!277822 call!30484)))

(declare-fun d!75539 () Bool)

(declare-fun res!282877 () Bool)

(declare-fun e!277820 () Bool)

(assert (=> d!75539 (=> res!282877 e!277820)))

(assert (=> d!75539 (= res!282877 (bvsge #b00000000000000000000000000000000 (size!14976 _keys!1025)))))

(assert (=> d!75539 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8833) e!277820)))

(declare-fun b!473525 () Bool)

(assert (=> b!473525 (= e!277820 e!277823)))

(declare-fun res!282879 () Bool)

(assert (=> b!473525 (=> (not res!282879) (not e!277823))))

(assert (=> b!473525 (= res!282879 (not e!277821))))

(declare-fun res!282878 () Bool)

(assert (=> b!473525 (=> (not res!282878) (not e!277821))))

(assert (=> b!473525 (= res!282878 (validKeyInArray!0 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75539 (not res!282877)) b!473525))

(assert (= (and b!473525 res!282878) b!473522))

(assert (= (and b!473525 res!282879) b!473521))

(assert (= (and b!473521 c!57027) b!473524))

(assert (= (and b!473521 (not c!57027)) b!473523))

(assert (= (or b!473524 b!473523) bm!30481))

(assert (=> bm!30481 m!455857))

(declare-fun m!455867 () Bool)

(assert (=> bm!30481 m!455867))

(assert (=> b!473521 m!455857))

(assert (=> b!473521 m!455857))

(assert (=> b!473521 m!455865))

(assert (=> b!473522 m!455857))

(assert (=> b!473522 m!455857))

(declare-fun m!455869 () Bool)

(assert (=> b!473522 m!455869))

(assert (=> b!473525 m!455857))

(assert (=> b!473525 m!455857))

(assert (=> b!473525 m!455865))

(assert (=> b!473444 d!75539))

(declare-fun d!75541 () Bool)

(assert (=> d!75541 (= (getCurrentListMapNoExtraKeys!2069 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2069 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215284 () Unit!13924)

(declare-fun choose!1358 (array!30410 array!30412 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18891 V!18891 V!18891 V!18891 (_ BitVec 32) Int) Unit!13924)

(assert (=> d!75541 (= lt!215284 (choose!1358 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75541 (validMask!0 mask!1365)))

(assert (=> d!75541 (= (lemmaNoChangeToArrayThenSameMapNoExtras!229 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!215284)))

(declare-fun bs!15048 () Bool)

(assert (= bs!15048 d!75541))

(assert (=> bs!15048 m!455777))

(assert (=> bs!15048 m!455775))

(declare-fun m!455871 () Bool)

(assert (=> bs!15048 m!455871))

(assert (=> bs!15048 m!455779))

(assert (=> b!473447 d!75541))

(declare-fun b!473550 () Bool)

(declare-fun e!277838 () Bool)

(assert (=> b!473550 (= e!277838 (validKeyInArray!0 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!473550 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!473551 () Bool)

(declare-fun e!277839 () ListLongMap!7689)

(assert (=> b!473551 (= e!277839 (ListLongMap!7690 Nil!8834))))

(declare-fun b!473552 () Bool)

(declare-fun e!277844 () ListLongMap!7689)

(declare-fun call!30487 () ListLongMap!7689)

(assert (=> b!473552 (= e!277844 call!30487)))

(declare-fun lt!215305 () ListLongMap!7689)

(declare-fun b!473553 () Bool)

(declare-fun e!277842 () Bool)

(assert (=> b!473553 (= e!277842 (= lt!215305 (getCurrentListMapNoExtraKeys!2069 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!473554 () Bool)

(declare-fun e!277841 () Bool)

(assert (=> b!473554 (= e!277841 e!277842)))

(declare-fun c!57039 () Bool)

(assert (=> b!473554 (= c!57039 (bvslt #b00000000000000000000000000000000 (size!14976 _keys!1025)))))

(declare-fun d!75543 () Bool)

(declare-fun e!277843 () Bool)

(assert (=> d!75543 e!277843))

(declare-fun res!282891 () Bool)

(assert (=> d!75543 (=> (not res!282891) (not e!277843))))

(declare-fun contains!2530 (ListLongMap!7689 (_ BitVec 64)) Bool)

(assert (=> d!75543 (= res!282891 (not (contains!2530 lt!215305 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75543 (= lt!215305 e!277839)))

(declare-fun c!57037 () Bool)

(assert (=> d!75543 (= c!57037 (bvsge #b00000000000000000000000000000000 (size!14976 _keys!1025)))))

(assert (=> d!75543 (validMask!0 mask!1365)))

(assert (=> d!75543 (= (getCurrentListMapNoExtraKeys!2069 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!215305)))

(declare-fun b!473555 () Bool)

(declare-fun isEmpty!585 (ListLongMap!7689) Bool)

(assert (=> b!473555 (= e!277842 (isEmpty!585 lt!215305))))

(declare-fun b!473556 () Bool)

(assert (=> b!473556 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14976 _keys!1025)))))

(assert (=> b!473556 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14977 _values!833)))))

(declare-fun e!277840 () Bool)

(declare-fun apply!332 (ListLongMap!7689 (_ BitVec 64)) V!18891)

(declare-fun get!7118 (ValueCell!6326 V!18891) V!18891)

(declare-fun dynLambda!922 (Int (_ BitVec 64)) V!18891)

(assert (=> b!473556 (= e!277840 (= (apply!332 lt!215305 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000)) (get!7118 (select (arr!14625 _values!833) #b00000000000000000000000000000000) (dynLambda!922 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!473557 () Bool)

(declare-fun lt!215303 () Unit!13924)

(declare-fun lt!215299 () Unit!13924)

(assert (=> b!473557 (= lt!215303 lt!215299)))

(declare-fun lt!215300 () V!18891)

(declare-fun lt!215302 () ListLongMap!7689)

(declare-fun lt!215304 () (_ BitVec 64))

(declare-fun lt!215301 () (_ BitVec 64))

(assert (=> b!473557 (not (contains!2530 (+!1743 lt!215302 (tuple2!8775 lt!215304 lt!215300)) lt!215301))))

(declare-fun addStillNotContains!167 (ListLongMap!7689 (_ BitVec 64) V!18891 (_ BitVec 64)) Unit!13924)

(assert (=> b!473557 (= lt!215299 (addStillNotContains!167 lt!215302 lt!215304 lt!215300 lt!215301))))

(assert (=> b!473557 (= lt!215301 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!473557 (= lt!215300 (get!7118 (select (arr!14625 _values!833) #b00000000000000000000000000000000) (dynLambda!922 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!473557 (= lt!215304 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!473557 (= lt!215302 call!30487)))

(assert (=> b!473557 (= e!277844 (+!1743 call!30487 (tuple2!8775 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000) (get!7118 (select (arr!14625 _values!833) #b00000000000000000000000000000000) (dynLambda!922 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!473558 () Bool)

(declare-fun res!282888 () Bool)

(assert (=> b!473558 (=> (not res!282888) (not e!277843))))

(assert (=> b!473558 (= res!282888 (not (contains!2530 lt!215305 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!473559 () Bool)

(assert (=> b!473559 (= e!277843 e!277841)))

(declare-fun c!57036 () Bool)

(assert (=> b!473559 (= c!57036 e!277838)))

(declare-fun res!282889 () Bool)

(assert (=> b!473559 (=> (not res!282889) (not e!277838))))

(assert (=> b!473559 (= res!282889 (bvslt #b00000000000000000000000000000000 (size!14976 _keys!1025)))))

(declare-fun bm!30484 () Bool)

(assert (=> bm!30484 (= call!30487 (getCurrentListMapNoExtraKeys!2069 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!473560 () Bool)

(assert (=> b!473560 (= e!277841 e!277840)))

(assert (=> b!473560 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14976 _keys!1025)))))

(declare-fun res!282890 () Bool)

(assert (=> b!473560 (= res!282890 (contains!2530 lt!215305 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!473560 (=> (not res!282890) (not e!277840))))

(declare-fun b!473561 () Bool)

(assert (=> b!473561 (= e!277839 e!277844)))

(declare-fun c!57038 () Bool)

(assert (=> b!473561 (= c!57038 (validKeyInArray!0 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75543 c!57037) b!473551))

(assert (= (and d!75543 (not c!57037)) b!473561))

(assert (= (and b!473561 c!57038) b!473557))

(assert (= (and b!473561 (not c!57038)) b!473552))

(assert (= (or b!473557 b!473552) bm!30484))

(assert (= (and d!75543 res!282891) b!473558))

(assert (= (and b!473558 res!282888) b!473559))

(assert (= (and b!473559 res!282889) b!473550))

(assert (= (and b!473559 c!57036) b!473560))

(assert (= (and b!473559 (not c!57036)) b!473554))

(assert (= (and b!473560 res!282890) b!473556))

(assert (= (and b!473554 c!57039) b!473553))

(assert (= (and b!473554 (not c!57039)) b!473555))

(declare-fun b_lambda!10219 () Bool)

(assert (=> (not b_lambda!10219) (not b!473556)))

(declare-fun t!14803 () Bool)

(declare-fun tb!3921 () Bool)

(assert (=> (and start!42422 (= defaultEntry!841 defaultEntry!841) t!14803) tb!3921))

(declare-fun result!7437 () Bool)

(assert (=> tb!3921 (= result!7437 tp_is_empty!13339)))

(assert (=> b!473556 t!14803))

(declare-fun b_and!20383 () Bool)

(assert (= b_and!20377 (and (=> t!14803 result!7437) b_and!20383)))

(declare-fun b_lambda!10221 () Bool)

(assert (=> (not b_lambda!10221) (not b!473557)))

(assert (=> b!473557 t!14803))

(declare-fun b_and!20385 () Bool)

(assert (= b_and!20383 (and (=> t!14803 result!7437) b_and!20385)))

(declare-fun m!455873 () Bool)

(assert (=> b!473558 m!455873))

(declare-fun m!455875 () Bool)

(assert (=> b!473557 m!455875))

(declare-fun m!455877 () Bool)

(assert (=> b!473557 m!455877))

(declare-fun m!455879 () Bool)

(assert (=> b!473557 m!455879))

(declare-fun m!455881 () Bool)

(assert (=> b!473557 m!455881))

(declare-fun m!455883 () Bool)

(assert (=> b!473557 m!455883))

(assert (=> b!473557 m!455857))

(assert (=> b!473557 m!455881))

(declare-fun m!455885 () Bool)

(assert (=> b!473557 m!455885))

(assert (=> b!473557 m!455875))

(declare-fun m!455887 () Bool)

(assert (=> b!473557 m!455887))

(assert (=> b!473557 m!455877))

(assert (=> b!473556 m!455857))

(assert (=> b!473556 m!455875))

(assert (=> b!473556 m!455877))

(assert (=> b!473556 m!455875))

(assert (=> b!473556 m!455877))

(assert (=> b!473556 m!455879))

(assert (=> b!473556 m!455857))

(declare-fun m!455889 () Bool)

(assert (=> b!473556 m!455889))

(declare-fun m!455891 () Bool)

(assert (=> b!473553 m!455891))

(assert (=> b!473560 m!455857))

(assert (=> b!473560 m!455857))

(declare-fun m!455893 () Bool)

(assert (=> b!473560 m!455893))

(declare-fun m!455895 () Bool)

(assert (=> d!75543 m!455895))

(assert (=> d!75543 m!455779))

(assert (=> b!473561 m!455857))

(assert (=> b!473561 m!455857))

(assert (=> b!473561 m!455865))

(declare-fun m!455897 () Bool)

(assert (=> b!473555 m!455897))

(assert (=> bm!30484 m!455891))

(assert (=> b!473550 m!455857))

(assert (=> b!473550 m!455857))

(assert (=> b!473550 m!455865))

(assert (=> b!473447 d!75543))

(declare-fun b!473564 () Bool)

(declare-fun e!277845 () Bool)

(assert (=> b!473564 (= e!277845 (validKeyInArray!0 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!473564 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!473565 () Bool)

(declare-fun e!277846 () ListLongMap!7689)

(assert (=> b!473565 (= e!277846 (ListLongMap!7690 Nil!8834))))

(declare-fun b!473566 () Bool)

(declare-fun e!277851 () ListLongMap!7689)

(declare-fun call!30488 () ListLongMap!7689)

(assert (=> b!473566 (= e!277851 call!30488)))

(declare-fun b!473567 () Bool)

(declare-fun e!277849 () Bool)

(declare-fun lt!215312 () ListLongMap!7689)

(assert (=> b!473567 (= e!277849 (= lt!215312 (getCurrentListMapNoExtraKeys!2069 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!473568 () Bool)

(declare-fun e!277848 () Bool)

(assert (=> b!473568 (= e!277848 e!277849)))

(declare-fun c!57043 () Bool)

(assert (=> b!473568 (= c!57043 (bvslt #b00000000000000000000000000000000 (size!14976 _keys!1025)))))

(declare-fun d!75545 () Bool)

(declare-fun e!277850 () Bool)

(assert (=> d!75545 e!277850))

(declare-fun res!282895 () Bool)

(assert (=> d!75545 (=> (not res!282895) (not e!277850))))

(assert (=> d!75545 (= res!282895 (not (contains!2530 lt!215312 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75545 (= lt!215312 e!277846)))

(declare-fun c!57041 () Bool)

(assert (=> d!75545 (= c!57041 (bvsge #b00000000000000000000000000000000 (size!14976 _keys!1025)))))

(assert (=> d!75545 (validMask!0 mask!1365)))

(assert (=> d!75545 (= (getCurrentListMapNoExtraKeys!2069 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!215312)))

(declare-fun b!473569 () Bool)

(assert (=> b!473569 (= e!277849 (isEmpty!585 lt!215312))))

(declare-fun b!473570 () Bool)

(assert (=> b!473570 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14976 _keys!1025)))))

(assert (=> b!473570 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14977 _values!833)))))

(declare-fun e!277847 () Bool)

(assert (=> b!473570 (= e!277847 (= (apply!332 lt!215312 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000)) (get!7118 (select (arr!14625 _values!833) #b00000000000000000000000000000000) (dynLambda!922 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!473571 () Bool)

(declare-fun lt!215310 () Unit!13924)

(declare-fun lt!215306 () Unit!13924)

(assert (=> b!473571 (= lt!215310 lt!215306)))

(declare-fun lt!215311 () (_ BitVec 64))

(declare-fun lt!215307 () V!18891)

(declare-fun lt!215309 () ListLongMap!7689)

(declare-fun lt!215308 () (_ BitVec 64))

(assert (=> b!473571 (not (contains!2530 (+!1743 lt!215309 (tuple2!8775 lt!215311 lt!215307)) lt!215308))))

(assert (=> b!473571 (= lt!215306 (addStillNotContains!167 lt!215309 lt!215311 lt!215307 lt!215308))))

(assert (=> b!473571 (= lt!215308 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!473571 (= lt!215307 (get!7118 (select (arr!14625 _values!833) #b00000000000000000000000000000000) (dynLambda!922 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!473571 (= lt!215311 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!473571 (= lt!215309 call!30488)))

(assert (=> b!473571 (= e!277851 (+!1743 call!30488 (tuple2!8775 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000) (get!7118 (select (arr!14625 _values!833) #b00000000000000000000000000000000) (dynLambda!922 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!473572 () Bool)

(declare-fun res!282892 () Bool)

(assert (=> b!473572 (=> (not res!282892) (not e!277850))))

(assert (=> b!473572 (= res!282892 (not (contains!2530 lt!215312 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!473573 () Bool)

(assert (=> b!473573 (= e!277850 e!277848)))

(declare-fun c!57040 () Bool)

(assert (=> b!473573 (= c!57040 e!277845)))

(declare-fun res!282893 () Bool)

(assert (=> b!473573 (=> (not res!282893) (not e!277845))))

(assert (=> b!473573 (= res!282893 (bvslt #b00000000000000000000000000000000 (size!14976 _keys!1025)))))

(declare-fun bm!30485 () Bool)

(assert (=> bm!30485 (= call!30488 (getCurrentListMapNoExtraKeys!2069 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!473574 () Bool)

(assert (=> b!473574 (= e!277848 e!277847)))

(assert (=> b!473574 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14976 _keys!1025)))))

(declare-fun res!282894 () Bool)

(assert (=> b!473574 (= res!282894 (contains!2530 lt!215312 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!473574 (=> (not res!282894) (not e!277847))))

(declare-fun b!473575 () Bool)

(assert (=> b!473575 (= e!277846 e!277851)))

(declare-fun c!57042 () Bool)

(assert (=> b!473575 (= c!57042 (validKeyInArray!0 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75545 c!57041) b!473565))

(assert (= (and d!75545 (not c!57041)) b!473575))

(assert (= (and b!473575 c!57042) b!473571))

(assert (= (and b!473575 (not c!57042)) b!473566))

(assert (= (or b!473571 b!473566) bm!30485))

(assert (= (and d!75545 res!282895) b!473572))

(assert (= (and b!473572 res!282892) b!473573))

(assert (= (and b!473573 res!282893) b!473564))

(assert (= (and b!473573 c!57040) b!473574))

(assert (= (and b!473573 (not c!57040)) b!473568))

(assert (= (and b!473574 res!282894) b!473570))

(assert (= (and b!473568 c!57043) b!473567))

(assert (= (and b!473568 (not c!57043)) b!473569))

(declare-fun b_lambda!10223 () Bool)

(assert (=> (not b_lambda!10223) (not b!473570)))

(assert (=> b!473570 t!14803))

(declare-fun b_and!20387 () Bool)

(assert (= b_and!20385 (and (=> t!14803 result!7437) b_and!20387)))

(declare-fun b_lambda!10225 () Bool)

(assert (=> (not b_lambda!10225) (not b!473571)))

(assert (=> b!473571 t!14803))

(declare-fun b_and!20389 () Bool)

(assert (= b_and!20387 (and (=> t!14803 result!7437) b_and!20389)))

(declare-fun m!455899 () Bool)

(assert (=> b!473572 m!455899))

(assert (=> b!473571 m!455875))

(assert (=> b!473571 m!455877))

(assert (=> b!473571 m!455879))

(declare-fun m!455901 () Bool)

(assert (=> b!473571 m!455901))

(declare-fun m!455903 () Bool)

(assert (=> b!473571 m!455903))

(assert (=> b!473571 m!455857))

(assert (=> b!473571 m!455901))

(declare-fun m!455905 () Bool)

(assert (=> b!473571 m!455905))

(assert (=> b!473571 m!455875))

(declare-fun m!455907 () Bool)

(assert (=> b!473571 m!455907))

(assert (=> b!473571 m!455877))

(assert (=> b!473570 m!455857))

(assert (=> b!473570 m!455875))

(assert (=> b!473570 m!455877))

(assert (=> b!473570 m!455875))

(assert (=> b!473570 m!455877))

(assert (=> b!473570 m!455879))

(assert (=> b!473570 m!455857))

(declare-fun m!455909 () Bool)

(assert (=> b!473570 m!455909))

(declare-fun m!455911 () Bool)

(assert (=> b!473567 m!455911))

(assert (=> b!473574 m!455857))

(assert (=> b!473574 m!455857))

(declare-fun m!455913 () Bool)

(assert (=> b!473574 m!455913))

(declare-fun m!455915 () Bool)

(assert (=> d!75545 m!455915))

(assert (=> d!75545 m!455779))

(assert (=> b!473575 m!455857))

(assert (=> b!473575 m!455857))

(assert (=> b!473575 m!455865))

(declare-fun m!455917 () Bool)

(assert (=> b!473569 m!455917))

(assert (=> bm!30485 m!455911))

(assert (=> b!473564 m!455857))

(assert (=> b!473564 m!455857))

(assert (=> b!473564 m!455865))

(assert (=> b!473447 d!75545))

(declare-fun b!473618 () Bool)

(declare-fun e!277883 () Bool)

(assert (=> b!473618 (= e!277883 (validKeyInArray!0 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!473619 () Bool)

(declare-fun e!277889 () ListLongMap!7689)

(declare-fun call!30509 () ListLongMap!7689)

(assert (=> b!473619 (= e!277889 call!30509)))

(declare-fun e!277885 () Bool)

(declare-fun lt!215374 () ListLongMap!7689)

(declare-fun b!473620 () Bool)

(assert (=> b!473620 (= e!277885 (= (apply!332 lt!215374 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000)) (get!7118 (select (arr!14625 _values!833) #b00000000000000000000000000000000) (dynLambda!922 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!473620 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14977 _values!833)))))

(assert (=> b!473620 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14976 _keys!1025)))))

(declare-fun bm!30500 () Bool)

(declare-fun call!30506 () ListLongMap!7689)

(assert (=> bm!30500 (= call!30509 call!30506)))

(declare-fun b!473621 () Bool)

(declare-fun e!277882 () ListLongMap!7689)

(declare-fun call!30503 () ListLongMap!7689)

(assert (=> b!473621 (= e!277882 call!30503)))

(declare-fun bm!30501 () Bool)

(declare-fun call!30504 () ListLongMap!7689)

(assert (=> bm!30501 (= call!30503 call!30504)))

(declare-fun b!473622 () Bool)

(declare-fun e!277887 () Unit!13924)

(declare-fun Unit!13928 () Unit!13924)

(assert (=> b!473622 (= e!277887 Unit!13928)))

(declare-fun b!473623 () Bool)

(declare-fun res!282914 () Bool)

(declare-fun e!277890 () Bool)

(assert (=> b!473623 (=> (not res!282914) (not e!277890))))

(declare-fun e!277888 () Bool)

(assert (=> b!473623 (= res!282914 e!277888)))

(declare-fun res!282922 () Bool)

(assert (=> b!473623 (=> res!282922 e!277888)))

(declare-fun e!277886 () Bool)

(assert (=> b!473623 (= res!282922 (not e!277886))))

(declare-fun res!282920 () Bool)

(assert (=> b!473623 (=> (not res!282920) (not e!277886))))

(assert (=> b!473623 (= res!282920 (bvslt #b00000000000000000000000000000000 (size!14976 _keys!1025)))))

(declare-fun bm!30502 () Bool)

(declare-fun call!30507 () ListLongMap!7689)

(assert (=> bm!30502 (= call!30507 (getCurrentListMapNoExtraKeys!2069 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473624 () Bool)

(assert (=> b!473624 (= e!277886 (validKeyInArray!0 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!473626 () Bool)

(declare-fun e!277878 () Bool)

(declare-fun e!277881 () Bool)

(assert (=> b!473626 (= e!277878 e!277881)))

(declare-fun res!282918 () Bool)

(declare-fun call!30505 () Bool)

(assert (=> b!473626 (= res!282918 call!30505)))

(assert (=> b!473626 (=> (not res!282918) (not e!277881))))

(declare-fun b!473627 () Bool)

(declare-fun e!277880 () Bool)

(assert (=> b!473627 (= e!277880 (= (apply!332 lt!215374 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!473628 () Bool)

(declare-fun lt!215363 () Unit!13924)

(assert (=> b!473628 (= e!277887 lt!215363)))

(declare-fun lt!215371 () ListLongMap!7689)

(assert (=> b!473628 (= lt!215371 (getCurrentListMapNoExtraKeys!2069 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215365 () (_ BitVec 64))

(assert (=> b!473628 (= lt!215365 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215359 () (_ BitVec 64))

(assert (=> b!473628 (= lt!215359 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215375 () Unit!13924)

(declare-fun addStillContains!291 (ListLongMap!7689 (_ BitVec 64) V!18891 (_ BitVec 64)) Unit!13924)

(assert (=> b!473628 (= lt!215375 (addStillContains!291 lt!215371 lt!215365 zeroValue!794 lt!215359))))

(assert (=> b!473628 (contains!2530 (+!1743 lt!215371 (tuple2!8775 lt!215365 zeroValue!794)) lt!215359)))

(declare-fun lt!215357 () Unit!13924)

(assert (=> b!473628 (= lt!215357 lt!215375)))

(declare-fun lt!215358 () ListLongMap!7689)

(assert (=> b!473628 (= lt!215358 (getCurrentListMapNoExtraKeys!2069 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215378 () (_ BitVec 64))

(assert (=> b!473628 (= lt!215378 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215366 () (_ BitVec 64))

(assert (=> b!473628 (= lt!215366 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215377 () Unit!13924)

(declare-fun addApplyDifferent!291 (ListLongMap!7689 (_ BitVec 64) V!18891 (_ BitVec 64)) Unit!13924)

(assert (=> b!473628 (= lt!215377 (addApplyDifferent!291 lt!215358 lt!215378 minValueAfter!38 lt!215366))))

(assert (=> b!473628 (= (apply!332 (+!1743 lt!215358 (tuple2!8775 lt!215378 minValueAfter!38)) lt!215366) (apply!332 lt!215358 lt!215366))))

(declare-fun lt!215364 () Unit!13924)

(assert (=> b!473628 (= lt!215364 lt!215377)))

(declare-fun lt!215361 () ListLongMap!7689)

(assert (=> b!473628 (= lt!215361 (getCurrentListMapNoExtraKeys!2069 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215370 () (_ BitVec 64))

(assert (=> b!473628 (= lt!215370 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215376 () (_ BitVec 64))

(assert (=> b!473628 (= lt!215376 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215367 () Unit!13924)

(assert (=> b!473628 (= lt!215367 (addApplyDifferent!291 lt!215361 lt!215370 zeroValue!794 lt!215376))))

(assert (=> b!473628 (= (apply!332 (+!1743 lt!215361 (tuple2!8775 lt!215370 zeroValue!794)) lt!215376) (apply!332 lt!215361 lt!215376))))

(declare-fun lt!215369 () Unit!13924)

(assert (=> b!473628 (= lt!215369 lt!215367)))

(declare-fun lt!215372 () ListLongMap!7689)

(assert (=> b!473628 (= lt!215372 (getCurrentListMapNoExtraKeys!2069 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215373 () (_ BitVec 64))

(assert (=> b!473628 (= lt!215373 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215360 () (_ BitVec 64))

(assert (=> b!473628 (= lt!215360 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!473628 (= lt!215363 (addApplyDifferent!291 lt!215372 lt!215373 minValueAfter!38 lt!215360))))

(assert (=> b!473628 (= (apply!332 (+!1743 lt!215372 (tuple2!8775 lt!215373 minValueAfter!38)) lt!215360) (apply!332 lt!215372 lt!215360))))

(declare-fun b!473629 () Bool)

(assert (=> b!473629 (= e!277890 e!277878)))

(declare-fun c!57058 () Bool)

(assert (=> b!473629 (= c!57058 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!473630 () Bool)

(declare-fun e!277884 () ListLongMap!7689)

(assert (=> b!473630 (= e!277884 e!277882)))

(declare-fun c!57059 () Bool)

(assert (=> b!473630 (= c!57059 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!473631 () Bool)

(declare-fun e!277879 () Bool)

(declare-fun call!30508 () Bool)

(assert (=> b!473631 (= e!277879 (not call!30508))))

(declare-fun b!473632 () Bool)

(assert (=> b!473632 (= e!277884 (+!1743 call!30504 (tuple2!8775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!473633 () Bool)

(assert (=> b!473633 (= e!277889 call!30503)))

(declare-fun b!473625 () Bool)

(declare-fun c!57061 () Bool)

(assert (=> b!473625 (= c!57061 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!473625 (= e!277882 e!277889)))

(declare-fun d!75547 () Bool)

(assert (=> d!75547 e!277890))

(declare-fun res!282915 () Bool)

(assert (=> d!75547 (=> (not res!282915) (not e!277890))))

(assert (=> d!75547 (= res!282915 (or (bvsge #b00000000000000000000000000000000 (size!14976 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14976 _keys!1025)))))))

(declare-fun lt!215362 () ListLongMap!7689)

(assert (=> d!75547 (= lt!215374 lt!215362)))

(declare-fun lt!215368 () Unit!13924)

(assert (=> d!75547 (= lt!215368 e!277887)))

(declare-fun c!57060 () Bool)

(assert (=> d!75547 (= c!57060 e!277883)))

(declare-fun res!282919 () Bool)

(assert (=> d!75547 (=> (not res!282919) (not e!277883))))

(assert (=> d!75547 (= res!282919 (bvslt #b00000000000000000000000000000000 (size!14976 _keys!1025)))))

(assert (=> d!75547 (= lt!215362 e!277884)))

(declare-fun c!57057 () Bool)

(assert (=> d!75547 (= c!57057 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75547 (validMask!0 mask!1365)))

(assert (=> d!75547 (= (getCurrentListMap!2223 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!215374)))

(declare-fun b!473634 () Bool)

(assert (=> b!473634 (= e!277878 (not call!30505))))

(declare-fun bm!30503 () Bool)

(assert (=> bm!30503 (= call!30506 call!30507)))

(declare-fun b!473635 () Bool)

(declare-fun res!282917 () Bool)

(assert (=> b!473635 (=> (not res!282917) (not e!277890))))

(assert (=> b!473635 (= res!282917 e!277879)))

(declare-fun c!57056 () Bool)

(assert (=> b!473635 (= c!57056 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30504 () Bool)

(assert (=> bm!30504 (= call!30508 (contains!2530 lt!215374 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!473636 () Bool)

(assert (=> b!473636 (= e!277888 e!277885)))

(declare-fun res!282916 () Bool)

(assert (=> b!473636 (=> (not res!282916) (not e!277885))))

(assert (=> b!473636 (= res!282916 (contains!2530 lt!215374 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!473636 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14976 _keys!1025)))))

(declare-fun b!473637 () Bool)

(assert (=> b!473637 (= e!277879 e!277880)))

(declare-fun res!282921 () Bool)

(assert (=> b!473637 (= res!282921 call!30508)))

(assert (=> b!473637 (=> (not res!282921) (not e!277880))))

(declare-fun bm!30505 () Bool)

(assert (=> bm!30505 (= call!30505 (contains!2530 lt!215374 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!473638 () Bool)

(assert (=> b!473638 (= e!277881 (= (apply!332 lt!215374 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun bm!30506 () Bool)

(assert (=> bm!30506 (= call!30504 (+!1743 (ite c!57057 call!30507 (ite c!57059 call!30506 call!30509)) (ite (or c!57057 c!57059) (tuple2!8775 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(assert (= (and d!75547 c!57057) b!473632))

(assert (= (and d!75547 (not c!57057)) b!473630))

(assert (= (and b!473630 c!57059) b!473621))

(assert (= (and b!473630 (not c!57059)) b!473625))

(assert (= (and b!473625 c!57061) b!473633))

(assert (= (and b!473625 (not c!57061)) b!473619))

(assert (= (or b!473633 b!473619) bm!30500))

(assert (= (or b!473621 bm!30500) bm!30503))

(assert (= (or b!473621 b!473633) bm!30501))

(assert (= (or b!473632 bm!30503) bm!30502))

(assert (= (or b!473632 bm!30501) bm!30506))

(assert (= (and d!75547 res!282919) b!473618))

(assert (= (and d!75547 c!57060) b!473628))

(assert (= (and d!75547 (not c!57060)) b!473622))

(assert (= (and d!75547 res!282915) b!473623))

(assert (= (and b!473623 res!282920) b!473624))

(assert (= (and b!473623 (not res!282922)) b!473636))

(assert (= (and b!473636 res!282916) b!473620))

(assert (= (and b!473623 res!282914) b!473635))

(assert (= (and b!473635 c!57056) b!473637))

(assert (= (and b!473635 (not c!57056)) b!473631))

(assert (= (and b!473637 res!282921) b!473627))

(assert (= (or b!473637 b!473631) bm!30504))

(assert (= (and b!473635 res!282917) b!473629))

(assert (= (and b!473629 c!57058) b!473626))

(assert (= (and b!473629 (not c!57058)) b!473634))

(assert (= (and b!473626 res!282918) b!473638))

(assert (= (or b!473626 b!473634) bm!30505))

(declare-fun b_lambda!10227 () Bool)

(assert (=> (not b_lambda!10227) (not b!473620)))

(assert (=> b!473620 t!14803))

(declare-fun b_and!20391 () Bool)

(assert (= b_and!20389 (and (=> t!14803 result!7437) b_and!20391)))

(assert (=> b!473624 m!455857))

(assert (=> b!473624 m!455857))

(assert (=> b!473624 m!455865))

(declare-fun m!455919 () Bool)

(assert (=> bm!30505 m!455919))

(declare-fun m!455921 () Bool)

(assert (=> bm!30506 m!455921))

(declare-fun m!455923 () Bool)

(assert (=> b!473627 m!455923))

(assert (=> d!75547 m!455779))

(assert (=> b!473620 m!455857))

(assert (=> b!473620 m!455875))

(assert (=> b!473620 m!455877))

(assert (=> b!473620 m!455879))

(assert (=> b!473620 m!455877))

(assert (=> b!473620 m!455875))

(assert (=> b!473620 m!455857))

(declare-fun m!455925 () Bool)

(assert (=> b!473620 m!455925))

(declare-fun m!455927 () Bool)

(assert (=> b!473628 m!455927))

(declare-fun m!455929 () Bool)

(assert (=> b!473628 m!455929))

(declare-fun m!455931 () Bool)

(assert (=> b!473628 m!455931))

(declare-fun m!455933 () Bool)

(assert (=> b!473628 m!455933))

(declare-fun m!455935 () Bool)

(assert (=> b!473628 m!455935))

(declare-fun m!455937 () Bool)

(assert (=> b!473628 m!455937))

(declare-fun m!455939 () Bool)

(assert (=> b!473628 m!455939))

(declare-fun m!455941 () Bool)

(assert (=> b!473628 m!455941))

(declare-fun m!455943 () Bool)

(assert (=> b!473628 m!455943))

(assert (=> b!473628 m!455857))

(declare-fun m!455945 () Bool)

(assert (=> b!473628 m!455945))

(assert (=> b!473628 m!455933))

(declare-fun m!455947 () Bool)

(assert (=> b!473628 m!455947))

(assert (=> b!473628 m!455939))

(declare-fun m!455949 () Bool)

(assert (=> b!473628 m!455949))

(assert (=> b!473628 m!455943))

(declare-fun m!455951 () Bool)

(assert (=> b!473628 m!455951))

(declare-fun m!455953 () Bool)

(assert (=> b!473628 m!455953))

(assert (=> b!473628 m!455929))

(assert (=> b!473628 m!455775))

(declare-fun m!455955 () Bool)

(assert (=> b!473628 m!455955))

(assert (=> b!473618 m!455857))

(assert (=> b!473618 m!455857))

(assert (=> b!473618 m!455865))

(declare-fun m!455957 () Bool)

(assert (=> b!473638 m!455957))

(declare-fun m!455959 () Bool)

(assert (=> b!473632 m!455959))

(assert (=> b!473636 m!455857))

(assert (=> b!473636 m!455857))

(declare-fun m!455961 () Bool)

(assert (=> b!473636 m!455961))

(declare-fun m!455963 () Bool)

(assert (=> bm!30504 m!455963))

(assert (=> bm!30502 m!455775))

(assert (=> b!473446 d!75547))

(declare-fun d!75549 () Bool)

(declare-fun e!277893 () Bool)

(assert (=> d!75549 e!277893))

(declare-fun res!282927 () Bool)

(assert (=> d!75549 (=> (not res!282927) (not e!277893))))

(declare-fun lt!215389 () ListLongMap!7689)

(assert (=> d!75549 (= res!282927 (contains!2530 lt!215389 (_1!4398 (tuple2!8775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lt!215387 () List!8837)

(assert (=> d!75549 (= lt!215389 (ListLongMap!7690 lt!215387))))

(declare-fun lt!215390 () Unit!13924)

(declare-fun lt!215388 () Unit!13924)

(assert (=> d!75549 (= lt!215390 lt!215388)))

(declare-datatypes ((Option!387 0))(
  ( (Some!386 (v!9009 V!18891)) (None!385) )
))
(declare-fun getValueByKey!381 (List!8837 (_ BitVec 64)) Option!387)

(assert (=> d!75549 (= (getValueByKey!381 lt!215387 (_1!4398 (tuple2!8775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!386 (_2!4398 (tuple2!8775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lemmaContainsTupThenGetReturnValue!203 (List!8837 (_ BitVec 64) V!18891) Unit!13924)

(assert (=> d!75549 (= lt!215388 (lemmaContainsTupThenGetReturnValue!203 lt!215387 (_1!4398 (tuple2!8775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4398 (tuple2!8775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun insertStrictlySorted!206 (List!8837 (_ BitVec 64) V!18891) List!8837)

(assert (=> d!75549 (= lt!215387 (insertStrictlySorted!206 (toList!3860 lt!215222) (_1!4398 (tuple2!8775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4398 (tuple2!8775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75549 (= (+!1743 lt!215222 (tuple2!8775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215389)))

(declare-fun b!473643 () Bool)

(declare-fun res!282928 () Bool)

(assert (=> b!473643 (=> (not res!282928) (not e!277893))))

(assert (=> b!473643 (= res!282928 (= (getValueByKey!381 (toList!3860 lt!215389) (_1!4398 (tuple2!8775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!386 (_2!4398 (tuple2!8775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))))

(declare-fun b!473644 () Bool)

(declare-fun contains!2531 (List!8837 tuple2!8774) Bool)

(assert (=> b!473644 (= e!277893 (contains!2531 (toList!3860 lt!215389) (tuple2!8775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(assert (= (and d!75549 res!282927) b!473643))

(assert (= (and b!473643 res!282928) b!473644))

(declare-fun m!455965 () Bool)

(assert (=> d!75549 m!455965))

(declare-fun m!455967 () Bool)

(assert (=> d!75549 m!455967))

(declare-fun m!455969 () Bool)

(assert (=> d!75549 m!455969))

(declare-fun m!455971 () Bool)

(assert (=> d!75549 m!455971))

(declare-fun m!455973 () Bool)

(assert (=> b!473643 m!455973))

(declare-fun m!455975 () Bool)

(assert (=> b!473644 m!455975))

(assert (=> b!473446 d!75549))

(declare-fun d!75551 () Bool)

(assert (=> d!75551 (= (+!1743 lt!215222 (tuple2!8775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (+!1743 (+!1743 lt!215222 (tuple2!8775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (tuple2!8775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun lt!215393 () Unit!13924)

(declare-fun choose!1359 (ListLongMap!7689 (_ BitVec 64) V!18891 V!18891) Unit!13924)

(assert (=> d!75551 (= lt!215393 (choose!1359 lt!215222 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> d!75551 (= (addSameAsAddTwiceSameKeyDiffValues!145 lt!215222 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38) lt!215393)))

(declare-fun bs!15049 () Bool)

(assert (= bs!15049 d!75551))

(declare-fun m!455977 () Bool)

(assert (=> bs!15049 m!455977))

(assert (=> bs!15049 m!455761))

(assert (=> bs!15049 m!455761))

(declare-fun m!455979 () Bool)

(assert (=> bs!15049 m!455979))

(declare-fun m!455981 () Bool)

(assert (=> bs!15049 m!455981))

(assert (=> b!473446 d!75551))

(declare-fun d!75553 () Bool)

(declare-fun e!277894 () Bool)

(assert (=> d!75553 e!277894))

(declare-fun res!282929 () Bool)

(assert (=> d!75553 (=> (not res!282929) (not e!277894))))

(declare-fun lt!215396 () ListLongMap!7689)

(assert (=> d!75553 (= res!282929 (contains!2530 lt!215396 (_1!4398 lt!215218)))))

(declare-fun lt!215394 () List!8837)

(assert (=> d!75553 (= lt!215396 (ListLongMap!7690 lt!215394))))

(declare-fun lt!215397 () Unit!13924)

(declare-fun lt!215395 () Unit!13924)

(assert (=> d!75553 (= lt!215397 lt!215395)))

(assert (=> d!75553 (= (getValueByKey!381 lt!215394 (_1!4398 lt!215218)) (Some!386 (_2!4398 lt!215218)))))

(assert (=> d!75553 (= lt!215395 (lemmaContainsTupThenGetReturnValue!203 lt!215394 (_1!4398 lt!215218) (_2!4398 lt!215218)))))

(assert (=> d!75553 (= lt!215394 (insertStrictlySorted!206 (toList!3860 lt!215222) (_1!4398 lt!215218) (_2!4398 lt!215218)))))

(assert (=> d!75553 (= (+!1743 lt!215222 lt!215218) lt!215396)))

(declare-fun b!473645 () Bool)

(declare-fun res!282930 () Bool)

(assert (=> b!473645 (=> (not res!282930) (not e!277894))))

(assert (=> b!473645 (= res!282930 (= (getValueByKey!381 (toList!3860 lt!215396) (_1!4398 lt!215218)) (Some!386 (_2!4398 lt!215218))))))

(declare-fun b!473646 () Bool)

(assert (=> b!473646 (= e!277894 (contains!2531 (toList!3860 lt!215396) lt!215218))))

(assert (= (and d!75553 res!282929) b!473645))

(assert (= (and b!473645 res!282930) b!473646))

(declare-fun m!455983 () Bool)

(assert (=> d!75553 m!455983))

(declare-fun m!455985 () Bool)

(assert (=> d!75553 m!455985))

(declare-fun m!455987 () Bool)

(assert (=> d!75553 m!455987))

(declare-fun m!455989 () Bool)

(assert (=> d!75553 m!455989))

(declare-fun m!455991 () Bool)

(assert (=> b!473645 m!455991))

(declare-fun m!455993 () Bool)

(assert (=> b!473646 m!455993))

(assert (=> b!473446 d!75553))

(declare-fun d!75555 () Bool)

(declare-fun e!277895 () Bool)

(assert (=> d!75555 e!277895))

(declare-fun res!282931 () Bool)

(assert (=> d!75555 (=> (not res!282931) (not e!277895))))

(declare-fun lt!215400 () ListLongMap!7689)

(assert (=> d!75555 (= res!282931 (contains!2530 lt!215400 (_1!4398 (tuple2!8775 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(declare-fun lt!215398 () List!8837)

(assert (=> d!75555 (= lt!215400 (ListLongMap!7690 lt!215398))))

(declare-fun lt!215401 () Unit!13924)

(declare-fun lt!215399 () Unit!13924)

(assert (=> d!75555 (= lt!215401 lt!215399)))

(assert (=> d!75555 (= (getValueByKey!381 lt!215398 (_1!4398 (tuple2!8775 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))) (Some!386 (_2!4398 (tuple2!8775 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75555 (= lt!215399 (lemmaContainsTupThenGetReturnValue!203 lt!215398 (_1!4398 (tuple2!8775 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) (_2!4398 (tuple2!8775 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75555 (= lt!215398 (insertStrictlySorted!206 (toList!3860 lt!215217) (_1!4398 (tuple2!8775 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) (_2!4398 (tuple2!8775 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75555 (= (+!1743 lt!215217 (tuple2!8775 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) lt!215400)))

(declare-fun b!473647 () Bool)

(declare-fun res!282932 () Bool)

(assert (=> b!473647 (=> (not res!282932) (not e!277895))))

(assert (=> b!473647 (= res!282932 (= (getValueByKey!381 (toList!3860 lt!215400) (_1!4398 (tuple2!8775 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))) (Some!386 (_2!4398 (tuple2!8775 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))))

(declare-fun b!473648 () Bool)

(assert (=> b!473648 (= e!277895 (contains!2531 (toList!3860 lt!215400) (tuple2!8775 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(assert (= (and d!75555 res!282931) b!473647))

(assert (= (and b!473647 res!282932) b!473648))

(declare-fun m!455995 () Bool)

(assert (=> d!75555 m!455995))

(declare-fun m!455997 () Bool)

(assert (=> d!75555 m!455997))

(declare-fun m!455999 () Bool)

(assert (=> d!75555 m!455999))

(declare-fun m!456001 () Bool)

(assert (=> d!75555 m!456001))

(declare-fun m!456003 () Bool)

(assert (=> b!473647 m!456003))

(declare-fun m!456005 () Bool)

(assert (=> b!473648 m!456005))

(assert (=> b!473446 d!75555))

(declare-fun b!473649 () Bool)

(declare-fun e!277901 () Bool)

(assert (=> b!473649 (= e!277901 (validKeyInArray!0 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!473650 () Bool)

(declare-fun e!277907 () ListLongMap!7689)

(declare-fun call!30516 () ListLongMap!7689)

(assert (=> b!473650 (= e!277907 call!30516)))

(declare-fun e!277903 () Bool)

(declare-fun b!473651 () Bool)

(declare-fun lt!215419 () ListLongMap!7689)

(assert (=> b!473651 (= e!277903 (= (apply!332 lt!215419 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000)) (get!7118 (select (arr!14625 _values!833) #b00000000000000000000000000000000) (dynLambda!922 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!473651 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14977 _values!833)))))

(assert (=> b!473651 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14976 _keys!1025)))))

(declare-fun bm!30507 () Bool)

(declare-fun call!30513 () ListLongMap!7689)

(assert (=> bm!30507 (= call!30516 call!30513)))

(declare-fun b!473652 () Bool)

(declare-fun e!277900 () ListLongMap!7689)

(declare-fun call!30510 () ListLongMap!7689)

(assert (=> b!473652 (= e!277900 call!30510)))

(declare-fun bm!30508 () Bool)

(declare-fun call!30511 () ListLongMap!7689)

(assert (=> bm!30508 (= call!30510 call!30511)))

(declare-fun b!473653 () Bool)

(declare-fun e!277905 () Unit!13924)

(declare-fun Unit!13929 () Unit!13924)

(assert (=> b!473653 (= e!277905 Unit!13929)))

(declare-fun b!473654 () Bool)

(declare-fun res!282933 () Bool)

(declare-fun e!277908 () Bool)

(assert (=> b!473654 (=> (not res!282933) (not e!277908))))

(declare-fun e!277906 () Bool)

(assert (=> b!473654 (= res!282933 e!277906)))

(declare-fun res!282941 () Bool)

(assert (=> b!473654 (=> res!282941 e!277906)))

(declare-fun e!277904 () Bool)

(assert (=> b!473654 (= res!282941 (not e!277904))))

(declare-fun res!282939 () Bool)

(assert (=> b!473654 (=> (not res!282939) (not e!277904))))

(assert (=> b!473654 (= res!282939 (bvslt #b00000000000000000000000000000000 (size!14976 _keys!1025)))))

(declare-fun call!30514 () ListLongMap!7689)

(declare-fun bm!30509 () Bool)

(assert (=> bm!30509 (= call!30514 (getCurrentListMapNoExtraKeys!2069 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473655 () Bool)

(assert (=> b!473655 (= e!277904 (validKeyInArray!0 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!473657 () Bool)

(declare-fun e!277896 () Bool)

(declare-fun e!277899 () Bool)

(assert (=> b!473657 (= e!277896 e!277899)))

(declare-fun res!282937 () Bool)

(declare-fun call!30512 () Bool)

(assert (=> b!473657 (= res!282937 call!30512)))

(assert (=> b!473657 (=> (not res!282937) (not e!277899))))

(declare-fun b!473658 () Bool)

(declare-fun e!277898 () Bool)

(assert (=> b!473658 (= e!277898 (= (apply!332 lt!215419 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!473659 () Bool)

(declare-fun lt!215408 () Unit!13924)

(assert (=> b!473659 (= e!277905 lt!215408)))

(declare-fun lt!215416 () ListLongMap!7689)

(assert (=> b!473659 (= lt!215416 (getCurrentListMapNoExtraKeys!2069 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215410 () (_ BitVec 64))

(assert (=> b!473659 (= lt!215410 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215404 () (_ BitVec 64))

(assert (=> b!473659 (= lt!215404 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215420 () Unit!13924)

(assert (=> b!473659 (= lt!215420 (addStillContains!291 lt!215416 lt!215410 zeroValue!794 lt!215404))))

(assert (=> b!473659 (contains!2530 (+!1743 lt!215416 (tuple2!8775 lt!215410 zeroValue!794)) lt!215404)))

(declare-fun lt!215402 () Unit!13924)

(assert (=> b!473659 (= lt!215402 lt!215420)))

(declare-fun lt!215403 () ListLongMap!7689)

(assert (=> b!473659 (= lt!215403 (getCurrentListMapNoExtraKeys!2069 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215423 () (_ BitVec 64))

(assert (=> b!473659 (= lt!215423 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215411 () (_ BitVec 64))

(assert (=> b!473659 (= lt!215411 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215422 () Unit!13924)

(assert (=> b!473659 (= lt!215422 (addApplyDifferent!291 lt!215403 lt!215423 minValueBefore!38 lt!215411))))

(assert (=> b!473659 (= (apply!332 (+!1743 lt!215403 (tuple2!8775 lt!215423 minValueBefore!38)) lt!215411) (apply!332 lt!215403 lt!215411))))

(declare-fun lt!215409 () Unit!13924)

(assert (=> b!473659 (= lt!215409 lt!215422)))

(declare-fun lt!215406 () ListLongMap!7689)

(assert (=> b!473659 (= lt!215406 (getCurrentListMapNoExtraKeys!2069 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215415 () (_ BitVec 64))

(assert (=> b!473659 (= lt!215415 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215421 () (_ BitVec 64))

(assert (=> b!473659 (= lt!215421 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215412 () Unit!13924)

(assert (=> b!473659 (= lt!215412 (addApplyDifferent!291 lt!215406 lt!215415 zeroValue!794 lt!215421))))

(assert (=> b!473659 (= (apply!332 (+!1743 lt!215406 (tuple2!8775 lt!215415 zeroValue!794)) lt!215421) (apply!332 lt!215406 lt!215421))))

(declare-fun lt!215414 () Unit!13924)

(assert (=> b!473659 (= lt!215414 lt!215412)))

(declare-fun lt!215417 () ListLongMap!7689)

(assert (=> b!473659 (= lt!215417 (getCurrentListMapNoExtraKeys!2069 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215418 () (_ BitVec 64))

(assert (=> b!473659 (= lt!215418 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215405 () (_ BitVec 64))

(assert (=> b!473659 (= lt!215405 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!473659 (= lt!215408 (addApplyDifferent!291 lt!215417 lt!215418 minValueBefore!38 lt!215405))))

(assert (=> b!473659 (= (apply!332 (+!1743 lt!215417 (tuple2!8775 lt!215418 minValueBefore!38)) lt!215405) (apply!332 lt!215417 lt!215405))))

(declare-fun b!473660 () Bool)

(assert (=> b!473660 (= e!277908 e!277896)))

(declare-fun c!57064 () Bool)

(assert (=> b!473660 (= c!57064 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!473661 () Bool)

(declare-fun e!277902 () ListLongMap!7689)

(assert (=> b!473661 (= e!277902 e!277900)))

(declare-fun c!57065 () Bool)

(assert (=> b!473661 (= c!57065 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!473662 () Bool)

(declare-fun e!277897 () Bool)

(declare-fun call!30515 () Bool)

(assert (=> b!473662 (= e!277897 (not call!30515))))

(declare-fun b!473663 () Bool)

(assert (=> b!473663 (= e!277902 (+!1743 call!30511 (tuple2!8775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun b!473664 () Bool)

(assert (=> b!473664 (= e!277907 call!30510)))

(declare-fun b!473656 () Bool)

(declare-fun c!57067 () Bool)

(assert (=> b!473656 (= c!57067 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!473656 (= e!277900 e!277907)))

(declare-fun d!75557 () Bool)

(assert (=> d!75557 e!277908))

(declare-fun res!282934 () Bool)

(assert (=> d!75557 (=> (not res!282934) (not e!277908))))

(assert (=> d!75557 (= res!282934 (or (bvsge #b00000000000000000000000000000000 (size!14976 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14976 _keys!1025)))))))

(declare-fun lt!215407 () ListLongMap!7689)

(assert (=> d!75557 (= lt!215419 lt!215407)))

(declare-fun lt!215413 () Unit!13924)

(assert (=> d!75557 (= lt!215413 e!277905)))

(declare-fun c!57066 () Bool)

(assert (=> d!75557 (= c!57066 e!277901)))

(declare-fun res!282938 () Bool)

(assert (=> d!75557 (=> (not res!282938) (not e!277901))))

(assert (=> d!75557 (= res!282938 (bvslt #b00000000000000000000000000000000 (size!14976 _keys!1025)))))

(assert (=> d!75557 (= lt!215407 e!277902)))

(declare-fun c!57063 () Bool)

(assert (=> d!75557 (= c!57063 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75557 (validMask!0 mask!1365)))

(assert (=> d!75557 (= (getCurrentListMap!2223 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!215419)))

(declare-fun b!473665 () Bool)

(assert (=> b!473665 (= e!277896 (not call!30512))))

(declare-fun bm!30510 () Bool)

(assert (=> bm!30510 (= call!30513 call!30514)))

(declare-fun b!473666 () Bool)

(declare-fun res!282936 () Bool)

(assert (=> b!473666 (=> (not res!282936) (not e!277908))))

(assert (=> b!473666 (= res!282936 e!277897)))

(declare-fun c!57062 () Bool)

(assert (=> b!473666 (= c!57062 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30511 () Bool)

(assert (=> bm!30511 (= call!30515 (contains!2530 lt!215419 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!473667 () Bool)

(assert (=> b!473667 (= e!277906 e!277903)))

(declare-fun res!282935 () Bool)

(assert (=> b!473667 (=> (not res!282935) (not e!277903))))

(assert (=> b!473667 (= res!282935 (contains!2530 lt!215419 (select (arr!14624 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!473667 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14976 _keys!1025)))))

(declare-fun b!473668 () Bool)

(assert (=> b!473668 (= e!277897 e!277898)))

(declare-fun res!282940 () Bool)

(assert (=> b!473668 (= res!282940 call!30515)))

(assert (=> b!473668 (=> (not res!282940) (not e!277898))))

(declare-fun bm!30512 () Bool)

(assert (=> bm!30512 (= call!30512 (contains!2530 lt!215419 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!473669 () Bool)

(assert (=> b!473669 (= e!277899 (= (apply!332 lt!215419 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun bm!30513 () Bool)

(assert (=> bm!30513 (= call!30511 (+!1743 (ite c!57063 call!30514 (ite c!57065 call!30513 call!30516)) (ite (or c!57063 c!57065) (tuple2!8775 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (= (and d!75557 c!57063) b!473663))

(assert (= (and d!75557 (not c!57063)) b!473661))

(assert (= (and b!473661 c!57065) b!473652))

(assert (= (and b!473661 (not c!57065)) b!473656))

(assert (= (and b!473656 c!57067) b!473664))

(assert (= (and b!473656 (not c!57067)) b!473650))

(assert (= (or b!473664 b!473650) bm!30507))

(assert (= (or b!473652 bm!30507) bm!30510))

(assert (= (or b!473652 b!473664) bm!30508))

(assert (= (or b!473663 bm!30510) bm!30509))

(assert (= (or b!473663 bm!30508) bm!30513))

(assert (= (and d!75557 res!282938) b!473649))

(assert (= (and d!75557 c!57066) b!473659))

(assert (= (and d!75557 (not c!57066)) b!473653))

(assert (= (and d!75557 res!282934) b!473654))

(assert (= (and b!473654 res!282939) b!473655))

(assert (= (and b!473654 (not res!282941)) b!473667))

(assert (= (and b!473667 res!282935) b!473651))

(assert (= (and b!473654 res!282933) b!473666))

(assert (= (and b!473666 c!57062) b!473668))

(assert (= (and b!473666 (not c!57062)) b!473662))

(assert (= (and b!473668 res!282940) b!473658))

(assert (= (or b!473668 b!473662) bm!30511))

(assert (= (and b!473666 res!282936) b!473660))

(assert (= (and b!473660 c!57064) b!473657))

(assert (= (and b!473660 (not c!57064)) b!473665))

(assert (= (and b!473657 res!282937) b!473669))

(assert (= (or b!473657 b!473665) bm!30512))

(declare-fun b_lambda!10229 () Bool)

(assert (=> (not b_lambda!10229) (not b!473651)))

(assert (=> b!473651 t!14803))

(declare-fun b_and!20393 () Bool)

(assert (= b_and!20391 (and (=> t!14803 result!7437) b_and!20393)))

(assert (=> b!473655 m!455857))

(assert (=> b!473655 m!455857))

(assert (=> b!473655 m!455865))

(declare-fun m!456007 () Bool)

(assert (=> bm!30512 m!456007))

(declare-fun m!456009 () Bool)

(assert (=> bm!30513 m!456009))

(declare-fun m!456011 () Bool)

(assert (=> b!473658 m!456011))

(assert (=> d!75557 m!455779))

(assert (=> b!473651 m!455857))

(assert (=> b!473651 m!455875))

(assert (=> b!473651 m!455877))

(assert (=> b!473651 m!455879))

(assert (=> b!473651 m!455877))

(assert (=> b!473651 m!455875))

(assert (=> b!473651 m!455857))

(declare-fun m!456013 () Bool)

(assert (=> b!473651 m!456013))

(declare-fun m!456015 () Bool)

(assert (=> b!473659 m!456015))

(declare-fun m!456017 () Bool)

(assert (=> b!473659 m!456017))

(declare-fun m!456019 () Bool)

(assert (=> b!473659 m!456019))

(declare-fun m!456021 () Bool)

(assert (=> b!473659 m!456021))

(declare-fun m!456023 () Bool)

(assert (=> b!473659 m!456023))

(declare-fun m!456025 () Bool)

(assert (=> b!473659 m!456025))

(declare-fun m!456027 () Bool)

(assert (=> b!473659 m!456027))

(declare-fun m!456029 () Bool)

(assert (=> b!473659 m!456029))

(declare-fun m!456031 () Bool)

(assert (=> b!473659 m!456031))

(assert (=> b!473659 m!455857))

(declare-fun m!456033 () Bool)

(assert (=> b!473659 m!456033))

(assert (=> b!473659 m!456021))

(declare-fun m!456035 () Bool)

(assert (=> b!473659 m!456035))

(assert (=> b!473659 m!456027))

(declare-fun m!456037 () Bool)

(assert (=> b!473659 m!456037))

(assert (=> b!473659 m!456031))

(declare-fun m!456039 () Bool)

(assert (=> b!473659 m!456039))

(declare-fun m!456041 () Bool)

(assert (=> b!473659 m!456041))

(assert (=> b!473659 m!456017))

(assert (=> b!473659 m!455777))

(declare-fun m!456043 () Bool)

(assert (=> b!473659 m!456043))

(assert (=> b!473649 m!455857))

(assert (=> b!473649 m!455857))

(assert (=> b!473649 m!455865))

(declare-fun m!456045 () Bool)

(assert (=> b!473669 m!456045))

(declare-fun m!456047 () Bool)

(assert (=> b!473663 m!456047))

(assert (=> b!473667 m!455857))

(assert (=> b!473667 m!455857))

(declare-fun m!456049 () Bool)

(assert (=> b!473667 m!456049))

(declare-fun m!456051 () Bool)

(assert (=> bm!30511 m!456051))

(assert (=> bm!30509 m!455777))

(assert (=> b!473446 d!75557))

(declare-fun d!75559 () Bool)

(declare-fun e!277909 () Bool)

(assert (=> d!75559 e!277909))

(declare-fun res!282942 () Bool)

(assert (=> d!75559 (=> (not res!282942) (not e!277909))))

(declare-fun lt!215426 () ListLongMap!7689)

(assert (=> d!75559 (= res!282942 (contains!2530 lt!215426 (_1!4398 lt!215218)))))

(declare-fun lt!215424 () List!8837)

(assert (=> d!75559 (= lt!215426 (ListLongMap!7690 lt!215424))))

(declare-fun lt!215427 () Unit!13924)

(declare-fun lt!215425 () Unit!13924)

(assert (=> d!75559 (= lt!215427 lt!215425)))

(assert (=> d!75559 (= (getValueByKey!381 lt!215424 (_1!4398 lt!215218)) (Some!386 (_2!4398 lt!215218)))))

(assert (=> d!75559 (= lt!215425 (lemmaContainsTupThenGetReturnValue!203 lt!215424 (_1!4398 lt!215218) (_2!4398 lt!215218)))))

(assert (=> d!75559 (= lt!215424 (insertStrictlySorted!206 (toList!3860 (+!1743 lt!215222 (tuple2!8775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (_1!4398 lt!215218) (_2!4398 lt!215218)))))

(assert (=> d!75559 (= (+!1743 (+!1743 lt!215222 (tuple2!8775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215218) lt!215426)))

(declare-fun b!473670 () Bool)

(declare-fun res!282943 () Bool)

(assert (=> b!473670 (=> (not res!282943) (not e!277909))))

(assert (=> b!473670 (= res!282943 (= (getValueByKey!381 (toList!3860 lt!215426) (_1!4398 lt!215218)) (Some!386 (_2!4398 lt!215218))))))

(declare-fun b!473671 () Bool)

(assert (=> b!473671 (= e!277909 (contains!2531 (toList!3860 lt!215426) lt!215218))))

(assert (= (and d!75559 res!282942) b!473670))

(assert (= (and b!473670 res!282943) b!473671))

(declare-fun m!456053 () Bool)

(assert (=> d!75559 m!456053))

(declare-fun m!456055 () Bool)

(assert (=> d!75559 m!456055))

(declare-fun m!456057 () Bool)

(assert (=> d!75559 m!456057))

(declare-fun m!456059 () Bool)

(assert (=> d!75559 m!456059))

(declare-fun m!456061 () Bool)

(assert (=> b!473670 m!456061))

(declare-fun m!456063 () Bool)

(assert (=> b!473671 m!456063))

(assert (=> b!473446 d!75559))

(declare-fun b!473679 () Bool)

(declare-fun e!277915 () Bool)

(assert (=> b!473679 (= e!277915 tp_is_empty!13339)))

(declare-fun mapIsEmpty!21730 () Bool)

(declare-fun mapRes!21730 () Bool)

(assert (=> mapIsEmpty!21730 mapRes!21730))

(declare-fun b!473678 () Bool)

(declare-fun e!277914 () Bool)

(assert (=> b!473678 (= e!277914 tp_is_empty!13339)))

(declare-fun condMapEmpty!21730 () Bool)

(declare-fun mapDefault!21730 () ValueCell!6326)

(assert (=> mapNonEmpty!21721 (= condMapEmpty!21730 (= mapRest!21721 ((as const (Array (_ BitVec 32) ValueCell!6326)) mapDefault!21730)))))

(assert (=> mapNonEmpty!21721 (= tp!41767 (and e!277915 mapRes!21730))))

(declare-fun mapNonEmpty!21730 () Bool)

(declare-fun tp!41782 () Bool)

(assert (=> mapNonEmpty!21730 (= mapRes!21730 (and tp!41782 e!277914))))

(declare-fun mapKey!21730 () (_ BitVec 32))

(declare-fun mapRest!21730 () (Array (_ BitVec 32) ValueCell!6326))

(declare-fun mapValue!21730 () ValueCell!6326)

(assert (=> mapNonEmpty!21730 (= mapRest!21721 (store mapRest!21730 mapKey!21730 mapValue!21730))))

(assert (= (and mapNonEmpty!21721 condMapEmpty!21730) mapIsEmpty!21730))

(assert (= (and mapNonEmpty!21721 (not condMapEmpty!21730)) mapNonEmpty!21730))

(assert (= (and mapNonEmpty!21730 ((_ is ValueCellFull!6326) mapValue!21730)) b!473678))

(assert (= (and mapNonEmpty!21721 ((_ is ValueCellFull!6326) mapDefault!21730)) b!473679))

(declare-fun m!456065 () Bool)

(assert (=> mapNonEmpty!21730 m!456065))

(declare-fun b_lambda!10231 () Bool)

(assert (= b_lambda!10219 (or (and start!42422 b_free!11911) b_lambda!10231)))

(declare-fun b_lambda!10233 () Bool)

(assert (= b_lambda!10227 (or (and start!42422 b_free!11911) b_lambda!10233)))

(declare-fun b_lambda!10235 () Bool)

(assert (= b_lambda!10221 (or (and start!42422 b_free!11911) b_lambda!10235)))

(declare-fun b_lambda!10237 () Bool)

(assert (= b_lambda!10229 (or (and start!42422 b_free!11911) b_lambda!10237)))

(declare-fun b_lambda!10239 () Bool)

(assert (= b_lambda!10225 (or (and start!42422 b_free!11911) b_lambda!10239)))

(declare-fun b_lambda!10241 () Bool)

(assert (= b_lambda!10223 (or (and start!42422 b_free!11911) b_lambda!10241)))

(check-sat (not d!75545) (not b!473655) (not bm!30504) (not b!473643) (not mapNonEmpty!21730) (not d!75551) (not b!473560) (not b!473671) (not b!473561) (not b!473628) (not b!473659) b_and!20393 (not bm!30485) (not b!473663) (not bm!30478) (not b!473569) (not d!75543) (not d!75547) (not b!473669) (not b!473558) (not b!473508) (not b!473646) (not b!473620) (not b_lambda!10237) (not d!75541) (not d!75553) (not bm!30502) (not b!473645) (not b!473525) (not d!75555) (not bm!30511) (not b!473638) (not b!473570) (not b!473636) (not bm!30481) (not b!473647) (not b!473555) (not bm!30506) (not b!473567) (not d!75549) (not b!473651) (not bm!30484) (not bm!30509) (not b!473649) (not b!473618) (not b!473670) tp_is_empty!13339 (not bm!30505) (not bm!30513) (not b_lambda!10235) (not b!473521) (not b!473658) (not b_next!11911) (not b!473550) (not b_lambda!10239) (not b!473556) (not b!473564) (not d!75557) (not b!473648) (not d!75559) (not b_lambda!10241) (not b!473575) (not b_lambda!10233) (not b_lambda!10231) (not b!473632) (not b!473667) (not b!473572) (not b!473627) (not b!473522) (not bm!30512) (not b!473574) (not b!473510) (not b!473557) (not b!473624) (not b!473553) (not b!473571) (not b!473644))
(check-sat b_and!20393 (not b_next!11911))
