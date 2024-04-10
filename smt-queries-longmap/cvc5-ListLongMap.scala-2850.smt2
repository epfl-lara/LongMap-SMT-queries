; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41130 () Bool)

(assert start!41130)

(declare-fun b_free!10999 () Bool)

(declare-fun b_next!10999 () Bool)

(assert (=> start!41130 (= b_free!10999 (not b_next!10999))))

(declare-fun tp!38832 () Bool)

(declare-fun b_and!19237 () Bool)

(assert (=> start!41130 (= tp!38832 b_and!19237)))

(declare-fun b!458818 () Bool)

(declare-fun e!267867 () Bool)

(declare-fun tp_is_empty!12337 () Bool)

(assert (=> b!458818 (= e!267867 tp_is_empty!12337)))

(declare-fun b!458819 () Bool)

(declare-fun e!267866 () Bool)

(declare-fun e!267870 () Bool)

(declare-fun mapRes!20155 () Bool)

(assert (=> b!458819 (= e!267866 (and e!267870 mapRes!20155))))

(declare-fun condMapEmpty!20155 () Bool)

(declare-datatypes ((V!17555 0))(
  ( (V!17556 (val!6213 Int)) )
))
(declare-datatypes ((ValueCell!5825 0))(
  ( (ValueCellFull!5825 (v!8491 V!17555)) (EmptyCell!5825) )
))
(declare-datatypes ((array!28477 0))(
  ( (array!28478 (arr!13679 (Array (_ BitVec 32) ValueCell!5825)) (size!14031 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28477)

(declare-fun mapDefault!20155 () ValueCell!5825)

