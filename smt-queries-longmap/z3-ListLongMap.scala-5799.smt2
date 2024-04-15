; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74790 () Bool)

(assert start!74790)

(declare-fun b_free!15385 () Bool)

(declare-fun b_next!15385 () Bool)

(assert (=> start!74790 (= b_free!15385 (not b_next!15385))))

(declare-fun tp!53853 () Bool)

(declare-fun b_and!25411 () Bool)

(assert (=> start!74790 (= tp!53853 b_and!25411)))

(declare-fun b!881669 () Bool)

(declare-fun res!599032 () Bool)

(declare-fun e!490658 () Bool)

(assert (=> b!881669 (=> (not res!599032) (not e!490658))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!881669 (= res!599032 (validMask!0 mask!1196))))

(declare-fun b!881670 () Bool)

(declare-fun res!599025 () Bool)

(assert (=> b!881670 (=> (not res!599025) (not e!490658))))

(declare-datatypes ((array!51369 0))(
  ( (array!51370 (arr!24706 (Array (_ BitVec 32) (_ BitVec 64))) (size!25148 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51369)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51369 (_ BitVec 32)) Bool)

(assert (=> b!881670 (= res!599025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!881671 () Bool)

(declare-fun res!599033 () Bool)

(assert (=> b!881671 (=> (not res!599033) (not e!490658))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!28553 0))(
  ( (V!28554 (val!8862 Int)) )
))
(declare-datatypes ((ValueCell!8375 0))(
  ( (ValueCellFull!8375 (v!11316 V!28553)) (EmptyCell!8375) )
))
(declare-datatypes ((array!51371 0))(
  ( (array!51372 (arr!24707 (Array (_ BitVec 32) ValueCell!8375)) (size!25149 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51371)

(assert (=> b!881671 (= res!599033 (and (= (size!25149 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25148 _keys!868) (size!25149 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!881672 () Bool)

(declare-fun e!490656 () Bool)

(declare-fun tp_is_empty!17629 () Bool)

(assert (=> b!881672 (= e!490656 tp_is_empty!17629)))

(declare-fun res!599026 () Bool)

(assert (=> start!74790 (=> (not res!599026) (not e!490658))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74790 (= res!599026 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25148 _keys!868))))))

(assert (=> start!74790 e!490658))

(assert (=> start!74790 tp_is_empty!17629))

(assert (=> start!74790 true))

(assert (=> start!74790 tp!53853))

(declare-fun array_inv!19506 (array!51369) Bool)

(assert (=> start!74790 (array_inv!19506 _keys!868)))

(declare-fun e!490659 () Bool)

(declare-fun array_inv!19507 (array!51371) Bool)

(assert (=> start!74790 (and (array_inv!19507 _values!688) e!490659)))

(declare-fun b!881673 () Bool)

(declare-fun e!490654 () Bool)

(assert (=> b!881673 (= e!490658 e!490654)))

(declare-fun res!599027 () Bool)

(assert (=> b!881673 (=> (not res!599027) (not e!490654))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!881673 (= res!599027 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!398709 () array!51371)

(declare-datatypes ((tuple2!11756 0))(
  ( (tuple2!11757 (_1!5889 (_ BitVec 64)) (_2!5889 V!28553)) )
))
(declare-datatypes ((List!17550 0))(
  ( (Nil!17547) (Cons!17546 (h!18677 tuple2!11756) (t!24728 List!17550)) )
))
(declare-datatypes ((ListLongMap!10515 0))(
  ( (ListLongMap!10516 (toList!5273 List!17550)) )
))
(declare-fun lt!398706 () ListLongMap!10515)

(declare-fun minValue!654 () V!28553)

(declare-fun zeroValue!654 () V!28553)

(declare-fun getCurrentListMapNoExtraKeys!3264 (array!51369 array!51371 (_ BitVec 32) (_ BitVec 32) V!28553 V!28553 (_ BitVec 32) Int) ListLongMap!10515)

(assert (=> b!881673 (= lt!398706 (getCurrentListMapNoExtraKeys!3264 _keys!868 lt!398709 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28553)

(assert (=> b!881673 (= lt!398709 (array!51372 (store (arr!24707 _values!688) i!612 (ValueCellFull!8375 v!557)) (size!25149 _values!688)))))

(declare-fun lt!398710 () ListLongMap!10515)

(assert (=> b!881673 (= lt!398710 (getCurrentListMapNoExtraKeys!3264 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!881674 () Bool)

(declare-fun res!599035 () Bool)

(assert (=> b!881674 (=> (not res!599035) (not e!490658))))

(assert (=> b!881674 (= res!599035 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25148 _keys!868))))))

(declare-fun b!881675 () Bool)

(declare-fun res!599029 () Bool)

(assert (=> b!881675 (=> (not res!599029) (not e!490658))))

(declare-datatypes ((List!17551 0))(
  ( (Nil!17548) (Cons!17547 (h!18678 (_ BitVec 64)) (t!24729 List!17551)) )
))
(declare-fun arrayNoDuplicates!0 (array!51369 (_ BitVec 32) List!17551) Bool)

(assert (=> b!881675 (= res!599029 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17548))))

(declare-fun mapNonEmpty!28074 () Bool)

(declare-fun mapRes!28074 () Bool)

(declare-fun tp!53852 () Bool)

(assert (=> mapNonEmpty!28074 (= mapRes!28074 (and tp!53852 e!490656))))

(declare-fun mapKey!28074 () (_ BitVec 32))

(declare-fun mapValue!28074 () ValueCell!8375)

(declare-fun mapRest!28074 () (Array (_ BitVec 32) ValueCell!8375))

(assert (=> mapNonEmpty!28074 (= (arr!24707 _values!688) (store mapRest!28074 mapKey!28074 mapValue!28074))))

(declare-fun b!881676 () Bool)

(declare-fun e!490661 () Bool)

(assert (=> b!881676 (= e!490654 (not e!490661))))

(declare-fun res!599031 () Bool)

(assert (=> b!881676 (=> res!599031 e!490661)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!881676 (= res!599031 (not (validKeyInArray!0 (select (arr!24706 _keys!868) from!1053))))))

(declare-fun lt!398704 () ListLongMap!10515)

(declare-fun lt!398707 () ListLongMap!10515)

(assert (=> b!881676 (= lt!398704 lt!398707)))

(declare-fun lt!398705 () ListLongMap!10515)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2566 (ListLongMap!10515 tuple2!11756) ListLongMap!10515)

(assert (=> b!881676 (= lt!398707 (+!2566 lt!398705 (tuple2!11757 k0!854 v!557)))))

(assert (=> b!881676 (= lt!398704 (getCurrentListMapNoExtraKeys!3264 _keys!868 lt!398709 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!881676 (= lt!398705 (getCurrentListMapNoExtraKeys!3264 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30043 0))(
  ( (Unit!30044) )
))
(declare-fun lt!398708 () Unit!30043)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!731 (array!51369 array!51371 (_ BitVec 32) (_ BitVec 32) V!28553 V!28553 (_ BitVec 32) (_ BitVec 64) V!28553 (_ BitVec 32) Int) Unit!30043)

(assert (=> b!881676 (= lt!398708 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!731 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!881677 () Bool)

(declare-fun res!599030 () Bool)

(assert (=> b!881677 (=> (not res!599030) (not e!490658))))

(assert (=> b!881677 (= res!599030 (and (= (select (arr!24706 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!28074 () Bool)

(assert (=> mapIsEmpty!28074 mapRes!28074))

(declare-fun b!881678 () Bool)

(declare-fun e!490660 () Bool)

(assert (=> b!881678 (= e!490660 (or (bvsge (size!25148 _keys!868) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25148 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!51369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!881678 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!398711 () Unit!30043)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51369 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30043)

(assert (=> b!881678 (= lt!398711 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!881678 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17548)))

(declare-fun lt!398712 () Unit!30043)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51369 (_ BitVec 32) (_ BitVec 32)) Unit!30043)

(assert (=> b!881678 (= lt!398712 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!881679 () Bool)

(declare-fun e!490655 () Bool)

(assert (=> b!881679 (= e!490655 tp_is_empty!17629)))

(declare-fun b!881680 () Bool)

(assert (=> b!881680 (= e!490661 e!490660)))

(declare-fun res!599034 () Bool)

(assert (=> b!881680 (=> res!599034 e!490660)))

(assert (=> b!881680 (= res!599034 (not (= (select (arr!24706 _keys!868) from!1053) k0!854)))))

(declare-fun get!13014 (ValueCell!8375 V!28553) V!28553)

(declare-fun dynLambda!1254 (Int (_ BitVec 64)) V!28553)

(assert (=> b!881680 (= lt!398706 (+!2566 lt!398707 (tuple2!11757 (select (arr!24706 _keys!868) from!1053) (get!13014 (select (arr!24707 _values!688) from!1053) (dynLambda!1254 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881681 () Bool)

(assert (=> b!881681 (= e!490659 (and e!490655 mapRes!28074))))

(declare-fun condMapEmpty!28074 () Bool)

(declare-fun mapDefault!28074 () ValueCell!8375)

(assert (=> b!881681 (= condMapEmpty!28074 (= (arr!24707 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8375)) mapDefault!28074)))))

(declare-fun b!881682 () Bool)

(declare-fun res!599028 () Bool)

(assert (=> b!881682 (=> (not res!599028) (not e!490658))))

(assert (=> b!881682 (= res!599028 (validKeyInArray!0 k0!854))))

(assert (= (and start!74790 res!599026) b!881669))

(assert (= (and b!881669 res!599032) b!881671))

(assert (= (and b!881671 res!599033) b!881670))

(assert (= (and b!881670 res!599025) b!881675))

(assert (= (and b!881675 res!599029) b!881674))

(assert (= (and b!881674 res!599035) b!881682))

(assert (= (and b!881682 res!599028) b!881677))

(assert (= (and b!881677 res!599030) b!881673))

(assert (= (and b!881673 res!599027) b!881676))

(assert (= (and b!881676 (not res!599031)) b!881680))

(assert (= (and b!881680 (not res!599034)) b!881678))

(assert (= (and b!881681 condMapEmpty!28074) mapIsEmpty!28074))

(assert (= (and b!881681 (not condMapEmpty!28074)) mapNonEmpty!28074))

(get-info :version)

(assert (= (and mapNonEmpty!28074 ((_ is ValueCellFull!8375) mapValue!28074)) b!881672))

(assert (= (and b!881681 ((_ is ValueCellFull!8375) mapDefault!28074)) b!881679))

(assert (= start!74790 b!881681))

(declare-fun b_lambda!12577 () Bool)

(assert (=> (not b_lambda!12577) (not b!881680)))

(declare-fun t!24727 () Bool)

(declare-fun tb!5035 () Bool)

(assert (=> (and start!74790 (= defaultEntry!696 defaultEntry!696) t!24727) tb!5035))

(declare-fun result!9709 () Bool)

(assert (=> tb!5035 (= result!9709 tp_is_empty!17629)))

(assert (=> b!881680 t!24727))

(declare-fun b_and!25413 () Bool)

(assert (= b_and!25411 (and (=> t!24727 result!9709) b_and!25413)))

(declare-fun m!821057 () Bool)

(assert (=> b!881670 m!821057))

(declare-fun m!821059 () Bool)

(assert (=> b!881682 m!821059))

(declare-fun m!821061 () Bool)

(assert (=> b!881680 m!821061))

(declare-fun m!821063 () Bool)

(assert (=> b!881680 m!821063))

(declare-fun m!821065 () Bool)

(assert (=> b!881680 m!821065))

(declare-fun m!821067 () Bool)

(assert (=> b!881680 m!821067))

(assert (=> b!881680 m!821063))

(declare-fun m!821069 () Bool)

(assert (=> b!881680 m!821069))

(assert (=> b!881680 m!821065))

(declare-fun m!821071 () Bool)

(assert (=> start!74790 m!821071))

(declare-fun m!821073 () Bool)

(assert (=> start!74790 m!821073))

(declare-fun m!821075 () Bool)

(assert (=> b!881673 m!821075))

(declare-fun m!821077 () Bool)

(assert (=> b!881673 m!821077))

(declare-fun m!821079 () Bool)

(assert (=> b!881673 m!821079))

(declare-fun m!821081 () Bool)

(assert (=> b!881678 m!821081))

(declare-fun m!821083 () Bool)

(assert (=> b!881678 m!821083))

(declare-fun m!821085 () Bool)

(assert (=> b!881678 m!821085))

(declare-fun m!821087 () Bool)

(assert (=> b!881678 m!821087))

(declare-fun m!821089 () Bool)

(assert (=> b!881676 m!821089))

(assert (=> b!881676 m!821069))

(declare-fun m!821091 () Bool)

(assert (=> b!881676 m!821091))

(assert (=> b!881676 m!821069))

(declare-fun m!821093 () Bool)

(assert (=> b!881676 m!821093))

(declare-fun m!821095 () Bool)

(assert (=> b!881676 m!821095))

(declare-fun m!821097 () Bool)

(assert (=> b!881676 m!821097))

(declare-fun m!821099 () Bool)

(assert (=> mapNonEmpty!28074 m!821099))

(declare-fun m!821101 () Bool)

(assert (=> b!881677 m!821101))

(declare-fun m!821103 () Bool)

(assert (=> b!881675 m!821103))

(declare-fun m!821105 () Bool)

(assert (=> b!881669 m!821105))

(check-sat (not b!881676) (not b_next!15385) (not start!74790) (not b!881680) (not b!881682) (not b!881673) tp_is_empty!17629 (not b!881669) b_and!25413 (not b!881678) (not b_lambda!12577) (not b!881675) (not b!881670) (not mapNonEmpty!28074))
(check-sat b_and!25413 (not b_next!15385))
