; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74328 () Bool)

(assert start!74328)

(declare-fun b_free!15091 () Bool)

(declare-fun b_next!15091 () Bool)

(assert (=> start!74328 (= b_free!15091 (not b_next!15091))))

(declare-fun tp!52947 () Bool)

(declare-fun b_and!24867 () Bool)

(assert (=> start!74328 (= tp!52947 b_and!24867)))

(declare-fun b!874676 () Bool)

(declare-fun res!594421 () Bool)

(declare-fun e!486976 () Bool)

(assert (=> b!874676 (=> (not res!594421) (not e!486976))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874676 (= res!594421 (validMask!0 mask!1196))))

(declare-fun b!874677 () Bool)

(declare-fun res!594424 () Bool)

(assert (=> b!874677 (=> (not res!594424) (not e!486976))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!50798 0))(
  ( (array!50799 (arr!24427 (Array (_ BitVec 32) (_ BitVec 64))) (size!24867 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50798)

(declare-datatypes ((V!28161 0))(
  ( (V!28162 (val!8715 Int)) )
))
(declare-datatypes ((ValueCell!8228 0))(
  ( (ValueCellFull!8228 (v!11144 V!28161)) (EmptyCell!8228) )
))
(declare-datatypes ((array!50800 0))(
  ( (array!50801 (arr!24428 (Array (_ BitVec 32) ValueCell!8228)) (size!24868 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50800)

(assert (=> b!874677 (= res!594424 (and (= (size!24868 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24867 _keys!868) (size!24868 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27611 () Bool)

(declare-fun mapRes!27611 () Bool)

(declare-fun tp!52948 () Bool)

(declare-fun e!486979 () Bool)

(assert (=> mapNonEmpty!27611 (= mapRes!27611 (and tp!52948 e!486979))))

(declare-fun mapKey!27611 () (_ BitVec 32))

(declare-fun mapRest!27611 () (Array (_ BitVec 32) ValueCell!8228))

(declare-fun mapValue!27611 () ValueCell!8228)

(assert (=> mapNonEmpty!27611 (= (arr!24428 _values!688) (store mapRest!27611 mapKey!27611 mapValue!27611))))

(declare-fun b!874678 () Bool)

(declare-fun e!486980 () Bool)

(declare-fun tp_is_empty!17335 () Bool)

(assert (=> b!874678 (= e!486980 tp_is_empty!17335)))

(declare-fun b!874679 () Bool)

(declare-fun res!594419 () Bool)

(assert (=> b!874679 (=> (not res!594419) (not e!486976))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874679 (= res!594419 (validKeyInArray!0 k!854))))

(declare-fun res!594423 () Bool)

(assert (=> start!74328 (=> (not res!594423) (not e!486976))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74328 (= res!594423 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24867 _keys!868))))))

(assert (=> start!74328 e!486976))

(assert (=> start!74328 tp_is_empty!17335))

(assert (=> start!74328 true))

(assert (=> start!74328 tp!52947))

(declare-fun array_inv!19262 (array!50798) Bool)

(assert (=> start!74328 (array_inv!19262 _keys!868)))

(declare-fun e!486978 () Bool)

(declare-fun array_inv!19263 (array!50800) Bool)

(assert (=> start!74328 (and (array_inv!19263 _values!688) e!486978)))

(declare-fun b!874680 () Bool)

(assert (=> b!874680 (= e!486976 false)))

(declare-datatypes ((tuple2!11516 0))(
  ( (tuple2!11517 (_1!5769 (_ BitVec 64)) (_2!5769 V!28161)) )
))
(declare-datatypes ((List!17339 0))(
  ( (Nil!17336) (Cons!17335 (h!18466 tuple2!11516) (t!24380 List!17339)) )
))
(declare-datatypes ((ListLongMap!10285 0))(
  ( (ListLongMap!10286 (toList!5158 List!17339)) )
))
(declare-fun lt!395986 () ListLongMap!10285)

(declare-fun v!557 () V!28161)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28161)

(declare-fun zeroValue!654 () V!28161)

(declare-fun getCurrentListMapNoExtraKeys!3125 (array!50798 array!50800 (_ BitVec 32) (_ BitVec 32) V!28161 V!28161 (_ BitVec 32) Int) ListLongMap!10285)

(assert (=> b!874680 (= lt!395986 (getCurrentListMapNoExtraKeys!3125 _keys!868 (array!50801 (store (arr!24428 _values!688) i!612 (ValueCellFull!8228 v!557)) (size!24868 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395987 () ListLongMap!10285)

(assert (=> b!874680 (= lt!395987 (getCurrentListMapNoExtraKeys!3125 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27611 () Bool)

(assert (=> mapIsEmpty!27611 mapRes!27611))

(declare-fun b!874681 () Bool)

(assert (=> b!874681 (= e!486978 (and e!486980 mapRes!27611))))

(declare-fun condMapEmpty!27611 () Bool)

(declare-fun mapDefault!27611 () ValueCell!8228)

