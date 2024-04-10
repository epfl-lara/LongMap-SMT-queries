; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83812 () Bool)

(assert start!83812)

(declare-fun b_free!19621 () Bool)

(declare-fun b_next!19621 () Bool)

(assert (=> start!83812 (= b_free!19621 (not b_next!19621))))

(declare-fun tp!68305 () Bool)

(declare-fun b_and!31331 () Bool)

(assert (=> start!83812 (= tp!68305 b_and!31331)))

(declare-fun res!655105 () Bool)

(declare-fun e!551841 () Bool)

(assert (=> start!83812 (=> (not res!655105) (not e!551841))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83812 (= res!655105 (validMask!0 mask!1948))))

(assert (=> start!83812 e!551841))

(assert (=> start!83812 true))

(declare-fun tp_is_empty!22615 () Bool)

(assert (=> start!83812 tp_is_empty!22615))

(declare-datatypes ((V!35137 0))(
  ( (V!35138 (val!11358 Int)) )
))
(declare-datatypes ((ValueCell!10826 0))(
  ( (ValueCellFull!10826 (v!13920 V!35137)) (EmptyCell!10826) )
))
(declare-datatypes ((array!61253 0))(
  ( (array!61254 (arr!29484 (Array (_ BitVec 32) ValueCell!10826)) (size!29963 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61253)

(declare-fun e!551844 () Bool)

(declare-fun array_inv!22795 (array!61253) Bool)

(assert (=> start!83812 (and (array_inv!22795 _values!1278) e!551844)))

(assert (=> start!83812 tp!68305))

(declare-datatypes ((array!61255 0))(
  ( (array!61256 (arr!29485 (Array (_ BitVec 32) (_ BitVec 64))) (size!29964 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61255)

(declare-fun array_inv!22796 (array!61255) Bool)

(assert (=> start!83812 (array_inv!22796 _keys!1544)))

(declare-fun b!978911 () Bool)

(declare-fun res!655106 () Bool)

(assert (=> b!978911 (=> (not res!655106) (not e!551841))))

(declare-datatypes ((List!20439 0))(
  ( (Nil!20436) (Cons!20435 (h!21597 (_ BitVec 64)) (t!29016 List!20439)) )
))
(declare-fun arrayNoDuplicates!0 (array!61255 (_ BitVec 32) List!20439) Bool)

(assert (=> b!978911 (= res!655106 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20436))))

(declare-fun b!978912 () Bool)

(declare-fun e!551839 () Bool)

(assert (=> b!978912 (= e!551839 tp_is_empty!22615)))

(declare-fun b!978913 () Bool)

(declare-fun res!655109 () Bool)

(assert (=> b!978913 (=> (not res!655109) (not e!551841))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978913 (= res!655109 (and (= (size!29963 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29964 _keys!1544) (size!29963 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978914 () Bool)

(declare-fun mapRes!35951 () Bool)

(assert (=> b!978914 (= e!551844 (and e!551839 mapRes!35951))))

(declare-fun condMapEmpty!35951 () Bool)

(declare-fun mapDefault!35951 () ValueCell!10826)

