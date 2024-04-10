; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73620 () Bool)

(assert start!73620)

(declare-fun b_free!14535 () Bool)

(declare-fun b_next!14535 () Bool)

(assert (=> start!73620 (= b_free!14535 (not b_next!14535))))

(declare-fun tp!51108 () Bool)

(declare-fun b_and!24049 () Bool)

(assert (=> start!73620 (= tp!51108 b_and!24049)))

(declare-fun b!861657 () Bool)

(declare-fun res!585563 () Bool)

(declare-fun e!480080 () Bool)

(assert (=> b!861657 (=> (not res!585563) (not e!480080))))

(declare-datatypes ((array!49506 0))(
  ( (array!49507 (arr!23784 (Array (_ BitVec 32) (_ BitVec 64))) (size!24224 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49506)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49506 (_ BitVec 32)) Bool)

(assert (=> b!861657 (= res!585563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!861658 () Bool)

(declare-fun res!585557 () Bool)

(assert (=> b!861658 (=> (not res!585557) (not e!480080))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!861658 (= res!585557 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24224 _keys!868))))))

(declare-fun b!861659 () Bool)

(declare-fun res!585561 () Bool)

(assert (=> b!861659 (=> (not res!585561) (not e!480080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861659 (= res!585561 (validMask!0 mask!1196))))

(declare-fun b!861660 () Bool)

(declare-fun res!585562 () Bool)

(assert (=> b!861660 (=> (not res!585562) (not e!480080))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861660 (= res!585562 (validKeyInArray!0 k0!854))))

(declare-fun b!861661 () Bool)

(declare-fun e!480084 () Bool)

(assert (=> b!861661 (= e!480084 true)))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!861661 (not (= (select (arr!23784 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29394 0))(
  ( (Unit!29395) )
))
(declare-fun lt!388645 () Unit!29394)

(declare-fun e!480078 () Unit!29394)

(assert (=> b!861661 (= lt!388645 e!480078)))

(declare-fun c!92023 () Bool)

(assert (=> b!861661 (= c!92023 (= (select (arr!23784 _keys!868) from!1053) k0!854))))

(declare-datatypes ((V!27275 0))(
  ( (V!27276 (val!8383 Int)) )
))
(declare-datatypes ((tuple2!11080 0))(
  ( (tuple2!11081 (_1!5551 (_ BitVec 64)) (_2!5551 V!27275)) )
))
(declare-datatypes ((List!16889 0))(
  ( (Nil!16886) (Cons!16885 (h!18016 tuple2!11080) (t!23690 List!16889)) )
))
(declare-datatypes ((ListLongMap!9849 0))(
  ( (ListLongMap!9850 (toList!4940 List!16889)) )
))
(declare-fun lt!388648 () ListLongMap!9849)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!388647 () ListLongMap!9849)

(declare-datatypes ((ValueCell!7896 0))(
  ( (ValueCellFull!7896 (v!10808 V!27275)) (EmptyCell!7896) )
))
(declare-datatypes ((array!49508 0))(
  ( (array!49509 (arr!23785 (Array (_ BitVec 32) ValueCell!7896)) (size!24225 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49508)

(declare-fun +!2290 (ListLongMap!9849 tuple2!11080) ListLongMap!9849)

(declare-fun get!12548 (ValueCell!7896 V!27275) V!27275)

(declare-fun dynLambda!1126 (Int (_ BitVec 64)) V!27275)

(assert (=> b!861661 (= lt!388647 (+!2290 lt!388648 (tuple2!11081 (select (arr!23784 _keys!868) from!1053) (get!12548 (select (arr!23785 _values!688) from!1053) (dynLambda!1126 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!861662 () Bool)

(declare-fun Unit!29396 () Unit!29394)

(assert (=> b!861662 (= e!480078 Unit!29396)))

(declare-fun b!861663 () Bool)

(declare-fun Unit!29397 () Unit!29394)

(assert (=> b!861663 (= e!480078 Unit!29397)))

(declare-fun lt!388646 () Unit!29394)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49506 (_ BitVec 32) (_ BitVec 32)) Unit!29394)

(assert (=> b!861663 (= lt!388646 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16890 0))(
  ( (Nil!16887) (Cons!16886 (h!18017 (_ BitVec 64)) (t!23691 List!16890)) )
))
(declare-fun arrayNoDuplicates!0 (array!49506 (_ BitVec 32) List!16890) Bool)

(assert (=> b!861663 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16887)))

(declare-fun lt!388652 () Unit!29394)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49506 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29394)

(assert (=> b!861663 (= lt!388652 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49506 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861663 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388654 () Unit!29394)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49506 (_ BitVec 64) (_ BitVec 32) List!16890) Unit!29394)

(assert (=> b!861663 (= lt!388654 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16887))))

(assert (=> b!861663 false))

(declare-fun res!585565 () Bool)

(assert (=> start!73620 (=> (not res!585565) (not e!480080))))

(assert (=> start!73620 (= res!585565 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24224 _keys!868))))))

(assert (=> start!73620 e!480080))

(declare-fun tp_is_empty!16671 () Bool)

(assert (=> start!73620 tp_is_empty!16671))

(assert (=> start!73620 true))

(assert (=> start!73620 tp!51108))

(declare-fun array_inv!18822 (array!49506) Bool)

(assert (=> start!73620 (array_inv!18822 _keys!868)))

(declare-fun e!480085 () Bool)

(declare-fun array_inv!18823 (array!49508) Bool)

(assert (=> start!73620 (and (array_inv!18823 _values!688) e!480085)))

(declare-fun b!861656 () Bool)

(declare-fun res!585559 () Bool)

(assert (=> b!861656 (=> (not res!585559) (not e!480080))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!861656 (= res!585559 (and (= (size!24225 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24224 _keys!868) (size!24225 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!861664 () Bool)

(declare-fun res!585560 () Bool)

(assert (=> b!861664 (=> (not res!585560) (not e!480080))))

(assert (=> b!861664 (= res!585560 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16887))))

(declare-fun b!861665 () Bool)

(declare-fun e!480083 () Bool)

(assert (=> b!861665 (= e!480083 (not e!480084))))

(declare-fun res!585558 () Bool)

(assert (=> b!861665 (=> res!585558 e!480084)))

(assert (=> b!861665 (= res!585558 (not (validKeyInArray!0 (select (arr!23784 _keys!868) from!1053))))))

(declare-fun lt!388650 () ListLongMap!9849)

(assert (=> b!861665 (= lt!388650 lt!388648)))

(declare-fun v!557 () V!27275)

(declare-fun lt!388649 () ListLongMap!9849)

(assert (=> b!861665 (= lt!388648 (+!2290 lt!388649 (tuple2!11081 k0!854 v!557)))))

(declare-fun lt!388651 () array!49508)

(declare-fun minValue!654 () V!27275)

(declare-fun zeroValue!654 () V!27275)

(declare-fun getCurrentListMapNoExtraKeys!2916 (array!49506 array!49508 (_ BitVec 32) (_ BitVec 32) V!27275 V!27275 (_ BitVec 32) Int) ListLongMap!9849)

(assert (=> b!861665 (= lt!388650 (getCurrentListMapNoExtraKeys!2916 _keys!868 lt!388651 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!861665 (= lt!388649 (getCurrentListMapNoExtraKeys!2916 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388653 () Unit!29394)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!500 (array!49506 array!49508 (_ BitVec 32) (_ BitVec 32) V!27275 V!27275 (_ BitVec 32) (_ BitVec 64) V!27275 (_ BitVec 32) Int) Unit!29394)

(assert (=> b!861665 (= lt!388653 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!500 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!861666 () Bool)

(declare-fun res!585564 () Bool)

(assert (=> b!861666 (=> (not res!585564) (not e!480080))))

(assert (=> b!861666 (= res!585564 (and (= (select (arr!23784 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!861667 () Bool)

(assert (=> b!861667 (= e!480080 e!480083)))

(declare-fun res!585566 () Bool)

(assert (=> b!861667 (=> (not res!585566) (not e!480083))))

(assert (=> b!861667 (= res!585566 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!861667 (= lt!388647 (getCurrentListMapNoExtraKeys!2916 _keys!868 lt!388651 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!861667 (= lt!388651 (array!49509 (store (arr!23785 _values!688) i!612 (ValueCellFull!7896 v!557)) (size!24225 _values!688)))))

(declare-fun lt!388644 () ListLongMap!9849)

(assert (=> b!861667 (= lt!388644 (getCurrentListMapNoExtraKeys!2916 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861668 () Bool)

(declare-fun e!480079 () Bool)

(assert (=> b!861668 (= e!480079 tp_is_empty!16671)))

(declare-fun mapIsEmpty!26606 () Bool)

(declare-fun mapRes!26606 () Bool)

(assert (=> mapIsEmpty!26606 mapRes!26606))

(declare-fun b!861669 () Bool)

(assert (=> b!861669 (= e!480085 (and e!480079 mapRes!26606))))

(declare-fun condMapEmpty!26606 () Bool)

(declare-fun mapDefault!26606 () ValueCell!7896)

(assert (=> b!861669 (= condMapEmpty!26606 (= (arr!23785 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7896)) mapDefault!26606)))))

(declare-fun mapNonEmpty!26606 () Bool)

(declare-fun tp!51109 () Bool)

(declare-fun e!480081 () Bool)

(assert (=> mapNonEmpty!26606 (= mapRes!26606 (and tp!51109 e!480081))))

(declare-fun mapRest!26606 () (Array (_ BitVec 32) ValueCell!7896))

(declare-fun mapKey!26606 () (_ BitVec 32))

(declare-fun mapValue!26606 () ValueCell!7896)

(assert (=> mapNonEmpty!26606 (= (arr!23785 _values!688) (store mapRest!26606 mapKey!26606 mapValue!26606))))

(declare-fun b!861670 () Bool)

(assert (=> b!861670 (= e!480081 tp_is_empty!16671)))

(assert (= (and start!73620 res!585565) b!861659))

(assert (= (and b!861659 res!585561) b!861656))

(assert (= (and b!861656 res!585559) b!861657))

(assert (= (and b!861657 res!585563) b!861664))

(assert (= (and b!861664 res!585560) b!861658))

(assert (= (and b!861658 res!585557) b!861660))

(assert (= (and b!861660 res!585562) b!861666))

(assert (= (and b!861666 res!585564) b!861667))

(assert (= (and b!861667 res!585566) b!861665))

(assert (= (and b!861665 (not res!585558)) b!861661))

(assert (= (and b!861661 c!92023) b!861663))

(assert (= (and b!861661 (not c!92023)) b!861662))

(assert (= (and b!861669 condMapEmpty!26606) mapIsEmpty!26606))

(assert (= (and b!861669 (not condMapEmpty!26606)) mapNonEmpty!26606))

(get-info :version)

(assert (= (and mapNonEmpty!26606 ((_ is ValueCellFull!7896) mapValue!26606)) b!861670))

(assert (= (and b!861669 ((_ is ValueCellFull!7896) mapDefault!26606)) b!861668))

(assert (= start!73620 b!861669))

(declare-fun b_lambda!11887 () Bool)

(assert (=> (not b_lambda!11887) (not b!861661)))

(declare-fun t!23689 () Bool)

(declare-fun tb!4657 () Bool)

(assert (=> (and start!73620 (= defaultEntry!696 defaultEntry!696) t!23689) tb!4657))

(declare-fun result!8925 () Bool)

(assert (=> tb!4657 (= result!8925 tp_is_empty!16671)))

(assert (=> b!861661 t!23689))

(declare-fun b_and!24051 () Bool)

(assert (= b_and!24049 (and (=> t!23689 result!8925) b_and!24051)))

(declare-fun m!802581 () Bool)

(assert (=> b!861661 m!802581))

(declare-fun m!802583 () Bool)

(assert (=> b!861661 m!802583))

(declare-fun m!802585 () Bool)

(assert (=> b!861661 m!802585))

(declare-fun m!802587 () Bool)

(assert (=> b!861661 m!802587))

(assert (=> b!861661 m!802583))

(declare-fun m!802589 () Bool)

(assert (=> b!861661 m!802589))

(assert (=> b!861661 m!802585))

(declare-fun m!802591 () Bool)

(assert (=> b!861664 m!802591))

(declare-fun m!802593 () Bool)

(assert (=> b!861666 m!802593))

(declare-fun m!802595 () Bool)

(assert (=> b!861663 m!802595))

(declare-fun m!802597 () Bool)

(assert (=> b!861663 m!802597))

(declare-fun m!802599 () Bool)

(assert (=> b!861663 m!802599))

(declare-fun m!802601 () Bool)

(assert (=> b!861663 m!802601))

(declare-fun m!802603 () Bool)

(assert (=> b!861663 m!802603))

(declare-fun m!802605 () Bool)

(assert (=> mapNonEmpty!26606 m!802605))

(declare-fun m!802607 () Bool)

(assert (=> b!861667 m!802607))

(declare-fun m!802609 () Bool)

(assert (=> b!861667 m!802609))

(declare-fun m!802611 () Bool)

(assert (=> b!861667 m!802611))

(declare-fun m!802613 () Bool)

(assert (=> b!861657 m!802613))

(declare-fun m!802615 () Bool)

(assert (=> start!73620 m!802615))

(declare-fun m!802617 () Bool)

(assert (=> start!73620 m!802617))

(declare-fun m!802619 () Bool)

(assert (=> b!861660 m!802619))

(declare-fun m!802621 () Bool)

(assert (=> b!861659 m!802621))

(declare-fun m!802623 () Bool)

(assert (=> b!861665 m!802623))

(declare-fun m!802625 () Bool)

(assert (=> b!861665 m!802625))

(assert (=> b!861665 m!802589))

(declare-fun m!802627 () Bool)

(assert (=> b!861665 m!802627))

(assert (=> b!861665 m!802589))

(declare-fun m!802629 () Bool)

(assert (=> b!861665 m!802629))

(declare-fun m!802631 () Bool)

(assert (=> b!861665 m!802631))

(check-sat b_and!24051 (not b_lambda!11887) tp_is_empty!16671 (not b_next!14535) (not mapNonEmpty!26606) (not b!861667) (not b!861664) (not b!861659) (not b!861660) (not b!861661) (not b!861663) (not b!861665) (not start!73620) (not b!861657))
(check-sat b_and!24051 (not b_next!14535))
