; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75166 () Bool)

(assert start!75166)

(declare-fun b_free!15487 () Bool)

(declare-fun b_next!15487 () Bool)

(assert (=> start!75166 (= b_free!15487 (not b_next!15487))))

(declare-fun tp!54168 () Bool)

(declare-fun b_and!25687 () Bool)

(assert (=> start!75166 (= tp!54168 b_and!25687)))

(declare-fun res!601389 () Bool)

(declare-fun e!492951 () Bool)

(assert (=> start!75166 (=> (not res!601389) (not e!492951))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51629 0))(
  ( (array!51630 (arr!24828 (Array (_ BitVec 32) (_ BitVec 64))) (size!25269 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51629)

(assert (=> start!75166 (= res!601389 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25269 _keys!868))))))

(assert (=> start!75166 e!492951))

(declare-fun tp_is_empty!17731 () Bool)

(assert (=> start!75166 tp_is_empty!17731))

(assert (=> start!75166 true))

(assert (=> start!75166 tp!54168))

(declare-fun array_inv!19584 (array!51629) Bool)

(assert (=> start!75166 (array_inv!19584 _keys!868)))

(declare-datatypes ((V!28689 0))(
  ( (V!28690 (val!8913 Int)) )
))
(declare-datatypes ((ValueCell!8426 0))(
  ( (ValueCellFull!8426 (v!11386 V!28689)) (EmptyCell!8426) )
))
(declare-datatypes ((array!51631 0))(
  ( (array!51632 (arr!24829 (Array (_ BitVec 32) ValueCell!8426)) (size!25270 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51631)

(declare-fun e!492950 () Bool)

(declare-fun array_inv!19585 (array!51631) Bool)

(assert (=> start!75166 (and (array_inv!19585 _values!688) e!492950)))

(declare-fun b!885652 () Bool)

(declare-fun res!601383 () Bool)

(assert (=> b!885652 (=> (not res!601383) (not e!492951))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!885652 (= res!601383 (validMask!0 mask!1196))))

(declare-fun b!885653 () Bool)

(declare-fun res!601388 () Bool)

(assert (=> b!885653 (=> (not res!601388) (not e!492951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51629 (_ BitVec 32)) Bool)

(assert (=> b!885653 (= res!601388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!885654 () Bool)

(declare-fun res!601387 () Bool)

(assert (=> b!885654 (=> (not res!601387) (not e!492951))))

(declare-datatypes ((List!17585 0))(
  ( (Nil!17582) (Cons!17581 (h!18718 (_ BitVec 64)) (t!24852 List!17585)) )
))
(declare-fun arrayNoDuplicates!0 (array!51629 (_ BitVec 32) List!17585) Bool)

(assert (=> b!885654 (= res!601387 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17582))))

(declare-fun b!885655 () Bool)

(declare-fun res!601385 () Bool)

(assert (=> b!885655 (=> (not res!601385) (not e!492951))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!885655 (= res!601385 (validKeyInArray!0 k0!854))))

(declare-fun b!885656 () Bool)

(declare-fun res!601382 () Bool)

(assert (=> b!885656 (=> (not res!601382) (not e!492951))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!885656 (= res!601382 (and (= (size!25270 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25269 _keys!868) (size!25270 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!11754 0))(
  ( (tuple2!11755 (_1!5888 (_ BitVec 64)) (_2!5888 V!28689)) )
))
(declare-datatypes ((List!17586 0))(
  ( (Nil!17583) (Cons!17582 (h!18719 tuple2!11754) (t!24853 List!17586)) )
))
(declare-datatypes ((ListLongMap!10525 0))(
  ( (ListLongMap!10526 (toList!5278 List!17586)) )
))
(declare-fun lt!401138 () ListLongMap!10525)

(declare-fun e!492952 () Bool)

(declare-fun lt!401137 () ListLongMap!10525)

(declare-fun b!885657 () Bool)

(declare-fun lt!401139 () tuple2!11754)

(declare-fun +!2590 (ListLongMap!10525 tuple2!11754) ListLongMap!10525)

(assert (=> b!885657 (= e!492952 (= lt!401138 (+!2590 lt!401137 lt!401139)))))

(declare-fun b!885658 () Bool)

(declare-fun e!492954 () Bool)

(assert (=> b!885658 (= e!492954 (not e!492952))))

(declare-fun res!601390 () Bool)

(assert (=> b!885658 (=> res!601390 e!492952)))

(assert (=> b!885658 (= res!601390 (validKeyInArray!0 (select (arr!24828 _keys!868) from!1053)))))

(declare-fun lt!401140 () array!51631)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28689)

(declare-fun zeroValue!654 () V!28689)

(declare-fun getCurrentListMapNoExtraKeys!3314 (array!51629 array!51631 (_ BitVec 32) (_ BitVec 32) V!28689 V!28689 (_ BitVec 32) Int) ListLongMap!10525)

(assert (=> b!885658 (= (getCurrentListMapNoExtraKeys!3314 _keys!868 lt!401140 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2590 (getCurrentListMapNoExtraKeys!3314 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!401139))))

(declare-fun v!557 () V!28689)

(assert (=> b!885658 (= lt!401139 (tuple2!11755 k0!854 v!557))))

(declare-datatypes ((Unit!30194 0))(
  ( (Unit!30195) )
))
(declare-fun lt!401136 () Unit!30194)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!751 (array!51629 array!51631 (_ BitVec 32) (_ BitVec 32) V!28689 V!28689 (_ BitVec 32) (_ BitVec 64) V!28689 (_ BitVec 32) Int) Unit!30194)

(assert (=> b!885658 (= lt!401136 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!751 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!28236 () Bool)

(declare-fun mapRes!28236 () Bool)

(assert (=> mapIsEmpty!28236 mapRes!28236))

(declare-fun b!885659 () Bool)

(assert (=> b!885659 (= e!492951 e!492954)))

(declare-fun res!601381 () Bool)

(assert (=> b!885659 (=> (not res!601381) (not e!492954))))

(assert (=> b!885659 (= res!601381 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!885659 (= lt!401138 (getCurrentListMapNoExtraKeys!3314 _keys!868 lt!401140 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!885659 (= lt!401140 (array!51632 (store (arr!24829 _values!688) i!612 (ValueCellFull!8426 v!557)) (size!25270 _values!688)))))

(assert (=> b!885659 (= lt!401137 (getCurrentListMapNoExtraKeys!3314 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!885660 () Bool)

(declare-fun res!601386 () Bool)

(assert (=> b!885660 (=> (not res!601386) (not e!492951))))

(assert (=> b!885660 (= res!601386 (and (= (select (arr!24828 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!885661 () Bool)

(declare-fun e!492956 () Bool)

(assert (=> b!885661 (= e!492956 tp_is_empty!17731)))

(declare-fun b!885662 () Bool)

(declare-fun e!492955 () Bool)

(assert (=> b!885662 (= e!492955 tp_is_empty!17731)))

(declare-fun mapNonEmpty!28236 () Bool)

(declare-fun tp!54167 () Bool)

(assert (=> mapNonEmpty!28236 (= mapRes!28236 (and tp!54167 e!492955))))

(declare-fun mapRest!28236 () (Array (_ BitVec 32) ValueCell!8426))

(declare-fun mapValue!28236 () ValueCell!8426)

(declare-fun mapKey!28236 () (_ BitVec 32))

(assert (=> mapNonEmpty!28236 (= (arr!24829 _values!688) (store mapRest!28236 mapKey!28236 mapValue!28236))))

(declare-fun b!885663 () Bool)

(declare-fun res!601384 () Bool)

(assert (=> b!885663 (=> (not res!601384) (not e!492951))))

(assert (=> b!885663 (= res!601384 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25269 _keys!868))))))

(declare-fun b!885664 () Bool)

(assert (=> b!885664 (= e!492950 (and e!492956 mapRes!28236))))

(declare-fun condMapEmpty!28236 () Bool)

(declare-fun mapDefault!28236 () ValueCell!8426)

(assert (=> b!885664 (= condMapEmpty!28236 (= (arr!24829 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8426)) mapDefault!28236)))))

(assert (= (and start!75166 res!601389) b!885652))

(assert (= (and b!885652 res!601383) b!885656))

(assert (= (and b!885656 res!601382) b!885653))

(assert (= (and b!885653 res!601388) b!885654))

(assert (= (and b!885654 res!601387) b!885663))

(assert (= (and b!885663 res!601384) b!885655))

(assert (= (and b!885655 res!601385) b!885660))

(assert (= (and b!885660 res!601386) b!885659))

(assert (= (and b!885659 res!601381) b!885658))

(assert (= (and b!885658 (not res!601390)) b!885657))

(assert (= (and b!885664 condMapEmpty!28236) mapIsEmpty!28236))

(assert (= (and b!885664 (not condMapEmpty!28236)) mapNonEmpty!28236))

(get-info :version)

(assert (= (and mapNonEmpty!28236 ((_ is ValueCellFull!8426) mapValue!28236)) b!885662))

(assert (= (and b!885664 ((_ is ValueCellFull!8426) mapDefault!28236)) b!885661))

(assert (= start!75166 b!885664))

(declare-fun m!826265 () Bool)

(assert (=> b!885652 m!826265))

(declare-fun m!826267 () Bool)

(assert (=> b!885657 m!826267))

(declare-fun m!826269 () Bool)

(assert (=> b!885653 m!826269))

(declare-fun m!826271 () Bool)

(assert (=> b!885655 m!826271))

(declare-fun m!826273 () Bool)

(assert (=> b!885654 m!826273))

(declare-fun m!826275 () Bool)

(assert (=> b!885659 m!826275))

(declare-fun m!826277 () Bool)

(assert (=> b!885659 m!826277))

(declare-fun m!826279 () Bool)

(assert (=> b!885659 m!826279))

(declare-fun m!826281 () Bool)

(assert (=> mapNonEmpty!28236 m!826281))

(declare-fun m!826283 () Bool)

(assert (=> start!75166 m!826283))

(declare-fun m!826285 () Bool)

(assert (=> start!75166 m!826285))

(declare-fun m!826287 () Bool)

(assert (=> b!885660 m!826287))

(declare-fun m!826289 () Bool)

(assert (=> b!885658 m!826289))

(declare-fun m!826291 () Bool)

(assert (=> b!885658 m!826291))

(declare-fun m!826293 () Bool)

(assert (=> b!885658 m!826293))

(assert (=> b!885658 m!826289))

(declare-fun m!826295 () Bool)

(assert (=> b!885658 m!826295))

(declare-fun m!826297 () Bool)

(assert (=> b!885658 m!826297))

(assert (=> b!885658 m!826295))

(declare-fun m!826299 () Bool)

(assert (=> b!885658 m!826299))

(check-sat (not b!885659) b_and!25687 (not b!885655) (not b!885658) (not b!885657) (not mapNonEmpty!28236) tp_is_empty!17731 (not b_next!15487) (not b!885652) (not start!75166) (not b!885653) (not b!885654))
(check-sat b_and!25687 (not b_next!15487))
(get-model)

(declare-fun d!109583 () Bool)

(assert (=> d!109583 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!885652 d!109583))

(declare-fun d!109585 () Bool)

(declare-fun e!493001 () Bool)

(assert (=> d!109585 e!493001))

(declare-fun res!601455 () Bool)

(assert (=> d!109585 (=> (not res!601455) (not e!493001))))

(declare-fun lt!401182 () ListLongMap!10525)

(declare-fun contains!4260 (ListLongMap!10525 (_ BitVec 64)) Bool)

(assert (=> d!109585 (= res!601455 (contains!4260 lt!401182 (_1!5888 lt!401139)))))

(declare-fun lt!401180 () List!17586)

(assert (=> d!109585 (= lt!401182 (ListLongMap!10526 lt!401180))))

(declare-fun lt!401181 () Unit!30194)

(declare-fun lt!401179 () Unit!30194)

(assert (=> d!109585 (= lt!401181 lt!401179)))

(declare-datatypes ((Option!435 0))(
  ( (Some!434 (v!11392 V!28689)) (None!433) )
))
(declare-fun getValueByKey!429 (List!17586 (_ BitVec 64)) Option!435)

(assert (=> d!109585 (= (getValueByKey!429 lt!401180 (_1!5888 lt!401139)) (Some!434 (_2!5888 lt!401139)))))

(declare-fun lemmaContainsTupThenGetReturnValue!243 (List!17586 (_ BitVec 64) V!28689) Unit!30194)

(assert (=> d!109585 (= lt!401179 (lemmaContainsTupThenGetReturnValue!243 lt!401180 (_1!5888 lt!401139) (_2!5888 lt!401139)))))

(declare-fun insertStrictlySorted!282 (List!17586 (_ BitVec 64) V!28689) List!17586)

(assert (=> d!109585 (= lt!401180 (insertStrictlySorted!282 (toList!5278 lt!401137) (_1!5888 lt!401139) (_2!5888 lt!401139)))))

(assert (=> d!109585 (= (+!2590 lt!401137 lt!401139) lt!401182)))

(declare-fun b!885747 () Bool)

(declare-fun res!601456 () Bool)

(assert (=> b!885747 (=> (not res!601456) (not e!493001))))

(assert (=> b!885747 (= res!601456 (= (getValueByKey!429 (toList!5278 lt!401182) (_1!5888 lt!401139)) (Some!434 (_2!5888 lt!401139))))))

(declare-fun b!885748 () Bool)

(declare-fun contains!4261 (List!17586 tuple2!11754) Bool)

(assert (=> b!885748 (= e!493001 (contains!4261 (toList!5278 lt!401182) lt!401139))))

(assert (= (and d!109585 res!601455) b!885747))

(assert (= (and b!885747 res!601456) b!885748))

(declare-fun m!826373 () Bool)

(assert (=> d!109585 m!826373))

(declare-fun m!826375 () Bool)

(assert (=> d!109585 m!826375))

(declare-fun m!826377 () Bool)

(assert (=> d!109585 m!826377))

(declare-fun m!826379 () Bool)

(assert (=> d!109585 m!826379))

(declare-fun m!826381 () Bool)

(assert (=> b!885747 m!826381))

(declare-fun m!826383 () Bool)

(assert (=> b!885748 m!826383))

(assert (=> b!885657 d!109585))

(declare-fun d!109587 () Bool)

(assert (=> d!109587 (= (array_inv!19584 _keys!868) (bvsge (size!25269 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!75166 d!109587))

(declare-fun d!109589 () Bool)

(assert (=> d!109589 (= (array_inv!19585 _values!688) (bvsge (size!25270 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!75166 d!109589))

(declare-fun e!493021 () Bool)

(declare-fun lt!401197 () ListLongMap!10525)

(declare-fun b!885773 () Bool)

(assert (=> b!885773 (= e!493021 (= lt!401197 (getCurrentListMapNoExtraKeys!3314 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!885774 () Bool)

(declare-fun res!601467 () Bool)

(declare-fun e!493020 () Bool)

(assert (=> b!885774 (=> (not res!601467) (not e!493020))))

(assert (=> b!885774 (= res!601467 (not (contains!4260 lt!401197 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!39049 () Bool)

(declare-fun call!39052 () ListLongMap!10525)

(assert (=> bm!39049 (= call!39052 (getCurrentListMapNoExtraKeys!3314 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun d!109591 () Bool)

(assert (=> d!109591 e!493020))

(declare-fun res!601466 () Bool)

(assert (=> d!109591 (=> (not res!601466) (not e!493020))))

(assert (=> d!109591 (= res!601466 (not (contains!4260 lt!401197 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!493016 () ListLongMap!10525)

(assert (=> d!109591 (= lt!401197 e!493016)))

(declare-fun c!93443 () Bool)

(assert (=> d!109591 (= c!93443 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25269 _keys!868)))))

(assert (=> d!109591 (validMask!0 mask!1196)))

(assert (=> d!109591 (= (getCurrentListMapNoExtraKeys!3314 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!401197)))

(declare-fun b!885775 () Bool)

(declare-fun e!493022 () Bool)

(declare-fun e!493019 () Bool)

(assert (=> b!885775 (= e!493022 e!493019)))

(assert (=> b!885775 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25269 _keys!868)))))

(declare-fun res!601465 () Bool)

(assert (=> b!885775 (= res!601465 (contains!4260 lt!401197 (select (arr!24828 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!885775 (=> (not res!601465) (not e!493019))))

(declare-fun b!885776 () Bool)

(declare-fun e!493017 () Bool)

(assert (=> b!885776 (= e!493017 (validKeyInArray!0 (select (arr!24828 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!885776 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!885777 () Bool)

(declare-fun e!493018 () ListLongMap!10525)

(assert (=> b!885777 (= e!493016 e!493018)))

(declare-fun c!93445 () Bool)

(assert (=> b!885777 (= c!93445 (validKeyInArray!0 (select (arr!24828 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!885778 () Bool)

(assert (=> b!885778 (= e!493018 call!39052)))

(declare-fun b!885779 () Bool)

(assert (=> b!885779 (= e!493020 e!493022)))

(declare-fun c!93446 () Bool)

(assert (=> b!885779 (= c!93446 e!493017)))

(declare-fun res!601468 () Bool)

(assert (=> b!885779 (=> (not res!601468) (not e!493017))))

(assert (=> b!885779 (= res!601468 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25269 _keys!868)))))

(declare-fun b!885780 () Bool)

(assert (=> b!885780 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25269 _keys!868)))))

(assert (=> b!885780 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25270 _values!688)))))

(declare-fun apply!386 (ListLongMap!10525 (_ BitVec 64)) V!28689)

(declare-fun get!13104 (ValueCell!8426 V!28689) V!28689)

(declare-fun dynLambda!1301 (Int (_ BitVec 64)) V!28689)

(assert (=> b!885780 (= e!493019 (= (apply!386 lt!401197 (select (arr!24828 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13104 (select (arr!24829 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1301 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!885781 () Bool)

(declare-fun isEmpty!679 (ListLongMap!10525) Bool)

(assert (=> b!885781 (= e!493021 (isEmpty!679 lt!401197))))

(declare-fun b!885782 () Bool)

(declare-fun lt!401200 () Unit!30194)

(declare-fun lt!401202 () Unit!30194)

(assert (=> b!885782 (= lt!401200 lt!401202)))

(declare-fun lt!401203 () (_ BitVec 64))

(declare-fun lt!401198 () V!28689)

(declare-fun lt!401201 () (_ BitVec 64))

(declare-fun lt!401199 () ListLongMap!10525)

(assert (=> b!885782 (not (contains!4260 (+!2590 lt!401199 (tuple2!11755 lt!401201 lt!401198)) lt!401203))))

(declare-fun addStillNotContains!213 (ListLongMap!10525 (_ BitVec 64) V!28689 (_ BitVec 64)) Unit!30194)

(assert (=> b!885782 (= lt!401202 (addStillNotContains!213 lt!401199 lt!401201 lt!401198 lt!401203))))

(assert (=> b!885782 (= lt!401203 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!885782 (= lt!401198 (get!13104 (select (arr!24829 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1301 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!885782 (= lt!401201 (select (arr!24828 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!885782 (= lt!401199 call!39052)))

(assert (=> b!885782 (= e!493018 (+!2590 call!39052 (tuple2!11755 (select (arr!24828 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13104 (select (arr!24829 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1301 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!885783 () Bool)

(assert (=> b!885783 (= e!493022 e!493021)))

(declare-fun c!93444 () Bool)

(assert (=> b!885783 (= c!93444 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25269 _keys!868)))))

(declare-fun b!885784 () Bool)

(assert (=> b!885784 (= e!493016 (ListLongMap!10526 Nil!17583))))

(assert (= (and d!109591 c!93443) b!885784))

(assert (= (and d!109591 (not c!93443)) b!885777))

(assert (= (and b!885777 c!93445) b!885782))

(assert (= (and b!885777 (not c!93445)) b!885778))

(assert (= (or b!885782 b!885778) bm!39049))

(assert (= (and d!109591 res!601466) b!885774))

(assert (= (and b!885774 res!601467) b!885779))

(assert (= (and b!885779 res!601468) b!885776))

(assert (= (and b!885779 c!93446) b!885775))

(assert (= (and b!885779 (not c!93446)) b!885783))

(assert (= (and b!885775 res!601465) b!885780))

(assert (= (and b!885783 c!93444) b!885773))

(assert (= (and b!885783 (not c!93444)) b!885781))

(declare-fun b_lambda!12801 () Bool)

(assert (=> (not b_lambda!12801) (not b!885780)))

(declare-fun t!24855 () Bool)

(declare-fun tb!5125 () Bool)

(assert (=> (and start!75166 (= defaultEntry!696 defaultEntry!696) t!24855) tb!5125))

(declare-fun result!9895 () Bool)

(assert (=> tb!5125 (= result!9895 tp_is_empty!17731)))

(assert (=> b!885780 t!24855))

(declare-fun b_and!25693 () Bool)

(assert (= b_and!25687 (and (=> t!24855 result!9895) b_and!25693)))

(declare-fun b_lambda!12803 () Bool)

(assert (=> (not b_lambda!12803) (not b!885782)))

(assert (=> b!885782 t!24855))

(declare-fun b_and!25695 () Bool)

(assert (= b_and!25693 (and (=> t!24855 result!9895) b_and!25695)))

(declare-fun m!826385 () Bool)

(assert (=> b!885776 m!826385))

(assert (=> b!885776 m!826385))

(declare-fun m!826387 () Bool)

(assert (=> b!885776 m!826387))

(declare-fun m!826389 () Bool)

(assert (=> b!885773 m!826389))

(declare-fun m!826391 () Bool)

(assert (=> b!885774 m!826391))

(assert (=> b!885780 m!826385))

(declare-fun m!826393 () Bool)

(assert (=> b!885780 m!826393))

(declare-fun m!826395 () Bool)

(assert (=> b!885780 m!826395))

(declare-fun m!826397 () Bool)

(assert (=> b!885780 m!826397))

(assert (=> b!885780 m!826393))

(assert (=> b!885780 m!826385))

(declare-fun m!826399 () Bool)

(assert (=> b!885780 m!826399))

(assert (=> b!885780 m!826395))

(assert (=> b!885777 m!826385))

(assert (=> b!885777 m!826385))

(assert (=> b!885777 m!826387))

(declare-fun m!826401 () Bool)

(assert (=> d!109591 m!826401))

(assert (=> d!109591 m!826265))

(declare-fun m!826403 () Bool)

(assert (=> b!885781 m!826403))

(assert (=> b!885775 m!826385))

(assert (=> b!885775 m!826385))

(declare-fun m!826405 () Bool)

(assert (=> b!885775 m!826405))

(assert (=> b!885782 m!826395))

(assert (=> b!885782 m!826385))

(declare-fun m!826407 () Bool)

(assert (=> b!885782 m!826407))

(declare-fun m!826409 () Bool)

(assert (=> b!885782 m!826409))

(assert (=> b!885782 m!826393))

(assert (=> b!885782 m!826395))

(assert (=> b!885782 m!826397))

(assert (=> b!885782 m!826393))

(assert (=> b!885782 m!826407))

(declare-fun m!826411 () Bool)

(assert (=> b!885782 m!826411))

(declare-fun m!826413 () Bool)

(assert (=> b!885782 m!826413))

(assert (=> bm!39049 m!826389))

(assert (=> b!885658 d!109591))

(declare-fun d!109593 () Bool)

(declare-fun e!493023 () Bool)

(assert (=> d!109593 e!493023))

(declare-fun res!601469 () Bool)

(assert (=> d!109593 (=> (not res!601469) (not e!493023))))

(declare-fun lt!401207 () ListLongMap!10525)

(assert (=> d!109593 (= res!601469 (contains!4260 lt!401207 (_1!5888 lt!401139)))))

(declare-fun lt!401205 () List!17586)

(assert (=> d!109593 (= lt!401207 (ListLongMap!10526 lt!401205))))

(declare-fun lt!401206 () Unit!30194)

(declare-fun lt!401204 () Unit!30194)

(assert (=> d!109593 (= lt!401206 lt!401204)))

(assert (=> d!109593 (= (getValueByKey!429 lt!401205 (_1!5888 lt!401139)) (Some!434 (_2!5888 lt!401139)))))

(assert (=> d!109593 (= lt!401204 (lemmaContainsTupThenGetReturnValue!243 lt!401205 (_1!5888 lt!401139) (_2!5888 lt!401139)))))

(assert (=> d!109593 (= lt!401205 (insertStrictlySorted!282 (toList!5278 (getCurrentListMapNoExtraKeys!3314 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696)) (_1!5888 lt!401139) (_2!5888 lt!401139)))))

(assert (=> d!109593 (= (+!2590 (getCurrentListMapNoExtraKeys!3314 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!401139) lt!401207)))

(declare-fun b!885787 () Bool)

(declare-fun res!601470 () Bool)

(assert (=> b!885787 (=> (not res!601470) (not e!493023))))

(assert (=> b!885787 (= res!601470 (= (getValueByKey!429 (toList!5278 lt!401207) (_1!5888 lt!401139)) (Some!434 (_2!5888 lt!401139))))))

(declare-fun b!885788 () Bool)

(assert (=> b!885788 (= e!493023 (contains!4261 (toList!5278 lt!401207) lt!401139))))

(assert (= (and d!109593 res!601469) b!885787))

(assert (= (and b!885787 res!601470) b!885788))

(declare-fun m!826415 () Bool)

(assert (=> d!109593 m!826415))

(declare-fun m!826417 () Bool)

(assert (=> d!109593 m!826417))

(declare-fun m!826419 () Bool)

(assert (=> d!109593 m!826419))

(declare-fun m!826421 () Bool)

(assert (=> d!109593 m!826421))

(declare-fun m!826423 () Bool)

(assert (=> b!885787 m!826423))

(declare-fun m!826425 () Bool)

(assert (=> b!885788 m!826425))

(assert (=> b!885658 d!109593))

(declare-fun d!109595 () Bool)

(assert (=> d!109595 (= (validKeyInArray!0 (select (arr!24828 _keys!868) from!1053)) (and (not (= (select (arr!24828 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24828 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!885658 d!109595))

(declare-fun e!493029 () Bool)

(declare-fun lt!401208 () ListLongMap!10525)

(declare-fun b!885789 () Bool)

(assert (=> b!885789 (= e!493029 (= lt!401208 (getCurrentListMapNoExtraKeys!3314 _keys!868 lt!401140 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!885790 () Bool)

(declare-fun res!601473 () Bool)

(declare-fun e!493028 () Bool)

(assert (=> b!885790 (=> (not res!601473) (not e!493028))))

(assert (=> b!885790 (= res!601473 (not (contains!4260 lt!401208 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!39050 () Bool)

(declare-fun call!39053 () ListLongMap!10525)

(assert (=> bm!39050 (= call!39053 (getCurrentListMapNoExtraKeys!3314 _keys!868 lt!401140 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun d!109597 () Bool)

(assert (=> d!109597 e!493028))

(declare-fun res!601472 () Bool)

(assert (=> d!109597 (=> (not res!601472) (not e!493028))))

(assert (=> d!109597 (= res!601472 (not (contains!4260 lt!401208 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!493024 () ListLongMap!10525)

(assert (=> d!109597 (= lt!401208 e!493024)))

(declare-fun c!93447 () Bool)

(assert (=> d!109597 (= c!93447 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25269 _keys!868)))))

(assert (=> d!109597 (validMask!0 mask!1196)))

(assert (=> d!109597 (= (getCurrentListMapNoExtraKeys!3314 _keys!868 lt!401140 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!401208)))

(declare-fun b!885791 () Bool)

(declare-fun e!493030 () Bool)

(declare-fun e!493027 () Bool)

(assert (=> b!885791 (= e!493030 e!493027)))

(assert (=> b!885791 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25269 _keys!868)))))

(declare-fun res!601471 () Bool)

(assert (=> b!885791 (= res!601471 (contains!4260 lt!401208 (select (arr!24828 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!885791 (=> (not res!601471) (not e!493027))))

(declare-fun b!885792 () Bool)

(declare-fun e!493025 () Bool)

(assert (=> b!885792 (= e!493025 (validKeyInArray!0 (select (arr!24828 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!885792 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!885793 () Bool)

(declare-fun e!493026 () ListLongMap!10525)

(assert (=> b!885793 (= e!493024 e!493026)))

(declare-fun c!93449 () Bool)

(assert (=> b!885793 (= c!93449 (validKeyInArray!0 (select (arr!24828 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!885794 () Bool)

(assert (=> b!885794 (= e!493026 call!39053)))

(declare-fun b!885795 () Bool)

(assert (=> b!885795 (= e!493028 e!493030)))

(declare-fun c!93450 () Bool)

(assert (=> b!885795 (= c!93450 e!493025)))

(declare-fun res!601474 () Bool)

(assert (=> b!885795 (=> (not res!601474) (not e!493025))))

(assert (=> b!885795 (= res!601474 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25269 _keys!868)))))

(declare-fun b!885796 () Bool)

(assert (=> b!885796 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25269 _keys!868)))))

(assert (=> b!885796 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25270 lt!401140)))))

(assert (=> b!885796 (= e!493027 (= (apply!386 lt!401208 (select (arr!24828 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13104 (select (arr!24829 lt!401140) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1301 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!885797 () Bool)

(assert (=> b!885797 (= e!493029 (isEmpty!679 lt!401208))))

(declare-fun b!885798 () Bool)

(declare-fun lt!401211 () Unit!30194)

(declare-fun lt!401213 () Unit!30194)

(assert (=> b!885798 (= lt!401211 lt!401213)))

(declare-fun lt!401214 () (_ BitVec 64))

(declare-fun lt!401209 () V!28689)

(declare-fun lt!401210 () ListLongMap!10525)

(declare-fun lt!401212 () (_ BitVec 64))

(assert (=> b!885798 (not (contains!4260 (+!2590 lt!401210 (tuple2!11755 lt!401212 lt!401209)) lt!401214))))

(assert (=> b!885798 (= lt!401213 (addStillNotContains!213 lt!401210 lt!401212 lt!401209 lt!401214))))

(assert (=> b!885798 (= lt!401214 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!885798 (= lt!401209 (get!13104 (select (arr!24829 lt!401140) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1301 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!885798 (= lt!401212 (select (arr!24828 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!885798 (= lt!401210 call!39053)))

(assert (=> b!885798 (= e!493026 (+!2590 call!39053 (tuple2!11755 (select (arr!24828 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13104 (select (arr!24829 lt!401140) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1301 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!885799 () Bool)

(assert (=> b!885799 (= e!493030 e!493029)))

(declare-fun c!93448 () Bool)

(assert (=> b!885799 (= c!93448 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25269 _keys!868)))))

(declare-fun b!885800 () Bool)

(assert (=> b!885800 (= e!493024 (ListLongMap!10526 Nil!17583))))

(assert (= (and d!109597 c!93447) b!885800))

(assert (= (and d!109597 (not c!93447)) b!885793))

(assert (= (and b!885793 c!93449) b!885798))

(assert (= (and b!885793 (not c!93449)) b!885794))

(assert (= (or b!885798 b!885794) bm!39050))

(assert (= (and d!109597 res!601472) b!885790))

(assert (= (and b!885790 res!601473) b!885795))

(assert (= (and b!885795 res!601474) b!885792))

(assert (= (and b!885795 c!93450) b!885791))

(assert (= (and b!885795 (not c!93450)) b!885799))

(assert (= (and b!885791 res!601471) b!885796))

(assert (= (and b!885799 c!93448) b!885789))

(assert (= (and b!885799 (not c!93448)) b!885797))

(declare-fun b_lambda!12805 () Bool)

(assert (=> (not b_lambda!12805) (not b!885796)))

(assert (=> b!885796 t!24855))

(declare-fun b_and!25697 () Bool)

(assert (= b_and!25695 (and (=> t!24855 result!9895) b_and!25697)))

(declare-fun b_lambda!12807 () Bool)

(assert (=> (not b_lambda!12807) (not b!885798)))

(assert (=> b!885798 t!24855))

(declare-fun b_and!25699 () Bool)

(assert (= b_and!25697 (and (=> t!24855 result!9895) b_and!25699)))

(assert (=> b!885792 m!826385))

(assert (=> b!885792 m!826385))

(assert (=> b!885792 m!826387))

(declare-fun m!826427 () Bool)

(assert (=> b!885789 m!826427))

(declare-fun m!826429 () Bool)

(assert (=> b!885790 m!826429))

(assert (=> b!885796 m!826385))

(declare-fun m!826431 () Bool)

(assert (=> b!885796 m!826431))

(assert (=> b!885796 m!826395))

(declare-fun m!826433 () Bool)

(assert (=> b!885796 m!826433))

(assert (=> b!885796 m!826431))

(assert (=> b!885796 m!826385))

(declare-fun m!826435 () Bool)

(assert (=> b!885796 m!826435))

(assert (=> b!885796 m!826395))

(assert (=> b!885793 m!826385))

(assert (=> b!885793 m!826385))

(assert (=> b!885793 m!826387))

(declare-fun m!826437 () Bool)

(assert (=> d!109597 m!826437))

(assert (=> d!109597 m!826265))

(declare-fun m!826439 () Bool)

(assert (=> b!885797 m!826439))

(assert (=> b!885791 m!826385))

(assert (=> b!885791 m!826385))

(declare-fun m!826441 () Bool)

(assert (=> b!885791 m!826441))

(assert (=> b!885798 m!826395))

(assert (=> b!885798 m!826385))

(declare-fun m!826443 () Bool)

(assert (=> b!885798 m!826443))

(declare-fun m!826445 () Bool)

(assert (=> b!885798 m!826445))

(assert (=> b!885798 m!826431))

(assert (=> b!885798 m!826395))

(assert (=> b!885798 m!826433))

(assert (=> b!885798 m!826431))

(assert (=> b!885798 m!826443))

(declare-fun m!826447 () Bool)

(assert (=> b!885798 m!826447))

(declare-fun m!826449 () Bool)

(assert (=> b!885798 m!826449))

(assert (=> bm!39050 m!826427))

(assert (=> b!885658 d!109597))

(declare-fun bm!39055 () Bool)

(declare-fun call!39058 () ListLongMap!10525)

(assert (=> bm!39055 (= call!39058 (getCurrentListMapNoExtraKeys!3314 _keys!868 (array!51632 (store (arr!24829 _values!688) i!612 (ValueCellFull!8426 v!557)) (size!25270 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!885808 () Bool)

(declare-fun e!493035 () Bool)

(declare-fun call!39059 () ListLongMap!10525)

(assert (=> b!885808 (= e!493035 (= call!39058 call!39059))))

(declare-fun b!885809 () Bool)

(declare-fun e!493036 () Bool)

(assert (=> b!885809 (= e!493036 e!493035)))

(declare-fun c!93453 () Bool)

(assert (=> b!885809 (= c!93453 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun bm!39056 () Bool)

(assert (=> bm!39056 (= call!39059 (getCurrentListMapNoExtraKeys!3314 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!885807 () Bool)

(assert (=> b!885807 (= e!493035 (= call!39058 (+!2590 call!39059 (tuple2!11755 k0!854 v!557))))))

(declare-fun d!109599 () Bool)

(assert (=> d!109599 e!493036))

(declare-fun res!601477 () Bool)

(assert (=> d!109599 (=> (not res!601477) (not e!493036))))

(assert (=> d!109599 (= res!601477 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25270 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25270 _values!688))))))))

(declare-fun lt!401217 () Unit!30194)

(declare-fun choose!1449 (array!51629 array!51631 (_ BitVec 32) (_ BitVec 32) V!28689 V!28689 (_ BitVec 32) (_ BitVec 64) V!28689 (_ BitVec 32) Int) Unit!30194)

(assert (=> d!109599 (= lt!401217 (choose!1449 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!109599 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25269 _keys!868)))))

(assert (=> d!109599 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!751 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!401217)))

(assert (= (and d!109599 res!601477) b!885809))

(assert (= (and b!885809 c!93453) b!885807))

(assert (= (and b!885809 (not c!93453)) b!885808))

(assert (= (or b!885807 b!885808) bm!39056))

(assert (= (or b!885807 b!885808) bm!39055))

(assert (=> bm!39055 m!826277))

(declare-fun m!826451 () Bool)

(assert (=> bm!39055 m!826451))

(assert (=> bm!39056 m!826289))

(declare-fun m!826453 () Bool)

(assert (=> b!885807 m!826453))

(declare-fun m!826455 () Bool)

(assert (=> d!109599 m!826455))

(assert (=> b!885658 d!109599))

(declare-fun lt!401218 () ListLongMap!10525)

(declare-fun b!885810 () Bool)

(declare-fun e!493042 () Bool)

(assert (=> b!885810 (= e!493042 (= lt!401218 (getCurrentListMapNoExtraKeys!3314 _keys!868 lt!401140 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!885811 () Bool)

(declare-fun res!601480 () Bool)

(declare-fun e!493041 () Bool)

(assert (=> b!885811 (=> (not res!601480) (not e!493041))))

(assert (=> b!885811 (= res!601480 (not (contains!4260 lt!401218 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!39057 () Bool)

(declare-fun call!39060 () ListLongMap!10525)

(assert (=> bm!39057 (= call!39060 (getCurrentListMapNoExtraKeys!3314 _keys!868 lt!401140 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun d!109601 () Bool)

(assert (=> d!109601 e!493041))

(declare-fun res!601479 () Bool)

(assert (=> d!109601 (=> (not res!601479) (not e!493041))))

(assert (=> d!109601 (= res!601479 (not (contains!4260 lt!401218 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!493037 () ListLongMap!10525)

(assert (=> d!109601 (= lt!401218 e!493037)))

(declare-fun c!93454 () Bool)

(assert (=> d!109601 (= c!93454 (bvsge from!1053 (size!25269 _keys!868)))))

(assert (=> d!109601 (validMask!0 mask!1196)))

(assert (=> d!109601 (= (getCurrentListMapNoExtraKeys!3314 _keys!868 lt!401140 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!401218)))

(declare-fun b!885812 () Bool)

(declare-fun e!493043 () Bool)

(declare-fun e!493040 () Bool)

(assert (=> b!885812 (= e!493043 e!493040)))

(assert (=> b!885812 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25269 _keys!868)))))

(declare-fun res!601478 () Bool)

(assert (=> b!885812 (= res!601478 (contains!4260 lt!401218 (select (arr!24828 _keys!868) from!1053)))))

(assert (=> b!885812 (=> (not res!601478) (not e!493040))))

(declare-fun b!885813 () Bool)

(declare-fun e!493038 () Bool)

(assert (=> b!885813 (= e!493038 (validKeyInArray!0 (select (arr!24828 _keys!868) from!1053)))))

(assert (=> b!885813 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!885814 () Bool)

(declare-fun e!493039 () ListLongMap!10525)

(assert (=> b!885814 (= e!493037 e!493039)))

(declare-fun c!93456 () Bool)

(assert (=> b!885814 (= c!93456 (validKeyInArray!0 (select (arr!24828 _keys!868) from!1053)))))

(declare-fun b!885815 () Bool)

(assert (=> b!885815 (= e!493039 call!39060)))

(declare-fun b!885816 () Bool)

(assert (=> b!885816 (= e!493041 e!493043)))

(declare-fun c!93457 () Bool)

(assert (=> b!885816 (= c!93457 e!493038)))

(declare-fun res!601481 () Bool)

(assert (=> b!885816 (=> (not res!601481) (not e!493038))))

(assert (=> b!885816 (= res!601481 (bvslt from!1053 (size!25269 _keys!868)))))

(declare-fun b!885817 () Bool)

(assert (=> b!885817 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25269 _keys!868)))))

(assert (=> b!885817 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25270 lt!401140)))))

(assert (=> b!885817 (= e!493040 (= (apply!386 lt!401218 (select (arr!24828 _keys!868) from!1053)) (get!13104 (select (arr!24829 lt!401140) from!1053) (dynLambda!1301 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!885818 () Bool)

(assert (=> b!885818 (= e!493042 (isEmpty!679 lt!401218))))

(declare-fun b!885819 () Bool)

(declare-fun lt!401221 () Unit!30194)

(declare-fun lt!401223 () Unit!30194)

(assert (=> b!885819 (= lt!401221 lt!401223)))

(declare-fun lt!401219 () V!28689)

(declare-fun lt!401224 () (_ BitVec 64))

(declare-fun lt!401220 () ListLongMap!10525)

(declare-fun lt!401222 () (_ BitVec 64))

(assert (=> b!885819 (not (contains!4260 (+!2590 lt!401220 (tuple2!11755 lt!401222 lt!401219)) lt!401224))))

(assert (=> b!885819 (= lt!401223 (addStillNotContains!213 lt!401220 lt!401222 lt!401219 lt!401224))))

(assert (=> b!885819 (= lt!401224 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!885819 (= lt!401219 (get!13104 (select (arr!24829 lt!401140) from!1053) (dynLambda!1301 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!885819 (= lt!401222 (select (arr!24828 _keys!868) from!1053))))

(assert (=> b!885819 (= lt!401220 call!39060)))

(assert (=> b!885819 (= e!493039 (+!2590 call!39060 (tuple2!11755 (select (arr!24828 _keys!868) from!1053) (get!13104 (select (arr!24829 lt!401140) from!1053) (dynLambda!1301 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!885820 () Bool)

(assert (=> b!885820 (= e!493043 e!493042)))

(declare-fun c!93455 () Bool)

(assert (=> b!885820 (= c!93455 (bvslt from!1053 (size!25269 _keys!868)))))

(declare-fun b!885821 () Bool)

(assert (=> b!885821 (= e!493037 (ListLongMap!10526 Nil!17583))))

(assert (= (and d!109601 c!93454) b!885821))

(assert (= (and d!109601 (not c!93454)) b!885814))

(assert (= (and b!885814 c!93456) b!885819))

(assert (= (and b!885814 (not c!93456)) b!885815))

(assert (= (or b!885819 b!885815) bm!39057))

(assert (= (and d!109601 res!601479) b!885811))

(assert (= (and b!885811 res!601480) b!885816))

(assert (= (and b!885816 res!601481) b!885813))

(assert (= (and b!885816 c!93457) b!885812))

(assert (= (and b!885816 (not c!93457)) b!885820))

(assert (= (and b!885812 res!601478) b!885817))

(assert (= (and b!885820 c!93455) b!885810))

(assert (= (and b!885820 (not c!93455)) b!885818))

(declare-fun b_lambda!12809 () Bool)

(assert (=> (not b_lambda!12809) (not b!885817)))

(assert (=> b!885817 t!24855))

(declare-fun b_and!25701 () Bool)

(assert (= b_and!25699 (and (=> t!24855 result!9895) b_and!25701)))

(declare-fun b_lambda!12811 () Bool)

(assert (=> (not b_lambda!12811) (not b!885819)))

(assert (=> b!885819 t!24855))

(declare-fun b_and!25703 () Bool)

(assert (= b_and!25701 (and (=> t!24855 result!9895) b_and!25703)))

(assert (=> b!885813 m!826295))

(assert (=> b!885813 m!826295))

(assert (=> b!885813 m!826297))

(declare-fun m!826457 () Bool)

(assert (=> b!885810 m!826457))

(declare-fun m!826459 () Bool)

(assert (=> b!885811 m!826459))

(assert (=> b!885817 m!826295))

(declare-fun m!826461 () Bool)

(assert (=> b!885817 m!826461))

(assert (=> b!885817 m!826395))

(declare-fun m!826463 () Bool)

(assert (=> b!885817 m!826463))

(assert (=> b!885817 m!826461))

(assert (=> b!885817 m!826295))

(declare-fun m!826465 () Bool)

(assert (=> b!885817 m!826465))

(assert (=> b!885817 m!826395))

(assert (=> b!885814 m!826295))

(assert (=> b!885814 m!826295))

(assert (=> b!885814 m!826297))

(declare-fun m!826467 () Bool)

(assert (=> d!109601 m!826467))

(assert (=> d!109601 m!826265))

(declare-fun m!826469 () Bool)

(assert (=> b!885818 m!826469))

(assert (=> b!885812 m!826295))

(assert (=> b!885812 m!826295))

(declare-fun m!826471 () Bool)

(assert (=> b!885812 m!826471))

(assert (=> b!885819 m!826395))

(assert (=> b!885819 m!826295))

(declare-fun m!826473 () Bool)

(assert (=> b!885819 m!826473))

(declare-fun m!826475 () Bool)

(assert (=> b!885819 m!826475))

(assert (=> b!885819 m!826461))

(assert (=> b!885819 m!826395))

(assert (=> b!885819 m!826463))

(assert (=> b!885819 m!826461))

(assert (=> b!885819 m!826473))

(declare-fun m!826477 () Bool)

(assert (=> b!885819 m!826477))

(declare-fun m!826479 () Bool)

(assert (=> b!885819 m!826479))

(assert (=> bm!39057 m!826457))

(assert (=> b!885659 d!109601))

(declare-fun e!493049 () Bool)

(declare-fun b!885822 () Bool)

(declare-fun lt!401225 () ListLongMap!10525)

(assert (=> b!885822 (= e!493049 (= lt!401225 (getCurrentListMapNoExtraKeys!3314 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!885823 () Bool)

(declare-fun res!601484 () Bool)

(declare-fun e!493048 () Bool)

(assert (=> b!885823 (=> (not res!601484) (not e!493048))))

(assert (=> b!885823 (= res!601484 (not (contains!4260 lt!401225 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!39058 () Bool)

(declare-fun call!39061 () ListLongMap!10525)

(assert (=> bm!39058 (= call!39061 (getCurrentListMapNoExtraKeys!3314 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun d!109603 () Bool)

(assert (=> d!109603 e!493048))

(declare-fun res!601483 () Bool)

(assert (=> d!109603 (=> (not res!601483) (not e!493048))))

(assert (=> d!109603 (= res!601483 (not (contains!4260 lt!401225 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!493044 () ListLongMap!10525)

(assert (=> d!109603 (= lt!401225 e!493044)))

(declare-fun c!93458 () Bool)

(assert (=> d!109603 (= c!93458 (bvsge from!1053 (size!25269 _keys!868)))))

(assert (=> d!109603 (validMask!0 mask!1196)))

(assert (=> d!109603 (= (getCurrentListMapNoExtraKeys!3314 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!401225)))

(declare-fun b!885824 () Bool)

(declare-fun e!493050 () Bool)

(declare-fun e!493047 () Bool)

(assert (=> b!885824 (= e!493050 e!493047)))

(assert (=> b!885824 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25269 _keys!868)))))

(declare-fun res!601482 () Bool)

(assert (=> b!885824 (= res!601482 (contains!4260 lt!401225 (select (arr!24828 _keys!868) from!1053)))))

(assert (=> b!885824 (=> (not res!601482) (not e!493047))))

(declare-fun b!885825 () Bool)

(declare-fun e!493045 () Bool)

(assert (=> b!885825 (= e!493045 (validKeyInArray!0 (select (arr!24828 _keys!868) from!1053)))))

(assert (=> b!885825 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!885826 () Bool)

(declare-fun e!493046 () ListLongMap!10525)

(assert (=> b!885826 (= e!493044 e!493046)))

(declare-fun c!93460 () Bool)

(assert (=> b!885826 (= c!93460 (validKeyInArray!0 (select (arr!24828 _keys!868) from!1053)))))

(declare-fun b!885827 () Bool)

(assert (=> b!885827 (= e!493046 call!39061)))

(declare-fun b!885828 () Bool)

(assert (=> b!885828 (= e!493048 e!493050)))

(declare-fun c!93461 () Bool)

(assert (=> b!885828 (= c!93461 e!493045)))

(declare-fun res!601485 () Bool)

(assert (=> b!885828 (=> (not res!601485) (not e!493045))))

(assert (=> b!885828 (= res!601485 (bvslt from!1053 (size!25269 _keys!868)))))

(declare-fun b!885829 () Bool)

(assert (=> b!885829 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25269 _keys!868)))))

(assert (=> b!885829 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25270 _values!688)))))

(assert (=> b!885829 (= e!493047 (= (apply!386 lt!401225 (select (arr!24828 _keys!868) from!1053)) (get!13104 (select (arr!24829 _values!688) from!1053) (dynLambda!1301 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!885830 () Bool)

(assert (=> b!885830 (= e!493049 (isEmpty!679 lt!401225))))

(declare-fun b!885831 () Bool)

(declare-fun lt!401228 () Unit!30194)

(declare-fun lt!401230 () Unit!30194)

(assert (=> b!885831 (= lt!401228 lt!401230)))

(declare-fun lt!401226 () V!28689)

(declare-fun lt!401227 () ListLongMap!10525)

(declare-fun lt!401229 () (_ BitVec 64))

(declare-fun lt!401231 () (_ BitVec 64))

(assert (=> b!885831 (not (contains!4260 (+!2590 lt!401227 (tuple2!11755 lt!401229 lt!401226)) lt!401231))))

(assert (=> b!885831 (= lt!401230 (addStillNotContains!213 lt!401227 lt!401229 lt!401226 lt!401231))))

(assert (=> b!885831 (= lt!401231 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!885831 (= lt!401226 (get!13104 (select (arr!24829 _values!688) from!1053) (dynLambda!1301 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!885831 (= lt!401229 (select (arr!24828 _keys!868) from!1053))))

(assert (=> b!885831 (= lt!401227 call!39061)))

(assert (=> b!885831 (= e!493046 (+!2590 call!39061 (tuple2!11755 (select (arr!24828 _keys!868) from!1053) (get!13104 (select (arr!24829 _values!688) from!1053) (dynLambda!1301 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!885832 () Bool)

(assert (=> b!885832 (= e!493050 e!493049)))

(declare-fun c!93459 () Bool)

(assert (=> b!885832 (= c!93459 (bvslt from!1053 (size!25269 _keys!868)))))

(declare-fun b!885833 () Bool)

(assert (=> b!885833 (= e!493044 (ListLongMap!10526 Nil!17583))))

(assert (= (and d!109603 c!93458) b!885833))

(assert (= (and d!109603 (not c!93458)) b!885826))

(assert (= (and b!885826 c!93460) b!885831))

(assert (= (and b!885826 (not c!93460)) b!885827))

(assert (= (or b!885831 b!885827) bm!39058))

(assert (= (and d!109603 res!601483) b!885823))

(assert (= (and b!885823 res!601484) b!885828))

(assert (= (and b!885828 res!601485) b!885825))

(assert (= (and b!885828 c!93461) b!885824))

(assert (= (and b!885828 (not c!93461)) b!885832))

(assert (= (and b!885824 res!601482) b!885829))

(assert (= (and b!885832 c!93459) b!885822))

(assert (= (and b!885832 (not c!93459)) b!885830))

(declare-fun b_lambda!12813 () Bool)

(assert (=> (not b_lambda!12813) (not b!885829)))

(assert (=> b!885829 t!24855))

(declare-fun b_and!25705 () Bool)

(assert (= b_and!25703 (and (=> t!24855 result!9895) b_and!25705)))

(declare-fun b_lambda!12815 () Bool)

(assert (=> (not b_lambda!12815) (not b!885831)))

(assert (=> b!885831 t!24855))

(declare-fun b_and!25707 () Bool)

(assert (= b_and!25705 (and (=> t!24855 result!9895) b_and!25707)))

(assert (=> b!885825 m!826295))

(assert (=> b!885825 m!826295))

(assert (=> b!885825 m!826297))

(declare-fun m!826481 () Bool)

(assert (=> b!885822 m!826481))

(declare-fun m!826483 () Bool)

(assert (=> b!885823 m!826483))

(assert (=> b!885829 m!826295))

(declare-fun m!826485 () Bool)

(assert (=> b!885829 m!826485))

(assert (=> b!885829 m!826395))

(declare-fun m!826487 () Bool)

(assert (=> b!885829 m!826487))

(assert (=> b!885829 m!826485))

(assert (=> b!885829 m!826295))

(declare-fun m!826489 () Bool)

(assert (=> b!885829 m!826489))

(assert (=> b!885829 m!826395))

(assert (=> b!885826 m!826295))

(assert (=> b!885826 m!826295))

(assert (=> b!885826 m!826297))

(declare-fun m!826491 () Bool)

(assert (=> d!109603 m!826491))

(assert (=> d!109603 m!826265))

(declare-fun m!826493 () Bool)

(assert (=> b!885830 m!826493))

(assert (=> b!885824 m!826295))

(assert (=> b!885824 m!826295))

(declare-fun m!826495 () Bool)

(assert (=> b!885824 m!826495))

(assert (=> b!885831 m!826395))

(assert (=> b!885831 m!826295))

(declare-fun m!826497 () Bool)

(assert (=> b!885831 m!826497))

(declare-fun m!826499 () Bool)

(assert (=> b!885831 m!826499))

(assert (=> b!885831 m!826485))

(assert (=> b!885831 m!826395))

(assert (=> b!885831 m!826487))

(assert (=> b!885831 m!826485))

(assert (=> b!885831 m!826497))

(declare-fun m!826501 () Bool)

(assert (=> b!885831 m!826501))

(declare-fun m!826503 () Bool)

(assert (=> b!885831 m!826503))

(assert (=> bm!39058 m!826481))

(assert (=> b!885659 d!109603))

(declare-fun d!109605 () Bool)

(assert (=> d!109605 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!885655 d!109605))

(declare-fun bm!39061 () Bool)

(declare-fun call!39064 () Bool)

(assert (=> bm!39061 (= call!39064 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!885842 () Bool)

(declare-fun e!493057 () Bool)

(declare-fun e!493058 () Bool)

(assert (=> b!885842 (= e!493057 e!493058)))

(declare-fun c!93464 () Bool)

(assert (=> b!885842 (= c!93464 (validKeyInArray!0 (select (arr!24828 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!885843 () Bool)

(declare-fun e!493059 () Bool)

(assert (=> b!885843 (= e!493058 e!493059)))

(declare-fun lt!401238 () (_ BitVec 64))

(assert (=> b!885843 (= lt!401238 (select (arr!24828 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!401240 () Unit!30194)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51629 (_ BitVec 64) (_ BitVec 32)) Unit!30194)

(assert (=> b!885843 (= lt!401240 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!401238 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!51629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!885843 (arrayContainsKey!0 _keys!868 lt!401238 #b00000000000000000000000000000000)))

(declare-fun lt!401239 () Unit!30194)

(assert (=> b!885843 (= lt!401239 lt!401240)))

(declare-fun res!601490 () Bool)

(declare-datatypes ((SeekEntryResult!8713 0))(
  ( (MissingZero!8713 (index!37223 (_ BitVec 32))) (Found!8713 (index!37224 (_ BitVec 32))) (Intermediate!8713 (undefined!9525 Bool) (index!37225 (_ BitVec 32)) (x!74977 (_ BitVec 32))) (Undefined!8713) (MissingVacant!8713 (index!37226 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51629 (_ BitVec 32)) SeekEntryResult!8713)

(assert (=> b!885843 (= res!601490 (= (seekEntryOrOpen!0 (select (arr!24828 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8713 #b00000000000000000000000000000000)))))

(assert (=> b!885843 (=> (not res!601490) (not e!493059))))

(declare-fun b!885844 () Bool)

(assert (=> b!885844 (= e!493059 call!39064)))

(declare-fun d!109607 () Bool)

(declare-fun res!601491 () Bool)

(assert (=> d!109607 (=> res!601491 e!493057)))

(assert (=> d!109607 (= res!601491 (bvsge #b00000000000000000000000000000000 (size!25269 _keys!868)))))

(assert (=> d!109607 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!493057)))

(declare-fun b!885845 () Bool)

(assert (=> b!885845 (= e!493058 call!39064)))

(assert (= (and d!109607 (not res!601491)) b!885842))

(assert (= (and b!885842 c!93464) b!885843))

(assert (= (and b!885842 (not c!93464)) b!885845))

(assert (= (and b!885843 res!601490) b!885844))

(assert (= (or b!885844 b!885845) bm!39061))

(declare-fun m!826505 () Bool)

(assert (=> bm!39061 m!826505))

(declare-fun m!826507 () Bool)

(assert (=> b!885842 m!826507))

(assert (=> b!885842 m!826507))

(declare-fun m!826509 () Bool)

(assert (=> b!885842 m!826509))

(assert (=> b!885843 m!826507))

(declare-fun m!826511 () Bool)

(assert (=> b!885843 m!826511))

(declare-fun m!826513 () Bool)

(assert (=> b!885843 m!826513))

(assert (=> b!885843 m!826507))

(declare-fun m!826515 () Bool)

(assert (=> b!885843 m!826515))

(assert (=> b!885653 d!109607))

(declare-fun b!885856 () Bool)

(declare-fun e!493070 () Bool)

(declare-fun call!39067 () Bool)

(assert (=> b!885856 (= e!493070 call!39067)))

(declare-fun b!885857 () Bool)

(declare-fun e!493069 () Bool)

(assert (=> b!885857 (= e!493069 e!493070)))

(declare-fun c!93467 () Bool)

(assert (=> b!885857 (= c!93467 (validKeyInArray!0 (select (arr!24828 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!109609 () Bool)

(declare-fun res!601499 () Bool)

(declare-fun e!493071 () Bool)

(assert (=> d!109609 (=> res!601499 e!493071)))

(assert (=> d!109609 (= res!601499 (bvsge #b00000000000000000000000000000000 (size!25269 _keys!868)))))

(assert (=> d!109609 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17582) e!493071)))

(declare-fun b!885858 () Bool)

(declare-fun e!493068 () Bool)

(declare-fun contains!4262 (List!17585 (_ BitVec 64)) Bool)

(assert (=> b!885858 (= e!493068 (contains!4262 Nil!17582 (select (arr!24828 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!885859 () Bool)

(assert (=> b!885859 (= e!493070 call!39067)))

(declare-fun b!885860 () Bool)

(assert (=> b!885860 (= e!493071 e!493069)))

(declare-fun res!601500 () Bool)

(assert (=> b!885860 (=> (not res!601500) (not e!493069))))

(assert (=> b!885860 (= res!601500 (not e!493068))))

(declare-fun res!601498 () Bool)

(assert (=> b!885860 (=> (not res!601498) (not e!493068))))

(assert (=> b!885860 (= res!601498 (validKeyInArray!0 (select (arr!24828 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!39064 () Bool)

(assert (=> bm!39064 (= call!39067 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!93467 (Cons!17581 (select (arr!24828 _keys!868) #b00000000000000000000000000000000) Nil!17582) Nil!17582)))))

(assert (= (and d!109609 (not res!601499)) b!885860))

(assert (= (and b!885860 res!601498) b!885858))

(assert (= (and b!885860 res!601500) b!885857))

(assert (= (and b!885857 c!93467) b!885856))

(assert (= (and b!885857 (not c!93467)) b!885859))

(assert (= (or b!885856 b!885859) bm!39064))

(assert (=> b!885857 m!826507))

(assert (=> b!885857 m!826507))

(assert (=> b!885857 m!826509))

(assert (=> b!885858 m!826507))

(assert (=> b!885858 m!826507))

(declare-fun m!826517 () Bool)

(assert (=> b!885858 m!826517))

(assert (=> b!885860 m!826507))

(assert (=> b!885860 m!826507))

(assert (=> b!885860 m!826509))

(assert (=> bm!39064 m!826507))

(declare-fun m!826519 () Bool)

(assert (=> bm!39064 m!826519))

(assert (=> b!885654 d!109609))

(declare-fun mapIsEmpty!28245 () Bool)

(declare-fun mapRes!28245 () Bool)

(assert (=> mapIsEmpty!28245 mapRes!28245))

(declare-fun condMapEmpty!28245 () Bool)

(declare-fun mapDefault!28245 () ValueCell!8426)

(assert (=> mapNonEmpty!28236 (= condMapEmpty!28245 (= mapRest!28236 ((as const (Array (_ BitVec 32) ValueCell!8426)) mapDefault!28245)))))

(declare-fun e!493076 () Bool)

(assert (=> mapNonEmpty!28236 (= tp!54167 (and e!493076 mapRes!28245))))

(declare-fun b!885867 () Bool)

(declare-fun e!493077 () Bool)

(assert (=> b!885867 (= e!493077 tp_is_empty!17731)))

(declare-fun b!885868 () Bool)

(assert (=> b!885868 (= e!493076 tp_is_empty!17731)))

(declare-fun mapNonEmpty!28245 () Bool)

(declare-fun tp!54183 () Bool)

(assert (=> mapNonEmpty!28245 (= mapRes!28245 (and tp!54183 e!493077))))

(declare-fun mapKey!28245 () (_ BitVec 32))

(declare-fun mapValue!28245 () ValueCell!8426)

(declare-fun mapRest!28245 () (Array (_ BitVec 32) ValueCell!8426))

(assert (=> mapNonEmpty!28245 (= mapRest!28236 (store mapRest!28245 mapKey!28245 mapValue!28245))))

(assert (= (and mapNonEmpty!28236 condMapEmpty!28245) mapIsEmpty!28245))

(assert (= (and mapNonEmpty!28236 (not condMapEmpty!28245)) mapNonEmpty!28245))

(assert (= (and mapNonEmpty!28245 ((_ is ValueCellFull!8426) mapValue!28245)) b!885867))

(assert (= (and mapNonEmpty!28236 ((_ is ValueCellFull!8426) mapDefault!28245)) b!885868))

(declare-fun m!826521 () Bool)

(assert (=> mapNonEmpty!28245 m!826521))

(declare-fun b_lambda!12817 () Bool)

(assert (= b_lambda!12805 (or (and start!75166 b_free!15487) b_lambda!12817)))

(declare-fun b_lambda!12819 () Bool)

(assert (= b_lambda!12811 (or (and start!75166 b_free!15487) b_lambda!12819)))

(declare-fun b_lambda!12821 () Bool)

(assert (= b_lambda!12813 (or (and start!75166 b_free!15487) b_lambda!12821)))

(declare-fun b_lambda!12823 () Bool)

(assert (= b_lambda!12807 (or (and start!75166 b_free!15487) b_lambda!12823)))

(declare-fun b_lambda!12825 () Bool)

(assert (= b_lambda!12809 (or (and start!75166 b_free!15487) b_lambda!12825)))

(declare-fun b_lambda!12827 () Bool)

(assert (= b_lambda!12801 (or (and start!75166 b_free!15487) b_lambda!12827)))

(declare-fun b_lambda!12829 () Bool)

(assert (= b_lambda!12803 (or (and start!75166 b_free!15487) b_lambda!12829)))

(declare-fun b_lambda!12831 () Bool)

(assert (= b_lambda!12815 (or (and start!75166 b_free!15487) b_lambda!12831)))

(check-sat (not b!885812) b_and!25707 tp_is_empty!17731 (not b!885826) (not b_lambda!12831) (not b!885775) (not b!885793) (not mapNonEmpty!28245) (not b!885773) (not b!885792) (not b!885824) (not b!885748) (not b!885797) (not bm!39056) (not b!885796) (not b_lambda!12819) (not bm!39064) (not b!885823) (not b!885747) (not b!885819) (not b!885807) (not bm!39055) (not d!109591) (not b!885843) (not b!885813) (not b_lambda!12829) (not bm!39057) (not b_lambda!12825) (not b!885825) (not d!109603) (not b!885829) (not b!885811) (not bm!39049) (not d!109601) (not b!885814) (not b!885790) (not b!885787) (not b!885842) (not b!885858) (not d!109593) (not b!885857) (not b!885818) (not b_lambda!12821) (not b!885791) (not b!885831) (not b!885774) (not b!885781) (not b!885822) (not b!885777) (not d!109597) (not d!109585) (not b_lambda!12823) (not bm!39061) (not b!885788) (not bm!39050) (not b_lambda!12817) (not b!885798) (not b_next!15487) (not b!885780) (not b!885830) (not d!109599) (not b!885810) (not b!885776) (not b!885782) (not b!885817) (not b_lambda!12827) (not b!885860) (not bm!39058) (not b!885789))
(check-sat b_and!25707 (not b_next!15487))
