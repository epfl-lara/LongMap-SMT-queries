; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111702 () Bool)

(assert start!111702)

(declare-fun b_free!30359 () Bool)

(declare-fun b_next!30359 () Bool)

(assert (=> start!111702 (= b_free!30359 (not b_next!30359))))

(declare-fun tp!106552 () Bool)

(declare-fun b_and!48877 () Bool)

(assert (=> start!111702 (= tp!106552 b_and!48877)))

(declare-fun b!1323500 () Bool)

(declare-fun e!754531 () Bool)

(declare-fun e!754534 () Bool)

(declare-fun mapRes!55916 () Bool)

(assert (=> b!1323500 (= e!754531 (and e!754534 mapRes!55916))))

(declare-fun condMapEmpty!55916 () Bool)

(declare-datatypes ((V!53341 0))(
  ( (V!53342 (val!18164 Int)) )
))
(declare-datatypes ((ValueCell!17191 0))(
  ( (ValueCellFull!17191 (v!20794 V!53341)) (EmptyCell!17191) )
))
(declare-datatypes ((array!89276 0))(
  ( (array!89277 (arr!43112 (Array (_ BitVec 32) ValueCell!17191)) (size!43662 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89276)

(declare-fun mapDefault!55916 () ValueCell!17191)

