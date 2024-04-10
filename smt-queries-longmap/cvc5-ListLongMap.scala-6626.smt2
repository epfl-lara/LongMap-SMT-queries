; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83728 () Bool)

(assert start!83728)

(declare-fun b!977662 () Bool)

(declare-fun res!654291 () Bool)

(declare-fun e!551207 () Bool)

(assert (=> b!977662 (=> (not res!654291) (not e!551207))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35025 0))(
  ( (V!35026 (val!11316 Int)) )
))
(declare-datatypes ((ValueCell!10784 0))(
  ( (ValueCellFull!10784 (v!13878 V!35025)) (EmptyCell!10784) )
))
(declare-datatypes ((array!61089 0))(
  ( (array!61090 (arr!29402 (Array (_ BitVec 32) ValueCell!10784)) (size!29881 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61089)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61091 0))(
  ( (array!61092 (arr!29403 (Array (_ BitVec 32) (_ BitVec 64))) (size!29882 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61091)

(assert (=> b!977662 (= res!654291 (and (= (size!29881 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29882 _keys!1544) (size!29881 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977663 () Bool)

(assert (=> b!977663 (= e!551207 false)))

(declare-fun lt!433505 () Bool)

(declare-datatypes ((List!20383 0))(
  ( (Nil!20380) (Cons!20379 (h!21541 (_ BitVec 64)) (t!28898 List!20383)) )
))
(declare-fun arrayNoDuplicates!0 (array!61091 (_ BitVec 32) List!20383) Bool)

(assert (=> b!977663 (= lt!433505 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20380))))

(declare-fun res!654293 () Bool)

(assert (=> start!83728 (=> (not res!654293) (not e!551207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83728 (= res!654293 (validMask!0 mask!1948))))

(assert (=> start!83728 e!551207))

(assert (=> start!83728 true))

(declare-fun e!551210 () Bool)

(declare-fun array_inv!22731 (array!61089) Bool)

(assert (=> start!83728 (and (array_inv!22731 _values!1278) e!551210)))

(declare-fun array_inv!22732 (array!61091) Bool)

(assert (=> start!83728 (array_inv!22732 _keys!1544)))

(declare-fun mapIsEmpty!35825 () Bool)

(declare-fun mapRes!35825 () Bool)

(assert (=> mapIsEmpty!35825 mapRes!35825))

(declare-fun b!977664 () Bool)

(declare-fun e!551211 () Bool)

(declare-fun tp_is_empty!22531 () Bool)

(assert (=> b!977664 (= e!551211 tp_is_empty!22531)))

(declare-fun b!977665 () Bool)

(assert (=> b!977665 (= e!551210 (and e!551211 mapRes!35825))))

(declare-fun condMapEmpty!35825 () Bool)

(declare-fun mapDefault!35825 () ValueCell!10784)

