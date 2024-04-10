; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74018 () Bool)

(assert start!74018)

(declare-fun b_free!14933 () Bool)

(declare-fun b_next!14933 () Bool)

(assert (=> start!74018 (= b_free!14933 (not b_next!14933))))

(declare-fun tp!52303 () Bool)

(declare-fun b_and!24685 () Bool)

(assert (=> start!74018 (= tp!52303 b_and!24685)))

(declare-fun b!870447 () Bool)

(declare-fun e!484694 () Bool)

(declare-fun e!484695 () Bool)

(assert (=> b!870447 (= e!484694 e!484695)))

(declare-fun res!591611 () Bool)

(assert (=> b!870447 (=> (not res!591611) (not e!484695))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!870447 (= res!591611 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27805 0))(
  ( (V!27806 (val!8582 Int)) )
))
(declare-datatypes ((ValueCell!8095 0))(
  ( (ValueCellFull!8095 (v!11007 V!27805)) (EmptyCell!8095) )
))
(declare-datatypes ((array!50284 0))(
  ( (array!50285 (arr!24173 (Array (_ BitVec 32) ValueCell!8095)) (size!24613 (_ BitVec 32))) )
))
(declare-fun lt!395137 () array!50284)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50286 0))(
  ( (array!50287 (arr!24174 (Array (_ BitVec 32) (_ BitVec 64))) (size!24614 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50286)

(declare-datatypes ((tuple2!11402 0))(
  ( (tuple2!11403 (_1!5712 (_ BitVec 64)) (_2!5712 V!27805)) )
))
(declare-datatypes ((List!17194 0))(
  ( (Nil!17191) (Cons!17190 (h!18321 tuple2!11402) (t!24231 List!17194)) )
))
(declare-datatypes ((ListLongMap!10171 0))(
  ( (ListLongMap!10172 (toList!5101 List!17194)) )
))
(declare-fun lt!395140 () ListLongMap!10171)

(declare-fun minValue!654 () V!27805)

(declare-fun zeroValue!654 () V!27805)

(declare-fun getCurrentListMapNoExtraKeys!3070 (array!50286 array!50284 (_ BitVec 32) (_ BitVec 32) V!27805 V!27805 (_ BitVec 32) Int) ListLongMap!10171)

(assert (=> b!870447 (= lt!395140 (getCurrentListMapNoExtraKeys!3070 _keys!868 lt!395137 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27805)

(declare-fun _values!688 () array!50284)

(assert (=> b!870447 (= lt!395137 (array!50285 (store (arr!24173 _values!688) i!612 (ValueCellFull!8095 v!557)) (size!24613 _values!688)))))

(declare-fun lt!395138 () ListLongMap!10171)

(assert (=> b!870447 (= lt!395138 (getCurrentListMapNoExtraKeys!3070 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870448 () Bool)

(declare-fun e!484699 () Bool)

(declare-fun tp_is_empty!17069 () Bool)

(assert (=> b!870448 (= e!484699 tp_is_empty!17069)))

(declare-fun mapIsEmpty!27203 () Bool)

(declare-fun mapRes!27203 () Bool)

(assert (=> mapIsEmpty!27203 mapRes!27203))

(declare-fun b!870449 () Bool)

(declare-fun res!591617 () Bool)

(assert (=> b!870449 (=> (not res!591617) (not e!484694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870449 (= res!591617 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27203 () Bool)

(declare-fun tp!52302 () Bool)

(declare-fun e!484698 () Bool)

(assert (=> mapNonEmpty!27203 (= mapRes!27203 (and tp!52302 e!484698))))

(declare-fun mapValue!27203 () ValueCell!8095)

(declare-fun mapKey!27203 () (_ BitVec 32))

(declare-fun mapRest!27203 () (Array (_ BitVec 32) ValueCell!8095))

(assert (=> mapNonEmpty!27203 (= (arr!24173 _values!688) (store mapRest!27203 mapKey!27203 mapValue!27203))))

(declare-fun b!870450 () Bool)

(declare-fun res!591609 () Bool)

(assert (=> b!870450 (=> (not res!591609) (not e!484694))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870450 (= res!591609 (validKeyInArray!0 k!854))))

(declare-fun res!591610 () Bool)

(assert (=> start!74018 (=> (not res!591610) (not e!484694))))

(assert (=> start!74018 (= res!591610 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24614 _keys!868))))))

(assert (=> start!74018 e!484694))

(assert (=> start!74018 tp_is_empty!17069))

(assert (=> start!74018 true))

(assert (=> start!74018 tp!52303))

(declare-fun array_inv!19088 (array!50286) Bool)

(assert (=> start!74018 (array_inv!19088 _keys!868)))

(declare-fun e!484696 () Bool)

(declare-fun array_inv!19089 (array!50284) Bool)

(assert (=> start!74018 (and (array_inv!19089 _values!688) e!484696)))

(declare-fun b!870451 () Bool)

(declare-fun res!591616 () Bool)

(assert (=> b!870451 (=> (not res!591616) (not e!484694))))

(assert (=> b!870451 (= res!591616 (and (= (select (arr!24174 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!870452 () Bool)

(assert (=> b!870452 (= e!484696 (and e!484699 mapRes!27203))))

(declare-fun condMapEmpty!27203 () Bool)

(declare-fun mapDefault!27203 () ValueCell!8095)

