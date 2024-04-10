; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109604 () Bool)

(assert start!109604)

(declare-fun b_free!29093 () Bool)

(declare-fun b_next!29093 () Bool)

(assert (=> start!109604 (= b_free!29093 (not b_next!29093))))

(declare-fun tp!102397 () Bool)

(declare-fun b_and!47183 () Bool)

(assert (=> start!109604 (= tp!102397 b_and!47183)))

(declare-fun res!862800 () Bool)

(declare-fun e!740668 () Bool)

(assert (=> start!109604 (=> (not res!862800) (not e!740668))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109604 (= res!862800 (validMask!0 mask!2175))))

(assert (=> start!109604 e!740668))

(declare-fun tp_is_empty!34733 () Bool)

(assert (=> start!109604 tp_is_empty!34733))

(assert (=> start!109604 true))

(declare-datatypes ((V!51413 0))(
  ( (V!51414 (val!17441 Int)) )
))
(declare-datatypes ((ValueCell!16468 0))(
  ( (ValueCellFull!16468 (v!20044 V!51413)) (EmptyCell!16468) )
))
(declare-datatypes ((array!86472 0))(
  ( (array!86473 (arr!41737 (Array (_ BitVec 32) ValueCell!16468)) (size!42287 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86472)

(declare-fun e!740671 () Bool)

(declare-fun array_inv!31593 (array!86472) Bool)

(assert (=> start!109604 (and (array_inv!31593 _values!1445) e!740671)))

(declare-datatypes ((array!86474 0))(
  ( (array!86475 (arr!41738 (Array (_ BitVec 32) (_ BitVec 64))) (size!42288 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86474)

(declare-fun array_inv!31594 (array!86474) Bool)

(assert (=> start!109604 (array_inv!31594 _keys!1741)))

(assert (=> start!109604 tp!102397))

(declare-fun b!1298257 () Bool)

(declare-fun e!740669 () Bool)

(assert (=> b!1298257 (= e!740669 tp_is_empty!34733)))

(declare-fun mapNonEmpty!53660 () Bool)

(declare-fun mapRes!53660 () Bool)

(declare-fun tp!102398 () Bool)

(declare-fun e!740670 () Bool)

(assert (=> mapNonEmpty!53660 (= mapRes!53660 (and tp!102398 e!740670))))

(declare-fun mapKey!53660 () (_ BitVec 32))

(declare-fun mapRest!53660 () (Array (_ BitVec 32) ValueCell!16468))

(declare-fun mapValue!53660 () ValueCell!16468)

(assert (=> mapNonEmpty!53660 (= (arr!41737 _values!1445) (store mapRest!53660 mapKey!53660 mapValue!53660))))

(declare-fun b!1298258 () Bool)

(assert (=> b!1298258 (= e!740671 (and e!740669 mapRes!53660))))

(declare-fun condMapEmpty!53660 () Bool)

(declare-fun mapDefault!53660 () ValueCell!16468)

