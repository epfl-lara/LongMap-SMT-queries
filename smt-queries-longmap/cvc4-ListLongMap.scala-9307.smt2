; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111252 () Bool)

(assert start!111252)

(declare-fun b!1316863 () Bool)

(declare-fun e!751309 () Bool)

(declare-fun tp_is_empty!35759 () Bool)

(assert (=> b!1316863 (= e!751309 tp_is_empty!35759)))

(declare-fun mapIsEmpty!55277 () Bool)

(declare-fun mapRes!55277 () Bool)

(assert (=> mapIsEmpty!55277 mapRes!55277))

(declare-fun b!1316864 () Bool)

(declare-fun e!751307 () Bool)

(declare-datatypes ((array!88478 0))(
  ( (array!88479 (arr!42716 (Array (_ BitVec 32) (_ BitVec 64))) (size!43266 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88478)

(assert (=> b!1316864 (= e!751307 (and (bvsle #b00000000000000000000000000000000 (size!43266 _keys!1609)) (bvsge (size!43266 _keys!1609) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!55277 () Bool)

(declare-fun tp!105383 () Bool)

(assert (=> mapNonEmpty!55277 (= mapRes!55277 (and tp!105383 e!751309))))

(declare-datatypes ((V!52781 0))(
  ( (V!52782 (val!17954 Int)) )
))
(declare-datatypes ((ValueCell!16981 0))(
  ( (ValueCellFull!16981 (v!20583 V!52781)) (EmptyCell!16981) )
))
(declare-datatypes ((array!88480 0))(
  ( (array!88481 (arr!42717 (Array (_ BitVec 32) ValueCell!16981)) (size!43267 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88480)

(declare-fun mapValue!55277 () ValueCell!16981)

(declare-fun mapKey!55277 () (_ BitVec 32))

(declare-fun mapRest!55277 () (Array (_ BitVec 32) ValueCell!16981))

(assert (=> mapNonEmpty!55277 (= (arr!42717 _values!1337) (store mapRest!55277 mapKey!55277 mapValue!55277))))

(declare-fun b!1316865 () Bool)

(declare-fun e!751306 () Bool)

(declare-fun e!751310 () Bool)

(assert (=> b!1316865 (= e!751306 (and e!751310 mapRes!55277))))

(declare-fun condMapEmpty!55277 () Bool)

(declare-fun mapDefault!55277 () ValueCell!16981)

