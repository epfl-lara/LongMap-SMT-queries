; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69970 () Bool)

(assert start!69970)

(declare-fun b_free!12403 () Bool)

(declare-fun b_next!12403 () Bool)

(assert (=> start!69970 (= b_free!12403 (not b_next!12403))))

(declare-fun tp!43921 () Bool)

(declare-fun b_and!21171 () Bool)

(assert (=> start!69970 (= tp!43921 b_and!21171)))

(declare-fun mapIsEmpty!22747 () Bool)

(declare-fun mapRes!22747 () Bool)

(assert (=> mapIsEmpty!22747 mapRes!22747))

(declare-fun b!813313 () Bool)

(declare-fun e!450660 () Bool)

(declare-fun e!450656 () Bool)

(assert (=> b!813313 (= e!450660 (and e!450656 mapRes!22747))))

(declare-fun condMapEmpty!22747 () Bool)

(declare-datatypes ((V!23819 0))(
  ( (V!23820 (val!7104 Int)) )
))
(declare-datatypes ((ValueCell!6641 0))(
  ( (ValueCellFull!6641 (v!9531 V!23819)) (EmptyCell!6641) )
))
(declare-datatypes ((array!44436 0))(
  ( (array!44437 (arr!21279 (Array (_ BitVec 32) ValueCell!6641)) (size!21700 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44436)

(declare-fun mapDefault!22747 () ValueCell!6641)

