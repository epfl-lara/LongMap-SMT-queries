; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109274 () Bool)

(assert start!109274)

(declare-fun b_free!28763 () Bool)

(declare-fun b_next!28763 () Bool)

(assert (=> start!109274 (= b_free!28763 (not b_next!28763))))

(declare-fun tp!101407 () Bool)

(declare-fun b_and!46853 () Bool)

(assert (=> start!109274 (= tp!101407 b_and!46853)))

(declare-fun mapNonEmpty!53165 () Bool)

(declare-fun mapRes!53165 () Bool)

(declare-fun tp!101408 () Bool)

(declare-fun e!737926 () Bool)

(assert (=> mapNonEmpty!53165 (= mapRes!53165 (and tp!101408 e!737926))))

(declare-fun mapKey!53165 () (_ BitVec 32))

(declare-datatypes ((V!50973 0))(
  ( (V!50974 (val!17276 Int)) )
))
(declare-datatypes ((ValueCell!16303 0))(
  ( (ValueCellFull!16303 (v!19879 V!50973)) (EmptyCell!16303) )
))
(declare-datatypes ((array!85838 0))(
  ( (array!85839 (arr!41420 (Array (_ BitVec 32) ValueCell!16303)) (size!41970 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85838)

(declare-fun mapValue!53165 () ValueCell!16303)

(declare-fun mapRest!53165 () (Array (_ BitVec 32) ValueCell!16303))

(assert (=> mapNonEmpty!53165 (= (arr!41420 _values!1445) (store mapRest!53165 mapKey!53165 mapValue!53165))))

(declare-fun b!1292936 () Bool)

(declare-fun res!859126 () Bool)

(declare-fun e!737924 () Bool)

(assert (=> b!1292936 (=> (not res!859126) (not e!737924))))

(declare-datatypes ((array!85840 0))(
  ( (array!85841 (arr!41421 (Array (_ BitVec 32) (_ BitVec 64))) (size!41971 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85840)

(declare-datatypes ((List!29383 0))(
  ( (Nil!29380) (Cons!29379 (h!30588 (_ BitVec 64)) (t!42947 List!29383)) )
))
(declare-fun arrayNoDuplicates!0 (array!85840 (_ BitVec 32) List!29383) Bool)

(assert (=> b!1292936 (= res!859126 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29380))))

(declare-fun b!1292937 () Bool)

(declare-fun res!859123 () Bool)

(assert (=> b!1292937 (=> (not res!859123) (not e!737924))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1292937 (= res!859123 (and (= (size!41970 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41971 _keys!1741) (size!41970 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!859120 () Bool)

(assert (=> start!109274 (=> (not res!859120) (not e!737924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109274 (= res!859120 (validMask!0 mask!2175))))

(assert (=> start!109274 e!737924))

(declare-fun tp_is_empty!34403 () Bool)

(assert (=> start!109274 tp_is_empty!34403))

(assert (=> start!109274 true))

(declare-fun e!737925 () Bool)

(declare-fun array_inv!31383 (array!85838) Bool)

(assert (=> start!109274 (and (array_inv!31383 _values!1445) e!737925)))

(declare-fun array_inv!31384 (array!85840) Bool)

(assert (=> start!109274 (array_inv!31384 _keys!1741)))

(assert (=> start!109274 tp!101407))

(declare-fun b!1292938 () Bool)

(declare-fun e!737923 () Bool)

(assert (=> b!1292938 (= e!737925 (and e!737923 mapRes!53165))))

(declare-fun condMapEmpty!53165 () Bool)

(declare-fun mapDefault!53165 () ValueCell!16303)

