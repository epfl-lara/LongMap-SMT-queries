; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11950 () Bool)

(assert start!11950)

(declare-fun b!100598 () Bool)

(declare-fun b_free!2449 () Bool)

(declare-fun b_next!2449 () Bool)

(assert (=> b!100598 (= b_free!2449 (not b_next!2449))))

(declare-fun tp!9645 () Bool)

(declare-fun b_and!6189 () Bool)

(assert (=> b!100598 (= tp!9645 b_and!6189)))

(declare-fun b!100584 () Bool)

(declare-fun b_free!2451 () Bool)

(declare-fun b_next!2451 () Bool)

(assert (=> b!100584 (= b_free!2451 (not b_next!2451))))

(declare-fun tp!9648 () Bool)

(declare-fun b_and!6191 () Bool)

(assert (=> b!100584 (= tp!9648 b_and!6191)))

(declare-fun b!100583 () Bool)

(declare-fun e!65499 () Bool)

(declare-fun e!65502 () Bool)

(assert (=> b!100583 (= e!65499 e!65502)))

(declare-fun res!50445 () Bool)

(assert (=> b!100583 (=> (not res!50445) (not e!65502))))

(declare-datatypes ((V!3169 0))(
  ( (V!3170 (val!1365 Int)) )
))
(declare-datatypes ((array!4251 0))(
  ( (array!4252 (arr!2018 (Array (_ BitVec 32) (_ BitVec 64))) (size!2270 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!977 0))(
  ( (ValueCellFull!977 (v!2832 V!3169)) (EmptyCell!977) )
))
(declare-datatypes ((array!4253 0))(
  ( (array!4254 (arr!2019 (Array (_ BitVec 32) ValueCell!977)) (size!2271 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!862 0))(
  ( (LongMapFixedSize!863 (defaultEntry!2522 Int) (mask!6639 (_ BitVec 32)) (extraKeys!2335 (_ BitVec 32)) (zeroValue!2401 V!3169) (minValue!2401 V!3169) (_size!480 (_ BitVec 32)) (_keys!4220 array!4251) (_values!2505 array!4253) (_vacant!480 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2314 0))(
  ( (tuple2!2315 (_1!1168 Bool) (_2!1168 LongMapFixedSize!862)) )
))
(declare-fun lt!50853 () tuple2!2314)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!100583 (= res!50445 (and (_1!1168 lt!50853) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!3048 0))(
  ( (Unit!3049) )
))
(declare-fun lt!50854 () Unit!3048)

(declare-fun e!65501 () Unit!3048)

(assert (=> b!100583 (= lt!50854 e!65501)))

(declare-datatypes ((tuple2!2316 0))(
  ( (tuple2!2317 (_1!1169 (_ BitVec 64)) (_2!1169 V!3169)) )
))
(declare-datatypes ((List!1571 0))(
  ( (Nil!1568) (Cons!1567 (h!2163 tuple2!2316) (t!5557 List!1571)) )
))
(declare-datatypes ((ListLongMap!1507 0))(
  ( (ListLongMap!1508 (toList!769 List!1571)) )
))
(declare-fun lt!50857 () ListLongMap!1507)

(declare-datatypes ((Cell!666 0))(
  ( (Cell!667 (v!2833 LongMapFixedSize!862)) )
))
(declare-datatypes ((LongMap!666 0))(
  ( (LongMap!667 (underlying!344 Cell!666)) )
))
(declare-fun thiss!992 () LongMap!666)

(declare-fun c!17276 () Bool)

(declare-fun contains!796 (ListLongMap!1507 (_ BitVec 64)) Bool)

(assert (=> b!100583 (= c!17276 (contains!796 lt!50857 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!862)

(declare-fun update!149 (LongMapFixedSize!862 (_ BitVec 64) V!3169) tuple2!2314)

(declare-fun get!1302 (ValueCell!977 V!3169) V!3169)

(declare-fun dynLambda!374 (Int (_ BitVec 64)) V!3169)

(assert (=> b!100583 (= lt!50853 (update!149 newMap!16 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!65496 () Bool)

(declare-fun e!65493 () Bool)

(declare-fun tp_is_empty!2641 () Bool)

(declare-fun array_inv!1243 (array!4251) Bool)

(declare-fun array_inv!1244 (array!4253) Bool)

(assert (=> b!100584 (= e!65496 (and tp!9648 tp_is_empty!2641 (array_inv!1243 (_keys!4220 newMap!16)) (array_inv!1244 (_values!2505 newMap!16)) e!65493))))

(declare-fun b!100585 () Bool)

(declare-fun e!65500 () Bool)

(assert (=> b!100585 (= e!65500 tp_is_empty!2641)))

(declare-fun b!100586 () Bool)

(declare-fun Unit!3050 () Unit!3048)

(assert (=> b!100586 (= e!65501 Unit!3050)))

(declare-fun b!100587 () Bool)

(declare-fun e!65492 () Bool)

(assert (=> b!100587 (= e!65492 tp_is_empty!2641)))

(declare-fun mapIsEmpty!3791 () Bool)

(declare-fun mapRes!3791 () Bool)

(assert (=> mapIsEmpty!3791 mapRes!3791))

(declare-fun b!100588 () Bool)

(declare-fun e!65505 () Bool)

(declare-fun e!65504 () Bool)

(assert (=> b!100588 (= e!65505 e!65504)))

(declare-fun mapNonEmpty!3791 () Bool)

(declare-fun mapRes!3792 () Bool)

(declare-fun tp!9647 () Bool)

(assert (=> mapNonEmpty!3791 (= mapRes!3792 (and tp!9647 e!65500))))

(declare-fun mapRest!3792 () (Array (_ BitVec 32) ValueCell!977))

(declare-fun mapValue!3792 () ValueCell!977)

(declare-fun mapKey!3791 () (_ BitVec 32))

(assert (=> mapNonEmpty!3791 (= (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) (store mapRest!3792 mapKey!3791 mapValue!3792))))

(declare-fun b!100589 () Bool)

(declare-fun res!50446 () Bool)

(assert (=> b!100589 (=> (not res!50446) (not e!65502))))

(assert (=> b!100589 (= res!50446 (and (= (size!2271 (_values!2505 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6639 (v!2833 (underlying!344 thiss!992))))) (= (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (size!2271 (_values!2505 (v!2833 (underlying!344 thiss!992))))) (bvsge (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!100590 () Bool)

(declare-fun e!65490 () Bool)

(assert (=> b!100590 (= e!65490 e!65505)))

(declare-fun b!100591 () Bool)

(declare-fun e!65498 () Bool)

(assert (=> b!100591 (= e!65498 e!65499)))

(declare-fun res!50447 () Bool)

(assert (=> b!100591 (=> (not res!50447) (not e!65499))))

(declare-fun lt!50858 () ListLongMap!1507)

(assert (=> b!100591 (= res!50447 (and (= lt!50858 lt!50857) (not (= (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1259 (LongMapFixedSize!862) ListLongMap!1507)

(assert (=> b!100591 (= lt!50857 (map!1259 newMap!16))))

(declare-fun getCurrentListMap!457 (array!4251 array!4253 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 32) Int) ListLongMap!1507)

(assert (=> b!100591 (= lt!50858 (getCurrentListMap!457 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (_values!2505 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992))) (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) (zeroValue!2401 (v!2833 (underlying!344 thiss!992))) (minValue!2401 (v!2833 (underlying!344 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2833 (underlying!344 thiss!992)))))))

(declare-fun b!100592 () Bool)

(declare-fun e!65494 () Bool)

(assert (=> b!100592 (= e!65494 tp_is_empty!2641)))

(declare-fun mapNonEmpty!3792 () Bool)

(declare-fun tp!9646 () Bool)

(assert (=> mapNonEmpty!3792 (= mapRes!3791 (and tp!9646 e!65492))))

(declare-fun mapKey!3792 () (_ BitVec 32))

(declare-fun mapValue!3791 () ValueCell!977)

(declare-fun mapRest!3791 () (Array (_ BitVec 32) ValueCell!977))

(assert (=> mapNonEmpty!3792 (= (arr!2019 (_values!2505 newMap!16)) (store mapRest!3791 mapKey!3792 mapValue!3791))))

(declare-fun b!100593 () Bool)

(declare-fun res!50443 () Bool)

(assert (=> b!100593 (=> (not res!50443) (not e!65498))))

(declare-fun valid!399 (LongMapFixedSize!862) Bool)

(assert (=> b!100593 (= res!50443 (valid!399 newMap!16))))

(declare-fun res!50448 () Bool)

(assert (=> start!11950 (=> (not res!50448) (not e!65498))))

(declare-fun valid!400 (LongMap!666) Bool)

(assert (=> start!11950 (= res!50448 (valid!400 thiss!992))))

(assert (=> start!11950 e!65498))

(assert (=> start!11950 e!65490))

(assert (=> start!11950 true))

(assert (=> start!11950 e!65496))

(declare-fun b!100594 () Bool)

(declare-fun e!65495 () Bool)

(assert (=> b!100594 (= e!65495 (and e!65494 mapRes!3792))))

(declare-fun condMapEmpty!3791 () Bool)

(declare-fun mapDefault!3792 () ValueCell!977)

(assert (=> b!100594 (= condMapEmpty!3791 (= (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!977)) mapDefault!3792)))))

(declare-fun b!100595 () Bool)

(declare-fun e!65503 () Bool)

(assert (=> b!100595 (= e!65503 tp_is_empty!2641)))

(declare-fun b!100596 () Bool)

(declare-fun res!50444 () Bool)

(assert (=> b!100596 (=> (not res!50444) (not e!65498))))

(assert (=> b!100596 (= res!50444 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992)))))))))

(declare-fun b!100597 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4251 (_ BitVec 32)) Bool)

(assert (=> b!100597 (= e!65502 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992))))))))

(assert (=> b!100598 (= e!65504 (and tp!9645 tp_is_empty!2641 (array_inv!1243 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (array_inv!1244 (_values!2505 (v!2833 (underlying!344 thiss!992)))) e!65495))))

(declare-fun b!100599 () Bool)

(assert (=> b!100599 (= e!65493 (and e!65503 mapRes!3791))))

(declare-fun condMapEmpty!3792 () Bool)

(declare-fun mapDefault!3791 () ValueCell!977)

(assert (=> b!100599 (= condMapEmpty!3792 (= (arr!2019 (_values!2505 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!977)) mapDefault!3791)))))

(declare-fun b!100600 () Bool)

(declare-fun res!50441 () Bool)

(assert (=> b!100600 (=> (not res!50441) (not e!65502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!100600 (= res!50441 (validMask!0 (mask!6639 (v!2833 (underlying!344 thiss!992)))))))

(declare-fun mapIsEmpty!3792 () Bool)

(assert (=> mapIsEmpty!3792 mapRes!3792))

(declare-fun b!100601 () Bool)

(declare-fun Unit!3051 () Unit!3048)

(assert (=> b!100601 (= e!65501 Unit!3051)))

(declare-fun lt!50855 () Unit!3048)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!89 (array!4251 array!4253 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 64) (_ BitVec 32) Int) Unit!3048)

(assert (=> b!100601 (= lt!50855 (lemmaListMapContainsThenArrayContainsFrom!89 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (_values!2505 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992))) (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) (zeroValue!2401 (v!2833 (underlying!344 thiss!992))) (minValue!2401 (v!2833 (underlying!344 thiss!992))) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2833 (underlying!344 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!100601 (arrayContainsKey!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!50856 () Unit!3048)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4251 (_ BitVec 32) (_ BitVec 32)) Unit!3048)

(assert (=> b!100601 (= lt!50856 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1572 0))(
  ( (Nil!1569) (Cons!1568 (h!2164 (_ BitVec 64)) (t!5558 List!1572)) )
))
(declare-fun arrayNoDuplicates!0 (array!4251 (_ BitVec 32) List!1572) Bool)

(assert (=> b!100601 (arrayNoDuplicates!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) from!355 Nil!1569)))

(declare-fun lt!50859 () Unit!3048)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4251 (_ BitVec 32) (_ BitVec 64) List!1572) Unit!3048)

(assert (=> b!100601 (= lt!50859 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (Cons!1568 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) Nil!1569)))))

(assert (=> b!100601 false))

(declare-fun b!100602 () Bool)

(declare-fun res!50442 () Bool)

(assert (=> b!100602 (=> (not res!50442) (not e!65498))))

(assert (=> b!100602 (= res!50442 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6639 newMap!16)) (_size!480 (v!2833 (underlying!344 thiss!992)))))))

(assert (= (and start!11950 res!50448) b!100596))

(assert (= (and b!100596 res!50444) b!100593))

(assert (= (and b!100593 res!50443) b!100602))

(assert (= (and b!100602 res!50442) b!100591))

(assert (= (and b!100591 res!50447) b!100583))

(assert (= (and b!100583 c!17276) b!100601))

(assert (= (and b!100583 (not c!17276)) b!100586))

(assert (= (and b!100583 res!50445) b!100600))

(assert (= (and b!100600 res!50441) b!100589))

(assert (= (and b!100589 res!50446) b!100597))

(assert (= (and b!100594 condMapEmpty!3791) mapIsEmpty!3792))

(assert (= (and b!100594 (not condMapEmpty!3791)) mapNonEmpty!3791))

(get-info :version)

(assert (= (and mapNonEmpty!3791 ((_ is ValueCellFull!977) mapValue!3792)) b!100585))

(assert (= (and b!100594 ((_ is ValueCellFull!977) mapDefault!3792)) b!100592))

(assert (= b!100598 b!100594))

(assert (= b!100588 b!100598))

(assert (= b!100590 b!100588))

(assert (= start!11950 b!100590))

(assert (= (and b!100599 condMapEmpty!3792) mapIsEmpty!3791))

(assert (= (and b!100599 (not condMapEmpty!3792)) mapNonEmpty!3792))

(assert (= (and mapNonEmpty!3792 ((_ is ValueCellFull!977) mapValue!3791)) b!100587))

(assert (= (and b!100599 ((_ is ValueCellFull!977) mapDefault!3791)) b!100595))

(assert (= b!100584 b!100599))

(assert (= start!11950 b!100584))

(declare-fun b_lambda!4513 () Bool)

(assert (=> (not b_lambda!4513) (not b!100583)))

(declare-fun t!5554 () Bool)

(declare-fun tb!1953 () Bool)

(assert (=> (and b!100598 (= (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) (defaultEntry!2522 (v!2833 (underlying!344 thiss!992)))) t!5554) tb!1953))

(declare-fun result!3307 () Bool)

(assert (=> tb!1953 (= result!3307 tp_is_empty!2641)))

(assert (=> b!100583 t!5554))

(declare-fun b_and!6193 () Bool)

(assert (= b_and!6189 (and (=> t!5554 result!3307) b_and!6193)))

(declare-fun t!5556 () Bool)

(declare-fun tb!1955 () Bool)

(assert (=> (and b!100584 (= (defaultEntry!2522 newMap!16) (defaultEntry!2522 (v!2833 (underlying!344 thiss!992)))) t!5556) tb!1955))

(declare-fun result!3311 () Bool)

(assert (= result!3311 result!3307))

(assert (=> b!100583 t!5556))

(declare-fun b_and!6195 () Bool)

(assert (= b_and!6191 (and (=> t!5556 result!3311) b_and!6195)))

(declare-fun m!111393 () Bool)

(assert (=> b!100583 m!111393))

(declare-fun m!111395 () Bool)

(assert (=> b!100583 m!111395))

(declare-fun m!111397 () Bool)

(assert (=> b!100583 m!111397))

(declare-fun m!111399 () Bool)

(assert (=> b!100583 m!111399))

(declare-fun m!111401 () Bool)

(assert (=> b!100583 m!111401))

(assert (=> b!100583 m!111399))

(assert (=> b!100583 m!111395))

(assert (=> b!100583 m!111399))

(assert (=> b!100583 m!111397))

(declare-fun m!111403 () Bool)

(assert (=> b!100583 m!111403))

(assert (=> b!100583 m!111393))

(declare-fun m!111405 () Bool)

(assert (=> b!100600 m!111405))

(declare-fun m!111407 () Bool)

(assert (=> b!100597 m!111407))

(declare-fun m!111409 () Bool)

(assert (=> b!100601 m!111409))

(declare-fun m!111411 () Bool)

(assert (=> b!100601 m!111411))

(assert (=> b!100601 m!111399))

(declare-fun m!111413 () Bool)

(assert (=> b!100601 m!111413))

(assert (=> b!100601 m!111399))

(assert (=> b!100601 m!111399))

(declare-fun m!111415 () Bool)

(assert (=> b!100601 m!111415))

(assert (=> b!100601 m!111399))

(declare-fun m!111417 () Bool)

(assert (=> b!100601 m!111417))

(declare-fun m!111419 () Bool)

(assert (=> mapNonEmpty!3792 m!111419))

(declare-fun m!111421 () Bool)

(assert (=> b!100584 m!111421))

(declare-fun m!111423 () Bool)

(assert (=> b!100584 m!111423))

(assert (=> b!100591 m!111399))

(declare-fun m!111425 () Bool)

(assert (=> b!100591 m!111425))

(declare-fun m!111427 () Bool)

(assert (=> b!100591 m!111427))

(declare-fun m!111429 () Bool)

(assert (=> mapNonEmpty!3791 m!111429))

(declare-fun m!111431 () Bool)

(assert (=> b!100598 m!111431))

(declare-fun m!111433 () Bool)

(assert (=> b!100598 m!111433))

(declare-fun m!111435 () Bool)

(assert (=> start!11950 m!111435))

(declare-fun m!111437 () Bool)

(assert (=> b!100593 m!111437))

(check-sat (not b!100584) (not mapNonEmpty!3792) (not b_next!2449) (not b!100583) (not b_lambda!4513) b_and!6193 (not start!11950) (not b!100601) tp_is_empty!2641 (not b!100591) (not b!100593) (not b_next!2451) b_and!6195 (not b!100598) (not b!100597) (not mapNonEmpty!3791) (not b!100600))
(check-sat b_and!6193 b_and!6195 (not b_next!2449) (not b_next!2451))
(get-model)

(declare-fun b_lambda!4519 () Bool)

(assert (= b_lambda!4513 (or (and b!100598 b_free!2449) (and b!100584 b_free!2451 (= (defaultEntry!2522 newMap!16) (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))))) b_lambda!4519)))

(check-sat (not b!100584) (not mapNonEmpty!3792) (not b_next!2449) (not b!100583) b_and!6193 (not start!11950) (not b!100601) (not b_lambda!4519) tp_is_empty!2641 (not b!100591) (not b!100593) (not b_next!2451) b_and!6195 (not b!100598) (not b!100597) (not mapNonEmpty!3791) (not b!100600))
(check-sat b_and!6193 b_and!6195 (not b_next!2449) (not b_next!2451))
(get-model)

(declare-fun d!27339 () Bool)

(assert (=> d!27339 (= (validMask!0 (mask!6639 (v!2833 (underlying!344 thiss!992)))) (and (or (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000000111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000001111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000011111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000111111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000001111111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000011111111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000111111111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000001111111111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000011111111111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000111111111111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000000000000000001111111111111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000000000000000011111111111111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000000000000000111111111111111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000000000000001111111111111111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000000000000011111111111111111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000000000000111111111111111111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000000000001111111111111111111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000000000011111111111111111111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000000000111111111111111111111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000000001111111111111111111111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000000011111111111111111111111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000000111111111111111111111111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000001111111111111111111111111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000011111111111111111111111111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00000111111111111111111111111111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00001111111111111111111111111111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00011111111111111111111111111111) (= (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6639 (v!2833 (underlying!344 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!100600 d!27339))

(declare-fun d!27341 () Bool)

(declare-fun res!50503 () Bool)

(declare-fun e!65604 () Bool)

(assert (=> d!27341 (=> (not res!50503) (not e!65604))))

(declare-fun simpleValid!70 (LongMapFixedSize!862) Bool)

(assert (=> d!27341 (= res!50503 (simpleValid!70 newMap!16))))

(assert (=> d!27341 (= (valid!399 newMap!16) e!65604)))

(declare-fun b!100735 () Bool)

(declare-fun res!50504 () Bool)

(assert (=> b!100735 (=> (not res!50504) (not e!65604))))

(declare-fun arrayCountValidKeys!0 (array!4251 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!100735 (= res!50504 (= (arrayCountValidKeys!0 (_keys!4220 newMap!16) #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))) (_size!480 newMap!16)))))

(declare-fun b!100736 () Bool)

(declare-fun res!50505 () Bool)

(assert (=> b!100736 (=> (not res!50505) (not e!65604))))

(assert (=> b!100736 (= res!50505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4220 newMap!16) (mask!6639 newMap!16)))))

(declare-fun b!100737 () Bool)

(assert (=> b!100737 (= e!65604 (arrayNoDuplicates!0 (_keys!4220 newMap!16) #b00000000000000000000000000000000 Nil!1569))))

(assert (= (and d!27341 res!50503) b!100735))

(assert (= (and b!100735 res!50504) b!100736))

(assert (= (and b!100736 res!50505) b!100737))

(declare-fun m!111531 () Bool)

(assert (=> d!27341 m!111531))

(declare-fun m!111533 () Bool)

(assert (=> b!100735 m!111533))

(declare-fun m!111535 () Bool)

(assert (=> b!100736 m!111535))

(declare-fun m!111537 () Bool)

(assert (=> b!100737 m!111537))

(assert (=> b!100593 d!27341))

(declare-fun d!27343 () Bool)

(assert (=> d!27343 (= (array_inv!1243 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvsge (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!100598 d!27343))

(declare-fun d!27345 () Bool)

(assert (=> d!27345 (= (array_inv!1244 (_values!2505 (v!2833 (underlying!344 thiss!992)))) (bvsge (size!2271 (_values!2505 (v!2833 (underlying!344 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!100598 d!27345))

(declare-fun d!27347 () Bool)

(assert (=> d!27347 (= (valid!400 thiss!992) (valid!399 (v!2833 (underlying!344 thiss!992))))))

(declare-fun bs!4180 () Bool)

(assert (= bs!4180 d!27347))

(declare-fun m!111539 () Bool)

(assert (=> bs!4180 m!111539))

(assert (=> start!11950 d!27347))

(declare-fun bm!10342 () Bool)

(declare-fun call!10345 () Bool)

(assert (=> bm!10342 (= call!10345 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4220 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992)))))))

(declare-fun b!100746 () Bool)

(declare-fun e!65613 () Bool)

(declare-fun e!65611 () Bool)

(assert (=> b!100746 (= e!65613 e!65611)))

(declare-fun c!17285 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!100746 (= c!17285 (validKeyInArray!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!100747 () Bool)

(declare-fun e!65612 () Bool)

(assert (=> b!100747 (= e!65612 call!10345)))

(declare-fun b!100748 () Bool)

(assert (=> b!100748 (= e!65611 e!65612)))

(declare-fun lt!50909 () (_ BitVec 64))

(assert (=> b!100748 (= lt!50909 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!50908 () Unit!3048)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4251 (_ BitVec 64) (_ BitVec 32)) Unit!3048)

(assert (=> b!100748 (= lt!50908 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) lt!50909 #b00000000000000000000000000000000))))

(assert (=> b!100748 (arrayContainsKey!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) lt!50909 #b00000000000000000000000000000000)))

(declare-fun lt!50910 () Unit!3048)

(assert (=> b!100748 (= lt!50910 lt!50908)))

(declare-fun res!50510 () Bool)

(declare-datatypes ((SeekEntryResult!249 0))(
  ( (MissingZero!249 (index!3141 (_ BitVec 32))) (Found!249 (index!3142 (_ BitVec 32))) (Intermediate!249 (undefined!1061 Bool) (index!3143 (_ BitVec 32)) (x!13243 (_ BitVec 32))) (Undefined!249) (MissingVacant!249 (index!3144 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4251 (_ BitVec 32)) SeekEntryResult!249)

(assert (=> b!100748 (= res!50510 (= (seekEntryOrOpen!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) #b00000000000000000000000000000000) (_keys!4220 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992)))) (Found!249 #b00000000000000000000000000000000)))))

(assert (=> b!100748 (=> (not res!50510) (not e!65612))))

(declare-fun d!27349 () Bool)

(declare-fun res!50511 () Bool)

(assert (=> d!27349 (=> res!50511 e!65613)))

(assert (=> d!27349 (= res!50511 (bvsge #b00000000000000000000000000000000 (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992))))))))

(assert (=> d!27349 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992)))) e!65613)))

(declare-fun b!100749 () Bool)

(assert (=> b!100749 (= e!65611 call!10345)))

(assert (= (and d!27349 (not res!50511)) b!100746))

(assert (= (and b!100746 c!17285) b!100748))

(assert (= (and b!100746 (not c!17285)) b!100749))

(assert (= (and b!100748 res!50510) b!100747))

(assert (= (or b!100747 b!100749) bm!10342))

(declare-fun m!111541 () Bool)

(assert (=> bm!10342 m!111541))

(declare-fun m!111543 () Bool)

(assert (=> b!100746 m!111543))

(assert (=> b!100746 m!111543))

(declare-fun m!111545 () Bool)

(assert (=> b!100746 m!111545))

(assert (=> b!100748 m!111543))

(declare-fun m!111547 () Bool)

(assert (=> b!100748 m!111547))

(declare-fun m!111549 () Bool)

(assert (=> b!100748 m!111549))

(assert (=> b!100748 m!111543))

(declare-fun m!111551 () Bool)

(assert (=> b!100748 m!111551))

(assert (=> b!100597 d!27349))

(declare-fun d!27351 () Bool)

(assert (=> d!27351 (= (array_inv!1243 (_keys!4220 newMap!16)) (bvsge (size!2270 (_keys!4220 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!100584 d!27351))

(declare-fun d!27353 () Bool)

(assert (=> d!27353 (= (array_inv!1244 (_values!2505 newMap!16)) (bvsge (size!2271 (_values!2505 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!100584 d!27353))

(declare-fun d!27355 () Bool)

(assert (=> d!27355 (not (arrayContainsKey!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!50913 () Unit!3048)

(declare-fun choose!68 (array!4251 (_ BitVec 32) (_ BitVec 64) List!1572) Unit!3048)

(assert (=> d!27355 (= lt!50913 (choose!68 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (Cons!1568 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) Nil!1569)))))

(assert (=> d!27355 (bvslt (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!27355 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (Cons!1568 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) Nil!1569)) lt!50913)))

(declare-fun bs!4181 () Bool)

(assert (= bs!4181 d!27355))

(assert (=> bs!4181 m!111399))

(assert (=> bs!4181 m!111415))

(assert (=> bs!4181 m!111399))

(declare-fun m!111553 () Bool)

(assert (=> bs!4181 m!111553))

(assert (=> b!100601 d!27355))

(declare-fun d!27357 () Bool)

(assert (=> d!27357 (arrayNoDuplicates!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) from!355 Nil!1569)))

(declare-fun lt!50916 () Unit!3048)

(declare-fun choose!39 (array!4251 (_ BitVec 32) (_ BitVec 32)) Unit!3048)

(assert (=> d!27357 (= lt!50916 (choose!39 (_keys!4220 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!27357 (bvslt (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!27357 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000000000 from!355) lt!50916)))

(declare-fun bs!4182 () Bool)

(assert (= bs!4182 d!27357))

(assert (=> bs!4182 m!111411))

(declare-fun m!111555 () Bool)

(assert (=> bs!4182 m!111555))

(assert (=> b!100601 d!27357))

(declare-fun d!27359 () Bool)

(declare-fun res!50516 () Bool)

(declare-fun e!65618 () Bool)

(assert (=> d!27359 (=> res!50516 e!65618)))

(assert (=> d!27359 (= res!50516 (= (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(assert (=> d!27359 (= (arrayContainsKey!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!65618)))

(declare-fun b!100754 () Bool)

(declare-fun e!65619 () Bool)

(assert (=> b!100754 (= e!65618 e!65619)))

(declare-fun res!50517 () Bool)

(assert (=> b!100754 (=> (not res!50517) (not e!65619))))

(assert (=> b!100754 (= res!50517 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992))))))))

(declare-fun b!100755 () Bool)

(assert (=> b!100755 (= e!65619 (arrayContainsKey!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!27359 (not res!50516)) b!100754))

(assert (= (and b!100754 res!50517) b!100755))

(declare-fun m!111557 () Bool)

(assert (=> d!27359 m!111557))

(assert (=> b!100755 m!111399))

(declare-fun m!111559 () Bool)

(assert (=> b!100755 m!111559))

(assert (=> b!100601 d!27359))

(declare-fun d!27361 () Bool)

(declare-fun e!65622 () Bool)

(assert (=> d!27361 e!65622))

(declare-fun c!17288 () Bool)

(assert (=> d!27361 (= c!17288 (and (not (= (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!50919 () Unit!3048)

(declare-fun choose!622 (array!4251 array!4253 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 64) (_ BitVec 32) Int) Unit!3048)

(assert (=> d!27361 (= lt!50919 (choose!622 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (_values!2505 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992))) (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) (zeroValue!2401 (v!2833 (underlying!344 thiss!992))) (minValue!2401 (v!2833 (underlying!344 thiss!992))) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2833 (underlying!344 thiss!992)))))))

(assert (=> d!27361 (validMask!0 (mask!6639 (v!2833 (underlying!344 thiss!992))))))

(assert (=> d!27361 (= (lemmaListMapContainsThenArrayContainsFrom!89 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (_values!2505 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992))) (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) (zeroValue!2401 (v!2833 (underlying!344 thiss!992))) (minValue!2401 (v!2833 (underlying!344 thiss!992))) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2833 (underlying!344 thiss!992)))) lt!50919)))

(declare-fun b!100760 () Bool)

(assert (=> b!100760 (= e!65622 (arrayContainsKey!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!100761 () Bool)

(assert (=> b!100761 (= e!65622 (ite (= (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!27361 c!17288) b!100760))

(assert (= (and d!27361 (not c!17288)) b!100761))

(assert (=> d!27361 m!111399))

(declare-fun m!111561 () Bool)

(assert (=> d!27361 m!111561))

(assert (=> d!27361 m!111405))

(assert (=> b!100760 m!111399))

(assert (=> b!100760 m!111415))

(assert (=> b!100601 d!27361))

(declare-fun b!100772 () Bool)

(declare-fun e!65632 () Bool)

(declare-fun e!65634 () Bool)

(assert (=> b!100772 (= e!65632 e!65634)))

(declare-fun res!50524 () Bool)

(assert (=> b!100772 (=> (not res!50524) (not e!65634))))

(declare-fun e!65631 () Bool)

(assert (=> b!100772 (= res!50524 (not e!65631))))

(declare-fun res!50526 () Bool)

(assert (=> b!100772 (=> (not res!50526) (not e!65631))))

(assert (=> b!100772 (= res!50526 (validKeyInArray!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(declare-fun b!100773 () Bool)

(declare-fun e!65633 () Bool)

(declare-fun call!10348 () Bool)

(assert (=> b!100773 (= e!65633 call!10348)))

(declare-fun b!100774 () Bool)

(assert (=> b!100774 (= e!65633 call!10348)))

(declare-fun b!100775 () Bool)

(assert (=> b!100775 (= e!65634 e!65633)))

(declare-fun c!17291 () Bool)

(assert (=> b!100775 (= c!17291 (validKeyInArray!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(declare-fun d!27363 () Bool)

(declare-fun res!50525 () Bool)

(assert (=> d!27363 (=> res!50525 e!65632)))

(assert (=> d!27363 (= res!50525 (bvsge from!355 (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992))))))))

(assert (=> d!27363 (= (arrayNoDuplicates!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) from!355 Nil!1569) e!65632)))

(declare-fun bm!10345 () Bool)

(assert (=> bm!10345 (= call!10348 (arrayNoDuplicates!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!17291 (Cons!1568 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) Nil!1569) Nil!1569)))))

(declare-fun b!100776 () Bool)

(declare-fun contains!798 (List!1572 (_ BitVec 64)) Bool)

(assert (=> b!100776 (= e!65631 (contains!798 Nil!1569 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(assert (= (and d!27363 (not res!50525)) b!100772))

(assert (= (and b!100772 res!50526) b!100776))

(assert (= (and b!100772 res!50524) b!100775))

(assert (= (and b!100775 c!17291) b!100774))

(assert (= (and b!100775 (not c!17291)) b!100773))

(assert (= (or b!100774 b!100773) bm!10345))

(assert (=> b!100772 m!111399))

(assert (=> b!100772 m!111399))

(declare-fun m!111563 () Bool)

(assert (=> b!100772 m!111563))

(assert (=> b!100775 m!111399))

(assert (=> b!100775 m!111399))

(assert (=> b!100775 m!111563))

(assert (=> bm!10345 m!111399))

(declare-fun m!111565 () Bool)

(assert (=> bm!10345 m!111565))

(assert (=> b!100776 m!111399))

(assert (=> b!100776 m!111399))

(declare-fun m!111567 () Bool)

(assert (=> b!100776 m!111567))

(assert (=> b!100601 d!27363))

(declare-fun d!27365 () Bool)

(assert (=> d!27365 (= (map!1259 newMap!16) (getCurrentListMap!457 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun bs!4183 () Bool)

(assert (= bs!4183 d!27365))

(declare-fun m!111569 () Bool)

(assert (=> bs!4183 m!111569))

(assert (=> b!100591 d!27365))

(declare-fun b!100819 () Bool)

(declare-fun e!65664 () ListLongMap!1507)

(declare-fun call!10369 () ListLongMap!1507)

(assert (=> b!100819 (= e!65664 call!10369)))

(declare-fun b!100820 () Bool)

(declare-fun c!17307 () Bool)

(assert (=> b!100820 (= c!17307 (and (not (= (bvand (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!65671 () ListLongMap!1507)

(assert (=> b!100820 (= e!65671 e!65664)))

(declare-fun d!27367 () Bool)

(declare-fun e!65662 () Bool)

(assert (=> d!27367 e!65662))

(declare-fun res!50551 () Bool)

(assert (=> d!27367 (=> (not res!50551) (not e!65662))))

(assert (=> d!27367 (= res!50551 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992))))))))))

(declare-fun lt!50965 () ListLongMap!1507)

(declare-fun lt!50985 () ListLongMap!1507)

(assert (=> d!27367 (= lt!50965 lt!50985)))

(declare-fun lt!50979 () Unit!3048)

(declare-fun e!65672 () Unit!3048)

(assert (=> d!27367 (= lt!50979 e!65672)))

(declare-fun c!17306 () Bool)

(declare-fun e!65673 () Bool)

(assert (=> d!27367 (= c!17306 e!65673)))

(declare-fun res!50545 () Bool)

(assert (=> d!27367 (=> (not res!50545) (not e!65673))))

(assert (=> d!27367 (= res!50545 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992))))))))

(declare-fun e!65668 () ListLongMap!1507)

(assert (=> d!27367 (= lt!50985 e!65668)))

(declare-fun c!17309 () Bool)

(assert (=> d!27367 (= c!17309 (and (not (= (bvand (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27367 (validMask!0 (mask!6639 (v!2833 (underlying!344 thiss!992))))))

(assert (=> d!27367 (= (getCurrentListMap!457 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (_values!2505 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992))) (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) (zeroValue!2401 (v!2833 (underlying!344 thiss!992))) (minValue!2401 (v!2833 (underlying!344 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2833 (underlying!344 thiss!992)))) lt!50965)))

(declare-fun b!100821 () Bool)

(declare-fun Unit!3059 () Unit!3048)

(assert (=> b!100821 (= e!65672 Unit!3059)))

(declare-fun b!100822 () Bool)

(declare-fun res!50552 () Bool)

(assert (=> b!100822 (=> (not res!50552) (not e!65662))))

(declare-fun e!65669 () Bool)

(assert (=> b!100822 (= res!50552 e!65669)))

(declare-fun c!17304 () Bool)

(assert (=> b!100822 (= c!17304 (not (= (bvand (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!100823 () Bool)

(declare-fun e!65666 () Bool)

(declare-fun call!10365 () Bool)

(assert (=> b!100823 (= e!65666 (not call!10365))))

(declare-fun b!100824 () Bool)

(declare-fun e!65667 () Bool)

(assert (=> b!100824 (= e!65669 e!65667)))

(declare-fun res!50548 () Bool)

(declare-fun call!10364 () Bool)

(assert (=> b!100824 (= res!50548 call!10364)))

(assert (=> b!100824 (=> (not res!50548) (not e!65667))))

(declare-fun bm!10360 () Bool)

(declare-fun call!10368 () ListLongMap!1507)

(declare-fun call!10363 () ListLongMap!1507)

(assert (=> bm!10360 (= call!10368 call!10363)))

(declare-fun b!100825 () Bool)

(declare-fun call!10366 () ListLongMap!1507)

(assert (=> b!100825 (= e!65664 call!10366)))

(declare-fun b!100826 () Bool)

(assert (=> b!100826 (= e!65662 e!65666)))

(declare-fun c!17305 () Bool)

(assert (=> b!100826 (= c!17305 (not (= (bvand (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!10361 () Bool)

(declare-fun call!10367 () ListLongMap!1507)

(assert (=> bm!10361 (= call!10369 call!10367)))

(declare-fun bm!10362 () Bool)

(declare-fun c!17308 () Bool)

(declare-fun +!132 (ListLongMap!1507 tuple2!2316) ListLongMap!1507)

(assert (=> bm!10362 (= call!10367 (+!132 (ite c!17309 call!10363 (ite c!17308 call!10368 call!10366)) (ite (or c!17309 c!17308) (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))))))

(declare-fun b!100827 () Bool)

(declare-fun e!65663 () Bool)

(assert (=> b!100827 (= e!65663 (validKeyInArray!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!65670 () Bool)

(declare-fun b!100828 () Bool)

(declare-fun apply!94 (ListLongMap!1507 (_ BitVec 64)) V!3169)

(assert (=> b!100828 (= e!65670 (= (apply!94 lt!50965 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!100828 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2271 (_values!2505 (v!2833 (underlying!344 thiss!992))))))))

(assert (=> b!100828 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992))))))))

(declare-fun b!100829 () Bool)

(assert (=> b!100829 (= e!65668 (+!132 call!10367 (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2833 (underlying!344 thiss!992))))))))

(declare-fun b!100830 () Bool)

(assert (=> b!100830 (= e!65669 (not call!10364))))

(declare-fun bm!10363 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!97 (array!4251 array!4253 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 32) Int) ListLongMap!1507)

(assert (=> bm!10363 (= call!10363 (getCurrentListMapNoExtraKeys!97 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (_values!2505 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992))) (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) (zeroValue!2401 (v!2833 (underlying!344 thiss!992))) (minValue!2401 (v!2833 (underlying!344 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2833 (underlying!344 thiss!992)))))))

(declare-fun b!100831 () Bool)

(declare-fun res!50549 () Bool)

(assert (=> b!100831 (=> (not res!50549) (not e!65662))))

(declare-fun e!65665 () Bool)

(assert (=> b!100831 (= res!50549 e!65665)))

(declare-fun res!50550 () Bool)

(assert (=> b!100831 (=> res!50550 e!65665)))

(assert (=> b!100831 (= res!50550 (not e!65663))))

(declare-fun res!50547 () Bool)

(assert (=> b!100831 (=> (not res!50547) (not e!65663))))

(assert (=> b!100831 (= res!50547 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992))))))))

(declare-fun b!100832 () Bool)

(assert (=> b!100832 (= e!65665 e!65670)))

(declare-fun res!50553 () Bool)

(assert (=> b!100832 (=> (not res!50553) (not e!65670))))

(assert (=> b!100832 (= res!50553 (contains!796 lt!50965 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!100832 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992))))))))

(declare-fun bm!10364 () Bool)

(assert (=> bm!10364 (= call!10365 (contains!796 lt!50965 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!100833 () Bool)

(assert (=> b!100833 (= e!65668 e!65671)))

(assert (=> b!100833 (= c!17308 (and (not (= (bvand (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!100834 () Bool)

(declare-fun e!65661 () Bool)

(assert (=> b!100834 (= e!65661 (= (apply!94 lt!50965 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2401 (v!2833 (underlying!344 thiss!992)))))))

(declare-fun bm!10365 () Bool)

(assert (=> bm!10365 (= call!10366 call!10368)))

(declare-fun b!100835 () Bool)

(assert (=> b!100835 (= e!65671 call!10369)))

(declare-fun b!100836 () Bool)

(assert (=> b!100836 (= e!65667 (= (apply!94 lt!50965 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))))))

(declare-fun b!100837 () Bool)

(declare-fun lt!50982 () Unit!3048)

(assert (=> b!100837 (= e!65672 lt!50982)))

(declare-fun lt!50972 () ListLongMap!1507)

(assert (=> b!100837 (= lt!50972 (getCurrentListMapNoExtraKeys!97 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (_values!2505 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992))) (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) (zeroValue!2401 (v!2833 (underlying!344 thiss!992))) (minValue!2401 (v!2833 (underlying!344 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2833 (underlying!344 thiss!992)))))))

(declare-fun lt!50984 () (_ BitVec 64))

(assert (=> b!100837 (= lt!50984 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!50970 () (_ BitVec 64))

(assert (=> b!100837 (= lt!50970 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!50976 () Unit!3048)

(declare-fun addStillContains!70 (ListLongMap!1507 (_ BitVec 64) V!3169 (_ BitVec 64)) Unit!3048)

(assert (=> b!100837 (= lt!50976 (addStillContains!70 lt!50972 lt!50984 (zeroValue!2401 (v!2833 (underlying!344 thiss!992))) lt!50970))))

(assert (=> b!100837 (contains!796 (+!132 lt!50972 (tuple2!2317 lt!50984 (zeroValue!2401 (v!2833 (underlying!344 thiss!992))))) lt!50970)))

(declare-fun lt!50977 () Unit!3048)

(assert (=> b!100837 (= lt!50977 lt!50976)))

(declare-fun lt!50973 () ListLongMap!1507)

(assert (=> b!100837 (= lt!50973 (getCurrentListMapNoExtraKeys!97 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (_values!2505 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992))) (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) (zeroValue!2401 (v!2833 (underlying!344 thiss!992))) (minValue!2401 (v!2833 (underlying!344 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2833 (underlying!344 thiss!992)))))))

(declare-fun lt!50974 () (_ BitVec 64))

(assert (=> b!100837 (= lt!50974 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!50978 () (_ BitVec 64))

(assert (=> b!100837 (= lt!50978 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!50968 () Unit!3048)

(declare-fun addApplyDifferent!70 (ListLongMap!1507 (_ BitVec 64) V!3169 (_ BitVec 64)) Unit!3048)

(assert (=> b!100837 (= lt!50968 (addApplyDifferent!70 lt!50973 lt!50974 (minValue!2401 (v!2833 (underlying!344 thiss!992))) lt!50978))))

(assert (=> b!100837 (= (apply!94 (+!132 lt!50973 (tuple2!2317 lt!50974 (minValue!2401 (v!2833 (underlying!344 thiss!992))))) lt!50978) (apply!94 lt!50973 lt!50978))))

(declare-fun lt!50975 () Unit!3048)

(assert (=> b!100837 (= lt!50975 lt!50968)))

(declare-fun lt!50980 () ListLongMap!1507)

(assert (=> b!100837 (= lt!50980 (getCurrentListMapNoExtraKeys!97 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (_values!2505 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992))) (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) (zeroValue!2401 (v!2833 (underlying!344 thiss!992))) (minValue!2401 (v!2833 (underlying!344 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2833 (underlying!344 thiss!992)))))))

(declare-fun lt!50966 () (_ BitVec 64))

(assert (=> b!100837 (= lt!50966 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!50969 () (_ BitVec 64))

(assert (=> b!100837 (= lt!50969 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!50981 () Unit!3048)

(assert (=> b!100837 (= lt!50981 (addApplyDifferent!70 lt!50980 lt!50966 (zeroValue!2401 (v!2833 (underlying!344 thiss!992))) lt!50969))))

(assert (=> b!100837 (= (apply!94 (+!132 lt!50980 (tuple2!2317 lt!50966 (zeroValue!2401 (v!2833 (underlying!344 thiss!992))))) lt!50969) (apply!94 lt!50980 lt!50969))))

(declare-fun lt!50967 () Unit!3048)

(assert (=> b!100837 (= lt!50967 lt!50981)))

(declare-fun lt!50964 () ListLongMap!1507)

(assert (=> b!100837 (= lt!50964 (getCurrentListMapNoExtraKeys!97 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (_values!2505 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992))) (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) (zeroValue!2401 (v!2833 (underlying!344 thiss!992))) (minValue!2401 (v!2833 (underlying!344 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2833 (underlying!344 thiss!992)))))))

(declare-fun lt!50971 () (_ BitVec 64))

(assert (=> b!100837 (= lt!50971 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!50983 () (_ BitVec 64))

(assert (=> b!100837 (= lt!50983 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!100837 (= lt!50982 (addApplyDifferent!70 lt!50964 lt!50971 (minValue!2401 (v!2833 (underlying!344 thiss!992))) lt!50983))))

(assert (=> b!100837 (= (apply!94 (+!132 lt!50964 (tuple2!2317 lt!50971 (minValue!2401 (v!2833 (underlying!344 thiss!992))))) lt!50983) (apply!94 lt!50964 lt!50983))))

(declare-fun bm!10366 () Bool)

(assert (=> bm!10366 (= call!10364 (contains!796 lt!50965 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!100838 () Bool)

(assert (=> b!100838 (= e!65673 (validKeyInArray!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!100839 () Bool)

(assert (=> b!100839 (= e!65666 e!65661)))

(declare-fun res!50546 () Bool)

(assert (=> b!100839 (= res!50546 call!10365)))

(assert (=> b!100839 (=> (not res!50546) (not e!65661))))

(assert (= (and d!27367 c!17309) b!100829))

(assert (= (and d!27367 (not c!17309)) b!100833))

(assert (= (and b!100833 c!17308) b!100835))

(assert (= (and b!100833 (not c!17308)) b!100820))

(assert (= (and b!100820 c!17307) b!100819))

(assert (= (and b!100820 (not c!17307)) b!100825))

(assert (= (or b!100819 b!100825) bm!10365))

(assert (= (or b!100835 bm!10365) bm!10360))

(assert (= (or b!100835 b!100819) bm!10361))

(assert (= (or b!100829 bm!10360) bm!10363))

(assert (= (or b!100829 bm!10361) bm!10362))

(assert (= (and d!27367 res!50545) b!100838))

(assert (= (and d!27367 c!17306) b!100837))

(assert (= (and d!27367 (not c!17306)) b!100821))

(assert (= (and d!27367 res!50551) b!100831))

(assert (= (and b!100831 res!50547) b!100827))

(assert (= (and b!100831 (not res!50550)) b!100832))

(assert (= (and b!100832 res!50553) b!100828))

(assert (= (and b!100831 res!50549) b!100822))

(assert (= (and b!100822 c!17304) b!100824))

(assert (= (and b!100822 (not c!17304)) b!100830))

(assert (= (and b!100824 res!50548) b!100836))

(assert (= (or b!100824 b!100830) bm!10366))

(assert (= (and b!100822 res!50552) b!100826))

(assert (= (and b!100826 c!17305) b!100839))

(assert (= (and b!100826 (not c!17305)) b!100823))

(assert (= (and b!100839 res!50546) b!100834))

(assert (= (or b!100839 b!100823) bm!10364))

(declare-fun b_lambda!4521 () Bool)

(assert (=> (not b_lambda!4521) (not b!100828)))

(assert (=> b!100828 t!5554))

(declare-fun b_and!6213 () Bool)

(assert (= b_and!6193 (and (=> t!5554 result!3307) b_and!6213)))

(assert (=> b!100828 t!5556))

(declare-fun b_and!6215 () Bool)

(assert (= b_and!6195 (and (=> t!5556 result!3311) b_and!6215)))

(declare-fun m!111571 () Bool)

(assert (=> bm!10366 m!111571))

(declare-fun m!111573 () Bool)

(assert (=> b!100834 m!111573))

(declare-fun m!111575 () Bool)

(assert (=> bm!10363 m!111575))

(declare-fun m!111577 () Bool)

(assert (=> b!100829 m!111577))

(declare-fun m!111579 () Bool)

(assert (=> bm!10362 m!111579))

(declare-fun m!111581 () Bool)

(assert (=> b!100837 m!111581))

(declare-fun m!111583 () Bool)

(assert (=> b!100837 m!111583))

(declare-fun m!111585 () Bool)

(assert (=> b!100837 m!111585))

(declare-fun m!111587 () Bool)

(assert (=> b!100837 m!111587))

(assert (=> b!100837 m!111575))

(declare-fun m!111589 () Bool)

(assert (=> b!100837 m!111589))

(assert (=> b!100837 m!111557))

(declare-fun m!111591 () Bool)

(assert (=> b!100837 m!111591))

(declare-fun m!111593 () Bool)

(assert (=> b!100837 m!111593))

(declare-fun m!111595 () Bool)

(assert (=> b!100837 m!111595))

(assert (=> b!100837 m!111595))

(declare-fun m!111597 () Bool)

(assert (=> b!100837 m!111597))

(declare-fun m!111599 () Bool)

(assert (=> b!100837 m!111599))

(declare-fun m!111601 () Bool)

(assert (=> b!100837 m!111601))

(declare-fun m!111603 () Bool)

(assert (=> b!100837 m!111603))

(assert (=> b!100837 m!111601))

(declare-fun m!111605 () Bool)

(assert (=> b!100837 m!111605))

(declare-fun m!111607 () Bool)

(assert (=> b!100837 m!111607))

(assert (=> b!100837 m!111581))

(assert (=> b!100837 m!111607))

(declare-fun m!111609 () Bool)

(assert (=> b!100837 m!111609))

(assert (=> b!100827 m!111557))

(assert (=> b!100827 m!111557))

(declare-fun m!111611 () Bool)

(assert (=> b!100827 m!111611))

(assert (=> b!100838 m!111557))

(assert (=> b!100838 m!111557))

(assert (=> b!100838 m!111611))

(declare-fun m!111613 () Bool)

(assert (=> b!100836 m!111613))

(assert (=> d!27367 m!111405))

(assert (=> b!100828 m!111557))

(declare-fun m!111615 () Bool)

(assert (=> b!100828 m!111615))

(assert (=> b!100828 m!111557))

(assert (=> b!100828 m!111395))

(declare-fun m!111617 () Bool)

(assert (=> b!100828 m!111617))

(assert (=> b!100828 m!111395))

(declare-fun m!111619 () Bool)

(assert (=> b!100828 m!111619))

(assert (=> b!100828 m!111617))

(declare-fun m!111621 () Bool)

(assert (=> bm!10364 m!111621))

(assert (=> b!100832 m!111557))

(assert (=> b!100832 m!111557))

(declare-fun m!111623 () Bool)

(assert (=> b!100832 m!111623))

(assert (=> b!100591 d!27367))

(declare-fun d!27369 () Bool)

(declare-fun e!65679 () Bool)

(assert (=> d!27369 e!65679))

(declare-fun res!50556 () Bool)

(assert (=> d!27369 (=> res!50556 e!65679)))

(declare-fun lt!50995 () Bool)

(assert (=> d!27369 (= res!50556 (not lt!50995))))

(declare-fun lt!50997 () Bool)

(assert (=> d!27369 (= lt!50995 lt!50997)))

(declare-fun lt!50994 () Unit!3048)

(declare-fun e!65678 () Unit!3048)

(assert (=> d!27369 (= lt!50994 e!65678)))

(declare-fun c!17312 () Bool)

(assert (=> d!27369 (= c!17312 lt!50997)))

(declare-fun containsKey!156 (List!1571 (_ BitVec 64)) Bool)

(assert (=> d!27369 (= lt!50997 (containsKey!156 (toList!769 lt!50857) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(assert (=> d!27369 (= (contains!796 lt!50857 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)) lt!50995)))

(declare-fun b!100846 () Bool)

(declare-fun lt!50996 () Unit!3048)

(assert (=> b!100846 (= e!65678 lt!50996)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!104 (List!1571 (_ BitVec 64)) Unit!3048)

(assert (=> b!100846 (= lt!50996 (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!769 lt!50857) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(declare-datatypes ((Option!159 0))(
  ( (Some!158 (v!2839 V!3169)) (None!157) )
))
(declare-fun isDefined!105 (Option!159) Bool)

(declare-fun getValueByKey!153 (List!1571 (_ BitVec 64)) Option!159)

(assert (=> b!100846 (isDefined!105 (getValueByKey!153 (toList!769 lt!50857) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(declare-fun b!100847 () Bool)

(declare-fun Unit!3060 () Unit!3048)

(assert (=> b!100847 (= e!65678 Unit!3060)))

(declare-fun b!100848 () Bool)

(assert (=> b!100848 (= e!65679 (isDefined!105 (getValueByKey!153 (toList!769 lt!50857) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355))))))

(assert (= (and d!27369 c!17312) b!100846))

(assert (= (and d!27369 (not c!17312)) b!100847))

(assert (= (and d!27369 (not res!50556)) b!100848))

(assert (=> d!27369 m!111399))

(declare-fun m!111625 () Bool)

(assert (=> d!27369 m!111625))

(assert (=> b!100846 m!111399))

(declare-fun m!111627 () Bool)

(assert (=> b!100846 m!111627))

(assert (=> b!100846 m!111399))

(declare-fun m!111629 () Bool)

(assert (=> b!100846 m!111629))

(assert (=> b!100846 m!111629))

(declare-fun m!111631 () Bool)

(assert (=> b!100846 m!111631))

(assert (=> b!100848 m!111399))

(assert (=> b!100848 m!111629))

(assert (=> b!100848 m!111629))

(assert (=> b!100848 m!111631))

(assert (=> b!100583 d!27369))

(declare-fun b!100929 () Bool)

(declare-fun e!65732 () tuple2!2314)

(declare-fun e!65722 () tuple2!2314)

(assert (=> b!100929 (= e!65732 e!65722)))

(declare-fun c!17350 () Bool)

(declare-fun lt!51057 () SeekEntryResult!249)

(assert (=> b!100929 (= c!17350 ((_ is MissingZero!249) lt!51057))))

(declare-fun b!100930 () Bool)

(declare-fun e!65729 () Bool)

(declare-fun call!10432 () Bool)

(assert (=> b!100930 (= e!65729 (not call!10432))))

(declare-fun d!27371 () Bool)

(declare-fun e!65726 () Bool)

(assert (=> d!27371 e!65726))

(declare-fun res!50588 () Bool)

(assert (=> d!27371 (=> (not res!50588) (not e!65726))))

(declare-fun lt!51064 () tuple2!2314)

(assert (=> d!27371 (= res!50588 (valid!399 (_2!1168 lt!51064)))))

(declare-fun e!65734 () tuple2!2314)

(assert (=> d!27371 (= lt!51064 e!65734)))

(declare-fun c!17347 () Bool)

(assert (=> d!27371 (= c!17347 (= (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (bvneg (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355))))))

(assert (=> d!27371 (valid!399 newMap!16)))

(assert (=> d!27371 (= (update!149 newMap!16 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!51064)))

(declare-fun b!100931 () Bool)

(declare-fun e!65723 () Unit!3048)

(declare-fun Unit!3061 () Unit!3048)

(assert (=> b!100931 (= e!65723 Unit!3061)))

(declare-fun lt!51078 () Unit!3048)

(declare-fun call!10440 () Unit!3048)

(assert (=> b!100931 (= lt!51078 call!10440)))

(declare-fun lt!51062 () SeekEntryResult!249)

(declare-fun call!10428 () SeekEntryResult!249)

(assert (=> b!100931 (= lt!51062 call!10428)))

(declare-fun res!50597 () Bool)

(assert (=> b!100931 (= res!50597 ((_ is Found!249) lt!51062))))

(declare-fun e!65742 () Bool)

(assert (=> b!100931 (=> (not res!50597) (not e!65742))))

(assert (=> b!100931 e!65742))

(declare-fun lt!51072 () Unit!3048)

(assert (=> b!100931 (= lt!51072 lt!51078)))

(assert (=> b!100931 false))

(declare-fun b!100932 () Bool)

(declare-fun lt!51053 () Unit!3048)

(declare-fun lt!51069 () Unit!3048)

(assert (=> b!100932 (= lt!51053 lt!51069)))

(declare-fun call!10425 () ListLongMap!1507)

(declare-fun call!10419 () ListLongMap!1507)

(assert (=> b!100932 (= call!10425 call!10419)))

(declare-fun lt!51074 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!43 (array!4251 array!4253 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 V!3169 Int) Unit!3048)

(assert (=> b!100932 (= lt!51069 (lemmaChangeLongMinValueKeyThenAddPairToListMap!43 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) lt!51074 (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2522 newMap!16)))))

(assert (=> b!100932 (= lt!51074 (bvor (extraKeys!2335 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!65738 () tuple2!2314)

(assert (=> b!100932 (= e!65738 (tuple2!2315 true (LongMapFixedSize!863 (defaultEntry!2522 newMap!16) (mask!6639 newMap!16) (bvor (extraKeys!2335 newMap!16) #b00000000000000000000000000000010) (zeroValue!2401 newMap!16) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!480 newMap!16) (_keys!4220 newMap!16) (_values!2505 newMap!16) (_vacant!480 newMap!16))))))

(declare-fun b!100933 () Bool)

(declare-fun e!65736 () ListLongMap!1507)

(declare-fun call!10424 () ListLongMap!1507)

(assert (=> b!100933 (= e!65736 call!10424)))

(declare-fun bm!10415 () Bool)

(declare-fun call!10433 () ListLongMap!1507)

(declare-fun call!10423 () ListLongMap!1507)

(assert (=> bm!10415 (= call!10433 call!10423)))

(declare-fun bm!10416 () Bool)

(declare-fun call!10430 () SeekEntryResult!249)

(declare-fun call!10435 () SeekEntryResult!249)

(assert (=> bm!10416 (= call!10430 call!10435)))

(declare-fun b!100934 () Bool)

(declare-fun res!50586 () Bool)

(assert (=> b!100934 (=> (not res!50586) (not e!65729))))

(declare-fun call!10426 () Bool)

(assert (=> b!100934 (= res!50586 call!10426)))

(declare-fun e!65725 () Bool)

(assert (=> b!100934 (= e!65725 e!65729)))

(declare-fun b!100935 () Bool)

(declare-fun res!50587 () Bool)

(declare-fun e!65731 () Bool)

(assert (=> b!100935 (=> (not res!50587) (not e!65731))))

(declare-fun call!10418 () Bool)

(assert (=> b!100935 (= res!50587 call!10418)))

(declare-fun e!65737 () Bool)

(assert (=> b!100935 (= e!65737 e!65731)))

(declare-fun b!100936 () Bool)

(declare-fun e!65730 () Bool)

(declare-fun lt!51061 () SeekEntryResult!249)

(assert (=> b!100936 (= e!65730 (= (select (arr!2018 (_keys!4220 newMap!16)) (index!3142 lt!51061)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(declare-fun call!10434 () Bool)

(declare-fun bm!10417 () Bool)

(assert (=> bm!10417 (= call!10434 (arrayContainsKey!0 (_keys!4220 newMap!16) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!100937 () Bool)

(assert (=> b!100937 (= e!65742 (= (select (arr!2018 (_keys!4220 newMap!16)) (index!3142 lt!51062)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(declare-fun c!17351 () Bool)

(declare-fun bm!10418 () Bool)

(assert (=> bm!10418 (= call!10424 (getCurrentListMap!457 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (ite c!17347 (ite c!17351 (extraKeys!2335 newMap!16) lt!51074) (extraKeys!2335 newMap!16)) (zeroValue!2401 newMap!16) (ite c!17347 (ite c!17351 (minValue!2401 newMap!16) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun b!100938 () Bool)

(declare-fun res!50589 () Bool)

(declare-fun call!10429 () Bool)

(assert (=> b!100938 (= res!50589 call!10429)))

(assert (=> b!100938 (=> (not res!50589) (not e!65730))))

(declare-fun bm!10419 () Bool)

(declare-fun call!10438 () Bool)

(assert (=> bm!10419 (= call!10426 call!10438)))

(declare-fun b!100939 () Bool)

(declare-fun e!65741 () Bool)

(declare-fun call!10421 () ListLongMap!1507)

(declare-fun call!10427 () ListLongMap!1507)

(assert (=> b!100939 (= e!65741 (= call!10421 call!10427))))

(declare-fun call!10437 () Unit!3048)

(declare-fun bm!10420 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!43 (array!4251 array!4253 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 64) Int) Unit!3048)

(assert (=> bm!10420 (= call!10437 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!43 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (defaultEntry!2522 newMap!16)))))

(declare-fun bm!10421 () Bool)

(assert (=> bm!10421 (= call!10435 (seekEntryOrOpen!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (_keys!4220 newMap!16) (mask!6639 newMap!16)))))

(declare-fun b!100940 () Bool)

(declare-fun lt!51068 () Unit!3048)

(declare-fun lt!51056 () Unit!3048)

(assert (=> b!100940 (= lt!51068 lt!51056)))

(declare-fun call!10420 () ListLongMap!1507)

(assert (=> b!100940 (contains!796 call!10420 (select (arr!2018 (_keys!4220 newMap!16)) (index!3142 lt!51057)))))

(declare-fun lt!51075 () array!4253)

(declare-fun lemmaValidKeyInArrayIsInListMap!103 (array!4251 array!4253 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 32) Int) Unit!3048)

(assert (=> b!100940 (= lt!51056 (lemmaValidKeyInArrayIsInListMap!103 (_keys!4220 newMap!16) lt!51075 (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (index!3142 lt!51057) (defaultEntry!2522 newMap!16)))))

(assert (=> b!100940 (= lt!51075 (array!4254 (store (arr!2019 (_values!2505 newMap!16)) (index!3142 lt!51057) (ValueCellFull!977 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2271 (_values!2505 newMap!16))))))

(declare-fun lt!51077 () Unit!3048)

(declare-fun lt!51066 () Unit!3048)

(assert (=> b!100940 (= lt!51077 lt!51066)))

(declare-fun call!10431 () ListLongMap!1507)

(assert (=> b!100940 (= call!10431 (getCurrentListMap!457 (_keys!4220 newMap!16) (array!4254 (store (arr!2019 (_values!2505 newMap!16)) (index!3142 lt!51057) (ValueCellFull!977 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2271 (_values!2505 newMap!16))) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!43 (array!4251 array!4253 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 32) (_ BitVec 64) V!3169 Int) Unit!3048)

(assert (=> b!100940 (= lt!51066 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!43 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (index!3142 lt!51057) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51063 () Unit!3048)

(declare-fun e!65727 () Unit!3048)

(assert (=> b!100940 (= lt!51063 e!65727)))

(declare-fun c!17343 () Bool)

(declare-fun call!10441 () Bool)

(assert (=> b!100940 (= c!17343 call!10441)))

(assert (=> b!100940 (= e!65722 (tuple2!2315 true (LongMapFixedSize!863 (defaultEntry!2522 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (_size!480 newMap!16) (_keys!4220 newMap!16) (array!4254 (store (arr!2019 (_values!2505 newMap!16)) (index!3142 lt!51057) (ValueCellFull!977 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2271 (_values!2505 newMap!16))) (_vacant!480 newMap!16))))))

(declare-fun c!17348 () Bool)

(declare-fun bm!10422 () Bool)

(assert (=> bm!10422 (= call!10421 (map!1259 (ite c!17348 newMap!16 (_2!1168 lt!51064))))))

(declare-fun b!100941 () Bool)

(declare-fun res!50585 () Bool)

(assert (=> b!100941 (=> (not res!50585) (not e!65729))))

(declare-fun lt!51070 () SeekEntryResult!249)

(assert (=> b!100941 (= res!50585 (= (select (arr!2018 (_keys!4220 newMap!16)) (index!3141 lt!51070)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!10423 () Bool)

(assert (=> bm!10423 (= call!10431 (+!132 (ite c!17347 (ite c!17351 call!10419 call!10433) call!10424) (ite c!17347 (ite c!17351 (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!10424 () Bool)

(assert (=> bm!10424 (= call!10427 (map!1259 (ite c!17348 (_2!1168 lt!51064) newMap!16)))))

(declare-fun bm!10425 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!43 (array!4251 array!4253 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 64) Int) Unit!3048)

(assert (=> bm!10425 (= call!10440 (lemmaInListMapThenSeekEntryOrOpenFindsIt!43 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (defaultEntry!2522 newMap!16)))))

(declare-fun b!100942 () Bool)

(declare-fun c!17341 () Bool)

(assert (=> b!100942 (= c!17341 ((_ is MissingVacant!249) lt!51057))))

(declare-fun e!65728 () tuple2!2314)

(assert (=> b!100942 (= e!65728 e!65732)))

(declare-fun bm!10426 () Bool)

(declare-fun c!17339 () Bool)

(declare-fun c!17340 () Bool)

(assert (=> bm!10426 (= c!17339 c!17340)))

(assert (=> bm!10426 (= call!10441 (contains!796 e!65736 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(declare-fun b!100943 () Bool)

(declare-fun e!65735 () Bool)

(assert (=> b!100943 (= e!65735 ((_ is Undefined!249) lt!51070))))

(declare-fun b!100944 () Bool)

(assert (=> b!100944 (= e!65734 e!65728)))

(assert (=> b!100944 (= lt!51057 (seekEntryOrOpen!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (_keys!4220 newMap!16) (mask!6639 newMap!16)))))

(assert (=> b!100944 (= c!17340 ((_ is Undefined!249) lt!51057))))

(declare-fun b!100945 () Bool)

(assert (=> b!100945 (= e!65726 e!65741)))

(assert (=> b!100945 (= c!17348 (_1!1168 lt!51064))))

(declare-fun b!100946 () Bool)

(declare-fun call!10439 () Bool)

(assert (=> b!100946 (= e!65731 (not call!10439))))

(declare-fun b!100947 () Bool)

(declare-fun res!50592 () Bool)

(assert (=> b!100947 (= res!50592 call!10438)))

(assert (=> b!100947 (=> (not res!50592) (not e!65742))))

(declare-fun b!100948 () Bool)

(declare-fun lt!51052 () Unit!3048)

(assert (=> b!100948 (= lt!51052 e!65723)))

(declare-fun c!17344 () Bool)

(assert (=> b!100948 (= c!17344 call!10441)))

(assert (=> b!100948 (= e!65728 (tuple2!2315 false newMap!16))))

(declare-fun bm!10427 () Bool)

(assert (=> bm!10427 (= call!10425 call!10431)))

(declare-fun c!17346 () Bool)

(declare-fun call!10436 () Bool)

(declare-fun bm!10428 () Bool)

(declare-fun c!17345 () Bool)

(declare-fun lt!51060 () SeekEntryResult!249)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!10428 (= call!10436 (inRange!0 (ite c!17340 (ite c!17344 (index!3142 lt!51062) (ite c!17345 (index!3141 lt!51070) (index!3144 lt!51070))) (ite c!17343 (index!3142 lt!51061) (ite c!17346 (index!3141 lt!51060) (index!3144 lt!51060)))) (mask!6639 newMap!16)))))

(declare-fun bm!10429 () Bool)

(assert (=> bm!10429 (= call!10438 call!10436)))

(declare-fun b!100949 () Bool)

(declare-fun e!65724 () Bool)

(assert (=> b!100949 (= e!65735 e!65724)))

(declare-fun res!50591 () Bool)

(assert (=> b!100949 (= res!50591 call!10426)))

(assert (=> b!100949 (=> (not res!50591) (not e!65724))))

(declare-fun b!100950 () Bool)

(assert (=> b!100950 (= e!65724 (not call!10432))))

(declare-fun b!100951 () Bool)

(declare-fun e!65740 () Bool)

(assert (=> b!100951 (= e!65741 e!65740)))

(declare-fun res!50598 () Bool)

(assert (=> b!100951 (= res!50598 (contains!796 call!10427 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(assert (=> b!100951 (=> (not res!50598) (not e!65740))))

(declare-fun bm!10430 () Bool)

(assert (=> bm!10430 (= call!10418 call!10429)))

(declare-fun b!100952 () Bool)

(declare-fun e!65733 () Bool)

(assert (=> b!100952 (= e!65733 ((_ is Undefined!249) lt!51060))))

(declare-fun bm!10431 () Bool)

(assert (=> bm!10431 (= call!10420 call!10423)))

(declare-fun b!100953 () Bool)

(declare-fun lt!51067 () tuple2!2314)

(assert (=> b!100953 (= e!65732 (tuple2!2315 (_1!1168 lt!51067) (_2!1168 lt!51067)))))

(declare-fun call!10422 () tuple2!2314)

(assert (=> b!100953 (= lt!51067 call!10422)))

(declare-fun bm!10432 () Bool)

(declare-fun lt!51065 () (_ BitVec 32))

(assert (=> bm!10432 (= call!10423 (getCurrentListMap!457 (_keys!4220 newMap!16) (ite (or c!17347 c!17340) (_values!2505 newMap!16) lt!51075) (mask!6639 newMap!16) (ite (and c!17347 c!17351) lt!51065 (extraKeys!2335 newMap!16)) (ite (and c!17347 c!17351) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16)) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun b!100954 () Bool)

(declare-fun res!50595 () Bool)

(assert (=> b!100954 (= res!50595 (= (select (arr!2018 (_keys!4220 newMap!16)) (index!3144 lt!51060)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!65739 () Bool)

(assert (=> b!100954 (=> (not res!50595) (not e!65739))))

(declare-fun b!100955 () Bool)

(declare-fun res!50590 () Bool)

(assert (=> b!100955 (=> (not res!50590) (not e!65731))))

(assert (=> b!100955 (= res!50590 (= (select (arr!2018 (_keys!4220 newMap!16)) (index!3141 lt!51060)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!10433 () Bool)

(assert (=> bm!10433 (= call!10432 call!10434)))

(declare-fun bm!10434 () Bool)

(assert (=> bm!10434 (= call!10429 call!10436)))

(declare-fun b!100956 () Bool)

(declare-fun res!50596 () Bool)

(assert (=> b!100956 (= res!50596 (= (select (arr!2018 (_keys!4220 newMap!16)) (index!3144 lt!51070)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!100956 (=> (not res!50596) (not e!65724))))

(declare-fun b!100957 () Bool)

(declare-fun lt!51071 () tuple2!2314)

(assert (=> b!100957 (= lt!51071 call!10422)))

(assert (=> b!100957 (= e!65722 (tuple2!2315 (_1!1168 lt!51071) (_2!1168 lt!51071)))))

(declare-fun b!100958 () Bool)

(declare-fun lt!51055 () Unit!3048)

(declare-fun lt!51054 () Unit!3048)

(assert (=> b!100958 (= lt!51055 lt!51054)))

(assert (=> b!100958 (= call!10425 call!10433)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!43 (array!4251 array!4253 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 V!3169 Int) Unit!3048)

(assert (=> b!100958 (= lt!51054 (lemmaChangeZeroKeyThenAddPairToListMap!43 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) lt!51065 (zeroValue!2401 newMap!16) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2401 newMap!16) (defaultEntry!2522 newMap!16)))))

(assert (=> b!100958 (= lt!51065 (bvor (extraKeys!2335 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!100958 (= e!65738 (tuple2!2315 true (LongMapFixedSize!863 (defaultEntry!2522 newMap!16) (mask!6639 newMap!16) (bvor (extraKeys!2335 newMap!16) #b00000000000000000000000000000001) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2401 newMap!16) (_size!480 newMap!16) (_keys!4220 newMap!16) (_values!2505 newMap!16) (_vacant!480 newMap!16))))))

(declare-fun b!100959 () Bool)

(declare-fun Unit!3062 () Unit!3048)

(assert (=> b!100959 (= e!65727 Unit!3062)))

(declare-fun lt!51073 () Unit!3048)

(assert (=> b!100959 (= lt!51073 call!10437)))

(assert (=> b!100959 (= lt!51060 call!10430)))

(assert (=> b!100959 (= c!17346 ((_ is MissingZero!249) lt!51060))))

(assert (=> b!100959 e!65737))

(declare-fun lt!51076 () Unit!3048)

(assert (=> b!100959 (= lt!51076 lt!51073)))

(assert (=> b!100959 false))

(declare-fun b!100960 () Bool)

(declare-fun c!17349 () Bool)

(assert (=> b!100960 (= c!17349 ((_ is MissingVacant!249) lt!51060))))

(assert (=> b!100960 (= e!65737 e!65733)))

(declare-fun b!100961 () Bool)

(assert (=> b!100961 (= e!65736 call!10420)))

(declare-fun bm!10435 () Bool)

(declare-fun updateHelperNewKey!43 (LongMapFixedSize!862 (_ BitVec 64) V!3169 (_ BitVec 32)) tuple2!2314)

(assert (=> bm!10435 (= call!10422 (updateHelperNewKey!43 newMap!16 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!17341 (index!3144 lt!51057) (index!3141 lt!51057))))))

(declare-fun bm!10436 () Bool)

(assert (=> bm!10436 (= call!10428 call!10435)))

(declare-fun b!100962 () Bool)

(assert (=> b!100962 (= e!65733 e!65739)))

(declare-fun res!50593 () Bool)

(assert (=> b!100962 (= res!50593 call!10418)))

(assert (=> b!100962 (=> (not res!50593) (not e!65739))))

(declare-fun b!100963 () Bool)

(declare-fun lt!51059 () Unit!3048)

(assert (=> b!100963 (= e!65727 lt!51059)))

(assert (=> b!100963 (= lt!51059 call!10440)))

(assert (=> b!100963 (= lt!51061 call!10430)))

(declare-fun res!50594 () Bool)

(assert (=> b!100963 (= res!50594 ((_ is Found!249) lt!51061))))

(assert (=> b!100963 (=> (not res!50594) (not e!65730))))

(assert (=> b!100963 e!65730))

(declare-fun bm!10437 () Bool)

(assert (=> bm!10437 (= call!10419 call!10424)))

(declare-fun bm!10438 () Bool)

(assert (=> bm!10438 (= call!10439 call!10434)))

(declare-fun b!100964 () Bool)

(assert (=> b!100964 (= e!65739 (not call!10439))))

(declare-fun b!100965 () Bool)

(assert (=> b!100965 (= e!65740 (= call!10427 (+!132 call!10421 (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!100966 () Bool)

(declare-fun c!17342 () Bool)

(assert (=> b!100966 (= c!17342 ((_ is MissingVacant!249) lt!51070))))

(assert (=> b!100966 (= e!65725 e!65735)))

(declare-fun b!100967 () Bool)

(assert (=> b!100967 (= e!65734 e!65738)))

(assert (=> b!100967 (= c!17351 (= (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!100968 () Bool)

(declare-fun lt!51058 () Unit!3048)

(assert (=> b!100968 (= e!65723 lt!51058)))

(assert (=> b!100968 (= lt!51058 call!10437)))

(assert (=> b!100968 (= lt!51070 call!10428)))

(assert (=> b!100968 (= c!17345 ((_ is MissingZero!249) lt!51070))))

(assert (=> b!100968 e!65725))

(assert (= (and d!27371 c!17347) b!100967))

(assert (= (and d!27371 (not c!17347)) b!100944))

(assert (= (and b!100967 c!17351) b!100958))

(assert (= (and b!100967 (not c!17351)) b!100932))

(assert (= (or b!100958 b!100932) bm!10437))

(assert (= (or b!100958 b!100932) bm!10415))

(assert (= (or b!100958 b!100932) bm!10427))

(assert (= (and b!100944 c!17340) b!100948))

(assert (= (and b!100944 (not c!17340)) b!100942))

(assert (= (and b!100948 c!17344) b!100931))

(assert (= (and b!100948 (not c!17344)) b!100968))

(assert (= (and b!100931 res!50597) b!100947))

(assert (= (and b!100947 res!50592) b!100937))

(assert (= (and b!100968 c!17345) b!100934))

(assert (= (and b!100968 (not c!17345)) b!100966))

(assert (= (and b!100934 res!50586) b!100941))

(assert (= (and b!100941 res!50585) b!100930))

(assert (= (and b!100966 c!17342) b!100949))

(assert (= (and b!100966 (not c!17342)) b!100943))

(assert (= (and b!100949 res!50591) b!100956))

(assert (= (and b!100956 res!50596) b!100950))

(assert (= (or b!100934 b!100949) bm!10419))

(assert (= (or b!100930 b!100950) bm!10433))

(assert (= (or b!100947 bm!10419) bm!10429))

(assert (= (or b!100931 b!100968) bm!10436))

(assert (= (and b!100942 c!17341) b!100953))

(assert (= (and b!100942 (not c!17341)) b!100929))

(assert (= (and b!100929 c!17350) b!100957))

(assert (= (and b!100929 (not c!17350)) b!100940))

(assert (= (and b!100940 c!17343) b!100963))

(assert (= (and b!100940 (not c!17343)) b!100959))

(assert (= (and b!100963 res!50594) b!100938))

(assert (= (and b!100938 res!50589) b!100936))

(assert (= (and b!100959 c!17346) b!100935))

(assert (= (and b!100959 (not c!17346)) b!100960))

(assert (= (and b!100935 res!50587) b!100955))

(assert (= (and b!100955 res!50590) b!100946))

(assert (= (and b!100960 c!17349) b!100962))

(assert (= (and b!100960 (not c!17349)) b!100952))

(assert (= (and b!100962 res!50593) b!100954))

(assert (= (and b!100954 res!50595) b!100964))

(assert (= (or b!100935 b!100962) bm!10430))

(assert (= (or b!100946 b!100964) bm!10438))

(assert (= (or b!100938 bm!10430) bm!10434))

(assert (= (or b!100963 b!100959) bm!10416))

(assert (= (or b!100953 b!100957) bm!10435))

(assert (= (or bm!10429 bm!10434) bm!10428))

(assert (= (or b!100948 b!100940) bm!10431))

(assert (= (or bm!10436 bm!10416) bm!10421))

(assert (= (or b!100968 b!100959) bm!10420))

(assert (= (or b!100931 b!100963) bm!10425))

(assert (= (or bm!10433 bm!10438) bm!10417))

(assert (= (or b!100948 b!100940) bm!10426))

(assert (= (and bm!10426 c!17339) b!100961))

(assert (= (and bm!10426 (not c!17339)) b!100933))

(assert (= (or bm!10415 bm!10431) bm!10432))

(assert (= (or bm!10437 b!100933 b!100940) bm!10418))

(assert (= (or bm!10427 b!100940) bm!10423))

(assert (= (and d!27371 res!50588) b!100945))

(assert (= (and b!100945 c!17348) b!100951))

(assert (= (and b!100945 (not c!17348)) b!100939))

(assert (= (and b!100951 res!50598) b!100965))

(assert (= (or b!100965 b!100939) bm!10422))

(assert (= (or b!100951 b!100965 b!100939) bm!10424))

(declare-fun m!111633 () Bool)

(assert (=> d!27371 m!111633))

(assert (=> d!27371 m!111437))

(assert (=> bm!10417 m!111399))

(declare-fun m!111635 () Bool)

(assert (=> bm!10417 m!111635))

(declare-fun m!111637 () Bool)

(assert (=> b!100955 m!111637))

(declare-fun m!111639 () Bool)

(assert (=> b!100956 m!111639))

(assert (=> b!100958 m!111397))

(declare-fun m!111641 () Bool)

(assert (=> b!100958 m!111641))

(declare-fun m!111643 () Bool)

(assert (=> b!100937 m!111643))

(declare-fun m!111645 () Bool)

(assert (=> bm!10418 m!111645))

(assert (=> b!100944 m!111399))

(declare-fun m!111647 () Bool)

(assert (=> b!100944 m!111647))

(declare-fun m!111649 () Bool)

(assert (=> bm!10428 m!111649))

(assert (=> bm!10426 m!111399))

(declare-fun m!111651 () Bool)

(assert (=> bm!10426 m!111651))

(declare-fun m!111653 () Bool)

(assert (=> b!100941 m!111653))

(declare-fun m!111655 () Bool)

(assert (=> bm!10424 m!111655))

(declare-fun m!111657 () Bool)

(assert (=> b!100936 m!111657))

(assert (=> b!100932 m!111397))

(declare-fun m!111659 () Bool)

(assert (=> b!100932 m!111659))

(declare-fun m!111661 () Bool)

(assert (=> bm!10423 m!111661))

(assert (=> bm!10435 m!111399))

(assert (=> bm!10435 m!111397))

(declare-fun m!111663 () Bool)

(assert (=> bm!10435 m!111663))

(assert (=> bm!10421 m!111399))

(assert (=> bm!10421 m!111647))

(declare-fun m!111665 () Bool)

(assert (=> bm!10422 m!111665))

(declare-fun m!111667 () Bool)

(assert (=> b!100954 m!111667))

(assert (=> bm!10425 m!111399))

(declare-fun m!111669 () Bool)

(assert (=> bm!10425 m!111669))

(declare-fun m!111671 () Bool)

(assert (=> b!100940 m!111671))

(declare-fun m!111673 () Bool)

(assert (=> b!100940 m!111673))

(assert (=> b!100940 m!111399))

(assert (=> b!100940 m!111397))

(declare-fun m!111675 () Bool)

(assert (=> b!100940 m!111675))

(declare-fun m!111677 () Bool)

(assert (=> b!100940 m!111677))

(declare-fun m!111679 () Bool)

(assert (=> b!100940 m!111679))

(declare-fun m!111681 () Bool)

(assert (=> b!100940 m!111681))

(assert (=> b!100940 m!111671))

(assert (=> b!100951 m!111399))

(declare-fun m!111683 () Bool)

(assert (=> b!100951 m!111683))

(declare-fun m!111685 () Bool)

(assert (=> bm!10432 m!111685))

(declare-fun m!111687 () Bool)

(assert (=> b!100965 m!111687))

(assert (=> bm!10420 m!111399))

(declare-fun m!111689 () Bool)

(assert (=> bm!10420 m!111689))

(assert (=> b!100583 d!27371))

(declare-fun d!27373 () Bool)

(declare-fun c!17354 () Bool)

(assert (=> d!27373 (= c!17354 ((_ is ValueCellFull!977) (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(declare-fun e!65745 () V!3169)

(assert (=> d!27373 (= (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!65745)))

(declare-fun b!100973 () Bool)

(declare-fun get!1304 (ValueCell!977 V!3169) V!3169)

(assert (=> b!100973 (= e!65745 (get!1304 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!100974 () Bool)

(declare-fun get!1305 (ValueCell!977 V!3169) V!3169)

(assert (=> b!100974 (= e!65745 (get!1305 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27373 c!17354) b!100973))

(assert (= (and d!27373 (not c!17354)) b!100974))

(assert (=> b!100973 m!111393))

(assert (=> b!100973 m!111395))

(declare-fun m!111691 () Bool)

(assert (=> b!100973 m!111691))

(assert (=> b!100974 m!111393))

(assert (=> b!100974 m!111395))

(declare-fun m!111693 () Bool)

(assert (=> b!100974 m!111693))

(assert (=> b!100583 d!27373))

(declare-fun condMapEmpty!3807 () Bool)

(declare-fun mapDefault!3807 () ValueCell!977)

(assert (=> mapNonEmpty!3791 (= condMapEmpty!3807 (= mapRest!3792 ((as const (Array (_ BitVec 32) ValueCell!977)) mapDefault!3807)))))

(declare-fun e!65750 () Bool)

(declare-fun mapRes!3807 () Bool)

(assert (=> mapNonEmpty!3791 (= tp!9647 (and e!65750 mapRes!3807))))

(declare-fun b!100982 () Bool)

(assert (=> b!100982 (= e!65750 tp_is_empty!2641)))

(declare-fun b!100981 () Bool)

(declare-fun e!65751 () Bool)

(assert (=> b!100981 (= e!65751 tp_is_empty!2641)))

(declare-fun mapNonEmpty!3807 () Bool)

(declare-fun tp!9675 () Bool)

(assert (=> mapNonEmpty!3807 (= mapRes!3807 (and tp!9675 e!65751))))

(declare-fun mapValue!3807 () ValueCell!977)

(declare-fun mapKey!3807 () (_ BitVec 32))

(declare-fun mapRest!3807 () (Array (_ BitVec 32) ValueCell!977))

(assert (=> mapNonEmpty!3807 (= mapRest!3792 (store mapRest!3807 mapKey!3807 mapValue!3807))))

(declare-fun mapIsEmpty!3807 () Bool)

(assert (=> mapIsEmpty!3807 mapRes!3807))

(assert (= (and mapNonEmpty!3791 condMapEmpty!3807) mapIsEmpty!3807))

(assert (= (and mapNonEmpty!3791 (not condMapEmpty!3807)) mapNonEmpty!3807))

(assert (= (and mapNonEmpty!3807 ((_ is ValueCellFull!977) mapValue!3807)) b!100981))

(assert (= (and mapNonEmpty!3791 ((_ is ValueCellFull!977) mapDefault!3807)) b!100982))

(declare-fun m!111695 () Bool)

(assert (=> mapNonEmpty!3807 m!111695))

(declare-fun condMapEmpty!3808 () Bool)

(declare-fun mapDefault!3808 () ValueCell!977)

(assert (=> mapNonEmpty!3792 (= condMapEmpty!3808 (= mapRest!3791 ((as const (Array (_ BitVec 32) ValueCell!977)) mapDefault!3808)))))

(declare-fun e!65752 () Bool)

(declare-fun mapRes!3808 () Bool)

(assert (=> mapNonEmpty!3792 (= tp!9646 (and e!65752 mapRes!3808))))

(declare-fun b!100984 () Bool)

(assert (=> b!100984 (= e!65752 tp_is_empty!2641)))

(declare-fun b!100983 () Bool)

(declare-fun e!65753 () Bool)

(assert (=> b!100983 (= e!65753 tp_is_empty!2641)))

(declare-fun mapNonEmpty!3808 () Bool)

(declare-fun tp!9676 () Bool)

(assert (=> mapNonEmpty!3808 (= mapRes!3808 (and tp!9676 e!65753))))

(declare-fun mapValue!3808 () ValueCell!977)

(declare-fun mapKey!3808 () (_ BitVec 32))

(declare-fun mapRest!3808 () (Array (_ BitVec 32) ValueCell!977))

(assert (=> mapNonEmpty!3808 (= mapRest!3791 (store mapRest!3808 mapKey!3808 mapValue!3808))))

(declare-fun mapIsEmpty!3808 () Bool)

(assert (=> mapIsEmpty!3808 mapRes!3808))

(assert (= (and mapNonEmpty!3792 condMapEmpty!3808) mapIsEmpty!3808))

(assert (= (and mapNonEmpty!3792 (not condMapEmpty!3808)) mapNonEmpty!3808))

(assert (= (and mapNonEmpty!3808 ((_ is ValueCellFull!977) mapValue!3808)) b!100983))

(assert (= (and mapNonEmpty!3792 ((_ is ValueCellFull!977) mapDefault!3808)) b!100984))

(declare-fun m!111697 () Bool)

(assert (=> mapNonEmpty!3808 m!111697))

(declare-fun b_lambda!4523 () Bool)

(assert (= b_lambda!4521 (or (and b!100598 b_free!2449) (and b!100584 b_free!2451 (= (defaultEntry!2522 newMap!16) (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))))) b_lambda!4523)))

(check-sat (not b!100836) (not b!100755) (not bm!10426) (not b!100944) (not bm!10425) (not mapNonEmpty!3807) (not bm!10420) (not b!100951) (not b!100965) (not b!100940) (not bm!10423) (not d!27361) (not bm!10421) (not bm!10424) (not d!27369) (not b!100829) (not d!27355) (not b!100958) (not b!100828) (not bm!10362) (not d!27357) (not bm!10417) (not b!100838) (not b!100932) (not b!100748) (not bm!10422) (not b_next!2449) b_and!6213 (not b!100846) (not bm!10366) (not b!100772) (not bm!10428) (not bm!10364) (not b!100834) (not b!100736) (not bm!10432) (not b!100827) (not b!100760) (not b!100737) (not b!100832) (not b!100974) (not d!27367) (not bm!10342) (not d!27347) (not bm!10435) (not b!100848) (not mapNonEmpty!3808) b_and!6215 (not b!100775) (not b_lambda!4519) (not d!27365) (not bm!10345) (not b!100837) (not b!100776) (not b!100735) tp_is_empty!2641 (not bm!10363) (not b!100746) (not d!27341) (not b!100973) (not bm!10418) (not d!27371) (not b_lambda!4523) (not b_next!2451))
(check-sat b_and!6213 b_and!6215 (not b_next!2449) (not b_next!2451))
(get-model)

(declare-fun d!27375 () Bool)

(declare-fun e!65756 () Bool)

(assert (=> d!27375 e!65756))

(declare-fun res!50603 () Bool)

(assert (=> d!27375 (=> (not res!50603) (not e!65756))))

(declare-fun lt!51084 () SeekEntryResult!249)

(assert (=> d!27375 (= res!50603 ((_ is Found!249) lt!51084))))

(assert (=> d!27375 (= lt!51084 (seekEntryOrOpen!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (_keys!4220 newMap!16) (mask!6639 newMap!16)))))

(declare-fun lt!51083 () Unit!3048)

(declare-fun choose!623 (array!4251 array!4253 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 64) Int) Unit!3048)

(assert (=> d!27375 (= lt!51083 (choose!623 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (defaultEntry!2522 newMap!16)))))

(assert (=> d!27375 (validMask!0 (mask!6639 newMap!16))))

(assert (=> d!27375 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!43 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (defaultEntry!2522 newMap!16)) lt!51083)))

(declare-fun b!100989 () Bool)

(declare-fun res!50604 () Bool)

(assert (=> b!100989 (=> (not res!50604) (not e!65756))))

(assert (=> b!100989 (= res!50604 (inRange!0 (index!3142 lt!51084) (mask!6639 newMap!16)))))

(declare-fun b!100990 () Bool)

(assert (=> b!100990 (= e!65756 (= (select (arr!2018 (_keys!4220 newMap!16)) (index!3142 lt!51084)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(assert (=> b!100990 (and (bvsge (index!3142 lt!51084) #b00000000000000000000000000000000) (bvslt (index!3142 lt!51084) (size!2270 (_keys!4220 newMap!16))))))

(assert (= (and d!27375 res!50603) b!100989))

(assert (= (and b!100989 res!50604) b!100990))

(assert (=> d!27375 m!111399))

(assert (=> d!27375 m!111647))

(assert (=> d!27375 m!111399))

(declare-fun m!111699 () Bool)

(assert (=> d!27375 m!111699))

(declare-fun m!111701 () Bool)

(assert (=> d!27375 m!111701))

(declare-fun m!111703 () Bool)

(assert (=> b!100989 m!111703))

(declare-fun m!111705 () Bool)

(assert (=> b!100990 m!111705))

(assert (=> bm!10425 d!27375))

(declare-fun d!27377 () Bool)

(declare-fun e!65759 () Bool)

(assert (=> d!27377 e!65759))

(declare-fun res!50610 () Bool)

(assert (=> d!27377 (=> (not res!50610) (not e!65759))))

(declare-fun lt!51096 () ListLongMap!1507)

(assert (=> d!27377 (= res!50610 (contains!796 lt!51096 (_1!1169 (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))))))

(declare-fun lt!51095 () List!1571)

(assert (=> d!27377 (= lt!51096 (ListLongMap!1508 lt!51095))))

(declare-fun lt!51094 () Unit!3048)

(declare-fun lt!51093 () Unit!3048)

(assert (=> d!27377 (= lt!51094 lt!51093)))

(assert (=> d!27377 (= (getValueByKey!153 lt!51095 (_1!1169 (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))) (Some!158 (_2!1169 (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!69 (List!1571 (_ BitVec 64) V!3169) Unit!3048)

(assert (=> d!27377 (= lt!51093 (lemmaContainsTupThenGetReturnValue!69 lt!51095 (_1!1169 (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2833 (underlying!344 thiss!992))))) (_2!1169 (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))))))

(declare-fun insertStrictlySorted!72 (List!1571 (_ BitVec 64) V!3169) List!1571)

(assert (=> d!27377 (= lt!51095 (insertStrictlySorted!72 (toList!769 call!10367) (_1!1169 (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2833 (underlying!344 thiss!992))))) (_2!1169 (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))))))

(assert (=> d!27377 (= (+!132 call!10367 (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2833 (underlying!344 thiss!992))))) lt!51096)))

(declare-fun b!100995 () Bool)

(declare-fun res!50609 () Bool)

(assert (=> b!100995 (=> (not res!50609) (not e!65759))))

(assert (=> b!100995 (= res!50609 (= (getValueByKey!153 (toList!769 lt!51096) (_1!1169 (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))) (Some!158 (_2!1169 (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2833 (underlying!344 thiss!992))))))))))

(declare-fun b!100996 () Bool)

(declare-fun contains!799 (List!1571 tuple2!2316) Bool)

(assert (=> b!100996 (= e!65759 (contains!799 (toList!769 lt!51096) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2833 (underlying!344 thiss!992))))))))

(assert (= (and d!27377 res!50610) b!100995))

(assert (= (and b!100995 res!50609) b!100996))

(declare-fun m!111707 () Bool)

(assert (=> d!27377 m!111707))

(declare-fun m!111709 () Bool)

(assert (=> d!27377 m!111709))

(declare-fun m!111711 () Bool)

(assert (=> d!27377 m!111711))

(declare-fun m!111713 () Bool)

(assert (=> d!27377 m!111713))

(declare-fun m!111715 () Bool)

(assert (=> b!100995 m!111715))

(declare-fun m!111717 () Bool)

(assert (=> b!100996 m!111717))

(assert (=> b!100829 d!27377))

(declare-fun d!27379 () Bool)

(assert (=> d!27379 (= (validKeyInArray!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!100827 d!27379))

(declare-fun d!27381 () Bool)

(declare-fun e!65760 () Bool)

(assert (=> d!27381 e!65760))

(declare-fun res!50612 () Bool)

(assert (=> d!27381 (=> (not res!50612) (not e!65760))))

(declare-fun lt!51100 () ListLongMap!1507)

(assert (=> d!27381 (= res!50612 (contains!796 lt!51100 (_1!1169 (ite c!17347 (ite c!17351 (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!51099 () List!1571)

(assert (=> d!27381 (= lt!51100 (ListLongMap!1508 lt!51099))))

(declare-fun lt!51098 () Unit!3048)

(declare-fun lt!51097 () Unit!3048)

(assert (=> d!27381 (= lt!51098 lt!51097)))

(assert (=> d!27381 (= (getValueByKey!153 lt!51099 (_1!1169 (ite c!17347 (ite c!17351 (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!158 (_2!1169 (ite c!17347 (ite c!17351 (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!27381 (= lt!51097 (lemmaContainsTupThenGetReturnValue!69 lt!51099 (_1!1169 (ite c!17347 (ite c!17351 (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1169 (ite c!17347 (ite c!17351 (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!27381 (= lt!51099 (insertStrictlySorted!72 (toList!769 (ite c!17347 (ite c!17351 call!10419 call!10433) call!10424)) (_1!1169 (ite c!17347 (ite c!17351 (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1169 (ite c!17347 (ite c!17351 (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!27381 (= (+!132 (ite c!17347 (ite c!17351 call!10419 call!10433) call!10424) (ite c!17347 (ite c!17351 (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!51100)))

(declare-fun b!100997 () Bool)

(declare-fun res!50611 () Bool)

(assert (=> b!100997 (=> (not res!50611) (not e!65760))))

(assert (=> b!100997 (= res!50611 (= (getValueByKey!153 (toList!769 lt!51100) (_1!1169 (ite c!17347 (ite c!17351 (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!158 (_2!1169 (ite c!17347 (ite c!17351 (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!100998 () Bool)

(assert (=> b!100998 (= e!65760 (contains!799 (toList!769 lt!51100) (ite c!17347 (ite c!17351 (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!27381 res!50612) b!100997))

(assert (= (and b!100997 res!50611) b!100998))

(declare-fun m!111719 () Bool)

(assert (=> d!27381 m!111719))

(declare-fun m!111721 () Bool)

(assert (=> d!27381 m!111721))

(declare-fun m!111723 () Bool)

(assert (=> d!27381 m!111723))

(declare-fun m!111725 () Bool)

(assert (=> d!27381 m!111725))

(declare-fun m!111727 () Bool)

(assert (=> b!100997 m!111727))

(declare-fun m!111729 () Bool)

(assert (=> b!100998 m!111729))

(assert (=> bm!10423 d!27381))

(declare-fun d!27383 () Bool)

(assert (=> d!27383 (= (map!1259 (ite c!17348 newMap!16 (_2!1168 lt!51064))) (getCurrentListMap!457 (_keys!4220 (ite c!17348 newMap!16 (_2!1168 lt!51064))) (_values!2505 (ite c!17348 newMap!16 (_2!1168 lt!51064))) (mask!6639 (ite c!17348 newMap!16 (_2!1168 lt!51064))) (extraKeys!2335 (ite c!17348 newMap!16 (_2!1168 lt!51064))) (zeroValue!2401 (ite c!17348 newMap!16 (_2!1168 lt!51064))) (minValue!2401 (ite c!17348 newMap!16 (_2!1168 lt!51064))) #b00000000000000000000000000000000 (defaultEntry!2522 (ite c!17348 newMap!16 (_2!1168 lt!51064)))))))

(declare-fun bs!4184 () Bool)

(assert (= bs!4184 d!27383))

(declare-fun m!111731 () Bool)

(assert (=> bs!4184 m!111731))

(assert (=> bm!10422 d!27383))

(declare-fun b!100999 () Bool)

(declare-fun e!65764 () ListLongMap!1507)

(declare-fun call!10448 () ListLongMap!1507)

(assert (=> b!100999 (= e!65764 call!10448)))

(declare-fun c!17358 () Bool)

(declare-fun b!101000 () Bool)

(assert (=> b!101000 (= c!17358 (and (not (= (bvand (ite (and c!17347 c!17351) lt!51065 (extraKeys!2335 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!17347 c!17351) lt!51065 (extraKeys!2335 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!65771 () ListLongMap!1507)

(assert (=> b!101000 (= e!65771 e!65764)))

(declare-fun d!27385 () Bool)

(declare-fun e!65762 () Bool)

(assert (=> d!27385 e!65762))

(declare-fun res!50619 () Bool)

(assert (=> d!27385 (=> (not res!50619) (not e!65762))))

(assert (=> d!27385 (= res!50619 (or (bvsge #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))))))))

(declare-fun lt!51102 () ListLongMap!1507)

(declare-fun lt!51122 () ListLongMap!1507)

(assert (=> d!27385 (= lt!51102 lt!51122)))

(declare-fun lt!51116 () Unit!3048)

(declare-fun e!65772 () Unit!3048)

(assert (=> d!27385 (= lt!51116 e!65772)))

(declare-fun c!17357 () Bool)

(declare-fun e!65773 () Bool)

(assert (=> d!27385 (= c!17357 e!65773)))

(declare-fun res!50613 () Bool)

(assert (=> d!27385 (=> (not res!50613) (not e!65773))))

(assert (=> d!27385 (= res!50613 (bvslt #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))))))

(declare-fun e!65768 () ListLongMap!1507)

(assert (=> d!27385 (= lt!51122 e!65768)))

(declare-fun c!17360 () Bool)

(assert (=> d!27385 (= c!17360 (and (not (= (bvand (ite (and c!17347 c!17351) lt!51065 (extraKeys!2335 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!17347 c!17351) lt!51065 (extraKeys!2335 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27385 (validMask!0 (mask!6639 newMap!16))))

(assert (=> d!27385 (= (getCurrentListMap!457 (_keys!4220 newMap!16) (ite (or c!17347 c!17340) (_values!2505 newMap!16) lt!51075) (mask!6639 newMap!16) (ite (and c!17347 c!17351) lt!51065 (extraKeys!2335 newMap!16)) (ite (and c!17347 c!17351) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16)) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) lt!51102)))

(declare-fun b!101001 () Bool)

(declare-fun Unit!3063 () Unit!3048)

(assert (=> b!101001 (= e!65772 Unit!3063)))

(declare-fun b!101002 () Bool)

(declare-fun res!50620 () Bool)

(assert (=> b!101002 (=> (not res!50620) (not e!65762))))

(declare-fun e!65769 () Bool)

(assert (=> b!101002 (= res!50620 e!65769)))

(declare-fun c!17355 () Bool)

(assert (=> b!101002 (= c!17355 (not (= (bvand (ite (and c!17347 c!17351) lt!51065 (extraKeys!2335 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!101003 () Bool)

(declare-fun e!65766 () Bool)

(declare-fun call!10444 () Bool)

(assert (=> b!101003 (= e!65766 (not call!10444))))

(declare-fun b!101004 () Bool)

(declare-fun e!65767 () Bool)

(assert (=> b!101004 (= e!65769 e!65767)))

(declare-fun res!50616 () Bool)

(declare-fun call!10443 () Bool)

(assert (=> b!101004 (= res!50616 call!10443)))

(assert (=> b!101004 (=> (not res!50616) (not e!65767))))

(declare-fun bm!10439 () Bool)

(declare-fun call!10447 () ListLongMap!1507)

(declare-fun call!10442 () ListLongMap!1507)

(assert (=> bm!10439 (= call!10447 call!10442)))

(declare-fun b!101005 () Bool)

(declare-fun call!10445 () ListLongMap!1507)

(assert (=> b!101005 (= e!65764 call!10445)))

(declare-fun b!101006 () Bool)

(assert (=> b!101006 (= e!65762 e!65766)))

(declare-fun c!17356 () Bool)

(assert (=> b!101006 (= c!17356 (not (= (bvand (ite (and c!17347 c!17351) lt!51065 (extraKeys!2335 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!10440 () Bool)

(declare-fun call!10446 () ListLongMap!1507)

(assert (=> bm!10440 (= call!10448 call!10446)))

(declare-fun c!17359 () Bool)

(declare-fun bm!10441 () Bool)

(assert (=> bm!10441 (= call!10446 (+!132 (ite c!17360 call!10442 (ite c!17359 call!10447 call!10445)) (ite (or c!17360 c!17359) (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!17347 c!17351) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 newMap!16)))))))

(declare-fun b!101007 () Bool)

(declare-fun e!65763 () Bool)

(assert (=> b!101007 (= e!65763 (validKeyInArray!0 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101008 () Bool)

(declare-fun e!65770 () Bool)

(assert (=> b!101008 (= e!65770 (= (apply!94 lt!51102 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000)) (get!1302 (select (arr!2019 (ite (or c!17347 c!17340) (_values!2505 newMap!16) lt!51075)) #b00000000000000000000000000000000) (dynLambda!374 (defaultEntry!2522 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101008 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2271 (ite (or c!17347 c!17340) (_values!2505 newMap!16) lt!51075))))))

(assert (=> b!101008 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))))))

(declare-fun b!101009 () Bool)

(assert (=> b!101009 (= e!65768 (+!132 call!10446 (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 newMap!16))))))

(declare-fun b!101010 () Bool)

(assert (=> b!101010 (= e!65769 (not call!10443))))

(declare-fun bm!10442 () Bool)

(assert (=> bm!10442 (= call!10442 (getCurrentListMapNoExtraKeys!97 (_keys!4220 newMap!16) (ite (or c!17347 c!17340) (_values!2505 newMap!16) lt!51075) (mask!6639 newMap!16) (ite (and c!17347 c!17351) lt!51065 (extraKeys!2335 newMap!16)) (ite (and c!17347 c!17351) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16)) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun b!101011 () Bool)

(declare-fun res!50617 () Bool)

(assert (=> b!101011 (=> (not res!50617) (not e!65762))))

(declare-fun e!65765 () Bool)

(assert (=> b!101011 (= res!50617 e!65765)))

(declare-fun res!50618 () Bool)

(assert (=> b!101011 (=> res!50618 e!65765)))

(assert (=> b!101011 (= res!50618 (not e!65763))))

(declare-fun res!50615 () Bool)

(assert (=> b!101011 (=> (not res!50615) (not e!65763))))

(assert (=> b!101011 (= res!50615 (bvslt #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))))))

(declare-fun b!101012 () Bool)

(assert (=> b!101012 (= e!65765 e!65770)))

(declare-fun res!50621 () Bool)

(assert (=> b!101012 (=> (not res!50621) (not e!65770))))

(assert (=> b!101012 (= res!50621 (contains!796 lt!51102 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!101012 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))))))

(declare-fun bm!10443 () Bool)

(assert (=> bm!10443 (= call!10444 (contains!796 lt!51102 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101013 () Bool)

(assert (=> b!101013 (= e!65768 e!65771)))

(assert (=> b!101013 (= c!17359 (and (not (= (bvand (ite (and c!17347 c!17351) lt!51065 (extraKeys!2335 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!17347 c!17351) lt!51065 (extraKeys!2335 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101014 () Bool)

(declare-fun e!65761 () Bool)

(assert (=> b!101014 (= e!65761 (= (apply!94 lt!51102 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2401 newMap!16)))))

(declare-fun bm!10444 () Bool)

(assert (=> bm!10444 (= call!10445 call!10447)))

(declare-fun b!101015 () Bool)

(assert (=> b!101015 (= e!65771 call!10448)))

(declare-fun b!101016 () Bool)

(assert (=> b!101016 (= e!65767 (= (apply!94 lt!51102 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!17347 c!17351) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16))))))

(declare-fun b!101017 () Bool)

(declare-fun lt!51119 () Unit!3048)

(assert (=> b!101017 (= e!65772 lt!51119)))

(declare-fun lt!51109 () ListLongMap!1507)

(assert (=> b!101017 (= lt!51109 (getCurrentListMapNoExtraKeys!97 (_keys!4220 newMap!16) (ite (or c!17347 c!17340) (_values!2505 newMap!16) lt!51075) (mask!6639 newMap!16) (ite (and c!17347 c!17351) lt!51065 (extraKeys!2335 newMap!16)) (ite (and c!17347 c!17351) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16)) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51121 () (_ BitVec 64))

(assert (=> b!101017 (= lt!51121 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51107 () (_ BitVec 64))

(assert (=> b!101017 (= lt!51107 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51113 () Unit!3048)

(assert (=> b!101017 (= lt!51113 (addStillContains!70 lt!51109 lt!51121 (ite (and c!17347 c!17351) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16)) lt!51107))))

(assert (=> b!101017 (contains!796 (+!132 lt!51109 (tuple2!2317 lt!51121 (ite (and c!17347 c!17351) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16)))) lt!51107)))

(declare-fun lt!51114 () Unit!3048)

(assert (=> b!101017 (= lt!51114 lt!51113)))

(declare-fun lt!51110 () ListLongMap!1507)

(assert (=> b!101017 (= lt!51110 (getCurrentListMapNoExtraKeys!97 (_keys!4220 newMap!16) (ite (or c!17347 c!17340) (_values!2505 newMap!16) lt!51075) (mask!6639 newMap!16) (ite (and c!17347 c!17351) lt!51065 (extraKeys!2335 newMap!16)) (ite (and c!17347 c!17351) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16)) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51111 () (_ BitVec 64))

(assert (=> b!101017 (= lt!51111 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51115 () (_ BitVec 64))

(assert (=> b!101017 (= lt!51115 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51105 () Unit!3048)

(assert (=> b!101017 (= lt!51105 (addApplyDifferent!70 lt!51110 lt!51111 (minValue!2401 newMap!16) lt!51115))))

(assert (=> b!101017 (= (apply!94 (+!132 lt!51110 (tuple2!2317 lt!51111 (minValue!2401 newMap!16))) lt!51115) (apply!94 lt!51110 lt!51115))))

(declare-fun lt!51112 () Unit!3048)

(assert (=> b!101017 (= lt!51112 lt!51105)))

(declare-fun lt!51117 () ListLongMap!1507)

(assert (=> b!101017 (= lt!51117 (getCurrentListMapNoExtraKeys!97 (_keys!4220 newMap!16) (ite (or c!17347 c!17340) (_values!2505 newMap!16) lt!51075) (mask!6639 newMap!16) (ite (and c!17347 c!17351) lt!51065 (extraKeys!2335 newMap!16)) (ite (and c!17347 c!17351) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16)) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51103 () (_ BitVec 64))

(assert (=> b!101017 (= lt!51103 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51106 () (_ BitVec 64))

(assert (=> b!101017 (= lt!51106 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51118 () Unit!3048)

(assert (=> b!101017 (= lt!51118 (addApplyDifferent!70 lt!51117 lt!51103 (ite (and c!17347 c!17351) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16)) lt!51106))))

(assert (=> b!101017 (= (apply!94 (+!132 lt!51117 (tuple2!2317 lt!51103 (ite (and c!17347 c!17351) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16)))) lt!51106) (apply!94 lt!51117 lt!51106))))

(declare-fun lt!51104 () Unit!3048)

(assert (=> b!101017 (= lt!51104 lt!51118)))

(declare-fun lt!51101 () ListLongMap!1507)

(assert (=> b!101017 (= lt!51101 (getCurrentListMapNoExtraKeys!97 (_keys!4220 newMap!16) (ite (or c!17347 c!17340) (_values!2505 newMap!16) lt!51075) (mask!6639 newMap!16) (ite (and c!17347 c!17351) lt!51065 (extraKeys!2335 newMap!16)) (ite (and c!17347 c!17351) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2401 newMap!16)) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51108 () (_ BitVec 64))

(assert (=> b!101017 (= lt!51108 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51120 () (_ BitVec 64))

(assert (=> b!101017 (= lt!51120 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!101017 (= lt!51119 (addApplyDifferent!70 lt!51101 lt!51108 (minValue!2401 newMap!16) lt!51120))))

(assert (=> b!101017 (= (apply!94 (+!132 lt!51101 (tuple2!2317 lt!51108 (minValue!2401 newMap!16))) lt!51120) (apply!94 lt!51101 lt!51120))))

(declare-fun bm!10445 () Bool)

(assert (=> bm!10445 (= call!10443 (contains!796 lt!51102 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101018 () Bool)

(assert (=> b!101018 (= e!65773 (validKeyInArray!0 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101019 () Bool)

(assert (=> b!101019 (= e!65766 e!65761)))

(declare-fun res!50614 () Bool)

(assert (=> b!101019 (= res!50614 call!10444)))

(assert (=> b!101019 (=> (not res!50614) (not e!65761))))

(assert (= (and d!27385 c!17360) b!101009))

(assert (= (and d!27385 (not c!17360)) b!101013))

(assert (= (and b!101013 c!17359) b!101015))

(assert (= (and b!101013 (not c!17359)) b!101000))

(assert (= (and b!101000 c!17358) b!100999))

(assert (= (and b!101000 (not c!17358)) b!101005))

(assert (= (or b!100999 b!101005) bm!10444))

(assert (= (or b!101015 bm!10444) bm!10439))

(assert (= (or b!101015 b!100999) bm!10440))

(assert (= (or b!101009 bm!10439) bm!10442))

(assert (= (or b!101009 bm!10440) bm!10441))

(assert (= (and d!27385 res!50613) b!101018))

(assert (= (and d!27385 c!17357) b!101017))

(assert (= (and d!27385 (not c!17357)) b!101001))

(assert (= (and d!27385 res!50619) b!101011))

(assert (= (and b!101011 res!50615) b!101007))

(assert (= (and b!101011 (not res!50618)) b!101012))

(assert (= (and b!101012 res!50621) b!101008))

(assert (= (and b!101011 res!50617) b!101002))

(assert (= (and b!101002 c!17355) b!101004))

(assert (= (and b!101002 (not c!17355)) b!101010))

(assert (= (and b!101004 res!50616) b!101016))

(assert (= (or b!101004 b!101010) bm!10445))

(assert (= (and b!101002 res!50620) b!101006))

(assert (= (and b!101006 c!17356) b!101019))

(assert (= (and b!101006 (not c!17356)) b!101003))

(assert (= (and b!101019 res!50614) b!101014))

(assert (= (or b!101019 b!101003) bm!10443))

(declare-fun b_lambda!4525 () Bool)

(assert (=> (not b_lambda!4525) (not b!101008)))

(declare-fun tb!1965 () Bool)

(declare-fun t!5570 () Bool)

(assert (=> (and b!100598 (= (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) (defaultEntry!2522 newMap!16)) t!5570) tb!1965))

(declare-fun result!3327 () Bool)

(assert (=> tb!1965 (= result!3327 tp_is_empty!2641)))

(assert (=> b!101008 t!5570))

(declare-fun b_and!6217 () Bool)

(assert (= b_and!6213 (and (=> t!5570 result!3327) b_and!6217)))

(declare-fun t!5572 () Bool)

(declare-fun tb!1967 () Bool)

(assert (=> (and b!100584 (= (defaultEntry!2522 newMap!16) (defaultEntry!2522 newMap!16)) t!5572) tb!1967))

(declare-fun result!3329 () Bool)

(assert (= result!3329 result!3327))

(assert (=> b!101008 t!5572))

(declare-fun b_and!6219 () Bool)

(assert (= b_and!6215 (and (=> t!5572 result!3329) b_and!6219)))

(declare-fun m!111733 () Bool)

(assert (=> bm!10445 m!111733))

(declare-fun m!111735 () Bool)

(assert (=> b!101014 m!111735))

(declare-fun m!111737 () Bool)

(assert (=> bm!10442 m!111737))

(declare-fun m!111739 () Bool)

(assert (=> b!101009 m!111739))

(declare-fun m!111741 () Bool)

(assert (=> bm!10441 m!111741))

(declare-fun m!111743 () Bool)

(assert (=> b!101017 m!111743))

(declare-fun m!111745 () Bool)

(assert (=> b!101017 m!111745))

(declare-fun m!111747 () Bool)

(assert (=> b!101017 m!111747))

(declare-fun m!111749 () Bool)

(assert (=> b!101017 m!111749))

(assert (=> b!101017 m!111737))

(declare-fun m!111751 () Bool)

(assert (=> b!101017 m!111751))

(declare-fun m!111753 () Bool)

(assert (=> b!101017 m!111753))

(declare-fun m!111755 () Bool)

(assert (=> b!101017 m!111755))

(declare-fun m!111757 () Bool)

(assert (=> b!101017 m!111757))

(declare-fun m!111759 () Bool)

(assert (=> b!101017 m!111759))

(assert (=> b!101017 m!111759))

(declare-fun m!111761 () Bool)

(assert (=> b!101017 m!111761))

(declare-fun m!111763 () Bool)

(assert (=> b!101017 m!111763))

(declare-fun m!111765 () Bool)

(assert (=> b!101017 m!111765))

(declare-fun m!111767 () Bool)

(assert (=> b!101017 m!111767))

(assert (=> b!101017 m!111765))

(declare-fun m!111769 () Bool)

(assert (=> b!101017 m!111769))

(declare-fun m!111771 () Bool)

(assert (=> b!101017 m!111771))

(assert (=> b!101017 m!111743))

(assert (=> b!101017 m!111771))

(declare-fun m!111773 () Bool)

(assert (=> b!101017 m!111773))

(assert (=> b!101007 m!111753))

(assert (=> b!101007 m!111753))

(declare-fun m!111775 () Bool)

(assert (=> b!101007 m!111775))

(assert (=> b!101018 m!111753))

(assert (=> b!101018 m!111753))

(assert (=> b!101018 m!111775))

(declare-fun m!111777 () Bool)

(assert (=> b!101016 m!111777))

(assert (=> d!27385 m!111701))

(assert (=> b!101008 m!111753))

(declare-fun m!111779 () Bool)

(assert (=> b!101008 m!111779))

(assert (=> b!101008 m!111753))

(declare-fun m!111781 () Bool)

(assert (=> b!101008 m!111781))

(declare-fun m!111783 () Bool)

(assert (=> b!101008 m!111783))

(assert (=> b!101008 m!111781))

(declare-fun m!111785 () Bool)

(assert (=> b!101008 m!111785))

(assert (=> b!101008 m!111783))

(declare-fun m!111787 () Bool)

(assert (=> bm!10443 m!111787))

(assert (=> b!101012 m!111753))

(assert (=> b!101012 m!111753))

(declare-fun m!111789 () Bool)

(assert (=> b!101012 m!111789))

(assert (=> bm!10432 d!27385))

(declare-fun d!27387 () Bool)

(declare-fun isEmpty!368 (Option!159) Bool)

(assert (=> d!27387 (= (isDefined!105 (getValueByKey!153 (toList!769 lt!50857) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355))) (not (isEmpty!368 (getValueByKey!153 (toList!769 lt!50857) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))))

(declare-fun bs!4185 () Bool)

(assert (= bs!4185 d!27387))

(assert (=> bs!4185 m!111629))

(declare-fun m!111791 () Bool)

(assert (=> bs!4185 m!111791))

(assert (=> b!100848 d!27387))

(declare-fun b!101031 () Bool)

(declare-fun e!65779 () Option!159)

(assert (=> b!101031 (= e!65779 None!157)))

(declare-fun b!101029 () Bool)

(declare-fun e!65778 () Option!159)

(assert (=> b!101029 (= e!65778 e!65779)))

(declare-fun c!17366 () Bool)

(assert (=> b!101029 (= c!17366 (and ((_ is Cons!1567) (toList!769 lt!50857)) (not (= (_1!1169 (h!2163 (toList!769 lt!50857))) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))))

(declare-fun d!27389 () Bool)

(declare-fun c!17365 () Bool)

(assert (=> d!27389 (= c!17365 (and ((_ is Cons!1567) (toList!769 lt!50857)) (= (_1!1169 (h!2163 (toList!769 lt!50857))) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355))))))

(assert (=> d!27389 (= (getValueByKey!153 (toList!769 lt!50857) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)) e!65778)))

(declare-fun b!101028 () Bool)

(assert (=> b!101028 (= e!65778 (Some!158 (_2!1169 (h!2163 (toList!769 lt!50857)))))))

(declare-fun b!101030 () Bool)

(assert (=> b!101030 (= e!65779 (getValueByKey!153 (t!5557 (toList!769 lt!50857)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(assert (= (and d!27389 c!17365) b!101028))

(assert (= (and d!27389 (not c!17365)) b!101029))

(assert (= (and b!101029 c!17366) b!101030))

(assert (= (and b!101029 (not c!17366)) b!101031))

(assert (=> b!101030 m!111399))

(declare-fun m!111793 () Bool)

(assert (=> b!101030 m!111793))

(assert (=> b!100848 d!27389))

(declare-fun d!27391 () Bool)

(assert (=> d!27391 (arrayContainsKey!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) lt!50909 #b00000000000000000000000000000000)))

(declare-fun lt!51125 () Unit!3048)

(declare-fun choose!13 (array!4251 (_ BitVec 64) (_ BitVec 32)) Unit!3048)

(assert (=> d!27391 (= lt!51125 (choose!13 (_keys!4220 (v!2833 (underlying!344 thiss!992))) lt!50909 #b00000000000000000000000000000000))))

(assert (=> d!27391 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!27391 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) lt!50909 #b00000000000000000000000000000000) lt!51125)))

(declare-fun bs!4186 () Bool)

(assert (= bs!4186 d!27391))

(assert (=> bs!4186 m!111549))

(declare-fun m!111795 () Bool)

(assert (=> bs!4186 m!111795))

(assert (=> b!100748 d!27391))

(declare-fun d!27393 () Bool)

(declare-fun res!50622 () Bool)

(declare-fun e!65780 () Bool)

(assert (=> d!27393 (=> res!50622 e!65780)))

(assert (=> d!27393 (= res!50622 (= (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) #b00000000000000000000000000000000) lt!50909))))

(assert (=> d!27393 (= (arrayContainsKey!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) lt!50909 #b00000000000000000000000000000000) e!65780)))

(declare-fun b!101032 () Bool)

(declare-fun e!65781 () Bool)

(assert (=> b!101032 (= e!65780 e!65781)))

(declare-fun res!50623 () Bool)

(assert (=> b!101032 (=> (not res!50623) (not e!65781))))

(assert (=> b!101032 (= res!50623 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992))))))))

(declare-fun b!101033 () Bool)

(assert (=> b!101033 (= e!65781 (arrayContainsKey!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) lt!50909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!27393 (not res!50622)) b!101032))

(assert (= (and b!101032 res!50623) b!101033))

(assert (=> d!27393 m!111543))

(declare-fun m!111797 () Bool)

(assert (=> b!101033 m!111797))

(assert (=> b!100748 d!27393))

(declare-fun b!101046 () Bool)

(declare-fun e!65790 () SeekEntryResult!249)

(declare-fun lt!51132 () SeekEntryResult!249)

(assert (=> b!101046 (= e!65790 (MissingZero!249 (index!3143 lt!51132)))))

(declare-fun d!27395 () Bool)

(declare-fun lt!51134 () SeekEntryResult!249)

(assert (=> d!27395 (and (or ((_ is Undefined!249) lt!51134) (not ((_ is Found!249) lt!51134)) (and (bvsge (index!3142 lt!51134) #b00000000000000000000000000000000) (bvslt (index!3142 lt!51134) (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992))))))) (or ((_ is Undefined!249) lt!51134) ((_ is Found!249) lt!51134) (not ((_ is MissingZero!249) lt!51134)) (and (bvsge (index!3141 lt!51134) #b00000000000000000000000000000000) (bvslt (index!3141 lt!51134) (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992))))))) (or ((_ is Undefined!249) lt!51134) ((_ is Found!249) lt!51134) ((_ is MissingZero!249) lt!51134) (not ((_ is MissingVacant!249) lt!51134)) (and (bvsge (index!3144 lt!51134) #b00000000000000000000000000000000) (bvslt (index!3144 lt!51134) (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992))))))) (or ((_ is Undefined!249) lt!51134) (ite ((_ is Found!249) lt!51134) (= (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (index!3142 lt!51134)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!249) lt!51134) (= (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (index!3141 lt!51134)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!249) lt!51134) (= (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (index!3144 lt!51134)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!65789 () SeekEntryResult!249)

(assert (=> d!27395 (= lt!51134 e!65789)))

(declare-fun c!17373 () Bool)

(assert (=> d!27395 (= c!17373 (and ((_ is Intermediate!249) lt!51132) (undefined!1061 lt!51132)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4251 (_ BitVec 32)) SeekEntryResult!249)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!27395 (= lt!51132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) #b00000000000000000000000000000000) (mask!6639 (v!2833 (underlying!344 thiss!992)))) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) #b00000000000000000000000000000000) (_keys!4220 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992)))))))

(assert (=> d!27395 (validMask!0 (mask!6639 (v!2833 (underlying!344 thiss!992))))))

(assert (=> d!27395 (= (seekEntryOrOpen!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) #b00000000000000000000000000000000) (_keys!4220 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992)))) lt!51134)))

(declare-fun b!101047 () Bool)

(assert (=> b!101047 (= e!65789 Undefined!249)))

(declare-fun b!101048 () Bool)

(declare-fun e!65788 () SeekEntryResult!249)

(assert (=> b!101048 (= e!65788 (Found!249 (index!3143 lt!51132)))))

(declare-fun b!101049 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4251 (_ BitVec 32)) SeekEntryResult!249)

(assert (=> b!101049 (= e!65790 (seekKeyOrZeroReturnVacant!0 (x!13243 lt!51132) (index!3143 lt!51132) (index!3143 lt!51132) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) #b00000000000000000000000000000000) (_keys!4220 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992)))))))

(declare-fun b!101050 () Bool)

(assert (=> b!101050 (= e!65789 e!65788)))

(declare-fun lt!51133 () (_ BitVec 64))

(assert (=> b!101050 (= lt!51133 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (index!3143 lt!51132)))))

(declare-fun c!17375 () Bool)

(assert (=> b!101050 (= c!17375 (= lt!51133 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!101051 () Bool)

(declare-fun c!17374 () Bool)

(assert (=> b!101051 (= c!17374 (= lt!51133 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101051 (= e!65788 e!65790)))

(assert (= (and d!27395 c!17373) b!101047))

(assert (= (and d!27395 (not c!17373)) b!101050))

(assert (= (and b!101050 c!17375) b!101048))

(assert (= (and b!101050 (not c!17375)) b!101051))

(assert (= (and b!101051 c!17374) b!101046))

(assert (= (and b!101051 (not c!17374)) b!101049))

(assert (=> d!27395 m!111543))

(declare-fun m!111799 () Bool)

(assert (=> d!27395 m!111799))

(declare-fun m!111801 () Bool)

(assert (=> d!27395 m!111801))

(assert (=> d!27395 m!111405))

(declare-fun m!111803 () Bool)

(assert (=> d!27395 m!111803))

(declare-fun m!111805 () Bool)

(assert (=> d!27395 m!111805))

(assert (=> d!27395 m!111799))

(assert (=> d!27395 m!111543))

(declare-fun m!111807 () Bool)

(assert (=> d!27395 m!111807))

(assert (=> b!101049 m!111543))

(declare-fun m!111809 () Bool)

(assert (=> b!101049 m!111809))

(declare-fun m!111811 () Bool)

(assert (=> b!101050 m!111811))

(assert (=> b!100748 d!27395))

(declare-fun b!101052 () Bool)

(declare-fun e!65793 () SeekEntryResult!249)

(declare-fun lt!51135 () SeekEntryResult!249)

(assert (=> b!101052 (= e!65793 (MissingZero!249 (index!3143 lt!51135)))))

(declare-fun d!27397 () Bool)

(declare-fun lt!51137 () SeekEntryResult!249)

(assert (=> d!27397 (and (or ((_ is Undefined!249) lt!51137) (not ((_ is Found!249) lt!51137)) (and (bvsge (index!3142 lt!51137) #b00000000000000000000000000000000) (bvslt (index!3142 lt!51137) (size!2270 (_keys!4220 newMap!16))))) (or ((_ is Undefined!249) lt!51137) ((_ is Found!249) lt!51137) (not ((_ is MissingZero!249) lt!51137)) (and (bvsge (index!3141 lt!51137) #b00000000000000000000000000000000) (bvslt (index!3141 lt!51137) (size!2270 (_keys!4220 newMap!16))))) (or ((_ is Undefined!249) lt!51137) ((_ is Found!249) lt!51137) ((_ is MissingZero!249) lt!51137) (not ((_ is MissingVacant!249) lt!51137)) (and (bvsge (index!3144 lt!51137) #b00000000000000000000000000000000) (bvslt (index!3144 lt!51137) (size!2270 (_keys!4220 newMap!16))))) (or ((_ is Undefined!249) lt!51137) (ite ((_ is Found!249) lt!51137) (= (select (arr!2018 (_keys!4220 newMap!16)) (index!3142 lt!51137)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)) (ite ((_ is MissingZero!249) lt!51137) (= (select (arr!2018 (_keys!4220 newMap!16)) (index!3141 lt!51137)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!249) lt!51137) (= (select (arr!2018 (_keys!4220 newMap!16)) (index!3144 lt!51137)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!65792 () SeekEntryResult!249)

(assert (=> d!27397 (= lt!51137 e!65792)))

(declare-fun c!17376 () Bool)

(assert (=> d!27397 (= c!17376 (and ((_ is Intermediate!249) lt!51135) (undefined!1061 lt!51135)))))

(assert (=> d!27397 (= lt!51135 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (mask!6639 newMap!16)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (_keys!4220 newMap!16) (mask!6639 newMap!16)))))

(assert (=> d!27397 (validMask!0 (mask!6639 newMap!16))))

(assert (=> d!27397 (= (seekEntryOrOpen!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (_keys!4220 newMap!16) (mask!6639 newMap!16)) lt!51137)))

(declare-fun b!101053 () Bool)

(assert (=> b!101053 (= e!65792 Undefined!249)))

(declare-fun b!101054 () Bool)

(declare-fun e!65791 () SeekEntryResult!249)

(assert (=> b!101054 (= e!65791 (Found!249 (index!3143 lt!51135)))))

(declare-fun b!101055 () Bool)

(assert (=> b!101055 (= e!65793 (seekKeyOrZeroReturnVacant!0 (x!13243 lt!51135) (index!3143 lt!51135) (index!3143 lt!51135) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (_keys!4220 newMap!16) (mask!6639 newMap!16)))))

(declare-fun b!101056 () Bool)

(assert (=> b!101056 (= e!65792 e!65791)))

(declare-fun lt!51136 () (_ BitVec 64))

(assert (=> b!101056 (= lt!51136 (select (arr!2018 (_keys!4220 newMap!16)) (index!3143 lt!51135)))))

(declare-fun c!17378 () Bool)

(assert (=> b!101056 (= c!17378 (= lt!51136 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(declare-fun b!101057 () Bool)

(declare-fun c!17377 () Bool)

(assert (=> b!101057 (= c!17377 (= lt!51136 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101057 (= e!65791 e!65793)))

(assert (= (and d!27397 c!17376) b!101053))

(assert (= (and d!27397 (not c!17376)) b!101056))

(assert (= (and b!101056 c!17378) b!101054))

(assert (= (and b!101056 (not c!17378)) b!101057))

(assert (= (and b!101057 c!17377) b!101052))

(assert (= (and b!101057 (not c!17377)) b!101055))

(assert (=> d!27397 m!111399))

(declare-fun m!111813 () Bool)

(assert (=> d!27397 m!111813))

(declare-fun m!111815 () Bool)

(assert (=> d!27397 m!111815))

(assert (=> d!27397 m!111701))

(declare-fun m!111817 () Bool)

(assert (=> d!27397 m!111817))

(declare-fun m!111819 () Bool)

(assert (=> d!27397 m!111819))

(assert (=> d!27397 m!111813))

(assert (=> d!27397 m!111399))

(declare-fun m!111821 () Bool)

(assert (=> d!27397 m!111821))

(assert (=> b!101055 m!111399))

(declare-fun m!111823 () Bool)

(assert (=> b!101055 m!111823))

(declare-fun m!111825 () Bool)

(assert (=> b!101056 m!111825))

(assert (=> b!100944 d!27397))

(declare-fun d!27399 () Bool)

(declare-fun e!65795 () Bool)

(assert (=> d!27399 e!65795))

(declare-fun res!50624 () Bool)

(assert (=> d!27399 (=> res!50624 e!65795)))

(declare-fun lt!51139 () Bool)

(assert (=> d!27399 (= res!50624 (not lt!51139))))

(declare-fun lt!51141 () Bool)

(assert (=> d!27399 (= lt!51139 lt!51141)))

(declare-fun lt!51138 () Unit!3048)

(declare-fun e!65794 () Unit!3048)

(assert (=> d!27399 (= lt!51138 e!65794)))

(declare-fun c!17379 () Bool)

(assert (=> d!27399 (= c!17379 lt!51141)))

(assert (=> d!27399 (= lt!51141 (containsKey!156 (toList!769 lt!50965) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!27399 (= (contains!796 lt!50965 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!51139)))

(declare-fun b!101058 () Bool)

(declare-fun lt!51140 () Unit!3048)

(assert (=> b!101058 (= e!65794 lt!51140)))

(assert (=> b!101058 (= lt!51140 (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!769 lt!50965) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!101058 (isDefined!105 (getValueByKey!153 (toList!769 lt!50965) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!101059 () Bool)

(declare-fun Unit!3064 () Unit!3048)

(assert (=> b!101059 (= e!65794 Unit!3064)))

(declare-fun b!101060 () Bool)

(assert (=> b!101060 (= e!65795 (isDefined!105 (getValueByKey!153 (toList!769 lt!50965) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!27399 c!17379) b!101058))

(assert (= (and d!27399 (not c!17379)) b!101059))

(assert (= (and d!27399 (not res!50624)) b!101060))

(assert (=> d!27399 m!111557))

(declare-fun m!111827 () Bool)

(assert (=> d!27399 m!111827))

(assert (=> b!101058 m!111557))

(declare-fun m!111829 () Bool)

(assert (=> b!101058 m!111829))

(assert (=> b!101058 m!111557))

(declare-fun m!111831 () Bool)

(assert (=> b!101058 m!111831))

(assert (=> b!101058 m!111831))

(declare-fun m!111833 () Bool)

(assert (=> b!101058 m!111833))

(assert (=> b!101060 m!111557))

(assert (=> b!101060 m!111831))

(assert (=> b!101060 m!111831))

(assert (=> b!101060 m!111833))

(assert (=> b!100832 d!27399))

(declare-fun d!27401 () Bool)

(assert (=> d!27401 (isDefined!105 (getValueByKey!153 (toList!769 lt!50857) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(declare-fun lt!51144 () Unit!3048)

(declare-fun choose!624 (List!1571 (_ BitVec 64)) Unit!3048)

(assert (=> d!27401 (= lt!51144 (choose!624 (toList!769 lt!50857) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(declare-fun e!65798 () Bool)

(assert (=> d!27401 e!65798))

(declare-fun res!50627 () Bool)

(assert (=> d!27401 (=> (not res!50627) (not e!65798))))

(declare-fun isStrictlySorted!293 (List!1571) Bool)

(assert (=> d!27401 (= res!50627 (isStrictlySorted!293 (toList!769 lt!50857)))))

(assert (=> d!27401 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!769 lt!50857) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)) lt!51144)))

(declare-fun b!101063 () Bool)

(assert (=> b!101063 (= e!65798 (containsKey!156 (toList!769 lt!50857) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(assert (= (and d!27401 res!50627) b!101063))

(assert (=> d!27401 m!111399))

(assert (=> d!27401 m!111629))

(assert (=> d!27401 m!111629))

(assert (=> d!27401 m!111631))

(assert (=> d!27401 m!111399))

(declare-fun m!111835 () Bool)

(assert (=> d!27401 m!111835))

(declare-fun m!111837 () Bool)

(assert (=> d!27401 m!111837))

(assert (=> b!101063 m!111399))

(assert (=> b!101063 m!111625))

(assert (=> b!100846 d!27401))

(assert (=> b!100846 d!27387))

(assert (=> b!100846 d!27389))

(declare-fun b!101088 () Bool)

(assert (=> b!101088 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992))))))))

(assert (=> b!101088 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2271 (_values!2505 (v!2833 (underlying!344 thiss!992))))))))

(declare-fun e!65813 () Bool)

(declare-fun lt!51162 () ListLongMap!1507)

(assert (=> b!101088 (= e!65813 (= (apply!94 lt!51162 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!101089 () Bool)

(declare-fun e!65818 () Bool)

(declare-fun e!65815 () Bool)

(assert (=> b!101089 (= e!65818 e!65815)))

(declare-fun c!17390 () Bool)

(declare-fun e!65819 () Bool)

(assert (=> b!101089 (= c!17390 e!65819)))

(declare-fun res!50637 () Bool)

(assert (=> b!101089 (=> (not res!50637) (not e!65819))))

(assert (=> b!101089 (= res!50637 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992))))))))

(declare-fun b!101090 () Bool)

(declare-fun e!65816 () ListLongMap!1507)

(assert (=> b!101090 (= e!65816 (ListLongMap!1508 Nil!1568))))

(declare-fun b!101092 () Bool)

(declare-fun lt!51159 () Unit!3048)

(declare-fun lt!51160 () Unit!3048)

(assert (=> b!101092 (= lt!51159 lt!51160)))

(declare-fun lt!51163 () V!3169)

(declare-fun lt!51161 () (_ BitVec 64))

(declare-fun lt!51165 () ListLongMap!1507)

(declare-fun lt!51164 () (_ BitVec 64))

(assert (=> b!101092 (not (contains!796 (+!132 lt!51165 (tuple2!2317 lt!51164 lt!51163)) lt!51161))))

(declare-fun addStillNotContains!44 (ListLongMap!1507 (_ BitVec 64) V!3169 (_ BitVec 64)) Unit!3048)

(assert (=> b!101092 (= lt!51160 (addStillNotContains!44 lt!51165 lt!51164 lt!51163 lt!51161))))

(assert (=> b!101092 (= lt!51161 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!101092 (= lt!51163 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!101092 (= lt!51164 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!10451 () ListLongMap!1507)

(assert (=> b!101092 (= lt!51165 call!10451)))

(declare-fun e!65817 () ListLongMap!1507)

(assert (=> b!101092 (= e!65817 (+!132 call!10451 (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!10448 () Bool)

(assert (=> bm!10448 (= call!10451 (getCurrentListMapNoExtraKeys!97 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (_values!2505 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992))) (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) (zeroValue!2401 (v!2833 (underlying!344 thiss!992))) (minValue!2401 (v!2833 (underlying!344 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2522 (v!2833 (underlying!344 thiss!992)))))))

(declare-fun b!101093 () Bool)

(assert (=> b!101093 (= e!65819 (validKeyInArray!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!101093 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!101094 () Bool)

(assert (=> b!101094 (= e!65815 e!65813)))

(assert (=> b!101094 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992))))))))

(declare-fun res!50636 () Bool)

(assert (=> b!101094 (= res!50636 (contains!796 lt!51162 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!101094 (=> (not res!50636) (not e!65813))))

(declare-fun b!101095 () Bool)

(declare-fun res!50638 () Bool)

(assert (=> b!101095 (=> (not res!50638) (not e!65818))))

(assert (=> b!101095 (= res!50638 (not (contains!796 lt!51162 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101096 () Bool)

(assert (=> b!101096 (= e!65816 e!65817)))

(declare-fun c!17388 () Bool)

(assert (=> b!101096 (= c!17388 (validKeyInArray!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!101097 () Bool)

(declare-fun e!65814 () Bool)

(declare-fun isEmpty!369 (ListLongMap!1507) Bool)

(assert (=> b!101097 (= e!65814 (isEmpty!369 lt!51162))))

(declare-fun b!101091 () Bool)

(assert (=> b!101091 (= e!65814 (= lt!51162 (getCurrentListMapNoExtraKeys!97 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (_values!2505 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992))) (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) (zeroValue!2401 (v!2833 (underlying!344 thiss!992))) (minValue!2401 (v!2833 (underlying!344 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))))))))

(declare-fun d!27403 () Bool)

(assert (=> d!27403 e!65818))

(declare-fun res!50639 () Bool)

(assert (=> d!27403 (=> (not res!50639) (not e!65818))))

(assert (=> d!27403 (= res!50639 (not (contains!796 lt!51162 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27403 (= lt!51162 e!65816)))

(declare-fun c!17391 () Bool)

(assert (=> d!27403 (= c!17391 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992))))))))

(assert (=> d!27403 (validMask!0 (mask!6639 (v!2833 (underlying!344 thiss!992))))))

(assert (=> d!27403 (= (getCurrentListMapNoExtraKeys!97 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (_values!2505 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992))) (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) (zeroValue!2401 (v!2833 (underlying!344 thiss!992))) (minValue!2401 (v!2833 (underlying!344 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2833 (underlying!344 thiss!992)))) lt!51162)))

(declare-fun b!101098 () Bool)

(assert (=> b!101098 (= e!65815 e!65814)))

(declare-fun c!17389 () Bool)

(assert (=> b!101098 (= c!17389 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992))))))))

(declare-fun b!101099 () Bool)

(assert (=> b!101099 (= e!65817 call!10451)))

(assert (= (and d!27403 c!17391) b!101090))

(assert (= (and d!27403 (not c!17391)) b!101096))

(assert (= (and b!101096 c!17388) b!101092))

(assert (= (and b!101096 (not c!17388)) b!101099))

(assert (= (or b!101092 b!101099) bm!10448))

(assert (= (and d!27403 res!50639) b!101095))

(assert (= (and b!101095 res!50638) b!101089))

(assert (= (and b!101089 res!50637) b!101093))

(assert (= (and b!101089 c!17390) b!101094))

(assert (= (and b!101089 (not c!17390)) b!101098))

(assert (= (and b!101094 res!50636) b!101088))

(assert (= (and b!101098 c!17389) b!101091))

(assert (= (and b!101098 (not c!17389)) b!101097))

(declare-fun b_lambda!4527 () Bool)

(assert (=> (not b_lambda!4527) (not b!101088)))

(assert (=> b!101088 t!5554))

(declare-fun b_and!6221 () Bool)

(assert (= b_and!6217 (and (=> t!5554 result!3307) b_and!6221)))

(assert (=> b!101088 t!5556))

(declare-fun b_and!6223 () Bool)

(assert (= b_and!6219 (and (=> t!5556 result!3311) b_and!6223)))

(declare-fun b_lambda!4529 () Bool)

(assert (=> (not b_lambda!4529) (not b!101092)))

(assert (=> b!101092 t!5554))

(declare-fun b_and!6225 () Bool)

(assert (= b_and!6221 (and (=> t!5554 result!3307) b_and!6225)))

(assert (=> b!101092 t!5556))

(declare-fun b_and!6227 () Bool)

(assert (= b_and!6223 (and (=> t!5556 result!3311) b_and!6227)))

(assert (=> b!101093 m!111557))

(assert (=> b!101093 m!111557))

(assert (=> b!101093 m!111611))

(assert (=> b!101088 m!111557))

(declare-fun m!111839 () Bool)

(assert (=> b!101088 m!111839))

(assert (=> b!101088 m!111557))

(assert (=> b!101088 m!111617))

(assert (=> b!101088 m!111617))

(assert (=> b!101088 m!111395))

(assert (=> b!101088 m!111619))

(assert (=> b!101088 m!111395))

(declare-fun m!111841 () Bool)

(assert (=> b!101097 m!111841))

(assert (=> b!101094 m!111557))

(assert (=> b!101094 m!111557))

(declare-fun m!111843 () Bool)

(assert (=> b!101094 m!111843))

(declare-fun m!111845 () Bool)

(assert (=> b!101095 m!111845))

(assert (=> b!101096 m!111557))

(assert (=> b!101096 m!111557))

(assert (=> b!101096 m!111611))

(declare-fun m!111847 () Bool)

(assert (=> b!101091 m!111847))

(assert (=> b!101092 m!111557))

(declare-fun m!111849 () Bool)

(assert (=> b!101092 m!111849))

(declare-fun m!111851 () Bool)

(assert (=> b!101092 m!111851))

(declare-fun m!111853 () Bool)

(assert (=> b!101092 m!111853))

(assert (=> b!101092 m!111617))

(assert (=> b!101092 m!111853))

(declare-fun m!111855 () Bool)

(assert (=> b!101092 m!111855))

(assert (=> b!101092 m!111617))

(assert (=> b!101092 m!111395))

(assert (=> b!101092 m!111619))

(assert (=> b!101092 m!111395))

(declare-fun m!111857 () Bool)

(assert (=> d!27403 m!111857))

(assert (=> d!27403 m!111405))

(assert (=> bm!10448 m!111847))

(assert (=> bm!10363 d!27403))

(assert (=> d!27355 d!27359))

(declare-fun d!27405 () Bool)

(assert (=> d!27405 (not (arrayContainsKey!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!27405 true))

(declare-fun _$68!97 () Unit!3048)

(assert (=> d!27405 (= (choose!68 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (Cons!1568 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) Nil!1569)) _$68!97)))

(declare-fun bs!4187 () Bool)

(assert (= bs!4187 d!27405))

(assert (=> bs!4187 m!111399))

(assert (=> bs!4187 m!111415))

(assert (=> d!27355 d!27405))

(declare-fun d!27407 () Bool)

(assert (=> d!27407 (= (validKeyInArray!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!100746 d!27407))

(declare-fun d!27409 () Bool)

(declare-fun e!65821 () Bool)

(assert (=> d!27409 e!65821))

(declare-fun res!50640 () Bool)

(assert (=> d!27409 (=> res!50640 e!65821)))

(declare-fun lt!51167 () Bool)

(assert (=> d!27409 (= res!50640 (not lt!51167))))

(declare-fun lt!51169 () Bool)

(assert (=> d!27409 (= lt!51167 lt!51169)))

(declare-fun lt!51166 () Unit!3048)

(declare-fun e!65820 () Unit!3048)

(assert (=> d!27409 (= lt!51166 e!65820)))

(declare-fun c!17392 () Bool)

(assert (=> d!27409 (= c!17392 lt!51169)))

(assert (=> d!27409 (= lt!51169 (containsKey!156 (toList!769 e!65736) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(assert (=> d!27409 (= (contains!796 e!65736 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)) lt!51167)))

(declare-fun b!101100 () Bool)

(declare-fun lt!51168 () Unit!3048)

(assert (=> b!101100 (= e!65820 lt!51168)))

(assert (=> b!101100 (= lt!51168 (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!769 e!65736) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(assert (=> b!101100 (isDefined!105 (getValueByKey!153 (toList!769 e!65736) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(declare-fun b!101101 () Bool)

(declare-fun Unit!3065 () Unit!3048)

(assert (=> b!101101 (= e!65820 Unit!3065)))

(declare-fun b!101102 () Bool)

(assert (=> b!101102 (= e!65821 (isDefined!105 (getValueByKey!153 (toList!769 e!65736) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355))))))

(assert (= (and d!27409 c!17392) b!101100))

(assert (= (and d!27409 (not c!17392)) b!101101))

(assert (= (and d!27409 (not res!50640)) b!101102))

(assert (=> d!27409 m!111399))

(declare-fun m!111859 () Bool)

(assert (=> d!27409 m!111859))

(assert (=> b!101100 m!111399))

(declare-fun m!111861 () Bool)

(assert (=> b!101100 m!111861))

(assert (=> b!101100 m!111399))

(declare-fun m!111863 () Bool)

(assert (=> b!101100 m!111863))

(assert (=> b!101100 m!111863))

(declare-fun m!111865 () Bool)

(assert (=> b!101100 m!111865))

(assert (=> b!101102 m!111399))

(assert (=> b!101102 m!111863))

(assert (=> b!101102 m!111863))

(assert (=> b!101102 m!111865))

(assert (=> bm!10426 d!27409))

(declare-fun b!101103 () Bool)

(declare-fun e!65825 () ListLongMap!1507)

(declare-fun call!10458 () ListLongMap!1507)

(assert (=> b!101103 (= e!65825 call!10458)))

(declare-fun b!101104 () Bool)

(declare-fun c!17396 () Bool)

(assert (=> b!101104 (= c!17396 (and (not (= (bvand (ite c!17347 (ite c!17351 (extraKeys!2335 newMap!16) lt!51074) (extraKeys!2335 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!17347 (ite c!17351 (extraKeys!2335 newMap!16) lt!51074) (extraKeys!2335 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!65832 () ListLongMap!1507)

(assert (=> b!101104 (= e!65832 e!65825)))

(declare-fun d!27411 () Bool)

(declare-fun e!65823 () Bool)

(assert (=> d!27411 e!65823))

(declare-fun res!50647 () Bool)

(assert (=> d!27411 (=> (not res!50647) (not e!65823))))

(assert (=> d!27411 (= res!50647 (or (bvsge #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))))))))

(declare-fun lt!51171 () ListLongMap!1507)

(declare-fun lt!51191 () ListLongMap!1507)

(assert (=> d!27411 (= lt!51171 lt!51191)))

(declare-fun lt!51185 () Unit!3048)

(declare-fun e!65833 () Unit!3048)

(assert (=> d!27411 (= lt!51185 e!65833)))

(declare-fun c!17395 () Bool)

(declare-fun e!65834 () Bool)

(assert (=> d!27411 (= c!17395 e!65834)))

(declare-fun res!50641 () Bool)

(assert (=> d!27411 (=> (not res!50641) (not e!65834))))

(assert (=> d!27411 (= res!50641 (bvslt #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))))))

(declare-fun e!65829 () ListLongMap!1507)

(assert (=> d!27411 (= lt!51191 e!65829)))

(declare-fun c!17398 () Bool)

(assert (=> d!27411 (= c!17398 (and (not (= (bvand (ite c!17347 (ite c!17351 (extraKeys!2335 newMap!16) lt!51074) (extraKeys!2335 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!17347 (ite c!17351 (extraKeys!2335 newMap!16) lt!51074) (extraKeys!2335 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27411 (validMask!0 (mask!6639 newMap!16))))

(assert (=> d!27411 (= (getCurrentListMap!457 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (ite c!17347 (ite c!17351 (extraKeys!2335 newMap!16) lt!51074) (extraKeys!2335 newMap!16)) (zeroValue!2401 newMap!16) (ite c!17347 (ite c!17351 (minValue!2401 newMap!16) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) lt!51171)))

(declare-fun b!101105 () Bool)

(declare-fun Unit!3066 () Unit!3048)

(assert (=> b!101105 (= e!65833 Unit!3066)))

(declare-fun b!101106 () Bool)

(declare-fun res!50648 () Bool)

(assert (=> b!101106 (=> (not res!50648) (not e!65823))))

(declare-fun e!65830 () Bool)

(assert (=> b!101106 (= res!50648 e!65830)))

(declare-fun c!17393 () Bool)

(assert (=> b!101106 (= c!17393 (not (= (bvand (ite c!17347 (ite c!17351 (extraKeys!2335 newMap!16) lt!51074) (extraKeys!2335 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!101107 () Bool)

(declare-fun e!65827 () Bool)

(declare-fun call!10454 () Bool)

(assert (=> b!101107 (= e!65827 (not call!10454))))

(declare-fun b!101108 () Bool)

(declare-fun e!65828 () Bool)

(assert (=> b!101108 (= e!65830 e!65828)))

(declare-fun res!50644 () Bool)

(declare-fun call!10453 () Bool)

(assert (=> b!101108 (= res!50644 call!10453)))

(assert (=> b!101108 (=> (not res!50644) (not e!65828))))

(declare-fun bm!10449 () Bool)

(declare-fun call!10457 () ListLongMap!1507)

(declare-fun call!10452 () ListLongMap!1507)

(assert (=> bm!10449 (= call!10457 call!10452)))

(declare-fun b!101109 () Bool)

(declare-fun call!10455 () ListLongMap!1507)

(assert (=> b!101109 (= e!65825 call!10455)))

(declare-fun b!101110 () Bool)

(assert (=> b!101110 (= e!65823 e!65827)))

(declare-fun c!17394 () Bool)

(assert (=> b!101110 (= c!17394 (not (= (bvand (ite c!17347 (ite c!17351 (extraKeys!2335 newMap!16) lt!51074) (extraKeys!2335 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!10450 () Bool)

(declare-fun call!10456 () ListLongMap!1507)

(assert (=> bm!10450 (= call!10458 call!10456)))

(declare-fun bm!10451 () Bool)

(declare-fun c!17397 () Bool)

(assert (=> bm!10451 (= call!10456 (+!132 (ite c!17398 call!10452 (ite c!17397 call!10457 call!10455)) (ite (or c!17398 c!17397) (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 newMap!16)) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!17347 (ite c!17351 (minValue!2401 newMap!16) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16))))))))

(declare-fun b!101111 () Bool)

(declare-fun e!65824 () Bool)

(assert (=> b!101111 (= e!65824 (validKeyInArray!0 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101112 () Bool)

(declare-fun e!65831 () Bool)

(assert (=> b!101112 (= e!65831 (= (apply!94 lt!51171 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000)) (get!1302 (select (arr!2019 (_values!2505 newMap!16)) #b00000000000000000000000000000000) (dynLambda!374 (defaultEntry!2522 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101112 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2271 (_values!2505 newMap!16))))))

(assert (=> b!101112 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))))))

(declare-fun b!101113 () Bool)

(assert (=> b!101113 (= e!65829 (+!132 call!10456 (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!17347 (ite c!17351 (minValue!2401 newMap!16) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16)))))))

(declare-fun b!101114 () Bool)

(assert (=> b!101114 (= e!65830 (not call!10453))))

(declare-fun bm!10452 () Bool)

(assert (=> bm!10452 (= call!10452 (getCurrentListMapNoExtraKeys!97 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (ite c!17347 (ite c!17351 (extraKeys!2335 newMap!16) lt!51074) (extraKeys!2335 newMap!16)) (zeroValue!2401 newMap!16) (ite c!17347 (ite c!17351 (minValue!2401 newMap!16) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun b!101115 () Bool)

(declare-fun res!50645 () Bool)

(assert (=> b!101115 (=> (not res!50645) (not e!65823))))

(declare-fun e!65826 () Bool)

(assert (=> b!101115 (= res!50645 e!65826)))

(declare-fun res!50646 () Bool)

(assert (=> b!101115 (=> res!50646 e!65826)))

(assert (=> b!101115 (= res!50646 (not e!65824))))

(declare-fun res!50643 () Bool)

(assert (=> b!101115 (=> (not res!50643) (not e!65824))))

(assert (=> b!101115 (= res!50643 (bvslt #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))))))

(declare-fun b!101116 () Bool)

(assert (=> b!101116 (= e!65826 e!65831)))

(declare-fun res!50649 () Bool)

(assert (=> b!101116 (=> (not res!50649) (not e!65831))))

(assert (=> b!101116 (= res!50649 (contains!796 lt!51171 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!101116 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))))))

(declare-fun bm!10453 () Bool)

(assert (=> bm!10453 (= call!10454 (contains!796 lt!51171 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101117 () Bool)

(assert (=> b!101117 (= e!65829 e!65832)))

(assert (=> b!101117 (= c!17397 (and (not (= (bvand (ite c!17347 (ite c!17351 (extraKeys!2335 newMap!16) lt!51074) (extraKeys!2335 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!17347 (ite c!17351 (extraKeys!2335 newMap!16) lt!51074) (extraKeys!2335 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101118 () Bool)

(declare-fun e!65822 () Bool)

(assert (=> b!101118 (= e!65822 (= (apply!94 lt!51171 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!17347 (ite c!17351 (minValue!2401 newMap!16) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16))))))

(declare-fun bm!10454 () Bool)

(assert (=> bm!10454 (= call!10455 call!10457)))

(declare-fun b!101119 () Bool)

(assert (=> b!101119 (= e!65832 call!10458)))

(declare-fun b!101120 () Bool)

(assert (=> b!101120 (= e!65828 (= (apply!94 lt!51171 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2401 newMap!16)))))

(declare-fun b!101121 () Bool)

(declare-fun lt!51188 () Unit!3048)

(assert (=> b!101121 (= e!65833 lt!51188)))

(declare-fun lt!51178 () ListLongMap!1507)

(assert (=> b!101121 (= lt!51178 (getCurrentListMapNoExtraKeys!97 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (ite c!17347 (ite c!17351 (extraKeys!2335 newMap!16) lt!51074) (extraKeys!2335 newMap!16)) (zeroValue!2401 newMap!16) (ite c!17347 (ite c!17351 (minValue!2401 newMap!16) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51190 () (_ BitVec 64))

(assert (=> b!101121 (= lt!51190 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51176 () (_ BitVec 64))

(assert (=> b!101121 (= lt!51176 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51182 () Unit!3048)

(assert (=> b!101121 (= lt!51182 (addStillContains!70 lt!51178 lt!51190 (zeroValue!2401 newMap!16) lt!51176))))

(assert (=> b!101121 (contains!796 (+!132 lt!51178 (tuple2!2317 lt!51190 (zeroValue!2401 newMap!16))) lt!51176)))

(declare-fun lt!51183 () Unit!3048)

(assert (=> b!101121 (= lt!51183 lt!51182)))

(declare-fun lt!51179 () ListLongMap!1507)

(assert (=> b!101121 (= lt!51179 (getCurrentListMapNoExtraKeys!97 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (ite c!17347 (ite c!17351 (extraKeys!2335 newMap!16) lt!51074) (extraKeys!2335 newMap!16)) (zeroValue!2401 newMap!16) (ite c!17347 (ite c!17351 (minValue!2401 newMap!16) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51180 () (_ BitVec 64))

(assert (=> b!101121 (= lt!51180 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51184 () (_ BitVec 64))

(assert (=> b!101121 (= lt!51184 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51174 () Unit!3048)

(assert (=> b!101121 (= lt!51174 (addApplyDifferent!70 lt!51179 lt!51180 (ite c!17347 (ite c!17351 (minValue!2401 newMap!16) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16)) lt!51184))))

(assert (=> b!101121 (= (apply!94 (+!132 lt!51179 (tuple2!2317 lt!51180 (ite c!17347 (ite c!17351 (minValue!2401 newMap!16) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16)))) lt!51184) (apply!94 lt!51179 lt!51184))))

(declare-fun lt!51181 () Unit!3048)

(assert (=> b!101121 (= lt!51181 lt!51174)))

(declare-fun lt!51186 () ListLongMap!1507)

(assert (=> b!101121 (= lt!51186 (getCurrentListMapNoExtraKeys!97 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (ite c!17347 (ite c!17351 (extraKeys!2335 newMap!16) lt!51074) (extraKeys!2335 newMap!16)) (zeroValue!2401 newMap!16) (ite c!17347 (ite c!17351 (minValue!2401 newMap!16) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51172 () (_ BitVec 64))

(assert (=> b!101121 (= lt!51172 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51175 () (_ BitVec 64))

(assert (=> b!101121 (= lt!51175 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51187 () Unit!3048)

(assert (=> b!101121 (= lt!51187 (addApplyDifferent!70 lt!51186 lt!51172 (zeroValue!2401 newMap!16) lt!51175))))

(assert (=> b!101121 (= (apply!94 (+!132 lt!51186 (tuple2!2317 lt!51172 (zeroValue!2401 newMap!16))) lt!51175) (apply!94 lt!51186 lt!51175))))

(declare-fun lt!51173 () Unit!3048)

(assert (=> b!101121 (= lt!51173 lt!51187)))

(declare-fun lt!51170 () ListLongMap!1507)

(assert (=> b!101121 (= lt!51170 (getCurrentListMapNoExtraKeys!97 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (ite c!17347 (ite c!17351 (extraKeys!2335 newMap!16) lt!51074) (extraKeys!2335 newMap!16)) (zeroValue!2401 newMap!16) (ite c!17347 (ite c!17351 (minValue!2401 newMap!16) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51177 () (_ BitVec 64))

(assert (=> b!101121 (= lt!51177 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51189 () (_ BitVec 64))

(assert (=> b!101121 (= lt!51189 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!101121 (= lt!51188 (addApplyDifferent!70 lt!51170 lt!51177 (ite c!17347 (ite c!17351 (minValue!2401 newMap!16) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16)) lt!51189))))

(assert (=> b!101121 (= (apply!94 (+!132 lt!51170 (tuple2!2317 lt!51177 (ite c!17347 (ite c!17351 (minValue!2401 newMap!16) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2401 newMap!16)))) lt!51189) (apply!94 lt!51170 lt!51189))))

(declare-fun bm!10455 () Bool)

(assert (=> bm!10455 (= call!10453 (contains!796 lt!51171 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101122 () Bool)

(assert (=> b!101122 (= e!65834 (validKeyInArray!0 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101123 () Bool)

(assert (=> b!101123 (= e!65827 e!65822)))

(declare-fun res!50642 () Bool)

(assert (=> b!101123 (= res!50642 call!10454)))

(assert (=> b!101123 (=> (not res!50642) (not e!65822))))

(assert (= (and d!27411 c!17398) b!101113))

(assert (= (and d!27411 (not c!17398)) b!101117))

(assert (= (and b!101117 c!17397) b!101119))

(assert (= (and b!101117 (not c!17397)) b!101104))

(assert (= (and b!101104 c!17396) b!101103))

(assert (= (and b!101104 (not c!17396)) b!101109))

(assert (= (or b!101103 b!101109) bm!10454))

(assert (= (or b!101119 bm!10454) bm!10449))

(assert (= (or b!101119 b!101103) bm!10450))

(assert (= (or b!101113 bm!10449) bm!10452))

(assert (= (or b!101113 bm!10450) bm!10451))

(assert (= (and d!27411 res!50641) b!101122))

(assert (= (and d!27411 c!17395) b!101121))

(assert (= (and d!27411 (not c!17395)) b!101105))

(assert (= (and d!27411 res!50647) b!101115))

(assert (= (and b!101115 res!50643) b!101111))

(assert (= (and b!101115 (not res!50646)) b!101116))

(assert (= (and b!101116 res!50649) b!101112))

(assert (= (and b!101115 res!50645) b!101106))

(assert (= (and b!101106 c!17393) b!101108))

(assert (= (and b!101106 (not c!17393)) b!101114))

(assert (= (and b!101108 res!50644) b!101120))

(assert (= (or b!101108 b!101114) bm!10455))

(assert (= (and b!101106 res!50648) b!101110))

(assert (= (and b!101110 c!17394) b!101123))

(assert (= (and b!101110 (not c!17394)) b!101107))

(assert (= (and b!101123 res!50642) b!101118))

(assert (= (or b!101123 b!101107) bm!10453))

(declare-fun b_lambda!4531 () Bool)

(assert (=> (not b_lambda!4531) (not b!101112)))

(assert (=> b!101112 t!5570))

(declare-fun b_and!6229 () Bool)

(assert (= b_and!6225 (and (=> t!5570 result!3327) b_and!6229)))

(assert (=> b!101112 t!5572))

(declare-fun b_and!6231 () Bool)

(assert (= b_and!6227 (and (=> t!5572 result!3329) b_and!6231)))

(declare-fun m!111867 () Bool)

(assert (=> bm!10455 m!111867))

(declare-fun m!111869 () Bool)

(assert (=> b!101118 m!111869))

(declare-fun m!111871 () Bool)

(assert (=> bm!10452 m!111871))

(declare-fun m!111873 () Bool)

(assert (=> b!101113 m!111873))

(declare-fun m!111875 () Bool)

(assert (=> bm!10451 m!111875))

(declare-fun m!111877 () Bool)

(assert (=> b!101121 m!111877))

(declare-fun m!111879 () Bool)

(assert (=> b!101121 m!111879))

(declare-fun m!111881 () Bool)

(assert (=> b!101121 m!111881))

(declare-fun m!111883 () Bool)

(assert (=> b!101121 m!111883))

(assert (=> b!101121 m!111871))

(declare-fun m!111885 () Bool)

(assert (=> b!101121 m!111885))

(assert (=> b!101121 m!111753))

(declare-fun m!111887 () Bool)

(assert (=> b!101121 m!111887))

(declare-fun m!111889 () Bool)

(assert (=> b!101121 m!111889))

(declare-fun m!111891 () Bool)

(assert (=> b!101121 m!111891))

(assert (=> b!101121 m!111891))

(declare-fun m!111893 () Bool)

(assert (=> b!101121 m!111893))

(declare-fun m!111895 () Bool)

(assert (=> b!101121 m!111895))

(declare-fun m!111897 () Bool)

(assert (=> b!101121 m!111897))

(declare-fun m!111899 () Bool)

(assert (=> b!101121 m!111899))

(assert (=> b!101121 m!111897))

(declare-fun m!111901 () Bool)

(assert (=> b!101121 m!111901))

(declare-fun m!111903 () Bool)

(assert (=> b!101121 m!111903))

(assert (=> b!101121 m!111877))

(assert (=> b!101121 m!111903))

(declare-fun m!111905 () Bool)

(assert (=> b!101121 m!111905))

(assert (=> b!101111 m!111753))

(assert (=> b!101111 m!111753))

(assert (=> b!101111 m!111775))

(assert (=> b!101122 m!111753))

(assert (=> b!101122 m!111753))

(assert (=> b!101122 m!111775))

(declare-fun m!111907 () Bool)

(assert (=> b!101120 m!111907))

(assert (=> d!27411 m!111701))

(assert (=> b!101112 m!111753))

(declare-fun m!111909 () Bool)

(assert (=> b!101112 m!111909))

(assert (=> b!101112 m!111753))

(assert (=> b!101112 m!111781))

(declare-fun m!111911 () Bool)

(assert (=> b!101112 m!111911))

(assert (=> b!101112 m!111781))

(declare-fun m!111913 () Bool)

(assert (=> b!101112 m!111913))

(assert (=> b!101112 m!111911))

(declare-fun m!111915 () Bool)

(assert (=> bm!10453 m!111915))

(assert (=> b!101116 m!111753))

(assert (=> b!101116 m!111753))

(declare-fun m!111917 () Bool)

(assert (=> b!101116 m!111917))

(assert (=> bm!10418 d!27411))

(declare-fun d!27413 () Bool)

(declare-fun res!50650 () Bool)

(declare-fun e!65835 () Bool)

(assert (=> d!27413 (=> (not res!50650) (not e!65835))))

(assert (=> d!27413 (= res!50650 (simpleValid!70 (v!2833 (underlying!344 thiss!992))))))

(assert (=> d!27413 (= (valid!399 (v!2833 (underlying!344 thiss!992))) e!65835)))

(declare-fun b!101124 () Bool)

(declare-fun res!50651 () Bool)

(assert (=> b!101124 (=> (not res!50651) (not e!65835))))

(assert (=> b!101124 (= res!50651 (= (arrayCountValidKeys!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000000000 (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992))))) (_size!480 (v!2833 (underlying!344 thiss!992)))))))

(declare-fun b!101125 () Bool)

(declare-fun res!50652 () Bool)

(assert (=> b!101125 (=> (not res!50652) (not e!65835))))

(assert (=> b!101125 (= res!50652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992)))))))

(declare-fun b!101126 () Bool)

(assert (=> b!101126 (= e!65835 (arrayNoDuplicates!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000000000 Nil!1569))))

(assert (= (and d!27413 res!50650) b!101124))

(assert (= (and b!101124 res!50651) b!101125))

(assert (= (and b!101125 res!50652) b!101126))

(declare-fun m!111919 () Bool)

(assert (=> d!27413 m!111919))

(declare-fun m!111921 () Bool)

(assert (=> b!101124 m!111921))

(assert (=> b!101125 m!111407))

(declare-fun m!111923 () Bool)

(assert (=> b!101126 m!111923))

(assert (=> d!27347 d!27413))

(declare-fun d!27415 () Bool)

(declare-fun e!65837 () Bool)

(assert (=> d!27415 e!65837))

(declare-fun res!50653 () Bool)

(assert (=> d!27415 (=> res!50653 e!65837)))

(declare-fun lt!51193 () Bool)

(assert (=> d!27415 (= res!50653 (not lt!51193))))

(declare-fun lt!51195 () Bool)

(assert (=> d!27415 (= lt!51193 lt!51195)))

(declare-fun lt!51192 () Unit!3048)

(declare-fun e!65836 () Unit!3048)

(assert (=> d!27415 (= lt!51192 e!65836)))

(declare-fun c!17399 () Bool)

(assert (=> d!27415 (= c!17399 lt!51195)))

(assert (=> d!27415 (= lt!51195 (containsKey!156 (toList!769 lt!50965) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!27415 (= (contains!796 lt!50965 #b0000000000000000000000000000000000000000000000000000000000000000) lt!51193)))

(declare-fun b!101127 () Bool)

(declare-fun lt!51194 () Unit!3048)

(assert (=> b!101127 (= e!65836 lt!51194)))

(assert (=> b!101127 (= lt!51194 (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!769 lt!50965) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101127 (isDefined!105 (getValueByKey!153 (toList!769 lt!50965) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101128 () Bool)

(declare-fun Unit!3067 () Unit!3048)

(assert (=> b!101128 (= e!65836 Unit!3067)))

(declare-fun b!101129 () Bool)

(assert (=> b!101129 (= e!65837 (isDefined!105 (getValueByKey!153 (toList!769 lt!50965) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27415 c!17399) b!101127))

(assert (= (and d!27415 (not c!17399)) b!101128))

(assert (= (and d!27415 (not res!50653)) b!101129))

(declare-fun m!111925 () Bool)

(assert (=> d!27415 m!111925))

(declare-fun m!111927 () Bool)

(assert (=> b!101127 m!111927))

(declare-fun m!111929 () Bool)

(assert (=> b!101127 m!111929))

(assert (=> b!101127 m!111929))

(declare-fun m!111931 () Bool)

(assert (=> b!101127 m!111931))

(assert (=> b!101129 m!111929))

(assert (=> b!101129 m!111929))

(assert (=> b!101129 m!111931))

(assert (=> bm!10366 d!27415))

(declare-fun bm!10456 () Bool)

(declare-fun call!10459 () Bool)

(assert (=> bm!10456 (= call!10459 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4220 newMap!16) (mask!6639 newMap!16)))))

(declare-fun b!101130 () Bool)

(declare-fun e!65840 () Bool)

(declare-fun e!65838 () Bool)

(assert (=> b!101130 (= e!65840 e!65838)))

(declare-fun c!17400 () Bool)

(assert (=> b!101130 (= c!17400 (validKeyInArray!0 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101131 () Bool)

(declare-fun e!65839 () Bool)

(assert (=> b!101131 (= e!65839 call!10459)))

(declare-fun b!101132 () Bool)

(assert (=> b!101132 (= e!65838 e!65839)))

(declare-fun lt!51197 () (_ BitVec 64))

(assert (=> b!101132 (= lt!51197 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51196 () Unit!3048)

(assert (=> b!101132 (= lt!51196 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4220 newMap!16) lt!51197 #b00000000000000000000000000000000))))

(assert (=> b!101132 (arrayContainsKey!0 (_keys!4220 newMap!16) lt!51197 #b00000000000000000000000000000000)))

(declare-fun lt!51198 () Unit!3048)

(assert (=> b!101132 (= lt!51198 lt!51196)))

(declare-fun res!50654 () Bool)

(assert (=> b!101132 (= res!50654 (= (seekEntryOrOpen!0 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000) (_keys!4220 newMap!16) (mask!6639 newMap!16)) (Found!249 #b00000000000000000000000000000000)))))

(assert (=> b!101132 (=> (not res!50654) (not e!65839))))

(declare-fun d!27417 () Bool)

(declare-fun res!50655 () Bool)

(assert (=> d!27417 (=> res!50655 e!65840)))

(assert (=> d!27417 (= res!50655 (bvsge #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))))))

(assert (=> d!27417 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4220 newMap!16) (mask!6639 newMap!16)) e!65840)))

(declare-fun b!101133 () Bool)

(assert (=> b!101133 (= e!65838 call!10459)))

(assert (= (and d!27417 (not res!50655)) b!101130))

(assert (= (and b!101130 c!17400) b!101132))

(assert (= (and b!101130 (not c!17400)) b!101133))

(assert (= (and b!101132 res!50654) b!101131))

(assert (= (or b!101131 b!101133) bm!10456))

(declare-fun m!111933 () Bool)

(assert (=> bm!10456 m!111933))

(assert (=> b!101130 m!111753))

(assert (=> b!101130 m!111753))

(assert (=> b!101130 m!111775))

(assert (=> b!101132 m!111753))

(declare-fun m!111935 () Bool)

(assert (=> b!101132 m!111935))

(declare-fun m!111937 () Bool)

(assert (=> b!101132 m!111937))

(assert (=> b!101132 m!111753))

(declare-fun m!111939 () Bool)

(assert (=> b!101132 m!111939))

(assert (=> b!100736 d!27417))

(declare-fun b!101145 () Bool)

(declare-fun e!65843 () Bool)

(assert (=> b!101145 (= e!65843 (and (bvsge (extraKeys!2335 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2335 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!480 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun d!27419 () Bool)

(declare-fun res!50665 () Bool)

(assert (=> d!27419 (=> (not res!50665) (not e!65843))))

(assert (=> d!27419 (= res!50665 (validMask!0 (mask!6639 newMap!16)))))

(assert (=> d!27419 (= (simpleValid!70 newMap!16) e!65843)))

(declare-fun b!101143 () Bool)

(declare-fun res!50667 () Bool)

(assert (=> b!101143 (=> (not res!50667) (not e!65843))))

(declare-fun size!2276 (LongMapFixedSize!862) (_ BitVec 32))

(assert (=> b!101143 (= res!50667 (bvsge (size!2276 newMap!16) (_size!480 newMap!16)))))

(declare-fun b!101142 () Bool)

(declare-fun res!50664 () Bool)

(assert (=> b!101142 (=> (not res!50664) (not e!65843))))

(assert (=> b!101142 (= res!50664 (and (= (size!2271 (_values!2505 newMap!16)) (bvadd (mask!6639 newMap!16) #b00000000000000000000000000000001)) (= (size!2270 (_keys!4220 newMap!16)) (size!2271 (_values!2505 newMap!16))) (bvsge (_size!480 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!480 newMap!16) (bvadd (mask!6639 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!101144 () Bool)

(declare-fun res!50666 () Bool)

(assert (=> b!101144 (=> (not res!50666) (not e!65843))))

(assert (=> b!101144 (= res!50666 (= (size!2276 newMap!16) (bvadd (_size!480 newMap!16) (bvsdiv (bvadd (extraKeys!2335 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!27419 res!50665) b!101142))

(assert (= (and b!101142 res!50664) b!101143))

(assert (= (and b!101143 res!50667) b!101144))

(assert (= (and b!101144 res!50666) b!101145))

(assert (=> d!27419 m!111701))

(declare-fun m!111941 () Bool)

(assert (=> b!101143 m!111941))

(assert (=> b!101144 m!111941))

(assert (=> d!27341 d!27419))

(declare-fun d!27421 () Bool)

(declare-fun get!1306 (Option!159) V!3169)

(assert (=> d!27421 (= (apply!94 lt!50965 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1306 (getValueByKey!153 (toList!769 lt!50965) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4188 () Bool)

(assert (= bs!4188 d!27421))

(assert (=> bs!4188 m!111929))

(assert (=> bs!4188 m!111929))

(declare-fun m!111943 () Bool)

(assert (=> bs!4188 m!111943))

(assert (=> b!100836 d!27421))

(declare-fun d!27423 () Bool)

(declare-fun lt!51201 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!106 (List!1572) (InoxSet (_ BitVec 64)))

(assert (=> d!27423 (= lt!51201 (select (content!106 Nil!1569) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(declare-fun e!65848 () Bool)

(assert (=> d!27423 (= lt!51201 e!65848)))

(declare-fun res!50672 () Bool)

(assert (=> d!27423 (=> (not res!50672) (not e!65848))))

(assert (=> d!27423 (= res!50672 ((_ is Cons!1568) Nil!1569))))

(assert (=> d!27423 (= (contains!798 Nil!1569 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)) lt!51201)))

(declare-fun b!101150 () Bool)

(declare-fun e!65849 () Bool)

(assert (=> b!101150 (= e!65848 e!65849)))

(declare-fun res!50673 () Bool)

(assert (=> b!101150 (=> res!50673 e!65849)))

(assert (=> b!101150 (= res!50673 (= (h!2164 Nil!1569) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(declare-fun b!101151 () Bool)

(assert (=> b!101151 (= e!65849 (contains!798 (t!5558 Nil!1569) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(assert (= (and d!27423 res!50672) b!101150))

(assert (= (and b!101150 (not res!50673)) b!101151))

(declare-fun m!111945 () Bool)

(assert (=> d!27423 m!111945))

(assert (=> d!27423 m!111399))

(declare-fun m!111947 () Bool)

(assert (=> d!27423 m!111947))

(assert (=> b!101151 m!111399))

(declare-fun m!111949 () Bool)

(assert (=> b!101151 m!111949))

(assert (=> b!100776 d!27423))

(declare-fun d!27425 () Bool)

(assert (=> d!27425 (= (inRange!0 (ite c!17340 (ite c!17344 (index!3142 lt!51062) (ite c!17345 (index!3141 lt!51070) (index!3144 lt!51070))) (ite c!17343 (index!3142 lt!51061) (ite c!17346 (index!3141 lt!51060) (index!3144 lt!51060)))) (mask!6639 newMap!16)) (and (bvsge (ite c!17340 (ite c!17344 (index!3142 lt!51062) (ite c!17345 (index!3141 lt!51070) (index!3144 lt!51070))) (ite c!17343 (index!3142 lt!51061) (ite c!17346 (index!3141 lt!51060) (index!3144 lt!51060)))) #b00000000000000000000000000000000) (bvslt (ite c!17340 (ite c!17344 (index!3142 lt!51062) (ite c!17345 (index!3141 lt!51070) (index!3144 lt!51070))) (ite c!17343 (index!3142 lt!51061) (ite c!17346 (index!3141 lt!51060) (index!3144 lt!51060)))) (bvadd (mask!6639 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!10428 d!27425))

(declare-fun d!27427 () Bool)

(declare-fun res!50674 () Bool)

(declare-fun e!65850 () Bool)

(assert (=> d!27427 (=> res!50674 e!65850)))

(assert (=> d!27427 (= res!50674 (= (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(assert (=> d!27427 (= (arrayContainsKey!0 (_keys!4220 newMap!16) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) #b00000000000000000000000000000000) e!65850)))

(declare-fun b!101152 () Bool)

(declare-fun e!65851 () Bool)

(assert (=> b!101152 (= e!65850 e!65851)))

(declare-fun res!50675 () Bool)

(assert (=> b!101152 (=> (not res!50675) (not e!65851))))

(assert (=> b!101152 (= res!50675 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2270 (_keys!4220 newMap!16))))))

(declare-fun b!101153 () Bool)

(assert (=> b!101153 (= e!65851 (arrayContainsKey!0 (_keys!4220 newMap!16) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!27427 (not res!50674)) b!101152))

(assert (= (and b!101152 res!50675) b!101153))

(assert (=> d!27427 m!111753))

(assert (=> b!101153 m!111399))

(declare-fun m!111951 () Bool)

(assert (=> b!101153 m!111951))

(assert (=> bm!10417 d!27427))

(declare-fun d!27429 () Bool)

(declare-fun res!50676 () Bool)

(declare-fun e!65852 () Bool)

(assert (=> d!27429 (=> res!50676 e!65852)))

(assert (=> d!27429 (= res!50676 (= (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(assert (=> d!27429 (= (arrayContainsKey!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!65852)))

(declare-fun b!101154 () Bool)

(declare-fun e!65853 () Bool)

(assert (=> b!101154 (= e!65852 e!65853)))

(declare-fun res!50677 () Bool)

(assert (=> b!101154 (=> (not res!50677) (not e!65853))))

(assert (=> b!101154 (= res!50677 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992))))))))

(declare-fun b!101155 () Bool)

(assert (=> b!101155 (= e!65853 (arrayContainsKey!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!27429 (not res!50676)) b!101154))

(assert (= (and b!101154 res!50677) b!101155))

(declare-fun m!111953 () Bool)

(assert (=> d!27429 m!111953))

(assert (=> b!101155 m!111399))

(declare-fun m!111955 () Bool)

(assert (=> b!101155 m!111955))

(assert (=> b!100755 d!27429))

(declare-fun d!27431 () Bool)

(assert (=> d!27431 (= (get!1304 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2832 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(assert (=> b!100973 d!27431))

(declare-fun d!27433 () Bool)

(assert (=> d!27433 (= (validKeyInArray!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)) (and (not (= (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!100775 d!27433))

(declare-fun d!27435 () Bool)

(declare-fun e!65855 () Bool)

(assert (=> d!27435 e!65855))

(declare-fun res!50678 () Bool)

(assert (=> d!27435 (=> res!50678 e!65855)))

(declare-fun lt!51203 () Bool)

(assert (=> d!27435 (= res!50678 (not lt!51203))))

(declare-fun lt!51205 () Bool)

(assert (=> d!27435 (= lt!51203 lt!51205)))

(declare-fun lt!51202 () Unit!3048)

(declare-fun e!65854 () Unit!3048)

(assert (=> d!27435 (= lt!51202 e!65854)))

(declare-fun c!17401 () Bool)

(assert (=> d!27435 (= c!17401 lt!51205)))

(assert (=> d!27435 (= lt!51205 (containsKey!156 (toList!769 call!10420) (select (arr!2018 (_keys!4220 newMap!16)) (index!3142 lt!51057))))))

(assert (=> d!27435 (= (contains!796 call!10420 (select (arr!2018 (_keys!4220 newMap!16)) (index!3142 lt!51057))) lt!51203)))

(declare-fun b!101156 () Bool)

(declare-fun lt!51204 () Unit!3048)

(assert (=> b!101156 (= e!65854 lt!51204)))

(assert (=> b!101156 (= lt!51204 (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!769 call!10420) (select (arr!2018 (_keys!4220 newMap!16)) (index!3142 lt!51057))))))

(assert (=> b!101156 (isDefined!105 (getValueByKey!153 (toList!769 call!10420) (select (arr!2018 (_keys!4220 newMap!16)) (index!3142 lt!51057))))))

(declare-fun b!101157 () Bool)

(declare-fun Unit!3068 () Unit!3048)

(assert (=> b!101157 (= e!65854 Unit!3068)))

(declare-fun b!101158 () Bool)

(assert (=> b!101158 (= e!65855 (isDefined!105 (getValueByKey!153 (toList!769 call!10420) (select (arr!2018 (_keys!4220 newMap!16)) (index!3142 lt!51057)))))))

(assert (= (and d!27435 c!17401) b!101156))

(assert (= (and d!27435 (not c!17401)) b!101157))

(assert (= (and d!27435 (not res!50678)) b!101158))

(assert (=> d!27435 m!111671))

(declare-fun m!111957 () Bool)

(assert (=> d!27435 m!111957))

(assert (=> b!101156 m!111671))

(declare-fun m!111959 () Bool)

(assert (=> b!101156 m!111959))

(assert (=> b!101156 m!111671))

(declare-fun m!111961 () Bool)

(assert (=> b!101156 m!111961))

(assert (=> b!101156 m!111961))

(declare-fun m!111963 () Bool)

(assert (=> b!101156 m!111963))

(assert (=> b!101158 m!111671))

(assert (=> b!101158 m!111961))

(assert (=> b!101158 m!111961))

(assert (=> b!101158 m!111963))

(assert (=> b!100940 d!27435))

(declare-fun d!27437 () Bool)

(declare-fun e!65858 () Bool)

(assert (=> d!27437 e!65858))

(declare-fun res!50681 () Bool)

(assert (=> d!27437 (=> (not res!50681) (not e!65858))))

(assert (=> d!27437 (= res!50681 (and (bvsge (index!3142 lt!51057) #b00000000000000000000000000000000) (bvslt (index!3142 lt!51057) (size!2270 (_keys!4220 newMap!16)))))))

(declare-fun lt!51208 () Unit!3048)

(declare-fun choose!625 (array!4251 array!4253 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 32) Int) Unit!3048)

(assert (=> d!27437 (= lt!51208 (choose!625 (_keys!4220 newMap!16) lt!51075 (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (index!3142 lt!51057) (defaultEntry!2522 newMap!16)))))

(assert (=> d!27437 (validMask!0 (mask!6639 newMap!16))))

(assert (=> d!27437 (= (lemmaValidKeyInArrayIsInListMap!103 (_keys!4220 newMap!16) lt!51075 (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (index!3142 lt!51057) (defaultEntry!2522 newMap!16)) lt!51208)))

(declare-fun b!101161 () Bool)

(assert (=> b!101161 (= e!65858 (contains!796 (getCurrentListMap!457 (_keys!4220 newMap!16) lt!51075 (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) (select (arr!2018 (_keys!4220 newMap!16)) (index!3142 lt!51057))))))

(assert (= (and d!27437 res!50681) b!101161))

(declare-fun m!111965 () Bool)

(assert (=> d!27437 m!111965))

(assert (=> d!27437 m!111701))

(declare-fun m!111967 () Bool)

(assert (=> b!101161 m!111967))

(assert (=> b!101161 m!111671))

(assert (=> b!101161 m!111967))

(assert (=> b!101161 m!111671))

(declare-fun m!111969 () Bool)

(assert (=> b!101161 m!111969))

(assert (=> b!100940 d!27437))

(declare-fun b!101162 () Bool)

(declare-fun e!65862 () ListLongMap!1507)

(declare-fun call!10466 () ListLongMap!1507)

(assert (=> b!101162 (= e!65862 call!10466)))

(declare-fun b!101163 () Bool)

(declare-fun c!17405 () Bool)

(assert (=> b!101163 (= c!17405 (and (not (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!65869 () ListLongMap!1507)

(assert (=> b!101163 (= e!65869 e!65862)))

(declare-fun d!27439 () Bool)

(declare-fun e!65860 () Bool)

(assert (=> d!27439 e!65860))

(declare-fun res!50688 () Bool)

(assert (=> d!27439 (=> (not res!50688) (not e!65860))))

(assert (=> d!27439 (= res!50688 (or (bvsge #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))))))))

(declare-fun lt!51210 () ListLongMap!1507)

(declare-fun lt!51230 () ListLongMap!1507)

(assert (=> d!27439 (= lt!51210 lt!51230)))

(declare-fun lt!51224 () Unit!3048)

(declare-fun e!65870 () Unit!3048)

(assert (=> d!27439 (= lt!51224 e!65870)))

(declare-fun c!17404 () Bool)

(declare-fun e!65871 () Bool)

(assert (=> d!27439 (= c!17404 e!65871)))

(declare-fun res!50682 () Bool)

(assert (=> d!27439 (=> (not res!50682) (not e!65871))))

(assert (=> d!27439 (= res!50682 (bvslt #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))))))

(declare-fun e!65866 () ListLongMap!1507)

(assert (=> d!27439 (= lt!51230 e!65866)))

(declare-fun c!17407 () Bool)

(assert (=> d!27439 (= c!17407 (and (not (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27439 (validMask!0 (mask!6639 newMap!16))))

(assert (=> d!27439 (= (getCurrentListMap!457 (_keys!4220 newMap!16) (array!4254 (store (arr!2019 (_values!2505 newMap!16)) (index!3142 lt!51057) (ValueCellFull!977 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2271 (_values!2505 newMap!16))) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) lt!51210)))

(declare-fun b!101164 () Bool)

(declare-fun Unit!3069 () Unit!3048)

(assert (=> b!101164 (= e!65870 Unit!3069)))

(declare-fun b!101165 () Bool)

(declare-fun res!50689 () Bool)

(assert (=> b!101165 (=> (not res!50689) (not e!65860))))

(declare-fun e!65867 () Bool)

(assert (=> b!101165 (= res!50689 e!65867)))

(declare-fun c!17402 () Bool)

(assert (=> b!101165 (= c!17402 (not (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!101166 () Bool)

(declare-fun e!65864 () Bool)

(declare-fun call!10462 () Bool)

(assert (=> b!101166 (= e!65864 (not call!10462))))

(declare-fun b!101167 () Bool)

(declare-fun e!65865 () Bool)

(assert (=> b!101167 (= e!65867 e!65865)))

(declare-fun res!50685 () Bool)

(declare-fun call!10461 () Bool)

(assert (=> b!101167 (= res!50685 call!10461)))

(assert (=> b!101167 (=> (not res!50685) (not e!65865))))

(declare-fun bm!10457 () Bool)

(declare-fun call!10465 () ListLongMap!1507)

(declare-fun call!10460 () ListLongMap!1507)

(assert (=> bm!10457 (= call!10465 call!10460)))

(declare-fun b!101168 () Bool)

(declare-fun call!10463 () ListLongMap!1507)

(assert (=> b!101168 (= e!65862 call!10463)))

(declare-fun b!101169 () Bool)

(assert (=> b!101169 (= e!65860 e!65864)))

(declare-fun c!17403 () Bool)

(assert (=> b!101169 (= c!17403 (not (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!10458 () Bool)

(declare-fun call!10464 () ListLongMap!1507)

(assert (=> bm!10458 (= call!10466 call!10464)))

(declare-fun c!17406 () Bool)

(declare-fun bm!10459 () Bool)

(assert (=> bm!10459 (= call!10464 (+!132 (ite c!17407 call!10460 (ite c!17406 call!10465 call!10463)) (ite (or c!17407 c!17406) (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 newMap!16)) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 newMap!16)))))))

(declare-fun b!101170 () Bool)

(declare-fun e!65861 () Bool)

(assert (=> b!101170 (= e!65861 (validKeyInArray!0 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101171 () Bool)

(declare-fun e!65868 () Bool)

(assert (=> b!101171 (= e!65868 (= (apply!94 lt!51210 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000)) (get!1302 (select (arr!2019 (array!4254 (store (arr!2019 (_values!2505 newMap!16)) (index!3142 lt!51057) (ValueCellFull!977 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2271 (_values!2505 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!374 (defaultEntry!2522 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101171 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2271 (array!4254 (store (arr!2019 (_values!2505 newMap!16)) (index!3142 lt!51057) (ValueCellFull!977 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2271 (_values!2505 newMap!16))))))))

(assert (=> b!101171 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))))))

(declare-fun b!101172 () Bool)

(assert (=> b!101172 (= e!65866 (+!132 call!10464 (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 newMap!16))))))

(declare-fun b!101173 () Bool)

(assert (=> b!101173 (= e!65867 (not call!10461))))

(declare-fun bm!10460 () Bool)

(assert (=> bm!10460 (= call!10460 (getCurrentListMapNoExtraKeys!97 (_keys!4220 newMap!16) (array!4254 (store (arr!2019 (_values!2505 newMap!16)) (index!3142 lt!51057) (ValueCellFull!977 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2271 (_values!2505 newMap!16))) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun b!101174 () Bool)

(declare-fun res!50686 () Bool)

(assert (=> b!101174 (=> (not res!50686) (not e!65860))))

(declare-fun e!65863 () Bool)

(assert (=> b!101174 (= res!50686 e!65863)))

(declare-fun res!50687 () Bool)

(assert (=> b!101174 (=> res!50687 e!65863)))

(assert (=> b!101174 (= res!50687 (not e!65861))))

(declare-fun res!50684 () Bool)

(assert (=> b!101174 (=> (not res!50684) (not e!65861))))

(assert (=> b!101174 (= res!50684 (bvslt #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))))))

(declare-fun b!101175 () Bool)

(assert (=> b!101175 (= e!65863 e!65868)))

(declare-fun res!50690 () Bool)

(assert (=> b!101175 (=> (not res!50690) (not e!65868))))

(assert (=> b!101175 (= res!50690 (contains!796 lt!51210 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!101175 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))))))

(declare-fun bm!10461 () Bool)

(assert (=> bm!10461 (= call!10462 (contains!796 lt!51210 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101176 () Bool)

(assert (=> b!101176 (= e!65866 e!65869)))

(assert (=> b!101176 (= c!17406 (and (not (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101177 () Bool)

(declare-fun e!65859 () Bool)

(assert (=> b!101177 (= e!65859 (= (apply!94 lt!51210 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2401 newMap!16)))))

(declare-fun bm!10462 () Bool)

(assert (=> bm!10462 (= call!10463 call!10465)))

(declare-fun b!101178 () Bool)

(assert (=> b!101178 (= e!65869 call!10466)))

(declare-fun b!101179 () Bool)

(assert (=> b!101179 (= e!65865 (= (apply!94 lt!51210 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2401 newMap!16)))))

(declare-fun b!101180 () Bool)

(declare-fun lt!51227 () Unit!3048)

(assert (=> b!101180 (= e!65870 lt!51227)))

(declare-fun lt!51217 () ListLongMap!1507)

(assert (=> b!101180 (= lt!51217 (getCurrentListMapNoExtraKeys!97 (_keys!4220 newMap!16) (array!4254 (store (arr!2019 (_values!2505 newMap!16)) (index!3142 lt!51057) (ValueCellFull!977 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2271 (_values!2505 newMap!16))) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51229 () (_ BitVec 64))

(assert (=> b!101180 (= lt!51229 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51215 () (_ BitVec 64))

(assert (=> b!101180 (= lt!51215 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51221 () Unit!3048)

(assert (=> b!101180 (= lt!51221 (addStillContains!70 lt!51217 lt!51229 (zeroValue!2401 newMap!16) lt!51215))))

(assert (=> b!101180 (contains!796 (+!132 lt!51217 (tuple2!2317 lt!51229 (zeroValue!2401 newMap!16))) lt!51215)))

(declare-fun lt!51222 () Unit!3048)

(assert (=> b!101180 (= lt!51222 lt!51221)))

(declare-fun lt!51218 () ListLongMap!1507)

(assert (=> b!101180 (= lt!51218 (getCurrentListMapNoExtraKeys!97 (_keys!4220 newMap!16) (array!4254 (store (arr!2019 (_values!2505 newMap!16)) (index!3142 lt!51057) (ValueCellFull!977 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2271 (_values!2505 newMap!16))) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51219 () (_ BitVec 64))

(assert (=> b!101180 (= lt!51219 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51223 () (_ BitVec 64))

(assert (=> b!101180 (= lt!51223 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51213 () Unit!3048)

(assert (=> b!101180 (= lt!51213 (addApplyDifferent!70 lt!51218 lt!51219 (minValue!2401 newMap!16) lt!51223))))

(assert (=> b!101180 (= (apply!94 (+!132 lt!51218 (tuple2!2317 lt!51219 (minValue!2401 newMap!16))) lt!51223) (apply!94 lt!51218 lt!51223))))

(declare-fun lt!51220 () Unit!3048)

(assert (=> b!101180 (= lt!51220 lt!51213)))

(declare-fun lt!51225 () ListLongMap!1507)

(assert (=> b!101180 (= lt!51225 (getCurrentListMapNoExtraKeys!97 (_keys!4220 newMap!16) (array!4254 (store (arr!2019 (_values!2505 newMap!16)) (index!3142 lt!51057) (ValueCellFull!977 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2271 (_values!2505 newMap!16))) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51211 () (_ BitVec 64))

(assert (=> b!101180 (= lt!51211 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51214 () (_ BitVec 64))

(assert (=> b!101180 (= lt!51214 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51226 () Unit!3048)

(assert (=> b!101180 (= lt!51226 (addApplyDifferent!70 lt!51225 lt!51211 (zeroValue!2401 newMap!16) lt!51214))))

(assert (=> b!101180 (= (apply!94 (+!132 lt!51225 (tuple2!2317 lt!51211 (zeroValue!2401 newMap!16))) lt!51214) (apply!94 lt!51225 lt!51214))))

(declare-fun lt!51212 () Unit!3048)

(assert (=> b!101180 (= lt!51212 lt!51226)))

(declare-fun lt!51209 () ListLongMap!1507)

(assert (=> b!101180 (= lt!51209 (getCurrentListMapNoExtraKeys!97 (_keys!4220 newMap!16) (array!4254 (store (arr!2019 (_values!2505 newMap!16)) (index!3142 lt!51057) (ValueCellFull!977 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2271 (_values!2505 newMap!16))) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51216 () (_ BitVec 64))

(assert (=> b!101180 (= lt!51216 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51228 () (_ BitVec 64))

(assert (=> b!101180 (= lt!51228 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!101180 (= lt!51227 (addApplyDifferent!70 lt!51209 lt!51216 (minValue!2401 newMap!16) lt!51228))))

(assert (=> b!101180 (= (apply!94 (+!132 lt!51209 (tuple2!2317 lt!51216 (minValue!2401 newMap!16))) lt!51228) (apply!94 lt!51209 lt!51228))))

(declare-fun bm!10463 () Bool)

(assert (=> bm!10463 (= call!10461 (contains!796 lt!51210 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101181 () Bool)

(assert (=> b!101181 (= e!65871 (validKeyInArray!0 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101182 () Bool)

(assert (=> b!101182 (= e!65864 e!65859)))

(declare-fun res!50683 () Bool)

(assert (=> b!101182 (= res!50683 call!10462)))

(assert (=> b!101182 (=> (not res!50683) (not e!65859))))

(assert (= (and d!27439 c!17407) b!101172))

(assert (= (and d!27439 (not c!17407)) b!101176))

(assert (= (and b!101176 c!17406) b!101178))

(assert (= (and b!101176 (not c!17406)) b!101163))

(assert (= (and b!101163 c!17405) b!101162))

(assert (= (and b!101163 (not c!17405)) b!101168))

(assert (= (or b!101162 b!101168) bm!10462))

(assert (= (or b!101178 bm!10462) bm!10457))

(assert (= (or b!101178 b!101162) bm!10458))

(assert (= (or b!101172 bm!10457) bm!10460))

(assert (= (or b!101172 bm!10458) bm!10459))

(assert (= (and d!27439 res!50682) b!101181))

(assert (= (and d!27439 c!17404) b!101180))

(assert (= (and d!27439 (not c!17404)) b!101164))

(assert (= (and d!27439 res!50688) b!101174))

(assert (= (and b!101174 res!50684) b!101170))

(assert (= (and b!101174 (not res!50687)) b!101175))

(assert (= (and b!101175 res!50690) b!101171))

(assert (= (and b!101174 res!50686) b!101165))

(assert (= (and b!101165 c!17402) b!101167))

(assert (= (and b!101165 (not c!17402)) b!101173))

(assert (= (and b!101167 res!50685) b!101179))

(assert (= (or b!101167 b!101173) bm!10463))

(assert (= (and b!101165 res!50689) b!101169))

(assert (= (and b!101169 c!17403) b!101182))

(assert (= (and b!101169 (not c!17403)) b!101166))

(assert (= (and b!101182 res!50683) b!101177))

(assert (= (or b!101182 b!101166) bm!10461))

(declare-fun b_lambda!4533 () Bool)

(assert (=> (not b_lambda!4533) (not b!101171)))

(assert (=> b!101171 t!5570))

(declare-fun b_and!6233 () Bool)

(assert (= b_and!6229 (and (=> t!5570 result!3327) b_and!6233)))

(assert (=> b!101171 t!5572))

(declare-fun b_and!6235 () Bool)

(assert (= b_and!6231 (and (=> t!5572 result!3329) b_and!6235)))

(declare-fun m!111971 () Bool)

(assert (=> bm!10463 m!111971))

(declare-fun m!111973 () Bool)

(assert (=> b!101177 m!111973))

(declare-fun m!111975 () Bool)

(assert (=> bm!10460 m!111975))

(declare-fun m!111977 () Bool)

(assert (=> b!101172 m!111977))

(declare-fun m!111979 () Bool)

(assert (=> bm!10459 m!111979))

(declare-fun m!111981 () Bool)

(assert (=> b!101180 m!111981))

(declare-fun m!111983 () Bool)

(assert (=> b!101180 m!111983))

(declare-fun m!111985 () Bool)

(assert (=> b!101180 m!111985))

(declare-fun m!111987 () Bool)

(assert (=> b!101180 m!111987))

(assert (=> b!101180 m!111975))

(declare-fun m!111989 () Bool)

(assert (=> b!101180 m!111989))

(assert (=> b!101180 m!111753))

(declare-fun m!111991 () Bool)

(assert (=> b!101180 m!111991))

(declare-fun m!111993 () Bool)

(assert (=> b!101180 m!111993))

(declare-fun m!111995 () Bool)

(assert (=> b!101180 m!111995))

(assert (=> b!101180 m!111995))

(declare-fun m!111997 () Bool)

(assert (=> b!101180 m!111997))

(declare-fun m!111999 () Bool)

(assert (=> b!101180 m!111999))

(declare-fun m!112001 () Bool)

(assert (=> b!101180 m!112001))

(declare-fun m!112003 () Bool)

(assert (=> b!101180 m!112003))

(assert (=> b!101180 m!112001))

(declare-fun m!112005 () Bool)

(assert (=> b!101180 m!112005))

(declare-fun m!112007 () Bool)

(assert (=> b!101180 m!112007))

(assert (=> b!101180 m!111981))

(assert (=> b!101180 m!112007))

(declare-fun m!112009 () Bool)

(assert (=> b!101180 m!112009))

(assert (=> b!101170 m!111753))

(assert (=> b!101170 m!111753))

(assert (=> b!101170 m!111775))

(assert (=> b!101181 m!111753))

(assert (=> b!101181 m!111753))

(assert (=> b!101181 m!111775))

(declare-fun m!112011 () Bool)

(assert (=> b!101179 m!112011))

(assert (=> d!27439 m!111701))

(assert (=> b!101171 m!111753))

(declare-fun m!112013 () Bool)

(assert (=> b!101171 m!112013))

(assert (=> b!101171 m!111753))

(assert (=> b!101171 m!111781))

(declare-fun m!112015 () Bool)

(assert (=> b!101171 m!112015))

(assert (=> b!101171 m!111781))

(declare-fun m!112017 () Bool)

(assert (=> b!101171 m!112017))

(assert (=> b!101171 m!112015))

(declare-fun m!112019 () Bool)

(assert (=> bm!10461 m!112019))

(assert (=> b!101175 m!111753))

(assert (=> b!101175 m!111753))

(declare-fun m!112021 () Bool)

(assert (=> b!101175 m!112021))

(assert (=> b!100940 d!27439))

(declare-fun d!27441 () Bool)

(declare-fun e!65874 () Bool)

(assert (=> d!27441 e!65874))

(declare-fun res!50693 () Bool)

(assert (=> d!27441 (=> (not res!50693) (not e!65874))))

(assert (=> d!27441 (= res!50693 (and (bvsge (index!3142 lt!51057) #b00000000000000000000000000000000) (bvslt (index!3142 lt!51057) (size!2271 (_values!2505 newMap!16)))))))

(declare-fun lt!51233 () Unit!3048)

(declare-fun choose!626 (array!4251 array!4253 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 32) (_ BitVec 64) V!3169 Int) Unit!3048)

(assert (=> d!27441 (= lt!51233 (choose!626 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (index!3142 lt!51057) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2522 newMap!16)))))

(assert (=> d!27441 (validMask!0 (mask!6639 newMap!16))))

(assert (=> d!27441 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!43 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (index!3142 lt!51057) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2522 newMap!16)) lt!51233)))

(declare-fun b!101185 () Bool)

(assert (=> b!101185 (= e!65874 (= (+!132 (getCurrentListMap!457 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!457 (_keys!4220 newMap!16) (array!4254 (store (arr!2019 (_values!2505 newMap!16)) (index!3142 lt!51057) (ValueCellFull!977 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2271 (_values!2505 newMap!16))) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16))))))

(assert (= (and d!27441 res!50693) b!101185))

(assert (=> d!27441 m!111399))

(assert (=> d!27441 m!111397))

(declare-fun m!112023 () Bool)

(assert (=> d!27441 m!112023))

(assert (=> d!27441 m!111701))

(assert (=> b!101185 m!111569))

(assert (=> b!101185 m!111569))

(declare-fun m!112025 () Bool)

(assert (=> b!101185 m!112025))

(assert (=> b!101185 m!111679))

(assert (=> b!101185 m!111681))

(assert (=> b!100940 d!27441))

(declare-fun b!101202 () Bool)

(declare-fun e!65885 () Bool)

(declare-fun e!65883 () Bool)

(assert (=> b!101202 (= e!65885 e!65883)))

(declare-fun res!50705 () Bool)

(declare-fun call!10471 () Bool)

(assert (=> b!101202 (= res!50705 call!10471)))

(assert (=> b!101202 (=> (not res!50705) (not e!65883))))

(declare-fun b!101203 () Bool)

(declare-fun lt!51239 () SeekEntryResult!249)

(assert (=> b!101203 (and (bvsge (index!3141 lt!51239) #b00000000000000000000000000000000) (bvslt (index!3141 lt!51239) (size!2270 (_keys!4220 newMap!16))))))

(declare-fun res!50703 () Bool)

(assert (=> b!101203 (= res!50703 (= (select (arr!2018 (_keys!4220 newMap!16)) (index!3141 lt!51239)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101203 (=> (not res!50703) (not e!65883))))

(declare-fun d!27443 () Bool)

(assert (=> d!27443 e!65885))

(declare-fun c!17412 () Bool)

(assert (=> d!27443 (= c!17412 ((_ is MissingZero!249) lt!51239))))

(assert (=> d!27443 (= lt!51239 (seekEntryOrOpen!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (_keys!4220 newMap!16) (mask!6639 newMap!16)))))

(declare-fun lt!51238 () Unit!3048)

(declare-fun choose!627 (array!4251 array!4253 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 64) Int) Unit!3048)

(assert (=> d!27443 (= lt!51238 (choose!627 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (defaultEntry!2522 newMap!16)))))

(assert (=> d!27443 (validMask!0 (mask!6639 newMap!16))))

(assert (=> d!27443 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!43 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (defaultEntry!2522 newMap!16)) lt!51238)))

(declare-fun b!101204 () Bool)

(declare-fun res!50704 () Bool)

(declare-fun e!65884 () Bool)

(assert (=> b!101204 (=> (not res!50704) (not e!65884))))

(assert (=> b!101204 (= res!50704 call!10471)))

(declare-fun e!65886 () Bool)

(assert (=> b!101204 (= e!65886 e!65884)))

(declare-fun b!101205 () Bool)

(declare-fun call!10472 () Bool)

(assert (=> b!101205 (= e!65884 (not call!10472))))

(declare-fun b!101206 () Bool)

(assert (=> b!101206 (= e!65885 e!65886)))

(declare-fun c!17413 () Bool)

(assert (=> b!101206 (= c!17413 ((_ is MissingVacant!249) lt!51239))))

(declare-fun b!101207 () Bool)

(assert (=> b!101207 (= e!65883 (not call!10472))))

(declare-fun bm!10468 () Bool)

(assert (=> bm!10468 (= call!10471 (inRange!0 (ite c!17412 (index!3141 lt!51239) (index!3144 lt!51239)) (mask!6639 newMap!16)))))

(declare-fun bm!10469 () Bool)

(assert (=> bm!10469 (= call!10472 (arrayContainsKey!0 (_keys!4220 newMap!16) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!101208 () Bool)

(assert (=> b!101208 (= e!65886 ((_ is Undefined!249) lt!51239))))

(declare-fun b!101209 () Bool)

(declare-fun res!50702 () Bool)

(assert (=> b!101209 (=> (not res!50702) (not e!65884))))

(assert (=> b!101209 (= res!50702 (= (select (arr!2018 (_keys!4220 newMap!16)) (index!3144 lt!51239)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101209 (and (bvsge (index!3144 lt!51239) #b00000000000000000000000000000000) (bvslt (index!3144 lt!51239) (size!2270 (_keys!4220 newMap!16))))))

(assert (= (and d!27443 c!17412) b!101202))

(assert (= (and d!27443 (not c!17412)) b!101206))

(assert (= (and b!101202 res!50705) b!101203))

(assert (= (and b!101203 res!50703) b!101207))

(assert (= (and b!101206 c!17413) b!101204))

(assert (= (and b!101206 (not c!17413)) b!101208))

(assert (= (and b!101204 res!50704) b!101209))

(assert (= (and b!101209 res!50702) b!101205))

(assert (= (or b!101202 b!101204) bm!10468))

(assert (= (or b!101207 b!101205) bm!10469))

(declare-fun m!112027 () Bool)

(assert (=> b!101209 m!112027))

(assert (=> d!27443 m!111399))

(assert (=> d!27443 m!111647))

(assert (=> d!27443 m!111399))

(declare-fun m!112029 () Bool)

(assert (=> d!27443 m!112029))

(assert (=> d!27443 m!111701))

(assert (=> bm!10469 m!111399))

(assert (=> bm!10469 m!111635))

(declare-fun m!112031 () Bool)

(assert (=> b!101203 m!112031))

(declare-fun m!112033 () Bool)

(assert (=> bm!10468 m!112033))

(assert (=> bm!10420 d!27443))

(declare-fun d!27445 () Bool)

(declare-fun e!65889 () Bool)

(assert (=> d!27445 e!65889))

(declare-fun c!17416 () Bool)

(assert (=> d!27445 (= c!17416 (and (not (= (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!27445 true))

(declare-fun _$29!132 () Unit!3048)

(assert (=> d!27445 (= (choose!622 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (_values!2505 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992))) (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) (zeroValue!2401 (v!2833 (underlying!344 thiss!992))) (minValue!2401 (v!2833 (underlying!344 thiss!992))) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2833 (underlying!344 thiss!992)))) _$29!132)))

(declare-fun b!101214 () Bool)

(assert (=> b!101214 (= e!65889 (arrayContainsKey!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!101215 () Bool)

(assert (=> b!101215 (= e!65889 (ite (= (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2335 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!27445 c!17416) b!101214))

(assert (= (and d!27445 (not c!17416)) b!101215))

(assert (=> b!101214 m!111399))

(assert (=> b!101214 m!111415))

(assert (=> d!27361 d!27445))

(assert (=> d!27361 d!27339))

(declare-fun d!27447 () Bool)

(declare-fun res!50706 () Bool)

(declare-fun e!65890 () Bool)

(assert (=> d!27447 (=> (not res!50706) (not e!65890))))

(assert (=> d!27447 (= res!50706 (simpleValid!70 (_2!1168 lt!51064)))))

(assert (=> d!27447 (= (valid!399 (_2!1168 lt!51064)) e!65890)))

(declare-fun b!101216 () Bool)

(declare-fun res!50707 () Bool)

(assert (=> b!101216 (=> (not res!50707) (not e!65890))))

(assert (=> b!101216 (= res!50707 (= (arrayCountValidKeys!0 (_keys!4220 (_2!1168 lt!51064)) #b00000000000000000000000000000000 (size!2270 (_keys!4220 (_2!1168 lt!51064)))) (_size!480 (_2!1168 lt!51064))))))

(declare-fun b!101217 () Bool)

(declare-fun res!50708 () Bool)

(assert (=> b!101217 (=> (not res!50708) (not e!65890))))

(assert (=> b!101217 (= res!50708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4220 (_2!1168 lt!51064)) (mask!6639 (_2!1168 lt!51064))))))

(declare-fun b!101218 () Bool)

(assert (=> b!101218 (= e!65890 (arrayNoDuplicates!0 (_keys!4220 (_2!1168 lt!51064)) #b00000000000000000000000000000000 Nil!1569))))

(assert (= (and d!27447 res!50706) b!101216))

(assert (= (and b!101216 res!50707) b!101217))

(assert (= (and b!101217 res!50708) b!101218))

(declare-fun m!112035 () Bool)

(assert (=> d!27447 m!112035))

(declare-fun m!112037 () Bool)

(assert (=> b!101216 m!112037))

(declare-fun m!112039 () Bool)

(assert (=> b!101217 m!112039))

(declare-fun m!112041 () Bool)

(assert (=> b!101218 m!112041))

(assert (=> d!27371 d!27447))

(assert (=> d!27371 d!27341))

(assert (=> d!27357 d!27363))

(declare-fun d!27449 () Bool)

(assert (=> d!27449 (arrayNoDuplicates!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) from!355 Nil!1569)))

(assert (=> d!27449 true))

(declare-fun _$71!138 () Unit!3048)

(assert (=> d!27449 (= (choose!39 (_keys!4220 (v!2833 (underlying!344 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!138)))

(declare-fun bs!4189 () Bool)

(assert (= bs!4189 d!27449))

(assert (=> bs!4189 m!111411))

(assert (=> d!27357 d!27449))

(declare-fun d!27451 () Bool)

(declare-fun e!65891 () Bool)

(assert (=> d!27451 e!65891))

(declare-fun res!50710 () Bool)

(assert (=> d!27451 (=> (not res!50710) (not e!65891))))

(declare-fun lt!51243 () ListLongMap!1507)

(assert (=> d!27451 (= res!50710 (contains!796 lt!51243 (_1!1169 (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!51242 () List!1571)

(assert (=> d!27451 (= lt!51243 (ListLongMap!1508 lt!51242))))

(declare-fun lt!51241 () Unit!3048)

(declare-fun lt!51240 () Unit!3048)

(assert (=> d!27451 (= lt!51241 lt!51240)))

(assert (=> d!27451 (= (getValueByKey!153 lt!51242 (_1!1169 (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!158 (_2!1169 (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!27451 (= lt!51240 (lemmaContainsTupThenGetReturnValue!69 lt!51242 (_1!1169 (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1169 (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!27451 (= lt!51242 (insertStrictlySorted!72 (toList!769 call!10421) (_1!1169 (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1169 (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!27451 (= (+!132 call!10421 (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!51243)))

(declare-fun b!101219 () Bool)

(declare-fun res!50709 () Bool)

(assert (=> b!101219 (=> (not res!50709) (not e!65891))))

(assert (=> b!101219 (= res!50709 (= (getValueByKey!153 (toList!769 lt!51243) (_1!1169 (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!158 (_2!1169 (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!101220 () Bool)

(assert (=> b!101220 (= e!65891 (contains!799 (toList!769 lt!51243) (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!27451 res!50710) b!101219))

(assert (= (and b!101219 res!50709) b!101220))

(declare-fun m!112043 () Bool)

(assert (=> d!27451 m!112043))

(declare-fun m!112045 () Bool)

(assert (=> d!27451 m!112045))

(declare-fun m!112047 () Bool)

(assert (=> d!27451 m!112047))

(declare-fun m!112049 () Bool)

(assert (=> d!27451 m!112049))

(declare-fun m!112051 () Bool)

(assert (=> b!101219 m!112051))

(declare-fun m!112053 () Bool)

(assert (=> b!101220 m!112053))

(assert (=> b!100965 d!27451))

(declare-fun d!27453 () Bool)

(declare-fun e!65893 () Bool)

(assert (=> d!27453 e!65893))

(declare-fun res!50711 () Bool)

(assert (=> d!27453 (=> res!50711 e!65893)))

(declare-fun lt!51245 () Bool)

(assert (=> d!27453 (= res!50711 (not lt!51245))))

(declare-fun lt!51247 () Bool)

(assert (=> d!27453 (= lt!51245 lt!51247)))

(declare-fun lt!51244 () Unit!3048)

(declare-fun e!65892 () Unit!3048)

(assert (=> d!27453 (= lt!51244 e!65892)))

(declare-fun c!17417 () Bool)

(assert (=> d!27453 (= c!17417 lt!51247)))

(assert (=> d!27453 (= lt!51247 (containsKey!156 (toList!769 call!10427) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(assert (=> d!27453 (= (contains!796 call!10427 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)) lt!51245)))

(declare-fun b!101221 () Bool)

(declare-fun lt!51246 () Unit!3048)

(assert (=> b!101221 (= e!65892 lt!51246)))

(assert (=> b!101221 (= lt!51246 (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!769 call!10427) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(assert (=> b!101221 (isDefined!105 (getValueByKey!153 (toList!769 call!10427) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(declare-fun b!101222 () Bool)

(declare-fun Unit!3070 () Unit!3048)

(assert (=> b!101222 (= e!65892 Unit!3070)))

(declare-fun b!101223 () Bool)

(assert (=> b!101223 (= e!65893 (isDefined!105 (getValueByKey!153 (toList!769 call!10427) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355))))))

(assert (= (and d!27453 c!17417) b!101221))

(assert (= (and d!27453 (not c!17417)) b!101222))

(assert (= (and d!27453 (not res!50711)) b!101223))

(assert (=> d!27453 m!111399))

(declare-fun m!112055 () Bool)

(assert (=> d!27453 m!112055))

(assert (=> b!101221 m!111399))

(declare-fun m!112057 () Bool)

(assert (=> b!101221 m!112057))

(assert (=> b!101221 m!111399))

(declare-fun m!112059 () Bool)

(assert (=> b!101221 m!112059))

(assert (=> b!101221 m!112059))

(declare-fun m!112061 () Bool)

(assert (=> b!101221 m!112061))

(assert (=> b!101223 m!111399))

(assert (=> b!101223 m!112059))

(assert (=> b!101223 m!112059))

(assert (=> b!101223 m!112061))

(assert (=> b!100951 d!27453))

(declare-fun bm!10470 () Bool)

(declare-fun call!10473 () Bool)

(assert (=> bm!10470 (= call!10473 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4220 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992)))))))

(declare-fun b!101224 () Bool)

(declare-fun e!65896 () Bool)

(declare-fun e!65894 () Bool)

(assert (=> b!101224 (= e!65896 e!65894)))

(declare-fun c!17418 () Bool)

(assert (=> b!101224 (= c!17418 (validKeyInArray!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!101225 () Bool)

(declare-fun e!65895 () Bool)

(assert (=> b!101225 (= e!65895 call!10473)))

(declare-fun b!101226 () Bool)

(assert (=> b!101226 (= e!65894 e!65895)))

(declare-fun lt!51249 () (_ BitVec 64))

(assert (=> b!101226 (= lt!51249 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!51248 () Unit!3048)

(assert (=> b!101226 (= lt!51248 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) lt!51249 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!101226 (arrayContainsKey!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) lt!51249 #b00000000000000000000000000000000)))

(declare-fun lt!51250 () Unit!3048)

(assert (=> b!101226 (= lt!51250 lt!51248)))

(declare-fun res!50712 () Bool)

(assert (=> b!101226 (= res!50712 (= (seekEntryOrOpen!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4220 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992)))) (Found!249 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!101226 (=> (not res!50712) (not e!65895))))

(declare-fun d!27455 () Bool)

(declare-fun res!50713 () Bool)

(assert (=> d!27455 (=> res!50713 e!65896)))

(assert (=> d!27455 (= res!50713 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992))))))))

(assert (=> d!27455 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4220 (v!2833 (underlying!344 thiss!992))) (mask!6639 (v!2833 (underlying!344 thiss!992)))) e!65896)))

(declare-fun b!101227 () Bool)

(assert (=> b!101227 (= e!65894 call!10473)))

(assert (= (and d!27455 (not res!50713)) b!101224))

(assert (= (and b!101224 c!17418) b!101226))

(assert (= (and b!101224 (not c!17418)) b!101227))

(assert (= (and b!101226 res!50712) b!101225))

(assert (= (or b!101225 b!101227) bm!10470))

(declare-fun m!112063 () Bool)

(assert (=> bm!10470 m!112063))

(declare-fun m!112065 () Bool)

(assert (=> b!101224 m!112065))

(assert (=> b!101224 m!112065))

(declare-fun m!112067 () Bool)

(assert (=> b!101224 m!112067))

(assert (=> b!101226 m!112065))

(declare-fun m!112069 () Bool)

(assert (=> b!101226 m!112069))

(declare-fun m!112071 () Bool)

(assert (=> b!101226 m!112071))

(assert (=> b!101226 m!112065))

(declare-fun m!112073 () Bool)

(assert (=> b!101226 m!112073))

(assert (=> bm!10342 d!27455))

(declare-fun d!27457 () Bool)

(assert (=> d!27457 (= (map!1259 (ite c!17348 (_2!1168 lt!51064) newMap!16)) (getCurrentListMap!457 (_keys!4220 (ite c!17348 (_2!1168 lt!51064) newMap!16)) (_values!2505 (ite c!17348 (_2!1168 lt!51064) newMap!16)) (mask!6639 (ite c!17348 (_2!1168 lt!51064) newMap!16)) (extraKeys!2335 (ite c!17348 (_2!1168 lt!51064) newMap!16)) (zeroValue!2401 (ite c!17348 (_2!1168 lt!51064) newMap!16)) (minValue!2401 (ite c!17348 (_2!1168 lt!51064) newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2522 (ite c!17348 (_2!1168 lt!51064) newMap!16))))))

(declare-fun bs!4190 () Bool)

(assert (= bs!4190 d!27457))

(declare-fun m!112075 () Bool)

(assert (=> bs!4190 m!112075))

(assert (=> bm!10424 d!27457))

(assert (=> b!100760 d!27359))

(declare-fun d!27459 () Bool)

(assert (=> d!27459 (= (apply!94 lt!50965 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1306 (getValueByKey!153 (toList!769 lt!50965) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!4191 () Bool)

(assert (= bs!4191 d!27459))

(assert (=> bs!4191 m!111557))

(assert (=> bs!4191 m!111831))

(assert (=> bs!4191 m!111831))

(declare-fun m!112077 () Bool)

(assert (=> bs!4191 m!112077))

(assert (=> b!100828 d!27459))

(declare-fun d!27461 () Bool)

(declare-fun c!17419 () Bool)

(assert (=> d!27461 (= c!17419 ((_ is ValueCellFull!977) (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!65897 () V!3169)

(assert (=> d!27461 (= (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!65897)))

(declare-fun b!101228 () Bool)

(assert (=> b!101228 (= e!65897 (get!1304 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101229 () Bool)

(assert (=> b!101229 (= e!65897 (get!1305 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27461 c!17419) b!101228))

(assert (= (and d!27461 (not c!17419)) b!101229))

(assert (=> b!101228 m!111617))

(assert (=> b!101228 m!111395))

(declare-fun m!112079 () Bool)

(assert (=> b!101228 m!112079))

(assert (=> b!101229 m!111617))

(assert (=> b!101229 m!111395))

(declare-fun m!112081 () Bool)

(assert (=> b!101229 m!112081))

(assert (=> b!100828 d!27461))

(declare-fun d!27463 () Bool)

(declare-fun e!65898 () Bool)

(assert (=> d!27463 e!65898))

(declare-fun res!50715 () Bool)

(assert (=> d!27463 (=> (not res!50715) (not e!65898))))

(declare-fun lt!51254 () ListLongMap!1507)

(assert (=> d!27463 (= res!50715 (contains!796 lt!51254 (_1!1169 (ite (or c!17309 c!17308) (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2833 (underlying!344 thiss!992))))))))))

(declare-fun lt!51253 () List!1571)

(assert (=> d!27463 (= lt!51254 (ListLongMap!1508 lt!51253))))

(declare-fun lt!51252 () Unit!3048)

(declare-fun lt!51251 () Unit!3048)

(assert (=> d!27463 (= lt!51252 lt!51251)))

(assert (=> d!27463 (= (getValueByKey!153 lt!51253 (_1!1169 (ite (or c!17309 c!17308) (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2833 (underlying!344 thiss!992))))))) (Some!158 (_2!1169 (ite (or c!17309 c!17308) (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2833 (underlying!344 thiss!992))))))))))

(assert (=> d!27463 (= lt!51251 (lemmaContainsTupThenGetReturnValue!69 lt!51253 (_1!1169 (ite (or c!17309 c!17308) (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))) (_2!1169 (ite (or c!17309 c!17308) (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2833 (underlying!344 thiss!992))))))))))

(assert (=> d!27463 (= lt!51253 (insertStrictlySorted!72 (toList!769 (ite c!17309 call!10363 (ite c!17308 call!10368 call!10366))) (_1!1169 (ite (or c!17309 c!17308) (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))) (_2!1169 (ite (or c!17309 c!17308) (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2833 (underlying!344 thiss!992))))))))))

(assert (=> d!27463 (= (+!132 (ite c!17309 call!10363 (ite c!17308 call!10368 call!10366)) (ite (or c!17309 c!17308) (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))) lt!51254)))

(declare-fun b!101230 () Bool)

(declare-fun res!50714 () Bool)

(assert (=> b!101230 (=> (not res!50714) (not e!65898))))

(assert (=> b!101230 (= res!50714 (= (getValueByKey!153 (toList!769 lt!51254) (_1!1169 (ite (or c!17309 c!17308) (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2833 (underlying!344 thiss!992))))))) (Some!158 (_2!1169 (ite (or c!17309 c!17308) (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))))))))

(declare-fun b!101231 () Bool)

(assert (=> b!101231 (= e!65898 (contains!799 (toList!769 lt!51254) (ite (or c!17309 c!17308) (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))))))

(assert (= (and d!27463 res!50715) b!101230))

(assert (= (and b!101230 res!50714) b!101231))

(declare-fun m!112083 () Bool)

(assert (=> d!27463 m!112083))

(declare-fun m!112085 () Bool)

(assert (=> d!27463 m!112085))

(declare-fun m!112087 () Bool)

(assert (=> d!27463 m!112087))

(declare-fun m!112089 () Bool)

(assert (=> d!27463 m!112089))

(declare-fun m!112091 () Bool)

(assert (=> b!101230 m!112091))

(declare-fun m!112093 () Bool)

(assert (=> b!101231 m!112093))

(assert (=> bm!10362 d!27463))

(declare-fun b!101232 () Bool)

(declare-fun e!65902 () ListLongMap!1507)

(declare-fun call!10480 () ListLongMap!1507)

(assert (=> b!101232 (= e!65902 call!10480)))

(declare-fun b!101233 () Bool)

(declare-fun c!17423 () Bool)

(assert (=> b!101233 (= c!17423 (and (not (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!65909 () ListLongMap!1507)

(assert (=> b!101233 (= e!65909 e!65902)))

(declare-fun d!27465 () Bool)

(declare-fun e!65900 () Bool)

(assert (=> d!27465 e!65900))

(declare-fun res!50722 () Bool)

(assert (=> d!27465 (=> (not res!50722) (not e!65900))))

(assert (=> d!27465 (= res!50722 (or (bvsge #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))))))))

(declare-fun lt!51256 () ListLongMap!1507)

(declare-fun lt!51276 () ListLongMap!1507)

(assert (=> d!27465 (= lt!51256 lt!51276)))

(declare-fun lt!51270 () Unit!3048)

(declare-fun e!65910 () Unit!3048)

(assert (=> d!27465 (= lt!51270 e!65910)))

(declare-fun c!17422 () Bool)

(declare-fun e!65911 () Bool)

(assert (=> d!27465 (= c!17422 e!65911)))

(declare-fun res!50716 () Bool)

(assert (=> d!27465 (=> (not res!50716) (not e!65911))))

(assert (=> d!27465 (= res!50716 (bvslt #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))))))

(declare-fun e!65906 () ListLongMap!1507)

(assert (=> d!27465 (= lt!51276 e!65906)))

(declare-fun c!17425 () Bool)

(assert (=> d!27465 (= c!17425 (and (not (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27465 (validMask!0 (mask!6639 newMap!16))))

(assert (=> d!27465 (= (getCurrentListMap!457 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) lt!51256)))

(declare-fun b!101234 () Bool)

(declare-fun Unit!3071 () Unit!3048)

(assert (=> b!101234 (= e!65910 Unit!3071)))

(declare-fun b!101235 () Bool)

(declare-fun res!50723 () Bool)

(assert (=> b!101235 (=> (not res!50723) (not e!65900))))

(declare-fun e!65907 () Bool)

(assert (=> b!101235 (= res!50723 e!65907)))

(declare-fun c!17420 () Bool)

(assert (=> b!101235 (= c!17420 (not (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!101236 () Bool)

(declare-fun e!65904 () Bool)

(declare-fun call!10476 () Bool)

(assert (=> b!101236 (= e!65904 (not call!10476))))

(declare-fun b!101237 () Bool)

(declare-fun e!65905 () Bool)

(assert (=> b!101237 (= e!65907 e!65905)))

(declare-fun res!50719 () Bool)

(declare-fun call!10475 () Bool)

(assert (=> b!101237 (= res!50719 call!10475)))

(assert (=> b!101237 (=> (not res!50719) (not e!65905))))

(declare-fun bm!10471 () Bool)

(declare-fun call!10479 () ListLongMap!1507)

(declare-fun call!10474 () ListLongMap!1507)

(assert (=> bm!10471 (= call!10479 call!10474)))

(declare-fun b!101238 () Bool)

(declare-fun call!10477 () ListLongMap!1507)

(assert (=> b!101238 (= e!65902 call!10477)))

(declare-fun b!101239 () Bool)

(assert (=> b!101239 (= e!65900 e!65904)))

(declare-fun c!17421 () Bool)

(assert (=> b!101239 (= c!17421 (not (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!10472 () Bool)

(declare-fun call!10478 () ListLongMap!1507)

(assert (=> bm!10472 (= call!10480 call!10478)))

(declare-fun c!17424 () Bool)

(declare-fun bm!10473 () Bool)

(assert (=> bm!10473 (= call!10478 (+!132 (ite c!17425 call!10474 (ite c!17424 call!10479 call!10477)) (ite (or c!17425 c!17424) (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2401 newMap!16)) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 newMap!16)))))))

(declare-fun b!101240 () Bool)

(declare-fun e!65901 () Bool)

(assert (=> b!101240 (= e!65901 (validKeyInArray!0 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101241 () Bool)

(declare-fun e!65908 () Bool)

(assert (=> b!101241 (= e!65908 (= (apply!94 lt!51256 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000)) (get!1302 (select (arr!2019 (_values!2505 newMap!16)) #b00000000000000000000000000000000) (dynLambda!374 (defaultEntry!2522 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101241 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2271 (_values!2505 newMap!16))))))

(assert (=> b!101241 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))))))

(declare-fun b!101242 () Bool)

(assert (=> b!101242 (= e!65906 (+!132 call!10478 (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2401 newMap!16))))))

(declare-fun b!101243 () Bool)

(assert (=> b!101243 (= e!65907 (not call!10475))))

(declare-fun bm!10474 () Bool)

(assert (=> bm!10474 (= call!10474 (getCurrentListMapNoExtraKeys!97 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun b!101244 () Bool)

(declare-fun res!50720 () Bool)

(assert (=> b!101244 (=> (not res!50720) (not e!65900))))

(declare-fun e!65903 () Bool)

(assert (=> b!101244 (= res!50720 e!65903)))

(declare-fun res!50721 () Bool)

(assert (=> b!101244 (=> res!50721 e!65903)))

(assert (=> b!101244 (= res!50721 (not e!65901))))

(declare-fun res!50718 () Bool)

(assert (=> b!101244 (=> (not res!50718) (not e!65901))))

(assert (=> b!101244 (= res!50718 (bvslt #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))))))

(declare-fun b!101245 () Bool)

(assert (=> b!101245 (= e!65903 e!65908)))

(declare-fun res!50724 () Bool)

(assert (=> b!101245 (=> (not res!50724) (not e!65908))))

(assert (=> b!101245 (= res!50724 (contains!796 lt!51256 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!101245 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))))))

(declare-fun bm!10475 () Bool)

(assert (=> bm!10475 (= call!10476 (contains!796 lt!51256 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101246 () Bool)

(assert (=> b!101246 (= e!65906 e!65909)))

(assert (=> b!101246 (= c!17424 (and (not (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2335 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101247 () Bool)

(declare-fun e!65899 () Bool)

(assert (=> b!101247 (= e!65899 (= (apply!94 lt!51256 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2401 newMap!16)))))

(declare-fun bm!10476 () Bool)

(assert (=> bm!10476 (= call!10477 call!10479)))

(declare-fun b!101248 () Bool)

(assert (=> b!101248 (= e!65909 call!10480)))

(declare-fun b!101249 () Bool)

(assert (=> b!101249 (= e!65905 (= (apply!94 lt!51256 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2401 newMap!16)))))

(declare-fun b!101250 () Bool)

(declare-fun lt!51273 () Unit!3048)

(assert (=> b!101250 (= e!65910 lt!51273)))

(declare-fun lt!51263 () ListLongMap!1507)

(assert (=> b!101250 (= lt!51263 (getCurrentListMapNoExtraKeys!97 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51275 () (_ BitVec 64))

(assert (=> b!101250 (= lt!51275 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51261 () (_ BitVec 64))

(assert (=> b!101250 (= lt!51261 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51267 () Unit!3048)

(assert (=> b!101250 (= lt!51267 (addStillContains!70 lt!51263 lt!51275 (zeroValue!2401 newMap!16) lt!51261))))

(assert (=> b!101250 (contains!796 (+!132 lt!51263 (tuple2!2317 lt!51275 (zeroValue!2401 newMap!16))) lt!51261)))

(declare-fun lt!51268 () Unit!3048)

(assert (=> b!101250 (= lt!51268 lt!51267)))

(declare-fun lt!51264 () ListLongMap!1507)

(assert (=> b!101250 (= lt!51264 (getCurrentListMapNoExtraKeys!97 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51265 () (_ BitVec 64))

(assert (=> b!101250 (= lt!51265 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51269 () (_ BitVec 64))

(assert (=> b!101250 (= lt!51269 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51259 () Unit!3048)

(assert (=> b!101250 (= lt!51259 (addApplyDifferent!70 lt!51264 lt!51265 (minValue!2401 newMap!16) lt!51269))))

(assert (=> b!101250 (= (apply!94 (+!132 lt!51264 (tuple2!2317 lt!51265 (minValue!2401 newMap!16))) lt!51269) (apply!94 lt!51264 lt!51269))))

(declare-fun lt!51266 () Unit!3048)

(assert (=> b!101250 (= lt!51266 lt!51259)))

(declare-fun lt!51271 () ListLongMap!1507)

(assert (=> b!101250 (= lt!51271 (getCurrentListMapNoExtraKeys!97 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51257 () (_ BitVec 64))

(assert (=> b!101250 (= lt!51257 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51260 () (_ BitVec 64))

(assert (=> b!101250 (= lt!51260 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51272 () Unit!3048)

(assert (=> b!101250 (= lt!51272 (addApplyDifferent!70 lt!51271 lt!51257 (zeroValue!2401 newMap!16) lt!51260))))

(assert (=> b!101250 (= (apply!94 (+!132 lt!51271 (tuple2!2317 lt!51257 (zeroValue!2401 newMap!16))) lt!51260) (apply!94 lt!51271 lt!51260))))

(declare-fun lt!51258 () Unit!3048)

(assert (=> b!101250 (= lt!51258 lt!51272)))

(declare-fun lt!51255 () ListLongMap!1507)

(assert (=> b!101250 (= lt!51255 (getCurrentListMapNoExtraKeys!97 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51262 () (_ BitVec 64))

(assert (=> b!101250 (= lt!51262 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51274 () (_ BitVec 64))

(assert (=> b!101250 (= lt!51274 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!101250 (= lt!51273 (addApplyDifferent!70 lt!51255 lt!51262 (minValue!2401 newMap!16) lt!51274))))

(assert (=> b!101250 (= (apply!94 (+!132 lt!51255 (tuple2!2317 lt!51262 (minValue!2401 newMap!16))) lt!51274) (apply!94 lt!51255 lt!51274))))

(declare-fun bm!10477 () Bool)

(assert (=> bm!10477 (= call!10475 (contains!796 lt!51256 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101251 () Bool)

(assert (=> b!101251 (= e!65911 (validKeyInArray!0 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101252 () Bool)

(assert (=> b!101252 (= e!65904 e!65899)))

(declare-fun res!50717 () Bool)

(assert (=> b!101252 (= res!50717 call!10476)))

(assert (=> b!101252 (=> (not res!50717) (not e!65899))))

(assert (= (and d!27465 c!17425) b!101242))

(assert (= (and d!27465 (not c!17425)) b!101246))

(assert (= (and b!101246 c!17424) b!101248))

(assert (= (and b!101246 (not c!17424)) b!101233))

(assert (= (and b!101233 c!17423) b!101232))

(assert (= (and b!101233 (not c!17423)) b!101238))

(assert (= (or b!101232 b!101238) bm!10476))

(assert (= (or b!101248 bm!10476) bm!10471))

(assert (= (or b!101248 b!101232) bm!10472))

(assert (= (or b!101242 bm!10471) bm!10474))

(assert (= (or b!101242 bm!10472) bm!10473))

(assert (= (and d!27465 res!50716) b!101251))

(assert (= (and d!27465 c!17422) b!101250))

(assert (= (and d!27465 (not c!17422)) b!101234))

(assert (= (and d!27465 res!50722) b!101244))

(assert (= (and b!101244 res!50718) b!101240))

(assert (= (and b!101244 (not res!50721)) b!101245))

(assert (= (and b!101245 res!50724) b!101241))

(assert (= (and b!101244 res!50720) b!101235))

(assert (= (and b!101235 c!17420) b!101237))

(assert (= (and b!101235 (not c!17420)) b!101243))

(assert (= (and b!101237 res!50719) b!101249))

(assert (= (or b!101237 b!101243) bm!10477))

(assert (= (and b!101235 res!50723) b!101239))

(assert (= (and b!101239 c!17421) b!101252))

(assert (= (and b!101239 (not c!17421)) b!101236))

(assert (= (and b!101252 res!50717) b!101247))

(assert (= (or b!101252 b!101236) bm!10475))

(declare-fun b_lambda!4535 () Bool)

(assert (=> (not b_lambda!4535) (not b!101241)))

(assert (=> b!101241 t!5570))

(declare-fun b_and!6237 () Bool)

(assert (= b_and!6233 (and (=> t!5570 result!3327) b_and!6237)))

(assert (=> b!101241 t!5572))

(declare-fun b_and!6239 () Bool)

(assert (= b_and!6235 (and (=> t!5572 result!3329) b_and!6239)))

(declare-fun m!112095 () Bool)

(assert (=> bm!10477 m!112095))

(declare-fun m!112097 () Bool)

(assert (=> b!101247 m!112097))

(declare-fun m!112099 () Bool)

(assert (=> bm!10474 m!112099))

(declare-fun m!112101 () Bool)

(assert (=> b!101242 m!112101))

(declare-fun m!112103 () Bool)

(assert (=> bm!10473 m!112103))

(declare-fun m!112105 () Bool)

(assert (=> b!101250 m!112105))

(declare-fun m!112107 () Bool)

(assert (=> b!101250 m!112107))

(declare-fun m!112109 () Bool)

(assert (=> b!101250 m!112109))

(declare-fun m!112111 () Bool)

(assert (=> b!101250 m!112111))

(assert (=> b!101250 m!112099))

(declare-fun m!112113 () Bool)

(assert (=> b!101250 m!112113))

(assert (=> b!101250 m!111753))

(declare-fun m!112115 () Bool)

(assert (=> b!101250 m!112115))

(declare-fun m!112117 () Bool)

(assert (=> b!101250 m!112117))

(declare-fun m!112119 () Bool)

(assert (=> b!101250 m!112119))

(assert (=> b!101250 m!112119))

(declare-fun m!112121 () Bool)

(assert (=> b!101250 m!112121))

(declare-fun m!112123 () Bool)

(assert (=> b!101250 m!112123))

(declare-fun m!112125 () Bool)

(assert (=> b!101250 m!112125))

(declare-fun m!112127 () Bool)

(assert (=> b!101250 m!112127))

(assert (=> b!101250 m!112125))

(declare-fun m!112129 () Bool)

(assert (=> b!101250 m!112129))

(declare-fun m!112131 () Bool)

(assert (=> b!101250 m!112131))

(assert (=> b!101250 m!112105))

(assert (=> b!101250 m!112131))

(declare-fun m!112133 () Bool)

(assert (=> b!101250 m!112133))

(assert (=> b!101240 m!111753))

(assert (=> b!101240 m!111753))

(assert (=> b!101240 m!111775))

(assert (=> b!101251 m!111753))

(assert (=> b!101251 m!111753))

(assert (=> b!101251 m!111775))

(declare-fun m!112135 () Bool)

(assert (=> b!101249 m!112135))

(assert (=> d!27465 m!111701))

(assert (=> b!101241 m!111753))

(declare-fun m!112137 () Bool)

(assert (=> b!101241 m!112137))

(assert (=> b!101241 m!111753))

(assert (=> b!101241 m!111781))

(assert (=> b!101241 m!111911))

(assert (=> b!101241 m!111781))

(assert (=> b!101241 m!111913))

(assert (=> b!101241 m!111911))

(declare-fun m!112139 () Bool)

(assert (=> bm!10475 m!112139))

(assert (=> b!101245 m!111753))

(assert (=> b!101245 m!111753))

(declare-fun m!112141 () Bool)

(assert (=> b!101245 m!112141))

(assert (=> d!27365 d!27465))

(declare-fun d!27467 () Bool)

(assert (=> d!27467 (= (+!132 (getCurrentListMap!457 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) (tuple2!2317 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!457 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) lt!51065 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51279 () Unit!3048)

(declare-fun choose!628 (array!4251 array!4253 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 V!3169 Int) Unit!3048)

(assert (=> d!27467 (= lt!51279 (choose!628 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) lt!51065 (zeroValue!2401 newMap!16) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2401 newMap!16) (defaultEntry!2522 newMap!16)))))

(assert (=> d!27467 (validMask!0 (mask!6639 newMap!16))))

(assert (=> d!27467 (= (lemmaChangeZeroKeyThenAddPairToListMap!43 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) lt!51065 (zeroValue!2401 newMap!16) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2401 newMap!16) (defaultEntry!2522 newMap!16)) lt!51279)))

(declare-fun bs!4192 () Bool)

(assert (= bs!4192 d!27467))

(assert (=> bs!4192 m!111569))

(declare-fun m!112143 () Bool)

(assert (=> bs!4192 m!112143))

(assert (=> bs!4192 m!111397))

(declare-fun m!112145 () Bool)

(assert (=> bs!4192 m!112145))

(assert (=> bs!4192 m!111569))

(assert (=> bs!4192 m!111701))

(assert (=> bs!4192 m!111397))

(declare-fun m!112147 () Bool)

(assert (=> bs!4192 m!112147))

(assert (=> b!100958 d!27467))

(declare-fun d!27469 () Bool)

(assert (=> d!27469 (= (apply!94 lt!50965 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1306 (getValueByKey!153 (toList!769 lt!50965) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4193 () Bool)

(assert (= bs!4193 d!27469))

(declare-fun m!112149 () Bool)

(assert (=> bs!4193 m!112149))

(assert (=> bs!4193 m!112149))

(declare-fun m!112151 () Bool)

(assert (=> bs!4193 m!112151))

(assert (=> b!100834 d!27469))

(declare-fun d!27471 () Bool)

(declare-fun e!65913 () Bool)

(assert (=> d!27471 e!65913))

(declare-fun res!50725 () Bool)

(assert (=> d!27471 (=> res!50725 e!65913)))

(declare-fun lt!51281 () Bool)

(assert (=> d!27471 (= res!50725 (not lt!51281))))

(declare-fun lt!51283 () Bool)

(assert (=> d!27471 (= lt!51281 lt!51283)))

(declare-fun lt!51280 () Unit!3048)

(declare-fun e!65912 () Unit!3048)

(assert (=> d!27471 (= lt!51280 e!65912)))

(declare-fun c!17426 () Bool)

(assert (=> d!27471 (= c!17426 lt!51283)))

(assert (=> d!27471 (= lt!51283 (containsKey!156 (toList!769 lt!50965) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!27471 (= (contains!796 lt!50965 #b1000000000000000000000000000000000000000000000000000000000000000) lt!51281)))

(declare-fun b!101253 () Bool)

(declare-fun lt!51282 () Unit!3048)

(assert (=> b!101253 (= e!65912 lt!51282)))

(assert (=> b!101253 (= lt!51282 (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!769 lt!50965) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101253 (isDefined!105 (getValueByKey!153 (toList!769 lt!50965) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101254 () Bool)

(declare-fun Unit!3072 () Unit!3048)

(assert (=> b!101254 (= e!65912 Unit!3072)))

(declare-fun b!101255 () Bool)

(assert (=> b!101255 (= e!65913 (isDefined!105 (getValueByKey!153 (toList!769 lt!50965) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27471 c!17426) b!101253))

(assert (= (and d!27471 (not c!17426)) b!101254))

(assert (= (and d!27471 (not res!50725)) b!101255))

(declare-fun m!112153 () Bool)

(assert (=> d!27471 m!112153))

(declare-fun m!112155 () Bool)

(assert (=> b!101253 m!112155))

(assert (=> b!101253 m!112149))

(assert (=> b!101253 m!112149))

(declare-fun m!112157 () Bool)

(assert (=> b!101253 m!112157))

(assert (=> b!101255 m!112149))

(assert (=> b!101255 m!112149))

(assert (=> b!101255 m!112157))

(assert (=> bm!10364 d!27471))

(assert (=> d!27367 d!27339))

(assert (=> b!100772 d!27433))

(declare-fun d!27473 () Bool)

(assert (=> d!27473 (= (+!132 (getCurrentListMap!457 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) (tuple2!2317 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!457 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) lt!51074 (zeroValue!2401 newMap!16) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51286 () Unit!3048)

(declare-fun choose!629 (array!4251 array!4253 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 V!3169 Int) Unit!3048)

(assert (=> d!27473 (= lt!51286 (choose!629 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) lt!51074 (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2522 newMap!16)))))

(assert (=> d!27473 (validMask!0 (mask!6639 newMap!16))))

(assert (=> d!27473 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!43 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) lt!51074 (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2522 newMap!16)) lt!51286)))

(declare-fun bs!4194 () Bool)

(assert (= bs!4194 d!27473))

(assert (=> bs!4194 m!111569))

(declare-fun m!112159 () Bool)

(assert (=> bs!4194 m!112159))

(assert (=> bs!4194 m!111701))

(assert (=> bs!4194 m!111397))

(declare-fun m!112161 () Bool)

(assert (=> bs!4194 m!112161))

(assert (=> bs!4194 m!111569))

(assert (=> bs!4194 m!111397))

(declare-fun m!112163 () Bool)

(assert (=> bs!4194 m!112163))

(assert (=> b!100932 d!27473))

(declare-fun d!27475 () Bool)

(declare-fun res!50730 () Bool)

(declare-fun e!65918 () Bool)

(assert (=> d!27475 (=> res!50730 e!65918)))

(assert (=> d!27475 (= res!50730 (and ((_ is Cons!1567) (toList!769 lt!50857)) (= (_1!1169 (h!2163 (toList!769 lt!50857))) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355))))))

(assert (=> d!27475 (= (containsKey!156 (toList!769 lt!50857) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)) e!65918)))

(declare-fun b!101260 () Bool)

(declare-fun e!65919 () Bool)

(assert (=> b!101260 (= e!65918 e!65919)))

(declare-fun res!50731 () Bool)

(assert (=> b!101260 (=> (not res!50731) (not e!65919))))

(assert (=> b!101260 (= res!50731 (and (or (not ((_ is Cons!1567) (toList!769 lt!50857))) (bvsle (_1!1169 (h!2163 (toList!769 lt!50857))) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355))) ((_ is Cons!1567) (toList!769 lt!50857)) (bvslt (_1!1169 (h!2163 (toList!769 lt!50857))) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355))))))

(declare-fun b!101261 () Bool)

(assert (=> b!101261 (= e!65919 (containsKey!156 (t!5557 (toList!769 lt!50857)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(assert (= (and d!27475 (not res!50730)) b!101260))

(assert (= (and b!101260 res!50731) b!101261))

(assert (=> b!101261 m!111399))

(declare-fun m!112165 () Bool)

(assert (=> b!101261 m!112165))

(assert (=> d!27369 d!27475))

(declare-fun d!27477 () Bool)

(assert (=> d!27477 (= (get!1305 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!100974 d!27477))

(declare-fun b!101270 () Bool)

(declare-fun e!65925 () (_ BitVec 32))

(declare-fun call!10483 () (_ BitVec 32))

(assert (=> b!101270 (= e!65925 (bvadd #b00000000000000000000000000000001 call!10483))))

(declare-fun b!101271 () Bool)

(declare-fun e!65924 () (_ BitVec 32))

(assert (=> b!101271 (= e!65924 e!65925)))

(declare-fun c!17431 () Bool)

(assert (=> b!101271 (= c!17431 (validKeyInArray!0 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!27479 () Bool)

(declare-fun lt!51289 () (_ BitVec 32))

(assert (=> d!27479 (and (bvsge lt!51289 #b00000000000000000000000000000000) (bvsle lt!51289 (bvsub (size!2270 (_keys!4220 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!27479 (= lt!51289 e!65924)))

(declare-fun c!17432 () Bool)

(assert (=> d!27479 (= c!17432 (bvsge #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))))))

(assert (=> d!27479 (and (bvsle #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2270 (_keys!4220 newMap!16)) (size!2270 (_keys!4220 newMap!16))))))

(assert (=> d!27479 (= (arrayCountValidKeys!0 (_keys!4220 newMap!16) #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))) lt!51289)))

(declare-fun b!101272 () Bool)

(assert (=> b!101272 (= e!65925 call!10483)))

(declare-fun bm!10480 () Bool)

(assert (=> bm!10480 (= call!10483 (arrayCountValidKeys!0 (_keys!4220 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2270 (_keys!4220 newMap!16))))))

(declare-fun b!101273 () Bool)

(assert (=> b!101273 (= e!65924 #b00000000000000000000000000000000)))

(assert (= (and d!27479 c!17432) b!101273))

(assert (= (and d!27479 (not c!17432)) b!101271))

(assert (= (and b!101271 c!17431) b!101270))

(assert (= (and b!101271 (not c!17431)) b!101272))

(assert (= (or b!101270 b!101272) bm!10480))

(assert (=> b!101271 m!111753))

(assert (=> b!101271 m!111753))

(assert (=> b!101271 m!111775))

(declare-fun m!112167 () Bool)

(assert (=> bm!10480 m!112167))

(assert (=> b!100735 d!27479))

(declare-fun d!27481 () Bool)

(assert (=> d!27481 (= (apply!94 (+!132 lt!50973 (tuple2!2317 lt!50974 (minValue!2401 (v!2833 (underlying!344 thiss!992))))) lt!50978) (get!1306 (getValueByKey!153 (toList!769 (+!132 lt!50973 (tuple2!2317 lt!50974 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))) lt!50978)))))

(declare-fun bs!4195 () Bool)

(assert (= bs!4195 d!27481))

(declare-fun m!112169 () Bool)

(assert (=> bs!4195 m!112169))

(assert (=> bs!4195 m!112169))

(declare-fun m!112171 () Bool)

(assert (=> bs!4195 m!112171))

(assert (=> b!100837 d!27481))

(declare-fun d!27483 () Bool)

(declare-fun e!65927 () Bool)

(assert (=> d!27483 e!65927))

(declare-fun res!50732 () Bool)

(assert (=> d!27483 (=> res!50732 e!65927)))

(declare-fun lt!51291 () Bool)

(assert (=> d!27483 (= res!50732 (not lt!51291))))

(declare-fun lt!51293 () Bool)

(assert (=> d!27483 (= lt!51291 lt!51293)))

(declare-fun lt!51290 () Unit!3048)

(declare-fun e!65926 () Unit!3048)

(assert (=> d!27483 (= lt!51290 e!65926)))

(declare-fun c!17433 () Bool)

(assert (=> d!27483 (= c!17433 lt!51293)))

(assert (=> d!27483 (= lt!51293 (containsKey!156 (toList!769 (+!132 lt!50972 (tuple2!2317 lt!50984 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))))) lt!50970))))

(assert (=> d!27483 (= (contains!796 (+!132 lt!50972 (tuple2!2317 lt!50984 (zeroValue!2401 (v!2833 (underlying!344 thiss!992))))) lt!50970) lt!51291)))

(declare-fun b!101274 () Bool)

(declare-fun lt!51292 () Unit!3048)

(assert (=> b!101274 (= e!65926 lt!51292)))

(assert (=> b!101274 (= lt!51292 (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!769 (+!132 lt!50972 (tuple2!2317 lt!50984 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))))) lt!50970))))

(assert (=> b!101274 (isDefined!105 (getValueByKey!153 (toList!769 (+!132 lt!50972 (tuple2!2317 lt!50984 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))))) lt!50970))))

(declare-fun b!101275 () Bool)

(declare-fun Unit!3073 () Unit!3048)

(assert (=> b!101275 (= e!65926 Unit!3073)))

(declare-fun b!101276 () Bool)

(assert (=> b!101276 (= e!65927 (isDefined!105 (getValueByKey!153 (toList!769 (+!132 lt!50972 (tuple2!2317 lt!50984 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))))) lt!50970)))))

(assert (= (and d!27483 c!17433) b!101274))

(assert (= (and d!27483 (not c!17433)) b!101275))

(assert (= (and d!27483 (not res!50732)) b!101276))

(declare-fun m!112173 () Bool)

(assert (=> d!27483 m!112173))

(declare-fun m!112175 () Bool)

(assert (=> b!101274 m!112175))

(declare-fun m!112177 () Bool)

(assert (=> b!101274 m!112177))

(assert (=> b!101274 m!112177))

(declare-fun m!112179 () Bool)

(assert (=> b!101274 m!112179))

(assert (=> b!101276 m!112177))

(assert (=> b!101276 m!112177))

(assert (=> b!101276 m!112179))

(assert (=> b!100837 d!27483))

(declare-fun d!27485 () Bool)

(assert (=> d!27485 (= (apply!94 (+!132 lt!50973 (tuple2!2317 lt!50974 (minValue!2401 (v!2833 (underlying!344 thiss!992))))) lt!50978) (apply!94 lt!50973 lt!50978))))

(declare-fun lt!51296 () Unit!3048)

(declare-fun choose!630 (ListLongMap!1507 (_ BitVec 64) V!3169 (_ BitVec 64)) Unit!3048)

(assert (=> d!27485 (= lt!51296 (choose!630 lt!50973 lt!50974 (minValue!2401 (v!2833 (underlying!344 thiss!992))) lt!50978))))

(declare-fun e!65930 () Bool)

(assert (=> d!27485 e!65930))

(declare-fun res!50735 () Bool)

(assert (=> d!27485 (=> (not res!50735) (not e!65930))))

(assert (=> d!27485 (= res!50735 (contains!796 lt!50973 lt!50978))))

(assert (=> d!27485 (= (addApplyDifferent!70 lt!50973 lt!50974 (minValue!2401 (v!2833 (underlying!344 thiss!992))) lt!50978) lt!51296)))

(declare-fun b!101280 () Bool)

(assert (=> b!101280 (= e!65930 (not (= lt!50978 lt!50974)))))

(assert (= (and d!27485 res!50735) b!101280))

(declare-fun m!112181 () Bool)

(assert (=> d!27485 m!112181))

(assert (=> d!27485 m!111601))

(assert (=> d!27485 m!111605))

(assert (=> d!27485 m!111601))

(declare-fun m!112183 () Bool)

(assert (=> d!27485 m!112183))

(assert (=> d!27485 m!111599))

(assert (=> b!100837 d!27485))

(declare-fun d!27487 () Bool)

(assert (=> d!27487 (= (apply!94 (+!132 lt!50964 (tuple2!2317 lt!50971 (minValue!2401 (v!2833 (underlying!344 thiss!992))))) lt!50983) (apply!94 lt!50964 lt!50983))))

(declare-fun lt!51297 () Unit!3048)

(assert (=> d!27487 (= lt!51297 (choose!630 lt!50964 lt!50971 (minValue!2401 (v!2833 (underlying!344 thiss!992))) lt!50983))))

(declare-fun e!65931 () Bool)

(assert (=> d!27487 e!65931))

(declare-fun res!50736 () Bool)

(assert (=> d!27487 (=> (not res!50736) (not e!65931))))

(assert (=> d!27487 (= res!50736 (contains!796 lt!50964 lt!50983))))

(assert (=> d!27487 (= (addApplyDifferent!70 lt!50964 lt!50971 (minValue!2401 (v!2833 (underlying!344 thiss!992))) lt!50983) lt!51297)))

(declare-fun b!101281 () Bool)

(assert (=> b!101281 (= e!65931 (not (= lt!50983 lt!50971)))))

(assert (= (and d!27487 res!50736) b!101281))

(declare-fun m!112185 () Bool)

(assert (=> d!27487 m!112185))

(assert (=> d!27487 m!111581))

(assert (=> d!27487 m!111583))

(assert (=> d!27487 m!111581))

(declare-fun m!112187 () Bool)

(assert (=> d!27487 m!112187))

(assert (=> d!27487 m!111587))

(assert (=> b!100837 d!27487))

(declare-fun d!27489 () Bool)

(assert (=> d!27489 (= (apply!94 lt!50973 lt!50978) (get!1306 (getValueByKey!153 (toList!769 lt!50973) lt!50978)))))

(declare-fun bs!4196 () Bool)

(assert (= bs!4196 d!27489))

(declare-fun m!112189 () Bool)

(assert (=> bs!4196 m!112189))

(assert (=> bs!4196 m!112189))

(declare-fun m!112191 () Bool)

(assert (=> bs!4196 m!112191))

(assert (=> b!100837 d!27489))

(declare-fun d!27491 () Bool)

(declare-fun e!65932 () Bool)

(assert (=> d!27491 e!65932))

(declare-fun res!50738 () Bool)

(assert (=> d!27491 (=> (not res!50738) (not e!65932))))

(declare-fun lt!51301 () ListLongMap!1507)

(assert (=> d!27491 (= res!50738 (contains!796 lt!51301 (_1!1169 (tuple2!2317 lt!50966 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))))))))

(declare-fun lt!51300 () List!1571)

(assert (=> d!27491 (= lt!51301 (ListLongMap!1508 lt!51300))))

(declare-fun lt!51299 () Unit!3048)

(declare-fun lt!51298 () Unit!3048)

(assert (=> d!27491 (= lt!51299 lt!51298)))

(assert (=> d!27491 (= (getValueByKey!153 lt!51300 (_1!1169 (tuple2!2317 lt!50966 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))))) (Some!158 (_2!1169 (tuple2!2317 lt!50966 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))))))))

(assert (=> d!27491 (= lt!51298 (lemmaContainsTupThenGetReturnValue!69 lt!51300 (_1!1169 (tuple2!2317 lt!50966 (zeroValue!2401 (v!2833 (underlying!344 thiss!992))))) (_2!1169 (tuple2!2317 lt!50966 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))))))))

(assert (=> d!27491 (= lt!51300 (insertStrictlySorted!72 (toList!769 lt!50980) (_1!1169 (tuple2!2317 lt!50966 (zeroValue!2401 (v!2833 (underlying!344 thiss!992))))) (_2!1169 (tuple2!2317 lt!50966 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))))))))

(assert (=> d!27491 (= (+!132 lt!50980 (tuple2!2317 lt!50966 (zeroValue!2401 (v!2833 (underlying!344 thiss!992))))) lt!51301)))

(declare-fun b!101282 () Bool)

(declare-fun res!50737 () Bool)

(assert (=> b!101282 (=> (not res!50737) (not e!65932))))

(assert (=> b!101282 (= res!50737 (= (getValueByKey!153 (toList!769 lt!51301) (_1!1169 (tuple2!2317 lt!50966 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))))) (Some!158 (_2!1169 (tuple2!2317 lt!50966 (zeroValue!2401 (v!2833 (underlying!344 thiss!992))))))))))

(declare-fun b!101283 () Bool)

(assert (=> b!101283 (= e!65932 (contains!799 (toList!769 lt!51301) (tuple2!2317 lt!50966 (zeroValue!2401 (v!2833 (underlying!344 thiss!992))))))))

(assert (= (and d!27491 res!50738) b!101282))

(assert (= (and b!101282 res!50737) b!101283))

(declare-fun m!112193 () Bool)

(assert (=> d!27491 m!112193))

(declare-fun m!112195 () Bool)

(assert (=> d!27491 m!112195))

(declare-fun m!112197 () Bool)

(assert (=> d!27491 m!112197))

(declare-fun m!112199 () Bool)

(assert (=> d!27491 m!112199))

(declare-fun m!112201 () Bool)

(assert (=> b!101282 m!112201))

(declare-fun m!112203 () Bool)

(assert (=> b!101283 m!112203))

(assert (=> b!100837 d!27491))

(declare-fun d!27493 () Bool)

(assert (=> d!27493 (contains!796 (+!132 lt!50972 (tuple2!2317 lt!50984 (zeroValue!2401 (v!2833 (underlying!344 thiss!992))))) lt!50970)))

(declare-fun lt!51304 () Unit!3048)

(declare-fun choose!631 (ListLongMap!1507 (_ BitVec 64) V!3169 (_ BitVec 64)) Unit!3048)

(assert (=> d!27493 (= lt!51304 (choose!631 lt!50972 lt!50984 (zeroValue!2401 (v!2833 (underlying!344 thiss!992))) lt!50970))))

(assert (=> d!27493 (contains!796 lt!50972 lt!50970)))

(assert (=> d!27493 (= (addStillContains!70 lt!50972 lt!50984 (zeroValue!2401 (v!2833 (underlying!344 thiss!992))) lt!50970) lt!51304)))

(declare-fun bs!4197 () Bool)

(assert (= bs!4197 d!27493))

(assert (=> bs!4197 m!111607))

(assert (=> bs!4197 m!111607))

(assert (=> bs!4197 m!111609))

(declare-fun m!112205 () Bool)

(assert (=> bs!4197 m!112205))

(declare-fun m!112207 () Bool)

(assert (=> bs!4197 m!112207))

(assert (=> b!100837 d!27493))

(declare-fun d!27495 () Bool)

(declare-fun e!65933 () Bool)

(assert (=> d!27495 e!65933))

(declare-fun res!50740 () Bool)

(assert (=> d!27495 (=> (not res!50740) (not e!65933))))

(declare-fun lt!51308 () ListLongMap!1507)

(assert (=> d!27495 (= res!50740 (contains!796 lt!51308 (_1!1169 (tuple2!2317 lt!50984 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))))))))

(declare-fun lt!51307 () List!1571)

(assert (=> d!27495 (= lt!51308 (ListLongMap!1508 lt!51307))))

(declare-fun lt!51306 () Unit!3048)

(declare-fun lt!51305 () Unit!3048)

(assert (=> d!27495 (= lt!51306 lt!51305)))

(assert (=> d!27495 (= (getValueByKey!153 lt!51307 (_1!1169 (tuple2!2317 lt!50984 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))))) (Some!158 (_2!1169 (tuple2!2317 lt!50984 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))))))))

(assert (=> d!27495 (= lt!51305 (lemmaContainsTupThenGetReturnValue!69 lt!51307 (_1!1169 (tuple2!2317 lt!50984 (zeroValue!2401 (v!2833 (underlying!344 thiss!992))))) (_2!1169 (tuple2!2317 lt!50984 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))))))))

(assert (=> d!27495 (= lt!51307 (insertStrictlySorted!72 (toList!769 lt!50972) (_1!1169 (tuple2!2317 lt!50984 (zeroValue!2401 (v!2833 (underlying!344 thiss!992))))) (_2!1169 (tuple2!2317 lt!50984 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))))))))

(assert (=> d!27495 (= (+!132 lt!50972 (tuple2!2317 lt!50984 (zeroValue!2401 (v!2833 (underlying!344 thiss!992))))) lt!51308)))

(declare-fun b!101285 () Bool)

(declare-fun res!50739 () Bool)

(assert (=> b!101285 (=> (not res!50739) (not e!65933))))

(assert (=> b!101285 (= res!50739 (= (getValueByKey!153 (toList!769 lt!51308) (_1!1169 (tuple2!2317 lt!50984 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))))) (Some!158 (_2!1169 (tuple2!2317 lt!50984 (zeroValue!2401 (v!2833 (underlying!344 thiss!992))))))))))

(declare-fun b!101286 () Bool)

(assert (=> b!101286 (= e!65933 (contains!799 (toList!769 lt!51308) (tuple2!2317 lt!50984 (zeroValue!2401 (v!2833 (underlying!344 thiss!992))))))))

(assert (= (and d!27495 res!50740) b!101285))

(assert (= (and b!101285 res!50739) b!101286))

(declare-fun m!112209 () Bool)

(assert (=> d!27495 m!112209))

(declare-fun m!112211 () Bool)

(assert (=> d!27495 m!112211))

(declare-fun m!112213 () Bool)

(assert (=> d!27495 m!112213))

(declare-fun m!112215 () Bool)

(assert (=> d!27495 m!112215))

(declare-fun m!112217 () Bool)

(assert (=> b!101285 m!112217))

(declare-fun m!112219 () Bool)

(assert (=> b!101286 m!112219))

(assert (=> b!100837 d!27495))

(declare-fun d!27497 () Bool)

(assert (=> d!27497 (= (apply!94 (+!132 lt!50980 (tuple2!2317 lt!50966 (zeroValue!2401 (v!2833 (underlying!344 thiss!992))))) lt!50969) (get!1306 (getValueByKey!153 (toList!769 (+!132 lt!50980 (tuple2!2317 lt!50966 (zeroValue!2401 (v!2833 (underlying!344 thiss!992)))))) lt!50969)))))

(declare-fun bs!4198 () Bool)

(assert (= bs!4198 d!27497))

(declare-fun m!112221 () Bool)

(assert (=> bs!4198 m!112221))

(assert (=> bs!4198 m!112221))

(declare-fun m!112223 () Bool)

(assert (=> bs!4198 m!112223))

(assert (=> b!100837 d!27497))

(declare-fun d!27499 () Bool)

(declare-fun e!65934 () Bool)

(assert (=> d!27499 e!65934))

(declare-fun res!50742 () Bool)

(assert (=> d!27499 (=> (not res!50742) (not e!65934))))

(declare-fun lt!51312 () ListLongMap!1507)

(assert (=> d!27499 (= res!50742 (contains!796 lt!51312 (_1!1169 (tuple2!2317 lt!50971 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))))))

(declare-fun lt!51311 () List!1571)

(assert (=> d!27499 (= lt!51312 (ListLongMap!1508 lt!51311))))

(declare-fun lt!51310 () Unit!3048)

(declare-fun lt!51309 () Unit!3048)

(assert (=> d!27499 (= lt!51310 lt!51309)))

(assert (=> d!27499 (= (getValueByKey!153 lt!51311 (_1!1169 (tuple2!2317 lt!50971 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))) (Some!158 (_2!1169 (tuple2!2317 lt!50971 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))))))

(assert (=> d!27499 (= lt!51309 (lemmaContainsTupThenGetReturnValue!69 lt!51311 (_1!1169 (tuple2!2317 lt!50971 (minValue!2401 (v!2833 (underlying!344 thiss!992))))) (_2!1169 (tuple2!2317 lt!50971 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))))))

(assert (=> d!27499 (= lt!51311 (insertStrictlySorted!72 (toList!769 lt!50964) (_1!1169 (tuple2!2317 lt!50971 (minValue!2401 (v!2833 (underlying!344 thiss!992))))) (_2!1169 (tuple2!2317 lt!50971 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))))))

(assert (=> d!27499 (= (+!132 lt!50964 (tuple2!2317 lt!50971 (minValue!2401 (v!2833 (underlying!344 thiss!992))))) lt!51312)))

(declare-fun b!101287 () Bool)

(declare-fun res!50741 () Bool)

(assert (=> b!101287 (=> (not res!50741) (not e!65934))))

(assert (=> b!101287 (= res!50741 (= (getValueByKey!153 (toList!769 lt!51312) (_1!1169 (tuple2!2317 lt!50971 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))) (Some!158 (_2!1169 (tuple2!2317 lt!50971 (minValue!2401 (v!2833 (underlying!344 thiss!992))))))))))

(declare-fun b!101288 () Bool)

(assert (=> b!101288 (= e!65934 (contains!799 (toList!769 lt!51312) (tuple2!2317 lt!50971 (minValue!2401 (v!2833 (underlying!344 thiss!992))))))))

(assert (= (and d!27499 res!50742) b!101287))

(assert (= (and b!101287 res!50741) b!101288))

(declare-fun m!112225 () Bool)

(assert (=> d!27499 m!112225))

(declare-fun m!112227 () Bool)

(assert (=> d!27499 m!112227))

(declare-fun m!112229 () Bool)

(assert (=> d!27499 m!112229))

(declare-fun m!112231 () Bool)

(assert (=> d!27499 m!112231))

(declare-fun m!112233 () Bool)

(assert (=> b!101287 m!112233))

(declare-fun m!112235 () Bool)

(assert (=> b!101288 m!112235))

(assert (=> b!100837 d!27499))

(declare-fun d!27501 () Bool)

(assert (=> d!27501 (= (apply!94 (+!132 lt!50980 (tuple2!2317 lt!50966 (zeroValue!2401 (v!2833 (underlying!344 thiss!992))))) lt!50969) (apply!94 lt!50980 lt!50969))))

(declare-fun lt!51313 () Unit!3048)

(assert (=> d!27501 (= lt!51313 (choose!630 lt!50980 lt!50966 (zeroValue!2401 (v!2833 (underlying!344 thiss!992))) lt!50969))))

(declare-fun e!65935 () Bool)

(assert (=> d!27501 e!65935))

(declare-fun res!50743 () Bool)

(assert (=> d!27501 (=> (not res!50743) (not e!65935))))

(assert (=> d!27501 (= res!50743 (contains!796 lt!50980 lt!50969))))

(assert (=> d!27501 (= (addApplyDifferent!70 lt!50980 lt!50966 (zeroValue!2401 (v!2833 (underlying!344 thiss!992))) lt!50969) lt!51313)))

(declare-fun b!101289 () Bool)

(assert (=> b!101289 (= e!65935 (not (= lt!50969 lt!50966)))))

(assert (= (and d!27501 res!50743) b!101289))

(declare-fun m!112237 () Bool)

(assert (=> d!27501 m!112237))

(assert (=> d!27501 m!111595))

(assert (=> d!27501 m!111597))

(assert (=> d!27501 m!111595))

(declare-fun m!112239 () Bool)

(assert (=> d!27501 m!112239))

(assert (=> d!27501 m!111585))

(assert (=> b!100837 d!27501))

(declare-fun d!27503 () Bool)

(assert (=> d!27503 (= (apply!94 (+!132 lt!50964 (tuple2!2317 lt!50971 (minValue!2401 (v!2833 (underlying!344 thiss!992))))) lt!50983) (get!1306 (getValueByKey!153 (toList!769 (+!132 lt!50964 (tuple2!2317 lt!50971 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))) lt!50983)))))

(declare-fun bs!4199 () Bool)

(assert (= bs!4199 d!27503))

(declare-fun m!112241 () Bool)

(assert (=> bs!4199 m!112241))

(assert (=> bs!4199 m!112241))

(declare-fun m!112243 () Bool)

(assert (=> bs!4199 m!112243))

(assert (=> b!100837 d!27503))

(declare-fun d!27505 () Bool)

(assert (=> d!27505 (= (apply!94 lt!50964 lt!50983) (get!1306 (getValueByKey!153 (toList!769 lt!50964) lt!50983)))))

(declare-fun bs!4200 () Bool)

(assert (= bs!4200 d!27505))

(declare-fun m!112245 () Bool)

(assert (=> bs!4200 m!112245))

(assert (=> bs!4200 m!112245))

(declare-fun m!112247 () Bool)

(assert (=> bs!4200 m!112247))

(assert (=> b!100837 d!27505))

(assert (=> b!100837 d!27403))

(declare-fun d!27507 () Bool)

(assert (=> d!27507 (= (apply!94 lt!50980 lt!50969) (get!1306 (getValueByKey!153 (toList!769 lt!50980) lt!50969)))))

(declare-fun bs!4201 () Bool)

(assert (= bs!4201 d!27507))

(declare-fun m!112249 () Bool)

(assert (=> bs!4201 m!112249))

(assert (=> bs!4201 m!112249))

(declare-fun m!112251 () Bool)

(assert (=> bs!4201 m!112251))

(assert (=> b!100837 d!27507))

(declare-fun d!27509 () Bool)

(declare-fun e!65936 () Bool)

(assert (=> d!27509 e!65936))

(declare-fun res!50745 () Bool)

(assert (=> d!27509 (=> (not res!50745) (not e!65936))))

(declare-fun lt!51317 () ListLongMap!1507)

(assert (=> d!27509 (= res!50745 (contains!796 lt!51317 (_1!1169 (tuple2!2317 lt!50974 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))))))

(declare-fun lt!51316 () List!1571)

(assert (=> d!27509 (= lt!51317 (ListLongMap!1508 lt!51316))))

(declare-fun lt!51315 () Unit!3048)

(declare-fun lt!51314 () Unit!3048)

(assert (=> d!27509 (= lt!51315 lt!51314)))

(assert (=> d!27509 (= (getValueByKey!153 lt!51316 (_1!1169 (tuple2!2317 lt!50974 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))) (Some!158 (_2!1169 (tuple2!2317 lt!50974 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))))))

(assert (=> d!27509 (= lt!51314 (lemmaContainsTupThenGetReturnValue!69 lt!51316 (_1!1169 (tuple2!2317 lt!50974 (minValue!2401 (v!2833 (underlying!344 thiss!992))))) (_2!1169 (tuple2!2317 lt!50974 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))))))

(assert (=> d!27509 (= lt!51316 (insertStrictlySorted!72 (toList!769 lt!50973) (_1!1169 (tuple2!2317 lt!50974 (minValue!2401 (v!2833 (underlying!344 thiss!992))))) (_2!1169 (tuple2!2317 lt!50974 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))))))

(assert (=> d!27509 (= (+!132 lt!50973 (tuple2!2317 lt!50974 (minValue!2401 (v!2833 (underlying!344 thiss!992))))) lt!51317)))

(declare-fun b!101290 () Bool)

(declare-fun res!50744 () Bool)

(assert (=> b!101290 (=> (not res!50744) (not e!65936))))

(assert (=> b!101290 (= res!50744 (= (getValueByKey!153 (toList!769 lt!51317) (_1!1169 (tuple2!2317 lt!50974 (minValue!2401 (v!2833 (underlying!344 thiss!992)))))) (Some!158 (_2!1169 (tuple2!2317 lt!50974 (minValue!2401 (v!2833 (underlying!344 thiss!992))))))))))

(declare-fun b!101291 () Bool)

(assert (=> b!101291 (= e!65936 (contains!799 (toList!769 lt!51317) (tuple2!2317 lt!50974 (minValue!2401 (v!2833 (underlying!344 thiss!992))))))))

(assert (= (and d!27509 res!50745) b!101290))

(assert (= (and b!101290 res!50744) b!101291))

(declare-fun m!112253 () Bool)

(assert (=> d!27509 m!112253))

(declare-fun m!112255 () Bool)

(assert (=> d!27509 m!112255))

(declare-fun m!112257 () Bool)

(assert (=> d!27509 m!112257))

(declare-fun m!112259 () Bool)

(assert (=> d!27509 m!112259))

(declare-fun m!112261 () Bool)

(assert (=> b!101290 m!112261))

(declare-fun m!112263 () Bool)

(assert (=> b!101291 m!112263))

(assert (=> b!100837 d!27509))

(declare-fun b!101292 () Bool)

(declare-fun e!65938 () Bool)

(declare-fun e!65940 () Bool)

(assert (=> b!101292 (= e!65938 e!65940)))

(declare-fun res!50746 () Bool)

(assert (=> b!101292 (=> (not res!50746) (not e!65940))))

(declare-fun e!65937 () Bool)

(assert (=> b!101292 (= res!50746 (not e!65937))))

(declare-fun res!50748 () Bool)

(assert (=> b!101292 (=> (not res!50748) (not e!65937))))

(assert (=> b!101292 (= res!50748 (validKeyInArray!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!101293 () Bool)

(declare-fun e!65939 () Bool)

(declare-fun call!10484 () Bool)

(assert (=> b!101293 (= e!65939 call!10484)))

(declare-fun b!101294 () Bool)

(assert (=> b!101294 (= e!65939 call!10484)))

(declare-fun b!101295 () Bool)

(assert (=> b!101295 (= e!65940 e!65939)))

(declare-fun c!17434 () Bool)

(assert (=> b!101295 (= c!17434 (validKeyInArray!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun d!27511 () Bool)

(declare-fun res!50747 () Bool)

(assert (=> d!27511 (=> res!50747 e!65938)))

(assert (=> d!27511 (= res!50747 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2270 (_keys!4220 (v!2833 (underlying!344 thiss!992))))))))

(assert (=> d!27511 (= (arrayNoDuplicates!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!17291 (Cons!1568 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) Nil!1569) Nil!1569)) e!65938)))

(declare-fun bm!10481 () Bool)

(assert (=> bm!10481 (= call!10484 (arrayNoDuplicates!0 (_keys!4220 (v!2833 (underlying!344 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!17434 (Cons!1568 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!17291 (Cons!1568 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) Nil!1569) Nil!1569)) (ite c!17291 (Cons!1568 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) Nil!1569) Nil!1569))))))

(declare-fun b!101296 () Bool)

(assert (=> b!101296 (= e!65937 (contains!798 (ite c!17291 (Cons!1568 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) Nil!1569) Nil!1569) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(assert (= (and d!27511 (not res!50747)) b!101292))

(assert (= (and b!101292 res!50748) b!101296))

(assert (= (and b!101292 res!50746) b!101295))

(assert (= (and b!101295 c!17434) b!101294))

(assert (= (and b!101295 (not c!17434)) b!101293))

(assert (= (or b!101294 b!101293) bm!10481))

(declare-fun m!112265 () Bool)

(assert (=> b!101292 m!112265))

(assert (=> b!101292 m!112265))

(declare-fun m!112267 () Bool)

(assert (=> b!101292 m!112267))

(assert (=> b!101295 m!112265))

(assert (=> b!101295 m!112265))

(assert (=> b!101295 m!112267))

(assert (=> bm!10481 m!112265))

(declare-fun m!112269 () Bool)

(assert (=> bm!10481 m!112269))

(assert (=> b!101296 m!112265))

(assert (=> b!101296 m!112265))

(declare-fun m!112271 () Bool)

(assert (=> b!101296 m!112271))

(assert (=> bm!10345 d!27511))

(declare-fun bm!10490 () Bool)

(declare-fun call!10496 () Bool)

(declare-fun call!10493 () Bool)

(assert (=> bm!10490 (= call!10496 call!10493)))

(declare-fun b!101331 () Bool)

(declare-fun res!50773 () Bool)

(declare-fun lt!51381 () SeekEntryResult!249)

(assert (=> b!101331 (= res!50773 (= (select (arr!2018 (_keys!4220 newMap!16)) (index!3144 lt!51381)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!65958 () Bool)

(assert (=> b!101331 (=> (not res!50773) (not e!65958))))

(declare-fun b!101332 () Bool)

(declare-fun e!65963 () Bool)

(assert (=> b!101332 (= e!65963 e!65958)))

(declare-fun res!50771 () Bool)

(assert (=> b!101332 (= res!50771 call!10496)))

(assert (=> b!101332 (=> (not res!50771) (not e!65958))))

(declare-fun b!101333 () Bool)

(declare-fun res!50774 () Bool)

(declare-fun e!65961 () Bool)

(assert (=> b!101333 (=> (not res!50774) (not e!65961))))

(declare-fun lt!51385 () tuple2!2314)

(assert (=> b!101333 (= res!50774 (contains!796 (map!1259 (_2!1168 lt!51385)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(declare-fun b!101334 () Bool)

(declare-fun res!50769 () Bool)

(assert (=> b!101334 (= res!50769 call!10493)))

(declare-fun e!65959 () Bool)

(assert (=> b!101334 (=> (not res!50769) (not e!65959))))

(declare-fun b!101335 () Bool)

(assert (=> b!101335 (= e!65963 ((_ is Undefined!249) lt!51381))))

(declare-fun b!101336 () Bool)

(declare-fun res!50768 () Bool)

(declare-fun e!65957 () Bool)

(assert (=> b!101336 (=> (not res!50768) (not e!65957))))

(assert (=> b!101336 (= res!50768 call!10496)))

(declare-fun e!65964 () Bool)

(assert (=> b!101336 (= e!65964 e!65957)))

(declare-fun b!101337 () Bool)

(declare-fun e!65960 () Unit!3048)

(declare-fun Unit!3074 () Unit!3048)

(assert (=> b!101337 (= e!65960 Unit!3074)))

(declare-fun bm!10491 () Bool)

(declare-fun call!10495 () SeekEntryResult!249)

(assert (=> bm!10491 (= call!10495 (seekEntryOrOpen!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (_keys!4220 newMap!16) (mask!6639 newMap!16)))))

(declare-fun b!101338 () Bool)

(declare-fun Unit!3075 () Unit!3048)

(assert (=> b!101338 (= e!65960 Unit!3075)))

(declare-fun lt!51393 () Unit!3048)

(declare-fun lemmaArrayContainsKeyThenInListMap!27 (array!4251 array!4253 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 64) (_ BitVec 32) Int) Unit!3048)

(assert (=> b!101338 (= lt!51393 (lemmaArrayContainsKeyThenInListMap!27 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(assert (=> b!101338 (contains!796 (getCurrentListMap!457 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355))))

(declare-fun lt!51402 () Unit!3048)

(assert (=> b!101338 (= lt!51402 lt!51393)))

(assert (=> b!101338 false))

(declare-fun b!101339 () Bool)

(declare-fun e!65962 () Unit!3048)

(declare-fun Unit!3076 () Unit!3048)

(assert (=> b!101339 (= e!65962 Unit!3076)))

(declare-fun lt!51394 () Unit!3048)

(assert (=> b!101339 (= lt!51394 (lemmaInListMapThenSeekEntryOrOpenFindsIt!43 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51383 () SeekEntryResult!249)

(assert (=> b!101339 (= lt!51383 call!10495)))

(declare-fun res!50775 () Bool)

(assert (=> b!101339 (= res!50775 ((_ is Found!249) lt!51383))))

(assert (=> b!101339 (=> (not res!50775) (not e!65959))))

(assert (=> b!101339 e!65959))

(declare-fun lt!51397 () Unit!3048)

(assert (=> b!101339 (= lt!51397 lt!51394)))

(assert (=> b!101339 false))

(declare-fun b!101340 () Bool)

(declare-fun call!10494 () Bool)

(assert (=> b!101340 (= e!65957 (not call!10494))))

(declare-fun b!101341 () Bool)

(declare-fun res!50767 () Bool)

(assert (=> b!101341 (=> (not res!50767) (not e!65961))))

(assert (=> b!101341 (= res!50767 (valid!399 (_2!1168 lt!51385)))))

(declare-fun bm!10492 () Bool)

(assert (=> bm!10492 (= call!10494 (arrayContainsKey!0 (_keys!4220 newMap!16) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!101342 () Bool)

(assert (=> b!101342 (= e!65961 (= (map!1259 (_2!1168 lt!51385)) (+!132 (map!1259 newMap!16) (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!101343 () Bool)

(declare-fun lt!51378 () Unit!3048)

(assert (=> b!101343 (= e!65962 lt!51378)))

(assert (=> b!101343 (= lt!51378 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!43 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (defaultEntry!2522 newMap!16)))))

(assert (=> b!101343 (= lt!51381 call!10495)))

(declare-fun c!17444 () Bool)

(assert (=> b!101343 (= c!17444 ((_ is MissingZero!249) lt!51381))))

(assert (=> b!101343 e!65964))

(declare-fun c!17443 () Bool)

(declare-fun bm!10493 () Bool)

(assert (=> bm!10493 (= call!10493 (inRange!0 (ite c!17443 (index!3142 lt!51383) (ite c!17444 (index!3141 lt!51381) (index!3144 lt!51381))) (mask!6639 newMap!16)))))

(declare-fun d!27513 () Bool)

(assert (=> d!27513 e!65961))

(declare-fun res!50770 () Bool)

(assert (=> d!27513 (=> (not res!50770) (not e!65961))))

(assert (=> d!27513 (= res!50770 (_1!1168 lt!51385))))

(assert (=> d!27513 (= lt!51385 (tuple2!2315 true (LongMapFixedSize!863 (defaultEntry!2522 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (bvadd (_size!480 newMap!16) #b00000000000000000000000000000001) (array!4252 (store (arr!2018 (_keys!4220 newMap!16)) (ite c!17341 (index!3144 lt!51057) (index!3141 lt!51057)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)) (size!2270 (_keys!4220 newMap!16))) (array!4254 (store (arr!2019 (_values!2505 newMap!16)) (ite c!17341 (index!3144 lt!51057) (index!3141 lt!51057)) (ValueCellFull!977 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2271 (_values!2505 newMap!16))) (_vacant!480 newMap!16))))))

(declare-fun lt!51398 () Unit!3048)

(declare-fun lt!51405 () Unit!3048)

(assert (=> d!27513 (= lt!51398 lt!51405)))

(declare-fun lt!51401 () array!4251)

(declare-fun lt!51390 () array!4253)

(assert (=> d!27513 (contains!796 (getCurrentListMap!457 lt!51401 lt!51390 (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) (select (store (arr!2018 (_keys!4220 newMap!16)) (ite c!17341 (index!3144 lt!51057) (index!3141 lt!51057)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)) (ite c!17341 (index!3144 lt!51057) (index!3141 lt!51057))))))

(assert (=> d!27513 (= lt!51405 (lemmaValidKeyInArrayIsInListMap!103 lt!51401 lt!51390 (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (ite c!17341 (index!3144 lt!51057) (index!3141 lt!51057)) (defaultEntry!2522 newMap!16)))))

(assert (=> d!27513 (= lt!51390 (array!4254 (store (arr!2019 (_values!2505 newMap!16)) (ite c!17341 (index!3144 lt!51057) (index!3141 lt!51057)) (ValueCellFull!977 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2271 (_values!2505 newMap!16))))))

(assert (=> d!27513 (= lt!51401 (array!4252 (store (arr!2018 (_keys!4220 newMap!16)) (ite c!17341 (index!3144 lt!51057) (index!3141 lt!51057)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)) (size!2270 (_keys!4220 newMap!16))))))

(declare-fun lt!51404 () Unit!3048)

(declare-fun lt!51396 () Unit!3048)

(assert (=> d!27513 (= lt!51404 lt!51396)))

(declare-fun lt!51389 () array!4251)

(assert (=> d!27513 (= (arrayCountValidKeys!0 lt!51389 (ite c!17341 (index!3144 lt!51057) (index!3141 lt!51057)) (bvadd (ite c!17341 (index!3144 lt!51057) (index!3141 lt!51057)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4251 (_ BitVec 32)) Unit!3048)

(assert (=> d!27513 (= lt!51396 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!51389 (ite c!17341 (index!3144 lt!51057) (index!3141 lt!51057))))))

(assert (=> d!27513 (= lt!51389 (array!4252 (store (arr!2018 (_keys!4220 newMap!16)) (ite c!17341 (index!3144 lt!51057) (index!3141 lt!51057)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)) (size!2270 (_keys!4220 newMap!16))))))

(declare-fun lt!51384 () Unit!3048)

(declare-fun lt!51391 () Unit!3048)

(assert (=> d!27513 (= lt!51384 lt!51391)))

(declare-fun lt!51403 () array!4251)

(assert (=> d!27513 (arrayContainsKey!0 lt!51403 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!27513 (= lt!51391 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!51403 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (ite c!17341 (index!3144 lt!51057) (index!3141 lt!51057))))))

(assert (=> d!27513 (= lt!51403 (array!4252 (store (arr!2018 (_keys!4220 newMap!16)) (ite c!17341 (index!3144 lt!51057) (index!3141 lt!51057)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)) (size!2270 (_keys!4220 newMap!16))))))

(declare-fun lt!51395 () Unit!3048)

(declare-fun lt!51379 () Unit!3048)

(assert (=> d!27513 (= lt!51395 lt!51379)))

(assert (=> d!27513 (= (+!132 (getCurrentListMap!457 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) (tuple2!2317 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!457 (array!4252 (store (arr!2018 (_keys!4220 newMap!16)) (ite c!17341 (index!3144 lt!51057) (index!3141 lt!51057)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)) (size!2270 (_keys!4220 newMap!16))) (array!4254 (store (arr!2019 (_values!2505 newMap!16)) (ite c!17341 (index!3144 lt!51057) (index!3141 lt!51057)) (ValueCellFull!977 (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2271 (_values!2505 newMap!16))) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!27 (array!4251 array!4253 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 32) (_ BitVec 64) V!3169 Int) Unit!3048)

(assert (=> d!27513 (= lt!51379 (lemmaAddValidKeyToArrayThenAddPairToListMap!27 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) (ite c!17341 (index!3144 lt!51057) (index!3141 lt!51057)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2522 newMap!16)))))

(declare-fun lt!51406 () Unit!3048)

(declare-fun lt!51399 () Unit!3048)

(assert (=> d!27513 (= lt!51406 lt!51399)))

(assert (=> d!27513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4252 (store (arr!2018 (_keys!4220 newMap!16)) (ite c!17341 (index!3144 lt!51057) (index!3141 lt!51057)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)) (size!2270 (_keys!4220 newMap!16))) (mask!6639 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4251 (_ BitVec 32) (_ BitVec 32)) Unit!3048)

(assert (=> d!27513 (= lt!51399 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (_keys!4220 newMap!16) (ite c!17341 (index!3144 lt!51057) (index!3141 lt!51057)) (mask!6639 newMap!16)))))

(declare-fun lt!51387 () Unit!3048)

(declare-fun lt!51392 () Unit!3048)

(assert (=> d!27513 (= lt!51387 lt!51392)))

(assert (=> d!27513 (= (arrayCountValidKeys!0 (array!4252 (store (arr!2018 (_keys!4220 newMap!16)) (ite c!17341 (index!3144 lt!51057) (index!3141 lt!51057)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)) (size!2270 (_keys!4220 newMap!16))) #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4220 newMap!16) #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4251 (_ BitVec 32) (_ BitVec 64)) Unit!3048)

(assert (=> d!27513 (= lt!51392 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4220 newMap!16) (ite c!17341 (index!3144 lt!51057) (index!3141 lt!51057)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(declare-fun lt!51407 () Unit!3048)

(declare-fun lt!51386 () Unit!3048)

(assert (=> d!27513 (= lt!51407 lt!51386)))

(declare-fun lt!51388 () (_ BitVec 32))

(declare-fun lt!51400 () List!1572)

(assert (=> d!27513 (arrayNoDuplicates!0 (array!4252 (store (arr!2018 (_keys!4220 newMap!16)) (ite c!17341 (index!3144 lt!51057) (index!3141 lt!51057)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)) (size!2270 (_keys!4220 newMap!16))) lt!51388 lt!51400)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4251 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1572) Unit!3048)

(assert (=> d!27513 (= lt!51386 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4220 newMap!16) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (ite c!17341 (index!3144 lt!51057) (index!3141 lt!51057)) lt!51388 lt!51400))))

(assert (=> d!27513 (= lt!51400 Nil!1569)))

(assert (=> d!27513 (= lt!51388 #b00000000000000000000000000000000)))

(declare-fun lt!51380 () Unit!3048)

(assert (=> d!27513 (= lt!51380 e!65960)))

(declare-fun c!17445 () Bool)

(assert (=> d!27513 (= c!17445 (arrayContainsKey!0 (_keys!4220 newMap!16) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!51382 () Unit!3048)

(assert (=> d!27513 (= lt!51382 e!65962)))

(assert (=> d!27513 (= c!17443 (contains!796 (getCurrentListMap!457 (_keys!4220 newMap!16) (_values!2505 newMap!16) (mask!6639 newMap!16) (extraKeys!2335 newMap!16) (zeroValue!2401 newMap!16) (minValue!2401 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2522 newMap!16)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(assert (=> d!27513 (valid!399 newMap!16)))

(assert (=> d!27513 (= (updateHelperNewKey!43 newMap!16 (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355) (get!1302 (select (arr!2019 (_values!2505 (v!2833 (underlying!344 thiss!992)))) from!355) (dynLambda!374 (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!17341 (index!3144 lt!51057) (index!3141 lt!51057))) lt!51385)))

(declare-fun b!101344 () Bool)

(assert (=> b!101344 (= e!65959 (= (select (arr!2018 (_keys!4220 newMap!16)) (index!3142 lt!51383)) (select (arr!2018 (_keys!4220 (v!2833 (underlying!344 thiss!992)))) from!355)))))

(declare-fun b!101345 () Bool)

(declare-fun c!17446 () Bool)

(assert (=> b!101345 (= c!17446 ((_ is MissingVacant!249) lt!51381))))

(assert (=> b!101345 (= e!65964 e!65963)))

(declare-fun b!101346 () Bool)

(declare-fun res!50772 () Bool)

(assert (=> b!101346 (=> (not res!50772) (not e!65957))))

(assert (=> b!101346 (= res!50772 (= (select (arr!2018 (_keys!4220 newMap!16)) (index!3141 lt!51381)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101347 () Bool)

(assert (=> b!101347 (= e!65958 (not call!10494))))

(assert (= (and d!27513 c!17443) b!101339))

(assert (= (and d!27513 (not c!17443)) b!101343))

(assert (= (and b!101339 res!50775) b!101334))

(assert (= (and b!101334 res!50769) b!101344))

(assert (= (and b!101343 c!17444) b!101336))

(assert (= (and b!101343 (not c!17444)) b!101345))

(assert (= (and b!101336 res!50768) b!101346))

(assert (= (and b!101346 res!50772) b!101340))

(assert (= (and b!101345 c!17446) b!101332))

(assert (= (and b!101345 (not c!17446)) b!101335))

(assert (= (and b!101332 res!50771) b!101331))

(assert (= (and b!101331 res!50773) b!101347))

(assert (= (or b!101336 b!101332) bm!10490))

(assert (= (or b!101340 b!101347) bm!10492))

(assert (= (or b!101334 bm!10490) bm!10493))

(assert (= (or b!101339 b!101343) bm!10491))

(assert (= (and d!27513 c!17445) b!101338))

(assert (= (and d!27513 (not c!17445)) b!101337))

(assert (= (and d!27513 res!50770) b!101341))

(assert (= (and b!101341 res!50767) b!101333))

(assert (= (and b!101333 res!50774) b!101342))

(declare-fun m!112273 () Bool)

(assert (=> bm!10493 m!112273))

(declare-fun m!112275 () Bool)

(assert (=> b!101333 m!112275))

(assert (=> b!101333 m!112275))

(assert (=> b!101333 m!111399))

(declare-fun m!112277 () Bool)

(assert (=> b!101333 m!112277))

(assert (=> d!27513 m!111569))

(assert (=> d!27513 m!111399))

(declare-fun m!112279 () Bool)

(assert (=> d!27513 m!112279))

(assert (=> d!27513 m!111399))

(declare-fun m!112281 () Bool)

(assert (=> d!27513 m!112281))

(assert (=> d!27513 m!111437))

(assert (=> d!27513 m!111399))

(declare-fun m!112283 () Bool)

(assert (=> d!27513 m!112283))

(declare-fun m!112285 () Bool)

(assert (=> d!27513 m!112285))

(assert (=> d!27513 m!111399))

(declare-fun m!112287 () Bool)

(assert (=> d!27513 m!112287))

(assert (=> d!27513 m!111533))

(declare-fun m!112289 () Bool)

(assert (=> d!27513 m!112289))

(assert (=> d!27513 m!111399))

(assert (=> d!27513 m!111397))

(declare-fun m!112291 () Bool)

(assert (=> d!27513 m!112291))

(declare-fun m!112293 () Bool)

(assert (=> d!27513 m!112293))

(assert (=> d!27513 m!111569))

(assert (=> d!27513 m!111399))

(declare-fun m!112295 () Bool)

(assert (=> d!27513 m!112295))

(declare-fun m!112297 () Bool)

(assert (=> d!27513 m!112297))

(declare-fun m!112299 () Bool)

(assert (=> d!27513 m!112299))

(declare-fun m!112301 () Bool)

(assert (=> d!27513 m!112301))

(declare-fun m!112303 () Bool)

(assert (=> d!27513 m!112303))

(declare-fun m!112305 () Bool)

(assert (=> d!27513 m!112305))

(declare-fun m!112307 () Bool)

(assert (=> d!27513 m!112307))

(declare-fun m!112309 () Bool)

(assert (=> d!27513 m!112309))

(assert (=> d!27513 m!112301))

(assert (=> d!27513 m!112303))

(declare-fun m!112311 () Bool)

(assert (=> d!27513 m!112311))

(assert (=> d!27513 m!111569))

(assert (=> d!27513 m!112025))

(declare-fun m!112313 () Bool)

(assert (=> d!27513 m!112313))

(assert (=> d!27513 m!111399))

(declare-fun m!112315 () Bool)

(assert (=> d!27513 m!112315))

(assert (=> d!27513 m!111399))

(assert (=> d!27513 m!111635))

(declare-fun m!112317 () Bool)

(assert (=> b!101341 m!112317))

(declare-fun m!112319 () Bool)

(assert (=> b!101344 m!112319))

(declare-fun m!112321 () Bool)

(assert (=> b!101331 m!112321))

(assert (=> bm!10491 m!111399))

(assert (=> bm!10491 m!111647))

(assert (=> b!101343 m!111399))

(assert (=> b!101343 m!111689))

(assert (=> b!101339 m!111399))

(assert (=> b!101339 m!111669))

(assert (=> b!101342 m!112275))

(assert (=> b!101342 m!111425))

(assert (=> b!101342 m!111425))

(declare-fun m!112323 () Bool)

(assert (=> b!101342 m!112323))

(assert (=> bm!10492 m!111399))

(assert (=> bm!10492 m!111635))

(declare-fun m!112325 () Bool)

(assert (=> b!101346 m!112325))

(assert (=> b!101338 m!111399))

(declare-fun m!112327 () Bool)

(assert (=> b!101338 m!112327))

(assert (=> b!101338 m!111569))

(assert (=> b!101338 m!111569))

(assert (=> b!101338 m!111399))

(assert (=> b!101338 m!112279))

(assert (=> bm!10435 d!27513))

(assert (=> bm!10421 d!27397))

(declare-fun b!101348 () Bool)

(declare-fun e!65966 () Bool)

(declare-fun e!65968 () Bool)

(assert (=> b!101348 (= e!65966 e!65968)))

(declare-fun res!50776 () Bool)

(assert (=> b!101348 (=> (not res!50776) (not e!65968))))

(declare-fun e!65965 () Bool)

(assert (=> b!101348 (= res!50776 (not e!65965))))

(declare-fun res!50778 () Bool)

(assert (=> b!101348 (=> (not res!50778) (not e!65965))))

(assert (=> b!101348 (= res!50778 (validKeyInArray!0 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101349 () Bool)

(declare-fun e!65967 () Bool)

(declare-fun call!10497 () Bool)

(assert (=> b!101349 (= e!65967 call!10497)))

(declare-fun b!101350 () Bool)

(assert (=> b!101350 (= e!65967 call!10497)))

(declare-fun b!101351 () Bool)

(assert (=> b!101351 (= e!65968 e!65967)))

(declare-fun c!17447 () Bool)

(assert (=> b!101351 (= c!17447 (validKeyInArray!0 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!27515 () Bool)

(declare-fun res!50777 () Bool)

(assert (=> d!27515 (=> res!50777 e!65966)))

(assert (=> d!27515 (= res!50777 (bvsge #b00000000000000000000000000000000 (size!2270 (_keys!4220 newMap!16))))))

(assert (=> d!27515 (= (arrayNoDuplicates!0 (_keys!4220 newMap!16) #b00000000000000000000000000000000 Nil!1569) e!65966)))

(declare-fun bm!10494 () Bool)

(assert (=> bm!10494 (= call!10497 (arrayNoDuplicates!0 (_keys!4220 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!17447 (Cons!1568 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000) Nil!1569) Nil!1569)))))

(declare-fun b!101352 () Bool)

(assert (=> b!101352 (= e!65965 (contains!798 Nil!1569 (select (arr!2018 (_keys!4220 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!27515 (not res!50777)) b!101348))

(assert (= (and b!101348 res!50778) b!101352))

(assert (= (and b!101348 res!50776) b!101351))

(assert (= (and b!101351 c!17447) b!101350))

(assert (= (and b!101351 (not c!17447)) b!101349))

(assert (= (or b!101350 b!101349) bm!10494))

(assert (=> b!101348 m!111753))

(assert (=> b!101348 m!111753))

(assert (=> b!101348 m!111775))

(assert (=> b!101351 m!111753))

(assert (=> b!101351 m!111753))

(assert (=> b!101351 m!111775))

(assert (=> bm!10494 m!111753))

(declare-fun m!112329 () Bool)

(assert (=> bm!10494 m!112329))

(assert (=> b!101352 m!111753))

(assert (=> b!101352 m!111753))

(declare-fun m!112331 () Bool)

(assert (=> b!101352 m!112331))

(assert (=> b!100737 d!27515))

(assert (=> b!100838 d!27379))

(declare-fun condMapEmpty!3809 () Bool)

(declare-fun mapDefault!3809 () ValueCell!977)

(assert (=> mapNonEmpty!3808 (= condMapEmpty!3809 (= mapRest!3808 ((as const (Array (_ BitVec 32) ValueCell!977)) mapDefault!3809)))))

(declare-fun e!65969 () Bool)

(declare-fun mapRes!3809 () Bool)

(assert (=> mapNonEmpty!3808 (= tp!9676 (and e!65969 mapRes!3809))))

(declare-fun b!101354 () Bool)

(assert (=> b!101354 (= e!65969 tp_is_empty!2641)))

(declare-fun b!101353 () Bool)

(declare-fun e!65970 () Bool)

(assert (=> b!101353 (= e!65970 tp_is_empty!2641)))

(declare-fun mapNonEmpty!3809 () Bool)

(declare-fun tp!9677 () Bool)

(assert (=> mapNonEmpty!3809 (= mapRes!3809 (and tp!9677 e!65970))))

(declare-fun mapKey!3809 () (_ BitVec 32))

(declare-fun mapValue!3809 () ValueCell!977)

(declare-fun mapRest!3809 () (Array (_ BitVec 32) ValueCell!977))

(assert (=> mapNonEmpty!3809 (= mapRest!3808 (store mapRest!3809 mapKey!3809 mapValue!3809))))

(declare-fun mapIsEmpty!3809 () Bool)

(assert (=> mapIsEmpty!3809 mapRes!3809))

(assert (= (and mapNonEmpty!3808 condMapEmpty!3809) mapIsEmpty!3809))

(assert (= (and mapNonEmpty!3808 (not condMapEmpty!3809)) mapNonEmpty!3809))

(assert (= (and mapNonEmpty!3809 ((_ is ValueCellFull!977) mapValue!3809)) b!101353))

(assert (= (and mapNonEmpty!3808 ((_ is ValueCellFull!977) mapDefault!3809)) b!101354))

(declare-fun m!112333 () Bool)

(assert (=> mapNonEmpty!3809 m!112333))

(declare-fun condMapEmpty!3810 () Bool)

(declare-fun mapDefault!3810 () ValueCell!977)

(assert (=> mapNonEmpty!3807 (= condMapEmpty!3810 (= mapRest!3807 ((as const (Array (_ BitVec 32) ValueCell!977)) mapDefault!3810)))))

(declare-fun e!65971 () Bool)

(declare-fun mapRes!3810 () Bool)

(assert (=> mapNonEmpty!3807 (= tp!9675 (and e!65971 mapRes!3810))))

(declare-fun b!101356 () Bool)

(assert (=> b!101356 (= e!65971 tp_is_empty!2641)))

(declare-fun b!101355 () Bool)

(declare-fun e!65972 () Bool)

(assert (=> b!101355 (= e!65972 tp_is_empty!2641)))

(declare-fun mapNonEmpty!3810 () Bool)

(declare-fun tp!9678 () Bool)

(assert (=> mapNonEmpty!3810 (= mapRes!3810 (and tp!9678 e!65972))))

(declare-fun mapValue!3810 () ValueCell!977)

(declare-fun mapKey!3810 () (_ BitVec 32))

(declare-fun mapRest!3810 () (Array (_ BitVec 32) ValueCell!977))

(assert (=> mapNonEmpty!3810 (= mapRest!3807 (store mapRest!3810 mapKey!3810 mapValue!3810))))

(declare-fun mapIsEmpty!3810 () Bool)

(assert (=> mapIsEmpty!3810 mapRes!3810))

(assert (= (and mapNonEmpty!3807 condMapEmpty!3810) mapIsEmpty!3810))

(assert (= (and mapNonEmpty!3807 (not condMapEmpty!3810)) mapNonEmpty!3810))

(assert (= (and mapNonEmpty!3810 ((_ is ValueCellFull!977) mapValue!3810)) b!101355))

(assert (= (and mapNonEmpty!3807 ((_ is ValueCellFull!977) mapDefault!3810)) b!101356))

(declare-fun m!112335 () Bool)

(assert (=> mapNonEmpty!3810 m!112335))

(declare-fun b_lambda!4537 () Bool)

(assert (= b_lambda!4531 (or (and b!100598 b_free!2449 (= (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) (defaultEntry!2522 newMap!16))) (and b!100584 b_free!2451) b_lambda!4537)))

(declare-fun b_lambda!4539 () Bool)

(assert (= b_lambda!4533 (or (and b!100598 b_free!2449 (= (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) (defaultEntry!2522 newMap!16))) (and b!100584 b_free!2451) b_lambda!4539)))

(declare-fun b_lambda!4541 () Bool)

(assert (= b_lambda!4535 (or (and b!100598 b_free!2449 (= (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) (defaultEntry!2522 newMap!16))) (and b!100584 b_free!2451) b_lambda!4541)))

(declare-fun b_lambda!4543 () Bool)

(assert (= b_lambda!4525 (or (and b!100598 b_free!2449 (= (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))) (defaultEntry!2522 newMap!16))) (and b!100584 b_free!2451) b_lambda!4543)))

(declare-fun b_lambda!4545 () Bool)

(assert (= b_lambda!4529 (or (and b!100598 b_free!2449) (and b!100584 b_free!2451 (= (defaultEntry!2522 newMap!16) (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))))) b_lambda!4545)))

(declare-fun b_lambda!4547 () Bool)

(assert (= b_lambda!4527 (or (and b!100598 b_free!2449) (and b!100584 b_free!2451 (= (defaultEntry!2522 newMap!16) (defaultEntry!2522 (v!2833 (underlying!344 thiss!992))))) b_lambda!4547)))

(check-sat (not d!27383) (not b!101012) (not d!27481) (not b!101120) (not b!101245) (not b!101060) (not bm!10470) (not bm!10451) (not d!27501) (not b!101113) (not d!27381) (not bm!10442) (not bm!10463) (not b!101017) (not d!27473) (not b!101161) (not b!101241) (not b!101291) (not d!27491) (not d!27457) (not d!27483) (not b!101282) (not b!101216) (not b!101339) (not d!27459) (not b!100989) (not b!101096) (not b!101348) (not bm!10492) (not b_lambda!4541) (not b!101092) (not d!27453) (not bm!10477) (not d!27485) (not b!101351) (not b_lambda!4539) (not bm!10455) (not d!27503) (not b!101118) (not b!101097) (not b!101250) (not b!101094) (not d!27423) (not d!27509) (not b!101180) (not d!27489) (not b!101220) (not b!101095) (not b!101125) (not d!27409) (not b!101156) (not b!101221) (not b_next!2449) (not b!101255) (not b!101111) (not b!101217) (not bm!10443) (not b!101033) (not d!27465) (not b!101218) (not bm!10453) (not d!27493) (not b!101153) (not d!27403) (not d!27463) b_and!6237 (not d!27387) (not b!101261) (not b!101224) (not b!101151) (not b!101091) (not d!27441) (not mapNonEmpty!3810) (not b!101271) (not d!27469) (not d!27451) (not b!101121) (not d!27497) (not bm!10475) (not b!101158) (not b!101242) (not b!101093) (not bm!10460) (not b!101008) (not b!100996) (not b!101018) (not bm!10468) (not b!101126) (not bm!10452) (not b!101177) (not d!27495) (not b!101223) (not b!101132) (not d!27375) (not b!101276) (not d!27499) (not b_lambda!4537) (not b!101130) (not d!27505) (not bm!10441) (not bm!10480) (not b!101290) (not b!101288) (not d!27471) (not b!101185) (not b!101175) (not b!101226) (not b!101100) (not b!101230) (not b!101102) (not d!27411) (not bm!10461) (not b!101247) (not b!101219) (not b!101088) (not b!101007) (not b_lambda!4545) (not b!100997) (not b!101296) (not b!101143) (not b!100995) (not b_lambda!4543) (not d!27421) (not b!101172) (not bm!10448) (not bm!10469) (not bm!10445) (not d!27401) (not bm!10473) (not d!27439) (not b!101343) (not b!101240) (not b!101181) (not bm!10493) (not b!101283) (not b!101122) (not b!101127) (not d!27467) (not b!101171) (not b!101179) (not b!101341) (not b!101352) (not b!101338) b_and!6239 (not b!101292) (not bm!10459) (not b!101295) (not b!101170) (not bm!10494) (not b!101144) (not b!101214) (not bm!10481) (not d!27399) (not bm!10474) (not b!101063) (not b!101129) (not d!27513) (not d!27391) (not b!101249) (not b!101287) (not b!101016) (not d!27487) (not b_lambda!4519) (not d!27413) (not d!27377) (not b!101058) (not b!101342) (not b!101228) tp_is_empty!2641 (not d!27395) (not b!101049) (not mapNonEmpty!3809) (not d!27447) (not d!27443) (not b!101229) (not b!101285) (not b!101231) (not d!27437) (not b!101155) (not d!27397) (not d!27419) (not b!101274) (not d!27435) (not b!101116) (not d!27385) (not d!27507) (not b!101286) (not b!101253) (not b!101112) (not b!100998) (not bm!10491) (not b!101014) (not d!27405) (not d!27415) (not b!101030) (not b_lambda!4547) (not b!101124) (not b!101009) (not b!101333) (not d!27449) (not bm!10456) (not b!101251) (not b_next!2451) (not b_lambda!4523) (not b!101055))
(check-sat b_and!6237 b_and!6239 (not b_next!2449) (not b_next!2451))
