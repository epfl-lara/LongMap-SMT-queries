; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14672 () Bool)

(assert start!14672)

(declare-fun b!138742 () Bool)

(declare-fun b_free!3005 () Bool)

(declare-fun b_next!3005 () Bool)

(assert (=> b!138742 (= b_free!3005 (not b_next!3005))))

(declare-fun tp!11482 () Bool)

(declare-fun b_and!8643 () Bool)

(assert (=> b!138742 (= tp!11482 b_and!8643)))

(declare-fun b!138748 () Bool)

(declare-fun b_free!3007 () Bool)

(declare-fun b_next!3007 () Bool)

(assert (=> b!138748 (= b_free!3007 (not b_next!3007))))

(declare-fun tp!11484 () Bool)

(declare-fun b_and!8645 () Bool)

(assert (=> b!138748 (= tp!11484 b_and!8645)))

(declare-fun b!138735 () Bool)

(declare-fun e!90459 () Bool)

(declare-fun e!90449 () Bool)

(assert (=> b!138735 (= e!90459 e!90449)))

(declare-fun mapIsEmpty!4793 () Bool)

(declare-fun mapRes!4794 () Bool)

(assert (=> mapIsEmpty!4793 mapRes!4794))

(declare-fun b!138736 () Bool)

(declare-fun e!90458 () Bool)

(declare-datatypes ((V!3539 0))(
  ( (V!3540 (val!1504 Int)) )
))
(declare-datatypes ((array!4871 0))(
  ( (array!4872 (arr!2303 (Array (_ BitVec 32) (_ BitVec 64))) (size!2575 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1116 0))(
  ( (ValueCellFull!1116 (v!3266 V!3539)) (EmptyCell!1116) )
))
(declare-datatypes ((array!4873 0))(
  ( (array!4874 (arr!2304 (Array (_ BitVec 32) ValueCell!1116)) (size!2576 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1140 0))(
  ( (LongMapFixedSize!1141 (defaultEntry!2932 Int) (mask!7268 (_ BitVec 32)) (extraKeys!2687 (_ BitVec 32)) (zeroValue!2782 V!3539) (minValue!2782 V!3539) (_size!619 (_ BitVec 32)) (_keys!4691 array!4871) (_values!2915 array!4873) (_vacant!619 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!928 0))(
  ( (Cell!929 (v!3267 LongMapFixedSize!1140)) )
))
(declare-datatypes ((LongMap!928 0))(
  ( (LongMap!929 (underlying!475 Cell!928)) )
))
(declare-fun thiss!992 () LongMap!928)

(assert (=> b!138736 (= e!90458 (not (bvslt (size!2575 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) #b01111111111111111111111111111111)))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((List!1739 0))(
  ( (Nil!1736) (Cons!1735 (h!2342 (_ BitVec 64)) (t!6299 List!1739)) )
))
(declare-fun arrayNoDuplicates!0 (array!4871 (_ BitVec 32) List!1739) Bool)

(assert (=> b!138736 (arrayNoDuplicates!0 (_keys!4691 (v!3267 (underlying!475 thiss!992))) from!355 Nil!1736)))

(declare-datatypes ((Unit!4363 0))(
  ( (Unit!4364) )
))
(declare-fun lt!72571 () Unit!4363)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4871 (_ BitVec 32) (_ BitVec 32)) Unit!4363)

(assert (=> b!138736 (= lt!72571 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4691 (v!3267 (underlying!475 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138736 (arrayContainsKey!0 (_keys!4691 (v!3267 (underlying!475 thiss!992))) (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!72568 () Unit!4363)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!136 (array!4871 array!4873 (_ BitVec 32) (_ BitVec 32) V!3539 V!3539 (_ BitVec 64) (_ BitVec 32) Int) Unit!4363)

(assert (=> b!138736 (= lt!72568 (lemmaListMapContainsThenArrayContainsFrom!136 (_keys!4691 (v!3267 (underlying!475 thiss!992))) (_values!2915 (v!3267 (underlying!475 thiss!992))) (mask!7268 (v!3267 (underlying!475 thiss!992))) (extraKeys!2687 (v!3267 (underlying!475 thiss!992))) (zeroValue!2782 (v!3267 (underlying!475 thiss!992))) (minValue!2782 (v!3267 (underlying!475 thiss!992))) (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2932 (v!3267 (underlying!475 thiss!992)))))))

(declare-fun b!138737 () Bool)

(declare-fun e!90462 () Bool)

(declare-fun e!90450 () Bool)

(assert (=> b!138737 (= e!90462 e!90450)))

(declare-fun res!66429 () Bool)

(assert (=> b!138737 (=> (not res!66429) (not e!90450))))

(declare-datatypes ((tuple2!2686 0))(
  ( (tuple2!2687 (_1!1354 (_ BitVec 64)) (_2!1354 V!3539)) )
))
(declare-datatypes ((List!1740 0))(
  ( (Nil!1737) (Cons!1736 (h!2343 tuple2!2686) (t!6300 List!1740)) )
))
(declare-datatypes ((ListLongMap!1739 0))(
  ( (ListLongMap!1740 (toList!885 List!1740)) )
))
(declare-fun lt!72569 () ListLongMap!1739)

(declare-fun lt!72570 () ListLongMap!1739)

(assert (=> b!138737 (= res!66429 (and (= lt!72569 lt!72570) (not (= (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!1140)

(declare-fun map!1436 (LongMapFixedSize!1140) ListLongMap!1739)

(assert (=> b!138737 (= lt!72570 (map!1436 newMap!16))))

(declare-fun getCurrentListMap!559 (array!4871 array!4873 (_ BitVec 32) (_ BitVec 32) V!3539 V!3539 (_ BitVec 32) Int) ListLongMap!1739)

(assert (=> b!138737 (= lt!72569 (getCurrentListMap!559 (_keys!4691 (v!3267 (underlying!475 thiss!992))) (_values!2915 (v!3267 (underlying!475 thiss!992))) (mask!7268 (v!3267 (underlying!475 thiss!992))) (extraKeys!2687 (v!3267 (underlying!475 thiss!992))) (zeroValue!2782 (v!3267 (underlying!475 thiss!992))) (minValue!2782 (v!3267 (underlying!475 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2932 (v!3267 (underlying!475 thiss!992)))))))

(declare-fun mapNonEmpty!4793 () Bool)

(declare-fun mapRes!4793 () Bool)

(declare-fun tp!11483 () Bool)

(declare-fun e!90455 () Bool)

(assert (=> mapNonEmpty!4793 (= mapRes!4793 (and tp!11483 e!90455))))

(declare-fun mapValue!4793 () ValueCell!1116)

(declare-fun mapRest!4794 () (Array (_ BitVec 32) ValueCell!1116))

(declare-fun mapKey!4794 () (_ BitVec 32))

(assert (=> mapNonEmpty!4793 (= (arr!2304 (_values!2915 newMap!16)) (store mapRest!4794 mapKey!4794 mapValue!4793))))

(declare-fun b!138738 () Bool)

(declare-fun tp_is_empty!2919 () Bool)

(assert (=> b!138738 (= e!90455 tp_is_empty!2919)))

(declare-fun b!138739 () Bool)

(declare-fun e!90448 () Bool)

(declare-fun e!90457 () Bool)

(assert (=> b!138739 (= e!90448 (and e!90457 mapRes!4793))))

(declare-fun condMapEmpty!4793 () Bool)

(declare-fun mapDefault!4794 () ValueCell!1116)

(assert (=> b!138739 (= condMapEmpty!4793 (= (arr!2304 (_values!2915 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1116)) mapDefault!4794)))))

(declare-fun b!138740 () Bool)

(declare-fun e!90451 () Bool)

(declare-fun e!90453 () Bool)

(assert (=> b!138740 (= e!90451 (and e!90453 mapRes!4794))))

(declare-fun condMapEmpty!4794 () Bool)

(declare-fun mapDefault!4793 () ValueCell!1116)

(assert (=> b!138740 (= condMapEmpty!4794 (= (arr!2304 (_values!2915 (v!3267 (underlying!475 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1116)) mapDefault!4793)))))

(declare-fun b!138741 () Bool)

(declare-fun e!90454 () Bool)

(assert (=> b!138741 (= e!90454 tp_is_empty!2919)))

(declare-fun mapIsEmpty!4794 () Bool)

(assert (=> mapIsEmpty!4794 mapRes!4793))

(declare-fun array_inv!1449 (array!4871) Bool)

(declare-fun array_inv!1450 (array!4873) Bool)

(assert (=> b!138742 (= e!90449 (and tp!11482 tp_is_empty!2919 (array_inv!1449 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) (array_inv!1450 (_values!2915 (v!3267 (underlying!475 thiss!992)))) e!90451))))

(declare-fun b!138743 () Bool)

(declare-fun res!66428 () Bool)

(assert (=> b!138743 (=> (not res!66428) (not e!90462))))

(assert (=> b!138743 (= res!66428 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7268 newMap!16)) (_size!619 (v!3267 (underlying!475 thiss!992)))))))

(declare-fun b!138744 () Bool)

(declare-fun res!66431 () Bool)

(assert (=> b!138744 (=> (not res!66431) (not e!90462))))

(assert (=> b!138744 (= res!66431 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2575 (_keys!4691 (v!3267 (underlying!475 thiss!992)))))))))

(declare-fun b!138745 () Bool)

(assert (=> b!138745 (= e!90450 e!90458)))

(declare-fun res!66426 () Bool)

(assert (=> b!138745 (=> (not res!66426) (not e!90458))))

(declare-fun contains!919 (ListLongMap!1739 (_ BitVec 64)) Bool)

(assert (=> b!138745 (= res!66426 (contains!919 lt!72570 (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2688 0))(
  ( (tuple2!2689 (_1!1355 Bool) (_2!1355 LongMapFixedSize!1140)) )
))
(declare-fun lt!72572 () tuple2!2688)

(declare-fun update!208 (LongMapFixedSize!1140 (_ BitVec 64) V!3539) tuple2!2688)

(declare-fun get!1519 (ValueCell!1116 V!3539) V!3539)

(declare-fun dynLambda!439 (Int (_ BitVec 64)) V!3539)

(assert (=> b!138745 (= lt!72572 (update!208 newMap!16 (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) (get!1519 (select (arr!2304 (_values!2915 (v!3267 (underlying!475 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2932 (v!3267 (underlying!475 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!138746 () Bool)

(declare-fun res!66430 () Bool)

(assert (=> b!138746 (=> (not res!66430) (not e!90462))))

(declare-fun valid!550 (LongMapFixedSize!1140) Bool)

(assert (=> b!138746 (= res!66430 (valid!550 newMap!16))))

(declare-fun b!138747 () Bool)

(assert (=> b!138747 (= e!90453 tp_is_empty!2919)))

(declare-fun mapNonEmpty!4794 () Bool)

(declare-fun tp!11481 () Bool)

(assert (=> mapNonEmpty!4794 (= mapRes!4794 (and tp!11481 e!90454))))

(declare-fun mapValue!4794 () ValueCell!1116)

(declare-fun mapRest!4793 () (Array (_ BitVec 32) ValueCell!1116))

(declare-fun mapKey!4793 () (_ BitVec 32))

(assert (=> mapNonEmpty!4794 (= (arr!2304 (_values!2915 (v!3267 (underlying!475 thiss!992)))) (store mapRest!4793 mapKey!4793 mapValue!4794))))

(declare-fun e!90461 () Bool)

(assert (=> b!138748 (= e!90461 (and tp!11484 tp_is_empty!2919 (array_inv!1449 (_keys!4691 newMap!16)) (array_inv!1450 (_values!2915 newMap!16)) e!90448))))

(declare-fun b!138749 () Bool)

(assert (=> b!138749 (= e!90457 tp_is_empty!2919)))

(declare-fun b!138750 () Bool)

(declare-fun e!90460 () Bool)

(assert (=> b!138750 (= e!90460 e!90459)))

(declare-fun res!66427 () Bool)

(assert (=> start!14672 (=> (not res!66427) (not e!90462))))

(declare-fun valid!551 (LongMap!928) Bool)

(assert (=> start!14672 (= res!66427 (valid!551 thiss!992))))

(assert (=> start!14672 e!90462))

(assert (=> start!14672 e!90460))

(assert (=> start!14672 true))

(assert (=> start!14672 e!90461))

(assert (= (and start!14672 res!66427) b!138744))

(assert (= (and b!138744 res!66431) b!138746))

(assert (= (and b!138746 res!66430) b!138743))

(assert (= (and b!138743 res!66428) b!138737))

(assert (= (and b!138737 res!66429) b!138745))

(assert (= (and b!138745 res!66426) b!138736))

(assert (= (and b!138740 condMapEmpty!4794) mapIsEmpty!4793))

(assert (= (and b!138740 (not condMapEmpty!4794)) mapNonEmpty!4794))

(get-info :version)

(assert (= (and mapNonEmpty!4794 ((_ is ValueCellFull!1116) mapValue!4794)) b!138741))

(assert (= (and b!138740 ((_ is ValueCellFull!1116) mapDefault!4793)) b!138747))

(assert (= b!138742 b!138740))

(assert (= b!138735 b!138742))

(assert (= b!138750 b!138735))

(assert (= start!14672 b!138750))

(assert (= (and b!138739 condMapEmpty!4793) mapIsEmpty!4794))

(assert (= (and b!138739 (not condMapEmpty!4793)) mapNonEmpty!4793))

(assert (= (and mapNonEmpty!4793 ((_ is ValueCellFull!1116) mapValue!4793)) b!138738))

(assert (= (and b!138739 ((_ is ValueCellFull!1116) mapDefault!4794)) b!138749))

(assert (= b!138748 b!138739))

(assert (= start!14672 b!138748))

(declare-fun b_lambda!6209 () Bool)

(assert (=> (not b_lambda!6209) (not b!138745)))

(declare-fun t!6296 () Bool)

(declare-fun tb!2521 () Bool)

(assert (=> (and b!138742 (= (defaultEntry!2932 (v!3267 (underlying!475 thiss!992))) (defaultEntry!2932 (v!3267 (underlying!475 thiss!992)))) t!6296) tb!2521))

(declare-fun result!4139 () Bool)

(assert (=> tb!2521 (= result!4139 tp_is_empty!2919)))

(assert (=> b!138745 t!6296))

(declare-fun b_and!8647 () Bool)

(assert (= b_and!8643 (and (=> t!6296 result!4139) b_and!8647)))

(declare-fun t!6298 () Bool)

(declare-fun tb!2523 () Bool)

(assert (=> (and b!138748 (= (defaultEntry!2932 newMap!16) (defaultEntry!2932 (v!3267 (underlying!475 thiss!992)))) t!6298) tb!2523))

(declare-fun result!4143 () Bool)

(assert (= result!4143 result!4139))

(assert (=> b!138745 t!6298))

(declare-fun b_and!8649 () Bool)

(assert (= b_and!8645 (and (=> t!6298 result!4143) b_and!8649)))

(declare-fun m!165617 () Bool)

(assert (=> b!138746 m!165617))

(declare-fun m!165619 () Bool)

(assert (=> b!138745 m!165619))

(declare-fun m!165621 () Bool)

(assert (=> b!138745 m!165621))

(declare-fun m!165623 () Bool)

(assert (=> b!138745 m!165623))

(assert (=> b!138745 m!165621))

(declare-fun m!165625 () Bool)

(assert (=> b!138745 m!165625))

(assert (=> b!138745 m!165623))

(declare-fun m!165627 () Bool)

(assert (=> b!138745 m!165627))

(assert (=> b!138745 m!165619))

(assert (=> b!138745 m!165625))

(assert (=> b!138745 m!165625))

(declare-fun m!165629 () Bool)

(assert (=> b!138745 m!165629))

(assert (=> b!138737 m!165625))

(declare-fun m!165631 () Bool)

(assert (=> b!138737 m!165631))

(declare-fun m!165633 () Bool)

(assert (=> b!138737 m!165633))

(declare-fun m!165635 () Bool)

(assert (=> b!138736 m!165635))

(declare-fun m!165637 () Bool)

(assert (=> b!138736 m!165637))

(assert (=> b!138736 m!165625))

(declare-fun m!165639 () Bool)

(assert (=> b!138736 m!165639))

(assert (=> b!138736 m!165625))

(assert (=> b!138736 m!165625))

(declare-fun m!165641 () Bool)

(assert (=> b!138736 m!165641))

(declare-fun m!165643 () Bool)

(assert (=> start!14672 m!165643))

(declare-fun m!165645 () Bool)

(assert (=> b!138748 m!165645))

(declare-fun m!165647 () Bool)

(assert (=> b!138748 m!165647))

(declare-fun m!165649 () Bool)

(assert (=> mapNonEmpty!4794 m!165649))

(declare-fun m!165651 () Bool)

(assert (=> b!138742 m!165651))

(declare-fun m!165653 () Bool)

(assert (=> b!138742 m!165653))

(declare-fun m!165655 () Bool)

(assert (=> mapNonEmpty!4793 m!165655))

(check-sat (not b!138745) (not b_next!3007) (not b!138748) (not b_lambda!6209) b_and!8647 tp_is_empty!2919 (not mapNonEmpty!4794) (not b!138737) (not start!14672) b_and!8649 (not b!138746) (not b!138736) (not mapNonEmpty!4793) (not b_next!3005) (not b!138742))
(check-sat b_and!8647 b_and!8649 (not b_next!3005) (not b_next!3007))
(get-model)

(declare-fun b_lambda!6213 () Bool)

(assert (= b_lambda!6209 (or (and b!138742 b_free!3005) (and b!138748 b_free!3007 (= (defaultEntry!2932 newMap!16) (defaultEntry!2932 (v!3267 (underlying!475 thiss!992))))) b_lambda!6213)))

(check-sat (not b!138745) (not b_lambda!6213) (not b_next!3007) (not b!138748) b_and!8647 tp_is_empty!2919 (not mapNonEmpty!4794) (not b!138737) (not start!14672) b_and!8649 (not b!138746) (not b!138736) (not mapNonEmpty!4793) (not b_next!3005) (not b!138742))
(check-sat b_and!8647 b_and!8649 (not b_next!3005) (not b_next!3007))
(get-model)

(declare-fun d!43241 () Bool)

(assert (=> d!43241 (= (array_inv!1449 (_keys!4691 newMap!16)) (bvsge (size!2575 (_keys!4691 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!138748 d!43241))

(declare-fun d!43243 () Bool)

(assert (=> d!43243 (= (array_inv!1450 (_values!2915 newMap!16)) (bvsge (size!2576 (_values!2915 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!138748 d!43243))

(declare-fun b!138813 () Bool)

(declare-fun e!90518 () Bool)

(declare-fun e!90519 () Bool)

(assert (=> b!138813 (= e!90518 e!90519)))

(declare-fun res!66457 () Bool)

(assert (=> b!138813 (=> (not res!66457) (not e!90519))))

(declare-fun e!90516 () Bool)

(assert (=> b!138813 (= res!66457 (not e!90516))))

(declare-fun res!66456 () Bool)

(assert (=> b!138813 (=> (not res!66456) (not e!90516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!138813 (= res!66456 (validKeyInArray!0 (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355)))))

(declare-fun d!43245 () Bool)

(declare-fun res!66458 () Bool)

(assert (=> d!43245 (=> res!66458 e!90518)))

(assert (=> d!43245 (= res!66458 (bvsge from!355 (size!2575 (_keys!4691 (v!3267 (underlying!475 thiss!992))))))))

(assert (=> d!43245 (= (arrayNoDuplicates!0 (_keys!4691 (v!3267 (underlying!475 thiss!992))) from!355 Nil!1736) e!90518)))

(declare-fun b!138814 () Bool)

(declare-fun e!90517 () Bool)

(declare-fun call!15293 () Bool)

(assert (=> b!138814 (= e!90517 call!15293)))

(declare-fun b!138815 () Bool)

(assert (=> b!138815 (= e!90517 call!15293)))

(declare-fun b!138816 () Bool)

(assert (=> b!138816 (= e!90519 e!90517)))

(declare-fun c!25940 () Bool)

(assert (=> b!138816 (= c!25940 (validKeyInArray!0 (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355)))))

(declare-fun b!138817 () Bool)

(declare-fun contains!920 (List!1739 (_ BitVec 64)) Bool)

(assert (=> b!138817 (= e!90516 (contains!920 Nil!1736 (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355)))))

(declare-fun bm!15290 () Bool)

(assert (=> bm!15290 (= call!15293 (arrayNoDuplicates!0 (_keys!4691 (v!3267 (underlying!475 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!25940 (Cons!1735 (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) Nil!1736) Nil!1736)))))

(assert (= (and d!43245 (not res!66458)) b!138813))

(assert (= (and b!138813 res!66456) b!138817))

(assert (= (and b!138813 res!66457) b!138816))

(assert (= (and b!138816 c!25940) b!138814))

(assert (= (and b!138816 (not c!25940)) b!138815))

(assert (= (or b!138814 b!138815) bm!15290))

(assert (=> b!138813 m!165625))

(assert (=> b!138813 m!165625))

(declare-fun m!165697 () Bool)

(assert (=> b!138813 m!165697))

(assert (=> b!138816 m!165625))

(assert (=> b!138816 m!165625))

(assert (=> b!138816 m!165697))

(assert (=> b!138817 m!165625))

(assert (=> b!138817 m!165625))

(declare-fun m!165699 () Bool)

(assert (=> b!138817 m!165699))

(assert (=> bm!15290 m!165625))

(declare-fun m!165701 () Bool)

(assert (=> bm!15290 m!165701))

(assert (=> b!138736 d!43245))

(declare-fun d!43247 () Bool)

(assert (=> d!43247 (arrayNoDuplicates!0 (_keys!4691 (v!3267 (underlying!475 thiss!992))) from!355 Nil!1736)))

(declare-fun lt!72590 () Unit!4363)

(declare-fun choose!39 (array!4871 (_ BitVec 32) (_ BitVec 32)) Unit!4363)

(assert (=> d!43247 (= lt!72590 (choose!39 (_keys!4691 (v!3267 (underlying!475 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!43247 (bvslt (size!2575 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!43247 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4691 (v!3267 (underlying!475 thiss!992))) #b00000000000000000000000000000000 from!355) lt!72590)))

(declare-fun bs!5805 () Bool)

(assert (= bs!5805 d!43247))

(assert (=> bs!5805 m!165637))

(declare-fun m!165703 () Bool)

(assert (=> bs!5805 m!165703))

(assert (=> b!138736 d!43247))

(declare-fun d!43249 () Bool)

(declare-fun res!66463 () Bool)

(declare-fun e!90524 () Bool)

(assert (=> d!43249 (=> res!66463 e!90524)))

(assert (=> d!43249 (= res!66463 (= (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355)))))

(assert (=> d!43249 (= (arrayContainsKey!0 (_keys!4691 (v!3267 (underlying!475 thiss!992))) (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!90524)))

(declare-fun b!138822 () Bool)

(declare-fun e!90525 () Bool)

(assert (=> b!138822 (= e!90524 e!90525)))

(declare-fun res!66464 () Bool)

(assert (=> b!138822 (=> (not res!66464) (not e!90525))))

(assert (=> b!138822 (= res!66464 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2575 (_keys!4691 (v!3267 (underlying!475 thiss!992))))))))

(declare-fun b!138823 () Bool)

(assert (=> b!138823 (= e!90525 (arrayContainsKey!0 (_keys!4691 (v!3267 (underlying!475 thiss!992))) (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!43249 (not res!66463)) b!138822))

(assert (= (and b!138822 res!66464) b!138823))

(declare-fun m!165705 () Bool)

(assert (=> d!43249 m!165705))

(assert (=> b!138823 m!165625))

(declare-fun m!165707 () Bool)

(assert (=> b!138823 m!165707))

(assert (=> b!138736 d!43249))

(declare-fun d!43251 () Bool)

(declare-fun e!90528 () Bool)

(assert (=> d!43251 e!90528))

(declare-fun c!25943 () Bool)

(assert (=> d!43251 (= c!25943 (and (not (= (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!72593 () Unit!4363)

(declare-fun choose!854 (array!4871 array!4873 (_ BitVec 32) (_ BitVec 32) V!3539 V!3539 (_ BitVec 64) (_ BitVec 32) Int) Unit!4363)

(assert (=> d!43251 (= lt!72593 (choose!854 (_keys!4691 (v!3267 (underlying!475 thiss!992))) (_values!2915 (v!3267 (underlying!475 thiss!992))) (mask!7268 (v!3267 (underlying!475 thiss!992))) (extraKeys!2687 (v!3267 (underlying!475 thiss!992))) (zeroValue!2782 (v!3267 (underlying!475 thiss!992))) (minValue!2782 (v!3267 (underlying!475 thiss!992))) (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2932 (v!3267 (underlying!475 thiss!992)))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!43251 (validMask!0 (mask!7268 (v!3267 (underlying!475 thiss!992))))))

(assert (=> d!43251 (= (lemmaListMapContainsThenArrayContainsFrom!136 (_keys!4691 (v!3267 (underlying!475 thiss!992))) (_values!2915 (v!3267 (underlying!475 thiss!992))) (mask!7268 (v!3267 (underlying!475 thiss!992))) (extraKeys!2687 (v!3267 (underlying!475 thiss!992))) (zeroValue!2782 (v!3267 (underlying!475 thiss!992))) (minValue!2782 (v!3267 (underlying!475 thiss!992))) (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2932 (v!3267 (underlying!475 thiss!992)))) lt!72593)))

(declare-fun b!138828 () Bool)

(assert (=> b!138828 (= e!90528 (arrayContainsKey!0 (_keys!4691 (v!3267 (underlying!475 thiss!992))) (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!138829 () Bool)

(assert (=> b!138829 (= e!90528 (ite (= (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2687 (v!3267 (underlying!475 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2687 (v!3267 (underlying!475 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!43251 c!25943) b!138828))

(assert (= (and d!43251 (not c!25943)) b!138829))

(assert (=> d!43251 m!165625))

(declare-fun m!165709 () Bool)

(assert (=> d!43251 m!165709))

(declare-fun m!165711 () Bool)

(assert (=> d!43251 m!165711))

(assert (=> b!138828 m!165625))

(assert (=> b!138828 m!165641))

(assert (=> b!138736 d!43251))

(declare-fun d!43253 () Bool)

(assert (=> d!43253 (= (valid!551 thiss!992) (valid!550 (v!3267 (underlying!475 thiss!992))))))

(declare-fun bs!5806 () Bool)

(assert (= bs!5806 d!43253))

(declare-fun m!165713 () Bool)

(assert (=> bs!5806 m!165713))

(assert (=> start!14672 d!43253))

(declare-fun d!43255 () Bool)

(declare-fun e!90534 () Bool)

(assert (=> d!43255 e!90534))

(declare-fun res!66467 () Bool)

(assert (=> d!43255 (=> res!66467 e!90534)))

(declare-fun lt!72603 () Bool)

(assert (=> d!43255 (= res!66467 (not lt!72603))))

(declare-fun lt!72604 () Bool)

(assert (=> d!43255 (= lt!72603 lt!72604)))

(declare-fun lt!72602 () Unit!4363)

(declare-fun e!90533 () Unit!4363)

(assert (=> d!43255 (= lt!72602 e!90533)))

(declare-fun c!25946 () Bool)

(assert (=> d!43255 (= c!25946 lt!72604)))

(declare-fun containsKey!179 (List!1740 (_ BitVec 64)) Bool)

(assert (=> d!43255 (= lt!72604 (containsKey!179 (toList!885 lt!72570) (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355)))))

(assert (=> d!43255 (= (contains!919 lt!72570 (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355)) lt!72603)))

(declare-fun b!138836 () Bool)

(declare-fun lt!72605 () Unit!4363)

(assert (=> b!138836 (= e!90533 lt!72605)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!127 (List!1740 (_ BitVec 64)) Unit!4363)

(assert (=> b!138836 (= lt!72605 (lemmaContainsKeyImpliesGetValueByKeyDefined!127 (toList!885 lt!72570) (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355)))))

(declare-datatypes ((Option!181 0))(
  ( (Some!180 (v!3271 V!3539)) (None!179) )
))
(declare-fun isDefined!128 (Option!181) Bool)

(declare-fun getValueByKey!175 (List!1740 (_ BitVec 64)) Option!181)

(assert (=> b!138836 (isDefined!128 (getValueByKey!175 (toList!885 lt!72570) (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355)))))

(declare-fun b!138837 () Bool)

(declare-fun Unit!4365 () Unit!4363)

(assert (=> b!138837 (= e!90533 Unit!4365)))

(declare-fun b!138838 () Bool)

(assert (=> b!138838 (= e!90534 (isDefined!128 (getValueByKey!175 (toList!885 lt!72570) (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355))))))

(assert (= (and d!43255 c!25946) b!138836))

(assert (= (and d!43255 (not c!25946)) b!138837))

(assert (= (and d!43255 (not res!66467)) b!138838))

(assert (=> d!43255 m!165625))

(declare-fun m!165715 () Bool)

(assert (=> d!43255 m!165715))

(assert (=> b!138836 m!165625))

(declare-fun m!165717 () Bool)

(assert (=> b!138836 m!165717))

(assert (=> b!138836 m!165625))

(declare-fun m!165719 () Bool)

(assert (=> b!138836 m!165719))

(assert (=> b!138836 m!165719))

(declare-fun m!165721 () Bool)

(assert (=> b!138836 m!165721))

(assert (=> b!138838 m!165625))

(assert (=> b!138838 m!165719))

(assert (=> b!138838 m!165719))

(assert (=> b!138838 m!165721))

(assert (=> b!138745 d!43255))

(declare-fun b!138923 () Bool)

(declare-fun e!90596 () tuple2!2688)

(declare-fun e!90582 () tuple2!2688)

(assert (=> b!138923 (= e!90596 e!90582)))

(declare-datatypes ((SeekEntryResult!278 0))(
  ( (MissingZero!278 (index!3275 (_ BitVec 32))) (Found!278 (index!3276 (_ BitVec 32))) (Intermediate!278 (undefined!1090 Bool) (index!3277 (_ BitVec 32)) (x!16081 (_ BitVec 32))) (Undefined!278) (MissingVacant!278 (index!3278 (_ BitVec 32))) )
))
(declare-fun lt!72677 () SeekEntryResult!278)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4871 (_ BitVec 32)) SeekEntryResult!278)

(assert (=> b!138923 (= lt!72677 (seekEntryOrOpen!0 (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) (_keys!4691 newMap!16) (mask!7268 newMap!16)))))

(declare-fun c!25976 () Bool)

(assert (=> b!138923 (= c!25976 ((_ is Undefined!278) lt!72677))))

(declare-fun bm!15339 () Bool)

(declare-fun call!15342 () Bool)

(declare-fun call!15365 () Bool)

(assert (=> bm!15339 (= call!15342 call!15365)))

(declare-fun b!138924 () Bool)

(declare-fun c!25987 () Bool)

(declare-fun lt!72680 () SeekEntryResult!278)

(assert (=> b!138924 (= c!25987 ((_ is MissingVacant!278) lt!72680))))

(declare-fun e!90597 () Bool)

(declare-fun e!90600 () Bool)

(assert (=> b!138924 (= e!90597 e!90600)))

(declare-fun b!138925 () Bool)

(declare-fun e!90594 () Bool)

(declare-fun call!15364 () Bool)

(assert (=> b!138925 (= e!90594 (not call!15364))))

(declare-fun b!138926 () Bool)

(declare-fun e!90588 () Bool)

(assert (=> b!138926 (= e!90588 (not call!15342))))

(declare-fun d!43257 () Bool)

(declare-fun e!90586 () Bool)

(assert (=> d!43257 e!90586))

(declare-fun res!66502 () Bool)

(assert (=> d!43257 (=> (not res!66502) (not e!90586))))

(declare-fun lt!72665 () tuple2!2688)

(assert (=> d!43257 (= res!66502 (valid!550 (_2!1355 lt!72665)))))

(assert (=> d!43257 (= lt!72665 e!90596)))

(declare-fun c!25975 () Bool)

(assert (=> d!43257 (= c!25975 (= (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) (bvneg (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355))))))

(assert (=> d!43257 (valid!550 newMap!16)))

(assert (=> d!43257 (= (update!208 newMap!16 (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) (get!1519 (select (arr!2304 (_values!2915 (v!3267 (underlying!475 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2932 (v!3267 (underlying!475 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!72665)))

(declare-fun b!138927 () Bool)

(declare-fun e!90595 () Unit!4363)

(declare-fun lt!72683 () Unit!4363)

(assert (=> b!138927 (= e!90595 lt!72683)))

(declare-fun call!15357 () Unit!4363)

(assert (=> b!138927 (= lt!72683 call!15357)))

(declare-fun call!15352 () SeekEntryResult!278)

(assert (=> b!138927 (= lt!72680 call!15352)))

(declare-fun c!25977 () Bool)

(assert (=> b!138927 (= c!25977 ((_ is MissingZero!278) lt!72680))))

(assert (=> b!138927 e!90597))

(declare-fun b!138928 () Bool)

(declare-fun e!90593 () ListLongMap!1739)

(assert (=> b!138928 (= e!90593 (getCurrentListMap!559 (_keys!4691 newMap!16) (_values!2915 newMap!16) (mask!7268 newMap!16) (extraKeys!2687 newMap!16) (zeroValue!2782 newMap!16) (minValue!2782 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2932 newMap!16)))))

(declare-fun b!138929 () Bool)

(declare-fun lt!72676 () tuple2!2688)

(declare-fun call!15351 () tuple2!2688)

(assert (=> b!138929 (= lt!72676 call!15351)))

(declare-fun e!90589 () tuple2!2688)

(assert (=> b!138929 (= e!90589 (tuple2!2689 (_1!1355 lt!72676) (_2!1355 lt!72676)))))

(declare-fun b!138930 () Bool)

(declare-fun res!66500 () Bool)

(declare-fun e!90599 () Bool)

(assert (=> b!138930 (=> (not res!66500) (not e!90599))))

(declare-fun call!15362 () Bool)

(assert (=> b!138930 (= res!66500 call!15362)))

(declare-fun e!90592 () Bool)

(assert (=> b!138930 (= e!90592 e!90599)))

(declare-fun lt!72682 () (_ BitVec 32))

(declare-fun c!25985 () Bool)

(declare-fun call!15356 () ListLongMap!1739)

(declare-fun bm!15340 () Bool)

(assert (=> bm!15340 (= call!15356 (getCurrentListMap!559 (_keys!4691 newMap!16) (ite (or c!25975 c!25976) (_values!2915 newMap!16) (array!4874 (store (arr!2304 (_values!2915 newMap!16)) (index!3276 lt!72677) (ValueCellFull!1116 (get!1519 (select (arr!2304 (_values!2915 (v!3267 (underlying!475 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2932 (v!3267 (underlying!475 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2576 (_values!2915 newMap!16)))) (mask!7268 newMap!16) (ite (and c!25975 c!25985) lt!72682 (extraKeys!2687 newMap!16)) (ite (and c!25975 c!25985) (get!1519 (select (arr!2304 (_values!2915 (v!3267 (underlying!475 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2932 (v!3267 (underlying!475 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2782 newMap!16)) (minValue!2782 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2932 newMap!16)))))

(declare-fun b!138931 () Bool)

(assert (=> b!138931 (= e!90599 (not call!15364))))

(declare-fun call!15355 () ListLongMap!1739)

(declare-fun b!138932 () Bool)

(declare-fun call!15358 () ListLongMap!1739)

(assert (=> b!138932 (= e!90593 (ite c!25985 call!15358 call!15355))))

(declare-fun b!138933 () Bool)

(declare-fun e!90587 () tuple2!2688)

(declare-fun lt!72686 () tuple2!2688)

(assert (=> b!138933 (= e!90587 (tuple2!2689 (_1!1355 lt!72686) (_2!1355 lt!72686)))))

(assert (=> b!138933 (= lt!72686 call!15351)))

(declare-fun c!25978 () Bool)

(declare-fun bm!15341 () Bool)

(declare-fun updateHelperNewKey!64 (LongMapFixedSize!1140 (_ BitVec 64) V!3539 (_ BitVec 32)) tuple2!2688)

(assert (=> bm!15341 (= call!15351 (updateHelperNewKey!64 newMap!16 (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) (get!1519 (select (arr!2304 (_values!2915 (v!3267 (underlying!475 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2932 (v!3267 (underlying!475 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!25978 (index!3278 lt!72677) (index!3275 lt!72677))))))

(declare-fun b!138934 () Bool)

(assert (=> b!138934 (= e!90600 ((_ is Undefined!278) lt!72680))))

(declare-fun lt!72660 () array!4873)

(declare-fun lt!72675 () (_ BitVec 32))

(declare-fun bm!15342 () Bool)

(declare-fun call!15360 () ListLongMap!1739)

(assert (=> bm!15342 (= call!15360 (getCurrentListMap!559 (_keys!4691 newMap!16) (ite c!25975 (_values!2915 newMap!16) lt!72660) (mask!7268 newMap!16) (ite c!25975 (ite c!25985 (extraKeys!2687 newMap!16) lt!72675) (extraKeys!2687 newMap!16)) (zeroValue!2782 newMap!16) (ite c!25975 (ite c!25985 (minValue!2782 newMap!16) (get!1519 (select (arr!2304 (_values!2915 (v!3267 (underlying!475 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2932 (v!3267 (underlying!475 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2782 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2932 newMap!16)))))

(declare-fun bm!15343 () Bool)

(assert (=> bm!15343 (= call!15355 call!15356)))

(declare-fun b!138935 () Bool)

(declare-fun e!90580 () ListLongMap!1739)

(assert (=> b!138935 (= e!90580 call!15360)))

(declare-fun b!138936 () Bool)

(declare-fun lt!72669 () Unit!4363)

(assert (=> b!138936 (= lt!72669 e!90595)))

(declare-fun c!25980 () Bool)

(declare-fun call!15346 () Bool)

(assert (=> b!138936 (= c!25980 call!15346)))

(assert (=> b!138936 (= e!90582 (tuple2!2689 false newMap!16))))

(declare-fun b!138937 () Bool)

(declare-fun lt!72684 () Unit!4363)

(declare-fun lt!72678 () Unit!4363)

(assert (=> b!138937 (= lt!72684 lt!72678)))

(assert (=> b!138937 call!15346))

(declare-fun lemmaValidKeyInArrayIsInListMap!125 (array!4871 array!4873 (_ BitVec 32) (_ BitVec 32) V!3539 V!3539 (_ BitVec 32) Int) Unit!4363)

(assert (=> b!138937 (= lt!72678 (lemmaValidKeyInArrayIsInListMap!125 (_keys!4691 newMap!16) lt!72660 (mask!7268 newMap!16) (extraKeys!2687 newMap!16) (zeroValue!2782 newMap!16) (minValue!2782 newMap!16) (index!3276 lt!72677) (defaultEntry!2932 newMap!16)))))

(assert (=> b!138937 (= lt!72660 (array!4874 (store (arr!2304 (_values!2915 newMap!16)) (index!3276 lt!72677) (ValueCellFull!1116 (get!1519 (select (arr!2304 (_values!2915 (v!3267 (underlying!475 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2932 (v!3267 (underlying!475 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2576 (_values!2915 newMap!16))))))

(declare-fun lt!72664 () Unit!4363)

(declare-fun lt!72663 () Unit!4363)

(assert (=> b!138937 (= lt!72664 lt!72663)))

(declare-fun call!15350 () ListLongMap!1739)

(declare-fun call!15354 () ListLongMap!1739)

(assert (=> b!138937 (= call!15350 call!15354)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!64 (array!4871 array!4873 (_ BitVec 32) (_ BitVec 32) V!3539 V!3539 (_ BitVec 32) (_ BitVec 64) V!3539 Int) Unit!4363)

(assert (=> b!138937 (= lt!72663 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!64 (_keys!4691 newMap!16) (_values!2915 newMap!16) (mask!7268 newMap!16) (extraKeys!2687 newMap!16) (zeroValue!2782 newMap!16) (minValue!2782 newMap!16) (index!3276 lt!72677) (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) (get!1519 (select (arr!2304 (_values!2915 (v!3267 (underlying!475 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2932 (v!3267 (underlying!475 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2932 newMap!16)))))

(declare-fun lt!72667 () Unit!4363)

(declare-fun e!90598 () Unit!4363)

(assert (=> b!138937 (= lt!72667 e!90598)))

(declare-fun c!25986 () Bool)

(assert (=> b!138937 (= c!25986 (contains!919 (getCurrentListMap!559 (_keys!4691 newMap!16) (_values!2915 newMap!16) (mask!7268 newMap!16) (extraKeys!2687 newMap!16) (zeroValue!2782 newMap!16) (minValue!2782 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2932 newMap!16)) (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355)))))

(assert (=> b!138937 (= e!90589 (tuple2!2689 true (LongMapFixedSize!1141 (defaultEntry!2932 newMap!16) (mask!7268 newMap!16) (extraKeys!2687 newMap!16) (zeroValue!2782 newMap!16) (minValue!2782 newMap!16) (_size!619 newMap!16) (_keys!4691 newMap!16) (array!4874 (store (arr!2304 (_values!2915 newMap!16)) (index!3276 lt!72677) (ValueCellFull!1116 (get!1519 (select (arr!2304 (_values!2915 (v!3267 (underlying!475 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2932 (v!3267 (underlying!475 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2576 (_values!2915 newMap!16))) (_vacant!619 newMap!16))))))

(declare-fun bm!15344 () Bool)

(declare-fun call!15347 () Bool)

(assert (=> bm!15344 (= call!15362 call!15347)))

(declare-fun bm!15345 () Bool)

(declare-fun call!15345 () ListLongMap!1739)

(assert (=> bm!15345 (= call!15345 (map!1436 (_2!1355 lt!72665)))))

(declare-fun b!138938 () Bool)

(declare-fun res!66496 () Bool)

(declare-fun e!90581 () Bool)

(assert (=> b!138938 (=> (not res!66496) (not e!90581))))

(declare-fun call!15363 () Bool)

(assert (=> b!138938 (= res!66496 call!15363)))

(assert (=> b!138938 (= e!90597 e!90581)))

(declare-fun b!138939 () Bool)

(declare-fun res!66506 () Bool)

(declare-fun call!15343 () Bool)

(assert (=> b!138939 (= res!66506 call!15343)))

(declare-fun e!90584 () Bool)

(assert (=> b!138939 (=> (not res!66506) (not e!90584))))

(declare-fun call!15361 () Unit!4363)

(declare-fun bm!15346 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!64 (array!4871 array!4873 (_ BitVec 32) (_ BitVec 32) V!3539 V!3539 (_ BitVec 64) Int) Unit!4363)

(assert (=> bm!15346 (= call!15361 (lemmaInListMapThenSeekEntryOrOpenFindsIt!64 (_keys!4691 newMap!16) (_values!2915 newMap!16) (mask!7268 newMap!16) (extraKeys!2687 newMap!16) (zeroValue!2782 newMap!16) (minValue!2782 newMap!16) (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) (defaultEntry!2932 newMap!16)))))

(declare-fun b!138940 () Bool)

(declare-fun lt!72670 () Unit!4363)

(declare-fun lt!72661 () Unit!4363)

(assert (=> b!138940 (= lt!72670 lt!72661)))

(declare-fun call!15348 () ListLongMap!1739)

(assert (=> b!138940 (= call!15348 call!15358)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!64 (array!4871 array!4873 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3539 V!3539 V!3539 Int) Unit!4363)

(assert (=> b!138940 (= lt!72661 (lemmaChangeLongMinValueKeyThenAddPairToListMap!64 (_keys!4691 newMap!16) (_values!2915 newMap!16) (mask!7268 newMap!16) (extraKeys!2687 newMap!16) lt!72675 (zeroValue!2782 newMap!16) (minValue!2782 newMap!16) (get!1519 (select (arr!2304 (_values!2915 (v!3267 (underlying!475 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2932 (v!3267 (underlying!475 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2932 newMap!16)))))

(assert (=> b!138940 (= lt!72675 (bvor (extraKeys!2687 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!90583 () tuple2!2688)

(assert (=> b!138940 (= e!90583 (tuple2!2689 true (LongMapFixedSize!1141 (defaultEntry!2932 newMap!16) (mask!7268 newMap!16) (bvor (extraKeys!2687 newMap!16) #b00000000000000000000000000000010) (zeroValue!2782 newMap!16) (get!1519 (select (arr!2304 (_values!2915 (v!3267 (underlying!475 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2932 (v!3267 (underlying!475 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!619 newMap!16) (_keys!4691 newMap!16) (_values!2915 newMap!16) (_vacant!619 newMap!16))))))

(declare-fun bm!15347 () Bool)

(declare-fun +!178 (ListLongMap!1739 tuple2!2686) ListLongMap!1739)

(assert (=> bm!15347 (= call!15350 (+!178 e!90593 (ite c!25975 (ite c!25985 (tuple2!2687 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1519 (select (arr!2304 (_values!2915 (v!3267 (underlying!475 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2932 (v!3267 (underlying!475 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2687 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1519 (select (arr!2304 (_values!2915 (v!3267 (underlying!475 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2932 (v!3267 (underlying!475 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2687 (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) (get!1519 (select (arr!2304 (_values!2915 (v!3267 (underlying!475 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2932 (v!3267 (underlying!475 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!25983 () Bool)

(assert (=> bm!15347 (= c!25983 c!25975)))

(declare-fun bm!15348 () Bool)

(declare-fun call!15353 () ListLongMap!1739)

(assert (=> bm!15348 (= call!15353 (map!1436 newMap!16))))

(declare-fun b!138941 () Bool)

(declare-fun res!66498 () Bool)

(assert (=> b!138941 (=> (not res!66498) (not e!90599))))

(declare-fun lt!72674 () SeekEntryResult!278)

(assert (=> b!138941 (= res!66498 (= (select (arr!2303 (_keys!4691 newMap!16)) (index!3275 lt!72674)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138942 () Bool)

(declare-fun Unit!4366 () Unit!4363)

(assert (=> b!138942 (= e!90598 Unit!4366)))

(declare-fun lt!72681 () Unit!4363)

(assert (=> b!138942 (= lt!72681 call!15357)))

(declare-fun call!15359 () SeekEntryResult!278)

(assert (=> b!138942 (= lt!72674 call!15359)))

(declare-fun c!25979 () Bool)

(assert (=> b!138942 (= c!25979 ((_ is MissingZero!278) lt!72674))))

(assert (=> b!138942 e!90592))

(declare-fun lt!72679 () Unit!4363)

(assert (=> b!138942 (= lt!72679 lt!72681)))

(assert (=> b!138942 false))

(declare-fun b!138943 () Bool)

(assert (=> b!138943 (= e!90581 (not call!15342))))

(declare-fun bm!15349 () Bool)

(declare-fun call!15344 () SeekEntryResult!278)

(assert (=> bm!15349 (= call!15352 call!15344)))

(declare-fun bm!15350 () Bool)

(assert (=> bm!15350 (= call!15354 call!15356)))

(declare-fun b!138944 () Bool)

(assert (=> b!138944 (= c!25978 ((_ is MissingVacant!278) lt!72677))))

(assert (=> b!138944 (= e!90582 e!90587)))

(declare-fun bm!15351 () Bool)

(declare-fun c!25981 () Bool)

(assert (=> bm!15351 (= c!25981 c!25976)))

(assert (=> bm!15351 (= call!15346 (contains!919 e!90580 (ite c!25976 (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) (select (arr!2303 (_keys!4691 newMap!16)) (index!3276 lt!72677)))))))

(declare-fun b!138945 () Bool)

(assert (=> b!138945 (= e!90580 call!15354)))

(declare-fun b!138946 () Bool)

(declare-fun lt!72662 () SeekEntryResult!278)

(assert (=> b!138946 (= e!90584 (= (select (arr!2303 (_keys!4691 newMap!16)) (index!3276 lt!72662)) (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355)))))

(declare-fun b!138947 () Bool)

(declare-fun e!90591 () Bool)

(assert (=> b!138947 (= e!90591 (= call!15345 call!15353))))

(declare-fun bm!15352 () Bool)

(assert (=> bm!15352 (= call!15364 call!15365)))

(declare-fun b!138948 () Bool)

(declare-fun e!90579 () Bool)

(assert (=> b!138948 (= e!90579 ((_ is Undefined!278) lt!72674))))

(declare-fun bm!15353 () Bool)

(assert (=> bm!15353 (= call!15348 call!15350)))

(declare-fun b!138949 () Bool)

(assert (=> b!138949 (= e!90579 e!90594)))

(declare-fun res!66503 () Bool)

(assert (=> b!138949 (= res!66503 call!15362)))

(assert (=> b!138949 (=> (not res!66503) (not e!90594))))

(declare-fun bm!15354 () Bool)

(assert (=> bm!15354 (= call!15363 call!15343)))

(declare-fun e!90590 () Bool)

(declare-fun b!138950 () Bool)

(declare-fun lt!72673 () SeekEntryResult!278)

(assert (=> b!138950 (= e!90590 (= (select (arr!2303 (_keys!4691 newMap!16)) (index!3276 lt!72673)) (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355)))))

(declare-fun b!138951 () Bool)

(assert (=> b!138951 (= e!90586 e!90591)))

(declare-fun c!25982 () Bool)

(assert (=> b!138951 (= c!25982 (_1!1355 lt!72665))))

(declare-fun b!138952 () Bool)

(assert (=> b!138952 (= e!90600 e!90588)))

(declare-fun res!66507 () Bool)

(assert (=> b!138952 (= res!66507 call!15363)))

(assert (=> b!138952 (=> (not res!66507) (not e!90588))))

(declare-fun bm!15355 () Bool)

(assert (=> bm!15355 (= call!15358 call!15360)))

(declare-fun b!138953 () Bool)

(declare-fun e!90585 () Bool)

(assert (=> b!138953 (= e!90591 e!90585)))

(declare-fun res!66504 () Bool)

(assert (=> b!138953 (= res!66504 (contains!919 call!15345 (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355)))))

(assert (=> b!138953 (=> (not res!66504) (not e!90585))))

(declare-fun b!138954 () Bool)

(declare-fun Unit!4367 () Unit!4363)

(assert (=> b!138954 (= e!90595 Unit!4367)))

(declare-fun lt!72666 () Unit!4363)

(assert (=> b!138954 (= lt!72666 call!15361)))

(assert (=> b!138954 (= lt!72662 call!15352)))

(declare-fun res!66505 () Bool)

(assert (=> b!138954 (= res!66505 ((_ is Found!278) lt!72662))))

(assert (=> b!138954 (=> (not res!66505) (not e!90584))))

(assert (=> b!138954 e!90584))

(declare-fun lt!72671 () Unit!4363)

(assert (=> b!138954 (= lt!72671 lt!72666)))

(assert (=> b!138954 false))

(declare-fun bm!15356 () Bool)

(assert (=> bm!15356 (= call!15365 (arrayContainsKey!0 (_keys!4691 newMap!16) (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!138955 () Bool)

(assert (=> b!138955 (= e!90587 e!90589)))

(declare-fun c!25988 () Bool)

(assert (=> b!138955 (= c!25988 ((_ is MissingZero!278) lt!72677))))

(declare-fun b!138956 () Bool)

(declare-fun res!66508 () Bool)

(assert (=> b!138956 (= res!66508 (= (select (arr!2303 (_keys!4691 newMap!16)) (index!3278 lt!72680)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!138956 (=> (not res!66508) (not e!90588))))

(declare-fun b!138957 () Bool)

(assert (=> b!138957 (= e!90585 (= call!15345 (+!178 call!15353 (tuple2!2687 (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) (get!1519 (select (arr!2304 (_values!2915 (v!3267 (underlying!475 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2932 (v!3267 (underlying!475 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!15357 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!64 (array!4871 array!4873 (_ BitVec 32) (_ BitVec 32) V!3539 V!3539 (_ BitVec 64) Int) Unit!4363)

(assert (=> bm!15357 (= call!15357 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!64 (_keys!4691 newMap!16) (_values!2915 newMap!16) (mask!7268 newMap!16) (extraKeys!2687 newMap!16) (zeroValue!2782 newMap!16) (minValue!2782 newMap!16) (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) (defaultEntry!2932 newMap!16)))))

(declare-fun bm!15358 () Bool)

(declare-fun call!15349 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!15358 (= call!15349 (inRange!0 (ite c!25976 (ite c!25980 (index!3276 lt!72662) (ite c!25977 (index!3275 lt!72680) (index!3278 lt!72680))) (ite c!25986 (index!3276 lt!72673) (ite c!25979 (index!3275 lt!72674) (index!3278 lt!72674)))) (mask!7268 newMap!16)))))

(declare-fun b!138958 () Bool)

(declare-fun lt!72668 () Unit!4363)

(assert (=> b!138958 (= e!90598 lt!72668)))

(assert (=> b!138958 (= lt!72668 call!15361)))

(assert (=> b!138958 (= lt!72673 call!15359)))

(declare-fun res!66497 () Bool)

(assert (=> b!138958 (= res!66497 ((_ is Found!278) lt!72673))))

(assert (=> b!138958 (=> (not res!66497) (not e!90590))))

(assert (=> b!138958 e!90590))

(declare-fun b!138959 () Bool)

(declare-fun res!66499 () Bool)

(assert (=> b!138959 (= res!66499 (= (select (arr!2303 (_keys!4691 newMap!16)) (index!3278 lt!72674)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!138959 (=> (not res!66499) (not e!90594))))

(declare-fun bm!15359 () Bool)

(assert (=> bm!15359 (= call!15347 call!15349)))

(declare-fun b!138960 () Bool)

(declare-fun c!25984 () Bool)

(assert (=> b!138960 (= c!25984 ((_ is MissingVacant!278) lt!72674))))

(assert (=> b!138960 (= e!90592 e!90579)))

(declare-fun b!138961 () Bool)

(declare-fun res!66501 () Bool)

(assert (=> b!138961 (= res!66501 call!15347)))

(assert (=> b!138961 (=> (not res!66501) (not e!90590))))

(declare-fun bm!15360 () Bool)

(assert (=> bm!15360 (= call!15343 call!15349)))

(declare-fun bm!15361 () Bool)

(assert (=> bm!15361 (= call!15359 call!15344)))

(declare-fun b!138962 () Bool)

(declare-fun res!66509 () Bool)

(assert (=> b!138962 (=> (not res!66509) (not e!90581))))

(assert (=> b!138962 (= res!66509 (= (select (arr!2303 (_keys!4691 newMap!16)) (index!3275 lt!72680)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!138963 () Bool)

(declare-fun lt!72685 () Unit!4363)

(declare-fun lt!72672 () Unit!4363)

(assert (=> b!138963 (= lt!72685 lt!72672)))

(assert (=> b!138963 (= call!15348 call!15355)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!64 (array!4871 array!4873 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3539 V!3539 V!3539 Int) Unit!4363)

(assert (=> b!138963 (= lt!72672 (lemmaChangeZeroKeyThenAddPairToListMap!64 (_keys!4691 newMap!16) (_values!2915 newMap!16) (mask!7268 newMap!16) (extraKeys!2687 newMap!16) lt!72682 (zeroValue!2782 newMap!16) (get!1519 (select (arr!2304 (_values!2915 (v!3267 (underlying!475 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2932 (v!3267 (underlying!475 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2782 newMap!16) (defaultEntry!2932 newMap!16)))))

(assert (=> b!138963 (= lt!72682 (bvor (extraKeys!2687 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!138963 (= e!90583 (tuple2!2689 true (LongMapFixedSize!1141 (defaultEntry!2932 newMap!16) (mask!7268 newMap!16) (bvor (extraKeys!2687 newMap!16) #b00000000000000000000000000000001) (get!1519 (select (arr!2304 (_values!2915 (v!3267 (underlying!475 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2932 (v!3267 (underlying!475 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2782 newMap!16) (_size!619 newMap!16) (_keys!4691 newMap!16) (_values!2915 newMap!16) (_vacant!619 newMap!16))))))

(declare-fun b!138964 () Bool)

(assert (=> b!138964 (= e!90596 e!90583)))

(assert (=> b!138964 (= c!25985 (= (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!15362 () Bool)

(assert (=> bm!15362 (= call!15344 (seekEntryOrOpen!0 (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) from!355) (_keys!4691 newMap!16) (mask!7268 newMap!16)))))

(assert (= (and d!43257 c!25975) b!138964))

(assert (= (and d!43257 (not c!25975)) b!138923))

(assert (= (and b!138964 c!25985) b!138963))

(assert (= (and b!138964 (not c!25985)) b!138940))

(assert (= (or b!138963 b!138940) bm!15343))

(assert (= (or b!138963 b!138940) bm!15355))

(assert (= (or b!138963 b!138940) bm!15353))

(assert (= (and b!138923 c!25976) b!138936))

(assert (= (and b!138923 (not c!25976)) b!138944))

(assert (= (and b!138936 c!25980) b!138954))

(assert (= (and b!138936 (not c!25980)) b!138927))

(assert (= (and b!138954 res!66505) b!138939))

(assert (= (and b!138939 res!66506) b!138946))

(assert (= (and b!138927 c!25977) b!138938))

(assert (= (and b!138927 (not c!25977)) b!138924))

(assert (= (and b!138938 res!66496) b!138962))

(assert (= (and b!138962 res!66509) b!138943))

(assert (= (and b!138924 c!25987) b!138952))

(assert (= (and b!138924 (not c!25987)) b!138934))

(assert (= (and b!138952 res!66507) b!138956))

(assert (= (and b!138956 res!66508) b!138926))

(assert (= (or b!138938 b!138952) bm!15354))

(assert (= (or b!138943 b!138926) bm!15339))

(assert (= (or b!138939 bm!15354) bm!15360))

(assert (= (or b!138954 b!138927) bm!15349))

(assert (= (and b!138944 c!25978) b!138933))

(assert (= (and b!138944 (not c!25978)) b!138955))

(assert (= (and b!138955 c!25988) b!138929))

(assert (= (and b!138955 (not c!25988)) b!138937))

(assert (= (and b!138937 c!25986) b!138958))

(assert (= (and b!138937 (not c!25986)) b!138942))

(assert (= (and b!138958 res!66497) b!138961))

(assert (= (and b!138961 res!66501) b!138950))

(assert (= (and b!138942 c!25979) b!138930))

(assert (= (and b!138942 (not c!25979)) b!138960))

(assert (= (and b!138930 res!66500) b!138941))

(assert (= (and b!138941 res!66498) b!138931))

(assert (= (and b!138960 c!25984) b!138949))

(assert (= (and b!138960 (not c!25984)) b!138948))

(assert (= (and b!138949 res!66503) b!138959))

(assert (= (and b!138959 res!66499) b!138925))

(assert (= (or b!138930 b!138949) bm!15344))

(assert (= (or b!138931 b!138925) bm!15352))

(assert (= (or b!138961 bm!15344) bm!15359))

(assert (= (or b!138958 b!138942) bm!15361))

(assert (= (or b!138933 b!138929) bm!15341))

(assert (= (or b!138927 b!138942) bm!15357))

(assert (= (or bm!15349 bm!15361) bm!15362))

(assert (= (or bm!15339 bm!15352) bm!15356))

(assert (= (or b!138954 b!138958) bm!15346))

(assert (= (or bm!15360 bm!15359) bm!15358))

(assert (= (or b!138936 b!138937) bm!15350))

(assert (= (or b!138936 b!138937) bm!15351))

(assert (= (and bm!15351 c!25981) b!138945))

(assert (= (and bm!15351 (not c!25981)) b!138935))

(assert (= (or bm!15343 bm!15350) bm!15340))

(assert (= (or bm!15355 b!138935) bm!15342))

(assert (= (or bm!15353 b!138937) bm!15347))

(assert (= (and bm!15347 c!25983) b!138932))

(assert (= (and bm!15347 (not c!25983)) b!138928))

(assert (= (and d!43257 res!66502) b!138951))

(assert (= (and b!138951 c!25982) b!138953))

(assert (= (and b!138951 (not c!25982)) b!138947))

(assert (= (and b!138953 res!66504) b!138957))

(assert (= (or b!138957 b!138947) bm!15348))

(assert (= (or b!138953 b!138957 b!138947) bm!15345))

(assert (=> bm!15348 m!165631))

(declare-fun m!165723 () Bool)

(assert (=> b!138956 m!165723))

(declare-fun m!165725 () Bool)

(assert (=> bm!15351 m!165725))

(declare-fun m!165727 () Bool)

(assert (=> bm!15351 m!165727))

(assert (=> b!138953 m!165625))

(declare-fun m!165729 () Bool)

(assert (=> b!138953 m!165729))

(declare-fun m!165731 () Bool)

(assert (=> bm!15347 m!165731))

(declare-fun m!165733 () Bool)

(assert (=> b!138937 m!165733))

(declare-fun m!165735 () Bool)

(assert (=> b!138937 m!165735))

(assert (=> b!138937 m!165625))

(declare-fun m!165737 () Bool)

(assert (=> b!138937 m!165737))

(assert (=> b!138937 m!165735))

(assert (=> b!138937 m!165625))

(assert (=> b!138937 m!165623))

(declare-fun m!165739 () Bool)

(assert (=> b!138937 m!165739))

(declare-fun m!165741 () Bool)

(assert (=> b!138937 m!165741))

(assert (=> b!138963 m!165623))

(declare-fun m!165743 () Bool)

(assert (=> b!138963 m!165743))

(declare-fun m!165745 () Bool)

(assert (=> bm!15345 m!165745))

(assert (=> b!138940 m!165623))

(declare-fun m!165747 () Bool)

(assert (=> b!138940 m!165747))

(declare-fun m!165749 () Bool)

(assert (=> b!138941 m!165749))

(declare-fun m!165751 () Bool)

(assert (=> d!43257 m!165751))

(assert (=> d!43257 m!165617))

(declare-fun m!165753 () Bool)

(assert (=> bm!15358 m!165753))

(declare-fun m!165755 () Bool)

(assert (=> b!138962 m!165755))

(declare-fun m!165757 () Bool)

(assert (=> b!138957 m!165757))

(declare-fun m!165759 () Bool)

(assert (=> bm!15342 m!165759))

(declare-fun m!165761 () Bool)

(assert (=> b!138950 m!165761))

(assert (=> bm!15356 m!165625))

(declare-fun m!165763 () Bool)

(assert (=> bm!15356 m!165763))

(assert (=> bm!15340 m!165733))

(declare-fun m!165765 () Bool)

(assert (=> bm!15340 m!165765))

(assert (=> bm!15362 m!165625))

(declare-fun m!165767 () Bool)

(assert (=> bm!15362 m!165767))

(assert (=> bm!15341 m!165625))

(assert (=> bm!15341 m!165623))

(declare-fun m!165769 () Bool)

(assert (=> bm!15341 m!165769))

(declare-fun m!165771 () Bool)

(assert (=> b!138946 m!165771))

(assert (=> b!138923 m!165625))

(assert (=> b!138923 m!165767))

(assert (=> b!138928 m!165735))

(declare-fun m!165773 () Bool)

(assert (=> b!138959 m!165773))

(assert (=> bm!15346 m!165625))

(declare-fun m!165775 () Bool)

(assert (=> bm!15346 m!165775))

(assert (=> bm!15357 m!165625))

(declare-fun m!165777 () Bool)

(assert (=> bm!15357 m!165777))

(assert (=> b!138745 d!43257))

(declare-fun d!43259 () Bool)

(declare-fun c!25991 () Bool)

(assert (=> d!43259 (= c!25991 ((_ is ValueCellFull!1116) (select (arr!2304 (_values!2915 (v!3267 (underlying!475 thiss!992)))) from!355)))))

(declare-fun e!90603 () V!3539)

(assert (=> d!43259 (= (get!1519 (select (arr!2304 (_values!2915 (v!3267 (underlying!475 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2932 (v!3267 (underlying!475 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!90603)))

(declare-fun b!138969 () Bool)

(declare-fun get!1520 (ValueCell!1116 V!3539) V!3539)

(assert (=> b!138969 (= e!90603 (get!1520 (select (arr!2304 (_values!2915 (v!3267 (underlying!475 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2932 (v!3267 (underlying!475 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!138970 () Bool)

(declare-fun get!1521 (ValueCell!1116 V!3539) V!3539)

(assert (=> b!138970 (= e!90603 (get!1521 (select (arr!2304 (_values!2915 (v!3267 (underlying!475 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2932 (v!3267 (underlying!475 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!43259 c!25991) b!138969))

(assert (= (and d!43259 (not c!25991)) b!138970))

(assert (=> b!138969 m!165619))

(assert (=> b!138969 m!165621))

(declare-fun m!165779 () Bool)

(assert (=> b!138969 m!165779))

(assert (=> b!138970 m!165619))

(assert (=> b!138970 m!165621))

(declare-fun m!165781 () Bool)

(assert (=> b!138970 m!165781))

(assert (=> b!138745 d!43259))

(declare-fun d!43261 () Bool)

(declare-fun res!66516 () Bool)

(declare-fun e!90606 () Bool)

(assert (=> d!43261 (=> (not res!66516) (not e!90606))))

(declare-fun simpleValid!95 (LongMapFixedSize!1140) Bool)

(assert (=> d!43261 (= res!66516 (simpleValid!95 newMap!16))))

(assert (=> d!43261 (= (valid!550 newMap!16) e!90606)))

(declare-fun b!138977 () Bool)

(declare-fun res!66517 () Bool)

(assert (=> b!138977 (=> (not res!66517) (not e!90606))))

(declare-fun arrayCountValidKeys!0 (array!4871 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!138977 (= res!66517 (= (arrayCountValidKeys!0 (_keys!4691 newMap!16) #b00000000000000000000000000000000 (size!2575 (_keys!4691 newMap!16))) (_size!619 newMap!16)))))

(declare-fun b!138978 () Bool)

(declare-fun res!66518 () Bool)

(assert (=> b!138978 (=> (not res!66518) (not e!90606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4871 (_ BitVec 32)) Bool)

(assert (=> b!138978 (= res!66518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4691 newMap!16) (mask!7268 newMap!16)))))

(declare-fun b!138979 () Bool)

(assert (=> b!138979 (= e!90606 (arrayNoDuplicates!0 (_keys!4691 newMap!16) #b00000000000000000000000000000000 Nil!1736))))

(assert (= (and d!43261 res!66516) b!138977))

(assert (= (and b!138977 res!66517) b!138978))

(assert (= (and b!138978 res!66518) b!138979))

(declare-fun m!165783 () Bool)

(assert (=> d!43261 m!165783))

(declare-fun m!165785 () Bool)

(assert (=> b!138977 m!165785))

(declare-fun m!165787 () Bool)

(assert (=> b!138978 m!165787))

(declare-fun m!165789 () Bool)

(assert (=> b!138979 m!165789))

(assert (=> b!138746 d!43261))

(declare-fun d!43263 () Bool)

(assert (=> d!43263 (= (map!1436 newMap!16) (getCurrentListMap!559 (_keys!4691 newMap!16) (_values!2915 newMap!16) (mask!7268 newMap!16) (extraKeys!2687 newMap!16) (zeroValue!2782 newMap!16) (minValue!2782 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2932 newMap!16)))))

(declare-fun bs!5807 () Bool)

(assert (= bs!5807 d!43263))

(assert (=> bs!5807 m!165735))

(assert (=> b!138737 d!43263))

(declare-fun bm!15377 () Bool)

(declare-fun call!15382 () ListLongMap!1739)

(declare-fun call!15380 () ListLongMap!1739)

(assert (=> bm!15377 (= call!15382 call!15380)))

(declare-fun b!139022 () Bool)

(declare-fun e!90638 () ListLongMap!1739)

(declare-fun e!90640 () ListLongMap!1739)

(assert (=> b!139022 (= e!90638 e!90640)))

(declare-fun c!26008 () Bool)

(assert (=> b!139022 (= c!26008 (and (not (= (bvand (extraKeys!2687 (v!3267 (underlying!475 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2687 (v!3267 (underlying!475 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!139023 () Bool)

(declare-fun res!66537 () Bool)

(declare-fun e!90637 () Bool)

(assert (=> b!139023 (=> (not res!66537) (not e!90637))))

(declare-fun e!90635 () Bool)

(assert (=> b!139023 (= res!66537 e!90635)))

(declare-fun c!26006 () Bool)

(assert (=> b!139023 (= c!26006 (not (= (bvand (extraKeys!2687 (v!3267 (underlying!475 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!15378 () Bool)

(declare-fun call!15386 () ListLongMap!1739)

(declare-fun call!15385 () ListLongMap!1739)

(assert (=> bm!15378 (= call!15386 call!15385)))

(declare-fun b!139024 () Bool)

(declare-fun e!90643 () Bool)

(declare-fun e!90645 () Bool)

(assert (=> b!139024 (= e!90643 e!90645)))

(declare-fun res!66543 () Bool)

(assert (=> b!139024 (=> (not res!66543) (not e!90645))))

(declare-fun lt!72745 () ListLongMap!1739)

(assert (=> b!139024 (= res!66543 (contains!919 lt!72745 (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!139024 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2575 (_keys!4691 (v!3267 (underlying!475 thiss!992))))))))

(declare-fun b!139025 () Bool)

(declare-fun e!90644 () Bool)

(assert (=> b!139025 (= e!90637 e!90644)))

(declare-fun c!26005 () Bool)

(assert (=> b!139025 (= c!26005 (not (= (bvand (extraKeys!2687 (v!3267 (underlying!475 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!139026 () Bool)

(assert (=> b!139026 (= e!90640 call!15382)))

(declare-fun b!139027 () Bool)

(declare-fun e!90642 () ListLongMap!1739)

(assert (=> b!139027 (= e!90642 call!15382)))

(declare-fun b!139028 () Bool)

(declare-fun apply!119 (ListLongMap!1739 (_ BitVec 64)) V!3539)

(assert (=> b!139028 (= e!90645 (= (apply!119 lt!72745 (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1519 (select (arr!2304 (_values!2915 (v!3267 (underlying!475 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!439 (defaultEntry!2932 (v!3267 (underlying!475 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!139028 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2576 (_values!2915 (v!3267 (underlying!475 thiss!992))))))))

(assert (=> b!139028 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2575 (_keys!4691 (v!3267 (underlying!475 thiss!992))))))))

(declare-fun b!139029 () Bool)

(declare-fun e!90639 () Bool)

(assert (=> b!139029 (= e!90639 (validKeyInArray!0 (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!139030 () Bool)

(declare-fun e!90633 () Unit!4363)

(declare-fun Unit!4368 () Unit!4363)

(assert (=> b!139030 (= e!90633 Unit!4368)))

(declare-fun bm!15379 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!144 (array!4871 array!4873 (_ BitVec 32) (_ BitVec 32) V!3539 V!3539 (_ BitVec 32) Int) ListLongMap!1739)

(assert (=> bm!15379 (= call!15385 (getCurrentListMapNoExtraKeys!144 (_keys!4691 (v!3267 (underlying!475 thiss!992))) (_values!2915 (v!3267 (underlying!475 thiss!992))) (mask!7268 (v!3267 (underlying!475 thiss!992))) (extraKeys!2687 (v!3267 (underlying!475 thiss!992))) (zeroValue!2782 (v!3267 (underlying!475 thiss!992))) (minValue!2782 (v!3267 (underlying!475 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2932 (v!3267 (underlying!475 thiss!992)))))))

(declare-fun b!139031 () Bool)

(declare-fun e!90636 () Bool)

(assert (=> b!139031 (= e!90635 e!90636)))

(declare-fun res!66538 () Bool)

(declare-fun call!15383 () Bool)

(assert (=> b!139031 (= res!66538 call!15383)))

(assert (=> b!139031 (=> (not res!66538) (not e!90636))))

(declare-fun b!139032 () Bool)

(declare-fun e!90634 () Bool)

(assert (=> b!139032 (= e!90644 e!90634)))

(declare-fun res!66541 () Bool)

(declare-fun call!15381 () Bool)

(assert (=> b!139032 (= res!66541 call!15381)))

(assert (=> b!139032 (=> (not res!66541) (not e!90634))))

(declare-fun b!139033 () Bool)

(declare-fun call!15384 () ListLongMap!1739)

(assert (=> b!139033 (= e!90642 call!15384)))

(declare-fun b!139034 () Bool)

(declare-fun lt!72733 () Unit!4363)

(assert (=> b!139034 (= e!90633 lt!72733)))

(declare-fun lt!72750 () ListLongMap!1739)

(assert (=> b!139034 (= lt!72750 (getCurrentListMapNoExtraKeys!144 (_keys!4691 (v!3267 (underlying!475 thiss!992))) (_values!2915 (v!3267 (underlying!475 thiss!992))) (mask!7268 (v!3267 (underlying!475 thiss!992))) (extraKeys!2687 (v!3267 (underlying!475 thiss!992))) (zeroValue!2782 (v!3267 (underlying!475 thiss!992))) (minValue!2782 (v!3267 (underlying!475 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2932 (v!3267 (underlying!475 thiss!992)))))))

(declare-fun lt!72736 () (_ BitVec 64))

(assert (=> b!139034 (= lt!72736 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72743 () (_ BitVec 64))

(assert (=> b!139034 (= lt!72743 (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!72731 () Unit!4363)

(declare-fun addStillContains!95 (ListLongMap!1739 (_ BitVec 64) V!3539 (_ BitVec 64)) Unit!4363)

(assert (=> b!139034 (= lt!72731 (addStillContains!95 lt!72750 lt!72736 (zeroValue!2782 (v!3267 (underlying!475 thiss!992))) lt!72743))))

(assert (=> b!139034 (contains!919 (+!178 lt!72750 (tuple2!2687 lt!72736 (zeroValue!2782 (v!3267 (underlying!475 thiss!992))))) lt!72743)))

(declare-fun lt!72749 () Unit!4363)

(assert (=> b!139034 (= lt!72749 lt!72731)))

(declare-fun lt!72748 () ListLongMap!1739)

(assert (=> b!139034 (= lt!72748 (getCurrentListMapNoExtraKeys!144 (_keys!4691 (v!3267 (underlying!475 thiss!992))) (_values!2915 (v!3267 (underlying!475 thiss!992))) (mask!7268 (v!3267 (underlying!475 thiss!992))) (extraKeys!2687 (v!3267 (underlying!475 thiss!992))) (zeroValue!2782 (v!3267 (underlying!475 thiss!992))) (minValue!2782 (v!3267 (underlying!475 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2932 (v!3267 (underlying!475 thiss!992)))))))

(declare-fun lt!72747 () (_ BitVec 64))

(assert (=> b!139034 (= lt!72747 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72738 () (_ BitVec 64))

(assert (=> b!139034 (= lt!72738 (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!72737 () Unit!4363)

(declare-fun addApplyDifferent!95 (ListLongMap!1739 (_ BitVec 64) V!3539 (_ BitVec 64)) Unit!4363)

(assert (=> b!139034 (= lt!72737 (addApplyDifferent!95 lt!72748 lt!72747 (minValue!2782 (v!3267 (underlying!475 thiss!992))) lt!72738))))

(assert (=> b!139034 (= (apply!119 (+!178 lt!72748 (tuple2!2687 lt!72747 (minValue!2782 (v!3267 (underlying!475 thiss!992))))) lt!72738) (apply!119 lt!72748 lt!72738))))

(declare-fun lt!72744 () Unit!4363)

(assert (=> b!139034 (= lt!72744 lt!72737)))

(declare-fun lt!72735 () ListLongMap!1739)

(assert (=> b!139034 (= lt!72735 (getCurrentListMapNoExtraKeys!144 (_keys!4691 (v!3267 (underlying!475 thiss!992))) (_values!2915 (v!3267 (underlying!475 thiss!992))) (mask!7268 (v!3267 (underlying!475 thiss!992))) (extraKeys!2687 (v!3267 (underlying!475 thiss!992))) (zeroValue!2782 (v!3267 (underlying!475 thiss!992))) (minValue!2782 (v!3267 (underlying!475 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2932 (v!3267 (underlying!475 thiss!992)))))))

(declare-fun lt!72739 () (_ BitVec 64))

(assert (=> b!139034 (= lt!72739 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72732 () (_ BitVec 64))

(assert (=> b!139034 (= lt!72732 (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!72741 () Unit!4363)

(assert (=> b!139034 (= lt!72741 (addApplyDifferent!95 lt!72735 lt!72739 (zeroValue!2782 (v!3267 (underlying!475 thiss!992))) lt!72732))))

(assert (=> b!139034 (= (apply!119 (+!178 lt!72735 (tuple2!2687 lt!72739 (zeroValue!2782 (v!3267 (underlying!475 thiss!992))))) lt!72732) (apply!119 lt!72735 lt!72732))))

(declare-fun lt!72751 () Unit!4363)

(assert (=> b!139034 (= lt!72751 lt!72741)))

(declare-fun lt!72734 () ListLongMap!1739)

(assert (=> b!139034 (= lt!72734 (getCurrentListMapNoExtraKeys!144 (_keys!4691 (v!3267 (underlying!475 thiss!992))) (_values!2915 (v!3267 (underlying!475 thiss!992))) (mask!7268 (v!3267 (underlying!475 thiss!992))) (extraKeys!2687 (v!3267 (underlying!475 thiss!992))) (zeroValue!2782 (v!3267 (underlying!475 thiss!992))) (minValue!2782 (v!3267 (underlying!475 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2932 (v!3267 (underlying!475 thiss!992)))))))

(declare-fun lt!72740 () (_ BitVec 64))

(assert (=> b!139034 (= lt!72740 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72742 () (_ BitVec 64))

(assert (=> b!139034 (= lt!72742 (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!139034 (= lt!72733 (addApplyDifferent!95 lt!72734 lt!72740 (minValue!2782 (v!3267 (underlying!475 thiss!992))) lt!72742))))

(assert (=> b!139034 (= (apply!119 (+!178 lt!72734 (tuple2!2687 lt!72740 (minValue!2782 (v!3267 (underlying!475 thiss!992))))) lt!72742) (apply!119 lt!72734 lt!72742))))

(declare-fun bm!15380 () Bool)

(declare-fun c!26007 () Bool)

(assert (=> bm!15380 (= call!15380 (+!178 (ite c!26007 call!15385 (ite c!26008 call!15386 call!15384)) (ite (or c!26007 c!26008) (tuple2!2687 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2782 (v!3267 (underlying!475 thiss!992)))) (tuple2!2687 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2782 (v!3267 (underlying!475 thiss!992)))))))))

(declare-fun b!139035 () Bool)

(assert (=> b!139035 (= e!90636 (= (apply!119 lt!72745 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2782 (v!3267 (underlying!475 thiss!992)))))))

(declare-fun b!139036 () Bool)

(assert (=> b!139036 (= e!90644 (not call!15381))))

(declare-fun bm!15381 () Bool)

(assert (=> bm!15381 (= call!15383 (contains!919 lt!72745 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!15382 () Bool)

(assert (=> bm!15382 (= call!15381 (contains!919 lt!72745 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!139037 () Bool)

(declare-fun c!26009 () Bool)

(assert (=> b!139037 (= c!26009 (and (not (= (bvand (extraKeys!2687 (v!3267 (underlying!475 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2687 (v!3267 (underlying!475 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!139037 (= e!90640 e!90642)))

(declare-fun b!139038 () Bool)

(assert (=> b!139038 (= e!90635 (not call!15383))))

(declare-fun b!139039 () Bool)

(assert (=> b!139039 (= e!90634 (= (apply!119 lt!72745 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2782 (v!3267 (underlying!475 thiss!992)))))))

(declare-fun bm!15383 () Bool)

(assert (=> bm!15383 (= call!15384 call!15386)))

(declare-fun d!43265 () Bool)

(assert (=> d!43265 e!90637))

(declare-fun res!66540 () Bool)

(assert (=> d!43265 (=> (not res!66540) (not e!90637))))

(assert (=> d!43265 (= res!66540 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2575 (_keys!4691 (v!3267 (underlying!475 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2575 (_keys!4691 (v!3267 (underlying!475 thiss!992))))))))))

(declare-fun lt!72752 () ListLongMap!1739)

(assert (=> d!43265 (= lt!72745 lt!72752)))

(declare-fun lt!72746 () Unit!4363)

(assert (=> d!43265 (= lt!72746 e!90633)))

(declare-fun c!26004 () Bool)

(assert (=> d!43265 (= c!26004 e!90639)))

(declare-fun res!66539 () Bool)

(assert (=> d!43265 (=> (not res!66539) (not e!90639))))

(assert (=> d!43265 (= res!66539 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2575 (_keys!4691 (v!3267 (underlying!475 thiss!992))))))))

(assert (=> d!43265 (= lt!72752 e!90638)))

(assert (=> d!43265 (= c!26007 (and (not (= (bvand (extraKeys!2687 (v!3267 (underlying!475 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2687 (v!3267 (underlying!475 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!43265 (validMask!0 (mask!7268 (v!3267 (underlying!475 thiss!992))))))

(assert (=> d!43265 (= (getCurrentListMap!559 (_keys!4691 (v!3267 (underlying!475 thiss!992))) (_values!2915 (v!3267 (underlying!475 thiss!992))) (mask!7268 (v!3267 (underlying!475 thiss!992))) (extraKeys!2687 (v!3267 (underlying!475 thiss!992))) (zeroValue!2782 (v!3267 (underlying!475 thiss!992))) (minValue!2782 (v!3267 (underlying!475 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2932 (v!3267 (underlying!475 thiss!992)))) lt!72745)))

(declare-fun b!139040 () Bool)

(declare-fun e!90641 () Bool)

(assert (=> b!139040 (= e!90641 (validKeyInArray!0 (select (arr!2303 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!139041 () Bool)

(declare-fun res!66542 () Bool)

(assert (=> b!139041 (=> (not res!66542) (not e!90637))))

(assert (=> b!139041 (= res!66542 e!90643)))

(declare-fun res!66545 () Bool)

(assert (=> b!139041 (=> res!66545 e!90643)))

(assert (=> b!139041 (= res!66545 (not e!90641))))

(declare-fun res!66544 () Bool)

(assert (=> b!139041 (=> (not res!66544) (not e!90641))))

(assert (=> b!139041 (= res!66544 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2575 (_keys!4691 (v!3267 (underlying!475 thiss!992))))))))

(declare-fun b!139042 () Bool)

(assert (=> b!139042 (= e!90638 (+!178 call!15380 (tuple2!2687 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2782 (v!3267 (underlying!475 thiss!992))))))))

(assert (= (and d!43265 c!26007) b!139042))

(assert (= (and d!43265 (not c!26007)) b!139022))

(assert (= (and b!139022 c!26008) b!139026))

(assert (= (and b!139022 (not c!26008)) b!139037))

(assert (= (and b!139037 c!26009) b!139027))

(assert (= (and b!139037 (not c!26009)) b!139033))

(assert (= (or b!139027 b!139033) bm!15383))

(assert (= (or b!139026 bm!15383) bm!15378))

(assert (= (or b!139026 b!139027) bm!15377))

(assert (= (or b!139042 bm!15378) bm!15379))

(assert (= (or b!139042 bm!15377) bm!15380))

(assert (= (and d!43265 res!66539) b!139029))

(assert (= (and d!43265 c!26004) b!139034))

(assert (= (and d!43265 (not c!26004)) b!139030))

(assert (= (and d!43265 res!66540) b!139041))

(assert (= (and b!139041 res!66544) b!139040))

(assert (= (and b!139041 (not res!66545)) b!139024))

(assert (= (and b!139024 res!66543) b!139028))

(assert (= (and b!139041 res!66542) b!139023))

(assert (= (and b!139023 c!26006) b!139031))

(assert (= (and b!139023 (not c!26006)) b!139038))

(assert (= (and b!139031 res!66538) b!139035))

(assert (= (or b!139031 b!139038) bm!15381))

(assert (= (and b!139023 res!66537) b!139025))

(assert (= (and b!139025 c!26005) b!139032))

(assert (= (and b!139025 (not c!26005)) b!139036))

(assert (= (and b!139032 res!66541) b!139039))

(assert (= (or b!139032 b!139036) bm!15382))

(declare-fun b_lambda!6215 () Bool)

(assert (=> (not b_lambda!6215) (not b!139028)))

(assert (=> b!139028 t!6296))

(declare-fun b_and!8659 () Bool)

(assert (= b_and!8647 (and (=> t!6296 result!4139) b_and!8659)))

(assert (=> b!139028 t!6298))

(declare-fun b_and!8661 () Bool)

(assert (= b_and!8649 (and (=> t!6298 result!4143) b_and!8661)))

(assert (=> b!139024 m!165705))

(assert (=> b!139024 m!165705))

(declare-fun m!165791 () Bool)

(assert (=> b!139024 m!165791))

(declare-fun m!165793 () Bool)

(assert (=> b!139039 m!165793))

(assert (=> b!139029 m!165705))

(assert (=> b!139029 m!165705))

(declare-fun m!165795 () Bool)

(assert (=> b!139029 m!165795))

(declare-fun m!165797 () Bool)

(assert (=> b!139042 m!165797))

(declare-fun m!165799 () Bool)

(assert (=> b!139034 m!165799))

(declare-fun m!165801 () Bool)

(assert (=> b!139034 m!165801))

(declare-fun m!165803 () Bool)

(assert (=> b!139034 m!165803))

(declare-fun m!165805 () Bool)

(assert (=> b!139034 m!165805))

(declare-fun m!165807 () Bool)

(assert (=> b!139034 m!165807))

(declare-fun m!165809 () Bool)

(assert (=> b!139034 m!165809))

(assert (=> b!139034 m!165807))

(declare-fun m!165811 () Bool)

(assert (=> b!139034 m!165811))

(declare-fun m!165813 () Bool)

(assert (=> b!139034 m!165813))

(declare-fun m!165815 () Bool)

(assert (=> b!139034 m!165815))

(declare-fun m!165817 () Bool)

(assert (=> b!139034 m!165817))

(declare-fun m!165819 () Bool)

(assert (=> b!139034 m!165819))

(assert (=> b!139034 m!165819))

(declare-fun m!165821 () Bool)

(assert (=> b!139034 m!165821))

(declare-fun m!165823 () Bool)

(assert (=> b!139034 m!165823))

(assert (=> b!139034 m!165705))

(declare-fun m!165825 () Bool)

(assert (=> b!139034 m!165825))

(assert (=> b!139034 m!165809))

(declare-fun m!165827 () Bool)

(assert (=> b!139034 m!165827))

(assert (=> b!139034 m!165801))

(declare-fun m!165829 () Bool)

(assert (=> b!139034 m!165829))

(assert (=> b!139028 m!165705))

(declare-fun m!165831 () Bool)

(assert (=> b!139028 m!165831))

(assert (=> b!139028 m!165705))

(assert (=> b!139028 m!165621))

(declare-fun m!165833 () Bool)

(assert (=> b!139028 m!165833))

(assert (=> b!139028 m!165621))

(declare-fun m!165835 () Bool)

(assert (=> b!139028 m!165835))

(assert (=> b!139028 m!165833))

(assert (=> bm!15379 m!165799))

(declare-fun m!165837 () Bool)

(assert (=> b!139035 m!165837))

(declare-fun m!165839 () Bool)

(assert (=> bm!15381 m!165839))

(declare-fun m!165841 () Bool)

(assert (=> bm!15380 m!165841))

(assert (=> d!43265 m!165711))

(declare-fun m!165843 () Bool)

(assert (=> bm!15382 m!165843))

(assert (=> b!139040 m!165705))

(assert (=> b!139040 m!165705))

(assert (=> b!139040 m!165795))

(assert (=> b!138737 d!43265))

(declare-fun d!43267 () Bool)

(assert (=> d!43267 (= (array_inv!1449 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) (bvsge (size!2575 (_keys!4691 (v!3267 (underlying!475 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!138742 d!43267))

(declare-fun d!43269 () Bool)

(assert (=> d!43269 (= (array_inv!1450 (_values!2915 (v!3267 (underlying!475 thiss!992)))) (bvsge (size!2576 (_values!2915 (v!3267 (underlying!475 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!138742 d!43269))

(declare-fun b!139049 () Bool)

(declare-fun e!90650 () Bool)

(assert (=> b!139049 (= e!90650 tp_is_empty!2919)))

(declare-fun condMapEmpty!4803 () Bool)

(declare-fun mapDefault!4803 () ValueCell!1116)

(assert (=> mapNonEmpty!4794 (= condMapEmpty!4803 (= mapRest!4793 ((as const (Array (_ BitVec 32) ValueCell!1116)) mapDefault!4803)))))

(declare-fun e!90651 () Bool)

(declare-fun mapRes!4803 () Bool)

(assert (=> mapNonEmpty!4794 (= tp!11481 (and e!90651 mapRes!4803))))

(declare-fun mapIsEmpty!4803 () Bool)

(assert (=> mapIsEmpty!4803 mapRes!4803))

(declare-fun mapNonEmpty!4803 () Bool)

(declare-fun tp!11499 () Bool)

(assert (=> mapNonEmpty!4803 (= mapRes!4803 (and tp!11499 e!90650))))

(declare-fun mapRest!4803 () (Array (_ BitVec 32) ValueCell!1116))

(declare-fun mapValue!4803 () ValueCell!1116)

(declare-fun mapKey!4803 () (_ BitVec 32))

(assert (=> mapNonEmpty!4803 (= mapRest!4793 (store mapRest!4803 mapKey!4803 mapValue!4803))))

(declare-fun b!139050 () Bool)

(assert (=> b!139050 (= e!90651 tp_is_empty!2919)))

(assert (= (and mapNonEmpty!4794 condMapEmpty!4803) mapIsEmpty!4803))

(assert (= (and mapNonEmpty!4794 (not condMapEmpty!4803)) mapNonEmpty!4803))

(assert (= (and mapNonEmpty!4803 ((_ is ValueCellFull!1116) mapValue!4803)) b!139049))

(assert (= (and mapNonEmpty!4794 ((_ is ValueCellFull!1116) mapDefault!4803)) b!139050))

(declare-fun m!165845 () Bool)

(assert (=> mapNonEmpty!4803 m!165845))

(declare-fun b!139051 () Bool)

(declare-fun e!90652 () Bool)

(assert (=> b!139051 (= e!90652 tp_is_empty!2919)))

(declare-fun condMapEmpty!4804 () Bool)

(declare-fun mapDefault!4804 () ValueCell!1116)

(assert (=> mapNonEmpty!4793 (= condMapEmpty!4804 (= mapRest!4794 ((as const (Array (_ BitVec 32) ValueCell!1116)) mapDefault!4804)))))

(declare-fun e!90653 () Bool)

(declare-fun mapRes!4804 () Bool)

(assert (=> mapNonEmpty!4793 (= tp!11483 (and e!90653 mapRes!4804))))

(declare-fun mapIsEmpty!4804 () Bool)

(assert (=> mapIsEmpty!4804 mapRes!4804))

(declare-fun mapNonEmpty!4804 () Bool)

(declare-fun tp!11500 () Bool)

(assert (=> mapNonEmpty!4804 (= mapRes!4804 (and tp!11500 e!90652))))

(declare-fun mapValue!4804 () ValueCell!1116)

(declare-fun mapKey!4804 () (_ BitVec 32))

(declare-fun mapRest!4804 () (Array (_ BitVec 32) ValueCell!1116))

(assert (=> mapNonEmpty!4804 (= mapRest!4794 (store mapRest!4804 mapKey!4804 mapValue!4804))))

(declare-fun b!139052 () Bool)

(assert (=> b!139052 (= e!90653 tp_is_empty!2919)))

(assert (= (and mapNonEmpty!4793 condMapEmpty!4804) mapIsEmpty!4804))

(assert (= (and mapNonEmpty!4793 (not condMapEmpty!4804)) mapNonEmpty!4804))

(assert (= (and mapNonEmpty!4804 ((_ is ValueCellFull!1116) mapValue!4804)) b!139051))

(assert (= (and mapNonEmpty!4793 ((_ is ValueCellFull!1116) mapDefault!4804)) b!139052))

(declare-fun m!165847 () Bool)

(assert (=> mapNonEmpty!4804 m!165847))

(declare-fun b_lambda!6217 () Bool)

(assert (= b_lambda!6215 (or (and b!138742 b_free!3005) (and b!138748 b_free!3007 (= (defaultEntry!2932 newMap!16) (defaultEntry!2932 (v!3267 (underlying!475 thiss!992))))) b_lambda!6217)))

(check-sat (not d!43257) (not d!43253) (not b!139039) (not bm!15357) (not b!138928) (not b!139040) (not mapNonEmpty!4803) (not b!138953) (not d!43261) (not bm!15290) (not b!138923) (not b!139034) (not b_lambda!6213) (not b!138836) (not d!43255) (not b!138817) (not b!139028) (not bm!15379) (not b_next!3007) (not bm!15345) (not b!139024) (not b!138813) (not b!138969) (not b!139029) (not bm!15380) (not b!138977) (not d!43251) b_and!8659 (not b!138963) (not bm!15347) (not bm!15382) (not bm!15348) (not b!139035) (not bm!15341) (not d!43263) (not bm!15346) (not b!138940) (not b!139042) (not d!43247) (not bm!15381) (not bm!15342) (not b!138957) (not b!138979) (not mapNonEmpty!4804) (not b!138970) (not b!138937) tp_is_empty!2919 (not b_lambda!6217) (not d!43265) (not b!138816) b_and!8661 (not b!138828) (not bm!15362) (not bm!15358) (not b!138838) (not b!138978) (not bm!15356) (not bm!15351) (not b!138823) (not b_next!3005) (not bm!15340))
(check-sat b_and!8659 b_and!8661 (not b_next!3005) (not b_next!3007))
