; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74920 () Bool)

(assert start!74920)

(declare-fun b_free!15457 () Bool)

(declare-fun b_next!15457 () Bool)

(assert (=> start!74920 (= b_free!15457 (not b_next!15457))))

(declare-fun tp!54074 () Bool)

(declare-fun b_and!25587 () Bool)

(assert (=> start!74920 (= tp!54074 b_and!25587)))

(declare-fun b!883694 () Bool)

(declare-fun e!491776 () Bool)

(declare-fun tp_is_empty!17701 () Bool)

(assert (=> b!883694 (= e!491776 tp_is_empty!17701)))

(declare-fun mapIsEmpty!28188 () Bool)

(declare-fun mapRes!28188 () Bool)

(assert (=> mapIsEmpty!28188 mapRes!28188))

(declare-fun b!883695 () Bool)

(declare-fun res!600401 () Bool)

(declare-fun e!491773 () Bool)

(assert (=> b!883695 (=> (not res!600401) (not e!491773))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883695 (= res!600401 (validKeyInArray!0 k0!854))))

(declare-fun b!883696 () Bool)

(declare-datatypes ((Unit!30118 0))(
  ( (Unit!30119) )
))
(declare-fun e!491772 () Unit!30118)

(declare-fun Unit!30120 () Unit!30118)

(assert (=> b!883696 (= e!491772 Unit!30120)))

(declare-fun lt!399970 () Unit!30118)

(declare-datatypes ((array!51509 0))(
  ( (array!51510 (arr!24774 (Array (_ BitVec 32) (_ BitVec 64))) (size!25216 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51509)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51509 (_ BitVec 32) (_ BitVec 32)) Unit!30118)

(assert (=> b!883696 (= lt!399970 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17607 0))(
  ( (Nil!17604) (Cons!17603 (h!18734 (_ BitVec 64)) (t!24857 List!17607)) )
))
(declare-fun arrayNoDuplicates!0 (array!51509 (_ BitVec 32) List!17607) Bool)

(assert (=> b!883696 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17604)))

(declare-fun lt!399963 () Unit!30118)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51509 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30118)

(assert (=> b!883696 (= lt!399963 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883696 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399969 () Unit!30118)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51509 (_ BitVec 64) (_ BitVec 32) List!17607) Unit!30118)

(assert (=> b!883696 (= lt!399969 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17604))))

(assert (=> b!883696 false))

(declare-fun b!883697 () Bool)

(declare-fun res!600406 () Bool)

(assert (=> b!883697 (=> (not res!600406) (not e!491773))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!28649 0))(
  ( (V!28650 (val!8898 Int)) )
))
(declare-datatypes ((ValueCell!8411 0))(
  ( (ValueCellFull!8411 (v!11361 V!28649)) (EmptyCell!8411) )
))
(declare-datatypes ((array!51511 0))(
  ( (array!51512 (arr!24775 (Array (_ BitVec 32) ValueCell!8411)) (size!25217 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51511)

(assert (=> b!883697 (= res!600406 (and (= (size!25217 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25216 _keys!868) (size!25217 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!883698 () Bool)

(declare-fun e!491771 () Bool)

(declare-fun e!491770 () Bool)

(assert (=> b!883698 (= e!491771 e!491770)))

(declare-fun res!600399 () Bool)

(assert (=> b!883698 (=> res!600399 e!491770)))

(assert (=> b!883698 (= res!600399 (= k0!854 (select (arr!24774 _keys!868) from!1053)))))

(assert (=> b!883698 (not (= (select (arr!24774 _keys!868) from!1053) k0!854))))

(declare-fun lt!399964 () Unit!30118)

(assert (=> b!883698 (= lt!399964 e!491772)))

(declare-fun c!93026 () Bool)

(assert (=> b!883698 (= c!93026 (= (select (arr!24774 _keys!868) from!1053) k0!854))))

(declare-datatypes ((tuple2!11810 0))(
  ( (tuple2!11811 (_1!5916 (_ BitVec 64)) (_2!5916 V!28649)) )
))
(declare-datatypes ((List!17608 0))(
  ( (Nil!17605) (Cons!17604 (h!18735 tuple2!11810) (t!24858 List!17608)) )
))
(declare-datatypes ((ListLongMap!10569 0))(
  ( (ListLongMap!10570 (toList!5300 List!17608)) )
))
(declare-fun lt!399974 () ListLongMap!10569)

(declare-fun lt!399978 () ListLongMap!10569)

(assert (=> b!883698 (= lt!399974 lt!399978)))

(declare-fun lt!399976 () ListLongMap!10569)

(declare-fun lt!399977 () tuple2!11810)

(declare-fun +!2592 (ListLongMap!10569 tuple2!11810) ListLongMap!10569)

(assert (=> b!883698 (= lt!399978 (+!2592 lt!399976 lt!399977))))

(declare-fun lt!399972 () V!28649)

(assert (=> b!883698 (= lt!399977 (tuple2!11811 (select (arr!24774 _keys!868) from!1053) lt!399972))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!13065 (ValueCell!8411 V!28649) V!28649)

(declare-fun dynLambda!1277 (Int (_ BitVec 64)) V!28649)

(assert (=> b!883698 (= lt!399972 (get!13065 (select (arr!24775 _values!688) from!1053) (dynLambda!1277 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!883699 () Bool)

(declare-fun e!491769 () Bool)

(assert (=> b!883699 (= e!491769 (and e!491776 mapRes!28188))))

(declare-fun condMapEmpty!28188 () Bool)

(declare-fun mapDefault!28188 () ValueCell!8411)

(assert (=> b!883699 (= condMapEmpty!28188 (= (arr!24775 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8411)) mapDefault!28188)))))

(declare-fun res!600405 () Bool)

(assert (=> start!74920 (=> (not res!600405) (not e!491773))))

(assert (=> start!74920 (= res!600405 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25216 _keys!868))))))

(assert (=> start!74920 e!491773))

(assert (=> start!74920 tp_is_empty!17701))

(assert (=> start!74920 true))

(assert (=> start!74920 tp!54074))

(declare-fun array_inv!19554 (array!51509) Bool)

(assert (=> start!74920 (array_inv!19554 _keys!868)))

(declare-fun array_inv!19555 (array!51511) Bool)

(assert (=> start!74920 (and (array_inv!19555 _values!688) e!491769)))

(declare-fun b!883700 () Bool)

(declare-fun e!491777 () Bool)

(assert (=> b!883700 (= e!491777 tp_is_empty!17701)))

(declare-fun b!883701 () Bool)

(declare-fun Unit!30121 () Unit!30118)

(assert (=> b!883701 (= e!491772 Unit!30121)))

(declare-fun b!883702 () Bool)

(declare-fun res!600404 () Bool)

(assert (=> b!883702 (=> (not res!600404) (not e!491773))))

(assert (=> b!883702 (= res!600404 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25216 _keys!868))))))

(declare-fun b!883703 () Bool)

(declare-fun res!600403 () Bool)

(assert (=> b!883703 (=> (not res!600403) (not e!491773))))

(assert (=> b!883703 (= res!600403 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17604))))

(declare-fun b!883704 () Bool)

(declare-fun res!600402 () Bool)

(assert (=> b!883704 (=> (not res!600402) (not e!491773))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51509 (_ BitVec 32)) Bool)

(assert (=> b!883704 (= res!600402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!28188 () Bool)

(declare-fun tp!54075 () Bool)

(assert (=> mapNonEmpty!28188 (= mapRes!28188 (and tp!54075 e!491777))))

(declare-fun mapValue!28188 () ValueCell!8411)

(declare-fun mapKey!28188 () (_ BitVec 32))

(declare-fun mapRest!28188 () (Array (_ BitVec 32) ValueCell!8411))

(assert (=> mapNonEmpty!28188 (= (arr!24775 _values!688) (store mapRest!28188 mapKey!28188 mapValue!28188))))

(declare-fun b!883705 () Bool)

(declare-fun e!491774 () Bool)

(assert (=> b!883705 (= e!491773 e!491774)))

(declare-fun res!600400 () Bool)

(assert (=> b!883705 (=> (not res!600400) (not e!491774))))

(assert (=> b!883705 (= res!600400 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!399967 () array!51511)

(declare-fun minValue!654 () V!28649)

(declare-fun zeroValue!654 () V!28649)

(declare-fun getCurrentListMapNoExtraKeys!3291 (array!51509 array!51511 (_ BitVec 32) (_ BitVec 32) V!28649 V!28649 (_ BitVec 32) Int) ListLongMap!10569)

(assert (=> b!883705 (= lt!399974 (getCurrentListMapNoExtraKeys!3291 _keys!868 lt!399967 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28649)

(assert (=> b!883705 (= lt!399967 (array!51512 (store (arr!24775 _values!688) i!612 (ValueCellFull!8411 v!557)) (size!25217 _values!688)))))

(declare-fun lt!399966 () ListLongMap!10569)

(assert (=> b!883705 (= lt!399966 (getCurrentListMapNoExtraKeys!3291 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!883706 () Bool)

(declare-fun res!600397 () Bool)

(assert (=> b!883706 (=> (not res!600397) (not e!491773))))

(assert (=> b!883706 (= res!600397 (and (= (select (arr!24774 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!883707 () Bool)

(assert (=> b!883707 (= e!491774 (not e!491771))))

(declare-fun res!600396 () Bool)

(assert (=> b!883707 (=> res!600396 e!491771)))

(assert (=> b!883707 (= res!600396 (not (validKeyInArray!0 (select (arr!24774 _keys!868) from!1053))))))

(declare-fun lt!399965 () ListLongMap!10569)

(assert (=> b!883707 (= lt!399965 lt!399976)))

(declare-fun lt!399973 () ListLongMap!10569)

(declare-fun lt!399968 () tuple2!11810)

(assert (=> b!883707 (= lt!399976 (+!2592 lt!399973 lt!399968))))

(assert (=> b!883707 (= lt!399965 (getCurrentListMapNoExtraKeys!3291 _keys!868 lt!399967 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!883707 (= lt!399968 (tuple2!11811 k0!854 v!557))))

(assert (=> b!883707 (= lt!399973 (getCurrentListMapNoExtraKeys!3291 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!399975 () Unit!30118)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!756 (array!51509 array!51511 (_ BitVec 32) (_ BitVec 32) V!28649 V!28649 (_ BitVec 32) (_ BitVec 64) V!28649 (_ BitVec 32) Int) Unit!30118)

(assert (=> b!883707 (= lt!399975 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!756 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883708 () Bool)

(declare-fun res!600398 () Bool)

(assert (=> b!883708 (=> (not res!600398) (not e!491773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883708 (= res!600398 (validMask!0 mask!1196))))

(declare-fun b!883709 () Bool)

(assert (=> b!883709 (= e!491770 (bvslt i!612 (size!25217 _values!688)))))

(assert (=> b!883709 (= lt!399978 (+!2592 (+!2592 lt!399973 lt!399977) lt!399968))))

(declare-fun lt!399971 () Unit!30118)

(declare-fun addCommutativeForDiffKeys!547 (ListLongMap!10569 (_ BitVec 64) V!28649 (_ BitVec 64) V!28649) Unit!30118)

(assert (=> b!883709 (= lt!399971 (addCommutativeForDiffKeys!547 lt!399973 k0!854 v!557 (select (arr!24774 _keys!868) from!1053) lt!399972))))

(assert (= (and start!74920 res!600405) b!883708))

(assert (= (and b!883708 res!600398) b!883697))

(assert (= (and b!883697 res!600406) b!883704))

(assert (= (and b!883704 res!600402) b!883703))

(assert (= (and b!883703 res!600403) b!883702))

(assert (= (and b!883702 res!600404) b!883695))

(assert (= (and b!883695 res!600401) b!883706))

(assert (= (and b!883706 res!600397) b!883705))

(assert (= (and b!883705 res!600400) b!883707))

(assert (= (and b!883707 (not res!600396)) b!883698))

(assert (= (and b!883698 c!93026) b!883696))

(assert (= (and b!883698 (not c!93026)) b!883701))

(assert (= (and b!883698 (not res!600399)) b!883709))

(assert (= (and b!883699 condMapEmpty!28188) mapIsEmpty!28188))

(assert (= (and b!883699 (not condMapEmpty!28188)) mapNonEmpty!28188))

(get-info :version)

(assert (= (and mapNonEmpty!28188 ((_ is ValueCellFull!8411) mapValue!28188)) b!883700))

(assert (= (and b!883699 ((_ is ValueCellFull!8411) mapDefault!28188)) b!883694))

(assert (= start!74920 b!883699))

(declare-fun b_lambda!12717 () Bool)

(assert (=> (not b_lambda!12717) (not b!883698)))

(declare-fun t!24856 () Bool)

(declare-fun tb!5107 () Bool)

(assert (=> (and start!74920 (= defaultEntry!696 defaultEntry!696) t!24856) tb!5107))

(declare-fun result!9857 () Bool)

(assert (=> tb!5107 (= result!9857 tp_is_empty!17701)))

(assert (=> b!883698 t!24856))

(declare-fun b_and!25589 () Bool)

(assert (= b_and!25587 (and (=> t!24856 result!9857) b_and!25589)))

(declare-fun m!823287 () Bool)

(assert (=> mapNonEmpty!28188 m!823287))

(declare-fun m!823289 () Bool)

(assert (=> start!74920 m!823289))

(declare-fun m!823291 () Bool)

(assert (=> start!74920 m!823291))

(declare-fun m!823293 () Bool)

(assert (=> b!883705 m!823293))

(declare-fun m!823295 () Bool)

(assert (=> b!883705 m!823295))

(declare-fun m!823297 () Bool)

(assert (=> b!883705 m!823297))

(declare-fun m!823299 () Bool)

(assert (=> b!883703 m!823299))

(declare-fun m!823301 () Bool)

(assert (=> b!883698 m!823301))

(declare-fun m!823303 () Bool)

(assert (=> b!883698 m!823303))

(declare-fun m!823305 () Bool)

(assert (=> b!883698 m!823305))

(declare-fun m!823307 () Bool)

(assert (=> b!883698 m!823307))

(assert (=> b!883698 m!823303))

(declare-fun m!823309 () Bool)

(assert (=> b!883698 m!823309))

(assert (=> b!883698 m!823305))

(declare-fun m!823311 () Bool)

(assert (=> b!883707 m!823311))

(declare-fun m!823313 () Bool)

(assert (=> b!883707 m!823313))

(assert (=> b!883707 m!823309))

(declare-fun m!823315 () Bool)

(assert (=> b!883707 m!823315))

(assert (=> b!883707 m!823309))

(declare-fun m!823317 () Bool)

(assert (=> b!883707 m!823317))

(declare-fun m!823319 () Bool)

(assert (=> b!883707 m!823319))

(declare-fun m!823321 () Bool)

(assert (=> b!883709 m!823321))

(assert (=> b!883709 m!823321))

(declare-fun m!823323 () Bool)

(assert (=> b!883709 m!823323))

(assert (=> b!883709 m!823309))

(assert (=> b!883709 m!823309))

(declare-fun m!823325 () Bool)

(assert (=> b!883709 m!823325))

(declare-fun m!823327 () Bool)

(assert (=> b!883708 m!823327))

(declare-fun m!823329 () Bool)

(assert (=> b!883706 m!823329))

(declare-fun m!823331 () Bool)

(assert (=> b!883704 m!823331))

(declare-fun m!823333 () Bool)

(assert (=> b!883696 m!823333))

(declare-fun m!823335 () Bool)

(assert (=> b!883696 m!823335))

(declare-fun m!823337 () Bool)

(assert (=> b!883696 m!823337))

(declare-fun m!823339 () Bool)

(assert (=> b!883696 m!823339))

(declare-fun m!823341 () Bool)

(assert (=> b!883696 m!823341))

(declare-fun m!823343 () Bool)

(assert (=> b!883695 m!823343))

(check-sat (not b!883709) (not b!883703) (not b_lambda!12717) (not b!883695) b_and!25589 (not start!74920) (not b!883698) (not b!883708) (not b!883707) (not b!883704) tp_is_empty!17701 (not b!883696) (not b!883705) (not mapNonEmpty!28188) (not b_next!15457))
(check-sat b_and!25589 (not b_next!15457))
