; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15156 () Bool)

(assert start!15156)

(declare-fun b!145464 () Bool)

(declare-fun b_free!3077 () Bool)

(declare-fun b_next!3077 () Bool)

(assert (=> b!145464 (= b_free!3077 (not b_next!3077))))

(declare-fun tp!11730 () Bool)

(declare-fun b_and!9067 () Bool)

(assert (=> b!145464 (= tp!11730 b_and!9067)))

(declare-fun b!145475 () Bool)

(declare-fun b_free!3079 () Bool)

(declare-fun b_next!3079 () Bool)

(assert (=> b!145475 (= b_free!3079 (not b_next!3079))))

(declare-fun tp!11729 () Bool)

(declare-fun b_and!9069 () Bool)

(assert (=> b!145475 (= tp!11729 b_and!9069)))

(declare-fun e!94800 () Bool)

(declare-fun e!94791 () Bool)

(declare-fun tp_is_empty!2955 () Bool)

(declare-datatypes ((V!3587 0))(
  ( (V!3588 (val!1522 Int)) )
))
(declare-datatypes ((array!4953 0))(
  ( (array!4954 (arr!2339 (Array (_ BitVec 32) (_ BitVec 64))) (size!2615 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1134 0))(
  ( (ValueCellFull!1134 (v!3331 V!3587)) (EmptyCell!1134) )
))
(declare-datatypes ((array!4955 0))(
  ( (array!4956 (arr!2340 (Array (_ BitVec 32) ValueCell!1134)) (size!2616 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1176 0))(
  ( (LongMapFixedSize!1177 (defaultEntry!3002 Int) (mask!7372 (_ BitVec 32)) (extraKeys!2747 (_ BitVec 32)) (zeroValue!2847 V!3587) (minValue!2847 V!3587) (_size!637 (_ BitVec 32)) (_keys!4771 array!4953) (_values!2985 array!4955) (_vacant!637 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!960 0))(
  ( (Cell!961 (v!3332 LongMapFixedSize!1176)) )
))
(declare-datatypes ((LongMap!960 0))(
  ( (LongMap!961 (underlying!491 Cell!960)) )
))
(declare-fun thiss!992 () LongMap!960)

(declare-fun array_inv!1473 (array!4953) Bool)

(declare-fun array_inv!1474 (array!4955) Bool)

(assert (=> b!145464 (= e!94791 (and tp!11730 tp_is_empty!2955 (array_inv!1473 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) (array_inv!1474 (_values!2985 (v!3332 (underlying!491 thiss!992)))) e!94800))))

(declare-fun mapNonEmpty!4933 () Bool)

(declare-fun mapRes!4933 () Bool)

(declare-fun tp!11732 () Bool)

(declare-fun e!94788 () Bool)

(assert (=> mapNonEmpty!4933 (= mapRes!4933 (and tp!11732 e!94788))))

(declare-fun mapRest!4934 () (Array (_ BitVec 32) ValueCell!1134))

(declare-fun mapValue!4933 () ValueCell!1134)

(declare-fun mapKey!4934 () (_ BitVec 32))

(assert (=> mapNonEmpty!4933 (= (arr!2340 (_values!2985 (v!3332 (underlying!491 thiss!992)))) (store mapRest!4934 mapKey!4934 mapValue!4933))))

(declare-fun b!145465 () Bool)

(declare-fun e!94801 () Bool)

(declare-fun e!94789 () Bool)

(declare-fun mapRes!4934 () Bool)

(assert (=> b!145465 (= e!94801 (and e!94789 mapRes!4934))))

(declare-fun condMapEmpty!4934 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1176)

(declare-fun mapDefault!4934 () ValueCell!1134)

(assert (=> b!145465 (= condMapEmpty!4934 (= (arr!2340 (_values!2985 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1134)) mapDefault!4934)))))

(declare-fun b!145466 () Bool)

(assert (=> b!145466 (= e!94789 tp_is_empty!2955)))

(declare-fun b!145467 () Bool)

(declare-fun res!69296 () Bool)

(declare-fun e!94790 () Bool)

(assert (=> b!145467 (=> res!69296 e!94790)))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((List!1764 0))(
  ( (Nil!1761) (Cons!1760 (h!2368 (_ BitVec 64)) (t!6425 List!1764)) )
))
(declare-fun lt!76508 () List!1764)

(declare-fun arrayNoDuplicates!0 (array!4953 (_ BitVec 32) List!1764) Bool)

(assert (=> b!145467 (= res!69296 (not (arrayNoDuplicates!0 (_keys!4771 (v!3332 (underlying!491 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!76508)))))

(declare-fun b!145468 () Bool)

(declare-fun res!69294 () Bool)

(assert (=> b!145468 (=> res!69294 e!94790)))

(declare-fun contains!943 (List!1764 (_ BitVec 64)) Bool)

(assert (=> b!145468 (= res!69294 (contains!943 lt!76508 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145469 () Bool)

(declare-fun res!69286 () Bool)

(declare-fun e!94795 () Bool)

(assert (=> b!145469 (=> (not res!69286) (not e!94795))))

(assert (=> b!145469 (= res!69286 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7372 newMap!16)) (_size!637 (v!3332 (underlying!491 thiss!992)))))))

(declare-fun mapNonEmpty!4934 () Bool)

(declare-fun tp!11731 () Bool)

(declare-fun e!94803 () Bool)

(assert (=> mapNonEmpty!4934 (= mapRes!4934 (and tp!11731 e!94803))))

(declare-fun mapRest!4933 () (Array (_ BitVec 32) ValueCell!1134))

(declare-fun mapKey!4933 () (_ BitVec 32))

(declare-fun mapValue!4934 () ValueCell!1134)

(assert (=> mapNonEmpty!4934 (= (arr!2340 (_values!2985 newMap!16)) (store mapRest!4933 mapKey!4933 mapValue!4934))))

(declare-fun b!145470 () Bool)

(declare-fun e!94793 () Bool)

(assert (=> b!145470 (= e!94793 tp_is_empty!2955)))

(declare-fun b!145471 () Bool)

(declare-fun e!94792 () Bool)

(declare-fun e!94798 () Bool)

(assert (=> b!145471 (= e!94792 e!94798)))

(declare-fun b!145472 () Bool)

(assert (=> b!145472 (= e!94790 (contains!943 lt!76508 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-fun mapIsEmpty!4933 () Bool)

(assert (=> mapIsEmpty!4933 mapRes!4933))

(declare-fun b!145473 () Bool)

(declare-fun e!94799 () Bool)

(assert (=> b!145473 (= e!94795 e!94799)))

(declare-fun res!69293 () Bool)

(assert (=> b!145473 (=> (not res!69293) (not e!94799))))

(declare-datatypes ((tuple2!2734 0))(
  ( (tuple2!2735 (_1!1378 (_ BitVec 64)) (_2!1378 V!3587)) )
))
(declare-datatypes ((List!1765 0))(
  ( (Nil!1762) (Cons!1761 (h!2369 tuple2!2734) (t!6426 List!1765)) )
))
(declare-datatypes ((ListLongMap!1763 0))(
  ( (ListLongMap!1764 (toList!897 List!1765)) )
))
(declare-fun lt!76504 () ListLongMap!1763)

(declare-fun lt!76509 () ListLongMap!1763)

(assert (=> b!145473 (= res!69293 (and (= lt!76504 lt!76509) (not (= (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1456 (LongMapFixedSize!1176) ListLongMap!1763)

(assert (=> b!145473 (= lt!76509 (map!1456 newMap!16))))

(declare-fun getCurrentListMap!567 (array!4953 array!4955 (_ BitVec 32) (_ BitVec 32) V!3587 V!3587 (_ BitVec 32) Int) ListLongMap!1763)

(assert (=> b!145473 (= lt!76504 (getCurrentListMap!567 (_keys!4771 (v!3332 (underlying!491 thiss!992))) (_values!2985 (v!3332 (underlying!491 thiss!992))) (mask!7372 (v!3332 (underlying!491 thiss!992))) (extraKeys!2747 (v!3332 (underlying!491 thiss!992))) (zeroValue!2847 (v!3332 (underlying!491 thiss!992))) (minValue!2847 (v!3332 (underlying!491 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3002 (v!3332 (underlying!491 thiss!992)))))))

(declare-fun b!145474 () Bool)

(declare-fun res!69295 () Bool)

(assert (=> b!145474 (=> (not res!69295) (not e!94795))))

(assert (=> b!145474 (= res!69295 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2615 (_keys!4771 (v!3332 (underlying!491 thiss!992)))))))))

(declare-fun e!94796 () Bool)

(assert (=> b!145475 (= e!94796 (and tp!11729 tp_is_empty!2955 (array_inv!1473 (_keys!4771 newMap!16)) (array_inv!1474 (_values!2985 newMap!16)) e!94801))))

(declare-fun b!145476 () Bool)

(assert (=> b!145476 (= e!94800 (and e!94793 mapRes!4933))))

(declare-fun condMapEmpty!4933 () Bool)

(declare-fun mapDefault!4933 () ValueCell!1134)

(assert (=> b!145476 (= condMapEmpty!4933 (= (arr!2340 (_values!2985 (v!3332 (underlying!491 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1134)) mapDefault!4933)))))

(declare-fun b!145477 () Bool)

(declare-fun res!69292 () Bool)

(assert (=> b!145477 (=> res!69292 e!94790)))

(declare-fun noDuplicate!56 (List!1764) Bool)

(assert (=> b!145477 (= res!69292 (not (noDuplicate!56 lt!76508)))))

(declare-fun b!145478 () Bool)

(declare-fun e!94794 () Bool)

(assert (=> b!145478 (= e!94794 (not e!94790))))

(declare-fun res!69290 () Bool)

(assert (=> b!145478 (=> res!69290 e!94790)))

(assert (=> b!145478 (= res!69290 (or (bvsge (size!2615 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2615 (_keys!4771 (v!3332 (underlying!491 thiss!992)))))))))

(assert (=> b!145478 (= lt!76508 (Cons!1760 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) Nil!1761))))

(assert (=> b!145478 (arrayNoDuplicates!0 (_keys!4771 (v!3332 (underlying!491 thiss!992))) from!355 Nil!1761)))

(declare-datatypes ((Unit!4602 0))(
  ( (Unit!4603) )
))
(declare-fun lt!76506 () Unit!4602)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4953 (_ BitVec 32) (_ BitVec 32)) Unit!4602)

(assert (=> b!145478 (= lt!76506 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4771 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!145478 (arrayContainsKey!0 (_keys!4771 (v!3332 (underlying!491 thiss!992))) (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!76505 () Unit!4602)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!148 (array!4953 array!4955 (_ BitVec 32) (_ BitVec 32) V!3587 V!3587 (_ BitVec 64) (_ BitVec 32) Int) Unit!4602)

(assert (=> b!145478 (= lt!76505 (lemmaListMapContainsThenArrayContainsFrom!148 (_keys!4771 (v!3332 (underlying!491 thiss!992))) (_values!2985 (v!3332 (underlying!491 thiss!992))) (mask!7372 (v!3332 (underlying!491 thiss!992))) (extraKeys!2747 (v!3332 (underlying!491 thiss!992))) (zeroValue!2847 (v!3332 (underlying!491 thiss!992))) (minValue!2847 (v!3332 (underlying!491 thiss!992))) (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3002 (v!3332 (underlying!491 thiss!992)))))))

(declare-fun mapIsEmpty!4934 () Bool)

(assert (=> mapIsEmpty!4934 mapRes!4934))

(declare-fun b!145479 () Bool)

(declare-fun res!69288 () Bool)

(assert (=> b!145479 (=> res!69288 e!94790)))

(assert (=> b!145479 (= res!69288 (contains!943 lt!76508 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!69289 () Bool)

(assert (=> start!15156 (=> (not res!69289) (not e!94795))))

(declare-fun valid!570 (LongMap!960) Bool)

(assert (=> start!15156 (= res!69289 (valid!570 thiss!992))))

(assert (=> start!15156 e!94795))

(assert (=> start!15156 e!94792))

(assert (=> start!15156 true))

(assert (=> start!15156 e!94796))

(declare-fun b!145480 () Bool)

(assert (=> b!145480 (= e!94798 e!94791)))

(declare-fun b!145481 () Bool)

(assert (=> b!145481 (= e!94803 tp_is_empty!2955)))

(declare-fun b!145482 () Bool)

(assert (=> b!145482 (= e!94799 e!94794)))

(declare-fun res!69291 () Bool)

(assert (=> b!145482 (=> (not res!69291) (not e!94794))))

(declare-fun contains!944 (ListLongMap!1763 (_ BitVec 64)) Bool)

(assert (=> b!145482 (= res!69291 (contains!944 lt!76509 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2736 0))(
  ( (tuple2!2737 (_1!1379 Bool) (_2!1379 LongMapFixedSize!1176)) )
))
(declare-fun lt!76507 () tuple2!2736)

(declare-fun update!220 (LongMapFixedSize!1176 (_ BitVec 64) V!3587) tuple2!2736)

(declare-fun get!1557 (ValueCell!1134 V!3587) V!3587)

(declare-fun dynLambda!451 (Int (_ BitVec 64)) V!3587)

(assert (=> b!145482 (= lt!76507 (update!220 newMap!16 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) (get!1557 (select (arr!2340 (_values!2985 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!451 (defaultEntry!3002 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!145483 () Bool)

(assert (=> b!145483 (= e!94788 tp_is_empty!2955)))

(declare-fun b!145484 () Bool)

(declare-fun res!69287 () Bool)

(assert (=> b!145484 (=> (not res!69287) (not e!94795))))

(declare-fun valid!571 (LongMapFixedSize!1176) Bool)

(assert (=> b!145484 (= res!69287 (valid!571 newMap!16))))

(assert (= (and start!15156 res!69289) b!145474))

(assert (= (and b!145474 res!69295) b!145484))

(assert (= (and b!145484 res!69287) b!145469))

(assert (= (and b!145469 res!69286) b!145473))

(assert (= (and b!145473 res!69293) b!145482))

(assert (= (and b!145482 res!69291) b!145478))

(assert (= (and b!145478 (not res!69290)) b!145477))

(assert (= (and b!145477 (not res!69292)) b!145468))

(assert (= (and b!145468 (not res!69294)) b!145479))

(assert (= (and b!145479 (not res!69288)) b!145467))

(assert (= (and b!145467 (not res!69296)) b!145472))

(assert (= (and b!145476 condMapEmpty!4933) mapIsEmpty!4933))

(assert (= (and b!145476 (not condMapEmpty!4933)) mapNonEmpty!4933))

(get-info :version)

(assert (= (and mapNonEmpty!4933 ((_ is ValueCellFull!1134) mapValue!4933)) b!145483))

(assert (= (and b!145476 ((_ is ValueCellFull!1134) mapDefault!4933)) b!145470))

(assert (= b!145464 b!145476))

(assert (= b!145480 b!145464))

(assert (= b!145471 b!145480))

(assert (= start!15156 b!145471))

(assert (= (and b!145465 condMapEmpty!4934) mapIsEmpty!4934))

(assert (= (and b!145465 (not condMapEmpty!4934)) mapNonEmpty!4934))

(assert (= (and mapNonEmpty!4934 ((_ is ValueCellFull!1134) mapValue!4934)) b!145481))

(assert (= (and b!145465 ((_ is ValueCellFull!1134) mapDefault!4934)) b!145466))

(assert (= b!145475 b!145465))

(assert (= start!15156 b!145475))

(declare-fun b_lambda!6525 () Bool)

(assert (=> (not b_lambda!6525) (not b!145482)))

(declare-fun t!6422 () Bool)

(declare-fun tb!2621 () Bool)

(assert (=> (and b!145464 (= (defaultEntry!3002 (v!3332 (underlying!491 thiss!992))) (defaultEntry!3002 (v!3332 (underlying!491 thiss!992)))) t!6422) tb!2621))

(declare-fun result!4285 () Bool)

(assert (=> tb!2621 (= result!4285 tp_is_empty!2955)))

(assert (=> b!145482 t!6422))

(declare-fun b_and!9071 () Bool)

(assert (= b_and!9067 (and (=> t!6422 result!4285) b_and!9071)))

(declare-fun tb!2623 () Bool)

(declare-fun t!6424 () Bool)

(assert (=> (and b!145475 (= (defaultEntry!3002 newMap!16) (defaultEntry!3002 (v!3332 (underlying!491 thiss!992)))) t!6424) tb!2623))

(declare-fun result!4289 () Bool)

(assert (= result!4289 result!4285))

(assert (=> b!145482 t!6424))

(declare-fun b_and!9073 () Bool)

(assert (= b_and!9069 (and (=> t!6424 result!4289) b_and!9073)))

(declare-fun m!175423 () Bool)

(assert (=> b!145475 m!175423))

(declare-fun m!175425 () Bool)

(assert (=> b!145475 m!175425))

(declare-fun m!175427 () Bool)

(assert (=> b!145479 m!175427))

(declare-fun m!175429 () Bool)

(assert (=> start!15156 m!175429))

(declare-fun m!175431 () Bool)

(assert (=> b!145467 m!175431))

(declare-fun m!175433 () Bool)

(assert (=> b!145477 m!175433))

(declare-fun m!175435 () Bool)

(assert (=> b!145472 m!175435))

(assert (=> b!145472 m!175435))

(declare-fun m!175437 () Bool)

(assert (=> b!145472 m!175437))

(declare-fun m!175439 () Bool)

(assert (=> b!145482 m!175439))

(declare-fun m!175441 () Bool)

(assert (=> b!145482 m!175441))

(declare-fun m!175443 () Bool)

(assert (=> b!145482 m!175443))

(assert (=> b!145482 m!175435))

(assert (=> b!145482 m!175435))

(declare-fun m!175445 () Bool)

(assert (=> b!145482 m!175445))

(assert (=> b!145482 m!175441))

(assert (=> b!145482 m!175435))

(assert (=> b!145482 m!175443))

(declare-fun m!175447 () Bool)

(assert (=> b!145482 m!175447))

(assert (=> b!145482 m!175439))

(declare-fun m!175449 () Bool)

(assert (=> b!145468 m!175449))

(assert (=> b!145473 m!175435))

(declare-fun m!175451 () Bool)

(assert (=> b!145473 m!175451))

(declare-fun m!175453 () Bool)

(assert (=> b!145473 m!175453))

(declare-fun m!175455 () Bool)

(assert (=> b!145464 m!175455))

(declare-fun m!175457 () Bool)

(assert (=> b!145464 m!175457))

(declare-fun m!175459 () Bool)

(assert (=> mapNonEmpty!4933 m!175459))

(declare-fun m!175461 () Bool)

(assert (=> mapNonEmpty!4934 m!175461))

(declare-fun m!175463 () Bool)

(assert (=> b!145478 m!175463))

(declare-fun m!175465 () Bool)

(assert (=> b!145478 m!175465))

(assert (=> b!145478 m!175435))

(declare-fun m!175467 () Bool)

(assert (=> b!145478 m!175467))

(assert (=> b!145478 m!175435))

(assert (=> b!145478 m!175435))

(declare-fun m!175469 () Bool)

(assert (=> b!145478 m!175469))

(declare-fun m!175471 () Bool)

(assert (=> b!145484 m!175471))

(check-sat b_and!9071 tp_is_empty!2955 b_and!9073 (not b_next!3077) (not b!145478) (not b!145477) (not mapNonEmpty!4934) (not start!15156) (not b_lambda!6525) (not b!145467) (not b!145479) (not mapNonEmpty!4933) (not b!145472) (not b!145464) (not b_next!3079) (not b!145482) (not b!145468) (not b!145484) (not b!145475) (not b!145473))
(check-sat b_and!9071 b_and!9073 (not b_next!3077) (not b_next!3079))
(get-model)

(declare-fun b_lambda!6529 () Bool)

(assert (= b_lambda!6525 (or (and b!145464 b_free!3077) (and b!145475 b_free!3079 (= (defaultEntry!3002 newMap!16) (defaultEntry!3002 (v!3332 (underlying!491 thiss!992))))) b_lambda!6529)))

(check-sat b_and!9071 tp_is_empty!2955 b_and!9073 (not b_next!3077) (not b!145478) (not b!145477) (not mapNonEmpty!4934) (not start!15156) (not b_lambda!6529) (not b!145467) (not b!145479) (not mapNonEmpty!4933) (not b!145472) (not b!145464) (not b_next!3079) (not b!145482) (not b!145468) (not b!145484) (not b!145475) (not b!145473))
(check-sat b_and!9071 b_and!9073 (not b_next!3077) (not b_next!3079))
(get-model)

(declare-fun d!46277 () Bool)

(assert (=> d!46277 (= (map!1456 newMap!16) (getCurrentListMap!567 (_keys!4771 newMap!16) (_values!2985 newMap!16) (mask!7372 newMap!16) (extraKeys!2747 newMap!16) (zeroValue!2847 newMap!16) (minValue!2847 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3002 newMap!16)))))

(declare-fun bs!6125 () Bool)

(assert (= bs!6125 d!46277))

(declare-fun m!175523 () Bool)

(assert (=> bs!6125 m!175523))

(assert (=> b!145473 d!46277))

(declare-fun b!145594 () Bool)

(declare-fun e!94881 () Bool)

(declare-fun e!94890 () Bool)

(assert (=> b!145594 (= e!94881 e!94890)))

(declare-fun res!69355 () Bool)

(declare-fun call!16267 () Bool)

(assert (=> b!145594 (= res!69355 call!16267)))

(assert (=> b!145594 (=> (not res!69355) (not e!94890))))

(declare-fun b!145595 () Bool)

(declare-fun e!94888 () Bool)

(assert (=> b!145595 (= e!94888 e!94881)))

(declare-fun c!27557 () Bool)

(assert (=> b!145595 (= c!27557 (not (= (bvand (extraKeys!2747 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!16259 () Bool)

(declare-fun call!16263 () ListLongMap!1763)

(declare-fun call!16266 () ListLongMap!1763)

(assert (=> bm!16259 (= call!16263 call!16266)))

(declare-fun b!145596 () Bool)

(declare-fun e!94886 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!145596 (= e!94886 (validKeyInArray!0 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!145597 () Bool)

(declare-fun lt!76582 () ListLongMap!1763)

(declare-fun apply!124 (ListLongMap!1763 (_ BitVec 64)) V!3587)

(assert (=> b!145597 (= e!94890 (= (apply!124 lt!76582 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2847 (v!3332 (underlying!491 thiss!992)))))))

(declare-fun bm!16260 () Bool)

(declare-fun call!16264 () ListLongMap!1763)

(assert (=> bm!16260 (= call!16264 call!16263)))

(declare-fun b!145598 () Bool)

(declare-fun e!94884 () ListLongMap!1763)

(declare-fun e!94878 () ListLongMap!1763)

(assert (=> b!145598 (= e!94884 e!94878)))

(declare-fun c!27556 () Bool)

(assert (=> b!145598 (= c!27556 (and (not (= (bvand (extraKeys!2747 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2747 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!145599 () Bool)

(declare-fun e!94885 () Unit!4602)

(declare-fun Unit!4604 () Unit!4602)

(assert (=> b!145599 (= e!94885 Unit!4604)))

(declare-fun b!145600 () Bool)

(declare-fun e!94889 () Bool)

(declare-fun e!94887 () Bool)

(assert (=> b!145600 (= e!94889 e!94887)))

(declare-fun res!69350 () Bool)

(declare-fun call!16268 () Bool)

(assert (=> b!145600 (= res!69350 call!16268)))

(assert (=> b!145600 (=> (not res!69350) (not e!94887))))

(declare-fun b!145601 () Bool)

(declare-fun e!94882 () ListLongMap!1763)

(assert (=> b!145601 (= e!94882 call!16264)))

(declare-fun bm!16261 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!149 (array!4953 array!4955 (_ BitVec 32) (_ BitVec 32) V!3587 V!3587 (_ BitVec 32) Int) ListLongMap!1763)

(assert (=> bm!16261 (= call!16266 (getCurrentListMapNoExtraKeys!149 (_keys!4771 (v!3332 (underlying!491 thiss!992))) (_values!2985 (v!3332 (underlying!491 thiss!992))) (mask!7372 (v!3332 (underlying!491 thiss!992))) (extraKeys!2747 (v!3332 (underlying!491 thiss!992))) (zeroValue!2847 (v!3332 (underlying!491 thiss!992))) (minValue!2847 (v!3332 (underlying!491 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3002 (v!3332 (underlying!491 thiss!992)))))))

(declare-fun b!145602 () Bool)

(assert (=> b!145602 (= e!94887 (= (apply!124 lt!76582 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2847 (v!3332 (underlying!491 thiss!992)))))))

(declare-fun b!145603 () Bool)

(declare-fun c!27555 () Bool)

(assert (=> b!145603 (= c!27555 (and (not (= (bvand (extraKeys!2747 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2747 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!145603 (= e!94878 e!94882)))

(declare-fun b!145604 () Bool)

(declare-fun res!69353 () Bool)

(assert (=> b!145604 (=> (not res!69353) (not e!94888))))

(declare-fun e!94879 () Bool)

(assert (=> b!145604 (= res!69353 e!94879)))

(declare-fun res!69351 () Bool)

(assert (=> b!145604 (=> res!69351 e!94879)))

(assert (=> b!145604 (= res!69351 (not e!94886))))

(declare-fun res!69354 () Bool)

(assert (=> b!145604 (=> (not res!69354) (not e!94886))))

(assert (=> b!145604 (= res!69354 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2615 (_keys!4771 (v!3332 (underlying!491 thiss!992))))))))

(declare-fun d!46279 () Bool)

(assert (=> d!46279 e!94888))

(declare-fun res!69356 () Bool)

(assert (=> d!46279 (=> (not res!69356) (not e!94888))))

(assert (=> d!46279 (= res!69356 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2615 (_keys!4771 (v!3332 (underlying!491 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2615 (_keys!4771 (v!3332 (underlying!491 thiss!992))))))))))

(declare-fun lt!76577 () ListLongMap!1763)

(assert (=> d!46279 (= lt!76582 lt!76577)))

(declare-fun lt!76584 () Unit!4602)

(assert (=> d!46279 (= lt!76584 e!94885)))

(declare-fun c!27558 () Bool)

(declare-fun e!94880 () Bool)

(assert (=> d!46279 (= c!27558 e!94880)))

(declare-fun res!69352 () Bool)

(assert (=> d!46279 (=> (not res!69352) (not e!94880))))

(assert (=> d!46279 (= res!69352 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2615 (_keys!4771 (v!3332 (underlying!491 thiss!992))))))))

(assert (=> d!46279 (= lt!76577 e!94884)))

(declare-fun c!27559 () Bool)

(assert (=> d!46279 (= c!27559 (and (not (= (bvand (extraKeys!2747 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2747 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!46279 (validMask!0 (mask!7372 (v!3332 (underlying!491 thiss!992))))))

(assert (=> d!46279 (= (getCurrentListMap!567 (_keys!4771 (v!3332 (underlying!491 thiss!992))) (_values!2985 (v!3332 (underlying!491 thiss!992))) (mask!7372 (v!3332 (underlying!491 thiss!992))) (extraKeys!2747 (v!3332 (underlying!491 thiss!992))) (zeroValue!2847 (v!3332 (underlying!491 thiss!992))) (minValue!2847 (v!3332 (underlying!491 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3002 (v!3332 (underlying!491 thiss!992)))) lt!76582)))

(declare-fun b!145605 () Bool)

(declare-fun call!16262 () ListLongMap!1763)

(assert (=> b!145605 (= e!94878 call!16262)))

(declare-fun b!145606 () Bool)

(declare-fun e!94883 () Bool)

(assert (=> b!145606 (= e!94879 e!94883)))

(declare-fun res!69348 () Bool)

(assert (=> b!145606 (=> (not res!69348) (not e!94883))))

(assert (=> b!145606 (= res!69348 (contains!944 lt!76582 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!145606 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2615 (_keys!4771 (v!3332 (underlying!491 thiss!992))))))))

(declare-fun b!145607 () Bool)

(assert (=> b!145607 (= e!94883 (= (apply!124 lt!76582 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1557 (select (arr!2340 (_values!2985 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!451 (defaultEntry!3002 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!145607 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2616 (_values!2985 (v!3332 (underlying!491 thiss!992))))))))

(assert (=> b!145607 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2615 (_keys!4771 (v!3332 (underlying!491 thiss!992))))))))

(declare-fun b!145608 () Bool)

(declare-fun res!69349 () Bool)

(assert (=> b!145608 (=> (not res!69349) (not e!94888))))

(assert (=> b!145608 (= res!69349 e!94889)))

(declare-fun c!27554 () Bool)

(assert (=> b!145608 (= c!27554 (not (= (bvand (extraKeys!2747 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!145609 () Bool)

(assert (=> b!145609 (= e!94889 (not call!16268))))

(declare-fun b!145610 () Bool)

(assert (=> b!145610 (= e!94880 (validKeyInArray!0 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!145611 () Bool)

(declare-fun lt!76572 () Unit!4602)

(assert (=> b!145611 (= e!94885 lt!76572)))

(declare-fun lt!76586 () ListLongMap!1763)

(assert (=> b!145611 (= lt!76586 (getCurrentListMapNoExtraKeys!149 (_keys!4771 (v!3332 (underlying!491 thiss!992))) (_values!2985 (v!3332 (underlying!491 thiss!992))) (mask!7372 (v!3332 (underlying!491 thiss!992))) (extraKeys!2747 (v!3332 (underlying!491 thiss!992))) (zeroValue!2847 (v!3332 (underlying!491 thiss!992))) (minValue!2847 (v!3332 (underlying!491 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3002 (v!3332 (underlying!491 thiss!992)))))))

(declare-fun lt!76576 () (_ BitVec 64))

(assert (=> b!145611 (= lt!76576 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76581 () (_ BitVec 64))

(assert (=> b!145611 (= lt!76581 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!76591 () Unit!4602)

(declare-fun addStillContains!100 (ListLongMap!1763 (_ BitVec 64) V!3587 (_ BitVec 64)) Unit!4602)

(assert (=> b!145611 (= lt!76591 (addStillContains!100 lt!76586 lt!76576 (zeroValue!2847 (v!3332 (underlying!491 thiss!992))) lt!76581))))

(declare-fun +!183 (ListLongMap!1763 tuple2!2734) ListLongMap!1763)

(assert (=> b!145611 (contains!944 (+!183 lt!76586 (tuple2!2735 lt!76576 (zeroValue!2847 (v!3332 (underlying!491 thiss!992))))) lt!76581)))

(declare-fun lt!76583 () Unit!4602)

(assert (=> b!145611 (= lt!76583 lt!76591)))

(declare-fun lt!76575 () ListLongMap!1763)

(assert (=> b!145611 (= lt!76575 (getCurrentListMapNoExtraKeys!149 (_keys!4771 (v!3332 (underlying!491 thiss!992))) (_values!2985 (v!3332 (underlying!491 thiss!992))) (mask!7372 (v!3332 (underlying!491 thiss!992))) (extraKeys!2747 (v!3332 (underlying!491 thiss!992))) (zeroValue!2847 (v!3332 (underlying!491 thiss!992))) (minValue!2847 (v!3332 (underlying!491 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3002 (v!3332 (underlying!491 thiss!992)))))))

(declare-fun lt!76588 () (_ BitVec 64))

(assert (=> b!145611 (= lt!76588 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76574 () (_ BitVec 64))

(assert (=> b!145611 (= lt!76574 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!76593 () Unit!4602)

(declare-fun addApplyDifferent!100 (ListLongMap!1763 (_ BitVec 64) V!3587 (_ BitVec 64)) Unit!4602)

(assert (=> b!145611 (= lt!76593 (addApplyDifferent!100 lt!76575 lt!76588 (minValue!2847 (v!3332 (underlying!491 thiss!992))) lt!76574))))

(assert (=> b!145611 (= (apply!124 (+!183 lt!76575 (tuple2!2735 lt!76588 (minValue!2847 (v!3332 (underlying!491 thiss!992))))) lt!76574) (apply!124 lt!76575 lt!76574))))

(declare-fun lt!76589 () Unit!4602)

(assert (=> b!145611 (= lt!76589 lt!76593)))

(declare-fun lt!76585 () ListLongMap!1763)

(assert (=> b!145611 (= lt!76585 (getCurrentListMapNoExtraKeys!149 (_keys!4771 (v!3332 (underlying!491 thiss!992))) (_values!2985 (v!3332 (underlying!491 thiss!992))) (mask!7372 (v!3332 (underlying!491 thiss!992))) (extraKeys!2747 (v!3332 (underlying!491 thiss!992))) (zeroValue!2847 (v!3332 (underlying!491 thiss!992))) (minValue!2847 (v!3332 (underlying!491 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3002 (v!3332 (underlying!491 thiss!992)))))))

(declare-fun lt!76580 () (_ BitVec 64))

(assert (=> b!145611 (= lt!76580 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76573 () (_ BitVec 64))

(assert (=> b!145611 (= lt!76573 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!76578 () Unit!4602)

(assert (=> b!145611 (= lt!76578 (addApplyDifferent!100 lt!76585 lt!76580 (zeroValue!2847 (v!3332 (underlying!491 thiss!992))) lt!76573))))

(assert (=> b!145611 (= (apply!124 (+!183 lt!76585 (tuple2!2735 lt!76580 (zeroValue!2847 (v!3332 (underlying!491 thiss!992))))) lt!76573) (apply!124 lt!76585 lt!76573))))

(declare-fun lt!76590 () Unit!4602)

(assert (=> b!145611 (= lt!76590 lt!76578)))

(declare-fun lt!76592 () ListLongMap!1763)

(assert (=> b!145611 (= lt!76592 (getCurrentListMapNoExtraKeys!149 (_keys!4771 (v!3332 (underlying!491 thiss!992))) (_values!2985 (v!3332 (underlying!491 thiss!992))) (mask!7372 (v!3332 (underlying!491 thiss!992))) (extraKeys!2747 (v!3332 (underlying!491 thiss!992))) (zeroValue!2847 (v!3332 (underlying!491 thiss!992))) (minValue!2847 (v!3332 (underlying!491 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3002 (v!3332 (underlying!491 thiss!992)))))))

(declare-fun lt!76579 () (_ BitVec 64))

(assert (=> b!145611 (= lt!76579 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76587 () (_ BitVec 64))

(assert (=> b!145611 (= lt!76587 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!145611 (= lt!76572 (addApplyDifferent!100 lt!76592 lt!76579 (minValue!2847 (v!3332 (underlying!491 thiss!992))) lt!76587))))

(assert (=> b!145611 (= (apply!124 (+!183 lt!76592 (tuple2!2735 lt!76579 (minValue!2847 (v!3332 (underlying!491 thiss!992))))) lt!76587) (apply!124 lt!76592 lt!76587))))

(declare-fun call!16265 () ListLongMap!1763)

(declare-fun bm!16262 () Bool)

(assert (=> bm!16262 (= call!16265 (+!183 (ite c!27559 call!16266 (ite c!27556 call!16263 call!16264)) (ite (or c!27559 c!27556) (tuple2!2735 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2847 (v!3332 (underlying!491 thiss!992)))) (tuple2!2735 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2847 (v!3332 (underlying!491 thiss!992)))))))))

(declare-fun b!145612 () Bool)

(assert (=> b!145612 (= e!94881 (not call!16267))))

(declare-fun bm!16263 () Bool)

(assert (=> bm!16263 (= call!16268 (contains!944 lt!76582 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145613 () Bool)

(assert (=> b!145613 (= e!94882 call!16262)))

(declare-fun bm!16264 () Bool)

(assert (=> bm!16264 (= call!16262 call!16265)))

(declare-fun b!145614 () Bool)

(assert (=> b!145614 (= e!94884 (+!183 call!16265 (tuple2!2735 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2847 (v!3332 (underlying!491 thiss!992))))))))

(declare-fun bm!16265 () Bool)

(assert (=> bm!16265 (= call!16267 (contains!944 lt!76582 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46279 c!27559) b!145614))

(assert (= (and d!46279 (not c!27559)) b!145598))

(assert (= (and b!145598 c!27556) b!145605))

(assert (= (and b!145598 (not c!27556)) b!145603))

(assert (= (and b!145603 c!27555) b!145613))

(assert (= (and b!145603 (not c!27555)) b!145601))

(assert (= (or b!145613 b!145601) bm!16260))

(assert (= (or b!145605 bm!16260) bm!16259))

(assert (= (or b!145605 b!145613) bm!16264))

(assert (= (or b!145614 bm!16259) bm!16261))

(assert (= (or b!145614 bm!16264) bm!16262))

(assert (= (and d!46279 res!69352) b!145610))

(assert (= (and d!46279 c!27558) b!145611))

(assert (= (and d!46279 (not c!27558)) b!145599))

(assert (= (and d!46279 res!69356) b!145604))

(assert (= (and b!145604 res!69354) b!145596))

(assert (= (and b!145604 (not res!69351)) b!145606))

(assert (= (and b!145606 res!69348) b!145607))

(assert (= (and b!145604 res!69353) b!145608))

(assert (= (and b!145608 c!27554) b!145600))

(assert (= (and b!145608 (not c!27554)) b!145609))

(assert (= (and b!145600 res!69350) b!145602))

(assert (= (or b!145600 b!145609) bm!16263))

(assert (= (and b!145608 res!69349) b!145595))

(assert (= (and b!145595 c!27557) b!145594))

(assert (= (and b!145595 (not c!27557)) b!145612))

(assert (= (and b!145594 res!69355) b!145597))

(assert (= (or b!145594 b!145612) bm!16265))

(declare-fun b_lambda!6531 () Bool)

(assert (=> (not b_lambda!6531) (not b!145607)))

(assert (=> b!145607 t!6422))

(declare-fun b_and!9083 () Bool)

(assert (= b_and!9071 (and (=> t!6422 result!4285) b_and!9083)))

(assert (=> b!145607 t!6424))

(declare-fun b_and!9085 () Bool)

(assert (= b_and!9073 (and (=> t!6424 result!4289) b_and!9085)))

(declare-fun m!175525 () Bool)

(assert (=> bm!16262 m!175525))

(declare-fun m!175527 () Bool)

(assert (=> b!145602 m!175527))

(declare-fun m!175529 () Bool)

(assert (=> bm!16263 m!175529))

(declare-fun m!175531 () Bool)

(assert (=> b!145610 m!175531))

(assert (=> b!145610 m!175531))

(declare-fun m!175533 () Bool)

(assert (=> b!145610 m!175533))

(assert (=> b!145607 m!175441))

(declare-fun m!175535 () Bool)

(assert (=> b!145607 m!175535))

(assert (=> b!145607 m!175441))

(declare-fun m!175537 () Bool)

(assert (=> b!145607 m!175537))

(assert (=> b!145607 m!175531))

(declare-fun m!175539 () Bool)

(assert (=> b!145607 m!175539))

(assert (=> b!145607 m!175535))

(assert (=> b!145607 m!175531))

(declare-fun m!175541 () Bool)

(assert (=> b!145611 m!175541))

(declare-fun m!175543 () Bool)

(assert (=> b!145611 m!175543))

(declare-fun m!175545 () Bool)

(assert (=> b!145611 m!175545))

(declare-fun m!175547 () Bool)

(assert (=> b!145611 m!175547))

(declare-fun m!175549 () Bool)

(assert (=> b!145611 m!175549))

(assert (=> b!145611 m!175549))

(declare-fun m!175551 () Bool)

(assert (=> b!145611 m!175551))

(declare-fun m!175553 () Bool)

(assert (=> b!145611 m!175553))

(assert (=> b!145611 m!175541))

(assert (=> b!145611 m!175531))

(declare-fun m!175555 () Bool)

(assert (=> b!145611 m!175555))

(declare-fun m!175557 () Bool)

(assert (=> b!145611 m!175557))

(declare-fun m!175559 () Bool)

(assert (=> b!145611 m!175559))

(declare-fun m!175561 () Bool)

(assert (=> b!145611 m!175561))

(declare-fun m!175563 () Bool)

(assert (=> b!145611 m!175563))

(assert (=> b!145611 m!175555))

(declare-fun m!175565 () Bool)

(assert (=> b!145611 m!175565))

(assert (=> b!145611 m!175559))

(declare-fun m!175567 () Bool)

(assert (=> b!145611 m!175567))

(declare-fun m!175569 () Bool)

(assert (=> b!145611 m!175569))

(declare-fun m!175571 () Bool)

(assert (=> b!145611 m!175571))

(declare-fun m!175573 () Bool)

(assert (=> b!145597 m!175573))

(declare-fun m!175575 () Bool)

(assert (=> bm!16265 m!175575))

(declare-fun m!175577 () Bool)

(assert (=> d!46279 m!175577))

(assert (=> b!145606 m!175531))

(assert (=> b!145606 m!175531))

(declare-fun m!175579 () Bool)

(assert (=> b!145606 m!175579))

(assert (=> b!145596 m!175531))

(assert (=> b!145596 m!175531))

(assert (=> b!145596 m!175533))

(declare-fun m!175581 () Bool)

(assert (=> b!145614 m!175581))

(assert (=> bm!16261 m!175571))

(assert (=> b!145473 d!46279))

(declare-fun d!46281 () Bool)

(assert (=> d!46281 (= (array_inv!1473 (_keys!4771 newMap!16)) (bvsge (size!2615 (_keys!4771 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!145475 d!46281))

(declare-fun d!46283 () Bool)

(assert (=> d!46283 (= (array_inv!1474 (_values!2985 newMap!16)) (bvsge (size!2616 (_values!2985 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!145475 d!46283))

(declare-fun d!46285 () Bool)

(declare-fun res!69363 () Bool)

(declare-fun e!94893 () Bool)

(assert (=> d!46285 (=> (not res!69363) (not e!94893))))

(declare-fun simpleValid!100 (LongMapFixedSize!1176) Bool)

(assert (=> d!46285 (= res!69363 (simpleValid!100 newMap!16))))

(assert (=> d!46285 (= (valid!571 newMap!16) e!94893)))

(declare-fun b!145621 () Bool)

(declare-fun res!69364 () Bool)

(assert (=> b!145621 (=> (not res!69364) (not e!94893))))

(declare-fun arrayCountValidKeys!0 (array!4953 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!145621 (= res!69364 (= (arrayCountValidKeys!0 (_keys!4771 newMap!16) #b00000000000000000000000000000000 (size!2615 (_keys!4771 newMap!16))) (_size!637 newMap!16)))))

(declare-fun b!145622 () Bool)

(declare-fun res!69365 () Bool)

(assert (=> b!145622 (=> (not res!69365) (not e!94893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4953 (_ BitVec 32)) Bool)

(assert (=> b!145622 (= res!69365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4771 newMap!16) (mask!7372 newMap!16)))))

(declare-fun b!145623 () Bool)

(assert (=> b!145623 (= e!94893 (arrayNoDuplicates!0 (_keys!4771 newMap!16) #b00000000000000000000000000000000 Nil!1761))))

(assert (= (and d!46285 res!69363) b!145621))

(assert (= (and b!145621 res!69364) b!145622))

(assert (= (and b!145622 res!69365) b!145623))

(declare-fun m!175583 () Bool)

(assert (=> d!46285 m!175583))

(declare-fun m!175585 () Bool)

(assert (=> b!145621 m!175585))

(declare-fun m!175587 () Bool)

(assert (=> b!145622 m!175587))

(declare-fun m!175589 () Bool)

(assert (=> b!145623 m!175589))

(assert (=> b!145484 d!46285))

(declare-fun d!46287 () Bool)

(assert (=> d!46287 (= (valid!570 thiss!992) (valid!571 (v!3332 (underlying!491 thiss!992))))))

(declare-fun bs!6126 () Bool)

(assert (= bs!6126 d!46287))

(declare-fun m!175591 () Bool)

(assert (=> bs!6126 m!175591))

(assert (=> start!15156 d!46287))

(declare-fun lt!76596 () Bool)

(declare-fun d!46289 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!142 (List!1764) (InoxSet (_ BitVec 64)))

(assert (=> d!46289 (= lt!76596 (select (content!142 lt!76508) (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-fun e!94899 () Bool)

(assert (=> d!46289 (= lt!76596 e!94899)))

(declare-fun res!69370 () Bool)

(assert (=> d!46289 (=> (not res!69370) (not e!94899))))

(assert (=> d!46289 (= res!69370 ((_ is Cons!1760) lt!76508))))

(assert (=> d!46289 (= (contains!943 lt!76508 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355)) lt!76596)))

(declare-fun b!145628 () Bool)

(declare-fun e!94898 () Bool)

(assert (=> b!145628 (= e!94899 e!94898)))

(declare-fun res!69371 () Bool)

(assert (=> b!145628 (=> res!69371 e!94898)))

(assert (=> b!145628 (= res!69371 (= (h!2368 lt!76508) (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-fun b!145629 () Bool)

(assert (=> b!145629 (= e!94898 (contains!943 (t!6425 lt!76508) (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(assert (= (and d!46289 res!69370) b!145628))

(assert (= (and b!145628 (not res!69371)) b!145629))

(declare-fun m!175593 () Bool)

(assert (=> d!46289 m!175593))

(assert (=> d!46289 m!175435))

(declare-fun m!175595 () Bool)

(assert (=> d!46289 m!175595))

(assert (=> b!145629 m!175435))

(declare-fun m!175597 () Bool)

(assert (=> b!145629 m!175597))

(assert (=> b!145472 d!46289))

(declare-fun d!46291 () Bool)

(declare-fun e!94904 () Bool)

(assert (=> d!46291 e!94904))

(declare-fun res!69374 () Bool)

(assert (=> d!46291 (=> res!69374 e!94904)))

(declare-fun lt!76605 () Bool)

(assert (=> d!46291 (= res!69374 (not lt!76605))))

(declare-fun lt!76606 () Bool)

(assert (=> d!46291 (= lt!76605 lt!76606)))

(declare-fun lt!76607 () Unit!4602)

(declare-fun e!94905 () Unit!4602)

(assert (=> d!46291 (= lt!76607 e!94905)))

(declare-fun c!27562 () Bool)

(assert (=> d!46291 (= c!27562 lt!76606)))

(declare-fun containsKey!184 (List!1765 (_ BitVec 64)) Bool)

(assert (=> d!46291 (= lt!76606 (containsKey!184 (toList!897 lt!76509) (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(assert (=> d!46291 (= (contains!944 lt!76509 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355)) lt!76605)))

(declare-fun b!145636 () Bool)

(declare-fun lt!76608 () Unit!4602)

(assert (=> b!145636 (= e!94905 lt!76608)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!132 (List!1765 (_ BitVec 64)) Unit!4602)

(assert (=> b!145636 (= lt!76608 (lemmaContainsKeyImpliesGetValueByKeyDefined!132 (toList!897 lt!76509) (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-datatypes ((Option!186 0))(
  ( (Some!185 (v!3337 V!3587)) (None!184) )
))
(declare-fun isDefined!133 (Option!186) Bool)

(declare-fun getValueByKey!180 (List!1765 (_ BitVec 64)) Option!186)

(assert (=> b!145636 (isDefined!133 (getValueByKey!180 (toList!897 lt!76509) (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-fun b!145637 () Bool)

(declare-fun Unit!4605 () Unit!4602)

(assert (=> b!145637 (= e!94905 Unit!4605)))

(declare-fun b!145638 () Bool)

(assert (=> b!145638 (= e!94904 (isDefined!133 (getValueByKey!180 (toList!897 lt!76509) (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355))))))

(assert (= (and d!46291 c!27562) b!145636))

(assert (= (and d!46291 (not c!27562)) b!145637))

(assert (= (and d!46291 (not res!69374)) b!145638))

(assert (=> d!46291 m!175435))

(declare-fun m!175599 () Bool)

(assert (=> d!46291 m!175599))

(assert (=> b!145636 m!175435))

(declare-fun m!175601 () Bool)

(assert (=> b!145636 m!175601))

(assert (=> b!145636 m!175435))

(declare-fun m!175603 () Bool)

(assert (=> b!145636 m!175603))

(assert (=> b!145636 m!175603))

(declare-fun m!175605 () Bool)

(assert (=> b!145636 m!175605))

(assert (=> b!145638 m!175435))

(assert (=> b!145638 m!175603))

(assert (=> b!145638 m!175603))

(assert (=> b!145638 m!175605))

(assert (=> b!145482 d!46291))

(declare-fun bm!16314 () Bool)

(declare-fun call!16321 () ListLongMap!1763)

(assert (=> bm!16314 (= call!16321 (getCurrentListMap!567 (_keys!4771 newMap!16) (_values!2985 newMap!16) (mask!7372 newMap!16) (extraKeys!2747 newMap!16) (zeroValue!2847 newMap!16) (minValue!2847 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3002 newMap!16)))))

(declare-fun b!145719 () Bool)

(declare-fun e!94956 () Bool)

(declare-fun call!16332 () Bool)

(assert (=> b!145719 (= e!94956 (not call!16332))))

(declare-fun b!145720 () Bool)

(declare-fun e!94955 () tuple2!2736)

(declare-fun e!94967 () tuple2!2736)

(assert (=> b!145720 (= e!94955 e!94967)))

(declare-fun c!27590 () Bool)

(declare-datatypes ((SeekEntryResult!283 0))(
  ( (MissingZero!283 (index!3299 (_ BitVec 32))) (Found!283 (index!3300 (_ BitVec 32))) (Intermediate!283 (undefined!1095 Bool) (index!3301 (_ BitVec 32)) (x!16604 (_ BitVec 32))) (Undefined!283) (MissingVacant!283 (index!3302 (_ BitVec 32))) )
))
(declare-fun lt!76687 () SeekEntryResult!283)

(assert (=> b!145720 (= c!27590 ((_ is MissingZero!283) lt!76687))))

(declare-fun b!145721 () Bool)

(declare-fun res!69414 () Bool)

(declare-fun lt!76665 () SeekEntryResult!283)

(assert (=> b!145721 (= res!69414 (= (select (arr!2339 (_keys!4771 newMap!16)) (index!3302 lt!76665)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!145721 (=> (not res!69414) (not e!94956))))

(declare-fun bm!16315 () Bool)

(declare-fun call!16335 () ListLongMap!1763)

(declare-fun call!16326 () ListLongMap!1763)

(assert (=> bm!16315 (= call!16335 call!16326)))

(declare-fun b!145722 () Bool)

(declare-fun e!94958 () Unit!4602)

(declare-fun Unit!4606 () Unit!4602)

(assert (=> b!145722 (= e!94958 Unit!4606)))

(declare-fun lt!76689 () Unit!4602)

(declare-fun call!16323 () Unit!4602)

(assert (=> b!145722 (= lt!76689 call!16323)))

(declare-fun lt!76672 () SeekEntryResult!283)

(declare-fun call!16336 () SeekEntryResult!283)

(assert (=> b!145722 (= lt!76672 call!16336)))

(declare-fun res!69412 () Bool)

(assert (=> b!145722 (= res!69412 ((_ is Found!283) lt!76672))))

(declare-fun e!94960 () Bool)

(assert (=> b!145722 (=> (not res!69412) (not e!94960))))

(assert (=> b!145722 e!94960))

(declare-fun lt!76683 () Unit!4602)

(assert (=> b!145722 (= lt!76683 lt!76689)))

(assert (=> b!145722 false))

(declare-fun b!145723 () Bool)

(declare-fun res!69410 () Bool)

(declare-fun lt!76675 () SeekEntryResult!283)

(assert (=> b!145723 (= res!69410 (= (select (arr!2339 (_keys!4771 newMap!16)) (index!3302 lt!76675)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94953 () Bool)

(assert (=> b!145723 (=> (not res!69410) (not e!94953))))

(declare-fun b!145724 () Bool)

(declare-fun e!94962 () ListLongMap!1763)

(declare-fun call!16325 () ListLongMap!1763)

(assert (=> b!145724 (= e!94962 call!16325)))

(declare-fun b!145725 () Bool)

(declare-fun res!69407 () Bool)

(declare-fun e!94950 () Bool)

(assert (=> b!145725 (=> (not res!69407) (not e!94950))))

(declare-fun call!16328 () Bool)

(assert (=> b!145725 (= res!69407 call!16328)))

(declare-fun e!94951 () Bool)

(assert (=> b!145725 (= e!94951 e!94950)))

(declare-fun bm!16316 () Bool)

(declare-fun call!16317 () ListLongMap!1763)

(declare-fun lt!76686 () tuple2!2736)

(assert (=> bm!16316 (= call!16317 (map!1456 (_2!1379 lt!76686)))))

(declare-fun b!145726 () Bool)

(declare-fun call!16319 () Bool)

(assert (=> b!145726 (= e!94950 (not call!16319))))

(declare-fun b!145727 () Bool)

(declare-fun lt!76674 () Unit!4602)

(declare-fun lt!76680 () Unit!4602)

(assert (=> b!145727 (= lt!76674 lt!76680)))

(declare-fun call!16330 () Bool)

(assert (=> b!145727 call!16330))

(declare-fun lt!76673 () array!4955)

(declare-fun lemmaValidKeyInArrayIsInListMap!130 (array!4953 array!4955 (_ BitVec 32) (_ BitVec 32) V!3587 V!3587 (_ BitVec 32) Int) Unit!4602)

(assert (=> b!145727 (= lt!76680 (lemmaValidKeyInArrayIsInListMap!130 (_keys!4771 newMap!16) lt!76673 (mask!7372 newMap!16) (extraKeys!2747 newMap!16) (zeroValue!2847 newMap!16) (minValue!2847 newMap!16) (index!3300 lt!76687) (defaultEntry!3002 newMap!16)))))

(assert (=> b!145727 (= lt!76673 (array!4956 (store (arr!2340 (_values!2985 newMap!16)) (index!3300 lt!76687) (ValueCellFull!1134 (get!1557 (select (arr!2340 (_values!2985 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!451 (defaultEntry!3002 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2616 (_values!2985 newMap!16))))))

(declare-fun lt!76671 () Unit!4602)

(declare-fun lt!76677 () Unit!4602)

(assert (=> b!145727 (= lt!76671 lt!76677)))

(declare-fun call!16331 () ListLongMap!1763)

(assert (=> b!145727 (= call!16331 call!16325)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!69 (array!4953 array!4955 (_ BitVec 32) (_ BitVec 32) V!3587 V!3587 (_ BitVec 32) (_ BitVec 64) V!3587 Int) Unit!4602)

(assert (=> b!145727 (= lt!76677 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!69 (_keys!4771 newMap!16) (_values!2985 newMap!16) (mask!7372 newMap!16) (extraKeys!2747 newMap!16) (zeroValue!2847 newMap!16) (minValue!2847 newMap!16) (index!3300 lt!76687) (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) (get!1557 (select (arr!2340 (_values!2985 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!451 (defaultEntry!3002 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!3002 newMap!16)))))

(declare-fun lt!76676 () Unit!4602)

(declare-fun e!94964 () Unit!4602)

(assert (=> b!145727 (= lt!76676 e!94964)))

(declare-fun c!27592 () Bool)

(assert (=> b!145727 (= c!27592 (contains!944 call!16321 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(assert (=> b!145727 (= e!94967 (tuple2!2737 true (LongMapFixedSize!1177 (defaultEntry!3002 newMap!16) (mask!7372 newMap!16) (extraKeys!2747 newMap!16) (zeroValue!2847 newMap!16) (minValue!2847 newMap!16) (_size!637 newMap!16) (_keys!4771 newMap!16) (array!4956 (store (arr!2340 (_values!2985 newMap!16)) (index!3300 lt!76687) (ValueCellFull!1134 (get!1557 (select (arr!2340 (_values!2985 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!451 (defaultEntry!3002 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2616 (_values!2985 newMap!16))) (_vacant!637 newMap!16))))))

(declare-fun bm!16317 () Bool)

(assert (=> bm!16317 (= call!16325 call!16326)))

(declare-fun bm!16318 () Bool)

(declare-fun call!16324 () Bool)

(assert (=> bm!16318 (= call!16319 call!16324)))

(declare-fun b!145728 () Bool)

(declare-fun e!94954 () Bool)

(assert (=> b!145728 (= e!94954 ((_ is Undefined!283) lt!76665))))

(declare-fun b!145729 () Bool)

(assert (=> b!145729 (= e!94960 (= (select (arr!2339 (_keys!4771 newMap!16)) (index!3300 lt!76672)) (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-fun b!145730 () Bool)

(declare-fun lt!76669 () Unit!4602)

(assert (=> b!145730 (= e!94958 lt!76669)))

(declare-fun call!16333 () Unit!4602)

(assert (=> b!145730 (= lt!76669 call!16333)))

(assert (=> b!145730 (= lt!76665 call!16336)))

(declare-fun c!27596 () Bool)

(assert (=> b!145730 (= c!27596 ((_ is MissingZero!283) lt!76665))))

(declare-fun e!94948 () Bool)

(assert (=> b!145730 e!94948))

(declare-fun e!94959 () Bool)

(declare-fun b!145731 () Bool)

(declare-fun call!16339 () ListLongMap!1763)

(assert (=> b!145731 (= e!94959 (= call!16317 (+!183 call!16339 (tuple2!2735 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) (get!1557 (select (arr!2340 (_values!2985 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!451 (defaultEntry!3002 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!27600 () Bool)

(declare-fun lt!76663 () (_ BitVec 32))

(declare-fun c!27593 () Bool)

(declare-fun c!27595 () Bool)

(declare-fun lt!76681 () (_ BitVec 32))

(declare-fun bm!16319 () Bool)

(assert (=> bm!16319 (= call!16326 (getCurrentListMap!567 (_keys!4771 newMap!16) (ite (or c!27593 c!27595) (_values!2985 newMap!16) (array!4956 (store (arr!2340 (_values!2985 newMap!16)) (index!3300 lt!76687) (ValueCellFull!1134 (get!1557 (select (arr!2340 (_values!2985 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!451 (defaultEntry!3002 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2616 (_values!2985 newMap!16)))) (mask!7372 newMap!16) (ite c!27593 (ite c!27600 lt!76663 lt!76681) (extraKeys!2747 newMap!16)) (ite (and c!27593 c!27600) (get!1557 (select (arr!2340 (_values!2985 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!451 (defaultEntry!3002 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2847 newMap!16)) (ite c!27593 (ite c!27600 (minValue!2847 newMap!16) (get!1557 (select (arr!2340 (_values!2985 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!451 (defaultEntry!3002 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2847 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!3002 newMap!16)))))

(declare-fun bm!16320 () Bool)

(assert (=> bm!16320 (= call!16332 call!16324)))

(declare-fun b!145732 () Bool)

(declare-fun e!94961 () Bool)

(declare-fun e!94952 () Bool)

(assert (=> b!145732 (= e!94961 e!94952)))

(declare-fun c!27597 () Bool)

(assert (=> b!145732 (= c!27597 (_1!1379 lt!76686))))

(declare-fun b!145733 () Bool)

(declare-fun res!69408 () Bool)

(assert (=> b!145733 (=> (not res!69408) (not e!94950))))

(assert (=> b!145733 (= res!69408 (= (select (arr!2339 (_keys!4771 newMap!16)) (index!3299 lt!76675)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145734 () Bool)

(declare-fun e!94968 () Bool)

(assert (=> b!145734 (= e!94968 e!94953)))

(declare-fun res!69405 () Bool)

(assert (=> b!145734 (= res!69405 call!16328)))

(assert (=> b!145734 (=> (not res!69405) (not e!94953))))

(declare-fun bm!16321 () Bool)

(declare-fun call!16318 () SeekEntryResult!283)

(assert (=> bm!16321 (= call!16336 call!16318)))

(declare-fun b!145735 () Bool)

(assert (=> b!145735 (= e!94953 (not call!16319))))

(declare-fun bm!16322 () Bool)

(declare-fun call!16327 () ListLongMap!1763)

(assert (=> bm!16322 (= call!16327 call!16321)))

(declare-fun b!145736 () Bool)

(declare-fun res!69409 () Bool)

(declare-fun call!16337 () Bool)

(assert (=> b!145736 (= res!69409 call!16337)))

(assert (=> b!145736 (=> (not res!69409) (not e!94960))))

(declare-fun b!145737 () Bool)

(declare-fun lt!76667 () tuple2!2736)

(declare-fun call!16320 () tuple2!2736)

(assert (=> b!145737 (= lt!76667 call!16320)))

(assert (=> b!145737 (= e!94967 (tuple2!2737 (_1!1379 lt!76667) (_2!1379 lt!76667)))))

(declare-fun b!145738 () Bool)

(declare-fun lt!76678 () Unit!4602)

(declare-fun lt!76682 () Unit!4602)

(assert (=> b!145738 (= lt!76678 lt!76682)))

(declare-fun call!16334 () ListLongMap!1763)

(assert (=> b!145738 (= call!16334 call!16335)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!69 (array!4953 array!4955 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3587 V!3587 V!3587 Int) Unit!4602)

(assert (=> b!145738 (= lt!76682 (lemmaChangeZeroKeyThenAddPairToListMap!69 (_keys!4771 newMap!16) (_values!2985 newMap!16) (mask!7372 newMap!16) (extraKeys!2747 newMap!16) lt!76663 (zeroValue!2847 newMap!16) (get!1557 (select (arr!2340 (_values!2985 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!451 (defaultEntry!3002 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2847 newMap!16) (defaultEntry!3002 newMap!16)))))

(assert (=> b!145738 (= lt!76663 (bvor (extraKeys!2747 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!94965 () tuple2!2736)

(assert (=> b!145738 (= e!94965 (tuple2!2737 true (LongMapFixedSize!1177 (defaultEntry!3002 newMap!16) (mask!7372 newMap!16) (bvor (extraKeys!2747 newMap!16) #b00000000000000000000000000000001) (get!1557 (select (arr!2340 (_values!2985 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!451 (defaultEntry!3002 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2847 newMap!16) (_size!637 newMap!16) (_keys!4771 newMap!16) (_values!2985 newMap!16) (_vacant!637 newMap!16))))))

(declare-fun d!46293 () Bool)

(assert (=> d!46293 e!94961))

(declare-fun res!69415 () Bool)

(assert (=> d!46293 (=> (not res!69415) (not e!94961))))

(assert (=> d!46293 (= res!69415 (valid!571 (_2!1379 lt!76686)))))

(declare-fun e!94963 () tuple2!2736)

(assert (=> d!46293 (= lt!76686 e!94963)))

(assert (=> d!46293 (= c!27593 (= (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) (bvneg (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355))))))

(assert (=> d!46293 (valid!571 newMap!16)))

(assert (=> d!46293 (= (update!220 newMap!16 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) (get!1557 (select (arr!2340 (_values!2985 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!451 (defaultEntry!3002 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!76686)))

(declare-fun b!145739 () Bool)

(assert (=> b!145739 (= e!94952 (= call!16317 call!16339))))

(declare-fun bm!16323 () Bool)

(declare-fun call!16340 () Bool)

(assert (=> bm!16323 (= call!16328 call!16340)))

(declare-fun bm!16324 () Bool)

(assert (=> bm!16324 (= call!16334 call!16331)))

(declare-fun bm!16325 () Bool)

(declare-fun call!16322 () SeekEntryResult!283)

(assert (=> bm!16325 (= call!16322 call!16318)))

(declare-fun b!145740 () Bool)

(declare-fun e!94966 () Bool)

(assert (=> b!145740 (= e!94966 (not call!16332))))

(declare-fun b!145741 () Bool)

(declare-fun c!27591 () Bool)

(assert (=> b!145741 (= c!27591 ((_ is MissingVacant!283) lt!76675))))

(assert (=> b!145741 (= e!94951 e!94968)))

(declare-fun b!145742 () Bool)

(declare-fun lt!76685 () tuple2!2736)

(assert (=> b!145742 (= e!94955 (tuple2!2737 (_1!1379 lt!76685) (_2!1379 lt!76685)))))

(assert (=> b!145742 (= lt!76685 call!16320)))

(declare-fun bm!16326 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!69 (array!4953 array!4955 (_ BitVec 32) (_ BitVec 32) V!3587 V!3587 (_ BitVec 64) Int) Unit!4602)

(assert (=> bm!16326 (= call!16323 (lemmaInListMapThenSeekEntryOrOpenFindsIt!69 (_keys!4771 newMap!16) (_values!2985 newMap!16) (mask!7372 newMap!16) (extraKeys!2747 newMap!16) (zeroValue!2847 newMap!16) (minValue!2847 newMap!16) (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) (defaultEntry!3002 newMap!16)))))

(declare-fun bm!16327 () Bool)

(declare-fun call!16338 () Bool)

(assert (=> bm!16327 (= call!16340 call!16338)))

(declare-fun b!145743 () Bool)

(assert (=> b!145743 (= e!94954 e!94956)))

(declare-fun res!69404 () Bool)

(declare-fun call!16329 () Bool)

(assert (=> b!145743 (= res!69404 call!16329)))

(assert (=> b!145743 (=> (not res!69404) (not e!94956))))

(declare-fun b!145744 () Bool)

(declare-fun e!94949 () Bool)

(declare-fun lt!76688 () SeekEntryResult!283)

(assert (=> b!145744 (= e!94949 (= (select (arr!2339 (_keys!4771 newMap!16)) (index!3300 lt!76688)) (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-fun b!145745 () Bool)

(assert (=> b!145745 (= e!94963 e!94965)))

(assert (=> b!145745 (= c!27600 (= (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145746 () Bool)

(declare-fun c!27589 () Bool)

(assert (=> b!145746 (= c!27589 ((_ is MissingVacant!283) lt!76665))))

(assert (=> b!145746 (= e!94948 e!94954)))

(declare-fun b!145747 () Bool)

(declare-fun lt!76668 () Unit!4602)

(declare-fun lt!76670 () Unit!4602)

(assert (=> b!145747 (= lt!76668 lt!76670)))

(assert (=> b!145747 (= call!16334 call!16335)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!69 (array!4953 array!4955 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3587 V!3587 V!3587 Int) Unit!4602)

(assert (=> b!145747 (= lt!76670 (lemmaChangeLongMinValueKeyThenAddPairToListMap!69 (_keys!4771 newMap!16) (_values!2985 newMap!16) (mask!7372 newMap!16) (extraKeys!2747 newMap!16) lt!76681 (zeroValue!2847 newMap!16) (minValue!2847 newMap!16) (get!1557 (select (arr!2340 (_values!2985 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!451 (defaultEntry!3002 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!3002 newMap!16)))))

(assert (=> b!145747 (= lt!76681 (bvor (extraKeys!2747 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!145747 (= e!94965 (tuple2!2737 true (LongMapFixedSize!1177 (defaultEntry!3002 newMap!16) (mask!7372 newMap!16) (bvor (extraKeys!2747 newMap!16) #b00000000000000000000000000000010) (zeroValue!2847 newMap!16) (get!1557 (select (arr!2340 (_values!2985 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!451 (defaultEntry!3002 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!637 newMap!16) (_keys!4771 newMap!16) (_values!2985 newMap!16) (_vacant!637 newMap!16))))))

(declare-fun bm!16328 () Bool)

(assert (=> bm!16328 (= call!16329 call!16337)))

(declare-fun b!145748 () Bool)

(assert (=> b!145748 (= e!94952 e!94959)))

(declare-fun res!69406 () Bool)

(assert (=> b!145748 (= res!69406 (contains!944 call!16317 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(assert (=> b!145748 (=> (not res!69406) (not e!94959))))

(declare-fun b!145749 () Bool)

(declare-fun c!27598 () Bool)

(assert (=> b!145749 (= c!27598 ((_ is MissingVacant!283) lt!76687))))

(declare-fun e!94957 () tuple2!2736)

(assert (=> b!145749 (= e!94957 e!94955)))

(declare-fun b!145750 () Bool)

(declare-fun lt!76684 () Unit!4602)

(assert (=> b!145750 (= e!94964 lt!76684)))

(assert (=> b!145750 (= lt!76684 call!16323)))

(assert (=> b!145750 (= lt!76688 call!16322)))

(declare-fun res!69403 () Bool)

(assert (=> b!145750 (= res!69403 ((_ is Found!283) lt!76688))))

(assert (=> b!145750 (=> (not res!69403) (not e!94949))))

(assert (=> b!145750 e!94949))

(declare-fun bm!16329 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4953 (_ BitVec 32)) SeekEntryResult!283)

(assert (=> bm!16329 (= call!16318 (seekEntryOrOpen!0 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) (_keys!4771 newMap!16) (mask!7372 newMap!16)))))

(declare-fun b!145751 () Bool)

(declare-fun res!69413 () Bool)

(assert (=> b!145751 (=> (not res!69413) (not e!94966))))

(assert (=> b!145751 (= res!69413 call!16329)))

(assert (=> b!145751 (= e!94948 e!94966)))

(declare-fun c!27601 () Bool)

(declare-fun c!27594 () Bool)

(declare-fun bm!16330 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!16330 (= call!16338 (inRange!0 (ite c!27595 (ite c!27594 (index!3300 lt!76672) (ite c!27596 (index!3299 lt!76665) (index!3302 lt!76665))) (ite c!27592 (index!3300 lt!76688) (ite c!27601 (index!3299 lt!76675) (index!3302 lt!76675)))) (mask!7372 newMap!16)))))

(declare-fun bm!16331 () Bool)

(assert (=> bm!16331 (= call!16324 (arrayContainsKey!0 (_keys!4771 newMap!16) (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!145752 () Bool)

(declare-fun lt!76679 () Unit!4602)

(assert (=> b!145752 (= lt!76679 e!94958)))

(assert (=> b!145752 (= c!27594 call!16330)))

(assert (=> b!145752 (= e!94957 (tuple2!2737 false newMap!16))))

(declare-fun b!145753 () Bool)

(assert (=> b!145753 (= e!94968 ((_ is Undefined!283) lt!76675))))

(declare-fun b!145754 () Bool)

(assert (=> b!145754 (= e!94962 (getCurrentListMap!567 (_keys!4771 newMap!16) lt!76673 (mask!7372 newMap!16) (extraKeys!2747 newMap!16) (zeroValue!2847 newMap!16) (minValue!2847 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3002 newMap!16)))))

(declare-fun bm!16332 () Bool)

(assert (=> bm!16332 (= call!16337 call!16338)))

(declare-fun b!145755 () Bool)

(declare-fun res!69416 () Bool)

(assert (=> b!145755 (=> (not res!69416) (not e!94966))))

(assert (=> b!145755 (= res!69416 (= (select (arr!2339 (_keys!4771 newMap!16)) (index!3299 lt!76665)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!16333 () Bool)

(declare-fun updateHelperNewKey!69 (LongMapFixedSize!1176 (_ BitVec 64) V!3587 (_ BitVec 32)) tuple2!2736)

(assert (=> bm!16333 (= call!16320 (updateHelperNewKey!69 newMap!16 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) (get!1557 (select (arr!2340 (_values!2985 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!451 (defaultEntry!3002 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!27598 (index!3302 lt!76687) (index!3299 lt!76687))))))

(declare-fun b!145756 () Bool)

(declare-fun res!69411 () Bool)

(assert (=> b!145756 (= res!69411 call!16340)))

(assert (=> b!145756 (=> (not res!69411) (not e!94949))))

(declare-fun bm!16334 () Bool)

(declare-fun c!27599 () Bool)

(assert (=> bm!16334 (= c!27599 c!27595)))

(assert (=> bm!16334 (= call!16330 (contains!944 e!94962 (ite c!27595 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) (select (arr!2339 (_keys!4771 newMap!16)) (index!3300 lt!76687)))))))

(declare-fun b!145757 () Bool)

(declare-fun Unit!4607 () Unit!4602)

(assert (=> b!145757 (= e!94964 Unit!4607)))

(declare-fun lt!76664 () Unit!4602)

(assert (=> b!145757 (= lt!76664 call!16333)))

(assert (=> b!145757 (= lt!76675 call!16322)))

(assert (=> b!145757 (= c!27601 ((_ is MissingZero!283) lt!76675))))

(assert (=> b!145757 e!94951))

(declare-fun lt!76666 () Unit!4602)

(assert (=> b!145757 (= lt!76666 lt!76664)))

(assert (=> b!145757 false))

(declare-fun b!145758 () Bool)

(assert (=> b!145758 (= e!94963 e!94957)))

(assert (=> b!145758 (= lt!76687 (seekEntryOrOpen!0 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) (_keys!4771 newMap!16) (mask!7372 newMap!16)))))

(assert (=> b!145758 (= c!27595 ((_ is Undefined!283) lt!76687))))

(declare-fun bm!16335 () Bool)

(assert (=> bm!16335 (= call!16331 (+!183 (ite c!27593 call!16327 call!16321) (ite c!27593 (ite c!27600 (tuple2!2735 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1557 (select (arr!2340 (_values!2985 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!451 (defaultEntry!3002 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2735 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1557 (select (arr!2340 (_values!2985 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!451 (defaultEntry!3002 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2735 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) (get!1557 (select (arr!2340 (_values!2985 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!451 (defaultEntry!3002 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!16336 () Bool)

(assert (=> bm!16336 (= call!16339 (map!1456 newMap!16))))

(declare-fun bm!16337 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!69 (array!4953 array!4955 (_ BitVec 32) (_ BitVec 32) V!3587 V!3587 (_ BitVec 64) Int) Unit!4602)

(assert (=> bm!16337 (= call!16333 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!69 (_keys!4771 newMap!16) (_values!2985 newMap!16) (mask!7372 newMap!16) (extraKeys!2747 newMap!16) (zeroValue!2847 newMap!16) (minValue!2847 newMap!16) (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) (defaultEntry!3002 newMap!16)))))

(assert (= (and d!46293 c!27593) b!145745))

(assert (= (and d!46293 (not c!27593)) b!145758))

(assert (= (and b!145745 c!27600) b!145738))

(assert (= (and b!145745 (not c!27600)) b!145747))

(assert (= (or b!145738 b!145747) bm!16315))

(assert (= (or b!145738 b!145747) bm!16322))

(assert (= (or b!145738 b!145747) bm!16324))

(assert (= (and b!145758 c!27595) b!145752))

(assert (= (and b!145758 (not c!27595)) b!145749))

(assert (= (and b!145752 c!27594) b!145722))

(assert (= (and b!145752 (not c!27594)) b!145730))

(assert (= (and b!145722 res!69412) b!145736))

(assert (= (and b!145736 res!69409) b!145729))

(assert (= (and b!145730 c!27596) b!145751))

(assert (= (and b!145730 (not c!27596)) b!145746))

(assert (= (and b!145751 res!69413) b!145755))

(assert (= (and b!145755 res!69416) b!145740))

(assert (= (and b!145746 c!27589) b!145743))

(assert (= (and b!145746 (not c!27589)) b!145728))

(assert (= (and b!145743 res!69404) b!145721))

(assert (= (and b!145721 res!69414) b!145719))

(assert (= (or b!145751 b!145743) bm!16328))

(assert (= (or b!145740 b!145719) bm!16320))

(assert (= (or b!145736 bm!16328) bm!16332))

(assert (= (or b!145722 b!145730) bm!16321))

(assert (= (and b!145749 c!27598) b!145742))

(assert (= (and b!145749 (not c!27598)) b!145720))

(assert (= (and b!145720 c!27590) b!145737))

(assert (= (and b!145720 (not c!27590)) b!145727))

(assert (= (and b!145727 c!27592) b!145750))

(assert (= (and b!145727 (not c!27592)) b!145757))

(assert (= (and b!145750 res!69403) b!145756))

(assert (= (and b!145756 res!69411) b!145744))

(assert (= (and b!145757 c!27601) b!145725))

(assert (= (and b!145757 (not c!27601)) b!145741))

(assert (= (and b!145725 res!69407) b!145733))

(assert (= (and b!145733 res!69408) b!145726))

(assert (= (and b!145741 c!27591) b!145734))

(assert (= (and b!145741 (not c!27591)) b!145753))

(assert (= (and b!145734 res!69405) b!145723))

(assert (= (and b!145723 res!69410) b!145735))

(assert (= (or b!145725 b!145734) bm!16323))

(assert (= (or b!145726 b!145735) bm!16318))

(assert (= (or b!145756 bm!16323) bm!16327))

(assert (= (or b!145750 b!145757) bm!16325))

(assert (= (or b!145742 b!145737) bm!16333))

(assert (= (or bm!16321 bm!16325) bm!16329))

(assert (= (or bm!16332 bm!16327) bm!16330))

(assert (= (or bm!16320 bm!16318) bm!16331))

(assert (= (or b!145752 b!145727) bm!16317))

(assert (= (or b!145722 b!145750) bm!16326))

(assert (= (or b!145730 b!145757) bm!16337))

(assert (= (or b!145752 b!145727) bm!16334))

(assert (= (and bm!16334 c!27599) b!145724))

(assert (= (and bm!16334 (not c!27599)) b!145754))

(assert (= (or bm!16315 bm!16317) bm!16319))

(assert (= (or bm!16322 b!145727) bm!16314))

(assert (= (or bm!16324 b!145727) bm!16335))

(assert (= (and d!46293 res!69415) b!145732))

(assert (= (and b!145732 c!27597) b!145748))

(assert (= (and b!145732 (not c!27597)) b!145739))

(assert (= (and b!145748 res!69406) b!145731))

(assert (= (or b!145748 b!145731 b!145739) bm!16316))

(assert (= (or b!145731 b!145739) bm!16336))

(assert (=> b!145758 m!175435))

(declare-fun m!175607 () Bool)

(assert (=> b!145758 m!175607))

(assert (=> bm!16314 m!175523))

(declare-fun m!175609 () Bool)

(assert (=> b!145744 m!175609))

(declare-fun m!175611 () Bool)

(assert (=> b!145721 m!175611))

(assert (=> b!145747 m!175443))

(declare-fun m!175613 () Bool)

(assert (=> b!145747 m!175613))

(assert (=> bm!16329 m!175435))

(assert (=> bm!16329 m!175607))

(declare-fun m!175615 () Bool)

(assert (=> b!145729 m!175615))

(declare-fun m!175617 () Bool)

(assert (=> b!145733 m!175617))

(declare-fun m!175619 () Bool)

(assert (=> b!145755 m!175619))

(assert (=> bm!16326 m!175435))

(declare-fun m!175621 () Bool)

(assert (=> bm!16326 m!175621))

(declare-fun m!175623 () Bool)

(assert (=> b!145754 m!175623))

(assert (=> bm!16333 m!175435))

(assert (=> bm!16333 m!175443))

(declare-fun m!175625 () Bool)

(assert (=> bm!16333 m!175625))

(declare-fun m!175627 () Bool)

(assert (=> bm!16316 m!175627))

(declare-fun m!175629 () Bool)

(assert (=> d!46293 m!175629))

(assert (=> d!46293 m!175471))

(assert (=> bm!16336 m!175451))

(declare-fun m!175631 () Bool)

(assert (=> b!145727 m!175631))

(declare-fun m!175633 () Bool)

(assert (=> b!145727 m!175633))

(assert (=> b!145727 m!175435))

(assert (=> b!145727 m!175443))

(declare-fun m!175635 () Bool)

(assert (=> b!145727 m!175635))

(assert (=> b!145727 m!175435))

(declare-fun m!175637 () Bool)

(assert (=> b!145727 m!175637))

(declare-fun m!175639 () Bool)

(assert (=> b!145731 m!175639))

(declare-fun m!175641 () Bool)

(assert (=> bm!16330 m!175641))

(assert (=> b!145748 m!175435))

(declare-fun m!175643 () Bool)

(assert (=> b!145748 m!175643))

(assert (=> bm!16319 m!175633))

(declare-fun m!175645 () Bool)

(assert (=> bm!16319 m!175645))

(assert (=> bm!16331 m!175435))

(declare-fun m!175647 () Bool)

(assert (=> bm!16331 m!175647))

(declare-fun m!175649 () Bool)

(assert (=> bm!16334 m!175649))

(declare-fun m!175651 () Bool)

(assert (=> bm!16334 m!175651))

(assert (=> bm!16337 m!175435))

(declare-fun m!175653 () Bool)

(assert (=> bm!16337 m!175653))

(assert (=> b!145738 m!175443))

(declare-fun m!175655 () Bool)

(assert (=> b!145738 m!175655))

(declare-fun m!175657 () Bool)

(assert (=> bm!16335 m!175657))

(declare-fun m!175659 () Bool)

(assert (=> b!145723 m!175659))

(assert (=> b!145482 d!46293))

(declare-fun d!46295 () Bool)

(declare-fun c!27604 () Bool)

(assert (=> d!46295 (= c!27604 ((_ is ValueCellFull!1134) (select (arr!2340 (_values!2985 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-fun e!94971 () V!3587)

(assert (=> d!46295 (= (get!1557 (select (arr!2340 (_values!2985 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!451 (defaultEntry!3002 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!94971)))

(declare-fun b!145763 () Bool)

(declare-fun get!1559 (ValueCell!1134 V!3587) V!3587)

(assert (=> b!145763 (= e!94971 (get!1559 (select (arr!2340 (_values!2985 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!451 (defaultEntry!3002 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!145764 () Bool)

(declare-fun get!1560 (ValueCell!1134 V!3587) V!3587)

(assert (=> b!145764 (= e!94971 (get!1560 (select (arr!2340 (_values!2985 (v!3332 (underlying!491 thiss!992)))) from!355) (dynLambda!451 (defaultEntry!3002 (v!3332 (underlying!491 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!46295 c!27604) b!145763))

(assert (= (and d!46295 (not c!27604)) b!145764))

(assert (=> b!145763 m!175439))

(assert (=> b!145763 m!175441))

(declare-fun m!175661 () Bool)

(assert (=> b!145763 m!175661))

(assert (=> b!145764 m!175439))

(assert (=> b!145764 m!175441))

(declare-fun m!175663 () Bool)

(assert (=> b!145764 m!175663))

(assert (=> b!145482 d!46295))

(declare-fun d!46297 () Bool)

(assert (=> d!46297 (= (array_inv!1473 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) (bvsge (size!2615 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!145464 d!46297))

(declare-fun d!46299 () Bool)

(assert (=> d!46299 (= (array_inv!1474 (_values!2985 (v!3332 (underlying!491 thiss!992)))) (bvsge (size!2616 (_values!2985 (v!3332 (underlying!491 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!145464 d!46299))

(declare-fun d!46301 () Bool)

(declare-fun lt!76690 () Bool)

(assert (=> d!46301 (= lt!76690 (select (content!142 lt!76508) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94973 () Bool)

(assert (=> d!46301 (= lt!76690 e!94973)))

(declare-fun res!69417 () Bool)

(assert (=> d!46301 (=> (not res!69417) (not e!94973))))

(assert (=> d!46301 (= res!69417 ((_ is Cons!1760) lt!76508))))

(assert (=> d!46301 (= (contains!943 lt!76508 #b1000000000000000000000000000000000000000000000000000000000000000) lt!76690)))

(declare-fun b!145765 () Bool)

(declare-fun e!94972 () Bool)

(assert (=> b!145765 (= e!94973 e!94972)))

(declare-fun res!69418 () Bool)

(assert (=> b!145765 (=> res!69418 e!94972)))

(assert (=> b!145765 (= res!69418 (= (h!2368 lt!76508) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145766 () Bool)

(assert (=> b!145766 (= e!94972 (contains!943 (t!6425 lt!76508) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46301 res!69417) b!145765))

(assert (= (and b!145765 (not res!69418)) b!145766))

(assert (=> d!46301 m!175593))

(declare-fun m!175665 () Bool)

(assert (=> d!46301 m!175665))

(declare-fun m!175667 () Bool)

(assert (=> b!145766 m!175667))

(assert (=> b!145479 d!46301))

(declare-fun d!46303 () Bool)

(declare-fun lt!76691 () Bool)

(assert (=> d!46303 (= lt!76691 (select (content!142 lt!76508) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94975 () Bool)

(assert (=> d!46303 (= lt!76691 e!94975)))

(declare-fun res!69419 () Bool)

(assert (=> d!46303 (=> (not res!69419) (not e!94975))))

(assert (=> d!46303 (= res!69419 ((_ is Cons!1760) lt!76508))))

(assert (=> d!46303 (= (contains!943 lt!76508 #b0000000000000000000000000000000000000000000000000000000000000000) lt!76691)))

(declare-fun b!145767 () Bool)

(declare-fun e!94974 () Bool)

(assert (=> b!145767 (= e!94975 e!94974)))

(declare-fun res!69420 () Bool)

(assert (=> b!145767 (=> res!69420 e!94974)))

(assert (=> b!145767 (= res!69420 (= (h!2368 lt!76508) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145768 () Bool)

(assert (=> b!145768 (= e!94974 (contains!943 (t!6425 lt!76508) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46303 res!69419) b!145767))

(assert (= (and b!145767 (not res!69420)) b!145768))

(assert (=> d!46303 m!175593))

(declare-fun m!175669 () Bool)

(assert (=> d!46303 m!175669))

(declare-fun m!175671 () Bool)

(assert (=> b!145768 m!175671))

(assert (=> b!145468 d!46303))

(declare-fun b!145779 () Bool)

(declare-fun e!94985 () Bool)

(declare-fun e!94984 () Bool)

(assert (=> b!145779 (= e!94985 e!94984)))

(declare-fun res!69428 () Bool)

(assert (=> b!145779 (=> (not res!69428) (not e!94984))))

(declare-fun e!94986 () Bool)

(assert (=> b!145779 (= res!69428 (not e!94986))))

(declare-fun res!69429 () Bool)

(assert (=> b!145779 (=> (not res!69429) (not e!94986))))

(assert (=> b!145779 (= res!69429 (validKeyInArray!0 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun d!46305 () Bool)

(declare-fun res!69427 () Bool)

(assert (=> d!46305 (=> res!69427 e!94985)))

(assert (=> d!46305 (= res!69427 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2615 (_keys!4771 (v!3332 (underlying!491 thiss!992))))))))

(assert (=> d!46305 (= (arrayNoDuplicates!0 (_keys!4771 (v!3332 (underlying!491 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!76508) e!94985)))

(declare-fun call!16343 () Bool)

(declare-fun bm!16340 () Bool)

(declare-fun c!27607 () Bool)

(assert (=> bm!16340 (= call!16343 (arrayNoDuplicates!0 (_keys!4771 (v!3332 (underlying!491 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (ite c!27607 (Cons!1760 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) lt!76508) lt!76508)))))

(declare-fun b!145780 () Bool)

(declare-fun e!94987 () Bool)

(assert (=> b!145780 (= e!94987 call!16343)))

(declare-fun b!145781 () Bool)

(assert (=> b!145781 (= e!94986 (contains!943 lt!76508 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!145782 () Bool)

(assert (=> b!145782 (= e!94984 e!94987)))

(assert (=> b!145782 (= c!27607 (validKeyInArray!0 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!145783 () Bool)

(assert (=> b!145783 (= e!94987 call!16343)))

(assert (= (and d!46305 (not res!69427)) b!145779))

(assert (= (and b!145779 res!69429) b!145781))

(assert (= (and b!145779 res!69428) b!145782))

(assert (= (and b!145782 c!27607) b!145783))

(assert (= (and b!145782 (not c!27607)) b!145780))

(assert (= (or b!145783 b!145780) bm!16340))

(assert (=> b!145779 m!175531))

(assert (=> b!145779 m!175531))

(assert (=> b!145779 m!175533))

(assert (=> bm!16340 m!175531))

(declare-fun m!175673 () Bool)

(assert (=> bm!16340 m!175673))

(assert (=> b!145781 m!175531))

(assert (=> b!145781 m!175531))

(declare-fun m!175675 () Bool)

(assert (=> b!145781 m!175675))

(assert (=> b!145782 m!175531))

(assert (=> b!145782 m!175531))

(assert (=> b!145782 m!175533))

(assert (=> b!145467 d!46305))

(declare-fun b!145784 () Bool)

(declare-fun e!94989 () Bool)

(declare-fun e!94988 () Bool)

(assert (=> b!145784 (= e!94989 e!94988)))

(declare-fun res!69431 () Bool)

(assert (=> b!145784 (=> (not res!69431) (not e!94988))))

(declare-fun e!94990 () Bool)

(assert (=> b!145784 (= res!69431 (not e!94990))))

(declare-fun res!69432 () Bool)

(assert (=> b!145784 (=> (not res!69432) (not e!94990))))

(assert (=> b!145784 (= res!69432 (validKeyInArray!0 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-fun d!46307 () Bool)

(declare-fun res!69430 () Bool)

(assert (=> d!46307 (=> res!69430 e!94989)))

(assert (=> d!46307 (= res!69430 (bvsge from!355 (size!2615 (_keys!4771 (v!3332 (underlying!491 thiss!992))))))))

(assert (=> d!46307 (= (arrayNoDuplicates!0 (_keys!4771 (v!3332 (underlying!491 thiss!992))) from!355 Nil!1761) e!94989)))

(declare-fun c!27608 () Bool)

(declare-fun call!16344 () Bool)

(declare-fun bm!16341 () Bool)

(assert (=> bm!16341 (= call!16344 (arrayNoDuplicates!0 (_keys!4771 (v!3332 (underlying!491 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!27608 (Cons!1760 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) Nil!1761) Nil!1761)))))

(declare-fun b!145785 () Bool)

(declare-fun e!94991 () Bool)

(assert (=> b!145785 (= e!94991 call!16344)))

(declare-fun b!145786 () Bool)

(assert (=> b!145786 (= e!94990 (contains!943 Nil!1761 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-fun b!145787 () Bool)

(assert (=> b!145787 (= e!94988 e!94991)))

(assert (=> b!145787 (= c!27608 (validKeyInArray!0 (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(declare-fun b!145788 () Bool)

(assert (=> b!145788 (= e!94991 call!16344)))

(assert (= (and d!46307 (not res!69430)) b!145784))

(assert (= (and b!145784 res!69432) b!145786))

(assert (= (and b!145784 res!69431) b!145787))

(assert (= (and b!145787 c!27608) b!145788))

(assert (= (and b!145787 (not c!27608)) b!145785))

(assert (= (or b!145788 b!145785) bm!16341))

(assert (=> b!145784 m!175435))

(assert (=> b!145784 m!175435))

(declare-fun m!175677 () Bool)

(assert (=> b!145784 m!175677))

(assert (=> bm!16341 m!175435))

(declare-fun m!175679 () Bool)

(assert (=> bm!16341 m!175679))

(assert (=> b!145786 m!175435))

(assert (=> b!145786 m!175435))

(declare-fun m!175681 () Bool)

(assert (=> b!145786 m!175681))

(assert (=> b!145787 m!175435))

(assert (=> b!145787 m!175435))

(assert (=> b!145787 m!175677))

(assert (=> b!145478 d!46307))

(declare-fun d!46309 () Bool)

(assert (=> d!46309 (arrayNoDuplicates!0 (_keys!4771 (v!3332 (underlying!491 thiss!992))) from!355 Nil!1761)))

(declare-fun lt!76694 () Unit!4602)

(declare-fun choose!39 (array!4953 (_ BitVec 32) (_ BitVec 32)) Unit!4602)

(assert (=> d!46309 (= lt!76694 (choose!39 (_keys!4771 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!46309 (bvslt (size!2615 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!46309 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4771 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000000 from!355) lt!76694)))

(declare-fun bs!6127 () Bool)

(assert (= bs!6127 d!46309))

(assert (=> bs!6127 m!175465))

(declare-fun m!175683 () Bool)

(assert (=> bs!6127 m!175683))

(assert (=> b!145478 d!46309))

(declare-fun d!46311 () Bool)

(declare-fun res!69437 () Bool)

(declare-fun e!94996 () Bool)

(assert (=> d!46311 (=> res!69437 e!94996)))

(assert (=> d!46311 (= res!69437 (= (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355)))))

(assert (=> d!46311 (= (arrayContainsKey!0 (_keys!4771 (v!3332 (underlying!491 thiss!992))) (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!94996)))

(declare-fun b!145793 () Bool)

(declare-fun e!94997 () Bool)

(assert (=> b!145793 (= e!94996 e!94997)))

(declare-fun res!69438 () Bool)

(assert (=> b!145793 (=> (not res!69438) (not e!94997))))

(assert (=> b!145793 (= res!69438 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2615 (_keys!4771 (v!3332 (underlying!491 thiss!992))))))))

(declare-fun b!145794 () Bool)

(assert (=> b!145794 (= e!94997 (arrayContainsKey!0 (_keys!4771 (v!3332 (underlying!491 thiss!992))) (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!46311 (not res!69437)) b!145793))

(assert (= (and b!145793 res!69438) b!145794))

(assert (=> d!46311 m!175531))

(assert (=> b!145794 m!175435))

(declare-fun m!175685 () Bool)

(assert (=> b!145794 m!175685))

(assert (=> b!145478 d!46311))

(declare-fun d!46313 () Bool)

(declare-fun e!95000 () Bool)

(assert (=> d!46313 e!95000))

(declare-fun c!27611 () Bool)

(assert (=> d!46313 (= c!27611 (and (not (= (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!76697 () Unit!4602)

(declare-fun choose!899 (array!4953 array!4955 (_ BitVec 32) (_ BitVec 32) V!3587 V!3587 (_ BitVec 64) (_ BitVec 32) Int) Unit!4602)

(assert (=> d!46313 (= lt!76697 (choose!899 (_keys!4771 (v!3332 (underlying!491 thiss!992))) (_values!2985 (v!3332 (underlying!491 thiss!992))) (mask!7372 (v!3332 (underlying!491 thiss!992))) (extraKeys!2747 (v!3332 (underlying!491 thiss!992))) (zeroValue!2847 (v!3332 (underlying!491 thiss!992))) (minValue!2847 (v!3332 (underlying!491 thiss!992))) (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3002 (v!3332 (underlying!491 thiss!992)))))))

(assert (=> d!46313 (validMask!0 (mask!7372 (v!3332 (underlying!491 thiss!992))))))

(assert (=> d!46313 (= (lemmaListMapContainsThenArrayContainsFrom!148 (_keys!4771 (v!3332 (underlying!491 thiss!992))) (_values!2985 (v!3332 (underlying!491 thiss!992))) (mask!7372 (v!3332 (underlying!491 thiss!992))) (extraKeys!2747 (v!3332 (underlying!491 thiss!992))) (zeroValue!2847 (v!3332 (underlying!491 thiss!992))) (minValue!2847 (v!3332 (underlying!491 thiss!992))) (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3002 (v!3332 (underlying!491 thiss!992)))) lt!76697)))

(declare-fun b!145799 () Bool)

(assert (=> b!145799 (= e!95000 (arrayContainsKey!0 (_keys!4771 (v!3332 (underlying!491 thiss!992))) (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!145800 () Bool)

(assert (=> b!145800 (= e!95000 (ite (= (select (arr!2339 (_keys!4771 (v!3332 (underlying!491 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2747 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2747 (v!3332 (underlying!491 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!46313 c!27611) b!145799))

(assert (= (and d!46313 (not c!27611)) b!145800))

(assert (=> d!46313 m!175435))

(declare-fun m!175687 () Bool)

(assert (=> d!46313 m!175687))

(assert (=> d!46313 m!175577))

(assert (=> b!145799 m!175435))

(assert (=> b!145799 m!175469))

(assert (=> b!145478 d!46313))

(declare-fun d!46315 () Bool)

(declare-fun res!69443 () Bool)

(declare-fun e!95005 () Bool)

(assert (=> d!46315 (=> res!69443 e!95005)))

(assert (=> d!46315 (= res!69443 ((_ is Nil!1761) lt!76508))))

(assert (=> d!46315 (= (noDuplicate!56 lt!76508) e!95005)))

(declare-fun b!145805 () Bool)

(declare-fun e!95006 () Bool)

(assert (=> b!145805 (= e!95005 e!95006)))

(declare-fun res!69444 () Bool)

(assert (=> b!145805 (=> (not res!69444) (not e!95006))))

(assert (=> b!145805 (= res!69444 (not (contains!943 (t!6425 lt!76508) (h!2368 lt!76508))))))

(declare-fun b!145806 () Bool)

(assert (=> b!145806 (= e!95006 (noDuplicate!56 (t!6425 lt!76508)))))

(assert (= (and d!46315 (not res!69443)) b!145805))

(assert (= (and b!145805 res!69444) b!145806))

(declare-fun m!175689 () Bool)

(assert (=> b!145805 m!175689))

(declare-fun m!175691 () Bool)

(assert (=> b!145806 m!175691))

(assert (=> b!145477 d!46315))

(declare-fun mapNonEmpty!4943 () Bool)

(declare-fun mapRes!4943 () Bool)

(declare-fun tp!11747 () Bool)

(declare-fun e!95012 () Bool)

(assert (=> mapNonEmpty!4943 (= mapRes!4943 (and tp!11747 e!95012))))

(declare-fun mapRest!4943 () (Array (_ BitVec 32) ValueCell!1134))

(declare-fun mapKey!4943 () (_ BitVec 32))

(declare-fun mapValue!4943 () ValueCell!1134)

(assert (=> mapNonEmpty!4943 (= mapRest!4933 (store mapRest!4943 mapKey!4943 mapValue!4943))))

(declare-fun condMapEmpty!4943 () Bool)

(declare-fun mapDefault!4943 () ValueCell!1134)

(assert (=> mapNonEmpty!4934 (= condMapEmpty!4943 (= mapRest!4933 ((as const (Array (_ BitVec 32) ValueCell!1134)) mapDefault!4943)))))

(declare-fun e!95011 () Bool)

(assert (=> mapNonEmpty!4934 (= tp!11731 (and e!95011 mapRes!4943))))

(declare-fun b!145813 () Bool)

(assert (=> b!145813 (= e!95012 tp_is_empty!2955)))

(declare-fun b!145814 () Bool)

(assert (=> b!145814 (= e!95011 tp_is_empty!2955)))

(declare-fun mapIsEmpty!4943 () Bool)

(assert (=> mapIsEmpty!4943 mapRes!4943))

(assert (= (and mapNonEmpty!4934 condMapEmpty!4943) mapIsEmpty!4943))

(assert (= (and mapNonEmpty!4934 (not condMapEmpty!4943)) mapNonEmpty!4943))

(assert (= (and mapNonEmpty!4943 ((_ is ValueCellFull!1134) mapValue!4943)) b!145813))

(assert (= (and mapNonEmpty!4934 ((_ is ValueCellFull!1134) mapDefault!4943)) b!145814))

(declare-fun m!175693 () Bool)

(assert (=> mapNonEmpty!4943 m!175693))

(declare-fun mapNonEmpty!4944 () Bool)

(declare-fun mapRes!4944 () Bool)

(declare-fun tp!11748 () Bool)

(declare-fun e!95014 () Bool)

(assert (=> mapNonEmpty!4944 (= mapRes!4944 (and tp!11748 e!95014))))

(declare-fun mapRest!4944 () (Array (_ BitVec 32) ValueCell!1134))

(declare-fun mapValue!4944 () ValueCell!1134)

(declare-fun mapKey!4944 () (_ BitVec 32))

(assert (=> mapNonEmpty!4944 (= mapRest!4934 (store mapRest!4944 mapKey!4944 mapValue!4944))))

(declare-fun condMapEmpty!4944 () Bool)

(declare-fun mapDefault!4944 () ValueCell!1134)

(assert (=> mapNonEmpty!4933 (= condMapEmpty!4944 (= mapRest!4934 ((as const (Array (_ BitVec 32) ValueCell!1134)) mapDefault!4944)))))

(declare-fun e!95013 () Bool)

(assert (=> mapNonEmpty!4933 (= tp!11732 (and e!95013 mapRes!4944))))

(declare-fun b!145815 () Bool)

(assert (=> b!145815 (= e!95014 tp_is_empty!2955)))

(declare-fun b!145816 () Bool)

(assert (=> b!145816 (= e!95013 tp_is_empty!2955)))

(declare-fun mapIsEmpty!4944 () Bool)

(assert (=> mapIsEmpty!4944 mapRes!4944))

(assert (= (and mapNonEmpty!4933 condMapEmpty!4944) mapIsEmpty!4944))

(assert (= (and mapNonEmpty!4933 (not condMapEmpty!4944)) mapNonEmpty!4944))

(assert (= (and mapNonEmpty!4944 ((_ is ValueCellFull!1134) mapValue!4944)) b!145815))

(assert (= (and mapNonEmpty!4933 ((_ is ValueCellFull!1134) mapDefault!4944)) b!145816))

(declare-fun m!175695 () Bool)

(assert (=> mapNonEmpty!4944 m!175695))

(declare-fun b_lambda!6533 () Bool)

(assert (= b_lambda!6531 (or (and b!145464 b_free!3077) (and b!145475 b_free!3079 (= (defaultEntry!3002 newMap!16) (defaultEntry!3002 (v!3332 (underlying!491 thiss!992))))) b_lambda!6533)))

(check-sat (not bm!16336) (not d!46279) (not bm!16265) (not d!46301) (not d!46287) (not b_lambda!6529) (not bm!16316) (not b!145758) (not d!46313) b_and!9085 (not bm!16261) (not b!145786) (not b!145638) (not b!145805) (not bm!16319) (not b!145754) (not b!145766) (not d!46285) tp_is_empty!2955 (not b!145747) (not bm!16330) (not bm!16331) (not b_next!3077) (not bm!16326) (not bm!16334) (not b!145784) (not bm!16337) (not b!145768) (not d!46291) (not b!145799) (not bm!16314) (not b!145621) (not bm!16329) (not b!145597) (not b_next!3079) (not d!46277) (not d!46309) (not b!145738) (not b!145596) (not d!46289) (not b!145611) (not bm!16262) (not b!145607) (not b!145727) (not b!145629) (not b!145731) (not b!145636) (not d!46293) b_and!9083 (not b!145782) (not b!145806) (not b!145794) (not mapNonEmpty!4944) (not bm!16341) (not b!145779) (not b!145614) (not b!145748) (not b_lambda!6533) (not b!145763) (not bm!16340) (not bm!16335) (not b!145787) (not b!145606) (not bm!16263) (not b!145623) (not b!145622) (not mapNonEmpty!4943) (not b!145781) (not b!145764) (not bm!16333) (not b!145610) (not b!145602) (not d!46303))
(check-sat b_and!9083 b_and!9085 (not b_next!3077) (not b_next!3079))
