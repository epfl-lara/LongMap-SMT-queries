; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132518 () Bool)

(assert start!132518)

(declare-fun b_free!31819 () Bool)

(declare-fun b_next!31819 () Bool)

(assert (=> start!132518 (= b_free!31819 (not b_next!31819))))

(declare-fun tp!111708 () Bool)

(declare-fun b_and!51231 () Bool)

(assert (=> start!132518 (= tp!111708 b_and!51231)))

(declare-fun b!1551533 () Bool)

(declare-datatypes ((V!59237 0))(
  ( (V!59238 (val!19125 Int)) )
))
(declare-datatypes ((tuple2!24688 0))(
  ( (tuple2!24689 (_1!12355 (_ BitVec 64)) (_2!12355 V!59237)) )
))
(declare-datatypes ((List!36154 0))(
  ( (Nil!36151) (Cons!36150 (h!37613 tuple2!24688) (t!50840 List!36154)) )
))
(declare-datatypes ((ListLongMap!22305 0))(
  ( (ListLongMap!22306 (toList!11168 List!36154)) )
))
(declare-fun e!863789 () ListLongMap!22305)

(declare-fun call!70524 () ListLongMap!22305)

(declare-fun minValue!436 () V!59237)

(declare-fun +!5005 (ListLongMap!22305 tuple2!24688) ListLongMap!22305)

(assert (=> b!1551533 (= e!863789 (+!5005 call!70524 (tuple2!24689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1551534 () Bool)

(declare-fun e!863796 () Bool)

(declare-fun e!863790 () Bool)

(assert (=> b!1551534 (= e!863796 e!863790)))

(declare-fun res!1062270 () Bool)

(assert (=> b!1551534 (=> (not res!1062270) (not e!863790))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103514 0))(
  ( (array!103515 (arr!49952 (Array (_ BitVec 32) (_ BitVec 64))) (size!50503 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103514)

(assert (=> b!1551534 (= res!1062270 (bvslt from!762 (size!50503 _keys!618)))))

(declare-fun lt!668576 () ListLongMap!22305)

(assert (=> b!1551534 (= lt!668576 e!863789)))

(declare-fun c!143115 () Bool)

(declare-fun lt!668578 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1551534 (= c!143115 (and (not lt!668578) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1551534 (= lt!668578 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1551535 () Bool)

(declare-fun res!1062269 () Bool)

(assert (=> b!1551535 (=> (not res!1062269) (not e!863796))))

(assert (=> b!1551535 (= res!1062269 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50503 _keys!618))))))

(declare-fun mapIsEmpty!58846 () Bool)

(declare-fun mapRes!58846 () Bool)

(assert (=> mapIsEmpty!58846 mapRes!58846))

(declare-fun zeroValue!436 () V!59237)

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18137 0))(
  ( (ValueCellFull!18137 (v!21918 V!59237)) (EmptyCell!18137) )
))
(declare-datatypes ((array!103516 0))(
  ( (array!103517 (arr!49953 (Array (_ BitVec 32) ValueCell!18137)) (size!50504 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103516)

(declare-fun call!70520 () ListLongMap!22305)

(declare-fun bm!70517 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6638 (array!103514 array!103516 (_ BitVec 32) (_ BitVec 32) V!59237 V!59237 (_ BitVec 32) Int) ListLongMap!22305)

(assert (=> bm!70517 (= call!70520 (getCurrentListMapNoExtraKeys!6638 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1551536 () Bool)

(declare-fun e!863795 () Bool)

(declare-fun e!863794 () Bool)

(assert (=> b!1551536 (= e!863795 (and e!863794 mapRes!58846))))

(declare-fun condMapEmpty!58846 () Bool)

(declare-fun mapDefault!58846 () ValueCell!18137)

(assert (=> b!1551536 (= condMapEmpty!58846 (= (arr!49953 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18137)) mapDefault!58846)))))

(declare-fun b!1551537 () Bool)

(declare-fun res!1062266 () Bool)

(assert (=> b!1551537 (=> (not res!1062266) (not e!863796))))

(assert (=> b!1551537 (= res!1062266 (and (= (size!50504 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50503 _keys!618) (size!50504 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1551538 () Bool)

(declare-fun res!1062271 () Bool)

(assert (=> b!1551538 (=> (not res!1062271) (not e!863796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103514 (_ BitVec 32)) Bool)

(assert (=> b!1551538 (= res!1062271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1551539 () Bool)

(declare-fun tp_is_empty!38095 () Bool)

(assert (=> b!1551539 (= e!863794 tp_is_empty!38095)))

(declare-fun b!1551540 () Bool)

(declare-fun res!1062272 () Bool)

(assert (=> b!1551540 (=> (not res!1062272) (not e!863796))))

(declare-datatypes ((List!36155 0))(
  ( (Nil!36152) (Cons!36151 (h!37614 (_ BitVec 64)) (t!50841 List!36155)) )
))
(declare-fun arrayNoDuplicates!0 (array!103514 (_ BitVec 32) List!36155) Bool)

(assert (=> b!1551540 (= res!1062272 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36152))))

(declare-fun b!1551541 () Bool)

(declare-fun e!863791 () ListLongMap!22305)

(declare-fun call!70521 () ListLongMap!22305)

(assert (=> b!1551541 (= e!863791 call!70521)))

(declare-fun bm!70519 () Bool)

(declare-fun call!70523 () ListLongMap!22305)

(assert (=> bm!70519 (= call!70523 call!70520)))

(declare-fun mapNonEmpty!58846 () Bool)

(declare-fun tp!111709 () Bool)

(declare-fun e!863793 () Bool)

(assert (=> mapNonEmpty!58846 (= mapRes!58846 (and tp!111709 e!863793))))

(declare-fun mapRest!58846 () (Array (_ BitVec 32) ValueCell!18137))

(declare-fun mapKey!58846 () (_ BitVec 32))

(declare-fun mapValue!58846 () ValueCell!18137)

(assert (=> mapNonEmpty!58846 (= (arr!49953 _values!470) (store mapRest!58846 mapKey!58846 mapValue!58846))))

(declare-fun b!1551542 () Bool)

(declare-fun e!863792 () ListLongMap!22305)

(declare-fun call!70522 () ListLongMap!22305)

(assert (=> b!1551542 (= e!863792 call!70522)))

(declare-fun b!1551543 () Bool)

(assert (=> b!1551543 (= e!863792 call!70521)))

(declare-fun b!1551544 () Bool)

(assert (=> b!1551544 (= e!863790 (not true))))

(declare-fun lt!668573 () V!59237)

(declare-fun lt!668574 () ListLongMap!22305)

(declare-fun apply!1085 (ListLongMap!22305 (_ BitVec 64)) V!59237)

(assert (=> b!1551544 (= (apply!1085 lt!668574 (select (arr!49952 _keys!618) from!762)) lt!668573)))

(declare-fun lt!668570 () ListLongMap!22305)

(declare-datatypes ((Unit!51535 0))(
  ( (Unit!51536) )
))
(declare-fun lt!668575 () Unit!51535)

(declare-fun addApplyDifferent!614 (ListLongMap!22305 (_ BitVec 64) V!59237 (_ BitVec 64)) Unit!51535)

(assert (=> b!1551544 (= lt!668575 (addApplyDifferent!614 lt!668570 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49952 _keys!618) from!762)))))

(declare-fun lt!668577 () V!59237)

(assert (=> b!1551544 (= lt!668577 lt!668573)))

(assert (=> b!1551544 (= lt!668573 (apply!1085 lt!668570 (select (arr!49952 _keys!618) from!762)))))

(assert (=> b!1551544 (= lt!668577 (apply!1085 (+!5005 lt!668570 (tuple2!24689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49952 _keys!618) from!762)))))

(declare-fun lt!668571 () Unit!51535)

(assert (=> b!1551544 (= lt!668571 (addApplyDifferent!614 lt!668570 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49952 _keys!618) from!762)))))

(declare-fun contains!10133 (ListLongMap!22305 (_ BitVec 64)) Bool)

(assert (=> b!1551544 (contains!10133 lt!668574 (select (arr!49952 _keys!618) from!762))))

(assert (=> b!1551544 (= lt!668574 (+!5005 lt!668570 (tuple2!24689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!668572 () Unit!51535)

(declare-fun addStillContains!1275 (ListLongMap!22305 (_ BitVec 64) V!59237 (_ BitVec 64)) Unit!51535)

(assert (=> b!1551544 (= lt!668572 (addStillContains!1275 lt!668570 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49952 _keys!618) from!762)))))

(assert (=> b!1551544 (= lt!668570 (getCurrentListMapNoExtraKeys!6638 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1551545 () Bool)

(declare-fun c!143116 () Bool)

(assert (=> b!1551545 (= c!143116 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668578))))

(assert (=> b!1551545 (= e!863791 e!863792)))

(declare-fun b!1551546 () Bool)

(assert (=> b!1551546 (= e!863793 tp_is_empty!38095)))

(declare-fun res!1062267 () Bool)

(assert (=> start!132518 (=> (not res!1062267) (not e!863796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132518 (= res!1062267 (validMask!0 mask!926))))

(assert (=> start!132518 e!863796))

(declare-fun array_inv!39103 (array!103514) Bool)

(assert (=> start!132518 (array_inv!39103 _keys!618)))

(assert (=> start!132518 tp_is_empty!38095))

(assert (=> start!132518 true))

(assert (=> start!132518 tp!111708))

(declare-fun array_inv!39104 (array!103516) Bool)

(assert (=> start!132518 (and (array_inv!39104 _values!470) e!863795)))

(declare-fun bm!70518 () Bool)

(assert (=> bm!70518 (= call!70522 call!70523)))

(declare-fun bm!70520 () Bool)

(assert (=> bm!70520 (= call!70521 call!70524)))

(declare-fun b!1551547 () Bool)

(declare-fun res!1062268 () Bool)

(assert (=> b!1551547 (=> (not res!1062268) (not e!863790))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551547 (= res!1062268 (validKeyInArray!0 (select (arr!49952 _keys!618) from!762)))))

(declare-fun b!1551548 () Bool)

(assert (=> b!1551548 (= e!863789 e!863791)))

(declare-fun c!143114 () Bool)

(assert (=> b!1551548 (= c!143114 (and (not lt!668578) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!70521 () Bool)

(assert (=> bm!70521 (= call!70524 (+!5005 (ite c!143115 call!70520 (ite c!143114 call!70523 call!70522)) (ite (or c!143115 c!143114) (tuple2!24689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and start!132518 res!1062267) b!1551537))

(assert (= (and b!1551537 res!1062266) b!1551538))

(assert (= (and b!1551538 res!1062271) b!1551540))

(assert (= (and b!1551540 res!1062272) b!1551535))

(assert (= (and b!1551535 res!1062269) b!1551534))

(assert (= (and b!1551534 c!143115) b!1551533))

(assert (= (and b!1551534 (not c!143115)) b!1551548))

(assert (= (and b!1551548 c!143114) b!1551541))

(assert (= (and b!1551548 (not c!143114)) b!1551545))

(assert (= (and b!1551545 c!143116) b!1551543))

(assert (= (and b!1551545 (not c!143116)) b!1551542))

(assert (= (or b!1551543 b!1551542) bm!70518))

(assert (= (or b!1551541 bm!70518) bm!70519))

(assert (= (or b!1551541 b!1551543) bm!70520))

(assert (= (or b!1551533 bm!70519) bm!70517))

(assert (= (or b!1551533 bm!70520) bm!70521))

(assert (= (and b!1551534 res!1062270) b!1551547))

(assert (= (and b!1551547 res!1062268) b!1551544))

(assert (= (and b!1551536 condMapEmpty!58846) mapIsEmpty!58846))

(assert (= (and b!1551536 (not condMapEmpty!58846)) mapNonEmpty!58846))

(get-info :version)

(assert (= (and mapNonEmpty!58846 ((_ is ValueCellFull!18137) mapValue!58846)) b!1551546))

(assert (= (and b!1551536 ((_ is ValueCellFull!18137) mapDefault!58846)) b!1551539))

(assert (= start!132518 b!1551536))

(declare-fun m!1430649 () Bool)

(assert (=> b!1551538 m!1430649))

(declare-fun m!1430651 () Bool)

(assert (=> b!1551547 m!1430651))

(assert (=> b!1551547 m!1430651))

(declare-fun m!1430653 () Bool)

(assert (=> b!1551547 m!1430653))

(declare-fun m!1430655 () Bool)

(assert (=> start!132518 m!1430655))

(declare-fun m!1430657 () Bool)

(assert (=> start!132518 m!1430657))

(declare-fun m!1430659 () Bool)

(assert (=> start!132518 m!1430659))

(declare-fun m!1430661 () Bool)

(assert (=> mapNonEmpty!58846 m!1430661))

(declare-fun m!1430663 () Bool)

(assert (=> bm!70517 m!1430663))

(declare-fun m!1430665 () Bool)

(assert (=> b!1551540 m!1430665))

(assert (=> b!1551544 m!1430651))

(declare-fun m!1430667 () Bool)

(assert (=> b!1551544 m!1430667))

(assert (=> b!1551544 m!1430663))

(assert (=> b!1551544 m!1430651))

(assert (=> b!1551544 m!1430651))

(declare-fun m!1430669 () Bool)

(assert (=> b!1551544 m!1430669))

(declare-fun m!1430671 () Bool)

(assert (=> b!1551544 m!1430671))

(assert (=> b!1551544 m!1430651))

(declare-fun m!1430673 () Bool)

(assert (=> b!1551544 m!1430673))

(declare-fun m!1430675 () Bool)

(assert (=> b!1551544 m!1430675))

(assert (=> b!1551544 m!1430651))

(declare-fun m!1430677 () Bool)

(assert (=> b!1551544 m!1430677))

(assert (=> b!1551544 m!1430671))

(assert (=> b!1551544 m!1430651))

(declare-fun m!1430679 () Bool)

(assert (=> b!1551544 m!1430679))

(assert (=> b!1551544 m!1430651))

(declare-fun m!1430681 () Bool)

(assert (=> b!1551544 m!1430681))

(assert (=> b!1551544 m!1430651))

(declare-fun m!1430683 () Bool)

(assert (=> b!1551544 m!1430683))

(declare-fun m!1430685 () Bool)

(assert (=> b!1551533 m!1430685))

(declare-fun m!1430687 () Bool)

(assert (=> bm!70521 m!1430687))

(check-sat (not b!1551538) (not start!132518) (not b!1551544) (not bm!70521) (not b!1551533) tp_is_empty!38095 (not bm!70517) b_and!51231 (not b!1551540) (not b_next!31819) (not b!1551547) (not mapNonEmpty!58846))
(check-sat b_and!51231 (not b_next!31819))
