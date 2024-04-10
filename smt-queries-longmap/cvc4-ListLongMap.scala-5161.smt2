; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69944 () Bool)

(assert start!69944)

(declare-fun b_free!12377 () Bool)

(declare-fun b_next!12377 () Bool)

(assert (=> start!69944 (= b_free!12377 (not b_next!12377))))

(declare-fun tp!43842 () Bool)

(declare-fun b_and!21145 () Bool)

(assert (=> start!69944 (= tp!43842 b_and!21145)))

(declare-fun b!813040 () Bool)

(declare-fun e!450465 () Bool)

(declare-fun e!450462 () Bool)

(declare-fun mapRes!22708 () Bool)

(assert (=> b!813040 (= e!450465 (and e!450462 mapRes!22708))))

(declare-fun condMapEmpty!22708 () Bool)

(declare-datatypes ((V!23783 0))(
  ( (V!23784 (val!7091 Int)) )
))
(declare-datatypes ((ValueCell!6628 0))(
  ( (ValueCellFull!6628 (v!9518 V!23783)) (EmptyCell!6628) )
))
(declare-datatypes ((array!44390 0))(
  ( (array!44391 (arr!21256 (Array (_ BitVec 32) ValueCell!6628)) (size!21677 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44390)

(declare-fun mapDefault!22708 () ValueCell!6628)

