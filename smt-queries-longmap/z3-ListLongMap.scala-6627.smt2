; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83716 () Bool)

(assert start!83716)

(declare-fun res!654208 () Bool)

(declare-fun e!551104 () Bool)

(assert (=> start!83716 (=> (not res!654208) (not e!551104))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83716 (= res!654208 (validMask!0 mask!1948))))

(assert (=> start!83716 e!551104))

(assert (=> start!83716 true))

(declare-datatypes ((V!35033 0))(
  ( (V!35034 (val!11319 Int)) )
))
(declare-datatypes ((ValueCell!10787 0))(
  ( (ValueCellFull!10787 (v!13880 V!35033)) (EmptyCell!10787) )
))
(declare-datatypes ((array!61034 0))(
  ( (array!61035 (arr!29375 (Array (_ BitVec 32) ValueCell!10787)) (size!29856 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61034)

(declare-fun e!551108 () Bool)

(declare-fun array_inv!22747 (array!61034) Bool)

(assert (=> start!83716 (and (array_inv!22747 _values!1278) e!551108)))

(declare-datatypes ((array!61036 0))(
  ( (array!61037 (arr!29376 (Array (_ BitVec 32) (_ BitVec 64))) (size!29857 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61036)

(declare-fun array_inv!22748 (array!61036) Bool)

(assert (=> start!83716 (array_inv!22748 _keys!1544)))

(declare-fun b!977477 () Bool)

(declare-fun res!654209 () Bool)

(assert (=> b!977477 (=> (not res!654209) (not e!551104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61036 (_ BitVec 32)) Bool)

(assert (=> b!977477 (= res!654209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!35834 () Bool)

(declare-fun mapRes!35834 () Bool)

(declare-fun tp!68087 () Bool)

(declare-fun e!551106 () Bool)

(assert (=> mapNonEmpty!35834 (= mapRes!35834 (and tp!68087 e!551106))))

(declare-fun mapValue!35834 () ValueCell!10787)

(declare-fun mapRest!35834 () (Array (_ BitVec 32) ValueCell!10787))

(declare-fun mapKey!35834 () (_ BitVec 32))

(assert (=> mapNonEmpty!35834 (= (arr!29375 _values!1278) (store mapRest!35834 mapKey!35834 mapValue!35834))))

(declare-fun b!977478 () Bool)

(assert (=> b!977478 (= e!551104 false)))

(declare-fun lt!433278 () Bool)

(declare-datatypes ((List!20399 0))(
  ( (Nil!20396) (Cons!20395 (h!21557 (_ BitVec 64)) (t!28905 List!20399)) )
))
(declare-fun arrayNoDuplicates!0 (array!61036 (_ BitVec 32) List!20399) Bool)

(assert (=> b!977478 (= lt!433278 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20396))))

(declare-fun mapIsEmpty!35834 () Bool)

(assert (=> mapIsEmpty!35834 mapRes!35834))

(declare-fun b!977479 () Bool)

(declare-fun res!654210 () Bool)

(assert (=> b!977479 (=> (not res!654210) (not e!551104))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977479 (= res!654210 (and (= (size!29856 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29857 _keys!1544) (size!29856 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977480 () Bool)

(declare-fun e!551107 () Bool)

(declare-fun tp_is_empty!22537 () Bool)

(assert (=> b!977480 (= e!551107 tp_is_empty!22537)))

(declare-fun b!977481 () Bool)

(assert (=> b!977481 (= e!551108 (and e!551107 mapRes!35834))))

(declare-fun condMapEmpty!35834 () Bool)

(declare-fun mapDefault!35834 () ValueCell!10787)

(assert (=> b!977481 (= condMapEmpty!35834 (= (arr!29375 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10787)) mapDefault!35834)))))

(declare-fun b!977482 () Bool)

(assert (=> b!977482 (= e!551106 tp_is_empty!22537)))

(assert (= (and start!83716 res!654208) b!977479))

(assert (= (and b!977479 res!654210) b!977477))

(assert (= (and b!977477 res!654209) b!977478))

(assert (= (and b!977481 condMapEmpty!35834) mapIsEmpty!35834))

(assert (= (and b!977481 (not condMapEmpty!35834)) mapNonEmpty!35834))

(get-info :version)

(assert (= (and mapNonEmpty!35834 ((_ is ValueCellFull!10787) mapValue!35834)) b!977482))

(assert (= (and b!977481 ((_ is ValueCellFull!10787) mapDefault!35834)) b!977480))

(assert (= start!83716 b!977481))

(declare-fun m!904133 () Bool)

(assert (=> start!83716 m!904133))

(declare-fun m!904135 () Bool)

(assert (=> start!83716 m!904135))

(declare-fun m!904137 () Bool)

(assert (=> start!83716 m!904137))

(declare-fun m!904139 () Bool)

(assert (=> b!977477 m!904139))

(declare-fun m!904141 () Bool)

(assert (=> mapNonEmpty!35834 m!904141))

(declare-fun m!904143 () Bool)

(assert (=> b!977478 m!904143))

(check-sat tp_is_empty!22537 (not mapNonEmpty!35834) (not b!977477) (not b!977478) (not start!83716))
(check-sat)
