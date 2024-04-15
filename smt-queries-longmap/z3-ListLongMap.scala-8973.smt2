; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108564 () Bool)

(assert start!108564)

(declare-fun b_free!28111 () Bool)

(declare-fun b_next!28111 () Bool)

(assert (=> start!108564 (= b_free!28111 (not b_next!28111))))

(declare-fun tp!99443 () Bool)

(declare-fun b_and!46153 () Bool)

(assert (=> start!108564 (= tp!99443 b_and!46153)))

(declare-fun b!1281521 () Bool)

(declare-fun e!732187 () Bool)

(declare-fun tp_is_empty!33751 () Bool)

(assert (=> b!1281521 (= e!732187 tp_is_empty!33751)))

(declare-fun b!1281522 () Bool)

(declare-fun e!732190 () Bool)

(declare-fun mapRes!52178 () Bool)

(assert (=> b!1281522 (= e!732190 (and e!732187 mapRes!52178))))

(declare-fun condMapEmpty!52178 () Bool)

(declare-datatypes ((V!50105 0))(
  ( (V!50106 (val!16950 Int)) )
))
(declare-datatypes ((ValueCell!15977 0))(
  ( (ValueCellFull!15977 (v!19549 V!50105)) (EmptyCell!15977) )
))
(declare-datatypes ((array!84467 0))(
  ( (array!84468 (arr!40738 (Array (_ BitVec 32) ValueCell!15977)) (size!41290 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84467)

(declare-fun mapDefault!52178 () ValueCell!15977)

(assert (=> b!1281522 (= condMapEmpty!52178 (= (arr!40738 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15977)) mapDefault!52178)))))

(declare-fun b!1281523 () Bool)

(declare-fun res!851320 () Bool)

(declare-fun e!732192 () Bool)

(assert (=> b!1281523 (=> (not res!851320) (not e!732192))))

(declare-datatypes ((array!84469 0))(
  ( (array!84470 (arr!40739 (Array (_ BitVec 32) (_ BitVec 64))) (size!41291 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84469)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84469 (_ BitVec 32)) Bool)

(assert (=> b!1281523 (= res!851320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1281524 () Bool)

(declare-fun e!732191 () Bool)

(assert (=> b!1281524 (= e!732192 (not e!732191))))

(declare-fun res!851321 () Bool)

(assert (=> b!1281524 (=> res!851321 e!732191)))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1281524 (= res!851321 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000))))

(declare-fun minValue!1387 () V!50105)

(declare-fun zeroValue!1387 () V!50105)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21776 0))(
  ( (tuple2!21777 (_1!10899 (_ BitVec 64)) (_2!10899 V!50105)) )
))
(declare-datatypes ((List!28964 0))(
  ( (Nil!28961) (Cons!28960 (h!30169 tuple2!21776) (t!42496 List!28964)) )
))
(declare-datatypes ((ListLongMap!19433 0))(
  ( (ListLongMap!19434 (toList!9732 List!28964)) )
))
(declare-fun contains!7777 (ListLongMap!19433 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4706 (array!84469 array!84467 (_ BitVec 32) (_ BitVec 32) V!50105 V!50105 (_ BitVec 32) Int) ListLongMap!19433)

(assert (=> b!1281524 (contains!7777 (getCurrentListMap!4706 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42287 0))(
  ( (Unit!42288) )
))
(declare-fun lt!576082 () Unit!42287)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!24 (array!84469 array!84467 (_ BitVec 32) (_ BitVec 32) V!50105 V!50105 (_ BitVec 64) (_ BitVec 32) Int) Unit!42287)

(assert (=> b!1281524 (= lt!576082 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!24 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!52178 () Bool)

(assert (=> mapIsEmpty!52178 mapRes!52178))

(declare-fun b!1281525 () Bool)

(declare-fun res!851317 () Bool)

(assert (=> b!1281525 (=> (not res!851317) (not e!732192))))

(assert (=> b!1281525 (= res!851317 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41291 _keys!1741)) (not (= (select (arr!40739 _keys!1741) from!2144) k0!1205))))))

(declare-fun res!851316 () Bool)

(assert (=> start!108564 (=> (not res!851316) (not e!732192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108564 (= res!851316 (validMask!0 mask!2175))))

(assert (=> start!108564 e!732192))

(assert (=> start!108564 tp_is_empty!33751))

(assert (=> start!108564 true))

(declare-fun array_inv!31071 (array!84467) Bool)

(assert (=> start!108564 (and (array_inv!31071 _values!1445) e!732190)))

(declare-fun array_inv!31072 (array!84469) Bool)

(assert (=> start!108564 (array_inv!31072 _keys!1741)))

(assert (=> start!108564 tp!99443))

(declare-fun mapNonEmpty!52178 () Bool)

(declare-fun tp!99444 () Bool)

(declare-fun e!732189 () Bool)

(assert (=> mapNonEmpty!52178 (= mapRes!52178 (and tp!99444 e!732189))))

(declare-fun mapRest!52178 () (Array (_ BitVec 32) ValueCell!15977))

(declare-fun mapValue!52178 () ValueCell!15977)

(declare-fun mapKey!52178 () (_ BitVec 32))

(assert (=> mapNonEmpty!52178 (= (arr!40738 _values!1445) (store mapRest!52178 mapKey!52178 mapValue!52178))))

(declare-fun b!1281526 () Bool)

(declare-fun res!851319 () Bool)

(assert (=> b!1281526 (=> (not res!851319) (not e!732192))))

(assert (=> b!1281526 (= res!851319 (contains!7777 (getCurrentListMap!4706 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1281527 () Bool)

(declare-fun res!851315 () Bool)

(assert (=> b!1281527 (=> (not res!851315) (not e!732192))))

(assert (=> b!1281527 (= res!851315 (and (= (size!41290 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41291 _keys!1741) (size!41290 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281528 () Bool)

(assert (=> b!1281528 (= e!732191 (bvslt (size!41291 _keys!1741) #b01111111111111111111111111111111))))

(declare-fun arrayContainsKey!0 (array!84469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1281528 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144))))

(declare-fun lt!576081 () Unit!42287)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!626 (array!84469 array!84467 (_ BitVec 32) (_ BitVec 32) V!50105 V!50105 (_ BitVec 64) (_ BitVec 32) Int) Unit!42287)

(assert (=> b!1281528 (= lt!576081 (lemmaListMapContainsThenArrayContainsFrom!626 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun b!1281529 () Bool)

(declare-fun res!851314 () Bool)

(assert (=> b!1281529 (=> (not res!851314) (not e!732192))))

(declare-datatypes ((List!28965 0))(
  ( (Nil!28962) (Cons!28961 (h!30170 (_ BitVec 64)) (t!42497 List!28965)) )
))
(declare-fun arrayNoDuplicates!0 (array!84469 (_ BitVec 32) List!28965) Bool)

(assert (=> b!1281529 (= res!851314 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28962))))

(declare-fun b!1281530 () Bool)

(declare-fun res!851318 () Bool)

(assert (=> b!1281530 (=> (not res!851318) (not e!732192))))

(assert (=> b!1281530 (= res!851318 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41291 _keys!1741))))))

(declare-fun b!1281531 () Bool)

(assert (=> b!1281531 (= e!732189 tp_is_empty!33751)))

(assert (= (and start!108564 res!851316) b!1281527))

(assert (= (and b!1281527 res!851315) b!1281523))

(assert (= (and b!1281523 res!851320) b!1281529))

(assert (= (and b!1281529 res!851314) b!1281530))

(assert (= (and b!1281530 res!851318) b!1281526))

(assert (= (and b!1281526 res!851319) b!1281525))

(assert (= (and b!1281525 res!851317) b!1281524))

(assert (= (and b!1281524 (not res!851321)) b!1281528))

(assert (= (and b!1281522 condMapEmpty!52178) mapIsEmpty!52178))

(assert (= (and b!1281522 (not condMapEmpty!52178)) mapNonEmpty!52178))

(get-info :version)

(assert (= (and mapNonEmpty!52178 ((_ is ValueCellFull!15977) mapValue!52178)) b!1281531))

(assert (= (and b!1281522 ((_ is ValueCellFull!15977) mapDefault!52178)) b!1281521))

(assert (= start!108564 b!1281522))

(declare-fun m!1175481 () Bool)

(assert (=> start!108564 m!1175481))

(declare-fun m!1175483 () Bool)

(assert (=> start!108564 m!1175483))

(declare-fun m!1175485 () Bool)

(assert (=> start!108564 m!1175485))

(declare-fun m!1175487 () Bool)

(assert (=> b!1281526 m!1175487))

(assert (=> b!1281526 m!1175487))

(declare-fun m!1175489 () Bool)

(assert (=> b!1281526 m!1175489))

(declare-fun m!1175491 () Bool)

(assert (=> b!1281525 m!1175491))

(declare-fun m!1175493 () Bool)

(assert (=> b!1281528 m!1175493))

(declare-fun m!1175495 () Bool)

(assert (=> b!1281528 m!1175495))

(declare-fun m!1175497 () Bool)

(assert (=> b!1281529 m!1175497))

(declare-fun m!1175499 () Bool)

(assert (=> b!1281524 m!1175499))

(assert (=> b!1281524 m!1175499))

(declare-fun m!1175501 () Bool)

(assert (=> b!1281524 m!1175501))

(declare-fun m!1175503 () Bool)

(assert (=> b!1281524 m!1175503))

(declare-fun m!1175505 () Bool)

(assert (=> b!1281523 m!1175505))

(declare-fun m!1175507 () Bool)

(assert (=> mapNonEmpty!52178 m!1175507))

(check-sat (not b!1281523) (not mapNonEmpty!52178) (not b_next!28111) tp_is_empty!33751 (not b!1281524) (not b!1281529) (not b!1281526) b_and!46153 (not start!108564) (not b!1281528))
(check-sat b_and!46153 (not b_next!28111))
(get-model)

(declare-fun d!140531 () Bool)

(declare-fun e!732233 () Bool)

(assert (=> d!140531 e!732233))

(declare-fun res!851372 () Bool)

(assert (=> d!140531 (=> res!851372 e!732233)))

(declare-fun lt!576103 () Bool)

(assert (=> d!140531 (= res!851372 (not lt!576103))))

(declare-fun lt!576104 () Bool)

(assert (=> d!140531 (= lt!576103 lt!576104)))

(declare-fun lt!576105 () Unit!42287)

(declare-fun e!732234 () Unit!42287)

(assert (=> d!140531 (= lt!576105 e!732234)))

(declare-fun c!124025 () Bool)

(assert (=> d!140531 (= c!124025 lt!576104)))

(declare-fun containsKey!712 (List!28964 (_ BitVec 64)) Bool)

(assert (=> d!140531 (= lt!576104 (containsKey!712 (toList!9732 (getCurrentListMap!4706 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!140531 (= (contains!7777 (getCurrentListMap!4706 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!576103)))

(declare-fun b!1281604 () Bool)

(declare-fun lt!576106 () Unit!42287)

(assert (=> b!1281604 (= e!732234 lt!576106)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!459 (List!28964 (_ BitVec 64)) Unit!42287)

(assert (=> b!1281604 (= lt!576106 (lemmaContainsKeyImpliesGetValueByKeyDefined!459 (toList!9732 (getCurrentListMap!4706 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-datatypes ((Option!746 0))(
  ( (Some!745 (v!19552 V!50105)) (None!744) )
))
(declare-fun isDefined!502 (Option!746) Bool)

(declare-fun getValueByKey!695 (List!28964 (_ BitVec 64)) Option!746)

(assert (=> b!1281604 (isDefined!502 (getValueByKey!695 (toList!9732 (getCurrentListMap!4706 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1281605 () Bool)

(declare-fun Unit!42293 () Unit!42287)

(assert (=> b!1281605 (= e!732234 Unit!42293)))

(declare-fun b!1281606 () Bool)

(assert (=> b!1281606 (= e!732233 (isDefined!502 (getValueByKey!695 (toList!9732 (getCurrentListMap!4706 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!140531 c!124025) b!1281604))

(assert (= (and d!140531 (not c!124025)) b!1281605))

(assert (= (and d!140531 (not res!851372)) b!1281606))

(declare-fun m!1175565 () Bool)

(assert (=> d!140531 m!1175565))

(declare-fun m!1175567 () Bool)

(assert (=> b!1281604 m!1175567))

(declare-fun m!1175569 () Bool)

(assert (=> b!1281604 m!1175569))

(assert (=> b!1281604 m!1175569))

(declare-fun m!1175571 () Bool)

(assert (=> b!1281604 m!1175571))

(assert (=> b!1281606 m!1175569))

(assert (=> b!1281606 m!1175569))

(assert (=> b!1281606 m!1175571))

(assert (=> b!1281526 d!140531))

(declare-fun b!1281649 () Bool)

(declare-fun e!732268 () ListLongMap!19433)

(declare-fun call!62715 () ListLongMap!19433)

(assert (=> b!1281649 (= e!732268 call!62715)))

(declare-fun bm!62709 () Bool)

(declare-fun call!62712 () ListLongMap!19433)

(declare-fun call!62713 () ListLongMap!19433)

(assert (=> bm!62709 (= call!62712 call!62713)))

(declare-fun b!1281650 () Bool)

(declare-fun e!732270 () Bool)

(declare-fun e!732267 () Bool)

(assert (=> b!1281650 (= e!732270 e!732267)))

(declare-fun res!851393 () Bool)

(assert (=> b!1281650 (=> (not res!851393) (not e!732267))))

(declare-fun lt!576167 () ListLongMap!19433)

(assert (=> b!1281650 (= res!851393 (contains!7777 lt!576167 (select (arr!40739 _keys!1741) from!2144)))))

(assert (=> b!1281650 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41291 _keys!1741)))))

(declare-fun b!1281651 () Bool)

(declare-fun c!124039 () Bool)

(assert (=> b!1281651 (= c!124039 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!732266 () ListLongMap!19433)

(assert (=> b!1281651 (= e!732266 e!732268)))

(declare-fun b!1281652 () Bool)

(declare-fun res!851399 () Bool)

(declare-fun e!732263 () Bool)

(assert (=> b!1281652 (=> (not res!851399) (not e!732263))))

(assert (=> b!1281652 (= res!851399 e!732270)))

(declare-fun res!851392 () Bool)

(assert (=> b!1281652 (=> res!851392 e!732270)))

(declare-fun e!732269 () Bool)

(assert (=> b!1281652 (= res!851392 (not e!732269))))

(declare-fun res!851397 () Bool)

(assert (=> b!1281652 (=> (not res!851397) (not e!732269))))

(assert (=> b!1281652 (= res!851397 (bvslt from!2144 (size!41291 _keys!1741)))))

(declare-fun b!1281653 () Bool)

(declare-fun e!732262 () ListLongMap!19433)

(declare-fun call!62716 () ListLongMap!19433)

(declare-fun +!4310 (ListLongMap!19433 tuple2!21776) ListLongMap!19433)

(assert (=> b!1281653 (= e!732262 (+!4310 call!62716 (tuple2!21777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1281654 () Bool)

(assert (=> b!1281654 (= e!732262 e!732266)))

(declare-fun c!124042 () Bool)

(assert (=> b!1281654 (= c!124042 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1281655 () Bool)

(declare-fun e!732272 () Unit!42287)

(declare-fun Unit!42294 () Unit!42287)

(assert (=> b!1281655 (= e!732272 Unit!42294)))

(declare-fun call!62717 () ListLongMap!19433)

(declare-fun bm!62710 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5941 (array!84469 array!84467 (_ BitVec 32) (_ BitVec 32) V!50105 V!50105 (_ BitVec 32) Int) ListLongMap!19433)

(assert (=> bm!62710 (= call!62717 (getCurrentListMapNoExtraKeys!5941 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1281657 () Bool)

(declare-fun e!732273 () Bool)

(declare-fun apply!1002 (ListLongMap!19433 (_ BitVec 64)) V!50105)

(assert (=> b!1281657 (= e!732273 (= (apply!1002 lt!576167 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1281658 () Bool)

(assert (=> b!1281658 (= e!732268 call!62712)))

(declare-fun bm!62711 () Bool)

(declare-fun call!62714 () Bool)

(assert (=> bm!62711 (= call!62714 (contains!7777 lt!576167 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1281659 () Bool)

(declare-fun e!732271 () Bool)

(declare-fun e!732264 () Bool)

(assert (=> b!1281659 (= e!732271 e!732264)))

(declare-fun res!851398 () Bool)

(declare-fun call!62718 () Bool)

(assert (=> b!1281659 (= res!851398 call!62718)))

(assert (=> b!1281659 (=> (not res!851398) (not e!732264))))

(declare-fun bm!62712 () Bool)

(assert (=> bm!62712 (= call!62713 call!62717)))

(declare-fun b!1281660 () Bool)

(assert (=> b!1281660 (= e!732266 call!62715)))

(declare-fun b!1281661 () Bool)

(assert (=> b!1281661 (= e!732264 (= (apply!1002 lt!576167 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1281662 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1281662 (= e!732269 (validKeyInArray!0 (select (arr!40739 _keys!1741) from!2144)))))

(declare-fun b!1281663 () Bool)

(declare-fun e!732261 () Bool)

(assert (=> b!1281663 (= e!732261 (not call!62714))))

(declare-fun b!1281664 () Bool)

(declare-fun e!732265 () Bool)

(assert (=> b!1281664 (= e!732265 (validKeyInArray!0 (select (arr!40739 _keys!1741) from!2144)))))

(declare-fun b!1281665 () Bool)

(assert (=> b!1281665 (= e!732271 (not call!62718))))

(declare-fun b!1281666 () Bool)

(assert (=> b!1281666 (= e!732261 e!732273)))

(declare-fun res!851394 () Bool)

(assert (=> b!1281666 (= res!851394 call!62714)))

(assert (=> b!1281666 (=> (not res!851394) (not e!732273))))

(declare-fun b!1281667 () Bool)

(declare-fun res!851395 () Bool)

(assert (=> b!1281667 (=> (not res!851395) (not e!732263))))

(assert (=> b!1281667 (= res!851395 e!732261)))

(declare-fun c!124038 () Bool)

(assert (=> b!1281667 (= c!124038 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1281668 () Bool)

(declare-fun get!20753 (ValueCell!15977 V!50105) V!50105)

(declare-fun dynLambda!3432 (Int (_ BitVec 64)) V!50105)

(assert (=> b!1281668 (= e!732267 (= (apply!1002 lt!576167 (select (arr!40739 _keys!1741) from!2144)) (get!20753 (select (arr!40738 _values!1445) from!2144) (dynLambda!3432 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1281668 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41290 _values!1445)))))

(assert (=> b!1281668 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41291 _keys!1741)))))

(declare-fun bm!62713 () Bool)

(assert (=> bm!62713 (= call!62718 (contains!7777 lt!576167 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62714 () Bool)

(assert (=> bm!62714 (= call!62715 call!62716)))

(declare-fun d!140533 () Bool)

(assert (=> d!140533 e!732263))

(declare-fun res!851391 () Bool)

(assert (=> d!140533 (=> (not res!851391) (not e!732263))))

(assert (=> d!140533 (= res!851391 (or (bvsge from!2144 (size!41291 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41291 _keys!1741)))))))

(declare-fun lt!576155 () ListLongMap!19433)

(assert (=> d!140533 (= lt!576167 lt!576155)))

(declare-fun lt!576157 () Unit!42287)

(assert (=> d!140533 (= lt!576157 e!732272)))

(declare-fun c!124041 () Bool)

(assert (=> d!140533 (= c!124041 e!732265)))

(declare-fun res!851396 () Bool)

(assert (=> d!140533 (=> (not res!851396) (not e!732265))))

(assert (=> d!140533 (= res!851396 (bvslt from!2144 (size!41291 _keys!1741)))))

(assert (=> d!140533 (= lt!576155 e!732262)))

(declare-fun c!124043 () Bool)

(assert (=> d!140533 (= c!124043 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!140533 (validMask!0 mask!2175)))

(assert (=> d!140533 (= (getCurrentListMap!4706 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!576167)))

(declare-fun b!1281656 () Bool)

(declare-fun lt!576169 () Unit!42287)

(assert (=> b!1281656 (= e!732272 lt!576169)))

(declare-fun lt!576172 () ListLongMap!19433)

(assert (=> b!1281656 (= lt!576172 (getCurrentListMapNoExtraKeys!5941 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!576168 () (_ BitVec 64))

(assert (=> b!1281656 (= lt!576168 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576156 () (_ BitVec 64))

(assert (=> b!1281656 (= lt!576156 (select (arr!40739 _keys!1741) from!2144))))

(declare-fun lt!576152 () Unit!42287)

(declare-fun addStillContains!1097 (ListLongMap!19433 (_ BitVec 64) V!50105 (_ BitVec 64)) Unit!42287)

(assert (=> b!1281656 (= lt!576152 (addStillContains!1097 lt!576172 lt!576168 zeroValue!1387 lt!576156))))

(assert (=> b!1281656 (contains!7777 (+!4310 lt!576172 (tuple2!21777 lt!576168 zeroValue!1387)) lt!576156)))

(declare-fun lt!576171 () Unit!42287)

(assert (=> b!1281656 (= lt!576171 lt!576152)))

(declare-fun lt!576153 () ListLongMap!19433)

(assert (=> b!1281656 (= lt!576153 (getCurrentListMapNoExtraKeys!5941 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!576162 () (_ BitVec 64))

(assert (=> b!1281656 (= lt!576162 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576164 () (_ BitVec 64))

(assert (=> b!1281656 (= lt!576164 (select (arr!40739 _keys!1741) from!2144))))

(declare-fun lt!576161 () Unit!42287)

(declare-fun addApplyDifferent!540 (ListLongMap!19433 (_ BitVec 64) V!50105 (_ BitVec 64)) Unit!42287)

(assert (=> b!1281656 (= lt!576161 (addApplyDifferent!540 lt!576153 lt!576162 minValue!1387 lt!576164))))

(assert (=> b!1281656 (= (apply!1002 (+!4310 lt!576153 (tuple2!21777 lt!576162 minValue!1387)) lt!576164) (apply!1002 lt!576153 lt!576164))))

(declare-fun lt!576160 () Unit!42287)

(assert (=> b!1281656 (= lt!576160 lt!576161)))

(declare-fun lt!576166 () ListLongMap!19433)

(assert (=> b!1281656 (= lt!576166 (getCurrentListMapNoExtraKeys!5941 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!576154 () (_ BitVec 64))

(assert (=> b!1281656 (= lt!576154 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576165 () (_ BitVec 64))

(assert (=> b!1281656 (= lt!576165 (select (arr!40739 _keys!1741) from!2144))))

(declare-fun lt!576163 () Unit!42287)

(assert (=> b!1281656 (= lt!576163 (addApplyDifferent!540 lt!576166 lt!576154 zeroValue!1387 lt!576165))))

(assert (=> b!1281656 (= (apply!1002 (+!4310 lt!576166 (tuple2!21777 lt!576154 zeroValue!1387)) lt!576165) (apply!1002 lt!576166 lt!576165))))

(declare-fun lt!576170 () Unit!42287)

(assert (=> b!1281656 (= lt!576170 lt!576163)))

(declare-fun lt!576158 () ListLongMap!19433)

(assert (=> b!1281656 (= lt!576158 (getCurrentListMapNoExtraKeys!5941 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!576159 () (_ BitVec 64))

(assert (=> b!1281656 (= lt!576159 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576151 () (_ BitVec 64))

(assert (=> b!1281656 (= lt!576151 (select (arr!40739 _keys!1741) from!2144))))

(assert (=> b!1281656 (= lt!576169 (addApplyDifferent!540 lt!576158 lt!576159 minValue!1387 lt!576151))))

(assert (=> b!1281656 (= (apply!1002 (+!4310 lt!576158 (tuple2!21777 lt!576159 minValue!1387)) lt!576151) (apply!1002 lt!576158 lt!576151))))

(declare-fun bm!62715 () Bool)

(assert (=> bm!62715 (= call!62716 (+!4310 (ite c!124043 call!62717 (ite c!124042 call!62713 call!62712)) (ite (or c!124043 c!124042) (tuple2!21777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!21777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1281669 () Bool)

(assert (=> b!1281669 (= e!732263 e!732271)))

(declare-fun c!124040 () Bool)

(assert (=> b!1281669 (= c!124040 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!140533 c!124043) b!1281653))

(assert (= (and d!140533 (not c!124043)) b!1281654))

(assert (= (and b!1281654 c!124042) b!1281660))

(assert (= (and b!1281654 (not c!124042)) b!1281651))

(assert (= (and b!1281651 c!124039) b!1281649))

(assert (= (and b!1281651 (not c!124039)) b!1281658))

(assert (= (or b!1281649 b!1281658) bm!62709))

(assert (= (or b!1281660 bm!62709) bm!62712))

(assert (= (or b!1281660 b!1281649) bm!62714))

(assert (= (or b!1281653 bm!62712) bm!62710))

(assert (= (or b!1281653 bm!62714) bm!62715))

(assert (= (and d!140533 res!851396) b!1281664))

(assert (= (and d!140533 c!124041) b!1281656))

(assert (= (and d!140533 (not c!124041)) b!1281655))

(assert (= (and d!140533 res!851391) b!1281652))

(assert (= (and b!1281652 res!851397) b!1281662))

(assert (= (and b!1281652 (not res!851392)) b!1281650))

(assert (= (and b!1281650 res!851393) b!1281668))

(assert (= (and b!1281652 res!851399) b!1281667))

(assert (= (and b!1281667 c!124038) b!1281666))

(assert (= (and b!1281667 (not c!124038)) b!1281663))

(assert (= (and b!1281666 res!851394) b!1281657))

(assert (= (or b!1281666 b!1281663) bm!62711))

(assert (= (and b!1281667 res!851395) b!1281669))

(assert (= (and b!1281669 c!124040) b!1281659))

(assert (= (and b!1281669 (not c!124040)) b!1281665))

(assert (= (and b!1281659 res!851398) b!1281661))

(assert (= (or b!1281659 b!1281665) bm!62713))

(declare-fun b_lambda!23085 () Bool)

(assert (=> (not b_lambda!23085) (not b!1281668)))

(declare-fun t!42503 () Bool)

(declare-fun tb!11337 () Bool)

(assert (=> (and start!108564 (= defaultEntry!1448 defaultEntry!1448) t!42503) tb!11337))

(declare-fun result!23677 () Bool)

(assert (=> tb!11337 (= result!23677 tp_is_empty!33751)))

(assert (=> b!1281668 t!42503))

(declare-fun b_and!46159 () Bool)

(assert (= b_and!46153 (and (=> t!42503 result!23677) b_and!46159)))

(declare-fun m!1175573 () Bool)

(assert (=> b!1281657 m!1175573))

(assert (=> d!140533 m!1175481))

(declare-fun m!1175575 () Bool)

(assert (=> b!1281661 m!1175575))

(assert (=> b!1281664 m!1175491))

(assert (=> b!1281664 m!1175491))

(declare-fun m!1175577 () Bool)

(assert (=> b!1281664 m!1175577))

(assert (=> b!1281662 m!1175491))

(assert (=> b!1281662 m!1175491))

(assert (=> b!1281662 m!1175577))

(assert (=> b!1281650 m!1175491))

(assert (=> b!1281650 m!1175491))

(declare-fun m!1175579 () Bool)

(assert (=> b!1281650 m!1175579))

(declare-fun m!1175581 () Bool)

(assert (=> b!1281653 m!1175581))

(declare-fun m!1175583 () Bool)

(assert (=> bm!62710 m!1175583))

(declare-fun m!1175585 () Bool)

(assert (=> b!1281656 m!1175585))

(declare-fun m!1175587 () Bool)

(assert (=> b!1281656 m!1175587))

(declare-fun m!1175589 () Bool)

(assert (=> b!1281656 m!1175589))

(declare-fun m!1175591 () Bool)

(assert (=> b!1281656 m!1175591))

(declare-fun m!1175593 () Bool)

(assert (=> b!1281656 m!1175593))

(declare-fun m!1175595 () Bool)

(assert (=> b!1281656 m!1175595))

(declare-fun m!1175597 () Bool)

(assert (=> b!1281656 m!1175597))

(declare-fun m!1175599 () Bool)

(assert (=> b!1281656 m!1175599))

(declare-fun m!1175601 () Bool)

(assert (=> b!1281656 m!1175601))

(declare-fun m!1175603 () Bool)

(assert (=> b!1281656 m!1175603))

(declare-fun m!1175605 () Bool)

(assert (=> b!1281656 m!1175605))

(assert (=> b!1281656 m!1175491))

(declare-fun m!1175607 () Bool)

(assert (=> b!1281656 m!1175607))

(assert (=> b!1281656 m!1175601))

(declare-fun m!1175609 () Bool)

(assert (=> b!1281656 m!1175609))

(assert (=> b!1281656 m!1175597))

(assert (=> b!1281656 m!1175605))

(declare-fun m!1175611 () Bool)

(assert (=> b!1281656 m!1175611))

(assert (=> b!1281656 m!1175583))

(assert (=> b!1281656 m!1175591))

(declare-fun m!1175613 () Bool)

(assert (=> b!1281656 m!1175613))

(declare-fun m!1175615 () Bool)

(assert (=> bm!62713 m!1175615))

(declare-fun m!1175617 () Bool)

(assert (=> b!1281668 m!1175617))

(declare-fun m!1175619 () Bool)

(assert (=> b!1281668 m!1175619))

(declare-fun m!1175621 () Bool)

(assert (=> b!1281668 m!1175621))

(assert (=> b!1281668 m!1175617))

(assert (=> b!1281668 m!1175491))

(assert (=> b!1281668 m!1175619))

(assert (=> b!1281668 m!1175491))

(declare-fun m!1175623 () Bool)

(assert (=> b!1281668 m!1175623))

(declare-fun m!1175625 () Bool)

(assert (=> bm!62711 m!1175625))

(declare-fun m!1175627 () Bool)

(assert (=> bm!62715 m!1175627))

(assert (=> b!1281526 d!140533))

(declare-fun b!1281680 () Bool)

(declare-fun e!732281 () Bool)

(declare-fun call!62721 () Bool)

(assert (=> b!1281680 (= e!732281 call!62721)))

(declare-fun b!1281681 () Bool)

(declare-fun e!732280 () Bool)

(assert (=> b!1281681 (= e!732280 call!62721)))

(declare-fun b!1281682 () Bool)

(declare-fun e!732282 () Bool)

(assert (=> b!1281682 (= e!732282 e!732281)))

(declare-fun c!124046 () Bool)

(assert (=> b!1281682 (= c!124046 (validKeyInArray!0 (select (arr!40739 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!140535 () Bool)

(declare-fun res!851404 () Bool)

(assert (=> d!140535 (=> res!851404 e!732282)))

(assert (=> d!140535 (= res!851404 (bvsge #b00000000000000000000000000000000 (size!41291 _keys!1741)))))

(assert (=> d!140535 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!732282)))

(declare-fun b!1281683 () Bool)

(assert (=> b!1281683 (= e!732281 e!732280)))

(declare-fun lt!576181 () (_ BitVec 64))

(assert (=> b!1281683 (= lt!576181 (select (arr!40739 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!576179 () Unit!42287)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!84469 (_ BitVec 64) (_ BitVec 32)) Unit!42287)

(assert (=> b!1281683 (= lt!576179 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!576181 #b00000000000000000000000000000000))))

(assert (=> b!1281683 (arrayContainsKey!0 _keys!1741 lt!576181 #b00000000000000000000000000000000)))

(declare-fun lt!576180 () Unit!42287)

(assert (=> b!1281683 (= lt!576180 lt!576179)))

(declare-fun res!851405 () Bool)

(declare-datatypes ((SeekEntryResult!10011 0))(
  ( (MissingZero!10011 (index!42415 (_ BitVec 32))) (Found!10011 (index!42416 (_ BitVec 32))) (Intermediate!10011 (undefined!10823 Bool) (index!42417 (_ BitVec 32)) (x!113673 (_ BitVec 32))) (Undefined!10011) (MissingVacant!10011 (index!42418 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!84469 (_ BitVec 32)) SeekEntryResult!10011)

(assert (=> b!1281683 (= res!851405 (= (seekEntryOrOpen!0 (select (arr!40739 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10011 #b00000000000000000000000000000000)))))

(assert (=> b!1281683 (=> (not res!851405) (not e!732280))))

(declare-fun bm!62718 () Bool)

(assert (=> bm!62718 (= call!62721 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(assert (= (and d!140535 (not res!851404)) b!1281682))

(assert (= (and b!1281682 c!124046) b!1281683))

(assert (= (and b!1281682 (not c!124046)) b!1281680))

(assert (= (and b!1281683 res!851405) b!1281681))

(assert (= (or b!1281681 b!1281680) bm!62718))

(declare-fun m!1175629 () Bool)

(assert (=> b!1281682 m!1175629))

(assert (=> b!1281682 m!1175629))

(declare-fun m!1175631 () Bool)

(assert (=> b!1281682 m!1175631))

(assert (=> b!1281683 m!1175629))

(declare-fun m!1175633 () Bool)

(assert (=> b!1281683 m!1175633))

(declare-fun m!1175635 () Bool)

(assert (=> b!1281683 m!1175635))

(assert (=> b!1281683 m!1175629))

(declare-fun m!1175637 () Bool)

(assert (=> b!1281683 m!1175637))

(declare-fun m!1175639 () Bool)

(assert (=> bm!62718 m!1175639))

(assert (=> b!1281523 d!140535))

(declare-fun d!140537 () Bool)

(assert (=> d!140537 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!108564 d!140537))

(declare-fun d!140539 () Bool)

(assert (=> d!140539 (= (array_inv!31071 _values!1445) (bvsge (size!41290 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!108564 d!140539))

(declare-fun d!140541 () Bool)

(assert (=> d!140541 (= (array_inv!31072 _keys!1741) (bvsge (size!41291 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!108564 d!140541))

(declare-fun b!1281694 () Bool)

(declare-fun e!732291 () Bool)

(declare-fun e!732294 () Bool)

(assert (=> b!1281694 (= e!732291 e!732294)))

(declare-fun res!851414 () Bool)

(assert (=> b!1281694 (=> (not res!851414) (not e!732294))))

(declare-fun e!732293 () Bool)

(assert (=> b!1281694 (= res!851414 (not e!732293))))

(declare-fun res!851412 () Bool)

(assert (=> b!1281694 (=> (not res!851412) (not e!732293))))

(assert (=> b!1281694 (= res!851412 (validKeyInArray!0 (select (arr!40739 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!140543 () Bool)

(declare-fun res!851413 () Bool)

(assert (=> d!140543 (=> res!851413 e!732291)))

(assert (=> d!140543 (= res!851413 (bvsge #b00000000000000000000000000000000 (size!41291 _keys!1741)))))

(assert (=> d!140543 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28962) e!732291)))

(declare-fun bm!62721 () Bool)

(declare-fun call!62724 () Bool)

(declare-fun c!124049 () Bool)

(assert (=> bm!62721 (= call!62724 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124049 (Cons!28961 (select (arr!40739 _keys!1741) #b00000000000000000000000000000000) Nil!28962) Nil!28962)))))

(declare-fun b!1281695 () Bool)

(declare-fun e!732292 () Bool)

(assert (=> b!1281695 (= e!732294 e!732292)))

(assert (=> b!1281695 (= c!124049 (validKeyInArray!0 (select (arr!40739 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1281696 () Bool)

(declare-fun contains!7780 (List!28965 (_ BitVec 64)) Bool)

(assert (=> b!1281696 (= e!732293 (contains!7780 Nil!28962 (select (arr!40739 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1281697 () Bool)

(assert (=> b!1281697 (= e!732292 call!62724)))

(declare-fun b!1281698 () Bool)

(assert (=> b!1281698 (= e!732292 call!62724)))

(assert (= (and d!140543 (not res!851413)) b!1281694))

(assert (= (and b!1281694 res!851412) b!1281696))

(assert (= (and b!1281694 res!851414) b!1281695))

(assert (= (and b!1281695 c!124049) b!1281697))

(assert (= (and b!1281695 (not c!124049)) b!1281698))

(assert (= (or b!1281697 b!1281698) bm!62721))

(assert (=> b!1281694 m!1175629))

(assert (=> b!1281694 m!1175629))

(assert (=> b!1281694 m!1175631))

(assert (=> bm!62721 m!1175629))

(declare-fun m!1175641 () Bool)

(assert (=> bm!62721 m!1175641))

(assert (=> b!1281695 m!1175629))

(assert (=> b!1281695 m!1175629))

(assert (=> b!1281695 m!1175631))

(assert (=> b!1281696 m!1175629))

(assert (=> b!1281696 m!1175629))

(declare-fun m!1175643 () Bool)

(assert (=> b!1281696 m!1175643))

(assert (=> b!1281529 d!140543))

(declare-fun d!140545 () Bool)

(declare-fun e!732295 () Bool)

(assert (=> d!140545 e!732295))

(declare-fun res!851415 () Bool)

(assert (=> d!140545 (=> res!851415 e!732295)))

(declare-fun lt!576182 () Bool)

(assert (=> d!140545 (= res!851415 (not lt!576182))))

(declare-fun lt!576183 () Bool)

(assert (=> d!140545 (= lt!576182 lt!576183)))

(declare-fun lt!576184 () Unit!42287)

(declare-fun e!732296 () Unit!42287)

(assert (=> d!140545 (= lt!576184 e!732296)))

(declare-fun c!124050 () Bool)

(assert (=> d!140545 (= c!124050 lt!576183)))

(assert (=> d!140545 (= lt!576183 (containsKey!712 (toList!9732 (getCurrentListMap!4706 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448)) k0!1205))))

(assert (=> d!140545 (= (contains!7777 (getCurrentListMap!4706 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205) lt!576182)))

(declare-fun b!1281699 () Bool)

(declare-fun lt!576185 () Unit!42287)

(assert (=> b!1281699 (= e!732296 lt!576185)))

(assert (=> b!1281699 (= lt!576185 (lemmaContainsKeyImpliesGetValueByKeyDefined!459 (toList!9732 (getCurrentListMap!4706 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448)) k0!1205))))

(assert (=> b!1281699 (isDefined!502 (getValueByKey!695 (toList!9732 (getCurrentListMap!4706 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448)) k0!1205))))

(declare-fun b!1281700 () Bool)

(declare-fun Unit!42295 () Unit!42287)

(assert (=> b!1281700 (= e!732296 Unit!42295)))

(declare-fun b!1281701 () Bool)

(assert (=> b!1281701 (= e!732295 (isDefined!502 (getValueByKey!695 (toList!9732 (getCurrentListMap!4706 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448)) k0!1205)))))

(assert (= (and d!140545 c!124050) b!1281699))

(assert (= (and d!140545 (not c!124050)) b!1281700))

(assert (= (and d!140545 (not res!851415)) b!1281701))

(declare-fun m!1175645 () Bool)

(assert (=> d!140545 m!1175645))

(declare-fun m!1175647 () Bool)

(assert (=> b!1281699 m!1175647))

(declare-fun m!1175649 () Bool)

(assert (=> b!1281699 m!1175649))

(assert (=> b!1281699 m!1175649))

(declare-fun m!1175651 () Bool)

(assert (=> b!1281699 m!1175651))

(assert (=> b!1281701 m!1175649))

(assert (=> b!1281701 m!1175649))

(assert (=> b!1281701 m!1175651))

(assert (=> b!1281524 d!140545))

(declare-fun b!1281702 () Bool)

(declare-fun e!732304 () ListLongMap!19433)

(declare-fun call!62728 () ListLongMap!19433)

(assert (=> b!1281702 (= e!732304 call!62728)))

(declare-fun bm!62722 () Bool)

(declare-fun call!62725 () ListLongMap!19433)

(declare-fun call!62726 () ListLongMap!19433)

(assert (=> bm!62722 (= call!62725 call!62726)))

(declare-fun b!1281703 () Bool)

(declare-fun e!732306 () Bool)

(declare-fun e!732303 () Bool)

(assert (=> b!1281703 (= e!732306 e!732303)))

(declare-fun res!851418 () Bool)

(assert (=> b!1281703 (=> (not res!851418) (not e!732303))))

(declare-fun lt!576202 () ListLongMap!19433)

(assert (=> b!1281703 (= res!851418 (contains!7777 lt!576202 (select (arr!40739 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144))))))

(assert (=> b!1281703 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41291 _keys!1741)))))

(declare-fun b!1281704 () Bool)

(declare-fun c!124052 () Bool)

(assert (=> b!1281704 (= c!124052 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!732302 () ListLongMap!19433)

(assert (=> b!1281704 (= e!732302 e!732304)))

(declare-fun b!1281705 () Bool)

(declare-fun res!851424 () Bool)

(declare-fun e!732299 () Bool)

(assert (=> b!1281705 (=> (not res!851424) (not e!732299))))

(assert (=> b!1281705 (= res!851424 e!732306)))

(declare-fun res!851417 () Bool)

(assert (=> b!1281705 (=> res!851417 e!732306)))

(declare-fun e!732305 () Bool)

(assert (=> b!1281705 (= res!851417 (not e!732305))))

(declare-fun res!851422 () Bool)

(assert (=> b!1281705 (=> (not res!851422) (not e!732305))))

(assert (=> b!1281705 (= res!851422 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41291 _keys!1741)))))

(declare-fun b!1281706 () Bool)

(declare-fun e!732298 () ListLongMap!19433)

(declare-fun call!62729 () ListLongMap!19433)

(assert (=> b!1281706 (= e!732298 (+!4310 call!62729 (tuple2!21777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1281707 () Bool)

(assert (=> b!1281707 (= e!732298 e!732302)))

(declare-fun c!124055 () Bool)

(assert (=> b!1281707 (= c!124055 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1281708 () Bool)

(declare-fun e!732308 () Unit!42287)

(declare-fun Unit!42296 () Unit!42287)

(assert (=> b!1281708 (= e!732308 Unit!42296)))

(declare-fun call!62730 () ListLongMap!19433)

(declare-fun bm!62723 () Bool)

(assert (=> bm!62723 (= call!62730 (getCurrentListMapNoExtraKeys!5941 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun b!1281710 () Bool)

(declare-fun e!732309 () Bool)

(assert (=> b!1281710 (= e!732309 (= (apply!1002 lt!576202 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1281711 () Bool)

(assert (=> b!1281711 (= e!732304 call!62725)))

(declare-fun bm!62724 () Bool)

(declare-fun call!62727 () Bool)

(assert (=> bm!62724 (= call!62727 (contains!7777 lt!576202 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1281712 () Bool)

(declare-fun e!732307 () Bool)

(declare-fun e!732300 () Bool)

(assert (=> b!1281712 (= e!732307 e!732300)))

(declare-fun res!851423 () Bool)

(declare-fun call!62731 () Bool)

(assert (=> b!1281712 (= res!851423 call!62731)))

(assert (=> b!1281712 (=> (not res!851423) (not e!732300))))

(declare-fun bm!62725 () Bool)

(assert (=> bm!62725 (= call!62726 call!62730)))

(declare-fun b!1281713 () Bool)

(assert (=> b!1281713 (= e!732302 call!62728)))

(declare-fun b!1281714 () Bool)

(assert (=> b!1281714 (= e!732300 (= (apply!1002 lt!576202 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1281715 () Bool)

(assert (=> b!1281715 (= e!732305 (validKeyInArray!0 (select (arr!40739 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144))))))

(declare-fun b!1281716 () Bool)

(declare-fun e!732297 () Bool)

(assert (=> b!1281716 (= e!732297 (not call!62727))))

(declare-fun b!1281717 () Bool)

(declare-fun e!732301 () Bool)

(assert (=> b!1281717 (= e!732301 (validKeyInArray!0 (select (arr!40739 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144))))))

(declare-fun b!1281718 () Bool)

(assert (=> b!1281718 (= e!732307 (not call!62731))))

(declare-fun b!1281719 () Bool)

(assert (=> b!1281719 (= e!732297 e!732309)))

(declare-fun res!851419 () Bool)

(assert (=> b!1281719 (= res!851419 call!62727)))

(assert (=> b!1281719 (=> (not res!851419) (not e!732309))))

(declare-fun b!1281720 () Bool)

(declare-fun res!851420 () Bool)

(assert (=> b!1281720 (=> (not res!851420) (not e!732299))))

(assert (=> b!1281720 (= res!851420 e!732297)))

(declare-fun c!124051 () Bool)

(assert (=> b!1281720 (= c!124051 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1281721 () Bool)

(assert (=> b!1281721 (= e!732303 (= (apply!1002 lt!576202 (select (arr!40739 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144))) (get!20753 (select (arr!40738 _values!1445) (bvadd #b00000000000000000000000000000001 from!2144)) (dynLambda!3432 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1281721 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41290 _values!1445)))))

(assert (=> b!1281721 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41291 _keys!1741)))))

(declare-fun bm!62726 () Bool)

(assert (=> bm!62726 (= call!62731 (contains!7777 lt!576202 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62727 () Bool)

(assert (=> bm!62727 (= call!62728 call!62729)))

(declare-fun d!140547 () Bool)

(assert (=> d!140547 e!732299))

(declare-fun res!851416 () Bool)

(assert (=> d!140547 (=> (not res!851416) (not e!732299))))

(assert (=> d!140547 (= res!851416 (or (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41291 _keys!1741)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41291 _keys!1741)))))))

(declare-fun lt!576190 () ListLongMap!19433)

(assert (=> d!140547 (= lt!576202 lt!576190)))

(declare-fun lt!576192 () Unit!42287)

(assert (=> d!140547 (= lt!576192 e!732308)))

(declare-fun c!124054 () Bool)

(assert (=> d!140547 (= c!124054 e!732301)))

(declare-fun res!851421 () Bool)

(assert (=> d!140547 (=> (not res!851421) (not e!732301))))

(assert (=> d!140547 (= res!851421 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41291 _keys!1741)))))

(assert (=> d!140547 (= lt!576190 e!732298)))

(declare-fun c!124056 () Bool)

(assert (=> d!140547 (= c!124056 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!140547 (validMask!0 mask!2175)))

(assert (=> d!140547 (= (getCurrentListMap!4706 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) lt!576202)))

(declare-fun b!1281709 () Bool)

(declare-fun lt!576204 () Unit!42287)

(assert (=> b!1281709 (= e!732308 lt!576204)))

(declare-fun lt!576207 () ListLongMap!19433)

(assert (=> b!1281709 (= lt!576207 (getCurrentListMapNoExtraKeys!5941 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun lt!576203 () (_ BitVec 64))

(assert (=> b!1281709 (= lt!576203 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576191 () (_ BitVec 64))

(assert (=> b!1281709 (= lt!576191 (select (arr!40739 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)))))

(declare-fun lt!576187 () Unit!42287)

(assert (=> b!1281709 (= lt!576187 (addStillContains!1097 lt!576207 lt!576203 zeroValue!1387 lt!576191))))

(assert (=> b!1281709 (contains!7777 (+!4310 lt!576207 (tuple2!21777 lt!576203 zeroValue!1387)) lt!576191)))

(declare-fun lt!576206 () Unit!42287)

(assert (=> b!1281709 (= lt!576206 lt!576187)))

(declare-fun lt!576188 () ListLongMap!19433)

(assert (=> b!1281709 (= lt!576188 (getCurrentListMapNoExtraKeys!5941 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun lt!576197 () (_ BitVec 64))

(assert (=> b!1281709 (= lt!576197 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576199 () (_ BitVec 64))

(assert (=> b!1281709 (= lt!576199 (select (arr!40739 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)))))

(declare-fun lt!576196 () Unit!42287)

(assert (=> b!1281709 (= lt!576196 (addApplyDifferent!540 lt!576188 lt!576197 minValue!1387 lt!576199))))

(assert (=> b!1281709 (= (apply!1002 (+!4310 lt!576188 (tuple2!21777 lt!576197 minValue!1387)) lt!576199) (apply!1002 lt!576188 lt!576199))))

(declare-fun lt!576195 () Unit!42287)

(assert (=> b!1281709 (= lt!576195 lt!576196)))

(declare-fun lt!576201 () ListLongMap!19433)

(assert (=> b!1281709 (= lt!576201 (getCurrentListMapNoExtraKeys!5941 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun lt!576189 () (_ BitVec 64))

(assert (=> b!1281709 (= lt!576189 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576200 () (_ BitVec 64))

(assert (=> b!1281709 (= lt!576200 (select (arr!40739 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)))))

(declare-fun lt!576198 () Unit!42287)

(assert (=> b!1281709 (= lt!576198 (addApplyDifferent!540 lt!576201 lt!576189 zeroValue!1387 lt!576200))))

(assert (=> b!1281709 (= (apply!1002 (+!4310 lt!576201 (tuple2!21777 lt!576189 zeroValue!1387)) lt!576200) (apply!1002 lt!576201 lt!576200))))

(declare-fun lt!576205 () Unit!42287)

(assert (=> b!1281709 (= lt!576205 lt!576198)))

(declare-fun lt!576193 () ListLongMap!19433)

(assert (=> b!1281709 (= lt!576193 (getCurrentListMapNoExtraKeys!5941 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun lt!576194 () (_ BitVec 64))

(assert (=> b!1281709 (= lt!576194 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!576186 () (_ BitVec 64))

(assert (=> b!1281709 (= lt!576186 (select (arr!40739 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)))))

(assert (=> b!1281709 (= lt!576204 (addApplyDifferent!540 lt!576193 lt!576194 minValue!1387 lt!576186))))

(assert (=> b!1281709 (= (apply!1002 (+!4310 lt!576193 (tuple2!21777 lt!576194 minValue!1387)) lt!576186) (apply!1002 lt!576193 lt!576186))))

(declare-fun bm!62728 () Bool)

(assert (=> bm!62728 (= call!62729 (+!4310 (ite c!124056 call!62730 (ite c!124055 call!62726 call!62725)) (ite (or c!124056 c!124055) (tuple2!21777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!21777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1281722 () Bool)

(assert (=> b!1281722 (= e!732299 e!732307)))

(declare-fun c!124053 () Bool)

(assert (=> b!1281722 (= c!124053 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!140547 c!124056) b!1281706))

(assert (= (and d!140547 (not c!124056)) b!1281707))

(assert (= (and b!1281707 c!124055) b!1281713))

(assert (= (and b!1281707 (not c!124055)) b!1281704))

(assert (= (and b!1281704 c!124052) b!1281702))

(assert (= (and b!1281704 (not c!124052)) b!1281711))

(assert (= (or b!1281702 b!1281711) bm!62722))

(assert (= (or b!1281713 bm!62722) bm!62725))

(assert (= (or b!1281713 b!1281702) bm!62727))

(assert (= (or b!1281706 bm!62725) bm!62723))

(assert (= (or b!1281706 bm!62727) bm!62728))

(assert (= (and d!140547 res!851421) b!1281717))

(assert (= (and d!140547 c!124054) b!1281709))

(assert (= (and d!140547 (not c!124054)) b!1281708))

(assert (= (and d!140547 res!851416) b!1281705))

(assert (= (and b!1281705 res!851422) b!1281715))

(assert (= (and b!1281705 (not res!851417)) b!1281703))

(assert (= (and b!1281703 res!851418) b!1281721))

(assert (= (and b!1281705 res!851424) b!1281720))

(assert (= (and b!1281720 c!124051) b!1281719))

(assert (= (and b!1281720 (not c!124051)) b!1281716))

(assert (= (and b!1281719 res!851419) b!1281710))

(assert (= (or b!1281719 b!1281716) bm!62724))

(assert (= (and b!1281720 res!851420) b!1281722))

(assert (= (and b!1281722 c!124053) b!1281712))

(assert (= (and b!1281722 (not c!124053)) b!1281718))

(assert (= (and b!1281712 res!851423) b!1281714))

(assert (= (or b!1281712 b!1281718) bm!62726))

(declare-fun b_lambda!23087 () Bool)

(assert (=> (not b_lambda!23087) (not b!1281721)))

(assert (=> b!1281721 t!42503))

(declare-fun b_and!46161 () Bool)

(assert (= b_and!46159 (and (=> t!42503 result!23677) b_and!46161)))

(declare-fun m!1175653 () Bool)

(assert (=> b!1281710 m!1175653))

(assert (=> d!140547 m!1175481))

(declare-fun m!1175655 () Bool)

(assert (=> b!1281714 m!1175655))

(declare-fun m!1175657 () Bool)

(assert (=> b!1281717 m!1175657))

(assert (=> b!1281717 m!1175657))

(declare-fun m!1175659 () Bool)

(assert (=> b!1281717 m!1175659))

(assert (=> b!1281715 m!1175657))

(assert (=> b!1281715 m!1175657))

(assert (=> b!1281715 m!1175659))

(assert (=> b!1281703 m!1175657))

(assert (=> b!1281703 m!1175657))

(declare-fun m!1175661 () Bool)

(assert (=> b!1281703 m!1175661))

(declare-fun m!1175663 () Bool)

(assert (=> b!1281706 m!1175663))

(declare-fun m!1175665 () Bool)

(assert (=> bm!62723 m!1175665))

(declare-fun m!1175667 () Bool)

(assert (=> b!1281709 m!1175667))

(declare-fun m!1175669 () Bool)

(assert (=> b!1281709 m!1175669))

(declare-fun m!1175671 () Bool)

(assert (=> b!1281709 m!1175671))

(declare-fun m!1175673 () Bool)

(assert (=> b!1281709 m!1175673))

(declare-fun m!1175675 () Bool)

(assert (=> b!1281709 m!1175675))

(declare-fun m!1175677 () Bool)

(assert (=> b!1281709 m!1175677))

(declare-fun m!1175679 () Bool)

(assert (=> b!1281709 m!1175679))

(declare-fun m!1175681 () Bool)

(assert (=> b!1281709 m!1175681))

(declare-fun m!1175683 () Bool)

(assert (=> b!1281709 m!1175683))

(declare-fun m!1175685 () Bool)

(assert (=> b!1281709 m!1175685))

(declare-fun m!1175687 () Bool)

(assert (=> b!1281709 m!1175687))

(assert (=> b!1281709 m!1175657))

(declare-fun m!1175689 () Bool)

(assert (=> b!1281709 m!1175689))

(assert (=> b!1281709 m!1175683))

(declare-fun m!1175691 () Bool)

(assert (=> b!1281709 m!1175691))

(assert (=> b!1281709 m!1175679))

(assert (=> b!1281709 m!1175687))

(declare-fun m!1175693 () Bool)

(assert (=> b!1281709 m!1175693))

(assert (=> b!1281709 m!1175665))

(assert (=> b!1281709 m!1175673))

(declare-fun m!1175695 () Bool)

(assert (=> b!1281709 m!1175695))

(declare-fun m!1175697 () Bool)

(assert (=> bm!62726 m!1175697))

(declare-fun m!1175699 () Bool)

(assert (=> b!1281721 m!1175699))

(assert (=> b!1281721 m!1175619))

(declare-fun m!1175701 () Bool)

(assert (=> b!1281721 m!1175701))

(assert (=> b!1281721 m!1175699))

(assert (=> b!1281721 m!1175657))

(assert (=> b!1281721 m!1175619))

(assert (=> b!1281721 m!1175657))

(declare-fun m!1175703 () Bool)

(assert (=> b!1281721 m!1175703))

(declare-fun m!1175705 () Bool)

(assert (=> bm!62724 m!1175705))

(declare-fun m!1175707 () Bool)

(assert (=> bm!62728 m!1175707))

(assert (=> b!1281524 d!140547))

(declare-fun d!140549 () Bool)

(assert (=> d!140549 (contains!7777 (getCurrentListMap!4706 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448) k0!1205)))

(declare-fun lt!576210 () Unit!42287)

(declare-fun choose!1906 (array!84469 array!84467 (_ BitVec 32) (_ BitVec 32) V!50105 V!50105 (_ BitVec 64) (_ BitVec 32) Int) Unit!42287)

(assert (=> d!140549 (= lt!576210 (choose!1906 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(assert (=> d!140549 (validMask!0 mask!2175)))

(assert (=> d!140549 (= (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!24 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448) lt!576210)))

(declare-fun bs!36465 () Bool)

(assert (= bs!36465 d!140549))

(declare-fun m!1175709 () Bool)

(assert (=> bs!36465 m!1175709))

(assert (=> bs!36465 m!1175709))

(declare-fun m!1175711 () Bool)

(assert (=> bs!36465 m!1175711))

(declare-fun m!1175713 () Bool)

(assert (=> bs!36465 m!1175713))

(assert (=> bs!36465 m!1175481))

(assert (=> b!1281524 d!140549))

(declare-fun d!140551 () Bool)

(declare-fun res!851429 () Bool)

(declare-fun e!732314 () Bool)

(assert (=> d!140551 (=> res!851429 e!732314)))

(assert (=> d!140551 (= res!851429 (= (select (arr!40739 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)) k0!1205))))

(assert (=> d!140551 (= (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144)) e!732314)))

(declare-fun b!1281727 () Bool)

(declare-fun e!732315 () Bool)

(assert (=> b!1281727 (= e!732314 e!732315)))

(declare-fun res!851430 () Bool)

(assert (=> b!1281727 (=> (not res!851430) (not e!732315))))

(assert (=> b!1281727 (= res!851430 (bvslt (bvadd #b00000000000000000000000000000001 from!2144 #b00000000000000000000000000000001) (size!41291 _keys!1741)))))

(declare-fun b!1281728 () Bool)

(assert (=> b!1281728 (= e!732315 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144 #b00000000000000000000000000000001)))))

(assert (= (and d!140551 (not res!851429)) b!1281727))

(assert (= (and b!1281727 res!851430) b!1281728))

(assert (=> d!140551 m!1175657))

(declare-fun m!1175715 () Bool)

(assert (=> b!1281728 m!1175715))

(assert (=> b!1281528 d!140551))

(declare-fun d!140553 () Bool)

(declare-fun e!732318 () Bool)

(assert (=> d!140553 e!732318))

(declare-fun c!124059 () Bool)

(assert (=> d!140553 (= c!124059 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!576213 () Unit!42287)

(declare-fun choose!1907 (array!84469 array!84467 (_ BitVec 32) (_ BitVec 32) V!50105 V!50105 (_ BitVec 64) (_ BitVec 32) Int) Unit!42287)

(assert (=> d!140553 (= lt!576213 (choose!1907 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(assert (=> d!140553 (validMask!0 mask!2175)))

(assert (=> d!140553 (= (lemmaListMapContainsThenArrayContainsFrom!626 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) lt!576213)))

(declare-fun b!1281733 () Bool)

(assert (=> b!1281733 (= e!732318 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144)))))

(declare-fun b!1281734 () Bool)

(assert (=> b!1281734 (= e!732318 (ite (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!140553 c!124059) b!1281733))

(assert (= (and d!140553 (not c!124059)) b!1281734))

(declare-fun m!1175717 () Bool)

(assert (=> d!140553 m!1175717))

(assert (=> d!140553 m!1175481))

(assert (=> b!1281733 m!1175493))

(assert (=> b!1281528 d!140553))

(declare-fun b!1281742 () Bool)

(declare-fun e!732323 () Bool)

(assert (=> b!1281742 (= e!732323 tp_is_empty!33751)))

(declare-fun mapNonEmpty!52187 () Bool)

(declare-fun mapRes!52187 () Bool)

(declare-fun tp!99459 () Bool)

(declare-fun e!732324 () Bool)

(assert (=> mapNonEmpty!52187 (= mapRes!52187 (and tp!99459 e!732324))))

(declare-fun mapValue!52187 () ValueCell!15977)

(declare-fun mapKey!52187 () (_ BitVec 32))

(declare-fun mapRest!52187 () (Array (_ BitVec 32) ValueCell!15977))

(assert (=> mapNonEmpty!52187 (= mapRest!52178 (store mapRest!52187 mapKey!52187 mapValue!52187))))

(declare-fun mapIsEmpty!52187 () Bool)

(assert (=> mapIsEmpty!52187 mapRes!52187))

(declare-fun condMapEmpty!52187 () Bool)

(declare-fun mapDefault!52187 () ValueCell!15977)

(assert (=> mapNonEmpty!52178 (= condMapEmpty!52187 (= mapRest!52178 ((as const (Array (_ BitVec 32) ValueCell!15977)) mapDefault!52187)))))

(assert (=> mapNonEmpty!52178 (= tp!99444 (and e!732323 mapRes!52187))))

(declare-fun b!1281741 () Bool)

(assert (=> b!1281741 (= e!732324 tp_is_empty!33751)))

(assert (= (and mapNonEmpty!52178 condMapEmpty!52187) mapIsEmpty!52187))

(assert (= (and mapNonEmpty!52178 (not condMapEmpty!52187)) mapNonEmpty!52187))

(assert (= (and mapNonEmpty!52187 ((_ is ValueCellFull!15977) mapValue!52187)) b!1281741))

(assert (= (and mapNonEmpty!52178 ((_ is ValueCellFull!15977) mapDefault!52187)) b!1281742))

(declare-fun m!1175719 () Bool)

(assert (=> mapNonEmpty!52187 m!1175719))

(declare-fun b_lambda!23089 () Bool)

(assert (= b_lambda!23087 (or (and start!108564 b_free!28111) b_lambda!23089)))

(declare-fun b_lambda!23091 () Bool)

(assert (= b_lambda!23085 (or (and start!108564 b_free!28111) b_lambda!23091)))

(check-sat b_and!46161 (not b!1281701) (not b!1281682) (not d!140531) (not b!1281653) (not bm!62715) (not d!140553) (not bm!62718) (not b!1281703) (not b!1281710) (not bm!62726) (not d!140533) (not b!1281695) (not b!1281661) (not b!1281728) (not b!1281606) (not mapNonEmpty!52187) (not d!140549) (not b!1281604) (not bm!62724) (not b!1281699) (not b!1281706) (not bm!62723) (not b!1281721) (not b!1281715) (not bm!62710) (not bm!62711) (not b!1281696) (not b_lambda!23091) (not b!1281650) (not b_lambda!23089) (not b!1281662) (not bm!62721) (not b!1281664) (not d!140547) (not bm!62728) (not b!1281733) (not b!1281656) (not b_next!28111) (not b!1281717) (not b!1281683) tp_is_empty!33751 (not b!1281668) (not b!1281657) (not b!1281709) (not b!1281694) (not bm!62713) (not b!1281714) (not d!140545))
(check-sat b_and!46161 (not b_next!28111))
