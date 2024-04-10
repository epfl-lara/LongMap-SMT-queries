; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97720 () Bool)

(assert start!97720)

(declare-fun b!1117278 () Bool)

(declare-fun res!746087 () Bool)

(declare-fun e!636481 () Bool)

(assert (=> b!1117278 (=> (not res!746087) (not e!636481))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117278 (= res!746087 (validMask!0 mask!1564))))

(declare-fun b!1117279 () Bool)

(declare-fun res!746090 () Bool)

(assert (=> b!1117279 (=> (not res!746090) (not e!636481))))

(declare-datatypes ((array!72797 0))(
  ( (array!72798 (arr!35051 (Array (_ BitVec 32) (_ BitVec 64))) (size!35587 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72797)

(declare-datatypes ((V!42395 0))(
  ( (V!42396 (val!14032 Int)) )
))
(declare-datatypes ((ValueCell!13266 0))(
  ( (ValueCellFull!13266 (v!16665 V!42395)) (EmptyCell!13266) )
))
(declare-datatypes ((array!72799 0))(
  ( (array!72800 (arr!35052 (Array (_ BitVec 32) ValueCell!13266)) (size!35588 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72799)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1117279 (= res!746090 (and (= (size!35588 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35587 _keys!1208) (size!35588 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117280 () Bool)

(declare-fun res!746089 () Bool)

(assert (=> b!1117280 (=> (not res!746089) (not e!636481))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117280 (= res!746089 (validKeyInArray!0 k0!934))))

(declare-fun b!1117281 () Bool)

(declare-fun res!746088 () Bool)

(assert (=> b!1117281 (=> (not res!746088) (not e!636481))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1117281 (= res!746088 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35587 _keys!1208))))))

(declare-fun b!1117282 () Bool)

(declare-fun e!636478 () Bool)

(assert (=> b!1117282 (= e!636481 e!636478)))

(declare-fun res!746083 () Bool)

(assert (=> b!1117282 (=> (not res!746083) (not e!636478))))

(declare-fun lt!497263 () array!72797)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72797 (_ BitVec 32)) Bool)

(assert (=> b!1117282 (= res!746083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497263 mask!1564))))

(assert (=> b!1117282 (= lt!497263 (array!72798 (store (arr!35051 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35587 _keys!1208)))))

(declare-fun b!1117283 () Bool)

(declare-fun res!746085 () Bool)

(assert (=> b!1117283 (=> (not res!746085) (not e!636478))))

(declare-datatypes ((List!24384 0))(
  ( (Nil!24381) (Cons!24380 (h!25589 (_ BitVec 64)) (t!34865 List!24384)) )
))
(declare-fun arrayNoDuplicates!0 (array!72797 (_ BitVec 32) List!24384) Bool)

(assert (=> b!1117283 (= res!746085 (arrayNoDuplicates!0 lt!497263 #b00000000000000000000000000000000 Nil!24381))))

(declare-fun b!1117284 () Bool)

(assert (=> b!1117284 (= e!636478 (not true))))

(declare-fun arrayContainsKey!0 (array!72797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117284 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36666 0))(
  ( (Unit!36667) )
))
(declare-fun lt!497264 () Unit!36666)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72797 (_ BitVec 64) (_ BitVec 32)) Unit!36666)

(assert (=> b!1117284 (= lt!497264 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1117285 () Bool)

(declare-fun e!636482 () Bool)

(declare-fun tp_is_empty!27951 () Bool)

(assert (=> b!1117285 (= e!636482 tp_is_empty!27951)))

(declare-fun res!746086 () Bool)

(assert (=> start!97720 (=> (not res!746086) (not e!636481))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97720 (= res!746086 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35587 _keys!1208))))))

(assert (=> start!97720 e!636481))

(declare-fun array_inv!26934 (array!72797) Bool)

(assert (=> start!97720 (array_inv!26934 _keys!1208)))

(assert (=> start!97720 true))

(declare-fun e!636480 () Bool)

(declare-fun array_inv!26935 (array!72799) Bool)

(assert (=> start!97720 (and (array_inv!26935 _values!996) e!636480)))

(declare-fun mapNonEmpty!43744 () Bool)

(declare-fun mapRes!43744 () Bool)

(declare-fun tp!82988 () Bool)

(declare-fun e!636483 () Bool)

(assert (=> mapNonEmpty!43744 (= mapRes!43744 (and tp!82988 e!636483))))

(declare-fun mapKey!43744 () (_ BitVec 32))

(declare-fun mapRest!43744 () (Array (_ BitVec 32) ValueCell!13266))

(declare-fun mapValue!43744 () ValueCell!13266)

(assert (=> mapNonEmpty!43744 (= (arr!35052 _values!996) (store mapRest!43744 mapKey!43744 mapValue!43744))))

(declare-fun b!1117286 () Bool)

(declare-fun res!746084 () Bool)

(assert (=> b!1117286 (=> (not res!746084) (not e!636481))))

(assert (=> b!1117286 (= res!746084 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24381))))

(declare-fun mapIsEmpty!43744 () Bool)

(assert (=> mapIsEmpty!43744 mapRes!43744))

(declare-fun b!1117287 () Bool)

(declare-fun res!746091 () Bool)

(assert (=> b!1117287 (=> (not res!746091) (not e!636481))))

(assert (=> b!1117287 (= res!746091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117288 () Bool)

(assert (=> b!1117288 (= e!636480 (and e!636482 mapRes!43744))))

(declare-fun condMapEmpty!43744 () Bool)

(declare-fun mapDefault!43744 () ValueCell!13266)

(assert (=> b!1117288 (= condMapEmpty!43744 (= (arr!35052 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13266)) mapDefault!43744)))))

(declare-fun b!1117289 () Bool)

(declare-fun res!746092 () Bool)

(assert (=> b!1117289 (=> (not res!746092) (not e!636481))))

(assert (=> b!1117289 (= res!746092 (= (select (arr!35051 _keys!1208) i!673) k0!934))))

(declare-fun b!1117290 () Bool)

(assert (=> b!1117290 (= e!636483 tp_is_empty!27951)))

(assert (= (and start!97720 res!746086) b!1117278))

(assert (= (and b!1117278 res!746087) b!1117279))

(assert (= (and b!1117279 res!746090) b!1117287))

(assert (= (and b!1117287 res!746091) b!1117286))

(assert (= (and b!1117286 res!746084) b!1117281))

(assert (= (and b!1117281 res!746088) b!1117280))

(assert (= (and b!1117280 res!746089) b!1117289))

(assert (= (and b!1117289 res!746092) b!1117282))

(assert (= (and b!1117282 res!746083) b!1117283))

(assert (= (and b!1117283 res!746085) b!1117284))

(assert (= (and b!1117288 condMapEmpty!43744) mapIsEmpty!43744))

(assert (= (and b!1117288 (not condMapEmpty!43744)) mapNonEmpty!43744))

(get-info :version)

(assert (= (and mapNonEmpty!43744 ((_ is ValueCellFull!13266) mapValue!43744)) b!1117290))

(assert (= (and b!1117288 ((_ is ValueCellFull!13266) mapDefault!43744)) b!1117285))

(assert (= start!97720 b!1117288))

(declare-fun m!1033207 () Bool)

(assert (=> b!1117286 m!1033207))

(declare-fun m!1033209 () Bool)

(assert (=> b!1117278 m!1033209))

(declare-fun m!1033211 () Bool)

(assert (=> b!1117287 m!1033211))

(declare-fun m!1033213 () Bool)

(assert (=> b!1117280 m!1033213))

(declare-fun m!1033215 () Bool)

(assert (=> b!1117283 m!1033215))

(declare-fun m!1033217 () Bool)

(assert (=> b!1117289 m!1033217))

(declare-fun m!1033219 () Bool)

(assert (=> b!1117284 m!1033219))

(declare-fun m!1033221 () Bool)

(assert (=> b!1117284 m!1033221))

(declare-fun m!1033223 () Bool)

(assert (=> mapNonEmpty!43744 m!1033223))

(declare-fun m!1033225 () Bool)

(assert (=> start!97720 m!1033225))

(declare-fun m!1033227 () Bool)

(assert (=> start!97720 m!1033227))

(declare-fun m!1033229 () Bool)

(assert (=> b!1117282 m!1033229))

(declare-fun m!1033231 () Bool)

(assert (=> b!1117282 m!1033231))

(check-sat (not b!1117280) tp_is_empty!27951 (not b!1117287) (not start!97720) (not b!1117286) (not mapNonEmpty!43744) (not b!1117282) (not b!1117278) (not b!1117284) (not b!1117283))
(check-sat)
