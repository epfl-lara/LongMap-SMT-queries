; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74816 () Bool)

(assert start!74816)

(declare-fun b_free!15393 () Bool)

(declare-fun b_next!15393 () Bool)

(assert (=> start!74816 (= b_free!15393 (not b_next!15393))))

(declare-fun tp!53875 () Bool)

(declare-fun b_and!25453 () Bool)

(assert (=> start!74816 (= tp!53875 b_and!25453)))

(declare-fun mapIsEmpty!28086 () Bool)

(declare-fun mapRes!28086 () Bool)

(assert (=> mapIsEmpty!28086 mapRes!28086))

(declare-fun b!882085 () Bool)

(declare-fun res!599276 () Bool)

(declare-fun e!490903 () Bool)

(assert (=> b!882085 (=> (not res!599276) (not e!490903))))

(declare-datatypes ((array!51402 0))(
  ( (array!51403 (arr!24722 (Array (_ BitVec 32) (_ BitVec 64))) (size!25162 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51402)

(declare-datatypes ((List!17550 0))(
  ( (Nil!17547) (Cons!17546 (h!18677 (_ BitVec 64)) (t!24745 List!17550)) )
))
(declare-fun arrayNoDuplicates!0 (array!51402 (_ BitVec 32) List!17550) Bool)

(assert (=> b!882085 (= res!599276 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17547))))

(declare-fun b!882086 () Bool)

(declare-fun res!599274 () Bool)

(assert (=> b!882086 (=> (not res!599274) (not e!490903))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!882086 (= res!599274 (and (= (select (arr!24722 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!882087 () Bool)

(declare-fun e!490905 () Bool)

(declare-fun tp_is_empty!17637 () Bool)

(assert (=> b!882087 (= e!490905 tp_is_empty!17637)))

(declare-fun b!882088 () Bool)

(declare-fun e!490901 () Bool)

(assert (=> b!882088 (= e!490901 (or (bvsge (size!25162 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25162 _keys!868)) (bvslt from!1053 (size!25162 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!51402 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!882088 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-datatypes ((Unit!30098 0))(
  ( (Unit!30099) )
))
(declare-fun lt!399050 () Unit!30098)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51402 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30098)

(assert (=> b!882088 (= lt!399050 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!882088 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17547)))

(declare-fun lt!399048 () Unit!30098)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51402 (_ BitVec 32) (_ BitVec 32)) Unit!30098)

(assert (=> b!882088 (= lt!399048 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!882089 () Bool)

(declare-fun res!599267 () Bool)

(assert (=> b!882089 (=> (not res!599267) (not e!490903))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51402 (_ BitVec 32)) Bool)

(assert (=> b!882089 (= res!599267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!28086 () Bool)

(declare-fun tp!53876 () Bool)

(declare-fun e!490900 () Bool)

(assert (=> mapNonEmpty!28086 (= mapRes!28086 (and tp!53876 e!490900))))

(declare-datatypes ((V!28563 0))(
  ( (V!28564 (val!8866 Int)) )
))
(declare-datatypes ((ValueCell!8379 0))(
  ( (ValueCellFull!8379 (v!11326 V!28563)) (EmptyCell!8379) )
))
(declare-fun mapRest!28086 () (Array (_ BitVec 32) ValueCell!8379))

(declare-fun mapKey!28086 () (_ BitVec 32))

(declare-fun mapValue!28086 () ValueCell!8379)

(declare-datatypes ((array!51404 0))(
  ( (array!51405 (arr!24723 (Array (_ BitVec 32) ValueCell!8379)) (size!25163 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51404)

(assert (=> mapNonEmpty!28086 (= (arr!24723 _values!688) (store mapRest!28086 mapKey!28086 mapValue!28086))))

(declare-fun b!882090 () Bool)

(declare-fun res!599271 () Bool)

(assert (=> b!882090 (=> (not res!599271) (not e!490903))))

(assert (=> b!882090 (= res!599271 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25162 _keys!868))))))

(declare-fun b!882091 () Bool)

(declare-fun e!490898 () Bool)

(assert (=> b!882091 (= e!490903 e!490898)))

(declare-fun res!599273 () Bool)

(assert (=> b!882091 (=> (not res!599273) (not e!490898))))

(assert (=> b!882091 (= res!599273 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!399054 () array!51404)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28563)

(declare-fun zeroValue!654 () V!28563)

(declare-datatypes ((tuple2!11740 0))(
  ( (tuple2!11741 (_1!5881 (_ BitVec 64)) (_2!5881 V!28563)) )
))
(declare-datatypes ((List!17551 0))(
  ( (Nil!17548) (Cons!17547 (h!18678 tuple2!11740) (t!24746 List!17551)) )
))
(declare-datatypes ((ListLongMap!10509 0))(
  ( (ListLongMap!10510 (toList!5270 List!17551)) )
))
(declare-fun lt!399055 () ListLongMap!10509)

(declare-fun getCurrentListMapNoExtraKeys!3232 (array!51402 array!51404 (_ BitVec 32) (_ BitVec 32) V!28563 V!28563 (_ BitVec 32) Int) ListLongMap!10509)

(assert (=> b!882091 (= lt!399055 (getCurrentListMapNoExtraKeys!3232 _keys!868 lt!399054 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28563)

(assert (=> b!882091 (= lt!399054 (array!51405 (store (arr!24723 _values!688) i!612 (ValueCellFull!8379 v!557)) (size!25163 _values!688)))))

(declare-fun lt!399053 () ListLongMap!10509)

(assert (=> b!882091 (= lt!399053 (getCurrentListMapNoExtraKeys!3232 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!882092 () Bool)

(declare-fun e!490902 () Bool)

(assert (=> b!882092 (= e!490902 e!490901)))

(declare-fun res!599275 () Bool)

(assert (=> b!882092 (=> res!599275 e!490901)))

(assert (=> b!882092 (= res!599275 (not (= (select (arr!24722 _keys!868) from!1053) k0!854)))))

(declare-fun lt!399049 () ListLongMap!10509)

(declare-fun +!2540 (ListLongMap!10509 tuple2!11740) ListLongMap!10509)

(declare-fun get!13013 (ValueCell!8379 V!28563) V!28563)

(declare-fun dynLambda!1254 (Int (_ BitVec 64)) V!28563)

(assert (=> b!882092 (= lt!399055 (+!2540 lt!399049 (tuple2!11741 (select (arr!24722 _keys!868) from!1053) (get!13013 (select (arr!24723 _values!688) from!1053) (dynLambda!1254 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882093 () Bool)

(assert (=> b!882093 (= e!490898 (not e!490902))))

(declare-fun res!599277 () Bool)

(assert (=> b!882093 (=> res!599277 e!490902)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!882093 (= res!599277 (not (validKeyInArray!0 (select (arr!24722 _keys!868) from!1053))))))

(declare-fun lt!399056 () ListLongMap!10509)

(assert (=> b!882093 (= lt!399056 lt!399049)))

(declare-fun lt!399051 () ListLongMap!10509)

(assert (=> b!882093 (= lt!399049 (+!2540 lt!399051 (tuple2!11741 k0!854 v!557)))))

(assert (=> b!882093 (= lt!399056 (getCurrentListMapNoExtraKeys!3232 _keys!868 lt!399054 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!882093 (= lt!399051 (getCurrentListMapNoExtraKeys!3232 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!399052 () Unit!30098)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!728 (array!51402 array!51404 (_ BitVec 32) (_ BitVec 32) V!28563 V!28563 (_ BitVec 32) (_ BitVec 64) V!28563 (_ BitVec 32) Int) Unit!30098)

(assert (=> b!882093 (= lt!399052 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!728 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!599270 () Bool)

(assert (=> start!74816 (=> (not res!599270) (not e!490903))))

(assert (=> start!74816 (= res!599270 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25162 _keys!868))))))

(assert (=> start!74816 e!490903))

(assert (=> start!74816 tp_is_empty!17637))

(assert (=> start!74816 true))

(assert (=> start!74816 tp!53875))

(declare-fun array_inv!19468 (array!51402) Bool)

(assert (=> start!74816 (array_inv!19468 _keys!868)))

(declare-fun e!490904 () Bool)

(declare-fun array_inv!19469 (array!51404) Bool)

(assert (=> start!74816 (and (array_inv!19469 _values!688) e!490904)))

(declare-fun b!882084 () Bool)

(assert (=> b!882084 (= e!490904 (and e!490905 mapRes!28086))))

(declare-fun condMapEmpty!28086 () Bool)

(declare-fun mapDefault!28086 () ValueCell!8379)

(assert (=> b!882084 (= condMapEmpty!28086 (= (arr!24723 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8379)) mapDefault!28086)))))

(declare-fun b!882094 () Bool)

(assert (=> b!882094 (= e!490900 tp_is_empty!17637)))

(declare-fun b!882095 () Bool)

(declare-fun res!599272 () Bool)

(assert (=> b!882095 (=> (not res!599272) (not e!490903))))

(assert (=> b!882095 (= res!599272 (and (= (size!25163 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25162 _keys!868) (size!25163 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!882096 () Bool)

(declare-fun res!599268 () Bool)

(assert (=> b!882096 (=> (not res!599268) (not e!490903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!882096 (= res!599268 (validMask!0 mask!1196))))

(declare-fun b!882097 () Bool)

(declare-fun res!599269 () Bool)

(assert (=> b!882097 (=> (not res!599269) (not e!490903))))

(assert (=> b!882097 (= res!599269 (validKeyInArray!0 k0!854))))

(assert (= (and start!74816 res!599270) b!882096))

(assert (= (and b!882096 res!599268) b!882095))

(assert (= (and b!882095 res!599272) b!882089))

(assert (= (and b!882089 res!599267) b!882085))

(assert (= (and b!882085 res!599276) b!882090))

(assert (= (and b!882090 res!599271) b!882097))

(assert (= (and b!882097 res!599269) b!882086))

(assert (= (and b!882086 res!599274) b!882091))

(assert (= (and b!882091 res!599273) b!882093))

(assert (= (and b!882093 (not res!599277)) b!882092))

(assert (= (and b!882092 (not res!599275)) b!882088))

(assert (= (and b!882084 condMapEmpty!28086) mapIsEmpty!28086))

(assert (= (and b!882084 (not condMapEmpty!28086)) mapNonEmpty!28086))

(get-info :version)

(assert (= (and mapNonEmpty!28086 ((_ is ValueCellFull!8379) mapValue!28086)) b!882094))

(assert (= (and b!882084 ((_ is ValueCellFull!8379) mapDefault!28086)) b!882087))

(assert (= start!74816 b!882084))

(declare-fun b_lambda!12603 () Bool)

(assert (=> (not b_lambda!12603) (not b!882092)))

(declare-fun t!24744 () Bool)

(declare-fun tb!5051 () Bool)

(assert (=> (and start!74816 (= defaultEntry!696 defaultEntry!696) t!24744) tb!5051))

(declare-fun result!9733 () Bool)

(assert (=> tb!5051 (= result!9733 tp_is_empty!17637)))

(assert (=> b!882092 t!24744))

(declare-fun b_and!25455 () Bool)

(assert (= b_and!25453 (and (=> t!24744 result!9733) b_and!25455)))

(declare-fun m!822015 () Bool)

(assert (=> b!882096 m!822015))

(declare-fun m!822017 () Bool)

(assert (=> b!882097 m!822017))

(declare-fun m!822019 () Bool)

(assert (=> b!882092 m!822019))

(declare-fun m!822021 () Bool)

(assert (=> b!882092 m!822021))

(declare-fun m!822023 () Bool)

(assert (=> b!882092 m!822023))

(declare-fun m!822025 () Bool)

(assert (=> b!882092 m!822025))

(assert (=> b!882092 m!822021))

(declare-fun m!822027 () Bool)

(assert (=> b!882092 m!822027))

(assert (=> b!882092 m!822023))

(declare-fun m!822029 () Bool)

(assert (=> b!882091 m!822029))

(declare-fun m!822031 () Bool)

(assert (=> b!882091 m!822031))

(declare-fun m!822033 () Bool)

(assert (=> b!882091 m!822033))

(declare-fun m!822035 () Bool)

(assert (=> b!882093 m!822035))

(assert (=> b!882093 m!822027))

(declare-fun m!822037 () Bool)

(assert (=> b!882093 m!822037))

(assert (=> b!882093 m!822027))

(declare-fun m!822039 () Bool)

(assert (=> b!882093 m!822039))

(declare-fun m!822041 () Bool)

(assert (=> b!882093 m!822041))

(declare-fun m!822043 () Bool)

(assert (=> b!882093 m!822043))

(declare-fun m!822045 () Bool)

(assert (=> start!74816 m!822045))

(declare-fun m!822047 () Bool)

(assert (=> start!74816 m!822047))

(declare-fun m!822049 () Bool)

(assert (=> b!882086 m!822049))

(declare-fun m!822051 () Bool)

(assert (=> b!882085 m!822051))

(declare-fun m!822053 () Bool)

(assert (=> mapNonEmpty!28086 m!822053))

(declare-fun m!822055 () Bool)

(assert (=> b!882088 m!822055))

(declare-fun m!822057 () Bool)

(assert (=> b!882088 m!822057))

(declare-fun m!822059 () Bool)

(assert (=> b!882088 m!822059))

(declare-fun m!822061 () Bool)

(assert (=> b!882088 m!822061))

(declare-fun m!822063 () Bool)

(assert (=> b!882089 m!822063))

(check-sat tp_is_empty!17637 (not b!882096) (not b!882093) (not start!74816) (not b!882092) (not b!882088) b_and!25455 (not b_lambda!12603) (not b!882097) (not b_next!15393) (not mapNonEmpty!28086) (not b!882085) (not b!882091) (not b!882089))
(check-sat b_and!25455 (not b_next!15393))
