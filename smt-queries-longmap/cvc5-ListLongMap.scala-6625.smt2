; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83722 () Bool)

(assert start!83722)

(declare-fun res!654265 () Bool)

(declare-fun e!551165 () Bool)

(assert (=> start!83722 (=> (not res!654265) (not e!551165))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83722 (= res!654265 (validMask!0 mask!1948))))

(assert (=> start!83722 e!551165))

(assert (=> start!83722 true))

(declare-datatypes ((V!35017 0))(
  ( (V!35018 (val!11313 Int)) )
))
(declare-datatypes ((ValueCell!10781 0))(
  ( (ValueCellFull!10781 (v!13875 V!35017)) (EmptyCell!10781) )
))
(declare-datatypes ((array!61077 0))(
  ( (array!61078 (arr!29396 (Array (_ BitVec 32) ValueCell!10781)) (size!29875 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61077)

(declare-fun e!551164 () Bool)

(declare-fun array_inv!22727 (array!61077) Bool)

(assert (=> start!83722 (and (array_inv!22727 _values!1278) e!551164)))

(declare-datatypes ((array!61079 0))(
  ( (array!61080 (arr!29397 (Array (_ BitVec 32) (_ BitVec 64))) (size!29876 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61079)

(declare-fun array_inv!22728 (array!61079) Bool)

(assert (=> start!83722 (array_inv!22728 _keys!1544)))

(declare-fun b!977608 () Bool)

(declare-fun res!654264 () Bool)

(assert (=> b!977608 (=> (not res!654264) (not e!551165))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977608 (= res!654264 (and (= (size!29875 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29876 _keys!1544) (size!29875 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977609 () Bool)

(assert (=> b!977609 (= e!551165 false)))

(declare-fun lt!433496 () Bool)

(declare-datatypes ((List!20380 0))(
  ( (Nil!20377) (Cons!20376 (h!21538 (_ BitVec 64)) (t!28895 List!20380)) )
))
(declare-fun arrayNoDuplicates!0 (array!61079 (_ BitVec 32) List!20380) Bool)

(assert (=> b!977609 (= lt!433496 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20377))))

(declare-fun b!977610 () Bool)

(declare-fun e!551163 () Bool)

(declare-fun tp_is_empty!22525 () Bool)

(assert (=> b!977610 (= e!551163 tp_is_empty!22525)))

(declare-fun mapNonEmpty!35816 () Bool)

(declare-fun mapRes!35816 () Bool)

(declare-fun tp!68068 () Bool)

(assert (=> mapNonEmpty!35816 (= mapRes!35816 (and tp!68068 e!551163))))

(declare-fun mapRest!35816 () (Array (_ BitVec 32) ValueCell!10781))

(declare-fun mapKey!35816 () (_ BitVec 32))

(declare-fun mapValue!35816 () ValueCell!10781)

(assert (=> mapNonEmpty!35816 (= (arr!29396 _values!1278) (store mapRest!35816 mapKey!35816 mapValue!35816))))

(declare-fun b!977611 () Bool)

(declare-fun e!551162 () Bool)

(assert (=> b!977611 (= e!551164 (and e!551162 mapRes!35816))))

(declare-fun condMapEmpty!35816 () Bool)

(declare-fun mapDefault!35816 () ValueCell!10781)

