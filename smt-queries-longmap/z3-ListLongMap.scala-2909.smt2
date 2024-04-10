; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41598 () Bool)

(assert start!41598)

(declare-fun b_free!11265 () Bool)

(declare-fun b_next!11265 () Bool)

(assert (=> start!41598 (= b_free!11265 (not b_next!11265))))

(declare-fun tp!39792 () Bool)

(declare-fun b_and!19605 () Bool)

(assert (=> start!41598 (= tp!39792 b_and!19605)))

(declare-fun res!277782 () Bool)

(declare-fun e!271434 () Bool)

(assert (=> start!41598 (=> (not res!277782) (not e!271434))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41598 (= res!277782 (validMask!0 mask!1365))))

(assert (=> start!41598 e!271434))

(declare-fun tp_is_empty!12693 () Bool)

(assert (=> start!41598 tp_is_empty!12693))

(assert (=> start!41598 tp!39792))

(assert (=> start!41598 true))

(declare-datatypes ((array!29171 0))(
  ( (array!29172 (arr!14017 (Array (_ BitVec 32) (_ BitVec 64))) (size!14369 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29171)

(declare-fun array_inv!10122 (array!29171) Bool)

(assert (=> start!41598 (array_inv!10122 _keys!1025)))

(declare-datatypes ((V!18029 0))(
  ( (V!18030 (val!6391 Int)) )
))
(declare-datatypes ((ValueCell!6003 0))(
  ( (ValueCellFull!6003 (v!8678 V!18029)) (EmptyCell!6003) )
))
(declare-datatypes ((array!29173 0))(
  ( (array!29174 (arr!14018 (Array (_ BitVec 32) ValueCell!6003)) (size!14370 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29173)

(declare-fun e!271433 () Bool)

(declare-fun array_inv!10123 (array!29173) Bool)

(assert (=> start!41598 (and (array_inv!10123 _values!833) e!271433)))

(declare-fun b!464629 () Bool)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!464629 (= e!271434 (not (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!14369 _keys!1025)))))))

(declare-datatypes ((tuple2!8370 0))(
  ( (tuple2!8371 (_1!4196 (_ BitVec 64)) (_2!4196 V!18029)) )
))
(declare-datatypes ((List!8464 0))(
  ( (Nil!8461) (Cons!8460 (h!9316 tuple2!8370) (t!14410 List!8464)) )
))
(declare-datatypes ((ListLongMap!7283 0))(
  ( (ListLongMap!7284 (toList!3657 List!8464)) )
))
(declare-fun lt!209797 () ListLongMap!7283)

(declare-fun lt!209796 () ListLongMap!7283)

(assert (=> b!464629 (= lt!209797 lt!209796)))

(declare-fun minValueBefore!38 () V!18029)

(declare-fun zeroValue!794 () V!18029)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13482 0))(
  ( (Unit!13483) )
))
(declare-fun lt!209798 () Unit!13482)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18029)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!17 (array!29171 array!29173 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18029 V!18029 V!18029 V!18029 (_ BitVec 32) Int) Unit!13482)

(assert (=> b!464629 (= lt!209798 (lemmaNoChangeToArrayThenSameMapNoExtras!17 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1837 (array!29171 array!29173 (_ BitVec 32) (_ BitVec 32) V!18029 V!18029 (_ BitVec 32) Int) ListLongMap!7283)

(assert (=> b!464629 (= lt!209796 (getCurrentListMapNoExtraKeys!1837 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464629 (= lt!209797 (getCurrentListMapNoExtraKeys!1837 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464630 () Bool)

(declare-fun e!271435 () Bool)

(assert (=> b!464630 (= e!271435 tp_is_empty!12693)))

(declare-fun b!464631 () Bool)

(declare-fun res!277781 () Bool)

(assert (=> b!464631 (=> (not res!277781) (not e!271434))))

(declare-datatypes ((List!8465 0))(
  ( (Nil!8462) (Cons!8461 (h!9317 (_ BitVec 64)) (t!14411 List!8465)) )
))
(declare-fun arrayNoDuplicates!0 (array!29171 (_ BitVec 32) List!8465) Bool)

(assert (=> b!464631 (= res!277781 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8462))))

(declare-fun mapNonEmpty!20716 () Bool)

(declare-fun mapRes!20716 () Bool)

(declare-fun tp!39793 () Bool)

(declare-fun e!271437 () Bool)

(assert (=> mapNonEmpty!20716 (= mapRes!20716 (and tp!39793 e!271437))))

(declare-fun mapKey!20716 () (_ BitVec 32))

(declare-fun mapValue!20716 () ValueCell!6003)

(declare-fun mapRest!20716 () (Array (_ BitVec 32) ValueCell!6003))

(assert (=> mapNonEmpty!20716 (= (arr!14018 _values!833) (store mapRest!20716 mapKey!20716 mapValue!20716))))

(declare-fun b!464632 () Bool)

(assert (=> b!464632 (= e!271437 tp_is_empty!12693)))

(declare-fun mapIsEmpty!20716 () Bool)

(assert (=> mapIsEmpty!20716 mapRes!20716))

(declare-fun b!464633 () Bool)

(assert (=> b!464633 (= e!271433 (and e!271435 mapRes!20716))))

(declare-fun condMapEmpty!20716 () Bool)

(declare-fun mapDefault!20716 () ValueCell!6003)

(assert (=> b!464633 (= condMapEmpty!20716 (= (arr!14018 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6003)) mapDefault!20716)))))

(declare-fun b!464634 () Bool)

(declare-fun res!277784 () Bool)

(assert (=> b!464634 (=> (not res!277784) (not e!271434))))

(assert (=> b!464634 (= res!277784 (and (= (size!14370 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14369 _keys!1025) (size!14370 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464635 () Bool)

(declare-fun res!277783 () Bool)

(assert (=> b!464635 (=> (not res!277783) (not e!271434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29171 (_ BitVec 32)) Bool)

(assert (=> b!464635 (= res!277783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!41598 res!277782) b!464634))

(assert (= (and b!464634 res!277784) b!464635))

(assert (= (and b!464635 res!277783) b!464631))

(assert (= (and b!464631 res!277781) b!464629))

(assert (= (and b!464633 condMapEmpty!20716) mapIsEmpty!20716))

(assert (= (and b!464633 (not condMapEmpty!20716)) mapNonEmpty!20716))

(get-info :version)

(assert (= (and mapNonEmpty!20716 ((_ is ValueCellFull!6003) mapValue!20716)) b!464632))

(assert (= (and b!464633 ((_ is ValueCellFull!6003) mapDefault!20716)) b!464630))

(assert (= start!41598 b!464633))

(declare-fun m!446987 () Bool)

(assert (=> mapNonEmpty!20716 m!446987))

(declare-fun m!446989 () Bool)

(assert (=> b!464631 m!446989))

(declare-fun m!446991 () Bool)

(assert (=> start!41598 m!446991))

(declare-fun m!446993 () Bool)

(assert (=> start!41598 m!446993))

(declare-fun m!446995 () Bool)

(assert (=> start!41598 m!446995))

(declare-fun m!446997 () Bool)

(assert (=> b!464629 m!446997))

(declare-fun m!446999 () Bool)

(assert (=> b!464629 m!446999))

(declare-fun m!447001 () Bool)

(assert (=> b!464629 m!447001))

(declare-fun m!447003 () Bool)

(assert (=> b!464635 m!447003))

(check-sat (not start!41598) tp_is_empty!12693 (not mapNonEmpty!20716) (not b!464635) (not b!464629) (not b!464631) b_and!19605 (not b_next!11265))
(check-sat b_and!19605 (not b_next!11265))
(get-model)

(declare-fun d!75055 () Bool)

(assert (=> d!75055 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41598 d!75055))

(declare-fun d!75057 () Bool)

(assert (=> d!75057 (= (array_inv!10122 _keys!1025) (bvsge (size!14369 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41598 d!75057))

(declare-fun d!75059 () Bool)

(assert (=> d!75059 (= (array_inv!10123 _values!833) (bvsge (size!14370 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41598 d!75059))

(declare-fun b!464665 () Bool)

(declare-fun e!271460 () Bool)

(declare-fun call!30221 () Bool)

(assert (=> b!464665 (= e!271460 call!30221)))

(declare-fun b!464666 () Bool)

(declare-fun e!271461 () Bool)

(assert (=> b!464666 (= e!271461 e!271460)))

(declare-fun c!56655 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!464666 (= c!56655 (validKeyInArray!0 (select (arr!14017 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!464667 () Bool)

(declare-fun e!271459 () Bool)

(assert (=> b!464667 (= e!271460 e!271459)))

(declare-fun lt!209816 () (_ BitVec 64))

(assert (=> b!464667 (= lt!209816 (select (arr!14017 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!209814 () Unit!13482)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29171 (_ BitVec 64) (_ BitVec 32)) Unit!13482)

(assert (=> b!464667 (= lt!209814 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!209816 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!464667 (arrayContainsKey!0 _keys!1025 lt!209816 #b00000000000000000000000000000000)))

(declare-fun lt!209815 () Unit!13482)

(assert (=> b!464667 (= lt!209815 lt!209814)))

(declare-fun res!277802 () Bool)

(declare-datatypes ((SeekEntryResult!3544 0))(
  ( (MissingZero!3544 (index!16355 (_ BitVec 32))) (Found!3544 (index!16356 (_ BitVec 32))) (Intermediate!3544 (undefined!4356 Bool) (index!16357 (_ BitVec 32)) (x!43416 (_ BitVec 32))) (Undefined!3544) (MissingVacant!3544 (index!16358 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29171 (_ BitVec 32)) SeekEntryResult!3544)

(assert (=> b!464667 (= res!277802 (= (seekEntryOrOpen!0 (select (arr!14017 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3544 #b00000000000000000000000000000000)))))

(assert (=> b!464667 (=> (not res!277802) (not e!271459))))

(declare-fun bm!30218 () Bool)

(assert (=> bm!30218 (= call!30221 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun d!75061 () Bool)

(declare-fun res!277801 () Bool)

(assert (=> d!75061 (=> res!277801 e!271461)))

(assert (=> d!75061 (= res!277801 (bvsge #b00000000000000000000000000000000 (size!14369 _keys!1025)))))

(assert (=> d!75061 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!271461)))

(declare-fun b!464668 () Bool)

(assert (=> b!464668 (= e!271459 call!30221)))

(assert (= (and d!75061 (not res!277801)) b!464666))

(assert (= (and b!464666 c!56655) b!464667))

(assert (= (and b!464666 (not c!56655)) b!464665))

(assert (= (and b!464667 res!277802) b!464668))

(assert (= (or b!464668 b!464665) bm!30218))

(declare-fun m!447023 () Bool)

(assert (=> b!464666 m!447023))

(assert (=> b!464666 m!447023))

(declare-fun m!447025 () Bool)

(assert (=> b!464666 m!447025))

(assert (=> b!464667 m!447023))

(declare-fun m!447027 () Bool)

(assert (=> b!464667 m!447027))

(declare-fun m!447029 () Bool)

(assert (=> b!464667 m!447029))

(assert (=> b!464667 m!447023))

(declare-fun m!447031 () Bool)

(assert (=> b!464667 m!447031))

(declare-fun m!447033 () Bool)

(assert (=> bm!30218 m!447033))

(assert (=> b!464635 d!75061))

(declare-fun b!464679 () Bool)

(declare-fun e!271471 () Bool)

(declare-fun call!30224 () Bool)

(assert (=> b!464679 (= e!271471 call!30224)))

(declare-fun b!464680 () Bool)

(declare-fun e!271470 () Bool)

(assert (=> b!464680 (= e!271470 e!271471)))

(declare-fun c!56658 () Bool)

(assert (=> b!464680 (= c!56658 (validKeyInArray!0 (select (arr!14017 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!464681 () Bool)

(declare-fun e!271473 () Bool)

(assert (=> b!464681 (= e!271473 e!271470)))

(declare-fun res!277810 () Bool)

(assert (=> b!464681 (=> (not res!277810) (not e!271470))))

(declare-fun e!271472 () Bool)

(assert (=> b!464681 (= res!277810 (not e!271472))))

(declare-fun res!277809 () Bool)

(assert (=> b!464681 (=> (not res!277809) (not e!271472))))

(assert (=> b!464681 (= res!277809 (validKeyInArray!0 (select (arr!14017 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30221 () Bool)

(assert (=> bm!30221 (= call!30224 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56658 (Cons!8461 (select (arr!14017 _keys!1025) #b00000000000000000000000000000000) Nil!8462) Nil!8462)))))

(declare-fun d!75063 () Bool)

(declare-fun res!277811 () Bool)

(assert (=> d!75063 (=> res!277811 e!271473)))

(assert (=> d!75063 (= res!277811 (bvsge #b00000000000000000000000000000000 (size!14369 _keys!1025)))))

(assert (=> d!75063 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8462) e!271473)))

(declare-fun b!464682 () Bool)

(declare-fun contains!2520 (List!8465 (_ BitVec 64)) Bool)

(assert (=> b!464682 (= e!271472 (contains!2520 Nil!8462 (select (arr!14017 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!464683 () Bool)

(assert (=> b!464683 (= e!271471 call!30224)))

(assert (= (and d!75063 (not res!277811)) b!464681))

(assert (= (and b!464681 res!277809) b!464682))

(assert (= (and b!464681 res!277810) b!464680))

(assert (= (and b!464680 c!56658) b!464679))

(assert (= (and b!464680 (not c!56658)) b!464683))

(assert (= (or b!464679 b!464683) bm!30221))

(assert (=> b!464680 m!447023))

(assert (=> b!464680 m!447023))

(assert (=> b!464680 m!447025))

(assert (=> b!464681 m!447023))

(assert (=> b!464681 m!447023))

(assert (=> b!464681 m!447025))

(assert (=> bm!30221 m!447023))

(declare-fun m!447035 () Bool)

(assert (=> bm!30221 m!447035))

(assert (=> b!464682 m!447023))

(assert (=> b!464682 m!447023))

(declare-fun m!447037 () Bool)

(assert (=> b!464682 m!447037))

(assert (=> b!464631 d!75063))

(declare-fun d!75065 () Bool)

(assert (=> d!75065 (= (getCurrentListMapNoExtraKeys!1837 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1837 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!209819 () Unit!13482)

(declare-fun choose!1337 (array!29171 array!29173 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18029 V!18029 V!18029 V!18029 (_ BitVec 32) Int) Unit!13482)

(assert (=> d!75065 (= lt!209819 (choose!1337 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75065 (validMask!0 mask!1365)))

(assert (=> d!75065 (= (lemmaNoChangeToArrayThenSameMapNoExtras!17 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!209819)))

(declare-fun bs!14694 () Bool)

(assert (= bs!14694 d!75065))

(assert (=> bs!14694 m!447001))

(assert (=> bs!14694 m!446999))

(declare-fun m!447039 () Bool)

(assert (=> bs!14694 m!447039))

(assert (=> bs!14694 m!446991))

(assert (=> b!464629 d!75065))

(declare-fun b!464708 () Bool)

(declare-fun lt!209834 () Unit!13482)

(declare-fun lt!209837 () Unit!13482)

(assert (=> b!464708 (= lt!209834 lt!209837)))

(declare-fun lt!209835 () V!18029)

(declare-fun lt!209839 () (_ BitVec 64))

(declare-fun lt!209838 () (_ BitVec 64))

(declare-fun lt!209840 () ListLongMap!7283)

(declare-fun contains!2521 (ListLongMap!7283 (_ BitVec 64)) Bool)

(declare-fun +!1637 (ListLongMap!7283 tuple2!8370) ListLongMap!7283)

(assert (=> b!464708 (not (contains!2521 (+!1637 lt!209840 (tuple2!8371 lt!209839 lt!209835)) lt!209838))))

(declare-fun addStillNotContains!153 (ListLongMap!7283 (_ BitVec 64) V!18029 (_ BitVec 64)) Unit!13482)

(assert (=> b!464708 (= lt!209837 (addStillNotContains!153 lt!209840 lt!209839 lt!209835 lt!209838))))

(assert (=> b!464708 (= lt!209838 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!6887 (ValueCell!6003 V!18029) V!18029)

(declare-fun dynLambda!913 (Int (_ BitVec 64)) V!18029)

(assert (=> b!464708 (= lt!209835 (get!6887 (select (arr!14018 _values!833) #b00000000000000000000000000000000) (dynLambda!913 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!464708 (= lt!209839 (select (arr!14017 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30227 () ListLongMap!7283)

(assert (=> b!464708 (= lt!209840 call!30227)))

(declare-fun e!271493 () ListLongMap!7283)

(assert (=> b!464708 (= e!271493 (+!1637 call!30227 (tuple2!8371 (select (arr!14017 _keys!1025) #b00000000000000000000000000000000) (get!6887 (select (arr!14018 _values!833) #b00000000000000000000000000000000) (dynLambda!913 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!464709 () Bool)

(assert (=> b!464709 (= e!271493 call!30227)))

(declare-fun b!464710 () Bool)

(declare-fun e!271492 () Bool)

(declare-fun e!271491 () Bool)

(assert (=> b!464710 (= e!271492 e!271491)))

(declare-fun c!56668 () Bool)

(assert (=> b!464710 (= c!56668 (bvslt #b00000000000000000000000000000000 (size!14369 _keys!1025)))))

(declare-fun b!464711 () Bool)

(declare-fun e!271489 () Bool)

(assert (=> b!464711 (= e!271492 e!271489)))

(assert (=> b!464711 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14369 _keys!1025)))))

(declare-fun res!277822 () Bool)

(declare-fun lt!209836 () ListLongMap!7283)

(assert (=> b!464711 (= res!277822 (contains!2521 lt!209836 (select (arr!14017 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!464711 (=> (not res!277822) (not e!271489))))

(declare-fun bm!30224 () Bool)

(assert (=> bm!30224 (= call!30227 (getCurrentListMapNoExtraKeys!1837 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!464712 () Bool)

(declare-fun e!271488 () ListLongMap!7283)

(assert (=> b!464712 (= e!271488 e!271493)))

(declare-fun c!56670 () Bool)

(assert (=> b!464712 (= c!56670 (validKeyInArray!0 (select (arr!14017 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!464713 () Bool)

(declare-fun isEmpty!567 (ListLongMap!7283) Bool)

(assert (=> b!464713 (= e!271491 (isEmpty!567 lt!209836))))

(declare-fun d!75067 () Bool)

(declare-fun e!271490 () Bool)

(assert (=> d!75067 e!271490))

(declare-fun res!277821 () Bool)

(assert (=> d!75067 (=> (not res!277821) (not e!271490))))

(assert (=> d!75067 (= res!277821 (not (contains!2521 lt!209836 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75067 (= lt!209836 e!271488)))

(declare-fun c!56669 () Bool)

(assert (=> d!75067 (= c!56669 (bvsge #b00000000000000000000000000000000 (size!14369 _keys!1025)))))

(assert (=> d!75067 (validMask!0 mask!1365)))

(assert (=> d!75067 (= (getCurrentListMapNoExtraKeys!1837 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!209836)))

(declare-fun b!464714 () Bool)

(declare-fun e!271494 () Bool)

(assert (=> b!464714 (= e!271494 (validKeyInArray!0 (select (arr!14017 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!464714 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!464715 () Bool)

(assert (=> b!464715 (= e!271488 (ListLongMap!7284 Nil!8461))))

(declare-fun b!464716 () Bool)

(assert (=> b!464716 (= e!271490 e!271492)))

(declare-fun c!56667 () Bool)

(assert (=> b!464716 (= c!56667 e!271494)))

(declare-fun res!277820 () Bool)

(assert (=> b!464716 (=> (not res!277820) (not e!271494))))

(assert (=> b!464716 (= res!277820 (bvslt #b00000000000000000000000000000000 (size!14369 _keys!1025)))))

(declare-fun b!464717 () Bool)

(declare-fun res!277823 () Bool)

(assert (=> b!464717 (=> (not res!277823) (not e!271490))))

(assert (=> b!464717 (= res!277823 (not (contains!2521 lt!209836 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!464718 () Bool)

(assert (=> b!464718 (= e!271491 (= lt!209836 (getCurrentListMapNoExtraKeys!1837 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!464719 () Bool)

(assert (=> b!464719 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14369 _keys!1025)))))

(assert (=> b!464719 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14370 _values!833)))))

(declare-fun apply!320 (ListLongMap!7283 (_ BitVec 64)) V!18029)

(assert (=> b!464719 (= e!271489 (= (apply!320 lt!209836 (select (arr!14017 _keys!1025) #b00000000000000000000000000000000)) (get!6887 (select (arr!14018 _values!833) #b00000000000000000000000000000000) (dynLambda!913 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!75067 c!56669) b!464715))

(assert (= (and d!75067 (not c!56669)) b!464712))

(assert (= (and b!464712 c!56670) b!464708))

(assert (= (and b!464712 (not c!56670)) b!464709))

(assert (= (or b!464708 b!464709) bm!30224))

(assert (= (and d!75067 res!277821) b!464717))

(assert (= (and b!464717 res!277823) b!464716))

(assert (= (and b!464716 res!277820) b!464714))

(assert (= (and b!464716 c!56667) b!464711))

(assert (= (and b!464716 (not c!56667)) b!464710))

(assert (= (and b!464711 res!277822) b!464719))

(assert (= (and b!464710 c!56668) b!464718))

(assert (= (and b!464710 (not c!56668)) b!464713))

(declare-fun b_lambda!9973 () Bool)

(assert (=> (not b_lambda!9973) (not b!464708)))

(declare-fun t!14414 () Bool)

(declare-fun tb!3905 () Bool)

(assert (=> (and start!41598 (= defaultEntry!841 defaultEntry!841) t!14414) tb!3905))

(declare-fun result!7373 () Bool)

(assert (=> tb!3905 (= result!7373 tp_is_empty!12693)))

(assert (=> b!464708 t!14414))

(declare-fun b_and!19609 () Bool)

(assert (= b_and!19605 (and (=> t!14414 result!7373) b_and!19609)))

(declare-fun b_lambda!9975 () Bool)

(assert (=> (not b_lambda!9975) (not b!464719)))

(assert (=> b!464719 t!14414))

(declare-fun b_and!19611 () Bool)

(assert (= b_and!19609 (and (=> t!14414 result!7373) b_and!19611)))

(declare-fun m!447041 () Bool)

(assert (=> b!464719 m!447041))

(declare-fun m!447043 () Bool)

(assert (=> b!464719 m!447043))

(declare-fun m!447045 () Bool)

(assert (=> b!464719 m!447045))

(assert (=> b!464719 m!447023))

(assert (=> b!464719 m!447043))

(assert (=> b!464719 m!447023))

(declare-fun m!447047 () Bool)

(assert (=> b!464719 m!447047))

(assert (=> b!464719 m!447041))

(declare-fun m!447049 () Bool)

(assert (=> b!464717 m!447049))

(declare-fun m!447051 () Bool)

(assert (=> b!464713 m!447051))

(declare-fun m!447053 () Bool)

(assert (=> d!75067 m!447053))

(assert (=> d!75067 m!446991))

(declare-fun m!447055 () Bool)

(assert (=> b!464718 m!447055))

(assert (=> b!464708 m!447041))

(assert (=> b!464708 m!447043))

(assert (=> b!464708 m!447045))

(declare-fun m!447057 () Bool)

(assert (=> b!464708 m!447057))

(declare-fun m!447059 () Bool)

(assert (=> b!464708 m!447059))

(declare-fun m!447061 () Bool)

(assert (=> b!464708 m!447061))

(assert (=> b!464708 m!447023))

(assert (=> b!464708 m!447043))

(assert (=> b!464708 m!447057))

(declare-fun m!447063 () Bool)

(assert (=> b!464708 m!447063))

(assert (=> b!464708 m!447041))

(assert (=> b!464711 m!447023))

(assert (=> b!464711 m!447023))

(declare-fun m!447065 () Bool)

(assert (=> b!464711 m!447065))

(assert (=> b!464712 m!447023))

(assert (=> b!464712 m!447023))

(assert (=> b!464712 m!447025))

(assert (=> b!464714 m!447023))

(assert (=> b!464714 m!447023))

(assert (=> b!464714 m!447025))

(assert (=> bm!30224 m!447055))

(assert (=> b!464629 d!75067))

(declare-fun b!464722 () Bool)

(declare-fun lt!209841 () Unit!13482)

(declare-fun lt!209844 () Unit!13482)

(assert (=> b!464722 (= lt!209841 lt!209844)))

(declare-fun lt!209845 () (_ BitVec 64))

(declare-fun lt!209846 () (_ BitVec 64))

(declare-fun lt!209842 () V!18029)

(declare-fun lt!209847 () ListLongMap!7283)

(assert (=> b!464722 (not (contains!2521 (+!1637 lt!209847 (tuple2!8371 lt!209846 lt!209842)) lt!209845))))

(assert (=> b!464722 (= lt!209844 (addStillNotContains!153 lt!209847 lt!209846 lt!209842 lt!209845))))

(assert (=> b!464722 (= lt!209845 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!464722 (= lt!209842 (get!6887 (select (arr!14018 _values!833) #b00000000000000000000000000000000) (dynLambda!913 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!464722 (= lt!209846 (select (arr!14017 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30228 () ListLongMap!7283)

(assert (=> b!464722 (= lt!209847 call!30228)))

(declare-fun e!271500 () ListLongMap!7283)

(assert (=> b!464722 (= e!271500 (+!1637 call!30228 (tuple2!8371 (select (arr!14017 _keys!1025) #b00000000000000000000000000000000) (get!6887 (select (arr!14018 _values!833) #b00000000000000000000000000000000) (dynLambda!913 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!464723 () Bool)

(assert (=> b!464723 (= e!271500 call!30228)))

(declare-fun b!464724 () Bool)

(declare-fun e!271499 () Bool)

(declare-fun e!271498 () Bool)

(assert (=> b!464724 (= e!271499 e!271498)))

(declare-fun c!56672 () Bool)

(assert (=> b!464724 (= c!56672 (bvslt #b00000000000000000000000000000000 (size!14369 _keys!1025)))))

(declare-fun b!464725 () Bool)

(declare-fun e!271496 () Bool)

(assert (=> b!464725 (= e!271499 e!271496)))

(assert (=> b!464725 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14369 _keys!1025)))))

(declare-fun res!277826 () Bool)

(declare-fun lt!209843 () ListLongMap!7283)

(assert (=> b!464725 (= res!277826 (contains!2521 lt!209843 (select (arr!14017 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!464725 (=> (not res!277826) (not e!271496))))

(declare-fun bm!30225 () Bool)

(assert (=> bm!30225 (= call!30228 (getCurrentListMapNoExtraKeys!1837 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!464726 () Bool)

(declare-fun e!271495 () ListLongMap!7283)

(assert (=> b!464726 (= e!271495 e!271500)))

(declare-fun c!56674 () Bool)

(assert (=> b!464726 (= c!56674 (validKeyInArray!0 (select (arr!14017 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!464727 () Bool)

(assert (=> b!464727 (= e!271498 (isEmpty!567 lt!209843))))

(declare-fun d!75069 () Bool)

(declare-fun e!271497 () Bool)

(assert (=> d!75069 e!271497))

(declare-fun res!277825 () Bool)

(assert (=> d!75069 (=> (not res!277825) (not e!271497))))

(assert (=> d!75069 (= res!277825 (not (contains!2521 lt!209843 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75069 (= lt!209843 e!271495)))

(declare-fun c!56673 () Bool)

(assert (=> d!75069 (= c!56673 (bvsge #b00000000000000000000000000000000 (size!14369 _keys!1025)))))

(assert (=> d!75069 (validMask!0 mask!1365)))

(assert (=> d!75069 (= (getCurrentListMapNoExtraKeys!1837 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!209843)))

(declare-fun b!464728 () Bool)

(declare-fun e!271501 () Bool)

(assert (=> b!464728 (= e!271501 (validKeyInArray!0 (select (arr!14017 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!464728 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!464729 () Bool)

(assert (=> b!464729 (= e!271495 (ListLongMap!7284 Nil!8461))))

(declare-fun b!464730 () Bool)

(assert (=> b!464730 (= e!271497 e!271499)))

(declare-fun c!56671 () Bool)

(assert (=> b!464730 (= c!56671 e!271501)))

(declare-fun res!277824 () Bool)

(assert (=> b!464730 (=> (not res!277824) (not e!271501))))

(assert (=> b!464730 (= res!277824 (bvslt #b00000000000000000000000000000000 (size!14369 _keys!1025)))))

(declare-fun b!464731 () Bool)

(declare-fun res!277827 () Bool)

(assert (=> b!464731 (=> (not res!277827) (not e!271497))))

(assert (=> b!464731 (= res!277827 (not (contains!2521 lt!209843 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!464732 () Bool)

(assert (=> b!464732 (= e!271498 (= lt!209843 (getCurrentListMapNoExtraKeys!1837 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!464733 () Bool)

(assert (=> b!464733 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14369 _keys!1025)))))

(assert (=> b!464733 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14370 _values!833)))))

(assert (=> b!464733 (= e!271496 (= (apply!320 lt!209843 (select (arr!14017 _keys!1025) #b00000000000000000000000000000000)) (get!6887 (select (arr!14018 _values!833) #b00000000000000000000000000000000) (dynLambda!913 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!75069 c!56673) b!464729))

(assert (= (and d!75069 (not c!56673)) b!464726))

(assert (= (and b!464726 c!56674) b!464722))

(assert (= (and b!464726 (not c!56674)) b!464723))

(assert (= (or b!464722 b!464723) bm!30225))

(assert (= (and d!75069 res!277825) b!464731))

(assert (= (and b!464731 res!277827) b!464730))

(assert (= (and b!464730 res!277824) b!464728))

(assert (= (and b!464730 c!56671) b!464725))

(assert (= (and b!464730 (not c!56671)) b!464724))

(assert (= (and b!464725 res!277826) b!464733))

(assert (= (and b!464724 c!56672) b!464732))

(assert (= (and b!464724 (not c!56672)) b!464727))

(declare-fun b_lambda!9977 () Bool)

(assert (=> (not b_lambda!9977) (not b!464722)))

(assert (=> b!464722 t!14414))

(declare-fun b_and!19613 () Bool)

(assert (= b_and!19611 (and (=> t!14414 result!7373) b_and!19613)))

(declare-fun b_lambda!9979 () Bool)

(assert (=> (not b_lambda!9979) (not b!464733)))

(assert (=> b!464733 t!14414))

(declare-fun b_and!19615 () Bool)

(assert (= b_and!19613 (and (=> t!14414 result!7373) b_and!19615)))

(assert (=> b!464733 m!447041))

(assert (=> b!464733 m!447043))

(assert (=> b!464733 m!447045))

(assert (=> b!464733 m!447023))

(assert (=> b!464733 m!447043))

(assert (=> b!464733 m!447023))

(declare-fun m!447067 () Bool)

(assert (=> b!464733 m!447067))

(assert (=> b!464733 m!447041))

(declare-fun m!447069 () Bool)

(assert (=> b!464731 m!447069))

(declare-fun m!447071 () Bool)

(assert (=> b!464727 m!447071))

(declare-fun m!447073 () Bool)

(assert (=> d!75069 m!447073))

(assert (=> d!75069 m!446991))

(declare-fun m!447075 () Bool)

(assert (=> b!464732 m!447075))

(assert (=> b!464722 m!447041))

(assert (=> b!464722 m!447043))

(assert (=> b!464722 m!447045))

(declare-fun m!447077 () Bool)

(assert (=> b!464722 m!447077))

(declare-fun m!447079 () Bool)

(assert (=> b!464722 m!447079))

(declare-fun m!447081 () Bool)

(assert (=> b!464722 m!447081))

(assert (=> b!464722 m!447023))

(assert (=> b!464722 m!447043))

(assert (=> b!464722 m!447077))

(declare-fun m!447083 () Bool)

(assert (=> b!464722 m!447083))

(assert (=> b!464722 m!447041))

(assert (=> b!464725 m!447023))

(assert (=> b!464725 m!447023))

(declare-fun m!447085 () Bool)

(assert (=> b!464725 m!447085))

(assert (=> b!464726 m!447023))

(assert (=> b!464726 m!447023))

(assert (=> b!464726 m!447025))

(assert (=> b!464728 m!447023))

(assert (=> b!464728 m!447023))

(assert (=> b!464728 m!447025))

(assert (=> bm!30225 m!447075))

(assert (=> b!464629 d!75069))

(declare-fun condMapEmpty!20722 () Bool)

(declare-fun mapDefault!20722 () ValueCell!6003)

(assert (=> mapNonEmpty!20716 (= condMapEmpty!20722 (= mapRest!20716 ((as const (Array (_ BitVec 32) ValueCell!6003)) mapDefault!20722)))))

(declare-fun e!271506 () Bool)

(declare-fun mapRes!20722 () Bool)

(assert (=> mapNonEmpty!20716 (= tp!39793 (and e!271506 mapRes!20722))))

(declare-fun b!464740 () Bool)

(declare-fun e!271507 () Bool)

(assert (=> b!464740 (= e!271507 tp_is_empty!12693)))

(declare-fun b!464741 () Bool)

(assert (=> b!464741 (= e!271506 tp_is_empty!12693)))

(declare-fun mapNonEmpty!20722 () Bool)

(declare-fun tp!39802 () Bool)

(assert (=> mapNonEmpty!20722 (= mapRes!20722 (and tp!39802 e!271507))))

(declare-fun mapKey!20722 () (_ BitVec 32))

(declare-fun mapRest!20722 () (Array (_ BitVec 32) ValueCell!6003))

(declare-fun mapValue!20722 () ValueCell!6003)

(assert (=> mapNonEmpty!20722 (= mapRest!20716 (store mapRest!20722 mapKey!20722 mapValue!20722))))

(declare-fun mapIsEmpty!20722 () Bool)

(assert (=> mapIsEmpty!20722 mapRes!20722))

(assert (= (and mapNonEmpty!20716 condMapEmpty!20722) mapIsEmpty!20722))

(assert (= (and mapNonEmpty!20716 (not condMapEmpty!20722)) mapNonEmpty!20722))

(assert (= (and mapNonEmpty!20722 ((_ is ValueCellFull!6003) mapValue!20722)) b!464740))

(assert (= (and mapNonEmpty!20716 ((_ is ValueCellFull!6003) mapDefault!20722)) b!464741))

(declare-fun m!447087 () Bool)

(assert (=> mapNonEmpty!20722 m!447087))

(declare-fun b_lambda!9981 () Bool)

(assert (= b_lambda!9975 (or (and start!41598 b_free!11265) b_lambda!9981)))

(declare-fun b_lambda!9983 () Bool)

(assert (= b_lambda!9977 (or (and start!41598 b_free!11265) b_lambda!9983)))

(declare-fun b_lambda!9985 () Bool)

(assert (= b_lambda!9973 (or (and start!41598 b_free!11265) b_lambda!9985)))

(declare-fun b_lambda!9987 () Bool)

(assert (= b_lambda!9979 (or (and start!41598 b_free!11265) b_lambda!9987)))

(check-sat (not bm!30225) (not b_lambda!9983) (not b_next!11265) (not b!464714) (not bm!30224) (not d!75067) (not b!464708) (not b!464718) (not b!464680) (not b!464731) (not b!464713) (not d!75065) (not mapNonEmpty!20722) (not b!464725) (not b_lambda!9985) (not bm!30218) (not b!464666) (not b_lambda!9987) (not b!464733) tp_is_empty!12693 (not b_lambda!9981) (not bm!30221) (not b!464717) (not b!464681) (not b!464712) (not b!464667) (not b!464726) (not b!464722) (not d!75069) b_and!19615 (not b!464682) (not b!464711) (not b!464727) (not b!464732) (not b!464728) (not b!464719))
(check-sat b_and!19615 (not b_next!11265))
