; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35132 () Bool)

(assert start!35132)

(declare-fun b_free!7765 () Bool)

(declare-fun b_next!7765 () Bool)

(assert (=> start!35132 (= b_free!7765 (not b_next!7765))))

(declare-fun tp!26882 () Bool)

(declare-fun b_and!14975 () Bool)

(assert (=> start!35132 (= tp!26882 b_and!14975)))

(declare-fun b!352074 () Bool)

(declare-fun e!215593 () Bool)

(declare-fun e!215588 () Bool)

(assert (=> b!352074 (= e!215593 e!215588)))

(declare-fun res!195268 () Bool)

(assert (=> b!352074 (=> (not res!195268) (not e!215588))))

(declare-datatypes ((SeekEntryResult!3467 0))(
  ( (MissingZero!3467 (index!16047 (_ BitVec 32))) (Found!3467 (index!16048 (_ BitVec 32))) (Intermediate!3467 (undefined!4279 Bool) (index!16049 (_ BitVec 32)) (x!35052 (_ BitVec 32))) (Undefined!3467) (MissingVacant!3467 (index!16050 (_ BitVec 32))) )
))
(declare-fun lt!164955 () SeekEntryResult!3467)

(get-info :version)

(assert (=> b!352074 (= res!195268 (and (not ((_ is Found!3467) lt!164955)) (not ((_ is MissingZero!3467) lt!164955)) ((_ is MissingVacant!3467) lt!164955)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!19003 0))(
  ( (array!19004 (arr!9004 (Array (_ BitVec 32) (_ BitVec 64))) (size!9357 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19003)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19003 (_ BitVec 32)) SeekEntryResult!3467)

(assert (=> b!352074 (= lt!164955 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!352075 () Bool)

(declare-fun res!195262 () Bool)

(assert (=> b!352075 (=> (not res!195262) (not e!215593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19003 (_ BitVec 32)) Bool)

(assert (=> b!352075 (= res!195262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!352076 () Bool)

(declare-fun e!215594 () Bool)

(declare-fun e!215590 () Bool)

(assert (=> b!352076 (= e!215594 e!215590)))

(declare-fun c!53495 () Bool)

(assert (=> b!352076 (= c!53495 ((_ is MissingVacant!3467) lt!164955))))

(declare-fun b!352077 () Bool)

(declare-fun e!215589 () Bool)

(assert (=> b!352077 (= e!215589 (not (= (select (arr!9004 _keys!1895) (index!16050 lt!164955)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!352078 () Bool)

(declare-fun res!195265 () Bool)

(assert (=> b!352078 (=> (not res!195265) (not e!215593))))

(declare-datatypes ((List!5217 0))(
  ( (Nil!5214) (Cons!5213 (h!6069 (_ BitVec 64)) (t!10352 List!5217)) )
))
(declare-fun arrayNoDuplicates!0 (array!19003 (_ BitVec 32) List!5217) Bool)

(assert (=> b!352078 (= res!195265 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5214))))

(declare-fun mapNonEmpty!13056 () Bool)

(declare-fun mapRes!13056 () Bool)

(declare-fun tp!26883 () Bool)

(declare-fun e!215596 () Bool)

(assert (=> mapNonEmpty!13056 (= mapRes!13056 (and tp!26883 e!215596))))

(declare-datatypes ((V!11267 0))(
  ( (V!11268 (val!3903 Int)) )
))
(declare-datatypes ((ValueCell!3515 0))(
  ( (ValueCellFull!3515 (v!6087 V!11267)) (EmptyCell!3515) )
))
(declare-fun mapValue!13056 () ValueCell!3515)

(declare-fun mapKey!13056 () (_ BitVec 32))

(declare-datatypes ((array!19005 0))(
  ( (array!19006 (arr!9005 (Array (_ BitVec 32) ValueCell!3515)) (size!9358 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19005)

(declare-fun mapRest!13056 () (Array (_ BitVec 32) ValueCell!3515))

(assert (=> mapNonEmpty!13056 (= (arr!9005 _values!1525) (store mapRest!13056 mapKey!13056 mapValue!13056))))

(declare-fun b!352080 () Bool)

(assert (=> b!352080 (= e!215588 e!215594)))

(declare-fun res!195269 () Bool)

(assert (=> b!352080 (=> (not res!195269) (not e!215594))))

(declare-fun lt!164956 () Bool)

(assert (=> b!352080 (= res!195269 (not lt!164956))))

(declare-datatypes ((Unit!10882 0))(
  ( (Unit!10883) )
))
(declare-fun lt!164957 () Unit!10882)

(declare-fun e!215595 () Unit!10882)

(assert (=> b!352080 (= lt!164957 e!215595)))

(declare-fun c!53494 () Bool)

(assert (=> b!352080 (= c!53494 lt!164956)))

(declare-fun arrayContainsKey!0 (array!19003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!352080 (= lt!164956 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!352081 () Bool)

(assert (=> b!352081 (= e!215590 (not ((_ is Undefined!3467) lt!164955)))))

(declare-fun b!352082 () Bool)

(declare-fun res!195266 () Bool)

(assert (=> b!352082 (=> (not res!195266) (not e!215593))))

(declare-fun zeroValue!1467 () V!11267)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11267)

(declare-datatypes ((tuple2!5602 0))(
  ( (tuple2!5603 (_1!2812 (_ BitVec 64)) (_2!2812 V!11267)) )
))
(declare-datatypes ((List!5218 0))(
  ( (Nil!5215) (Cons!5214 (h!6070 tuple2!5602) (t!10353 List!5218)) )
))
(declare-datatypes ((ListLongMap!4505 0))(
  ( (ListLongMap!4506 (toList!2268 List!5218)) )
))
(declare-fun contains!2351 (ListLongMap!4505 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1773 (array!19003 array!19005 (_ BitVec 32) (_ BitVec 32) V!11267 V!11267 (_ BitVec 32) Int) ListLongMap!4505)

(assert (=> b!352082 (= res!195266 (not (contains!2351 (getCurrentListMap!1773 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!352083 () Bool)

(declare-fun e!215587 () Bool)

(declare-fun e!215592 () Bool)

(assert (=> b!352083 (= e!215587 (and e!215592 mapRes!13056))))

(declare-fun condMapEmpty!13056 () Bool)

(declare-fun mapDefault!13056 () ValueCell!3515)

(assert (=> b!352083 (= condMapEmpty!13056 (= (arr!9005 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3515)) mapDefault!13056)))))

(declare-fun b!352084 () Bool)

(declare-fun Unit!10884 () Unit!10882)

(assert (=> b!352084 (= e!215595 Unit!10884)))

(declare-fun b!352085 () Bool)

(declare-fun tp_is_empty!7717 () Bool)

(assert (=> b!352085 (= e!215592 tp_is_empty!7717)))

(declare-fun b!352086 () Bool)

(assert (=> b!352086 (= e!215590 e!215589)))

(declare-fun res!195263 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!352086 (= res!195263 (not (inRange!0 (index!16050 lt!164955) mask!2385)))))

(assert (=> b!352086 (=> res!195263 e!215589)))

(declare-fun b!352087 () Bool)

(assert (=> b!352087 (= e!215596 tp_is_empty!7717)))

(declare-fun mapIsEmpty!13056 () Bool)

(assert (=> mapIsEmpty!13056 mapRes!13056))

(declare-fun b!352088 () Bool)

(declare-fun Unit!10885 () Unit!10882)

(assert (=> b!352088 (= e!215595 Unit!10885)))

(declare-fun lt!164958 () Unit!10882)

(declare-fun lemmaArrayContainsKeyThenInListMap!336 (array!19003 array!19005 (_ BitVec 32) (_ BitVec 32) V!11267 V!11267 (_ BitVec 64) (_ BitVec 32) Int) Unit!10882)

(declare-fun arrayScanForKey!0 (array!19003 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!352088 (= lt!164958 (lemmaArrayContainsKeyThenInListMap!336 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!352088 false))

(declare-fun b!352089 () Bool)

(declare-fun res!195264 () Bool)

(assert (=> b!352089 (=> (not res!195264) (not e!215593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352089 (= res!195264 (validKeyInArray!0 k0!1348))))

(declare-fun res!195267 () Bool)

(assert (=> start!35132 (=> (not res!195267) (not e!215593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35132 (= res!195267 (validMask!0 mask!2385))))

(assert (=> start!35132 e!215593))

(assert (=> start!35132 true))

(assert (=> start!35132 tp_is_empty!7717))

(assert (=> start!35132 tp!26882))

(declare-fun array_inv!6666 (array!19005) Bool)

(assert (=> start!35132 (and (array_inv!6666 _values!1525) e!215587)))

(declare-fun array_inv!6667 (array!19003) Bool)

(assert (=> start!35132 (array_inv!6667 _keys!1895)))

(declare-fun b!352079 () Bool)

(declare-fun res!195261 () Bool)

(assert (=> b!352079 (=> (not res!195261) (not e!215593))))

(assert (=> b!352079 (= res!195261 (and (= (size!9358 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9357 _keys!1895) (size!9358 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!35132 res!195267) b!352079))

(assert (= (and b!352079 res!195261) b!352075))

(assert (= (and b!352075 res!195262) b!352078))

(assert (= (and b!352078 res!195265) b!352089))

(assert (= (and b!352089 res!195264) b!352082))

(assert (= (and b!352082 res!195266) b!352074))

(assert (= (and b!352074 res!195268) b!352080))

(assert (= (and b!352080 c!53494) b!352088))

(assert (= (and b!352080 (not c!53494)) b!352084))

(assert (= (and b!352080 res!195269) b!352076))

(assert (= (and b!352076 c!53495) b!352086))

(assert (= (and b!352076 (not c!53495)) b!352081))

(assert (= (and b!352086 (not res!195263)) b!352077))

(assert (= (and b!352083 condMapEmpty!13056) mapIsEmpty!13056))

(assert (= (and b!352083 (not condMapEmpty!13056)) mapNonEmpty!13056))

(assert (= (and mapNonEmpty!13056 ((_ is ValueCellFull!3515) mapValue!13056)) b!352087))

(assert (= (and b!352083 ((_ is ValueCellFull!3515) mapDefault!13056)) b!352085))

(assert (= start!35132 b!352083))

(declare-fun m!351285 () Bool)

(assert (=> mapNonEmpty!13056 m!351285))

(declare-fun m!351287 () Bool)

(assert (=> b!352082 m!351287))

(assert (=> b!352082 m!351287))

(declare-fun m!351289 () Bool)

(assert (=> b!352082 m!351289))

(declare-fun m!351291 () Bool)

(assert (=> b!352089 m!351291))

(declare-fun m!351293 () Bool)

(assert (=> b!352075 m!351293))

(declare-fun m!351295 () Bool)

(assert (=> b!352078 m!351295))

(declare-fun m!351297 () Bool)

(assert (=> b!352074 m!351297))

(declare-fun m!351299 () Bool)

(assert (=> b!352088 m!351299))

(assert (=> b!352088 m!351299))

(declare-fun m!351301 () Bool)

(assert (=> b!352088 m!351301))

(declare-fun m!351303 () Bool)

(assert (=> b!352080 m!351303))

(declare-fun m!351305 () Bool)

(assert (=> b!352077 m!351305))

(declare-fun m!351307 () Bool)

(assert (=> start!35132 m!351307))

(declare-fun m!351309 () Bool)

(assert (=> start!35132 m!351309))

(declare-fun m!351311 () Bool)

(assert (=> start!35132 m!351311))

(declare-fun m!351313 () Bool)

(assert (=> b!352086 m!351313))

(check-sat tp_is_empty!7717 (not b!352074) (not b!352089) (not b!352078) b_and!14975 (not b!352088) (not b!352082) (not b!352080) (not b!352086) (not b!352075) (not start!35132) (not b_next!7765) (not mapNonEmpty!13056))
(check-sat b_and!14975 (not b_next!7765))
(get-model)

(declare-fun d!71327 () Bool)

(declare-fun res!195328 () Bool)

(declare-fun e!215661 () Bool)

(assert (=> d!71327 (=> res!195328 e!215661)))

(assert (=> d!71327 (= res!195328 (= (select (arr!9004 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71327 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!215661)))

(declare-fun b!352190 () Bool)

(declare-fun e!215662 () Bool)

(assert (=> b!352190 (= e!215661 e!215662)))

(declare-fun res!195329 () Bool)

(assert (=> b!352190 (=> (not res!195329) (not e!215662))))

(assert (=> b!352190 (= res!195329 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9357 _keys!1895)))))

(declare-fun b!352191 () Bool)

(assert (=> b!352191 (= e!215662 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71327 (not res!195328)) b!352190))

(assert (= (and b!352190 res!195329) b!352191))

(declare-fun m!351375 () Bool)

(assert (=> d!71327 m!351375))

(declare-fun m!351377 () Bool)

(assert (=> b!352191 m!351377))

(assert (=> b!352080 d!71327))

(declare-fun d!71329 () Bool)

(assert (=> d!71329 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!35132 d!71329))

(declare-fun d!71331 () Bool)

(assert (=> d!71331 (= (array_inv!6666 _values!1525) (bvsge (size!9358 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!35132 d!71331))

(declare-fun d!71333 () Bool)

(assert (=> d!71333 (= (array_inv!6667 _keys!1895) (bvsge (size!9357 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!35132 d!71333))

(declare-fun b!352201 () Bool)

(declare-fun e!215671 () Bool)

(declare-fun e!215670 () Bool)

(assert (=> b!352201 (= e!215671 e!215670)))

(declare-fun c!53510 () Bool)

(assert (=> b!352201 (= c!53510 (validKeyInArray!0 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352202 () Bool)

(declare-fun e!215669 () Bool)

(assert (=> b!352202 (= e!215670 e!215669)))

(declare-fun lt!164989 () (_ BitVec 64))

(assert (=> b!352202 (= lt!164989 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164991 () Unit!10882)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19003 (_ BitVec 64) (_ BitVec 32)) Unit!10882)

(assert (=> b!352202 (= lt!164991 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!164989 #b00000000000000000000000000000000))))

(assert (=> b!352202 (arrayContainsKey!0 _keys!1895 lt!164989 #b00000000000000000000000000000000)))

(declare-fun lt!164990 () Unit!10882)

(assert (=> b!352202 (= lt!164990 lt!164991)))

(declare-fun res!195335 () Bool)

(assert (=> b!352202 (= res!195335 (= (seekEntryOrOpen!0 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3467 #b00000000000000000000000000000000)))))

(assert (=> b!352202 (=> (not res!195335) (not e!215669))))

(declare-fun bm!27035 () Bool)

(declare-fun call!27038 () Bool)

(assert (=> bm!27035 (= call!27038 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!352203 () Bool)

(assert (=> b!352203 (= e!215669 call!27038)))

(declare-fun d!71335 () Bool)

(declare-fun res!195334 () Bool)

(assert (=> d!71335 (=> res!195334 e!215671)))

(assert (=> d!71335 (= res!195334 (bvsge #b00000000000000000000000000000000 (size!9357 _keys!1895)))))

(assert (=> d!71335 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!215671)))

(declare-fun b!352200 () Bool)

(assert (=> b!352200 (= e!215670 call!27038)))

(assert (= (and d!71335 (not res!195334)) b!352201))

(assert (= (and b!352201 c!53510) b!352202))

(assert (= (and b!352201 (not c!53510)) b!352200))

(assert (= (and b!352202 res!195335) b!352203))

(assert (= (or b!352203 b!352200) bm!27035))

(assert (=> b!352201 m!351375))

(assert (=> b!352201 m!351375))

(declare-fun m!351379 () Bool)

(assert (=> b!352201 m!351379))

(assert (=> b!352202 m!351375))

(declare-fun m!351381 () Bool)

(assert (=> b!352202 m!351381))

(declare-fun m!351383 () Bool)

(assert (=> b!352202 m!351383))

(assert (=> b!352202 m!351375))

(declare-fun m!351385 () Bool)

(assert (=> b!352202 m!351385))

(declare-fun m!351387 () Bool)

(assert (=> bm!27035 m!351387))

(assert (=> b!352075 d!71335))

(declare-fun d!71337 () Bool)

(assert (=> d!71337 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!352089 d!71337))

(declare-fun d!71339 () Bool)

(assert (=> d!71339 (= (inRange!0 (index!16050 lt!164955) mask!2385) (and (bvsge (index!16050 lt!164955) #b00000000000000000000000000000000) (bvslt (index!16050 lt!164955) (bvadd mask!2385 #b00000000000000000000000000000001))))))

(assert (=> b!352086 d!71339))

(declare-fun b!352214 () Bool)

(declare-fun e!215682 () Bool)

(declare-fun contains!2354 (List!5217 (_ BitVec 64)) Bool)

(assert (=> b!352214 (= e!215682 (contains!2354 Nil!5214 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352215 () Bool)

(declare-fun e!215680 () Bool)

(declare-fun e!215683 () Bool)

(assert (=> b!352215 (= e!215680 e!215683)))

(declare-fun c!53513 () Bool)

(assert (=> b!352215 (= c!53513 (validKeyInArray!0 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352216 () Bool)

(declare-fun call!27041 () Bool)

(assert (=> b!352216 (= e!215683 call!27041)))

(declare-fun b!352217 () Bool)

(assert (=> b!352217 (= e!215683 call!27041)))

(declare-fun d!71341 () Bool)

(declare-fun res!195342 () Bool)

(declare-fun e!215681 () Bool)

(assert (=> d!71341 (=> res!195342 e!215681)))

(assert (=> d!71341 (= res!195342 (bvsge #b00000000000000000000000000000000 (size!9357 _keys!1895)))))

(assert (=> d!71341 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5214) e!215681)))

(declare-fun b!352218 () Bool)

(assert (=> b!352218 (= e!215681 e!215680)))

(declare-fun res!195344 () Bool)

(assert (=> b!352218 (=> (not res!195344) (not e!215680))))

(assert (=> b!352218 (= res!195344 (not e!215682))))

(declare-fun res!195343 () Bool)

(assert (=> b!352218 (=> (not res!195343) (not e!215682))))

(assert (=> b!352218 (= res!195343 (validKeyInArray!0 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!27038 () Bool)

(assert (=> bm!27038 (= call!27041 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53513 (Cons!5213 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000) Nil!5214) Nil!5214)))))

(assert (= (and d!71341 (not res!195342)) b!352218))

(assert (= (and b!352218 res!195343) b!352214))

(assert (= (and b!352218 res!195344) b!352215))

(assert (= (and b!352215 c!53513) b!352216))

(assert (= (and b!352215 (not c!53513)) b!352217))

(assert (= (or b!352216 b!352217) bm!27038))

(assert (=> b!352214 m!351375))

(assert (=> b!352214 m!351375))

(declare-fun m!351389 () Bool)

(assert (=> b!352214 m!351389))

(assert (=> b!352215 m!351375))

(assert (=> b!352215 m!351375))

(assert (=> b!352215 m!351379))

(assert (=> b!352218 m!351375))

(assert (=> b!352218 m!351375))

(assert (=> b!352218 m!351379))

(assert (=> bm!27038 m!351375))

(declare-fun m!351391 () Bool)

(assert (=> bm!27038 m!351391))

(assert (=> b!352078 d!71341))

(declare-fun d!71343 () Bool)

(declare-fun e!215689 () Bool)

(assert (=> d!71343 e!215689))

(declare-fun res!195347 () Bool)

(assert (=> d!71343 (=> res!195347 e!215689)))

(declare-fun lt!165001 () Bool)

(assert (=> d!71343 (= res!195347 (not lt!165001))))

(declare-fun lt!165000 () Bool)

(assert (=> d!71343 (= lt!165001 lt!165000)))

(declare-fun lt!165003 () Unit!10882)

(declare-fun e!215688 () Unit!10882)

(assert (=> d!71343 (= lt!165003 e!215688)))

(declare-fun c!53516 () Bool)

(assert (=> d!71343 (= c!53516 lt!165000)))

(declare-fun containsKey!342 (List!5218 (_ BitVec 64)) Bool)

(assert (=> d!71343 (= lt!165000 (containsKey!342 (toList!2268 (getCurrentListMap!1773 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71343 (= (contains!2351 (getCurrentListMap!1773 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!165001)))

(declare-fun b!352225 () Bool)

(declare-fun lt!165002 () Unit!10882)

(assert (=> b!352225 (= e!215688 lt!165002)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!291 (List!5218 (_ BitVec 64)) Unit!10882)

(assert (=> b!352225 (= lt!165002 (lemmaContainsKeyImpliesGetValueByKeyDefined!291 (toList!2268 (getCurrentListMap!1773 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!356 0))(
  ( (Some!355 (v!6090 V!11267)) (None!354) )
))
(declare-fun isDefined!292 (Option!356) Bool)

(declare-fun getValueByKey!350 (List!5218 (_ BitVec 64)) Option!356)

(assert (=> b!352225 (isDefined!292 (getValueByKey!350 (toList!2268 (getCurrentListMap!1773 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!352226 () Bool)

(declare-fun Unit!10894 () Unit!10882)

(assert (=> b!352226 (= e!215688 Unit!10894)))

(declare-fun b!352227 () Bool)

(assert (=> b!352227 (= e!215689 (isDefined!292 (getValueByKey!350 (toList!2268 (getCurrentListMap!1773 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71343 c!53516) b!352225))

(assert (= (and d!71343 (not c!53516)) b!352226))

(assert (= (and d!71343 (not res!195347)) b!352227))

(declare-fun m!351393 () Bool)

(assert (=> d!71343 m!351393))

(declare-fun m!351395 () Bool)

(assert (=> b!352225 m!351395))

(declare-fun m!351397 () Bool)

(assert (=> b!352225 m!351397))

(assert (=> b!352225 m!351397))

(declare-fun m!351399 () Bool)

(assert (=> b!352225 m!351399))

(assert (=> b!352227 m!351397))

(assert (=> b!352227 m!351397))

(assert (=> b!352227 m!351399))

(assert (=> b!352082 d!71343))

(declare-fun d!71345 () Bool)

(declare-fun e!215718 () Bool)

(assert (=> d!71345 e!215718))

(declare-fun res!195368 () Bool)

(assert (=> d!71345 (=> (not res!195368) (not e!215718))))

(assert (=> d!71345 (= res!195368 (or (bvsge #b00000000000000000000000000000000 (size!9357 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9357 _keys!1895)))))))

(declare-fun lt!165050 () ListLongMap!4505)

(declare-fun lt!165056 () ListLongMap!4505)

(assert (=> d!71345 (= lt!165050 lt!165056)))

(declare-fun lt!165052 () Unit!10882)

(declare-fun e!215720 () Unit!10882)

(assert (=> d!71345 (= lt!165052 e!215720)))

(declare-fun c!53531 () Bool)

(declare-fun e!215719 () Bool)

(assert (=> d!71345 (= c!53531 e!215719)))

(declare-fun res!195366 () Bool)

(assert (=> d!71345 (=> (not res!195366) (not e!215719))))

(assert (=> d!71345 (= res!195366 (bvslt #b00000000000000000000000000000000 (size!9357 _keys!1895)))))

(declare-fun e!215726 () ListLongMap!4505)

(assert (=> d!71345 (= lt!165056 e!215726)))

(declare-fun c!53532 () Bool)

(assert (=> d!71345 (= c!53532 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71345 (validMask!0 mask!2385)))

(assert (=> d!71345 (= (getCurrentListMap!1773 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!165050)))

(declare-fun b!352270 () Bool)

(declare-fun e!215716 () Bool)

(assert (=> b!352270 (= e!215716 (validKeyInArray!0 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352271 () Bool)

(declare-fun e!215717 () Bool)

(assert (=> b!352271 (= e!215718 e!215717)))

(declare-fun c!53534 () Bool)

(assert (=> b!352271 (= c!53534 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27053 () Bool)

(declare-fun call!27056 () Bool)

(assert (=> bm!27053 (= call!27056 (contains!2351 lt!165050 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27054 () Bool)

(declare-fun call!27060 () ListLongMap!4505)

(declare-fun getCurrentListMapNoExtraKeys!610 (array!19003 array!19005 (_ BitVec 32) (_ BitVec 32) V!11267 V!11267 (_ BitVec 32) Int) ListLongMap!4505)

(assert (=> bm!27054 (= call!27060 (getCurrentListMapNoExtraKeys!610 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!352272 () Bool)

(declare-fun Unit!10895 () Unit!10882)

(assert (=> b!352272 (= e!215720 Unit!10895)))

(declare-fun b!352273 () Bool)

(declare-fun call!27058 () Bool)

(assert (=> b!352273 (= e!215717 (not call!27058))))

(declare-fun b!352274 () Bool)

(declare-fun e!215724 () Bool)

(assert (=> b!352274 (= e!215717 e!215724)))

(declare-fun res!195370 () Bool)

(assert (=> b!352274 (= res!195370 call!27058)))

(assert (=> b!352274 (=> (not res!195370) (not e!215724))))

(declare-fun bm!27055 () Bool)

(declare-fun call!27061 () ListLongMap!4505)

(declare-fun call!27057 () ListLongMap!4505)

(assert (=> bm!27055 (= call!27061 call!27057)))

(declare-fun b!352275 () Bool)

(declare-fun res!195371 () Bool)

(assert (=> b!352275 (=> (not res!195371) (not e!215718))))

(declare-fun e!215721 () Bool)

(assert (=> b!352275 (= res!195371 e!215721)))

(declare-fun res!195367 () Bool)

(assert (=> b!352275 (=> res!195367 e!215721)))

(assert (=> b!352275 (= res!195367 (not e!215716))))

(declare-fun res!195369 () Bool)

(assert (=> b!352275 (=> (not res!195369) (not e!215716))))

(assert (=> b!352275 (= res!195369 (bvslt #b00000000000000000000000000000000 (size!9357 _keys!1895)))))

(declare-fun b!352276 () Bool)

(declare-fun e!215723 () Bool)

(assert (=> b!352276 (= e!215723 (not call!27056))))

(declare-fun bm!27056 () Bool)

(declare-fun call!27059 () ListLongMap!4505)

(assert (=> bm!27056 (= call!27059 call!27060)))

(declare-fun b!352277 () Bool)

(declare-fun e!215727 () ListLongMap!4505)

(assert (=> b!352277 (= e!215727 call!27061)))

(declare-fun b!352278 () Bool)

(declare-fun apply!294 (ListLongMap!4505 (_ BitVec 64)) V!11267)

(assert (=> b!352278 (= e!215724 (= (apply!294 lt!165050 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun bm!27057 () Bool)

(declare-fun c!53533 () Bool)

(declare-fun call!27062 () ListLongMap!4505)

(declare-fun +!747 (ListLongMap!4505 tuple2!5602) ListLongMap!4505)

(assert (=> bm!27057 (= call!27057 (+!747 (ite c!53532 call!27060 (ite c!53533 call!27059 call!27062)) (ite (or c!53532 c!53533) (tuple2!5603 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5603 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!352279 () Bool)

(assert (=> b!352279 (= e!215719 (validKeyInArray!0 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352280 () Bool)

(assert (=> b!352280 (= e!215726 (+!747 call!27057 (tuple2!5603 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!27058 () Bool)

(assert (=> bm!27058 (= call!27062 call!27059)))

(declare-fun b!352281 () Bool)

(declare-fun e!215722 () Bool)

(assert (=> b!352281 (= e!215723 e!215722)))

(declare-fun res!195372 () Bool)

(assert (=> b!352281 (= res!195372 call!27056)))

(assert (=> b!352281 (=> (not res!195372) (not e!215722))))

(declare-fun b!352282 () Bool)

(declare-fun e!215728 () ListLongMap!4505)

(assert (=> b!352282 (= e!215728 call!27062)))

(declare-fun b!352283 () Bool)

(assert (=> b!352283 (= e!215728 call!27061)))

(declare-fun e!215725 () Bool)

(declare-fun b!352284 () Bool)

(declare-fun get!4806 (ValueCell!3515 V!11267) V!11267)

(declare-fun dynLambda!628 (Int (_ BitVec 64)) V!11267)

(assert (=> b!352284 (= e!215725 (= (apply!294 lt!165050 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000)) (get!4806 (select (arr!9005 _values!1525) #b00000000000000000000000000000000) (dynLambda!628 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!352284 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9358 _values!1525)))))

(assert (=> b!352284 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9357 _keys!1895)))))

(declare-fun b!352285 () Bool)

(assert (=> b!352285 (= e!215721 e!215725)))

(declare-fun res!195374 () Bool)

(assert (=> b!352285 (=> (not res!195374) (not e!215725))))

(assert (=> b!352285 (= res!195374 (contains!2351 lt!165050 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!352285 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9357 _keys!1895)))))

(declare-fun b!352286 () Bool)

(declare-fun lt!165064 () Unit!10882)

(assert (=> b!352286 (= e!215720 lt!165064)))

(declare-fun lt!165065 () ListLongMap!4505)

(assert (=> b!352286 (= lt!165065 (getCurrentListMapNoExtraKeys!610 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165061 () (_ BitVec 64))

(assert (=> b!352286 (= lt!165061 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165048 () (_ BitVec 64))

(assert (=> b!352286 (= lt!165048 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165062 () Unit!10882)

(declare-fun addStillContains!270 (ListLongMap!4505 (_ BitVec 64) V!11267 (_ BitVec 64)) Unit!10882)

(assert (=> b!352286 (= lt!165062 (addStillContains!270 lt!165065 lt!165061 zeroValue!1467 lt!165048))))

(assert (=> b!352286 (contains!2351 (+!747 lt!165065 (tuple2!5603 lt!165061 zeroValue!1467)) lt!165048)))

(declare-fun lt!165058 () Unit!10882)

(assert (=> b!352286 (= lt!165058 lt!165062)))

(declare-fun lt!165057 () ListLongMap!4505)

(assert (=> b!352286 (= lt!165057 (getCurrentListMapNoExtraKeys!610 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165051 () (_ BitVec 64))

(assert (=> b!352286 (= lt!165051 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165049 () (_ BitVec 64))

(assert (=> b!352286 (= lt!165049 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165068 () Unit!10882)

(declare-fun addApplyDifferent!270 (ListLongMap!4505 (_ BitVec 64) V!11267 (_ BitVec 64)) Unit!10882)

(assert (=> b!352286 (= lt!165068 (addApplyDifferent!270 lt!165057 lt!165051 minValue!1467 lt!165049))))

(assert (=> b!352286 (= (apply!294 (+!747 lt!165057 (tuple2!5603 lt!165051 minValue!1467)) lt!165049) (apply!294 lt!165057 lt!165049))))

(declare-fun lt!165066 () Unit!10882)

(assert (=> b!352286 (= lt!165066 lt!165068)))

(declare-fun lt!165060 () ListLongMap!4505)

(assert (=> b!352286 (= lt!165060 (getCurrentListMapNoExtraKeys!610 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165053 () (_ BitVec 64))

(assert (=> b!352286 (= lt!165053 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165069 () (_ BitVec 64))

(assert (=> b!352286 (= lt!165069 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165063 () Unit!10882)

(assert (=> b!352286 (= lt!165063 (addApplyDifferent!270 lt!165060 lt!165053 zeroValue!1467 lt!165069))))

(assert (=> b!352286 (= (apply!294 (+!747 lt!165060 (tuple2!5603 lt!165053 zeroValue!1467)) lt!165069) (apply!294 lt!165060 lt!165069))))

(declare-fun lt!165054 () Unit!10882)

(assert (=> b!352286 (= lt!165054 lt!165063)))

(declare-fun lt!165067 () ListLongMap!4505)

(assert (=> b!352286 (= lt!165067 (getCurrentListMapNoExtraKeys!610 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165055 () (_ BitVec 64))

(assert (=> b!352286 (= lt!165055 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165059 () (_ BitVec 64))

(assert (=> b!352286 (= lt!165059 (select (arr!9004 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!352286 (= lt!165064 (addApplyDifferent!270 lt!165067 lt!165055 minValue!1467 lt!165059))))

(assert (=> b!352286 (= (apply!294 (+!747 lt!165067 (tuple2!5603 lt!165055 minValue!1467)) lt!165059) (apply!294 lt!165067 lt!165059))))

(declare-fun b!352287 () Bool)

(declare-fun res!195373 () Bool)

(assert (=> b!352287 (=> (not res!195373) (not e!215718))))

(assert (=> b!352287 (= res!195373 e!215723)))

(declare-fun c!53530 () Bool)

(assert (=> b!352287 (= c!53530 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!352288 () Bool)

(assert (=> b!352288 (= e!215722 (= (apply!294 lt!165050 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!352289 () Bool)

(declare-fun c!53529 () Bool)

(assert (=> b!352289 (= c!53529 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!352289 (= e!215727 e!215728)))

(declare-fun bm!27059 () Bool)

(assert (=> bm!27059 (= call!27058 (contains!2351 lt!165050 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!352290 () Bool)

(assert (=> b!352290 (= e!215726 e!215727)))

(assert (=> b!352290 (= c!53533 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!71345 c!53532) b!352280))

(assert (= (and d!71345 (not c!53532)) b!352290))

(assert (= (and b!352290 c!53533) b!352277))

(assert (= (and b!352290 (not c!53533)) b!352289))

(assert (= (and b!352289 c!53529) b!352283))

(assert (= (and b!352289 (not c!53529)) b!352282))

(assert (= (or b!352283 b!352282) bm!27058))

(assert (= (or b!352277 bm!27058) bm!27056))

(assert (= (or b!352277 b!352283) bm!27055))

(assert (= (or b!352280 bm!27056) bm!27054))

(assert (= (or b!352280 bm!27055) bm!27057))

(assert (= (and d!71345 res!195366) b!352279))

(assert (= (and d!71345 c!53531) b!352286))

(assert (= (and d!71345 (not c!53531)) b!352272))

(assert (= (and d!71345 res!195368) b!352275))

(assert (= (and b!352275 res!195369) b!352270))

(assert (= (and b!352275 (not res!195367)) b!352285))

(assert (= (and b!352285 res!195374) b!352284))

(assert (= (and b!352275 res!195371) b!352287))

(assert (= (and b!352287 c!53530) b!352281))

(assert (= (and b!352287 (not c!53530)) b!352276))

(assert (= (and b!352281 res!195372) b!352288))

(assert (= (or b!352281 b!352276) bm!27053))

(assert (= (and b!352287 res!195373) b!352271))

(assert (= (and b!352271 c!53534) b!352274))

(assert (= (and b!352271 (not c!53534)) b!352273))

(assert (= (and b!352274 res!195370) b!352278))

(assert (= (or b!352274 b!352273) bm!27059))

(declare-fun b_lambda!8497 () Bool)

(assert (=> (not b_lambda!8497) (not b!352284)))

(declare-fun t!10358 () Bool)

(declare-fun tb!3095 () Bool)

(assert (=> (and start!35132 (= defaultEntry!1528 defaultEntry!1528) t!10358) tb!3095))

(declare-fun result!5631 () Bool)

(assert (=> tb!3095 (= result!5631 tp_is_empty!7717)))

(assert (=> b!352284 t!10358))

(declare-fun b_and!14981 () Bool)

(assert (= b_and!14975 (and (=> t!10358 result!5631) b_and!14981)))

(assert (=> b!352285 m!351375))

(assert (=> b!352285 m!351375))

(declare-fun m!351401 () Bool)

(assert (=> b!352285 m!351401))

(declare-fun m!351403 () Bool)

(assert (=> b!352288 m!351403))

(declare-fun m!351405 () Bool)

(assert (=> b!352278 m!351405))

(declare-fun m!351407 () Bool)

(assert (=> b!352280 m!351407))

(declare-fun m!351409 () Bool)

(assert (=> bm!27059 m!351409))

(assert (=> d!71345 m!351307))

(declare-fun m!351411 () Bool)

(assert (=> bm!27057 m!351411))

(declare-fun m!351413 () Bool)

(assert (=> bm!27054 m!351413))

(assert (=> b!352279 m!351375))

(assert (=> b!352279 m!351375))

(assert (=> b!352279 m!351379))

(declare-fun m!351415 () Bool)

(assert (=> b!352286 m!351415))

(declare-fun m!351417 () Bool)

(assert (=> b!352286 m!351417))

(declare-fun m!351419 () Bool)

(assert (=> b!352286 m!351419))

(declare-fun m!351421 () Bool)

(assert (=> b!352286 m!351421))

(declare-fun m!351423 () Bool)

(assert (=> b!352286 m!351423))

(declare-fun m!351425 () Bool)

(assert (=> b!352286 m!351425))

(declare-fun m!351427 () Bool)

(assert (=> b!352286 m!351427))

(assert (=> b!352286 m!351417))

(assert (=> b!352286 m!351423))

(declare-fun m!351429 () Bool)

(assert (=> b!352286 m!351429))

(declare-fun m!351431 () Bool)

(assert (=> b!352286 m!351431))

(assert (=> b!352286 m!351375))

(declare-fun m!351433 () Bool)

(assert (=> b!352286 m!351433))

(declare-fun m!351435 () Bool)

(assert (=> b!352286 m!351435))

(declare-fun m!351437 () Bool)

(assert (=> b!352286 m!351437))

(declare-fun m!351439 () Bool)

(assert (=> b!352286 m!351439))

(declare-fun m!351441 () Bool)

(assert (=> b!352286 m!351441))

(assert (=> b!352286 m!351429))

(assert (=> b!352286 m!351413))

(assert (=> b!352286 m!351437))

(declare-fun m!351443 () Bool)

(assert (=> b!352286 m!351443))

(assert (=> b!352270 m!351375))

(assert (=> b!352270 m!351375))

(assert (=> b!352270 m!351379))

(declare-fun m!351445 () Bool)

(assert (=> bm!27053 m!351445))

(assert (=> b!352284 m!351375))

(declare-fun m!351447 () Bool)

(assert (=> b!352284 m!351447))

(declare-fun m!351449 () Bool)

(assert (=> b!352284 m!351449))

(assert (=> b!352284 m!351375))

(declare-fun m!351451 () Bool)

(assert (=> b!352284 m!351451))

(assert (=> b!352284 m!351451))

(assert (=> b!352284 m!351449))

(declare-fun m!351453 () Bool)

(assert (=> b!352284 m!351453))

(assert (=> b!352082 d!71345))

(declare-fun e!215736 () SeekEntryResult!3467)

(declare-fun b!352305 () Bool)

(declare-fun lt!165077 () SeekEntryResult!3467)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!19003 (_ BitVec 32)) SeekEntryResult!3467)

(assert (=> b!352305 (= e!215736 (seekKeyOrZeroReturnVacant!0 (x!35052 lt!165077) (index!16049 lt!165077) (index!16049 lt!165077) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!352306 () Bool)

(declare-fun e!215735 () SeekEntryResult!3467)

(declare-fun e!215737 () SeekEntryResult!3467)

(assert (=> b!352306 (= e!215735 e!215737)))

(declare-fun lt!165078 () (_ BitVec 64))

(assert (=> b!352306 (= lt!165078 (select (arr!9004 _keys!1895) (index!16049 lt!165077)))))

(declare-fun c!53542 () Bool)

(assert (=> b!352306 (= c!53542 (= lt!165078 k0!1348))))

(declare-fun b!352307 () Bool)

(declare-fun c!53541 () Bool)

(assert (=> b!352307 (= c!53541 (= lt!165078 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!352307 (= e!215737 e!215736)))

(declare-fun d!71347 () Bool)

(declare-fun lt!165076 () SeekEntryResult!3467)

(assert (=> d!71347 (and (or ((_ is Undefined!3467) lt!165076) (not ((_ is Found!3467) lt!165076)) (and (bvsge (index!16048 lt!165076) #b00000000000000000000000000000000) (bvslt (index!16048 lt!165076) (size!9357 _keys!1895)))) (or ((_ is Undefined!3467) lt!165076) ((_ is Found!3467) lt!165076) (not ((_ is MissingZero!3467) lt!165076)) (and (bvsge (index!16047 lt!165076) #b00000000000000000000000000000000) (bvslt (index!16047 lt!165076) (size!9357 _keys!1895)))) (or ((_ is Undefined!3467) lt!165076) ((_ is Found!3467) lt!165076) ((_ is MissingZero!3467) lt!165076) (not ((_ is MissingVacant!3467) lt!165076)) (and (bvsge (index!16050 lt!165076) #b00000000000000000000000000000000) (bvslt (index!16050 lt!165076) (size!9357 _keys!1895)))) (or ((_ is Undefined!3467) lt!165076) (ite ((_ is Found!3467) lt!165076) (= (select (arr!9004 _keys!1895) (index!16048 lt!165076)) k0!1348) (ite ((_ is MissingZero!3467) lt!165076) (= (select (arr!9004 _keys!1895) (index!16047 lt!165076)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3467) lt!165076) (= (select (arr!9004 _keys!1895) (index!16050 lt!165076)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71347 (= lt!165076 e!215735)))

(declare-fun c!53543 () Bool)

(assert (=> d!71347 (= c!53543 (and ((_ is Intermediate!3467) lt!165077) (undefined!4279 lt!165077)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!19003 (_ BitVec 32)) SeekEntryResult!3467)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71347 (= lt!165077 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71347 (validMask!0 mask!2385)))

(assert (=> d!71347 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!165076)))

(declare-fun b!352308 () Bool)

(assert (=> b!352308 (= e!215735 Undefined!3467)))

(declare-fun b!352309 () Bool)

(assert (=> b!352309 (= e!215737 (Found!3467 (index!16049 lt!165077)))))

(declare-fun b!352310 () Bool)

(assert (=> b!352310 (= e!215736 (MissingZero!3467 (index!16049 lt!165077)))))

(assert (= (and d!71347 c!53543) b!352308))

(assert (= (and d!71347 (not c!53543)) b!352306))

(assert (= (and b!352306 c!53542) b!352309))

(assert (= (and b!352306 (not c!53542)) b!352307))

(assert (= (and b!352307 c!53541) b!352310))

(assert (= (and b!352307 (not c!53541)) b!352305))

(declare-fun m!351455 () Bool)

(assert (=> b!352305 m!351455))

(declare-fun m!351457 () Bool)

(assert (=> b!352306 m!351457))

(declare-fun m!351459 () Bool)

(assert (=> d!71347 m!351459))

(declare-fun m!351461 () Bool)

(assert (=> d!71347 m!351461))

(assert (=> d!71347 m!351307))

(declare-fun m!351463 () Bool)

(assert (=> d!71347 m!351463))

(declare-fun m!351465 () Bool)

(assert (=> d!71347 m!351465))

(assert (=> d!71347 m!351461))

(declare-fun m!351467 () Bool)

(assert (=> d!71347 m!351467))

(assert (=> b!352074 d!71347))

(declare-fun d!71349 () Bool)

(assert (=> d!71349 (contains!2351 (getCurrentListMap!1773 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!165081 () Unit!10882)

(declare-fun choose!1316 (array!19003 array!19005 (_ BitVec 32) (_ BitVec 32) V!11267 V!11267 (_ BitVec 64) (_ BitVec 32) Int) Unit!10882)

(assert (=> d!71349 (= lt!165081 (choose!1316 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!71349 (validMask!0 mask!2385)))

(assert (=> d!71349 (= (lemmaArrayContainsKeyThenInListMap!336 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!165081)))

(declare-fun bs!11960 () Bool)

(assert (= bs!11960 d!71349))

(assert (=> bs!11960 m!351287))

(assert (=> bs!11960 m!351287))

(assert (=> bs!11960 m!351289))

(assert (=> bs!11960 m!351299))

(declare-fun m!351469 () Bool)

(assert (=> bs!11960 m!351469))

(assert (=> bs!11960 m!351307))

(assert (=> b!352088 d!71349))

(declare-fun d!71351 () Bool)

(declare-fun lt!165084 () (_ BitVec 32))

(assert (=> d!71351 (and (or (bvslt lt!165084 #b00000000000000000000000000000000) (bvsge lt!165084 (size!9357 _keys!1895)) (and (bvsge lt!165084 #b00000000000000000000000000000000) (bvslt lt!165084 (size!9357 _keys!1895)))) (bvsge lt!165084 #b00000000000000000000000000000000) (bvslt lt!165084 (size!9357 _keys!1895)) (= (select (arr!9004 _keys!1895) lt!165084) k0!1348))))

(declare-fun e!215740 () (_ BitVec 32))

(assert (=> d!71351 (= lt!165084 e!215740)))

(declare-fun c!53546 () Bool)

(assert (=> d!71351 (= c!53546 (= (select (arr!9004 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71351 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9357 _keys!1895)) (bvslt (size!9357 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71351 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!165084)))

(declare-fun b!352315 () Bool)

(assert (=> b!352315 (= e!215740 #b00000000000000000000000000000000)))

(declare-fun b!352316 () Bool)

(assert (=> b!352316 (= e!215740 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71351 c!53546) b!352315))

(assert (= (and d!71351 (not c!53546)) b!352316))

(declare-fun m!351471 () Bool)

(assert (=> d!71351 m!351471))

(assert (=> d!71351 m!351375))

(declare-fun m!351473 () Bool)

(assert (=> b!352316 m!351473))

(assert (=> b!352088 d!71351))

(declare-fun b!352324 () Bool)

(declare-fun e!215745 () Bool)

(assert (=> b!352324 (= e!215745 tp_is_empty!7717)))

(declare-fun mapIsEmpty!13065 () Bool)

(declare-fun mapRes!13065 () Bool)

(assert (=> mapIsEmpty!13065 mapRes!13065))

(declare-fun b!352323 () Bool)

(declare-fun e!215746 () Bool)

(assert (=> b!352323 (= e!215746 tp_is_empty!7717)))

(declare-fun mapNonEmpty!13065 () Bool)

(declare-fun tp!26898 () Bool)

(assert (=> mapNonEmpty!13065 (= mapRes!13065 (and tp!26898 e!215746))))

(declare-fun mapRest!13065 () (Array (_ BitVec 32) ValueCell!3515))

(declare-fun mapValue!13065 () ValueCell!3515)

(declare-fun mapKey!13065 () (_ BitVec 32))

(assert (=> mapNonEmpty!13065 (= mapRest!13056 (store mapRest!13065 mapKey!13065 mapValue!13065))))

(declare-fun condMapEmpty!13065 () Bool)

(declare-fun mapDefault!13065 () ValueCell!3515)

(assert (=> mapNonEmpty!13056 (= condMapEmpty!13065 (= mapRest!13056 ((as const (Array (_ BitVec 32) ValueCell!3515)) mapDefault!13065)))))

(assert (=> mapNonEmpty!13056 (= tp!26883 (and e!215745 mapRes!13065))))

(assert (= (and mapNonEmpty!13056 condMapEmpty!13065) mapIsEmpty!13065))

(assert (= (and mapNonEmpty!13056 (not condMapEmpty!13065)) mapNonEmpty!13065))

(assert (= (and mapNonEmpty!13065 ((_ is ValueCellFull!3515) mapValue!13065)) b!352323))

(assert (= (and mapNonEmpty!13056 ((_ is ValueCellFull!3515) mapDefault!13065)) b!352324))

(declare-fun m!351475 () Bool)

(assert (=> mapNonEmpty!13065 m!351475))

(declare-fun b_lambda!8499 () Bool)

(assert (= b_lambda!8497 (or (and start!35132 b_free!7765) b_lambda!8499)))

(check-sat (not b_lambda!8499) tp_is_empty!7717 (not b!352215) (not mapNonEmpty!13065) (not b!352201) (not b!352305) (not b!352286) (not d!71349) b_and!14981 (not d!71345) (not b!352202) (not b!352316) (not b!352270) (not bm!27057) (not b!352280) (not d!71343) (not b!352279) (not bm!27054) (not bm!27035) (not bm!27038) (not b!352214) (not bm!27059) (not b!352191) (not bm!27053) (not b!352284) (not b!352225) (not b!352285) (not d!71347) (not b!352218) (not b_next!7765) (not b!352278) (not b!352288) (not b!352227))
(check-sat b_and!14981 (not b_next!7765))
