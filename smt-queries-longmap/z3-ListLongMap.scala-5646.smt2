; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73662 () Bool)

(assert start!73662)

(declare-fun b_free!14577 () Bool)

(declare-fun b_next!14577 () Bool)

(assert (=> start!73662 (= b_free!14577 (not b_next!14577))))

(declare-fun tp!51235 () Bool)

(declare-fun b_and!24133 () Bool)

(assert (=> start!73662 (= tp!51235 b_and!24133)))

(declare-fun b!862676 () Bool)

(declare-fun res!586220 () Bool)

(declare-fun e!480621 () Bool)

(assert (=> b!862676 (=> (not res!586220) (not e!480621))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49590 0))(
  ( (array!49591 (arr!23826 (Array (_ BitVec 32) (_ BitVec 64))) (size!24266 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49590)

(declare-datatypes ((V!27331 0))(
  ( (V!27332 (val!8404 Int)) )
))
(declare-datatypes ((ValueCell!7917 0))(
  ( (ValueCellFull!7917 (v!10829 V!27331)) (EmptyCell!7917) )
))
(declare-datatypes ((array!49592 0))(
  ( (array!49593 (arr!23827 (Array (_ BitVec 32) ValueCell!7917)) (size!24267 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49592)

(assert (=> b!862676 (= res!586220 (and (= (size!24267 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24266 _keys!868) (size!24267 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!862677 () Bool)

(declare-fun res!586223 () Bool)

(assert (=> b!862677 (=> (not res!586223) (not e!480621))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!862677 (= res!586223 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24266 _keys!868))))))

(declare-fun mapNonEmpty!26669 () Bool)

(declare-fun mapRes!26669 () Bool)

(declare-fun tp!51234 () Bool)

(declare-fun e!480618 () Bool)

(assert (=> mapNonEmpty!26669 (= mapRes!26669 (and tp!51234 e!480618))))

(declare-fun mapValue!26669 () ValueCell!7917)

(declare-fun mapKey!26669 () (_ BitVec 32))

(declare-fun mapRest!26669 () (Array (_ BitVec 32) ValueCell!7917))

(assert (=> mapNonEmpty!26669 (= (arr!23827 _values!688) (store mapRest!26669 mapKey!26669 mapValue!26669))))

(declare-fun b!862678 () Bool)

(declare-fun res!586227 () Bool)

(assert (=> b!862678 (=> (not res!586227) (not e!480621))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!862678 (= res!586227 (and (= (select (arr!23826 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!862679 () Bool)

(declare-fun e!480614 () Bool)

(declare-fun e!480619 () Bool)

(assert (=> b!862679 (= e!480614 e!480619)))

(declare-fun res!586222 () Bool)

(assert (=> b!862679 (=> res!586222 e!480619)))

(assert (=> b!862679 (= res!586222 (= k0!854 (select (arr!23826 _keys!868) from!1053)))))

(assert (=> b!862679 (not (= (select (arr!23826 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29469 0))(
  ( (Unit!29470) )
))
(declare-fun lt!389502 () Unit!29469)

(declare-fun e!480620 () Unit!29469)

(assert (=> b!862679 (= lt!389502 e!480620)))

(declare-fun c!92086 () Bool)

(assert (=> b!862679 (= c!92086 (= (select (arr!23826 _keys!868) from!1053) k0!854))))

(declare-datatypes ((tuple2!11118 0))(
  ( (tuple2!11119 (_1!5570 (_ BitVec 64)) (_2!5570 V!27331)) )
))
(declare-datatypes ((List!16927 0))(
  ( (Nil!16924) (Cons!16923 (h!18054 tuple2!11118) (t!23770 List!16927)) )
))
(declare-datatypes ((ListLongMap!9887 0))(
  ( (ListLongMap!9888 (toList!4959 List!16927)) )
))
(declare-fun lt!389504 () ListLongMap!9887)

(declare-fun lt!389499 () ListLongMap!9887)

(assert (=> b!862679 (= lt!389504 lt!389499)))

(declare-fun lt!389503 () ListLongMap!9887)

(declare-fun lt!389497 () tuple2!11118)

(declare-fun +!2308 (ListLongMap!9887 tuple2!11118) ListLongMap!9887)

(assert (=> b!862679 (= lt!389499 (+!2308 lt!389503 lt!389497))))

(declare-fun lt!389508 () V!27331)

(assert (=> b!862679 (= lt!389497 (tuple2!11119 (select (arr!23826 _keys!868) from!1053) lt!389508))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12576 (ValueCell!7917 V!27331) V!27331)

(declare-fun dynLambda!1140 (Int (_ BitVec 64)) V!27331)

(assert (=> b!862679 (= lt!389508 (get!12576 (select (arr!23827 _values!688) from!1053) (dynLambda!1140 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!862680 () Bool)

(declare-fun Unit!29471 () Unit!29469)

(assert (=> b!862680 (= e!480620 Unit!29471)))

(declare-fun lt!389511 () Unit!29469)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49590 (_ BitVec 32) (_ BitVec 32)) Unit!29469)

(assert (=> b!862680 (= lt!389511 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16928 0))(
  ( (Nil!16925) (Cons!16924 (h!18055 (_ BitVec 64)) (t!23771 List!16928)) )
))
(declare-fun arrayNoDuplicates!0 (array!49590 (_ BitVec 32) List!16928) Bool)

(assert (=> b!862680 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16925)))

(declare-fun lt!389500 () Unit!29469)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49590 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29469)

(assert (=> b!862680 (= lt!389500 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862680 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389507 () Unit!29469)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49590 (_ BitVec 64) (_ BitVec 32) List!16928) Unit!29469)

(assert (=> b!862680 (= lt!389507 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16925))))

(assert (=> b!862680 false))

(declare-fun b!862681 () Bool)

(declare-fun e!480617 () Bool)

(assert (=> b!862681 (= e!480617 (not e!480614))))

(declare-fun res!586225 () Bool)

(assert (=> b!862681 (=> res!586225 e!480614)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862681 (= res!586225 (not (validKeyInArray!0 (select (arr!23826 _keys!868) from!1053))))))

(declare-fun lt!389505 () ListLongMap!9887)

(assert (=> b!862681 (= lt!389505 lt!389503)))

(declare-fun lt!389509 () ListLongMap!9887)

(declare-fun lt!389512 () tuple2!11118)

(assert (=> b!862681 (= lt!389503 (+!2308 lt!389509 lt!389512))))

(declare-fun lt!389498 () array!49592)

(declare-fun minValue!654 () V!27331)

(declare-fun zeroValue!654 () V!27331)

(declare-fun getCurrentListMapNoExtraKeys!2935 (array!49590 array!49592 (_ BitVec 32) (_ BitVec 32) V!27331 V!27331 (_ BitVec 32) Int) ListLongMap!9887)

(assert (=> b!862681 (= lt!389505 (getCurrentListMapNoExtraKeys!2935 _keys!868 lt!389498 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27331)

(assert (=> b!862681 (= lt!389512 (tuple2!11119 k0!854 v!557))))

(assert (=> b!862681 (= lt!389509 (getCurrentListMapNoExtraKeys!2935 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389506 () Unit!29469)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!517 (array!49590 array!49592 (_ BitVec 32) (_ BitVec 32) V!27331 V!27331 (_ BitVec 32) (_ BitVec 64) V!27331 (_ BitVec 32) Int) Unit!29469)

(assert (=> b!862681 (= lt!389506 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!517 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!862682 () Bool)

(declare-fun Unit!29472 () Unit!29469)

(assert (=> b!862682 (= e!480620 Unit!29472)))

(declare-fun b!862683 () Bool)

(assert (=> b!862683 (= e!480619 true)))

(assert (=> b!862683 (= lt!389499 (+!2308 (+!2308 lt!389509 lt!389497) lt!389512))))

(declare-fun lt!389501 () Unit!29469)

(declare-fun addCommutativeForDiffKeys!484 (ListLongMap!9887 (_ BitVec 64) V!27331 (_ BitVec 64) V!27331) Unit!29469)

(assert (=> b!862683 (= lt!389501 (addCommutativeForDiffKeys!484 lt!389509 k0!854 v!557 (select (arr!23826 _keys!868) from!1053) lt!389508))))

(declare-fun b!862684 () Bool)

(declare-fun res!586224 () Bool)

(assert (=> b!862684 (=> (not res!586224) (not e!480621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862684 (= res!586224 (validMask!0 mask!1196))))

(declare-fun b!862685 () Bool)

(declare-fun e!480616 () Bool)

(declare-fun tp_is_empty!16713 () Bool)

(assert (=> b!862685 (= e!480616 tp_is_empty!16713)))

(declare-fun b!862675 () Bool)

(assert (=> b!862675 (= e!480618 tp_is_empty!16713)))

(declare-fun res!586226 () Bool)

(assert (=> start!73662 (=> (not res!586226) (not e!480621))))

(assert (=> start!73662 (= res!586226 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24266 _keys!868))))))

(assert (=> start!73662 e!480621))

(assert (=> start!73662 tp_is_empty!16713))

(assert (=> start!73662 true))

(assert (=> start!73662 tp!51235))

(declare-fun array_inv!18850 (array!49590) Bool)

(assert (=> start!73662 (array_inv!18850 _keys!868)))

(declare-fun e!480615 () Bool)

(declare-fun array_inv!18851 (array!49592) Bool)

(assert (=> start!73662 (and (array_inv!18851 _values!688) e!480615)))

(declare-fun b!862686 () Bool)

(assert (=> b!862686 (= e!480615 (and e!480616 mapRes!26669))))

(declare-fun condMapEmpty!26669 () Bool)

(declare-fun mapDefault!26669 () ValueCell!7917)

(assert (=> b!862686 (= condMapEmpty!26669 (= (arr!23827 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7917)) mapDefault!26669)))))

(declare-fun b!862687 () Bool)

(assert (=> b!862687 (= e!480621 e!480617)))

(declare-fun res!586221 () Bool)

(assert (=> b!862687 (=> (not res!586221) (not e!480617))))

(assert (=> b!862687 (= res!586221 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!862687 (= lt!389504 (getCurrentListMapNoExtraKeys!2935 _keys!868 lt!389498 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!862687 (= lt!389498 (array!49593 (store (arr!23827 _values!688) i!612 (ValueCellFull!7917 v!557)) (size!24267 _values!688)))))

(declare-fun lt!389510 () ListLongMap!9887)

(assert (=> b!862687 (= lt!389510 (getCurrentListMapNoExtraKeys!2935 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26669 () Bool)

(assert (=> mapIsEmpty!26669 mapRes!26669))

(declare-fun b!862688 () Bool)

(declare-fun res!586228 () Bool)

(assert (=> b!862688 (=> (not res!586228) (not e!480621))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49590 (_ BitVec 32)) Bool)

(assert (=> b!862688 (= res!586228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!862689 () Bool)

(declare-fun res!586219 () Bool)

(assert (=> b!862689 (=> (not res!586219) (not e!480621))))

(assert (=> b!862689 (= res!586219 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16925))))

(declare-fun b!862690 () Bool)

(declare-fun res!586229 () Bool)

(assert (=> b!862690 (=> (not res!586229) (not e!480621))))

(assert (=> b!862690 (= res!586229 (validKeyInArray!0 k0!854))))

(assert (= (and start!73662 res!586226) b!862684))

(assert (= (and b!862684 res!586224) b!862676))

(assert (= (and b!862676 res!586220) b!862688))

(assert (= (and b!862688 res!586228) b!862689))

(assert (= (and b!862689 res!586219) b!862677))

(assert (= (and b!862677 res!586223) b!862690))

(assert (= (and b!862690 res!586229) b!862678))

(assert (= (and b!862678 res!586227) b!862687))

(assert (= (and b!862687 res!586221) b!862681))

(assert (= (and b!862681 (not res!586225)) b!862679))

(assert (= (and b!862679 c!92086) b!862680))

(assert (= (and b!862679 (not c!92086)) b!862682))

(assert (= (and b!862679 (not res!586222)) b!862683))

(assert (= (and b!862686 condMapEmpty!26669) mapIsEmpty!26669))

(assert (= (and b!862686 (not condMapEmpty!26669)) mapNonEmpty!26669))

(get-info :version)

(assert (= (and mapNonEmpty!26669 ((_ is ValueCellFull!7917) mapValue!26669)) b!862675))

(assert (= (and b!862686 ((_ is ValueCellFull!7917) mapDefault!26669)) b!862685))

(assert (= start!73662 b!862686))

(declare-fun b_lambda!11929 () Bool)

(assert (=> (not b_lambda!11929) (not b!862679)))

(declare-fun t!23769 () Bool)

(declare-fun tb!4699 () Bool)

(assert (=> (and start!73662 (= defaultEntry!696 defaultEntry!696) t!23769) tb!4699))

(declare-fun result!9009 () Bool)

(assert (=> tb!4699 (= result!9009 tp_is_empty!16713)))

(assert (=> b!862679 t!23769))

(declare-fun b_and!24135 () Bool)

(assert (= b_and!24133 (and (=> t!23769 result!9009) b_and!24135)))

(declare-fun m!803733 () Bool)

(assert (=> mapNonEmpty!26669 m!803733))

(declare-fun m!803735 () Bool)

(assert (=> start!73662 m!803735))

(declare-fun m!803737 () Bool)

(assert (=> start!73662 m!803737))

(declare-fun m!803739 () Bool)

(assert (=> b!862679 m!803739))

(declare-fun m!803741 () Bool)

(assert (=> b!862679 m!803741))

(declare-fun m!803743 () Bool)

(assert (=> b!862679 m!803743))

(declare-fun m!803745 () Bool)

(assert (=> b!862679 m!803745))

(assert (=> b!862679 m!803741))

(declare-fun m!803747 () Bool)

(assert (=> b!862679 m!803747))

(assert (=> b!862679 m!803743))

(declare-fun m!803749 () Bool)

(assert (=> b!862689 m!803749))

(declare-fun m!803751 () Bool)

(assert (=> b!862688 m!803751))

(declare-fun m!803753 () Bool)

(assert (=> b!862678 m!803753))

(declare-fun m!803755 () Bool)

(assert (=> b!862681 m!803755))

(declare-fun m!803757 () Bool)

(assert (=> b!862681 m!803757))

(declare-fun m!803759 () Bool)

(assert (=> b!862681 m!803759))

(assert (=> b!862681 m!803747))

(declare-fun m!803761 () Bool)

(assert (=> b!862681 m!803761))

(assert (=> b!862681 m!803747))

(declare-fun m!803763 () Bool)

(assert (=> b!862681 m!803763))

(declare-fun m!803765 () Bool)

(assert (=> b!862687 m!803765))

(declare-fun m!803767 () Bool)

(assert (=> b!862687 m!803767))

(declare-fun m!803769 () Bool)

(assert (=> b!862687 m!803769))

(declare-fun m!803771 () Bool)

(assert (=> b!862690 m!803771))

(declare-fun m!803773 () Bool)

(assert (=> b!862684 m!803773))

(declare-fun m!803775 () Bool)

(assert (=> b!862683 m!803775))

(assert (=> b!862683 m!803775))

(declare-fun m!803777 () Bool)

(assert (=> b!862683 m!803777))

(assert (=> b!862683 m!803747))

(assert (=> b!862683 m!803747))

(declare-fun m!803779 () Bool)

(assert (=> b!862683 m!803779))

(declare-fun m!803781 () Bool)

(assert (=> b!862680 m!803781))

(declare-fun m!803783 () Bool)

(assert (=> b!862680 m!803783))

(declare-fun m!803785 () Bool)

(assert (=> b!862680 m!803785))

(declare-fun m!803787 () Bool)

(assert (=> b!862680 m!803787))

(declare-fun m!803789 () Bool)

(assert (=> b!862680 m!803789))

(check-sat (not mapNonEmpty!26669) (not b_next!14577) (not b!862679) (not b!862684) (not b!862687) (not b!862680) (not b!862688) (not b_lambda!11929) (not b!862681) b_and!24135 (not b!862683) tp_is_empty!16713 (not b!862689) (not b!862690) (not start!73662))
(check-sat b_and!24135 (not b_next!14577))
