; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78564 () Bool)

(assert start!78564)

(declare-fun b_free!16777 () Bool)

(declare-fun b_next!16777 () Bool)

(assert (=> start!78564 (= b_free!16777 (not b_next!16777))))

(declare-fun tp!58772 () Bool)

(declare-fun b_and!27399 () Bool)

(assert (=> start!78564 (= tp!58772 b_and!27399)))

(declare-fun b!915817 () Bool)

(declare-fun e!514051 () Bool)

(declare-fun tp_is_empty!19285 () Bool)

(assert (=> b!915817 (= e!514051 tp_is_empty!19285)))

(declare-fun mapIsEmpty!30684 () Bool)

(declare-fun mapRes!30684 () Bool)

(assert (=> mapIsEmpty!30684 mapRes!30684))

(declare-fun b!915818 () Bool)

(declare-fun res!617424 () Bool)

(declare-fun e!514048 () Bool)

(assert (=> b!915818 (=> (not res!617424) (not e!514048))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54564 0))(
  ( (array!54565 (arr!26227 (Array (_ BitVec 32) (_ BitVec 64))) (size!26686 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54564)

(assert (=> b!915818 (= res!617424 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26686 _keys!1487))))))

(declare-fun b!915819 () Bool)

(declare-fun e!514050 () Bool)

(assert (=> b!915819 (= e!514050 tp_is_empty!19285)))

(declare-fun b!915820 () Bool)

(declare-fun res!617425 () Bool)

(assert (=> b!915820 (=> (not res!617425) (not e!514048))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30679 0))(
  ( (V!30680 (val!9693 Int)) )
))
(declare-datatypes ((ValueCell!9161 0))(
  ( (ValueCellFull!9161 (v!12211 V!30679)) (EmptyCell!9161) )
))
(declare-datatypes ((array!54566 0))(
  ( (array!54567 (arr!26228 (Array (_ BitVec 32) ValueCell!9161)) (size!26687 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54566)

(assert (=> b!915820 (= res!617425 (and (= (size!26687 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26686 _keys!1487) (size!26687 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30684 () Bool)

(declare-fun tp!58771 () Bool)

(assert (=> mapNonEmpty!30684 (= mapRes!30684 (and tp!58771 e!514050))))

(declare-fun mapValue!30684 () ValueCell!9161)

(declare-fun mapKey!30684 () (_ BitVec 32))

(declare-fun mapRest!30684 () (Array (_ BitVec 32) ValueCell!9161))

(assert (=> mapNonEmpty!30684 (= (arr!26228 _values!1231) (store mapRest!30684 mapKey!30684 mapValue!30684))))

(declare-fun b!915821 () Bool)

(declare-fun res!617423 () Bool)

(assert (=> b!915821 (=> (not res!617423) (not e!514048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54564 (_ BitVec 32)) Bool)

(assert (=> b!915821 (= res!617423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915822 () Bool)

(assert (=> b!915822 (= e!514048 false)))

(declare-fun lt!411718 () Bool)

(declare-fun defaultEntry!1235 () Int)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!30679)

(declare-fun minValue!1173 () V!30679)

(declare-datatypes ((tuple2!12576 0))(
  ( (tuple2!12577 (_1!6299 (_ BitVec 64)) (_2!6299 V!30679)) )
))
(declare-datatypes ((List!18387 0))(
  ( (Nil!18384) (Cons!18383 (h!19529 tuple2!12576) (t!26000 List!18387)) )
))
(declare-datatypes ((ListLongMap!11273 0))(
  ( (ListLongMap!11274 (toList!5652 List!18387)) )
))
(declare-fun contains!4706 (ListLongMap!11273 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2913 (array!54564 array!54566 (_ BitVec 32) (_ BitVec 32) V!30679 V!30679 (_ BitVec 32) Int) ListLongMap!11273)

(assert (=> b!915822 (= lt!411718 (contains!4706 (getCurrentListMap!2913 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k!1099))))

(declare-fun b!915823 () Bool)

(declare-fun res!617422 () Bool)

(assert (=> b!915823 (=> (not res!617422) (not e!514048))))

(declare-datatypes ((List!18388 0))(
  ( (Nil!18385) (Cons!18384 (h!19530 (_ BitVec 64)) (t!26001 List!18388)) )
))
(declare-fun arrayNoDuplicates!0 (array!54564 (_ BitVec 32) List!18388) Bool)

(assert (=> b!915823 (= res!617422 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18385))))

(declare-fun b!915824 () Bool)

(declare-fun e!514049 () Bool)

(assert (=> b!915824 (= e!514049 (and e!514051 mapRes!30684))))

(declare-fun condMapEmpty!30684 () Bool)

(declare-fun mapDefault!30684 () ValueCell!9161)

