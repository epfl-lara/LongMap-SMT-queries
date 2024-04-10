; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35262 () Bool)

(assert start!35262)

(declare-fun b!353465 () Bool)

(declare-fun e!216458 () Bool)

(declare-fun tp_is_empty!7771 () Bool)

(assert (=> b!353465 (= e!216458 tp_is_empty!7771)))

(declare-fun b!353466 () Bool)

(declare-fun e!216456 () Bool)

(declare-fun e!216457 () Bool)

(declare-fun mapRes!13146 () Bool)

(assert (=> b!353466 (= e!216456 (and e!216457 mapRes!13146))))

(declare-fun condMapEmpty!13146 () Bool)

(declare-datatypes ((V!11339 0))(
  ( (V!11340 (val!3930 Int)) )
))
(declare-datatypes ((ValueCell!3542 0))(
  ( (ValueCellFull!3542 (v!6123 V!11339)) (EmptyCell!3542) )
))
(declare-datatypes ((array!19133 0))(
  ( (array!19134 (arr!9066 (Array (_ BitVec 32) ValueCell!3542)) (size!9418 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19133)

(declare-fun mapDefault!13146 () ValueCell!3542)

