; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77370 () Bool)

(assert start!77370)

(declare-datatypes ((V!29535 0))(
  ( (V!29536 (val!9264 Int)) )
))
(declare-datatypes ((ValueCell!8732 0))(
  ( (ValueCellFull!8732 (v!11768 V!29535)) (EmptyCell!8732) )
))
(declare-datatypes ((array!52916 0))(
  ( (array!52917 (arr!25423 (Array (_ BitVec 32) ValueCell!8732)) (size!25882 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52916)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!52918 0))(
  ( (array!52919 (arr!25424 (Array (_ BitVec 32) (_ BitVec 64))) (size!25883 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52918)

(declare-fun b!902178 () Bool)

(declare-fun e!505197 () Bool)

(assert (=> b!902178 (= e!505197 (and (= (size!25882 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25883 _keys!1386) (size!25882 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011) (= (size!25883 _keys!1386) (bvadd #b00000000000000000000000000000001 mask!1756)) (bvsgt #b00000000000000000000000000000000 (size!25883 _keys!1386))))))

(declare-fun b!902179 () Bool)

(declare-fun e!505196 () Bool)

(declare-fun tp_is_empty!18427 () Bool)

(assert (=> b!902179 (= e!505196 tp_is_empty!18427)))

(declare-fun mapNonEmpty!29335 () Bool)

(declare-fun mapRes!29335 () Bool)

(declare-fun tp!56394 () Bool)

(declare-fun e!505195 () Bool)

(assert (=> mapNonEmpty!29335 (= mapRes!29335 (and tp!56394 e!505195))))

(declare-fun mapKey!29335 () (_ BitVec 32))

(declare-fun mapRest!29335 () (Array (_ BitVec 32) ValueCell!8732))

(declare-fun mapValue!29335 () ValueCell!8732)

(assert (=> mapNonEmpty!29335 (= (arr!25423 _values!1152) (store mapRest!29335 mapKey!29335 mapValue!29335))))

(declare-fun b!902180 () Bool)

(assert (=> b!902180 (= e!505195 tp_is_empty!18427)))

(declare-fun mapIsEmpty!29335 () Bool)

(assert (=> mapIsEmpty!29335 mapRes!29335))

(declare-fun b!902181 () Bool)

(declare-fun e!505194 () Bool)

(assert (=> b!902181 (= e!505194 (and e!505196 mapRes!29335))))

(declare-fun condMapEmpty!29335 () Bool)

(declare-fun mapDefault!29335 () ValueCell!8732)

