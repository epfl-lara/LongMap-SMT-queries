; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113222 () Bool)

(assert start!113222)

(declare-fun b_free!31273 () Bool)

(declare-fun b_next!31273 () Bool)

(assert (=> start!113222 (= b_free!31273 (not b_next!31273))))

(declare-fun tp!109623 () Bool)

(declare-fun b_and!50453 () Bool)

(assert (=> start!113222 (= tp!109623 b_and!50453)))

(declare-fun b!1343081 () Bool)

(declare-fun res!891082 () Bool)

(declare-fun e!764527 () Bool)

(assert (=> b!1343081 (=> (not res!891082) (not e!764527))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1343081 (= res!891082 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1343082 () Bool)

(declare-fun res!891088 () Bool)

(assert (=> b!1343082 (=> (not res!891088) (not e!764527))))

(declare-datatypes ((array!91394 0))(
  ( (array!91395 (arr!44153 (Array (_ BitVec 32) (_ BitVec 64))) (size!44703 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91394)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343082 (= res!891088 (validKeyInArray!0 (select (arr!44153 _keys!1571) from!1960)))))

(declare-fun b!1343083 () Bool)

(declare-fun e!764528 () Bool)

(declare-fun e!764524 () Bool)

(declare-fun mapRes!57616 () Bool)

(assert (=> b!1343083 (= e!764528 (and e!764524 mapRes!57616))))

(declare-fun condMapEmpty!57616 () Bool)

(declare-datatypes ((V!54801 0))(
  ( (V!54802 (val!18711 Int)) )
))
(declare-datatypes ((ValueCell!17738 0))(
  ( (ValueCellFull!17738 (v!21359 V!54801)) (EmptyCell!17738) )
))
(declare-datatypes ((array!91396 0))(
  ( (array!91397 (arr!44154 (Array (_ BitVec 32) ValueCell!17738)) (size!44704 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91396)

(declare-fun mapDefault!57616 () ValueCell!17738)

