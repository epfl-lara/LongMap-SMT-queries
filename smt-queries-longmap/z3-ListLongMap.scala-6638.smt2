; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83968 () Bool)

(assert start!83968)

(declare-fun b_free!19609 () Bool)

(declare-fun b_next!19609 () Bool)

(assert (=> start!83968 (= b_free!19609 (not b_next!19609))))

(declare-fun tp!68270 () Bool)

(declare-fun b_and!31317 () Bool)

(assert (=> start!83968 (= tp!68270 b_and!31317)))

(declare-fun b!979620 () Bool)

(declare-fun res!655318 () Bool)

(declare-fun e!552330 () Bool)

(assert (=> b!979620 (=> (not res!655318) (not e!552330))))

(declare-datatypes ((array!61256 0))(
  ( (array!61257 (arr!29481 (Array (_ BitVec 32) (_ BitVec 64))) (size!29961 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61256)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61256 (_ BitVec 32)) Bool)

(assert (=> b!979620 (= res!655318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!35933 () Bool)

(declare-fun mapRes!35933 () Bool)

(assert (=> mapIsEmpty!35933 mapRes!35933))

(declare-fun mapNonEmpty!35933 () Bool)

(declare-fun tp!68269 () Bool)

(declare-fun e!552329 () Bool)

(assert (=> mapNonEmpty!35933 (= mapRes!35933 (and tp!68269 e!552329))))

(declare-datatypes ((V!35121 0))(
  ( (V!35122 (val!11352 Int)) )
))
(declare-datatypes ((ValueCell!10820 0))(
  ( (ValueCellFull!10820 (v!13911 V!35121)) (EmptyCell!10820) )
))
(declare-datatypes ((array!61258 0))(
  ( (array!61259 (arr!29482 (Array (_ BitVec 32) ValueCell!10820)) (size!29962 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61258)

(declare-fun mapRest!35933 () (Array (_ BitVec 32) ValueCell!10820))

(declare-fun mapValue!35933 () ValueCell!10820)

(declare-fun mapKey!35933 () (_ BitVec 32))

(assert (=> mapNonEmpty!35933 (= (arr!29482 _values!1278) (store mapRest!35933 mapKey!35933 mapValue!35933))))

(declare-fun b!979621 () Bool)

(declare-fun res!655320 () Bool)

(assert (=> b!979621 (=> (not res!655320) (not e!552330))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!979621 (= res!655320 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!979622 () Bool)

(declare-fun e!552331 () Bool)

(declare-fun tp_is_empty!22603 () Bool)

(assert (=> b!979622 (= e!552331 tp_is_empty!22603)))

(declare-fun b!979624 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!979624 (= e!552330 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!14564 0))(
  ( (tuple2!14565 (_1!7293 (_ BitVec 64)) (_2!7293 V!35121)) )
))
(declare-datatypes ((List!20426 0))(
  ( (Nil!20423) (Cons!20422 (h!21590 tuple2!14564) (t!28983 List!20426)) )
))
(declare-datatypes ((ListLongMap!13263 0))(
  ( (ListLongMap!13264 (toList!6647 List!20426)) )
))
(declare-fun lt!434264 () ListLongMap!13263)

(declare-fun lt!434265 () tuple2!14564)

(declare-fun lt!434263 () tuple2!14564)

(declare-fun +!2962 (ListLongMap!13263 tuple2!14564) ListLongMap!13263)

(assert (=> b!979624 (= (+!2962 (+!2962 lt!434264 lt!434265) lt!434263) (+!2962 (+!2962 lt!434264 lt!434263) lt!434265))))

(declare-fun lt!434261 () V!35121)

(assert (=> b!979624 (= lt!434263 (tuple2!14565 (select (arr!29481 _keys!1544) from!1932) lt!434261))))

(declare-fun minValue!1220 () V!35121)

(assert (=> b!979624 (= lt!434265 (tuple2!14565 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32504 0))(
  ( (Unit!32505) )
))
(declare-fun lt!434262 () Unit!32504)

(declare-fun addCommutativeForDiffKeys!569 (ListLongMap!13263 (_ BitVec 64) V!35121 (_ BitVec 64) V!35121) Unit!32504)

(assert (=> b!979624 (= lt!434262 (addCommutativeForDiffKeys!569 lt!434264 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29481 _keys!1544) from!1932) lt!434261))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15290 (ValueCell!10820 V!35121) V!35121)

(declare-fun dynLambda!1757 (Int (_ BitVec 64)) V!35121)

(assert (=> b!979624 (= lt!434261 (get!15290 (select (arr!29482 _values!1278) from!1932) (dynLambda!1757 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35121)

(declare-fun getCurrentListMapNoExtraKeys!3395 (array!61256 array!61258 (_ BitVec 32) (_ BitVec 32) V!35121 V!35121 (_ BitVec 32) Int) ListLongMap!13263)

(assert (=> b!979624 (= lt!434264 (+!2962 (getCurrentListMapNoExtraKeys!3395 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14565 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!979625 () Bool)

(declare-fun res!655324 () Bool)

(assert (=> b!979625 (=> (not res!655324) (not e!552330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979625 (= res!655324 (validKeyInArray!0 (select (arr!29481 _keys!1544) from!1932)))))

(declare-fun b!979626 () Bool)

(declare-fun res!655322 () Bool)

(assert (=> b!979626 (=> (not res!655322) (not e!552330))))

(assert (=> b!979626 (= res!655322 (and (= (size!29962 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29961 _keys!1544) (size!29962 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979627 () Bool)

(declare-fun res!655319 () Bool)

(assert (=> b!979627 (=> (not res!655319) (not e!552330))))

(declare-datatypes ((List!20427 0))(
  ( (Nil!20424) (Cons!20423 (h!21591 (_ BitVec 64)) (t!28984 List!20427)) )
))
(declare-fun arrayNoDuplicates!0 (array!61256 (_ BitVec 32) List!20427) Bool)

(assert (=> b!979627 (= res!655319 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20424))))

(declare-fun res!655321 () Bool)

(assert (=> start!83968 (=> (not res!655321) (not e!552330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83968 (= res!655321 (validMask!0 mask!1948))))

(assert (=> start!83968 e!552330))

(assert (=> start!83968 true))

(assert (=> start!83968 tp_is_empty!22603))

(declare-fun e!552333 () Bool)

(declare-fun array_inv!22833 (array!61258) Bool)

(assert (=> start!83968 (and (array_inv!22833 _values!1278) e!552333)))

(assert (=> start!83968 tp!68270))

(declare-fun array_inv!22834 (array!61256) Bool)

(assert (=> start!83968 (array_inv!22834 _keys!1544)))

(declare-fun b!979623 () Bool)

(assert (=> b!979623 (= e!552333 (and e!552331 mapRes!35933))))

(declare-fun condMapEmpty!35933 () Bool)

(declare-fun mapDefault!35933 () ValueCell!10820)

(assert (=> b!979623 (= condMapEmpty!35933 (= (arr!29482 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10820)) mapDefault!35933)))))

(declare-fun b!979628 () Bool)

(declare-fun res!655323 () Bool)

(assert (=> b!979628 (=> (not res!655323) (not e!552330))))

(assert (=> b!979628 (= res!655323 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29961 _keys!1544))))))

(declare-fun b!979629 () Bool)

(assert (=> b!979629 (= e!552329 tp_is_empty!22603)))

(assert (= (and start!83968 res!655321) b!979626))

(assert (= (and b!979626 res!655322) b!979620))

(assert (= (and b!979620 res!655318) b!979627))

(assert (= (and b!979627 res!655319) b!979628))

(assert (= (and b!979628 res!655323) b!979625))

(assert (= (and b!979625 res!655324) b!979621))

(assert (= (and b!979621 res!655320) b!979624))

(assert (= (and b!979623 condMapEmpty!35933) mapIsEmpty!35933))

(assert (= (and b!979623 (not condMapEmpty!35933)) mapNonEmpty!35933))

(get-info :version)

(assert (= (and mapNonEmpty!35933 ((_ is ValueCellFull!10820) mapValue!35933)) b!979629))

(assert (= (and b!979623 ((_ is ValueCellFull!10820) mapDefault!35933)) b!979622))

(assert (= start!83968 b!979623))

(declare-fun b_lambda!14667 () Bool)

(assert (=> (not b_lambda!14667) (not b!979624)))

(declare-fun t!28982 () Bool)

(declare-fun tb!6407 () Bool)

(assert (=> (and start!83968 (= defaultEntry!1281 defaultEntry!1281) t!28982) tb!6407))

(declare-fun result!12811 () Bool)

(assert (=> tb!6407 (= result!12811 tp_is_empty!22603)))

(assert (=> b!979624 t!28982))

(declare-fun b_and!31319 () Bool)

(assert (= b_and!31317 (and (=> t!28982 result!12811) b_and!31319)))

(declare-fun m!907193 () Bool)

(assert (=> b!979627 m!907193))

(declare-fun m!907195 () Bool)

(assert (=> b!979624 m!907195))

(declare-fun m!907197 () Bool)

(assert (=> b!979624 m!907197))

(assert (=> b!979624 m!907195))

(declare-fun m!907199 () Bool)

(assert (=> b!979624 m!907199))

(declare-fun m!907201 () Bool)

(assert (=> b!979624 m!907201))

(declare-fun m!907203 () Bool)

(assert (=> b!979624 m!907203))

(assert (=> b!979624 m!907201))

(declare-fun m!907205 () Bool)

(assert (=> b!979624 m!907205))

(declare-fun m!907207 () Bool)

(assert (=> b!979624 m!907207))

(declare-fun m!907209 () Bool)

(assert (=> b!979624 m!907209))

(declare-fun m!907211 () Bool)

(assert (=> b!979624 m!907211))

(assert (=> b!979624 m!907209))

(assert (=> b!979624 m!907205))

(declare-fun m!907213 () Bool)

(assert (=> b!979624 m!907213))

(assert (=> b!979624 m!907197))

(assert (=> b!979624 m!907213))

(declare-fun m!907215 () Bool)

(assert (=> b!979624 m!907215))

(declare-fun m!907217 () Bool)

(assert (=> mapNonEmpty!35933 m!907217))

(declare-fun m!907219 () Bool)

(assert (=> b!979620 m!907219))

(assert (=> b!979625 m!907195))

(assert (=> b!979625 m!907195))

(declare-fun m!907221 () Bool)

(assert (=> b!979625 m!907221))

(declare-fun m!907223 () Bool)

(assert (=> start!83968 m!907223))

(declare-fun m!907225 () Bool)

(assert (=> start!83968 m!907225))

(declare-fun m!907227 () Bool)

(assert (=> start!83968 m!907227))

(check-sat (not b!979624) (not b!979627) (not b_next!19609) (not start!83968) b_and!31319 tp_is_empty!22603 (not b!979620) (not b_lambda!14667) (not b!979625) (not mapNonEmpty!35933))
(check-sat b_and!31319 (not b_next!19609))
