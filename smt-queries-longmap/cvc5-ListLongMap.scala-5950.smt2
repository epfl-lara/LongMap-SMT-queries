; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77526 () Bool)

(assert start!77526)

(declare-fun b_free!16111 () Bool)

(declare-fun b_next!16111 () Bool)

(assert (=> start!77526 (= b_free!16111 (not b_next!16111))))

(declare-fun tp!56595 () Bool)

(declare-fun b_and!26477 () Bool)

(assert (=> start!77526 (= tp!56595 b_and!26477)))

(declare-fun b!903299 () Bool)

(declare-fun res!609461 () Bool)

(declare-fun e!506085 () Bool)

(assert (=> b!903299 (=> (not res!609461) (not e!506085))))

(declare-datatypes ((V!29671 0))(
  ( (V!29672 (val!9315 Int)) )
))
(declare-datatypes ((ValueCell!8783 0))(
  ( (ValueCellFull!8783 (v!11820 V!29671)) (EmptyCell!8783) )
))
(declare-datatypes ((array!53114 0))(
  ( (array!53115 (arr!25516 (Array (_ BitVec 32) ValueCell!8783)) (size!25975 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53114)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53116 0))(
  ( (array!53117 (arr!25517 (Array (_ BitVec 32) (_ BitVec 64))) (size!25976 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53116)

(assert (=> b!903299 (= res!609461 (and (= (size!25975 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25976 _keys!1386) (size!25975 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903300 () Bool)

(declare-fun res!609462 () Bool)

(assert (=> b!903300 (=> (not res!609462) (not e!506085))))

(declare-datatypes ((List!17916 0))(
  ( (Nil!17913) (Cons!17912 (h!19058 (_ BitVec 64)) (t!25299 List!17916)) )
))
(declare-fun arrayNoDuplicates!0 (array!53116 (_ BitVec 32) List!17916) Bool)

(assert (=> b!903300 (= res!609462 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17913))))

(declare-fun mapNonEmpty!29506 () Bool)

(declare-fun mapRes!29506 () Bool)

(declare-fun tp!56594 () Bool)

(declare-fun e!506084 () Bool)

(assert (=> mapNonEmpty!29506 (= mapRes!29506 (and tp!56594 e!506084))))

(declare-fun mapRest!29506 () (Array (_ BitVec 32) ValueCell!8783))

(declare-fun mapValue!29506 () ValueCell!8783)

(declare-fun mapKey!29506 () (_ BitVec 32))

(assert (=> mapNonEmpty!29506 (= (arr!25516 _values!1152) (store mapRest!29506 mapKey!29506 mapValue!29506))))

(declare-fun b!903301 () Bool)

(declare-fun e!506083 () Bool)

(declare-fun e!506081 () Bool)

(assert (=> b!903301 (= e!506083 (and e!506081 mapRes!29506))))

(declare-fun condMapEmpty!29506 () Bool)

(declare-fun mapDefault!29506 () ValueCell!8783)

