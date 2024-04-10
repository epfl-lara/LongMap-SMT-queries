; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83710 () Bool)

(assert start!83710)

(declare-fun res!654211 () Bool)

(declare-fun e!551072 () Bool)

(assert (=> start!83710 (=> (not res!654211) (not e!551072))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83710 (= res!654211 (validMask!0 mask!1948))))

(assert (=> start!83710 e!551072))

(assert (=> start!83710 true))

(declare-datatypes ((V!35001 0))(
  ( (V!35002 (val!11307 Int)) )
))
(declare-datatypes ((ValueCell!10775 0))(
  ( (ValueCellFull!10775 (v!13869 V!35001)) (EmptyCell!10775) )
))
(declare-datatypes ((array!61057 0))(
  ( (array!61058 (arr!29386 (Array (_ BitVec 32) ValueCell!10775)) (size!29865 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61057)

(declare-fun e!551073 () Bool)

(declare-fun array_inv!22719 (array!61057) Bool)

(assert (=> start!83710 (and (array_inv!22719 _values!1278) e!551073)))

(declare-datatypes ((array!61059 0))(
  ( (array!61060 (arr!29387 (Array (_ BitVec 32) (_ BitVec 64))) (size!29866 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61059)

(declare-fun array_inv!22720 (array!61059) Bool)

(assert (=> start!83710 (array_inv!22720 _keys!1544)))

(declare-fun b!977500 () Bool)

(declare-fun res!654212 () Bool)

(assert (=> b!977500 (=> (not res!654212) (not e!551072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61059 (_ BitVec 32)) Bool)

(assert (=> b!977500 (= res!654212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977501 () Bool)

(assert (=> b!977501 (= e!551072 false)))

(declare-fun lt!433478 () Bool)

(declare-datatypes ((List!20377 0))(
  ( (Nil!20374) (Cons!20373 (h!21535 (_ BitVec 64)) (t!28892 List!20377)) )
))
(declare-fun arrayNoDuplicates!0 (array!61059 (_ BitVec 32) List!20377) Bool)

(assert (=> b!977501 (= lt!433478 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20374))))

(declare-fun mapNonEmpty!35798 () Bool)

(declare-fun mapRes!35798 () Bool)

(declare-fun tp!68050 () Bool)

(declare-fun e!551076 () Bool)

(assert (=> mapNonEmpty!35798 (= mapRes!35798 (and tp!68050 e!551076))))

(declare-fun mapValue!35798 () ValueCell!10775)

(declare-fun mapKey!35798 () (_ BitVec 32))

(declare-fun mapRest!35798 () (Array (_ BitVec 32) ValueCell!10775))

(assert (=> mapNonEmpty!35798 (= (arr!29386 _values!1278) (store mapRest!35798 mapKey!35798 mapValue!35798))))

(declare-fun b!977502 () Bool)

(declare-fun e!551074 () Bool)

(assert (=> b!977502 (= e!551073 (and e!551074 mapRes!35798))))

(declare-fun condMapEmpty!35798 () Bool)

(declare-fun mapDefault!35798 () ValueCell!10775)

