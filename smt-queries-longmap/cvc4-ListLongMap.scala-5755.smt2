; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74362 () Bool)

(assert start!74362)

(declare-fun b_free!15125 () Bool)

(declare-fun b_next!15125 () Bool)

(assert (=> start!74362 (= b_free!15125 (not b_next!15125))))

(declare-fun tp!53050 () Bool)

(declare-fun b_and!24901 () Bool)

(assert (=> start!74362 (= tp!53050 b_and!24901)))

(declare-fun b!875332 () Bool)

(declare-fun res!594872 () Bool)

(declare-fun e!487305 () Bool)

(assert (=> b!875332 (=> (not res!594872) (not e!487305))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875332 (= res!594872 (validKeyInArray!0 k!854))))

(declare-fun b!875333 () Bool)

(declare-fun e!487304 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((V!28205 0))(
  ( (V!28206 (val!8732 Int)) )
))
(declare-datatypes ((ValueCell!8245 0))(
  ( (ValueCellFull!8245 (v!11161 V!28205)) (EmptyCell!8245) )
))
(declare-datatypes ((array!50864 0))(
  ( (array!50865 (arr!24460 (Array (_ BitVec 32) ValueCell!8245)) (size!24900 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50864)

(assert (=> b!875333 (= e!487304 (bvslt i!612 (size!24900 _values!688)))))

(declare-fun b!875334 () Bool)

(declare-fun res!594876 () Bool)

(assert (=> b!875334 (=> (not res!594876) (not e!487305))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875334 (= res!594876 (validMask!0 mask!1196))))

(declare-fun b!875335 () Bool)

(declare-fun e!487303 () Bool)

(assert (=> b!875335 (= e!487305 e!487303)))

(declare-fun res!594873 () Bool)

(assert (=> b!875335 (=> (not res!594873) (not e!487303))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!875335 (= res!594873 (= from!1053 i!612))))

(declare-datatypes ((tuple2!11534 0))(
  ( (tuple2!11535 (_1!5778 (_ BitVec 64)) (_2!5778 V!28205)) )
))
(declare-datatypes ((List!17358 0))(
  ( (Nil!17355) (Cons!17354 (h!18485 tuple2!11534) (t!24399 List!17358)) )
))
(declare-datatypes ((ListLongMap!10303 0))(
  ( (ListLongMap!10304 (toList!5167 List!17358)) )
))
(declare-fun lt!396140 () ListLongMap!10303)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!396143 () array!50864)

(declare-datatypes ((array!50866 0))(
  ( (array!50867 (arr!24461 (Array (_ BitVec 32) (_ BitVec 64))) (size!24901 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50866)

(declare-fun minValue!654 () V!28205)

(declare-fun zeroValue!654 () V!28205)

(declare-fun getCurrentListMapNoExtraKeys!3134 (array!50866 array!50864 (_ BitVec 32) (_ BitVec 32) V!28205 V!28205 (_ BitVec 32) Int) ListLongMap!10303)

(assert (=> b!875335 (= lt!396140 (getCurrentListMapNoExtraKeys!3134 _keys!868 lt!396143 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28205)

(assert (=> b!875335 (= lt!396143 (array!50865 (store (arr!24460 _values!688) i!612 (ValueCellFull!8245 v!557)) (size!24900 _values!688)))))

(declare-fun lt!396142 () ListLongMap!10303)

(assert (=> b!875335 (= lt!396142 (getCurrentListMapNoExtraKeys!3134 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!875336 () Bool)

(declare-fun res!594875 () Bool)

(assert (=> b!875336 (=> (not res!594875) (not e!487305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50866 (_ BitVec 32)) Bool)

(assert (=> b!875336 (= res!594875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27662 () Bool)

(declare-fun mapRes!27662 () Bool)

(declare-fun tp!53049 () Bool)

(declare-fun e!487301 () Bool)

(assert (=> mapNonEmpty!27662 (= mapRes!27662 (and tp!53049 e!487301))))

(declare-fun mapRest!27662 () (Array (_ BitVec 32) ValueCell!8245))

(declare-fun mapValue!27662 () ValueCell!8245)

(declare-fun mapKey!27662 () (_ BitVec 32))

(assert (=> mapNonEmpty!27662 (= (arr!24460 _values!688) (store mapRest!27662 mapKey!27662 mapValue!27662))))

(declare-fun mapIsEmpty!27662 () Bool)

(assert (=> mapIsEmpty!27662 mapRes!27662))

(declare-fun b!875338 () Bool)

(declare-fun res!594878 () Bool)

(assert (=> b!875338 (=> (not res!594878) (not e!487305))))

(assert (=> b!875338 (= res!594878 (and (= (select (arr!24461 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!875339 () Bool)

(declare-fun tp_is_empty!17369 () Bool)

(assert (=> b!875339 (= e!487301 tp_is_empty!17369)))

(declare-fun call!38600 () ListLongMap!10303)

(declare-fun bm!38597 () Bool)

(assert (=> bm!38597 (= call!38600 (getCurrentListMapNoExtraKeys!3134 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875340 () Bool)

(assert (=> b!875340 (= e!487303 (not e!487304))))

(declare-fun res!594870 () Bool)

(assert (=> b!875340 (=> res!594870 e!487304)))

(assert (=> b!875340 (= res!594870 (not (validKeyInArray!0 (select (arr!24461 _keys!868) from!1053))))))

(declare-fun e!487302 () Bool)

(assert (=> b!875340 e!487302))

(declare-fun c!92501 () Bool)

(assert (=> b!875340 (= c!92501 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29938 0))(
  ( (Unit!29939) )
))
(declare-fun lt!396141 () Unit!29938)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!662 (array!50866 array!50864 (_ BitVec 32) (_ BitVec 32) V!28205 V!28205 (_ BitVec 32) (_ BitVec 64) V!28205 (_ BitVec 32) Int) Unit!29938)

(assert (=> b!875340 (= lt!396141 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!662 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!594879 () Bool)

(assert (=> start!74362 (=> (not res!594879) (not e!487305))))

(assert (=> start!74362 (= res!594879 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24901 _keys!868))))))

(assert (=> start!74362 e!487305))

(assert (=> start!74362 tp_is_empty!17369))

(assert (=> start!74362 true))

(assert (=> start!74362 tp!53050))

(declare-fun array_inv!19284 (array!50866) Bool)

(assert (=> start!74362 (array_inv!19284 _keys!868)))

(declare-fun e!487307 () Bool)

(declare-fun array_inv!19285 (array!50864) Bool)

(assert (=> start!74362 (and (array_inv!19285 _values!688) e!487307)))

(declare-fun b!875337 () Bool)

(declare-fun e!487306 () Bool)

(assert (=> b!875337 (= e!487306 tp_is_empty!17369)))

(declare-fun b!875341 () Bool)

(declare-fun call!38601 () ListLongMap!10303)

(declare-fun +!2471 (ListLongMap!10303 tuple2!11534) ListLongMap!10303)

(assert (=> b!875341 (= e!487302 (= call!38601 (+!2471 call!38600 (tuple2!11535 k!854 v!557))))))

(declare-fun bm!38598 () Bool)

(assert (=> bm!38598 (= call!38601 (getCurrentListMapNoExtraKeys!3134 _keys!868 lt!396143 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875342 () Bool)

(assert (=> b!875342 (= e!487307 (and e!487306 mapRes!27662))))

(declare-fun condMapEmpty!27662 () Bool)

(declare-fun mapDefault!27662 () ValueCell!8245)

