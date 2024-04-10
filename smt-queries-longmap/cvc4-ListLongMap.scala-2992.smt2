; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42260 () Bool)

(assert start!42260)

(declare-fun b_free!11765 () Bool)

(declare-fun b_next!11765 () Bool)

(assert (=> start!42260 (= b_free!11765 (not b_next!11765))))

(declare-fun tp!41323 () Bool)

(declare-fun b_and!20203 () Bool)

(assert (=> start!42260 (= tp!41323 b_and!20203)))

(declare-fun b!471583 () Bool)

(declare-fun e!276405 () Bool)

(declare-fun e!276404 () Bool)

(declare-fun mapRes!21496 () Bool)

(assert (=> b!471583 (= e!276405 (and e!276404 mapRes!21496))))

(declare-fun condMapEmpty!21496 () Bool)

(declare-datatypes ((V!18695 0))(
  ( (V!18696 (val!6641 Int)) )
))
(declare-datatypes ((ValueCell!6253 0))(
  ( (ValueCellFull!6253 (v!8932 V!18695)) (EmptyCell!6253) )
))
(declare-datatypes ((array!30149 0))(
  ( (array!30150 (arr!14496 (Array (_ BitVec 32) ValueCell!6253)) (size!14848 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30149)

(declare-fun mapDefault!21496 () ValueCell!6253)

