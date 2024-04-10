; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73178 () Bool)

(assert start!73178)

(declare-fun b_free!14093 () Bool)

(declare-fun b_next!14093 () Bool)

(assert (=> start!73178 (= b_free!14093 (not b_next!14093))))

(declare-fun tp!49782 () Bool)

(declare-fun b_and!23345 () Bool)

(assert (=> start!73178 (= tp!49782 b_and!23345)))

(declare-fun b!852340 () Bool)

(declare-fun e!475381 () Bool)

(declare-datatypes ((V!26685 0))(
  ( (V!26686 (val!8162 Int)) )
))
(declare-datatypes ((tuple2!10718 0))(
  ( (tuple2!10719 (_1!5370 (_ BitVec 64)) (_2!5370 V!26685)) )
))
(declare-datatypes ((List!16552 0))(
  ( (Nil!16549) (Cons!16548 (h!17679 tuple2!10718) (t!23091 List!16552)) )
))
(declare-datatypes ((ListLongMap!9487 0))(
  ( (ListLongMap!9488 (toList!4759 List!16552)) )
))
(declare-fun call!38135 () ListLongMap!9487)

(declare-fun call!38134 () ListLongMap!9487)

(assert (=> b!852340 (= e!475381 (= call!38135 call!38134))))

(declare-fun b!852341 () Bool)

(declare-fun e!475378 () Bool)

(declare-fun e!475382 () Bool)

(assert (=> b!852341 (= e!475378 (not e!475382))))

(declare-fun res!578926 () Bool)

(assert (=> b!852341 (=> res!578926 e!475382)))

(declare-datatypes ((array!48656 0))(
  ( (array!48657 (arr!23359 (Array (_ BitVec 32) (_ BitVec 64))) (size!23799 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48656)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852341 (= res!578926 (not (validKeyInArray!0 (select (arr!23359 _keys!868) from!1053))))))

(assert (=> b!852341 e!475381))

(declare-fun c!91810 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!852341 (= c!91810 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26685)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((Unit!29095 0))(
  ( (Unit!29096) )
))
(declare-fun lt!384042 () Unit!29095)

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!7675 0))(
  ( (ValueCellFull!7675 (v!10587 V!26685)) (EmptyCell!7675) )
))
(declare-datatypes ((array!48658 0))(
  ( (array!48659 (arr!23360 (Array (_ BitVec 32) ValueCell!7675)) (size!23800 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48658)

(declare-fun minValue!654 () V!26685)

(declare-fun zeroValue!654 () V!26685)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!387 (array!48656 array!48658 (_ BitVec 32) (_ BitVec 32) V!26685 V!26685 (_ BitVec 32) (_ BitVec 64) V!26685 (_ BitVec 32) Int) Unit!29095)

(assert (=> b!852341 (= lt!384042 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!387 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!578925 () Bool)

(declare-fun e!475384 () Bool)

(assert (=> start!73178 (=> (not res!578925) (not e!475384))))

(assert (=> start!73178 (= res!578925 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23799 _keys!868))))))

(assert (=> start!73178 e!475384))

(declare-fun tp_is_empty!16229 () Bool)

(assert (=> start!73178 tp_is_empty!16229))

(assert (=> start!73178 true))

(assert (=> start!73178 tp!49782))

(declare-fun array_inv!18528 (array!48656) Bool)

(assert (=> start!73178 (array_inv!18528 _keys!868)))

(declare-fun e!475377 () Bool)

(declare-fun array_inv!18529 (array!48658) Bool)

(assert (=> start!73178 (and (array_inv!18529 _values!688) e!475377)))

(declare-fun b!852342 () Bool)

(declare-fun res!578924 () Bool)

(assert (=> b!852342 (=> (not res!578924) (not e!475384))))

(assert (=> b!852342 (= res!578924 (and (= (size!23800 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23799 _keys!868) (size!23800 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!852343 () Bool)

(declare-fun res!578927 () Bool)

(assert (=> b!852343 (=> (not res!578927) (not e!475384))))

(declare-datatypes ((List!16553 0))(
  ( (Nil!16550) (Cons!16549 (h!17680 (_ BitVec 64)) (t!23092 List!16553)) )
))
(declare-fun arrayNoDuplicates!0 (array!48656 (_ BitVec 32) List!16553) Bool)

(assert (=> b!852343 (= res!578927 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16550))))

(declare-fun b!852344 () Bool)

(declare-fun res!578923 () Bool)

(assert (=> b!852344 (=> (not res!578923) (not e!475384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48656 (_ BitVec 32)) Bool)

(assert (=> b!852344 (= res!578923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!852345 () Bool)

(declare-fun e!475379 () Bool)

(assert (=> b!852345 (= e!475379 tp_is_empty!16229)))

(declare-fun b!852346 () Bool)

(assert (=> b!852346 (= e!475384 e!475378)))

(declare-fun res!578918 () Bool)

(assert (=> b!852346 (=> (not res!578918) (not e!475378))))

(assert (=> b!852346 (= res!578918 (= from!1053 i!612))))

(declare-fun lt!384040 () ListLongMap!9487)

(declare-fun lt!384038 () array!48658)

(declare-fun getCurrentListMapNoExtraKeys!2741 (array!48656 array!48658 (_ BitVec 32) (_ BitVec 32) V!26685 V!26685 (_ BitVec 32) Int) ListLongMap!9487)

(assert (=> b!852346 (= lt!384040 (getCurrentListMapNoExtraKeys!2741 _keys!868 lt!384038 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!852346 (= lt!384038 (array!48659 (store (arr!23360 _values!688) i!612 (ValueCellFull!7675 v!557)) (size!23800 _values!688)))))

(declare-fun lt!384037 () ListLongMap!9487)

(assert (=> b!852346 (= lt!384037 (getCurrentListMapNoExtraKeys!2741 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!852347 () Bool)

(declare-fun res!578920 () Bool)

(assert (=> b!852347 (=> (not res!578920) (not e!475384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852347 (= res!578920 (validMask!0 mask!1196))))

(declare-fun b!852348 () Bool)

(declare-fun e!475380 () Bool)

(declare-fun mapRes!25943 () Bool)

(assert (=> b!852348 (= e!475377 (and e!475380 mapRes!25943))))

(declare-fun condMapEmpty!25943 () Bool)

(declare-fun mapDefault!25943 () ValueCell!7675)

