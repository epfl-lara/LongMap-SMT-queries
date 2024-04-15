; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83298 () Bool)

(assert start!83298)

(declare-fun b_free!19309 () Bool)

(declare-fun b_next!19309 () Bool)

(assert (=> start!83298 (= b_free!19309 (not b_next!19309))))

(declare-fun tp!67206 () Bool)

(declare-fun b_and!30813 () Bool)

(assert (=> start!83298 (= tp!67206 b_and!30813)))

(declare-fun b!972307 () Bool)

(declare-fun e!548037 () Bool)

(declare-fun tp_is_empty!22207 () Bool)

(assert (=> b!972307 (= e!548037 tp_is_empty!22207)))

(declare-fun b!972308 () Bool)

(declare-fun e!548034 () Bool)

(assert (=> b!972308 (= e!548034 tp_is_empty!22207)))

(declare-fun b!972309 () Bool)

(declare-fun res!650877 () Bool)

(declare-fun e!548036 () Bool)

(assert (=> b!972309 (=> (not res!650877) (not e!548036))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34593 0))(
  ( (V!34594 (val!11154 Int)) )
))
(declare-datatypes ((ValueCell!10622 0))(
  ( (ValueCellFull!10622 (v!13712 V!34593)) (EmptyCell!10622) )
))
(declare-datatypes ((array!60390 0))(
  ( (array!60391 (arr!29059 (Array (_ BitVec 32) ValueCell!10622)) (size!29540 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60390)

(declare-datatypes ((array!60392 0))(
  ( (array!60393 (arr!29060 (Array (_ BitVec 32) (_ BitVec 64))) (size!29541 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60392)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!972309 (= res!650877 (and (= (size!29540 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29541 _keys!1717) (size!29540 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35320 () Bool)

(declare-fun mapRes!35320 () Bool)

(assert (=> mapIsEmpty!35320 mapRes!35320))

(declare-fun b!972310 () Bool)

(declare-fun e!548035 () Bool)

(assert (=> b!972310 (= e!548035 (and e!548034 mapRes!35320))))

(declare-fun condMapEmpty!35320 () Bool)

(declare-fun mapDefault!35320 () ValueCell!10622)

(assert (=> b!972310 (= condMapEmpty!35320 (= (arr!29059 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10622)) mapDefault!35320)))))

(declare-fun b!972311 () Bool)

(declare-fun res!650878 () Bool)

(assert (=> b!972311 (=> (not res!650878) (not e!548036))))

(declare-datatypes ((List!20197 0))(
  ( (Nil!20194) (Cons!20193 (h!21355 (_ BitVec 64)) (t!28595 List!20197)) )
))
(declare-fun arrayNoDuplicates!0 (array!60392 (_ BitVec 32) List!20197) Bool)

(assert (=> b!972311 (= res!650878 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20194))))

(declare-fun b!972312 () Bool)

(declare-fun res!650872 () Bool)

(assert (=> b!972312 (=> (not res!650872) (not e!548036))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972312 (= res!650872 (validKeyInArray!0 (select (arr!29060 _keys!1717) i!822)))))

(declare-fun res!650873 () Bool)

(assert (=> start!83298 (=> (not res!650873) (not e!548036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83298 (= res!650873 (validMask!0 mask!2147))))

(assert (=> start!83298 e!548036))

(assert (=> start!83298 true))

(declare-fun array_inv!22541 (array!60390) Bool)

(assert (=> start!83298 (and (array_inv!22541 _values!1425) e!548035)))

(assert (=> start!83298 tp_is_empty!22207))

(assert (=> start!83298 tp!67206))

(declare-fun array_inv!22542 (array!60392) Bool)

(assert (=> start!83298 (array_inv!22542 _keys!1717)))

(declare-fun mapNonEmpty!35320 () Bool)

(declare-fun tp!67207 () Bool)

(assert (=> mapNonEmpty!35320 (= mapRes!35320 (and tp!67207 e!548037))))

(declare-fun mapValue!35320 () ValueCell!10622)

(declare-fun mapKey!35320 () (_ BitVec 32))

(declare-fun mapRest!35320 () (Array (_ BitVec 32) ValueCell!10622))

(assert (=> mapNonEmpty!35320 (= (arr!29059 _values!1425) (store mapRest!35320 mapKey!35320 mapValue!35320))))

(declare-fun b!972313 () Bool)

(declare-fun res!650876 () Bool)

(assert (=> b!972313 (=> (not res!650876) (not e!548036))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!972313 (= res!650876 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29541 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29541 _keys!1717))))))

(declare-fun b!972314 () Bool)

(declare-fun e!548032 () Bool)

(assert (=> b!972314 (= e!548032 (not true))))

(declare-fun lt!431828 () (_ BitVec 64))

(declare-fun zeroValue!1367 () V!34593)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34593)

(declare-datatypes ((tuple2!14386 0))(
  ( (tuple2!14387 (_1!7204 (_ BitVec 64)) (_2!7204 V!34593)) )
))
(declare-datatypes ((List!20198 0))(
  ( (Nil!20195) (Cons!20194 (h!21356 tuple2!14386) (t!28596 List!20198)) )
))
(declare-datatypes ((ListLongMap!13073 0))(
  ( (ListLongMap!13074 (toList!6552 List!20198)) )
))
(declare-fun lt!431827 () ListLongMap!13073)

(declare-fun +!2906 (ListLongMap!13073 tuple2!14386) ListLongMap!13073)

(declare-fun getCurrentListMap!3714 (array!60392 array!60390 (_ BitVec 32) (_ BitVec 32) V!34593 V!34593 (_ BitVec 32) Int) ListLongMap!13073)

(declare-fun get!15061 (ValueCell!10622 V!34593) V!34593)

(declare-fun dynLambda!1662 (Int (_ BitVec 64)) V!34593)

(assert (=> b!972314 (= lt!431827 (+!2906 (getCurrentListMap!3714 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14387 lt!431828 (get!15061 (select (arr!29059 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1662 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32264 0))(
  ( (Unit!32265) )
))
(declare-fun lt!431829 () Unit!32264)

(declare-fun lemmaListMapRecursiveValidKeyArray!246 (array!60392 array!60390 (_ BitVec 32) (_ BitVec 32) V!34593 V!34593 (_ BitVec 32) Int) Unit!32264)

(assert (=> b!972314 (= lt!431829 (lemmaListMapRecursiveValidKeyArray!246 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972315 () Bool)

(declare-fun res!650874 () Bool)

(assert (=> b!972315 (=> (not res!650874) (not e!548036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60392 (_ BitVec 32)) Bool)

(assert (=> b!972315 (= res!650874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972316 () Bool)

(declare-fun res!650871 () Bool)

(assert (=> b!972316 (=> (not res!650871) (not e!548036))))

(declare-fun contains!5593 (ListLongMap!13073 (_ BitVec 64)) Bool)

(assert (=> b!972316 (= res!650871 (contains!5593 (getCurrentListMap!3714 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29060 _keys!1717) i!822)))))

(declare-fun b!972317 () Bool)

(assert (=> b!972317 (= e!548036 e!548032)))

(declare-fun res!650875 () Bool)

(assert (=> b!972317 (=> (not res!650875) (not e!548032))))

(assert (=> b!972317 (= res!650875 (validKeyInArray!0 lt!431828))))

(assert (=> b!972317 (= lt!431828 (select (arr!29060 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!972317 (= lt!431827 (getCurrentListMap!3714 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(assert (= (and start!83298 res!650873) b!972309))

(assert (= (and b!972309 res!650877) b!972315))

(assert (= (and b!972315 res!650874) b!972311))

(assert (= (and b!972311 res!650878) b!972313))

(assert (= (and b!972313 res!650876) b!972312))

(assert (= (and b!972312 res!650872) b!972316))

(assert (= (and b!972316 res!650871) b!972317))

(assert (= (and b!972317 res!650875) b!972314))

(assert (= (and b!972310 condMapEmpty!35320) mapIsEmpty!35320))

(assert (= (and b!972310 (not condMapEmpty!35320)) mapNonEmpty!35320))

(get-info :version)

(assert (= (and mapNonEmpty!35320 ((_ is ValueCellFull!10622) mapValue!35320)) b!972307))

(assert (= (and b!972310 ((_ is ValueCellFull!10622) mapDefault!35320)) b!972308))

(assert (= start!83298 b!972310))

(declare-fun b_lambda!14455 () Bool)

(assert (=> (not b_lambda!14455) (not b!972314)))

(declare-fun t!28594 () Bool)

(declare-fun tb!6249 () Bool)

(assert (=> (and start!83298 (= defaultEntry!1428 defaultEntry!1428) t!28594) tb!6249))

(declare-fun result!12483 () Bool)

(assert (=> tb!6249 (= result!12483 tp_is_empty!22207)))

(assert (=> b!972314 t!28594))

(declare-fun b_and!30815 () Bool)

(assert (= b_and!30813 (and (=> t!28594 result!12483) b_and!30815)))

(declare-fun m!899207 () Bool)

(assert (=> b!972312 m!899207))

(assert (=> b!972312 m!899207))

(declare-fun m!899209 () Bool)

(assert (=> b!972312 m!899209))

(declare-fun m!899211 () Bool)

(assert (=> b!972311 m!899211))

(declare-fun m!899213 () Bool)

(assert (=> start!83298 m!899213))

(declare-fun m!899215 () Bool)

(assert (=> start!83298 m!899215))

(declare-fun m!899217 () Bool)

(assert (=> start!83298 m!899217))

(declare-fun m!899219 () Bool)

(assert (=> b!972316 m!899219))

(assert (=> b!972316 m!899207))

(assert (=> b!972316 m!899219))

(assert (=> b!972316 m!899207))

(declare-fun m!899221 () Bool)

(assert (=> b!972316 m!899221))

(declare-fun m!899223 () Bool)

(assert (=> mapNonEmpty!35320 m!899223))

(declare-fun m!899225 () Bool)

(assert (=> b!972315 m!899225))

(declare-fun m!899227 () Bool)

(assert (=> b!972317 m!899227))

(declare-fun m!899229 () Bool)

(assert (=> b!972317 m!899229))

(declare-fun m!899231 () Bool)

(assert (=> b!972317 m!899231))

(declare-fun m!899233 () Bool)

(assert (=> b!972314 m!899233))

(declare-fun m!899235 () Bool)

(assert (=> b!972314 m!899235))

(declare-fun m!899237 () Bool)

(assert (=> b!972314 m!899237))

(assert (=> b!972314 m!899233))

(assert (=> b!972314 m!899237))

(declare-fun m!899239 () Bool)

(assert (=> b!972314 m!899239))

(assert (=> b!972314 m!899235))

(declare-fun m!899241 () Bool)

(assert (=> b!972314 m!899241))

(declare-fun m!899243 () Bool)

(assert (=> b!972314 m!899243))

(check-sat (not b!972316) (not start!83298) (not b_lambda!14455) (not b!972314) (not b_next!19309) (not b!972311) tp_is_empty!22207 (not b!972317) (not b!972312) b_and!30815 (not b!972315) (not mapNonEmpty!35320))
(check-sat b_and!30815 (not b_next!19309))
