; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113414 () Bool)

(assert start!113414)

(declare-fun b_free!31465 () Bool)

(declare-fun b_next!31465 () Bool)

(assert (=> start!113414 (= b_free!31465 (not b_next!31465))))

(declare-fun tp!110200 () Bool)

(declare-fun b_and!50753 () Bool)

(assert (=> start!113414 (= tp!110200 b_and!50753)))

(declare-fun b!1346322 () Bool)

(declare-fun e!766049 () Bool)

(declare-fun e!766048 () Bool)

(declare-fun mapRes!57904 () Bool)

(assert (=> b!1346322 (= e!766049 (and e!766048 mapRes!57904))))

(declare-fun condMapEmpty!57904 () Bool)

(declare-datatypes ((V!55057 0))(
  ( (V!55058 (val!18807 Int)) )
))
(declare-datatypes ((ValueCell!17834 0))(
  ( (ValueCellFull!17834 (v!21455 V!55057)) (EmptyCell!17834) )
))
(declare-datatypes ((array!91766 0))(
  ( (array!91767 (arr!44339 (Array (_ BitVec 32) ValueCell!17834)) (size!44889 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91766)

(declare-fun mapDefault!57904 () ValueCell!17834)

