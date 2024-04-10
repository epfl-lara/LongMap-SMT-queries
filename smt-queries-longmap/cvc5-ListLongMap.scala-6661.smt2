; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83938 () Bool)

(assert start!83938)

(declare-fun b!980953 () Bool)

(declare-fun e!552946 () Bool)

(declare-fun tp_is_empty!22741 () Bool)

(assert (=> b!980953 (= e!552946 tp_is_empty!22741)))

(declare-fun res!656471 () Bool)

(declare-fun e!552947 () Bool)

(assert (=> start!83938 (=> (not res!656471) (not e!552947))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83938 (= res!656471 (validMask!0 mask!1948))))

(assert (=> start!83938 e!552947))

(assert (=> start!83938 true))

(declare-datatypes ((V!35305 0))(
  ( (V!35306 (val!11421 Int)) )
))
(declare-datatypes ((ValueCell!10889 0))(
  ( (ValueCellFull!10889 (v!13983 V!35305)) (EmptyCell!10889) )
))
(declare-datatypes ((array!61485 0))(
  ( (array!61486 (arr!29600 (Array (_ BitVec 32) ValueCell!10889)) (size!30079 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61485)

(declare-fun e!552948 () Bool)

(declare-fun array_inv!22883 (array!61485) Bool)

(assert (=> start!83938 (and (array_inv!22883 _values!1278) e!552948)))

(declare-datatypes ((array!61487 0))(
  ( (array!61488 (arr!29601 (Array (_ BitVec 32) (_ BitVec 64))) (size!30080 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61487)

(declare-fun array_inv!22884 (array!61487) Bool)

(assert (=> start!83938 (array_inv!22884 _keys!1544)))

(declare-fun b!980954 () Bool)

(declare-fun e!552945 () Bool)

(declare-fun mapRes!36140 () Bool)

(assert (=> b!980954 (= e!552948 (and e!552945 mapRes!36140))))

(declare-fun condMapEmpty!36140 () Bool)

(declare-fun mapDefault!36140 () ValueCell!10889)

