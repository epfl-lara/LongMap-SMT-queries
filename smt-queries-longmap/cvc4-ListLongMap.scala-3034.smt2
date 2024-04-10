; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42582 () Bool)

(assert start!42582)

(declare-fun b_free!12017 () Bool)

(declare-fun b_next!12017 () Bool)

(assert (=> start!42582 (= b_free!12017 (not b_next!12017))))

(declare-fun tp!42091 () Bool)

(declare-fun b_and!20497 () Bool)

(assert (=> start!42582 (= tp!42091 b_and!20497)))

(declare-fun mapIsEmpty!21886 () Bool)

(declare-fun mapRes!21886 () Bool)

(assert (=> mapIsEmpty!21886 mapRes!21886))

(declare-fun b!475068 () Bool)

(declare-fun e!278910 () Bool)

(declare-fun e!278913 () Bool)

(assert (=> b!475068 (= e!278910 (and e!278913 mapRes!21886))))

(declare-fun condMapEmpty!21886 () Bool)

(declare-datatypes ((V!19031 0))(
  ( (V!19032 (val!6767 Int)) )
))
(declare-datatypes ((ValueCell!6379 0))(
  ( (ValueCellFull!6379 (v!9060 V!19031)) (EmptyCell!6379) )
))
(declare-datatypes ((array!30631 0))(
  ( (array!30632 (arr!14733 (Array (_ BitVec 32) ValueCell!6379)) (size!15085 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30631)

(declare-fun mapDefault!21886 () ValueCell!6379)

