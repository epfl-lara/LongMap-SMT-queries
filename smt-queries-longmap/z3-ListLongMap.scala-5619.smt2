; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73480 () Bool)

(assert start!73480)

(declare-fun b_free!14413 () Bool)

(declare-fun b_next!14413 () Bool)

(assert (=> start!73480 (= b_free!14413 (not b_next!14413))))

(declare-fun tp!50743 () Bool)

(declare-fun b_and!23779 () Bool)

(assert (=> start!73480 (= tp!50743 b_and!23779)))

(declare-fun b!858431 () Bool)

(declare-fun res!583257 () Bool)

(declare-fun e!478389 () Bool)

(assert (=> b!858431 (=> (not res!583257) (not e!478389))))

(declare-datatypes ((array!49265 0))(
  ( (array!49266 (arr!23664 (Array (_ BitVec 32) (_ BitVec 64))) (size!24106 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49265)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49265 (_ BitVec 32)) Bool)

(assert (=> b!858431 (= res!583257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858432 () Bool)

(declare-fun res!583254 () Bool)

(assert (=> b!858432 (=> (not res!583254) (not e!478389))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858432 (= res!583254 (validKeyInArray!0 k0!854))))

(declare-fun b!858433 () Bool)

(declare-fun e!478391 () Bool)

(declare-fun tp_is_empty!16549 () Bool)

(assert (=> b!858433 (= e!478391 tp_is_empty!16549)))

(declare-fun b!858434 () Bool)

(declare-fun res!583258 () Bool)

(assert (=> b!858434 (=> (not res!583258) (not e!478389))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!858434 (= res!583258 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24106 _keys!868))))))

(declare-fun b!858435 () Bool)

(declare-fun e!478385 () Bool)

(declare-fun e!478390 () Bool)

(assert (=> b!858435 (= e!478385 (not e!478390))))

(declare-fun res!583259 () Bool)

(assert (=> b!858435 (=> res!583259 e!478390)))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!858435 (= res!583259 (not (validKeyInArray!0 (select (arr!23664 _keys!868) from!1053))))))

(declare-datatypes ((V!27113 0))(
  ( (V!27114 (val!8322 Int)) )
))
(declare-datatypes ((tuple2!10992 0))(
  ( (tuple2!10993 (_1!5507 (_ BitVec 64)) (_2!5507 V!27113)) )
))
(declare-datatypes ((List!16792 0))(
  ( (Nil!16789) (Cons!16788 (h!17919 tuple2!10992) (t!23462 List!16792)) )
))
(declare-datatypes ((ListLongMap!9751 0))(
  ( (ListLongMap!9752 (toList!4891 List!16792)) )
))
(declare-fun lt!386608 () ListLongMap!9751)

(declare-fun lt!386605 () ListLongMap!9751)

(assert (=> b!858435 (= lt!386608 lt!386605)))

(declare-fun v!557 () V!27113)

(declare-fun lt!386611 () ListLongMap!9751)

(declare-fun +!2265 (ListLongMap!9751 tuple2!10992) ListLongMap!9751)

(assert (=> b!858435 (= lt!386605 (+!2265 lt!386611 (tuple2!10993 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7835 0))(
  ( (ValueCellFull!7835 (v!10741 V!27113)) (EmptyCell!7835) )
))
(declare-datatypes ((array!49267 0))(
  ( (array!49268 (arr!23665 (Array (_ BitVec 32) ValueCell!7835)) (size!24107 (_ BitVec 32))) )
))
(declare-fun lt!386606 () array!49267)

(declare-fun minValue!654 () V!27113)

(declare-fun zeroValue!654 () V!27113)

(declare-fun getCurrentListMapNoExtraKeys!2897 (array!49265 array!49267 (_ BitVec 32) (_ BitVec 32) V!27113 V!27113 (_ BitVec 32) Int) ListLongMap!9751)

(assert (=> b!858435 (= lt!386608 (getCurrentListMapNoExtraKeys!2897 _keys!868 lt!386606 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!49267)

(assert (=> b!858435 (= lt!386611 (getCurrentListMapNoExtraKeys!2897 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29199 0))(
  ( (Unit!29200) )
))
(declare-fun lt!386609 () Unit!29199)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!461 (array!49265 array!49267 (_ BitVec 32) (_ BitVec 32) V!27113 V!27113 (_ BitVec 32) (_ BitVec 64) V!27113 (_ BitVec 32) Int) Unit!29199)

(assert (=> b!858435 (= lt!386609 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!461 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!858436 () Bool)

(declare-fun e!478392 () Bool)

(assert (=> b!858436 (= e!478392 true)))

(declare-datatypes ((List!16793 0))(
  ( (Nil!16790) (Cons!16789 (h!17920 (_ BitVec 64)) (t!23463 List!16793)) )
))
(declare-fun arrayNoDuplicates!0 (array!49265 (_ BitVec 32) List!16793) Bool)

(assert (=> b!858436 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16790)))

(declare-fun lt!386612 () Unit!29199)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49265 (_ BitVec 32) (_ BitVec 32)) Unit!29199)

(assert (=> b!858436 (= lt!386612 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun mapIsEmpty!26423 () Bool)

(declare-fun mapRes!26423 () Bool)

(assert (=> mapIsEmpty!26423 mapRes!26423))

(declare-fun b!858437 () Bool)

(assert (=> b!858437 (= e!478390 e!478392)))

(declare-fun res!583253 () Bool)

(assert (=> b!858437 (=> res!583253 e!478392)))

(assert (=> b!858437 (= res!583253 (not (= (select (arr!23664 _keys!868) from!1053) k0!854)))))

(declare-fun lt!386607 () ListLongMap!9751)

(declare-fun get!12468 (ValueCell!7835 V!27113) V!27113)

(declare-fun dynLambda!1083 (Int (_ BitVec 64)) V!27113)

(assert (=> b!858437 (= lt!386607 (+!2265 lt!386605 (tuple2!10993 (select (arr!23664 _keys!868) from!1053) (get!12468 (select (arr!23665 _values!688) from!1053) (dynLambda!1083 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!858438 () Bool)

(declare-fun e!478386 () Bool)

(assert (=> b!858438 (= e!478386 tp_is_empty!16549)))

(declare-fun b!858439 () Bool)

(assert (=> b!858439 (= e!478389 e!478385)))

(declare-fun res!583260 () Bool)

(assert (=> b!858439 (=> (not res!583260) (not e!478385))))

(assert (=> b!858439 (= res!583260 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!858439 (= lt!386607 (getCurrentListMapNoExtraKeys!2897 _keys!868 lt!386606 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!858439 (= lt!386606 (array!49268 (store (arr!23665 _values!688) i!612 (ValueCellFull!7835 v!557)) (size!24107 _values!688)))))

(declare-fun lt!386610 () ListLongMap!9751)

(assert (=> b!858439 (= lt!386610 (getCurrentListMapNoExtraKeys!2897 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!858441 () Bool)

(declare-fun res!583250 () Bool)

(assert (=> b!858441 (=> (not res!583250) (not e!478389))))

(assert (=> b!858441 (= res!583250 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16790))))

(declare-fun b!858442 () Bool)

(declare-fun res!583251 () Bool)

(assert (=> b!858442 (=> (not res!583251) (not e!478389))))

(assert (=> b!858442 (= res!583251 (and (= (select (arr!23664 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!26423 () Bool)

(declare-fun tp!50744 () Bool)

(assert (=> mapNonEmpty!26423 (= mapRes!26423 (and tp!50744 e!478386))))

(declare-fun mapKey!26423 () (_ BitVec 32))

(declare-fun mapValue!26423 () ValueCell!7835)

(declare-fun mapRest!26423 () (Array (_ BitVec 32) ValueCell!7835))

(assert (=> mapNonEmpty!26423 (= (arr!23665 _values!688) (store mapRest!26423 mapKey!26423 mapValue!26423))))

(declare-fun b!858443 () Bool)

(declare-fun res!583255 () Bool)

(assert (=> b!858443 (=> (not res!583255) (not e!478389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858443 (= res!583255 (validMask!0 mask!1196))))

(declare-fun b!858444 () Bool)

(declare-fun e!478388 () Bool)

(assert (=> b!858444 (= e!478388 (and e!478391 mapRes!26423))))

(declare-fun condMapEmpty!26423 () Bool)

(declare-fun mapDefault!26423 () ValueCell!7835)

(assert (=> b!858444 (= condMapEmpty!26423 (= (arr!23665 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7835)) mapDefault!26423)))))

(declare-fun res!583256 () Bool)

(assert (=> start!73480 (=> (not res!583256) (not e!478389))))

(assert (=> start!73480 (= res!583256 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24106 _keys!868))))))

(assert (=> start!73480 e!478389))

(assert (=> start!73480 tp_is_empty!16549))

(assert (=> start!73480 true))

(assert (=> start!73480 tp!50743))

(declare-fun array_inv!18798 (array!49265) Bool)

(assert (=> start!73480 (array_inv!18798 _keys!868)))

(declare-fun array_inv!18799 (array!49267) Bool)

(assert (=> start!73480 (and (array_inv!18799 _values!688) e!478388)))

(declare-fun b!858440 () Bool)

(declare-fun res!583252 () Bool)

(assert (=> b!858440 (=> (not res!583252) (not e!478389))))

(assert (=> b!858440 (= res!583252 (and (= (size!24107 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24106 _keys!868) (size!24107 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73480 res!583256) b!858443))

(assert (= (and b!858443 res!583255) b!858440))

(assert (= (and b!858440 res!583252) b!858431))

(assert (= (and b!858431 res!583257) b!858441))

(assert (= (and b!858441 res!583250) b!858434))

(assert (= (and b!858434 res!583258) b!858432))

(assert (= (and b!858432 res!583254) b!858442))

(assert (= (and b!858442 res!583251) b!858439))

(assert (= (and b!858439 res!583260) b!858435))

(assert (= (and b!858435 (not res!583259)) b!858437))

(assert (= (and b!858437 (not res!583253)) b!858436))

(assert (= (and b!858444 condMapEmpty!26423) mapIsEmpty!26423))

(assert (= (and b!858444 (not condMapEmpty!26423)) mapNonEmpty!26423))

(get-info :version)

(assert (= (and mapNonEmpty!26423 ((_ is ValueCellFull!7835) mapValue!26423)) b!858438))

(assert (= (and b!858444 ((_ is ValueCellFull!7835) mapDefault!26423)) b!858433))

(assert (= start!73480 b!858444))

(declare-fun b_lambda!11747 () Bool)

(assert (=> (not b_lambda!11747) (not b!858437)))

(declare-fun t!23461 () Bool)

(declare-fun tb!4527 () Bool)

(assert (=> (and start!73480 (= defaultEntry!696 defaultEntry!696) t!23461) tb!4527))

(declare-fun result!8673 () Bool)

(assert (=> tb!4527 (= result!8673 tp_is_empty!16549)))

(assert (=> b!858437 t!23461))

(declare-fun b_and!23781 () Bool)

(assert (= b_and!23779 (and (=> t!23461 result!8673) b_and!23781)))

(declare-fun m!798633 () Bool)

(assert (=> b!858432 m!798633))

(declare-fun m!798635 () Bool)

(assert (=> b!858436 m!798635))

(declare-fun m!798637 () Bool)

(assert (=> b!858436 m!798637))

(declare-fun m!798639 () Bool)

(assert (=> b!858442 m!798639))

(declare-fun m!798641 () Bool)

(assert (=> b!858435 m!798641))

(declare-fun m!798643 () Bool)

(assert (=> b!858435 m!798643))

(declare-fun m!798645 () Bool)

(assert (=> b!858435 m!798645))

(declare-fun m!798647 () Bool)

(assert (=> b!858435 m!798647))

(declare-fun m!798649 () Bool)

(assert (=> b!858435 m!798649))

(assert (=> b!858435 m!798647))

(declare-fun m!798651 () Bool)

(assert (=> b!858435 m!798651))

(declare-fun m!798653 () Bool)

(assert (=> b!858443 m!798653))

(declare-fun m!798655 () Bool)

(assert (=> b!858431 m!798655))

(declare-fun m!798657 () Bool)

(assert (=> b!858437 m!798657))

(declare-fun m!798659 () Bool)

(assert (=> b!858437 m!798659))

(declare-fun m!798661 () Bool)

(assert (=> b!858437 m!798661))

(declare-fun m!798663 () Bool)

(assert (=> b!858437 m!798663))

(assert (=> b!858437 m!798659))

(assert (=> b!858437 m!798647))

(assert (=> b!858437 m!798661))

(declare-fun m!798665 () Bool)

(assert (=> start!73480 m!798665))

(declare-fun m!798667 () Bool)

(assert (=> start!73480 m!798667))

(declare-fun m!798669 () Bool)

(assert (=> b!858441 m!798669))

(declare-fun m!798671 () Bool)

(assert (=> b!858439 m!798671))

(declare-fun m!798673 () Bool)

(assert (=> b!858439 m!798673))

(declare-fun m!798675 () Bool)

(assert (=> b!858439 m!798675))

(declare-fun m!798677 () Bool)

(assert (=> mapNonEmpty!26423 m!798677))

(check-sat (not b!858435) (not b!858436) (not b!858443) (not b_next!14413) (not b!858431) (not mapNonEmpty!26423) (not b_lambda!11747) tp_is_empty!16549 (not b!858441) (not b!858439) (not start!73480) (not b!858432) (not b!858437) b_and!23781)
(check-sat b_and!23781 (not b_next!14413))
