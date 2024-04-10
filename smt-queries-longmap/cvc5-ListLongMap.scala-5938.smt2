; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77444 () Bool)

(assert start!77444)

(declare-fun b!902578 () Bool)

(declare-fun e!505518 () Bool)

(declare-fun tp_is_empty!18457 () Bool)

(assert (=> b!902578 (= e!505518 tp_is_empty!18457)))

(declare-fun b!902579 () Bool)

(declare-fun res!609085 () Bool)

(declare-fun e!505517 () Bool)

(assert (=> b!902579 (=> (not res!609085) (not e!505517))))

(declare-datatypes ((V!29575 0))(
  ( (V!29576 (val!9279 Int)) )
))
(declare-datatypes ((ValueCell!8747 0))(
  ( (ValueCellFull!8747 (v!11784 V!29575)) (EmptyCell!8747) )
))
(declare-datatypes ((array!52976 0))(
  ( (array!52977 (arr!25448 (Array (_ BitVec 32) ValueCell!8747)) (size!25907 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52976)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!52978 0))(
  ( (array!52979 (arr!25449 (Array (_ BitVec 32) (_ BitVec 64))) (size!25908 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52978)

(assert (=> b!902579 (= res!609085 (and (= (size!25907 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25908 _keys!1386) (size!25907 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!29395 () Bool)

(declare-fun mapRes!29395 () Bool)

(declare-fun tp!56454 () Bool)

(assert (=> mapNonEmpty!29395 (= mapRes!29395 (and tp!56454 e!505518))))

(declare-fun mapValue!29395 () ValueCell!8747)

(declare-fun mapRest!29395 () (Array (_ BitVec 32) ValueCell!8747))

(declare-fun mapKey!29395 () (_ BitVec 32))

(assert (=> mapNonEmpty!29395 (= (arr!25448 _values!1152) (store mapRest!29395 mapKey!29395 mapValue!29395))))

(declare-fun b!902580 () Bool)

(declare-fun e!505515 () Bool)

(declare-fun e!505516 () Bool)

(assert (=> b!902580 (= e!505515 (and e!505516 mapRes!29395))))

(declare-fun condMapEmpty!29395 () Bool)

(declare-fun mapDefault!29395 () ValueCell!8747)

