; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109606 () Bool)

(assert start!109606)

(declare-fun b_free!29095 () Bool)

(declare-fun b_next!29095 () Bool)

(assert (=> start!109606 (= b_free!29095 (not b_next!29095))))

(declare-fun tp!102404 () Bool)

(declare-fun b_and!47185 () Bool)

(assert (=> start!109606 (= tp!102404 b_and!47185)))

(declare-fun res!862817 () Bool)

(declare-fun e!740686 () Bool)

(assert (=> start!109606 (=> (not res!862817) (not e!740686))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109606 (= res!862817 (validMask!0 mask!2175))))

(assert (=> start!109606 e!740686))

(declare-fun tp_is_empty!34735 () Bool)

(assert (=> start!109606 tp_is_empty!34735))

(assert (=> start!109606 true))

(declare-datatypes ((V!51417 0))(
  ( (V!51418 (val!17442 Int)) )
))
(declare-datatypes ((ValueCell!16469 0))(
  ( (ValueCellFull!16469 (v!20045 V!51417)) (EmptyCell!16469) )
))
(declare-datatypes ((array!86476 0))(
  ( (array!86477 (arr!41739 (Array (_ BitVec 32) ValueCell!16469)) (size!42289 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86476)

(declare-fun e!740685 () Bool)

(declare-fun array_inv!31595 (array!86476) Bool)

(assert (=> start!109606 (and (array_inv!31595 _values!1445) e!740685)))

(declare-datatypes ((array!86478 0))(
  ( (array!86479 (arr!41740 (Array (_ BitVec 32) (_ BitVec 64))) (size!42290 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86478)

(declare-fun array_inv!31596 (array!86478) Bool)

(assert (=> start!109606 (array_inv!31596 _keys!1741)))

(assert (=> start!109606 tp!102404))

(declare-fun b!1298287 () Bool)

(declare-fun e!740687 () Bool)

(assert (=> b!1298287 (= e!740687 tp_is_empty!34735)))

(declare-fun b!1298288 () Bool)

(declare-fun res!862818 () Bool)

(assert (=> b!1298288 (=> (not res!862818) (not e!740686))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1298288 (= res!862818 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42290 _keys!1741)) (not (= (select (arr!41740 _keys!1741) from!2144) k!1205))))))

(declare-fun b!1298289 () Bool)

(declare-fun res!862815 () Bool)

(assert (=> b!1298289 (=> (not res!862815) (not e!740686))))

(assert (=> b!1298289 (= res!862815 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42290 _keys!1741))))))

(declare-fun mapNonEmpty!53663 () Bool)

(declare-fun mapRes!53663 () Bool)

(declare-fun tp!102403 () Bool)

(assert (=> mapNonEmpty!53663 (= mapRes!53663 (and tp!102403 e!740687))))

(declare-fun mapRest!53663 () (Array (_ BitVec 32) ValueCell!16469))

(declare-fun mapKey!53663 () (_ BitVec 32))

(declare-fun mapValue!53663 () ValueCell!16469)

(assert (=> mapNonEmpty!53663 (= (arr!41739 _values!1445) (store mapRest!53663 mapKey!53663 mapValue!53663))))

(declare-fun b!1298290 () Bool)

(declare-fun e!740684 () Bool)

(assert (=> b!1298290 (= e!740685 (and e!740684 mapRes!53663))))

(declare-fun condMapEmpty!53663 () Bool)

(declare-fun mapDefault!53663 () ValueCell!16469)

