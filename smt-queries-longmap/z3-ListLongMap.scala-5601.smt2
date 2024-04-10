; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73392 () Bool)

(assert start!73392)

(declare-fun b_free!14307 () Bool)

(declare-fun b_next!14307 () Bool)

(assert (=> start!73392 (= b_free!14307 (not b_next!14307))))

(declare-fun tp!50425 () Bool)

(declare-fun b_and!23663 () Bool)

(assert (=> start!73392 (= tp!50425 b_and!23663)))

(declare-fun mapNonEmpty!26264 () Bool)

(declare-fun mapRes!26264 () Bool)

(declare-fun tp!50424 () Bool)

(declare-fun e!477506 () Bool)

(assert (=> mapNonEmpty!26264 (= mapRes!26264 (and tp!50424 e!477506))))

(declare-datatypes ((V!26971 0))(
  ( (V!26972 (val!8269 Int)) )
))
(declare-datatypes ((ValueCell!7782 0))(
  ( (ValueCellFull!7782 (v!10694 V!26971)) (EmptyCell!7782) )
))
(declare-fun mapRest!26264 () (Array (_ BitVec 32) ValueCell!7782))

(declare-datatypes ((array!49078 0))(
  ( (array!49079 (arr!23570 (Array (_ BitVec 32) ValueCell!7782)) (size!24010 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49078)

(declare-fun mapKey!26264 () (_ BitVec 32))

(declare-fun mapValue!26264 () ValueCell!7782)

(assert (=> mapNonEmpty!26264 (= (arr!23570 _values!688) (store mapRest!26264 mapKey!26264 mapValue!26264))))

(declare-fun b!856650 () Bool)

(declare-fun e!477508 () Bool)

(declare-fun tp_is_empty!16443 () Bool)

(assert (=> b!856650 (= e!477508 tp_is_empty!16443)))

(declare-fun b!856651 () Bool)

(declare-fun res!581860 () Bool)

(declare-fun e!477507 () Bool)

(assert (=> b!856651 (=> (not res!581860) (not e!477507))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856651 (= res!581860 (validMask!0 mask!1196))))

(declare-fun b!856652 () Bool)

(assert (=> b!856652 (= e!477506 tp_is_empty!16443)))

(declare-fun res!581854 () Bool)

(assert (=> start!73392 (=> (not res!581854) (not e!477507))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49080 0))(
  ( (array!49081 (arr!23571 (Array (_ BitVec 32) (_ BitVec 64))) (size!24011 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49080)

(assert (=> start!73392 (= res!581854 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24011 _keys!868))))))

(assert (=> start!73392 e!477507))

(assert (=> start!73392 tp_is_empty!16443))

(assert (=> start!73392 true))

(assert (=> start!73392 tp!50425))

(declare-fun array_inv!18668 (array!49080) Bool)

(assert (=> start!73392 (array_inv!18668 _keys!868)))

(declare-fun e!477505 () Bool)

(declare-fun array_inv!18669 (array!49078) Bool)

(assert (=> start!73392 (and (array_inv!18669 _values!688) e!477505)))

(declare-fun b!856653 () Bool)

(declare-fun res!581857 () Bool)

(assert (=> b!856653 (=> (not res!581857) (not e!477507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49080 (_ BitVec 32)) Bool)

(assert (=> b!856653 (= res!581857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856654 () Bool)

(declare-fun res!581853 () Bool)

(assert (=> b!856654 (=> (not res!581853) (not e!477507))))

(declare-datatypes ((List!16715 0))(
  ( (Nil!16712) (Cons!16711 (h!17842 (_ BitVec 64)) (t!23356 List!16715)) )
))
(declare-fun arrayNoDuplicates!0 (array!49080 (_ BitVec 32) List!16715) Bool)

(assert (=> b!856654 (= res!581853 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16712))))

(declare-fun b!856655 () Bool)

(declare-fun e!477504 () Bool)

(assert (=> b!856655 (= e!477507 e!477504)))

(declare-fun res!581856 () Bool)

(assert (=> b!856655 (=> (not res!581856) (not e!477504))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!856655 (= res!581856 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!386028 () array!49078)

(declare-fun minValue!654 () V!26971)

(declare-fun zeroValue!654 () V!26971)

(declare-datatypes ((tuple2!10906 0))(
  ( (tuple2!10907 (_1!5464 (_ BitVec 64)) (_2!5464 V!26971)) )
))
(declare-datatypes ((List!16716 0))(
  ( (Nil!16713) (Cons!16712 (h!17843 tuple2!10906) (t!23357 List!16716)) )
))
(declare-datatypes ((ListLongMap!9675 0))(
  ( (ListLongMap!9676 (toList!4853 List!16716)) )
))
(declare-fun lt!386026 () ListLongMap!9675)

(declare-fun getCurrentListMapNoExtraKeys!2834 (array!49080 array!49078 (_ BitVec 32) (_ BitVec 32) V!26971 V!26971 (_ BitVec 32) Int) ListLongMap!9675)

(assert (=> b!856655 (= lt!386026 (getCurrentListMapNoExtraKeys!2834 _keys!868 lt!386028 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26971)

(assert (=> b!856655 (= lt!386028 (array!49079 (store (arr!23570 _values!688) i!612 (ValueCellFull!7782 v!557)) (size!24010 _values!688)))))

(declare-fun lt!386027 () ListLongMap!9675)

(assert (=> b!856655 (= lt!386027 (getCurrentListMapNoExtraKeys!2834 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856656 () Bool)

(declare-fun res!581859 () Bool)

(assert (=> b!856656 (=> (not res!581859) (not e!477507))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!856656 (= res!581859 (and (= (select (arr!23571 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26264 () Bool)

(assert (=> mapIsEmpty!26264 mapRes!26264))

(declare-fun b!856657 () Bool)

(assert (=> b!856657 (= e!477504 (not true))))

(declare-fun +!2209 (ListLongMap!9675 tuple2!10906) ListLongMap!9675)

(assert (=> b!856657 (= (getCurrentListMapNoExtraKeys!2834 _keys!868 lt!386028 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2209 (getCurrentListMapNoExtraKeys!2834 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10907 k0!854 v!557)))))

(declare-datatypes ((Unit!29205 0))(
  ( (Unit!29206) )
))
(declare-fun lt!386029 () Unit!29205)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!430 (array!49080 array!49078 (_ BitVec 32) (_ BitVec 32) V!26971 V!26971 (_ BitVec 32) (_ BitVec 64) V!26971 (_ BitVec 32) Int) Unit!29205)

(assert (=> b!856657 (= lt!386029 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!430 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!856658 () Bool)

(declare-fun res!581861 () Bool)

(assert (=> b!856658 (=> (not res!581861) (not e!477507))))

(assert (=> b!856658 (= res!581861 (and (= (size!24010 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24011 _keys!868) (size!24010 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856659 () Bool)

(assert (=> b!856659 (= e!477505 (and e!477508 mapRes!26264))))

(declare-fun condMapEmpty!26264 () Bool)

(declare-fun mapDefault!26264 () ValueCell!7782)

(assert (=> b!856659 (= condMapEmpty!26264 (= (arr!23570 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7782)) mapDefault!26264)))))

(declare-fun b!856660 () Bool)

(declare-fun res!581855 () Bool)

(assert (=> b!856660 (=> (not res!581855) (not e!477507))))

(assert (=> b!856660 (= res!581855 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24011 _keys!868))))))

(declare-fun b!856661 () Bool)

(declare-fun res!581858 () Bool)

(assert (=> b!856661 (=> (not res!581858) (not e!477507))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856661 (= res!581858 (validKeyInArray!0 k0!854))))

(assert (= (and start!73392 res!581854) b!856651))

(assert (= (and b!856651 res!581860) b!856658))

(assert (= (and b!856658 res!581861) b!856653))

(assert (= (and b!856653 res!581857) b!856654))

(assert (= (and b!856654 res!581853) b!856660))

(assert (= (and b!856660 res!581855) b!856661))

(assert (= (and b!856661 res!581858) b!856656))

(assert (= (and b!856656 res!581859) b!856655))

(assert (= (and b!856655 res!581856) b!856657))

(assert (= (and b!856659 condMapEmpty!26264) mapIsEmpty!26264))

(assert (= (and b!856659 (not condMapEmpty!26264)) mapNonEmpty!26264))

(get-info :version)

(assert (= (and mapNonEmpty!26264 ((_ is ValueCellFull!7782) mapValue!26264)) b!856652))

(assert (= (and b!856659 ((_ is ValueCellFull!7782) mapDefault!26264)) b!856650))

(assert (= start!73392 b!856659))

(declare-fun m!797561 () Bool)

(assert (=> b!856653 m!797561))

(declare-fun m!797563 () Bool)

(assert (=> b!856661 m!797563))

(declare-fun m!797565 () Bool)

(assert (=> b!856651 m!797565))

(declare-fun m!797567 () Bool)

(assert (=> b!856655 m!797567))

(declare-fun m!797569 () Bool)

(assert (=> b!856655 m!797569))

(declare-fun m!797571 () Bool)

(assert (=> b!856655 m!797571))

(declare-fun m!797573 () Bool)

(assert (=> b!856656 m!797573))

(declare-fun m!797575 () Bool)

(assert (=> start!73392 m!797575))

(declare-fun m!797577 () Bool)

(assert (=> start!73392 m!797577))

(declare-fun m!797579 () Bool)

(assert (=> b!856657 m!797579))

(declare-fun m!797581 () Bool)

(assert (=> b!856657 m!797581))

(assert (=> b!856657 m!797581))

(declare-fun m!797583 () Bool)

(assert (=> b!856657 m!797583))

(declare-fun m!797585 () Bool)

(assert (=> b!856657 m!797585))

(declare-fun m!797587 () Bool)

(assert (=> b!856654 m!797587))

(declare-fun m!797589 () Bool)

(assert (=> mapNonEmpty!26264 m!797589))

(check-sat (not b!856654) (not b!856657) tp_is_empty!16443 (not b!856661) (not b!856651) (not b_next!14307) b_and!23663 (not b!856655) (not start!73392) (not b!856653) (not mapNonEmpty!26264))
(check-sat b_and!23663 (not b_next!14307))
