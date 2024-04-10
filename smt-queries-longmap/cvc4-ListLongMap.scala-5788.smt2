; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74674 () Bool)

(assert start!74674)

(declare-fun b_free!15323 () Bool)

(declare-fun b_next!15323 () Bool)

(assert (=> start!74674 (= b_free!15323 (not b_next!15323))))

(declare-fun tp!53656 () Bool)

(declare-fun b_and!25265 () Bool)

(assert (=> start!74674 (= tp!53656 b_and!25265)))

(declare-fun b!880128 () Bool)

(declare-fun e!489793 () Bool)

(assert (=> b!880128 (= e!489793 true)))

(declare-datatypes ((V!28469 0))(
  ( (V!28470 (val!8831 Int)) )
))
(declare-datatypes ((tuple2!11686 0))(
  ( (tuple2!11687 (_1!5854 (_ BitVec 64)) (_2!5854 V!28469)) )
))
(declare-datatypes ((List!17499 0))(
  ( (Nil!17496) (Cons!17495 (h!18626 tuple2!11686) (t!24624 List!17499)) )
))
(declare-datatypes ((ListLongMap!10455 0))(
  ( (ListLongMap!10456 (toList!5243 List!17499)) )
))
(declare-fun lt!397959 () ListLongMap!10455)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((array!51264 0))(
  ( (array!51265 (arr!24656 (Array (_ BitVec 32) (_ BitVec 64))) (size!25096 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51264)

(declare-datatypes ((ValueCell!8344 0))(
  ( (ValueCellFull!8344 (v!11279 V!28469)) (EmptyCell!8344) )
))
(declare-datatypes ((array!51266 0))(
  ( (array!51267 (arr!24657 (Array (_ BitVec 32) ValueCell!8344)) (size!25097 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51266)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lt!397958 () ListLongMap!10455)

(declare-fun +!2515 (ListLongMap!10455 tuple2!11686) ListLongMap!10455)

(declare-fun get!12961 (ValueCell!8344 V!28469) V!28469)

(declare-fun dynLambda!1232 (Int (_ BitVec 64)) V!28469)

(assert (=> b!880128 (= lt!397958 (+!2515 lt!397959 (tuple2!11687 (select (arr!24656 _keys!868) from!1053) (get!12961 (select (arr!24657 _values!688) from!1053) (dynLambda!1232 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880129 () Bool)

(declare-fun res!597948 () Bool)

(declare-fun e!489792 () Bool)

(assert (=> b!880129 (=> (not res!597948) (not e!489792))))

(declare-datatypes ((List!17500 0))(
  ( (Nil!17497) (Cons!17496 (h!18627 (_ BitVec 64)) (t!24625 List!17500)) )
))
(declare-fun arrayNoDuplicates!0 (array!51264 (_ BitVec 32) List!17500) Bool)

(assert (=> b!880129 (= res!597948 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17497))))

(declare-fun b!880130 () Bool)

(declare-fun res!597946 () Bool)

(assert (=> b!880130 (=> (not res!597946) (not e!489792))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51264 (_ BitVec 32)) Bool)

(assert (=> b!880130 (= res!597946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27972 () Bool)

(declare-fun mapRes!27972 () Bool)

(assert (=> mapIsEmpty!27972 mapRes!27972))

(declare-fun b!880132 () Bool)

(declare-fun res!597951 () Bool)

(assert (=> b!880132 (=> (not res!597951) (not e!489792))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!880132 (= res!597951 (and (= (size!25097 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25096 _keys!868) (size!25097 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!880133 () Bool)

(declare-fun res!597949 () Bool)

(assert (=> b!880133 (=> (not res!597949) (not e!489792))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!880133 (= res!597949 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25096 _keys!868))))))

(declare-fun b!880134 () Bool)

(declare-fun e!489791 () Bool)

(assert (=> b!880134 (= e!489791 (not e!489793))))

(declare-fun res!597947 () Bool)

(assert (=> b!880134 (=> res!597947 e!489793)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880134 (= res!597947 (not (validKeyInArray!0 (select (arr!24656 _keys!868) from!1053))))))

(declare-fun lt!397960 () ListLongMap!10455)

(assert (=> b!880134 (= lt!397960 lt!397959)))

(declare-fun v!557 () V!28469)

(declare-fun lt!397955 () ListLongMap!10455)

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!880134 (= lt!397959 (+!2515 lt!397955 (tuple2!11687 k!854 v!557)))))

(declare-fun lt!397957 () array!51266)

(declare-fun minValue!654 () V!28469)

(declare-fun zeroValue!654 () V!28469)

(declare-fun getCurrentListMapNoExtraKeys!3207 (array!51264 array!51266 (_ BitVec 32) (_ BitVec 32) V!28469 V!28469 (_ BitVec 32) Int) ListLongMap!10455)

(assert (=> b!880134 (= lt!397960 (getCurrentListMapNoExtraKeys!3207 _keys!868 lt!397957 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!880134 (= lt!397955 (getCurrentListMapNoExtraKeys!3207 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30048 0))(
  ( (Unit!30049) )
))
(declare-fun lt!397961 () Unit!30048)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!706 (array!51264 array!51266 (_ BitVec 32) (_ BitVec 32) V!28469 V!28469 (_ BitVec 32) (_ BitVec 64) V!28469 (_ BitVec 32) Int) Unit!30048)

(assert (=> b!880134 (= lt!397961 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!706 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!880135 () Bool)

(assert (=> b!880135 (= e!489792 e!489791)))

(declare-fun res!597950 () Bool)

(assert (=> b!880135 (=> (not res!597950) (not e!489791))))

(assert (=> b!880135 (= res!597950 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!880135 (= lt!397958 (getCurrentListMapNoExtraKeys!3207 _keys!868 lt!397957 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!880135 (= lt!397957 (array!51267 (store (arr!24657 _values!688) i!612 (ValueCellFull!8344 v!557)) (size!25097 _values!688)))))

(declare-fun lt!397956 () ListLongMap!10455)

(assert (=> b!880135 (= lt!397956 (getCurrentListMapNoExtraKeys!3207 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!880136 () Bool)

(declare-fun res!597945 () Bool)

(assert (=> b!880136 (=> (not res!597945) (not e!489792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!880136 (= res!597945 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27972 () Bool)

(declare-fun tp!53657 () Bool)

(declare-fun e!489789 () Bool)

(assert (=> mapNonEmpty!27972 (= mapRes!27972 (and tp!53657 e!489789))))

(declare-fun mapRest!27972 () (Array (_ BitVec 32) ValueCell!8344))

(declare-fun mapKey!27972 () (_ BitVec 32))

(declare-fun mapValue!27972 () ValueCell!8344)

(assert (=> mapNonEmpty!27972 (= (arr!24657 _values!688) (store mapRest!27972 mapKey!27972 mapValue!27972))))

(declare-fun b!880137 () Bool)

(declare-fun res!597943 () Bool)

(assert (=> b!880137 (=> (not res!597943) (not e!489792))))

(assert (=> b!880137 (= res!597943 (validKeyInArray!0 k!854))))

(declare-fun b!880138 () Bool)

(declare-fun tp_is_empty!17567 () Bool)

(assert (=> b!880138 (= e!489789 tp_is_empty!17567)))

(declare-fun b!880131 () Bool)

(declare-fun e!489794 () Bool)

(declare-fun e!489790 () Bool)

(assert (=> b!880131 (= e!489794 (and e!489790 mapRes!27972))))

(declare-fun condMapEmpty!27972 () Bool)

(declare-fun mapDefault!27972 () ValueCell!8344)

