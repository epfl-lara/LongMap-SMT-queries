; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113256 () Bool)

(assert start!113256)

(declare-fun b_free!31307 () Bool)

(declare-fun b_next!31307 () Bool)

(assert (=> start!113256 (= b_free!31307 (not b_next!31307))))

(declare-fun tp!109726 () Bool)

(declare-fun b_and!50521 () Bool)

(assert (=> start!113256 (= tp!109726 b_and!50521)))

(declare-fun b!1343727 () Bool)

(declare-fun res!891541 () Bool)

(declare-fun e!764780 () Bool)

(assert (=> b!1343727 (=> (not res!891541) (not e!764780))))

(declare-datatypes ((array!91458 0))(
  ( (array!91459 (arr!44185 (Array (_ BitVec 32) (_ BitVec 64))) (size!44735 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91458)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343727 (= res!891541 (validKeyInArray!0 (select (arr!44185 _keys!1571) from!1960)))))

(declare-fun b!1343728 () Bool)

(declare-fun e!764783 () Bool)

(declare-fun e!764779 () Bool)

(declare-fun mapRes!57667 () Bool)

(assert (=> b!1343728 (= e!764783 (and e!764779 mapRes!57667))))

(declare-fun condMapEmpty!57667 () Bool)

(declare-datatypes ((V!54845 0))(
  ( (V!54846 (val!18728 Int)) )
))
(declare-datatypes ((ValueCell!17755 0))(
  ( (ValueCellFull!17755 (v!21376 V!54845)) (EmptyCell!17755) )
))
(declare-datatypes ((array!91460 0))(
  ( (array!91461 (arr!44186 (Array (_ BitVec 32) ValueCell!17755)) (size!44736 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91460)

(declare-fun mapDefault!57667 () ValueCell!17755)

