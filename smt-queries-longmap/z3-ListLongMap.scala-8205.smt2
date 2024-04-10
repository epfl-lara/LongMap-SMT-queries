; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100098 () Bool)

(assert start!100098)

(declare-fun b_free!25671 () Bool)

(declare-fun b_next!25671 () Bool)

(assert (=> start!100098 (= b_free!25671 (not b_next!25671))))

(declare-fun tp!89736 () Bool)

(declare-fun b_and!42209 () Bool)

(assert (=> start!100098 (= tp!89736 b_and!42209)))

(declare-fun b!1193569 () Bool)

(declare-fun e!678351 () Bool)

(declare-fun e!678358 () Bool)

(assert (=> b!1193569 (= e!678351 e!678358)))

(declare-fun res!794104 () Bool)

(assert (=> b!1193569 (=> (not res!794104) (not e!678358))))

(declare-datatypes ((array!77193 0))(
  ( (array!77194 (arr!37246 (Array (_ BitVec 32) (_ BitVec 64))) (size!37782 (_ BitVec 32))) )
))
(declare-fun lt!542620 () array!77193)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77193 (_ BitVec 32)) Bool)

(assert (=> b!1193569 (= res!794104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542620 mask!1564))))

(declare-fun _keys!1208 () array!77193)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1193569 (= lt!542620 (array!77194 (store (arr!37246 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37782 _keys!1208)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!678350 () Bool)

(declare-fun b!1193570 () Bool)

(declare-datatypes ((V!45403 0))(
  ( (V!45404 (val!15160 Int)) )
))
(declare-datatypes ((tuple2!19488 0))(
  ( (tuple2!19489 (_1!9755 (_ BitVec 64)) (_2!9755 V!45403)) )
))
(declare-datatypes ((List!26235 0))(
  ( (Nil!26232) (Cons!26231 (h!27440 tuple2!19488) (t!38898 List!26235)) )
))
(declare-datatypes ((ListLongMap!17457 0))(
  ( (ListLongMap!17458 (toList!8744 List!26235)) )
))
(declare-fun call!57129 () ListLongMap!17457)

(declare-fun call!57128 () ListLongMap!17457)

(declare-fun -!1768 (ListLongMap!17457 (_ BitVec 64)) ListLongMap!17457)

(assert (=> b!1193570 (= e!678350 (= call!57128 (-!1768 call!57129 k0!934)))))

(declare-fun b!1193571 () Bool)

(declare-fun res!794106 () Bool)

(assert (=> b!1193571 (=> (not res!794106) (not e!678351))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193571 (= res!794106 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!47138 () Bool)

(declare-fun mapRes!47138 () Bool)

(assert (=> mapIsEmpty!47138 mapRes!47138))

(declare-fun b!1193572 () Bool)

(declare-fun res!794102 () Bool)

(assert (=> b!1193572 (=> (not res!794102) (not e!678351))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14394 0))(
  ( (ValueCellFull!14394 (v!17798 V!45403)) (EmptyCell!14394) )
))
(declare-datatypes ((array!77195 0))(
  ( (array!77196 (arr!37247 (Array (_ BitVec 32) ValueCell!14394)) (size!37783 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77195)

(assert (=> b!1193572 (= res!794102 (and (= (size!37783 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37782 _keys!1208) (size!37783 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193573 () Bool)

(assert (=> b!1193573 (= e!678350 (= call!57128 call!57129))))

(declare-fun b!1193574 () Bool)

(declare-fun res!794111 () Bool)

(assert (=> b!1193574 (=> (not res!794111) (not e!678358))))

(declare-datatypes ((List!26236 0))(
  ( (Nil!26233) (Cons!26232 (h!27441 (_ BitVec 64)) (t!38899 List!26236)) )
))
(declare-fun arrayNoDuplicates!0 (array!77193 (_ BitVec 32) List!26236) Bool)

(assert (=> b!1193574 (= res!794111 (arrayNoDuplicates!0 lt!542620 #b00000000000000000000000000000000 Nil!26233))))

(declare-fun b!1193575 () Bool)

(declare-fun res!794112 () Bool)

(assert (=> b!1193575 (=> (not res!794112) (not e!678351))))

(assert (=> b!1193575 (= res!794112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193576 () Bool)

(declare-fun e!678355 () Bool)

(assert (=> b!1193576 (= e!678358 (not e!678355))))

(declare-fun res!794110 () Bool)

(assert (=> b!1193576 (=> res!794110 e!678355)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1193576 (= res!794110 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1193576 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39594 0))(
  ( (Unit!39595) )
))
(declare-fun lt!542617 () Unit!39594)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77193 (_ BitVec 64) (_ BitVec 32)) Unit!39594)

(assert (=> b!1193576 (= lt!542617 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!794109 () Bool)

(assert (=> start!100098 (=> (not res!794109) (not e!678351))))

(assert (=> start!100098 (= res!794109 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37782 _keys!1208))))))

(assert (=> start!100098 e!678351))

(declare-fun tp_is_empty!30207 () Bool)

(assert (=> start!100098 tp_is_empty!30207))

(declare-fun array_inv!28396 (array!77193) Bool)

(assert (=> start!100098 (array_inv!28396 _keys!1208)))

(assert (=> start!100098 true))

(assert (=> start!100098 tp!89736))

(declare-fun e!678353 () Bool)

(declare-fun array_inv!28397 (array!77195) Bool)

(assert (=> start!100098 (and (array_inv!28397 _values!996) e!678353)))

(declare-fun zeroValue!944 () V!45403)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45403)

(declare-fun bm!57125 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5185 (array!77193 array!77195 (_ BitVec 32) (_ BitVec 32) V!45403 V!45403 (_ BitVec 32) Int) ListLongMap!17457)

(assert (=> bm!57125 (= call!57129 (getCurrentListMapNoExtraKeys!5185 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1193577 () Bool)

(declare-fun e!678354 () Bool)

(assert (=> b!1193577 (= e!678353 (and e!678354 mapRes!47138))))

(declare-fun condMapEmpty!47138 () Bool)

(declare-fun mapDefault!47138 () ValueCell!14394)

(assert (=> b!1193577 (= condMapEmpty!47138 (= (arr!37247 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14394)) mapDefault!47138)))))

(declare-fun b!1193578 () Bool)

(declare-fun res!794107 () Bool)

(assert (=> b!1193578 (=> (not res!794107) (not e!678351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193578 (= res!794107 (validMask!0 mask!1564))))

(declare-fun b!1193579 () Bool)

(declare-fun res!794103 () Bool)

(assert (=> b!1193579 (=> (not res!794103) (not e!678351))))

(assert (=> b!1193579 (= res!794103 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37782 _keys!1208))))))

(declare-fun bm!57126 () Bool)

(declare-fun lt!542622 () array!77195)

(assert (=> bm!57126 (= call!57128 (getCurrentListMapNoExtraKeys!5185 lt!542620 lt!542622 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1193580 () Bool)

(declare-fun res!794113 () Bool)

(assert (=> b!1193580 (=> (not res!794113) (not e!678351))))

(assert (=> b!1193580 (= res!794113 (= (select (arr!37246 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!47138 () Bool)

(declare-fun tp!89735 () Bool)

(declare-fun e!678352 () Bool)

(assert (=> mapNonEmpty!47138 (= mapRes!47138 (and tp!89735 e!678352))))

(declare-fun mapValue!47138 () ValueCell!14394)

(declare-fun mapRest!47138 () (Array (_ BitVec 32) ValueCell!14394))

(declare-fun mapKey!47138 () (_ BitVec 32))

(assert (=> mapNonEmpty!47138 (= (arr!37247 _values!996) (store mapRest!47138 mapKey!47138 mapValue!47138))))

(declare-fun b!1193581 () Bool)

(declare-fun res!794105 () Bool)

(assert (=> b!1193581 (=> (not res!794105) (not e!678351))))

(assert (=> b!1193581 (= res!794105 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26233))))

(declare-fun b!1193582 () Bool)

(declare-fun e!678356 () Bool)

(assert (=> b!1193582 (= e!678355 e!678356)))

(declare-fun res!794108 () Bool)

(assert (=> b!1193582 (=> res!794108 e!678356)))

(assert (=> b!1193582 (= res!794108 (not (= from!1455 i!673)))))

(declare-fun lt!542619 () ListLongMap!17457)

(assert (=> b!1193582 (= lt!542619 (getCurrentListMapNoExtraKeys!5185 lt!542620 lt!542622 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3113 (Int (_ BitVec 64)) V!45403)

(assert (=> b!1193582 (= lt!542622 (array!77196 (store (arr!37247 _values!996) i!673 (ValueCellFull!14394 (dynLambda!3113 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37783 _values!996)))))

(declare-fun lt!542618 () ListLongMap!17457)

(assert (=> b!1193582 (= lt!542618 (getCurrentListMapNoExtraKeys!5185 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1193583 () Bool)

(assert (=> b!1193583 (= e!678354 tp_is_empty!30207)))

(declare-fun b!1193584 () Bool)

(assert (=> b!1193584 (= e!678352 tp_is_empty!30207)))

(declare-fun b!1193585 () Bool)

(assert (=> b!1193585 (= e!678356 (= (select (arr!37246 _keys!1208) from!1455) k0!934))))

(assert (=> b!1193585 e!678350))

(declare-fun c!117306 () Bool)

(assert (=> b!1193585 (= c!117306 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!542621 () Unit!39594)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!977 (array!77193 array!77195 (_ BitVec 32) (_ BitVec 32) V!45403 V!45403 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39594)

(assert (=> b!1193585 (= lt!542621 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!977 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!100098 res!794109) b!1193578))

(assert (= (and b!1193578 res!794107) b!1193572))

(assert (= (and b!1193572 res!794102) b!1193575))

(assert (= (and b!1193575 res!794112) b!1193581))

(assert (= (and b!1193581 res!794105) b!1193579))

(assert (= (and b!1193579 res!794103) b!1193571))

(assert (= (and b!1193571 res!794106) b!1193580))

(assert (= (and b!1193580 res!794113) b!1193569))

(assert (= (and b!1193569 res!794104) b!1193574))

(assert (= (and b!1193574 res!794111) b!1193576))

(assert (= (and b!1193576 (not res!794110)) b!1193582))

(assert (= (and b!1193582 (not res!794108)) b!1193585))

(assert (= (and b!1193585 c!117306) b!1193570))

(assert (= (and b!1193585 (not c!117306)) b!1193573))

(assert (= (or b!1193570 b!1193573) bm!57126))

(assert (= (or b!1193570 b!1193573) bm!57125))

(assert (= (and b!1193577 condMapEmpty!47138) mapIsEmpty!47138))

(assert (= (and b!1193577 (not condMapEmpty!47138)) mapNonEmpty!47138))

(get-info :version)

(assert (= (and mapNonEmpty!47138 ((_ is ValueCellFull!14394) mapValue!47138)) b!1193584))

(assert (= (and b!1193577 ((_ is ValueCellFull!14394) mapDefault!47138)) b!1193583))

(assert (= start!100098 b!1193577))

(declare-fun b_lambda!20815 () Bool)

(assert (=> (not b_lambda!20815) (not b!1193582)))

(declare-fun t!38897 () Bool)

(declare-fun tb!10483 () Bool)

(assert (=> (and start!100098 (= defaultEntry!1004 defaultEntry!1004) t!38897) tb!10483))

(declare-fun result!21533 () Bool)

(assert (=> tb!10483 (= result!21533 tp_is_empty!30207)))

(assert (=> b!1193582 t!38897))

(declare-fun b_and!42211 () Bool)

(assert (= b_and!42209 (and (=> t!38897 result!21533) b_and!42211)))

(declare-fun m!1101773 () Bool)

(assert (=> b!1193581 m!1101773))

(declare-fun m!1101775 () Bool)

(assert (=> b!1193571 m!1101775))

(declare-fun m!1101777 () Bool)

(assert (=> b!1193578 m!1101777))

(declare-fun m!1101779 () Bool)

(assert (=> b!1193580 m!1101779))

(declare-fun m!1101781 () Bool)

(assert (=> bm!57125 m!1101781))

(declare-fun m!1101783 () Bool)

(assert (=> b!1193576 m!1101783))

(declare-fun m!1101785 () Bool)

(assert (=> b!1193576 m!1101785))

(declare-fun m!1101787 () Bool)

(assert (=> b!1193569 m!1101787))

(declare-fun m!1101789 () Bool)

(assert (=> b!1193569 m!1101789))

(declare-fun m!1101791 () Bool)

(assert (=> start!100098 m!1101791))

(declare-fun m!1101793 () Bool)

(assert (=> start!100098 m!1101793))

(declare-fun m!1101795 () Bool)

(assert (=> mapNonEmpty!47138 m!1101795))

(declare-fun m!1101797 () Bool)

(assert (=> bm!57126 m!1101797))

(declare-fun m!1101799 () Bool)

(assert (=> b!1193574 m!1101799))

(declare-fun m!1101801 () Bool)

(assert (=> b!1193582 m!1101801))

(declare-fun m!1101803 () Bool)

(assert (=> b!1193582 m!1101803))

(declare-fun m!1101805 () Bool)

(assert (=> b!1193582 m!1101805))

(declare-fun m!1101807 () Bool)

(assert (=> b!1193582 m!1101807))

(declare-fun m!1101809 () Bool)

(assert (=> b!1193585 m!1101809))

(declare-fun m!1101811 () Bool)

(assert (=> b!1193585 m!1101811))

(declare-fun m!1101813 () Bool)

(assert (=> b!1193570 m!1101813))

(declare-fun m!1101815 () Bool)

(assert (=> b!1193575 m!1101815))

(check-sat (not b!1193575) (not start!100098) (not b!1193585) (not mapNonEmpty!47138) (not bm!57125) (not b!1193582) b_and!42211 (not b!1193574) tp_is_empty!30207 (not b!1193571) (not b!1193578) (not b_next!25671) (not b_lambda!20815) (not b!1193576) (not b!1193570) (not b!1193569) (not bm!57126) (not b!1193581))
(check-sat b_and!42211 (not b_next!25671))
