; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113390 () Bool)

(assert start!113390)

(declare-fun b_free!31441 () Bool)

(declare-fun b_next!31441 () Bool)

(assert (=> start!113390 (= b_free!31441 (not b_next!31441))))

(declare-fun tp!110128 () Bool)

(declare-fun b_and!50729 () Bool)

(assert (=> start!113390 (= tp!110128 b_and!50729)))

(declare-fun b!1346034 () Bool)

(declare-fun e!765865 () Bool)

(declare-fun e!765867 () Bool)

(declare-fun mapRes!57868 () Bool)

(assert (=> b!1346034 (= e!765865 (and e!765867 mapRes!57868))))

(declare-fun condMapEmpty!57868 () Bool)

(declare-datatypes ((V!55025 0))(
  ( (V!55026 (val!18795 Int)) )
))
(declare-datatypes ((ValueCell!17822 0))(
  ( (ValueCellFull!17822 (v!21443 V!55025)) (EmptyCell!17822) )
))
(declare-datatypes ((array!91722 0))(
  ( (array!91723 (arr!44317 (Array (_ BitVec 32) ValueCell!17822)) (size!44867 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91722)

(declare-fun mapDefault!57868 () ValueCell!17822)

