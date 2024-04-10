; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82952 () Bool)

(assert start!82952)

(declare-fun b_free!19079 () Bool)

(declare-fun b_next!19079 () Bool)

(assert (=> start!82952 (= b_free!19079 (not b_next!19079))))

(declare-fun tp!66366 () Bool)

(declare-fun b_and!30567 () Bool)

(assert (=> start!82952 (= tp!66366 b_and!30567)))

(declare-fun b!968150 () Bool)

(declare-fun e!545614 () Bool)

(declare-fun e!545611 () Bool)

(declare-fun mapRes!34825 () Bool)

(assert (=> b!968150 (= e!545614 (and e!545611 mapRes!34825))))

(declare-fun condMapEmpty!34825 () Bool)

(declare-datatypes ((V!34165 0))(
  ( (V!34166 (val!10994 Int)) )
))
(declare-datatypes ((ValueCell!10462 0))(
  ( (ValueCellFull!10462 (v!13552 V!34165)) (EmptyCell!10462) )
))
(declare-datatypes ((array!59847 0))(
  ( (array!59848 (arr!28792 (Array (_ BitVec 32) ValueCell!10462)) (size!29271 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59847)

(declare-fun mapDefault!34825 () ValueCell!10462)

