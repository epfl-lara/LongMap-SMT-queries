; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109906 () Bool)

(assert start!109906)

(declare-fun b_free!29231 () Bool)

(declare-fun b_next!29231 () Bool)

(assert (=> start!109906 (= b_free!29231 (not b_next!29231))))

(declare-fun tp!102830 () Bool)

(declare-fun b_and!47367 () Bool)

(assert (=> start!109906 (= tp!102830 b_and!47367)))

(declare-fun b!1302076 () Bool)

(declare-fun e!742669 () Bool)

(declare-fun tp_is_empty!34871 () Bool)

(assert (=> b!1302076 (= e!742669 tp_is_empty!34871)))

(declare-fun b!1302077 () Bool)

(declare-fun res!864951 () Bool)

(declare-fun e!742663 () Bool)

(assert (=> b!1302077 (=> (not res!864951) (not e!742663))))

(declare-datatypes ((array!86752 0))(
  ( (array!86753 (arr!41871 (Array (_ BitVec 32) (_ BitVec 64))) (size!42421 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86752)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86752 (_ BitVec 32)) Bool)

(assert (=> b!1302077 (= res!864951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1302078 () Bool)

(declare-fun e!742662 () Bool)

(declare-fun mapRes!53886 () Bool)

(assert (=> b!1302078 (= e!742662 (and e!742669 mapRes!53886))))

(declare-fun condMapEmpty!53886 () Bool)

(declare-datatypes ((V!51597 0))(
  ( (V!51598 (val!17510 Int)) )
))
(declare-datatypes ((ValueCell!16537 0))(
  ( (ValueCellFull!16537 (v!20121 V!51597)) (EmptyCell!16537) )
))
(declare-datatypes ((array!86754 0))(
  ( (array!86755 (arr!41872 (Array (_ BitVec 32) ValueCell!16537)) (size!42422 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86754)

(declare-fun mapDefault!53886 () ValueCell!16537)

