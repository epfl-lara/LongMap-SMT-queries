; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83686 () Bool)

(assert start!83686)

(declare-fun b!977207 () Bool)

(declare-fun e!550880 () Bool)

(declare-fun tp_is_empty!22507 () Bool)

(assert (=> b!977207 (= e!550880 tp_is_empty!22507)))

(declare-fun b!977208 () Bool)

(declare-fun e!550882 () Bool)

(assert (=> b!977208 (= e!550882 false)))

(declare-fun lt!433233 () Bool)

(declare-datatypes ((array!60980 0))(
  ( (array!60981 (arr!29348 (Array (_ BitVec 32) (_ BitVec 64))) (size!29829 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!60980)

(declare-datatypes ((List!20388 0))(
  ( (Nil!20385) (Cons!20384 (h!21546 (_ BitVec 64)) (t!28894 List!20388)) )
))
(declare-fun arrayNoDuplicates!0 (array!60980 (_ BitVec 32) List!20388) Bool)

(assert (=> b!977208 (= lt!433233 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20385))))

(declare-fun b!977210 () Bool)

(declare-fun res!654075 () Bool)

(assert (=> b!977210 (=> (not res!654075) (not e!550882))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60980 (_ BitVec 32)) Bool)

(assert (=> b!977210 (= res!654075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!35789 () Bool)

(declare-fun mapRes!35789 () Bool)

(assert (=> mapIsEmpty!35789 mapRes!35789))

(declare-fun b!977211 () Bool)

(declare-fun e!550879 () Bool)

(assert (=> b!977211 (= e!550879 tp_is_empty!22507)))

(declare-fun b!977212 () Bool)

(declare-fun e!550883 () Bool)

(assert (=> b!977212 (= e!550883 (and e!550879 mapRes!35789))))

(declare-fun condMapEmpty!35789 () Bool)

(declare-datatypes ((V!34993 0))(
  ( (V!34994 (val!11304 Int)) )
))
(declare-datatypes ((ValueCell!10772 0))(
  ( (ValueCellFull!10772 (v!13865 V!34993)) (EmptyCell!10772) )
))
(declare-datatypes ((array!60982 0))(
  ( (array!60983 (arr!29349 (Array (_ BitVec 32) ValueCell!10772)) (size!29830 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60982)

(declare-fun mapDefault!35789 () ValueCell!10772)

(assert (=> b!977212 (= condMapEmpty!35789 (= (arr!29349 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10772)) mapDefault!35789)))))

(declare-fun mapNonEmpty!35789 () Bool)

(declare-fun tp!68042 () Bool)

(assert (=> mapNonEmpty!35789 (= mapRes!35789 (and tp!68042 e!550880))))

(declare-fun mapRest!35789 () (Array (_ BitVec 32) ValueCell!10772))

(declare-fun mapValue!35789 () ValueCell!10772)

(declare-fun mapKey!35789 () (_ BitVec 32))

(assert (=> mapNonEmpty!35789 (= (arr!29349 _values!1278) (store mapRest!35789 mapKey!35789 mapValue!35789))))

(declare-fun res!654073 () Bool)

(assert (=> start!83686 (=> (not res!654073) (not e!550882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83686 (= res!654073 (validMask!0 mask!1948))))

(assert (=> start!83686 e!550882))

(assert (=> start!83686 true))

(declare-fun array_inv!22729 (array!60982) Bool)

(assert (=> start!83686 (and (array_inv!22729 _values!1278) e!550883)))

(declare-fun array_inv!22730 (array!60980) Bool)

(assert (=> start!83686 (array_inv!22730 _keys!1544)))

(declare-fun b!977209 () Bool)

(declare-fun res!654074 () Bool)

(assert (=> b!977209 (=> (not res!654074) (not e!550882))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977209 (= res!654074 (and (= (size!29830 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29829 _keys!1544) (size!29830 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!83686 res!654073) b!977209))

(assert (= (and b!977209 res!654074) b!977210))

(assert (= (and b!977210 res!654075) b!977208))

(assert (= (and b!977212 condMapEmpty!35789) mapIsEmpty!35789))

(assert (= (and b!977212 (not condMapEmpty!35789)) mapNonEmpty!35789))

(get-info :version)

(assert (= (and mapNonEmpty!35789 ((_ is ValueCellFull!10772) mapValue!35789)) b!977207))

(assert (= (and b!977212 ((_ is ValueCellFull!10772) mapDefault!35789)) b!977211))

(assert (= start!83686 b!977212))

(declare-fun m!903953 () Bool)

(assert (=> b!977208 m!903953))

(declare-fun m!903955 () Bool)

(assert (=> b!977210 m!903955))

(declare-fun m!903957 () Bool)

(assert (=> mapNonEmpty!35789 m!903957))

(declare-fun m!903959 () Bool)

(assert (=> start!83686 m!903959))

(declare-fun m!903961 () Bool)

(assert (=> start!83686 m!903961))

(declare-fun m!903963 () Bool)

(assert (=> start!83686 m!903963))

(check-sat (not mapNonEmpty!35789) (not b!977208) (not b!977210) (not start!83686) tp_is_empty!22507)
(check-sat)
