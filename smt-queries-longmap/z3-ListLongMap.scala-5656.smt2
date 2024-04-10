; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73722 () Bool)

(assert start!73722)

(declare-fun b_free!14637 () Bool)

(declare-fun b_next!14637 () Bool)

(assert (=> start!73722 (= b_free!14637 (not b_next!14637))))

(declare-fun tp!51415 () Bool)

(declare-fun b_and!24253 () Bool)

(assert (=> start!73722 (= tp!51415 b_and!24253)))

(declare-fun b!864175 () Bool)

(declare-fun e!481424 () Bool)

(declare-fun e!481427 () Bool)

(declare-fun mapRes!26759 () Bool)

(assert (=> b!864175 (= e!481424 (and e!481427 mapRes!26759))))

(declare-fun condMapEmpty!26759 () Bool)

(declare-datatypes ((V!27411 0))(
  ( (V!27412 (val!8434 Int)) )
))
(declare-datatypes ((ValueCell!7947 0))(
  ( (ValueCellFull!7947 (v!10859 V!27411)) (EmptyCell!7947) )
))
(declare-datatypes ((array!49708 0))(
  ( (array!49709 (arr!23885 (Array (_ BitVec 32) ValueCell!7947)) (size!24325 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49708)

(declare-fun mapDefault!26759 () ValueCell!7947)

(assert (=> b!864175 (= condMapEmpty!26759 (= (arr!23885 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7947)) mapDefault!26759)))))

(declare-fun b!864176 () Bool)

(declare-fun res!587214 () Bool)

(declare-fun e!481429 () Bool)

(assert (=> b!864176 (=> (not res!587214) (not e!481429))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!864176 (= res!587214 (validMask!0 mask!1196))))

(declare-fun b!864177 () Bool)

(declare-fun res!587216 () Bool)

(assert (=> b!864177 (=> (not res!587216) (not e!481429))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864177 (= res!587216 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26759 () Bool)

(declare-fun tp!51414 () Bool)

(declare-fun e!481432 () Bool)

(assert (=> mapNonEmpty!26759 (= mapRes!26759 (and tp!51414 e!481432))))

(declare-fun mapKey!26759 () (_ BitVec 32))

(declare-fun mapRest!26759 () (Array (_ BitVec 32) ValueCell!7947))

(declare-fun mapValue!26759 () ValueCell!7947)

(assert (=> mapNonEmpty!26759 (= (arr!23885 _values!688) (store mapRest!26759 mapKey!26759 mapValue!26759))))

(declare-fun b!864178 () Bool)

(declare-fun e!481425 () Bool)

(declare-fun e!481428 () Bool)

(assert (=> b!864178 (= e!481425 (not e!481428))))

(declare-fun res!587211 () Bool)

(assert (=> b!864178 (=> res!587211 e!481428)))

(declare-datatypes ((array!49710 0))(
  ( (array!49711 (arr!23886 (Array (_ BitVec 32) (_ BitVec 64))) (size!24326 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49710)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!864178 (= res!587211 (not (validKeyInArray!0 (select (arr!23886 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11168 0))(
  ( (tuple2!11169 (_1!5595 (_ BitVec 64)) (_2!5595 V!27411)) )
))
(declare-datatypes ((List!16973 0))(
  ( (Nil!16970) (Cons!16969 (h!18100 tuple2!11168) (t!23876 List!16973)) )
))
(declare-datatypes ((ListLongMap!9937 0))(
  ( (ListLongMap!9938 (toList!4984 List!16973)) )
))
(declare-fun lt!390949 () ListLongMap!9937)

(declare-fun lt!390941 () ListLongMap!9937)

(assert (=> b!864178 (= lt!390949 lt!390941)))

(declare-fun lt!390952 () ListLongMap!9937)

(declare-fun lt!390938 () tuple2!11168)

(declare-fun +!2333 (ListLongMap!9937 tuple2!11168) ListLongMap!9937)

(assert (=> b!864178 (= lt!390941 (+!2333 lt!390952 lt!390938))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27411)

(declare-fun zeroValue!654 () V!27411)

(declare-fun lt!390940 () array!49708)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2957 (array!49710 array!49708 (_ BitVec 32) (_ BitVec 32) V!27411 V!27411 (_ BitVec 32) Int) ListLongMap!9937)

(assert (=> b!864178 (= lt!390949 (getCurrentListMapNoExtraKeys!2957 _keys!868 lt!390940 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27411)

(assert (=> b!864178 (= lt!390938 (tuple2!11169 k0!854 v!557))))

(assert (=> b!864178 (= lt!390952 (getCurrentListMapNoExtraKeys!2957 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29557 0))(
  ( (Unit!29558) )
))
(declare-fun lt!390942 () Unit!29557)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!537 (array!49710 array!49708 (_ BitVec 32) (_ BitVec 32) V!27411 V!27411 (_ BitVec 32) (_ BitVec 64) V!27411 (_ BitVec 32) Int) Unit!29557)

(assert (=> b!864178 (= lt!390942 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!537 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!587217 () Bool)

(assert (=> start!73722 (=> (not res!587217) (not e!481429))))

(assert (=> start!73722 (= res!587217 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24326 _keys!868))))))

(assert (=> start!73722 e!481429))

(declare-fun tp_is_empty!16773 () Bool)

(assert (=> start!73722 tp_is_empty!16773))

(assert (=> start!73722 true))

(assert (=> start!73722 tp!51415))

(declare-fun array_inv!18890 (array!49710) Bool)

(assert (=> start!73722 (array_inv!18890 _keys!868)))

(declare-fun array_inv!18891 (array!49708) Bool)

(assert (=> start!73722 (and (array_inv!18891 _values!688) e!481424)))

(declare-fun b!864179 () Bool)

(declare-fun e!481426 () Unit!29557)

(declare-fun Unit!29559 () Unit!29557)

(assert (=> b!864179 (= e!481426 Unit!29559)))

(declare-fun b!864180 () Bool)

(declare-fun res!587210 () Bool)

(assert (=> b!864180 (=> (not res!587210) (not e!481429))))

(assert (=> b!864180 (= res!587210 (and (= (size!24325 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24326 _keys!868) (size!24325 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!864181 () Bool)

(declare-fun e!481431 () Bool)

(assert (=> b!864181 (= e!481428 e!481431)))

(declare-fun res!587209 () Bool)

(assert (=> b!864181 (=> res!587209 e!481431)))

(assert (=> b!864181 (= res!587209 (= k0!854 (select (arr!23886 _keys!868) from!1053)))))

(assert (=> b!864181 (not (= (select (arr!23886 _keys!868) from!1053) k0!854))))

(declare-fun lt!390939 () Unit!29557)

(assert (=> b!864181 (= lt!390939 e!481426)))

(declare-fun c!92176 () Bool)

(assert (=> b!864181 (= c!92176 (= (select (arr!23886 _keys!868) from!1053) k0!854))))

(declare-fun lt!390951 () ListLongMap!9937)

(declare-fun lt!390946 () ListLongMap!9937)

(assert (=> b!864181 (= lt!390951 lt!390946)))

(declare-fun lt!390950 () tuple2!11168)

(assert (=> b!864181 (= lt!390946 (+!2333 lt!390941 lt!390950))))

(declare-fun lt!390947 () V!27411)

(assert (=> b!864181 (= lt!390950 (tuple2!11169 (select (arr!23886 _keys!868) from!1053) lt!390947))))

(declare-fun get!12615 (ValueCell!7947 V!27411) V!27411)

(declare-fun dynLambda!1159 (Int (_ BitVec 64)) V!27411)

(assert (=> b!864181 (= lt!390947 (get!12615 (select (arr!23885 _values!688) from!1053) (dynLambda!1159 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!864182 () Bool)

(assert (=> b!864182 (= e!481427 tp_is_empty!16773)))

(declare-fun b!864183 () Bool)

(assert (=> b!864183 (= e!481431 true)))

(assert (=> b!864183 (= lt!390946 (+!2333 (+!2333 lt!390952 lt!390950) lt!390938))))

(declare-fun lt!390937 () Unit!29557)

(declare-fun addCommutativeForDiffKeys!506 (ListLongMap!9937 (_ BitVec 64) V!27411 (_ BitVec 64) V!27411) Unit!29557)

(assert (=> b!864183 (= lt!390937 (addCommutativeForDiffKeys!506 lt!390952 k0!854 v!557 (select (arr!23886 _keys!868) from!1053) lt!390947))))

(declare-fun b!864184 () Bool)

(declare-fun res!587219 () Bool)

(assert (=> b!864184 (=> (not res!587219) (not e!481429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49710 (_ BitVec 32)) Bool)

(assert (=> b!864184 (= res!587219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!864185 () Bool)

(declare-fun Unit!29560 () Unit!29557)

(assert (=> b!864185 (= e!481426 Unit!29560)))

(declare-fun lt!390943 () Unit!29557)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49710 (_ BitVec 32) (_ BitVec 32)) Unit!29557)

(assert (=> b!864185 (= lt!390943 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16974 0))(
  ( (Nil!16971) (Cons!16970 (h!18101 (_ BitVec 64)) (t!23877 List!16974)) )
))
(declare-fun arrayNoDuplicates!0 (array!49710 (_ BitVec 32) List!16974) Bool)

(assert (=> b!864185 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16971)))

(declare-fun lt!390945 () Unit!29557)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49710 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29557)

(assert (=> b!864185 (= lt!390945 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49710 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864185 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390948 () Unit!29557)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49710 (_ BitVec 64) (_ BitVec 32) List!16974) Unit!29557)

(assert (=> b!864185 (= lt!390948 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16971))))

(assert (=> b!864185 false))

(declare-fun b!864186 () Bool)

(assert (=> b!864186 (= e!481429 e!481425)))

(declare-fun res!587212 () Bool)

(assert (=> b!864186 (=> (not res!587212) (not e!481425))))

(assert (=> b!864186 (= res!587212 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!864186 (= lt!390951 (getCurrentListMapNoExtraKeys!2957 _keys!868 lt!390940 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!864186 (= lt!390940 (array!49709 (store (arr!23885 _values!688) i!612 (ValueCellFull!7947 v!557)) (size!24325 _values!688)))))

(declare-fun lt!390944 () ListLongMap!9937)

(assert (=> b!864186 (= lt!390944 (getCurrentListMapNoExtraKeys!2957 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!864187 () Bool)

(declare-fun res!587213 () Bool)

(assert (=> b!864187 (=> (not res!587213) (not e!481429))))

(assert (=> b!864187 (= res!587213 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16971))))

(declare-fun b!864188 () Bool)

(declare-fun res!587218 () Bool)

(assert (=> b!864188 (=> (not res!587218) (not e!481429))))

(assert (=> b!864188 (= res!587218 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24326 _keys!868))))))

(declare-fun b!864189 () Bool)

(declare-fun res!587215 () Bool)

(assert (=> b!864189 (=> (not res!587215) (not e!481429))))

(assert (=> b!864189 (= res!587215 (and (= (select (arr!23886 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26759 () Bool)

(assert (=> mapIsEmpty!26759 mapRes!26759))

(declare-fun b!864190 () Bool)

(assert (=> b!864190 (= e!481432 tp_is_empty!16773)))

(assert (= (and start!73722 res!587217) b!864176))

(assert (= (and b!864176 res!587214) b!864180))

(assert (= (and b!864180 res!587210) b!864184))

(assert (= (and b!864184 res!587219) b!864187))

(assert (= (and b!864187 res!587213) b!864188))

(assert (= (and b!864188 res!587218) b!864177))

(assert (= (and b!864177 res!587216) b!864189))

(assert (= (and b!864189 res!587215) b!864186))

(assert (= (and b!864186 res!587212) b!864178))

(assert (= (and b!864178 (not res!587211)) b!864181))

(assert (= (and b!864181 c!92176) b!864185))

(assert (= (and b!864181 (not c!92176)) b!864179))

(assert (= (and b!864181 (not res!587209)) b!864183))

(assert (= (and b!864175 condMapEmpty!26759) mapIsEmpty!26759))

(assert (= (and b!864175 (not condMapEmpty!26759)) mapNonEmpty!26759))

(get-info :version)

(assert (= (and mapNonEmpty!26759 ((_ is ValueCellFull!7947) mapValue!26759)) b!864190))

(assert (= (and b!864175 ((_ is ValueCellFull!7947) mapDefault!26759)) b!864182))

(assert (= start!73722 b!864175))

(declare-fun b_lambda!11989 () Bool)

(assert (=> (not b_lambda!11989) (not b!864181)))

(declare-fun t!23875 () Bool)

(declare-fun tb!4759 () Bool)

(assert (=> (and start!73722 (= defaultEntry!696 defaultEntry!696) t!23875) tb!4759))

(declare-fun result!9129 () Bool)

(assert (=> tb!4759 (= result!9129 tp_is_empty!16773)))

(assert (=> b!864181 t!23875))

(declare-fun b_and!24255 () Bool)

(assert (= b_and!24253 (and (=> t!23875 result!9129) b_and!24255)))

(declare-fun m!805473 () Bool)

(assert (=> b!864187 m!805473))

(declare-fun m!805475 () Bool)

(assert (=> b!864181 m!805475))

(declare-fun m!805477 () Bool)

(assert (=> b!864181 m!805477))

(declare-fun m!805479 () Bool)

(assert (=> b!864181 m!805479))

(assert (=> b!864181 m!805475))

(declare-fun m!805481 () Bool)

(assert (=> b!864181 m!805481))

(assert (=> b!864181 m!805477))

(declare-fun m!805483 () Bool)

(assert (=> b!864181 m!805483))

(declare-fun m!805485 () Bool)

(assert (=> b!864184 m!805485))

(declare-fun m!805487 () Bool)

(assert (=> start!73722 m!805487))

(declare-fun m!805489 () Bool)

(assert (=> start!73722 m!805489))

(declare-fun m!805491 () Bool)

(assert (=> b!864186 m!805491))

(declare-fun m!805493 () Bool)

(assert (=> b!864186 m!805493))

(declare-fun m!805495 () Bool)

(assert (=> b!864186 m!805495))

(declare-fun m!805497 () Bool)

(assert (=> b!864178 m!805497))

(declare-fun m!805499 () Bool)

(assert (=> b!864178 m!805499))

(assert (=> b!864178 m!805481))

(declare-fun m!805501 () Bool)

(assert (=> b!864178 m!805501))

(assert (=> b!864178 m!805481))

(declare-fun m!805503 () Bool)

(assert (=> b!864178 m!805503))

(declare-fun m!805505 () Bool)

(assert (=> b!864178 m!805505))

(declare-fun m!805507 () Bool)

(assert (=> b!864177 m!805507))

(declare-fun m!805509 () Bool)

(assert (=> mapNonEmpty!26759 m!805509))

(declare-fun m!805511 () Bool)

(assert (=> b!864183 m!805511))

(assert (=> b!864183 m!805511))

(declare-fun m!805513 () Bool)

(assert (=> b!864183 m!805513))

(assert (=> b!864183 m!805481))

(assert (=> b!864183 m!805481))

(declare-fun m!805515 () Bool)

(assert (=> b!864183 m!805515))

(declare-fun m!805517 () Bool)

(assert (=> b!864185 m!805517))

(declare-fun m!805519 () Bool)

(assert (=> b!864185 m!805519))

(declare-fun m!805521 () Bool)

(assert (=> b!864185 m!805521))

(declare-fun m!805523 () Bool)

(assert (=> b!864185 m!805523))

(declare-fun m!805525 () Bool)

(assert (=> b!864185 m!805525))

(declare-fun m!805527 () Bool)

(assert (=> b!864189 m!805527))

(declare-fun m!805529 () Bool)

(assert (=> b!864176 m!805529))

(check-sat (not b!864177) tp_is_empty!16773 (not b!864178) (not b!864183) (not b!864187) b_and!24255 (not b!864184) (not b!864186) (not start!73722) (not b_lambda!11989) (not b!864185) (not mapNonEmpty!26759) (not b_next!14637) (not b!864181) (not b!864176))
(check-sat b_and!24255 (not b_next!14637))
