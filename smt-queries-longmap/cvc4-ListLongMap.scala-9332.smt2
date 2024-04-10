; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111432 () Bool)

(assert start!111432)

(declare-fun b_free!30089 () Bool)

(declare-fun b_next!30089 () Bool)

(assert (=> start!111432 (= b_free!30089 (not b_next!30089))))

(declare-fun tp!105743 () Bool)

(declare-fun b_and!48337 () Bool)

(assert (=> start!111432 (= tp!105743 b_and!48337)))

(declare-fun mapNonEmpty!55511 () Bool)

(declare-fun mapRes!55511 () Bool)

(declare-fun tp!105742 () Bool)

(declare-fun e!752508 () Bool)

(assert (=> mapNonEmpty!55511 (= mapRes!55511 (and tp!105742 e!752508))))

(declare-datatypes ((V!52981 0))(
  ( (V!52982 (val!18029 Int)) )
))
(declare-datatypes ((ValueCell!17056 0))(
  ( (ValueCellFull!17056 (v!20659 V!52981)) (EmptyCell!17056) )
))
(declare-datatypes ((array!88762 0))(
  ( (array!88763 (arr!42855 (Array (_ BitVec 32) ValueCell!17056)) (size!43405 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88762)

(declare-fun mapValue!55511 () ValueCell!17056)

(declare-fun mapKey!55511 () (_ BitVec 32))

(declare-fun mapRest!55511 () (Array (_ BitVec 32) ValueCell!17056))

(assert (=> mapNonEmpty!55511 (= (arr!42855 _values!1337) (store mapRest!55511 mapKey!55511 mapValue!55511))))

(declare-fun b!1318775 () Bool)

(declare-fun e!752507 () Bool)

(declare-fun e!752505 () Bool)

(assert (=> b!1318775 (= e!752507 (and e!752505 mapRes!55511))))

(declare-fun condMapEmpty!55511 () Bool)

(declare-fun mapDefault!55511 () ValueCell!17056)

