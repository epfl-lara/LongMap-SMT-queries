; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71132 () Bool)

(assert start!71132)

(declare-fun b_free!13183 () Bool)

(declare-fun b_next!13183 () Bool)

(assert (=> start!71132 (= b_free!13183 (not b_next!13183))))

(declare-fun tp!46299 () Bool)

(declare-fun b_and!22089 () Bool)

(assert (=> start!71132 (= tp!46299 b_and!22089)))

(declare-fun b!825052 () Bool)

(declare-fun res!562277 () Bool)

(declare-fun e!459065 () Bool)

(assert (=> b!825052 (=> (not res!562277) (not e!459065))))

(declare-datatypes ((array!45979 0))(
  ( (array!45980 (arr!22033 (Array (_ BitVec 32) (_ BitVec 64))) (size!22453 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45979)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45979 (_ BitVec 32)) Bool)

(assert (=> b!825052 (= res!562277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!825053 () Bool)

(declare-fun e!459064 () Bool)

(declare-fun tp_is_empty!14893 () Bool)

(assert (=> b!825053 (= e!459064 tp_is_empty!14893)))

(declare-fun b!825054 () Bool)

(declare-fun res!562276 () Bool)

(assert (=> b!825054 (=> (not res!562276) (not e!459065))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24859 0))(
  ( (V!24860 (val!7494 Int)) )
))
(declare-datatypes ((ValueCell!7031 0))(
  ( (ValueCellFull!7031 (v!9927 V!24859)) (EmptyCell!7031) )
))
(declare-datatypes ((array!45981 0))(
  ( (array!45982 (arr!22034 (Array (_ BitVec 32) ValueCell!7031)) (size!22454 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45981)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!825054 (= res!562276 (and (= (size!22454 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22453 _keys!976) (size!22454 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23956 () Bool)

(declare-fun mapRes!23956 () Bool)

(declare-fun tp!46300 () Bool)

(assert (=> mapNonEmpty!23956 (= mapRes!23956 (and tp!46300 e!459064))))

(declare-fun mapValue!23956 () ValueCell!7031)

(declare-fun mapKey!23956 () (_ BitVec 32))

(declare-fun mapRest!23956 () (Array (_ BitVec 32) ValueCell!7031))

(assert (=> mapNonEmpty!23956 (= (arr!22034 _values!788) (store mapRest!23956 mapKey!23956 mapValue!23956))))

(declare-fun b!825055 () Bool)

(declare-fun res!562278 () Bool)

(assert (=> b!825055 (=> (not res!562278) (not e!459065))))

(declare-datatypes ((List!15620 0))(
  ( (Nil!15617) (Cons!15616 (h!16751 (_ BitVec 64)) (t!21953 List!15620)) )
))
(declare-fun arrayNoDuplicates!0 (array!45979 (_ BitVec 32) List!15620) Bool)

(assert (=> b!825055 (= res!562278 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15617))))

(declare-fun b!825056 () Bool)

(declare-fun e!459066 () Bool)

(declare-fun e!459062 () Bool)

(assert (=> b!825056 (= e!459066 (and e!459062 mapRes!23956))))

(declare-fun condMapEmpty!23956 () Bool)

(declare-fun mapDefault!23956 () ValueCell!7031)

(assert (=> b!825056 (= condMapEmpty!23956 (= (arr!22034 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7031)) mapDefault!23956)))))

(declare-fun res!562275 () Bool)

(assert (=> start!71132 (=> (not res!562275) (not e!459065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71132 (= res!562275 (validMask!0 mask!1312))))

(assert (=> start!71132 e!459065))

(assert (=> start!71132 tp_is_empty!14893))

(declare-fun array_inv!17621 (array!45979) Bool)

(assert (=> start!71132 (array_inv!17621 _keys!976)))

(assert (=> start!71132 true))

(declare-fun array_inv!17622 (array!45981) Bool)

(assert (=> start!71132 (and (array_inv!17622 _values!788) e!459066)))

(assert (=> start!71132 tp!46299))

(declare-fun b!825057 () Bool)

(assert (=> b!825057 (= e!459065 (not (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!22453 _keys!976)))))))

(declare-datatypes ((tuple2!9836 0))(
  ( (tuple2!9837 (_1!4929 (_ BitVec 64)) (_2!4929 V!24859)) )
))
(declare-datatypes ((List!15621 0))(
  ( (Nil!15618) (Cons!15617 (h!16752 tuple2!9836) (t!21954 List!15621)) )
))
(declare-datatypes ((ListLongMap!8661 0))(
  ( (ListLongMap!8662 (toList!4346 List!15621)) )
))
(declare-fun lt!372045 () ListLongMap!8661)

(declare-fun lt!372044 () ListLongMap!8661)

(assert (=> b!825057 (= lt!372045 lt!372044)))

(declare-fun zeroValueBefore!34 () V!24859)

(declare-fun zeroValueAfter!34 () V!24859)

(declare-fun minValue!754 () V!24859)

(declare-datatypes ((Unit!28245 0))(
  ( (Unit!28246) )
))
(declare-fun lt!372046 () Unit!28245)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!517 (array!45979 array!45981 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24859 V!24859 V!24859 V!24859 (_ BitVec 32) Int) Unit!28245)

(assert (=> b!825057 (= lt!372046 (lemmaNoChangeToArrayThenSameMapNoExtras!517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2429 (array!45979 array!45981 (_ BitVec 32) (_ BitVec 32) V!24859 V!24859 (_ BitVec 32) Int) ListLongMap!8661)

(assert (=> b!825057 (= lt!372044 (getCurrentListMapNoExtraKeys!2429 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825057 (= lt!372045 (getCurrentListMapNoExtraKeys!2429 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825058 () Bool)

(assert (=> b!825058 (= e!459062 tp_is_empty!14893)))

(declare-fun mapIsEmpty!23956 () Bool)

(assert (=> mapIsEmpty!23956 mapRes!23956))

(assert (= (and start!71132 res!562275) b!825054))

(assert (= (and b!825054 res!562276) b!825052))

(assert (= (and b!825052 res!562277) b!825055))

(assert (= (and b!825055 res!562278) b!825057))

(assert (= (and b!825056 condMapEmpty!23956) mapIsEmpty!23956))

(assert (= (and b!825056 (not condMapEmpty!23956)) mapNonEmpty!23956))

(get-info :version)

(assert (= (and mapNonEmpty!23956 ((_ is ValueCellFull!7031) mapValue!23956)) b!825053))

(assert (= (and b!825056 ((_ is ValueCellFull!7031) mapDefault!23956)) b!825058))

(assert (= start!71132 b!825056))

(declare-fun m!767579 () Bool)

(assert (=> b!825052 m!767579))

(declare-fun m!767581 () Bool)

(assert (=> b!825057 m!767581))

(declare-fun m!767583 () Bool)

(assert (=> b!825057 m!767583))

(declare-fun m!767585 () Bool)

(assert (=> b!825057 m!767585))

(declare-fun m!767587 () Bool)

(assert (=> mapNonEmpty!23956 m!767587))

(declare-fun m!767589 () Bool)

(assert (=> start!71132 m!767589))

(declare-fun m!767591 () Bool)

(assert (=> start!71132 m!767591))

(declare-fun m!767593 () Bool)

(assert (=> start!71132 m!767593))

(declare-fun m!767595 () Bool)

(assert (=> b!825055 m!767595))

(check-sat tp_is_empty!14893 (not mapNonEmpty!23956) (not b!825052) (not b_next!13183) (not start!71132) (not b!825055) b_and!22089 (not b!825057))
(check-sat b_and!22089 (not b_next!13183))
(get-model)

(declare-fun d!105245 () Bool)

(assert (=> d!105245 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71132 d!105245))

(declare-fun d!105247 () Bool)

(assert (=> d!105247 (= (array_inv!17621 _keys!976) (bvsge (size!22453 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71132 d!105247))

(declare-fun d!105249 () Bool)

(assert (=> d!105249 (= (array_inv!17622 _values!788) (bvsge (size!22454 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71132 d!105249))

(declare-fun d!105251 () Bool)

(declare-fun res!562311 () Bool)

(declare-fun e!459106 () Bool)

(assert (=> d!105251 (=> res!562311 e!459106)))

(assert (=> d!105251 (= res!562311 (bvsge #b00000000000000000000000000000000 (size!22453 _keys!976)))))

(assert (=> d!105251 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15617) e!459106)))

(declare-fun bm!35874 () Bool)

(declare-fun call!35877 () Bool)

(declare-fun c!89648 () Bool)

(assert (=> bm!35874 (= call!35877 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89648 (Cons!15616 (select (arr!22033 _keys!976) #b00000000000000000000000000000000) Nil!15617) Nil!15617)))))

(declare-fun b!825111 () Bool)

(declare-fun e!459107 () Bool)

(assert (=> b!825111 (= e!459107 call!35877)))

(declare-fun b!825112 () Bool)

(declare-fun e!459108 () Bool)

(assert (=> b!825112 (= e!459106 e!459108)))

(declare-fun res!562310 () Bool)

(assert (=> b!825112 (=> (not res!562310) (not e!459108))))

(declare-fun e!459105 () Bool)

(assert (=> b!825112 (= res!562310 (not e!459105))))

(declare-fun res!562309 () Bool)

(assert (=> b!825112 (=> (not res!562309) (not e!459105))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!825112 (= res!562309 (validKeyInArray!0 (select (arr!22033 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!825113 () Bool)

(declare-fun contains!4153 (List!15620 (_ BitVec 64)) Bool)

(assert (=> b!825113 (= e!459105 (contains!4153 Nil!15617 (select (arr!22033 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!825114 () Bool)

(assert (=> b!825114 (= e!459108 e!459107)))

(assert (=> b!825114 (= c!89648 (validKeyInArray!0 (select (arr!22033 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!825115 () Bool)

(assert (=> b!825115 (= e!459107 call!35877)))

(assert (= (and d!105251 (not res!562311)) b!825112))

(assert (= (and b!825112 res!562309) b!825113))

(assert (= (and b!825112 res!562310) b!825114))

(assert (= (and b!825114 c!89648) b!825111))

(assert (= (and b!825114 (not c!89648)) b!825115))

(assert (= (or b!825111 b!825115) bm!35874))

(declare-fun m!767633 () Bool)

(assert (=> bm!35874 m!767633))

(declare-fun m!767635 () Bool)

(assert (=> bm!35874 m!767635))

(assert (=> b!825112 m!767633))

(assert (=> b!825112 m!767633))

(declare-fun m!767637 () Bool)

(assert (=> b!825112 m!767637))

(assert (=> b!825113 m!767633))

(assert (=> b!825113 m!767633))

(declare-fun m!767639 () Bool)

(assert (=> b!825113 m!767639))

(assert (=> b!825114 m!767633))

(assert (=> b!825114 m!767633))

(assert (=> b!825114 m!767637))

(assert (=> b!825055 d!105251))

(declare-fun b!825124 () Bool)

(declare-fun e!459116 () Bool)

(declare-fun e!459115 () Bool)

(assert (=> b!825124 (= e!459116 e!459115)))

(declare-fun c!89651 () Bool)

(assert (=> b!825124 (= c!89651 (validKeyInArray!0 (select (arr!22033 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!825125 () Bool)

(declare-fun e!459117 () Bool)

(assert (=> b!825125 (= e!459115 e!459117)))

(declare-fun lt!372072 () (_ BitVec 64))

(assert (=> b!825125 (= lt!372072 (select (arr!22033 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!372071 () Unit!28245)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45979 (_ BitVec 64) (_ BitVec 32)) Unit!28245)

(assert (=> b!825125 (= lt!372071 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!372072 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!825125 (arrayContainsKey!0 _keys!976 lt!372072 #b00000000000000000000000000000000)))

(declare-fun lt!372073 () Unit!28245)

(assert (=> b!825125 (= lt!372073 lt!372071)))

(declare-fun res!562317 () Bool)

(declare-datatypes ((SeekEntryResult!8683 0))(
  ( (MissingZero!8683 (index!37103 (_ BitVec 32))) (Found!8683 (index!37104 (_ BitVec 32))) (Intermediate!8683 (undefined!9495 Bool) (index!37105 (_ BitVec 32)) (x!69514 (_ BitVec 32))) (Undefined!8683) (MissingVacant!8683 (index!37106 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45979 (_ BitVec 32)) SeekEntryResult!8683)

(assert (=> b!825125 (= res!562317 (= (seekEntryOrOpen!0 (select (arr!22033 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8683 #b00000000000000000000000000000000)))))

(assert (=> b!825125 (=> (not res!562317) (not e!459117))))

(declare-fun b!825126 () Bool)

(declare-fun call!35880 () Bool)

(assert (=> b!825126 (= e!459117 call!35880)))

(declare-fun d!105253 () Bool)

(declare-fun res!562316 () Bool)

(assert (=> d!105253 (=> res!562316 e!459116)))

(assert (=> d!105253 (= res!562316 (bvsge #b00000000000000000000000000000000 (size!22453 _keys!976)))))

(assert (=> d!105253 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!459116)))

(declare-fun b!825127 () Bool)

(assert (=> b!825127 (= e!459115 call!35880)))

(declare-fun bm!35877 () Bool)

(assert (=> bm!35877 (= call!35880 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(assert (= (and d!105253 (not res!562316)) b!825124))

(assert (= (and b!825124 c!89651) b!825125))

(assert (= (and b!825124 (not c!89651)) b!825127))

(assert (= (and b!825125 res!562317) b!825126))

(assert (= (or b!825126 b!825127) bm!35877))

(assert (=> b!825124 m!767633))

(assert (=> b!825124 m!767633))

(assert (=> b!825124 m!767637))

(assert (=> b!825125 m!767633))

(declare-fun m!767641 () Bool)

(assert (=> b!825125 m!767641))

(declare-fun m!767643 () Bool)

(assert (=> b!825125 m!767643))

(assert (=> b!825125 m!767633))

(declare-fun m!767645 () Bool)

(assert (=> b!825125 m!767645))

(declare-fun m!767647 () Bool)

(assert (=> bm!35877 m!767647))

(assert (=> b!825052 d!105253))

(declare-fun d!105255 () Bool)

(assert (=> d!105255 (= (getCurrentListMapNoExtraKeys!2429 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2429 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!372076 () Unit!28245)

(declare-fun choose!1409 (array!45979 array!45981 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24859 V!24859 V!24859 V!24859 (_ BitVec 32) Int) Unit!28245)

(assert (=> d!105255 (= lt!372076 (choose!1409 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105255 (validMask!0 mask!1312)))

(assert (=> d!105255 (= (lemmaNoChangeToArrayThenSameMapNoExtras!517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!372076)))

(declare-fun bs!23029 () Bool)

(assert (= bs!23029 d!105255))

(assert (=> bs!23029 m!767585))

(assert (=> bs!23029 m!767583))

(declare-fun m!767649 () Bool)

(assert (=> bs!23029 m!767649))

(assert (=> bs!23029 m!767589))

(assert (=> b!825057 d!105255))

(declare-fun b!825152 () Bool)

(declare-fun e!459136 () ListLongMap!8661)

(declare-fun call!35883 () ListLongMap!8661)

(assert (=> b!825152 (= e!459136 call!35883)))

(declare-fun e!459137 () Bool)

(declare-fun b!825153 () Bool)

(declare-fun lt!372092 () ListLongMap!8661)

(assert (=> b!825153 (= e!459137 (= lt!372092 (getCurrentListMapNoExtraKeys!2429 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun d!105257 () Bool)

(declare-fun e!459135 () Bool)

(assert (=> d!105257 e!459135))

(declare-fun res!562329 () Bool)

(assert (=> d!105257 (=> (not res!562329) (not e!459135))))

(declare-fun contains!4154 (ListLongMap!8661 (_ BitVec 64)) Bool)

(assert (=> d!105257 (= res!562329 (not (contains!4154 lt!372092 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!459133 () ListLongMap!8661)

(assert (=> d!105257 (= lt!372092 e!459133)))

(declare-fun c!89662 () Bool)

(assert (=> d!105257 (= c!89662 (bvsge #b00000000000000000000000000000000 (size!22453 _keys!976)))))

(assert (=> d!105257 (validMask!0 mask!1312)))

(assert (=> d!105257 (= (getCurrentListMapNoExtraKeys!2429 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!372092)))

(declare-fun b!825154 () Bool)

(declare-fun e!459132 () Bool)

(assert (=> b!825154 (= e!459132 e!459137)))

(declare-fun c!89663 () Bool)

(assert (=> b!825154 (= c!89663 (bvslt #b00000000000000000000000000000000 (size!22453 _keys!976)))))

(declare-fun b!825155 () Bool)

(assert (=> b!825155 (= e!459133 e!459136)))

(declare-fun c!89660 () Bool)

(assert (=> b!825155 (= c!89660 (validKeyInArray!0 (select (arr!22033 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!825156 () Bool)

(declare-fun res!562326 () Bool)

(assert (=> b!825156 (=> (not res!562326) (not e!459135))))

(assert (=> b!825156 (= res!562326 (not (contains!4154 lt!372092 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!825157 () Bool)

(assert (=> b!825157 (= e!459133 (ListLongMap!8662 Nil!15618))))

(declare-fun b!825158 () Bool)

(assert (=> b!825158 (= e!459135 e!459132)))

(declare-fun c!89661 () Bool)

(declare-fun e!459138 () Bool)

(assert (=> b!825158 (= c!89661 e!459138)))

(declare-fun res!562327 () Bool)

(assert (=> b!825158 (=> (not res!562327) (not e!459138))))

(assert (=> b!825158 (= res!562327 (bvslt #b00000000000000000000000000000000 (size!22453 _keys!976)))))

(declare-fun b!825159 () Bool)

(declare-fun lt!372091 () Unit!28245)

(declare-fun lt!372096 () Unit!28245)

(assert (=> b!825159 (= lt!372091 lt!372096)))

(declare-fun lt!372094 () ListLongMap!8661)

(declare-fun lt!372095 () V!24859)

(declare-fun lt!372093 () (_ BitVec 64))

(declare-fun lt!372097 () (_ BitVec 64))

(declare-fun +!1913 (ListLongMap!8661 tuple2!9836) ListLongMap!8661)

(assert (=> b!825159 (not (contains!4154 (+!1913 lt!372094 (tuple2!9837 lt!372093 lt!372095)) lt!372097))))

(declare-fun addStillNotContains!187 (ListLongMap!8661 (_ BitVec 64) V!24859 (_ BitVec 64)) Unit!28245)

(assert (=> b!825159 (= lt!372096 (addStillNotContains!187 lt!372094 lt!372093 lt!372095 lt!372097))))

(assert (=> b!825159 (= lt!372097 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11704 (ValueCell!7031 V!24859) V!24859)

(declare-fun dynLambda!968 (Int (_ BitVec 64)) V!24859)

(assert (=> b!825159 (= lt!372095 (get!11704 (select (arr!22034 _values!788) #b00000000000000000000000000000000) (dynLambda!968 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!825159 (= lt!372093 (select (arr!22033 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!825159 (= lt!372094 call!35883)))

(assert (=> b!825159 (= e!459136 (+!1913 call!35883 (tuple2!9837 (select (arr!22033 _keys!976) #b00000000000000000000000000000000) (get!11704 (select (arr!22034 _values!788) #b00000000000000000000000000000000) (dynLambda!968 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!825160 () Bool)

(declare-fun isEmpty!648 (ListLongMap!8661) Bool)

(assert (=> b!825160 (= e!459137 (isEmpty!648 lt!372092))))

(declare-fun b!825161 () Bool)

(assert (=> b!825161 (= e!459138 (validKeyInArray!0 (select (arr!22033 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!825161 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!825162 () Bool)

(assert (=> b!825162 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22453 _keys!976)))))

(assert (=> b!825162 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22454 _values!788)))))

(declare-fun e!459134 () Bool)

(declare-fun apply!360 (ListLongMap!8661 (_ BitVec 64)) V!24859)

(assert (=> b!825162 (= e!459134 (= (apply!360 lt!372092 (select (arr!22033 _keys!976) #b00000000000000000000000000000000)) (get!11704 (select (arr!22034 _values!788) #b00000000000000000000000000000000) (dynLambda!968 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!825163 () Bool)

(assert (=> b!825163 (= e!459132 e!459134)))

(assert (=> b!825163 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22453 _keys!976)))))

(declare-fun res!562328 () Bool)

(assert (=> b!825163 (= res!562328 (contains!4154 lt!372092 (select (arr!22033 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!825163 (=> (not res!562328) (not e!459134))))

(declare-fun bm!35880 () Bool)

(assert (=> bm!35880 (= call!35883 (getCurrentListMapNoExtraKeys!2429 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(assert (= (and d!105257 c!89662) b!825157))

(assert (= (and d!105257 (not c!89662)) b!825155))

(assert (= (and b!825155 c!89660) b!825159))

(assert (= (and b!825155 (not c!89660)) b!825152))

(assert (= (or b!825159 b!825152) bm!35880))

(assert (= (and d!105257 res!562329) b!825156))

(assert (= (and b!825156 res!562326) b!825158))

(assert (= (and b!825158 res!562327) b!825161))

(assert (= (and b!825158 c!89661) b!825163))

(assert (= (and b!825158 (not c!89661)) b!825154))

(assert (= (and b!825163 res!562328) b!825162))

(assert (= (and b!825154 c!89663) b!825153))

(assert (= (and b!825154 (not c!89663)) b!825160))

(declare-fun b_lambda!11093 () Bool)

(assert (=> (not b_lambda!11093) (not b!825159)))

(declare-fun t!21959 () Bool)

(declare-fun tb!4193 () Bool)

(assert (=> (and start!71132 (= defaultEntry!796 defaultEntry!796) t!21959) tb!4193))

(declare-fun result!7935 () Bool)

(assert (=> tb!4193 (= result!7935 tp_is_empty!14893)))

(assert (=> b!825159 t!21959))

(declare-fun b_and!22095 () Bool)

(assert (= b_and!22089 (and (=> t!21959 result!7935) b_and!22095)))

(declare-fun b_lambda!11095 () Bool)

(assert (=> (not b_lambda!11095) (not b!825162)))

(assert (=> b!825162 t!21959))

(declare-fun b_and!22097 () Bool)

(assert (= b_and!22095 (and (=> t!21959 result!7935) b_and!22097)))

(declare-fun m!767651 () Bool)

(assert (=> d!105257 m!767651))

(assert (=> d!105257 m!767589))

(assert (=> b!825163 m!767633))

(assert (=> b!825163 m!767633))

(declare-fun m!767653 () Bool)

(assert (=> b!825163 m!767653))

(declare-fun m!767655 () Bool)

(assert (=> bm!35880 m!767655))

(assert (=> b!825162 m!767633))

(declare-fun m!767657 () Bool)

(assert (=> b!825162 m!767657))

(declare-fun m!767659 () Bool)

(assert (=> b!825162 m!767659))

(declare-fun m!767661 () Bool)

(assert (=> b!825162 m!767661))

(assert (=> b!825162 m!767659))

(declare-fun m!767663 () Bool)

(assert (=> b!825162 m!767663))

(assert (=> b!825162 m!767661))

(assert (=> b!825162 m!767633))

(assert (=> b!825161 m!767633))

(assert (=> b!825161 m!767633))

(assert (=> b!825161 m!767637))

(declare-fun m!767665 () Bool)

(assert (=> b!825159 m!767665))

(assert (=> b!825159 m!767659))

(assert (=> b!825159 m!767665))

(declare-fun m!767667 () Bool)

(assert (=> b!825159 m!767667))

(declare-fun m!767669 () Bool)

(assert (=> b!825159 m!767669))

(assert (=> b!825159 m!767661))

(assert (=> b!825159 m!767659))

(assert (=> b!825159 m!767663))

(assert (=> b!825159 m!767661))

(declare-fun m!767671 () Bool)

(assert (=> b!825159 m!767671))

(assert (=> b!825159 m!767633))

(assert (=> b!825153 m!767655))

(declare-fun m!767673 () Bool)

(assert (=> b!825156 m!767673))

(declare-fun m!767675 () Bool)

(assert (=> b!825160 m!767675))

(assert (=> b!825155 m!767633))

(assert (=> b!825155 m!767633))

(assert (=> b!825155 m!767637))

(assert (=> b!825057 d!105257))

(declare-fun b!825166 () Bool)

(declare-fun e!459143 () ListLongMap!8661)

(declare-fun call!35884 () ListLongMap!8661)

(assert (=> b!825166 (= e!459143 call!35884)))

(declare-fun e!459144 () Bool)

(declare-fun lt!372099 () ListLongMap!8661)

(declare-fun b!825167 () Bool)

(assert (=> b!825167 (= e!459144 (= lt!372099 (getCurrentListMapNoExtraKeys!2429 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun d!105259 () Bool)

(declare-fun e!459142 () Bool)

(assert (=> d!105259 e!459142))

(declare-fun res!562333 () Bool)

(assert (=> d!105259 (=> (not res!562333) (not e!459142))))

(assert (=> d!105259 (= res!562333 (not (contains!4154 lt!372099 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!459140 () ListLongMap!8661)

(assert (=> d!105259 (= lt!372099 e!459140)))

(declare-fun c!89666 () Bool)

(assert (=> d!105259 (= c!89666 (bvsge #b00000000000000000000000000000000 (size!22453 _keys!976)))))

(assert (=> d!105259 (validMask!0 mask!1312)))

(assert (=> d!105259 (= (getCurrentListMapNoExtraKeys!2429 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!372099)))

(declare-fun b!825168 () Bool)

(declare-fun e!459139 () Bool)

(assert (=> b!825168 (= e!459139 e!459144)))

(declare-fun c!89667 () Bool)

(assert (=> b!825168 (= c!89667 (bvslt #b00000000000000000000000000000000 (size!22453 _keys!976)))))

(declare-fun b!825169 () Bool)

(assert (=> b!825169 (= e!459140 e!459143)))

(declare-fun c!89664 () Bool)

(assert (=> b!825169 (= c!89664 (validKeyInArray!0 (select (arr!22033 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!825170 () Bool)

(declare-fun res!562330 () Bool)

(assert (=> b!825170 (=> (not res!562330) (not e!459142))))

(assert (=> b!825170 (= res!562330 (not (contains!4154 lt!372099 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!825171 () Bool)

(assert (=> b!825171 (= e!459140 (ListLongMap!8662 Nil!15618))))

(declare-fun b!825172 () Bool)

(assert (=> b!825172 (= e!459142 e!459139)))

(declare-fun c!89665 () Bool)

(declare-fun e!459145 () Bool)

(assert (=> b!825172 (= c!89665 e!459145)))

(declare-fun res!562331 () Bool)

(assert (=> b!825172 (=> (not res!562331) (not e!459145))))

(assert (=> b!825172 (= res!562331 (bvslt #b00000000000000000000000000000000 (size!22453 _keys!976)))))

(declare-fun b!825173 () Bool)

(declare-fun lt!372098 () Unit!28245)

(declare-fun lt!372103 () Unit!28245)

(assert (=> b!825173 (= lt!372098 lt!372103)))

(declare-fun lt!372101 () ListLongMap!8661)

(declare-fun lt!372100 () (_ BitVec 64))

(declare-fun lt!372102 () V!24859)

(declare-fun lt!372104 () (_ BitVec 64))

(assert (=> b!825173 (not (contains!4154 (+!1913 lt!372101 (tuple2!9837 lt!372100 lt!372102)) lt!372104))))

(assert (=> b!825173 (= lt!372103 (addStillNotContains!187 lt!372101 lt!372100 lt!372102 lt!372104))))

(assert (=> b!825173 (= lt!372104 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!825173 (= lt!372102 (get!11704 (select (arr!22034 _values!788) #b00000000000000000000000000000000) (dynLambda!968 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!825173 (= lt!372100 (select (arr!22033 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!825173 (= lt!372101 call!35884)))

(assert (=> b!825173 (= e!459143 (+!1913 call!35884 (tuple2!9837 (select (arr!22033 _keys!976) #b00000000000000000000000000000000) (get!11704 (select (arr!22034 _values!788) #b00000000000000000000000000000000) (dynLambda!968 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!825174 () Bool)

(assert (=> b!825174 (= e!459144 (isEmpty!648 lt!372099))))

(declare-fun b!825175 () Bool)

(assert (=> b!825175 (= e!459145 (validKeyInArray!0 (select (arr!22033 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!825175 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!825176 () Bool)

(assert (=> b!825176 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22453 _keys!976)))))

(assert (=> b!825176 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22454 _values!788)))))

(declare-fun e!459141 () Bool)

(assert (=> b!825176 (= e!459141 (= (apply!360 lt!372099 (select (arr!22033 _keys!976) #b00000000000000000000000000000000)) (get!11704 (select (arr!22034 _values!788) #b00000000000000000000000000000000) (dynLambda!968 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!825177 () Bool)

(assert (=> b!825177 (= e!459139 e!459141)))

(assert (=> b!825177 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22453 _keys!976)))))

(declare-fun res!562332 () Bool)

(assert (=> b!825177 (= res!562332 (contains!4154 lt!372099 (select (arr!22033 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!825177 (=> (not res!562332) (not e!459141))))

(declare-fun bm!35881 () Bool)

(assert (=> bm!35881 (= call!35884 (getCurrentListMapNoExtraKeys!2429 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(assert (= (and d!105259 c!89666) b!825171))

(assert (= (and d!105259 (not c!89666)) b!825169))

(assert (= (and b!825169 c!89664) b!825173))

(assert (= (and b!825169 (not c!89664)) b!825166))

(assert (= (or b!825173 b!825166) bm!35881))

(assert (= (and d!105259 res!562333) b!825170))

(assert (= (and b!825170 res!562330) b!825172))

(assert (= (and b!825172 res!562331) b!825175))

(assert (= (and b!825172 c!89665) b!825177))

(assert (= (and b!825172 (not c!89665)) b!825168))

(assert (= (and b!825177 res!562332) b!825176))

(assert (= (and b!825168 c!89667) b!825167))

(assert (= (and b!825168 (not c!89667)) b!825174))

(declare-fun b_lambda!11097 () Bool)

(assert (=> (not b_lambda!11097) (not b!825173)))

(assert (=> b!825173 t!21959))

(declare-fun b_and!22099 () Bool)

(assert (= b_and!22097 (and (=> t!21959 result!7935) b_and!22099)))

(declare-fun b_lambda!11099 () Bool)

(assert (=> (not b_lambda!11099) (not b!825176)))

(assert (=> b!825176 t!21959))

(declare-fun b_and!22101 () Bool)

(assert (= b_and!22099 (and (=> t!21959 result!7935) b_and!22101)))

(declare-fun m!767677 () Bool)

(assert (=> d!105259 m!767677))

(assert (=> d!105259 m!767589))

(assert (=> b!825177 m!767633))

(assert (=> b!825177 m!767633))

(declare-fun m!767679 () Bool)

(assert (=> b!825177 m!767679))

(declare-fun m!767681 () Bool)

(assert (=> bm!35881 m!767681))

(assert (=> b!825176 m!767633))

(declare-fun m!767683 () Bool)

(assert (=> b!825176 m!767683))

(assert (=> b!825176 m!767659))

(assert (=> b!825176 m!767661))

(assert (=> b!825176 m!767659))

(assert (=> b!825176 m!767663))

(assert (=> b!825176 m!767661))

(assert (=> b!825176 m!767633))

(assert (=> b!825175 m!767633))

(assert (=> b!825175 m!767633))

(assert (=> b!825175 m!767637))

(declare-fun m!767685 () Bool)

(assert (=> b!825173 m!767685))

(assert (=> b!825173 m!767659))

(assert (=> b!825173 m!767685))

(declare-fun m!767687 () Bool)

(assert (=> b!825173 m!767687))

(declare-fun m!767689 () Bool)

(assert (=> b!825173 m!767689))

(assert (=> b!825173 m!767661))

(assert (=> b!825173 m!767659))

(assert (=> b!825173 m!767663))

(assert (=> b!825173 m!767661))

(declare-fun m!767691 () Bool)

(assert (=> b!825173 m!767691))

(assert (=> b!825173 m!767633))

(assert (=> b!825167 m!767681))

(declare-fun m!767693 () Bool)

(assert (=> b!825170 m!767693))

(declare-fun m!767695 () Bool)

(assert (=> b!825174 m!767695))

(assert (=> b!825169 m!767633))

(assert (=> b!825169 m!767633))

(assert (=> b!825169 m!767637))

(assert (=> b!825057 d!105259))

(declare-fun condMapEmpty!23965 () Bool)

(declare-fun mapDefault!23965 () ValueCell!7031)

(assert (=> mapNonEmpty!23956 (= condMapEmpty!23965 (= mapRest!23956 ((as const (Array (_ BitVec 32) ValueCell!7031)) mapDefault!23965)))))

(declare-fun e!459151 () Bool)

(declare-fun mapRes!23965 () Bool)

(assert (=> mapNonEmpty!23956 (= tp!46300 (and e!459151 mapRes!23965))))

(declare-fun mapNonEmpty!23965 () Bool)

(declare-fun tp!46315 () Bool)

(declare-fun e!459150 () Bool)

(assert (=> mapNonEmpty!23965 (= mapRes!23965 (and tp!46315 e!459150))))

(declare-fun mapRest!23965 () (Array (_ BitVec 32) ValueCell!7031))

(declare-fun mapKey!23965 () (_ BitVec 32))

(declare-fun mapValue!23965 () ValueCell!7031)

(assert (=> mapNonEmpty!23965 (= mapRest!23956 (store mapRest!23965 mapKey!23965 mapValue!23965))))

(declare-fun mapIsEmpty!23965 () Bool)

(assert (=> mapIsEmpty!23965 mapRes!23965))

(declare-fun b!825185 () Bool)

(assert (=> b!825185 (= e!459151 tp_is_empty!14893)))

(declare-fun b!825184 () Bool)

(assert (=> b!825184 (= e!459150 tp_is_empty!14893)))

(assert (= (and mapNonEmpty!23956 condMapEmpty!23965) mapIsEmpty!23965))

(assert (= (and mapNonEmpty!23956 (not condMapEmpty!23965)) mapNonEmpty!23965))

(assert (= (and mapNonEmpty!23965 ((_ is ValueCellFull!7031) mapValue!23965)) b!825184))

(assert (= (and mapNonEmpty!23956 ((_ is ValueCellFull!7031) mapDefault!23965)) b!825185))

(declare-fun m!767697 () Bool)

(assert (=> mapNonEmpty!23965 m!767697))

(declare-fun b_lambda!11101 () Bool)

(assert (= b_lambda!11097 (or (and start!71132 b_free!13183) b_lambda!11101)))

(declare-fun b_lambda!11103 () Bool)

(assert (= b_lambda!11093 (or (and start!71132 b_free!13183) b_lambda!11103)))

(declare-fun b_lambda!11105 () Bool)

(assert (= b_lambda!11095 (or (and start!71132 b_free!13183) b_lambda!11105)))

(declare-fun b_lambda!11107 () Bool)

(assert (= b_lambda!11099 (or (and start!71132 b_free!13183) b_lambda!11107)))

(check-sat (not b!825155) (not b_lambda!11101) (not d!105259) (not bm!35881) (not bm!35874) (not b!825112) (not b!825173) (not d!105257) (not b!825175) (not b!825156) (not b_lambda!11107) (not b!825160) (not b!825113) (not bm!35880) tp_is_empty!14893 (not b!825167) (not b!825161) (not d!105255) (not b_lambda!11105) (not b!825124) (not b_next!13183) (not b_lambda!11103) (not b!825125) (not bm!35877) (not b!825162) b_and!22101 (not b!825159) (not b!825169) (not b!825176) (not b!825153) (not b!825114) (not b!825163) (not b!825177) (not mapNonEmpty!23965) (not b!825170) (not b!825174))
(check-sat b_and!22101 (not b_next!13183))
