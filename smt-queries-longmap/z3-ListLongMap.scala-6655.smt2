; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83884 () Bool)

(assert start!83884)

(declare-fun b_free!19711 () Bool)

(declare-fun b_next!19711 () Bool)

(assert (=> start!83884 (= b_free!19711 (not b_next!19711))))

(declare-fun tp!68576 () Bool)

(declare-fun b_and!31485 () Bool)

(assert (=> start!83884 (= tp!68576 b_and!31485)))

(declare-fun b!980247 () Bool)

(declare-fun e!552502 () Bool)

(declare-fun tp_is_empty!22705 () Bool)

(assert (=> b!980247 (= e!552502 tp_is_empty!22705)))

(declare-fun b!980248 () Bool)

(declare-fun e!552504 () Bool)

(declare-fun e!552505 () Bool)

(assert (=> b!980248 (= e!552504 (not e!552505))))

(declare-fun res!656074 () Bool)

(assert (=> b!980248 (=> res!656074 e!552505)))

(declare-datatypes ((array!61346 0))(
  ( (array!61347 (arr!29531 (Array (_ BitVec 32) (_ BitVec 64))) (size!30012 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61346)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!980248 (= res!656074 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29531 _keys!1544) from!1932)))))

(declare-datatypes ((V!35257 0))(
  ( (V!35258 (val!11403 Int)) )
))
(declare-datatypes ((tuple2!14698 0))(
  ( (tuple2!14699 (_1!7360 (_ BitVec 64)) (_2!7360 V!35257)) )
))
(declare-fun lt!435122 () tuple2!14698)

(declare-datatypes ((List!20521 0))(
  ( (Nil!20518) (Cons!20517 (h!21679 tuple2!14698) (t!29179 List!20521)) )
))
(declare-datatypes ((ListLongMap!13385 0))(
  ( (ListLongMap!13386 (toList!6708 List!20521)) )
))
(declare-fun lt!435123 () ListLongMap!13385)

(declare-fun lt!435120 () ListLongMap!13385)

(declare-fun lt!435115 () tuple2!14698)

(declare-fun +!3008 (ListLongMap!13385 tuple2!14698) ListLongMap!13385)

(assert (=> b!980248 (= (+!3008 lt!435123 lt!435115) (+!3008 lt!435120 lt!435122))))

(declare-fun lt!435116 () ListLongMap!13385)

(assert (=> b!980248 (= lt!435120 (+!3008 lt!435116 lt!435115))))

(declare-fun lt!435118 () V!35257)

(assert (=> b!980248 (= lt!435115 (tuple2!14699 (select (arr!29531 _keys!1544) from!1932) lt!435118))))

(assert (=> b!980248 (= lt!435123 (+!3008 lt!435116 lt!435122))))

(declare-fun minValue!1220 () V!35257)

(assert (=> b!980248 (= lt!435122 (tuple2!14699 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32482 0))(
  ( (Unit!32483) )
))
(declare-fun lt!435117 () Unit!32482)

(declare-fun addCommutativeForDiffKeys!612 (ListLongMap!13385 (_ BitVec 64) V!35257 (_ BitVec 64) V!35257) Unit!32482)

(assert (=> b!980248 (= lt!435117 (addCommutativeForDiffKeys!612 lt!435116 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29531 _keys!1544) from!1932) lt!435118))))

(declare-datatypes ((ValueCell!10871 0))(
  ( (ValueCellFull!10871 (v!13964 V!35257)) (EmptyCell!10871) )
))
(declare-datatypes ((array!61348 0))(
  ( (array!61349 (arr!29532 (Array (_ BitVec 32) ValueCell!10871)) (size!30013 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61348)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15322 (ValueCell!10871 V!35257) V!35257)

(declare-fun dynLambda!1754 (Int (_ BitVec 64)) V!35257)

(assert (=> b!980248 (= lt!435118 (get!15322 (select (arr!29532 _values!1278) from!1932) (dynLambda!1754 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!435121 () ListLongMap!13385)

(declare-fun lt!435119 () tuple2!14698)

(assert (=> b!980248 (= lt!435116 (+!3008 lt!435121 lt!435119))))

(declare-fun zeroValue!1220 () V!35257)

(assert (=> b!980248 (= lt!435119 (tuple2!14699 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3421 (array!61346 array!61348 (_ BitVec 32) (_ BitVec 32) V!35257 V!35257 (_ BitVec 32) Int) ListLongMap!13385)

(assert (=> b!980248 (= lt!435121 (getCurrentListMapNoExtraKeys!3421 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!980249 () Bool)

(declare-fun res!656073 () Bool)

(assert (=> b!980249 (=> (not res!656073) (not e!552504))))

(declare-datatypes ((List!20522 0))(
  ( (Nil!20519) (Cons!20518 (h!21680 (_ BitVec 64)) (t!29180 List!20522)) )
))
(declare-fun arrayNoDuplicates!0 (array!61346 (_ BitVec 32) List!20522) Bool)

(assert (=> b!980249 (= res!656073 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20519))))

(declare-fun b!980250 () Bool)

(declare-fun res!656079 () Bool)

(assert (=> b!980250 (=> (not res!656079) (not e!552504))))

(assert (=> b!980250 (= res!656079 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!980251 () Bool)

(declare-fun res!656075 () Bool)

(assert (=> b!980251 (=> (not res!656075) (not e!552504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61346 (_ BitVec 32)) Bool)

(assert (=> b!980251 (= res!656075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980252 () Bool)

(declare-fun e!552506 () Bool)

(assert (=> b!980252 (= e!552506 tp_is_empty!22705)))

(declare-fun mapIsEmpty!36086 () Bool)

(declare-fun mapRes!36086 () Bool)

(assert (=> mapIsEmpty!36086 mapRes!36086))

(declare-fun b!980253 () Bool)

(declare-fun res!656076 () Bool)

(assert (=> b!980253 (=> (not res!656076) (not e!552504))))

(assert (=> b!980253 (= res!656076 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30012 _keys!1544))))))

(declare-fun res!656072 () Bool)

(assert (=> start!83884 (=> (not res!656072) (not e!552504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83884 (= res!656072 (validMask!0 mask!1948))))

(assert (=> start!83884 e!552504))

(assert (=> start!83884 true))

(assert (=> start!83884 tp_is_empty!22705))

(declare-fun e!552501 () Bool)

(declare-fun array_inv!22855 (array!61348) Bool)

(assert (=> start!83884 (and (array_inv!22855 _values!1278) e!552501)))

(assert (=> start!83884 tp!68576))

(declare-fun array_inv!22856 (array!61346) Bool)

(assert (=> start!83884 (array_inv!22856 _keys!1544)))

(declare-fun mapNonEmpty!36086 () Bool)

(declare-fun tp!68575 () Bool)

(assert (=> mapNonEmpty!36086 (= mapRes!36086 (and tp!68575 e!552502))))

(declare-fun mapRest!36086 () (Array (_ BitVec 32) ValueCell!10871))

(declare-fun mapKey!36086 () (_ BitVec 32))

(declare-fun mapValue!36086 () ValueCell!10871)

(assert (=> mapNonEmpty!36086 (= (arr!29532 _values!1278) (store mapRest!36086 mapKey!36086 mapValue!36086))))

(declare-fun b!980254 () Bool)

(assert (=> b!980254 (= e!552501 (and e!552506 mapRes!36086))))

(declare-fun condMapEmpty!36086 () Bool)

(declare-fun mapDefault!36086 () ValueCell!10871)

(assert (=> b!980254 (= condMapEmpty!36086 (= (arr!29532 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10871)) mapDefault!36086)))))

(declare-fun b!980255 () Bool)

(declare-fun res!656077 () Bool)

(assert (=> b!980255 (=> (not res!656077) (not e!552504))))

(assert (=> b!980255 (= res!656077 (and (= (size!30013 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30012 _keys!1544) (size!30013 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980256 () Bool)

(declare-fun res!656078 () Bool)

(assert (=> b!980256 (=> (not res!656078) (not e!552504))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980256 (= res!656078 (validKeyInArray!0 (select (arr!29531 _keys!1544) from!1932)))))

(declare-fun b!980257 () Bool)

(assert (=> b!980257 (= e!552505 true)))

(assert (=> b!980257 (= lt!435120 (+!3008 (+!3008 lt!435121 lt!435115) lt!435119))))

(declare-fun lt!435114 () Unit!32482)

(assert (=> b!980257 (= lt!435114 (addCommutativeForDiffKeys!612 lt!435121 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29531 _keys!1544) from!1932) lt!435118))))

(assert (= (and start!83884 res!656072) b!980255))

(assert (= (and b!980255 res!656077) b!980251))

(assert (= (and b!980251 res!656075) b!980249))

(assert (= (and b!980249 res!656073) b!980253))

(assert (= (and b!980253 res!656076) b!980256))

(assert (= (and b!980256 res!656078) b!980250))

(assert (= (and b!980250 res!656079) b!980248))

(assert (= (and b!980248 (not res!656074)) b!980257))

(assert (= (and b!980254 condMapEmpty!36086) mapIsEmpty!36086))

(assert (= (and b!980254 (not condMapEmpty!36086)) mapNonEmpty!36086))

(get-info :version)

(assert (= (and mapNonEmpty!36086 ((_ is ValueCellFull!10871) mapValue!36086)) b!980247))

(assert (= (and b!980254 ((_ is ValueCellFull!10871) mapDefault!36086)) b!980252))

(assert (= start!83884 b!980254))

(declare-fun b_lambda!14737 () Bool)

(assert (=> (not b_lambda!14737) (not b!980248)))

(declare-fun t!29178 () Bool)

(declare-fun tb!6509 () Bool)

(assert (=> (and start!83884 (= defaultEntry!1281 defaultEntry!1281) t!29178) tb!6509))

(declare-fun result!13015 () Bool)

(assert (=> tb!6509 (= result!13015 tp_is_empty!22705)))

(assert (=> b!980248 t!29178))

(declare-fun b_and!31487 () Bool)

(assert (= b_and!31485 (and (=> t!29178 result!13015) b_and!31487)))

(declare-fun m!907247 () Bool)

(assert (=> b!980257 m!907247))

(assert (=> b!980257 m!907247))

(declare-fun m!907249 () Bool)

(assert (=> b!980257 m!907249))

(declare-fun m!907251 () Bool)

(assert (=> b!980257 m!907251))

(assert (=> b!980257 m!907251))

(declare-fun m!907253 () Bool)

(assert (=> b!980257 m!907253))

(declare-fun m!907255 () Bool)

(assert (=> b!980249 m!907255))

(assert (=> b!980248 m!907251))

(declare-fun m!907257 () Bool)

(assert (=> b!980248 m!907257))

(declare-fun m!907259 () Bool)

(assert (=> b!980248 m!907259))

(declare-fun m!907261 () Bool)

(assert (=> b!980248 m!907261))

(assert (=> b!980248 m!907251))

(declare-fun m!907263 () Bool)

(assert (=> b!980248 m!907263))

(declare-fun m!907265 () Bool)

(assert (=> b!980248 m!907265))

(declare-fun m!907267 () Bool)

(assert (=> b!980248 m!907267))

(declare-fun m!907269 () Bool)

(assert (=> b!980248 m!907269))

(declare-fun m!907271 () Bool)

(assert (=> b!980248 m!907271))

(declare-fun m!907273 () Bool)

(assert (=> b!980248 m!907273))

(assert (=> b!980248 m!907257))

(assert (=> b!980248 m!907273))

(declare-fun m!907275 () Bool)

(assert (=> b!980248 m!907275))

(declare-fun m!907277 () Bool)

(assert (=> mapNonEmpty!36086 m!907277))

(assert (=> b!980256 m!907251))

(assert (=> b!980256 m!907251))

(declare-fun m!907279 () Bool)

(assert (=> b!980256 m!907279))

(declare-fun m!907281 () Bool)

(assert (=> start!83884 m!907281))

(declare-fun m!907283 () Bool)

(assert (=> start!83884 m!907283))

(declare-fun m!907285 () Bool)

(assert (=> start!83884 m!907285))

(declare-fun m!907287 () Bool)

(assert (=> b!980251 m!907287))

(check-sat (not start!83884) (not mapNonEmpty!36086) tp_is_empty!22705 (not b!980249) (not b!980257) (not b_lambda!14737) (not b!980256) (not b!980248) (not b_next!19711) (not b!980251) b_and!31487)
(check-sat b_and!31487 (not b_next!19711))
