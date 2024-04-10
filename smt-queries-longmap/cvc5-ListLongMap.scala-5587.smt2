; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73306 () Bool)

(assert start!73306)

(declare-fun b_free!14221 () Bool)

(declare-fun b_next!14221 () Bool)

(assert (=> start!73306 (= b_free!14221 (not b_next!14221))))

(declare-fun tp!50166 () Bool)

(declare-fun b_and!23577 () Bool)

(assert (=> start!73306 (= tp!50166 b_and!23577)))

(declare-fun b!855172 () Bool)

(declare-fun res!580764 () Bool)

(declare-fun e!476799 () Bool)

(assert (=> b!855172 (=> (not res!580764) (not e!476799))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855172 (= res!580764 (validKeyInArray!0 k!854))))

(declare-fun mapIsEmpty!26135 () Bool)

(declare-fun mapRes!26135 () Bool)

(assert (=> mapIsEmpty!26135 mapRes!26135))

(declare-fun b!855173 () Bool)

(declare-fun res!580767 () Bool)

(assert (=> b!855173 (=> (not res!580767) (not e!476799))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48910 0))(
  ( (array!48911 (arr!23486 (Array (_ BitVec 32) (_ BitVec 64))) (size!23926 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48910)

(assert (=> b!855173 (= res!580767 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23926 _keys!868))))))

(declare-fun res!580766 () Bool)

(assert (=> start!73306 (=> (not res!580766) (not e!476799))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73306 (= res!580766 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23926 _keys!868))))))

(assert (=> start!73306 e!476799))

(declare-fun tp_is_empty!16357 () Bool)

(assert (=> start!73306 tp_is_empty!16357))

(assert (=> start!73306 true))

(assert (=> start!73306 tp!50166))

(declare-fun array_inv!18610 (array!48910) Bool)

(assert (=> start!73306 (array_inv!18610 _keys!868)))

(declare-datatypes ((V!26857 0))(
  ( (V!26858 (val!8226 Int)) )
))
(declare-datatypes ((ValueCell!7739 0))(
  ( (ValueCellFull!7739 (v!10651 V!26857)) (EmptyCell!7739) )
))
(declare-datatypes ((array!48912 0))(
  ( (array!48913 (arr!23487 (Array (_ BitVec 32) ValueCell!7739)) (size!23927 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48912)

(declare-fun e!476800 () Bool)

(declare-fun array_inv!18611 (array!48912) Bool)

(assert (=> start!73306 (and (array_inv!18611 _values!688) e!476800)))

(declare-fun b!855174 () Bool)

(declare-fun res!580763 () Bool)

(assert (=> b!855174 (=> (not res!580763) (not e!476799))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48910 (_ BitVec 32)) Bool)

(assert (=> b!855174 (= res!580763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855175 () Bool)

(assert (=> b!855175 (= e!476799 false)))

(declare-fun v!557 () V!26857)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10838 0))(
  ( (tuple2!10839 (_1!5430 (_ BitVec 64)) (_2!5430 V!26857)) )
))
(declare-datatypes ((List!16651 0))(
  ( (Nil!16648) (Cons!16647 (h!17778 tuple2!10838) (t!23292 List!16651)) )
))
(declare-datatypes ((ListLongMap!9607 0))(
  ( (ListLongMap!9608 (toList!4819 List!16651)) )
))
(declare-fun lt!385651 () ListLongMap!9607)

(declare-fun minValue!654 () V!26857)

(declare-fun zeroValue!654 () V!26857)

(declare-fun getCurrentListMapNoExtraKeys!2800 (array!48910 array!48912 (_ BitVec 32) (_ BitVec 32) V!26857 V!26857 (_ BitVec 32) Int) ListLongMap!9607)

(assert (=> b!855175 (= lt!385651 (getCurrentListMapNoExtraKeys!2800 _keys!868 (array!48913 (store (arr!23487 _values!688) i!612 (ValueCellFull!7739 v!557)) (size!23927 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385650 () ListLongMap!9607)

(assert (=> b!855175 (= lt!385650 (getCurrentListMapNoExtraKeys!2800 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855176 () Bool)

(declare-fun res!580765 () Bool)

(assert (=> b!855176 (=> (not res!580765) (not e!476799))))

(assert (=> b!855176 (= res!580765 (and (= (size!23927 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23926 _keys!868) (size!23927 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26135 () Bool)

(declare-fun tp!50167 () Bool)

(declare-fun e!476801 () Bool)

(assert (=> mapNonEmpty!26135 (= mapRes!26135 (and tp!50167 e!476801))))

(declare-fun mapKey!26135 () (_ BitVec 32))

(declare-fun mapRest!26135 () (Array (_ BitVec 32) ValueCell!7739))

(declare-fun mapValue!26135 () ValueCell!7739)

(assert (=> mapNonEmpty!26135 (= (arr!23487 _values!688) (store mapRest!26135 mapKey!26135 mapValue!26135))))

(declare-fun b!855177 () Bool)

(declare-fun res!580762 () Bool)

(assert (=> b!855177 (=> (not res!580762) (not e!476799))))

(assert (=> b!855177 (= res!580762 (and (= (select (arr!23486 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!855178 () Bool)

(declare-fun res!580768 () Bool)

(assert (=> b!855178 (=> (not res!580768) (not e!476799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855178 (= res!580768 (validMask!0 mask!1196))))

(declare-fun b!855179 () Bool)

(declare-fun e!476803 () Bool)

(assert (=> b!855179 (= e!476800 (and e!476803 mapRes!26135))))

(declare-fun condMapEmpty!26135 () Bool)

(declare-fun mapDefault!26135 () ValueCell!7739)

