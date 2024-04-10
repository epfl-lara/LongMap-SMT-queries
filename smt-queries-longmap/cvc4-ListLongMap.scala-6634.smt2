; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83780 () Bool)

(assert start!83780)

(declare-fun b_free!19589 () Bool)

(declare-fun b_next!19589 () Bool)

(assert (=> start!83780 (= b_free!19589 (not b_next!19589))))

(declare-fun tp!68208 () Bool)

(declare-fun b_and!31267 () Bool)

(assert (=> start!83780 (= tp!68208 b_and!31267)))

(declare-fun b!978397 () Bool)

(declare-fun res!654767 () Bool)

(declare-fun e!551601 () Bool)

(assert (=> b!978397 (=> (not res!654767) (not e!551601))))

(declare-datatypes ((array!61193 0))(
  ( (array!61194 (arr!29454 (Array (_ BitVec 32) (_ BitVec 64))) (size!29933 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61193)

(declare-datatypes ((List!20416 0))(
  ( (Nil!20413) (Cons!20412 (h!21574 (_ BitVec 64)) (t!28961 List!20416)) )
))
(declare-fun arrayNoDuplicates!0 (array!61193 (_ BitVec 32) List!20416) Bool)

(assert (=> b!978397 (= res!654767 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20413))))

(declare-fun mapIsEmpty!35903 () Bool)

(declare-fun mapRes!35903 () Bool)

(assert (=> mapIsEmpty!35903 mapRes!35903))

(declare-fun res!654765 () Bool)

(assert (=> start!83780 (=> (not res!654765) (not e!551601))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83780 (= res!654765 (validMask!0 mask!1948))))

(assert (=> start!83780 e!551601))

(assert (=> start!83780 true))

(declare-fun tp_is_empty!22583 () Bool)

(assert (=> start!83780 tp_is_empty!22583))

(declare-datatypes ((V!35093 0))(
  ( (V!35094 (val!11342 Int)) )
))
(declare-datatypes ((ValueCell!10810 0))(
  ( (ValueCellFull!10810 (v!13904 V!35093)) (EmptyCell!10810) )
))
(declare-datatypes ((array!61195 0))(
  ( (array!61196 (arr!29455 (Array (_ BitVec 32) ValueCell!10810)) (size!29934 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61195)

(declare-fun e!551599 () Bool)

(declare-fun array_inv!22771 (array!61195) Bool)

(assert (=> start!83780 (and (array_inv!22771 _values!1278) e!551599)))

(assert (=> start!83780 tp!68208))

(declare-fun array_inv!22772 (array!61193) Bool)

(assert (=> start!83780 (array_inv!22772 _keys!1544)))

(declare-fun b!978398 () Bool)

(declare-fun e!551600 () Bool)

(assert (=> b!978398 (= e!551599 (and e!551600 mapRes!35903))))

(declare-fun condMapEmpty!35903 () Bool)

(declare-fun mapDefault!35903 () ValueCell!10810)

