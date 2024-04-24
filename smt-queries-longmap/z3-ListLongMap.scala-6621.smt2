; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83866 () Bool)

(assert start!83866)

(declare-fun mapIsEmpty!35780 () Bool)

(declare-fun mapRes!35780 () Bool)

(assert (=> mapIsEmpty!35780 mapRes!35780))

(declare-fun b!978296 () Bool)

(declare-fun e!551566 () Bool)

(declare-fun tp_is_empty!22501 () Bool)

(assert (=> b!978296 (= e!551566 tp_is_empty!22501)))

(declare-fun b!978297 () Bool)

(declare-fun res!654502 () Bool)

(declare-fun e!551564 () Bool)

(assert (=> b!978297 (=> (not res!654502) (not e!551564))))

(declare-datatypes ((array!61068 0))(
  ( (array!61069 (arr!29387 (Array (_ BitVec 32) (_ BitVec 64))) (size!29867 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61068)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61068 (_ BitVec 32)) Bool)

(assert (=> b!978297 (= res!654502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978298 () Bool)

(declare-fun res!654500 () Bool)

(assert (=> b!978298 (=> (not res!654500) (not e!551564))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((V!34985 0))(
  ( (V!34986 (val!11301 Int)) )
))
(declare-datatypes ((ValueCell!10769 0))(
  ( (ValueCellFull!10769 (v!13860 V!34985)) (EmptyCell!10769) )
))
(declare-datatypes ((array!61070 0))(
  ( (array!61071 (arr!29388 (Array (_ BitVec 32) ValueCell!10769)) (size!29868 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61070)

(assert (=> b!978298 (= res!654500 (and (= (size!29868 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29867 _keys!1544) (size!29868 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978299 () Bool)

(declare-fun e!551568 () Bool)

(assert (=> b!978299 (= e!551568 (and e!551566 mapRes!35780))))

(declare-fun condMapEmpty!35780 () Bool)

(declare-fun mapDefault!35780 () ValueCell!10769)

(assert (=> b!978299 (= condMapEmpty!35780 (= (arr!29388 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10769)) mapDefault!35780)))))

(declare-fun res!654501 () Bool)

(assert (=> start!83866 (=> (not res!654501) (not e!551564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83866 (= res!654501 (validMask!0 mask!1948))))

(assert (=> start!83866 e!551564))

(assert (=> start!83866 true))

(declare-fun array_inv!22769 (array!61070) Bool)

(assert (=> start!83866 (and (array_inv!22769 _values!1278) e!551568)))

(declare-fun array_inv!22770 (array!61068) Bool)

(assert (=> start!83866 (array_inv!22770 _keys!1544)))

(declare-fun b!978295 () Bool)

(declare-fun e!551567 () Bool)

(assert (=> b!978295 (= e!551567 tp_is_empty!22501)))

(declare-fun b!978300 () Bool)

(assert (=> b!978300 (= e!551564 false)))

(declare-fun lt!433821 () Bool)

(declare-datatypes ((List!20370 0))(
  ( (Nil!20367) (Cons!20366 (h!21534 (_ BitVec 64)) (t!28877 List!20370)) )
))
(declare-fun arrayNoDuplicates!0 (array!61068 (_ BitVec 32) List!20370) Bool)

(assert (=> b!978300 (= lt!433821 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20367))))

(declare-fun mapNonEmpty!35780 () Bool)

(declare-fun tp!68033 () Bool)

(assert (=> mapNonEmpty!35780 (= mapRes!35780 (and tp!68033 e!551567))))

(declare-fun mapRest!35780 () (Array (_ BitVec 32) ValueCell!10769))

(declare-fun mapKey!35780 () (_ BitVec 32))

(declare-fun mapValue!35780 () ValueCell!10769)

(assert (=> mapNonEmpty!35780 (= (arr!29388 _values!1278) (store mapRest!35780 mapKey!35780 mapValue!35780))))

(assert (= (and start!83866 res!654501) b!978298))

(assert (= (and b!978298 res!654500) b!978297))

(assert (= (and b!978297 res!654502) b!978300))

(assert (= (and b!978299 condMapEmpty!35780) mapIsEmpty!35780))

(assert (= (and b!978299 (not condMapEmpty!35780)) mapNonEmpty!35780))

(get-info :version)

(assert (= (and mapNonEmpty!35780 ((_ is ValueCellFull!10769) mapValue!35780)) b!978295))

(assert (= (and b!978299 ((_ is ValueCellFull!10769) mapDefault!35780)) b!978296))

(assert (= start!83866 b!978299))

(declare-fun m!905969 () Bool)

(assert (=> b!978297 m!905969))

(declare-fun m!905971 () Bool)

(assert (=> start!83866 m!905971))

(declare-fun m!905973 () Bool)

(assert (=> start!83866 m!905973))

(declare-fun m!905975 () Bool)

(assert (=> start!83866 m!905975))

(declare-fun m!905977 () Bool)

(assert (=> b!978300 m!905977))

(declare-fun m!905979 () Bool)

(assert (=> mapNonEmpty!35780 m!905979))

(check-sat (not mapNonEmpty!35780) tp_is_empty!22501 (not start!83866) (not b!978297) (not b!978300))
(check-sat)
