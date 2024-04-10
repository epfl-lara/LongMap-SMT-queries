; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39676 () Bool)

(assert start!39676)

(declare-fun b_free!9943 () Bool)

(declare-fun b_next!9943 () Bool)

(assert (=> start!39676 (= b_free!9943 (not b_next!9943))))

(declare-fun tp!35357 () Bool)

(declare-fun b_and!17599 () Bool)

(assert (=> start!39676 (= tp!35357 b_and!17599)))

(declare-fun b!426047 () Bool)

(declare-fun res!249590 () Bool)

(declare-fun e!252828 () Bool)

(assert (=> b!426047 (=> (not res!249590) (not e!252828))))

(declare-datatypes ((array!26029 0))(
  ( (array!26030 (arr!12464 (Array (_ BitVec 32) (_ BitVec 64))) (size!12816 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26029)

(declare-datatypes ((List!7359 0))(
  ( (Nil!7356) (Cons!7355 (h!8211 (_ BitVec 64)) (t!12803 List!7359)) )
))
(declare-fun arrayNoDuplicates!0 (array!26029 (_ BitVec 32) List!7359) Bool)

(assert (=> b!426047 (= res!249590 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7356))))

(declare-fun b!426048 () Bool)

(declare-fun res!249591 () Bool)

(assert (=> b!426048 (=> (not res!249591) (not e!252828))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426048 (= res!249591 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!426049 () Bool)

(declare-fun res!249581 () Bool)

(assert (=> b!426049 (=> (not res!249581) (not e!252828))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426049 (= res!249581 (validKeyInArray!0 k!794))))

(declare-fun b!426050 () Bool)

(declare-fun e!252832 () Bool)

(declare-fun e!252834 () Bool)

(declare-fun mapRes!18264 () Bool)

(assert (=> b!426050 (= e!252832 (and e!252834 mapRes!18264))))

(declare-fun condMapEmpty!18264 () Bool)

(declare-datatypes ((V!15899 0))(
  ( (V!15900 (val!5592 Int)) )
))
(declare-datatypes ((ValueCell!5204 0))(
  ( (ValueCellFull!5204 (v!7839 V!15899)) (EmptyCell!5204) )
))
(declare-datatypes ((array!26031 0))(
  ( (array!26032 (arr!12465 (Array (_ BitVec 32) ValueCell!5204)) (size!12817 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26031)

(declare-fun mapDefault!18264 () ValueCell!5204)

