; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73456 () Bool)

(assert start!73456)

(declare-fun b_free!14389 () Bool)

(declare-fun b_next!14389 () Bool)

(assert (=> start!73456 (= b_free!14389 (not b_next!14389))))

(declare-fun tp!50672 () Bool)

(declare-fun b_and!23731 () Bool)

(assert (=> start!73456 (= tp!50672 b_and!23731)))

(declare-fun mapNonEmpty!26387 () Bool)

(declare-fun mapRes!26387 () Bool)

(declare-fun tp!50671 () Bool)

(declare-fun e!478122 () Bool)

(assert (=> mapNonEmpty!26387 (= mapRes!26387 (and tp!50671 e!478122))))

(declare-datatypes ((V!27081 0))(
  ( (V!27082 (val!8310 Int)) )
))
(declare-datatypes ((ValueCell!7823 0))(
  ( (ValueCellFull!7823 (v!10729 V!27081)) (EmptyCell!7823) )
))
(declare-fun mapValue!26387 () ValueCell!7823)

(declare-fun mapRest!26387 () (Array (_ BitVec 32) ValueCell!7823))

(declare-datatypes ((array!49219 0))(
  ( (array!49220 (arr!23641 (Array (_ BitVec 32) ValueCell!7823)) (size!24083 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49219)

(declare-fun mapKey!26387 () (_ BitVec 32))

(assert (=> mapNonEmpty!26387 (= (arr!23641 _values!688) (store mapRest!26387 mapKey!26387 mapValue!26387))))

(declare-fun b!857928 () Bool)

(declare-fun res!582882 () Bool)

(declare-fun e!478123 () Bool)

(assert (=> b!857928 (=> (not res!582882) (not e!478123))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857928 (= res!582882 (validMask!0 mask!1196))))

(declare-fun b!857929 () Bool)

(declare-fun res!582880 () Bool)

(assert (=> b!857929 (=> (not res!582880) (not e!478123))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!49221 0))(
  ( (array!49222 (arr!23642 (Array (_ BitVec 32) (_ BitVec 64))) (size!24084 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49221)

(assert (=> b!857929 (= res!582880 (and (= (size!24083 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24084 _keys!868) (size!24083 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857930 () Bool)

(declare-fun e!478125 () Bool)

(assert (=> b!857930 (= e!478123 e!478125)))

(declare-fun res!582883 () Bool)

(assert (=> b!857930 (=> (not res!582883) (not e!478125))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!857930 (= res!582883 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386342 () array!49219)

(declare-datatypes ((tuple2!10974 0))(
  ( (tuple2!10975 (_1!5498 (_ BitVec 64)) (_2!5498 V!27081)) )
))
(declare-datatypes ((List!16776 0))(
  ( (Nil!16773) (Cons!16772 (h!17903 tuple2!10974) (t!23422 List!16776)) )
))
(declare-datatypes ((ListLongMap!9733 0))(
  ( (ListLongMap!9734 (toList!4882 List!16776)) )
))
(declare-fun lt!386348 () ListLongMap!9733)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27081)

(declare-fun zeroValue!654 () V!27081)

(declare-fun getCurrentListMapNoExtraKeys!2889 (array!49221 array!49219 (_ BitVec 32) (_ BitVec 32) V!27081 V!27081 (_ BitVec 32) Int) ListLongMap!9733)

(assert (=> b!857930 (= lt!386348 (getCurrentListMapNoExtraKeys!2889 _keys!868 lt!386342 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27081)

(assert (=> b!857930 (= lt!386342 (array!49220 (store (arr!23641 _values!688) i!612 (ValueCellFull!7823 v!557)) (size!24083 _values!688)))))

(declare-fun lt!386345 () ListLongMap!9733)

(assert (=> b!857930 (= lt!386345 (getCurrentListMapNoExtraKeys!2889 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857931 () Bool)

(declare-fun res!582886 () Bool)

(assert (=> b!857931 (=> (not res!582886) (not e!478123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49221 (_ BitVec 32)) Bool)

(assert (=> b!857931 (= res!582886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857932 () Bool)

(declare-fun e!478128 () Bool)

(assert (=> b!857932 (= e!478128 true)))

(declare-fun lt!386344 () ListLongMap!9733)

(declare-fun +!2256 (ListLongMap!9733 tuple2!10974) ListLongMap!9733)

(declare-fun get!12454 (ValueCell!7823 V!27081) V!27081)

(declare-fun dynLambda!1077 (Int (_ BitVec 64)) V!27081)

(assert (=> b!857932 (= lt!386348 (+!2256 lt!386344 (tuple2!10975 (select (arr!23642 _keys!868) from!1053) (get!12454 (select (arr!23641 _values!688) from!1053) (dynLambda!1077 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!857933 () Bool)

(declare-fun tp_is_empty!16525 () Bool)

(assert (=> b!857933 (= e!478122 tp_is_empty!16525)))

(declare-fun b!857934 () Bool)

(assert (=> b!857934 (= e!478125 (not e!478128))))

(declare-fun res!582881 () Bool)

(assert (=> b!857934 (=> res!582881 e!478128)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857934 (= res!582881 (not (validKeyInArray!0 (select (arr!23642 _keys!868) from!1053))))))

(declare-fun lt!386346 () ListLongMap!9733)

(assert (=> b!857934 (= lt!386346 lt!386344)))

(declare-fun lt!386343 () ListLongMap!9733)

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!857934 (= lt!386344 (+!2256 lt!386343 (tuple2!10975 k0!854 v!557)))))

(assert (=> b!857934 (= lt!386346 (getCurrentListMapNoExtraKeys!2889 _keys!868 lt!386342 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!857934 (= lt!386343 (getCurrentListMapNoExtraKeys!2889 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29181 0))(
  ( (Unit!29182) )
))
(declare-fun lt!386347 () Unit!29181)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!453 (array!49221 array!49219 (_ BitVec 32) (_ BitVec 32) V!27081 V!27081 (_ BitVec 32) (_ BitVec 64) V!27081 (_ BitVec 32) Int) Unit!29181)

(assert (=> b!857934 (= lt!386347 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!453 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!582885 () Bool)

(assert (=> start!73456 (=> (not res!582885) (not e!478123))))

(assert (=> start!73456 (= res!582885 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24084 _keys!868))))))

(assert (=> start!73456 e!478123))

(assert (=> start!73456 tp_is_empty!16525))

(assert (=> start!73456 true))

(assert (=> start!73456 tp!50672))

(declare-fun array_inv!18784 (array!49221) Bool)

(assert (=> start!73456 (array_inv!18784 _keys!868)))

(declare-fun e!478124 () Bool)

(declare-fun array_inv!18785 (array!49219) Bool)

(assert (=> start!73456 (and (array_inv!18785 _values!688) e!478124)))

(declare-fun b!857935 () Bool)

(declare-fun e!478127 () Bool)

(assert (=> b!857935 (= e!478127 tp_is_empty!16525)))

(declare-fun b!857936 () Bool)

(assert (=> b!857936 (= e!478124 (and e!478127 mapRes!26387))))

(declare-fun condMapEmpty!26387 () Bool)

(declare-fun mapDefault!26387 () ValueCell!7823)

(assert (=> b!857936 (= condMapEmpty!26387 (= (arr!23641 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7823)) mapDefault!26387)))))

(declare-fun b!857937 () Bool)

(declare-fun res!582884 () Bool)

(assert (=> b!857937 (=> (not res!582884) (not e!478123))))

(assert (=> b!857937 (= res!582884 (validKeyInArray!0 k0!854))))

(declare-fun b!857938 () Bool)

(declare-fun res!582888 () Bool)

(assert (=> b!857938 (=> (not res!582888) (not e!478123))))

(assert (=> b!857938 (= res!582888 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24084 _keys!868))))))

(declare-fun mapIsEmpty!26387 () Bool)

(assert (=> mapIsEmpty!26387 mapRes!26387))

(declare-fun b!857939 () Bool)

(declare-fun res!582887 () Bool)

(assert (=> b!857939 (=> (not res!582887) (not e!478123))))

(assert (=> b!857939 (= res!582887 (and (= (select (arr!23642 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857940 () Bool)

(declare-fun res!582879 () Bool)

(assert (=> b!857940 (=> (not res!582879) (not e!478123))))

(declare-datatypes ((List!16777 0))(
  ( (Nil!16774) (Cons!16773 (h!17904 (_ BitVec 64)) (t!23423 List!16777)) )
))
(declare-fun arrayNoDuplicates!0 (array!49221 (_ BitVec 32) List!16777) Bool)

(assert (=> b!857940 (= res!582879 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16774))))

(assert (= (and start!73456 res!582885) b!857928))

(assert (= (and b!857928 res!582882) b!857929))

(assert (= (and b!857929 res!582880) b!857931))

(assert (= (and b!857931 res!582886) b!857940))

(assert (= (and b!857940 res!582879) b!857938))

(assert (= (and b!857938 res!582888) b!857937))

(assert (= (and b!857937 res!582884) b!857939))

(assert (= (and b!857939 res!582887) b!857930))

(assert (= (and b!857930 res!582883) b!857934))

(assert (= (and b!857934 (not res!582881)) b!857932))

(assert (= (and b!857936 condMapEmpty!26387) mapIsEmpty!26387))

(assert (= (and b!857936 (not condMapEmpty!26387)) mapNonEmpty!26387))

(get-info :version)

(assert (= (and mapNonEmpty!26387 ((_ is ValueCellFull!7823) mapValue!26387)) b!857933))

(assert (= (and b!857936 ((_ is ValueCellFull!7823) mapDefault!26387)) b!857935))

(assert (= start!73456 b!857936))

(declare-fun b_lambda!11723 () Bool)

(assert (=> (not b_lambda!11723) (not b!857932)))

(declare-fun t!23421 () Bool)

(declare-fun tb!4503 () Bool)

(assert (=> (and start!73456 (= defaultEntry!696 defaultEntry!696) t!23421) tb!4503))

(declare-fun result!8625 () Bool)

(assert (=> tb!4503 (= result!8625 tp_is_empty!16525)))

(assert (=> b!857932 t!23421))

(declare-fun b_and!23733 () Bool)

(assert (= b_and!23731 (and (=> t!23421 result!8625) b_and!23733)))

(declare-fun m!798117 () Bool)

(assert (=> mapNonEmpty!26387 m!798117))

(declare-fun m!798119 () Bool)

(assert (=> b!857937 m!798119))

(declare-fun m!798121 () Bool)

(assert (=> b!857940 m!798121))

(declare-fun m!798123 () Bool)

(assert (=> b!857932 m!798123))

(declare-fun m!798125 () Bool)

(assert (=> b!857932 m!798125))

(declare-fun m!798127 () Bool)

(assert (=> b!857932 m!798127))

(declare-fun m!798129 () Bool)

(assert (=> b!857932 m!798129))

(assert (=> b!857932 m!798125))

(declare-fun m!798131 () Bool)

(assert (=> b!857932 m!798131))

(assert (=> b!857932 m!798127))

(declare-fun m!798133 () Bool)

(assert (=> b!857928 m!798133))

(declare-fun m!798135 () Bool)

(assert (=> b!857939 m!798135))

(declare-fun m!798137 () Bool)

(assert (=> b!857930 m!798137))

(declare-fun m!798139 () Bool)

(assert (=> b!857930 m!798139))

(declare-fun m!798141 () Bool)

(assert (=> b!857930 m!798141))

(declare-fun m!798143 () Bool)

(assert (=> b!857934 m!798143))

(assert (=> b!857934 m!798131))

(declare-fun m!798145 () Bool)

(assert (=> b!857934 m!798145))

(declare-fun m!798147 () Bool)

(assert (=> b!857934 m!798147))

(declare-fun m!798149 () Bool)

(assert (=> b!857934 m!798149))

(assert (=> b!857934 m!798131))

(declare-fun m!798151 () Bool)

(assert (=> b!857934 m!798151))

(declare-fun m!798153 () Bool)

(assert (=> b!857931 m!798153))

(declare-fun m!798155 () Bool)

(assert (=> start!73456 m!798155))

(declare-fun m!798157 () Bool)

(assert (=> start!73456 m!798157))

(check-sat (not b!857931) tp_is_empty!16525 (not b!857934) (not b!857937) (not start!73456) (not mapNonEmpty!26387) (not b!857928) (not b!857930) b_and!23733 (not b!857940) (not b_lambda!11723) (not b!857932) (not b_next!14389))
(check-sat b_and!23733 (not b_next!14389))
