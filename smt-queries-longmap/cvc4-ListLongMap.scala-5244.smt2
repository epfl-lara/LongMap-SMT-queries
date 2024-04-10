; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70568 () Bool)

(assert start!70568)

(declare-fun b_free!12875 () Bool)

(declare-fun b_next!12875 () Bool)

(assert (=> start!70568 (= b_free!12875 (not b_next!12875))))

(declare-fun tp!45361 () Bool)

(declare-fun b_and!21717 () Bool)

(assert (=> start!70568 (= tp!45361 b_and!21717)))

(declare-fun b!819764 () Bool)

(declare-fun e!455305 () Bool)

(declare-fun e!455310 () Bool)

(declare-fun mapRes!23479 () Bool)

(assert (=> b!819764 (= e!455305 (and e!455310 mapRes!23479))))

(declare-fun condMapEmpty!23479 () Bool)

(declare-datatypes ((V!24447 0))(
  ( (V!24448 (val!7340 Int)) )
))
(declare-datatypes ((ValueCell!6877 0))(
  ( (ValueCellFull!6877 (v!9770 V!24447)) (EmptyCell!6877) )
))
(declare-datatypes ((array!45368 0))(
  ( (array!45369 (arr!21737 (Array (_ BitVec 32) ValueCell!6877)) (size!22158 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45368)

(declare-fun mapDefault!23479 () ValueCell!6877)

