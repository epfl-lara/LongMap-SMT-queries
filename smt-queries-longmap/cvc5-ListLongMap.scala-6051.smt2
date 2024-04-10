; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78226 () Bool)

(assert start!78226)

(declare-fun b_free!16717 () Bool)

(declare-fun b_next!16717 () Bool)

(assert (=> start!78226 (= b_free!16717 (not b_next!16717))))

(declare-fun tp!58427 () Bool)

(declare-fun b_and!27293 () Bool)

(assert (=> start!78226 (= tp!58427 b_and!27293)))

(declare-fun b!913013 () Bool)

(declare-fun res!615901 () Bool)

(declare-fun e!512115 () Bool)

(assert (=> b!913013 (=> (not res!615901) (not e!512115))))

(declare-datatypes ((V!30479 0))(
  ( (V!30480 (val!9618 Int)) )
))
(declare-datatypes ((ValueCell!9086 0))(
  ( (ValueCellFull!9086 (v!12129 V!30479)) (EmptyCell!9086) )
))
(declare-datatypes ((array!54262 0))(
  ( (array!54263 (arr!26085 (Array (_ BitVec 32) ValueCell!9086)) (size!26544 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54262)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30479)

(declare-datatypes ((array!54264 0))(
  ( (array!54265 (arr!26086 (Array (_ BitVec 32) (_ BitVec 64))) (size!26545 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54264)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30479)

(declare-datatypes ((tuple2!12534 0))(
  ( (tuple2!12535 (_1!6278 (_ BitVec 64)) (_2!6278 V!30479)) )
))
(declare-datatypes ((List!18322 0))(
  ( (Nil!18319) (Cons!18318 (h!19464 tuple2!12534) (t!25911 List!18322)) )
))
(declare-datatypes ((ListLongMap!11231 0))(
  ( (ListLongMap!11232 (toList!5631 List!18322)) )
))
(declare-fun contains!4677 (ListLongMap!11231 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2893 (array!54264 array!54262 (_ BitVec 32) (_ BitVec 32) V!30479 V!30479 (_ BitVec 32) Int) ListLongMap!11231)

(assert (=> b!913013 (= res!615901 (contains!4677 (getCurrentListMap!2893 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!913014 () Bool)

(declare-fun res!615906 () Bool)

(assert (=> b!913014 (=> (not res!615906) (not e!512115))))

(declare-datatypes ((List!18323 0))(
  ( (Nil!18320) (Cons!18319 (h!19465 (_ BitVec 64)) (t!25912 List!18323)) )
))
(declare-fun arrayNoDuplicates!0 (array!54264 (_ BitVec 32) List!18323) Bool)

(assert (=> b!913014 (= res!615906 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18320))))

(declare-fun b!913015 () Bool)

(declare-fun e!512118 () Bool)

(declare-fun tp_is_empty!19135 () Bool)

(assert (=> b!913015 (= e!512118 tp_is_empty!19135)))

(declare-fun b!913016 () Bool)

(declare-fun e!512117 () Bool)

(declare-fun e!512116 () Bool)

(declare-fun mapRes!30430 () Bool)

(assert (=> b!913016 (= e!512117 (and e!512116 mapRes!30430))))

(declare-fun condMapEmpty!30430 () Bool)

(declare-fun mapDefault!30430 () ValueCell!9086)

