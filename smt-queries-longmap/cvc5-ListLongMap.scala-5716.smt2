; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74080 () Bool)

(assert start!74080)

(declare-fun b_free!14989 () Bool)

(declare-fun b_next!14989 () Bool)

(assert (=> start!74080 (= b_free!14989 (not b_next!14989))))

(declare-fun tp!52480 () Bool)

(declare-fun b_and!24741 () Bool)

(assert (=> start!74080 (= tp!52480 b_and!24741)))

(declare-fun mapIsEmpty!27296 () Bool)

(declare-fun mapRes!27296 () Bool)

(assert (=> mapIsEmpty!27296 mapRes!27296))

(declare-fun b!871522 () Bool)

(declare-fun res!592402 () Bool)

(declare-fun e!485249 () Bool)

(assert (=> b!871522 (=> (not res!592402) (not e!485249))))

(declare-datatypes ((array!50400 0))(
  ( (array!50401 (arr!24231 (Array (_ BitVec 32) (_ BitVec 64))) (size!24671 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50400)

(declare-datatypes ((List!17230 0))(
  ( (Nil!17227) (Cons!17226 (h!18357 (_ BitVec 64)) (t!24267 List!17230)) )
))
(declare-fun arrayNoDuplicates!0 (array!50400 (_ BitVec 32) List!17230) Bool)

(assert (=> b!871522 (= res!592402 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17227))))

(declare-fun b!871523 () Bool)

(declare-fun e!485248 () Bool)

(declare-fun tp_is_empty!17131 () Bool)

(assert (=> b!871523 (= e!485248 tp_is_empty!17131)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27889 0))(
  ( (V!27890 (val!8613 Int)) )
))
(declare-datatypes ((tuple2!11442 0))(
  ( (tuple2!11443 (_1!5732 (_ BitVec 64)) (_2!5732 V!27889)) )
))
(declare-datatypes ((List!17231 0))(
  ( (Nil!17228) (Cons!17227 (h!18358 tuple2!11442) (t!24268 List!17231)) )
))
(declare-datatypes ((ListLongMap!10211 0))(
  ( (ListLongMap!10212 (toList!5121 List!17231)) )
))
(declare-fun call!38447 () ListLongMap!10211)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8126 0))(
  ( (ValueCellFull!8126 (v!11038 V!27889)) (EmptyCell!8126) )
))
(declare-datatypes ((array!50402 0))(
  ( (array!50403 (arr!24232 (Array (_ BitVec 32) ValueCell!8126)) (size!24672 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50402)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27889)

(declare-fun zeroValue!654 () V!27889)

(declare-fun bm!38443 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3090 (array!50400 array!50402 (_ BitVec 32) (_ BitVec 32) V!27889 V!27889 (_ BitVec 32) Int) ListLongMap!10211)

(assert (=> bm!38443 (= call!38447 (getCurrentListMapNoExtraKeys!3090 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!871524 () Bool)

(declare-fun res!592403 () Bool)

(assert (=> b!871524 (=> (not res!592403) (not e!485249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50400 (_ BitVec 32)) Bool)

(assert (=> b!871524 (= res!592403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27296 () Bool)

(declare-fun tp!52479 () Bool)

(assert (=> mapNonEmpty!27296 (= mapRes!27296 (and tp!52479 e!485248))))

(declare-fun mapKey!27296 () (_ BitVec 32))

(declare-fun mapRest!27296 () (Array (_ BitVec 32) ValueCell!8126))

(declare-fun mapValue!27296 () ValueCell!8126)

(assert (=> mapNonEmpty!27296 (= (arr!24232 _values!688) (store mapRest!27296 mapKey!27296 mapValue!27296))))

(declare-fun b!871525 () Bool)

(declare-fun res!592401 () Bool)

(assert (=> b!871525 (=> (not res!592401) (not e!485249))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!871525 (= res!592401 (and (= (select (arr!24231 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun res!592405 () Bool)

(assert (=> start!74080 (=> (not res!592405) (not e!485249))))

(assert (=> start!74080 (= res!592405 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24671 _keys!868))))))

(assert (=> start!74080 e!485249))

(assert (=> start!74080 tp_is_empty!17131))

(assert (=> start!74080 true))

(assert (=> start!74080 tp!52480))

(declare-fun array_inv!19134 (array!50400) Bool)

(assert (=> start!74080 (array_inv!19134 _keys!868)))

(declare-fun e!485251 () Bool)

(declare-fun array_inv!19135 (array!50402) Bool)

(assert (=> start!74080 (and (array_inv!19135 _values!688) e!485251)))

(declare-fun b!871526 () Bool)

(declare-fun e!485246 () Bool)

(assert (=> b!871526 (= e!485246 tp_is_empty!17131)))

(declare-fun b!871527 () Bool)

(declare-fun res!592407 () Bool)

(assert (=> b!871527 (=> (not res!592407) (not e!485249))))

(assert (=> b!871527 (= res!592407 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24671 _keys!868))))))

(declare-fun b!871528 () Bool)

(assert (=> b!871528 (= e!485251 (and e!485246 mapRes!27296))))

(declare-fun condMapEmpty!27296 () Bool)

(declare-fun mapDefault!27296 () ValueCell!8126)

