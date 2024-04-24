; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73780 () Bool)

(assert start!73780)

(declare-fun b_free!14527 () Bool)

(declare-fun b_next!14527 () Bool)

(assert (=> start!73780 (= b_free!14527 (not b_next!14527))))

(declare-fun tp!51086 () Bool)

(declare-fun b_and!24043 () Bool)

(assert (=> start!73780 (= tp!51086 b_and!24043)))

(declare-fun b!862371 () Bool)

(declare-fun res!585787 () Bool)

(declare-fun e!480565 () Bool)

(assert (=> b!862371 (=> (not res!585787) (not e!480565))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862371 (= res!585787 (validMask!0 mask!1196))))

(declare-fun b!862372 () Bool)

(declare-fun e!480567 () Bool)

(declare-fun tp_is_empty!16663 () Bool)

(assert (=> b!862372 (= e!480567 tp_is_empty!16663)))

(declare-fun b!862373 () Bool)

(declare-fun res!585782 () Bool)

(assert (=> b!862373 (=> (not res!585782) (not e!480565))))

(declare-datatypes ((array!49549 0))(
  ( (array!49550 (arr!23801 (Array (_ BitVec 32) (_ BitVec 64))) (size!24242 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49549)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49549 (_ BitVec 32)) Bool)

(assert (=> b!862373 (= res!585782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!862374 () Bool)

(declare-fun e!480570 () Bool)

(assert (=> b!862374 (= e!480570 true)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!862374 (not (= (select (arr!23801 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29388 0))(
  ( (Unit!29389) )
))
(declare-fun lt!388881 () Unit!29388)

(declare-fun e!480564 () Unit!29388)

(assert (=> b!862374 (= lt!388881 e!480564)))

(declare-fun c!92293 () Bool)

(assert (=> b!862374 (= c!92293 (= (select (arr!23801 _keys!868) from!1053) k0!854))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27265 0))(
  ( (V!27266 (val!8379 Int)) )
))
(declare-datatypes ((tuple2!11004 0))(
  ( (tuple2!11005 (_1!5513 (_ BitVec 64)) (_2!5513 V!27265)) )
))
(declare-datatypes ((List!16842 0))(
  ( (Nil!16839) (Cons!16838 (h!17975 tuple2!11004) (t!23627 List!16842)) )
))
(declare-datatypes ((ListLongMap!9775 0))(
  ( (ListLongMap!9776 (toList!4903 List!16842)) )
))
(declare-fun lt!388883 () ListLongMap!9775)

(declare-fun lt!388873 () ListLongMap!9775)

(declare-datatypes ((ValueCell!7892 0))(
  ( (ValueCellFull!7892 (v!10804 V!27265)) (EmptyCell!7892) )
))
(declare-datatypes ((array!49551 0))(
  ( (array!49552 (arr!23802 (Array (_ BitVec 32) ValueCell!7892)) (size!24243 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49551)

(declare-fun +!2307 (ListLongMap!9775 tuple2!11004) ListLongMap!9775)

(declare-fun get!12561 (ValueCell!7892 V!27265) V!27265)

(declare-fun dynLambda!1135 (Int (_ BitVec 64)) V!27265)

(assert (=> b!862374 (= lt!388883 (+!2307 lt!388873 (tuple2!11005 (select (arr!23801 _keys!868) from!1053) (get!12561 (select (arr!23802 _values!688) from!1053) (dynLambda!1135 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!862375 () Bool)

(declare-fun e!480571 () Bool)

(assert (=> b!862375 (= e!480571 tp_is_empty!16663)))

(declare-fun b!862376 () Bool)

(declare-fun res!585781 () Bool)

(assert (=> b!862376 (=> (not res!585781) (not e!480565))))

(declare-datatypes ((List!16843 0))(
  ( (Nil!16840) (Cons!16839 (h!17976 (_ BitVec 64)) (t!23628 List!16843)) )
))
(declare-fun arrayNoDuplicates!0 (array!49549 (_ BitVec 32) List!16843) Bool)

(assert (=> b!862376 (= res!585781 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16840))))

(declare-fun b!862377 () Bool)

(declare-fun Unit!29390 () Unit!29388)

(assert (=> b!862377 (= e!480564 Unit!29390)))

(declare-fun lt!388880 () Unit!29388)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49549 (_ BitVec 32) (_ BitVec 32)) Unit!29388)

(assert (=> b!862377 (= lt!388880 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!862377 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16840)))

(declare-fun lt!388875 () Unit!29388)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49549 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29388)

(assert (=> b!862377 (= lt!388875 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862377 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388878 () Unit!29388)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49549 (_ BitVec 64) (_ BitVec 32) List!16843) Unit!29388)

(assert (=> b!862377 (= lt!388878 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16840))))

(assert (=> b!862377 false))

(declare-fun b!862378 () Bool)

(declare-fun res!585789 () Bool)

(assert (=> b!862378 (=> (not res!585789) (not e!480565))))

(assert (=> b!862378 (= res!585789 (and (= (select (arr!23801 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!862379 () Bool)

(declare-fun e!480566 () Bool)

(assert (=> b!862379 (= e!480566 (not e!480570))))

(declare-fun res!585786 () Bool)

(assert (=> b!862379 (=> res!585786 e!480570)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862379 (= res!585786 (not (validKeyInArray!0 (select (arr!23801 _keys!868) from!1053))))))

(declare-fun lt!388882 () ListLongMap!9775)

(assert (=> b!862379 (= lt!388882 lt!388873)))

(declare-fun v!557 () V!27265)

(declare-fun lt!388877 () ListLongMap!9775)

(assert (=> b!862379 (= lt!388873 (+!2307 lt!388877 (tuple2!11005 k0!854 v!557)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!388879 () array!49551)

(declare-fun minValue!654 () V!27265)

(declare-fun zeroValue!654 () V!27265)

(declare-fun getCurrentListMapNoExtraKeys!2955 (array!49549 array!49551 (_ BitVec 32) (_ BitVec 32) V!27265 V!27265 (_ BitVec 32) Int) ListLongMap!9775)

(assert (=> b!862379 (= lt!388882 (getCurrentListMapNoExtraKeys!2955 _keys!868 lt!388879 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!862379 (= lt!388877 (getCurrentListMapNoExtraKeys!2955 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388874 () Unit!29388)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!496 (array!49549 array!49551 (_ BitVec 32) (_ BitVec 32) V!27265 V!27265 (_ BitVec 32) (_ BitVec 64) V!27265 (_ BitVec 32) Int) Unit!29388)

(assert (=> b!862379 (= lt!388874 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!496 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!26594 () Bool)

(declare-fun mapRes!26594 () Bool)

(declare-fun tp!51085 () Bool)

(assert (=> mapNonEmpty!26594 (= mapRes!26594 (and tp!51085 e!480567))))

(declare-fun mapValue!26594 () ValueCell!7892)

(declare-fun mapKey!26594 () (_ BitVec 32))

(declare-fun mapRest!26594 () (Array (_ BitVec 32) ValueCell!7892))

(assert (=> mapNonEmpty!26594 (= (arr!23802 _values!688) (store mapRest!26594 mapKey!26594 mapValue!26594))))

(declare-fun mapIsEmpty!26594 () Bool)

(assert (=> mapIsEmpty!26594 mapRes!26594))

(declare-fun b!862381 () Bool)

(declare-fun res!585785 () Bool)

(assert (=> b!862381 (=> (not res!585785) (not e!480565))))

(assert (=> b!862381 (= res!585785 (validKeyInArray!0 k0!854))))

(declare-fun b!862382 () Bool)

(declare-fun res!585790 () Bool)

(assert (=> b!862382 (=> (not res!585790) (not e!480565))))

(assert (=> b!862382 (= res!585790 (and (= (size!24243 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24242 _keys!868) (size!24243 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!862383 () Bool)

(assert (=> b!862383 (= e!480565 e!480566)))

(declare-fun res!585788 () Bool)

(assert (=> b!862383 (=> (not res!585788) (not e!480566))))

(assert (=> b!862383 (= res!585788 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!862383 (= lt!388883 (getCurrentListMapNoExtraKeys!2955 _keys!868 lt!388879 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!862383 (= lt!388879 (array!49552 (store (arr!23802 _values!688) i!612 (ValueCellFull!7892 v!557)) (size!24243 _values!688)))))

(declare-fun lt!388876 () ListLongMap!9775)

(assert (=> b!862383 (= lt!388876 (getCurrentListMapNoExtraKeys!2955 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862384 () Bool)

(declare-fun Unit!29391 () Unit!29388)

(assert (=> b!862384 (= e!480564 Unit!29391)))

(declare-fun b!862385 () Bool)

(declare-fun e!480569 () Bool)

(assert (=> b!862385 (= e!480569 (and e!480571 mapRes!26594))))

(declare-fun condMapEmpty!26594 () Bool)

(declare-fun mapDefault!26594 () ValueCell!7892)

(assert (=> b!862385 (= condMapEmpty!26594 (= (arr!23802 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7892)) mapDefault!26594)))))

(declare-fun b!862380 () Bool)

(declare-fun res!585784 () Bool)

(assert (=> b!862380 (=> (not res!585784) (not e!480565))))

(assert (=> b!862380 (= res!585784 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24242 _keys!868))))))

(declare-fun res!585783 () Bool)

(assert (=> start!73780 (=> (not res!585783) (not e!480565))))

(assert (=> start!73780 (= res!585783 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24242 _keys!868))))))

(assert (=> start!73780 e!480565))

(assert (=> start!73780 tp_is_empty!16663))

(assert (=> start!73780 true))

(assert (=> start!73780 tp!51086))

(declare-fun array_inv!18882 (array!49549) Bool)

(assert (=> start!73780 (array_inv!18882 _keys!868)))

(declare-fun array_inv!18883 (array!49551) Bool)

(assert (=> start!73780 (and (array_inv!18883 _values!688) e!480569)))

(assert (= (and start!73780 res!585783) b!862371))

(assert (= (and b!862371 res!585787) b!862382))

(assert (= (and b!862382 res!585790) b!862373))

(assert (= (and b!862373 res!585782) b!862376))

(assert (= (and b!862376 res!585781) b!862380))

(assert (= (and b!862380 res!585784) b!862381))

(assert (= (and b!862381 res!585785) b!862378))

(assert (= (and b!862378 res!585789) b!862383))

(assert (= (and b!862383 res!585788) b!862379))

(assert (= (and b!862379 (not res!585786)) b!862374))

(assert (= (and b!862374 c!92293) b!862377))

(assert (= (and b!862374 (not c!92293)) b!862384))

(assert (= (and b!862385 condMapEmpty!26594) mapIsEmpty!26594))

(assert (= (and b!862385 (not condMapEmpty!26594)) mapNonEmpty!26594))

(get-info :version)

(assert (= (and mapNonEmpty!26594 ((_ is ValueCellFull!7892) mapValue!26594)) b!862372))

(assert (= (and b!862385 ((_ is ValueCellFull!7892) mapDefault!26594)) b!862375))

(assert (= start!73780 b!862385))

(declare-fun b_lambda!11893 () Bool)

(assert (=> (not b_lambda!11893) (not b!862374)))

(declare-fun t!23626 () Bool)

(declare-fun tb!4641 () Bool)

(assert (=> (and start!73780 (= defaultEntry!696 defaultEntry!696) t!23626) tb!4641))

(declare-fun result!8901 () Bool)

(assert (=> tb!4641 (= result!8901 tp_is_empty!16663)))

(assert (=> b!862374 t!23626))

(declare-fun b_and!24045 () Bool)

(assert (= b_and!24043 (and (=> t!23626 result!8901) b_and!24045)))

(declare-fun m!803663 () Bool)

(assert (=> b!862376 m!803663))

(declare-fun m!803665 () Bool)

(assert (=> b!862383 m!803665))

(declare-fun m!803667 () Bool)

(assert (=> b!862383 m!803667))

(declare-fun m!803669 () Bool)

(assert (=> b!862383 m!803669))

(declare-fun m!803671 () Bool)

(assert (=> b!862377 m!803671))

(declare-fun m!803673 () Bool)

(assert (=> b!862377 m!803673))

(declare-fun m!803675 () Bool)

(assert (=> b!862377 m!803675))

(declare-fun m!803677 () Bool)

(assert (=> b!862377 m!803677))

(declare-fun m!803679 () Bool)

(assert (=> b!862377 m!803679))

(declare-fun m!803681 () Bool)

(assert (=> b!862374 m!803681))

(declare-fun m!803683 () Bool)

(assert (=> b!862374 m!803683))

(declare-fun m!803685 () Bool)

(assert (=> b!862374 m!803685))

(declare-fun m!803687 () Bool)

(assert (=> b!862374 m!803687))

(assert (=> b!862374 m!803683))

(declare-fun m!803689 () Bool)

(assert (=> b!862374 m!803689))

(assert (=> b!862374 m!803685))

(declare-fun m!803691 () Bool)

(assert (=> b!862371 m!803691))

(declare-fun m!803693 () Bool)

(assert (=> b!862381 m!803693))

(declare-fun m!803695 () Bool)

(assert (=> b!862378 m!803695))

(declare-fun m!803697 () Bool)

(assert (=> b!862373 m!803697))

(assert (=> b!862379 m!803689))

(declare-fun m!803699 () Bool)

(assert (=> b!862379 m!803699))

(assert (=> b!862379 m!803689))

(declare-fun m!803701 () Bool)

(assert (=> b!862379 m!803701))

(declare-fun m!803703 () Bool)

(assert (=> b!862379 m!803703))

(declare-fun m!803705 () Bool)

(assert (=> b!862379 m!803705))

(declare-fun m!803707 () Bool)

(assert (=> b!862379 m!803707))

(declare-fun m!803709 () Bool)

(assert (=> mapNonEmpty!26594 m!803709))

(declare-fun m!803711 () Bool)

(assert (=> start!73780 m!803711))

(declare-fun m!803713 () Bool)

(assert (=> start!73780 m!803713))

(check-sat (not b!862383) (not b!862371) tp_is_empty!16663 (not b!862381) (not mapNonEmpty!26594) b_and!24045 (not b_next!14527) (not b!862377) (not b!862373) (not b!862376) (not b!862379) (not start!73780) (not b!862374) (not b_lambda!11893))
(check-sat b_and!24045 (not b_next!14527))
