; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109306 () Bool)

(assert start!109306)

(declare-fun b_free!28795 () Bool)

(declare-fun b_next!28795 () Bool)

(assert (=> start!109306 (= b_free!28795 (not b_next!28795))))

(declare-fun tp!101504 () Bool)

(declare-fun b_and!46885 () Bool)

(assert (=> start!109306 (= tp!101504 b_and!46885)))

(declare-fun b!1293512 () Bool)

(declare-fun res!859553 () Bool)

(declare-fun e!738213 () Bool)

(assert (=> b!1293512 (=> (not res!859553) (not e!738213))))

(declare-datatypes ((array!85898 0))(
  ( (array!85899 (arr!41450 (Array (_ BitVec 32) (_ BitVec 64))) (size!42000 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85898)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85898 (_ BitVec 32)) Bool)

(assert (=> b!1293512 (= res!859553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293513 () Bool)

(declare-fun e!738214 () Bool)

(declare-fun tp_is_empty!34435 () Bool)

(assert (=> b!1293513 (= e!738214 tp_is_empty!34435)))

(declare-fun b!1293514 () Bool)

(declare-fun res!859559 () Bool)

(assert (=> b!1293514 (=> (not res!859559) (not e!738213))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293514 (= res!859559 (not (validKeyInArray!0 (select (arr!41450 _keys!1741) from!2144))))))

(declare-fun b!1293515 () Bool)

(declare-fun res!859556 () Bool)

(assert (=> b!1293515 (=> (not res!859556) (not e!738213))))

(declare-datatypes ((V!51017 0))(
  ( (V!51018 (val!17292 Int)) )
))
(declare-datatypes ((ValueCell!16319 0))(
  ( (ValueCellFull!16319 (v!19895 V!51017)) (EmptyCell!16319) )
))
(declare-datatypes ((array!85900 0))(
  ( (array!85901 (arr!41451 (Array (_ BitVec 32) ValueCell!16319)) (size!42001 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85900)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1293515 (= res!859556 (and (= (size!42001 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42000 _keys!1741) (size!42001 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53213 () Bool)

(declare-fun mapRes!53213 () Bool)

(declare-fun tp!101503 () Bool)

(declare-fun e!738215 () Bool)

(assert (=> mapNonEmpty!53213 (= mapRes!53213 (and tp!101503 e!738215))))

(declare-fun mapRest!53213 () (Array (_ BitVec 32) ValueCell!16319))

(declare-fun mapValue!53213 () ValueCell!16319)

(declare-fun mapKey!53213 () (_ BitVec 32))

(assert (=> mapNonEmpty!53213 (= (arr!41451 _values!1445) (store mapRest!53213 mapKey!53213 mapValue!53213))))

(declare-fun b!1293516 () Bool)

(declare-fun res!859552 () Bool)

(assert (=> b!1293516 (=> (not res!859552) (not e!738213))))

(declare-datatypes ((List!29403 0))(
  ( (Nil!29400) (Cons!29399 (h!30608 (_ BitVec 64)) (t!42967 List!29403)) )
))
(declare-fun arrayNoDuplicates!0 (array!85898 (_ BitVec 32) List!29403) Bool)

(assert (=> b!1293516 (= res!859552 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29400))))

(declare-fun b!1293517 () Bool)

(declare-fun res!859557 () Bool)

(assert (=> b!1293517 (=> (not res!859557) (not e!738213))))

(assert (=> b!1293517 (= res!859557 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42000 _keys!1741))))))

(declare-fun b!1293518 () Bool)

(declare-fun res!859554 () Bool)

(assert (=> b!1293518 (=> (not res!859554) (not e!738213))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1293518 (= res!859554 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42000 _keys!1741))))))

(declare-fun b!1293519 () Bool)

(declare-fun e!738212 () Bool)

(assert (=> b!1293519 (= e!738212 (and e!738214 mapRes!53213))))

(declare-fun condMapEmpty!53213 () Bool)

(declare-fun mapDefault!53213 () ValueCell!16319)

