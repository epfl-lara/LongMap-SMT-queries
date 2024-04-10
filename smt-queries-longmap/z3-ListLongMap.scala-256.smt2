; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4220 () Bool)

(assert start!4220)

(declare-fun b_free!1125 () Bool)

(declare-fun b_next!1125 () Bool)

(assert (=> start!4220 (= b_free!1125 (not b_next!1125))))

(declare-fun tp!4794 () Bool)

(declare-fun b_and!1935 () Bool)

(assert (=> start!4220 (= tp!4794 b_and!1935)))

(declare-fun b!32247 () Bool)

(declare-fun res!19604 () Bool)

(declare-fun e!20501 () Bool)

(assert (=> b!32247 (=> (not res!19604) (not e!20501))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32247 (= res!19604 (validKeyInArray!0 k0!1304))))

(declare-fun b!32248 () Bool)

(declare-fun res!19607 () Bool)

(assert (=> b!32248 (=> (not res!19607) (not e!20501))))

(declare-datatypes ((V!1797 0))(
  ( (V!1798 (val!766 Int)) )
))
(declare-datatypes ((ValueCell!540 0))(
  ( (ValueCellFull!540 (v!1855 V!1797)) (EmptyCell!540) )
))
(declare-datatypes ((array!2167 0))(
  ( (array!2168 (arr!1037 (Array (_ BitVec 32) ValueCell!540)) (size!1138 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2167)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2169 0))(
  ( (array!2170 (arr!1038 (Array (_ BitVec 32) (_ BitVec 64))) (size!1139 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2169)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!32248 (= res!19607 (and (= (size!1138 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1139 _keys!1833) (size!1138 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!32249 () Bool)

(declare-fun res!19602 () Bool)

(assert (=> b!32249 (=> (not res!19602) (not e!20501))))

(declare-fun arrayContainsKey!0 (array!2169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32249 (= res!19602 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32250 () Bool)

(declare-fun res!19603 () Bool)

(assert (=> b!32250 (=> (not res!19603) (not e!20501))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1797)

(declare-fun minValue!1443 () V!1797)

(declare-datatypes ((tuple2!1244 0))(
  ( (tuple2!1245 (_1!633 (_ BitVec 64)) (_2!633 V!1797)) )
))
(declare-datatypes ((List!838 0))(
  ( (Nil!835) (Cons!834 (h!1401 tuple2!1244) (t!3531 List!838)) )
))
(declare-datatypes ((ListLongMap!821 0))(
  ( (ListLongMap!822 (toList!426 List!838)) )
))
(declare-fun contains!366 (ListLongMap!821 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!254 (array!2169 array!2167 (_ BitVec 32) (_ BitVec 32) V!1797 V!1797 (_ BitVec 32) Int) ListLongMap!821)

(assert (=> b!32250 (= res!19603 (not (contains!366 (getCurrentListMap!254 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!32251 () Bool)

(declare-fun lt!11648 () (_ BitVec 32))

(assert (=> b!32251 (= e!20501 (or (bvslt lt!11648 #b00000000000000000000000000000000) (bvsge lt!11648 (size!1139 _keys!1833))))))

(declare-fun arrayScanForKey!0 (array!2169 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32251 (= lt!11648 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32252 () Bool)

(declare-fun res!19605 () Bool)

(assert (=> b!32252 (=> (not res!19605) (not e!20501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2169 (_ BitVec 32)) Bool)

(assert (=> b!32252 (= res!19605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!19606 () Bool)

(assert (=> start!4220 (=> (not res!19606) (not e!20501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4220 (= res!19606 (validMask!0 mask!2294))))

(assert (=> start!4220 e!20501))

(assert (=> start!4220 true))

(assert (=> start!4220 tp!4794))

(declare-fun e!20503 () Bool)

(declare-fun array_inv!723 (array!2167) Bool)

(assert (=> start!4220 (and (array_inv!723 _values!1501) e!20503)))

(declare-fun array_inv!724 (array!2169) Bool)

(assert (=> start!4220 (array_inv!724 _keys!1833)))

(declare-fun tp_is_empty!1479 () Bool)

(assert (=> start!4220 tp_is_empty!1479))

(declare-fun b!32253 () Bool)

(declare-fun res!19608 () Bool)

(assert (=> b!32253 (=> (not res!19608) (not e!20501))))

(declare-datatypes ((List!839 0))(
  ( (Nil!836) (Cons!835 (h!1402 (_ BitVec 64)) (t!3532 List!839)) )
))
(declare-fun arrayNoDuplicates!0 (array!2169 (_ BitVec 32) List!839) Bool)

(assert (=> b!32253 (= res!19608 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!836))))

(declare-fun b!32254 () Bool)

(declare-fun e!20504 () Bool)

(declare-fun mapRes!1747 () Bool)

(assert (=> b!32254 (= e!20503 (and e!20504 mapRes!1747))))

(declare-fun condMapEmpty!1747 () Bool)

(declare-fun mapDefault!1747 () ValueCell!540)

(assert (=> b!32254 (= condMapEmpty!1747 (= (arr!1037 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!540)) mapDefault!1747)))))

(declare-fun mapIsEmpty!1747 () Bool)

(assert (=> mapIsEmpty!1747 mapRes!1747))

(declare-fun b!32255 () Bool)

(assert (=> b!32255 (= e!20504 tp_is_empty!1479)))

(declare-fun b!32256 () Bool)

(declare-fun e!20502 () Bool)

(assert (=> b!32256 (= e!20502 tp_is_empty!1479)))

(declare-fun mapNonEmpty!1747 () Bool)

(declare-fun tp!4795 () Bool)

(assert (=> mapNonEmpty!1747 (= mapRes!1747 (and tp!4795 e!20502))))

(declare-fun mapValue!1747 () ValueCell!540)

(declare-fun mapRest!1747 () (Array (_ BitVec 32) ValueCell!540))

(declare-fun mapKey!1747 () (_ BitVec 32))

(assert (=> mapNonEmpty!1747 (= (arr!1037 _values!1501) (store mapRest!1747 mapKey!1747 mapValue!1747))))

(assert (= (and start!4220 res!19606) b!32248))

(assert (= (and b!32248 res!19607) b!32252))

(assert (= (and b!32252 res!19605) b!32253))

(assert (= (and b!32253 res!19608) b!32247))

(assert (= (and b!32247 res!19604) b!32250))

(assert (= (and b!32250 res!19603) b!32249))

(assert (= (and b!32249 res!19602) b!32251))

(assert (= (and b!32254 condMapEmpty!1747) mapIsEmpty!1747))

(assert (= (and b!32254 (not condMapEmpty!1747)) mapNonEmpty!1747))

(get-info :version)

(assert (= (and mapNonEmpty!1747 ((_ is ValueCellFull!540) mapValue!1747)) b!32256))

(assert (= (and b!32254 ((_ is ValueCellFull!540) mapDefault!1747)) b!32255))

(assert (= start!4220 b!32254))

(declare-fun m!25811 () Bool)

(assert (=> b!32253 m!25811))

(declare-fun m!25813 () Bool)

(assert (=> b!32247 m!25813))

(declare-fun m!25815 () Bool)

(assert (=> b!32251 m!25815))

(declare-fun m!25817 () Bool)

(assert (=> b!32249 m!25817))

(declare-fun m!25819 () Bool)

(assert (=> mapNonEmpty!1747 m!25819))

(declare-fun m!25821 () Bool)

(assert (=> b!32252 m!25821))

(declare-fun m!25823 () Bool)

(assert (=> b!32250 m!25823))

(assert (=> b!32250 m!25823))

(declare-fun m!25825 () Bool)

(assert (=> b!32250 m!25825))

(declare-fun m!25827 () Bool)

(assert (=> start!4220 m!25827))

(declare-fun m!25829 () Bool)

(assert (=> start!4220 m!25829))

(declare-fun m!25831 () Bool)

(assert (=> start!4220 m!25831))

(check-sat (not start!4220) (not mapNonEmpty!1747) (not b!32253) (not b_next!1125) (not b!32250) b_and!1935 (not b!32252) (not b!32251) (not b!32249) tp_is_empty!1479 (not b!32247))
(check-sat b_and!1935 (not b_next!1125))
(get-model)

(declare-fun d!5075 () Bool)

(declare-fun lt!11654 () (_ BitVec 32))

(assert (=> d!5075 (and (or (bvslt lt!11654 #b00000000000000000000000000000000) (bvsge lt!11654 (size!1139 _keys!1833)) (and (bvsge lt!11654 #b00000000000000000000000000000000) (bvslt lt!11654 (size!1139 _keys!1833)))) (bvsge lt!11654 #b00000000000000000000000000000000) (bvslt lt!11654 (size!1139 _keys!1833)) (= (select (arr!1038 _keys!1833) lt!11654) k0!1304))))

(declare-fun e!20522 () (_ BitVec 32))

(assert (=> d!5075 (= lt!11654 e!20522)))

(declare-fun c!3740 () Bool)

(assert (=> d!5075 (= c!3740 (= (select (arr!1038 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5075 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1139 _keys!1833)) (bvslt (size!1139 _keys!1833) #b01111111111111111111111111111111))))

(assert (=> d!5075 (= (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) lt!11654)))

(declare-fun b!32291 () Bool)

(assert (=> b!32291 (= e!20522 #b00000000000000000000000000000000)))

(declare-fun b!32292 () Bool)

(assert (=> b!32292 (= e!20522 (arrayScanForKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5075 c!3740) b!32291))

(assert (= (and d!5075 (not c!3740)) b!32292))

(declare-fun m!25855 () Bool)

(assert (=> d!5075 m!25855))

(declare-fun m!25857 () Bool)

(assert (=> d!5075 m!25857))

(declare-fun m!25859 () Bool)

(assert (=> b!32292 m!25859))

(assert (=> b!32251 d!5075))

(declare-fun d!5077 () Bool)

(declare-fun e!20527 () Bool)

(assert (=> d!5077 e!20527))

(declare-fun res!19632 () Bool)

(assert (=> d!5077 (=> res!19632 e!20527)))

(declare-fun lt!11666 () Bool)

(assert (=> d!5077 (= res!19632 (not lt!11666))))

(declare-fun lt!11665 () Bool)

(assert (=> d!5077 (= lt!11666 lt!11665)))

(declare-datatypes ((Unit!699 0))(
  ( (Unit!700) )
))
(declare-fun lt!11664 () Unit!699)

(declare-fun e!20528 () Unit!699)

(assert (=> d!5077 (= lt!11664 e!20528)))

(declare-fun c!3743 () Bool)

(assert (=> d!5077 (= c!3743 lt!11665)))

(declare-fun containsKey!29 (List!838 (_ BitVec 64)) Bool)

(assert (=> d!5077 (= lt!11665 (containsKey!29 (toList!426 (getCurrentListMap!254 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (=> d!5077 (= (contains!366 (getCurrentListMap!254 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304) lt!11666)))

(declare-fun b!32299 () Bool)

(declare-fun lt!11663 () Unit!699)

(assert (=> b!32299 (= e!20528 lt!11663)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!26 (List!838 (_ BitVec 64)) Unit!699)

(assert (=> b!32299 (= lt!11663 (lemmaContainsKeyImpliesGetValueByKeyDefined!26 (toList!426 (getCurrentListMap!254 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-datatypes ((Option!71 0))(
  ( (Some!70 (v!1857 V!1797)) (None!69) )
))
(declare-fun isDefined!27 (Option!71) Bool)

(declare-fun getValueByKey!65 (List!838 (_ BitVec 64)) Option!71)

(assert (=> b!32299 (isDefined!27 (getValueByKey!65 (toList!426 (getCurrentListMap!254 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun b!32300 () Bool)

(declare-fun Unit!701 () Unit!699)

(assert (=> b!32300 (= e!20528 Unit!701)))

(declare-fun b!32301 () Bool)

(assert (=> b!32301 (= e!20527 (isDefined!27 (getValueByKey!65 (toList!426 (getCurrentListMap!254 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)))))

(assert (= (and d!5077 c!3743) b!32299))

(assert (= (and d!5077 (not c!3743)) b!32300))

(assert (= (and d!5077 (not res!19632)) b!32301))

(declare-fun m!25861 () Bool)

(assert (=> d!5077 m!25861))

(declare-fun m!25863 () Bool)

(assert (=> b!32299 m!25863))

(declare-fun m!25865 () Bool)

(assert (=> b!32299 m!25865))

(assert (=> b!32299 m!25865))

(declare-fun m!25867 () Bool)

(assert (=> b!32299 m!25867))

(assert (=> b!32301 m!25865))

(assert (=> b!32301 m!25865))

(assert (=> b!32301 m!25867))

(assert (=> b!32250 d!5077))

(declare-fun bm!2600 () Bool)

(declare-fun call!2605 () ListLongMap!821)

(declare-fun call!2609 () ListLongMap!821)

(assert (=> bm!2600 (= call!2605 call!2609)))

(declare-fun b!32344 () Bool)

(declare-fun e!20565 () Bool)

(declare-fun lt!11712 () ListLongMap!821)

(declare-fun apply!33 (ListLongMap!821 (_ BitVec 64)) V!1797)

(assert (=> b!32344 (= e!20565 (= (apply!33 lt!11712 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun b!32345 () Bool)

(declare-fun e!20567 () ListLongMap!821)

(declare-fun call!2606 () ListLongMap!821)

(assert (=> b!32345 (= e!20567 call!2606)))

(declare-fun b!32346 () Bool)

(declare-fun e!20561 () ListLongMap!821)

(assert (=> b!32346 (= e!20561 call!2606)))

(declare-fun c!3760 () Bool)

(declare-fun c!3759 () Bool)

(declare-fun bm!2601 () Bool)

(declare-fun call!2604 () ListLongMap!821)

(declare-fun call!2607 () ListLongMap!821)

(declare-fun +!51 (ListLongMap!821 tuple2!1244) ListLongMap!821)

(assert (=> bm!2601 (= call!2604 (+!51 (ite c!3760 call!2609 (ite c!3759 call!2605 call!2607)) (ite (or c!3760 c!3759) (tuple2!1245 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1245 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!32347 () Bool)

(declare-fun e!20559 () Unit!699)

(declare-fun lt!11727 () Unit!699)

(assert (=> b!32347 (= e!20559 lt!11727)))

(declare-fun lt!11716 () ListLongMap!821)

(declare-fun getCurrentListMapNoExtraKeys!20 (array!2169 array!2167 (_ BitVec 32) (_ BitVec 32) V!1797 V!1797 (_ BitVec 32) Int) ListLongMap!821)

(assert (=> b!32347 (= lt!11716 (getCurrentListMapNoExtraKeys!20 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!11717 () (_ BitVec 64))

(assert (=> b!32347 (= lt!11717 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!11728 () (_ BitVec 64))

(assert (=> b!32347 (= lt!11728 (select (arr!1038 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!11711 () Unit!699)

(declare-fun addStillContains!18 (ListLongMap!821 (_ BitVec 64) V!1797 (_ BitVec 64)) Unit!699)

(assert (=> b!32347 (= lt!11711 (addStillContains!18 lt!11716 lt!11717 zeroValue!1443 lt!11728))))

(assert (=> b!32347 (contains!366 (+!51 lt!11716 (tuple2!1245 lt!11717 zeroValue!1443)) lt!11728)))

(declare-fun lt!11726 () Unit!699)

(assert (=> b!32347 (= lt!11726 lt!11711)))

(declare-fun lt!11715 () ListLongMap!821)

(assert (=> b!32347 (= lt!11715 (getCurrentListMapNoExtraKeys!20 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!11725 () (_ BitVec 64))

(assert (=> b!32347 (= lt!11725 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!11713 () (_ BitVec 64))

(assert (=> b!32347 (= lt!11713 (select (arr!1038 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!11723 () Unit!699)

(declare-fun addApplyDifferent!18 (ListLongMap!821 (_ BitVec 64) V!1797 (_ BitVec 64)) Unit!699)

(assert (=> b!32347 (= lt!11723 (addApplyDifferent!18 lt!11715 lt!11725 minValue!1443 lt!11713))))

(assert (=> b!32347 (= (apply!33 (+!51 lt!11715 (tuple2!1245 lt!11725 minValue!1443)) lt!11713) (apply!33 lt!11715 lt!11713))))

(declare-fun lt!11732 () Unit!699)

(assert (=> b!32347 (= lt!11732 lt!11723)))

(declare-fun lt!11729 () ListLongMap!821)

(assert (=> b!32347 (= lt!11729 (getCurrentListMapNoExtraKeys!20 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!11730 () (_ BitVec 64))

(assert (=> b!32347 (= lt!11730 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!11720 () (_ BitVec 64))

(assert (=> b!32347 (= lt!11720 (select (arr!1038 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!11731 () Unit!699)

(assert (=> b!32347 (= lt!11731 (addApplyDifferent!18 lt!11729 lt!11730 zeroValue!1443 lt!11720))))

(assert (=> b!32347 (= (apply!33 (+!51 lt!11729 (tuple2!1245 lt!11730 zeroValue!1443)) lt!11720) (apply!33 lt!11729 lt!11720))))

(declare-fun lt!11718 () Unit!699)

(assert (=> b!32347 (= lt!11718 lt!11731)))

(declare-fun lt!11724 () ListLongMap!821)

(assert (=> b!32347 (= lt!11724 (getCurrentListMapNoExtraKeys!20 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!11722 () (_ BitVec 64))

(assert (=> b!32347 (= lt!11722 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!11721 () (_ BitVec 64))

(assert (=> b!32347 (= lt!11721 (select (arr!1038 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!32347 (= lt!11727 (addApplyDifferent!18 lt!11724 lt!11722 minValue!1443 lt!11721))))

(assert (=> b!32347 (= (apply!33 (+!51 lt!11724 (tuple2!1245 lt!11722 minValue!1443)) lt!11721) (apply!33 lt!11724 lt!11721))))

(declare-fun b!32348 () Bool)

(declare-fun e!20566 () Bool)

(assert (=> b!32348 (= e!20566 e!20565)))

(declare-fun res!19657 () Bool)

(declare-fun call!2603 () Bool)

(assert (=> b!32348 (= res!19657 call!2603)))

(assert (=> b!32348 (=> (not res!19657) (not e!20565))))

(declare-fun bm!2602 () Bool)

(assert (=> bm!2602 (= call!2609 (getCurrentListMapNoExtraKeys!20 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!32349 () Bool)

(assert (=> b!32349 (= e!20561 call!2607)))

(declare-fun bm!2603 () Bool)

(declare-fun call!2608 () Bool)

(assert (=> bm!2603 (= call!2608 (contains!366 lt!11712 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!32350 () Bool)

(declare-fun e!20555 () Bool)

(assert (=> b!32350 (= e!20555 (not call!2608))))

(declare-fun e!20562 () Bool)

(declare-fun b!32351 () Bool)

(declare-fun get!550 (ValueCell!540 V!1797) V!1797)

(declare-fun dynLambda!150 (Int (_ BitVec 64)) V!1797)

(assert (=> b!32351 (= e!20562 (= (apply!33 lt!11712 (select (arr!1038 _keys!1833) #b00000000000000000000000000000000)) (get!550 (select (arr!1037 _values!1501) #b00000000000000000000000000000000) (dynLambda!150 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!32351 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1138 _values!1501)))))

(assert (=> b!32351 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1139 _keys!1833)))))

(declare-fun b!32352 () Bool)

(declare-fun e!20556 () Bool)

(assert (=> b!32352 (= e!20555 e!20556)))

(declare-fun res!19655 () Bool)

(assert (=> b!32352 (= res!19655 call!2608)))

(assert (=> b!32352 (=> (not res!19655) (not e!20556))))

(declare-fun bm!2604 () Bool)

(assert (=> bm!2604 (= call!2603 (contains!366 lt!11712 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!32353 () Bool)

(declare-fun e!20563 () Bool)

(assert (=> b!32353 (= e!20563 (validKeyInArray!0 (select (arr!1038 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!32354 () Bool)

(assert (=> b!32354 (= e!20556 (= (apply!33 lt!11712 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!32355 () Bool)

(declare-fun e!20564 () ListLongMap!821)

(assert (=> b!32355 (= e!20564 e!20567)))

(assert (=> b!32355 (= c!3759 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!32356 () Bool)

(declare-fun res!19653 () Bool)

(declare-fun e!20557 () Bool)

(assert (=> b!32356 (=> (not res!19653) (not e!20557))))

(declare-fun e!20560 () Bool)

(assert (=> b!32356 (= res!19653 e!20560)))

(declare-fun res!19654 () Bool)

(assert (=> b!32356 (=> res!19654 e!20560)))

(declare-fun e!20558 () Bool)

(assert (=> b!32356 (= res!19654 (not e!20558))))

(declare-fun res!19659 () Bool)

(assert (=> b!32356 (=> (not res!19659) (not e!20558))))

(assert (=> b!32356 (= res!19659 (bvslt #b00000000000000000000000000000000 (size!1139 _keys!1833)))))

(declare-fun b!32357 () Bool)

(declare-fun c!3757 () Bool)

(assert (=> b!32357 (= c!3757 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!32357 (= e!20567 e!20561)))

(declare-fun b!32358 () Bool)

(assert (=> b!32358 (= e!20560 e!20562)))

(declare-fun res!19658 () Bool)

(assert (=> b!32358 (=> (not res!19658) (not e!20562))))

(assert (=> b!32358 (= res!19658 (contains!366 lt!11712 (select (arr!1038 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!32358 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1139 _keys!1833)))))

(declare-fun b!32359 () Bool)

(assert (=> b!32359 (= e!20566 (not call!2603))))

(declare-fun d!5079 () Bool)

(assert (=> d!5079 e!20557))

(declare-fun res!19651 () Bool)

(assert (=> d!5079 (=> (not res!19651) (not e!20557))))

(assert (=> d!5079 (= res!19651 (or (bvsge #b00000000000000000000000000000000 (size!1139 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1139 _keys!1833)))))))

(declare-fun lt!11719 () ListLongMap!821)

(assert (=> d!5079 (= lt!11712 lt!11719)))

(declare-fun lt!11714 () Unit!699)

(assert (=> d!5079 (= lt!11714 e!20559)))

(declare-fun c!3756 () Bool)

(assert (=> d!5079 (= c!3756 e!20563)))

(declare-fun res!19652 () Bool)

(assert (=> d!5079 (=> (not res!19652) (not e!20563))))

(assert (=> d!5079 (= res!19652 (bvslt #b00000000000000000000000000000000 (size!1139 _keys!1833)))))

(assert (=> d!5079 (= lt!11719 e!20564)))

(assert (=> d!5079 (= c!3760 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5079 (validMask!0 mask!2294)))

(assert (=> d!5079 (= (getCurrentListMap!254 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!11712)))

(declare-fun b!32360 () Bool)

(assert (=> b!32360 (= e!20557 e!20566)))

(declare-fun c!3758 () Bool)

(assert (=> b!32360 (= c!3758 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!32361 () Bool)

(assert (=> b!32361 (= e!20558 (validKeyInArray!0 (select (arr!1038 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!32362 () Bool)

(declare-fun res!19656 () Bool)

(assert (=> b!32362 (=> (not res!19656) (not e!20557))))

(assert (=> b!32362 (= res!19656 e!20555)))

(declare-fun c!3761 () Bool)

(assert (=> b!32362 (= c!3761 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!32363 () Bool)

(declare-fun Unit!702 () Unit!699)

(assert (=> b!32363 (= e!20559 Unit!702)))

(declare-fun bm!2605 () Bool)

(assert (=> bm!2605 (= call!2607 call!2605)))

(declare-fun b!32364 () Bool)

(assert (=> b!32364 (= e!20564 (+!51 call!2604 (tuple2!1245 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun bm!2606 () Bool)

(assert (=> bm!2606 (= call!2606 call!2604)))

(assert (= (and d!5079 c!3760) b!32364))

(assert (= (and d!5079 (not c!3760)) b!32355))

(assert (= (and b!32355 c!3759) b!32345))

(assert (= (and b!32355 (not c!3759)) b!32357))

(assert (= (and b!32357 c!3757) b!32346))

(assert (= (and b!32357 (not c!3757)) b!32349))

(assert (= (or b!32346 b!32349) bm!2605))

(assert (= (or b!32345 bm!2605) bm!2600))

(assert (= (or b!32345 b!32346) bm!2606))

(assert (= (or b!32364 bm!2600) bm!2602))

(assert (= (or b!32364 bm!2606) bm!2601))

(assert (= (and d!5079 res!19652) b!32353))

(assert (= (and d!5079 c!3756) b!32347))

(assert (= (and d!5079 (not c!3756)) b!32363))

(assert (= (and d!5079 res!19651) b!32356))

(assert (= (and b!32356 res!19659) b!32361))

(assert (= (and b!32356 (not res!19654)) b!32358))

(assert (= (and b!32358 res!19658) b!32351))

(assert (= (and b!32356 res!19653) b!32362))

(assert (= (and b!32362 c!3761) b!32352))

(assert (= (and b!32362 (not c!3761)) b!32350))

(assert (= (and b!32352 res!19655) b!32354))

(assert (= (or b!32352 b!32350) bm!2603))

(assert (= (and b!32362 res!19656) b!32360))

(assert (= (and b!32360 c!3758) b!32348))

(assert (= (and b!32360 (not c!3758)) b!32359))

(assert (= (and b!32348 res!19657) b!32344))

(assert (= (or b!32348 b!32359) bm!2604))

(declare-fun b_lambda!1695 () Bool)

(assert (=> (not b_lambda!1695) (not b!32351)))

(declare-fun t!3535 () Bool)

(declare-fun tb!681 () Bool)

(assert (=> (and start!4220 (= defaultEntry!1504 defaultEntry!1504) t!3535) tb!681))

(declare-fun result!1153 () Bool)

(assert (=> tb!681 (= result!1153 tp_is_empty!1479)))

(assert (=> b!32351 t!3535))

(declare-fun b_and!1939 () Bool)

(assert (= b_and!1935 (and (=> t!3535 result!1153) b_and!1939)))

(declare-fun m!25869 () Bool)

(assert (=> b!32344 m!25869))

(assert (=> d!5079 m!25827))

(assert (=> b!32358 m!25857))

(assert (=> b!32358 m!25857))

(declare-fun m!25871 () Bool)

(assert (=> b!32358 m!25871))

(declare-fun m!25873 () Bool)

(assert (=> bm!2604 m!25873))

(assert (=> b!32361 m!25857))

(assert (=> b!32361 m!25857))

(declare-fun m!25875 () Bool)

(assert (=> b!32361 m!25875))

(declare-fun m!25877 () Bool)

(assert (=> b!32347 m!25877))

(declare-fun m!25879 () Bool)

(assert (=> b!32347 m!25879))

(declare-fun m!25881 () Bool)

(assert (=> b!32347 m!25881))

(declare-fun m!25883 () Bool)

(assert (=> b!32347 m!25883))

(declare-fun m!25885 () Bool)

(assert (=> b!32347 m!25885))

(declare-fun m!25887 () Bool)

(assert (=> b!32347 m!25887))

(declare-fun m!25889 () Bool)

(assert (=> b!32347 m!25889))

(declare-fun m!25891 () Bool)

(assert (=> b!32347 m!25891))

(assert (=> b!32347 m!25883))

(declare-fun m!25893 () Bool)

(assert (=> b!32347 m!25893))

(declare-fun m!25895 () Bool)

(assert (=> b!32347 m!25895))

(declare-fun m!25897 () Bool)

(assert (=> b!32347 m!25897))

(assert (=> b!32347 m!25895))

(declare-fun m!25899 () Bool)

(assert (=> b!32347 m!25899))

(declare-fun m!25901 () Bool)

(assert (=> b!32347 m!25901))

(declare-fun m!25903 () Bool)

(assert (=> b!32347 m!25903))

(assert (=> b!32347 m!25889))

(declare-fun m!25905 () Bool)

(assert (=> b!32347 m!25905))

(assert (=> b!32347 m!25857))

(declare-fun m!25907 () Bool)

(assert (=> b!32347 m!25907))

(assert (=> b!32347 m!25877))

(assert (=> b!32353 m!25857))

(assert (=> b!32353 m!25857))

(assert (=> b!32353 m!25875))

(declare-fun m!25909 () Bool)

(assert (=> bm!2603 m!25909))

(assert (=> bm!2602 m!25907))

(declare-fun m!25911 () Bool)

(assert (=> b!32364 m!25911))

(declare-fun m!25913 () Bool)

(assert (=> b!32351 m!25913))

(assert (=> b!32351 m!25857))

(declare-fun m!25915 () Bool)

(assert (=> b!32351 m!25915))

(assert (=> b!32351 m!25913))

(declare-fun m!25917 () Bool)

(assert (=> b!32351 m!25917))

(assert (=> b!32351 m!25857))

(declare-fun m!25919 () Bool)

(assert (=> b!32351 m!25919))

(assert (=> b!32351 m!25915))

(declare-fun m!25921 () Bool)

(assert (=> b!32354 m!25921))

(declare-fun m!25923 () Bool)

(assert (=> bm!2601 m!25923))

(assert (=> b!32250 d!5079))

(declare-fun d!5081 () Bool)

(declare-fun res!19664 () Bool)

(declare-fun e!20572 () Bool)

(assert (=> d!5081 (=> res!19664 e!20572)))

(assert (=> d!5081 (= res!19664 (= (select (arr!1038 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5081 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!20572)))

(declare-fun b!32371 () Bool)

(declare-fun e!20573 () Bool)

(assert (=> b!32371 (= e!20572 e!20573)))

(declare-fun res!19665 () Bool)

(assert (=> b!32371 (=> (not res!19665) (not e!20573))))

(assert (=> b!32371 (= res!19665 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1139 _keys!1833)))))

(declare-fun b!32372 () Bool)

(assert (=> b!32372 (= e!20573 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5081 (not res!19664)) b!32371))

(assert (= (and b!32371 res!19665) b!32372))

(assert (=> d!5081 m!25857))

(declare-fun m!25925 () Bool)

(assert (=> b!32372 m!25925))

(assert (=> b!32249 d!5081))

(declare-fun b!32383 () Bool)

(declare-fun e!20583 () Bool)

(declare-fun call!2612 () Bool)

(assert (=> b!32383 (= e!20583 call!2612)))

(declare-fun b!32384 () Bool)

(assert (=> b!32384 (= e!20583 call!2612)))

(declare-fun bm!2609 () Bool)

(declare-fun c!3764 () Bool)

(assert (=> bm!2609 (= call!2612 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3764 (Cons!835 (select (arr!1038 _keys!1833) #b00000000000000000000000000000000) Nil!836) Nil!836)))))

(declare-fun b!32385 () Bool)

(declare-fun e!20584 () Bool)

(declare-fun contains!368 (List!839 (_ BitVec 64)) Bool)

(assert (=> b!32385 (= e!20584 (contains!368 Nil!836 (select (arr!1038 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!5083 () Bool)

(declare-fun res!19674 () Bool)

(declare-fun e!20582 () Bool)

(assert (=> d!5083 (=> res!19674 e!20582)))

(assert (=> d!5083 (= res!19674 (bvsge #b00000000000000000000000000000000 (size!1139 _keys!1833)))))

(assert (=> d!5083 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!836) e!20582)))

(declare-fun b!32386 () Bool)

(declare-fun e!20585 () Bool)

(assert (=> b!32386 (= e!20582 e!20585)))

(declare-fun res!19673 () Bool)

(assert (=> b!32386 (=> (not res!19673) (not e!20585))))

(assert (=> b!32386 (= res!19673 (not e!20584))))

(declare-fun res!19672 () Bool)

(assert (=> b!32386 (=> (not res!19672) (not e!20584))))

(assert (=> b!32386 (= res!19672 (validKeyInArray!0 (select (arr!1038 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!32387 () Bool)

(assert (=> b!32387 (= e!20585 e!20583)))

(assert (=> b!32387 (= c!3764 (validKeyInArray!0 (select (arr!1038 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5083 (not res!19674)) b!32386))

(assert (= (and b!32386 res!19672) b!32385))

(assert (= (and b!32386 res!19673) b!32387))

(assert (= (and b!32387 c!3764) b!32383))

(assert (= (and b!32387 (not c!3764)) b!32384))

(assert (= (or b!32383 b!32384) bm!2609))

(assert (=> bm!2609 m!25857))

(declare-fun m!25927 () Bool)

(assert (=> bm!2609 m!25927))

(assert (=> b!32385 m!25857))

(assert (=> b!32385 m!25857))

(declare-fun m!25929 () Bool)

(assert (=> b!32385 m!25929))

(assert (=> b!32386 m!25857))

(assert (=> b!32386 m!25857))

(assert (=> b!32386 m!25875))

(assert (=> b!32387 m!25857))

(assert (=> b!32387 m!25857))

(assert (=> b!32387 m!25875))

(assert (=> b!32253 d!5083))

(declare-fun d!5085 () Bool)

(assert (=> d!5085 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4220 d!5085))

(declare-fun d!5087 () Bool)

(assert (=> d!5087 (= (array_inv!723 _values!1501) (bvsge (size!1138 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4220 d!5087))

(declare-fun d!5089 () Bool)

(assert (=> d!5089 (= (array_inv!724 _keys!1833) (bvsge (size!1139 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4220 d!5089))

(declare-fun b!32396 () Bool)

(declare-fun e!20592 () Bool)

(declare-fun call!2615 () Bool)

(assert (=> b!32396 (= e!20592 call!2615)))

(declare-fun d!5091 () Bool)

(declare-fun res!19680 () Bool)

(declare-fun e!20593 () Bool)

(assert (=> d!5091 (=> res!19680 e!20593)))

(assert (=> d!5091 (= res!19680 (bvsge #b00000000000000000000000000000000 (size!1139 _keys!1833)))))

(assert (=> d!5091 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!20593)))

(declare-fun b!32397 () Bool)

(declare-fun e!20594 () Bool)

(assert (=> b!32397 (= e!20594 e!20592)))

(declare-fun lt!11740 () (_ BitVec 64))

(assert (=> b!32397 (= lt!11740 (select (arr!1038 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!11739 () Unit!699)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2169 (_ BitVec 64) (_ BitVec 32)) Unit!699)

(assert (=> b!32397 (= lt!11739 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!11740 #b00000000000000000000000000000000))))

(assert (=> b!32397 (arrayContainsKey!0 _keys!1833 lt!11740 #b00000000000000000000000000000000)))

(declare-fun lt!11741 () Unit!699)

(assert (=> b!32397 (= lt!11741 lt!11739)))

(declare-fun res!19679 () Bool)

(declare-datatypes ((SeekEntryResult!122 0))(
  ( (MissingZero!122 (index!2610 (_ BitVec 32))) (Found!122 (index!2611 (_ BitVec 32))) (Intermediate!122 (undefined!934 Bool) (index!2612 (_ BitVec 32)) (x!6722 (_ BitVec 32))) (Undefined!122) (MissingVacant!122 (index!2613 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2169 (_ BitVec 32)) SeekEntryResult!122)

(assert (=> b!32397 (= res!19679 (= (seekEntryOrOpen!0 (select (arr!1038 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!122 #b00000000000000000000000000000000)))))

(assert (=> b!32397 (=> (not res!19679) (not e!20592))))

(declare-fun b!32398 () Bool)

(assert (=> b!32398 (= e!20593 e!20594)))

(declare-fun c!3767 () Bool)

(assert (=> b!32398 (= c!3767 (validKeyInArray!0 (select (arr!1038 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2612 () Bool)

(assert (=> bm!2612 (= call!2615 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!32399 () Bool)

(assert (=> b!32399 (= e!20594 call!2615)))

(assert (= (and d!5091 (not res!19680)) b!32398))

(assert (= (and b!32398 c!3767) b!32397))

(assert (= (and b!32398 (not c!3767)) b!32399))

(assert (= (and b!32397 res!19679) b!32396))

(assert (= (or b!32396 b!32399) bm!2612))

(assert (=> b!32397 m!25857))

(declare-fun m!25931 () Bool)

(assert (=> b!32397 m!25931))

(declare-fun m!25933 () Bool)

(assert (=> b!32397 m!25933))

(assert (=> b!32397 m!25857))

(declare-fun m!25935 () Bool)

(assert (=> b!32397 m!25935))

(assert (=> b!32398 m!25857))

(assert (=> b!32398 m!25857))

(assert (=> b!32398 m!25875))

(declare-fun m!25937 () Bool)

(assert (=> bm!2612 m!25937))

(assert (=> b!32252 d!5091))

(declare-fun d!5093 () Bool)

(assert (=> d!5093 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!32247 d!5093))

(declare-fun condMapEmpty!1753 () Bool)

(declare-fun mapDefault!1753 () ValueCell!540)

(assert (=> mapNonEmpty!1747 (= condMapEmpty!1753 (= mapRest!1747 ((as const (Array (_ BitVec 32) ValueCell!540)) mapDefault!1753)))))

(declare-fun e!20599 () Bool)

(declare-fun mapRes!1753 () Bool)

(assert (=> mapNonEmpty!1747 (= tp!4795 (and e!20599 mapRes!1753))))

(declare-fun mapIsEmpty!1753 () Bool)

(assert (=> mapIsEmpty!1753 mapRes!1753))

(declare-fun b!32406 () Bool)

(declare-fun e!20600 () Bool)

(assert (=> b!32406 (= e!20600 tp_is_empty!1479)))

(declare-fun b!32407 () Bool)

(assert (=> b!32407 (= e!20599 tp_is_empty!1479)))

(declare-fun mapNonEmpty!1753 () Bool)

(declare-fun tp!4804 () Bool)

(assert (=> mapNonEmpty!1753 (= mapRes!1753 (and tp!4804 e!20600))))

(declare-fun mapValue!1753 () ValueCell!540)

(declare-fun mapKey!1753 () (_ BitVec 32))

(declare-fun mapRest!1753 () (Array (_ BitVec 32) ValueCell!540))

(assert (=> mapNonEmpty!1753 (= mapRest!1747 (store mapRest!1753 mapKey!1753 mapValue!1753))))

(assert (= (and mapNonEmpty!1747 condMapEmpty!1753) mapIsEmpty!1753))

(assert (= (and mapNonEmpty!1747 (not condMapEmpty!1753)) mapNonEmpty!1753))

(assert (= (and mapNonEmpty!1753 ((_ is ValueCellFull!540) mapValue!1753)) b!32406))

(assert (= (and mapNonEmpty!1747 ((_ is ValueCellFull!540) mapDefault!1753)) b!32407))

(declare-fun m!25939 () Bool)

(assert (=> mapNonEmpty!1753 m!25939))

(declare-fun b_lambda!1697 () Bool)

(assert (= b_lambda!1695 (or (and start!4220 b_free!1125) b_lambda!1697)))

(check-sat (not b!32397) (not d!5077) (not b!32351) (not bm!2604) (not b!32347) (not b!32398) (not b!32385) (not b!32358) (not b!32364) (not bm!2612) (not b_lambda!1697) (not b!32292) (not b!32344) (not b!32386) (not bm!2603) (not b_next!1125) (not b!32361) (not b!32301) b_and!1939 (not bm!2609) (not mapNonEmpty!1753) (not d!5079) (not b!32372) (not b!32353) (not b!32387) (not b!32354) tp_is_empty!1479 (not bm!2601) (not bm!2602) (not b!32299))
(check-sat b_and!1939 (not b_next!1125))
