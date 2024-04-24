; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3844 () Bool)

(assert start!3844)

(declare-fun b_free!787 () Bool)

(declare-fun b_next!787 () Bool)

(assert (=> start!3844 (= b_free!787 (not b_next!787))))

(declare-fun tp!3775 () Bool)

(declare-fun b_and!1583 () Bool)

(assert (=> start!3844 (= tp!3775 b_and!1583)))

(declare-fun b!26915 () Bool)

(declare-fun e!17547 () Bool)

(declare-fun tp_is_empty!1141 () Bool)

(assert (=> b!26915 (= e!17547 tp_is_empty!1141)))

(declare-fun b!26916 () Bool)

(declare-fun e!17550 () Bool)

(declare-fun e!17549 () Bool)

(declare-fun mapRes!1234 () Bool)

(assert (=> b!26916 (= e!17550 (and e!17549 mapRes!1234))))

(declare-fun condMapEmpty!1234 () Bool)

(declare-datatypes ((V!1347 0))(
  ( (V!1348 (val!597 Int)) )
))
(declare-datatypes ((ValueCell!371 0))(
  ( (ValueCellFull!371 (v!1684 V!1347)) (EmptyCell!371) )
))
(declare-datatypes ((array!1505 0))(
  ( (array!1506 (arr!708 (Array (_ BitVec 32) ValueCell!371)) (size!809 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1505)

(declare-fun mapDefault!1234 () ValueCell!371)

(assert (=> b!26916 (= condMapEmpty!1234 (= (arr!708 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!371)) mapDefault!1234)))))

(declare-fun res!15954 () Bool)

(declare-fun e!17548 () Bool)

(assert (=> start!3844 (=> (not res!15954) (not e!17548))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3844 (= res!15954 (validMask!0 mask!2294))))

(assert (=> start!3844 e!17548))

(assert (=> start!3844 true))

(assert (=> start!3844 tp!3775))

(declare-fun array_inv!495 (array!1505) Bool)

(assert (=> start!3844 (and (array_inv!495 _values!1501) e!17550)))

(declare-datatypes ((array!1507 0))(
  ( (array!1508 (arr!709 (Array (_ BitVec 32) (_ BitVec 64))) (size!810 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1507)

(declare-fun array_inv!496 (array!1507) Bool)

(assert (=> start!3844 (array_inv!496 _keys!1833)))

(assert (=> start!3844 tp_is_empty!1141))

(declare-fun b!26917 () Bool)

(declare-fun res!15955 () Bool)

(assert (=> b!26917 (=> (not res!15955) (not e!17548))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!26917 (= res!15955 (validKeyInArray!0 k0!1304))))

(declare-fun b!26918 () Bool)

(assert (=> b!26918 (= e!17549 tp_is_empty!1141)))

(declare-fun mapNonEmpty!1234 () Bool)

(declare-fun tp!3774 () Bool)

(assert (=> mapNonEmpty!1234 (= mapRes!1234 (and tp!3774 e!17547))))

(declare-fun mapRest!1234 () (Array (_ BitVec 32) ValueCell!371))

(declare-fun mapKey!1234 () (_ BitVec 32))

(declare-fun mapValue!1234 () ValueCell!371)

(assert (=> mapNonEmpty!1234 (= (arr!708 _values!1501) (store mapRest!1234 mapKey!1234 mapValue!1234))))

(declare-fun b!26919 () Bool)

(declare-fun res!15952 () Bool)

(assert (=> b!26919 (=> (not res!15952) (not e!17548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1507 (_ BitVec 32)) Bool)

(assert (=> b!26919 (= res!15952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26920 () Bool)

(declare-fun res!15956 () Bool)

(assert (=> b!26920 (=> (not res!15956) (not e!17548))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26920 (= res!15956 (and (= (size!809 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!810 _keys!1833) (size!809 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26921 () Bool)

(declare-fun res!15953 () Bool)

(assert (=> b!26921 (=> (not res!15953) (not e!17548))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1347)

(declare-fun minValue!1443 () V!1347)

(declare-datatypes ((tuple2!1008 0))(
  ( (tuple2!1009 (_1!515 (_ BitVec 64)) (_2!515 V!1347)) )
))
(declare-datatypes ((List!600 0))(
  ( (Nil!597) (Cons!596 (h!1163 tuple2!1008) (t!3283 List!600)) )
))
(declare-datatypes ((ListLongMap!579 0))(
  ( (ListLongMap!580 (toList!305 List!600)) )
))
(declare-fun contains!245 (ListLongMap!579 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!135 (array!1507 array!1505 (_ BitVec 32) (_ BitVec 32) V!1347 V!1347 (_ BitVec 32) Int) ListLongMap!579)

(assert (=> b!26921 (= res!15953 (not (contains!245 (getCurrentListMap!135 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!26922 () Bool)

(assert (=> b!26922 (= e!17548 (and (bvslt #b00000000000000000000000000000000 (size!810 _keys!1833)) (bvsge (size!810 _keys!1833) #b01111111111111111111111111111111)))))

(declare-fun b!26923 () Bool)

(declare-fun res!15951 () Bool)

(assert (=> b!26923 (=> (not res!15951) (not e!17548))))

(declare-datatypes ((List!601 0))(
  ( (Nil!598) (Cons!597 (h!1164 (_ BitVec 64)) (t!3284 List!601)) )
))
(declare-fun arrayNoDuplicates!0 (array!1507 (_ BitVec 32) List!601) Bool)

(assert (=> b!26923 (= res!15951 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!598))))

(declare-fun mapIsEmpty!1234 () Bool)

(assert (=> mapIsEmpty!1234 mapRes!1234))

(assert (= (and start!3844 res!15954) b!26920))

(assert (= (and b!26920 res!15956) b!26919))

(assert (= (and b!26919 res!15952) b!26923))

(assert (= (and b!26923 res!15951) b!26917))

(assert (= (and b!26917 res!15955) b!26921))

(assert (= (and b!26921 res!15953) b!26922))

(assert (= (and b!26916 condMapEmpty!1234) mapIsEmpty!1234))

(assert (= (and b!26916 (not condMapEmpty!1234)) mapNonEmpty!1234))

(get-info :version)

(assert (= (and mapNonEmpty!1234 ((_ is ValueCellFull!371) mapValue!1234)) b!26915))

(assert (= (and b!26916 ((_ is ValueCellFull!371) mapDefault!1234)) b!26918))

(assert (= start!3844 b!26916))

(declare-fun m!21425 () Bool)

(assert (=> b!26923 m!21425))

(declare-fun m!21427 () Bool)

(assert (=> b!26919 m!21427))

(declare-fun m!21429 () Bool)

(assert (=> mapNonEmpty!1234 m!21429))

(declare-fun m!21431 () Bool)

(assert (=> start!3844 m!21431))

(declare-fun m!21433 () Bool)

(assert (=> start!3844 m!21433))

(declare-fun m!21435 () Bool)

(assert (=> start!3844 m!21435))

(declare-fun m!21437 () Bool)

(assert (=> b!26917 m!21437))

(declare-fun m!21439 () Bool)

(assert (=> b!26921 m!21439))

(assert (=> b!26921 m!21439))

(declare-fun m!21441 () Bool)

(assert (=> b!26921 m!21441))

(check-sat (not b!26919) (not b_next!787) (not b!26917) (not mapNonEmpty!1234) (not b!26921) (not b!26923) (not start!3844) b_and!1583 tp_is_empty!1141)
(check-sat b_and!1583 (not b_next!787))
(get-model)

(declare-fun d!4893 () Bool)

(assert (=> d!4893 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3844 d!4893))

(declare-fun d!4895 () Bool)

(assert (=> d!4895 (= (array_inv!495 _values!1501) (bvsge (size!809 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3844 d!4895))

(declare-fun d!4897 () Bool)

(assert (=> d!4897 (= (array_inv!496 _keys!1833) (bvsge (size!810 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3844 d!4897))

(declare-fun b!26988 () Bool)

(declare-fun e!17590 () Bool)

(declare-fun call!2523 () Bool)

(assert (=> b!26988 (= e!17590 call!2523)))

(declare-fun d!4899 () Bool)

(declare-fun res!16001 () Bool)

(declare-fun e!17592 () Bool)

(assert (=> d!4899 (=> res!16001 e!17592)))

(assert (=> d!4899 (= res!16001 (bvsge #b00000000000000000000000000000000 (size!810 _keys!1833)))))

(assert (=> d!4899 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!598) e!17592)))

(declare-fun b!26989 () Bool)

(assert (=> b!26989 (= e!17590 call!2523)))

(declare-fun b!26990 () Bool)

(declare-fun e!17593 () Bool)

(assert (=> b!26990 (= e!17593 e!17590)))

(declare-fun c!3670 () Bool)

(assert (=> b!26990 (= c!3670 (validKeyInArray!0 (select (arr!709 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2520 () Bool)

(assert (=> bm!2520 (= call!2523 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3670 (Cons!597 (select (arr!709 _keys!1833) #b00000000000000000000000000000000) Nil!598) Nil!598)))))

(declare-fun b!26991 () Bool)

(declare-fun e!17591 () Bool)

(declare-fun contains!246 (List!601 (_ BitVec 64)) Bool)

(assert (=> b!26991 (= e!17591 (contains!246 Nil!598 (select (arr!709 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!26992 () Bool)

(assert (=> b!26992 (= e!17592 e!17593)))

(declare-fun res!15999 () Bool)

(assert (=> b!26992 (=> (not res!15999) (not e!17593))))

(assert (=> b!26992 (= res!15999 (not e!17591))))

(declare-fun res!16000 () Bool)

(assert (=> b!26992 (=> (not res!16000) (not e!17591))))

(assert (=> b!26992 (= res!16000 (validKeyInArray!0 (select (arr!709 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!4899 (not res!16001)) b!26992))

(assert (= (and b!26992 res!16000) b!26991))

(assert (= (and b!26992 res!15999) b!26990))

(assert (= (and b!26990 c!3670) b!26989))

(assert (= (and b!26990 (not c!3670)) b!26988))

(assert (= (or b!26989 b!26988) bm!2520))

(declare-fun m!21479 () Bool)

(assert (=> b!26990 m!21479))

(assert (=> b!26990 m!21479))

(declare-fun m!21481 () Bool)

(assert (=> b!26990 m!21481))

(assert (=> bm!2520 m!21479))

(declare-fun m!21483 () Bool)

(assert (=> bm!2520 m!21483))

(assert (=> b!26991 m!21479))

(assert (=> b!26991 m!21479))

(declare-fun m!21485 () Bool)

(assert (=> b!26991 m!21485))

(assert (=> b!26992 m!21479))

(assert (=> b!26992 m!21479))

(assert (=> b!26992 m!21481))

(assert (=> b!26923 d!4899))

(declare-fun b!27001 () Bool)

(declare-fun e!17602 () Bool)

(declare-fun e!17601 () Bool)

(assert (=> b!27001 (= e!17602 e!17601)))

(declare-fun lt!10461 () (_ BitVec 64))

(assert (=> b!27001 (= lt!10461 (select (arr!709 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!639 0))(
  ( (Unit!640) )
))
(declare-fun lt!10459 () Unit!639)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1507 (_ BitVec 64) (_ BitVec 32)) Unit!639)

(assert (=> b!27001 (= lt!10459 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!10461 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27001 (arrayContainsKey!0 _keys!1833 lt!10461 #b00000000000000000000000000000000)))

(declare-fun lt!10460 () Unit!639)

(assert (=> b!27001 (= lt!10460 lt!10459)))

(declare-fun res!16007 () Bool)

(declare-datatypes ((SeekEntryResult!63 0))(
  ( (MissingZero!63 (index!2374 (_ BitVec 32))) (Found!63 (index!2375 (_ BitVec 32))) (Intermediate!63 (undefined!875 Bool) (index!2376 (_ BitVec 32)) (x!6195 (_ BitVec 32))) (Undefined!63) (MissingVacant!63 (index!2377 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1507 (_ BitVec 32)) SeekEntryResult!63)

(assert (=> b!27001 (= res!16007 (= (seekEntryOrOpen!0 (select (arr!709 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!63 #b00000000000000000000000000000000)))))

(assert (=> b!27001 (=> (not res!16007) (not e!17601))))

(declare-fun b!27002 () Bool)

(declare-fun e!17600 () Bool)

(assert (=> b!27002 (= e!17600 e!17602)))

(declare-fun c!3673 () Bool)

(assert (=> b!27002 (= c!3673 (validKeyInArray!0 (select (arr!709 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!27003 () Bool)

(declare-fun call!2526 () Bool)

(assert (=> b!27003 (= e!17602 call!2526)))

(declare-fun d!4901 () Bool)

(declare-fun res!16006 () Bool)

(assert (=> d!4901 (=> res!16006 e!17600)))

(assert (=> d!4901 (= res!16006 (bvsge #b00000000000000000000000000000000 (size!810 _keys!1833)))))

(assert (=> d!4901 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!17600)))

(declare-fun b!27004 () Bool)

(assert (=> b!27004 (= e!17601 call!2526)))

(declare-fun bm!2523 () Bool)

(assert (=> bm!2523 (= call!2526 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(assert (= (and d!4901 (not res!16006)) b!27002))

(assert (= (and b!27002 c!3673) b!27001))

(assert (= (and b!27002 (not c!3673)) b!27003))

(assert (= (and b!27001 res!16007) b!27004))

(assert (= (or b!27004 b!27003) bm!2523))

(assert (=> b!27001 m!21479))

(declare-fun m!21487 () Bool)

(assert (=> b!27001 m!21487))

(declare-fun m!21489 () Bool)

(assert (=> b!27001 m!21489))

(assert (=> b!27001 m!21479))

(declare-fun m!21491 () Bool)

(assert (=> b!27001 m!21491))

(assert (=> b!27002 m!21479))

(assert (=> b!27002 m!21479))

(assert (=> b!27002 m!21481))

(declare-fun m!21493 () Bool)

(assert (=> bm!2523 m!21493))

(assert (=> b!26919 d!4901))

(declare-fun d!4903 () Bool)

(assert (=> d!4903 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!26917 d!4903))

(declare-fun d!4905 () Bool)

(declare-fun e!17607 () Bool)

(assert (=> d!4905 e!17607))

(declare-fun res!16010 () Bool)

(assert (=> d!4905 (=> res!16010 e!17607)))

(declare-fun lt!10472 () Bool)

(assert (=> d!4905 (= res!16010 (not lt!10472))))

(declare-fun lt!10470 () Bool)

(assert (=> d!4905 (= lt!10472 lt!10470)))

(declare-fun lt!10473 () Unit!639)

(declare-fun e!17608 () Unit!639)

(assert (=> d!4905 (= lt!10473 e!17608)))

(declare-fun c!3676 () Bool)

(assert (=> d!4905 (= c!3676 lt!10470)))

(declare-fun containsKey!27 (List!600 (_ BitVec 64)) Bool)

(assert (=> d!4905 (= lt!10470 (containsKey!27 (toList!305 (getCurrentListMap!135 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (=> d!4905 (= (contains!245 (getCurrentListMap!135 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304) lt!10472)))

(declare-fun b!27011 () Bool)

(declare-fun lt!10471 () Unit!639)

(assert (=> b!27011 (= e!17608 lt!10471)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!24 (List!600 (_ BitVec 64)) Unit!639)

(assert (=> b!27011 (= lt!10471 (lemmaContainsKeyImpliesGetValueByKeyDefined!24 (toList!305 (getCurrentListMap!135 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-datatypes ((Option!69 0))(
  ( (Some!68 (v!1687 V!1347)) (None!67) )
))
(declare-fun isDefined!25 (Option!69) Bool)

(declare-fun getValueByKey!63 (List!600 (_ BitVec 64)) Option!69)

(assert (=> b!27011 (isDefined!25 (getValueByKey!63 (toList!305 (getCurrentListMap!135 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun b!27012 () Bool)

(declare-fun Unit!641 () Unit!639)

(assert (=> b!27012 (= e!17608 Unit!641)))

(declare-fun b!27013 () Bool)

(assert (=> b!27013 (= e!17607 (isDefined!25 (getValueByKey!63 (toList!305 (getCurrentListMap!135 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)))))

(assert (= (and d!4905 c!3676) b!27011))

(assert (= (and d!4905 (not c!3676)) b!27012))

(assert (= (and d!4905 (not res!16010)) b!27013))

(declare-fun m!21495 () Bool)

(assert (=> d!4905 m!21495))

(declare-fun m!21497 () Bool)

(assert (=> b!27011 m!21497))

(declare-fun m!21499 () Bool)

(assert (=> b!27011 m!21499))

(assert (=> b!27011 m!21499))

(declare-fun m!21501 () Bool)

(assert (=> b!27011 m!21501))

(assert (=> b!27013 m!21499))

(assert (=> b!27013 m!21499))

(assert (=> b!27013 m!21501))

(assert (=> b!26921 d!4905))

(declare-fun b!27056 () Bool)

(declare-fun e!17645 () Bool)

(declare-fun e!17642 () Bool)

(assert (=> b!27056 (= e!17645 e!17642)))

(declare-fun res!16030 () Bool)

(declare-fun call!2546 () Bool)

(assert (=> b!27056 (= res!16030 call!2546)))

(assert (=> b!27056 (=> (not res!16030) (not e!17642))))

(declare-fun b!27057 () Bool)

(declare-fun res!16035 () Bool)

(declare-fun e!17643 () Bool)

(assert (=> b!27057 (=> (not res!16035) (not e!17643))))

(declare-fun e!17638 () Bool)

(assert (=> b!27057 (= res!16035 e!17638)))

(declare-fun res!16033 () Bool)

(assert (=> b!27057 (=> res!16033 e!17638)))

(declare-fun e!17646 () Bool)

(assert (=> b!27057 (= res!16033 (not e!17646))))

(declare-fun res!16031 () Bool)

(assert (=> b!27057 (=> (not res!16031) (not e!17646))))

(assert (=> b!27057 (= res!16031 (bvslt #b00000000000000000000000000000000 (size!810 _keys!1833)))))

(declare-fun call!2544 () ListLongMap!579)

(declare-fun bm!2538 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!18 (array!1507 array!1505 (_ BitVec 32) (_ BitVec 32) V!1347 V!1347 (_ BitVec 32) Int) ListLongMap!579)

(assert (=> bm!2538 (= call!2544 (getCurrentListMapNoExtraKeys!18 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!27058 () Bool)

(declare-fun e!17641 () Unit!639)

(declare-fun lt!10518 () Unit!639)

(assert (=> b!27058 (= e!17641 lt!10518)))

(declare-fun lt!10528 () ListLongMap!579)

(assert (=> b!27058 (= lt!10528 (getCurrentListMapNoExtraKeys!18 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10520 () (_ BitVec 64))

(assert (=> b!27058 (= lt!10520 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10532 () (_ BitVec 64))

(assert (=> b!27058 (= lt!10532 (select (arr!709 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10530 () Unit!639)

(declare-fun addStillContains!16 (ListLongMap!579 (_ BitVec 64) V!1347 (_ BitVec 64)) Unit!639)

(assert (=> b!27058 (= lt!10530 (addStillContains!16 lt!10528 lt!10520 zeroValue!1443 lt!10532))))

(declare-fun +!48 (ListLongMap!579 tuple2!1008) ListLongMap!579)

(assert (=> b!27058 (contains!245 (+!48 lt!10528 (tuple2!1009 lt!10520 zeroValue!1443)) lt!10532)))

(declare-fun lt!10538 () Unit!639)

(assert (=> b!27058 (= lt!10538 lt!10530)))

(declare-fun lt!10523 () ListLongMap!579)

(assert (=> b!27058 (= lt!10523 (getCurrentListMapNoExtraKeys!18 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10521 () (_ BitVec 64))

(assert (=> b!27058 (= lt!10521 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10525 () (_ BitVec 64))

(assert (=> b!27058 (= lt!10525 (select (arr!709 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10534 () Unit!639)

(declare-fun addApplyDifferent!16 (ListLongMap!579 (_ BitVec 64) V!1347 (_ BitVec 64)) Unit!639)

(assert (=> b!27058 (= lt!10534 (addApplyDifferent!16 lt!10523 lt!10521 minValue!1443 lt!10525))))

(declare-fun apply!31 (ListLongMap!579 (_ BitVec 64)) V!1347)

(assert (=> b!27058 (= (apply!31 (+!48 lt!10523 (tuple2!1009 lt!10521 minValue!1443)) lt!10525) (apply!31 lt!10523 lt!10525))))

(declare-fun lt!10522 () Unit!639)

(assert (=> b!27058 (= lt!10522 lt!10534)))

(declare-fun lt!10524 () ListLongMap!579)

(assert (=> b!27058 (= lt!10524 (getCurrentListMapNoExtraKeys!18 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10539 () (_ BitVec 64))

(assert (=> b!27058 (= lt!10539 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10537 () (_ BitVec 64))

(assert (=> b!27058 (= lt!10537 (select (arr!709 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!10519 () Unit!639)

(assert (=> b!27058 (= lt!10519 (addApplyDifferent!16 lt!10524 lt!10539 zeroValue!1443 lt!10537))))

(assert (=> b!27058 (= (apply!31 (+!48 lt!10524 (tuple2!1009 lt!10539 zeroValue!1443)) lt!10537) (apply!31 lt!10524 lt!10537))))

(declare-fun lt!10533 () Unit!639)

(assert (=> b!27058 (= lt!10533 lt!10519)))

(declare-fun lt!10529 () ListLongMap!579)

(assert (=> b!27058 (= lt!10529 (getCurrentListMapNoExtraKeys!18 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!10535 () (_ BitVec 64))

(assert (=> b!27058 (= lt!10535 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!10531 () (_ BitVec 64))

(assert (=> b!27058 (= lt!10531 (select (arr!709 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!27058 (= lt!10518 (addApplyDifferent!16 lt!10529 lt!10535 minValue!1443 lt!10531))))

(assert (=> b!27058 (= (apply!31 (+!48 lt!10529 (tuple2!1009 lt!10535 minValue!1443)) lt!10531) (apply!31 lt!10529 lt!10531))))

(declare-fun b!27059 () Bool)

(assert (=> b!27059 (= e!17646 (validKeyInArray!0 (select (arr!709 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!4907 () Bool)

(assert (=> d!4907 e!17643))

(declare-fun res!16034 () Bool)

(assert (=> d!4907 (=> (not res!16034) (not e!17643))))

(assert (=> d!4907 (= res!16034 (or (bvsge #b00000000000000000000000000000000 (size!810 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!810 _keys!1833)))))))

(declare-fun lt!10536 () ListLongMap!579)

(declare-fun lt!10527 () ListLongMap!579)

(assert (=> d!4907 (= lt!10536 lt!10527)))

(declare-fun lt!10526 () Unit!639)

(assert (=> d!4907 (= lt!10526 e!17641)))

(declare-fun c!3690 () Bool)

(declare-fun e!17639 () Bool)

(assert (=> d!4907 (= c!3690 e!17639)))

(declare-fun res!16037 () Bool)

(assert (=> d!4907 (=> (not res!16037) (not e!17639))))

(assert (=> d!4907 (= res!16037 (bvslt #b00000000000000000000000000000000 (size!810 _keys!1833)))))

(declare-fun e!17635 () ListLongMap!579)

(assert (=> d!4907 (= lt!10527 e!17635)))

(declare-fun c!3693 () Bool)

(assert (=> d!4907 (= c!3693 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!4907 (validMask!0 mask!2294)))

(assert (=> d!4907 (= (getCurrentListMap!135 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!10536)))

(declare-fun b!27060 () Bool)

(declare-fun e!17637 () ListLongMap!579)

(assert (=> b!27060 (= e!17635 e!17637)))

(declare-fun c!3694 () Bool)

(assert (=> b!27060 (= c!3694 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!27061 () Bool)

(declare-fun Unit!642 () Unit!639)

(assert (=> b!27061 (= e!17641 Unit!642)))

(declare-fun b!27062 () Bool)

(declare-fun e!17644 () Bool)

(declare-fun call!2542 () Bool)

(assert (=> b!27062 (= e!17644 (not call!2542))))

(declare-fun bm!2539 () Bool)

(assert (=> bm!2539 (= call!2546 (contains!245 lt!10536 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2540 () Bool)

(assert (=> bm!2540 (= call!2542 (contains!245 lt!10536 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!27063 () Bool)

(declare-fun res!16029 () Bool)

(assert (=> b!27063 (=> (not res!16029) (not e!17643))))

(assert (=> b!27063 (= res!16029 e!17645)))

(declare-fun c!3692 () Bool)

(assert (=> b!27063 (= c!3692 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!27064 () Bool)

(declare-fun e!17640 () Bool)

(assert (=> b!27064 (= e!17640 (= (apply!31 lt!10536 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun b!27065 () Bool)

(declare-fun e!17636 () ListLongMap!579)

(declare-fun call!2545 () ListLongMap!579)

(assert (=> b!27065 (= e!17636 call!2545)))

(declare-fun b!27066 () Bool)

(assert (=> b!27066 (= e!17642 (= (apply!31 lt!10536 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!27067 () Bool)

(assert (=> b!27067 (= e!17643 e!17644)))

(declare-fun c!3691 () Bool)

(assert (=> b!27067 (= c!3691 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!27068 () Bool)

(assert (=> b!27068 (= e!17639 (validKeyInArray!0 (select (arr!709 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun e!17647 () Bool)

(declare-fun b!27069 () Bool)

(declare-fun get!436 (ValueCell!371 V!1347) V!1347)

(declare-fun dynLambda!144 (Int (_ BitVec 64)) V!1347)

(assert (=> b!27069 (= e!17647 (= (apply!31 lt!10536 (select (arr!709 _keys!1833) #b00000000000000000000000000000000)) (get!436 (select (arr!708 _values!1501) #b00000000000000000000000000000000) (dynLambda!144 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!27069 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!809 _values!1501)))))

(assert (=> b!27069 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!810 _keys!1833)))))

(declare-fun call!2547 () ListLongMap!579)

(declare-fun call!2543 () ListLongMap!579)

(declare-fun bm!2541 () Bool)

(declare-fun call!2541 () ListLongMap!579)

(assert (=> bm!2541 (= call!2541 (+!48 (ite c!3693 call!2544 (ite c!3694 call!2543 call!2547)) (ite (or c!3693 c!3694) (tuple2!1009 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1009 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun bm!2542 () Bool)

(assert (=> bm!2542 (= call!2545 call!2541)))

(declare-fun b!27070 () Bool)

(assert (=> b!27070 (= e!17637 call!2545)))

(declare-fun b!27071 () Bool)

(declare-fun c!3689 () Bool)

(assert (=> b!27071 (= c!3689 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!27071 (= e!17637 e!17636)))

(declare-fun bm!2543 () Bool)

(assert (=> bm!2543 (= call!2547 call!2543)))

(declare-fun b!27072 () Bool)

(assert (=> b!27072 (= e!17635 (+!48 call!2541 (tuple2!1009 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!27073 () Bool)

(assert (=> b!27073 (= e!17638 e!17647)))

(declare-fun res!16036 () Bool)

(assert (=> b!27073 (=> (not res!16036) (not e!17647))))

(assert (=> b!27073 (= res!16036 (contains!245 lt!10536 (select (arr!709 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!27073 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!810 _keys!1833)))))

(declare-fun bm!2544 () Bool)

(assert (=> bm!2544 (= call!2543 call!2544)))

(declare-fun b!27074 () Bool)

(assert (=> b!27074 (= e!17636 call!2547)))

(declare-fun b!27075 () Bool)

(assert (=> b!27075 (= e!17645 (not call!2546))))

(declare-fun b!27076 () Bool)

(assert (=> b!27076 (= e!17644 e!17640)))

(declare-fun res!16032 () Bool)

(assert (=> b!27076 (= res!16032 call!2542)))

(assert (=> b!27076 (=> (not res!16032) (not e!17640))))

(assert (= (and d!4907 c!3693) b!27072))

(assert (= (and d!4907 (not c!3693)) b!27060))

(assert (= (and b!27060 c!3694) b!27070))

(assert (= (and b!27060 (not c!3694)) b!27071))

(assert (= (and b!27071 c!3689) b!27065))

(assert (= (and b!27071 (not c!3689)) b!27074))

(assert (= (or b!27065 b!27074) bm!2543))

(assert (= (or b!27070 bm!2543) bm!2544))

(assert (= (or b!27070 b!27065) bm!2542))

(assert (= (or b!27072 bm!2544) bm!2538))

(assert (= (or b!27072 bm!2542) bm!2541))

(assert (= (and d!4907 res!16037) b!27068))

(assert (= (and d!4907 c!3690) b!27058))

(assert (= (and d!4907 (not c!3690)) b!27061))

(assert (= (and d!4907 res!16034) b!27057))

(assert (= (and b!27057 res!16031) b!27059))

(assert (= (and b!27057 (not res!16033)) b!27073))

(assert (= (and b!27073 res!16036) b!27069))

(assert (= (and b!27057 res!16035) b!27063))

(assert (= (and b!27063 c!3692) b!27056))

(assert (= (and b!27063 (not c!3692)) b!27075))

(assert (= (and b!27056 res!16030) b!27066))

(assert (= (or b!27056 b!27075) bm!2539))

(assert (= (and b!27063 res!16029) b!27067))

(assert (= (and b!27067 c!3691) b!27076))

(assert (= (and b!27067 (not c!3691)) b!27062))

(assert (= (and b!27076 res!16032) b!27064))

(assert (= (or b!27076 b!27062) bm!2540))

(declare-fun b_lambda!1671 () Bool)

(assert (=> (not b_lambda!1671) (not b!27069)))

(declare-fun t!3286 () Bool)

(declare-fun tb!671 () Bool)

(assert (=> (and start!3844 (= defaultEntry!1504 defaultEntry!1504) t!3286) tb!671))

(declare-fun result!1135 () Bool)

(assert (=> tb!671 (= result!1135 tp_is_empty!1141)))

(assert (=> b!27069 t!3286))

(declare-fun b_and!1589 () Bool)

(assert (= b_and!1583 (and (=> t!3286 result!1135) b_and!1589)))

(declare-fun m!21503 () Bool)

(assert (=> b!27058 m!21503))

(declare-fun m!21505 () Bool)

(assert (=> b!27058 m!21505))

(declare-fun m!21507 () Bool)

(assert (=> b!27058 m!21507))

(declare-fun m!21509 () Bool)

(assert (=> b!27058 m!21509))

(assert (=> b!27058 m!21509))

(declare-fun m!21511 () Bool)

(assert (=> b!27058 m!21511))

(declare-fun m!21513 () Bool)

(assert (=> b!27058 m!21513))

(declare-fun m!21515 () Bool)

(assert (=> b!27058 m!21515))

(declare-fun m!21517 () Bool)

(assert (=> b!27058 m!21517))

(declare-fun m!21519 () Bool)

(assert (=> b!27058 m!21519))

(declare-fun m!21521 () Bool)

(assert (=> b!27058 m!21521))

(assert (=> b!27058 m!21479))

(declare-fun m!21523 () Bool)

(assert (=> b!27058 m!21523))

(declare-fun m!21525 () Bool)

(assert (=> b!27058 m!21525))

(assert (=> b!27058 m!21513))

(declare-fun m!21527 () Bool)

(assert (=> b!27058 m!21527))

(assert (=> b!27058 m!21507))

(declare-fun m!21529 () Bool)

(assert (=> b!27058 m!21529))

(declare-fun m!21531 () Bool)

(assert (=> b!27058 m!21531))

(declare-fun m!21533 () Bool)

(assert (=> b!27058 m!21533))

(assert (=> b!27058 m!21517))

(declare-fun m!21535 () Bool)

(assert (=> b!27069 m!21535))

(assert (=> b!27069 m!21535))

(declare-fun m!21537 () Bool)

(assert (=> b!27069 m!21537))

(declare-fun m!21539 () Bool)

(assert (=> b!27069 m!21539))

(assert (=> b!27069 m!21479))

(assert (=> b!27069 m!21479))

(declare-fun m!21541 () Bool)

(assert (=> b!27069 m!21541))

(assert (=> b!27069 m!21537))

(declare-fun m!21543 () Bool)

(assert (=> bm!2540 m!21543))

(assert (=> b!27068 m!21479))

(assert (=> b!27068 m!21479))

(assert (=> b!27068 m!21481))

(assert (=> d!4907 m!21431))

(assert (=> b!27073 m!21479))

(assert (=> b!27073 m!21479))

(declare-fun m!21545 () Bool)

(assert (=> b!27073 m!21545))

(declare-fun m!21547 () Bool)

(assert (=> b!27066 m!21547))

(assert (=> bm!2538 m!21531))

(declare-fun m!21549 () Bool)

(assert (=> bm!2539 m!21549))

(declare-fun m!21551 () Bool)

(assert (=> bm!2541 m!21551))

(declare-fun m!21553 () Bool)

(assert (=> b!27064 m!21553))

(declare-fun m!21555 () Bool)

(assert (=> b!27072 m!21555))

(assert (=> b!27059 m!21479))

(assert (=> b!27059 m!21479))

(assert (=> b!27059 m!21481))

(assert (=> b!26921 d!4907))

(declare-fun condMapEmpty!1243 () Bool)

(declare-fun mapDefault!1243 () ValueCell!371)

(assert (=> mapNonEmpty!1234 (= condMapEmpty!1243 (= mapRest!1234 ((as const (Array (_ BitVec 32) ValueCell!371)) mapDefault!1243)))))

(declare-fun e!17653 () Bool)

(declare-fun mapRes!1243 () Bool)

(assert (=> mapNonEmpty!1234 (= tp!3774 (and e!17653 mapRes!1243))))

(declare-fun mapNonEmpty!1243 () Bool)

(declare-fun tp!3790 () Bool)

(declare-fun e!17652 () Bool)

(assert (=> mapNonEmpty!1243 (= mapRes!1243 (and tp!3790 e!17652))))

(declare-fun mapKey!1243 () (_ BitVec 32))

(declare-fun mapRest!1243 () (Array (_ BitVec 32) ValueCell!371))

(declare-fun mapValue!1243 () ValueCell!371)

(assert (=> mapNonEmpty!1243 (= mapRest!1234 (store mapRest!1243 mapKey!1243 mapValue!1243))))

(declare-fun b!27085 () Bool)

(assert (=> b!27085 (= e!17652 tp_is_empty!1141)))

(declare-fun b!27086 () Bool)

(assert (=> b!27086 (= e!17653 tp_is_empty!1141)))

(declare-fun mapIsEmpty!1243 () Bool)

(assert (=> mapIsEmpty!1243 mapRes!1243))

(assert (= (and mapNonEmpty!1234 condMapEmpty!1243) mapIsEmpty!1243))

(assert (= (and mapNonEmpty!1234 (not condMapEmpty!1243)) mapNonEmpty!1243))

(assert (= (and mapNonEmpty!1243 ((_ is ValueCellFull!371) mapValue!1243)) b!27085))

(assert (= (and mapNonEmpty!1234 ((_ is ValueCellFull!371) mapDefault!1243)) b!27086))

(declare-fun m!21557 () Bool)

(assert (=> mapNonEmpty!1243 m!21557))

(declare-fun b_lambda!1673 () Bool)

(assert (= b_lambda!1671 (or (and start!3844 b_free!787) b_lambda!1673)))

(check-sat (not b!27058) (not b_next!787) (not b!27069) (not b!27066) (not b!27002) (not b!27073) (not b!27011) (not bm!2539) (not d!4907) (not b!27059) (not d!4905) (not b!26990) b_and!1589 (not bm!2540) (not b!26991) (not bm!2538) (not bm!2541) (not b!26992) (not b!27001) (not b!27072) (not b!27013) (not bm!2523) (not b_lambda!1673) (not mapNonEmpty!1243) (not bm!2520) (not b!27064) (not b!27068) tp_is_empty!1141)
(check-sat b_and!1589 (not b_next!787))
