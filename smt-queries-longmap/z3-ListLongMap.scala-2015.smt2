; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35100 () Bool)

(assert start!35100)

(declare-fun b_free!7759 () Bool)

(declare-fun b_next!7759 () Bool)

(assert (=> start!35100 (= b_free!7759 (not b_next!7759))))

(declare-fun tp!26862 () Bool)

(declare-fun b_and!14967 () Bool)

(assert (=> start!35100 (= tp!26862 b_and!14967)))

(declare-fun b!351805 () Bool)

(declare-fun e!215427 () Bool)

(declare-fun tp_is_empty!7711 () Bool)

(assert (=> b!351805 (= e!215427 tp_is_empty!7711)))

(declare-fun res!195131 () Bool)

(declare-fun e!215422 () Bool)

(assert (=> start!35100 (=> (not res!195131) (not e!215422))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35100 (= res!195131 (validMask!0 mask!2385))))

(assert (=> start!35100 e!215422))

(assert (=> start!35100 true))

(assert (=> start!35100 tp_is_empty!7711))

(assert (=> start!35100 tp!26862))

(declare-datatypes ((V!11259 0))(
  ( (V!11260 (val!3900 Int)) )
))
(declare-datatypes ((ValueCell!3512 0))(
  ( (ValueCellFull!3512 (v!6083 V!11259)) (EmptyCell!3512) )
))
(declare-datatypes ((array!18991 0))(
  ( (array!18992 (arr!8999 (Array (_ BitVec 32) ValueCell!3512)) (size!9352 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18991)

(declare-fun e!215426 () Bool)

(declare-fun array_inv!6664 (array!18991) Bool)

(assert (=> start!35100 (and (array_inv!6664 _values!1525) e!215426)))

(declare-datatypes ((array!18993 0))(
  ( (array!18994 (arr!9000 (Array (_ BitVec 32) (_ BitVec 64))) (size!9353 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18993)

(declare-fun array_inv!6665 (array!18993) Bool)

(assert (=> start!35100 (array_inv!6665 _keys!1895)))

(declare-fun b!351806 () Bool)

(declare-fun e!215421 () Bool)

(declare-datatypes ((SeekEntryResult!3465 0))(
  ( (MissingZero!3465 (index!16039 (_ BitVec 32))) (Found!3465 (index!16040 (_ BitVec 32))) (Intermediate!3465 (undefined!4277 Bool) (index!16041 (_ BitVec 32)) (x!35032 (_ BitVec 32))) (Undefined!3465) (MissingVacant!3465 (index!16042 (_ BitVec 32))) )
))
(declare-fun lt!164820 () SeekEntryResult!3465)

(assert (=> b!351806 (= e!215421 (or (bvslt (index!16042 lt!164820) #b00000000000000000000000000000000) (bvsge (index!16042 lt!164820) (size!9353 _keys!1895))))))

(declare-fun mapNonEmpty!13044 () Bool)

(declare-fun mapRes!13044 () Bool)

(declare-fun tp!26861 () Bool)

(assert (=> mapNonEmpty!13044 (= mapRes!13044 (and tp!26861 e!215427))))

(declare-fun mapValue!13044 () ValueCell!3512)

(declare-fun mapKey!13044 () (_ BitVec 32))

(declare-fun mapRest!13044 () (Array (_ BitVec 32) ValueCell!3512))

(assert (=> mapNonEmpty!13044 (= (arr!8999 _values!1525) (store mapRest!13044 mapKey!13044 mapValue!13044))))

(declare-fun b!351807 () Bool)

(declare-fun e!215428 () Bool)

(assert (=> b!351807 (= e!215422 e!215428)))

(declare-fun res!195133 () Bool)

(assert (=> b!351807 (=> (not res!195133) (not e!215428))))

(get-info :version)

(assert (=> b!351807 (= res!195133 (and (not ((_ is Found!3465) lt!164820)) (not ((_ is MissingZero!3465) lt!164820)) ((_ is MissingVacant!3465) lt!164820)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18993 (_ BitVec 32)) SeekEntryResult!3465)

(assert (=> b!351807 (= lt!164820 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!351808 () Bool)

(declare-fun res!195135 () Bool)

(assert (=> b!351808 (=> (not res!195135) (not e!215422))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!351808 (= res!195135 (validKeyInArray!0 k0!1348))))

(declare-fun b!351809 () Bool)

(declare-datatypes ((Unit!10872 0))(
  ( (Unit!10873) )
))
(declare-fun e!215425 () Unit!10872)

(declare-fun Unit!10874 () Unit!10872)

(assert (=> b!351809 (= e!215425 Unit!10874)))

(declare-fun b!351810 () Bool)

(declare-fun Unit!10875 () Unit!10872)

(assert (=> b!351810 (= e!215425 Unit!10875)))

(declare-fun zeroValue!1467 () V!11259)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11259)

(declare-fun lt!164818 () Unit!10872)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun lemmaArrayContainsKeyThenInListMap!334 (array!18993 array!18991 (_ BitVec 32) (_ BitVec 32) V!11259 V!11259 (_ BitVec 64) (_ BitVec 32) Int) Unit!10872)

(declare-fun arrayScanForKey!0 (array!18993 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351810 (= lt!164818 (lemmaArrayContainsKeyThenInListMap!334 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!351810 false))

(declare-fun b!351811 () Bool)

(declare-fun e!215424 () Bool)

(assert (=> b!351811 (= e!215426 (and e!215424 mapRes!13044))))

(declare-fun condMapEmpty!13044 () Bool)

(declare-fun mapDefault!13044 () ValueCell!3512)

(assert (=> b!351811 (= condMapEmpty!13044 (= (arr!8999 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3512)) mapDefault!13044)))))

(declare-fun b!351812 () Bool)

(declare-fun res!195132 () Bool)

(assert (=> b!351812 (=> (not res!195132) (not e!215422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18993 (_ BitVec 32)) Bool)

(assert (=> b!351812 (= res!195132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!351813 () Bool)

(declare-fun res!195134 () Bool)

(assert (=> b!351813 (=> (not res!195134) (not e!215422))))

(declare-datatypes ((tuple2!5600 0))(
  ( (tuple2!5601 (_1!2811 (_ BitVec 64)) (_2!2811 V!11259)) )
))
(declare-datatypes ((List!5214 0))(
  ( (Nil!5211) (Cons!5210 (h!6066 tuple2!5600) (t!10347 List!5214)) )
))
(declare-datatypes ((ListLongMap!4503 0))(
  ( (ListLongMap!4504 (toList!2267 List!5214)) )
))
(declare-fun contains!2349 (ListLongMap!4503 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1772 (array!18993 array!18991 (_ BitVec 32) (_ BitVec 32) V!11259 V!11259 (_ BitVec 32) Int) ListLongMap!4503)

(assert (=> b!351813 (= res!195134 (not (contains!2349 (getCurrentListMap!1772 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!351814 () Bool)

(declare-fun res!195129 () Bool)

(assert (=> b!351814 (=> (not res!195129) (not e!215421))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!351814 (= res!195129 (inRange!0 (index!16042 lt!164820) mask!2385))))

(declare-fun b!351815 () Bool)

(assert (=> b!351815 (= e!215428 e!215421)))

(declare-fun res!195136 () Bool)

(assert (=> b!351815 (=> (not res!195136) (not e!215421))))

(declare-fun lt!164819 () Bool)

(assert (=> b!351815 (= res!195136 (not lt!164819))))

(declare-fun lt!164817 () Unit!10872)

(assert (=> b!351815 (= lt!164817 e!215425)))

(declare-fun c!53444 () Bool)

(assert (=> b!351815 (= c!53444 lt!164819)))

(declare-fun arrayContainsKey!0 (array!18993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351815 (= lt!164819 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!351816 () Bool)

(declare-fun res!195130 () Bool)

(assert (=> b!351816 (=> (not res!195130) (not e!215422))))

(assert (=> b!351816 (= res!195130 (and (= (size!9352 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9353 _keys!1895) (size!9352 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!351817 () Bool)

(declare-fun res!195137 () Bool)

(assert (=> b!351817 (=> (not res!195137) (not e!215422))))

(declare-datatypes ((List!5215 0))(
  ( (Nil!5212) (Cons!5211 (h!6067 (_ BitVec 64)) (t!10348 List!5215)) )
))
(declare-fun arrayNoDuplicates!0 (array!18993 (_ BitVec 32) List!5215) Bool)

(assert (=> b!351817 (= res!195137 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5212))))

(declare-fun b!351818 () Bool)

(assert (=> b!351818 (= e!215424 tp_is_empty!7711)))

(declare-fun mapIsEmpty!13044 () Bool)

(assert (=> mapIsEmpty!13044 mapRes!13044))

(assert (= (and start!35100 res!195131) b!351816))

(assert (= (and b!351816 res!195130) b!351812))

(assert (= (and b!351812 res!195132) b!351817))

(assert (= (and b!351817 res!195137) b!351808))

(assert (= (and b!351808 res!195135) b!351813))

(assert (= (and b!351813 res!195134) b!351807))

(assert (= (and b!351807 res!195133) b!351815))

(assert (= (and b!351815 c!53444) b!351810))

(assert (= (and b!351815 (not c!53444)) b!351809))

(assert (= (and b!351815 res!195136) b!351814))

(assert (= (and b!351814 res!195129) b!351806))

(assert (= (and b!351811 condMapEmpty!13044) mapIsEmpty!13044))

(assert (= (and b!351811 (not condMapEmpty!13044)) mapNonEmpty!13044))

(assert (= (and mapNonEmpty!13044 ((_ is ValueCellFull!3512) mapValue!13044)) b!351805))

(assert (= (and b!351811 ((_ is ValueCellFull!3512) mapDefault!13044)) b!351818))

(assert (= start!35100 b!351811))

(declare-fun m!351099 () Bool)

(assert (=> b!351808 m!351099))

(declare-fun m!351101 () Bool)

(assert (=> b!351815 m!351101))

(declare-fun m!351103 () Bool)

(assert (=> mapNonEmpty!13044 m!351103))

(declare-fun m!351105 () Bool)

(assert (=> b!351813 m!351105))

(assert (=> b!351813 m!351105))

(declare-fun m!351107 () Bool)

(assert (=> b!351813 m!351107))

(declare-fun m!351109 () Bool)

(assert (=> b!351810 m!351109))

(assert (=> b!351810 m!351109))

(declare-fun m!351111 () Bool)

(assert (=> b!351810 m!351111))

(declare-fun m!351113 () Bool)

(assert (=> b!351812 m!351113))

(declare-fun m!351115 () Bool)

(assert (=> start!35100 m!351115))

(declare-fun m!351117 () Bool)

(assert (=> start!35100 m!351117))

(declare-fun m!351119 () Bool)

(assert (=> start!35100 m!351119))

(declare-fun m!351121 () Bool)

(assert (=> b!351814 m!351121))

(declare-fun m!351123 () Bool)

(assert (=> b!351807 m!351123))

(declare-fun m!351125 () Bool)

(assert (=> b!351817 m!351125))

(check-sat (not mapNonEmpty!13044) (not b!351817) (not b_next!7759) (not b!351808) (not b!351810) (not b!351813) (not b!351814) tp_is_empty!7711 b_and!14967 (not b!351812) (not b!351815) (not start!35100) (not b!351807))
(check-sat b_and!14967 (not b_next!7759))
(get-model)

(declare-fun d!71299 () Bool)

(assert (=> d!71299 (= (inRange!0 (index!16042 lt!164820) mask!2385) (and (bvsge (index!16042 lt!164820) #b00000000000000000000000000000000) (bvslt (index!16042 lt!164820) (bvadd mask!2385 #b00000000000000000000000000000001))))))

(assert (=> b!351814 d!71299))

(declare-fun d!71301 () Bool)

(assert (=> d!71301 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!351808 d!71301))

(declare-fun d!71303 () Bool)

(assert (=> d!71303 (contains!2349 (getCurrentListMap!1772 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!164847 () Unit!10872)

(declare-fun choose!1315 (array!18993 array!18991 (_ BitVec 32) (_ BitVec 32) V!11259 V!11259 (_ BitVec 64) (_ BitVec 32) Int) Unit!10872)

(assert (=> d!71303 (= lt!164847 (choose!1315 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!71303 (validMask!0 mask!2385)))

(assert (=> d!71303 (= (lemmaArrayContainsKeyThenInListMap!334 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!164847)))

(declare-fun bs!11956 () Bool)

(assert (= bs!11956 d!71303))

(assert (=> bs!11956 m!351105))

(assert (=> bs!11956 m!351105))

(assert (=> bs!11956 m!351107))

(assert (=> bs!11956 m!351109))

(declare-fun m!351183 () Bool)

(assert (=> bs!11956 m!351183))

(assert (=> bs!11956 m!351115))

(assert (=> b!351810 d!71303))

(declare-fun d!71305 () Bool)

(declare-fun lt!164850 () (_ BitVec 32))

(assert (=> d!71305 (and (or (bvslt lt!164850 #b00000000000000000000000000000000) (bvsge lt!164850 (size!9353 _keys!1895)) (and (bvsge lt!164850 #b00000000000000000000000000000000) (bvslt lt!164850 (size!9353 _keys!1895)))) (bvsge lt!164850 #b00000000000000000000000000000000) (bvslt lt!164850 (size!9353 _keys!1895)) (= (select (arr!9000 _keys!1895) lt!164850) k0!1348))))

(declare-fun e!215479 () (_ BitVec 32))

(assert (=> d!71305 (= lt!164850 e!215479)))

(declare-fun c!53453 () Bool)

(assert (=> d!71305 (= c!53453 (= (select (arr!9000 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71305 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9353 _keys!1895)) (bvslt (size!9353 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71305 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!164850)))

(declare-fun b!351907 () Bool)

(assert (=> b!351907 (= e!215479 #b00000000000000000000000000000000)))

(declare-fun b!351908 () Bool)

(assert (=> b!351908 (= e!215479 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71305 c!53453) b!351907))

(assert (= (and d!71305 (not c!53453)) b!351908))

(declare-fun m!351185 () Bool)

(assert (=> d!71305 m!351185))

(declare-fun m!351187 () Bool)

(assert (=> d!71305 m!351187))

(declare-fun m!351189 () Bool)

(assert (=> b!351908 m!351189))

(assert (=> b!351810 d!71305))

(declare-fun d!71307 () Bool)

(declare-fun res!195196 () Bool)

(declare-fun e!215484 () Bool)

(assert (=> d!71307 (=> res!195196 e!215484)))

(assert (=> d!71307 (= res!195196 (= (select (arr!9000 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71307 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!215484)))

(declare-fun b!351913 () Bool)

(declare-fun e!215485 () Bool)

(assert (=> b!351913 (= e!215484 e!215485)))

(declare-fun res!195197 () Bool)

(assert (=> b!351913 (=> (not res!195197) (not e!215485))))

(assert (=> b!351913 (= res!195197 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9353 _keys!1895)))))

(declare-fun b!351914 () Bool)

(assert (=> b!351914 (= e!215485 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71307 (not res!195196)) b!351913))

(assert (= (and b!351913 res!195197) b!351914))

(assert (=> d!71307 m!351187))

(declare-fun m!351191 () Bool)

(assert (=> b!351914 m!351191))

(assert (=> b!351815 d!71307))

(declare-fun b!351925 () Bool)

(declare-fun e!215494 () Bool)

(declare-fun contains!2350 (List!5215 (_ BitVec 64)) Bool)

(assert (=> b!351925 (= e!215494 (contains!2350 Nil!5212 (select (arr!9000 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!351926 () Bool)

(declare-fun e!215495 () Bool)

(declare-fun e!215497 () Bool)

(assert (=> b!351926 (= e!215495 e!215497)))

(declare-fun c!53456 () Bool)

(assert (=> b!351926 (= c!53456 (validKeyInArray!0 (select (arr!9000 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!27008 () Bool)

(declare-fun call!27011 () Bool)

(assert (=> bm!27008 (= call!27011 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53456 (Cons!5211 (select (arr!9000 _keys!1895) #b00000000000000000000000000000000) Nil!5212) Nil!5212)))))

(declare-fun b!351927 () Bool)

(assert (=> b!351927 (= e!215497 call!27011)))

(declare-fun b!351928 () Bool)

(assert (=> b!351928 (= e!215497 call!27011)))

(declare-fun b!351929 () Bool)

(declare-fun e!215496 () Bool)

(assert (=> b!351929 (= e!215496 e!215495)))

(declare-fun res!195206 () Bool)

(assert (=> b!351929 (=> (not res!195206) (not e!215495))))

(assert (=> b!351929 (= res!195206 (not e!215494))))

(declare-fun res!195205 () Bool)

(assert (=> b!351929 (=> (not res!195205) (not e!215494))))

(assert (=> b!351929 (= res!195205 (validKeyInArray!0 (select (arr!9000 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71309 () Bool)

(declare-fun res!195204 () Bool)

(assert (=> d!71309 (=> res!195204 e!215496)))

(assert (=> d!71309 (= res!195204 (bvsge #b00000000000000000000000000000000 (size!9353 _keys!1895)))))

(assert (=> d!71309 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5212) e!215496)))

(assert (= (and d!71309 (not res!195204)) b!351929))

(assert (= (and b!351929 res!195205) b!351925))

(assert (= (and b!351929 res!195206) b!351926))

(assert (= (and b!351926 c!53456) b!351928))

(assert (= (and b!351926 (not c!53456)) b!351927))

(assert (= (or b!351928 b!351927) bm!27008))

(assert (=> b!351925 m!351187))

(assert (=> b!351925 m!351187))

(declare-fun m!351193 () Bool)

(assert (=> b!351925 m!351193))

(assert (=> b!351926 m!351187))

(assert (=> b!351926 m!351187))

(declare-fun m!351195 () Bool)

(assert (=> b!351926 m!351195))

(assert (=> bm!27008 m!351187))

(declare-fun m!351197 () Bool)

(assert (=> bm!27008 m!351197))

(assert (=> b!351929 m!351187))

(assert (=> b!351929 m!351187))

(assert (=> b!351929 m!351195))

(assert (=> b!351817 d!71309))

(declare-fun d!71311 () Bool)

(declare-fun e!215502 () Bool)

(assert (=> d!71311 e!215502))

(declare-fun res!195209 () Bool)

(assert (=> d!71311 (=> res!195209 e!215502)))

(declare-fun lt!164862 () Bool)

(assert (=> d!71311 (= res!195209 (not lt!164862))))

(declare-fun lt!164860 () Bool)

(assert (=> d!71311 (= lt!164862 lt!164860)))

(declare-fun lt!164861 () Unit!10872)

(declare-fun e!215503 () Unit!10872)

(assert (=> d!71311 (= lt!164861 e!215503)))

(declare-fun c!53459 () Bool)

(assert (=> d!71311 (= c!53459 lt!164860)))

(declare-fun containsKey!341 (List!5214 (_ BitVec 64)) Bool)

(assert (=> d!71311 (= lt!164860 (containsKey!341 (toList!2267 (getCurrentListMap!1772 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71311 (= (contains!2349 (getCurrentListMap!1772 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!164862)))

(declare-fun b!351936 () Bool)

(declare-fun lt!164859 () Unit!10872)

(assert (=> b!351936 (= e!215503 lt!164859)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!290 (List!5214 (_ BitVec 64)) Unit!10872)

(assert (=> b!351936 (= lt!164859 (lemmaContainsKeyImpliesGetValueByKeyDefined!290 (toList!2267 (getCurrentListMap!1772 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!355 0))(
  ( (Some!354 (v!6086 V!11259)) (None!353) )
))
(declare-fun isDefined!291 (Option!355) Bool)

(declare-fun getValueByKey!349 (List!5214 (_ BitVec 64)) Option!355)

(assert (=> b!351936 (isDefined!291 (getValueByKey!349 (toList!2267 (getCurrentListMap!1772 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!351937 () Bool)

(declare-fun Unit!10880 () Unit!10872)

(assert (=> b!351937 (= e!215503 Unit!10880)))

(declare-fun b!351938 () Bool)

(assert (=> b!351938 (= e!215502 (isDefined!291 (getValueByKey!349 (toList!2267 (getCurrentListMap!1772 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71311 c!53459) b!351936))

(assert (= (and d!71311 (not c!53459)) b!351937))

(assert (= (and d!71311 (not res!195209)) b!351938))

(declare-fun m!351199 () Bool)

(assert (=> d!71311 m!351199))

(declare-fun m!351201 () Bool)

(assert (=> b!351936 m!351201))

(declare-fun m!351203 () Bool)

(assert (=> b!351936 m!351203))

(assert (=> b!351936 m!351203))

(declare-fun m!351205 () Bool)

(assert (=> b!351936 m!351205))

(assert (=> b!351938 m!351203))

(assert (=> b!351938 m!351203))

(assert (=> b!351938 m!351205))

(assert (=> b!351813 d!71311))

(declare-fun bm!27023 () Bool)

(declare-fun call!27032 () ListLongMap!4503)

(declare-fun getCurrentListMapNoExtraKeys!609 (array!18993 array!18991 (_ BitVec 32) (_ BitVec 32) V!11259 V!11259 (_ BitVec 32) Int) ListLongMap!4503)

(assert (=> bm!27023 (= call!27032 (getCurrentListMapNoExtraKeys!609 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!351981 () Bool)

(declare-fun e!215530 () Bool)

(declare-fun e!215533 () Bool)

(assert (=> b!351981 (= e!215530 e!215533)))

(declare-fun res!195234 () Bool)

(assert (=> b!351981 (=> (not res!195234) (not e!215533))))

(declare-fun lt!164928 () ListLongMap!4503)

(assert (=> b!351981 (= res!195234 (contains!2349 lt!164928 (select (arr!9000 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!351981 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9353 _keys!1895)))))

(declare-fun b!351982 () Bool)

(declare-fun e!215532 () Bool)

(assert (=> b!351982 (= e!215532 (validKeyInArray!0 (select (arr!9000 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!351983 () Bool)

(declare-fun e!215542 () Unit!10872)

(declare-fun Unit!10881 () Unit!10872)

(assert (=> b!351983 (= e!215542 Unit!10881)))

(declare-fun b!351984 () Bool)

(declare-fun e!215531 () Bool)

(declare-fun e!215534 () Bool)

(assert (=> b!351984 (= e!215531 e!215534)))

(declare-fun res!195228 () Bool)

(declare-fun call!27029 () Bool)

(assert (=> b!351984 (= res!195228 call!27029)))

(assert (=> b!351984 (=> (not res!195228) (not e!215534))))

(declare-fun bm!27024 () Bool)

(declare-fun call!27026 () Bool)

(assert (=> bm!27024 (= call!27026 (contains!2349 lt!164928 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!351985 () Bool)

(declare-fun res!195235 () Bool)

(declare-fun e!215536 () Bool)

(assert (=> b!351985 (=> (not res!195235) (not e!215536))))

(declare-fun e!215537 () Bool)

(assert (=> b!351985 (= res!195235 e!215537)))

(declare-fun c!53475 () Bool)

(assert (=> b!351985 (= c!53475 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!27025 () Bool)

(assert (=> bm!27025 (= call!27029 (contains!2349 lt!164928 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!351986 () Bool)

(assert (=> b!351986 (= e!215536 e!215531)))

(declare-fun c!53472 () Bool)

(assert (=> b!351986 (= c!53472 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!351987 () Bool)

(declare-fun e!215540 () Bool)

(assert (=> b!351987 (= e!215540 (validKeyInArray!0 (select (arr!9000 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!27026 () Bool)

(declare-fun call!27027 () ListLongMap!4503)

(assert (=> bm!27026 (= call!27027 call!27032)))

(declare-fun b!351988 () Bool)

(declare-fun e!215539 () ListLongMap!4503)

(declare-fun call!27028 () ListLongMap!4503)

(assert (=> b!351988 (= e!215539 call!27028)))

(declare-fun b!351989 () Bool)

(declare-fun e!215535 () Bool)

(assert (=> b!351989 (= e!215537 e!215535)))

(declare-fun res!195229 () Bool)

(assert (=> b!351989 (= res!195229 call!27026)))

(assert (=> b!351989 (=> (not res!195229) (not e!215535))))

(declare-fun bm!27027 () Bool)

(declare-fun call!27031 () ListLongMap!4503)

(assert (=> bm!27027 (= call!27031 call!27027)))

(declare-fun b!351990 () Bool)

(assert (=> b!351990 (= e!215531 (not call!27029))))

(declare-fun b!351991 () Bool)

(assert (=> b!351991 (= e!215537 (not call!27026))))

(declare-fun b!351992 () Bool)

(declare-fun res!195236 () Bool)

(assert (=> b!351992 (=> (not res!195236) (not e!215536))))

(assert (=> b!351992 (= res!195236 e!215530)))

(declare-fun res!195233 () Bool)

(assert (=> b!351992 (=> res!195233 e!215530)))

(assert (=> b!351992 (= res!195233 (not e!215532))))

(declare-fun res!195230 () Bool)

(assert (=> b!351992 (=> (not res!195230) (not e!215532))))

(assert (=> b!351992 (= res!195230 (bvslt #b00000000000000000000000000000000 (size!9353 _keys!1895)))))

(declare-fun bm!27028 () Bool)

(declare-fun call!27030 () ListLongMap!4503)

(assert (=> bm!27028 (= call!27028 call!27030)))

(declare-fun bm!27029 () Bool)

(declare-fun c!53476 () Bool)

(declare-fun c!53477 () Bool)

(declare-fun +!746 (ListLongMap!4503 tuple2!5600) ListLongMap!4503)

(assert (=> bm!27029 (= call!27030 (+!746 (ite c!53476 call!27032 (ite c!53477 call!27027 call!27031)) (ite (or c!53476 c!53477) (tuple2!5601 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!351993 () Bool)

(declare-fun e!215541 () ListLongMap!4503)

(assert (=> b!351993 (= e!215541 (+!746 call!27030 (tuple2!5601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!351994 () Bool)

(declare-fun apply!293 (ListLongMap!4503 (_ BitVec 64)) V!11259)

(assert (=> b!351994 (= e!215534 (= (apply!293 lt!164928 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!351995 () Bool)

(declare-fun get!4803 (ValueCell!3512 V!11259) V!11259)

(declare-fun dynLambda!627 (Int (_ BitVec 64)) V!11259)

(assert (=> b!351995 (= e!215533 (= (apply!293 lt!164928 (select (arr!9000 _keys!1895) #b00000000000000000000000000000000)) (get!4803 (select (arr!8999 _values!1525) #b00000000000000000000000000000000) (dynLambda!627 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!351995 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9352 _values!1525)))))

(assert (=> b!351995 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9353 _keys!1895)))))

(declare-fun d!71313 () Bool)

(assert (=> d!71313 e!215536))

(declare-fun res!195231 () Bool)

(assert (=> d!71313 (=> (not res!195231) (not e!215536))))

(assert (=> d!71313 (= res!195231 (or (bvsge #b00000000000000000000000000000000 (size!9353 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9353 _keys!1895)))))))

(declare-fun lt!164910 () ListLongMap!4503)

(assert (=> d!71313 (= lt!164928 lt!164910)))

(declare-fun lt!164919 () Unit!10872)

(assert (=> d!71313 (= lt!164919 e!215542)))

(declare-fun c!53473 () Bool)

(assert (=> d!71313 (= c!53473 e!215540)))

(declare-fun res!195232 () Bool)

(assert (=> d!71313 (=> (not res!195232) (not e!215540))))

(assert (=> d!71313 (= res!195232 (bvslt #b00000000000000000000000000000000 (size!9353 _keys!1895)))))

(assert (=> d!71313 (= lt!164910 e!215541)))

(assert (=> d!71313 (= c!53476 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71313 (validMask!0 mask!2385)))

(assert (=> d!71313 (= (getCurrentListMap!1772 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!164928)))

(declare-fun b!351996 () Bool)

(assert (=> b!351996 (= e!215535 (= (apply!293 lt!164928 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!351997 () Bool)

(declare-fun e!215538 () ListLongMap!4503)

(assert (=> b!351997 (= e!215538 call!27028)))

(declare-fun b!351998 () Bool)

(declare-fun c!53474 () Bool)

(assert (=> b!351998 (= c!53474 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!351998 (= e!215539 e!215538)))

(declare-fun b!351999 () Bool)

(assert (=> b!351999 (= e!215541 e!215539)))

(assert (=> b!351999 (= c!53477 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!352000 () Bool)

(assert (=> b!352000 (= e!215538 call!27031)))

(declare-fun b!352001 () Bool)

(declare-fun lt!164908 () Unit!10872)

(assert (=> b!352001 (= e!215542 lt!164908)))

(declare-fun lt!164916 () ListLongMap!4503)

(assert (=> b!352001 (= lt!164916 (getCurrentListMapNoExtraKeys!609 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164917 () (_ BitVec 64))

(assert (=> b!352001 (= lt!164917 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164924 () (_ BitVec 64))

(assert (=> b!352001 (= lt!164924 (select (arr!9000 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164922 () Unit!10872)

(declare-fun addStillContains!269 (ListLongMap!4503 (_ BitVec 64) V!11259 (_ BitVec 64)) Unit!10872)

(assert (=> b!352001 (= lt!164922 (addStillContains!269 lt!164916 lt!164917 zeroValue!1467 lt!164924))))

(assert (=> b!352001 (contains!2349 (+!746 lt!164916 (tuple2!5601 lt!164917 zeroValue!1467)) lt!164924)))

(declare-fun lt!164918 () Unit!10872)

(assert (=> b!352001 (= lt!164918 lt!164922)))

(declare-fun lt!164909 () ListLongMap!4503)

(assert (=> b!352001 (= lt!164909 (getCurrentListMapNoExtraKeys!609 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164920 () (_ BitVec 64))

(assert (=> b!352001 (= lt!164920 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164921 () (_ BitVec 64))

(assert (=> b!352001 (= lt!164921 (select (arr!9000 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164915 () Unit!10872)

(declare-fun addApplyDifferent!269 (ListLongMap!4503 (_ BitVec 64) V!11259 (_ BitVec 64)) Unit!10872)

(assert (=> b!352001 (= lt!164915 (addApplyDifferent!269 lt!164909 lt!164920 minValue!1467 lt!164921))))

(assert (=> b!352001 (= (apply!293 (+!746 lt!164909 (tuple2!5601 lt!164920 minValue!1467)) lt!164921) (apply!293 lt!164909 lt!164921))))

(declare-fun lt!164913 () Unit!10872)

(assert (=> b!352001 (= lt!164913 lt!164915)))

(declare-fun lt!164912 () ListLongMap!4503)

(assert (=> b!352001 (= lt!164912 (getCurrentListMapNoExtraKeys!609 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164907 () (_ BitVec 64))

(assert (=> b!352001 (= lt!164907 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164923 () (_ BitVec 64))

(assert (=> b!352001 (= lt!164923 (select (arr!9000 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164925 () Unit!10872)

(assert (=> b!352001 (= lt!164925 (addApplyDifferent!269 lt!164912 lt!164907 zeroValue!1467 lt!164923))))

(assert (=> b!352001 (= (apply!293 (+!746 lt!164912 (tuple2!5601 lt!164907 zeroValue!1467)) lt!164923) (apply!293 lt!164912 lt!164923))))

(declare-fun lt!164926 () Unit!10872)

(assert (=> b!352001 (= lt!164926 lt!164925)))

(declare-fun lt!164914 () ListLongMap!4503)

(assert (=> b!352001 (= lt!164914 (getCurrentListMapNoExtraKeys!609 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164927 () (_ BitVec 64))

(assert (=> b!352001 (= lt!164927 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164911 () (_ BitVec 64))

(assert (=> b!352001 (= lt!164911 (select (arr!9000 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!352001 (= lt!164908 (addApplyDifferent!269 lt!164914 lt!164927 minValue!1467 lt!164911))))

(assert (=> b!352001 (= (apply!293 (+!746 lt!164914 (tuple2!5601 lt!164927 minValue!1467)) lt!164911) (apply!293 lt!164914 lt!164911))))

(assert (= (and d!71313 c!53476) b!351993))

(assert (= (and d!71313 (not c!53476)) b!351999))

(assert (= (and b!351999 c!53477) b!351988))

(assert (= (and b!351999 (not c!53477)) b!351998))

(assert (= (and b!351998 c!53474) b!351997))

(assert (= (and b!351998 (not c!53474)) b!352000))

(assert (= (or b!351997 b!352000) bm!27027))

(assert (= (or b!351988 bm!27027) bm!27026))

(assert (= (or b!351988 b!351997) bm!27028))

(assert (= (or b!351993 bm!27026) bm!27023))

(assert (= (or b!351993 bm!27028) bm!27029))

(assert (= (and d!71313 res!195232) b!351987))

(assert (= (and d!71313 c!53473) b!352001))

(assert (= (and d!71313 (not c!53473)) b!351983))

(assert (= (and d!71313 res!195231) b!351992))

(assert (= (and b!351992 res!195230) b!351982))

(assert (= (and b!351992 (not res!195233)) b!351981))

(assert (= (and b!351981 res!195234) b!351995))

(assert (= (and b!351992 res!195236) b!351985))

(assert (= (and b!351985 c!53475) b!351989))

(assert (= (and b!351985 (not c!53475)) b!351991))

(assert (= (and b!351989 res!195229) b!351996))

(assert (= (or b!351989 b!351991) bm!27024))

(assert (= (and b!351985 res!195235) b!351986))

(assert (= (and b!351986 c!53472) b!351984))

(assert (= (and b!351986 (not c!53472)) b!351990))

(assert (= (and b!351984 res!195228) b!351994))

(assert (= (or b!351984 b!351990) bm!27025))

(declare-fun b_lambda!8493 () Bool)

(assert (=> (not b_lambda!8493) (not b!351995)))

(declare-fun t!10351 () Bool)

(declare-fun tb!3093 () Bool)

(assert (=> (and start!35100 (= defaultEntry!1528 defaultEntry!1528) t!10351) tb!3093))

(declare-fun result!5625 () Bool)

(assert (=> tb!3093 (= result!5625 tp_is_empty!7711)))

(assert (=> b!351995 t!10351))

(declare-fun b_and!14973 () Bool)

(assert (= b_and!14967 (and (=> t!10351 result!5625) b_and!14973)))

(assert (=> b!351995 m!351187))

(declare-fun m!351207 () Bool)

(assert (=> b!351995 m!351207))

(assert (=> b!351995 m!351207))

(declare-fun m!351209 () Bool)

(assert (=> b!351995 m!351209))

(declare-fun m!351211 () Bool)

(assert (=> b!351995 m!351211))

(assert (=> b!351995 m!351209))

(assert (=> b!351995 m!351187))

(declare-fun m!351213 () Bool)

(assert (=> b!351995 m!351213))

(declare-fun m!351215 () Bool)

(assert (=> bm!27029 m!351215))

(assert (=> d!71313 m!351115))

(declare-fun m!351217 () Bool)

(assert (=> b!352001 m!351217))

(declare-fun m!351219 () Bool)

(assert (=> b!352001 m!351219))

(declare-fun m!351221 () Bool)

(assert (=> b!352001 m!351221))

(declare-fun m!351223 () Bool)

(assert (=> b!352001 m!351223))

(declare-fun m!351225 () Bool)

(assert (=> b!352001 m!351225))

(declare-fun m!351227 () Bool)

(assert (=> b!352001 m!351227))

(declare-fun m!351229 () Bool)

(assert (=> b!352001 m!351229))

(declare-fun m!351231 () Bool)

(assert (=> b!352001 m!351231))

(declare-fun m!351233 () Bool)

(assert (=> b!352001 m!351233))

(declare-fun m!351235 () Bool)

(assert (=> b!352001 m!351235))

(assert (=> b!352001 m!351187))

(assert (=> b!352001 m!351223))

(declare-fun m!351237 () Bool)

(assert (=> b!352001 m!351237))

(assert (=> b!352001 m!351231))

(declare-fun m!351239 () Bool)

(assert (=> b!352001 m!351239))

(declare-fun m!351241 () Bool)

(assert (=> b!352001 m!351241))

(assert (=> b!352001 m!351217))

(declare-fun m!351243 () Bool)

(assert (=> b!352001 m!351243))

(declare-fun m!351245 () Bool)

(assert (=> b!352001 m!351245))

(assert (=> b!352001 m!351219))

(declare-fun m!351247 () Bool)

(assert (=> b!352001 m!351247))

(declare-fun m!351249 () Bool)

(assert (=> bm!27024 m!351249))

(assert (=> b!351981 m!351187))

(assert (=> b!351981 m!351187))

(declare-fun m!351251 () Bool)

(assert (=> b!351981 m!351251))

(assert (=> b!351987 m!351187))

(assert (=> b!351987 m!351187))

(assert (=> b!351987 m!351195))

(declare-fun m!351253 () Bool)

(assert (=> b!351993 m!351253))

(declare-fun m!351255 () Bool)

(assert (=> b!351994 m!351255))

(declare-fun m!351257 () Bool)

(assert (=> b!351996 m!351257))

(assert (=> b!351982 m!351187))

(assert (=> b!351982 m!351187))

(assert (=> b!351982 m!351195))

(declare-fun m!351259 () Bool)

(assert (=> bm!27025 m!351259))

(assert (=> bm!27023 m!351247))

(assert (=> b!351813 d!71313))

(declare-fun e!215551 () SeekEntryResult!3465)

(declare-fun b!352016 () Bool)

(declare-fun lt!164936 () SeekEntryResult!3465)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18993 (_ BitVec 32)) SeekEntryResult!3465)

(assert (=> b!352016 (= e!215551 (seekKeyOrZeroReturnVacant!0 (x!35032 lt!164936) (index!16041 lt!164936) (index!16041 lt!164936) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!352017 () Bool)

(declare-fun e!215550 () SeekEntryResult!3465)

(assert (=> b!352017 (= e!215550 Undefined!3465)))

(declare-fun d!71315 () Bool)

(declare-fun lt!164937 () SeekEntryResult!3465)

(assert (=> d!71315 (and (or ((_ is Undefined!3465) lt!164937) (not ((_ is Found!3465) lt!164937)) (and (bvsge (index!16040 lt!164937) #b00000000000000000000000000000000) (bvslt (index!16040 lt!164937) (size!9353 _keys!1895)))) (or ((_ is Undefined!3465) lt!164937) ((_ is Found!3465) lt!164937) (not ((_ is MissingZero!3465) lt!164937)) (and (bvsge (index!16039 lt!164937) #b00000000000000000000000000000000) (bvslt (index!16039 lt!164937) (size!9353 _keys!1895)))) (or ((_ is Undefined!3465) lt!164937) ((_ is Found!3465) lt!164937) ((_ is MissingZero!3465) lt!164937) (not ((_ is MissingVacant!3465) lt!164937)) (and (bvsge (index!16042 lt!164937) #b00000000000000000000000000000000) (bvslt (index!16042 lt!164937) (size!9353 _keys!1895)))) (or ((_ is Undefined!3465) lt!164937) (ite ((_ is Found!3465) lt!164937) (= (select (arr!9000 _keys!1895) (index!16040 lt!164937)) k0!1348) (ite ((_ is MissingZero!3465) lt!164937) (= (select (arr!9000 _keys!1895) (index!16039 lt!164937)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3465) lt!164937) (= (select (arr!9000 _keys!1895) (index!16042 lt!164937)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71315 (= lt!164937 e!215550)))

(declare-fun c!53485 () Bool)

(assert (=> d!71315 (= c!53485 (and ((_ is Intermediate!3465) lt!164936) (undefined!4277 lt!164936)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18993 (_ BitVec 32)) SeekEntryResult!3465)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71315 (= lt!164936 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71315 (validMask!0 mask!2385)))

(assert (=> d!71315 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!164937)))

(declare-fun b!352018 () Bool)

(declare-fun e!215549 () SeekEntryResult!3465)

(assert (=> b!352018 (= e!215550 e!215549)))

(declare-fun lt!164935 () (_ BitVec 64))

(assert (=> b!352018 (= lt!164935 (select (arr!9000 _keys!1895) (index!16041 lt!164936)))))

(declare-fun c!53486 () Bool)

(assert (=> b!352018 (= c!53486 (= lt!164935 k0!1348))))

(declare-fun b!352019 () Bool)

(assert (=> b!352019 (= e!215549 (Found!3465 (index!16041 lt!164936)))))

(declare-fun b!352020 () Bool)

(assert (=> b!352020 (= e!215551 (MissingZero!3465 (index!16041 lt!164936)))))

(declare-fun b!352021 () Bool)

(declare-fun c!53484 () Bool)

(assert (=> b!352021 (= c!53484 (= lt!164935 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!352021 (= e!215549 e!215551)))

(assert (= (and d!71315 c!53485) b!352017))

(assert (= (and d!71315 (not c!53485)) b!352018))

(assert (= (and b!352018 c!53486) b!352019))

(assert (= (and b!352018 (not c!53486)) b!352021))

(assert (= (and b!352021 c!53484) b!352020))

(assert (= (and b!352021 (not c!53484)) b!352016))

(declare-fun m!351261 () Bool)

(assert (=> b!352016 m!351261))

(declare-fun m!351263 () Bool)

(assert (=> d!71315 m!351263))

(assert (=> d!71315 m!351115))

(declare-fun m!351265 () Bool)

(assert (=> d!71315 m!351265))

(declare-fun m!351267 () Bool)

(assert (=> d!71315 m!351267))

(assert (=> d!71315 m!351263))

(declare-fun m!351269 () Bool)

(assert (=> d!71315 m!351269))

(declare-fun m!351271 () Bool)

(assert (=> d!71315 m!351271))

(declare-fun m!351273 () Bool)

(assert (=> b!352018 m!351273))

(assert (=> b!351807 d!71315))

(declare-fun d!71317 () Bool)

(assert (=> d!71317 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!35100 d!71317))

(declare-fun d!71319 () Bool)

(assert (=> d!71319 (= (array_inv!6664 _values!1525) (bvsge (size!9352 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!35100 d!71319))

(declare-fun d!71321 () Bool)

(assert (=> d!71321 (= (array_inv!6665 _keys!1895) (bvsge (size!9353 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!35100 d!71321))

(declare-fun b!352030 () Bool)

(declare-fun e!215558 () Bool)

(declare-fun call!27035 () Bool)

(assert (=> b!352030 (= e!215558 call!27035)))

(declare-fun b!352031 () Bool)

(declare-fun e!215559 () Bool)

(assert (=> b!352031 (= e!215558 e!215559)))

(declare-fun lt!164945 () (_ BitVec 64))

(assert (=> b!352031 (= lt!164945 (select (arr!9000 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164944 () Unit!10872)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18993 (_ BitVec 64) (_ BitVec 32)) Unit!10872)

(assert (=> b!352031 (= lt!164944 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!164945 #b00000000000000000000000000000000))))

(assert (=> b!352031 (arrayContainsKey!0 _keys!1895 lt!164945 #b00000000000000000000000000000000)))

(declare-fun lt!164946 () Unit!10872)

(assert (=> b!352031 (= lt!164946 lt!164944)))

(declare-fun res!195242 () Bool)

(assert (=> b!352031 (= res!195242 (= (seekEntryOrOpen!0 (select (arr!9000 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3465 #b00000000000000000000000000000000)))))

(assert (=> b!352031 (=> (not res!195242) (not e!215559))))

(declare-fun bm!27032 () Bool)

(assert (=> bm!27032 (= call!27035 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!71323 () Bool)

(declare-fun res!195241 () Bool)

(declare-fun e!215560 () Bool)

(assert (=> d!71323 (=> res!195241 e!215560)))

(assert (=> d!71323 (= res!195241 (bvsge #b00000000000000000000000000000000 (size!9353 _keys!1895)))))

(assert (=> d!71323 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!215560)))

(declare-fun b!352032 () Bool)

(assert (=> b!352032 (= e!215559 call!27035)))

(declare-fun b!352033 () Bool)

(assert (=> b!352033 (= e!215560 e!215558)))

(declare-fun c!53489 () Bool)

(assert (=> b!352033 (= c!53489 (validKeyInArray!0 (select (arr!9000 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71323 (not res!195241)) b!352033))

(assert (= (and b!352033 c!53489) b!352031))

(assert (= (and b!352033 (not c!53489)) b!352030))

(assert (= (and b!352031 res!195242) b!352032))

(assert (= (or b!352032 b!352030) bm!27032))

(assert (=> b!352031 m!351187))

(declare-fun m!351275 () Bool)

(assert (=> b!352031 m!351275))

(declare-fun m!351277 () Bool)

(assert (=> b!352031 m!351277))

(assert (=> b!352031 m!351187))

(declare-fun m!351279 () Bool)

(assert (=> b!352031 m!351279))

(declare-fun m!351281 () Bool)

(assert (=> bm!27032 m!351281))

(assert (=> b!352033 m!351187))

(assert (=> b!352033 m!351187))

(assert (=> b!352033 m!351195))

(assert (=> b!351812 d!71323))

(declare-fun condMapEmpty!13053 () Bool)

(declare-fun mapDefault!13053 () ValueCell!3512)

(assert (=> mapNonEmpty!13044 (= condMapEmpty!13053 (= mapRest!13044 ((as const (Array (_ BitVec 32) ValueCell!3512)) mapDefault!13053)))))

(declare-fun e!215566 () Bool)

(declare-fun mapRes!13053 () Bool)

(assert (=> mapNonEmpty!13044 (= tp!26861 (and e!215566 mapRes!13053))))

(declare-fun b!352041 () Bool)

(assert (=> b!352041 (= e!215566 tp_is_empty!7711)))

(declare-fun mapNonEmpty!13053 () Bool)

(declare-fun tp!26877 () Bool)

(declare-fun e!215565 () Bool)

(assert (=> mapNonEmpty!13053 (= mapRes!13053 (and tp!26877 e!215565))))

(declare-fun mapValue!13053 () ValueCell!3512)

(declare-fun mapRest!13053 () (Array (_ BitVec 32) ValueCell!3512))

(declare-fun mapKey!13053 () (_ BitVec 32))

(assert (=> mapNonEmpty!13053 (= mapRest!13044 (store mapRest!13053 mapKey!13053 mapValue!13053))))

(declare-fun mapIsEmpty!13053 () Bool)

(assert (=> mapIsEmpty!13053 mapRes!13053))

(declare-fun b!352040 () Bool)

(assert (=> b!352040 (= e!215565 tp_is_empty!7711)))

(assert (= (and mapNonEmpty!13044 condMapEmpty!13053) mapIsEmpty!13053))

(assert (= (and mapNonEmpty!13044 (not condMapEmpty!13053)) mapNonEmpty!13053))

(assert (= (and mapNonEmpty!13053 ((_ is ValueCellFull!3512) mapValue!13053)) b!352040))

(assert (= (and mapNonEmpty!13044 ((_ is ValueCellFull!3512) mapDefault!13053)) b!352041))

(declare-fun m!351283 () Bool)

(assert (=> mapNonEmpty!13053 m!351283))

(declare-fun b_lambda!8495 () Bool)

(assert (= b_lambda!8493 (or (and start!35100 b_free!7759) b_lambda!8495)))

(check-sat (not b!351994) (not b!352001) (not b!351996) (not b!351987) (not b!351936) (not d!71303) (not b!352033) (not bm!27023) (not mapNonEmpty!13053) (not d!71311) tp_is_empty!7711 (not b!351929) (not d!71313) (not b!351995) (not bm!27032) (not bm!27024) (not bm!27029) (not bm!27025) (not bm!27008) (not b_next!7759) (not b!351982) b_and!14973 (not b!351926) (not b!352016) (not b_lambda!8495) (not b!351914) (not b!351925) (not b!352031) (not b!351993) (not b!351938) (not b!351908) (not d!71315) (not b!351981))
(check-sat b_and!14973 (not b_next!7759))
