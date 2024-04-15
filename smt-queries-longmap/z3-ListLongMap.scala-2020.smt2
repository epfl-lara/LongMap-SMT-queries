; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35182 () Bool)

(assert start!35182)

(declare-fun b_free!7789 () Bool)

(declare-fun b_next!7789 () Bool)

(assert (=> start!35182 (= b_free!7789 (not b_next!7789))))

(declare-fun tp!26958 () Bool)

(declare-fun b_and!15001 () Bool)

(assert (=> start!35182 (= tp!26958 b_and!15001)))

(declare-fun b!352586 () Bool)

(declare-fun res!195552 () Bool)

(declare-fun e!215895 () Bool)

(assert (=> b!352586 (=> (not res!195552) (not e!215895))))

(declare-datatypes ((array!19049 0))(
  ( (array!19050 (arr!9026 (Array (_ BitVec 32) (_ BitVec 64))) (size!9379 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19049)

(declare-datatypes ((List!5235 0))(
  ( (Nil!5232) (Cons!5231 (h!6087 (_ BitVec 64)) (t!10372 List!5235)) )
))
(declare-fun arrayNoDuplicates!0 (array!19049 (_ BitVec 32) List!5235) Bool)

(assert (=> b!352586 (= res!195552 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5232))))

(declare-fun b!352587 () Bool)

(declare-fun res!195551 () Bool)

(assert (=> b!352587 (=> (not res!195551) (not e!215895))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19049 (_ BitVec 32)) Bool)

(assert (=> b!352587 (= res!195551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!352588 () Bool)

(declare-datatypes ((SeekEntryResult!3474 0))(
  ( (MissingZero!3474 (index!16075 (_ BitVec 32))) (Found!3474 (index!16076 (_ BitVec 32))) (Intermediate!3474 (undefined!4286 Bool) (index!16077 (_ BitVec 32)) (x!35101 (_ BitVec 32))) (Undefined!3474) (MissingVacant!3474 (index!16078 (_ BitVec 32))) )
))
(declare-fun lt!165114 () SeekEntryResult!3474)

(get-info :version)

(assert (=> b!352588 (= e!215895 (and (not ((_ is Found!3474) lt!165114)) (not ((_ is MissingZero!3474) lt!165114)) (not ((_ is MissingVacant!3474) lt!165114)) (not ((_ is Undefined!3474) lt!165114))))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19049 (_ BitVec 32)) SeekEntryResult!3474)

(assert (=> b!352588 (= lt!165114 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!352589 () Bool)

(declare-fun e!215896 () Bool)

(declare-fun tp_is_empty!7741 () Bool)

(assert (=> b!352589 (= e!215896 tp_is_empty!7741)))

(declare-fun b!352590 () Bool)

(declare-fun e!215892 () Bool)

(assert (=> b!352590 (= e!215892 tp_is_empty!7741)))

(declare-fun b!352591 () Bool)

(declare-fun res!195550 () Bool)

(assert (=> b!352591 (=> (not res!195550) (not e!215895))))

(declare-datatypes ((V!11299 0))(
  ( (V!11300 (val!3915 Int)) )
))
(declare-fun zeroValue!1467 () V!11299)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3527 0))(
  ( (ValueCellFull!3527 (v!6100 V!11299)) (EmptyCell!3527) )
))
(declare-datatypes ((array!19051 0))(
  ( (array!19052 (arr!9027 (Array (_ BitVec 32) ValueCell!3527)) (size!9380 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19051)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11299)

(declare-datatypes ((tuple2!5620 0))(
  ( (tuple2!5621 (_1!2821 (_ BitVec 64)) (_2!2821 V!11299)) )
))
(declare-datatypes ((List!5236 0))(
  ( (Nil!5233) (Cons!5232 (h!6088 tuple2!5620) (t!10373 List!5236)) )
))
(declare-datatypes ((ListLongMap!4523 0))(
  ( (ListLongMap!4524 (toList!2277 List!5236)) )
))
(declare-fun contains!2361 (ListLongMap!4523 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1782 (array!19049 array!19051 (_ BitVec 32) (_ BitVec 32) V!11299 V!11299 (_ BitVec 32) Int) ListLongMap!4523)

(assert (=> b!352591 (= res!195550 (not (contains!2361 (getCurrentListMap!1782 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!352593 () Bool)

(declare-fun e!215894 () Bool)

(declare-fun mapRes!13095 () Bool)

(assert (=> b!352593 (= e!215894 (and e!215896 mapRes!13095))))

(declare-fun condMapEmpty!13095 () Bool)

(declare-fun mapDefault!13095 () ValueCell!3527)

(assert (=> b!352593 (= condMapEmpty!13095 (= (arr!9027 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3527)) mapDefault!13095)))))

(declare-fun mapIsEmpty!13095 () Bool)

(assert (=> mapIsEmpty!13095 mapRes!13095))

(declare-fun b!352594 () Bool)

(declare-fun res!195554 () Bool)

(assert (=> b!352594 (=> (not res!195554) (not e!215895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352594 (= res!195554 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!13095 () Bool)

(declare-fun tp!26957 () Bool)

(assert (=> mapNonEmpty!13095 (= mapRes!13095 (and tp!26957 e!215892))))

(declare-fun mapKey!13095 () (_ BitVec 32))

(declare-fun mapRest!13095 () (Array (_ BitVec 32) ValueCell!3527))

(declare-fun mapValue!13095 () ValueCell!3527)

(assert (=> mapNonEmpty!13095 (= (arr!9027 _values!1525) (store mapRest!13095 mapKey!13095 mapValue!13095))))

(declare-fun b!352592 () Bool)

(declare-fun res!195553 () Bool)

(assert (=> b!352592 (=> (not res!195553) (not e!215895))))

(assert (=> b!352592 (= res!195553 (and (= (size!9380 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9379 _keys!1895) (size!9380 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!195549 () Bool)

(assert (=> start!35182 (=> (not res!195549) (not e!215895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35182 (= res!195549 (validMask!0 mask!2385))))

(assert (=> start!35182 e!215895))

(assert (=> start!35182 true))

(assert (=> start!35182 tp_is_empty!7741))

(assert (=> start!35182 tp!26958))

(declare-fun array_inv!6684 (array!19051) Bool)

(assert (=> start!35182 (and (array_inv!6684 _values!1525) e!215894)))

(declare-fun array_inv!6685 (array!19049) Bool)

(assert (=> start!35182 (array_inv!6685 _keys!1895)))

(assert (= (and start!35182 res!195549) b!352592))

(assert (= (and b!352592 res!195553) b!352587))

(assert (= (and b!352587 res!195551) b!352586))

(assert (= (and b!352586 res!195552) b!352594))

(assert (= (and b!352594 res!195554) b!352591))

(assert (= (and b!352591 res!195550) b!352588))

(assert (= (and b!352593 condMapEmpty!13095) mapIsEmpty!13095))

(assert (= (and b!352593 (not condMapEmpty!13095)) mapNonEmpty!13095))

(assert (= (and mapNonEmpty!13095 ((_ is ValueCellFull!3527) mapValue!13095)) b!352590))

(assert (= (and b!352593 ((_ is ValueCellFull!3527) mapDefault!13095)) b!352589))

(assert (= start!35182 b!352593))

(declare-fun m!351657 () Bool)

(assert (=> b!352594 m!351657))

(declare-fun m!351659 () Bool)

(assert (=> b!352586 m!351659))

(declare-fun m!351661 () Bool)

(assert (=> b!352588 m!351661))

(declare-fun m!351663 () Bool)

(assert (=> b!352587 m!351663))

(declare-fun m!351665 () Bool)

(assert (=> b!352591 m!351665))

(assert (=> b!352591 m!351665))

(declare-fun m!351667 () Bool)

(assert (=> b!352591 m!351667))

(declare-fun m!351669 () Bool)

(assert (=> start!35182 m!351669))

(declare-fun m!351671 () Bool)

(assert (=> start!35182 m!351671))

(declare-fun m!351673 () Bool)

(assert (=> start!35182 m!351673))

(declare-fun m!351675 () Bool)

(assert (=> mapNonEmpty!13095 m!351675))

(check-sat (not start!35182) (not b!352587) (not b!352591) (not b!352588) (not b_next!7789) (not b!352586) (not b!352594) tp_is_empty!7741 (not mapNonEmpty!13095) b_and!15001)
(check-sat b_and!15001 (not b_next!7789))
(get-model)

(declare-fun b!352659 () Bool)

(declare-fun e!215936 () Bool)

(declare-fun e!215935 () Bool)

(assert (=> b!352659 (= e!215936 e!215935)))

(declare-fun res!195598 () Bool)

(assert (=> b!352659 (=> (not res!195598) (not e!215935))))

(declare-fun e!215937 () Bool)

(assert (=> b!352659 (= res!195598 (not e!215937))))

(declare-fun res!195599 () Bool)

(assert (=> b!352659 (=> (not res!195599) (not e!215937))))

(assert (=> b!352659 (= res!195599 (validKeyInArray!0 (select (arr!9026 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71361 () Bool)

(declare-fun res!195597 () Bool)

(assert (=> d!71361 (=> res!195597 e!215936)))

(assert (=> d!71361 (= res!195597 (bvsge #b00000000000000000000000000000000 (size!9379 _keys!1895)))))

(assert (=> d!71361 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5232) e!215936)))

(declare-fun bm!27062 () Bool)

(declare-fun call!27065 () Bool)

(declare-fun c!53549 () Bool)

(assert (=> bm!27062 (= call!27065 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53549 (Cons!5231 (select (arr!9026 _keys!1895) #b00000000000000000000000000000000) Nil!5232) Nil!5232)))))

(declare-fun b!352660 () Bool)

(declare-fun e!215938 () Bool)

(assert (=> b!352660 (= e!215938 call!27065)))

(declare-fun b!352661 () Bool)

(assert (=> b!352661 (= e!215935 e!215938)))

(assert (=> b!352661 (= c!53549 (validKeyInArray!0 (select (arr!9026 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352662 () Bool)

(declare-fun contains!2364 (List!5235 (_ BitVec 64)) Bool)

(assert (=> b!352662 (= e!215937 (contains!2364 Nil!5232 (select (arr!9026 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352663 () Bool)

(assert (=> b!352663 (= e!215938 call!27065)))

(assert (= (and d!71361 (not res!195597)) b!352659))

(assert (= (and b!352659 res!195599) b!352662))

(assert (= (and b!352659 res!195598) b!352661))

(assert (= (and b!352661 c!53549) b!352660))

(assert (= (and b!352661 (not c!53549)) b!352663))

(assert (= (or b!352660 b!352663) bm!27062))

(declare-fun m!351717 () Bool)

(assert (=> b!352659 m!351717))

(assert (=> b!352659 m!351717))

(declare-fun m!351719 () Bool)

(assert (=> b!352659 m!351719))

(assert (=> bm!27062 m!351717))

(declare-fun m!351721 () Bool)

(assert (=> bm!27062 m!351721))

(assert (=> b!352661 m!351717))

(assert (=> b!352661 m!351717))

(assert (=> b!352661 m!351719))

(assert (=> b!352662 m!351717))

(assert (=> b!352662 m!351717))

(declare-fun m!351723 () Bool)

(assert (=> b!352662 m!351723))

(assert (=> b!352586 d!71361))

(declare-fun d!71363 () Bool)

(declare-fun e!215943 () Bool)

(assert (=> d!71363 e!215943))

(declare-fun res!195602 () Bool)

(assert (=> d!71363 (=> res!195602 e!215943)))

(declare-fun lt!165132 () Bool)

(assert (=> d!71363 (= res!195602 (not lt!165132))))

(declare-fun lt!165131 () Bool)

(assert (=> d!71363 (= lt!165132 lt!165131)))

(declare-datatypes ((Unit!10896 0))(
  ( (Unit!10897) )
))
(declare-fun lt!165130 () Unit!10896)

(declare-fun e!215944 () Unit!10896)

(assert (=> d!71363 (= lt!165130 e!215944)))

(declare-fun c!53552 () Bool)

(assert (=> d!71363 (= c!53552 lt!165131)))

(declare-fun containsKey!343 (List!5236 (_ BitVec 64)) Bool)

(assert (=> d!71363 (= lt!165131 (containsKey!343 (toList!2277 (getCurrentListMap!1782 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71363 (= (contains!2361 (getCurrentListMap!1782 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!165132)))

(declare-fun b!352670 () Bool)

(declare-fun lt!165129 () Unit!10896)

(assert (=> b!352670 (= e!215944 lt!165129)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!292 (List!5236 (_ BitVec 64)) Unit!10896)

(assert (=> b!352670 (= lt!165129 (lemmaContainsKeyImpliesGetValueByKeyDefined!292 (toList!2277 (getCurrentListMap!1782 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!357 0))(
  ( (Some!356 (v!6103 V!11299)) (None!355) )
))
(declare-fun isDefined!293 (Option!357) Bool)

(declare-fun getValueByKey!351 (List!5236 (_ BitVec 64)) Option!357)

(assert (=> b!352670 (isDefined!293 (getValueByKey!351 (toList!2277 (getCurrentListMap!1782 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!352671 () Bool)

(declare-fun Unit!10898 () Unit!10896)

(assert (=> b!352671 (= e!215944 Unit!10898)))

(declare-fun b!352672 () Bool)

(assert (=> b!352672 (= e!215943 (isDefined!293 (getValueByKey!351 (toList!2277 (getCurrentListMap!1782 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71363 c!53552) b!352670))

(assert (= (and d!71363 (not c!53552)) b!352671))

(assert (= (and d!71363 (not res!195602)) b!352672))

(declare-fun m!351725 () Bool)

(assert (=> d!71363 m!351725))

(declare-fun m!351727 () Bool)

(assert (=> b!352670 m!351727))

(declare-fun m!351729 () Bool)

(assert (=> b!352670 m!351729))

(assert (=> b!352670 m!351729))

(declare-fun m!351731 () Bool)

(assert (=> b!352670 m!351731))

(assert (=> b!352672 m!351729))

(assert (=> b!352672 m!351729))

(assert (=> b!352672 m!351731))

(assert (=> b!352591 d!71363))

(declare-fun b!352715 () Bool)

(declare-fun e!215978 () Bool)

(declare-fun lt!165177 () ListLongMap!4523)

(declare-fun apply!295 (ListLongMap!4523 (_ BitVec 64)) V!11299)

(assert (=> b!352715 (= e!215978 (= (apply!295 lt!165177 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!352716 () Bool)

(declare-fun e!215976 () ListLongMap!4523)

(declare-fun call!27083 () ListLongMap!4523)

(assert (=> b!352716 (= e!215976 call!27083)))

(declare-fun b!352717 () Bool)

(declare-fun e!215975 () ListLongMap!4523)

(declare-fun e!215971 () ListLongMap!4523)

(assert (=> b!352717 (= e!215975 e!215971)))

(declare-fun c!53565 () Bool)

(assert (=> b!352717 (= c!53565 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!352718 () Bool)

(declare-fun e!215974 () Bool)

(declare-fun e!215980 () Bool)

(assert (=> b!352718 (= e!215974 e!215980)))

(declare-fun res!195627 () Bool)

(declare-fun call!27081 () Bool)

(assert (=> b!352718 (= res!195627 call!27081)))

(assert (=> b!352718 (=> (not res!195627) (not e!215980))))

(declare-fun b!352719 () Bool)

(assert (=> b!352719 (= e!215974 (not call!27081))))

(declare-fun bm!27077 () Bool)

(declare-fun call!27082 () ListLongMap!4523)

(assert (=> bm!27077 (= call!27083 call!27082)))

(declare-fun bm!27078 () Bool)

(declare-fun call!27085 () ListLongMap!4523)

(declare-fun getCurrentListMapNoExtraKeys!611 (array!19049 array!19051 (_ BitVec 32) (_ BitVec 32) V!11299 V!11299 (_ BitVec 32) Int) ListLongMap!4523)

(assert (=> bm!27078 (= call!27085 (getCurrentListMapNoExtraKeys!611 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!352720 () Bool)

(declare-fun e!215981 () Bool)

(assert (=> b!352720 (= e!215981 e!215978)))

(declare-fun res!195629 () Bool)

(declare-fun call!27080 () Bool)

(assert (=> b!352720 (= res!195629 call!27080)))

(assert (=> b!352720 (=> (not res!195629) (not e!215978))))

(declare-fun b!352721 () Bool)

(declare-fun res!195626 () Bool)

(declare-fun e!215983 () Bool)

(assert (=> b!352721 (=> (not res!195626) (not e!215983))))

(assert (=> b!352721 (= res!195626 e!215981)))

(declare-fun c!53570 () Bool)

(assert (=> b!352721 (= c!53570 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!352722 () Bool)

(declare-fun e!215977 () Unit!10896)

(declare-fun Unit!10899 () Unit!10896)

(assert (=> b!352722 (= e!215977 Unit!10899)))

(declare-fun b!352723 () Bool)

(declare-fun e!215973 () Bool)

(assert (=> b!352723 (= e!215973 (validKeyInArray!0 (select (arr!9026 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun c!53566 () Bool)

(declare-fun call!27086 () ListLongMap!4523)

(declare-fun bm!27079 () Bool)

(declare-fun call!27084 () ListLongMap!4523)

(declare-fun +!748 (ListLongMap!4523 tuple2!5620) ListLongMap!4523)

(assert (=> bm!27079 (= call!27082 (+!748 (ite c!53566 call!27085 (ite c!53565 call!27086 call!27084)) (ite (or c!53566 c!53565) (tuple2!5621 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5621 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!352724 () Bool)

(declare-fun e!215972 () Bool)

(declare-fun e!215982 () Bool)

(assert (=> b!352724 (= e!215972 e!215982)))

(declare-fun res!195621 () Bool)

(assert (=> b!352724 (=> (not res!195621) (not e!215982))))

(assert (=> b!352724 (= res!195621 (contains!2361 lt!165177 (select (arr!9026 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!352724 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9379 _keys!1895)))))

(declare-fun b!352725 () Bool)

(declare-fun get!4815 (ValueCell!3527 V!11299) V!11299)

(declare-fun dynLambda!629 (Int (_ BitVec 64)) V!11299)

(assert (=> b!352725 (= e!215982 (= (apply!295 lt!165177 (select (arr!9026 _keys!1895) #b00000000000000000000000000000000)) (get!4815 (select (arr!9027 _values!1525) #b00000000000000000000000000000000) (dynLambda!629 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!352725 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9380 _values!1525)))))

(assert (=> b!352725 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9379 _keys!1895)))))

(declare-fun bm!27080 () Bool)

(assert (=> bm!27080 (= call!27086 call!27085)))

(declare-fun b!352726 () Bool)

(declare-fun e!215979 () Bool)

(assert (=> b!352726 (= e!215979 (validKeyInArray!0 (select (arr!9026 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352727 () Bool)

(assert (=> b!352727 (= e!215983 e!215974)))

(declare-fun c!53568 () Bool)

(assert (=> b!352727 (= c!53568 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!352728 () Bool)

(assert (=> b!352728 (= e!215980 (= (apply!295 lt!165177 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun bm!27081 () Bool)

(assert (=> bm!27081 (= call!27084 call!27086)))

(declare-fun b!352729 () Bool)

(declare-fun lt!165191 () Unit!10896)

(assert (=> b!352729 (= e!215977 lt!165191)))

(declare-fun lt!165193 () ListLongMap!4523)

(assert (=> b!352729 (= lt!165193 (getCurrentListMapNoExtraKeys!611 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165183 () (_ BitVec 64))

(assert (=> b!352729 (= lt!165183 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165184 () (_ BitVec 64))

(assert (=> b!352729 (= lt!165184 (select (arr!9026 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165194 () Unit!10896)

(declare-fun addStillContains!271 (ListLongMap!4523 (_ BitVec 64) V!11299 (_ BitVec 64)) Unit!10896)

(assert (=> b!352729 (= lt!165194 (addStillContains!271 lt!165193 lt!165183 zeroValue!1467 lt!165184))))

(assert (=> b!352729 (contains!2361 (+!748 lt!165193 (tuple2!5621 lt!165183 zeroValue!1467)) lt!165184)))

(declare-fun lt!165180 () Unit!10896)

(assert (=> b!352729 (= lt!165180 lt!165194)))

(declare-fun lt!165182 () ListLongMap!4523)

(assert (=> b!352729 (= lt!165182 (getCurrentListMapNoExtraKeys!611 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165196 () (_ BitVec 64))

(assert (=> b!352729 (= lt!165196 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165195 () (_ BitVec 64))

(assert (=> b!352729 (= lt!165195 (select (arr!9026 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165179 () Unit!10896)

(declare-fun addApplyDifferent!271 (ListLongMap!4523 (_ BitVec 64) V!11299 (_ BitVec 64)) Unit!10896)

(assert (=> b!352729 (= lt!165179 (addApplyDifferent!271 lt!165182 lt!165196 minValue!1467 lt!165195))))

(assert (=> b!352729 (= (apply!295 (+!748 lt!165182 (tuple2!5621 lt!165196 minValue!1467)) lt!165195) (apply!295 lt!165182 lt!165195))))

(declare-fun lt!165188 () Unit!10896)

(assert (=> b!352729 (= lt!165188 lt!165179)))

(declare-fun lt!165186 () ListLongMap!4523)

(assert (=> b!352729 (= lt!165186 (getCurrentListMapNoExtraKeys!611 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165190 () (_ BitVec 64))

(assert (=> b!352729 (= lt!165190 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165185 () (_ BitVec 64))

(assert (=> b!352729 (= lt!165185 (select (arr!9026 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165198 () Unit!10896)

(assert (=> b!352729 (= lt!165198 (addApplyDifferent!271 lt!165186 lt!165190 zeroValue!1467 lt!165185))))

(assert (=> b!352729 (= (apply!295 (+!748 lt!165186 (tuple2!5621 lt!165190 zeroValue!1467)) lt!165185) (apply!295 lt!165186 lt!165185))))

(declare-fun lt!165189 () Unit!10896)

(assert (=> b!352729 (= lt!165189 lt!165198)))

(declare-fun lt!165197 () ListLongMap!4523)

(assert (=> b!352729 (= lt!165197 (getCurrentListMapNoExtraKeys!611 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165178 () (_ BitVec 64))

(assert (=> b!352729 (= lt!165178 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165187 () (_ BitVec 64))

(assert (=> b!352729 (= lt!165187 (select (arr!9026 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!352729 (= lt!165191 (addApplyDifferent!271 lt!165197 lt!165178 minValue!1467 lt!165187))))

(assert (=> b!352729 (= (apply!295 (+!748 lt!165197 (tuple2!5621 lt!165178 minValue!1467)) lt!165187) (apply!295 lt!165197 lt!165187))))

(declare-fun bm!27082 () Bool)

(assert (=> bm!27082 (= call!27081 (contains!2361 lt!165177 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!71365 () Bool)

(assert (=> d!71365 e!215983))

(declare-fun res!195624 () Bool)

(assert (=> d!71365 (=> (not res!195624) (not e!215983))))

(assert (=> d!71365 (= res!195624 (or (bvsge #b00000000000000000000000000000000 (size!9379 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9379 _keys!1895)))))))

(declare-fun lt!165192 () ListLongMap!4523)

(assert (=> d!71365 (= lt!165177 lt!165192)))

(declare-fun lt!165181 () Unit!10896)

(assert (=> d!71365 (= lt!165181 e!215977)))

(declare-fun c!53569 () Bool)

(assert (=> d!71365 (= c!53569 e!215973)))

(declare-fun res!195623 () Bool)

(assert (=> d!71365 (=> (not res!195623) (not e!215973))))

(assert (=> d!71365 (= res!195623 (bvslt #b00000000000000000000000000000000 (size!9379 _keys!1895)))))

(assert (=> d!71365 (= lt!165192 e!215975)))

(assert (=> d!71365 (= c!53566 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71365 (validMask!0 mask!2385)))

(assert (=> d!71365 (= (getCurrentListMap!1782 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!165177)))

(declare-fun b!352730 () Bool)

(assert (=> b!352730 (= e!215981 (not call!27080))))

(declare-fun b!352731 () Bool)

(assert (=> b!352731 (= e!215976 call!27084)))

(declare-fun bm!27083 () Bool)

(assert (=> bm!27083 (= call!27080 (contains!2361 lt!165177 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!352732 () Bool)

(assert (=> b!352732 (= e!215971 call!27083)))

(declare-fun b!352733 () Bool)

(declare-fun res!195625 () Bool)

(assert (=> b!352733 (=> (not res!195625) (not e!215983))))

(assert (=> b!352733 (= res!195625 e!215972)))

(declare-fun res!195622 () Bool)

(assert (=> b!352733 (=> res!195622 e!215972)))

(assert (=> b!352733 (= res!195622 (not e!215979))))

(declare-fun res!195628 () Bool)

(assert (=> b!352733 (=> (not res!195628) (not e!215979))))

(assert (=> b!352733 (= res!195628 (bvslt #b00000000000000000000000000000000 (size!9379 _keys!1895)))))

(declare-fun b!352734 () Bool)

(declare-fun c!53567 () Bool)

(assert (=> b!352734 (= c!53567 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!352734 (= e!215971 e!215976)))

(declare-fun b!352735 () Bool)

(assert (=> b!352735 (= e!215975 (+!748 call!27082 (tuple2!5621 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(assert (= (and d!71365 c!53566) b!352735))

(assert (= (and d!71365 (not c!53566)) b!352717))

(assert (= (and b!352717 c!53565) b!352732))

(assert (= (and b!352717 (not c!53565)) b!352734))

(assert (= (and b!352734 c!53567) b!352716))

(assert (= (and b!352734 (not c!53567)) b!352731))

(assert (= (or b!352716 b!352731) bm!27081))

(assert (= (or b!352732 bm!27081) bm!27080))

(assert (= (or b!352732 b!352716) bm!27077))

(assert (= (or b!352735 bm!27080) bm!27078))

(assert (= (or b!352735 bm!27077) bm!27079))

(assert (= (and d!71365 res!195623) b!352723))

(assert (= (and d!71365 c!53569) b!352729))

(assert (= (and d!71365 (not c!53569)) b!352722))

(assert (= (and d!71365 res!195624) b!352733))

(assert (= (and b!352733 res!195628) b!352726))

(assert (= (and b!352733 (not res!195622)) b!352724))

(assert (= (and b!352724 res!195621) b!352725))

(assert (= (and b!352733 res!195625) b!352721))

(assert (= (and b!352721 c!53570) b!352720))

(assert (= (and b!352721 (not c!53570)) b!352730))

(assert (= (and b!352720 res!195629) b!352715))

(assert (= (or b!352720 b!352730) bm!27083))

(assert (= (and b!352721 res!195626) b!352727))

(assert (= (and b!352727 c!53568) b!352718))

(assert (= (and b!352727 (not c!53568)) b!352719))

(assert (= (and b!352718 res!195627) b!352728))

(assert (= (or b!352718 b!352719) bm!27082))

(declare-fun b_lambda!8501 () Bool)

(assert (=> (not b_lambda!8501) (not b!352725)))

(declare-fun t!10377 () Bool)

(declare-fun tb!3097 () Bool)

(assert (=> (and start!35182 (= defaultEntry!1528 defaultEntry!1528) t!10377) tb!3097))

(declare-fun result!5637 () Bool)

(assert (=> tb!3097 (= result!5637 tp_is_empty!7741)))

(assert (=> b!352725 t!10377))

(declare-fun b_and!15007 () Bool)

(assert (= b_and!15001 (and (=> t!10377 result!5637) b_and!15007)))

(assert (=> d!71365 m!351669))

(declare-fun m!351733 () Bool)

(assert (=> bm!27079 m!351733))

(assert (=> b!352723 m!351717))

(assert (=> b!352723 m!351717))

(assert (=> b!352723 m!351719))

(assert (=> b!352726 m!351717))

(assert (=> b!352726 m!351717))

(assert (=> b!352726 m!351719))

(declare-fun m!351735 () Bool)

(assert (=> bm!27078 m!351735))

(declare-fun m!351737 () Bool)

(assert (=> b!352728 m!351737))

(declare-fun m!351739 () Bool)

(assert (=> b!352725 m!351739))

(declare-fun m!351741 () Bool)

(assert (=> b!352725 m!351741))

(declare-fun m!351743 () Bool)

(assert (=> b!352725 m!351743))

(assert (=> b!352725 m!351741))

(assert (=> b!352725 m!351717))

(assert (=> b!352725 m!351717))

(declare-fun m!351745 () Bool)

(assert (=> b!352725 m!351745))

(assert (=> b!352725 m!351739))

(declare-fun m!351747 () Bool)

(assert (=> bm!27082 m!351747))

(declare-fun m!351749 () Bool)

(assert (=> bm!27083 m!351749))

(declare-fun m!351751 () Bool)

(assert (=> b!352715 m!351751))

(declare-fun m!351753 () Bool)

(assert (=> b!352735 m!351753))

(declare-fun m!351755 () Bool)

(assert (=> b!352729 m!351755))

(declare-fun m!351757 () Bool)

(assert (=> b!352729 m!351757))

(declare-fun m!351759 () Bool)

(assert (=> b!352729 m!351759))

(declare-fun m!351761 () Bool)

(assert (=> b!352729 m!351761))

(declare-fun m!351763 () Bool)

(assert (=> b!352729 m!351763))

(declare-fun m!351765 () Bool)

(assert (=> b!352729 m!351765))

(declare-fun m!351767 () Bool)

(assert (=> b!352729 m!351767))

(assert (=> b!352729 m!351757))

(declare-fun m!351769 () Bool)

(assert (=> b!352729 m!351769))

(declare-fun m!351771 () Bool)

(assert (=> b!352729 m!351771))

(declare-fun m!351773 () Bool)

(assert (=> b!352729 m!351773))

(declare-fun m!351775 () Bool)

(assert (=> b!352729 m!351775))

(declare-fun m!351777 () Bool)

(assert (=> b!352729 m!351777))

(declare-fun m!351779 () Bool)

(assert (=> b!352729 m!351779))

(assert (=> b!352729 m!351761))

(assert (=> b!352729 m!351765))

(assert (=> b!352729 m!351777))

(assert (=> b!352729 m!351735))

(declare-fun m!351781 () Bool)

(assert (=> b!352729 m!351781))

(declare-fun m!351783 () Bool)

(assert (=> b!352729 m!351783))

(assert (=> b!352729 m!351717))

(assert (=> b!352724 m!351717))

(assert (=> b!352724 m!351717))

(declare-fun m!351785 () Bool)

(assert (=> b!352724 m!351785))

(assert (=> b!352591 d!71365))

(declare-fun d!71367 () Bool)

(assert (=> d!71367 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!352594 d!71367))

(declare-fun b!352750 () Bool)

(declare-fun e!215991 () SeekEntryResult!3474)

(declare-fun lt!165206 () SeekEntryResult!3474)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!19049 (_ BitVec 32)) SeekEntryResult!3474)

(assert (=> b!352750 (= e!215991 (seekKeyOrZeroReturnVacant!0 (x!35101 lt!165206) (index!16077 lt!165206) (index!16077 lt!165206) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!352751 () Bool)

(declare-fun e!215992 () SeekEntryResult!3474)

(assert (=> b!352751 (= e!215992 (Found!3474 (index!16077 lt!165206)))))

(declare-fun b!352752 () Bool)

(assert (=> b!352752 (= e!215991 (MissingZero!3474 (index!16077 lt!165206)))))

(declare-fun b!352753 () Bool)

(declare-fun c!53577 () Bool)

(declare-fun lt!165205 () (_ BitVec 64))

(assert (=> b!352753 (= c!53577 (= lt!165205 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!352753 (= e!215992 e!215991)))

(declare-fun b!352754 () Bool)

(declare-fun e!215990 () SeekEntryResult!3474)

(assert (=> b!352754 (= e!215990 Undefined!3474)))

(declare-fun d!71369 () Bool)

(declare-fun lt!165207 () SeekEntryResult!3474)

(assert (=> d!71369 (and (or ((_ is Undefined!3474) lt!165207) (not ((_ is Found!3474) lt!165207)) (and (bvsge (index!16076 lt!165207) #b00000000000000000000000000000000) (bvslt (index!16076 lt!165207) (size!9379 _keys!1895)))) (or ((_ is Undefined!3474) lt!165207) ((_ is Found!3474) lt!165207) (not ((_ is MissingZero!3474) lt!165207)) (and (bvsge (index!16075 lt!165207) #b00000000000000000000000000000000) (bvslt (index!16075 lt!165207) (size!9379 _keys!1895)))) (or ((_ is Undefined!3474) lt!165207) ((_ is Found!3474) lt!165207) ((_ is MissingZero!3474) lt!165207) (not ((_ is MissingVacant!3474) lt!165207)) (and (bvsge (index!16078 lt!165207) #b00000000000000000000000000000000) (bvslt (index!16078 lt!165207) (size!9379 _keys!1895)))) (or ((_ is Undefined!3474) lt!165207) (ite ((_ is Found!3474) lt!165207) (= (select (arr!9026 _keys!1895) (index!16076 lt!165207)) k0!1348) (ite ((_ is MissingZero!3474) lt!165207) (= (select (arr!9026 _keys!1895) (index!16075 lt!165207)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3474) lt!165207) (= (select (arr!9026 _keys!1895) (index!16078 lt!165207)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71369 (= lt!165207 e!215990)))

(declare-fun c!53578 () Bool)

(assert (=> d!71369 (= c!53578 (and ((_ is Intermediate!3474) lt!165206) (undefined!4286 lt!165206)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!19049 (_ BitVec 32)) SeekEntryResult!3474)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71369 (= lt!165206 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71369 (validMask!0 mask!2385)))

(assert (=> d!71369 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!165207)))

(declare-fun b!352755 () Bool)

(assert (=> b!352755 (= e!215990 e!215992)))

(assert (=> b!352755 (= lt!165205 (select (arr!9026 _keys!1895) (index!16077 lt!165206)))))

(declare-fun c!53579 () Bool)

(assert (=> b!352755 (= c!53579 (= lt!165205 k0!1348))))

(assert (= (and d!71369 c!53578) b!352754))

(assert (= (and d!71369 (not c!53578)) b!352755))

(assert (= (and b!352755 c!53579) b!352751))

(assert (= (and b!352755 (not c!53579)) b!352753))

(assert (= (and b!352753 c!53577) b!352752))

(assert (= (and b!352753 (not c!53577)) b!352750))

(declare-fun m!351787 () Bool)

(assert (=> b!352750 m!351787))

(declare-fun m!351789 () Bool)

(assert (=> d!71369 m!351789))

(declare-fun m!351791 () Bool)

(assert (=> d!71369 m!351791))

(declare-fun m!351793 () Bool)

(assert (=> d!71369 m!351793))

(declare-fun m!351795 () Bool)

(assert (=> d!71369 m!351795))

(assert (=> d!71369 m!351789))

(assert (=> d!71369 m!351669))

(declare-fun m!351797 () Bool)

(assert (=> d!71369 m!351797))

(declare-fun m!351799 () Bool)

(assert (=> b!352755 m!351799))

(assert (=> b!352588 d!71369))

(declare-fun d!71371 () Bool)

(declare-fun res!195634 () Bool)

(declare-fun e!216000 () Bool)

(assert (=> d!71371 (=> res!195634 e!216000)))

(assert (=> d!71371 (= res!195634 (bvsge #b00000000000000000000000000000000 (size!9379 _keys!1895)))))

(assert (=> d!71371 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!216000)))

(declare-fun b!352764 () Bool)

(declare-fun e!216001 () Bool)

(assert (=> b!352764 (= e!216000 e!216001)))

(declare-fun c!53582 () Bool)

(assert (=> b!352764 (= c!53582 (validKeyInArray!0 (select (arr!9026 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352765 () Bool)

(declare-fun e!215999 () Bool)

(assert (=> b!352765 (= e!216001 e!215999)))

(declare-fun lt!165215 () (_ BitVec 64))

(assert (=> b!352765 (= lt!165215 (select (arr!9026 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165216 () Unit!10896)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19049 (_ BitVec 64) (_ BitVec 32)) Unit!10896)

(assert (=> b!352765 (= lt!165216 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!165215 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!19049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!352765 (arrayContainsKey!0 _keys!1895 lt!165215 #b00000000000000000000000000000000)))

(declare-fun lt!165214 () Unit!10896)

(assert (=> b!352765 (= lt!165214 lt!165216)))

(declare-fun res!195635 () Bool)

(assert (=> b!352765 (= res!195635 (= (seekEntryOrOpen!0 (select (arr!9026 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3474 #b00000000000000000000000000000000)))))

(assert (=> b!352765 (=> (not res!195635) (not e!215999))))

(declare-fun b!352766 () Bool)

(declare-fun call!27089 () Bool)

(assert (=> b!352766 (= e!216001 call!27089)))

(declare-fun bm!27086 () Bool)

(assert (=> bm!27086 (= call!27089 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!352767 () Bool)

(assert (=> b!352767 (= e!215999 call!27089)))

(assert (= (and d!71371 (not res!195634)) b!352764))

(assert (= (and b!352764 c!53582) b!352765))

(assert (= (and b!352764 (not c!53582)) b!352766))

(assert (= (and b!352765 res!195635) b!352767))

(assert (= (or b!352767 b!352766) bm!27086))

(assert (=> b!352764 m!351717))

(assert (=> b!352764 m!351717))

(assert (=> b!352764 m!351719))

(assert (=> b!352765 m!351717))

(declare-fun m!351801 () Bool)

(assert (=> b!352765 m!351801))

(declare-fun m!351803 () Bool)

(assert (=> b!352765 m!351803))

(assert (=> b!352765 m!351717))

(declare-fun m!351805 () Bool)

(assert (=> b!352765 m!351805))

(declare-fun m!351807 () Bool)

(assert (=> bm!27086 m!351807))

(assert (=> b!352587 d!71371))

(declare-fun d!71373 () Bool)

(assert (=> d!71373 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!35182 d!71373))

(declare-fun d!71375 () Bool)

(assert (=> d!71375 (= (array_inv!6684 _values!1525) (bvsge (size!9380 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!35182 d!71375))

(declare-fun d!71377 () Bool)

(assert (=> d!71377 (= (array_inv!6685 _keys!1895) (bvsge (size!9379 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!35182 d!71377))

(declare-fun b!352774 () Bool)

(declare-fun e!216007 () Bool)

(assert (=> b!352774 (= e!216007 tp_is_empty!7741)))

(declare-fun b!352775 () Bool)

(declare-fun e!216006 () Bool)

(assert (=> b!352775 (= e!216006 tp_is_empty!7741)))

(declare-fun mapIsEmpty!13104 () Bool)

(declare-fun mapRes!13104 () Bool)

(assert (=> mapIsEmpty!13104 mapRes!13104))

(declare-fun condMapEmpty!13104 () Bool)

(declare-fun mapDefault!13104 () ValueCell!3527)

(assert (=> mapNonEmpty!13095 (= condMapEmpty!13104 (= mapRest!13095 ((as const (Array (_ BitVec 32) ValueCell!3527)) mapDefault!13104)))))

(assert (=> mapNonEmpty!13095 (= tp!26957 (and e!216006 mapRes!13104))))

(declare-fun mapNonEmpty!13104 () Bool)

(declare-fun tp!26973 () Bool)

(assert (=> mapNonEmpty!13104 (= mapRes!13104 (and tp!26973 e!216007))))

(declare-fun mapRest!13104 () (Array (_ BitVec 32) ValueCell!3527))

(declare-fun mapValue!13104 () ValueCell!3527)

(declare-fun mapKey!13104 () (_ BitVec 32))

(assert (=> mapNonEmpty!13104 (= mapRest!13095 (store mapRest!13104 mapKey!13104 mapValue!13104))))

(assert (= (and mapNonEmpty!13095 condMapEmpty!13104) mapIsEmpty!13104))

(assert (= (and mapNonEmpty!13095 (not condMapEmpty!13104)) mapNonEmpty!13104))

(assert (= (and mapNonEmpty!13104 ((_ is ValueCellFull!3527) mapValue!13104)) b!352774))

(assert (= (and mapNonEmpty!13095 ((_ is ValueCellFull!3527) mapDefault!13104)) b!352775))

(declare-fun m!351809 () Bool)

(assert (=> mapNonEmpty!13104 m!351809))

(declare-fun b_lambda!8503 () Bool)

(assert (= b_lambda!8501 (or (and start!35182 b_free!7789) b_lambda!8503)))

(check-sat (not b_next!7789) tp_is_empty!7741 (not b_lambda!8503) (not b!352724) (not b!352662) (not b!352750) (not b!352723) (not b!352765) (not bm!27062) (not bm!27083) (not mapNonEmpty!13104) (not b!352672) (not b!352725) (not bm!27078) (not b!352728) (not d!71369) (not d!71363) (not b!352764) (not b!352715) (not b!352659) (not b!352735) (not b!352661) (not bm!27086) (not b!352729) (not d!71365) (not b!352726) (not b!352670) (not bm!27079) b_and!15007 (not bm!27082))
(check-sat b_and!15007 (not b_next!7789))
