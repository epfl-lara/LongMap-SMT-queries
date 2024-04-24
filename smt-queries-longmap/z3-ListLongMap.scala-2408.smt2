; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38096 () Bool)

(assert start!38096)

(declare-fun b_free!9013 () Bool)

(declare-fun b_next!9013 () Bool)

(assert (=> start!38096 (= b_free!9013 (not b_next!9013))))

(declare-fun tp!31817 () Bool)

(declare-fun b_and!16377 () Bool)

(assert (=> start!38096 (= tp!31817 b_and!16377)))

(declare-fun b!392544 () Bool)

(declare-fun e!237713 () Bool)

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!392544 (= e!237713 (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!237710 () Bool)

(assert (=> b!392544 e!237710))

(declare-fun res!224822 () Bool)

(assert (=> b!392544 (=> (not res!224822) (not e!237710))))

(declare-datatypes ((V!14019 0))(
  ( (V!14020 (val!4887 Int)) )
))
(declare-datatypes ((tuple2!6454 0))(
  ( (tuple2!6455 (_1!3238 (_ BitVec 64)) (_2!3238 V!14019)) )
))
(declare-datatypes ((List!6301 0))(
  ( (Nil!6298) (Cons!6297 (h!7153 tuple2!6454) (t!11461 List!6301)) )
))
(declare-datatypes ((ListLongMap!5369 0))(
  ( (ListLongMap!5370 (toList!2700 List!6301)) )
))
(declare-fun lt!185568 () ListLongMap!5369)

(declare-fun lt!185572 () tuple2!6454)

(declare-fun lt!185567 () ListLongMap!5369)

(declare-fun +!1054 (ListLongMap!5369 tuple2!6454) ListLongMap!5369)

(assert (=> b!392544 (= res!224822 (= lt!185568 (+!1054 lt!185567 lt!185572)))))

(declare-fun minValue!472 () V!14019)

(assert (=> b!392544 (= lt!185572 (tuple2!6455 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!392545 () Bool)

(declare-fun e!237709 () Bool)

(declare-fun e!237707 () Bool)

(declare-fun mapRes!16119 () Bool)

(assert (=> b!392545 (= e!237709 (and e!237707 mapRes!16119))))

(declare-fun condMapEmpty!16119 () Bool)

(declare-datatypes ((ValueCell!4499 0))(
  ( (ValueCellFull!4499 (v!7121 V!14019)) (EmptyCell!4499) )
))
(declare-datatypes ((array!23262 0))(
  ( (array!23263 (arr!11090 (Array (_ BitVec 32) ValueCell!4499)) (size!11442 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23262)

(declare-fun mapDefault!16119 () ValueCell!4499)

(assert (=> b!392545 (= condMapEmpty!16119 (= (arr!11090 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4499)) mapDefault!16119)))))

(declare-fun b!392546 () Bool)

(declare-fun tp_is_empty!9685 () Bool)

(assert (=> b!392546 (= e!237707 tp_is_empty!9685)))

(declare-fun b!392547 () Bool)

(declare-fun res!224828 () Bool)

(assert (=> b!392547 (=> (not res!224828) (not e!237710))))

(declare-fun lt!185574 () ListLongMap!5369)

(assert (=> b!392547 (= res!224828 (= lt!185568 (+!1054 lt!185574 lt!185572)))))

(declare-fun mapNonEmpty!16119 () Bool)

(declare-fun tp!31818 () Bool)

(declare-fun e!237712 () Bool)

(assert (=> mapNonEmpty!16119 (= mapRes!16119 (and tp!31818 e!237712))))

(declare-fun mapKey!16119 () (_ BitVec 32))

(declare-fun mapRest!16119 () (Array (_ BitVec 32) ValueCell!4499))

(declare-fun mapValue!16119 () ValueCell!4499)

(assert (=> mapNonEmpty!16119 (= (arr!11090 _values!506) (store mapRest!16119 mapKey!16119 mapValue!16119))))

(declare-fun b!392548 () Bool)

(declare-fun e!237706 () Bool)

(assert (=> b!392548 (= e!237706 (not e!237713))))

(declare-fun res!224829 () Bool)

(assert (=> b!392548 (=> res!224829 e!237713)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!392548 (= res!224829 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!185566 () ListLongMap!5369)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14019)

(declare-datatypes ((array!23264 0))(
  ( (array!23265 (arr!11091 (Array (_ BitVec 32) (_ BitVec 64))) (size!11443 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23264)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun getCurrentListMap!2077 (array!23264 array!23262 (_ BitVec 32) (_ BitVec 32) V!14019 V!14019 (_ BitVec 32) Int) ListLongMap!5369)

(assert (=> b!392548 (= lt!185566 (getCurrentListMap!2077 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185573 () array!23264)

(declare-fun lt!185571 () array!23262)

(assert (=> b!392548 (= lt!185568 (getCurrentListMap!2077 lt!185573 lt!185571 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!392548 (and (= lt!185567 lt!185574) (= lt!185574 lt!185567))))

(declare-fun v!373 () V!14019)

(declare-fun lt!185570 () ListLongMap!5369)

(assert (=> b!392548 (= lt!185574 (+!1054 lt!185570 (tuple2!6455 k0!778 v!373)))))

(declare-datatypes ((Unit!11979 0))(
  ( (Unit!11980) )
))
(declare-fun lt!185569 () Unit!11979)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!268 (array!23264 array!23262 (_ BitVec 32) (_ BitVec 32) V!14019 V!14019 (_ BitVec 32) (_ BitVec 64) V!14019 (_ BitVec 32) Int) Unit!11979)

(assert (=> b!392548 (= lt!185569 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!268 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!966 (array!23264 array!23262 (_ BitVec 32) (_ BitVec 32) V!14019 V!14019 (_ BitVec 32) Int) ListLongMap!5369)

(assert (=> b!392548 (= lt!185567 (getCurrentListMapNoExtraKeys!966 lt!185573 lt!185571 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!392548 (= lt!185571 (array!23263 (store (arr!11090 _values!506) i!548 (ValueCellFull!4499 v!373)) (size!11442 _values!506)))))

(assert (=> b!392548 (= lt!185570 (getCurrentListMapNoExtraKeys!966 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392549 () Bool)

(declare-fun res!224820 () Bool)

(declare-fun e!237708 () Bool)

(assert (=> b!392549 (=> (not res!224820) (not e!237708))))

(declare-fun arrayContainsKey!0 (array!23264 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!392549 (= res!224820 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!392550 () Bool)

(declare-fun res!224823 () Bool)

(assert (=> b!392550 (=> (not res!224823) (not e!237708))))

(declare-datatypes ((List!6302 0))(
  ( (Nil!6299) (Cons!6298 (h!7154 (_ BitVec 64)) (t!11462 List!6302)) )
))
(declare-fun arrayNoDuplicates!0 (array!23264 (_ BitVec 32) List!6302) Bool)

(assert (=> b!392550 (= res!224823 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6299))))

(declare-fun b!392551 () Bool)

(declare-fun res!224824 () Bool)

(assert (=> b!392551 (=> (not res!224824) (not e!237708))))

(assert (=> b!392551 (= res!224824 (and (= (size!11442 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11443 _keys!658) (size!11442 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!224825 () Bool)

(assert (=> start!38096 (=> (not res!224825) (not e!237708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38096 (= res!224825 (validMask!0 mask!970))))

(assert (=> start!38096 e!237708))

(declare-fun array_inv!8194 (array!23262) Bool)

(assert (=> start!38096 (and (array_inv!8194 _values!506) e!237709)))

(assert (=> start!38096 tp!31817))

(assert (=> start!38096 true))

(assert (=> start!38096 tp_is_empty!9685))

(declare-fun array_inv!8195 (array!23264) Bool)

(assert (=> start!38096 (array_inv!8195 _keys!658)))

(declare-fun b!392543 () Bool)

(assert (=> b!392543 (= e!237708 e!237706)))

(declare-fun res!224832 () Bool)

(assert (=> b!392543 (=> (not res!224832) (not e!237706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23264 (_ BitVec 32)) Bool)

(assert (=> b!392543 (= res!224832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185573 mask!970))))

(assert (=> b!392543 (= lt!185573 (array!23265 (store (arr!11091 _keys!658) i!548 k0!778) (size!11443 _keys!658)))))

(declare-fun b!392552 () Bool)

(declare-fun res!224821 () Bool)

(assert (=> b!392552 (=> (not res!224821) (not e!237708))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!392552 (= res!224821 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!16119 () Bool)

(assert (=> mapIsEmpty!16119 mapRes!16119))

(declare-fun b!392553 () Bool)

(assert (=> b!392553 (= e!237712 tp_is_empty!9685)))

(declare-fun b!392554 () Bool)

(declare-fun res!224830 () Bool)

(assert (=> b!392554 (=> (not res!224830) (not e!237708))))

(assert (=> b!392554 (= res!224830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!392555 () Bool)

(assert (=> b!392555 (= e!237710 (= lt!185566 (+!1054 lt!185570 lt!185572)))))

(declare-fun b!392556 () Bool)

(declare-fun res!224826 () Bool)

(assert (=> b!392556 (=> (not res!224826) (not e!237708))))

(assert (=> b!392556 (= res!224826 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11443 _keys!658))))))

(declare-fun b!392557 () Bool)

(declare-fun res!224831 () Bool)

(assert (=> b!392557 (=> (not res!224831) (not e!237708))))

(assert (=> b!392557 (= res!224831 (or (= (select (arr!11091 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11091 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!392558 () Bool)

(declare-fun res!224827 () Bool)

(assert (=> b!392558 (=> (not res!224827) (not e!237706))))

(assert (=> b!392558 (= res!224827 (arrayNoDuplicates!0 lt!185573 #b00000000000000000000000000000000 Nil!6299))))

(assert (= (and start!38096 res!224825) b!392551))

(assert (= (and b!392551 res!224824) b!392554))

(assert (= (and b!392554 res!224830) b!392550))

(assert (= (and b!392550 res!224823) b!392556))

(assert (= (and b!392556 res!224826) b!392552))

(assert (= (and b!392552 res!224821) b!392557))

(assert (= (and b!392557 res!224831) b!392549))

(assert (= (and b!392549 res!224820) b!392543))

(assert (= (and b!392543 res!224832) b!392558))

(assert (= (and b!392558 res!224827) b!392548))

(assert (= (and b!392548 (not res!224829)) b!392544))

(assert (= (and b!392544 res!224822) b!392547))

(assert (= (and b!392547 res!224828) b!392555))

(assert (= (and b!392545 condMapEmpty!16119) mapIsEmpty!16119))

(assert (= (and b!392545 (not condMapEmpty!16119)) mapNonEmpty!16119))

(get-info :version)

(assert (= (and mapNonEmpty!16119 ((_ is ValueCellFull!4499) mapValue!16119)) b!392553))

(assert (= (and b!392545 ((_ is ValueCellFull!4499) mapDefault!16119)) b!392546))

(assert (= start!38096 b!392545))

(declare-fun m!389241 () Bool)

(assert (=> b!392550 m!389241))

(declare-fun m!389243 () Bool)

(assert (=> b!392549 m!389243))

(declare-fun m!389245 () Bool)

(assert (=> b!392558 m!389245))

(declare-fun m!389247 () Bool)

(assert (=> b!392554 m!389247))

(declare-fun m!389249 () Bool)

(assert (=> b!392548 m!389249))

(declare-fun m!389251 () Bool)

(assert (=> b!392548 m!389251))

(declare-fun m!389253 () Bool)

(assert (=> b!392548 m!389253))

(declare-fun m!389255 () Bool)

(assert (=> b!392548 m!389255))

(declare-fun m!389257 () Bool)

(assert (=> b!392548 m!389257))

(declare-fun m!389259 () Bool)

(assert (=> b!392548 m!389259))

(declare-fun m!389261 () Bool)

(assert (=> b!392548 m!389261))

(declare-fun m!389263 () Bool)

(assert (=> start!38096 m!389263))

(declare-fun m!389265 () Bool)

(assert (=> start!38096 m!389265))

(declare-fun m!389267 () Bool)

(assert (=> start!38096 m!389267))

(declare-fun m!389269 () Bool)

(assert (=> b!392547 m!389269))

(declare-fun m!389271 () Bool)

(assert (=> b!392552 m!389271))

(declare-fun m!389273 () Bool)

(assert (=> b!392555 m!389273))

(declare-fun m!389275 () Bool)

(assert (=> b!392543 m!389275))

(declare-fun m!389277 () Bool)

(assert (=> b!392543 m!389277))

(declare-fun m!389279 () Bool)

(assert (=> b!392544 m!389279))

(declare-fun m!389281 () Bool)

(assert (=> mapNonEmpty!16119 m!389281))

(declare-fun m!389283 () Bool)

(assert (=> b!392557 m!389283))

(check-sat b_and!16377 (not b!392548) (not b!392543) (not b_next!9013) (not b!392552) (not mapNonEmpty!16119) (not b!392550) (not b!392547) (not b!392555) (not b!392554) (not b!392549) tp_is_empty!9685 (not b!392544) (not start!38096) (not b!392558))
(check-sat b_and!16377 (not b_next!9013))
(get-model)

(declare-fun d!73195 () Bool)

(declare-fun e!237764 () Bool)

(assert (=> d!73195 e!237764))

(declare-fun res!224916 () Bool)

(assert (=> d!73195 (=> (not res!224916) (not e!237764))))

(declare-fun lt!185639 () ListLongMap!5369)

(declare-fun contains!2446 (ListLongMap!5369 (_ BitVec 64)) Bool)

(assert (=> d!73195 (= res!224916 (contains!2446 lt!185639 (_1!3238 lt!185572)))))

(declare-fun lt!185640 () List!6301)

(assert (=> d!73195 (= lt!185639 (ListLongMap!5370 lt!185640))))

(declare-fun lt!185637 () Unit!11979)

(declare-fun lt!185638 () Unit!11979)

(assert (=> d!73195 (= lt!185637 lt!185638)))

(declare-datatypes ((Option!371 0))(
  ( (Some!370 (v!7127 V!14019)) (None!369) )
))
(declare-fun getValueByKey!365 (List!6301 (_ BitVec 64)) Option!371)

(assert (=> d!73195 (= (getValueByKey!365 lt!185640 (_1!3238 lt!185572)) (Some!370 (_2!3238 lt!185572)))))

(declare-fun lemmaContainsTupThenGetReturnValue!187 (List!6301 (_ BitVec 64) V!14019) Unit!11979)

(assert (=> d!73195 (= lt!185638 (lemmaContainsTupThenGetReturnValue!187 lt!185640 (_1!3238 lt!185572) (_2!3238 lt!185572)))))

(declare-fun insertStrictlySorted!190 (List!6301 (_ BitVec 64) V!14019) List!6301)

(assert (=> d!73195 (= lt!185640 (insertStrictlySorted!190 (toList!2700 lt!185574) (_1!3238 lt!185572) (_2!3238 lt!185572)))))

(assert (=> d!73195 (= (+!1054 lt!185574 lt!185572) lt!185639)))

(declare-fun b!392659 () Bool)

(declare-fun res!224915 () Bool)

(assert (=> b!392659 (=> (not res!224915) (not e!237764))))

(assert (=> b!392659 (= res!224915 (= (getValueByKey!365 (toList!2700 lt!185639) (_1!3238 lt!185572)) (Some!370 (_2!3238 lt!185572))))))

(declare-fun b!392660 () Bool)

(declare-fun contains!2447 (List!6301 tuple2!6454) Bool)

(assert (=> b!392660 (= e!237764 (contains!2447 (toList!2700 lt!185639) lt!185572))))

(assert (= (and d!73195 res!224916) b!392659))

(assert (= (and b!392659 res!224915) b!392660))

(declare-fun m!389373 () Bool)

(assert (=> d!73195 m!389373))

(declare-fun m!389375 () Bool)

(assert (=> d!73195 m!389375))

(declare-fun m!389377 () Bool)

(assert (=> d!73195 m!389377))

(declare-fun m!389379 () Bool)

(assert (=> d!73195 m!389379))

(declare-fun m!389381 () Bool)

(assert (=> b!392659 m!389381))

(declare-fun m!389383 () Bool)

(assert (=> b!392660 m!389383))

(assert (=> b!392547 d!73195))

(declare-fun d!73197 () Bool)

(declare-fun e!237765 () Bool)

(assert (=> d!73197 e!237765))

(declare-fun res!224918 () Bool)

(assert (=> d!73197 (=> (not res!224918) (not e!237765))))

(declare-fun lt!185643 () ListLongMap!5369)

(assert (=> d!73197 (= res!224918 (contains!2446 lt!185643 (_1!3238 lt!185572)))))

(declare-fun lt!185644 () List!6301)

(assert (=> d!73197 (= lt!185643 (ListLongMap!5370 lt!185644))))

(declare-fun lt!185641 () Unit!11979)

(declare-fun lt!185642 () Unit!11979)

(assert (=> d!73197 (= lt!185641 lt!185642)))

(assert (=> d!73197 (= (getValueByKey!365 lt!185644 (_1!3238 lt!185572)) (Some!370 (_2!3238 lt!185572)))))

(assert (=> d!73197 (= lt!185642 (lemmaContainsTupThenGetReturnValue!187 lt!185644 (_1!3238 lt!185572) (_2!3238 lt!185572)))))

(assert (=> d!73197 (= lt!185644 (insertStrictlySorted!190 (toList!2700 lt!185570) (_1!3238 lt!185572) (_2!3238 lt!185572)))))

(assert (=> d!73197 (= (+!1054 lt!185570 lt!185572) lt!185643)))

(declare-fun b!392661 () Bool)

(declare-fun res!224917 () Bool)

(assert (=> b!392661 (=> (not res!224917) (not e!237765))))

(assert (=> b!392661 (= res!224917 (= (getValueByKey!365 (toList!2700 lt!185643) (_1!3238 lt!185572)) (Some!370 (_2!3238 lt!185572))))))

(declare-fun b!392662 () Bool)

(assert (=> b!392662 (= e!237765 (contains!2447 (toList!2700 lt!185643) lt!185572))))

(assert (= (and d!73197 res!224918) b!392661))

(assert (= (and b!392661 res!224917) b!392662))

(declare-fun m!389385 () Bool)

(assert (=> d!73197 m!389385))

(declare-fun m!389387 () Bool)

(assert (=> d!73197 m!389387))

(declare-fun m!389389 () Bool)

(assert (=> d!73197 m!389389))

(declare-fun m!389391 () Bool)

(assert (=> d!73197 m!389391))

(declare-fun m!389393 () Bool)

(assert (=> b!392661 m!389393))

(declare-fun m!389395 () Bool)

(assert (=> b!392662 m!389395))

(assert (=> b!392555 d!73197))

(declare-fun d!73199 () Bool)

(declare-fun res!224925 () Bool)

(declare-fun e!237777 () Bool)

(assert (=> d!73199 (=> res!224925 e!237777)))

(assert (=> d!73199 (= res!224925 (bvsge #b00000000000000000000000000000000 (size!11443 _keys!658)))))

(assert (=> d!73199 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6299) e!237777)))

(declare-fun b!392673 () Bool)

(declare-fun e!237776 () Bool)

(declare-fun e!237774 () Bool)

(assert (=> b!392673 (= e!237776 e!237774)))

(declare-fun c!54363 () Bool)

(assert (=> b!392673 (= c!54363 (validKeyInArray!0 (select (arr!11091 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27709 () Bool)

(declare-fun call!27712 () Bool)

(assert (=> bm!27709 (= call!27712 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54363 (Cons!6298 (select (arr!11091 _keys!658) #b00000000000000000000000000000000) Nil!6299) Nil!6299)))))

(declare-fun b!392674 () Bool)

(declare-fun e!237775 () Bool)

(declare-fun contains!2448 (List!6302 (_ BitVec 64)) Bool)

(assert (=> b!392674 (= e!237775 (contains!2448 Nil!6299 (select (arr!11091 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392675 () Bool)

(assert (=> b!392675 (= e!237774 call!27712)))

(declare-fun b!392676 () Bool)

(assert (=> b!392676 (= e!237774 call!27712)))

(declare-fun b!392677 () Bool)

(assert (=> b!392677 (= e!237777 e!237776)))

(declare-fun res!224927 () Bool)

(assert (=> b!392677 (=> (not res!224927) (not e!237776))))

(assert (=> b!392677 (= res!224927 (not e!237775))))

(declare-fun res!224926 () Bool)

(assert (=> b!392677 (=> (not res!224926) (not e!237775))))

(assert (=> b!392677 (= res!224926 (validKeyInArray!0 (select (arr!11091 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!73199 (not res!224925)) b!392677))

(assert (= (and b!392677 res!224926) b!392674))

(assert (= (and b!392677 res!224927) b!392673))

(assert (= (and b!392673 c!54363) b!392676))

(assert (= (and b!392673 (not c!54363)) b!392675))

(assert (= (or b!392676 b!392675) bm!27709))

(declare-fun m!389397 () Bool)

(assert (=> b!392673 m!389397))

(assert (=> b!392673 m!389397))

(declare-fun m!389399 () Bool)

(assert (=> b!392673 m!389399))

(assert (=> bm!27709 m!389397))

(declare-fun m!389401 () Bool)

(assert (=> bm!27709 m!389401))

(assert (=> b!392674 m!389397))

(assert (=> b!392674 m!389397))

(declare-fun m!389403 () Bool)

(assert (=> b!392674 m!389403))

(assert (=> b!392677 m!389397))

(assert (=> b!392677 m!389397))

(assert (=> b!392677 m!389399))

(assert (=> b!392550 d!73199))

(declare-fun b!392686 () Bool)

(declare-fun e!237784 () Bool)

(declare-fun e!237785 () Bool)

(assert (=> b!392686 (= e!237784 e!237785)))

(declare-fun lt!185653 () (_ BitVec 64))

(assert (=> b!392686 (= lt!185653 (select (arr!11091 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185652 () Unit!11979)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23264 (_ BitVec 64) (_ BitVec 32)) Unit!11979)

(assert (=> b!392686 (= lt!185652 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!185653 #b00000000000000000000000000000000))))

(assert (=> b!392686 (arrayContainsKey!0 _keys!658 lt!185653 #b00000000000000000000000000000000)))

(declare-fun lt!185651 () Unit!11979)

(assert (=> b!392686 (= lt!185651 lt!185652)))

(declare-fun res!224932 () Bool)

(declare-datatypes ((SeekEntryResult!3466 0))(
  ( (MissingZero!3466 (index!16043 (_ BitVec 32))) (Found!3466 (index!16044 (_ BitVec 32))) (Intermediate!3466 (undefined!4278 Bool) (index!16045 (_ BitVec 32)) (x!38379 (_ BitVec 32))) (Undefined!3466) (MissingVacant!3466 (index!16046 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23264 (_ BitVec 32)) SeekEntryResult!3466)

(assert (=> b!392686 (= res!224932 (= (seekEntryOrOpen!0 (select (arr!11091 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3466 #b00000000000000000000000000000000)))))

(assert (=> b!392686 (=> (not res!224932) (not e!237785))))

(declare-fun b!392687 () Bool)

(declare-fun call!27715 () Bool)

(assert (=> b!392687 (= e!237785 call!27715)))

(declare-fun bm!27712 () Bool)

(assert (=> bm!27712 (= call!27715 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!392688 () Bool)

(declare-fun e!237786 () Bool)

(assert (=> b!392688 (= e!237786 e!237784)))

(declare-fun c!54366 () Bool)

(assert (=> b!392688 (= c!54366 (validKeyInArray!0 (select (arr!11091 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392689 () Bool)

(assert (=> b!392689 (= e!237784 call!27715)))

(declare-fun d!73201 () Bool)

(declare-fun res!224933 () Bool)

(assert (=> d!73201 (=> res!224933 e!237786)))

(assert (=> d!73201 (= res!224933 (bvsge #b00000000000000000000000000000000 (size!11443 _keys!658)))))

(assert (=> d!73201 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!237786)))

(assert (= (and d!73201 (not res!224933)) b!392688))

(assert (= (and b!392688 c!54366) b!392686))

(assert (= (and b!392688 (not c!54366)) b!392689))

(assert (= (and b!392686 res!224932) b!392687))

(assert (= (or b!392687 b!392689) bm!27712))

(assert (=> b!392686 m!389397))

(declare-fun m!389405 () Bool)

(assert (=> b!392686 m!389405))

(declare-fun m!389407 () Bool)

(assert (=> b!392686 m!389407))

(assert (=> b!392686 m!389397))

(declare-fun m!389409 () Bool)

(assert (=> b!392686 m!389409))

(declare-fun m!389411 () Bool)

(assert (=> bm!27712 m!389411))

(assert (=> b!392688 m!389397))

(assert (=> b!392688 m!389397))

(assert (=> b!392688 m!389399))

(assert (=> b!392554 d!73201))

(declare-fun d!73203 () Bool)

(declare-fun res!224938 () Bool)

(declare-fun e!237791 () Bool)

(assert (=> d!73203 (=> res!224938 e!237791)))

(assert (=> d!73203 (= res!224938 (= (select (arr!11091 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!73203 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!237791)))

(declare-fun b!392694 () Bool)

(declare-fun e!237792 () Bool)

(assert (=> b!392694 (= e!237791 e!237792)))

(declare-fun res!224939 () Bool)

(assert (=> b!392694 (=> (not res!224939) (not e!237792))))

(assert (=> b!392694 (= res!224939 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11443 _keys!658)))))

(declare-fun b!392695 () Bool)

(assert (=> b!392695 (= e!237792 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73203 (not res!224938)) b!392694))

(assert (= (and b!392694 res!224939) b!392695))

(assert (=> d!73203 m!389397))

(declare-fun m!389413 () Bool)

(assert (=> b!392695 m!389413))

(assert (=> b!392549 d!73203))

(declare-fun d!73205 () Bool)

(assert (=> d!73205 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!38096 d!73205))

(declare-fun d!73207 () Bool)

(assert (=> d!73207 (= (array_inv!8194 _values!506) (bvsge (size!11442 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!38096 d!73207))

(declare-fun d!73209 () Bool)

(assert (=> d!73209 (= (array_inv!8195 _keys!658) (bvsge (size!11443 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!38096 d!73209))

(declare-fun d!73211 () Bool)

(declare-fun e!237793 () Bool)

(assert (=> d!73211 e!237793))

(declare-fun res!224941 () Bool)

(assert (=> d!73211 (=> (not res!224941) (not e!237793))))

(declare-fun lt!185656 () ListLongMap!5369)

(assert (=> d!73211 (= res!224941 (contains!2446 lt!185656 (_1!3238 lt!185572)))))

(declare-fun lt!185657 () List!6301)

(assert (=> d!73211 (= lt!185656 (ListLongMap!5370 lt!185657))))

(declare-fun lt!185654 () Unit!11979)

(declare-fun lt!185655 () Unit!11979)

(assert (=> d!73211 (= lt!185654 lt!185655)))

(assert (=> d!73211 (= (getValueByKey!365 lt!185657 (_1!3238 lt!185572)) (Some!370 (_2!3238 lt!185572)))))

(assert (=> d!73211 (= lt!185655 (lemmaContainsTupThenGetReturnValue!187 lt!185657 (_1!3238 lt!185572) (_2!3238 lt!185572)))))

(assert (=> d!73211 (= lt!185657 (insertStrictlySorted!190 (toList!2700 lt!185567) (_1!3238 lt!185572) (_2!3238 lt!185572)))))

(assert (=> d!73211 (= (+!1054 lt!185567 lt!185572) lt!185656)))

(declare-fun b!392696 () Bool)

(declare-fun res!224940 () Bool)

(assert (=> b!392696 (=> (not res!224940) (not e!237793))))

(assert (=> b!392696 (= res!224940 (= (getValueByKey!365 (toList!2700 lt!185656) (_1!3238 lt!185572)) (Some!370 (_2!3238 lt!185572))))))

(declare-fun b!392697 () Bool)

(assert (=> b!392697 (= e!237793 (contains!2447 (toList!2700 lt!185656) lt!185572))))

(assert (= (and d!73211 res!224941) b!392696))

(assert (= (and b!392696 res!224940) b!392697))

(declare-fun m!389415 () Bool)

(assert (=> d!73211 m!389415))

(declare-fun m!389417 () Bool)

(assert (=> d!73211 m!389417))

(declare-fun m!389419 () Bool)

(assert (=> d!73211 m!389419))

(declare-fun m!389421 () Bool)

(assert (=> d!73211 m!389421))

(declare-fun m!389423 () Bool)

(assert (=> b!392696 m!389423))

(declare-fun m!389425 () Bool)

(assert (=> b!392697 m!389425))

(assert (=> b!392544 d!73211))

(declare-fun d!73213 () Bool)

(declare-fun res!224942 () Bool)

(declare-fun e!237797 () Bool)

(assert (=> d!73213 (=> res!224942 e!237797)))

(assert (=> d!73213 (= res!224942 (bvsge #b00000000000000000000000000000000 (size!11443 lt!185573)))))

(assert (=> d!73213 (= (arrayNoDuplicates!0 lt!185573 #b00000000000000000000000000000000 Nil!6299) e!237797)))

(declare-fun b!392698 () Bool)

(declare-fun e!237796 () Bool)

(declare-fun e!237794 () Bool)

(assert (=> b!392698 (= e!237796 e!237794)))

(declare-fun c!54367 () Bool)

(assert (=> b!392698 (= c!54367 (validKeyInArray!0 (select (arr!11091 lt!185573) #b00000000000000000000000000000000)))))

(declare-fun bm!27713 () Bool)

(declare-fun call!27716 () Bool)

(assert (=> bm!27713 (= call!27716 (arrayNoDuplicates!0 lt!185573 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54367 (Cons!6298 (select (arr!11091 lt!185573) #b00000000000000000000000000000000) Nil!6299) Nil!6299)))))

(declare-fun b!392699 () Bool)

(declare-fun e!237795 () Bool)

(assert (=> b!392699 (= e!237795 (contains!2448 Nil!6299 (select (arr!11091 lt!185573) #b00000000000000000000000000000000)))))

(declare-fun b!392700 () Bool)

(assert (=> b!392700 (= e!237794 call!27716)))

(declare-fun b!392701 () Bool)

(assert (=> b!392701 (= e!237794 call!27716)))

(declare-fun b!392702 () Bool)

(assert (=> b!392702 (= e!237797 e!237796)))

(declare-fun res!224944 () Bool)

(assert (=> b!392702 (=> (not res!224944) (not e!237796))))

(assert (=> b!392702 (= res!224944 (not e!237795))))

(declare-fun res!224943 () Bool)

(assert (=> b!392702 (=> (not res!224943) (not e!237795))))

(assert (=> b!392702 (= res!224943 (validKeyInArray!0 (select (arr!11091 lt!185573) #b00000000000000000000000000000000)))))

(assert (= (and d!73213 (not res!224942)) b!392702))

(assert (= (and b!392702 res!224943) b!392699))

(assert (= (and b!392702 res!224944) b!392698))

(assert (= (and b!392698 c!54367) b!392701))

(assert (= (and b!392698 (not c!54367)) b!392700))

(assert (= (or b!392701 b!392700) bm!27713))

(declare-fun m!389427 () Bool)

(assert (=> b!392698 m!389427))

(assert (=> b!392698 m!389427))

(declare-fun m!389429 () Bool)

(assert (=> b!392698 m!389429))

(assert (=> bm!27713 m!389427))

(declare-fun m!389431 () Bool)

(assert (=> bm!27713 m!389431))

(assert (=> b!392699 m!389427))

(assert (=> b!392699 m!389427))

(declare-fun m!389433 () Bool)

(assert (=> b!392699 m!389433))

(assert (=> b!392702 m!389427))

(assert (=> b!392702 m!389427))

(assert (=> b!392702 m!389429))

(assert (=> b!392558 d!73213))

(declare-fun b!392745 () Bool)

(declare-fun e!237827 () Bool)

(declare-fun lt!185719 () ListLongMap!5369)

(declare-fun apply!306 (ListLongMap!5369 (_ BitVec 64)) V!14019)

(assert (=> b!392745 (= e!237827 (= (apply!306 lt!185719 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun call!27732 () ListLongMap!5369)

(declare-fun bm!27728 () Bool)

(assert (=> bm!27728 (= call!27732 (getCurrentListMapNoExtraKeys!966 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392746 () Bool)

(declare-fun e!237825 () Bool)

(declare-fun get!5614 (ValueCell!4499 V!14019) V!14019)

(declare-fun dynLambda!649 (Int (_ BitVec 64)) V!14019)

(assert (=> b!392746 (= e!237825 (= (apply!306 lt!185719 (select (arr!11091 _keys!658) #b00000000000000000000000000000000)) (get!5614 (select (arr!11090 _values!506) #b00000000000000000000000000000000) (dynLambda!649 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!392746 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11442 _values!506)))))

(assert (=> b!392746 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11443 _keys!658)))))

(declare-fun b!392747 () Bool)

(declare-fun res!224970 () Bool)

(declare-fun e!237834 () Bool)

(assert (=> b!392747 (=> (not res!224970) (not e!237834))))

(declare-fun e!237833 () Bool)

(assert (=> b!392747 (= res!224970 e!237833)))

(declare-fun res!224963 () Bool)

(assert (=> b!392747 (=> res!224963 e!237833)))

(declare-fun e!237828 () Bool)

(assert (=> b!392747 (= res!224963 (not e!237828))))

(declare-fun res!224969 () Bool)

(assert (=> b!392747 (=> (not res!224969) (not e!237828))))

(assert (=> b!392747 (= res!224969 (bvslt #b00000000000000000000000000000000 (size!11443 _keys!658)))))

(declare-fun b!392748 () Bool)

(declare-fun e!237831 () Bool)

(declare-fun call!27734 () Bool)

(assert (=> b!392748 (= e!237831 (not call!27734))))

(declare-fun b!392749 () Bool)

(declare-fun e!237824 () Bool)

(assert (=> b!392749 (= e!237824 (= (apply!306 lt!185719 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!392750 () Bool)

(declare-fun e!237832 () ListLongMap!5369)

(declare-fun call!27735 () ListLongMap!5369)

(assert (=> b!392750 (= e!237832 call!27735)))

(declare-fun b!392751 () Bool)

(declare-fun e!237835 () ListLongMap!5369)

(assert (=> b!392751 (= e!237835 call!27735)))

(declare-fun b!392752 () Bool)

(declare-fun c!54385 () Bool)

(assert (=> b!392752 (= c!54385 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!392752 (= e!237835 e!237832)))

(declare-fun b!392753 () Bool)

(assert (=> b!392753 (= e!237833 e!237825)))

(declare-fun res!224968 () Bool)

(assert (=> b!392753 (=> (not res!224968) (not e!237825))))

(assert (=> b!392753 (= res!224968 (contains!2446 lt!185719 (select (arr!11091 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!392753 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11443 _keys!658)))))

(declare-fun b!392754 () Bool)

(declare-fun e!237826 () Bool)

(assert (=> b!392754 (= e!237826 e!237824)))

(declare-fun res!224967 () Bool)

(declare-fun call!27737 () Bool)

(assert (=> b!392754 (= res!224967 call!27737)))

(assert (=> b!392754 (=> (not res!224967) (not e!237824))))

(declare-fun d!73215 () Bool)

(assert (=> d!73215 e!237834))

(declare-fun res!224964 () Bool)

(assert (=> d!73215 (=> (not res!224964) (not e!237834))))

(assert (=> d!73215 (= res!224964 (or (bvsge #b00000000000000000000000000000000 (size!11443 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11443 _keys!658)))))))

(declare-fun lt!185704 () ListLongMap!5369)

(assert (=> d!73215 (= lt!185719 lt!185704)))

(declare-fun lt!185703 () Unit!11979)

(declare-fun e!237829 () Unit!11979)

(assert (=> d!73215 (= lt!185703 e!237829)))

(declare-fun c!54382 () Bool)

(declare-fun e!237836 () Bool)

(assert (=> d!73215 (= c!54382 e!237836)))

(declare-fun res!224966 () Bool)

(assert (=> d!73215 (=> (not res!224966) (not e!237836))))

(assert (=> d!73215 (= res!224966 (bvslt #b00000000000000000000000000000000 (size!11443 _keys!658)))))

(declare-fun e!237830 () ListLongMap!5369)

(assert (=> d!73215 (= lt!185704 e!237830)))

(declare-fun c!54381 () Bool)

(assert (=> d!73215 (= c!54381 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73215 (validMask!0 mask!970)))

(assert (=> d!73215 (= (getCurrentListMap!2077 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185719)))

(declare-fun b!392755 () Bool)

(assert (=> b!392755 (= e!237834 e!237826)))

(declare-fun c!54383 () Bool)

(assert (=> b!392755 (= c!54383 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!392756 () Bool)

(assert (=> b!392756 (= e!237836 (validKeyInArray!0 (select (arr!11091 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392757 () Bool)

(declare-fun lt!185723 () Unit!11979)

(assert (=> b!392757 (= e!237829 lt!185723)))

(declare-fun lt!185717 () ListLongMap!5369)

(assert (=> b!392757 (= lt!185717 (getCurrentListMapNoExtraKeys!966 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185722 () (_ BitVec 64))

(assert (=> b!392757 (= lt!185722 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185702 () (_ BitVec 64))

(assert (=> b!392757 (= lt!185702 (select (arr!11091 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185720 () Unit!11979)

(declare-fun addStillContains!282 (ListLongMap!5369 (_ BitVec 64) V!14019 (_ BitVec 64)) Unit!11979)

(assert (=> b!392757 (= lt!185720 (addStillContains!282 lt!185717 lt!185722 zeroValue!472 lt!185702))))

(assert (=> b!392757 (contains!2446 (+!1054 lt!185717 (tuple2!6455 lt!185722 zeroValue!472)) lt!185702)))

(declare-fun lt!185709 () Unit!11979)

(assert (=> b!392757 (= lt!185709 lt!185720)))

(declare-fun lt!185721 () ListLongMap!5369)

(assert (=> b!392757 (= lt!185721 (getCurrentListMapNoExtraKeys!966 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185706 () (_ BitVec 64))

(assert (=> b!392757 (= lt!185706 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185711 () (_ BitVec 64))

(assert (=> b!392757 (= lt!185711 (select (arr!11091 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185714 () Unit!11979)

(declare-fun addApplyDifferent!282 (ListLongMap!5369 (_ BitVec 64) V!14019 (_ BitVec 64)) Unit!11979)

(assert (=> b!392757 (= lt!185714 (addApplyDifferent!282 lt!185721 lt!185706 minValue!472 lt!185711))))

(assert (=> b!392757 (= (apply!306 (+!1054 lt!185721 (tuple2!6455 lt!185706 minValue!472)) lt!185711) (apply!306 lt!185721 lt!185711))))

(declare-fun lt!185710 () Unit!11979)

(assert (=> b!392757 (= lt!185710 lt!185714)))

(declare-fun lt!185716 () ListLongMap!5369)

(assert (=> b!392757 (= lt!185716 (getCurrentListMapNoExtraKeys!966 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185715 () (_ BitVec 64))

(assert (=> b!392757 (= lt!185715 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185712 () (_ BitVec 64))

(assert (=> b!392757 (= lt!185712 (select (arr!11091 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185708 () Unit!11979)

(assert (=> b!392757 (= lt!185708 (addApplyDifferent!282 lt!185716 lt!185715 zeroValue!472 lt!185712))))

(assert (=> b!392757 (= (apply!306 (+!1054 lt!185716 (tuple2!6455 lt!185715 zeroValue!472)) lt!185712) (apply!306 lt!185716 lt!185712))))

(declare-fun lt!185713 () Unit!11979)

(assert (=> b!392757 (= lt!185713 lt!185708)))

(declare-fun lt!185705 () ListLongMap!5369)

(assert (=> b!392757 (= lt!185705 (getCurrentListMapNoExtraKeys!966 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185718 () (_ BitVec 64))

(assert (=> b!392757 (= lt!185718 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185707 () (_ BitVec 64))

(assert (=> b!392757 (= lt!185707 (select (arr!11091 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!392757 (= lt!185723 (addApplyDifferent!282 lt!185705 lt!185718 minValue!472 lt!185707))))

(assert (=> b!392757 (= (apply!306 (+!1054 lt!185705 (tuple2!6455 lt!185718 minValue!472)) lt!185707) (apply!306 lt!185705 lt!185707))))

(declare-fun b!392758 () Bool)

(assert (=> b!392758 (= e!237828 (validKeyInArray!0 (select (arr!11091 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27729 () Bool)

(assert (=> bm!27729 (= call!27734 (contains!2446 lt!185719 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27730 () Bool)

(declare-fun call!27731 () ListLongMap!5369)

(assert (=> bm!27730 (= call!27735 call!27731)))

(declare-fun bm!27731 () Bool)

(declare-fun call!27736 () ListLongMap!5369)

(declare-fun call!27733 () ListLongMap!5369)

(assert (=> bm!27731 (= call!27736 call!27733)))

(declare-fun b!392759 () Bool)

(assert (=> b!392759 (= e!237826 (not call!27737))))

(declare-fun b!392760 () Bool)

(assert (=> b!392760 (= e!237832 call!27736)))

(declare-fun b!392761 () Bool)

(declare-fun res!224971 () Bool)

(assert (=> b!392761 (=> (not res!224971) (not e!237834))))

(assert (=> b!392761 (= res!224971 e!237831)))

(declare-fun c!54384 () Bool)

(assert (=> b!392761 (= c!54384 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!392762 () Bool)

(assert (=> b!392762 (= e!237830 (+!1054 call!27731 (tuple2!6455 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun c!54380 () Bool)

(declare-fun bm!27732 () Bool)

(assert (=> bm!27732 (= call!27731 (+!1054 (ite c!54381 call!27732 (ite c!54380 call!27733 call!27736)) (ite (or c!54381 c!54380) (tuple2!6455 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6455 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!392763 () Bool)

(declare-fun Unit!11985 () Unit!11979)

(assert (=> b!392763 (= e!237829 Unit!11985)))

(declare-fun b!392764 () Bool)

(assert (=> b!392764 (= e!237831 e!237827)))

(declare-fun res!224965 () Bool)

(assert (=> b!392764 (= res!224965 call!27734)))

(assert (=> b!392764 (=> (not res!224965) (not e!237827))))

(declare-fun bm!27733 () Bool)

(assert (=> bm!27733 (= call!27733 call!27732)))

(declare-fun bm!27734 () Bool)

(assert (=> bm!27734 (= call!27737 (contains!2446 lt!185719 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!392765 () Bool)

(assert (=> b!392765 (= e!237830 e!237835)))

(assert (=> b!392765 (= c!54380 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!73215 c!54381) b!392762))

(assert (= (and d!73215 (not c!54381)) b!392765))

(assert (= (and b!392765 c!54380) b!392751))

(assert (= (and b!392765 (not c!54380)) b!392752))

(assert (= (and b!392752 c!54385) b!392750))

(assert (= (and b!392752 (not c!54385)) b!392760))

(assert (= (or b!392750 b!392760) bm!27731))

(assert (= (or b!392751 bm!27731) bm!27733))

(assert (= (or b!392751 b!392750) bm!27730))

(assert (= (or b!392762 bm!27733) bm!27728))

(assert (= (or b!392762 bm!27730) bm!27732))

(assert (= (and d!73215 res!224966) b!392756))

(assert (= (and d!73215 c!54382) b!392757))

(assert (= (and d!73215 (not c!54382)) b!392763))

(assert (= (and d!73215 res!224964) b!392747))

(assert (= (and b!392747 res!224969) b!392758))

(assert (= (and b!392747 (not res!224963)) b!392753))

(assert (= (and b!392753 res!224968) b!392746))

(assert (= (and b!392747 res!224970) b!392761))

(assert (= (and b!392761 c!54384) b!392764))

(assert (= (and b!392761 (not c!54384)) b!392748))

(assert (= (and b!392764 res!224965) b!392745))

(assert (= (or b!392764 b!392748) bm!27729))

(assert (= (and b!392761 res!224971) b!392755))

(assert (= (and b!392755 c!54383) b!392754))

(assert (= (and b!392755 (not c!54383)) b!392759))

(assert (= (and b!392754 res!224967) b!392749))

(assert (= (or b!392754 b!392759) bm!27734))

(declare-fun b_lambda!8765 () Bool)

(assert (=> (not b_lambda!8765) (not b!392746)))

(declare-fun t!11468 () Bool)

(declare-fun tb!3119 () Bool)

(assert (=> (and start!38096 (= defaultEntry!514 defaultEntry!514) t!11468) tb!3119))

(declare-fun result!5753 () Bool)

(assert (=> tb!3119 (= result!5753 tp_is_empty!9685)))

(assert (=> b!392746 t!11468))

(declare-fun b_and!16383 () Bool)

(assert (= b_and!16377 (and (=> t!11468 result!5753) b_and!16383)))

(declare-fun m!389435 () Bool)

(assert (=> bm!27732 m!389435))

(declare-fun m!389437 () Bool)

(assert (=> b!392746 m!389437))

(declare-fun m!389439 () Bool)

(assert (=> b!392746 m!389439))

(declare-fun m!389441 () Bool)

(assert (=> b!392746 m!389441))

(assert (=> b!392746 m!389437))

(assert (=> b!392746 m!389397))

(declare-fun m!389443 () Bool)

(assert (=> b!392746 m!389443))

(assert (=> b!392746 m!389439))

(assert (=> b!392746 m!389397))

(declare-fun m!389445 () Bool)

(assert (=> b!392762 m!389445))

(assert (=> bm!27728 m!389259))

(declare-fun m!389447 () Bool)

(assert (=> b!392745 m!389447))

(declare-fun m!389449 () Bool)

(assert (=> bm!27729 m!389449))

(assert (=> b!392756 m!389397))

(assert (=> b!392756 m!389397))

(assert (=> b!392756 m!389399))

(assert (=> d!73215 m!389263))

(declare-fun m!389451 () Bool)

(assert (=> b!392757 m!389451))

(declare-fun m!389453 () Bool)

(assert (=> b!392757 m!389453))

(declare-fun m!389455 () Bool)

(assert (=> b!392757 m!389455))

(declare-fun m!389457 () Bool)

(assert (=> b!392757 m!389457))

(declare-fun m!389459 () Bool)

(assert (=> b!392757 m!389459))

(declare-fun m!389461 () Bool)

(assert (=> b!392757 m!389461))

(assert (=> b!392757 m!389451))

(declare-fun m!389463 () Bool)

(assert (=> b!392757 m!389463))

(declare-fun m!389465 () Bool)

(assert (=> b!392757 m!389465))

(assert (=> b!392757 m!389465))

(declare-fun m!389467 () Bool)

(assert (=> b!392757 m!389467))

(declare-fun m!389469 () Bool)

(assert (=> b!392757 m!389469))

(declare-fun m!389471 () Bool)

(assert (=> b!392757 m!389471))

(declare-fun m!389473 () Bool)

(assert (=> b!392757 m!389473))

(declare-fun m!389475 () Bool)

(assert (=> b!392757 m!389475))

(assert (=> b!392757 m!389397))

(declare-fun m!389477 () Bool)

(assert (=> b!392757 m!389477))

(assert (=> b!392757 m!389259))

(declare-fun m!389479 () Bool)

(assert (=> b!392757 m!389479))

(assert (=> b!392757 m!389453))

(assert (=> b!392757 m!389457))

(declare-fun m!389481 () Bool)

(assert (=> bm!27734 m!389481))

(assert (=> b!392758 m!389397))

(assert (=> b!392758 m!389397))

(assert (=> b!392758 m!389399))

(declare-fun m!389483 () Bool)

(assert (=> b!392749 m!389483))

(assert (=> b!392753 m!389397))

(assert (=> b!392753 m!389397))

(declare-fun m!389485 () Bool)

(assert (=> b!392753 m!389485))

(assert (=> b!392548 d!73215))

(declare-fun bm!27737 () Bool)

(declare-fun call!27740 () ListLongMap!5369)

(assert (=> bm!27737 (= call!27740 (getCurrentListMapNoExtraKeys!966 lt!185573 lt!185571 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun e!237852 () Bool)

(declare-fun b!392792 () Bool)

(declare-fun lt!185741 () ListLongMap!5369)

(assert (=> b!392792 (= e!237852 (= lt!185741 (getCurrentListMapNoExtraKeys!966 lt!185573 lt!185571 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!392793 () Bool)

(declare-fun e!237857 () ListLongMap!5369)

(assert (=> b!392793 (= e!237857 (ListLongMap!5370 Nil!6298))))

(declare-fun b!392794 () Bool)

(declare-fun e!237854 () Bool)

(assert (=> b!392794 (= e!237854 (validKeyInArray!0 (select (arr!11091 lt!185573) #b00000000000000000000000000000000)))))

(assert (=> b!392794 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!392795 () Bool)

(declare-fun e!237853 () Bool)

(declare-fun e!237851 () Bool)

(assert (=> b!392795 (= e!237853 e!237851)))

(assert (=> b!392795 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11443 lt!185573)))))

(declare-fun res!224980 () Bool)

(assert (=> b!392795 (= res!224980 (contains!2446 lt!185741 (select (arr!11091 lt!185573) #b00000000000000000000000000000000)))))

(assert (=> b!392795 (=> (not res!224980) (not e!237851))))

(declare-fun b!392796 () Bool)

(declare-fun e!237856 () ListLongMap!5369)

(assert (=> b!392796 (= e!237857 e!237856)))

(declare-fun c!54396 () Bool)

(assert (=> b!392796 (= c!54396 (validKeyInArray!0 (select (arr!11091 lt!185573) #b00000000000000000000000000000000)))))

(declare-fun b!392797 () Bool)

(declare-fun isEmpty!558 (ListLongMap!5369) Bool)

(assert (=> b!392797 (= e!237852 (isEmpty!558 lt!185741))))

(declare-fun b!392798 () Bool)

(assert (=> b!392798 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11443 lt!185573)))))

(assert (=> b!392798 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11442 lt!185571)))))

(assert (=> b!392798 (= e!237851 (= (apply!306 lt!185741 (select (arr!11091 lt!185573) #b00000000000000000000000000000000)) (get!5614 (select (arr!11090 lt!185571) #b00000000000000000000000000000000) (dynLambda!649 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!392799 () Bool)

(declare-fun lt!185743 () Unit!11979)

(declare-fun lt!185742 () Unit!11979)

(assert (=> b!392799 (= lt!185743 lt!185742)))

(declare-fun lt!185739 () ListLongMap!5369)

(declare-fun lt!185744 () (_ BitVec 64))

(declare-fun lt!185738 () (_ BitVec 64))

(declare-fun lt!185740 () V!14019)

(assert (=> b!392799 (not (contains!2446 (+!1054 lt!185739 (tuple2!6455 lt!185738 lt!185740)) lt!185744))))

(declare-fun addStillNotContains!141 (ListLongMap!5369 (_ BitVec 64) V!14019 (_ BitVec 64)) Unit!11979)

(assert (=> b!392799 (= lt!185742 (addStillNotContains!141 lt!185739 lt!185738 lt!185740 lt!185744))))

(assert (=> b!392799 (= lt!185744 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!392799 (= lt!185740 (get!5614 (select (arr!11090 lt!185571) #b00000000000000000000000000000000) (dynLambda!649 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!392799 (= lt!185738 (select (arr!11091 lt!185573) #b00000000000000000000000000000000))))

(assert (=> b!392799 (= lt!185739 call!27740)))

(assert (=> b!392799 (= e!237856 (+!1054 call!27740 (tuple2!6455 (select (arr!11091 lt!185573) #b00000000000000000000000000000000) (get!5614 (select (arr!11090 lt!185571) #b00000000000000000000000000000000) (dynLambda!649 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!392800 () Bool)

(declare-fun e!237855 () Bool)

(assert (=> b!392800 (= e!237855 e!237853)))

(declare-fun c!54395 () Bool)

(assert (=> b!392800 (= c!54395 e!237854)))

(declare-fun res!224981 () Bool)

(assert (=> b!392800 (=> (not res!224981) (not e!237854))))

(assert (=> b!392800 (= res!224981 (bvslt #b00000000000000000000000000000000 (size!11443 lt!185573)))))

(declare-fun d!73217 () Bool)

(assert (=> d!73217 e!237855))

(declare-fun res!224983 () Bool)

(assert (=> d!73217 (=> (not res!224983) (not e!237855))))

(assert (=> d!73217 (= res!224983 (not (contains!2446 lt!185741 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73217 (= lt!185741 e!237857)))

(declare-fun c!54394 () Bool)

(assert (=> d!73217 (= c!54394 (bvsge #b00000000000000000000000000000000 (size!11443 lt!185573)))))

(assert (=> d!73217 (validMask!0 mask!970)))

(assert (=> d!73217 (= (getCurrentListMapNoExtraKeys!966 lt!185573 lt!185571 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185741)))

(declare-fun b!392801 () Bool)

(assert (=> b!392801 (= e!237853 e!237852)))

(declare-fun c!54397 () Bool)

(assert (=> b!392801 (= c!54397 (bvslt #b00000000000000000000000000000000 (size!11443 lt!185573)))))

(declare-fun b!392802 () Bool)

(assert (=> b!392802 (= e!237856 call!27740)))

(declare-fun b!392803 () Bool)

(declare-fun res!224982 () Bool)

(assert (=> b!392803 (=> (not res!224982) (not e!237855))))

(assert (=> b!392803 (= res!224982 (not (contains!2446 lt!185741 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!73217 c!54394) b!392793))

(assert (= (and d!73217 (not c!54394)) b!392796))

(assert (= (and b!392796 c!54396) b!392799))

(assert (= (and b!392796 (not c!54396)) b!392802))

(assert (= (or b!392799 b!392802) bm!27737))

(assert (= (and d!73217 res!224983) b!392803))

(assert (= (and b!392803 res!224982) b!392800))

(assert (= (and b!392800 res!224981) b!392794))

(assert (= (and b!392800 c!54395) b!392795))

(assert (= (and b!392800 (not c!54395)) b!392801))

(assert (= (and b!392795 res!224980) b!392798))

(assert (= (and b!392801 c!54397) b!392792))

(assert (= (and b!392801 (not c!54397)) b!392797))

(declare-fun b_lambda!8767 () Bool)

(assert (=> (not b_lambda!8767) (not b!392798)))

(assert (=> b!392798 t!11468))

(declare-fun b_and!16385 () Bool)

(assert (= b_and!16383 (and (=> t!11468 result!5753) b_and!16385)))

(declare-fun b_lambda!8769 () Bool)

(assert (=> (not b_lambda!8769) (not b!392799)))

(assert (=> b!392799 t!11468))

(declare-fun b_and!16387 () Bool)

(assert (= b_and!16385 (and (=> t!11468 result!5753) b_and!16387)))

(declare-fun m!389487 () Bool)

(assert (=> b!392792 m!389487))

(declare-fun m!389489 () Bool)

(assert (=> b!392799 m!389489))

(declare-fun m!389491 () Bool)

(assert (=> b!392799 m!389491))

(assert (=> b!392799 m!389439))

(assert (=> b!392799 m!389491))

(assert (=> b!392799 m!389439))

(declare-fun m!389493 () Bool)

(assert (=> b!392799 m!389493))

(declare-fun m!389495 () Bool)

(assert (=> b!392799 m!389495))

(declare-fun m!389497 () Bool)

(assert (=> b!392799 m!389497))

(assert (=> b!392799 m!389427))

(assert (=> b!392799 m!389495))

(declare-fun m!389499 () Bool)

(assert (=> b!392799 m!389499))

(declare-fun m!389501 () Bool)

(assert (=> d!73217 m!389501))

(assert (=> d!73217 m!389263))

(declare-fun m!389503 () Bool)

(assert (=> b!392803 m!389503))

(assert (=> b!392798 m!389427))

(declare-fun m!389505 () Bool)

(assert (=> b!392798 m!389505))

(assert (=> b!392798 m!389427))

(assert (=> b!392798 m!389491))

(assert (=> b!392798 m!389439))

(assert (=> b!392798 m!389491))

(assert (=> b!392798 m!389439))

(assert (=> b!392798 m!389493))

(assert (=> b!392796 m!389427))

(assert (=> b!392796 m!389427))

(assert (=> b!392796 m!389429))

(declare-fun m!389507 () Bool)

(assert (=> b!392797 m!389507))

(assert (=> bm!27737 m!389487))

(assert (=> b!392795 m!389427))

(assert (=> b!392795 m!389427))

(declare-fun m!389509 () Bool)

(assert (=> b!392795 m!389509))

(assert (=> b!392794 m!389427))

(assert (=> b!392794 m!389427))

(assert (=> b!392794 m!389429))

(assert (=> b!392548 d!73217))

(declare-fun d!73219 () Bool)

(declare-fun e!237858 () Bool)

(assert (=> d!73219 e!237858))

(declare-fun res!224985 () Bool)

(assert (=> d!73219 (=> (not res!224985) (not e!237858))))

(declare-fun lt!185747 () ListLongMap!5369)

(assert (=> d!73219 (= res!224985 (contains!2446 lt!185747 (_1!3238 (tuple2!6455 k0!778 v!373))))))

(declare-fun lt!185748 () List!6301)

(assert (=> d!73219 (= lt!185747 (ListLongMap!5370 lt!185748))))

(declare-fun lt!185745 () Unit!11979)

(declare-fun lt!185746 () Unit!11979)

(assert (=> d!73219 (= lt!185745 lt!185746)))

(assert (=> d!73219 (= (getValueByKey!365 lt!185748 (_1!3238 (tuple2!6455 k0!778 v!373))) (Some!370 (_2!3238 (tuple2!6455 k0!778 v!373))))))

(assert (=> d!73219 (= lt!185746 (lemmaContainsTupThenGetReturnValue!187 lt!185748 (_1!3238 (tuple2!6455 k0!778 v!373)) (_2!3238 (tuple2!6455 k0!778 v!373))))))

(assert (=> d!73219 (= lt!185748 (insertStrictlySorted!190 (toList!2700 lt!185570) (_1!3238 (tuple2!6455 k0!778 v!373)) (_2!3238 (tuple2!6455 k0!778 v!373))))))

(assert (=> d!73219 (= (+!1054 lt!185570 (tuple2!6455 k0!778 v!373)) lt!185747)))

(declare-fun b!392804 () Bool)

(declare-fun res!224984 () Bool)

(assert (=> b!392804 (=> (not res!224984) (not e!237858))))

(assert (=> b!392804 (= res!224984 (= (getValueByKey!365 (toList!2700 lt!185747) (_1!3238 (tuple2!6455 k0!778 v!373))) (Some!370 (_2!3238 (tuple2!6455 k0!778 v!373)))))))

(declare-fun b!392805 () Bool)

(assert (=> b!392805 (= e!237858 (contains!2447 (toList!2700 lt!185747) (tuple2!6455 k0!778 v!373)))))

(assert (= (and d!73219 res!224985) b!392804))

(assert (= (and b!392804 res!224984) b!392805))

(declare-fun m!389511 () Bool)

(assert (=> d!73219 m!389511))

(declare-fun m!389513 () Bool)

(assert (=> d!73219 m!389513))

(declare-fun m!389515 () Bool)

(assert (=> d!73219 m!389515))

(declare-fun m!389517 () Bool)

(assert (=> d!73219 m!389517))

(declare-fun m!389519 () Bool)

(assert (=> b!392804 m!389519))

(declare-fun m!389521 () Bool)

(assert (=> b!392805 m!389521))

(assert (=> b!392548 d!73219))

(declare-fun call!27746 () ListLongMap!5369)

(declare-fun b!392812 () Bool)

(declare-fun call!27745 () ListLongMap!5369)

(declare-fun e!237864 () Bool)

(assert (=> b!392812 (= e!237864 (= call!27746 (+!1054 call!27745 (tuple2!6455 k0!778 v!373))))))

(declare-fun b!392813 () Bool)

(declare-fun e!237863 () Bool)

(assert (=> b!392813 (= e!237863 e!237864)))

(declare-fun c!54400 () Bool)

(assert (=> b!392813 (= c!54400 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun d!73221 () Bool)

(assert (=> d!73221 e!237863))

(declare-fun res!224988 () Bool)

(assert (=> d!73221 (=> (not res!224988) (not e!237863))))

(assert (=> d!73221 (= res!224988 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11443 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11442 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11443 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11442 _values!506))))))))

(declare-fun lt!185751 () Unit!11979)

(declare-fun choose!1328 (array!23264 array!23262 (_ BitVec 32) (_ BitVec 32) V!14019 V!14019 (_ BitVec 32) (_ BitVec 64) V!14019 (_ BitVec 32) Int) Unit!11979)

(assert (=> d!73221 (= lt!185751 (choose!1328 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!73221 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11443 _keys!658)))))

(assert (=> d!73221 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!268 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!185751)))

(declare-fun bm!27742 () Bool)

(assert (=> bm!27742 (= call!27746 (getCurrentListMapNoExtraKeys!966 (array!23265 (store (arr!11091 _keys!658) i!548 k0!778) (size!11443 _keys!658)) (array!23263 (store (arr!11090 _values!506) i!548 (ValueCellFull!4499 v!373)) (size!11442 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392814 () Bool)

(assert (=> b!392814 (= e!237864 (= call!27746 call!27745))))

(declare-fun bm!27743 () Bool)

(assert (=> bm!27743 (= call!27745 (getCurrentListMapNoExtraKeys!966 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and d!73221 res!224988) b!392813))

(assert (= (and b!392813 c!54400) b!392812))

(assert (= (and b!392813 (not c!54400)) b!392814))

(assert (= (or b!392812 b!392814) bm!27743))

(assert (= (or b!392812 b!392814) bm!27742))

(declare-fun m!389523 () Bool)

(assert (=> b!392812 m!389523))

(declare-fun m!389525 () Bool)

(assert (=> d!73221 m!389525))

(assert (=> bm!27742 m!389277))

(assert (=> bm!27742 m!389255))

(declare-fun m!389527 () Bool)

(assert (=> bm!27742 m!389527))

(assert (=> bm!27743 m!389259))

(assert (=> b!392548 d!73221))

(declare-fun b!392815 () Bool)

(declare-fun e!237868 () Bool)

(declare-fun lt!185769 () ListLongMap!5369)

(assert (=> b!392815 (= e!237868 (= (apply!306 lt!185769 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun call!27748 () ListLongMap!5369)

(declare-fun bm!27744 () Bool)

(assert (=> bm!27744 (= call!27748 (getCurrentListMapNoExtraKeys!966 lt!185573 lt!185571 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392816 () Bool)

(declare-fun e!237866 () Bool)

(assert (=> b!392816 (= e!237866 (= (apply!306 lt!185769 (select (arr!11091 lt!185573) #b00000000000000000000000000000000)) (get!5614 (select (arr!11090 lt!185571) #b00000000000000000000000000000000) (dynLambda!649 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!392816 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11442 lt!185571)))))

(assert (=> b!392816 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11443 lt!185573)))))

(declare-fun b!392817 () Bool)

(declare-fun res!224996 () Bool)

(declare-fun e!237875 () Bool)

(assert (=> b!392817 (=> (not res!224996) (not e!237875))))

(declare-fun e!237874 () Bool)

(assert (=> b!392817 (= res!224996 e!237874)))

(declare-fun res!224989 () Bool)

(assert (=> b!392817 (=> res!224989 e!237874)))

(declare-fun e!237869 () Bool)

(assert (=> b!392817 (= res!224989 (not e!237869))))

(declare-fun res!224995 () Bool)

(assert (=> b!392817 (=> (not res!224995) (not e!237869))))

(assert (=> b!392817 (= res!224995 (bvslt #b00000000000000000000000000000000 (size!11443 lt!185573)))))

(declare-fun b!392818 () Bool)

(declare-fun e!237872 () Bool)

(declare-fun call!27750 () Bool)

(assert (=> b!392818 (= e!237872 (not call!27750))))

(declare-fun b!392819 () Bool)

(declare-fun e!237865 () Bool)

(assert (=> b!392819 (= e!237865 (= (apply!306 lt!185769 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!392820 () Bool)

(declare-fun e!237873 () ListLongMap!5369)

(declare-fun call!27751 () ListLongMap!5369)

(assert (=> b!392820 (= e!237873 call!27751)))

(declare-fun b!392821 () Bool)

(declare-fun e!237876 () ListLongMap!5369)

(assert (=> b!392821 (= e!237876 call!27751)))

(declare-fun b!392822 () Bool)

(declare-fun c!54406 () Bool)

(assert (=> b!392822 (= c!54406 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!392822 (= e!237876 e!237873)))

(declare-fun b!392823 () Bool)

(assert (=> b!392823 (= e!237874 e!237866)))

(declare-fun res!224994 () Bool)

(assert (=> b!392823 (=> (not res!224994) (not e!237866))))

(assert (=> b!392823 (= res!224994 (contains!2446 lt!185769 (select (arr!11091 lt!185573) #b00000000000000000000000000000000)))))

(assert (=> b!392823 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11443 lt!185573)))))

(declare-fun b!392824 () Bool)

(declare-fun e!237867 () Bool)

(assert (=> b!392824 (= e!237867 e!237865)))

(declare-fun res!224993 () Bool)

(declare-fun call!27753 () Bool)

(assert (=> b!392824 (= res!224993 call!27753)))

(assert (=> b!392824 (=> (not res!224993) (not e!237865))))

(declare-fun d!73223 () Bool)

(assert (=> d!73223 e!237875))

(declare-fun res!224990 () Bool)

(assert (=> d!73223 (=> (not res!224990) (not e!237875))))

(assert (=> d!73223 (= res!224990 (or (bvsge #b00000000000000000000000000000000 (size!11443 lt!185573)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11443 lt!185573)))))))

(declare-fun lt!185754 () ListLongMap!5369)

(assert (=> d!73223 (= lt!185769 lt!185754)))

(declare-fun lt!185753 () Unit!11979)

(declare-fun e!237870 () Unit!11979)

(assert (=> d!73223 (= lt!185753 e!237870)))

(declare-fun c!54403 () Bool)

(declare-fun e!237877 () Bool)

(assert (=> d!73223 (= c!54403 e!237877)))

(declare-fun res!224992 () Bool)

(assert (=> d!73223 (=> (not res!224992) (not e!237877))))

(assert (=> d!73223 (= res!224992 (bvslt #b00000000000000000000000000000000 (size!11443 lt!185573)))))

(declare-fun e!237871 () ListLongMap!5369)

(assert (=> d!73223 (= lt!185754 e!237871)))

(declare-fun c!54402 () Bool)

(assert (=> d!73223 (= c!54402 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73223 (validMask!0 mask!970)))

(assert (=> d!73223 (= (getCurrentListMap!2077 lt!185573 lt!185571 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185769)))

(declare-fun b!392825 () Bool)

(assert (=> b!392825 (= e!237875 e!237867)))

(declare-fun c!54404 () Bool)

(assert (=> b!392825 (= c!54404 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!392826 () Bool)

(assert (=> b!392826 (= e!237877 (validKeyInArray!0 (select (arr!11091 lt!185573) #b00000000000000000000000000000000)))))

(declare-fun b!392827 () Bool)

(declare-fun lt!185773 () Unit!11979)

(assert (=> b!392827 (= e!237870 lt!185773)))

(declare-fun lt!185767 () ListLongMap!5369)

(assert (=> b!392827 (= lt!185767 (getCurrentListMapNoExtraKeys!966 lt!185573 lt!185571 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185772 () (_ BitVec 64))

(assert (=> b!392827 (= lt!185772 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185752 () (_ BitVec 64))

(assert (=> b!392827 (= lt!185752 (select (arr!11091 lt!185573) #b00000000000000000000000000000000))))

(declare-fun lt!185770 () Unit!11979)

(assert (=> b!392827 (= lt!185770 (addStillContains!282 lt!185767 lt!185772 zeroValue!472 lt!185752))))

(assert (=> b!392827 (contains!2446 (+!1054 lt!185767 (tuple2!6455 lt!185772 zeroValue!472)) lt!185752)))

(declare-fun lt!185759 () Unit!11979)

(assert (=> b!392827 (= lt!185759 lt!185770)))

(declare-fun lt!185771 () ListLongMap!5369)

(assert (=> b!392827 (= lt!185771 (getCurrentListMapNoExtraKeys!966 lt!185573 lt!185571 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185756 () (_ BitVec 64))

(assert (=> b!392827 (= lt!185756 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185761 () (_ BitVec 64))

(assert (=> b!392827 (= lt!185761 (select (arr!11091 lt!185573) #b00000000000000000000000000000000))))

(declare-fun lt!185764 () Unit!11979)

(assert (=> b!392827 (= lt!185764 (addApplyDifferent!282 lt!185771 lt!185756 minValue!472 lt!185761))))

(assert (=> b!392827 (= (apply!306 (+!1054 lt!185771 (tuple2!6455 lt!185756 minValue!472)) lt!185761) (apply!306 lt!185771 lt!185761))))

(declare-fun lt!185760 () Unit!11979)

(assert (=> b!392827 (= lt!185760 lt!185764)))

(declare-fun lt!185766 () ListLongMap!5369)

(assert (=> b!392827 (= lt!185766 (getCurrentListMapNoExtraKeys!966 lt!185573 lt!185571 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185765 () (_ BitVec 64))

(assert (=> b!392827 (= lt!185765 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185762 () (_ BitVec 64))

(assert (=> b!392827 (= lt!185762 (select (arr!11091 lt!185573) #b00000000000000000000000000000000))))

(declare-fun lt!185758 () Unit!11979)

(assert (=> b!392827 (= lt!185758 (addApplyDifferent!282 lt!185766 lt!185765 zeroValue!472 lt!185762))))

(assert (=> b!392827 (= (apply!306 (+!1054 lt!185766 (tuple2!6455 lt!185765 zeroValue!472)) lt!185762) (apply!306 lt!185766 lt!185762))))

(declare-fun lt!185763 () Unit!11979)

(assert (=> b!392827 (= lt!185763 lt!185758)))

(declare-fun lt!185755 () ListLongMap!5369)

(assert (=> b!392827 (= lt!185755 (getCurrentListMapNoExtraKeys!966 lt!185573 lt!185571 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185768 () (_ BitVec 64))

(assert (=> b!392827 (= lt!185768 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185757 () (_ BitVec 64))

(assert (=> b!392827 (= lt!185757 (select (arr!11091 lt!185573) #b00000000000000000000000000000000))))

(assert (=> b!392827 (= lt!185773 (addApplyDifferent!282 lt!185755 lt!185768 minValue!472 lt!185757))))

(assert (=> b!392827 (= (apply!306 (+!1054 lt!185755 (tuple2!6455 lt!185768 minValue!472)) lt!185757) (apply!306 lt!185755 lt!185757))))

(declare-fun b!392828 () Bool)

(assert (=> b!392828 (= e!237869 (validKeyInArray!0 (select (arr!11091 lt!185573) #b00000000000000000000000000000000)))))

(declare-fun bm!27745 () Bool)

(assert (=> bm!27745 (= call!27750 (contains!2446 lt!185769 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27746 () Bool)

(declare-fun call!27747 () ListLongMap!5369)

(assert (=> bm!27746 (= call!27751 call!27747)))

(declare-fun bm!27747 () Bool)

(declare-fun call!27752 () ListLongMap!5369)

(declare-fun call!27749 () ListLongMap!5369)

(assert (=> bm!27747 (= call!27752 call!27749)))

(declare-fun b!392829 () Bool)

(assert (=> b!392829 (= e!237867 (not call!27753))))

(declare-fun b!392830 () Bool)

(assert (=> b!392830 (= e!237873 call!27752)))

(declare-fun b!392831 () Bool)

(declare-fun res!224997 () Bool)

(assert (=> b!392831 (=> (not res!224997) (not e!237875))))

(assert (=> b!392831 (= res!224997 e!237872)))

(declare-fun c!54405 () Bool)

(assert (=> b!392831 (= c!54405 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!392832 () Bool)

(assert (=> b!392832 (= e!237871 (+!1054 call!27747 (tuple2!6455 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun bm!27748 () Bool)

(declare-fun c!54401 () Bool)

(assert (=> bm!27748 (= call!27747 (+!1054 (ite c!54402 call!27748 (ite c!54401 call!27749 call!27752)) (ite (or c!54402 c!54401) (tuple2!6455 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6455 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!392833 () Bool)

(declare-fun Unit!11986 () Unit!11979)

(assert (=> b!392833 (= e!237870 Unit!11986)))

(declare-fun b!392834 () Bool)

(assert (=> b!392834 (= e!237872 e!237868)))

(declare-fun res!224991 () Bool)

(assert (=> b!392834 (= res!224991 call!27750)))

(assert (=> b!392834 (=> (not res!224991) (not e!237868))))

(declare-fun bm!27749 () Bool)

(assert (=> bm!27749 (= call!27749 call!27748)))

(declare-fun bm!27750 () Bool)

(assert (=> bm!27750 (= call!27753 (contains!2446 lt!185769 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!392835 () Bool)

(assert (=> b!392835 (= e!237871 e!237876)))

(assert (=> b!392835 (= c!54401 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!73223 c!54402) b!392832))

(assert (= (and d!73223 (not c!54402)) b!392835))

(assert (= (and b!392835 c!54401) b!392821))

(assert (= (and b!392835 (not c!54401)) b!392822))

(assert (= (and b!392822 c!54406) b!392820))

(assert (= (and b!392822 (not c!54406)) b!392830))

(assert (= (or b!392820 b!392830) bm!27747))

(assert (= (or b!392821 bm!27747) bm!27749))

(assert (= (or b!392821 b!392820) bm!27746))

(assert (= (or b!392832 bm!27749) bm!27744))

(assert (= (or b!392832 bm!27746) bm!27748))

(assert (= (and d!73223 res!224992) b!392826))

(assert (= (and d!73223 c!54403) b!392827))

(assert (= (and d!73223 (not c!54403)) b!392833))

(assert (= (and d!73223 res!224990) b!392817))

(assert (= (and b!392817 res!224995) b!392828))

(assert (= (and b!392817 (not res!224989)) b!392823))

(assert (= (and b!392823 res!224994) b!392816))

(assert (= (and b!392817 res!224996) b!392831))

(assert (= (and b!392831 c!54405) b!392834))

(assert (= (and b!392831 (not c!54405)) b!392818))

(assert (= (and b!392834 res!224991) b!392815))

(assert (= (or b!392834 b!392818) bm!27745))

(assert (= (and b!392831 res!224997) b!392825))

(assert (= (and b!392825 c!54404) b!392824))

(assert (= (and b!392825 (not c!54404)) b!392829))

(assert (= (and b!392824 res!224993) b!392819))

(assert (= (or b!392824 b!392829) bm!27750))

(declare-fun b_lambda!8771 () Bool)

(assert (=> (not b_lambda!8771) (not b!392816)))

(assert (=> b!392816 t!11468))

(declare-fun b_and!16389 () Bool)

(assert (= b_and!16387 (and (=> t!11468 result!5753) b_and!16389)))

(declare-fun m!389529 () Bool)

(assert (=> bm!27748 m!389529))

(assert (=> b!392816 m!389491))

(assert (=> b!392816 m!389439))

(assert (=> b!392816 m!389493))

(assert (=> b!392816 m!389491))

(assert (=> b!392816 m!389427))

(declare-fun m!389531 () Bool)

(assert (=> b!392816 m!389531))

(assert (=> b!392816 m!389439))

(assert (=> b!392816 m!389427))

(declare-fun m!389533 () Bool)

(assert (=> b!392832 m!389533))

(assert (=> bm!27744 m!389257))

(declare-fun m!389535 () Bool)

(assert (=> b!392815 m!389535))

(declare-fun m!389537 () Bool)

(assert (=> bm!27745 m!389537))

(assert (=> b!392826 m!389427))

(assert (=> b!392826 m!389427))

(assert (=> b!392826 m!389429))

(assert (=> d!73223 m!389263))

(declare-fun m!389539 () Bool)

(assert (=> b!392827 m!389539))

(declare-fun m!389541 () Bool)

(assert (=> b!392827 m!389541))

(declare-fun m!389543 () Bool)

(assert (=> b!392827 m!389543))

(declare-fun m!389545 () Bool)

(assert (=> b!392827 m!389545))

(declare-fun m!389547 () Bool)

(assert (=> b!392827 m!389547))

(declare-fun m!389549 () Bool)

(assert (=> b!392827 m!389549))

(assert (=> b!392827 m!389539))

(declare-fun m!389551 () Bool)

(assert (=> b!392827 m!389551))

(declare-fun m!389553 () Bool)

(assert (=> b!392827 m!389553))

(assert (=> b!392827 m!389553))

(declare-fun m!389555 () Bool)

(assert (=> b!392827 m!389555))

(declare-fun m!389557 () Bool)

(assert (=> b!392827 m!389557))

(declare-fun m!389559 () Bool)

(assert (=> b!392827 m!389559))

(declare-fun m!389561 () Bool)

(assert (=> b!392827 m!389561))

(declare-fun m!389563 () Bool)

(assert (=> b!392827 m!389563))

(assert (=> b!392827 m!389427))

(declare-fun m!389565 () Bool)

(assert (=> b!392827 m!389565))

(assert (=> b!392827 m!389257))

(declare-fun m!389567 () Bool)

(assert (=> b!392827 m!389567))

(assert (=> b!392827 m!389541))

(assert (=> b!392827 m!389545))

(declare-fun m!389569 () Bool)

(assert (=> bm!27750 m!389569))

(assert (=> b!392828 m!389427))

(assert (=> b!392828 m!389427))

(assert (=> b!392828 m!389429))

(declare-fun m!389571 () Bool)

(assert (=> b!392819 m!389571))

(assert (=> b!392823 m!389427))

(assert (=> b!392823 m!389427))

(declare-fun m!389573 () Bool)

(assert (=> b!392823 m!389573))

(assert (=> b!392548 d!73223))

(declare-fun call!27754 () ListLongMap!5369)

(declare-fun bm!27751 () Bool)

(assert (=> bm!27751 (= call!27754 (getCurrentListMapNoExtraKeys!966 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!392836 () Bool)

(declare-fun e!237879 () Bool)

(declare-fun lt!185777 () ListLongMap!5369)

(assert (=> b!392836 (= e!237879 (= lt!185777 (getCurrentListMapNoExtraKeys!966 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!392837 () Bool)

(declare-fun e!237884 () ListLongMap!5369)

(assert (=> b!392837 (= e!237884 (ListLongMap!5370 Nil!6298))))

(declare-fun b!392838 () Bool)

(declare-fun e!237881 () Bool)

(assert (=> b!392838 (= e!237881 (validKeyInArray!0 (select (arr!11091 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!392838 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!392839 () Bool)

(declare-fun e!237880 () Bool)

(declare-fun e!237878 () Bool)

(assert (=> b!392839 (= e!237880 e!237878)))

(assert (=> b!392839 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11443 _keys!658)))))

(declare-fun res!224998 () Bool)

(assert (=> b!392839 (= res!224998 (contains!2446 lt!185777 (select (arr!11091 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!392839 (=> (not res!224998) (not e!237878))))

(declare-fun b!392840 () Bool)

(declare-fun e!237883 () ListLongMap!5369)

(assert (=> b!392840 (= e!237884 e!237883)))

(declare-fun c!54409 () Bool)

(assert (=> b!392840 (= c!54409 (validKeyInArray!0 (select (arr!11091 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392841 () Bool)

(assert (=> b!392841 (= e!237879 (isEmpty!558 lt!185777))))

(declare-fun b!392842 () Bool)

(assert (=> b!392842 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11443 _keys!658)))))

(assert (=> b!392842 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11442 _values!506)))))

(assert (=> b!392842 (= e!237878 (= (apply!306 lt!185777 (select (arr!11091 _keys!658) #b00000000000000000000000000000000)) (get!5614 (select (arr!11090 _values!506) #b00000000000000000000000000000000) (dynLambda!649 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!392843 () Bool)

(declare-fun lt!185779 () Unit!11979)

(declare-fun lt!185778 () Unit!11979)

(assert (=> b!392843 (= lt!185779 lt!185778)))

(declare-fun lt!185776 () V!14019)

(declare-fun lt!185775 () ListLongMap!5369)

(declare-fun lt!185774 () (_ BitVec 64))

(declare-fun lt!185780 () (_ BitVec 64))

(assert (=> b!392843 (not (contains!2446 (+!1054 lt!185775 (tuple2!6455 lt!185774 lt!185776)) lt!185780))))

(assert (=> b!392843 (= lt!185778 (addStillNotContains!141 lt!185775 lt!185774 lt!185776 lt!185780))))

(assert (=> b!392843 (= lt!185780 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!392843 (= lt!185776 (get!5614 (select (arr!11090 _values!506) #b00000000000000000000000000000000) (dynLambda!649 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!392843 (= lt!185774 (select (arr!11091 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!392843 (= lt!185775 call!27754)))

(assert (=> b!392843 (= e!237883 (+!1054 call!27754 (tuple2!6455 (select (arr!11091 _keys!658) #b00000000000000000000000000000000) (get!5614 (select (arr!11090 _values!506) #b00000000000000000000000000000000) (dynLambda!649 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!392844 () Bool)

(declare-fun e!237882 () Bool)

(assert (=> b!392844 (= e!237882 e!237880)))

(declare-fun c!54408 () Bool)

(assert (=> b!392844 (= c!54408 e!237881)))

(declare-fun res!224999 () Bool)

(assert (=> b!392844 (=> (not res!224999) (not e!237881))))

(assert (=> b!392844 (= res!224999 (bvslt #b00000000000000000000000000000000 (size!11443 _keys!658)))))

(declare-fun d!73225 () Bool)

(assert (=> d!73225 e!237882))

(declare-fun res!225001 () Bool)

(assert (=> d!73225 (=> (not res!225001) (not e!237882))))

(assert (=> d!73225 (= res!225001 (not (contains!2446 lt!185777 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73225 (= lt!185777 e!237884)))

(declare-fun c!54407 () Bool)

(assert (=> d!73225 (= c!54407 (bvsge #b00000000000000000000000000000000 (size!11443 _keys!658)))))

(assert (=> d!73225 (validMask!0 mask!970)))

(assert (=> d!73225 (= (getCurrentListMapNoExtraKeys!966 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185777)))

(declare-fun b!392845 () Bool)

(assert (=> b!392845 (= e!237880 e!237879)))

(declare-fun c!54410 () Bool)

(assert (=> b!392845 (= c!54410 (bvslt #b00000000000000000000000000000000 (size!11443 _keys!658)))))

(declare-fun b!392846 () Bool)

(assert (=> b!392846 (= e!237883 call!27754)))

(declare-fun b!392847 () Bool)

(declare-fun res!225000 () Bool)

(assert (=> b!392847 (=> (not res!225000) (not e!237882))))

(assert (=> b!392847 (= res!225000 (not (contains!2446 lt!185777 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!73225 c!54407) b!392837))

(assert (= (and d!73225 (not c!54407)) b!392840))

(assert (= (and b!392840 c!54409) b!392843))

(assert (= (and b!392840 (not c!54409)) b!392846))

(assert (= (or b!392843 b!392846) bm!27751))

(assert (= (and d!73225 res!225001) b!392847))

(assert (= (and b!392847 res!225000) b!392844))

(assert (= (and b!392844 res!224999) b!392838))

(assert (= (and b!392844 c!54408) b!392839))

(assert (= (and b!392844 (not c!54408)) b!392845))

(assert (= (and b!392839 res!224998) b!392842))

(assert (= (and b!392845 c!54410) b!392836))

(assert (= (and b!392845 (not c!54410)) b!392841))

(declare-fun b_lambda!8773 () Bool)

(assert (=> (not b_lambda!8773) (not b!392842)))

(assert (=> b!392842 t!11468))

(declare-fun b_and!16391 () Bool)

(assert (= b_and!16389 (and (=> t!11468 result!5753) b_and!16391)))

(declare-fun b_lambda!8775 () Bool)

(assert (=> (not b_lambda!8775) (not b!392843)))

(assert (=> b!392843 t!11468))

(declare-fun b_and!16393 () Bool)

(assert (= b_and!16391 (and (=> t!11468 result!5753) b_and!16393)))

(declare-fun m!389575 () Bool)

(assert (=> b!392836 m!389575))

(declare-fun m!389577 () Bool)

(assert (=> b!392843 m!389577))

(assert (=> b!392843 m!389437))

(assert (=> b!392843 m!389439))

(assert (=> b!392843 m!389437))

(assert (=> b!392843 m!389439))

(assert (=> b!392843 m!389441))

(declare-fun m!389579 () Bool)

(assert (=> b!392843 m!389579))

(declare-fun m!389581 () Bool)

(assert (=> b!392843 m!389581))

(assert (=> b!392843 m!389397))

(assert (=> b!392843 m!389579))

(declare-fun m!389583 () Bool)

(assert (=> b!392843 m!389583))

(declare-fun m!389585 () Bool)

(assert (=> d!73225 m!389585))

(assert (=> d!73225 m!389263))

(declare-fun m!389587 () Bool)

(assert (=> b!392847 m!389587))

(assert (=> b!392842 m!389397))

(declare-fun m!389589 () Bool)

(assert (=> b!392842 m!389589))

(assert (=> b!392842 m!389397))

(assert (=> b!392842 m!389437))

(assert (=> b!392842 m!389439))

(assert (=> b!392842 m!389437))

(assert (=> b!392842 m!389439))

(assert (=> b!392842 m!389441))

(assert (=> b!392840 m!389397))

(assert (=> b!392840 m!389397))

(assert (=> b!392840 m!389399))

(declare-fun m!389591 () Bool)

(assert (=> b!392841 m!389591))

(assert (=> bm!27751 m!389575))

(assert (=> b!392839 m!389397))

(assert (=> b!392839 m!389397))

(declare-fun m!389593 () Bool)

(assert (=> b!392839 m!389593))

(assert (=> b!392838 m!389397))

(assert (=> b!392838 m!389397))

(assert (=> b!392838 m!389399))

(assert (=> b!392548 d!73225))

(declare-fun b!392848 () Bool)

(declare-fun e!237885 () Bool)

(declare-fun e!237886 () Bool)

(assert (=> b!392848 (= e!237885 e!237886)))

(declare-fun lt!185783 () (_ BitVec 64))

(assert (=> b!392848 (= lt!185783 (select (arr!11091 lt!185573) #b00000000000000000000000000000000))))

(declare-fun lt!185782 () Unit!11979)

(assert (=> b!392848 (= lt!185782 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!185573 lt!185783 #b00000000000000000000000000000000))))

(assert (=> b!392848 (arrayContainsKey!0 lt!185573 lt!185783 #b00000000000000000000000000000000)))

(declare-fun lt!185781 () Unit!11979)

(assert (=> b!392848 (= lt!185781 lt!185782)))

(declare-fun res!225002 () Bool)

(assert (=> b!392848 (= res!225002 (= (seekEntryOrOpen!0 (select (arr!11091 lt!185573) #b00000000000000000000000000000000) lt!185573 mask!970) (Found!3466 #b00000000000000000000000000000000)))))

(assert (=> b!392848 (=> (not res!225002) (not e!237886))))

(declare-fun b!392849 () Bool)

(declare-fun call!27755 () Bool)

(assert (=> b!392849 (= e!237886 call!27755)))

(declare-fun bm!27752 () Bool)

(assert (=> bm!27752 (= call!27755 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!185573 mask!970))))

(declare-fun b!392850 () Bool)

(declare-fun e!237887 () Bool)

(assert (=> b!392850 (= e!237887 e!237885)))

(declare-fun c!54411 () Bool)

(assert (=> b!392850 (= c!54411 (validKeyInArray!0 (select (arr!11091 lt!185573) #b00000000000000000000000000000000)))))

(declare-fun b!392851 () Bool)

(assert (=> b!392851 (= e!237885 call!27755)))

(declare-fun d!73227 () Bool)

(declare-fun res!225003 () Bool)

(assert (=> d!73227 (=> res!225003 e!237887)))

(assert (=> d!73227 (= res!225003 (bvsge #b00000000000000000000000000000000 (size!11443 lt!185573)))))

(assert (=> d!73227 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185573 mask!970) e!237887)))

(assert (= (and d!73227 (not res!225003)) b!392850))

(assert (= (and b!392850 c!54411) b!392848))

(assert (= (and b!392850 (not c!54411)) b!392851))

(assert (= (and b!392848 res!225002) b!392849))

(assert (= (or b!392849 b!392851) bm!27752))

(assert (=> b!392848 m!389427))

(declare-fun m!389595 () Bool)

(assert (=> b!392848 m!389595))

(declare-fun m!389597 () Bool)

(assert (=> b!392848 m!389597))

(assert (=> b!392848 m!389427))

(declare-fun m!389599 () Bool)

(assert (=> b!392848 m!389599))

(declare-fun m!389601 () Bool)

(assert (=> bm!27752 m!389601))

(assert (=> b!392850 m!389427))

(assert (=> b!392850 m!389427))

(assert (=> b!392850 m!389429))

(assert (=> b!392543 d!73227))

(declare-fun d!73229 () Bool)

(assert (=> d!73229 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!392552 d!73229))

(declare-fun b!392859 () Bool)

(declare-fun e!237892 () Bool)

(assert (=> b!392859 (= e!237892 tp_is_empty!9685)))

(declare-fun condMapEmpty!16128 () Bool)

(declare-fun mapDefault!16128 () ValueCell!4499)

(assert (=> mapNonEmpty!16119 (= condMapEmpty!16128 (= mapRest!16119 ((as const (Array (_ BitVec 32) ValueCell!4499)) mapDefault!16128)))))

(declare-fun mapRes!16128 () Bool)

(assert (=> mapNonEmpty!16119 (= tp!31818 (and e!237892 mapRes!16128))))

(declare-fun mapIsEmpty!16128 () Bool)

(assert (=> mapIsEmpty!16128 mapRes!16128))

(declare-fun b!392858 () Bool)

(declare-fun e!237893 () Bool)

(assert (=> b!392858 (= e!237893 tp_is_empty!9685)))

(declare-fun mapNonEmpty!16128 () Bool)

(declare-fun tp!31833 () Bool)

(assert (=> mapNonEmpty!16128 (= mapRes!16128 (and tp!31833 e!237893))))

(declare-fun mapKey!16128 () (_ BitVec 32))

(declare-fun mapValue!16128 () ValueCell!4499)

(declare-fun mapRest!16128 () (Array (_ BitVec 32) ValueCell!4499))

(assert (=> mapNonEmpty!16128 (= mapRest!16119 (store mapRest!16128 mapKey!16128 mapValue!16128))))

(assert (= (and mapNonEmpty!16119 condMapEmpty!16128) mapIsEmpty!16128))

(assert (= (and mapNonEmpty!16119 (not condMapEmpty!16128)) mapNonEmpty!16128))

(assert (= (and mapNonEmpty!16128 ((_ is ValueCellFull!4499) mapValue!16128)) b!392858))

(assert (= (and mapNonEmpty!16119 ((_ is ValueCellFull!4499) mapDefault!16128)) b!392859))

(declare-fun m!389603 () Bool)

(assert (=> mapNonEmpty!16128 m!389603))

(declare-fun b_lambda!8777 () Bool)

(assert (= b_lambda!8767 (or (and start!38096 b_free!9013) b_lambda!8777)))

(declare-fun b_lambda!8779 () Bool)

(assert (= b_lambda!8771 (or (and start!38096 b_free!9013) b_lambda!8779)))

(declare-fun b_lambda!8781 () Bool)

(assert (= b_lambda!8765 (or (and start!38096 b_free!9013) b_lambda!8781)))

(declare-fun b_lambda!8783 () Bool)

(assert (= b_lambda!8773 (or (and start!38096 b_free!9013) b_lambda!8783)))

(declare-fun b_lambda!8785 () Bool)

(assert (= b_lambda!8769 (or (and start!38096 b_free!9013) b_lambda!8785)))

(declare-fun b_lambda!8787 () Bool)

(assert (= b_lambda!8775 (or (and start!38096 b_free!9013) b_lambda!8787)))

(check-sat (not b!392840) (not bm!27732) (not b!392815) (not b!392838) (not b!392823) (not bm!27743) (not b!392673) (not b!392696) (not b!392797) (not bm!27745) (not bm!27712) (not d!73217) (not bm!27752) (not b!392749) (not b!392848) (not b!392660) (not d!73215) b_and!16393 (not mapNonEmpty!16128) (not d!73195) (not d!73197) (not b!392795) (not b!392796) (not b_lambda!8779) (not b!392804) (not b_lambda!8783) (not b_lambda!8781) (not d!73219) (not bm!27737) (not b_next!9013) (not bm!27728) (not b!392826) (not b!392812) (not b!392702) (not b!392698) (not b!392677) (not b!392839) (not bm!27750) (not b!392827) (not b!392843) (not b!392659) (not bm!27742) (not d!73225) (not b!392850) (not b!392686) (not b!392674) (not b_lambda!8777) (not d!73211) (not b!392803) (not bm!27751) (not b!392816) (not b!392757) (not b!392697) (not b!392688) (not b_lambda!8787) (not b_lambda!8785) (not b!392661) (not b!392798) (not b!392805) (not bm!27748) (not b!392699) (not b!392753) (not b!392792) tp_is_empty!9685 (not bm!27734) (not b!392758) (not b!392842) (not b!392662) (not b!392819) (not d!73221) (not bm!27709) (not b!392746) (not b!392841) (not b!392762) (not b!392799) (not bm!27729) (not b!392745) (not b!392832) (not b!392836) (not d!73223) (not b!392695) (not b!392847) (not b!392794) (not b!392756) (not bm!27713) (not bm!27744) (not b!392828))
(check-sat b_and!16393 (not b_next!9013))
