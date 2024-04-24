; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39788 () Bool)

(assert start!39788)

(declare-fun b_free!10069 () Bool)

(declare-fun b_next!10069 () Bool)

(assert (=> start!39788 (= b_free!10069 (not b_next!10069))))

(declare-fun tp!35735 () Bool)

(declare-fun b_and!17811 () Bool)

(assert (=> start!39788 (= tp!35735 b_and!17811)))

(declare-fun b!429325 () Bool)

(declare-fun e!254298 () Bool)

(declare-fun e!254295 () Bool)

(assert (=> b!429325 (= e!254298 (not e!254295))))

(declare-fun res!252158 () Bool)

(assert (=> b!429325 (=> res!252158 e!254295)))

(declare-datatypes ((array!26282 0))(
  ( (array!26283 (arr!12590 (Array (_ BitVec 32) (_ BitVec 64))) (size!12942 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26282)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!429325 (= res!252158 (not (validKeyInArray!0 (select (arr!12590 _keys!709) from!863))))))

(declare-datatypes ((V!16067 0))(
  ( (V!16068 (val!5655 Int)) )
))
(declare-datatypes ((tuple2!7346 0))(
  ( (tuple2!7347 (_1!3684 (_ BitVec 64)) (_2!3684 V!16067)) )
))
(declare-datatypes ((List!7347 0))(
  ( (Nil!7344) (Cons!7343 (h!8199 tuple2!7346) (t!12857 List!7347)) )
))
(declare-datatypes ((ListLongMap!6261 0))(
  ( (ListLongMap!6262 (toList!3146 List!7347)) )
))
(declare-fun lt!196254 () ListLongMap!6261)

(declare-fun lt!196251 () ListLongMap!6261)

(assert (=> b!429325 (= lt!196254 lt!196251)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!196245 () ListLongMap!6261)

(declare-fun v!412 () V!16067)

(declare-fun +!1358 (ListLongMap!6261 tuple2!7346) ListLongMap!6261)

(assert (=> b!429325 (= lt!196251 (+!1358 lt!196245 (tuple2!7347 k0!794 v!412)))))

(declare-fun minValue!515 () V!16067)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16067)

(declare-fun lt!196248 () array!26282)

(declare-datatypes ((ValueCell!5267 0))(
  ( (ValueCellFull!5267 (v!7903 V!16067)) (EmptyCell!5267) )
))
(declare-datatypes ((array!26284 0))(
  ( (array!26285 (arr!12591 (Array (_ BitVec 32) ValueCell!5267)) (size!12943 (_ BitVec 32))) )
))
(declare-fun lt!196252 () array!26284)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1390 (array!26282 array!26284 (_ BitVec 32) (_ BitVec 32) V!16067 V!16067 (_ BitVec 32) Int) ListLongMap!6261)

(assert (=> b!429325 (= lt!196254 (getCurrentListMapNoExtraKeys!1390 lt!196248 lt!196252 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!26284)

(assert (=> b!429325 (= lt!196245 (getCurrentListMapNoExtraKeys!1390 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!12613 0))(
  ( (Unit!12614) )
))
(declare-fun lt!196253 () Unit!12613)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!538 (array!26282 array!26284 (_ BitVec 32) (_ BitVec 32) V!16067 V!16067 (_ BitVec 32) (_ BitVec 64) V!16067 (_ BitVec 32) Int) Unit!12613)

(assert (=> b!429325 (= lt!196253 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!538 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!429326 () Bool)

(declare-fun res!252161 () Bool)

(declare-fun e!254299 () Bool)

(assert (=> b!429326 (=> (not res!252161) (not e!254299))))

(assert (=> b!429326 (= res!252161 (or (= (select (arr!12590 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12590 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!429327 () Bool)

(declare-fun res!252159 () Bool)

(declare-fun e!254294 () Bool)

(assert (=> b!429327 (=> (not res!252159) (not e!254294))))

(assert (=> b!429327 (= res!252159 (bvsle from!863 i!563))))

(declare-fun b!429328 () Bool)

(declare-fun res!252152 () Bool)

(assert (=> b!429328 (=> (not res!252152) (not e!254299))))

(assert (=> b!429328 (= res!252152 (validKeyInArray!0 k0!794))))

(declare-fun b!429329 () Bool)

(assert (=> b!429329 (= e!254299 e!254294)))

(declare-fun res!252156 () Bool)

(assert (=> b!429329 (=> (not res!252156) (not e!254294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26282 (_ BitVec 32)) Bool)

(assert (=> b!429329 (= res!252156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196248 mask!1025))))

(assert (=> b!429329 (= lt!196248 (array!26283 (store (arr!12590 _keys!709) i!563 k0!794) (size!12942 _keys!709)))))

(declare-fun b!429330 () Bool)

(declare-fun res!252153 () Bool)

(assert (=> b!429330 (=> (not res!252153) (not e!254299))))

(assert (=> b!429330 (= res!252153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!18453 () Bool)

(declare-fun mapRes!18453 () Bool)

(assert (=> mapIsEmpty!18453 mapRes!18453))

(declare-fun b!429331 () Bool)

(declare-fun res!252165 () Bool)

(assert (=> b!429331 (=> (not res!252165) (not e!254299))))

(assert (=> b!429331 (= res!252165 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12942 _keys!709))))))

(declare-fun b!429332 () Bool)

(declare-fun e!254300 () Unit!12613)

(declare-fun Unit!12615 () Unit!12613)

(assert (=> b!429332 (= e!254300 Unit!12615)))

(declare-fun lt!196247 () Unit!12613)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26282 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12613)

(assert (=> b!429332 (= lt!196247 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!429332 false))

(declare-fun b!429333 () Bool)

(declare-fun Unit!12616 () Unit!12613)

(assert (=> b!429333 (= e!254300 Unit!12616)))

(declare-fun b!429334 () Bool)

(declare-fun e!254301 () Bool)

(declare-fun tp_is_empty!11221 () Bool)

(assert (=> b!429334 (= e!254301 tp_is_empty!11221)))

(declare-fun res!252160 () Bool)

(assert (=> start!39788 (=> (not res!252160) (not e!254299))))

(assert (=> start!39788 (= res!252160 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12942 _keys!709))))))

(assert (=> start!39788 e!254299))

(assert (=> start!39788 tp_is_empty!11221))

(assert (=> start!39788 tp!35735))

(assert (=> start!39788 true))

(declare-fun e!254297 () Bool)

(declare-fun array_inv!9238 (array!26284) Bool)

(assert (=> start!39788 (and (array_inv!9238 _values!549) e!254297)))

(declare-fun array_inv!9239 (array!26282) Bool)

(assert (=> start!39788 (array_inv!9239 _keys!709)))

(declare-fun b!429335 () Bool)

(declare-fun e!254302 () Bool)

(assert (=> b!429335 (= e!254302 tp_is_empty!11221)))

(declare-fun b!429336 () Bool)

(declare-fun res!252154 () Bool)

(assert (=> b!429336 (=> (not res!252154) (not e!254299))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!429336 (= res!252154 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!18453 () Bool)

(declare-fun tp!35736 () Bool)

(assert (=> mapNonEmpty!18453 (= mapRes!18453 (and tp!35736 e!254301))))

(declare-fun mapValue!18453 () ValueCell!5267)

(declare-fun mapKey!18453 () (_ BitVec 32))

(declare-fun mapRest!18453 () (Array (_ BitVec 32) ValueCell!5267))

(assert (=> mapNonEmpty!18453 (= (arr!12591 _values!549) (store mapRest!18453 mapKey!18453 mapValue!18453))))

(declare-fun b!429337 () Bool)

(assert (=> b!429337 (= e!254295 true)))

(assert (=> b!429337 (not (= (select (arr!12590 _keys!709) from!863) k0!794))))

(declare-fun lt!196250 () Unit!12613)

(assert (=> b!429337 (= lt!196250 e!254300)))

(declare-fun c!55416 () Bool)

(assert (=> b!429337 (= c!55416 (= (select (arr!12590 _keys!709) from!863) k0!794))))

(declare-fun lt!196249 () ListLongMap!6261)

(declare-fun get!6249 (ValueCell!5267 V!16067) V!16067)

(declare-fun dynLambda!772 (Int (_ BitVec 64)) V!16067)

(assert (=> b!429337 (= lt!196249 (+!1358 lt!196251 (tuple2!7347 (select (arr!12590 _keys!709) from!863) (get!6249 (select (arr!12591 _values!549) from!863) (dynLambda!772 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!429338 () Bool)

(declare-fun res!252164 () Bool)

(assert (=> b!429338 (=> (not res!252164) (not e!254299))))

(declare-fun arrayContainsKey!0 (array!26282 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!429338 (= res!252164 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!429339 () Bool)

(assert (=> b!429339 (= e!254297 (and e!254302 mapRes!18453))))

(declare-fun condMapEmpty!18453 () Bool)

(declare-fun mapDefault!18453 () ValueCell!5267)

(assert (=> b!429339 (= condMapEmpty!18453 (= (arr!12591 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5267)) mapDefault!18453)))))

(declare-fun b!429340 () Bool)

(declare-fun res!252157 () Bool)

(assert (=> b!429340 (=> (not res!252157) (not e!254294))))

(declare-datatypes ((List!7348 0))(
  ( (Nil!7345) (Cons!7344 (h!8200 (_ BitVec 64)) (t!12858 List!7348)) )
))
(declare-fun arrayNoDuplicates!0 (array!26282 (_ BitVec 32) List!7348) Bool)

(assert (=> b!429340 (= res!252157 (arrayNoDuplicates!0 lt!196248 #b00000000000000000000000000000000 Nil!7345))))

(declare-fun b!429341 () Bool)

(assert (=> b!429341 (= e!254294 e!254298)))

(declare-fun res!252163 () Bool)

(assert (=> b!429341 (=> (not res!252163) (not e!254298))))

(assert (=> b!429341 (= res!252163 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!429341 (= lt!196249 (getCurrentListMapNoExtraKeys!1390 lt!196248 lt!196252 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!429341 (= lt!196252 (array!26285 (store (arr!12591 _values!549) i!563 (ValueCellFull!5267 v!412)) (size!12943 _values!549)))))

(declare-fun lt!196246 () ListLongMap!6261)

(assert (=> b!429341 (= lt!196246 (getCurrentListMapNoExtraKeys!1390 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!429342 () Bool)

(declare-fun res!252155 () Bool)

(assert (=> b!429342 (=> (not res!252155) (not e!254299))))

(assert (=> b!429342 (= res!252155 (and (= (size!12943 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12942 _keys!709) (size!12943 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!429343 () Bool)

(declare-fun res!252162 () Bool)

(assert (=> b!429343 (=> (not res!252162) (not e!254299))))

(assert (=> b!429343 (= res!252162 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7345))))

(assert (= (and start!39788 res!252160) b!429336))

(assert (= (and b!429336 res!252154) b!429342))

(assert (= (and b!429342 res!252155) b!429330))

(assert (= (and b!429330 res!252153) b!429343))

(assert (= (and b!429343 res!252162) b!429331))

(assert (= (and b!429331 res!252165) b!429328))

(assert (= (and b!429328 res!252152) b!429326))

(assert (= (and b!429326 res!252161) b!429338))

(assert (= (and b!429338 res!252164) b!429329))

(assert (= (and b!429329 res!252156) b!429340))

(assert (= (and b!429340 res!252157) b!429327))

(assert (= (and b!429327 res!252159) b!429341))

(assert (= (and b!429341 res!252163) b!429325))

(assert (= (and b!429325 (not res!252158)) b!429337))

(assert (= (and b!429337 c!55416) b!429332))

(assert (= (and b!429337 (not c!55416)) b!429333))

(assert (= (and b!429339 condMapEmpty!18453) mapIsEmpty!18453))

(assert (= (and b!429339 (not condMapEmpty!18453)) mapNonEmpty!18453))

(get-info :version)

(assert (= (and mapNonEmpty!18453 ((_ is ValueCellFull!5267) mapValue!18453)) b!429334))

(assert (= (and b!429339 ((_ is ValueCellFull!5267) mapDefault!18453)) b!429335))

(assert (= start!39788 b!429339))

(declare-fun b_lambda!9179 () Bool)

(assert (=> (not b_lambda!9179) (not b!429337)))

(declare-fun t!12856 () Bool)

(declare-fun tb!3467 () Bool)

(assert (=> (and start!39788 (= defaultEntry!557 defaultEntry!557) t!12856) tb!3467))

(declare-fun result!6469 () Bool)

(assert (=> tb!3467 (= result!6469 tp_is_empty!11221)))

(assert (=> b!429337 t!12856))

(declare-fun b_and!17813 () Bool)

(assert (= b_and!17811 (and (=> t!12856 result!6469) b_and!17813)))

(declare-fun m!417911 () Bool)

(assert (=> b!429332 m!417911))

(declare-fun m!417913 () Bool)

(assert (=> b!429330 m!417913))

(declare-fun m!417915 () Bool)

(assert (=> b!429336 m!417915))

(declare-fun m!417917 () Bool)

(assert (=> start!39788 m!417917))

(declare-fun m!417919 () Bool)

(assert (=> start!39788 m!417919))

(declare-fun m!417921 () Bool)

(assert (=> b!429326 m!417921))

(declare-fun m!417923 () Bool)

(assert (=> mapNonEmpty!18453 m!417923))

(declare-fun m!417925 () Bool)

(assert (=> b!429325 m!417925))

(declare-fun m!417927 () Bool)

(assert (=> b!429325 m!417927))

(declare-fun m!417929 () Bool)

(assert (=> b!429325 m!417929))

(declare-fun m!417931 () Bool)

(assert (=> b!429325 m!417931))

(assert (=> b!429325 m!417925))

(declare-fun m!417933 () Bool)

(assert (=> b!429325 m!417933))

(declare-fun m!417935 () Bool)

(assert (=> b!429325 m!417935))

(declare-fun m!417937 () Bool)

(assert (=> b!429340 m!417937))

(declare-fun m!417939 () Bool)

(assert (=> b!429328 m!417939))

(declare-fun m!417941 () Bool)

(assert (=> b!429341 m!417941))

(declare-fun m!417943 () Bool)

(assert (=> b!429341 m!417943))

(declare-fun m!417945 () Bool)

(assert (=> b!429341 m!417945))

(declare-fun m!417947 () Bool)

(assert (=> b!429343 m!417947))

(declare-fun m!417949 () Bool)

(assert (=> b!429338 m!417949))

(assert (=> b!429337 m!417925))

(declare-fun m!417951 () Bool)

(assert (=> b!429337 m!417951))

(declare-fun m!417953 () Bool)

(assert (=> b!429337 m!417953))

(declare-fun m!417955 () Bool)

(assert (=> b!429337 m!417955))

(assert (=> b!429337 m!417953))

(assert (=> b!429337 m!417951))

(declare-fun m!417957 () Bool)

(assert (=> b!429337 m!417957))

(declare-fun m!417959 () Bool)

(assert (=> b!429329 m!417959))

(declare-fun m!417961 () Bool)

(assert (=> b!429329 m!417961))

(check-sat (not b!429338) (not b_next!10069) (not b!429328) (not b!429341) (not start!39788) (not mapNonEmpty!18453) (not b!429332) (not b!429337) (not b!429329) (not b_lambda!9179) tp_is_empty!11221 (not b!429340) (not b!429330) (not b!429336) b_and!17813 (not b!429325) (not b!429343))
(check-sat b_and!17813 (not b_next!10069))
