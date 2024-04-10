; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111434 () Bool)

(assert start!111434)

(declare-fun b_free!30091 () Bool)

(declare-fun b_next!30091 () Bool)

(assert (=> start!111434 (= b_free!30091 (not b_next!30091))))

(declare-fun tp!105748 () Bool)

(declare-fun b_and!48341 () Bool)

(assert (=> start!111434 (= tp!105748 b_and!48341)))

(declare-fun mapNonEmpty!55514 () Bool)

(declare-fun mapRes!55514 () Bool)

(declare-fun tp!105749 () Bool)

(declare-fun e!752523 () Bool)

(assert (=> mapNonEmpty!55514 (= mapRes!55514 (and tp!105749 e!752523))))

(declare-datatypes ((V!52985 0))(
  ( (V!52986 (val!18030 Int)) )
))
(declare-datatypes ((ValueCell!17057 0))(
  ( (ValueCellFull!17057 (v!20660 V!52985)) (EmptyCell!17057) )
))
(declare-datatypes ((array!88764 0))(
  ( (array!88765 (arr!42856 (Array (_ BitVec 32) ValueCell!17057)) (size!43406 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88764)

(declare-fun mapRest!55514 () (Array (_ BitVec 32) ValueCell!17057))

(declare-fun mapKey!55514 () (_ BitVec 32))

(declare-fun mapValue!55514 () ValueCell!17057)

(assert (=> mapNonEmpty!55514 (= (arr!42856 _values!1337) (store mapRest!55514 mapKey!55514 mapValue!55514))))

(declare-fun res!875271 () Bool)

(declare-fun e!752520 () Bool)

(assert (=> start!111434 (=> (not res!875271) (not e!752520))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111434 (= res!875271 (validMask!0 mask!2019))))

(assert (=> start!111434 e!752520))

(declare-datatypes ((array!88766 0))(
  ( (array!88767 (arr!42857 (Array (_ BitVec 32) (_ BitVec 64))) (size!43407 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88766)

(declare-fun array_inv!32359 (array!88766) Bool)

(assert (=> start!111434 (array_inv!32359 _keys!1609)))

(assert (=> start!111434 true))

(declare-fun tp_is_empty!35911 () Bool)

(assert (=> start!111434 tp_is_empty!35911))

(declare-fun e!752521 () Bool)

(declare-fun array_inv!32360 (array!88764) Bool)

(assert (=> start!111434 (and (array_inv!32360 _values!1337) e!752521)))

(assert (=> start!111434 tp!105748))

(declare-fun b!1318810 () Bool)

(declare-fun e!752522 () Bool)

(assert (=> b!1318810 (= e!752521 (and e!752522 mapRes!55514))))

(declare-fun condMapEmpty!55514 () Bool)

(declare-fun mapDefault!55514 () ValueCell!17057)

