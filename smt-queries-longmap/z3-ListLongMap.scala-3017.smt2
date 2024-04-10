; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42438 () Bool)

(assert start!42438)

(declare-fun b_free!11913 () Bool)

(declare-fun b_next!11913 () Bool)

(assert (=> start!42438 (= b_free!11913 (not b_next!11913))))

(declare-fun tp!41773 () Bool)

(declare-fun b_and!20369 () Bool)

(assert (=> start!42438 (= tp!41773 b_and!20369)))

(declare-fun b!473528 () Bool)

(declare-fun res!282855 () Bool)

(declare-fun e!277823 () Bool)

(assert (=> b!473528 (=> (not res!282855) (not e!277823))))

(declare-datatypes ((array!30437 0))(
  ( (array!30438 (arr!14638 (Array (_ BitVec 32) (_ BitVec 64))) (size!14990 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30437)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30437 (_ BitVec 32)) Bool)

(assert (=> b!473528 (= res!282855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21724 () Bool)

(declare-fun mapRes!21724 () Bool)

(assert (=> mapIsEmpty!21724 mapRes!21724))

(declare-fun b!473530 () Bool)

(declare-fun e!277818 () Bool)

(declare-fun tp_is_empty!13341 () Bool)

(assert (=> b!473530 (= e!277818 tp_is_empty!13341)))

(declare-fun b!473531 () Bool)

(declare-fun e!277820 () Bool)

(assert (=> b!473531 (= e!277820 tp_is_empty!13341)))

(declare-fun mapNonEmpty!21724 () Bool)

(declare-fun tp!41772 () Bool)

(assert (=> mapNonEmpty!21724 (= mapRes!21724 (and tp!41772 e!277818))))

(declare-datatypes ((V!18893 0))(
  ( (V!18894 (val!6715 Int)) )
))
(declare-datatypes ((ValueCell!6327 0))(
  ( (ValueCellFull!6327 (v!9006 V!18893)) (EmptyCell!6327) )
))
(declare-fun mapRest!21724 () (Array (_ BitVec 32) ValueCell!6327))

(declare-datatypes ((array!30439 0))(
  ( (array!30440 (arr!14639 (Array (_ BitVec 32) ValueCell!6327)) (size!14991 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30439)

(declare-fun mapValue!21724 () ValueCell!6327)

(declare-fun mapKey!21724 () (_ BitVec 32))

(assert (=> mapNonEmpty!21724 (= (arr!14639 _values!833) (store mapRest!21724 mapKey!21724 mapValue!21724))))

(declare-fun b!473532 () Bool)

(declare-fun res!282854 () Bool)

(assert (=> b!473532 (=> (not res!282854) (not e!277823))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!473532 (= res!282854 (and (= (size!14991 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14990 _keys!1025) (size!14991 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473533 () Bool)

(declare-fun e!277822 () Bool)

(assert (=> b!473533 (= e!277823 (not e!277822))))

(declare-fun res!282853 () Bool)

(assert (=> b!473533 (=> res!282853 e!277822)))

(assert (=> b!473533 (= res!282853 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8850 0))(
  ( (tuple2!8851 (_1!4436 (_ BitVec 64)) (_2!4436 V!18893)) )
))
(declare-datatypes ((List!8931 0))(
  ( (Nil!8928) (Cons!8927 (h!9783 tuple2!8850) (t!14901 List!8931)) )
))
(declare-datatypes ((ListLongMap!7763 0))(
  ( (ListLongMap!7764 (toList!3897 List!8931)) )
))
(declare-fun lt!215235 () ListLongMap!7763)

(declare-fun lt!215233 () ListLongMap!7763)

(assert (=> b!473533 (= lt!215235 lt!215233)))

(declare-fun minValueBefore!38 () V!18893)

(declare-fun zeroValue!794 () V!18893)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13950 0))(
  ( (Unit!13951) )
))
(declare-fun lt!215236 () Unit!13950)

(declare-fun minValueAfter!38 () V!18893)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!237 (array!30437 array!30439 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18893 V!18893 V!18893 V!18893 (_ BitVec 32) Int) Unit!13950)

(assert (=> b!473533 (= lt!215236 (lemmaNoChangeToArrayThenSameMapNoExtras!237 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2057 (array!30437 array!30439 (_ BitVec 32) (_ BitVec 32) V!18893 V!18893 (_ BitVec 32) Int) ListLongMap!7763)

(assert (=> b!473533 (= lt!215233 (getCurrentListMapNoExtraKeys!2057 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473533 (= lt!215235 (getCurrentListMapNoExtraKeys!2057 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473534 () Bool)

(declare-fun res!282852 () Bool)

(assert (=> b!473534 (=> (not res!282852) (not e!277823))))

(declare-datatypes ((List!8932 0))(
  ( (Nil!8929) (Cons!8928 (h!9784 (_ BitVec 64)) (t!14902 List!8932)) )
))
(declare-fun arrayNoDuplicates!0 (array!30437 (_ BitVec 32) List!8932) Bool)

(assert (=> b!473534 (= res!282852 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8929))))

(declare-fun b!473535 () Bool)

(declare-fun e!277821 () Bool)

(assert (=> b!473535 (= e!277821 (and e!277820 mapRes!21724))))

(declare-fun condMapEmpty!21724 () Bool)

(declare-fun mapDefault!21724 () ValueCell!6327)

(assert (=> b!473535 (= condMapEmpty!21724 (= (arr!14639 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6327)) mapDefault!21724)))))

(declare-fun res!282856 () Bool)

(assert (=> start!42438 (=> (not res!282856) (not e!277823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42438 (= res!282856 (validMask!0 mask!1365))))

(assert (=> start!42438 e!277823))

(assert (=> start!42438 tp_is_empty!13341))

(assert (=> start!42438 tp!41773))

(assert (=> start!42438 true))

(declare-fun array_inv!10560 (array!30437) Bool)

(assert (=> start!42438 (array_inv!10560 _keys!1025)))

(declare-fun array_inv!10561 (array!30439) Bool)

(assert (=> start!42438 (and (array_inv!10561 _values!833) e!277821)))

(declare-fun b!473529 () Bool)

(assert (=> b!473529 (= e!277822 (bvsle #b00000000000000000000000000000000 (size!14990 _keys!1025)))))

(declare-fun lt!215232 () ListLongMap!7763)

(declare-fun lt!215234 () tuple2!8850)

(declare-fun +!1733 (ListLongMap!7763 tuple2!8850) ListLongMap!7763)

(assert (=> b!473529 (= (+!1733 lt!215232 lt!215234) (+!1733 (+!1733 lt!215232 (tuple2!8851 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215234))))

(assert (=> b!473529 (= lt!215234 (tuple2!8851 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!215231 () Unit!13950)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!142 (ListLongMap!7763 (_ BitVec 64) V!18893 V!18893) Unit!13950)

(assert (=> b!473529 (= lt!215231 (addSameAsAddTwiceSameKeyDiffValues!142 lt!215232 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!473529 (= lt!215232 (+!1733 lt!215235 (tuple2!8851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215230 () ListLongMap!7763)

(declare-fun getCurrentListMap!2262 (array!30437 array!30439 (_ BitVec 32) (_ BitVec 32) V!18893 V!18893 (_ BitVec 32) Int) ListLongMap!7763)

(assert (=> b!473529 (= lt!215230 (getCurrentListMap!2262 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215229 () ListLongMap!7763)

(assert (=> b!473529 (= lt!215229 (getCurrentListMap!2262 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42438 res!282856) b!473532))

(assert (= (and b!473532 res!282854) b!473528))

(assert (= (and b!473528 res!282855) b!473534))

(assert (= (and b!473534 res!282852) b!473533))

(assert (= (and b!473533 (not res!282853)) b!473529))

(assert (= (and b!473535 condMapEmpty!21724) mapIsEmpty!21724))

(assert (= (and b!473535 (not condMapEmpty!21724)) mapNonEmpty!21724))

(get-info :version)

(assert (= (and mapNonEmpty!21724 ((_ is ValueCellFull!6327) mapValue!21724)) b!473530))

(assert (= (and b!473535 ((_ is ValueCellFull!6327) mapDefault!21724)) b!473531))

(assert (= start!42438 b!473535))

(declare-fun m!455609 () Bool)

(assert (=> b!473534 m!455609))

(declare-fun m!455611 () Bool)

(assert (=> b!473528 m!455611))

(declare-fun m!455613 () Bool)

(assert (=> mapNonEmpty!21724 m!455613))

(declare-fun m!455615 () Bool)

(assert (=> b!473533 m!455615))

(declare-fun m!455617 () Bool)

(assert (=> b!473533 m!455617))

(declare-fun m!455619 () Bool)

(assert (=> b!473533 m!455619))

(declare-fun m!455621 () Bool)

(assert (=> b!473529 m!455621))

(declare-fun m!455623 () Bool)

(assert (=> b!473529 m!455623))

(declare-fun m!455625 () Bool)

(assert (=> b!473529 m!455625))

(declare-fun m!455627 () Bool)

(assert (=> b!473529 m!455627))

(declare-fun m!455629 () Bool)

(assert (=> b!473529 m!455629))

(assert (=> b!473529 m!455621))

(declare-fun m!455631 () Bool)

(assert (=> b!473529 m!455631))

(declare-fun m!455633 () Bool)

(assert (=> b!473529 m!455633))

(declare-fun m!455635 () Bool)

(assert (=> start!42438 m!455635))

(declare-fun m!455637 () Bool)

(assert (=> start!42438 m!455637))

(declare-fun m!455639 () Bool)

(assert (=> start!42438 m!455639))

(check-sat b_and!20369 (not start!42438) (not b!473534) (not mapNonEmpty!21724) (not b_next!11913) tp_is_empty!13341 (not b!473529) (not b!473533) (not b!473528))
(check-sat b_and!20369 (not b_next!11913))
(get-model)

(declare-fun d!75503 () Bool)

(declare-fun res!282880 () Bool)

(declare-fun e!277851 () Bool)

(assert (=> d!75503 (=> res!282880 e!277851)))

(assert (=> d!75503 (= res!282880 (bvsge #b00000000000000000000000000000000 (size!14990 _keys!1025)))))

(assert (=> d!75503 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8929) e!277851)))

(declare-fun b!473570 () Bool)

(declare-fun e!277850 () Bool)

(declare-fun contains!2548 (List!8932 (_ BitVec 64)) Bool)

(assert (=> b!473570 (= e!277850 (contains!2548 Nil!8929 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30492 () Bool)

(declare-fun call!30495 () Bool)

(declare-fun c!57051 () Bool)

(assert (=> bm!30492 (= call!30495 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57051 (Cons!8928 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000) Nil!8929) Nil!8929)))))

(declare-fun b!473571 () Bool)

(declare-fun e!277853 () Bool)

(declare-fun e!277852 () Bool)

(assert (=> b!473571 (= e!277853 e!277852)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!473571 (= c!57051 (validKeyInArray!0 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!473572 () Bool)

(assert (=> b!473572 (= e!277852 call!30495)))

(declare-fun b!473573 () Bool)

(assert (=> b!473573 (= e!277852 call!30495)))

(declare-fun b!473574 () Bool)

(assert (=> b!473574 (= e!277851 e!277853)))

(declare-fun res!282879 () Bool)

(assert (=> b!473574 (=> (not res!282879) (not e!277853))))

(assert (=> b!473574 (= res!282879 (not e!277850))))

(declare-fun res!282878 () Bool)

(assert (=> b!473574 (=> (not res!282878) (not e!277850))))

(assert (=> b!473574 (= res!282878 (validKeyInArray!0 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75503 (not res!282880)) b!473574))

(assert (= (and b!473574 res!282878) b!473570))

(assert (= (and b!473574 res!282879) b!473571))

(assert (= (and b!473571 c!57051) b!473572))

(assert (= (and b!473571 (not c!57051)) b!473573))

(assert (= (or b!473572 b!473573) bm!30492))

(declare-fun m!455673 () Bool)

(assert (=> b!473570 m!455673))

(assert (=> b!473570 m!455673))

(declare-fun m!455675 () Bool)

(assert (=> b!473570 m!455675))

(assert (=> bm!30492 m!455673))

(declare-fun m!455677 () Bool)

(assert (=> bm!30492 m!455677))

(assert (=> b!473571 m!455673))

(assert (=> b!473571 m!455673))

(declare-fun m!455679 () Bool)

(assert (=> b!473571 m!455679))

(assert (=> b!473574 m!455673))

(assert (=> b!473574 m!455673))

(assert (=> b!473574 m!455679))

(assert (=> b!473534 d!75503))

(declare-fun d!75505 () Bool)

(assert (=> d!75505 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42438 d!75505))

(declare-fun d!75507 () Bool)

(assert (=> d!75507 (= (array_inv!10560 _keys!1025) (bvsge (size!14990 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42438 d!75507))

(declare-fun d!75509 () Bool)

(assert (=> d!75509 (= (array_inv!10561 _values!833) (bvsge (size!14991 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42438 d!75509))

(declare-fun b!473617 () Bool)

(declare-fun e!277883 () ListLongMap!7763)

(declare-fun call!30511 () ListLongMap!7763)

(assert (=> b!473617 (= e!277883 (+!1733 call!30511 (tuple2!8851 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!473618 () Bool)

(declare-fun e!277887 () ListLongMap!7763)

(assert (=> b!473618 (= e!277883 e!277887)))

(declare-fun c!57068 () Bool)

(assert (=> b!473618 (= c!57068 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!473619 () Bool)

(declare-fun e!277886 () Bool)

(declare-fun e!277888 () Bool)

(assert (=> b!473619 (= e!277886 e!277888)))

(declare-fun c!57064 () Bool)

(assert (=> b!473619 (= c!57064 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!473620 () Bool)

(declare-fun e!277891 () Bool)

(declare-fun e!277890 () Bool)

(assert (=> b!473620 (= e!277891 e!277890)))

(declare-fun res!282904 () Bool)

(assert (=> b!473620 (=> (not res!282904) (not e!277890))))

(declare-fun lt!215319 () ListLongMap!7763)

(declare-fun contains!2549 (ListLongMap!7763 (_ BitVec 64)) Bool)

(assert (=> b!473620 (= res!282904 (contains!2549 lt!215319 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!473620 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14990 _keys!1025)))))

(declare-fun b!473621 () Bool)

(declare-fun e!277884 () Unit!13950)

(declare-fun Unit!13952 () Unit!13950)

(assert (=> b!473621 (= e!277884 Unit!13952)))

(declare-fun bm!30507 () Bool)

(declare-fun call!30514 () ListLongMap!7763)

(declare-fun call!30512 () ListLongMap!7763)

(assert (=> bm!30507 (= call!30514 call!30512)))

(declare-fun b!473622 () Bool)

(declare-fun e!277885 () Bool)

(assert (=> b!473622 (= e!277885 (validKeyInArray!0 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!473623 () Bool)

(declare-fun e!277881 () Bool)

(declare-fun call!30516 () Bool)

(assert (=> b!473623 (= e!277881 (not call!30516))))

(declare-fun b!473624 () Bool)

(declare-fun e!277880 () Bool)

(assert (=> b!473624 (= e!277880 (validKeyInArray!0 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!473625 () Bool)

(declare-fun apply!332 (ListLongMap!7763 (_ BitVec 64)) V!18893)

(declare-fun get!7115 (ValueCell!6327 V!18893) V!18893)

(declare-fun dynLambda!925 (Int (_ BitVec 64)) V!18893)

(assert (=> b!473625 (= e!277890 (= (apply!332 lt!215319 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000)) (get!7115 (select (arr!14639 _values!833) #b00000000000000000000000000000000) (dynLambda!925 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!473625 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14991 _values!833)))))

(assert (=> b!473625 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14990 _keys!1025)))))

(declare-fun b!473626 () Bool)

(declare-fun call!30513 () Bool)

(assert (=> b!473626 (= e!277888 (not call!30513))))

(declare-fun b!473627 () Bool)

(declare-fun c!57069 () Bool)

(assert (=> b!473627 (= c!57069 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!277882 () ListLongMap!7763)

(assert (=> b!473627 (= e!277887 e!277882)))

(declare-fun b!473628 () Bool)

(declare-fun e!277889 () Bool)

(assert (=> b!473628 (= e!277888 e!277889)))

(declare-fun res!282901 () Bool)

(assert (=> b!473628 (= res!282901 call!30513)))

(assert (=> b!473628 (=> (not res!282901) (not e!277889))))

(declare-fun b!473629 () Bool)

(declare-fun call!30510 () ListLongMap!7763)

(assert (=> b!473629 (= e!277887 call!30510)))

(declare-fun b!473630 () Bool)

(assert (=> b!473630 (= e!277882 call!30510)))

(declare-fun b!473631 () Bool)

(declare-fun e!277892 () Bool)

(assert (=> b!473631 (= e!277881 e!277892)))

(declare-fun res!282903 () Bool)

(assert (=> b!473631 (= res!282903 call!30516)))

(assert (=> b!473631 (=> (not res!282903) (not e!277892))))

(declare-fun b!473632 () Bool)

(declare-fun res!282899 () Bool)

(assert (=> b!473632 (=> (not res!282899) (not e!277886))))

(assert (=> b!473632 (= res!282899 e!277881)))

(declare-fun c!57066 () Bool)

(assert (=> b!473632 (= c!57066 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30509 () Bool)

(declare-fun call!30515 () ListLongMap!7763)

(assert (=> bm!30509 (= call!30515 (getCurrentListMapNoExtraKeys!2057 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473633 () Bool)

(declare-fun lt!215325 () Unit!13950)

(assert (=> b!473633 (= e!277884 lt!215325)))

(declare-fun lt!215316 () ListLongMap!7763)

(assert (=> b!473633 (= lt!215316 (getCurrentListMapNoExtraKeys!2057 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215320 () (_ BitVec 64))

(assert (=> b!473633 (= lt!215320 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215310 () (_ BitVec 64))

(assert (=> b!473633 (= lt!215310 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215315 () Unit!13950)

(declare-fun addStillContains!291 (ListLongMap!7763 (_ BitVec 64) V!18893 (_ BitVec 64)) Unit!13950)

(assert (=> b!473633 (= lt!215315 (addStillContains!291 lt!215316 lt!215320 zeroValue!794 lt!215310))))

(assert (=> b!473633 (contains!2549 (+!1733 lt!215316 (tuple2!8851 lt!215320 zeroValue!794)) lt!215310)))

(declare-fun lt!215318 () Unit!13950)

(assert (=> b!473633 (= lt!215318 lt!215315)))

(declare-fun lt!215312 () ListLongMap!7763)

(assert (=> b!473633 (= lt!215312 (getCurrentListMapNoExtraKeys!2057 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215323 () (_ BitVec 64))

(assert (=> b!473633 (= lt!215323 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215324 () (_ BitVec 64))

(assert (=> b!473633 (= lt!215324 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215305 () Unit!13950)

(declare-fun addApplyDifferent!291 (ListLongMap!7763 (_ BitVec 64) V!18893 (_ BitVec 64)) Unit!13950)

(assert (=> b!473633 (= lt!215305 (addApplyDifferent!291 lt!215312 lt!215323 minValueAfter!38 lt!215324))))

(assert (=> b!473633 (= (apply!332 (+!1733 lt!215312 (tuple2!8851 lt!215323 minValueAfter!38)) lt!215324) (apply!332 lt!215312 lt!215324))))

(declare-fun lt!215308 () Unit!13950)

(assert (=> b!473633 (= lt!215308 lt!215305)))

(declare-fun lt!215326 () ListLongMap!7763)

(assert (=> b!473633 (= lt!215326 (getCurrentListMapNoExtraKeys!2057 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215313 () (_ BitVec 64))

(assert (=> b!473633 (= lt!215313 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215321 () (_ BitVec 64))

(assert (=> b!473633 (= lt!215321 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215314 () Unit!13950)

(assert (=> b!473633 (= lt!215314 (addApplyDifferent!291 lt!215326 lt!215313 zeroValue!794 lt!215321))))

(assert (=> b!473633 (= (apply!332 (+!1733 lt!215326 (tuple2!8851 lt!215313 zeroValue!794)) lt!215321) (apply!332 lt!215326 lt!215321))))

(declare-fun lt!215317 () Unit!13950)

(assert (=> b!473633 (= lt!215317 lt!215314)))

(declare-fun lt!215322 () ListLongMap!7763)

(assert (=> b!473633 (= lt!215322 (getCurrentListMapNoExtraKeys!2057 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215311 () (_ BitVec 64))

(assert (=> b!473633 (= lt!215311 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215307 () (_ BitVec 64))

(assert (=> b!473633 (= lt!215307 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!473633 (= lt!215325 (addApplyDifferent!291 lt!215322 lt!215311 minValueAfter!38 lt!215307))))

(assert (=> b!473633 (= (apply!332 (+!1733 lt!215322 (tuple2!8851 lt!215311 minValueAfter!38)) lt!215307) (apply!332 lt!215322 lt!215307))))

(declare-fun b!473634 () Bool)

(assert (=> b!473634 (= e!277892 (= (apply!332 lt!215319 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!473635 () Bool)

(assert (=> b!473635 (= e!277889 (= (apply!332 lt!215319 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun b!473636 () Bool)

(declare-fun res!282906 () Bool)

(assert (=> b!473636 (=> (not res!282906) (not e!277886))))

(assert (=> b!473636 (= res!282906 e!277891)))

(declare-fun res!282902 () Bool)

(assert (=> b!473636 (=> res!282902 e!277891)))

(assert (=> b!473636 (= res!282902 (not e!277880))))

(declare-fun res!282900 () Bool)

(assert (=> b!473636 (=> (not res!282900) (not e!277880))))

(assert (=> b!473636 (= res!282900 (bvslt #b00000000000000000000000000000000 (size!14990 _keys!1025)))))

(declare-fun bm!30510 () Bool)

(assert (=> bm!30510 (= call!30513 (contains!2549 lt!215319 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30511 () Bool)

(assert (=> bm!30511 (= call!30516 (contains!2549 lt!215319 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30512 () Bool)

(declare-fun c!57067 () Bool)

(assert (=> bm!30512 (= call!30511 (+!1733 (ite c!57067 call!30515 (ite c!57068 call!30512 call!30514)) (ite (or c!57067 c!57068) (tuple2!8851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8851 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun d!75511 () Bool)

(assert (=> d!75511 e!277886))

(declare-fun res!282907 () Bool)

(assert (=> d!75511 (=> (not res!282907) (not e!277886))))

(assert (=> d!75511 (= res!282907 (or (bvsge #b00000000000000000000000000000000 (size!14990 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14990 _keys!1025)))))))

(declare-fun lt!215306 () ListLongMap!7763)

(assert (=> d!75511 (= lt!215319 lt!215306)))

(declare-fun lt!215309 () Unit!13950)

(assert (=> d!75511 (= lt!215309 e!277884)))

(declare-fun c!57065 () Bool)

(assert (=> d!75511 (= c!57065 e!277885)))

(declare-fun res!282905 () Bool)

(assert (=> d!75511 (=> (not res!282905) (not e!277885))))

(assert (=> d!75511 (= res!282905 (bvslt #b00000000000000000000000000000000 (size!14990 _keys!1025)))))

(assert (=> d!75511 (= lt!215306 e!277883)))

(assert (=> d!75511 (= c!57067 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75511 (validMask!0 mask!1365)))

(assert (=> d!75511 (= (getCurrentListMap!2262 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!215319)))

(declare-fun bm!30508 () Bool)

(assert (=> bm!30508 (= call!30510 call!30511)))

(declare-fun b!473637 () Bool)

(assert (=> b!473637 (= e!277882 call!30514)))

(declare-fun bm!30513 () Bool)

(assert (=> bm!30513 (= call!30512 call!30515)))

(assert (= (and d!75511 c!57067) b!473617))

(assert (= (and d!75511 (not c!57067)) b!473618))

(assert (= (and b!473618 c!57068) b!473629))

(assert (= (and b!473618 (not c!57068)) b!473627))

(assert (= (and b!473627 c!57069) b!473630))

(assert (= (and b!473627 (not c!57069)) b!473637))

(assert (= (or b!473630 b!473637) bm!30507))

(assert (= (or b!473629 bm!30507) bm!30513))

(assert (= (or b!473629 b!473630) bm!30508))

(assert (= (or b!473617 bm!30513) bm!30509))

(assert (= (or b!473617 bm!30508) bm!30512))

(assert (= (and d!75511 res!282905) b!473622))

(assert (= (and d!75511 c!57065) b!473633))

(assert (= (and d!75511 (not c!57065)) b!473621))

(assert (= (and d!75511 res!282907) b!473636))

(assert (= (and b!473636 res!282900) b!473624))

(assert (= (and b!473636 (not res!282902)) b!473620))

(assert (= (and b!473620 res!282904) b!473625))

(assert (= (and b!473636 res!282906) b!473632))

(assert (= (and b!473632 c!57066) b!473631))

(assert (= (and b!473632 (not c!57066)) b!473623))

(assert (= (and b!473631 res!282903) b!473634))

(assert (= (or b!473631 b!473623) bm!30511))

(assert (= (and b!473632 res!282899) b!473619))

(assert (= (and b!473619 c!57064) b!473628))

(assert (= (and b!473619 (not c!57064)) b!473626))

(assert (= (and b!473628 res!282901) b!473635))

(assert (= (or b!473628 b!473626) bm!30510))

(declare-fun b_lambda!10205 () Bool)

(assert (=> (not b_lambda!10205) (not b!473625)))

(declare-fun t!14905 () Bool)

(declare-fun tb!3929 () Bool)

(assert (=> (and start!42438 (= defaultEntry!841 defaultEntry!841) t!14905) tb!3929))

(declare-fun result!7445 () Bool)

(assert (=> tb!3929 (= result!7445 tp_is_empty!13341)))

(assert (=> b!473625 t!14905))

(declare-fun b_and!20373 () Bool)

(assert (= b_and!20369 (and (=> t!14905 result!7445) b_and!20373)))

(declare-fun m!455681 () Bool)

(assert (=> b!473635 m!455681))

(declare-fun m!455683 () Bool)

(assert (=> bm!30510 m!455683))

(assert (=> d!75511 m!455635))

(declare-fun m!455685 () Bool)

(assert (=> bm!30512 m!455685))

(declare-fun m!455687 () Bool)

(assert (=> b!473617 m!455687))

(declare-fun m!455689 () Bool)

(assert (=> b!473625 m!455689))

(declare-fun m!455691 () Bool)

(assert (=> b!473625 m!455691))

(assert (=> b!473625 m!455689))

(assert (=> b!473625 m!455691))

(declare-fun m!455693 () Bool)

(assert (=> b!473625 m!455693))

(assert (=> b!473625 m!455673))

(declare-fun m!455695 () Bool)

(assert (=> b!473625 m!455695))

(assert (=> b!473625 m!455673))

(declare-fun m!455697 () Bool)

(assert (=> bm!30511 m!455697))

(assert (=> b!473620 m!455673))

(assert (=> b!473620 m!455673))

(declare-fun m!455699 () Bool)

(assert (=> b!473620 m!455699))

(declare-fun m!455701 () Bool)

(assert (=> b!473633 m!455701))

(declare-fun m!455703 () Bool)

(assert (=> b!473633 m!455703))

(declare-fun m!455705 () Bool)

(assert (=> b!473633 m!455705))

(declare-fun m!455707 () Bool)

(assert (=> b!473633 m!455707))

(declare-fun m!455709 () Bool)

(assert (=> b!473633 m!455709))

(declare-fun m!455711 () Bool)

(assert (=> b!473633 m!455711))

(declare-fun m!455713 () Bool)

(assert (=> b!473633 m!455713))

(assert (=> b!473633 m!455711))

(declare-fun m!455715 () Bool)

(assert (=> b!473633 m!455715))

(declare-fun m!455717 () Bool)

(assert (=> b!473633 m!455717))

(declare-fun m!455719 () Bool)

(assert (=> b!473633 m!455719))

(assert (=> b!473633 m!455617))

(declare-fun m!455721 () Bool)

(assert (=> b!473633 m!455721))

(declare-fun m!455723 () Bool)

(assert (=> b!473633 m!455723))

(assert (=> b!473633 m!455719))

(declare-fun m!455725 () Bool)

(assert (=> b!473633 m!455725))

(assert (=> b!473633 m!455673))

(assert (=> b!473633 m!455707))

(declare-fun m!455727 () Bool)

(assert (=> b!473633 m!455727))

(assert (=> b!473633 m!455701))

(declare-fun m!455729 () Bool)

(assert (=> b!473633 m!455729))

(assert (=> bm!30509 m!455617))

(assert (=> b!473624 m!455673))

(assert (=> b!473624 m!455673))

(assert (=> b!473624 m!455679))

(declare-fun m!455731 () Bool)

(assert (=> b!473634 m!455731))

(assert (=> b!473622 m!455673))

(assert (=> b!473622 m!455673))

(assert (=> b!473622 m!455679))

(assert (=> b!473529 d!75511))

(declare-fun d!75513 () Bool)

(declare-fun e!277895 () Bool)

(assert (=> d!75513 e!277895))

(declare-fun res!282912 () Bool)

(assert (=> d!75513 (=> (not res!282912) (not e!277895))))

(declare-fun lt!215338 () ListLongMap!7763)

(assert (=> d!75513 (= res!282912 (contains!2549 lt!215338 (_1!4436 (tuple2!8851 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lt!215337 () List!8931)

(assert (=> d!75513 (= lt!215338 (ListLongMap!7764 lt!215337))))

(declare-fun lt!215335 () Unit!13950)

(declare-fun lt!215336 () Unit!13950)

(assert (=> d!75513 (= lt!215335 lt!215336)))

(declare-datatypes ((Option!386 0))(
  ( (Some!385 (v!9008 V!18893)) (None!384) )
))
(declare-fun getValueByKey!380 (List!8931 (_ BitVec 64)) Option!386)

(assert (=> d!75513 (= (getValueByKey!380 lt!215337 (_1!4436 (tuple2!8851 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!385 (_2!4436 (tuple2!8851 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lemmaContainsTupThenGetReturnValue!202 (List!8931 (_ BitVec 64) V!18893) Unit!13950)

(assert (=> d!75513 (= lt!215336 (lemmaContainsTupThenGetReturnValue!202 lt!215337 (_1!4436 (tuple2!8851 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4436 (tuple2!8851 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun insertStrictlySorted!205 (List!8931 (_ BitVec 64) V!18893) List!8931)

(assert (=> d!75513 (= lt!215337 (insertStrictlySorted!205 (toList!3897 lt!215232) (_1!4436 (tuple2!8851 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4436 (tuple2!8851 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75513 (= (+!1733 lt!215232 (tuple2!8851 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215338)))

(declare-fun b!473644 () Bool)

(declare-fun res!282913 () Bool)

(assert (=> b!473644 (=> (not res!282913) (not e!277895))))

(assert (=> b!473644 (= res!282913 (= (getValueByKey!380 (toList!3897 lt!215338) (_1!4436 (tuple2!8851 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!385 (_2!4436 (tuple2!8851 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))))

(declare-fun b!473645 () Bool)

(declare-fun contains!2550 (List!8931 tuple2!8850) Bool)

(assert (=> b!473645 (= e!277895 (contains!2550 (toList!3897 lt!215338) (tuple2!8851 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(assert (= (and d!75513 res!282912) b!473644))

(assert (= (and b!473644 res!282913) b!473645))

(declare-fun m!455733 () Bool)

(assert (=> d!75513 m!455733))

(declare-fun m!455735 () Bool)

(assert (=> d!75513 m!455735))

(declare-fun m!455737 () Bool)

(assert (=> d!75513 m!455737))

(declare-fun m!455739 () Bool)

(assert (=> d!75513 m!455739))

(declare-fun m!455741 () Bool)

(assert (=> b!473644 m!455741))

(declare-fun m!455743 () Bool)

(assert (=> b!473645 m!455743))

(assert (=> b!473529 d!75513))

(declare-fun d!75515 () Bool)

(declare-fun e!277896 () Bool)

(assert (=> d!75515 e!277896))

(declare-fun res!282914 () Bool)

(assert (=> d!75515 (=> (not res!282914) (not e!277896))))

(declare-fun lt!215342 () ListLongMap!7763)

(assert (=> d!75515 (= res!282914 (contains!2549 lt!215342 (_1!4436 (tuple2!8851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(declare-fun lt!215341 () List!8931)

(assert (=> d!75515 (= lt!215342 (ListLongMap!7764 lt!215341))))

(declare-fun lt!215339 () Unit!13950)

(declare-fun lt!215340 () Unit!13950)

(assert (=> d!75515 (= lt!215339 lt!215340)))

(assert (=> d!75515 (= (getValueByKey!380 lt!215341 (_1!4436 (tuple2!8851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))) (Some!385 (_2!4436 (tuple2!8851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75515 (= lt!215340 (lemmaContainsTupThenGetReturnValue!202 lt!215341 (_1!4436 (tuple2!8851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) (_2!4436 (tuple2!8851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75515 (= lt!215341 (insertStrictlySorted!205 (toList!3897 lt!215235) (_1!4436 (tuple2!8851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) (_2!4436 (tuple2!8851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))))))

(assert (=> d!75515 (= (+!1733 lt!215235 (tuple2!8851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)) lt!215342)))

(declare-fun b!473646 () Bool)

(declare-fun res!282915 () Bool)

(assert (=> b!473646 (=> (not res!282915) (not e!277896))))

(assert (=> b!473646 (= res!282915 (= (getValueByKey!380 (toList!3897 lt!215342) (_1!4436 (tuple2!8851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794))) (Some!385 (_2!4436 (tuple2!8851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))))

(declare-fun b!473647 () Bool)

(assert (=> b!473647 (= e!277896 (contains!2550 (toList!3897 lt!215342) (tuple2!8851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(assert (= (and d!75515 res!282914) b!473646))

(assert (= (and b!473646 res!282915) b!473647))

(declare-fun m!455745 () Bool)

(assert (=> d!75515 m!455745))

(declare-fun m!455747 () Bool)

(assert (=> d!75515 m!455747))

(declare-fun m!455749 () Bool)

(assert (=> d!75515 m!455749))

(declare-fun m!455751 () Bool)

(assert (=> d!75515 m!455751))

(declare-fun m!455753 () Bool)

(assert (=> b!473646 m!455753))

(declare-fun m!455755 () Bool)

(assert (=> b!473647 m!455755))

(assert (=> b!473529 d!75515))

(declare-fun d!75517 () Bool)

(declare-fun e!277897 () Bool)

(assert (=> d!75517 e!277897))

(declare-fun res!282916 () Bool)

(assert (=> d!75517 (=> (not res!282916) (not e!277897))))

(declare-fun lt!215346 () ListLongMap!7763)

(assert (=> d!75517 (= res!282916 (contains!2549 lt!215346 (_1!4436 lt!215234)))))

(declare-fun lt!215345 () List!8931)

(assert (=> d!75517 (= lt!215346 (ListLongMap!7764 lt!215345))))

(declare-fun lt!215343 () Unit!13950)

(declare-fun lt!215344 () Unit!13950)

(assert (=> d!75517 (= lt!215343 lt!215344)))

(assert (=> d!75517 (= (getValueByKey!380 lt!215345 (_1!4436 lt!215234)) (Some!385 (_2!4436 lt!215234)))))

(assert (=> d!75517 (= lt!215344 (lemmaContainsTupThenGetReturnValue!202 lt!215345 (_1!4436 lt!215234) (_2!4436 lt!215234)))))

(assert (=> d!75517 (= lt!215345 (insertStrictlySorted!205 (toList!3897 lt!215232) (_1!4436 lt!215234) (_2!4436 lt!215234)))))

(assert (=> d!75517 (= (+!1733 lt!215232 lt!215234) lt!215346)))

(declare-fun b!473648 () Bool)

(declare-fun res!282917 () Bool)

(assert (=> b!473648 (=> (not res!282917) (not e!277897))))

(assert (=> b!473648 (= res!282917 (= (getValueByKey!380 (toList!3897 lt!215346) (_1!4436 lt!215234)) (Some!385 (_2!4436 lt!215234))))))

(declare-fun b!473649 () Bool)

(assert (=> b!473649 (= e!277897 (contains!2550 (toList!3897 lt!215346) lt!215234))))

(assert (= (and d!75517 res!282916) b!473648))

(assert (= (and b!473648 res!282917) b!473649))

(declare-fun m!455757 () Bool)

(assert (=> d!75517 m!455757))

(declare-fun m!455759 () Bool)

(assert (=> d!75517 m!455759))

(declare-fun m!455761 () Bool)

(assert (=> d!75517 m!455761))

(declare-fun m!455763 () Bool)

(assert (=> d!75517 m!455763))

(declare-fun m!455765 () Bool)

(assert (=> b!473648 m!455765))

(declare-fun m!455767 () Bool)

(assert (=> b!473649 m!455767))

(assert (=> b!473529 d!75517))

(declare-fun b!473650 () Bool)

(declare-fun e!277901 () ListLongMap!7763)

(declare-fun call!30518 () ListLongMap!7763)

(assert (=> b!473650 (= e!277901 (+!1733 call!30518 (tuple2!8851 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun b!473651 () Bool)

(declare-fun e!277905 () ListLongMap!7763)

(assert (=> b!473651 (= e!277901 e!277905)))

(declare-fun c!57074 () Bool)

(assert (=> b!473651 (= c!57074 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!473652 () Bool)

(declare-fun e!277904 () Bool)

(declare-fun e!277906 () Bool)

(assert (=> b!473652 (= e!277904 e!277906)))

(declare-fun c!57070 () Bool)

(assert (=> b!473652 (= c!57070 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!473653 () Bool)

(declare-fun e!277909 () Bool)

(declare-fun e!277908 () Bool)

(assert (=> b!473653 (= e!277909 e!277908)))

(declare-fun res!282923 () Bool)

(assert (=> b!473653 (=> (not res!282923) (not e!277908))))

(declare-fun lt!215361 () ListLongMap!7763)

(assert (=> b!473653 (= res!282923 (contains!2549 lt!215361 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!473653 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14990 _keys!1025)))))

(declare-fun b!473654 () Bool)

(declare-fun e!277902 () Unit!13950)

(declare-fun Unit!13953 () Unit!13950)

(assert (=> b!473654 (= e!277902 Unit!13953)))

(declare-fun bm!30514 () Bool)

(declare-fun call!30521 () ListLongMap!7763)

(declare-fun call!30519 () ListLongMap!7763)

(assert (=> bm!30514 (= call!30521 call!30519)))

(declare-fun b!473655 () Bool)

(declare-fun e!277903 () Bool)

(assert (=> b!473655 (= e!277903 (validKeyInArray!0 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!473656 () Bool)

(declare-fun e!277899 () Bool)

(declare-fun call!30523 () Bool)

(assert (=> b!473656 (= e!277899 (not call!30523))))

(declare-fun b!473657 () Bool)

(declare-fun e!277898 () Bool)

(assert (=> b!473657 (= e!277898 (validKeyInArray!0 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!473658 () Bool)

(assert (=> b!473658 (= e!277908 (= (apply!332 lt!215361 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000)) (get!7115 (select (arr!14639 _values!833) #b00000000000000000000000000000000) (dynLambda!925 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!473658 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14991 _values!833)))))

(assert (=> b!473658 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14990 _keys!1025)))))

(declare-fun b!473659 () Bool)

(declare-fun call!30520 () Bool)

(assert (=> b!473659 (= e!277906 (not call!30520))))

(declare-fun b!473660 () Bool)

(declare-fun c!57075 () Bool)

(assert (=> b!473660 (= c!57075 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!277900 () ListLongMap!7763)

(assert (=> b!473660 (= e!277905 e!277900)))

(declare-fun b!473661 () Bool)

(declare-fun e!277907 () Bool)

(assert (=> b!473661 (= e!277906 e!277907)))

(declare-fun res!282920 () Bool)

(assert (=> b!473661 (= res!282920 call!30520)))

(assert (=> b!473661 (=> (not res!282920) (not e!277907))))

(declare-fun b!473662 () Bool)

(declare-fun call!30517 () ListLongMap!7763)

(assert (=> b!473662 (= e!277905 call!30517)))

(declare-fun b!473663 () Bool)

(assert (=> b!473663 (= e!277900 call!30517)))

(declare-fun b!473664 () Bool)

(declare-fun e!277910 () Bool)

(assert (=> b!473664 (= e!277899 e!277910)))

(declare-fun res!282922 () Bool)

(assert (=> b!473664 (= res!282922 call!30523)))

(assert (=> b!473664 (=> (not res!282922) (not e!277910))))

(declare-fun b!473665 () Bool)

(declare-fun res!282918 () Bool)

(assert (=> b!473665 (=> (not res!282918) (not e!277904))))

(assert (=> b!473665 (= res!282918 e!277899)))

(declare-fun c!57072 () Bool)

(assert (=> b!473665 (= c!57072 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun call!30522 () ListLongMap!7763)

(declare-fun bm!30516 () Bool)

(assert (=> bm!30516 (= call!30522 (getCurrentListMapNoExtraKeys!2057 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473666 () Bool)

(declare-fun lt!215367 () Unit!13950)

(assert (=> b!473666 (= e!277902 lt!215367)))

(declare-fun lt!215358 () ListLongMap!7763)

(assert (=> b!473666 (= lt!215358 (getCurrentListMapNoExtraKeys!2057 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215362 () (_ BitVec 64))

(assert (=> b!473666 (= lt!215362 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215352 () (_ BitVec 64))

(assert (=> b!473666 (= lt!215352 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215357 () Unit!13950)

(assert (=> b!473666 (= lt!215357 (addStillContains!291 lt!215358 lt!215362 zeroValue!794 lt!215352))))

(assert (=> b!473666 (contains!2549 (+!1733 lt!215358 (tuple2!8851 lt!215362 zeroValue!794)) lt!215352)))

(declare-fun lt!215360 () Unit!13950)

(assert (=> b!473666 (= lt!215360 lt!215357)))

(declare-fun lt!215354 () ListLongMap!7763)

(assert (=> b!473666 (= lt!215354 (getCurrentListMapNoExtraKeys!2057 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215365 () (_ BitVec 64))

(assert (=> b!473666 (= lt!215365 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215366 () (_ BitVec 64))

(assert (=> b!473666 (= lt!215366 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215347 () Unit!13950)

(assert (=> b!473666 (= lt!215347 (addApplyDifferent!291 lt!215354 lt!215365 minValueBefore!38 lt!215366))))

(assert (=> b!473666 (= (apply!332 (+!1733 lt!215354 (tuple2!8851 lt!215365 minValueBefore!38)) lt!215366) (apply!332 lt!215354 lt!215366))))

(declare-fun lt!215350 () Unit!13950)

(assert (=> b!473666 (= lt!215350 lt!215347)))

(declare-fun lt!215368 () ListLongMap!7763)

(assert (=> b!473666 (= lt!215368 (getCurrentListMapNoExtraKeys!2057 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215355 () (_ BitVec 64))

(assert (=> b!473666 (= lt!215355 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215363 () (_ BitVec 64))

(assert (=> b!473666 (= lt!215363 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215356 () Unit!13950)

(assert (=> b!473666 (= lt!215356 (addApplyDifferent!291 lt!215368 lt!215355 zeroValue!794 lt!215363))))

(assert (=> b!473666 (= (apply!332 (+!1733 lt!215368 (tuple2!8851 lt!215355 zeroValue!794)) lt!215363) (apply!332 lt!215368 lt!215363))))

(declare-fun lt!215359 () Unit!13950)

(assert (=> b!473666 (= lt!215359 lt!215356)))

(declare-fun lt!215364 () ListLongMap!7763)

(assert (=> b!473666 (= lt!215364 (getCurrentListMapNoExtraKeys!2057 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215353 () (_ BitVec 64))

(assert (=> b!473666 (= lt!215353 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215349 () (_ BitVec 64))

(assert (=> b!473666 (= lt!215349 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!473666 (= lt!215367 (addApplyDifferent!291 lt!215364 lt!215353 minValueBefore!38 lt!215349))))

(assert (=> b!473666 (= (apply!332 (+!1733 lt!215364 (tuple2!8851 lt!215353 minValueBefore!38)) lt!215349) (apply!332 lt!215364 lt!215349))))

(declare-fun b!473667 () Bool)

(assert (=> b!473667 (= e!277910 (= (apply!332 lt!215361 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!473668 () Bool)

(assert (=> b!473668 (= e!277907 (= (apply!332 lt!215361 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!473669 () Bool)

(declare-fun res!282925 () Bool)

(assert (=> b!473669 (=> (not res!282925) (not e!277904))))

(assert (=> b!473669 (= res!282925 e!277909)))

(declare-fun res!282921 () Bool)

(assert (=> b!473669 (=> res!282921 e!277909)))

(assert (=> b!473669 (= res!282921 (not e!277898))))

(declare-fun res!282919 () Bool)

(assert (=> b!473669 (=> (not res!282919) (not e!277898))))

(assert (=> b!473669 (= res!282919 (bvslt #b00000000000000000000000000000000 (size!14990 _keys!1025)))))

(declare-fun bm!30517 () Bool)

(assert (=> bm!30517 (= call!30520 (contains!2549 lt!215361 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30518 () Bool)

(assert (=> bm!30518 (= call!30523 (contains!2549 lt!215361 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!57073 () Bool)

(declare-fun bm!30519 () Bool)

(assert (=> bm!30519 (= call!30518 (+!1733 (ite c!57073 call!30522 (ite c!57074 call!30519 call!30521)) (ite (or c!57073 c!57074) (tuple2!8851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8851 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun d!75519 () Bool)

(assert (=> d!75519 e!277904))

(declare-fun res!282926 () Bool)

(assert (=> d!75519 (=> (not res!282926) (not e!277904))))

(assert (=> d!75519 (= res!282926 (or (bvsge #b00000000000000000000000000000000 (size!14990 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14990 _keys!1025)))))))

(declare-fun lt!215348 () ListLongMap!7763)

(assert (=> d!75519 (= lt!215361 lt!215348)))

(declare-fun lt!215351 () Unit!13950)

(assert (=> d!75519 (= lt!215351 e!277902)))

(declare-fun c!57071 () Bool)

(assert (=> d!75519 (= c!57071 e!277903)))

(declare-fun res!282924 () Bool)

(assert (=> d!75519 (=> (not res!282924) (not e!277903))))

(assert (=> d!75519 (= res!282924 (bvslt #b00000000000000000000000000000000 (size!14990 _keys!1025)))))

(assert (=> d!75519 (= lt!215348 e!277901)))

(assert (=> d!75519 (= c!57073 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75519 (validMask!0 mask!1365)))

(assert (=> d!75519 (= (getCurrentListMap!2262 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!215361)))

(declare-fun bm!30515 () Bool)

(assert (=> bm!30515 (= call!30517 call!30518)))

(declare-fun b!473670 () Bool)

(assert (=> b!473670 (= e!277900 call!30521)))

(declare-fun bm!30520 () Bool)

(assert (=> bm!30520 (= call!30519 call!30522)))

(assert (= (and d!75519 c!57073) b!473650))

(assert (= (and d!75519 (not c!57073)) b!473651))

(assert (= (and b!473651 c!57074) b!473662))

(assert (= (and b!473651 (not c!57074)) b!473660))

(assert (= (and b!473660 c!57075) b!473663))

(assert (= (and b!473660 (not c!57075)) b!473670))

(assert (= (or b!473663 b!473670) bm!30514))

(assert (= (or b!473662 bm!30514) bm!30520))

(assert (= (or b!473662 b!473663) bm!30515))

(assert (= (or b!473650 bm!30520) bm!30516))

(assert (= (or b!473650 bm!30515) bm!30519))

(assert (= (and d!75519 res!282924) b!473655))

(assert (= (and d!75519 c!57071) b!473666))

(assert (= (and d!75519 (not c!57071)) b!473654))

(assert (= (and d!75519 res!282926) b!473669))

(assert (= (and b!473669 res!282919) b!473657))

(assert (= (and b!473669 (not res!282921)) b!473653))

(assert (= (and b!473653 res!282923) b!473658))

(assert (= (and b!473669 res!282925) b!473665))

(assert (= (and b!473665 c!57072) b!473664))

(assert (= (and b!473665 (not c!57072)) b!473656))

(assert (= (and b!473664 res!282922) b!473667))

(assert (= (or b!473664 b!473656) bm!30518))

(assert (= (and b!473665 res!282918) b!473652))

(assert (= (and b!473652 c!57070) b!473661))

(assert (= (and b!473652 (not c!57070)) b!473659))

(assert (= (and b!473661 res!282920) b!473668))

(assert (= (or b!473661 b!473659) bm!30517))

(declare-fun b_lambda!10207 () Bool)

(assert (=> (not b_lambda!10207) (not b!473658)))

(assert (=> b!473658 t!14905))

(declare-fun b_and!20375 () Bool)

(assert (= b_and!20373 (and (=> t!14905 result!7445) b_and!20375)))

(declare-fun m!455769 () Bool)

(assert (=> b!473668 m!455769))

(declare-fun m!455771 () Bool)

(assert (=> bm!30517 m!455771))

(assert (=> d!75519 m!455635))

(declare-fun m!455773 () Bool)

(assert (=> bm!30519 m!455773))

(declare-fun m!455775 () Bool)

(assert (=> b!473650 m!455775))

(assert (=> b!473658 m!455689))

(assert (=> b!473658 m!455691))

(assert (=> b!473658 m!455689))

(assert (=> b!473658 m!455691))

(assert (=> b!473658 m!455693))

(assert (=> b!473658 m!455673))

(declare-fun m!455777 () Bool)

(assert (=> b!473658 m!455777))

(assert (=> b!473658 m!455673))

(declare-fun m!455779 () Bool)

(assert (=> bm!30518 m!455779))

(assert (=> b!473653 m!455673))

(assert (=> b!473653 m!455673))

(declare-fun m!455781 () Bool)

(assert (=> b!473653 m!455781))

(declare-fun m!455783 () Bool)

(assert (=> b!473666 m!455783))

(declare-fun m!455785 () Bool)

(assert (=> b!473666 m!455785))

(declare-fun m!455787 () Bool)

(assert (=> b!473666 m!455787))

(declare-fun m!455789 () Bool)

(assert (=> b!473666 m!455789))

(declare-fun m!455791 () Bool)

(assert (=> b!473666 m!455791))

(declare-fun m!455793 () Bool)

(assert (=> b!473666 m!455793))

(declare-fun m!455795 () Bool)

(assert (=> b!473666 m!455795))

(assert (=> b!473666 m!455793))

(declare-fun m!455797 () Bool)

(assert (=> b!473666 m!455797))

(declare-fun m!455799 () Bool)

(assert (=> b!473666 m!455799))

(declare-fun m!455801 () Bool)

(assert (=> b!473666 m!455801))

(assert (=> b!473666 m!455619))

(declare-fun m!455803 () Bool)

(assert (=> b!473666 m!455803))

(declare-fun m!455805 () Bool)

(assert (=> b!473666 m!455805))

(assert (=> b!473666 m!455801))

(declare-fun m!455807 () Bool)

(assert (=> b!473666 m!455807))

(assert (=> b!473666 m!455673))

(assert (=> b!473666 m!455789))

(declare-fun m!455809 () Bool)

(assert (=> b!473666 m!455809))

(assert (=> b!473666 m!455783))

(declare-fun m!455811 () Bool)

(assert (=> b!473666 m!455811))

(assert (=> bm!30516 m!455619))

(assert (=> b!473657 m!455673))

(assert (=> b!473657 m!455673))

(assert (=> b!473657 m!455679))

(declare-fun m!455813 () Bool)

(assert (=> b!473667 m!455813))

(assert (=> b!473655 m!455673))

(assert (=> b!473655 m!455673))

(assert (=> b!473655 m!455679))

(assert (=> b!473529 d!75519))

(declare-fun d!75521 () Bool)

(assert (=> d!75521 (= (+!1733 lt!215232 (tuple2!8851 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (+!1733 (+!1733 lt!215232 (tuple2!8851 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (tuple2!8851 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun lt!215371 () Unit!13950)

(declare-fun choose!1351 (ListLongMap!7763 (_ BitVec 64) V!18893 V!18893) Unit!13950)

(assert (=> d!75521 (= lt!215371 (choose!1351 lt!215232 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> d!75521 (= (addSameAsAddTwiceSameKeyDiffValues!142 lt!215232 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38) lt!215371)))

(declare-fun bs!15032 () Bool)

(assert (= bs!15032 d!75521))

(declare-fun m!455815 () Bool)

(assert (=> bs!15032 m!455815))

(assert (=> bs!15032 m!455621))

(assert (=> bs!15032 m!455621))

(declare-fun m!455817 () Bool)

(assert (=> bs!15032 m!455817))

(declare-fun m!455819 () Bool)

(assert (=> bs!15032 m!455819))

(assert (=> b!473529 d!75521))

(declare-fun d!75523 () Bool)

(declare-fun e!277911 () Bool)

(assert (=> d!75523 e!277911))

(declare-fun res!282927 () Bool)

(assert (=> d!75523 (=> (not res!282927) (not e!277911))))

(declare-fun lt!215375 () ListLongMap!7763)

(assert (=> d!75523 (= res!282927 (contains!2549 lt!215375 (_1!4436 lt!215234)))))

(declare-fun lt!215374 () List!8931)

(assert (=> d!75523 (= lt!215375 (ListLongMap!7764 lt!215374))))

(declare-fun lt!215372 () Unit!13950)

(declare-fun lt!215373 () Unit!13950)

(assert (=> d!75523 (= lt!215372 lt!215373)))

(assert (=> d!75523 (= (getValueByKey!380 lt!215374 (_1!4436 lt!215234)) (Some!385 (_2!4436 lt!215234)))))

(assert (=> d!75523 (= lt!215373 (lemmaContainsTupThenGetReturnValue!202 lt!215374 (_1!4436 lt!215234) (_2!4436 lt!215234)))))

(assert (=> d!75523 (= lt!215374 (insertStrictlySorted!205 (toList!3897 (+!1733 lt!215232 (tuple2!8851 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (_1!4436 lt!215234) (_2!4436 lt!215234)))))

(assert (=> d!75523 (= (+!1733 (+!1733 lt!215232 (tuple2!8851 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215234) lt!215375)))

(declare-fun b!473671 () Bool)

(declare-fun res!282928 () Bool)

(assert (=> b!473671 (=> (not res!282928) (not e!277911))))

(assert (=> b!473671 (= res!282928 (= (getValueByKey!380 (toList!3897 lt!215375) (_1!4436 lt!215234)) (Some!385 (_2!4436 lt!215234))))))

(declare-fun b!473672 () Bool)

(assert (=> b!473672 (= e!277911 (contains!2550 (toList!3897 lt!215375) lt!215234))))

(assert (= (and d!75523 res!282927) b!473671))

(assert (= (and b!473671 res!282928) b!473672))

(declare-fun m!455821 () Bool)

(assert (=> d!75523 m!455821))

(declare-fun m!455823 () Bool)

(assert (=> d!75523 m!455823))

(declare-fun m!455825 () Bool)

(assert (=> d!75523 m!455825))

(declare-fun m!455827 () Bool)

(assert (=> d!75523 m!455827))

(declare-fun m!455829 () Bool)

(assert (=> b!473671 m!455829))

(declare-fun m!455831 () Bool)

(assert (=> b!473672 m!455831))

(assert (=> b!473529 d!75523))

(declare-fun d!75525 () Bool)

(assert (=> d!75525 (= (getCurrentListMapNoExtraKeys!2057 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2057 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215378 () Unit!13950)

(declare-fun choose!1352 (array!30437 array!30439 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18893 V!18893 V!18893 V!18893 (_ BitVec 32) Int) Unit!13950)

(assert (=> d!75525 (= lt!215378 (choose!1352 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75525 (validMask!0 mask!1365)))

(assert (=> d!75525 (= (lemmaNoChangeToArrayThenSameMapNoExtras!237 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!215378)))

(declare-fun bs!15033 () Bool)

(assert (= bs!15033 d!75525))

(assert (=> bs!15033 m!455619))

(assert (=> bs!15033 m!455617))

(declare-fun m!455833 () Bool)

(assert (=> bs!15033 m!455833))

(assert (=> bs!15033 m!455635))

(assert (=> b!473533 d!75525))

(declare-fun b!473697 () Bool)

(declare-fun e!277928 () Bool)

(declare-fun lt!215399 () ListLongMap!7763)

(declare-fun isEmpty!579 (ListLongMap!7763) Bool)

(assert (=> b!473697 (= e!277928 (isEmpty!579 lt!215399))))

(declare-fun b!473698 () Bool)

(declare-fun res!282940 () Bool)

(declare-fun e!277931 () Bool)

(assert (=> b!473698 (=> (not res!282940) (not e!277931))))

(assert (=> b!473698 (= res!282940 (not (contains!2549 lt!215399 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!473699 () Bool)

(declare-fun e!277927 () Bool)

(assert (=> b!473699 (= e!277927 (validKeyInArray!0 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!473699 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!473700 () Bool)

(declare-fun e!277926 () Bool)

(assert (=> b!473700 (= e!277931 e!277926)))

(declare-fun c!57084 () Bool)

(assert (=> b!473700 (= c!57084 e!277927)))

(declare-fun res!282938 () Bool)

(assert (=> b!473700 (=> (not res!282938) (not e!277927))))

(assert (=> b!473700 (= res!282938 (bvslt #b00000000000000000000000000000000 (size!14990 _keys!1025)))))

(declare-fun b!473701 () Bool)

(declare-fun e!277930 () ListLongMap!7763)

(assert (=> b!473701 (= e!277930 (ListLongMap!7764 Nil!8928))))

(declare-fun d!75527 () Bool)

(assert (=> d!75527 e!277931))

(declare-fun res!282937 () Bool)

(assert (=> d!75527 (=> (not res!282937) (not e!277931))))

(assert (=> d!75527 (= res!282937 (not (contains!2549 lt!215399 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75527 (= lt!215399 e!277930)))

(declare-fun c!57086 () Bool)

(assert (=> d!75527 (= c!57086 (bvsge #b00000000000000000000000000000000 (size!14990 _keys!1025)))))

(assert (=> d!75527 (validMask!0 mask!1365)))

(assert (=> d!75527 (= (getCurrentListMapNoExtraKeys!2057 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!215399)))

(declare-fun b!473702 () Bool)

(declare-fun e!277932 () ListLongMap!7763)

(assert (=> b!473702 (= e!277930 e!277932)))

(declare-fun c!57087 () Bool)

(assert (=> b!473702 (= c!57087 (validKeyInArray!0 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!473703 () Bool)

(declare-fun call!30526 () ListLongMap!7763)

(assert (=> b!473703 (= e!277932 call!30526)))

(declare-fun b!473704 () Bool)

(assert (=> b!473704 (= e!277926 e!277928)))

(declare-fun c!57085 () Bool)

(assert (=> b!473704 (= c!57085 (bvslt #b00000000000000000000000000000000 (size!14990 _keys!1025)))))

(declare-fun b!473705 () Bool)

(assert (=> b!473705 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14990 _keys!1025)))))

(assert (=> b!473705 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14991 _values!833)))))

(declare-fun e!277929 () Bool)

(assert (=> b!473705 (= e!277929 (= (apply!332 lt!215399 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000)) (get!7115 (select (arr!14639 _values!833) #b00000000000000000000000000000000) (dynLambda!925 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!473706 () Bool)

(declare-fun lt!215393 () Unit!13950)

(declare-fun lt!215397 () Unit!13950)

(assert (=> b!473706 (= lt!215393 lt!215397)))

(declare-fun lt!215395 () ListLongMap!7763)

(declare-fun lt!215398 () (_ BitVec 64))

(declare-fun lt!215394 () V!18893)

(declare-fun lt!215396 () (_ BitVec 64))

(assert (=> b!473706 (not (contains!2549 (+!1733 lt!215395 (tuple2!8851 lt!215398 lt!215394)) lt!215396))))

(declare-fun addStillNotContains!165 (ListLongMap!7763 (_ BitVec 64) V!18893 (_ BitVec 64)) Unit!13950)

(assert (=> b!473706 (= lt!215397 (addStillNotContains!165 lt!215395 lt!215398 lt!215394 lt!215396))))

(assert (=> b!473706 (= lt!215396 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!473706 (= lt!215394 (get!7115 (select (arr!14639 _values!833) #b00000000000000000000000000000000) (dynLambda!925 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!473706 (= lt!215398 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!473706 (= lt!215395 call!30526)))

(assert (=> b!473706 (= e!277932 (+!1733 call!30526 (tuple2!8851 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000) (get!7115 (select (arr!14639 _values!833) #b00000000000000000000000000000000) (dynLambda!925 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!473707 () Bool)

(assert (=> b!473707 (= e!277928 (= lt!215399 (getCurrentListMapNoExtraKeys!2057 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun bm!30523 () Bool)

(assert (=> bm!30523 (= call!30526 (getCurrentListMapNoExtraKeys!2057 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!473708 () Bool)

(assert (=> b!473708 (= e!277926 e!277929)))

(assert (=> b!473708 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14990 _keys!1025)))))

(declare-fun res!282939 () Bool)

(assert (=> b!473708 (= res!282939 (contains!2549 lt!215399 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!473708 (=> (not res!282939) (not e!277929))))

(assert (= (and d!75527 c!57086) b!473701))

(assert (= (and d!75527 (not c!57086)) b!473702))

(assert (= (and b!473702 c!57087) b!473706))

(assert (= (and b!473702 (not c!57087)) b!473703))

(assert (= (or b!473706 b!473703) bm!30523))

(assert (= (and d!75527 res!282937) b!473698))

(assert (= (and b!473698 res!282940) b!473700))

(assert (= (and b!473700 res!282938) b!473699))

(assert (= (and b!473700 c!57084) b!473708))

(assert (= (and b!473700 (not c!57084)) b!473704))

(assert (= (and b!473708 res!282939) b!473705))

(assert (= (and b!473704 c!57085) b!473707))

(assert (= (and b!473704 (not c!57085)) b!473697))

(declare-fun b_lambda!10209 () Bool)

(assert (=> (not b_lambda!10209) (not b!473705)))

(assert (=> b!473705 t!14905))

(declare-fun b_and!20377 () Bool)

(assert (= b_and!20375 (and (=> t!14905 result!7445) b_and!20377)))

(declare-fun b_lambda!10211 () Bool)

(assert (=> (not b_lambda!10211) (not b!473706)))

(assert (=> b!473706 t!14905))

(declare-fun b_and!20379 () Bool)

(assert (= b_and!20377 (and (=> t!14905 result!7445) b_and!20379)))

(assert (=> b!473705 m!455691))

(assert (=> b!473705 m!455673))

(assert (=> b!473705 m!455673))

(declare-fun m!455835 () Bool)

(assert (=> b!473705 m!455835))

(assert (=> b!473705 m!455689))

(assert (=> b!473705 m!455691))

(assert (=> b!473705 m!455693))

(assert (=> b!473705 m!455689))

(assert (=> b!473702 m!455673))

(assert (=> b!473702 m!455673))

(assert (=> b!473702 m!455679))

(declare-fun m!455837 () Bool)

(assert (=> bm!30523 m!455837))

(assert (=> b!473699 m!455673))

(assert (=> b!473699 m!455673))

(assert (=> b!473699 m!455679))

(assert (=> b!473706 m!455691))

(declare-fun m!455839 () Bool)

(assert (=> b!473706 m!455839))

(assert (=> b!473706 m!455673))

(assert (=> b!473706 m!455839))

(declare-fun m!455841 () Bool)

(assert (=> b!473706 m!455841))

(declare-fun m!455843 () Bool)

(assert (=> b!473706 m!455843))

(assert (=> b!473706 m!455689))

(assert (=> b!473706 m!455691))

(assert (=> b!473706 m!455693))

(assert (=> b!473706 m!455689))

(declare-fun m!455845 () Bool)

(assert (=> b!473706 m!455845))

(declare-fun m!455847 () Bool)

(assert (=> d!75527 m!455847))

(assert (=> d!75527 m!455635))

(declare-fun m!455849 () Bool)

(assert (=> b!473698 m!455849))

(declare-fun m!455851 () Bool)

(assert (=> b!473697 m!455851))

(assert (=> b!473707 m!455837))

(assert (=> b!473708 m!455673))

(assert (=> b!473708 m!455673))

(declare-fun m!455853 () Bool)

(assert (=> b!473708 m!455853))

(assert (=> b!473533 d!75527))

(declare-fun b!473709 () Bool)

(declare-fun e!277935 () Bool)

(declare-fun lt!215406 () ListLongMap!7763)

(assert (=> b!473709 (= e!277935 (isEmpty!579 lt!215406))))

(declare-fun b!473710 () Bool)

(declare-fun res!282944 () Bool)

(declare-fun e!277938 () Bool)

(assert (=> b!473710 (=> (not res!282944) (not e!277938))))

(assert (=> b!473710 (= res!282944 (not (contains!2549 lt!215406 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!473711 () Bool)

(declare-fun e!277934 () Bool)

(assert (=> b!473711 (= e!277934 (validKeyInArray!0 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!473711 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!473712 () Bool)

(declare-fun e!277933 () Bool)

(assert (=> b!473712 (= e!277938 e!277933)))

(declare-fun c!57088 () Bool)

(assert (=> b!473712 (= c!57088 e!277934)))

(declare-fun res!282942 () Bool)

(assert (=> b!473712 (=> (not res!282942) (not e!277934))))

(assert (=> b!473712 (= res!282942 (bvslt #b00000000000000000000000000000000 (size!14990 _keys!1025)))))

(declare-fun b!473713 () Bool)

(declare-fun e!277937 () ListLongMap!7763)

(assert (=> b!473713 (= e!277937 (ListLongMap!7764 Nil!8928))))

(declare-fun d!75529 () Bool)

(assert (=> d!75529 e!277938))

(declare-fun res!282941 () Bool)

(assert (=> d!75529 (=> (not res!282941) (not e!277938))))

(assert (=> d!75529 (= res!282941 (not (contains!2549 lt!215406 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75529 (= lt!215406 e!277937)))

(declare-fun c!57090 () Bool)

(assert (=> d!75529 (= c!57090 (bvsge #b00000000000000000000000000000000 (size!14990 _keys!1025)))))

(assert (=> d!75529 (validMask!0 mask!1365)))

(assert (=> d!75529 (= (getCurrentListMapNoExtraKeys!2057 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!215406)))

(declare-fun b!473714 () Bool)

(declare-fun e!277939 () ListLongMap!7763)

(assert (=> b!473714 (= e!277937 e!277939)))

(declare-fun c!57091 () Bool)

(assert (=> b!473714 (= c!57091 (validKeyInArray!0 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!473715 () Bool)

(declare-fun call!30527 () ListLongMap!7763)

(assert (=> b!473715 (= e!277939 call!30527)))

(declare-fun b!473716 () Bool)

(assert (=> b!473716 (= e!277933 e!277935)))

(declare-fun c!57089 () Bool)

(assert (=> b!473716 (= c!57089 (bvslt #b00000000000000000000000000000000 (size!14990 _keys!1025)))))

(declare-fun b!473717 () Bool)

(assert (=> b!473717 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14990 _keys!1025)))))

(assert (=> b!473717 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14991 _values!833)))))

(declare-fun e!277936 () Bool)

(assert (=> b!473717 (= e!277936 (= (apply!332 lt!215406 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000)) (get!7115 (select (arr!14639 _values!833) #b00000000000000000000000000000000) (dynLambda!925 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!473718 () Bool)

(declare-fun lt!215400 () Unit!13950)

(declare-fun lt!215404 () Unit!13950)

(assert (=> b!473718 (= lt!215400 lt!215404)))

(declare-fun lt!215403 () (_ BitVec 64))

(declare-fun lt!215405 () (_ BitVec 64))

(declare-fun lt!215402 () ListLongMap!7763)

(declare-fun lt!215401 () V!18893)

(assert (=> b!473718 (not (contains!2549 (+!1733 lt!215402 (tuple2!8851 lt!215405 lt!215401)) lt!215403))))

(assert (=> b!473718 (= lt!215404 (addStillNotContains!165 lt!215402 lt!215405 lt!215401 lt!215403))))

(assert (=> b!473718 (= lt!215403 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!473718 (= lt!215401 (get!7115 (select (arr!14639 _values!833) #b00000000000000000000000000000000) (dynLambda!925 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!473718 (= lt!215405 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!473718 (= lt!215402 call!30527)))

(assert (=> b!473718 (= e!277939 (+!1733 call!30527 (tuple2!8851 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000) (get!7115 (select (arr!14639 _values!833) #b00000000000000000000000000000000) (dynLambda!925 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!473719 () Bool)

(assert (=> b!473719 (= e!277935 (= lt!215406 (getCurrentListMapNoExtraKeys!2057 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun bm!30524 () Bool)

(assert (=> bm!30524 (= call!30527 (getCurrentListMapNoExtraKeys!2057 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!473720 () Bool)

(assert (=> b!473720 (= e!277933 e!277936)))

(assert (=> b!473720 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14990 _keys!1025)))))

(declare-fun res!282943 () Bool)

(assert (=> b!473720 (= res!282943 (contains!2549 lt!215406 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!473720 (=> (not res!282943) (not e!277936))))

(assert (= (and d!75529 c!57090) b!473713))

(assert (= (and d!75529 (not c!57090)) b!473714))

(assert (= (and b!473714 c!57091) b!473718))

(assert (= (and b!473714 (not c!57091)) b!473715))

(assert (= (or b!473718 b!473715) bm!30524))

(assert (= (and d!75529 res!282941) b!473710))

(assert (= (and b!473710 res!282944) b!473712))

(assert (= (and b!473712 res!282942) b!473711))

(assert (= (and b!473712 c!57088) b!473720))

(assert (= (and b!473712 (not c!57088)) b!473716))

(assert (= (and b!473720 res!282943) b!473717))

(assert (= (and b!473716 c!57089) b!473719))

(assert (= (and b!473716 (not c!57089)) b!473709))

(declare-fun b_lambda!10213 () Bool)

(assert (=> (not b_lambda!10213) (not b!473717)))

(assert (=> b!473717 t!14905))

(declare-fun b_and!20381 () Bool)

(assert (= b_and!20379 (and (=> t!14905 result!7445) b_and!20381)))

(declare-fun b_lambda!10215 () Bool)

(assert (=> (not b_lambda!10215) (not b!473718)))

(assert (=> b!473718 t!14905))

(declare-fun b_and!20383 () Bool)

(assert (= b_and!20381 (and (=> t!14905 result!7445) b_and!20383)))

(assert (=> b!473717 m!455691))

(assert (=> b!473717 m!455673))

(assert (=> b!473717 m!455673))

(declare-fun m!455855 () Bool)

(assert (=> b!473717 m!455855))

(assert (=> b!473717 m!455689))

(assert (=> b!473717 m!455691))

(assert (=> b!473717 m!455693))

(assert (=> b!473717 m!455689))

(assert (=> b!473714 m!455673))

(assert (=> b!473714 m!455673))

(assert (=> b!473714 m!455679))

(declare-fun m!455857 () Bool)

(assert (=> bm!30524 m!455857))

(assert (=> b!473711 m!455673))

(assert (=> b!473711 m!455673))

(assert (=> b!473711 m!455679))

(assert (=> b!473718 m!455691))

(declare-fun m!455859 () Bool)

(assert (=> b!473718 m!455859))

(assert (=> b!473718 m!455673))

(assert (=> b!473718 m!455859))

(declare-fun m!455861 () Bool)

(assert (=> b!473718 m!455861))

(declare-fun m!455863 () Bool)

(assert (=> b!473718 m!455863))

(assert (=> b!473718 m!455689))

(assert (=> b!473718 m!455691))

(assert (=> b!473718 m!455693))

(assert (=> b!473718 m!455689))

(declare-fun m!455865 () Bool)

(assert (=> b!473718 m!455865))

(declare-fun m!455867 () Bool)

(assert (=> d!75529 m!455867))

(assert (=> d!75529 m!455635))

(declare-fun m!455869 () Bool)

(assert (=> b!473710 m!455869))

(declare-fun m!455871 () Bool)

(assert (=> b!473709 m!455871))

(assert (=> b!473719 m!455857))

(assert (=> b!473720 m!455673))

(assert (=> b!473720 m!455673))

(declare-fun m!455873 () Bool)

(assert (=> b!473720 m!455873))

(assert (=> b!473533 d!75529))

(declare-fun b!473729 () Bool)

(declare-fun e!277947 () Bool)

(declare-fun call!30530 () Bool)

(assert (=> b!473729 (= e!277947 call!30530)))

(declare-fun b!473730 () Bool)

(declare-fun e!277946 () Bool)

(assert (=> b!473730 (= e!277946 call!30530)))

(declare-fun d!75531 () Bool)

(declare-fun res!282949 () Bool)

(declare-fun e!277948 () Bool)

(assert (=> d!75531 (=> res!282949 e!277948)))

(assert (=> d!75531 (= res!282949 (bvsge #b00000000000000000000000000000000 (size!14990 _keys!1025)))))

(assert (=> d!75531 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!277948)))

(declare-fun b!473731 () Bool)

(assert (=> b!473731 (= e!277948 e!277947)))

(declare-fun c!57094 () Bool)

(assert (=> b!473731 (= c!57094 (validKeyInArray!0 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30527 () Bool)

(assert (=> bm!30527 (= call!30530 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!473732 () Bool)

(assert (=> b!473732 (= e!277947 e!277946)))

(declare-fun lt!215413 () (_ BitVec 64))

(assert (=> b!473732 (= lt!215413 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!215415 () Unit!13950)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30437 (_ BitVec 64) (_ BitVec 32)) Unit!13950)

(assert (=> b!473732 (= lt!215415 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!215413 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!473732 (arrayContainsKey!0 _keys!1025 lt!215413 #b00000000000000000000000000000000)))

(declare-fun lt!215414 () Unit!13950)

(assert (=> b!473732 (= lt!215414 lt!215415)))

(declare-fun res!282950 () Bool)

(declare-datatypes ((SeekEntryResult!3556 0))(
  ( (MissingZero!3556 (index!16403 (_ BitVec 32))) (Found!3556 (index!16404 (_ BitVec 32))) (Intermediate!3556 (undefined!4368 Bool) (index!16405 (_ BitVec 32)) (x!44424 (_ BitVec 32))) (Undefined!3556) (MissingVacant!3556 (index!16406 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30437 (_ BitVec 32)) SeekEntryResult!3556)

(assert (=> b!473732 (= res!282950 (= (seekEntryOrOpen!0 (select (arr!14638 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3556 #b00000000000000000000000000000000)))))

(assert (=> b!473732 (=> (not res!282950) (not e!277946))))

(assert (= (and d!75531 (not res!282949)) b!473731))

(assert (= (and b!473731 c!57094) b!473732))

(assert (= (and b!473731 (not c!57094)) b!473729))

(assert (= (and b!473732 res!282950) b!473730))

(assert (= (or b!473730 b!473729) bm!30527))

(assert (=> b!473731 m!455673))

(assert (=> b!473731 m!455673))

(assert (=> b!473731 m!455679))

(declare-fun m!455875 () Bool)

(assert (=> bm!30527 m!455875))

(assert (=> b!473732 m!455673))

(declare-fun m!455877 () Bool)

(assert (=> b!473732 m!455877))

(declare-fun m!455879 () Bool)

(assert (=> b!473732 m!455879))

(assert (=> b!473732 m!455673))

(declare-fun m!455881 () Bool)

(assert (=> b!473732 m!455881))

(assert (=> b!473528 d!75531))

(declare-fun b!473740 () Bool)

(declare-fun e!277953 () Bool)

(assert (=> b!473740 (= e!277953 tp_is_empty!13341)))

(declare-fun mapNonEmpty!21730 () Bool)

(declare-fun mapRes!21730 () Bool)

(declare-fun tp!41782 () Bool)

(declare-fun e!277954 () Bool)

(assert (=> mapNonEmpty!21730 (= mapRes!21730 (and tp!41782 e!277954))))

(declare-fun mapKey!21730 () (_ BitVec 32))

(declare-fun mapRest!21730 () (Array (_ BitVec 32) ValueCell!6327))

(declare-fun mapValue!21730 () ValueCell!6327)

(assert (=> mapNonEmpty!21730 (= mapRest!21724 (store mapRest!21730 mapKey!21730 mapValue!21730))))

(declare-fun mapIsEmpty!21730 () Bool)

(assert (=> mapIsEmpty!21730 mapRes!21730))

(declare-fun condMapEmpty!21730 () Bool)

(declare-fun mapDefault!21730 () ValueCell!6327)

(assert (=> mapNonEmpty!21724 (= condMapEmpty!21730 (= mapRest!21724 ((as const (Array (_ BitVec 32) ValueCell!6327)) mapDefault!21730)))))

(assert (=> mapNonEmpty!21724 (= tp!41772 (and e!277953 mapRes!21730))))

(declare-fun b!473739 () Bool)

(assert (=> b!473739 (= e!277954 tp_is_empty!13341)))

(assert (= (and mapNonEmpty!21724 condMapEmpty!21730) mapIsEmpty!21730))

(assert (= (and mapNonEmpty!21724 (not condMapEmpty!21730)) mapNonEmpty!21730))

(assert (= (and mapNonEmpty!21730 ((_ is ValueCellFull!6327) mapValue!21730)) b!473739))

(assert (= (and mapNonEmpty!21724 ((_ is ValueCellFull!6327) mapDefault!21730)) b!473740))

(declare-fun m!455883 () Bool)

(assert (=> mapNonEmpty!21730 m!455883))

(declare-fun b_lambda!10217 () Bool)

(assert (= b_lambda!10215 (or (and start!42438 b_free!11913) b_lambda!10217)))

(declare-fun b_lambda!10219 () Bool)

(assert (= b_lambda!10213 (or (and start!42438 b_free!11913) b_lambda!10219)))

(declare-fun b_lambda!10221 () Bool)

(assert (= b_lambda!10207 (or (and start!42438 b_free!11913) b_lambda!10221)))

(declare-fun b_lambda!10223 () Bool)

(assert (= b_lambda!10211 (or (and start!42438 b_free!11913) b_lambda!10223)))

(declare-fun b_lambda!10225 () Bool)

(assert (= b_lambda!10205 (or (and start!42438 b_free!11913) b_lambda!10225)))

(declare-fun b_lambda!10227 () Bool)

(assert (= b_lambda!10209 (or (and start!42438 b_free!11913) b_lambda!10227)))

(check-sat (not b!473718) (not b!473653) (not b!473646) (not b!473622) (not b!473624) (not b!473709) (not b!473644) (not b_next!11913) (not bm!30512) (not b!473645) (not b!473732) (not b!473634) (not b!473617) (not d!75517) (not d!75521) (not b_lambda!10219) (not b!473706) (not b_lambda!10225) (not bm!30509) (not bm!30492) (not d!75513) (not b!473672) (not b!473633) (not b_lambda!10217) (not b!473731) (not b!473705) (not b!473649) (not d!75511) b_and!20383 (not b!473667) (not bm!30519) (not b!473720) (not b_lambda!10223) (not d!75519) (not b!473571) (not b_lambda!10227) (not b!473657) (not b!473655) (not b!473648) (not bm!30527) (not b!473699) (not d!75523) (not b!473702) (not b!473666) (not b!473711) (not bm!30523) (not b!473647) (not b_lambda!10221) (not b!473708) (not b!473717) (not d!75529) (not bm!30524) (not bm!30516) (not b!473574) (not b!473714) (not b!473671) (not b!473698) (not b!473635) tp_is_empty!13341 (not b!473697) (not b!473710) (not b!473625) (not b!473650) (not bm!30517) (not b!473719) (not bm!30511) (not b!473570) (not d!75527) (not b!473707) (not d!75515) (not mapNonEmpty!21730) (not b!473668) (not d!75525) (not bm!30510) (not bm!30518) (not b!473620) (not b!473658))
(check-sat b_and!20383 (not b_next!11913))
