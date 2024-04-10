; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73376 () Bool)

(assert start!73376)

(declare-fun b_free!14291 () Bool)

(declare-fun b_next!14291 () Bool)

(assert (=> start!73376 (= b_free!14291 (not b_next!14291))))

(declare-fun tp!50376 () Bool)

(declare-fun b_and!23647 () Bool)

(assert (=> start!73376 (= tp!50376 b_and!23647)))

(declare-fun b!856362 () Bool)

(declare-fun res!581641 () Bool)

(declare-fun e!477360 () Bool)

(assert (=> b!856362 (=> (not res!581641) (not e!477360))))

(declare-datatypes ((array!49046 0))(
  ( (array!49047 (arr!23554 (Array (_ BitVec 32) (_ BitVec 64))) (size!23994 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49046)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49046 (_ BitVec 32)) Bool)

(assert (=> b!856362 (= res!581641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856363 () Bool)

(declare-fun res!581640 () Bool)

(assert (=> b!856363 (=> (not res!581640) (not e!477360))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856363 (= res!581640 (validKeyInArray!0 k!854))))

(declare-fun b!856364 () Bool)

(declare-fun res!581639 () Bool)

(assert (=> b!856364 (=> (not res!581639) (not e!477360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856364 (= res!581639 (validMask!0 mask!1196))))

(declare-fun b!856365 () Bool)

(declare-fun res!581637 () Bool)

(assert (=> b!856365 (=> (not res!581637) (not e!477360))))

(declare-datatypes ((V!26949 0))(
  ( (V!26950 (val!8261 Int)) )
))
(declare-datatypes ((ValueCell!7774 0))(
  ( (ValueCellFull!7774 (v!10686 V!26949)) (EmptyCell!7774) )
))
(declare-datatypes ((array!49048 0))(
  ( (array!49049 (arr!23555 (Array (_ BitVec 32) ValueCell!7774)) (size!23995 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49048)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!856365 (= res!581637 (and (= (size!23995 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23994 _keys!868) (size!23995 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856366 () Bool)

(declare-fun e!477359 () Bool)

(assert (=> b!856366 (= e!477359 (not true))))

(declare-fun v!557 () V!26949)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!385933 () array!49048)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26949)

(declare-fun zeroValue!654 () V!26949)

(declare-datatypes ((tuple2!10890 0))(
  ( (tuple2!10891 (_1!5456 (_ BitVec 64)) (_2!5456 V!26949)) )
))
(declare-datatypes ((List!16703 0))(
  ( (Nil!16700) (Cons!16699 (h!17830 tuple2!10890) (t!23344 List!16703)) )
))
(declare-datatypes ((ListLongMap!9659 0))(
  ( (ListLongMap!9660 (toList!4845 List!16703)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2826 (array!49046 array!49048 (_ BitVec 32) (_ BitVec 32) V!26949 V!26949 (_ BitVec 32) Int) ListLongMap!9659)

(declare-fun +!2202 (ListLongMap!9659 tuple2!10890) ListLongMap!9659)

(assert (=> b!856366 (= (getCurrentListMapNoExtraKeys!2826 _keys!868 lt!385933 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2202 (getCurrentListMapNoExtraKeys!2826 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10891 k!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29191 0))(
  ( (Unit!29192) )
))
(declare-fun lt!385930 () Unit!29191)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!423 (array!49046 array!49048 (_ BitVec 32) (_ BitVec 32) V!26949 V!26949 (_ BitVec 32) (_ BitVec 64) V!26949 (_ BitVec 32) Int) Unit!29191)

(assert (=> b!856366 (= lt!385930 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!423 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26240 () Bool)

(declare-fun mapRes!26240 () Bool)

(assert (=> mapIsEmpty!26240 mapRes!26240))

(declare-fun b!856367 () Bool)

(assert (=> b!856367 (= e!477360 e!477359)))

(declare-fun res!581638 () Bool)

(assert (=> b!856367 (=> (not res!581638) (not e!477359))))

(assert (=> b!856367 (= res!581638 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!385931 () ListLongMap!9659)

(assert (=> b!856367 (= lt!385931 (getCurrentListMapNoExtraKeys!2826 _keys!868 lt!385933 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!856367 (= lt!385933 (array!49049 (store (arr!23555 _values!688) i!612 (ValueCellFull!7774 v!557)) (size!23995 _values!688)))))

(declare-fun lt!385932 () ListLongMap!9659)

(assert (=> b!856367 (= lt!385932 (getCurrentListMapNoExtraKeys!2826 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!581643 () Bool)

(assert (=> start!73376 (=> (not res!581643) (not e!477360))))

(assert (=> start!73376 (= res!581643 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23994 _keys!868))))))

(assert (=> start!73376 e!477360))

(declare-fun tp_is_empty!16427 () Bool)

(assert (=> start!73376 tp_is_empty!16427))

(assert (=> start!73376 true))

(assert (=> start!73376 tp!50376))

(declare-fun array_inv!18658 (array!49046) Bool)

(assert (=> start!73376 (array_inv!18658 _keys!868)))

(declare-fun e!477364 () Bool)

(declare-fun array_inv!18659 (array!49048) Bool)

(assert (=> start!73376 (and (array_inv!18659 _values!688) e!477364)))

(declare-fun b!856368 () Bool)

(declare-fun e!477361 () Bool)

(assert (=> b!856368 (= e!477364 (and e!477361 mapRes!26240))))

(declare-fun condMapEmpty!26240 () Bool)

(declare-fun mapDefault!26240 () ValueCell!7774)

