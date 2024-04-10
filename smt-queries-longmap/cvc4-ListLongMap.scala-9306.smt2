; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111238 () Bool)

(assert start!111238)

(declare-fun mapNonEmpty!55265 () Bool)

(declare-fun mapRes!55265 () Bool)

(declare-fun tp!105371 () Bool)

(declare-fun e!751248 () Bool)

(assert (=> mapNonEmpty!55265 (= mapRes!55265 (and tp!105371 e!751248))))

(declare-fun mapKey!55265 () (_ BitVec 32))

(declare-datatypes ((V!52773 0))(
  ( (V!52774 (val!17951 Int)) )
))
(declare-datatypes ((ValueCell!16978 0))(
  ( (ValueCellFull!16978 (v!20580 V!52773)) (EmptyCell!16978) )
))
(declare-datatypes ((array!88464 0))(
  ( (array!88465 (arr!42710 (Array (_ BitVec 32) ValueCell!16978)) (size!43260 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88464)

(declare-fun mapRest!55265 () (Array (_ BitVec 32) ValueCell!16978))

(declare-fun mapValue!55265 () ValueCell!16978)

(assert (=> mapNonEmpty!55265 (= (arr!42710 _values!1337) (store mapRest!55265 mapKey!55265 mapValue!55265))))

(declare-fun mapIsEmpty!55265 () Bool)

(assert (=> mapIsEmpty!55265 mapRes!55265))

(declare-fun b!1316789 () Bool)

(declare-fun e!751246 () Bool)

(declare-datatypes ((array!88466 0))(
  ( (array!88467 (arr!42711 (Array (_ BitVec 32) (_ BitVec 64))) (size!43261 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88466)

(assert (=> b!1316789 (= e!751246 (bvsgt #b00000000000000000000000000000000 (size!43261 _keys!1609)))))

(declare-fun b!1316790 () Bool)

(declare-fun e!751249 () Bool)

(declare-fun e!751247 () Bool)

(assert (=> b!1316790 (= e!751249 (and e!751247 mapRes!55265))))

(declare-fun condMapEmpty!55265 () Bool)

(declare-fun mapDefault!55265 () ValueCell!16978)

