; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108566 () Bool)

(assert start!108566)

(declare-fun b_free!28113 () Bool)

(declare-fun b_next!28113 () Bool)

(assert (=> start!108566 (= b_free!28113 (not b_next!28113))))

(declare-fun tp!99449 () Bool)

(declare-fun b_and!46173 () Bool)

(assert (=> start!108566 (= tp!99449 b_and!46173)))

(declare-fun b!1281618 () Bool)

(declare-fun e!732237 () Bool)

(declare-datatypes ((array!84576 0))(
  ( (array!84577 (arr!40792 (Array (_ BitVec 32) (_ BitVec 64))) (size!41342 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84576)

(assert (=> b!1281618 (= e!732237 (bvslt (size!41342 _keys!1741) #b01111111111111111111111111111111))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!84576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1281618 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144))))

(declare-datatypes ((V!50107 0))(
  ( (V!50108 (val!16951 Int)) )
))
(declare-fun minValue!1387 () V!50107)

(declare-fun zeroValue!1387 () V!50107)

(declare-datatypes ((ValueCell!15978 0))(
  ( (ValueCellFull!15978 (v!19551 V!50107)) (EmptyCell!15978) )
))
(declare-datatypes ((array!84578 0))(
  ( (array!84579 (arr!40793 (Array (_ BitVec 32) ValueCell!15978)) (size!41343 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84578)

(declare-datatypes ((Unit!42451 0))(
  ( (Unit!42452) )
))
(declare-fun lt!576266 () Unit!42451)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!637 (array!84576 array!84578 (_ BitVec 32) (_ BitVec 32) V!50107 V!50107 (_ BitVec 64) (_ BitVec 32) Int) Unit!42451)

(assert (=> b!1281618 (= lt!576266 (lemmaListMapContainsThenArrayContainsFrom!637 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun mapNonEmpty!52181 () Bool)

(declare-fun mapRes!52181 () Bool)

(declare-fun tp!99448 () Bool)

(declare-fun e!732234 () Bool)

(assert (=> mapNonEmpty!52181 (= mapRes!52181 (and tp!99448 e!732234))))

(declare-fun mapRest!52181 () (Array (_ BitVec 32) ValueCell!15978))

(declare-fun mapValue!52181 () ValueCell!15978)

(declare-fun mapKey!52181 () (_ BitVec 32))

(assert (=> mapNonEmpty!52181 (= (arr!40793 _values!1445) (store mapRest!52181 mapKey!52181 mapValue!52181))))

(declare-fun b!1281619 () Bool)

(declare-fun res!851366 () Bool)

(declare-fun e!732236 () Bool)

(assert (=> b!1281619 (=> (not res!851366) (not e!732236))))

(declare-datatypes ((tuple2!21708 0))(
  ( (tuple2!21709 (_1!10865 (_ BitVec 64)) (_2!10865 V!50107)) )
))
(declare-datatypes ((List!28899 0))(
  ( (Nil!28896) (Cons!28895 (h!30104 tuple2!21708) (t!42439 List!28899)) )
))
(declare-datatypes ((ListLongMap!19365 0))(
  ( (ListLongMap!19366 (toList!9698 List!28899)) )
))
(declare-fun contains!7813 (ListLongMap!19365 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4782 (array!84576 array!84578 (_ BitVec 32) (_ BitVec 32) V!50107 V!50107 (_ BitVec 32) Int) ListLongMap!19365)

(assert (=> b!1281619 (= res!851366 (contains!7813 (getCurrentListMap!4782 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1281620 () Bool)

(declare-fun res!851370 () Bool)

(assert (=> b!1281620 (=> (not res!851370) (not e!732236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84576 (_ BitVec 32)) Bool)

(assert (=> b!1281620 (= res!851370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1281621 () Bool)

(declare-fun res!851367 () Bool)

(assert (=> b!1281621 (=> (not res!851367) (not e!732236))))

(assert (=> b!1281621 (= res!851367 (and (= (size!41343 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41342 _keys!1741) (size!41343 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!851372 () Bool)

(assert (=> start!108566 (=> (not res!851372) (not e!732236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108566 (= res!851372 (validMask!0 mask!2175))))

(assert (=> start!108566 e!732236))

(declare-fun tp_is_empty!33753 () Bool)

(assert (=> start!108566 tp_is_empty!33753))

(assert (=> start!108566 true))

(declare-fun e!732238 () Bool)

(declare-fun array_inv!30953 (array!84578) Bool)

(assert (=> start!108566 (and (array_inv!30953 _values!1445) e!732238)))

(declare-fun array_inv!30954 (array!84576) Bool)

(assert (=> start!108566 (array_inv!30954 _keys!1741)))

(assert (=> start!108566 tp!99449))

(declare-fun b!1281622 () Bool)

(assert (=> b!1281622 (= e!732234 tp_is_empty!33753)))

(declare-fun mapIsEmpty!52181 () Bool)

(assert (=> mapIsEmpty!52181 mapRes!52181))

(declare-fun b!1281623 () Bool)

(declare-fun res!851369 () Bool)

(assert (=> b!1281623 (=> (not res!851369) (not e!732236))))

(declare-datatypes ((List!28900 0))(
  ( (Nil!28897) (Cons!28896 (h!30105 (_ BitVec 64)) (t!42440 List!28900)) )
))
(declare-fun arrayNoDuplicates!0 (array!84576 (_ BitVec 32) List!28900) Bool)

(assert (=> b!1281623 (= res!851369 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28897))))

(declare-fun b!1281624 () Bool)

(declare-fun e!732239 () Bool)

(assert (=> b!1281624 (= e!732238 (and e!732239 mapRes!52181))))

(declare-fun condMapEmpty!52181 () Bool)

(declare-fun mapDefault!52181 () ValueCell!15978)

(assert (=> b!1281624 (= condMapEmpty!52181 (= (arr!40793 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15978)) mapDefault!52181)))))

(declare-fun b!1281625 () Bool)

(assert (=> b!1281625 (= e!732236 (not e!732237))))

(declare-fun res!851371 () Bool)

(assert (=> b!1281625 (=> res!851371 e!732237)))

(assert (=> b!1281625 (= res!851371 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000))))

(assert (=> b!1281625 (contains!7813 (getCurrentListMap!4782 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-fun lt!576265 () Unit!42451)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!30 (array!84576 array!84578 (_ BitVec 32) (_ BitVec 32) V!50107 V!50107 (_ BitVec 64) (_ BitVec 32) Int) Unit!42451)

(assert (=> b!1281625 (= lt!576265 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!30 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1281626 () Bool)

(declare-fun res!851365 () Bool)

(assert (=> b!1281626 (=> (not res!851365) (not e!732236))))

(assert (=> b!1281626 (= res!851365 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41342 _keys!1741)) (not (= (select (arr!40792 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1281627 () Bool)

(declare-fun res!851368 () Bool)

(assert (=> b!1281627 (=> (not res!851368) (not e!732236))))

(assert (=> b!1281627 (= res!851368 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41342 _keys!1741))))))

(declare-fun b!1281628 () Bool)

(assert (=> b!1281628 (= e!732239 tp_is_empty!33753)))

(assert (= (and start!108566 res!851372) b!1281621))

(assert (= (and b!1281621 res!851367) b!1281620))

(assert (= (and b!1281620 res!851370) b!1281623))

(assert (= (and b!1281623 res!851369) b!1281627))

(assert (= (and b!1281627 res!851368) b!1281619))

(assert (= (and b!1281619 res!851366) b!1281626))

(assert (= (and b!1281626 res!851365) b!1281625))

(assert (= (and b!1281625 (not res!851371)) b!1281618))

(assert (= (and b!1281624 condMapEmpty!52181) mapIsEmpty!52181))

(assert (= (and b!1281624 (not condMapEmpty!52181)) mapNonEmpty!52181))

(get-info :version)

(assert (= (and mapNonEmpty!52181 ((_ is ValueCellFull!15978) mapValue!52181)) b!1281622))

(assert (= (and b!1281624 ((_ is ValueCellFull!15978) mapDefault!52181)) b!1281628))

(assert (= start!108566 b!1281624))

(declare-fun m!1176009 () Bool)

(assert (=> b!1281626 m!1176009))

(declare-fun m!1176011 () Bool)

(assert (=> b!1281625 m!1176011))

(assert (=> b!1281625 m!1176011))

(declare-fun m!1176013 () Bool)

(assert (=> b!1281625 m!1176013))

(declare-fun m!1176015 () Bool)

(assert (=> b!1281625 m!1176015))

(declare-fun m!1176017 () Bool)

(assert (=> start!108566 m!1176017))

(declare-fun m!1176019 () Bool)

(assert (=> start!108566 m!1176019))

(declare-fun m!1176021 () Bool)

(assert (=> start!108566 m!1176021))

(declare-fun m!1176023 () Bool)

(assert (=> b!1281618 m!1176023))

(declare-fun m!1176025 () Bool)

(assert (=> b!1281618 m!1176025))

(declare-fun m!1176027 () Bool)

(assert (=> b!1281623 m!1176027))

(declare-fun m!1176029 () Bool)

(assert (=> b!1281619 m!1176029))

(assert (=> b!1281619 m!1176029))

(declare-fun m!1176031 () Bool)

(assert (=> b!1281619 m!1176031))

(declare-fun m!1176033 () Bool)

(assert (=> b!1281620 m!1176033))

(declare-fun m!1176035 () Bool)

(assert (=> mapNonEmpty!52181 m!1176035))

(check-sat (not b!1281623) (not b!1281618) (not b_next!28113) (not mapNonEmpty!52181) (not b!1281619) (not start!108566) (not b!1281620) tp_is_empty!33753 b_and!46173 (not b!1281625))
(check-sat b_and!46173 (not b_next!28113))
(get-model)

(declare-fun d!140643 () Bool)

(assert (=> d!140643 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!108566 d!140643))

(declare-fun d!140645 () Bool)

(assert (=> d!140645 (= (array_inv!30953 _values!1445) (bvsge (size!41343 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!108566 d!140645))

(declare-fun d!140647 () Bool)

(assert (=> d!140647 (= (array_inv!30954 _keys!1741) (bvsge (size!41342 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!108566 d!140647))

(declare-fun d!140649 () Bool)

(declare-fun res!851401 () Bool)

(declare-fun e!732262 () Bool)

(assert (=> d!140649 (=> res!851401 e!732262)))

(assert (=> d!140649 (= res!851401 (= (select (arr!40792 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)) k0!1205))))

(assert (=> d!140649 (= (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144)) e!732262)))

(declare-fun b!1281666 () Bool)

(declare-fun e!732263 () Bool)

(assert (=> b!1281666 (= e!732262 e!732263)))

(declare-fun res!851402 () Bool)

(assert (=> b!1281666 (=> (not res!851402) (not e!732263))))

(assert (=> b!1281666 (= res!851402 (bvslt (bvadd #b00000000000000000000000000000001 from!2144 #b00000000000000000000000000000001) (size!41342 _keys!1741)))))

(declare-fun b!1281667 () Bool)

(assert (=> b!1281667 (= e!732263 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144 #b00000000000000000000000000000001)))))

(assert (= (and d!140649 (not res!851401)) b!1281666))

(assert (= (and b!1281666 res!851402) b!1281667))

(declare-fun m!1176065 () Bool)

(assert (=> d!140649 m!1176065))

(declare-fun m!1176067 () Bool)

(assert (=> b!1281667 m!1176067))

(assert (=> b!1281618 d!140649))

(declare-fun d!140651 () Bool)

(declare-fun e!732266 () Bool)

(assert (=> d!140651 e!732266))

(declare-fun c!124041 () Bool)

(assert (=> d!140651 (= c!124041 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!576275 () Unit!42451)

(declare-fun choose!1897 (array!84576 array!84578 (_ BitVec 32) (_ BitVec 32) V!50107 V!50107 (_ BitVec 64) (_ BitVec 32) Int) Unit!42451)

(assert (=> d!140651 (= lt!576275 (choose!1897 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(assert (=> d!140651 (validMask!0 mask!2175)))

(assert (=> d!140651 (= (lemmaListMapContainsThenArrayContainsFrom!637 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) lt!576275)))

(declare-fun b!1281672 () Bool)

(assert (=> b!1281672 (= e!732266 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144)))))

(declare-fun b!1281673 () Bool)

(assert (=> b!1281673 (= e!732266 (ite (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!140651 c!124041) b!1281672))

(assert (= (and d!140651 (not c!124041)) b!1281673))

(declare-fun m!1176069 () Bool)

(assert (=> d!140651 m!1176069))

(assert (=> d!140651 m!1176017))

(assert (=> b!1281672 m!1176023))

(assert (=> b!1281618 d!140651))

(declare-fun d!140653 () Bool)

(declare-fun e!732272 () Bool)

(assert (=> d!140653 e!732272))

(declare-fun res!851405 () Bool)

(assert (=> d!140653 (=> res!851405 e!732272)))

(declare-fun lt!576284 () Bool)

(assert (=> d!140653 (= res!851405 (not lt!576284))))

(declare-fun lt!576285 () Bool)

(assert (=> d!140653 (= lt!576284 lt!576285)))

(declare-fun lt!576287 () Unit!42451)

(declare-fun e!732271 () Unit!42451)

(assert (=> d!140653 (= lt!576287 e!732271)))

(declare-fun c!124044 () Bool)

(assert (=> d!140653 (= c!124044 lt!576285)))

(declare-fun containsKey!714 (List!28899 (_ BitVec 64)) Bool)

(assert (=> d!140653 (= lt!576285 (containsKey!714 (toList!9698 (getCurrentListMap!4782 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!140653 (= (contains!7813 (getCurrentListMap!4782 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!576284)))

(declare-fun b!1281680 () Bool)

(declare-fun lt!576286 () Unit!42451)

(assert (=> b!1281680 (= e!732271 lt!576286)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!460 (List!28899 (_ BitVec 64)) Unit!42451)

(assert (=> b!1281680 (= lt!576286 (lemmaContainsKeyImpliesGetValueByKeyDefined!460 (toList!9698 (getCurrentListMap!4782 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-datatypes ((Option!744 0))(
  ( (Some!743 (v!19553 V!50107)) (None!742) )
))
(declare-fun isDefined!499 (Option!744) Bool)

(declare-fun getValueByKey!692 (List!28899 (_ BitVec 64)) Option!744)

(assert (=> b!1281680 (isDefined!499 (getValueByKey!692 (toList!9698 (getCurrentListMap!4782 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1281681 () Bool)

(declare-fun Unit!42453 () Unit!42451)

(assert (=> b!1281681 (= e!732271 Unit!42453)))

(declare-fun b!1281682 () Bool)

(assert (=> b!1281682 (= e!732272 (isDefined!499 (getValueByKey!692 (toList!9698 (getCurrentListMap!4782 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!140653 c!124044) b!1281680))

(assert (= (and d!140653 (not c!124044)) b!1281681))

(assert (= (and d!140653 (not res!851405)) b!1281682))

(declare-fun m!1176071 () Bool)

(assert (=> d!140653 m!1176071))

(declare-fun m!1176073 () Bool)

(assert (=> b!1281680 m!1176073))

(declare-fun m!1176075 () Bool)

(assert (=> b!1281680 m!1176075))

(assert (=> b!1281680 m!1176075))

(declare-fun m!1176077 () Bool)

(assert (=> b!1281680 m!1176077))

(assert (=> b!1281682 m!1176075))

(assert (=> b!1281682 m!1176075))

(assert (=> b!1281682 m!1176077))

(assert (=> b!1281619 d!140653))

(declare-fun call!62733 () ListLongMap!19365)

(declare-fun bm!62728 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5902 (array!84576 array!84578 (_ BitVec 32) (_ BitVec 32) V!50107 V!50107 (_ BitVec 32) Int) ListLongMap!19365)

(assert (=> bm!62728 (= call!62733 (getCurrentListMapNoExtraKeys!5902 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun bm!62729 () Bool)

(declare-fun call!62737 () Bool)

(declare-fun lt!576339 () ListLongMap!19365)

(assert (=> bm!62729 (= call!62737 (contains!7813 lt!576339 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1281725 () Bool)

(declare-fun e!732303 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1281725 (= e!732303 (validKeyInArray!0 (select (arr!40792 _keys!1741) from!2144)))))

(declare-fun b!1281726 () Bool)

(declare-fun e!732300 () ListLongMap!19365)

(declare-fun call!62731 () ListLongMap!19365)

(assert (=> b!1281726 (= e!732300 call!62731)))

(declare-fun call!62736 () ListLongMap!19365)

(declare-fun call!62735 () ListLongMap!19365)

(declare-fun c!124059 () Bool)

(declare-fun bm!62730 () Bool)

(declare-fun c!124058 () Bool)

(declare-fun +!4272 (ListLongMap!19365 tuple2!21708) ListLongMap!19365)

(assert (=> bm!62730 (= call!62735 (+!4272 (ite c!124058 call!62733 (ite c!124059 call!62736 call!62731)) (ite (or c!124058 c!124059) (tuple2!21709 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!21709 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1281727 () Bool)

(declare-fun e!732301 () Bool)

(declare-fun e!732302 () Bool)

(assert (=> b!1281727 (= e!732301 e!732302)))

(declare-fun res!851432 () Bool)

(declare-fun call!62734 () Bool)

(assert (=> b!1281727 (= res!851432 call!62734)))

(assert (=> b!1281727 (=> (not res!851432) (not e!732302))))

(declare-fun d!140655 () Bool)

(declare-fun e!732308 () Bool)

(assert (=> d!140655 e!732308))

(declare-fun res!851426 () Bool)

(assert (=> d!140655 (=> (not res!851426) (not e!732308))))

(assert (=> d!140655 (= res!851426 (or (bvsge from!2144 (size!41342 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41342 _keys!1741)))))))

(declare-fun lt!576336 () ListLongMap!19365)

(assert (=> d!140655 (= lt!576339 lt!576336)))

(declare-fun lt!576343 () Unit!42451)

(declare-fun e!732307 () Unit!42451)

(assert (=> d!140655 (= lt!576343 e!732307)))

(declare-fun c!124061 () Bool)

(declare-fun e!732310 () Bool)

(assert (=> d!140655 (= c!124061 e!732310)))

(declare-fun res!851430 () Bool)

(assert (=> d!140655 (=> (not res!851430) (not e!732310))))

(assert (=> d!140655 (= res!851430 (bvslt from!2144 (size!41342 _keys!1741)))))

(declare-fun e!732311 () ListLongMap!19365)

(assert (=> d!140655 (= lt!576336 e!732311)))

(assert (=> d!140655 (= c!124058 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!140655 (validMask!0 mask!2175)))

(assert (=> d!140655 (= (getCurrentListMap!4782 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!576339)))

(declare-fun bm!62731 () Bool)

(declare-fun call!62732 () ListLongMap!19365)

(assert (=> bm!62731 (= call!62732 call!62735)))

(declare-fun b!1281728 () Bool)

(declare-fun Unit!42454 () Unit!42451)

(assert (=> b!1281728 (= e!732307 Unit!42454)))

(declare-fun b!1281729 () Bool)

(declare-fun apply!1009 (ListLongMap!19365 (_ BitVec 64)) V!50107)

(assert (=> b!1281729 (= e!732302 (= (apply!1009 lt!576339 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1281730 () Bool)

(assert (=> b!1281730 (= e!732310 (validKeyInArray!0 (select (arr!40792 _keys!1741) from!2144)))))

(declare-fun b!1281731 () Bool)

(declare-fun e!732309 () ListLongMap!19365)

(assert (=> b!1281731 (= e!732309 call!62732)))

(declare-fun b!1281732 () Bool)

(assert (=> b!1281732 (= e!732300 call!62732)))

(declare-fun bm!62732 () Bool)

(assert (=> bm!62732 (= call!62731 call!62736)))

(declare-fun b!1281733 () Bool)

(declare-fun e!732306 () Bool)

(assert (=> b!1281733 (= e!732306 (not call!62737))))

(declare-fun b!1281734 () Bool)

(declare-fun e!732299 () Bool)

(assert (=> b!1281734 (= e!732299 (= (apply!1009 lt!576339 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1281735 () Bool)

(declare-fun e!732304 () Bool)

(declare-fun e!732305 () Bool)

(assert (=> b!1281735 (= e!732304 e!732305)))

(declare-fun res!851424 () Bool)

(assert (=> b!1281735 (=> (not res!851424) (not e!732305))))

(assert (=> b!1281735 (= res!851424 (contains!7813 lt!576339 (select (arr!40792 _keys!1741) from!2144)))))

(assert (=> b!1281735 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41342 _keys!1741)))))

(declare-fun b!1281736 () Bool)

(assert (=> b!1281736 (= e!732301 (not call!62734))))

(declare-fun b!1281737 () Bool)

(declare-fun res!851431 () Bool)

(assert (=> b!1281737 (=> (not res!851431) (not e!732308))))

(assert (=> b!1281737 (= res!851431 e!732304)))

(declare-fun res!851425 () Bool)

(assert (=> b!1281737 (=> res!851425 e!732304)))

(assert (=> b!1281737 (= res!851425 (not e!732303))))

(declare-fun res!851429 () Bool)

(assert (=> b!1281737 (=> (not res!851429) (not e!732303))))

(assert (=> b!1281737 (= res!851429 (bvslt from!2144 (size!41342 _keys!1741)))))

(declare-fun bm!62733 () Bool)

(assert (=> bm!62733 (= call!62736 call!62733)))

(declare-fun bm!62734 () Bool)

(assert (=> bm!62734 (= call!62734 (contains!7813 lt!576339 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1281738 () Bool)

(declare-fun res!851428 () Bool)

(assert (=> b!1281738 (=> (not res!851428) (not e!732308))))

(assert (=> b!1281738 (= res!851428 e!732306)))

(declare-fun c!124057 () Bool)

(assert (=> b!1281738 (= c!124057 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1281739 () Bool)

(declare-fun c!124060 () Bool)

(assert (=> b!1281739 (= c!124060 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1281739 (= e!732309 e!732300)))

(declare-fun b!1281740 () Bool)

(assert (=> b!1281740 (= e!732308 e!732301)))

(declare-fun c!124062 () Bool)

(assert (=> b!1281740 (= c!124062 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1281741 () Bool)

(assert (=> b!1281741 (= e!732311 (+!4272 call!62735 (tuple2!21709 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1281742 () Bool)

(declare-fun lt!576353 () Unit!42451)

(assert (=> b!1281742 (= e!732307 lt!576353)))

(declare-fun lt!576338 () ListLongMap!19365)

(assert (=> b!1281742 (= lt!576338 (getCurrentListMapNoExtraKeys!5902 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!576347 () (_ BitVec 64))

(assert (=> b!1281742 (= lt!576347 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576332 () (_ BitVec 64))

(assert (=> b!1281742 (= lt!576332 (select (arr!40792 _keys!1741) from!2144))))

(declare-fun lt!576335 () Unit!42451)

(declare-fun addStillContains!1097 (ListLongMap!19365 (_ BitVec 64) V!50107 (_ BitVec 64)) Unit!42451)

(assert (=> b!1281742 (= lt!576335 (addStillContains!1097 lt!576338 lt!576347 zeroValue!1387 lt!576332))))

(assert (=> b!1281742 (contains!7813 (+!4272 lt!576338 (tuple2!21709 lt!576347 zeroValue!1387)) lt!576332)))

(declare-fun lt!576350 () Unit!42451)

(assert (=> b!1281742 (= lt!576350 lt!576335)))

(declare-fun lt!576341 () ListLongMap!19365)

(assert (=> b!1281742 (= lt!576341 (getCurrentListMapNoExtraKeys!5902 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!576351 () (_ BitVec 64))

(assert (=> b!1281742 (= lt!576351 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576334 () (_ BitVec 64))

(assert (=> b!1281742 (= lt!576334 (select (arr!40792 _keys!1741) from!2144))))

(declare-fun lt!576340 () Unit!42451)

(declare-fun addApplyDifferent!551 (ListLongMap!19365 (_ BitVec 64) V!50107 (_ BitVec 64)) Unit!42451)

(assert (=> b!1281742 (= lt!576340 (addApplyDifferent!551 lt!576341 lt!576351 minValue!1387 lt!576334))))

(assert (=> b!1281742 (= (apply!1009 (+!4272 lt!576341 (tuple2!21709 lt!576351 minValue!1387)) lt!576334) (apply!1009 lt!576341 lt!576334))))

(declare-fun lt!576333 () Unit!42451)

(assert (=> b!1281742 (= lt!576333 lt!576340)))

(declare-fun lt!576352 () ListLongMap!19365)

(assert (=> b!1281742 (= lt!576352 (getCurrentListMapNoExtraKeys!5902 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!576349 () (_ BitVec 64))

(assert (=> b!1281742 (= lt!576349 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576337 () (_ BitVec 64))

(assert (=> b!1281742 (= lt!576337 (select (arr!40792 _keys!1741) from!2144))))

(declare-fun lt!576342 () Unit!42451)

(assert (=> b!1281742 (= lt!576342 (addApplyDifferent!551 lt!576352 lt!576349 zeroValue!1387 lt!576337))))

(assert (=> b!1281742 (= (apply!1009 (+!4272 lt!576352 (tuple2!21709 lt!576349 zeroValue!1387)) lt!576337) (apply!1009 lt!576352 lt!576337))))

(declare-fun lt!576348 () Unit!42451)

(assert (=> b!1281742 (= lt!576348 lt!576342)))

(declare-fun lt!576346 () ListLongMap!19365)

(assert (=> b!1281742 (= lt!576346 (getCurrentListMapNoExtraKeys!5902 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!576345 () (_ BitVec 64))

(assert (=> b!1281742 (= lt!576345 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576344 () (_ BitVec 64))

(assert (=> b!1281742 (= lt!576344 (select (arr!40792 _keys!1741) from!2144))))

(assert (=> b!1281742 (= lt!576353 (addApplyDifferent!551 lt!576346 lt!576345 minValue!1387 lt!576344))))

(assert (=> b!1281742 (= (apply!1009 (+!4272 lt!576346 (tuple2!21709 lt!576345 minValue!1387)) lt!576344) (apply!1009 lt!576346 lt!576344))))

(declare-fun b!1281743 () Bool)

(assert (=> b!1281743 (= e!732306 e!732299)))

(declare-fun res!851427 () Bool)

(assert (=> b!1281743 (= res!851427 call!62737)))

(assert (=> b!1281743 (=> (not res!851427) (not e!732299))))

(declare-fun b!1281744 () Bool)

(declare-fun get!20752 (ValueCell!15978 V!50107) V!50107)

(declare-fun dynLambda!3407 (Int (_ BitVec 64)) V!50107)

(assert (=> b!1281744 (= e!732305 (= (apply!1009 lt!576339 (select (arr!40792 _keys!1741) from!2144)) (get!20752 (select (arr!40793 _values!1445) from!2144) (dynLambda!3407 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1281744 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41343 _values!1445)))))

(assert (=> b!1281744 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41342 _keys!1741)))))

(declare-fun b!1281745 () Bool)

(assert (=> b!1281745 (= e!732311 e!732309)))

(assert (=> b!1281745 (= c!124059 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!140655 c!124058) b!1281741))

(assert (= (and d!140655 (not c!124058)) b!1281745))

(assert (= (and b!1281745 c!124059) b!1281731))

(assert (= (and b!1281745 (not c!124059)) b!1281739))

(assert (= (and b!1281739 c!124060) b!1281732))

(assert (= (and b!1281739 (not c!124060)) b!1281726))

(assert (= (or b!1281732 b!1281726) bm!62732))

(assert (= (or b!1281731 bm!62732) bm!62733))

(assert (= (or b!1281731 b!1281732) bm!62731))

(assert (= (or b!1281741 bm!62733) bm!62728))

(assert (= (or b!1281741 bm!62731) bm!62730))

(assert (= (and d!140655 res!851430) b!1281730))

(assert (= (and d!140655 c!124061) b!1281742))

(assert (= (and d!140655 (not c!124061)) b!1281728))

(assert (= (and d!140655 res!851426) b!1281737))

(assert (= (and b!1281737 res!851429) b!1281725))

(assert (= (and b!1281737 (not res!851425)) b!1281735))

(assert (= (and b!1281735 res!851424) b!1281744))

(assert (= (and b!1281737 res!851431) b!1281738))

(assert (= (and b!1281738 c!124057) b!1281743))

(assert (= (and b!1281738 (not c!124057)) b!1281733))

(assert (= (and b!1281743 res!851427) b!1281734))

(assert (= (or b!1281743 b!1281733) bm!62729))

(assert (= (and b!1281738 res!851428) b!1281740))

(assert (= (and b!1281740 c!124062) b!1281727))

(assert (= (and b!1281740 (not c!124062)) b!1281736))

(assert (= (and b!1281727 res!851432) b!1281729))

(assert (= (or b!1281727 b!1281736) bm!62734))

(declare-fun b_lambda!23095 () Bool)

(assert (=> (not b_lambda!23095) (not b!1281744)))

(declare-fun t!42442 () Bool)

(declare-fun tb!11345 () Bool)

(assert (=> (and start!108566 (= defaultEntry!1448 defaultEntry!1448) t!42442) tb!11345))

(declare-fun result!23685 () Bool)

(assert (=> tb!11345 (= result!23685 tp_is_empty!33753)))

(assert (=> b!1281744 t!42442))

(declare-fun b_and!46177 () Bool)

(assert (= b_and!46173 (and (=> t!42442 result!23685) b_and!46177)))

(declare-fun m!1176079 () Bool)

(assert (=> b!1281734 m!1176079))

(declare-fun m!1176081 () Bool)

(assert (=> bm!62729 m!1176081))

(assert (=> b!1281725 m!1176009))

(assert (=> b!1281725 m!1176009))

(declare-fun m!1176083 () Bool)

(assert (=> b!1281725 m!1176083))

(assert (=> b!1281730 m!1176009))

(assert (=> b!1281730 m!1176009))

(assert (=> b!1281730 m!1176083))

(declare-fun m!1176085 () Bool)

(assert (=> bm!62728 m!1176085))

(assert (=> d!140655 m!1176017))

(declare-fun m!1176087 () Bool)

(assert (=> bm!62730 m!1176087))

(declare-fun m!1176089 () Bool)

(assert (=> b!1281741 m!1176089))

(declare-fun m!1176091 () Bool)

(assert (=> bm!62734 m!1176091))

(declare-fun m!1176093 () Bool)

(assert (=> b!1281742 m!1176093))

(declare-fun m!1176095 () Bool)

(assert (=> b!1281742 m!1176095))

(declare-fun m!1176097 () Bool)

(assert (=> b!1281742 m!1176097))

(declare-fun m!1176099 () Bool)

(assert (=> b!1281742 m!1176099))

(declare-fun m!1176101 () Bool)

(assert (=> b!1281742 m!1176101))

(declare-fun m!1176103 () Bool)

(assert (=> b!1281742 m!1176103))

(declare-fun m!1176105 () Bool)

(assert (=> b!1281742 m!1176105))

(declare-fun m!1176107 () Bool)

(assert (=> b!1281742 m!1176107))

(assert (=> b!1281742 m!1176095))

(declare-fun m!1176109 () Bool)

(assert (=> b!1281742 m!1176109))

(declare-fun m!1176111 () Bool)

(assert (=> b!1281742 m!1176111))

(declare-fun m!1176113 () Bool)

(assert (=> b!1281742 m!1176113))

(assert (=> b!1281742 m!1176085))

(declare-fun m!1176115 () Bool)

(assert (=> b!1281742 m!1176115))

(assert (=> b!1281742 m!1176111))

(declare-fun m!1176117 () Bool)

(assert (=> b!1281742 m!1176117))

(declare-fun m!1176119 () Bool)

(assert (=> b!1281742 m!1176119))

(assert (=> b!1281742 m!1176117))

(declare-fun m!1176121 () Bool)

(assert (=> b!1281742 m!1176121))

(assert (=> b!1281742 m!1176103))

(assert (=> b!1281742 m!1176009))

(declare-fun m!1176123 () Bool)

(assert (=> b!1281729 m!1176123))

(assert (=> b!1281744 m!1176009))

(declare-fun m!1176125 () Bool)

(assert (=> b!1281744 m!1176125))

(declare-fun m!1176127 () Bool)

(assert (=> b!1281744 m!1176127))

(assert (=> b!1281744 m!1176009))

(declare-fun m!1176129 () Bool)

(assert (=> b!1281744 m!1176129))

(assert (=> b!1281744 m!1176129))

(assert (=> b!1281744 m!1176127))

(declare-fun m!1176131 () Bool)

(assert (=> b!1281744 m!1176131))

(assert (=> b!1281735 m!1176009))

(assert (=> b!1281735 m!1176009))

(declare-fun m!1176133 () Bool)

(assert (=> b!1281735 m!1176133))

(assert (=> b!1281619 d!140655))

(declare-fun d!140657 () Bool)

(declare-fun res!851440 () Bool)

(declare-fun e!732320 () Bool)

(assert (=> d!140657 (=> res!851440 e!732320)))

(assert (=> d!140657 (= res!851440 (bvsge #b00000000000000000000000000000000 (size!41342 _keys!1741)))))

(assert (=> d!140657 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28897) e!732320)))

(declare-fun b!1281758 () Bool)

(declare-fun e!732322 () Bool)

(declare-fun call!62740 () Bool)

(assert (=> b!1281758 (= e!732322 call!62740)))

(declare-fun b!1281759 () Bool)

(declare-fun e!732321 () Bool)

(assert (=> b!1281759 (= e!732321 e!732322)))

(declare-fun c!124065 () Bool)

(assert (=> b!1281759 (= c!124065 (validKeyInArray!0 (select (arr!40792 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!62737 () Bool)

(assert (=> bm!62737 (= call!62740 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124065 (Cons!28896 (select (arr!40792 _keys!1741) #b00000000000000000000000000000000) Nil!28897) Nil!28897)))))

(declare-fun b!1281760 () Bool)

(declare-fun e!732323 () Bool)

(declare-fun contains!7814 (List!28900 (_ BitVec 64)) Bool)

(assert (=> b!1281760 (= e!732323 (contains!7814 Nil!28897 (select (arr!40792 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1281761 () Bool)

(assert (=> b!1281761 (= e!732322 call!62740)))

(declare-fun b!1281762 () Bool)

(assert (=> b!1281762 (= e!732320 e!732321)))

(declare-fun res!851441 () Bool)

(assert (=> b!1281762 (=> (not res!851441) (not e!732321))))

(assert (=> b!1281762 (= res!851441 (not e!732323))))

(declare-fun res!851439 () Bool)

(assert (=> b!1281762 (=> (not res!851439) (not e!732323))))

(assert (=> b!1281762 (= res!851439 (validKeyInArray!0 (select (arr!40792 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!140657 (not res!851440)) b!1281762))

(assert (= (and b!1281762 res!851439) b!1281760))

(assert (= (and b!1281762 res!851441) b!1281759))

(assert (= (and b!1281759 c!124065) b!1281761))

(assert (= (and b!1281759 (not c!124065)) b!1281758))

(assert (= (or b!1281761 b!1281758) bm!62737))

(declare-fun m!1176135 () Bool)

(assert (=> b!1281759 m!1176135))

(assert (=> b!1281759 m!1176135))

(declare-fun m!1176137 () Bool)

(assert (=> b!1281759 m!1176137))

(assert (=> bm!62737 m!1176135))

(declare-fun m!1176139 () Bool)

(assert (=> bm!62737 m!1176139))

(assert (=> b!1281760 m!1176135))

(assert (=> b!1281760 m!1176135))

(declare-fun m!1176141 () Bool)

(assert (=> b!1281760 m!1176141))

(assert (=> b!1281762 m!1176135))

(assert (=> b!1281762 m!1176135))

(assert (=> b!1281762 m!1176137))

(assert (=> b!1281623 d!140657))

(declare-fun d!140659 () Bool)

(declare-fun e!732325 () Bool)

(assert (=> d!140659 e!732325))

(declare-fun res!851442 () Bool)

(assert (=> d!140659 (=> res!851442 e!732325)))

(declare-fun lt!576354 () Bool)

(assert (=> d!140659 (= res!851442 (not lt!576354))))

(declare-fun lt!576355 () Bool)

(assert (=> d!140659 (= lt!576354 lt!576355)))

(declare-fun lt!576357 () Unit!42451)

(declare-fun e!732324 () Unit!42451)

(assert (=> d!140659 (= lt!576357 e!732324)))

(declare-fun c!124066 () Bool)

(assert (=> d!140659 (= c!124066 lt!576355)))

(assert (=> d!140659 (= lt!576355 (containsKey!714 (toList!9698 (getCurrentListMap!4782 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448)) k0!1205))))

(assert (=> d!140659 (= (contains!7813 (getCurrentListMap!4782 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205) lt!576354)))

(declare-fun b!1281763 () Bool)

(declare-fun lt!576356 () Unit!42451)

(assert (=> b!1281763 (= e!732324 lt!576356)))

(assert (=> b!1281763 (= lt!576356 (lemmaContainsKeyImpliesGetValueByKeyDefined!460 (toList!9698 (getCurrentListMap!4782 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448)) k0!1205))))

(assert (=> b!1281763 (isDefined!499 (getValueByKey!692 (toList!9698 (getCurrentListMap!4782 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448)) k0!1205))))

(declare-fun b!1281764 () Bool)

(declare-fun Unit!42455 () Unit!42451)

(assert (=> b!1281764 (= e!732324 Unit!42455)))

(declare-fun b!1281765 () Bool)

(assert (=> b!1281765 (= e!732325 (isDefined!499 (getValueByKey!692 (toList!9698 (getCurrentListMap!4782 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448)) k0!1205)))))

(assert (= (and d!140659 c!124066) b!1281763))

(assert (= (and d!140659 (not c!124066)) b!1281764))

(assert (= (and d!140659 (not res!851442)) b!1281765))

(declare-fun m!1176143 () Bool)

(assert (=> d!140659 m!1176143))

(declare-fun m!1176145 () Bool)

(assert (=> b!1281763 m!1176145))

(declare-fun m!1176147 () Bool)

(assert (=> b!1281763 m!1176147))

(assert (=> b!1281763 m!1176147))

(declare-fun m!1176149 () Bool)

(assert (=> b!1281763 m!1176149))

(assert (=> b!1281765 m!1176147))

(assert (=> b!1281765 m!1176147))

(assert (=> b!1281765 m!1176149))

(assert (=> b!1281625 d!140659))

(declare-fun bm!62738 () Bool)

(declare-fun call!62743 () ListLongMap!19365)

(assert (=> bm!62738 (= call!62743 (getCurrentListMapNoExtraKeys!5902 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun bm!62739 () Bool)

(declare-fun call!62747 () Bool)

(declare-fun lt!576365 () ListLongMap!19365)

(assert (=> bm!62739 (= call!62747 (contains!7813 lt!576365 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1281766 () Bool)

(declare-fun e!732330 () Bool)

(assert (=> b!1281766 (= e!732330 (validKeyInArray!0 (select (arr!40792 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144))))))

(declare-fun b!1281767 () Bool)

(declare-fun e!732327 () ListLongMap!19365)

(declare-fun call!62741 () ListLongMap!19365)

(assert (=> b!1281767 (= e!732327 call!62741)))

(declare-fun c!124068 () Bool)

(declare-fun bm!62740 () Bool)

(declare-fun call!62746 () ListLongMap!19365)

(declare-fun c!124069 () Bool)

(declare-fun call!62745 () ListLongMap!19365)

(assert (=> bm!62740 (= call!62745 (+!4272 (ite c!124068 call!62743 (ite c!124069 call!62746 call!62741)) (ite (or c!124068 c!124069) (tuple2!21709 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!21709 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1281768 () Bool)

(declare-fun e!732328 () Bool)

(declare-fun e!732329 () Bool)

(assert (=> b!1281768 (= e!732328 e!732329)))

(declare-fun res!851451 () Bool)

(declare-fun call!62744 () Bool)

(assert (=> b!1281768 (= res!851451 call!62744)))

(assert (=> b!1281768 (=> (not res!851451) (not e!732329))))

(declare-fun d!140661 () Bool)

(declare-fun e!732335 () Bool)

(assert (=> d!140661 e!732335))

(declare-fun res!851445 () Bool)

(assert (=> d!140661 (=> (not res!851445) (not e!732335))))

(assert (=> d!140661 (= res!851445 (or (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41342 _keys!1741)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41342 _keys!1741)))))))

(declare-fun lt!576362 () ListLongMap!19365)

(assert (=> d!140661 (= lt!576365 lt!576362)))

(declare-fun lt!576369 () Unit!42451)

(declare-fun e!732334 () Unit!42451)

(assert (=> d!140661 (= lt!576369 e!732334)))

(declare-fun c!124071 () Bool)

(declare-fun e!732337 () Bool)

(assert (=> d!140661 (= c!124071 e!732337)))

(declare-fun res!851449 () Bool)

(assert (=> d!140661 (=> (not res!851449) (not e!732337))))

(assert (=> d!140661 (= res!851449 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41342 _keys!1741)))))

(declare-fun e!732338 () ListLongMap!19365)

(assert (=> d!140661 (= lt!576362 e!732338)))

(assert (=> d!140661 (= c!124068 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!140661 (validMask!0 mask!2175)))

(assert (=> d!140661 (= (getCurrentListMap!4782 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) lt!576365)))

(declare-fun bm!62741 () Bool)

(declare-fun call!62742 () ListLongMap!19365)

(assert (=> bm!62741 (= call!62742 call!62745)))

(declare-fun b!1281769 () Bool)

(declare-fun Unit!42456 () Unit!42451)

(assert (=> b!1281769 (= e!732334 Unit!42456)))

(declare-fun b!1281770 () Bool)

(assert (=> b!1281770 (= e!732329 (= (apply!1009 lt!576365 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1281771 () Bool)

(assert (=> b!1281771 (= e!732337 (validKeyInArray!0 (select (arr!40792 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144))))))

(declare-fun b!1281772 () Bool)

(declare-fun e!732336 () ListLongMap!19365)

(assert (=> b!1281772 (= e!732336 call!62742)))

(declare-fun b!1281773 () Bool)

(assert (=> b!1281773 (= e!732327 call!62742)))

(declare-fun bm!62742 () Bool)

(assert (=> bm!62742 (= call!62741 call!62746)))

(declare-fun b!1281774 () Bool)

(declare-fun e!732333 () Bool)

(assert (=> b!1281774 (= e!732333 (not call!62747))))

(declare-fun b!1281775 () Bool)

(declare-fun e!732326 () Bool)

(assert (=> b!1281775 (= e!732326 (= (apply!1009 lt!576365 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1281776 () Bool)

(declare-fun e!732331 () Bool)

(declare-fun e!732332 () Bool)

(assert (=> b!1281776 (= e!732331 e!732332)))

(declare-fun res!851443 () Bool)

(assert (=> b!1281776 (=> (not res!851443) (not e!732332))))

(assert (=> b!1281776 (= res!851443 (contains!7813 lt!576365 (select (arr!40792 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144))))))

(assert (=> b!1281776 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41342 _keys!1741)))))

(declare-fun b!1281777 () Bool)

(assert (=> b!1281777 (= e!732328 (not call!62744))))

(declare-fun b!1281778 () Bool)

(declare-fun res!851450 () Bool)

(assert (=> b!1281778 (=> (not res!851450) (not e!732335))))

(assert (=> b!1281778 (= res!851450 e!732331)))

(declare-fun res!851444 () Bool)

(assert (=> b!1281778 (=> res!851444 e!732331)))

(assert (=> b!1281778 (= res!851444 (not e!732330))))

(declare-fun res!851448 () Bool)

(assert (=> b!1281778 (=> (not res!851448) (not e!732330))))

(assert (=> b!1281778 (= res!851448 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41342 _keys!1741)))))

(declare-fun bm!62743 () Bool)

(assert (=> bm!62743 (= call!62746 call!62743)))

(declare-fun bm!62744 () Bool)

(assert (=> bm!62744 (= call!62744 (contains!7813 lt!576365 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1281779 () Bool)

(declare-fun res!851447 () Bool)

(assert (=> b!1281779 (=> (not res!851447) (not e!732335))))

(assert (=> b!1281779 (= res!851447 e!732333)))

(declare-fun c!124067 () Bool)

(assert (=> b!1281779 (= c!124067 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1281780 () Bool)

(declare-fun c!124070 () Bool)

(assert (=> b!1281780 (= c!124070 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1281780 (= e!732336 e!732327)))

(declare-fun b!1281781 () Bool)

(assert (=> b!1281781 (= e!732335 e!732328)))

(declare-fun c!124072 () Bool)

(assert (=> b!1281781 (= c!124072 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1281782 () Bool)

(assert (=> b!1281782 (= e!732338 (+!4272 call!62745 (tuple2!21709 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1281783 () Bool)

(declare-fun lt!576379 () Unit!42451)

(assert (=> b!1281783 (= e!732334 lt!576379)))

(declare-fun lt!576364 () ListLongMap!19365)

(assert (=> b!1281783 (= lt!576364 (getCurrentListMapNoExtraKeys!5902 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun lt!576373 () (_ BitVec 64))

(assert (=> b!1281783 (= lt!576373 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576358 () (_ BitVec 64))

(assert (=> b!1281783 (= lt!576358 (select (arr!40792 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)))))

(declare-fun lt!576361 () Unit!42451)

(assert (=> b!1281783 (= lt!576361 (addStillContains!1097 lt!576364 lt!576373 zeroValue!1387 lt!576358))))

(assert (=> b!1281783 (contains!7813 (+!4272 lt!576364 (tuple2!21709 lt!576373 zeroValue!1387)) lt!576358)))

(declare-fun lt!576376 () Unit!42451)

(assert (=> b!1281783 (= lt!576376 lt!576361)))

(declare-fun lt!576367 () ListLongMap!19365)

(assert (=> b!1281783 (= lt!576367 (getCurrentListMapNoExtraKeys!5902 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun lt!576377 () (_ BitVec 64))

(assert (=> b!1281783 (= lt!576377 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576360 () (_ BitVec 64))

(assert (=> b!1281783 (= lt!576360 (select (arr!40792 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)))))

(declare-fun lt!576366 () Unit!42451)

(assert (=> b!1281783 (= lt!576366 (addApplyDifferent!551 lt!576367 lt!576377 minValue!1387 lt!576360))))

(assert (=> b!1281783 (= (apply!1009 (+!4272 lt!576367 (tuple2!21709 lt!576377 minValue!1387)) lt!576360) (apply!1009 lt!576367 lt!576360))))

(declare-fun lt!576359 () Unit!42451)

(assert (=> b!1281783 (= lt!576359 lt!576366)))

(declare-fun lt!576378 () ListLongMap!19365)

(assert (=> b!1281783 (= lt!576378 (getCurrentListMapNoExtraKeys!5902 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun lt!576375 () (_ BitVec 64))

(assert (=> b!1281783 (= lt!576375 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576363 () (_ BitVec 64))

(assert (=> b!1281783 (= lt!576363 (select (arr!40792 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)))))

(declare-fun lt!576368 () Unit!42451)

(assert (=> b!1281783 (= lt!576368 (addApplyDifferent!551 lt!576378 lt!576375 zeroValue!1387 lt!576363))))

(assert (=> b!1281783 (= (apply!1009 (+!4272 lt!576378 (tuple2!21709 lt!576375 zeroValue!1387)) lt!576363) (apply!1009 lt!576378 lt!576363))))

(declare-fun lt!576374 () Unit!42451)

(assert (=> b!1281783 (= lt!576374 lt!576368)))

(declare-fun lt!576372 () ListLongMap!19365)

(assert (=> b!1281783 (= lt!576372 (getCurrentListMapNoExtraKeys!5902 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun lt!576371 () (_ BitVec 64))

(assert (=> b!1281783 (= lt!576371 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576370 () (_ BitVec 64))

(assert (=> b!1281783 (= lt!576370 (select (arr!40792 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)))))

(assert (=> b!1281783 (= lt!576379 (addApplyDifferent!551 lt!576372 lt!576371 minValue!1387 lt!576370))))

(assert (=> b!1281783 (= (apply!1009 (+!4272 lt!576372 (tuple2!21709 lt!576371 minValue!1387)) lt!576370) (apply!1009 lt!576372 lt!576370))))

(declare-fun b!1281784 () Bool)

(assert (=> b!1281784 (= e!732333 e!732326)))

(declare-fun res!851446 () Bool)

(assert (=> b!1281784 (= res!851446 call!62747)))

(assert (=> b!1281784 (=> (not res!851446) (not e!732326))))

(declare-fun b!1281785 () Bool)

(assert (=> b!1281785 (= e!732332 (= (apply!1009 lt!576365 (select (arr!40792 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144))) (get!20752 (select (arr!40793 _values!1445) (bvadd #b00000000000000000000000000000001 from!2144)) (dynLambda!3407 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1281785 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41343 _values!1445)))))

(assert (=> b!1281785 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41342 _keys!1741)))))

(declare-fun b!1281786 () Bool)

(assert (=> b!1281786 (= e!732338 e!732336)))

(assert (=> b!1281786 (= c!124069 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!140661 c!124068) b!1281782))

(assert (= (and d!140661 (not c!124068)) b!1281786))

(assert (= (and b!1281786 c!124069) b!1281772))

(assert (= (and b!1281786 (not c!124069)) b!1281780))

(assert (= (and b!1281780 c!124070) b!1281773))

(assert (= (and b!1281780 (not c!124070)) b!1281767))

(assert (= (or b!1281773 b!1281767) bm!62742))

(assert (= (or b!1281772 bm!62742) bm!62743))

(assert (= (or b!1281772 b!1281773) bm!62741))

(assert (= (or b!1281782 bm!62743) bm!62738))

(assert (= (or b!1281782 bm!62741) bm!62740))

(assert (= (and d!140661 res!851449) b!1281771))

(assert (= (and d!140661 c!124071) b!1281783))

(assert (= (and d!140661 (not c!124071)) b!1281769))

(assert (= (and d!140661 res!851445) b!1281778))

(assert (= (and b!1281778 res!851448) b!1281766))

(assert (= (and b!1281778 (not res!851444)) b!1281776))

(assert (= (and b!1281776 res!851443) b!1281785))

(assert (= (and b!1281778 res!851450) b!1281779))

(assert (= (and b!1281779 c!124067) b!1281784))

(assert (= (and b!1281779 (not c!124067)) b!1281774))

(assert (= (and b!1281784 res!851446) b!1281775))

(assert (= (or b!1281784 b!1281774) bm!62739))

(assert (= (and b!1281779 res!851447) b!1281781))

(assert (= (and b!1281781 c!124072) b!1281768))

(assert (= (and b!1281781 (not c!124072)) b!1281777))

(assert (= (and b!1281768 res!851451) b!1281770))

(assert (= (or b!1281768 b!1281777) bm!62744))

(declare-fun b_lambda!23097 () Bool)

(assert (=> (not b_lambda!23097) (not b!1281785)))

(assert (=> b!1281785 t!42442))

(declare-fun b_and!46179 () Bool)

(assert (= b_and!46177 (and (=> t!42442 result!23685) b_and!46179)))

(declare-fun m!1176151 () Bool)

(assert (=> b!1281775 m!1176151))

(declare-fun m!1176153 () Bool)

(assert (=> bm!62739 m!1176153))

(assert (=> b!1281766 m!1176065))

(assert (=> b!1281766 m!1176065))

(declare-fun m!1176155 () Bool)

(assert (=> b!1281766 m!1176155))

(assert (=> b!1281771 m!1176065))

(assert (=> b!1281771 m!1176065))

(assert (=> b!1281771 m!1176155))

(declare-fun m!1176157 () Bool)

(assert (=> bm!62738 m!1176157))

(assert (=> d!140661 m!1176017))

(declare-fun m!1176159 () Bool)

(assert (=> bm!62740 m!1176159))

(declare-fun m!1176161 () Bool)

(assert (=> b!1281782 m!1176161))

(declare-fun m!1176163 () Bool)

(assert (=> bm!62744 m!1176163))

(declare-fun m!1176165 () Bool)

(assert (=> b!1281783 m!1176165))

(declare-fun m!1176167 () Bool)

(assert (=> b!1281783 m!1176167))

(declare-fun m!1176169 () Bool)

(assert (=> b!1281783 m!1176169))

(declare-fun m!1176171 () Bool)

(assert (=> b!1281783 m!1176171))

(declare-fun m!1176173 () Bool)

(assert (=> b!1281783 m!1176173))

(declare-fun m!1176175 () Bool)

(assert (=> b!1281783 m!1176175))

(declare-fun m!1176177 () Bool)

(assert (=> b!1281783 m!1176177))

(declare-fun m!1176179 () Bool)

(assert (=> b!1281783 m!1176179))

(assert (=> b!1281783 m!1176167))

(declare-fun m!1176181 () Bool)

(assert (=> b!1281783 m!1176181))

(declare-fun m!1176183 () Bool)

(assert (=> b!1281783 m!1176183))

(declare-fun m!1176185 () Bool)

(assert (=> b!1281783 m!1176185))

(assert (=> b!1281783 m!1176157))

(declare-fun m!1176187 () Bool)

(assert (=> b!1281783 m!1176187))

(assert (=> b!1281783 m!1176183))

(declare-fun m!1176189 () Bool)

(assert (=> b!1281783 m!1176189))

(declare-fun m!1176191 () Bool)

(assert (=> b!1281783 m!1176191))

(assert (=> b!1281783 m!1176189))

(declare-fun m!1176193 () Bool)

(assert (=> b!1281783 m!1176193))

(assert (=> b!1281783 m!1176175))

(assert (=> b!1281783 m!1176065))

(declare-fun m!1176195 () Bool)

(assert (=> b!1281770 m!1176195))

(assert (=> b!1281785 m!1176065))

(declare-fun m!1176197 () Bool)

(assert (=> b!1281785 m!1176197))

(assert (=> b!1281785 m!1176127))

(assert (=> b!1281785 m!1176065))

(declare-fun m!1176199 () Bool)

(assert (=> b!1281785 m!1176199))

(assert (=> b!1281785 m!1176199))

(assert (=> b!1281785 m!1176127))

(declare-fun m!1176201 () Bool)

(assert (=> b!1281785 m!1176201))

(assert (=> b!1281776 m!1176065))

(assert (=> b!1281776 m!1176065))

(declare-fun m!1176203 () Bool)

(assert (=> b!1281776 m!1176203))

(assert (=> b!1281625 d!140661))

(declare-fun d!140663 () Bool)

(assert (=> d!140663 (contains!7813 (getCurrentListMap!4782 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448) k0!1205)))

(declare-fun lt!576382 () Unit!42451)

(declare-fun choose!1898 (array!84576 array!84578 (_ BitVec 32) (_ BitVec 32) V!50107 V!50107 (_ BitVec 64) (_ BitVec 32) Int) Unit!42451)

(assert (=> d!140663 (= lt!576382 (choose!1898 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(assert (=> d!140663 (validMask!0 mask!2175)))

(assert (=> d!140663 (= (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!30 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448) lt!576382)))

(declare-fun bs!36492 () Bool)

(assert (= bs!36492 d!140663))

(declare-fun m!1176205 () Bool)

(assert (=> bs!36492 m!1176205))

(assert (=> bs!36492 m!1176205))

(declare-fun m!1176207 () Bool)

(assert (=> bs!36492 m!1176207))

(declare-fun m!1176209 () Bool)

(assert (=> bs!36492 m!1176209))

(assert (=> bs!36492 m!1176017))

(assert (=> b!1281625 d!140663))

(declare-fun b!1281795 () Bool)

(declare-fun e!732346 () Bool)

(declare-fun call!62750 () Bool)

(assert (=> b!1281795 (= e!732346 call!62750)))

(declare-fun b!1281796 () Bool)

(declare-fun e!732347 () Bool)

(assert (=> b!1281796 (= e!732347 e!732346)))

(declare-fun c!124075 () Bool)

(assert (=> b!1281796 (= c!124075 (validKeyInArray!0 (select (arr!40792 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1281797 () Bool)

(declare-fun e!732345 () Bool)

(assert (=> b!1281797 (= e!732345 call!62750)))

(declare-fun b!1281798 () Bool)

(assert (=> b!1281798 (= e!732346 e!732345)))

(declare-fun lt!576389 () (_ BitVec 64))

(assert (=> b!1281798 (= lt!576389 (select (arr!40792 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!576390 () Unit!42451)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!84576 (_ BitVec 64) (_ BitVec 32)) Unit!42451)

(assert (=> b!1281798 (= lt!576390 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!576389 #b00000000000000000000000000000000))))

(assert (=> b!1281798 (arrayContainsKey!0 _keys!1741 lt!576389 #b00000000000000000000000000000000)))

(declare-fun lt!576391 () Unit!42451)

(assert (=> b!1281798 (= lt!576391 lt!576390)))

(declare-fun res!851456 () Bool)

(declare-datatypes ((SeekEntryResult!10012 0))(
  ( (MissingZero!10012 (index!42419 (_ BitVec 32))) (Found!10012 (index!42420 (_ BitVec 32))) (Intermediate!10012 (undefined!10824 Bool) (index!42421 (_ BitVec 32)) (x!113677 (_ BitVec 32))) (Undefined!10012) (MissingVacant!10012 (index!42422 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!84576 (_ BitVec 32)) SeekEntryResult!10012)

(assert (=> b!1281798 (= res!851456 (= (seekEntryOrOpen!0 (select (arr!40792 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10012 #b00000000000000000000000000000000)))))

(assert (=> b!1281798 (=> (not res!851456) (not e!732345))))

(declare-fun d!140665 () Bool)

(declare-fun res!851457 () Bool)

(assert (=> d!140665 (=> res!851457 e!732347)))

(assert (=> d!140665 (= res!851457 (bvsge #b00000000000000000000000000000000 (size!41342 _keys!1741)))))

(assert (=> d!140665 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!732347)))

(declare-fun bm!62747 () Bool)

(assert (=> bm!62747 (= call!62750 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(assert (= (and d!140665 (not res!851457)) b!1281796))

(assert (= (and b!1281796 c!124075) b!1281798))

(assert (= (and b!1281796 (not c!124075)) b!1281795))

(assert (= (and b!1281798 res!851456) b!1281797))

(assert (= (or b!1281797 b!1281795) bm!62747))

(assert (=> b!1281796 m!1176135))

(assert (=> b!1281796 m!1176135))

(assert (=> b!1281796 m!1176137))

(assert (=> b!1281798 m!1176135))

(declare-fun m!1176211 () Bool)

(assert (=> b!1281798 m!1176211))

(declare-fun m!1176213 () Bool)

(assert (=> b!1281798 m!1176213))

(assert (=> b!1281798 m!1176135))

(declare-fun m!1176215 () Bool)

(assert (=> b!1281798 m!1176215))

(declare-fun m!1176217 () Bool)

(assert (=> bm!62747 m!1176217))

(assert (=> b!1281620 d!140665))

(declare-fun condMapEmpty!52187 () Bool)

(declare-fun mapDefault!52187 () ValueCell!15978)

(assert (=> mapNonEmpty!52181 (= condMapEmpty!52187 (= mapRest!52181 ((as const (Array (_ BitVec 32) ValueCell!15978)) mapDefault!52187)))))

(declare-fun e!732352 () Bool)

(declare-fun mapRes!52187 () Bool)

(assert (=> mapNonEmpty!52181 (= tp!99448 (and e!732352 mapRes!52187))))

(declare-fun b!1281806 () Bool)

(assert (=> b!1281806 (= e!732352 tp_is_empty!33753)))

(declare-fun mapNonEmpty!52187 () Bool)

(declare-fun tp!99458 () Bool)

(declare-fun e!732353 () Bool)

(assert (=> mapNonEmpty!52187 (= mapRes!52187 (and tp!99458 e!732353))))

(declare-fun mapValue!52187 () ValueCell!15978)

(declare-fun mapKey!52187 () (_ BitVec 32))

(declare-fun mapRest!52187 () (Array (_ BitVec 32) ValueCell!15978))

(assert (=> mapNonEmpty!52187 (= mapRest!52181 (store mapRest!52187 mapKey!52187 mapValue!52187))))

(declare-fun b!1281805 () Bool)

(assert (=> b!1281805 (= e!732353 tp_is_empty!33753)))

(declare-fun mapIsEmpty!52187 () Bool)

(assert (=> mapIsEmpty!52187 mapRes!52187))

(assert (= (and mapNonEmpty!52181 condMapEmpty!52187) mapIsEmpty!52187))

(assert (= (and mapNonEmpty!52181 (not condMapEmpty!52187)) mapNonEmpty!52187))

(assert (= (and mapNonEmpty!52187 ((_ is ValueCellFull!15978) mapValue!52187)) b!1281805))

(assert (= (and mapNonEmpty!52181 ((_ is ValueCellFull!15978) mapDefault!52187)) b!1281806))

(declare-fun m!1176219 () Bool)

(assert (=> mapNonEmpty!52187 m!1176219))

(declare-fun b_lambda!23099 () Bool)

(assert (= b_lambda!23095 (or (and start!108566 b_free!28113) b_lambda!23099)))

(declare-fun b_lambda!23101 () Bool)

(assert (= b_lambda!23097 (or (and start!108566 b_free!28113) b_lambda!23101)))

(check-sat (not bm!62734) (not b!1281742) (not b!1281730) (not b!1281766) (not bm!62730) (not b!1281765) (not b!1281725) (not bm!62737) (not b_lambda!23101) (not b!1281783) (not b_lambda!23099) (not b!1281762) b_and!46179 (not b!1281782) (not d!140661) (not b!1281682) (not mapNonEmpty!52187) (not d!140659) (not b!1281734) (not bm!62747) (not b_next!28113) (not b!1281770) (not b!1281735) (not b!1281785) (not b!1281771) (not bm!62729) (not bm!62728) (not b!1281667) (not b!1281680) (not b!1281775) (not b!1281763) (not b!1281729) (not bm!62744) (not bm!62739) (not bm!62738) (not b!1281672) (not b!1281776) (not b!1281798) (not d!140651) (not bm!62740) (not d!140653) (not d!140663) (not b!1281759) (not b!1281760) tp_is_empty!33753 (not b!1281796) (not b!1281744) (not b!1281741) (not d!140655))
(check-sat b_and!46179 (not b_next!28113))
