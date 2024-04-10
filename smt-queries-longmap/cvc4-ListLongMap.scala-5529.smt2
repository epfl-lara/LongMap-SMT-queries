; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72962 () Bool)

(assert start!72962)

(declare-fun b_free!13877 () Bool)

(declare-fun b_next!13877 () Bool)

(assert (=> start!72962 (= b_free!13877 (not b_next!13877))))

(declare-fun tp!49134 () Bool)

(declare-fun b_and!22963 () Bool)

(assert (=> start!72962 (= tp!49134 b_and!22963)))

(declare-fun b!847378 () Bool)

(declare-fun e!472853 () Bool)

(assert (=> b!847378 (= e!472853 (not true))))

(declare-fun e!472850 () Bool)

(assert (=> b!847378 e!472850))

(declare-fun c!91486 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!847378 (= c!91486 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!26397 0))(
  ( (V!26398 (val!8054 Int)) )
))
(declare-fun v!557 () V!26397)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!28937 0))(
  ( (Unit!28938) )
))
(declare-fun lt!381719 () Unit!28937)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!48236 0))(
  ( (array!48237 (arr!23149 (Array (_ BitVec 32) (_ BitVec 64))) (size!23589 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48236)

(declare-datatypes ((ValueCell!7567 0))(
  ( (ValueCellFull!7567 (v!10479 V!26397)) (EmptyCell!7567) )
))
(declare-datatypes ((array!48238 0))(
  ( (array!48239 (arr!23150 (Array (_ BitVec 32) ValueCell!7567)) (size!23590 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48238)

(declare-fun minValue!654 () V!26397)

(declare-fun zeroValue!654 () V!26397)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!314 (array!48236 array!48238 (_ BitVec 32) (_ BitVec 32) V!26397 V!26397 (_ BitVec 32) (_ BitVec 64) V!26397 (_ BitVec 32) Int) Unit!28937)

(assert (=> b!847378 (= lt!381719 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!314 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847379 () Bool)

(declare-fun res!575750 () Bool)

(declare-fun e!472852 () Bool)

(assert (=> b!847379 (=> (not res!575750) (not e!472852))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847379 (= res!575750 (validKeyInArray!0 k!854))))

(declare-datatypes ((tuple2!10518 0))(
  ( (tuple2!10519 (_1!5270 (_ BitVec 64)) (_2!5270 V!26397)) )
))
(declare-datatypes ((List!16377 0))(
  ( (Nil!16374) (Cons!16373 (h!17504 tuple2!10518) (t!22748 List!16377)) )
))
(declare-datatypes ((ListLongMap!9287 0))(
  ( (ListLongMap!9288 (toList!4659 List!16377)) )
))
(declare-fun call!37487 () ListLongMap!9287)

(declare-fun lt!381720 () array!48238)

(declare-fun bm!37483 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2643 (array!48236 array!48238 (_ BitVec 32) (_ BitVec 32) V!26397 V!26397 (_ BitVec 32) Int) ListLongMap!9287)

(assert (=> bm!37483 (= call!37487 (getCurrentListMapNoExtraKeys!2643 _keys!868 lt!381720 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847380 () Bool)

(declare-fun res!575744 () Bool)

(assert (=> b!847380 (=> (not res!575744) (not e!472852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48236 (_ BitVec 32)) Bool)

(assert (=> b!847380 (= res!575744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847381 () Bool)

(assert (=> b!847381 (= e!472852 e!472853)))

(declare-fun res!575749 () Bool)

(assert (=> b!847381 (=> (not res!575749) (not e!472853))))

(assert (=> b!847381 (= res!575749 (= from!1053 i!612))))

(declare-fun lt!381718 () ListLongMap!9287)

(assert (=> b!847381 (= lt!381718 (getCurrentListMapNoExtraKeys!2643 _keys!868 lt!381720 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!847381 (= lt!381720 (array!48239 (store (arr!23150 _values!688) i!612 (ValueCellFull!7567 v!557)) (size!23590 _values!688)))))

(declare-fun lt!381721 () ListLongMap!9287)

(assert (=> b!847381 (= lt!381721 (getCurrentListMapNoExtraKeys!2643 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847382 () Bool)

(declare-fun res!575746 () Bool)

(assert (=> b!847382 (=> (not res!575746) (not e!472852))))

(declare-datatypes ((List!16378 0))(
  ( (Nil!16375) (Cons!16374 (h!17505 (_ BitVec 64)) (t!22749 List!16378)) )
))
(declare-fun arrayNoDuplicates!0 (array!48236 (_ BitVec 32) List!16378) Bool)

(assert (=> b!847382 (= res!575746 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16375))))

(declare-fun b!847383 () Bool)

(declare-fun res!575747 () Bool)

(assert (=> b!847383 (=> (not res!575747) (not e!472852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847383 (= res!575747 (validMask!0 mask!1196))))

(declare-fun bm!37484 () Bool)

(declare-fun call!37486 () ListLongMap!9287)

(assert (=> bm!37484 (= call!37486 (getCurrentListMapNoExtraKeys!2643 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847384 () Bool)

(declare-fun e!472851 () Bool)

(declare-fun tp_is_empty!16013 () Bool)

(assert (=> b!847384 (= e!472851 tp_is_empty!16013)))

(declare-fun b!847385 () Bool)

(declare-fun res!575742 () Bool)

(assert (=> b!847385 (=> (not res!575742) (not e!472852))))

(assert (=> b!847385 (= res!575742 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23589 _keys!868))))))

(declare-fun b!847386 () Bool)

(declare-fun res!575743 () Bool)

(assert (=> b!847386 (=> (not res!575743) (not e!472852))))

(assert (=> b!847386 (= res!575743 (and (= (size!23590 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23589 _keys!868) (size!23590 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!575745 () Bool)

(assert (=> start!72962 (=> (not res!575745) (not e!472852))))

(assert (=> start!72962 (= res!575745 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23589 _keys!868))))))

(assert (=> start!72962 e!472852))

(assert (=> start!72962 tp_is_empty!16013))

(assert (=> start!72962 true))

(assert (=> start!72962 tp!49134))

(declare-fun array_inv!18386 (array!48236) Bool)

(assert (=> start!72962 (array_inv!18386 _keys!868)))

(declare-fun e!472849 () Bool)

(declare-fun array_inv!18387 (array!48238) Bool)

(assert (=> start!72962 (and (array_inv!18387 _values!688) e!472849)))

(declare-fun b!847387 () Bool)

(declare-fun res!575748 () Bool)

(assert (=> b!847387 (=> (not res!575748) (not e!472852))))

(assert (=> b!847387 (= res!575748 (and (= (select (arr!23149 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!847388 () Bool)

(declare-fun e!472855 () Bool)

(declare-fun mapRes!25619 () Bool)

(assert (=> b!847388 (= e!472849 (and e!472855 mapRes!25619))))

(declare-fun condMapEmpty!25619 () Bool)

(declare-fun mapDefault!25619 () ValueCell!7567)

