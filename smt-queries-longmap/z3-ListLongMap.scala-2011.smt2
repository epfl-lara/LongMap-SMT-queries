; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35054 () Bool)

(assert start!35054)

(declare-fun b_free!7735 () Bool)

(declare-fun b_next!7735 () Bool)

(assert (=> start!35054 (= b_free!7735 (not b_next!7735))))

(declare-fun tp!26787 () Bool)

(declare-fun b_and!14981 () Bool)

(assert (=> start!35054 (= tp!26787 b_and!14981)))

(declare-fun b!351459 () Bool)

(declare-fun res!194923 () Bool)

(declare-fun e!215227 () Bool)

(assert (=> b!351459 (=> (not res!194923) (not e!215227))))

(declare-datatypes ((array!18950 0))(
  ( (array!18951 (arr!8979 (Array (_ BitVec 32) (_ BitVec 64))) (size!9331 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18950)

(declare-datatypes ((List!5130 0))(
  ( (Nil!5127) (Cons!5126 (h!5982 (_ BitVec 64)) (t!10262 List!5130)) )
))
(declare-fun arrayNoDuplicates!0 (array!18950 (_ BitVec 32) List!5130) Bool)

(assert (=> b!351459 (= res!194923 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5127))))

(declare-fun b!351460 () Bool)

(declare-fun e!215226 () Bool)

(declare-fun tp_is_empty!7687 () Bool)

(assert (=> b!351460 (= e!215226 tp_is_empty!7687)))

(declare-fun b!351461 () Bool)

(declare-fun res!194927 () Bool)

(assert (=> b!351461 (=> (not res!194927) (not e!215227))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18950 (_ BitVec 32)) Bool)

(assert (=> b!351461 (= res!194927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun lt!164869 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun e!215231 () Bool)

(declare-fun b!351462 () Bool)

(declare-fun arrayContainsKey!0 (array!18950 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351462 (= e!215231 (not (arrayContainsKey!0 _keys!1895 k0!1348 lt!164869)))))

(declare-fun b!351463 () Bool)

(declare-fun e!215230 () Bool)

(assert (=> b!351463 (= e!215230 tp_is_empty!7687)))

(declare-fun b!351465 () Bool)

(declare-fun res!194925 () Bool)

(assert (=> b!351465 (=> (not res!194925) (not e!215227))))

(declare-datatypes ((V!11227 0))(
  ( (V!11228 (val!3888 Int)) )
))
(declare-fun zeroValue!1467 () V!11227)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3500 0))(
  ( (ValueCellFull!3500 (v!6077 V!11227)) (EmptyCell!3500) )
))
(declare-datatypes ((array!18952 0))(
  ( (array!18953 (arr!8980 (Array (_ BitVec 32) ValueCell!3500)) (size!9332 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18952)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11227)

(declare-datatypes ((tuple2!5526 0))(
  ( (tuple2!5527 (_1!2774 (_ BitVec 64)) (_2!2774 V!11227)) )
))
(declare-datatypes ((List!5131 0))(
  ( (Nil!5128) (Cons!5127 (h!5983 tuple2!5526) (t!10263 List!5131)) )
))
(declare-datatypes ((ListLongMap!4441 0))(
  ( (ListLongMap!4442 (toList!2236 List!5131)) )
))
(declare-fun contains!2325 (ListLongMap!4441 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1764 (array!18950 array!18952 (_ BitVec 32) (_ BitVec 32) V!11227 V!11227 (_ BitVec 32) Int) ListLongMap!4441)

(assert (=> b!351465 (= res!194925 (not (contains!2325 (getCurrentListMap!1764 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!13005 () Bool)

(declare-fun mapRes!13005 () Bool)

(declare-fun tp!26786 () Bool)

(assert (=> mapNonEmpty!13005 (= mapRes!13005 (and tp!26786 e!215226))))

(declare-fun mapRest!13005 () (Array (_ BitVec 32) ValueCell!3500))

(declare-fun mapValue!13005 () ValueCell!3500)

(declare-fun mapKey!13005 () (_ BitVec 32))

(assert (=> mapNonEmpty!13005 (= (arr!8980 _values!1525) (store mapRest!13005 mapKey!13005 mapValue!13005))))

(declare-fun b!351466 () Bool)

(declare-fun res!194930 () Bool)

(assert (=> b!351466 (=> (not res!194930) (not e!215227))))

(assert (=> b!351466 (= res!194930 (and (= (size!9332 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9331 _keys!1895) (size!9332 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!351467 () Bool)

(declare-fun res!194931 () Bool)

(assert (=> b!351467 (=> (not res!194931) (not e!215227))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!351467 (= res!194931 (validKeyInArray!0 k0!1348))))

(declare-fun b!351468 () Bool)

(declare-fun e!215228 () Bool)

(assert (=> b!351468 (= e!215227 e!215228)))

(declare-fun res!194924 () Bool)

(assert (=> b!351468 (=> (not res!194924) (not e!215228))))

(declare-datatypes ((SeekEntryResult!3410 0))(
  ( (MissingZero!3410 (index!15819 (_ BitVec 32))) (Found!3410 (index!15820 (_ BitVec 32))) (Intermediate!3410 (undefined!4222 Bool) (index!15821 (_ BitVec 32)) (x!34937 (_ BitVec 32))) (Undefined!3410) (MissingVacant!3410 (index!15822 (_ BitVec 32))) )
))
(declare-fun lt!164868 () SeekEntryResult!3410)

(get-info :version)

(assert (=> b!351468 (= res!194924 (and (not ((_ is Found!3410) lt!164868)) (not ((_ is MissingZero!3410) lt!164868)) ((_ is MissingVacant!3410) lt!164868)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18950 (_ BitVec 32)) SeekEntryResult!3410)

(assert (=> b!351468 (= lt!164868 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!13005 () Bool)

(assert (=> mapIsEmpty!13005 mapRes!13005))

(declare-fun b!351464 () Bool)

(declare-fun e!215229 () Bool)

(assert (=> b!351464 (= e!215229 (and e!215230 mapRes!13005))))

(declare-fun condMapEmpty!13005 () Bool)

(declare-fun mapDefault!13005 () ValueCell!3500)

(assert (=> b!351464 (= condMapEmpty!13005 (= (arr!8980 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3500)) mapDefault!13005)))))

(declare-fun res!194926 () Bool)

(assert (=> start!35054 (=> (not res!194926) (not e!215227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35054 (= res!194926 (validMask!0 mask!2385))))

(assert (=> start!35054 e!215227))

(assert (=> start!35054 true))

(assert (=> start!35054 tp_is_empty!7687))

(assert (=> start!35054 tp!26787))

(declare-fun array_inv!6632 (array!18952) Bool)

(assert (=> start!35054 (and (array_inv!6632 _values!1525) e!215229)))

(declare-fun array_inv!6633 (array!18950) Bool)

(assert (=> start!35054 (array_inv!6633 _keys!1895)))

(declare-fun b!351469 () Bool)

(assert (=> b!351469 (= e!215228 e!215231)))

(declare-fun res!194929 () Bool)

(assert (=> b!351469 (=> (not res!194929) (not e!215231))))

(assert (=> b!351469 (= res!194929 (and (bvsge lt!164869 #b00000000000000000000000000000000) (bvslt lt!164869 (size!9331 _keys!1895))))))

(declare-fun arrayScanForKey!0 (array!18950 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351469 (= lt!164869 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!351470 () Bool)

(declare-fun res!194928 () Bool)

(assert (=> b!351470 (=> (not res!194928) (not e!215228))))

(assert (=> b!351470 (= res!194928 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!35054 res!194926) b!351466))

(assert (= (and b!351466 res!194930) b!351461))

(assert (= (and b!351461 res!194927) b!351459))

(assert (= (and b!351459 res!194923) b!351467))

(assert (= (and b!351467 res!194931) b!351465))

(assert (= (and b!351465 res!194925) b!351468))

(assert (= (and b!351468 res!194924) b!351470))

(assert (= (and b!351470 res!194928) b!351469))

(assert (= (and b!351469 res!194929) b!351462))

(assert (= (and b!351464 condMapEmpty!13005) mapIsEmpty!13005))

(assert (= (and b!351464 (not condMapEmpty!13005)) mapNonEmpty!13005))

(assert (= (and mapNonEmpty!13005 ((_ is ValueCellFull!3500) mapValue!13005)) b!351460))

(assert (= (and b!351464 ((_ is ValueCellFull!3500) mapDefault!13005)) b!351463))

(assert (= start!35054 b!351464))

(declare-fun m!351637 () Bool)

(assert (=> b!351468 m!351637))

(declare-fun m!351639 () Bool)

(assert (=> start!35054 m!351639))

(declare-fun m!351641 () Bool)

(assert (=> start!35054 m!351641))

(declare-fun m!351643 () Bool)

(assert (=> start!35054 m!351643))

(declare-fun m!351645 () Bool)

(assert (=> b!351462 m!351645))

(declare-fun m!351647 () Bool)

(assert (=> mapNonEmpty!13005 m!351647))

(declare-fun m!351649 () Bool)

(assert (=> b!351459 m!351649))

(declare-fun m!351651 () Bool)

(assert (=> b!351465 m!351651))

(assert (=> b!351465 m!351651))

(declare-fun m!351653 () Bool)

(assert (=> b!351465 m!351653))

(declare-fun m!351655 () Bool)

(assert (=> b!351461 m!351655))

(declare-fun m!351657 () Bool)

(assert (=> b!351469 m!351657))

(declare-fun m!351659 () Bool)

(assert (=> b!351470 m!351659))

(declare-fun m!351661 () Bool)

(assert (=> b!351467 m!351661))

(check-sat (not mapNonEmpty!13005) (not b!351470) (not b_next!7735) b_and!14981 (not b!351462) (not b!351469) (not b!351461) (not b!351465) (not start!35054) tp_is_empty!7687 (not b!351467) (not b!351459) (not b!351468))
(check-sat b_and!14981 (not b_next!7735))
(get-model)

(declare-fun d!71501 () Bool)

(declare-fun res!194990 () Bool)

(declare-fun e!215279 () Bool)

(assert (=> d!71501 (=> res!194990 e!215279)))

(assert (=> d!71501 (= res!194990 (= (select (arr!8979 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71501 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!215279)))

(declare-fun b!351547 () Bool)

(declare-fun e!215280 () Bool)

(assert (=> b!351547 (= e!215279 e!215280)))

(declare-fun res!194991 () Bool)

(assert (=> b!351547 (=> (not res!194991) (not e!215280))))

(assert (=> b!351547 (= res!194991 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9331 _keys!1895)))))

(declare-fun b!351548 () Bool)

(assert (=> b!351548 (= e!215280 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71501 (not res!194990)) b!351547))

(assert (= (and b!351547 res!194991) b!351548))

(declare-fun m!351715 () Bool)

(assert (=> d!71501 m!351715))

(declare-fun m!351717 () Bool)

(assert (=> b!351548 m!351717))

(assert (=> b!351470 d!71501))

(declare-fun b!351557 () Bool)

(declare-fun e!215287 () Bool)

(declare-fun call!26996 () Bool)

(assert (=> b!351557 (= e!215287 call!26996)))

(declare-fun d!71503 () Bool)

(declare-fun res!194996 () Bool)

(declare-fun e!215289 () Bool)

(assert (=> d!71503 (=> res!194996 e!215289)))

(assert (=> d!71503 (= res!194996 (bvsge #b00000000000000000000000000000000 (size!9331 _keys!1895)))))

(assert (=> d!71503 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!215289)))

(declare-fun b!351558 () Bool)

(assert (=> b!351558 (= e!215289 e!215287)))

(declare-fun c!53435 () Bool)

(assert (=> b!351558 (= c!53435 (validKeyInArray!0 (select (arr!8979 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!351559 () Bool)

(declare-fun e!215288 () Bool)

(assert (=> b!351559 (= e!215288 call!26996)))

(declare-fun bm!26993 () Bool)

(assert (=> bm!26993 (= call!26996 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!351560 () Bool)

(assert (=> b!351560 (= e!215287 e!215288)))

(declare-fun lt!164889 () (_ BitVec 64))

(assert (=> b!351560 (= lt!164889 (select (arr!8979 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10834 0))(
  ( (Unit!10835) )
))
(declare-fun lt!164890 () Unit!10834)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18950 (_ BitVec 64) (_ BitVec 32)) Unit!10834)

(assert (=> b!351560 (= lt!164890 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!164889 #b00000000000000000000000000000000))))

(assert (=> b!351560 (arrayContainsKey!0 _keys!1895 lt!164889 #b00000000000000000000000000000000)))

(declare-fun lt!164888 () Unit!10834)

(assert (=> b!351560 (= lt!164888 lt!164890)))

(declare-fun res!194997 () Bool)

(assert (=> b!351560 (= res!194997 (= (seekEntryOrOpen!0 (select (arr!8979 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3410 #b00000000000000000000000000000000)))))

(assert (=> b!351560 (=> (not res!194997) (not e!215288))))

(assert (= (and d!71503 (not res!194996)) b!351558))

(assert (= (and b!351558 c!53435) b!351560))

(assert (= (and b!351558 (not c!53435)) b!351557))

(assert (= (and b!351560 res!194997) b!351559))

(assert (= (or b!351559 b!351557) bm!26993))

(assert (=> b!351558 m!351715))

(assert (=> b!351558 m!351715))

(declare-fun m!351719 () Bool)

(assert (=> b!351558 m!351719))

(declare-fun m!351721 () Bool)

(assert (=> bm!26993 m!351721))

(assert (=> b!351560 m!351715))

(declare-fun m!351723 () Bool)

(assert (=> b!351560 m!351723))

(declare-fun m!351725 () Bool)

(assert (=> b!351560 m!351725))

(assert (=> b!351560 m!351715))

(declare-fun m!351727 () Bool)

(assert (=> b!351560 m!351727))

(assert (=> b!351461 d!71503))

(declare-fun d!71505 () Bool)

(declare-fun lt!164893 () (_ BitVec 32))

(assert (=> d!71505 (and (or (bvslt lt!164893 #b00000000000000000000000000000000) (bvsge lt!164893 (size!9331 _keys!1895)) (and (bvsge lt!164893 #b00000000000000000000000000000000) (bvslt lt!164893 (size!9331 _keys!1895)))) (bvsge lt!164893 #b00000000000000000000000000000000) (bvslt lt!164893 (size!9331 _keys!1895)) (= (select (arr!8979 _keys!1895) lt!164893) k0!1348))))

(declare-fun e!215292 () (_ BitVec 32))

(assert (=> d!71505 (= lt!164893 e!215292)))

(declare-fun c!53438 () Bool)

(assert (=> d!71505 (= c!53438 (= (select (arr!8979 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71505 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9331 _keys!1895)) (bvslt (size!9331 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71505 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!164893)))

(declare-fun b!351565 () Bool)

(assert (=> b!351565 (= e!215292 #b00000000000000000000000000000000)))

(declare-fun b!351566 () Bool)

(assert (=> b!351566 (= e!215292 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71505 c!53438) b!351565))

(assert (= (and d!71505 (not c!53438)) b!351566))

(declare-fun m!351729 () Bool)

(assert (=> d!71505 m!351729))

(assert (=> d!71505 m!351715))

(declare-fun m!351731 () Bool)

(assert (=> b!351566 m!351731))

(assert (=> b!351469 d!71505))

(declare-fun d!71507 () Bool)

(declare-fun e!215297 () Bool)

(assert (=> d!71507 e!215297))

(declare-fun res!195000 () Bool)

(assert (=> d!71507 (=> res!195000 e!215297)))

(declare-fun lt!164904 () Bool)

(assert (=> d!71507 (= res!195000 (not lt!164904))))

(declare-fun lt!164902 () Bool)

(assert (=> d!71507 (= lt!164904 lt!164902)))

(declare-fun lt!164905 () Unit!10834)

(declare-fun e!215298 () Unit!10834)

(assert (=> d!71507 (= lt!164905 e!215298)))

(declare-fun c!53441 () Bool)

(assert (=> d!71507 (= c!53441 lt!164902)))

(declare-fun containsKey!342 (List!5131 (_ BitVec 64)) Bool)

(assert (=> d!71507 (= lt!164902 (containsKey!342 (toList!2236 (getCurrentListMap!1764 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71507 (= (contains!2325 (getCurrentListMap!1764 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!164904)))

(declare-fun b!351573 () Bool)

(declare-fun lt!164903 () Unit!10834)

(assert (=> b!351573 (= e!215298 lt!164903)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!290 (List!5131 (_ BitVec 64)) Unit!10834)

(assert (=> b!351573 (= lt!164903 (lemmaContainsKeyImpliesGetValueByKeyDefined!290 (toList!2236 (getCurrentListMap!1764 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!357 0))(
  ( (Some!356 (v!6080 V!11227)) (None!355) )
))
(declare-fun isDefined!291 (Option!357) Bool)

(declare-fun getValueByKey!351 (List!5131 (_ BitVec 64)) Option!357)

(assert (=> b!351573 (isDefined!291 (getValueByKey!351 (toList!2236 (getCurrentListMap!1764 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!351574 () Bool)

(declare-fun Unit!10836 () Unit!10834)

(assert (=> b!351574 (= e!215298 Unit!10836)))

(declare-fun b!351575 () Bool)

(assert (=> b!351575 (= e!215297 (isDefined!291 (getValueByKey!351 (toList!2236 (getCurrentListMap!1764 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71507 c!53441) b!351573))

(assert (= (and d!71507 (not c!53441)) b!351574))

(assert (= (and d!71507 (not res!195000)) b!351575))

(declare-fun m!351733 () Bool)

(assert (=> d!71507 m!351733))

(declare-fun m!351735 () Bool)

(assert (=> b!351573 m!351735))

(declare-fun m!351737 () Bool)

(assert (=> b!351573 m!351737))

(assert (=> b!351573 m!351737))

(declare-fun m!351739 () Bool)

(assert (=> b!351573 m!351739))

(assert (=> b!351575 m!351737))

(assert (=> b!351575 m!351737))

(assert (=> b!351575 m!351739))

(assert (=> b!351465 d!71507))

(declare-fun b!351618 () Bool)

(declare-fun e!215326 () Unit!10834)

(declare-fun Unit!10837 () Unit!10834)

(assert (=> b!351618 (= e!215326 Unit!10837)))

(declare-fun b!351619 () Bool)

(declare-fun e!215328 () Bool)

(assert (=> b!351619 (= e!215328 (validKeyInArray!0 (select (arr!8979 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!351621 () Bool)

(declare-fun e!215325 () Bool)

(declare-fun e!215337 () Bool)

(assert (=> b!351621 (= e!215325 e!215337)))

(declare-fun c!53458 () Bool)

(assert (=> b!351621 (= c!53458 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!351622 () Bool)

(declare-fun e!215330 () Bool)

(assert (=> b!351622 (= e!215337 e!215330)))

(declare-fun res!195019 () Bool)

(declare-fun call!27015 () Bool)

(assert (=> b!351622 (= res!195019 call!27015)))

(assert (=> b!351622 (=> (not res!195019) (not e!215330))))

(declare-fun b!351623 () Bool)

(declare-fun e!215329 () Bool)

(declare-fun e!215335 () Bool)

(assert (=> b!351623 (= e!215329 e!215335)))

(declare-fun res!195023 () Bool)

(declare-fun call!27016 () Bool)

(assert (=> b!351623 (= res!195023 call!27016)))

(assert (=> b!351623 (=> (not res!195023) (not e!215335))))

(declare-fun b!351624 () Bool)

(declare-fun e!215327 () ListLongMap!4441)

(declare-fun call!27017 () ListLongMap!4441)

(declare-fun +!743 (ListLongMap!4441 tuple2!5526) ListLongMap!4441)

(assert (=> b!351624 (= e!215327 (+!743 call!27017 (tuple2!5527 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!351625 () Bool)

(assert (=> b!351625 (= e!215329 (not call!27016))))

(declare-fun b!351626 () Bool)

(declare-fun e!215333 () ListLongMap!4441)

(declare-fun call!27011 () ListLongMap!4441)

(assert (=> b!351626 (= e!215333 call!27011)))

(declare-fun b!351627 () Bool)

(assert (=> b!351627 (= e!215337 (not call!27015))))

(declare-fun bm!27008 () Bool)

(declare-fun call!27012 () ListLongMap!4441)

(declare-fun call!27014 () ListLongMap!4441)

(assert (=> bm!27008 (= call!27012 call!27014)))

(declare-fun bm!27009 () Bool)

(declare-fun call!27013 () ListLongMap!4441)

(assert (=> bm!27009 (= call!27013 call!27017)))

(declare-fun b!351628 () Bool)

(declare-fun e!215336 () Bool)

(assert (=> b!351628 (= e!215336 (validKeyInArray!0 (select (arr!8979 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!27010 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!608 (array!18950 array!18952 (_ BitVec 32) (_ BitVec 32) V!11227 V!11227 (_ BitVec 32) Int) ListLongMap!4441)

(assert (=> bm!27010 (= call!27014 (getCurrentListMapNoExtraKeys!608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun c!53456 () Bool)

(declare-fun c!53457 () Bool)

(declare-fun bm!27011 () Bool)

(assert (=> bm!27011 (= call!27017 (+!743 (ite c!53456 call!27014 (ite c!53457 call!27012 call!27011)) (ite (or c!53456 c!53457) (tuple2!5527 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5527 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun bm!27012 () Bool)

(assert (=> bm!27012 (= call!27011 call!27012)))

(declare-fun b!351629 () Bool)

(declare-fun res!195020 () Bool)

(assert (=> b!351629 (=> (not res!195020) (not e!215325))))

(declare-fun e!215334 () Bool)

(assert (=> b!351629 (= res!195020 e!215334)))

(declare-fun res!195022 () Bool)

(assert (=> b!351629 (=> res!195022 e!215334)))

(assert (=> b!351629 (= res!195022 (not e!215336))))

(declare-fun res!195021 () Bool)

(assert (=> b!351629 (=> (not res!195021) (not e!215336))))

(assert (=> b!351629 (= res!195021 (bvslt #b00000000000000000000000000000000 (size!9331 _keys!1895)))))

(declare-fun d!71509 () Bool)

(assert (=> d!71509 e!215325))

(declare-fun res!195027 () Bool)

(assert (=> d!71509 (=> (not res!195027) (not e!215325))))

(assert (=> d!71509 (= res!195027 (or (bvsge #b00000000000000000000000000000000 (size!9331 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9331 _keys!1895)))))))

(declare-fun lt!164969 () ListLongMap!4441)

(declare-fun lt!164956 () ListLongMap!4441)

(assert (=> d!71509 (= lt!164969 lt!164956)))

(declare-fun lt!164955 () Unit!10834)

(assert (=> d!71509 (= lt!164955 e!215326)))

(declare-fun c!53454 () Bool)

(assert (=> d!71509 (= c!53454 e!215328)))

(declare-fun res!195026 () Bool)

(assert (=> d!71509 (=> (not res!195026) (not e!215328))))

(assert (=> d!71509 (= res!195026 (bvslt #b00000000000000000000000000000000 (size!9331 _keys!1895)))))

(assert (=> d!71509 (= lt!164956 e!215327)))

(assert (=> d!71509 (= c!53456 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71509 (validMask!0 mask!2385)))

(assert (=> d!71509 (= (getCurrentListMap!1764 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!164969)))

(declare-fun b!351620 () Bool)

(assert (=> b!351620 (= e!215333 call!27013)))

(declare-fun b!351630 () Bool)

(declare-fun res!195025 () Bool)

(assert (=> b!351630 (=> (not res!195025) (not e!215325))))

(assert (=> b!351630 (= res!195025 e!215329)))

(declare-fun c!53459 () Bool)

(assert (=> b!351630 (= c!53459 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!351631 () Bool)

(declare-fun e!215331 () ListLongMap!4441)

(assert (=> b!351631 (= e!215331 call!27013)))

(declare-fun b!351632 () Bool)

(declare-fun c!53455 () Bool)

(assert (=> b!351632 (= c!53455 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!351632 (= e!215331 e!215333)))

(declare-fun b!351633 () Bool)

(declare-fun lt!164950 () Unit!10834)

(assert (=> b!351633 (= e!215326 lt!164950)))

(declare-fun lt!164961 () ListLongMap!4441)

(assert (=> b!351633 (= lt!164961 (getCurrentListMapNoExtraKeys!608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164954 () (_ BitVec 64))

(assert (=> b!351633 (= lt!164954 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164963 () (_ BitVec 64))

(assert (=> b!351633 (= lt!164963 (select (arr!8979 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164968 () Unit!10834)

(declare-fun addStillContains!268 (ListLongMap!4441 (_ BitVec 64) V!11227 (_ BitVec 64)) Unit!10834)

(assert (=> b!351633 (= lt!164968 (addStillContains!268 lt!164961 lt!164954 zeroValue!1467 lt!164963))))

(assert (=> b!351633 (contains!2325 (+!743 lt!164961 (tuple2!5527 lt!164954 zeroValue!1467)) lt!164963)))

(declare-fun lt!164962 () Unit!10834)

(assert (=> b!351633 (= lt!164962 lt!164968)))

(declare-fun lt!164952 () ListLongMap!4441)

(assert (=> b!351633 (= lt!164952 (getCurrentListMapNoExtraKeys!608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164957 () (_ BitVec 64))

(assert (=> b!351633 (= lt!164957 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164959 () (_ BitVec 64))

(assert (=> b!351633 (= lt!164959 (select (arr!8979 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164967 () Unit!10834)

(declare-fun addApplyDifferent!268 (ListLongMap!4441 (_ BitVec 64) V!11227 (_ BitVec 64)) Unit!10834)

(assert (=> b!351633 (= lt!164967 (addApplyDifferent!268 lt!164952 lt!164957 minValue!1467 lt!164959))))

(declare-fun apply!292 (ListLongMap!4441 (_ BitVec 64)) V!11227)

(assert (=> b!351633 (= (apply!292 (+!743 lt!164952 (tuple2!5527 lt!164957 minValue!1467)) lt!164959) (apply!292 lt!164952 lt!164959))))

(declare-fun lt!164970 () Unit!10834)

(assert (=> b!351633 (= lt!164970 lt!164967)))

(declare-fun lt!164964 () ListLongMap!4441)

(assert (=> b!351633 (= lt!164964 (getCurrentListMapNoExtraKeys!608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164965 () (_ BitVec 64))

(assert (=> b!351633 (= lt!164965 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164960 () (_ BitVec 64))

(assert (=> b!351633 (= lt!164960 (select (arr!8979 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164951 () Unit!10834)

(assert (=> b!351633 (= lt!164951 (addApplyDifferent!268 lt!164964 lt!164965 zeroValue!1467 lt!164960))))

(assert (=> b!351633 (= (apply!292 (+!743 lt!164964 (tuple2!5527 lt!164965 zeroValue!1467)) lt!164960) (apply!292 lt!164964 lt!164960))))

(declare-fun lt!164953 () Unit!10834)

(assert (=> b!351633 (= lt!164953 lt!164951)))

(declare-fun lt!164958 () ListLongMap!4441)

(assert (=> b!351633 (= lt!164958 (getCurrentListMapNoExtraKeys!608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164971 () (_ BitVec 64))

(assert (=> b!351633 (= lt!164971 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164966 () (_ BitVec 64))

(assert (=> b!351633 (= lt!164966 (select (arr!8979 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!351633 (= lt!164950 (addApplyDifferent!268 lt!164958 lt!164971 minValue!1467 lt!164966))))

(assert (=> b!351633 (= (apply!292 (+!743 lt!164958 (tuple2!5527 lt!164971 minValue!1467)) lt!164966) (apply!292 lt!164958 lt!164966))))

(declare-fun e!215332 () Bool)

(declare-fun b!351634 () Bool)

(declare-fun get!4806 (ValueCell!3500 V!11227) V!11227)

(declare-fun dynLambda!635 (Int (_ BitVec 64)) V!11227)

(assert (=> b!351634 (= e!215332 (= (apply!292 lt!164969 (select (arr!8979 _keys!1895) #b00000000000000000000000000000000)) (get!4806 (select (arr!8980 _values!1525) #b00000000000000000000000000000000) (dynLambda!635 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!351634 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9332 _values!1525)))))

(assert (=> b!351634 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9331 _keys!1895)))))

(declare-fun b!351635 () Bool)

(assert (=> b!351635 (= e!215327 e!215331)))

(assert (=> b!351635 (= c!53457 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!351636 () Bool)

(assert (=> b!351636 (= e!215335 (= (apply!292 lt!164969 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!351637 () Bool)

(assert (=> b!351637 (= e!215334 e!215332)))

(declare-fun res!195024 () Bool)

(assert (=> b!351637 (=> (not res!195024) (not e!215332))))

(assert (=> b!351637 (= res!195024 (contains!2325 lt!164969 (select (arr!8979 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!351637 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9331 _keys!1895)))))

(declare-fun b!351638 () Bool)

(assert (=> b!351638 (= e!215330 (= (apply!292 lt!164969 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun bm!27013 () Bool)

(assert (=> bm!27013 (= call!27016 (contains!2325 lt!164969 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27014 () Bool)

(assert (=> bm!27014 (= call!27015 (contains!2325 lt!164969 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!71509 c!53456) b!351624))

(assert (= (and d!71509 (not c!53456)) b!351635))

(assert (= (and b!351635 c!53457) b!351631))

(assert (= (and b!351635 (not c!53457)) b!351632))

(assert (= (and b!351632 c!53455) b!351620))

(assert (= (and b!351632 (not c!53455)) b!351626))

(assert (= (or b!351620 b!351626) bm!27012))

(assert (= (or b!351631 bm!27012) bm!27008))

(assert (= (or b!351631 b!351620) bm!27009))

(assert (= (or b!351624 bm!27008) bm!27010))

(assert (= (or b!351624 bm!27009) bm!27011))

(assert (= (and d!71509 res!195026) b!351619))

(assert (= (and d!71509 c!53454) b!351633))

(assert (= (and d!71509 (not c!53454)) b!351618))

(assert (= (and d!71509 res!195027) b!351629))

(assert (= (and b!351629 res!195021) b!351628))

(assert (= (and b!351629 (not res!195022)) b!351637))

(assert (= (and b!351637 res!195024) b!351634))

(assert (= (and b!351629 res!195020) b!351630))

(assert (= (and b!351630 c!53459) b!351623))

(assert (= (and b!351630 (not c!53459)) b!351625))

(assert (= (and b!351623 res!195023) b!351636))

(assert (= (or b!351623 b!351625) bm!27013))

(assert (= (and b!351630 res!195025) b!351621))

(assert (= (and b!351621 c!53458) b!351622))

(assert (= (and b!351621 (not c!53458)) b!351627))

(assert (= (and b!351622 res!195019) b!351638))

(assert (= (or b!351622 b!351627) bm!27014))

(declare-fun b_lambda!8529 () Bool)

(assert (=> (not b_lambda!8529) (not b!351634)))

(declare-fun t!10267 () Bool)

(declare-fun tb!3091 () Bool)

(assert (=> (and start!35054 (= defaultEntry!1528 defaultEntry!1528) t!10267) tb!3091))

(declare-fun result!5619 () Bool)

(assert (=> tb!3091 (= result!5619 tp_is_empty!7687)))

(assert (=> b!351634 t!10267))

(declare-fun b_and!14987 () Bool)

(assert (= b_and!14981 (and (=> t!10267 result!5619) b_and!14987)))

(assert (=> d!71509 m!351639))

(declare-fun m!351741 () Bool)

(assert (=> bm!27013 m!351741))

(declare-fun m!351743 () Bool)

(assert (=> bm!27014 m!351743))

(assert (=> b!351628 m!351715))

(assert (=> b!351628 m!351715))

(assert (=> b!351628 m!351719))

(declare-fun m!351745 () Bool)

(assert (=> b!351624 m!351745))

(declare-fun m!351747 () Bool)

(assert (=> b!351638 m!351747))

(declare-fun m!351749 () Bool)

(assert (=> bm!27010 m!351749))

(declare-fun m!351751 () Bool)

(assert (=> b!351633 m!351751))

(declare-fun m!351753 () Bool)

(assert (=> b!351633 m!351753))

(declare-fun m!351755 () Bool)

(assert (=> b!351633 m!351755))

(declare-fun m!351757 () Bool)

(assert (=> b!351633 m!351757))

(assert (=> b!351633 m!351755))

(declare-fun m!351759 () Bool)

(assert (=> b!351633 m!351759))

(declare-fun m!351761 () Bool)

(assert (=> b!351633 m!351761))

(declare-fun m!351763 () Bool)

(assert (=> b!351633 m!351763))

(declare-fun m!351765 () Bool)

(assert (=> b!351633 m!351765))

(declare-fun m!351767 () Bool)

(assert (=> b!351633 m!351767))

(assert (=> b!351633 m!351751))

(assert (=> b!351633 m!351763))

(declare-fun m!351769 () Bool)

(assert (=> b!351633 m!351769))

(declare-fun m!351771 () Bool)

(assert (=> b!351633 m!351771))

(declare-fun m!351773 () Bool)

(assert (=> b!351633 m!351773))

(declare-fun m!351775 () Bool)

(assert (=> b!351633 m!351775))

(assert (=> b!351633 m!351715))

(declare-fun m!351777 () Bool)

(assert (=> b!351633 m!351777))

(assert (=> b!351633 m!351749))

(assert (=> b!351633 m!351773))

(declare-fun m!351779 () Bool)

(assert (=> b!351633 m!351779))

(declare-fun m!351781 () Bool)

(assert (=> b!351634 m!351781))

(assert (=> b!351634 m!351781))

(declare-fun m!351783 () Bool)

(assert (=> b!351634 m!351783))

(declare-fun m!351785 () Bool)

(assert (=> b!351634 m!351785))

(assert (=> b!351634 m!351715))

(assert (=> b!351634 m!351715))

(declare-fun m!351787 () Bool)

(assert (=> b!351634 m!351787))

(assert (=> b!351634 m!351783))

(assert (=> b!351637 m!351715))

(assert (=> b!351637 m!351715))

(declare-fun m!351789 () Bool)

(assert (=> b!351637 m!351789))

(assert (=> b!351619 m!351715))

(assert (=> b!351619 m!351715))

(assert (=> b!351619 m!351719))

(declare-fun m!351791 () Bool)

(assert (=> b!351636 m!351791))

(declare-fun m!351793 () Bool)

(assert (=> bm!27011 m!351793))

(assert (=> b!351465 d!71509))

(declare-fun bm!27017 () Bool)

(declare-fun call!27020 () Bool)

(declare-fun c!53462 () Bool)

(assert (=> bm!27017 (= call!27020 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53462 (Cons!5126 (select (arr!8979 _keys!1895) #b00000000000000000000000000000000) Nil!5127) Nil!5127)))))

(declare-fun b!351651 () Bool)

(declare-fun e!215349 () Bool)

(declare-fun contains!2327 (List!5130 (_ BitVec 64)) Bool)

(assert (=> b!351651 (= e!215349 (contains!2327 Nil!5127 (select (arr!8979 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71511 () Bool)

(declare-fun res!195035 () Bool)

(declare-fun e!215347 () Bool)

(assert (=> d!71511 (=> res!195035 e!215347)))

(assert (=> d!71511 (= res!195035 (bvsge #b00000000000000000000000000000000 (size!9331 _keys!1895)))))

(assert (=> d!71511 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5127) e!215347)))

(declare-fun b!351652 () Bool)

(declare-fun e!215346 () Bool)

(declare-fun e!215348 () Bool)

(assert (=> b!351652 (= e!215346 e!215348)))

(assert (=> b!351652 (= c!53462 (validKeyInArray!0 (select (arr!8979 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!351653 () Bool)

(assert (=> b!351653 (= e!215347 e!215346)))

(declare-fun res!195036 () Bool)

(assert (=> b!351653 (=> (not res!195036) (not e!215346))))

(assert (=> b!351653 (= res!195036 (not e!215349))))

(declare-fun res!195034 () Bool)

(assert (=> b!351653 (=> (not res!195034) (not e!215349))))

(assert (=> b!351653 (= res!195034 (validKeyInArray!0 (select (arr!8979 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!351654 () Bool)

(assert (=> b!351654 (= e!215348 call!27020)))

(declare-fun b!351655 () Bool)

(assert (=> b!351655 (= e!215348 call!27020)))

(assert (= (and d!71511 (not res!195035)) b!351653))

(assert (= (and b!351653 res!195034) b!351651))

(assert (= (and b!351653 res!195036) b!351652))

(assert (= (and b!351652 c!53462) b!351655))

(assert (= (and b!351652 (not c!53462)) b!351654))

(assert (= (or b!351655 b!351654) bm!27017))

(assert (=> bm!27017 m!351715))

(declare-fun m!351795 () Bool)

(assert (=> bm!27017 m!351795))

(assert (=> b!351651 m!351715))

(assert (=> b!351651 m!351715))

(declare-fun m!351797 () Bool)

(assert (=> b!351651 m!351797))

(assert (=> b!351652 m!351715))

(assert (=> b!351652 m!351715))

(assert (=> b!351652 m!351719))

(assert (=> b!351653 m!351715))

(assert (=> b!351653 m!351715))

(assert (=> b!351653 m!351719))

(assert (=> b!351459 d!71511))

(declare-fun b!351668 () Bool)

(declare-fun e!215356 () SeekEntryResult!3410)

(declare-fun lt!164979 () SeekEntryResult!3410)

(assert (=> b!351668 (= e!215356 (Found!3410 (index!15821 lt!164979)))))

(declare-fun b!351669 () Bool)

(declare-fun e!215357 () SeekEntryResult!3410)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18950 (_ BitVec 32)) SeekEntryResult!3410)

(assert (=> b!351669 (= e!215357 (seekKeyOrZeroReturnVacant!0 (x!34937 lt!164979) (index!15821 lt!164979) (index!15821 lt!164979) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!351670 () Bool)

(declare-fun c!53469 () Bool)

(declare-fun lt!164978 () (_ BitVec 64))

(assert (=> b!351670 (= c!53469 (= lt!164978 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!351670 (= e!215356 e!215357)))

(declare-fun b!351671 () Bool)

(assert (=> b!351671 (= e!215357 (MissingZero!3410 (index!15821 lt!164979)))))

(declare-fun d!71513 () Bool)

(declare-fun lt!164980 () SeekEntryResult!3410)

(assert (=> d!71513 (and (or ((_ is Undefined!3410) lt!164980) (not ((_ is Found!3410) lt!164980)) (and (bvsge (index!15820 lt!164980) #b00000000000000000000000000000000) (bvslt (index!15820 lt!164980) (size!9331 _keys!1895)))) (or ((_ is Undefined!3410) lt!164980) ((_ is Found!3410) lt!164980) (not ((_ is MissingZero!3410) lt!164980)) (and (bvsge (index!15819 lt!164980) #b00000000000000000000000000000000) (bvslt (index!15819 lt!164980) (size!9331 _keys!1895)))) (or ((_ is Undefined!3410) lt!164980) ((_ is Found!3410) lt!164980) ((_ is MissingZero!3410) lt!164980) (not ((_ is MissingVacant!3410) lt!164980)) (and (bvsge (index!15822 lt!164980) #b00000000000000000000000000000000) (bvslt (index!15822 lt!164980) (size!9331 _keys!1895)))) (or ((_ is Undefined!3410) lt!164980) (ite ((_ is Found!3410) lt!164980) (= (select (arr!8979 _keys!1895) (index!15820 lt!164980)) k0!1348) (ite ((_ is MissingZero!3410) lt!164980) (= (select (arr!8979 _keys!1895) (index!15819 lt!164980)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3410) lt!164980) (= (select (arr!8979 _keys!1895) (index!15822 lt!164980)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!215358 () SeekEntryResult!3410)

(assert (=> d!71513 (= lt!164980 e!215358)))

(declare-fun c!53470 () Bool)

(assert (=> d!71513 (= c!53470 (and ((_ is Intermediate!3410) lt!164979) (undefined!4222 lt!164979)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18950 (_ BitVec 32)) SeekEntryResult!3410)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71513 (= lt!164979 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71513 (validMask!0 mask!2385)))

(assert (=> d!71513 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!164980)))

(declare-fun b!351672 () Bool)

(assert (=> b!351672 (= e!215358 e!215356)))

(assert (=> b!351672 (= lt!164978 (select (arr!8979 _keys!1895) (index!15821 lt!164979)))))

(declare-fun c!53471 () Bool)

(assert (=> b!351672 (= c!53471 (= lt!164978 k0!1348))))

(declare-fun b!351673 () Bool)

(assert (=> b!351673 (= e!215358 Undefined!3410)))

(assert (= (and d!71513 c!53470) b!351673))

(assert (= (and d!71513 (not c!53470)) b!351672))

(assert (= (and b!351672 c!53471) b!351668))

(assert (= (and b!351672 (not c!53471)) b!351670))

(assert (= (and b!351670 c!53469) b!351671))

(assert (= (and b!351670 (not c!53469)) b!351669))

(declare-fun m!351799 () Bool)

(assert (=> b!351669 m!351799))

(declare-fun m!351801 () Bool)

(assert (=> d!71513 m!351801))

(declare-fun m!351803 () Bool)

(assert (=> d!71513 m!351803))

(declare-fun m!351805 () Bool)

(assert (=> d!71513 m!351805))

(declare-fun m!351807 () Bool)

(assert (=> d!71513 m!351807))

(assert (=> d!71513 m!351639))

(assert (=> d!71513 m!351801))

(declare-fun m!351809 () Bool)

(assert (=> d!71513 m!351809))

(declare-fun m!351811 () Bool)

(assert (=> b!351672 m!351811))

(assert (=> b!351468 d!71513))

(declare-fun d!71515 () Bool)

(assert (=> d!71515 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!351467 d!71515))

(declare-fun d!71517 () Bool)

(declare-fun res!195037 () Bool)

(declare-fun e!215359 () Bool)

(assert (=> d!71517 (=> res!195037 e!215359)))

(assert (=> d!71517 (= res!195037 (= (select (arr!8979 _keys!1895) lt!164869) k0!1348))))

(assert (=> d!71517 (= (arrayContainsKey!0 _keys!1895 k0!1348 lt!164869) e!215359)))

(declare-fun b!351674 () Bool)

(declare-fun e!215360 () Bool)

(assert (=> b!351674 (= e!215359 e!215360)))

(declare-fun res!195038 () Bool)

(assert (=> b!351674 (=> (not res!195038) (not e!215360))))

(assert (=> b!351674 (= res!195038 (bvslt (bvadd lt!164869 #b00000000000000000000000000000001) (size!9331 _keys!1895)))))

(declare-fun b!351675 () Bool)

(assert (=> b!351675 (= e!215360 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd lt!164869 #b00000000000000000000000000000001)))))

(assert (= (and d!71517 (not res!195037)) b!351674))

(assert (= (and b!351674 res!195038) b!351675))

(declare-fun m!351813 () Bool)

(assert (=> d!71517 m!351813))

(declare-fun m!351815 () Bool)

(assert (=> b!351675 m!351815))

(assert (=> b!351462 d!71517))

(declare-fun d!71519 () Bool)

(assert (=> d!71519 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!35054 d!71519))

(declare-fun d!71521 () Bool)

(assert (=> d!71521 (= (array_inv!6632 _values!1525) (bvsge (size!9332 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!35054 d!71521))

(declare-fun d!71523 () Bool)

(assert (=> d!71523 (= (array_inv!6633 _keys!1895) (bvsge (size!9331 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!35054 d!71523))

(declare-fun mapNonEmpty!13014 () Bool)

(declare-fun mapRes!13014 () Bool)

(declare-fun tp!26802 () Bool)

(declare-fun e!215365 () Bool)

(assert (=> mapNonEmpty!13014 (= mapRes!13014 (and tp!26802 e!215365))))

(declare-fun mapValue!13014 () ValueCell!3500)

(declare-fun mapKey!13014 () (_ BitVec 32))

(declare-fun mapRest!13014 () (Array (_ BitVec 32) ValueCell!3500))

(assert (=> mapNonEmpty!13014 (= mapRest!13005 (store mapRest!13014 mapKey!13014 mapValue!13014))))

(declare-fun mapIsEmpty!13014 () Bool)

(assert (=> mapIsEmpty!13014 mapRes!13014))

(declare-fun b!351682 () Bool)

(assert (=> b!351682 (= e!215365 tp_is_empty!7687)))

(declare-fun condMapEmpty!13014 () Bool)

(declare-fun mapDefault!13014 () ValueCell!3500)

(assert (=> mapNonEmpty!13005 (= condMapEmpty!13014 (= mapRest!13005 ((as const (Array (_ BitVec 32) ValueCell!3500)) mapDefault!13014)))))

(declare-fun e!215366 () Bool)

(assert (=> mapNonEmpty!13005 (= tp!26786 (and e!215366 mapRes!13014))))

(declare-fun b!351683 () Bool)

(assert (=> b!351683 (= e!215366 tp_is_empty!7687)))

(assert (= (and mapNonEmpty!13005 condMapEmpty!13014) mapIsEmpty!13014))

(assert (= (and mapNonEmpty!13005 (not condMapEmpty!13014)) mapNonEmpty!13014))

(assert (= (and mapNonEmpty!13014 ((_ is ValueCellFull!3500) mapValue!13014)) b!351682))

(assert (= (and mapNonEmpty!13005 ((_ is ValueCellFull!3500) mapDefault!13014)) b!351683))

(declare-fun m!351817 () Bool)

(assert (=> mapNonEmpty!13014 m!351817))

(declare-fun b_lambda!8531 () Bool)

(assert (= b_lambda!8529 (or (and start!35054 b_free!7735) b_lambda!8531)))

(check-sat (not b!351575) (not b_lambda!8531) (not b!351675) (not b!351633) (not b!351566) (not b!351560) (not mapNonEmpty!13014) (not b!351651) (not b_next!7735) (not b!351637) tp_is_empty!7687 (not b!351628) (not b!351558) (not b!351653) (not bm!27010) (not d!71509) (not bm!27011) (not b!351638) (not bm!27017) (not b!351573) (not bm!27013) (not b!351619) (not b!351548) b_and!14987 (not b!351636) (not b!351669) (not d!71513) (not b!351624) (not b!351652) (not bm!26993) (not bm!27014) (not b!351634) (not d!71507))
(check-sat b_and!14987 (not b_next!7735))
