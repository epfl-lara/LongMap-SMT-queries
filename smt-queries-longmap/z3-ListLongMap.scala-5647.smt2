; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73834 () Bool)

(assert start!73834)

(declare-fun b_free!14581 () Bool)

(declare-fun b_next!14581 () Bool)

(assert (=> start!73834 (= b_free!14581 (not b_next!14581))))

(declare-fun tp!51248 () Bool)

(declare-fun b_and!24151 () Bool)

(assert (=> start!73834 (= tp!51248 b_and!24151)))

(declare-fun b!863678 () Bool)

(declare-fun e!481256 () Bool)

(declare-fun tp_is_empty!16717 () Bool)

(assert (=> b!863678 (= e!481256 tp_is_empty!16717)))

(declare-fun b!863679 () Bool)

(declare-fun e!481253 () Bool)

(assert (=> b!863679 (= e!481253 true)))

(declare-datatypes ((V!27337 0))(
  ( (V!27338 (val!8406 Int)) )
))
(declare-datatypes ((tuple2!11048 0))(
  ( (tuple2!11049 (_1!5535 (_ BitVec 64)) (_2!5535 V!27337)) )
))
(declare-datatypes ((List!16883 0))(
  ( (Nil!16880) (Cons!16879 (h!18016 tuple2!11048) (t!23722 List!16883)) )
))
(declare-datatypes ((ListLongMap!9819 0))(
  ( (ListLongMap!9820 (toList!4925 List!16883)) )
))
(declare-fun lt!389963 () ListLongMap!9819)

(declare-fun lt!389954 () ListLongMap!9819)

(declare-fun lt!389957 () tuple2!11048)

(declare-fun lt!389966 () tuple2!11048)

(declare-fun +!2329 (ListLongMap!9819 tuple2!11048) ListLongMap!9819)

(assert (=> b!863679 (= lt!389963 (+!2329 (+!2329 lt!389954 lt!389957) lt!389966))))

(declare-fun v!557 () V!27337)

(declare-datatypes ((Unit!29471 0))(
  ( (Unit!29472) )
))
(declare-fun lt!389958 () Unit!29471)

(declare-fun lt!389969 () V!27337)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49653 0))(
  ( (array!49654 (arr!23853 (Array (_ BitVec 32) (_ BitVec 64))) (size!24294 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49653)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!482 (ListLongMap!9819 (_ BitVec 64) V!27337 (_ BitVec 64) V!27337) Unit!29471)

(assert (=> b!863679 (= lt!389958 (addCommutativeForDiffKeys!482 lt!389954 k0!854 v!557 (select (arr!23853 _keys!868) from!1053) lt!389969))))

(declare-fun b!863680 () Bool)

(declare-fun e!481257 () Bool)

(declare-fun mapRes!26675 () Bool)

(assert (=> b!863680 (= e!481257 (and e!481256 mapRes!26675))))

(declare-fun condMapEmpty!26675 () Bool)

(declare-datatypes ((ValueCell!7919 0))(
  ( (ValueCellFull!7919 (v!10831 V!27337)) (EmptyCell!7919) )
))
(declare-datatypes ((array!49655 0))(
  ( (array!49656 (arr!23854 (Array (_ BitVec 32) ValueCell!7919)) (size!24295 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49655)

(declare-fun mapDefault!26675 () ValueCell!7919)

(assert (=> b!863680 (= condMapEmpty!26675 (= (arr!23854 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7919)) mapDefault!26675)))))

(declare-fun b!863682 () Bool)

(declare-fun e!481251 () Unit!29471)

(declare-fun Unit!29473 () Unit!29471)

(assert (=> b!863682 (= e!481251 Unit!29473)))

(declare-fun b!863683 () Bool)

(declare-fun res!586630 () Bool)

(declare-fun e!481258 () Bool)

(assert (=> b!863683 (=> (not res!586630) (not e!481258))))

(declare-datatypes ((List!16884 0))(
  ( (Nil!16881) (Cons!16880 (h!18017 (_ BitVec 64)) (t!23723 List!16884)) )
))
(declare-fun arrayNoDuplicates!0 (array!49653 (_ BitVec 32) List!16884) Bool)

(assert (=> b!863683 (= res!586630 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16881))))

(declare-fun b!863684 () Bool)

(declare-fun res!586638 () Bool)

(assert (=> b!863684 (=> (not res!586638) (not e!481258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863684 (= res!586638 (validKeyInArray!0 k0!854))))

(declare-fun b!863685 () Bool)

(declare-fun res!586635 () Bool)

(assert (=> b!863685 (=> (not res!586635) (not e!481258))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!863685 (= res!586635 (and (= (select (arr!23853 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!863686 () Bool)

(declare-fun res!586631 () Bool)

(assert (=> b!863686 (=> (not res!586631) (not e!481258))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49653 (_ BitVec 32)) Bool)

(assert (=> b!863686 (= res!586631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!863687 () Bool)

(declare-fun e!481250 () Bool)

(assert (=> b!863687 (= e!481250 tp_is_empty!16717)))

(declare-fun b!863688 () Bool)

(declare-fun e!481254 () Bool)

(declare-fun e!481252 () Bool)

(assert (=> b!863688 (= e!481254 (not e!481252))))

(declare-fun res!586629 () Bool)

(assert (=> b!863688 (=> res!586629 e!481252)))

(assert (=> b!863688 (= res!586629 (not (validKeyInArray!0 (select (arr!23853 _keys!868) from!1053))))))

(declare-fun lt!389968 () ListLongMap!9819)

(declare-fun lt!389967 () ListLongMap!9819)

(assert (=> b!863688 (= lt!389968 lt!389967)))

(assert (=> b!863688 (= lt!389967 (+!2329 lt!389954 lt!389966))))

(declare-fun lt!389956 () array!49655)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27337)

(declare-fun zeroValue!654 () V!27337)

(declare-fun getCurrentListMapNoExtraKeys!2976 (array!49653 array!49655 (_ BitVec 32) (_ BitVec 32) V!27337 V!27337 (_ BitVec 32) Int) ListLongMap!9819)

(assert (=> b!863688 (= lt!389968 (getCurrentListMapNoExtraKeys!2976 _keys!868 lt!389956 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!863688 (= lt!389966 (tuple2!11049 k0!854 v!557))))

(assert (=> b!863688 (= lt!389954 (getCurrentListMapNoExtraKeys!2976 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389959 () Unit!29471)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!516 (array!49653 array!49655 (_ BitVec 32) (_ BitVec 32) V!27337 V!27337 (_ BitVec 32) (_ BitVec 64) V!27337 (_ BitVec 32) Int) Unit!29471)

(assert (=> b!863688 (= lt!389959 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!516 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26675 () Bool)

(assert (=> mapIsEmpty!26675 mapRes!26675))

(declare-fun b!863689 () Bool)

(declare-fun res!586637 () Bool)

(assert (=> b!863689 (=> (not res!586637) (not e!481258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863689 (= res!586637 (validMask!0 mask!1196))))

(declare-fun b!863690 () Bool)

(declare-fun res!586639 () Bool)

(assert (=> b!863690 (=> (not res!586639) (not e!481258))))

(assert (=> b!863690 (= res!586639 (and (= (size!24295 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24294 _keys!868) (size!24295 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863691 () Bool)

(declare-fun res!586633 () Bool)

(assert (=> b!863691 (=> (not res!586633) (not e!481258))))

(assert (=> b!863691 (= res!586633 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24294 _keys!868))))))

(declare-fun mapNonEmpty!26675 () Bool)

(declare-fun tp!51247 () Bool)

(assert (=> mapNonEmpty!26675 (= mapRes!26675 (and tp!51247 e!481250))))

(declare-fun mapValue!26675 () ValueCell!7919)

(declare-fun mapKey!26675 () (_ BitVec 32))

(declare-fun mapRest!26675 () (Array (_ BitVec 32) ValueCell!7919))

(assert (=> mapNonEmpty!26675 (= (arr!23854 _values!688) (store mapRest!26675 mapKey!26675 mapValue!26675))))

(declare-fun res!586632 () Bool)

(assert (=> start!73834 (=> (not res!586632) (not e!481258))))

(assert (=> start!73834 (= res!586632 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24294 _keys!868))))))

(assert (=> start!73834 e!481258))

(assert (=> start!73834 tp_is_empty!16717))

(assert (=> start!73834 true))

(assert (=> start!73834 tp!51248))

(declare-fun array_inv!18922 (array!49653) Bool)

(assert (=> start!73834 (array_inv!18922 _keys!868)))

(declare-fun array_inv!18923 (array!49655) Bool)

(assert (=> start!73834 (and (array_inv!18923 _values!688) e!481257)))

(declare-fun b!863681 () Bool)

(declare-fun Unit!29474 () Unit!29471)

(assert (=> b!863681 (= e!481251 Unit!29474)))

(declare-fun lt!389955 () Unit!29471)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49653 (_ BitVec 32) (_ BitVec 32)) Unit!29471)

(assert (=> b!863681 (= lt!389955 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!863681 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16881)))

(declare-fun lt!389965 () Unit!29471)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49653 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29471)

(assert (=> b!863681 (= lt!389965 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863681 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389962 () Unit!29471)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49653 (_ BitVec 64) (_ BitVec 32) List!16884) Unit!29471)

(assert (=> b!863681 (= lt!389962 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16881))))

(assert (=> b!863681 false))

(declare-fun b!863692 () Bool)

(assert (=> b!863692 (= e!481252 e!481253)))

(declare-fun res!586636 () Bool)

(assert (=> b!863692 (=> res!586636 e!481253)))

(assert (=> b!863692 (= res!586636 (= k0!854 (select (arr!23853 _keys!868) from!1053)))))

(assert (=> b!863692 (not (= (select (arr!23853 _keys!868) from!1053) k0!854))))

(declare-fun lt!389964 () Unit!29471)

(assert (=> b!863692 (= lt!389964 e!481251)))

(declare-fun c!92374 () Bool)

(assert (=> b!863692 (= c!92374 (= (select (arr!23853 _keys!868) from!1053) k0!854))))

(declare-fun lt!389961 () ListLongMap!9819)

(assert (=> b!863692 (= lt!389961 lt!389963)))

(assert (=> b!863692 (= lt!389963 (+!2329 lt!389967 lt!389957))))

(assert (=> b!863692 (= lt!389957 (tuple2!11049 (select (arr!23853 _keys!868) from!1053) lt!389969))))

(declare-fun get!12599 (ValueCell!7919 V!27337) V!27337)

(declare-fun dynLambda!1155 (Int (_ BitVec 64)) V!27337)

(assert (=> b!863692 (= lt!389969 (get!12599 (select (arr!23854 _values!688) from!1053) (dynLambda!1155 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!863693 () Bool)

(assert (=> b!863693 (= e!481258 e!481254)))

(declare-fun res!586634 () Bool)

(assert (=> b!863693 (=> (not res!586634) (not e!481254))))

(assert (=> b!863693 (= res!586634 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!863693 (= lt!389961 (getCurrentListMapNoExtraKeys!2976 _keys!868 lt!389956 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!863693 (= lt!389956 (array!49656 (store (arr!23854 _values!688) i!612 (ValueCellFull!7919 v!557)) (size!24295 _values!688)))))

(declare-fun lt!389960 () ListLongMap!9819)

(assert (=> b!863693 (= lt!389960 (getCurrentListMapNoExtraKeys!2976 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73834 res!586632) b!863689))

(assert (= (and b!863689 res!586637) b!863690))

(assert (= (and b!863690 res!586639) b!863686))

(assert (= (and b!863686 res!586631) b!863683))

(assert (= (and b!863683 res!586630) b!863691))

(assert (= (and b!863691 res!586633) b!863684))

(assert (= (and b!863684 res!586638) b!863685))

(assert (= (and b!863685 res!586635) b!863693))

(assert (= (and b!863693 res!586634) b!863688))

(assert (= (and b!863688 (not res!586629)) b!863692))

(assert (= (and b!863692 c!92374) b!863681))

(assert (= (and b!863692 (not c!92374)) b!863682))

(assert (= (and b!863692 (not res!586636)) b!863679))

(assert (= (and b!863680 condMapEmpty!26675) mapIsEmpty!26675))

(assert (= (and b!863680 (not condMapEmpty!26675)) mapNonEmpty!26675))

(get-info :version)

(assert (= (and mapNonEmpty!26675 ((_ is ValueCellFull!7919) mapValue!26675)) b!863687))

(assert (= (and b!863680 ((_ is ValueCellFull!7919) mapDefault!26675)) b!863678))

(assert (= start!73834 b!863680))

(declare-fun b_lambda!11947 () Bool)

(assert (=> (not b_lambda!11947) (not b!863692)))

(declare-fun t!23721 () Bool)

(declare-fun tb!4695 () Bool)

(assert (=> (and start!73834 (= defaultEntry!696 defaultEntry!696) t!23721) tb!4695))

(declare-fun result!9009 () Bool)

(assert (=> tb!4695 (= result!9009 tp_is_empty!16717)))

(assert (=> b!863692 t!23721))

(declare-fun b_and!24153 () Bool)

(assert (= b_and!24151 (and (=> t!23721 result!9009) b_and!24153)))

(declare-fun m!805139 () Bool)

(assert (=> mapNonEmpty!26675 m!805139))

(declare-fun m!805141 () Bool)

(assert (=> b!863679 m!805141))

(assert (=> b!863679 m!805141))

(declare-fun m!805143 () Bool)

(assert (=> b!863679 m!805143))

(declare-fun m!805145 () Bool)

(assert (=> b!863679 m!805145))

(assert (=> b!863679 m!805145))

(declare-fun m!805147 () Bool)

(assert (=> b!863679 m!805147))

(declare-fun m!805149 () Bool)

(assert (=> b!863681 m!805149))

(declare-fun m!805151 () Bool)

(assert (=> b!863681 m!805151))

(declare-fun m!805153 () Bool)

(assert (=> b!863681 m!805153))

(declare-fun m!805155 () Bool)

(assert (=> b!863681 m!805155))

(declare-fun m!805157 () Bool)

(assert (=> b!863681 m!805157))

(declare-fun m!805159 () Bool)

(assert (=> b!863692 m!805159))

(declare-fun m!805161 () Bool)

(assert (=> b!863692 m!805161))

(declare-fun m!805163 () Bool)

(assert (=> b!863692 m!805163))

(declare-fun m!805165 () Bool)

(assert (=> b!863692 m!805165))

(assert (=> b!863692 m!805161))

(assert (=> b!863692 m!805145))

(assert (=> b!863692 m!805163))

(declare-fun m!805167 () Bool)

(assert (=> start!73834 m!805167))

(declare-fun m!805169 () Bool)

(assert (=> start!73834 m!805169))

(declare-fun m!805171 () Bool)

(assert (=> b!863689 m!805171))

(declare-fun m!805173 () Bool)

(assert (=> b!863685 m!805173))

(declare-fun m!805175 () Bool)

(assert (=> b!863693 m!805175))

(declare-fun m!805177 () Bool)

(assert (=> b!863693 m!805177))

(declare-fun m!805179 () Bool)

(assert (=> b!863693 m!805179))

(declare-fun m!805181 () Bool)

(assert (=> b!863684 m!805181))

(declare-fun m!805183 () Bool)

(assert (=> b!863688 m!805183))

(declare-fun m!805185 () Bool)

(assert (=> b!863688 m!805185))

(declare-fun m!805187 () Bool)

(assert (=> b!863688 m!805187))

(assert (=> b!863688 m!805145))

(declare-fun m!805189 () Bool)

(assert (=> b!863688 m!805189))

(assert (=> b!863688 m!805145))

(declare-fun m!805191 () Bool)

(assert (=> b!863688 m!805191))

(declare-fun m!805193 () Bool)

(assert (=> b!863686 m!805193))

(declare-fun m!805195 () Bool)

(assert (=> b!863683 m!805195))

(check-sat (not b!863684) (not b!863693) b_and!24153 (not b!863686) (not b!863688) (not b!863692) (not b!863689) (not b_lambda!11947) (not start!73834) (not b!863681) tp_is_empty!16717 (not b_next!14581) (not b!863679) (not b!863683) (not mapNonEmpty!26675))
(check-sat b_and!24153 (not b_next!14581))
