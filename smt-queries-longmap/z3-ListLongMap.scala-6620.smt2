; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83860 () Bool)

(assert start!83860)

(declare-fun b!978241 () Bool)

(declare-fun res!654473 () Bool)

(declare-fun e!551523 () Bool)

(assert (=> b!978241 (=> (not res!654473) (not e!551523))))

(declare-datatypes ((array!61060 0))(
  ( (array!61061 (arr!29383 (Array (_ BitVec 32) (_ BitVec 64))) (size!29863 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61060)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61060 (_ BitVec 32)) Bool)

(assert (=> b!978241 (= res!654473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978242 () Bool)

(declare-fun e!551519 () Bool)

(declare-fun tp_is_empty!22495 () Bool)

(assert (=> b!978242 (= e!551519 tp_is_empty!22495)))

(declare-fun b!978243 () Bool)

(declare-fun e!551522 () Bool)

(declare-fun mapRes!35771 () Bool)

(assert (=> b!978243 (= e!551522 (and e!551519 mapRes!35771))))

(declare-fun condMapEmpty!35771 () Bool)

(declare-datatypes ((V!34977 0))(
  ( (V!34978 (val!11298 Int)) )
))
(declare-datatypes ((ValueCell!10766 0))(
  ( (ValueCellFull!10766 (v!13857 V!34977)) (EmptyCell!10766) )
))
(declare-datatypes ((array!61062 0))(
  ( (array!61063 (arr!29384 (Array (_ BitVec 32) ValueCell!10766)) (size!29864 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61062)

(declare-fun mapDefault!35771 () ValueCell!10766)

(assert (=> b!978243 (= condMapEmpty!35771 (= (arr!29384 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10766)) mapDefault!35771)))))

(declare-fun b!978244 () Bool)

(assert (=> b!978244 (= e!551523 false)))

(declare-fun lt!433812 () Bool)

(declare-datatypes ((List!20369 0))(
  ( (Nil!20366) (Cons!20365 (h!21533 (_ BitVec 64)) (t!28876 List!20369)) )
))
(declare-fun arrayNoDuplicates!0 (array!61060 (_ BitVec 32) List!20369) Bool)

(assert (=> b!978244 (= lt!433812 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20366))))

(declare-fun mapNonEmpty!35771 () Bool)

(declare-fun tp!68024 () Bool)

(declare-fun e!551520 () Bool)

(assert (=> mapNonEmpty!35771 (= mapRes!35771 (and tp!68024 e!551520))))

(declare-fun mapKey!35771 () (_ BitVec 32))

(declare-fun mapValue!35771 () ValueCell!10766)

(declare-fun mapRest!35771 () (Array (_ BitVec 32) ValueCell!10766))

(assert (=> mapNonEmpty!35771 (= (arr!29384 _values!1278) (store mapRest!35771 mapKey!35771 mapValue!35771))))

(declare-fun b!978245 () Bool)

(declare-fun res!654474 () Bool)

(assert (=> b!978245 (=> (not res!654474) (not e!551523))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978245 (= res!654474 (and (= (size!29864 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29863 _keys!1544) (size!29864 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35771 () Bool)

(assert (=> mapIsEmpty!35771 mapRes!35771))

(declare-fun b!978246 () Bool)

(assert (=> b!978246 (= e!551520 tp_is_empty!22495)))

(declare-fun res!654475 () Bool)

(assert (=> start!83860 (=> (not res!654475) (not e!551523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83860 (= res!654475 (validMask!0 mask!1948))))

(assert (=> start!83860 e!551523))

(assert (=> start!83860 true))

(declare-fun array_inv!22767 (array!61062) Bool)

(assert (=> start!83860 (and (array_inv!22767 _values!1278) e!551522)))

(declare-fun array_inv!22768 (array!61060) Bool)

(assert (=> start!83860 (array_inv!22768 _keys!1544)))

(assert (= (and start!83860 res!654475) b!978245))

(assert (= (and b!978245 res!654474) b!978241))

(assert (= (and b!978241 res!654473) b!978244))

(assert (= (and b!978243 condMapEmpty!35771) mapIsEmpty!35771))

(assert (= (and b!978243 (not condMapEmpty!35771)) mapNonEmpty!35771))

(get-info :version)

(assert (= (and mapNonEmpty!35771 ((_ is ValueCellFull!10766) mapValue!35771)) b!978246))

(assert (= (and b!978243 ((_ is ValueCellFull!10766) mapDefault!35771)) b!978242))

(assert (= start!83860 b!978243))

(declare-fun m!905933 () Bool)

(assert (=> b!978241 m!905933))

(declare-fun m!905935 () Bool)

(assert (=> b!978244 m!905935))

(declare-fun m!905937 () Bool)

(assert (=> mapNonEmpty!35771 m!905937))

(declare-fun m!905939 () Bool)

(assert (=> start!83860 m!905939))

(declare-fun m!905941 () Bool)

(assert (=> start!83860 m!905941))

(declare-fun m!905943 () Bool)

(assert (=> start!83860 m!905943))

(check-sat (not mapNonEmpty!35771) (not start!83860) (not b!978244) (not b!978241) tp_is_empty!22495)
(check-sat)
