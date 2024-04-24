; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100446 () Bool)

(assert start!100446)

(declare-fun b!1196258 () Bool)

(declare-fun res!795614 () Bool)

(declare-fun e!679920 () Bool)

(assert (=> b!1196258 (=> (not res!795614) (not e!679920))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196258 (= res!795614 (validKeyInArray!0 k0!934))))

(declare-fun b!1196259 () Bool)

(declare-fun e!679925 () Bool)

(assert (=> b!1196259 (= e!679920 e!679925)))

(declare-fun res!795606 () Bool)

(assert (=> b!1196259 (=> (not res!795606) (not e!679925))))

(declare-datatypes ((array!77377 0))(
  ( (array!77378 (arr!37329 (Array (_ BitVec 32) (_ BitVec 64))) (size!37866 (_ BitVec 32))) )
))
(declare-fun lt!543339 () array!77377)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77377 (_ BitVec 32)) Bool)

(assert (=> b!1196259 (= res!795606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543339 mask!1564))))

(declare-fun _keys!1208 () array!77377)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1196259 (= lt!543339 (array!77378 (store (arr!37329 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37866 _keys!1208)))))

(declare-fun b!1196260 () Bool)

(declare-fun res!795610 () Bool)

(assert (=> b!1196260 (=> (not res!795610) (not e!679920))))

(assert (=> b!1196260 (= res!795610 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37866 _keys!1208))))))

(declare-fun b!1196261 () Bool)

(declare-fun res!795609 () Bool)

(assert (=> b!1196261 (=> (not res!795609) (not e!679920))))

(assert (=> b!1196261 (= res!795609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1196262 () Bool)

(declare-fun res!795605 () Bool)

(assert (=> b!1196262 (=> (not res!795605) (not e!679920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196262 (= res!795605 (validMask!0 mask!1564))))

(declare-fun b!1196263 () Bool)

(declare-fun res!795612 () Bool)

(assert (=> b!1196263 (=> (not res!795612) (not e!679920))))

(declare-datatypes ((List!26302 0))(
  ( (Nil!26299) (Cons!26298 (h!27516 (_ BitVec 64)) (t!38965 List!26302)) )
))
(declare-fun arrayNoDuplicates!0 (array!77377 (_ BitVec 32) List!26302) Bool)

(assert (=> b!1196263 (= res!795612 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26299))))

(declare-fun mapNonEmpty!47252 () Bool)

(declare-fun mapRes!47252 () Bool)

(declare-fun tp!89862 () Bool)

(declare-fun e!679923 () Bool)

(assert (=> mapNonEmpty!47252 (= mapRes!47252 (and tp!89862 e!679923))))

(declare-datatypes ((V!45497 0))(
  ( (V!45498 (val!15195 Int)) )
))
(declare-datatypes ((ValueCell!14429 0))(
  ( (ValueCellFull!14429 (v!17829 V!45497)) (EmptyCell!14429) )
))
(declare-fun mapRest!47252 () (Array (_ BitVec 32) ValueCell!14429))

(declare-fun mapKey!47252 () (_ BitVec 32))

(declare-fun mapValue!47252 () ValueCell!14429)

(declare-datatypes ((array!77379 0))(
  ( (array!77380 (arr!37330 (Array (_ BitVec 32) ValueCell!14429)) (size!37867 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77379)

(assert (=> mapNonEmpty!47252 (= (arr!37330 _values!996) (store mapRest!47252 mapKey!47252 mapValue!47252))))

(declare-fun b!1196264 () Bool)

(declare-fun e!679921 () Bool)

(declare-fun tp_is_empty!30277 () Bool)

(assert (=> b!1196264 (= e!679921 tp_is_empty!30277)))

(declare-fun mapIsEmpty!47252 () Bool)

(assert (=> mapIsEmpty!47252 mapRes!47252))

(declare-fun res!795611 () Bool)

(assert (=> start!100446 (=> (not res!795611) (not e!679920))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100446 (= res!795611 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37866 _keys!1208))))))

(assert (=> start!100446 e!679920))

(declare-fun array_inv!28528 (array!77377) Bool)

(assert (=> start!100446 (array_inv!28528 _keys!1208)))

(assert (=> start!100446 true))

(declare-fun e!679922 () Bool)

(declare-fun array_inv!28529 (array!77379) Bool)

(assert (=> start!100446 (and (array_inv!28529 _values!996) e!679922)))

(declare-fun b!1196265 () Bool)

(assert (=> b!1196265 (= e!679925 (not true))))

(declare-fun arrayContainsKey!0 (array!77377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196265 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39591 0))(
  ( (Unit!39592) )
))
(declare-fun lt!543340 () Unit!39591)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77377 (_ BitVec 64) (_ BitVec 32)) Unit!39591)

(assert (=> b!1196265 (= lt!543340 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1196266 () Bool)

(assert (=> b!1196266 (= e!679922 (and e!679921 mapRes!47252))))

(declare-fun condMapEmpty!47252 () Bool)

(declare-fun mapDefault!47252 () ValueCell!14429)

(assert (=> b!1196266 (= condMapEmpty!47252 (= (arr!37330 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14429)) mapDefault!47252)))))

(declare-fun b!1196267 () Bool)

(declare-fun res!795613 () Bool)

(assert (=> b!1196267 (=> (not res!795613) (not e!679920))))

(assert (=> b!1196267 (= res!795613 (= (select (arr!37329 _keys!1208) i!673) k0!934))))

(declare-fun b!1196268 () Bool)

(declare-fun res!795607 () Bool)

(assert (=> b!1196268 (=> (not res!795607) (not e!679925))))

(assert (=> b!1196268 (= res!795607 (arrayNoDuplicates!0 lt!543339 #b00000000000000000000000000000000 Nil!26299))))

(declare-fun b!1196269 () Bool)

(assert (=> b!1196269 (= e!679923 tp_is_empty!30277)))

(declare-fun b!1196270 () Bool)

(declare-fun res!795608 () Bool)

(assert (=> b!1196270 (=> (not res!795608) (not e!679920))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1196270 (= res!795608 (and (= (size!37867 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37866 _keys!1208) (size!37867 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!100446 res!795611) b!1196262))

(assert (= (and b!1196262 res!795605) b!1196270))

(assert (= (and b!1196270 res!795608) b!1196261))

(assert (= (and b!1196261 res!795609) b!1196263))

(assert (= (and b!1196263 res!795612) b!1196260))

(assert (= (and b!1196260 res!795610) b!1196258))

(assert (= (and b!1196258 res!795614) b!1196267))

(assert (= (and b!1196267 res!795613) b!1196259))

(assert (= (and b!1196259 res!795606) b!1196268))

(assert (= (and b!1196268 res!795607) b!1196265))

(assert (= (and b!1196266 condMapEmpty!47252) mapIsEmpty!47252))

(assert (= (and b!1196266 (not condMapEmpty!47252)) mapNonEmpty!47252))

(get-info :version)

(assert (= (and mapNonEmpty!47252 ((_ is ValueCellFull!14429) mapValue!47252)) b!1196269))

(assert (= (and b!1196266 ((_ is ValueCellFull!14429) mapDefault!47252)) b!1196264))

(assert (= start!100446 b!1196266))

(declare-fun m!1104267 () Bool)

(assert (=> b!1196259 m!1104267))

(declare-fun m!1104269 () Bool)

(assert (=> b!1196259 m!1104269))

(declare-fun m!1104271 () Bool)

(assert (=> b!1196258 m!1104271))

(declare-fun m!1104273 () Bool)

(assert (=> b!1196265 m!1104273))

(declare-fun m!1104275 () Bool)

(assert (=> b!1196265 m!1104275))

(declare-fun m!1104277 () Bool)

(assert (=> b!1196261 m!1104277))

(declare-fun m!1104279 () Bool)

(assert (=> b!1196267 m!1104279))

(declare-fun m!1104281 () Bool)

(assert (=> mapNonEmpty!47252 m!1104281))

(declare-fun m!1104283 () Bool)

(assert (=> start!100446 m!1104283))

(declare-fun m!1104285 () Bool)

(assert (=> start!100446 m!1104285))

(declare-fun m!1104287 () Bool)

(assert (=> b!1196262 m!1104287))

(declare-fun m!1104289 () Bool)

(assert (=> b!1196268 m!1104289))

(declare-fun m!1104291 () Bool)

(assert (=> b!1196263 m!1104291))

(check-sat (not b!1196258) (not mapNonEmpty!47252) (not b!1196262) (not b!1196265) (not b!1196263) (not b!1196259) (not b!1196261) tp_is_empty!30277 (not b!1196268) (not start!100446))
(check-sat)
