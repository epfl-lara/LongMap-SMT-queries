; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133688 () Bool)

(assert start!133688)

(declare-fun mapIsEmpty!59532 () Bool)

(declare-fun mapRes!59532 () Bool)

(assert (=> mapIsEmpty!59532 mapRes!59532))

(declare-fun b!1563048 () Bool)

(declare-fun e!871121 () Bool)

(declare-fun e!871123 () Bool)

(assert (=> b!1563048 (= e!871121 (and e!871123 mapRes!59532))))

(declare-fun condMapEmpty!59532 () Bool)

(declare-datatypes ((V!59901 0))(
  ( (V!59902 (val!19469 Int)) )
))
(declare-datatypes ((ValueCell!18355 0))(
  ( (ValueCellFull!18355 (v!22221 V!59901)) (EmptyCell!18355) )
))
(declare-datatypes ((array!104244 0))(
  ( (array!104245 (arr!50314 (Array (_ BitVec 32) ValueCell!18355)) (size!50864 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104244)

(declare-fun mapDefault!59532 () ValueCell!18355)

