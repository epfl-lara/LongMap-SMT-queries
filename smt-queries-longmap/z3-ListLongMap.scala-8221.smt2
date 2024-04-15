; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100228 () Bool)

(assert start!100228)

(declare-fun res!795398 () Bool)

(declare-fun e!679226 () Bool)

(assert (=> start!100228 (=> (not res!795398) (not e!679226))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77314 0))(
  ( (array!77315 (arr!37304 (Array (_ BitVec 32) (_ BitVec 64))) (size!37842 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77314)

(assert (=> start!100228 (= res!795398 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37842 _keys!1208))))))

(assert (=> start!100228 e!679226))

(declare-fun array_inv!28556 (array!77314) Bool)

(assert (=> start!100228 (array_inv!28556 _keys!1208)))

(assert (=> start!100228 true))

(declare-datatypes ((V!45529 0))(
  ( (V!45530 (val!15207 Int)) )
))
(declare-datatypes ((ValueCell!14441 0))(
  ( (ValueCellFull!14441 (v!17844 V!45529)) (EmptyCell!14441) )
))
(declare-datatypes ((array!77316 0))(
  ( (array!77317 (arr!37305 (Array (_ BitVec 32) ValueCell!14441)) (size!37843 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77316)

(declare-fun e!679230 () Bool)

(declare-fun array_inv!28557 (array!77316) Bool)

(assert (=> start!100228 (and (array_inv!28557 _values!996) e!679230)))

(declare-fun b!1195313 () Bool)

(declare-fun res!795395 () Bool)

(assert (=> b!1195313 (=> (not res!795395) (not e!679226))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1195313 (= res!795395 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37842 _keys!1208))))))

(declare-fun b!1195314 () Bool)

(declare-fun res!795399 () Bool)

(assert (=> b!1195314 (=> (not res!795399) (not e!679226))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195314 (= res!795399 (validKeyInArray!0 k0!934))))

(declare-fun b!1195315 () Bool)

(declare-fun e!679228 () Bool)

(declare-fun tp_is_empty!30301 () Bool)

(assert (=> b!1195315 (= e!679228 tp_is_empty!30301)))

(declare-fun b!1195316 () Bool)

(declare-fun res!795396 () Bool)

(assert (=> b!1195316 (=> (not res!795396) (not e!679226))))

(assert (=> b!1195316 (= res!795396 (= (select (arr!37304 _keys!1208) i!673) k0!934))))

(declare-fun b!1195317 () Bool)

(declare-fun res!795394 () Bool)

(assert (=> b!1195317 (=> (not res!795394) (not e!679226))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1195317 (= res!795394 (and (= (size!37843 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37842 _keys!1208) (size!37843 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195318 () Bool)

(declare-fun res!795397 () Bool)

(assert (=> b!1195318 (=> (not res!795397) (not e!679226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195318 (= res!795397 (validMask!0 mask!1564))))

(declare-fun b!1195319 () Bool)

(declare-fun e!679227 () Bool)

(assert (=> b!1195319 (= e!679227 (not true))))

(declare-fun arrayContainsKey!0 (array!77314 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195319 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39503 0))(
  ( (Unit!39504) )
))
(declare-fun lt!542736 () Unit!39503)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77314 (_ BitVec 64) (_ BitVec 32)) Unit!39503)

(assert (=> b!1195319 (= lt!542736 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1195320 () Bool)

(declare-fun res!795391 () Bool)

(assert (=> b!1195320 (=> (not res!795391) (not e!679226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77314 (_ BitVec 32)) Bool)

(assert (=> b!1195320 (= res!795391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195321 () Bool)

(declare-fun e!679229 () Bool)

(assert (=> b!1195321 (= e!679229 tp_is_empty!30301)))

(declare-fun mapNonEmpty!47288 () Bool)

(declare-fun mapRes!47288 () Bool)

(declare-fun tp!89898 () Bool)

(assert (=> mapNonEmpty!47288 (= mapRes!47288 (and tp!89898 e!679229))))

(declare-fun mapKey!47288 () (_ BitVec 32))

(declare-fun mapValue!47288 () ValueCell!14441)

(declare-fun mapRest!47288 () (Array (_ BitVec 32) ValueCell!14441))

(assert (=> mapNonEmpty!47288 (= (arr!37305 _values!996) (store mapRest!47288 mapKey!47288 mapValue!47288))))

(declare-fun b!1195322 () Bool)

(declare-fun res!795393 () Bool)

(assert (=> b!1195322 (=> (not res!795393) (not e!679226))))

(declare-datatypes ((List!26354 0))(
  ( (Nil!26351) (Cons!26350 (h!27559 (_ BitVec 64)) (t!39016 List!26354)) )
))
(declare-fun arrayNoDuplicates!0 (array!77314 (_ BitVec 32) List!26354) Bool)

(assert (=> b!1195322 (= res!795393 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26351))))

(declare-fun b!1195323 () Bool)

(assert (=> b!1195323 (= e!679230 (and e!679228 mapRes!47288))))

(declare-fun condMapEmpty!47288 () Bool)

(declare-fun mapDefault!47288 () ValueCell!14441)

(assert (=> b!1195323 (= condMapEmpty!47288 (= (arr!37305 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14441)) mapDefault!47288)))))

(declare-fun b!1195324 () Bool)

(assert (=> b!1195324 (= e!679226 e!679227)))

(declare-fun res!795400 () Bool)

(assert (=> b!1195324 (=> (not res!795400) (not e!679227))))

(declare-fun lt!542735 () array!77314)

(assert (=> b!1195324 (= res!795400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542735 mask!1564))))

(assert (=> b!1195324 (= lt!542735 (array!77315 (store (arr!37304 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37842 _keys!1208)))))

(declare-fun mapIsEmpty!47288 () Bool)

(assert (=> mapIsEmpty!47288 mapRes!47288))

(declare-fun b!1195325 () Bool)

(declare-fun res!795392 () Bool)

(assert (=> b!1195325 (=> (not res!795392) (not e!679227))))

(assert (=> b!1195325 (= res!795392 (arrayNoDuplicates!0 lt!542735 #b00000000000000000000000000000000 Nil!26351))))

(assert (= (and start!100228 res!795398) b!1195318))

(assert (= (and b!1195318 res!795397) b!1195317))

(assert (= (and b!1195317 res!795394) b!1195320))

(assert (= (and b!1195320 res!795391) b!1195322))

(assert (= (and b!1195322 res!795393) b!1195313))

(assert (= (and b!1195313 res!795395) b!1195314))

(assert (= (and b!1195314 res!795399) b!1195316))

(assert (= (and b!1195316 res!795396) b!1195324))

(assert (= (and b!1195324 res!795400) b!1195325))

(assert (= (and b!1195325 res!795392) b!1195319))

(assert (= (and b!1195323 condMapEmpty!47288) mapIsEmpty!47288))

(assert (= (and b!1195323 (not condMapEmpty!47288)) mapNonEmpty!47288))

(get-info :version)

(assert (= (and mapNonEmpty!47288 ((_ is ValueCellFull!14441) mapValue!47288)) b!1195321))

(assert (= (and b!1195323 ((_ is ValueCellFull!14441) mapDefault!47288)) b!1195315))

(assert (= start!100228 b!1195323))

(declare-fun m!1102397 () Bool)

(assert (=> start!100228 m!1102397))

(declare-fun m!1102399 () Bool)

(assert (=> start!100228 m!1102399))

(declare-fun m!1102401 () Bool)

(assert (=> b!1195325 m!1102401))

(declare-fun m!1102403 () Bool)

(assert (=> b!1195324 m!1102403))

(declare-fun m!1102405 () Bool)

(assert (=> b!1195324 m!1102405))

(declare-fun m!1102407 () Bool)

(assert (=> b!1195322 m!1102407))

(declare-fun m!1102409 () Bool)

(assert (=> b!1195319 m!1102409))

(declare-fun m!1102411 () Bool)

(assert (=> b!1195319 m!1102411))

(declare-fun m!1102413 () Bool)

(assert (=> b!1195316 m!1102413))

(declare-fun m!1102415 () Bool)

(assert (=> b!1195320 m!1102415))

(declare-fun m!1102417 () Bool)

(assert (=> mapNonEmpty!47288 m!1102417))

(declare-fun m!1102419 () Bool)

(assert (=> b!1195318 m!1102419))

(declare-fun m!1102421 () Bool)

(assert (=> b!1195314 m!1102421))

(check-sat (not b!1195320) tp_is_empty!30301 (not mapNonEmpty!47288) (not b!1195324) (not b!1195325) (not b!1195318) (not start!100228) (not b!1195314) (not b!1195322) (not b!1195319))
(check-sat)
