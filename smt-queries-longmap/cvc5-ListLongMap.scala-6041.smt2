; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78146 () Bool)

(assert start!78146)

(declare-fun b_free!16657 () Bool)

(declare-fun b_next!16657 () Bool)

(assert (=> start!78146 (= b_free!16657 (not b_next!16657))))

(declare-fun tp!58244 () Bool)

(declare-fun b_and!27231 () Bool)

(assert (=> start!78146 (= tp!58244 b_and!27231)))

(declare-fun res!615269 () Bool)

(declare-fun e!511583 () Bool)

(assert (=> start!78146 (=> (not res!615269) (not e!511583))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78146 (= res!615269 (validMask!0 mask!1756))))

(assert (=> start!78146 e!511583))

(declare-datatypes ((V!30399 0))(
  ( (V!30400 (val!9588 Int)) )
))
(declare-datatypes ((ValueCell!9056 0))(
  ( (ValueCellFull!9056 (v!12098 V!30399)) (EmptyCell!9056) )
))
(declare-datatypes ((array!54148 0))(
  ( (array!54149 (arr!26029 (Array (_ BitVec 32) ValueCell!9056)) (size!26488 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54148)

(declare-fun e!511586 () Bool)

(declare-fun array_inv!20340 (array!54148) Bool)

(assert (=> start!78146 (and (array_inv!20340 _values!1152) e!511586)))

(assert (=> start!78146 tp!58244))

(assert (=> start!78146 true))

(declare-fun tp_is_empty!19075 () Bool)

(assert (=> start!78146 tp_is_empty!19075))

(declare-datatypes ((array!54150 0))(
  ( (array!54151 (arr!26030 (Array (_ BitVec 32) (_ BitVec 64))) (size!26489 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54150)

(declare-fun array_inv!20341 (array!54150) Bool)

(assert (=> start!78146 (array_inv!20341 _keys!1386)))

(declare-fun b!912040 () Bool)

(declare-fun e!511585 () Bool)

(assert (=> b!912040 (= e!511585 tp_is_empty!19075)))

(declare-fun b!912041 () Bool)

(assert (=> b!912041 (= e!511583 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30399)

(declare-fun lt!410546 () Bool)

(declare-fun zeroValue!1094 () V!30399)

(declare-datatypes ((tuple2!12492 0))(
  ( (tuple2!12493 (_1!6257 (_ BitVec 64)) (_2!6257 V!30399)) )
))
(declare-datatypes ((List!18282 0))(
  ( (Nil!18279) (Cons!18278 (h!19424 tuple2!12492) (t!25869 List!18282)) )
))
(declare-datatypes ((ListLongMap!11189 0))(
  ( (ListLongMap!11190 (toList!5610 List!18282)) )
))
(declare-fun contains!4655 (ListLongMap!11189 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2872 (array!54150 array!54148 (_ BitVec 32) (_ BitVec 32) V!30399 V!30399 (_ BitVec 32) Int) ListLongMap!11189)

(assert (=> b!912041 (= lt!410546 (contains!4655 (getCurrentListMap!2872 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!912042 () Bool)

(declare-fun res!615270 () Bool)

(assert (=> b!912042 (=> (not res!615270) (not e!511583))))

(declare-datatypes ((List!18283 0))(
  ( (Nil!18280) (Cons!18279 (h!19425 (_ BitVec 64)) (t!25870 List!18283)) )
))
(declare-fun arrayNoDuplicates!0 (array!54150 (_ BitVec 32) List!18283) Bool)

(assert (=> b!912042 (= res!615270 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18280))))

(declare-fun b!912043 () Bool)

(declare-fun res!615267 () Bool)

(assert (=> b!912043 (=> (not res!615267) (not e!511583))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54150 (_ BitVec 32)) Bool)

(assert (=> b!912043 (= res!615267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912044 () Bool)

(declare-fun e!511584 () Bool)

(declare-fun mapRes!30337 () Bool)

(assert (=> b!912044 (= e!511586 (and e!511584 mapRes!30337))))

(declare-fun condMapEmpty!30337 () Bool)

(declare-fun mapDefault!30337 () ValueCell!9056)

