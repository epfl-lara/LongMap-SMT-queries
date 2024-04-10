; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43394 () Bool)

(assert start!43394)

(declare-fun b_free!12221 () Bool)

(declare-fun b_next!12221 () Bool)

(assert (=> start!43394 (= b_free!12221 (not b_next!12221))))

(declare-fun tp!42940 () Bool)

(declare-fun b_and!20977 () Bool)

(assert (=> start!43394 (= tp!42940 b_and!20977)))

(declare-fun b!480858 () Bool)

(declare-fun e!282924 () Bool)

(declare-fun e!282925 () Bool)

(declare-fun mapRes!22303 () Bool)

(assert (=> b!480858 (= e!282924 (and e!282925 mapRes!22303))))

(declare-fun condMapEmpty!22303 () Bool)

(declare-datatypes ((V!19381 0))(
  ( (V!19382 (val!6914 Int)) )
))
(declare-datatypes ((ValueCell!6505 0))(
  ( (ValueCellFull!6505 (v!9205 V!19381)) (EmptyCell!6505) )
))
(declare-datatypes ((array!31131 0))(
  ( (array!31132 (arr!14970 (Array (_ BitVec 32) ValueCell!6505)) (size!15328 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31131)

(declare-fun mapDefault!22303 () ValueCell!6505)

