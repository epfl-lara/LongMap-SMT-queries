; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72646 () Bool)

(assert start!72646)

(declare-fun b_free!13663 () Bool)

(declare-fun b_next!13663 () Bool)

(assert (=> start!72646 (= b_free!13663 (not b_next!13663))))

(declare-fun tp!48089 () Bool)

(declare-fun b_and!22759 () Bool)

(assert (=> start!72646 (= tp!48089 b_and!22759)))

(declare-fun b!841643 () Bool)

(declare-fun res!571894 () Bool)

(declare-fun e!469664 () Bool)

(assert (=> b!841643 (=> (not res!571894) (not e!469664))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!25753 0))(
  ( (V!25754 (val!7812 Int)) )
))
(declare-datatypes ((ValueCell!7325 0))(
  ( (ValueCellFull!7325 (v!10237 V!25753)) (EmptyCell!7325) )
))
(declare-datatypes ((array!47351 0))(
  ( (array!47352 (arr!22702 (Array (_ BitVec 32) ValueCell!7325)) (size!23143 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47351)

(declare-datatypes ((array!47353 0))(
  ( (array!47354 (arr!22703 (Array (_ BitVec 32) (_ BitVec 64))) (size!23144 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47353)

(assert (=> b!841643 (= res!571894 (and (= (size!23143 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23144 _keys!868) (size!23143 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!841644 () Bool)

(declare-fun e!469663 () Bool)

(declare-datatypes ((tuple2!10286 0))(
  ( (tuple2!10287 (_1!5154 (_ BitVec 64)) (_2!5154 V!25753)) )
))
(declare-datatypes ((List!16061 0))(
  ( (Nil!16058) (Cons!16057 (h!17194 tuple2!10286) (t!22424 List!16061)) )
))
(declare-datatypes ((ListLongMap!9057 0))(
  ( (ListLongMap!9058 (toList!4544 List!16061)) )
))
(declare-fun call!37267 () ListLongMap!9057)

(declare-fun call!37268 () ListLongMap!9057)

(assert (=> b!841644 (= e!469663 (= call!37267 call!37268))))

(declare-fun b!841645 () Bool)

(declare-fun e!469661 () Bool)

(declare-fun tp_is_empty!15529 () Bool)

(assert (=> b!841645 (= e!469661 tp_is_empty!15529)))

(declare-fun b!841646 () Bool)

(declare-fun res!571893 () Bool)

(assert (=> b!841646 (=> (not res!571893) (not e!469664))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841646 (= res!571893 (validKeyInArray!0 k0!854))))

(declare-fun v!557 () V!25753)

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37264 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25753)

(declare-fun zeroValue!654 () V!25753)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2604 (array!47353 array!47351 (_ BitVec 32) (_ BitVec 32) V!25753 V!25753 (_ BitVec 32) Int) ListLongMap!9057)

(assert (=> bm!37264 (= call!37267 (getCurrentListMapNoExtraKeys!2604 _keys!868 (array!47352 (store (arr!22702 _values!688) i!612 (ValueCellFull!7325 v!557)) (size!23143 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841647 () Bool)

(assert (=> b!841647 (= e!469664 (not true))))

(assert (=> b!841647 e!469663))

(declare-fun c!91636 () Bool)

(assert (=> b!841647 (= c!91636 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28890 0))(
  ( (Unit!28891) )
))
(declare-fun lt!381221 () Unit!28890)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!281 (array!47353 array!47351 (_ BitVec 32) (_ BitVec 32) V!25753 V!25753 (_ BitVec 32) (_ BitVec 64) V!25753 (_ BitVec 32) Int) Unit!28890)

(assert (=> b!841647 (= lt!381221 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!281 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841648 () Bool)

(declare-fun res!571896 () Bool)

(assert (=> b!841648 (=> (not res!571896) (not e!469664))))

(assert (=> b!841648 (= res!571896 (and (= (select (arr!22703 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23144 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun res!571892 () Bool)

(assert (=> start!72646 (=> (not res!571892) (not e!469664))))

(assert (=> start!72646 (= res!571892 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23144 _keys!868))))))

(assert (=> start!72646 e!469664))

(assert (=> start!72646 tp_is_empty!15529))

(assert (=> start!72646 true))

(assert (=> start!72646 tp!48089))

(declare-fun array_inv!18112 (array!47353) Bool)

(assert (=> start!72646 (array_inv!18112 _keys!868)))

(declare-fun e!469665 () Bool)

(declare-fun array_inv!18113 (array!47351) Bool)

(assert (=> start!72646 (and (array_inv!18113 _values!688) e!469665)))

(declare-fun b!841649 () Bool)

(declare-fun res!571891 () Bool)

(assert (=> b!841649 (=> (not res!571891) (not e!469664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47353 (_ BitVec 32)) Bool)

(assert (=> b!841649 (= res!571891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!841650 () Bool)

(declare-fun mapRes!24893 () Bool)

(assert (=> b!841650 (= e!469665 (and e!469661 mapRes!24893))))

(declare-fun condMapEmpty!24893 () Bool)

(declare-fun mapDefault!24893 () ValueCell!7325)

(assert (=> b!841650 (= condMapEmpty!24893 (= (arr!22702 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7325)) mapDefault!24893)))))

(declare-fun mapNonEmpty!24893 () Bool)

(declare-fun tp!48088 () Bool)

(declare-fun e!469666 () Bool)

(assert (=> mapNonEmpty!24893 (= mapRes!24893 (and tp!48088 e!469666))))

(declare-fun mapKey!24893 () (_ BitVec 32))

(declare-fun mapRest!24893 () (Array (_ BitVec 32) ValueCell!7325))

(declare-fun mapValue!24893 () ValueCell!7325)

(assert (=> mapNonEmpty!24893 (= (arr!22702 _values!688) (store mapRest!24893 mapKey!24893 mapValue!24893))))

(declare-fun b!841651 () Bool)

(assert (=> b!841651 (= e!469666 tp_is_empty!15529)))

(declare-fun mapIsEmpty!24893 () Bool)

(assert (=> mapIsEmpty!24893 mapRes!24893))

(declare-fun bm!37265 () Bool)

(assert (=> bm!37265 (= call!37268 (getCurrentListMapNoExtraKeys!2604 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841652 () Bool)

(declare-fun res!571890 () Bool)

(assert (=> b!841652 (=> (not res!571890) (not e!469664))))

(declare-datatypes ((List!16062 0))(
  ( (Nil!16059) (Cons!16058 (h!17195 (_ BitVec 64)) (t!22425 List!16062)) )
))
(declare-fun arrayNoDuplicates!0 (array!47353 (_ BitVec 32) List!16062) Bool)

(assert (=> b!841652 (= res!571890 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16059))))

(declare-fun b!841653 () Bool)

(declare-fun res!571897 () Bool)

(assert (=> b!841653 (=> (not res!571897) (not e!469664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841653 (= res!571897 (validMask!0 mask!1196))))

(declare-fun b!841654 () Bool)

(declare-fun +!2052 (ListLongMap!9057 tuple2!10286) ListLongMap!9057)

(assert (=> b!841654 (= e!469663 (= call!37267 (+!2052 call!37268 (tuple2!10287 k0!854 v!557))))))

(declare-fun b!841655 () Bool)

(declare-fun res!571895 () Bool)

(assert (=> b!841655 (=> (not res!571895) (not e!469664))))

(assert (=> b!841655 (= res!571895 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23144 _keys!868))))))

(assert (= (and start!72646 res!571892) b!841653))

(assert (= (and b!841653 res!571897) b!841643))

(assert (= (and b!841643 res!571894) b!841649))

(assert (= (and b!841649 res!571891) b!841652))

(assert (= (and b!841652 res!571890) b!841655))

(assert (= (and b!841655 res!571895) b!841646))

(assert (= (and b!841646 res!571893) b!841648))

(assert (= (and b!841648 res!571896) b!841647))

(assert (= (and b!841647 c!91636) b!841654))

(assert (= (and b!841647 (not c!91636)) b!841644))

(assert (= (or b!841654 b!841644) bm!37264))

(assert (= (or b!841654 b!841644) bm!37265))

(assert (= (and b!841650 condMapEmpty!24893) mapIsEmpty!24893))

(assert (= (and b!841650 (not condMapEmpty!24893)) mapNonEmpty!24893))

(get-info :version)

(assert (= (and mapNonEmpty!24893 ((_ is ValueCellFull!7325) mapValue!24893)) b!841651))

(assert (= (and b!841650 ((_ is ValueCellFull!7325) mapDefault!24893)) b!841645))

(assert (= start!72646 b!841650))

(declare-fun m!785705 () Bool)

(assert (=> b!841648 m!785705))

(declare-fun m!785707 () Bool)

(assert (=> b!841652 m!785707))

(declare-fun m!785709 () Bool)

(assert (=> b!841654 m!785709))

(declare-fun m!785711 () Bool)

(assert (=> b!841647 m!785711))

(declare-fun m!785713 () Bool)

(assert (=> start!72646 m!785713))

(declare-fun m!785715 () Bool)

(assert (=> start!72646 m!785715))

(declare-fun m!785717 () Bool)

(assert (=> bm!37265 m!785717))

(declare-fun m!785719 () Bool)

(assert (=> bm!37264 m!785719))

(declare-fun m!785721 () Bool)

(assert (=> bm!37264 m!785721))

(declare-fun m!785723 () Bool)

(assert (=> b!841649 m!785723))

(declare-fun m!785725 () Bool)

(assert (=> mapNonEmpty!24893 m!785725))

(declare-fun m!785727 () Bool)

(assert (=> b!841646 m!785727))

(declare-fun m!785729 () Bool)

(assert (=> b!841653 m!785729))

(check-sat (not b_next!13663) (not bm!37265) (not bm!37264) (not b!841649) (not b!841654) (not b!841652) (not b!841647) (not start!72646) (not b!841646) (not mapNonEmpty!24893) (not b!841653) tp_is_empty!15529 b_and!22759)
(check-sat b_and!22759 (not b_next!13663))
