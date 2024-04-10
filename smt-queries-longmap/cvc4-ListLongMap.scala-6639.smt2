; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83810 () Bool)

(assert start!83810)

(declare-fun b_free!19619 () Bool)

(declare-fun b_next!19619 () Bool)

(assert (=> start!83810 (= b_free!19619 (not b_next!19619))))

(declare-fun tp!68299 () Bool)

(declare-fun b_and!31327 () Bool)

(assert (=> start!83810 (= tp!68299 b_and!31327)))

(declare-fun b!978877 () Bool)

(declare-fun e!551822 () Bool)

(declare-fun e!551826 () Bool)

(declare-fun mapRes!35948 () Bool)

(assert (=> b!978877 (= e!551822 (and e!551826 mapRes!35948))))

(declare-fun condMapEmpty!35948 () Bool)

(declare-datatypes ((V!35133 0))(
  ( (V!35134 (val!11357 Int)) )
))
(declare-datatypes ((ValueCell!10825 0))(
  ( (ValueCellFull!10825 (v!13919 V!35133)) (EmptyCell!10825) )
))
(declare-datatypes ((array!61251 0))(
  ( (array!61252 (arr!29483 (Array (_ BitVec 32) ValueCell!10825)) (size!29962 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61251)

(declare-fun mapDefault!35948 () ValueCell!10825)

