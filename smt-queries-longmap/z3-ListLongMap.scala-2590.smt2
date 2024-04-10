; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39360 () Bool)

(assert start!39360)

(declare-fun b_free!9627 () Bool)

(declare-fun b_next!9627 () Bool)

(assert (=> start!39360 (= b_free!9627 (not b_next!9627))))

(declare-fun tp!34410 () Bool)

(declare-fun b_and!17129 () Bool)

(assert (=> start!39360 (= tp!34410 b_and!17129)))

(declare-fun b!417784 () Bool)

(declare-fun e!249219 () Bool)

(declare-fun e!249218 () Bool)

(assert (=> b!417784 (= e!249219 (not e!249218))))

(declare-fun res!243360 () Bool)

(assert (=> b!417784 (=> res!243360 e!249218)))

(declare-datatypes ((array!25409 0))(
  ( (array!25410 (arr!12154 (Array (_ BitVec 32) (_ BitVec 64))) (size!12506 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25409)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!417784 (= res!243360 (validKeyInArray!0 (select (arr!12154 _keys!709) from!863)))))

(declare-fun e!249215 () Bool)

(assert (=> b!417784 e!249215))

(declare-fun c!55154 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!417784 (= c!55154 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!15477 0))(
  ( (V!15478 (val!5434 Int)) )
))
(declare-fun minValue!515 () V!15477)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15477)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12346 0))(
  ( (Unit!12347) )
))
(declare-fun lt!191423 () Unit!12346)

(declare-fun v!412 () V!15477)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5046 0))(
  ( (ValueCellFull!5046 (v!7681 V!15477)) (EmptyCell!5046) )
))
(declare-datatypes ((array!25411 0))(
  ( (array!25412 (arr!12155 (Array (_ BitVec 32) ValueCell!5046)) (size!12507 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25411)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!428 (array!25409 array!25411 (_ BitVec 32) (_ BitVec 32) V!15477 V!15477 (_ BitVec 32) (_ BitVec 64) V!15477 (_ BitVec 32) Int) Unit!12346)

(assert (=> b!417784 (= lt!191423 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!428 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417785 () Bool)

(declare-fun res!243362 () Bool)

(declare-fun e!249221 () Bool)

(assert (=> b!417785 (=> (not res!243362) (not e!249221))))

(declare-fun lt!191425 () array!25409)

(declare-datatypes ((List!7114 0))(
  ( (Nil!7111) (Cons!7110 (h!7966 (_ BitVec 64)) (t!12406 List!7114)) )
))
(declare-fun arrayNoDuplicates!0 (array!25409 (_ BitVec 32) List!7114) Bool)

(assert (=> b!417785 (= res!243362 (arrayNoDuplicates!0 lt!191425 #b00000000000000000000000000000000 Nil!7111))))

(declare-fun b!417786 () Bool)

(declare-fun res!243356 () Bool)

(declare-fun e!249220 () Bool)

(assert (=> b!417786 (=> (not res!243356) (not e!249220))))

(assert (=> b!417786 (= res!243356 (validKeyInArray!0 k0!794))))

(declare-datatypes ((tuple2!7098 0))(
  ( (tuple2!7099 (_1!3560 (_ BitVec 64)) (_2!3560 V!15477)) )
))
(declare-datatypes ((List!7115 0))(
  ( (Nil!7112) (Cons!7111 (h!7967 tuple2!7098) (t!12407 List!7115)) )
))
(declare-datatypes ((ListLongMap!6011 0))(
  ( (ListLongMap!6012 (toList!3021 List!7115)) )
))
(declare-fun call!29059 () ListLongMap!6011)

(declare-fun b!417787 () Bool)

(declare-fun call!29060 () ListLongMap!6011)

(declare-fun +!1221 (ListLongMap!6011 tuple2!7098) ListLongMap!6011)

(assert (=> b!417787 (= e!249215 (= call!29059 (+!1221 call!29060 (tuple2!7099 k0!794 v!412))))))

(declare-fun mapNonEmpty!17790 () Bool)

(declare-fun mapRes!17790 () Bool)

(declare-fun tp!34409 () Bool)

(declare-fun e!249217 () Bool)

(assert (=> mapNonEmpty!17790 (= mapRes!17790 (and tp!34409 e!249217))))

(declare-fun mapRest!17790 () (Array (_ BitVec 32) ValueCell!5046))

(declare-fun mapValue!17790 () ValueCell!5046)

(declare-fun mapKey!17790 () (_ BitVec 32))

(assert (=> mapNonEmpty!17790 (= (arr!12155 _values!549) (store mapRest!17790 mapKey!17790 mapValue!17790))))

(declare-fun res!243350 () Bool)

(assert (=> start!39360 (=> (not res!243350) (not e!249220))))

(assert (=> start!39360 (= res!243350 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12506 _keys!709))))))

(assert (=> start!39360 e!249220))

(declare-fun tp_is_empty!10779 () Bool)

(assert (=> start!39360 tp_is_empty!10779))

(assert (=> start!39360 tp!34410))

(assert (=> start!39360 true))

(declare-fun e!249222 () Bool)

(declare-fun array_inv!8860 (array!25411) Bool)

(assert (=> start!39360 (and (array_inv!8860 _values!549) e!249222)))

(declare-fun array_inv!8861 (array!25409) Bool)

(assert (=> start!39360 (array_inv!8861 _keys!709)))

(declare-fun b!417788 () Bool)

(declare-fun res!243361 () Bool)

(assert (=> b!417788 (=> (not res!243361) (not e!249220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25409 (_ BitVec 32)) Bool)

(assert (=> b!417788 (= res!243361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!417789 () Bool)

(declare-fun e!249216 () Bool)

(assert (=> b!417789 (= e!249222 (and e!249216 mapRes!17790))))

(declare-fun condMapEmpty!17790 () Bool)

(declare-fun mapDefault!17790 () ValueCell!5046)

(assert (=> b!417789 (= condMapEmpty!17790 (= (arr!12155 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5046)) mapDefault!17790)))))

(declare-fun b!417790 () Bool)

(assert (=> b!417790 (= e!249218 true)))

(declare-fun lt!191420 () ListLongMap!6011)

(declare-fun lt!191422 () V!15477)

(declare-fun lt!191421 () tuple2!7098)

(assert (=> b!417790 (= (+!1221 lt!191420 lt!191421) (+!1221 (+!1221 lt!191420 (tuple2!7099 k0!794 lt!191422)) lt!191421))))

(declare-fun lt!191424 () V!15477)

(assert (=> b!417790 (= lt!191421 (tuple2!7099 k0!794 lt!191424))))

(declare-fun lt!191419 () Unit!12346)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!21 (ListLongMap!6011 (_ BitVec 64) V!15477 V!15477) Unit!12346)

(assert (=> b!417790 (= lt!191419 (addSameAsAddTwiceSameKeyDiffValues!21 lt!191420 k0!794 lt!191422 lt!191424))))

(declare-fun lt!191426 () V!15477)

(declare-fun get!6015 (ValueCell!5046 V!15477) V!15477)

(assert (=> b!417790 (= lt!191422 (get!6015 (select (arr!12155 _values!549) from!863) lt!191426))))

(declare-fun lt!191429 () ListLongMap!6011)

(assert (=> b!417790 (= lt!191429 (+!1221 lt!191420 (tuple2!7099 (select (arr!12154 lt!191425) from!863) lt!191424)))))

(assert (=> b!417790 (= lt!191424 (get!6015 (select (store (arr!12155 _values!549) i!563 (ValueCellFull!5046 v!412)) from!863) lt!191426))))

(declare-fun dynLambda!692 (Int (_ BitVec 64)) V!15477)

(assert (=> b!417790 (= lt!191426 (dynLambda!692 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!191428 () array!25411)

(declare-fun getCurrentListMapNoExtraKeys!1226 (array!25409 array!25411 (_ BitVec 32) (_ BitVec 32) V!15477 V!15477 (_ BitVec 32) Int) ListLongMap!6011)

(assert (=> b!417790 (= lt!191420 (getCurrentListMapNoExtraKeys!1226 lt!191425 lt!191428 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417791 () Bool)

(assert (=> b!417791 (= e!249215 (= call!29060 call!29059))))

(declare-fun bm!29056 () Bool)

(assert (=> bm!29056 (= call!29060 (getCurrentListMapNoExtraKeys!1226 (ite c!55154 _keys!709 lt!191425) (ite c!55154 _values!549 lt!191428) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417792 () Bool)

(declare-fun res!243351 () Bool)

(assert (=> b!417792 (=> (not res!243351) (not e!249220))))

(assert (=> b!417792 (= res!243351 (and (= (size!12507 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12506 _keys!709) (size!12507 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17790 () Bool)

(assert (=> mapIsEmpty!17790 mapRes!17790))

(declare-fun b!417793 () Bool)

(declare-fun res!243353 () Bool)

(assert (=> b!417793 (=> (not res!243353) (not e!249220))))

(assert (=> b!417793 (= res!243353 (or (= (select (arr!12154 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12154 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!417794 () Bool)

(declare-fun res!243354 () Bool)

(assert (=> b!417794 (=> (not res!243354) (not e!249220))))

(declare-fun arrayContainsKey!0 (array!25409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!417794 (= res!243354 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!417795 () Bool)

(assert (=> b!417795 (= e!249217 tp_is_empty!10779)))

(declare-fun b!417796 () Bool)

(assert (=> b!417796 (= e!249220 e!249221)))

(declare-fun res!243357 () Bool)

(assert (=> b!417796 (=> (not res!243357) (not e!249221))))

(assert (=> b!417796 (= res!243357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191425 mask!1025))))

(assert (=> b!417796 (= lt!191425 (array!25410 (store (arr!12154 _keys!709) i!563 k0!794) (size!12506 _keys!709)))))

(declare-fun b!417797 () Bool)

(assert (=> b!417797 (= e!249216 tp_is_empty!10779)))

(declare-fun b!417798 () Bool)

(assert (=> b!417798 (= e!249221 e!249219)))

(declare-fun res!243352 () Bool)

(assert (=> b!417798 (=> (not res!243352) (not e!249219))))

(assert (=> b!417798 (= res!243352 (= from!863 i!563))))

(assert (=> b!417798 (= lt!191429 (getCurrentListMapNoExtraKeys!1226 lt!191425 lt!191428 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!417798 (= lt!191428 (array!25412 (store (arr!12155 _values!549) i!563 (ValueCellFull!5046 v!412)) (size!12507 _values!549)))))

(declare-fun lt!191427 () ListLongMap!6011)

(assert (=> b!417798 (= lt!191427 (getCurrentListMapNoExtraKeys!1226 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!417799 () Bool)

(declare-fun res!243358 () Bool)

(assert (=> b!417799 (=> (not res!243358) (not e!249220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!417799 (= res!243358 (validMask!0 mask!1025))))

(declare-fun b!417800 () Bool)

(declare-fun res!243359 () Bool)

(assert (=> b!417800 (=> (not res!243359) (not e!249220))))

(assert (=> b!417800 (= res!243359 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12506 _keys!709))))))

(declare-fun bm!29057 () Bool)

(assert (=> bm!29057 (= call!29059 (getCurrentListMapNoExtraKeys!1226 (ite c!55154 lt!191425 _keys!709) (ite c!55154 lt!191428 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417801 () Bool)

(declare-fun res!243355 () Bool)

(assert (=> b!417801 (=> (not res!243355) (not e!249220))))

(assert (=> b!417801 (= res!243355 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7111))))

(declare-fun b!417802 () Bool)

(declare-fun res!243363 () Bool)

(assert (=> b!417802 (=> (not res!243363) (not e!249221))))

(assert (=> b!417802 (= res!243363 (bvsle from!863 i!563))))

(assert (= (and start!39360 res!243350) b!417799))

(assert (= (and b!417799 res!243358) b!417792))

(assert (= (and b!417792 res!243351) b!417788))

(assert (= (and b!417788 res!243361) b!417801))

(assert (= (and b!417801 res!243355) b!417800))

(assert (= (and b!417800 res!243359) b!417786))

(assert (= (and b!417786 res!243356) b!417793))

(assert (= (and b!417793 res!243353) b!417794))

(assert (= (and b!417794 res!243354) b!417796))

(assert (= (and b!417796 res!243357) b!417785))

(assert (= (and b!417785 res!243362) b!417802))

(assert (= (and b!417802 res!243363) b!417798))

(assert (= (and b!417798 res!243352) b!417784))

(assert (= (and b!417784 c!55154) b!417787))

(assert (= (and b!417784 (not c!55154)) b!417791))

(assert (= (or b!417787 b!417791) bm!29057))

(assert (= (or b!417787 b!417791) bm!29056))

(assert (= (and b!417784 (not res!243360)) b!417790))

(assert (= (and b!417789 condMapEmpty!17790) mapIsEmpty!17790))

(assert (= (and b!417789 (not condMapEmpty!17790)) mapNonEmpty!17790))

(get-info :version)

(assert (= (and mapNonEmpty!17790 ((_ is ValueCellFull!5046) mapValue!17790)) b!417795))

(assert (= (and b!417789 ((_ is ValueCellFull!5046) mapDefault!17790)) b!417797))

(assert (= start!39360 b!417789))

(declare-fun b_lambda!8931 () Bool)

(assert (=> (not b_lambda!8931) (not b!417790)))

(declare-fun t!12405 () Bool)

(declare-fun tb!3249 () Bool)

(assert (=> (and start!39360 (= defaultEntry!557 defaultEntry!557) t!12405) tb!3249))

(declare-fun result!6025 () Bool)

(assert (=> tb!3249 (= result!6025 tp_is_empty!10779)))

(assert (=> b!417790 t!12405))

(declare-fun b_and!17131 () Bool)

(assert (= b_and!17129 (and (=> t!12405 result!6025) b_and!17131)))

(declare-fun m!407093 () Bool)

(assert (=> b!417799 m!407093))

(declare-fun m!407095 () Bool)

(assert (=> b!417794 m!407095))

(declare-fun m!407097 () Bool)

(assert (=> bm!29056 m!407097))

(declare-fun m!407099 () Bool)

(assert (=> mapNonEmpty!17790 m!407099))

(declare-fun m!407101 () Bool)

(assert (=> b!417787 m!407101))

(declare-fun m!407103 () Bool)

(assert (=> b!417786 m!407103))

(declare-fun m!407105 () Bool)

(assert (=> b!417785 m!407105))

(declare-fun m!407107 () Bool)

(assert (=> b!417796 m!407107))

(declare-fun m!407109 () Bool)

(assert (=> b!417796 m!407109))

(declare-fun m!407111 () Bool)

(assert (=> b!417801 m!407111))

(declare-fun m!407113 () Bool)

(assert (=> b!417784 m!407113))

(assert (=> b!417784 m!407113))

(declare-fun m!407115 () Bool)

(assert (=> b!417784 m!407115))

(declare-fun m!407117 () Bool)

(assert (=> b!417784 m!407117))

(declare-fun m!407119 () Bool)

(assert (=> bm!29057 m!407119))

(declare-fun m!407121 () Bool)

(assert (=> b!417790 m!407121))

(declare-fun m!407123 () Bool)

(assert (=> b!417790 m!407123))

(declare-fun m!407125 () Bool)

(assert (=> b!417790 m!407125))

(declare-fun m!407127 () Bool)

(assert (=> b!417790 m!407127))

(declare-fun m!407129 () Bool)

(assert (=> b!417790 m!407129))

(assert (=> b!417790 m!407121))

(declare-fun m!407131 () Bool)

(assert (=> b!417790 m!407131))

(declare-fun m!407133 () Bool)

(assert (=> b!417790 m!407133))

(declare-fun m!407135 () Bool)

(assert (=> b!417790 m!407135))

(declare-fun m!407137 () Bool)

(assert (=> b!417790 m!407137))

(declare-fun m!407139 () Bool)

(assert (=> b!417790 m!407139))

(declare-fun m!407141 () Bool)

(assert (=> b!417790 m!407141))

(declare-fun m!407143 () Bool)

(assert (=> b!417790 m!407143))

(assert (=> b!417790 m!407131))

(assert (=> b!417790 m!407135))

(declare-fun m!407145 () Bool)

(assert (=> b!417790 m!407145))

(declare-fun m!407147 () Bool)

(assert (=> b!417788 m!407147))

(declare-fun m!407149 () Bool)

(assert (=> b!417798 m!407149))

(assert (=> b!417798 m!407129))

(declare-fun m!407151 () Bool)

(assert (=> b!417798 m!407151))

(declare-fun m!407153 () Bool)

(assert (=> b!417793 m!407153))

(declare-fun m!407155 () Bool)

(assert (=> start!39360 m!407155))

(declare-fun m!407157 () Bool)

(assert (=> start!39360 m!407157))

(check-sat (not b_lambda!8931) (not b!417796) tp_is_empty!10779 (not b!417798) (not bm!29056) (not b!417785) (not b!417784) (not bm!29057) (not b!417786) (not b!417790) (not b!417799) (not b!417794) (not mapNonEmpty!17790) (not b_next!9627) (not b!417801) b_and!17131 (not b!417788) (not start!39360) (not b!417787))
(check-sat b_and!17131 (not b_next!9627))
