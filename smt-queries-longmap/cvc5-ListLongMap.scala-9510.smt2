; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112834 () Bool)

(assert start!112834)

(declare-fun b_free!31063 () Bool)

(declare-fun b_next!31063 () Bool)

(assert (=> start!112834 (= b_free!31063 (not b_next!31063))))

(declare-fun tp!108839 () Bool)

(declare-fun b_and!50081 () Bool)

(assert (=> start!112834 (= tp!108839 b_and!50081)))

(declare-fun b!1338208 () Bool)

(declare-fun e!761974 () Bool)

(declare-fun e!761972 () Bool)

(declare-fun mapRes!57147 () Bool)

(assert (=> b!1338208 (= e!761974 (and e!761972 mapRes!57147))))

(declare-fun condMapEmpty!57147 () Bool)

(declare-datatypes ((V!54401 0))(
  ( (V!54402 (val!18561 Int)) )
))
(declare-datatypes ((ValueCell!17588 0))(
  ( (ValueCellFull!17588 (v!21206 V!54401)) (EmptyCell!17588) )
))
(declare-datatypes ((array!90806 0))(
  ( (array!90807 (arr!43865 (Array (_ BitVec 32) ValueCell!17588)) (size!44415 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90806)

(declare-fun mapDefault!57147 () ValueCell!17588)

