; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100282 () Bool)

(assert start!100282)

(declare-datatypes ((array!77420 0))(
  ( (array!77421 (arr!37357 (Array (_ BitVec 32) (_ BitVec 64))) (size!37895 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77420)

(declare-fun b!1196366 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!679713 () Bool)

(assert (=> b!1196366 (= e!679713 (not (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37895 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvsub (size!37895 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (bvsub (size!37895 _keys!1208) from!1455)))))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77420 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196366 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39543 0))(
  ( (Unit!39544) )
))
(declare-fun lt!542898 () Unit!39543)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77420 (_ BitVec 64) (_ BitVec 32)) Unit!39543)

(assert (=> b!1196366 (= lt!542898 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1196367 () Bool)

(declare-fun res!796208 () Bool)

(declare-fun e!679712 () Bool)

(assert (=> b!1196367 (=> (not res!796208) (not e!679712))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77420 (_ BitVec 32)) Bool)

(assert (=> b!1196367 (= res!796208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1196368 () Bool)

(declare-fun res!796209 () Bool)

(assert (=> b!1196368 (=> (not res!796209) (not e!679712))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45601 0))(
  ( (V!45602 (val!15234 Int)) )
))
(declare-datatypes ((ValueCell!14468 0))(
  ( (ValueCellFull!14468 (v!17871 V!45601)) (EmptyCell!14468) )
))
(declare-datatypes ((array!77422 0))(
  ( (array!77423 (arr!37358 (Array (_ BitVec 32) ValueCell!14468)) (size!37896 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77422)

(assert (=> b!1196368 (= res!796209 (and (= (size!37896 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37895 _keys!1208) (size!37896 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1196369 () Bool)

(declare-fun res!796205 () Bool)

(assert (=> b!1196369 (=> (not res!796205) (not e!679712))))

(assert (=> b!1196369 (= res!796205 (= (select (arr!37357 _keys!1208) i!673) k0!934))))

(declare-fun b!1196370 () Bool)

(declare-fun res!796201 () Bool)

(assert (=> b!1196370 (=> (not res!796201) (not e!679712))))

(assert (=> b!1196370 (= res!796201 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37895 _keys!1208))))))

(declare-fun b!1196371 () Bool)

(assert (=> b!1196371 (= e!679712 e!679713)))

(declare-fun res!796204 () Bool)

(assert (=> b!1196371 (=> (not res!796204) (not e!679713))))

(declare-fun lt!542897 () array!77420)

(assert (=> b!1196371 (= res!796204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542897 mask!1564))))

(assert (=> b!1196371 (= lt!542897 (array!77421 (store (arr!37357 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37895 _keys!1208)))))

(declare-fun b!1196373 () Bool)

(declare-fun e!679716 () Bool)

(declare-fun e!679715 () Bool)

(declare-fun mapRes!47369 () Bool)

(assert (=> b!1196373 (= e!679716 (and e!679715 mapRes!47369))))

(declare-fun condMapEmpty!47369 () Bool)

(declare-fun mapDefault!47369 () ValueCell!14468)

(assert (=> b!1196373 (= condMapEmpty!47369 (= (arr!37358 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14468)) mapDefault!47369)))))

(declare-fun b!1196374 () Bool)

(declare-fun tp_is_empty!30355 () Bool)

(assert (=> b!1196374 (= e!679715 tp_is_empty!30355)))

(declare-fun b!1196375 () Bool)

(declare-fun res!796203 () Bool)

(assert (=> b!1196375 (=> (not res!796203) (not e!679713))))

(declare-datatypes ((List!26376 0))(
  ( (Nil!26373) (Cons!26372 (h!27581 (_ BitVec 64)) (t!39038 List!26376)) )
))
(declare-fun arrayNoDuplicates!0 (array!77420 (_ BitVec 32) List!26376) Bool)

(assert (=> b!1196375 (= res!796203 (arrayNoDuplicates!0 lt!542897 #b00000000000000000000000000000000 Nil!26373))))

(declare-fun mapIsEmpty!47369 () Bool)

(assert (=> mapIsEmpty!47369 mapRes!47369))

(declare-fun b!1196376 () Bool)

(declare-fun e!679714 () Bool)

(assert (=> b!1196376 (= e!679714 tp_is_empty!30355)))

(declare-fun b!1196377 () Bool)

(declare-fun res!796202 () Bool)

(assert (=> b!1196377 (=> (not res!796202) (not e!679712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196377 (= res!796202 (validKeyInArray!0 k0!934))))

(declare-fun b!1196378 () Bool)

(declare-fun res!796206 () Bool)

(assert (=> b!1196378 (=> (not res!796206) (not e!679712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196378 (= res!796206 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47369 () Bool)

(declare-fun tp!89979 () Bool)

(assert (=> mapNonEmpty!47369 (= mapRes!47369 (and tp!89979 e!679714))))

(declare-fun mapKey!47369 () (_ BitVec 32))

(declare-fun mapValue!47369 () ValueCell!14468)

(declare-fun mapRest!47369 () (Array (_ BitVec 32) ValueCell!14468))

(assert (=> mapNonEmpty!47369 (= (arr!37358 _values!996) (store mapRest!47369 mapKey!47369 mapValue!47369))))

(declare-fun res!796207 () Bool)

(assert (=> start!100282 (=> (not res!796207) (not e!679712))))

(assert (=> start!100282 (= res!796207 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37895 _keys!1208))))))

(assert (=> start!100282 e!679712))

(declare-fun array_inv!28598 (array!77420) Bool)

(assert (=> start!100282 (array_inv!28598 _keys!1208)))

(assert (=> start!100282 true))

(declare-fun array_inv!28599 (array!77422) Bool)

(assert (=> start!100282 (and (array_inv!28599 _values!996) e!679716)))

(declare-fun b!1196372 () Bool)

(declare-fun res!796210 () Bool)

(assert (=> b!1196372 (=> (not res!796210) (not e!679712))))

(assert (=> b!1196372 (= res!796210 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26373))))

(assert (= (and start!100282 res!796207) b!1196378))

(assert (= (and b!1196378 res!796206) b!1196368))

(assert (= (and b!1196368 res!796209) b!1196367))

(assert (= (and b!1196367 res!796208) b!1196372))

(assert (= (and b!1196372 res!796210) b!1196370))

(assert (= (and b!1196370 res!796201) b!1196377))

(assert (= (and b!1196377 res!796202) b!1196369))

(assert (= (and b!1196369 res!796205) b!1196371))

(assert (= (and b!1196371 res!796204) b!1196375))

(assert (= (and b!1196375 res!796203) b!1196366))

(assert (= (and b!1196373 condMapEmpty!47369) mapIsEmpty!47369))

(assert (= (and b!1196373 (not condMapEmpty!47369)) mapNonEmpty!47369))

(get-info :version)

(assert (= (and mapNonEmpty!47369 ((_ is ValueCellFull!14468) mapValue!47369)) b!1196376))

(assert (= (and b!1196373 ((_ is ValueCellFull!14468) mapDefault!47369)) b!1196374))

(assert (= start!100282 b!1196373))

(declare-fun m!1103099 () Bool)

(assert (=> b!1196369 m!1103099))

(declare-fun m!1103101 () Bool)

(assert (=> mapNonEmpty!47369 m!1103101))

(declare-fun m!1103103 () Bool)

(assert (=> start!100282 m!1103103))

(declare-fun m!1103105 () Bool)

(assert (=> start!100282 m!1103105))

(declare-fun m!1103107 () Bool)

(assert (=> b!1196366 m!1103107))

(declare-fun m!1103109 () Bool)

(assert (=> b!1196366 m!1103109))

(declare-fun m!1103111 () Bool)

(assert (=> b!1196367 m!1103111))

(declare-fun m!1103113 () Bool)

(assert (=> b!1196378 m!1103113))

(declare-fun m!1103115 () Bool)

(assert (=> b!1196375 m!1103115))

(declare-fun m!1103117 () Bool)

(assert (=> b!1196371 m!1103117))

(declare-fun m!1103119 () Bool)

(assert (=> b!1196371 m!1103119))

(declare-fun m!1103121 () Bool)

(assert (=> b!1196372 m!1103121))

(declare-fun m!1103123 () Bool)

(assert (=> b!1196377 m!1103123))

(check-sat tp_is_empty!30355 (not b!1196372) (not b!1196367) (not start!100282) (not b!1196378) (not b!1196375) (not mapNonEmpty!47369) (not b!1196377) (not b!1196366) (not b!1196371))
(check-sat)
