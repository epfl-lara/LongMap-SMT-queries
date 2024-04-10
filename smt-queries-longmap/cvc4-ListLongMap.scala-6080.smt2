; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78592 () Bool)

(assert start!78592)

(declare-fun b_free!16805 () Bool)

(declare-fun b_next!16805 () Bool)

(assert (=> start!78592 (= b_free!16805 (not b_next!16805))))

(declare-fun tp!58855 () Bool)

(declare-fun b_and!27427 () Bool)

(assert (=> start!78592 (= tp!58855 b_and!27427)))

(declare-fun b!916153 () Bool)

(declare-fun res!617633 () Bool)

(declare-fun e!514258 () Bool)

(assert (=> b!916153 (=> (not res!617633) (not e!514258))))

(declare-datatypes ((array!54618 0))(
  ( (array!54619 (arr!26254 (Array (_ BitVec 32) (_ BitVec 64))) (size!26713 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54618)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54618 (_ BitVec 32)) Bool)

(assert (=> b!916153 (= res!617633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!30726 () Bool)

(declare-fun mapRes!30726 () Bool)

(declare-fun tp!58856 () Bool)

(declare-fun e!514259 () Bool)

(assert (=> mapNonEmpty!30726 (= mapRes!30726 (and tp!58856 e!514259))))

(declare-datatypes ((V!30715 0))(
  ( (V!30716 (val!9707 Int)) )
))
(declare-datatypes ((ValueCell!9175 0))(
  ( (ValueCellFull!9175 (v!12225 V!30715)) (EmptyCell!9175) )
))
(declare-datatypes ((array!54620 0))(
  ( (array!54621 (arr!26255 (Array (_ BitVec 32) ValueCell!9175)) (size!26714 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54620)

(declare-fun mapValue!30726 () ValueCell!9175)

(declare-fun mapKey!30726 () (_ BitVec 32))

(declare-fun mapRest!30726 () (Array (_ BitVec 32) ValueCell!9175))

(assert (=> mapNonEmpty!30726 (= (arr!26255 _values!1231) (store mapRest!30726 mapKey!30726 mapValue!30726))))

(declare-fun b!916154 () Bool)

(declare-fun e!514257 () Bool)

(declare-fun e!514261 () Bool)

(assert (=> b!916154 (= e!514257 (and e!514261 mapRes!30726))))

(declare-fun condMapEmpty!30726 () Bool)

(declare-fun mapDefault!30726 () ValueCell!9175)

