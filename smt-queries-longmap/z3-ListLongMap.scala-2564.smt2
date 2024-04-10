; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39204 () Bool)

(assert start!39204)

(declare-fun b_free!9471 () Bool)

(declare-fun b_next!9471 () Bool)

(assert (=> start!39204 (= b_free!9471 (not b_next!9471))))

(declare-fun tp!33942 () Bool)

(declare-fun b_and!16857 () Bool)

(assert (=> start!39204 (= tp!33942 b_and!16857)))

(declare-fun b!413271 () Bool)

(declare-fun res!240127 () Bool)

(declare-fun e!247157 () Bool)

(assert (=> b!413271 (=> (not res!240127) (not e!247157))))

(declare-datatypes ((array!25103 0))(
  ( (array!25104 (arr!12001 (Array (_ BitVec 32) (_ BitVec 64))) (size!12353 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25103)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25103 (_ BitVec 32)) Bool)

(assert (=> b!413271 (= res!240127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!17556 () Bool)

(declare-fun mapRes!17556 () Bool)

(declare-fun tp!33941 () Bool)

(declare-fun e!247164 () Bool)

(assert (=> mapNonEmpty!17556 (= mapRes!17556 (and tp!33941 e!247164))))

(declare-datatypes ((V!15269 0))(
  ( (V!15270 (val!5356 Int)) )
))
(declare-datatypes ((ValueCell!4968 0))(
  ( (ValueCellFull!4968 (v!7603 V!15269)) (EmptyCell!4968) )
))
(declare-fun mapValue!17556 () ValueCell!4968)

(declare-datatypes ((array!25105 0))(
  ( (array!25106 (arr!12002 (Array (_ BitVec 32) ValueCell!4968)) (size!12354 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25105)

(declare-fun mapRest!17556 () (Array (_ BitVec 32) ValueCell!4968))

(declare-fun mapKey!17556 () (_ BitVec 32))

(assert (=> mapNonEmpty!17556 (= (arr!12002 _values!549) (store mapRest!17556 mapKey!17556 mapValue!17556))))

(declare-fun b!413272 () Bool)

(declare-fun e!247159 () Bool)

(declare-fun e!247160 () Bool)

(assert (=> b!413272 (= e!247159 (and e!247160 mapRes!17556))))

(declare-fun condMapEmpty!17556 () Bool)

(declare-fun mapDefault!17556 () ValueCell!4968)

(assert (=> b!413272 (= condMapEmpty!17556 (= (arr!12002 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4968)) mapDefault!17556)))))

(declare-fun res!240135 () Bool)

(assert (=> start!39204 (=> (not res!240135) (not e!247157))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39204 (= res!240135 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12353 _keys!709))))))

(assert (=> start!39204 e!247157))

(declare-fun tp_is_empty!10623 () Bool)

(assert (=> start!39204 tp_is_empty!10623))

(assert (=> start!39204 tp!33942))

(assert (=> start!39204 true))

(declare-fun array_inv!8752 (array!25105) Bool)

(assert (=> start!39204 (and (array_inv!8752 _values!549) e!247159)))

(declare-fun array_inv!8753 (array!25103) Bool)

(assert (=> start!39204 (array_inv!8753 _keys!709)))

(declare-fun b!413273 () Bool)

(declare-fun res!240128 () Bool)

(assert (=> b!413273 (=> (not res!240128) (not e!247157))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413273 (= res!240128 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!413274 () Bool)

(declare-fun res!240129 () Bool)

(declare-fun e!247158 () Bool)

(assert (=> b!413274 (=> (not res!240129) (not e!247158))))

(declare-fun lt!189681 () array!25103)

(declare-datatypes ((List!6981 0))(
  ( (Nil!6978) (Cons!6977 (h!7833 (_ BitVec 64)) (t!12155 List!6981)) )
))
(declare-fun arrayNoDuplicates!0 (array!25103 (_ BitVec 32) List!6981) Bool)

(assert (=> b!413274 (= res!240129 (arrayNoDuplicates!0 lt!189681 #b00000000000000000000000000000000 Nil!6978))))

(declare-fun b!413275 () Bool)

(declare-fun res!240134 () Bool)

(assert (=> b!413275 (=> (not res!240134) (not e!247157))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413275 (= res!240134 (or (= (select (arr!12001 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12001 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!413276 () Bool)

(declare-fun e!247161 () Bool)

(assert (=> b!413276 (= e!247161 (not true))))

(declare-fun e!247163 () Bool)

(assert (=> b!413276 e!247163))

(declare-fun c!54920 () Bool)

(assert (=> b!413276 (= c!54920 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15269)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15269)

(declare-datatypes ((Unit!12230 0))(
  ( (Unit!12231) )
))
(declare-fun lt!189679 () Unit!12230)

(declare-fun v!412 () V!15269)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!373 (array!25103 array!25105 (_ BitVec 32) (_ BitVec 32) V!15269 V!15269 (_ BitVec 32) (_ BitVec 64) V!15269 (_ BitVec 32) Int) Unit!12230)

(assert (=> b!413276 (= lt!189679 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!373 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413277 () Bool)

(declare-fun res!240130 () Bool)

(assert (=> b!413277 (=> (not res!240130) (not e!247157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413277 (= res!240130 (validKeyInArray!0 k0!794))))

(declare-fun b!413278 () Bool)

(assert (=> b!413278 (= e!247164 tp_is_empty!10623)))

(declare-fun b!413279 () Bool)

(assert (=> b!413279 (= e!247160 tp_is_empty!10623)))

(declare-fun b!413280 () Bool)

(declare-fun res!240132 () Bool)

(assert (=> b!413280 (=> (not res!240132) (not e!247157))))

(assert (=> b!413280 (= res!240132 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12353 _keys!709))))))

(declare-fun b!413281 () Bool)

(assert (=> b!413281 (= e!247158 e!247161)))

(declare-fun res!240123 () Bool)

(assert (=> b!413281 (=> (not res!240123) (not e!247161))))

(assert (=> b!413281 (= res!240123 (= from!863 i!563))))

(declare-fun lt!189680 () array!25105)

(declare-datatypes ((tuple2!6956 0))(
  ( (tuple2!6957 (_1!3489 (_ BitVec 64)) (_2!3489 V!15269)) )
))
(declare-datatypes ((List!6982 0))(
  ( (Nil!6979) (Cons!6978 (h!7834 tuple2!6956) (t!12156 List!6982)) )
))
(declare-datatypes ((ListLongMap!5869 0))(
  ( (ListLongMap!5870 (toList!2950 List!6982)) )
))
(declare-fun lt!189683 () ListLongMap!5869)

(declare-fun getCurrentListMapNoExtraKeys!1158 (array!25103 array!25105 (_ BitVec 32) (_ BitVec 32) V!15269 V!15269 (_ BitVec 32) Int) ListLongMap!5869)

(assert (=> b!413281 (= lt!189683 (getCurrentListMapNoExtraKeys!1158 lt!189681 lt!189680 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!413281 (= lt!189680 (array!25106 (store (arr!12002 _values!549) i!563 (ValueCellFull!4968 v!412)) (size!12354 _values!549)))))

(declare-fun lt!189682 () ListLongMap!5869)

(assert (=> b!413281 (= lt!189682 (getCurrentListMapNoExtraKeys!1158 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!17556 () Bool)

(assert (=> mapIsEmpty!17556 mapRes!17556))

(declare-fun call!28592 () ListLongMap!5869)

(declare-fun bm!28588 () Bool)

(assert (=> bm!28588 (= call!28592 (getCurrentListMapNoExtraKeys!1158 (ite c!54920 _keys!709 lt!189681) (ite c!54920 _values!549 lt!189680) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413282 () Bool)

(assert (=> b!413282 (= e!247157 e!247158)))

(declare-fun res!240126 () Bool)

(assert (=> b!413282 (=> (not res!240126) (not e!247158))))

(assert (=> b!413282 (= res!240126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189681 mask!1025))))

(assert (=> b!413282 (= lt!189681 (array!25104 (store (arr!12001 _keys!709) i!563 k0!794) (size!12353 _keys!709)))))

(declare-fun b!413283 () Bool)

(declare-fun call!28591 () ListLongMap!5869)

(assert (=> b!413283 (= e!247163 (= call!28592 call!28591))))

(declare-fun b!413284 () Bool)

(declare-fun res!240124 () Bool)

(assert (=> b!413284 (=> (not res!240124) (not e!247157))))

(assert (=> b!413284 (= res!240124 (and (= (size!12354 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12353 _keys!709) (size!12354 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!413285 () Bool)

(declare-fun +!1162 (ListLongMap!5869 tuple2!6956) ListLongMap!5869)

(assert (=> b!413285 (= e!247163 (= call!28591 (+!1162 call!28592 (tuple2!6957 k0!794 v!412))))))

(declare-fun b!413286 () Bool)

(declare-fun res!240125 () Bool)

(assert (=> b!413286 (=> (not res!240125) (not e!247157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413286 (= res!240125 (validMask!0 mask!1025))))

(declare-fun bm!28589 () Bool)

(assert (=> bm!28589 (= call!28591 (getCurrentListMapNoExtraKeys!1158 (ite c!54920 lt!189681 _keys!709) (ite c!54920 lt!189680 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413287 () Bool)

(declare-fun res!240131 () Bool)

(assert (=> b!413287 (=> (not res!240131) (not e!247157))))

(assert (=> b!413287 (= res!240131 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6978))))

(declare-fun b!413288 () Bool)

(declare-fun res!240133 () Bool)

(assert (=> b!413288 (=> (not res!240133) (not e!247158))))

(assert (=> b!413288 (= res!240133 (bvsle from!863 i!563))))

(assert (= (and start!39204 res!240135) b!413286))

(assert (= (and b!413286 res!240125) b!413284))

(assert (= (and b!413284 res!240124) b!413271))

(assert (= (and b!413271 res!240127) b!413287))

(assert (= (and b!413287 res!240131) b!413280))

(assert (= (and b!413280 res!240132) b!413277))

(assert (= (and b!413277 res!240130) b!413275))

(assert (= (and b!413275 res!240134) b!413273))

(assert (= (and b!413273 res!240128) b!413282))

(assert (= (and b!413282 res!240126) b!413274))

(assert (= (and b!413274 res!240129) b!413288))

(assert (= (and b!413288 res!240133) b!413281))

(assert (= (and b!413281 res!240123) b!413276))

(assert (= (and b!413276 c!54920) b!413285))

(assert (= (and b!413276 (not c!54920)) b!413283))

(assert (= (or b!413285 b!413283) bm!28589))

(assert (= (or b!413285 b!413283) bm!28588))

(assert (= (and b!413272 condMapEmpty!17556) mapIsEmpty!17556))

(assert (= (and b!413272 (not condMapEmpty!17556)) mapNonEmpty!17556))

(get-info :version)

(assert (= (and mapNonEmpty!17556 ((_ is ValueCellFull!4968) mapValue!17556)) b!413278))

(assert (= (and b!413272 ((_ is ValueCellFull!4968) mapDefault!17556)) b!413279))

(assert (= start!39204 b!413272))

(declare-fun m!402819 () Bool)

(assert (=> b!413286 m!402819))

(declare-fun m!402821 () Bool)

(assert (=> b!413273 m!402821))

(declare-fun m!402823 () Bool)

(assert (=> start!39204 m!402823))

(declare-fun m!402825 () Bool)

(assert (=> start!39204 m!402825))

(declare-fun m!402827 () Bool)

(assert (=> b!413271 m!402827))

(declare-fun m!402829 () Bool)

(assert (=> b!413282 m!402829))

(declare-fun m!402831 () Bool)

(assert (=> b!413282 m!402831))

(declare-fun m!402833 () Bool)

(assert (=> b!413275 m!402833))

(declare-fun m!402835 () Bool)

(assert (=> bm!28589 m!402835))

(declare-fun m!402837 () Bool)

(assert (=> b!413277 m!402837))

(declare-fun m!402839 () Bool)

(assert (=> b!413285 m!402839))

(declare-fun m!402841 () Bool)

(assert (=> b!413276 m!402841))

(declare-fun m!402843 () Bool)

(assert (=> mapNonEmpty!17556 m!402843))

(declare-fun m!402845 () Bool)

(assert (=> bm!28588 m!402845))

(declare-fun m!402847 () Bool)

(assert (=> b!413281 m!402847))

(declare-fun m!402849 () Bool)

(assert (=> b!413281 m!402849))

(declare-fun m!402851 () Bool)

(assert (=> b!413281 m!402851))

(declare-fun m!402853 () Bool)

(assert (=> b!413274 m!402853))

(declare-fun m!402855 () Bool)

(assert (=> b!413287 m!402855))

(check-sat b_and!16857 (not b!413282) (not b!413287) (not b!413277) (not bm!28589) (not b!413285) (not b!413273) (not b!413271) (not start!39204) tp_is_empty!10623 (not b!413276) (not mapNonEmpty!17556) (not b!413281) (not b!413286) (not bm!28588) (not b!413274) (not b_next!9471))
(check-sat b_and!16857 (not b_next!9471))
