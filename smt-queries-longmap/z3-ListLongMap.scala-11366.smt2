; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132512 () Bool)

(assert start!132512)

(declare-fun b_free!31813 () Bool)

(declare-fun b_next!31813 () Bool)

(assert (=> start!132512 (= b_free!31813 (not b_next!31813))))

(declare-fun tp!111691 () Bool)

(declare-fun b_and!51225 () Bool)

(assert (=> start!132512 (= tp!111691 b_and!51225)))

(declare-fun b!1551389 () Bool)

(declare-fun e!863707 () Bool)

(declare-fun tp_is_empty!38089 () Bool)

(assert (=> b!1551389 (= e!863707 tp_is_empty!38089)))

(declare-datatypes ((array!103502 0))(
  ( (array!103503 (arr!49946 (Array (_ BitVec 32) (_ BitVec 64))) (size!50497 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103502)

(declare-datatypes ((V!59229 0))(
  ( (V!59230 (val!19122 Int)) )
))
(declare-fun zeroValue!436 () V!59229)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-datatypes ((tuple2!24682 0))(
  ( (tuple2!24683 (_1!12352 (_ BitVec 64)) (_2!12352 V!59229)) )
))
(declare-datatypes ((List!36150 0))(
  ( (Nil!36147) (Cons!36146 (h!37609 tuple2!24682) (t!50836 List!36150)) )
))
(declare-datatypes ((ListLongMap!22299 0))(
  ( (ListLongMap!22300 (toList!11165 List!36150)) )
))
(declare-fun call!70479 () ListLongMap!22299)

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18134 0))(
  ( (ValueCellFull!18134 (v!21915 V!59229)) (EmptyCell!18134) )
))
(declare-datatypes ((array!103504 0))(
  ( (array!103505 (arr!49947 (Array (_ BitVec 32) ValueCell!18134)) (size!50498 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103504)

(declare-fun minValue!436 () V!59229)

(declare-fun bm!70472 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6637 (array!103502 array!103504 (_ BitVec 32) (_ BitVec 32) V!59229 V!59229 (_ BitVec 32) Int) ListLongMap!22299)

(assert (=> bm!70472 (= call!70479 (getCurrentListMapNoExtraKeys!6637 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70473 () Bool)

(declare-fun call!70475 () ListLongMap!22299)

(assert (=> bm!70473 (= call!70475 call!70479)))

(declare-fun b!1551390 () Bool)

(declare-fun e!863708 () Bool)

(assert (=> b!1551390 (= e!863708 tp_is_empty!38089)))

(declare-fun b!1551391 () Bool)

(declare-fun e!863711 () ListLongMap!22299)

(declare-fun e!863713 () ListLongMap!22299)

(assert (=> b!1551391 (= e!863711 e!863713)))

(declare-fun c!143087 () Bool)

(declare-fun lt!668496 () Bool)

(assert (=> b!1551391 (= c!143087 (and (not lt!668496) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!58837 () Bool)

(declare-fun mapRes!58837 () Bool)

(declare-fun tp!111690 () Bool)

(assert (=> mapNonEmpty!58837 (= mapRes!58837 (and tp!111690 e!863708))))

(declare-fun mapRest!58837 () (Array (_ BitVec 32) ValueCell!18134))

(declare-fun mapKey!58837 () (_ BitVec 32))

(declare-fun mapValue!58837 () ValueCell!18134)

(assert (=> mapNonEmpty!58837 (= (arr!49947 _values!470) (store mapRest!58837 mapKey!58837 mapValue!58837))))

(declare-fun mapIsEmpty!58837 () Bool)

(assert (=> mapIsEmpty!58837 mapRes!58837))

(declare-fun b!1551392 () Bool)

(declare-fun e!863715 () Bool)

(assert (=> b!1551392 (= e!863715 (not true))))

(declare-fun lt!668497 () ListLongMap!22299)

(declare-fun lt!668494 () V!59229)

(declare-fun apply!1084 (ListLongMap!22299 (_ BitVec 64)) V!59229)

(assert (=> b!1551392 (= (apply!1084 lt!668497 (select (arr!49946 _keys!618) from!762)) lt!668494)))

(declare-datatypes ((Unit!51533 0))(
  ( (Unit!51534) )
))
(declare-fun lt!668495 () Unit!51533)

(declare-fun lt!668491 () ListLongMap!22299)

(declare-fun addApplyDifferent!613 (ListLongMap!22299 (_ BitVec 64) V!59229 (_ BitVec 64)) Unit!51533)

(assert (=> b!1551392 (= lt!668495 (addApplyDifferent!613 lt!668491 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49946 _keys!618) from!762)))))

(declare-fun lt!668489 () V!59229)

(assert (=> b!1551392 (= lt!668489 lt!668494)))

(assert (=> b!1551392 (= lt!668494 (apply!1084 lt!668491 (select (arr!49946 _keys!618) from!762)))))

(declare-fun +!5004 (ListLongMap!22299 tuple2!24682) ListLongMap!22299)

(assert (=> b!1551392 (= lt!668489 (apply!1084 (+!5004 lt!668491 (tuple2!24683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49946 _keys!618) from!762)))))

(declare-fun lt!668492 () Unit!51533)

(assert (=> b!1551392 (= lt!668492 (addApplyDifferent!613 lt!668491 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49946 _keys!618) from!762)))))

(declare-fun contains!10132 (ListLongMap!22299 (_ BitVec 64)) Bool)

(assert (=> b!1551392 (contains!10132 lt!668497 (select (arr!49946 _keys!618) from!762))))

(assert (=> b!1551392 (= lt!668497 (+!5004 lt!668491 (tuple2!24683 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!668493 () Unit!51533)

(declare-fun addStillContains!1274 (ListLongMap!22299 (_ BitVec 64) V!59229 (_ BitVec 64)) Unit!51533)

(assert (=> b!1551392 (= lt!668493 (addStillContains!1274 lt!668491 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49946 _keys!618) from!762)))))

(assert (=> b!1551392 (= lt!668491 (getCurrentListMapNoExtraKeys!6637 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1551393 () Bool)

(declare-fun e!863710 () Bool)

(assert (=> b!1551393 (= e!863710 e!863715)))

(declare-fun res!1062205 () Bool)

(assert (=> b!1551393 (=> (not res!1062205) (not e!863715))))

(assert (=> b!1551393 (= res!1062205 (bvslt from!762 (size!50497 _keys!618)))))

(declare-fun lt!668490 () ListLongMap!22299)

(assert (=> b!1551393 (= lt!668490 e!863711)))

(declare-fun c!143089 () Bool)

(assert (=> b!1551393 (= c!143089 (and (not lt!668496) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1551393 (= lt!668496 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1551394 () Bool)

(declare-fun res!1062203 () Bool)

(assert (=> b!1551394 (=> (not res!1062203) (not e!863710))))

(declare-datatypes ((List!36151 0))(
  ( (Nil!36148) (Cons!36147 (h!37610 (_ BitVec 64)) (t!50837 List!36151)) )
))
(declare-fun arrayNoDuplicates!0 (array!103502 (_ BitVec 32) List!36151) Bool)

(assert (=> b!1551394 (= res!1062203 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36148))))

(declare-fun b!1551395 () Bool)

(declare-fun call!70476 () ListLongMap!22299)

(assert (=> b!1551395 (= e!863711 (+!5004 call!70476 (tuple2!24683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1551396 () Bool)

(declare-fun res!1062206 () Bool)

(assert (=> b!1551396 (=> (not res!1062206) (not e!863710))))

(assert (=> b!1551396 (= res!1062206 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50497 _keys!618))))))

(declare-fun res!1062204 () Bool)

(assert (=> start!132512 (=> (not res!1062204) (not e!863710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132512 (= res!1062204 (validMask!0 mask!926))))

(assert (=> start!132512 e!863710))

(declare-fun array_inv!39099 (array!103502) Bool)

(assert (=> start!132512 (array_inv!39099 _keys!618)))

(assert (=> start!132512 tp_is_empty!38089))

(assert (=> start!132512 true))

(assert (=> start!132512 tp!111691))

(declare-fun e!863714 () Bool)

(declare-fun array_inv!39100 (array!103504) Bool)

(assert (=> start!132512 (and (array_inv!39100 _values!470) e!863714)))

(declare-fun b!1551397 () Bool)

(declare-fun res!1062208 () Bool)

(assert (=> b!1551397 (=> (not res!1062208) (not e!863715))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551397 (= res!1062208 (validKeyInArray!0 (select (arr!49946 _keys!618) from!762)))))

(declare-fun bm!70474 () Bool)

(declare-fun call!70477 () ListLongMap!22299)

(assert (=> bm!70474 (= call!70476 (+!5004 (ite c!143089 call!70479 (ite c!143087 call!70475 call!70477)) (ite (or c!143089 c!143087) (tuple2!24683 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1551398 () Bool)

(declare-fun call!70478 () ListLongMap!22299)

(assert (=> b!1551398 (= e!863713 call!70478)))

(declare-fun b!1551399 () Bool)

(declare-fun e!863712 () ListLongMap!22299)

(assert (=> b!1551399 (= e!863712 call!70478)))

(declare-fun bm!70475 () Bool)

(assert (=> bm!70475 (= call!70478 call!70476)))

(declare-fun b!1551400 () Bool)

(assert (=> b!1551400 (= e!863712 call!70477)))

(declare-fun bm!70476 () Bool)

(assert (=> bm!70476 (= call!70477 call!70475)))

(declare-fun b!1551401 () Bool)

(assert (=> b!1551401 (= e!863714 (and e!863707 mapRes!58837))))

(declare-fun condMapEmpty!58837 () Bool)

(declare-fun mapDefault!58837 () ValueCell!18134)

(assert (=> b!1551401 (= condMapEmpty!58837 (= (arr!49947 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18134)) mapDefault!58837)))))

(declare-fun b!1551402 () Bool)

(declare-fun res!1062209 () Bool)

(assert (=> b!1551402 (=> (not res!1062209) (not e!863710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103502 (_ BitVec 32)) Bool)

(assert (=> b!1551402 (= res!1062209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1551403 () Bool)

(declare-fun res!1062207 () Bool)

(assert (=> b!1551403 (=> (not res!1062207) (not e!863710))))

(assert (=> b!1551403 (= res!1062207 (and (= (size!50498 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50497 _keys!618) (size!50498 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1551404 () Bool)

(declare-fun c!143088 () Bool)

(assert (=> b!1551404 (= c!143088 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668496))))

(assert (=> b!1551404 (= e!863713 e!863712)))

(assert (= (and start!132512 res!1062204) b!1551403))

(assert (= (and b!1551403 res!1062207) b!1551402))

(assert (= (and b!1551402 res!1062209) b!1551394))

(assert (= (and b!1551394 res!1062203) b!1551396))

(assert (= (and b!1551396 res!1062206) b!1551393))

(assert (= (and b!1551393 c!143089) b!1551395))

(assert (= (and b!1551393 (not c!143089)) b!1551391))

(assert (= (and b!1551391 c!143087) b!1551398))

(assert (= (and b!1551391 (not c!143087)) b!1551404))

(assert (= (and b!1551404 c!143088) b!1551399))

(assert (= (and b!1551404 (not c!143088)) b!1551400))

(assert (= (or b!1551399 b!1551400) bm!70476))

(assert (= (or b!1551398 bm!70476) bm!70473))

(assert (= (or b!1551398 b!1551399) bm!70475))

(assert (= (or b!1551395 bm!70473) bm!70472))

(assert (= (or b!1551395 bm!70475) bm!70474))

(assert (= (and b!1551393 res!1062205) b!1551397))

(assert (= (and b!1551397 res!1062208) b!1551392))

(assert (= (and b!1551401 condMapEmpty!58837) mapIsEmpty!58837))

(assert (= (and b!1551401 (not condMapEmpty!58837)) mapNonEmpty!58837))

(get-info :version)

(assert (= (and mapNonEmpty!58837 ((_ is ValueCellFull!18134) mapValue!58837)) b!1551390))

(assert (= (and b!1551401 ((_ is ValueCellFull!18134) mapDefault!58837)) b!1551389))

(assert (= start!132512 b!1551401))

(declare-fun m!1430529 () Bool)

(assert (=> mapNonEmpty!58837 m!1430529))

(declare-fun m!1430531 () Bool)

(assert (=> b!1551395 m!1430531))

(declare-fun m!1430533 () Bool)

(assert (=> b!1551394 m!1430533))

(declare-fun m!1430535 () Bool)

(assert (=> start!132512 m!1430535))

(declare-fun m!1430537 () Bool)

(assert (=> start!132512 m!1430537))

(declare-fun m!1430539 () Bool)

(assert (=> start!132512 m!1430539))

(declare-fun m!1430541 () Bool)

(assert (=> bm!70474 m!1430541))

(declare-fun m!1430543 () Bool)

(assert (=> b!1551392 m!1430543))

(declare-fun m!1430545 () Bool)

(assert (=> b!1551392 m!1430545))

(assert (=> b!1551392 m!1430543))

(declare-fun m!1430547 () Bool)

(assert (=> b!1551392 m!1430547))

(declare-fun m!1430549 () Bool)

(assert (=> b!1551392 m!1430549))

(assert (=> b!1551392 m!1430543))

(declare-fun m!1430551 () Bool)

(assert (=> b!1551392 m!1430551))

(assert (=> b!1551392 m!1430543))

(declare-fun m!1430553 () Bool)

(assert (=> b!1551392 m!1430553))

(assert (=> b!1551392 m!1430543))

(declare-fun m!1430555 () Bool)

(assert (=> b!1551392 m!1430555))

(assert (=> b!1551392 m!1430551))

(assert (=> b!1551392 m!1430543))

(declare-fun m!1430557 () Bool)

(assert (=> b!1551392 m!1430557))

(assert (=> b!1551392 m!1430543))

(declare-fun m!1430559 () Bool)

(assert (=> b!1551392 m!1430559))

(declare-fun m!1430561 () Bool)

(assert (=> b!1551392 m!1430561))

(assert (=> b!1551392 m!1430543))

(declare-fun m!1430563 () Bool)

(assert (=> b!1551392 m!1430563))

(assert (=> b!1551397 m!1430543))

(assert (=> b!1551397 m!1430543))

(declare-fun m!1430565 () Bool)

(assert (=> b!1551397 m!1430565))

(declare-fun m!1430567 () Bool)

(assert (=> b!1551402 m!1430567))

(assert (=> bm!70472 m!1430549))

(check-sat (not bm!70474) tp_is_empty!38089 b_and!51225 (not b!1551402) (not b!1551397) (not b!1551395) (not mapNonEmpty!58837) (not b_next!31813) (not b!1551392) (not bm!70472) (not b!1551394) (not start!132512))
(check-sat b_and!51225 (not b_next!31813))
