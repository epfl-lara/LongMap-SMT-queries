; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73852 () Bool)

(assert start!73852)

(declare-fun b_free!14785 () Bool)

(declare-fun b_next!14785 () Bool)

(assert (=> start!73852 (= b_free!14785 (not b_next!14785))))

(declare-fun tp!51860 () Bool)

(declare-fun b_and!24511 () Bool)

(assert (=> start!73852 (= tp!51860 b_and!24511)))

(declare-fun mapIsEmpty!26981 () Bool)

(declare-fun mapRes!26981 () Bool)

(assert (=> mapIsEmpty!26981 mapRes!26981))

(declare-fun b!867544 () Bool)

(declare-fun e!483219 () Bool)

(declare-fun e!483216 () Bool)

(assert (=> b!867544 (= e!483219 e!483216)))

(declare-fun res!589506 () Bool)

(assert (=> b!867544 (=> (not res!589506) (not e!483216))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!867544 (= res!589506 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27609 0))(
  ( (V!27610 (val!8508 Int)) )
))
(declare-fun minValue!654 () V!27609)

(declare-fun zeroValue!654 () V!27609)

(declare-datatypes ((array!49991 0))(
  ( (array!49992 (arr!24027 (Array (_ BitVec 32) (_ BitVec 64))) (size!24469 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49991)

(declare-datatypes ((tuple2!11312 0))(
  ( (tuple2!11313 (_1!5667 (_ BitVec 64)) (_2!5667 V!27609)) )
))
(declare-datatypes ((List!17100 0))(
  ( (Nil!17097) (Cons!17096 (h!18227 tuple2!11312) (t!24128 List!17100)) )
))
(declare-datatypes ((ListLongMap!10071 0))(
  ( (ListLongMap!10072 (toList!5051 List!17100)) )
))
(declare-fun lt!394016 () ListLongMap!10071)

(declare-datatypes ((ValueCell!8021 0))(
  ( (ValueCellFull!8021 (v!10927 V!27609)) (EmptyCell!8021) )
))
(declare-datatypes ((array!49993 0))(
  ( (array!49994 (arr!24028 (Array (_ BitVec 32) ValueCell!8021)) (size!24470 (_ BitVec 32))) )
))
(declare-fun lt!394014 () array!49993)

(declare-fun getCurrentListMapNoExtraKeys!3044 (array!49991 array!49993 (_ BitVec 32) (_ BitVec 32) V!27609 V!27609 (_ BitVec 32) Int) ListLongMap!10071)

(assert (=> b!867544 (= lt!394016 (getCurrentListMapNoExtraKeys!3044 _keys!868 lt!394014 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27609)

(declare-fun _values!688 () array!49993)

(assert (=> b!867544 (= lt!394014 (array!49994 (store (arr!24028 _values!688) i!612 (ValueCellFull!8021 v!557)) (size!24470 _values!688)))))

(declare-fun lt!394013 () ListLongMap!10071)

(assert (=> b!867544 (= lt!394013 (getCurrentListMapNoExtraKeys!3044 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867545 () Bool)

(declare-fun res!589509 () Bool)

(assert (=> b!867545 (=> (not res!589509) (not e!483219))))

(assert (=> b!867545 (= res!589509 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24469 _keys!868))))))

(declare-fun b!867546 () Bool)

(declare-fun res!589507 () Bool)

(assert (=> b!867546 (=> (not res!589507) (not e!483219))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867546 (= res!589507 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26981 () Bool)

(declare-fun tp!51859 () Bool)

(declare-fun e!483218 () Bool)

(assert (=> mapNonEmpty!26981 (= mapRes!26981 (and tp!51859 e!483218))))

(declare-fun mapRest!26981 () (Array (_ BitVec 32) ValueCell!8021))

(declare-fun mapKey!26981 () (_ BitVec 32))

(declare-fun mapValue!26981 () ValueCell!8021)

(assert (=> mapNonEmpty!26981 (= (arr!24028 _values!688) (store mapRest!26981 mapKey!26981 mapValue!26981))))

(declare-fun res!589508 () Bool)

(assert (=> start!73852 (=> (not res!589508) (not e!483219))))

(assert (=> start!73852 (= res!589508 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24469 _keys!868))))))

(assert (=> start!73852 e!483219))

(declare-fun tp_is_empty!16921 () Bool)

(assert (=> start!73852 tp_is_empty!16921))

(assert (=> start!73852 true))

(assert (=> start!73852 tp!51860))

(declare-fun array_inv!19058 (array!49991) Bool)

(assert (=> start!73852 (array_inv!19058 _keys!868)))

(declare-fun e!483215 () Bool)

(declare-fun array_inv!19059 (array!49993) Bool)

(assert (=> start!73852 (and (array_inv!19059 _values!688) e!483215)))

(declare-fun b!867547 () Bool)

(assert (=> b!867547 (= e!483216 (not true))))

(declare-fun +!2417 (ListLongMap!10071 tuple2!11312) ListLongMap!10071)

(assert (=> b!867547 (= (getCurrentListMapNoExtraKeys!3044 _keys!868 lt!394014 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2417 (getCurrentListMapNoExtraKeys!3044 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11313 k0!854 v!557)))))

(declare-datatypes ((Unit!29721 0))(
  ( (Unit!29722) )
))
(declare-fun lt!394015 () Unit!29721)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!585 (array!49991 array!49993 (_ BitVec 32) (_ BitVec 32) V!27609 V!27609 (_ BitVec 32) (_ BitVec 64) V!27609 (_ BitVec 32) Int) Unit!29721)

(assert (=> b!867547 (= lt!394015 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!585 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!867548 () Bool)

(declare-fun res!589502 () Bool)

(assert (=> b!867548 (=> (not res!589502) (not e!483219))))

(assert (=> b!867548 (= res!589502 (and (= (size!24470 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24469 _keys!868) (size!24470 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!867549 () Bool)

(assert (=> b!867549 (= e!483218 tp_is_empty!16921)))

(declare-fun b!867550 () Bool)

(declare-fun res!589505 () Bool)

(assert (=> b!867550 (=> (not res!589505) (not e!483219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867550 (= res!589505 (validMask!0 mask!1196))))

(declare-fun b!867551 () Bool)

(declare-fun e!483217 () Bool)

(assert (=> b!867551 (= e!483215 (and e!483217 mapRes!26981))))

(declare-fun condMapEmpty!26981 () Bool)

(declare-fun mapDefault!26981 () ValueCell!8021)

(assert (=> b!867551 (= condMapEmpty!26981 (= (arr!24028 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8021)) mapDefault!26981)))))

(declare-fun b!867552 () Bool)

(declare-fun res!589504 () Bool)

(assert (=> b!867552 (=> (not res!589504) (not e!483219))))

(assert (=> b!867552 (= res!589504 (and (= (select (arr!24027 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!867553 () Bool)

(declare-fun res!589503 () Bool)

(assert (=> b!867553 (=> (not res!589503) (not e!483219))))

(declare-datatypes ((List!17101 0))(
  ( (Nil!17098) (Cons!17097 (h!18228 (_ BitVec 64)) (t!24129 List!17101)) )
))
(declare-fun arrayNoDuplicates!0 (array!49991 (_ BitVec 32) List!17101) Bool)

(assert (=> b!867553 (= res!589503 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17098))))

(declare-fun b!867554 () Bool)

(assert (=> b!867554 (= e!483217 tp_is_empty!16921)))

(declare-fun b!867555 () Bool)

(declare-fun res!589501 () Bool)

(assert (=> b!867555 (=> (not res!589501) (not e!483219))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49991 (_ BitVec 32)) Bool)

(assert (=> b!867555 (= res!589501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73852 res!589508) b!867550))

(assert (= (and b!867550 res!589505) b!867548))

(assert (= (and b!867548 res!589502) b!867555))

(assert (= (and b!867555 res!589501) b!867553))

(assert (= (and b!867553 res!589503) b!867545))

(assert (= (and b!867545 res!589509) b!867546))

(assert (= (and b!867546 res!589507) b!867552))

(assert (= (and b!867552 res!589504) b!867544))

(assert (= (and b!867544 res!589506) b!867547))

(assert (= (and b!867551 condMapEmpty!26981) mapIsEmpty!26981))

(assert (= (and b!867551 (not condMapEmpty!26981)) mapNonEmpty!26981))

(get-info :version)

(assert (= (and mapNonEmpty!26981 ((_ is ValueCellFull!8021) mapValue!26981)) b!867549))

(assert (= (and b!867551 ((_ is ValueCellFull!8021) mapDefault!26981)) b!867554))

(assert (= start!73852 b!867551))

(declare-fun m!808839 () Bool)

(assert (=> b!867552 m!808839))

(declare-fun m!808841 () Bool)

(assert (=> start!73852 m!808841))

(declare-fun m!808843 () Bool)

(assert (=> start!73852 m!808843))

(declare-fun m!808845 () Bool)

(assert (=> b!867550 m!808845))

(declare-fun m!808847 () Bool)

(assert (=> b!867553 m!808847))

(declare-fun m!808849 () Bool)

(assert (=> b!867555 m!808849))

(declare-fun m!808851 () Bool)

(assert (=> b!867546 m!808851))

(declare-fun m!808853 () Bool)

(assert (=> b!867547 m!808853))

(declare-fun m!808855 () Bool)

(assert (=> b!867547 m!808855))

(assert (=> b!867547 m!808855))

(declare-fun m!808857 () Bool)

(assert (=> b!867547 m!808857))

(declare-fun m!808859 () Bool)

(assert (=> b!867547 m!808859))

(declare-fun m!808861 () Bool)

(assert (=> mapNonEmpty!26981 m!808861))

(declare-fun m!808863 () Bool)

(assert (=> b!867544 m!808863))

(declare-fun m!808865 () Bool)

(assert (=> b!867544 m!808865))

(declare-fun m!808867 () Bool)

(assert (=> b!867544 m!808867))

(check-sat (not b!867546) (not mapNonEmpty!26981) (not b!867553) (not start!73852) (not b!867544) b_and!24511 tp_is_empty!16921 (not b!867555) (not b!867547) (not b_next!14785) (not b!867550))
(check-sat b_and!24511 (not b_next!14785))
