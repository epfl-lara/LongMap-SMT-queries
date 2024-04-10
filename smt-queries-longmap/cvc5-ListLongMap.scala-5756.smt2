; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74364 () Bool)

(assert start!74364)

(declare-fun b_free!15127 () Bool)

(declare-fun b_next!15127 () Bool)

(assert (=> start!74364 (= b_free!15127 (not b_next!15127))))

(declare-fun tp!53055 () Bool)

(declare-fun b_and!24903 () Bool)

(assert (=> start!74364 (= tp!53055 b_and!24903)))

(declare-fun b!875377 () Bool)

(declare-fun res!594901 () Bool)

(declare-fun e!487327 () Bool)

(assert (=> b!875377 (=> (not res!594901) (not e!487327))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50868 0))(
  ( (array!50869 (arr!24462 (Array (_ BitVec 32) (_ BitVec 64))) (size!24902 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50868)

(declare-datatypes ((V!28209 0))(
  ( (V!28210 (val!8733 Int)) )
))
(declare-datatypes ((ValueCell!8246 0))(
  ( (ValueCellFull!8246 (v!11162 V!28209)) (EmptyCell!8246) )
))
(declare-datatypes ((array!50870 0))(
  ( (array!50871 (arr!24463 (Array (_ BitVec 32) ValueCell!8246)) (size!24903 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50870)

(assert (=> b!875377 (= res!594901 (and (= (size!24903 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24902 _keys!868) (size!24903 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun e!487328 () Bool)

(declare-fun b!875378 () Bool)

(declare-fun v!557 () V!28209)

(declare-datatypes ((tuple2!11536 0))(
  ( (tuple2!11537 (_1!5779 (_ BitVec 64)) (_2!5779 V!28209)) )
))
(declare-datatypes ((List!17359 0))(
  ( (Nil!17356) (Cons!17355 (h!18486 tuple2!11536) (t!24400 List!17359)) )
))
(declare-datatypes ((ListLongMap!10305 0))(
  ( (ListLongMap!10306 (toList!5168 List!17359)) )
))
(declare-fun call!38607 () ListLongMap!10305)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun call!38606 () ListLongMap!10305)

(declare-fun +!2472 (ListLongMap!10305 tuple2!11536) ListLongMap!10305)

(assert (=> b!875378 (= e!487328 (= call!38606 (+!2472 call!38607 (tuple2!11537 k!854 v!557))))))

(declare-fun b!875379 () Bool)

(declare-fun res!594903 () Bool)

(assert (=> b!875379 (=> (not res!594903) (not e!487327))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!875379 (= res!594903 (and (= (select (arr!24462 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!875380 () Bool)

(declare-fun res!594902 () Bool)

(assert (=> b!875380 (=> (not res!594902) (not e!487327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875380 (= res!594902 (validKeyInArray!0 k!854))))

(declare-fun b!875381 () Bool)

(declare-fun e!487326 () Bool)

(declare-fun e!487329 () Bool)

(assert (=> b!875381 (= e!487326 (not e!487329))))

(declare-fun res!594907 () Bool)

(assert (=> b!875381 (=> res!594907 e!487329)))

(assert (=> b!875381 (= res!594907 (not (validKeyInArray!0 (select (arr!24462 _keys!868) from!1053))))))

(assert (=> b!875381 e!487328))

(declare-fun c!92504 () Bool)

(assert (=> b!875381 (= c!92504 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28209)

(declare-fun zeroValue!654 () V!28209)

(declare-datatypes ((Unit!29940 0))(
  ( (Unit!29941) )
))
(declare-fun lt!396156 () Unit!29940)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!663 (array!50868 array!50870 (_ BitVec 32) (_ BitVec 32) V!28209 V!28209 (_ BitVec 32) (_ BitVec 64) V!28209 (_ BitVec 32) Int) Unit!29940)

(assert (=> b!875381 (= lt!396156 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!663 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875382 () Bool)

(declare-fun res!594905 () Bool)

(assert (=> b!875382 (=> (not res!594905) (not e!487327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50868 (_ BitVec 32)) Bool)

(assert (=> b!875382 (= res!594905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun lt!396158 () array!50870)

(declare-fun bm!38603 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3135 (array!50868 array!50870 (_ BitVec 32) (_ BitVec 32) V!28209 V!28209 (_ BitVec 32) Int) ListLongMap!10305)

(assert (=> bm!38603 (= call!38606 (getCurrentListMapNoExtraKeys!3135 _keys!868 lt!396158 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875383 () Bool)

(declare-fun res!594909 () Bool)

(assert (=> b!875383 (=> (not res!594909) (not e!487327))))

(declare-datatypes ((List!17360 0))(
  ( (Nil!17357) (Cons!17356 (h!18487 (_ BitVec 64)) (t!24401 List!17360)) )
))
(declare-fun arrayNoDuplicates!0 (array!50868 (_ BitVec 32) List!17360) Bool)

(assert (=> b!875383 (= res!594909 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17357))))

(declare-fun b!875384 () Bool)

(declare-fun e!487325 () Bool)

(declare-fun tp_is_empty!17371 () Bool)

(assert (=> b!875384 (= e!487325 tp_is_empty!17371)))

(declare-fun b!875386 () Bool)

(declare-fun e!487330 () Bool)

(assert (=> b!875386 (= e!487330 tp_is_empty!17371)))

(declare-fun mapNonEmpty!27665 () Bool)

(declare-fun mapRes!27665 () Bool)

(declare-fun tp!53056 () Bool)

(assert (=> mapNonEmpty!27665 (= mapRes!27665 (and tp!53056 e!487325))))

(declare-fun mapRest!27665 () (Array (_ BitVec 32) ValueCell!8246))

(declare-fun mapKey!27665 () (_ BitVec 32))

(declare-fun mapValue!27665 () ValueCell!8246)

(assert (=> mapNonEmpty!27665 (= (arr!24463 _values!688) (store mapRest!27665 mapKey!27665 mapValue!27665))))

(declare-fun b!875387 () Bool)

(declare-fun res!594904 () Bool)

(assert (=> b!875387 (=> (not res!594904) (not e!487327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875387 (= res!594904 (validMask!0 mask!1196))))

(declare-fun b!875388 () Bool)

(assert (=> b!875388 (= e!487328 (= call!38606 call!38607))))

(declare-fun b!875389 () Bool)

(assert (=> b!875389 (= e!487327 e!487326)))

(declare-fun res!594906 () Bool)

(assert (=> b!875389 (=> (not res!594906) (not e!487326))))

(assert (=> b!875389 (= res!594906 (= from!1053 i!612))))

(declare-fun lt!396154 () ListLongMap!10305)

(assert (=> b!875389 (= lt!396154 (getCurrentListMapNoExtraKeys!3135 _keys!868 lt!396158 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!875389 (= lt!396158 (array!50871 (store (arr!24463 _values!688) i!612 (ValueCellFull!8246 v!557)) (size!24903 _values!688)))))

(declare-fun lt!396155 () ListLongMap!10305)

(assert (=> b!875389 (= lt!396155 (getCurrentListMapNoExtraKeys!3135 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!875390 () Bool)

(assert (=> b!875390 (= e!487329 (bvslt from!1053 (size!24902 _keys!868)))))

(declare-fun lt!396157 () ListLongMap!10305)

(assert (=> b!875390 (= lt!396157 (getCurrentListMapNoExtraKeys!3135 _keys!868 lt!396158 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!27665 () Bool)

(assert (=> mapIsEmpty!27665 mapRes!27665))

(declare-fun b!875385 () Bool)

(declare-fun e!487331 () Bool)

(assert (=> b!875385 (= e!487331 (and e!487330 mapRes!27665))))

(declare-fun condMapEmpty!27665 () Bool)

(declare-fun mapDefault!27665 () ValueCell!8246)

