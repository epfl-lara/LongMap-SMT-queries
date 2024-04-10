; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43364 () Bool)

(assert start!43364)

(declare-fun b_free!12191 () Bool)

(declare-fun b_next!12191 () Bool)

(assert (=> start!43364 (= b_free!12191 (not b_next!12191))))

(declare-fun tp!42850 () Bool)

(declare-fun b_and!20947 () Bool)

(assert (=> start!43364 (= tp!42850 b_and!20947)))

(declare-fun b!480363 () Bool)

(declare-fun e!282657 () Bool)

(declare-fun e!282656 () Bool)

(declare-fun mapRes!22258 () Bool)

(assert (=> b!480363 (= e!282657 (and e!282656 mapRes!22258))))

(declare-fun condMapEmpty!22258 () Bool)

(declare-datatypes ((V!19341 0))(
  ( (V!19342 (val!6899 Int)) )
))
(declare-datatypes ((ValueCell!6490 0))(
  ( (ValueCellFull!6490 (v!9190 V!19341)) (EmptyCell!6490) )
))
(declare-datatypes ((array!31075 0))(
  ( (array!31076 (arr!14942 (Array (_ BitVec 32) ValueCell!6490)) (size!15300 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31075)

(declare-fun mapDefault!22258 () ValueCell!6490)

