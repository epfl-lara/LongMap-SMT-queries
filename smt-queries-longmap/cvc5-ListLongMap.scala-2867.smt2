; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41278 () Bool)

(assert start!41278)

(declare-fun mapIsEmpty!20314 () Bool)

(declare-fun mapRes!20314 () Bool)

(assert (=> mapIsEmpty!20314 mapRes!20314))

(declare-fun b!461839 () Bool)

(declare-fun e!269358 () Bool)

(declare-fun e!269361 () Bool)

(assert (=> b!461839 (= e!269358 (and e!269361 mapRes!20314))))

(declare-fun condMapEmpty!20314 () Bool)

(declare-datatypes ((V!17691 0))(
  ( (V!17692 (val!6264 Int)) )
))
(declare-datatypes ((ValueCell!5876 0))(
  ( (ValueCellFull!5876 (v!8550 V!17691)) (EmptyCell!5876) )
))
(declare-datatypes ((array!28677 0))(
  ( (array!28678 (arr!13777 (Array (_ BitVec 32) ValueCell!5876)) (size!14129 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28677)

(declare-fun mapDefault!20314 () ValueCell!5876)

