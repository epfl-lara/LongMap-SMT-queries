; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73816 () Bool)

(assert start!73816)

(declare-fun b_free!14731 () Bool)

(declare-fun b_next!14731 () Bool)

(assert (=> start!73816 (= b_free!14731 (not b_next!14731))))

(declare-fun tp!51696 () Bool)

(declare-fun b_and!24441 () Bool)

(assert (=> start!73816 (= tp!51696 b_and!24441)))

(declare-fun b!866525 () Bool)

(declare-fun e!482701 () Bool)

(declare-fun tp_is_empty!16867 () Bool)

(assert (=> b!866525 (= e!482701 tp_is_empty!16867)))

(declare-fun b!866526 () Bool)

(declare-fun e!482695 () Bool)

(declare-fun e!482696 () Bool)

(assert (=> b!866526 (= e!482695 e!482696)))

(declare-fun res!588761 () Bool)

(assert (=> b!866526 (=> res!588761 e!482696)))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!49894 0))(
  ( (array!49895 (arr!23978 (Array (_ BitVec 32) (_ BitVec 64))) (size!24418 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49894)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!866526 (= res!588761 (= k!854 (select (arr!23978 _keys!868) from!1053)))))

(assert (=> b!866526 (not (= (select (arr!23978 _keys!868) from!1053) k!854))))

(declare-datatypes ((Unit!29701 0))(
  ( (Unit!29702) )
))
(declare-fun lt!393199 () Unit!29701)

(declare-fun e!482700 () Unit!29701)

(assert (=> b!866526 (= lt!393199 e!482700)))

(declare-fun c!92317 () Bool)

(assert (=> b!866526 (= c!92317 (= (select (arr!23978 _keys!868) from!1053) k!854))))

(declare-datatypes ((V!27537 0))(
  ( (V!27538 (val!8481 Int)) )
))
(declare-datatypes ((tuple2!11244 0))(
  ( (tuple2!11245 (_1!5633 (_ BitVec 64)) (_2!5633 V!27537)) )
))
(declare-datatypes ((List!17046 0))(
  ( (Nil!17043) (Cons!17042 (h!18173 tuple2!11244) (t!24043 List!17046)) )
))
(declare-datatypes ((ListLongMap!10013 0))(
  ( (ListLongMap!10014 (toList!5022 List!17046)) )
))
(declare-fun lt!393194 () ListLongMap!10013)

(declare-fun lt!393196 () ListLongMap!10013)

(assert (=> b!866526 (= lt!393194 lt!393196)))

(declare-fun lt!393200 () ListLongMap!10013)

(declare-fun lt!393198 () tuple2!11244)

(declare-fun +!2369 (ListLongMap!10013 tuple2!11244) ListLongMap!10013)

(assert (=> b!866526 (= lt!393196 (+!2369 lt!393200 lt!393198))))

(declare-fun lt!393197 () V!27537)

(assert (=> b!866526 (= lt!393198 (tuple2!11245 (select (arr!23978 _keys!868) from!1053) lt!393197))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7994 0))(
  ( (ValueCellFull!7994 (v!10906 V!27537)) (EmptyCell!7994) )
))
(declare-datatypes ((array!49896 0))(
  ( (array!49897 (arr!23979 (Array (_ BitVec 32) ValueCell!7994)) (size!24419 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49896)

(declare-fun get!12677 (ValueCell!7994 V!27537) V!27537)

(declare-fun dynLambda!1189 (Int (_ BitVec 64)) V!27537)

(assert (=> b!866526 (= lt!393197 (get!12677 (select (arr!23979 _values!688) from!1053) (dynLambda!1189 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!866527 () Bool)

(assert (=> b!866527 (= e!482696 true)))

(declare-fun lt!393195 () tuple2!11244)

(declare-fun lt!393204 () ListLongMap!10013)

(assert (=> b!866527 (= lt!393196 (+!2369 (+!2369 lt!393204 lt!393198) lt!393195))))

(declare-fun v!557 () V!27537)

(declare-fun lt!393201 () Unit!29701)

(declare-fun addCommutativeForDiffKeys!537 (ListLongMap!10013 (_ BitVec 64) V!27537 (_ BitVec 64) V!27537) Unit!29701)

(assert (=> b!866527 (= lt!393201 (addCommutativeForDiffKeys!537 lt!393204 k!854 v!557 (select (arr!23978 _keys!868) from!1053) lt!393197))))

(declare-fun res!588769 () Bool)

(declare-fun e!482694 () Bool)

(assert (=> start!73816 (=> (not res!588769) (not e!482694))))

(assert (=> start!73816 (= res!588769 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24418 _keys!868))))))

(assert (=> start!73816 e!482694))

(assert (=> start!73816 tp_is_empty!16867))

(assert (=> start!73816 true))

(assert (=> start!73816 tp!51696))

(declare-fun array_inv!18948 (array!49894) Bool)

(assert (=> start!73816 (array_inv!18948 _keys!868)))

(declare-fun e!482697 () Bool)

(declare-fun array_inv!18949 (array!49896) Bool)

(assert (=> start!73816 (and (array_inv!18949 _values!688) e!482697)))

(declare-fun b!866528 () Bool)

(declare-fun res!588765 () Bool)

(assert (=> b!866528 (=> (not res!588765) (not e!482694))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!866528 (= res!588765 (and (= (size!24419 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24418 _keys!868) (size!24419 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!866529 () Bool)

(declare-fun e!482699 () Bool)

(declare-fun mapRes!26900 () Bool)

(assert (=> b!866529 (= e!482697 (and e!482699 mapRes!26900))))

(declare-fun condMapEmpty!26900 () Bool)

(declare-fun mapDefault!26900 () ValueCell!7994)

