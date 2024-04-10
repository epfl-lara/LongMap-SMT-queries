; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71222 () Bool)

(assert start!71222)

(declare-fun b_free!13369 () Bool)

(declare-fun b_next!13369 () Bool)

(assert (=> start!71222 (= b_free!13369 (not b_next!13369))))

(declare-fun tp!46869 () Bool)

(declare-fun b_and!22307 () Bool)

(assert (=> start!71222 (= tp!46869 b_and!22307)))

(declare-fun b!827323 () Bool)

(declare-fun e!460855 () Bool)

(declare-fun e!460859 () Bool)

(declare-fun mapRes!24247 () Bool)

(assert (=> b!827323 (= e!460855 (and e!460859 mapRes!24247))))

(declare-fun condMapEmpty!24247 () Bool)

(declare-datatypes ((V!25107 0))(
  ( (V!25108 (val!7587 Int)) )
))
(declare-datatypes ((ValueCell!7124 0))(
  ( (ValueCellFull!7124 (v!10022 V!25107)) (EmptyCell!7124) )
))
(declare-datatypes ((array!46336 0))(
  ( (array!46337 (arr!22212 (Array (_ BitVec 32) ValueCell!7124)) (size!22633 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46336)

(declare-fun mapDefault!24247 () ValueCell!7124)

