; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83884 () Bool)

(assert start!83884)

(declare-fun res!654582 () Bool)

(declare-fun e!551700 () Bool)

(assert (=> start!83884 (=> (not res!654582) (not e!551700))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83884 (= res!654582 (validMask!0 mask!1948))))

(assert (=> start!83884 e!551700))

(assert (=> start!83884 true))

(declare-datatypes ((V!35009 0))(
  ( (V!35010 (val!11310 Int)) )
))
(declare-datatypes ((ValueCell!10778 0))(
  ( (ValueCellFull!10778 (v!13869 V!35009)) (EmptyCell!10778) )
))
(declare-datatypes ((array!61098 0))(
  ( (array!61099 (arr!29402 (Array (_ BitVec 32) ValueCell!10778)) (size!29882 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61098)

(declare-fun e!551702 () Bool)

(declare-fun array_inv!22777 (array!61098) Bool)

(assert (=> start!83884 (and (array_inv!22777 _values!1278) e!551702)))

(declare-datatypes ((array!61100 0))(
  ( (array!61101 (arr!29403 (Array (_ BitVec 32) (_ BitVec 64))) (size!29883 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61100)

(declare-fun array_inv!22778 (array!61100) Bool)

(assert (=> start!83884 (array_inv!22778 _keys!1544)))

(declare-fun b!978457 () Bool)

(declare-fun res!654581 () Bool)

(assert (=> b!978457 (=> (not res!654581) (not e!551700))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978457 (= res!654581 (and (= (size!29882 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29883 _keys!1544) (size!29882 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978458 () Bool)

(declare-fun e!551701 () Bool)

(declare-fun tp_is_empty!22519 () Bool)

(assert (=> b!978458 (= e!551701 tp_is_empty!22519)))

(declare-fun mapNonEmpty!35807 () Bool)

(declare-fun mapRes!35807 () Bool)

(declare-fun tp!68060 () Bool)

(assert (=> mapNonEmpty!35807 (= mapRes!35807 (and tp!68060 e!551701))))

(declare-fun mapRest!35807 () (Array (_ BitVec 32) ValueCell!10778))

(declare-fun mapValue!35807 () ValueCell!10778)

(declare-fun mapKey!35807 () (_ BitVec 32))

(assert (=> mapNonEmpty!35807 (= (arr!29402 _values!1278) (store mapRest!35807 mapKey!35807 mapValue!35807))))

(declare-fun b!978459 () Bool)

(assert (=> b!978459 (= e!551700 false)))

(declare-fun lt!433848 () Bool)

(declare-datatypes ((List!20374 0))(
  ( (Nil!20371) (Cons!20370 (h!21538 (_ BitVec 64)) (t!28881 List!20374)) )
))
(declare-fun arrayNoDuplicates!0 (array!61100 (_ BitVec 32) List!20374) Bool)

(assert (=> b!978459 (= lt!433848 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20371))))

(declare-fun mapIsEmpty!35807 () Bool)

(assert (=> mapIsEmpty!35807 mapRes!35807))

(declare-fun b!978460 () Bool)

(declare-fun e!551703 () Bool)

(assert (=> b!978460 (= e!551702 (and e!551703 mapRes!35807))))

(declare-fun condMapEmpty!35807 () Bool)

(declare-fun mapDefault!35807 () ValueCell!10778)

(assert (=> b!978460 (= condMapEmpty!35807 (= (arr!29402 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10778)) mapDefault!35807)))))

(declare-fun b!978461 () Bool)

(assert (=> b!978461 (= e!551703 tp_is_empty!22519)))

(declare-fun b!978462 () Bool)

(declare-fun res!654583 () Bool)

(assert (=> b!978462 (=> (not res!654583) (not e!551700))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61100 (_ BitVec 32)) Bool)

(assert (=> b!978462 (= res!654583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!83884 res!654582) b!978457))

(assert (= (and b!978457 res!654581) b!978462))

(assert (= (and b!978462 res!654583) b!978459))

(assert (= (and b!978460 condMapEmpty!35807) mapIsEmpty!35807))

(assert (= (and b!978460 (not condMapEmpty!35807)) mapNonEmpty!35807))

(get-info :version)

(assert (= (and mapNonEmpty!35807 ((_ is ValueCellFull!10778) mapValue!35807)) b!978458))

(assert (= (and b!978460 ((_ is ValueCellFull!10778) mapDefault!35807)) b!978461))

(assert (= start!83884 b!978460))

(declare-fun m!906077 () Bool)

(assert (=> start!83884 m!906077))

(declare-fun m!906079 () Bool)

(assert (=> start!83884 m!906079))

(declare-fun m!906081 () Bool)

(assert (=> start!83884 m!906081))

(declare-fun m!906083 () Bool)

(assert (=> mapNonEmpty!35807 m!906083))

(declare-fun m!906085 () Bool)

(assert (=> b!978459 m!906085))

(declare-fun m!906087 () Bool)

(assert (=> b!978462 m!906087))

(check-sat (not mapNonEmpty!35807) (not start!83884) (not b!978462) tp_is_empty!22519 (not b!978459))
(check-sat)
