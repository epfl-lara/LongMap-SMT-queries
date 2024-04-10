; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109076 () Bool)

(assert start!109076)

(declare-fun b_free!28565 () Bool)

(declare-fun b_next!28565 () Bool)

(assert (=> start!109076 (= b_free!28565 (not b_next!28565))))

(declare-fun tp!100813 () Bool)

(declare-fun b_and!46655 () Bool)

(assert (=> start!109076 (= tp!100813 b_and!46655)))

(declare-fun b!1289453 () Bool)

(declare-fun res!856529 () Bool)

(declare-fun e!736221 () Bool)

(assert (=> b!1289453 (=> (not res!856529) (not e!736221))))

(declare-datatypes ((array!85452 0))(
  ( (array!85453 (arr!41227 (Array (_ BitVec 32) (_ BitVec 64))) (size!41777 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85452)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289453 (= res!856529 (not (validKeyInArray!0 (select (arr!41227 _keys!1741) from!2144))))))

(declare-fun b!1289454 () Bool)

(declare-fun res!856535 () Bool)

(assert (=> b!1289454 (=> (not res!856535) (not e!736221))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1289454 (= res!856535 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41777 _keys!1741))))))

(declare-fun mapNonEmpty!52868 () Bool)

(declare-fun mapRes!52868 () Bool)

(declare-fun tp!100814 () Bool)

(declare-fun e!736222 () Bool)

(assert (=> mapNonEmpty!52868 (= mapRes!52868 (and tp!100814 e!736222))))

(declare-datatypes ((V!50709 0))(
  ( (V!50710 (val!17177 Int)) )
))
(declare-datatypes ((ValueCell!16204 0))(
  ( (ValueCellFull!16204 (v!19780 V!50709)) (EmptyCell!16204) )
))
(declare-fun mapValue!52868 () ValueCell!16204)

(declare-fun mapKey!52868 () (_ BitVec 32))

(declare-datatypes ((array!85454 0))(
  ( (array!85455 (arr!41228 (Array (_ BitVec 32) ValueCell!16204)) (size!41778 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85454)

(declare-fun mapRest!52868 () (Array (_ BitVec 32) ValueCell!16204))

(assert (=> mapNonEmpty!52868 (= (arr!41228 _values!1445) (store mapRest!52868 mapKey!52868 mapValue!52868))))

(declare-fun b!1289456 () Bool)

(declare-fun res!856531 () Bool)

(assert (=> b!1289456 (=> (not res!856531) (not e!736221))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1289456 (= res!856531 (and (= (size!41778 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41777 _keys!1741) (size!41778 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289457 () Bool)

(declare-fun e!736226 () Bool)

(declare-fun e!736225 () Bool)

(assert (=> b!1289457 (= e!736226 (and e!736225 mapRes!52868))))

(declare-fun condMapEmpty!52868 () Bool)

(declare-fun mapDefault!52868 () ValueCell!16204)

