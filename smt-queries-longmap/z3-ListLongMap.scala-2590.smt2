; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39344 () Bool)

(assert start!39344)

(declare-fun b_free!9625 () Bool)

(declare-fun b_next!9625 () Bool)

(assert (=> start!39344 (= b_free!9625 (not b_next!9625))))

(declare-fun tp!34403 () Bool)

(declare-fun b_and!17139 () Bool)

(assert (=> start!39344 (= tp!34403 b_and!17139)))

(declare-fun b!417676 () Bool)

(declare-fun res!243311 () Bool)

(declare-fun e!249162 () Bool)

(assert (=> b!417676 (=> (not res!243311) (not e!249162))))

(declare-datatypes ((array!25412 0))(
  ( (array!25413 (arr!12155 (Array (_ BitVec 32) (_ BitVec 64))) (size!12507 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25412)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15475 0))(
  ( (V!15476 (val!5433 Int)) )
))
(declare-datatypes ((ValueCell!5045 0))(
  ( (ValueCellFull!5045 (v!7681 V!15475)) (EmptyCell!5045) )
))
(declare-datatypes ((array!25414 0))(
  ( (array!25415 (arr!12156 (Array (_ BitVec 32) ValueCell!5045)) (size!12508 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25414)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!417676 (= res!243311 (and (= (size!12508 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12507 _keys!709) (size!12508 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17787 () Bool)

(declare-fun mapRes!17787 () Bool)

(assert (=> mapIsEmpty!17787 mapRes!17787))

(declare-fun b!417677 () Bool)

(declare-fun res!243318 () Bool)

(assert (=> b!417677 (=> (not res!243318) (not e!249162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25412 (_ BitVec 32)) Bool)

(assert (=> b!417677 (= res!243318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!417679 () Bool)

(declare-fun res!243314 () Bool)

(assert (=> b!417679 (=> (not res!243314) (not e!249162))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!417679 (= res!243314 (or (= (select (arr!12155 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12155 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!417680 () Bool)

(declare-fun res!243310 () Bool)

(assert (=> b!417680 (=> (not res!243310) (not e!249162))))

(declare-datatypes ((List!6987 0))(
  ( (Nil!6984) (Cons!6983 (h!7839 (_ BitVec 64)) (t!12269 List!6987)) )
))
(declare-fun arrayNoDuplicates!0 (array!25412 (_ BitVec 32) List!6987) Bool)

(assert (=> b!417680 (= res!243310 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6984))))

(declare-fun b!417681 () Bool)

(declare-fun res!243315 () Bool)

(assert (=> b!417681 (=> (not res!243315) (not e!249162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!417681 (= res!243315 (validMask!0 mask!1025))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!6972 0))(
  ( (tuple2!6973 (_1!3497 (_ BitVec 64)) (_2!3497 V!15475)) )
))
(declare-datatypes ((List!6988 0))(
  ( (Nil!6985) (Cons!6984 (h!7840 tuple2!6972) (t!12270 List!6988)) )
))
(declare-datatypes ((ListLongMap!5887 0))(
  ( (ListLongMap!5888 (toList!2959 List!6988)) )
))
(declare-fun call!29041 () ListLongMap!5887)

(declare-fun minValue!515 () V!15475)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!191413 () array!25414)

(declare-fun zeroValue!515 () V!15475)

(declare-fun bm!29037 () Bool)

(declare-fun lt!191406 () array!25412)

(declare-fun getCurrentListMapNoExtraKeys!1205 (array!25412 array!25414 (_ BitVec 32) (_ BitVec 32) V!15475 V!15475 (_ BitVec 32) Int) ListLongMap!5887)

(assert (=> bm!29037 (= call!29041 (getCurrentListMapNoExtraKeys!1205 lt!191406 lt!191413 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29040 () ListLongMap!5887)

(declare-fun bm!29038 () Bool)

(assert (=> bm!29038 (= call!29040 (getCurrentListMapNoExtraKeys!1205 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417682 () Bool)

(declare-fun e!249163 () Bool)

(assert (=> b!417682 (= e!249163 true)))

(declare-fun lt!191411 () ListLongMap!5887)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!191410 () V!15475)

(declare-fun lt!191409 () tuple2!6972)

(declare-fun +!1228 (ListLongMap!5887 tuple2!6972) ListLongMap!5887)

(assert (=> b!417682 (= (+!1228 lt!191411 lt!191409) (+!1228 (+!1228 lt!191411 (tuple2!6973 k0!794 lt!191410)) lt!191409))))

(declare-fun lt!191412 () V!15475)

(assert (=> b!417682 (= lt!191409 (tuple2!6973 k0!794 lt!191412))))

(declare-datatypes ((Unit!12327 0))(
  ( (Unit!12328) )
))
(declare-fun lt!191415 () Unit!12327)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!19 (ListLongMap!5887 (_ BitVec 64) V!15475 V!15475) Unit!12327)

(assert (=> b!417682 (= lt!191415 (addSameAsAddTwiceSameKeyDiffValues!19 lt!191411 k0!794 lt!191410 lt!191412))))

(declare-fun lt!191408 () V!15475)

(declare-fun get!6015 (ValueCell!5045 V!15475) V!15475)

(assert (=> b!417682 (= lt!191410 (get!6015 (select (arr!12156 _values!549) from!863) lt!191408))))

(declare-fun lt!191414 () ListLongMap!5887)

(assert (=> b!417682 (= lt!191414 (+!1228 lt!191411 (tuple2!6973 (select (arr!12155 lt!191406) from!863) lt!191412)))))

(declare-fun v!412 () V!15475)

(assert (=> b!417682 (= lt!191412 (get!6015 (select (store (arr!12156 _values!549) i!563 (ValueCellFull!5045 v!412)) from!863) lt!191408))))

(declare-fun dynLambda!686 (Int (_ BitVec 64)) V!15475)

(assert (=> b!417682 (= lt!191408 (dynLambda!686 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!417682 (= lt!191411 (getCurrentListMapNoExtraKeys!1205 lt!191406 lt!191413 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417683 () Bool)

(declare-fun res!243307 () Bool)

(declare-fun e!249159 () Bool)

(assert (=> b!417683 (=> (not res!243307) (not e!249159))))

(assert (=> b!417683 (= res!243307 (arrayNoDuplicates!0 lt!191406 #b00000000000000000000000000000000 Nil!6984))))

(declare-fun mapNonEmpty!17787 () Bool)

(declare-fun tp!34404 () Bool)

(declare-fun e!249156 () Bool)

(assert (=> mapNonEmpty!17787 (= mapRes!17787 (and tp!34404 e!249156))))

(declare-fun mapValue!17787 () ValueCell!5045)

(declare-fun mapKey!17787 () (_ BitVec 32))

(declare-fun mapRest!17787 () (Array (_ BitVec 32) ValueCell!5045))

(assert (=> mapNonEmpty!17787 (= (arr!12156 _values!549) (store mapRest!17787 mapKey!17787 mapValue!17787))))

(declare-fun b!417684 () Bool)

(declare-fun res!243312 () Bool)

(assert (=> b!417684 (=> (not res!243312) (not e!249159))))

(assert (=> b!417684 (= res!243312 (bvsle from!863 i!563))))

(declare-fun b!417685 () Bool)

(assert (=> b!417685 (= e!249162 e!249159)))

(declare-fun res!243316 () Bool)

(assert (=> b!417685 (=> (not res!243316) (not e!249159))))

(assert (=> b!417685 (= res!243316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191406 mask!1025))))

(assert (=> b!417685 (= lt!191406 (array!25413 (store (arr!12155 _keys!709) i!563 k0!794) (size!12507 _keys!709)))))

(declare-fun res!243309 () Bool)

(assert (=> start!39344 (=> (not res!243309) (not e!249162))))

(assert (=> start!39344 (= res!243309 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12507 _keys!709))))))

(assert (=> start!39344 e!249162))

(declare-fun tp_is_empty!10777 () Bool)

(assert (=> start!39344 tp_is_empty!10777))

(assert (=> start!39344 tp!34403))

(assert (=> start!39344 true))

(declare-fun e!249161 () Bool)

(declare-fun array_inv!8940 (array!25414) Bool)

(assert (=> start!39344 (and (array_inv!8940 _values!549) e!249161)))

(declare-fun array_inv!8941 (array!25412) Bool)

(assert (=> start!39344 (array_inv!8941 _keys!709)))

(declare-fun b!417678 () Bool)

(declare-fun res!243308 () Bool)

(assert (=> b!417678 (=> (not res!243308) (not e!249162))))

(declare-fun arrayContainsKey!0 (array!25412 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!417678 (= res!243308 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!417686 () Bool)

(declare-fun e!249160 () Bool)

(assert (=> b!417686 (= e!249160 (= call!29041 call!29040))))

(declare-fun b!417687 () Bool)

(declare-fun res!243313 () Bool)

(assert (=> b!417687 (=> (not res!243313) (not e!249162))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!417687 (= res!243313 (validKeyInArray!0 k0!794))))

(declare-fun b!417688 () Bool)

(declare-fun e!249157 () Bool)

(assert (=> b!417688 (= e!249157 tp_is_empty!10777)))

(declare-fun b!417689 () Bool)

(declare-fun e!249155 () Bool)

(assert (=> b!417689 (= e!249155 (not e!249163))))

(declare-fun res!243306 () Bool)

(assert (=> b!417689 (=> res!243306 e!249163)))

(assert (=> b!417689 (= res!243306 (validKeyInArray!0 (select (arr!12155 _keys!709) from!863)))))

(assert (=> b!417689 e!249160))

(declare-fun c!55128 () Bool)

(assert (=> b!417689 (= c!55128 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!191407 () Unit!12327)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!427 (array!25412 array!25414 (_ BitVec 32) (_ BitVec 32) V!15475 V!15475 (_ BitVec 32) (_ BitVec 64) V!15475 (_ BitVec 32) Int) Unit!12327)

(assert (=> b!417689 (= lt!191407 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!427 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417690 () Bool)

(assert (=> b!417690 (= e!249159 e!249155)))

(declare-fun res!243317 () Bool)

(assert (=> b!417690 (=> (not res!243317) (not e!249155))))

(assert (=> b!417690 (= res!243317 (= from!863 i!563))))

(assert (=> b!417690 (= lt!191414 (getCurrentListMapNoExtraKeys!1205 lt!191406 lt!191413 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!417690 (= lt!191413 (array!25415 (store (arr!12156 _values!549) i!563 (ValueCellFull!5045 v!412)) (size!12508 _values!549)))))

(declare-fun lt!191405 () ListLongMap!5887)

(assert (=> b!417690 (= lt!191405 (getCurrentListMapNoExtraKeys!1205 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!417691 () Bool)

(assert (=> b!417691 (= e!249160 (= call!29041 (+!1228 call!29040 (tuple2!6973 k0!794 v!412))))))

(declare-fun b!417692 () Bool)

(declare-fun res!243305 () Bool)

(assert (=> b!417692 (=> (not res!243305) (not e!249162))))

(assert (=> b!417692 (= res!243305 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12507 _keys!709))))))

(declare-fun b!417693 () Bool)

(assert (=> b!417693 (= e!249156 tp_is_empty!10777)))

(declare-fun b!417694 () Bool)

(assert (=> b!417694 (= e!249161 (and e!249157 mapRes!17787))))

(declare-fun condMapEmpty!17787 () Bool)

(declare-fun mapDefault!17787 () ValueCell!5045)

(assert (=> b!417694 (= condMapEmpty!17787 (= (arr!12156 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5045)) mapDefault!17787)))))

(assert (= (and start!39344 res!243309) b!417681))

(assert (= (and b!417681 res!243315) b!417676))

(assert (= (and b!417676 res!243311) b!417677))

(assert (= (and b!417677 res!243318) b!417680))

(assert (= (and b!417680 res!243310) b!417692))

(assert (= (and b!417692 res!243305) b!417687))

(assert (= (and b!417687 res!243313) b!417679))

(assert (= (and b!417679 res!243314) b!417678))

(assert (= (and b!417678 res!243308) b!417685))

(assert (= (and b!417685 res!243316) b!417683))

(assert (= (and b!417683 res!243307) b!417684))

(assert (= (and b!417684 res!243312) b!417690))

(assert (= (and b!417690 res!243317) b!417689))

(assert (= (and b!417689 c!55128) b!417691))

(assert (= (and b!417689 (not c!55128)) b!417686))

(assert (= (or b!417691 b!417686) bm!29037))

(assert (= (or b!417691 b!417686) bm!29038))

(assert (= (and b!417689 (not res!243306)) b!417682))

(assert (= (and b!417694 condMapEmpty!17787) mapIsEmpty!17787))

(assert (= (and b!417694 (not condMapEmpty!17787)) mapNonEmpty!17787))

(get-info :version)

(assert (= (and mapNonEmpty!17787 ((_ is ValueCellFull!5045) mapValue!17787)) b!417693))

(assert (= (and b!417694 ((_ is ValueCellFull!5045) mapDefault!17787)) b!417688))

(assert (= start!39344 b!417694))

(declare-fun b_lambda!8951 () Bool)

(assert (=> (not b_lambda!8951) (not b!417682)))

(declare-fun t!12268 () Bool)

(declare-fun tb!3239 () Bool)

(assert (=> (and start!39344 (= defaultEntry!557 defaultEntry!557) t!12268) tb!3239))

(declare-fun result!6013 () Bool)

(assert (=> tb!3239 (= result!6013 tp_is_empty!10777)))

(assert (=> b!417682 t!12268))

(declare-fun b_and!17141 () Bool)

(assert (= b_and!17139 (and (=> t!12268 result!6013) b_and!17141)))

(declare-fun m!407255 () Bool)

(assert (=> b!417685 m!407255))

(declare-fun m!407257 () Bool)

(assert (=> b!417685 m!407257))

(declare-fun m!407259 () Bool)

(assert (=> b!417677 m!407259))

(declare-fun m!407261 () Bool)

(assert (=> b!417682 m!407261))

(declare-fun m!407263 () Bool)

(assert (=> b!417682 m!407263))

(declare-fun m!407265 () Bool)

(assert (=> b!417682 m!407265))

(declare-fun m!407267 () Bool)

(assert (=> b!417682 m!407267))

(declare-fun m!407269 () Bool)

(assert (=> b!417682 m!407269))

(declare-fun m!407271 () Bool)

(assert (=> b!417682 m!407271))

(declare-fun m!407273 () Bool)

(assert (=> b!417682 m!407273))

(assert (=> b!417682 m!407265))

(declare-fun m!407275 () Bool)

(assert (=> b!417682 m!407275))

(declare-fun m!407277 () Bool)

(assert (=> b!417682 m!407277))

(declare-fun m!407279 () Bool)

(assert (=> b!417682 m!407279))

(declare-fun m!407281 () Bool)

(assert (=> b!417682 m!407281))

(assert (=> b!417682 m!407267))

(declare-fun m!407283 () Bool)

(assert (=> b!417682 m!407283))

(assert (=> b!417682 m!407283))

(declare-fun m!407285 () Bool)

(assert (=> b!417682 m!407285))

(declare-fun m!407287 () Bool)

(assert (=> b!417679 m!407287))

(declare-fun m!407289 () Bool)

(assert (=> b!417681 m!407289))

(assert (=> bm!29037 m!407271))

(declare-fun m!407291 () Bool)

(assert (=> b!417683 m!407291))

(declare-fun m!407293 () Bool)

(assert (=> b!417691 m!407293))

(declare-fun m!407295 () Bool)

(assert (=> b!417690 m!407295))

(assert (=> b!417690 m!407279))

(declare-fun m!407297 () Bool)

(assert (=> b!417690 m!407297))

(declare-fun m!407299 () Bool)

(assert (=> mapNonEmpty!17787 m!407299))

(declare-fun m!407301 () Bool)

(assert (=> start!39344 m!407301))

(declare-fun m!407303 () Bool)

(assert (=> start!39344 m!407303))

(declare-fun m!407305 () Bool)

(assert (=> b!417689 m!407305))

(assert (=> b!417689 m!407305))

(declare-fun m!407307 () Bool)

(assert (=> b!417689 m!407307))

(declare-fun m!407309 () Bool)

(assert (=> b!417689 m!407309))

(declare-fun m!407311 () Bool)

(assert (=> bm!29038 m!407311))

(declare-fun m!407313 () Bool)

(assert (=> b!417680 m!407313))

(declare-fun m!407315 () Bool)

(assert (=> b!417687 m!407315))

(declare-fun m!407317 () Bool)

(assert (=> b!417678 m!407317))

(check-sat (not b!417691) (not mapNonEmpty!17787) b_and!17141 (not b!417687) (not b!417681) (not b_lambda!8951) (not b!417678) (not b!417682) (not b!417677) (not start!39344) (not bm!29038) (not b_next!9625) (not b!417690) (not b!417689) (not b!417680) (not b!417683) (not bm!29037) (not b!417685) tp_is_empty!10777)
(check-sat b_and!17141 (not b_next!9625))
