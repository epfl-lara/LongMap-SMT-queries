; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13820 () Bool)

(assert start!13820)

(declare-fun b!127493 () Bool)

(declare-fun b_free!2861 () Bool)

(declare-fun b_next!2861 () Bool)

(assert (=> b!127493 (= b_free!2861 (not b_next!2861))))

(declare-fun tp!11000 () Bool)

(declare-fun b_and!7859 () Bool)

(assert (=> b!127493 (= tp!11000 b_and!7859)))

(declare-fun b!127496 () Bool)

(declare-fun b_free!2863 () Bool)

(declare-fun b_next!2863 () Bool)

(assert (=> b!127496 (= b_free!2863 (not b_next!2863))))

(declare-fun tp!10999 () Bool)

(declare-fun b_and!7861 () Bool)

(assert (=> b!127496 (= tp!10999 b_and!7861)))

(declare-fun b!127485 () Bool)

(declare-fun res!61633 () Bool)

(declare-fun e!83242 () Bool)

(assert (=> b!127485 (=> (not res!61633) (not e!83242))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3443 0))(
  ( (V!3444 (val!1468 Int)) )
))
(declare-datatypes ((array!4713 0))(
  ( (array!4714 (arr!2231 (Array (_ BitVec 32) (_ BitVec 64))) (size!2496 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1080 0))(
  ( (ValueCellFull!1080 (v!3139 V!3443)) (EmptyCell!1080) )
))
(declare-datatypes ((array!4715 0))(
  ( (array!4716 (arr!2232 (Array (_ BitVec 32) ValueCell!1080)) (size!2497 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1068 0))(
  ( (LongMapFixedSize!1069 (defaultEntry!2802 Int) (mask!7068 (_ BitVec 32)) (extraKeys!2579 (_ BitVec 32)) (zeroValue!2663 V!3443) (minValue!2663 V!3443) (_size!583 (_ BitVec 32)) (_keys!4539 array!4713) (_values!2785 array!4715) (_vacant!583 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!862 0))(
  ( (Cell!863 (v!3140 LongMapFixedSize!1068)) )
))
(declare-datatypes ((LongMap!862 0))(
  ( (LongMap!863 (underlying!442 Cell!862)) )
))
(declare-fun thiss!992 () LongMap!862)

(assert (=> b!127485 (= res!61633 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2496 (_keys!4539 (v!3140 (underlying!442 thiss!992)))))))))

(declare-fun b!127486 () Bool)

(declare-fun e!83247 () Bool)

(assert (=> b!127486 (= e!83247 (and (= (size!2497 (_values!2785 (v!3140 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7068 (v!3140 (underlying!442 thiss!992))))) (= (size!2496 (_keys!4539 (v!3140 (underlying!442 thiss!992)))) (size!2497 (_values!2785 (v!3140 (underlying!442 thiss!992))))) (bvslt (mask!7068 (v!3140 (underlying!442 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!4525 () Bool)

(declare-fun mapRes!4526 () Bool)

(assert (=> mapIsEmpty!4525 mapRes!4526))

(declare-fun b!127487 () Bool)

(declare-fun e!83253 () Bool)

(declare-fun tp_is_empty!2847 () Bool)

(assert (=> b!127487 (= e!83253 tp_is_empty!2847)))

(declare-fun b!127488 () Bool)

(declare-fun e!83239 () Bool)

(assert (=> b!127488 (= e!83239 tp_is_empty!2847)))

(declare-fun b!127489 () Bool)

(declare-fun e!83240 () Bool)

(declare-fun e!83246 () Bool)

(assert (=> b!127489 (= e!83240 e!83246)))

(declare-fun b!127490 () Bool)

(declare-fun res!61636 () Bool)

(assert (=> b!127490 (=> (not res!61636) (not e!83247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!127490 (= res!61636 (validMask!0 (mask!7068 (v!3140 (underlying!442 thiss!992)))))))

(declare-fun b!127491 () Bool)

(declare-fun e!83252 () Bool)

(assert (=> b!127491 (= e!83242 e!83252)))

(declare-fun res!61637 () Bool)

(assert (=> b!127491 (=> (not res!61637) (not e!83252))))

(declare-datatypes ((tuple2!2588 0))(
  ( (tuple2!2589 (_1!1305 (_ BitVec 64)) (_2!1305 V!3443)) )
))
(declare-datatypes ((List!1702 0))(
  ( (Nil!1699) (Cons!1698 (h!2301 tuple2!2588) (t!6069 List!1702)) )
))
(declare-datatypes ((ListLongMap!1687 0))(
  ( (ListLongMap!1688 (toList!859 List!1702)) )
))
(declare-fun lt!65964 () ListLongMap!1687)

(declare-fun lt!65963 () ListLongMap!1687)

(assert (=> b!127491 (= res!61637 (and (= lt!65963 lt!65964) (not (= (select (arr!2231 (_keys!4539 (v!3140 (underlying!442 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2231 (_keys!4539 (v!3140 (underlying!442 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!1068)

(declare-fun map!1391 (LongMapFixedSize!1068) ListLongMap!1687)

(assert (=> b!127491 (= lt!65964 (map!1391 newMap!16))))

(declare-fun getCurrentListMap!538 (array!4713 array!4715 (_ BitVec 32) (_ BitVec 32) V!3443 V!3443 (_ BitVec 32) Int) ListLongMap!1687)

(assert (=> b!127491 (= lt!65963 (getCurrentListMap!538 (_keys!4539 (v!3140 (underlying!442 thiss!992))) (_values!2785 (v!3140 (underlying!442 thiss!992))) (mask!7068 (v!3140 (underlying!442 thiss!992))) (extraKeys!2579 (v!3140 (underlying!442 thiss!992))) (zeroValue!2663 (v!3140 (underlying!442 thiss!992))) (minValue!2663 (v!3140 (underlying!442 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2802 (v!3140 (underlying!442 thiss!992)))))))

(declare-fun b!127492 () Bool)

(declare-fun res!61631 () Bool)

(assert (=> b!127492 (=> (not res!61631) (not e!83242))))

(assert (=> b!127492 (= res!61631 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7068 newMap!16)) (_size!583 (v!3140 (underlying!442 thiss!992)))))))

(declare-fun res!61634 () Bool)

(assert (=> start!13820 (=> (not res!61634) (not e!83242))))

(declare-fun valid!509 (LongMap!862) Bool)

(assert (=> start!13820 (= res!61634 (valid!509 thiss!992))))

(assert (=> start!13820 e!83242))

(assert (=> start!13820 e!83240))

(assert (=> start!13820 true))

(declare-fun e!83249 () Bool)

(assert (=> start!13820 e!83249))

(declare-fun e!83245 () Bool)

(declare-fun e!83248 () Bool)

(declare-fun array_inv!1403 (array!4713) Bool)

(declare-fun array_inv!1404 (array!4715) Bool)

(assert (=> b!127493 (= e!83245 (and tp!11000 tp_is_empty!2847 (array_inv!1403 (_keys!4539 (v!3140 (underlying!442 thiss!992)))) (array_inv!1404 (_values!2785 (v!3140 (underlying!442 thiss!992)))) e!83248))))

(declare-fun b!127494 () Bool)

(declare-fun res!61632 () Bool)

(assert (=> b!127494 (=> (not res!61632) (not e!83242))))

(declare-fun valid!510 (LongMapFixedSize!1068) Bool)

(assert (=> b!127494 (= res!61632 (valid!510 newMap!16))))

(declare-fun b!127495 () Bool)

(declare-fun e!83244 () Bool)

(assert (=> b!127495 (= e!83244 tp_is_empty!2847)))

(declare-fun e!83251 () Bool)

(assert (=> b!127496 (= e!83249 (and tp!10999 tp_is_empty!2847 (array_inv!1403 (_keys!4539 newMap!16)) (array_inv!1404 (_values!2785 newMap!16)) e!83251))))

(declare-fun mapNonEmpty!4525 () Bool)

(declare-fun tp!10997 () Bool)

(assert (=> mapNonEmpty!4525 (= mapRes!4526 (and tp!10997 e!83244))))

(declare-fun mapValue!4526 () ValueCell!1080)

(declare-fun mapKey!4525 () (_ BitVec 32))

(declare-fun mapRest!4525 () (Array (_ BitVec 32) ValueCell!1080))

(assert (=> mapNonEmpty!4525 (= (arr!2232 (_values!2785 newMap!16)) (store mapRest!4525 mapKey!4525 mapValue!4526))))

(declare-fun mapIsEmpty!4526 () Bool)

(declare-fun mapRes!4525 () Bool)

(assert (=> mapIsEmpty!4526 mapRes!4525))

(declare-fun mapNonEmpty!4526 () Bool)

(declare-fun tp!10998 () Bool)

(assert (=> mapNonEmpty!4526 (= mapRes!4525 (and tp!10998 e!83239))))

(declare-fun mapKey!4526 () (_ BitVec 32))

(declare-fun mapRest!4526 () (Array (_ BitVec 32) ValueCell!1080))

(declare-fun mapValue!4525 () ValueCell!1080)

(assert (=> mapNonEmpty!4526 (= (arr!2232 (_values!2785 (v!3140 (underlying!442 thiss!992)))) (store mapRest!4526 mapKey!4526 mapValue!4525))))

(declare-fun b!127497 () Bool)

(assert (=> b!127497 (= e!83252 e!83247)))

(declare-fun res!61635 () Bool)

(assert (=> b!127497 (=> (not res!61635) (not e!83247))))

(declare-fun contains!882 (ListLongMap!1687 (_ BitVec 64)) Bool)

(assert (=> b!127497 (= res!61635 (contains!882 lt!65964 (select (arr!2231 (_keys!4539 (v!3140 (underlying!442 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2590 0))(
  ( (tuple2!2591 (_1!1306 Bool) (_2!1306 LongMapFixedSize!1068)) )
))
(declare-fun lt!65965 () tuple2!2590)

(declare-fun update!185 (LongMapFixedSize!1068 (_ BitVec 64) V!3443) tuple2!2590)

(declare-fun get!1451 (ValueCell!1080 V!3443) V!3443)

(declare-fun dynLambda!416 (Int (_ BitVec 64)) V!3443)

(assert (=> b!127497 (= lt!65965 (update!185 newMap!16 (select (arr!2231 (_keys!4539 (v!3140 (underlying!442 thiss!992)))) from!355) (get!1451 (select (arr!2232 (_values!2785 (v!3140 (underlying!442 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2802 (v!3140 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!127498 () Bool)

(assert (=> b!127498 (= e!83246 e!83245)))

(declare-fun b!127499 () Bool)

(assert (=> b!127499 (= e!83248 (and e!83253 mapRes!4525))))

(declare-fun condMapEmpty!4525 () Bool)

(declare-fun mapDefault!4525 () ValueCell!1080)

(assert (=> b!127499 (= condMapEmpty!4525 (= (arr!2232 (_values!2785 (v!3140 (underlying!442 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1080)) mapDefault!4525)))))

(declare-fun b!127500 () Bool)

(declare-fun e!83250 () Bool)

(assert (=> b!127500 (= e!83251 (and e!83250 mapRes!4526))))

(declare-fun condMapEmpty!4526 () Bool)

(declare-fun mapDefault!4526 () ValueCell!1080)

(assert (=> b!127500 (= condMapEmpty!4526 (= (arr!2232 (_values!2785 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1080)) mapDefault!4526)))))

(declare-fun b!127501 () Bool)

(assert (=> b!127501 (= e!83250 tp_is_empty!2847)))

(assert (= (and start!13820 res!61634) b!127485))

(assert (= (and b!127485 res!61633) b!127494))

(assert (= (and b!127494 res!61632) b!127492))

(assert (= (and b!127492 res!61631) b!127491))

(assert (= (and b!127491 res!61637) b!127497))

(assert (= (and b!127497 res!61635) b!127490))

(assert (= (and b!127490 res!61636) b!127486))

(assert (= (and b!127499 condMapEmpty!4525) mapIsEmpty!4526))

(assert (= (and b!127499 (not condMapEmpty!4525)) mapNonEmpty!4526))

(get-info :version)

(assert (= (and mapNonEmpty!4526 ((_ is ValueCellFull!1080) mapValue!4525)) b!127488))

(assert (= (and b!127499 ((_ is ValueCellFull!1080) mapDefault!4525)) b!127487))

(assert (= b!127493 b!127499))

(assert (= b!127498 b!127493))

(assert (= b!127489 b!127498))

(assert (= start!13820 b!127489))

(assert (= (and b!127500 condMapEmpty!4526) mapIsEmpty!4525))

(assert (= (and b!127500 (not condMapEmpty!4526)) mapNonEmpty!4525))

(assert (= (and mapNonEmpty!4525 ((_ is ValueCellFull!1080) mapValue!4526)) b!127495))

(assert (= (and b!127500 ((_ is ValueCellFull!1080) mapDefault!4526)) b!127501))

(assert (= b!127496 b!127500))

(assert (= start!13820 b!127496))

(declare-fun b_lambda!5639 () Bool)

(assert (=> (not b_lambda!5639) (not b!127497)))

(declare-fun t!6066 () Bool)

(declare-fun tb!2329 () Bool)

(assert (=> (and b!127493 (= (defaultEntry!2802 (v!3140 (underlying!442 thiss!992))) (defaultEntry!2802 (v!3140 (underlying!442 thiss!992)))) t!6066) tb!2329))

(declare-fun result!3861 () Bool)

(assert (=> tb!2329 (= result!3861 tp_is_empty!2847)))

(assert (=> b!127497 t!6066))

(declare-fun b_and!7863 () Bool)

(assert (= b_and!7859 (and (=> t!6066 result!3861) b_and!7863)))

(declare-fun tb!2331 () Bool)

(declare-fun t!6068 () Bool)

(assert (=> (and b!127496 (= (defaultEntry!2802 newMap!16) (defaultEntry!2802 (v!3140 (underlying!442 thiss!992)))) t!6068) tb!2331))

(declare-fun result!3865 () Bool)

(assert (= result!3865 result!3861))

(assert (=> b!127497 t!6068))

(declare-fun b_and!7865 () Bool)

(assert (= b_and!7861 (and (=> t!6068 result!3865) b_and!7865)))

(declare-fun m!149237 () Bool)

(assert (=> b!127494 m!149237))

(declare-fun m!149239 () Bool)

(assert (=> mapNonEmpty!4525 m!149239))

(declare-fun m!149241 () Bool)

(assert (=> start!13820 m!149241))

(declare-fun m!149243 () Bool)

(assert (=> b!127496 m!149243))

(declare-fun m!149245 () Bool)

(assert (=> b!127496 m!149245))

(declare-fun m!149247 () Bool)

(assert (=> b!127491 m!149247))

(declare-fun m!149249 () Bool)

(assert (=> b!127491 m!149249))

(declare-fun m!149251 () Bool)

(assert (=> b!127491 m!149251))

(declare-fun m!149253 () Bool)

(assert (=> b!127490 m!149253))

(declare-fun m!149255 () Bool)

(assert (=> b!127493 m!149255))

(declare-fun m!149257 () Bool)

(assert (=> b!127493 m!149257))

(assert (=> b!127497 m!149247))

(declare-fun m!149259 () Bool)

(assert (=> b!127497 m!149259))

(declare-fun m!149261 () Bool)

(assert (=> b!127497 m!149261))

(declare-fun m!149263 () Bool)

(assert (=> b!127497 m!149263))

(declare-fun m!149265 () Bool)

(assert (=> b!127497 m!149265))

(assert (=> b!127497 m!149247))

(assert (=> b!127497 m!149263))

(assert (=> b!127497 m!149247))

(assert (=> b!127497 m!149265))

(declare-fun m!149267 () Bool)

(assert (=> b!127497 m!149267))

(assert (=> b!127497 m!149261))

(declare-fun m!149269 () Bool)

(assert (=> mapNonEmpty!4526 m!149269))

(check-sat (not mapNonEmpty!4526) (not b!127496) (not start!13820) b_and!7865 (not b!127497) (not mapNonEmpty!4525) b_and!7863 tp_is_empty!2847 (not b!127493) (not b!127494) (not b!127491) (not b_lambda!5639) (not b_next!2861) (not b_next!2863) (not b!127490))
(check-sat b_and!7863 b_and!7865 (not b_next!2861) (not b_next!2863))
