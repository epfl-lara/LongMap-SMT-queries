; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83802 () Bool)

(assert start!83802)

(declare-fun b_free!19611 () Bool)

(declare-fun b_next!19611 () Bool)

(assert (=> start!83802 (= b_free!19611 (not b_next!19611))))

(declare-fun tp!68275 () Bool)

(declare-fun b_and!31311 () Bool)

(assert (=> start!83802 (= tp!68275 b_and!31311)))

(declare-fun mapNonEmpty!35936 () Bool)

(declare-fun mapRes!35936 () Bool)

(declare-fun tp!68274 () Bool)

(declare-fun e!551765 () Bool)

(assert (=> mapNonEmpty!35936 (= mapRes!35936 (and tp!68274 e!551765))))

(declare-datatypes ((V!35123 0))(
  ( (V!35124 (val!11353 Int)) )
))
(declare-datatypes ((ValueCell!10821 0))(
  ( (ValueCellFull!10821 (v!13915 V!35123)) (EmptyCell!10821) )
))
(declare-datatypes ((array!61235 0))(
  ( (array!61236 (arr!29475 (Array (_ BitVec 32) ValueCell!10821)) (size!29954 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61235)

(declare-fun mapValue!35936 () ValueCell!10821)

(declare-fun mapRest!35936 () (Array (_ BitVec 32) ValueCell!10821))

(declare-fun mapKey!35936 () (_ BitVec 32))

(assert (=> mapNonEmpty!35936 (= (arr!29475 _values!1278) (store mapRest!35936 mapKey!35936 mapValue!35936))))

(declare-fun b!978749 () Bool)

(declare-fun res!655000 () Bool)

(declare-fun e!551766 () Bool)

(assert (=> b!978749 (=> (not res!655000) (not e!551766))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61237 0))(
  ( (array!61238 (arr!29476 (Array (_ BitVec 32) (_ BitVec 64))) (size!29955 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61237)

(assert (=> b!978749 (= res!655000 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29955 _keys!1544))))))

(declare-fun b!978750 () Bool)

(declare-fun res!654996 () Bool)

(assert (=> b!978750 (=> (not res!654996) (not e!551766))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61237 (_ BitVec 32)) Bool)

(assert (=> b!978750 (= res!654996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978751 () Bool)

(declare-fun res!654997 () Bool)

(assert (=> b!978751 (=> (not res!654997) (not e!551766))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978751 (= res!654997 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978752 () Bool)

(declare-fun res!654998 () Bool)

(assert (=> b!978752 (=> (not res!654998) (not e!551766))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978752 (= res!654998 (validKeyInArray!0 (select (arr!29476 _keys!1544) from!1932)))))

(declare-fun b!978753 () Bool)

(declare-fun tp_is_empty!22605 () Bool)

(assert (=> b!978753 (= e!551765 tp_is_empty!22605)))

(declare-fun b!978754 () Bool)

(declare-fun res!654995 () Bool)

(assert (=> b!978754 (=> (not res!654995) (not e!551766))))

(assert (=> b!978754 (= res!654995 (and (= (size!29954 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29955 _keys!1544) (size!29954 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978755 () Bool)

(declare-fun e!551762 () Bool)

(declare-fun e!551763 () Bool)

(assert (=> b!978755 (= e!551762 (and e!551763 mapRes!35936))))

(declare-fun condMapEmpty!35936 () Bool)

(declare-fun mapDefault!35936 () ValueCell!10821)

(assert (=> b!978755 (= condMapEmpty!35936 (= (arr!29475 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10821)) mapDefault!35936)))))

(declare-fun res!655001 () Bool)

(assert (=> start!83802 (=> (not res!655001) (not e!551766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83802 (= res!655001 (validMask!0 mask!1948))))

(assert (=> start!83802 e!551766))

(assert (=> start!83802 true))

(assert (=> start!83802 tp_is_empty!22605))

(declare-fun array_inv!22787 (array!61235) Bool)

(assert (=> start!83802 (and (array_inv!22787 _values!1278) e!551762)))

(assert (=> start!83802 tp!68275))

(declare-fun array_inv!22788 (array!61237) Bool)

(assert (=> start!83802 (array_inv!22788 _keys!1544)))

(declare-fun b!978756 () Bool)

(assert (=> b!978756 (= e!551763 tp_is_empty!22605)))

(declare-fun b!978757 () Bool)

(assert (=> b!978757 (= e!551766 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!14562 0))(
  ( (tuple2!14563 (_1!7292 (_ BitVec 64)) (_2!7292 V!35123)) )
))
(declare-datatypes ((List!20432 0))(
  ( (Nil!20429) (Cons!20428 (h!21590 tuple2!14562) (t!28999 List!20432)) )
))
(declare-datatypes ((ListLongMap!13259 0))(
  ( (ListLongMap!13260 (toList!6645 List!20432)) )
))
(declare-fun lt!433916 () ListLongMap!13259)

(declare-fun lt!433919 () tuple2!14562)

(declare-fun lt!433917 () tuple2!14562)

(declare-fun +!2950 (ListLongMap!13259 tuple2!14562) ListLongMap!13259)

(assert (=> b!978757 (= (+!2950 (+!2950 lt!433916 lt!433919) lt!433917) (+!2950 (+!2950 lt!433916 lt!433917) lt!433919))))

(declare-fun lt!433915 () V!35123)

(assert (=> b!978757 (= lt!433917 (tuple2!14563 (select (arr!29476 _keys!1544) from!1932) lt!433915))))

(declare-fun minValue!1220 () V!35123)

(assert (=> b!978757 (= lt!433919 (tuple2!14563 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32539 0))(
  ( (Unit!32540) )
))
(declare-fun lt!433918 () Unit!32539)

(declare-fun addCommutativeForDiffKeys!578 (ListLongMap!13259 (_ BitVec 64) V!35123 (_ BitVec 64) V!35123) Unit!32539)

(assert (=> b!978757 (= lt!433918 (addCommutativeForDiffKeys!578 lt!433916 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29476 _keys!1544) from!1932) lt!433915))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15267 (ValueCell!10821 V!35123) V!35123)

(declare-fun dynLambda!1738 (Int (_ BitVec 64)) V!35123)

(assert (=> b!978757 (= lt!433915 (get!15267 (select (arr!29475 _values!1278) from!1932) (dynLambda!1738 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35123)

(declare-fun getCurrentListMapNoExtraKeys!3352 (array!61237 array!61235 (_ BitVec 32) (_ BitVec 32) V!35123 V!35123 (_ BitVec 32) Int) ListLongMap!13259)

(assert (=> b!978757 (= lt!433916 (+!2950 (getCurrentListMapNoExtraKeys!3352 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14563 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun mapIsEmpty!35936 () Bool)

(assert (=> mapIsEmpty!35936 mapRes!35936))

(declare-fun b!978758 () Bool)

(declare-fun res!654999 () Bool)

(assert (=> b!978758 (=> (not res!654999) (not e!551766))))

(declare-datatypes ((List!20433 0))(
  ( (Nil!20430) (Cons!20429 (h!21591 (_ BitVec 64)) (t!29000 List!20433)) )
))
(declare-fun arrayNoDuplicates!0 (array!61237 (_ BitVec 32) List!20433) Bool)

(assert (=> b!978758 (= res!654999 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20430))))

(assert (= (and start!83802 res!655001) b!978754))

(assert (= (and b!978754 res!654995) b!978750))

(assert (= (and b!978750 res!654996) b!978758))

(assert (= (and b!978758 res!654999) b!978749))

(assert (= (and b!978749 res!655000) b!978752))

(assert (= (and b!978752 res!654998) b!978751))

(assert (= (and b!978751 res!654997) b!978757))

(assert (= (and b!978755 condMapEmpty!35936) mapIsEmpty!35936))

(assert (= (and b!978755 (not condMapEmpty!35936)) mapNonEmpty!35936))

(get-info :version)

(assert (= (and mapNonEmpty!35936 ((_ is ValueCellFull!10821) mapValue!35936)) b!978753))

(assert (= (and b!978755 ((_ is ValueCellFull!10821) mapDefault!35936)) b!978756))

(assert (= start!83802 b!978755))

(declare-fun b_lambda!14655 () Bool)

(assert (=> (not b_lambda!14655) (not b!978757)))

(declare-fun t!28998 () Bool)

(declare-fun tb!6417 () Bool)

(assert (=> (and start!83802 (= defaultEntry!1281 defaultEntry!1281) t!28998) tb!6417))

(declare-fun result!12823 () Bool)

(assert (=> tb!6417 (= result!12823 tp_is_empty!22605)))

(assert (=> b!978757 t!28998))

(declare-fun b_and!31313 () Bool)

(assert (= b_and!31311 (and (=> t!28998 result!12823) b_and!31313)))

(declare-fun m!905935 () Bool)

(assert (=> b!978757 m!905935))

(assert (=> b!978757 m!905935))

(declare-fun m!905937 () Bool)

(assert (=> b!978757 m!905937))

(declare-fun m!905939 () Bool)

(assert (=> b!978757 m!905939))

(declare-fun m!905941 () Bool)

(assert (=> b!978757 m!905941))

(assert (=> b!978757 m!905939))

(declare-fun m!905943 () Bool)

(assert (=> b!978757 m!905943))

(declare-fun m!905945 () Bool)

(assert (=> b!978757 m!905945))

(declare-fun m!905947 () Bool)

(assert (=> b!978757 m!905947))

(declare-fun m!905949 () Bool)

(assert (=> b!978757 m!905949))

(assert (=> b!978757 m!905941))

(assert (=> b!978757 m!905949))

(declare-fun m!905951 () Bool)

(assert (=> b!978757 m!905951))

(assert (=> b!978757 m!905947))

(declare-fun m!905953 () Bool)

(assert (=> b!978757 m!905953))

(assert (=> b!978757 m!905945))

(declare-fun m!905955 () Bool)

(assert (=> b!978757 m!905955))

(declare-fun m!905957 () Bool)

(assert (=> start!83802 m!905957))

(declare-fun m!905959 () Bool)

(assert (=> start!83802 m!905959))

(declare-fun m!905961 () Bool)

(assert (=> start!83802 m!905961))

(assert (=> b!978752 m!905939))

(assert (=> b!978752 m!905939))

(declare-fun m!905963 () Bool)

(assert (=> b!978752 m!905963))

(declare-fun m!905965 () Bool)

(assert (=> b!978750 m!905965))

(declare-fun m!905967 () Bool)

(assert (=> mapNonEmpty!35936 m!905967))

(declare-fun m!905969 () Bool)

(assert (=> b!978758 m!905969))

(check-sat (not b_next!19611) tp_is_empty!22605 (not mapNonEmpty!35936) (not b!978758) (not b!978752) (not b!978757) b_and!31313 (not start!83802) (not b_lambda!14655) (not b!978750))
(check-sat b_and!31313 (not b_next!19611))
