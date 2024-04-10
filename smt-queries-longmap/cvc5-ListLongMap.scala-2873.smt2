; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41358 () Bool)

(assert start!41358)

(declare-fun b!462293 () Bool)

(declare-fun e!269725 () Bool)

(declare-fun e!269727 () Bool)

(declare-fun mapRes!20383 () Bool)

(assert (=> b!462293 (= e!269725 (and e!269727 mapRes!20383))))

(declare-fun condMapEmpty!20383 () Bool)

(declare-datatypes ((V!17739 0))(
  ( (V!17740 (val!6282 Int)) )
))
(declare-datatypes ((ValueCell!5894 0))(
  ( (ValueCellFull!5894 (v!8569 V!17739)) (EmptyCell!5894) )
))
(declare-datatypes ((array!28753 0))(
  ( (array!28754 (arr!13810 (Array (_ BitVec 32) ValueCell!5894)) (size!14162 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28753)

(declare-fun mapDefault!20383 () ValueCell!5894)

