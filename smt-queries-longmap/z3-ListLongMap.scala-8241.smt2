; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100396 () Bool)

(assert start!100396)

(declare-fun b_free!25719 () Bool)

(declare-fun b_next!25719 () Bool)

(assert (=> start!100396 (= b_free!25719 (not b_next!25719))))

(declare-fun tp!90147 () Bool)

(declare-fun b_and!42335 () Bool)

(assert (=> start!100396 (= tp!90147 b_and!42335)))

(declare-fun b!1198230 () Bool)

(declare-fun res!797448 () Bool)

(declare-fun e!680665 () Bool)

(assert (=> b!1198230 (=> (not res!797448) (not e!680665))))

(declare-datatypes ((array!77625 0))(
  ( (array!77626 (arr!37457 (Array (_ BitVec 32) (_ BitVec 64))) (size!37993 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77625)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1198230 (= res!797448 (= (select (arr!37457 _keys!1208) i!673) k0!934))))

(declare-fun res!797442 () Bool)

(assert (=> start!100396 (=> (not res!797442) (not e!680665))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100396 (= res!797442 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37993 _keys!1208))))))

(assert (=> start!100396 e!680665))

(declare-fun tp_is_empty!30423 () Bool)

(assert (=> start!100396 tp_is_empty!30423))

(declare-fun array_inv!28544 (array!77625) Bool)

(assert (=> start!100396 (array_inv!28544 _keys!1208)))

(assert (=> start!100396 true))

(assert (=> start!100396 tp!90147))

(declare-datatypes ((V!45691 0))(
  ( (V!45692 (val!15268 Int)) )
))
(declare-datatypes ((ValueCell!14502 0))(
  ( (ValueCellFull!14502 (v!17906 V!45691)) (EmptyCell!14502) )
))
(declare-datatypes ((array!77627 0))(
  ( (array!77628 (arr!37458 (Array (_ BitVec 32) ValueCell!14502)) (size!37994 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77627)

(declare-fun e!680663 () Bool)

(declare-fun array_inv!28545 (array!77627) Bool)

(assert (=> start!100396 (and (array_inv!28545 _values!996) e!680663)))

(declare-fun b!1198231 () Bool)

(declare-fun e!680662 () Bool)

(assert (=> b!1198231 (= e!680665 e!680662)))

(declare-fun res!797447 () Bool)

(assert (=> b!1198231 (=> (not res!797447) (not e!680662))))

(declare-fun lt!543449 () array!77625)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77625 (_ BitVec 32)) Bool)

(assert (=> b!1198231 (= res!797447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543449 mask!1564))))

(assert (=> b!1198231 (= lt!543449 (array!77626 (store (arr!37457 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37993 _keys!1208)))))

(declare-fun b!1198232 () Bool)

(declare-fun e!680666 () Bool)

(assert (=> b!1198232 (= e!680666 tp_is_empty!30423)))

(declare-fun mapIsEmpty!47477 () Bool)

(declare-fun mapRes!47477 () Bool)

(assert (=> mapIsEmpty!47477 mapRes!47477))

(declare-fun b!1198233 () Bool)

(declare-fun e!680664 () Bool)

(assert (=> b!1198233 (= e!680664 true)))

(declare-fun zeroValue!944 () V!45691)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19534 0))(
  ( (tuple2!19535 (_1!9778 (_ BitVec 64)) (_2!9778 V!45691)) )
))
(declare-datatypes ((List!26350 0))(
  ( (Nil!26347) (Cons!26346 (h!27555 tuple2!19534) (t!39057 List!26350)) )
))
(declare-datatypes ((ListLongMap!17503 0))(
  ( (ListLongMap!17504 (toList!8767 List!26350)) )
))
(declare-fun lt!543451 () ListLongMap!17503)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45691)

(declare-fun getCurrentListMapNoExtraKeys!5206 (array!77625 array!77627 (_ BitVec 32) (_ BitVec 32) V!45691 V!45691 (_ BitVec 32) Int) ListLongMap!17503)

(assert (=> b!1198233 (= lt!543451 (getCurrentListMapNoExtraKeys!5206 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!47477 () Bool)

(declare-fun tp!90146 () Bool)

(assert (=> mapNonEmpty!47477 (= mapRes!47477 (and tp!90146 e!680666))))

(declare-fun mapRest!47477 () (Array (_ BitVec 32) ValueCell!14502))

(declare-fun mapKey!47477 () (_ BitVec 32))

(declare-fun mapValue!47477 () ValueCell!14502)

(assert (=> mapNonEmpty!47477 (= (arr!37458 _values!996) (store mapRest!47477 mapKey!47477 mapValue!47477))))

(declare-fun b!1198234 () Bool)

(declare-fun res!797441 () Bool)

(assert (=> b!1198234 (=> (not res!797441) (not e!680665))))

(declare-datatypes ((List!26351 0))(
  ( (Nil!26348) (Cons!26347 (h!27556 (_ BitVec 64)) (t!39058 List!26351)) )
))
(declare-fun arrayNoDuplicates!0 (array!77625 (_ BitVec 32) List!26351) Bool)

(assert (=> b!1198234 (= res!797441 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26348))))

(declare-fun b!1198235 () Bool)

(declare-fun res!797445 () Bool)

(assert (=> b!1198235 (=> (not res!797445) (not e!680665))))

(assert (=> b!1198235 (= res!797445 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37993 _keys!1208))))))

(declare-fun b!1198236 () Bool)

(declare-fun e!680668 () Bool)

(assert (=> b!1198236 (= e!680663 (and e!680668 mapRes!47477))))

(declare-fun condMapEmpty!47477 () Bool)

(declare-fun mapDefault!47477 () ValueCell!14502)

(assert (=> b!1198236 (= condMapEmpty!47477 (= (arr!37458 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14502)) mapDefault!47477)))))

(declare-fun b!1198237 () Bool)

(declare-fun res!797449 () Bool)

(assert (=> b!1198237 (=> (not res!797449) (not e!680665))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198237 (= res!797449 (validKeyInArray!0 k0!934))))

(declare-fun b!1198238 () Bool)

(declare-fun res!797450 () Bool)

(assert (=> b!1198238 (=> (not res!797450) (not e!680665))))

(assert (=> b!1198238 (= res!797450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198239 () Bool)

(assert (=> b!1198239 (= e!680668 tp_is_empty!30423)))

(declare-fun b!1198240 () Bool)

(declare-fun res!797444 () Bool)

(assert (=> b!1198240 (=> (not res!797444) (not e!680662))))

(assert (=> b!1198240 (= res!797444 (arrayNoDuplicates!0 lt!543449 #b00000000000000000000000000000000 Nil!26348))))

(declare-fun b!1198241 () Bool)

(declare-fun res!797446 () Bool)

(assert (=> b!1198241 (=> (not res!797446) (not e!680665))))

(assert (=> b!1198241 (= res!797446 (and (= (size!37994 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37993 _keys!1208) (size!37994 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1198242 () Bool)

(declare-fun res!797451 () Bool)

(assert (=> b!1198242 (=> (not res!797451) (not e!680665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198242 (= res!797451 (validMask!0 mask!1564))))

(declare-fun b!1198243 () Bool)

(assert (=> b!1198243 (= e!680662 (not e!680664))))

(declare-fun res!797443 () Bool)

(assert (=> b!1198243 (=> res!797443 e!680664)))

(assert (=> b!1198243 (= res!797443 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198243 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39728 0))(
  ( (Unit!39729) )
))
(declare-fun lt!543450 () Unit!39728)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77625 (_ BitVec 64) (_ BitVec 32)) Unit!39728)

(assert (=> b!1198243 (= lt!543450 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!100396 res!797442) b!1198242))

(assert (= (and b!1198242 res!797451) b!1198241))

(assert (= (and b!1198241 res!797446) b!1198238))

(assert (= (and b!1198238 res!797450) b!1198234))

(assert (= (and b!1198234 res!797441) b!1198235))

(assert (= (and b!1198235 res!797445) b!1198237))

(assert (= (and b!1198237 res!797449) b!1198230))

(assert (= (and b!1198230 res!797448) b!1198231))

(assert (= (and b!1198231 res!797447) b!1198240))

(assert (= (and b!1198240 res!797444) b!1198243))

(assert (= (and b!1198243 (not res!797443)) b!1198233))

(assert (= (and b!1198236 condMapEmpty!47477) mapIsEmpty!47477))

(assert (= (and b!1198236 (not condMapEmpty!47477)) mapNonEmpty!47477))

(get-info :version)

(assert (= (and mapNonEmpty!47477 ((_ is ValueCellFull!14502) mapValue!47477)) b!1198232))

(assert (= (and b!1198236 ((_ is ValueCellFull!14502) mapDefault!47477)) b!1198239))

(assert (= start!100396 b!1198236))

(declare-fun m!1105065 () Bool)

(assert (=> b!1198243 m!1105065))

(declare-fun m!1105067 () Bool)

(assert (=> b!1198243 m!1105067))

(declare-fun m!1105069 () Bool)

(assert (=> b!1198238 m!1105069))

(declare-fun m!1105071 () Bool)

(assert (=> b!1198237 m!1105071))

(declare-fun m!1105073 () Bool)

(assert (=> b!1198231 m!1105073))

(declare-fun m!1105075 () Bool)

(assert (=> b!1198231 m!1105075))

(declare-fun m!1105077 () Bool)

(assert (=> mapNonEmpty!47477 m!1105077))

(declare-fun m!1105079 () Bool)

(assert (=> b!1198233 m!1105079))

(declare-fun m!1105081 () Bool)

(assert (=> b!1198234 m!1105081))

(declare-fun m!1105083 () Bool)

(assert (=> b!1198242 m!1105083))

(declare-fun m!1105085 () Bool)

(assert (=> start!100396 m!1105085))

(declare-fun m!1105087 () Bool)

(assert (=> start!100396 m!1105087))

(declare-fun m!1105089 () Bool)

(assert (=> b!1198230 m!1105089))

(declare-fun m!1105091 () Bool)

(assert (=> b!1198240 m!1105091))

(check-sat (not b!1198240) (not b!1198243) (not start!100396) (not b!1198231) (not b!1198233) (not b_next!25719) (not b!1198234) (not b!1198237) (not b!1198238) (not mapNonEmpty!47477) b_and!42335 tp_is_empty!30423 (not b!1198242))
(check-sat b_and!42335 (not b_next!25719))
