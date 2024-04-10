; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83696 () Bool)

(assert start!83696)

(declare-fun res!654149 () Bool)

(declare-fun e!550967 () Bool)

(assert (=> start!83696 (=> (not res!654149) (not e!550967))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83696 (= res!654149 (validMask!0 mask!1948))))

(assert (=> start!83696 e!550967))

(assert (=> start!83696 true))

(declare-datatypes ((V!34981 0))(
  ( (V!34982 (val!11300 Int)) )
))
(declare-datatypes ((ValueCell!10768 0))(
  ( (ValueCellFull!10768 (v!13862 V!34981)) (EmptyCell!10768) )
))
(declare-datatypes ((array!61033 0))(
  ( (array!61034 (arr!29374 (Array (_ BitVec 32) ValueCell!10768)) (size!29853 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61033)

(declare-fun e!550969 () Bool)

(declare-fun array_inv!22709 (array!61033) Bool)

(assert (=> start!83696 (and (array_inv!22709 _values!1278) e!550969)))

(declare-datatypes ((array!61035 0))(
  ( (array!61036 (arr!29375 (Array (_ BitVec 32) (_ BitVec 64))) (size!29854 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61035)

(declare-fun array_inv!22710 (array!61035) Bool)

(assert (=> start!83696 (array_inv!22710 _keys!1544)))

(declare-fun b!977374 () Bool)

(declare-fun res!654148 () Bool)

(assert (=> b!977374 (=> (not res!654148) (not e!550967))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977374 (= res!654148 (and (= (size!29853 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29854 _keys!1544) (size!29853 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977375 () Bool)

(declare-fun e!550971 () Bool)

(declare-fun mapRes!35777 () Bool)

(assert (=> b!977375 (= e!550969 (and e!550971 mapRes!35777))))

(declare-fun condMapEmpty!35777 () Bool)

(declare-fun mapDefault!35777 () ValueCell!10768)

