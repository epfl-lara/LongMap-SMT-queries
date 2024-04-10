; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100402 () Bool)

(assert start!100402)

(declare-fun b_free!25725 () Bool)

(declare-fun b_next!25725 () Bool)

(assert (=> start!100402 (= b_free!25725 (not b_next!25725))))

(declare-fun tp!90164 () Bool)

(declare-fun b_and!42341 () Bool)

(assert (=> start!100402 (= tp!90164 b_and!42341)))

(declare-fun b!1198356 () Bool)

(declare-fun res!797550 () Bool)

(declare-fun e!680728 () Bool)

(assert (=> b!1198356 (=> (not res!797550) (not e!680728))))

(declare-datatypes ((array!77637 0))(
  ( (array!77638 (arr!37463 (Array (_ BitVec 32) (_ BitVec 64))) (size!37999 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77637)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1198356 (= res!797550 (= (select (arr!37463 _keys!1208) i!673) k0!934))))

(declare-fun b!1198357 () Bool)

(declare-fun res!797546 () Bool)

(assert (=> b!1198357 (=> (not res!797546) (not e!680728))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198357 (= res!797546 (validMask!0 mask!1564))))

(declare-fun b!1198358 () Bool)

(declare-fun e!680731 () Bool)

(declare-fun e!680730 () Bool)

(assert (=> b!1198358 (= e!680731 (not e!680730))))

(declare-fun res!797545 () Bool)

(assert (=> b!1198358 (=> res!797545 e!680730)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1198358 (= res!797545 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198358 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39730 0))(
  ( (Unit!39731) )
))
(declare-fun lt!543478 () Unit!39730)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77637 (_ BitVec 64) (_ BitVec 32)) Unit!39730)

(assert (=> b!1198358 (= lt!543478 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1198359 () Bool)

(declare-fun res!797541 () Bool)

(assert (=> b!1198359 (=> (not res!797541) (not e!680728))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198359 (= res!797541 (validKeyInArray!0 k0!934))))

(declare-fun b!1198360 () Bool)

(declare-fun res!797543 () Bool)

(assert (=> b!1198360 (=> (not res!797543) (not e!680728))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45699 0))(
  ( (V!45700 (val!15271 Int)) )
))
(declare-datatypes ((ValueCell!14505 0))(
  ( (ValueCellFull!14505 (v!17909 V!45699)) (EmptyCell!14505) )
))
(declare-datatypes ((array!77639 0))(
  ( (array!77640 (arr!37464 (Array (_ BitVec 32) ValueCell!14505)) (size!38000 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77639)

(assert (=> b!1198360 (= res!797543 (and (= (size!38000 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37999 _keys!1208) (size!38000 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1198361 () Bool)

(declare-fun res!797547 () Bool)

(assert (=> b!1198361 (=> (not res!797547) (not e!680728))))

(declare-datatypes ((List!26355 0))(
  ( (Nil!26352) (Cons!26351 (h!27560 (_ BitVec 64)) (t!39062 List!26355)) )
))
(declare-fun arrayNoDuplicates!0 (array!77637 (_ BitVec 32) List!26355) Bool)

(assert (=> b!1198361 (= res!797547 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26352))))

(declare-fun b!1198362 () Bool)

(declare-fun e!680729 () Bool)

(declare-fun tp_is_empty!30429 () Bool)

(assert (=> b!1198362 (= e!680729 tp_is_empty!30429)))

(declare-fun mapNonEmpty!47486 () Bool)

(declare-fun mapRes!47486 () Bool)

(declare-fun tp!90165 () Bool)

(assert (=> mapNonEmpty!47486 (= mapRes!47486 (and tp!90165 e!680729))))

(declare-fun mapRest!47486 () (Array (_ BitVec 32) ValueCell!14505))

(declare-fun mapKey!47486 () (_ BitVec 32))

(declare-fun mapValue!47486 () ValueCell!14505)

(assert (=> mapNonEmpty!47486 (= (arr!37464 _values!996) (store mapRest!47486 mapKey!47486 mapValue!47486))))

(declare-fun b!1198363 () Bool)

(declare-fun e!680727 () Bool)

(assert (=> b!1198363 (= e!680727 tp_is_empty!30429)))

(declare-fun b!1198364 () Bool)

(declare-fun res!797542 () Bool)

(assert (=> b!1198364 (=> (not res!797542) (not e!680728))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77637 (_ BitVec 32)) Bool)

(assert (=> b!1198364 (= res!797542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!797548 () Bool)

(assert (=> start!100402 (=> (not res!797548) (not e!680728))))

(assert (=> start!100402 (= res!797548 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37999 _keys!1208))))))

(assert (=> start!100402 e!680728))

(assert (=> start!100402 tp_is_empty!30429))

(declare-fun array_inv!28550 (array!77637) Bool)

(assert (=> start!100402 (array_inv!28550 _keys!1208)))

(assert (=> start!100402 true))

(assert (=> start!100402 tp!90164))

(declare-fun e!680726 () Bool)

(declare-fun array_inv!28551 (array!77639) Bool)

(assert (=> start!100402 (and (array_inv!28551 _values!996) e!680726)))

(declare-fun mapIsEmpty!47486 () Bool)

(assert (=> mapIsEmpty!47486 mapRes!47486))

(declare-fun b!1198365 () Bool)

(assert (=> b!1198365 (= e!680728 e!680731)))

(declare-fun res!797544 () Bool)

(assert (=> b!1198365 (=> (not res!797544) (not e!680731))))

(declare-fun lt!543477 () array!77637)

(assert (=> b!1198365 (= res!797544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543477 mask!1564))))

(assert (=> b!1198365 (= lt!543477 (array!77638 (store (arr!37463 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37999 _keys!1208)))))

(declare-fun b!1198366 () Bool)

(assert (=> b!1198366 (= e!680726 (and e!680727 mapRes!47486))))

(declare-fun condMapEmpty!47486 () Bool)

(declare-fun mapDefault!47486 () ValueCell!14505)

(assert (=> b!1198366 (= condMapEmpty!47486 (= (arr!37464 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14505)) mapDefault!47486)))))

(declare-fun b!1198367 () Bool)

(assert (=> b!1198367 (= e!680730 (bvslt i!673 (size!38000 _values!996)))))

(declare-fun zeroValue!944 () V!45699)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19538 0))(
  ( (tuple2!19539 (_1!9780 (_ BitVec 64)) (_2!9780 V!45699)) )
))
(declare-datatypes ((List!26356 0))(
  ( (Nil!26353) (Cons!26352 (h!27561 tuple2!19538) (t!39063 List!26356)) )
))
(declare-datatypes ((ListLongMap!17507 0))(
  ( (ListLongMap!17508 (toList!8769 List!26356)) )
))
(declare-fun lt!543476 () ListLongMap!17507)

(declare-fun minValue!944 () V!45699)

(declare-fun getCurrentListMapNoExtraKeys!5208 (array!77637 array!77639 (_ BitVec 32) (_ BitVec 32) V!45699 V!45699 (_ BitVec 32) Int) ListLongMap!17507)

(assert (=> b!1198367 (= lt!543476 (getCurrentListMapNoExtraKeys!5208 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1198368 () Bool)

(declare-fun res!797549 () Bool)

(assert (=> b!1198368 (=> (not res!797549) (not e!680728))))

(assert (=> b!1198368 (= res!797549 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37999 _keys!1208))))))

(declare-fun b!1198369 () Bool)

(declare-fun res!797540 () Bool)

(assert (=> b!1198369 (=> (not res!797540) (not e!680731))))

(assert (=> b!1198369 (= res!797540 (arrayNoDuplicates!0 lt!543477 #b00000000000000000000000000000000 Nil!26352))))

(assert (= (and start!100402 res!797548) b!1198357))

(assert (= (and b!1198357 res!797546) b!1198360))

(assert (= (and b!1198360 res!797543) b!1198364))

(assert (= (and b!1198364 res!797542) b!1198361))

(assert (= (and b!1198361 res!797547) b!1198368))

(assert (= (and b!1198368 res!797549) b!1198359))

(assert (= (and b!1198359 res!797541) b!1198356))

(assert (= (and b!1198356 res!797550) b!1198365))

(assert (= (and b!1198365 res!797544) b!1198369))

(assert (= (and b!1198369 res!797540) b!1198358))

(assert (= (and b!1198358 (not res!797545)) b!1198367))

(assert (= (and b!1198366 condMapEmpty!47486) mapIsEmpty!47486))

(assert (= (and b!1198366 (not condMapEmpty!47486)) mapNonEmpty!47486))

(get-info :version)

(assert (= (and mapNonEmpty!47486 ((_ is ValueCellFull!14505) mapValue!47486)) b!1198362))

(assert (= (and b!1198366 ((_ is ValueCellFull!14505) mapDefault!47486)) b!1198363))

(assert (= start!100402 b!1198366))

(declare-fun m!1105149 () Bool)

(assert (=> mapNonEmpty!47486 m!1105149))

(declare-fun m!1105151 () Bool)

(assert (=> b!1198365 m!1105151))

(declare-fun m!1105153 () Bool)

(assert (=> b!1198365 m!1105153))

(declare-fun m!1105155 () Bool)

(assert (=> b!1198358 m!1105155))

(declare-fun m!1105157 () Bool)

(assert (=> b!1198358 m!1105157))

(declare-fun m!1105159 () Bool)

(assert (=> b!1198361 m!1105159))

(declare-fun m!1105161 () Bool)

(assert (=> b!1198357 m!1105161))

(declare-fun m!1105163 () Bool)

(assert (=> b!1198356 m!1105163))

(declare-fun m!1105165 () Bool)

(assert (=> b!1198367 m!1105165))

(declare-fun m!1105167 () Bool)

(assert (=> start!100402 m!1105167))

(declare-fun m!1105169 () Bool)

(assert (=> start!100402 m!1105169))

(declare-fun m!1105171 () Bool)

(assert (=> b!1198369 m!1105171))

(declare-fun m!1105173 () Bool)

(assert (=> b!1198359 m!1105173))

(declare-fun m!1105175 () Bool)

(assert (=> b!1198364 m!1105175))

(check-sat (not b!1198357) (not b!1198361) (not b!1198365) (not b_next!25725) (not b!1198364) (not b!1198369) tp_is_empty!30429 (not mapNonEmpty!47486) (not start!100402) (not b!1198359) (not b!1198358) (not b!1198367) b_and!42341)
(check-sat b_and!42341 (not b_next!25725))
