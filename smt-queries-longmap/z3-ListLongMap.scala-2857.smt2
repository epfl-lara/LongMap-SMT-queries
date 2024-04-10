; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41174 () Bool)

(assert start!41174)

(declare-fun b_free!11043 () Bool)

(declare-fun b_next!11043 () Bool)

(assert (=> start!41174 (= b_free!11043 (not b_next!11043))))

(declare-fun tp!38964 () Bool)

(declare-fun b_and!19325 () Bool)

(assert (=> start!41174 (= tp!38964 b_and!19325)))

(declare-fun b!460123 () Bool)

(declare-fun res!275057 () Bool)

(declare-fun e!268474 () Bool)

(assert (=> b!460123 (=> (not res!275057) (not e!268474))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!460123 (= res!275057 (validMask!0 mask!1025))))

(declare-fun b!460124 () Bool)

(declare-fun res!275070 () Bool)

(assert (=> b!460124 (=> (not res!275070) (not e!268474))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!28563 0))(
  ( (array!28564 (arr!13722 (Array (_ BitVec 32) (_ BitVec 64))) (size!14074 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28563)

(assert (=> b!460124 (= res!275070 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14074 _keys!709))))))

(declare-fun b!460125 () Bool)

(declare-datatypes ((Unit!13387 0))(
  ( (Unit!13388) )
))
(declare-fun e!268473 () Unit!13387)

(declare-fun Unit!13389 () Unit!13387)

(assert (=> b!460125 (= e!268473 Unit!13389)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!208284 () Unit!13387)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28563 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13387)

(assert (=> b!460125 (= lt!208284 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!460125 false))

(declare-fun b!460126 () Bool)

(declare-fun Unit!13390 () Unit!13387)

(assert (=> b!460126 (= e!268473 Unit!13390)))

(declare-fun b!460127 () Bool)

(declare-fun e!268470 () Bool)

(assert (=> b!460127 (= e!268474 e!268470)))

(declare-fun res!275065 () Bool)

(assert (=> b!460127 (=> (not res!275065) (not e!268470))))

(declare-fun lt!208277 () array!28563)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28563 (_ BitVec 32)) Bool)

(assert (=> b!460127 (= res!275065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208277 mask!1025))))

(assert (=> b!460127 (= lt!208277 (array!28564 (store (arr!13722 _keys!709) i!563 k0!794) (size!14074 _keys!709)))))

(declare-fun b!460128 () Bool)

(declare-fun res!275063 () Bool)

(assert (=> b!460128 (=> (not res!275063) (not e!268474))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17613 0))(
  ( (V!17614 (val!6235 Int)) )
))
(declare-datatypes ((ValueCell!5847 0))(
  ( (ValueCellFull!5847 (v!8513 V!17613)) (EmptyCell!5847) )
))
(declare-datatypes ((array!28565 0))(
  ( (array!28566 (arr!13723 (Array (_ BitVec 32) ValueCell!5847)) (size!14075 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28565)

(assert (=> b!460128 (= res!275063 (and (= (size!14075 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14074 _keys!709) (size!14075 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!460129 () Bool)

(declare-fun e!268478 () Bool)

(declare-fun tp_is_empty!12381 () Bool)

(assert (=> b!460129 (= e!268478 tp_is_empty!12381)))

(declare-fun b!460130 () Bool)

(declare-fun res!275061 () Bool)

(assert (=> b!460130 (=> (not res!275061) (not e!268470))))

(assert (=> b!460130 (= res!275061 (bvsle from!863 i!563))))

(declare-fun b!460131 () Bool)

(declare-fun e!268479 () Bool)

(declare-fun e!268476 () Bool)

(assert (=> b!460131 (= e!268479 (not e!268476))))

(declare-fun res!275067 () Bool)

(assert (=> b!460131 (=> res!275067 e!268476)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!460131 (= res!275067 (not (validKeyInArray!0 (select (arr!13722 _keys!709) from!863))))))

(declare-datatypes ((tuple2!8222 0))(
  ( (tuple2!8223 (_1!4122 (_ BitVec 64)) (_2!4122 V!17613)) )
))
(declare-datatypes ((List!8294 0))(
  ( (Nil!8291) (Cons!8290 (h!9146 tuple2!8222) (t!14216 List!8294)) )
))
(declare-datatypes ((ListLongMap!7135 0))(
  ( (ListLongMap!7136 (toList!3583 List!8294)) )
))
(declare-fun lt!208283 () ListLongMap!7135)

(declare-fun lt!208272 () ListLongMap!7135)

(assert (=> b!460131 (= lt!208283 lt!208272)))

(declare-fun lt!208281 () ListLongMap!7135)

(declare-fun lt!208274 () tuple2!8222)

(declare-fun +!1619 (ListLongMap!7135 tuple2!8222) ListLongMap!7135)

(assert (=> b!460131 (= lt!208272 (+!1619 lt!208281 lt!208274))))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17613)

(declare-fun lt!208276 () array!28565)

(declare-fun minValue!515 () V!17613)

(declare-fun getCurrentListMapNoExtraKeys!1763 (array!28563 array!28565 (_ BitVec 32) (_ BitVec 32) V!17613 V!17613 (_ BitVec 32) Int) ListLongMap!7135)

(assert (=> b!460131 (= lt!208283 (getCurrentListMapNoExtraKeys!1763 lt!208277 lt!208276 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!17613)

(assert (=> b!460131 (= lt!208274 (tuple2!8223 k0!794 v!412))))

(assert (=> b!460131 (= lt!208281 (getCurrentListMapNoExtraKeys!1763 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!208280 () Unit!13387)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!775 (array!28563 array!28565 (_ BitVec 32) (_ BitVec 32) V!17613 V!17613 (_ BitVec 32) (_ BitVec 64) V!17613 (_ BitVec 32) Int) Unit!13387)

(assert (=> b!460131 (= lt!208280 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!775 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!20221 () Bool)

(declare-fun mapRes!20221 () Bool)

(assert (=> mapIsEmpty!20221 mapRes!20221))

(declare-fun b!460132 () Bool)

(declare-fun e!268471 () Bool)

(declare-fun e!268472 () Bool)

(assert (=> b!460132 (= e!268471 (and e!268472 mapRes!20221))))

(declare-fun condMapEmpty!20221 () Bool)

(declare-fun mapDefault!20221 () ValueCell!5847)

(assert (=> b!460132 (= condMapEmpty!20221 (= (arr!13723 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5847)) mapDefault!20221)))))

(declare-fun b!460133 () Bool)

(declare-fun e!268475 () Bool)

(assert (=> b!460133 (= e!268475 (bvslt i!563 (size!14075 _values!549)))))

(declare-fun lt!208279 () ListLongMap!7135)

(declare-fun lt!208285 () tuple2!8222)

(assert (=> b!460133 (= lt!208279 (+!1619 (+!1619 lt!208281 lt!208285) lt!208274))))

(declare-fun lt!208278 () V!17613)

(declare-fun lt!208286 () Unit!13387)

(declare-fun addCommutativeForDiffKeys!429 (ListLongMap!7135 (_ BitVec 64) V!17613 (_ BitVec 64) V!17613) Unit!13387)

(assert (=> b!460133 (= lt!208286 (addCommutativeForDiffKeys!429 lt!208281 k0!794 v!412 (select (arr!13722 _keys!709) from!863) lt!208278))))

(declare-fun b!460134 () Bool)

(declare-fun res!275058 () Bool)

(assert (=> b!460134 (=> (not res!275058) (not e!268474))))

(assert (=> b!460134 (= res!275058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!460135 () Bool)

(assert (=> b!460135 (= e!268470 e!268479)))

(declare-fun res!275069 () Bool)

(assert (=> b!460135 (=> (not res!275069) (not e!268479))))

(assert (=> b!460135 (= res!275069 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!208275 () ListLongMap!7135)

(assert (=> b!460135 (= lt!208275 (getCurrentListMapNoExtraKeys!1763 lt!208277 lt!208276 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!460135 (= lt!208276 (array!28566 (store (arr!13723 _values!549) i!563 (ValueCellFull!5847 v!412)) (size!14075 _values!549)))))

(declare-fun lt!208273 () ListLongMap!7135)

(assert (=> b!460135 (= lt!208273 (getCurrentListMapNoExtraKeys!1763 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!460136 () Bool)

(declare-fun res!275062 () Bool)

(assert (=> b!460136 (=> (not res!275062) (not e!268470))))

(declare-datatypes ((List!8295 0))(
  ( (Nil!8292) (Cons!8291 (h!9147 (_ BitVec 64)) (t!14217 List!8295)) )
))
(declare-fun arrayNoDuplicates!0 (array!28563 (_ BitVec 32) List!8295) Bool)

(assert (=> b!460136 (= res!275062 (arrayNoDuplicates!0 lt!208277 #b00000000000000000000000000000000 Nil!8292))))

(declare-fun b!460137 () Bool)

(assert (=> b!460137 (= e!268472 tp_is_empty!12381)))

(declare-fun b!460138 () Bool)

(declare-fun res!275071 () Bool)

(assert (=> b!460138 (=> (not res!275071) (not e!268474))))

(assert (=> b!460138 (= res!275071 (or (= (select (arr!13722 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13722 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460139 () Bool)

(assert (=> b!460139 (= e!268476 e!268475)))

(declare-fun res!275064 () Bool)

(assert (=> b!460139 (=> res!275064 e!268475)))

(assert (=> b!460139 (= res!275064 (= k0!794 (select (arr!13722 _keys!709) from!863)))))

(assert (=> b!460139 (not (= (select (arr!13722 _keys!709) from!863) k0!794))))

(declare-fun lt!208282 () Unit!13387)

(assert (=> b!460139 (= lt!208282 e!268473)))

(declare-fun c!56513 () Bool)

(assert (=> b!460139 (= c!56513 (= (select (arr!13722 _keys!709) from!863) k0!794))))

(assert (=> b!460139 (= lt!208275 lt!208279)))

(assert (=> b!460139 (= lt!208279 (+!1619 lt!208272 lt!208285))))

(assert (=> b!460139 (= lt!208285 (tuple2!8223 (select (arr!13722 _keys!709) from!863) lt!208278))))

(declare-fun get!6772 (ValueCell!5847 V!17613) V!17613)

(declare-fun dynLambda!904 (Int (_ BitVec 64)) V!17613)

(assert (=> b!460139 (= lt!208278 (get!6772 (select (arr!13723 _values!549) from!863) (dynLambda!904 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460140 () Bool)

(declare-fun res!275068 () Bool)

(assert (=> b!460140 (=> (not res!275068) (not e!268474))))

(declare-fun arrayContainsKey!0 (array!28563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!460140 (= res!275068 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!460141 () Bool)

(declare-fun res!275059 () Bool)

(assert (=> b!460141 (=> (not res!275059) (not e!268474))))

(assert (=> b!460141 (= res!275059 (validKeyInArray!0 k0!794))))

(declare-fun b!460142 () Bool)

(declare-fun res!275060 () Bool)

(assert (=> b!460142 (=> (not res!275060) (not e!268474))))

(assert (=> b!460142 (= res!275060 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8292))))

(declare-fun res!275066 () Bool)

(assert (=> start!41174 (=> (not res!275066) (not e!268474))))

(assert (=> start!41174 (= res!275066 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14074 _keys!709))))))

(assert (=> start!41174 e!268474))

(assert (=> start!41174 tp_is_empty!12381))

(assert (=> start!41174 tp!38964))

(assert (=> start!41174 true))

(declare-fun array_inv!9924 (array!28565) Bool)

(assert (=> start!41174 (and (array_inv!9924 _values!549) e!268471)))

(declare-fun array_inv!9925 (array!28563) Bool)

(assert (=> start!41174 (array_inv!9925 _keys!709)))

(declare-fun mapNonEmpty!20221 () Bool)

(declare-fun tp!38965 () Bool)

(assert (=> mapNonEmpty!20221 (= mapRes!20221 (and tp!38965 e!268478))))

(declare-fun mapRest!20221 () (Array (_ BitVec 32) ValueCell!5847))

(declare-fun mapValue!20221 () ValueCell!5847)

(declare-fun mapKey!20221 () (_ BitVec 32))

(assert (=> mapNonEmpty!20221 (= (arr!13723 _values!549) (store mapRest!20221 mapKey!20221 mapValue!20221))))

(assert (= (and start!41174 res!275066) b!460123))

(assert (= (and b!460123 res!275057) b!460128))

(assert (= (and b!460128 res!275063) b!460134))

(assert (= (and b!460134 res!275058) b!460142))

(assert (= (and b!460142 res!275060) b!460124))

(assert (= (and b!460124 res!275070) b!460141))

(assert (= (and b!460141 res!275059) b!460138))

(assert (= (and b!460138 res!275071) b!460140))

(assert (= (and b!460140 res!275068) b!460127))

(assert (= (and b!460127 res!275065) b!460136))

(assert (= (and b!460136 res!275062) b!460130))

(assert (= (and b!460130 res!275061) b!460135))

(assert (= (and b!460135 res!275069) b!460131))

(assert (= (and b!460131 (not res!275067)) b!460139))

(assert (= (and b!460139 c!56513) b!460125))

(assert (= (and b!460139 (not c!56513)) b!460126))

(assert (= (and b!460139 (not res!275064)) b!460133))

(assert (= (and b!460132 condMapEmpty!20221) mapIsEmpty!20221))

(assert (= (and b!460132 (not condMapEmpty!20221)) mapNonEmpty!20221))

(get-info :version)

(assert (= (and mapNonEmpty!20221 ((_ is ValueCellFull!5847) mapValue!20221)) b!460129))

(assert (= (and b!460132 ((_ is ValueCellFull!5847) mapDefault!20221)) b!460137))

(assert (= start!41174 b!460132))

(declare-fun b_lambda!9877 () Bool)

(assert (=> (not b_lambda!9877) (not b!460139)))

(declare-fun t!14215 () Bool)

(declare-fun tb!3879 () Bool)

(assert (=> (and start!41174 (= defaultEntry!557 defaultEntry!557) t!14215) tb!3879))

(declare-fun result!7303 () Bool)

(assert (=> tb!3879 (= result!7303 tp_is_empty!12381)))

(assert (=> b!460139 t!14215))

(declare-fun b_and!19327 () Bool)

(assert (= b_and!19325 (and (=> t!14215 result!7303) b_and!19327)))

(declare-fun m!443335 () Bool)

(assert (=> b!460139 m!443335))

(declare-fun m!443337 () Bool)

(assert (=> b!460139 m!443337))

(declare-fun m!443339 () Bool)

(assert (=> b!460139 m!443339))

(declare-fun m!443341 () Bool)

(assert (=> b!460139 m!443341))

(assert (=> b!460139 m!443339))

(assert (=> b!460139 m!443337))

(declare-fun m!443343 () Bool)

(assert (=> b!460139 m!443343))

(declare-fun m!443345 () Bool)

(assert (=> b!460125 m!443345))

(declare-fun m!443347 () Bool)

(assert (=> start!41174 m!443347))

(declare-fun m!443349 () Bool)

(assert (=> start!41174 m!443349))

(declare-fun m!443351 () Bool)

(assert (=> b!460142 m!443351))

(declare-fun m!443353 () Bool)

(assert (=> mapNonEmpty!20221 m!443353))

(declare-fun m!443355 () Bool)

(assert (=> b!460133 m!443355))

(assert (=> b!460133 m!443355))

(declare-fun m!443357 () Bool)

(assert (=> b!460133 m!443357))

(assert (=> b!460133 m!443335))

(assert (=> b!460133 m!443335))

(declare-fun m!443359 () Bool)

(assert (=> b!460133 m!443359))

(declare-fun m!443361 () Bool)

(assert (=> b!460127 m!443361))

(declare-fun m!443363 () Bool)

(assert (=> b!460127 m!443363))

(declare-fun m!443365 () Bool)

(assert (=> b!460141 m!443365))

(declare-fun m!443367 () Bool)

(assert (=> b!460123 m!443367))

(declare-fun m!443369 () Bool)

(assert (=> b!460138 m!443369))

(assert (=> b!460131 m!443335))

(declare-fun m!443371 () Bool)

(assert (=> b!460131 m!443371))

(declare-fun m!443373 () Bool)

(assert (=> b!460131 m!443373))

(declare-fun m!443375 () Bool)

(assert (=> b!460131 m!443375))

(assert (=> b!460131 m!443335))

(declare-fun m!443377 () Bool)

(assert (=> b!460131 m!443377))

(declare-fun m!443379 () Bool)

(assert (=> b!460131 m!443379))

(declare-fun m!443381 () Bool)

(assert (=> b!460135 m!443381))

(declare-fun m!443383 () Bool)

(assert (=> b!460135 m!443383))

(declare-fun m!443385 () Bool)

(assert (=> b!460135 m!443385))

(declare-fun m!443387 () Bool)

(assert (=> b!460136 m!443387))

(declare-fun m!443389 () Bool)

(assert (=> b!460134 m!443389))

(declare-fun m!443391 () Bool)

(assert (=> b!460140 m!443391))

(check-sat (not b!460136) (not b!460140) (not start!41174) tp_is_empty!12381 (not b!460135) (not b!460131) (not b!460142) (not mapNonEmpty!20221) (not b!460139) (not b!460123) (not b_lambda!9877) (not b_next!11043) (not b!460125) (not b!460141) (not b!460133) b_and!19327 (not b!460127) (not b!460134))
(check-sat b_and!19327 (not b_next!11043))
