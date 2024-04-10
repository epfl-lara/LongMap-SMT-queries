; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83750 () Bool)

(assert start!83750)

(declare-fun b_free!19559 () Bool)

(declare-fun b_next!19559 () Bool)

(assert (=> start!83750 (= b_free!19559 (not b_next!19559))))

(declare-fun tp!68118 () Bool)

(declare-fun b_and!31209 () Bool)

(assert (=> start!83750 (= tp!68118 b_and!31209)))

(declare-fun b!977919 () Bool)

(declare-fun res!654450 () Bool)

(declare-fun e!551372 () Bool)

(assert (=> b!977919 (=> (not res!654450) (not e!551372))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61133 0))(
  ( (array!61134 (arr!29424 (Array (_ BitVec 32) (_ BitVec 64))) (size!29903 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61133)

(assert (=> b!977919 (= res!654450 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29903 _keys!1544))))))

(declare-fun b!977920 () Bool)

(declare-fun e!551376 () Bool)

(declare-fun e!551374 () Bool)

(declare-fun mapRes!35858 () Bool)

(assert (=> b!977920 (= e!551376 (and e!551374 mapRes!35858))))

(declare-fun condMapEmpty!35858 () Bool)

(declare-datatypes ((V!35053 0))(
  ( (V!35054 (val!11327 Int)) )
))
(declare-datatypes ((ValueCell!10795 0))(
  ( (ValueCellFull!10795 (v!13889 V!35053)) (EmptyCell!10795) )
))
(declare-datatypes ((array!61135 0))(
  ( (array!61136 (arr!29425 (Array (_ BitVec 32) ValueCell!10795)) (size!29904 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61135)

(declare-fun mapDefault!35858 () ValueCell!10795)

