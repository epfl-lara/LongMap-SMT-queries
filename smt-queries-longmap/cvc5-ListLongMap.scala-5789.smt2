; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74676 () Bool)

(assert start!74676)

(declare-fun b_free!15325 () Bool)

(declare-fun b_next!15325 () Bool)

(assert (=> start!74676 (= b_free!15325 (not b_next!15325))))

(declare-fun tp!53663 () Bool)

(declare-fun b_and!25269 () Bool)

(assert (=> start!74676 (= tp!53663 b_and!25269)))

(declare-fun b!880169 () Bool)

(declare-fun res!597979 () Bool)

(declare-fun e!489812 () Bool)

(assert (=> b!880169 (=> (not res!597979) (not e!489812))))

(declare-datatypes ((array!51268 0))(
  ( (array!51269 (arr!24658 (Array (_ BitVec 32) (_ BitVec 64))) (size!25098 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51268)

(declare-datatypes ((List!17501 0))(
  ( (Nil!17498) (Cons!17497 (h!18628 (_ BitVec 64)) (t!24628 List!17501)) )
))
(declare-fun arrayNoDuplicates!0 (array!51268 (_ BitVec 32) List!17501) Bool)

(assert (=> b!880169 (= res!597979 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17498))))

(declare-fun b!880170 () Bool)

(declare-fun e!489815 () Bool)

(declare-fun tp_is_empty!17569 () Bool)

(assert (=> b!880170 (= e!489815 tp_is_empty!17569)))

(declare-fun b!880171 () Bool)

(declare-fun e!489814 () Bool)

(assert (=> b!880171 (= e!489814 true)))

(declare-datatypes ((V!28473 0))(
  ( (V!28474 (val!8832 Int)) )
))
(declare-datatypes ((tuple2!11688 0))(
  ( (tuple2!11689 (_1!5855 (_ BitVec 64)) (_2!5855 V!28473)) )
))
(declare-datatypes ((List!17502 0))(
  ( (Nil!17499) (Cons!17498 (h!18629 tuple2!11688) (t!24629 List!17502)) )
))
(declare-datatypes ((ListLongMap!10457 0))(
  ( (ListLongMap!10458 (toList!5244 List!17502)) )
))
(declare-fun lt!397978 () ListLongMap!10457)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8345 0))(
  ( (ValueCellFull!8345 (v!11280 V!28473)) (EmptyCell!8345) )
))
(declare-datatypes ((array!51270 0))(
  ( (array!51271 (arr!24659 (Array (_ BitVec 32) ValueCell!8345)) (size!25099 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51270)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lt!397981 () ListLongMap!10457)

(declare-fun +!2516 (ListLongMap!10457 tuple2!11688) ListLongMap!10457)

(declare-fun get!12964 (ValueCell!8345 V!28473) V!28473)

(declare-fun dynLambda!1233 (Int (_ BitVec 64)) V!28473)

(assert (=> b!880171 (= lt!397978 (+!2516 lt!397981 (tuple2!11689 (select (arr!24658 _keys!868) from!1053) (get!12964 (select (arr!24659 _values!688) from!1053) (dynLambda!1233 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880172 () Bool)

(declare-fun e!489810 () Bool)

(assert (=> b!880172 (= e!489810 tp_is_empty!17569)))

(declare-fun b!880173 () Bool)

(declare-fun res!597977 () Bool)

(assert (=> b!880173 (=> (not res!597977) (not e!489812))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!880173 (= res!597977 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25098 _keys!868))))))

(declare-fun mapNonEmpty!27975 () Bool)

(declare-fun mapRes!27975 () Bool)

(declare-fun tp!53662 () Bool)

(assert (=> mapNonEmpty!27975 (= mapRes!27975 (and tp!53662 e!489810))))

(declare-fun mapRest!27975 () (Array (_ BitVec 32) ValueCell!8345))

(declare-fun mapValue!27975 () ValueCell!8345)

(declare-fun mapKey!27975 () (_ BitVec 32))

(assert (=> mapNonEmpty!27975 (= (arr!24659 _values!688) (store mapRest!27975 mapKey!27975 mapValue!27975))))

(declare-fun mapIsEmpty!27975 () Bool)

(assert (=> mapIsEmpty!27975 mapRes!27975))

(declare-fun b!880174 () Bool)

(declare-fun res!597975 () Bool)

(assert (=> b!880174 (=> (not res!597975) (not e!489812))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!880174 (= res!597975 (and (= (size!25099 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25098 _keys!868) (size!25099 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!880176 () Bool)

(declare-fun res!597973 () Bool)

(assert (=> b!880176 (=> (not res!597973) (not e!489812))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!880176 (= res!597973 (and (= (select (arr!24658 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!880177 () Bool)

(declare-fun e!489813 () Bool)

(assert (=> b!880177 (= e!489813 (and e!489815 mapRes!27975))))

(declare-fun condMapEmpty!27975 () Bool)

(declare-fun mapDefault!27975 () ValueCell!8345)

