; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78604 () Bool)

(assert start!78604)

(declare-fun b_free!16817 () Bool)

(declare-fun b_next!16817 () Bool)

(assert (=> start!78604 (= b_free!16817 (not b_next!16817))))

(declare-fun tp!58892 () Bool)

(declare-fun b_and!27439 () Bool)

(assert (=> start!78604 (= tp!58892 b_and!27439)))

(declare-fun res!617732 () Bool)

(declare-fun e!514351 () Bool)

(assert (=> start!78604 (=> (not res!617732) (not e!514351))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78604 (= res!617732 (validMask!0 mask!1881))))

(assert (=> start!78604 e!514351))

(assert (=> start!78604 true))

(declare-datatypes ((V!30731 0))(
  ( (V!30732 (val!9713 Int)) )
))
(declare-datatypes ((ValueCell!9181 0))(
  ( (ValueCellFull!9181 (v!12231 V!30731)) (EmptyCell!9181) )
))
(declare-datatypes ((array!54640 0))(
  ( (array!54641 (arr!26265 (Array (_ BitVec 32) ValueCell!9181)) (size!26724 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54640)

(declare-fun e!514350 () Bool)

(declare-fun array_inv!20488 (array!54640) Bool)

(assert (=> start!78604 (and (array_inv!20488 _values!1231) e!514350)))

(assert (=> start!78604 tp!58892))

(declare-datatypes ((array!54642 0))(
  ( (array!54643 (arr!26266 (Array (_ BitVec 32) (_ BitVec 64))) (size!26725 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54642)

(declare-fun array_inv!20489 (array!54642) Bool)

(assert (=> start!78604 (array_inv!20489 _keys!1487)))

(declare-fun tp_is_empty!19325 () Bool)

(assert (=> start!78604 tp_is_empty!19325))

(declare-fun b!916305 () Bool)

(declare-fun e!514347 () Bool)

(assert (=> b!916305 (= e!514347 tp_is_empty!19325)))

(declare-fun b!916306 () Bool)

(declare-fun res!617733 () Bool)

(assert (=> b!916306 (=> (not res!617733) (not e!514351))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!30731)

(declare-fun minValue!1173 () V!30731)

(declare-datatypes ((tuple2!12600 0))(
  ( (tuple2!12601 (_1!6311 (_ BitVec 64)) (_2!6311 V!30731)) )
))
(declare-datatypes ((List!18413 0))(
  ( (Nil!18410) (Cons!18409 (h!19555 tuple2!12600) (t!26026 List!18413)) )
))
(declare-datatypes ((ListLongMap!11297 0))(
  ( (ListLongMap!11298 (toList!5664 List!18413)) )
))
(declare-fun contains!4718 (ListLongMap!11297 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2925 (array!54642 array!54640 (_ BitVec 32) (_ BitVec 32) V!30731 V!30731 (_ BitVec 32) Int) ListLongMap!11297)

(assert (=> b!916306 (= res!617733 (contains!4718 (getCurrentListMap!2925 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k!1099))))

(declare-fun b!916307 () Bool)

(assert (=> b!916307 (= e!514351 (bvsgt from!1844 (size!26725 _keys!1487)))))

(declare-fun b!916308 () Bool)

(declare-fun e!514349 () Bool)

(declare-fun mapRes!30744 () Bool)

(assert (=> b!916308 (= e!514350 (and e!514349 mapRes!30744))))

(declare-fun condMapEmpty!30744 () Bool)

(declare-fun mapDefault!30744 () ValueCell!9181)

