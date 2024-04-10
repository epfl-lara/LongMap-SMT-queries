; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74810 () Bool)

(assert start!74810)

(declare-fun b_free!15387 () Bool)

(declare-fun b_next!15387 () Bool)

(assert (=> start!74810 (= b_free!15387 (not b_next!15387))))

(declare-fun tp!53858 () Bool)

(declare-fun b_and!25441 () Bool)

(assert (=> start!74810 (= tp!53858 b_and!25441)))

(declare-fun mapNonEmpty!28077 () Bool)

(declare-fun mapRes!28077 () Bool)

(declare-fun tp!53857 () Bool)

(declare-fun e!490826 () Bool)

(assert (=> mapNonEmpty!28077 (= mapRes!28077 (and tp!53857 e!490826))))

(declare-datatypes ((V!28555 0))(
  ( (V!28556 (val!8863 Int)) )
))
(declare-datatypes ((ValueCell!8376 0))(
  ( (ValueCellFull!8376 (v!11323 V!28555)) (EmptyCell!8376) )
))
(declare-fun mapRest!28077 () (Array (_ BitVec 32) ValueCell!8376))

(declare-fun mapKey!28077 () (_ BitVec 32))

(declare-fun mapValue!28077 () ValueCell!8376)

(declare-datatypes ((array!51390 0))(
  ( (array!51391 (arr!24716 (Array (_ BitVec 32) ValueCell!8376)) (size!25156 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51390)

(assert (=> mapNonEmpty!28077 (= (arr!24716 _values!688) (store mapRest!28077 mapKey!28077 mapValue!28077))))

(declare-fun b!881952 () Bool)

(declare-fun e!490833 () Bool)

(declare-fun e!490831 () Bool)

(assert (=> b!881952 (= e!490833 (not e!490831))))

(declare-fun res!599174 () Bool)

(assert (=> b!881952 (=> res!599174 e!490831)))

(declare-datatypes ((array!51392 0))(
  ( (array!51393 (arr!24717 (Array (_ BitVec 32) (_ BitVec 64))) (size!25157 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51392)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!881952 (= res!599174 (not (validKeyInArray!0 (select (arr!24717 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11736 0))(
  ( (tuple2!11737 (_1!5879 (_ BitVec 64)) (_2!5879 V!28555)) )
))
(declare-datatypes ((List!17546 0))(
  ( (Nil!17543) (Cons!17542 (h!18673 tuple2!11736) (t!24735 List!17546)) )
))
(declare-datatypes ((ListLongMap!10505 0))(
  ( (ListLongMap!10506 (toList!5268 List!17546)) )
))
(declare-fun lt!398973 () ListLongMap!10505)

(declare-fun lt!398969 () ListLongMap!10505)

(assert (=> b!881952 (= lt!398973 lt!398969)))

(declare-fun v!557 () V!28555)

(declare-fun lt!398967 () ListLongMap!10505)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2539 (ListLongMap!10505 tuple2!11736) ListLongMap!10505)

(assert (=> b!881952 (= lt!398969 (+!2539 lt!398967 (tuple2!11737 k0!854 v!557)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!398968 () array!51390)

(declare-fun minValue!654 () V!28555)

(declare-fun zeroValue!654 () V!28555)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3230 (array!51392 array!51390 (_ BitVec 32) (_ BitVec 32) V!28555 V!28555 (_ BitVec 32) Int) ListLongMap!10505)

(assert (=> b!881952 (= lt!398973 (getCurrentListMapNoExtraKeys!3230 _keys!868 lt!398968 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!881952 (= lt!398967 (getCurrentListMapNoExtraKeys!3230 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30094 0))(
  ( (Unit!30095) )
))
(declare-fun lt!398971 () Unit!30094)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!727 (array!51392 array!51390 (_ BitVec 32) (_ BitVec 32) V!28555 V!28555 (_ BitVec 32) (_ BitVec 64) V!28555 (_ BitVec 32) Int) Unit!30094)

(assert (=> b!881952 (= lt!398971 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!727 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!881953 () Bool)

(declare-fun e!490828 () Bool)

(assert (=> b!881953 (= e!490828 e!490833)))

(declare-fun res!599170 () Bool)

(assert (=> b!881953 (=> (not res!599170) (not e!490833))))

(assert (=> b!881953 (= res!599170 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!398972 () ListLongMap!10505)

(assert (=> b!881953 (= lt!398972 (getCurrentListMapNoExtraKeys!3230 _keys!868 lt!398968 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!881953 (= lt!398968 (array!51391 (store (arr!24716 _values!688) i!612 (ValueCellFull!8376 v!557)) (size!25156 _values!688)))))

(declare-fun lt!398974 () ListLongMap!10505)

(assert (=> b!881953 (= lt!398974 (getCurrentListMapNoExtraKeys!3230 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!881954 () Bool)

(declare-fun e!490829 () Bool)

(assert (=> b!881954 (= e!490829 (or (bvsge (size!25157 _keys!868) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25157 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!51392 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!881954 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!398975 () Unit!30094)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51392 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30094)

(assert (=> b!881954 (= lt!398975 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-datatypes ((List!17547 0))(
  ( (Nil!17544) (Cons!17543 (h!18674 (_ BitVec 64)) (t!24736 List!17547)) )
))
(declare-fun arrayNoDuplicates!0 (array!51392 (_ BitVec 32) List!17547) Bool)

(assert (=> b!881954 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17544)))

(declare-fun lt!398970 () Unit!30094)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51392 (_ BitVec 32) (_ BitVec 32)) Unit!30094)

(assert (=> b!881954 (= lt!398970 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!881955 () Bool)

(declare-fun res!599175 () Bool)

(assert (=> b!881955 (=> (not res!599175) (not e!490828))))

(assert (=> b!881955 (= res!599175 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17544))))

(declare-fun b!881956 () Bool)

(assert (=> b!881956 (= e!490831 e!490829)))

(declare-fun res!599173 () Bool)

(assert (=> b!881956 (=> res!599173 e!490829)))

(assert (=> b!881956 (= res!599173 (not (= (select (arr!24717 _keys!868) from!1053) k0!854)))))

(declare-fun get!13010 (ValueCell!8376 V!28555) V!28555)

(declare-fun dynLambda!1253 (Int (_ BitVec 64)) V!28555)

(assert (=> b!881956 (= lt!398972 (+!2539 lt!398969 (tuple2!11737 (select (arr!24717 _keys!868) from!1053) (get!13010 (select (arr!24716 _values!688) from!1053) (dynLambda!1253 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881957 () Bool)

(declare-fun tp_is_empty!17631 () Bool)

(assert (=> b!881957 (= e!490826 tp_is_empty!17631)))

(declare-fun res!599177 () Bool)

(assert (=> start!74810 (=> (not res!599177) (not e!490828))))

(assert (=> start!74810 (= res!599177 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25157 _keys!868))))))

(assert (=> start!74810 e!490828))

(assert (=> start!74810 tp_is_empty!17631))

(assert (=> start!74810 true))

(assert (=> start!74810 tp!53858))

(declare-fun array_inv!19466 (array!51392) Bool)

(assert (=> start!74810 (array_inv!19466 _keys!868)))

(declare-fun e!490832 () Bool)

(declare-fun array_inv!19467 (array!51390) Bool)

(assert (=> start!74810 (and (array_inv!19467 _values!688) e!490832)))

(declare-fun b!881958 () Bool)

(declare-fun e!490830 () Bool)

(assert (=> b!881958 (= e!490832 (and e!490830 mapRes!28077))))

(declare-fun condMapEmpty!28077 () Bool)

(declare-fun mapDefault!28077 () ValueCell!8376)

(assert (=> b!881958 (= condMapEmpty!28077 (= (arr!24716 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8376)) mapDefault!28077)))))

(declare-fun b!881959 () Bool)

(declare-fun res!599168 () Bool)

(assert (=> b!881959 (=> (not res!599168) (not e!490828))))

(assert (=> b!881959 (= res!599168 (validKeyInArray!0 k0!854))))

(declare-fun b!881960 () Bool)

(declare-fun res!599176 () Bool)

(assert (=> b!881960 (=> (not res!599176) (not e!490828))))

(assert (=> b!881960 (= res!599176 (and (= (select (arr!24717 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!881961 () Bool)

(declare-fun res!599171 () Bool)

(assert (=> b!881961 (=> (not res!599171) (not e!490828))))

(assert (=> b!881961 (= res!599171 (and (= (size!25156 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25157 _keys!868) (size!25156 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!881962 () Bool)

(assert (=> b!881962 (= e!490830 tp_is_empty!17631)))

(declare-fun mapIsEmpty!28077 () Bool)

(assert (=> mapIsEmpty!28077 mapRes!28077))

(declare-fun b!881963 () Bool)

(declare-fun res!599169 () Bool)

(assert (=> b!881963 (=> (not res!599169) (not e!490828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51392 (_ BitVec 32)) Bool)

(assert (=> b!881963 (= res!599169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!881964 () Bool)

(declare-fun res!599178 () Bool)

(assert (=> b!881964 (=> (not res!599178) (not e!490828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!881964 (= res!599178 (validMask!0 mask!1196))))

(declare-fun b!881965 () Bool)

(declare-fun res!599172 () Bool)

(assert (=> b!881965 (=> (not res!599172) (not e!490828))))

(assert (=> b!881965 (= res!599172 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25157 _keys!868))))))

(assert (= (and start!74810 res!599177) b!881964))

(assert (= (and b!881964 res!599178) b!881961))

(assert (= (and b!881961 res!599171) b!881963))

(assert (= (and b!881963 res!599169) b!881955))

(assert (= (and b!881955 res!599175) b!881965))

(assert (= (and b!881965 res!599172) b!881959))

(assert (= (and b!881959 res!599168) b!881960))

(assert (= (and b!881960 res!599176) b!881953))

(assert (= (and b!881953 res!599170) b!881952))

(assert (= (and b!881952 (not res!599174)) b!881956))

(assert (= (and b!881956 (not res!599173)) b!881954))

(assert (= (and b!881958 condMapEmpty!28077) mapIsEmpty!28077))

(assert (= (and b!881958 (not condMapEmpty!28077)) mapNonEmpty!28077))

(get-info :version)

(assert (= (and mapNonEmpty!28077 ((_ is ValueCellFull!8376) mapValue!28077)) b!881957))

(assert (= (and b!881958 ((_ is ValueCellFull!8376) mapDefault!28077)) b!881962))

(assert (= start!74810 b!881958))

(declare-fun b_lambda!12597 () Bool)

(assert (=> (not b_lambda!12597) (not b!881956)))

(declare-fun t!24734 () Bool)

(declare-fun tb!5045 () Bool)

(assert (=> (and start!74810 (= defaultEntry!696 defaultEntry!696) t!24734) tb!5045))

(declare-fun result!9721 () Bool)

(assert (=> tb!5045 (= result!9721 tp_is_empty!17631)))

(assert (=> b!881956 t!24734))

(declare-fun b_and!25443 () Bool)

(assert (= b_and!25441 (and (=> t!24734 result!9721) b_and!25443)))

(declare-fun m!821865 () Bool)

(assert (=> b!881955 m!821865))

(declare-fun m!821867 () Bool)

(assert (=> b!881954 m!821867))

(declare-fun m!821869 () Bool)

(assert (=> b!881954 m!821869))

(declare-fun m!821871 () Bool)

(assert (=> b!881954 m!821871))

(declare-fun m!821873 () Bool)

(assert (=> b!881954 m!821873))

(declare-fun m!821875 () Bool)

(assert (=> start!74810 m!821875))

(declare-fun m!821877 () Bool)

(assert (=> start!74810 m!821877))

(declare-fun m!821879 () Bool)

(assert (=> b!881953 m!821879))

(declare-fun m!821881 () Bool)

(assert (=> b!881953 m!821881))

(declare-fun m!821883 () Bool)

(assert (=> b!881953 m!821883))

(declare-fun m!821885 () Bool)

(assert (=> b!881964 m!821885))

(declare-fun m!821887 () Bool)

(assert (=> b!881952 m!821887))

(declare-fun m!821889 () Bool)

(assert (=> b!881952 m!821889))

(declare-fun m!821891 () Bool)

(assert (=> b!881952 m!821891))

(declare-fun m!821893 () Bool)

(assert (=> b!881952 m!821893))

(declare-fun m!821895 () Bool)

(assert (=> b!881952 m!821895))

(assert (=> b!881952 m!821893))

(declare-fun m!821897 () Bool)

(assert (=> b!881952 m!821897))

(declare-fun m!821899 () Bool)

(assert (=> b!881959 m!821899))

(declare-fun m!821901 () Bool)

(assert (=> b!881960 m!821901))

(declare-fun m!821903 () Bool)

(assert (=> b!881963 m!821903))

(declare-fun m!821905 () Bool)

(assert (=> mapNonEmpty!28077 m!821905))

(declare-fun m!821907 () Bool)

(assert (=> b!881956 m!821907))

(declare-fun m!821909 () Bool)

(assert (=> b!881956 m!821909))

(declare-fun m!821911 () Bool)

(assert (=> b!881956 m!821911))

(declare-fun m!821913 () Bool)

(assert (=> b!881956 m!821913))

(assert (=> b!881956 m!821909))

(assert (=> b!881956 m!821893))

(assert (=> b!881956 m!821911))

(check-sat (not b!881956) (not mapNonEmpty!28077) (not b!881959) (not b_next!15387) (not b!881952) (not start!74810) (not b_lambda!12597) (not b!881955) (not b!881954) (not b!881963) (not b!881953) tp_is_empty!17631 b_and!25443 (not b!881964))
(check-sat b_and!25443 (not b_next!15387))
