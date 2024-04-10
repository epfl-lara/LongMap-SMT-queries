; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33534 () Bool)

(assert start!33534)

(declare-fun b_free!6823 () Bool)

(declare-fun b_next!6823 () Bool)

(assert (=> start!33534 (= b_free!6823 (not b_next!6823))))

(declare-fun tp!23963 () Bool)

(declare-fun b_and!13997 () Bool)

(assert (=> start!33534 (= tp!23963 b_and!13997)))

(declare-fun b!332825 () Bool)

(declare-fun e!204377 () Bool)

(declare-fun e!204374 () Bool)

(declare-fun mapRes!11550 () Bool)

(assert (=> b!332825 (= e!204377 (and e!204374 mapRes!11550))))

(declare-fun condMapEmpty!11550 () Bool)

(declare-datatypes ((V!10011 0))(
  ( (V!10012 (val!3432 Int)) )
))
(declare-datatypes ((ValueCell!3044 0))(
  ( (ValueCellFull!3044 (v!5591 V!10011)) (EmptyCell!3044) )
))
(declare-datatypes ((array!17145 0))(
  ( (array!17146 (arr!8106 (Array (_ BitVec 32) ValueCell!3044)) (size!8458 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17145)

(declare-fun mapDefault!11550 () ValueCell!3044)

