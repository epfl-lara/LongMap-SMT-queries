; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20218 () Bool)

(assert start!20218)

(declare-fun b_free!4877 () Bool)

(declare-fun b_next!4877 () Bool)

(assert (=> start!20218 (= b_free!4877 (not b_next!4877))))

(declare-fun tp!17663 () Bool)

(declare-fun b_and!11623 () Bool)

(assert (=> start!20218 (= tp!17663 b_and!11623)))

(declare-fun b!198704 () Bool)

(declare-fun e!130556 () Bool)

(declare-fun tp_is_empty!4733 () Bool)

(assert (=> b!198704 (= e!130556 tp_is_empty!4733)))

(declare-fun b!198705 () Bool)

(declare-fun e!130555 () Bool)

(declare-fun mapRes!8168 () Bool)

(assert (=> b!198705 (= e!130555 (and e!130556 mapRes!8168))))

(declare-fun condMapEmpty!8168 () Bool)

(declare-datatypes ((V!5957 0))(
  ( (V!5958 (val!2411 Int)) )
))
(declare-datatypes ((ValueCell!2023 0))(
  ( (ValueCellFull!2023 (v!4381 V!5957)) (EmptyCell!2023) )
))
(declare-datatypes ((array!8711 0))(
  ( (array!8712 (arr!4106 (Array (_ BitVec 32) ValueCell!2023)) (size!4431 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8711)

(declare-fun mapDefault!8168 () ValueCell!2023)

