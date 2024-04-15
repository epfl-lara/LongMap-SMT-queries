; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15194 () Bool)

(assert start!15194)

(declare-fun b!145956 () Bool)

(declare-fun b_free!3085 () Bool)

(declare-fun b_next!3085 () Bool)

(assert (=> b!145956 (= b_free!3085 (not b_next!3085))))

(declare-fun tp!11757 () Bool)

(declare-fun b_and!9069 () Bool)

(assert (=> b!145956 (= tp!11757 b_and!9069)))

(declare-fun b!145953 () Bool)

(declare-fun b_free!3087 () Bool)

(declare-fun b_next!3087 () Bool)

(assert (=> b!145953 (= b_free!3087 (not b_next!3087))))

(declare-fun tp!11758 () Bool)

(declare-fun b_and!9071 () Bool)

(assert (=> b!145953 (= tp!11758 b_and!9071)))

(declare-fun b!145941 () Bool)

(declare-fun e!95089 () Bool)

(declare-fun tp_is_empty!2959 () Bool)

(assert (=> b!145941 (= e!95089 tp_is_empty!2959)))

(declare-fun b!145943 () Bool)

(declare-fun e!95093 () Bool)

(declare-fun mapRes!4949 () Bool)

(assert (=> b!145943 (= e!95093 (and e!95089 mapRes!4949))))

(declare-fun condMapEmpty!4950 () Bool)

(declare-datatypes ((V!3593 0))(
  ( (V!3594 (val!1524 Int)) )
))
(declare-datatypes ((array!4943 0))(
  ( (array!4944 (arr!2332 (Array (_ BitVec 32) (_ BitVec 64))) (size!2609 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1136 0))(
  ( (ValueCellFull!1136 (v!3333 V!3593)) (EmptyCell!1136) )
))
(declare-datatypes ((array!4945 0))(
  ( (array!4946 (arr!2333 (Array (_ BitVec 32) ValueCell!1136)) (size!2610 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1180 0))(
  ( (LongMapFixedSize!1181 (defaultEntry!3006 Int) (mask!7377 (_ BitVec 32)) (extraKeys!2751 (_ BitVec 32)) (zeroValue!2851 V!3593) (minValue!2851 V!3593) (_size!639 (_ BitVec 32)) (_keys!4774 array!4943) (_values!2989 array!4945) (_vacant!639 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!958 0))(
  ( (Cell!959 (v!3334 LongMapFixedSize!1180)) )
))
(declare-datatypes ((LongMap!958 0))(
  ( (LongMap!959 (underlying!490 Cell!958)) )
))
(declare-fun thiss!992 () LongMap!958)

(declare-fun mapDefault!4950 () ValueCell!1136)

(assert (=> b!145943 (= condMapEmpty!4950 (= (arr!2333 (_values!2989 (v!3334 (underlying!490 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1136)) mapDefault!4950)))))

(declare-fun b!145944 () Bool)

(declare-fun e!95090 () Bool)

(assert (=> b!145944 (= e!95090 tp_is_empty!2959)))

(declare-fun mapIsEmpty!4949 () Bool)

(assert (=> mapIsEmpty!4949 mapRes!4949))

(declare-fun b!145945 () Bool)

(declare-fun e!95097 () Bool)

(declare-fun e!95100 () Bool)

(assert (=> b!145945 (= e!95097 e!95100)))

(declare-fun res!69441 () Bool)

(assert (=> b!145945 (=> (not res!69441) (not e!95100))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2702 0))(
  ( (tuple2!2703 (_1!1362 (_ BitVec 64)) (_2!1362 V!3593)) )
))
(declare-datatypes ((List!1763 0))(
  ( (Nil!1760) (Cons!1759 (h!2367 tuple2!2702) (t!6423 List!1763)) )
))
(declare-datatypes ((ListLongMap!1735 0))(
  ( (ListLongMap!1736 (toList!883 List!1763)) )
))
(declare-fun lt!76633 () ListLongMap!1735)

(declare-fun contains!932 (ListLongMap!1735 (_ BitVec 64)) Bool)

(assert (=> b!145945 (= res!69441 (contains!932 lt!76633 (select (arr!2332 (_keys!4774 (v!3334 (underlying!490 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!1180)

(declare-datatypes ((tuple2!2704 0))(
  ( (tuple2!2705 (_1!1363 Bool) (_2!1363 LongMapFixedSize!1180)) )
))
(declare-fun lt!76629 () tuple2!2704)

(declare-fun update!219 (LongMapFixedSize!1180 (_ BitVec 64) V!3593) tuple2!2704)

(declare-fun get!1558 (ValueCell!1136 V!3593) V!3593)

(declare-fun dynLambda!445 (Int (_ BitVec 64)) V!3593)

(assert (=> b!145945 (= lt!76629 (update!219 newMap!16 (select (arr!2332 (_keys!4774 (v!3334 (underlying!490 thiss!992)))) from!355) (get!1558 (select (arr!2333 (_values!2989 (v!3334 (underlying!490 thiss!992)))) from!355) (dynLambda!445 (defaultEntry!3006 (v!3334 (underlying!490 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!145946 () Bool)

(assert (=> b!145946 (= e!95100 (not true))))

(assert (=> b!145946 false))

(declare-datatypes ((Unit!4608 0))(
  ( (Unit!4609) )
))
(declare-fun lt!76628 () Unit!4608)

(declare-datatypes ((List!1764 0))(
  ( (Nil!1761) (Cons!1760 (h!2368 (_ BitVec 64)) (t!6424 List!1764)) )
))
(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4943 (_ BitVec 32) (_ BitVec 64) List!1764) Unit!4608)

(assert (=> b!145946 (= lt!76628 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4774 (v!3334 (underlying!490 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2332 (_keys!4774 (v!3334 (underlying!490 thiss!992)))) from!355) (Cons!1760 (select (arr!2332 (_keys!4774 (v!3334 (underlying!490 thiss!992)))) from!355) Nil!1761)))))

(declare-fun arrayNoDuplicates!0 (array!4943 (_ BitVec 32) List!1764) Bool)

(assert (=> b!145946 (arrayNoDuplicates!0 (_keys!4774 (v!3334 (underlying!490 thiss!992))) from!355 Nil!1761)))

(declare-fun lt!76631 () Unit!4608)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4943 (_ BitVec 32) (_ BitVec 32)) Unit!4608)

(assert (=> b!145946 (= lt!76631 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4774 (v!3334 (underlying!490 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!145946 (arrayContainsKey!0 (_keys!4774 (v!3334 (underlying!490 thiss!992))) (select (arr!2332 (_keys!4774 (v!3334 (underlying!490 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!76630 () Unit!4608)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!154 (array!4943 array!4945 (_ BitVec 32) (_ BitVec 32) V!3593 V!3593 (_ BitVec 64) (_ BitVec 32) Int) Unit!4608)

(assert (=> b!145946 (= lt!76630 (lemmaListMapContainsThenArrayContainsFrom!154 (_keys!4774 (v!3334 (underlying!490 thiss!992))) (_values!2989 (v!3334 (underlying!490 thiss!992))) (mask!7377 (v!3334 (underlying!490 thiss!992))) (extraKeys!2751 (v!3334 (underlying!490 thiss!992))) (zeroValue!2851 (v!3334 (underlying!490 thiss!992))) (minValue!2851 (v!3334 (underlying!490 thiss!992))) (select (arr!2332 (_keys!4774 (v!3334 (underlying!490 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3006 (v!3334 (underlying!490 thiss!992)))))))

(declare-fun b!145947 () Bool)

(declare-fun res!69440 () Bool)

(declare-fun e!95087 () Bool)

(assert (=> b!145947 (=> (not res!69440) (not e!95087))))

(declare-fun valid!577 (LongMapFixedSize!1180) Bool)

(assert (=> b!145947 (= res!69440 (valid!577 newMap!16))))

(declare-fun b!145948 () Bool)

(declare-fun e!95088 () Bool)

(declare-fun e!95095 () Bool)

(assert (=> b!145948 (= e!95088 e!95095)))

(declare-fun b!145949 () Bool)

(declare-fun res!69439 () Bool)

(assert (=> b!145949 (=> (not res!69439) (not e!95087))))

(assert (=> b!145949 (= res!69439 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2609 (_keys!4774 (v!3334 (underlying!490 thiss!992)))))))))

(declare-fun b!145950 () Bool)

(declare-fun e!95092 () Bool)

(assert (=> b!145950 (= e!95092 e!95088)))

(declare-fun b!145951 () Bool)

(declare-fun res!69438 () Bool)

(assert (=> b!145951 (=> (not res!69438) (not e!95087))))

(assert (=> b!145951 (= res!69438 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7377 newMap!16)) (_size!639 (v!3334 (underlying!490 thiss!992)))))))

(declare-fun b!145952 () Bool)

(declare-fun e!95094 () Bool)

(assert (=> b!145952 (= e!95094 tp_is_empty!2959)))

(declare-fun e!95099 () Bool)

(declare-fun e!95086 () Bool)

(declare-fun array_inv!1495 (array!4943) Bool)

(declare-fun array_inv!1496 (array!4945) Bool)

(assert (=> b!145953 (= e!95086 (and tp!11758 tp_is_empty!2959 (array_inv!1495 (_keys!4774 newMap!16)) (array_inv!1496 (_values!2989 newMap!16)) e!95099))))

(declare-fun mapNonEmpty!4949 () Bool)

(declare-fun tp!11760 () Bool)

(assert (=> mapNonEmpty!4949 (= mapRes!4949 (and tp!11760 e!95090))))

(declare-fun mapRest!4949 () (Array (_ BitVec 32) ValueCell!1136))

(declare-fun mapValue!4949 () ValueCell!1136)

(declare-fun mapKey!4949 () (_ BitVec 32))

(assert (=> mapNonEmpty!4949 (= (arr!2333 (_values!2989 (v!3334 (underlying!490 thiss!992)))) (store mapRest!4949 mapKey!4949 mapValue!4949))))

(declare-fun b!145954 () Bool)

(assert (=> b!145954 (= e!95087 e!95097)))

(declare-fun res!69437 () Bool)

(assert (=> b!145954 (=> (not res!69437) (not e!95097))))

(declare-fun lt!76632 () ListLongMap!1735)

(assert (=> b!145954 (= res!69437 (and (= lt!76632 lt!76633) (not (= (select (arr!2332 (_keys!4774 (v!3334 (underlying!490 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2332 (_keys!4774 (v!3334 (underlying!490 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1442 (LongMapFixedSize!1180) ListLongMap!1735)

(assert (=> b!145954 (= lt!76633 (map!1442 newMap!16))))

(declare-fun getCurrentListMap!542 (array!4943 array!4945 (_ BitVec 32) (_ BitVec 32) V!3593 V!3593 (_ BitVec 32) Int) ListLongMap!1735)

(assert (=> b!145954 (= lt!76632 (getCurrentListMap!542 (_keys!4774 (v!3334 (underlying!490 thiss!992))) (_values!2989 (v!3334 (underlying!490 thiss!992))) (mask!7377 (v!3334 (underlying!490 thiss!992))) (extraKeys!2751 (v!3334 (underlying!490 thiss!992))) (zeroValue!2851 (v!3334 (underlying!490 thiss!992))) (minValue!2851 (v!3334 (underlying!490 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3006 (v!3334 (underlying!490 thiss!992)))))))

(declare-fun b!145955 () Bool)

(declare-fun e!95091 () Bool)

(declare-fun mapRes!4950 () Bool)

(assert (=> b!145955 (= e!95099 (and e!95091 mapRes!4950))))

(declare-fun condMapEmpty!4949 () Bool)

(declare-fun mapDefault!4949 () ValueCell!1136)

(assert (=> b!145955 (= condMapEmpty!4949 (= (arr!2333 (_values!2989 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1136)) mapDefault!4949)))))

(declare-fun mapIsEmpty!4950 () Bool)

(assert (=> mapIsEmpty!4950 mapRes!4950))

(declare-fun b!145942 () Bool)

(assert (=> b!145942 (= e!95091 tp_is_empty!2959)))

(declare-fun res!69442 () Bool)

(assert (=> start!15194 (=> (not res!69442) (not e!95087))))

(declare-fun valid!578 (LongMap!958) Bool)

(assert (=> start!15194 (= res!69442 (valid!578 thiss!992))))

(assert (=> start!15194 e!95087))

(assert (=> start!15194 e!95092))

(assert (=> start!15194 true))

(assert (=> start!15194 e!95086))

(assert (=> b!145956 (= e!95095 (and tp!11757 tp_is_empty!2959 (array_inv!1495 (_keys!4774 (v!3334 (underlying!490 thiss!992)))) (array_inv!1496 (_values!2989 (v!3334 (underlying!490 thiss!992)))) e!95093))))

(declare-fun mapNonEmpty!4950 () Bool)

(declare-fun tp!11759 () Bool)

(assert (=> mapNonEmpty!4950 (= mapRes!4950 (and tp!11759 e!95094))))

(declare-fun mapRest!4950 () (Array (_ BitVec 32) ValueCell!1136))

(declare-fun mapKey!4950 () (_ BitVec 32))

(declare-fun mapValue!4950 () ValueCell!1136)

(assert (=> mapNonEmpty!4950 (= (arr!2333 (_values!2989 newMap!16)) (store mapRest!4950 mapKey!4950 mapValue!4950))))

(assert (= (and start!15194 res!69442) b!145949))

(assert (= (and b!145949 res!69439) b!145947))

(assert (= (and b!145947 res!69440) b!145951))

(assert (= (and b!145951 res!69438) b!145954))

(assert (= (and b!145954 res!69437) b!145945))

(assert (= (and b!145945 res!69441) b!145946))

(assert (= (and b!145943 condMapEmpty!4950) mapIsEmpty!4949))

(assert (= (and b!145943 (not condMapEmpty!4950)) mapNonEmpty!4949))

(get-info :version)

(assert (= (and mapNonEmpty!4949 ((_ is ValueCellFull!1136) mapValue!4949)) b!145944))

(assert (= (and b!145943 ((_ is ValueCellFull!1136) mapDefault!4950)) b!145941))

(assert (= b!145956 b!145943))

(assert (= b!145948 b!145956))

(assert (= b!145950 b!145948))

(assert (= start!15194 b!145950))

(assert (= (and b!145955 condMapEmpty!4949) mapIsEmpty!4950))

(assert (= (and b!145955 (not condMapEmpty!4949)) mapNonEmpty!4950))

(assert (= (and mapNonEmpty!4950 ((_ is ValueCellFull!1136) mapValue!4950)) b!145952))

(assert (= (and b!145955 ((_ is ValueCellFull!1136) mapDefault!4949)) b!145942))

(assert (= b!145953 b!145955))

(assert (= start!15194 b!145953))

(declare-fun b_lambda!6525 () Bool)

(assert (=> (not b_lambda!6525) (not b!145945)))

(declare-fun t!6420 () Bool)

(declare-fun tb!2621 () Bool)

(assert (=> (and b!145956 (= (defaultEntry!3006 (v!3334 (underlying!490 thiss!992))) (defaultEntry!3006 (v!3334 (underlying!490 thiss!992)))) t!6420) tb!2621))

(declare-fun result!4291 () Bool)

(assert (=> tb!2621 (= result!4291 tp_is_empty!2959)))

(assert (=> b!145945 t!6420))

(declare-fun b_and!9073 () Bool)

(assert (= b_and!9069 (and (=> t!6420 result!4291) b_and!9073)))

(declare-fun tb!2623 () Bool)

(declare-fun t!6422 () Bool)

(assert (=> (and b!145953 (= (defaultEntry!3006 newMap!16) (defaultEntry!3006 (v!3334 (underlying!490 thiss!992)))) t!6422) tb!2623))

(declare-fun result!4295 () Bool)

(assert (= result!4295 result!4291))

(assert (=> b!145945 t!6422))

(declare-fun b_and!9075 () Bool)

(assert (= b_and!9071 (and (=> t!6422 result!4295) b_and!9075)))

(declare-fun m!175465 () Bool)

(assert (=> start!15194 m!175465))

(declare-fun m!175467 () Bool)

(assert (=> mapNonEmpty!4950 m!175467))

(declare-fun m!175469 () Bool)

(assert (=> b!145947 m!175469))

(declare-fun m!175471 () Bool)

(assert (=> b!145946 m!175471))

(declare-fun m!175473 () Bool)

(assert (=> b!145946 m!175473))

(declare-fun m!175475 () Bool)

(assert (=> b!145946 m!175475))

(declare-fun m!175477 () Bool)

(assert (=> b!145946 m!175477))

(assert (=> b!145946 m!175475))

(assert (=> b!145946 m!175475))

(declare-fun m!175479 () Bool)

(assert (=> b!145946 m!175479))

(assert (=> b!145946 m!175475))

(declare-fun m!175481 () Bool)

(assert (=> b!145946 m!175481))

(declare-fun m!175483 () Bool)

(assert (=> mapNonEmpty!4949 m!175483))

(assert (=> b!145954 m!175475))

(declare-fun m!175485 () Bool)

(assert (=> b!145954 m!175485))

(declare-fun m!175487 () Bool)

(assert (=> b!145954 m!175487))

(declare-fun m!175489 () Bool)

(assert (=> b!145953 m!175489))

(declare-fun m!175491 () Bool)

(assert (=> b!145953 m!175491))

(declare-fun m!175493 () Bool)

(assert (=> b!145956 m!175493))

(declare-fun m!175495 () Bool)

(assert (=> b!145956 m!175495))

(assert (=> b!145945 m!175475))

(declare-fun m!175497 () Bool)

(assert (=> b!145945 m!175497))

(declare-fun m!175499 () Bool)

(assert (=> b!145945 m!175499))

(declare-fun m!175501 () Bool)

(assert (=> b!145945 m!175501))

(declare-fun m!175503 () Bool)

(assert (=> b!145945 m!175503))

(assert (=> b!145945 m!175475))

(assert (=> b!145945 m!175501))

(assert (=> b!145945 m!175475))

(assert (=> b!145945 m!175503))

(declare-fun m!175505 () Bool)

(assert (=> b!145945 m!175505))

(assert (=> b!145945 m!175499))

(check-sat (not b!145947) (not b!145946) (not b!145954) (not b!145953) (not b_next!3085) b_and!9073 (not start!15194) tp_is_empty!2959 (not b!145956) b_and!9075 (not mapNonEmpty!4950) (not b_lambda!6525) (not b_next!3087) (not b!145945) (not mapNonEmpty!4949))
(check-sat b_and!9073 b_and!9075 (not b_next!3085) (not b_next!3087))
