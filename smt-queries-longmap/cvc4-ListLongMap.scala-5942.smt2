; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77472 () Bool)

(assert start!77472)

(declare-fun mapIsEmpty!29437 () Bool)

(declare-fun mapRes!29437 () Bool)

(assert (=> mapIsEmpty!29437 mapRes!29437))

(declare-fun b!902830 () Bool)

(declare-fun res!609212 () Bool)

(declare-fun e!505726 () Bool)

(assert (=> b!902830 (=> (not res!609212) (not e!505726))))

(declare-datatypes ((V!29611 0))(
  ( (V!29612 (val!9293 Int)) )
))
(declare-datatypes ((ValueCell!8761 0))(
  ( (ValueCellFull!8761 (v!11798 V!29611)) (EmptyCell!8761) )
))
(declare-datatypes ((array!53030 0))(
  ( (array!53031 (arr!25475 (Array (_ BitVec 32) ValueCell!8761)) (size!25934 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53030)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53032 0))(
  ( (array!53033 (arr!25476 (Array (_ BitVec 32) (_ BitVec 64))) (size!25935 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53032)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!902830 (= res!609212 (and (= (size!25934 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25935 _keys!1386) (size!25934 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!609211 () Bool)

(assert (=> start!77472 (=> (not res!609211) (not e!505726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77472 (= res!609211 (validMask!0 mask!1756))))

(assert (=> start!77472 e!505726))

(assert (=> start!77472 true))

(declare-fun e!505727 () Bool)

(declare-fun array_inv!19970 (array!53030) Bool)

(assert (=> start!77472 (and (array_inv!19970 _values!1152) e!505727)))

(declare-fun array_inv!19971 (array!53032) Bool)

(assert (=> start!77472 (array_inv!19971 _keys!1386)))

(declare-fun mapNonEmpty!29437 () Bool)

(declare-fun tp!56496 () Bool)

(declare-fun e!505728 () Bool)

(assert (=> mapNonEmpty!29437 (= mapRes!29437 (and tp!56496 e!505728))))

(declare-fun mapKey!29437 () (_ BitVec 32))

(declare-fun mapValue!29437 () ValueCell!8761)

(declare-fun mapRest!29437 () (Array (_ BitVec 32) ValueCell!8761))

(assert (=> mapNonEmpty!29437 (= (arr!25475 _values!1152) (store mapRest!29437 mapKey!29437 mapValue!29437))))

(declare-fun b!902831 () Bool)

(assert (=> b!902831 (= e!505726 false)))

(declare-fun lt!407922 () Bool)

(declare-datatypes ((List!17895 0))(
  ( (Nil!17892) (Cons!17891 (h!19037 (_ BitVec 64)) (t!25278 List!17895)) )
))
(declare-fun arrayNoDuplicates!0 (array!53032 (_ BitVec 32) List!17895) Bool)

(assert (=> b!902831 (= lt!407922 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17892))))

(declare-fun b!902832 () Bool)

(declare-fun tp_is_empty!18485 () Bool)

(assert (=> b!902832 (= e!505728 tp_is_empty!18485)))

(declare-fun b!902833 () Bool)

(declare-fun e!505725 () Bool)

(assert (=> b!902833 (= e!505727 (and e!505725 mapRes!29437))))

(declare-fun condMapEmpty!29437 () Bool)

(declare-fun mapDefault!29437 () ValueCell!8761)

