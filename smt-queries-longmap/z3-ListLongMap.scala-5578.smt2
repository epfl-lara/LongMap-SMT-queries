; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73234 () Bool)

(assert start!73234)

(declare-fun b_free!14167 () Bool)

(declare-fun b_next!14167 () Bool)

(assert (=> start!73234 (= b_free!14167 (not b_next!14167))))

(declare-fun tp!50005 () Bool)

(declare-fun b_and!23467 () Bool)

(assert (=> start!73234 (= tp!50005 b_and!23467)))

(declare-fun b!853840 () Bool)

(declare-fun e!476122 () Bool)

(declare-fun tp_is_empty!16303 () Bool)

(assert (=> b!853840 (= e!476122 tp_is_empty!16303)))

(declare-fun b!853841 () Bool)

(declare-fun e!476123 () Bool)

(assert (=> b!853841 (= e!476123 tp_is_empty!16303)))

(declare-fun res!579925 () Bool)

(declare-fun e!476117 () Bool)

(assert (=> start!73234 (=> (not res!579925) (not e!476117))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48789 0))(
  ( (array!48790 (arr!23426 (Array (_ BitVec 32) (_ BitVec 64))) (size!23868 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48789)

(assert (=> start!73234 (= res!579925 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23868 _keys!868))))))

(assert (=> start!73234 e!476117))

(assert (=> start!73234 tp_is_empty!16303))

(assert (=> start!73234 true))

(assert (=> start!73234 tp!50005))

(declare-fun array_inv!18652 (array!48789) Bool)

(assert (=> start!73234 (array_inv!18652 _keys!868)))

(declare-datatypes ((V!26785 0))(
  ( (V!26786 (val!8199 Int)) )
))
(declare-datatypes ((ValueCell!7712 0))(
  ( (ValueCellFull!7712 (v!10618 V!26785)) (EmptyCell!7712) )
))
(declare-datatypes ((array!48791 0))(
  ( (array!48792 (arr!23427 (Array (_ BitVec 32) ValueCell!7712)) (size!23869 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48791)

(declare-fun e!476121 () Bool)

(declare-fun array_inv!18653 (array!48791) Bool)

(assert (=> start!73234 (and (array_inv!18653 _values!688) e!476121)))

(declare-fun b!853842 () Bool)

(declare-fun res!579919 () Bool)

(assert (=> b!853842 (=> (not res!579919) (not e!476117))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853842 (= res!579919 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23868 _keys!868))))))

(declare-fun mapNonEmpty!26054 () Bool)

(declare-fun mapRes!26054 () Bool)

(declare-fun tp!50006 () Bool)

(assert (=> mapNonEmpty!26054 (= mapRes!26054 (and tp!50006 e!476122))))

(declare-fun mapKey!26054 () (_ BitVec 32))

(declare-fun mapRest!26054 () (Array (_ BitVec 32) ValueCell!7712))

(declare-fun mapValue!26054 () ValueCell!7712)

(assert (=> mapNonEmpty!26054 (= (arr!23427 _values!688) (store mapRest!26054 mapKey!26054 mapValue!26054))))

(declare-fun b!853843 () Bool)

(declare-fun e!476120 () Bool)

(assert (=> b!853843 (= e!476120 true)))

(declare-datatypes ((tuple2!10804 0))(
  ( (tuple2!10805 (_1!5413 (_ BitVec 64)) (_2!5413 V!26785)) )
))
(declare-fun lt!384912 () tuple2!10804)

(declare-datatypes ((List!16622 0))(
  ( (Nil!16619) (Cons!16618 (h!17749 tuple2!10804) (t!23226 List!16622)) )
))
(declare-datatypes ((ListLongMap!9563 0))(
  ( (ListLongMap!9564 (toList!4797 List!16622)) )
))
(declare-fun lt!384914 () ListLongMap!9563)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!384908 () V!26785)

(declare-fun +!2207 (ListLongMap!9563 tuple2!10804) ListLongMap!9563)

(assert (=> b!853843 (= (+!2207 lt!384914 lt!384912) (+!2207 (+!2207 lt!384914 (tuple2!10805 k0!854 lt!384908)) lt!384912))))

(declare-fun lt!384915 () V!26785)

(assert (=> b!853843 (= lt!384912 (tuple2!10805 k0!854 lt!384915))))

(declare-datatypes ((Unit!29087 0))(
  ( (Unit!29088) )
))
(declare-fun lt!384917 () Unit!29087)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!315 (ListLongMap!9563 (_ BitVec 64) V!26785 V!26785) Unit!29087)

(assert (=> b!853843 (= lt!384917 (addSameAsAddTwiceSameKeyDiffValues!315 lt!384914 k0!854 lt!384908 lt!384915))))

(declare-fun lt!384911 () V!26785)

(declare-fun get!12368 (ValueCell!7712 V!26785) V!26785)

(assert (=> b!853843 (= lt!384908 (get!12368 (select (arr!23427 _values!688) from!1053) lt!384911))))

(declare-fun lt!384913 () ListLongMap!9563)

(assert (=> b!853843 (= lt!384913 (+!2207 lt!384914 (tuple2!10805 (select (arr!23426 _keys!868) from!1053) lt!384915)))))

(declare-fun v!557 () V!26785)

(assert (=> b!853843 (= lt!384915 (get!12368 (select (store (arr!23427 _values!688) i!612 (ValueCellFull!7712 v!557)) from!1053) lt!384911))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1065 (Int (_ BitVec 64)) V!26785)

(assert (=> b!853843 (= lt!384911 (dynLambda!1065 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!384909 () array!48791)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26785)

(declare-fun zeroValue!654 () V!26785)

(declare-fun getCurrentListMapNoExtraKeys!2804 (array!48789 array!48791 (_ BitVec 32) (_ BitVec 32) V!26785 V!26785 (_ BitVec 32) Int) ListLongMap!9563)

(assert (=> b!853843 (= lt!384914 (getCurrentListMapNoExtraKeys!2804 _keys!868 lt!384909 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853844 () Bool)

(declare-fun e!476119 () Bool)

(assert (=> b!853844 (= e!476119 (not e!476120))))

(declare-fun res!579926 () Bool)

(assert (=> b!853844 (=> res!579926 e!476120)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853844 (= res!579926 (not (validKeyInArray!0 (select (arr!23426 _keys!868) from!1053))))))

(declare-fun e!476124 () Bool)

(assert (=> b!853844 e!476124))

(declare-fun c!91856 () Bool)

(assert (=> b!853844 (= c!91856 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!384916 () Unit!29087)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!408 (array!48789 array!48791 (_ BitVec 32) (_ BitVec 32) V!26785 V!26785 (_ BitVec 32) (_ BitVec 64) V!26785 (_ BitVec 32) Int) Unit!29087)

(assert (=> b!853844 (= lt!384916 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!408 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853845 () Bool)

(declare-fun res!579924 () Bool)

(assert (=> b!853845 (=> (not res!579924) (not e!476117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48789 (_ BitVec 32)) Bool)

(assert (=> b!853845 (= res!579924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun call!38330 () ListLongMap!9563)

(declare-fun b!853846 () Bool)

(declare-fun call!38331 () ListLongMap!9563)

(assert (=> b!853846 (= e!476124 (= call!38330 (+!2207 call!38331 (tuple2!10805 k0!854 v!557))))))

(declare-fun b!853847 () Bool)

(declare-fun res!579921 () Bool)

(assert (=> b!853847 (=> (not res!579921) (not e!476117))))

(assert (=> b!853847 (= res!579921 (validKeyInArray!0 k0!854))))

(declare-fun b!853848 () Bool)

(assert (=> b!853848 (= e!476117 e!476119)))

(declare-fun res!579918 () Bool)

(assert (=> b!853848 (=> (not res!579918) (not e!476119))))

(assert (=> b!853848 (= res!579918 (= from!1053 i!612))))

(assert (=> b!853848 (= lt!384913 (getCurrentListMapNoExtraKeys!2804 _keys!868 lt!384909 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!853848 (= lt!384909 (array!48792 (store (arr!23427 _values!688) i!612 (ValueCellFull!7712 v!557)) (size!23869 _values!688)))))

(declare-fun lt!384910 () ListLongMap!9563)

(assert (=> b!853848 (= lt!384910 (getCurrentListMapNoExtraKeys!2804 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26054 () Bool)

(assert (=> mapIsEmpty!26054 mapRes!26054))

(declare-fun b!853849 () Bool)

(declare-fun res!579927 () Bool)

(assert (=> b!853849 (=> (not res!579927) (not e!476117))))

(assert (=> b!853849 (= res!579927 (and (= (size!23869 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23868 _keys!868) (size!23869 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!853850 () Bool)

(assert (=> b!853850 (= e!476121 (and e!476123 mapRes!26054))))

(declare-fun condMapEmpty!26054 () Bool)

(declare-fun mapDefault!26054 () ValueCell!7712)

(assert (=> b!853850 (= condMapEmpty!26054 (= (arr!23427 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7712)) mapDefault!26054)))))

(declare-fun b!853851 () Bool)

(declare-fun res!579923 () Bool)

(assert (=> b!853851 (=> (not res!579923) (not e!476117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853851 (= res!579923 (validMask!0 mask!1196))))

(declare-fun b!853852 () Bool)

(declare-fun res!579922 () Bool)

(assert (=> b!853852 (=> (not res!579922) (not e!476117))))

(declare-datatypes ((List!16623 0))(
  ( (Nil!16620) (Cons!16619 (h!17750 (_ BitVec 64)) (t!23227 List!16623)) )
))
(declare-fun arrayNoDuplicates!0 (array!48789 (_ BitVec 32) List!16623) Bool)

(assert (=> b!853852 (= res!579922 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16620))))

(declare-fun bm!38327 () Bool)

(assert (=> bm!38327 (= call!38331 (getCurrentListMapNoExtraKeys!2804 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853853 () Bool)

(declare-fun res!579920 () Bool)

(assert (=> b!853853 (=> (not res!579920) (not e!476117))))

(assert (=> b!853853 (= res!579920 (and (= (select (arr!23426 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun bm!38328 () Bool)

(assert (=> bm!38328 (= call!38330 (getCurrentListMapNoExtraKeys!2804 _keys!868 lt!384909 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853854 () Bool)

(assert (=> b!853854 (= e!476124 (= call!38330 call!38331))))

(assert (= (and start!73234 res!579925) b!853851))

(assert (= (and b!853851 res!579923) b!853849))

(assert (= (and b!853849 res!579927) b!853845))

(assert (= (and b!853845 res!579924) b!853852))

(assert (= (and b!853852 res!579922) b!853842))

(assert (= (and b!853842 res!579919) b!853847))

(assert (= (and b!853847 res!579921) b!853853))

(assert (= (and b!853853 res!579920) b!853848))

(assert (= (and b!853848 res!579918) b!853844))

(assert (= (and b!853844 c!91856) b!853846))

(assert (= (and b!853844 (not c!91856)) b!853854))

(assert (= (or b!853846 b!853854) bm!38328))

(assert (= (or b!853846 b!853854) bm!38327))

(assert (= (and b!853844 (not res!579926)) b!853843))

(assert (= (and b!853850 condMapEmpty!26054) mapIsEmpty!26054))

(assert (= (and b!853850 (not condMapEmpty!26054)) mapNonEmpty!26054))

(get-info :version)

(assert (= (and mapNonEmpty!26054 ((_ is ValueCellFull!7712) mapValue!26054)) b!853840))

(assert (= (and b!853850 ((_ is ValueCellFull!7712) mapDefault!26054)) b!853841))

(assert (= start!73234 b!853850))

(declare-fun b_lambda!11681 () Bool)

(assert (=> (not b_lambda!11681) (not b!853843)))

(declare-fun t!23225 () Bool)

(declare-fun tb!4461 () Bool)

(assert (=> (and start!73234 (= defaultEntry!696 defaultEntry!696) t!23225) tb!4461))

(declare-fun result!8541 () Bool)

(assert (=> tb!4461 (= result!8541 tp_is_empty!16303)))

(assert (=> b!853843 t!23225))

(declare-fun b_and!23469 () Bool)

(assert (= b_and!23467 (and (=> t!23225 result!8541) b_and!23469)))

(declare-fun m!794631 () Bool)

(assert (=> b!853852 m!794631))

(declare-fun m!794633 () Bool)

(assert (=> b!853845 m!794633))

(declare-fun m!794635 () Bool)

(assert (=> b!853846 m!794635))

(declare-fun m!794637 () Bool)

(assert (=> bm!38328 m!794637))

(declare-fun m!794639 () Bool)

(assert (=> b!853844 m!794639))

(assert (=> b!853844 m!794639))

(declare-fun m!794641 () Bool)

(assert (=> b!853844 m!794641))

(declare-fun m!794643 () Bool)

(assert (=> b!853844 m!794643))

(declare-fun m!794645 () Bool)

(assert (=> b!853843 m!794645))

(declare-fun m!794647 () Bool)

(assert (=> b!853843 m!794647))

(declare-fun m!794649 () Bool)

(assert (=> b!853843 m!794649))

(declare-fun m!794651 () Bool)

(assert (=> b!853843 m!794651))

(declare-fun m!794653 () Bool)

(assert (=> b!853843 m!794653))

(declare-fun m!794655 () Bool)

(assert (=> b!853843 m!794655))

(assert (=> b!853843 m!794645))

(declare-fun m!794657 () Bool)

(assert (=> b!853843 m!794657))

(assert (=> b!853843 m!794637))

(declare-fun m!794659 () Bool)

(assert (=> b!853843 m!794659))

(assert (=> b!853843 m!794649))

(declare-fun m!794661 () Bool)

(assert (=> b!853843 m!794661))

(assert (=> b!853843 m!794655))

(declare-fun m!794663 () Bool)

(assert (=> b!853843 m!794663))

(assert (=> b!853843 m!794639))

(declare-fun m!794665 () Bool)

(assert (=> b!853843 m!794665))

(declare-fun m!794667 () Bool)

(assert (=> b!853851 m!794667))

(declare-fun m!794669 () Bool)

(assert (=> b!853853 m!794669))

(declare-fun m!794671 () Bool)

(assert (=> b!853848 m!794671))

(assert (=> b!853848 m!794661))

(declare-fun m!794673 () Bool)

(assert (=> b!853848 m!794673))

(declare-fun m!794675 () Bool)

(assert (=> mapNonEmpty!26054 m!794675))

(declare-fun m!794677 () Bool)

(assert (=> bm!38327 m!794677))

(declare-fun m!794679 () Bool)

(assert (=> start!73234 m!794679))

(declare-fun m!794681 () Bool)

(assert (=> start!73234 m!794681))

(declare-fun m!794683 () Bool)

(assert (=> b!853847 m!794683))

(check-sat (not b_next!14167) (not b!853846) b_and!23469 (not mapNonEmpty!26054) (not bm!38327) (not b!853845) (not b_lambda!11681) (not b!853848) (not b!853852) (not bm!38328) (not b!853847) tp_is_empty!16303 (not start!73234) (not b!853844) (not b!853851) (not b!853843))
(check-sat b_and!23469 (not b_next!14167))
