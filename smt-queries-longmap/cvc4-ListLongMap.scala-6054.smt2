; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78318 () Bool)

(assert start!78318)

(declare-fun b_free!16739 () Bool)

(declare-fun b_next!16739 () Bool)

(assert (=> start!78318 (= b_free!16739 (not b_next!16739))))

(declare-fun tp!58501 () Bool)

(declare-fun b_and!27333 () Bool)

(assert (=> start!78318 (= tp!58501 b_and!27333)))

(declare-fun b!913829 () Bool)

(declare-fun res!616357 () Bool)

(declare-fun e!512604 () Bool)

(assert (=> b!913829 (=> (not res!616357) (not e!512604))))

(declare-datatypes ((array!54306 0))(
  ( (array!54307 (arr!26105 (Array (_ BitVec 32) (_ BitVec 64))) (size!26564 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54306)

(declare-datatypes ((List!18339 0))(
  ( (Nil!18336) (Cons!18335 (h!19481 (_ BitVec 64)) (t!25938 List!18339)) )
))
(declare-fun arrayNoDuplicates!0 (array!54306 (_ BitVec 32) List!18339) Bool)

(assert (=> b!913829 (= res!616357 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18336))))

(declare-fun b!913830 () Bool)

(declare-fun e!512603 () Bool)

(declare-fun e!512608 () Bool)

(declare-fun mapRes!30470 () Bool)

(assert (=> b!913830 (= e!512603 (and e!512608 mapRes!30470))))

(declare-fun condMapEmpty!30470 () Bool)

(declare-datatypes ((V!30507 0))(
  ( (V!30508 (val!9629 Int)) )
))
(declare-datatypes ((ValueCell!9097 0))(
  ( (ValueCellFull!9097 (v!12143 V!30507)) (EmptyCell!9097) )
))
(declare-datatypes ((array!54308 0))(
  ( (array!54309 (arr!26106 (Array (_ BitVec 32) ValueCell!9097)) (size!26565 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54308)

(declare-fun mapDefault!30470 () ValueCell!9097)

