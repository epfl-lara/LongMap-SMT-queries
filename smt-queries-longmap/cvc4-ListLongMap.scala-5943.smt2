; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77478 () Bool)

(assert start!77478)

(declare-fun b!902884 () Bool)

(declare-fun res!609238 () Bool)

(declare-fun e!505772 () Bool)

(assert (=> b!902884 (=> (not res!609238) (not e!505772))))

(declare-datatypes ((V!29619 0))(
  ( (V!29620 (val!9296 Int)) )
))
(declare-datatypes ((ValueCell!8764 0))(
  ( (ValueCellFull!8764 (v!11801 V!29619)) (EmptyCell!8764) )
))
(declare-datatypes ((array!53042 0))(
  ( (array!53043 (arr!25481 (Array (_ BitVec 32) ValueCell!8764)) (size!25940 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53042)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53044 0))(
  ( (array!53045 (arr!25482 (Array (_ BitVec 32) (_ BitVec 64))) (size!25941 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53044)

(assert (=> b!902884 (= res!609238 (and (= (size!25940 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25941 _keys!1386) (size!25940 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!902885 () Bool)

(declare-fun res!609239 () Bool)

(assert (=> b!902885 (=> (not res!609239) (not e!505772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53044 (_ BitVec 32)) Bool)

(assert (=> b!902885 (= res!609239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!902886 () Bool)

(declare-fun e!505773 () Bool)

(declare-fun tp_is_empty!18491 () Bool)

(assert (=> b!902886 (= e!505773 tp_is_empty!18491)))

(declare-fun res!609237 () Bool)

(assert (=> start!77478 (=> (not res!609237) (not e!505772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77478 (= res!609237 (validMask!0 mask!1756))))

(assert (=> start!77478 e!505772))

(assert (=> start!77478 true))

(declare-fun e!505771 () Bool)

(declare-fun array_inv!19976 (array!53042) Bool)

(assert (=> start!77478 (and (array_inv!19976 _values!1152) e!505771)))

(declare-fun array_inv!19977 (array!53044) Bool)

(assert (=> start!77478 (array_inv!19977 _keys!1386)))

(declare-fun b!902887 () Bool)

(declare-fun e!505769 () Bool)

(declare-fun mapRes!29446 () Bool)

(assert (=> b!902887 (= e!505771 (and e!505769 mapRes!29446))))

(declare-fun condMapEmpty!29446 () Bool)

(declare-fun mapDefault!29446 () ValueCell!8764)

