; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78552 () Bool)

(assert start!78552)

(declare-fun b_free!16765 () Bool)

(declare-fun b_next!16765 () Bool)

(assert (=> start!78552 (= b_free!16765 (not b_next!16765))))

(declare-fun tp!58735 () Bool)

(declare-fun b_and!27387 () Bool)

(assert (=> start!78552 (= tp!58735 b_and!27387)))

(declare-fun mapNonEmpty!30666 () Bool)

(declare-fun mapRes!30666 () Bool)

(declare-fun tp!58736 () Bool)

(declare-fun e!513961 () Bool)

(assert (=> mapNonEmpty!30666 (= mapRes!30666 (and tp!58736 e!513961))))

(declare-datatypes ((V!30663 0))(
  ( (V!30664 (val!9687 Int)) )
))
(declare-datatypes ((ValueCell!9155 0))(
  ( (ValueCellFull!9155 (v!12205 V!30663)) (EmptyCell!9155) )
))
(declare-fun mapRest!30666 () (Array (_ BitVec 32) ValueCell!9155))

(declare-fun mapValue!30666 () ValueCell!9155)

(declare-fun mapKey!30666 () (_ BitVec 32))

(declare-datatypes ((array!54540 0))(
  ( (array!54541 (arr!26215 (Array (_ BitVec 32) ValueCell!9155)) (size!26674 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54540)

(assert (=> mapNonEmpty!30666 (= (arr!26215 _values!1231) (store mapRest!30666 mapKey!30666 mapValue!30666))))

(declare-fun b!915673 () Bool)

(declare-fun res!617333 () Bool)

(declare-fun e!513957 () Bool)

(assert (=> b!915673 (=> (not res!617333) (not e!513957))))

(declare-datatypes ((array!54542 0))(
  ( (array!54543 (arr!26216 (Array (_ BitVec 32) (_ BitVec 64))) (size!26675 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54542)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54542 (_ BitVec 32)) Bool)

(assert (=> b!915673 (= res!617333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915674 () Bool)

(declare-fun res!617335 () Bool)

(assert (=> b!915674 (=> (not res!617335) (not e!513957))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!915674 (= res!617335 (and (= (size!26674 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26675 _keys!1487) (size!26674 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30666 () Bool)

(assert (=> mapIsEmpty!30666 mapRes!30666))

(declare-fun b!915675 () Bool)

(declare-fun res!617332 () Bool)

(assert (=> b!915675 (=> (not res!617332) (not e!513957))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!915675 (= res!617332 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26675 _keys!1487))))))

(declare-fun res!617331 () Bool)

(assert (=> start!78552 (=> (not res!617331) (not e!513957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78552 (= res!617331 (validMask!0 mask!1881))))

(assert (=> start!78552 e!513957))

(assert (=> start!78552 true))

(declare-fun e!513960 () Bool)

(declare-fun array_inv!20458 (array!54540) Bool)

(assert (=> start!78552 (and (array_inv!20458 _values!1231) e!513960)))

(assert (=> start!78552 tp!58735))

(declare-fun array_inv!20459 (array!54542) Bool)

(assert (=> start!78552 (array_inv!20459 _keys!1487)))

(declare-fun tp_is_empty!19273 () Bool)

(assert (=> start!78552 tp_is_empty!19273))

(declare-fun b!915676 () Bool)

(declare-fun e!513959 () Bool)

(assert (=> b!915676 (= e!513959 tp_is_empty!19273)))

(declare-fun b!915677 () Bool)

(assert (=> b!915677 (= e!513960 (and e!513959 mapRes!30666))))

(declare-fun condMapEmpty!30666 () Bool)

(declare-fun mapDefault!30666 () ValueCell!9155)

