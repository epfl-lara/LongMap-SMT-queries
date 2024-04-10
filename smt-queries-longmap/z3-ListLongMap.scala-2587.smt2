; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39342 () Bool)

(assert start!39342)

(declare-fun b_free!9609 () Bool)

(declare-fun b_next!9609 () Bool)

(assert (=> start!39342 (= b_free!9609 (not b_next!9609))))

(declare-fun tp!34355 () Bool)

(declare-fun b_and!17093 () Bool)

(assert (=> start!39342 (= tp!34355 b_and!17093)))

(declare-fun b!417253 () Bool)

(declare-fun res!242985 () Bool)

(declare-fun e!248976 () Bool)

(assert (=> b!417253 (=> (not res!242985) (not e!248976))))

(declare-datatypes ((array!25375 0))(
  ( (array!25376 (arr!12137 (Array (_ BitVec 32) (_ BitVec 64))) (size!12489 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25375)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25375 (_ BitVec 32)) Bool)

(assert (=> b!417253 (= res!242985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!417254 () Bool)

(declare-fun res!242978 () Bool)

(assert (=> b!417254 (=> (not res!242978) (not e!248976))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!417254 (= res!242978 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12489 _keys!709))))))

(declare-fun b!417255 () Bool)

(declare-fun e!248972 () Bool)

(declare-datatypes ((V!15453 0))(
  ( (V!15454 (val!5425 Int)) )
))
(declare-datatypes ((tuple2!7082 0))(
  ( (tuple2!7083 (_1!3552 (_ BitVec 64)) (_2!3552 V!15453)) )
))
(declare-datatypes ((List!7100 0))(
  ( (Nil!7097) (Cons!7096 (h!7952 tuple2!7082) (t!12374 List!7100)) )
))
(declare-datatypes ((ListLongMap!5995 0))(
  ( (ListLongMap!5996 (toList!3013 List!7100)) )
))
(declare-fun call!29005 () ListLongMap!5995)

(declare-fun call!29006 () ListLongMap!5995)

(assert (=> b!417255 (= e!248972 (= call!29005 call!29006))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!55127 () Bool)

(declare-datatypes ((ValueCell!5037 0))(
  ( (ValueCellFull!5037 (v!7672 V!15453)) (EmptyCell!5037) )
))
(declare-datatypes ((array!25377 0))(
  ( (array!25378 (arr!12138 (Array (_ BitVec 32) ValueCell!5037)) (size!12490 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25377)

(declare-fun zeroValue!515 () V!15453)

(declare-fun bm!29002 () Bool)

(declare-fun lt!191128 () array!25375)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!191129 () array!25377)

(declare-fun minValue!515 () V!15453)

(declare-fun getCurrentListMapNoExtraKeys!1218 (array!25375 array!25377 (_ BitVec 32) (_ BitVec 32) V!15453 V!15453 (_ BitVec 32) Int) ListLongMap!5995)

(assert (=> bm!29002 (= call!29005 (getCurrentListMapNoExtraKeys!1218 (ite c!55127 _keys!709 lt!191128) (ite c!55127 _values!549 lt!191129) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17763 () Bool)

(declare-fun mapRes!17763 () Bool)

(declare-fun tp!34356 () Bool)

(declare-fun e!248977 () Bool)

(assert (=> mapNonEmpty!17763 (= mapRes!17763 (and tp!34356 e!248977))))

(declare-fun mapRest!17763 () (Array (_ BitVec 32) ValueCell!5037))

(declare-fun mapValue!17763 () ValueCell!5037)

(declare-fun mapKey!17763 () (_ BitVec 32))

(assert (=> mapNonEmpty!17763 (= (arr!12138 _values!549) (store mapRest!17763 mapKey!17763 mapValue!17763))))

(declare-fun b!417256 () Bool)

(declare-fun res!242977 () Bool)

(assert (=> b!417256 (=> (not res!242977) (not e!248976))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!417256 (= res!242977 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!417257 () Bool)

(declare-fun e!248978 () Bool)

(declare-fun tp_is_empty!10761 () Bool)

(assert (=> b!417257 (= e!248978 tp_is_empty!10761)))

(declare-fun b!417258 () Bool)

(declare-fun e!248974 () Bool)

(assert (=> b!417258 (= e!248976 e!248974)))

(declare-fun res!242973 () Bool)

(assert (=> b!417258 (=> (not res!242973) (not e!248974))))

(assert (=> b!417258 (= res!242973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191128 mask!1025))))

(assert (=> b!417258 (= lt!191128 (array!25376 (store (arr!12137 _keys!709) i!563 k0!794) (size!12489 _keys!709)))))

(declare-fun b!417259 () Bool)

(declare-fun res!242979 () Bool)

(assert (=> b!417259 (=> (not res!242979) (not e!248976))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!417259 (= res!242979 (validKeyInArray!0 k0!794))))

(declare-fun res!242976 () Bool)

(assert (=> start!39342 (=> (not res!242976) (not e!248976))))

(assert (=> start!39342 (= res!242976 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12489 _keys!709))))))

(assert (=> start!39342 e!248976))

(assert (=> start!39342 tp_is_empty!10761))

(assert (=> start!39342 tp!34355))

(assert (=> start!39342 true))

(declare-fun e!248973 () Bool)

(declare-fun array_inv!8852 (array!25377) Bool)

(assert (=> start!39342 (and (array_inv!8852 _values!549) e!248973)))

(declare-fun array_inv!8853 (array!25375) Bool)

(assert (=> start!39342 (array_inv!8853 _keys!709)))

(declare-fun b!417260 () Bool)

(declare-fun v!412 () V!15453)

(declare-fun +!1215 (ListLongMap!5995 tuple2!7082) ListLongMap!5995)

(assert (=> b!417260 (= e!248972 (= call!29006 (+!1215 call!29005 (tuple2!7083 k0!794 v!412))))))

(declare-fun b!417261 () Bool)

(declare-fun res!242980 () Bool)

(assert (=> b!417261 (=> (not res!242980) (not e!248976))))

(assert (=> b!417261 (= res!242980 (or (= (select (arr!12137 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12137 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!417262 () Bool)

(declare-fun res!242974 () Bool)

(assert (=> b!417262 (=> (not res!242974) (not e!248976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!417262 (= res!242974 (validMask!0 mask!1025))))

(declare-fun b!417263 () Bool)

(assert (=> b!417263 (= e!248973 (and e!248978 mapRes!17763))))

(declare-fun condMapEmpty!17763 () Bool)

(declare-fun mapDefault!17763 () ValueCell!5037)

(assert (=> b!417263 (= condMapEmpty!17763 (= (arr!12138 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5037)) mapDefault!17763)))))

(declare-fun b!417264 () Bool)

(declare-fun res!242972 () Bool)

(assert (=> b!417264 (=> (not res!242972) (not e!248976))))

(declare-datatypes ((List!7101 0))(
  ( (Nil!7098) (Cons!7097 (h!7953 (_ BitVec 64)) (t!12375 List!7101)) )
))
(declare-fun arrayNoDuplicates!0 (array!25375 (_ BitVec 32) List!7101) Bool)

(assert (=> b!417264 (= res!242972 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7098))))

(declare-fun b!417265 () Bool)

(declare-fun res!242984 () Bool)

(assert (=> b!417265 (=> (not res!242984) (not e!248974))))

(assert (=> b!417265 (= res!242984 (arrayNoDuplicates!0 lt!191128 #b00000000000000000000000000000000 Nil!7098))))

(declare-fun b!417266 () Bool)

(declare-fun res!242981 () Bool)

(assert (=> b!417266 (=> (not res!242981) (not e!248976))))

(assert (=> b!417266 (= res!242981 (and (= (size!12490 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12489 _keys!709) (size!12490 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17763 () Bool)

(assert (=> mapIsEmpty!17763 mapRes!17763))

(declare-fun b!417267 () Bool)

(declare-fun e!248975 () Bool)

(declare-fun e!248979 () Bool)

(assert (=> b!417267 (= e!248975 (not e!248979))))

(declare-fun res!242983 () Bool)

(assert (=> b!417267 (=> res!242983 e!248979)))

(assert (=> b!417267 (= res!242983 (validKeyInArray!0 (select (arr!12137 _keys!709) from!863)))))

(assert (=> b!417267 e!248972))

(assert (=> b!417267 (= c!55127 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12332 0))(
  ( (Unit!12333) )
))
(declare-fun lt!191127 () Unit!12332)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!422 (array!25375 array!25377 (_ BitVec 32) (_ BitVec 32) V!15453 V!15453 (_ BitVec 32) (_ BitVec 64) V!15453 (_ BitVec 32) Int) Unit!12332)

(assert (=> b!417267 (= lt!191127 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!422 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417268 () Bool)

(assert (=> b!417268 (= e!248977 tp_is_empty!10761)))

(declare-fun b!417269 () Bool)

(assert (=> b!417269 (= e!248974 e!248975)))

(declare-fun res!242982 () Bool)

(assert (=> b!417269 (=> (not res!242982) (not e!248975))))

(assert (=> b!417269 (= res!242982 (= from!863 i!563))))

(declare-fun lt!191126 () ListLongMap!5995)

(assert (=> b!417269 (= lt!191126 (getCurrentListMapNoExtraKeys!1218 lt!191128 lt!191129 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!417269 (= lt!191129 (array!25378 (store (arr!12138 _values!549) i!563 (ValueCellFull!5037 v!412)) (size!12490 _values!549)))))

(declare-fun lt!191123 () ListLongMap!5995)

(assert (=> b!417269 (= lt!191123 (getCurrentListMapNoExtraKeys!1218 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun bm!29003 () Bool)

(assert (=> bm!29003 (= call!29006 (getCurrentListMapNoExtraKeys!1218 (ite c!55127 lt!191128 _keys!709) (ite c!55127 lt!191129 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417270 () Bool)

(declare-fun res!242975 () Bool)

(assert (=> b!417270 (=> (not res!242975) (not e!248974))))

(assert (=> b!417270 (= res!242975 (bvsle from!863 i!563))))

(declare-fun b!417271 () Bool)

(assert (=> b!417271 (= e!248979 true)))

(declare-fun lt!191122 () tuple2!7082)

(declare-fun lt!191125 () ListLongMap!5995)

(declare-fun lt!191131 () V!15453)

(assert (=> b!417271 (= (+!1215 lt!191125 lt!191122) (+!1215 (+!1215 lt!191125 (tuple2!7083 k0!794 lt!191131)) lt!191122))))

(declare-fun lt!191124 () V!15453)

(assert (=> b!417271 (= lt!191122 (tuple2!7083 k0!794 lt!191124))))

(declare-fun lt!191132 () Unit!12332)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!16 (ListLongMap!5995 (_ BitVec 64) V!15453 V!15453) Unit!12332)

(assert (=> b!417271 (= lt!191132 (addSameAsAddTwiceSameKeyDiffValues!16 lt!191125 k0!794 lt!191131 lt!191124))))

(declare-fun lt!191130 () V!15453)

(declare-fun get!6004 (ValueCell!5037 V!15453) V!15453)

(assert (=> b!417271 (= lt!191131 (get!6004 (select (arr!12138 _values!549) from!863) lt!191130))))

(assert (=> b!417271 (= lt!191126 (+!1215 lt!191125 (tuple2!7083 (select (arr!12137 lt!191128) from!863) lt!191124)))))

(assert (=> b!417271 (= lt!191124 (get!6004 (select (store (arr!12138 _values!549) i!563 (ValueCellFull!5037 v!412)) from!863) lt!191130))))

(declare-fun dynLambda!687 (Int (_ BitVec 64)) V!15453)

(assert (=> b!417271 (= lt!191130 (dynLambda!687 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!417271 (= lt!191125 (getCurrentListMapNoExtraKeys!1218 lt!191128 lt!191129 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39342 res!242976) b!417262))

(assert (= (and b!417262 res!242974) b!417266))

(assert (= (and b!417266 res!242981) b!417253))

(assert (= (and b!417253 res!242985) b!417264))

(assert (= (and b!417264 res!242972) b!417254))

(assert (= (and b!417254 res!242978) b!417259))

(assert (= (and b!417259 res!242979) b!417261))

(assert (= (and b!417261 res!242980) b!417256))

(assert (= (and b!417256 res!242977) b!417258))

(assert (= (and b!417258 res!242973) b!417265))

(assert (= (and b!417265 res!242984) b!417270))

(assert (= (and b!417270 res!242975) b!417269))

(assert (= (and b!417269 res!242982) b!417267))

(assert (= (and b!417267 c!55127) b!417260))

(assert (= (and b!417267 (not c!55127)) b!417255))

(assert (= (or b!417260 b!417255) bm!29003))

(assert (= (or b!417260 b!417255) bm!29002))

(assert (= (and b!417267 (not res!242983)) b!417271))

(assert (= (and b!417263 condMapEmpty!17763) mapIsEmpty!17763))

(assert (= (and b!417263 (not condMapEmpty!17763)) mapNonEmpty!17763))

(get-info :version)

(assert (= (and mapNonEmpty!17763 ((_ is ValueCellFull!5037) mapValue!17763)) b!417268))

(assert (= (and b!417263 ((_ is ValueCellFull!5037) mapDefault!17763)) b!417257))

(assert (= start!39342 b!417263))

(declare-fun b_lambda!8913 () Bool)

(assert (=> (not b_lambda!8913) (not b!417271)))

(declare-fun t!12373 () Bool)

(declare-fun tb!3231 () Bool)

(assert (=> (and start!39342 (= defaultEntry!557 defaultEntry!557) t!12373) tb!3231))

(declare-fun result!5989 () Bool)

(assert (=> tb!3231 (= result!5989 tp_is_empty!10761)))

(assert (=> b!417271 t!12373))

(declare-fun b_and!17095 () Bool)

(assert (= b_and!17093 (and (=> t!12373 result!5989) b_and!17095)))

(declare-fun m!406499 () Bool)

(assert (=> b!417260 m!406499))

(declare-fun m!406501 () Bool)

(assert (=> b!417259 m!406501))

(declare-fun m!406503 () Bool)

(assert (=> b!417256 m!406503))

(declare-fun m!406505 () Bool)

(assert (=> b!417261 m!406505))

(declare-fun m!406507 () Bool)

(assert (=> bm!29003 m!406507))

(declare-fun m!406509 () Bool)

(assert (=> mapNonEmpty!17763 m!406509))

(declare-fun m!406511 () Bool)

(assert (=> b!417267 m!406511))

(assert (=> b!417267 m!406511))

(declare-fun m!406513 () Bool)

(assert (=> b!417267 m!406513))

(declare-fun m!406515 () Bool)

(assert (=> b!417267 m!406515))

(declare-fun m!406517 () Bool)

(assert (=> bm!29002 m!406517))

(declare-fun m!406519 () Bool)

(assert (=> b!417264 m!406519))

(declare-fun m!406521 () Bool)

(assert (=> b!417271 m!406521))

(declare-fun m!406523 () Bool)

(assert (=> b!417271 m!406523))

(declare-fun m!406525 () Bool)

(assert (=> b!417271 m!406525))

(declare-fun m!406527 () Bool)

(assert (=> b!417271 m!406527))

(declare-fun m!406529 () Bool)

(assert (=> b!417271 m!406529))

(declare-fun m!406531 () Bool)

(assert (=> b!417271 m!406531))

(declare-fun m!406533 () Bool)

(assert (=> b!417271 m!406533))

(declare-fun m!406535 () Bool)

(assert (=> b!417271 m!406535))

(declare-fun m!406537 () Bool)

(assert (=> b!417271 m!406537))

(assert (=> b!417271 m!406531))

(declare-fun m!406539 () Bool)

(assert (=> b!417271 m!406539))

(assert (=> b!417271 m!406537))

(declare-fun m!406541 () Bool)

(assert (=> b!417271 m!406541))

(declare-fun m!406543 () Bool)

(assert (=> b!417271 m!406543))

(declare-fun m!406545 () Bool)

(assert (=> b!417271 m!406545))

(assert (=> b!417271 m!406521))

(declare-fun m!406547 () Bool)

(assert (=> b!417262 m!406547))

(declare-fun m!406549 () Bool)

(assert (=> b!417265 m!406549))

(declare-fun m!406551 () Bool)

(assert (=> b!417258 m!406551))

(declare-fun m!406553 () Bool)

(assert (=> b!417258 m!406553))

(declare-fun m!406555 () Bool)

(assert (=> b!417269 m!406555))

(assert (=> b!417269 m!406545))

(declare-fun m!406557 () Bool)

(assert (=> b!417269 m!406557))

(declare-fun m!406559 () Bool)

(assert (=> b!417253 m!406559))

(declare-fun m!406561 () Bool)

(assert (=> start!39342 m!406561))

(declare-fun m!406563 () Bool)

(assert (=> start!39342 m!406563))

(check-sat (not bm!29002) (not b!417253) (not b!417269) (not start!39342) (not b_lambda!8913) (not b_next!9609) b_and!17095 (not b!417256) (not b!417265) (not bm!29003) (not b!417264) (not b!417267) (not b!417260) tp_is_empty!10761 (not b!417259) (not mapNonEmpty!17763) (not b!417258) (not b!417271) (not b!417262))
(check-sat b_and!17095 (not b_next!9609))
