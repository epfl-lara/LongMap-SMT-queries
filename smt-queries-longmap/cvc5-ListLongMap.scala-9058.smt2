; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109132 () Bool)

(assert start!109132)

(declare-fun b_free!28621 () Bool)

(declare-fun b_next!28621 () Bool)

(assert (=> start!109132 (= b_free!28621 (not b_next!28621))))

(declare-fun tp!100982 () Bool)

(declare-fun b_and!46711 () Bool)

(assert (=> start!109132 (= tp!100982 b_and!46711)))

(declare-fun b!1290461 () Bool)

(declare-fun res!857285 () Bool)

(declare-fun e!736730 () Bool)

(assert (=> b!1290461 (=> (not res!857285) (not e!736730))))

(declare-datatypes ((array!85562 0))(
  ( (array!85563 (arr!41282 (Array (_ BitVec 32) (_ BitVec 64))) (size!41832 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85562)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290461 (= res!857285 (not (validKeyInArray!0 (select (arr!41282 _keys!1741) from!2144))))))

(declare-fun b!1290462 () Bool)

(declare-fun res!857292 () Bool)

(assert (=> b!1290462 (=> (not res!857292) (not e!736730))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1290462 (= res!857292 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41832 _keys!1741))))))

(declare-fun b!1290464 () Bool)

(declare-fun e!736726 () Bool)

(declare-fun tp_is_empty!34261 () Bool)

(assert (=> b!1290464 (= e!736726 tp_is_empty!34261)))

(declare-fun mapIsEmpty!52952 () Bool)

(declare-fun mapRes!52952 () Bool)

(assert (=> mapIsEmpty!52952 mapRes!52952))

(declare-fun b!1290465 () Bool)

(declare-fun res!857290 () Bool)

(assert (=> b!1290465 (=> (not res!857290) (not e!736730))))

(assert (=> b!1290465 (= res!857290 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41832 _keys!1741))))))

(declare-fun b!1290466 () Bool)

(declare-fun res!857291 () Bool)

(assert (=> b!1290466 (=> (not res!857291) (not e!736730))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50785 0))(
  ( (V!50786 (val!17205 Int)) )
))
(declare-datatypes ((ValueCell!16232 0))(
  ( (ValueCellFull!16232 (v!19808 V!50785)) (EmptyCell!16232) )
))
(declare-datatypes ((array!85564 0))(
  ( (array!85565 (arr!41283 (Array (_ BitVec 32) ValueCell!16232)) (size!41833 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85564)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1290466 (= res!857291 (and (= (size!41833 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41832 _keys!1741) (size!41833 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!857284 () Bool)

(assert (=> start!109132 (=> (not res!857284) (not e!736730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109132 (= res!857284 (validMask!0 mask!2175))))

(assert (=> start!109132 e!736730))

(assert (=> start!109132 tp_is_empty!34261))

(assert (=> start!109132 true))

(declare-fun e!736727 () Bool)

(declare-fun array_inv!31287 (array!85564) Bool)

(assert (=> start!109132 (and (array_inv!31287 _values!1445) e!736727)))

(declare-fun array_inv!31288 (array!85562) Bool)

(assert (=> start!109132 (array_inv!31288 _keys!1741)))

(assert (=> start!109132 tp!100982))

(declare-fun b!1290463 () Bool)

(declare-fun e!736725 () Bool)

(assert (=> b!1290463 (= e!736725 tp_is_empty!34261)))

(declare-fun b!1290467 () Bool)

(assert (=> b!1290467 (= e!736727 (and e!736725 mapRes!52952))))

(declare-fun condMapEmpty!52952 () Bool)

(declare-fun mapDefault!52952 () ValueCell!16232)

