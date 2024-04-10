; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34986 () Bool)

(assert start!34986)

(declare-fun b_free!7675 () Bool)

(declare-fun b_next!7675 () Bool)

(assert (=> start!34986 (= b_free!7675 (not b_next!7675))))

(declare-fun tp!26604 () Bool)

(declare-fun b_and!14905 () Bool)

(assert (=> start!34986 (= tp!26604 b_and!14905)))

(declare-fun b!350381 () Bool)

(declare-fun res!194159 () Bool)

(declare-fun e!214633 () Bool)

(assert (=> b!350381 (=> (not res!194159) (not e!214633))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350381 (= res!194159 (validKeyInArray!0 k!1348))))

(declare-fun b!350382 () Bool)

(declare-fun res!194158 () Bool)

(assert (=> b!350382 (=> (not res!194158) (not e!214633))))

(declare-datatypes ((array!18841 0))(
  ( (array!18842 (arr!8926 (Array (_ BitVec 32) (_ BitVec 64))) (size!9278 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18841)

(declare-datatypes ((List!5193 0))(
  ( (Nil!5190) (Cons!5189 (h!6045 (_ BitVec 64)) (t!10331 List!5193)) )
))
(declare-fun arrayNoDuplicates!0 (array!18841 (_ BitVec 32) List!5193) Bool)

(assert (=> b!350382 (= res!194158 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5190))))

(declare-fun b!350383 () Bool)

(declare-fun res!194153 () Bool)

(declare-fun e!214628 () Bool)

(assert (=> b!350383 (=> (not res!194153) (not e!214628))))

(declare-fun arrayContainsKey!0 (array!18841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350383 (= res!194153 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!350384 () Bool)

(declare-fun e!214629 () Bool)

(declare-fun e!214630 () Bool)

(declare-fun mapRes!12912 () Bool)

(assert (=> b!350384 (= e!214629 (and e!214630 mapRes!12912))))

(declare-fun condMapEmpty!12912 () Bool)

(declare-datatypes ((V!11147 0))(
  ( (V!11148 (val!3858 Int)) )
))
(declare-datatypes ((ValueCell!3470 0))(
  ( (ValueCellFull!3470 (v!6045 V!11147)) (EmptyCell!3470) )
))
(declare-datatypes ((array!18843 0))(
  ( (array!18844 (arr!8927 (Array (_ BitVec 32) ValueCell!3470)) (size!9279 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18843)

(declare-fun mapDefault!12912 () ValueCell!3470)

