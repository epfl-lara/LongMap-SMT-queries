; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109738 () Bool)

(assert start!109738)

(declare-fun b_free!29171 () Bool)

(declare-fun b_next!29171 () Bool)

(assert (=> start!109738 (= b_free!29171 (not b_next!29171))))

(declare-fun tp!102640 () Bool)

(declare-fun b_and!47273 () Bool)

(assert (=> start!109738 (= tp!102640 b_and!47273)))

(declare-fun b!1299924 () Bool)

(declare-fun e!741539 () Bool)

(declare-fun tp_is_empty!34811 () Bool)

(assert (=> b!1299924 (= e!741539 tp_is_empty!34811)))

(declare-fun b!1299925 () Bool)

(declare-fun res!863876 () Bool)

(declare-fun e!741540 () Bool)

(assert (=> b!1299925 (=> (not res!863876) (not e!741540))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51517 0))(
  ( (V!51518 (val!17480 Int)) )
))
(declare-datatypes ((ValueCell!16507 0))(
  ( (ValueCellFull!16507 (v!20086 V!51517)) (EmptyCell!16507) )
))
(declare-datatypes ((array!86630 0))(
  ( (array!86631 (arr!41813 (Array (_ BitVec 32) ValueCell!16507)) (size!42363 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86630)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86632 0))(
  ( (array!86633 (arr!41814 (Array (_ BitVec 32) (_ BitVec 64))) (size!42364 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86632)

(assert (=> b!1299925 (= res!863876 (and (= (size!42363 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42364 _keys!1741) (size!42363 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1299927 () Bool)

(declare-fun res!863873 () Bool)

(assert (=> b!1299927 (=> (not res!863873) (not e!741540))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1299927 (= res!863873 (validKeyInArray!0 (select (arr!41814 _keys!1741) from!2144)))))

(declare-fun mapNonEmpty!53786 () Bool)

(declare-fun mapRes!53786 () Bool)

(declare-fun tp!102641 () Bool)

(declare-fun e!741541 () Bool)

(assert (=> mapNonEmpty!53786 (= mapRes!53786 (and tp!102641 e!741541))))

(declare-fun mapKey!53786 () (_ BitVec 32))

(declare-fun mapValue!53786 () ValueCell!16507)

(declare-fun mapRest!53786 () (Array (_ BitVec 32) ValueCell!16507))

(assert (=> mapNonEmpty!53786 (= (arr!41813 _values!1445) (store mapRest!53786 mapKey!53786 mapValue!53786))))

(declare-fun b!1299928 () Bool)

(declare-fun res!863875 () Bool)

(assert (=> b!1299928 (=> (not res!863875) (not e!741540))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1299928 (= res!863875 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42364 _keys!1741))))))

(declare-fun b!1299929 () Bool)

(declare-fun res!863880 () Bool)

(assert (=> b!1299929 (=> (not res!863880) (not e!741540))))

(assert (=> b!1299929 (= res!863880 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42364 _keys!1741))))))

(declare-fun b!1299930 () Bool)

(declare-fun e!741537 () Bool)

(assert (=> b!1299930 (= e!741537 (and e!741539 mapRes!53786))))

(declare-fun condMapEmpty!53786 () Bool)

(declare-fun mapDefault!53786 () ValueCell!16507)

