; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83734 () Bool)

(assert start!83734)

(declare-fun b_free!19561 () Bool)

(declare-fun b_next!19561 () Bool)

(assert (=> start!83734 (= b_free!19561 (not b_next!19561))))

(declare-fun tp!68126 () Bool)

(declare-fun b_and!31185 () Bool)

(assert (=> start!83734 (= tp!68126 b_and!31185)))

(declare-fun b!977710 () Bool)

(declare-fun res!654362 () Bool)

(declare-fun e!551242 () Bool)

(assert (=> b!977710 (=> (not res!654362) (not e!551242))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35057 0))(
  ( (V!35058 (val!11328 Int)) )
))
(declare-datatypes ((ValueCell!10796 0))(
  ( (ValueCellFull!10796 (v!13889 V!35057)) (EmptyCell!10796) )
))
(declare-datatypes ((array!61066 0))(
  ( (array!61067 (arr!29391 (Array (_ BitVec 32) ValueCell!10796)) (size!29872 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61066)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61068 0))(
  ( (array!61069 (arr!29392 (Array (_ BitVec 32) (_ BitVec 64))) (size!29873 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61068)

(assert (=> b!977710 (= res!654362 (and (= (size!29872 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29873 _keys!1544) (size!29872 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35861 () Bool)

(declare-fun mapRes!35861 () Bool)

(declare-fun tp!68125 () Bool)

(declare-fun e!551239 () Bool)

(assert (=> mapNonEmpty!35861 (= mapRes!35861 (and tp!68125 e!551239))))

(declare-fun mapKey!35861 () (_ BitVec 32))

(declare-fun mapValue!35861 () ValueCell!10796)

(declare-fun mapRest!35861 () (Array (_ BitVec 32) ValueCell!10796))

(assert (=> mapNonEmpty!35861 (= (arr!29391 _values!1278) (store mapRest!35861 mapKey!35861 mapValue!35861))))

(declare-fun b!977712 () Bool)

(declare-fun e!551240 () Bool)

(declare-fun e!551241 () Bool)

(assert (=> b!977712 (= e!551240 (and e!551241 mapRes!35861))))

(declare-fun condMapEmpty!35861 () Bool)

(declare-fun mapDefault!35861 () ValueCell!10796)

(assert (=> b!977712 (= condMapEmpty!35861 (= (arr!29391 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10796)) mapDefault!35861)))))

(declare-fun b!977713 () Bool)

(declare-fun res!654360 () Bool)

(assert (=> b!977713 (=> (not res!654360) (not e!551242))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!977713 (= res!654360 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29873 _keys!1544))))))

(declare-fun b!977714 () Bool)

(assert (=> b!977714 (= e!551242 (not true))))

(declare-datatypes ((tuple2!14580 0))(
  ( (tuple2!14581 (_1!7301 (_ BitVec 64)) (_2!7301 V!35057)) )
))
(declare-datatypes ((List!20407 0))(
  ( (Nil!20404) (Cons!20403 (h!21565 tuple2!14580) (t!28915 List!20407)) )
))
(declare-datatypes ((ListLongMap!13267 0))(
  ( (ListLongMap!13268 (toList!6649 List!20407)) )
))
(declare-fun lt!433307 () ListLongMap!13267)

(declare-fun lt!433308 () tuple2!14580)

(declare-fun lt!433305 () tuple2!14580)

(declare-fun +!2949 (ListLongMap!13267 tuple2!14580) ListLongMap!13267)

(assert (=> b!977714 (= (+!2949 (+!2949 lt!433307 lt!433308) lt!433305) (+!2949 (+!2949 lt!433307 lt!433305) lt!433308))))

(declare-fun lt!433306 () V!35057)

(assert (=> b!977714 (= lt!433305 (tuple2!14581 (select (arr!29392 _keys!1544) from!1932) lt!433306))))

(declare-fun minValue!1220 () V!35057)

(assert (=> b!977714 (= lt!433308 (tuple2!14581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32364 0))(
  ( (Unit!32365) )
))
(declare-fun lt!433304 () Unit!32364)

(declare-fun addCommutativeForDiffKeys!553 (ListLongMap!13267 (_ BitVec 64) V!35057 (_ BitVec 64) V!35057) Unit!32364)

(assert (=> b!977714 (= lt!433304 (addCommutativeForDiffKeys!553 lt!433307 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29392 _keys!1544) from!1932) lt!433306))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15220 (ValueCell!10796 V!35057) V!35057)

(declare-fun dynLambda!1702 (Int (_ BitVec 64)) V!35057)

(assert (=> b!977714 (= lt!433306 (get!15220 (select (arr!29391 _values!1278) from!1932) (dynLambda!1702 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35057)

(declare-fun getCurrentListMapNoExtraKeys!3369 (array!61068 array!61066 (_ BitVec 32) (_ BitVec 32) V!35057 V!35057 (_ BitVec 32) Int) ListLongMap!13267)

(assert (=> b!977714 (= lt!433307 (+!2949 (getCurrentListMapNoExtraKeys!3369 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!977715 () Bool)

(declare-fun res!654365 () Bool)

(assert (=> b!977715 (=> (not res!654365) (not e!551242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61068 (_ BitVec 32)) Bool)

(assert (=> b!977715 (= res!654365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977716 () Bool)

(declare-fun tp_is_empty!22555 () Bool)

(assert (=> b!977716 (= e!551241 tp_is_empty!22555)))

(declare-fun b!977717 () Bool)

(declare-fun res!654366 () Bool)

(assert (=> b!977717 (=> (not res!654366) (not e!551242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!977717 (= res!654366 (validKeyInArray!0 (select (arr!29392 _keys!1544) from!1932)))))

(declare-fun b!977718 () Bool)

(declare-fun res!654363 () Bool)

(assert (=> b!977718 (=> (not res!654363) (not e!551242))))

(assert (=> b!977718 (= res!654363 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!977711 () Bool)

(declare-fun res!654364 () Bool)

(assert (=> b!977711 (=> (not res!654364) (not e!551242))))

(declare-datatypes ((List!20408 0))(
  ( (Nil!20405) (Cons!20404 (h!21566 (_ BitVec 64)) (t!28916 List!20408)) )
))
(declare-fun arrayNoDuplicates!0 (array!61068 (_ BitVec 32) List!20408) Bool)

(assert (=> b!977711 (= res!654364 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20405))))

(declare-fun res!654361 () Bool)

(assert (=> start!83734 (=> (not res!654361) (not e!551242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83734 (= res!654361 (validMask!0 mask!1948))))

(assert (=> start!83734 e!551242))

(assert (=> start!83734 true))

(assert (=> start!83734 tp_is_empty!22555))

(declare-fun array_inv!22761 (array!61066) Bool)

(assert (=> start!83734 (and (array_inv!22761 _values!1278) e!551240)))

(assert (=> start!83734 tp!68126))

(declare-fun array_inv!22762 (array!61068) Bool)

(assert (=> start!83734 (array_inv!22762 _keys!1544)))

(declare-fun mapIsEmpty!35861 () Bool)

(assert (=> mapIsEmpty!35861 mapRes!35861))

(declare-fun b!977719 () Bool)

(assert (=> b!977719 (= e!551239 tp_is_empty!22555)))

(assert (= (and start!83734 res!654361) b!977710))

(assert (= (and b!977710 res!654362) b!977715))

(assert (= (and b!977715 res!654365) b!977711))

(assert (= (and b!977711 res!654364) b!977713))

(assert (= (and b!977713 res!654360) b!977717))

(assert (= (and b!977717 res!654366) b!977718))

(assert (= (and b!977718 res!654363) b!977714))

(assert (= (and b!977712 condMapEmpty!35861) mapIsEmpty!35861))

(assert (= (and b!977712 (not condMapEmpty!35861)) mapNonEmpty!35861))

(get-info :version)

(assert (= (and mapNonEmpty!35861 ((_ is ValueCellFull!10796) mapValue!35861)) b!977719))

(assert (= (and b!977712 ((_ is ValueCellFull!10796) mapDefault!35861)) b!977716))

(assert (= start!83734 b!977712))

(declare-fun b_lambda!14587 () Bool)

(assert (=> (not b_lambda!14587) (not b!977714)))

(declare-fun t!28914 () Bool)

(declare-fun tb!6359 () Bool)

(assert (=> (and start!83734 (= defaultEntry!1281 defaultEntry!1281) t!28914) tb!6359))

(declare-fun result!12715 () Bool)

(assert (=> tb!6359 (= result!12715 tp_is_empty!22555)))

(assert (=> b!977714 t!28914))

(declare-fun b_and!31187 () Bool)

(assert (= b_and!31185 (and (=> t!28914 result!12715) b_and!31187)))

(declare-fun m!904277 () Bool)

(assert (=> start!83734 m!904277))

(declare-fun m!904279 () Bool)

(assert (=> start!83734 m!904279))

(declare-fun m!904281 () Bool)

(assert (=> start!83734 m!904281))

(declare-fun m!904283 () Bool)

(assert (=> mapNonEmpty!35861 m!904283))

(declare-fun m!904285 () Bool)

(assert (=> b!977717 m!904285))

(assert (=> b!977717 m!904285))

(declare-fun m!904287 () Bool)

(assert (=> b!977717 m!904287))

(declare-fun m!904289 () Bool)

(assert (=> b!977711 m!904289))

(declare-fun m!904291 () Bool)

(assert (=> b!977715 m!904291))

(assert (=> b!977714 m!904285))

(declare-fun m!904293 () Bool)

(assert (=> b!977714 m!904293))

(declare-fun m!904295 () Bool)

(assert (=> b!977714 m!904295))

(declare-fun m!904297 () Bool)

(assert (=> b!977714 m!904297))

(declare-fun m!904299 () Bool)

(assert (=> b!977714 m!904299))

(declare-fun m!904301 () Bool)

(assert (=> b!977714 m!904301))

(assert (=> b!977714 m!904295))

(assert (=> b!977714 m!904285))

(declare-fun m!904303 () Bool)

(assert (=> b!977714 m!904303))

(declare-fun m!904305 () Bool)

(assert (=> b!977714 m!904305))

(declare-fun m!904307 () Bool)

(assert (=> b!977714 m!904307))

(assert (=> b!977714 m!904305))

(assert (=> b!977714 m!904299))

(declare-fun m!904309 () Bool)

(assert (=> b!977714 m!904309))

(assert (=> b!977714 m!904293))

(assert (=> b!977714 m!904309))

(declare-fun m!904311 () Bool)

(assert (=> b!977714 m!904311))

(check-sat (not start!83734) b_and!31187 (not b!977711) tp_is_empty!22555 (not mapNonEmpty!35861) (not b!977717) (not b!977715) (not b_next!19561) (not b!977714) (not b_lambda!14587))
(check-sat b_and!31187 (not b_next!19561))
