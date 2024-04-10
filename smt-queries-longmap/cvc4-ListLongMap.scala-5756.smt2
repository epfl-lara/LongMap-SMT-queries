; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74368 () Bool)

(assert start!74368)

(declare-fun b_free!15131 () Bool)

(declare-fun b_next!15131 () Bool)

(assert (=> start!74368 (= b_free!15131 (not b_next!15131))))

(declare-fun tp!53068 () Bool)

(declare-fun b_and!24907 () Bool)

(assert (=> start!74368 (= tp!53068 b_and!24907)))

(declare-fun b!875467 () Bool)

(declare-fun res!594962 () Bool)

(declare-fun e!487373 () Bool)

(assert (=> b!875467 (=> (not res!594962) (not e!487373))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50876 0))(
  ( (array!50877 (arr!24466 (Array (_ BitVec 32) (_ BitVec 64))) (size!24906 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50876)

(declare-datatypes ((V!28213 0))(
  ( (V!28214 (val!8735 Int)) )
))
(declare-datatypes ((ValueCell!8248 0))(
  ( (ValueCellFull!8248 (v!11164 V!28213)) (EmptyCell!8248) )
))
(declare-datatypes ((array!50878 0))(
  ( (array!50879 (arr!24467 (Array (_ BitVec 32) ValueCell!8248)) (size!24907 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50878)

(assert (=> b!875467 (= res!594962 (and (= (size!24907 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24906 _keys!868) (size!24907 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!38615 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11540 0))(
  ( (tuple2!11541 (_1!5781 (_ BitVec 64)) (_2!5781 V!28213)) )
))
(declare-datatypes ((List!17363 0))(
  ( (Nil!17360) (Cons!17359 (h!18490 tuple2!11540) (t!24404 List!17363)) )
))
(declare-datatypes ((ListLongMap!10309 0))(
  ( (ListLongMap!10310 (toList!5170 List!17363)) )
))
(declare-fun call!38618 () ListLongMap!10309)

(declare-fun minValue!654 () V!28213)

(declare-fun zeroValue!654 () V!28213)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lt!396185 () array!50878)

(declare-fun getCurrentListMapNoExtraKeys!3137 (array!50876 array!50878 (_ BitVec 32) (_ BitVec 32) V!28213 V!28213 (_ BitVec 32) Int) ListLongMap!10309)

(assert (=> bm!38615 (= call!38618 (getCurrentListMapNoExtraKeys!3137 _keys!868 lt!396185 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875468 () Bool)

(declare-fun res!594966 () Bool)

(assert (=> b!875468 (=> (not res!594966) (not e!487373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875468 (= res!594966 (validMask!0 mask!1196))))

(declare-fun b!875469 () Bool)

(declare-fun e!487375 () Bool)

(declare-fun tp_is_empty!17375 () Bool)

(assert (=> b!875469 (= e!487375 tp_is_empty!17375)))

(declare-fun bm!38616 () Bool)

(declare-fun call!38619 () ListLongMap!10309)

(assert (=> bm!38616 (= call!38619 (getCurrentListMapNoExtraKeys!3137 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875470 () Bool)

(declare-fun res!594960 () Bool)

(assert (=> b!875470 (=> (not res!594960) (not e!487373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50876 (_ BitVec 32)) Bool)

(assert (=> b!875470 (= res!594960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!875471 () Bool)

(declare-fun res!594964 () Bool)

(assert (=> b!875471 (=> (not res!594964) (not e!487373))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!875471 (= res!594964 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24906 _keys!868))))))

(declare-fun b!875472 () Bool)

(declare-fun e!487377 () Bool)

(assert (=> b!875472 (= e!487377 (bvslt from!1053 (size!24906 _keys!868)))))

(declare-fun lt!396187 () ListLongMap!10309)

(assert (=> b!875472 (= lt!396187 (getCurrentListMapNoExtraKeys!3137 _keys!868 lt!396185 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875473 () Bool)

(declare-fun res!594968 () Bool)

(assert (=> b!875473 (=> (not res!594968) (not e!487373))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875473 (= res!594968 (validKeyInArray!0 k!854))))

(declare-fun res!594967 () Bool)

(assert (=> start!74368 (=> (not res!594967) (not e!487373))))

(assert (=> start!74368 (= res!594967 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24906 _keys!868))))))

(assert (=> start!74368 e!487373))

(assert (=> start!74368 tp_is_empty!17375))

(assert (=> start!74368 true))

(assert (=> start!74368 tp!53068))

(declare-fun array_inv!19288 (array!50876) Bool)

(assert (=> start!74368 (array_inv!19288 _keys!868)))

(declare-fun e!487374 () Bool)

(declare-fun array_inv!19289 (array!50878) Bool)

(assert (=> start!74368 (and (array_inv!19289 _values!688) e!487374)))

(declare-fun mapIsEmpty!27671 () Bool)

(declare-fun mapRes!27671 () Bool)

(assert (=> mapIsEmpty!27671 mapRes!27671))

(declare-fun b!875474 () Bool)

(declare-fun e!487378 () Bool)

(assert (=> b!875474 (= e!487374 (and e!487378 mapRes!27671))))

(declare-fun condMapEmpty!27671 () Bool)

(declare-fun mapDefault!27671 () ValueCell!8248)

