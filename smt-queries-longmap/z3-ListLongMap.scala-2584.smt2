; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39308 () Bool)

(assert start!39308)

(declare-fun b_free!9589 () Bool)

(declare-fun b_next!9589 () Bool)

(assert (=> start!39308 (= b_free!9589 (not b_next!9589))))

(declare-fun tp!34296 () Bool)

(declare-fun b_and!17027 () Bool)

(assert (=> start!39308 (= tp!34296 b_and!17027)))

(declare-fun b!416392 () Bool)

(declare-fun res!242430 () Bool)

(declare-fun e!248528 () Bool)

(assert (=> b!416392 (=> (not res!242430) (not e!248528))))

(declare-datatypes ((array!25327 0))(
  ( (array!25328 (arr!12113 (Array (_ BitVec 32) (_ BitVec 64))) (size!12466 (_ BitVec 32))) )
))
(declare-fun lt!190561 () array!25327)

(declare-datatypes ((List!7051 0))(
  ( (Nil!7048) (Cons!7047 (h!7903 (_ BitVec 64)) (t!12296 List!7051)) )
))
(declare-fun arrayNoDuplicates!0 (array!25327 (_ BitVec 32) List!7051) Bool)

(assert (=> b!416392 (= res!242430 (arrayNoDuplicates!0 lt!190561 #b00000000000000000000000000000000 Nil!7048))))

(declare-fun b!416393 () Bool)

(declare-fun res!242428 () Bool)

(declare-fun e!248533 () Bool)

(assert (=> b!416393 (=> (not res!242428) (not e!248533))))

(declare-fun _keys!709 () array!25327)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25327 (_ BitVec 32)) Bool)

(assert (=> b!416393 (= res!242428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!242436 () Bool)

(assert (=> start!39308 (=> (not res!242436) (not e!248533))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39308 (= res!242436 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12466 _keys!709))))))

(assert (=> start!39308 e!248533))

(declare-fun tp_is_empty!10741 () Bool)

(assert (=> start!39308 tp_is_empty!10741))

(assert (=> start!39308 tp!34296))

(assert (=> start!39308 true))

(declare-datatypes ((V!15427 0))(
  ( (V!15428 (val!5415 Int)) )
))
(declare-datatypes ((ValueCell!5027 0))(
  ( (ValueCellFull!5027 (v!7656 V!15427)) (EmptyCell!5027) )
))
(declare-datatypes ((array!25329 0))(
  ( (array!25330 (arr!12114 (Array (_ BitVec 32) ValueCell!5027)) (size!12467 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25329)

(declare-fun e!248529 () Bool)

(declare-fun array_inv!8874 (array!25329) Bool)

(assert (=> start!39308 (and (array_inv!8874 _values!549) e!248529)))

(declare-fun array_inv!8875 (array!25327) Bool)

(assert (=> start!39308 (array_inv!8875 _keys!709)))

(declare-fun b!416394 () Bool)

(declare-fun res!242435 () Bool)

(assert (=> b!416394 (=> (not res!242435) (not e!248528))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!416394 (= res!242435 (bvsle from!863 i!563))))

(declare-fun b!416395 () Bool)

(declare-fun e!248535 () Bool)

(assert (=> b!416395 (= e!248528 e!248535)))

(declare-fun res!242431 () Bool)

(assert (=> b!416395 (=> (not res!242431) (not e!248535))))

(assert (=> b!416395 (= res!242431 (= from!863 i!563))))

(declare-fun minValue!515 () V!15427)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!190568 () array!25329)

(declare-fun zeroValue!515 () V!15427)

(declare-datatypes ((tuple2!7048 0))(
  ( (tuple2!7049 (_1!3535 (_ BitVec 64)) (_2!3535 V!15427)) )
))
(declare-datatypes ((List!7052 0))(
  ( (Nil!7049) (Cons!7048 (h!7904 tuple2!7048) (t!12297 List!7052)) )
))
(declare-datatypes ((ListLongMap!5951 0))(
  ( (ListLongMap!5952 (toList!2991 List!7052)) )
))
(declare-fun lt!190566 () ListLongMap!5951)

(declare-fun getCurrentListMapNoExtraKeys!1202 (array!25327 array!25329 (_ BitVec 32) (_ BitVec 32) V!15427 V!15427 (_ BitVec 32) Int) ListLongMap!5951)

(assert (=> b!416395 (= lt!190566 (getCurrentListMapNoExtraKeys!1202 lt!190561 lt!190568 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15427)

(assert (=> b!416395 (= lt!190568 (array!25330 (store (arr!12114 _values!549) i!563 (ValueCellFull!5027 v!412)) (size!12467 _values!549)))))

(declare-fun lt!190562 () ListLongMap!5951)

(assert (=> b!416395 (= lt!190562 (getCurrentListMapNoExtraKeys!1202 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!416396 () Bool)

(declare-fun res!242429 () Bool)

(assert (=> b!416396 (=> (not res!242429) (not e!248533))))

(assert (=> b!416396 (= res!242429 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7048))))

(declare-fun b!416397 () Bool)

(assert (=> b!416397 (= e!248533 e!248528)))

(declare-fun res!242434 () Bool)

(assert (=> b!416397 (=> (not res!242434) (not e!248528))))

(assert (=> b!416397 (= res!242434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190561 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!416397 (= lt!190561 (array!25328 (store (arr!12113 _keys!709) i!563 k0!794) (size!12466 _keys!709)))))

(declare-fun call!28921 () ListLongMap!5951)

(declare-fun b!416398 () Bool)

(declare-fun e!248527 () Bool)

(declare-fun call!28920 () ListLongMap!5951)

(declare-fun +!1222 (ListLongMap!5951 tuple2!7048) ListLongMap!5951)

(assert (=> b!416398 (= e!248527 (= call!28921 (+!1222 call!28920 (tuple2!7049 k0!794 v!412))))))

(declare-fun b!416399 () Bool)

(declare-fun res!242433 () Bool)

(assert (=> b!416399 (=> (not res!242433) (not e!248533))))

(assert (=> b!416399 (= res!242433 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12466 _keys!709))))))

(declare-fun b!416400 () Bool)

(declare-fun e!248530 () Bool)

(assert (=> b!416400 (= e!248530 true)))

(declare-fun lt!190560 () ListLongMap!5951)

(declare-fun lt!190564 () V!15427)

(declare-fun lt!190558 () tuple2!7048)

(assert (=> b!416400 (= (+!1222 lt!190560 lt!190558) (+!1222 (+!1222 lt!190560 (tuple2!7049 k0!794 lt!190564)) lt!190558))))

(declare-fun lt!190567 () V!15427)

(assert (=> b!416400 (= lt!190558 (tuple2!7049 k0!794 lt!190567))))

(declare-datatypes ((Unit!12282 0))(
  ( (Unit!12283) )
))
(declare-fun lt!190563 () Unit!12282)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!11 (ListLongMap!5951 (_ BitVec 64) V!15427 V!15427) Unit!12282)

(assert (=> b!416400 (= lt!190563 (addSameAsAddTwiceSameKeyDiffValues!11 lt!190560 k0!794 lt!190564 lt!190567))))

(declare-fun lt!190565 () V!15427)

(declare-fun get!5982 (ValueCell!5027 V!15427) V!15427)

(assert (=> b!416400 (= lt!190564 (get!5982 (select (arr!12114 _values!549) from!863) lt!190565))))

(assert (=> b!416400 (= lt!190566 (+!1222 lt!190560 (tuple2!7049 (select (arr!12113 lt!190561) from!863) lt!190567)))))

(assert (=> b!416400 (= lt!190567 (get!5982 (select (store (arr!12114 _values!549) i!563 (ValueCellFull!5027 v!412)) from!863) lt!190565))))

(declare-fun dynLambda!668 (Int (_ BitVec 64)) V!15427)

(assert (=> b!416400 (= lt!190565 (dynLambda!668 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!416400 (= lt!190560 (getCurrentListMapNoExtraKeys!1202 lt!190561 lt!190568 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28917 () Bool)

(declare-fun c!55026 () Bool)

(assert (=> bm!28917 (= call!28921 (getCurrentListMapNoExtraKeys!1202 (ite c!55026 lt!190561 _keys!709) (ite c!55026 lt!190568 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416401 () Bool)

(declare-fun res!242432 () Bool)

(assert (=> b!416401 (=> (not res!242432) (not e!248533))))

(assert (=> b!416401 (= res!242432 (and (= (size!12467 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12466 _keys!709) (size!12467 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!416402 () Bool)

(declare-fun res!242423 () Bool)

(assert (=> b!416402 (=> (not res!242423) (not e!248533))))

(assert (=> b!416402 (= res!242423 (or (= (select (arr!12113 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12113 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!416403 () Bool)

(declare-fun res!242424 () Bool)

(assert (=> b!416403 (=> (not res!242424) (not e!248533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416403 (= res!242424 (validKeyInArray!0 k0!794))))

(declare-fun b!416404 () Bool)

(declare-fun res!242427 () Bool)

(assert (=> b!416404 (=> (not res!242427) (not e!248533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416404 (= res!242427 (validMask!0 mask!1025))))

(declare-fun bm!28918 () Bool)

(assert (=> bm!28918 (= call!28920 (getCurrentListMapNoExtraKeys!1202 (ite c!55026 _keys!709 lt!190561) (ite c!55026 _values!549 lt!190568) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416405 () Bool)

(assert (=> b!416405 (= e!248535 (not e!248530))))

(declare-fun res!242426 () Bool)

(assert (=> b!416405 (=> res!242426 e!248530)))

(assert (=> b!416405 (= res!242426 (validKeyInArray!0 (select (arr!12113 _keys!709) from!863)))))

(assert (=> b!416405 e!248527))

(assert (=> b!416405 (= c!55026 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!190559 () Unit!12282)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!402 (array!25327 array!25329 (_ BitVec 32) (_ BitVec 32) V!15427 V!15427 (_ BitVec 32) (_ BitVec 64) V!15427 (_ BitVec 32) Int) Unit!12282)

(assert (=> b!416405 (= lt!190559 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!402 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416406 () Bool)

(declare-fun e!248531 () Bool)

(assert (=> b!416406 (= e!248531 tp_is_empty!10741)))

(declare-fun mapIsEmpty!17733 () Bool)

(declare-fun mapRes!17733 () Bool)

(assert (=> mapIsEmpty!17733 mapRes!17733))

(declare-fun mapNonEmpty!17733 () Bool)

(declare-fun tp!34295 () Bool)

(assert (=> mapNonEmpty!17733 (= mapRes!17733 (and tp!34295 e!248531))))

(declare-fun mapRest!17733 () (Array (_ BitVec 32) ValueCell!5027))

(declare-fun mapKey!17733 () (_ BitVec 32))

(declare-fun mapValue!17733 () ValueCell!5027)

(assert (=> mapNonEmpty!17733 (= (arr!12114 _values!549) (store mapRest!17733 mapKey!17733 mapValue!17733))))

(declare-fun b!416407 () Bool)

(declare-fun res!242425 () Bool)

(assert (=> b!416407 (=> (not res!242425) (not e!248533))))

(declare-fun arrayContainsKey!0 (array!25327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!416407 (= res!242425 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!416408 () Bool)

(assert (=> b!416408 (= e!248527 (= call!28920 call!28921))))

(declare-fun b!416409 () Bool)

(declare-fun e!248532 () Bool)

(assert (=> b!416409 (= e!248529 (and e!248532 mapRes!17733))))

(declare-fun condMapEmpty!17733 () Bool)

(declare-fun mapDefault!17733 () ValueCell!5027)

(assert (=> b!416409 (= condMapEmpty!17733 (= (arr!12114 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5027)) mapDefault!17733)))))

(declare-fun b!416410 () Bool)

(assert (=> b!416410 (= e!248532 tp_is_empty!10741)))

(assert (= (and start!39308 res!242436) b!416404))

(assert (= (and b!416404 res!242427) b!416401))

(assert (= (and b!416401 res!242432) b!416393))

(assert (= (and b!416393 res!242428) b!416396))

(assert (= (and b!416396 res!242429) b!416399))

(assert (= (and b!416399 res!242433) b!416403))

(assert (= (and b!416403 res!242424) b!416402))

(assert (= (and b!416402 res!242423) b!416407))

(assert (= (and b!416407 res!242425) b!416397))

(assert (= (and b!416397 res!242434) b!416392))

(assert (= (and b!416392 res!242430) b!416394))

(assert (= (and b!416394 res!242435) b!416395))

(assert (= (and b!416395 res!242431) b!416405))

(assert (= (and b!416405 c!55026) b!416398))

(assert (= (and b!416405 (not c!55026)) b!416408))

(assert (= (or b!416398 b!416408) bm!28917))

(assert (= (or b!416398 b!416408) bm!28918))

(assert (= (and b!416405 (not res!242426)) b!416400))

(assert (= (and b!416409 condMapEmpty!17733) mapIsEmpty!17733))

(assert (= (and b!416409 (not condMapEmpty!17733)) mapNonEmpty!17733))

(get-info :version)

(assert (= (and mapNonEmpty!17733 ((_ is ValueCellFull!5027) mapValue!17733)) b!416406))

(assert (= (and b!416409 ((_ is ValueCellFull!5027) mapDefault!17733)) b!416410))

(assert (= start!39308 b!416409))

(declare-fun b_lambda!8875 () Bool)

(assert (=> (not b_lambda!8875) (not b!416400)))

(declare-fun t!12295 () Bool)

(declare-fun tb!3203 () Bool)

(assert (=> (and start!39308 (= defaultEntry!557 defaultEntry!557) t!12295) tb!3203))

(declare-fun result!5941 () Bool)

(assert (=> tb!3203 (= result!5941 tp_is_empty!10741)))

(assert (=> b!416400 t!12295))

(declare-fun b_and!17029 () Bool)

(assert (= b_and!17027 (and (=> t!12295 result!5941) b_and!17029)))

(declare-fun m!405111 () Bool)

(assert (=> b!416397 m!405111))

(declare-fun m!405113 () Bool)

(assert (=> b!416397 m!405113))

(declare-fun m!405115 () Bool)

(assert (=> mapNonEmpty!17733 m!405115))

(declare-fun m!405117 () Bool)

(assert (=> bm!28917 m!405117))

(declare-fun m!405119 () Bool)

(assert (=> start!39308 m!405119))

(declare-fun m!405121 () Bool)

(assert (=> start!39308 m!405121))

(declare-fun m!405123 () Bool)

(assert (=> b!416402 m!405123))

(declare-fun m!405125 () Bool)

(assert (=> b!416407 m!405125))

(declare-fun m!405127 () Bool)

(assert (=> b!416395 m!405127))

(declare-fun m!405129 () Bool)

(assert (=> b!416395 m!405129))

(declare-fun m!405131 () Bool)

(assert (=> b!416395 m!405131))

(declare-fun m!405133 () Bool)

(assert (=> b!416396 m!405133))

(declare-fun m!405135 () Bool)

(assert (=> b!416392 m!405135))

(declare-fun m!405137 () Bool)

(assert (=> b!416404 m!405137))

(declare-fun m!405139 () Bool)

(assert (=> b!416400 m!405139))

(declare-fun m!405141 () Bool)

(assert (=> b!416400 m!405141))

(declare-fun m!405143 () Bool)

(assert (=> b!416400 m!405143))

(declare-fun m!405145 () Bool)

(assert (=> b!416400 m!405145))

(declare-fun m!405147 () Bool)

(assert (=> b!416400 m!405147))

(assert (=> b!416400 m!405129))

(declare-fun m!405149 () Bool)

(assert (=> b!416400 m!405149))

(declare-fun m!405151 () Bool)

(assert (=> b!416400 m!405151))

(declare-fun m!405153 () Bool)

(assert (=> b!416400 m!405153))

(declare-fun m!405155 () Bool)

(assert (=> b!416400 m!405155))

(declare-fun m!405157 () Bool)

(assert (=> b!416400 m!405157))

(assert (=> b!416400 m!405149))

(declare-fun m!405159 () Bool)

(assert (=> b!416400 m!405159))

(assert (=> b!416400 m!405141))

(declare-fun m!405161 () Bool)

(assert (=> b!416400 m!405161))

(assert (=> b!416400 m!405143))

(declare-fun m!405163 () Bool)

(assert (=> b!416393 m!405163))

(declare-fun m!405165 () Bool)

(assert (=> b!416403 m!405165))

(declare-fun m!405167 () Bool)

(assert (=> bm!28918 m!405167))

(declare-fun m!405169 () Bool)

(assert (=> b!416405 m!405169))

(assert (=> b!416405 m!405169))

(declare-fun m!405171 () Bool)

(assert (=> b!416405 m!405171))

(declare-fun m!405173 () Bool)

(assert (=> b!416405 m!405173))

(declare-fun m!405175 () Bool)

(assert (=> b!416398 m!405175))

(check-sat (not b!416400) (not b!416396) (not b!416404) (not b_lambda!8875) (not b!416392) (not b!416403) (not mapNonEmpty!17733) tp_is_empty!10741 (not b!416397) (not bm!28917) (not b!416405) (not bm!28918) b_and!17029 (not b!416393) (not b_next!9589) (not b!416395) (not b!416407) (not start!39308) (not b!416398))
(check-sat b_and!17029 (not b_next!9589))
