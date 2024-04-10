; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78774 () Bool)

(assert start!78774)

(declare-fun b_free!16987 () Bool)

(declare-fun b_next!16987 () Bool)

(assert (=> start!78774 (= b_free!16987 (not b_next!16987))))

(declare-fun tp!59401 () Bool)

(declare-fun b_and!27711 () Bool)

(assert (=> start!78774 (= tp!59401 b_and!27711)))

(declare-fun res!619872 () Bool)

(declare-fun e!516028 () Bool)

(assert (=> start!78774 (=> (not res!619872) (not e!516028))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78774 (= res!619872 (validMask!0 mask!1881))))

(assert (=> start!78774 e!516028))

(assert (=> start!78774 true))

(declare-fun tp_is_empty!19495 () Bool)

(assert (=> start!78774 tp_is_empty!19495))

(declare-datatypes ((V!30959 0))(
  ( (V!30960 (val!9798 Int)) )
))
(declare-datatypes ((ValueCell!9266 0))(
  ( (ValueCellFull!9266 (v!12316 V!30959)) (EmptyCell!9266) )
))
(declare-datatypes ((array!54974 0))(
  ( (array!54975 (arr!26432 (Array (_ BitVec 32) ValueCell!9266)) (size!26891 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54974)

(declare-fun e!516026 () Bool)

(declare-fun array_inv!20600 (array!54974) Bool)

(assert (=> start!78774 (and (array_inv!20600 _values!1231) e!516026)))

(assert (=> start!78774 tp!59401))

(declare-datatypes ((array!54976 0))(
  ( (array!54977 (arr!26433 (Array (_ BitVec 32) (_ BitVec 64))) (size!26892 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54976)

(declare-fun array_inv!20601 (array!54976) Bool)

(assert (=> start!78774 (array_inv!20601 _keys!1487)))

(declare-fun b!919313 () Bool)

(declare-fun res!619873 () Bool)

(assert (=> b!919313 (=> (not res!619873) (not e!516028))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!919313 (= res!619873 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26892 _keys!1487))))))

(declare-fun b!919314 () Bool)

(declare-fun e!516023 () Bool)

(assert (=> b!919314 (= e!516023 tp_is_empty!19495)))

(declare-fun mapNonEmpty!30999 () Bool)

(declare-fun mapRes!30999 () Bool)

(declare-fun tp!59402 () Bool)

(assert (=> mapNonEmpty!30999 (= mapRes!30999 (and tp!59402 e!516023))))

(declare-fun mapRest!30999 () (Array (_ BitVec 32) ValueCell!9266))

(declare-fun mapValue!30999 () ValueCell!9266)

(declare-fun mapKey!30999 () (_ BitVec 32))

(assert (=> mapNonEmpty!30999 (= (arr!26432 _values!1231) (store mapRest!30999 mapKey!30999 mapValue!30999))))

(declare-fun b!919315 () Bool)

(declare-fun e!516022 () Bool)

(assert (=> b!919315 (= e!516026 (and e!516022 mapRes!30999))))

(declare-fun condMapEmpty!30999 () Bool)

(declare-fun mapDefault!30999 () ValueCell!9266)

