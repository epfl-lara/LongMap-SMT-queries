; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39270 () Bool)

(assert start!39270)

(declare-fun b_free!9537 () Bool)

(declare-fun b_next!9537 () Bool)

(assert (=> start!39270 (= b_free!9537 (not b_next!9537))))

(declare-fun tp!34139 () Bool)

(declare-fun b_and!16949 () Bool)

(assert (=> start!39270 (= tp!34139 b_and!16949)))

(declare-fun b!415129 () Bool)

(declare-fun res!241470 () Bool)

(declare-fun e!248002 () Bool)

(assert (=> b!415129 (=> (not res!241470) (not e!248002))))

(declare-datatypes ((array!25235 0))(
  ( (array!25236 (arr!12067 (Array (_ BitVec 32) (_ BitVec 64))) (size!12419 (_ BitVec 32))) )
))
(declare-fun lt!190174 () array!25235)

(declare-datatypes ((List!7040 0))(
  ( (Nil!7037) (Cons!7036 (h!7892 (_ BitVec 64)) (t!12242 List!7040)) )
))
(declare-fun arrayNoDuplicates!0 (array!25235 (_ BitVec 32) List!7040) Bool)

(assert (=> b!415129 (= res!241470 (arrayNoDuplicates!0 lt!190174 #b00000000000000000000000000000000 Nil!7037))))

(declare-fun b!415130 () Bool)

(declare-fun e!248001 () Bool)

(assert (=> b!415130 (= e!248001 true)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15357 0))(
  ( (V!15358 (val!5389 Int)) )
))
(declare-fun minValue!515 () V!15357)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15357)

(declare-datatypes ((ValueCell!5001 0))(
  ( (ValueCellFull!5001 (v!7636 V!15357)) (EmptyCell!5001) )
))
(declare-datatypes ((array!25237 0))(
  ( (array!25238 (arr!12068 (Array (_ BitVec 32) ValueCell!5001)) (size!12420 (_ BitVec 32))) )
))
(declare-fun lt!190177 () array!25237)

(declare-datatypes ((tuple2!7018 0))(
  ( (tuple2!7019 (_1!3520 (_ BitVec 64)) (_2!3520 V!15357)) )
))
(declare-datatypes ((List!7041 0))(
  ( (Nil!7038) (Cons!7037 (h!7893 tuple2!7018) (t!12243 List!7041)) )
))
(declare-datatypes ((ListLongMap!5931 0))(
  ( (ListLongMap!5932 (toList!2981 List!7041)) )
))
(declare-fun lt!190176 () ListLongMap!5931)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun +!1185 (ListLongMap!5931 tuple2!7018) ListLongMap!5931)

(declare-fun getCurrentListMapNoExtraKeys!1187 (array!25235 array!25237 (_ BitVec 32) (_ BitVec 32) V!15357 V!15357 (_ BitVec 32) Int) ListLongMap!5931)

(declare-fun get!5955 (ValueCell!5001 V!15357) V!15357)

(declare-fun dynLambda!662 (Int (_ BitVec 64)) V!15357)

(assert (=> b!415130 (= lt!190176 (+!1185 (getCurrentListMapNoExtraKeys!1187 lt!190174 lt!190177 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7019 (select (arr!12067 lt!190174) from!863) (get!5955 (select (arr!12068 lt!190177) from!863) (dynLambda!662 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!241462 () Bool)

(declare-fun e!248000 () Bool)

(assert (=> start!39270 (=> (not res!241462) (not e!248000))))

(declare-fun _keys!709 () array!25235)

(assert (=> start!39270 (= res!241462 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12419 _keys!709))))))

(assert (=> start!39270 e!248000))

(declare-fun tp_is_empty!10689 () Bool)

(assert (=> start!39270 tp_is_empty!10689))

(assert (=> start!39270 tp!34139))

(assert (=> start!39270 true))

(declare-fun _values!549 () array!25237)

(declare-fun e!248005 () Bool)

(declare-fun array_inv!8802 (array!25237) Bool)

(assert (=> start!39270 (and (array_inv!8802 _values!549) e!248005)))

(declare-fun array_inv!8803 (array!25235) Bool)

(assert (=> start!39270 (array_inv!8803 _keys!709)))

(declare-fun b!415131 () Bool)

(declare-fun res!241467 () Bool)

(assert (=> b!415131 (=> (not res!241467) (not e!248002))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!415131 (= res!241467 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!17655 () Bool)

(declare-fun mapRes!17655 () Bool)

(declare-fun tp!34140 () Bool)

(declare-fun e!248003 () Bool)

(assert (=> mapNonEmpty!17655 (= mapRes!17655 (and tp!34140 e!248003))))

(declare-fun mapKey!17655 () (_ BitVec 32))

(declare-fun mapValue!17655 () ValueCell!5001)

(declare-fun mapRest!17655 () (Array (_ BitVec 32) ValueCell!5001))

(assert (=> mapNonEmpty!17655 (= (arr!12068 _values!549) (store mapRest!17655 mapKey!17655 mapValue!17655))))

(declare-fun b!415132 () Bool)

(declare-fun e!247999 () Bool)

(assert (=> b!415132 (= e!247999 tp_is_empty!10689)))

(declare-fun b!415133 () Bool)

(declare-fun res!241468 () Bool)

(assert (=> b!415133 (=> (not res!241468) (not e!248000))))

(assert (=> b!415133 (= res!241468 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12419 _keys!709))))))

(declare-fun b!415134 () Bool)

(declare-fun res!241465 () Bool)

(assert (=> b!415134 (=> (not res!241465) (not e!248000))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!415134 (= res!241465 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!415135 () Bool)

(declare-fun res!241460 () Bool)

(assert (=> b!415135 (=> (not res!241460) (not e!248000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!415135 (= res!241460 (validMask!0 mask!1025))))

(declare-fun b!415136 () Bool)

(assert (=> b!415136 (= e!248003 tp_is_empty!10689)))

(declare-fun b!415137 () Bool)

(declare-fun e!248004 () Bool)

(declare-fun call!28789 () ListLongMap!5931)

(declare-fun call!28790 () ListLongMap!5931)

(assert (=> b!415137 (= e!248004 (= call!28789 call!28790))))

(declare-fun b!415138 () Bool)

(declare-fun res!241461 () Bool)

(assert (=> b!415138 (=> (not res!241461) (not e!248000))))

(assert (=> b!415138 (= res!241461 (or (= (select (arr!12067 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12067 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!415139 () Bool)

(declare-fun res!241466 () Bool)

(assert (=> b!415139 (=> (not res!241466) (not e!248000))))

(assert (=> b!415139 (= res!241466 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7037))))

(declare-fun bm!28786 () Bool)

(declare-fun c!55019 () Bool)

(assert (=> bm!28786 (= call!28789 (getCurrentListMapNoExtraKeys!1187 (ite c!55019 _keys!709 lt!190174) (ite c!55019 _values!549 lt!190177) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415140 () Bool)

(assert (=> b!415140 (= e!248000 e!248002)))

(declare-fun res!241473 () Bool)

(assert (=> b!415140 (=> (not res!241473) (not e!248002))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25235 (_ BitVec 32)) Bool)

(assert (=> b!415140 (= res!241473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190174 mask!1025))))

(assert (=> b!415140 (= lt!190174 (array!25236 (store (arr!12067 _keys!709) i!563 k0!794) (size!12419 _keys!709)))))

(declare-fun b!415141 () Bool)

(declare-fun e!248007 () Bool)

(assert (=> b!415141 (= e!248002 e!248007)))

(declare-fun res!241469 () Bool)

(assert (=> b!415141 (=> (not res!241469) (not e!248007))))

(assert (=> b!415141 (= res!241469 (= from!863 i!563))))

(assert (=> b!415141 (= lt!190176 (getCurrentListMapNoExtraKeys!1187 lt!190174 lt!190177 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15357)

(assert (=> b!415141 (= lt!190177 (array!25238 (store (arr!12068 _values!549) i!563 (ValueCellFull!5001 v!412)) (size!12420 _values!549)))))

(declare-fun lt!190175 () ListLongMap!5931)

(assert (=> b!415141 (= lt!190175 (getCurrentListMapNoExtraKeys!1187 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!415142 () Bool)

(declare-fun res!241464 () Bool)

(assert (=> b!415142 (=> (not res!241464) (not e!248000))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!415142 (= res!241464 (validKeyInArray!0 k0!794))))

(declare-fun b!415143 () Bool)

(declare-fun res!241472 () Bool)

(assert (=> b!415143 (=> (not res!241472) (not e!248000))))

(assert (=> b!415143 (= res!241472 (and (= (size!12420 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12419 _keys!709) (size!12420 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!28787 () Bool)

(assert (=> bm!28787 (= call!28790 (getCurrentListMapNoExtraKeys!1187 (ite c!55019 lt!190174 _keys!709) (ite c!55019 lt!190177 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415144 () Bool)

(assert (=> b!415144 (= e!248007 (not e!248001))))

(declare-fun res!241463 () Bool)

(assert (=> b!415144 (=> res!241463 e!248001)))

(assert (=> b!415144 (= res!241463 (validKeyInArray!0 (select (arr!12067 _keys!709) from!863)))))

(assert (=> b!415144 e!248004))

(assert (=> b!415144 (= c!55019 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12274 0))(
  ( (Unit!12275) )
))
(declare-fun lt!190178 () Unit!12274)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!395 (array!25235 array!25237 (_ BitVec 32) (_ BitVec 32) V!15357 V!15357 (_ BitVec 32) (_ BitVec 64) V!15357 (_ BitVec 32) Int) Unit!12274)

(assert (=> b!415144 (= lt!190178 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!395 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415145 () Bool)

(assert (=> b!415145 (= e!248005 (and e!247999 mapRes!17655))))

(declare-fun condMapEmpty!17655 () Bool)

(declare-fun mapDefault!17655 () ValueCell!5001)

(assert (=> b!415145 (= condMapEmpty!17655 (= (arr!12068 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5001)) mapDefault!17655)))))

(declare-fun b!415146 () Bool)

(declare-fun res!241471 () Bool)

(assert (=> b!415146 (=> (not res!241471) (not e!248000))))

(assert (=> b!415146 (= res!241471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!415147 () Bool)

(assert (=> b!415147 (= e!248004 (= call!28790 (+!1185 call!28789 (tuple2!7019 k0!794 v!412))))))

(declare-fun mapIsEmpty!17655 () Bool)

(assert (=> mapIsEmpty!17655 mapRes!17655))

(assert (= (and start!39270 res!241462) b!415135))

(assert (= (and b!415135 res!241460) b!415143))

(assert (= (and b!415143 res!241472) b!415146))

(assert (= (and b!415146 res!241471) b!415139))

(assert (= (and b!415139 res!241466) b!415133))

(assert (= (and b!415133 res!241468) b!415142))

(assert (= (and b!415142 res!241464) b!415138))

(assert (= (and b!415138 res!241461) b!415134))

(assert (= (and b!415134 res!241465) b!415140))

(assert (= (and b!415140 res!241473) b!415129))

(assert (= (and b!415129 res!241470) b!415131))

(assert (= (and b!415131 res!241467) b!415141))

(assert (= (and b!415141 res!241469) b!415144))

(assert (= (and b!415144 c!55019) b!415147))

(assert (= (and b!415144 (not c!55019)) b!415137))

(assert (= (or b!415147 b!415137) bm!28787))

(assert (= (or b!415147 b!415137) bm!28786))

(assert (= (and b!415144 (not res!241463)) b!415130))

(assert (= (and b!415145 condMapEmpty!17655) mapIsEmpty!17655))

(assert (= (and b!415145 (not condMapEmpty!17655)) mapNonEmpty!17655))

(get-info :version)

(assert (= (and mapNonEmpty!17655 ((_ is ValueCellFull!5001) mapValue!17655)) b!415136))

(assert (= (and b!415145 ((_ is ValueCellFull!5001) mapDefault!17655)) b!415132))

(assert (= start!39270 b!415145))

(declare-fun b_lambda!8841 () Bool)

(assert (=> (not b_lambda!8841) (not b!415130)))

(declare-fun t!12241 () Bool)

(declare-fun tb!3159 () Bool)

(assert (=> (and start!39270 (= defaultEntry!557 defaultEntry!557) t!12241) tb!3159))

(declare-fun result!5845 () Bool)

(assert (=> tb!3159 (= result!5845 tp_is_empty!10689)))

(assert (=> b!415130 t!12241))

(declare-fun b_and!16951 () Bool)

(assert (= b_and!16949 (and (=> t!12241 result!5845) b_and!16951)))

(declare-fun m!404291 () Bool)

(assert (=> b!415144 m!404291))

(assert (=> b!415144 m!404291))

(declare-fun m!404293 () Bool)

(assert (=> b!415144 m!404293))

(declare-fun m!404295 () Bool)

(assert (=> b!415144 m!404295))

(declare-fun m!404297 () Bool)

(assert (=> b!415146 m!404297))

(declare-fun m!404299 () Bool)

(assert (=> b!415129 m!404299))

(declare-fun m!404301 () Bool)

(assert (=> start!39270 m!404301))

(declare-fun m!404303 () Bool)

(assert (=> start!39270 m!404303))

(declare-fun m!404305 () Bool)

(assert (=> b!415147 m!404305))

(declare-fun m!404307 () Bool)

(assert (=> bm!28787 m!404307))

(declare-fun m!404309 () Bool)

(assert (=> b!415139 m!404309))

(declare-fun m!404311 () Bool)

(assert (=> b!415142 m!404311))

(declare-fun m!404313 () Bool)

(assert (=> b!415134 m!404313))

(declare-fun m!404315 () Bool)

(assert (=> b!415130 m!404315))

(declare-fun m!404317 () Bool)

(assert (=> b!415130 m!404317))

(declare-fun m!404319 () Bool)

(assert (=> b!415130 m!404319))

(declare-fun m!404321 () Bool)

(assert (=> b!415130 m!404321))

(assert (=> b!415130 m!404319))

(declare-fun m!404323 () Bool)

(assert (=> b!415130 m!404323))

(assert (=> b!415130 m!404317))

(assert (=> b!415130 m!404315))

(declare-fun m!404325 () Bool)

(assert (=> b!415130 m!404325))

(declare-fun m!404327 () Bool)

(assert (=> b!415135 m!404327))

(declare-fun m!404329 () Bool)

(assert (=> b!415140 m!404329))

(declare-fun m!404331 () Bool)

(assert (=> b!415140 m!404331))

(declare-fun m!404333 () Bool)

(assert (=> b!415138 m!404333))

(declare-fun m!404335 () Bool)

(assert (=> bm!28786 m!404335))

(declare-fun m!404337 () Bool)

(assert (=> mapNonEmpty!17655 m!404337))

(declare-fun m!404339 () Bool)

(assert (=> b!415141 m!404339))

(declare-fun m!404341 () Bool)

(assert (=> b!415141 m!404341))

(declare-fun m!404343 () Bool)

(assert (=> b!415141 m!404343))

(check-sat (not b!415144) (not b!415142) (not mapNonEmpty!17655) (not b!415135) b_and!16951 (not bm!28786) (not b!415141) (not b_lambda!8841) (not b!415147) (not b!415130) (not b!415139) (not b!415146) (not b!415140) (not b!415134) (not bm!28787) (not b_next!9537) (not start!39270) tp_is_empty!10689 (not b!415129))
(check-sat b_and!16951 (not b_next!9537))
