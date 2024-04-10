; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39402 () Bool)

(assert start!39402)

(declare-fun b_free!9669 () Bool)

(declare-fun b_next!9669 () Bool)

(assert (=> start!39402 (= b_free!9669 (not b_next!9669))))

(declare-fun tp!34535 () Bool)

(declare-fun b_and!17213 () Bool)

(assert (=> start!39402 (= tp!34535 b_and!17213)))

(declare-fun b!419024 () Bool)

(declare-fun e!249783 () Bool)

(declare-datatypes ((V!15533 0))(
  ( (V!15534 (val!5455 Int)) )
))
(declare-datatypes ((tuple2!7136 0))(
  ( (tuple2!7137 (_1!3579 (_ BitVec 64)) (_2!3579 V!15533)) )
))
(declare-datatypes ((List!7147 0))(
  ( (Nil!7144) (Cons!7143 (h!7999 tuple2!7136) (t!12481 List!7147)) )
))
(declare-datatypes ((ListLongMap!6049 0))(
  ( (ListLongMap!6050 (toList!3040 List!7147)) )
))
(declare-fun call!29185 () ListLongMap!6049)

(declare-fun call!29186 () ListLongMap!6049)

(assert (=> b!419024 (= e!249783 (= call!29185 call!29186))))

(declare-fun b!419025 () Bool)

(declare-fun res!244245 () Bool)

(declare-fun e!249784 () Bool)

(assert (=> b!419025 (=> (not res!244245) (not e!249784))))

(declare-datatypes ((array!25491 0))(
  ( (array!25492 (arr!12195 (Array (_ BitVec 32) (_ BitVec 64))) (size!12547 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25491)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5067 0))(
  ( (ValueCellFull!5067 (v!7702 V!15533)) (EmptyCell!5067) )
))
(declare-datatypes ((array!25493 0))(
  ( (array!25494 (arr!12196 (Array (_ BitVec 32) ValueCell!5067)) (size!12548 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25493)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!419025 (= res!244245 (and (= (size!12548 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12547 _keys!709) (size!12548 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17853 () Bool)

(declare-fun mapRes!17853 () Bool)

(assert (=> mapIsEmpty!17853 mapRes!17853))

(declare-fun b!419026 () Bool)

(declare-fun res!244242 () Bool)

(declare-fun e!249781 () Bool)

(assert (=> b!419026 (=> (not res!244242) (not e!249781))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419026 (= res!244242 (bvsle from!863 i!563))))

(declare-fun b!419027 () Bool)

(assert (=> b!419027 (= e!249784 e!249781)))

(declare-fun res!244234 () Bool)

(assert (=> b!419027 (=> (not res!244234) (not e!249781))))

(declare-fun lt!192113 () array!25491)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25491 (_ BitVec 32)) Bool)

(assert (=> b!419027 (= res!244234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192113 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!419027 (= lt!192113 (array!25492 (store (arr!12195 _keys!709) i!563 k0!794) (size!12547 _keys!709)))))

(declare-fun b!419028 () Bool)

(declare-fun e!249789 () Bool)

(declare-fun e!249787 () Bool)

(assert (=> b!419028 (= e!249789 (not e!249787))))

(declare-fun res!244241 () Bool)

(assert (=> b!419028 (=> res!244241 e!249787)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!419028 (= res!244241 (validKeyInArray!0 (select (arr!12195 _keys!709) from!863)))))

(assert (=> b!419028 e!249783))

(declare-fun c!55217 () Bool)

(assert (=> b!419028 (= c!55217 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15533)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15533)

(declare-fun v!412 () V!15533)

(declare-datatypes ((Unit!12382 0))(
  ( (Unit!12383) )
))
(declare-fun lt!192112 () Unit!12382)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!442 (array!25491 array!25493 (_ BitVec 32) (_ BitVec 32) V!15533 V!15533 (_ BitVec 32) (_ BitVec 64) V!15533 (_ BitVec 32) Int) Unit!12382)

(assert (=> b!419028 (= lt!192112 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!442 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419029 () Bool)

(declare-fun +!1238 (ListLongMap!6049 tuple2!7136) ListLongMap!6049)

(assert (=> b!419029 (= e!249783 (= call!29186 (+!1238 call!29185 (tuple2!7137 k0!794 v!412))))))

(declare-fun b!419030 () Bool)

(declare-fun res!244243 () Bool)

(assert (=> b!419030 (=> (not res!244243) (not e!249784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!419030 (= res!244243 (validMask!0 mask!1025))))

(declare-fun bm!29182 () Bool)

(declare-fun lt!192118 () array!25493)

(declare-fun getCurrentListMapNoExtraKeys!1245 (array!25491 array!25493 (_ BitVec 32) (_ BitVec 32) V!15533 V!15533 (_ BitVec 32) Int) ListLongMap!6049)

(assert (=> bm!29182 (= call!29186 (getCurrentListMapNoExtraKeys!1245 (ite c!55217 lt!192113 _keys!709) (ite c!55217 lt!192118 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419023 () Bool)

(declare-fun res!244232 () Bool)

(assert (=> b!419023 (=> (not res!244232) (not e!249784))))

(declare-fun arrayContainsKey!0 (array!25491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!419023 (= res!244232 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!244236 () Bool)

(assert (=> start!39402 (=> (not res!244236) (not e!249784))))

(assert (=> start!39402 (= res!244236 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12547 _keys!709))))))

(assert (=> start!39402 e!249784))

(declare-fun tp_is_empty!10821 () Bool)

(assert (=> start!39402 tp_is_empty!10821))

(assert (=> start!39402 tp!34535))

(assert (=> start!39402 true))

(declare-fun e!249785 () Bool)

(declare-fun array_inv!8892 (array!25493) Bool)

(assert (=> start!39402 (and (array_inv!8892 _values!549) e!249785)))

(declare-fun array_inv!8893 (array!25491) Bool)

(assert (=> start!39402 (array_inv!8893 _keys!709)))

(declare-fun b!419031 () Bool)

(declare-fun res!244244 () Bool)

(assert (=> b!419031 (=> (not res!244244) (not e!249784))))

(assert (=> b!419031 (= res!244244 (validKeyInArray!0 k0!794))))

(declare-fun b!419032 () Bool)

(declare-fun e!249782 () Bool)

(assert (=> b!419032 (= e!249782 tp_is_empty!10821)))

(declare-fun b!419033 () Bool)

(declare-fun res!244238 () Bool)

(assert (=> b!419033 (=> (not res!244238) (not e!249784))))

(assert (=> b!419033 (= res!244238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun bm!29183 () Bool)

(assert (=> bm!29183 (= call!29185 (getCurrentListMapNoExtraKeys!1245 (ite c!55217 _keys!709 lt!192113) (ite c!55217 _values!549 lt!192118) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419034 () Bool)

(declare-fun res!244240 () Bool)

(assert (=> b!419034 (=> (not res!244240) (not e!249781))))

(declare-datatypes ((List!7148 0))(
  ( (Nil!7145) (Cons!7144 (h!8000 (_ BitVec 64)) (t!12482 List!7148)) )
))
(declare-fun arrayNoDuplicates!0 (array!25491 (_ BitVec 32) List!7148) Bool)

(assert (=> b!419034 (= res!244240 (arrayNoDuplicates!0 lt!192113 #b00000000000000000000000000000000 Nil!7145))))

(declare-fun mapNonEmpty!17853 () Bool)

(declare-fun tp!34536 () Bool)

(assert (=> mapNonEmpty!17853 (= mapRes!17853 (and tp!34536 e!249782))))

(declare-fun mapKey!17853 () (_ BitVec 32))

(declare-fun mapRest!17853 () (Array (_ BitVec 32) ValueCell!5067))

(declare-fun mapValue!17853 () ValueCell!5067)

(assert (=> mapNonEmpty!17853 (= (arr!12196 _values!549) (store mapRest!17853 mapKey!17853 mapValue!17853))))

(declare-fun b!419035 () Bool)

(declare-fun e!249788 () Bool)

(assert (=> b!419035 (= e!249785 (and e!249788 mapRes!17853))))

(declare-fun condMapEmpty!17853 () Bool)

(declare-fun mapDefault!17853 () ValueCell!5067)

(assert (=> b!419035 (= condMapEmpty!17853 (= (arr!12196 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5067)) mapDefault!17853)))))

(declare-fun b!419036 () Bool)

(assert (=> b!419036 (= e!249787 true)))

(declare-fun lt!192116 () ListLongMap!6049)

(declare-fun lt!192114 () tuple2!7136)

(declare-fun lt!192115 () V!15533)

(assert (=> b!419036 (= (+!1238 lt!192116 lt!192114) (+!1238 (+!1238 lt!192116 (tuple2!7137 k0!794 lt!192115)) lt!192114))))

(declare-fun lt!192119 () V!15533)

(assert (=> b!419036 (= lt!192114 (tuple2!7137 k0!794 lt!192119))))

(declare-fun lt!192120 () Unit!12382)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!37 (ListLongMap!6049 (_ BitVec 64) V!15533 V!15533) Unit!12382)

(assert (=> b!419036 (= lt!192120 (addSameAsAddTwiceSameKeyDiffValues!37 lt!192116 k0!794 lt!192115 lt!192119))))

(declare-fun lt!192122 () V!15533)

(declare-fun get!6045 (ValueCell!5067 V!15533) V!15533)

(assert (=> b!419036 (= lt!192115 (get!6045 (select (arr!12196 _values!549) from!863) lt!192122))))

(declare-fun lt!192121 () ListLongMap!6049)

(assert (=> b!419036 (= lt!192121 (+!1238 lt!192116 (tuple2!7137 (select (arr!12195 lt!192113) from!863) lt!192119)))))

(assert (=> b!419036 (= lt!192119 (get!6045 (select (store (arr!12196 _values!549) i!563 (ValueCellFull!5067 v!412)) from!863) lt!192122))))

(declare-fun dynLambda!708 (Int (_ BitVec 64)) V!15533)

(assert (=> b!419036 (= lt!192122 (dynLambda!708 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!419036 (= lt!192116 (getCurrentListMapNoExtraKeys!1245 lt!192113 lt!192118 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419037 () Bool)

(declare-fun res!244233 () Bool)

(assert (=> b!419037 (=> (not res!244233) (not e!249784))))

(assert (=> b!419037 (= res!244233 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7145))))

(declare-fun b!419038 () Bool)

(assert (=> b!419038 (= e!249788 tp_is_empty!10821)))

(declare-fun b!419039 () Bool)

(declare-fun res!244235 () Bool)

(assert (=> b!419039 (=> (not res!244235) (not e!249784))))

(assert (=> b!419039 (= res!244235 (or (= (select (arr!12195 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12195 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!419040 () Bool)

(assert (=> b!419040 (= e!249781 e!249789)))

(declare-fun res!244237 () Bool)

(assert (=> b!419040 (=> (not res!244237) (not e!249789))))

(assert (=> b!419040 (= res!244237 (= from!863 i!563))))

(assert (=> b!419040 (= lt!192121 (getCurrentListMapNoExtraKeys!1245 lt!192113 lt!192118 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!419040 (= lt!192118 (array!25494 (store (arr!12196 _values!549) i!563 (ValueCellFull!5067 v!412)) (size!12548 _values!549)))))

(declare-fun lt!192117 () ListLongMap!6049)

(assert (=> b!419040 (= lt!192117 (getCurrentListMapNoExtraKeys!1245 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!419041 () Bool)

(declare-fun res!244239 () Bool)

(assert (=> b!419041 (=> (not res!244239) (not e!249784))))

(assert (=> b!419041 (= res!244239 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12547 _keys!709))))))

(assert (= (and start!39402 res!244236) b!419030))

(assert (= (and b!419030 res!244243) b!419025))

(assert (= (and b!419025 res!244245) b!419033))

(assert (= (and b!419033 res!244238) b!419037))

(assert (= (and b!419037 res!244233) b!419041))

(assert (= (and b!419041 res!244239) b!419031))

(assert (= (and b!419031 res!244244) b!419039))

(assert (= (and b!419039 res!244235) b!419023))

(assert (= (and b!419023 res!244232) b!419027))

(assert (= (and b!419027 res!244234) b!419034))

(assert (= (and b!419034 res!244240) b!419026))

(assert (= (and b!419026 res!244242) b!419040))

(assert (= (and b!419040 res!244237) b!419028))

(assert (= (and b!419028 c!55217) b!419029))

(assert (= (and b!419028 (not c!55217)) b!419024))

(assert (= (or b!419029 b!419024) bm!29182))

(assert (= (or b!419029 b!419024) bm!29183))

(assert (= (and b!419028 (not res!244241)) b!419036))

(assert (= (and b!419035 condMapEmpty!17853) mapIsEmpty!17853))

(assert (= (and b!419035 (not condMapEmpty!17853)) mapNonEmpty!17853))

(get-info :version)

(assert (= (and mapNonEmpty!17853 ((_ is ValueCellFull!5067) mapValue!17853)) b!419032))

(assert (= (and b!419035 ((_ is ValueCellFull!5067) mapDefault!17853)) b!419038))

(assert (= start!39402 b!419035))

(declare-fun b_lambda!8973 () Bool)

(assert (=> (not b_lambda!8973) (not b!419036)))

(declare-fun t!12480 () Bool)

(declare-fun tb!3291 () Bool)

(assert (=> (and start!39402 (= defaultEntry!557 defaultEntry!557) t!12480) tb!3291))

(declare-fun result!6109 () Bool)

(assert (=> tb!3291 (= result!6109 tp_is_empty!10821)))

(assert (=> b!419036 t!12480))

(declare-fun b_and!17215 () Bool)

(assert (= b_and!17213 (and (=> t!12480 result!6109) b_and!17215)))

(declare-fun m!408479 () Bool)

(assert (=> b!419027 m!408479))

(declare-fun m!408481 () Bool)

(assert (=> b!419027 m!408481))

(declare-fun m!408483 () Bool)

(assert (=> b!419034 m!408483))

(declare-fun m!408485 () Bool)

(assert (=> b!419023 m!408485))

(declare-fun m!408487 () Bool)

(assert (=> b!419031 m!408487))

(declare-fun m!408489 () Bool)

(assert (=> start!39402 m!408489))

(declare-fun m!408491 () Bool)

(assert (=> start!39402 m!408491))

(declare-fun m!408493 () Bool)

(assert (=> b!419028 m!408493))

(assert (=> b!419028 m!408493))

(declare-fun m!408495 () Bool)

(assert (=> b!419028 m!408495))

(declare-fun m!408497 () Bool)

(assert (=> b!419028 m!408497))

(declare-fun m!408499 () Bool)

(assert (=> bm!29183 m!408499))

(declare-fun m!408501 () Bool)

(assert (=> b!419029 m!408501))

(declare-fun m!408503 () Bool)

(assert (=> b!419036 m!408503))

(declare-fun m!408505 () Bool)

(assert (=> b!419036 m!408505))

(declare-fun m!408507 () Bool)

(assert (=> b!419036 m!408507))

(declare-fun m!408509 () Bool)

(assert (=> b!419036 m!408509))

(declare-fun m!408511 () Bool)

(assert (=> b!419036 m!408511))

(declare-fun m!408513 () Bool)

(assert (=> b!419036 m!408513))

(declare-fun m!408515 () Bool)

(assert (=> b!419036 m!408515))

(declare-fun m!408517 () Bool)

(assert (=> b!419036 m!408517))

(declare-fun m!408519 () Bool)

(assert (=> b!419036 m!408519))

(declare-fun m!408521 () Bool)

(assert (=> b!419036 m!408521))

(assert (=> b!419036 m!408505))

(declare-fun m!408523 () Bool)

(assert (=> b!419036 m!408523))

(assert (=> b!419036 m!408517))

(declare-fun m!408525 () Bool)

(assert (=> b!419036 m!408525))

(assert (=> b!419036 m!408509))

(declare-fun m!408527 () Bool)

(assert (=> b!419036 m!408527))

(declare-fun m!408529 () Bool)

(assert (=> b!419037 m!408529))

(declare-fun m!408531 () Bool)

(assert (=> mapNonEmpty!17853 m!408531))

(declare-fun m!408533 () Bool)

(assert (=> b!419033 m!408533))

(declare-fun m!408535 () Bool)

(assert (=> bm!29182 m!408535))

(declare-fun m!408537 () Bool)

(assert (=> b!419030 m!408537))

(declare-fun m!408539 () Bool)

(assert (=> b!419040 m!408539))

(assert (=> b!419040 m!408515))

(declare-fun m!408541 () Bool)

(assert (=> b!419040 m!408541))

(declare-fun m!408543 () Bool)

(assert (=> b!419039 m!408543))

(check-sat (not start!39402) (not bm!29183) (not b!419040) (not bm!29182) (not b!419027) (not b!419033) (not b!419031) (not b!419023) tp_is_empty!10821 (not b!419037) (not b!419030) (not b_next!9669) (not b!419029) (not mapNonEmpty!17853) b_and!17215 (not b!419028) (not b_lambda!8973) (not b!419036) (not b!419034))
(check-sat b_and!17215 (not b_next!9669))
