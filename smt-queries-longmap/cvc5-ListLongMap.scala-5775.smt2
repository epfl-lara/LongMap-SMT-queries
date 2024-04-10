; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74552 () Bool)

(assert start!74552)

(declare-fun b_free!15241 () Bool)

(declare-fun b_next!15241 () Bool)

(assert (=> start!74552 (= b_free!15241 (not b_next!15241))))

(declare-fun tp!53405 () Bool)

(declare-fun b_and!25117 () Bool)

(assert (=> start!74552 (= tp!53405 b_and!25117)))

(declare-fun b!878312 () Bool)

(declare-fun res!596693 () Bool)

(declare-fun e!488843 () Bool)

(assert (=> b!878312 (=> (not res!596693) (not e!488843))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878312 (= res!596693 (validKeyInArray!0 k!854))))

(declare-fun res!596690 () Bool)

(assert (=> start!74552 (=> (not res!596690) (not e!488843))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51096 0))(
  ( (array!51097 (arr!24574 (Array (_ BitVec 32) (_ BitVec 64))) (size!25014 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51096)

(assert (=> start!74552 (= res!596690 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25014 _keys!868))))))

(assert (=> start!74552 e!488843))

(declare-fun tp_is_empty!17485 () Bool)

(assert (=> start!74552 tp_is_empty!17485))

(assert (=> start!74552 true))

(assert (=> start!74552 tp!53405))

(declare-fun array_inv!19370 (array!51096) Bool)

(assert (=> start!74552 (array_inv!19370 _keys!868)))

(declare-datatypes ((V!28361 0))(
  ( (V!28362 (val!8790 Int)) )
))
(declare-datatypes ((ValueCell!8303 0))(
  ( (ValueCellFull!8303 (v!11230 V!28361)) (EmptyCell!8303) )
))
(declare-datatypes ((array!51098 0))(
  ( (array!51099 (arr!24575 (Array (_ BitVec 32) ValueCell!8303)) (size!25015 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51098)

(declare-fun e!488845 () Bool)

(declare-fun array_inv!19371 (array!51098) Bool)

(assert (=> start!74552 (and (array_inv!19371 _values!688) e!488845)))

(declare-fun b!878313 () Bool)

(assert (=> b!878313 (= e!488843 false)))

(declare-fun v!557 () V!28361)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28361)

(declare-fun zeroValue!654 () V!28361)

(declare-datatypes ((tuple2!11624 0))(
  ( (tuple2!11625 (_1!5823 (_ BitVec 64)) (_2!5823 V!28361)) )
))
(declare-datatypes ((List!17439 0))(
  ( (Nil!17436) (Cons!17435 (h!18566 tuple2!11624) (t!24528 List!17439)) )
))
(declare-datatypes ((ListLongMap!10393 0))(
  ( (ListLongMap!10394 (toList!5212 List!17439)) )
))
(declare-fun lt!397232 () ListLongMap!10393)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3179 (array!51096 array!51098 (_ BitVec 32) (_ BitVec 32) V!28361 V!28361 (_ BitVec 32) Int) ListLongMap!10393)

(assert (=> b!878313 (= lt!397232 (getCurrentListMapNoExtraKeys!3179 _keys!868 (array!51099 (store (arr!24575 _values!688) i!612 (ValueCellFull!8303 v!557)) (size!25015 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397233 () ListLongMap!10393)

(assert (=> b!878313 (= lt!397233 (getCurrentListMapNoExtraKeys!3179 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!878314 () Bool)

(declare-fun res!596696 () Bool)

(assert (=> b!878314 (=> (not res!596696) (not e!488843))))

(declare-datatypes ((List!17440 0))(
  ( (Nil!17437) (Cons!17436 (h!18567 (_ BitVec 64)) (t!24529 List!17440)) )
))
(declare-fun arrayNoDuplicates!0 (array!51096 (_ BitVec 32) List!17440) Bool)

(assert (=> b!878314 (= res!596696 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17437))))

(declare-fun b!878315 () Bool)

(declare-fun res!596689 () Bool)

(assert (=> b!878315 (=> (not res!596689) (not e!488843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51096 (_ BitVec 32)) Bool)

(assert (=> b!878315 (= res!596689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878316 () Bool)

(declare-fun e!488841 () Bool)

(assert (=> b!878316 (= e!488841 tp_is_empty!17485)))

(declare-fun mapIsEmpty!27843 () Bool)

(declare-fun mapRes!27843 () Bool)

(assert (=> mapIsEmpty!27843 mapRes!27843))

(declare-fun b!878317 () Bool)

(declare-fun e!488844 () Bool)

(assert (=> b!878317 (= e!488844 tp_is_empty!17485)))

(declare-fun b!878318 () Bool)

(declare-fun res!596691 () Bool)

(assert (=> b!878318 (=> (not res!596691) (not e!488843))))

(assert (=> b!878318 (= res!596691 (and (= (select (arr!24574 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!878319 () Bool)

(assert (=> b!878319 (= e!488845 (and e!488844 mapRes!27843))))

(declare-fun condMapEmpty!27843 () Bool)

(declare-fun mapDefault!27843 () ValueCell!8303)

