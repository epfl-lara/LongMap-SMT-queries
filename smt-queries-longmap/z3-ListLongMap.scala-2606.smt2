; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39440 () Bool)

(assert start!39440)

(declare-fun b_free!9721 () Bool)

(declare-fun b_next!9721 () Bool)

(assert (=> start!39440 (= b_free!9721 (not b_next!9721))))

(declare-fun tp!34692 () Bool)

(declare-fun b_and!17291 () Bool)

(assert (=> start!39440 (= tp!34692 b_and!17291)))

(declare-fun res!245201 () Bool)

(declare-fun e!250316 () Bool)

(assert (=> start!39440 (=> (not res!245201) (not e!250316))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25579 0))(
  ( (array!25580 (arr!12239 (Array (_ BitVec 32) (_ BitVec 64))) (size!12592 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25579)

(assert (=> start!39440 (= res!245201 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12592 _keys!709))))))

(assert (=> start!39440 e!250316))

(declare-fun tp_is_empty!10873 () Bool)

(assert (=> start!39440 tp_is_empty!10873))

(assert (=> start!39440 tp!34692))

(assert (=> start!39440 true))

(declare-datatypes ((V!15603 0))(
  ( (V!15604 (val!5481 Int)) )
))
(declare-datatypes ((ValueCell!5093 0))(
  ( (ValueCellFull!5093 (v!7722 V!15603)) (EmptyCell!5093) )
))
(declare-datatypes ((array!25581 0))(
  ( (array!25582 (arr!12240 (Array (_ BitVec 32) ValueCell!5093)) (size!12593 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25581)

(declare-fun e!250315 () Bool)

(declare-fun array_inv!8964 (array!25581) Bool)

(assert (=> start!39440 (and (array_inv!8964 _values!549) e!250315)))

(declare-fun array_inv!8965 (array!25579) Bool)

(assert (=> start!39440 (array_inv!8965 _keys!709)))

(declare-fun b!420286 () Bool)

(declare-fun e!250311 () Bool)

(declare-fun e!250314 () Bool)

(assert (=> b!420286 (= e!250311 (not e!250314))))

(declare-fun res!245197 () Bool)

(assert (=> b!420286 (=> res!245197 e!250314)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!420286 (= res!245197 (validKeyInArray!0 (select (arr!12239 _keys!709) from!863)))))

(declare-fun e!250313 () Bool)

(assert (=> b!420286 e!250313))

(declare-fun c!55224 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!420286 (= c!55224 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15603)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15603)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12394 0))(
  ( (Unit!12395) )
))
(declare-fun lt!192740 () Unit!12394)

(declare-fun v!412 () V!15603)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!448 (array!25579 array!25581 (_ BitVec 32) (_ BitVec 32) V!15603 V!15603 (_ BitVec 32) (_ BitVec 64) V!15603 (_ BitVec 32) Int) Unit!12394)

(assert (=> b!420286 (= lt!192740 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!448 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420287 () Bool)

(declare-fun res!245199 () Bool)

(assert (=> b!420287 (=> (not res!245199) (not e!250316))))

(assert (=> b!420287 (= res!245199 (and (= (size!12593 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12592 _keys!709) (size!12593 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!420288 () Bool)

(declare-fun res!245204 () Bool)

(assert (=> b!420288 (=> (not res!245204) (not e!250316))))

(declare-fun arrayContainsKey!0 (array!25579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!420288 (= res!245204 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!420289 () Bool)

(declare-fun e!250309 () Bool)

(declare-fun mapRes!17931 () Bool)

(assert (=> b!420289 (= e!250315 (and e!250309 mapRes!17931))))

(declare-fun condMapEmpty!17931 () Bool)

(declare-fun mapDefault!17931 () ValueCell!5093)

(assert (=> b!420289 (= condMapEmpty!17931 (= (arr!12240 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5093)) mapDefault!17931)))))

(declare-fun b!420290 () Bool)

(declare-datatypes ((tuple2!7168 0))(
  ( (tuple2!7169 (_1!3595 (_ BitVec 64)) (_2!3595 V!15603)) )
))
(declare-datatypes ((List!7165 0))(
  ( (Nil!7162) (Cons!7161 (h!8017 tuple2!7168) (t!12542 List!7165)) )
))
(declare-datatypes ((ListLongMap!6071 0))(
  ( (ListLongMap!6072 (toList!3051 List!7165)) )
))
(declare-fun call!29316 () ListLongMap!6071)

(declare-fun call!29317 () ListLongMap!6071)

(assert (=> b!420290 (= e!250313 (= call!29316 call!29317))))

(declare-fun b!420291 () Bool)

(assert (=> b!420291 (= e!250309 tp_is_empty!10873)))

(declare-fun mapIsEmpty!17931 () Bool)

(assert (=> mapIsEmpty!17931 mapRes!17931))

(declare-fun b!420292 () Bool)

(assert (=> b!420292 (= e!250314 true)))

(declare-fun lt!192744 () ListLongMap!6071)

(declare-fun lt!192745 () V!15603)

(declare-fun lt!192739 () tuple2!7168)

(declare-fun +!1275 (ListLongMap!6071 tuple2!7168) ListLongMap!6071)

(assert (=> b!420292 (= (+!1275 lt!192744 lt!192739) (+!1275 (+!1275 lt!192744 (tuple2!7169 k0!794 lt!192745)) lt!192739))))

(declare-fun lt!192738 () V!15603)

(assert (=> b!420292 (= lt!192739 (tuple2!7169 k0!794 lt!192738))))

(declare-fun lt!192743 () Unit!12394)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!59 (ListLongMap!6071 (_ BitVec 64) V!15603 V!15603) Unit!12394)

(assert (=> b!420292 (= lt!192743 (addSameAsAddTwiceSameKeyDiffValues!59 lt!192744 k0!794 lt!192745 lt!192738))))

(declare-fun lt!192746 () V!15603)

(declare-fun get!6074 (ValueCell!5093 V!15603) V!15603)

(assert (=> b!420292 (= lt!192745 (get!6074 (select (arr!12240 _values!549) from!863) lt!192746))))

(declare-fun lt!192736 () ListLongMap!6071)

(declare-fun lt!192741 () array!25579)

(assert (=> b!420292 (= lt!192736 (+!1275 lt!192744 (tuple2!7169 (select (arr!12239 lt!192741) from!863) lt!192738)))))

(assert (=> b!420292 (= lt!192738 (get!6074 (select (store (arr!12240 _values!549) i!563 (ValueCellFull!5093 v!412)) from!863) lt!192746))))

(declare-fun dynLambda!716 (Int (_ BitVec 64)) V!15603)

(assert (=> b!420292 (= lt!192746 (dynLambda!716 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!192737 () array!25581)

(declare-fun getCurrentListMapNoExtraKeys!1261 (array!25579 array!25581 (_ BitVec 32) (_ BitVec 32) V!15603 V!15603 (_ BitVec 32) Int) ListLongMap!6071)

(assert (=> b!420292 (= lt!192744 (getCurrentListMapNoExtraKeys!1261 lt!192741 lt!192737 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29313 () Bool)

(assert (=> bm!29313 (= call!29316 (getCurrentListMapNoExtraKeys!1261 (ite c!55224 _keys!709 lt!192741) (ite c!55224 _values!549 lt!192737) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420293 () Bool)

(declare-fun res!245198 () Bool)

(declare-fun e!250317 () Bool)

(assert (=> b!420293 (=> (not res!245198) (not e!250317))))

(declare-datatypes ((List!7166 0))(
  ( (Nil!7163) (Cons!7162 (h!8018 (_ BitVec 64)) (t!12543 List!7166)) )
))
(declare-fun arrayNoDuplicates!0 (array!25579 (_ BitVec 32) List!7166) Bool)

(assert (=> b!420293 (= res!245198 (arrayNoDuplicates!0 lt!192741 #b00000000000000000000000000000000 Nil!7163))))

(declare-fun b!420294 () Bool)

(declare-fun res!245206 () Bool)

(assert (=> b!420294 (=> (not res!245206) (not e!250316))))

(assert (=> b!420294 (= res!245206 (or (= (select (arr!12239 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12239 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!420295 () Bool)

(declare-fun res!245208 () Bool)

(assert (=> b!420295 (=> (not res!245208) (not e!250316))))

(assert (=> b!420295 (= res!245208 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!17931 () Bool)

(declare-fun tp!34691 () Bool)

(declare-fun e!250310 () Bool)

(assert (=> mapNonEmpty!17931 (= mapRes!17931 (and tp!34691 e!250310))))

(declare-fun mapKey!17931 () (_ BitVec 32))

(declare-fun mapRest!17931 () (Array (_ BitVec 32) ValueCell!5093))

(declare-fun mapValue!17931 () ValueCell!5093)

(assert (=> mapNonEmpty!17931 (= (arr!12240 _values!549) (store mapRest!17931 mapKey!17931 mapValue!17931))))

(declare-fun b!420296 () Bool)

(declare-fun res!245202 () Bool)

(assert (=> b!420296 (=> (not res!245202) (not e!250316))))

(assert (=> b!420296 (= res!245202 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12592 _keys!709))))))

(declare-fun b!420297 () Bool)

(declare-fun res!245195 () Bool)

(assert (=> b!420297 (=> (not res!245195) (not e!250316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!420297 (= res!245195 (validMask!0 mask!1025))))

(declare-fun b!420298 () Bool)

(declare-fun res!245203 () Bool)

(assert (=> b!420298 (=> (not res!245203) (not e!250317))))

(assert (=> b!420298 (= res!245203 (bvsle from!863 i!563))))

(declare-fun bm!29314 () Bool)

(assert (=> bm!29314 (= call!29317 (getCurrentListMapNoExtraKeys!1261 (ite c!55224 lt!192741 _keys!709) (ite c!55224 lt!192737 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420299 () Bool)

(assert (=> b!420299 (= e!250313 (= call!29317 (+!1275 call!29316 (tuple2!7169 k0!794 v!412))))))

(declare-fun b!420300 () Bool)

(assert (=> b!420300 (= e!250316 e!250317)))

(declare-fun res!245200 () Bool)

(assert (=> b!420300 (=> (not res!245200) (not e!250317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25579 (_ BitVec 32)) Bool)

(assert (=> b!420300 (= res!245200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192741 mask!1025))))

(assert (=> b!420300 (= lt!192741 (array!25580 (store (arr!12239 _keys!709) i!563 k0!794) (size!12592 _keys!709)))))

(declare-fun b!420301 () Bool)

(declare-fun res!245196 () Bool)

(assert (=> b!420301 (=> (not res!245196) (not e!250316))))

(assert (=> b!420301 (= res!245196 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7163))))

(declare-fun b!420302 () Bool)

(assert (=> b!420302 (= e!250310 tp_is_empty!10873)))

(declare-fun b!420303 () Bool)

(declare-fun res!245207 () Bool)

(assert (=> b!420303 (=> (not res!245207) (not e!250316))))

(assert (=> b!420303 (= res!245207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!420304 () Bool)

(assert (=> b!420304 (= e!250317 e!250311)))

(declare-fun res!245205 () Bool)

(assert (=> b!420304 (=> (not res!245205) (not e!250311))))

(assert (=> b!420304 (= res!245205 (= from!863 i!563))))

(assert (=> b!420304 (= lt!192736 (getCurrentListMapNoExtraKeys!1261 lt!192741 lt!192737 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!420304 (= lt!192737 (array!25582 (store (arr!12240 _values!549) i!563 (ValueCellFull!5093 v!412)) (size!12593 _values!549)))))

(declare-fun lt!192742 () ListLongMap!6071)

(assert (=> b!420304 (= lt!192742 (getCurrentListMapNoExtraKeys!1261 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!39440 res!245201) b!420297))

(assert (= (and b!420297 res!245195) b!420287))

(assert (= (and b!420287 res!245199) b!420303))

(assert (= (and b!420303 res!245207) b!420301))

(assert (= (and b!420301 res!245196) b!420296))

(assert (= (and b!420296 res!245202) b!420295))

(assert (= (and b!420295 res!245208) b!420294))

(assert (= (and b!420294 res!245206) b!420288))

(assert (= (and b!420288 res!245204) b!420300))

(assert (= (and b!420300 res!245200) b!420293))

(assert (= (and b!420293 res!245198) b!420298))

(assert (= (and b!420298 res!245203) b!420304))

(assert (= (and b!420304 res!245205) b!420286))

(assert (= (and b!420286 c!55224) b!420299))

(assert (= (and b!420286 (not c!55224)) b!420290))

(assert (= (or b!420299 b!420290) bm!29314))

(assert (= (or b!420299 b!420290) bm!29313))

(assert (= (and b!420286 (not res!245197)) b!420292))

(assert (= (and b!420289 condMapEmpty!17931) mapIsEmpty!17931))

(assert (= (and b!420289 (not condMapEmpty!17931)) mapNonEmpty!17931))

(get-info :version)

(assert (= (and mapNonEmpty!17931 ((_ is ValueCellFull!5093) mapValue!17931)) b!420302))

(assert (= (and b!420289 ((_ is ValueCellFull!5093) mapDefault!17931)) b!420291))

(assert (= start!39440 b!420289))

(declare-fun b_lambda!9007 () Bool)

(assert (=> (not b_lambda!9007) (not b!420292)))

(declare-fun t!12541 () Bool)

(declare-fun tb!3335 () Bool)

(assert (=> (and start!39440 (= defaultEntry!557 defaultEntry!557) t!12541) tb!3335))

(declare-fun result!6205 () Bool)

(assert (=> tb!3335 (= result!6205 tp_is_empty!10873)))

(assert (=> b!420292 t!12541))

(declare-fun b_and!17293 () Bool)

(assert (= b_and!17291 (and (=> t!12541 result!6205) b_and!17293)))

(declare-fun m!409461 () Bool)

(assert (=> b!420286 m!409461))

(assert (=> b!420286 m!409461))

(declare-fun m!409463 () Bool)

(assert (=> b!420286 m!409463))

(declare-fun m!409465 () Bool)

(assert (=> b!420286 m!409465))

(declare-fun m!409467 () Bool)

(assert (=> b!420293 m!409467))

(declare-fun m!409469 () Bool)

(assert (=> b!420303 m!409469))

(declare-fun m!409471 () Bool)

(assert (=> b!420304 m!409471))

(declare-fun m!409473 () Bool)

(assert (=> b!420304 m!409473))

(declare-fun m!409475 () Bool)

(assert (=> b!420304 m!409475))

(declare-fun m!409477 () Bool)

(assert (=> b!420288 m!409477))

(declare-fun m!409479 () Bool)

(assert (=> b!420300 m!409479))

(declare-fun m!409481 () Bool)

(assert (=> b!420300 m!409481))

(declare-fun m!409483 () Bool)

(assert (=> bm!29314 m!409483))

(declare-fun m!409485 () Bool)

(assert (=> bm!29313 m!409485))

(declare-fun m!409487 () Bool)

(assert (=> b!420294 m!409487))

(declare-fun m!409489 () Bool)

(assert (=> b!420299 m!409489))

(declare-fun m!409491 () Bool)

(assert (=> b!420297 m!409491))

(declare-fun m!409493 () Bool)

(assert (=> start!39440 m!409493))

(declare-fun m!409495 () Bool)

(assert (=> start!39440 m!409495))

(declare-fun m!409497 () Bool)

(assert (=> b!420295 m!409497))

(declare-fun m!409499 () Bool)

(assert (=> mapNonEmpty!17931 m!409499))

(declare-fun m!409501 () Bool)

(assert (=> b!420301 m!409501))

(declare-fun m!409503 () Bool)

(assert (=> b!420292 m!409503))

(declare-fun m!409505 () Bool)

(assert (=> b!420292 m!409505))

(assert (=> b!420292 m!409473))

(declare-fun m!409507 () Bool)

(assert (=> b!420292 m!409507))

(declare-fun m!409509 () Bool)

(assert (=> b!420292 m!409509))

(declare-fun m!409511 () Bool)

(assert (=> b!420292 m!409511))

(declare-fun m!409513 () Bool)

(assert (=> b!420292 m!409513))

(declare-fun m!409515 () Bool)

(assert (=> b!420292 m!409515))

(declare-fun m!409517 () Bool)

(assert (=> b!420292 m!409517))

(assert (=> b!420292 m!409515))

(declare-fun m!409519 () Bool)

(assert (=> b!420292 m!409519))

(assert (=> b!420292 m!409503))

(declare-fun m!409521 () Bool)

(assert (=> b!420292 m!409521))

(assert (=> b!420292 m!409509))

(declare-fun m!409523 () Bool)

(assert (=> b!420292 m!409523))

(declare-fun m!409525 () Bool)

(assert (=> b!420292 m!409525))

(check-sat (not start!39440) (not b!420301) (not b_lambda!9007) (not b!420304) (not b!420292) (not b!420293) (not bm!29313) (not b!420295) (not mapNonEmpty!17931) (not b!420299) b_and!17293 (not b_next!9721) (not b!420303) (not b!420288) tp_is_empty!10873 (not b!420297) (not b!420286) (not b!420300) (not bm!29314))
(check-sat b_and!17293 (not b_next!9721))
