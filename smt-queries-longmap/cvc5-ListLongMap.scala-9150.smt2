; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109760 () Bool)

(assert start!109760)

(declare-fun b_free!29173 () Bool)

(declare-fun b_next!29173 () Bool)

(assert (=> start!109760 (= b_free!29173 (not b_next!29173))))

(declare-fun tp!102650 () Bool)

(declare-fun b_and!47281 () Bool)

(assert (=> start!109760 (= tp!102650 b_and!47281)))

(declare-fun mapIsEmpty!53792 () Bool)

(declare-fun mapRes!53792 () Bool)

(assert (=> mapIsEmpty!53792 mapRes!53792))

(declare-fun b!1300114 () Bool)

(declare-fun res!863964 () Bool)

(declare-fun e!741652 () Bool)

(assert (=> b!1300114 (=> (not res!863964) (not e!741652))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1300114 (= res!863964 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!1300115 () Bool)

(declare-fun res!863969 () Bool)

(assert (=> b!1300115 (=> (not res!863969) (not e!741652))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51521 0))(
  ( (V!51522 (val!17481 Int)) )
))
(declare-datatypes ((ValueCell!16508 0))(
  ( (ValueCellFull!16508 (v!20088 V!51521)) (EmptyCell!16508) )
))
(declare-datatypes ((array!86636 0))(
  ( (array!86637 (arr!41815 (Array (_ BitVec 32) ValueCell!16508)) (size!42365 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86636)

(declare-datatypes ((array!86638 0))(
  ( (array!86639 (arr!41816 (Array (_ BitVec 32) (_ BitVec 64))) (size!42366 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86638)

(assert (=> b!1300115 (= res!863969 (and (= (size!42365 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42366 _keys!1741) (size!42365 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1300116 () Bool)

(declare-fun e!741651 () Bool)

(declare-fun tp_is_empty!34813 () Bool)

(assert (=> b!1300116 (= e!741651 tp_is_empty!34813)))

(declare-fun b!1300117 () Bool)

(declare-fun res!863963 () Bool)

(assert (=> b!1300117 (=> (not res!863963) (not e!741652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86638 (_ BitVec 32)) Bool)

(assert (=> b!1300117 (= res!863963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1300118 () Bool)

(declare-fun e!741654 () Bool)

(assert (=> b!1300118 (= e!741654 (and e!741651 mapRes!53792))))

(declare-fun condMapEmpty!53792 () Bool)

(declare-fun mapDefault!53792 () ValueCell!16508)

