; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83896 () Bool)

(assert start!83896)

(declare-fun b!978565 () Bool)

(declare-fun e!551790 () Bool)

(declare-fun e!551792 () Bool)

(declare-fun mapRes!35825 () Bool)

(assert (=> b!978565 (= e!551790 (and e!551792 mapRes!35825))))

(declare-fun condMapEmpty!35825 () Bool)

(declare-datatypes ((V!35025 0))(
  ( (V!35026 (val!11316 Int)) )
))
(declare-datatypes ((ValueCell!10784 0))(
  ( (ValueCellFull!10784 (v!13875 V!35025)) (EmptyCell!10784) )
))
(declare-datatypes ((array!61118 0))(
  ( (array!61119 (arr!29412 (Array (_ BitVec 32) ValueCell!10784)) (size!29892 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61118)

(declare-fun mapDefault!35825 () ValueCell!10784)

(assert (=> b!978565 (= condMapEmpty!35825 (= (arr!29412 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10784)) mapDefault!35825)))))

(declare-fun b!978566 () Bool)

(declare-fun res!654637 () Bool)

(declare-fun e!551789 () Bool)

(assert (=> b!978566 (=> (not res!654637) (not e!551789))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61120 0))(
  ( (array!61121 (arr!29413 (Array (_ BitVec 32) (_ BitVec 64))) (size!29893 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61120)

(assert (=> b!978566 (= res!654637 (and (= (size!29892 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29893 _keys!1544) (size!29892 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978567 () Bool)

(declare-fun tp_is_empty!22531 () Bool)

(assert (=> b!978567 (= e!551792 tp_is_empty!22531)))

(declare-fun b!978568 () Bool)

(declare-fun e!551793 () Bool)

(assert (=> b!978568 (= e!551793 tp_is_empty!22531)))

(declare-fun mapIsEmpty!35825 () Bool)

(assert (=> mapIsEmpty!35825 mapRes!35825))

(declare-fun b!978569 () Bool)

(assert (=> b!978569 (= e!551789 false)))

(declare-fun lt!433866 () Bool)

(declare-datatypes ((List!20377 0))(
  ( (Nil!20374) (Cons!20373 (h!21541 (_ BitVec 64)) (t!28884 List!20377)) )
))
(declare-fun arrayNoDuplicates!0 (array!61120 (_ BitVec 32) List!20377) Bool)

(assert (=> b!978569 (= lt!433866 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20374))))

(declare-fun b!978570 () Bool)

(declare-fun res!654636 () Bool)

(assert (=> b!978570 (=> (not res!654636) (not e!551789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61120 (_ BitVec 32)) Bool)

(assert (=> b!978570 (= res!654636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!35825 () Bool)

(declare-fun tp!68078 () Bool)

(assert (=> mapNonEmpty!35825 (= mapRes!35825 (and tp!68078 e!551793))))

(declare-fun mapRest!35825 () (Array (_ BitVec 32) ValueCell!10784))

(declare-fun mapValue!35825 () ValueCell!10784)

(declare-fun mapKey!35825 () (_ BitVec 32))

(assert (=> mapNonEmpty!35825 (= (arr!29412 _values!1278) (store mapRest!35825 mapKey!35825 mapValue!35825))))

(declare-fun res!654635 () Bool)

(assert (=> start!83896 (=> (not res!654635) (not e!551789))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83896 (= res!654635 (validMask!0 mask!1948))))

(assert (=> start!83896 e!551789))

(assert (=> start!83896 true))

(declare-fun array_inv!22783 (array!61118) Bool)

(assert (=> start!83896 (and (array_inv!22783 _values!1278) e!551790)))

(declare-fun array_inv!22784 (array!61120) Bool)

(assert (=> start!83896 (array_inv!22784 _keys!1544)))

(assert (= (and start!83896 res!654635) b!978566))

(assert (= (and b!978566 res!654637) b!978570))

(assert (= (and b!978570 res!654636) b!978569))

(assert (= (and b!978565 condMapEmpty!35825) mapIsEmpty!35825))

(assert (= (and b!978565 (not condMapEmpty!35825)) mapNonEmpty!35825))

(get-info :version)

(assert (= (and mapNonEmpty!35825 ((_ is ValueCellFull!10784) mapValue!35825)) b!978568))

(assert (= (and b!978565 ((_ is ValueCellFull!10784) mapDefault!35825)) b!978567))

(assert (= start!83896 b!978565))

(declare-fun m!906149 () Bool)

(assert (=> b!978569 m!906149))

(declare-fun m!906151 () Bool)

(assert (=> b!978570 m!906151))

(declare-fun m!906153 () Bool)

(assert (=> mapNonEmpty!35825 m!906153))

(declare-fun m!906155 () Bool)

(assert (=> start!83896 m!906155))

(declare-fun m!906157 () Bool)

(assert (=> start!83896 m!906157))

(declare-fun m!906159 () Bool)

(assert (=> start!83896 m!906159))

(check-sat (not start!83896) tp_is_empty!22531 (not b!978570) (not mapNonEmpty!35825) (not b!978569))
(check-sat)
