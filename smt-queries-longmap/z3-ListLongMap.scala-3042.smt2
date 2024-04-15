; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42662 () Bool)

(assert start!42662)

(declare-fun b_free!12061 () Bool)

(declare-fun b_next!12061 () Bool)

(assert (=> start!42662 (= b_free!12061 (not b_next!12061))))

(declare-fun tp!42231 () Bool)

(declare-fun b_and!20547 () Bool)

(assert (=> start!42662 (= tp!42231 b_and!20547)))

(declare-fun mapIsEmpty!21961 () Bool)

(declare-fun mapRes!21961 () Bool)

(assert (=> mapIsEmpty!21961 mapRes!21961))

(declare-fun b!475728 () Bool)

(declare-fun res!284070 () Bool)

(declare-fun e!279375 () Bool)

(assert (=> b!475728 (=> (not res!284070) (not e!279375))))

(declare-datatypes ((array!30709 0))(
  ( (array!30710 (arr!14769 (Array (_ BitVec 32) (_ BitVec 64))) (size!15122 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30709)

(declare-datatypes ((List!9073 0))(
  ( (Nil!9070) (Cons!9069 (h!9925 (_ BitVec 64)) (t!15044 List!9073)) )
))
(declare-fun arrayNoDuplicates!0 (array!30709 (_ BitVec 32) List!9073) Bool)

(assert (=> b!475728 (= res!284070 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9070))))

(declare-fun b!475729 () Bool)

(declare-fun res!284067 () Bool)

(assert (=> b!475729 (=> (not res!284067) (not e!279375))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30709 (_ BitVec 32)) Bool)

(assert (=> b!475729 (= res!284067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-datatypes ((V!19091 0))(
  ( (V!19092 (val!6789 Int)) )
))
(declare-fun minValueBefore!38 () V!19091)

(declare-fun zeroValue!794 () V!19091)

(declare-fun defaultEntry!841 () Int)

(declare-fun b!475731 () Bool)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6401 0))(
  ( (ValueCellFull!6401 (v!9078 V!19091)) (EmptyCell!6401) )
))
(declare-datatypes ((array!30711 0))(
  ( (array!30712 (arr!14770 (Array (_ BitVec 32) ValueCell!6401)) (size!15123 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30711)

(declare-fun minValueAfter!38 () V!19091)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun e!279373 () Bool)

(declare-datatypes ((tuple2!9012 0))(
  ( (tuple2!9013 (_1!4517 (_ BitVec 64)) (_2!4517 V!19091)) )
))
(declare-datatypes ((List!9074 0))(
  ( (Nil!9071) (Cons!9070 (h!9926 tuple2!9012) (t!15045 List!9074)) )
))
(declare-datatypes ((ListLongMap!7915 0))(
  ( (ListLongMap!7916 (toList!3973 List!9074)) )
))
(declare-fun +!1796 (ListLongMap!7915 tuple2!9012) ListLongMap!7915)

(declare-fun getCurrentListMap!2247 (array!30709 array!30711 (_ BitVec 32) (_ BitVec 32) V!19091 V!19091 (_ BitVec 32) Int) ListLongMap!7915)

(assert (=> b!475731 (= e!279373 (= (+!1796 (getCurrentListMap!2247 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!9013 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (getCurrentListMap!2247 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841)))))

(declare-fun mapNonEmpty!21961 () Bool)

(declare-fun tp!42232 () Bool)

(declare-fun e!279372 () Bool)

(assert (=> mapNonEmpty!21961 (= mapRes!21961 (and tp!42232 e!279372))))

(declare-fun mapKey!21961 () (_ BitVec 32))

(declare-fun mapRest!21961 () (Array (_ BitVec 32) ValueCell!6401))

(declare-fun mapValue!21961 () ValueCell!6401)

(assert (=> mapNonEmpty!21961 (= (arr!14770 _values!833) (store mapRest!21961 mapKey!21961 mapValue!21961))))

(declare-fun b!475730 () Bool)

(assert (=> b!475730 (= e!279375 (not e!279373))))

(declare-fun res!284069 () Bool)

(assert (=> b!475730 (=> res!284069 e!279373)))

(assert (=> b!475730 (= res!284069 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!216676 () ListLongMap!7915)

(declare-fun lt!216675 () ListLongMap!7915)

(assert (=> b!475730 (= lt!216676 lt!216675)))

(declare-datatypes ((Unit!14002 0))(
  ( (Unit!14003) )
))
(declare-fun lt!216674 () Unit!14002)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!273 (array!30709 array!30711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19091 V!19091 V!19091 V!19091 (_ BitVec 32) Int) Unit!14002)

(assert (=> b!475730 (= lt!216674 (lemmaNoChangeToArrayThenSameMapNoExtras!273 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2139 (array!30709 array!30711 (_ BitVec 32) (_ BitVec 32) V!19091 V!19091 (_ BitVec 32) Int) ListLongMap!7915)

(assert (=> b!475730 (= lt!216675 (getCurrentListMapNoExtraKeys!2139 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!475730 (= lt!216676 (getCurrentListMapNoExtraKeys!2139 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!284068 () Bool)

(assert (=> start!42662 (=> (not res!284068) (not e!279375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42662 (= res!284068 (validMask!0 mask!1365))))

(assert (=> start!42662 e!279375))

(declare-fun tp_is_empty!13489 () Bool)

(assert (=> start!42662 tp_is_empty!13489))

(assert (=> start!42662 tp!42231))

(assert (=> start!42662 true))

(declare-fun array_inv!10738 (array!30709) Bool)

(assert (=> start!42662 (array_inv!10738 _keys!1025)))

(declare-fun e!279377 () Bool)

(declare-fun array_inv!10739 (array!30711) Bool)

(assert (=> start!42662 (and (array_inv!10739 _values!833) e!279377)))

(declare-fun b!475732 () Bool)

(declare-fun e!279376 () Bool)

(assert (=> b!475732 (= e!279376 tp_is_empty!13489)))

(declare-fun b!475733 () Bool)

(declare-fun res!284066 () Bool)

(assert (=> b!475733 (=> (not res!284066) (not e!279375))))

(assert (=> b!475733 (= res!284066 (and (= (size!15123 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15122 _keys!1025) (size!15123 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!475734 () Bool)

(assert (=> b!475734 (= e!279372 tp_is_empty!13489)))

(declare-fun b!475735 () Bool)

(assert (=> b!475735 (= e!279377 (and e!279376 mapRes!21961))))

(declare-fun condMapEmpty!21961 () Bool)

(declare-fun mapDefault!21961 () ValueCell!6401)

(assert (=> b!475735 (= condMapEmpty!21961 (= (arr!14770 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6401)) mapDefault!21961)))))

(assert (= (and start!42662 res!284068) b!475733))

(assert (= (and b!475733 res!284066) b!475729))

(assert (= (and b!475729 res!284067) b!475728))

(assert (= (and b!475728 res!284070) b!475730))

(assert (= (and b!475730 (not res!284069)) b!475731))

(assert (= (and b!475735 condMapEmpty!21961) mapIsEmpty!21961))

(assert (= (and b!475735 (not condMapEmpty!21961)) mapNonEmpty!21961))

(get-info :version)

(assert (= (and mapNonEmpty!21961 ((_ is ValueCellFull!6401) mapValue!21961)) b!475734))

(assert (= (and b!475735 ((_ is ValueCellFull!6401) mapDefault!21961)) b!475732))

(assert (= start!42662 b!475735))

(declare-fun m!457495 () Bool)

(assert (=> start!42662 m!457495))

(declare-fun m!457497 () Bool)

(assert (=> start!42662 m!457497))

(declare-fun m!457499 () Bool)

(assert (=> start!42662 m!457499))

(declare-fun m!457501 () Bool)

(assert (=> b!475730 m!457501))

(declare-fun m!457503 () Bool)

(assert (=> b!475730 m!457503))

(declare-fun m!457505 () Bool)

(assert (=> b!475730 m!457505))

(declare-fun m!457507 () Bool)

(assert (=> b!475731 m!457507))

(assert (=> b!475731 m!457507))

(declare-fun m!457509 () Bool)

(assert (=> b!475731 m!457509))

(declare-fun m!457511 () Bool)

(assert (=> b!475731 m!457511))

(declare-fun m!457513 () Bool)

(assert (=> b!475729 m!457513))

(declare-fun m!457515 () Bool)

(assert (=> mapNonEmpty!21961 m!457515))

(declare-fun m!457517 () Bool)

(assert (=> b!475728 m!457517))

(check-sat (not b!475729) tp_is_empty!13489 (not b_next!12061) (not b!475731) (not mapNonEmpty!21961) (not start!42662) (not b!475728) (not b!475730) b_and!20547)
(check-sat b_and!20547 (not b_next!12061))
(get-model)

(declare-fun d!75475 () Bool)

(assert (=> d!75475 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42662 d!75475))

(declare-fun d!75477 () Bool)

(assert (=> d!75477 (= (array_inv!10738 _keys!1025) (bvsge (size!15122 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42662 d!75477))

(declare-fun d!75479 () Bool)

(assert (=> d!75479 (= (array_inv!10739 _values!833) (bvsge (size!15123 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42662 d!75479))

(declare-fun b!475792 () Bool)

(declare-fun e!279421 () Bool)

(declare-fun call!30632 () Bool)

(assert (=> b!475792 (= e!279421 call!30632)))

(declare-fun b!475793 () Bool)

(declare-fun e!279422 () Bool)

(assert (=> b!475793 (= e!279422 call!30632)))

(declare-fun d!75481 () Bool)

(declare-fun res!284105 () Bool)

(declare-fun e!279420 () Bool)

(assert (=> d!75481 (=> res!284105 e!279420)))

(assert (=> d!75481 (= res!284105 (bvsge #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(assert (=> d!75481 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!279420)))

(declare-fun bm!30629 () Bool)

(assert (=> bm!30629 (= call!30632 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!475794 () Bool)

(assert (=> b!475794 (= e!279422 e!279421)))

(declare-fun lt!216701 () (_ BitVec 64))

(assert (=> b!475794 (= lt!216701 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216703 () Unit!14002)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30709 (_ BitVec 64) (_ BitVec 32)) Unit!14002)

(assert (=> b!475794 (= lt!216703 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!216701 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!475794 (arrayContainsKey!0 _keys!1025 lt!216701 #b00000000000000000000000000000000)))

(declare-fun lt!216702 () Unit!14002)

(assert (=> b!475794 (= lt!216702 lt!216703)))

(declare-fun res!284106 () Bool)

(declare-datatypes ((SeekEntryResult!3556 0))(
  ( (MissingZero!3556 (index!16403 (_ BitVec 32))) (Found!3556 (index!16404 (_ BitVec 32))) (Intermediate!3556 (undefined!4368 Bool) (index!16405 (_ BitVec 32)) (x!44674 (_ BitVec 32))) (Undefined!3556) (MissingVacant!3556 (index!16406 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30709 (_ BitVec 32)) SeekEntryResult!3556)

(assert (=> b!475794 (= res!284106 (= (seekEntryOrOpen!0 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3556 #b00000000000000000000000000000000)))))

(assert (=> b!475794 (=> (not res!284106) (not e!279421))))

(declare-fun b!475795 () Bool)

(assert (=> b!475795 (= e!279420 e!279422)))

(declare-fun c!57186 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!475795 (= c!57186 (validKeyInArray!0 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75481 (not res!284105)) b!475795))

(assert (= (and b!475795 c!57186) b!475794))

(assert (= (and b!475795 (not c!57186)) b!475793))

(assert (= (and b!475794 res!284106) b!475792))

(assert (= (or b!475792 b!475793) bm!30629))

(declare-fun m!457567 () Bool)

(assert (=> bm!30629 m!457567))

(declare-fun m!457569 () Bool)

(assert (=> b!475794 m!457569))

(declare-fun m!457571 () Bool)

(assert (=> b!475794 m!457571))

(declare-fun m!457573 () Bool)

(assert (=> b!475794 m!457573))

(assert (=> b!475794 m!457569))

(declare-fun m!457575 () Bool)

(assert (=> b!475794 m!457575))

(assert (=> b!475795 m!457569))

(assert (=> b!475795 m!457569))

(declare-fun m!457577 () Bool)

(assert (=> b!475795 m!457577))

(assert (=> b!475729 d!75481))

(declare-fun b!475806 () Bool)

(declare-fun e!279432 () Bool)

(declare-fun call!30635 () Bool)

(assert (=> b!475806 (= e!279432 call!30635)))

(declare-fun b!475807 () Bool)

(declare-fun e!279433 () Bool)

(assert (=> b!475807 (= e!279433 e!279432)))

(declare-fun c!57189 () Bool)

(assert (=> b!475807 (= c!57189 (validKeyInArray!0 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475808 () Bool)

(declare-fun e!279434 () Bool)

(declare-fun contains!2553 (List!9073 (_ BitVec 64)) Bool)

(assert (=> b!475808 (= e!279434 (contains!2553 Nil!9070 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30632 () Bool)

(assert (=> bm!30632 (= call!30635 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57189 (Cons!9069 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000) Nil!9070) Nil!9070)))))

(declare-fun b!475809 () Bool)

(assert (=> b!475809 (= e!279432 call!30635)))

(declare-fun b!475810 () Bool)

(declare-fun e!279431 () Bool)

(assert (=> b!475810 (= e!279431 e!279433)))

(declare-fun res!284114 () Bool)

(assert (=> b!475810 (=> (not res!284114) (not e!279433))))

(assert (=> b!475810 (= res!284114 (not e!279434))))

(declare-fun res!284115 () Bool)

(assert (=> b!475810 (=> (not res!284115) (not e!279434))))

(assert (=> b!475810 (= res!284115 (validKeyInArray!0 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75483 () Bool)

(declare-fun res!284113 () Bool)

(assert (=> d!75483 (=> res!284113 e!279431)))

(assert (=> d!75483 (= res!284113 (bvsge #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(assert (=> d!75483 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9070) e!279431)))

(assert (= (and d!75483 (not res!284113)) b!475810))

(assert (= (and b!475810 res!284115) b!475808))

(assert (= (and b!475810 res!284114) b!475807))

(assert (= (and b!475807 c!57189) b!475809))

(assert (= (and b!475807 (not c!57189)) b!475806))

(assert (= (or b!475809 b!475806) bm!30632))

(assert (=> b!475807 m!457569))

(assert (=> b!475807 m!457569))

(assert (=> b!475807 m!457577))

(assert (=> b!475808 m!457569))

(assert (=> b!475808 m!457569))

(declare-fun m!457579 () Bool)

(assert (=> b!475808 m!457579))

(assert (=> bm!30632 m!457569))

(declare-fun m!457581 () Bool)

(assert (=> bm!30632 m!457581))

(assert (=> b!475810 m!457569))

(assert (=> b!475810 m!457569))

(assert (=> b!475810 m!457577))

(assert (=> b!475728 d!75483))

(declare-fun d!75485 () Bool)

(assert (=> d!75485 (= (getCurrentListMapNoExtraKeys!2139 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2139 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216706 () Unit!14002)

(declare-fun choose!1365 (array!30709 array!30711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19091 V!19091 V!19091 V!19091 (_ BitVec 32) Int) Unit!14002)

(assert (=> d!75485 (= lt!216706 (choose!1365 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75485 (validMask!0 mask!1365)))

(assert (=> d!75485 (= (lemmaNoChangeToArrayThenSameMapNoExtras!273 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216706)))

(declare-fun bs!15084 () Bool)

(assert (= bs!15084 d!75485))

(assert (=> bs!15084 m!457505))

(assert (=> bs!15084 m!457503))

(declare-fun m!457583 () Bool)

(assert (=> bs!15084 m!457583))

(assert (=> bs!15084 m!457495))

(assert (=> b!475730 d!75485))

(declare-fun b!475835 () Bool)

(declare-fun e!279450 () ListLongMap!7915)

(declare-fun e!279449 () ListLongMap!7915)

(assert (=> b!475835 (= e!279450 e!279449)))

(declare-fun c!57199 () Bool)

(assert (=> b!475835 (= c!57199 (validKeyInArray!0 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475836 () Bool)

(declare-fun lt!216726 () Unit!14002)

(declare-fun lt!216724 () Unit!14002)

(assert (=> b!475836 (= lt!216726 lt!216724)))

(declare-fun lt!216727 () V!19091)

(declare-fun lt!216723 () (_ BitVec 64))

(declare-fun lt!216721 () (_ BitVec 64))

(declare-fun lt!216722 () ListLongMap!7915)

(declare-fun contains!2554 (ListLongMap!7915 (_ BitVec 64)) Bool)

(assert (=> b!475836 (not (contains!2554 (+!1796 lt!216722 (tuple2!9013 lt!216723 lt!216727)) lt!216721))))

(declare-fun addStillNotContains!171 (ListLongMap!7915 (_ BitVec 64) V!19091 (_ BitVec 64)) Unit!14002)

(assert (=> b!475836 (= lt!216724 (addStillNotContains!171 lt!216722 lt!216723 lt!216727 lt!216721))))

(assert (=> b!475836 (= lt!216721 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!7176 (ValueCell!6401 V!19091) V!19091)

(declare-fun dynLambda!933 (Int (_ BitVec 64)) V!19091)

(assert (=> b!475836 (= lt!216727 (get!7176 (select (arr!14770 _values!833) #b00000000000000000000000000000000) (dynLambda!933 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!475836 (= lt!216723 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30638 () ListLongMap!7915)

(assert (=> b!475836 (= lt!216722 call!30638)))

(assert (=> b!475836 (= e!279449 (+!1796 call!30638 (tuple2!9013 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000) (get!7176 (select (arr!14770 _values!833) #b00000000000000000000000000000000) (dynLambda!933 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!475837 () Bool)

(declare-fun e!279454 () Bool)

(declare-fun lt!216725 () ListLongMap!7915)

(declare-fun isEmpty!588 (ListLongMap!7915) Bool)

(assert (=> b!475837 (= e!279454 (isEmpty!588 lt!216725))))

(declare-fun bm!30635 () Bool)

(assert (=> bm!30635 (= call!30638 (getCurrentListMapNoExtraKeys!2139 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!475838 () Bool)

(declare-fun e!279452 () Bool)

(declare-fun e!279451 () Bool)

(assert (=> b!475838 (= e!279452 e!279451)))

(declare-fun c!57198 () Bool)

(declare-fun e!279453 () Bool)

(assert (=> b!475838 (= c!57198 e!279453)))

(declare-fun res!284124 () Bool)

(assert (=> b!475838 (=> (not res!284124) (not e!279453))))

(assert (=> b!475838 (= res!284124 (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun b!475839 () Bool)

(assert (=> b!475839 (= e!279451 e!279454)))

(declare-fun c!57200 () Bool)

(assert (=> b!475839 (= c!57200 (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun d!75487 () Bool)

(assert (=> d!75487 e!279452))

(declare-fun res!284127 () Bool)

(assert (=> d!75487 (=> (not res!284127) (not e!279452))))

(assert (=> d!75487 (= res!284127 (not (contains!2554 lt!216725 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75487 (= lt!216725 e!279450)))

(declare-fun c!57201 () Bool)

(assert (=> d!75487 (= c!57201 (bvsge #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(assert (=> d!75487 (validMask!0 mask!1365)))

(assert (=> d!75487 (= (getCurrentListMapNoExtraKeys!2139 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216725)))

(declare-fun b!475840 () Bool)

(assert (=> b!475840 (= e!279453 (validKeyInArray!0 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475840 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!475841 () Bool)

(assert (=> b!475841 (= e!279450 (ListLongMap!7916 Nil!9071))))

(declare-fun b!475842 () Bool)

(declare-fun res!284126 () Bool)

(assert (=> b!475842 (=> (not res!284126) (not e!279452))))

(assert (=> b!475842 (= res!284126 (not (contains!2554 lt!216725 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!475843 () Bool)

(assert (=> b!475843 (= e!279454 (= lt!216725 (getCurrentListMapNoExtraKeys!2139 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!475844 () Bool)

(assert (=> b!475844 (= e!279449 call!30638)))

(declare-fun b!475845 () Bool)

(assert (=> b!475845 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(assert (=> b!475845 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15123 _values!833)))))

(declare-fun e!279455 () Bool)

(declare-fun apply!337 (ListLongMap!7915 (_ BitVec 64)) V!19091)

(assert (=> b!475845 (= e!279455 (= (apply!337 lt!216725 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000)) (get!7176 (select (arr!14770 _values!833) #b00000000000000000000000000000000) (dynLambda!933 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!475846 () Bool)

(assert (=> b!475846 (= e!279451 e!279455)))

(assert (=> b!475846 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun res!284125 () Bool)

(assert (=> b!475846 (= res!284125 (contains!2554 lt!216725 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475846 (=> (not res!284125) (not e!279455))))

(assert (= (and d!75487 c!57201) b!475841))

(assert (= (and d!75487 (not c!57201)) b!475835))

(assert (= (and b!475835 c!57199) b!475836))

(assert (= (and b!475835 (not c!57199)) b!475844))

(assert (= (or b!475836 b!475844) bm!30635))

(assert (= (and d!75487 res!284127) b!475842))

(assert (= (and b!475842 res!284126) b!475838))

(assert (= (and b!475838 res!284124) b!475840))

(assert (= (and b!475838 c!57198) b!475846))

(assert (= (and b!475838 (not c!57198)) b!475839))

(assert (= (and b!475846 res!284125) b!475845))

(assert (= (and b!475839 c!57200) b!475843))

(assert (= (and b!475839 (not c!57200)) b!475837))

(declare-fun b_lambda!10299 () Bool)

(assert (=> (not b_lambda!10299) (not b!475836)))

(declare-fun t!15051 () Bool)

(declare-fun tb!3931 () Bool)

(assert (=> (and start!42662 (= defaultEntry!841 defaultEntry!841) t!15051) tb!3931))

(declare-fun result!7467 () Bool)

(assert (=> tb!3931 (= result!7467 tp_is_empty!13489)))

(assert (=> b!475836 t!15051))

(declare-fun b_and!20553 () Bool)

(assert (= b_and!20547 (and (=> t!15051 result!7467) b_and!20553)))

(declare-fun b_lambda!10301 () Bool)

(assert (=> (not b_lambda!10301) (not b!475845)))

(assert (=> b!475845 t!15051))

(declare-fun b_and!20555 () Bool)

(assert (= b_and!20553 (and (=> t!15051 result!7467) b_and!20555)))

(assert (=> b!475840 m!457569))

(assert (=> b!475840 m!457569))

(assert (=> b!475840 m!457577))

(declare-fun m!457585 () Bool)

(assert (=> b!475842 m!457585))

(declare-fun m!457587 () Bool)

(assert (=> b!475837 m!457587))

(declare-fun m!457589 () Bool)

(assert (=> d!75487 m!457589))

(assert (=> d!75487 m!457495))

(declare-fun m!457591 () Bool)

(assert (=> bm!30635 m!457591))

(assert (=> b!475835 m!457569))

(assert (=> b!475835 m!457569))

(assert (=> b!475835 m!457577))

(assert (=> b!475843 m!457591))

(declare-fun m!457593 () Bool)

(assert (=> b!475836 m!457593))

(declare-fun m!457595 () Bool)

(assert (=> b!475836 m!457595))

(assert (=> b!475836 m!457569))

(declare-fun m!457597 () Bool)

(assert (=> b!475836 m!457597))

(declare-fun m!457599 () Bool)

(assert (=> b!475836 m!457599))

(assert (=> b!475836 m!457595))

(declare-fun m!457601 () Bool)

(assert (=> b!475836 m!457601))

(declare-fun m!457603 () Bool)

(assert (=> b!475836 m!457603))

(assert (=> b!475836 m!457599))

(assert (=> b!475836 m!457597))

(declare-fun m!457605 () Bool)

(assert (=> b!475836 m!457605))

(assert (=> b!475845 m!457599))

(assert (=> b!475845 m!457597))

(assert (=> b!475845 m!457605))

(assert (=> b!475845 m!457569))

(assert (=> b!475845 m!457597))

(assert (=> b!475845 m!457599))

(assert (=> b!475845 m!457569))

(declare-fun m!457607 () Bool)

(assert (=> b!475845 m!457607))

(assert (=> b!475846 m!457569))

(assert (=> b!475846 m!457569))

(declare-fun m!457609 () Bool)

(assert (=> b!475846 m!457609))

(assert (=> b!475730 d!75487))

(declare-fun b!475849 () Bool)

(declare-fun e!279457 () ListLongMap!7915)

(declare-fun e!279456 () ListLongMap!7915)

(assert (=> b!475849 (= e!279457 e!279456)))

(declare-fun c!57203 () Bool)

(assert (=> b!475849 (= c!57203 (validKeyInArray!0 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475850 () Bool)

(declare-fun lt!216733 () Unit!14002)

(declare-fun lt!216731 () Unit!14002)

(assert (=> b!475850 (= lt!216733 lt!216731)))

(declare-fun lt!216734 () V!19091)

(declare-fun lt!216728 () (_ BitVec 64))

(declare-fun lt!216729 () ListLongMap!7915)

(declare-fun lt!216730 () (_ BitVec 64))

(assert (=> b!475850 (not (contains!2554 (+!1796 lt!216729 (tuple2!9013 lt!216730 lt!216734)) lt!216728))))

(assert (=> b!475850 (= lt!216731 (addStillNotContains!171 lt!216729 lt!216730 lt!216734 lt!216728))))

(assert (=> b!475850 (= lt!216728 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!475850 (= lt!216734 (get!7176 (select (arr!14770 _values!833) #b00000000000000000000000000000000) (dynLambda!933 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!475850 (= lt!216730 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30639 () ListLongMap!7915)

(assert (=> b!475850 (= lt!216729 call!30639)))

(assert (=> b!475850 (= e!279456 (+!1796 call!30639 (tuple2!9013 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000) (get!7176 (select (arr!14770 _values!833) #b00000000000000000000000000000000) (dynLambda!933 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!475851 () Bool)

(declare-fun e!279461 () Bool)

(declare-fun lt!216732 () ListLongMap!7915)

(assert (=> b!475851 (= e!279461 (isEmpty!588 lt!216732))))

(declare-fun bm!30636 () Bool)

(assert (=> bm!30636 (= call!30639 (getCurrentListMapNoExtraKeys!2139 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!475852 () Bool)

(declare-fun e!279459 () Bool)

(declare-fun e!279458 () Bool)

(assert (=> b!475852 (= e!279459 e!279458)))

(declare-fun c!57202 () Bool)

(declare-fun e!279460 () Bool)

(assert (=> b!475852 (= c!57202 e!279460)))

(declare-fun res!284128 () Bool)

(assert (=> b!475852 (=> (not res!284128) (not e!279460))))

(assert (=> b!475852 (= res!284128 (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun b!475853 () Bool)

(assert (=> b!475853 (= e!279458 e!279461)))

(declare-fun c!57204 () Bool)

(assert (=> b!475853 (= c!57204 (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun d!75489 () Bool)

(assert (=> d!75489 e!279459))

(declare-fun res!284131 () Bool)

(assert (=> d!75489 (=> (not res!284131) (not e!279459))))

(assert (=> d!75489 (= res!284131 (not (contains!2554 lt!216732 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75489 (= lt!216732 e!279457)))

(declare-fun c!57205 () Bool)

(assert (=> d!75489 (= c!57205 (bvsge #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(assert (=> d!75489 (validMask!0 mask!1365)))

(assert (=> d!75489 (= (getCurrentListMapNoExtraKeys!2139 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216732)))

(declare-fun b!475854 () Bool)

(assert (=> b!475854 (= e!279460 (validKeyInArray!0 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475854 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!475855 () Bool)

(assert (=> b!475855 (= e!279457 (ListLongMap!7916 Nil!9071))))

(declare-fun b!475856 () Bool)

(declare-fun res!284130 () Bool)

(assert (=> b!475856 (=> (not res!284130) (not e!279459))))

(assert (=> b!475856 (= res!284130 (not (contains!2554 lt!216732 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!475857 () Bool)

(assert (=> b!475857 (= e!279461 (= lt!216732 (getCurrentListMapNoExtraKeys!2139 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!475858 () Bool)

(assert (=> b!475858 (= e!279456 call!30639)))

(declare-fun b!475859 () Bool)

(assert (=> b!475859 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(assert (=> b!475859 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15123 _values!833)))))

(declare-fun e!279462 () Bool)

(assert (=> b!475859 (= e!279462 (= (apply!337 lt!216732 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000)) (get!7176 (select (arr!14770 _values!833) #b00000000000000000000000000000000) (dynLambda!933 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!475860 () Bool)

(assert (=> b!475860 (= e!279458 e!279462)))

(assert (=> b!475860 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun res!284129 () Bool)

(assert (=> b!475860 (= res!284129 (contains!2554 lt!216732 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475860 (=> (not res!284129) (not e!279462))))

(assert (= (and d!75489 c!57205) b!475855))

(assert (= (and d!75489 (not c!57205)) b!475849))

(assert (= (and b!475849 c!57203) b!475850))

(assert (= (and b!475849 (not c!57203)) b!475858))

(assert (= (or b!475850 b!475858) bm!30636))

(assert (= (and d!75489 res!284131) b!475856))

(assert (= (and b!475856 res!284130) b!475852))

(assert (= (and b!475852 res!284128) b!475854))

(assert (= (and b!475852 c!57202) b!475860))

(assert (= (and b!475852 (not c!57202)) b!475853))

(assert (= (and b!475860 res!284129) b!475859))

(assert (= (and b!475853 c!57204) b!475857))

(assert (= (and b!475853 (not c!57204)) b!475851))

(declare-fun b_lambda!10303 () Bool)

(assert (=> (not b_lambda!10303) (not b!475850)))

(assert (=> b!475850 t!15051))

(declare-fun b_and!20557 () Bool)

(assert (= b_and!20555 (and (=> t!15051 result!7467) b_and!20557)))

(declare-fun b_lambda!10305 () Bool)

(assert (=> (not b_lambda!10305) (not b!475859)))

(assert (=> b!475859 t!15051))

(declare-fun b_and!20559 () Bool)

(assert (= b_and!20557 (and (=> t!15051 result!7467) b_and!20559)))

(assert (=> b!475854 m!457569))

(assert (=> b!475854 m!457569))

(assert (=> b!475854 m!457577))

(declare-fun m!457611 () Bool)

(assert (=> b!475856 m!457611))

(declare-fun m!457613 () Bool)

(assert (=> b!475851 m!457613))

(declare-fun m!457615 () Bool)

(assert (=> d!75489 m!457615))

(assert (=> d!75489 m!457495))

(declare-fun m!457617 () Bool)

(assert (=> bm!30636 m!457617))

(assert (=> b!475849 m!457569))

(assert (=> b!475849 m!457569))

(assert (=> b!475849 m!457577))

(assert (=> b!475857 m!457617))

(declare-fun m!457619 () Bool)

(assert (=> b!475850 m!457619))

(declare-fun m!457621 () Bool)

(assert (=> b!475850 m!457621))

(assert (=> b!475850 m!457569))

(assert (=> b!475850 m!457597))

(assert (=> b!475850 m!457599))

(assert (=> b!475850 m!457621))

(declare-fun m!457623 () Bool)

(assert (=> b!475850 m!457623))

(declare-fun m!457625 () Bool)

(assert (=> b!475850 m!457625))

(assert (=> b!475850 m!457599))

(assert (=> b!475850 m!457597))

(assert (=> b!475850 m!457605))

(assert (=> b!475859 m!457599))

(assert (=> b!475859 m!457597))

(assert (=> b!475859 m!457605))

(assert (=> b!475859 m!457569))

(assert (=> b!475859 m!457597))

(assert (=> b!475859 m!457599))

(assert (=> b!475859 m!457569))

(declare-fun m!457627 () Bool)

(assert (=> b!475859 m!457627))

(assert (=> b!475860 m!457569))

(assert (=> b!475860 m!457569))

(declare-fun m!457629 () Bool)

(assert (=> b!475860 m!457629))

(assert (=> b!475730 d!75489))

(declare-fun d!75491 () Bool)

(declare-fun e!279465 () Bool)

(assert (=> d!75491 e!279465))

(declare-fun res!284137 () Bool)

(assert (=> d!75491 (=> (not res!284137) (not e!279465))))

(declare-fun lt!216746 () ListLongMap!7915)

(assert (=> d!75491 (= res!284137 (contains!2554 lt!216746 (_1!4517 (tuple2!9013 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun lt!216744 () List!9074)

(assert (=> d!75491 (= lt!216746 (ListLongMap!7916 lt!216744))))

(declare-fun lt!216743 () Unit!14002)

(declare-fun lt!216745 () Unit!14002)

(assert (=> d!75491 (= lt!216743 lt!216745)))

(declare-datatypes ((Option!388 0))(
  ( (Some!387 (v!9081 V!19091)) (None!386) )
))
(declare-fun getValueByKey!382 (List!9074 (_ BitVec 64)) Option!388)

(assert (=> d!75491 (= (getValueByKey!382 lt!216744 (_1!4517 (tuple2!9013 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))) (Some!387 (_2!4517 (tuple2!9013 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun lemmaContainsTupThenGetReturnValue!207 (List!9074 (_ BitVec 64) V!19091) Unit!14002)

(assert (=> d!75491 (= lt!216745 (lemmaContainsTupThenGetReturnValue!207 lt!216744 (_1!4517 (tuple2!9013 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (_2!4517 (tuple2!9013 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun insertStrictlySorted!210 (List!9074 (_ BitVec 64) V!19091) List!9074)

(assert (=> d!75491 (= lt!216744 (insertStrictlySorted!210 (toList!3973 (getCurrentListMap!2247 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841)) (_1!4517 (tuple2!9013 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (_2!4517 (tuple2!9013 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(assert (=> d!75491 (= (+!1796 (getCurrentListMap!2247 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!9013 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) lt!216746)))

(declare-fun b!475865 () Bool)

(declare-fun res!284136 () Bool)

(assert (=> b!475865 (=> (not res!284136) (not e!279465))))

(assert (=> b!475865 (= res!284136 (= (getValueByKey!382 (toList!3973 lt!216746) (_1!4517 (tuple2!9013 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))) (Some!387 (_2!4517 (tuple2!9013 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))))

(declare-fun b!475866 () Bool)

(declare-fun contains!2555 (List!9074 tuple2!9012) Bool)

(assert (=> b!475866 (= e!279465 (contains!2555 (toList!3973 lt!216746) (tuple2!9013 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(assert (= (and d!75491 res!284137) b!475865))

(assert (= (and b!475865 res!284136) b!475866))

(declare-fun m!457631 () Bool)

(assert (=> d!75491 m!457631))

(declare-fun m!457633 () Bool)

(assert (=> d!75491 m!457633))

(declare-fun m!457635 () Bool)

(assert (=> d!75491 m!457635))

(declare-fun m!457637 () Bool)

(assert (=> d!75491 m!457637))

(declare-fun m!457639 () Bool)

(assert (=> b!475865 m!457639))

(declare-fun m!457641 () Bool)

(assert (=> b!475866 m!457641))

(assert (=> b!475731 d!75491))

(declare-fun bm!30651 () Bool)

(declare-fun call!30660 () Bool)

(declare-fun lt!216802 () ListLongMap!7915)

(assert (=> bm!30651 (= call!30660 (contains!2554 lt!216802 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!475909 () Bool)

(declare-fun res!284158 () Bool)

(declare-fun e!279496 () Bool)

(assert (=> b!475909 (=> (not res!284158) (not e!279496))))

(declare-fun e!279497 () Bool)

(assert (=> b!475909 (= res!284158 e!279497)))

(declare-fun res!284164 () Bool)

(assert (=> b!475909 (=> res!284164 e!279497)))

(declare-fun e!279504 () Bool)

(assert (=> b!475909 (= res!284164 (not e!279504))))

(declare-fun res!284157 () Bool)

(assert (=> b!475909 (=> (not res!284157) (not e!279504))))

(assert (=> b!475909 (= res!284157 (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun b!475910 () Bool)

(declare-fun e!279503 () Bool)

(assert (=> b!475910 (= e!279496 e!279503)))

(declare-fun c!57222 () Bool)

(assert (=> b!475910 (= c!57222 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!475911 () Bool)

(declare-fun e!279500 () Unit!14002)

(declare-fun Unit!14006 () Unit!14002)

(assert (=> b!475911 (= e!279500 Unit!14006)))

(declare-fun b!475912 () Bool)

(declare-fun e!279501 () Bool)

(assert (=> b!475912 (= e!279501 (= (apply!337 lt!216802 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun bm!30652 () Bool)

(declare-fun call!30655 () ListLongMap!7915)

(declare-fun call!30659 () ListLongMap!7915)

(assert (=> bm!30652 (= call!30655 call!30659)))

(declare-fun call!30654 () ListLongMap!7915)

(declare-fun call!30658 () ListLongMap!7915)

(declare-fun c!57220 () Bool)

(declare-fun bm!30653 () Bool)

(declare-fun c!57219 () Bool)

(assert (=> bm!30653 (= call!30658 (+!1796 (ite c!57219 call!30659 (ite c!57220 call!30655 call!30654)) (ite (or c!57219 c!57220) (tuple2!9013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!9013 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun bm!30654 () Bool)

(declare-fun call!30656 () ListLongMap!7915)

(assert (=> bm!30654 (= call!30656 call!30658)))

(declare-fun d!75493 () Bool)

(assert (=> d!75493 e!279496))

(declare-fun res!284159 () Bool)

(assert (=> d!75493 (=> (not res!284159) (not e!279496))))

(assert (=> d!75493 (= res!284159 (or (bvsge #b00000000000000000000000000000000 (size!15122 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))))

(declare-fun lt!216809 () ListLongMap!7915)

(assert (=> d!75493 (= lt!216802 lt!216809)))

(declare-fun lt!216808 () Unit!14002)

(assert (=> d!75493 (= lt!216808 e!279500)))

(declare-fun c!57223 () Bool)

(declare-fun e!279498 () Bool)

(assert (=> d!75493 (= c!57223 e!279498)))

(declare-fun res!284160 () Bool)

(assert (=> d!75493 (=> (not res!284160) (not e!279498))))

(assert (=> d!75493 (= res!284160 (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun e!279494 () ListLongMap!7915)

(assert (=> d!75493 (= lt!216809 e!279494)))

(assert (=> d!75493 (= c!57219 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75493 (validMask!0 mask!1365)))

(assert (=> d!75493 (= (getCurrentListMap!2247 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216802)))

(declare-fun b!475913 () Bool)

(declare-fun e!279502 () ListLongMap!7915)

(assert (=> b!475913 (= e!279494 e!279502)))

(assert (=> b!475913 (= c!57220 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!475914 () Bool)

(declare-fun e!279492 () ListLongMap!7915)

(assert (=> b!475914 (= e!279492 call!30654)))

(declare-fun b!475915 () Bool)

(assert (=> b!475915 (= e!279504 (validKeyInArray!0 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475916 () Bool)

(declare-fun res!284163 () Bool)

(assert (=> b!475916 (=> (not res!284163) (not e!279496))))

(declare-fun e!279495 () Bool)

(assert (=> b!475916 (= res!284163 e!279495)))

(declare-fun c!57221 () Bool)

(assert (=> b!475916 (= c!57221 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!475917 () Bool)

(assert (=> b!475917 (= e!279494 (+!1796 call!30658 (tuple2!9013 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun e!279493 () Bool)

(declare-fun b!475918 () Bool)

(assert (=> b!475918 (= e!279493 (= (apply!337 lt!216802 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000)) (get!7176 (select (arr!14770 _values!833) #b00000000000000000000000000000000) (dynLambda!933 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!475918 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15123 _values!833)))))

(assert (=> b!475918 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun bm!30655 () Bool)

(declare-fun call!30657 () Bool)

(assert (=> bm!30655 (= call!30657 (contains!2554 lt!216802 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30656 () Bool)

(assert (=> bm!30656 (= call!30659 (getCurrentListMapNoExtraKeys!2139 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun bm!30657 () Bool)

(assert (=> bm!30657 (= call!30654 call!30655)))

(declare-fun b!475919 () Bool)

(assert (=> b!475919 (= e!279503 (not call!30657))))

(declare-fun b!475920 () Bool)

(assert (=> b!475920 (= e!279498 (validKeyInArray!0 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475921 () Bool)

(assert (=> b!475921 (= e!279503 e!279501)))

(declare-fun res!284162 () Bool)

(assert (=> b!475921 (= res!284162 call!30657)))

(assert (=> b!475921 (=> (not res!284162) (not e!279501))))

(declare-fun b!475922 () Bool)

(declare-fun lt!216799 () Unit!14002)

(assert (=> b!475922 (= e!279500 lt!216799)))

(declare-fun lt!216806 () ListLongMap!7915)

(assert (=> b!475922 (= lt!216806 (getCurrentListMapNoExtraKeys!2139 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216805 () (_ BitVec 64))

(assert (=> b!475922 (= lt!216805 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216811 () (_ BitVec 64))

(assert (=> b!475922 (= lt!216811 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216796 () Unit!14002)

(declare-fun addStillContains!295 (ListLongMap!7915 (_ BitVec 64) V!19091 (_ BitVec 64)) Unit!14002)

(assert (=> b!475922 (= lt!216796 (addStillContains!295 lt!216806 lt!216805 zeroValue!794 lt!216811))))

(assert (=> b!475922 (contains!2554 (+!1796 lt!216806 (tuple2!9013 lt!216805 zeroValue!794)) lt!216811)))

(declare-fun lt!216793 () Unit!14002)

(assert (=> b!475922 (= lt!216793 lt!216796)))

(declare-fun lt!216792 () ListLongMap!7915)

(assert (=> b!475922 (= lt!216792 (getCurrentListMapNoExtraKeys!2139 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216804 () (_ BitVec 64))

(assert (=> b!475922 (= lt!216804 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216810 () (_ BitVec 64))

(assert (=> b!475922 (= lt!216810 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216797 () Unit!14002)

(declare-fun addApplyDifferent!295 (ListLongMap!7915 (_ BitVec 64) V!19091 (_ BitVec 64)) Unit!14002)

(assert (=> b!475922 (= lt!216797 (addApplyDifferent!295 lt!216792 lt!216804 minValueBefore!38 lt!216810))))

(assert (=> b!475922 (= (apply!337 (+!1796 lt!216792 (tuple2!9013 lt!216804 minValueBefore!38)) lt!216810) (apply!337 lt!216792 lt!216810))))

(declare-fun lt!216798 () Unit!14002)

(assert (=> b!475922 (= lt!216798 lt!216797)))

(declare-fun lt!216791 () ListLongMap!7915)

(assert (=> b!475922 (= lt!216791 (getCurrentListMapNoExtraKeys!2139 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216803 () (_ BitVec 64))

(assert (=> b!475922 (= lt!216803 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216807 () (_ BitVec 64))

(assert (=> b!475922 (= lt!216807 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216794 () Unit!14002)

(assert (=> b!475922 (= lt!216794 (addApplyDifferent!295 lt!216791 lt!216803 zeroValue!794 lt!216807))))

(assert (=> b!475922 (= (apply!337 (+!1796 lt!216791 (tuple2!9013 lt!216803 zeroValue!794)) lt!216807) (apply!337 lt!216791 lt!216807))))

(declare-fun lt!216812 () Unit!14002)

(assert (=> b!475922 (= lt!216812 lt!216794)))

(declare-fun lt!216801 () ListLongMap!7915)

(assert (=> b!475922 (= lt!216801 (getCurrentListMapNoExtraKeys!2139 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216800 () (_ BitVec 64))

(assert (=> b!475922 (= lt!216800 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216795 () (_ BitVec 64))

(assert (=> b!475922 (= lt!216795 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!475922 (= lt!216799 (addApplyDifferent!295 lt!216801 lt!216800 minValueBefore!38 lt!216795))))

(assert (=> b!475922 (= (apply!337 (+!1796 lt!216801 (tuple2!9013 lt!216800 minValueBefore!38)) lt!216795) (apply!337 lt!216801 lt!216795))))

(declare-fun b!475923 () Bool)

(assert (=> b!475923 (= e!279495 (not call!30660))))

(declare-fun b!475924 () Bool)

(declare-fun c!57218 () Bool)

(assert (=> b!475924 (= c!57218 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!475924 (= e!279502 e!279492)))

(declare-fun b!475925 () Bool)

(declare-fun e!279499 () Bool)

(assert (=> b!475925 (= e!279495 e!279499)))

(declare-fun res!284156 () Bool)

(assert (=> b!475925 (= res!284156 call!30660)))

(assert (=> b!475925 (=> (not res!284156) (not e!279499))))

(declare-fun b!475926 () Bool)

(assert (=> b!475926 (= e!279502 call!30656)))

(declare-fun b!475927 () Bool)

(assert (=> b!475927 (= e!279499 (= (apply!337 lt!216802 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!475928 () Bool)

(assert (=> b!475928 (= e!279497 e!279493)))

(declare-fun res!284161 () Bool)

(assert (=> b!475928 (=> (not res!284161) (not e!279493))))

(assert (=> b!475928 (= res!284161 (contains!2554 lt!216802 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475928 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun b!475929 () Bool)

(assert (=> b!475929 (= e!279492 call!30656)))

(assert (= (and d!75493 c!57219) b!475917))

(assert (= (and d!75493 (not c!57219)) b!475913))

(assert (= (and b!475913 c!57220) b!475926))

(assert (= (and b!475913 (not c!57220)) b!475924))

(assert (= (and b!475924 c!57218) b!475929))

(assert (= (and b!475924 (not c!57218)) b!475914))

(assert (= (or b!475929 b!475914) bm!30657))

(assert (= (or b!475926 bm!30657) bm!30652))

(assert (= (or b!475926 b!475929) bm!30654))

(assert (= (or b!475917 bm!30652) bm!30656))

(assert (= (or b!475917 bm!30654) bm!30653))

(assert (= (and d!75493 res!284160) b!475920))

(assert (= (and d!75493 c!57223) b!475922))

(assert (= (and d!75493 (not c!57223)) b!475911))

(assert (= (and d!75493 res!284159) b!475909))

(assert (= (and b!475909 res!284157) b!475915))

(assert (= (and b!475909 (not res!284164)) b!475928))

(assert (= (and b!475928 res!284161) b!475918))

(assert (= (and b!475909 res!284158) b!475916))

(assert (= (and b!475916 c!57221) b!475925))

(assert (= (and b!475916 (not c!57221)) b!475923))

(assert (= (and b!475925 res!284156) b!475927))

(assert (= (or b!475925 b!475923) bm!30651))

(assert (= (and b!475916 res!284163) b!475910))

(assert (= (and b!475910 c!57222) b!475921))

(assert (= (and b!475910 (not c!57222)) b!475919))

(assert (= (and b!475921 res!284162) b!475912))

(assert (= (or b!475921 b!475919) bm!30655))

(declare-fun b_lambda!10307 () Bool)

(assert (=> (not b_lambda!10307) (not b!475918)))

(assert (=> b!475918 t!15051))

(declare-fun b_and!20561 () Bool)

(assert (= b_and!20559 (and (=> t!15051 result!7467) b_and!20561)))

(declare-fun m!457643 () Bool)

(assert (=> b!475917 m!457643))

(declare-fun m!457645 () Bool)

(assert (=> bm!30653 m!457645))

(assert (=> b!475915 m!457569))

(assert (=> b!475915 m!457569))

(assert (=> b!475915 m!457577))

(assert (=> bm!30656 m!457505))

(declare-fun m!457647 () Bool)

(assert (=> bm!30651 m!457647))

(assert (=> b!475920 m!457569))

(assert (=> b!475920 m!457569))

(assert (=> b!475920 m!457577))

(declare-fun m!457649 () Bool)

(assert (=> bm!30655 m!457649))

(assert (=> d!75493 m!457495))

(declare-fun m!457651 () Bool)

(assert (=> b!475927 m!457651))

(declare-fun m!457653 () Bool)

(assert (=> b!475912 m!457653))

(assert (=> b!475918 m!457599))

(assert (=> b!475918 m!457597))

(assert (=> b!475918 m!457605))

(assert (=> b!475918 m!457569))

(assert (=> b!475918 m!457569))

(declare-fun m!457655 () Bool)

(assert (=> b!475918 m!457655))

(assert (=> b!475918 m!457599))

(assert (=> b!475918 m!457597))

(assert (=> b!475928 m!457569))

(assert (=> b!475928 m!457569))

(declare-fun m!457657 () Bool)

(assert (=> b!475928 m!457657))

(declare-fun m!457659 () Bool)

(assert (=> b!475922 m!457659))

(declare-fun m!457661 () Bool)

(assert (=> b!475922 m!457661))

(assert (=> b!475922 m!457505))

(declare-fun m!457663 () Bool)

(assert (=> b!475922 m!457663))

(declare-fun m!457665 () Bool)

(assert (=> b!475922 m!457665))

(declare-fun m!457667 () Bool)

(assert (=> b!475922 m!457667))

(declare-fun m!457669 () Bool)

(assert (=> b!475922 m!457669))

(assert (=> b!475922 m!457669))

(declare-fun m!457671 () Bool)

(assert (=> b!475922 m!457671))

(assert (=> b!475922 m!457665))

(declare-fun m!457673 () Bool)

(assert (=> b!475922 m!457673))

(declare-fun m!457675 () Bool)

(assert (=> b!475922 m!457675))

(assert (=> b!475922 m!457659))

(declare-fun m!457677 () Bool)

(assert (=> b!475922 m!457677))

(declare-fun m!457679 () Bool)

(assert (=> b!475922 m!457679))

(assert (=> b!475922 m!457569))

(assert (=> b!475922 m!457663))

(declare-fun m!457681 () Bool)

(assert (=> b!475922 m!457681))

(declare-fun m!457683 () Bool)

(assert (=> b!475922 m!457683))

(declare-fun m!457685 () Bool)

(assert (=> b!475922 m!457685))

(declare-fun m!457687 () Bool)

(assert (=> b!475922 m!457687))

(assert (=> b!475731 d!75493))

(declare-fun bm!30658 () Bool)

(declare-fun call!30667 () Bool)

(declare-fun lt!216824 () ListLongMap!7915)

(assert (=> bm!30658 (= call!30667 (contains!2554 lt!216824 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!475930 () Bool)

(declare-fun res!284167 () Bool)

(declare-fun e!279509 () Bool)

(assert (=> b!475930 (=> (not res!284167) (not e!279509))))

(declare-fun e!279510 () Bool)

(assert (=> b!475930 (= res!284167 e!279510)))

(declare-fun res!284173 () Bool)

(assert (=> b!475930 (=> res!284173 e!279510)))

(declare-fun e!279517 () Bool)

(assert (=> b!475930 (= res!284173 (not e!279517))))

(declare-fun res!284166 () Bool)

(assert (=> b!475930 (=> (not res!284166) (not e!279517))))

(assert (=> b!475930 (= res!284166 (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun b!475931 () Bool)

(declare-fun e!279516 () Bool)

(assert (=> b!475931 (= e!279509 e!279516)))

(declare-fun c!57228 () Bool)

(assert (=> b!475931 (= c!57228 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!475932 () Bool)

(declare-fun e!279513 () Unit!14002)

(declare-fun Unit!14007 () Unit!14002)

(assert (=> b!475932 (= e!279513 Unit!14007)))

(declare-fun b!475933 () Bool)

(declare-fun e!279514 () Bool)

(assert (=> b!475933 (= e!279514 (= (apply!337 lt!216824 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun bm!30659 () Bool)

(declare-fun call!30662 () ListLongMap!7915)

(declare-fun call!30666 () ListLongMap!7915)

(assert (=> bm!30659 (= call!30662 call!30666)))

(declare-fun bm!30660 () Bool)

(declare-fun call!30661 () ListLongMap!7915)

(declare-fun call!30665 () ListLongMap!7915)

(declare-fun c!57226 () Bool)

(declare-fun c!57225 () Bool)

(assert (=> bm!30660 (= call!30665 (+!1796 (ite c!57225 call!30666 (ite c!57226 call!30662 call!30661)) (ite (or c!57225 c!57226) (tuple2!9013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!9013 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun bm!30661 () Bool)

(declare-fun call!30663 () ListLongMap!7915)

(assert (=> bm!30661 (= call!30663 call!30665)))

(declare-fun d!75495 () Bool)

(assert (=> d!75495 e!279509))

(declare-fun res!284168 () Bool)

(assert (=> d!75495 (=> (not res!284168) (not e!279509))))

(assert (=> d!75495 (= res!284168 (or (bvsge #b00000000000000000000000000000000 (size!15122 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))))

(declare-fun lt!216831 () ListLongMap!7915)

(assert (=> d!75495 (= lt!216824 lt!216831)))

(declare-fun lt!216830 () Unit!14002)

(assert (=> d!75495 (= lt!216830 e!279513)))

(declare-fun c!57229 () Bool)

(declare-fun e!279511 () Bool)

(assert (=> d!75495 (= c!57229 e!279511)))

(declare-fun res!284169 () Bool)

(assert (=> d!75495 (=> (not res!284169) (not e!279511))))

(assert (=> d!75495 (= res!284169 (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun e!279507 () ListLongMap!7915)

(assert (=> d!75495 (= lt!216831 e!279507)))

(assert (=> d!75495 (= c!57225 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75495 (validMask!0 mask!1365)))

(assert (=> d!75495 (= (getCurrentListMap!2247 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216824)))

(declare-fun b!475934 () Bool)

(declare-fun e!279515 () ListLongMap!7915)

(assert (=> b!475934 (= e!279507 e!279515)))

(assert (=> b!475934 (= c!57226 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!475935 () Bool)

(declare-fun e!279505 () ListLongMap!7915)

(assert (=> b!475935 (= e!279505 call!30661)))

(declare-fun b!475936 () Bool)

(assert (=> b!475936 (= e!279517 (validKeyInArray!0 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475937 () Bool)

(declare-fun res!284172 () Bool)

(assert (=> b!475937 (=> (not res!284172) (not e!279509))))

(declare-fun e!279508 () Bool)

(assert (=> b!475937 (= res!284172 e!279508)))

(declare-fun c!57227 () Bool)

(assert (=> b!475937 (= c!57227 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!475938 () Bool)

(assert (=> b!475938 (= e!279507 (+!1796 call!30665 (tuple2!9013 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun e!279506 () Bool)

(declare-fun b!475939 () Bool)

(assert (=> b!475939 (= e!279506 (= (apply!337 lt!216824 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000)) (get!7176 (select (arr!14770 _values!833) #b00000000000000000000000000000000) (dynLambda!933 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!475939 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15123 _values!833)))))

(assert (=> b!475939 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun bm!30662 () Bool)

(declare-fun call!30664 () Bool)

(assert (=> bm!30662 (= call!30664 (contains!2554 lt!216824 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30663 () Bool)

(assert (=> bm!30663 (= call!30666 (getCurrentListMapNoExtraKeys!2139 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun bm!30664 () Bool)

(assert (=> bm!30664 (= call!30661 call!30662)))

(declare-fun b!475940 () Bool)

(assert (=> b!475940 (= e!279516 (not call!30664))))

(declare-fun b!475941 () Bool)

(assert (=> b!475941 (= e!279511 (validKeyInArray!0 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475942 () Bool)

(assert (=> b!475942 (= e!279516 e!279514)))

(declare-fun res!284171 () Bool)

(assert (=> b!475942 (= res!284171 call!30664)))

(assert (=> b!475942 (=> (not res!284171) (not e!279514))))

(declare-fun b!475943 () Bool)

(declare-fun lt!216821 () Unit!14002)

(assert (=> b!475943 (= e!279513 lt!216821)))

(declare-fun lt!216828 () ListLongMap!7915)

(assert (=> b!475943 (= lt!216828 (getCurrentListMapNoExtraKeys!2139 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216827 () (_ BitVec 64))

(assert (=> b!475943 (= lt!216827 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216833 () (_ BitVec 64))

(assert (=> b!475943 (= lt!216833 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216818 () Unit!14002)

(assert (=> b!475943 (= lt!216818 (addStillContains!295 lt!216828 lt!216827 zeroValue!794 lt!216833))))

(assert (=> b!475943 (contains!2554 (+!1796 lt!216828 (tuple2!9013 lt!216827 zeroValue!794)) lt!216833)))

(declare-fun lt!216815 () Unit!14002)

(assert (=> b!475943 (= lt!216815 lt!216818)))

(declare-fun lt!216814 () ListLongMap!7915)

(assert (=> b!475943 (= lt!216814 (getCurrentListMapNoExtraKeys!2139 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216826 () (_ BitVec 64))

(assert (=> b!475943 (= lt!216826 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216832 () (_ BitVec 64))

(assert (=> b!475943 (= lt!216832 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216819 () Unit!14002)

(assert (=> b!475943 (= lt!216819 (addApplyDifferent!295 lt!216814 lt!216826 minValueAfter!38 lt!216832))))

(assert (=> b!475943 (= (apply!337 (+!1796 lt!216814 (tuple2!9013 lt!216826 minValueAfter!38)) lt!216832) (apply!337 lt!216814 lt!216832))))

(declare-fun lt!216820 () Unit!14002)

(assert (=> b!475943 (= lt!216820 lt!216819)))

(declare-fun lt!216813 () ListLongMap!7915)

(assert (=> b!475943 (= lt!216813 (getCurrentListMapNoExtraKeys!2139 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216825 () (_ BitVec 64))

(assert (=> b!475943 (= lt!216825 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216829 () (_ BitVec 64))

(assert (=> b!475943 (= lt!216829 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216816 () Unit!14002)

(assert (=> b!475943 (= lt!216816 (addApplyDifferent!295 lt!216813 lt!216825 zeroValue!794 lt!216829))))

(assert (=> b!475943 (= (apply!337 (+!1796 lt!216813 (tuple2!9013 lt!216825 zeroValue!794)) lt!216829) (apply!337 lt!216813 lt!216829))))

(declare-fun lt!216834 () Unit!14002)

(assert (=> b!475943 (= lt!216834 lt!216816)))

(declare-fun lt!216823 () ListLongMap!7915)

(assert (=> b!475943 (= lt!216823 (getCurrentListMapNoExtraKeys!2139 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216822 () (_ BitVec 64))

(assert (=> b!475943 (= lt!216822 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216817 () (_ BitVec 64))

(assert (=> b!475943 (= lt!216817 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!475943 (= lt!216821 (addApplyDifferent!295 lt!216823 lt!216822 minValueAfter!38 lt!216817))))

(assert (=> b!475943 (= (apply!337 (+!1796 lt!216823 (tuple2!9013 lt!216822 minValueAfter!38)) lt!216817) (apply!337 lt!216823 lt!216817))))

(declare-fun b!475944 () Bool)

(assert (=> b!475944 (= e!279508 (not call!30667))))

(declare-fun b!475945 () Bool)

(declare-fun c!57224 () Bool)

(assert (=> b!475945 (= c!57224 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!475945 (= e!279515 e!279505)))

(declare-fun b!475946 () Bool)

(declare-fun e!279512 () Bool)

(assert (=> b!475946 (= e!279508 e!279512)))

(declare-fun res!284165 () Bool)

(assert (=> b!475946 (= res!284165 call!30667)))

(assert (=> b!475946 (=> (not res!284165) (not e!279512))))

(declare-fun b!475947 () Bool)

(assert (=> b!475947 (= e!279515 call!30663)))

(declare-fun b!475948 () Bool)

(assert (=> b!475948 (= e!279512 (= (apply!337 lt!216824 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!475949 () Bool)

(assert (=> b!475949 (= e!279510 e!279506)))

(declare-fun res!284170 () Bool)

(assert (=> b!475949 (=> (not res!284170) (not e!279506))))

(assert (=> b!475949 (= res!284170 (contains!2554 lt!216824 (select (arr!14769 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475949 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun b!475950 () Bool)

(assert (=> b!475950 (= e!279505 call!30663)))

(assert (= (and d!75495 c!57225) b!475938))

(assert (= (and d!75495 (not c!57225)) b!475934))

(assert (= (and b!475934 c!57226) b!475947))

(assert (= (and b!475934 (not c!57226)) b!475945))

(assert (= (and b!475945 c!57224) b!475950))

(assert (= (and b!475945 (not c!57224)) b!475935))

(assert (= (or b!475950 b!475935) bm!30664))

(assert (= (or b!475947 bm!30664) bm!30659))

(assert (= (or b!475947 b!475950) bm!30661))

(assert (= (or b!475938 bm!30659) bm!30663))

(assert (= (or b!475938 bm!30661) bm!30660))

(assert (= (and d!75495 res!284169) b!475941))

(assert (= (and d!75495 c!57229) b!475943))

(assert (= (and d!75495 (not c!57229)) b!475932))

(assert (= (and d!75495 res!284168) b!475930))

(assert (= (and b!475930 res!284166) b!475936))

(assert (= (and b!475930 (not res!284173)) b!475949))

(assert (= (and b!475949 res!284170) b!475939))

(assert (= (and b!475930 res!284167) b!475937))

(assert (= (and b!475937 c!57227) b!475946))

(assert (= (and b!475937 (not c!57227)) b!475944))

(assert (= (and b!475946 res!284165) b!475948))

(assert (= (or b!475946 b!475944) bm!30658))

(assert (= (and b!475937 res!284172) b!475931))

(assert (= (and b!475931 c!57228) b!475942))

(assert (= (and b!475931 (not c!57228)) b!475940))

(assert (= (and b!475942 res!284171) b!475933))

(assert (= (or b!475942 b!475940) bm!30662))

(declare-fun b_lambda!10309 () Bool)

(assert (=> (not b_lambda!10309) (not b!475939)))

(assert (=> b!475939 t!15051))

(declare-fun b_and!20563 () Bool)

(assert (= b_and!20561 (and (=> t!15051 result!7467) b_and!20563)))

(declare-fun m!457689 () Bool)

(assert (=> b!475938 m!457689))

(declare-fun m!457691 () Bool)

(assert (=> bm!30660 m!457691))

(assert (=> b!475936 m!457569))

(assert (=> b!475936 m!457569))

(assert (=> b!475936 m!457577))

(assert (=> bm!30663 m!457503))

(declare-fun m!457693 () Bool)

(assert (=> bm!30658 m!457693))

(assert (=> b!475941 m!457569))

(assert (=> b!475941 m!457569))

(assert (=> b!475941 m!457577))

(declare-fun m!457695 () Bool)

(assert (=> bm!30662 m!457695))

(assert (=> d!75495 m!457495))

(declare-fun m!457697 () Bool)

(assert (=> b!475948 m!457697))

(declare-fun m!457699 () Bool)

(assert (=> b!475933 m!457699))

(assert (=> b!475939 m!457599))

(assert (=> b!475939 m!457597))

(assert (=> b!475939 m!457605))

(assert (=> b!475939 m!457569))

(assert (=> b!475939 m!457569))

(declare-fun m!457701 () Bool)

(assert (=> b!475939 m!457701))

(assert (=> b!475939 m!457599))

(assert (=> b!475939 m!457597))

(assert (=> b!475949 m!457569))

(assert (=> b!475949 m!457569))

(declare-fun m!457703 () Bool)

(assert (=> b!475949 m!457703))

(declare-fun m!457705 () Bool)

(assert (=> b!475943 m!457705))

(declare-fun m!457707 () Bool)

(assert (=> b!475943 m!457707))

(assert (=> b!475943 m!457503))

(declare-fun m!457709 () Bool)

(assert (=> b!475943 m!457709))

(declare-fun m!457711 () Bool)

(assert (=> b!475943 m!457711))

(declare-fun m!457713 () Bool)

(assert (=> b!475943 m!457713))

(declare-fun m!457715 () Bool)

(assert (=> b!475943 m!457715))

(assert (=> b!475943 m!457715))

(declare-fun m!457717 () Bool)

(assert (=> b!475943 m!457717))

(assert (=> b!475943 m!457711))

(declare-fun m!457719 () Bool)

(assert (=> b!475943 m!457719))

(declare-fun m!457721 () Bool)

(assert (=> b!475943 m!457721))

(assert (=> b!475943 m!457705))

(declare-fun m!457723 () Bool)

(assert (=> b!475943 m!457723))

(declare-fun m!457725 () Bool)

(assert (=> b!475943 m!457725))

(assert (=> b!475943 m!457569))

(assert (=> b!475943 m!457709))

(declare-fun m!457727 () Bool)

(assert (=> b!475943 m!457727))

(declare-fun m!457729 () Bool)

(assert (=> b!475943 m!457729))

(declare-fun m!457731 () Bool)

(assert (=> b!475943 m!457731))

(declare-fun m!457733 () Bool)

(assert (=> b!475943 m!457733))

(assert (=> b!475731 d!75495))

(declare-fun b!475958 () Bool)

(declare-fun e!279523 () Bool)

(assert (=> b!475958 (= e!279523 tp_is_empty!13489)))

(declare-fun mapNonEmpty!21970 () Bool)

(declare-fun mapRes!21970 () Bool)

(declare-fun tp!42247 () Bool)

(declare-fun e!279522 () Bool)

(assert (=> mapNonEmpty!21970 (= mapRes!21970 (and tp!42247 e!279522))))

(declare-fun mapKey!21970 () (_ BitVec 32))

(declare-fun mapRest!21970 () (Array (_ BitVec 32) ValueCell!6401))

(declare-fun mapValue!21970 () ValueCell!6401)

(assert (=> mapNonEmpty!21970 (= mapRest!21961 (store mapRest!21970 mapKey!21970 mapValue!21970))))

(declare-fun mapIsEmpty!21970 () Bool)

(assert (=> mapIsEmpty!21970 mapRes!21970))

(declare-fun condMapEmpty!21970 () Bool)

(declare-fun mapDefault!21970 () ValueCell!6401)

(assert (=> mapNonEmpty!21961 (= condMapEmpty!21970 (= mapRest!21961 ((as const (Array (_ BitVec 32) ValueCell!6401)) mapDefault!21970)))))

(assert (=> mapNonEmpty!21961 (= tp!42232 (and e!279523 mapRes!21970))))

(declare-fun b!475957 () Bool)

(assert (=> b!475957 (= e!279522 tp_is_empty!13489)))

(assert (= (and mapNonEmpty!21961 condMapEmpty!21970) mapIsEmpty!21970))

(assert (= (and mapNonEmpty!21961 (not condMapEmpty!21970)) mapNonEmpty!21970))

(assert (= (and mapNonEmpty!21970 ((_ is ValueCellFull!6401) mapValue!21970)) b!475957))

(assert (= (and mapNonEmpty!21961 ((_ is ValueCellFull!6401) mapDefault!21970)) b!475958))

(declare-fun m!457735 () Bool)

(assert (=> mapNonEmpty!21970 m!457735))

(declare-fun b_lambda!10311 () Bool)

(assert (= b_lambda!10303 (or (and start!42662 b_free!12061) b_lambda!10311)))

(declare-fun b_lambda!10313 () Bool)

(assert (= b_lambda!10305 (or (and start!42662 b_free!12061) b_lambda!10313)))

(declare-fun b_lambda!10315 () Bool)

(assert (= b_lambda!10309 (or (and start!42662 b_free!12061) b_lambda!10315)))

(declare-fun b_lambda!10317 () Bool)

(assert (= b_lambda!10299 (or (and start!42662 b_free!12061) b_lambda!10317)))

(declare-fun b_lambda!10319 () Bool)

(assert (= b_lambda!10301 (or (and start!42662 b_free!12061) b_lambda!10319)))

(declare-fun b_lambda!10321 () Bool)

(assert (= b_lambda!10307 (or (and start!42662 b_free!12061) b_lambda!10321)))

(check-sat (not b!475856) (not mapNonEmpty!21970) (not b_next!12061) (not b!475939) (not b!475807) (not b!475859) (not b!475846) (not b!475941) (not b!475860) (not d!75493) (not b!475927) (not b_lambda!10311) (not bm!30653) (not b!475795) (not d!75485) (not b!475836) (not bm!30655) (not b!475936) (not d!75487) (not b!475928) (not b_lambda!10321) (not b!475912) (not bm!30651) (not b_lambda!10319) tp_is_empty!13489 b_and!20563 (not b!475845) (not bm!30660) (not b!475810) (not b!475922) (not b!475843) (not b!475857) (not b!475915) (not b!475917) (not b!475948) (not bm!30663) (not b!475850) (not b!475865) (not b!475851) (not b_lambda!10317) (not b!475854) (not b!475943) (not bm!30658) (not b!475938) (not bm!30656) (not bm!30636) (not b!475842) (not b_lambda!10315) (not b!475840) (not b!475933) (not bm!30635) (not b!475949) (not b!475918) (not b_lambda!10313) (not b!475808) (not b!475835) (not b!475794) (not d!75495) (not b!475920) (not bm!30629) (not b!475866) (not d!75491) (not b!475849) (not d!75489) (not bm!30662) (not b!475837) (not bm!30632))
(check-sat b_and!20563 (not b_next!12061))
