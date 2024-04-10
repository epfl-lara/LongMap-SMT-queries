; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113400 () Bool)

(assert start!113400)

(declare-fun b_free!31451 () Bool)

(declare-fun b_next!31451 () Bool)

(assert (=> start!113400 (= b_free!31451 (not b_next!31451))))

(declare-fun tp!110157 () Bool)

(declare-fun b_and!50739 () Bool)

(assert (=> start!113400 (= tp!110157 b_and!50739)))

(declare-fun b!1346154 () Bool)

(declare-fun e!765940 () Bool)

(declare-fun e!765942 () Bool)

(declare-fun mapRes!57883 () Bool)

(assert (=> b!1346154 (= e!765940 (and e!765942 mapRes!57883))))

(declare-fun condMapEmpty!57883 () Bool)

(declare-datatypes ((V!55037 0))(
  ( (V!55038 (val!18800 Int)) )
))
(declare-datatypes ((ValueCell!17827 0))(
  ( (ValueCellFull!17827 (v!21448 V!55037)) (EmptyCell!17827) )
))
(declare-datatypes ((array!91740 0))(
  ( (array!91741 (arr!44326 (Array (_ BitVec 32) ValueCell!17827)) (size!44876 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91740)

(declare-fun mapDefault!57883 () ValueCell!17827)

