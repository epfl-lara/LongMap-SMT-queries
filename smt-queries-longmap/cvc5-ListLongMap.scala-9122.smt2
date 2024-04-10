; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109516 () Bool)

(assert start!109516)

(declare-fun b_free!29005 () Bool)

(declare-fun b_next!29005 () Bool)

(assert (=> start!109516 (= b_free!29005 (not b_next!29005))))

(declare-fun tp!102133 () Bool)

(declare-fun b_and!47095 () Bool)

(assert (=> start!109516 (= tp!102133 b_and!47095)))

(declare-fun mapNonEmpty!53528 () Bool)

(declare-fun mapRes!53528 () Bool)

(declare-fun tp!102134 () Bool)

(declare-fun e!740012 () Bool)

(assert (=> mapNonEmpty!53528 (= mapRes!53528 (and tp!102134 e!740012))))

(declare-datatypes ((V!51297 0))(
  ( (V!51298 (val!17397 Int)) )
))
(declare-datatypes ((ValueCell!16424 0))(
  ( (ValueCellFull!16424 (v!20000 V!51297)) (EmptyCell!16424) )
))
(declare-fun mapRest!53528 () (Array (_ BitVec 32) ValueCell!16424))

(declare-datatypes ((array!86304 0))(
  ( (array!86305 (arr!41653 (Array (_ BitVec 32) ValueCell!16424)) (size!42203 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86304)

(declare-fun mapKey!53528 () (_ BitVec 32))

(declare-fun mapValue!53528 () ValueCell!16424)

(assert (=> mapNonEmpty!53528 (= (arr!41653 _values!1445) (store mapRest!53528 mapKey!53528 mapValue!53528))))

(declare-fun b!1297095 () Bool)

(declare-fun e!740009 () Bool)

(declare-fun tp_is_empty!34645 () Bool)

(assert (=> b!1297095 (= e!740009 tp_is_empty!34645)))

(declare-fun b!1297097 () Bool)

(declare-fun e!740011 () Bool)

(assert (=> b!1297097 (= e!740011 (and e!740009 mapRes!53528))))

(declare-fun condMapEmpty!53528 () Bool)

(declare-fun mapDefault!53528 () ValueCell!16424)

