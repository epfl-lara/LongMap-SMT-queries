; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108980 () Bool)

(assert start!108980)

(declare-fun b_free!28469 () Bool)

(declare-fun b_next!28469 () Bool)

(assert (=> start!108980 (= b_free!28469 (not b_next!28469))))

(declare-fun tp!100525 () Bool)

(declare-fun b_and!46559 () Bool)

(assert (=> start!108980 (= tp!100525 b_and!46559)))

(declare-fun res!855272 () Bool)

(declare-fun e!735396 () Bool)

(assert (=> start!108980 (=> (not res!855272) (not e!735396))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108980 (= res!855272 (validMask!0 mask!2175))))

(assert (=> start!108980 e!735396))

(declare-fun tp_is_empty!34109 () Bool)

(assert (=> start!108980 tp_is_empty!34109))

(assert (=> start!108980 true))

(declare-datatypes ((V!50581 0))(
  ( (V!50582 (val!17129 Int)) )
))
(declare-datatypes ((ValueCell!16156 0))(
  ( (ValueCellFull!16156 (v!19732 V!50581)) (EmptyCell!16156) )
))
(declare-datatypes ((array!85268 0))(
  ( (array!85269 (arr!41135 (Array (_ BitVec 32) ValueCell!16156)) (size!41685 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85268)

(declare-fun e!735397 () Bool)

(declare-fun array_inv!31195 (array!85268) Bool)

(assert (=> start!108980 (and (array_inv!31195 _values!1445) e!735397)))

(declare-datatypes ((array!85270 0))(
  ( (array!85271 (arr!41136 (Array (_ BitVec 32) (_ BitVec 64))) (size!41686 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85270)

(declare-fun array_inv!31196 (array!85270) Bool)

(assert (=> start!108980 (array_inv!31196 _keys!1741)))

(assert (=> start!108980 tp!100525))

(declare-fun b!1287762 () Bool)

(declare-fun e!735395 () Bool)

(assert (=> b!1287762 (= e!735395 tp_is_empty!34109)))

(declare-fun b!1287763 () Bool)

(declare-fun e!735394 () Bool)

(assert (=> b!1287763 (= e!735394 tp_is_empty!34109)))

(declare-fun b!1287764 () Bool)

(declare-fun res!855270 () Bool)

(assert (=> b!1287764 (=> (not res!855270) (not e!735396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85270 (_ BitVec 32)) Bool)

(assert (=> b!1287764 (= res!855270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1287765 () Bool)

(declare-fun res!855274 () Bool)

(assert (=> b!1287765 (=> (not res!855274) (not e!735396))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287765 (= res!855274 (not (validKeyInArray!0 (select (arr!41136 _keys!1741) from!2144))))))

(declare-fun b!1287766 () Bool)

(declare-fun mapRes!52724 () Bool)

(assert (=> b!1287766 (= e!735397 (and e!735395 mapRes!52724))))

(declare-fun condMapEmpty!52724 () Bool)

(declare-fun mapDefault!52724 () ValueCell!16156)

