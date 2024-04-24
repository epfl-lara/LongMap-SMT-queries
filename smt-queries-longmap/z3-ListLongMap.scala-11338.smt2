; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132344 () Bool)

(assert start!132344)

(declare-fun b_free!31645 () Bool)

(declare-fun b_next!31645 () Bool)

(assert (=> start!132344 (= b_free!31645 (not b_next!31645))))

(declare-fun tp!111186 () Bool)

(declare-fun b_and!51057 () Bool)

(assert (=> start!132344 (= tp!111186 b_and!51057)))

(declare-datatypes ((V!59005 0))(
  ( (V!59006 (val!19038 Int)) )
))
(declare-fun zeroValue!436 () V!59005)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18050 0))(
  ( (ValueCellFull!18050 (v!21831 V!59005)) (EmptyCell!18050) )
))
(declare-datatypes ((array!103170 0))(
  ( (array!103171 (arr!49780 (Array (_ BitVec 32) ValueCell!18050)) (size!50331 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103170)

(declare-fun minValue!436 () V!59005)

(declare-fun bm!69212 () Bool)

(declare-datatypes ((array!103172 0))(
  ( (array!103173 (arr!49781 (Array (_ BitVec 32) (_ BitVec 64))) (size!50332 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103172)

(declare-datatypes ((tuple2!24518 0))(
  ( (tuple2!24519 (_1!12270 (_ BitVec 64)) (_2!12270 V!59005)) )
))
(declare-datatypes ((List!36012 0))(
  ( (Nil!36009) (Cons!36008 (h!37471 tuple2!24518) (t!50698 List!36012)) )
))
(declare-datatypes ((ListLongMap!22135 0))(
  ( (ListLongMap!22136 (toList!11083 List!36012)) )
))
(declare-fun call!69215 () ListLongMap!22135)

(declare-fun getCurrentListMapNoExtraKeys!6568 (array!103172 array!103170 (_ BitVec 32) (_ BitVec 32) V!59005 V!59005 (_ BitVec 32) Int) ListLongMap!22135)

(assert (=> bm!69212 (= call!69215 (getCurrentListMapNoExtraKeys!6568 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547371 () Bool)

(declare-fun e!861450 () ListLongMap!22135)

(declare-fun call!69216 () ListLongMap!22135)

(assert (=> b!1547371 (= e!861450 call!69216)))

(declare-fun b!1547372 () Bool)

(declare-fun res!1060456 () Bool)

(declare-fun e!861447 () Bool)

(assert (=> b!1547372 (=> (not res!1060456) (not e!861447))))

(assert (=> b!1547372 (= res!1060456 (and (= (size!50331 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50332 _keys!618) (size!50331 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1547373 () Bool)

(declare-fun e!861446 () ListLongMap!22135)

(declare-fun e!861448 () ListLongMap!22135)

(assert (=> b!1547373 (= e!861446 e!861448)))

(declare-fun c!142333 () Bool)

(declare-fun lt!667117 () Bool)

(assert (=> b!1547373 (= c!142333 (and (not lt!667117) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1547374 () Bool)

(declare-fun res!1060457 () Bool)

(assert (=> b!1547374 (=> (not res!1060457) (not e!861447))))

(assert (=> b!1547374 (= res!1060457 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50332 _keys!618))))))

(declare-fun bm!69213 () Bool)

(declare-fun call!69219 () ListLongMap!22135)

(assert (=> bm!69213 (= call!69216 call!69219)))

(declare-fun res!1060454 () Bool)

(assert (=> start!132344 (=> (not res!1060454) (not e!861447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132344 (= res!1060454 (validMask!0 mask!926))))

(assert (=> start!132344 e!861447))

(declare-fun array_inv!38985 (array!103172) Bool)

(assert (=> start!132344 (array_inv!38985 _keys!618)))

(declare-fun tp_is_empty!37921 () Bool)

(assert (=> start!132344 tp_is_empty!37921))

(assert (=> start!132344 true))

(assert (=> start!132344 tp!111186))

(declare-fun e!861452 () Bool)

(declare-fun array_inv!38986 (array!103170) Bool)

(assert (=> start!132344 (and (array_inv!38986 _values!470) e!861452)))

(declare-fun b!1547375 () Bool)

(declare-fun e!861451 () Bool)

(assert (=> b!1547375 (= e!861451 tp_is_empty!37921)))

(declare-fun b!1547376 () Bool)

(declare-fun c!142332 () Bool)

(assert (=> b!1547376 (= c!142332 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667117))))

(assert (=> b!1547376 (= e!861448 e!861450)))

(declare-fun mapIsEmpty!58585 () Bool)

(declare-fun mapRes!58585 () Bool)

(assert (=> mapIsEmpty!58585 mapRes!58585))

(declare-fun b!1547377 () Bool)

(declare-fun call!69217 () ListLongMap!22135)

(declare-fun +!4930 (ListLongMap!22135 tuple2!24518) ListLongMap!22135)

(assert (=> b!1547377 (= e!861446 (+!4930 call!69217 (tuple2!24519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1547378 () Bool)

(declare-fun e!861449 () Bool)

(assert (=> b!1547378 (= e!861449 tp_is_empty!37921)))

(declare-fun b!1547379 () Bool)

(declare-fun res!1060453 () Bool)

(assert (=> b!1547379 (=> (not res!1060453) (not e!861447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103172 (_ BitVec 32)) Bool)

(assert (=> b!1547379 (= res!1060453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun c!142331 () Bool)

(declare-fun bm!69214 () Bool)

(assert (=> bm!69214 (= call!69217 (+!4930 (ite c!142331 call!69215 (ite c!142333 call!69219 call!69216)) (ite (or c!142331 c!142333) (tuple2!24519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun mapNonEmpty!58585 () Bool)

(declare-fun tp!111187 () Bool)

(assert (=> mapNonEmpty!58585 (= mapRes!58585 (and tp!111187 e!861449))))

(declare-fun mapKey!58585 () (_ BitVec 32))

(declare-fun mapValue!58585 () ValueCell!18050)

(declare-fun mapRest!58585 () (Array (_ BitVec 32) ValueCell!18050))

(assert (=> mapNonEmpty!58585 (= (arr!49780 _values!470) (store mapRest!58585 mapKey!58585 mapValue!58585))))

(declare-fun b!1547380 () Bool)

(declare-fun call!69218 () ListLongMap!22135)

(assert (=> b!1547380 (= e!861448 call!69218)))

(declare-fun bm!69215 () Bool)

(assert (=> bm!69215 (= call!69218 call!69217)))

(declare-fun b!1547381 () Bool)

(assert (=> b!1547381 (= e!861452 (and e!861451 mapRes!58585))))

(declare-fun condMapEmpty!58585 () Bool)

(declare-fun mapDefault!58585 () ValueCell!18050)

(assert (=> b!1547381 (= condMapEmpty!58585 (= (arr!49780 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18050)) mapDefault!58585)))))

(declare-fun bm!69216 () Bool)

(assert (=> bm!69216 (= call!69219 call!69215)))

(declare-fun b!1547382 () Bool)

(assert (=> b!1547382 (= e!861447 false)))

(declare-fun lt!667116 () ListLongMap!22135)

(assert (=> b!1547382 (= lt!667116 e!861446)))

(assert (=> b!1547382 (= c!142331 (and (not lt!667117) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547382 (= lt!667117 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547383 () Bool)

(declare-fun res!1060455 () Bool)

(assert (=> b!1547383 (=> (not res!1060455) (not e!861447))))

(declare-datatypes ((List!36013 0))(
  ( (Nil!36010) (Cons!36009 (h!37472 (_ BitVec 64)) (t!50699 List!36013)) )
))
(declare-fun arrayNoDuplicates!0 (array!103172 (_ BitVec 32) List!36013) Bool)

(assert (=> b!1547383 (= res!1060455 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36010))))

(declare-fun b!1547384 () Bool)

(assert (=> b!1547384 (= e!861450 call!69218)))

(assert (= (and start!132344 res!1060454) b!1547372))

(assert (= (and b!1547372 res!1060456) b!1547379))

(assert (= (and b!1547379 res!1060453) b!1547383))

(assert (= (and b!1547383 res!1060455) b!1547374))

(assert (= (and b!1547374 res!1060457) b!1547382))

(assert (= (and b!1547382 c!142331) b!1547377))

(assert (= (and b!1547382 (not c!142331)) b!1547373))

(assert (= (and b!1547373 c!142333) b!1547380))

(assert (= (and b!1547373 (not c!142333)) b!1547376))

(assert (= (and b!1547376 c!142332) b!1547384))

(assert (= (and b!1547376 (not c!142332)) b!1547371))

(assert (= (or b!1547384 b!1547371) bm!69213))

(assert (= (or b!1547380 bm!69213) bm!69216))

(assert (= (or b!1547380 b!1547384) bm!69215))

(assert (= (or b!1547377 bm!69216) bm!69212))

(assert (= (or b!1547377 bm!69215) bm!69214))

(assert (= (and b!1547381 condMapEmpty!58585) mapIsEmpty!58585))

(assert (= (and b!1547381 (not condMapEmpty!58585)) mapNonEmpty!58585))

(get-info :version)

(assert (= (and mapNonEmpty!58585 ((_ is ValueCellFull!18050) mapValue!58585)) b!1547378))

(assert (= (and b!1547381 ((_ is ValueCellFull!18050) mapDefault!58585)) b!1547375))

(assert (= start!132344 b!1547381))

(declare-fun m!1427751 () Bool)

(assert (=> mapNonEmpty!58585 m!1427751))

(declare-fun m!1427753 () Bool)

(assert (=> bm!69214 m!1427753))

(declare-fun m!1427755 () Bool)

(assert (=> bm!69212 m!1427755))

(declare-fun m!1427757 () Bool)

(assert (=> start!132344 m!1427757))

(declare-fun m!1427759 () Bool)

(assert (=> start!132344 m!1427759))

(declare-fun m!1427761 () Bool)

(assert (=> start!132344 m!1427761))

(declare-fun m!1427763 () Bool)

(assert (=> b!1547383 m!1427763))

(declare-fun m!1427765 () Bool)

(assert (=> b!1547379 m!1427765))

(declare-fun m!1427767 () Bool)

(assert (=> b!1547377 m!1427767))

(check-sat b_and!51057 (not mapNonEmpty!58585) (not b!1547379) (not bm!69212) (not start!132344) (not bm!69214) (not b!1547383) (not b!1547377) tp_is_empty!37921 (not b_next!31645))
(check-sat b_and!51057 (not b_next!31645))
