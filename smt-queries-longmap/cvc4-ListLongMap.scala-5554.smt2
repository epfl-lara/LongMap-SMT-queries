; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73112 () Bool)

(assert start!73112)

(declare-fun b_free!14027 () Bool)

(declare-fun b_next!14027 () Bool)

(assert (=> start!73112 (= b_free!14027 (not b_next!14027))))

(declare-fun tp!49584 () Bool)

(declare-fun b_and!23213 () Bool)

(assert (=> start!73112 (= tp!49584 b_and!23213)))

(declare-fun b!850789 () Bool)

(declare-fun e!474589 () Bool)

(declare-fun e!474591 () Bool)

(assert (=> b!850789 (= e!474589 e!474591)))

(declare-fun res!577934 () Bool)

(assert (=> b!850789 (=> (not res!577934) (not e!474591))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850789 (= res!577934 (= from!1053 i!612))))

(declare-datatypes ((V!26597 0))(
  ( (V!26598 (val!8129 Int)) )
))
(declare-datatypes ((tuple2!10660 0))(
  ( (tuple2!10661 (_1!5341 (_ BitVec 64)) (_2!5341 V!26597)) )
))
(declare-datatypes ((List!16502 0))(
  ( (Nil!16499) (Cons!16498 (h!17629 tuple2!10660) (t!22975 List!16502)) )
))
(declare-datatypes ((ListLongMap!9429 0))(
  ( (ListLongMap!9430 (toList!4730 List!16502)) )
))
(declare-fun lt!383046 () ListLongMap!9429)

(declare-datatypes ((ValueCell!7642 0))(
  ( (ValueCellFull!7642 (v!10554 V!26597)) (EmptyCell!7642) )
))
(declare-datatypes ((array!48530 0))(
  ( (array!48531 (arr!23296 (Array (_ BitVec 32) ValueCell!7642)) (size!23736 (_ BitVec 32))) )
))
(declare-fun lt!383045 () array!48530)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48532 0))(
  ( (array!48533 (arr!23297 (Array (_ BitVec 32) (_ BitVec 64))) (size!23737 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48532)

(declare-fun minValue!654 () V!26597)

(declare-fun zeroValue!654 () V!26597)

(declare-fun getCurrentListMapNoExtraKeys!2712 (array!48532 array!48530 (_ BitVec 32) (_ BitVec 32) V!26597 V!26597 (_ BitVec 32) Int) ListLongMap!9429)

(assert (=> b!850789 (= lt!383046 (getCurrentListMapNoExtraKeys!2712 _keys!868 lt!383045 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26597)

(declare-fun _values!688 () array!48530)

(assert (=> b!850789 (= lt!383045 (array!48531 (store (arr!23296 _values!688) i!612 (ValueCellFull!7642 v!557)) (size!23736 _values!688)))))

(declare-fun lt!383044 () ListLongMap!9429)

(assert (=> b!850789 (= lt!383044 (getCurrentListMapNoExtraKeys!2712 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!850790 () Bool)

(declare-fun e!474586 () Bool)

(declare-fun e!474590 () Bool)

(declare-fun mapRes!25844 () Bool)

(assert (=> b!850790 (= e!474586 (and e!474590 mapRes!25844))))

(declare-fun condMapEmpty!25844 () Bool)

(declare-fun mapDefault!25844 () ValueCell!7642)

