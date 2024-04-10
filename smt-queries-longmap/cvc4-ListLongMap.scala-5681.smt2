; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73874 () Bool)

(assert start!73874)

(declare-fun b_free!14789 () Bool)

(declare-fun b_next!14789 () Bool)

(assert (=> start!73874 (= b_free!14789 (not b_next!14789))))

(declare-fun tp!51871 () Bool)

(declare-fun b_and!24541 () Bool)

(assert (=> start!73874 (= tp!51871 b_and!24541)))

(declare-fun b!867855 () Bool)

(declare-fun res!589673 () Bool)

(declare-fun e!483402 () Bool)

(assert (=> b!867855 (=> (not res!589673) (not e!483402))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!50010 0))(
  ( (array!50011 (arr!24036 (Array (_ BitVec 32) (_ BitVec 64))) (size!24476 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50010)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!867855 (= res!589673 (and (= (select (arr!24036 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26987 () Bool)

(declare-fun mapRes!26987 () Bool)

(assert (=> mapIsEmpty!26987 mapRes!26987))

(declare-fun b!867856 () Bool)

(declare-fun res!589665 () Bool)

(assert (=> b!867856 (=> (not res!589665) (not e!483402))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27613 0))(
  ( (V!27614 (val!8510 Int)) )
))
(declare-datatypes ((ValueCell!8023 0))(
  ( (ValueCellFull!8023 (v!10935 V!27613)) (EmptyCell!8023) )
))
(declare-datatypes ((array!50012 0))(
  ( (array!50013 (arr!24037 (Array (_ BitVec 32) ValueCell!8023)) (size!24477 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50012)

(assert (=> b!867856 (= res!589665 (and (= (size!24477 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24476 _keys!868) (size!24477 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!589672 () Bool)

(assert (=> start!73874 (=> (not res!589672) (not e!483402))))

(assert (=> start!73874 (= res!589672 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24476 _keys!868))))))

(assert (=> start!73874 e!483402))

(declare-fun tp_is_empty!16925 () Bool)

(assert (=> start!73874 tp_is_empty!16925))

(assert (=> start!73874 true))

(assert (=> start!73874 tp!51871))

(declare-fun array_inv!18992 (array!50010) Bool)

(assert (=> start!73874 (array_inv!18992 _keys!868)))

(declare-fun e!483401 () Bool)

(declare-fun array_inv!18993 (array!50012) Bool)

(assert (=> start!73874 (and (array_inv!18993 _values!688) e!483401)))

(declare-fun b!867857 () Bool)

(declare-fun res!589668 () Bool)

(assert (=> b!867857 (=> (not res!589668) (not e!483402))))

(assert (=> b!867857 (= res!589668 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24476 _keys!868))))))

(declare-fun b!867858 () Bool)

(declare-fun res!589670 () Bool)

(assert (=> b!867858 (=> (not res!589670) (not e!483402))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867858 (= res!589670 (validKeyInArray!0 k!854))))

(declare-fun b!867859 () Bool)

(declare-fun e!483400 () Bool)

(assert (=> b!867859 (= e!483400 tp_is_empty!16925)))

(declare-fun b!867860 () Bool)

(declare-fun res!589666 () Bool)

(assert (=> b!867860 (=> (not res!589666) (not e!483402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867860 (= res!589666 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26987 () Bool)

(declare-fun tp!51870 () Bool)

(assert (=> mapNonEmpty!26987 (= mapRes!26987 (and tp!51870 e!483400))))

(declare-fun mapKey!26987 () (_ BitVec 32))

(declare-fun mapRest!26987 () (Array (_ BitVec 32) ValueCell!8023))

(declare-fun mapValue!26987 () ValueCell!8023)

(assert (=> mapNonEmpty!26987 (= (arr!24037 _values!688) (store mapRest!26987 mapKey!26987 mapValue!26987))))

(declare-fun b!867861 () Bool)

(declare-fun e!483403 () Bool)

(assert (=> b!867861 (= e!483402 e!483403)))

(declare-fun res!589667 () Bool)

(assert (=> b!867861 (=> (not res!589667) (not e!483403))))

(assert (=> b!867861 (= res!589667 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27613)

(declare-fun zeroValue!654 () V!27613)

(declare-datatypes ((tuple2!11292 0))(
  ( (tuple2!11293 (_1!5657 (_ BitVec 64)) (_2!5657 V!27613)) )
))
(declare-datatypes ((List!17092 0))(
  ( (Nil!17089) (Cons!17088 (h!18219 tuple2!11292) (t!24129 List!17092)) )
))
(declare-datatypes ((ListLongMap!10061 0))(
  ( (ListLongMap!10062 (toList!5046 List!17092)) )
))
(declare-fun lt!394275 () ListLongMap!10061)

(declare-fun lt!394276 () array!50012)

(declare-fun getCurrentListMapNoExtraKeys!3015 (array!50010 array!50012 (_ BitVec 32) (_ BitVec 32) V!27613 V!27613 (_ BitVec 32) Int) ListLongMap!10061)

(assert (=> b!867861 (= lt!394275 (getCurrentListMapNoExtraKeys!3015 _keys!868 lt!394276 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27613)

(assert (=> b!867861 (= lt!394276 (array!50013 (store (arr!24037 _values!688) i!612 (ValueCellFull!8023 v!557)) (size!24477 _values!688)))))

(declare-fun lt!394273 () ListLongMap!10061)

(assert (=> b!867861 (= lt!394273 (getCurrentListMapNoExtraKeys!3015 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867862 () Bool)

(declare-fun e!483398 () Bool)

(assert (=> b!867862 (= e!483401 (and e!483398 mapRes!26987))))

(declare-fun condMapEmpty!26987 () Bool)

(declare-fun mapDefault!26987 () ValueCell!8023)

