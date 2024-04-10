; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73322 () Bool)

(assert start!73322)

(declare-fun b_free!14237 () Bool)

(declare-fun b_next!14237 () Bool)

(assert (=> start!73322 (= b_free!14237 (not b_next!14237))))

(declare-fun tp!50214 () Bool)

(declare-fun b_and!23593 () Bool)

(assert (=> start!73322 (= tp!50214 b_and!23593)))

(declare-fun b!855436 () Bool)

(declare-fun e!476919 () Bool)

(assert (=> b!855436 (= e!476919 false)))

(declare-datatypes ((V!26877 0))(
  ( (V!26878 (val!8234 Int)) )
))
(declare-fun v!557 () V!26877)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10850 0))(
  ( (tuple2!10851 (_1!5436 (_ BitVec 64)) (_2!5436 V!26877)) )
))
(declare-datatypes ((List!16663 0))(
  ( (Nil!16660) (Cons!16659 (h!17790 tuple2!10850) (t!23304 List!16663)) )
))
(declare-datatypes ((ListLongMap!9619 0))(
  ( (ListLongMap!9620 (toList!4825 List!16663)) )
))
(declare-fun lt!385698 () ListLongMap!9619)

(declare-datatypes ((array!48942 0))(
  ( (array!48943 (arr!23502 (Array (_ BitVec 32) (_ BitVec 64))) (size!23942 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48942)

(declare-datatypes ((ValueCell!7747 0))(
  ( (ValueCellFull!7747 (v!10659 V!26877)) (EmptyCell!7747) )
))
(declare-datatypes ((array!48944 0))(
  ( (array!48945 (arr!23503 (Array (_ BitVec 32) ValueCell!7747)) (size!23943 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48944)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26877)

(declare-fun zeroValue!654 () V!26877)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2806 (array!48942 array!48944 (_ BitVec 32) (_ BitVec 32) V!26877 V!26877 (_ BitVec 32) Int) ListLongMap!9619)

(assert (=> b!855436 (= lt!385698 (getCurrentListMapNoExtraKeys!2806 _keys!868 (array!48945 (store (arr!23503 _values!688) i!612 (ValueCellFull!7747 v!557)) (size!23943 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385699 () ListLongMap!9619)

(assert (=> b!855436 (= lt!385699 (getCurrentListMapNoExtraKeys!2806 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855437 () Bool)

(declare-fun e!476920 () Bool)

(declare-fun tp_is_empty!16373 () Bool)

(assert (=> b!855437 (= e!476920 tp_is_empty!16373)))

(declare-fun res!580960 () Bool)

(assert (=> start!73322 (=> (not res!580960) (not e!476919))))

(assert (=> start!73322 (= res!580960 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23942 _keys!868))))))

(assert (=> start!73322 e!476919))

(assert (=> start!73322 tp_is_empty!16373))

(assert (=> start!73322 true))

(assert (=> start!73322 tp!50214))

(declare-fun array_inv!18620 (array!48942) Bool)

(assert (=> start!73322 (array_inv!18620 _keys!868)))

(declare-fun e!476923 () Bool)

(declare-fun array_inv!18621 (array!48944) Bool)

(assert (=> start!73322 (and (array_inv!18621 _values!688) e!476923)))

(declare-fun b!855438 () Bool)

(declare-fun res!580961 () Bool)

(assert (=> b!855438 (=> (not res!580961) (not e!476919))))

(assert (=> b!855438 (= res!580961 (and (= (size!23943 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23942 _keys!868) (size!23943 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855439 () Bool)

(declare-fun res!580956 () Bool)

(assert (=> b!855439 (=> (not res!580956) (not e!476919))))

(assert (=> b!855439 (= res!580956 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23942 _keys!868))))))

(declare-fun b!855440 () Bool)

(declare-fun e!476921 () Bool)

(assert (=> b!855440 (= e!476921 tp_is_empty!16373)))

(declare-fun b!855441 () Bool)

(declare-fun res!580955 () Bool)

(assert (=> b!855441 (=> (not res!580955) (not e!476919))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855441 (= res!580955 (validKeyInArray!0 k!854))))

(declare-fun b!855442 () Bool)

(declare-fun mapRes!26159 () Bool)

(assert (=> b!855442 (= e!476923 (and e!476920 mapRes!26159))))

(declare-fun condMapEmpty!26159 () Bool)

(declare-fun mapDefault!26159 () ValueCell!7747)

