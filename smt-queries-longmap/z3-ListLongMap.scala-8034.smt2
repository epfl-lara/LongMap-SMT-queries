; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99280 () Bool)

(assert start!99280)

(declare-fun b_free!24649 () Bool)

(declare-fun b_next!24649 () Bool)

(assert (=> start!99280 (= b_free!24649 (not b_next!24649))))

(declare-fun tp!86657 () Bool)

(declare-fun b_and!40149 () Bool)

(assert (=> start!99280 (= tp!86657 b_and!40149)))

(declare-fun b!1165691 () Bool)

(declare-fun e!662880 () Bool)

(declare-fun e!662877 () Bool)

(declare-fun mapRes!45593 () Bool)

(assert (=> b!1165691 (= e!662880 (and e!662877 mapRes!45593))))

(declare-fun condMapEmpty!45593 () Bool)

(declare-datatypes ((V!44033 0))(
  ( (V!44034 (val!14646 Int)) )
))
(declare-datatypes ((ValueCell!13880 0))(
  ( (ValueCellFull!13880 (v!17279 V!44033)) (EmptyCell!13880) )
))
(declare-datatypes ((array!75245 0))(
  ( (array!75246 (arr!36267 (Array (_ BitVec 32) ValueCell!13880)) (size!36804 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75245)

(declare-fun mapDefault!45593 () ValueCell!13880)

(assert (=> b!1165691 (= condMapEmpty!45593 (= (arr!36267 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13880)) mapDefault!45593)))))

(declare-fun b!1165692 () Bool)

(declare-fun tp_is_empty!29179 () Bool)

(assert (=> b!1165692 (= e!662877 tp_is_empty!29179)))

(declare-fun b!1165693 () Bool)

(declare-fun res!772670 () Bool)

(declare-fun e!662876 () Bool)

(assert (=> b!1165693 (=> (not res!772670) (not e!662876))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165693 (= res!772670 (validKeyInArray!0 k0!934))))

(declare-fun res!772667 () Bool)

(assert (=> start!99280 (=> (not res!772667) (not e!662876))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75247 0))(
  ( (array!75248 (arr!36268 (Array (_ BitVec 32) (_ BitVec 64))) (size!36805 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75247)

(assert (=> start!99280 (= res!772667 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36805 _keys!1208))))))

(assert (=> start!99280 e!662876))

(assert (=> start!99280 tp_is_empty!29179))

(declare-fun array_inv!27814 (array!75247) Bool)

(assert (=> start!99280 (array_inv!27814 _keys!1208)))

(assert (=> start!99280 true))

(assert (=> start!99280 tp!86657))

(declare-fun array_inv!27815 (array!75245) Bool)

(assert (=> start!99280 (and (array_inv!27815 _values!996) e!662880)))

(declare-fun mapIsEmpty!45593 () Bool)

(assert (=> mapIsEmpty!45593 mapRes!45593))

(declare-fun mapNonEmpty!45593 () Bool)

(declare-fun tp!86658 () Bool)

(declare-fun e!662881 () Bool)

(assert (=> mapNonEmpty!45593 (= mapRes!45593 (and tp!86658 e!662881))))

(declare-fun mapValue!45593 () ValueCell!13880)

(declare-fun mapRest!45593 () (Array (_ BitVec 32) ValueCell!13880))

(declare-fun mapKey!45593 () (_ BitVec 32))

(assert (=> mapNonEmpty!45593 (= (arr!36267 _values!996) (store mapRest!45593 mapKey!45593 mapValue!45593))))

(declare-fun b!1165694 () Bool)

(declare-fun res!772664 () Bool)

(declare-fun e!662875 () Bool)

(assert (=> b!1165694 (=> (not res!772664) (not e!662875))))

(declare-fun lt!525112 () array!75247)

(declare-datatypes ((List!25446 0))(
  ( (Nil!25443) (Cons!25442 (h!26660 (_ BitVec 64)) (t!37079 List!25446)) )
))
(declare-fun arrayNoDuplicates!0 (array!75247 (_ BitVec 32) List!25446) Bool)

(assert (=> b!1165694 (= res!772664 (arrayNoDuplicates!0 lt!525112 #b00000000000000000000000000000000 Nil!25443))))

(declare-fun b!1165695 () Bool)

(declare-fun res!772666 () Bool)

(assert (=> b!1165695 (=> (not res!772666) (not e!662876))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1165695 (= res!772666 (= (select (arr!36268 _keys!1208) i!673) k0!934))))

(declare-fun b!1165696 () Bool)

(declare-fun res!772669 () Bool)

(assert (=> b!1165696 (=> (not res!772669) (not e!662876))))

(assert (=> b!1165696 (= res!772669 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25443))))

(declare-fun b!1165697 () Bool)

(assert (=> b!1165697 (= e!662881 tp_is_empty!29179)))

(declare-fun b!1165698 () Bool)

(declare-fun res!772665 () Bool)

(assert (=> b!1165698 (=> (not res!772665) (not e!662876))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75247 (_ BitVec 32)) Bool)

(assert (=> b!1165698 (= res!772665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1165699 () Bool)

(declare-fun res!772668 () Bool)

(assert (=> b!1165699 (=> (not res!772668) (not e!662876))))

(assert (=> b!1165699 (= res!772668 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36805 _keys!1208))))))

(declare-fun b!1165700 () Bool)

(declare-fun e!662879 () Bool)

(assert (=> b!1165700 (= e!662875 (not e!662879))))

(declare-fun res!772663 () Bool)

(assert (=> b!1165700 (=> res!772663 e!662879)))

(assert (=> b!1165700 (= res!772663 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165700 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38417 0))(
  ( (Unit!38418) )
))
(declare-fun lt!525115 () Unit!38417)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75247 (_ BitVec 64) (_ BitVec 32)) Unit!38417)

(assert (=> b!1165700 (= lt!525115 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1165701 () Bool)

(declare-fun res!772661 () Bool)

(assert (=> b!1165701 (=> (not res!772661) (not e!662876))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1165701 (= res!772661 (and (= (size!36804 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36805 _keys!1208) (size!36804 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165702 () Bool)

(assert (=> b!1165702 (= e!662879 true)))

(declare-fun zeroValue!944 () V!44033)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44033)

(declare-datatypes ((tuple2!18710 0))(
  ( (tuple2!18711 (_1!9366 (_ BitVec 64)) (_2!9366 V!44033)) )
))
(declare-datatypes ((List!25447 0))(
  ( (Nil!25444) (Cons!25443 (h!26661 tuple2!18710) (t!37080 List!25447)) )
))
(declare-datatypes ((ListLongMap!16687 0))(
  ( (ListLongMap!16688 (toList!8359 List!25447)) )
))
(declare-fun lt!525114 () ListLongMap!16687)

(declare-fun getCurrentListMapNoExtraKeys!4850 (array!75247 array!75245 (_ BitVec 32) (_ BitVec 32) V!44033 V!44033 (_ BitVec 32) Int) ListLongMap!16687)

(declare-fun dynLambda!2839 (Int (_ BitVec 64)) V!44033)

(assert (=> b!1165702 (= lt!525114 (getCurrentListMapNoExtraKeys!4850 lt!525112 (array!75246 (store (arr!36267 _values!996) i!673 (ValueCellFull!13880 (dynLambda!2839 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36804 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!525113 () ListLongMap!16687)

(assert (=> b!1165702 (= lt!525113 (getCurrentListMapNoExtraKeys!4850 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1165703 () Bool)

(assert (=> b!1165703 (= e!662876 e!662875)))

(declare-fun res!772662 () Bool)

(assert (=> b!1165703 (=> (not res!772662) (not e!662875))))

(assert (=> b!1165703 (= res!772662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525112 mask!1564))))

(assert (=> b!1165703 (= lt!525112 (array!75248 (store (arr!36268 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36805 _keys!1208)))))

(declare-fun b!1165704 () Bool)

(declare-fun res!772671 () Bool)

(assert (=> b!1165704 (=> (not res!772671) (not e!662876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165704 (= res!772671 (validMask!0 mask!1564))))

(assert (= (and start!99280 res!772667) b!1165704))

(assert (= (and b!1165704 res!772671) b!1165701))

(assert (= (and b!1165701 res!772661) b!1165698))

(assert (= (and b!1165698 res!772665) b!1165696))

(assert (= (and b!1165696 res!772669) b!1165699))

(assert (= (and b!1165699 res!772668) b!1165693))

(assert (= (and b!1165693 res!772670) b!1165695))

(assert (= (and b!1165695 res!772666) b!1165703))

(assert (= (and b!1165703 res!772662) b!1165694))

(assert (= (and b!1165694 res!772664) b!1165700))

(assert (= (and b!1165700 (not res!772663)) b!1165702))

(assert (= (and b!1165691 condMapEmpty!45593) mapIsEmpty!45593))

(assert (= (and b!1165691 (not condMapEmpty!45593)) mapNonEmpty!45593))

(get-info :version)

(assert (= (and mapNonEmpty!45593 ((_ is ValueCellFull!13880) mapValue!45593)) b!1165697))

(assert (= (and b!1165691 ((_ is ValueCellFull!13880) mapDefault!45593)) b!1165692))

(assert (= start!99280 b!1165691))

(declare-fun b_lambda!19749 () Bool)

(assert (=> (not b_lambda!19749) (not b!1165702)))

(declare-fun t!37078 () Bool)

(declare-fun tb!9453 () Bool)

(assert (=> (and start!99280 (= defaultEntry!1004 defaultEntry!1004) t!37078) tb!9453))

(declare-fun result!19479 () Bool)

(assert (=> tb!9453 (= result!19479 tp_is_empty!29179)))

(assert (=> b!1165702 t!37078))

(declare-fun b_and!40151 () Bool)

(assert (= b_and!40149 (and (=> t!37078 result!19479) b_and!40151)))

(declare-fun m!1074407 () Bool)

(assert (=> b!1165698 m!1074407))

(declare-fun m!1074409 () Bool)

(assert (=> b!1165703 m!1074409))

(declare-fun m!1074411 () Bool)

(assert (=> b!1165703 m!1074411))

(declare-fun m!1074413 () Bool)

(assert (=> b!1165702 m!1074413))

(declare-fun m!1074415 () Bool)

(assert (=> b!1165702 m!1074415))

(declare-fun m!1074417 () Bool)

(assert (=> b!1165702 m!1074417))

(declare-fun m!1074419 () Bool)

(assert (=> b!1165702 m!1074419))

(declare-fun m!1074421 () Bool)

(assert (=> b!1165700 m!1074421))

(declare-fun m!1074423 () Bool)

(assert (=> b!1165700 m!1074423))

(declare-fun m!1074425 () Bool)

(assert (=> start!99280 m!1074425))

(declare-fun m!1074427 () Bool)

(assert (=> start!99280 m!1074427))

(declare-fun m!1074429 () Bool)

(assert (=> b!1165696 m!1074429))

(declare-fun m!1074431 () Bool)

(assert (=> b!1165694 m!1074431))

(declare-fun m!1074433 () Bool)

(assert (=> mapNonEmpty!45593 m!1074433))

(declare-fun m!1074435 () Bool)

(assert (=> b!1165695 m!1074435))

(declare-fun m!1074437 () Bool)

(assert (=> b!1165704 m!1074437))

(declare-fun m!1074439 () Bool)

(assert (=> b!1165693 m!1074439))

(check-sat (not start!99280) (not b!1165700) (not mapNonEmpty!45593) b_and!40151 (not b!1165694) (not b!1165693) (not b_next!24649) (not b!1165704) tp_is_empty!29179 (not b_lambda!19749) (not b!1165698) (not b!1165696) (not b!1165702) (not b!1165703))
(check-sat b_and!40151 (not b_next!24649))
