; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36674 () Bool)

(assert start!36674)

(declare-fun b!366026 () Bool)

(declare-fun e!224157 () Bool)

(declare-fun tp_is_empty!8497 () Bool)

(assert (=> b!366026 (= e!224157 tp_is_empty!8497)))

(declare-fun b!366027 () Bool)

(declare-fun res!204680 () Bool)

(declare-fun e!224159 () Bool)

(assert (=> b!366027 (=> (not res!204680) (not e!224159))))

(declare-datatypes ((array!20947 0))(
  ( (array!20948 (arr!9945 (Array (_ BitVec 32) (_ BitVec 64))) (size!10297 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20947)

(declare-datatypes ((List!5541 0))(
  ( (Nil!5538) (Cons!5537 (h!6393 (_ BitVec 64)) (t!10691 List!5541)) )
))
(declare-fun arrayNoDuplicates!0 (array!20947 (_ BitVec 32) List!5541) Bool)

(assert (=> b!366027 (= res!204680 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5538))))

(declare-fun b!366028 () Bool)

(declare-fun res!204682 () Bool)

(assert (=> b!366028 (=> (not res!204682) (not e!224159))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366028 (= res!204682 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!366029 () Bool)

(declare-fun e!224158 () Bool)

(declare-fun e!224156 () Bool)

(declare-fun mapRes!14301 () Bool)

(assert (=> b!366029 (= e!224158 (and e!224156 mapRes!14301))))

(declare-fun condMapEmpty!14301 () Bool)

(declare-datatypes ((V!12435 0))(
  ( (V!12436 (val!4293 Int)) )
))
(declare-datatypes ((ValueCell!3905 0))(
  ( (ValueCellFull!3905 (v!6489 V!12435)) (EmptyCell!3905) )
))
(declare-datatypes ((array!20949 0))(
  ( (array!20950 (arr!9946 (Array (_ BitVec 32) ValueCell!3905)) (size!10298 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20949)

(declare-fun mapDefault!14301 () ValueCell!3905)

