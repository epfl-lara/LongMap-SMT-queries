; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!684 () Bool)

(assert start!684)

(declare-fun b_free!137 () Bool)

(declare-fun b_next!137 () Bool)

(assert (=> start!684 (= b_free!137 (not b_next!137))))

(declare-fun tp!631 () Bool)

(declare-fun b_and!277 () Bool)

(assert (=> start!684 (= tp!631 b_and!277)))

(declare-fun b!4597 () Bool)

(declare-fun e!2436 () Bool)

(declare-fun tp_is_empty!215 () Bool)

(assert (=> b!4597 (= e!2436 tp_is_empty!215)))

(declare-fun b!4598 () Bool)

(declare-fun e!2435 () Bool)

(declare-fun e!2438 () Bool)

(declare-fun mapRes!284 () Bool)

(assert (=> b!4598 (= e!2435 (and e!2438 mapRes!284))))

(declare-fun condMapEmpty!284 () Bool)

(declare-datatypes ((V!463 0))(
  ( (V!464 (val!113 Int)) )
))
(declare-datatypes ((ValueCell!91 0))(
  ( (ValueCellFull!91 (v!1201 V!463)) (EmptyCell!91) )
))
(declare-datatypes ((array!363 0))(
  ( (array!364 (arr!173 (Array (_ BitVec 32) ValueCell!91)) (size!235 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!363)

(declare-fun mapDefault!284 () ValueCell!91)

