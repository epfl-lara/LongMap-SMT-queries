; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108998 () Bool)

(assert start!108998)

(declare-fun b_free!28487 () Bool)

(declare-fun b_next!28487 () Bool)

(assert (=> start!108998 (= b_free!28487 (not b_next!28487))))

(declare-fun tp!100580 () Bool)

(declare-fun b_and!46577 () Bool)

(assert (=> start!108998 (= tp!100580 b_and!46577)))

(declare-fun res!855487 () Bool)

(declare-fun e!735529 () Bool)

(assert (=> start!108998 (=> (not res!855487) (not e!735529))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108998 (= res!855487 (validMask!0 mask!2175))))

(assert (=> start!108998 e!735529))

(declare-fun tp_is_empty!34127 () Bool)

(assert (=> start!108998 tp_is_empty!34127))

(assert (=> start!108998 true))

(declare-datatypes ((V!50605 0))(
  ( (V!50606 (val!17138 Int)) )
))
(declare-datatypes ((ValueCell!16165 0))(
  ( (ValueCellFull!16165 (v!19741 V!50605)) (EmptyCell!16165) )
))
(declare-datatypes ((array!85302 0))(
  ( (array!85303 (arr!41152 (Array (_ BitVec 32) ValueCell!16165)) (size!41702 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85302)

(declare-fun e!735533 () Bool)

(declare-fun array_inv!31209 (array!85302) Bool)

(assert (=> start!108998 (and (array_inv!31209 _values!1445) e!735533)))

(declare-datatypes ((array!85304 0))(
  ( (array!85305 (arr!41153 (Array (_ BitVec 32) (_ BitVec 64))) (size!41703 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85304)

(declare-fun array_inv!31210 (array!85304) Bool)

(assert (=> start!108998 (array_inv!31210 _keys!1741)))

(assert (=> start!108998 tp!100580))

(declare-fun b!1288059 () Bool)

(declare-fun res!855488 () Bool)

(assert (=> b!1288059 (=> (not res!855488) (not e!735529))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1288059 (= res!855488 (and (= (size!41702 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41703 _keys!1741) (size!41702 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1288060 () Bool)

(declare-fun e!735531 () Bool)

(declare-fun mapRes!52751 () Bool)

(assert (=> b!1288060 (= e!735533 (and e!735531 mapRes!52751))))

(declare-fun condMapEmpty!52751 () Bool)

(declare-fun mapDefault!52751 () ValueCell!16165)

