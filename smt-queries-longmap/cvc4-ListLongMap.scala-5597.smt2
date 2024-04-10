; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73370 () Bool)

(assert start!73370)

(declare-fun b_free!14285 () Bool)

(declare-fun b_next!14285 () Bool)

(assert (=> start!73370 (= b_free!14285 (not b_next!14285))))

(declare-fun tp!50359 () Bool)

(declare-fun b_and!23641 () Bool)

(assert (=> start!73370 (= tp!50359 b_and!23641)))

(declare-fun res!581563 () Bool)

(declare-fun e!477307 () Bool)

(assert (=> start!73370 (=> (not res!581563) (not e!477307))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49034 0))(
  ( (array!49035 (arr!23548 (Array (_ BitVec 32) (_ BitVec 64))) (size!23988 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49034)

(assert (=> start!73370 (= res!581563 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23988 _keys!868))))))

(assert (=> start!73370 e!477307))

(declare-fun tp_is_empty!16421 () Bool)

(assert (=> start!73370 tp_is_empty!16421))

(assert (=> start!73370 true))

(assert (=> start!73370 tp!50359))

(declare-fun array_inv!18654 (array!49034) Bool)

(assert (=> start!73370 (array_inv!18654 _keys!868)))

(declare-datatypes ((V!26941 0))(
  ( (V!26942 (val!8258 Int)) )
))
(declare-datatypes ((ValueCell!7771 0))(
  ( (ValueCellFull!7771 (v!10683 V!26941)) (EmptyCell!7771) )
))
(declare-datatypes ((array!49036 0))(
  ( (array!49037 (arr!23549 (Array (_ BitVec 32) ValueCell!7771)) (size!23989 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49036)

(declare-fun e!477306 () Bool)

(declare-fun array_inv!18655 (array!49036) Bool)

(assert (=> start!73370 (and (array_inv!18655 _values!688) e!477306)))

(declare-fun b!856254 () Bool)

(declare-fun res!581557 () Bool)

(assert (=> b!856254 (=> (not res!581557) (not e!477307))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49034 (_ BitVec 32)) Bool)

(assert (=> b!856254 (= res!581557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856255 () Bool)

(declare-fun res!581561 () Bool)

(assert (=> b!856255 (=> (not res!581561) (not e!477307))))

(declare-datatypes ((List!16698 0))(
  ( (Nil!16695) (Cons!16694 (h!17825 (_ BitVec 64)) (t!23339 List!16698)) )
))
(declare-fun arrayNoDuplicates!0 (array!49034 (_ BitVec 32) List!16698) Bool)

(assert (=> b!856255 (= res!581561 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16695))))

(declare-fun b!856256 () Bool)

(declare-fun res!581564 () Bool)

(assert (=> b!856256 (=> (not res!581564) (not e!477307))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856256 (= res!581564 (validKeyInArray!0 k!854))))

(declare-fun b!856257 () Bool)

(declare-fun res!581556 () Bool)

(assert (=> b!856257 (=> (not res!581556) (not e!477307))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!856257 (= res!581556 (and (= (select (arr!23548 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!856258 () Bool)

(declare-fun e!477305 () Bool)

(assert (=> b!856258 (= e!477307 e!477305)))

(declare-fun res!581559 () Bool)

(assert (=> b!856258 (=> (not res!581559) (not e!477305))))

(assert (=> b!856258 (= res!581559 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!385894 () array!49036)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26941)

(declare-fun zeroValue!654 () V!26941)

(declare-datatypes ((tuple2!10886 0))(
  ( (tuple2!10887 (_1!5454 (_ BitVec 64)) (_2!5454 V!26941)) )
))
(declare-datatypes ((List!16699 0))(
  ( (Nil!16696) (Cons!16695 (h!17826 tuple2!10886) (t!23340 List!16699)) )
))
(declare-datatypes ((ListLongMap!9655 0))(
  ( (ListLongMap!9656 (toList!4843 List!16699)) )
))
(declare-fun lt!385895 () ListLongMap!9655)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2824 (array!49034 array!49036 (_ BitVec 32) (_ BitVec 32) V!26941 V!26941 (_ BitVec 32) Int) ListLongMap!9655)

(assert (=> b!856258 (= lt!385895 (getCurrentListMapNoExtraKeys!2824 _keys!868 lt!385894 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26941)

(assert (=> b!856258 (= lt!385894 (array!49037 (store (arr!23549 _values!688) i!612 (ValueCellFull!7771 v!557)) (size!23989 _values!688)))))

(declare-fun lt!385897 () ListLongMap!9655)

(assert (=> b!856258 (= lt!385897 (getCurrentListMapNoExtraKeys!2824 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856259 () Bool)

(declare-fun res!581560 () Bool)

(assert (=> b!856259 (=> (not res!581560) (not e!477307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856259 (= res!581560 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26231 () Bool)

(declare-fun mapRes!26231 () Bool)

(declare-fun tp!50358 () Bool)

(declare-fun e!477310 () Bool)

(assert (=> mapNonEmpty!26231 (= mapRes!26231 (and tp!50358 e!477310))))

(declare-fun mapRest!26231 () (Array (_ BitVec 32) ValueCell!7771))

(declare-fun mapKey!26231 () (_ BitVec 32))

(declare-fun mapValue!26231 () ValueCell!7771)

(assert (=> mapNonEmpty!26231 (= (arr!23549 _values!688) (store mapRest!26231 mapKey!26231 mapValue!26231))))

(declare-fun b!856260 () Bool)

(assert (=> b!856260 (= e!477305 (not true))))

(declare-fun +!2200 (ListLongMap!9655 tuple2!10886) ListLongMap!9655)

(assert (=> b!856260 (= (getCurrentListMapNoExtraKeys!2824 _keys!868 lt!385894 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2200 (getCurrentListMapNoExtraKeys!2824 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10887 k!854 v!557)))))

(declare-datatypes ((Unit!29187 0))(
  ( (Unit!29188) )
))
(declare-fun lt!385896 () Unit!29187)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!421 (array!49034 array!49036 (_ BitVec 32) (_ BitVec 32) V!26941 V!26941 (_ BitVec 32) (_ BitVec 64) V!26941 (_ BitVec 32) Int) Unit!29187)

(assert (=> b!856260 (= lt!385896 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!421 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!856261 () Bool)

(declare-fun e!477309 () Bool)

(assert (=> b!856261 (= e!477309 tp_is_empty!16421)))

(declare-fun mapIsEmpty!26231 () Bool)

(assert (=> mapIsEmpty!26231 mapRes!26231))

(declare-fun b!856262 () Bool)

(assert (=> b!856262 (= e!477310 tp_is_empty!16421)))

(declare-fun b!856263 () Bool)

(assert (=> b!856263 (= e!477306 (and e!477309 mapRes!26231))))

(declare-fun condMapEmpty!26231 () Bool)

(declare-fun mapDefault!26231 () ValueCell!7771)

