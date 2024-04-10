; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100272 () Bool)

(assert start!100272)

(declare-fun b!1196178 () Bool)

(declare-fun res!796028 () Bool)

(declare-fun e!679647 () Bool)

(assert (=> b!1196178 (=> (not res!796028) (not e!679647))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77459 0))(
  ( (array!77460 (arr!37376 (Array (_ BitVec 32) (_ BitVec 64))) (size!37912 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77459)

(assert (=> b!1196178 (= res!796028 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37912 _keys!1208))))))

(declare-fun b!1196179 () Bool)

(declare-fun e!679651 () Bool)

(declare-fun e!679646 () Bool)

(declare-fun mapRes!47345 () Bool)

(assert (=> b!1196179 (= e!679651 (and e!679646 mapRes!47345))))

(declare-fun condMapEmpty!47345 () Bool)

(declare-datatypes ((V!45579 0))(
  ( (V!45580 (val!15226 Int)) )
))
(declare-datatypes ((ValueCell!14460 0))(
  ( (ValueCellFull!14460 (v!17864 V!45579)) (EmptyCell!14460) )
))
(declare-datatypes ((array!77461 0))(
  ( (array!77462 (arr!37377 (Array (_ BitVec 32) ValueCell!14460)) (size!37913 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77461)

(declare-fun mapDefault!47345 () ValueCell!14460)

(assert (=> b!1196179 (= condMapEmpty!47345 (= (arr!37377 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14460)) mapDefault!47345)))))

(declare-fun mapIsEmpty!47345 () Bool)

(assert (=> mapIsEmpty!47345 mapRes!47345))

(declare-fun b!1196180 () Bool)

(declare-fun res!796029 () Bool)

(assert (=> b!1196180 (=> (not res!796029) (not e!679647))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196180 (= res!796029 (validMask!0 mask!1564))))

(declare-fun b!1196181 () Bool)

(declare-fun res!796033 () Bool)

(assert (=> b!1196181 (=> (not res!796033) (not e!679647))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196181 (= res!796033 (validKeyInArray!0 k0!934))))

(declare-fun b!1196182 () Bool)

(declare-fun res!796035 () Bool)

(assert (=> b!1196182 (=> (not res!796035) (not e!679647))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1196182 (= res!796035 (and (= (size!37913 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37912 _keys!1208) (size!37913 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47345 () Bool)

(declare-fun tp!89955 () Bool)

(declare-fun e!679649 () Bool)

(assert (=> mapNonEmpty!47345 (= mapRes!47345 (and tp!89955 e!679649))))

(declare-fun mapRest!47345 () (Array (_ BitVec 32) ValueCell!14460))

(declare-fun mapKey!47345 () (_ BitVec 32))

(declare-fun mapValue!47345 () ValueCell!14460)

(assert (=> mapNonEmpty!47345 (= (arr!37377 _values!996) (store mapRest!47345 mapKey!47345 mapValue!47345))))

(declare-fun b!1196183 () Bool)

(declare-fun tp_is_empty!30339 () Bool)

(assert (=> b!1196183 (= e!679649 tp_is_empty!30339)))

(declare-fun b!1196184 () Bool)

(declare-fun e!679648 () Bool)

(assert (=> b!1196184 (= e!679647 e!679648)))

(declare-fun res!796034 () Bool)

(assert (=> b!1196184 (=> (not res!796034) (not e!679648))))

(declare-fun lt!543042 () array!77459)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77459 (_ BitVec 32)) Bool)

(assert (=> b!1196184 (= res!796034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543042 mask!1564))))

(assert (=> b!1196184 (= lt!543042 (array!77460 (store (arr!37376 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37912 _keys!1208)))))

(declare-fun b!1196185 () Bool)

(declare-fun res!796027 () Bool)

(assert (=> b!1196185 (=> (not res!796027) (not e!679647))))

(declare-datatypes ((List!26297 0))(
  ( (Nil!26294) (Cons!26293 (h!27502 (_ BitVec 64)) (t!38968 List!26297)) )
))
(declare-fun arrayNoDuplicates!0 (array!77459 (_ BitVec 32) List!26297) Bool)

(assert (=> b!1196185 (= res!796027 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26294))))

(declare-fun b!1196187 () Bool)

(declare-fun res!796036 () Bool)

(assert (=> b!1196187 (=> (not res!796036) (not e!679647))))

(assert (=> b!1196187 (= res!796036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1196188 () Bool)

(assert (=> b!1196188 (= e!679646 tp_is_empty!30339)))

(declare-fun b!1196189 () Bool)

(declare-fun res!796032 () Bool)

(assert (=> b!1196189 (=> (not res!796032) (not e!679648))))

(assert (=> b!1196189 (= res!796032 (arrayNoDuplicates!0 lt!543042 #b00000000000000000000000000000000 Nil!26294))))

(declare-fun b!1196190 () Bool)

(assert (=> b!1196190 (= e!679648 (not true))))

(declare-fun arrayContainsKey!0 (array!77459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196190 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39664 0))(
  ( (Unit!39665) )
))
(declare-fun lt!543041 () Unit!39664)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77459 (_ BitVec 64) (_ BitVec 32)) Unit!39664)

(assert (=> b!1196190 (= lt!543041 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1196186 () Bool)

(declare-fun res!796031 () Bool)

(assert (=> b!1196186 (=> (not res!796031) (not e!679647))))

(assert (=> b!1196186 (= res!796031 (= (select (arr!37376 _keys!1208) i!673) k0!934))))

(declare-fun res!796030 () Bool)

(assert (=> start!100272 (=> (not res!796030) (not e!679647))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100272 (= res!796030 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37912 _keys!1208))))))

(assert (=> start!100272 e!679647))

(declare-fun array_inv!28488 (array!77459) Bool)

(assert (=> start!100272 (array_inv!28488 _keys!1208)))

(assert (=> start!100272 true))

(declare-fun array_inv!28489 (array!77461) Bool)

(assert (=> start!100272 (and (array_inv!28489 _values!996) e!679651)))

(assert (= (and start!100272 res!796030) b!1196180))

(assert (= (and b!1196180 res!796029) b!1196182))

(assert (= (and b!1196182 res!796035) b!1196187))

(assert (= (and b!1196187 res!796036) b!1196185))

(assert (= (and b!1196185 res!796027) b!1196178))

(assert (= (and b!1196178 res!796028) b!1196181))

(assert (= (and b!1196181 res!796033) b!1196186))

(assert (= (and b!1196186 res!796031) b!1196184))

(assert (= (and b!1196184 res!796034) b!1196189))

(assert (= (and b!1196189 res!796032) b!1196190))

(assert (= (and b!1196179 condMapEmpty!47345) mapIsEmpty!47345))

(assert (= (and b!1196179 (not condMapEmpty!47345)) mapNonEmpty!47345))

(get-info :version)

(assert (= (and mapNonEmpty!47345 ((_ is ValueCellFull!14460) mapValue!47345)) b!1196183))

(assert (= (and b!1196179 ((_ is ValueCellFull!14460) mapDefault!47345)) b!1196188))

(assert (= start!100272 b!1196179))

(declare-fun m!1103501 () Bool)

(assert (=> b!1196181 m!1103501))

(declare-fun m!1103503 () Bool)

(assert (=> start!100272 m!1103503))

(declare-fun m!1103505 () Bool)

(assert (=> start!100272 m!1103505))

(declare-fun m!1103507 () Bool)

(assert (=> b!1196185 m!1103507))

(declare-fun m!1103509 () Bool)

(assert (=> b!1196190 m!1103509))

(declare-fun m!1103511 () Bool)

(assert (=> b!1196190 m!1103511))

(declare-fun m!1103513 () Bool)

(assert (=> b!1196184 m!1103513))

(declare-fun m!1103515 () Bool)

(assert (=> b!1196184 m!1103515))

(declare-fun m!1103517 () Bool)

(assert (=> b!1196189 m!1103517))

(declare-fun m!1103519 () Bool)

(assert (=> mapNonEmpty!47345 m!1103519))

(declare-fun m!1103521 () Bool)

(assert (=> b!1196180 m!1103521))

(declare-fun m!1103523 () Bool)

(assert (=> b!1196186 m!1103523))

(declare-fun m!1103525 () Bool)

(assert (=> b!1196187 m!1103525))

(check-sat (not start!100272) (not mapNonEmpty!47345) (not b!1196180) (not b!1196189) (not b!1196184) (not b!1196185) (not b!1196181) (not b!1196187) (not b!1196190) tp_is_empty!30339)
(check-sat)
