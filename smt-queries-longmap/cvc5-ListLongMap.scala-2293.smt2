; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37220 () Bool)

(assert start!37220)

(declare-fun b_free!8347 () Bool)

(declare-fun b_next!8347 () Bool)

(assert (=> start!37220 (= b_free!8347 (not b_next!8347))))

(declare-fun tp!29756 () Bool)

(declare-fun b_and!15589 () Bool)

(assert (=> start!37220 (= tp!29756 b_and!15589)))

(declare-fun b!376251 () Bool)

(declare-fun e!229159 () Bool)

(declare-fun tp_is_empty!8995 () Bool)

(assert (=> b!376251 (= e!229159 tp_is_empty!8995)))

(declare-fun b!376252 () Bool)

(declare-fun res!212598 () Bool)

(declare-fun e!229166 () Bool)

(assert (=> b!376252 (=> (not res!212598) (not e!229166))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376252 (= res!212598 (validKeyInArray!0 k!778))))

(declare-fun b!376253 () Bool)

(declare-fun e!229165 () Bool)

(declare-fun e!229162 () Bool)

(declare-fun mapRes!15057 () Bool)

(assert (=> b!376253 (= e!229165 (and e!229162 mapRes!15057))))

(declare-fun condMapEmpty!15057 () Bool)

(declare-datatypes ((V!13099 0))(
  ( (V!13100 (val!4542 Int)) )
))
(declare-datatypes ((ValueCell!4154 0))(
  ( (ValueCellFull!4154 (v!6739 V!13099)) (EmptyCell!4154) )
))
(declare-datatypes ((array!21921 0))(
  ( (array!21922 (arr!10429 (Array (_ BitVec 32) ValueCell!4154)) (size!10781 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21921)

(declare-fun mapDefault!15057 () ValueCell!4154)

