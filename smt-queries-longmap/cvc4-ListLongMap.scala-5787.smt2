; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74668 () Bool)

(assert start!74668)

(declare-fun b_free!15317 () Bool)

(declare-fun b_next!15317 () Bool)

(assert (=> start!74668 (= b_free!15317 (not b_next!15317))))

(declare-fun tp!53638 () Bool)

(declare-fun b_and!25253 () Bool)

(assert (=> start!74668 (= tp!53638 b_and!25253)))

(declare-fun b!880005 () Bool)

(declare-fun e!489731 () Bool)

(declare-fun e!489728 () Bool)

(assert (=> b!880005 (= e!489731 e!489728)))

(declare-fun res!597859 () Bool)

(assert (=> b!880005 (=> (not res!597859) (not e!489728))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!880005 (= res!597859 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!28461 0))(
  ( (V!28462 (val!8828 Int)) )
))
(declare-datatypes ((ValueCell!8341 0))(
  ( (ValueCellFull!8341 (v!11276 V!28461)) (EmptyCell!8341) )
))
(declare-datatypes ((array!51252 0))(
  ( (array!51253 (arr!24650 (Array (_ BitVec 32) ValueCell!8341)) (size!25090 (_ BitVec 32))) )
))
(declare-fun lt!397898 () array!51252)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11680 0))(
  ( (tuple2!11681 (_1!5851 (_ BitVec 64)) (_2!5851 V!28461)) )
))
(declare-datatypes ((List!17495 0))(
  ( (Nil!17492) (Cons!17491 (h!18622 tuple2!11680) (t!24614 List!17495)) )
))
(declare-datatypes ((ListLongMap!10449 0))(
  ( (ListLongMap!10450 (toList!5240 List!17495)) )
))
(declare-fun lt!397897 () ListLongMap!10449)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51254 0))(
  ( (array!51255 (arr!24651 (Array (_ BitVec 32) (_ BitVec 64))) (size!25091 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51254)

(declare-fun minValue!654 () V!28461)

(declare-fun zeroValue!654 () V!28461)

(declare-fun getCurrentListMapNoExtraKeys!3205 (array!51254 array!51252 (_ BitVec 32) (_ BitVec 32) V!28461 V!28461 (_ BitVec 32) Int) ListLongMap!10449)

(assert (=> b!880005 (= lt!397897 (getCurrentListMapNoExtraKeys!3205 _keys!868 lt!397898 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28461)

(declare-fun _values!688 () array!51252)

(assert (=> b!880005 (= lt!397898 (array!51253 (store (arr!24650 _values!688) i!612 (ValueCellFull!8341 v!557)) (size!25090 _values!688)))))

(declare-fun lt!397895 () ListLongMap!10449)

(assert (=> b!880005 (= lt!397895 (getCurrentListMapNoExtraKeys!3205 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!880006 () Bool)

(declare-fun e!489732 () Bool)

(declare-fun e!489726 () Bool)

(declare-fun mapRes!27963 () Bool)

(assert (=> b!880006 (= e!489732 (and e!489726 mapRes!27963))))

(declare-fun condMapEmpty!27963 () Bool)

(declare-fun mapDefault!27963 () ValueCell!8341)

