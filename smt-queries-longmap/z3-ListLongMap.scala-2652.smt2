; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39716 () Bool)

(assert start!39716)

(declare-fun b_free!9997 () Bool)

(declare-fun b_next!9997 () Bool)

(assert (=> start!39716 (= b_free!9997 (not b_next!9997))))

(declare-fun tp!35520 () Bool)

(declare-fun b_and!17667 () Bool)

(assert (=> start!39716 (= tp!35520 b_and!17667)))

(declare-fun b!427305 () Bool)

(declare-fun e!253380 () Bool)

(declare-fun e!253379 () Bool)

(assert (=> b!427305 (= e!253380 e!253379)))

(declare-fun res!250641 () Bool)

(assert (=> b!427305 (=> (not res!250641) (not e!253379))))

(declare-datatypes ((array!26144 0))(
  ( (array!26145 (arr!12521 (Array (_ BitVec 32) (_ BitVec 64))) (size!12873 (_ BitVec 32))) )
))
(declare-fun lt!195270 () array!26144)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26144 (_ BitVec 32)) Bool)

(assert (=> b!427305 (= res!250641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195270 mask!1025))))

(declare-fun _keys!709 () array!26144)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!427305 (= lt!195270 (array!26145 (store (arr!12521 _keys!709) i!563 k0!794) (size!12873 _keys!709)))))

(declare-fun res!250646 () Bool)

(assert (=> start!39716 (=> (not res!250646) (not e!253380))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39716 (= res!250646 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12873 _keys!709))))))

(assert (=> start!39716 e!253380))

(declare-fun tp_is_empty!11149 () Bool)

(assert (=> start!39716 tp_is_empty!11149))

(assert (=> start!39716 tp!35520))

(assert (=> start!39716 true))

(declare-datatypes ((V!15971 0))(
  ( (V!15972 (val!5619 Int)) )
))
(declare-datatypes ((ValueCell!5231 0))(
  ( (ValueCellFull!5231 (v!7867 V!15971)) (EmptyCell!5231) )
))
(declare-datatypes ((array!26146 0))(
  ( (array!26147 (arr!12522 (Array (_ BitVec 32) ValueCell!5231)) (size!12874 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26146)

(declare-fun e!253378 () Bool)

(declare-fun array_inv!9188 (array!26146) Bool)

(assert (=> start!39716 (and (array_inv!9188 _values!549) e!253378)))

(declare-fun array_inv!9189 (array!26144) Bool)

(assert (=> start!39716 (array_inv!9189 _keys!709)))

(declare-fun mapNonEmpty!18345 () Bool)

(declare-fun mapRes!18345 () Bool)

(declare-fun tp!35519 () Bool)

(declare-fun e!253374 () Bool)

(assert (=> mapNonEmpty!18345 (= mapRes!18345 (and tp!35519 e!253374))))

(declare-fun mapValue!18345 () ValueCell!5231)

(declare-fun mapKey!18345 () (_ BitVec 32))

(declare-fun mapRest!18345 () (Array (_ BitVec 32) ValueCell!5231))

(assert (=> mapNonEmpty!18345 (= (arr!12522 _values!549) (store mapRest!18345 mapKey!18345 mapValue!18345))))

(declare-fun b!427306 () Bool)

(declare-fun e!253375 () Bool)

(declare-fun e!253377 () Bool)

(assert (=> b!427306 (= e!253375 (not e!253377))))

(declare-fun res!250648 () Bool)

(assert (=> b!427306 (=> res!250648 e!253377)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427306 (= res!250648 (not (validKeyInArray!0 (select (arr!12521 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7286 0))(
  ( (tuple2!7287 (_1!3654 (_ BitVec 64)) (_2!3654 V!15971)) )
))
(declare-datatypes ((List!7289 0))(
  ( (Nil!7286) (Cons!7285 (h!8141 tuple2!7286) (t!12727 List!7289)) )
))
(declare-datatypes ((ListLongMap!6201 0))(
  ( (ListLongMap!6202 (toList!3116 List!7289)) )
))
(declare-fun lt!195275 () ListLongMap!6201)

(declare-fun lt!195271 () ListLongMap!6201)

(assert (=> b!427306 (= lt!195275 lt!195271)))

(declare-fun lt!195273 () ListLongMap!6201)

(declare-fun v!412 () V!15971)

(declare-fun +!1329 (ListLongMap!6201 tuple2!7286) ListLongMap!6201)

(assert (=> b!427306 (= lt!195271 (+!1329 lt!195273 (tuple2!7287 k0!794 v!412)))))

(declare-fun minValue!515 () V!15971)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15971)

(declare-fun lt!195269 () array!26146)

(declare-fun getCurrentListMapNoExtraKeys!1362 (array!26144 array!26146 (_ BitVec 32) (_ BitVec 32) V!15971 V!15971 (_ BitVec 32) Int) ListLongMap!6201)

(assert (=> b!427306 (= lt!195275 (getCurrentListMapNoExtraKeys!1362 lt!195270 lt!195269 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!427306 (= lt!195273 (getCurrentListMapNoExtraKeys!1362 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12533 0))(
  ( (Unit!12534) )
))
(declare-fun lt!195274 () Unit!12533)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!513 (array!26144 array!26146 (_ BitVec 32) (_ BitVec 32) V!15971 V!15971 (_ BitVec 32) (_ BitVec 64) V!15971 (_ BitVec 32) Int) Unit!12533)

(assert (=> b!427306 (= lt!195274 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!513 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!427307 () Bool)

(declare-fun e!253376 () Bool)

(assert (=> b!427307 (= e!253378 (and e!253376 mapRes!18345))))

(declare-fun condMapEmpty!18345 () Bool)

(declare-fun mapDefault!18345 () ValueCell!5231)

(assert (=> b!427307 (= condMapEmpty!18345 (= (arr!12522 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5231)) mapDefault!18345)))))

(declare-fun b!427308 () Bool)

(assert (=> b!427308 (= e!253376 tp_is_empty!11149)))

(declare-fun b!427309 () Bool)

(declare-fun res!250645 () Bool)

(assert (=> b!427309 (=> (not res!250645) (not e!253380))))

(assert (=> b!427309 (= res!250645 (validKeyInArray!0 k0!794))))

(declare-fun b!427310 () Bool)

(declare-fun res!250644 () Bool)

(assert (=> b!427310 (=> (not res!250644) (not e!253379))))

(assert (=> b!427310 (= res!250644 (bvsle from!863 i!563))))

(declare-fun b!427311 () Bool)

(assert (=> b!427311 (= e!253377 true)))

(declare-fun lt!195276 () ListLongMap!6201)

(declare-fun get!6200 (ValueCell!5231 V!15971) V!15971)

(declare-fun dynLambda!747 (Int (_ BitVec 64)) V!15971)

(assert (=> b!427311 (= lt!195276 (+!1329 lt!195271 (tuple2!7287 (select (arr!12521 _keys!709) from!863) (get!6200 (select (arr!12522 _values!549) from!863) (dynLambda!747 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!427312 () Bool)

(declare-fun res!250647 () Bool)

(assert (=> b!427312 (=> (not res!250647) (not e!253380))))

(assert (=> b!427312 (= res!250647 (or (= (select (arr!12521 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12521 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!427313 () Bool)

(assert (=> b!427313 (= e!253374 tp_is_empty!11149)))

(declare-fun b!427314 () Bool)

(declare-fun res!250642 () Bool)

(assert (=> b!427314 (=> (not res!250642) (not e!253380))))

(assert (=> b!427314 (= res!250642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!427315 () Bool)

(declare-fun res!250651 () Bool)

(assert (=> b!427315 (=> (not res!250651) (not e!253380))))

(assert (=> b!427315 (= res!250651 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12873 _keys!709))))))

(declare-fun mapIsEmpty!18345 () Bool)

(assert (=> mapIsEmpty!18345 mapRes!18345))

(declare-fun b!427316 () Bool)

(declare-fun res!250643 () Bool)

(assert (=> b!427316 (=> (not res!250643) (not e!253380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427316 (= res!250643 (validMask!0 mask!1025))))

(declare-fun b!427317 () Bool)

(assert (=> b!427317 (= e!253379 e!253375)))

(declare-fun res!250650 () Bool)

(assert (=> b!427317 (=> (not res!250650) (not e!253375))))

(assert (=> b!427317 (= res!250650 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!427317 (= lt!195276 (getCurrentListMapNoExtraKeys!1362 lt!195270 lt!195269 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!427317 (= lt!195269 (array!26147 (store (arr!12522 _values!549) i!563 (ValueCellFull!5231 v!412)) (size!12874 _values!549)))))

(declare-fun lt!195272 () ListLongMap!6201)

(assert (=> b!427317 (= lt!195272 (getCurrentListMapNoExtraKeys!1362 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!427318 () Bool)

(declare-fun res!250649 () Bool)

(assert (=> b!427318 (=> (not res!250649) (not e!253380))))

(assert (=> b!427318 (= res!250649 (and (= (size!12874 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12873 _keys!709) (size!12874 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!427319 () Bool)

(declare-fun res!250652 () Bool)

(assert (=> b!427319 (=> (not res!250652) (not e!253380))))

(declare-fun arrayContainsKey!0 (array!26144 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427319 (= res!250652 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!427320 () Bool)

(declare-fun res!250640 () Bool)

(assert (=> b!427320 (=> (not res!250640) (not e!253379))))

(declare-datatypes ((List!7290 0))(
  ( (Nil!7287) (Cons!7286 (h!8142 (_ BitVec 64)) (t!12728 List!7290)) )
))
(declare-fun arrayNoDuplicates!0 (array!26144 (_ BitVec 32) List!7290) Bool)

(assert (=> b!427320 (= res!250640 (arrayNoDuplicates!0 lt!195270 #b00000000000000000000000000000000 Nil!7287))))

(declare-fun b!427321 () Bool)

(declare-fun res!250653 () Bool)

(assert (=> b!427321 (=> (not res!250653) (not e!253380))))

(assert (=> b!427321 (= res!250653 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7287))))

(assert (= (and start!39716 res!250646) b!427316))

(assert (= (and b!427316 res!250643) b!427318))

(assert (= (and b!427318 res!250649) b!427314))

(assert (= (and b!427314 res!250642) b!427321))

(assert (= (and b!427321 res!250653) b!427315))

(assert (= (and b!427315 res!250651) b!427309))

(assert (= (and b!427309 res!250645) b!427312))

(assert (= (and b!427312 res!250647) b!427319))

(assert (= (and b!427319 res!250652) b!427305))

(assert (= (and b!427305 res!250641) b!427320))

(assert (= (and b!427320 res!250640) b!427310))

(assert (= (and b!427310 res!250644) b!427317))

(assert (= (and b!427317 res!250650) b!427306))

(assert (= (and b!427306 (not res!250648)) b!427311))

(assert (= (and b!427307 condMapEmpty!18345) mapIsEmpty!18345))

(assert (= (and b!427307 (not condMapEmpty!18345)) mapNonEmpty!18345))

(get-info :version)

(assert (= (and mapNonEmpty!18345 ((_ is ValueCellFull!5231) mapValue!18345)) b!427313))

(assert (= (and b!427307 ((_ is ValueCellFull!5231) mapDefault!18345)) b!427308))

(assert (= start!39716 b!427307))

(declare-fun b_lambda!9107 () Bool)

(assert (=> (not b_lambda!9107) (not b!427311)))

(declare-fun t!12726 () Bool)

(declare-fun tb!3395 () Bool)

(assert (=> (and start!39716 (= defaultEntry!557 defaultEntry!557) t!12726) tb!3395))

(declare-fun result!6325 () Bool)

(assert (=> tb!3395 (= result!6325 tp_is_empty!11149)))

(assert (=> b!427311 t!12726))

(declare-fun b_and!17669 () Bool)

(assert (= b_and!17667 (and (=> t!12726 result!6325) b_and!17669)))

(declare-fun m!416075 () Bool)

(assert (=> b!427320 m!416075))

(declare-fun m!416077 () Bool)

(assert (=> b!427321 m!416077))

(declare-fun m!416079 () Bool)

(assert (=> mapNonEmpty!18345 m!416079))

(declare-fun m!416081 () Bool)

(assert (=> b!427316 m!416081))

(declare-fun m!416083 () Bool)

(assert (=> b!427314 m!416083))

(declare-fun m!416085 () Bool)

(assert (=> start!39716 m!416085))

(declare-fun m!416087 () Bool)

(assert (=> start!39716 m!416087))

(declare-fun m!416089 () Bool)

(assert (=> b!427317 m!416089))

(declare-fun m!416091 () Bool)

(assert (=> b!427317 m!416091))

(declare-fun m!416093 () Bool)

(assert (=> b!427317 m!416093))

(declare-fun m!416095 () Bool)

(assert (=> b!427319 m!416095))

(declare-fun m!416097 () Bool)

(assert (=> b!427306 m!416097))

(declare-fun m!416099 () Bool)

(assert (=> b!427306 m!416099))

(assert (=> b!427306 m!416097))

(declare-fun m!416101 () Bool)

(assert (=> b!427306 m!416101))

(declare-fun m!416103 () Bool)

(assert (=> b!427306 m!416103))

(declare-fun m!416105 () Bool)

(assert (=> b!427306 m!416105))

(declare-fun m!416107 () Bool)

(assert (=> b!427306 m!416107))

(assert (=> b!427311 m!416097))

(declare-fun m!416109 () Bool)

(assert (=> b!427311 m!416109))

(declare-fun m!416111 () Bool)

(assert (=> b!427311 m!416111))

(declare-fun m!416113 () Bool)

(assert (=> b!427311 m!416113))

(assert (=> b!427311 m!416113))

(assert (=> b!427311 m!416109))

(declare-fun m!416115 () Bool)

(assert (=> b!427311 m!416115))

(declare-fun m!416117 () Bool)

(assert (=> b!427305 m!416117))

(declare-fun m!416119 () Bool)

(assert (=> b!427305 m!416119))

(declare-fun m!416121 () Bool)

(assert (=> b!427312 m!416121))

(declare-fun m!416123 () Bool)

(assert (=> b!427309 m!416123))

(check-sat (not b!427305) (not b!427311) b_and!17669 tp_is_empty!11149 (not b!427306) (not b!427316) (not mapNonEmpty!18345) (not b!427309) (not b!427320) (not b!427317) (not b!427319) (not b_next!9997) (not b!427321) (not b_lambda!9107) (not start!39716) (not b!427314))
(check-sat b_and!17669 (not b_next!9997))
