; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78576 () Bool)

(assert start!78576)

(declare-fun b_free!16789 () Bool)

(declare-fun b_next!16789 () Bool)

(assert (=> start!78576 (= b_free!16789 (not b_next!16789))))

(declare-fun tp!58807 () Bool)

(declare-fun b_and!27411 () Bool)

(assert (=> start!78576 (= tp!58807 b_and!27411)))

(declare-fun b!915961 () Bool)

(declare-fun res!617514 () Bool)

(declare-fun e!514141 () Bool)

(assert (=> b!915961 (=> (not res!617514) (not e!514141))))

(declare-datatypes ((array!54588 0))(
  ( (array!54589 (arr!26239 (Array (_ BitVec 32) (_ BitVec 64))) (size!26698 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54588)

(declare-datatypes ((List!18397 0))(
  ( (Nil!18394) (Cons!18393 (h!19539 (_ BitVec 64)) (t!26010 List!18397)) )
))
(declare-fun arrayNoDuplicates!0 (array!54588 (_ BitVec 32) List!18397) Bool)

(assert (=> b!915961 (= res!617514 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18394))))

(declare-fun b!915962 () Bool)

(declare-fun res!617512 () Bool)

(assert (=> b!915962 (=> (not res!617512) (not e!514141))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30695 0))(
  ( (V!30696 (val!9699 Int)) )
))
(declare-datatypes ((ValueCell!9167 0))(
  ( (ValueCellFull!9167 (v!12217 V!30695)) (EmptyCell!9167) )
))
(declare-datatypes ((array!54590 0))(
  ( (array!54591 (arr!26240 (Array (_ BitVec 32) ValueCell!9167)) (size!26699 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54590)

(assert (=> b!915962 (= res!617512 (and (= (size!26699 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26698 _keys!1487) (size!26699 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30702 () Bool)

(declare-fun mapRes!30702 () Bool)

(declare-fun tp!58808 () Bool)

(declare-fun e!514139 () Bool)

(assert (=> mapNonEmpty!30702 (= mapRes!30702 (and tp!58808 e!514139))))

(declare-fun mapValue!30702 () ValueCell!9167)

(declare-fun mapRest!30702 () (Array (_ BitVec 32) ValueCell!9167))

(declare-fun mapKey!30702 () (_ BitVec 32))

(assert (=> mapNonEmpty!30702 (= (arr!26240 _values!1231) (store mapRest!30702 mapKey!30702 mapValue!30702))))

(declare-fun b!915963 () Bool)

(declare-fun e!514140 () Bool)

(declare-fun tp_is_empty!19297 () Bool)

(assert (=> b!915963 (= e!514140 tp_is_empty!19297)))

(declare-fun b!915964 () Bool)

(declare-fun e!514137 () Bool)

(assert (=> b!915964 (= e!514137 (and e!514140 mapRes!30702))))

(declare-fun condMapEmpty!30702 () Bool)

(declare-fun mapDefault!30702 () ValueCell!9167)

