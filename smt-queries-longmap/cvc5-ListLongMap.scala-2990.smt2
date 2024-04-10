; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42230 () Bool)

(assert start!42230)

(declare-fun b_free!11749 () Bool)

(declare-fun b_next!11749 () Bool)

(assert (=> start!42230 (= b_free!11749 (not b_next!11749))))

(declare-fun tp!41271 () Bool)

(declare-fun b_and!20179 () Bool)

(assert (=> start!42230 (= tp!41271 b_and!20179)))

(declare-fun b!471330 () Bool)

(declare-fun e!276227 () Bool)

(declare-fun e!276228 () Bool)

(declare-fun mapRes!21469 () Bool)

(assert (=> b!471330 (= e!276227 (and e!276228 mapRes!21469))))

(declare-fun condMapEmpty!21469 () Bool)

(declare-datatypes ((V!18675 0))(
  ( (V!18676 (val!6633 Int)) )
))
(declare-datatypes ((ValueCell!6245 0))(
  ( (ValueCellFull!6245 (v!8924 V!18675)) (EmptyCell!6245) )
))
(declare-datatypes ((array!30117 0))(
  ( (array!30118 (arr!14481 (Array (_ BitVec 32) ValueCell!6245)) (size!14833 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30117)

(declare-fun mapDefault!21469 () ValueCell!6245)

