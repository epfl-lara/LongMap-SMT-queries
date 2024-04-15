; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83674 () Bool)

(assert start!83674)

(declare-fun b!977099 () Bool)

(declare-fun res!654020 () Bool)

(declare-fun e!550789 () Bool)

(assert (=> b!977099 (=> (not res!654020) (not e!550789))))

(declare-datatypes ((array!60956 0))(
  ( (array!60957 (arr!29336 (Array (_ BitVec 32) (_ BitVec 64))) (size!29817 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!60956)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60956 (_ BitVec 32)) Bool)

(assert (=> b!977099 (= res!654020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977100 () Bool)

(declare-fun res!654019 () Bool)

(assert (=> b!977100 (=> (not res!654019) (not e!550789))))

(declare-datatypes ((V!34977 0))(
  ( (V!34978 (val!11298 Int)) )
))
(declare-datatypes ((ValueCell!10766 0))(
  ( (ValueCellFull!10766 (v!13859 V!34977)) (EmptyCell!10766) )
))
(declare-datatypes ((array!60958 0))(
  ( (array!60959 (arr!29337 (Array (_ BitVec 32) ValueCell!10766)) (size!29818 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60958)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977100 (= res!654019 (and (= (size!29818 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29817 _keys!1544) (size!29818 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977101 () Bool)

(assert (=> b!977101 (= e!550789 false)))

(declare-fun lt!433215 () Bool)

(declare-datatypes ((List!20383 0))(
  ( (Nil!20380) (Cons!20379 (h!21541 (_ BitVec 64)) (t!28889 List!20383)) )
))
(declare-fun arrayNoDuplicates!0 (array!60956 (_ BitVec 32) List!20383) Bool)

(assert (=> b!977101 (= lt!433215 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20380))))

(declare-fun b!977102 () Bool)

(declare-fun e!550793 () Bool)

(declare-fun tp_is_empty!22495 () Bool)

(assert (=> b!977102 (= e!550793 tp_is_empty!22495)))

(declare-fun b!977103 () Bool)

(declare-fun e!550792 () Bool)

(declare-fun mapRes!35771 () Bool)

(assert (=> b!977103 (= e!550792 (and e!550793 mapRes!35771))))

(declare-fun condMapEmpty!35771 () Bool)

(declare-fun mapDefault!35771 () ValueCell!10766)

(assert (=> b!977103 (= condMapEmpty!35771 (= (arr!29337 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10766)) mapDefault!35771)))))

(declare-fun mapIsEmpty!35771 () Bool)

(assert (=> mapIsEmpty!35771 mapRes!35771))

(declare-fun b!977104 () Bool)

(declare-fun e!550790 () Bool)

(assert (=> b!977104 (= e!550790 tp_is_empty!22495)))

(declare-fun mapNonEmpty!35771 () Bool)

(declare-fun tp!68024 () Bool)

(assert (=> mapNonEmpty!35771 (= mapRes!35771 (and tp!68024 e!550790))))

(declare-fun mapValue!35771 () ValueCell!10766)

(declare-fun mapRest!35771 () (Array (_ BitVec 32) ValueCell!10766))

(declare-fun mapKey!35771 () (_ BitVec 32))

(assert (=> mapNonEmpty!35771 (= (arr!29337 _values!1278) (store mapRest!35771 mapKey!35771 mapValue!35771))))

(declare-fun res!654021 () Bool)

(assert (=> start!83674 (=> (not res!654021) (not e!550789))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83674 (= res!654021 (validMask!0 mask!1948))))

(assert (=> start!83674 e!550789))

(assert (=> start!83674 true))

(declare-fun array_inv!22721 (array!60958) Bool)

(assert (=> start!83674 (and (array_inv!22721 _values!1278) e!550792)))

(declare-fun array_inv!22722 (array!60956) Bool)

(assert (=> start!83674 (array_inv!22722 _keys!1544)))

(assert (= (and start!83674 res!654021) b!977100))

(assert (= (and b!977100 res!654019) b!977099))

(assert (= (and b!977099 res!654020) b!977101))

(assert (= (and b!977103 condMapEmpty!35771) mapIsEmpty!35771))

(assert (= (and b!977103 (not condMapEmpty!35771)) mapNonEmpty!35771))

(get-info :version)

(assert (= (and mapNonEmpty!35771 ((_ is ValueCellFull!10766) mapValue!35771)) b!977104))

(assert (= (and b!977103 ((_ is ValueCellFull!10766) mapDefault!35771)) b!977102))

(assert (= start!83674 b!977103))

(declare-fun m!903881 () Bool)

(assert (=> b!977099 m!903881))

(declare-fun m!903883 () Bool)

(assert (=> b!977101 m!903883))

(declare-fun m!903885 () Bool)

(assert (=> mapNonEmpty!35771 m!903885))

(declare-fun m!903887 () Bool)

(assert (=> start!83674 m!903887))

(declare-fun m!903889 () Bool)

(assert (=> start!83674 m!903889))

(declare-fun m!903891 () Bool)

(assert (=> start!83674 m!903891))

(check-sat (not b!977101) (not mapNonEmpty!35771) tp_is_empty!22495 (not start!83674) (not b!977099))
(check-sat)
