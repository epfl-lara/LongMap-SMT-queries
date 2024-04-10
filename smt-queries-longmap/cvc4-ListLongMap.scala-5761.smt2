; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74418 () Bool)

(assert start!74418)

(declare-fun b_free!15161 () Bool)

(declare-fun b_next!15161 () Bool)

(assert (=> start!74418 (= b_free!15161 (not b_next!15161))))

(declare-fun tp!53161 () Bool)

(declare-fun b_and!24975 () Bool)

(assert (=> start!74418 (= tp!53161 b_and!24975)))

(declare-fun mapNonEmpty!27719 () Bool)

(declare-fun mapRes!27719 () Bool)

(declare-fun tp!53160 () Bool)

(declare-fun e!487817 () Bool)

(assert (=> mapNonEmpty!27719 (= mapRes!27719 (and tp!53160 e!487817))))

(declare-datatypes ((V!28253 0))(
  ( (V!28254 (val!8750 Int)) )
))
(declare-datatypes ((ValueCell!8263 0))(
  ( (ValueCellFull!8263 (v!11183 V!28253)) (EmptyCell!8263) )
))
(declare-fun mapValue!27719 () ValueCell!8263)

(declare-fun mapKey!27719 () (_ BitVec 32))

(declare-fun mapRest!27719 () (Array (_ BitVec 32) ValueCell!8263))

(declare-datatypes ((array!50936 0))(
  ( (array!50937 (arr!24495 (Array (_ BitVec 32) ValueCell!8263)) (size!24935 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50936)

(assert (=> mapNonEmpty!27719 (= (arr!24495 _values!688) (store mapRest!27719 mapKey!27719 mapValue!27719))))

(declare-datatypes ((tuple2!11568 0))(
  ( (tuple2!11569 (_1!5795 (_ BitVec 64)) (_2!5795 V!28253)) )
))
(declare-datatypes ((List!17386 0))(
  ( (Nil!17383) (Cons!17382 (h!18513 tuple2!11568) (t!24451 List!17386)) )
))
(declare-datatypes ((ListLongMap!10337 0))(
  ( (ListLongMap!10338 (toList!5184 List!17386)) )
))
(declare-fun call!38726 () ListLongMap!10337)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!38723 () Bool)

(declare-datatypes ((array!50938 0))(
  ( (array!50939 (arr!24496 (Array (_ BitVec 32) (_ BitVec 64))) (size!24936 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50938)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28253)

(declare-fun zeroValue!654 () V!28253)

(declare-fun getCurrentListMapNoExtraKeys!3151 (array!50938 array!50936 (_ BitVec 32) (_ BitVec 32) V!28253 V!28253 (_ BitVec 32) Int) ListLongMap!10337)

(assert (=> bm!38723 (= call!38726 (getCurrentListMapNoExtraKeys!3151 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876294 () Bool)

(declare-fun res!595461 () Bool)

(declare-fun e!487818 () Bool)

(assert (=> b!876294 (=> (not res!595461) (not e!487818))))

(assert (=> b!876294 (= res!595461 (and (= (size!24935 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24936 _keys!868) (size!24935 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!876295 () Bool)

(declare-fun res!595464 () Bool)

(assert (=> b!876295 (=> (not res!595464) (not e!487818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876295 (= res!595464 (validMask!0 mask!1196))))

(declare-fun b!876296 () Bool)

(declare-fun e!487820 () Bool)

(declare-fun tp_is_empty!17405 () Bool)

(assert (=> b!876296 (= e!487820 tp_is_empty!17405)))

(declare-fun res!595467 () Bool)

(assert (=> start!74418 (=> (not res!595467) (not e!487818))))

(assert (=> start!74418 (= res!595467 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24936 _keys!868))))))

(assert (=> start!74418 e!487818))

(assert (=> start!74418 tp_is_empty!17405))

(assert (=> start!74418 true))

(assert (=> start!74418 tp!53161))

(declare-fun array_inv!19312 (array!50938) Bool)

(assert (=> start!74418 (array_inv!19312 _keys!868)))

(declare-fun e!487814 () Bool)

(declare-fun array_inv!19313 (array!50936) Bool)

(assert (=> start!74418 (and (array_inv!19313 _values!688) e!487814)))

(declare-fun b!876297 () Bool)

(declare-fun res!595466 () Bool)

(assert (=> b!876297 (=> (not res!595466) (not e!487818))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!876297 (= res!595466 (and (= (select (arr!24496 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!876298 () Bool)

(declare-fun e!487821 () Bool)

(declare-fun e!487819 () Bool)

(assert (=> b!876298 (= e!487821 (not e!487819))))

(declare-fun res!595469 () Bool)

(assert (=> b!876298 (=> res!595469 e!487819)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876298 (= res!595469 (not (validKeyInArray!0 (select (arr!24496 _keys!868) from!1053))))))

(declare-fun e!487815 () Bool)

(assert (=> b!876298 e!487815))

(declare-fun c!92591 () Bool)

(assert (=> b!876298 (= c!92591 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!28253)

(declare-datatypes ((Unit!29966 0))(
  ( (Unit!29967) )
))
(declare-fun lt!396444 () Unit!29966)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!676 (array!50938 array!50936 (_ BitVec 32) (_ BitVec 32) V!28253 V!28253 (_ BitVec 32) (_ BitVec 64) V!28253 (_ BitVec 32) Int) Unit!29966)

(assert (=> b!876298 (= lt!396444 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!676 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876299 () Bool)

(declare-fun call!38727 () ListLongMap!10337)

(declare-fun +!2485 (ListLongMap!10337 tuple2!11568) ListLongMap!10337)

(assert (=> b!876299 (= e!487815 (= call!38727 (+!2485 call!38726 (tuple2!11569 k!854 v!557))))))

(declare-fun b!876300 () Bool)

(declare-fun res!595460 () Bool)

(assert (=> b!876300 (=> (not res!595460) (not e!487818))))

(declare-datatypes ((List!17387 0))(
  ( (Nil!17384) (Cons!17383 (h!18514 (_ BitVec 64)) (t!24452 List!17387)) )
))
(declare-fun arrayNoDuplicates!0 (array!50938 (_ BitVec 32) List!17387) Bool)

(assert (=> b!876300 (= res!595460 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17384))))

(declare-fun b!876301 () Bool)

(declare-fun res!595462 () Bool)

(assert (=> b!876301 (=> (not res!595462) (not e!487818))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50938 (_ BitVec 32)) Bool)

(assert (=> b!876301 (= res!595462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!876302 () Bool)

(declare-fun res!595468 () Bool)

(assert (=> b!876302 (=> (not res!595468) (not e!487818))))

(assert (=> b!876302 (= res!595468 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24936 _keys!868))))))

(declare-fun b!876303 () Bool)

(assert (=> b!876303 (= e!487814 (and e!487820 mapRes!27719))))

(declare-fun condMapEmpty!27719 () Bool)

(declare-fun mapDefault!27719 () ValueCell!8263)

