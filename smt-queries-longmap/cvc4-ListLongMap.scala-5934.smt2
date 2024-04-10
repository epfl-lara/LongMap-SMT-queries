; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77386 () Bool)

(assert start!77386)

(declare-fun mapIsEmpty!29353 () Bool)

(declare-fun mapRes!29353 () Bool)

(assert (=> mapIsEmpty!29353 mapRes!29353))

(declare-fun mapNonEmpty!29353 () Bool)

(declare-fun tp!56412 () Bool)

(declare-fun e!505278 () Bool)

(assert (=> mapNonEmpty!29353 (= mapRes!29353 (and tp!56412 e!505278))))

(declare-datatypes ((V!29547 0))(
  ( (V!29548 (val!9269 Int)) )
))
(declare-datatypes ((ValueCell!8737 0))(
  ( (ValueCellFull!8737 (v!11773 V!29547)) (EmptyCell!8737) )
))
(declare-fun mapValue!29353 () ValueCell!8737)

(declare-fun mapKey!29353 () (_ BitVec 32))

(declare-datatypes ((array!52936 0))(
  ( (array!52937 (arr!25432 (Array (_ BitVec 32) ValueCell!8737)) (size!25891 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52936)

(declare-fun mapRest!29353 () (Array (_ BitVec 32) ValueCell!8737))

(assert (=> mapNonEmpty!29353 (= (arr!25432 _values!1152) (store mapRest!29353 mapKey!29353 mapValue!29353))))

(declare-fun b!902263 () Bool)

(declare-fun res!608914 () Bool)

(declare-fun e!505277 () Bool)

(assert (=> b!902263 (=> (not res!608914) (not e!505277))))

(declare-datatypes ((array!52938 0))(
  ( (array!52939 (arr!25433 (Array (_ BitVec 32) (_ BitVec 64))) (size!25892 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52938)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52938 (_ BitVec 32)) Bool)

(assert (=> b!902263 (= res!608914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!902264 () Bool)

(declare-fun e!505275 () Bool)

(declare-fun tp_is_empty!18437 () Bool)

(assert (=> b!902264 (= e!505275 tp_is_empty!18437)))

(declare-fun b!902265 () Bool)

(assert (=> b!902265 (= e!505278 tp_is_empty!18437)))

(declare-fun res!608915 () Bool)

(assert (=> start!77386 (=> (not res!608915) (not e!505277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77386 (= res!608915 (validMask!0 mask!1756))))

(assert (=> start!77386 e!505277))

(assert (=> start!77386 true))

(declare-fun e!505279 () Bool)

(declare-fun array_inv!19942 (array!52936) Bool)

(assert (=> start!77386 (and (array_inv!19942 _values!1152) e!505279)))

(declare-fun array_inv!19943 (array!52938) Bool)

(assert (=> start!77386 (array_inv!19943 _keys!1386)))

(declare-fun b!902262 () Bool)

(assert (=> b!902262 (= e!505279 (and e!505275 mapRes!29353))))

(declare-fun condMapEmpty!29353 () Bool)

(declare-fun mapDefault!29353 () ValueCell!8737)

