; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132120 () Bool)

(assert start!132120)

(declare-fun b_free!31833 () Bool)

(declare-fun b_next!31833 () Bool)

(assert (=> start!132120 (= b_free!31833 (not b_next!31833))))

(declare-fun tp!111750 () Bool)

(declare-fun b_and!51243 () Bool)

(assert (=> start!132120 (= tp!111750 b_and!51243)))

(declare-fun b!1549433 () Bool)

(declare-datatypes ((V!59255 0))(
  ( (V!59256 (val!19132 Int)) )
))
(declare-datatypes ((tuple2!24642 0))(
  ( (tuple2!24643 (_1!12332 (_ BitVec 64)) (_2!12332 V!59255)) )
))
(declare-datatypes ((List!36127 0))(
  ( (Nil!36124) (Cons!36123 (h!37568 tuple2!24642) (t!50821 List!36127)) )
))
(declare-datatypes ((ListLongMap!22251 0))(
  ( (ListLongMap!22252 (toList!11141 List!36127)) )
))
(declare-fun e!862476 () ListLongMap!22251)

(declare-fun call!70475 () ListLongMap!22251)

(assert (=> b!1549433 (= e!862476 call!70475)))

(declare-fun b!1549434 () Bool)

(declare-fun res!1061559 () Bool)

(declare-fun e!862468 () Bool)

(assert (=> b!1549434 (=> (not res!1061559) (not e!862468))))

(declare-datatypes ((array!103414 0))(
  ( (array!103415 (arr!49909 (Array (_ BitVec 32) (_ BitVec 64))) (size!50459 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103414)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549434 (= res!1061559 (validKeyInArray!0 (select (arr!49909 _keys!618) from!762)))))

(declare-fun b!1549435 () Bool)

(declare-fun res!1061554 () Bool)

(declare-fun e!862472 () Bool)

(assert (=> b!1549435 (=> (not res!1061554) (not e!862472))))

(assert (=> b!1549435 (= res!1061554 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50459 _keys!618))))))

(declare-fun mapIsEmpty!58867 () Bool)

(declare-fun mapRes!58867 () Bool)

(assert (=> mapIsEmpty!58867 mapRes!58867))

(declare-fun b!1549436 () Bool)

(assert (=> b!1549436 (= e!862468 (not true))))

(declare-fun lt!667862 () Bool)

(declare-fun lt!667865 () ListLongMap!22251)

(declare-fun contains!10088 (ListLongMap!22251 (_ BitVec 64)) Bool)

(assert (=> b!1549436 (= lt!667862 (contains!10088 lt!667865 (select (arr!49909 _keys!618) from!762)))))

(declare-fun lt!667859 () ListLongMap!22251)

(declare-fun lt!667857 () V!59255)

(declare-fun apply!1081 (ListLongMap!22251 (_ BitVec 64)) V!59255)

(assert (=> b!1549436 (= (apply!1081 lt!667859 (select (arr!49909 _keys!618) from!762)) lt!667857)))

(declare-fun zeroValue!436 () V!59255)

(declare-datatypes ((Unit!51612 0))(
  ( (Unit!51613) )
))
(declare-fun lt!667864 () Unit!51612)

(declare-fun addApplyDifferent!623 (ListLongMap!22251 (_ BitVec 64) V!59255 (_ BitVec 64)) Unit!51612)

(assert (=> b!1549436 (= lt!667864 (addApplyDifferent!623 lt!667865 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49909 _keys!618) from!762)))))

(declare-fun lt!667858 () V!59255)

(assert (=> b!1549436 (= lt!667858 lt!667857)))

(assert (=> b!1549436 (= lt!667857 (apply!1081 lt!667865 (select (arr!49909 _keys!618) from!762)))))

(declare-fun minValue!436 () V!59255)

(declare-fun +!4967 (ListLongMap!22251 tuple2!24642) ListLongMap!22251)

(assert (=> b!1549436 (= lt!667858 (apply!1081 (+!4967 lt!667865 (tuple2!24643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49909 _keys!618) from!762)))))

(declare-fun lt!667863 () Unit!51612)

(assert (=> b!1549436 (= lt!667863 (addApplyDifferent!623 lt!667865 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49909 _keys!618) from!762)))))

(assert (=> b!1549436 (contains!10088 lt!667859 (select (arr!49909 _keys!618) from!762))))

(assert (=> b!1549436 (= lt!667859 (+!4967 lt!667865 (tuple2!24643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667861 () Unit!51612)

(declare-fun addStillContains!1276 (ListLongMap!22251 (_ BitVec 64) V!59255 (_ BitVec 64)) Unit!51612)

(assert (=> b!1549436 (= lt!667861 (addStillContains!1276 lt!667865 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49909 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18144 0))(
  ( (ValueCellFull!18144 (v!21933 V!59255)) (EmptyCell!18144) )
))
(declare-datatypes ((array!103416 0))(
  ( (array!103417 (arr!49910 (Array (_ BitVec 32) ValueCell!18144)) (size!50460 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103416)

(declare-fun getCurrentListMapNoExtraKeys!6593 (array!103414 array!103416 (_ BitVec 32) (_ BitVec 32) V!59255 V!59255 (_ BitVec 32) Int) ListLongMap!22251)

(assert (=> b!1549436 (= lt!667865 (getCurrentListMapNoExtraKeys!6593 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70472 () Bool)

(declare-fun call!70478 () ListLongMap!22251)

(declare-fun call!70477 () ListLongMap!22251)

(assert (=> bm!70472 (= call!70478 call!70477)))

(declare-fun res!1061558 () Bool)

(assert (=> start!132120 (=> (not res!1061558) (not e!862472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132120 (= res!1061558 (validMask!0 mask!926))))

(assert (=> start!132120 e!862472))

(declare-fun array_inv!38799 (array!103414) Bool)

(assert (=> start!132120 (array_inv!38799 _keys!618)))

(declare-fun tp_is_empty!38109 () Bool)

(assert (=> start!132120 tp_is_empty!38109))

(assert (=> start!132120 true))

(assert (=> start!132120 tp!111750))

(declare-fun e!862471 () Bool)

(declare-fun array_inv!38800 (array!103416) Bool)

(assert (=> start!132120 (and (array_inv!38800 _values!470) e!862471)))

(declare-fun bm!70473 () Bool)

(declare-fun call!70479 () ListLongMap!22251)

(assert (=> bm!70473 (= call!70475 call!70479)))

(declare-fun b!1549437 () Bool)

(declare-fun res!1061553 () Bool)

(assert (=> b!1549437 (=> (not res!1061553) (not e!862472))))

(declare-datatypes ((List!36128 0))(
  ( (Nil!36125) (Cons!36124 (h!37569 (_ BitVec 64)) (t!50822 List!36128)) )
))
(declare-fun arrayNoDuplicates!0 (array!103414 (_ BitVec 32) List!36128) Bool)

(assert (=> b!1549437 (= res!1061553 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36125))))

(declare-fun b!1549438 () Bool)

(declare-fun c!142378 () Bool)

(declare-fun lt!667856 () Bool)

(assert (=> b!1549438 (= c!142378 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667856))))

(declare-fun e!862474 () ListLongMap!22251)

(assert (=> b!1549438 (= e!862474 e!862476)))

(declare-fun b!1549439 () Bool)

(declare-fun res!1061556 () Bool)

(assert (=> b!1549439 (=> (not res!1061556) (not e!862472))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103414 (_ BitVec 32)) Bool)

(assert (=> b!1549439 (= res!1061556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!70474 () Bool)

(declare-fun call!70476 () ListLongMap!22251)

(assert (=> bm!70474 (= call!70477 call!70476)))

(declare-fun b!1549440 () Bool)

(assert (=> b!1549440 (= e!862474 call!70475)))

(declare-fun b!1549441 () Bool)

(declare-fun e!862469 () Bool)

(assert (=> b!1549441 (= e!862471 (and e!862469 mapRes!58867))))

(declare-fun condMapEmpty!58867 () Bool)

(declare-fun mapDefault!58867 () ValueCell!18144)

(assert (=> b!1549441 (= condMapEmpty!58867 (= (arr!49910 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18144)) mapDefault!58867)))))

(declare-fun b!1549442 () Bool)

(declare-fun e!862473 () Bool)

(assert (=> b!1549442 (= e!862473 tp_is_empty!38109)))

(declare-fun mapNonEmpty!58867 () Bool)

(declare-fun tp!111751 () Bool)

(assert (=> mapNonEmpty!58867 (= mapRes!58867 (and tp!111751 e!862473))))

(declare-fun mapKey!58867 () (_ BitVec 32))

(declare-fun mapRest!58867 () (Array (_ BitVec 32) ValueCell!18144))

(declare-fun mapValue!58867 () ValueCell!18144)

(assert (=> mapNonEmpty!58867 (= (arr!49910 _values!470) (store mapRest!58867 mapKey!58867 mapValue!58867))))

(declare-fun b!1549443 () Bool)

(declare-fun res!1061555 () Bool)

(assert (=> b!1549443 (=> (not res!1061555) (not e!862472))))

(assert (=> b!1549443 (= res!1061555 (and (= (size!50460 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50459 _keys!618) (size!50460 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1549444 () Bool)

(declare-fun e!862475 () ListLongMap!22251)

(assert (=> b!1549444 (= e!862475 e!862474)))

(declare-fun c!142377 () Bool)

(assert (=> b!1549444 (= c!142377 (and (not lt!667856) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!70475 () Bool)

(assert (=> bm!70475 (= call!70476 (getCurrentListMapNoExtraKeys!6593 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549445 () Bool)

(assert (=> b!1549445 (= e!862472 e!862468)))

(declare-fun res!1061557 () Bool)

(assert (=> b!1549445 (=> (not res!1061557) (not e!862468))))

(assert (=> b!1549445 (= res!1061557 (bvslt from!762 (size!50459 _keys!618)))))

(declare-fun lt!667860 () ListLongMap!22251)

(assert (=> b!1549445 (= lt!667860 e!862475)))

(declare-fun c!142379 () Bool)

(assert (=> b!1549445 (= c!142379 (and (not lt!667856) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549445 (= lt!667856 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1549446 () Bool)

(assert (=> b!1549446 (= e!862475 (+!4967 call!70479 (tuple2!24643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1549447 () Bool)

(assert (=> b!1549447 (= e!862469 tp_is_empty!38109)))

(declare-fun b!1549448 () Bool)

(assert (=> b!1549448 (= e!862476 call!70478)))

(declare-fun bm!70476 () Bool)

(assert (=> bm!70476 (= call!70479 (+!4967 (ite c!142379 call!70476 (ite c!142377 call!70477 call!70478)) (ite (or c!142379 c!142377) (tuple2!24643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and start!132120 res!1061558) b!1549443))

(assert (= (and b!1549443 res!1061555) b!1549439))

(assert (= (and b!1549439 res!1061556) b!1549437))

(assert (= (and b!1549437 res!1061553) b!1549435))

(assert (= (and b!1549435 res!1061554) b!1549445))

(assert (= (and b!1549445 c!142379) b!1549446))

(assert (= (and b!1549445 (not c!142379)) b!1549444))

(assert (= (and b!1549444 c!142377) b!1549440))

(assert (= (and b!1549444 (not c!142377)) b!1549438))

(assert (= (and b!1549438 c!142378) b!1549433))

(assert (= (and b!1549438 (not c!142378)) b!1549448))

(assert (= (or b!1549433 b!1549448) bm!70472))

(assert (= (or b!1549440 bm!70472) bm!70474))

(assert (= (or b!1549440 b!1549433) bm!70473))

(assert (= (or b!1549446 bm!70474) bm!70475))

(assert (= (or b!1549446 bm!70473) bm!70476))

(assert (= (and b!1549445 res!1061557) b!1549434))

(assert (= (and b!1549434 res!1061559) b!1549436))

(assert (= (and b!1549441 condMapEmpty!58867) mapIsEmpty!58867))

(assert (= (and b!1549441 (not condMapEmpty!58867)) mapNonEmpty!58867))

(get-info :version)

(assert (= (and mapNonEmpty!58867 ((_ is ValueCellFull!18144) mapValue!58867)) b!1549442))

(assert (= (and b!1549441 ((_ is ValueCellFull!18144) mapDefault!58867)) b!1549447))

(assert (= start!132120 b!1549441))

(declare-fun m!1428673 () Bool)

(assert (=> b!1549436 m!1428673))

(declare-fun m!1428675 () Bool)

(assert (=> b!1549436 m!1428675))

(declare-fun m!1428677 () Bool)

(assert (=> b!1549436 m!1428677))

(assert (=> b!1549436 m!1428675))

(assert (=> b!1549436 m!1428675))

(declare-fun m!1428679 () Bool)

(assert (=> b!1549436 m!1428679))

(assert (=> b!1549436 m!1428675))

(declare-fun m!1428681 () Bool)

(assert (=> b!1549436 m!1428681))

(assert (=> b!1549436 m!1428675))

(declare-fun m!1428683 () Bool)

(assert (=> b!1549436 m!1428683))

(declare-fun m!1428685 () Bool)

(assert (=> b!1549436 m!1428685))

(assert (=> b!1549436 m!1428675))

(declare-fun m!1428687 () Bool)

(assert (=> b!1549436 m!1428687))

(assert (=> b!1549436 m!1428673))

(assert (=> b!1549436 m!1428675))

(declare-fun m!1428689 () Bool)

(assert (=> b!1549436 m!1428689))

(declare-fun m!1428691 () Bool)

(assert (=> b!1549436 m!1428691))

(assert (=> b!1549436 m!1428675))

(declare-fun m!1428693 () Bool)

(assert (=> b!1549436 m!1428693))

(assert (=> b!1549436 m!1428675))

(declare-fun m!1428695 () Bool)

(assert (=> b!1549436 m!1428695))

(assert (=> b!1549434 m!1428675))

(assert (=> b!1549434 m!1428675))

(declare-fun m!1428697 () Bool)

(assert (=> b!1549434 m!1428697))

(declare-fun m!1428699 () Bool)

(assert (=> b!1549437 m!1428699))

(declare-fun m!1428701 () Bool)

(assert (=> start!132120 m!1428701))

(declare-fun m!1428703 () Bool)

(assert (=> start!132120 m!1428703))

(declare-fun m!1428705 () Bool)

(assert (=> start!132120 m!1428705))

(declare-fun m!1428707 () Bool)

(assert (=> mapNonEmpty!58867 m!1428707))

(declare-fun m!1428709 () Bool)

(assert (=> b!1549439 m!1428709))

(declare-fun m!1428711 () Bool)

(assert (=> b!1549446 m!1428711))

(assert (=> bm!70475 m!1428691))

(declare-fun m!1428713 () Bool)

(assert (=> bm!70476 m!1428713))

(check-sat (not mapNonEmpty!58867) (not b!1549434) (not b!1549437) (not bm!70476) (not bm!70475) tp_is_empty!38109 (not b!1549436) (not b_next!31833) b_and!51243 (not start!132120) (not b!1549446) (not b!1549439))
(check-sat b_and!51243 (not b_next!31833))
