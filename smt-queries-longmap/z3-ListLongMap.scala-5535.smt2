; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72976 () Bool)

(assert start!72976)

(declare-fun b_free!13909 () Bool)

(declare-fun b_next!13909 () Bool)

(assert (=> start!72976 (= b_free!13909 (not b_next!13909))))

(declare-fun tp!49231 () Bool)

(declare-fun b_and!22969 () Bool)

(assert (=> start!72976 (= tp!49231 b_and!22969)))

(declare-fun b!847811 () Bool)

(declare-fun res!576069 () Bool)

(declare-fun e!473042 () Bool)

(assert (=> b!847811 (=> (not res!576069) (not e!473042))))

(declare-datatypes ((array!48297 0))(
  ( (array!48298 (arr!23180 (Array (_ BitVec 32) (_ BitVec 64))) (size!23622 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48297)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48297 (_ BitVec 32)) Bool)

(assert (=> b!847811 (= res!576069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847812 () Bool)

(declare-fun e!473039 () Bool)

(declare-fun tp_is_empty!16045 () Bool)

(assert (=> b!847812 (= e!473039 tp_is_empty!16045)))

(declare-fun b!847813 () Bool)

(declare-fun res!576065 () Bool)

(assert (=> b!847813 (=> (not res!576065) (not e!473042))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!847813 (= res!576065 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23622 _keys!868))))))

(declare-fun mapNonEmpty!25667 () Bool)

(declare-fun mapRes!25667 () Bool)

(declare-fun tp!49232 () Bool)

(declare-fun e!473038 () Bool)

(assert (=> mapNonEmpty!25667 (= mapRes!25667 (and tp!49232 e!473038))))

(declare-fun mapKey!25667 () (_ BitVec 32))

(declare-datatypes ((V!26441 0))(
  ( (V!26442 (val!8070 Int)) )
))
(declare-datatypes ((ValueCell!7583 0))(
  ( (ValueCellFull!7583 (v!10489 V!26441)) (EmptyCell!7583) )
))
(declare-fun mapValue!25667 () ValueCell!7583)

(declare-fun mapRest!25667 () (Array (_ BitVec 32) ValueCell!7583))

(declare-datatypes ((array!48299 0))(
  ( (array!48300 (arr!23181 (Array (_ BitVec 32) ValueCell!7583)) (size!23623 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48299)

(assert (=> mapNonEmpty!25667 (= (arr!23181 _values!688) (store mapRest!25667 mapKey!25667 mapValue!25667))))

(declare-fun b!847814 () Bool)

(declare-fun res!576068 () Bool)

(assert (=> b!847814 (=> (not res!576068) (not e!473042))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!847814 (= res!576068 (and (= (size!23623 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23622 _keys!868) (size!23623 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!576067 () Bool)

(assert (=> start!72976 (=> (not res!576067) (not e!473042))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72976 (= res!576067 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23622 _keys!868))))))

(assert (=> start!72976 e!473042))

(assert (=> start!72976 tp_is_empty!16045))

(assert (=> start!72976 true))

(assert (=> start!72976 tp!49231))

(declare-fun array_inv!18484 (array!48297) Bool)

(assert (=> start!72976 (array_inv!18484 _keys!868)))

(declare-fun e!473043 () Bool)

(declare-fun array_inv!18485 (array!48299) Bool)

(assert (=> start!72976 (and (array_inv!18485 _values!688) e!473043)))

(declare-fun b!847815 () Bool)

(declare-fun res!576064 () Bool)

(assert (=> b!847815 (=> (not res!576064) (not e!473042))))

(declare-datatypes ((List!16429 0))(
  ( (Nil!16426) (Cons!16425 (h!17556 (_ BitVec 64)) (t!22791 List!16429)) )
))
(declare-fun arrayNoDuplicates!0 (array!48297 (_ BitVec 32) List!16429) Bool)

(assert (=> b!847815 (= res!576064 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16426))))

(declare-fun b!847816 () Bool)

(declare-fun res!576070 () Bool)

(assert (=> b!847816 (=> (not res!576070) (not e!473042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847816 (= res!576070 (validMask!0 mask!1196))))

(declare-fun b!847817 () Bool)

(declare-fun e!473040 () Bool)

(assert (=> b!847817 (= e!473042 e!473040)))

(declare-fun res!576066 () Bool)

(assert (=> b!847817 (=> (not res!576066) (not e!473040))))

(assert (=> b!847817 (= res!576066 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!381675 () array!48299)

(declare-fun minValue!654 () V!26441)

(declare-fun zeroValue!654 () V!26441)

(declare-datatypes ((tuple2!10576 0))(
  ( (tuple2!10577 (_1!5299 (_ BitVec 64)) (_2!5299 V!26441)) )
))
(declare-datatypes ((List!16430 0))(
  ( (Nil!16427) (Cons!16426 (h!17557 tuple2!10576) (t!22792 List!16430)) )
))
(declare-datatypes ((ListLongMap!9335 0))(
  ( (ListLongMap!9336 (toList!4683 List!16430)) )
))
(declare-fun lt!381676 () ListLongMap!9335)

(declare-fun getCurrentListMapNoExtraKeys!2696 (array!48297 array!48299 (_ BitVec 32) (_ BitVec 32) V!26441 V!26441 (_ BitVec 32) Int) ListLongMap!9335)

(assert (=> b!847817 (= lt!381676 (getCurrentListMapNoExtraKeys!2696 _keys!868 lt!381675 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26441)

(assert (=> b!847817 (= lt!381675 (array!48300 (store (arr!23181 _values!688) i!612 (ValueCellFull!7583 v!557)) (size!23623 _values!688)))))

(declare-fun lt!381674 () ListLongMap!9335)

(assert (=> b!847817 (= lt!381674 (getCurrentListMapNoExtraKeys!2696 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun call!37557 () ListLongMap!9335)

(declare-fun bm!37553 () Bool)

(assert (=> bm!37553 (= call!37557 (getCurrentListMapNoExtraKeys!2696 _keys!868 lt!381675 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847818 () Bool)

(declare-fun e!473041 () Bool)

(declare-fun call!37556 () ListLongMap!9335)

(assert (=> b!847818 (= e!473041 (= call!37557 call!37556))))

(declare-fun b!847819 () Bool)

(declare-fun res!576071 () Bool)

(assert (=> b!847819 (=> (not res!576071) (not e!473042))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!847819 (= res!576071 (and (= (select (arr!23180 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!847820 () Bool)

(declare-fun res!576072 () Bool)

(assert (=> b!847820 (=> (not res!576072) (not e!473042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847820 (= res!576072 (validKeyInArray!0 k0!854))))

(declare-fun bm!37554 () Bool)

(assert (=> bm!37554 (= call!37556 (getCurrentListMapNoExtraKeys!2696 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847821 () Bool)

(assert (=> b!847821 (= e!473043 (and e!473039 mapRes!25667))))

(declare-fun condMapEmpty!25667 () Bool)

(declare-fun mapDefault!25667 () ValueCell!7583)

(assert (=> b!847821 (= condMapEmpty!25667 (= (arr!23181 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7583)) mapDefault!25667)))))

(declare-fun b!847822 () Bool)

(assert (=> b!847822 (= e!473038 tp_is_empty!16045)))

(declare-fun b!847823 () Bool)

(declare-fun +!2113 (ListLongMap!9335 tuple2!10576) ListLongMap!9335)

(assert (=> b!847823 (= e!473041 (= call!37557 (+!2113 call!37556 (tuple2!10577 k0!854 v!557))))))

(declare-fun b!847824 () Bool)

(assert (=> b!847824 (= e!473040 (not true))))

(assert (=> b!847824 e!473041))

(declare-fun c!91469 () Bool)

(assert (=> b!847824 (= c!91469 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28905 0))(
  ( (Unit!28906) )
))
(declare-fun lt!381677 () Unit!28905)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!327 (array!48297 array!48299 (_ BitVec 32) (_ BitVec 32) V!26441 V!26441 (_ BitVec 32) (_ BitVec 64) V!26441 (_ BitVec 32) Int) Unit!28905)

(assert (=> b!847824 (= lt!381677 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!327 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25667 () Bool)

(assert (=> mapIsEmpty!25667 mapRes!25667))

(assert (= (and start!72976 res!576067) b!847816))

(assert (= (and b!847816 res!576070) b!847814))

(assert (= (and b!847814 res!576068) b!847811))

(assert (= (and b!847811 res!576069) b!847815))

(assert (= (and b!847815 res!576064) b!847813))

(assert (= (and b!847813 res!576065) b!847820))

(assert (= (and b!847820 res!576072) b!847819))

(assert (= (and b!847819 res!576071) b!847817))

(assert (= (and b!847817 res!576066) b!847824))

(assert (= (and b!847824 c!91469) b!847823))

(assert (= (and b!847824 (not c!91469)) b!847818))

(assert (= (or b!847823 b!847818) bm!37554))

(assert (= (or b!847823 b!847818) bm!37553))

(assert (= (and b!847821 condMapEmpty!25667) mapIsEmpty!25667))

(assert (= (and b!847821 (not condMapEmpty!25667)) mapNonEmpty!25667))

(get-info :version)

(assert (= (and mapNonEmpty!25667 ((_ is ValueCellFull!7583) mapValue!25667)) b!847822))

(assert (= (and b!847821 ((_ is ValueCellFull!7583) mapDefault!25667)) b!847812))

(assert (= start!72976 b!847821))

(declare-fun m!788189 () Bool)

(assert (=> b!847811 m!788189))

(declare-fun m!788191 () Bool)

(assert (=> mapNonEmpty!25667 m!788191))

(declare-fun m!788193 () Bool)

(assert (=> b!847820 m!788193))

(declare-fun m!788195 () Bool)

(assert (=> b!847824 m!788195))

(declare-fun m!788197 () Bool)

(assert (=> b!847815 m!788197))

(declare-fun m!788199 () Bool)

(assert (=> b!847816 m!788199))

(declare-fun m!788201 () Bool)

(assert (=> bm!37553 m!788201))

(declare-fun m!788203 () Bool)

(assert (=> start!72976 m!788203))

(declare-fun m!788205 () Bool)

(assert (=> start!72976 m!788205))

(declare-fun m!788207 () Bool)

(assert (=> bm!37554 m!788207))

(declare-fun m!788209 () Bool)

(assert (=> b!847817 m!788209))

(declare-fun m!788211 () Bool)

(assert (=> b!847817 m!788211))

(declare-fun m!788213 () Bool)

(assert (=> b!847817 m!788213))

(declare-fun m!788215 () Bool)

(assert (=> b!847823 m!788215))

(declare-fun m!788217 () Bool)

(assert (=> b!847819 m!788217))

(check-sat tp_is_empty!16045 (not bm!37554) (not b!847820) (not b!847816) (not b!847811) (not start!72976) (not b_next!13909) (not mapNonEmpty!25667) b_and!22969 (not b!847817) (not b!847815) (not b!847823) (not bm!37553) (not b!847824))
(check-sat b_and!22969 (not b_next!13909))
