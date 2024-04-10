; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73468 () Bool)

(assert start!73468)

(declare-fun b_free!14383 () Bool)

(declare-fun b_next!14383 () Bool)

(assert (=> start!73468 (= b_free!14383 (not b_next!14383))))

(declare-fun tp!50652 () Bool)

(declare-fun b_and!23745 () Bool)

(assert (=> start!73468 (= tp!50652 b_and!23745)))

(declare-fun b!858044 () Bool)

(declare-fun e!478210 () Bool)

(declare-fun e!478211 () Bool)

(assert (=> b!858044 (= e!478210 e!478211)))

(declare-fun res!582907 () Bool)

(assert (=> b!858044 (=> (not res!582907) (not e!478211))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!858044 (= res!582907 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27073 0))(
  ( (V!27074 (val!8307 Int)) )
))
(declare-datatypes ((ValueCell!7820 0))(
  ( (ValueCellFull!7820 (v!10732 V!27073)) (EmptyCell!7820) )
))
(declare-datatypes ((array!49226 0))(
  ( (array!49227 (arr!23644 (Array (_ BitVec 32) ValueCell!7820)) (size!24084 (_ BitVec 32))) )
))
(declare-fun lt!386516 () array!49226)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49228 0))(
  ( (array!49229 (arr!23645 (Array (_ BitVec 32) (_ BitVec 64))) (size!24085 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49228)

(declare-fun minValue!654 () V!27073)

(declare-fun zeroValue!654 () V!27073)

(declare-datatypes ((tuple2!10964 0))(
  ( (tuple2!10965 (_1!5493 (_ BitVec 64)) (_2!5493 V!27073)) )
))
(declare-datatypes ((List!16771 0))(
  ( (Nil!16768) (Cons!16767 (h!17898 tuple2!10964) (t!23420 List!16771)) )
))
(declare-datatypes ((ListLongMap!9733 0))(
  ( (ListLongMap!9734 (toList!4882 List!16771)) )
))
(declare-fun lt!386520 () ListLongMap!9733)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2863 (array!49228 array!49226 (_ BitVec 32) (_ BitVec 32) V!27073 V!27073 (_ BitVec 32) Int) ListLongMap!9733)

(assert (=> b!858044 (= lt!386520 (getCurrentListMapNoExtraKeys!2863 _keys!868 lt!386516 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27073)

(declare-fun _values!688 () array!49226)

(assert (=> b!858044 (= lt!386516 (array!49227 (store (arr!23644 _values!688) i!612 (ValueCellFull!7820 v!557)) (size!24084 _values!688)))))

(declare-fun lt!386519 () ListLongMap!9733)

(assert (=> b!858044 (= lt!386519 (getCurrentListMapNoExtraKeys!2863 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!858045 () Bool)

(declare-fun res!582904 () Bool)

(assert (=> b!858045 (=> (not res!582904) (not e!478210))))

(assert (=> b!858045 (= res!582904 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24085 _keys!868))))))

(declare-fun b!858047 () Bool)

(declare-fun e!478208 () Bool)

(declare-fun tp_is_empty!16519 () Bool)

(assert (=> b!858047 (= e!478208 tp_is_empty!16519)))

(declare-fun b!858048 () Bool)

(declare-fun e!478207 () Bool)

(assert (=> b!858048 (= e!478207 tp_is_empty!16519)))

(declare-fun b!858049 () Bool)

(declare-fun e!478209 () Bool)

(assert (=> b!858049 (= e!478211 (not e!478209))))

(declare-fun res!582903 () Bool)

(assert (=> b!858049 (=> res!582903 e!478209)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858049 (= res!582903 (not (validKeyInArray!0 (select (arr!23645 _keys!868) from!1053))))))

(declare-fun lt!386515 () ListLongMap!9733)

(declare-fun lt!386517 () ListLongMap!9733)

(assert (=> b!858049 (= lt!386515 lt!386517)))

(declare-fun lt!386518 () ListLongMap!9733)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2235 (ListLongMap!9733 tuple2!10964) ListLongMap!9733)

(assert (=> b!858049 (= lt!386517 (+!2235 lt!386518 (tuple2!10965 k!854 v!557)))))

(assert (=> b!858049 (= lt!386515 (getCurrentListMapNoExtraKeys!2863 _keys!868 lt!386516 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!858049 (= lt!386518 (getCurrentListMapNoExtraKeys!2863 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29257 0))(
  ( (Unit!29258) )
))
(declare-fun lt!386521 () Unit!29257)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!456 (array!49228 array!49226 (_ BitVec 32) (_ BitVec 32) V!27073 V!27073 (_ BitVec 32) (_ BitVec 64) V!27073 (_ BitVec 32) Int) Unit!29257)

(assert (=> b!858049 (= lt!386521 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!456 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!858050 () Bool)

(declare-fun res!582905 () Bool)

(assert (=> b!858050 (=> (not res!582905) (not e!478210))))

(declare-datatypes ((List!16772 0))(
  ( (Nil!16769) (Cons!16768 (h!17899 (_ BitVec 64)) (t!23421 List!16772)) )
))
(declare-fun arrayNoDuplicates!0 (array!49228 (_ BitVec 32) List!16772) Bool)

(assert (=> b!858050 (= res!582905 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16769))))

(declare-fun mapIsEmpty!26378 () Bool)

(declare-fun mapRes!26378 () Bool)

(assert (=> mapIsEmpty!26378 mapRes!26378))

(declare-fun b!858051 () Bool)

(declare-fun res!582906 () Bool)

(assert (=> b!858051 (=> (not res!582906) (not e!478210))))

(assert (=> b!858051 (= res!582906 (and (= (select (arr!23645 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!858052 () Bool)

(declare-fun res!582908 () Bool)

(assert (=> b!858052 (=> (not res!582908) (not e!478210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49228 (_ BitVec 32)) Bool)

(assert (=> b!858052 (= res!582908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858053 () Bool)

(declare-fun e!478212 () Bool)

(assert (=> b!858053 (= e!478212 (and e!478208 mapRes!26378))))

(declare-fun condMapEmpty!26378 () Bool)

(declare-fun mapDefault!26378 () ValueCell!7820)

