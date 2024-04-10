; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73870 () Bool)

(assert start!73870)

(declare-fun b_free!14785 () Bool)

(declare-fun b_next!14785 () Bool)

(assert (=> start!73870 (= b_free!14785 (not b_next!14785))))

(declare-fun tp!51859 () Bool)

(declare-fun b_and!24537 () Bool)

(assert (=> start!73870 (= tp!51859 b_and!24537)))

(declare-fun b!867783 () Bool)

(declare-fun res!589613 () Bool)

(declare-fun e!483363 () Bool)

(assert (=> b!867783 (=> (not res!589613) (not e!483363))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867783 (= res!589613 (validMask!0 mask!1196))))

(declare-fun b!867784 () Bool)

(declare-fun res!589615 () Bool)

(assert (=> b!867784 (=> (not res!589615) (not e!483363))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!50002 0))(
  ( (array!50003 (arr!24032 (Array (_ BitVec 32) (_ BitVec 64))) (size!24472 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50002)

(declare-datatypes ((V!27609 0))(
  ( (V!27610 (val!8508 Int)) )
))
(declare-datatypes ((ValueCell!8021 0))(
  ( (ValueCellFull!8021 (v!10933 V!27609)) (EmptyCell!8021) )
))
(declare-datatypes ((array!50004 0))(
  ( (array!50005 (arr!24033 (Array (_ BitVec 32) ValueCell!8021)) (size!24473 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50004)

(assert (=> b!867784 (= res!589615 (and (= (size!24473 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24472 _keys!868) (size!24473 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!867785 () Bool)

(declare-fun res!589617 () Bool)

(assert (=> b!867785 (=> (not res!589617) (not e!483363))))

(declare-datatypes ((List!17088 0))(
  ( (Nil!17085) (Cons!17084 (h!18215 (_ BitVec 64)) (t!24125 List!17088)) )
))
(declare-fun arrayNoDuplicates!0 (array!50002 (_ BitVec 32) List!17088) Bool)

(assert (=> b!867785 (= res!589617 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17085))))

(declare-fun b!867786 () Bool)

(declare-fun e!483367 () Bool)

(declare-fun tp_is_empty!16921 () Bool)

(assert (=> b!867786 (= e!483367 tp_is_empty!16921)))

(declare-fun b!867787 () Bool)

(declare-fun e!483362 () Bool)

(assert (=> b!867787 (= e!483362 tp_is_empty!16921)))

(declare-fun mapNonEmpty!26981 () Bool)

(declare-fun mapRes!26981 () Bool)

(declare-fun tp!51858 () Bool)

(assert (=> mapNonEmpty!26981 (= mapRes!26981 (and tp!51858 e!483362))))

(declare-fun mapRest!26981 () (Array (_ BitVec 32) ValueCell!8021))

(declare-fun mapKey!26981 () (_ BitVec 32))

(declare-fun mapValue!26981 () ValueCell!8021)

(assert (=> mapNonEmpty!26981 (= (arr!24033 _values!688) (store mapRest!26981 mapKey!26981 mapValue!26981))))

(declare-fun b!867788 () Bool)

(declare-fun res!589616 () Bool)

(assert (=> b!867788 (=> (not res!589616) (not e!483363))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867788 (= res!589616 (validKeyInArray!0 k!854))))

(declare-fun mapIsEmpty!26981 () Bool)

(assert (=> mapIsEmpty!26981 mapRes!26981))

(declare-fun res!589612 () Bool)

(assert (=> start!73870 (=> (not res!589612) (not e!483363))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73870 (= res!589612 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24472 _keys!868))))))

(assert (=> start!73870 e!483363))

(assert (=> start!73870 tp_is_empty!16921))

(assert (=> start!73870 true))

(assert (=> start!73870 tp!51859))

(declare-fun array_inv!18988 (array!50002) Bool)

(assert (=> start!73870 (array_inv!18988 _keys!868)))

(declare-fun e!483364 () Bool)

(declare-fun array_inv!18989 (array!50004) Bool)

(assert (=> start!73870 (and (array_inv!18989 _values!688) e!483364)))

(declare-fun b!867789 () Bool)

(declare-fun e!483366 () Bool)

(assert (=> b!867789 (= e!483366 (not true))))

(declare-fun v!557 () V!27609)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27609)

(declare-fun zeroValue!654 () V!27609)

(declare-fun lt!394249 () array!50004)

(declare-datatypes ((tuple2!11288 0))(
  ( (tuple2!11289 (_1!5655 (_ BitVec 64)) (_2!5655 V!27609)) )
))
(declare-datatypes ((List!17089 0))(
  ( (Nil!17086) (Cons!17085 (h!18216 tuple2!11288) (t!24126 List!17089)) )
))
(declare-datatypes ((ListLongMap!10057 0))(
  ( (ListLongMap!10058 (toList!5044 List!17089)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3013 (array!50002 array!50004 (_ BitVec 32) (_ BitVec 32) V!27609 V!27609 (_ BitVec 32) Int) ListLongMap!10057)

(declare-fun +!2389 (ListLongMap!10057 tuple2!11288) ListLongMap!10057)

(assert (=> b!867789 (= (getCurrentListMapNoExtraKeys!3013 _keys!868 lt!394249 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2389 (getCurrentListMapNoExtraKeys!3013 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11289 k!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29776 0))(
  ( (Unit!29777) )
))
(declare-fun lt!394252 () Unit!29776)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!583 (array!50002 array!50004 (_ BitVec 32) (_ BitVec 32) V!27609 V!27609 (_ BitVec 32) (_ BitVec 64) V!27609 (_ BitVec 32) Int) Unit!29776)

(assert (=> b!867789 (= lt!394252 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!583 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!867790 () Bool)

(assert (=> b!867790 (= e!483364 (and e!483367 mapRes!26981))))

(declare-fun condMapEmpty!26981 () Bool)

(declare-fun mapDefault!26981 () ValueCell!8021)

