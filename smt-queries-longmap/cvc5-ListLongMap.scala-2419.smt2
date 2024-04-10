; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38242 () Bool)

(assert start!38242)

(declare-fun b!394606 () Bool)

(declare-fun e!238853 () Bool)

(declare-fun tp_is_empty!9751 () Bool)

(assert (=> b!394606 (= e!238853 tp_is_empty!9751)))

(declare-fun b!394607 () Bool)

(declare-fun e!238856 () Bool)

(declare-fun mapRes!16227 () Bool)

(assert (=> b!394607 (= e!238856 (and e!238853 mapRes!16227))))

(declare-fun condMapEmpty!16227 () Bool)

(declare-datatypes ((V!14107 0))(
  ( (V!14108 (val!4920 Int)) )
))
(declare-datatypes ((ValueCell!4532 0))(
  ( (ValueCellFull!4532 (v!7165 V!14107)) (EmptyCell!4532) )
))
(declare-datatypes ((array!23411 0))(
  ( (array!23412 (arr!11162 (Array (_ BitVec 32) ValueCell!4532)) (size!11514 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23411)

(declare-fun mapDefault!16227 () ValueCell!4532)

