; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71346 () Bool)

(assert start!71346)

(declare-fun b_free!13445 () Bool)

(declare-fun b_next!13445 () Bool)

(assert (=> start!71346 (= b_free!13445 (not b_next!13445))))

(declare-fun tp!47106 () Bool)

(declare-fun b_and!22415 () Bool)

(assert (=> start!71346 (= tp!47106 b_and!22415)))

(declare-fun b!828607 () Bool)

(declare-fun e!461758 () Bool)

(declare-fun tp_is_empty!15155 () Bool)

(assert (=> b!828607 (= e!461758 tp_is_empty!15155)))

(declare-fun b!828608 () Bool)

(declare-fun e!461753 () Bool)

(declare-fun e!461752 () Bool)

(declare-fun mapRes!24370 () Bool)

(assert (=> b!828608 (= e!461753 (and e!461752 mapRes!24370))))

(declare-fun condMapEmpty!24370 () Bool)

(declare-datatypes ((V!25207 0))(
  ( (V!25208 (val!7625 Int)) )
))
(declare-datatypes ((ValueCell!7162 0))(
  ( (ValueCellFull!7162 (v!10062 V!25207)) (EmptyCell!7162) )
))
(declare-datatypes ((array!46476 0))(
  ( (array!46477 (arr!22279 (Array (_ BitVec 32) ValueCell!7162)) (size!22700 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46476)

(declare-fun mapDefault!24370 () ValueCell!7162)

