; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74526 () Bool)

(assert start!74526)

(declare-fun b_free!15215 () Bool)

(declare-fun b_next!15215 () Bool)

(assert (=> start!74526 (= b_free!15215 (not b_next!15215))))

(declare-fun tp!53326 () Bool)

(declare-fun b_and!25091 () Bool)

(assert (=> start!74526 (= tp!53326 b_and!25091)))

(declare-fun b!877883 () Bool)

(declare-fun res!596380 () Bool)

(declare-fun e!488650 () Bool)

(assert (=> b!877883 (=> (not res!596380) (not e!488650))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877883 (= res!596380 (validKeyInArray!0 k!854))))

(declare-fun b!877885 () Bool)

(declare-fun res!596382 () Bool)

(assert (=> b!877885 (=> (not res!596382) (not e!488650))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51046 0))(
  ( (array!51047 (arr!24549 (Array (_ BitVec 32) (_ BitVec 64))) (size!24989 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51046)

(declare-datatypes ((V!28325 0))(
  ( (V!28326 (val!8777 Int)) )
))
(declare-datatypes ((ValueCell!8290 0))(
  ( (ValueCellFull!8290 (v!11217 V!28325)) (EmptyCell!8290) )
))
(declare-datatypes ((array!51048 0))(
  ( (array!51049 (arr!24550 (Array (_ BitVec 32) ValueCell!8290)) (size!24990 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51048)

(assert (=> b!877885 (= res!596382 (and (= (size!24990 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24989 _keys!868) (size!24990 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877886 () Bool)

(assert (=> b!877886 (= e!488650 false)))

(declare-fun v!557 () V!28325)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11606 0))(
  ( (tuple2!11607 (_1!5814 (_ BitVec 64)) (_2!5814 V!28325)) )
))
(declare-datatypes ((List!17421 0))(
  ( (Nil!17418) (Cons!17417 (h!18548 tuple2!11606) (t!24510 List!17421)) )
))
(declare-datatypes ((ListLongMap!10375 0))(
  ( (ListLongMap!10376 (toList!5203 List!17421)) )
))
(declare-fun lt!397155 () ListLongMap!10375)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28325)

(declare-fun zeroValue!654 () V!28325)

(declare-fun getCurrentListMapNoExtraKeys!3170 (array!51046 array!51048 (_ BitVec 32) (_ BitVec 32) V!28325 V!28325 (_ BitVec 32) Int) ListLongMap!10375)

(assert (=> b!877886 (= lt!397155 (getCurrentListMapNoExtraKeys!3170 _keys!868 (array!51049 (store (arr!24550 _values!688) i!612 (ValueCellFull!8290 v!557)) (size!24990 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397154 () ListLongMap!10375)

(assert (=> b!877886 (= lt!397154 (getCurrentListMapNoExtraKeys!3170 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27804 () Bool)

(declare-fun mapRes!27804 () Bool)

(assert (=> mapIsEmpty!27804 mapRes!27804))

(declare-fun b!877887 () Bool)

(declare-fun res!596383 () Bool)

(assert (=> b!877887 (=> (not res!596383) (not e!488650))))

(assert (=> b!877887 (= res!596383 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24989 _keys!868))))))

(declare-fun b!877888 () Bool)

(declare-fun res!596379 () Bool)

(assert (=> b!877888 (=> (not res!596379) (not e!488650))))

(declare-datatypes ((List!17422 0))(
  ( (Nil!17419) (Cons!17418 (h!18549 (_ BitVec 64)) (t!24511 List!17422)) )
))
(declare-fun arrayNoDuplicates!0 (array!51046 (_ BitVec 32) List!17422) Bool)

(assert (=> b!877888 (= res!596379 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17419))))

(declare-fun b!877889 () Bool)

(declare-fun res!596381 () Bool)

(assert (=> b!877889 (=> (not res!596381) (not e!488650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51046 (_ BitVec 32)) Bool)

(assert (=> b!877889 (= res!596381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!877890 () Bool)

(declare-fun e!488646 () Bool)

(declare-fun e!488649 () Bool)

(assert (=> b!877890 (= e!488646 (and e!488649 mapRes!27804))))

(declare-fun condMapEmpty!27804 () Bool)

(declare-fun mapDefault!27804 () ValueCell!8290)

