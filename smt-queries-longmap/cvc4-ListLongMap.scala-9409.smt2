; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112022 () Bool)

(assert start!112022)

(declare-fun b!1327309 () Bool)

(declare-fun e!756565 () Bool)

(declare-fun tp_is_empty!36371 () Bool)

(assert (=> b!1327309 (= e!756565 tp_is_empty!36371)))

(declare-fun b!1327310 () Bool)

(declare-fun e!756562 () Bool)

(declare-fun e!756563 () Bool)

(declare-fun mapRes!56215 () Bool)

(assert (=> b!1327310 (= e!756562 (and e!756563 mapRes!56215))))

(declare-fun condMapEmpty!56215 () Bool)

(declare-datatypes ((V!53597 0))(
  ( (V!53598 (val!18260 Int)) )
))
(declare-datatypes ((ValueCell!17287 0))(
  ( (ValueCellFull!17287 (v!20896 V!53597)) (EmptyCell!17287) )
))
(declare-datatypes ((array!89650 0))(
  ( (array!89651 (arr!43296 (Array (_ BitVec 32) ValueCell!17287)) (size!43846 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89650)

(declare-fun mapDefault!56215 () ValueCell!17287)

