; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83852 () Bool)

(assert start!83852)

(declare-fun b_free!19661 () Bool)

(declare-fun b_next!19661 () Bool)

(assert (=> start!83852 (= b_free!19661 (not b_next!19661))))

(declare-fun tp!68424 () Bool)

(declare-fun b_and!31411 () Bool)

(assert (=> start!83852 (= tp!68424 b_and!31411)))

(declare-fun res!655585 () Bool)

(declare-fun e!552202 () Bool)

(assert (=> start!83852 (=> (not res!655585) (not e!552202))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83852 (= res!655585 (validMask!0 mask!1948))))

(assert (=> start!83852 e!552202))

(assert (=> start!83852 true))

(declare-fun tp_is_empty!22655 () Bool)

(assert (=> start!83852 tp_is_empty!22655))

(declare-datatypes ((V!35189 0))(
  ( (V!35190 (val!11378 Int)) )
))
(declare-datatypes ((ValueCell!10846 0))(
  ( (ValueCellFull!10846 (v!13940 V!35189)) (EmptyCell!10846) )
))
(declare-datatypes ((array!61327 0))(
  ( (array!61328 (arr!29521 (Array (_ BitVec 32) ValueCell!10846)) (size!30000 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61327)

(declare-fun e!552199 () Bool)

(declare-fun array_inv!22825 (array!61327) Bool)

(assert (=> start!83852 (and (array_inv!22825 _values!1278) e!552199)))

(assert (=> start!83852 tp!68424))

(declare-datatypes ((array!61329 0))(
  ( (array!61330 (arr!29522 (Array (_ BitVec 32) (_ BitVec 64))) (size!30001 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61329)

(declare-fun array_inv!22826 (array!61329) Bool)

(assert (=> start!83852 (array_inv!22826 _keys!1544)))

(declare-fun b!979611 () Bool)

(declare-fun e!552200 () Bool)

(declare-fun mapRes!36011 () Bool)

(assert (=> b!979611 (= e!552199 (and e!552200 mapRes!36011))))

(declare-fun condMapEmpty!36011 () Bool)

(declare-fun mapDefault!36011 () ValueCell!10846)

