; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73310 () Bool)

(assert start!73310)

(declare-fun b_free!14225 () Bool)

(declare-fun b_next!14225 () Bool)

(assert (=> start!73310 (= b_free!14225 (not b_next!14225))))

(declare-fun tp!50179 () Bool)

(declare-fun b_and!23581 () Bool)

(assert (=> start!73310 (= tp!50179 b_and!23581)))

(declare-fun res!580812 () Bool)

(declare-fun e!476829 () Bool)

(assert (=> start!73310 (=> (not res!580812) (not e!476829))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48918 0))(
  ( (array!48919 (arr!23490 (Array (_ BitVec 32) (_ BitVec 64))) (size!23930 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48918)

(assert (=> start!73310 (= res!580812 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23930 _keys!868))))))

(assert (=> start!73310 e!476829))

(declare-fun tp_is_empty!16361 () Bool)

(assert (=> start!73310 tp_is_empty!16361))

(assert (=> start!73310 true))

(assert (=> start!73310 tp!50179))

(declare-fun array_inv!18614 (array!48918) Bool)

(assert (=> start!73310 (array_inv!18614 _keys!868)))

(declare-datatypes ((V!26861 0))(
  ( (V!26862 (val!8228 Int)) )
))
(declare-datatypes ((ValueCell!7741 0))(
  ( (ValueCellFull!7741 (v!10653 V!26861)) (EmptyCell!7741) )
))
(declare-datatypes ((array!48920 0))(
  ( (array!48921 (arr!23491 (Array (_ BitVec 32) ValueCell!7741)) (size!23931 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48920)

(declare-fun e!476831 () Bool)

(declare-fun array_inv!18615 (array!48920) Bool)

(assert (=> start!73310 (and (array_inv!18615 _values!688) e!476831)))

(declare-fun b!855238 () Bool)

(declare-fun res!580811 () Bool)

(assert (=> b!855238 (=> (not res!580811) (not e!476829))))

(declare-datatypes ((List!16654 0))(
  ( (Nil!16651) (Cons!16650 (h!17781 (_ BitVec 64)) (t!23295 List!16654)) )
))
(declare-fun arrayNoDuplicates!0 (array!48918 (_ BitVec 32) List!16654) Bool)

(assert (=> b!855238 (= res!580811 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16651))))

(declare-fun b!855239 () Bool)

(declare-fun res!580810 () Bool)

(assert (=> b!855239 (=> (not res!580810) (not e!476829))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855239 (= res!580810 (validKeyInArray!0 k!854))))

(declare-fun b!855240 () Bool)

(assert (=> b!855240 (= e!476829 false)))

(declare-fun v!557 () V!26861)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26861)

(declare-fun zeroValue!654 () V!26861)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10842 0))(
  ( (tuple2!10843 (_1!5432 (_ BitVec 64)) (_2!5432 V!26861)) )
))
(declare-datatypes ((List!16655 0))(
  ( (Nil!16652) (Cons!16651 (h!17782 tuple2!10842) (t!23296 List!16655)) )
))
(declare-datatypes ((ListLongMap!9611 0))(
  ( (ListLongMap!9612 (toList!4821 List!16655)) )
))
(declare-fun lt!385663 () ListLongMap!9611)

(declare-fun getCurrentListMapNoExtraKeys!2802 (array!48918 array!48920 (_ BitVec 32) (_ BitVec 32) V!26861 V!26861 (_ BitVec 32) Int) ListLongMap!9611)

(assert (=> b!855240 (= lt!385663 (getCurrentListMapNoExtraKeys!2802 _keys!868 (array!48921 (store (arr!23491 _values!688) i!612 (ValueCellFull!7741 v!557)) (size!23931 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385662 () ListLongMap!9611)

(assert (=> b!855240 (= lt!385662 (getCurrentListMapNoExtraKeys!2802 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26141 () Bool)

(declare-fun mapRes!26141 () Bool)

(assert (=> mapIsEmpty!26141 mapRes!26141))

(declare-fun b!855241 () Bool)

(declare-fun res!580814 () Bool)

(assert (=> b!855241 (=> (not res!580814) (not e!476829))))

(assert (=> b!855241 (= res!580814 (and (= (select (arr!23490 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!855242 () Bool)

(declare-fun res!580813 () Bool)

(assert (=> b!855242 (=> (not res!580813) (not e!476829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855242 (= res!580813 (validMask!0 mask!1196))))

(declare-fun b!855243 () Bool)

(declare-fun e!476833 () Bool)

(assert (=> b!855243 (= e!476833 tp_is_empty!16361)))

(declare-fun b!855244 () Bool)

(declare-fun res!580816 () Bool)

(assert (=> b!855244 (=> (not res!580816) (not e!476829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48918 (_ BitVec 32)) Bool)

(assert (=> b!855244 (= res!580816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855245 () Bool)

(declare-fun res!580817 () Bool)

(assert (=> b!855245 (=> (not res!580817) (not e!476829))))

(assert (=> b!855245 (= res!580817 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23930 _keys!868))))))

(declare-fun b!855246 () Bool)

(declare-fun e!476830 () Bool)

(assert (=> b!855246 (= e!476830 tp_is_empty!16361)))

(declare-fun b!855247 () Bool)

(assert (=> b!855247 (= e!476831 (and e!476830 mapRes!26141))))

(declare-fun condMapEmpty!26141 () Bool)

(declare-fun mapDefault!26141 () ValueCell!7741)

