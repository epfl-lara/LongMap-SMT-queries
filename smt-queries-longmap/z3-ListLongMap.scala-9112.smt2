; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109456 () Bool)

(assert start!109456)

(declare-fun b_free!28945 () Bool)

(declare-fun b_next!28945 () Bool)

(assert (=> start!109456 (= b_free!28945 (not b_next!28945))))

(declare-fun tp!101955 () Bool)

(declare-fun b_and!47017 () Bool)

(assert (=> start!109456 (= tp!101955 b_and!47017)))

(declare-fun bm!63188 () Bool)

(declare-fun call!63191 () Bool)

(declare-fun call!63196 () Bool)

(assert (=> bm!63188 (= call!63191 call!63196)))

(declare-fun mapIsEmpty!53438 () Bool)

(declare-fun mapRes!53438 () Bool)

(assert (=> mapIsEmpty!53438 mapRes!53438))

(declare-fun b!1296077 () Bool)

(declare-fun e!739454 () Bool)

(assert (=> b!1296077 (= e!739454 (not true))))

(declare-datatypes ((Unit!42778 0))(
  ( (Unit!42779) )
))
(declare-fun lt!579934 () Unit!42778)

(declare-fun e!739460 () Unit!42778)

(assert (=> b!1296077 (= lt!579934 e!739460)))

(declare-fun c!124324 () Bool)

(declare-fun lt!579929 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1296077 (= c!124324 (and (not lt!579929) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1296077 (= lt!579929 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!51217 0))(
  ( (V!51218 (val!17367 Int)) )
))
(declare-datatypes ((tuple2!22424 0))(
  ( (tuple2!22425 (_1!11223 (_ BitVec 64)) (_2!11223 V!51217)) )
))
(declare-datatypes ((List!29554 0))(
  ( (Nil!29551) (Cons!29550 (h!30759 tuple2!22424) (t!43110 List!29554)) )
))
(declare-datatypes ((ListLongMap!20081 0))(
  ( (ListLongMap!20082 (toList!10056 List!29554)) )
))
(declare-fun contains!8104 (ListLongMap!20081 (_ BitVec 64)) Bool)

(assert (=> b!1296077 (not (contains!8104 (ListLongMap!20082 Nil!29551) k0!1205))))

(declare-fun lt!579931 () Unit!42778)

(declare-fun emptyContainsNothing!181 ((_ BitVec 64)) Unit!42778)

(assert (=> b!1296077 (= lt!579931 (emptyContainsNothing!181 k0!1205))))

(declare-fun bm!63189 () Bool)

(declare-fun call!63202 () ListLongMap!20081)

(declare-fun call!63199 () ListLongMap!20081)

(assert (=> bm!63189 (= call!63202 call!63199)))

(declare-fun b!1296078 () Bool)

(declare-fun res!861470 () Bool)

(assert (=> b!1296078 (=> (not res!861470) (not e!739454))))

(declare-datatypes ((array!86081 0))(
  ( (array!86082 (arr!41542 (Array (_ BitVec 32) (_ BitVec 64))) (size!42094 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86081)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1296078 (= res!861470 (not (validKeyInArray!0 (select (arr!41542 _keys!1741) from!2144))))))

(declare-fun b!1296079 () Bool)

(declare-fun res!861473 () Bool)

(assert (=> b!1296079 (=> (not res!861473) (not e!739454))))

(assert (=> b!1296079 (= res!861473 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42094 _keys!1741))))))

(declare-fun b!1296080 () Bool)

(declare-fun e!739461 () Unit!42778)

(declare-fun lt!579922 () Unit!42778)

(assert (=> b!1296080 (= e!739461 lt!579922)))

(declare-fun lt!579930 () ListLongMap!20081)

(assert (=> b!1296080 (= lt!579930 call!63202)))

(declare-fun lt!579919 () Unit!42778)

(declare-fun call!63193 () Unit!42778)

(assert (=> b!1296080 (= lt!579919 call!63193)))

(declare-fun call!63201 () Bool)

(assert (=> b!1296080 (not call!63201)))

(declare-fun call!63194 () Unit!42778)

(assert (=> b!1296080 (= lt!579922 call!63194)))

(assert (=> b!1296080 call!63191))

(declare-fun bm!63190 () Bool)

(declare-fun call!63192 () Bool)

(assert (=> bm!63190 (= call!63201 call!63192)))

(declare-fun bm!63191 () Bool)

(declare-fun call!63197 () Unit!42778)

(assert (=> bm!63191 (= call!63193 call!63197)))

(declare-fun b!1296081 () Bool)

(declare-fun e!739455 () Bool)

(declare-fun tp_is_empty!34585 () Bool)

(assert (=> b!1296081 (= e!739455 tp_is_empty!34585)))

(declare-fun b!1296082 () Bool)

(declare-fun res!861468 () Bool)

(assert (=> b!1296082 (=> (not res!861468) (not e!739454))))

(declare-datatypes ((List!29555 0))(
  ( (Nil!29552) (Cons!29551 (h!30760 (_ BitVec 64)) (t!43111 List!29555)) )
))
(declare-fun arrayNoDuplicates!0 (array!86081 (_ BitVec 32) List!29555) Bool)

(assert (=> b!1296082 (= res!861468 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29552))))

(declare-fun b!1296083 () Bool)

(declare-fun e!739456 () Unit!42778)

(assert (=> b!1296083 (= e!739460 e!739456)))

(declare-fun c!124325 () Bool)

(assert (=> b!1296083 (= c!124325 (and (not lt!579929) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun minValue!1387 () V!51217)

(declare-fun lt!579932 () ListLongMap!20081)

(declare-fun call!63200 () ListLongMap!20081)

(declare-fun zeroValue!1387 () V!51217)

(declare-fun bm!63192 () Bool)

(declare-fun lt!579920 () ListLongMap!20081)

(declare-fun +!4465 (ListLongMap!20081 tuple2!22424) ListLongMap!20081)

(assert (=> bm!63192 (= call!63200 (+!4465 (ite c!124324 lt!579920 (ite c!124325 lt!579932 lt!579930)) (ite c!124324 (tuple2!22425 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387) (ite c!124325 (tuple2!22425 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22425 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1296084 () Bool)

(declare-fun e!739459 () Bool)

(assert (=> b!1296084 (= e!739459 tp_is_empty!34585)))

(declare-fun res!861474 () Bool)

(assert (=> start!109456 (=> (not res!861474) (not e!739454))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109456 (= res!861474 (validMask!0 mask!2175))))

(assert (=> start!109456 e!739454))

(assert (=> start!109456 tp_is_empty!34585))

(assert (=> start!109456 true))

(declare-datatypes ((ValueCell!16394 0))(
  ( (ValueCellFull!16394 (v!19969 V!51217)) (EmptyCell!16394) )
))
(declare-datatypes ((array!86083 0))(
  ( (array!86084 (arr!41543 (Array (_ BitVec 32) ValueCell!16394)) (size!42095 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86083)

(declare-fun e!739457 () Bool)

(declare-fun array_inv!31611 (array!86083) Bool)

(assert (=> start!109456 (and (array_inv!31611 _values!1445) e!739457)))

(declare-fun array_inv!31612 (array!86081) Bool)

(assert (=> start!109456 (array_inv!31612 _keys!1741)))

(assert (=> start!109456 tp!101955))

(declare-fun b!1296085 () Bool)

(declare-fun Unit!42780 () Unit!42778)

(assert (=> b!1296085 (= e!739461 Unit!42780)))

(declare-fun bm!63193 () Bool)

(declare-fun addStillNotContains!442 (ListLongMap!20081 (_ BitVec 64) V!51217 (_ BitVec 64)) Unit!42778)

(assert (=> bm!63193 (= call!63197 (addStillNotContains!442 (ite c!124324 lt!579920 (ite c!124325 lt!579932 lt!579930)) (ite (or c!124324 c!124325) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124324 c!124325) zeroValue!1387 minValue!1387) k0!1205))))

(declare-fun bm!63194 () Bool)

(declare-fun call!63195 () Unit!42778)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!65 ((_ BitVec 64) (_ BitVec 64) V!51217 ListLongMap!20081) Unit!42778)

(assert (=> bm!63194 (= call!63195 (lemmaInListMapAfterAddingDiffThenInBefore!65 k0!1205 (ite (or c!124324 c!124325) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124324 c!124325) zeroValue!1387 minValue!1387) (ite c!124324 lt!579920 (ite c!124325 lt!579932 lt!579930))))))

(declare-fun bm!63195 () Bool)

(assert (=> bm!63195 (= call!63194 call!63195)))

(declare-fun bm!63196 () Bool)

(declare-fun call!63198 () ListLongMap!20081)

(assert (=> bm!63196 (= call!63192 (contains!8104 (ite c!124324 lt!579920 call!63198) k0!1205))))

(declare-fun b!1296086 () Bool)

(declare-fun c!124326 () Bool)

(assert (=> b!1296086 (= c!124326 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!579929))))

(assert (=> b!1296086 (= e!739456 e!739461)))

(declare-fun bm!63197 () Bool)

(assert (=> bm!63197 (= call!63198 call!63200)))

(declare-fun b!1296087 () Bool)

(declare-fun res!861469 () Bool)

(assert (=> b!1296087 (=> (not res!861469) (not e!739454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86081 (_ BitVec 32)) Bool)

(assert (=> b!1296087 (= res!861469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296088 () Bool)

(assert (=> b!1296088 (= e!739457 (and e!739459 mapRes!53438))))

(declare-fun condMapEmpty!53438 () Bool)

(declare-fun mapDefault!53438 () ValueCell!16394)

(assert (=> b!1296088 (= condMapEmpty!53438 (= (arr!41543 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16394)) mapDefault!53438)))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun bm!63198 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6099 (array!86081 array!86083 (_ BitVec 32) (_ BitVec 32) V!51217 V!51217 (_ BitVec 32) Int) ListLongMap!20081)

(assert (=> bm!63198 (= call!63199 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1296089 () Bool)

(declare-fun lt!579926 () Unit!42778)

(assert (=> b!1296089 (= e!739460 lt!579926)))

(assert (=> b!1296089 (= lt!579920 call!63199)))

(declare-fun lt!579924 () Unit!42778)

(assert (=> b!1296089 (= lt!579924 call!63197)))

(declare-fun lt!579927 () ListLongMap!20081)

(assert (=> b!1296089 (= lt!579927 (+!4465 lt!579920 (tuple2!22425 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (=> b!1296089 (not call!63196)))

(declare-fun lt!579925 () Unit!42778)

(assert (=> b!1296089 (= lt!579925 (addStillNotContains!442 lt!579920 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1296089 (not (contains!8104 call!63200 k0!1205))))

(declare-fun lt!579933 () Unit!42778)

(assert (=> b!1296089 (= lt!579933 (lemmaInListMapAfterAddingDiffThenInBefore!65 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579927))))

(assert (=> b!1296089 false))

(assert (=> b!1296089 (= lt!579926 call!63195)))

(declare-fun lt!579923 () Bool)

(assert (=> b!1296089 (= lt!579923 call!63192)))

(declare-fun mapNonEmpty!53438 () Bool)

(declare-fun tp!101954 () Bool)

(assert (=> mapNonEmpty!53438 (= mapRes!53438 (and tp!101954 e!739455))))

(declare-fun mapValue!53438 () ValueCell!16394)

(declare-fun mapRest!53438 () (Array (_ BitVec 32) ValueCell!16394))

(declare-fun mapKey!53438 () (_ BitVec 32))

(assert (=> mapNonEmpty!53438 (= (arr!41543 _values!1445) (store mapRest!53438 mapKey!53438 mapValue!53438))))

(declare-fun b!1296090 () Bool)

(declare-fun res!861472 () Bool)

(assert (=> b!1296090 (=> (not res!861472) (not e!739454))))

(assert (=> b!1296090 (= res!861472 (and (= (size!42095 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42094 _keys!1741) (size!42095 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296091 () Bool)

(declare-fun res!861471 () Bool)

(assert (=> b!1296091 (=> (not res!861471) (not e!739454))))

(declare-fun getCurrentListMap!4977 (array!86081 array!86083 (_ BitVec 32) (_ BitVec 32) V!51217 V!51217 (_ BitVec 32) Int) ListLongMap!20081)

(assert (=> b!1296091 (= res!861471 (contains!8104 (getCurrentListMap!4977 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1296092 () Bool)

(assert (=> b!1296092 call!63191))

(declare-fun lt!579928 () Unit!42778)

(assert (=> b!1296092 (= lt!579928 call!63194)))

(assert (=> b!1296092 (not call!63201)))

(declare-fun lt!579921 () Unit!42778)

(assert (=> b!1296092 (= lt!579921 call!63193)))

(assert (=> b!1296092 (= lt!579932 call!63202)))

(assert (=> b!1296092 (= e!739456 lt!579928)))

(declare-fun b!1296093 () Bool)

(declare-fun res!861467 () Bool)

(assert (=> b!1296093 (=> (not res!861467) (not e!739454))))

(assert (=> b!1296093 (= res!861467 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42094 _keys!1741))))))

(declare-fun bm!63199 () Bool)

(assert (=> bm!63199 (= call!63196 (contains!8104 (ite c!124324 lt!579927 (ite c!124325 lt!579932 lt!579930)) k0!1205))))

(assert (= (and start!109456 res!861474) b!1296090))

(assert (= (and b!1296090 res!861472) b!1296087))

(assert (= (and b!1296087 res!861469) b!1296082))

(assert (= (and b!1296082 res!861468) b!1296079))

(assert (= (and b!1296079 res!861473) b!1296091))

(assert (= (and b!1296091 res!861471) b!1296093))

(assert (= (and b!1296093 res!861467) b!1296078))

(assert (= (and b!1296078 res!861470) b!1296077))

(assert (= (and b!1296077 c!124324) b!1296089))

(assert (= (and b!1296077 (not c!124324)) b!1296083))

(assert (= (and b!1296083 c!124325) b!1296092))

(assert (= (and b!1296083 (not c!124325)) b!1296086))

(assert (= (and b!1296086 c!124326) b!1296080))

(assert (= (and b!1296086 (not c!124326)) b!1296085))

(assert (= (or b!1296092 b!1296080) bm!63189))

(assert (= (or b!1296092 b!1296080) bm!63195))

(assert (= (or b!1296092 b!1296080) bm!63197))

(assert (= (or b!1296092 b!1296080) bm!63191))

(assert (= (or b!1296092 b!1296080) bm!63188))

(assert (= (or b!1296092 b!1296080) bm!63190))

(assert (= (or b!1296089 bm!63195) bm!63194))

(assert (= (or b!1296089 bm!63189) bm!63198))

(assert (= (or b!1296089 bm!63188) bm!63199))

(assert (= (or b!1296089 bm!63197) bm!63192))

(assert (= (or b!1296089 bm!63190) bm!63196))

(assert (= (or b!1296089 bm!63191) bm!63193))

(assert (= (and b!1296088 condMapEmpty!53438) mapIsEmpty!53438))

(assert (= (and b!1296088 (not condMapEmpty!53438)) mapNonEmpty!53438))

(get-info :version)

(assert (= (and mapNonEmpty!53438 ((_ is ValueCellFull!16394) mapValue!53438)) b!1296081))

(assert (= (and b!1296088 ((_ is ValueCellFull!16394) mapDefault!53438)) b!1296084))

(assert (= start!109456 b!1296088))

(declare-fun m!1187571 () Bool)

(assert (=> b!1296082 m!1187571))

(declare-fun m!1187573 () Bool)

(assert (=> bm!63192 m!1187573))

(declare-fun m!1187575 () Bool)

(assert (=> b!1296091 m!1187575))

(assert (=> b!1296091 m!1187575))

(declare-fun m!1187577 () Bool)

(assert (=> b!1296091 m!1187577))

(declare-fun m!1187579 () Bool)

(assert (=> bm!63193 m!1187579))

(declare-fun m!1187581 () Bool)

(assert (=> bm!63194 m!1187581))

(declare-fun m!1187583 () Bool)

(assert (=> bm!63198 m!1187583))

(declare-fun m!1187585 () Bool)

(assert (=> bm!63199 m!1187585))

(declare-fun m!1187587 () Bool)

(assert (=> b!1296087 m!1187587))

(declare-fun m!1187589 () Bool)

(assert (=> start!109456 m!1187589))

(declare-fun m!1187591 () Bool)

(assert (=> start!109456 m!1187591))

(declare-fun m!1187593 () Bool)

(assert (=> start!109456 m!1187593))

(declare-fun m!1187595 () Bool)

(assert (=> b!1296078 m!1187595))

(assert (=> b!1296078 m!1187595))

(declare-fun m!1187597 () Bool)

(assert (=> b!1296078 m!1187597))

(declare-fun m!1187599 () Bool)

(assert (=> b!1296089 m!1187599))

(declare-fun m!1187601 () Bool)

(assert (=> b!1296089 m!1187601))

(declare-fun m!1187603 () Bool)

(assert (=> b!1296089 m!1187603))

(declare-fun m!1187605 () Bool)

(assert (=> b!1296089 m!1187605))

(declare-fun m!1187607 () Bool)

(assert (=> b!1296077 m!1187607))

(declare-fun m!1187609 () Bool)

(assert (=> b!1296077 m!1187609))

(declare-fun m!1187611 () Bool)

(assert (=> mapNonEmpty!53438 m!1187611))

(declare-fun m!1187613 () Bool)

(assert (=> bm!63196 m!1187613))

(check-sat (not b!1296091) (not bm!63193) b_and!47017 (not bm!63196) (not bm!63194) (not bm!63198) (not bm!63192) (not b!1296082) (not b!1296078) tp_is_empty!34585 (not b!1296089) (not bm!63199) (not start!109456) (not b_next!28945) (not mapNonEmpty!53438) (not b!1296087) (not b!1296077))
(check-sat b_and!47017 (not b_next!28945))
