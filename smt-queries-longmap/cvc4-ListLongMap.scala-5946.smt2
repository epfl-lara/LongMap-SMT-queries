; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77496 () Bool)

(assert start!77496)

(declare-fun b!903054 () Bool)

(declare-fun e!505906 () Bool)

(declare-datatypes ((array!53076 0))(
  ( (array!53077 (arr!25498 (Array (_ BitVec 32) (_ BitVec 64))) (size!25957 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53076)

(assert (=> b!903054 (= e!505906 (bvsgt #b00000000000000000000000000000000 (size!25957 _keys!1386)))))

(declare-fun b!903055 () Bool)

(declare-fun e!505908 () Bool)

(declare-fun tp_is_empty!18509 () Bool)

(assert (=> b!903055 (= e!505908 tp_is_empty!18509)))

(declare-fun b!903056 () Bool)

(declare-fun res!609327 () Bool)

(assert (=> b!903056 (=> (not res!609327) (not e!505906))))

(declare-datatypes ((List!17904 0))(
  ( (Nil!17901) (Cons!17900 (h!19046 (_ BitVec 64)) (t!25287 List!17904)) )
))
(declare-fun arrayNoDuplicates!0 (array!53076 (_ BitVec 32) List!17904) Bool)

(assert (=> b!903056 (= res!609327 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17901))))

(declare-fun res!609326 () Bool)

(assert (=> start!77496 (=> (not res!609326) (not e!505906))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77496 (= res!609326 (validMask!0 mask!1756))))

(assert (=> start!77496 e!505906))

(assert (=> start!77496 true))

(declare-datatypes ((V!29643 0))(
  ( (V!29644 (val!9305 Int)) )
))
(declare-datatypes ((ValueCell!8773 0))(
  ( (ValueCellFull!8773 (v!11810 V!29643)) (EmptyCell!8773) )
))
(declare-datatypes ((array!53078 0))(
  ( (array!53079 (arr!25499 (Array (_ BitVec 32) ValueCell!8773)) (size!25958 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53078)

(declare-fun e!505905 () Bool)

(declare-fun array_inv!19988 (array!53078) Bool)

(assert (=> start!77496 (and (array_inv!19988 _values!1152) e!505905)))

(declare-fun array_inv!19989 (array!53076) Bool)

(assert (=> start!77496 (array_inv!19989 _keys!1386)))

(declare-fun mapNonEmpty!29473 () Bool)

(declare-fun mapRes!29473 () Bool)

(declare-fun tp!56532 () Bool)

(assert (=> mapNonEmpty!29473 (= mapRes!29473 (and tp!56532 e!505908))))

(declare-fun mapValue!29473 () ValueCell!8773)

(declare-fun mapRest!29473 () (Array (_ BitVec 32) ValueCell!8773))

(declare-fun mapKey!29473 () (_ BitVec 32))

(assert (=> mapNonEmpty!29473 (= (arr!25499 _values!1152) (store mapRest!29473 mapKey!29473 mapValue!29473))))

(declare-fun b!903057 () Bool)

(declare-fun e!505904 () Bool)

(assert (=> b!903057 (= e!505904 tp_is_empty!18509)))

(declare-fun mapIsEmpty!29473 () Bool)

(assert (=> mapIsEmpty!29473 mapRes!29473))

(declare-fun b!903058 () Bool)

(assert (=> b!903058 (= e!505905 (and e!505904 mapRes!29473))))

(declare-fun condMapEmpty!29473 () Bool)

(declare-fun mapDefault!29473 () ValueCell!8773)

