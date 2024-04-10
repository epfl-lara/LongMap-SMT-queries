; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74798 () Bool)

(assert start!74798)

(declare-fun b_free!15375 () Bool)

(declare-fun b_next!15375 () Bool)

(assert (=> start!74798 (= b_free!15375 (not b_next!15375))))

(declare-fun tp!53822 () Bool)

(declare-fun b_and!25417 () Bool)

(assert (=> start!74798 (= tp!53822 b_and!25417)))

(declare-fun b!881688 () Bool)

(declare-fun res!598977 () Bool)

(declare-fun e!490685 () Bool)

(assert (=> b!881688 (=> (not res!598977) (not e!490685))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51366 0))(
  ( (array!51367 (arr!24704 (Array (_ BitVec 32) (_ BitVec 64))) (size!25144 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51366)

(assert (=> b!881688 (= res!598977 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25144 _keys!868))))))

(declare-fun b!881689 () Bool)

(declare-fun res!598975 () Bool)

(assert (=> b!881689 (=> (not res!598975) (not e!490685))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!28539 0))(
  ( (V!28540 (val!8857 Int)) )
))
(declare-datatypes ((ValueCell!8370 0))(
  ( (ValueCellFull!8370 (v!11317 V!28539)) (EmptyCell!8370) )
))
(declare-datatypes ((array!51368 0))(
  ( (array!51369 (arr!24705 (Array (_ BitVec 32) ValueCell!8370)) (size!25145 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51368)

(assert (=> b!881689 (= res!598975 (and (= (size!25145 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25144 _keys!868) (size!25145 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!28059 () Bool)

(declare-fun mapRes!28059 () Bool)

(declare-fun tp!53821 () Bool)

(declare-fun e!490686 () Bool)

(assert (=> mapNonEmpty!28059 (= mapRes!28059 (and tp!53821 e!490686))))

(declare-fun mapKey!28059 () (_ BitVec 32))

(declare-fun mapValue!28059 () ValueCell!8370)

(declare-fun mapRest!28059 () (Array (_ BitVec 32) ValueCell!8370))

(assert (=> mapNonEmpty!28059 (= (arr!24705 _values!688) (store mapRest!28059 mapKey!28059 mapValue!28059))))

(declare-fun b!881690 () Bool)

(declare-fun res!598979 () Bool)

(assert (=> b!881690 (=> (not res!598979) (not e!490685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!881690 (= res!598979 (validMask!0 mask!1196))))

(declare-fun b!881691 () Bool)

(declare-fun e!490688 () Bool)

(assert (=> b!881691 (= e!490688 true)))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!51366 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!881691 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-datatypes ((Unit!30086 0))(
  ( (Unit!30087) )
))
(declare-fun lt!398811 () Unit!30086)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51366 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30086)

(assert (=> b!881691 (= lt!398811 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-datatypes ((List!17537 0))(
  ( (Nil!17534) (Cons!17533 (h!18664 (_ BitVec 64)) (t!24714 List!17537)) )
))
(declare-fun arrayNoDuplicates!0 (array!51366 (_ BitVec 32) List!17537) Bool)

(assert (=> b!881691 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17534)))

(declare-fun lt!398806 () Unit!30086)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51366 (_ BitVec 32) (_ BitVec 32)) Unit!30086)

(assert (=> b!881691 (= lt!398806 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!881693 () Bool)

(declare-fun res!598980 () Bool)

(assert (=> b!881693 (=> (not res!598980) (not e!490685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51366 (_ BitVec 32)) Bool)

(assert (=> b!881693 (= res!598980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!881694 () Bool)

(declare-fun e!490683 () Bool)

(declare-fun e!490682 () Bool)

(assert (=> b!881694 (= e!490683 (not e!490682))))

(declare-fun res!598978 () Bool)

(assert (=> b!881694 (=> res!598978 e!490682)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!881694 (= res!598978 (not (validKeyInArray!0 (select (arr!24704 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11724 0))(
  ( (tuple2!11725 (_1!5873 (_ BitVec 64)) (_2!5873 V!28539)) )
))
(declare-datatypes ((List!17538 0))(
  ( (Nil!17535) (Cons!17534 (h!18665 tuple2!11724) (t!24715 List!17538)) )
))
(declare-datatypes ((ListLongMap!10493 0))(
  ( (ListLongMap!10494 (toList!5262 List!17538)) )
))
(declare-fun lt!398809 () ListLongMap!10493)

(declare-fun lt!398807 () ListLongMap!10493)

(assert (=> b!881694 (= lt!398809 lt!398807)))

(declare-fun v!557 () V!28539)

(declare-fun lt!398805 () ListLongMap!10493)

(declare-fun +!2534 (ListLongMap!10493 tuple2!11724) ListLongMap!10493)

(assert (=> b!881694 (= lt!398807 (+!2534 lt!398805 (tuple2!11725 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!398808 () array!51368)

(declare-fun minValue!654 () V!28539)

(declare-fun zeroValue!654 () V!28539)

(declare-fun getCurrentListMapNoExtraKeys!3225 (array!51366 array!51368 (_ BitVec 32) (_ BitVec 32) V!28539 V!28539 (_ BitVec 32) Int) ListLongMap!10493)

(assert (=> b!881694 (= lt!398809 (getCurrentListMapNoExtraKeys!3225 _keys!868 lt!398808 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!881694 (= lt!398805 (getCurrentListMapNoExtraKeys!3225 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!398812 () Unit!30086)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!723 (array!51366 array!51368 (_ BitVec 32) (_ BitVec 32) V!28539 V!28539 (_ BitVec 32) (_ BitVec 64) V!28539 (_ BitVec 32) Int) Unit!30086)

(assert (=> b!881694 (= lt!398812 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!723 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!881695 () Bool)

(declare-fun res!598973 () Bool)

(assert (=> b!881695 (=> (not res!598973) (not e!490685))))

(assert (=> b!881695 (= res!598973 (validKeyInArray!0 k0!854))))

(declare-fun b!881696 () Bool)

(declare-fun res!598972 () Bool)

(assert (=> b!881696 (=> (not res!598972) (not e!490685))))

(assert (=> b!881696 (= res!598972 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17534))))

(declare-fun b!881697 () Bool)

(assert (=> b!881697 (= e!490682 e!490688)))

(declare-fun res!598976 () Bool)

(assert (=> b!881697 (=> res!598976 e!490688)))

(assert (=> b!881697 (= res!598976 (not (= (select (arr!24704 _keys!868) from!1053) k0!854)))))

(declare-fun lt!398810 () ListLongMap!10493)

(declare-fun get!13002 (ValueCell!8370 V!28539) V!28539)

(declare-fun dynLambda!1249 (Int (_ BitVec 64)) V!28539)

(assert (=> b!881697 (= lt!398810 (+!2534 lt!398807 (tuple2!11725 (select (arr!24704 _keys!868) from!1053) (get!13002 (select (arr!24705 _values!688) from!1053) (dynLambda!1249 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881698 () Bool)

(declare-fun e!490689 () Bool)

(declare-fun e!490687 () Bool)

(assert (=> b!881698 (= e!490689 (and e!490687 mapRes!28059))))

(declare-fun condMapEmpty!28059 () Bool)

(declare-fun mapDefault!28059 () ValueCell!8370)

(assert (=> b!881698 (= condMapEmpty!28059 (= (arr!24705 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8370)) mapDefault!28059)))))

(declare-fun b!881699 () Bool)

(assert (=> b!881699 (= e!490685 e!490683)))

(declare-fun res!598970 () Bool)

(assert (=> b!881699 (=> (not res!598970) (not e!490683))))

(assert (=> b!881699 (= res!598970 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!881699 (= lt!398810 (getCurrentListMapNoExtraKeys!3225 _keys!868 lt!398808 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!881699 (= lt!398808 (array!51369 (store (arr!24705 _values!688) i!612 (ValueCellFull!8370 v!557)) (size!25145 _values!688)))))

(declare-fun lt!398813 () ListLongMap!10493)

(assert (=> b!881699 (= lt!398813 (getCurrentListMapNoExtraKeys!3225 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!598974 () Bool)

(assert (=> start!74798 (=> (not res!598974) (not e!490685))))

(assert (=> start!74798 (= res!598974 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25144 _keys!868))))))

(assert (=> start!74798 e!490685))

(declare-fun tp_is_empty!17619 () Bool)

(assert (=> start!74798 tp_is_empty!17619))

(assert (=> start!74798 true))

(assert (=> start!74798 tp!53822))

(declare-fun array_inv!19454 (array!51366) Bool)

(assert (=> start!74798 (array_inv!19454 _keys!868)))

(declare-fun array_inv!19455 (array!51368) Bool)

(assert (=> start!74798 (and (array_inv!19455 _values!688) e!490689)))

(declare-fun b!881692 () Bool)

(assert (=> b!881692 (= e!490687 tp_is_empty!17619)))

(declare-fun b!881700 () Bool)

(assert (=> b!881700 (= e!490686 tp_is_empty!17619)))

(declare-fun mapIsEmpty!28059 () Bool)

(assert (=> mapIsEmpty!28059 mapRes!28059))

(declare-fun b!881701 () Bool)

(declare-fun res!598971 () Bool)

(assert (=> b!881701 (=> (not res!598971) (not e!490685))))

(assert (=> b!881701 (= res!598971 (and (= (select (arr!24704 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!74798 res!598974) b!881690))

(assert (= (and b!881690 res!598979) b!881689))

(assert (= (and b!881689 res!598975) b!881693))

(assert (= (and b!881693 res!598980) b!881696))

(assert (= (and b!881696 res!598972) b!881688))

(assert (= (and b!881688 res!598977) b!881695))

(assert (= (and b!881695 res!598973) b!881701))

(assert (= (and b!881701 res!598971) b!881699))

(assert (= (and b!881699 res!598970) b!881694))

(assert (= (and b!881694 (not res!598978)) b!881697))

(assert (= (and b!881697 (not res!598976)) b!881691))

(assert (= (and b!881698 condMapEmpty!28059) mapIsEmpty!28059))

(assert (= (and b!881698 (not condMapEmpty!28059)) mapNonEmpty!28059))

(get-info :version)

(assert (= (and mapNonEmpty!28059 ((_ is ValueCellFull!8370) mapValue!28059)) b!881700))

(assert (= (and b!881698 ((_ is ValueCellFull!8370) mapDefault!28059)) b!881692))

(assert (= start!74798 b!881698))

(declare-fun b_lambda!12585 () Bool)

(assert (=> (not b_lambda!12585) (not b!881697)))

(declare-fun t!24713 () Bool)

(declare-fun tb!5033 () Bool)

(assert (=> (and start!74798 (= defaultEntry!696 defaultEntry!696) t!24713) tb!5033))

(declare-fun result!9697 () Bool)

(assert (=> tb!5033 (= result!9697 tp_is_empty!17619)))

(assert (=> b!881697 t!24713))

(declare-fun b_and!25419 () Bool)

(assert (= b_and!25417 (and (=> t!24713 result!9697) b_and!25419)))

(declare-fun m!821565 () Bool)

(assert (=> b!881691 m!821565))

(declare-fun m!821567 () Bool)

(assert (=> b!881691 m!821567))

(declare-fun m!821569 () Bool)

(assert (=> b!881691 m!821569))

(declare-fun m!821571 () Bool)

(assert (=> b!881691 m!821571))

(declare-fun m!821573 () Bool)

(assert (=> b!881694 m!821573))

(declare-fun m!821575 () Bool)

(assert (=> b!881694 m!821575))

(declare-fun m!821577 () Bool)

(assert (=> b!881694 m!821577))

(declare-fun m!821579 () Bool)

(assert (=> b!881694 m!821579))

(assert (=> b!881694 m!821577))

(declare-fun m!821581 () Bool)

(assert (=> b!881694 m!821581))

(declare-fun m!821583 () Bool)

(assert (=> b!881694 m!821583))

(declare-fun m!821585 () Bool)

(assert (=> mapNonEmpty!28059 m!821585))

(declare-fun m!821587 () Bool)

(assert (=> b!881699 m!821587))

(declare-fun m!821589 () Bool)

(assert (=> b!881699 m!821589))

(declare-fun m!821591 () Bool)

(assert (=> b!881699 m!821591))

(declare-fun m!821593 () Bool)

(assert (=> b!881701 m!821593))

(declare-fun m!821595 () Bool)

(assert (=> b!881690 m!821595))

(declare-fun m!821597 () Bool)

(assert (=> start!74798 m!821597))

(declare-fun m!821599 () Bool)

(assert (=> start!74798 m!821599))

(declare-fun m!821601 () Bool)

(assert (=> b!881693 m!821601))

(declare-fun m!821603 () Bool)

(assert (=> b!881697 m!821603))

(declare-fun m!821605 () Bool)

(assert (=> b!881697 m!821605))

(declare-fun m!821607 () Bool)

(assert (=> b!881697 m!821607))

(declare-fun m!821609 () Bool)

(assert (=> b!881697 m!821609))

(assert (=> b!881697 m!821605))

(assert (=> b!881697 m!821577))

(assert (=> b!881697 m!821607))

(declare-fun m!821611 () Bool)

(assert (=> b!881696 m!821611))

(declare-fun m!821613 () Bool)

(assert (=> b!881695 m!821613))

(check-sat tp_is_empty!17619 b_and!25419 (not mapNonEmpty!28059) (not start!74798) (not b!881690) (not b!881691) (not b!881693) (not b!881695) (not b!881699) (not b!881694) (not b_lambda!12585) (not b!881696) (not b!881697) (not b_next!15375))
(check-sat b_and!25419 (not b_next!15375))
