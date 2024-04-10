; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42204 () Bool)

(assert start!42204)

(declare-fun b_free!11723 () Bool)

(declare-fun b_next!11723 () Bool)

(assert (=> start!42204 (= b_free!11723 (not b_next!11723))))

(declare-fun tp!41194 () Bool)

(declare-fun b_and!20153 () Bool)

(assert (=> start!42204 (= tp!41194 b_and!20153)))

(declare-fun b!471057 () Bool)

(declare-fun e!276034 () Bool)

(declare-fun tp_is_empty!13151 () Bool)

(assert (=> b!471057 (= e!276034 tp_is_empty!13151)))

(declare-fun b!471058 () Bool)

(declare-fun e!276032 () Bool)

(declare-fun e!276031 () Bool)

(declare-fun mapRes!21430 () Bool)

(assert (=> b!471058 (= e!276032 (and e!276031 mapRes!21430))))

(declare-fun condMapEmpty!21430 () Bool)

(declare-datatypes ((V!18639 0))(
  ( (V!18640 (val!6620 Int)) )
))
(declare-datatypes ((ValueCell!6232 0))(
  ( (ValueCellFull!6232 (v!8911 V!18639)) (EmptyCell!6232) )
))
(declare-datatypes ((array!30069 0))(
  ( (array!30070 (arr!14457 (Array (_ BitVec 32) ValueCell!6232)) (size!14809 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30069)

(declare-fun mapDefault!21430 () ValueCell!6232)

