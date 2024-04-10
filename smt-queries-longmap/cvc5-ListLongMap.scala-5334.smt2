; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71264 () Bool)

(assert start!71264)

(declare-fun b_free!13411 () Bool)

(declare-fun b_next!13411 () Bool)

(assert (=> start!71264 (= b_free!13411 (not b_next!13411))))

(declare-fun tp!46996 () Bool)

(declare-fun b_and!22349 () Bool)

(assert (=> start!71264 (= tp!46996 b_and!22349)))

(declare-fun b!827764 () Bool)

(declare-fun e!461171 () Bool)

(declare-fun e!461173 () Bool)

(declare-fun mapRes!24310 () Bool)

(assert (=> b!827764 (= e!461171 (and e!461173 mapRes!24310))))

(declare-fun condMapEmpty!24310 () Bool)

(declare-datatypes ((V!25163 0))(
  ( (V!25164 (val!7608 Int)) )
))
(declare-datatypes ((ValueCell!7145 0))(
  ( (ValueCellFull!7145 (v!10043 V!25163)) (EmptyCell!7145) )
))
(declare-datatypes ((array!46408 0))(
  ( (array!46409 (arr!22248 (Array (_ BitVec 32) ValueCell!7145)) (size!22669 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46408)

(declare-fun mapDefault!24310 () ValueCell!7145)

