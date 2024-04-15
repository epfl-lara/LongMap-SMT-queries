; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14674 () Bool)

(assert start!14674)

(declare-fun b!139102 () Bool)

(declare-fun b_free!3001 () Bool)

(declare-fun b_next!3001 () Bool)

(assert (=> b!139102 (= b_free!3001 (not b_next!3001))))

(declare-fun tp!11469 () Bool)

(declare-fun b_and!8641 () Bool)

(assert (=> b!139102 (= tp!11469 b_and!8641)))

(declare-fun b!139101 () Bool)

(declare-fun b_free!3003 () Bool)

(declare-fun b_next!3003 () Bool)

(assert (=> b!139101 (= b_free!3003 (not b_next!3003))))

(declare-fun tp!11472 () Bool)

(declare-fun b_and!8643 () Bool)

(assert (=> b!139101 (= tp!11472 b_and!8643)))

(declare-fun b!139095 () Bool)

(declare-fun e!90635 () Bool)

(declare-fun tp_is_empty!2917 () Bool)

(assert (=> b!139095 (= e!90635 tp_is_empty!2917)))

(declare-fun mapIsEmpty!4787 () Bool)

(declare-fun mapRes!4787 () Bool)

(assert (=> mapIsEmpty!4787 mapRes!4787))

(declare-fun mapNonEmpty!4787 () Bool)

(declare-fun tp!11470 () Bool)

(declare-fun e!90639 () Bool)

(assert (=> mapNonEmpty!4787 (= mapRes!4787 (and tp!11470 e!90639))))

(declare-datatypes ((V!3537 0))(
  ( (V!3538 (val!1503 Int)) )
))
(declare-datatypes ((ValueCell!1115 0))(
  ( (ValueCellFull!1115 (v!3258 V!3537)) (EmptyCell!1115) )
))
(declare-fun mapRest!4787 () (Array (_ BitVec 32) ValueCell!1115))

(declare-fun mapKey!4788 () (_ BitVec 32))

(declare-datatypes ((array!4847 0))(
  ( (array!4848 (arr!2290 (Array (_ BitVec 32) (_ BitVec 64))) (size!2563 (_ BitVec 32))) )
))
(declare-datatypes ((array!4849 0))(
  ( (array!4850 (arr!2291 (Array (_ BitVec 32) ValueCell!1115)) (size!2564 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1138 0))(
  ( (LongMapFixedSize!1139 (defaultEntry!2931 Int) (mask!7266 (_ BitVec 32)) (extraKeys!2686 (_ BitVec 32)) (zeroValue!2781 V!3537) (minValue!2781 V!3537) (_size!618 (_ BitVec 32)) (_keys!4689 array!4847) (_values!2914 array!4849) (_vacant!618 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1138)

(declare-fun mapValue!4788 () ValueCell!1115)

(assert (=> mapNonEmpty!4787 (= (arr!2291 (_values!2914 newMap!16)) (store mapRest!4787 mapKey!4788 mapValue!4788))))

(declare-fun b!139096 () Bool)

(declare-fun e!90643 () Bool)

(declare-fun e!90638 () Bool)

(assert (=> b!139096 (= e!90643 e!90638)))

(declare-fun b!139097 () Bool)

(declare-fun e!90637 () Bool)

(assert (=> b!139097 (= e!90637 tp_is_empty!2917)))

(declare-fun mapIsEmpty!4788 () Bool)

(declare-fun mapRes!4788 () Bool)

(assert (=> mapIsEmpty!4788 mapRes!4788))

(declare-fun b!139098 () Bool)

(declare-fun e!90644 () Bool)

(declare-fun e!90640 () Bool)

(assert (=> b!139098 (= e!90644 e!90640)))

(declare-fun res!66503 () Bool)

(assert (=> b!139098 (=> (not res!66503) (not e!90640))))

(declare-datatypes ((Cell!918 0))(
  ( (Cell!919 (v!3259 LongMapFixedSize!1138)) )
))
(declare-datatypes ((LongMap!918 0))(
  ( (LongMap!919 (underlying!470 Cell!918)) )
))
(declare-fun thiss!992 () LongMap!918)

(declare-datatypes ((tuple2!2638 0))(
  ( (tuple2!2639 (_1!1330 (_ BitVec 64)) (_2!1330 V!3537)) )
))
(declare-datatypes ((List!1728 0))(
  ( (Nil!1725) (Cons!1724 (h!2331 tuple2!2638) (t!6279 List!1728)) )
))
(declare-datatypes ((ListLongMap!1699 0))(
  ( (ListLongMap!1700 (toList!865 List!1728)) )
))
(declare-fun lt!72660 () ListLongMap!1699)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!906 (ListLongMap!1699 (_ BitVec 64)) Bool)

(assert (=> b!139098 (= res!66503 (contains!906 lt!72660 (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2640 0))(
  ( (tuple2!2641 (_1!1331 Bool) (_2!1331 LongMapFixedSize!1138)) )
))
(declare-fun lt!72664 () tuple2!2640)

(declare-fun update!205 (LongMapFixedSize!1138 (_ BitVec 64) V!3537) tuple2!2640)

(declare-fun get!1514 (ValueCell!1115 V!3537) V!3537)

(declare-fun dynLambda!431 (Int (_ BitVec 64)) V!3537)

(assert (=> b!139098 (= lt!72664 (update!205 newMap!16 (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) (get!1514 (select (arr!2291 (_values!2914 (v!3259 (underlying!470 thiss!992)))) from!355) (dynLambda!431 (defaultEntry!2931 (v!3259 (underlying!470 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!139099 () Bool)

(declare-fun res!66502 () Bool)

(declare-fun e!90646 () Bool)

(assert (=> b!139099 (=> (not res!66502) (not e!90646))))

(assert (=> b!139099 (= res!66502 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2563 (_keys!4689 (v!3259 (underlying!470 thiss!992)))))))))

(declare-fun b!139100 () Bool)

(assert (=> b!139100 (= e!90640 (not (bvslt (size!2563 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) #b01111111111111111111111111111111)))))

(declare-datatypes ((List!1729 0))(
  ( (Nil!1726) (Cons!1725 (h!2332 (_ BitVec 64)) (t!6280 List!1729)) )
))
(declare-fun arrayNoDuplicates!0 (array!4847 (_ BitVec 32) List!1729) Bool)

(assert (=> b!139100 (arrayNoDuplicates!0 (_keys!4689 (v!3259 (underlying!470 thiss!992))) from!355 Nil!1726)))

(declare-datatypes ((Unit!4379 0))(
  ( (Unit!4380) )
))
(declare-fun lt!72663 () Unit!4379)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4847 (_ BitVec 32) (_ BitVec 32)) Unit!4379)

(assert (=> b!139100 (= lt!72663 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4689 (v!3259 (underlying!470 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139100 (arrayContainsKey!0 (_keys!4689 (v!3259 (underlying!470 thiss!992))) (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!72661 () Unit!4379)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!139 (array!4847 array!4849 (_ BitVec 32) (_ BitVec 32) V!3537 V!3537 (_ BitVec 64) (_ BitVec 32) Int) Unit!4379)

(assert (=> b!139100 (= lt!72661 (lemmaListMapContainsThenArrayContainsFrom!139 (_keys!4689 (v!3259 (underlying!470 thiss!992))) (_values!2914 (v!3259 (underlying!470 thiss!992))) (mask!7266 (v!3259 (underlying!470 thiss!992))) (extraKeys!2686 (v!3259 (underlying!470 thiss!992))) (zeroValue!2781 (v!3259 (underlying!470 thiss!992))) (minValue!2781 (v!3259 (underlying!470 thiss!992))) (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2931 (v!3259 (underlying!470 thiss!992)))))))

(declare-fun e!90647 () Bool)

(declare-fun e!90642 () Bool)

(declare-fun array_inv!1461 (array!4847) Bool)

(declare-fun array_inv!1462 (array!4849) Bool)

(assert (=> b!139101 (= e!90642 (and tp!11472 tp_is_empty!2917 (array_inv!1461 (_keys!4689 newMap!16)) (array_inv!1462 (_values!2914 newMap!16)) e!90647))))

(declare-fun e!90641 () Bool)

(declare-fun e!90636 () Bool)

(assert (=> b!139102 (= e!90636 (and tp!11469 tp_is_empty!2917 (array_inv!1461 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) (array_inv!1462 (_values!2914 (v!3259 (underlying!470 thiss!992)))) e!90641))))

(declare-fun b!139103 () Bool)

(declare-fun res!66505 () Bool)

(assert (=> b!139103 (=> (not res!66505) (not e!90646))))

(assert (=> b!139103 (= res!66505 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7266 newMap!16)) (_size!618 (v!3259 (underlying!470 thiss!992)))))))

(declare-fun res!66501 () Bool)

(assert (=> start!14674 (=> (not res!66501) (not e!90646))))

(declare-fun valid!552 (LongMap!918) Bool)

(assert (=> start!14674 (= res!66501 (valid!552 thiss!992))))

(assert (=> start!14674 e!90646))

(assert (=> start!14674 e!90643))

(assert (=> start!14674 true))

(assert (=> start!14674 e!90642))

(declare-fun b!139104 () Bool)

(assert (=> b!139104 (= e!90641 (and e!90637 mapRes!4788))))

(declare-fun condMapEmpty!4788 () Bool)

(declare-fun mapDefault!4788 () ValueCell!1115)

(assert (=> b!139104 (= condMapEmpty!4788 (= (arr!2291 (_values!2914 (v!3259 (underlying!470 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1115)) mapDefault!4788)))))

(declare-fun b!139105 () Bool)

(assert (=> b!139105 (= e!90647 (and e!90635 mapRes!4787))))

(declare-fun condMapEmpty!4787 () Bool)

(declare-fun mapDefault!4787 () ValueCell!1115)

(assert (=> b!139105 (= condMapEmpty!4787 (= (arr!2291 (_values!2914 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1115)) mapDefault!4787)))))

(declare-fun b!139106 () Bool)

(assert (=> b!139106 (= e!90639 tp_is_empty!2917)))

(declare-fun b!139107 () Bool)

(assert (=> b!139107 (= e!90638 e!90636)))

(declare-fun b!139108 () Bool)

(declare-fun e!90634 () Bool)

(assert (=> b!139108 (= e!90634 tp_is_empty!2917)))

(declare-fun b!139109 () Bool)

(declare-fun res!66500 () Bool)

(assert (=> b!139109 (=> (not res!66500) (not e!90646))))

(declare-fun valid!553 (LongMapFixedSize!1138) Bool)

(assert (=> b!139109 (= res!66500 (valid!553 newMap!16))))

(declare-fun mapNonEmpty!4788 () Bool)

(declare-fun tp!11471 () Bool)

(assert (=> mapNonEmpty!4788 (= mapRes!4788 (and tp!11471 e!90634))))

(declare-fun mapRest!4788 () (Array (_ BitVec 32) ValueCell!1115))

(declare-fun mapKey!4787 () (_ BitVec 32))

(declare-fun mapValue!4787 () ValueCell!1115)

(assert (=> mapNonEmpty!4788 (= (arr!2291 (_values!2914 (v!3259 (underlying!470 thiss!992)))) (store mapRest!4788 mapKey!4787 mapValue!4787))))

(declare-fun b!139110 () Bool)

(assert (=> b!139110 (= e!90646 e!90644)))

(declare-fun res!66504 () Bool)

(assert (=> b!139110 (=> (not res!66504) (not e!90644))))

(declare-fun lt!72662 () ListLongMap!1699)

(assert (=> b!139110 (= res!66504 (and (= lt!72662 lt!72660) (not (= (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1415 (LongMapFixedSize!1138) ListLongMap!1699)

(assert (=> b!139110 (= lt!72660 (map!1415 newMap!16))))

(declare-fun getCurrentListMap!529 (array!4847 array!4849 (_ BitVec 32) (_ BitVec 32) V!3537 V!3537 (_ BitVec 32) Int) ListLongMap!1699)

(assert (=> b!139110 (= lt!72662 (getCurrentListMap!529 (_keys!4689 (v!3259 (underlying!470 thiss!992))) (_values!2914 (v!3259 (underlying!470 thiss!992))) (mask!7266 (v!3259 (underlying!470 thiss!992))) (extraKeys!2686 (v!3259 (underlying!470 thiss!992))) (zeroValue!2781 (v!3259 (underlying!470 thiss!992))) (minValue!2781 (v!3259 (underlying!470 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2931 (v!3259 (underlying!470 thiss!992)))))))

(assert (= (and start!14674 res!66501) b!139099))

(assert (= (and b!139099 res!66502) b!139109))

(assert (= (and b!139109 res!66500) b!139103))

(assert (= (and b!139103 res!66505) b!139110))

(assert (= (and b!139110 res!66504) b!139098))

(assert (= (and b!139098 res!66503) b!139100))

(assert (= (and b!139104 condMapEmpty!4788) mapIsEmpty!4788))

(assert (= (and b!139104 (not condMapEmpty!4788)) mapNonEmpty!4788))

(get-info :version)

(assert (= (and mapNonEmpty!4788 ((_ is ValueCellFull!1115) mapValue!4787)) b!139108))

(assert (= (and b!139104 ((_ is ValueCellFull!1115) mapDefault!4788)) b!139097))

(assert (= b!139102 b!139104))

(assert (= b!139107 b!139102))

(assert (= b!139096 b!139107))

(assert (= start!14674 b!139096))

(assert (= (and b!139105 condMapEmpty!4787) mapIsEmpty!4787))

(assert (= (and b!139105 (not condMapEmpty!4787)) mapNonEmpty!4787))

(assert (= (and mapNonEmpty!4787 ((_ is ValueCellFull!1115) mapValue!4788)) b!139106))

(assert (= (and b!139105 ((_ is ValueCellFull!1115) mapDefault!4787)) b!139095))

(assert (= b!139101 b!139105))

(assert (= start!14674 b!139101))

(declare-fun b_lambda!6217 () Bool)

(assert (=> (not b_lambda!6217) (not b!139098)))

(declare-fun t!6276 () Bool)

(declare-fun tb!2513 () Bool)

(assert (=> (and b!139102 (= (defaultEntry!2931 (v!3259 (underlying!470 thiss!992))) (defaultEntry!2931 (v!3259 (underlying!470 thiss!992)))) t!6276) tb!2513))

(declare-fun result!4129 () Bool)

(assert (=> tb!2513 (= result!4129 tp_is_empty!2917)))

(assert (=> b!139098 t!6276))

(declare-fun b_and!8645 () Bool)

(assert (= b_and!8641 (and (=> t!6276 result!4129) b_and!8645)))

(declare-fun tb!2515 () Bool)

(declare-fun t!6278 () Bool)

(assert (=> (and b!139101 (= (defaultEntry!2931 newMap!16) (defaultEntry!2931 (v!3259 (underlying!470 thiss!992)))) t!6278) tb!2515))

(declare-fun result!4133 () Bool)

(assert (= result!4133 result!4129))

(assert (=> b!139098 t!6278))

(declare-fun b_and!8647 () Bool)

(assert (= b_and!8643 (and (=> t!6278 result!4133) b_and!8647)))

(declare-fun m!166009 () Bool)

(assert (=> mapNonEmpty!4787 m!166009))

(declare-fun m!166011 () Bool)

(assert (=> b!139110 m!166011))

(declare-fun m!166013 () Bool)

(assert (=> b!139110 m!166013))

(declare-fun m!166015 () Bool)

(assert (=> b!139110 m!166015))

(declare-fun m!166017 () Bool)

(assert (=> mapNonEmpty!4788 m!166017))

(declare-fun m!166019 () Bool)

(assert (=> b!139109 m!166019))

(declare-fun m!166021 () Bool)

(assert (=> b!139100 m!166021))

(declare-fun m!166023 () Bool)

(assert (=> b!139100 m!166023))

(assert (=> b!139100 m!166011))

(declare-fun m!166025 () Bool)

(assert (=> b!139100 m!166025))

(assert (=> b!139100 m!166011))

(assert (=> b!139100 m!166011))

(declare-fun m!166027 () Bool)

(assert (=> b!139100 m!166027))

(declare-fun m!166029 () Bool)

(assert (=> b!139102 m!166029))

(declare-fun m!166031 () Bool)

(assert (=> b!139102 m!166031))

(declare-fun m!166033 () Bool)

(assert (=> b!139098 m!166033))

(declare-fun m!166035 () Bool)

(assert (=> b!139098 m!166035))

(declare-fun m!166037 () Bool)

(assert (=> b!139098 m!166037))

(assert (=> b!139098 m!166011))

(assert (=> b!139098 m!166035))

(assert (=> b!139098 m!166011))

(declare-fun m!166039 () Bool)

(assert (=> b!139098 m!166039))

(assert (=> b!139098 m!166011))

(assert (=> b!139098 m!166037))

(declare-fun m!166041 () Bool)

(assert (=> b!139098 m!166041))

(assert (=> b!139098 m!166033))

(declare-fun m!166043 () Bool)

(assert (=> b!139101 m!166043))

(declare-fun m!166045 () Bool)

(assert (=> b!139101 m!166045))

(declare-fun m!166047 () Bool)

(assert (=> start!14674 m!166047))

(check-sat (not start!14674) (not mapNonEmpty!4787) b_and!8647 (not b_lambda!6217) (not b!139110) (not b!139101) (not mapNonEmpty!4788) (not b_next!3003) tp_is_empty!2917 (not b!139100) (not b!139109) (not b!139098) (not b!139102) (not b_next!3001) b_and!8645)
(check-sat b_and!8645 b_and!8647 (not b_next!3001) (not b_next!3003))
(get-model)

(declare-fun b_lambda!6223 () Bool)

(assert (= b_lambda!6217 (or (and b!139102 b_free!3001) (and b!139101 b_free!3003 (= (defaultEntry!2931 newMap!16) (defaultEntry!2931 (v!3259 (underlying!470 thiss!992))))) b_lambda!6223)))

(check-sat (not start!14674) (not mapNonEmpty!4787) b_and!8647 (not b!139110) (not b!139101) (not b_next!3003) tp_is_empty!2917 (not b!139100) (not b!139109) (not b!139098) (not b!139102) (not b_next!3001) b_and!8645 (not mapNonEmpty!4788) (not b_lambda!6223))
(check-sat b_and!8645 b_and!8647 (not b_next!3001) (not b_next!3003))
(get-model)

(declare-fun d!43505 () Bool)

(assert (=> d!43505 (= (valid!552 thiss!992) (valid!553 (v!3259 (underlying!470 thiss!992))))))

(declare-fun bs!5813 () Bool)

(assert (= bs!5813 d!43505))

(declare-fun m!166129 () Bool)

(assert (=> bs!5813 m!166129))

(assert (=> start!14674 d!43505))

(declare-fun d!43507 () Bool)

(declare-fun res!66548 () Bool)

(declare-fun e!90749 () Bool)

(assert (=> d!43507 (=> res!66548 e!90749)))

(assert (=> d!43507 (= res!66548 (bvsge from!355 (size!2563 (_keys!4689 (v!3259 (underlying!470 thiss!992))))))))

(assert (=> d!43507 (= (arrayNoDuplicates!0 (_keys!4689 (v!3259 (underlying!470 thiss!992))) from!355 Nil!1726) e!90749)))

(declare-fun b!139223 () Bool)

(declare-fun e!90746 () Bool)

(declare-fun call!15322 () Bool)

(assert (=> b!139223 (= e!90746 call!15322)))

(declare-fun b!139224 () Bool)

(declare-fun e!90748 () Bool)

(assert (=> b!139224 (= e!90748 e!90746)))

(declare-fun c!26099 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!139224 (= c!26099 (validKeyInArray!0 (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355)))))

(declare-fun b!139225 () Bool)

(declare-fun e!90747 () Bool)

(declare-fun contains!907 (List!1729 (_ BitVec 64)) Bool)

(assert (=> b!139225 (= e!90747 (contains!907 Nil!1726 (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355)))))

(declare-fun bm!15319 () Bool)

(assert (=> bm!15319 (= call!15322 (arrayNoDuplicates!0 (_keys!4689 (v!3259 (underlying!470 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!26099 (Cons!1725 (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) Nil!1726) Nil!1726)))))

(declare-fun b!139226 () Bool)

(assert (=> b!139226 (= e!90749 e!90748)))

(declare-fun res!66550 () Bool)

(assert (=> b!139226 (=> (not res!66550) (not e!90748))))

(assert (=> b!139226 (= res!66550 (not e!90747))))

(declare-fun res!66549 () Bool)

(assert (=> b!139226 (=> (not res!66549) (not e!90747))))

(assert (=> b!139226 (= res!66549 (validKeyInArray!0 (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355)))))

(declare-fun b!139227 () Bool)

(assert (=> b!139227 (= e!90746 call!15322)))

(assert (= (and d!43507 (not res!66548)) b!139226))

(assert (= (and b!139226 res!66549) b!139225))

(assert (= (and b!139226 res!66550) b!139224))

(assert (= (and b!139224 c!26099) b!139223))

(assert (= (and b!139224 (not c!26099)) b!139227))

(assert (= (or b!139223 b!139227) bm!15319))

(assert (=> b!139224 m!166011))

(assert (=> b!139224 m!166011))

(declare-fun m!166131 () Bool)

(assert (=> b!139224 m!166131))

(assert (=> b!139225 m!166011))

(assert (=> b!139225 m!166011))

(declare-fun m!166133 () Bool)

(assert (=> b!139225 m!166133))

(assert (=> bm!15319 m!166011))

(declare-fun m!166135 () Bool)

(assert (=> bm!15319 m!166135))

(assert (=> b!139226 m!166011))

(assert (=> b!139226 m!166011))

(assert (=> b!139226 m!166131))

(assert (=> b!139100 d!43507))

(declare-fun d!43509 () Bool)

(assert (=> d!43509 (arrayNoDuplicates!0 (_keys!4689 (v!3259 (underlying!470 thiss!992))) from!355 Nil!1726)))

(declare-fun lt!72697 () Unit!4379)

(declare-fun choose!39 (array!4847 (_ BitVec 32) (_ BitVec 32)) Unit!4379)

(assert (=> d!43509 (= lt!72697 (choose!39 (_keys!4689 (v!3259 (underlying!470 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!43509 (bvslt (size!2563 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!43509 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4689 (v!3259 (underlying!470 thiss!992))) #b00000000000000000000000000000000 from!355) lt!72697)))

(declare-fun bs!5814 () Bool)

(assert (= bs!5814 d!43509))

(assert (=> bs!5814 m!166023))

(declare-fun m!166137 () Bool)

(assert (=> bs!5814 m!166137))

(assert (=> b!139100 d!43509))

(declare-fun d!43511 () Bool)

(declare-fun res!66555 () Bool)

(declare-fun e!90754 () Bool)

(assert (=> d!43511 (=> res!66555 e!90754)))

(assert (=> d!43511 (= res!66555 (= (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355)))))

(assert (=> d!43511 (= (arrayContainsKey!0 (_keys!4689 (v!3259 (underlying!470 thiss!992))) (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!90754)))

(declare-fun b!139232 () Bool)

(declare-fun e!90755 () Bool)

(assert (=> b!139232 (= e!90754 e!90755)))

(declare-fun res!66556 () Bool)

(assert (=> b!139232 (=> (not res!66556) (not e!90755))))

(assert (=> b!139232 (= res!66556 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2563 (_keys!4689 (v!3259 (underlying!470 thiss!992))))))))

(declare-fun b!139233 () Bool)

(assert (=> b!139233 (= e!90755 (arrayContainsKey!0 (_keys!4689 (v!3259 (underlying!470 thiss!992))) (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!43511 (not res!66555)) b!139232))

(assert (= (and b!139232 res!66556) b!139233))

(declare-fun m!166139 () Bool)

(assert (=> d!43511 m!166139))

(assert (=> b!139233 m!166011))

(declare-fun m!166141 () Bool)

(assert (=> b!139233 m!166141))

(assert (=> b!139100 d!43511))

(declare-fun d!43513 () Bool)

(declare-fun e!90758 () Bool)

(assert (=> d!43513 e!90758))

(declare-fun c!26102 () Bool)

(assert (=> d!43513 (= c!26102 (and (not (= (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!72700 () Unit!4379)

(declare-fun choose!861 (array!4847 array!4849 (_ BitVec 32) (_ BitVec 32) V!3537 V!3537 (_ BitVec 64) (_ BitVec 32) Int) Unit!4379)

(assert (=> d!43513 (= lt!72700 (choose!861 (_keys!4689 (v!3259 (underlying!470 thiss!992))) (_values!2914 (v!3259 (underlying!470 thiss!992))) (mask!7266 (v!3259 (underlying!470 thiss!992))) (extraKeys!2686 (v!3259 (underlying!470 thiss!992))) (zeroValue!2781 (v!3259 (underlying!470 thiss!992))) (minValue!2781 (v!3259 (underlying!470 thiss!992))) (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2931 (v!3259 (underlying!470 thiss!992)))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!43513 (validMask!0 (mask!7266 (v!3259 (underlying!470 thiss!992))))))

(assert (=> d!43513 (= (lemmaListMapContainsThenArrayContainsFrom!139 (_keys!4689 (v!3259 (underlying!470 thiss!992))) (_values!2914 (v!3259 (underlying!470 thiss!992))) (mask!7266 (v!3259 (underlying!470 thiss!992))) (extraKeys!2686 (v!3259 (underlying!470 thiss!992))) (zeroValue!2781 (v!3259 (underlying!470 thiss!992))) (minValue!2781 (v!3259 (underlying!470 thiss!992))) (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2931 (v!3259 (underlying!470 thiss!992)))) lt!72700)))

(declare-fun b!139238 () Bool)

(assert (=> b!139238 (= e!90758 (arrayContainsKey!0 (_keys!4689 (v!3259 (underlying!470 thiss!992))) (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!139239 () Bool)

(assert (=> b!139239 (= e!90758 (ite (= (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2686 (v!3259 (underlying!470 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2686 (v!3259 (underlying!470 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!43513 c!26102) b!139238))

(assert (= (and d!43513 (not c!26102)) b!139239))

(assert (=> d!43513 m!166011))

(declare-fun m!166143 () Bool)

(assert (=> d!43513 m!166143))

(declare-fun m!166145 () Bool)

(assert (=> d!43513 m!166145))

(assert (=> b!139238 m!166011))

(assert (=> b!139238 m!166027))

(assert (=> b!139100 d!43513))

(declare-fun d!43515 () Bool)

(assert (=> d!43515 (= (map!1415 newMap!16) (getCurrentListMap!529 (_keys!4689 newMap!16) (_values!2914 newMap!16) (mask!7266 newMap!16) (extraKeys!2686 newMap!16) (zeroValue!2781 newMap!16) (minValue!2781 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2931 newMap!16)))))

(declare-fun bs!5815 () Bool)

(assert (= bs!5815 d!43515))

(declare-fun m!166147 () Bool)

(assert (=> bs!5815 m!166147))

(assert (=> b!139110 d!43515))

(declare-fun b!139282 () Bool)

(declare-fun res!66575 () Bool)

(declare-fun e!90794 () Bool)

(assert (=> b!139282 (=> (not res!66575) (not e!90794))))

(declare-fun e!90792 () Bool)

(assert (=> b!139282 (= res!66575 e!90792)))

(declare-fun res!66579 () Bool)

(assert (=> b!139282 (=> res!66579 e!90792)))

(declare-fun e!90796 () Bool)

(assert (=> b!139282 (= res!66579 (not e!90796))))

(declare-fun res!66582 () Bool)

(assert (=> b!139282 (=> (not res!66582) (not e!90796))))

(assert (=> b!139282 (= res!66582 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2563 (_keys!4689 (v!3259 (underlying!470 thiss!992))))))))

(declare-fun b!139283 () Bool)

(declare-fun e!90786 () Unit!4379)

(declare-fun Unit!4385 () Unit!4379)

(assert (=> b!139283 (= e!90786 Unit!4385)))

(declare-fun d!43517 () Bool)

(assert (=> d!43517 e!90794))

(declare-fun res!66577 () Bool)

(assert (=> d!43517 (=> (not res!66577) (not e!90794))))

(assert (=> d!43517 (= res!66577 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2563 (_keys!4689 (v!3259 (underlying!470 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2563 (_keys!4689 (v!3259 (underlying!470 thiss!992))))))))))

(declare-fun lt!72750 () ListLongMap!1699)

(declare-fun lt!72757 () ListLongMap!1699)

(assert (=> d!43517 (= lt!72750 lt!72757)))

(declare-fun lt!72766 () Unit!4379)

(assert (=> d!43517 (= lt!72766 e!90786)))

(declare-fun c!26117 () Bool)

(declare-fun e!90785 () Bool)

(assert (=> d!43517 (= c!26117 e!90785)))

(declare-fun res!66583 () Bool)

(assert (=> d!43517 (=> (not res!66583) (not e!90785))))

(assert (=> d!43517 (= res!66583 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2563 (_keys!4689 (v!3259 (underlying!470 thiss!992))))))))

(declare-fun e!90789 () ListLongMap!1699)

(assert (=> d!43517 (= lt!72757 e!90789)))

(declare-fun c!26120 () Bool)

(assert (=> d!43517 (= c!26120 (and (not (= (bvand (extraKeys!2686 (v!3259 (underlying!470 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2686 (v!3259 (underlying!470 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!43517 (validMask!0 (mask!7266 (v!3259 (underlying!470 thiss!992))))))

(assert (=> d!43517 (= (getCurrentListMap!529 (_keys!4689 (v!3259 (underlying!470 thiss!992))) (_values!2914 (v!3259 (underlying!470 thiss!992))) (mask!7266 (v!3259 (underlying!470 thiss!992))) (extraKeys!2686 (v!3259 (underlying!470 thiss!992))) (zeroValue!2781 (v!3259 (underlying!470 thiss!992))) (minValue!2781 (v!3259 (underlying!470 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2931 (v!3259 (underlying!470 thiss!992)))) lt!72750)))

(declare-fun b!139284 () Bool)

(declare-fun res!66580 () Bool)

(assert (=> b!139284 (=> (not res!66580) (not e!90794))))

(declare-fun e!90791 () Bool)

(assert (=> b!139284 (= res!66580 e!90791)))

(declare-fun c!26119 () Bool)

(assert (=> b!139284 (= c!26119 (not (= (bvand (extraKeys!2686 (v!3259 (underlying!470 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!139285 () Bool)

(assert (=> b!139285 (= e!90785 (validKeyInArray!0 (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!139286 () Bool)

(declare-fun e!90788 () Bool)

(assert (=> b!139286 (= e!90792 e!90788)))

(declare-fun res!66581 () Bool)

(assert (=> b!139286 (=> (not res!66581) (not e!90788))))

(assert (=> b!139286 (= res!66581 (contains!906 lt!72750 (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!139286 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2563 (_keys!4689 (v!3259 (underlying!470 thiss!992))))))))

(declare-fun b!139287 () Bool)

(assert (=> b!139287 (= e!90796 (validKeyInArray!0 (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!139288 () Bool)

(declare-fun e!90793 () ListLongMap!1699)

(assert (=> b!139288 (= e!90789 e!90793)))

(declare-fun c!26116 () Bool)

(assert (=> b!139288 (= c!26116 (and (not (= (bvand (extraKeys!2686 (v!3259 (underlying!470 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2686 (v!3259 (underlying!470 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!139289 () Bool)

(declare-fun e!90787 () Bool)

(declare-fun e!90790 () Bool)

(assert (=> b!139289 (= e!90787 e!90790)))

(declare-fun res!66578 () Bool)

(declare-fun call!15339 () Bool)

(assert (=> b!139289 (= res!66578 call!15339)))

(assert (=> b!139289 (=> (not res!66578) (not e!90790))))

(declare-fun b!139290 () Bool)

(declare-fun e!90797 () Bool)

(assert (=> b!139290 (= e!90791 e!90797)))

(declare-fun res!66576 () Bool)

(declare-fun call!15340 () Bool)

(assert (=> b!139290 (= res!66576 call!15340)))

(assert (=> b!139290 (=> (not res!66576) (not e!90797))))

(declare-fun b!139291 () Bool)

(declare-fun call!15338 () ListLongMap!1699)

(assert (=> b!139291 (= e!90793 call!15338)))

(declare-fun bm!15334 () Bool)

(declare-fun call!15343 () ListLongMap!1699)

(declare-fun call!15341 () ListLongMap!1699)

(assert (=> bm!15334 (= call!15343 call!15341)))

(declare-fun b!139292 () Bool)

(assert (=> b!139292 (= e!90787 (not call!15339))))

(declare-fun b!139293 () Bool)

(declare-fun e!90795 () ListLongMap!1699)

(assert (=> b!139293 (= e!90795 call!15338)))

(declare-fun b!139294 () Bool)

(declare-fun apply!119 (ListLongMap!1699 (_ BitVec 64)) V!3537)

(assert (=> b!139294 (= e!90797 (= (apply!119 lt!72750 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2781 (v!3259 (underlying!470 thiss!992)))))))

(declare-fun b!139295 () Bool)

(declare-fun c!26115 () Bool)

(assert (=> b!139295 (= c!26115 (and (not (= (bvand (extraKeys!2686 (v!3259 (underlying!470 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2686 (v!3259 (underlying!470 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!139295 (= e!90793 e!90795)))

(declare-fun b!139296 () Bool)

(assert (=> b!139296 (= e!90788 (= (apply!119 lt!72750 (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1514 (select (arr!2291 (_values!2914 (v!3259 (underlying!470 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!431 (defaultEntry!2931 (v!3259 (underlying!470 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!139296 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2564 (_values!2914 (v!3259 (underlying!470 thiss!992))))))))

(assert (=> b!139296 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2563 (_keys!4689 (v!3259 (underlying!470 thiss!992))))))))

(declare-fun b!139297 () Bool)

(assert (=> b!139297 (= e!90790 (= (apply!119 lt!72750 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2781 (v!3259 (underlying!470 thiss!992)))))))

(declare-fun b!139298 () Bool)

(declare-fun call!15337 () ListLongMap!1699)

(declare-fun +!166 (ListLongMap!1699 tuple2!2638) ListLongMap!1699)

(assert (=> b!139298 (= e!90789 (+!166 call!15337 (tuple2!2639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2781 (v!3259 (underlying!470 thiss!992))))))))

(declare-fun bm!15335 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!131 (array!4847 array!4849 (_ BitVec 32) (_ BitVec 32) V!3537 V!3537 (_ BitVec 32) Int) ListLongMap!1699)

(assert (=> bm!15335 (= call!15341 (getCurrentListMapNoExtraKeys!131 (_keys!4689 (v!3259 (underlying!470 thiss!992))) (_values!2914 (v!3259 (underlying!470 thiss!992))) (mask!7266 (v!3259 (underlying!470 thiss!992))) (extraKeys!2686 (v!3259 (underlying!470 thiss!992))) (zeroValue!2781 (v!3259 (underlying!470 thiss!992))) (minValue!2781 (v!3259 (underlying!470 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2931 (v!3259 (underlying!470 thiss!992)))))))

(declare-fun bm!15336 () Bool)

(declare-fun call!15342 () ListLongMap!1699)

(assert (=> bm!15336 (= call!15337 (+!166 (ite c!26120 call!15341 (ite c!26116 call!15343 call!15342)) (ite (or c!26120 c!26116) (tuple2!2639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2781 (v!3259 (underlying!470 thiss!992)))) (tuple2!2639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2781 (v!3259 (underlying!470 thiss!992)))))))))

(declare-fun bm!15337 () Bool)

(assert (=> bm!15337 (= call!15340 (contains!906 lt!72750 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!15338 () Bool)

(assert (=> bm!15338 (= call!15342 call!15343)))

(declare-fun b!139299 () Bool)

(assert (=> b!139299 (= e!90794 e!90787)))

(declare-fun c!26118 () Bool)

(assert (=> b!139299 (= c!26118 (not (= (bvand (extraKeys!2686 (v!3259 (underlying!470 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!139300 () Bool)

(assert (=> b!139300 (= e!90791 (not call!15340))))

(declare-fun b!139301 () Bool)

(declare-fun lt!72762 () Unit!4379)

(assert (=> b!139301 (= e!90786 lt!72762)))

(declare-fun lt!72763 () ListLongMap!1699)

(assert (=> b!139301 (= lt!72763 (getCurrentListMapNoExtraKeys!131 (_keys!4689 (v!3259 (underlying!470 thiss!992))) (_values!2914 (v!3259 (underlying!470 thiss!992))) (mask!7266 (v!3259 (underlying!470 thiss!992))) (extraKeys!2686 (v!3259 (underlying!470 thiss!992))) (zeroValue!2781 (v!3259 (underlying!470 thiss!992))) (minValue!2781 (v!3259 (underlying!470 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2931 (v!3259 (underlying!470 thiss!992)))))))

(declare-fun lt!72752 () (_ BitVec 64))

(assert (=> b!139301 (= lt!72752 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72747 () (_ BitVec 64))

(assert (=> b!139301 (= lt!72747 (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!72764 () Unit!4379)

(declare-fun addStillContains!95 (ListLongMap!1699 (_ BitVec 64) V!3537 (_ BitVec 64)) Unit!4379)

(assert (=> b!139301 (= lt!72764 (addStillContains!95 lt!72763 lt!72752 (zeroValue!2781 (v!3259 (underlying!470 thiss!992))) lt!72747))))

(assert (=> b!139301 (contains!906 (+!166 lt!72763 (tuple2!2639 lt!72752 (zeroValue!2781 (v!3259 (underlying!470 thiss!992))))) lt!72747)))

(declare-fun lt!72749 () Unit!4379)

(assert (=> b!139301 (= lt!72749 lt!72764)))

(declare-fun lt!72759 () ListLongMap!1699)

(assert (=> b!139301 (= lt!72759 (getCurrentListMapNoExtraKeys!131 (_keys!4689 (v!3259 (underlying!470 thiss!992))) (_values!2914 (v!3259 (underlying!470 thiss!992))) (mask!7266 (v!3259 (underlying!470 thiss!992))) (extraKeys!2686 (v!3259 (underlying!470 thiss!992))) (zeroValue!2781 (v!3259 (underlying!470 thiss!992))) (minValue!2781 (v!3259 (underlying!470 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2931 (v!3259 (underlying!470 thiss!992)))))))

(declare-fun lt!72755 () (_ BitVec 64))

(assert (=> b!139301 (= lt!72755 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72745 () (_ BitVec 64))

(assert (=> b!139301 (= lt!72745 (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!72758 () Unit!4379)

(declare-fun addApplyDifferent!95 (ListLongMap!1699 (_ BitVec 64) V!3537 (_ BitVec 64)) Unit!4379)

(assert (=> b!139301 (= lt!72758 (addApplyDifferent!95 lt!72759 lt!72755 (minValue!2781 (v!3259 (underlying!470 thiss!992))) lt!72745))))

(assert (=> b!139301 (= (apply!119 (+!166 lt!72759 (tuple2!2639 lt!72755 (minValue!2781 (v!3259 (underlying!470 thiss!992))))) lt!72745) (apply!119 lt!72759 lt!72745))))

(declare-fun lt!72746 () Unit!4379)

(assert (=> b!139301 (= lt!72746 lt!72758)))

(declare-fun lt!72748 () ListLongMap!1699)

(assert (=> b!139301 (= lt!72748 (getCurrentListMapNoExtraKeys!131 (_keys!4689 (v!3259 (underlying!470 thiss!992))) (_values!2914 (v!3259 (underlying!470 thiss!992))) (mask!7266 (v!3259 (underlying!470 thiss!992))) (extraKeys!2686 (v!3259 (underlying!470 thiss!992))) (zeroValue!2781 (v!3259 (underlying!470 thiss!992))) (minValue!2781 (v!3259 (underlying!470 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2931 (v!3259 (underlying!470 thiss!992)))))))

(declare-fun lt!72765 () (_ BitVec 64))

(assert (=> b!139301 (= lt!72765 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72761 () (_ BitVec 64))

(assert (=> b!139301 (= lt!72761 (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!72753 () Unit!4379)

(assert (=> b!139301 (= lt!72753 (addApplyDifferent!95 lt!72748 lt!72765 (zeroValue!2781 (v!3259 (underlying!470 thiss!992))) lt!72761))))

(assert (=> b!139301 (= (apply!119 (+!166 lt!72748 (tuple2!2639 lt!72765 (zeroValue!2781 (v!3259 (underlying!470 thiss!992))))) lt!72761) (apply!119 lt!72748 lt!72761))))

(declare-fun lt!72756 () Unit!4379)

(assert (=> b!139301 (= lt!72756 lt!72753)))

(declare-fun lt!72751 () ListLongMap!1699)

(assert (=> b!139301 (= lt!72751 (getCurrentListMapNoExtraKeys!131 (_keys!4689 (v!3259 (underlying!470 thiss!992))) (_values!2914 (v!3259 (underlying!470 thiss!992))) (mask!7266 (v!3259 (underlying!470 thiss!992))) (extraKeys!2686 (v!3259 (underlying!470 thiss!992))) (zeroValue!2781 (v!3259 (underlying!470 thiss!992))) (minValue!2781 (v!3259 (underlying!470 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2931 (v!3259 (underlying!470 thiss!992)))))))

(declare-fun lt!72754 () (_ BitVec 64))

(assert (=> b!139301 (= lt!72754 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72760 () (_ BitVec 64))

(assert (=> b!139301 (= lt!72760 (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!139301 (= lt!72762 (addApplyDifferent!95 lt!72751 lt!72754 (minValue!2781 (v!3259 (underlying!470 thiss!992))) lt!72760))))

(assert (=> b!139301 (= (apply!119 (+!166 lt!72751 (tuple2!2639 lt!72754 (minValue!2781 (v!3259 (underlying!470 thiss!992))))) lt!72760) (apply!119 lt!72751 lt!72760))))

(declare-fun bm!15339 () Bool)

(assert (=> bm!15339 (= call!15338 call!15337)))

(declare-fun b!139302 () Bool)

(assert (=> b!139302 (= e!90795 call!15342)))

(declare-fun bm!15340 () Bool)

(assert (=> bm!15340 (= call!15339 (contains!906 lt!72750 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!43517 c!26120) b!139298))

(assert (= (and d!43517 (not c!26120)) b!139288))

(assert (= (and b!139288 c!26116) b!139291))

(assert (= (and b!139288 (not c!26116)) b!139295))

(assert (= (and b!139295 c!26115) b!139293))

(assert (= (and b!139295 (not c!26115)) b!139302))

(assert (= (or b!139293 b!139302) bm!15338))

(assert (= (or b!139291 bm!15338) bm!15334))

(assert (= (or b!139291 b!139293) bm!15339))

(assert (= (or b!139298 bm!15334) bm!15335))

(assert (= (or b!139298 bm!15339) bm!15336))

(assert (= (and d!43517 res!66583) b!139285))

(assert (= (and d!43517 c!26117) b!139301))

(assert (= (and d!43517 (not c!26117)) b!139283))

(assert (= (and d!43517 res!66577) b!139282))

(assert (= (and b!139282 res!66582) b!139287))

(assert (= (and b!139282 (not res!66579)) b!139286))

(assert (= (and b!139286 res!66581) b!139296))

(assert (= (and b!139282 res!66575) b!139284))

(assert (= (and b!139284 c!26119) b!139290))

(assert (= (and b!139284 (not c!26119)) b!139300))

(assert (= (and b!139290 res!66576) b!139294))

(assert (= (or b!139290 b!139300) bm!15337))

(assert (= (and b!139284 res!66580) b!139299))

(assert (= (and b!139299 c!26118) b!139289))

(assert (= (and b!139299 (not c!26118)) b!139292))

(assert (= (and b!139289 res!66578) b!139297))

(assert (= (or b!139289 b!139292) bm!15340))

(declare-fun b_lambda!6225 () Bool)

(assert (=> (not b_lambda!6225) (not b!139296)))

(assert (=> b!139296 t!6276))

(declare-fun b_and!8665 () Bool)

(assert (= b_and!8645 (and (=> t!6276 result!4129) b_and!8665)))

(assert (=> b!139296 t!6278))

(declare-fun b_and!8667 () Bool)

(assert (= b_and!8647 (and (=> t!6278 result!4133) b_and!8667)))

(declare-fun m!166149 () Bool)

(assert (=> bm!15340 m!166149))

(assert (=> b!139285 m!166139))

(assert (=> b!139285 m!166139))

(declare-fun m!166151 () Bool)

(assert (=> b!139285 m!166151))

(declare-fun m!166153 () Bool)

(assert (=> b!139298 m!166153))

(declare-fun m!166155 () Bool)

(assert (=> bm!15336 m!166155))

(assert (=> d!43517 m!166145))

(assert (=> b!139287 m!166139))

(assert (=> b!139287 m!166139))

(assert (=> b!139287 m!166151))

(declare-fun m!166157 () Bool)

(assert (=> b!139301 m!166157))

(declare-fun m!166159 () Bool)

(assert (=> b!139301 m!166159))

(declare-fun m!166161 () Bool)

(assert (=> b!139301 m!166161))

(declare-fun m!166163 () Bool)

(assert (=> b!139301 m!166163))

(declare-fun m!166165 () Bool)

(assert (=> b!139301 m!166165))

(declare-fun m!166167 () Bool)

(assert (=> b!139301 m!166167))

(declare-fun m!166169 () Bool)

(assert (=> b!139301 m!166169))

(declare-fun m!166171 () Bool)

(assert (=> b!139301 m!166171))

(declare-fun m!166173 () Bool)

(assert (=> b!139301 m!166173))

(declare-fun m!166175 () Bool)

(assert (=> b!139301 m!166175))

(declare-fun m!166177 () Bool)

(assert (=> b!139301 m!166177))

(assert (=> b!139301 m!166163))

(declare-fun m!166179 () Bool)

(assert (=> b!139301 m!166179))

(assert (=> b!139301 m!166161))

(declare-fun m!166181 () Bool)

(assert (=> b!139301 m!166181))

(declare-fun m!166183 () Bool)

(assert (=> b!139301 m!166183))

(assert (=> b!139301 m!166139))

(assert (=> b!139301 m!166177))

(declare-fun m!166185 () Bool)

(assert (=> b!139301 m!166185))

(assert (=> b!139301 m!166171))

(declare-fun m!166187 () Bool)

(assert (=> b!139301 m!166187))

(declare-fun m!166189 () Bool)

(assert (=> b!139297 m!166189))

(declare-fun m!166191 () Bool)

(assert (=> b!139296 m!166191))

(assert (=> b!139296 m!166035))

(declare-fun m!166193 () Bool)

(assert (=> b!139296 m!166193))

(assert (=> b!139296 m!166191))

(assert (=> b!139296 m!166139))

(declare-fun m!166195 () Bool)

(assert (=> b!139296 m!166195))

(assert (=> b!139296 m!166139))

(assert (=> b!139296 m!166035))

(assert (=> b!139286 m!166139))

(assert (=> b!139286 m!166139))

(declare-fun m!166197 () Bool)

(assert (=> b!139286 m!166197))

(declare-fun m!166199 () Bool)

(assert (=> b!139294 m!166199))

(declare-fun m!166201 () Bool)

(assert (=> bm!15337 m!166201))

(assert (=> bm!15335 m!166175))

(assert (=> b!139110 d!43517))

(declare-fun d!43519 () Bool)

(assert (=> d!43519 (= (array_inv!1461 (_keys!4689 newMap!16)) (bvsge (size!2563 (_keys!4689 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!139101 d!43519))

(declare-fun d!43521 () Bool)

(assert (=> d!43521 (= (array_inv!1462 (_values!2914 newMap!16)) (bvsge (size!2564 (_values!2914 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!139101 d!43521))

(declare-fun d!43523 () Bool)

(assert (=> d!43523 (= (array_inv!1461 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) (bvsge (size!2563 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!139102 d!43523))

(declare-fun d!43525 () Bool)

(assert (=> d!43525 (= (array_inv!1462 (_values!2914 (v!3259 (underlying!470 thiss!992)))) (bvsge (size!2564 (_values!2914 (v!3259 (underlying!470 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!139102 d!43525))

(declare-fun d!43527 () Bool)

(declare-fun e!90802 () Bool)

(assert (=> d!43527 e!90802))

(declare-fun res!66586 () Bool)

(assert (=> d!43527 (=> res!66586 e!90802)))

(declare-fun lt!72778 () Bool)

(assert (=> d!43527 (= res!66586 (not lt!72778))))

(declare-fun lt!72776 () Bool)

(assert (=> d!43527 (= lt!72778 lt!72776)))

(declare-fun lt!72777 () Unit!4379)

(declare-fun e!90803 () Unit!4379)

(assert (=> d!43527 (= lt!72777 e!90803)))

(declare-fun c!26123 () Bool)

(assert (=> d!43527 (= c!26123 lt!72776)))

(declare-fun containsKey!177 (List!1728 (_ BitVec 64)) Bool)

(assert (=> d!43527 (= lt!72776 (containsKey!177 (toList!865 lt!72660) (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355)))))

(assert (=> d!43527 (= (contains!906 lt!72660 (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355)) lt!72778)))

(declare-fun b!139309 () Bool)

(declare-fun lt!72775 () Unit!4379)

(assert (=> b!139309 (= e!90803 lt!72775)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!126 (List!1728 (_ BitVec 64)) Unit!4379)

(assert (=> b!139309 (= lt!72775 (lemmaContainsKeyImpliesGetValueByKeyDefined!126 (toList!865 lt!72660) (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355)))))

(declare-datatypes ((Option!179 0))(
  ( (Some!178 (v!3265 V!3537)) (None!177) )
))
(declare-fun isDefined!127 (Option!179) Bool)

(declare-fun getValueByKey!173 (List!1728 (_ BitVec 64)) Option!179)

(assert (=> b!139309 (isDefined!127 (getValueByKey!173 (toList!865 lt!72660) (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355)))))

(declare-fun b!139310 () Bool)

(declare-fun Unit!4386 () Unit!4379)

(assert (=> b!139310 (= e!90803 Unit!4386)))

(declare-fun b!139311 () Bool)

(assert (=> b!139311 (= e!90802 (isDefined!127 (getValueByKey!173 (toList!865 lt!72660) (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355))))))

(assert (= (and d!43527 c!26123) b!139309))

(assert (= (and d!43527 (not c!26123)) b!139310))

(assert (= (and d!43527 (not res!66586)) b!139311))

(assert (=> d!43527 m!166011))

(declare-fun m!166203 () Bool)

(assert (=> d!43527 m!166203))

(assert (=> b!139309 m!166011))

(declare-fun m!166205 () Bool)

(assert (=> b!139309 m!166205))

(assert (=> b!139309 m!166011))

(declare-fun m!166207 () Bool)

(assert (=> b!139309 m!166207))

(assert (=> b!139309 m!166207))

(declare-fun m!166209 () Bool)

(assert (=> b!139309 m!166209))

(assert (=> b!139311 m!166011))

(assert (=> b!139311 m!166207))

(assert (=> b!139311 m!166207))

(assert (=> b!139311 m!166209))

(assert (=> b!139098 d!43527))

(declare-fun d!43529 () Bool)

(declare-fun e!90863 () Bool)

(assert (=> d!43529 e!90863))

(declare-fun res!66618 () Bool)

(assert (=> d!43529 (=> (not res!66618) (not e!90863))))

(declare-fun lt!72840 () tuple2!2640)

(assert (=> d!43529 (= res!66618 (valid!553 (_2!1331 lt!72840)))))

(declare-fun e!90860 () tuple2!2640)

(assert (=> d!43529 (= lt!72840 e!90860)))

(declare-fun c!26150 () Bool)

(assert (=> d!43529 (= c!26150 (= (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) (bvneg (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355))))))

(assert (=> d!43529 (valid!553 newMap!16)))

(assert (=> d!43529 (= (update!205 newMap!16 (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) (get!1514 (select (arr!2291 (_values!2914 (v!3259 (underlying!470 thiss!992)))) from!355) (dynLambda!431 (defaultEntry!2931 (v!3259 (underlying!470 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!72840)))

(declare-fun b!139392 () Bool)

(declare-fun e!90865 () Bool)

(declare-fun call!15396 () Bool)

(assert (=> b!139392 (= e!90865 (not call!15396))))

(declare-fun bm!15389 () Bool)

(declare-fun call!15402 () Bool)

(declare-fun call!15401 () Bool)

(assert (=> bm!15389 (= call!15402 call!15401)))

(declare-fun b!139393 () Bool)

(declare-fun e!90854 () Bool)

(declare-fun call!15392 () Bool)

(assert (=> b!139393 (= e!90854 (not call!15392))))

(declare-fun b!139394 () Bool)

(declare-fun res!66626 () Bool)

(declare-fun e!90851 () Bool)

(assert (=> b!139394 (=> (not res!66626) (not e!90851))))

(declare-datatypes ((SeekEntryResult!281 0))(
  ( (MissingZero!281 (index!3287 (_ BitVec 32))) (Found!281 (index!3288 (_ BitVec 32))) (Intermediate!281 (undefined!1093 Bool) (index!3289 (_ BitVec 32)) (x!16083 (_ BitVec 32))) (Undefined!281) (MissingVacant!281 (index!3290 (_ BitVec 32))) )
))
(declare-fun lt!72842 () SeekEntryResult!281)

(assert (=> b!139394 (= res!66626 (= (select (arr!2290 (_keys!4689 newMap!16)) (index!3287 lt!72842)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!139395 () Bool)

(declare-fun res!66616 () Bool)

(assert (=> b!139395 (= res!66616 call!15402)))

(declare-fun e!90846 () Bool)

(assert (=> b!139395 (=> (not res!66616) (not e!90846))))

(declare-fun bm!15390 () Bool)

(declare-fun call!15393 () Bool)

(assert (=> bm!15390 (= call!15393 call!15401)))

(declare-fun b!139396 () Bool)

(declare-fun e!90857 () Unit!4379)

(declare-fun lt!72838 () Unit!4379)

(assert (=> b!139396 (= e!90857 lt!72838)))

(declare-fun call!15412 () Unit!4379)

(assert (=> b!139396 (= lt!72838 call!15412)))

(declare-fun lt!72850 () SeekEntryResult!281)

(declare-fun call!15413 () SeekEntryResult!281)

(assert (=> b!139396 (= lt!72850 call!15413)))

(declare-fun c!26152 () Bool)

(assert (=> b!139396 (= c!26152 ((_ is MissingZero!281) lt!72850))))

(declare-fun e!90866 () Bool)

(assert (=> b!139396 e!90866))

(declare-fun b!139397 () Bool)

(declare-fun e!90858 () Unit!4379)

(declare-fun Unit!4387 () Unit!4379)

(assert (=> b!139397 (= e!90858 Unit!4387)))

(declare-fun lt!72853 () Unit!4379)

(assert (=> b!139397 (= lt!72853 call!15412)))

(declare-fun call!15410 () SeekEntryResult!281)

(assert (=> b!139397 (= lt!72842 call!15410)))

(declare-fun c!26161 () Bool)

(assert (=> b!139397 (= c!26161 ((_ is MissingZero!281) lt!72842))))

(declare-fun e!90849 () Bool)

(assert (=> b!139397 e!90849))

(declare-fun lt!72855 () Unit!4379)

(assert (=> b!139397 (= lt!72855 lt!72853)))

(assert (=> b!139397 false))

(declare-fun bm!15391 () Bool)

(declare-fun call!15395 () Bool)

(assert (=> bm!15391 (= call!15395 call!15393)))

(declare-fun bm!15392 () Bool)

(declare-fun call!15399 () tuple2!2640)

(declare-fun c!26153 () Bool)

(declare-fun lt!72859 () SeekEntryResult!281)

(declare-fun updateHelperNewKey!64 (LongMapFixedSize!1138 (_ BitVec 64) V!3537 (_ BitVec 32)) tuple2!2640)

(assert (=> bm!15392 (= call!15399 (updateHelperNewKey!64 newMap!16 (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) (get!1514 (select (arr!2291 (_values!2914 (v!3259 (underlying!470 thiss!992)))) from!355) (dynLambda!431 (defaultEntry!2931 (v!3259 (underlying!470 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!26153 (index!3290 lt!72859) (index!3287 lt!72859))))))

(declare-fun b!139398 () Bool)

(declare-fun e!90848 () tuple2!2640)

(declare-fun lt!72854 () tuple2!2640)

(assert (=> b!139398 (= e!90848 (tuple2!2641 (_1!1331 lt!72854) (_2!1331 lt!72854)))))

(assert (=> b!139398 (= lt!72854 call!15399)))

(declare-fun b!139399 () Bool)

(declare-fun lt!72856 () Unit!4379)

(assert (=> b!139399 (= lt!72856 e!90857)))

(declare-fun c!26160 () Bool)

(declare-fun call!15409 () Bool)

(assert (=> b!139399 (= c!26160 call!15409)))

(declare-fun e!90853 () tuple2!2640)

(assert (=> b!139399 (= e!90853 (tuple2!2641 false newMap!16))))

(declare-fun b!139400 () Bool)

(declare-fun res!66617 () Bool)

(assert (=> b!139400 (=> (not res!66617) (not e!90851))))

(declare-fun call!15406 () Bool)

(assert (=> b!139400 (= res!66617 call!15406)))

(assert (=> b!139400 (= e!90849 e!90851)))

(declare-fun e!90864 () Bool)

(declare-fun lt!72836 () SeekEntryResult!281)

(declare-fun b!139401 () Bool)

(assert (=> b!139401 (= e!90864 (= (select (arr!2290 (_keys!4689 newMap!16)) (index!3288 lt!72836)) (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355)))))

(declare-fun b!139402 () Bool)

(declare-fun e!90847 () tuple2!2640)

(assert (=> b!139402 (= e!90848 e!90847)))

(declare-fun c!26157 () Bool)

(assert (=> b!139402 (= c!26157 ((_ is MissingZero!281) lt!72859))))

(declare-fun bm!15393 () Bool)

(declare-fun call!15405 () Bool)

(assert (=> bm!15393 (= call!15396 call!15405)))

(declare-fun b!139403 () Bool)

(declare-fun e!90855 () ListLongMap!1699)

(declare-fun call!15397 () ListLongMap!1699)

(assert (=> b!139403 (= e!90855 call!15397)))

(declare-fun b!139404 () Bool)

(declare-fun e!90850 () Bool)

(declare-fun e!90856 () Bool)

(assert (=> b!139404 (= e!90850 e!90856)))

(declare-fun call!15398 () ListLongMap!1699)

(declare-fun res!66623 () Bool)

(assert (=> b!139404 (= res!66623 (contains!906 call!15398 (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355)))))

(assert (=> b!139404 (=> (not res!66623) (not e!90856))))

(declare-fun lt!72833 () SeekEntryResult!281)

(declare-fun b!139405 () Bool)

(assert (=> b!139405 (= e!90846 (= (select (arr!2290 (_keys!4689 newMap!16)) (index!3288 lt!72833)) (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355)))))

(declare-fun bm!15394 () Bool)

(declare-fun call!15404 () SeekEntryResult!281)

(assert (=> bm!15394 (= call!15410 call!15404)))

(declare-fun b!139406 () Bool)

(declare-fun e!90861 () Bool)

(assert (=> b!139406 (= e!90861 e!90854)))

(declare-fun res!66625 () Bool)

(assert (=> b!139406 (= res!66625 call!15406)))

(assert (=> b!139406 (=> (not res!66625) (not e!90854))))

(declare-fun bm!15395 () Bool)

(assert (=> bm!15395 (= call!15406 call!15402)))

(declare-fun b!139407 () Bool)

(declare-fun e!90852 () Bool)

(assert (=> b!139407 (= e!90852 (not call!15396))))

(declare-fun call!15400 () ListLongMap!1699)

(declare-fun lt!72849 () (_ BitVec 32))

(declare-fun c!26156 () Bool)

(declare-fun bm!15396 () Bool)

(assert (=> bm!15396 (= call!15400 (getCurrentListMap!529 (_keys!4689 newMap!16) (_values!2914 newMap!16) (mask!7266 newMap!16) (ite c!26150 (ite c!26156 (extraKeys!2686 newMap!16) lt!72849) (extraKeys!2686 newMap!16)) (zeroValue!2781 newMap!16) (ite c!26150 (ite c!26156 (minValue!2781 newMap!16) (get!1514 (select (arr!2291 (_values!2914 (v!3259 (underlying!470 thiss!992)))) from!355) (dynLambda!431 (defaultEntry!2931 (v!3259 (underlying!470 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2781 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2931 newMap!16)))))

(declare-fun b!139408 () Bool)

(declare-fun lt!72844 () tuple2!2640)

(assert (=> b!139408 (= lt!72844 call!15399)))

(assert (=> b!139408 (= e!90847 (tuple2!2641 (_1!1331 lt!72844) (_2!1331 lt!72844)))))

(declare-fun bm!15397 () Bool)

(declare-fun call!15411 () ListLongMap!1699)

(assert (=> bm!15397 (= call!15411 call!15400)))

(declare-fun b!139409 () Bool)

(assert (=> b!139409 (= e!90851 (not call!15392))))

(declare-fun b!139410 () Bool)

(declare-fun e!90859 () Bool)

(assert (=> b!139410 (= e!90859 ((_ is Undefined!281) lt!72850))))

(declare-fun bm!15398 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!64 (array!4847 array!4849 (_ BitVec 32) (_ BitVec 32) V!3537 V!3537 (_ BitVec 64) Int) Unit!4379)

(assert (=> bm!15398 (= call!15412 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!64 (_keys!4689 newMap!16) (_values!2914 newMap!16) (mask!7266 newMap!16) (extraKeys!2686 newMap!16) (zeroValue!2781 newMap!16) (minValue!2781 newMap!16) (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) (defaultEntry!2931 newMap!16)))))

(declare-fun b!139411 () Bool)

(declare-fun c!26159 () Bool)

(assert (=> b!139411 (= c!26159 ((_ is MissingVacant!281) lt!72842))))

(assert (=> b!139411 (= e!90849 e!90861)))

(declare-fun bm!15399 () Bool)

(declare-fun call!15415 () ListLongMap!1699)

(assert (=> bm!15399 (= call!15415 (map!1415 newMap!16))))

(declare-fun bm!15400 () Bool)

(assert (=> bm!15400 (= call!15405 (arrayContainsKey!0 (_keys!4689 newMap!16) (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!139412 () Bool)

(assert (=> b!139412 (= e!90855 call!15400)))

(declare-fun bm!15401 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4847 (_ BitVec 32)) SeekEntryResult!281)

(assert (=> bm!15401 (= call!15404 (seekEntryOrOpen!0 (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) (_keys!4689 newMap!16) (mask!7266 newMap!16)))))

(declare-fun b!139413 () Bool)

(assert (=> b!139413 (= e!90859 e!90852)))

(declare-fun res!66620 () Bool)

(assert (=> b!139413 (= res!66620 call!15395)))

(assert (=> b!139413 (=> (not res!66620) (not e!90852))))

(declare-fun call!15403 () ListLongMap!1699)

(declare-fun bm!15402 () Bool)

(declare-fun call!15394 () ListLongMap!1699)

(assert (=> bm!15402 (= call!15394 (+!166 (ite c!26150 (ite c!26156 call!15411 call!15403) call!15400) (ite c!26150 (ite c!26156 (tuple2!2639 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1514 (select (arr!2291 (_values!2914 (v!3259 (underlying!470 thiss!992)))) from!355) (dynLambda!431 (defaultEntry!2931 (v!3259 (underlying!470 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2639 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1514 (select (arr!2291 (_values!2914 (v!3259 (underlying!470 thiss!992)))) from!355) (dynLambda!431 (defaultEntry!2931 (v!3259 (underlying!470 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2639 (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) (get!1514 (select (arr!2291 (_values!2914 (v!3259 (underlying!470 thiss!992)))) from!355) (dynLambda!431 (defaultEntry!2931 (v!3259 (underlying!470 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!15403 () Bool)

(declare-fun call!15408 () ListLongMap!1699)

(assert (=> bm!15403 (= call!15408 call!15394)))

(declare-fun bm!15404 () Bool)

(declare-fun c!26162 () Bool)

(declare-fun c!26154 () Bool)

(assert (=> bm!15404 (= c!26162 c!26154)))

(assert (=> bm!15404 (= call!15409 (contains!906 e!90855 (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355)))))

(declare-fun b!139414 () Bool)

(assert (=> b!139414 (= e!90856 (= call!15398 (+!166 call!15415 (tuple2!2639 (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) (get!1514 (select (arr!2291 (_values!2914 (v!3259 (underlying!470 thiss!992)))) from!355) (dynLambda!431 (defaultEntry!2931 (v!3259 (underlying!470 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!139415 () Bool)

(declare-fun Unit!4388 () Unit!4379)

(assert (=> b!139415 (= e!90857 Unit!4388)))

(declare-fun lt!72837 () Unit!4379)

(declare-fun call!15407 () Unit!4379)

(assert (=> b!139415 (= lt!72837 call!15407)))

(assert (=> b!139415 (= lt!72836 call!15413)))

(declare-fun res!66627 () Bool)

(assert (=> b!139415 (= res!66627 ((_ is Found!281) lt!72836))))

(assert (=> b!139415 (=> (not res!66627) (not e!90864))))

(assert (=> b!139415 e!90864))

(declare-fun lt!72841 () Unit!4379)

(assert (=> b!139415 (= lt!72841 lt!72837)))

(assert (=> b!139415 false))

(declare-fun b!139416 () Bool)

(declare-fun res!66622 () Bool)

(assert (=> b!139416 (= res!66622 call!15393)))

(assert (=> b!139416 (=> (not res!66622) (not e!90864))))

(declare-fun b!139417 () Bool)

(declare-fun lt!72834 () Unit!4379)

(declare-fun lt!72846 () Unit!4379)

(assert (=> b!139417 (= lt!72834 lt!72846)))

(assert (=> b!139417 (= call!15408 call!15403)))

(declare-fun lt!72857 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!64 (array!4847 array!4849 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3537 V!3537 V!3537 Int) Unit!4379)

(assert (=> b!139417 (= lt!72846 (lemmaChangeZeroKeyThenAddPairToListMap!64 (_keys!4689 newMap!16) (_values!2914 newMap!16) (mask!7266 newMap!16) (extraKeys!2686 newMap!16) lt!72857 (zeroValue!2781 newMap!16) (get!1514 (select (arr!2291 (_values!2914 (v!3259 (underlying!470 thiss!992)))) from!355) (dynLambda!431 (defaultEntry!2931 (v!3259 (underlying!470 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2781 newMap!16) (defaultEntry!2931 newMap!16)))))

(assert (=> b!139417 (= lt!72857 (bvor (extraKeys!2686 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!90862 () tuple2!2640)

(assert (=> b!139417 (= e!90862 (tuple2!2641 true (LongMapFixedSize!1139 (defaultEntry!2931 newMap!16) (mask!7266 newMap!16) (bvor (extraKeys!2686 newMap!16) #b00000000000000000000000000000001) (get!1514 (select (arr!2291 (_values!2914 (v!3259 (underlying!470 thiss!992)))) from!355) (dynLambda!431 (defaultEntry!2931 (v!3259 (underlying!470 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2781 newMap!16) (_size!618 newMap!16) (_keys!4689 newMap!16) (_values!2914 newMap!16) (_vacant!618 newMap!16))))))

(declare-fun lt!72858 () array!4849)

(declare-fun bm!15405 () Bool)

(declare-fun call!15414 () ListLongMap!1699)

(assert (=> bm!15405 (= call!15414 (getCurrentListMap!529 (_keys!4689 newMap!16) (ite (or c!26150 c!26154) (_values!2914 newMap!16) lt!72858) (mask!7266 newMap!16) (ite (and c!26150 c!26156) lt!72857 (extraKeys!2686 newMap!16)) (ite (and c!26150 c!26156) (get!1514 (select (arr!2291 (_values!2914 (v!3259 (underlying!470 thiss!992)))) from!355) (dynLambda!431 (defaultEntry!2931 (v!3259 (underlying!470 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2781 newMap!16)) (minValue!2781 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2931 newMap!16)))))

(declare-fun b!139418 () Bool)

(declare-fun res!66628 () Bool)

(assert (=> b!139418 (= res!66628 (= (select (arr!2290 (_keys!4689 newMap!16)) (index!3290 lt!72842)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!139418 (=> (not res!66628) (not e!90854))))

(declare-fun bm!15406 () Bool)

(assert (=> bm!15406 (= call!15413 call!15404)))

(declare-fun b!139419 () Bool)

(declare-fun lt!72848 () Unit!4379)

(assert (=> b!139419 (= e!90858 lt!72848)))

(assert (=> b!139419 (= lt!72848 call!15407)))

(assert (=> b!139419 (= lt!72833 call!15410)))

(declare-fun res!66615 () Bool)

(assert (=> b!139419 (= res!66615 ((_ is Found!281) lt!72833))))

(assert (=> b!139419 (=> (not res!66615) (not e!90846))))

(assert (=> b!139419 e!90846))

(declare-fun b!139420 () Bool)

(assert (=> b!139420 (= c!26153 ((_ is MissingVacant!281) lt!72859))))

(assert (=> b!139420 (= e!90853 e!90848)))

(declare-fun b!139421 () Bool)

(declare-fun res!66619 () Bool)

(assert (=> b!139421 (=> (not res!66619) (not e!90865))))

(assert (=> b!139421 (= res!66619 call!15395)))

(assert (=> b!139421 (= e!90866 e!90865)))

(declare-fun c!26158 () Bool)

(declare-fun bm!15407 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!15407 (= call!15401 (inRange!0 (ite c!26154 (ite c!26160 (index!3288 lt!72836) (ite c!26152 (index!3287 lt!72850) (index!3290 lt!72850))) (ite c!26158 (index!3288 lt!72833) (ite c!26161 (index!3287 lt!72842) (index!3290 lt!72842)))) (mask!7266 newMap!16)))))

(declare-fun bm!15408 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!64 (array!4847 array!4849 (_ BitVec 32) (_ BitVec 32) V!3537 V!3537 (_ BitVec 64) Int) Unit!4379)

(assert (=> bm!15408 (= call!15407 (lemmaInListMapThenSeekEntryOrOpenFindsIt!64 (_keys!4689 newMap!16) (_values!2914 newMap!16) (mask!7266 newMap!16) (extraKeys!2686 newMap!16) (zeroValue!2781 newMap!16) (minValue!2781 newMap!16) (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) (defaultEntry!2931 newMap!16)))))

(declare-fun b!139422 () Bool)

(declare-fun res!66624 () Bool)

(assert (=> b!139422 (= res!66624 (= (select (arr!2290 (_keys!4689 newMap!16)) (index!3290 lt!72850)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!139422 (=> (not res!66624) (not e!90852))))

(declare-fun b!139423 () Bool)

(declare-fun lt!72845 () Unit!4379)

(declare-fun lt!72851 () Unit!4379)

(assert (=> b!139423 (= lt!72845 lt!72851)))

(assert (=> b!139423 (= call!15408 call!15411)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!64 (array!4847 array!4849 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3537 V!3537 V!3537 Int) Unit!4379)

(assert (=> b!139423 (= lt!72851 (lemmaChangeLongMinValueKeyThenAddPairToListMap!64 (_keys!4689 newMap!16) (_values!2914 newMap!16) (mask!7266 newMap!16) (extraKeys!2686 newMap!16) lt!72849 (zeroValue!2781 newMap!16) (minValue!2781 newMap!16) (get!1514 (select (arr!2291 (_values!2914 (v!3259 (underlying!470 thiss!992)))) from!355) (dynLambda!431 (defaultEntry!2931 (v!3259 (underlying!470 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2931 newMap!16)))))

(assert (=> b!139423 (= lt!72849 (bvor (extraKeys!2686 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!139423 (= e!90862 (tuple2!2641 true (LongMapFixedSize!1139 (defaultEntry!2931 newMap!16) (mask!7266 newMap!16) (bvor (extraKeys!2686 newMap!16) #b00000000000000000000000000000010) (zeroValue!2781 newMap!16) (get!1514 (select (arr!2291 (_values!2914 (v!3259 (underlying!470 thiss!992)))) from!355) (dynLambda!431 (defaultEntry!2931 (v!3259 (underlying!470 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!618 newMap!16) (_keys!4689 newMap!16) (_values!2914 newMap!16) (_vacant!618 newMap!16))))))

(declare-fun b!139424 () Bool)

(declare-fun c!26151 () Bool)

(assert (=> b!139424 (= c!26151 ((_ is MissingVacant!281) lt!72850))))

(assert (=> b!139424 (= e!90866 e!90859)))

(declare-fun b!139425 () Bool)

(declare-fun res!66621 () Bool)

(assert (=> b!139425 (=> (not res!66621) (not e!90865))))

(assert (=> b!139425 (= res!66621 (= (select (arr!2290 (_keys!4689 newMap!16)) (index!3287 lt!72850)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!15409 () Bool)

(assert (=> bm!15409 (= call!15398 (map!1415 (_2!1331 lt!72840)))))

(declare-fun bm!15410 () Bool)

(assert (=> bm!15410 (= call!15397 call!15414)))

(declare-fun bm!15411 () Bool)

(assert (=> bm!15411 (= call!15403 call!15414)))

(declare-fun b!139426 () Bool)

(assert (=> b!139426 (= e!90860 e!90862)))

(assert (=> b!139426 (= c!26156 (= (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!139427 () Bool)

(assert (=> b!139427 (= e!90861 ((_ is Undefined!281) lt!72842))))

(declare-fun b!139428 () Bool)

(declare-fun lt!72835 () Unit!4379)

(declare-fun lt!72843 () Unit!4379)

(assert (=> b!139428 (= lt!72835 lt!72843)))

(assert (=> b!139428 (contains!906 call!15397 (select (arr!2290 (_keys!4689 newMap!16)) (index!3288 lt!72859)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!123 (array!4847 array!4849 (_ BitVec 32) (_ BitVec 32) V!3537 V!3537 (_ BitVec 32) Int) Unit!4379)

(assert (=> b!139428 (= lt!72843 (lemmaValidKeyInArrayIsInListMap!123 (_keys!4689 newMap!16) lt!72858 (mask!7266 newMap!16) (extraKeys!2686 newMap!16) (zeroValue!2781 newMap!16) (minValue!2781 newMap!16) (index!3288 lt!72859) (defaultEntry!2931 newMap!16)))))

(assert (=> b!139428 (= lt!72858 (array!4850 (store (arr!2291 (_values!2914 newMap!16)) (index!3288 lt!72859) (ValueCellFull!1115 (get!1514 (select (arr!2291 (_values!2914 (v!3259 (underlying!470 thiss!992)))) from!355) (dynLambda!431 (defaultEntry!2931 (v!3259 (underlying!470 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2564 (_values!2914 newMap!16))))))

(declare-fun lt!72852 () Unit!4379)

(declare-fun lt!72839 () Unit!4379)

(assert (=> b!139428 (= lt!72852 lt!72839)))

(assert (=> b!139428 (= call!15394 (getCurrentListMap!529 (_keys!4689 newMap!16) (array!4850 (store (arr!2291 (_values!2914 newMap!16)) (index!3288 lt!72859) (ValueCellFull!1115 (get!1514 (select (arr!2291 (_values!2914 (v!3259 (underlying!470 thiss!992)))) from!355) (dynLambda!431 (defaultEntry!2931 (v!3259 (underlying!470 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2564 (_values!2914 newMap!16))) (mask!7266 newMap!16) (extraKeys!2686 newMap!16) (zeroValue!2781 newMap!16) (minValue!2781 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2931 newMap!16)))))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!64 (array!4847 array!4849 (_ BitVec 32) (_ BitVec 32) V!3537 V!3537 (_ BitVec 32) (_ BitVec 64) V!3537 Int) Unit!4379)

(assert (=> b!139428 (= lt!72839 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!64 (_keys!4689 newMap!16) (_values!2914 newMap!16) (mask!7266 newMap!16) (extraKeys!2686 newMap!16) (zeroValue!2781 newMap!16) (minValue!2781 newMap!16) (index!3288 lt!72859) (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) (get!1514 (select (arr!2291 (_values!2914 (v!3259 (underlying!470 thiss!992)))) from!355) (dynLambda!431 (defaultEntry!2931 (v!3259 (underlying!470 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2931 newMap!16)))))

(declare-fun lt!72847 () Unit!4379)

(assert (=> b!139428 (= lt!72847 e!90858)))

(assert (=> b!139428 (= c!26158 call!15409)))

(assert (=> b!139428 (= e!90847 (tuple2!2641 true (LongMapFixedSize!1139 (defaultEntry!2931 newMap!16) (mask!7266 newMap!16) (extraKeys!2686 newMap!16) (zeroValue!2781 newMap!16) (minValue!2781 newMap!16) (_size!618 newMap!16) (_keys!4689 newMap!16) (array!4850 (store (arr!2291 (_values!2914 newMap!16)) (index!3288 lt!72859) (ValueCellFull!1115 (get!1514 (select (arr!2291 (_values!2914 (v!3259 (underlying!470 thiss!992)))) from!355) (dynLambda!431 (defaultEntry!2931 (v!3259 (underlying!470 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2564 (_values!2914 newMap!16))) (_vacant!618 newMap!16))))))

(declare-fun b!139429 () Bool)

(assert (=> b!139429 (= e!90850 (= call!15398 call!15415))))

(declare-fun b!139430 () Bool)

(assert (=> b!139430 (= e!90863 e!90850)))

(declare-fun c!26155 () Bool)

(assert (=> b!139430 (= c!26155 (_1!1331 lt!72840))))

(declare-fun b!139431 () Bool)

(assert (=> b!139431 (= e!90860 e!90853)))

(assert (=> b!139431 (= lt!72859 (seekEntryOrOpen!0 (select (arr!2290 (_keys!4689 (v!3259 (underlying!470 thiss!992)))) from!355) (_keys!4689 newMap!16) (mask!7266 newMap!16)))))

(assert (=> b!139431 (= c!26154 ((_ is Undefined!281) lt!72859))))

(declare-fun bm!15412 () Bool)

(assert (=> bm!15412 (= call!15392 call!15405)))

(assert (= (and d!43529 c!26150) b!139426))

(assert (= (and d!43529 (not c!26150)) b!139431))

(assert (= (and b!139426 c!26156) b!139417))

(assert (= (and b!139426 (not c!26156)) b!139423))

(assert (= (or b!139417 b!139423) bm!15397))

(assert (= (or b!139417 b!139423) bm!15411))

(assert (= (or b!139417 b!139423) bm!15403))

(assert (= (and b!139431 c!26154) b!139399))

(assert (= (and b!139431 (not c!26154)) b!139420))

(assert (= (and b!139399 c!26160) b!139415))

(assert (= (and b!139399 (not c!26160)) b!139396))

(assert (= (and b!139415 res!66627) b!139416))

(assert (= (and b!139416 res!66622) b!139401))

(assert (= (and b!139396 c!26152) b!139421))

(assert (= (and b!139396 (not c!26152)) b!139424))

(assert (= (and b!139421 res!66619) b!139425))

(assert (= (and b!139425 res!66621) b!139392))

(assert (= (and b!139424 c!26151) b!139413))

(assert (= (and b!139424 (not c!26151)) b!139410))

(assert (= (and b!139413 res!66620) b!139422))

(assert (= (and b!139422 res!66624) b!139407))

(assert (= (or b!139421 b!139413) bm!15391))

(assert (= (or b!139392 b!139407) bm!15393))

(assert (= (or b!139416 bm!15391) bm!15390))

(assert (= (or b!139415 b!139396) bm!15406))

(assert (= (and b!139420 c!26153) b!139398))

(assert (= (and b!139420 (not c!26153)) b!139402))

(assert (= (and b!139402 c!26157) b!139408))

(assert (= (and b!139402 (not c!26157)) b!139428))

(assert (= (and b!139428 c!26158) b!139419))

(assert (= (and b!139428 (not c!26158)) b!139397))

(assert (= (and b!139419 res!66615) b!139395))

(assert (= (and b!139395 res!66616) b!139405))

(assert (= (and b!139397 c!26161) b!139400))

(assert (= (and b!139397 (not c!26161)) b!139411))

(assert (= (and b!139400 res!66617) b!139394))

(assert (= (and b!139394 res!66626) b!139409))

(assert (= (and b!139411 c!26159) b!139406))

(assert (= (and b!139411 (not c!26159)) b!139427))

(assert (= (and b!139406 res!66625) b!139418))

(assert (= (and b!139418 res!66628) b!139393))

(assert (= (or b!139400 b!139406) bm!15395))

(assert (= (or b!139409 b!139393) bm!15412))

(assert (= (or b!139395 bm!15395) bm!15389))

(assert (= (or b!139419 b!139397) bm!15394))

(assert (= (or b!139398 b!139408) bm!15392))

(assert (= (or bm!15390 bm!15389) bm!15407))

(assert (= (or bm!15406 bm!15394) bm!15401))

(assert (= (or b!139396 b!139397) bm!15398))

(assert (= (or b!139399 b!139428) bm!15410))

(assert (= (or bm!15393 bm!15412) bm!15400))

(assert (= (or b!139415 b!139419) bm!15408))

(assert (= (or b!139399 b!139428) bm!15404))

(assert (= (and bm!15404 c!26162) b!139403))

(assert (= (and bm!15404 (not c!26162)) b!139412))

(assert (= (or bm!15411 bm!15410) bm!15405))

(assert (= (or bm!15397 b!139412 b!139428) bm!15396))

(assert (= (or bm!15403 b!139428) bm!15402))

(assert (= (and d!43529 res!66618) b!139430))

(assert (= (and b!139430 c!26155) b!139404))

(assert (= (and b!139430 (not c!26155)) b!139429))

(assert (= (and b!139404 res!66623) b!139414))

(assert (= (or b!139404 b!139414 b!139429) bm!15409))

(assert (= (or b!139414 b!139429) bm!15399))

(assert (=> b!139423 m!166037))

(declare-fun m!166211 () Bool)

(assert (=> b!139423 m!166211))

(assert (=> bm!15392 m!166011))

(assert (=> bm!15392 m!166037))

(declare-fun m!166213 () Bool)

(assert (=> bm!15392 m!166213))

(declare-fun m!166215 () Bool)

(assert (=> b!139405 m!166215))

(assert (=> bm!15401 m!166011))

(declare-fun m!166217 () Bool)

(assert (=> bm!15401 m!166217))

(declare-fun m!166219 () Bool)

(assert (=> bm!15405 m!166219))

(assert (=> b!139404 m!166011))

(declare-fun m!166221 () Bool)

(assert (=> b!139404 m!166221))

(declare-fun m!166223 () Bool)

(assert (=> b!139414 m!166223))

(declare-fun m!166225 () Bool)

(assert (=> b!139394 m!166225))

(assert (=> bm!15408 m!166011))

(declare-fun m!166227 () Bool)

(assert (=> bm!15408 m!166227))

(declare-fun m!166229 () Bool)

(assert (=> bm!15407 m!166229))

(declare-fun m!166231 () Bool)

(assert (=> bm!15396 m!166231))

(declare-fun m!166233 () Bool)

(assert (=> b!139401 m!166233))

(declare-fun m!166235 () Bool)

(assert (=> bm!15409 m!166235))

(assert (=> bm!15400 m!166011))

(declare-fun m!166237 () Bool)

(assert (=> bm!15400 m!166237))

(declare-fun m!166239 () Bool)

(assert (=> b!139422 m!166239))

(declare-fun m!166241 () Bool)

(assert (=> b!139425 m!166241))

(assert (=> bm!15404 m!166011))

(declare-fun m!166243 () Bool)

(assert (=> bm!15404 m!166243))

(declare-fun m!166245 () Bool)

(assert (=> b!139428 m!166245))

(declare-fun m!166247 () Bool)

(assert (=> b!139428 m!166247))

(declare-fun m!166249 () Bool)

(assert (=> b!139428 m!166249))

(assert (=> b!139428 m!166011))

(assert (=> b!139428 m!166037))

(declare-fun m!166251 () Bool)

(assert (=> b!139428 m!166251))

(assert (=> b!139428 m!166247))

(declare-fun m!166253 () Bool)

(assert (=> b!139428 m!166253))

(declare-fun m!166255 () Bool)

(assert (=> b!139428 m!166255))

(assert (=> bm!15398 m!166011))

(declare-fun m!166257 () Bool)

(assert (=> bm!15398 m!166257))

(assert (=> bm!15399 m!166013))

(declare-fun m!166259 () Bool)

(assert (=> bm!15402 m!166259))

(declare-fun m!166261 () Bool)

(assert (=> b!139418 m!166261))

(assert (=> b!139431 m!166011))

(assert (=> b!139431 m!166217))

(assert (=> b!139417 m!166037))

(declare-fun m!166263 () Bool)

(assert (=> b!139417 m!166263))

(declare-fun m!166265 () Bool)

(assert (=> d!43529 m!166265))

(assert (=> d!43529 m!166019))

(assert (=> b!139098 d!43529))

(declare-fun d!43531 () Bool)

(declare-fun c!26165 () Bool)

(assert (=> d!43531 (= c!26165 ((_ is ValueCellFull!1115) (select (arr!2291 (_values!2914 (v!3259 (underlying!470 thiss!992)))) from!355)))))

(declare-fun e!90869 () V!3537)

(assert (=> d!43531 (= (get!1514 (select (arr!2291 (_values!2914 (v!3259 (underlying!470 thiss!992)))) from!355) (dynLambda!431 (defaultEntry!2931 (v!3259 (underlying!470 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!90869)))

(declare-fun b!139436 () Bool)

(declare-fun get!1515 (ValueCell!1115 V!3537) V!3537)

(assert (=> b!139436 (= e!90869 (get!1515 (select (arr!2291 (_values!2914 (v!3259 (underlying!470 thiss!992)))) from!355) (dynLambda!431 (defaultEntry!2931 (v!3259 (underlying!470 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!139437 () Bool)

(declare-fun get!1516 (ValueCell!1115 V!3537) V!3537)

(assert (=> b!139437 (= e!90869 (get!1516 (select (arr!2291 (_values!2914 (v!3259 (underlying!470 thiss!992)))) from!355) (dynLambda!431 (defaultEntry!2931 (v!3259 (underlying!470 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!43531 c!26165) b!139436))

(assert (= (and d!43531 (not c!26165)) b!139437))

(assert (=> b!139436 m!166033))

(assert (=> b!139436 m!166035))

(declare-fun m!166267 () Bool)

(assert (=> b!139436 m!166267))

(assert (=> b!139437 m!166033))

(assert (=> b!139437 m!166035))

(declare-fun m!166269 () Bool)

(assert (=> b!139437 m!166269))

(assert (=> b!139098 d!43531))

(declare-fun d!43533 () Bool)

(declare-fun res!66635 () Bool)

(declare-fun e!90872 () Bool)

(assert (=> d!43533 (=> (not res!66635) (not e!90872))))

(declare-fun simpleValid!95 (LongMapFixedSize!1138) Bool)

(assert (=> d!43533 (= res!66635 (simpleValid!95 newMap!16))))

(assert (=> d!43533 (= (valid!553 newMap!16) e!90872)))

(declare-fun b!139444 () Bool)

(declare-fun res!66636 () Bool)

(assert (=> b!139444 (=> (not res!66636) (not e!90872))))

(declare-fun arrayCountValidKeys!0 (array!4847 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!139444 (= res!66636 (= (arrayCountValidKeys!0 (_keys!4689 newMap!16) #b00000000000000000000000000000000 (size!2563 (_keys!4689 newMap!16))) (_size!618 newMap!16)))))

(declare-fun b!139445 () Bool)

(declare-fun res!66637 () Bool)

(assert (=> b!139445 (=> (not res!66637) (not e!90872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4847 (_ BitVec 32)) Bool)

(assert (=> b!139445 (= res!66637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4689 newMap!16) (mask!7266 newMap!16)))))

(declare-fun b!139446 () Bool)

(assert (=> b!139446 (= e!90872 (arrayNoDuplicates!0 (_keys!4689 newMap!16) #b00000000000000000000000000000000 Nil!1726))))

(assert (= (and d!43533 res!66635) b!139444))

(assert (= (and b!139444 res!66636) b!139445))

(assert (= (and b!139445 res!66637) b!139446))

(declare-fun m!166271 () Bool)

(assert (=> d!43533 m!166271))

(declare-fun m!166273 () Bool)

(assert (=> b!139444 m!166273))

(declare-fun m!166275 () Bool)

(assert (=> b!139445 m!166275))

(declare-fun m!166277 () Bool)

(assert (=> b!139446 m!166277))

(assert (=> b!139109 d!43533))

(declare-fun b!139453 () Bool)

(declare-fun e!90877 () Bool)

(assert (=> b!139453 (= e!90877 tp_is_empty!2917)))

(declare-fun mapNonEmpty!4803 () Bool)

(declare-fun mapRes!4803 () Bool)

(declare-fun tp!11499 () Bool)

(assert (=> mapNonEmpty!4803 (= mapRes!4803 (and tp!11499 e!90877))))

(declare-fun mapRest!4803 () (Array (_ BitVec 32) ValueCell!1115))

(declare-fun mapValue!4803 () ValueCell!1115)

(declare-fun mapKey!4803 () (_ BitVec 32))

(assert (=> mapNonEmpty!4803 (= mapRest!4788 (store mapRest!4803 mapKey!4803 mapValue!4803))))

(declare-fun b!139454 () Bool)

(declare-fun e!90878 () Bool)

(assert (=> b!139454 (= e!90878 tp_is_empty!2917)))

(declare-fun mapIsEmpty!4803 () Bool)

(assert (=> mapIsEmpty!4803 mapRes!4803))

(declare-fun condMapEmpty!4803 () Bool)

(declare-fun mapDefault!4803 () ValueCell!1115)

(assert (=> mapNonEmpty!4788 (= condMapEmpty!4803 (= mapRest!4788 ((as const (Array (_ BitVec 32) ValueCell!1115)) mapDefault!4803)))))

(assert (=> mapNonEmpty!4788 (= tp!11471 (and e!90878 mapRes!4803))))

(assert (= (and mapNonEmpty!4788 condMapEmpty!4803) mapIsEmpty!4803))

(assert (= (and mapNonEmpty!4788 (not condMapEmpty!4803)) mapNonEmpty!4803))

(assert (= (and mapNonEmpty!4803 ((_ is ValueCellFull!1115) mapValue!4803)) b!139453))

(assert (= (and mapNonEmpty!4788 ((_ is ValueCellFull!1115) mapDefault!4803)) b!139454))

(declare-fun m!166279 () Bool)

(assert (=> mapNonEmpty!4803 m!166279))

(declare-fun b!139455 () Bool)

(declare-fun e!90879 () Bool)

(assert (=> b!139455 (= e!90879 tp_is_empty!2917)))

(declare-fun mapNonEmpty!4804 () Bool)

(declare-fun mapRes!4804 () Bool)

(declare-fun tp!11500 () Bool)

(assert (=> mapNonEmpty!4804 (= mapRes!4804 (and tp!11500 e!90879))))

(declare-fun mapKey!4804 () (_ BitVec 32))

(declare-fun mapValue!4804 () ValueCell!1115)

(declare-fun mapRest!4804 () (Array (_ BitVec 32) ValueCell!1115))

(assert (=> mapNonEmpty!4804 (= mapRest!4787 (store mapRest!4804 mapKey!4804 mapValue!4804))))

(declare-fun b!139456 () Bool)

(declare-fun e!90880 () Bool)

(assert (=> b!139456 (= e!90880 tp_is_empty!2917)))

(declare-fun mapIsEmpty!4804 () Bool)

(assert (=> mapIsEmpty!4804 mapRes!4804))

(declare-fun condMapEmpty!4804 () Bool)

(declare-fun mapDefault!4804 () ValueCell!1115)

(assert (=> mapNonEmpty!4787 (= condMapEmpty!4804 (= mapRest!4787 ((as const (Array (_ BitVec 32) ValueCell!1115)) mapDefault!4804)))))

(assert (=> mapNonEmpty!4787 (= tp!11470 (and e!90880 mapRes!4804))))

(assert (= (and mapNonEmpty!4787 condMapEmpty!4804) mapIsEmpty!4804))

(assert (= (and mapNonEmpty!4787 (not condMapEmpty!4804)) mapNonEmpty!4804))

(assert (= (and mapNonEmpty!4804 ((_ is ValueCellFull!1115) mapValue!4804)) b!139455))

(assert (= (and mapNonEmpty!4787 ((_ is ValueCellFull!1115) mapDefault!4804)) b!139456))

(declare-fun m!166281 () Bool)

(assert (=> mapNonEmpty!4804 m!166281))

(declare-fun b_lambda!6227 () Bool)

(assert (= b_lambda!6225 (or (and b!139102 b_free!3001) (and b!139101 b_free!3003 (= (defaultEntry!2931 newMap!16) (defaultEntry!2931 (v!3259 (underlying!470 thiss!992))))) b_lambda!6227)))

(check-sat (not d!43515) (not b!139423) (not b!139298) (not bm!15319) (not b_next!3003) (not b!139436) (not d!43517) (not b!139297) (not bm!15335) (not mapNonEmpty!4804) (not b!139414) (not b!139287) b_and!8665 (not bm!15409) (not bm!15405) (not bm!15340) (not b!139294) (not d!43513) (not bm!15392) (not b!139226) (not b!139309) (not b!139446) (not bm!15398) (not b!139417) (not b!139444) (not bm!15408) (not b!139301) (not b_next!3001) (not b!139445) (not mapNonEmpty!4803) (not b!139233) b_and!8667 (not b!139225) (not d!43505) (not b!139428) (not b_lambda!6223) (not bm!15396) (not b!139437) (not b!139311) (not d!43527) (not bm!15407) tp_is_empty!2917 (not b!139404) (not d!43529) (not bm!15336) (not b!139431) (not bm!15400) (not bm!15401) (not bm!15337) (not b!139296) (not b!139286) (not b_lambda!6227) (not d!43509) (not bm!15399) (not bm!15404) (not d!43533) (not b!139224) (not bm!15402) (not b!139285) (not b!139238))
(check-sat b_and!8665 b_and!8667 (not b_next!3001) (not b_next!3003))
