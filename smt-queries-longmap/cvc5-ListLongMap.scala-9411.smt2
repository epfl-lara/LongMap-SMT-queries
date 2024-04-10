; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112044 () Bool)

(assert start!112044)

(declare-fun b!1327407 () Bool)

(declare-fun e!756643 () Bool)

(declare-fun e!756644 () Bool)

(declare-fun mapRes!56233 () Bool)

(assert (=> b!1327407 (= e!756643 (and e!756644 mapRes!56233))))

(declare-fun condMapEmpty!56233 () Bool)

(declare-datatypes ((V!53609 0))(
  ( (V!53610 (val!18264 Int)) )
))
(declare-datatypes ((ValueCell!17291 0))(
  ( (ValueCellFull!17291 (v!20900 V!53609)) (EmptyCell!17291) )
))
(declare-datatypes ((array!89666 0))(
  ( (array!89667 (arr!43302 (Array (_ BitVec 32) ValueCell!17291)) (size!43852 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89666)

(declare-fun mapDefault!56233 () ValueCell!17291)

