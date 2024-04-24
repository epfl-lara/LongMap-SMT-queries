; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83914 () Bool)

(assert start!83914)

(declare-fun b_free!19555 () Bool)

(declare-fun b_next!19555 () Bool)

(assert (=> start!83914 (= b_free!19555 (not b_next!19555))))

(declare-fun tp!68107 () Bool)

(declare-fun b_and!31215 () Bool)

(assert (=> start!83914 (= tp!68107 b_and!31215)))

(declare-fun res!654753 () Bool)

(declare-fun e!551924 () Bool)

(assert (=> start!83914 (=> (not res!654753) (not e!551924))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83914 (= res!654753 (validMask!0 mask!1948))))

(assert (=> start!83914 e!551924))

(assert (=> start!83914 true))

(declare-fun tp_is_empty!22549 () Bool)

(assert (=> start!83914 tp_is_empty!22549))

(declare-datatypes ((V!35049 0))(
  ( (V!35050 (val!11325 Int)) )
))
(declare-datatypes ((ValueCell!10793 0))(
  ( (ValueCellFull!10793 (v!13884 V!35049)) (EmptyCell!10793) )
))
(declare-datatypes ((array!61152 0))(
  ( (array!61153 (arr!29429 (Array (_ BitVec 32) ValueCell!10793)) (size!29909 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61152)

(declare-fun e!551928 () Bool)

(declare-fun array_inv!22797 (array!61152) Bool)

(assert (=> start!83914 (and (array_inv!22797 _values!1278) e!551928)))

(assert (=> start!83914 tp!68107))

(declare-datatypes ((array!61154 0))(
  ( (array!61155 (arr!29430 (Array (_ BitVec 32) (_ BitVec 64))) (size!29910 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61154)

(declare-fun array_inv!22798 (array!61154) Bool)

(assert (=> start!83914 (array_inv!22798 _keys!1544)))

(declare-fun mapIsEmpty!35852 () Bool)

(declare-fun mapRes!35852 () Bool)

(assert (=> mapIsEmpty!35852 mapRes!35852))

(declare-fun b!978762 () Bool)

(declare-fun e!551925 () Bool)

(assert (=> b!978762 (= e!551925 tp_is_empty!22549)))

(declare-fun b!978763 () Bool)

(declare-fun res!654754 () Bool)

(assert (=> b!978763 (=> (not res!654754) (not e!551924))))

(declare-datatypes ((List!20384 0))(
  ( (Nil!20381) (Cons!20380 (h!21548 (_ BitVec 64)) (t!28891 List!20384)) )
))
(declare-fun arrayNoDuplicates!0 (array!61154 (_ BitVec 32) List!20384) Bool)

(assert (=> b!978763 (= res!654754 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20381))))

(declare-fun b!978764 () Bool)

(assert (=> b!978764 (= e!551928 (and e!551925 mapRes!35852))))

(declare-fun condMapEmpty!35852 () Bool)

(declare-fun mapDefault!35852 () ValueCell!10793)

(assert (=> b!978764 (= condMapEmpty!35852 (= (arr!29429 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10793)) mapDefault!35852)))))

(declare-fun b!978765 () Bool)

(declare-fun res!654756 () Bool)

(assert (=> b!978765 (=> (not res!654756) (not e!551924))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978765 (= res!654756 (and (= (size!29909 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29910 _keys!1544) (size!29909 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978766 () Bool)

(assert (=> b!978766 (= e!551924 false)))

(declare-fun minValue!1220 () V!35049)

(declare-fun zeroValue!1220 () V!35049)

(declare-datatypes ((tuple2!14522 0))(
  ( (tuple2!14523 (_1!7272 (_ BitVec 64)) (_2!7272 V!35049)) )
))
(declare-datatypes ((List!20385 0))(
  ( (Nil!20382) (Cons!20381 (h!21549 tuple2!14522) (t!28892 List!20385)) )
))
(declare-datatypes ((ListLongMap!13221 0))(
  ( (ListLongMap!13222 (toList!6626 List!20385)) )
))
(declare-fun lt!433884 () ListLongMap!13221)

(declare-fun defaultEntry!1281 () Int)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun +!2941 (ListLongMap!13221 tuple2!14522) ListLongMap!13221)

(declare-fun getCurrentListMapNoExtraKeys!3374 (array!61154 array!61152 (_ BitVec 32) (_ BitVec 32) V!35049 V!35049 (_ BitVec 32) Int) ListLongMap!13221)

(assert (=> b!978766 (= lt!433884 (+!2941 (getCurrentListMapNoExtraKeys!3374 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!978767 () Bool)

(declare-fun res!654752 () Bool)

(assert (=> b!978767 (=> (not res!654752) (not e!551924))))

(assert (=> b!978767 (= res!654752 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!35852 () Bool)

(declare-fun tp!68108 () Bool)

(declare-fun e!551927 () Bool)

(assert (=> mapNonEmpty!35852 (= mapRes!35852 (and tp!68108 e!551927))))

(declare-fun mapValue!35852 () ValueCell!10793)

(declare-fun mapRest!35852 () (Array (_ BitVec 32) ValueCell!10793))

(declare-fun mapKey!35852 () (_ BitVec 32))

(assert (=> mapNonEmpty!35852 (= (arr!29429 _values!1278) (store mapRest!35852 mapKey!35852 mapValue!35852))))

(declare-fun b!978768 () Bool)

(assert (=> b!978768 (= e!551927 tp_is_empty!22549)))

(declare-fun b!978769 () Bool)

(declare-fun res!654755 () Bool)

(assert (=> b!978769 (=> (not res!654755) (not e!551924))))

(assert (=> b!978769 (= res!654755 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29910 _keys!1544))))))

(declare-fun b!978770 () Bool)

(declare-fun res!654751 () Bool)

(assert (=> b!978770 (=> (not res!654751) (not e!551924))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978770 (= res!654751 (validKeyInArray!0 (select (arr!29430 _keys!1544) from!1932)))))

(declare-fun b!978771 () Bool)

(declare-fun res!654757 () Bool)

(assert (=> b!978771 (=> (not res!654757) (not e!551924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61154 (_ BitVec 32)) Bool)

(assert (=> b!978771 (= res!654757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!83914 res!654753) b!978765))

(assert (= (and b!978765 res!654756) b!978771))

(assert (= (and b!978771 res!654757) b!978763))

(assert (= (and b!978763 res!654754) b!978769))

(assert (= (and b!978769 res!654755) b!978770))

(assert (= (and b!978770 res!654751) b!978767))

(assert (= (and b!978767 res!654752) b!978766))

(assert (= (and b!978764 condMapEmpty!35852) mapIsEmpty!35852))

(assert (= (and b!978764 (not condMapEmpty!35852)) mapNonEmpty!35852))

(get-info :version)

(assert (= (and mapNonEmpty!35852 ((_ is ValueCellFull!10793) mapValue!35852)) b!978768))

(assert (= (and b!978764 ((_ is ValueCellFull!10793) mapDefault!35852)) b!978762))

(assert (= start!83914 b!978764))

(declare-fun m!906269 () Bool)

(assert (=> mapNonEmpty!35852 m!906269))

(declare-fun m!906271 () Bool)

(assert (=> b!978770 m!906271))

(assert (=> b!978770 m!906271))

(declare-fun m!906273 () Bool)

(assert (=> b!978770 m!906273))

(declare-fun m!906275 () Bool)

(assert (=> b!978771 m!906275))

(declare-fun m!906277 () Bool)

(assert (=> start!83914 m!906277))

(declare-fun m!906279 () Bool)

(assert (=> start!83914 m!906279))

(declare-fun m!906281 () Bool)

(assert (=> start!83914 m!906281))

(declare-fun m!906283 () Bool)

(assert (=> b!978766 m!906283))

(assert (=> b!978766 m!906283))

(declare-fun m!906285 () Bool)

(assert (=> b!978766 m!906285))

(declare-fun m!906287 () Bool)

(assert (=> b!978763 m!906287))

(check-sat (not b!978763) tp_is_empty!22549 (not b_next!19555) (not b!978770) (not mapNonEmpty!35852) (not b!978766) (not start!83914) b_and!31215 (not b!978771))
(check-sat b_and!31215 (not b_next!19555))
