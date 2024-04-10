; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74546 () Bool)

(assert start!74546)

(declare-fun b_free!15235 () Bool)

(declare-fun b_next!15235 () Bool)

(assert (=> start!74546 (= b_free!15235 (not b_next!15235))))

(declare-fun tp!53387 () Bool)

(declare-fun b_and!25111 () Bool)

(assert (=> start!74546 (= tp!53387 b_and!25111)))

(declare-fun res!596624 () Bool)

(declare-fun e!488798 () Bool)

(assert (=> start!74546 (=> (not res!596624) (not e!488798))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51084 0))(
  ( (array!51085 (arr!24568 (Array (_ BitVec 32) (_ BitVec 64))) (size!25008 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51084)

(assert (=> start!74546 (= res!596624 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25008 _keys!868))))))

(assert (=> start!74546 e!488798))

(declare-fun tp_is_empty!17479 () Bool)

(assert (=> start!74546 tp_is_empty!17479))

(assert (=> start!74546 true))

(assert (=> start!74546 tp!53387))

(declare-fun array_inv!19364 (array!51084) Bool)

(assert (=> start!74546 (array_inv!19364 _keys!868)))

(declare-datatypes ((V!28353 0))(
  ( (V!28354 (val!8787 Int)) )
))
(declare-datatypes ((ValueCell!8300 0))(
  ( (ValueCellFull!8300 (v!11227 V!28353)) (EmptyCell!8300) )
))
(declare-datatypes ((array!51086 0))(
  ( (array!51087 (arr!24569 (Array (_ BitVec 32) ValueCell!8300)) (size!25009 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51086)

(declare-fun e!488797 () Bool)

(declare-fun array_inv!19365 (array!51086) Bool)

(assert (=> start!74546 (and (array_inv!19365 _values!688) e!488797)))

(declare-fun b!878213 () Bool)

(declare-fun res!596617 () Bool)

(assert (=> b!878213 (=> (not res!596617) (not e!488798))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878213 (= res!596617 (validKeyInArray!0 k!854))))

(declare-fun b!878214 () Bool)

(declare-fun res!596618 () Bool)

(assert (=> b!878214 (=> (not res!596618) (not e!488798))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!878214 (= res!596618 (and (= (size!25009 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25008 _keys!868) (size!25009 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878215 () Bool)

(declare-fun res!596621 () Bool)

(assert (=> b!878215 (=> (not res!596621) (not e!488798))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!878215 (= res!596621 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25008 _keys!868))))))

(declare-fun b!878216 () Bool)

(declare-fun res!596622 () Bool)

(assert (=> b!878216 (=> (not res!596622) (not e!488798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51084 (_ BitVec 32)) Bool)

(assert (=> b!878216 (= res!596622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878217 () Bool)

(assert (=> b!878217 (= e!488798 false)))

(declare-datatypes ((tuple2!11618 0))(
  ( (tuple2!11619 (_1!5820 (_ BitVec 64)) (_2!5820 V!28353)) )
))
(declare-datatypes ((List!17434 0))(
  ( (Nil!17431) (Cons!17430 (h!18561 tuple2!11618) (t!24523 List!17434)) )
))
(declare-datatypes ((ListLongMap!10387 0))(
  ( (ListLongMap!10388 (toList!5209 List!17434)) )
))
(declare-fun lt!397214 () ListLongMap!10387)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28353)

(declare-fun zeroValue!654 () V!28353)

(declare-fun v!557 () V!28353)

(declare-fun getCurrentListMapNoExtraKeys!3176 (array!51084 array!51086 (_ BitVec 32) (_ BitVec 32) V!28353 V!28353 (_ BitVec 32) Int) ListLongMap!10387)

(assert (=> b!878217 (= lt!397214 (getCurrentListMapNoExtraKeys!3176 _keys!868 (array!51087 (store (arr!24569 _values!688) i!612 (ValueCellFull!8300 v!557)) (size!25009 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397215 () ListLongMap!10387)

(assert (=> b!878217 (= lt!397215 (getCurrentListMapNoExtraKeys!3176 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!878218 () Bool)

(declare-fun res!596619 () Bool)

(assert (=> b!878218 (=> (not res!596619) (not e!488798))))

(assert (=> b!878218 (= res!596619 (and (= (select (arr!24568 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!878219 () Bool)

(declare-fun e!488800 () Bool)

(declare-fun mapRes!27834 () Bool)

(assert (=> b!878219 (= e!488797 (and e!488800 mapRes!27834))))

(declare-fun condMapEmpty!27834 () Bool)

(declare-fun mapDefault!27834 () ValueCell!8300)

