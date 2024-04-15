; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74878 () Bool)

(assert start!74878)

(declare-fun b_free!15415 () Bool)

(declare-fun b_next!15415 () Bool)

(assert (=> start!74878 (= b_free!15415 (not b_next!15415))))

(declare-fun tp!53948 () Bool)

(declare-fun b_and!25503 () Bool)

(assert (=> start!74878 (= tp!53948 b_and!25503)))

(declare-fun b!882700 () Bool)

(declare-fun res!599736 () Bool)

(declare-fun e!491257 () Bool)

(assert (=> b!882700 (=> res!599736 e!491257)))

(declare-datatypes ((List!17574 0))(
  ( (Nil!17571) (Cons!17570 (h!18701 (_ BitVec 64)) (t!24782 List!17574)) )
))
(declare-fun contains!4250 (List!17574 (_ BitVec 64)) Bool)

(assert (=> b!882700 (= res!599736 (contains!4250 Nil!17571 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!882701 () Bool)

(declare-fun res!599735 () Bool)

(declare-fun e!491260 () Bool)

(assert (=> b!882701 (=> (not res!599735) (not e!491260))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51431 0))(
  ( (array!51432 (arr!24735 (Array (_ BitVec 32) (_ BitVec 64))) (size!25177 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51431)

(declare-datatypes ((V!28593 0))(
  ( (V!28594 (val!8877 Int)) )
))
(declare-datatypes ((ValueCell!8390 0))(
  ( (ValueCellFull!8390 (v!11340 V!28593)) (EmptyCell!8390) )
))
(declare-datatypes ((array!51433 0))(
  ( (array!51434 (arr!24736 (Array (_ BitVec 32) ValueCell!8390)) (size!25178 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51433)

(assert (=> b!882701 (= res!599735 (and (= (size!25178 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25177 _keys!868) (size!25178 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!599733 () Bool)

(assert (=> start!74878 (=> (not res!599733) (not e!491260))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74878 (= res!599733 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25177 _keys!868))))))

(assert (=> start!74878 e!491260))

(declare-fun tp_is_empty!17659 () Bool)

(assert (=> start!74878 tp_is_empty!17659))

(assert (=> start!74878 true))

(assert (=> start!74878 tp!53948))

(declare-fun array_inv!19524 (array!51431) Bool)

(assert (=> start!74878 (array_inv!19524 _keys!868)))

(declare-fun e!491259 () Bool)

(declare-fun array_inv!19525 (array!51433) Bool)

(assert (=> start!74878 (and (array_inv!19525 _values!688) e!491259)))

(declare-fun b!882702 () Bool)

(declare-fun res!599734 () Bool)

(assert (=> b!882702 (=> (not res!599734) (not e!491260))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!882702 (= res!599734 (and (= (select (arr!24735 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!28125 () Bool)

(declare-fun mapRes!28125 () Bool)

(declare-fun tp!53949 () Bool)

(declare-fun e!491261 () Bool)

(assert (=> mapNonEmpty!28125 (= mapRes!28125 (and tp!53949 e!491261))))

(declare-fun mapKey!28125 () (_ BitVec 32))

(declare-fun mapValue!28125 () ValueCell!8390)

(declare-fun mapRest!28125 () (Array (_ BitVec 32) ValueCell!8390))

(assert (=> mapNonEmpty!28125 (= (arr!24736 _values!688) (store mapRest!28125 mapKey!28125 mapValue!28125))))

(declare-fun b!882703 () Bool)

(declare-fun e!491262 () Bool)

(assert (=> b!882703 (= e!491260 e!491262)))

(declare-fun res!599728 () Bool)

(assert (=> b!882703 (=> (not res!599728) (not e!491262))))

(assert (=> b!882703 (= res!599728 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11778 0))(
  ( (tuple2!11779 (_1!5900 (_ BitVec 64)) (_2!5900 V!28593)) )
))
(declare-datatypes ((List!17575 0))(
  ( (Nil!17572) (Cons!17571 (h!18702 tuple2!11778) (t!24783 List!17575)) )
))
(declare-datatypes ((ListLongMap!10537 0))(
  ( (ListLongMap!10538 (toList!5284 List!17575)) )
))
(declare-fun lt!399281 () ListLongMap!10537)

(declare-fun lt!399280 () array!51433)

(declare-fun minValue!654 () V!28593)

(declare-fun zeroValue!654 () V!28593)

(declare-fun getCurrentListMapNoExtraKeys!3275 (array!51431 array!51433 (_ BitVec 32) (_ BitVec 32) V!28593 V!28593 (_ BitVec 32) Int) ListLongMap!10537)

(assert (=> b!882703 (= lt!399281 (getCurrentListMapNoExtraKeys!3275 _keys!868 lt!399280 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28593)

(assert (=> b!882703 (= lt!399280 (array!51434 (store (arr!24736 _values!688) i!612 (ValueCellFull!8390 v!557)) (size!25178 _values!688)))))

(declare-fun lt!399278 () ListLongMap!10537)

(assert (=> b!882703 (= lt!399278 (getCurrentListMapNoExtraKeys!3275 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!882704 () Bool)

(declare-fun res!599730 () Bool)

(assert (=> b!882704 (=> (not res!599730) (not e!491260))))

(declare-fun arrayNoDuplicates!0 (array!51431 (_ BitVec 32) List!17574) Bool)

(assert (=> b!882704 (= res!599730 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17571))))

(declare-fun b!882705 () Bool)

(declare-fun res!599732 () Bool)

(assert (=> b!882705 (=> res!599732 e!491257)))

(declare-fun noDuplicate!1327 (List!17574) Bool)

(assert (=> b!882705 (= res!599732 (not (noDuplicate!1327 Nil!17571)))))

(declare-fun b!882706 () Bool)

(declare-fun e!491263 () Bool)

(assert (=> b!882706 (= e!491262 (not e!491263))))

(declare-fun res!599729 () Bool)

(assert (=> b!882706 (=> res!599729 e!491263)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!882706 (= res!599729 (not (validKeyInArray!0 (select (arr!24735 _keys!868) from!1053))))))

(declare-fun lt!399276 () ListLongMap!10537)

(declare-fun lt!399277 () ListLongMap!10537)

(assert (=> b!882706 (= lt!399276 lt!399277)))

(declare-fun lt!399284 () ListLongMap!10537)

(declare-fun +!2576 (ListLongMap!10537 tuple2!11778) ListLongMap!10537)

(assert (=> b!882706 (= lt!399277 (+!2576 lt!399284 (tuple2!11779 k0!854 v!557)))))

(assert (=> b!882706 (= lt!399276 (getCurrentListMapNoExtraKeys!3275 _keys!868 lt!399280 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!882706 (= lt!399284 (getCurrentListMapNoExtraKeys!3275 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30063 0))(
  ( (Unit!30064) )
))
(declare-fun lt!399285 () Unit!30063)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!740 (array!51431 array!51433 (_ BitVec 32) (_ BitVec 32) V!28593 V!28593 (_ BitVec 32) (_ BitVec 64) V!28593 (_ BitVec 32) Int) Unit!30063)

(assert (=> b!882706 (= lt!399285 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!740 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!882707 () Bool)

(declare-fun e!491264 () Bool)

(assert (=> b!882707 (= e!491264 tp_is_empty!17659)))

(declare-fun b!882708 () Bool)

(assert (=> b!882708 (= e!491259 (and e!491264 mapRes!28125))))

(declare-fun condMapEmpty!28125 () Bool)

(declare-fun mapDefault!28125 () ValueCell!8390)

(assert (=> b!882708 (= condMapEmpty!28125 (= (arr!24736 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8390)) mapDefault!28125)))))

(declare-fun b!882709 () Bool)

(declare-fun res!599739 () Bool)

(assert (=> b!882709 (=> (not res!599739) (not e!491260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51431 (_ BitVec 32)) Bool)

(assert (=> b!882709 (= res!599739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!882710 () Bool)

(declare-fun e!491256 () Bool)

(assert (=> b!882710 (= e!491263 e!491256)))

(declare-fun res!599731 () Bool)

(assert (=> b!882710 (=> res!599731 e!491256)))

(assert (=> b!882710 (= res!599731 (not (= (select (arr!24735 _keys!868) from!1053) k0!854)))))

(declare-fun get!13038 (ValueCell!8390 V!28593) V!28593)

(declare-fun dynLambda!1264 (Int (_ BitVec 64)) V!28593)

(assert (=> b!882710 (= lt!399281 (+!2576 lt!399277 (tuple2!11779 (select (arr!24735 _keys!868) from!1053) (get!13038 (select (arr!24736 _values!688) from!1053) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882711 () Bool)

(assert (=> b!882711 (= e!491261 tp_is_empty!17659)))

(declare-fun b!882712 () Bool)

(declare-fun res!599740 () Bool)

(assert (=> b!882712 (=> (not res!599740) (not e!491260))))

(assert (=> b!882712 (= res!599740 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25177 _keys!868))))))

(declare-fun b!882713 () Bool)

(assert (=> b!882713 (= e!491256 e!491257)))

(declare-fun res!599737 () Bool)

(assert (=> b!882713 (=> res!599737 e!491257)))

(assert (=> b!882713 (= res!599737 (or (bvsge (size!25177 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25177 _keys!868)) (bvsge from!1053 (size!25177 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!51431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!882713 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399282 () Unit!30063)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51431 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30063)

(assert (=> b!882713 (= lt!399282 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!882713 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17571)))

(declare-fun lt!399279 () Unit!30063)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51431 (_ BitVec 32) (_ BitVec 32)) Unit!30063)

(assert (=> b!882713 (= lt!399279 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!882714 () Bool)

(declare-fun res!599738 () Bool)

(assert (=> b!882714 (=> (not res!599738) (not e!491260))))

(assert (=> b!882714 (= res!599738 (validKeyInArray!0 k0!854))))

(declare-fun b!882715 () Bool)

(assert (=> b!882715 (= e!491257 true)))

(declare-fun lt!399283 () Bool)

(assert (=> b!882715 (= lt!399283 (contains!4250 Nil!17571 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!882716 () Bool)

(declare-fun res!599727 () Bool)

(assert (=> b!882716 (=> (not res!599727) (not e!491260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!882716 (= res!599727 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!28125 () Bool)

(assert (=> mapIsEmpty!28125 mapRes!28125))

(assert (= (and start!74878 res!599733) b!882716))

(assert (= (and b!882716 res!599727) b!882701))

(assert (= (and b!882701 res!599735) b!882709))

(assert (= (and b!882709 res!599739) b!882704))

(assert (= (and b!882704 res!599730) b!882712))

(assert (= (and b!882712 res!599740) b!882714))

(assert (= (and b!882714 res!599738) b!882702))

(assert (= (and b!882702 res!599734) b!882703))

(assert (= (and b!882703 res!599728) b!882706))

(assert (= (and b!882706 (not res!599729)) b!882710))

(assert (= (and b!882710 (not res!599731)) b!882713))

(assert (= (and b!882713 (not res!599737)) b!882705))

(assert (= (and b!882705 (not res!599732)) b!882700))

(assert (= (and b!882700 (not res!599736)) b!882715))

(assert (= (and b!882708 condMapEmpty!28125) mapIsEmpty!28125))

(assert (= (and b!882708 (not condMapEmpty!28125)) mapNonEmpty!28125))

(get-info :version)

(assert (= (and mapNonEmpty!28125 ((_ is ValueCellFull!8390) mapValue!28125)) b!882711))

(assert (= (and b!882708 ((_ is ValueCellFull!8390) mapDefault!28125)) b!882707))

(assert (= start!74878 b!882708))

(declare-fun b_lambda!12675 () Bool)

(assert (=> (not b_lambda!12675) (not b!882710)))

(declare-fun t!24781 () Bool)

(declare-fun tb!5065 () Bool)

(assert (=> (and start!74878 (= defaultEntry!696 defaultEntry!696) t!24781) tb!5065))

(declare-fun result!9773 () Bool)

(assert (=> tb!5065 (= result!9773 tp_is_empty!17659)))

(assert (=> b!882710 t!24781))

(declare-fun b_and!25505 () Bool)

(assert (= b_and!25503 (and (=> t!24781 result!9773) b_and!25505)))

(declare-fun m!822183 () Bool)

(assert (=> start!74878 m!822183))

(declare-fun m!822185 () Bool)

(assert (=> start!74878 m!822185))

(declare-fun m!822187 () Bool)

(assert (=> b!882702 m!822187))

(declare-fun m!822189 () Bool)

(assert (=> b!882703 m!822189))

(declare-fun m!822191 () Bool)

(assert (=> b!882703 m!822191))

(declare-fun m!822193 () Bool)

(assert (=> b!882703 m!822193))

(declare-fun m!822195 () Bool)

(assert (=> mapNonEmpty!28125 m!822195))

(declare-fun m!822197 () Bool)

(assert (=> b!882716 m!822197))

(declare-fun m!822199 () Bool)

(assert (=> b!882705 m!822199))

(declare-fun m!822201 () Bool)

(assert (=> b!882700 m!822201))

(declare-fun m!822203 () Bool)

(assert (=> b!882704 m!822203))

(declare-fun m!822205 () Bool)

(assert (=> b!882714 m!822205))

(declare-fun m!822207 () Bool)

(assert (=> b!882715 m!822207))

(declare-fun m!822209 () Bool)

(assert (=> b!882710 m!822209))

(declare-fun m!822211 () Bool)

(assert (=> b!882710 m!822211))

(declare-fun m!822213 () Bool)

(assert (=> b!882710 m!822213))

(declare-fun m!822215 () Bool)

(assert (=> b!882710 m!822215))

(assert (=> b!882710 m!822211))

(declare-fun m!822217 () Bool)

(assert (=> b!882710 m!822217))

(assert (=> b!882710 m!822213))

(declare-fun m!822219 () Bool)

(assert (=> b!882713 m!822219))

(declare-fun m!822221 () Bool)

(assert (=> b!882713 m!822221))

(declare-fun m!822223 () Bool)

(assert (=> b!882713 m!822223))

(declare-fun m!822225 () Bool)

(assert (=> b!882713 m!822225))

(declare-fun m!822227 () Bool)

(assert (=> b!882709 m!822227))

(declare-fun m!822229 () Bool)

(assert (=> b!882706 m!822229))

(assert (=> b!882706 m!822217))

(declare-fun m!822231 () Bool)

(assert (=> b!882706 m!822231))

(assert (=> b!882706 m!822217))

(declare-fun m!822233 () Bool)

(assert (=> b!882706 m!822233))

(declare-fun m!822235 () Bool)

(assert (=> b!882706 m!822235))

(declare-fun m!822237 () Bool)

(assert (=> b!882706 m!822237))

(check-sat (not b_next!15415) b_and!25505 tp_is_empty!17659 (not b!882709) (not b!882715) (not b!882710) (not b!882714) (not b!882705) (not b_lambda!12675) (not b!882703) (not b!882706) (not start!74878) (not b!882713) (not b!882700) (not b!882716) (not b!882704) (not mapNonEmpty!28125))
(check-sat b_and!25505 (not b_next!15415))
