; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73294 () Bool)

(assert start!73294)

(declare-fun b_free!14209 () Bool)

(declare-fun b_next!14209 () Bool)

(assert (=> start!73294 (= b_free!14209 (not b_next!14209))))

(declare-fun tp!50130 () Bool)

(declare-fun b_and!23565 () Bool)

(assert (=> start!73294 (= tp!50130 b_and!23565)))

(declare-fun b!854974 () Bool)

(declare-fun res!580621 () Bool)

(declare-fun e!476713 () Bool)

(assert (=> b!854974 (=> (not res!580621) (not e!476713))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!48886 0))(
  ( (array!48887 (arr!23474 (Array (_ BitVec 32) (_ BitVec 64))) (size!23914 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48886)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!854974 (= res!580621 (and (= (select (arr!23474 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!854975 () Bool)

(declare-fun res!580623 () Bool)

(assert (=> b!854975 (=> (not res!580623) (not e!476713))))

(assert (=> b!854975 (= res!580623 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23914 _keys!868))))))

(declare-fun b!854976 () Bool)

(declare-fun res!580624 () Bool)

(assert (=> b!854976 (=> (not res!580624) (not e!476713))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48886 (_ BitVec 32)) Bool)

(assert (=> b!854976 (= res!580624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!26117 () Bool)

(declare-fun mapRes!26117 () Bool)

(declare-fun tp!50131 () Bool)

(declare-fun e!476712 () Bool)

(assert (=> mapNonEmpty!26117 (= mapRes!26117 (and tp!50131 e!476712))))

(declare-datatypes ((V!26841 0))(
  ( (V!26842 (val!8220 Int)) )
))
(declare-datatypes ((ValueCell!7733 0))(
  ( (ValueCellFull!7733 (v!10645 V!26841)) (EmptyCell!7733) )
))
(declare-fun mapValue!26117 () ValueCell!7733)

(declare-fun mapKey!26117 () (_ BitVec 32))

(declare-datatypes ((array!48888 0))(
  ( (array!48889 (arr!23475 (Array (_ BitVec 32) ValueCell!7733)) (size!23915 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48888)

(declare-fun mapRest!26117 () (Array (_ BitVec 32) ValueCell!7733))

(assert (=> mapNonEmpty!26117 (= (arr!23475 _values!688) (store mapRest!26117 mapKey!26117 mapValue!26117))))

(declare-fun b!854977 () Bool)

(declare-fun res!580619 () Bool)

(assert (=> b!854977 (=> (not res!580619) (not e!476713))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854977 (= res!580619 (validKeyInArray!0 k!854))))

(declare-fun b!854978 () Bool)

(assert (=> b!854978 (= e!476713 false)))

(declare-fun v!557 () V!26841)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26841)

(declare-fun zeroValue!654 () V!26841)

(declare-datatypes ((tuple2!10828 0))(
  ( (tuple2!10829 (_1!5425 (_ BitVec 64)) (_2!5425 V!26841)) )
))
(declare-datatypes ((List!16642 0))(
  ( (Nil!16639) (Cons!16638 (h!17769 tuple2!10828) (t!23283 List!16642)) )
))
(declare-datatypes ((ListLongMap!9597 0))(
  ( (ListLongMap!9598 (toList!4814 List!16642)) )
))
(declare-fun lt!385614 () ListLongMap!9597)

(declare-fun getCurrentListMapNoExtraKeys!2795 (array!48886 array!48888 (_ BitVec 32) (_ BitVec 32) V!26841 V!26841 (_ BitVec 32) Int) ListLongMap!9597)

(assert (=> b!854978 (= lt!385614 (getCurrentListMapNoExtraKeys!2795 _keys!868 (array!48889 (store (arr!23475 _values!688) i!612 (ValueCellFull!7733 v!557)) (size!23915 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385615 () ListLongMap!9597)

(assert (=> b!854978 (= lt!385615 (getCurrentListMapNoExtraKeys!2795 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!854979 () Bool)

(declare-fun res!580622 () Bool)

(assert (=> b!854979 (=> (not res!580622) (not e!476713))))

(declare-datatypes ((List!16643 0))(
  ( (Nil!16640) (Cons!16639 (h!17770 (_ BitVec 64)) (t!23284 List!16643)) )
))
(declare-fun arrayNoDuplicates!0 (array!48886 (_ BitVec 32) List!16643) Bool)

(assert (=> b!854979 (= res!580622 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16640))))

(declare-fun mapIsEmpty!26117 () Bool)

(assert (=> mapIsEmpty!26117 mapRes!26117))

(declare-fun res!580620 () Bool)

(assert (=> start!73294 (=> (not res!580620) (not e!476713))))

(assert (=> start!73294 (= res!580620 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23914 _keys!868))))))

(assert (=> start!73294 e!476713))

(declare-fun tp_is_empty!16345 () Bool)

(assert (=> start!73294 tp_is_empty!16345))

(assert (=> start!73294 true))

(assert (=> start!73294 tp!50130))

(declare-fun array_inv!18600 (array!48886) Bool)

(assert (=> start!73294 (array_inv!18600 _keys!868)))

(declare-fun e!476710 () Bool)

(declare-fun array_inv!18601 (array!48888) Bool)

(assert (=> start!73294 (and (array_inv!18601 _values!688) e!476710)))

(declare-fun b!854980 () Bool)

(declare-fun e!476711 () Bool)

(assert (=> b!854980 (= e!476710 (and e!476711 mapRes!26117))))

(declare-fun condMapEmpty!26117 () Bool)

(declare-fun mapDefault!26117 () ValueCell!7733)

