; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35234 () Bool)

(assert start!35234)

(declare-fun b_free!7809 () Bool)

(declare-fun b_next!7809 () Bool)

(assert (=> start!35234 (= b_free!7809 (not b_next!7809))))

(declare-fun tp!27021 () Bool)

(declare-fun b_and!15049 () Bool)

(assert (=> start!35234 (= tp!27021 b_and!15049)))

(declare-fun mapNonEmpty!13128 () Bool)

(declare-fun mapRes!13128 () Bool)

(declare-fun tp!27020 () Bool)

(declare-fun e!216301 () Bool)

(assert (=> mapNonEmpty!13128 (= mapRes!13128 (and tp!27020 e!216301))))

(declare-fun mapKey!13128 () (_ BitVec 32))

(declare-datatypes ((V!11325 0))(
  ( (V!11326 (val!3925 Int)) )
))
(declare-datatypes ((ValueCell!3537 0))(
  ( (ValueCellFull!3537 (v!6117 V!11325)) (EmptyCell!3537) )
))
(declare-fun mapValue!13128 () ValueCell!3537)

(declare-fun mapRest!13128 () (Array (_ BitVec 32) ValueCell!3537))

(declare-datatypes ((array!19113 0))(
  ( (array!19114 (arr!9057 (Array (_ BitVec 32) ValueCell!3537)) (size!9409 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19113)

(assert (=> mapNonEmpty!13128 (= (arr!9057 _values!1525) (store mapRest!13128 mapKey!13128 mapValue!13128))))

(declare-fun mapIsEmpty!13128 () Bool)

(assert (=> mapIsEmpty!13128 mapRes!13128))

(declare-fun b!353258 () Bool)

(declare-fun res!195903 () Bool)

(declare-fun e!216300 () Bool)

(assert (=> b!353258 (=> (not res!195903) (not e!216300))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!11325)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!19115 0))(
  ( (array!19116 (arr!9058 (Array (_ BitVec 32) (_ BitVec 64))) (size!9410 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19115)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11325)

(declare-datatypes ((tuple2!5658 0))(
  ( (tuple2!5659 (_1!2840 (_ BitVec 64)) (_2!2840 V!11325)) )
))
(declare-datatypes ((List!5276 0))(
  ( (Nil!5273) (Cons!5272 (h!6128 tuple2!5658) (t!10424 List!5276)) )
))
(declare-datatypes ((ListLongMap!4571 0))(
  ( (ListLongMap!4572 (toList!2301 List!5276)) )
))
(declare-fun contains!2375 (ListLongMap!4571 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1822 (array!19115 array!19113 (_ BitVec 32) (_ BitVec 32) V!11325 V!11325 (_ BitVec 32) Int) ListLongMap!4571)

(assert (=> b!353258 (= res!195903 (not (contains!2375 (getCurrentListMap!1822 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!353259 () Bool)

(declare-datatypes ((SeekEntryResult!3484 0))(
  ( (MissingZero!3484 (index!16115 (_ BitVec 32))) (Found!3484 (index!16116 (_ BitVec 32))) (Intermediate!3484 (undefined!4296 Bool) (index!16117 (_ BitVec 32)) (x!35150 (_ BitVec 32))) (Undefined!3484) (MissingVacant!3484 (index!16118 (_ BitVec 32))) )
))
(declare-fun lt!165475 () SeekEntryResult!3484)

(get-info :version)

(assert (=> b!353259 (= e!216300 (and (not ((_ is Found!3484) lt!165475)) (not ((_ is MissingZero!3484) lt!165475)) (not ((_ is MissingVacant!3484) lt!165475)) (not ((_ is Undefined!3484) lt!165475))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19115 (_ BitVec 32)) SeekEntryResult!3484)

(assert (=> b!353259 (= lt!165475 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!353260 () Bool)

(declare-fun res!195905 () Bool)

(assert (=> b!353260 (=> (not res!195905) (not e!216300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!353260 (= res!195905 (validKeyInArray!0 k0!1348))))

(declare-fun b!353262 () Bool)

(declare-fun e!216303 () Bool)

(declare-fun e!216302 () Bool)

(assert (=> b!353262 (= e!216303 (and e!216302 mapRes!13128))))

(declare-fun condMapEmpty!13128 () Bool)

(declare-fun mapDefault!13128 () ValueCell!3537)

(assert (=> b!353262 (= condMapEmpty!13128 (= (arr!9057 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3537)) mapDefault!13128)))))

(declare-fun b!353263 () Bool)

(declare-fun tp_is_empty!7761 () Bool)

(assert (=> b!353263 (= e!216302 tp_is_empty!7761)))

(declare-fun b!353264 () Bool)

(assert (=> b!353264 (= e!216301 tp_is_empty!7761)))

(declare-fun b!353265 () Bool)

(declare-fun res!195904 () Bool)

(assert (=> b!353265 (=> (not res!195904) (not e!216300))))

(assert (=> b!353265 (= res!195904 (and (= (size!9409 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9410 _keys!1895) (size!9409 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!353266 () Bool)

(declare-fun res!195906 () Bool)

(assert (=> b!353266 (=> (not res!195906) (not e!216300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19115 (_ BitVec 32)) Bool)

(assert (=> b!353266 (= res!195906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!353261 () Bool)

(declare-fun res!195907 () Bool)

(assert (=> b!353261 (=> (not res!195907) (not e!216300))))

(declare-datatypes ((List!5277 0))(
  ( (Nil!5274) (Cons!5273 (h!6129 (_ BitVec 64)) (t!10425 List!5277)) )
))
(declare-fun arrayNoDuplicates!0 (array!19115 (_ BitVec 32) List!5277) Bool)

(assert (=> b!353261 (= res!195907 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5274))))

(declare-fun res!195908 () Bool)

(assert (=> start!35234 (=> (not res!195908) (not e!216300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35234 (= res!195908 (validMask!0 mask!2385))))

(assert (=> start!35234 e!216300))

(assert (=> start!35234 true))

(assert (=> start!35234 tp_is_empty!7761))

(assert (=> start!35234 tp!27021))

(declare-fun array_inv!6674 (array!19113) Bool)

(assert (=> start!35234 (and (array_inv!6674 _values!1525) e!216303)))

(declare-fun array_inv!6675 (array!19115) Bool)

(assert (=> start!35234 (array_inv!6675 _keys!1895)))

(assert (= (and start!35234 res!195908) b!353265))

(assert (= (and b!353265 res!195904) b!353266))

(assert (= (and b!353266 res!195906) b!353261))

(assert (= (and b!353261 res!195907) b!353260))

(assert (= (and b!353260 res!195905) b!353258))

(assert (= (and b!353258 res!195903) b!353259))

(assert (= (and b!353262 condMapEmpty!13128) mapIsEmpty!13128))

(assert (= (and b!353262 (not condMapEmpty!13128)) mapNonEmpty!13128))

(assert (= (and mapNonEmpty!13128 ((_ is ValueCellFull!3537) mapValue!13128)) b!353264))

(assert (= (and b!353262 ((_ is ValueCellFull!3537) mapDefault!13128)) b!353263))

(assert (= start!35234 b!353262))

(declare-fun m!352681 () Bool)

(assert (=> b!353261 m!352681))

(declare-fun m!352683 () Bool)

(assert (=> b!353259 m!352683))

(declare-fun m!352685 () Bool)

(assert (=> b!353260 m!352685))

(declare-fun m!352687 () Bool)

(assert (=> start!35234 m!352687))

(declare-fun m!352689 () Bool)

(assert (=> start!35234 m!352689))

(declare-fun m!352691 () Bool)

(assert (=> start!35234 m!352691))

(declare-fun m!352693 () Bool)

(assert (=> b!353258 m!352693))

(assert (=> b!353258 m!352693))

(declare-fun m!352695 () Bool)

(assert (=> b!353258 m!352695))

(declare-fun m!352697 () Bool)

(assert (=> b!353266 m!352697))

(declare-fun m!352699 () Bool)

(assert (=> mapNonEmpty!13128 m!352699))

(check-sat (not b!353259) (not b_next!7809) (not b!353266) tp_is_empty!7761 (not b!353258) (not mapNonEmpty!13128) (not b!353261) b_and!15049 (not start!35234) (not b!353260))
(check-sat b_and!15049 (not b_next!7809))
(get-model)

(declare-fun d!71591 () Bool)

(declare-fun e!216323 () Bool)

(assert (=> d!71591 e!216323))

(declare-fun res!195929 () Bool)

(assert (=> d!71591 (=> res!195929 e!216323)))

(declare-fun lt!165490 () Bool)

(assert (=> d!71591 (= res!195929 (not lt!165490))))

(declare-fun lt!165487 () Bool)

(assert (=> d!71591 (= lt!165490 lt!165487)))

(declare-datatypes ((Unit!10912 0))(
  ( (Unit!10913) )
))
(declare-fun lt!165489 () Unit!10912)

(declare-fun e!216324 () Unit!10912)

(assert (=> d!71591 (= lt!165489 e!216324)))

(declare-fun c!53658 () Bool)

(assert (=> d!71591 (= c!53658 lt!165487)))

(declare-fun containsKey!346 (List!5276 (_ BitVec 64)) Bool)

(assert (=> d!71591 (= lt!165487 (containsKey!346 (toList!2301 (getCurrentListMap!1822 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71591 (= (contains!2375 (getCurrentListMap!1822 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!165490)))

(declare-fun b!353300 () Bool)

(declare-fun lt!165488 () Unit!10912)

(assert (=> b!353300 (= e!216324 lt!165488)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!294 (List!5276 (_ BitVec 64)) Unit!10912)

(assert (=> b!353300 (= lt!165488 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!2301 (getCurrentListMap!1822 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!360 0))(
  ( (Some!359 (v!6119 V!11325)) (None!358) )
))
(declare-fun isDefined!295 (Option!360) Bool)

(declare-fun getValueByKey!354 (List!5276 (_ BitVec 64)) Option!360)

(assert (=> b!353300 (isDefined!295 (getValueByKey!354 (toList!2301 (getCurrentListMap!1822 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!353301 () Bool)

(declare-fun Unit!10914 () Unit!10912)

(assert (=> b!353301 (= e!216324 Unit!10914)))

(declare-fun b!353302 () Bool)

(assert (=> b!353302 (= e!216323 (isDefined!295 (getValueByKey!354 (toList!2301 (getCurrentListMap!1822 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71591 c!53658) b!353300))

(assert (= (and d!71591 (not c!53658)) b!353301))

(assert (= (and d!71591 (not res!195929)) b!353302))

(declare-fun m!352721 () Bool)

(assert (=> d!71591 m!352721))

(declare-fun m!352723 () Bool)

(assert (=> b!353300 m!352723))

(declare-fun m!352725 () Bool)

(assert (=> b!353300 m!352725))

(assert (=> b!353300 m!352725))

(declare-fun m!352727 () Bool)

(assert (=> b!353300 m!352727))

(assert (=> b!353302 m!352725))

(assert (=> b!353302 m!352725))

(assert (=> b!353302 m!352727))

(assert (=> b!353258 d!71591))

(declare-fun b!353345 () Bool)

(declare-fun c!53676 () Bool)

(assert (=> b!353345 (= c!53676 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!216356 () ListLongMap!4571)

(declare-fun e!216361 () ListLongMap!4571)

(assert (=> b!353345 (= e!216356 e!216361)))

(declare-fun b!353346 () Bool)

(declare-fun res!195955 () Bool)

(declare-fun e!216360 () Bool)

(assert (=> b!353346 (=> (not res!195955) (not e!216360))))

(declare-fun e!216362 () Bool)

(assert (=> b!353346 (= res!195955 e!216362)))

(declare-fun c!53675 () Bool)

(assert (=> b!353346 (= c!53675 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!353347 () Bool)

(declare-fun call!27130 () Bool)

(assert (=> b!353347 (= e!216362 (not call!27130))))

(declare-fun b!353348 () Bool)

(declare-fun e!216357 () Bool)

(assert (=> b!353348 (= e!216362 e!216357)))

(declare-fun res!195956 () Bool)

(assert (=> b!353348 (= res!195956 call!27130)))

(assert (=> b!353348 (=> (not res!195956) (not e!216357))))

(declare-fun b!353349 () Bool)

(declare-fun e!216359 () ListLongMap!4571)

(assert (=> b!353349 (= e!216359 e!216356)))

(declare-fun c!53672 () Bool)

(assert (=> b!353349 (= c!53672 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!353350 () Bool)

(declare-fun call!27132 () ListLongMap!4571)

(assert (=> b!353350 (= e!216356 call!27132)))

(declare-fun b!353351 () Bool)

(assert (=> b!353351 (= e!216361 call!27132)))

(declare-fun bm!27128 () Bool)

(declare-fun call!27135 () Bool)

(declare-fun lt!165538 () ListLongMap!4571)

(assert (=> bm!27128 (= call!27135 (contains!2375 lt!165538 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!353352 () Bool)

(declare-fun e!216353 () Bool)

(assert (=> b!353352 (= e!216353 (validKeyInArray!0 (select (arr!9058 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun call!27133 () ListLongMap!4571)

(declare-fun bm!27129 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!618 (array!19115 array!19113 (_ BitVec 32) (_ BitVec 32) V!11325 V!11325 (_ BitVec 32) Int) ListLongMap!4571)

(assert (=> bm!27129 (= call!27133 (getCurrentListMapNoExtraKeys!618 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!353353 () Bool)

(declare-fun e!216358 () Bool)

(assert (=> b!353353 (= e!216358 (validKeyInArray!0 (select (arr!9058 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!353354 () Bool)

(declare-fun call!27134 () ListLongMap!4571)

(declare-fun +!745 (ListLongMap!4571 tuple2!5658) ListLongMap!4571)

(assert (=> b!353354 (= e!216359 (+!745 call!27134 (tuple2!5659 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun call!27131 () ListLongMap!4571)

(declare-fun c!53673 () Bool)

(declare-fun bm!27130 () Bool)

(declare-fun call!27136 () ListLongMap!4571)

(assert (=> bm!27130 (= call!27134 (+!745 (ite c!53673 call!27133 (ite c!53672 call!27136 call!27131)) (ite (or c!53673 c!53672) (tuple2!5659 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5659 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!353355 () Bool)

(declare-fun res!195953 () Bool)

(assert (=> b!353355 (=> (not res!195953) (not e!216360))))

(declare-fun e!216351 () Bool)

(assert (=> b!353355 (= res!195953 e!216351)))

(declare-fun res!195949 () Bool)

(assert (=> b!353355 (=> res!195949 e!216351)))

(assert (=> b!353355 (= res!195949 (not e!216353))))

(declare-fun res!195951 () Bool)

(assert (=> b!353355 (=> (not res!195951) (not e!216353))))

(assert (=> b!353355 (= res!195951 (bvslt #b00000000000000000000000000000000 (size!9410 _keys!1895)))))

(declare-fun b!353356 () Bool)

(declare-fun e!216354 () Bool)

(assert (=> b!353356 (= e!216354 (not call!27135))))

(declare-fun bm!27131 () Bool)

(assert (=> bm!27131 (= call!27136 call!27133)))

(declare-fun bm!27132 () Bool)

(assert (=> bm!27132 (= call!27130 (contains!2375 lt!165538 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!71593 () Bool)

(assert (=> d!71593 e!216360))

(declare-fun res!195950 () Bool)

(assert (=> d!71593 (=> (not res!195950) (not e!216360))))

(assert (=> d!71593 (= res!195950 (or (bvsge #b00000000000000000000000000000000 (size!9410 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9410 _keys!1895)))))))

(declare-fun lt!165546 () ListLongMap!4571)

(assert (=> d!71593 (= lt!165538 lt!165546)))

(declare-fun lt!165540 () Unit!10912)

(declare-fun e!216355 () Unit!10912)

(assert (=> d!71593 (= lt!165540 e!216355)))

(declare-fun c!53674 () Bool)

(assert (=> d!71593 (= c!53674 e!216358)))

(declare-fun res!195954 () Bool)

(assert (=> d!71593 (=> (not res!195954) (not e!216358))))

(assert (=> d!71593 (= res!195954 (bvslt #b00000000000000000000000000000000 (size!9410 _keys!1895)))))

(assert (=> d!71593 (= lt!165546 e!216359)))

(assert (=> d!71593 (= c!53673 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71593 (validMask!0 mask!2385)))

(assert (=> d!71593 (= (getCurrentListMap!1822 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!165538)))

(declare-fun bm!27127 () Bool)

(assert (=> bm!27127 (= call!27132 call!27134)))

(declare-fun b!353357 () Bool)

(declare-fun lt!165553 () Unit!10912)

(assert (=> b!353357 (= e!216355 lt!165553)))

(declare-fun lt!165544 () ListLongMap!4571)

(assert (=> b!353357 (= lt!165544 (getCurrentListMapNoExtraKeys!618 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165537 () (_ BitVec 64))

(assert (=> b!353357 (= lt!165537 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165549 () (_ BitVec 64))

(assert (=> b!353357 (= lt!165549 (select (arr!9058 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165535 () Unit!10912)

(declare-fun addStillContains!272 (ListLongMap!4571 (_ BitVec 64) V!11325 (_ BitVec 64)) Unit!10912)

(assert (=> b!353357 (= lt!165535 (addStillContains!272 lt!165544 lt!165537 zeroValue!1467 lt!165549))))

(assert (=> b!353357 (contains!2375 (+!745 lt!165544 (tuple2!5659 lt!165537 zeroValue!1467)) lt!165549)))

(declare-fun lt!165550 () Unit!10912)

(assert (=> b!353357 (= lt!165550 lt!165535)))

(declare-fun lt!165541 () ListLongMap!4571)

(assert (=> b!353357 (= lt!165541 (getCurrentListMapNoExtraKeys!618 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165548 () (_ BitVec 64))

(assert (=> b!353357 (= lt!165548 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165554 () (_ BitVec 64))

(assert (=> b!353357 (= lt!165554 (select (arr!9058 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165552 () Unit!10912)

(declare-fun addApplyDifferent!272 (ListLongMap!4571 (_ BitVec 64) V!11325 (_ BitVec 64)) Unit!10912)

(assert (=> b!353357 (= lt!165552 (addApplyDifferent!272 lt!165541 lt!165548 minValue!1467 lt!165554))))

(declare-fun apply!296 (ListLongMap!4571 (_ BitVec 64)) V!11325)

(assert (=> b!353357 (= (apply!296 (+!745 lt!165541 (tuple2!5659 lt!165548 minValue!1467)) lt!165554) (apply!296 lt!165541 lt!165554))))

(declare-fun lt!165547 () Unit!10912)

(assert (=> b!353357 (= lt!165547 lt!165552)))

(declare-fun lt!165536 () ListLongMap!4571)

(assert (=> b!353357 (= lt!165536 (getCurrentListMapNoExtraKeys!618 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165556 () (_ BitVec 64))

(assert (=> b!353357 (= lt!165556 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165539 () (_ BitVec 64))

(assert (=> b!353357 (= lt!165539 (select (arr!9058 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165555 () Unit!10912)

(assert (=> b!353357 (= lt!165555 (addApplyDifferent!272 lt!165536 lt!165556 zeroValue!1467 lt!165539))))

(assert (=> b!353357 (= (apply!296 (+!745 lt!165536 (tuple2!5659 lt!165556 zeroValue!1467)) lt!165539) (apply!296 lt!165536 lt!165539))))

(declare-fun lt!165542 () Unit!10912)

(assert (=> b!353357 (= lt!165542 lt!165555)))

(declare-fun lt!165545 () ListLongMap!4571)

(assert (=> b!353357 (= lt!165545 (getCurrentListMapNoExtraKeys!618 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165543 () (_ BitVec 64))

(assert (=> b!353357 (= lt!165543 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165551 () (_ BitVec 64))

(assert (=> b!353357 (= lt!165551 (select (arr!9058 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!353357 (= lt!165553 (addApplyDifferent!272 lt!165545 lt!165543 minValue!1467 lt!165551))))

(assert (=> b!353357 (= (apply!296 (+!745 lt!165545 (tuple2!5659 lt!165543 minValue!1467)) lt!165551) (apply!296 lt!165545 lt!165551))))

(declare-fun b!353358 () Bool)

(declare-fun Unit!10915 () Unit!10912)

(assert (=> b!353358 (= e!216355 Unit!10915)))

(declare-fun b!353359 () Bool)

(assert (=> b!353359 (= e!216361 call!27131)))

(declare-fun e!216363 () Bool)

(declare-fun b!353360 () Bool)

(declare-fun get!4828 (ValueCell!3537 V!11325) V!11325)

(declare-fun dynLambda!639 (Int (_ BitVec 64)) V!11325)

(assert (=> b!353360 (= e!216363 (= (apply!296 lt!165538 (select (arr!9058 _keys!1895) #b00000000000000000000000000000000)) (get!4828 (select (arr!9057 _values!1525) #b00000000000000000000000000000000) (dynLambda!639 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!353360 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9409 _values!1525)))))

(assert (=> b!353360 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9410 _keys!1895)))))

(declare-fun b!353361 () Bool)

(assert (=> b!353361 (= e!216351 e!216363)))

(declare-fun res!195948 () Bool)

(assert (=> b!353361 (=> (not res!195948) (not e!216363))))

(assert (=> b!353361 (= res!195948 (contains!2375 lt!165538 (select (arr!9058 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!353361 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9410 _keys!1895)))))

(declare-fun bm!27133 () Bool)

(assert (=> bm!27133 (= call!27131 call!27136)))

(declare-fun b!353362 () Bool)

(assert (=> b!353362 (= e!216360 e!216354)))

(declare-fun c!53671 () Bool)

(assert (=> b!353362 (= c!53671 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!353363 () Bool)

(declare-fun e!216352 () Bool)

(assert (=> b!353363 (= e!216352 (= (apply!296 lt!165538 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!353364 () Bool)

(assert (=> b!353364 (= e!216357 (= (apply!296 lt!165538 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!353365 () Bool)

(assert (=> b!353365 (= e!216354 e!216352)))

(declare-fun res!195952 () Bool)

(assert (=> b!353365 (= res!195952 call!27135)))

(assert (=> b!353365 (=> (not res!195952) (not e!216352))))

(assert (= (and d!71593 c!53673) b!353354))

(assert (= (and d!71593 (not c!53673)) b!353349))

(assert (= (and b!353349 c!53672) b!353350))

(assert (= (and b!353349 (not c!53672)) b!353345))

(assert (= (and b!353345 c!53676) b!353351))

(assert (= (and b!353345 (not c!53676)) b!353359))

(assert (= (or b!353351 b!353359) bm!27133))

(assert (= (or b!353350 bm!27133) bm!27131))

(assert (= (or b!353350 b!353351) bm!27127))

(assert (= (or b!353354 bm!27131) bm!27129))

(assert (= (or b!353354 bm!27127) bm!27130))

(assert (= (and d!71593 res!195954) b!353353))

(assert (= (and d!71593 c!53674) b!353357))

(assert (= (and d!71593 (not c!53674)) b!353358))

(assert (= (and d!71593 res!195950) b!353355))

(assert (= (and b!353355 res!195951) b!353352))

(assert (= (and b!353355 (not res!195949)) b!353361))

(assert (= (and b!353361 res!195948) b!353360))

(assert (= (and b!353355 res!195953) b!353346))

(assert (= (and b!353346 c!53675) b!353348))

(assert (= (and b!353346 (not c!53675)) b!353347))

(assert (= (and b!353348 res!195956) b!353364))

(assert (= (or b!353348 b!353347) bm!27132))

(assert (= (and b!353346 res!195955) b!353362))

(assert (= (and b!353362 c!53671) b!353365))

(assert (= (and b!353362 (not c!53671)) b!353356))

(assert (= (and b!353365 res!195952) b!353363))

(assert (= (or b!353365 b!353356) bm!27128))

(declare-fun b_lambda!8523 () Bool)

(assert (=> (not b_lambda!8523) (not b!353360)))

(declare-fun t!10428 () Bool)

(declare-fun tb!3107 () Bool)

(assert (=> (and start!35234 (= defaultEntry!1528 defaultEntry!1528) t!10428) tb!3107))

(declare-fun result!5651 () Bool)

(assert (=> tb!3107 (= result!5651 tp_is_empty!7761)))

(assert (=> b!353360 t!10428))

(declare-fun b_and!15053 () Bool)

(assert (= b_and!15049 (and (=> t!10428 result!5651) b_and!15053)))

(declare-fun m!352729 () Bool)

(assert (=> bm!27132 m!352729))

(declare-fun m!352731 () Bool)

(assert (=> b!353357 m!352731))

(declare-fun m!352733 () Bool)

(assert (=> b!353357 m!352733))

(declare-fun m!352735 () Bool)

(assert (=> b!353357 m!352735))

(declare-fun m!352737 () Bool)

(assert (=> b!353357 m!352737))

(declare-fun m!352739 () Bool)

(assert (=> b!353357 m!352739))

(declare-fun m!352741 () Bool)

(assert (=> b!353357 m!352741))

(declare-fun m!352743 () Bool)

(assert (=> b!353357 m!352743))

(declare-fun m!352745 () Bool)

(assert (=> b!353357 m!352745))

(declare-fun m!352747 () Bool)

(assert (=> b!353357 m!352747))

(declare-fun m!352749 () Bool)

(assert (=> b!353357 m!352749))

(declare-fun m!352751 () Bool)

(assert (=> b!353357 m!352751))

(declare-fun m!352753 () Bool)

(assert (=> b!353357 m!352753))

(declare-fun m!352755 () Bool)

(assert (=> b!353357 m!352755))

(assert (=> b!353357 m!352745))

(assert (=> b!353357 m!352755))

(declare-fun m!352757 () Bool)

(assert (=> b!353357 m!352757))

(assert (=> b!353357 m!352737))

(declare-fun m!352759 () Bool)

(assert (=> b!353357 m!352759))

(assert (=> b!353357 m!352733))

(declare-fun m!352761 () Bool)

(assert (=> b!353357 m!352761))

(declare-fun m!352763 () Bool)

(assert (=> b!353357 m!352763))

(assert (=> bm!27129 m!352749))

(assert (=> b!353361 m!352753))

(assert (=> b!353361 m!352753))

(declare-fun m!352765 () Bool)

(assert (=> b!353361 m!352765))

(declare-fun m!352767 () Bool)

(assert (=> b!353363 m!352767))

(assert (=> d!71593 m!352687))

(declare-fun m!352769 () Bool)

(assert (=> b!353364 m!352769))

(declare-fun m!352771 () Bool)

(assert (=> bm!27130 m!352771))

(assert (=> b!353352 m!352753))

(assert (=> b!353352 m!352753))

(declare-fun m!352773 () Bool)

(assert (=> b!353352 m!352773))

(assert (=> b!353353 m!352753))

(assert (=> b!353353 m!352753))

(assert (=> b!353353 m!352773))

(declare-fun m!352775 () Bool)

(assert (=> b!353354 m!352775))

(declare-fun m!352777 () Bool)

(assert (=> bm!27128 m!352777))

(declare-fun m!352779 () Bool)

(assert (=> b!353360 m!352779))

(declare-fun m!352781 () Bool)

(assert (=> b!353360 m!352781))

(declare-fun m!352783 () Bool)

(assert (=> b!353360 m!352783))

(assert (=> b!353360 m!352781))

(assert (=> b!353360 m!352753))

(declare-fun m!352785 () Bool)

(assert (=> b!353360 m!352785))

(assert (=> b!353360 m!352753))

(assert (=> b!353360 m!352779))

(assert (=> b!353258 d!71593))

(declare-fun b!353380 () Bool)

(declare-fun c!53684 () Bool)

(declare-fun lt!165563 () (_ BitVec 64))

(assert (=> b!353380 (= c!53684 (= lt!165563 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!216370 () SeekEntryResult!3484)

(declare-fun e!216371 () SeekEntryResult!3484)

(assert (=> b!353380 (= e!216370 e!216371)))

(declare-fun b!353382 () Bool)

(declare-fun e!216372 () SeekEntryResult!3484)

(assert (=> b!353382 (= e!216372 Undefined!3484)))

(declare-fun b!353383 () Bool)

(declare-fun lt!165565 () SeekEntryResult!3484)

(assert (=> b!353383 (= e!216371 (MissingZero!3484 (index!16117 lt!165565)))))

(declare-fun b!353384 () Bool)

(assert (=> b!353384 (= e!216370 (Found!3484 (index!16117 lt!165565)))))

(declare-fun b!353385 () Bool)

(assert (=> b!353385 (= e!216372 e!216370)))

(assert (=> b!353385 (= lt!165563 (select (arr!9058 _keys!1895) (index!16117 lt!165565)))))

(declare-fun c!53683 () Bool)

(assert (=> b!353385 (= c!53683 (= lt!165563 k0!1348))))

(declare-fun b!353381 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!19115 (_ BitVec 32)) SeekEntryResult!3484)

(assert (=> b!353381 (= e!216371 (seekKeyOrZeroReturnVacant!0 (x!35150 lt!165565) (index!16117 lt!165565) (index!16117 lt!165565) k0!1348 _keys!1895 mask!2385))))

(declare-fun d!71595 () Bool)

(declare-fun lt!165564 () SeekEntryResult!3484)

(assert (=> d!71595 (and (or ((_ is Undefined!3484) lt!165564) (not ((_ is Found!3484) lt!165564)) (and (bvsge (index!16116 lt!165564) #b00000000000000000000000000000000) (bvslt (index!16116 lt!165564) (size!9410 _keys!1895)))) (or ((_ is Undefined!3484) lt!165564) ((_ is Found!3484) lt!165564) (not ((_ is MissingZero!3484) lt!165564)) (and (bvsge (index!16115 lt!165564) #b00000000000000000000000000000000) (bvslt (index!16115 lt!165564) (size!9410 _keys!1895)))) (or ((_ is Undefined!3484) lt!165564) ((_ is Found!3484) lt!165564) ((_ is MissingZero!3484) lt!165564) (not ((_ is MissingVacant!3484) lt!165564)) (and (bvsge (index!16118 lt!165564) #b00000000000000000000000000000000) (bvslt (index!16118 lt!165564) (size!9410 _keys!1895)))) (or ((_ is Undefined!3484) lt!165564) (ite ((_ is Found!3484) lt!165564) (= (select (arr!9058 _keys!1895) (index!16116 lt!165564)) k0!1348) (ite ((_ is MissingZero!3484) lt!165564) (= (select (arr!9058 _keys!1895) (index!16115 lt!165564)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3484) lt!165564) (= (select (arr!9058 _keys!1895) (index!16118 lt!165564)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71595 (= lt!165564 e!216372)))

(declare-fun c!53685 () Bool)

(assert (=> d!71595 (= c!53685 (and ((_ is Intermediate!3484) lt!165565) (undefined!4296 lt!165565)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!19115 (_ BitVec 32)) SeekEntryResult!3484)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71595 (= lt!165565 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71595 (validMask!0 mask!2385)))

(assert (=> d!71595 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!165564)))

(assert (= (and d!71595 c!53685) b!353382))

(assert (= (and d!71595 (not c!53685)) b!353385))

(assert (= (and b!353385 c!53683) b!353384))

(assert (= (and b!353385 (not c!53683)) b!353380))

(assert (= (and b!353380 c!53684) b!353383))

(assert (= (and b!353380 (not c!53684)) b!353381))

(declare-fun m!352787 () Bool)

(assert (=> b!353385 m!352787))

(declare-fun m!352789 () Bool)

(assert (=> b!353381 m!352789))

(assert (=> d!71595 m!352687))

(declare-fun m!352791 () Bool)

(assert (=> d!71595 m!352791))

(declare-fun m!352793 () Bool)

(assert (=> d!71595 m!352793))

(declare-fun m!352795 () Bool)

(assert (=> d!71595 m!352795))

(declare-fun m!352797 () Bool)

(assert (=> d!71595 m!352797))

(declare-fun m!352799 () Bool)

(assert (=> d!71595 m!352799))

(assert (=> d!71595 m!352797))

(assert (=> b!353259 d!71595))

(declare-fun b!353394 () Bool)

(declare-fun e!216381 () Bool)

(declare-fun call!27139 () Bool)

(assert (=> b!353394 (= e!216381 call!27139)))

(declare-fun bm!27136 () Bool)

(assert (=> bm!27136 (= call!27139 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!353396 () Bool)

(declare-fun e!216380 () Bool)

(assert (=> b!353396 (= e!216380 e!216381)))

(declare-fun c!53688 () Bool)

(assert (=> b!353396 (= c!53688 (validKeyInArray!0 (select (arr!9058 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!353397 () Bool)

(declare-fun e!216379 () Bool)

(assert (=> b!353397 (= e!216381 e!216379)))

(declare-fun lt!165573 () (_ BitVec 64))

(assert (=> b!353397 (= lt!165573 (select (arr!9058 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165574 () Unit!10912)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19115 (_ BitVec 64) (_ BitVec 32)) Unit!10912)

(assert (=> b!353397 (= lt!165574 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!165573 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!19115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!353397 (arrayContainsKey!0 _keys!1895 lt!165573 #b00000000000000000000000000000000)))

(declare-fun lt!165572 () Unit!10912)

(assert (=> b!353397 (= lt!165572 lt!165574)))

(declare-fun res!195962 () Bool)

(assert (=> b!353397 (= res!195962 (= (seekEntryOrOpen!0 (select (arr!9058 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3484 #b00000000000000000000000000000000)))))

(assert (=> b!353397 (=> (not res!195962) (not e!216379))))

(declare-fun b!353395 () Bool)

(assert (=> b!353395 (= e!216379 call!27139)))

(declare-fun d!71597 () Bool)

(declare-fun res!195961 () Bool)

(assert (=> d!71597 (=> res!195961 e!216380)))

(assert (=> d!71597 (= res!195961 (bvsge #b00000000000000000000000000000000 (size!9410 _keys!1895)))))

(assert (=> d!71597 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!216380)))

(assert (= (and d!71597 (not res!195961)) b!353396))

(assert (= (and b!353396 c!53688) b!353397))

(assert (= (and b!353396 (not c!53688)) b!353394))

(assert (= (and b!353397 res!195962) b!353395))

(assert (= (or b!353395 b!353394) bm!27136))

(declare-fun m!352801 () Bool)

(assert (=> bm!27136 m!352801))

(assert (=> b!353396 m!352753))

(assert (=> b!353396 m!352753))

(assert (=> b!353396 m!352773))

(assert (=> b!353397 m!352753))

(declare-fun m!352803 () Bool)

(assert (=> b!353397 m!352803))

(declare-fun m!352805 () Bool)

(assert (=> b!353397 m!352805))

(assert (=> b!353397 m!352753))

(declare-fun m!352807 () Bool)

(assert (=> b!353397 m!352807))

(assert (=> b!353266 d!71597))

(declare-fun d!71599 () Bool)

(assert (=> d!71599 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!353260 d!71599))

(declare-fun d!71601 () Bool)

(assert (=> d!71601 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!35234 d!71601))

(declare-fun d!71603 () Bool)

(assert (=> d!71603 (= (array_inv!6674 _values!1525) (bvsge (size!9409 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!35234 d!71603))

(declare-fun d!71605 () Bool)

(assert (=> d!71605 (= (array_inv!6675 _keys!1895) (bvsge (size!9410 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!35234 d!71605))

(declare-fun b!353408 () Bool)

(declare-fun e!216393 () Bool)

(declare-fun e!216390 () Bool)

(assert (=> b!353408 (= e!216393 e!216390)))

(declare-fun c!53691 () Bool)

(assert (=> b!353408 (= c!53691 (validKeyInArray!0 (select (arr!9058 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!27139 () Bool)

(declare-fun call!27142 () Bool)

(assert (=> bm!27139 (= call!27142 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53691 (Cons!5273 (select (arr!9058 _keys!1895) #b00000000000000000000000000000000) Nil!5274) Nil!5274)))))

(declare-fun b!353409 () Bool)

(assert (=> b!353409 (= e!216390 call!27142)))

(declare-fun b!353410 () Bool)

(assert (=> b!353410 (= e!216390 call!27142)))

(declare-fun d!71607 () Bool)

(declare-fun res!195969 () Bool)

(declare-fun e!216392 () Bool)

(assert (=> d!71607 (=> res!195969 e!216392)))

(assert (=> d!71607 (= res!195969 (bvsge #b00000000000000000000000000000000 (size!9410 _keys!1895)))))

(assert (=> d!71607 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5274) e!216392)))

(declare-fun b!353411 () Bool)

(assert (=> b!353411 (= e!216392 e!216393)))

(declare-fun res!195971 () Bool)

(assert (=> b!353411 (=> (not res!195971) (not e!216393))))

(declare-fun e!216391 () Bool)

(assert (=> b!353411 (= res!195971 (not e!216391))))

(declare-fun res!195970 () Bool)

(assert (=> b!353411 (=> (not res!195970) (not e!216391))))

(assert (=> b!353411 (= res!195970 (validKeyInArray!0 (select (arr!9058 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!353412 () Bool)

(declare-fun contains!2376 (List!5277 (_ BitVec 64)) Bool)

(assert (=> b!353412 (= e!216391 (contains!2376 Nil!5274 (select (arr!9058 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71607 (not res!195969)) b!353411))

(assert (= (and b!353411 res!195970) b!353412))

(assert (= (and b!353411 res!195971) b!353408))

(assert (= (and b!353408 c!53691) b!353409))

(assert (= (and b!353408 (not c!53691)) b!353410))

(assert (= (or b!353409 b!353410) bm!27139))

(assert (=> b!353408 m!352753))

(assert (=> b!353408 m!352753))

(assert (=> b!353408 m!352773))

(assert (=> bm!27139 m!352753))

(declare-fun m!352809 () Bool)

(assert (=> bm!27139 m!352809))

(assert (=> b!353411 m!352753))

(assert (=> b!353411 m!352753))

(assert (=> b!353411 m!352773))

(assert (=> b!353412 m!352753))

(assert (=> b!353412 m!352753))

(declare-fun m!352811 () Bool)

(assert (=> b!353412 m!352811))

(assert (=> b!353261 d!71607))

(declare-fun mapNonEmpty!13134 () Bool)

(declare-fun mapRes!13134 () Bool)

(declare-fun tp!27030 () Bool)

(declare-fun e!216399 () Bool)

(assert (=> mapNonEmpty!13134 (= mapRes!13134 (and tp!27030 e!216399))))

(declare-fun mapKey!13134 () (_ BitVec 32))

(declare-fun mapValue!13134 () ValueCell!3537)

(declare-fun mapRest!13134 () (Array (_ BitVec 32) ValueCell!3537))

(assert (=> mapNonEmpty!13134 (= mapRest!13128 (store mapRest!13134 mapKey!13134 mapValue!13134))))

(declare-fun b!353419 () Bool)

(assert (=> b!353419 (= e!216399 tp_is_empty!7761)))

(declare-fun b!353420 () Bool)

(declare-fun e!216398 () Bool)

(assert (=> b!353420 (= e!216398 tp_is_empty!7761)))

(declare-fun mapIsEmpty!13134 () Bool)

(assert (=> mapIsEmpty!13134 mapRes!13134))

(declare-fun condMapEmpty!13134 () Bool)

(declare-fun mapDefault!13134 () ValueCell!3537)

(assert (=> mapNonEmpty!13128 (= condMapEmpty!13134 (= mapRest!13128 ((as const (Array (_ BitVec 32) ValueCell!3537)) mapDefault!13134)))))

(assert (=> mapNonEmpty!13128 (= tp!27020 (and e!216398 mapRes!13134))))

(assert (= (and mapNonEmpty!13128 condMapEmpty!13134) mapIsEmpty!13134))

(assert (= (and mapNonEmpty!13128 (not condMapEmpty!13134)) mapNonEmpty!13134))

(assert (= (and mapNonEmpty!13134 ((_ is ValueCellFull!3537) mapValue!13134)) b!353419))

(assert (= (and mapNonEmpty!13128 ((_ is ValueCellFull!3537) mapDefault!13134)) b!353420))

(declare-fun m!352813 () Bool)

(assert (=> mapNonEmpty!13134 m!352813))

(declare-fun b_lambda!8525 () Bool)

(assert (= b_lambda!8523 (or (and start!35234 b_free!7809) b_lambda!8525)))

(check-sat (not d!71591) (not b_lambda!8525) tp_is_empty!7761 (not d!71595) (not bm!27130) (not d!71593) (not b!353352) (not b!353363) b_and!15053 (not b!353357) (not b!353300) (not b_next!7809) (not b!353411) (not b!353353) (not bm!27128) (not bm!27139) (not b!353302) (not bm!27129) (not b!353412) (not b!353381) (not b!353397) (not bm!27132) (not b!353396) (not b!353364) (not b!353408) (not mapNonEmpty!13134) (not b!353361) (not b!353354) (not b!353360) (not bm!27136))
(check-sat b_and!15053 (not b_next!7809))
