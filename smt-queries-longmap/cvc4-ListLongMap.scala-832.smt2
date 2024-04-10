; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20092 () Bool)

(assert start!20092)

(declare-fun b_free!4751 () Bool)

(declare-fun b_next!4751 () Bool)

(assert (=> start!20092 (= b_free!4751 (not b_next!4751))))

(declare-fun tp!17284 () Bool)

(declare-fun b_and!11497 () Bool)

(assert (=> start!20092 (= tp!17284 b_and!11497)))

(declare-fun b!196814 () Bool)

(declare-fun e!129614 () Bool)

(declare-fun tp_is_empty!4607 () Bool)

(assert (=> b!196814 (= e!129614 tp_is_empty!4607)))

(declare-fun b!196815 () Bool)

(declare-fun e!129612 () Bool)

(declare-fun e!129611 () Bool)

(declare-fun mapRes!7979 () Bool)

(assert (=> b!196815 (= e!129612 (and e!129611 mapRes!7979))))

(declare-fun condMapEmpty!7979 () Bool)

(declare-datatypes ((V!5789 0))(
  ( (V!5790 (val!2348 Int)) )
))
(declare-datatypes ((ValueCell!1960 0))(
  ( (ValueCellFull!1960 (v!4318 V!5789)) (EmptyCell!1960) )
))
(declare-datatypes ((array!8471 0))(
  ( (array!8472 (arr!3986 (Array (_ BitVec 32) ValueCell!1960)) (size!4311 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8471)

(declare-fun mapDefault!7979 () ValueCell!1960)

