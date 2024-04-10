; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83854 () Bool)

(assert start!83854)

(declare-fun b_free!19663 () Bool)

(declare-fun b_next!19663 () Bool)

(assert (=> start!83854 (= b_free!19663 (not b_next!19663))))

(declare-fun tp!68431 () Bool)

(declare-fun b_and!31415 () Bool)

(assert (=> start!83854 (= tp!68431 b_and!31415)))

(declare-fun res!655613 () Bool)

(declare-fun e!552221 () Bool)

(assert (=> start!83854 (=> (not res!655613) (not e!552221))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83854 (= res!655613 (validMask!0 mask!1948))))

(assert (=> start!83854 e!552221))

(assert (=> start!83854 true))

(declare-fun tp_is_empty!22657 () Bool)

(assert (=> start!83854 tp_is_empty!22657))

(declare-datatypes ((V!35193 0))(
  ( (V!35194 (val!11379 Int)) )
))
(declare-datatypes ((ValueCell!10847 0))(
  ( (ValueCellFull!10847 (v!13941 V!35193)) (EmptyCell!10847) )
))
(declare-datatypes ((array!61331 0))(
  ( (array!61332 (arr!29523 (Array (_ BitVec 32) ValueCell!10847)) (size!30002 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61331)

(declare-fun e!552222 () Bool)

(declare-fun array_inv!22827 (array!61331) Bool)

(assert (=> start!83854 (and (array_inv!22827 _values!1278) e!552222)))

(assert (=> start!83854 tp!68431))

(declare-datatypes ((array!61333 0))(
  ( (array!61334 (arr!29524 (Array (_ BitVec 32) (_ BitVec 64))) (size!30003 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61333)

(declare-fun array_inv!22828 (array!61333) Bool)

(assert (=> start!83854 (array_inv!22828 _keys!1544)))

(declare-fun mapNonEmpty!36014 () Bool)

(declare-fun mapRes!36014 () Bool)

(declare-fun tp!68430 () Bool)

(declare-fun e!552218 () Bool)

(assert (=> mapNonEmpty!36014 (= mapRes!36014 (and tp!68430 e!552218))))

(declare-fun mapKey!36014 () (_ BitVec 32))

(declare-fun mapRest!36014 () (Array (_ BitVec 32) ValueCell!10847))

(declare-fun mapValue!36014 () ValueCell!10847)

(assert (=> mapNonEmpty!36014 (= (arr!29523 _values!1278) (store mapRest!36014 mapKey!36014 mapValue!36014))))

(declare-fun b!979646 () Bool)

(declare-fun e!552220 () Bool)

(assert (=> b!979646 (= e!552222 (and e!552220 mapRes!36014))))

(declare-fun condMapEmpty!36014 () Bool)

(declare-fun mapDefault!36014 () ValueCell!10847)

