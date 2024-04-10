; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83762 () Bool)

(assert start!83762)

(declare-fun b_free!19571 () Bool)

(declare-fun b_next!19571 () Bool)

(assert (=> start!83762 (= b_free!19571 (not b_next!19571))))

(declare-fun tp!68154 () Bool)

(declare-fun b_and!31231 () Bool)

(assert (=> start!83762 (= tp!68154 b_and!31231)))

(declare-fun b!978109 () Bool)

(declare-fun res!654577 () Bool)

(declare-fun e!551466 () Bool)

(assert (=> b!978109 (=> (not res!654577) (not e!551466))))

(declare-datatypes ((array!61157 0))(
  ( (array!61158 (arr!29436 (Array (_ BitVec 32) (_ BitVec 64))) (size!29915 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61157)

(declare-datatypes ((List!20399 0))(
  ( (Nil!20396) (Cons!20395 (h!21557 (_ BitVec 64)) (t!28926 List!20399)) )
))
(declare-fun arrayNoDuplicates!0 (array!61157 (_ BitVec 32) List!20399) Bool)

(assert (=> b!978109 (= res!654577 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20396))))

(declare-fun b!978110 () Bool)

(declare-fun e!551464 () Bool)

(declare-fun e!551462 () Bool)

(declare-fun mapRes!35876 () Bool)

(assert (=> b!978110 (= e!551464 (and e!551462 mapRes!35876))))

(declare-fun condMapEmpty!35876 () Bool)

(declare-datatypes ((V!35069 0))(
  ( (V!35070 (val!11333 Int)) )
))
(declare-datatypes ((ValueCell!10801 0))(
  ( (ValueCellFull!10801 (v!13895 V!35069)) (EmptyCell!10801) )
))
(declare-datatypes ((array!61159 0))(
  ( (array!61160 (arr!29437 (Array (_ BitVec 32) ValueCell!10801)) (size!29916 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61159)

(declare-fun mapDefault!35876 () ValueCell!10801)

