; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33938 () Bool)

(assert start!33938)

(declare-fun b_free!7093 () Bool)

(declare-fun b_next!7093 () Bool)

(assert (=> start!33938 (= b_free!7093 (not b_next!7093))))

(declare-fun tp!24795 () Bool)

(declare-fun b_and!14281 () Bool)

(assert (=> start!33938 (= tp!24795 b_and!14281)))

(declare-fun b!338013 () Bool)

(declare-fun e!207399 () Bool)

(declare-fun tp_is_empty!7045 () Bool)

(assert (=> b!338013 (= e!207399 tp_is_empty!7045)))

(declare-fun b!338014 () Bool)

(declare-fun e!207404 () Bool)

(declare-fun mapRes!11976 () Bool)

(assert (=> b!338014 (= e!207404 (and e!207399 mapRes!11976))))

(declare-fun condMapEmpty!11976 () Bool)

(declare-datatypes ((V!10371 0))(
  ( (V!10372 (val!3567 Int)) )
))
(declare-datatypes ((ValueCell!3179 0))(
  ( (ValueCellFull!3179 (v!5733 V!10371)) (EmptyCell!3179) )
))
(declare-datatypes ((array!17685 0))(
  ( (array!17686 (arr!8369 (Array (_ BitVec 32) ValueCell!3179)) (size!8721 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17685)

(declare-fun mapDefault!11976 () ValueCell!3179)

