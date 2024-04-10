; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108626 () Bool)

(assert start!108626)

(declare-fun b_free!28139 () Bool)

(declare-fun b_next!28139 () Bool)

(assert (=> start!108626 (= b_free!28139 (not b_next!28139))))

(declare-fun tp!99533 () Bool)

(declare-fun b_and!46205 () Bool)

(assert (=> start!108626 (= tp!99533 b_and!46205)))

(declare-fun b!1282205 () Bool)

(declare-fun res!851687 () Bool)

(declare-fun e!732602 () Bool)

(assert (=> b!1282205 (=> (not res!851687) (not e!732602))))

(declare-datatypes ((array!84628 0))(
  ( (array!84629 (arr!40816 (Array (_ BitVec 32) (_ BitVec 64))) (size!41366 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84628)

(declare-datatypes ((List!28915 0))(
  ( (Nil!28912) (Cons!28911 (h!30120 (_ BitVec 64)) (t!42459 List!28915)) )
))
(declare-fun arrayNoDuplicates!0 (array!84628 (_ BitVec 32) List!28915) Bool)

(assert (=> b!1282205 (= res!851687 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28912))))

(declare-fun b!1282206 () Bool)

(declare-fun res!851689 () Bool)

(assert (=> b!1282206 (=> (not res!851689) (not e!732602))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1282206 (= res!851689 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41366 _keys!1741))))))

(declare-fun b!1282207 () Bool)

(declare-fun e!732603 () Bool)

(declare-fun tp_is_empty!33779 () Bool)

(assert (=> b!1282207 (= e!732603 tp_is_empty!33779)))

(declare-fun mapNonEmpty!52226 () Bool)

(declare-fun mapRes!52226 () Bool)

(declare-fun tp!99532 () Bool)

(declare-fun e!732601 () Bool)

(assert (=> mapNonEmpty!52226 (= mapRes!52226 (and tp!99532 e!732601))))

(declare-datatypes ((V!50141 0))(
  ( (V!50142 (val!16964 Int)) )
))
(declare-datatypes ((ValueCell!15991 0))(
  ( (ValueCellFull!15991 (v!19566 V!50141)) (EmptyCell!15991) )
))
(declare-datatypes ((array!84630 0))(
  ( (array!84631 (arr!40817 (Array (_ BitVec 32) ValueCell!15991)) (size!41367 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84630)

(declare-fun mapRest!52226 () (Array (_ BitVec 32) ValueCell!15991))

(declare-fun mapValue!52226 () ValueCell!15991)

(declare-fun mapKey!52226 () (_ BitVec 32))

(assert (=> mapNonEmpty!52226 (= (arr!40817 _values!1445) (store mapRest!52226 mapKey!52226 mapValue!52226))))

(declare-fun b!1282209 () Bool)

(assert (=> b!1282209 (= e!732601 tp_is_empty!33779)))

(declare-fun b!1282210 () Bool)

(declare-fun e!732605 () Bool)

(assert (=> b!1282210 (= e!732605 (and e!732603 mapRes!52226))))

(declare-fun condMapEmpty!52226 () Bool)

(declare-fun mapDefault!52226 () ValueCell!15991)

