; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74570 () Bool)

(assert start!74570)

(declare-fun b_free!15277 () Bool)

(declare-fun b_next!15277 () Bool)

(assert (=> start!74570 (= b_free!15277 (not b_next!15277))))

(declare-fun tp!53513 () Bool)

(declare-fun b_and!25127 () Bool)

(assert (=> start!74570 (= tp!53513 b_and!25127)))

(declare-fun b!878698 () Bool)

(declare-fun e!488996 () Bool)

(declare-fun tp_is_empty!17521 () Bool)

(assert (=> b!878698 (= e!488996 tp_is_empty!17521)))

(declare-fun b!878700 () Bool)

(declare-fun e!488999 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51147 0))(
  ( (array!51148 (arr!24600 (Array (_ BitVec 32) (_ BitVec 64))) (size!25042 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51147)

(assert (=> b!878700 (= e!488999 (bvslt from!1053 (size!25042 _keys!868)))))

(declare-fun b!878701 () Bool)

(declare-fun res!597050 () Bool)

(declare-fun e!488998 () Bool)

(assert (=> b!878701 (=> (not res!597050) (not e!488998))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51147 (_ BitVec 32)) Bool)

(assert (=> b!878701 (= res!597050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878702 () Bool)

(declare-fun res!597051 () Bool)

(assert (=> b!878702 (=> (not res!597051) (not e!488998))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!28409 0))(
  ( (V!28410 (val!8808 Int)) )
))
(declare-datatypes ((ValueCell!8321 0))(
  ( (ValueCellFull!8321 (v!11242 V!28409)) (EmptyCell!8321) )
))
(declare-datatypes ((array!51149 0))(
  ( (array!51150 (arr!24601 (Array (_ BitVec 32) ValueCell!8321)) (size!25043 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51149)

(assert (=> b!878702 (= res!597051 (and (= (size!25043 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25042 _keys!868) (size!25043 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27897 () Bool)

(declare-fun mapRes!27897 () Bool)

(declare-fun tp!53514 () Bool)

(assert (=> mapNonEmpty!27897 (= mapRes!27897 (and tp!53514 e!488996))))

(declare-fun mapRest!27897 () (Array (_ BitVec 32) ValueCell!8321))

(declare-fun mapKey!27897 () (_ BitVec 32))

(declare-fun mapValue!27897 () ValueCell!8321)

(assert (=> mapNonEmpty!27897 (= (arr!24601 _values!688) (store mapRest!27897 mapKey!27897 mapValue!27897))))

(declare-fun b!878703 () Bool)

(declare-fun res!597046 () Bool)

(assert (=> b!878703 (=> (not res!597046) (not e!488998))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878703 (= res!597046 (validKeyInArray!0 k0!854))))

(declare-fun b!878704 () Bool)

(declare-fun res!597048 () Bool)

(assert (=> b!878704 (=> (not res!597048) (not e!488998))))

(declare-datatypes ((List!17465 0))(
  ( (Nil!17462) (Cons!17461 (h!18592 (_ BitVec 64)) (t!24545 List!17465)) )
))
(declare-fun arrayNoDuplicates!0 (array!51147 (_ BitVec 32) List!17465) Bool)

(assert (=> b!878704 (= res!597048 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17462))))

(declare-fun b!878705 () Bool)

(declare-fun e!489000 () Bool)

(declare-fun e!488997 () Bool)

(assert (=> b!878705 (= e!489000 (and e!488997 mapRes!27897))))

(declare-fun condMapEmpty!27897 () Bool)

(declare-fun mapDefault!27897 () ValueCell!8321)

(assert (=> b!878705 (= condMapEmpty!27897 (= (arr!24601 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8321)) mapDefault!27897)))))

(declare-fun b!878706 () Bool)

(declare-fun e!488994 () Bool)

(assert (=> b!878706 (= e!488998 e!488994)))

(declare-fun res!597044 () Bool)

(assert (=> b!878706 (=> (not res!597044) (not e!488994))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!878706 (= res!597044 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!397147 () array!51149)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11666 0))(
  ( (tuple2!11667 (_1!5844 (_ BitVec 64)) (_2!5844 V!28409)) )
))
(declare-datatypes ((List!17466 0))(
  ( (Nil!17463) (Cons!17462 (h!18593 tuple2!11666) (t!24546 List!17466)) )
))
(declare-datatypes ((ListLongMap!10425 0))(
  ( (ListLongMap!10426 (toList!5228 List!17466)) )
))
(declare-fun lt!397146 () ListLongMap!10425)

(declare-fun minValue!654 () V!28409)

(declare-fun zeroValue!654 () V!28409)

(declare-fun getCurrentListMapNoExtraKeys!3221 (array!51147 array!51149 (_ BitVec 32) (_ BitVec 32) V!28409 V!28409 (_ BitVec 32) Int) ListLongMap!10425)

(assert (=> b!878706 (= lt!397146 (getCurrentListMapNoExtraKeys!3221 _keys!868 lt!397147 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28409)

(assert (=> b!878706 (= lt!397147 (array!51150 (store (arr!24601 _values!688) i!612 (ValueCellFull!8321 v!557)) (size!25043 _values!688)))))

(declare-fun lt!397144 () ListLongMap!10425)

(assert (=> b!878706 (= lt!397144 (getCurrentListMapNoExtraKeys!3221 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!878707 () Bool)

(assert (=> b!878707 (= e!488997 tp_is_empty!17521)))

(declare-fun res!597045 () Bool)

(assert (=> start!74570 (=> (not res!597045) (not e!488998))))

(assert (=> start!74570 (= res!597045 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25042 _keys!868))))))

(assert (=> start!74570 e!488998))

(assert (=> start!74570 tp_is_empty!17521))

(assert (=> start!74570 true))

(assert (=> start!74570 tp!53513))

(declare-fun array_inv!19430 (array!51147) Bool)

(assert (=> start!74570 (array_inv!19430 _keys!868)))

(declare-fun array_inv!19431 (array!51149) Bool)

(assert (=> start!74570 (and (array_inv!19431 _values!688) e!489000)))

(declare-fun b!878699 () Bool)

(declare-fun res!597049 () Bool)

(assert (=> b!878699 (=> (not res!597049) (not e!488998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878699 (= res!597049 (validMask!0 mask!1196))))

(declare-fun b!878708 () Bool)

(assert (=> b!878708 (= e!488994 (not e!488999))))

(declare-fun res!597047 () Bool)

(assert (=> b!878708 (=> res!597047 e!488999)))

(assert (=> b!878708 (= res!597047 (not (validKeyInArray!0 (select (arr!24600 _keys!868) from!1053))))))

(declare-fun +!2524 (ListLongMap!10425 tuple2!11666) ListLongMap!10425)

(assert (=> b!878708 (= (getCurrentListMapNoExtraKeys!3221 _keys!868 lt!397147 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2524 (getCurrentListMapNoExtraKeys!3221 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11667 k0!854 v!557)))))

(declare-datatypes ((Unit!29963 0))(
  ( (Unit!29964) )
))
(declare-fun lt!397145 () Unit!29963)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!693 (array!51147 array!51149 (_ BitVec 32) (_ BitVec 32) V!28409 V!28409 (_ BitVec 32) (_ BitVec 64) V!28409 (_ BitVec 32) Int) Unit!29963)

(assert (=> b!878708 (= lt!397145 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!693 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!878709 () Bool)

(declare-fun res!597042 () Bool)

(assert (=> b!878709 (=> (not res!597042) (not e!488998))))

(assert (=> b!878709 (= res!597042 (and (= (select (arr!24600 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!878710 () Bool)

(declare-fun res!597043 () Bool)

(assert (=> b!878710 (=> (not res!597043) (not e!488998))))

(assert (=> b!878710 (= res!597043 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25042 _keys!868))))))

(declare-fun mapIsEmpty!27897 () Bool)

(assert (=> mapIsEmpty!27897 mapRes!27897))

(assert (= (and start!74570 res!597045) b!878699))

(assert (= (and b!878699 res!597049) b!878702))

(assert (= (and b!878702 res!597051) b!878701))

(assert (= (and b!878701 res!597050) b!878704))

(assert (= (and b!878704 res!597048) b!878710))

(assert (= (and b!878710 res!597043) b!878703))

(assert (= (and b!878703 res!597046) b!878709))

(assert (= (and b!878709 res!597042) b!878706))

(assert (= (and b!878706 res!597044) b!878708))

(assert (= (and b!878708 (not res!597047)) b!878700))

(assert (= (and b!878705 condMapEmpty!27897) mapIsEmpty!27897))

(assert (= (and b!878705 (not condMapEmpty!27897)) mapNonEmpty!27897))

(get-info :version)

(assert (= (and mapNonEmpty!27897 ((_ is ValueCellFull!8321) mapValue!27897)) b!878698))

(assert (= (and b!878705 ((_ is ValueCellFull!8321) mapDefault!27897)) b!878707))

(assert (= start!74570 b!878705))

(declare-fun m!817923 () Bool)

(assert (=> start!74570 m!817923))

(declare-fun m!817925 () Bool)

(assert (=> start!74570 m!817925))

(declare-fun m!817927 () Bool)

(assert (=> b!878706 m!817927))

(declare-fun m!817929 () Bool)

(assert (=> b!878706 m!817929))

(declare-fun m!817931 () Bool)

(assert (=> b!878706 m!817931))

(declare-fun m!817933 () Bool)

(assert (=> b!878701 m!817933))

(declare-fun m!817935 () Bool)

(assert (=> b!878699 m!817935))

(declare-fun m!817937 () Bool)

(assert (=> b!878708 m!817937))

(declare-fun m!817939 () Bool)

(assert (=> b!878708 m!817939))

(assert (=> b!878708 m!817937))

(declare-fun m!817941 () Bool)

(assert (=> b!878708 m!817941))

(declare-fun m!817943 () Bool)

(assert (=> b!878708 m!817943))

(assert (=> b!878708 m!817941))

(declare-fun m!817945 () Bool)

(assert (=> b!878708 m!817945))

(declare-fun m!817947 () Bool)

(assert (=> b!878708 m!817947))

(declare-fun m!817949 () Bool)

(assert (=> b!878703 m!817949))

(declare-fun m!817951 () Bool)

(assert (=> b!878704 m!817951))

(declare-fun m!817953 () Bool)

(assert (=> b!878709 m!817953))

(declare-fun m!817955 () Bool)

(assert (=> mapNonEmpty!27897 m!817955))

(check-sat tp_is_empty!17521 (not b!878699) (not b!878701) b_and!25127 (not mapNonEmpty!27897) (not b!878703) (not start!74570) (not b!878706) (not b_next!15277) (not b!878708) (not b!878704))
(check-sat b_and!25127 (not b_next!15277))
