; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77364 () Bool)

(assert start!77364)

(declare-datatypes ((V!29527 0))(
  ( (V!29528 (val!9261 Int)) )
))
(declare-datatypes ((ValueCell!8729 0))(
  ( (ValueCellFull!8729 (v!11765 V!29527)) (EmptyCell!8729) )
))
(declare-datatypes ((array!52904 0))(
  ( (array!52905 (arr!25417 (Array (_ BitVec 32) ValueCell!8729)) (size!25876 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52904)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!52906 0))(
  ( (array!52907 (arr!25418 (Array (_ BitVec 32) (_ BitVec 64))) (size!25877 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52906)

(declare-fun b!902142 () Bool)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun e!505152 () Bool)

(assert (=> b!902142 (= e!505152 (and (= (size!25876 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25877 _keys!1386) (size!25876 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011) (not (= (size!25877 _keys!1386) (bvadd #b00000000000000000000000000000001 mask!1756)))))))

(declare-fun b!902143 () Bool)

(declare-fun e!505150 () Bool)

(declare-fun e!505151 () Bool)

(declare-fun mapRes!29326 () Bool)

(assert (=> b!902143 (= e!505150 (and e!505151 mapRes!29326))))

(declare-fun condMapEmpty!29326 () Bool)

(declare-fun mapDefault!29326 () ValueCell!8729)

