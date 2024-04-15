; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131996 () Bool)

(assert start!131996)

(declare-fun b_free!31759 () Bool)

(declare-fun b_next!31759 () Bool)

(assert (=> start!131996 (= b_free!31759 (not b_next!31759))))

(declare-fun tp!111529 () Bool)

(declare-fun b_and!51151 () Bool)

(assert (=> start!131996 (= tp!111529 b_and!51151)))

(declare-fun b!1547344 () Bool)

(declare-fun e!861277 () Bool)

(assert (=> b!1547344 (= e!861277 (not true))))

(declare-datatypes ((array!103200 0))(
  ( (array!103201 (arr!49803 (Array (_ BitVec 32) (_ BitVec 64))) (size!50355 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103200)

(declare-datatypes ((V!59157 0))(
  ( (V!59158 (val!19095 Int)) )
))
(declare-datatypes ((tuple2!24646 0))(
  ( (tuple2!24647 (_1!12334 (_ BitVec 64)) (_2!12334 V!59157)) )
))
(declare-datatypes ((List!36114 0))(
  ( (Nil!36111) (Cons!36110 (h!37556 tuple2!24646) (t!50800 List!36114)) )
))
(declare-datatypes ((ListLongMap!22255 0))(
  ( (ListLongMap!22256 (toList!11143 List!36114)) )
))
(declare-fun lt!666659 () ListLongMap!22255)

(declare-fun minValue!436 () V!59157)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun apply!1052 (ListLongMap!22255 (_ BitVec 64)) V!59157)

(declare-fun +!4969 (ListLongMap!22255 tuple2!24646) ListLongMap!22255)

(assert (=> b!1547344 (= (apply!1052 (+!4969 lt!666659 (tuple2!24647 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49803 _keys!618) from!762)) (apply!1052 lt!666659 (select (arr!49803 _keys!618) from!762)))))

(declare-datatypes ((Unit!51401 0))(
  ( (Unit!51402) )
))
(declare-fun lt!666661 () Unit!51401)

(declare-fun addApplyDifferent!590 (ListLongMap!22255 (_ BitVec 64) V!59157 (_ BitVec 64)) Unit!51401)

(assert (=> b!1547344 (= lt!666661 (addApplyDifferent!590 lt!666659 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49803 _keys!618) from!762)))))

(declare-fun zeroValue!436 () V!59157)

(declare-fun contains!10027 (ListLongMap!22255 (_ BitVec 64)) Bool)

(assert (=> b!1547344 (contains!10027 (+!4969 lt!666659 (tuple2!24647 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49803 _keys!618) from!762))))

(declare-fun lt!666660 () Unit!51401)

(declare-fun addStillContains!1250 (ListLongMap!22255 (_ BitVec 64) V!59157 (_ BitVec 64)) Unit!51401)

(assert (=> b!1547344 (= lt!666660 (addStillContains!1250 lt!666659 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49803 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18107 0))(
  ( (ValueCellFull!18107 (v!21892 V!59157)) (EmptyCell!18107) )
))
(declare-datatypes ((array!103202 0))(
  ( (array!103203 (arr!49804 (Array (_ BitVec 32) ValueCell!18107)) (size!50356 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103202)

(declare-fun getCurrentListMapNoExtraKeys!6597 (array!103200 array!103202 (_ BitVec 32) (_ BitVec 32) V!59157 V!59157 (_ BitVec 32) Int) ListLongMap!22255)

(assert (=> b!1547344 (= lt!666659 (getCurrentListMapNoExtraKeys!6597 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun res!1060647 () Bool)

(declare-fun e!861278 () Bool)

(assert (=> start!131996 (=> (not res!1060647) (not e!861278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131996 (= res!1060647 (validMask!0 mask!926))))

(assert (=> start!131996 e!861278))

(declare-fun array_inv!38935 (array!103200) Bool)

(assert (=> start!131996 (array_inv!38935 _keys!618)))

(declare-fun tp_is_empty!38035 () Bool)

(assert (=> start!131996 tp_is_empty!38035))

(assert (=> start!131996 true))

(assert (=> start!131996 tp!111529))

(declare-fun e!861272 () Bool)

(declare-fun array_inv!38936 (array!103202) Bool)

(assert (=> start!131996 (and (array_inv!38936 _values!470) e!861272)))

(declare-fun b!1547345 () Bool)

(assert (=> b!1547345 (= e!861278 e!861277)))

(declare-fun res!1060648 () Bool)

(assert (=> b!1547345 (=> (not res!1060648) (not e!861277))))

(assert (=> b!1547345 (= res!1060648 (bvslt from!762 (size!50355 _keys!618)))))

(declare-fun lt!666658 () ListLongMap!22255)

(declare-fun e!861275 () ListLongMap!22255)

(assert (=> b!1547345 (= lt!666658 e!861275)))

(declare-fun c!141956 () Bool)

(declare-fun lt!666657 () Bool)

(assert (=> b!1547345 (= c!141956 (and (not lt!666657) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547345 (= lt!666657 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!69882 () Bool)

(declare-fun c!141955 () Bool)

(declare-fun call!69886 () ListLongMap!22255)

(declare-fun call!69885 () ListLongMap!22255)

(declare-fun call!69888 () ListLongMap!22255)

(declare-fun call!69889 () ListLongMap!22255)

(assert (=> bm!69882 (= call!69885 (+!4969 (ite c!141956 call!69886 (ite c!141955 call!69889 call!69888)) (ite (or c!141956 c!141955) (tuple2!24647 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24647 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1547346 () Bool)

(assert (=> b!1547346 (= e!861275 (+!4969 call!69885 (tuple2!24647 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1547347 () Bool)

(declare-fun res!1060652 () Bool)

(assert (=> b!1547347 (=> (not res!1060652) (not e!861277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547347 (= res!1060652 (validKeyInArray!0 (select (arr!49803 _keys!618) from!762)))))

(declare-fun b!1547348 () Bool)

(declare-fun res!1060650 () Bool)

(assert (=> b!1547348 (=> (not res!1060650) (not e!861278))))

(assert (=> b!1547348 (= res!1060650 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50355 _keys!618))))))

(declare-fun mapNonEmpty!58756 () Bool)

(declare-fun mapRes!58756 () Bool)

(declare-fun tp!111530 () Bool)

(declare-fun e!861279 () Bool)

(assert (=> mapNonEmpty!58756 (= mapRes!58756 (and tp!111530 e!861279))))

(declare-fun mapRest!58756 () (Array (_ BitVec 32) ValueCell!18107))

(declare-fun mapKey!58756 () (_ BitVec 32))

(declare-fun mapValue!58756 () ValueCell!18107)

(assert (=> mapNonEmpty!58756 (= (arr!49804 _values!470) (store mapRest!58756 mapKey!58756 mapValue!58756))))

(declare-fun b!1547349 () Bool)

(declare-fun e!861276 () ListLongMap!22255)

(declare-fun call!69887 () ListLongMap!22255)

(assert (=> b!1547349 (= e!861276 call!69887)))

(declare-fun bm!69883 () Bool)

(assert (=> bm!69883 (= call!69888 call!69889)))

(declare-fun b!1547350 () Bool)

(assert (=> b!1547350 (= e!861279 tp_is_empty!38035)))

(declare-fun bm!69884 () Bool)

(assert (=> bm!69884 (= call!69886 (getCurrentListMapNoExtraKeys!6597 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547351 () Bool)

(declare-fun c!141957 () Bool)

(assert (=> b!1547351 (= c!141957 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666657))))

(declare-fun e!861274 () ListLongMap!22255)

(assert (=> b!1547351 (= e!861276 e!861274)))

(declare-fun b!1547352 () Bool)

(assert (=> b!1547352 (= e!861275 e!861276)))

(assert (=> b!1547352 (= c!141955 (and (not lt!666657) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1547353 () Bool)

(declare-fun res!1060649 () Bool)

(assert (=> b!1547353 (=> (not res!1060649) (not e!861278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103200 (_ BitVec 32)) Bool)

(assert (=> b!1547353 (= res!1060649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!69885 () Bool)

(assert (=> bm!69885 (= call!69887 call!69885)))

(declare-fun b!1547354 () Bool)

(declare-fun e!861271 () Bool)

(assert (=> b!1547354 (= e!861271 tp_is_empty!38035)))

(declare-fun b!1547355 () Bool)

(assert (=> b!1547355 (= e!861274 call!69888)))

(declare-fun bm!69886 () Bool)

(assert (=> bm!69886 (= call!69889 call!69886)))

(declare-fun b!1547356 () Bool)

(assert (=> b!1547356 (= e!861272 (and e!861271 mapRes!58756))))

(declare-fun condMapEmpty!58756 () Bool)

(declare-fun mapDefault!58756 () ValueCell!18107)

(assert (=> b!1547356 (= condMapEmpty!58756 (= (arr!49804 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18107)) mapDefault!58756)))))

(declare-fun b!1547357 () Bool)

(assert (=> b!1547357 (= e!861274 call!69887)))

(declare-fun mapIsEmpty!58756 () Bool)

(assert (=> mapIsEmpty!58756 mapRes!58756))

(declare-fun b!1547358 () Bool)

(declare-fun res!1060653 () Bool)

(assert (=> b!1547358 (=> (not res!1060653) (not e!861278))))

(assert (=> b!1547358 (= res!1060653 (and (= (size!50356 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50355 _keys!618) (size!50356 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1547359 () Bool)

(declare-fun res!1060651 () Bool)

(assert (=> b!1547359 (=> (not res!1060651) (not e!861278))))

(declare-datatypes ((List!36115 0))(
  ( (Nil!36112) (Cons!36111 (h!37557 (_ BitVec 64)) (t!50801 List!36115)) )
))
(declare-fun arrayNoDuplicates!0 (array!103200 (_ BitVec 32) List!36115) Bool)

(assert (=> b!1547359 (= res!1060651 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36112))))

(assert (= (and start!131996 res!1060647) b!1547358))

(assert (= (and b!1547358 res!1060653) b!1547353))

(assert (= (and b!1547353 res!1060649) b!1547359))

(assert (= (and b!1547359 res!1060651) b!1547348))

(assert (= (and b!1547348 res!1060650) b!1547345))

(assert (= (and b!1547345 c!141956) b!1547346))

(assert (= (and b!1547345 (not c!141956)) b!1547352))

(assert (= (and b!1547352 c!141955) b!1547349))

(assert (= (and b!1547352 (not c!141955)) b!1547351))

(assert (= (and b!1547351 c!141957) b!1547357))

(assert (= (and b!1547351 (not c!141957)) b!1547355))

(assert (= (or b!1547357 b!1547355) bm!69883))

(assert (= (or b!1547349 bm!69883) bm!69886))

(assert (= (or b!1547349 b!1547357) bm!69885))

(assert (= (or b!1547346 bm!69886) bm!69884))

(assert (= (or b!1547346 bm!69885) bm!69882))

(assert (= (and b!1547345 res!1060648) b!1547347))

(assert (= (and b!1547347 res!1060652) b!1547344))

(assert (= (and b!1547356 condMapEmpty!58756) mapIsEmpty!58756))

(assert (= (and b!1547356 (not condMapEmpty!58756)) mapNonEmpty!58756))

(get-info :version)

(assert (= (and mapNonEmpty!58756 ((_ is ValueCellFull!18107) mapValue!58756)) b!1547350))

(assert (= (and b!1547356 ((_ is ValueCellFull!18107) mapDefault!58756)) b!1547354))

(assert (= start!131996 b!1547356))

(declare-fun m!1426329 () Bool)

(assert (=> b!1547359 m!1426329))

(declare-fun m!1426331 () Bool)

(assert (=> bm!69884 m!1426331))

(declare-fun m!1426333 () Bool)

(assert (=> bm!69882 m!1426333))

(declare-fun m!1426335 () Bool)

(assert (=> b!1547344 m!1426335))

(declare-fun m!1426337 () Bool)

(assert (=> b!1547344 m!1426337))

(assert (=> b!1547344 m!1426331))

(assert (=> b!1547344 m!1426335))

(declare-fun m!1426339 () Bool)

(assert (=> b!1547344 m!1426339))

(declare-fun m!1426341 () Bool)

(assert (=> b!1547344 m!1426341))

(assert (=> b!1547344 m!1426339))

(assert (=> b!1547344 m!1426335))

(declare-fun m!1426343 () Bool)

(assert (=> b!1547344 m!1426343))

(assert (=> b!1547344 m!1426341))

(assert (=> b!1547344 m!1426335))

(declare-fun m!1426345 () Bool)

(assert (=> b!1547344 m!1426345))

(assert (=> b!1547344 m!1426335))

(declare-fun m!1426347 () Bool)

(assert (=> b!1547344 m!1426347))

(assert (=> b!1547344 m!1426335))

(declare-fun m!1426349 () Bool)

(assert (=> b!1547344 m!1426349))

(declare-fun m!1426351 () Bool)

(assert (=> b!1547353 m!1426351))

(declare-fun m!1426353 () Bool)

(assert (=> mapNonEmpty!58756 m!1426353))

(assert (=> b!1547347 m!1426335))

(assert (=> b!1547347 m!1426335))

(declare-fun m!1426355 () Bool)

(assert (=> b!1547347 m!1426355))

(declare-fun m!1426357 () Bool)

(assert (=> b!1547346 m!1426357))

(declare-fun m!1426359 () Bool)

(assert (=> start!131996 m!1426359))

(declare-fun m!1426361 () Bool)

(assert (=> start!131996 m!1426361))

(declare-fun m!1426363 () Bool)

(assert (=> start!131996 m!1426363))

(check-sat (not mapNonEmpty!58756) (not b!1547346) (not bm!69884) (not b!1547353) (not b!1547347) b_and!51151 (not start!131996) (not bm!69882) (not b!1547359) tp_is_empty!38035 (not b!1547344) (not b_next!31759))
(check-sat b_and!51151 (not b_next!31759))
