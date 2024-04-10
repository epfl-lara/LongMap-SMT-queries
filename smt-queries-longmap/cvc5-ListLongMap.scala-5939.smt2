; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77450 () Bool)

(assert start!77450)

(declare-fun b!902632 () Bool)

(declare-fun res!609112 () Bool)

(declare-fun e!505559 () Bool)

(assert (=> b!902632 (=> (not res!609112) (not e!505559))))

(declare-datatypes ((V!29583 0))(
  ( (V!29584 (val!9282 Int)) )
))
(declare-datatypes ((ValueCell!8750 0))(
  ( (ValueCellFull!8750 (v!11787 V!29583)) (EmptyCell!8750) )
))
(declare-datatypes ((array!52988 0))(
  ( (array!52989 (arr!25454 (Array (_ BitVec 32) ValueCell!8750)) (size!25913 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52988)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!52990 0))(
  ( (array!52991 (arr!25455 (Array (_ BitVec 32) (_ BitVec 64))) (size!25914 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52990)

(assert (=> b!902632 (= res!609112 (and (= (size!25913 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25914 _keys!1386) (size!25913 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!902633 () Bool)

(declare-fun e!505563 () Bool)

(declare-fun e!505560 () Bool)

(declare-fun mapRes!29404 () Bool)

(assert (=> b!902633 (= e!505563 (and e!505560 mapRes!29404))))

(declare-fun condMapEmpty!29404 () Bool)

(declare-fun mapDefault!29404 () ValueCell!8750)

