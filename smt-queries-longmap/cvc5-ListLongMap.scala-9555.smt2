; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113192 () Bool)

(assert start!113192)

(declare-fun b_free!31243 () Bool)

(declare-fun b_next!31243 () Bool)

(assert (=> start!113192 (= b_free!31243 (not b_next!31243))))

(declare-fun tp!109533 () Bool)

(declare-fun b_and!50393 () Bool)

(assert (=> start!113192 (= tp!109533 b_and!50393)))

(declare-fun b!1342511 () Bool)

(declare-fun e!764300 () Bool)

(declare-fun e!764301 () Bool)

(declare-fun mapRes!57571 () Bool)

(assert (=> b!1342511 (= e!764300 (and e!764301 mapRes!57571))))

(declare-fun condMapEmpty!57571 () Bool)

(declare-datatypes ((V!54761 0))(
  ( (V!54762 (val!18696 Int)) )
))
(declare-datatypes ((ValueCell!17723 0))(
  ( (ValueCellFull!17723 (v!21344 V!54761)) (EmptyCell!17723) )
))
(declare-datatypes ((array!91336 0))(
  ( (array!91337 (arr!44124 (Array (_ BitVec 32) ValueCell!17723)) (size!44674 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91336)

(declare-fun mapDefault!57571 () ValueCell!17723)

