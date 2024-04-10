; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77484 () Bool)

(assert start!77484)

(declare-fun b!902938 () Bool)

(declare-fun e!505814 () Bool)

(declare-fun tp_is_empty!18497 () Bool)

(assert (=> b!902938 (= e!505814 tp_is_empty!18497)))

(declare-fun b!902939 () Bool)

(declare-fun res!609264 () Bool)

(declare-fun e!505816 () Bool)

(assert (=> b!902939 (=> (not res!609264) (not e!505816))))

(declare-datatypes ((array!53052 0))(
  ( (array!53053 (arr!25486 (Array (_ BitVec 32) (_ BitVec 64))) (size!25945 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53052)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53052 (_ BitVec 32)) Bool)

(assert (=> b!902939 (= res!609264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!29455 () Bool)

(declare-fun mapRes!29455 () Bool)

(declare-fun tp!56514 () Bool)

(assert (=> mapNonEmpty!29455 (= mapRes!29455 (and tp!56514 e!505814))))

(declare-fun mapKey!29455 () (_ BitVec 32))

(declare-datatypes ((V!29627 0))(
  ( (V!29628 (val!9299 Int)) )
))
(declare-datatypes ((ValueCell!8767 0))(
  ( (ValueCellFull!8767 (v!11804 V!29627)) (EmptyCell!8767) )
))
(declare-datatypes ((array!53054 0))(
  ( (array!53055 (arr!25487 (Array (_ BitVec 32) ValueCell!8767)) (size!25946 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53054)

(declare-fun mapValue!29455 () ValueCell!8767)

(declare-fun mapRest!29455 () (Array (_ BitVec 32) ValueCell!8767))

(assert (=> mapNonEmpty!29455 (= (arr!25487 _values!1152) (store mapRest!29455 mapKey!29455 mapValue!29455))))

(declare-fun b!902940 () Bool)

(assert (=> b!902940 (= e!505816 false)))

(declare-fun lt!407940 () Bool)

(declare-datatypes ((List!17899 0))(
  ( (Nil!17896) (Cons!17895 (h!19041 (_ BitVec 64)) (t!25282 List!17899)) )
))
(declare-fun arrayNoDuplicates!0 (array!53052 (_ BitVec 32) List!17899) Bool)

(assert (=> b!902940 (= lt!407940 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17896))))

(declare-fun b!902941 () Bool)

(declare-fun res!609266 () Bool)

(assert (=> b!902941 (=> (not res!609266) (not e!505816))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!902941 (= res!609266 (and (= (size!25946 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25945 _keys!1386) (size!25946 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!609265 () Bool)

(assert (=> start!77484 (=> (not res!609265) (not e!505816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77484 (= res!609265 (validMask!0 mask!1756))))

(assert (=> start!77484 e!505816))

(assert (=> start!77484 true))

(declare-fun e!505815 () Bool)

(declare-fun array_inv!19980 (array!53054) Bool)

(assert (=> start!77484 (and (array_inv!19980 _values!1152) e!505815)))

(declare-fun array_inv!19981 (array!53052) Bool)

(assert (=> start!77484 (array_inv!19981 _keys!1386)))

(declare-fun b!902942 () Bool)

(declare-fun e!505817 () Bool)

(assert (=> b!902942 (= e!505817 tp_is_empty!18497)))

(declare-fun mapIsEmpty!29455 () Bool)

(assert (=> mapIsEmpty!29455 mapRes!29455))

(declare-fun b!902943 () Bool)

(assert (=> b!902943 (= e!505815 (and e!505817 mapRes!29455))))

(declare-fun condMapEmpty!29455 () Bool)

(declare-fun mapDefault!29455 () ValueCell!8767)

