; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111962 () Bool)

(assert start!111962)

(declare-fun b_free!30535 () Bool)

(declare-fun b_next!30535 () Bool)

(assert (=> start!111962 (= b_free!30535 (not b_next!30535))))

(declare-fun tp!107089 () Bool)

(declare-fun b_and!49155 () Bool)

(assert (=> start!111962 (= tp!107089 b_and!49155)))

(declare-fun b!1326774 () Bool)

(declare-fun res!880556 () Bool)

(declare-fun e!756206 () Bool)

(assert (=> b!1326774 (=> (not res!880556) (not e!756206))))

(declare-datatypes ((array!89551 0))(
  ( (array!89552 (arr!43248 (Array (_ BitVec 32) (_ BitVec 64))) (size!43800 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89551)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53577 0))(
  ( (V!53578 (val!18252 Int)) )
))
(declare-datatypes ((ValueCell!17279 0))(
  ( (ValueCellFull!17279 (v!20885 V!53577)) (EmptyCell!17279) )
))
(declare-datatypes ((array!89553 0))(
  ( (array!89554 (arr!43249 (Array (_ BitVec 32) ValueCell!17279)) (size!43801 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89553)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1326774 (= res!880556 (and (= (size!43801 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43800 _keys!1609) (size!43801 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1326775 () Bool)

(declare-fun e!756202 () Bool)

(declare-fun tp_is_empty!36355 () Bool)

(assert (=> b!1326775 (= e!756202 tp_is_empty!36355)))

(declare-fun b!1326776 () Bool)

(declare-fun res!880552 () Bool)

(assert (=> b!1326776 (=> (not res!880552) (not e!756206))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326776 (= res!880552 (not (validKeyInArray!0 (select (arr!43248 _keys!1609) from!2000))))))

(declare-fun res!880557 () Bool)

(assert (=> start!111962 (=> (not res!880557) (not e!756206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111962 (= res!880557 (validMask!0 mask!2019))))

(assert (=> start!111962 e!756206))

(declare-fun array_inv!32813 (array!89551) Bool)

(assert (=> start!111962 (array_inv!32813 _keys!1609)))

(assert (=> start!111962 true))

(assert (=> start!111962 tp_is_empty!36355))

(declare-fun e!756203 () Bool)

(declare-fun array_inv!32814 (array!89553) Bool)

(assert (=> start!111962 (and (array_inv!32814 _values!1337) e!756203)))

(assert (=> start!111962 tp!107089))

(declare-fun mapIsEmpty!56187 () Bool)

(declare-fun mapRes!56187 () Bool)

(assert (=> mapIsEmpty!56187 mapRes!56187))

(declare-fun b!1326777 () Bool)

(declare-fun res!880555 () Bool)

(assert (=> b!1326777 (=> (not res!880555) (not e!756206))))

(declare-fun zeroValue!1279 () V!53577)

(declare-fun minValue!1279 () V!53577)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23612 0))(
  ( (tuple2!23613 (_1!11817 (_ BitVec 64)) (_2!11817 V!53577)) )
))
(declare-datatypes ((List!30738 0))(
  ( (Nil!30735) (Cons!30734 (h!31943 tuple2!23612) (t!44734 List!30738)) )
))
(declare-datatypes ((ListLongMap!21269 0))(
  ( (ListLongMap!21270 (toList!10650 List!30738)) )
))
(declare-fun contains!8736 (ListLongMap!21269 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5522 (array!89551 array!89553 (_ BitVec 32) (_ BitVec 32) V!53577 V!53577 (_ BitVec 32) Int) ListLongMap!21269)

(assert (=> b!1326777 (= res!880555 (contains!8736 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1326778 () Bool)

(declare-fun res!880558 () Bool)

(assert (=> b!1326778 (=> (not res!880558) (not e!756206))))

(declare-datatypes ((List!30739 0))(
  ( (Nil!30736) (Cons!30735 (h!31944 (_ BitVec 64)) (t!44735 List!30739)) )
))
(declare-fun arrayNoDuplicates!0 (array!89551 (_ BitVec 32) List!30739) Bool)

(assert (=> b!1326778 (= res!880558 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30736))))

(declare-fun mapNonEmpty!56187 () Bool)

(declare-fun tp!107088 () Bool)

(assert (=> mapNonEmpty!56187 (= mapRes!56187 (and tp!107088 e!756202))))

(declare-fun mapRest!56187 () (Array (_ BitVec 32) ValueCell!17279))

(declare-fun mapKey!56187 () (_ BitVec 32))

(declare-fun mapValue!56187 () ValueCell!17279)

(assert (=> mapNonEmpty!56187 (= (arr!43249 _values!1337) (store mapRest!56187 mapKey!56187 mapValue!56187))))

(declare-fun b!1326779 () Bool)

(declare-fun res!880559 () Bool)

(assert (=> b!1326779 (=> (not res!880559) (not e!756206))))

(assert (=> b!1326779 (= res!880559 (not (= (select (arr!43248 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1326780 () Bool)

(declare-fun e!756204 () Bool)

(assert (=> b!1326780 (= e!756204 tp_is_empty!36355)))

(declare-fun b!1326781 () Bool)

(declare-fun res!880554 () Bool)

(assert (=> b!1326781 (=> (not res!880554) (not e!756206))))

(assert (=> b!1326781 (= res!880554 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43800 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326782 () Bool)

(assert (=> b!1326782 (= e!756206 (not (contains!8736 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) k0!1164)))))

(declare-fun b!1326783 () Bool)

(declare-fun res!880553 () Bool)

(assert (=> b!1326783 (=> (not res!880553) (not e!756206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89551 (_ BitVec 32)) Bool)

(assert (=> b!1326783 (= res!880553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1326784 () Bool)

(assert (=> b!1326784 (= e!756203 (and e!756204 mapRes!56187))))

(declare-fun condMapEmpty!56187 () Bool)

(declare-fun mapDefault!56187 () ValueCell!17279)

(assert (=> b!1326784 (= condMapEmpty!56187 (= (arr!43249 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17279)) mapDefault!56187)))))

(assert (= (and start!111962 res!880557) b!1326774))

(assert (= (and b!1326774 res!880556) b!1326783))

(assert (= (and b!1326783 res!880553) b!1326778))

(assert (= (and b!1326778 res!880558) b!1326781))

(assert (= (and b!1326781 res!880554) b!1326777))

(assert (= (and b!1326777 res!880555) b!1326779))

(assert (= (and b!1326779 res!880559) b!1326776))

(assert (= (and b!1326776 res!880552) b!1326782))

(assert (= (and b!1326784 condMapEmpty!56187) mapIsEmpty!56187))

(assert (= (and b!1326784 (not condMapEmpty!56187)) mapNonEmpty!56187))

(get-info :version)

(assert (= (and mapNonEmpty!56187 ((_ is ValueCellFull!17279) mapValue!56187)) b!1326775))

(assert (= (and b!1326784 ((_ is ValueCellFull!17279) mapDefault!56187)) b!1326780))

(assert (= start!111962 b!1326784))

(declare-fun m!1215507 () Bool)

(assert (=> b!1326782 m!1215507))

(assert (=> b!1326782 m!1215507))

(declare-fun m!1215509 () Bool)

(assert (=> b!1326782 m!1215509))

(declare-fun m!1215511 () Bool)

(assert (=> mapNonEmpty!56187 m!1215511))

(declare-fun m!1215513 () Bool)

(assert (=> b!1326783 m!1215513))

(declare-fun m!1215515 () Bool)

(assert (=> b!1326776 m!1215515))

(assert (=> b!1326776 m!1215515))

(declare-fun m!1215517 () Bool)

(assert (=> b!1326776 m!1215517))

(declare-fun m!1215519 () Bool)

(assert (=> b!1326777 m!1215519))

(assert (=> b!1326777 m!1215519))

(declare-fun m!1215521 () Bool)

(assert (=> b!1326777 m!1215521))

(declare-fun m!1215523 () Bool)

(assert (=> b!1326778 m!1215523))

(declare-fun m!1215525 () Bool)

(assert (=> start!111962 m!1215525))

(declare-fun m!1215527 () Bool)

(assert (=> start!111962 m!1215527))

(declare-fun m!1215529 () Bool)

(assert (=> start!111962 m!1215529))

(assert (=> b!1326779 m!1215515))

(check-sat (not mapNonEmpty!56187) (not b!1326776) tp_is_empty!36355 (not b!1326782) (not start!111962) (not b!1326778) (not b!1326783) (not b_next!30535) b_and!49155 (not b!1326777))
(check-sat b_and!49155 (not b_next!30535))
(get-model)

(declare-fun d!143027 () Bool)

(assert (=> d!143027 (= (validKeyInArray!0 (select (arr!43248 _keys!1609) from!2000)) (and (not (= (select (arr!43248 _keys!1609) from!2000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43248 _keys!1609) from!2000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1326776 d!143027))

(declare-fun d!143029 () Bool)

(assert (=> d!143029 (= (validMask!0 mask!2019) (and (or (= mask!2019 #b00000000000000000000000000000111) (= mask!2019 #b00000000000000000000000000001111) (= mask!2019 #b00000000000000000000000000011111) (= mask!2019 #b00000000000000000000000000111111) (= mask!2019 #b00000000000000000000000001111111) (= mask!2019 #b00000000000000000000000011111111) (= mask!2019 #b00000000000000000000000111111111) (= mask!2019 #b00000000000000000000001111111111) (= mask!2019 #b00000000000000000000011111111111) (= mask!2019 #b00000000000000000000111111111111) (= mask!2019 #b00000000000000000001111111111111) (= mask!2019 #b00000000000000000011111111111111) (= mask!2019 #b00000000000000000111111111111111) (= mask!2019 #b00000000000000001111111111111111) (= mask!2019 #b00000000000000011111111111111111) (= mask!2019 #b00000000000000111111111111111111) (= mask!2019 #b00000000000001111111111111111111) (= mask!2019 #b00000000000011111111111111111111) (= mask!2019 #b00000000000111111111111111111111) (= mask!2019 #b00000000001111111111111111111111) (= mask!2019 #b00000000011111111111111111111111) (= mask!2019 #b00000000111111111111111111111111) (= mask!2019 #b00000001111111111111111111111111) (= mask!2019 #b00000011111111111111111111111111) (= mask!2019 #b00000111111111111111111111111111) (= mask!2019 #b00001111111111111111111111111111) (= mask!2019 #b00011111111111111111111111111111) (= mask!2019 #b00111111111111111111111111111111)) (bvsle mask!2019 #b00111111111111111111111111111111)))))

(assert (=> start!111962 d!143029))

(declare-fun d!143031 () Bool)

(assert (=> d!143031 (= (array_inv!32813 _keys!1609) (bvsge (size!43800 _keys!1609) #b00000000000000000000000000000000))))

(assert (=> start!111962 d!143031))

(declare-fun d!143033 () Bool)

(assert (=> d!143033 (= (array_inv!32814 _values!1337) (bvsge (size!43801 _values!1337) #b00000000000000000000000000000000))))

(assert (=> start!111962 d!143033))

(declare-fun d!143035 () Bool)

(declare-fun e!756241 () Bool)

(assert (=> d!143035 e!756241))

(declare-fun res!880610 () Bool)

(assert (=> d!143035 (=> res!880610 e!756241)))

(declare-fun lt!590257 () Bool)

(assert (=> d!143035 (= res!880610 (not lt!590257))))

(declare-fun lt!590256 () Bool)

(assert (=> d!143035 (= lt!590257 lt!590256)))

(declare-datatypes ((Unit!43512 0))(
  ( (Unit!43513) )
))
(declare-fun lt!590255 () Unit!43512)

(declare-fun e!756242 () Unit!43512)

(assert (=> d!143035 (= lt!590255 e!756242)))

(declare-fun c!125793 () Bool)

(assert (=> d!143035 (= c!125793 lt!590256)))

(declare-fun containsKey!734 (List!30738 (_ BitVec 64)) Bool)

(assert (=> d!143035 (= lt!590256 (containsKey!734 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(assert (=> d!143035 (= (contains!8736 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164) lt!590257)))

(declare-fun b!1326857 () Bool)

(declare-fun lt!590254 () Unit!43512)

(assert (=> b!1326857 (= e!756242 lt!590254)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!481 (List!30738 (_ BitVec 64)) Unit!43512)

(assert (=> b!1326857 (= lt!590254 (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(declare-datatypes ((Option!768 0))(
  ( (Some!767 (v!20888 V!53577)) (None!766) )
))
(declare-fun isDefined!524 (Option!768) Bool)

(declare-fun getValueByKey!717 (List!30738 (_ BitVec 64)) Option!768)

(assert (=> b!1326857 (isDefined!524 (getValueByKey!717 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(declare-fun b!1326858 () Bool)

(declare-fun Unit!43514 () Unit!43512)

(assert (=> b!1326858 (= e!756242 Unit!43514)))

(declare-fun b!1326859 () Bool)

(assert (=> b!1326859 (= e!756241 (isDefined!524 (getValueByKey!717 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164)))))

(assert (= (and d!143035 c!125793) b!1326857))

(assert (= (and d!143035 (not c!125793)) b!1326858))

(assert (= (and d!143035 (not res!880610)) b!1326859))

(declare-fun m!1215579 () Bool)

(assert (=> d!143035 m!1215579))

(declare-fun m!1215581 () Bool)

(assert (=> b!1326857 m!1215581))

(declare-fun m!1215583 () Bool)

(assert (=> b!1326857 m!1215583))

(assert (=> b!1326857 m!1215583))

(declare-fun m!1215585 () Bool)

(assert (=> b!1326857 m!1215585))

(assert (=> b!1326859 m!1215583))

(assert (=> b!1326859 m!1215583))

(assert (=> b!1326859 m!1215585))

(assert (=> b!1326777 d!143035))

(declare-fun bm!64763 () Bool)

(declare-fun call!64770 () ListLongMap!21269)

(declare-fun call!64768 () ListLongMap!21269)

(assert (=> bm!64763 (= call!64770 call!64768)))

(declare-fun b!1326902 () Bool)

(declare-fun e!756270 () Bool)

(declare-fun lt!590310 () ListLongMap!21269)

(declare-fun apply!1024 (ListLongMap!21269 (_ BitVec 64)) V!53577)

(declare-fun get!21797 (ValueCell!17279 V!53577) V!53577)

(declare-fun dynLambda!3585 (Int (_ BitVec 64)) V!53577)

(assert (=> b!1326902 (= e!756270 (= (apply!1024 lt!590310 (select (arr!43248 _keys!1609) from!2000)) (get!21797 (select (arr!43249 _values!1337) from!2000) (dynLambda!3585 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1326902 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43801 _values!1337)))))

(assert (=> b!1326902 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43800 _keys!1609)))))

(declare-fun bm!64764 () Bool)

(declare-fun call!64771 () Bool)

(assert (=> bm!64764 (= call!64771 (contains!8736 lt!590310 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1326903 () Bool)

(declare-fun e!756280 () Bool)

(assert (=> b!1326903 (= e!756280 e!756270)))

(declare-fun res!880633 () Bool)

(assert (=> b!1326903 (=> (not res!880633) (not e!756270))))

(assert (=> b!1326903 (= res!880633 (contains!8736 lt!590310 (select (arr!43248 _keys!1609) from!2000)))))

(assert (=> b!1326903 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43800 _keys!1609)))))

(declare-fun b!1326904 () Bool)

(declare-fun e!756272 () ListLongMap!21269)

(declare-fun call!64767 () ListLongMap!21269)

(assert (=> b!1326904 (= e!756272 call!64767)))

(declare-fun b!1326905 () Bool)

(declare-fun e!756275 () Bool)

(declare-fun call!64769 () Bool)

(assert (=> b!1326905 (= e!756275 (not call!64769))))

(declare-fun b!1326906 () Bool)

(declare-fun e!756271 () Bool)

(assert (=> b!1326906 (= e!756271 (validKeyInArray!0 (select (arr!43248 _keys!1609) from!2000)))))

(declare-fun c!125806 () Bool)

(declare-fun c!125809 () Bool)

(declare-fun call!64766 () ListLongMap!21269)

(declare-fun call!64772 () ListLongMap!21269)

(declare-fun bm!64766 () Bool)

(declare-fun +!4655 (ListLongMap!21269 tuple2!23612) ListLongMap!21269)

(assert (=> bm!64766 (= call!64768 (+!4655 (ite c!125806 call!64772 (ite c!125809 call!64766 call!64767)) (ite (or c!125806 c!125809) (tuple2!23613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1326907 () Bool)

(declare-fun e!756281 () Bool)

(assert (=> b!1326907 (= e!756281 (= (apply!1024 lt!590310 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1279))))

(declare-fun b!1326908 () Bool)

(declare-fun e!756279 () Bool)

(assert (=> b!1326908 (= e!756279 (not call!64771))))

(declare-fun b!1326909 () Bool)

(declare-fun e!756269 () ListLongMap!21269)

(declare-fun e!756278 () ListLongMap!21269)

(assert (=> b!1326909 (= e!756269 e!756278)))

(assert (=> b!1326909 (= c!125809 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1326910 () Bool)

(declare-fun e!756276 () Bool)

(assert (=> b!1326910 (= e!756279 e!756276)))

(declare-fun res!880630 () Bool)

(assert (=> b!1326910 (= res!880630 call!64771)))

(assert (=> b!1326910 (=> (not res!880630) (not e!756276))))

(declare-fun b!1326911 () Bool)

(assert (=> b!1326911 (= e!756275 e!756281)))

(declare-fun res!880637 () Bool)

(assert (=> b!1326911 (= res!880637 call!64769)))

(assert (=> b!1326911 (=> (not res!880637) (not e!756281))))

(declare-fun b!1326912 () Bool)

(declare-fun res!880629 () Bool)

(declare-fun e!756274 () Bool)

(assert (=> b!1326912 (=> (not res!880629) (not e!756274))))

(assert (=> b!1326912 (= res!880629 e!756275)))

(declare-fun c!125807 () Bool)

(assert (=> b!1326912 (= c!125807 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1326913 () Bool)

(declare-fun e!756277 () Bool)

(assert (=> b!1326913 (= e!756277 (validKeyInArray!0 (select (arr!43248 _keys!1609) from!2000)))))

(declare-fun bm!64767 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6293 (array!89551 array!89553 (_ BitVec 32) (_ BitVec 32) V!53577 V!53577 (_ BitVec 32) Int) ListLongMap!21269)

(assert (=> bm!64767 (= call!64772 (getCurrentListMapNoExtraKeys!6293 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun b!1326914 () Bool)

(declare-fun res!880635 () Bool)

(assert (=> b!1326914 (=> (not res!880635) (not e!756274))))

(assert (=> b!1326914 (= res!880635 e!756280)))

(declare-fun res!880636 () Bool)

(assert (=> b!1326914 (=> res!880636 e!756280)))

(assert (=> b!1326914 (= res!880636 (not e!756271))))

(declare-fun res!880631 () Bool)

(assert (=> b!1326914 (=> (not res!880631) (not e!756271))))

(assert (=> b!1326914 (= res!880631 (bvslt from!2000 (size!43800 _keys!1609)))))

(declare-fun b!1326915 () Bool)

(declare-fun e!756273 () Unit!43512)

(declare-fun lt!590309 () Unit!43512)

(assert (=> b!1326915 (= e!756273 lt!590309)))

(declare-fun lt!590315 () ListLongMap!21269)

(assert (=> b!1326915 (= lt!590315 (getCurrentListMapNoExtraKeys!6293 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590317 () (_ BitVec 64))

(assert (=> b!1326915 (= lt!590317 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590316 () (_ BitVec 64))

(assert (=> b!1326915 (= lt!590316 (select (arr!43248 _keys!1609) from!2000))))

(declare-fun lt!590319 () Unit!43512)

(declare-fun addStillContains!1159 (ListLongMap!21269 (_ BitVec 64) V!53577 (_ BitVec 64)) Unit!43512)

(assert (=> b!1326915 (= lt!590319 (addStillContains!1159 lt!590315 lt!590317 zeroValue!1279 lt!590316))))

(assert (=> b!1326915 (contains!8736 (+!4655 lt!590315 (tuple2!23613 lt!590317 zeroValue!1279)) lt!590316)))

(declare-fun lt!590321 () Unit!43512)

(assert (=> b!1326915 (= lt!590321 lt!590319)))

(declare-fun lt!590320 () ListLongMap!21269)

(assert (=> b!1326915 (= lt!590320 (getCurrentListMapNoExtraKeys!6293 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590303 () (_ BitVec 64))

(assert (=> b!1326915 (= lt!590303 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590311 () (_ BitVec 64))

(assert (=> b!1326915 (= lt!590311 (select (arr!43248 _keys!1609) from!2000))))

(declare-fun lt!590304 () Unit!43512)

(declare-fun addApplyDifferent!562 (ListLongMap!21269 (_ BitVec 64) V!53577 (_ BitVec 64)) Unit!43512)

(assert (=> b!1326915 (= lt!590304 (addApplyDifferent!562 lt!590320 lt!590303 minValue!1279 lt!590311))))

(assert (=> b!1326915 (= (apply!1024 (+!4655 lt!590320 (tuple2!23613 lt!590303 minValue!1279)) lt!590311) (apply!1024 lt!590320 lt!590311))))

(declare-fun lt!590307 () Unit!43512)

(assert (=> b!1326915 (= lt!590307 lt!590304)))

(declare-fun lt!590322 () ListLongMap!21269)

(assert (=> b!1326915 (= lt!590322 (getCurrentListMapNoExtraKeys!6293 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590306 () (_ BitVec 64))

(assert (=> b!1326915 (= lt!590306 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590313 () (_ BitVec 64))

(assert (=> b!1326915 (= lt!590313 (select (arr!43248 _keys!1609) from!2000))))

(declare-fun lt!590308 () Unit!43512)

(assert (=> b!1326915 (= lt!590308 (addApplyDifferent!562 lt!590322 lt!590306 zeroValue!1279 lt!590313))))

(assert (=> b!1326915 (= (apply!1024 (+!4655 lt!590322 (tuple2!23613 lt!590306 zeroValue!1279)) lt!590313) (apply!1024 lt!590322 lt!590313))))

(declare-fun lt!590305 () Unit!43512)

(assert (=> b!1326915 (= lt!590305 lt!590308)))

(declare-fun lt!590302 () ListLongMap!21269)

(assert (=> b!1326915 (= lt!590302 (getCurrentListMapNoExtraKeys!6293 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590318 () (_ BitVec 64))

(assert (=> b!1326915 (= lt!590318 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590312 () (_ BitVec 64))

(assert (=> b!1326915 (= lt!590312 (select (arr!43248 _keys!1609) from!2000))))

(assert (=> b!1326915 (= lt!590309 (addApplyDifferent!562 lt!590302 lt!590318 minValue!1279 lt!590312))))

(assert (=> b!1326915 (= (apply!1024 (+!4655 lt!590302 (tuple2!23613 lt!590318 minValue!1279)) lt!590312) (apply!1024 lt!590302 lt!590312))))

(declare-fun b!1326916 () Bool)

(assert (=> b!1326916 (= e!756269 (+!4655 call!64768 (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(declare-fun bm!64765 () Bool)

(assert (=> bm!64765 (= call!64766 call!64772)))

(declare-fun d!143037 () Bool)

(assert (=> d!143037 e!756274))

(declare-fun res!880632 () Bool)

(assert (=> d!143037 (=> (not res!880632) (not e!756274))))

(assert (=> d!143037 (= res!880632 (or (bvsge from!2000 (size!43800 _keys!1609)) (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43800 _keys!1609)))))))

(declare-fun lt!590314 () ListLongMap!21269)

(assert (=> d!143037 (= lt!590310 lt!590314)))

(declare-fun lt!590323 () Unit!43512)

(assert (=> d!143037 (= lt!590323 e!756273)))

(declare-fun c!125811 () Bool)

(assert (=> d!143037 (= c!125811 e!756277)))

(declare-fun res!880634 () Bool)

(assert (=> d!143037 (=> (not res!880634) (not e!756277))))

(assert (=> d!143037 (= res!880634 (bvslt from!2000 (size!43800 _keys!1609)))))

(assert (=> d!143037 (= lt!590314 e!756269)))

(assert (=> d!143037 (= c!125806 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143037 (validMask!0 mask!2019)))

(assert (=> d!143037 (= (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) lt!590310)))

(declare-fun bm!64768 () Bool)

(assert (=> bm!64768 (= call!64769 (contains!8736 lt!590310 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1326917 () Bool)

(declare-fun Unit!43515 () Unit!43512)

(assert (=> b!1326917 (= e!756273 Unit!43515)))

(declare-fun b!1326918 () Bool)

(assert (=> b!1326918 (= e!756276 (= (apply!1024 lt!590310 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1279))))

(declare-fun b!1326919 () Bool)

(declare-fun c!125810 () Bool)

(assert (=> b!1326919 (= c!125810 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1326919 (= e!756278 e!756272)))

(declare-fun b!1326920 () Bool)

(assert (=> b!1326920 (= e!756274 e!756279)))

(declare-fun c!125808 () Bool)

(assert (=> b!1326920 (= c!125808 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1326921 () Bool)

(assert (=> b!1326921 (= e!756272 call!64770)))

(declare-fun bm!64769 () Bool)

(assert (=> bm!64769 (= call!64767 call!64766)))

(declare-fun b!1326922 () Bool)

(assert (=> b!1326922 (= e!756278 call!64770)))

(assert (= (and d!143037 c!125806) b!1326916))

(assert (= (and d!143037 (not c!125806)) b!1326909))

(assert (= (and b!1326909 c!125809) b!1326922))

(assert (= (and b!1326909 (not c!125809)) b!1326919))

(assert (= (and b!1326919 c!125810) b!1326921))

(assert (= (and b!1326919 (not c!125810)) b!1326904))

(assert (= (or b!1326921 b!1326904) bm!64769))

(assert (= (or b!1326922 bm!64769) bm!64765))

(assert (= (or b!1326922 b!1326921) bm!64763))

(assert (= (or b!1326916 bm!64765) bm!64767))

(assert (= (or b!1326916 bm!64763) bm!64766))

(assert (= (and d!143037 res!880634) b!1326913))

(assert (= (and d!143037 c!125811) b!1326915))

(assert (= (and d!143037 (not c!125811)) b!1326917))

(assert (= (and d!143037 res!880632) b!1326914))

(assert (= (and b!1326914 res!880631) b!1326906))

(assert (= (and b!1326914 (not res!880636)) b!1326903))

(assert (= (and b!1326903 res!880633) b!1326902))

(assert (= (and b!1326914 res!880635) b!1326912))

(assert (= (and b!1326912 c!125807) b!1326911))

(assert (= (and b!1326912 (not c!125807)) b!1326905))

(assert (= (and b!1326911 res!880637) b!1326907))

(assert (= (or b!1326911 b!1326905) bm!64768))

(assert (= (and b!1326912 res!880629) b!1326920))

(assert (= (and b!1326920 c!125808) b!1326910))

(assert (= (and b!1326920 (not c!125808)) b!1326908))

(assert (= (and b!1326910 res!880630) b!1326918))

(assert (= (or b!1326910 b!1326908) bm!64764))

(declare-fun b_lambda!23821 () Bool)

(assert (=> (not b_lambda!23821) (not b!1326902)))

(declare-fun t!44739 () Bool)

(declare-fun tb!11801 () Bool)

(assert (=> (and start!111962 (= defaultEntry!1340 defaultEntry!1340) t!44739) tb!11801))

(declare-fun result!24669 () Bool)

(assert (=> tb!11801 (= result!24669 tp_is_empty!36355)))

(assert (=> b!1326902 t!44739))

(declare-fun b_and!49161 () Bool)

(assert (= b_and!49155 (and (=> t!44739 result!24669) b_and!49161)))

(declare-fun m!1215587 () Bool)

(assert (=> b!1326915 m!1215587))

(declare-fun m!1215589 () Bool)

(assert (=> b!1326915 m!1215589))

(declare-fun m!1215591 () Bool)

(assert (=> b!1326915 m!1215591))

(declare-fun m!1215593 () Bool)

(assert (=> b!1326915 m!1215593))

(declare-fun m!1215595 () Bool)

(assert (=> b!1326915 m!1215595))

(declare-fun m!1215597 () Bool)

(assert (=> b!1326915 m!1215597))

(declare-fun m!1215599 () Bool)

(assert (=> b!1326915 m!1215599))

(declare-fun m!1215601 () Bool)

(assert (=> b!1326915 m!1215601))

(assert (=> b!1326915 m!1215595))

(declare-fun m!1215603 () Bool)

(assert (=> b!1326915 m!1215603))

(declare-fun m!1215605 () Bool)

(assert (=> b!1326915 m!1215605))

(declare-fun m!1215607 () Bool)

(assert (=> b!1326915 m!1215607))

(declare-fun m!1215609 () Bool)

(assert (=> b!1326915 m!1215609))

(declare-fun m!1215611 () Bool)

(assert (=> b!1326915 m!1215611))

(declare-fun m!1215613 () Bool)

(assert (=> b!1326915 m!1215613))

(declare-fun m!1215615 () Bool)

(assert (=> b!1326915 m!1215615))

(declare-fun m!1215617 () Bool)

(assert (=> b!1326915 m!1215617))

(assert (=> b!1326915 m!1215515))

(assert (=> b!1326915 m!1215615))

(assert (=> b!1326915 m!1215599))

(assert (=> b!1326915 m!1215611))

(assert (=> b!1326903 m!1215515))

(assert (=> b!1326903 m!1215515))

(declare-fun m!1215619 () Bool)

(assert (=> b!1326903 m!1215619))

(declare-fun m!1215621 () Bool)

(assert (=> bm!64764 m!1215621))

(declare-fun m!1215623 () Bool)

(assert (=> b!1326916 m!1215623))

(declare-fun m!1215625 () Bool)

(assert (=> bm!64768 m!1215625))

(declare-fun m!1215627 () Bool)

(assert (=> b!1326907 m!1215627))

(assert (=> bm!64767 m!1215605))

(declare-fun m!1215629 () Bool)

(assert (=> bm!64766 m!1215629))

(assert (=> d!143037 m!1215525))

(assert (=> b!1326902 m!1215515))

(assert (=> b!1326902 m!1215515))

(declare-fun m!1215631 () Bool)

(assert (=> b!1326902 m!1215631))

(declare-fun m!1215633 () Bool)

(assert (=> b!1326902 m!1215633))

(declare-fun m!1215635 () Bool)

(assert (=> b!1326902 m!1215635))

(assert (=> b!1326902 m!1215633))

(declare-fun m!1215637 () Bool)

(assert (=> b!1326902 m!1215637))

(assert (=> b!1326902 m!1215635))

(assert (=> b!1326913 m!1215515))

(assert (=> b!1326913 m!1215515))

(assert (=> b!1326913 m!1215517))

(declare-fun m!1215639 () Bool)

(assert (=> b!1326918 m!1215639))

(assert (=> b!1326906 m!1215515))

(assert (=> b!1326906 m!1215515))

(assert (=> b!1326906 m!1215517))

(assert (=> b!1326777 d!143037))

(declare-fun d!143039 () Bool)

(declare-fun e!756282 () Bool)

(assert (=> d!143039 e!756282))

(declare-fun res!880638 () Bool)

(assert (=> d!143039 (=> res!880638 e!756282)))

(declare-fun lt!590327 () Bool)

(assert (=> d!143039 (= res!880638 (not lt!590327))))

(declare-fun lt!590326 () Bool)

(assert (=> d!143039 (= lt!590327 lt!590326)))

(declare-fun lt!590325 () Unit!43512)

(declare-fun e!756283 () Unit!43512)

(assert (=> d!143039 (= lt!590325 e!756283)))

(declare-fun c!125812 () Bool)

(assert (=> d!143039 (= c!125812 lt!590326)))

(assert (=> d!143039 (= lt!590326 (containsKey!734 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(assert (=> d!143039 (= (contains!8736 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) k0!1164) lt!590327)))

(declare-fun b!1326925 () Bool)

(declare-fun lt!590324 () Unit!43512)

(assert (=> b!1326925 (= e!756283 lt!590324)))

(assert (=> b!1326925 (= lt!590324 (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(assert (=> b!1326925 (isDefined!524 (getValueByKey!717 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(declare-fun b!1326926 () Bool)

(declare-fun Unit!43516 () Unit!43512)

(assert (=> b!1326926 (= e!756283 Unit!43516)))

(declare-fun b!1326927 () Bool)

(assert (=> b!1326927 (= e!756282 (isDefined!524 (getValueByKey!717 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164)))))

(assert (= (and d!143039 c!125812) b!1326925))

(assert (= (and d!143039 (not c!125812)) b!1326926))

(assert (= (and d!143039 (not res!880638)) b!1326927))

(declare-fun m!1215641 () Bool)

(assert (=> d!143039 m!1215641))

(declare-fun m!1215643 () Bool)

(assert (=> b!1326925 m!1215643))

(declare-fun m!1215645 () Bool)

(assert (=> b!1326925 m!1215645))

(assert (=> b!1326925 m!1215645))

(declare-fun m!1215647 () Bool)

(assert (=> b!1326925 m!1215647))

(assert (=> b!1326927 m!1215645))

(assert (=> b!1326927 m!1215645))

(assert (=> b!1326927 m!1215647))

(assert (=> b!1326782 d!143039))

(declare-fun bm!64770 () Bool)

(declare-fun call!64777 () ListLongMap!21269)

(declare-fun call!64775 () ListLongMap!21269)

(assert (=> bm!64770 (= call!64777 call!64775)))

(declare-fun b!1326928 () Bool)

(declare-fun e!756285 () Bool)

(declare-fun lt!590336 () ListLongMap!21269)

(assert (=> b!1326928 (= e!756285 (= (apply!1024 lt!590336 (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (get!21797 (select (arr!43249 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3585 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1326928 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43801 _values!1337)))))

(assert (=> b!1326928 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43800 _keys!1609)))))

(declare-fun bm!64771 () Bool)

(declare-fun call!64778 () Bool)

(assert (=> bm!64771 (= call!64778 (contains!8736 lt!590336 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1326929 () Bool)

(declare-fun e!756295 () Bool)

(assert (=> b!1326929 (= e!756295 e!756285)))

(declare-fun res!880643 () Bool)

(assert (=> b!1326929 (=> (not res!880643) (not e!756285))))

(assert (=> b!1326929 (= res!880643 (contains!8736 lt!590336 (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1326929 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43800 _keys!1609)))))

(declare-fun b!1326930 () Bool)

(declare-fun e!756287 () ListLongMap!21269)

(declare-fun call!64774 () ListLongMap!21269)

(assert (=> b!1326930 (= e!756287 call!64774)))

(declare-fun b!1326931 () Bool)

(declare-fun e!756290 () Bool)

(declare-fun call!64776 () Bool)

(assert (=> b!1326931 (= e!756290 (not call!64776))))

(declare-fun b!1326932 () Bool)

(declare-fun e!756286 () Bool)

(assert (=> b!1326932 (= e!756286 (validKeyInArray!0 (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun call!64773 () ListLongMap!21269)

(declare-fun c!125813 () Bool)

(declare-fun c!125816 () Bool)

(declare-fun bm!64773 () Bool)

(declare-fun call!64779 () ListLongMap!21269)

(assert (=> bm!64773 (= call!64775 (+!4655 (ite c!125813 call!64779 (ite c!125816 call!64773 call!64774)) (ite (or c!125813 c!125816) (tuple2!23613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1326933 () Bool)

(declare-fun e!756296 () Bool)

(assert (=> b!1326933 (= e!756296 (= (apply!1024 lt!590336 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1279))))

(declare-fun b!1326934 () Bool)

(declare-fun e!756294 () Bool)

(assert (=> b!1326934 (= e!756294 (not call!64778))))

(declare-fun b!1326935 () Bool)

(declare-fun e!756284 () ListLongMap!21269)

(declare-fun e!756293 () ListLongMap!21269)

(assert (=> b!1326935 (= e!756284 e!756293)))

(assert (=> b!1326935 (= c!125816 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1326936 () Bool)

(declare-fun e!756291 () Bool)

(assert (=> b!1326936 (= e!756294 e!756291)))

(declare-fun res!880640 () Bool)

(assert (=> b!1326936 (= res!880640 call!64778)))

(assert (=> b!1326936 (=> (not res!880640) (not e!756291))))

(declare-fun b!1326937 () Bool)

(assert (=> b!1326937 (= e!756290 e!756296)))

(declare-fun res!880647 () Bool)

(assert (=> b!1326937 (= res!880647 call!64776)))

(assert (=> b!1326937 (=> (not res!880647) (not e!756296))))

(declare-fun b!1326938 () Bool)

(declare-fun res!880639 () Bool)

(declare-fun e!756289 () Bool)

(assert (=> b!1326938 (=> (not res!880639) (not e!756289))))

(assert (=> b!1326938 (= res!880639 e!756290)))

(declare-fun c!125814 () Bool)

(assert (=> b!1326938 (= c!125814 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1326939 () Bool)

(declare-fun e!756292 () Bool)

(assert (=> b!1326939 (= e!756292 (validKeyInArray!0 (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun bm!64774 () Bool)

(assert (=> bm!64774 (= call!64779 (getCurrentListMapNoExtraKeys!6293 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1326940 () Bool)

(declare-fun res!880645 () Bool)

(assert (=> b!1326940 (=> (not res!880645) (not e!756289))))

(assert (=> b!1326940 (= res!880645 e!756295)))

(declare-fun res!880646 () Bool)

(assert (=> b!1326940 (=> res!880646 e!756295)))

(assert (=> b!1326940 (= res!880646 (not e!756286))))

(declare-fun res!880641 () Bool)

(assert (=> b!1326940 (=> (not res!880641) (not e!756286))))

(assert (=> b!1326940 (= res!880641 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43800 _keys!1609)))))

(declare-fun b!1326941 () Bool)

(declare-fun e!756288 () Unit!43512)

(declare-fun lt!590335 () Unit!43512)

(assert (=> b!1326941 (= e!756288 lt!590335)))

(declare-fun lt!590341 () ListLongMap!21269)

(assert (=> b!1326941 (= lt!590341 (getCurrentListMapNoExtraKeys!6293 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun lt!590343 () (_ BitVec 64))

(assert (=> b!1326941 (= lt!590343 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590342 () (_ BitVec 64))

(assert (=> b!1326941 (= lt!590342 (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(declare-fun lt!590345 () Unit!43512)

(assert (=> b!1326941 (= lt!590345 (addStillContains!1159 lt!590341 lt!590343 zeroValue!1279 lt!590342))))

(assert (=> b!1326941 (contains!8736 (+!4655 lt!590341 (tuple2!23613 lt!590343 zeroValue!1279)) lt!590342)))

(declare-fun lt!590347 () Unit!43512)

(assert (=> b!1326941 (= lt!590347 lt!590345)))

(declare-fun lt!590346 () ListLongMap!21269)

(assert (=> b!1326941 (= lt!590346 (getCurrentListMapNoExtraKeys!6293 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun lt!590329 () (_ BitVec 64))

(assert (=> b!1326941 (= lt!590329 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590337 () (_ BitVec 64))

(assert (=> b!1326941 (= lt!590337 (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(declare-fun lt!590330 () Unit!43512)

(assert (=> b!1326941 (= lt!590330 (addApplyDifferent!562 lt!590346 lt!590329 minValue!1279 lt!590337))))

(assert (=> b!1326941 (= (apply!1024 (+!4655 lt!590346 (tuple2!23613 lt!590329 minValue!1279)) lt!590337) (apply!1024 lt!590346 lt!590337))))

(declare-fun lt!590333 () Unit!43512)

(assert (=> b!1326941 (= lt!590333 lt!590330)))

(declare-fun lt!590348 () ListLongMap!21269)

(assert (=> b!1326941 (= lt!590348 (getCurrentListMapNoExtraKeys!6293 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun lt!590332 () (_ BitVec 64))

(assert (=> b!1326941 (= lt!590332 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590339 () (_ BitVec 64))

(assert (=> b!1326941 (= lt!590339 (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(declare-fun lt!590334 () Unit!43512)

(assert (=> b!1326941 (= lt!590334 (addApplyDifferent!562 lt!590348 lt!590332 zeroValue!1279 lt!590339))))

(assert (=> b!1326941 (= (apply!1024 (+!4655 lt!590348 (tuple2!23613 lt!590332 zeroValue!1279)) lt!590339) (apply!1024 lt!590348 lt!590339))))

(declare-fun lt!590331 () Unit!43512)

(assert (=> b!1326941 (= lt!590331 lt!590334)))

(declare-fun lt!590328 () ListLongMap!21269)

(assert (=> b!1326941 (= lt!590328 (getCurrentListMapNoExtraKeys!6293 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun lt!590344 () (_ BitVec 64))

(assert (=> b!1326941 (= lt!590344 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590338 () (_ BitVec 64))

(assert (=> b!1326941 (= lt!590338 (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(assert (=> b!1326941 (= lt!590335 (addApplyDifferent!562 lt!590328 lt!590344 minValue!1279 lt!590338))))

(assert (=> b!1326941 (= (apply!1024 (+!4655 lt!590328 (tuple2!23613 lt!590344 minValue!1279)) lt!590338) (apply!1024 lt!590328 lt!590338))))

(declare-fun b!1326942 () Bool)

(assert (=> b!1326942 (= e!756284 (+!4655 call!64775 (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(declare-fun bm!64772 () Bool)

(assert (=> bm!64772 (= call!64773 call!64779)))

(declare-fun d!143041 () Bool)

(assert (=> d!143041 e!756289))

(declare-fun res!880642 () Bool)

(assert (=> d!143041 (=> (not res!880642) (not e!756289))))

(assert (=> d!143041 (= res!880642 (or (bvsge (bvadd #b00000000000000000000000000000001 from!2000) (size!43800 _keys!1609)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43800 _keys!1609)))))))

(declare-fun lt!590340 () ListLongMap!21269)

(assert (=> d!143041 (= lt!590336 lt!590340)))

(declare-fun lt!590349 () Unit!43512)

(assert (=> d!143041 (= lt!590349 e!756288)))

(declare-fun c!125818 () Bool)

(assert (=> d!143041 (= c!125818 e!756292)))

(declare-fun res!880644 () Bool)

(assert (=> d!143041 (=> (not res!880644) (not e!756292))))

(assert (=> d!143041 (= res!880644 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43800 _keys!1609)))))

(assert (=> d!143041 (= lt!590340 e!756284)))

(assert (=> d!143041 (= c!125813 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143041 (validMask!0 mask!2019)))

(assert (=> d!143041 (= (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) lt!590336)))

(declare-fun bm!64775 () Bool)

(assert (=> bm!64775 (= call!64776 (contains!8736 lt!590336 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1326943 () Bool)

(declare-fun Unit!43517 () Unit!43512)

(assert (=> b!1326943 (= e!756288 Unit!43517)))

(declare-fun b!1326944 () Bool)

(assert (=> b!1326944 (= e!756291 (= (apply!1024 lt!590336 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1279))))

(declare-fun b!1326945 () Bool)

(declare-fun c!125817 () Bool)

(assert (=> b!1326945 (= c!125817 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1326945 (= e!756293 e!756287)))

(declare-fun b!1326946 () Bool)

(assert (=> b!1326946 (= e!756289 e!756294)))

(declare-fun c!125815 () Bool)

(assert (=> b!1326946 (= c!125815 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1326947 () Bool)

(assert (=> b!1326947 (= e!756287 call!64777)))

(declare-fun bm!64776 () Bool)

(assert (=> bm!64776 (= call!64774 call!64773)))

(declare-fun b!1326948 () Bool)

(assert (=> b!1326948 (= e!756293 call!64777)))

(assert (= (and d!143041 c!125813) b!1326942))

(assert (= (and d!143041 (not c!125813)) b!1326935))

(assert (= (and b!1326935 c!125816) b!1326948))

(assert (= (and b!1326935 (not c!125816)) b!1326945))

(assert (= (and b!1326945 c!125817) b!1326947))

(assert (= (and b!1326945 (not c!125817)) b!1326930))

(assert (= (or b!1326947 b!1326930) bm!64776))

(assert (= (or b!1326948 bm!64776) bm!64772))

(assert (= (or b!1326948 b!1326947) bm!64770))

(assert (= (or b!1326942 bm!64772) bm!64774))

(assert (= (or b!1326942 bm!64770) bm!64773))

(assert (= (and d!143041 res!880644) b!1326939))

(assert (= (and d!143041 c!125818) b!1326941))

(assert (= (and d!143041 (not c!125818)) b!1326943))

(assert (= (and d!143041 res!880642) b!1326940))

(assert (= (and b!1326940 res!880641) b!1326932))

(assert (= (and b!1326940 (not res!880646)) b!1326929))

(assert (= (and b!1326929 res!880643) b!1326928))

(assert (= (and b!1326940 res!880645) b!1326938))

(assert (= (and b!1326938 c!125814) b!1326937))

(assert (= (and b!1326938 (not c!125814)) b!1326931))

(assert (= (and b!1326937 res!880647) b!1326933))

(assert (= (or b!1326937 b!1326931) bm!64775))

(assert (= (and b!1326938 res!880639) b!1326946))

(assert (= (and b!1326946 c!125815) b!1326936))

(assert (= (and b!1326946 (not c!125815)) b!1326934))

(assert (= (and b!1326936 res!880640) b!1326944))

(assert (= (or b!1326936 b!1326934) bm!64771))

(declare-fun b_lambda!23823 () Bool)

(assert (=> (not b_lambda!23823) (not b!1326928)))

(assert (=> b!1326928 t!44739))

(declare-fun b_and!49163 () Bool)

(assert (= b_and!49161 (and (=> t!44739 result!24669) b_and!49163)))

(declare-fun m!1215649 () Bool)

(assert (=> b!1326941 m!1215649))

(declare-fun m!1215651 () Bool)

(assert (=> b!1326941 m!1215651))

(declare-fun m!1215653 () Bool)

(assert (=> b!1326941 m!1215653))

(declare-fun m!1215655 () Bool)

(assert (=> b!1326941 m!1215655))

(declare-fun m!1215657 () Bool)

(assert (=> b!1326941 m!1215657))

(declare-fun m!1215659 () Bool)

(assert (=> b!1326941 m!1215659))

(declare-fun m!1215661 () Bool)

(assert (=> b!1326941 m!1215661))

(declare-fun m!1215663 () Bool)

(assert (=> b!1326941 m!1215663))

(assert (=> b!1326941 m!1215657))

(declare-fun m!1215665 () Bool)

(assert (=> b!1326941 m!1215665))

(declare-fun m!1215667 () Bool)

(assert (=> b!1326941 m!1215667))

(declare-fun m!1215669 () Bool)

(assert (=> b!1326941 m!1215669))

(declare-fun m!1215671 () Bool)

(assert (=> b!1326941 m!1215671))

(declare-fun m!1215673 () Bool)

(assert (=> b!1326941 m!1215673))

(declare-fun m!1215675 () Bool)

(assert (=> b!1326941 m!1215675))

(declare-fun m!1215677 () Bool)

(assert (=> b!1326941 m!1215677))

(declare-fun m!1215679 () Bool)

(assert (=> b!1326941 m!1215679))

(declare-fun m!1215681 () Bool)

(assert (=> b!1326941 m!1215681))

(assert (=> b!1326941 m!1215677))

(assert (=> b!1326941 m!1215661))

(assert (=> b!1326941 m!1215673))

(assert (=> b!1326929 m!1215681))

(assert (=> b!1326929 m!1215681))

(declare-fun m!1215683 () Bool)

(assert (=> b!1326929 m!1215683))

(declare-fun m!1215685 () Bool)

(assert (=> bm!64771 m!1215685))

(declare-fun m!1215687 () Bool)

(assert (=> b!1326942 m!1215687))

(declare-fun m!1215689 () Bool)

(assert (=> bm!64775 m!1215689))

(declare-fun m!1215691 () Bool)

(assert (=> b!1326933 m!1215691))

(assert (=> bm!64774 m!1215667))

(declare-fun m!1215693 () Bool)

(assert (=> bm!64773 m!1215693))

(assert (=> d!143041 m!1215525))

(assert (=> b!1326928 m!1215681))

(assert (=> b!1326928 m!1215681))

(declare-fun m!1215695 () Bool)

(assert (=> b!1326928 m!1215695))

(assert (=> b!1326928 m!1215633))

(declare-fun m!1215697 () Bool)

(assert (=> b!1326928 m!1215697))

(assert (=> b!1326928 m!1215633))

(declare-fun m!1215699 () Bool)

(assert (=> b!1326928 m!1215699))

(assert (=> b!1326928 m!1215697))

(assert (=> b!1326939 m!1215681))

(assert (=> b!1326939 m!1215681))

(declare-fun m!1215701 () Bool)

(assert (=> b!1326939 m!1215701))

(declare-fun m!1215703 () Bool)

(assert (=> b!1326944 m!1215703))

(assert (=> b!1326932 m!1215681))

(assert (=> b!1326932 m!1215681))

(assert (=> b!1326932 m!1215701))

(assert (=> b!1326782 d!143041))

(declare-fun bm!64779 () Bool)

(declare-fun call!64782 () Bool)

(declare-fun c!125821 () Bool)

(assert (=> bm!64779 (= call!64782 (arrayNoDuplicates!0 _keys!1609 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125821 (Cons!30735 (select (arr!43248 _keys!1609) #b00000000000000000000000000000000) Nil!30736) Nil!30736)))))

(declare-fun b!1326959 () Bool)

(declare-fun e!756308 () Bool)

(assert (=> b!1326959 (= e!756308 call!64782)))

(declare-fun d!143043 () Bool)

(declare-fun res!880656 () Bool)

(declare-fun e!756306 () Bool)

(assert (=> d!143043 (=> res!880656 e!756306)))

(assert (=> d!143043 (= res!880656 (bvsge #b00000000000000000000000000000000 (size!43800 _keys!1609)))))

(assert (=> d!143043 (= (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30736) e!756306)))

(declare-fun b!1326960 () Bool)

(declare-fun e!756307 () Bool)

(assert (=> b!1326960 (= e!756307 e!756308)))

(assert (=> b!1326960 (= c!125821 (validKeyInArray!0 (select (arr!43248 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1326961 () Bool)

(declare-fun e!756305 () Bool)

(declare-fun contains!8738 (List!30739 (_ BitVec 64)) Bool)

(assert (=> b!1326961 (= e!756305 (contains!8738 Nil!30736 (select (arr!43248 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1326962 () Bool)

(assert (=> b!1326962 (= e!756308 call!64782)))

(declare-fun b!1326963 () Bool)

(assert (=> b!1326963 (= e!756306 e!756307)))

(declare-fun res!880655 () Bool)

(assert (=> b!1326963 (=> (not res!880655) (not e!756307))))

(assert (=> b!1326963 (= res!880655 (not e!756305))))

(declare-fun res!880654 () Bool)

(assert (=> b!1326963 (=> (not res!880654) (not e!756305))))

(assert (=> b!1326963 (= res!880654 (validKeyInArray!0 (select (arr!43248 _keys!1609) #b00000000000000000000000000000000)))))

(assert (= (and d!143043 (not res!880656)) b!1326963))

(assert (= (and b!1326963 res!880654) b!1326961))

(assert (= (and b!1326963 res!880655) b!1326960))

(assert (= (and b!1326960 c!125821) b!1326962))

(assert (= (and b!1326960 (not c!125821)) b!1326959))

(assert (= (or b!1326962 b!1326959) bm!64779))

(declare-fun m!1215705 () Bool)

(assert (=> bm!64779 m!1215705))

(declare-fun m!1215707 () Bool)

(assert (=> bm!64779 m!1215707))

(assert (=> b!1326960 m!1215705))

(assert (=> b!1326960 m!1215705))

(declare-fun m!1215709 () Bool)

(assert (=> b!1326960 m!1215709))

(assert (=> b!1326961 m!1215705))

(assert (=> b!1326961 m!1215705))

(declare-fun m!1215711 () Bool)

(assert (=> b!1326961 m!1215711))

(assert (=> b!1326963 m!1215705))

(assert (=> b!1326963 m!1215705))

(assert (=> b!1326963 m!1215709))

(assert (=> b!1326778 d!143043))

(declare-fun b!1326972 () Bool)

(declare-fun e!756317 () Bool)

(declare-fun e!756315 () Bool)

(assert (=> b!1326972 (= e!756317 e!756315)))

(declare-fun lt!590356 () (_ BitVec 64))

(assert (=> b!1326972 (= lt!590356 (select (arr!43248 _keys!1609) #b00000000000000000000000000000000))))

(declare-fun lt!590358 () Unit!43512)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!89551 (_ BitVec 64) (_ BitVec 32)) Unit!43512)

(assert (=> b!1326972 (= lt!590358 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!590356 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!89551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1326972 (arrayContainsKey!0 _keys!1609 lt!590356 #b00000000000000000000000000000000)))

(declare-fun lt!590357 () Unit!43512)

(assert (=> b!1326972 (= lt!590357 lt!590358)))

(declare-fun res!880662 () Bool)

(declare-datatypes ((SeekEntryResult!10041 0))(
  ( (MissingZero!10041 (index!42535 (_ BitVec 32))) (Found!10041 (index!42536 (_ BitVec 32))) (Intermediate!10041 (undefined!10853 Bool) (index!42537 (_ BitVec 32)) (x!118307 (_ BitVec 32))) (Undefined!10041) (MissingVacant!10041 (index!42538 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!89551 (_ BitVec 32)) SeekEntryResult!10041)

(assert (=> b!1326972 (= res!880662 (= (seekEntryOrOpen!0 (select (arr!43248 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) (Found!10041 #b00000000000000000000000000000000)))))

(assert (=> b!1326972 (=> (not res!880662) (not e!756315))))

(declare-fun b!1326973 () Bool)

(declare-fun call!64785 () Bool)

(assert (=> b!1326973 (= e!756317 call!64785)))

(declare-fun b!1326974 () Bool)

(declare-fun e!756316 () Bool)

(assert (=> b!1326974 (= e!756316 e!756317)))

(declare-fun c!125824 () Bool)

(assert (=> b!1326974 (= c!125824 (validKeyInArray!0 (select (arr!43248 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun d!143045 () Bool)

(declare-fun res!880661 () Bool)

(assert (=> d!143045 (=> res!880661 e!756316)))

(assert (=> d!143045 (= res!880661 (bvsge #b00000000000000000000000000000000 (size!43800 _keys!1609)))))

(assert (=> d!143045 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019) e!756316)))

(declare-fun bm!64782 () Bool)

(assert (=> bm!64782 (= call!64785 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun b!1326975 () Bool)

(assert (=> b!1326975 (= e!756315 call!64785)))

(assert (= (and d!143045 (not res!880661)) b!1326974))

(assert (= (and b!1326974 c!125824) b!1326972))

(assert (= (and b!1326974 (not c!125824)) b!1326973))

(assert (= (and b!1326972 res!880662) b!1326975))

(assert (= (or b!1326975 b!1326973) bm!64782))

(assert (=> b!1326972 m!1215705))

(declare-fun m!1215713 () Bool)

(assert (=> b!1326972 m!1215713))

(declare-fun m!1215715 () Bool)

(assert (=> b!1326972 m!1215715))

(assert (=> b!1326972 m!1215705))

(declare-fun m!1215717 () Bool)

(assert (=> b!1326972 m!1215717))

(assert (=> b!1326974 m!1215705))

(assert (=> b!1326974 m!1215705))

(assert (=> b!1326974 m!1215709))

(declare-fun m!1215719 () Bool)

(assert (=> bm!64782 m!1215719))

(assert (=> b!1326783 d!143045))

(declare-fun b!1326983 () Bool)

(declare-fun e!756323 () Bool)

(assert (=> b!1326983 (= e!756323 tp_is_empty!36355)))

(declare-fun b!1326982 () Bool)

(declare-fun e!756322 () Bool)

(assert (=> b!1326982 (= e!756322 tp_is_empty!36355)))

(declare-fun mapIsEmpty!56196 () Bool)

(declare-fun mapRes!56196 () Bool)

(assert (=> mapIsEmpty!56196 mapRes!56196))

(declare-fun mapNonEmpty!56196 () Bool)

(declare-fun tp!107104 () Bool)

(assert (=> mapNonEmpty!56196 (= mapRes!56196 (and tp!107104 e!756322))))

(declare-fun mapRest!56196 () (Array (_ BitVec 32) ValueCell!17279))

(declare-fun mapValue!56196 () ValueCell!17279)

(declare-fun mapKey!56196 () (_ BitVec 32))

(assert (=> mapNonEmpty!56196 (= mapRest!56187 (store mapRest!56196 mapKey!56196 mapValue!56196))))

(declare-fun condMapEmpty!56196 () Bool)

(declare-fun mapDefault!56196 () ValueCell!17279)

(assert (=> mapNonEmpty!56187 (= condMapEmpty!56196 (= mapRest!56187 ((as const (Array (_ BitVec 32) ValueCell!17279)) mapDefault!56196)))))

(assert (=> mapNonEmpty!56187 (= tp!107088 (and e!756323 mapRes!56196))))

(assert (= (and mapNonEmpty!56187 condMapEmpty!56196) mapIsEmpty!56196))

(assert (= (and mapNonEmpty!56187 (not condMapEmpty!56196)) mapNonEmpty!56196))

(assert (= (and mapNonEmpty!56196 ((_ is ValueCellFull!17279) mapValue!56196)) b!1326982))

(assert (= (and mapNonEmpty!56187 ((_ is ValueCellFull!17279) mapDefault!56196)) b!1326983))

(declare-fun m!1215721 () Bool)

(assert (=> mapNonEmpty!56196 m!1215721))

(declare-fun b_lambda!23825 () Bool)

(assert (= b_lambda!23821 (or (and start!111962 b_free!30535) b_lambda!23825)))

(declare-fun b_lambda!23827 () Bool)

(assert (= b_lambda!23823 (or (and start!111962 b_free!30535) b_lambda!23827)))

(check-sat (not bm!64775) (not b!1326918) (not bm!64773) (not b!1326933) (not bm!64768) (not b!1326925) (not b!1326907) (not bm!64779) (not b_next!30535) (not bm!64766) (not bm!64774) (not bm!64764) (not b!1326916) (not b_lambda!23827) (not b!1326961) (not bm!64782) (not mapNonEmpty!56196) (not b!1326913) (not d!143035) (not d!143041) (not b!1326941) (not b!1326859) (not b!1326974) (not b!1326915) tp_is_empty!36355 b_and!49163 (not b!1326942) (not bm!64771) (not d!143039) (not b!1326939) (not b!1326927) (not b!1326857) (not b_lambda!23825) (not b!1326928) (not b!1326963) (not b!1326932) (not b!1326929) (not d!143037) (not bm!64767) (not b!1326972) (not b!1326902) (not b!1326906) (not b!1326944) (not b!1326903) (not b!1326960))
(check-sat b_and!49163 (not b_next!30535))
(get-model)

(declare-fun d!143047 () Bool)

(declare-fun get!21798 (Option!768) V!53577)

(assert (=> d!143047 (= (apply!1024 lt!590328 lt!590338) (get!21798 (getValueByKey!717 (toList!10650 lt!590328) lt!590338)))))

(declare-fun bs!37927 () Bool)

(assert (= bs!37927 d!143047))

(declare-fun m!1215723 () Bool)

(assert (=> bs!37927 m!1215723))

(assert (=> bs!37927 m!1215723))

(declare-fun m!1215725 () Bool)

(assert (=> bs!37927 m!1215725))

(assert (=> b!1326941 d!143047))

(declare-fun d!143049 () Bool)

(assert (=> d!143049 (contains!8736 (+!4655 lt!590341 (tuple2!23613 lt!590343 zeroValue!1279)) lt!590342)))

(declare-fun lt!590361 () Unit!43512)

(declare-fun choose!1961 (ListLongMap!21269 (_ BitVec 64) V!53577 (_ BitVec 64)) Unit!43512)

(assert (=> d!143049 (= lt!590361 (choose!1961 lt!590341 lt!590343 zeroValue!1279 lt!590342))))

(assert (=> d!143049 (contains!8736 lt!590341 lt!590342)))

(assert (=> d!143049 (= (addStillContains!1159 lt!590341 lt!590343 zeroValue!1279 lt!590342) lt!590361)))

(declare-fun bs!37928 () Bool)

(assert (= bs!37928 d!143049))

(assert (=> bs!37928 m!1215661))

(assert (=> bs!37928 m!1215661))

(assert (=> bs!37928 m!1215663))

(declare-fun m!1215727 () Bool)

(assert (=> bs!37928 m!1215727))

(declare-fun m!1215729 () Bool)

(assert (=> bs!37928 m!1215729))

(assert (=> b!1326941 d!143049))

(declare-fun d!143051 () Bool)

(assert (=> d!143051 (= (apply!1024 (+!4655 lt!590346 (tuple2!23613 lt!590329 minValue!1279)) lt!590337) (get!21798 (getValueByKey!717 (toList!10650 (+!4655 lt!590346 (tuple2!23613 lt!590329 minValue!1279))) lt!590337)))))

(declare-fun bs!37929 () Bool)

(assert (= bs!37929 d!143051))

(declare-fun m!1215731 () Bool)

(assert (=> bs!37929 m!1215731))

(assert (=> bs!37929 m!1215731))

(declare-fun m!1215733 () Bool)

(assert (=> bs!37929 m!1215733))

(assert (=> b!1326941 d!143051))

(declare-fun d!143053 () Bool)

(assert (=> d!143053 (= (apply!1024 (+!4655 lt!590348 (tuple2!23613 lt!590332 zeroValue!1279)) lt!590339) (apply!1024 lt!590348 lt!590339))))

(declare-fun lt!590364 () Unit!43512)

(declare-fun choose!1962 (ListLongMap!21269 (_ BitVec 64) V!53577 (_ BitVec 64)) Unit!43512)

(assert (=> d!143053 (= lt!590364 (choose!1962 lt!590348 lt!590332 zeroValue!1279 lt!590339))))

(declare-fun e!756326 () Bool)

(assert (=> d!143053 e!756326))

(declare-fun res!880665 () Bool)

(assert (=> d!143053 (=> (not res!880665) (not e!756326))))

(assert (=> d!143053 (= res!880665 (contains!8736 lt!590348 lt!590339))))

(assert (=> d!143053 (= (addApplyDifferent!562 lt!590348 lt!590332 zeroValue!1279 lt!590339) lt!590364)))

(declare-fun b!1326988 () Bool)

(assert (=> b!1326988 (= e!756326 (not (= lt!590339 lt!590332)))))

(assert (= (and d!143053 res!880665) b!1326988))

(assert (=> d!143053 m!1215657))

(assert (=> d!143053 m!1215665))

(declare-fun m!1215735 () Bool)

(assert (=> d!143053 m!1215735))

(declare-fun m!1215737 () Bool)

(assert (=> d!143053 m!1215737))

(assert (=> d!143053 m!1215651))

(assert (=> d!143053 m!1215657))

(assert (=> b!1326941 d!143053))

(declare-fun b!1327013 () Bool)

(declare-fun e!756345 () Bool)

(declare-fun e!756344 () Bool)

(assert (=> b!1327013 (= e!756345 e!756344)))

(assert (=> b!1327013 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43800 _keys!1609)))))

(declare-fun lt!590382 () ListLongMap!21269)

(declare-fun res!880676 () Bool)

(assert (=> b!1327013 (= res!880676 (contains!8736 lt!590382 (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1327013 (=> (not res!880676) (not e!756344))))

(declare-fun d!143055 () Bool)

(declare-fun e!756342 () Bool)

(assert (=> d!143055 e!756342))

(declare-fun res!880674 () Bool)

(assert (=> d!143055 (=> (not res!880674) (not e!756342))))

(assert (=> d!143055 (= res!880674 (not (contains!8736 lt!590382 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!756341 () ListLongMap!21269)

(assert (=> d!143055 (= lt!590382 e!756341)))

(declare-fun c!125835 () Bool)

(assert (=> d!143055 (= c!125835 (bvsge (bvadd #b00000000000000000000000000000001 from!2000) (size!43800 _keys!1609)))))

(assert (=> d!143055 (validMask!0 mask!2019)))

(assert (=> d!143055 (= (getCurrentListMapNoExtraKeys!6293 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) lt!590382)))

(declare-fun call!64788 () ListLongMap!21269)

(declare-fun bm!64785 () Bool)

(assert (=> bm!64785 (= call!64788 (getCurrentListMapNoExtraKeys!6293 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) defaultEntry!1340))))

(declare-fun b!1327014 () Bool)

(assert (=> b!1327014 (= e!756341 (ListLongMap!21270 Nil!30735))))

(declare-fun b!1327015 () Bool)

(declare-fun e!756346 () ListLongMap!21269)

(assert (=> b!1327015 (= e!756346 call!64788)))

(declare-fun e!756343 () Bool)

(declare-fun b!1327016 () Bool)

(assert (=> b!1327016 (= e!756343 (= lt!590382 (getCurrentListMapNoExtraKeys!6293 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) defaultEntry!1340)))))

(declare-fun b!1327017 () Bool)

(assert (=> b!1327017 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43800 _keys!1609)))))

(assert (=> b!1327017 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43801 _values!1337)))))

(assert (=> b!1327017 (= e!756344 (= (apply!1024 lt!590382 (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (get!21797 (select (arr!43249 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3585 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1327018 () Bool)

(declare-fun res!880677 () Bool)

(assert (=> b!1327018 (=> (not res!880677) (not e!756342))))

(assert (=> b!1327018 (= res!880677 (not (contains!8736 lt!590382 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1327019 () Bool)

(declare-fun e!756347 () Bool)

(assert (=> b!1327019 (= e!756347 (validKeyInArray!0 (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1327019 (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))

(declare-fun b!1327020 () Bool)

(assert (=> b!1327020 (= e!756345 e!756343)))

(declare-fun c!125834 () Bool)

(assert (=> b!1327020 (= c!125834 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43800 _keys!1609)))))

(declare-fun b!1327021 () Bool)

(assert (=> b!1327021 (= e!756342 e!756345)))

(declare-fun c!125833 () Bool)

(assert (=> b!1327021 (= c!125833 e!756347)))

(declare-fun res!880675 () Bool)

(assert (=> b!1327021 (=> (not res!880675) (not e!756347))))

(assert (=> b!1327021 (= res!880675 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43800 _keys!1609)))))

(declare-fun b!1327022 () Bool)

(declare-fun lt!590384 () Unit!43512)

(declare-fun lt!590381 () Unit!43512)

(assert (=> b!1327022 (= lt!590384 lt!590381)))

(declare-fun lt!590379 () V!53577)

(declare-fun lt!590385 () ListLongMap!21269)

(declare-fun lt!590380 () (_ BitVec 64))

(declare-fun lt!590383 () (_ BitVec 64))

(assert (=> b!1327022 (not (contains!8736 (+!4655 lt!590385 (tuple2!23613 lt!590380 lt!590379)) lt!590383))))

(declare-fun addStillNotContains!483 (ListLongMap!21269 (_ BitVec 64) V!53577 (_ BitVec 64)) Unit!43512)

(assert (=> b!1327022 (= lt!590381 (addStillNotContains!483 lt!590385 lt!590380 lt!590379 lt!590383))))

(assert (=> b!1327022 (= lt!590383 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1327022 (= lt!590379 (get!21797 (select (arr!43249 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3585 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1327022 (= lt!590380 (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(assert (=> b!1327022 (= lt!590385 call!64788)))

(assert (=> b!1327022 (= e!756346 (+!4655 call!64788 (tuple2!23613 (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21797 (select (arr!43249 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3585 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1327023 () Bool)

(assert (=> b!1327023 (= e!756341 e!756346)))

(declare-fun c!125836 () Bool)

(assert (=> b!1327023 (= c!125836 (validKeyInArray!0 (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun b!1327024 () Bool)

(declare-fun isEmpty!1085 (ListLongMap!21269) Bool)

(assert (=> b!1327024 (= e!756343 (isEmpty!1085 lt!590382))))

(assert (= (and d!143055 c!125835) b!1327014))

(assert (= (and d!143055 (not c!125835)) b!1327023))

(assert (= (and b!1327023 c!125836) b!1327022))

(assert (= (and b!1327023 (not c!125836)) b!1327015))

(assert (= (or b!1327022 b!1327015) bm!64785))

(assert (= (and d!143055 res!880674) b!1327018))

(assert (= (and b!1327018 res!880677) b!1327021))

(assert (= (and b!1327021 res!880675) b!1327019))

(assert (= (and b!1327021 c!125833) b!1327013))

(assert (= (and b!1327021 (not c!125833)) b!1327020))

(assert (= (and b!1327013 res!880676) b!1327017))

(assert (= (and b!1327020 c!125834) b!1327016))

(assert (= (and b!1327020 (not c!125834)) b!1327024))

(declare-fun b_lambda!23829 () Bool)

(assert (=> (not b_lambda!23829) (not b!1327017)))

(assert (=> b!1327017 t!44739))

(declare-fun b_and!49165 () Bool)

(assert (= b_and!49163 (and (=> t!44739 result!24669) b_and!49165)))

(declare-fun b_lambda!23831 () Bool)

(assert (=> (not b_lambda!23831) (not b!1327022)))

(assert (=> b!1327022 t!44739))

(declare-fun b_and!49167 () Bool)

(assert (= b_and!49165 (and (=> t!44739 result!24669) b_and!49167)))

(declare-fun m!1215739 () Bool)

(assert (=> b!1327018 m!1215739))

(declare-fun m!1215741 () Bool)

(assert (=> b!1327022 m!1215741))

(declare-fun m!1215743 () Bool)

(assert (=> b!1327022 m!1215743))

(assert (=> b!1327022 m!1215697))

(assert (=> b!1327022 m!1215633))

(assert (=> b!1327022 m!1215699))

(assert (=> b!1327022 m!1215697))

(declare-fun m!1215745 () Bool)

(assert (=> b!1327022 m!1215745))

(assert (=> b!1327022 m!1215741))

(declare-fun m!1215747 () Bool)

(assert (=> b!1327022 m!1215747))

(assert (=> b!1327022 m!1215633))

(assert (=> b!1327022 m!1215681))

(declare-fun m!1215749 () Bool)

(assert (=> b!1327016 m!1215749))

(assert (=> b!1327013 m!1215681))

(assert (=> b!1327013 m!1215681))

(declare-fun m!1215751 () Bool)

(assert (=> b!1327013 m!1215751))

(assert (=> b!1327019 m!1215681))

(assert (=> b!1327019 m!1215681))

(assert (=> b!1327019 m!1215701))

(declare-fun m!1215753 () Bool)

(assert (=> b!1327024 m!1215753))

(assert (=> bm!64785 m!1215749))

(declare-fun m!1215755 () Bool)

(assert (=> d!143055 m!1215755))

(assert (=> d!143055 m!1215525))

(assert (=> b!1327017 m!1215697))

(assert (=> b!1327017 m!1215633))

(assert (=> b!1327017 m!1215699))

(assert (=> b!1327017 m!1215697))

(assert (=> b!1327017 m!1215681))

(declare-fun m!1215757 () Bool)

(assert (=> b!1327017 m!1215757))

(assert (=> b!1327017 m!1215633))

(assert (=> b!1327017 m!1215681))

(assert (=> b!1327023 m!1215681))

(assert (=> b!1327023 m!1215681))

(assert (=> b!1327023 m!1215701))

(assert (=> b!1326941 d!143055))

(declare-fun d!143057 () Bool)

(assert (=> d!143057 (= (apply!1024 lt!590346 lt!590337) (get!21798 (getValueByKey!717 (toList!10650 lt!590346) lt!590337)))))

(declare-fun bs!37930 () Bool)

(assert (= bs!37930 d!143057))

(declare-fun m!1215759 () Bool)

(assert (=> bs!37930 m!1215759))

(assert (=> bs!37930 m!1215759))

(declare-fun m!1215761 () Bool)

(assert (=> bs!37930 m!1215761))

(assert (=> b!1326941 d!143057))

(declare-fun d!143059 () Bool)

(declare-fun e!756350 () Bool)

(assert (=> d!143059 e!756350))

(declare-fun res!880682 () Bool)

(assert (=> d!143059 (=> (not res!880682) (not e!756350))))

(declare-fun lt!590395 () ListLongMap!21269)

(assert (=> d!143059 (= res!880682 (contains!8736 lt!590395 (_1!11817 (tuple2!23613 lt!590343 zeroValue!1279))))))

(declare-fun lt!590394 () List!30738)

(assert (=> d!143059 (= lt!590395 (ListLongMap!21270 lt!590394))))

(declare-fun lt!590396 () Unit!43512)

(declare-fun lt!590397 () Unit!43512)

(assert (=> d!143059 (= lt!590396 lt!590397)))

(assert (=> d!143059 (= (getValueByKey!717 lt!590394 (_1!11817 (tuple2!23613 lt!590343 zeroValue!1279))) (Some!767 (_2!11817 (tuple2!23613 lt!590343 zeroValue!1279))))))

(declare-fun lemmaContainsTupThenGetReturnValue!360 (List!30738 (_ BitVec 64) V!53577) Unit!43512)

(assert (=> d!143059 (= lt!590397 (lemmaContainsTupThenGetReturnValue!360 lt!590394 (_1!11817 (tuple2!23613 lt!590343 zeroValue!1279)) (_2!11817 (tuple2!23613 lt!590343 zeroValue!1279))))))

(declare-fun insertStrictlySorted!489 (List!30738 (_ BitVec 64) V!53577) List!30738)

(assert (=> d!143059 (= lt!590394 (insertStrictlySorted!489 (toList!10650 lt!590341) (_1!11817 (tuple2!23613 lt!590343 zeroValue!1279)) (_2!11817 (tuple2!23613 lt!590343 zeroValue!1279))))))

(assert (=> d!143059 (= (+!4655 lt!590341 (tuple2!23613 lt!590343 zeroValue!1279)) lt!590395)))

(declare-fun b!1327029 () Bool)

(declare-fun res!880683 () Bool)

(assert (=> b!1327029 (=> (not res!880683) (not e!756350))))

(assert (=> b!1327029 (= res!880683 (= (getValueByKey!717 (toList!10650 lt!590395) (_1!11817 (tuple2!23613 lt!590343 zeroValue!1279))) (Some!767 (_2!11817 (tuple2!23613 lt!590343 zeroValue!1279)))))))

(declare-fun b!1327030 () Bool)

(declare-fun contains!8739 (List!30738 tuple2!23612) Bool)

(assert (=> b!1327030 (= e!756350 (contains!8739 (toList!10650 lt!590395) (tuple2!23613 lt!590343 zeroValue!1279)))))

(assert (= (and d!143059 res!880682) b!1327029))

(assert (= (and b!1327029 res!880683) b!1327030))

(declare-fun m!1215763 () Bool)

(assert (=> d!143059 m!1215763))

(declare-fun m!1215765 () Bool)

(assert (=> d!143059 m!1215765))

(declare-fun m!1215767 () Bool)

(assert (=> d!143059 m!1215767))

(declare-fun m!1215769 () Bool)

(assert (=> d!143059 m!1215769))

(declare-fun m!1215771 () Bool)

(assert (=> b!1327029 m!1215771))

(declare-fun m!1215773 () Bool)

(assert (=> b!1327030 m!1215773))

(assert (=> b!1326941 d!143059))

(declare-fun d!143061 () Bool)

(declare-fun e!756351 () Bool)

(assert (=> d!143061 e!756351))

(declare-fun res!880684 () Bool)

(assert (=> d!143061 (=> (not res!880684) (not e!756351))))

(declare-fun lt!590399 () ListLongMap!21269)

(assert (=> d!143061 (= res!880684 (contains!8736 lt!590399 (_1!11817 (tuple2!23613 lt!590344 minValue!1279))))))

(declare-fun lt!590398 () List!30738)

(assert (=> d!143061 (= lt!590399 (ListLongMap!21270 lt!590398))))

(declare-fun lt!590400 () Unit!43512)

(declare-fun lt!590401 () Unit!43512)

(assert (=> d!143061 (= lt!590400 lt!590401)))

(assert (=> d!143061 (= (getValueByKey!717 lt!590398 (_1!11817 (tuple2!23613 lt!590344 minValue!1279))) (Some!767 (_2!11817 (tuple2!23613 lt!590344 minValue!1279))))))

(assert (=> d!143061 (= lt!590401 (lemmaContainsTupThenGetReturnValue!360 lt!590398 (_1!11817 (tuple2!23613 lt!590344 minValue!1279)) (_2!11817 (tuple2!23613 lt!590344 minValue!1279))))))

(assert (=> d!143061 (= lt!590398 (insertStrictlySorted!489 (toList!10650 lt!590328) (_1!11817 (tuple2!23613 lt!590344 minValue!1279)) (_2!11817 (tuple2!23613 lt!590344 minValue!1279))))))

(assert (=> d!143061 (= (+!4655 lt!590328 (tuple2!23613 lt!590344 minValue!1279)) lt!590399)))

(declare-fun b!1327031 () Bool)

(declare-fun res!880685 () Bool)

(assert (=> b!1327031 (=> (not res!880685) (not e!756351))))

(assert (=> b!1327031 (= res!880685 (= (getValueByKey!717 (toList!10650 lt!590399) (_1!11817 (tuple2!23613 lt!590344 minValue!1279))) (Some!767 (_2!11817 (tuple2!23613 lt!590344 minValue!1279)))))))

(declare-fun b!1327032 () Bool)

(assert (=> b!1327032 (= e!756351 (contains!8739 (toList!10650 lt!590399) (tuple2!23613 lt!590344 minValue!1279)))))

(assert (= (and d!143061 res!880684) b!1327031))

(assert (= (and b!1327031 res!880685) b!1327032))

(declare-fun m!1215775 () Bool)

(assert (=> d!143061 m!1215775))

(declare-fun m!1215777 () Bool)

(assert (=> d!143061 m!1215777))

(declare-fun m!1215779 () Bool)

(assert (=> d!143061 m!1215779))

(declare-fun m!1215781 () Bool)

(assert (=> d!143061 m!1215781))

(declare-fun m!1215783 () Bool)

(assert (=> b!1327031 m!1215783))

(declare-fun m!1215785 () Bool)

(assert (=> b!1327032 m!1215785))

(assert (=> b!1326941 d!143061))

(declare-fun d!143063 () Bool)

(assert (=> d!143063 (= (apply!1024 (+!4655 lt!590348 (tuple2!23613 lt!590332 zeroValue!1279)) lt!590339) (get!21798 (getValueByKey!717 (toList!10650 (+!4655 lt!590348 (tuple2!23613 lt!590332 zeroValue!1279))) lt!590339)))))

(declare-fun bs!37931 () Bool)

(assert (= bs!37931 d!143063))

(declare-fun m!1215787 () Bool)

(assert (=> bs!37931 m!1215787))

(assert (=> bs!37931 m!1215787))

(declare-fun m!1215789 () Bool)

(assert (=> bs!37931 m!1215789))

(assert (=> b!1326941 d!143063))

(declare-fun d!143065 () Bool)

(assert (=> d!143065 (= (apply!1024 (+!4655 lt!590328 (tuple2!23613 lt!590344 minValue!1279)) lt!590338) (get!21798 (getValueByKey!717 (toList!10650 (+!4655 lt!590328 (tuple2!23613 lt!590344 minValue!1279))) lt!590338)))))

(declare-fun bs!37932 () Bool)

(assert (= bs!37932 d!143065))

(declare-fun m!1215791 () Bool)

(assert (=> bs!37932 m!1215791))

(assert (=> bs!37932 m!1215791))

(declare-fun m!1215793 () Bool)

(assert (=> bs!37932 m!1215793))

(assert (=> b!1326941 d!143065))

(declare-fun d!143067 () Bool)

(declare-fun e!756352 () Bool)

(assert (=> d!143067 e!756352))

(declare-fun res!880686 () Bool)

(assert (=> d!143067 (=> res!880686 e!756352)))

(declare-fun lt!590405 () Bool)

(assert (=> d!143067 (= res!880686 (not lt!590405))))

(declare-fun lt!590404 () Bool)

(assert (=> d!143067 (= lt!590405 lt!590404)))

(declare-fun lt!590403 () Unit!43512)

(declare-fun e!756353 () Unit!43512)

(assert (=> d!143067 (= lt!590403 e!756353)))

(declare-fun c!125837 () Bool)

(assert (=> d!143067 (= c!125837 lt!590404)))

(assert (=> d!143067 (= lt!590404 (containsKey!734 (toList!10650 (+!4655 lt!590341 (tuple2!23613 lt!590343 zeroValue!1279))) lt!590342))))

(assert (=> d!143067 (= (contains!8736 (+!4655 lt!590341 (tuple2!23613 lt!590343 zeroValue!1279)) lt!590342) lt!590405)))

(declare-fun b!1327033 () Bool)

(declare-fun lt!590402 () Unit!43512)

(assert (=> b!1327033 (= e!756353 lt!590402)))

(assert (=> b!1327033 (= lt!590402 (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10650 (+!4655 lt!590341 (tuple2!23613 lt!590343 zeroValue!1279))) lt!590342))))

(assert (=> b!1327033 (isDefined!524 (getValueByKey!717 (toList!10650 (+!4655 lt!590341 (tuple2!23613 lt!590343 zeroValue!1279))) lt!590342))))

(declare-fun b!1327034 () Bool)

(declare-fun Unit!43518 () Unit!43512)

(assert (=> b!1327034 (= e!756353 Unit!43518)))

(declare-fun b!1327035 () Bool)

(assert (=> b!1327035 (= e!756352 (isDefined!524 (getValueByKey!717 (toList!10650 (+!4655 lt!590341 (tuple2!23613 lt!590343 zeroValue!1279))) lt!590342)))))

(assert (= (and d!143067 c!125837) b!1327033))

(assert (= (and d!143067 (not c!125837)) b!1327034))

(assert (= (and d!143067 (not res!880686)) b!1327035))

(declare-fun m!1215795 () Bool)

(assert (=> d!143067 m!1215795))

(declare-fun m!1215797 () Bool)

(assert (=> b!1327033 m!1215797))

(declare-fun m!1215799 () Bool)

(assert (=> b!1327033 m!1215799))

(assert (=> b!1327033 m!1215799))

(declare-fun m!1215801 () Bool)

(assert (=> b!1327033 m!1215801))

(assert (=> b!1327035 m!1215799))

(assert (=> b!1327035 m!1215799))

(assert (=> b!1327035 m!1215801))

(assert (=> b!1326941 d!143067))

(declare-fun d!143069 () Bool)

(assert (=> d!143069 (= (apply!1024 lt!590348 lt!590339) (get!21798 (getValueByKey!717 (toList!10650 lt!590348) lt!590339)))))

(declare-fun bs!37933 () Bool)

(assert (= bs!37933 d!143069))

(declare-fun m!1215803 () Bool)

(assert (=> bs!37933 m!1215803))

(assert (=> bs!37933 m!1215803))

(declare-fun m!1215805 () Bool)

(assert (=> bs!37933 m!1215805))

(assert (=> b!1326941 d!143069))

(declare-fun d!143071 () Bool)

(assert (=> d!143071 (= (apply!1024 (+!4655 lt!590346 (tuple2!23613 lt!590329 minValue!1279)) lt!590337) (apply!1024 lt!590346 lt!590337))))

(declare-fun lt!590406 () Unit!43512)

(assert (=> d!143071 (= lt!590406 (choose!1962 lt!590346 lt!590329 minValue!1279 lt!590337))))

(declare-fun e!756354 () Bool)

(assert (=> d!143071 e!756354))

(declare-fun res!880687 () Bool)

(assert (=> d!143071 (=> (not res!880687) (not e!756354))))

(assert (=> d!143071 (= res!880687 (contains!8736 lt!590346 lt!590337))))

(assert (=> d!143071 (= (addApplyDifferent!562 lt!590346 lt!590329 minValue!1279 lt!590337) lt!590406)))

(declare-fun b!1327036 () Bool)

(assert (=> b!1327036 (= e!756354 (not (= lt!590337 lt!590329)))))

(assert (= (and d!143071 res!880687) b!1327036))

(assert (=> d!143071 m!1215677))

(assert (=> d!143071 m!1215679))

(declare-fun m!1215807 () Bool)

(assert (=> d!143071 m!1215807))

(declare-fun m!1215809 () Bool)

(assert (=> d!143071 m!1215809))

(assert (=> d!143071 m!1215671))

(assert (=> d!143071 m!1215677))

(assert (=> b!1326941 d!143071))

(declare-fun d!143073 () Bool)

(declare-fun e!756355 () Bool)

(assert (=> d!143073 e!756355))

(declare-fun res!880688 () Bool)

(assert (=> d!143073 (=> (not res!880688) (not e!756355))))

(declare-fun lt!590408 () ListLongMap!21269)

(assert (=> d!143073 (= res!880688 (contains!8736 lt!590408 (_1!11817 (tuple2!23613 lt!590329 minValue!1279))))))

(declare-fun lt!590407 () List!30738)

(assert (=> d!143073 (= lt!590408 (ListLongMap!21270 lt!590407))))

(declare-fun lt!590409 () Unit!43512)

(declare-fun lt!590410 () Unit!43512)

(assert (=> d!143073 (= lt!590409 lt!590410)))

(assert (=> d!143073 (= (getValueByKey!717 lt!590407 (_1!11817 (tuple2!23613 lt!590329 minValue!1279))) (Some!767 (_2!11817 (tuple2!23613 lt!590329 minValue!1279))))))

(assert (=> d!143073 (= lt!590410 (lemmaContainsTupThenGetReturnValue!360 lt!590407 (_1!11817 (tuple2!23613 lt!590329 minValue!1279)) (_2!11817 (tuple2!23613 lt!590329 minValue!1279))))))

(assert (=> d!143073 (= lt!590407 (insertStrictlySorted!489 (toList!10650 lt!590346) (_1!11817 (tuple2!23613 lt!590329 minValue!1279)) (_2!11817 (tuple2!23613 lt!590329 minValue!1279))))))

(assert (=> d!143073 (= (+!4655 lt!590346 (tuple2!23613 lt!590329 minValue!1279)) lt!590408)))

(declare-fun b!1327037 () Bool)

(declare-fun res!880689 () Bool)

(assert (=> b!1327037 (=> (not res!880689) (not e!756355))))

(assert (=> b!1327037 (= res!880689 (= (getValueByKey!717 (toList!10650 lt!590408) (_1!11817 (tuple2!23613 lt!590329 minValue!1279))) (Some!767 (_2!11817 (tuple2!23613 lt!590329 minValue!1279)))))))

(declare-fun b!1327038 () Bool)

(assert (=> b!1327038 (= e!756355 (contains!8739 (toList!10650 lt!590408) (tuple2!23613 lt!590329 minValue!1279)))))

(assert (= (and d!143073 res!880688) b!1327037))

(assert (= (and b!1327037 res!880689) b!1327038))

(declare-fun m!1215811 () Bool)

(assert (=> d!143073 m!1215811))

(declare-fun m!1215813 () Bool)

(assert (=> d!143073 m!1215813))

(declare-fun m!1215815 () Bool)

(assert (=> d!143073 m!1215815))

(declare-fun m!1215817 () Bool)

(assert (=> d!143073 m!1215817))

(declare-fun m!1215819 () Bool)

(assert (=> b!1327037 m!1215819))

(declare-fun m!1215821 () Bool)

(assert (=> b!1327038 m!1215821))

(assert (=> b!1326941 d!143073))

(declare-fun d!143075 () Bool)

(declare-fun e!756356 () Bool)

(assert (=> d!143075 e!756356))

(declare-fun res!880690 () Bool)

(assert (=> d!143075 (=> (not res!880690) (not e!756356))))

(declare-fun lt!590412 () ListLongMap!21269)

(assert (=> d!143075 (= res!880690 (contains!8736 lt!590412 (_1!11817 (tuple2!23613 lt!590332 zeroValue!1279))))))

(declare-fun lt!590411 () List!30738)

(assert (=> d!143075 (= lt!590412 (ListLongMap!21270 lt!590411))))

(declare-fun lt!590413 () Unit!43512)

(declare-fun lt!590414 () Unit!43512)

(assert (=> d!143075 (= lt!590413 lt!590414)))

(assert (=> d!143075 (= (getValueByKey!717 lt!590411 (_1!11817 (tuple2!23613 lt!590332 zeroValue!1279))) (Some!767 (_2!11817 (tuple2!23613 lt!590332 zeroValue!1279))))))

(assert (=> d!143075 (= lt!590414 (lemmaContainsTupThenGetReturnValue!360 lt!590411 (_1!11817 (tuple2!23613 lt!590332 zeroValue!1279)) (_2!11817 (tuple2!23613 lt!590332 zeroValue!1279))))))

(assert (=> d!143075 (= lt!590411 (insertStrictlySorted!489 (toList!10650 lt!590348) (_1!11817 (tuple2!23613 lt!590332 zeroValue!1279)) (_2!11817 (tuple2!23613 lt!590332 zeroValue!1279))))))

(assert (=> d!143075 (= (+!4655 lt!590348 (tuple2!23613 lt!590332 zeroValue!1279)) lt!590412)))

(declare-fun b!1327039 () Bool)

(declare-fun res!880691 () Bool)

(assert (=> b!1327039 (=> (not res!880691) (not e!756356))))

(assert (=> b!1327039 (= res!880691 (= (getValueByKey!717 (toList!10650 lt!590412) (_1!11817 (tuple2!23613 lt!590332 zeroValue!1279))) (Some!767 (_2!11817 (tuple2!23613 lt!590332 zeroValue!1279)))))))

(declare-fun b!1327040 () Bool)

(assert (=> b!1327040 (= e!756356 (contains!8739 (toList!10650 lt!590412) (tuple2!23613 lt!590332 zeroValue!1279)))))

(assert (= (and d!143075 res!880690) b!1327039))

(assert (= (and b!1327039 res!880691) b!1327040))

(declare-fun m!1215823 () Bool)

(assert (=> d!143075 m!1215823))

(declare-fun m!1215825 () Bool)

(assert (=> d!143075 m!1215825))

(declare-fun m!1215827 () Bool)

(assert (=> d!143075 m!1215827))

(declare-fun m!1215829 () Bool)

(assert (=> d!143075 m!1215829))

(declare-fun m!1215831 () Bool)

(assert (=> b!1327039 m!1215831))

(declare-fun m!1215833 () Bool)

(assert (=> b!1327040 m!1215833))

(assert (=> b!1326941 d!143075))

(declare-fun d!143077 () Bool)

(assert (=> d!143077 (= (apply!1024 (+!4655 lt!590328 (tuple2!23613 lt!590344 minValue!1279)) lt!590338) (apply!1024 lt!590328 lt!590338))))

(declare-fun lt!590415 () Unit!43512)

(assert (=> d!143077 (= lt!590415 (choose!1962 lt!590328 lt!590344 minValue!1279 lt!590338))))

(declare-fun e!756357 () Bool)

(assert (=> d!143077 e!756357))

(declare-fun res!880692 () Bool)

(assert (=> d!143077 (=> (not res!880692) (not e!756357))))

(assert (=> d!143077 (= res!880692 (contains!8736 lt!590328 lt!590338))))

(assert (=> d!143077 (= (addApplyDifferent!562 lt!590328 lt!590344 minValue!1279 lt!590338) lt!590415)))

(declare-fun b!1327041 () Bool)

(assert (=> b!1327041 (= e!756357 (not (= lt!590338 lt!590344)))))

(assert (= (and d!143077 res!880692) b!1327041))

(assert (=> d!143077 m!1215673))

(assert (=> d!143077 m!1215675))

(declare-fun m!1215835 () Bool)

(assert (=> d!143077 m!1215835))

(declare-fun m!1215837 () Bool)

(assert (=> d!143077 m!1215837))

(assert (=> d!143077 m!1215655))

(assert (=> d!143077 m!1215673))

(assert (=> b!1326941 d!143077))

(declare-fun d!143079 () Bool)

(declare-fun e!756358 () Bool)

(assert (=> d!143079 e!756358))

(declare-fun res!880693 () Bool)

(assert (=> d!143079 (=> (not res!880693) (not e!756358))))

(declare-fun lt!590417 () ListLongMap!21269)

(assert (=> d!143079 (= res!880693 (contains!8736 lt!590417 (_1!11817 (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun lt!590416 () List!30738)

(assert (=> d!143079 (= lt!590417 (ListLongMap!21270 lt!590416))))

(declare-fun lt!590418 () Unit!43512)

(declare-fun lt!590419 () Unit!43512)

(assert (=> d!143079 (= lt!590418 lt!590419)))

(assert (=> d!143079 (= (getValueByKey!717 lt!590416 (_1!11817 (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!767 (_2!11817 (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143079 (= lt!590419 (lemmaContainsTupThenGetReturnValue!360 lt!590416 (_1!11817 (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11817 (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143079 (= lt!590416 (insertStrictlySorted!489 (toList!10650 call!64775) (_1!11817 (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11817 (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143079 (= (+!4655 call!64775 (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) lt!590417)))

(declare-fun b!1327042 () Bool)

(declare-fun res!880694 () Bool)

(assert (=> b!1327042 (=> (not res!880694) (not e!756358))))

(assert (=> b!1327042 (= res!880694 (= (getValueByKey!717 (toList!10650 lt!590417) (_1!11817 (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!767 (_2!11817 (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun b!1327043 () Bool)

(assert (=> b!1327043 (= e!756358 (contains!8739 (toList!10650 lt!590417) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(assert (= (and d!143079 res!880693) b!1327042))

(assert (= (and b!1327042 res!880694) b!1327043))

(declare-fun m!1215839 () Bool)

(assert (=> d!143079 m!1215839))

(declare-fun m!1215841 () Bool)

(assert (=> d!143079 m!1215841))

(declare-fun m!1215843 () Bool)

(assert (=> d!143079 m!1215843))

(declare-fun m!1215845 () Bool)

(assert (=> d!143079 m!1215845))

(declare-fun m!1215847 () Bool)

(assert (=> b!1327042 m!1215847))

(declare-fun m!1215849 () Bool)

(assert (=> b!1327043 m!1215849))

(assert (=> b!1326942 d!143079))

(declare-fun d!143081 () Bool)

(assert (=> d!143081 (isDefined!524 (getValueByKey!717 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(declare-fun lt!590422 () Unit!43512)

(declare-fun choose!1963 (List!30738 (_ BitVec 64)) Unit!43512)

(assert (=> d!143081 (= lt!590422 (choose!1963 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(declare-fun e!756361 () Bool)

(assert (=> d!143081 e!756361))

(declare-fun res!880697 () Bool)

(assert (=> d!143081 (=> (not res!880697) (not e!756361))))

(declare-fun isStrictlySorted!874 (List!30738) Bool)

(assert (=> d!143081 (= res!880697 (isStrictlySorted!874 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))))

(assert (=> d!143081 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164) lt!590422)))

(declare-fun b!1327046 () Bool)

(assert (=> b!1327046 (= e!756361 (containsKey!734 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(assert (= (and d!143081 res!880697) b!1327046))

(assert (=> d!143081 m!1215583))

(assert (=> d!143081 m!1215583))

(assert (=> d!143081 m!1215585))

(declare-fun m!1215851 () Bool)

(assert (=> d!143081 m!1215851))

(declare-fun m!1215853 () Bool)

(assert (=> d!143081 m!1215853))

(assert (=> b!1327046 m!1215579))

(assert (=> b!1326857 d!143081))

(declare-fun d!143083 () Bool)

(declare-fun isEmpty!1086 (Option!768) Bool)

(assert (=> d!143083 (= (isDefined!524 (getValueByKey!717 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164)) (not (isEmpty!1086 (getValueByKey!717 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))))

(declare-fun bs!37934 () Bool)

(assert (= bs!37934 d!143083))

(assert (=> bs!37934 m!1215583))

(declare-fun m!1215855 () Bool)

(assert (=> bs!37934 m!1215855))

(assert (=> b!1326857 d!143083))

(declare-fun b!1327058 () Bool)

(declare-fun e!756367 () Option!768)

(assert (=> b!1327058 (= e!756367 None!766)))

(declare-fun c!125842 () Bool)

(declare-fun d!143085 () Bool)

(assert (=> d!143085 (= c!125842 (and ((_ is Cons!30734) (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) (= (_1!11817 (h!31943 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164)))))

(declare-fun e!756366 () Option!768)

(assert (=> d!143085 (= (getValueByKey!717 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164) e!756366)))

(declare-fun b!1327056 () Bool)

(assert (=> b!1327056 (= e!756366 e!756367)))

(declare-fun c!125843 () Bool)

(assert (=> b!1327056 (= c!125843 (and ((_ is Cons!30734) (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) (not (= (_1!11817 (h!31943 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164))))))

(declare-fun b!1327057 () Bool)

(assert (=> b!1327057 (= e!756367 (getValueByKey!717 (t!44734 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) k0!1164))))

(declare-fun b!1327055 () Bool)

(assert (=> b!1327055 (= e!756366 (Some!767 (_2!11817 (h!31943 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))))))

(assert (= (and d!143085 c!125842) b!1327055))

(assert (= (and d!143085 (not c!125842)) b!1327056))

(assert (= (and b!1327056 c!125843) b!1327057))

(assert (= (and b!1327056 (not c!125843)) b!1327058))

(declare-fun m!1215857 () Bool)

(assert (=> b!1327057 m!1215857))

(assert (=> b!1326857 d!143085))

(declare-fun d!143087 () Bool)

(declare-fun e!756368 () Bool)

(assert (=> d!143087 e!756368))

(declare-fun res!880698 () Bool)

(assert (=> d!143087 (=> res!880698 e!756368)))

(declare-fun lt!590426 () Bool)

(assert (=> d!143087 (= res!880698 (not lt!590426))))

(declare-fun lt!590425 () Bool)

(assert (=> d!143087 (= lt!590426 lt!590425)))

(declare-fun lt!590424 () Unit!43512)

(declare-fun e!756369 () Unit!43512)

(assert (=> d!143087 (= lt!590424 e!756369)))

(declare-fun c!125844 () Bool)

(assert (=> d!143087 (= c!125844 lt!590425)))

(assert (=> d!143087 (= lt!590425 (containsKey!734 (toList!10650 lt!590336) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143087 (= (contains!8736 lt!590336 #b0000000000000000000000000000000000000000000000000000000000000000) lt!590426)))

(declare-fun b!1327059 () Bool)

(declare-fun lt!590423 () Unit!43512)

(assert (=> b!1327059 (= e!756369 lt!590423)))

(assert (=> b!1327059 (= lt!590423 (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10650 lt!590336) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1327059 (isDefined!524 (getValueByKey!717 (toList!10650 lt!590336) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1327060 () Bool)

(declare-fun Unit!43519 () Unit!43512)

(assert (=> b!1327060 (= e!756369 Unit!43519)))

(declare-fun b!1327061 () Bool)

(assert (=> b!1327061 (= e!756368 (isDefined!524 (getValueByKey!717 (toList!10650 lt!590336) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143087 c!125844) b!1327059))

(assert (= (and d!143087 (not c!125844)) b!1327060))

(assert (= (and d!143087 (not res!880698)) b!1327061))

(declare-fun m!1215859 () Bool)

(assert (=> d!143087 m!1215859))

(declare-fun m!1215861 () Bool)

(assert (=> b!1327059 m!1215861))

(declare-fun m!1215863 () Bool)

(assert (=> b!1327059 m!1215863))

(assert (=> b!1327059 m!1215863))

(declare-fun m!1215865 () Bool)

(assert (=> b!1327059 m!1215865))

(assert (=> b!1327061 m!1215863))

(assert (=> b!1327061 m!1215863))

(assert (=> b!1327061 m!1215865))

(assert (=> bm!64775 d!143087))

(assert (=> b!1326906 d!143027))

(assert (=> b!1326859 d!143083))

(assert (=> b!1326859 d!143085))

(declare-fun d!143089 () Bool)

(declare-fun e!756370 () Bool)

(assert (=> d!143089 e!756370))

(declare-fun res!880699 () Bool)

(assert (=> d!143089 (=> (not res!880699) (not e!756370))))

(declare-fun lt!590428 () ListLongMap!21269)

(assert (=> d!143089 (= res!880699 (contains!8736 lt!590428 (_1!11817 (ite (or c!125806 c!125809) (tuple2!23613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun lt!590427 () List!30738)

(assert (=> d!143089 (= lt!590428 (ListLongMap!21270 lt!590427))))

(declare-fun lt!590429 () Unit!43512)

(declare-fun lt!590430 () Unit!43512)

(assert (=> d!143089 (= lt!590429 lt!590430)))

(assert (=> d!143089 (= (getValueByKey!717 lt!590427 (_1!11817 (ite (or c!125806 c!125809) (tuple2!23613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (Some!767 (_2!11817 (ite (or c!125806 c!125809) (tuple2!23613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!143089 (= lt!590430 (lemmaContainsTupThenGetReturnValue!360 lt!590427 (_1!11817 (ite (or c!125806 c!125809) (tuple2!23613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (_2!11817 (ite (or c!125806 c!125809) (tuple2!23613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!143089 (= lt!590427 (insertStrictlySorted!489 (toList!10650 (ite c!125806 call!64772 (ite c!125809 call!64766 call!64767))) (_1!11817 (ite (or c!125806 c!125809) (tuple2!23613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (_2!11817 (ite (or c!125806 c!125809) (tuple2!23613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!143089 (= (+!4655 (ite c!125806 call!64772 (ite c!125809 call!64766 call!64767)) (ite (or c!125806 c!125809) (tuple2!23613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) lt!590428)))

(declare-fun b!1327062 () Bool)

(declare-fun res!880700 () Bool)

(assert (=> b!1327062 (=> (not res!880700) (not e!756370))))

(assert (=> b!1327062 (= res!880700 (= (getValueByKey!717 (toList!10650 lt!590428) (_1!11817 (ite (or c!125806 c!125809) (tuple2!23613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (Some!767 (_2!11817 (ite (or c!125806 c!125809) (tuple2!23613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))))

(declare-fun b!1327063 () Bool)

(assert (=> b!1327063 (= e!756370 (contains!8739 (toList!10650 lt!590428) (ite (or c!125806 c!125809) (tuple2!23613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (= (and d!143089 res!880699) b!1327062))

(assert (= (and b!1327062 res!880700) b!1327063))

(declare-fun m!1215867 () Bool)

(assert (=> d!143089 m!1215867))

(declare-fun m!1215869 () Bool)

(assert (=> d!143089 m!1215869))

(declare-fun m!1215871 () Bool)

(assert (=> d!143089 m!1215871))

(declare-fun m!1215873 () Bool)

(assert (=> d!143089 m!1215873))

(declare-fun m!1215875 () Bool)

(assert (=> b!1327062 m!1215875))

(declare-fun m!1215877 () Bool)

(assert (=> b!1327063 m!1215877))

(assert (=> bm!64766 d!143089))

(declare-fun d!143091 () Bool)

(assert (=> d!143091 (= (apply!1024 lt!590336 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21798 (getValueByKey!717 (toList!10650 lt!590336) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37935 () Bool)

(assert (= bs!37935 d!143091))

(declare-fun m!1215879 () Bool)

(assert (=> bs!37935 m!1215879))

(assert (=> bs!37935 m!1215879))

(declare-fun m!1215881 () Bool)

(assert (=> bs!37935 m!1215881))

(assert (=> b!1326944 d!143091))

(declare-fun d!143093 () Bool)

(assert (=> d!143093 (= (apply!1024 lt!590336 (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (get!21798 (getValueByKey!717 (toList!10650 lt!590336) (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))))

(declare-fun bs!37936 () Bool)

(assert (= bs!37936 d!143093))

(assert (=> bs!37936 m!1215681))

(declare-fun m!1215883 () Bool)

(assert (=> bs!37936 m!1215883))

(assert (=> bs!37936 m!1215883))

(declare-fun m!1215885 () Bool)

(assert (=> bs!37936 m!1215885))

(assert (=> b!1326928 d!143093))

(declare-fun d!143095 () Bool)

(declare-fun c!125847 () Bool)

(assert (=> d!143095 (= c!125847 ((_ is ValueCellFull!17279) (select (arr!43249 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun e!756373 () V!53577)

(assert (=> d!143095 (= (get!21797 (select (arr!43249 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3585 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)) e!756373)))

(declare-fun b!1327068 () Bool)

(declare-fun get!21799 (ValueCell!17279 V!53577) V!53577)

(assert (=> b!1327068 (= e!756373 (get!21799 (select (arr!43249 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3585 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1327069 () Bool)

(declare-fun get!21800 (ValueCell!17279 V!53577) V!53577)

(assert (=> b!1327069 (= e!756373 (get!21800 (select (arr!43249 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3585 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143095 c!125847) b!1327068))

(assert (= (and d!143095 (not c!125847)) b!1327069))

(assert (=> b!1327068 m!1215697))

(assert (=> b!1327068 m!1215633))

(declare-fun m!1215887 () Bool)

(assert (=> b!1327068 m!1215887))

(assert (=> b!1327069 m!1215697))

(assert (=> b!1327069 m!1215633))

(declare-fun m!1215889 () Bool)

(assert (=> b!1327069 m!1215889))

(assert (=> b!1326928 d!143095))

(declare-fun d!143097 () Bool)

(assert (=> d!143097 (= (apply!1024 lt!590310 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21798 (getValueByKey!717 (toList!10650 lt!590310) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37937 () Bool)

(assert (= bs!37937 d!143097))

(declare-fun m!1215891 () Bool)

(assert (=> bs!37937 m!1215891))

(assert (=> bs!37937 m!1215891))

(declare-fun m!1215893 () Bool)

(assert (=> bs!37937 m!1215893))

(assert (=> b!1326907 d!143097))

(declare-fun d!143099 () Bool)

(declare-fun e!756374 () Bool)

(assert (=> d!143099 e!756374))

(declare-fun res!880701 () Bool)

(assert (=> d!143099 (=> res!880701 e!756374)))

(declare-fun lt!590434 () Bool)

(assert (=> d!143099 (= res!880701 (not lt!590434))))

(declare-fun lt!590433 () Bool)

(assert (=> d!143099 (= lt!590434 lt!590433)))

(declare-fun lt!590432 () Unit!43512)

(declare-fun e!756375 () Unit!43512)

(assert (=> d!143099 (= lt!590432 e!756375)))

(declare-fun c!125848 () Bool)

(assert (=> d!143099 (= c!125848 lt!590433)))

(assert (=> d!143099 (= lt!590433 (containsKey!734 (toList!10650 lt!590336) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143099 (= (contains!8736 lt!590336 #b1000000000000000000000000000000000000000000000000000000000000000) lt!590434)))

(declare-fun b!1327070 () Bool)

(declare-fun lt!590431 () Unit!43512)

(assert (=> b!1327070 (= e!756375 lt!590431)))

(assert (=> b!1327070 (= lt!590431 (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10650 lt!590336) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1327070 (isDefined!524 (getValueByKey!717 (toList!10650 lt!590336) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1327071 () Bool)

(declare-fun Unit!43520 () Unit!43512)

(assert (=> b!1327071 (= e!756375 Unit!43520)))

(declare-fun b!1327072 () Bool)

(assert (=> b!1327072 (= e!756374 (isDefined!524 (getValueByKey!717 (toList!10650 lt!590336) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143099 c!125848) b!1327070))

(assert (= (and d!143099 (not c!125848)) b!1327071))

(assert (= (and d!143099 (not res!880701)) b!1327072))

(declare-fun m!1215895 () Bool)

(assert (=> d!143099 m!1215895))

(declare-fun m!1215897 () Bool)

(assert (=> b!1327070 m!1215897))

(assert (=> b!1327070 m!1215879))

(assert (=> b!1327070 m!1215879))

(declare-fun m!1215899 () Bool)

(assert (=> b!1327070 m!1215899))

(assert (=> b!1327072 m!1215879))

(assert (=> b!1327072 m!1215879))

(assert (=> b!1327072 m!1215899))

(assert (=> bm!64771 d!143099))

(declare-fun d!143101 () Bool)

(declare-fun e!756376 () Bool)

(assert (=> d!143101 e!756376))

(declare-fun res!880702 () Bool)

(assert (=> d!143101 (=> res!880702 e!756376)))

(declare-fun lt!590438 () Bool)

(assert (=> d!143101 (= res!880702 (not lt!590438))))

(declare-fun lt!590437 () Bool)

(assert (=> d!143101 (= lt!590438 lt!590437)))

(declare-fun lt!590436 () Unit!43512)

(declare-fun e!756377 () Unit!43512)

(assert (=> d!143101 (= lt!590436 e!756377)))

(declare-fun c!125849 () Bool)

(assert (=> d!143101 (= c!125849 lt!590437)))

(assert (=> d!143101 (= lt!590437 (containsKey!734 (toList!10650 lt!590336) (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> d!143101 (= (contains!8736 lt!590336 (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) lt!590438)))

(declare-fun b!1327073 () Bool)

(declare-fun lt!590435 () Unit!43512)

(assert (=> b!1327073 (= e!756377 lt!590435)))

(assert (=> b!1327073 (= lt!590435 (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10650 lt!590336) (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1327073 (isDefined!524 (getValueByKey!717 (toList!10650 lt!590336) (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun b!1327074 () Bool)

(declare-fun Unit!43521 () Unit!43512)

(assert (=> b!1327074 (= e!756377 Unit!43521)))

(declare-fun b!1327075 () Bool)

(assert (=> b!1327075 (= e!756376 (isDefined!524 (getValueByKey!717 (toList!10650 lt!590336) (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))))

(assert (= (and d!143101 c!125849) b!1327073))

(assert (= (and d!143101 (not c!125849)) b!1327074))

(assert (= (and d!143101 (not res!880702)) b!1327075))

(assert (=> d!143101 m!1215681))

(declare-fun m!1215901 () Bool)

(assert (=> d!143101 m!1215901))

(assert (=> b!1327073 m!1215681))

(declare-fun m!1215903 () Bool)

(assert (=> b!1327073 m!1215903))

(assert (=> b!1327073 m!1215681))

(assert (=> b!1327073 m!1215883))

(assert (=> b!1327073 m!1215883))

(declare-fun m!1215905 () Bool)

(assert (=> b!1327073 m!1215905))

(assert (=> b!1327075 m!1215681))

(assert (=> b!1327075 m!1215883))

(assert (=> b!1327075 m!1215883))

(assert (=> b!1327075 m!1215905))

(assert (=> b!1326929 d!143101))

(declare-fun d!143103 () Bool)

(assert (=> d!143103 (arrayContainsKey!0 _keys!1609 lt!590356 #b00000000000000000000000000000000)))

(declare-fun lt!590441 () Unit!43512)

(declare-fun choose!13 (array!89551 (_ BitVec 64) (_ BitVec 32)) Unit!43512)

(assert (=> d!143103 (= lt!590441 (choose!13 _keys!1609 lt!590356 #b00000000000000000000000000000000))))

(assert (=> d!143103 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!143103 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!590356 #b00000000000000000000000000000000) lt!590441)))

(declare-fun bs!37938 () Bool)

(assert (= bs!37938 d!143103))

(assert (=> bs!37938 m!1215715))

(declare-fun m!1215907 () Bool)

(assert (=> bs!37938 m!1215907))

(assert (=> b!1326972 d!143103))

(declare-fun d!143105 () Bool)

(declare-fun res!880707 () Bool)

(declare-fun e!756382 () Bool)

(assert (=> d!143105 (=> res!880707 e!756382)))

(assert (=> d!143105 (= res!880707 (= (select (arr!43248 _keys!1609) #b00000000000000000000000000000000) lt!590356))))

(assert (=> d!143105 (= (arrayContainsKey!0 _keys!1609 lt!590356 #b00000000000000000000000000000000) e!756382)))

(declare-fun b!1327080 () Bool)

(declare-fun e!756383 () Bool)

(assert (=> b!1327080 (= e!756382 e!756383)))

(declare-fun res!880708 () Bool)

(assert (=> b!1327080 (=> (not res!880708) (not e!756383))))

(assert (=> b!1327080 (= res!880708 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43800 _keys!1609)))))

(declare-fun b!1327081 () Bool)

(assert (=> b!1327081 (= e!756383 (arrayContainsKey!0 _keys!1609 lt!590356 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!143105 (not res!880707)) b!1327080))

(assert (= (and b!1327080 res!880708) b!1327081))

(assert (=> d!143105 m!1215705))

(declare-fun m!1215909 () Bool)

(assert (=> b!1327081 m!1215909))

(assert (=> b!1326972 d!143105))

(declare-fun b!1327094 () Bool)

(declare-fun e!756391 () SeekEntryResult!10041)

(declare-fun e!756392 () SeekEntryResult!10041)

(assert (=> b!1327094 (= e!756391 e!756392)))

(declare-fun lt!590450 () (_ BitVec 64))

(declare-fun lt!590449 () SeekEntryResult!10041)

(assert (=> b!1327094 (= lt!590450 (select (arr!43248 _keys!1609) (index!42537 lt!590449)))))

(declare-fun c!125857 () Bool)

(assert (=> b!1327094 (= c!125857 (= lt!590450 (select (arr!43248 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1327095 () Bool)

(assert (=> b!1327095 (= e!756391 Undefined!10041)))

(declare-fun d!143107 () Bool)

(declare-fun lt!590448 () SeekEntryResult!10041)

(assert (=> d!143107 (and (or ((_ is Undefined!10041) lt!590448) (not ((_ is Found!10041) lt!590448)) (and (bvsge (index!42536 lt!590448) #b00000000000000000000000000000000) (bvslt (index!42536 lt!590448) (size!43800 _keys!1609)))) (or ((_ is Undefined!10041) lt!590448) ((_ is Found!10041) lt!590448) (not ((_ is MissingZero!10041) lt!590448)) (and (bvsge (index!42535 lt!590448) #b00000000000000000000000000000000) (bvslt (index!42535 lt!590448) (size!43800 _keys!1609)))) (or ((_ is Undefined!10041) lt!590448) ((_ is Found!10041) lt!590448) ((_ is MissingZero!10041) lt!590448) (not ((_ is MissingVacant!10041) lt!590448)) (and (bvsge (index!42538 lt!590448) #b00000000000000000000000000000000) (bvslt (index!42538 lt!590448) (size!43800 _keys!1609)))) (or ((_ is Undefined!10041) lt!590448) (ite ((_ is Found!10041) lt!590448) (= (select (arr!43248 _keys!1609) (index!42536 lt!590448)) (select (arr!43248 _keys!1609) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10041) lt!590448) (= (select (arr!43248 _keys!1609) (index!42535 lt!590448)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10041) lt!590448) (= (select (arr!43248 _keys!1609) (index!42538 lt!590448)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143107 (= lt!590448 e!756391)))

(declare-fun c!125856 () Bool)

(assert (=> d!143107 (= c!125856 (and ((_ is Intermediate!10041) lt!590449) (undefined!10853 lt!590449)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!89551 (_ BitVec 32)) SeekEntryResult!10041)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!143107 (= lt!590449 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!43248 _keys!1609) #b00000000000000000000000000000000) mask!2019) (select (arr!43248 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019))))

(assert (=> d!143107 (validMask!0 mask!2019)))

(assert (=> d!143107 (= (seekEntryOrOpen!0 (select (arr!43248 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) lt!590448)))

(declare-fun b!1327096 () Bool)

(declare-fun e!756390 () SeekEntryResult!10041)

(assert (=> b!1327096 (= e!756390 (MissingZero!10041 (index!42537 lt!590449)))))

(declare-fun b!1327097 () Bool)

(assert (=> b!1327097 (= e!756392 (Found!10041 (index!42537 lt!590449)))))

(declare-fun b!1327098 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!89551 (_ BitVec 32)) SeekEntryResult!10041)

(assert (=> b!1327098 (= e!756390 (seekKeyOrZeroReturnVacant!0 (x!118307 lt!590449) (index!42537 lt!590449) (index!42537 lt!590449) (select (arr!43248 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019))))

(declare-fun b!1327099 () Bool)

(declare-fun c!125858 () Bool)

(assert (=> b!1327099 (= c!125858 (= lt!590450 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1327099 (= e!756392 e!756390)))

(assert (= (and d!143107 c!125856) b!1327095))

(assert (= (and d!143107 (not c!125856)) b!1327094))

(assert (= (and b!1327094 c!125857) b!1327097))

(assert (= (and b!1327094 (not c!125857)) b!1327099))

(assert (= (and b!1327099 c!125858) b!1327096))

(assert (= (and b!1327099 (not c!125858)) b!1327098))

(declare-fun m!1215911 () Bool)

(assert (=> b!1327094 m!1215911))

(declare-fun m!1215913 () Bool)

(assert (=> d!143107 m!1215913))

(assert (=> d!143107 m!1215705))

(declare-fun m!1215915 () Bool)

(assert (=> d!143107 m!1215915))

(assert (=> d!143107 m!1215525))

(declare-fun m!1215917 () Bool)

(assert (=> d!143107 m!1215917))

(assert (=> d!143107 m!1215705))

(assert (=> d!143107 m!1215913))

(declare-fun m!1215919 () Bool)

(assert (=> d!143107 m!1215919))

(declare-fun m!1215921 () Bool)

(assert (=> d!143107 m!1215921))

(assert (=> b!1327098 m!1215705))

(declare-fun m!1215923 () Bool)

(assert (=> b!1327098 m!1215923))

(assert (=> b!1326972 d!143107))

(declare-fun d!143109 () Bool)

(assert (=> d!143109 (= (validKeyInArray!0 (select (arr!43248 _keys!1609) #b00000000000000000000000000000000)) (and (not (= (select (arr!43248 _keys!1609) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43248 _keys!1609) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1326974 d!143109))

(assert (=> d!143041 d!143029))

(declare-fun call!64789 () Bool)

(declare-fun bm!64786 () Bool)

(declare-fun c!125859 () Bool)

(assert (=> bm!64786 (= call!64789 (arrayNoDuplicates!0 _keys!1609 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!125859 (Cons!30735 (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!125821 (Cons!30735 (select (arr!43248 _keys!1609) #b00000000000000000000000000000000) Nil!30736) Nil!30736)) (ite c!125821 (Cons!30735 (select (arr!43248 _keys!1609) #b00000000000000000000000000000000) Nil!30736) Nil!30736))))))

(declare-fun b!1327100 () Bool)

(declare-fun e!756396 () Bool)

(assert (=> b!1327100 (= e!756396 call!64789)))

(declare-fun d!143111 () Bool)

(declare-fun res!880711 () Bool)

(declare-fun e!756394 () Bool)

(assert (=> d!143111 (=> res!880711 e!756394)))

(assert (=> d!143111 (= res!880711 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43800 _keys!1609)))))

(assert (=> d!143111 (= (arrayNoDuplicates!0 _keys!1609 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125821 (Cons!30735 (select (arr!43248 _keys!1609) #b00000000000000000000000000000000) Nil!30736) Nil!30736)) e!756394)))

(declare-fun b!1327101 () Bool)

(declare-fun e!756395 () Bool)

(assert (=> b!1327101 (= e!756395 e!756396)))

(assert (=> b!1327101 (= c!125859 (validKeyInArray!0 (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1327102 () Bool)

(declare-fun e!756393 () Bool)

(assert (=> b!1327102 (= e!756393 (contains!8738 (ite c!125821 (Cons!30735 (select (arr!43248 _keys!1609) #b00000000000000000000000000000000) Nil!30736) Nil!30736) (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1327103 () Bool)

(assert (=> b!1327103 (= e!756396 call!64789)))

(declare-fun b!1327104 () Bool)

(assert (=> b!1327104 (= e!756394 e!756395)))

(declare-fun res!880710 () Bool)

(assert (=> b!1327104 (=> (not res!880710) (not e!756395))))

(assert (=> b!1327104 (= res!880710 (not e!756393))))

(declare-fun res!880709 () Bool)

(assert (=> b!1327104 (=> (not res!880709) (not e!756393))))

(assert (=> b!1327104 (= res!880709 (validKeyInArray!0 (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!143111 (not res!880711)) b!1327104))

(assert (= (and b!1327104 res!880709) b!1327102))

(assert (= (and b!1327104 res!880710) b!1327101))

(assert (= (and b!1327101 c!125859) b!1327103))

(assert (= (and b!1327101 (not c!125859)) b!1327100))

(assert (= (or b!1327103 b!1327100) bm!64786))

(declare-fun m!1215925 () Bool)

(assert (=> bm!64786 m!1215925))

(declare-fun m!1215927 () Bool)

(assert (=> bm!64786 m!1215927))

(assert (=> b!1327101 m!1215925))

(assert (=> b!1327101 m!1215925))

(declare-fun m!1215929 () Bool)

(assert (=> b!1327101 m!1215929))

(assert (=> b!1327102 m!1215925))

(assert (=> b!1327102 m!1215925))

(declare-fun m!1215931 () Bool)

(assert (=> b!1327102 m!1215931))

(assert (=> b!1327104 m!1215925))

(assert (=> b!1327104 m!1215925))

(assert (=> b!1327104 m!1215929))

(assert (=> bm!64779 d!143111))

(declare-fun b!1327105 () Bool)

(declare-fun e!756399 () Bool)

(declare-fun e!756397 () Bool)

(assert (=> b!1327105 (= e!756399 e!756397)))

(declare-fun lt!590451 () (_ BitVec 64))

(assert (=> b!1327105 (= lt!590451 (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!590453 () Unit!43512)

(assert (=> b!1327105 (= lt!590453 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!590451 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1327105 (arrayContainsKey!0 _keys!1609 lt!590451 #b00000000000000000000000000000000)))

(declare-fun lt!590452 () Unit!43512)

(assert (=> b!1327105 (= lt!590452 lt!590453)))

(declare-fun res!880713 () Bool)

(assert (=> b!1327105 (= res!880713 (= (seekEntryOrOpen!0 (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1609 mask!2019) (Found!10041 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1327105 (=> (not res!880713) (not e!756397))))

(declare-fun b!1327106 () Bool)

(declare-fun call!64790 () Bool)

(assert (=> b!1327106 (= e!756399 call!64790)))

(declare-fun b!1327107 () Bool)

(declare-fun e!756398 () Bool)

(assert (=> b!1327107 (= e!756398 e!756399)))

(declare-fun c!125860 () Bool)

(assert (=> b!1327107 (= c!125860 (validKeyInArray!0 (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!143113 () Bool)

(declare-fun res!880712 () Bool)

(assert (=> d!143113 (=> res!880712 e!756398)))

(assert (=> d!143113 (= res!880712 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43800 _keys!1609)))))

(assert (=> d!143113 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019) e!756398)))

(declare-fun bm!64787 () Bool)

(assert (=> bm!64787 (= call!64790 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun b!1327108 () Bool)

(assert (=> b!1327108 (= e!756397 call!64790)))

(assert (= (and d!143113 (not res!880712)) b!1327107))

(assert (= (and b!1327107 c!125860) b!1327105))

(assert (= (and b!1327107 (not c!125860)) b!1327106))

(assert (= (and b!1327105 res!880713) b!1327108))

(assert (= (or b!1327108 b!1327106) bm!64787))

(assert (=> b!1327105 m!1215925))

(declare-fun m!1215933 () Bool)

(assert (=> b!1327105 m!1215933))

(declare-fun m!1215935 () Bool)

(assert (=> b!1327105 m!1215935))

(assert (=> b!1327105 m!1215925))

(declare-fun m!1215937 () Bool)

(assert (=> b!1327105 m!1215937))

(assert (=> b!1327107 m!1215925))

(assert (=> b!1327107 m!1215925))

(assert (=> b!1327107 m!1215929))

(declare-fun m!1215939 () Bool)

(assert (=> bm!64787 m!1215939))

(assert (=> bm!64782 d!143113))

(declare-fun d!143115 () Bool)

(declare-fun res!880718 () Bool)

(declare-fun e!756404 () Bool)

(assert (=> d!143115 (=> res!880718 e!756404)))

(assert (=> d!143115 (= res!880718 (and ((_ is Cons!30734) (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) (= (_1!11817 (h!31943 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164)))))

(assert (=> d!143115 (= (containsKey!734 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164) e!756404)))

(declare-fun b!1327113 () Bool)

(declare-fun e!756405 () Bool)

(assert (=> b!1327113 (= e!756404 e!756405)))

(declare-fun res!880719 () Bool)

(assert (=> b!1327113 (=> (not res!880719) (not e!756405))))

(assert (=> b!1327113 (= res!880719 (and (or (not ((_ is Cons!30734) (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) (bvsle (_1!11817 (h!31943 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164)) ((_ is Cons!30734) (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) (bvslt (_1!11817 (h!31943 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164)))))

(declare-fun b!1327114 () Bool)

(assert (=> b!1327114 (= e!756405 (containsKey!734 (t!44734 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) k0!1164))))

(assert (= (and d!143115 (not res!880718)) b!1327113))

(assert (= (and b!1327113 res!880719) b!1327114))

(declare-fun m!1215941 () Bool)

(assert (=> b!1327114 m!1215941))

(assert (=> d!143035 d!143115))

(declare-fun d!143117 () Bool)

(declare-fun res!880720 () Bool)

(declare-fun e!756406 () Bool)

(assert (=> d!143117 (=> res!880720 e!756406)))

(assert (=> d!143117 (= res!880720 (and ((_ is Cons!30734) (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (= (_1!11817 (h!31943 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) k0!1164)))))

(assert (=> d!143117 (= (containsKey!734 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164) e!756406)))

(declare-fun b!1327115 () Bool)

(declare-fun e!756407 () Bool)

(assert (=> b!1327115 (= e!756406 e!756407)))

(declare-fun res!880721 () Bool)

(assert (=> b!1327115 (=> (not res!880721) (not e!756407))))

(assert (=> b!1327115 (= res!880721 (and (or (not ((_ is Cons!30734) (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) (bvsle (_1!11817 (h!31943 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) k0!1164)) ((_ is Cons!30734) (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (bvslt (_1!11817 (h!31943 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) k0!1164)))))

(declare-fun b!1327116 () Bool)

(assert (=> b!1327116 (= e!756407 (containsKey!734 (t!44734 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) k0!1164))))

(assert (= (and d!143117 (not res!880720)) b!1327115))

(assert (= (and b!1327115 res!880721) b!1327116))

(declare-fun m!1215943 () Bool)

(assert (=> b!1327116 m!1215943))

(assert (=> d!143039 d!143117))

(declare-fun d!143119 () Bool)

(assert (=> d!143119 (= (validKeyInArray!0 (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (and (not (= (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1326932 d!143119))

(assert (=> b!1326913 d!143027))

(declare-fun d!143121 () Bool)

(declare-fun e!756408 () Bool)

(assert (=> d!143121 e!756408))

(declare-fun res!880722 () Bool)

(assert (=> d!143121 (=> (not res!880722) (not e!756408))))

(declare-fun lt!590455 () ListLongMap!21269)

(assert (=> d!143121 (= res!880722 (contains!8736 lt!590455 (_1!11817 (ite (or c!125813 c!125816) (tuple2!23613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun lt!590454 () List!30738)

(assert (=> d!143121 (= lt!590455 (ListLongMap!21270 lt!590454))))

(declare-fun lt!590456 () Unit!43512)

(declare-fun lt!590457 () Unit!43512)

(assert (=> d!143121 (= lt!590456 lt!590457)))

(assert (=> d!143121 (= (getValueByKey!717 lt!590454 (_1!11817 (ite (or c!125813 c!125816) (tuple2!23613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (Some!767 (_2!11817 (ite (or c!125813 c!125816) (tuple2!23613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!143121 (= lt!590457 (lemmaContainsTupThenGetReturnValue!360 lt!590454 (_1!11817 (ite (or c!125813 c!125816) (tuple2!23613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (_2!11817 (ite (or c!125813 c!125816) (tuple2!23613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!143121 (= lt!590454 (insertStrictlySorted!489 (toList!10650 (ite c!125813 call!64779 (ite c!125816 call!64773 call!64774))) (_1!11817 (ite (or c!125813 c!125816) (tuple2!23613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (_2!11817 (ite (or c!125813 c!125816) (tuple2!23613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!143121 (= (+!4655 (ite c!125813 call!64779 (ite c!125816 call!64773 call!64774)) (ite (or c!125813 c!125816) (tuple2!23613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) lt!590455)))

(declare-fun b!1327117 () Bool)

(declare-fun res!880723 () Bool)

(assert (=> b!1327117 (=> (not res!880723) (not e!756408))))

(assert (=> b!1327117 (= res!880723 (= (getValueByKey!717 (toList!10650 lt!590455) (_1!11817 (ite (or c!125813 c!125816) (tuple2!23613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (Some!767 (_2!11817 (ite (or c!125813 c!125816) (tuple2!23613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))))

(declare-fun b!1327118 () Bool)

(assert (=> b!1327118 (= e!756408 (contains!8739 (toList!10650 lt!590455) (ite (or c!125813 c!125816) (tuple2!23613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (= (and d!143121 res!880722) b!1327117))

(assert (= (and b!1327117 res!880723) b!1327118))

(declare-fun m!1215945 () Bool)

(assert (=> d!143121 m!1215945))

(declare-fun m!1215947 () Bool)

(assert (=> d!143121 m!1215947))

(declare-fun m!1215949 () Bool)

(assert (=> d!143121 m!1215949))

(declare-fun m!1215951 () Bool)

(assert (=> d!143121 m!1215951))

(declare-fun m!1215953 () Bool)

(assert (=> b!1327117 m!1215953))

(declare-fun m!1215955 () Bool)

(assert (=> b!1327118 m!1215955))

(assert (=> bm!64773 d!143121))

(assert (=> b!1326960 d!143109))

(declare-fun b!1327119 () Bool)

(declare-fun e!756413 () Bool)

(declare-fun e!756412 () Bool)

(assert (=> b!1327119 (= e!756413 e!756412)))

(assert (=> b!1327119 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43800 _keys!1609)))))

(declare-fun res!880726 () Bool)

(declare-fun lt!590461 () ListLongMap!21269)

(assert (=> b!1327119 (= res!880726 (contains!8736 lt!590461 (select (arr!43248 _keys!1609) from!2000)))))

(assert (=> b!1327119 (=> (not res!880726) (not e!756412))))

(declare-fun d!143123 () Bool)

(declare-fun e!756410 () Bool)

(assert (=> d!143123 e!756410))

(declare-fun res!880724 () Bool)

(assert (=> d!143123 (=> (not res!880724) (not e!756410))))

(assert (=> d!143123 (= res!880724 (not (contains!8736 lt!590461 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!756409 () ListLongMap!21269)

(assert (=> d!143123 (= lt!590461 e!756409)))

(declare-fun c!125863 () Bool)

(assert (=> d!143123 (= c!125863 (bvsge from!2000 (size!43800 _keys!1609)))))

(assert (=> d!143123 (validMask!0 mask!2019)))

(assert (=> d!143123 (= (getCurrentListMapNoExtraKeys!6293 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) lt!590461)))

(declare-fun call!64791 () ListLongMap!21269)

(declare-fun bm!64788 () Bool)

(assert (=> bm!64788 (= call!64791 (getCurrentListMapNoExtraKeys!6293 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd from!2000 #b00000000000000000000000000000001) defaultEntry!1340))))

(declare-fun b!1327120 () Bool)

(assert (=> b!1327120 (= e!756409 (ListLongMap!21270 Nil!30735))))

(declare-fun b!1327121 () Bool)

(declare-fun e!756414 () ListLongMap!21269)

(assert (=> b!1327121 (= e!756414 call!64791)))

(declare-fun e!756411 () Bool)

(declare-fun b!1327122 () Bool)

(assert (=> b!1327122 (= e!756411 (= lt!590461 (getCurrentListMapNoExtraKeys!6293 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd from!2000 #b00000000000000000000000000000001) defaultEntry!1340)))))

(declare-fun b!1327123 () Bool)

(assert (=> b!1327123 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43800 _keys!1609)))))

(assert (=> b!1327123 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43801 _values!1337)))))

(assert (=> b!1327123 (= e!756412 (= (apply!1024 lt!590461 (select (arr!43248 _keys!1609) from!2000)) (get!21797 (select (arr!43249 _values!1337) from!2000) (dynLambda!3585 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1327124 () Bool)

(declare-fun res!880727 () Bool)

(assert (=> b!1327124 (=> (not res!880727) (not e!756410))))

(assert (=> b!1327124 (= res!880727 (not (contains!8736 lt!590461 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1327125 () Bool)

(declare-fun e!756415 () Bool)

(assert (=> b!1327125 (= e!756415 (validKeyInArray!0 (select (arr!43248 _keys!1609) from!2000)))))

(assert (=> b!1327125 (bvsge from!2000 #b00000000000000000000000000000000)))

(declare-fun b!1327126 () Bool)

(assert (=> b!1327126 (= e!756413 e!756411)))

(declare-fun c!125862 () Bool)

(assert (=> b!1327126 (= c!125862 (bvslt from!2000 (size!43800 _keys!1609)))))

(declare-fun b!1327127 () Bool)

(assert (=> b!1327127 (= e!756410 e!756413)))

(declare-fun c!125861 () Bool)

(assert (=> b!1327127 (= c!125861 e!756415)))

(declare-fun res!880725 () Bool)

(assert (=> b!1327127 (=> (not res!880725) (not e!756415))))

(assert (=> b!1327127 (= res!880725 (bvslt from!2000 (size!43800 _keys!1609)))))

(declare-fun b!1327128 () Bool)

(declare-fun lt!590463 () Unit!43512)

(declare-fun lt!590460 () Unit!43512)

(assert (=> b!1327128 (= lt!590463 lt!590460)))

(declare-fun lt!590458 () V!53577)

(declare-fun lt!590462 () (_ BitVec 64))

(declare-fun lt!590464 () ListLongMap!21269)

(declare-fun lt!590459 () (_ BitVec 64))

(assert (=> b!1327128 (not (contains!8736 (+!4655 lt!590464 (tuple2!23613 lt!590459 lt!590458)) lt!590462))))

(assert (=> b!1327128 (= lt!590460 (addStillNotContains!483 lt!590464 lt!590459 lt!590458 lt!590462))))

(assert (=> b!1327128 (= lt!590462 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1327128 (= lt!590458 (get!21797 (select (arr!43249 _values!1337) from!2000) (dynLambda!3585 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1327128 (= lt!590459 (select (arr!43248 _keys!1609) from!2000))))

(assert (=> b!1327128 (= lt!590464 call!64791)))

(assert (=> b!1327128 (= e!756414 (+!4655 call!64791 (tuple2!23613 (select (arr!43248 _keys!1609) from!2000) (get!21797 (select (arr!43249 _values!1337) from!2000) (dynLambda!3585 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1327129 () Bool)

(assert (=> b!1327129 (= e!756409 e!756414)))

(declare-fun c!125864 () Bool)

(assert (=> b!1327129 (= c!125864 (validKeyInArray!0 (select (arr!43248 _keys!1609) from!2000)))))

(declare-fun b!1327130 () Bool)

(assert (=> b!1327130 (= e!756411 (isEmpty!1085 lt!590461))))

(assert (= (and d!143123 c!125863) b!1327120))

(assert (= (and d!143123 (not c!125863)) b!1327129))

(assert (= (and b!1327129 c!125864) b!1327128))

(assert (= (and b!1327129 (not c!125864)) b!1327121))

(assert (= (or b!1327128 b!1327121) bm!64788))

(assert (= (and d!143123 res!880724) b!1327124))

(assert (= (and b!1327124 res!880727) b!1327127))

(assert (= (and b!1327127 res!880725) b!1327125))

(assert (= (and b!1327127 c!125861) b!1327119))

(assert (= (and b!1327127 (not c!125861)) b!1327126))

(assert (= (and b!1327119 res!880726) b!1327123))

(assert (= (and b!1327126 c!125862) b!1327122))

(assert (= (and b!1327126 (not c!125862)) b!1327130))

(declare-fun b_lambda!23833 () Bool)

(assert (=> (not b_lambda!23833) (not b!1327123)))

(assert (=> b!1327123 t!44739))

(declare-fun b_and!49169 () Bool)

(assert (= b_and!49167 (and (=> t!44739 result!24669) b_and!49169)))

(declare-fun b_lambda!23835 () Bool)

(assert (=> (not b_lambda!23835) (not b!1327128)))

(assert (=> b!1327128 t!44739))

(declare-fun b_and!49171 () Bool)

(assert (= b_and!49169 (and (=> t!44739 result!24669) b_and!49171)))

(declare-fun m!1215957 () Bool)

(assert (=> b!1327124 m!1215957))

(declare-fun m!1215959 () Bool)

(assert (=> b!1327128 m!1215959))

(declare-fun m!1215961 () Bool)

(assert (=> b!1327128 m!1215961))

(assert (=> b!1327128 m!1215635))

(assert (=> b!1327128 m!1215633))

(assert (=> b!1327128 m!1215637))

(assert (=> b!1327128 m!1215635))

(declare-fun m!1215963 () Bool)

(assert (=> b!1327128 m!1215963))

(assert (=> b!1327128 m!1215959))

(declare-fun m!1215965 () Bool)

(assert (=> b!1327128 m!1215965))

(assert (=> b!1327128 m!1215633))

(assert (=> b!1327128 m!1215515))

(declare-fun m!1215967 () Bool)

(assert (=> b!1327122 m!1215967))

(assert (=> b!1327119 m!1215515))

(assert (=> b!1327119 m!1215515))

(declare-fun m!1215969 () Bool)

(assert (=> b!1327119 m!1215969))

(assert (=> b!1327125 m!1215515))

(assert (=> b!1327125 m!1215515))

(assert (=> b!1327125 m!1215517))

(declare-fun m!1215971 () Bool)

(assert (=> b!1327130 m!1215971))

(assert (=> bm!64788 m!1215967))

(declare-fun m!1215973 () Bool)

(assert (=> d!143123 m!1215973))

(assert (=> d!143123 m!1215525))

(assert (=> b!1327123 m!1215635))

(assert (=> b!1327123 m!1215633))

(assert (=> b!1327123 m!1215637))

(assert (=> b!1327123 m!1215635))

(assert (=> b!1327123 m!1215515))

(declare-fun m!1215975 () Bool)

(assert (=> b!1327123 m!1215975))

(assert (=> b!1327123 m!1215633))

(assert (=> b!1327123 m!1215515))

(assert (=> b!1327129 m!1215515))

(assert (=> b!1327129 m!1215515))

(assert (=> b!1327129 m!1215517))

(assert (=> bm!64767 d!143123))

(declare-fun d!143125 () Bool)

(assert (=> d!143125 (= (apply!1024 lt!590336 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21798 (getValueByKey!717 (toList!10650 lt!590336) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37939 () Bool)

(assert (= bs!37939 d!143125))

(assert (=> bs!37939 m!1215863))

(assert (=> bs!37939 m!1215863))

(declare-fun m!1215977 () Bool)

(assert (=> bs!37939 m!1215977))

(assert (=> b!1326933 d!143125))

(declare-fun d!143127 () Bool)

(declare-fun lt!590467 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!653 (List!30739) (InoxSet (_ BitVec 64)))

(assert (=> d!143127 (= lt!590467 (select (content!653 Nil!30736) (select (arr!43248 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun e!756420 () Bool)

(assert (=> d!143127 (= lt!590467 e!756420)))

(declare-fun res!880732 () Bool)

(assert (=> d!143127 (=> (not res!880732) (not e!756420))))

(assert (=> d!143127 (= res!880732 ((_ is Cons!30735) Nil!30736))))

(assert (=> d!143127 (= (contains!8738 Nil!30736 (select (arr!43248 _keys!1609) #b00000000000000000000000000000000)) lt!590467)))

(declare-fun b!1327135 () Bool)

(declare-fun e!756421 () Bool)

(assert (=> b!1327135 (= e!756420 e!756421)))

(declare-fun res!880733 () Bool)

(assert (=> b!1327135 (=> res!880733 e!756421)))

(assert (=> b!1327135 (= res!880733 (= (h!31944 Nil!30736) (select (arr!43248 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1327136 () Bool)

(assert (=> b!1327136 (= e!756421 (contains!8738 (t!44735 Nil!30736) (select (arr!43248 _keys!1609) #b00000000000000000000000000000000)))))

(assert (= (and d!143127 res!880732) b!1327135))

(assert (= (and b!1327135 (not res!880733)) b!1327136))

(declare-fun m!1215979 () Bool)

(assert (=> d!143127 m!1215979))

(assert (=> d!143127 m!1215705))

(declare-fun m!1215981 () Bool)

(assert (=> d!143127 m!1215981))

(assert (=> b!1327136 m!1215705))

(declare-fun m!1215983 () Bool)

(assert (=> b!1327136 m!1215983))

(assert (=> b!1326961 d!143127))

(assert (=> d!143037 d!143029))

(declare-fun d!143129 () Bool)

(assert (=> d!143129 (= (apply!1024 lt!590322 lt!590313) (get!21798 (getValueByKey!717 (toList!10650 lt!590322) lt!590313)))))

(declare-fun bs!37940 () Bool)

(assert (= bs!37940 d!143129))

(declare-fun m!1215985 () Bool)

(assert (=> bs!37940 m!1215985))

(assert (=> bs!37940 m!1215985))

(declare-fun m!1215987 () Bool)

(assert (=> bs!37940 m!1215987))

(assert (=> b!1326915 d!143129))

(declare-fun d!143131 () Bool)

(assert (=> d!143131 (= (apply!1024 (+!4655 lt!590302 (tuple2!23613 lt!590318 minValue!1279)) lt!590312) (apply!1024 lt!590302 lt!590312))))

(declare-fun lt!590468 () Unit!43512)

(assert (=> d!143131 (= lt!590468 (choose!1962 lt!590302 lt!590318 minValue!1279 lt!590312))))

(declare-fun e!756422 () Bool)

(assert (=> d!143131 e!756422))

(declare-fun res!880734 () Bool)

(assert (=> d!143131 (=> (not res!880734) (not e!756422))))

(assert (=> d!143131 (= res!880734 (contains!8736 lt!590302 lt!590312))))

(assert (=> d!143131 (= (addApplyDifferent!562 lt!590302 lt!590318 minValue!1279 lt!590312) lt!590468)))

(declare-fun b!1327137 () Bool)

(assert (=> b!1327137 (= e!756422 (not (= lt!590312 lt!590318)))))

(assert (= (and d!143131 res!880734) b!1327137))

(assert (=> d!143131 m!1215611))

(assert (=> d!143131 m!1215613))

(declare-fun m!1215989 () Bool)

(assert (=> d!143131 m!1215989))

(declare-fun m!1215991 () Bool)

(assert (=> d!143131 m!1215991))

(assert (=> d!143131 m!1215593))

(assert (=> d!143131 m!1215611))

(assert (=> b!1326915 d!143131))

(assert (=> b!1326915 d!143123))

(declare-fun d!143133 () Bool)

(assert (=> d!143133 (= (apply!1024 (+!4655 lt!590320 (tuple2!23613 lt!590303 minValue!1279)) lt!590311) (apply!1024 lt!590320 lt!590311))))

(declare-fun lt!590469 () Unit!43512)

(assert (=> d!143133 (= lt!590469 (choose!1962 lt!590320 lt!590303 minValue!1279 lt!590311))))

(declare-fun e!756423 () Bool)

(assert (=> d!143133 e!756423))

(declare-fun res!880735 () Bool)

(assert (=> d!143133 (=> (not res!880735) (not e!756423))))

(assert (=> d!143133 (= res!880735 (contains!8736 lt!590320 lt!590311))))

(assert (=> d!143133 (= (addApplyDifferent!562 lt!590320 lt!590303 minValue!1279 lt!590311) lt!590469)))

(declare-fun b!1327138 () Bool)

(assert (=> b!1327138 (= e!756423 (not (= lt!590311 lt!590303)))))

(assert (= (and d!143133 res!880735) b!1327138))

(assert (=> d!143133 m!1215615))

(assert (=> d!143133 m!1215617))

(declare-fun m!1215993 () Bool)

(assert (=> d!143133 m!1215993))

(declare-fun m!1215995 () Bool)

(assert (=> d!143133 m!1215995))

(assert (=> d!143133 m!1215609))

(assert (=> d!143133 m!1215615))

(assert (=> b!1326915 d!143133))

(declare-fun d!143135 () Bool)

(assert (=> d!143135 (= (apply!1024 (+!4655 lt!590322 (tuple2!23613 lt!590306 zeroValue!1279)) lt!590313) (get!21798 (getValueByKey!717 (toList!10650 (+!4655 lt!590322 (tuple2!23613 lt!590306 zeroValue!1279))) lt!590313)))))

(declare-fun bs!37941 () Bool)

(assert (= bs!37941 d!143135))

(declare-fun m!1215997 () Bool)

(assert (=> bs!37941 m!1215997))

(assert (=> bs!37941 m!1215997))

(declare-fun m!1215999 () Bool)

(assert (=> bs!37941 m!1215999))

(assert (=> b!1326915 d!143135))

(declare-fun d!143137 () Bool)

(declare-fun e!756424 () Bool)

(assert (=> d!143137 e!756424))

(declare-fun res!880736 () Bool)

(assert (=> d!143137 (=> (not res!880736) (not e!756424))))

(declare-fun lt!590471 () ListLongMap!21269)

(assert (=> d!143137 (= res!880736 (contains!8736 lt!590471 (_1!11817 (tuple2!23613 lt!590318 minValue!1279))))))

(declare-fun lt!590470 () List!30738)

(assert (=> d!143137 (= lt!590471 (ListLongMap!21270 lt!590470))))

(declare-fun lt!590472 () Unit!43512)

(declare-fun lt!590473 () Unit!43512)

(assert (=> d!143137 (= lt!590472 lt!590473)))

(assert (=> d!143137 (= (getValueByKey!717 lt!590470 (_1!11817 (tuple2!23613 lt!590318 minValue!1279))) (Some!767 (_2!11817 (tuple2!23613 lt!590318 minValue!1279))))))

(assert (=> d!143137 (= lt!590473 (lemmaContainsTupThenGetReturnValue!360 lt!590470 (_1!11817 (tuple2!23613 lt!590318 minValue!1279)) (_2!11817 (tuple2!23613 lt!590318 minValue!1279))))))

(assert (=> d!143137 (= lt!590470 (insertStrictlySorted!489 (toList!10650 lt!590302) (_1!11817 (tuple2!23613 lt!590318 minValue!1279)) (_2!11817 (tuple2!23613 lt!590318 minValue!1279))))))

(assert (=> d!143137 (= (+!4655 lt!590302 (tuple2!23613 lt!590318 minValue!1279)) lt!590471)))

(declare-fun b!1327139 () Bool)

(declare-fun res!880737 () Bool)

(assert (=> b!1327139 (=> (not res!880737) (not e!756424))))

(assert (=> b!1327139 (= res!880737 (= (getValueByKey!717 (toList!10650 lt!590471) (_1!11817 (tuple2!23613 lt!590318 minValue!1279))) (Some!767 (_2!11817 (tuple2!23613 lt!590318 minValue!1279)))))))

(declare-fun b!1327140 () Bool)

(assert (=> b!1327140 (= e!756424 (contains!8739 (toList!10650 lt!590471) (tuple2!23613 lt!590318 minValue!1279)))))

(assert (= (and d!143137 res!880736) b!1327139))

(assert (= (and b!1327139 res!880737) b!1327140))

(declare-fun m!1216001 () Bool)

(assert (=> d!143137 m!1216001))

(declare-fun m!1216003 () Bool)

(assert (=> d!143137 m!1216003))

(declare-fun m!1216005 () Bool)

(assert (=> d!143137 m!1216005))

(declare-fun m!1216007 () Bool)

(assert (=> d!143137 m!1216007))

(declare-fun m!1216009 () Bool)

(assert (=> b!1327139 m!1216009))

(declare-fun m!1216011 () Bool)

(assert (=> b!1327140 m!1216011))

(assert (=> b!1326915 d!143137))

(declare-fun d!143139 () Bool)

(assert (=> d!143139 (= (apply!1024 lt!590320 lt!590311) (get!21798 (getValueByKey!717 (toList!10650 lt!590320) lt!590311)))))

(declare-fun bs!37942 () Bool)

(assert (= bs!37942 d!143139))

(declare-fun m!1216013 () Bool)

(assert (=> bs!37942 m!1216013))

(assert (=> bs!37942 m!1216013))

(declare-fun m!1216015 () Bool)

(assert (=> bs!37942 m!1216015))

(assert (=> b!1326915 d!143139))

(declare-fun d!143141 () Bool)

(assert (=> d!143141 (= (apply!1024 lt!590302 lt!590312) (get!21798 (getValueByKey!717 (toList!10650 lt!590302) lt!590312)))))

(declare-fun bs!37943 () Bool)

(assert (= bs!37943 d!143141))

(declare-fun m!1216017 () Bool)

(assert (=> bs!37943 m!1216017))

(assert (=> bs!37943 m!1216017))

(declare-fun m!1216019 () Bool)

(assert (=> bs!37943 m!1216019))

(assert (=> b!1326915 d!143141))

(declare-fun d!143143 () Bool)

(assert (=> d!143143 (= (apply!1024 (+!4655 lt!590322 (tuple2!23613 lt!590306 zeroValue!1279)) lt!590313) (apply!1024 lt!590322 lt!590313))))

(declare-fun lt!590474 () Unit!43512)

(assert (=> d!143143 (= lt!590474 (choose!1962 lt!590322 lt!590306 zeroValue!1279 lt!590313))))

(declare-fun e!756425 () Bool)

(assert (=> d!143143 e!756425))

(declare-fun res!880738 () Bool)

(assert (=> d!143143 (=> (not res!880738) (not e!756425))))

(assert (=> d!143143 (= res!880738 (contains!8736 lt!590322 lt!590313))))

(assert (=> d!143143 (= (addApplyDifferent!562 lt!590322 lt!590306 zeroValue!1279 lt!590313) lt!590474)))

(declare-fun b!1327141 () Bool)

(assert (=> b!1327141 (= e!756425 (not (= lt!590313 lt!590306)))))

(assert (= (and d!143143 res!880738) b!1327141))

(assert (=> d!143143 m!1215595))

(assert (=> d!143143 m!1215603))

(declare-fun m!1216021 () Bool)

(assert (=> d!143143 m!1216021))

(declare-fun m!1216023 () Bool)

(assert (=> d!143143 m!1216023))

(assert (=> d!143143 m!1215589))

(assert (=> d!143143 m!1215595))

(assert (=> b!1326915 d!143143))

(declare-fun d!143145 () Bool)

(declare-fun e!756426 () Bool)

(assert (=> d!143145 e!756426))

(declare-fun res!880739 () Bool)

(assert (=> d!143145 (=> res!880739 e!756426)))

(declare-fun lt!590478 () Bool)

(assert (=> d!143145 (= res!880739 (not lt!590478))))

(declare-fun lt!590477 () Bool)

(assert (=> d!143145 (= lt!590478 lt!590477)))

(declare-fun lt!590476 () Unit!43512)

(declare-fun e!756427 () Unit!43512)

(assert (=> d!143145 (= lt!590476 e!756427)))

(declare-fun c!125865 () Bool)

(assert (=> d!143145 (= c!125865 lt!590477)))

(assert (=> d!143145 (= lt!590477 (containsKey!734 (toList!10650 (+!4655 lt!590315 (tuple2!23613 lt!590317 zeroValue!1279))) lt!590316))))

(assert (=> d!143145 (= (contains!8736 (+!4655 lt!590315 (tuple2!23613 lt!590317 zeroValue!1279)) lt!590316) lt!590478)))

(declare-fun b!1327142 () Bool)

(declare-fun lt!590475 () Unit!43512)

(assert (=> b!1327142 (= e!756427 lt!590475)))

(assert (=> b!1327142 (= lt!590475 (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10650 (+!4655 lt!590315 (tuple2!23613 lt!590317 zeroValue!1279))) lt!590316))))

(assert (=> b!1327142 (isDefined!524 (getValueByKey!717 (toList!10650 (+!4655 lt!590315 (tuple2!23613 lt!590317 zeroValue!1279))) lt!590316))))

(declare-fun b!1327143 () Bool)

(declare-fun Unit!43522 () Unit!43512)

(assert (=> b!1327143 (= e!756427 Unit!43522)))

(declare-fun b!1327144 () Bool)

(assert (=> b!1327144 (= e!756426 (isDefined!524 (getValueByKey!717 (toList!10650 (+!4655 lt!590315 (tuple2!23613 lt!590317 zeroValue!1279))) lt!590316)))))

(assert (= (and d!143145 c!125865) b!1327142))

(assert (= (and d!143145 (not c!125865)) b!1327143))

(assert (= (and d!143145 (not res!880739)) b!1327144))

(declare-fun m!1216025 () Bool)

(assert (=> d!143145 m!1216025))

(declare-fun m!1216027 () Bool)

(assert (=> b!1327142 m!1216027))

(declare-fun m!1216029 () Bool)

(assert (=> b!1327142 m!1216029))

(assert (=> b!1327142 m!1216029))

(declare-fun m!1216031 () Bool)

(assert (=> b!1327142 m!1216031))

(assert (=> b!1327144 m!1216029))

(assert (=> b!1327144 m!1216029))

(assert (=> b!1327144 m!1216031))

(assert (=> b!1326915 d!143145))

(declare-fun d!143147 () Bool)

(declare-fun e!756428 () Bool)

(assert (=> d!143147 e!756428))

(declare-fun res!880740 () Bool)

(assert (=> d!143147 (=> (not res!880740) (not e!756428))))

(declare-fun lt!590480 () ListLongMap!21269)

(assert (=> d!143147 (= res!880740 (contains!8736 lt!590480 (_1!11817 (tuple2!23613 lt!590303 minValue!1279))))))

(declare-fun lt!590479 () List!30738)

(assert (=> d!143147 (= lt!590480 (ListLongMap!21270 lt!590479))))

(declare-fun lt!590481 () Unit!43512)

(declare-fun lt!590482 () Unit!43512)

(assert (=> d!143147 (= lt!590481 lt!590482)))

(assert (=> d!143147 (= (getValueByKey!717 lt!590479 (_1!11817 (tuple2!23613 lt!590303 minValue!1279))) (Some!767 (_2!11817 (tuple2!23613 lt!590303 minValue!1279))))))

(assert (=> d!143147 (= lt!590482 (lemmaContainsTupThenGetReturnValue!360 lt!590479 (_1!11817 (tuple2!23613 lt!590303 minValue!1279)) (_2!11817 (tuple2!23613 lt!590303 minValue!1279))))))

(assert (=> d!143147 (= lt!590479 (insertStrictlySorted!489 (toList!10650 lt!590320) (_1!11817 (tuple2!23613 lt!590303 minValue!1279)) (_2!11817 (tuple2!23613 lt!590303 minValue!1279))))))

(assert (=> d!143147 (= (+!4655 lt!590320 (tuple2!23613 lt!590303 minValue!1279)) lt!590480)))

(declare-fun b!1327145 () Bool)

(declare-fun res!880741 () Bool)

(assert (=> b!1327145 (=> (not res!880741) (not e!756428))))

(assert (=> b!1327145 (= res!880741 (= (getValueByKey!717 (toList!10650 lt!590480) (_1!11817 (tuple2!23613 lt!590303 minValue!1279))) (Some!767 (_2!11817 (tuple2!23613 lt!590303 minValue!1279)))))))

(declare-fun b!1327146 () Bool)

(assert (=> b!1327146 (= e!756428 (contains!8739 (toList!10650 lt!590480) (tuple2!23613 lt!590303 minValue!1279)))))

(assert (= (and d!143147 res!880740) b!1327145))

(assert (= (and b!1327145 res!880741) b!1327146))

(declare-fun m!1216033 () Bool)

(assert (=> d!143147 m!1216033))

(declare-fun m!1216035 () Bool)

(assert (=> d!143147 m!1216035))

(declare-fun m!1216037 () Bool)

(assert (=> d!143147 m!1216037))

(declare-fun m!1216039 () Bool)

(assert (=> d!143147 m!1216039))

(declare-fun m!1216041 () Bool)

(assert (=> b!1327145 m!1216041))

(declare-fun m!1216043 () Bool)

(assert (=> b!1327146 m!1216043))

(assert (=> b!1326915 d!143147))

(declare-fun d!143149 () Bool)

(assert (=> d!143149 (contains!8736 (+!4655 lt!590315 (tuple2!23613 lt!590317 zeroValue!1279)) lt!590316)))

(declare-fun lt!590483 () Unit!43512)

(assert (=> d!143149 (= lt!590483 (choose!1961 lt!590315 lt!590317 zeroValue!1279 lt!590316))))

(assert (=> d!143149 (contains!8736 lt!590315 lt!590316)))

(assert (=> d!143149 (= (addStillContains!1159 lt!590315 lt!590317 zeroValue!1279 lt!590316) lt!590483)))

(declare-fun bs!37944 () Bool)

(assert (= bs!37944 d!143149))

(assert (=> bs!37944 m!1215599))

(assert (=> bs!37944 m!1215599))

(assert (=> bs!37944 m!1215601))

(declare-fun m!1216045 () Bool)

(assert (=> bs!37944 m!1216045))

(declare-fun m!1216047 () Bool)

(assert (=> bs!37944 m!1216047))

(assert (=> b!1326915 d!143149))

(declare-fun d!143151 () Bool)

(assert (=> d!143151 (= (apply!1024 (+!4655 lt!590320 (tuple2!23613 lt!590303 minValue!1279)) lt!590311) (get!21798 (getValueByKey!717 (toList!10650 (+!4655 lt!590320 (tuple2!23613 lt!590303 minValue!1279))) lt!590311)))))

(declare-fun bs!37945 () Bool)

(assert (= bs!37945 d!143151))

(declare-fun m!1216049 () Bool)

(assert (=> bs!37945 m!1216049))

(assert (=> bs!37945 m!1216049))

(declare-fun m!1216051 () Bool)

(assert (=> bs!37945 m!1216051))

(assert (=> b!1326915 d!143151))

(declare-fun d!143153 () Bool)

(declare-fun e!756429 () Bool)

(assert (=> d!143153 e!756429))

(declare-fun res!880742 () Bool)

(assert (=> d!143153 (=> (not res!880742) (not e!756429))))

(declare-fun lt!590485 () ListLongMap!21269)

(assert (=> d!143153 (= res!880742 (contains!8736 lt!590485 (_1!11817 (tuple2!23613 lt!590317 zeroValue!1279))))))

(declare-fun lt!590484 () List!30738)

(assert (=> d!143153 (= lt!590485 (ListLongMap!21270 lt!590484))))

(declare-fun lt!590486 () Unit!43512)

(declare-fun lt!590487 () Unit!43512)

(assert (=> d!143153 (= lt!590486 lt!590487)))

(assert (=> d!143153 (= (getValueByKey!717 lt!590484 (_1!11817 (tuple2!23613 lt!590317 zeroValue!1279))) (Some!767 (_2!11817 (tuple2!23613 lt!590317 zeroValue!1279))))))

(assert (=> d!143153 (= lt!590487 (lemmaContainsTupThenGetReturnValue!360 lt!590484 (_1!11817 (tuple2!23613 lt!590317 zeroValue!1279)) (_2!11817 (tuple2!23613 lt!590317 zeroValue!1279))))))

(assert (=> d!143153 (= lt!590484 (insertStrictlySorted!489 (toList!10650 lt!590315) (_1!11817 (tuple2!23613 lt!590317 zeroValue!1279)) (_2!11817 (tuple2!23613 lt!590317 zeroValue!1279))))))

(assert (=> d!143153 (= (+!4655 lt!590315 (tuple2!23613 lt!590317 zeroValue!1279)) lt!590485)))

(declare-fun b!1327147 () Bool)

(declare-fun res!880743 () Bool)

(assert (=> b!1327147 (=> (not res!880743) (not e!756429))))

(assert (=> b!1327147 (= res!880743 (= (getValueByKey!717 (toList!10650 lt!590485) (_1!11817 (tuple2!23613 lt!590317 zeroValue!1279))) (Some!767 (_2!11817 (tuple2!23613 lt!590317 zeroValue!1279)))))))

(declare-fun b!1327148 () Bool)

(assert (=> b!1327148 (= e!756429 (contains!8739 (toList!10650 lt!590485) (tuple2!23613 lt!590317 zeroValue!1279)))))

(assert (= (and d!143153 res!880742) b!1327147))

(assert (= (and b!1327147 res!880743) b!1327148))

(declare-fun m!1216053 () Bool)

(assert (=> d!143153 m!1216053))

(declare-fun m!1216055 () Bool)

(assert (=> d!143153 m!1216055))

(declare-fun m!1216057 () Bool)

(assert (=> d!143153 m!1216057))

(declare-fun m!1216059 () Bool)

(assert (=> d!143153 m!1216059))

(declare-fun m!1216061 () Bool)

(assert (=> b!1327147 m!1216061))

(declare-fun m!1216063 () Bool)

(assert (=> b!1327148 m!1216063))

(assert (=> b!1326915 d!143153))

(declare-fun d!143155 () Bool)

(declare-fun e!756430 () Bool)

(assert (=> d!143155 e!756430))

(declare-fun res!880744 () Bool)

(assert (=> d!143155 (=> (not res!880744) (not e!756430))))

(declare-fun lt!590489 () ListLongMap!21269)

(assert (=> d!143155 (= res!880744 (contains!8736 lt!590489 (_1!11817 (tuple2!23613 lt!590306 zeroValue!1279))))))

(declare-fun lt!590488 () List!30738)

(assert (=> d!143155 (= lt!590489 (ListLongMap!21270 lt!590488))))

(declare-fun lt!590490 () Unit!43512)

(declare-fun lt!590491 () Unit!43512)

(assert (=> d!143155 (= lt!590490 lt!590491)))

(assert (=> d!143155 (= (getValueByKey!717 lt!590488 (_1!11817 (tuple2!23613 lt!590306 zeroValue!1279))) (Some!767 (_2!11817 (tuple2!23613 lt!590306 zeroValue!1279))))))

(assert (=> d!143155 (= lt!590491 (lemmaContainsTupThenGetReturnValue!360 lt!590488 (_1!11817 (tuple2!23613 lt!590306 zeroValue!1279)) (_2!11817 (tuple2!23613 lt!590306 zeroValue!1279))))))

(assert (=> d!143155 (= lt!590488 (insertStrictlySorted!489 (toList!10650 lt!590322) (_1!11817 (tuple2!23613 lt!590306 zeroValue!1279)) (_2!11817 (tuple2!23613 lt!590306 zeroValue!1279))))))

(assert (=> d!143155 (= (+!4655 lt!590322 (tuple2!23613 lt!590306 zeroValue!1279)) lt!590489)))

(declare-fun b!1327149 () Bool)

(declare-fun res!880745 () Bool)

(assert (=> b!1327149 (=> (not res!880745) (not e!756430))))

(assert (=> b!1327149 (= res!880745 (= (getValueByKey!717 (toList!10650 lt!590489) (_1!11817 (tuple2!23613 lt!590306 zeroValue!1279))) (Some!767 (_2!11817 (tuple2!23613 lt!590306 zeroValue!1279)))))))

(declare-fun b!1327150 () Bool)

(assert (=> b!1327150 (= e!756430 (contains!8739 (toList!10650 lt!590489) (tuple2!23613 lt!590306 zeroValue!1279)))))

(assert (= (and d!143155 res!880744) b!1327149))

(assert (= (and b!1327149 res!880745) b!1327150))

(declare-fun m!1216065 () Bool)

(assert (=> d!143155 m!1216065))

(declare-fun m!1216067 () Bool)

(assert (=> d!143155 m!1216067))

(declare-fun m!1216069 () Bool)

(assert (=> d!143155 m!1216069))

(declare-fun m!1216071 () Bool)

(assert (=> d!143155 m!1216071))

(declare-fun m!1216073 () Bool)

(assert (=> b!1327149 m!1216073))

(declare-fun m!1216075 () Bool)

(assert (=> b!1327150 m!1216075))

(assert (=> b!1326915 d!143155))

(declare-fun d!143157 () Bool)

(assert (=> d!143157 (= (apply!1024 (+!4655 lt!590302 (tuple2!23613 lt!590318 minValue!1279)) lt!590312) (get!21798 (getValueByKey!717 (toList!10650 (+!4655 lt!590302 (tuple2!23613 lt!590318 minValue!1279))) lt!590312)))))

(declare-fun bs!37946 () Bool)

(assert (= bs!37946 d!143157))

(declare-fun m!1216077 () Bool)

(assert (=> bs!37946 m!1216077))

(assert (=> bs!37946 m!1216077))

(declare-fun m!1216079 () Bool)

(assert (=> bs!37946 m!1216079))

(assert (=> b!1326915 d!143157))

(assert (=> b!1326963 d!143109))

(declare-fun d!143159 () Bool)

(declare-fun e!756431 () Bool)

(assert (=> d!143159 e!756431))

(declare-fun res!880746 () Bool)

(assert (=> d!143159 (=> (not res!880746) (not e!756431))))

(declare-fun lt!590493 () ListLongMap!21269)

(assert (=> d!143159 (= res!880746 (contains!8736 lt!590493 (_1!11817 (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun lt!590492 () List!30738)

(assert (=> d!143159 (= lt!590493 (ListLongMap!21270 lt!590492))))

(declare-fun lt!590494 () Unit!43512)

(declare-fun lt!590495 () Unit!43512)

(assert (=> d!143159 (= lt!590494 lt!590495)))

(assert (=> d!143159 (= (getValueByKey!717 lt!590492 (_1!11817 (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!767 (_2!11817 (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143159 (= lt!590495 (lemmaContainsTupThenGetReturnValue!360 lt!590492 (_1!11817 (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11817 (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143159 (= lt!590492 (insertStrictlySorted!489 (toList!10650 call!64768) (_1!11817 (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11817 (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143159 (= (+!4655 call!64768 (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) lt!590493)))

(declare-fun b!1327151 () Bool)

(declare-fun res!880747 () Bool)

(assert (=> b!1327151 (=> (not res!880747) (not e!756431))))

(assert (=> b!1327151 (= res!880747 (= (getValueByKey!717 (toList!10650 lt!590493) (_1!11817 (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!767 (_2!11817 (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun b!1327152 () Bool)

(assert (=> b!1327152 (= e!756431 (contains!8739 (toList!10650 lt!590493) (tuple2!23613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(assert (= (and d!143159 res!880746) b!1327151))

(assert (= (and b!1327151 res!880747) b!1327152))

(declare-fun m!1216081 () Bool)

(assert (=> d!143159 m!1216081))

(declare-fun m!1216083 () Bool)

(assert (=> d!143159 m!1216083))

(declare-fun m!1216085 () Bool)

(assert (=> d!143159 m!1216085))

(declare-fun m!1216087 () Bool)

(assert (=> d!143159 m!1216087))

(declare-fun m!1216089 () Bool)

(assert (=> b!1327151 m!1216089))

(declare-fun m!1216091 () Bool)

(assert (=> b!1327152 m!1216091))

(assert (=> b!1326916 d!143159))

(declare-fun d!143161 () Bool)

(declare-fun e!756432 () Bool)

(assert (=> d!143161 e!756432))

(declare-fun res!880748 () Bool)

(assert (=> d!143161 (=> res!880748 e!756432)))

(declare-fun lt!590499 () Bool)

(assert (=> d!143161 (= res!880748 (not lt!590499))))

(declare-fun lt!590498 () Bool)

(assert (=> d!143161 (= lt!590499 lt!590498)))

(declare-fun lt!590497 () Unit!43512)

(declare-fun e!756433 () Unit!43512)

(assert (=> d!143161 (= lt!590497 e!756433)))

(declare-fun c!125866 () Bool)

(assert (=> d!143161 (= c!125866 lt!590498)))

(assert (=> d!143161 (= lt!590498 (containsKey!734 (toList!10650 lt!590310) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143161 (= (contains!8736 lt!590310 #b0000000000000000000000000000000000000000000000000000000000000000) lt!590499)))

(declare-fun b!1327153 () Bool)

(declare-fun lt!590496 () Unit!43512)

(assert (=> b!1327153 (= e!756433 lt!590496)))

(assert (=> b!1327153 (= lt!590496 (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10650 lt!590310) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1327153 (isDefined!524 (getValueByKey!717 (toList!10650 lt!590310) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1327154 () Bool)

(declare-fun Unit!43523 () Unit!43512)

(assert (=> b!1327154 (= e!756433 Unit!43523)))

(declare-fun b!1327155 () Bool)

(assert (=> b!1327155 (= e!756432 (isDefined!524 (getValueByKey!717 (toList!10650 lt!590310) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143161 c!125866) b!1327153))

(assert (= (and d!143161 (not c!125866)) b!1327154))

(assert (= (and d!143161 (not res!880748)) b!1327155))

(declare-fun m!1216093 () Bool)

(assert (=> d!143161 m!1216093))

(declare-fun m!1216095 () Bool)

(assert (=> b!1327153 m!1216095))

(assert (=> b!1327153 m!1215891))

(assert (=> b!1327153 m!1215891))

(declare-fun m!1216097 () Bool)

(assert (=> b!1327153 m!1216097))

(assert (=> b!1327155 m!1215891))

(assert (=> b!1327155 m!1215891))

(assert (=> b!1327155 m!1216097))

(assert (=> bm!64768 d!143161))

(declare-fun d!143163 () Bool)

(assert (=> d!143163 (= (apply!1024 lt!590310 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21798 (getValueByKey!717 (toList!10650 lt!590310) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37947 () Bool)

(assert (= bs!37947 d!143163))

(declare-fun m!1216099 () Bool)

(assert (=> bs!37947 m!1216099))

(assert (=> bs!37947 m!1216099))

(declare-fun m!1216101 () Bool)

(assert (=> bs!37947 m!1216101))

(assert (=> b!1326918 d!143163))

(declare-fun d!143165 () Bool)

(assert (=> d!143165 (= (apply!1024 lt!590310 (select (arr!43248 _keys!1609) from!2000)) (get!21798 (getValueByKey!717 (toList!10650 lt!590310) (select (arr!43248 _keys!1609) from!2000))))))

(declare-fun bs!37948 () Bool)

(assert (= bs!37948 d!143165))

(assert (=> bs!37948 m!1215515))

(declare-fun m!1216103 () Bool)

(assert (=> bs!37948 m!1216103))

(assert (=> bs!37948 m!1216103))

(declare-fun m!1216105 () Bool)

(assert (=> bs!37948 m!1216105))

(assert (=> b!1326902 d!143165))

(declare-fun d!143167 () Bool)

(declare-fun c!125867 () Bool)

(assert (=> d!143167 (= c!125867 ((_ is ValueCellFull!17279) (select (arr!43249 _values!1337) from!2000)))))

(declare-fun e!756434 () V!53577)

(assert (=> d!143167 (= (get!21797 (select (arr!43249 _values!1337) from!2000) (dynLambda!3585 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)) e!756434)))

(declare-fun b!1327156 () Bool)

(assert (=> b!1327156 (= e!756434 (get!21799 (select (arr!43249 _values!1337) from!2000) (dynLambda!3585 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1327157 () Bool)

(assert (=> b!1327157 (= e!756434 (get!21800 (select (arr!43249 _values!1337) from!2000) (dynLambda!3585 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143167 c!125867) b!1327156))

(assert (= (and d!143167 (not c!125867)) b!1327157))

(assert (=> b!1327156 m!1215635))

(assert (=> b!1327156 m!1215633))

(declare-fun m!1216107 () Bool)

(assert (=> b!1327156 m!1216107))

(assert (=> b!1327157 m!1215635))

(assert (=> b!1327157 m!1215633))

(declare-fun m!1216109 () Bool)

(assert (=> b!1327157 m!1216109))

(assert (=> b!1326902 d!143167))

(assert (=> b!1326939 d!143119))

(declare-fun d!143169 () Bool)

(assert (=> d!143169 (isDefined!524 (getValueByKey!717 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(declare-fun lt!590500 () Unit!43512)

(assert (=> d!143169 (= lt!590500 (choose!1963 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(declare-fun e!756435 () Bool)

(assert (=> d!143169 e!756435))

(declare-fun res!880749 () Bool)

(assert (=> d!143169 (=> (not res!880749) (not e!756435))))

(assert (=> d!143169 (= res!880749 (isStrictlySorted!874 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))))

(assert (=> d!143169 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164) lt!590500)))

(declare-fun b!1327158 () Bool)

(assert (=> b!1327158 (= e!756435 (containsKey!734 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(assert (= (and d!143169 res!880749) b!1327158))

(assert (=> d!143169 m!1215645))

(assert (=> d!143169 m!1215645))

(assert (=> d!143169 m!1215647))

(declare-fun m!1216111 () Bool)

(assert (=> d!143169 m!1216111))

(declare-fun m!1216113 () Bool)

(assert (=> d!143169 m!1216113))

(assert (=> b!1327158 m!1215641))

(assert (=> b!1326925 d!143169))

(declare-fun d!143171 () Bool)

(assert (=> d!143171 (= (isDefined!524 (getValueByKey!717 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164)) (not (isEmpty!1086 (getValueByKey!717 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))))

(declare-fun bs!37949 () Bool)

(assert (= bs!37949 d!143171))

(assert (=> bs!37949 m!1215645))

(declare-fun m!1216115 () Bool)

(assert (=> bs!37949 m!1216115))

(assert (=> b!1326925 d!143171))

(declare-fun b!1327162 () Bool)

(declare-fun e!756437 () Option!768)

(assert (=> b!1327162 (= e!756437 None!766)))

(declare-fun c!125868 () Bool)

(declare-fun d!143173 () Bool)

(assert (=> d!143173 (= c!125868 (and ((_ is Cons!30734) (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (= (_1!11817 (h!31943 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) k0!1164)))))

(declare-fun e!756436 () Option!768)

(assert (=> d!143173 (= (getValueByKey!717 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164) e!756436)))

(declare-fun b!1327160 () Bool)

(assert (=> b!1327160 (= e!756436 e!756437)))

(declare-fun c!125869 () Bool)

(assert (=> b!1327160 (= c!125869 (and ((_ is Cons!30734) (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (not (= (_1!11817 (h!31943 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) k0!1164))))))

(declare-fun b!1327161 () Bool)

(assert (=> b!1327161 (= e!756437 (getValueByKey!717 (t!44734 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) k0!1164))))

(declare-fun b!1327159 () Bool)

(assert (=> b!1327159 (= e!756436 (Some!767 (_2!11817 (h!31943 (toList!10650 (getCurrentListMap!5522 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))))))

(assert (= (and d!143173 c!125868) b!1327159))

(assert (= (and d!143173 (not c!125868)) b!1327160))

(assert (= (and b!1327160 c!125869) b!1327161))

(assert (= (and b!1327160 (not c!125869)) b!1327162))

(declare-fun m!1216117 () Bool)

(assert (=> b!1327161 m!1216117))

(assert (=> b!1326925 d!143173))

(declare-fun d!143175 () Bool)

(declare-fun e!756438 () Bool)

(assert (=> d!143175 e!756438))

(declare-fun res!880750 () Bool)

(assert (=> d!143175 (=> res!880750 e!756438)))

(declare-fun lt!590504 () Bool)

(assert (=> d!143175 (= res!880750 (not lt!590504))))

(declare-fun lt!590503 () Bool)

(assert (=> d!143175 (= lt!590504 lt!590503)))

(declare-fun lt!590502 () Unit!43512)

(declare-fun e!756439 () Unit!43512)

(assert (=> d!143175 (= lt!590502 e!756439)))

(declare-fun c!125870 () Bool)

(assert (=> d!143175 (= c!125870 lt!590503)))

(assert (=> d!143175 (= lt!590503 (containsKey!734 (toList!10650 lt!590310) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143175 (= (contains!8736 lt!590310 #b1000000000000000000000000000000000000000000000000000000000000000) lt!590504)))

(declare-fun b!1327163 () Bool)

(declare-fun lt!590501 () Unit!43512)

(assert (=> b!1327163 (= e!756439 lt!590501)))

(assert (=> b!1327163 (= lt!590501 (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10650 lt!590310) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1327163 (isDefined!524 (getValueByKey!717 (toList!10650 lt!590310) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1327164 () Bool)

(declare-fun Unit!43524 () Unit!43512)

(assert (=> b!1327164 (= e!756439 Unit!43524)))

(declare-fun b!1327165 () Bool)

(assert (=> b!1327165 (= e!756438 (isDefined!524 (getValueByKey!717 (toList!10650 lt!590310) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143175 c!125870) b!1327163))

(assert (= (and d!143175 (not c!125870)) b!1327164))

(assert (= (and d!143175 (not res!880750)) b!1327165))

(declare-fun m!1216119 () Bool)

(assert (=> d!143175 m!1216119))

(declare-fun m!1216121 () Bool)

(assert (=> b!1327163 m!1216121))

(assert (=> b!1327163 m!1216099))

(assert (=> b!1327163 m!1216099))

(declare-fun m!1216123 () Bool)

(assert (=> b!1327163 m!1216123))

(assert (=> b!1327165 m!1216099))

(assert (=> b!1327165 m!1216099))

(assert (=> b!1327165 m!1216123))

(assert (=> bm!64764 d!143175))

(assert (=> bm!64774 d!143055))

(declare-fun d!143177 () Bool)

(declare-fun e!756440 () Bool)

(assert (=> d!143177 e!756440))

(declare-fun res!880751 () Bool)

(assert (=> d!143177 (=> res!880751 e!756440)))

(declare-fun lt!590508 () Bool)

(assert (=> d!143177 (= res!880751 (not lt!590508))))

(declare-fun lt!590507 () Bool)

(assert (=> d!143177 (= lt!590508 lt!590507)))

(declare-fun lt!590506 () Unit!43512)

(declare-fun e!756441 () Unit!43512)

(assert (=> d!143177 (= lt!590506 e!756441)))

(declare-fun c!125871 () Bool)

(assert (=> d!143177 (= c!125871 lt!590507)))

(assert (=> d!143177 (= lt!590507 (containsKey!734 (toList!10650 lt!590310) (select (arr!43248 _keys!1609) from!2000)))))

(assert (=> d!143177 (= (contains!8736 lt!590310 (select (arr!43248 _keys!1609) from!2000)) lt!590508)))

(declare-fun b!1327166 () Bool)

(declare-fun lt!590505 () Unit!43512)

(assert (=> b!1327166 (= e!756441 lt!590505)))

(assert (=> b!1327166 (= lt!590505 (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10650 lt!590310) (select (arr!43248 _keys!1609) from!2000)))))

(assert (=> b!1327166 (isDefined!524 (getValueByKey!717 (toList!10650 lt!590310) (select (arr!43248 _keys!1609) from!2000)))))

(declare-fun b!1327167 () Bool)

(declare-fun Unit!43525 () Unit!43512)

(assert (=> b!1327167 (= e!756441 Unit!43525)))

(declare-fun b!1327168 () Bool)

(assert (=> b!1327168 (= e!756440 (isDefined!524 (getValueByKey!717 (toList!10650 lt!590310) (select (arr!43248 _keys!1609) from!2000))))))

(assert (= (and d!143177 c!125871) b!1327166))

(assert (= (and d!143177 (not c!125871)) b!1327167))

(assert (= (and d!143177 (not res!880751)) b!1327168))

(assert (=> d!143177 m!1215515))

(declare-fun m!1216125 () Bool)

(assert (=> d!143177 m!1216125))

(assert (=> b!1327166 m!1215515))

(declare-fun m!1216127 () Bool)

(assert (=> b!1327166 m!1216127))

(assert (=> b!1327166 m!1215515))

(assert (=> b!1327166 m!1216103))

(assert (=> b!1327166 m!1216103))

(declare-fun m!1216129 () Bool)

(assert (=> b!1327166 m!1216129))

(assert (=> b!1327168 m!1215515))

(assert (=> b!1327168 m!1216103))

(assert (=> b!1327168 m!1216103))

(assert (=> b!1327168 m!1216129))

(assert (=> b!1326903 d!143177))

(assert (=> b!1326927 d!143171))

(assert (=> b!1326927 d!143173))

(declare-fun b!1327170 () Bool)

(declare-fun e!756443 () Bool)

(assert (=> b!1327170 (= e!756443 tp_is_empty!36355)))

(declare-fun b!1327169 () Bool)

(declare-fun e!756442 () Bool)

(assert (=> b!1327169 (= e!756442 tp_is_empty!36355)))

(declare-fun mapIsEmpty!56197 () Bool)

(declare-fun mapRes!56197 () Bool)

(assert (=> mapIsEmpty!56197 mapRes!56197))

(declare-fun mapNonEmpty!56197 () Bool)

(declare-fun tp!107105 () Bool)

(assert (=> mapNonEmpty!56197 (= mapRes!56197 (and tp!107105 e!756442))))

(declare-fun mapRest!56197 () (Array (_ BitVec 32) ValueCell!17279))

(declare-fun mapKey!56197 () (_ BitVec 32))

(declare-fun mapValue!56197 () ValueCell!17279)

(assert (=> mapNonEmpty!56197 (= mapRest!56196 (store mapRest!56197 mapKey!56197 mapValue!56197))))

(declare-fun condMapEmpty!56197 () Bool)

(declare-fun mapDefault!56197 () ValueCell!17279)

(assert (=> mapNonEmpty!56196 (= condMapEmpty!56197 (= mapRest!56196 ((as const (Array (_ BitVec 32) ValueCell!17279)) mapDefault!56197)))))

(assert (=> mapNonEmpty!56196 (= tp!107104 (and e!756443 mapRes!56197))))

(assert (= (and mapNonEmpty!56196 condMapEmpty!56197) mapIsEmpty!56197))

(assert (= (and mapNonEmpty!56196 (not condMapEmpty!56197)) mapNonEmpty!56197))

(assert (= (and mapNonEmpty!56197 ((_ is ValueCellFull!17279) mapValue!56197)) b!1327169))

(assert (= (and mapNonEmpty!56196 ((_ is ValueCellFull!17279) mapDefault!56197)) b!1327170))

(declare-fun m!1216131 () Bool)

(assert (=> mapNonEmpty!56197 m!1216131))

(declare-fun b_lambda!23837 () Bool)

(assert (= b_lambda!23835 (or (and start!111962 b_free!30535) b_lambda!23837)))

(declare-fun b_lambda!23839 () Bool)

(assert (= b_lambda!23829 (or (and start!111962 b_free!30535) b_lambda!23839)))

(declare-fun b_lambda!23841 () Bool)

(assert (= b_lambda!23833 (or (and start!111962 b_free!30535) b_lambda!23841)))

(declare-fun b_lambda!23843 () Bool)

(assert (= b_lambda!23831 (or (and start!111962 b_free!30535) b_lambda!23843)))

(check-sat (not d!143121) (not b!1327163) (not d!143049) (not b!1327030) (not d!143129) (not d!143047) (not d!143051) (not d!143149) (not b!1327129) (not b!1327168) (not d!143077) (not d!143073) (not d!143163) (not b!1327073) (not b!1327146) (not b!1327119) (not b!1327040) (not b_lambda!23843) (not mapNonEmpty!56197) (not b_lambda!23827) (not b!1327024) (not b!1327059) (not b!1327145) (not b!1327158) (not b!1327123) (not b_lambda!23841) (not b!1327124) (not b!1327072) (not d!143059) (not b!1327107) (not d!143131) (not b!1327152) (not d!143141) (not b!1327023) (not d!143143) (not b!1327125) (not b!1327161) (not b!1327075) (not d!143107) (not d!143123) (not b!1327031) (not b!1327139) (not b!1327057) (not d!143087) (not b!1327018) (not bm!64785) (not d!143139) b_and!49171 (not b!1327019) (not d!143177) (not b!1327117) (not d!143099) (not b!1327068) (not d!143071) (not b!1327013) (not d!143169) (not b!1327038) (not b!1327114) (not b!1327142) (not b!1327165) (not d!143165) (not d!143155) (not d!143057) (not b!1327039) (not d!143097) (not b!1327140) (not b!1327016) tp_is_empty!36355 (not d!143055) (not bm!64787) (not d!143083) (not d!143161) (not b!1327144) (not b!1327046) (not b!1327156) (not d!143137) (not b!1327128) (not d!143133) (not d!143091) (not b!1327070) (not b!1327033) (not d!143069) (not b!1327105) (not d!143159) (not b!1327147) (not bm!64786) (not d!143153) (not b!1327157) (not d!143101) (not b!1327098) (not b!1327122) (not b!1327116) (not d!143171) (not b!1327118) (not d!143063) (not b!1327032) (not b!1327130) (not b!1327151) (not b_lambda!23839) (not b!1327061) (not d!143067) (not bm!64788) (not d!143127) (not d!143103) (not b!1327148) (not b_lambda!23825) (not b!1327166) (not b!1327153) (not d!143151) (not b!1327104) (not d!143065) (not d!143145) (not b!1327029) (not b!1327017) (not b!1327101) (not b!1327136) (not b!1327155) (not b!1327062) (not d!143079) (not d!143147) (not b_lambda!23837) (not b_next!30535) (not b!1327035) (not b!1327149) (not b!1327069) (not d!143093) (not d!143125) (not b!1327043) (not d!143081) (not d!143053) (not b!1327037) (not b!1327102) (not d!143061) (not d!143175) (not d!143135) (not d!143089) (not b!1327042) (not b!1327150) (not b!1327081) (not d!143075) (not b!1327063) (not d!143157) (not b!1327022))
(check-sat b_and!49171 (not b_next!30535))
