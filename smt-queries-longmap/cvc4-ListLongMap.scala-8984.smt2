; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108668 () Bool)

(assert start!108668)

(declare-fun b_free!28181 () Bool)

(declare-fun b_next!28181 () Bool)

(assert (=> start!108668 (= b_free!28181 (not b_next!28181))))

(declare-fun tp!99659 () Bool)

(declare-fun b_and!46247 () Bool)

(assert (=> start!108668 (= tp!99659 b_and!46247)))

(declare-fun b!1282709 () Bool)

(declare-fun res!852006 () Bool)

(declare-fun e!732918 () Bool)

(assert (=> b!1282709 (=> (not res!852006) (not e!732918))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50197 0))(
  ( (V!50198 (val!16985 Int)) )
))
(declare-datatypes ((ValueCell!16012 0))(
  ( (ValueCellFull!16012 (v!19587 V!50197)) (EmptyCell!16012) )
))
(declare-datatypes ((array!84710 0))(
  ( (array!84711 (arr!40857 (Array (_ BitVec 32) ValueCell!16012)) (size!41407 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84710)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84712 0))(
  ( (array!84713 (arr!40858 (Array (_ BitVec 32) (_ BitVec 64))) (size!41408 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84712)

(assert (=> b!1282709 (= res!852006 (and (= (size!41407 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41408 _keys!1741) (size!41407 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!852004 () Bool)

(assert (=> start!108668 (=> (not res!852004) (not e!732918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108668 (= res!852004 (validMask!0 mask!2175))))

(assert (=> start!108668 e!732918))

(declare-fun tp_is_empty!33821 () Bool)

(assert (=> start!108668 tp_is_empty!33821))

(assert (=> start!108668 true))

(declare-fun e!732920 () Bool)

(declare-fun array_inv!30995 (array!84710) Bool)

(assert (=> start!108668 (and (array_inv!30995 _values!1445) e!732920)))

(declare-fun array_inv!30996 (array!84712) Bool)

(assert (=> start!108668 (array_inv!30996 _keys!1741)))

(assert (=> start!108668 tp!99659))

(declare-fun mapNonEmpty!52289 () Bool)

(declare-fun mapRes!52289 () Bool)

(declare-fun tp!99658 () Bool)

(declare-fun e!732916 () Bool)

(assert (=> mapNonEmpty!52289 (= mapRes!52289 (and tp!99658 e!732916))))

(declare-fun mapValue!52289 () ValueCell!16012)

(declare-fun mapRest!52289 () (Array (_ BitVec 32) ValueCell!16012))

(declare-fun mapKey!52289 () (_ BitVec 32))

(assert (=> mapNonEmpty!52289 (= (arr!40857 _values!1445) (store mapRest!52289 mapKey!52289 mapValue!52289))))

(declare-fun mapIsEmpty!52289 () Bool)

(assert (=> mapIsEmpty!52289 mapRes!52289))

(declare-fun b!1282710 () Bool)

(declare-fun e!732919 () Bool)

(assert (=> b!1282710 (= e!732920 (and e!732919 mapRes!52289))))

(declare-fun condMapEmpty!52289 () Bool)

(declare-fun mapDefault!52289 () ValueCell!16012)

