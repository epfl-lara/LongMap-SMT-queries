; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132232 () Bool)

(assert start!132232)

(declare-fun b_free!31909 () Bool)

(declare-fun b_next!31909 () Bool)

(assert (=> start!132232 (= b_free!31909 (not b_next!31909))))

(declare-fun tp!111992 () Bool)

(declare-fun b_and!51329 () Bool)

(assert (=> start!132232 (= tp!111992 b_and!51329)))

(declare-fun bm!71052 () Bool)

(declare-datatypes ((V!59357 0))(
  ( (V!59358 (val!19170 Int)) )
))
(declare-datatypes ((tuple2!24790 0))(
  ( (tuple2!24791 (_1!12406 (_ BitVec 64)) (_2!12406 V!59357)) )
))
(declare-datatypes ((List!36239 0))(
  ( (Nil!36236) (Cons!36235 (h!37681 tuple2!24790) (t!50945 List!36239)) )
))
(declare-datatypes ((ListLongMap!22399 0))(
  ( (ListLongMap!22400 (toList!11215 List!36239)) )
))
(declare-fun call!71055 () ListLongMap!22399)

(declare-fun call!71057 () ListLongMap!22399)

(assert (=> bm!71052 (= call!71055 call!71057)))

(declare-fun b!1551502 () Bool)

(declare-fun e!863677 () Bool)

(declare-datatypes ((array!103496 0))(
  ( (array!103497 (arr!49947 (Array (_ BitVec 32) (_ BitVec 64))) (size!50499 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103496)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551502 (= e!863677 (validKeyInArray!0 (select (arr!49947 _keys!618) from!762)))))

(declare-fun b!1551503 () Bool)

(declare-fun e!863681 () ListLongMap!22399)

(declare-fun call!71058 () ListLongMap!22399)

(assert (=> b!1551503 (= e!863681 call!71058)))

(declare-fun b!1551504 () Bool)

(declare-datatypes ((Unit!51498 0))(
  ( (Unit!51499) )
))
(declare-fun e!863683 () Unit!51498)

(declare-fun lt!668621 () Unit!51498)

(assert (=> b!1551504 (= e!863683 lt!668621)))

(declare-fun zeroValue!436 () V!59357)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18182 0))(
  ( (ValueCellFull!18182 (v!21971 V!59357)) (EmptyCell!18182) )
))
(declare-datatypes ((array!103498 0))(
  ( (array!103499 (arr!49948 (Array (_ BitVec 32) ValueCell!18182)) (size!50500 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103498)

(declare-fun lt!668630 () ListLongMap!22399)

(declare-fun minValue!436 () V!59357)

(declare-fun getCurrentListMapNoExtraKeys!6652 (array!103496 array!103498 (_ BitVec 32) (_ BitVec 32) V!59357 V!59357 (_ BitVec 32) Int) ListLongMap!22399)

(assert (=> b!1551504 (= lt!668630 (getCurrentListMapNoExtraKeys!6652 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!668625 () Unit!51498)

(declare-fun addStillContains!1291 (ListLongMap!22399 (_ BitVec 64) V!59357 (_ BitVec 64)) Unit!51498)

(assert (=> b!1551504 (= lt!668625 (addStillContains!1291 lt!668630 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49947 _keys!618) from!762)))))

(declare-fun lt!668622 () ListLongMap!22399)

(declare-fun +!5031 (ListLongMap!22399 tuple2!24790) ListLongMap!22399)

(assert (=> b!1551504 (= lt!668622 (+!5031 lt!668630 (tuple2!24791 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun contains!10080 (ListLongMap!22399 (_ BitVec 64)) Bool)

(assert (=> b!1551504 (contains!10080 lt!668622 (select (arr!49947 _keys!618) from!762))))

(declare-fun addApplyDifferent!626 (ListLongMap!22399 (_ BitVec 64) V!59357 (_ BitVec 64)) Unit!51498)

(assert (=> b!1551504 (= lt!668621 (addApplyDifferent!626 lt!668630 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49947 _keys!618) from!762)))))

(declare-fun lt!668624 () V!59357)

(declare-fun apply!1090 (ListLongMap!22399 (_ BitVec 64)) V!59357)

(assert (=> b!1551504 (= lt!668624 (apply!1090 (+!5031 lt!668630 (tuple2!24791 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49947 _keys!618) from!762)))))

(declare-fun lt!668626 () V!59357)

(assert (=> b!1551504 (= lt!668626 (apply!1090 lt!668630 (select (arr!49947 _keys!618) from!762)))))

(assert (=> b!1551504 (= lt!668624 lt!668626)))

(declare-fun lt!668629 () Unit!51498)

(assert (=> b!1551504 (= lt!668629 (addApplyDifferent!626 lt!668630 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49947 _keys!618) from!762)))))

(assert (=> b!1551504 (= (apply!1090 lt!668622 (select (arr!49947 _keys!618) from!762)) lt!668626)))

(declare-fun bm!71053 () Bool)

(declare-fun call!71059 () ListLongMap!22399)

(assert (=> bm!71053 (= call!71057 call!71059)))

(declare-fun b!1551505 () Bool)

(declare-fun e!863682 () ListLongMap!22399)

(declare-fun call!71056 () ListLongMap!22399)

(assert (=> b!1551505 (= e!863682 (+!5031 call!71056 (tuple2!24791 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1551506 () Bool)

(declare-fun e!863680 () Bool)

(declare-fun e!863679 () Bool)

(declare-fun mapRes!58993 () Bool)

(assert (=> b!1551506 (= e!863680 (and e!863679 mapRes!58993))))

(declare-fun condMapEmpty!58993 () Bool)

(declare-fun mapDefault!58993 () ValueCell!18182)

(assert (=> b!1551506 (= condMapEmpty!58993 (= (arr!49948 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18182)) mapDefault!58993)))))

(declare-fun b!1551507 () Bool)

(declare-fun e!863674 () ListLongMap!22399)

(assert (=> b!1551507 (= e!863674 call!71058)))

(declare-fun b!1551508 () Bool)

(declare-fun tp_is_empty!38185 () Bool)

(assert (=> b!1551508 (= e!863679 tp_is_empty!38185)))

(declare-fun mapIsEmpty!58993 () Bool)

(assert (=> mapIsEmpty!58993 mapRes!58993))

(declare-fun b!1551509 () Bool)

(declare-fun res!1062476 () Bool)

(declare-fun e!863675 () Bool)

(assert (=> b!1551509 (=> (not res!1062476) (not e!863675))))

(assert (=> b!1551509 (= res!1062476 (and (= (size!50500 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50499 _keys!618) (size!50500 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1551510 () Bool)

(assert (=> b!1551510 (= e!863681 call!71055)))

(declare-fun b!1551511 () Bool)

(declare-fun res!1062474 () Bool)

(assert (=> b!1551511 (=> (not res!1062474) (not e!863675))))

(declare-datatypes ((List!36240 0))(
  ( (Nil!36237) (Cons!36236 (h!37682 (_ BitVec 64)) (t!50946 List!36240)) )
))
(declare-fun arrayNoDuplicates!0 (array!103496 (_ BitVec 32) List!36240) Bool)

(assert (=> b!1551511 (= res!1062474 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36237))))

(declare-fun bm!71054 () Bool)

(assert (=> bm!71054 (= call!71058 call!71056)))

(declare-fun b!1551512 () Bool)

(declare-fun c!142756 () Bool)

(declare-fun lt!668623 () Bool)

(assert (=> b!1551512 (= c!142756 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668623))))

(assert (=> b!1551512 (= e!863674 e!863681)))

(declare-fun res!1062478 () Bool)

(assert (=> start!132232 (=> (not res!1062478) (not e!863675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132232 (= res!1062478 (validMask!0 mask!926))))

(assert (=> start!132232 e!863675))

(declare-fun array_inv!39029 (array!103496) Bool)

(assert (=> start!132232 (array_inv!39029 _keys!618)))

(assert (=> start!132232 tp_is_empty!38185))

(assert (=> start!132232 true))

(assert (=> start!132232 tp!111992))

(declare-fun array_inv!39030 (array!103498) Bool)

(assert (=> start!132232 (and (array_inv!39030 _values!470) e!863680)))

(declare-fun b!1551513 () Bool)

(declare-fun res!1062475 () Bool)

(assert (=> b!1551513 (=> (not res!1062475) (not e!863675))))

(assert (=> b!1551513 (= res!1062475 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50499 _keys!618))))))

(declare-fun bm!71055 () Bool)

(assert (=> bm!71055 (= call!71059 (getCurrentListMapNoExtraKeys!6652 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapNonEmpty!58993 () Bool)

(declare-fun tp!111991 () Bool)

(declare-fun e!863678 () Bool)

(assert (=> mapNonEmpty!58993 (= mapRes!58993 (and tp!111991 e!863678))))

(declare-fun mapValue!58993 () ValueCell!18182)

(declare-fun mapKey!58993 () (_ BitVec 32))

(declare-fun mapRest!58993 () (Array (_ BitVec 32) ValueCell!18182))

(assert (=> mapNonEmpty!58993 (= (arr!49948 _values!470) (store mapRest!58993 mapKey!58993 mapValue!58993))))

(declare-fun c!142757 () Bool)

(declare-fun bm!71056 () Bool)

(declare-fun c!142755 () Bool)

(assert (=> bm!71056 (= call!71056 (+!5031 (ite c!142755 call!71059 (ite c!142757 call!71057 call!71055)) (ite (or c!142755 c!142757) (tuple2!24791 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24791 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1551514 () Bool)

(declare-fun Unit!51500 () Unit!51498)

(assert (=> b!1551514 (= e!863683 Unit!51500)))

(declare-fun b!1551515 () Bool)

(declare-fun res!1062473 () Bool)

(assert (=> b!1551515 (=> (not res!1062473) (not e!863675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103496 (_ BitVec 32)) Bool)

(assert (=> b!1551515 (= res!1062473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1551516 () Bool)

(assert (=> b!1551516 (= e!863682 e!863674)))

(assert (=> b!1551516 (= c!142757 (and (not lt!668623) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1551517 () Bool)

(assert (=> b!1551517 (= e!863678 tp_is_empty!38185)))

(declare-fun b!1551518 () Bool)

(assert (=> b!1551518 (= e!863675 false)))

(declare-fun lt!668628 () Unit!51498)

(assert (=> b!1551518 (= lt!668628 e!863683)))

(declare-fun c!142758 () Bool)

(assert (=> b!1551518 (= c!142758 e!863677)))

(declare-fun res!1062477 () Bool)

(assert (=> b!1551518 (=> (not res!1062477) (not e!863677))))

(assert (=> b!1551518 (= res!1062477 (bvslt from!762 (size!50499 _keys!618)))))

(declare-fun lt!668627 () ListLongMap!22399)

(assert (=> b!1551518 (= lt!668627 e!863682)))

(assert (=> b!1551518 (= c!142755 (and (not lt!668623) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1551518 (= lt!668623 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!132232 res!1062478) b!1551509))

(assert (= (and b!1551509 res!1062476) b!1551515))

(assert (= (and b!1551515 res!1062473) b!1551511))

(assert (= (and b!1551511 res!1062474) b!1551513))

(assert (= (and b!1551513 res!1062475) b!1551518))

(assert (= (and b!1551518 c!142755) b!1551505))

(assert (= (and b!1551518 (not c!142755)) b!1551516))

(assert (= (and b!1551516 c!142757) b!1551507))

(assert (= (and b!1551516 (not c!142757)) b!1551512))

(assert (= (and b!1551512 c!142756) b!1551503))

(assert (= (and b!1551512 (not c!142756)) b!1551510))

(assert (= (or b!1551503 b!1551510) bm!71052))

(assert (= (or b!1551507 bm!71052) bm!71053))

(assert (= (or b!1551507 b!1551503) bm!71054))

(assert (= (or b!1551505 bm!71053) bm!71055))

(assert (= (or b!1551505 bm!71054) bm!71056))

(assert (= (and b!1551518 res!1062477) b!1551502))

(assert (= (and b!1551518 c!142758) b!1551504))

(assert (= (and b!1551518 (not c!142758)) b!1551514))

(assert (= (and b!1551506 condMapEmpty!58993) mapIsEmpty!58993))

(assert (= (and b!1551506 (not condMapEmpty!58993)) mapNonEmpty!58993))

(get-info :version)

(assert (= (and mapNonEmpty!58993 ((_ is ValueCellFull!18182) mapValue!58993)) b!1551517))

(assert (= (and b!1551506 ((_ is ValueCellFull!18182) mapDefault!58993)) b!1551508))

(assert (= start!132232 b!1551506))

(declare-fun m!1429567 () Bool)

(assert (=> b!1551502 m!1429567))

(assert (=> b!1551502 m!1429567))

(declare-fun m!1429569 () Bool)

(assert (=> b!1551502 m!1429569))

(declare-fun m!1429571 () Bool)

(assert (=> mapNonEmpty!58993 m!1429571))

(declare-fun m!1429573 () Bool)

(assert (=> b!1551511 m!1429573))

(assert (=> b!1551504 m!1429567))

(declare-fun m!1429575 () Bool)

(assert (=> b!1551504 m!1429575))

(assert (=> b!1551504 m!1429567))

(declare-fun m!1429577 () Bool)

(assert (=> b!1551504 m!1429577))

(assert (=> b!1551504 m!1429567))

(declare-fun m!1429579 () Bool)

(assert (=> b!1551504 m!1429579))

(declare-fun m!1429581 () Bool)

(assert (=> b!1551504 m!1429581))

(assert (=> b!1551504 m!1429567))

(declare-fun m!1429583 () Bool)

(assert (=> b!1551504 m!1429583))

(assert (=> b!1551504 m!1429567))

(declare-fun m!1429585 () Bool)

(assert (=> b!1551504 m!1429585))

(assert (=> b!1551504 m!1429567))

(declare-fun m!1429587 () Bool)

(assert (=> b!1551504 m!1429587))

(declare-fun m!1429589 () Bool)

(assert (=> b!1551504 m!1429589))

(assert (=> b!1551504 m!1429567))

(declare-fun m!1429591 () Bool)

(assert (=> b!1551504 m!1429591))

(assert (=> b!1551504 m!1429589))

(assert (=> b!1551504 m!1429567))

(declare-fun m!1429593 () Bool)

(assert (=> b!1551504 m!1429593))

(assert (=> bm!71055 m!1429581))

(declare-fun m!1429595 () Bool)

(assert (=> bm!71056 m!1429595))

(declare-fun m!1429597 () Bool)

(assert (=> start!132232 m!1429597))

(declare-fun m!1429599 () Bool)

(assert (=> start!132232 m!1429599))

(declare-fun m!1429601 () Bool)

(assert (=> start!132232 m!1429601))

(declare-fun m!1429603 () Bool)

(assert (=> b!1551505 m!1429603))

(declare-fun m!1429605 () Bool)

(assert (=> b!1551515 m!1429605))

(check-sat (not mapNonEmpty!58993) (not bm!71055) (not b!1551511) (not b_next!31909) (not b!1551504) tp_is_empty!38185 (not bm!71056) (not b!1551515) (not start!132232) (not b!1551502) b_and!51329 (not b!1551505))
(check-sat b_and!51329 (not b_next!31909))
