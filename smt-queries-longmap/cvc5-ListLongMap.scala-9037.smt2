; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109006 () Bool)

(assert start!109006)

(declare-fun b_free!28495 () Bool)

(declare-fun b_next!28495 () Bool)

(assert (=> start!109006 (= b_free!28495 (not b_next!28495))))

(declare-fun tp!100604 () Bool)

(declare-fun b_and!46585 () Bool)

(assert (=> start!109006 (= tp!100604 b_and!46585)))

(declare-fun b!1288193 () Bool)

(declare-fun res!855583 () Bool)

(declare-fun e!735593 () Bool)

(assert (=> b!1288193 (=> (not res!855583) (not e!735593))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85318 0))(
  ( (array!85319 (arr!41160 (Array (_ BitVec 32) (_ BitVec 64))) (size!41710 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85318)

(assert (=> b!1288193 (= res!855583 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41710 _keys!1741))))))

(declare-fun b!1288194 () Bool)

(declare-fun res!855591 () Bool)

(assert (=> b!1288194 (=> (not res!855591) (not e!735593))))

(declare-datatypes ((List!29177 0))(
  ( (Nil!29174) (Cons!29173 (h!30382 (_ BitVec 64)) (t!42741 List!29177)) )
))
(declare-fun arrayNoDuplicates!0 (array!85318 (_ BitVec 32) List!29177) Bool)

(assert (=> b!1288194 (= res!855591 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29174))))

(declare-fun mapNonEmpty!52763 () Bool)

(declare-fun mapRes!52763 () Bool)

(declare-fun tp!100603 () Bool)

(declare-fun e!735591 () Bool)

(assert (=> mapNonEmpty!52763 (= mapRes!52763 (and tp!100603 e!735591))))

(declare-fun mapKey!52763 () (_ BitVec 32))

(declare-datatypes ((V!50617 0))(
  ( (V!50618 (val!17142 Int)) )
))
(declare-datatypes ((ValueCell!16169 0))(
  ( (ValueCellFull!16169 (v!19745 V!50617)) (EmptyCell!16169) )
))
(declare-fun mapValue!52763 () ValueCell!16169)

(declare-datatypes ((array!85320 0))(
  ( (array!85321 (arr!41161 (Array (_ BitVec 32) ValueCell!16169)) (size!41711 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85320)

(declare-fun mapRest!52763 () (Array (_ BitVec 32) ValueCell!16169))

(assert (=> mapNonEmpty!52763 (= (arr!41161 _values!1445) (store mapRest!52763 mapKey!52763 mapValue!52763))))

(declare-fun b!1288195 () Bool)

(declare-fun e!735595 () Bool)

(declare-fun e!735594 () Bool)

(assert (=> b!1288195 (= e!735595 (and e!735594 mapRes!52763))))

(declare-fun condMapEmpty!52763 () Bool)

(declare-fun mapDefault!52763 () ValueCell!16169)

