; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83770 () Bool)

(assert start!83770)

(declare-fun b_free!19597 () Bool)

(declare-fun b_next!19597 () Bool)

(assert (=> start!83770 (= b_free!19597 (not b_next!19597))))

(declare-fun tp!68233 () Bool)

(declare-fun b_and!31257 () Bool)

(assert (=> start!83770 (= tp!68233 b_and!31257)))

(declare-fun res!654740 () Bool)

(declare-fun e!551510 () Bool)

(assert (=> start!83770 (=> (not res!654740) (not e!551510))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83770 (= res!654740 (validMask!0 mask!1948))))

(assert (=> start!83770 e!551510))

(assert (=> start!83770 true))

(declare-fun tp_is_empty!22591 () Bool)

(assert (=> start!83770 tp_is_empty!22591))

(declare-datatypes ((V!35105 0))(
  ( (V!35106 (val!11346 Int)) )
))
(declare-datatypes ((ValueCell!10814 0))(
  ( (ValueCellFull!10814 (v!13907 V!35105)) (EmptyCell!10814) )
))
(declare-datatypes ((array!61132 0))(
  ( (array!61133 (arr!29424 (Array (_ BitVec 32) ValueCell!10814)) (size!29905 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61132)

(declare-fun e!551509 () Bool)

(declare-fun array_inv!22787 (array!61132) Bool)

(assert (=> start!83770 (and (array_inv!22787 _values!1278) e!551509)))

(assert (=> start!83770 tp!68233))

(declare-datatypes ((array!61134 0))(
  ( (array!61135 (arr!29425 (Array (_ BitVec 32) (_ BitVec 64))) (size!29906 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61134)

(declare-fun array_inv!22788 (array!61134) Bool)

(assert (=> start!83770 (array_inv!22788 _keys!1544)))

(declare-fun b!978286 () Bool)

(declare-fun res!654738 () Bool)

(assert (=> b!978286 (=> (not res!654738) (not e!551510))))

(declare-datatypes ((List!20437 0))(
  ( (Nil!20434) (Cons!20433 (h!21595 (_ BitVec 64)) (t!28981 List!20437)) )
))
(declare-fun arrayNoDuplicates!0 (array!61134 (_ BitVec 32) List!20437) Bool)

(assert (=> b!978286 (= res!654738 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20434))))

(declare-fun mapNonEmpty!35915 () Bool)

(declare-fun mapRes!35915 () Bool)

(declare-fun tp!68234 () Bool)

(declare-fun e!551511 () Bool)

(assert (=> mapNonEmpty!35915 (= mapRes!35915 (and tp!68234 e!551511))))

(declare-fun mapKey!35915 () (_ BitVec 32))

(declare-fun mapValue!35915 () ValueCell!10814)

(declare-fun mapRest!35915 () (Array (_ BitVec 32) ValueCell!10814))

(assert (=> mapNonEmpty!35915 (= (arr!29424 _values!1278) (store mapRest!35915 mapKey!35915 mapValue!35915))))

(declare-fun b!978287 () Bool)

(declare-fun res!654739 () Bool)

(assert (=> b!978287 (=> (not res!654739) (not e!551510))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978287 (= res!654739 (validKeyInArray!0 (select (arr!29425 _keys!1544) from!1932)))))

(declare-fun b!978288 () Bool)

(declare-fun res!654743 () Bool)

(assert (=> b!978288 (=> (not res!654743) (not e!551510))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978288 (= res!654743 (and (= (size!29905 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29906 _keys!1544) (size!29905 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978289 () Bool)

(declare-fun e!551513 () Bool)

(assert (=> b!978289 (= e!551513 tp_is_empty!22591)))

(declare-fun b!978290 () Bool)

(declare-fun res!654741 () Bool)

(assert (=> b!978290 (=> (not res!654741) (not e!551510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61134 (_ BitVec 32)) Bool)

(assert (=> b!978290 (= res!654741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978291 () Bool)

(assert (=> b!978291 (= e!551511 tp_is_empty!22591)))

(declare-fun b!978292 () Bool)

(declare-fun res!654742 () Bool)

(assert (=> b!978292 (=> (not res!654742) (not e!551510))))

(assert (=> b!978292 (= res!654742 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29906 _keys!1544))))))

(declare-fun b!978293 () Bool)

(assert (=> b!978293 (= e!551510 (not true))))

(declare-datatypes ((tuple2!14610 0))(
  ( (tuple2!14611 (_1!7316 (_ BitVec 64)) (_2!7316 V!35105)) )
))
(declare-datatypes ((List!20438 0))(
  ( (Nil!20435) (Cons!20434 (h!21596 tuple2!14610) (t!28982 List!20438)) )
))
(declare-datatypes ((ListLongMap!13297 0))(
  ( (ListLongMap!13298 (toList!6664 List!20438)) )
))
(declare-fun lt!433578 () ListLongMap!13297)

(declare-fun lt!433574 () tuple2!14610)

(declare-fun lt!433577 () tuple2!14610)

(declare-fun +!2964 (ListLongMap!13297 tuple2!14610) ListLongMap!13297)

(assert (=> b!978293 (= (+!2964 (+!2964 lt!433578 lt!433574) lt!433577) (+!2964 (+!2964 lt!433578 lt!433577) lt!433574))))

(declare-fun lt!433575 () V!35105)

(assert (=> b!978293 (= lt!433577 (tuple2!14611 (select (arr!29425 _keys!1544) from!1932) lt!433575))))

(declare-fun minValue!1220 () V!35105)

(assert (=> b!978293 (= lt!433574 (tuple2!14611 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32394 0))(
  ( (Unit!32395) )
))
(declare-fun lt!433576 () Unit!32394)

(declare-fun addCommutativeForDiffKeys!568 (ListLongMap!13297 (_ BitVec 64) V!35105 (_ BitVec 64) V!35105) Unit!32394)

(assert (=> b!978293 (= lt!433576 (addCommutativeForDiffKeys!568 lt!433578 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29425 _keys!1544) from!1932) lt!433575))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15247 (ValueCell!10814 V!35105) V!35105)

(declare-fun dynLambda!1717 (Int (_ BitVec 64)) V!35105)

(assert (=> b!978293 (= lt!433575 (get!15247 (select (arr!29424 _values!1278) from!1932) (dynLambda!1717 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35105)

(declare-fun getCurrentListMapNoExtraKeys!3384 (array!61134 array!61132 (_ BitVec 32) (_ BitVec 32) V!35105 V!35105 (_ BitVec 32) Int) ListLongMap!13297)

(assert (=> b!978293 (= lt!433578 (+!2964 (getCurrentListMapNoExtraKeys!3384 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14611 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!978294 () Bool)

(declare-fun res!654744 () Bool)

(assert (=> b!978294 (=> (not res!654744) (not e!551510))))

(assert (=> b!978294 (= res!654744 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978295 () Bool)

(assert (=> b!978295 (= e!551509 (and e!551513 mapRes!35915))))

(declare-fun condMapEmpty!35915 () Bool)

(declare-fun mapDefault!35915 () ValueCell!10814)

(assert (=> b!978295 (= condMapEmpty!35915 (= (arr!29424 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10814)) mapDefault!35915)))))

(declare-fun mapIsEmpty!35915 () Bool)

(assert (=> mapIsEmpty!35915 mapRes!35915))

(assert (= (and start!83770 res!654740) b!978288))

(assert (= (and b!978288 res!654743) b!978290))

(assert (= (and b!978290 res!654741) b!978286))

(assert (= (and b!978286 res!654738) b!978292))

(assert (= (and b!978292 res!654742) b!978287))

(assert (= (and b!978287 res!654739) b!978294))

(assert (= (and b!978294 res!654744) b!978293))

(assert (= (and b!978295 condMapEmpty!35915) mapIsEmpty!35915))

(assert (= (and b!978295 (not condMapEmpty!35915)) mapNonEmpty!35915))

(get-info :version)

(assert (= (and mapNonEmpty!35915 ((_ is ValueCellFull!10814) mapValue!35915)) b!978291))

(assert (= (and b!978295 ((_ is ValueCellFull!10814) mapDefault!35915)) b!978289))

(assert (= start!83770 b!978295))

(declare-fun b_lambda!14623 () Bool)

(assert (=> (not b_lambda!14623) (not b!978293)))

(declare-fun t!28980 () Bool)

(declare-fun tb!6395 () Bool)

(assert (=> (and start!83770 (= defaultEntry!1281 defaultEntry!1281) t!28980) tb!6395))

(declare-fun result!12787 () Bool)

(assert (=> tb!6395 (= result!12787 tp_is_empty!22591)))

(assert (=> b!978293 t!28980))

(declare-fun b_and!31259 () Bool)

(assert (= b_and!31257 (and (=> t!28980 result!12787) b_and!31259)))

(declare-fun m!904925 () Bool)

(assert (=> mapNonEmpty!35915 m!904925))

(declare-fun m!904927 () Bool)

(assert (=> b!978290 m!904927))

(declare-fun m!904929 () Bool)

(assert (=> b!978287 m!904929))

(assert (=> b!978287 m!904929))

(declare-fun m!904931 () Bool)

(assert (=> b!978287 m!904931))

(declare-fun m!904933 () Bool)

(assert (=> start!83770 m!904933))

(declare-fun m!904935 () Bool)

(assert (=> start!83770 m!904935))

(declare-fun m!904937 () Bool)

(assert (=> start!83770 m!904937))

(declare-fun m!904939 () Bool)

(assert (=> b!978286 m!904939))

(assert (=> b!978293 m!904929))

(declare-fun m!904941 () Bool)

(assert (=> b!978293 m!904941))

(assert (=> b!978293 m!904929))

(declare-fun m!904943 () Bool)

(assert (=> b!978293 m!904943))

(declare-fun m!904945 () Bool)

(assert (=> b!978293 m!904945))

(declare-fun m!904947 () Bool)

(assert (=> b!978293 m!904947))

(declare-fun m!904949 () Bool)

(assert (=> b!978293 m!904949))

(declare-fun m!904951 () Bool)

(assert (=> b!978293 m!904951))

(assert (=> b!978293 m!904945))

(declare-fun m!904953 () Bool)

(assert (=> b!978293 m!904953))

(declare-fun m!904955 () Bool)

(assert (=> b!978293 m!904955))

(assert (=> b!978293 m!904943))

(assert (=> b!978293 m!904955))

(declare-fun m!904957 () Bool)

(assert (=> b!978293 m!904957))

(assert (=> b!978293 m!904947))

(assert (=> b!978293 m!904951))

(declare-fun m!904959 () Bool)

(assert (=> b!978293 m!904959))

(check-sat (not b!978293) (not b_next!19597) tp_is_empty!22591 (not start!83770) b_and!31259 (not mapNonEmpty!35915) (not b!978290) (not b!978287) (not b_lambda!14623) (not b!978286))
(check-sat b_and!31259 (not b_next!19597))
