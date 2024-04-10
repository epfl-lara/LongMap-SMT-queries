; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74304 () Bool)

(assert start!74304)

(declare-fun b_free!15067 () Bool)

(declare-fun b_next!15067 () Bool)

(assert (=> start!74304 (= b_free!15067 (not b_next!15067))))

(declare-fun tp!52876 () Bool)

(declare-fun b_and!24843 () Bool)

(assert (=> start!74304 (= tp!52876 b_and!24843)))

(declare-fun b!874280 () Bool)

(declare-fun res!594136 () Bool)

(declare-fun e!486798 () Bool)

(assert (=> b!874280 (=> (not res!594136) (not e!486798))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874280 (= res!594136 (validKeyInArray!0 k!854))))

(declare-fun b!874281 () Bool)

(declare-fun res!594133 () Bool)

(assert (=> b!874281 (=> (not res!594133) (not e!486798))))

(declare-datatypes ((array!50750 0))(
  ( (array!50751 (arr!24403 (Array (_ BitVec 32) (_ BitVec 64))) (size!24843 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50750)

(declare-datatypes ((List!17323 0))(
  ( (Nil!17320) (Cons!17319 (h!18450 (_ BitVec 64)) (t!24364 List!17323)) )
))
(declare-fun arrayNoDuplicates!0 (array!50750 (_ BitVec 32) List!17323) Bool)

(assert (=> b!874281 (= res!594133 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17320))))

(declare-fun mapIsEmpty!27575 () Bool)

(declare-fun mapRes!27575 () Bool)

(assert (=> mapIsEmpty!27575 mapRes!27575))

(declare-fun b!874282 () Bool)

(declare-fun res!594137 () Bool)

(assert (=> b!874282 (=> (not res!594137) (not e!486798))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50750 (_ BitVec 32)) Bool)

(assert (=> b!874282 (= res!594137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874283 () Bool)

(declare-fun res!594135 () Bool)

(assert (=> b!874283 (=> (not res!594135) (not e!486798))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!874283 (= res!594135 (and (= (select (arr!24403 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!874284 () Bool)

(declare-fun e!486796 () Bool)

(declare-fun tp_is_empty!17311 () Bool)

(assert (=> b!874284 (= e!486796 tp_is_empty!17311)))

(declare-fun b!874285 () Bool)

(declare-fun res!594138 () Bool)

(assert (=> b!874285 (=> (not res!594138) (not e!486798))))

(assert (=> b!874285 (= res!594138 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24843 _keys!868))))))

(declare-fun res!594132 () Bool)

(assert (=> start!74304 (=> (not res!594132) (not e!486798))))

(assert (=> start!74304 (= res!594132 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24843 _keys!868))))))

(assert (=> start!74304 e!486798))

(assert (=> start!74304 tp_is_empty!17311))

(assert (=> start!74304 true))

(assert (=> start!74304 tp!52876))

(declare-fun array_inv!19248 (array!50750) Bool)

(assert (=> start!74304 (array_inv!19248 _keys!868)))

(declare-datatypes ((V!28129 0))(
  ( (V!28130 (val!8703 Int)) )
))
(declare-datatypes ((ValueCell!8216 0))(
  ( (ValueCellFull!8216 (v!11132 V!28129)) (EmptyCell!8216) )
))
(declare-datatypes ((array!50752 0))(
  ( (array!50753 (arr!24404 (Array (_ BitVec 32) ValueCell!8216)) (size!24844 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50752)

(declare-fun e!486800 () Bool)

(declare-fun array_inv!19249 (array!50752) Bool)

(assert (=> start!74304 (and (array_inv!19249 _values!688) e!486800)))

(declare-fun b!874286 () Bool)

(assert (=> b!874286 (= e!486798 false)))

(declare-fun v!557 () V!28129)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28129)

(declare-fun zeroValue!654 () V!28129)

(declare-datatypes ((tuple2!11502 0))(
  ( (tuple2!11503 (_1!5762 (_ BitVec 64)) (_2!5762 V!28129)) )
))
(declare-datatypes ((List!17324 0))(
  ( (Nil!17321) (Cons!17320 (h!18451 tuple2!11502) (t!24365 List!17324)) )
))
(declare-datatypes ((ListLongMap!10271 0))(
  ( (ListLongMap!10272 (toList!5151 List!17324)) )
))
(declare-fun lt!395914 () ListLongMap!10271)

(declare-fun getCurrentListMapNoExtraKeys!3118 (array!50750 array!50752 (_ BitVec 32) (_ BitVec 32) V!28129 V!28129 (_ BitVec 32) Int) ListLongMap!10271)

(assert (=> b!874286 (= lt!395914 (getCurrentListMapNoExtraKeys!3118 _keys!868 (array!50753 (store (arr!24404 _values!688) i!612 (ValueCellFull!8216 v!557)) (size!24844 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395915 () ListLongMap!10271)

(assert (=> b!874286 (= lt!395915 (getCurrentListMapNoExtraKeys!3118 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!874287 () Bool)

(declare-fun res!594134 () Bool)

(assert (=> b!874287 (=> (not res!594134) (not e!486798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874287 (= res!594134 (validMask!0 mask!1196))))

(declare-fun b!874288 () Bool)

(declare-fun e!486797 () Bool)

(assert (=> b!874288 (= e!486797 tp_is_empty!17311)))

(declare-fun b!874289 () Bool)

(assert (=> b!874289 (= e!486800 (and e!486796 mapRes!27575))))

(declare-fun condMapEmpty!27575 () Bool)

(declare-fun mapDefault!27575 () ValueCell!8216)

