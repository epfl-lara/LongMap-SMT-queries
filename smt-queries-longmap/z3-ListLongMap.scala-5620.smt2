; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73486 () Bool)

(assert start!73486)

(declare-fun b_free!14419 () Bool)

(declare-fun b_next!14419 () Bool)

(assert (=> start!73486 (= b_free!14419 (not b_next!14419))))

(declare-fun tp!50762 () Bool)

(declare-fun b_and!23791 () Bool)

(assert (=> start!73486 (= tp!50762 b_and!23791)))

(declare-fun res!583352 () Bool)

(declare-fun e!478460 () Bool)

(assert (=> start!73486 (=> (not res!583352) (not e!478460))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49277 0))(
  ( (array!49278 (arr!23670 (Array (_ BitVec 32) (_ BitVec 64))) (size!24112 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49277)

(assert (=> start!73486 (= res!583352 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24112 _keys!868))))))

(assert (=> start!73486 e!478460))

(declare-fun tp_is_empty!16555 () Bool)

(assert (=> start!73486 tp_is_empty!16555))

(assert (=> start!73486 true))

(assert (=> start!73486 tp!50762))

(declare-fun array_inv!18804 (array!49277) Bool)

(assert (=> start!73486 (array_inv!18804 _keys!868)))

(declare-datatypes ((V!27121 0))(
  ( (V!27122 (val!8325 Int)) )
))
(declare-datatypes ((ValueCell!7838 0))(
  ( (ValueCellFull!7838 (v!10744 V!27121)) (EmptyCell!7838) )
))
(declare-datatypes ((array!49279 0))(
  ( (array!49280 (arr!23671 (Array (_ BitVec 32) ValueCell!7838)) (size!24113 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49279)

(declare-fun e!478458 () Bool)

(declare-fun array_inv!18805 (array!49279) Bool)

(assert (=> start!73486 (and (array_inv!18805 _values!688) e!478458)))

(declare-fun b!858563 () Bool)

(declare-fun res!583358 () Bool)

(assert (=> b!858563 (=> (not res!583358) (not e!478460))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858563 (= res!583358 (validMask!0 mask!1196))))

(declare-fun b!858564 () Bool)

(declare-fun res!583357 () Bool)

(assert (=> b!858564 (=> (not res!583357) (not e!478460))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858564 (= res!583357 (validKeyInArray!0 k0!854))))

(declare-fun b!858565 () Bool)

(declare-fun res!583349 () Bool)

(assert (=> b!858565 (=> (not res!583349) (not e!478460))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!858565 (= res!583349 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24112 _keys!868))))))

(declare-fun b!858566 () Bool)

(declare-fun res!583350 () Bool)

(assert (=> b!858566 (=> (not res!583350) (not e!478460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49277 (_ BitVec 32)) Bool)

(assert (=> b!858566 (= res!583350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858567 () Bool)

(declare-fun e!478462 () Bool)

(declare-fun mapRes!26432 () Bool)

(assert (=> b!858567 (= e!478458 (and e!478462 mapRes!26432))))

(declare-fun condMapEmpty!26432 () Bool)

(declare-fun mapDefault!26432 () ValueCell!7838)

(assert (=> b!858567 (= condMapEmpty!26432 (= (arr!23671 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7838)) mapDefault!26432)))))

(declare-fun b!858568 () Bool)

(declare-fun e!478459 () Bool)

(assert (=> b!858568 (= e!478459 true)))

(declare-datatypes ((List!16797 0))(
  ( (Nil!16794) (Cons!16793 (h!17924 (_ BitVec 64)) (t!23473 List!16797)) )
))
(declare-fun arrayNoDuplicates!0 (array!49277 (_ BitVec 32) List!16797) Bool)

(assert (=> b!858568 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16794)))

(declare-datatypes ((Unit!29203 0))(
  ( (Unit!29204) )
))
(declare-fun lt!386678 () Unit!29203)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49277 (_ BitVec 32) (_ BitVec 32)) Unit!29203)

(assert (=> b!858568 (= lt!386678 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!858569 () Bool)

(assert (=> b!858569 (= e!478462 tp_is_empty!16555)))

(declare-fun mapIsEmpty!26432 () Bool)

(assert (=> mapIsEmpty!26432 mapRes!26432))

(declare-fun b!858570 () Bool)

(declare-fun e!478461 () Bool)

(assert (=> b!858570 (= e!478460 e!478461)))

(declare-fun res!583355 () Bool)

(assert (=> b!858570 (=> (not res!583355) (not e!478461))))

(assert (=> b!858570 (= res!583355 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10996 0))(
  ( (tuple2!10997 (_1!5509 (_ BitVec 64)) (_2!5509 V!27121)) )
))
(declare-datatypes ((List!16798 0))(
  ( (Nil!16795) (Cons!16794 (h!17925 tuple2!10996) (t!23474 List!16798)) )
))
(declare-datatypes ((ListLongMap!9755 0))(
  ( (ListLongMap!9756 (toList!4893 List!16798)) )
))
(declare-fun lt!386682 () ListLongMap!9755)

(declare-fun lt!386683 () array!49279)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27121)

(declare-fun zeroValue!654 () V!27121)

(declare-fun getCurrentListMapNoExtraKeys!2899 (array!49277 array!49279 (_ BitVec 32) (_ BitVec 32) V!27121 V!27121 (_ BitVec 32) Int) ListLongMap!9755)

(assert (=> b!858570 (= lt!386682 (getCurrentListMapNoExtraKeys!2899 _keys!868 lt!386683 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27121)

(assert (=> b!858570 (= lt!386683 (array!49280 (store (arr!23671 _values!688) i!612 (ValueCellFull!7838 v!557)) (size!24113 _values!688)))))

(declare-fun lt!386680 () ListLongMap!9755)

(assert (=> b!858570 (= lt!386680 (getCurrentListMapNoExtraKeys!2899 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!858571 () Bool)

(declare-fun res!583353 () Bool)

(assert (=> b!858571 (=> (not res!583353) (not e!478460))))

(assert (=> b!858571 (= res!583353 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16794))))

(declare-fun b!858572 () Bool)

(declare-fun res!583356 () Bool)

(assert (=> b!858572 (=> (not res!583356) (not e!478460))))

(assert (=> b!858572 (= res!583356 (and (= (size!24113 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24112 _keys!868) (size!24113 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858573 () Bool)

(declare-fun e!478464 () Bool)

(assert (=> b!858573 (= e!478461 (not e!478464))))

(declare-fun res!583354 () Bool)

(assert (=> b!858573 (=> res!583354 e!478464)))

(assert (=> b!858573 (= res!583354 (not (validKeyInArray!0 (select (arr!23670 _keys!868) from!1053))))))

(declare-fun lt!386677 () ListLongMap!9755)

(declare-fun lt!386681 () ListLongMap!9755)

(assert (=> b!858573 (= lt!386677 lt!386681)))

(declare-fun lt!386684 () ListLongMap!9755)

(declare-fun +!2267 (ListLongMap!9755 tuple2!10996) ListLongMap!9755)

(assert (=> b!858573 (= lt!386681 (+!2267 lt!386684 (tuple2!10997 k0!854 v!557)))))

(assert (=> b!858573 (= lt!386677 (getCurrentListMapNoExtraKeys!2899 _keys!868 lt!386683 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!858573 (= lt!386684 (getCurrentListMapNoExtraKeys!2899 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!386679 () Unit!29203)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!462 (array!49277 array!49279 (_ BitVec 32) (_ BitVec 32) V!27121 V!27121 (_ BitVec 32) (_ BitVec 64) V!27121 (_ BitVec 32) Int) Unit!29203)

(assert (=> b!858573 (= lt!386679 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!462 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!858574 () Bool)

(declare-fun res!583359 () Bool)

(assert (=> b!858574 (=> (not res!583359) (not e!478460))))

(assert (=> b!858574 (= res!583359 (and (= (select (arr!23670 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!26432 () Bool)

(declare-fun tp!50761 () Bool)

(declare-fun e!478463 () Bool)

(assert (=> mapNonEmpty!26432 (= mapRes!26432 (and tp!50761 e!478463))))

(declare-fun mapRest!26432 () (Array (_ BitVec 32) ValueCell!7838))

(declare-fun mapValue!26432 () ValueCell!7838)

(declare-fun mapKey!26432 () (_ BitVec 32))

(assert (=> mapNonEmpty!26432 (= (arr!23671 _values!688) (store mapRest!26432 mapKey!26432 mapValue!26432))))

(declare-fun b!858575 () Bool)

(assert (=> b!858575 (= e!478463 tp_is_empty!16555)))

(declare-fun b!858576 () Bool)

(assert (=> b!858576 (= e!478464 e!478459)))

(declare-fun res!583351 () Bool)

(assert (=> b!858576 (=> res!583351 e!478459)))

(assert (=> b!858576 (= res!583351 (not (= (select (arr!23670 _keys!868) from!1053) k0!854)))))

(declare-fun get!12472 (ValueCell!7838 V!27121) V!27121)

(declare-fun dynLambda!1085 (Int (_ BitVec 64)) V!27121)

(assert (=> b!858576 (= lt!386682 (+!2267 lt!386681 (tuple2!10997 (select (arr!23670 _keys!868) from!1053) (get!12472 (select (arr!23671 _values!688) from!1053) (dynLambda!1085 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!73486 res!583352) b!858563))

(assert (= (and b!858563 res!583358) b!858572))

(assert (= (and b!858572 res!583356) b!858566))

(assert (= (and b!858566 res!583350) b!858571))

(assert (= (and b!858571 res!583353) b!858565))

(assert (= (and b!858565 res!583349) b!858564))

(assert (= (and b!858564 res!583357) b!858574))

(assert (= (and b!858574 res!583359) b!858570))

(assert (= (and b!858570 res!583355) b!858573))

(assert (= (and b!858573 (not res!583354)) b!858576))

(assert (= (and b!858576 (not res!583351)) b!858568))

(assert (= (and b!858567 condMapEmpty!26432) mapIsEmpty!26432))

(assert (= (and b!858567 (not condMapEmpty!26432)) mapNonEmpty!26432))

(get-info :version)

(assert (= (and mapNonEmpty!26432 ((_ is ValueCellFull!7838) mapValue!26432)) b!858575))

(assert (= (and b!858567 ((_ is ValueCellFull!7838) mapDefault!26432)) b!858569))

(assert (= start!73486 b!858567))

(declare-fun b_lambda!11753 () Bool)

(assert (=> (not b_lambda!11753) (not b!858576)))

(declare-fun t!23472 () Bool)

(declare-fun tb!4533 () Bool)

(assert (=> (and start!73486 (= defaultEntry!696 defaultEntry!696) t!23472) tb!4533))

(declare-fun result!8685 () Bool)

(assert (=> tb!4533 (= result!8685 tp_is_empty!16555)))

(assert (=> b!858576 t!23472))

(declare-fun b_and!23793 () Bool)

(assert (= b_and!23791 (and (=> t!23472 result!8685) b_and!23793)))

(declare-fun m!798771 () Bool)

(assert (=> b!858568 m!798771))

(declare-fun m!798773 () Bool)

(assert (=> b!858568 m!798773))

(declare-fun m!798775 () Bool)

(assert (=> b!858564 m!798775))

(declare-fun m!798777 () Bool)

(assert (=> b!858574 m!798777))

(declare-fun m!798779 () Bool)

(assert (=> b!858566 m!798779))

(declare-fun m!798781 () Bool)

(assert (=> b!858563 m!798781))

(declare-fun m!798783 () Bool)

(assert (=> b!858576 m!798783))

(declare-fun m!798785 () Bool)

(assert (=> b!858576 m!798785))

(declare-fun m!798787 () Bool)

(assert (=> b!858576 m!798787))

(declare-fun m!798789 () Bool)

(assert (=> b!858576 m!798789))

(assert (=> b!858576 m!798785))

(declare-fun m!798791 () Bool)

(assert (=> b!858576 m!798791))

(assert (=> b!858576 m!798787))

(declare-fun m!798793 () Bool)

(assert (=> mapNonEmpty!26432 m!798793))

(declare-fun m!798795 () Bool)

(assert (=> b!858573 m!798795))

(declare-fun m!798797 () Bool)

(assert (=> b!858573 m!798797))

(assert (=> b!858573 m!798791))

(declare-fun m!798799 () Bool)

(assert (=> b!858573 m!798799))

(assert (=> b!858573 m!798791))

(declare-fun m!798801 () Bool)

(assert (=> b!858573 m!798801))

(declare-fun m!798803 () Bool)

(assert (=> b!858573 m!798803))

(declare-fun m!798805 () Bool)

(assert (=> b!858571 m!798805))

(declare-fun m!798807 () Bool)

(assert (=> b!858570 m!798807))

(declare-fun m!798809 () Bool)

(assert (=> b!858570 m!798809))

(declare-fun m!798811 () Bool)

(assert (=> b!858570 m!798811))

(declare-fun m!798813 () Bool)

(assert (=> start!73486 m!798813))

(declare-fun m!798815 () Bool)

(assert (=> start!73486 m!798815))

(check-sat (not b!858570) (not start!73486) (not b!858566) (not mapNonEmpty!26432) (not b!858571) (not b!858573) (not b!858564) (not b!858563) b_and!23793 (not b!858576) (not b!858568) (not b_next!14419) tp_is_empty!16555 (not b_lambda!11753))
(check-sat b_and!23793 (not b_next!14419))
