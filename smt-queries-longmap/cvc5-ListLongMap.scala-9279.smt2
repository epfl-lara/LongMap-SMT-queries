; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111022 () Bool)

(assert start!111022)

(declare-fun b_free!29857 () Bool)

(declare-fun b_next!29857 () Bool)

(assert (=> start!111022 (= b_free!29857 (not b_next!29857))))

(declare-fun tp!104893 () Bool)

(declare-fun b_and!48065 () Bool)

(assert (=> start!111022 (= tp!104893 b_and!48065)))

(declare-fun b!1314458 () Bool)

(declare-fun res!872649 () Bool)

(declare-fun e!749792 () Bool)

(assert (=> b!1314458 (=> (not res!872649) (not e!749792))))

(declare-datatypes ((array!88144 0))(
  ( (array!88145 (arr!42552 (Array (_ BitVec 32) (_ BitVec 64))) (size!43102 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88144)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88144 (_ BitVec 32)) Bool)

(assert (=> b!1314458 (= res!872649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314459 () Bool)

(declare-fun res!872646 () Bool)

(assert (=> b!1314459 (=> (not res!872646) (not e!749792))))

(declare-datatypes ((List!30178 0))(
  ( (Nil!30175) (Cons!30174 (h!31383 (_ BitVec 64)) (t!43784 List!30178)) )
))
(declare-fun arrayNoDuplicates!0 (array!88144 (_ BitVec 32) List!30178) Bool)

(assert (=> b!1314459 (= res!872646 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30175))))

(declare-fun b!1314460 () Bool)

(declare-fun res!872647 () Bool)

(assert (=> b!1314460 (=> (not res!872647) (not e!749792))))

(declare-datatypes ((V!52553 0))(
  ( (V!52554 (val!17868 Int)) )
))
(declare-datatypes ((ValueCell!16895 0))(
  ( (ValueCellFull!16895 (v!20495 V!52553)) (EmptyCell!16895) )
))
(declare-datatypes ((array!88146 0))(
  ( (array!88147 (arr!42553 (Array (_ BitVec 32) ValueCell!16895)) (size!43103 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88146)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314460 (= res!872647 (and (= (size!43103 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43102 _keys!1628) (size!43103 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55009 () Bool)

(declare-fun mapRes!55009 () Bool)

(declare-fun tp!104892 () Bool)

(declare-fun e!749788 () Bool)

(assert (=> mapNonEmpty!55009 (= mapRes!55009 (and tp!104892 e!749788))))

(declare-fun mapRest!55009 () (Array (_ BitVec 32) ValueCell!16895))

(declare-fun mapKey!55009 () (_ BitVec 32))

(declare-fun mapValue!55009 () ValueCell!16895)

(assert (=> mapNonEmpty!55009 (= (arr!42553 _values!1354) (store mapRest!55009 mapKey!55009 mapValue!55009))))

(declare-fun b!1314461 () Bool)

(declare-fun e!749791 () Bool)

(declare-fun e!749790 () Bool)

(assert (=> b!1314461 (= e!749791 (and e!749790 mapRes!55009))))

(declare-fun condMapEmpty!55009 () Bool)

(declare-fun mapDefault!55009 () ValueCell!16895)

