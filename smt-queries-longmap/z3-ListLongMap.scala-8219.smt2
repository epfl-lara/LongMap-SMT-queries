; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100224 () Bool)

(assert start!100224)

(declare-fun b!1195242 () Bool)

(declare-fun res!795312 () Bool)

(declare-fun e!679214 () Bool)

(assert (=> b!1195242 (=> (not res!795312) (not e!679214))))

(declare-datatypes ((array!77363 0))(
  ( (array!77364 (arr!37328 (Array (_ BitVec 32) (_ BitVec 64))) (size!37864 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77363)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77363 (_ BitVec 32)) Bool)

(assert (=> b!1195242 (= res!795312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195243 () Bool)

(declare-fun res!795309 () Bool)

(assert (=> b!1195243 (=> (not res!795309) (not e!679214))))

(declare-datatypes ((List!26275 0))(
  ( (Nil!26272) (Cons!26271 (h!27480 (_ BitVec 64)) (t!38946 List!26275)) )
))
(declare-fun arrayNoDuplicates!0 (array!77363 (_ BitVec 32) List!26275) Bool)

(assert (=> b!1195243 (= res!795309 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26272))))

(declare-fun b!1195244 () Bool)

(declare-fun e!679217 () Bool)

(declare-fun tp_is_empty!30291 () Bool)

(assert (=> b!1195244 (= e!679217 tp_is_empty!30291)))

(declare-fun res!795308 () Bool)

(assert (=> start!100224 (=> (not res!795308) (not e!679214))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100224 (= res!795308 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37864 _keys!1208))))))

(assert (=> start!100224 e!679214))

(declare-fun array_inv!28452 (array!77363) Bool)

(assert (=> start!100224 (array_inv!28452 _keys!1208)))

(assert (=> start!100224 true))

(declare-datatypes ((V!45515 0))(
  ( (V!45516 (val!15202 Int)) )
))
(declare-datatypes ((ValueCell!14436 0))(
  ( (ValueCellFull!14436 (v!17840 V!45515)) (EmptyCell!14436) )
))
(declare-datatypes ((array!77365 0))(
  ( (array!77366 (arr!37329 (Array (_ BitVec 32) ValueCell!14436)) (size!37865 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77365)

(declare-fun e!679216 () Bool)

(declare-fun array_inv!28453 (array!77365) Bool)

(assert (=> start!100224 (and (array_inv!28453 _values!996) e!679216)))

(declare-fun b!1195245 () Bool)

(declare-fun res!795313 () Bool)

(declare-fun e!679215 () Bool)

(assert (=> b!1195245 (=> (not res!795313) (not e!679215))))

(declare-fun lt!542897 () array!77363)

(assert (=> b!1195245 (= res!795313 (arrayNoDuplicates!0 lt!542897 #b00000000000000000000000000000000 Nil!26272))))

(declare-fun mapNonEmpty!47273 () Bool)

(declare-fun mapRes!47273 () Bool)

(declare-fun tp!89883 () Bool)

(declare-fun e!679219 () Bool)

(assert (=> mapNonEmpty!47273 (= mapRes!47273 (and tp!89883 e!679219))))

(declare-fun mapRest!47273 () (Array (_ BitVec 32) ValueCell!14436))

(declare-fun mapKey!47273 () (_ BitVec 32))

(declare-fun mapValue!47273 () ValueCell!14436)

(assert (=> mapNonEmpty!47273 (= (arr!37329 _values!996) (store mapRest!47273 mapKey!47273 mapValue!47273))))

(declare-fun b!1195246 () Bool)

(assert (=> b!1195246 (= e!679216 (and e!679217 mapRes!47273))))

(declare-fun condMapEmpty!47273 () Bool)

(declare-fun mapDefault!47273 () ValueCell!14436)

(assert (=> b!1195246 (= condMapEmpty!47273 (= (arr!37329 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14436)) mapDefault!47273)))))

(declare-fun b!1195247 () Bool)

(declare-fun res!795311 () Bool)

(assert (=> b!1195247 (=> (not res!795311) (not e!679214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195247 (= res!795311 (validMask!0 mask!1564))))

(declare-fun b!1195248 () Bool)

(assert (=> b!1195248 (= e!679214 e!679215)))

(declare-fun res!795307 () Bool)

(assert (=> b!1195248 (=> (not res!795307) (not e!679215))))

(assert (=> b!1195248 (= res!795307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542897 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1195248 (= lt!542897 (array!77364 (store (arr!37328 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37864 _keys!1208)))))

(declare-fun b!1195249 () Bool)

(assert (=> b!1195249 (= e!679215 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195249 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39624 0))(
  ( (Unit!39625) )
))
(declare-fun lt!542898 () Unit!39624)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77363 (_ BitVec 64) (_ BitVec 32)) Unit!39624)

(assert (=> b!1195249 (= lt!542898 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1195250 () Bool)

(declare-fun res!795316 () Bool)

(assert (=> b!1195250 (=> (not res!795316) (not e!679214))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1195250 (= res!795316 (and (= (size!37865 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37864 _keys!1208) (size!37865 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195251 () Bool)

(declare-fun res!795314 () Bool)

(assert (=> b!1195251 (=> (not res!795314) (not e!679214))))

(assert (=> b!1195251 (= res!795314 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37864 _keys!1208))))))

(declare-fun mapIsEmpty!47273 () Bool)

(assert (=> mapIsEmpty!47273 mapRes!47273))

(declare-fun b!1195252 () Bool)

(declare-fun res!795310 () Bool)

(assert (=> b!1195252 (=> (not res!795310) (not e!679214))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195252 (= res!795310 (validKeyInArray!0 k0!934))))

(declare-fun b!1195253 () Bool)

(declare-fun res!795315 () Bool)

(assert (=> b!1195253 (=> (not res!795315) (not e!679214))))

(assert (=> b!1195253 (= res!795315 (= (select (arr!37328 _keys!1208) i!673) k0!934))))

(declare-fun b!1195254 () Bool)

(assert (=> b!1195254 (= e!679219 tp_is_empty!30291)))

(assert (= (and start!100224 res!795308) b!1195247))

(assert (= (and b!1195247 res!795311) b!1195250))

(assert (= (and b!1195250 res!795316) b!1195242))

(assert (= (and b!1195242 res!795312) b!1195243))

(assert (= (and b!1195243 res!795309) b!1195251))

(assert (= (and b!1195251 res!795314) b!1195252))

(assert (= (and b!1195252 res!795310) b!1195253))

(assert (= (and b!1195253 res!795315) b!1195248))

(assert (= (and b!1195248 res!795307) b!1195245))

(assert (= (and b!1195245 res!795313) b!1195249))

(assert (= (and b!1195246 condMapEmpty!47273) mapIsEmpty!47273))

(assert (= (and b!1195246 (not condMapEmpty!47273)) mapNonEmpty!47273))

(get-info :version)

(assert (= (and mapNonEmpty!47273 ((_ is ValueCellFull!14436) mapValue!47273)) b!1195254))

(assert (= (and b!1195246 ((_ is ValueCellFull!14436) mapDefault!47273)) b!1195244))

(assert (= start!100224 b!1195246))

(declare-fun m!1102877 () Bool)

(assert (=> b!1195243 m!1102877))

(declare-fun m!1102879 () Bool)

(assert (=> b!1195245 m!1102879))

(declare-fun m!1102881 () Bool)

(assert (=> b!1195249 m!1102881))

(declare-fun m!1102883 () Bool)

(assert (=> b!1195249 m!1102883))

(declare-fun m!1102885 () Bool)

(assert (=> b!1195248 m!1102885))

(declare-fun m!1102887 () Bool)

(assert (=> b!1195248 m!1102887))

(declare-fun m!1102889 () Bool)

(assert (=> b!1195253 m!1102889))

(declare-fun m!1102891 () Bool)

(assert (=> b!1195247 m!1102891))

(declare-fun m!1102893 () Bool)

(assert (=> b!1195242 m!1102893))

(declare-fun m!1102895 () Bool)

(assert (=> b!1195252 m!1102895))

(declare-fun m!1102897 () Bool)

(assert (=> mapNonEmpty!47273 m!1102897))

(declare-fun m!1102899 () Bool)

(assert (=> start!100224 m!1102899))

(declare-fun m!1102901 () Bool)

(assert (=> start!100224 m!1102901))

(check-sat (not start!100224) tp_is_empty!30291 (not mapNonEmpty!47273) (not b!1195249) (not b!1195248) (not b!1195245) (not b!1195242) (not b!1195243) (not b!1195247) (not b!1195252))
(check-sat)
