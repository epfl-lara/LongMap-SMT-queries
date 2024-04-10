; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4246 () Bool)

(assert start!4246)

(declare-fun b_free!1131 () Bool)

(declare-fun b_next!1131 () Bool)

(assert (=> start!4246 (= b_free!1131 (not b_next!1131))))

(declare-fun tp!4815 () Bool)

(declare-fun b_and!1943 () Bool)

(assert (=> start!4246 (= tp!4815 b_and!1943)))

(declare-fun b!32463 () Bool)

(declare-fun e!20634 () Bool)

(declare-fun e!20636 () Bool)

(declare-fun mapRes!1759 () Bool)

(assert (=> b!32463 (= e!20634 (and e!20636 mapRes!1759))))

(declare-fun condMapEmpty!1759 () Bool)

(declare-datatypes ((V!1805 0))(
  ( (V!1806 (val!769 Int)) )
))
(declare-datatypes ((ValueCell!543 0))(
  ( (ValueCellFull!543 (v!1859 V!1805)) (EmptyCell!543) )
))
(declare-datatypes ((array!2181 0))(
  ( (array!2182 (arr!1043 (Array (_ BitVec 32) ValueCell!543)) (size!1144 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2181)

(declare-fun mapDefault!1759 () ValueCell!543)

(assert (=> b!32463 (= condMapEmpty!1759 (= (arr!1043 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!543)) mapDefault!1759)))))

(declare-fun b!32464 () Bool)

(declare-fun res!19727 () Bool)

(declare-fun e!20635 () Bool)

(assert (=> b!32464 (=> (not res!19727) (not e!20635))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32464 (= res!19727 (validKeyInArray!0 k0!1304))))

(declare-fun res!19728 () Bool)

(assert (=> start!4246 (=> (not res!19728) (not e!20635))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4246 (= res!19728 (validMask!0 mask!2294))))

(assert (=> start!4246 e!20635))

(assert (=> start!4246 true))

(assert (=> start!4246 tp!4815))

(declare-fun array_inv!729 (array!2181) Bool)

(assert (=> start!4246 (and (array_inv!729 _values!1501) e!20634)))

(declare-datatypes ((array!2183 0))(
  ( (array!2184 (arr!1044 (Array (_ BitVec 32) (_ BitVec 64))) (size!1145 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2183)

(declare-fun array_inv!730 (array!2183) Bool)

(assert (=> start!4246 (array_inv!730 _keys!1833)))

(declare-fun tp_is_empty!1485 () Bool)

(assert (=> start!4246 tp_is_empty!1485))

(declare-fun b!32465 () Bool)

(declare-fun e!20632 () Bool)

(declare-fun lt!11747 () (_ BitVec 32))

(assert (=> b!32465 (= e!20632 (not (validKeyInArray!0 (select (arr!1044 _keys!1833) lt!11747))))))

(declare-fun b!32466 () Bool)

(declare-fun res!19726 () Bool)

(assert (=> b!32466 (=> (not res!19726) (not e!20635))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1805)

(declare-fun minValue!1443 () V!1805)

(declare-datatypes ((tuple2!1248 0))(
  ( (tuple2!1249 (_1!635 (_ BitVec 64)) (_2!635 V!1805)) )
))
(declare-datatypes ((List!842 0))(
  ( (Nil!839) (Cons!838 (h!1405 tuple2!1248) (t!3537 List!842)) )
))
(declare-datatypes ((ListLongMap!825 0))(
  ( (ListLongMap!826 (toList!428 List!842)) )
))
(declare-fun contains!369 (ListLongMap!825 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!256 (array!2183 array!2181 (_ BitVec 32) (_ BitVec 32) V!1805 V!1805 (_ BitVec 32) Int) ListLongMap!825)

(assert (=> b!32466 (= res!19726 (not (contains!369 (getCurrentListMap!256 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!32467 () Bool)

(assert (=> b!32467 (= e!20636 tp_is_empty!1485)))

(declare-fun mapNonEmpty!1759 () Bool)

(declare-fun tp!4816 () Bool)

(declare-fun e!20633 () Bool)

(assert (=> mapNonEmpty!1759 (= mapRes!1759 (and tp!4816 e!20633))))

(declare-fun mapRest!1759 () (Array (_ BitVec 32) ValueCell!543))

(declare-fun mapValue!1759 () ValueCell!543)

(declare-fun mapKey!1759 () (_ BitVec 32))

(assert (=> mapNonEmpty!1759 (= (arr!1043 _values!1501) (store mapRest!1759 mapKey!1759 mapValue!1759))))

(declare-fun b!32468 () Bool)

(assert (=> b!32468 (= e!20635 e!20632)))

(declare-fun res!19721 () Bool)

(assert (=> b!32468 (=> (not res!19721) (not e!20632))))

(assert (=> b!32468 (= res!19721 (and (bvsge lt!11747 #b00000000000000000000000000000000) (bvslt lt!11747 (size!1145 _keys!1833))))))

(declare-fun arrayScanForKey!0 (array!2183 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32468 (= lt!11747 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32469 () Bool)

(declare-fun res!19723 () Bool)

(assert (=> b!32469 (=> (not res!19723) (not e!20635))))

(assert (=> b!32469 (= res!19723 (and (= (size!1144 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1145 _keys!1833) (size!1144 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!32470 () Bool)

(declare-fun res!19725 () Bool)

(assert (=> b!32470 (=> (not res!19725) (not e!20635))))

(declare-fun arrayContainsKey!0 (array!2183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32470 (= res!19725 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!1759 () Bool)

(assert (=> mapIsEmpty!1759 mapRes!1759))

(declare-fun b!32471 () Bool)

(assert (=> b!32471 (= e!20633 tp_is_empty!1485)))

(declare-fun b!32472 () Bool)

(declare-fun res!19722 () Bool)

(assert (=> b!32472 (=> (not res!19722) (not e!20635))))

(declare-datatypes ((List!843 0))(
  ( (Nil!840) (Cons!839 (h!1406 (_ BitVec 64)) (t!3538 List!843)) )
))
(declare-fun arrayNoDuplicates!0 (array!2183 (_ BitVec 32) List!843) Bool)

(assert (=> b!32472 (= res!19722 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!840))))

(declare-fun b!32473 () Bool)

(declare-fun res!19724 () Bool)

(assert (=> b!32473 (=> (not res!19724) (not e!20635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2183 (_ BitVec 32)) Bool)

(assert (=> b!32473 (= res!19724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(assert (= (and start!4246 res!19728) b!32469))

(assert (= (and b!32469 res!19723) b!32473))

(assert (= (and b!32473 res!19724) b!32472))

(assert (= (and b!32472 res!19722) b!32464))

(assert (= (and b!32464 res!19727) b!32466))

(assert (= (and b!32466 res!19726) b!32470))

(assert (= (and b!32470 res!19725) b!32468))

(assert (= (and b!32468 res!19721) b!32465))

(assert (= (and b!32463 condMapEmpty!1759) mapIsEmpty!1759))

(assert (= (and b!32463 (not condMapEmpty!1759)) mapNonEmpty!1759))

(get-info :version)

(assert (= (and mapNonEmpty!1759 ((_ is ValueCellFull!543) mapValue!1759)) b!32471))

(assert (= (and b!32463 ((_ is ValueCellFull!543) mapDefault!1759)) b!32467))

(assert (= start!4246 b!32463))

(declare-fun m!25967 () Bool)

(assert (=> b!32464 m!25967))

(declare-fun m!25969 () Bool)

(assert (=> mapNonEmpty!1759 m!25969))

(declare-fun m!25971 () Bool)

(assert (=> b!32465 m!25971))

(assert (=> b!32465 m!25971))

(declare-fun m!25973 () Bool)

(assert (=> b!32465 m!25973))

(declare-fun m!25975 () Bool)

(assert (=> b!32472 m!25975))

(declare-fun m!25977 () Bool)

(assert (=> b!32473 m!25977))

(declare-fun m!25979 () Bool)

(assert (=> b!32468 m!25979))

(declare-fun m!25981 () Bool)

(assert (=> b!32466 m!25981))

(assert (=> b!32466 m!25981))

(declare-fun m!25983 () Bool)

(assert (=> b!32466 m!25983))

(declare-fun m!25985 () Bool)

(assert (=> start!4246 m!25985))

(declare-fun m!25987 () Bool)

(assert (=> start!4246 m!25987))

(declare-fun m!25989 () Bool)

(assert (=> start!4246 m!25989))

(declare-fun m!25991 () Bool)

(assert (=> b!32470 m!25991))

(check-sat (not b!32468) (not b!32470) (not b!32464) (not b_next!1131) (not start!4246) (not b!32473) (not mapNonEmpty!1759) (not b!32472) b_and!1943 tp_is_empty!1485 (not b!32465) (not b!32466))
(check-sat b_and!1943 (not b_next!1131))
(get-model)

(declare-fun d!5097 () Bool)

(assert (=> d!5097 (= (validKeyInArray!0 (select (arr!1044 _keys!1833) lt!11747)) (and (not (= (select (arr!1044 _keys!1833) lt!11747) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1044 _keys!1833) lt!11747) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!32465 d!5097))

(declare-fun d!5099 () Bool)

(declare-fun res!19757 () Bool)

(declare-fun e!20659 () Bool)

(assert (=> d!5099 (=> res!19757 e!20659)))

(assert (=> d!5099 (= res!19757 (= (select (arr!1044 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5099 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!20659)))

(declare-fun b!32511 () Bool)

(declare-fun e!20660 () Bool)

(assert (=> b!32511 (= e!20659 e!20660)))

(declare-fun res!19758 () Bool)

(assert (=> b!32511 (=> (not res!19758) (not e!20660))))

(assert (=> b!32511 (= res!19758 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1145 _keys!1833)))))

(declare-fun b!32512 () Bool)

(assert (=> b!32512 (= e!20660 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5099 (not res!19757)) b!32511))

(assert (= (and b!32511 res!19758) b!32512))

(declare-fun m!26019 () Bool)

(assert (=> d!5099 m!26019))

(declare-fun m!26021 () Bool)

(assert (=> b!32512 m!26021))

(assert (=> b!32470 d!5099))

(declare-fun d!5101 () Bool)

(declare-fun lt!11753 () (_ BitVec 32))

(assert (=> d!5101 (and (or (bvslt lt!11753 #b00000000000000000000000000000000) (bvsge lt!11753 (size!1145 _keys!1833)) (and (bvsge lt!11753 #b00000000000000000000000000000000) (bvslt lt!11753 (size!1145 _keys!1833)))) (bvsge lt!11753 #b00000000000000000000000000000000) (bvslt lt!11753 (size!1145 _keys!1833)) (= (select (arr!1044 _keys!1833) lt!11753) k0!1304))))

(declare-fun e!20663 () (_ BitVec 32))

(assert (=> d!5101 (= lt!11753 e!20663)))

(declare-fun c!3770 () Bool)

(assert (=> d!5101 (= c!3770 (= (select (arr!1044 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5101 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1145 _keys!1833)) (bvslt (size!1145 _keys!1833) #b01111111111111111111111111111111))))

(assert (=> d!5101 (= (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) lt!11753)))

(declare-fun b!32517 () Bool)

(assert (=> b!32517 (= e!20663 #b00000000000000000000000000000000)))

(declare-fun b!32518 () Bool)

(assert (=> b!32518 (= e!20663 (arrayScanForKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5101 c!3770) b!32517))

(assert (= (and d!5101 (not c!3770)) b!32518))

(declare-fun m!26023 () Bool)

(assert (=> d!5101 m!26023))

(assert (=> d!5101 m!26019))

(declare-fun m!26025 () Bool)

(assert (=> b!32518 m!26025))

(assert (=> b!32468 d!5101))

(declare-fun bm!2615 () Bool)

(declare-fun call!2618 () Bool)

(declare-fun c!3773 () Bool)

(assert (=> bm!2615 (= call!2618 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3773 (Cons!839 (select (arr!1044 _keys!1833) #b00000000000000000000000000000000) Nil!840) Nil!840)))))

(declare-fun b!32529 () Bool)

(declare-fun e!20673 () Bool)

(declare-fun contains!371 (List!843 (_ BitVec 64)) Bool)

(assert (=> b!32529 (= e!20673 (contains!371 Nil!840 (select (arr!1044 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!32530 () Bool)

(declare-fun e!20672 () Bool)

(declare-fun e!20674 () Bool)

(assert (=> b!32530 (= e!20672 e!20674)))

(declare-fun res!19765 () Bool)

(assert (=> b!32530 (=> (not res!19765) (not e!20674))))

(assert (=> b!32530 (= res!19765 (not e!20673))))

(declare-fun res!19766 () Bool)

(assert (=> b!32530 (=> (not res!19766) (not e!20673))))

(assert (=> b!32530 (= res!19766 (validKeyInArray!0 (select (arr!1044 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!5103 () Bool)

(declare-fun res!19767 () Bool)

(assert (=> d!5103 (=> res!19767 e!20672)))

(assert (=> d!5103 (= res!19767 (bvsge #b00000000000000000000000000000000 (size!1145 _keys!1833)))))

(assert (=> d!5103 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!840) e!20672)))

(declare-fun b!32531 () Bool)

(declare-fun e!20675 () Bool)

(assert (=> b!32531 (= e!20674 e!20675)))

(assert (=> b!32531 (= c!3773 (validKeyInArray!0 (select (arr!1044 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!32532 () Bool)

(assert (=> b!32532 (= e!20675 call!2618)))

(declare-fun b!32533 () Bool)

(assert (=> b!32533 (= e!20675 call!2618)))

(assert (= (and d!5103 (not res!19767)) b!32530))

(assert (= (and b!32530 res!19766) b!32529))

(assert (= (and b!32530 res!19765) b!32531))

(assert (= (and b!32531 c!3773) b!32533))

(assert (= (and b!32531 (not c!3773)) b!32532))

(assert (= (or b!32533 b!32532) bm!2615))

(assert (=> bm!2615 m!26019))

(declare-fun m!26027 () Bool)

(assert (=> bm!2615 m!26027))

(assert (=> b!32529 m!26019))

(assert (=> b!32529 m!26019))

(declare-fun m!26029 () Bool)

(assert (=> b!32529 m!26029))

(assert (=> b!32530 m!26019))

(assert (=> b!32530 m!26019))

(declare-fun m!26031 () Bool)

(assert (=> b!32530 m!26031))

(assert (=> b!32531 m!26019))

(assert (=> b!32531 m!26019))

(assert (=> b!32531 m!26031))

(assert (=> b!32472 d!5103))

(declare-fun b!32542 () Bool)

(declare-fun e!20683 () Bool)

(declare-fun call!2621 () Bool)

(assert (=> b!32542 (= e!20683 call!2621)))

(declare-fun bm!2618 () Bool)

(assert (=> bm!2618 (= call!2621 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun d!5105 () Bool)

(declare-fun res!19773 () Bool)

(declare-fun e!20684 () Bool)

(assert (=> d!5105 (=> res!19773 e!20684)))

(assert (=> d!5105 (= res!19773 (bvsge #b00000000000000000000000000000000 (size!1145 _keys!1833)))))

(assert (=> d!5105 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!20684)))

(declare-fun b!32543 () Bool)

(declare-fun e!20682 () Bool)

(assert (=> b!32543 (= e!20684 e!20682)))

(declare-fun c!3776 () Bool)

(assert (=> b!32543 (= c!3776 (validKeyInArray!0 (select (arr!1044 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!32544 () Bool)

(assert (=> b!32544 (= e!20682 e!20683)))

(declare-fun lt!11760 () (_ BitVec 64))

(assert (=> b!32544 (= lt!11760 (select (arr!1044 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!703 0))(
  ( (Unit!704) )
))
(declare-fun lt!11761 () Unit!703)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2183 (_ BitVec 64) (_ BitVec 32)) Unit!703)

(assert (=> b!32544 (= lt!11761 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!11760 #b00000000000000000000000000000000))))

(assert (=> b!32544 (arrayContainsKey!0 _keys!1833 lt!11760 #b00000000000000000000000000000000)))

(declare-fun lt!11762 () Unit!703)

(assert (=> b!32544 (= lt!11762 lt!11761)))

(declare-fun res!19772 () Bool)

(declare-datatypes ((SeekEntryResult!123 0))(
  ( (MissingZero!123 (index!2614 (_ BitVec 32))) (Found!123 (index!2615 (_ BitVec 32))) (Intermediate!123 (undefined!935 Bool) (index!2616 (_ BitVec 32)) (x!6741 (_ BitVec 32))) (Undefined!123) (MissingVacant!123 (index!2617 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2183 (_ BitVec 32)) SeekEntryResult!123)

(assert (=> b!32544 (= res!19772 (= (seekEntryOrOpen!0 (select (arr!1044 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!123 #b00000000000000000000000000000000)))))

(assert (=> b!32544 (=> (not res!19772) (not e!20683))))

(declare-fun b!32545 () Bool)

(assert (=> b!32545 (= e!20682 call!2621)))

(assert (= (and d!5105 (not res!19773)) b!32543))

(assert (= (and b!32543 c!3776) b!32544))

(assert (= (and b!32543 (not c!3776)) b!32545))

(assert (= (and b!32544 res!19772) b!32542))

(assert (= (or b!32542 b!32545) bm!2618))

(declare-fun m!26033 () Bool)

(assert (=> bm!2618 m!26033))

(assert (=> b!32543 m!26019))

(assert (=> b!32543 m!26019))

(assert (=> b!32543 m!26031))

(assert (=> b!32544 m!26019))

(declare-fun m!26035 () Bool)

(assert (=> b!32544 m!26035))

(declare-fun m!26037 () Bool)

(assert (=> b!32544 m!26037))

(assert (=> b!32544 m!26019))

(declare-fun m!26039 () Bool)

(assert (=> b!32544 m!26039))

(assert (=> b!32473 d!5105))

(declare-fun d!5107 () Bool)

(assert (=> d!5107 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!32464 d!5107))

(declare-fun d!5109 () Bool)

(assert (=> d!5109 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4246 d!5109))

(declare-fun d!5111 () Bool)

(assert (=> d!5111 (= (array_inv!729 _values!1501) (bvsge (size!1144 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4246 d!5111))

(declare-fun d!5113 () Bool)

(assert (=> d!5113 (= (array_inv!730 _keys!1833) (bvsge (size!1145 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4246 d!5113))

(declare-fun d!5115 () Bool)

(declare-fun e!20689 () Bool)

(assert (=> d!5115 e!20689))

(declare-fun res!19776 () Bool)

(assert (=> d!5115 (=> res!19776 e!20689)))

(declare-fun lt!11772 () Bool)

(assert (=> d!5115 (= res!19776 (not lt!11772))))

(declare-fun lt!11774 () Bool)

(assert (=> d!5115 (= lt!11772 lt!11774)))

(declare-fun lt!11771 () Unit!703)

(declare-fun e!20690 () Unit!703)

(assert (=> d!5115 (= lt!11771 e!20690)))

(declare-fun c!3779 () Bool)

(assert (=> d!5115 (= c!3779 lt!11774)))

(declare-fun containsKey!30 (List!842 (_ BitVec 64)) Bool)

(assert (=> d!5115 (= lt!11774 (containsKey!30 (toList!428 (getCurrentListMap!256 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (=> d!5115 (= (contains!369 (getCurrentListMap!256 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304) lt!11772)))

(declare-fun b!32552 () Bool)

(declare-fun lt!11773 () Unit!703)

(assert (=> b!32552 (= e!20690 lt!11773)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!27 (List!842 (_ BitVec 64)) Unit!703)

(assert (=> b!32552 (= lt!11773 (lemmaContainsKeyImpliesGetValueByKeyDefined!27 (toList!428 (getCurrentListMap!256 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-datatypes ((Option!72 0))(
  ( (Some!71 (v!1861 V!1805)) (None!70) )
))
(declare-fun isDefined!28 (Option!72) Bool)

(declare-fun getValueByKey!66 (List!842 (_ BitVec 64)) Option!72)

(assert (=> b!32552 (isDefined!28 (getValueByKey!66 (toList!428 (getCurrentListMap!256 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun b!32553 () Bool)

(declare-fun Unit!705 () Unit!703)

(assert (=> b!32553 (= e!20690 Unit!705)))

(declare-fun b!32554 () Bool)

(assert (=> b!32554 (= e!20689 (isDefined!28 (getValueByKey!66 (toList!428 (getCurrentListMap!256 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)))))

(assert (= (and d!5115 c!3779) b!32552))

(assert (= (and d!5115 (not c!3779)) b!32553))

(assert (= (and d!5115 (not res!19776)) b!32554))

(declare-fun m!26041 () Bool)

(assert (=> d!5115 m!26041))

(declare-fun m!26043 () Bool)

(assert (=> b!32552 m!26043))

(declare-fun m!26045 () Bool)

(assert (=> b!32552 m!26045))

(assert (=> b!32552 m!26045))

(declare-fun m!26047 () Bool)

(assert (=> b!32552 m!26047))

(assert (=> b!32554 m!26045))

(assert (=> b!32554 m!26045))

(assert (=> b!32554 m!26047))

(assert (=> b!32466 d!5115))

(declare-fun b!32597 () Bool)

(declare-fun e!20724 () ListLongMap!825)

(declare-fun call!2638 () ListLongMap!825)

(declare-fun +!52 (ListLongMap!825 tuple2!1248) ListLongMap!825)

(assert (=> b!32597 (= e!20724 (+!52 call!2638 (tuple2!1249 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!32598 () Bool)

(declare-fun e!20726 () Bool)

(declare-fun e!20717 () Bool)

(assert (=> b!32598 (= e!20726 e!20717)))

(declare-fun res!19795 () Bool)

(assert (=> b!32598 (=> (not res!19795) (not e!20717))))

(declare-fun lt!11821 () ListLongMap!825)

(assert (=> b!32598 (= res!19795 (contains!369 lt!11821 (select (arr!1044 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!32598 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1145 _keys!1833)))))

(declare-fun b!32600 () Bool)

(declare-fun e!20718 () Unit!703)

(declare-fun lt!11824 () Unit!703)

(assert (=> b!32600 (= e!20718 lt!11824)))

(declare-fun lt!11822 () ListLongMap!825)

(declare-fun getCurrentListMapNoExtraKeys!21 (array!2183 array!2181 (_ BitVec 32) (_ BitVec 32) V!1805 V!1805 (_ BitVec 32) Int) ListLongMap!825)

(assert (=> b!32600 (= lt!11822 (getCurrentListMapNoExtraKeys!21 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!11831 () (_ BitVec 64))

(assert (=> b!32600 (= lt!11831 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!11819 () (_ BitVec 64))

(assert (=> b!32600 (= lt!11819 (select (arr!1044 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!11829 () Unit!703)

(declare-fun addStillContains!19 (ListLongMap!825 (_ BitVec 64) V!1805 (_ BitVec 64)) Unit!703)

(assert (=> b!32600 (= lt!11829 (addStillContains!19 lt!11822 lt!11831 zeroValue!1443 lt!11819))))

(assert (=> b!32600 (contains!369 (+!52 lt!11822 (tuple2!1249 lt!11831 zeroValue!1443)) lt!11819)))

(declare-fun lt!11840 () Unit!703)

(assert (=> b!32600 (= lt!11840 lt!11829)))

(declare-fun lt!11827 () ListLongMap!825)

(assert (=> b!32600 (= lt!11827 (getCurrentListMapNoExtraKeys!21 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!11833 () (_ BitVec 64))

(assert (=> b!32600 (= lt!11833 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!11823 () (_ BitVec 64))

(assert (=> b!32600 (= lt!11823 (select (arr!1044 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!11839 () Unit!703)

(declare-fun addApplyDifferent!19 (ListLongMap!825 (_ BitVec 64) V!1805 (_ BitVec 64)) Unit!703)

(assert (=> b!32600 (= lt!11839 (addApplyDifferent!19 lt!11827 lt!11833 minValue!1443 lt!11823))))

(declare-fun apply!34 (ListLongMap!825 (_ BitVec 64)) V!1805)

(assert (=> b!32600 (= (apply!34 (+!52 lt!11827 (tuple2!1249 lt!11833 minValue!1443)) lt!11823) (apply!34 lt!11827 lt!11823))))

(declare-fun lt!11837 () Unit!703)

(assert (=> b!32600 (= lt!11837 lt!11839)))

(declare-fun lt!11838 () ListLongMap!825)

(assert (=> b!32600 (= lt!11838 (getCurrentListMapNoExtraKeys!21 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!11826 () (_ BitVec 64))

(assert (=> b!32600 (= lt!11826 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!11835 () (_ BitVec 64))

(assert (=> b!32600 (= lt!11835 (select (arr!1044 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!11820 () Unit!703)

(assert (=> b!32600 (= lt!11820 (addApplyDifferent!19 lt!11838 lt!11826 zeroValue!1443 lt!11835))))

(assert (=> b!32600 (= (apply!34 (+!52 lt!11838 (tuple2!1249 lt!11826 zeroValue!1443)) lt!11835) (apply!34 lt!11838 lt!11835))))

(declare-fun lt!11828 () Unit!703)

(assert (=> b!32600 (= lt!11828 lt!11820)))

(declare-fun lt!11830 () ListLongMap!825)

(assert (=> b!32600 (= lt!11830 (getCurrentListMapNoExtraKeys!21 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!11832 () (_ BitVec 64))

(assert (=> b!32600 (= lt!11832 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!11825 () (_ BitVec 64))

(assert (=> b!32600 (= lt!11825 (select (arr!1044 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!32600 (= lt!11824 (addApplyDifferent!19 lt!11830 lt!11832 minValue!1443 lt!11825))))

(assert (=> b!32600 (= (apply!34 (+!52 lt!11830 (tuple2!1249 lt!11832 minValue!1443)) lt!11825) (apply!34 lt!11830 lt!11825))))

(declare-fun b!32601 () Bool)

(declare-fun e!20727 () Bool)

(declare-fun e!20725 () Bool)

(assert (=> b!32601 (= e!20727 e!20725)))

(declare-fun c!3795 () Bool)

(assert (=> b!32601 (= c!3795 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!2633 () Bool)

(declare-fun call!2637 () ListLongMap!825)

(declare-fun call!2642 () ListLongMap!825)

(declare-fun c!3792 () Bool)

(declare-fun call!2641 () ListLongMap!825)

(declare-fun c!3794 () Bool)

(assert (=> bm!2633 (= call!2638 (+!52 (ite c!3794 call!2642 (ite c!3792 call!2641 call!2637)) (ite (or c!3794 c!3792) (tuple2!1249 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1249 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!32602 () Bool)

(declare-fun Unit!706 () Unit!703)

(assert (=> b!32602 (= e!20718 Unit!706)))

(declare-fun b!32603 () Bool)

(declare-fun res!19802 () Bool)

(assert (=> b!32603 (=> (not res!19802) (not e!20727))))

(declare-fun e!20721 () Bool)

(assert (=> b!32603 (= res!19802 e!20721)))

(declare-fun c!3797 () Bool)

(assert (=> b!32603 (= c!3797 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!2634 () Bool)

(assert (=> bm!2634 (= call!2637 call!2641)))

(declare-fun bm!2635 () Bool)

(declare-fun call!2640 () Bool)

(assert (=> bm!2635 (= call!2640 (contains!369 lt!11821 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!32604 () Bool)

(declare-fun e!20719 () Bool)

(assert (=> b!32604 (= e!20721 e!20719)))

(declare-fun res!19799 () Bool)

(assert (=> b!32604 (= res!19799 call!2640)))

(assert (=> b!32604 (=> (not res!19799) (not e!20719))))

(declare-fun b!32605 () Bool)

(declare-fun e!20729 () ListLongMap!825)

(assert (=> b!32605 (= e!20724 e!20729)))

(assert (=> b!32605 (= c!3792 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!32606 () Bool)

(declare-fun e!20722 () Bool)

(assert (=> b!32606 (= e!20722 (validKeyInArray!0 (select (arr!1044 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!5117 () Bool)

(assert (=> d!5117 e!20727))

(declare-fun res!19796 () Bool)

(assert (=> d!5117 (=> (not res!19796) (not e!20727))))

(assert (=> d!5117 (= res!19796 (or (bvsge #b00000000000000000000000000000000 (size!1145 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1145 _keys!1833)))))))

(declare-fun lt!11836 () ListLongMap!825)

(assert (=> d!5117 (= lt!11821 lt!11836)))

(declare-fun lt!11834 () Unit!703)

(assert (=> d!5117 (= lt!11834 e!20718)))

(declare-fun c!3793 () Bool)

(declare-fun e!20728 () Bool)

(assert (=> d!5117 (= c!3793 e!20728)))

(declare-fun res!19798 () Bool)

(assert (=> d!5117 (=> (not res!19798) (not e!20728))))

(assert (=> d!5117 (= res!19798 (bvslt #b00000000000000000000000000000000 (size!1145 _keys!1833)))))

(assert (=> d!5117 (= lt!11836 e!20724)))

(assert (=> d!5117 (= c!3794 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5117 (validMask!0 mask!2294)))

(assert (=> d!5117 (= (getCurrentListMap!256 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!11821)))

(declare-fun b!32599 () Bool)

(declare-fun e!20723 () Bool)

(assert (=> b!32599 (= e!20725 e!20723)))

(declare-fun res!19797 () Bool)

(declare-fun call!2636 () Bool)

(assert (=> b!32599 (= res!19797 call!2636)))

(assert (=> b!32599 (=> (not res!19797) (not e!20723))))

(declare-fun b!32607 () Bool)

(declare-fun e!20720 () ListLongMap!825)

(declare-fun call!2639 () ListLongMap!825)

(assert (=> b!32607 (= e!20720 call!2639)))

(declare-fun b!32608 () Bool)

(declare-fun res!19801 () Bool)

(assert (=> b!32608 (=> (not res!19801) (not e!20727))))

(assert (=> b!32608 (= res!19801 e!20726)))

(declare-fun res!19803 () Bool)

(assert (=> b!32608 (=> res!19803 e!20726)))

(assert (=> b!32608 (= res!19803 (not e!20722))))

(declare-fun res!19800 () Bool)

(assert (=> b!32608 (=> (not res!19800) (not e!20722))))

(assert (=> b!32608 (= res!19800 (bvslt #b00000000000000000000000000000000 (size!1145 _keys!1833)))))

(declare-fun bm!2636 () Bool)

(assert (=> bm!2636 (= call!2636 (contains!369 lt!11821 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!32609 () Bool)

(declare-fun get!553 (ValueCell!543 V!1805) V!1805)

(declare-fun dynLambda!151 (Int (_ BitVec 64)) V!1805)

(assert (=> b!32609 (= e!20717 (= (apply!34 lt!11821 (select (arr!1044 _keys!1833) #b00000000000000000000000000000000)) (get!553 (select (arr!1043 _values!1501) #b00000000000000000000000000000000) (dynLambda!151 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!32609 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1144 _values!1501)))))

(assert (=> b!32609 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1145 _keys!1833)))))

(declare-fun b!32610 () Bool)

(declare-fun c!3796 () Bool)

(assert (=> b!32610 (= c!3796 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!32610 (= e!20729 e!20720)))

(declare-fun b!32611 () Bool)

(assert (=> b!32611 (= e!20721 (not call!2640))))

(declare-fun bm!2637 () Bool)

(assert (=> bm!2637 (= call!2639 call!2638)))

(declare-fun b!32612 () Bool)

(assert (=> b!32612 (= e!20725 (not call!2636))))

(declare-fun bm!2638 () Bool)

(assert (=> bm!2638 (= call!2642 (getCurrentListMapNoExtraKeys!21 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!32613 () Bool)

(assert (=> b!32613 (= e!20719 (= (apply!34 lt!11821 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!32614 () Bool)

(assert (=> b!32614 (= e!20728 (validKeyInArray!0 (select (arr!1044 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!32615 () Bool)

(assert (=> b!32615 (= e!20729 call!2639)))

(declare-fun bm!2639 () Bool)

(assert (=> bm!2639 (= call!2641 call!2642)))

(declare-fun b!32616 () Bool)

(assert (=> b!32616 (= e!20720 call!2637)))

(declare-fun b!32617 () Bool)

(assert (=> b!32617 (= e!20723 (= (apply!34 lt!11821 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(assert (= (and d!5117 c!3794) b!32597))

(assert (= (and d!5117 (not c!3794)) b!32605))

(assert (= (and b!32605 c!3792) b!32615))

(assert (= (and b!32605 (not c!3792)) b!32610))

(assert (= (and b!32610 c!3796) b!32607))

(assert (= (and b!32610 (not c!3796)) b!32616))

(assert (= (or b!32607 b!32616) bm!2634))

(assert (= (or b!32615 bm!2634) bm!2639))

(assert (= (or b!32615 b!32607) bm!2637))

(assert (= (or b!32597 bm!2639) bm!2638))

(assert (= (or b!32597 bm!2637) bm!2633))

(assert (= (and d!5117 res!19798) b!32614))

(assert (= (and d!5117 c!3793) b!32600))

(assert (= (and d!5117 (not c!3793)) b!32602))

(assert (= (and d!5117 res!19796) b!32608))

(assert (= (and b!32608 res!19800) b!32606))

(assert (= (and b!32608 (not res!19803)) b!32598))

(assert (= (and b!32598 res!19795) b!32609))

(assert (= (and b!32608 res!19801) b!32603))

(assert (= (and b!32603 c!3797) b!32604))

(assert (= (and b!32603 (not c!3797)) b!32611))

(assert (= (and b!32604 res!19799) b!32613))

(assert (= (or b!32604 b!32611) bm!2635))

(assert (= (and b!32603 res!19802) b!32601))

(assert (= (and b!32601 c!3795) b!32599))

(assert (= (and b!32601 (not c!3795)) b!32612))

(assert (= (and b!32599 res!19797) b!32617))

(assert (= (or b!32599 b!32612) bm!2636))

(declare-fun b_lambda!1699 () Bool)

(assert (=> (not b_lambda!1699) (not b!32609)))

(declare-fun t!3542 () Bool)

(declare-fun tb!683 () Bool)

(assert (=> (and start!4246 (= defaultEntry!1504 defaultEntry!1504) t!3542) tb!683))

(declare-fun result!1159 () Bool)

(assert (=> tb!683 (= result!1159 tp_is_empty!1485)))

(assert (=> b!32609 t!3542))

(declare-fun b_and!1947 () Bool)

(assert (= b_and!1943 (and (=> t!3542 result!1159) b_and!1947)))

(declare-fun m!26049 () Bool)

(assert (=> b!32613 m!26049))

(assert (=> b!32600 m!26019))

(declare-fun m!26051 () Bool)

(assert (=> b!32600 m!26051))

(declare-fun m!26053 () Bool)

(assert (=> b!32600 m!26053))

(declare-fun m!26055 () Bool)

(assert (=> b!32600 m!26055))

(declare-fun m!26057 () Bool)

(assert (=> b!32600 m!26057))

(declare-fun m!26059 () Bool)

(assert (=> b!32600 m!26059))

(declare-fun m!26061 () Bool)

(assert (=> b!32600 m!26061))

(declare-fun m!26063 () Bool)

(assert (=> b!32600 m!26063))

(declare-fun m!26065 () Bool)

(assert (=> b!32600 m!26065))

(assert (=> b!32600 m!26053))

(declare-fun m!26067 () Bool)

(assert (=> b!32600 m!26067))

(assert (=> b!32600 m!26051))

(declare-fun m!26069 () Bool)

(assert (=> b!32600 m!26069))

(declare-fun m!26071 () Bool)

(assert (=> b!32600 m!26071))

(declare-fun m!26073 () Bool)

(assert (=> b!32600 m!26073))

(declare-fun m!26075 () Bool)

(assert (=> b!32600 m!26075))

(declare-fun m!26077 () Bool)

(assert (=> b!32600 m!26077))

(assert (=> b!32600 m!26057))

(declare-fun m!26079 () Bool)

(assert (=> b!32600 m!26079))

(declare-fun m!26081 () Bool)

(assert (=> b!32600 m!26081))

(assert (=> b!32600 m!26071))

(declare-fun m!26083 () Bool)

(assert (=> bm!2633 m!26083))

(declare-fun m!26085 () Bool)

(assert (=> b!32609 m!26085))

(declare-fun m!26087 () Bool)

(assert (=> b!32609 m!26087))

(declare-fun m!26089 () Bool)

(assert (=> b!32609 m!26089))

(assert (=> b!32609 m!26019))

(assert (=> b!32609 m!26019))

(declare-fun m!26091 () Bool)

(assert (=> b!32609 m!26091))

(assert (=> b!32609 m!26085))

(assert (=> b!32609 m!26087))

(declare-fun m!26093 () Bool)

(assert (=> b!32597 m!26093))

(declare-fun m!26095 () Bool)

(assert (=> b!32617 m!26095))

(declare-fun m!26097 () Bool)

(assert (=> bm!2636 m!26097))

(declare-fun m!26099 () Bool)

(assert (=> bm!2635 m!26099))

(assert (=> b!32606 m!26019))

(assert (=> b!32606 m!26019))

(assert (=> b!32606 m!26031))

(assert (=> bm!2638 m!26055))

(assert (=> b!32598 m!26019))

(assert (=> b!32598 m!26019))

(declare-fun m!26101 () Bool)

(assert (=> b!32598 m!26101))

(assert (=> b!32614 m!26019))

(assert (=> b!32614 m!26019))

(assert (=> b!32614 m!26031))

(assert (=> d!5117 m!25985))

(assert (=> b!32466 d!5117))

(declare-fun b!32627 () Bool)

(declare-fun e!20734 () Bool)

(assert (=> b!32627 (= e!20734 tp_is_empty!1485)))

(declare-fun mapNonEmpty!1765 () Bool)

(declare-fun mapRes!1765 () Bool)

(declare-fun tp!4825 () Bool)

(declare-fun e!20735 () Bool)

(assert (=> mapNonEmpty!1765 (= mapRes!1765 (and tp!4825 e!20735))))

(declare-fun mapKey!1765 () (_ BitVec 32))

(declare-fun mapValue!1765 () ValueCell!543)

(declare-fun mapRest!1765 () (Array (_ BitVec 32) ValueCell!543))

(assert (=> mapNonEmpty!1765 (= mapRest!1759 (store mapRest!1765 mapKey!1765 mapValue!1765))))

(declare-fun mapIsEmpty!1765 () Bool)

(assert (=> mapIsEmpty!1765 mapRes!1765))

(declare-fun condMapEmpty!1765 () Bool)

(declare-fun mapDefault!1765 () ValueCell!543)

(assert (=> mapNonEmpty!1759 (= condMapEmpty!1765 (= mapRest!1759 ((as const (Array (_ BitVec 32) ValueCell!543)) mapDefault!1765)))))

(assert (=> mapNonEmpty!1759 (= tp!4816 (and e!20734 mapRes!1765))))

(declare-fun b!32626 () Bool)

(assert (=> b!32626 (= e!20735 tp_is_empty!1485)))

(assert (= (and mapNonEmpty!1759 condMapEmpty!1765) mapIsEmpty!1765))

(assert (= (and mapNonEmpty!1759 (not condMapEmpty!1765)) mapNonEmpty!1765))

(assert (= (and mapNonEmpty!1765 ((_ is ValueCellFull!543) mapValue!1765)) b!32626))

(assert (= (and mapNonEmpty!1759 ((_ is ValueCellFull!543) mapDefault!1765)) b!32627))

(declare-fun m!26103 () Bool)

(assert (=> mapNonEmpty!1765 m!26103))

(declare-fun b_lambda!1701 () Bool)

(assert (= b_lambda!1699 (or (and start!4246 b_free!1131) b_lambda!1701)))

(check-sat (not b!32614) (not bm!2615) (not bm!2635) (not b!32613) (not b!32609) (not b_lambda!1701) (not bm!2618) (not b!32600) (not bm!2636) (not b!32617) (not b!32531) (not bm!2638) tp_is_empty!1485 (not b!32530) (not bm!2633) (not b!32543) (not b!32598) (not b!32552) (not b_next!1131) (not b!32606) (not b!32597) (not b!32544) b_and!1947 (not d!5117) (not mapNonEmpty!1765) (not b!32518) (not d!5115) (not b!32512) (not b!32529) (not b!32554))
(check-sat b_and!1947 (not b_next!1131))
