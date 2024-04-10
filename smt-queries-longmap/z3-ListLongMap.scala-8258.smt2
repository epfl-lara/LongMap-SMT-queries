; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100498 () Bool)

(assert start!100498)

(declare-fun b_free!25821 () Bool)

(declare-fun b_next!25821 () Bool)

(assert (=> start!100498 (= b_free!25821 (not b_next!25821))))

(declare-fun tp!90453 () Bool)

(declare-fun b_and!42529 () Bool)

(assert (=> start!100498 (= tp!90453 b_and!42529)))

(declare-fun b!1200479 () Bool)

(declare-fun res!799137 () Bool)

(declare-fun e!681749 () Bool)

(assert (=> b!1200479 (=> (not res!799137) (not e!681749))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200479 (= res!799137 (validKeyInArray!0 k0!934))))

(declare-fun b!1200480 () Bool)

(declare-fun e!681746 () Bool)

(declare-datatypes ((V!45827 0))(
  ( (V!45828 (val!15319 Int)) )
))
(declare-datatypes ((tuple2!19610 0))(
  ( (tuple2!19611 (_1!9816 (_ BitVec 64)) (_2!9816 V!45827)) )
))
(declare-datatypes ((List!26430 0))(
  ( (Nil!26427) (Cons!26426 (h!27635 tuple2!19610) (t!39231 List!26430)) )
))
(declare-datatypes ((ListLongMap!17579 0))(
  ( (ListLongMap!17580 (toList!8805 List!26430)) )
))
(declare-fun call!57293 () ListLongMap!17579)

(declare-fun call!57292 () ListLongMap!17579)

(assert (=> b!1200480 (= e!681746 (= call!57293 call!57292))))

(declare-fun b!1200481 () Bool)

(declare-fun e!681750 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77823 0))(
  ( (array!77824 (arr!37556 (Array (_ BitVec 32) (_ BitVec 64))) (size!38092 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77823)

(assert (=> b!1200481 (= e!681750 (bvslt from!1455 (size!38092 _keys!1208)))))

(assert (=> b!1200481 e!681746))

(declare-fun c!117443 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1200481 (= c!117443 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!45827)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14553 0))(
  ( (ValueCellFull!14553 (v!17957 V!45827)) (EmptyCell!14553) )
))
(declare-datatypes ((array!77825 0))(
  ( (array!77826 (arr!37557 (Array (_ BitVec 32) ValueCell!14553)) (size!38093 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77825)

(declare-datatypes ((Unit!39802 0))(
  ( (Unit!39803) )
))
(declare-fun lt!544062 () Unit!39802)

(declare-fun minValue!944 () V!45827)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!988 (array!77823 array!77825 (_ BitVec 32) (_ BitVec 32) V!45827 V!45827 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39802)

(assert (=> b!1200481 (= lt!544062 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!988 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200482 () Bool)

(declare-fun res!799134 () Bool)

(assert (=> b!1200482 (=> (not res!799134) (not e!681749))))

(assert (=> b!1200482 (= res!799134 (= (select (arr!37556 _keys!1208) i!673) k0!934))))

(declare-fun b!1200483 () Bool)

(declare-fun res!799133 () Bool)

(declare-fun e!681743 () Bool)

(assert (=> b!1200483 (=> (not res!799133) (not e!681743))))

(declare-fun lt!544059 () array!77823)

(declare-datatypes ((List!26431 0))(
  ( (Nil!26428) (Cons!26427 (h!27636 (_ BitVec 64)) (t!39232 List!26431)) )
))
(declare-fun arrayNoDuplicates!0 (array!77823 (_ BitVec 32) List!26431) Bool)

(assert (=> b!1200483 (= res!799133 (arrayNoDuplicates!0 lt!544059 #b00000000000000000000000000000000 Nil!26428))))

(declare-fun res!799140 () Bool)

(assert (=> start!100498 (=> (not res!799140) (not e!681749))))

(assert (=> start!100498 (= res!799140 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38092 _keys!1208))))))

(assert (=> start!100498 e!681749))

(declare-fun tp_is_empty!30525 () Bool)

(assert (=> start!100498 tp_is_empty!30525))

(declare-fun array_inv!28622 (array!77823) Bool)

(assert (=> start!100498 (array_inv!28622 _keys!1208)))

(assert (=> start!100498 true))

(assert (=> start!100498 tp!90453))

(declare-fun e!681748 () Bool)

(declare-fun array_inv!28623 (array!77825) Bool)

(assert (=> start!100498 (and (array_inv!28623 _values!996) e!681748)))

(declare-fun b!1200484 () Bool)

(declare-fun res!799136 () Bool)

(assert (=> b!1200484 (=> (not res!799136) (not e!681749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77823 (_ BitVec 32)) Bool)

(assert (=> b!1200484 (= res!799136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun lt!544058 () array!77825)

(declare-fun bm!57289 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5244 (array!77823 array!77825 (_ BitVec 32) (_ BitVec 32) V!45827 V!45827 (_ BitVec 32) Int) ListLongMap!17579)

(assert (=> bm!57289 (= call!57293 (getCurrentListMapNoExtraKeys!5244 lt!544059 lt!544058 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47630 () Bool)

(declare-fun mapRes!47630 () Bool)

(declare-fun tp!90452 () Bool)

(declare-fun e!681747 () Bool)

(assert (=> mapNonEmpty!47630 (= mapRes!47630 (and tp!90452 e!681747))))

(declare-fun mapRest!47630 () (Array (_ BitVec 32) ValueCell!14553))

(declare-fun mapKey!47630 () (_ BitVec 32))

(declare-fun mapValue!47630 () ValueCell!14553)

(assert (=> mapNonEmpty!47630 (= (arr!37557 _values!996) (store mapRest!47630 mapKey!47630 mapValue!47630))))

(declare-fun b!1200485 () Bool)

(declare-fun e!681744 () Bool)

(assert (=> b!1200485 (= e!681744 tp_is_empty!30525)))

(declare-fun b!1200486 () Bool)

(declare-fun res!799131 () Bool)

(assert (=> b!1200486 (=> (not res!799131) (not e!681749))))

(assert (=> b!1200486 (= res!799131 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26428))))

(declare-fun b!1200487 () Bool)

(assert (=> b!1200487 (= e!681749 e!681743)))

(declare-fun res!799139 () Bool)

(assert (=> b!1200487 (=> (not res!799139) (not e!681743))))

(assert (=> b!1200487 (= res!799139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544059 mask!1564))))

(assert (=> b!1200487 (= lt!544059 (array!77824 (store (arr!37556 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38092 _keys!1208)))))

(declare-fun b!1200488 () Bool)

(declare-fun e!681745 () Bool)

(assert (=> b!1200488 (= e!681745 e!681750)))

(declare-fun res!799132 () Bool)

(assert (=> b!1200488 (=> res!799132 e!681750)))

(assert (=> b!1200488 (= res!799132 (not (= from!1455 i!673)))))

(declare-fun lt!544060 () ListLongMap!17579)

(assert (=> b!1200488 (= lt!544060 (getCurrentListMapNoExtraKeys!5244 lt!544059 lt!544058 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3164 (Int (_ BitVec 64)) V!45827)

(assert (=> b!1200488 (= lt!544058 (array!77826 (store (arr!37557 _values!996) i!673 (ValueCellFull!14553 (dynLambda!3164 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38093 _values!996)))))

(declare-fun lt!544063 () ListLongMap!17579)

(assert (=> b!1200488 (= lt!544063 (getCurrentListMapNoExtraKeys!5244 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!57290 () Bool)

(assert (=> bm!57290 (= call!57292 (getCurrentListMapNoExtraKeys!5244 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200489 () Bool)

(declare-fun res!799130 () Bool)

(assert (=> b!1200489 (=> (not res!799130) (not e!681749))))

(assert (=> b!1200489 (= res!799130 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38092 _keys!1208))))))

(declare-fun b!1200490 () Bool)

(declare-fun res!799138 () Bool)

(assert (=> b!1200490 (=> (not res!799138) (not e!681749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200490 (= res!799138 (validMask!0 mask!1564))))

(declare-fun b!1200491 () Bool)

(assert (=> b!1200491 (= e!681748 (and e!681744 mapRes!47630))))

(declare-fun condMapEmpty!47630 () Bool)

(declare-fun mapDefault!47630 () ValueCell!14553)

(assert (=> b!1200491 (= condMapEmpty!47630 (= (arr!37557 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14553)) mapDefault!47630)))))

(declare-fun mapIsEmpty!47630 () Bool)

(assert (=> mapIsEmpty!47630 mapRes!47630))

(declare-fun b!1200492 () Bool)

(assert (=> b!1200492 (= e!681747 tp_is_empty!30525)))

(declare-fun b!1200493 () Bool)

(declare-fun res!799129 () Bool)

(assert (=> b!1200493 (=> (not res!799129) (not e!681749))))

(assert (=> b!1200493 (= res!799129 (and (= (size!38093 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38092 _keys!1208) (size!38093 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1200494 () Bool)

(declare-fun -!1781 (ListLongMap!17579 (_ BitVec 64)) ListLongMap!17579)

(assert (=> b!1200494 (= e!681746 (= call!57293 (-!1781 call!57292 k0!934)))))

(declare-fun b!1200495 () Bool)

(assert (=> b!1200495 (= e!681743 (not e!681745))))

(declare-fun res!799135 () Bool)

(assert (=> b!1200495 (=> res!799135 e!681745)))

(assert (=> b!1200495 (= res!799135 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200495 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!544061 () Unit!39802)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77823 (_ BitVec 64) (_ BitVec 32)) Unit!39802)

(assert (=> b!1200495 (= lt!544061 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!100498 res!799140) b!1200490))

(assert (= (and b!1200490 res!799138) b!1200493))

(assert (= (and b!1200493 res!799129) b!1200484))

(assert (= (and b!1200484 res!799136) b!1200486))

(assert (= (and b!1200486 res!799131) b!1200489))

(assert (= (and b!1200489 res!799130) b!1200479))

(assert (= (and b!1200479 res!799137) b!1200482))

(assert (= (and b!1200482 res!799134) b!1200487))

(assert (= (and b!1200487 res!799139) b!1200483))

(assert (= (and b!1200483 res!799133) b!1200495))

(assert (= (and b!1200495 (not res!799135)) b!1200488))

(assert (= (and b!1200488 (not res!799132)) b!1200481))

(assert (= (and b!1200481 c!117443) b!1200494))

(assert (= (and b!1200481 (not c!117443)) b!1200480))

(assert (= (or b!1200494 b!1200480) bm!57289))

(assert (= (or b!1200494 b!1200480) bm!57290))

(assert (= (and b!1200491 condMapEmpty!47630) mapIsEmpty!47630))

(assert (= (and b!1200491 (not condMapEmpty!47630)) mapNonEmpty!47630))

(get-info :version)

(assert (= (and mapNonEmpty!47630 ((_ is ValueCellFull!14553) mapValue!47630)) b!1200492))

(assert (= (and b!1200491 ((_ is ValueCellFull!14553) mapDefault!47630)) b!1200485))

(assert (= start!100498 b!1200491))

(declare-fun b_lambda!21017 () Bool)

(assert (=> (not b_lambda!21017) (not b!1200488)))

(declare-fun t!39230 () Bool)

(declare-fun tb!10621 () Bool)

(assert (=> (and start!100498 (= defaultEntry!1004 defaultEntry!1004) t!39230) tb!10621))

(declare-fun result!21819 () Bool)

(assert (=> tb!10621 (= result!21819 tp_is_empty!30525)))

(assert (=> b!1200488 t!39230))

(declare-fun b_and!42531 () Bool)

(assert (= b_and!42529 (and (=> t!39230 result!21819) b_and!42531)))

(declare-fun m!1106777 () Bool)

(assert (=> b!1200483 m!1106777))

(declare-fun m!1106779 () Bool)

(assert (=> mapNonEmpty!47630 m!1106779))

(declare-fun m!1106781 () Bool)

(assert (=> b!1200481 m!1106781))

(declare-fun m!1106783 () Bool)

(assert (=> b!1200488 m!1106783))

(declare-fun m!1106785 () Bool)

(assert (=> b!1200488 m!1106785))

(declare-fun m!1106787 () Bool)

(assert (=> b!1200488 m!1106787))

(declare-fun m!1106789 () Bool)

(assert (=> b!1200488 m!1106789))

(declare-fun m!1106791 () Bool)

(assert (=> b!1200482 m!1106791))

(declare-fun m!1106793 () Bool)

(assert (=> b!1200490 m!1106793))

(declare-fun m!1106795 () Bool)

(assert (=> b!1200494 m!1106795))

(declare-fun m!1106797 () Bool)

(assert (=> b!1200495 m!1106797))

(declare-fun m!1106799 () Bool)

(assert (=> b!1200495 m!1106799))

(declare-fun m!1106801 () Bool)

(assert (=> bm!57289 m!1106801))

(declare-fun m!1106803 () Bool)

(assert (=> start!100498 m!1106803))

(declare-fun m!1106805 () Bool)

(assert (=> start!100498 m!1106805))

(declare-fun m!1106807 () Bool)

(assert (=> b!1200487 m!1106807))

(declare-fun m!1106809 () Bool)

(assert (=> b!1200487 m!1106809))

(declare-fun m!1106811 () Bool)

(assert (=> b!1200484 m!1106811))

(declare-fun m!1106813 () Bool)

(assert (=> bm!57290 m!1106813))

(declare-fun m!1106815 () Bool)

(assert (=> b!1200479 m!1106815))

(declare-fun m!1106817 () Bool)

(assert (=> b!1200486 m!1106817))

(check-sat (not b!1200488) (not mapNonEmpty!47630) (not b!1200487) (not b!1200495) (not b!1200481) (not b_next!25821) (not b!1200483) (not bm!57290) (not b!1200490) (not b!1200479) (not b!1200494) tp_is_empty!30525 (not b!1200486) (not bm!57289) (not start!100498) b_and!42531 (not b!1200484) (not b_lambda!21017))
(check-sat b_and!42531 (not b_next!25821))
