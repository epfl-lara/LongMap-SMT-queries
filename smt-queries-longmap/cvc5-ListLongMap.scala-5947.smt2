; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77508 () Bool)

(assert start!77508)

(declare-fun b_free!16093 () Bool)

(declare-fun b_next!16093 () Bool)

(assert (=> start!77508 (= b_free!16093 (not b_next!16093))))

(declare-fun tp!56541 () Bool)

(declare-fun b_and!26459 () Bool)

(assert (=> start!77508 (= tp!56541 b_and!26459)))

(declare-fun res!609356 () Bool)

(declare-fun e!505947 () Bool)

(assert (=> start!77508 (=> (not res!609356) (not e!505947))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77508 (= res!609356 (validMask!0 mask!1756))))

(assert (=> start!77508 e!505947))

(declare-datatypes ((V!29647 0))(
  ( (V!29648 (val!9306 Int)) )
))
(declare-datatypes ((ValueCell!8774 0))(
  ( (ValueCellFull!8774 (v!11811 V!29647)) (EmptyCell!8774) )
))
(declare-datatypes ((array!53082 0))(
  ( (array!53083 (arr!25500 (Array (_ BitVec 32) ValueCell!8774)) (size!25959 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53082)

(declare-fun e!505946 () Bool)

(declare-fun array_inv!19990 (array!53082) Bool)

(assert (=> start!77508 (and (array_inv!19990 _values!1152) e!505946)))

(assert (=> start!77508 tp!56541))

(assert (=> start!77508 true))

(declare-fun tp_is_empty!18511 () Bool)

(assert (=> start!77508 tp_is_empty!18511))

(declare-datatypes ((array!53084 0))(
  ( (array!53085 (arr!25501 (Array (_ BitVec 32) (_ BitVec 64))) (size!25960 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53084)

(declare-fun array_inv!19991 (array!53084) Bool)

(assert (=> start!77508 (array_inv!19991 _keys!1386)))

(declare-fun b!903110 () Bool)

(declare-fun res!609354 () Bool)

(assert (=> b!903110 (=> (not res!609354) (not e!505947))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!903110 (= res!609354 (and (= (size!25959 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25960 _keys!1386) (size!25959 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903111 () Bool)

(declare-fun e!505949 () Bool)

(declare-fun mapRes!29479 () Bool)

(assert (=> b!903111 (= e!505946 (and e!505949 mapRes!29479))))

(declare-fun condMapEmpty!29479 () Bool)

(declare-fun mapDefault!29479 () ValueCell!8774)

