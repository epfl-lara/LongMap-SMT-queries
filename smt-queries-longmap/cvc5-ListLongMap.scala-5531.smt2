; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72970 () Bool)

(assert start!72970)

(declare-fun b_free!13885 () Bool)

(declare-fun b_next!13885 () Bool)

(assert (=> start!72970 (= b_free!13885 (not b_next!13885))))

(declare-fun tp!49159 () Bool)

(declare-fun b_and!22971 () Bool)

(assert (=> start!72970 (= tp!49159 b_and!22971)))

(declare-fun res!575855 () Bool)

(declare-fun e!472938 () Bool)

(assert (=> start!72970 (=> (not res!575855) (not e!472938))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48252 0))(
  ( (array!48253 (arr!23157 (Array (_ BitVec 32) (_ BitVec 64))) (size!23597 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48252)

(assert (=> start!72970 (= res!575855 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23597 _keys!868))))))

(assert (=> start!72970 e!472938))

(declare-fun tp_is_empty!16021 () Bool)

(assert (=> start!72970 tp_is_empty!16021))

(assert (=> start!72970 true))

(assert (=> start!72970 tp!49159))

(declare-fun array_inv!18390 (array!48252) Bool)

(assert (=> start!72970 (array_inv!18390 _keys!868)))

(declare-datatypes ((V!26409 0))(
  ( (V!26410 (val!8058 Int)) )
))
(declare-datatypes ((ValueCell!7571 0))(
  ( (ValueCellFull!7571 (v!10483 V!26409)) (EmptyCell!7571) )
))
(declare-datatypes ((array!48254 0))(
  ( (array!48255 (arr!23158 (Array (_ BitVec 32) ValueCell!7571)) (size!23598 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48254)

(declare-fun e!472934 () Bool)

(declare-fun array_inv!18391 (array!48254) Bool)

(assert (=> start!72970 (and (array_inv!18391 _values!688) e!472934)))

(declare-fun mapNonEmpty!25631 () Bool)

(declare-fun mapRes!25631 () Bool)

(declare-fun tp!49158 () Bool)

(declare-fun e!472935 () Bool)

(assert (=> mapNonEmpty!25631 (= mapRes!25631 (and tp!49158 e!472935))))

(declare-fun mapKey!25631 () (_ BitVec 32))

(declare-fun mapRest!25631 () (Array (_ BitVec 32) ValueCell!7571))

(declare-fun mapValue!25631 () ValueCell!7571)

(assert (=> mapNonEmpty!25631 (= (arr!23158 _values!688) (store mapRest!25631 mapKey!25631 mapValue!25631))))

(declare-fun b!847546 () Bool)

(declare-fun e!472939 () Bool)

(assert (=> b!847546 (= e!472938 e!472939)))

(declare-fun res!575853 () Bool)

(assert (=> b!847546 (=> (not res!575853) (not e!472939))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!847546 (= res!575853 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10526 0))(
  ( (tuple2!10527 (_1!5274 (_ BitVec 64)) (_2!5274 V!26409)) )
))
(declare-datatypes ((List!16384 0))(
  ( (Nil!16381) (Cons!16380 (h!17511 tuple2!10526) (t!22755 List!16384)) )
))
(declare-datatypes ((ListLongMap!9295 0))(
  ( (ListLongMap!9296 (toList!4663 List!16384)) )
))
(declare-fun lt!381769 () ListLongMap!9295)

(declare-fun minValue!654 () V!26409)

(declare-fun zeroValue!654 () V!26409)

(declare-fun lt!381766 () array!48254)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2647 (array!48252 array!48254 (_ BitVec 32) (_ BitVec 32) V!26409 V!26409 (_ BitVec 32) Int) ListLongMap!9295)

(assert (=> b!847546 (= lt!381769 (getCurrentListMapNoExtraKeys!2647 _keys!868 lt!381766 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26409)

(assert (=> b!847546 (= lt!381766 (array!48255 (store (arr!23158 _values!688) i!612 (ValueCellFull!7571 v!557)) (size!23598 _values!688)))))

(declare-fun lt!381767 () ListLongMap!9295)

(assert (=> b!847546 (= lt!381767 (getCurrentListMapNoExtraKeys!2647 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun bm!37507 () Bool)

(declare-fun call!37510 () ListLongMap!9295)

(assert (=> bm!37507 (= call!37510 (getCurrentListMapNoExtraKeys!2647 _keys!868 lt!381766 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847547 () Bool)

(declare-fun res!575854 () Bool)

(assert (=> b!847547 (=> (not res!575854) (not e!472938))))

(declare-datatypes ((List!16385 0))(
  ( (Nil!16382) (Cons!16381 (h!17512 (_ BitVec 64)) (t!22756 List!16385)) )
))
(declare-fun arrayNoDuplicates!0 (array!48252 (_ BitVec 32) List!16385) Bool)

(assert (=> b!847547 (= res!575854 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16382))))

(declare-fun b!847548 () Bool)

(declare-fun res!575851 () Bool)

(assert (=> b!847548 (=> (not res!575851) (not e!472938))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!847548 (= res!575851 (and (= (select (arr!23157 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun call!37511 () ListLongMap!9295)

(declare-fun bm!37508 () Bool)

(assert (=> bm!37508 (= call!37511 (getCurrentListMapNoExtraKeys!2647 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847549 () Bool)

(assert (=> b!847549 (= e!472935 tp_is_empty!16021)))

(declare-fun b!847550 () Bool)

(declare-fun res!575850 () Bool)

(assert (=> b!847550 (=> (not res!575850) (not e!472938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847550 (= res!575850 (validMask!0 mask!1196))))

(declare-fun b!847551 () Bool)

(declare-fun res!575856 () Bool)

(assert (=> b!847551 (=> (not res!575856) (not e!472938))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847551 (= res!575856 (validKeyInArray!0 k!854))))

(declare-fun b!847552 () Bool)

(declare-fun res!575857 () Bool)

(assert (=> b!847552 (=> (not res!575857) (not e!472938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48252 (_ BitVec 32)) Bool)

(assert (=> b!847552 (= res!575857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847553 () Bool)

(declare-fun res!575858 () Bool)

(assert (=> b!847553 (=> (not res!575858) (not e!472938))))

(assert (=> b!847553 (= res!575858 (and (= (size!23598 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23597 _keys!868) (size!23598 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847554 () Bool)

(assert (=> b!847554 (= e!472939 (not true))))

(declare-fun e!472936 () Bool)

(assert (=> b!847554 e!472936))

(declare-fun c!91498 () Bool)

(assert (=> b!847554 (= c!91498 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28941 0))(
  ( (Unit!28942) )
))
(declare-fun lt!381768 () Unit!28941)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!316 (array!48252 array!48254 (_ BitVec 32) (_ BitVec 32) V!26409 V!26409 (_ BitVec 32) (_ BitVec 64) V!26409 (_ BitVec 32) Int) Unit!28941)

(assert (=> b!847554 (= lt!381768 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!316 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25631 () Bool)

(assert (=> mapIsEmpty!25631 mapRes!25631))

(declare-fun b!847555 () Bool)

(assert (=> b!847555 (= e!472936 (= call!37510 call!37511))))

(declare-fun b!847556 () Bool)

(declare-fun e!472937 () Bool)

(assert (=> b!847556 (= e!472937 tp_is_empty!16021)))

(declare-fun b!847557 () Bool)

(declare-fun res!575852 () Bool)

(assert (=> b!847557 (=> (not res!575852) (not e!472938))))

(assert (=> b!847557 (= res!575852 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23597 _keys!868))))))

(declare-fun b!847558 () Bool)

(assert (=> b!847558 (= e!472934 (and e!472937 mapRes!25631))))

(declare-fun condMapEmpty!25631 () Bool)

(declare-fun mapDefault!25631 () ValueCell!7571)

