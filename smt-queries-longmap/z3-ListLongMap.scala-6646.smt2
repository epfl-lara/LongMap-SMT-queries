; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83830 () Bool)

(assert start!83830)

(declare-fun b_free!19657 () Bool)

(declare-fun b_next!19657 () Bool)

(assert (=> start!83830 (= b_free!19657 (not b_next!19657))))

(declare-fun tp!68413 () Bool)

(declare-fun b_and!31377 () Bool)

(assert (=> start!83830 (= tp!68413 b_and!31377)))

(declare-fun b!979302 () Bool)

(declare-fun e!552018 () Bool)

(declare-fun e!552015 () Bool)

(declare-fun mapRes!36005 () Bool)

(assert (=> b!979302 (= e!552018 (and e!552015 mapRes!36005))))

(declare-fun condMapEmpty!36005 () Bool)

(declare-datatypes ((V!35185 0))(
  ( (V!35186 (val!11376 Int)) )
))
(declare-datatypes ((ValueCell!10844 0))(
  ( (ValueCellFull!10844 (v!13937 V!35185)) (EmptyCell!10844) )
))
(declare-datatypes ((array!61242 0))(
  ( (array!61243 (arr!29479 (Array (_ BitVec 32) ValueCell!10844)) (size!29960 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61242)

(declare-fun mapDefault!36005 () ValueCell!10844)

(assert (=> b!979302 (= condMapEmpty!36005 (= (arr!29479 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10844)) mapDefault!36005)))))

(declare-fun res!655427 () Bool)

(declare-fun e!552020 () Bool)

(assert (=> start!83830 (=> (not res!655427) (not e!552020))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83830 (= res!655427 (validMask!0 mask!1948))))

(assert (=> start!83830 e!552020))

(assert (=> start!83830 true))

(declare-fun tp_is_empty!22651 () Bool)

(assert (=> start!83830 tp_is_empty!22651))

(declare-fun array_inv!22825 (array!61242) Bool)

(assert (=> start!83830 (and (array_inv!22825 _values!1278) e!552018)))

(assert (=> start!83830 tp!68413))

(declare-datatypes ((array!61244 0))(
  ( (array!61245 (arr!29480 (Array (_ BitVec 32) (_ BitVec 64))) (size!29961 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61244)

(declare-fun array_inv!22826 (array!61244) Bool)

(assert (=> start!83830 (array_inv!22826 _keys!1544)))

(declare-fun b!979303 () Bool)

(declare-fun e!552017 () Bool)

(assert (=> b!979303 (= e!552017 true)))

(declare-datatypes ((tuple2!14656 0))(
  ( (tuple2!14657 (_1!7339 (_ BitVec 64)) (_2!7339 V!35185)) )
))
(declare-datatypes ((List!20481 0))(
  ( (Nil!20478) (Cons!20477 (h!21639 tuple2!14656) (t!29085 List!20481)) )
))
(declare-datatypes ((ListLongMap!13343 0))(
  ( (ListLongMap!13344 (toList!6687 List!20481)) )
))
(declare-fun lt!434307 () ListLongMap!13343)

(declare-fun lt!434311 () tuple2!14656)

(declare-fun lt!434310 () ListLongMap!13343)

(declare-fun lt!434309 () tuple2!14656)

(declare-fun +!2987 (ListLongMap!13343 tuple2!14656) ListLongMap!13343)

(assert (=> b!979303 (= lt!434307 (+!2987 (+!2987 lt!434310 lt!434311) lt!434309))))

(declare-datatypes ((Unit!32440 0))(
  ( (Unit!32441) )
))
(declare-fun lt!434312 () Unit!32440)

(declare-fun lt!434305 () V!35185)

(declare-fun zeroValue!1220 () V!35185)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!591 (ListLongMap!13343 (_ BitVec 64) V!35185 (_ BitVec 64) V!35185) Unit!32440)

(assert (=> b!979303 (= lt!434312 (addCommutativeForDiffKeys!591 lt!434310 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29480 _keys!1544) from!1932) lt!434305))))

(declare-fun b!979304 () Bool)

(assert (=> b!979304 (= e!552020 (not e!552017))))

(declare-fun res!655428 () Bool)

(assert (=> b!979304 (=> res!655428 e!552017)))

(assert (=> b!979304 (= res!655428 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29480 _keys!1544) from!1932)))))

(declare-fun lt!434313 () tuple2!14656)

(declare-fun lt!434304 () ListLongMap!13343)

(assert (=> b!979304 (= (+!2987 lt!434304 lt!434311) (+!2987 lt!434307 lt!434313))))

(declare-fun lt!434308 () ListLongMap!13343)

(assert (=> b!979304 (= lt!434307 (+!2987 lt!434308 lt!434311))))

(assert (=> b!979304 (= lt!434311 (tuple2!14657 (select (arr!29480 _keys!1544) from!1932) lt!434305))))

(assert (=> b!979304 (= lt!434304 (+!2987 lt!434308 lt!434313))))

(declare-fun minValue!1220 () V!35185)

(assert (=> b!979304 (= lt!434313 (tuple2!14657 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!434306 () Unit!32440)

(assert (=> b!979304 (= lt!434306 (addCommutativeForDiffKeys!591 lt!434308 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29480 _keys!1544) from!1932) lt!434305))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15287 (ValueCell!10844 V!35185) V!35185)

(declare-fun dynLambda!1737 (Int (_ BitVec 64)) V!35185)

(assert (=> b!979304 (= lt!434305 (get!15287 (select (arr!29479 _values!1278) from!1932) (dynLambda!1737 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!979304 (= lt!434308 (+!2987 lt!434310 lt!434309))))

(assert (=> b!979304 (= lt!434309 (tuple2!14657 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3404 (array!61244 array!61242 (_ BitVec 32) (_ BitVec 32) V!35185 V!35185 (_ BitVec 32) Int) ListLongMap!13343)

(assert (=> b!979304 (= lt!434310 (getCurrentListMapNoExtraKeys!3404 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapNonEmpty!36005 () Bool)

(declare-fun tp!68414 () Bool)

(declare-fun e!552016 () Bool)

(assert (=> mapNonEmpty!36005 (= mapRes!36005 (and tp!68414 e!552016))))

(declare-fun mapValue!36005 () ValueCell!10844)

(declare-fun mapRest!36005 () (Array (_ BitVec 32) ValueCell!10844))

(declare-fun mapKey!36005 () (_ BitVec 32))

(assert (=> mapNonEmpty!36005 (= (arr!29479 _values!1278) (store mapRest!36005 mapKey!36005 mapValue!36005))))

(declare-fun b!979305 () Bool)

(assert (=> b!979305 (= e!552016 tp_is_empty!22651)))

(declare-fun mapIsEmpty!36005 () Bool)

(assert (=> mapIsEmpty!36005 mapRes!36005))

(declare-fun b!979306 () Bool)

(declare-fun res!655429 () Bool)

(assert (=> b!979306 (=> (not res!655429) (not e!552020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61244 (_ BitVec 32)) Bool)

(assert (=> b!979306 (= res!655429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979307 () Bool)

(declare-fun res!655430 () Bool)

(assert (=> b!979307 (=> (not res!655430) (not e!552020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979307 (= res!655430 (validKeyInArray!0 (select (arr!29480 _keys!1544) from!1932)))))

(declare-fun b!979308 () Bool)

(declare-fun res!655426 () Bool)

(assert (=> b!979308 (=> (not res!655426) (not e!552020))))

(assert (=> b!979308 (= res!655426 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!979309 () Bool)

(assert (=> b!979309 (= e!552015 tp_is_empty!22651)))

(declare-fun b!979310 () Bool)

(declare-fun res!655431 () Bool)

(assert (=> b!979310 (=> (not res!655431) (not e!552020))))

(assert (=> b!979310 (= res!655431 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29961 _keys!1544))))))

(declare-fun b!979311 () Bool)

(declare-fun res!655424 () Bool)

(assert (=> b!979311 (=> (not res!655424) (not e!552020))))

(assert (=> b!979311 (= res!655424 (and (= (size!29960 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29961 _keys!1544) (size!29960 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979312 () Bool)

(declare-fun res!655425 () Bool)

(assert (=> b!979312 (=> (not res!655425) (not e!552020))))

(declare-datatypes ((List!20482 0))(
  ( (Nil!20479) (Cons!20478 (h!21640 (_ BitVec 64)) (t!29086 List!20482)) )
))
(declare-fun arrayNoDuplicates!0 (array!61244 (_ BitVec 32) List!20482) Bool)

(assert (=> b!979312 (= res!655425 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20479))))

(assert (= (and start!83830 res!655427) b!979311))

(assert (= (and b!979311 res!655424) b!979306))

(assert (= (and b!979306 res!655429) b!979312))

(assert (= (and b!979312 res!655425) b!979310))

(assert (= (and b!979310 res!655431) b!979307))

(assert (= (and b!979307 res!655430) b!979308))

(assert (= (and b!979308 res!655426) b!979304))

(assert (= (and b!979304 (not res!655428)) b!979303))

(assert (= (and b!979302 condMapEmpty!36005) mapIsEmpty!36005))

(assert (= (and b!979302 (not condMapEmpty!36005)) mapNonEmpty!36005))

(get-info :version)

(assert (= (and mapNonEmpty!36005 ((_ is ValueCellFull!10844) mapValue!36005)) b!979305))

(assert (= (and b!979302 ((_ is ValueCellFull!10844) mapDefault!36005)) b!979309))

(assert (= start!83830 b!979302))

(declare-fun b_lambda!14683 () Bool)

(assert (=> (not b_lambda!14683) (not b!979304)))

(declare-fun t!29084 () Bool)

(declare-fun tb!6455 () Bool)

(assert (=> (and start!83830 (= defaultEntry!1281 defaultEntry!1281) t!29084) tb!6455))

(declare-fun result!12907 () Bool)

(assert (=> tb!6455 (= result!12907 tp_is_empty!22651)))

(assert (=> b!979304 t!29084))

(declare-fun b_and!31379 () Bool)

(assert (= b_and!31377 (and (=> t!29084 result!12907) b_and!31379)))

(declare-fun m!906113 () Bool)

(assert (=> b!979306 m!906113))

(declare-fun m!906115 () Bool)

(assert (=> start!83830 m!906115))

(declare-fun m!906117 () Bool)

(assert (=> start!83830 m!906117))

(declare-fun m!906119 () Bool)

(assert (=> start!83830 m!906119))

(declare-fun m!906121 () Bool)

(assert (=> b!979312 m!906121))

(declare-fun m!906123 () Bool)

(assert (=> b!979304 m!906123))

(declare-fun m!906125 () Bool)

(assert (=> b!979304 m!906125))

(declare-fun m!906127 () Bool)

(assert (=> b!979304 m!906127))

(declare-fun m!906129 () Bool)

(assert (=> b!979304 m!906129))

(declare-fun m!906131 () Bool)

(assert (=> b!979304 m!906131))

(declare-fun m!906133 () Bool)

(assert (=> b!979304 m!906133))

(declare-fun m!906135 () Bool)

(assert (=> b!979304 m!906135))

(assert (=> b!979304 m!906127))

(declare-fun m!906137 () Bool)

(assert (=> b!979304 m!906137))

(declare-fun m!906139 () Bool)

(assert (=> b!979304 m!906139))

(declare-fun m!906141 () Bool)

(assert (=> b!979304 m!906141))

(assert (=> b!979304 m!906125))

(assert (=> b!979304 m!906141))

(declare-fun m!906143 () Bool)

(assert (=> b!979304 m!906143))

(declare-fun m!906145 () Bool)

(assert (=> b!979303 m!906145))

(assert (=> b!979303 m!906145))

(declare-fun m!906147 () Bool)

(assert (=> b!979303 m!906147))

(assert (=> b!979303 m!906127))

(assert (=> b!979303 m!906127))

(declare-fun m!906149 () Bool)

(assert (=> b!979303 m!906149))

(declare-fun m!906151 () Bool)

(assert (=> mapNonEmpty!36005 m!906151))

(assert (=> b!979307 m!906127))

(assert (=> b!979307 m!906127))

(declare-fun m!906153 () Bool)

(assert (=> b!979307 m!906153))

(check-sat (not start!83830) b_and!31379 (not b!979304) (not b!979303) (not b!979312) (not b_next!19657) (not b_lambda!14683) (not b!979307) (not mapNonEmpty!36005) tp_is_empty!22651 (not b!979306))
(check-sat b_and!31379 (not b_next!19657))
