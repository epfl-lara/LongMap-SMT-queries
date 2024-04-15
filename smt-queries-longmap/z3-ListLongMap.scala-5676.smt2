; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73822 () Bool)

(assert start!73822)

(declare-fun b_free!14755 () Bool)

(declare-fun b_next!14755 () Bool)

(assert (=> start!73822 (= b_free!14755 (not b_next!14755))))

(declare-fun tp!51769 () Bool)

(declare-fun b_and!24463 () Bool)

(assert (=> start!73822 (= tp!51769 b_and!24463)))

(declare-fun b!866886 () Bool)

(declare-fun e!482871 () Bool)

(declare-fun tp_is_empty!16891 () Bool)

(assert (=> b!866886 (= e!482871 tp_is_empty!16891)))

(declare-fun b!866887 () Bool)

(declare-fun res!589048 () Bool)

(declare-fun e!482874 () Bool)

(assert (=> b!866887 (=> (not res!589048) (not e!482874))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49931 0))(
  ( (array!49932 (arr!23997 (Array (_ BitVec 32) (_ BitVec 64))) (size!24439 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49931)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!866887 (= res!589048 (and (= (select (arr!23997 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!866888 () Bool)

(declare-fun res!589047 () Bool)

(assert (=> b!866888 (=> (not res!589047) (not e!482874))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49931 (_ BitVec 32)) Bool)

(assert (=> b!866888 (= res!589047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!866889 () Bool)

(declare-fun e!482873 () Bool)

(assert (=> b!866889 (= e!482873 true)))

(declare-datatypes ((V!27569 0))(
  ( (V!27570 (val!8493 Int)) )
))
(declare-datatypes ((tuple2!11290 0))(
  ( (tuple2!11291 (_1!5656 (_ BitVec 64)) (_2!5656 V!27569)) )
))
(declare-datatypes ((List!17077 0))(
  ( (Nil!17074) (Cons!17073 (h!18204 tuple2!11290) (t!24089 List!17077)) )
))
(declare-datatypes ((ListLongMap!10049 0))(
  ( (ListLongMap!10050 (toList!5040 List!17077)) )
))
(declare-fun lt!393534 () ListLongMap!10049)

(declare-fun lt!393533 () ListLongMap!10049)

(declare-fun lt!393542 () tuple2!11290)

(declare-fun lt!393535 () tuple2!11290)

(declare-fun +!2406 (ListLongMap!10049 tuple2!11290) ListLongMap!10049)

(assert (=> b!866889 (= lt!393534 (+!2406 (+!2406 lt!393533 lt!393535) lt!393542))))

(declare-fun v!557 () V!27569)

(declare-datatypes ((Unit!29680 0))(
  ( (Unit!29681) )
))
(declare-fun lt!393540 () Unit!29680)

(declare-fun lt!393539 () V!27569)

(declare-fun addCommutativeForDiffKeys!542 (ListLongMap!10049 (_ BitVec 64) V!27569 (_ BitVec 64) V!27569) Unit!29680)

(assert (=> b!866889 (= lt!393540 (addCommutativeForDiffKeys!542 lt!393533 k0!854 v!557 (select (arr!23997 _keys!868) from!1053) lt!393539))))

(declare-fun b!866890 () Bool)

(declare-fun res!589046 () Bool)

(assert (=> b!866890 (=> (not res!589046) (not e!482874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!866890 (= res!589046 (validMask!0 mask!1196))))

(declare-fun b!866891 () Bool)

(declare-fun e!482877 () Bool)

(assert (=> b!866891 (= e!482877 e!482873)))

(declare-fun res!589052 () Bool)

(assert (=> b!866891 (=> res!589052 e!482873)))

(assert (=> b!866891 (= res!589052 (= k0!854 (select (arr!23997 _keys!868) from!1053)))))

(assert (=> b!866891 (not (= (select (arr!23997 _keys!868) from!1053) k0!854))))

(declare-fun lt!393537 () Unit!29680)

(declare-fun e!482870 () Unit!29680)

(assert (=> b!866891 (= lt!393537 e!482870)))

(declare-fun c!92288 () Bool)

(assert (=> b!866891 (= c!92288 (= (select (arr!23997 _keys!868) from!1053) k0!854))))

(declare-fun lt!393541 () ListLongMap!10049)

(assert (=> b!866891 (= lt!393541 lt!393534)))

(declare-fun lt!393543 () ListLongMap!10049)

(assert (=> b!866891 (= lt!393534 (+!2406 lt!393543 lt!393535))))

(assert (=> b!866891 (= lt!393535 (tuple2!11291 (select (arr!23997 _keys!868) from!1053) lt!393539))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8006 0))(
  ( (ValueCellFull!8006 (v!10912 V!27569)) (EmptyCell!8006) )
))
(declare-datatypes ((array!49933 0))(
  ( (array!49934 (arr!23998 (Array (_ BitVec 32) ValueCell!8006)) (size!24440 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49933)

(declare-fun get!12695 (ValueCell!8006 V!27569) V!27569)

(declare-fun dynLambda!1196 (Int (_ BitVec 64)) V!27569)

(assert (=> b!866891 (= lt!393539 (get!12695 (select (arr!23998 _values!688) from!1053) (dynLambda!1196 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!866892 () Bool)

(declare-fun Unit!29682 () Unit!29680)

(assert (=> b!866892 (= e!482870 Unit!29682)))

(declare-fun b!866893 () Bool)

(declare-fun res!589054 () Bool)

(assert (=> b!866893 (=> (not res!589054) (not e!482874))))

(declare-datatypes ((List!17078 0))(
  ( (Nil!17075) (Cons!17074 (h!18205 (_ BitVec 64)) (t!24090 List!17078)) )
))
(declare-fun arrayNoDuplicates!0 (array!49931 (_ BitVec 32) List!17078) Bool)

(assert (=> b!866893 (= res!589054 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17075))))

(declare-fun b!866894 () Bool)

(declare-fun Unit!29683 () Unit!29680)

(assert (=> b!866894 (= e!482870 Unit!29683)))

(declare-fun lt!393538 () Unit!29680)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49931 (_ BitVec 32) (_ BitVec 32)) Unit!29680)

(assert (=> b!866894 (= lt!393538 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!866894 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17075)))

(declare-fun lt!393544 () Unit!29680)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49931 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29680)

(assert (=> b!866894 (= lt!393544 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!866894 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393545 () Unit!29680)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49931 (_ BitVec 64) (_ BitVec 32) List!17078) Unit!29680)

(assert (=> b!866894 (= lt!393545 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17075))))

(assert (=> b!866894 false))

(declare-fun mapIsEmpty!26936 () Bool)

(declare-fun mapRes!26936 () Bool)

(assert (=> mapIsEmpty!26936 mapRes!26936))

(declare-fun mapNonEmpty!26936 () Bool)

(declare-fun tp!51770 () Bool)

(declare-fun e!482869 () Bool)

(assert (=> mapNonEmpty!26936 (= mapRes!26936 (and tp!51770 e!482869))))

(declare-fun mapValue!26936 () ValueCell!8006)

(declare-fun mapRest!26936 () (Array (_ BitVec 32) ValueCell!8006))

(declare-fun mapKey!26936 () (_ BitVec 32))

(assert (=> mapNonEmpty!26936 (= (arr!23998 _values!688) (store mapRest!26936 mapKey!26936 mapValue!26936))))

(declare-fun res!589055 () Bool)

(assert (=> start!73822 (=> (not res!589055) (not e!482874))))

(assert (=> start!73822 (= res!589055 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24439 _keys!868))))))

(assert (=> start!73822 e!482874))

(assert (=> start!73822 tp_is_empty!16891))

(assert (=> start!73822 true))

(assert (=> start!73822 tp!51769))

(declare-fun array_inv!19040 (array!49931) Bool)

(assert (=> start!73822 (array_inv!19040 _keys!868)))

(declare-fun e!482875 () Bool)

(declare-fun array_inv!19041 (array!49933) Bool)

(assert (=> start!73822 (and (array_inv!19041 _values!688) e!482875)))

(declare-fun b!866895 () Bool)

(assert (=> b!866895 (= e!482875 (and e!482871 mapRes!26936))))

(declare-fun condMapEmpty!26936 () Bool)

(declare-fun mapDefault!26936 () ValueCell!8006)

(assert (=> b!866895 (= condMapEmpty!26936 (= (arr!23998 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8006)) mapDefault!26936)))))

(declare-fun b!866896 () Bool)

(declare-fun res!589049 () Bool)

(assert (=> b!866896 (=> (not res!589049) (not e!482874))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!866896 (= res!589049 (and (= (size!24440 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24439 _keys!868) (size!24440 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!866897 () Bool)

(assert (=> b!866897 (= e!482869 tp_is_empty!16891)))

(declare-fun b!866898 () Bool)

(declare-fun res!589056 () Bool)

(assert (=> b!866898 (=> (not res!589056) (not e!482874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866898 (= res!589056 (validKeyInArray!0 k0!854))))

(declare-fun b!866899 () Bool)

(declare-fun e!482872 () Bool)

(assert (=> b!866899 (= e!482872 (not e!482877))))

(declare-fun res!589053 () Bool)

(assert (=> b!866899 (=> res!589053 e!482877)))

(assert (=> b!866899 (= res!589053 (not (validKeyInArray!0 (select (arr!23997 _keys!868) from!1053))))))

(declare-fun lt!393548 () ListLongMap!10049)

(assert (=> b!866899 (= lt!393548 lt!393543)))

(assert (=> b!866899 (= lt!393543 (+!2406 lt!393533 lt!393542))))

(declare-fun lt!393536 () array!49933)

(declare-fun minValue!654 () V!27569)

(declare-fun zeroValue!654 () V!27569)

(declare-fun getCurrentListMapNoExtraKeys!3034 (array!49931 array!49933 (_ BitVec 32) (_ BitVec 32) V!27569 V!27569 (_ BitVec 32) Int) ListLongMap!10049)

(assert (=> b!866899 (= lt!393548 (getCurrentListMapNoExtraKeys!3034 _keys!868 lt!393536 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!866899 (= lt!393542 (tuple2!11291 k0!854 v!557))))

(assert (=> b!866899 (= lt!393533 (getCurrentListMapNoExtraKeys!3034 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!393546 () Unit!29680)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!575 (array!49931 array!49933 (_ BitVec 32) (_ BitVec 32) V!27569 V!27569 (_ BitVec 32) (_ BitVec 64) V!27569 (_ BitVec 32) Int) Unit!29680)

(assert (=> b!866899 (= lt!393546 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!575 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!866900 () Bool)

(declare-fun res!589050 () Bool)

(assert (=> b!866900 (=> (not res!589050) (not e!482874))))

(assert (=> b!866900 (= res!589050 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24439 _keys!868))))))

(declare-fun b!866901 () Bool)

(assert (=> b!866901 (= e!482874 e!482872)))

(declare-fun res!589051 () Bool)

(assert (=> b!866901 (=> (not res!589051) (not e!482872))))

(assert (=> b!866901 (= res!589051 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!866901 (= lt!393541 (getCurrentListMapNoExtraKeys!3034 _keys!868 lt!393536 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!866901 (= lt!393536 (array!49934 (store (arr!23998 _values!688) i!612 (ValueCellFull!8006 v!557)) (size!24440 _values!688)))))

(declare-fun lt!393547 () ListLongMap!10049)

(assert (=> b!866901 (= lt!393547 (getCurrentListMapNoExtraKeys!3034 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73822 res!589055) b!866890))

(assert (= (and b!866890 res!589046) b!866896))

(assert (= (and b!866896 res!589049) b!866888))

(assert (= (and b!866888 res!589047) b!866893))

(assert (= (and b!866893 res!589054) b!866900))

(assert (= (and b!866900 res!589050) b!866898))

(assert (= (and b!866898 res!589056) b!866887))

(assert (= (and b!866887 res!589048) b!866901))

(assert (= (and b!866901 res!589051) b!866899))

(assert (= (and b!866899 (not res!589053)) b!866891))

(assert (= (and b!866891 c!92288) b!866894))

(assert (= (and b!866891 (not c!92288)) b!866892))

(assert (= (and b!866891 (not res!589052)) b!866889))

(assert (= (and b!866895 condMapEmpty!26936) mapIsEmpty!26936))

(assert (= (and b!866895 (not condMapEmpty!26936)) mapNonEmpty!26936))

(get-info :version)

(assert (= (and mapNonEmpty!26936 ((_ is ValueCellFull!8006) mapValue!26936)) b!866897))

(assert (= (and b!866895 ((_ is ValueCellFull!8006) mapDefault!26936)) b!866886))

(assert (= start!73822 b!866895))

(declare-fun b_lambda!12089 () Bool)

(assert (=> (not b_lambda!12089) (not b!866891)))

(declare-fun t!24088 () Bool)

(declare-fun tb!4869 () Bool)

(assert (=> (and start!73822 (= defaultEntry!696 defaultEntry!696) t!24088) tb!4869))

(declare-fun result!9357 () Bool)

(assert (=> tb!4869 (= result!9357 tp_is_empty!16891)))

(assert (=> b!866891 t!24088))

(declare-fun b_and!24465 () Bool)

(assert (= b_and!24463 (and (=> t!24088 result!9357) b_and!24465)))

(declare-fun m!808137 () Bool)

(assert (=> b!866893 m!808137))

(declare-fun m!808139 () Bool)

(assert (=> b!866891 m!808139))

(declare-fun m!808141 () Bool)

(assert (=> b!866891 m!808141))

(declare-fun m!808143 () Bool)

(assert (=> b!866891 m!808143))

(declare-fun m!808145 () Bool)

(assert (=> b!866891 m!808145))

(assert (=> b!866891 m!808141))

(declare-fun m!808147 () Bool)

(assert (=> b!866891 m!808147))

(assert (=> b!866891 m!808143))

(declare-fun m!808149 () Bool)

(assert (=> b!866890 m!808149))

(declare-fun m!808151 () Bool)

(assert (=> b!866889 m!808151))

(assert (=> b!866889 m!808151))

(declare-fun m!808153 () Bool)

(assert (=> b!866889 m!808153))

(assert (=> b!866889 m!808147))

(assert (=> b!866889 m!808147))

(declare-fun m!808155 () Bool)

(assert (=> b!866889 m!808155))

(declare-fun m!808157 () Bool)

(assert (=> b!866901 m!808157))

(declare-fun m!808159 () Bool)

(assert (=> b!866901 m!808159))

(declare-fun m!808161 () Bool)

(assert (=> b!866901 m!808161))

(declare-fun m!808163 () Bool)

(assert (=> b!866894 m!808163))

(declare-fun m!808165 () Bool)

(assert (=> b!866894 m!808165))

(declare-fun m!808167 () Bool)

(assert (=> b!866894 m!808167))

(declare-fun m!808169 () Bool)

(assert (=> b!866894 m!808169))

(declare-fun m!808171 () Bool)

(assert (=> b!866894 m!808171))

(declare-fun m!808173 () Bool)

(assert (=> mapNonEmpty!26936 m!808173))

(assert (=> b!866899 m!808147))

(declare-fun m!808175 () Bool)

(assert (=> b!866899 m!808175))

(assert (=> b!866899 m!808147))

(declare-fun m!808177 () Bool)

(assert (=> b!866899 m!808177))

(declare-fun m!808179 () Bool)

(assert (=> b!866899 m!808179))

(declare-fun m!808181 () Bool)

(assert (=> b!866899 m!808181))

(declare-fun m!808183 () Bool)

(assert (=> b!866899 m!808183))

(declare-fun m!808185 () Bool)

(assert (=> start!73822 m!808185))

(declare-fun m!808187 () Bool)

(assert (=> start!73822 m!808187))

(declare-fun m!808189 () Bool)

(assert (=> b!866898 m!808189))

(declare-fun m!808191 () Bool)

(assert (=> b!866888 m!808191))

(declare-fun m!808193 () Bool)

(assert (=> b!866887 m!808193))

(check-sat (not b!866888) (not b!866893) (not b!866894) (not b!866899) (not start!73822) (not b!866889) (not b!866890) (not mapNonEmpty!26936) (not b_lambda!12089) (not b_next!14755) (not b!866891) (not b!866898) (not b!866901) b_and!24465 tp_is_empty!16891)
(check-sat b_and!24465 (not b_next!14755))
