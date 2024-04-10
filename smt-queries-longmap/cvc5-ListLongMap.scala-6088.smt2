; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78636 () Bool)

(assert start!78636)

(declare-fun b_free!16849 () Bool)

(declare-fun b_next!16849 () Bool)

(assert (=> start!78636 (= b_free!16849 (not b_next!16849))))

(declare-fun tp!58988 () Bool)

(declare-fun b_and!27471 () Bool)

(assert (=> start!78636 (= tp!58988 b_and!27471)))

(declare-fun b!916728 () Bool)

(declare-fun e!514625 () Bool)

(declare-fun tp_is_empty!19357 () Bool)

(assert (=> b!916728 (= e!514625 tp_is_empty!19357)))

(declare-fun b!916729 () Bool)

(declare-fun res!618013 () Bool)

(declare-fun e!514630 () Bool)

(assert (=> b!916729 (=> (not res!618013) (not e!514630))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54700 0))(
  ( (array!54701 (arr!26295 (Array (_ BitVec 32) (_ BitVec 64))) (size!26754 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54700)

(assert (=> b!916729 (= res!618013 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26754 _keys!1487))))))

(declare-fun b!916730 () Bool)

(declare-fun res!618012 () Bool)

(assert (=> b!916730 (=> (not res!618012) (not e!514630))))

(declare-datatypes ((List!18436 0))(
  ( (Nil!18433) (Cons!18432 (h!19578 (_ BitVec 64)) (t!26049 List!18436)) )
))
(declare-fun arrayNoDuplicates!0 (array!54700 (_ BitVec 32) List!18436) Bool)

(assert (=> b!916730 (= res!618012 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18433))))

(declare-fun res!618011 () Bool)

(assert (=> start!78636 (=> (not res!618011) (not e!514630))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78636 (= res!618011 (validMask!0 mask!1881))))

(assert (=> start!78636 e!514630))

(assert (=> start!78636 true))

(declare-datatypes ((V!30775 0))(
  ( (V!30776 (val!9729 Int)) )
))
(declare-datatypes ((ValueCell!9197 0))(
  ( (ValueCellFull!9197 (v!12247 V!30775)) (EmptyCell!9197) )
))
(declare-datatypes ((array!54702 0))(
  ( (array!54703 (arr!26296 (Array (_ BitVec 32) ValueCell!9197)) (size!26755 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54702)

(declare-fun e!514627 () Bool)

(declare-fun array_inv!20508 (array!54702) Bool)

(assert (=> start!78636 (and (array_inv!20508 _values!1231) e!514627)))

(assert (=> start!78636 tp!58988))

(declare-fun array_inv!20509 (array!54700) Bool)

(assert (=> start!78636 (array_inv!20509 _keys!1487)))

(assert (=> start!78636 tp_is_empty!19357))

(declare-fun b!916731 () Bool)

(declare-fun e!514628 () Bool)

(assert (=> b!916731 (= e!514630 e!514628)))

(declare-fun res!618008 () Bool)

(assert (=> b!916731 (=> (not res!618008) (not e!514628))))

(declare-datatypes ((tuple2!12624 0))(
  ( (tuple2!12625 (_1!6323 (_ BitVec 64)) (_2!6323 V!30775)) )
))
(declare-datatypes ((List!18437 0))(
  ( (Nil!18434) (Cons!18433 (h!19579 tuple2!12624) (t!26050 List!18437)) )
))
(declare-datatypes ((ListLongMap!11321 0))(
  ( (ListLongMap!11322 (toList!5676 List!18437)) )
))
(declare-fun lt!411856 () ListLongMap!11321)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4729 (ListLongMap!11321 (_ BitVec 64)) Bool)

(assert (=> b!916731 (= res!618008 (contains!4729 lt!411856 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30775)

(declare-fun minValue!1173 () V!30775)

(declare-fun getCurrentListMap!2936 (array!54700 array!54702 (_ BitVec 32) (_ BitVec 32) V!30775 V!30775 (_ BitVec 32) Int) ListLongMap!11321)

(assert (=> b!916731 (= lt!411856 (getCurrentListMap!2936 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!916732 () Bool)

(declare-fun e!514629 () Bool)

(declare-fun mapRes!30792 () Bool)

(assert (=> b!916732 (= e!514627 (and e!514629 mapRes!30792))))

(declare-fun condMapEmpty!30792 () Bool)

(declare-fun mapDefault!30792 () ValueCell!9197)

