; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15206 () Bool)

(assert start!15206)

(declare-fun b!146279 () Bool)

(declare-fun b_free!3109 () Bool)

(declare-fun b_next!3109 () Bool)

(assert (=> b!146279 (= b_free!3109 (not b_next!3109))))

(declare-fun tp!11830 () Bool)

(declare-fun b_and!9117 () Bool)

(assert (=> b!146279 (= tp!11830 b_and!9117)))

(declare-fun b!146282 () Bool)

(declare-fun b_free!3111 () Bool)

(declare-fun b_next!3111 () Bool)

(assert (=> b!146282 (= b_free!3111 (not b_next!3111))))

(declare-fun tp!11832 () Bool)

(declare-fun b_and!9119 () Bool)

(assert (=> b!146282 (= tp!11832 b_and!9119)))

(declare-fun mapIsEmpty!4985 () Bool)

(declare-fun mapRes!4985 () Bool)

(assert (=> mapIsEmpty!4985 mapRes!4985))

(declare-fun b!146265 () Bool)

(declare-fun e!95384 () Bool)

(declare-fun tp_is_empty!2971 () Bool)

(assert (=> b!146265 (= e!95384 tp_is_empty!2971)))

(declare-fun b!146266 () Bool)

(declare-fun e!95373 () Bool)

(assert (=> b!146266 (= e!95373 tp_is_empty!2971)))

(declare-fun mapNonEmpty!4985 () Bool)

(declare-fun mapRes!4986 () Bool)

(declare-fun tp!11829 () Bool)

(declare-fun e!95381 () Bool)

(assert (=> mapNonEmpty!4985 (= mapRes!4986 (and tp!11829 e!95381))))

(declare-datatypes ((V!3609 0))(
  ( (V!3610 (val!1530 Int)) )
))
(declare-datatypes ((ValueCell!1142 0))(
  ( (ValueCellFull!1142 (v!3343 V!3609)) (EmptyCell!1142) )
))
(declare-fun mapValue!4985 () ValueCell!1142)

(declare-datatypes ((array!4967 0))(
  ( (array!4968 (arr!2344 (Array (_ BitVec 32) (_ BitVec 64))) (size!2621 (_ BitVec 32))) )
))
(declare-datatypes ((array!4969 0))(
  ( (array!4970 (arr!2345 (Array (_ BitVec 32) ValueCell!1142)) (size!2622 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1192 0))(
  ( (LongMapFixedSize!1193 (defaultEntry!3012 Int) (mask!7387 (_ BitVec 32)) (extraKeys!2757 (_ BitVec 32)) (zeroValue!2857 V!3609) (minValue!2857 V!3609) (_size!645 (_ BitVec 32)) (_keys!4780 array!4967) (_values!2995 array!4969) (_vacant!645 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1192)

(declare-fun mapKey!4986 () (_ BitVec 32))

(declare-fun mapRest!4985 () (Array (_ BitVec 32) ValueCell!1142))

(assert (=> mapNonEmpty!4985 (= (arr!2345 (_values!2995 newMap!16)) (store mapRest!4985 mapKey!4986 mapValue!4985))))

(declare-fun b!146267 () Bool)

(assert (=> b!146267 (= e!95381 tp_is_empty!2971)))

(declare-fun b!146268 () Bool)

(declare-fun e!95374 () Bool)

(declare-fun e!95380 () Bool)

(assert (=> b!146268 (= e!95374 e!95380)))

(declare-fun res!69548 () Bool)

(assert (=> b!146268 (=> (not res!69548) (not e!95380))))

(declare-datatypes ((Cell!966 0))(
  ( (Cell!967 (v!3344 LongMapFixedSize!1192)) )
))
(declare-datatypes ((LongMap!966 0))(
  ( (LongMap!967 (underlying!494 Cell!966)) )
))
(declare-fun thiss!992 () LongMap!966)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!146268 (= res!69548 (and (not (= (select (arr!2344 (_keys!4780 (v!3344 (underlying!494 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2344 (_keys!4780 (v!3344 (underlying!494 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!76768 () V!3609)

(declare-fun get!1565 (ValueCell!1142 V!3609) V!3609)

(declare-fun dynLambda!448 (Int (_ BitVec 64)) V!3609)

(assert (=> b!146268 (= lt!76768 (get!1565 (select (arr!2345 (_values!2995 (v!3344 (underlying!494 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!3012 (v!3344 (underlying!494 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!146269 () Bool)

(declare-fun res!69549 () Bool)

(declare-fun e!95383 () Bool)

(assert (=> b!146269 (=> (not res!69549) (not e!95383))))

(assert (=> b!146269 (= res!69549 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7387 newMap!16)) (_size!645 (v!3344 (underlying!494 thiss!992)))))))

(declare-fun b!146270 () Bool)

(declare-fun res!69547 () Bool)

(assert (=> b!146270 (=> (not res!69547) (not e!95383))))

(assert (=> b!146270 (= res!69547 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2621 (_keys!4780 (v!3344 (underlying!494 thiss!992)))))))))

(declare-fun mapNonEmpty!4986 () Bool)

(declare-fun tp!11831 () Bool)

(declare-fun e!95376 () Bool)

(assert (=> mapNonEmpty!4986 (= mapRes!4985 (and tp!11831 e!95376))))

(declare-fun mapRest!4986 () (Array (_ BitVec 32) ValueCell!1142))

(declare-fun mapValue!4986 () ValueCell!1142)

(declare-fun mapKey!4985 () (_ BitVec 32))

(assert (=> mapNonEmpty!4986 (= (arr!2345 (_values!2995 (v!3344 (underlying!494 thiss!992)))) (store mapRest!4986 mapKey!4985 mapValue!4986))))

(declare-fun b!146271 () Bool)

(declare-fun e!95382 () Bool)

(declare-fun e!95369 () Bool)

(assert (=> b!146271 (= e!95382 e!95369)))

(declare-fun res!69551 () Bool)

(assert (=> start!15206 (=> (not res!69551) (not e!95383))))

(declare-fun valid!584 (LongMap!966) Bool)

(assert (=> start!15206 (= res!69551 (valid!584 thiss!992))))

(assert (=> start!15206 e!95383))

(declare-fun e!95371 () Bool)

(assert (=> start!15206 e!95371))

(assert (=> start!15206 true))

(declare-fun e!95377 () Bool)

(assert (=> start!15206 e!95377))

(declare-fun b!146272 () Bool)

(declare-datatypes ((Unit!4616 0))(
  ( (Unit!4617) )
))
(declare-fun e!95372 () Unit!4616)

(declare-fun Unit!4618 () Unit!4616)

(assert (=> b!146272 (= e!95372 Unit!4618)))

(declare-fun b!146273 () Bool)

(assert (=> b!146273 (= e!95376 tp_is_empty!2971)))

(declare-fun b!146274 () Bool)

(assert (=> b!146274 (= e!95371 e!95382)))

(declare-fun b!146275 () Bool)

(declare-fun e!95375 () Bool)

(assert (=> b!146275 (= e!95375 (and e!95373 mapRes!4985))))

(declare-fun condMapEmpty!4986 () Bool)

(declare-fun mapDefault!4986 () ValueCell!1142)

(assert (=> b!146275 (= condMapEmpty!4986 (= (arr!2345 (_values!2995 (v!3344 (underlying!494 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1142)) mapDefault!4986)))))

(declare-fun b!146276 () Bool)

(declare-fun Unit!4619 () Unit!4616)

(assert (=> b!146276 (= e!95372 Unit!4619)))

(declare-fun lt!76776 () Unit!4616)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!157 (array!4967 array!4969 (_ BitVec 32) (_ BitVec 32) V!3609 V!3609 (_ BitVec 64) (_ BitVec 32) Int) Unit!4616)

(assert (=> b!146276 (= lt!76776 (lemmaListMapContainsThenArrayContainsFrom!157 (_keys!4780 (v!3344 (underlying!494 thiss!992))) (_values!2995 (v!3344 (underlying!494 thiss!992))) (mask!7387 (v!3344 (underlying!494 thiss!992))) (extraKeys!2757 (v!3344 (underlying!494 thiss!992))) (zeroValue!2857 (v!3344 (underlying!494 thiss!992))) (minValue!2857 (v!3344 (underlying!494 thiss!992))) (select (arr!2344 (_keys!4780 (v!3344 (underlying!494 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3012 (v!3344 (underlying!494 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!146276 (arrayContainsKey!0 (_keys!4780 (v!3344 (underlying!494 thiss!992))) (select (arr!2344 (_keys!4780 (v!3344 (underlying!494 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!76766 () Unit!4616)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4967 (_ BitVec 32) (_ BitVec 32)) Unit!4616)

(assert (=> b!146276 (= lt!76766 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4780 (v!3344 (underlying!494 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1770 0))(
  ( (Nil!1767) (Cons!1766 (h!2374 (_ BitVec 64)) (t!6454 List!1770)) )
))
(declare-fun arrayNoDuplicates!0 (array!4967 (_ BitVec 32) List!1770) Bool)

(assert (=> b!146276 (arrayNoDuplicates!0 (_keys!4780 (v!3344 (underlying!494 thiss!992))) from!355 Nil!1767)))

(declare-fun lt!76774 () Unit!4616)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4967 (_ BitVec 32) (_ BitVec 64) List!1770) Unit!4616)

(assert (=> b!146276 (= lt!76774 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4780 (v!3344 (underlying!494 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2344 (_keys!4780 (v!3344 (underlying!494 thiss!992)))) from!355) (Cons!1766 (select (arr!2344 (_keys!4780 (v!3344 (underlying!494 thiss!992)))) from!355) Nil!1767)))))

(assert (=> b!146276 false))

(declare-fun mapIsEmpty!4986 () Bool)

(assert (=> mapIsEmpty!4986 mapRes!4986))

(declare-fun b!146277 () Bool)

(declare-fun res!69553 () Bool)

(assert (=> b!146277 (=> (not res!69553) (not e!95383))))

(declare-fun valid!585 (LongMapFixedSize!1192) Bool)

(assert (=> b!146277 (= res!69553 (valid!585 newMap!16))))

(declare-fun b!146278 () Bool)

(assert (=> b!146278 (= e!95383 e!95374)))

(declare-fun res!69552 () Bool)

(assert (=> b!146278 (=> (not res!69552) (not e!95374))))

(declare-datatypes ((tuple2!2716 0))(
  ( (tuple2!2717 (_1!1369 (_ BitVec 64)) (_2!1369 V!3609)) )
))
(declare-datatypes ((List!1771 0))(
  ( (Nil!1768) (Cons!1767 (h!2375 tuple2!2716) (t!6455 List!1771)) )
))
(declare-datatypes ((ListLongMap!1743 0))(
  ( (ListLongMap!1744 (toList!887 List!1771)) )
))
(declare-fun lt!76777 () ListLongMap!1743)

(declare-fun lt!76773 () ListLongMap!1743)

(assert (=> b!146278 (= res!69552 (= lt!76777 lt!76773))))

(declare-fun map!1450 (LongMapFixedSize!1192) ListLongMap!1743)

(assert (=> b!146278 (= lt!76773 (map!1450 newMap!16))))

(declare-fun getCurrentListMap!546 (array!4967 array!4969 (_ BitVec 32) (_ BitVec 32) V!3609 V!3609 (_ BitVec 32) Int) ListLongMap!1743)

(assert (=> b!146278 (= lt!76777 (getCurrentListMap!546 (_keys!4780 (v!3344 (underlying!494 thiss!992))) (_values!2995 (v!3344 (underlying!494 thiss!992))) (mask!7387 (v!3344 (underlying!494 thiss!992))) (extraKeys!2757 (v!3344 (underlying!494 thiss!992))) (zeroValue!2857 (v!3344 (underlying!494 thiss!992))) (minValue!2857 (v!3344 (underlying!494 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3012 (v!3344 (underlying!494 thiss!992)))))))

(declare-fun array_inv!1501 (array!4967) Bool)

(declare-fun array_inv!1502 (array!4969) Bool)

(assert (=> b!146279 (= e!95369 (and tp!11830 tp_is_empty!2971 (array_inv!1501 (_keys!4780 (v!3344 (underlying!494 thiss!992)))) (array_inv!1502 (_values!2995 (v!3344 (underlying!494 thiss!992)))) e!95375))))

(declare-fun b!146280 () Bool)

(declare-fun e!95385 () Bool)

(assert (=> b!146280 (= e!95380 e!95385)))

(declare-fun res!69550 () Bool)

(assert (=> b!146280 (=> (not res!69550) (not e!95385))))

(declare-datatypes ((tuple2!2718 0))(
  ( (tuple2!2719 (_1!1370 Bool) (_2!1370 LongMapFixedSize!1192)) )
))
(declare-fun lt!76772 () tuple2!2718)

(assert (=> b!146280 (= res!69550 (and (_1!1370 lt!76772) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!76769 () Unit!4616)

(assert (=> b!146280 (= lt!76769 e!95372)))

(declare-fun c!27679 () Bool)

(declare-fun contains!935 (ListLongMap!1743 (_ BitVec 64)) Bool)

(assert (=> b!146280 (= c!27679 (contains!935 lt!76773 (select (arr!2344 (_keys!4780 (v!3344 (underlying!494 thiss!992)))) from!355)))))

(declare-fun update!222 (LongMapFixedSize!1192 (_ BitVec 64) V!3609) tuple2!2718)

(assert (=> b!146280 (= lt!76772 (update!222 newMap!16 (select (arr!2344 (_keys!4780 (v!3344 (underlying!494 thiss!992)))) from!355) lt!76768))))

(declare-fun b!146281 () Bool)

(declare-fun e!95379 () Bool)

(assert (=> b!146281 (= e!95379 (and e!95384 mapRes!4986))))

(declare-fun condMapEmpty!4985 () Bool)

(declare-fun mapDefault!4985 () ValueCell!1142)

(assert (=> b!146281 (= condMapEmpty!4985 (= (arr!2345 (_values!2995 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1142)) mapDefault!4985)))))

(assert (=> b!146282 (= e!95377 (and tp!11832 tp_is_empty!2971 (array_inv!1501 (_keys!4780 newMap!16)) (array_inv!1502 (_values!2995 newMap!16)) e!95379))))

(declare-fun b!146283 () Bool)

(assert (=> b!146283 (= e!95385 (not true))))

(declare-fun lt!76775 () ListLongMap!1743)

(declare-fun lt!76771 () tuple2!2716)

(declare-fun lt!76767 () tuple2!2716)

(declare-fun +!172 (ListLongMap!1743 tuple2!2716) ListLongMap!1743)

(assert (=> b!146283 (= (+!172 (+!172 lt!76775 lt!76771) lt!76767) (+!172 (+!172 lt!76775 lt!76767) lt!76771))))

(assert (=> b!146283 (= lt!76767 (tuple2!2717 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2857 (v!3344 (underlying!494 thiss!992)))))))

(assert (=> b!146283 (= lt!76771 (tuple2!2717 (select (arr!2344 (_keys!4780 (v!3344 (underlying!494 thiss!992)))) from!355) lt!76768))))

(declare-fun lt!76770 () Unit!4616)

(declare-fun addCommutativeForDiffKeys!65 (ListLongMap!1743 (_ BitVec 64) V!3609 (_ BitVec 64) V!3609) Unit!4616)

(assert (=> b!146283 (= lt!76770 (addCommutativeForDiffKeys!65 lt!76775 (select (arr!2344 (_keys!4780 (v!3344 (underlying!494 thiss!992)))) from!355) lt!76768 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2857 (v!3344 (underlying!494 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!138 (array!4967 array!4969 (_ BitVec 32) (_ BitVec 32) V!3609 V!3609 (_ BitVec 32) Int) ListLongMap!1743)

(assert (=> b!146283 (= lt!76775 (getCurrentListMapNoExtraKeys!138 (_keys!4780 (v!3344 (underlying!494 thiss!992))) (_values!2995 (v!3344 (underlying!494 thiss!992))) (mask!7387 (v!3344 (underlying!494 thiss!992))) (extraKeys!2757 (v!3344 (underlying!494 thiss!992))) (zeroValue!2857 (v!3344 (underlying!494 thiss!992))) (minValue!2857 (v!3344 (underlying!494 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3012 (v!3344 (underlying!494 thiss!992)))))))

(assert (= (and start!15206 res!69551) b!146270))

(assert (= (and b!146270 res!69547) b!146277))

(assert (= (and b!146277 res!69553) b!146269))

(assert (= (and b!146269 res!69549) b!146278))

(assert (= (and b!146278 res!69552) b!146268))

(assert (= (and b!146268 res!69548) b!146280))

(assert (= (and b!146280 c!27679) b!146276))

(assert (= (and b!146280 (not c!27679)) b!146272))

(assert (= (and b!146280 res!69550) b!146283))

(assert (= (and b!146275 condMapEmpty!4986) mapIsEmpty!4985))

(assert (= (and b!146275 (not condMapEmpty!4986)) mapNonEmpty!4986))

(get-info :version)

(assert (= (and mapNonEmpty!4986 ((_ is ValueCellFull!1142) mapValue!4986)) b!146273))

(assert (= (and b!146275 ((_ is ValueCellFull!1142) mapDefault!4986)) b!146266))

(assert (= b!146279 b!146275))

(assert (= b!146271 b!146279))

(assert (= b!146274 b!146271))

(assert (= start!15206 b!146274))

(assert (= (and b!146281 condMapEmpty!4985) mapIsEmpty!4986))

(assert (= (and b!146281 (not condMapEmpty!4985)) mapNonEmpty!4985))

(assert (= (and mapNonEmpty!4985 ((_ is ValueCellFull!1142) mapValue!4985)) b!146267))

(assert (= (and b!146281 ((_ is ValueCellFull!1142) mapDefault!4985)) b!146265))

(assert (= b!146282 b!146281))

(assert (= start!15206 b!146282))

(declare-fun b_lambda!6537 () Bool)

(assert (=> (not b_lambda!6537) (not b!146268)))

(declare-fun t!6451 () Bool)

(declare-fun tb!2645 () Bool)

(assert (=> (and b!146279 (= (defaultEntry!3012 (v!3344 (underlying!494 thiss!992))) (defaultEntry!3012 (v!3344 (underlying!494 thiss!992)))) t!6451) tb!2645))

(declare-fun result!4327 () Bool)

(assert (=> tb!2645 (= result!4327 tp_is_empty!2971)))

(assert (=> b!146268 t!6451))

(declare-fun b_and!9121 () Bool)

(assert (= b_and!9117 (and (=> t!6451 result!4327) b_and!9121)))

(declare-fun tb!2647 () Bool)

(declare-fun t!6453 () Bool)

(assert (=> (and b!146282 (= (defaultEntry!3012 newMap!16) (defaultEntry!3012 (v!3344 (underlying!494 thiss!992)))) t!6453) tb!2647))

(declare-fun result!4331 () Bool)

(assert (= result!4331 result!4327))

(assert (=> b!146268 t!6453))

(declare-fun b_and!9123 () Bool)

(assert (= b_and!9119 (and (=> t!6453 result!4331) b_and!9123)))

(declare-fun m!175723 () Bool)

(assert (=> start!15206 m!175723))

(declare-fun m!175725 () Bool)

(assert (=> b!146276 m!175725))

(declare-fun m!175727 () Bool)

(assert (=> b!146276 m!175727))

(declare-fun m!175729 () Bool)

(assert (=> b!146276 m!175729))

(declare-fun m!175731 () Bool)

(assert (=> b!146276 m!175731))

(assert (=> b!146276 m!175729))

(assert (=> b!146276 m!175729))

(declare-fun m!175733 () Bool)

(assert (=> b!146276 m!175733))

(assert (=> b!146276 m!175729))

(declare-fun m!175735 () Bool)

(assert (=> b!146276 m!175735))

(declare-fun m!175737 () Bool)

(assert (=> b!146278 m!175737))

(declare-fun m!175739 () Bool)

(assert (=> b!146278 m!175739))

(declare-fun m!175741 () Bool)

(assert (=> b!146277 m!175741))

(declare-fun m!175743 () Bool)

(assert (=> mapNonEmpty!4986 m!175743))

(declare-fun m!175745 () Bool)

(assert (=> b!146279 m!175745))

(declare-fun m!175747 () Bool)

(assert (=> b!146279 m!175747))

(assert (=> b!146268 m!175729))

(declare-fun m!175749 () Bool)

(assert (=> b!146268 m!175749))

(declare-fun m!175751 () Bool)

(assert (=> b!146268 m!175751))

(assert (=> b!146268 m!175749))

(assert (=> b!146268 m!175751))

(declare-fun m!175753 () Bool)

(assert (=> b!146268 m!175753))

(declare-fun m!175755 () Bool)

(assert (=> b!146282 m!175755))

(declare-fun m!175757 () Bool)

(assert (=> b!146282 m!175757))

(assert (=> b!146280 m!175729))

(assert (=> b!146280 m!175729))

(declare-fun m!175759 () Bool)

(assert (=> b!146280 m!175759))

(assert (=> b!146280 m!175729))

(declare-fun m!175761 () Bool)

(assert (=> b!146280 m!175761))

(declare-fun m!175763 () Bool)

(assert (=> mapNonEmpty!4985 m!175763))

(declare-fun m!175765 () Bool)

(assert (=> b!146283 m!175765))

(assert (=> b!146283 m!175729))

(declare-fun m!175767 () Bool)

(assert (=> b!146283 m!175767))

(assert (=> b!146283 m!175729))

(declare-fun m!175769 () Bool)

(assert (=> b!146283 m!175769))

(declare-fun m!175771 () Bool)

(assert (=> b!146283 m!175771))

(assert (=> b!146283 m!175765))

(declare-fun m!175773 () Bool)

(assert (=> b!146283 m!175773))

(assert (=> b!146283 m!175769))

(declare-fun m!175775 () Bool)

(assert (=> b!146283 m!175775))

(check-sat (not b!146279) (not b_next!3111) (not b!146268) b_and!9123 (not b_lambda!6537) (not b!146278) (not b!146276) (not b!146283) (not start!15206) b_and!9121 (not mapNonEmpty!4985) (not b!146280) (not b_next!3109) tp_is_empty!2971 (not b!146277) (not b!146282) (not mapNonEmpty!4986))
(check-sat b_and!9121 b_and!9123 (not b_next!3109) (not b_next!3111))
