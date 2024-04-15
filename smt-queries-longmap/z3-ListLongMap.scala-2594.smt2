; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39368 () Bool)

(assert start!39368)

(declare-fun b_free!9649 () Bool)

(declare-fun b_next!9649 () Bool)

(assert (=> start!39368 (= b_free!9649 (not b_next!9649))))

(declare-fun tp!34475 () Bool)

(declare-fun b_and!17147 () Bool)

(assert (=> start!39368 (= tp!34475 b_and!17147)))

(declare-fun b!418162 () Bool)

(declare-fun res!243694 () Bool)

(declare-fun e!249337 () Bool)

(assert (=> b!418162 (=> (not res!243694) (not e!249337))))

(declare-datatypes ((array!25441 0))(
  ( (array!25442 (arr!12170 (Array (_ BitVec 32) (_ BitVec 64))) (size!12523 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25441)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25441 (_ BitVec 32)) Bool)

(assert (=> b!418162 (= res!243694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!418163 () Bool)

(declare-fun e!249344 () Bool)

(declare-fun e!249338 () Bool)

(assert (=> b!418163 (= e!249344 (not e!249338))))

(declare-fun res!243695 () Bool)

(assert (=> b!418163 (=> res!243695 e!249338)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418163 (= res!243695 (validKeyInArray!0 (select (arr!12170 _keys!709) from!863)))))

(declare-fun e!249339 () Bool)

(assert (=> b!418163 e!249339))

(declare-fun c!55116 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!418163 (= c!55116 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!15507 0))(
  ( (V!15508 (val!5445 Int)) )
))
(declare-fun minValue!515 () V!15507)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((Unit!12334 0))(
  ( (Unit!12335) )
))
(declare-fun lt!191558 () Unit!12334)

(declare-datatypes ((ValueCell!5057 0))(
  ( (ValueCellFull!5057 (v!7686 V!15507)) (EmptyCell!5057) )
))
(declare-datatypes ((array!25443 0))(
  ( (array!25444 (arr!12171 (Array (_ BitVec 32) ValueCell!5057)) (size!12524 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25443)

(declare-fun zeroValue!515 () V!15507)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!15507)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!423 (array!25441 array!25443 (_ BitVec 32) (_ BitVec 32) V!15507 V!15507 (_ BitVec 32) (_ BitVec 64) V!15507 (_ BitVec 32) Int) Unit!12334)

(assert (=> b!418163 (= lt!191558 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!423 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!191555 () array!25443)

(declare-fun lt!191551 () array!25441)

(declare-fun bm!29097 () Bool)

(declare-datatypes ((tuple2!7102 0))(
  ( (tuple2!7103 (_1!3562 (_ BitVec 64)) (_2!3562 V!15507)) )
))
(declare-datatypes ((List!7101 0))(
  ( (Nil!7098) (Cons!7097 (h!7953 tuple2!7102) (t!12406 List!7101)) )
))
(declare-datatypes ((ListLongMap!6005 0))(
  ( (ListLongMap!6006 (toList!3018 List!7101)) )
))
(declare-fun call!29100 () ListLongMap!6005)

(declare-fun getCurrentListMapNoExtraKeys!1229 (array!25441 array!25443 (_ BitVec 32) (_ BitVec 32) V!15507 V!15507 (_ BitVec 32) Int) ListLongMap!6005)

(assert (=> bm!29097 (= call!29100 (getCurrentListMapNoExtraKeys!1229 (ite c!55116 lt!191551 _keys!709) (ite c!55116 lt!191555 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!243684 () Bool)

(assert (=> start!39368 (=> (not res!243684) (not e!249337))))

(assert (=> start!39368 (= res!243684 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12523 _keys!709))))))

(assert (=> start!39368 e!249337))

(declare-fun tp_is_empty!10801 () Bool)

(assert (=> start!39368 tp_is_empty!10801))

(assert (=> start!39368 tp!34475))

(assert (=> start!39368 true))

(declare-fun e!249341 () Bool)

(declare-fun array_inv!8920 (array!25443) Bool)

(assert (=> start!39368 (and (array_inv!8920 _values!549) e!249341)))

(declare-fun array_inv!8921 (array!25441) Bool)

(assert (=> start!39368 (array_inv!8921 _keys!709)))

(declare-fun b!418164 () Bool)

(declare-fun e!249342 () Bool)

(assert (=> b!418164 (= e!249337 e!249342)))

(declare-fun res!243685 () Bool)

(assert (=> b!418164 (=> (not res!243685) (not e!249342))))

(assert (=> b!418164 (= res!243685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191551 mask!1025))))

(assert (=> b!418164 (= lt!191551 (array!25442 (store (arr!12170 _keys!709) i!563 k0!794) (size!12523 _keys!709)))))

(declare-fun mapNonEmpty!17823 () Bool)

(declare-fun mapRes!17823 () Bool)

(declare-fun tp!34476 () Bool)

(declare-fun e!249345 () Bool)

(assert (=> mapNonEmpty!17823 (= mapRes!17823 (and tp!34476 e!249345))))

(declare-fun mapValue!17823 () ValueCell!5057)

(declare-fun mapRest!17823 () (Array (_ BitVec 32) ValueCell!5057))

(declare-fun mapKey!17823 () (_ BitVec 32))

(assert (=> mapNonEmpty!17823 (= (arr!12171 _values!549) (store mapRest!17823 mapKey!17823 mapValue!17823))))

(declare-fun mapIsEmpty!17823 () Bool)

(assert (=> mapIsEmpty!17823 mapRes!17823))

(declare-fun b!418165 () Bool)

(declare-fun res!243686 () Bool)

(assert (=> b!418165 (=> (not res!243686) (not e!249337))))

(assert (=> b!418165 (= res!243686 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12523 _keys!709))))))

(declare-fun b!418166 () Bool)

(declare-fun res!243693 () Bool)

(assert (=> b!418166 (=> (not res!243693) (not e!249337))))

(assert (=> b!418166 (= res!243693 (or (= (select (arr!12170 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12170 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!29101 () ListLongMap!6005)

(declare-fun b!418167 () Bool)

(declare-fun +!1247 (ListLongMap!6005 tuple2!7102) ListLongMap!6005)

(assert (=> b!418167 (= e!249339 (= call!29100 (+!1247 call!29101 (tuple2!7103 k0!794 v!412))))))

(declare-fun b!418168 () Bool)

(declare-fun res!243692 () Bool)

(assert (=> b!418168 (=> (not res!243692) (not e!249342))))

(declare-datatypes ((List!7102 0))(
  ( (Nil!7099) (Cons!7098 (h!7954 (_ BitVec 64)) (t!12407 List!7102)) )
))
(declare-fun arrayNoDuplicates!0 (array!25441 (_ BitVec 32) List!7102) Bool)

(assert (=> b!418168 (= res!243692 (arrayNoDuplicates!0 lt!191551 #b00000000000000000000000000000000 Nil!7099))))

(declare-fun bm!29098 () Bool)

(assert (=> bm!29098 (= call!29101 (getCurrentListMapNoExtraKeys!1229 (ite c!55116 _keys!709 lt!191551) (ite c!55116 _values!549 lt!191555) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418169 () Bool)

(declare-fun res!243689 () Bool)

(assert (=> b!418169 (=> (not res!243689) (not e!249337))))

(assert (=> b!418169 (= res!243689 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7099))))

(declare-fun b!418170 () Bool)

(declare-fun e!249340 () Bool)

(assert (=> b!418170 (= e!249340 tp_is_empty!10801)))

(declare-fun b!418171 () Bool)

(declare-fun res!243688 () Bool)

(assert (=> b!418171 (=> (not res!243688) (not e!249337))))

(assert (=> b!418171 (= res!243688 (and (= (size!12524 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12523 _keys!709) (size!12524 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!418172 () Bool)

(assert (=> b!418172 (= e!249338 true)))

(declare-fun lt!191556 () tuple2!7102)

(declare-fun lt!191557 () V!15507)

(declare-fun lt!191552 () ListLongMap!6005)

(assert (=> b!418172 (= (+!1247 lt!191552 lt!191556) (+!1247 (+!1247 lt!191552 (tuple2!7103 k0!794 lt!191557)) lt!191556))))

(declare-fun lt!191550 () V!15507)

(assert (=> b!418172 (= lt!191556 (tuple2!7103 k0!794 lt!191550))))

(declare-fun lt!191549 () Unit!12334)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!33 (ListLongMap!6005 (_ BitVec 64) V!15507 V!15507) Unit!12334)

(assert (=> b!418172 (= lt!191549 (addSameAsAddTwiceSameKeyDiffValues!33 lt!191552 k0!794 lt!191557 lt!191550))))

(declare-fun lt!191548 () V!15507)

(declare-fun get!6024 (ValueCell!5057 V!15507) V!15507)

(assert (=> b!418172 (= lt!191557 (get!6024 (select (arr!12171 _values!549) from!863) lt!191548))))

(declare-fun lt!191554 () ListLongMap!6005)

(assert (=> b!418172 (= lt!191554 (+!1247 lt!191552 (tuple2!7103 (select (arr!12170 lt!191551) from!863) lt!191550)))))

(assert (=> b!418172 (= lt!191550 (get!6024 (select (store (arr!12171 _values!549) i!563 (ValueCellFull!5057 v!412)) from!863) lt!191548))))

(declare-fun dynLambda!690 (Int (_ BitVec 64)) V!15507)

(assert (=> b!418172 (= lt!191548 (dynLambda!690 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!418172 (= lt!191552 (getCurrentListMapNoExtraKeys!1229 lt!191551 lt!191555 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418173 () Bool)

(declare-fun res!243690 () Bool)

(assert (=> b!418173 (=> (not res!243690) (not e!249342))))

(assert (=> b!418173 (= res!243690 (bvsle from!863 i!563))))

(declare-fun b!418174 () Bool)

(assert (=> b!418174 (= e!249339 (= call!29101 call!29100))))

(declare-fun b!418175 () Bool)

(assert (=> b!418175 (= e!249341 (and e!249340 mapRes!17823))))

(declare-fun condMapEmpty!17823 () Bool)

(declare-fun mapDefault!17823 () ValueCell!5057)

(assert (=> b!418175 (= condMapEmpty!17823 (= (arr!12171 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5057)) mapDefault!17823)))))

(declare-fun b!418176 () Bool)

(declare-fun res!243683 () Bool)

(assert (=> b!418176 (=> (not res!243683) (not e!249337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418176 (= res!243683 (validMask!0 mask!1025))))

(declare-fun b!418177 () Bool)

(assert (=> b!418177 (= e!249342 e!249344)))

(declare-fun res!243696 () Bool)

(assert (=> b!418177 (=> (not res!243696) (not e!249344))))

(assert (=> b!418177 (= res!243696 (= from!863 i!563))))

(assert (=> b!418177 (= lt!191554 (getCurrentListMapNoExtraKeys!1229 lt!191551 lt!191555 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!418177 (= lt!191555 (array!25444 (store (arr!12171 _values!549) i!563 (ValueCellFull!5057 v!412)) (size!12524 _values!549)))))

(declare-fun lt!191553 () ListLongMap!6005)

(assert (=> b!418177 (= lt!191553 (getCurrentListMapNoExtraKeys!1229 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!418178 () Bool)

(assert (=> b!418178 (= e!249345 tp_is_empty!10801)))

(declare-fun b!418179 () Bool)

(declare-fun res!243691 () Bool)

(assert (=> b!418179 (=> (not res!243691) (not e!249337))))

(declare-fun arrayContainsKey!0 (array!25441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418179 (= res!243691 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!418180 () Bool)

(declare-fun res!243687 () Bool)

(assert (=> b!418180 (=> (not res!243687) (not e!249337))))

(assert (=> b!418180 (= res!243687 (validKeyInArray!0 k0!794))))

(assert (= (and start!39368 res!243684) b!418176))

(assert (= (and b!418176 res!243683) b!418171))

(assert (= (and b!418171 res!243688) b!418162))

(assert (= (and b!418162 res!243694) b!418169))

(assert (= (and b!418169 res!243689) b!418165))

(assert (= (and b!418165 res!243686) b!418180))

(assert (= (and b!418180 res!243687) b!418166))

(assert (= (and b!418166 res!243693) b!418179))

(assert (= (and b!418179 res!243691) b!418164))

(assert (= (and b!418164 res!243685) b!418168))

(assert (= (and b!418168 res!243692) b!418173))

(assert (= (and b!418173 res!243690) b!418177))

(assert (= (and b!418177 res!243696) b!418163))

(assert (= (and b!418163 c!55116) b!418167))

(assert (= (and b!418163 (not c!55116)) b!418174))

(assert (= (or b!418167 b!418174) bm!29097))

(assert (= (or b!418167 b!418174) bm!29098))

(assert (= (and b!418163 (not res!243695)) b!418172))

(assert (= (and b!418175 condMapEmpty!17823) mapIsEmpty!17823))

(assert (= (and b!418175 (not condMapEmpty!17823)) mapNonEmpty!17823))

(get-info :version)

(assert (= (and mapNonEmpty!17823 ((_ is ValueCellFull!5057) mapValue!17823)) b!418178))

(assert (= (and b!418175 ((_ is ValueCellFull!5057) mapDefault!17823)) b!418170))

(assert (= start!39368 b!418175))

(declare-fun b_lambda!8935 () Bool)

(assert (=> (not b_lambda!8935) (not b!418172)))

(declare-fun t!12405 () Bool)

(declare-fun tb!3263 () Bool)

(assert (=> (and start!39368 (= defaultEntry!557 defaultEntry!557) t!12405) tb!3263))

(declare-fun result!6061 () Bool)

(assert (=> tb!3263 (= result!6061 tp_is_empty!10801)))

(assert (=> b!418172 t!12405))

(declare-fun b_and!17149 () Bool)

(assert (= b_and!17147 (and (=> t!12405 result!6061) b_and!17149)))

(declare-fun m!407091 () Bool)

(assert (=> mapNonEmpty!17823 m!407091))

(declare-fun m!407093 () Bool)

(assert (=> bm!29097 m!407093))

(declare-fun m!407095 () Bool)

(assert (=> b!418167 m!407095))

(declare-fun m!407097 () Bool)

(assert (=> b!418162 m!407097))

(declare-fun m!407099 () Bool)

(assert (=> b!418180 m!407099))

(declare-fun m!407101 () Bool)

(assert (=> b!418169 m!407101))

(declare-fun m!407103 () Bool)

(assert (=> b!418168 m!407103))

(declare-fun m!407105 () Bool)

(assert (=> b!418163 m!407105))

(assert (=> b!418163 m!407105))

(declare-fun m!407107 () Bool)

(assert (=> b!418163 m!407107))

(declare-fun m!407109 () Bool)

(assert (=> b!418163 m!407109))

(declare-fun m!407111 () Bool)

(assert (=> b!418179 m!407111))

(declare-fun m!407113 () Bool)

(assert (=> b!418172 m!407113))

(declare-fun m!407115 () Bool)

(assert (=> b!418172 m!407115))

(declare-fun m!407117 () Bool)

(assert (=> b!418172 m!407117))

(declare-fun m!407119 () Bool)

(assert (=> b!418172 m!407119))

(declare-fun m!407121 () Bool)

(assert (=> b!418172 m!407121))

(declare-fun m!407123 () Bool)

(assert (=> b!418172 m!407123))

(declare-fun m!407125 () Bool)

(assert (=> b!418172 m!407125))

(declare-fun m!407127 () Bool)

(assert (=> b!418172 m!407127))

(declare-fun m!407129 () Bool)

(assert (=> b!418172 m!407129))

(declare-fun m!407131 () Bool)

(assert (=> b!418172 m!407131))

(assert (=> b!418172 m!407115))

(declare-fun m!407133 () Bool)

(assert (=> b!418172 m!407133))

(assert (=> b!418172 m!407127))

(assert (=> b!418172 m!407121))

(declare-fun m!407135 () Bool)

(assert (=> b!418172 m!407135))

(declare-fun m!407137 () Bool)

(assert (=> b!418172 m!407137))

(declare-fun m!407139 () Bool)

(assert (=> b!418176 m!407139))

(declare-fun m!407141 () Bool)

(assert (=> start!39368 m!407141))

(declare-fun m!407143 () Bool)

(assert (=> start!39368 m!407143))

(declare-fun m!407145 () Bool)

(assert (=> b!418177 m!407145))

(assert (=> b!418177 m!407113))

(declare-fun m!407147 () Bool)

(assert (=> b!418177 m!407147))

(declare-fun m!407149 () Bool)

(assert (=> b!418164 m!407149))

(declare-fun m!407151 () Bool)

(assert (=> b!418164 m!407151))

(declare-fun m!407153 () Bool)

(assert (=> bm!29098 m!407153))

(declare-fun m!407155 () Bool)

(assert (=> b!418166 m!407155))

(check-sat (not b!418177) (not b!418179) (not b!418172) (not bm!29097) (not b!418176) (not b_next!9649) (not bm!29098) tp_is_empty!10801 (not b!418162) (not b!418169) (not start!39368) (not b!418164) (not b!418167) (not b!418168) (not b!418180) (not mapNonEmpty!17823) b_and!17149 (not b_lambda!8935) (not b!418163))
(check-sat b_and!17149 (not b_next!9649))
