; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72556 () Bool)

(assert start!72556)

(declare-fun b_free!13741 () Bool)

(declare-fun b_next!13741 () Bool)

(assert (=> start!72556 (= b_free!13741 (not b_next!13741))))

(declare-fun tp!48322 () Bool)

(declare-fun b_and!22827 () Bool)

(assert (=> start!72556 (= tp!48322 b_and!22827)))

(declare-fun b!842262 () Bool)

(declare-fun e!469781 () Bool)

(assert (=> b!842262 (= e!469781 (not true))))

(declare-fun e!469783 () Bool)

(assert (=> b!842262 e!469783))

(declare-fun c!91471 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!842262 (= c!91471 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!25857 0))(
  ( (V!25858 (val!7851 Int)) )
))
(declare-fun v!557 () V!25857)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!47488 0))(
  ( (array!47489 (arr!22775 (Array (_ BitVec 32) (_ BitVec 64))) (size!23215 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47488)

(declare-datatypes ((ValueCell!7364 0))(
  ( (ValueCellFull!7364 (v!10276 V!25857)) (EmptyCell!7364) )
))
(declare-datatypes ((array!47490 0))(
  ( (array!47491 (arr!22776 (Array (_ BitVec 32) ValueCell!7364)) (size!23216 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47490)

(declare-datatypes ((Unit!28929 0))(
  ( (Unit!28930) )
))
(declare-fun lt!380977 () Unit!28929)

(declare-fun minValue!654 () V!25857)

(declare-fun zeroValue!654 () V!25857)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!310 (array!47488 array!47490 (_ BitVec 32) (_ BitVec 32) V!25857 V!25857 (_ BitVec 32) (_ BitVec 64) V!25857 (_ BitVec 32) Int) Unit!28929)

(assert (=> b!842262 (= lt!380977 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!310 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842263 () Bool)

(declare-fun res!572485 () Bool)

(assert (=> b!842263 (=> (not res!572485) (not e!469781))))

(assert (=> b!842263 (= res!572485 (and (= (size!23216 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23215 _keys!868) (size!23216 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842264 () Bool)

(declare-fun e!469784 () Bool)

(declare-fun tp_is_empty!15607 () Bool)

(assert (=> b!842264 (= e!469784 tp_is_empty!15607)))

(declare-datatypes ((tuple2!10428 0))(
  ( (tuple2!10429 (_1!5225 (_ BitVec 64)) (_2!5225 V!25857)) )
))
(declare-datatypes ((List!16204 0))(
  ( (Nil!16201) (Cons!16200 (h!17331 tuple2!10428) (t!22575 List!16204)) )
))
(declare-datatypes ((ListLongMap!9197 0))(
  ( (ListLongMap!9198 (toList!4614 List!16204)) )
))
(declare-fun call!37457 () ListLongMap!9197)

(declare-fun call!37456 () ListLongMap!9197)

(declare-fun b!842265 () Bool)

(declare-fun +!2074 (ListLongMap!9197 tuple2!10428) ListLongMap!9197)

(assert (=> b!842265 (= e!469783 (= call!37456 (+!2074 call!37457 (tuple2!10429 k!854 v!557))))))

(declare-fun mapNonEmpty!25010 () Bool)

(declare-fun mapRes!25010 () Bool)

(declare-fun tp!48321 () Bool)

(assert (=> mapNonEmpty!25010 (= mapRes!25010 (and tp!48321 e!469784))))

(declare-fun mapKey!25010 () (_ BitVec 32))

(declare-fun mapRest!25010 () (Array (_ BitVec 32) ValueCell!7364))

(declare-fun mapValue!25010 () ValueCell!7364)

(assert (=> mapNonEmpty!25010 (= (arr!22776 _values!688) (store mapRest!25010 mapKey!25010 mapValue!25010))))

(declare-fun res!572483 () Bool)

(assert (=> start!72556 (=> (not res!572483) (not e!469781))))

(assert (=> start!72556 (= res!572483 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23215 _keys!868))))))

(assert (=> start!72556 e!469781))

(assert (=> start!72556 tp_is_empty!15607))

(assert (=> start!72556 true))

(assert (=> start!72556 tp!48322))

(declare-fun array_inv!18122 (array!47488) Bool)

(assert (=> start!72556 (array_inv!18122 _keys!868)))

(declare-fun e!469782 () Bool)

(declare-fun array_inv!18123 (array!47490) Bool)

(assert (=> start!72556 (and (array_inv!18123 _values!688) e!469782)))

(declare-fun b!842261 () Bool)

(declare-fun res!572488 () Bool)

(assert (=> b!842261 (=> (not res!572488) (not e!469781))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!842261 (= res!572488 (validKeyInArray!0 k!854))))

(declare-fun b!842266 () Bool)

(declare-fun res!572486 () Bool)

(assert (=> b!842266 (=> (not res!572486) (not e!469781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47488 (_ BitVec 32)) Bool)

(assert (=> b!842266 (= res!572486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842267 () Bool)

(declare-fun res!572484 () Bool)

(assert (=> b!842267 (=> (not res!572484) (not e!469781))))

(assert (=> b!842267 (= res!572484 (and (= (select (arr!22775 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23215 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun bm!37453 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2599 (array!47488 array!47490 (_ BitVec 32) (_ BitVec 32) V!25857 V!25857 (_ BitVec 32) Int) ListLongMap!9197)

(assert (=> bm!37453 (= call!37457 (getCurrentListMapNoExtraKeys!2599 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842268 () Bool)

(declare-fun res!572487 () Bool)

(assert (=> b!842268 (=> (not res!572487) (not e!469781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842268 (= res!572487 (validMask!0 mask!1196))))

(declare-fun b!842269 () Bool)

(declare-fun res!572482 () Bool)

(assert (=> b!842269 (=> (not res!572482) (not e!469781))))

(declare-datatypes ((List!16205 0))(
  ( (Nil!16202) (Cons!16201 (h!17332 (_ BitVec 64)) (t!22576 List!16205)) )
))
(declare-fun arrayNoDuplicates!0 (array!47488 (_ BitVec 32) List!16205) Bool)

(assert (=> b!842269 (= res!572482 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16202))))

(declare-fun b!842270 () Bool)

(declare-fun e!469786 () Bool)

(assert (=> b!842270 (= e!469782 (and e!469786 mapRes!25010))))

(declare-fun condMapEmpty!25010 () Bool)

(declare-fun mapDefault!25010 () ValueCell!7364)

