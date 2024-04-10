; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82858 () Bool)

(assert start!82858)

(declare-fun b_free!18985 () Bool)

(declare-fun b_next!18985 () Bool)

(assert (=> start!82858 (= b_free!18985 (not b_next!18985))))

(declare-fun tp!66083 () Bool)

(declare-fun b_and!30473 () Bool)

(assert (=> start!82858 (= tp!66083 b_and!30473)))

(declare-fun b!966623 () Bool)

(declare-fun e!544901 () Bool)

(declare-fun e!544900 () Bool)

(declare-fun mapRes!34684 () Bool)

(assert (=> b!966623 (= e!544901 (and e!544900 mapRes!34684))))

(declare-fun condMapEmpty!34684 () Bool)

(declare-datatypes ((V!34041 0))(
  ( (V!34042 (val!10947 Int)) )
))
(declare-datatypes ((ValueCell!10415 0))(
  ( (ValueCellFull!10415 (v!13505 V!34041)) (EmptyCell!10415) )
))
(declare-datatypes ((array!59665 0))(
  ( (array!59666 (arr!28701 (Array (_ BitVec 32) ValueCell!10415)) (size!29180 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59665)

(declare-fun mapDefault!34684 () ValueCell!10415)

