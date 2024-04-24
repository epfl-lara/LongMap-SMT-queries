; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110552 () Bool)

(assert start!110552)

(declare-fun b_free!29311 () Bool)

(declare-fun b_next!29311 () Bool)

(assert (=> start!110552 (= b_free!29311 (not b_next!29311))))

(declare-fun tp!103101 () Bool)

(declare-fun b_and!47519 () Bool)

(assert (=> start!110552 (= tp!103101 b_and!47519)))

(declare-datatypes ((V!51705 0))(
  ( (V!51706 (val!17550 Int)) )
))
(declare-fun minValue!1387 () V!51705)

(declare-fun c!125887 () Bool)

(declare-datatypes ((tuple2!22682 0))(
  ( (tuple2!22683 (_1!11352 (_ BitVec 64)) (_2!11352 V!51705)) )
))
(declare-datatypes ((List!29824 0))(
  ( (Nil!29821) (Cons!29820 (h!31038 tuple2!22682) (t!43420 List!29824)) )
))
(declare-datatypes ((ListLongMap!20347 0))(
  ( (ListLongMap!20348 (toList!10189 List!29824)) )
))
(declare-fun lt!585176 () ListLongMap!20347)

(declare-fun lt!585177 () ListLongMap!20347)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!585169 () ListLongMap!20347)

(declare-fun bm!64572 () Bool)

(declare-datatypes ((Unit!43221 0))(
  ( (Unit!43222) )
))
(declare-fun call!64585 () Unit!43221)

(declare-fun c!125888 () Bool)

(declare-fun zeroValue!1387 () V!51705)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!101 ((_ BitVec 64) (_ BitVec 64) V!51705 ListLongMap!20347) Unit!43221)

(assert (=> bm!64572 (= call!64585 (lemmaInListMapAfterAddingDiffThenInBefore!101 k0!1205 (ite (or c!125887 c!125888) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125887 c!125888) zeroValue!1387 minValue!1387) (ite c!125887 lt!585169 (ite c!125888 lt!585177 lt!585176))))))

(declare-fun b!1307062 () Bool)

(declare-fun res!867504 () Bool)

(declare-fun e!745675 () Bool)

(assert (=> b!1307062 (=> (not res!867504) (not e!745675))))

(declare-datatypes ((array!86965 0))(
  ( (array!86966 (arr!41964 (Array (_ BitVec 32) (_ BitVec 64))) (size!42515 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86965)

(declare-datatypes ((List!29825 0))(
  ( (Nil!29822) (Cons!29821 (h!31039 (_ BitVec 64)) (t!43421 List!29825)) )
))
(declare-fun arrayNoDuplicates!0 (array!86965 (_ BitVec 32) List!29825) Bool)

(assert (=> b!1307062 (= res!867504 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29822))))

(declare-fun call!64577 () ListLongMap!20347)

(declare-fun bm!64573 () Bool)

(declare-fun +!4541 (ListLongMap!20347 tuple2!22682) ListLongMap!20347)

(assert (=> bm!64573 (= call!64577 (+!4541 (ite c!125887 lt!585169 (ite c!125888 lt!585177 lt!585176)) (ite c!125887 (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387) (ite c!125888 (tuple2!22683 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun bm!64575 () Bool)

(declare-fun call!64580 () ListLongMap!20347)

(assert (=> bm!64575 (= call!64580 call!64577)))

(declare-fun call!64583 () Bool)

(declare-fun bm!64576 () Bool)

(declare-fun lt!585168 () ListLongMap!20347)

(declare-fun contains!8346 (ListLongMap!20347 (_ BitVec 64)) Bool)

(assert (=> bm!64576 (= call!64583 (contains!8346 (ite c!125887 lt!585168 (ite c!125888 lt!585177 lt!585176)) k0!1205))))

(declare-fun b!1307063 () Bool)

(declare-fun res!867501 () Bool)

(assert (=> b!1307063 (=> (not res!867501) (not e!745675))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1307063 (= res!867501 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42515 _keys!1741))))))

(declare-fun call!64582 () Unit!43221)

(declare-fun bm!64577 () Bool)

(declare-fun addStillNotContains!491 (ListLongMap!20347 (_ BitVec 64) V!51705 (_ BitVec 64)) Unit!43221)

(assert (=> bm!64577 (= call!64582 (addStillNotContains!491 (ite c!125887 lt!585169 (ite c!125888 lt!585177 lt!585176)) (ite (or c!125887 c!125888) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125887 c!125888) zeroValue!1387 minValue!1387) k0!1205))))

(declare-fun mapNonEmpty!54037 () Bool)

(declare-fun mapRes!54037 () Bool)

(declare-fun tp!103102 () Bool)

(declare-fun e!745679 () Bool)

(assert (=> mapNonEmpty!54037 (= mapRes!54037 (and tp!103102 e!745679))))

(declare-datatypes ((ValueCell!16577 0))(
  ( (ValueCellFull!16577 (v!20170 V!51705)) (EmptyCell!16577) )
))
(declare-fun mapRest!54037 () (Array (_ BitVec 32) ValueCell!16577))

(declare-fun mapKey!54037 () (_ BitVec 32))

(declare-fun mapValue!54037 () ValueCell!16577)

(declare-datatypes ((array!86967 0))(
  ( (array!86968 (arr!41965 (Array (_ BitVec 32) ValueCell!16577)) (size!42516 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86967)

(assert (=> mapNonEmpty!54037 (= (arr!41965 _values!1445) (store mapRest!54037 mapKey!54037 mapValue!54037))))

(declare-fun bm!64578 () Bool)

(declare-fun call!64576 () Bool)

(declare-fun call!64579 () Bool)

(assert (=> bm!64578 (= call!64576 call!64579)))

(declare-fun b!1307064 () Bool)

(declare-fun tp_is_empty!34951 () Bool)

(assert (=> b!1307064 (= e!745679 tp_is_empty!34951)))

(declare-fun b!1307065 () Bool)

(declare-fun res!867506 () Bool)

(assert (=> b!1307065 (=> (not res!867506) (not e!745675))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1307065 (= res!867506 (and (= (size!42516 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42515 _keys!1741) (size!42516 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1307066 () Bool)

(declare-fun e!745673 () Unit!43221)

(declare-fun e!745676 () Unit!43221)

(assert (=> b!1307066 (= e!745673 e!745676)))

(declare-fun lt!585181 () Bool)

(assert (=> b!1307066 (= c!125888 (and (not lt!585181) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!64575 () ListLongMap!20347)

(declare-fun bm!64579 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6180 (array!86965 array!86967 (_ BitVec 32) (_ BitVec 32) V!51705 V!51705 (_ BitVec 32) Int) ListLongMap!20347)

(assert (=> bm!64579 (= call!64575 (getCurrentListMapNoExtraKeys!6180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1307067 () Bool)

(declare-fun res!867507 () Bool)

(assert (=> b!1307067 (=> (not res!867507) (not e!745675))))

(assert (=> b!1307067 (= res!867507 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42515 _keys!1741))))))

(declare-fun b!1307068 () Bool)

(declare-fun e!745677 () Unit!43221)

(declare-fun lt!585174 () Unit!43221)

(assert (=> b!1307068 (= e!745677 lt!585174)))

(declare-fun call!64578 () ListLongMap!20347)

(assert (=> b!1307068 (= lt!585176 call!64578)))

(declare-fun lt!585173 () Unit!43221)

(declare-fun call!64586 () Unit!43221)

(assert (=> b!1307068 (= lt!585173 call!64586)))

(assert (=> b!1307068 (not call!64576)))

(declare-fun call!64581 () Unit!43221)

(assert (=> b!1307068 (= lt!585174 call!64581)))

(declare-fun call!64584 () Bool)

(assert (=> b!1307068 call!64584))

(declare-fun res!867502 () Bool)

(assert (=> start!110552 (=> (not res!867502) (not e!745675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110552 (= res!867502 (validMask!0 mask!2175))))

(assert (=> start!110552 e!745675))

(assert (=> start!110552 tp_is_empty!34951))

(assert (=> start!110552 true))

(declare-fun e!745674 () Bool)

(declare-fun array_inv!31983 (array!86967) Bool)

(assert (=> start!110552 (and (array_inv!31983 _values!1445) e!745674)))

(declare-fun array_inv!31984 (array!86965) Bool)

(assert (=> start!110552 (array_inv!31984 _keys!1741)))

(assert (=> start!110552 tp!103101))

(declare-fun bm!64574 () Bool)

(assert (=> bm!64574 (= call!64578 call!64575)))

(declare-fun b!1307069 () Bool)

(declare-fun c!125886 () Bool)

(assert (=> b!1307069 (= c!125886 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!585181))))

(assert (=> b!1307069 (= e!745676 e!745677)))

(declare-fun b!1307070 () Bool)

(declare-fun e!745678 () Bool)

(assert (=> b!1307070 (= e!745674 (and e!745678 mapRes!54037))))

(declare-fun condMapEmpty!54037 () Bool)

(declare-fun mapDefault!54037 () ValueCell!16577)

(assert (=> b!1307070 (= condMapEmpty!54037 (= (arr!41965 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16577)) mapDefault!54037)))))

(declare-fun b!1307071 () Bool)

(declare-fun lt!585172 () Unit!43221)

(assert (=> b!1307071 (= e!745673 lt!585172)))

(assert (=> b!1307071 (= lt!585169 call!64575)))

(declare-fun lt!585171 () Unit!43221)

(assert (=> b!1307071 (= lt!585171 call!64582)))

(assert (=> b!1307071 (= lt!585168 (+!4541 lt!585169 (tuple2!22683 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (=> b!1307071 (not call!64583)))

(declare-fun lt!585180 () Unit!43221)

(assert (=> b!1307071 (= lt!585180 (addStillNotContains!491 lt!585169 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1307071 (not (contains!8346 call!64577 k0!1205))))

(declare-fun lt!585170 () Unit!43221)

(assert (=> b!1307071 (= lt!585170 (lemmaInListMapAfterAddingDiffThenInBefore!101 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!585168))))

(assert (=> b!1307071 false))

(assert (=> b!1307071 (= lt!585172 call!64585)))

(declare-fun lt!585178 () Bool)

(assert (=> b!1307071 (= lt!585178 call!64579)))

(declare-fun b!1307072 () Bool)

(assert (=> b!1307072 call!64584))

(declare-fun lt!585179 () Unit!43221)

(assert (=> b!1307072 (= lt!585179 call!64581)))

(assert (=> b!1307072 (not call!64576)))

(declare-fun lt!585167 () Unit!43221)

(assert (=> b!1307072 (= lt!585167 call!64586)))

(assert (=> b!1307072 (= lt!585177 call!64578)))

(assert (=> b!1307072 (= e!745676 lt!585179)))

(declare-fun b!1307073 () Bool)

(declare-fun res!867505 () Bool)

(assert (=> b!1307073 (=> (not res!867505) (not e!745675))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1307073 (= res!867505 (not (validKeyInArray!0 (select (arr!41964 _keys!1741) from!2144))))))

(declare-fun b!1307074 () Bool)

(assert (=> b!1307074 (= e!745675 (not true))))

(declare-fun lt!585175 () Unit!43221)

(assert (=> b!1307074 (= lt!585175 e!745673)))

(assert (=> b!1307074 (= c!125887 (and (not lt!585181) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1307074 (= lt!585181 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1307074 (not (contains!8346 (ListLongMap!20348 Nil!29821) k0!1205))))

(declare-fun lt!585166 () Unit!43221)

(declare-fun emptyContainsNothing!236 ((_ BitVec 64)) Unit!43221)

(assert (=> b!1307074 (= lt!585166 (emptyContainsNothing!236 k0!1205))))

(declare-fun bm!64580 () Bool)

(assert (=> bm!64580 (= call!64581 call!64585)))

(declare-fun mapIsEmpty!54037 () Bool)

(assert (=> mapIsEmpty!54037 mapRes!54037))

(declare-fun b!1307075 () Bool)

(declare-fun Unit!43223 () Unit!43221)

(assert (=> b!1307075 (= e!745677 Unit!43223)))

(declare-fun b!1307076 () Bool)

(assert (=> b!1307076 (= e!745678 tp_is_empty!34951)))

(declare-fun bm!64581 () Bool)

(assert (=> bm!64581 (= call!64579 (contains!8346 (ite c!125887 lt!585169 call!64580) k0!1205))))

(declare-fun bm!64582 () Bool)

(assert (=> bm!64582 (= call!64586 call!64582)))

(declare-fun b!1307077 () Bool)

(declare-fun res!867503 () Bool)

(assert (=> b!1307077 (=> (not res!867503) (not e!745675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86965 (_ BitVec 32)) Bool)

(assert (=> b!1307077 (= res!867503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1307078 () Bool)

(declare-fun res!867500 () Bool)

(assert (=> b!1307078 (=> (not res!867500) (not e!745675))))

(declare-fun getCurrentListMap!5195 (array!86965 array!86967 (_ BitVec 32) (_ BitVec 32) V!51705 V!51705 (_ BitVec 32) Int) ListLongMap!20347)

(assert (=> b!1307078 (= res!867500 (contains!8346 (getCurrentListMap!5195 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun bm!64583 () Bool)

(assert (=> bm!64583 (= call!64584 call!64583)))

(assert (= (and start!110552 res!867502) b!1307065))

(assert (= (and b!1307065 res!867506) b!1307077))

(assert (= (and b!1307077 res!867503) b!1307062))

(assert (= (and b!1307062 res!867504) b!1307067))

(assert (= (and b!1307067 res!867507) b!1307078))

(assert (= (and b!1307078 res!867500) b!1307063))

(assert (= (and b!1307063 res!867501) b!1307073))

(assert (= (and b!1307073 res!867505) b!1307074))

(assert (= (and b!1307074 c!125887) b!1307071))

(assert (= (and b!1307074 (not c!125887)) b!1307066))

(assert (= (and b!1307066 c!125888) b!1307072))

(assert (= (and b!1307066 (not c!125888)) b!1307069))

(assert (= (and b!1307069 c!125886) b!1307068))

(assert (= (and b!1307069 (not c!125886)) b!1307075))

(assert (= (or b!1307072 b!1307068) bm!64574))

(assert (= (or b!1307072 b!1307068) bm!64580))

(assert (= (or b!1307072 b!1307068) bm!64582))

(assert (= (or b!1307072 b!1307068) bm!64575))

(assert (= (or b!1307072 b!1307068) bm!64583))

(assert (= (or b!1307072 b!1307068) bm!64578))

(assert (= (or b!1307071 bm!64583) bm!64576))

(assert (= (or b!1307071 bm!64575) bm!64573))

(assert (= (or b!1307071 bm!64574) bm!64579))

(assert (= (or b!1307071 bm!64580) bm!64572))

(assert (= (or b!1307071 bm!64578) bm!64581))

(assert (= (or b!1307071 bm!64582) bm!64577))

(assert (= (and b!1307070 condMapEmpty!54037) mapIsEmpty!54037))

(assert (= (and b!1307070 (not condMapEmpty!54037)) mapNonEmpty!54037))

(get-info :version)

(assert (= (and mapNonEmpty!54037 ((_ is ValueCellFull!16577) mapValue!54037)) b!1307064))

(assert (= (and b!1307070 ((_ is ValueCellFull!16577) mapDefault!54037)) b!1307076))

(assert (= start!110552 b!1307070))

(declare-fun m!1198591 () Bool)

(assert (=> bm!64576 m!1198591))

(declare-fun m!1198593 () Bool)

(assert (=> bm!64581 m!1198593))

(declare-fun m!1198595 () Bool)

(assert (=> b!1307062 m!1198595))

(declare-fun m!1198597 () Bool)

(assert (=> bm!64573 m!1198597))

(declare-fun m!1198599 () Bool)

(assert (=> b!1307074 m!1198599))

(declare-fun m!1198601 () Bool)

(assert (=> b!1307074 m!1198601))

(declare-fun m!1198603 () Bool)

(assert (=> b!1307071 m!1198603))

(declare-fun m!1198605 () Bool)

(assert (=> b!1307071 m!1198605))

(declare-fun m!1198607 () Bool)

(assert (=> b!1307071 m!1198607))

(declare-fun m!1198609 () Bool)

(assert (=> b!1307071 m!1198609))

(declare-fun m!1198611 () Bool)

(assert (=> bm!64572 m!1198611))

(declare-fun m!1198613 () Bool)

(assert (=> bm!64579 m!1198613))

(declare-fun m!1198615 () Bool)

(assert (=> b!1307077 m!1198615))

(declare-fun m!1198617 () Bool)

(assert (=> b!1307073 m!1198617))

(assert (=> b!1307073 m!1198617))

(declare-fun m!1198619 () Bool)

(assert (=> b!1307073 m!1198619))

(declare-fun m!1198621 () Bool)

(assert (=> mapNonEmpty!54037 m!1198621))

(declare-fun m!1198623 () Bool)

(assert (=> bm!64577 m!1198623))

(declare-fun m!1198625 () Bool)

(assert (=> b!1307078 m!1198625))

(assert (=> b!1307078 m!1198625))

(declare-fun m!1198627 () Bool)

(assert (=> b!1307078 m!1198627))

(declare-fun m!1198629 () Bool)

(assert (=> start!110552 m!1198629))

(declare-fun m!1198631 () Bool)

(assert (=> start!110552 m!1198631))

(declare-fun m!1198633 () Bool)

(assert (=> start!110552 m!1198633))

(check-sat (not b!1307074) (not bm!64581) (not bm!64576) (not b_next!29311) (not b!1307077) (not bm!64572) b_and!47519 (not b!1307073) tp_is_empty!34951 (not b!1307078) (not b!1307062) (not b!1307071) (not bm!64573) (not start!110552) (not bm!64577) (not mapNonEmpty!54037) (not bm!64579))
(check-sat b_and!47519 (not b_next!29311))
