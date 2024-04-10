; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97918 () Bool)

(assert start!97918)

(declare-fun b_free!23619 () Bool)

(declare-fun b_next!23619 () Bool)

(assert (=> start!97918 (= b_free!23619 (not b_next!23619))))

(declare-fun tp!83560 () Bool)

(declare-fun b_and!38021 () Bool)

(assert (=> start!97918 (= tp!83560 b_and!38021)))

(declare-fun b!1121746 () Bool)

(declare-fun e!638679 () Bool)

(declare-fun e!638672 () Bool)

(assert (=> b!1121746 (= e!638679 e!638672)))

(declare-fun res!749400 () Bool)

(assert (=> b!1121746 (=> (not res!749400) (not e!638672))))

(declare-datatypes ((array!73179 0))(
  ( (array!73180 (arr!35242 (Array (_ BitVec 32) (_ BitVec 64))) (size!35778 (_ BitVec 32))) )
))
(declare-fun lt!498466 () array!73179)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73179 (_ BitVec 32)) Bool)

(assert (=> b!1121746 (= res!749400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498466 mask!1564))))

(declare-fun _keys!1208 () array!73179)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1121746 (= lt!498466 (array!73180 (store (arr!35242 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35778 _keys!1208)))))

(declare-fun b!1121747 () Bool)

(declare-fun res!749407 () Bool)

(assert (=> b!1121747 (=> (not res!749407) (not e!638679))))

(assert (=> b!1121747 (= res!749407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1121748 () Bool)

(declare-fun res!749405 () Bool)

(assert (=> b!1121748 (=> (not res!749405) (not e!638679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121748 (= res!749405 (validMask!0 mask!1564))))

(declare-fun b!1121749 () Bool)

(declare-fun res!749397 () Bool)

(assert (=> b!1121749 (=> (not res!749397) (not e!638679))))

(declare-datatypes ((List!24521 0))(
  ( (Nil!24518) (Cons!24517 (h!25726 (_ BitVec 64)) (t!35132 List!24521)) )
))
(declare-fun arrayNoDuplicates!0 (array!73179 (_ BitVec 32) List!24521) Bool)

(assert (=> b!1121749 (= res!749397 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24518))))

(declare-fun mapIsEmpty!44041 () Bool)

(declare-fun mapRes!44041 () Bool)

(assert (=> mapIsEmpty!44041 mapRes!44041))

(declare-fun b!1121750 () Bool)

(declare-fun res!749398 () Bool)

(assert (=> b!1121750 (=> (not res!749398) (not e!638672))))

(assert (=> b!1121750 (= res!749398 (arrayNoDuplicates!0 lt!498466 #b00000000000000000000000000000000 Nil!24518))))

(declare-fun b!1121751 () Bool)

(declare-fun e!638671 () Bool)

(declare-fun e!638675 () Bool)

(assert (=> b!1121751 (= e!638671 e!638675)))

(declare-fun res!749399 () Bool)

(assert (=> b!1121751 (=> res!749399 e!638675)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1121751 (= res!749399 (not (= from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((V!42659 0))(
  ( (V!42660 (val!14131 Int)) )
))
(declare-datatypes ((ValueCell!13365 0))(
  ( (ValueCellFull!13365 (v!16764 V!42659)) (EmptyCell!13365) )
))
(declare-datatypes ((array!73181 0))(
  ( (array!73182 (arr!35243 (Array (_ BitVec 32) ValueCell!13365)) (size!35779 (_ BitVec 32))) )
))
(declare-fun lt!498464 () array!73181)

(declare-fun minValue!944 () V!42659)

(declare-datatypes ((tuple2!17740 0))(
  ( (tuple2!17741 (_1!8881 (_ BitVec 64)) (_2!8881 V!42659)) )
))
(declare-datatypes ((List!24522 0))(
  ( (Nil!24519) (Cons!24518 (h!25727 tuple2!17740) (t!35133 List!24522)) )
))
(declare-datatypes ((ListLongMap!15709 0))(
  ( (ListLongMap!15710 (toList!7870 List!24522)) )
))
(declare-fun lt!498465 () ListLongMap!15709)

(declare-fun zeroValue!944 () V!42659)

(declare-fun getCurrentListMapNoExtraKeys!4359 (array!73179 array!73181 (_ BitVec 32) (_ BitVec 32) V!42659 V!42659 (_ BitVec 32) Int) ListLongMap!15709)

(assert (=> b!1121751 (= lt!498465 (getCurrentListMapNoExtraKeys!4359 lt!498466 lt!498464 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73181)

(declare-fun dynLambda!2458 (Int (_ BitVec 64)) V!42659)

(assert (=> b!1121751 (= lt!498464 (array!73182 (store (arr!35243 _values!996) i!673 (ValueCellFull!13365 (dynLambda!2458 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35779 _values!996)))))

(declare-fun lt!498462 () ListLongMap!15709)

(assert (=> b!1121751 (= lt!498462 (getCurrentListMapNoExtraKeys!4359 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!47136 () Bool)

(declare-fun call!47140 () ListLongMap!15709)

(assert (=> bm!47136 (= call!47140 (getCurrentListMapNoExtraKeys!4359 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44041 () Bool)

(declare-fun tp!83561 () Bool)

(declare-fun e!638676 () Bool)

(assert (=> mapNonEmpty!44041 (= mapRes!44041 (and tp!83561 e!638676))))

(declare-fun mapRest!44041 () (Array (_ BitVec 32) ValueCell!13365))

(declare-fun mapKey!44041 () (_ BitVec 32))

(declare-fun mapValue!44041 () ValueCell!13365)

(assert (=> mapNonEmpty!44041 (= (arr!35243 _values!996) (store mapRest!44041 mapKey!44041 mapValue!44041))))

(declare-fun b!1121752 () Bool)

(declare-fun e!638677 () Bool)

(declare-fun tp_is_empty!28149 () Bool)

(assert (=> b!1121752 (= e!638677 tp_is_empty!28149)))

(declare-fun b!1121753 () Bool)

(assert (=> b!1121753 (= e!638676 tp_is_empty!28149)))

(declare-fun b!1121754 () Bool)

(declare-fun e!638674 () Bool)

(assert (=> b!1121754 (= e!638674 (and e!638677 mapRes!44041))))

(declare-fun condMapEmpty!44041 () Bool)

(declare-fun mapDefault!44041 () ValueCell!13365)

(assert (=> b!1121754 (= condMapEmpty!44041 (= (arr!35243 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13365)) mapDefault!44041)))))

(declare-fun b!1121755 () Bool)

(declare-fun res!749403 () Bool)

(assert (=> b!1121755 (=> (not res!749403) (not e!638679))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1121755 (= res!749403 (= (select (arr!35242 _keys!1208) i!673) k0!934))))

(declare-fun b!1121756 () Bool)

(assert (=> b!1121756 (= e!638672 (not e!638671))))

(declare-fun res!749396 () Bool)

(assert (=> b!1121756 (=> res!749396 e!638671)))

(assert (=> b!1121756 (= res!749396 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1121756 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36798 0))(
  ( (Unit!36799) )
))
(declare-fun lt!498463 () Unit!36798)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73179 (_ BitVec 64) (_ BitVec 32)) Unit!36798)

(assert (=> b!1121756 (= lt!498463 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!749406 () Bool)

(assert (=> start!97918 (=> (not res!749406) (not e!638679))))

(assert (=> start!97918 (= res!749406 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35778 _keys!1208))))))

(assert (=> start!97918 e!638679))

(assert (=> start!97918 tp_is_empty!28149))

(declare-fun array_inv!27058 (array!73179) Bool)

(assert (=> start!97918 (array_inv!27058 _keys!1208)))

(assert (=> start!97918 true))

(assert (=> start!97918 tp!83560))

(declare-fun array_inv!27059 (array!73181) Bool)

(assert (=> start!97918 (and (array_inv!27059 _values!996) e!638674)))

(declare-fun b!1121757 () Bool)

(assert (=> b!1121757 (= e!638675 true)))

(declare-fun e!638673 () Bool)

(assert (=> b!1121757 e!638673))

(declare-fun c!109419 () Bool)

(assert (=> b!1121757 (= c!109419 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!498467 () Unit!36798)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!327 (array!73179 array!73181 (_ BitVec 32) (_ BitVec 32) V!42659 V!42659 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36798)

(assert (=> b!1121757 (= lt!498467 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!327 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121758 () Bool)

(declare-fun res!749402 () Bool)

(assert (=> b!1121758 (=> (not res!749402) (not e!638679))))

(assert (=> b!1121758 (= res!749402 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35778 _keys!1208))))))

(declare-fun call!47139 () ListLongMap!15709)

(declare-fun b!1121759 () Bool)

(declare-fun -!1079 (ListLongMap!15709 (_ BitVec 64)) ListLongMap!15709)

(assert (=> b!1121759 (= e!638673 (= call!47139 (-!1079 call!47140 k0!934)))))

(declare-fun b!1121760 () Bool)

(declare-fun res!749401 () Bool)

(assert (=> b!1121760 (=> (not res!749401) (not e!638679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121760 (= res!749401 (validKeyInArray!0 k0!934))))

(declare-fun bm!47137 () Bool)

(assert (=> bm!47137 (= call!47139 (getCurrentListMapNoExtraKeys!4359 lt!498466 lt!498464 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121761 () Bool)

(assert (=> b!1121761 (= e!638673 (= call!47139 call!47140))))

(declare-fun b!1121762 () Bool)

(declare-fun res!749404 () Bool)

(assert (=> b!1121762 (=> (not res!749404) (not e!638679))))

(assert (=> b!1121762 (= res!749404 (and (= (size!35779 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35778 _keys!1208) (size!35779 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97918 res!749406) b!1121748))

(assert (= (and b!1121748 res!749405) b!1121762))

(assert (= (and b!1121762 res!749404) b!1121747))

(assert (= (and b!1121747 res!749407) b!1121749))

(assert (= (and b!1121749 res!749397) b!1121758))

(assert (= (and b!1121758 res!749402) b!1121760))

(assert (= (and b!1121760 res!749401) b!1121755))

(assert (= (and b!1121755 res!749403) b!1121746))

(assert (= (and b!1121746 res!749400) b!1121750))

(assert (= (and b!1121750 res!749398) b!1121756))

(assert (= (and b!1121756 (not res!749396)) b!1121751))

(assert (= (and b!1121751 (not res!749399)) b!1121757))

(assert (= (and b!1121757 c!109419) b!1121759))

(assert (= (and b!1121757 (not c!109419)) b!1121761))

(assert (= (or b!1121759 b!1121761) bm!47137))

(assert (= (or b!1121759 b!1121761) bm!47136))

(assert (= (and b!1121754 condMapEmpty!44041) mapIsEmpty!44041))

(assert (= (and b!1121754 (not condMapEmpty!44041)) mapNonEmpty!44041))

(get-info :version)

(assert (= (and mapNonEmpty!44041 ((_ is ValueCellFull!13365) mapValue!44041)) b!1121753))

(assert (= (and b!1121754 ((_ is ValueCellFull!13365) mapDefault!44041)) b!1121752))

(assert (= start!97918 b!1121754))

(declare-fun b_lambda!18589 () Bool)

(assert (=> (not b_lambda!18589) (not b!1121751)))

(declare-fun t!35131 () Bool)

(declare-fun tb!8431 () Bool)

(assert (=> (and start!97918 (= defaultEntry!1004 defaultEntry!1004) t!35131) tb!8431))

(declare-fun result!17423 () Bool)

(assert (=> tb!8431 (= result!17423 tp_is_empty!28149)))

(assert (=> b!1121751 t!35131))

(declare-fun b_and!38023 () Bool)

(assert (= b_and!38021 (and (=> t!35131 result!17423) b_and!38023)))

(declare-fun m!1036523 () Bool)

(assert (=> b!1121747 m!1036523))

(declare-fun m!1036525 () Bool)

(assert (=> b!1121755 m!1036525))

(declare-fun m!1036527 () Bool)

(assert (=> b!1121751 m!1036527))

(declare-fun m!1036529 () Bool)

(assert (=> b!1121751 m!1036529))

(declare-fun m!1036531 () Bool)

(assert (=> b!1121751 m!1036531))

(declare-fun m!1036533 () Bool)

(assert (=> b!1121751 m!1036533))

(declare-fun m!1036535 () Bool)

(assert (=> b!1121759 m!1036535))

(declare-fun m!1036537 () Bool)

(assert (=> bm!47137 m!1036537))

(declare-fun m!1036539 () Bool)

(assert (=> b!1121748 m!1036539))

(declare-fun m!1036541 () Bool)

(assert (=> b!1121746 m!1036541))

(declare-fun m!1036543 () Bool)

(assert (=> b!1121746 m!1036543))

(declare-fun m!1036545 () Bool)

(assert (=> start!97918 m!1036545))

(declare-fun m!1036547 () Bool)

(assert (=> start!97918 m!1036547))

(declare-fun m!1036549 () Bool)

(assert (=> b!1121756 m!1036549))

(declare-fun m!1036551 () Bool)

(assert (=> b!1121756 m!1036551))

(declare-fun m!1036553 () Bool)

(assert (=> b!1121760 m!1036553))

(declare-fun m!1036555 () Bool)

(assert (=> b!1121757 m!1036555))

(declare-fun m!1036557 () Bool)

(assert (=> b!1121749 m!1036557))

(declare-fun m!1036559 () Bool)

(assert (=> b!1121750 m!1036559))

(declare-fun m!1036561 () Bool)

(assert (=> mapNonEmpty!44041 m!1036561))

(declare-fun m!1036563 () Bool)

(assert (=> bm!47136 m!1036563))

(check-sat (not bm!47137) (not b!1121759) (not b!1121751) (not b!1121760) tp_is_empty!28149 (not b!1121747) (not b!1121749) (not start!97918) (not b!1121750) (not b_next!23619) (not bm!47136) b_and!38023 (not b!1121748) (not mapNonEmpty!44041) (not b!1121757) (not b_lambda!18589) (not b!1121746) (not b!1121756))
(check-sat b_and!38023 (not b_next!23619))
