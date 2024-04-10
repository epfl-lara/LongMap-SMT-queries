; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38728 () Bool)

(assert start!38728)

(declare-fun b_free!9265 () Bool)

(declare-fun b_next!9265 () Bool)

(assert (=> start!38728 (= b_free!9265 (not b_next!9265))))

(declare-fun tp!32919 () Bool)

(declare-fun b_and!16651 () Bool)

(assert (=> start!38728 (= tp!32919 b_and!16651)))

(declare-fun b!403216 () Bool)

(declare-fun res!232347 () Bool)

(declare-fun e!242786 () Bool)

(assert (=> b!403216 (=> (not res!232347) (not e!242786))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403216 (= res!232347 (validKeyInArray!0 k!794))))

(declare-fun b!403217 () Bool)

(declare-fun e!242787 () Bool)

(declare-fun e!242784 () Bool)

(declare-fun mapRes!16842 () Bool)

(assert (=> b!403217 (= e!242787 (and e!242784 mapRes!16842))))

(declare-fun condMapEmpty!16842 () Bool)

(declare-datatypes ((V!14635 0))(
  ( (V!14636 (val!5118 Int)) )
))
(declare-datatypes ((ValueCell!4730 0))(
  ( (ValueCellFull!4730 (v!7365 V!14635)) (EmptyCell!4730) )
))
(declare-datatypes ((array!24197 0))(
  ( (array!24198 (arr!11548 (Array (_ BitVec 32) ValueCell!4730)) (size!11900 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24197)

(declare-fun mapDefault!16842 () ValueCell!4730)

