; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78128 () Bool)

(assert start!78128)

(declare-fun b_free!16639 () Bool)

(declare-fun b_next!16639 () Bool)

(assert (=> start!78128 (= b_free!16639 (not b_next!16639))))

(declare-fun tp!58191 () Bool)

(declare-fun b_and!27213 () Bool)

(assert (=> start!78128 (= tp!58191 b_and!27213)))

(declare-fun b!911851 () Bool)

(declare-fun e!511452 () Bool)

(assert (=> b!911851 (= e!511452 false)))

(declare-datatypes ((V!30375 0))(
  ( (V!30376 (val!9579 Int)) )
))
(declare-datatypes ((ValueCell!9047 0))(
  ( (ValueCellFull!9047 (v!12089 V!30375)) (EmptyCell!9047) )
))
(declare-datatypes ((array!54114 0))(
  ( (array!54115 (arr!26012 (Array (_ BitVec 32) ValueCell!9047)) (size!26471 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54114)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30375)

(declare-datatypes ((array!54116 0))(
  ( (array!54117 (arr!26013 (Array (_ BitVec 32) (_ BitVec 64))) (size!26472 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54116)

(declare-fun lt!410519 () Bool)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30375)

(declare-datatypes ((tuple2!12478 0))(
  ( (tuple2!12479 (_1!6250 (_ BitVec 64)) (_2!6250 V!30375)) )
))
(declare-datatypes ((List!18270 0))(
  ( (Nil!18267) (Cons!18266 (h!19412 tuple2!12478) (t!25857 List!18270)) )
))
(declare-datatypes ((ListLongMap!11175 0))(
  ( (ListLongMap!11176 (toList!5603 List!18270)) )
))
(declare-fun contains!4648 (ListLongMap!11175 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2865 (array!54116 array!54114 (_ BitVec 32) (_ BitVec 32) V!30375 V!30375 (_ BitVec 32) Int) ListLongMap!11175)

(assert (=> b!911851 (= lt!410519 (contains!4648 (getCurrentListMap!2865 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!911852 () Bool)

(declare-fun res!615160 () Bool)

(assert (=> b!911852 (=> (not res!615160) (not e!511452))))

(assert (=> b!911852 (= res!615160 (and (= (size!26471 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26472 _keys!1386) (size!26471 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911853 () Bool)

(declare-fun e!511449 () Bool)

(declare-fun e!511450 () Bool)

(declare-fun mapRes!30310 () Bool)

(assert (=> b!911853 (= e!511449 (and e!511450 mapRes!30310))))

(declare-fun condMapEmpty!30310 () Bool)

(declare-fun mapDefault!30310 () ValueCell!9047)

