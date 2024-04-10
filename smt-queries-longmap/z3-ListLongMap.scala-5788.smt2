; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74672 () Bool)

(assert start!74672)

(declare-fun b_free!15321 () Bool)

(declare-fun b_next!15321 () Bool)

(assert (=> start!74672 (= b_free!15321 (not b_next!15321))))

(declare-fun tp!53651 () Bool)

(declare-fun b_and!25261 () Bool)

(assert (=> start!74672 (= tp!53651 b_and!25261)))

(declare-fun b!880087 () Bool)

(declare-fun res!597919 () Bool)

(declare-fun e!489772 () Bool)

(assert (=> b!880087 (=> (not res!597919) (not e!489772))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51260 0))(
  ( (array!51261 (arr!24654 (Array (_ BitVec 32) (_ BitVec 64))) (size!25094 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51260)

(declare-datatypes ((V!28467 0))(
  ( (V!28468 (val!8830 Int)) )
))
(declare-datatypes ((ValueCell!8343 0))(
  ( (ValueCellFull!8343 (v!11278 V!28467)) (EmptyCell!8343) )
))
(declare-datatypes ((array!51262 0))(
  ( (array!51263 (arr!24655 (Array (_ BitVec 32) ValueCell!8343)) (size!25095 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51262)

(assert (=> b!880087 (= res!597919 (and (= (size!25095 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25094 _keys!868) (size!25095 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!880088 () Bool)

(declare-fun e!489774 () Bool)

(assert (=> b!880088 (= e!489772 e!489774)))

(declare-fun res!597914 () Bool)

(assert (=> b!880088 (=> (not res!597914) (not e!489774))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!880088 (= res!597914 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!11684 0))(
  ( (tuple2!11685 (_1!5853 (_ BitVec 64)) (_2!5853 V!28467)) )
))
(declare-datatypes ((List!17497 0))(
  ( (Nil!17494) (Cons!17493 (h!18624 tuple2!11684) (t!24620 List!17497)) )
))
(declare-datatypes ((ListLongMap!10453 0))(
  ( (ListLongMap!10454 (toList!5242 List!17497)) )
))
(declare-fun lt!397937 () ListLongMap!10453)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28467)

(declare-fun zeroValue!654 () V!28467)

(declare-fun lt!397939 () array!51262)

(declare-fun getCurrentListMapNoExtraKeys!3206 (array!51260 array!51262 (_ BitVec 32) (_ BitVec 32) V!28467 V!28467 (_ BitVec 32) Int) ListLongMap!10453)

(assert (=> b!880088 (= lt!397937 (getCurrentListMapNoExtraKeys!3206 _keys!868 lt!397939 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28467)

(assert (=> b!880088 (= lt!397939 (array!51263 (store (arr!24655 _values!688) i!612 (ValueCellFull!8343 v!557)) (size!25095 _values!688)))))

(declare-fun lt!397934 () ListLongMap!10453)

(assert (=> b!880088 (= lt!397934 (getCurrentListMapNoExtraKeys!3206 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!880089 () Bool)

(declare-fun res!597920 () Bool)

(assert (=> b!880089 (=> (not res!597920) (not e!489772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51260 (_ BitVec 32)) Bool)

(assert (=> b!880089 (= res!597920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!880090 () Bool)

(declare-fun e!489768 () Bool)

(declare-fun tp_is_empty!17565 () Bool)

(assert (=> b!880090 (= e!489768 tp_is_empty!17565)))

(declare-fun res!597917 () Bool)

(assert (=> start!74672 (=> (not res!597917) (not e!489772))))

(assert (=> start!74672 (= res!597917 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25094 _keys!868))))))

(assert (=> start!74672 e!489772))

(assert (=> start!74672 tp_is_empty!17565))

(assert (=> start!74672 true))

(assert (=> start!74672 tp!53651))

(declare-fun array_inv!19420 (array!51260) Bool)

(assert (=> start!74672 (array_inv!19420 _keys!868)))

(declare-fun e!489773 () Bool)

(declare-fun array_inv!19421 (array!51262) Bool)

(assert (=> start!74672 (and (array_inv!19421 _values!688) e!489773)))

(declare-fun b!880091 () Bool)

(declare-fun res!597921 () Bool)

(assert (=> b!880091 (=> (not res!597921) (not e!489772))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880091 (= res!597921 (validKeyInArray!0 k0!854))))

(declare-fun b!880092 () Bool)

(declare-fun res!597918 () Bool)

(assert (=> b!880092 (=> (not res!597918) (not e!489772))))

(declare-datatypes ((List!17498 0))(
  ( (Nil!17495) (Cons!17494 (h!18625 (_ BitVec 64)) (t!24621 List!17498)) )
))
(declare-fun arrayNoDuplicates!0 (array!51260 (_ BitVec 32) List!17498) Bool)

(assert (=> b!880092 (= res!597918 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17495))))

(declare-fun b!880093 () Bool)

(declare-fun res!597912 () Bool)

(assert (=> b!880093 (=> (not res!597912) (not e!489772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!880093 (= res!597912 (validMask!0 mask!1196))))

(declare-fun b!880094 () Bool)

(declare-fun e!489769 () Bool)

(assert (=> b!880094 (= e!489769 true)))

(declare-fun lt!397935 () ListLongMap!10453)

(declare-fun +!2514 (ListLongMap!10453 tuple2!11684) ListLongMap!10453)

(declare-fun get!12960 (ValueCell!8343 V!28467) V!28467)

(declare-fun dynLambda!1231 (Int (_ BitVec 64)) V!28467)

(assert (=> b!880094 (= lt!397937 (+!2514 lt!397935 (tuple2!11685 (select (arr!24654 _keys!868) from!1053) (get!12960 (select (arr!24655 _values!688) from!1053) (dynLambda!1231 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!27969 () Bool)

(declare-fun mapRes!27969 () Bool)

(assert (=> mapIsEmpty!27969 mapRes!27969))

(declare-fun b!880095 () Bool)

(declare-fun e!489771 () Bool)

(assert (=> b!880095 (= e!489773 (and e!489771 mapRes!27969))))

(declare-fun condMapEmpty!27969 () Bool)

(declare-fun mapDefault!27969 () ValueCell!8343)

(assert (=> b!880095 (= condMapEmpty!27969 (= (arr!24655 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8343)) mapDefault!27969)))))

(declare-fun mapNonEmpty!27969 () Bool)

(declare-fun tp!53650 () Bool)

(assert (=> mapNonEmpty!27969 (= mapRes!27969 (and tp!53650 e!489768))))

(declare-fun mapKey!27969 () (_ BitVec 32))

(declare-fun mapRest!27969 () (Array (_ BitVec 32) ValueCell!8343))

(declare-fun mapValue!27969 () ValueCell!8343)

(assert (=> mapNonEmpty!27969 (= (arr!24655 _values!688) (store mapRest!27969 mapKey!27969 mapValue!27969))))

(declare-fun b!880096 () Bool)

(declare-fun res!597915 () Bool)

(assert (=> b!880096 (=> (not res!597915) (not e!489772))))

(assert (=> b!880096 (= res!597915 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25094 _keys!868))))))

(declare-fun b!880097 () Bool)

(assert (=> b!880097 (= e!489774 (not e!489769))))

(declare-fun res!597916 () Bool)

(assert (=> b!880097 (=> res!597916 e!489769)))

(assert (=> b!880097 (= res!597916 (not (validKeyInArray!0 (select (arr!24654 _keys!868) from!1053))))))

(declare-fun lt!397936 () ListLongMap!10453)

(assert (=> b!880097 (= lt!397936 lt!397935)))

(declare-fun lt!397938 () ListLongMap!10453)

(assert (=> b!880097 (= lt!397935 (+!2514 lt!397938 (tuple2!11685 k0!854 v!557)))))

(assert (=> b!880097 (= lt!397936 (getCurrentListMapNoExtraKeys!3206 _keys!868 lt!397939 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!880097 (= lt!397938 (getCurrentListMapNoExtraKeys!3206 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30046 0))(
  ( (Unit!30047) )
))
(declare-fun lt!397940 () Unit!30046)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!705 (array!51260 array!51262 (_ BitVec 32) (_ BitVec 32) V!28467 V!28467 (_ BitVec 32) (_ BitVec 64) V!28467 (_ BitVec 32) Int) Unit!30046)

(assert (=> b!880097 (= lt!397940 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!705 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!880098 () Bool)

(assert (=> b!880098 (= e!489771 tp_is_empty!17565)))

(declare-fun b!880099 () Bool)

(declare-fun res!597913 () Bool)

(assert (=> b!880099 (=> (not res!597913) (not e!489772))))

(assert (=> b!880099 (= res!597913 (and (= (select (arr!24654 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!74672 res!597917) b!880093))

(assert (= (and b!880093 res!597912) b!880087))

(assert (= (and b!880087 res!597919) b!880089))

(assert (= (and b!880089 res!597920) b!880092))

(assert (= (and b!880092 res!597918) b!880096))

(assert (= (and b!880096 res!597915) b!880091))

(assert (= (and b!880091 res!597921) b!880099))

(assert (= (and b!880099 res!597913) b!880088))

(assert (= (and b!880088 res!597914) b!880097))

(assert (= (and b!880097 (not res!597916)) b!880094))

(assert (= (and b!880095 condMapEmpty!27969) mapIsEmpty!27969))

(assert (= (and b!880095 (not condMapEmpty!27969)) mapNonEmpty!27969))

(get-info :version)

(assert (= (and mapNonEmpty!27969 ((_ is ValueCellFull!8343) mapValue!27969)) b!880090))

(assert (= (and b!880095 ((_ is ValueCellFull!8343) mapDefault!27969)) b!880098))

(assert (= start!74672 b!880095))

(declare-fun b_lambda!12429 () Bool)

(assert (=> (not b_lambda!12429) (not b!880094)))

(declare-fun t!24619 () Bool)

(declare-fun tb!4979 () Bool)

(assert (=> (and start!74672 (= defaultEntry!696 defaultEntry!696) t!24619) tb!4979))

(declare-fun result!9583 () Bool)

(assert (=> tb!4979 (= result!9583 tp_is_empty!17565)))

(assert (=> b!880094 t!24619))

(declare-fun b_and!25263 () Bool)

(assert (= b_and!25261 (and (=> t!24619 result!9583) b_and!25263)))

(declare-fun m!819853 () Bool)

(assert (=> mapNonEmpty!27969 m!819853))

(declare-fun m!819855 () Bool)

(assert (=> b!880097 m!819855))

(declare-fun m!819857 () Bool)

(assert (=> b!880097 m!819857))

(assert (=> b!880097 m!819855))

(declare-fun m!819859 () Bool)

(assert (=> b!880097 m!819859))

(declare-fun m!819861 () Bool)

(assert (=> b!880097 m!819861))

(declare-fun m!819863 () Bool)

(assert (=> b!880097 m!819863))

(declare-fun m!819865 () Bool)

(assert (=> b!880097 m!819865))

(declare-fun m!819867 () Bool)

(assert (=> b!880089 m!819867))

(declare-fun m!819869 () Bool)

(assert (=> b!880093 m!819869))

(declare-fun m!819871 () Bool)

(assert (=> b!880094 m!819871))

(declare-fun m!819873 () Bool)

(assert (=> b!880094 m!819873))

(declare-fun m!819875 () Bool)

(assert (=> b!880094 m!819875))

(declare-fun m!819877 () Bool)

(assert (=> b!880094 m!819877))

(assert (=> b!880094 m!819873))

(assert (=> b!880094 m!819855))

(assert (=> b!880094 m!819875))

(declare-fun m!819879 () Bool)

(assert (=> b!880088 m!819879))

(declare-fun m!819881 () Bool)

(assert (=> b!880088 m!819881))

(declare-fun m!819883 () Bool)

(assert (=> b!880088 m!819883))

(declare-fun m!819885 () Bool)

(assert (=> b!880092 m!819885))

(declare-fun m!819887 () Bool)

(assert (=> start!74672 m!819887))

(declare-fun m!819889 () Bool)

(assert (=> start!74672 m!819889))

(declare-fun m!819891 () Bool)

(assert (=> b!880091 m!819891))

(declare-fun m!819893 () Bool)

(assert (=> b!880099 m!819893))

(check-sat (not b!880094) (not b!880088) (not b!880091) (not b!880097) (not b!880092) (not mapNonEmpty!27969) (not b!880089) (not b_next!15321) (not start!74672) b_and!25263 (not b!880093) tp_is_empty!17565 (not b_lambda!12429))
(check-sat b_and!25263 (not b_next!15321))
