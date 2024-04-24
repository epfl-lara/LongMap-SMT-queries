; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98134 () Bool)

(assert start!98134)

(declare-fun b_free!23599 () Bool)

(declare-fun b_next!23599 () Bool)

(assert (=> start!98134 (= b_free!23599 (not b_next!23599))))

(declare-fun tp!83500 () Bool)

(declare-fun b_and!37991 () Bool)

(assert (=> start!98134 (= tp!83500 b_and!37991)))

(declare-fun b!1122543 () Bool)

(declare-fun e!639263 () Bool)

(declare-fun e!639258 () Bool)

(declare-fun mapRes!44011 () Bool)

(assert (=> b!1122543 (= e!639263 (and e!639258 mapRes!44011))))

(declare-fun condMapEmpty!44011 () Bool)

(declare-datatypes ((V!42633 0))(
  ( (V!42634 (val!14121 Int)) )
))
(declare-datatypes ((ValueCell!13355 0))(
  ( (ValueCellFull!13355 (v!16750 V!42633)) (EmptyCell!13355) )
))
(declare-datatypes ((array!73183 0))(
  ( (array!73184 (arr!35238 (Array (_ BitVec 32) ValueCell!13355)) (size!35775 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73183)

(declare-fun mapDefault!44011 () ValueCell!13355)

(assert (=> b!1122543 (= condMapEmpty!44011 (= (arr!35238 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13355)) mapDefault!44011)))))

(declare-fun b!1122544 () Bool)

(declare-fun res!749566 () Bool)

(declare-fun e!639259 () Bool)

(assert (=> b!1122544 (=> (not res!749566) (not e!639259))))

(declare-datatypes ((array!73185 0))(
  ( (array!73186 (arr!35239 (Array (_ BitVec 32) (_ BitVec 64))) (size!35776 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73185)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1122544 (= res!749566 (= (select (arr!35239 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!44011 () Bool)

(assert (=> mapIsEmpty!44011 mapRes!44011))

(declare-fun b!1122545 () Bool)

(declare-fun res!749568 () Bool)

(assert (=> b!1122545 (=> (not res!749568) (not e!639259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1122545 (= res!749568 (validKeyInArray!0 k0!934))))

(declare-fun b!1122546 () Bool)

(declare-fun res!749560 () Bool)

(declare-fun e!639260 () Bool)

(assert (=> b!1122546 (=> (not res!749560) (not e!639260))))

(declare-fun lt!498799 () array!73185)

(declare-datatypes ((List!24528 0))(
  ( (Nil!24525) (Cons!24524 (h!25742 (_ BitVec 64)) (t!35111 List!24528)) )
))
(declare-fun arrayNoDuplicates!0 (array!73185 (_ BitVec 32) List!24528) Bool)

(assert (=> b!1122546 (= res!749560 (arrayNoDuplicates!0 lt!498799 #b00000000000000000000000000000000 Nil!24525))))

(declare-fun b!1122547 () Bool)

(declare-fun res!749561 () Bool)

(assert (=> b!1122547 (=> (not res!749561) (not e!639259))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1122547 (= res!749561 (and (= (size!35775 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35776 _keys!1208) (size!35775 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!44011 () Bool)

(declare-fun tp!83501 () Bool)

(declare-fun e!639257 () Bool)

(assert (=> mapNonEmpty!44011 (= mapRes!44011 (and tp!83501 e!639257))))

(declare-fun mapValue!44011 () ValueCell!13355)

(declare-fun mapRest!44011 () (Array (_ BitVec 32) ValueCell!13355))

(declare-fun mapKey!44011 () (_ BitVec 32))

(assert (=> mapNonEmpty!44011 (= (arr!35238 _values!996) (store mapRest!44011 mapKey!44011 mapValue!44011))))

(declare-fun b!1122548 () Bool)

(declare-fun tp_is_empty!28129 () Bool)

(assert (=> b!1122548 (= e!639257 tp_is_empty!28129)))

(declare-fun res!749567 () Bool)

(assert (=> start!98134 (=> (not res!749567) (not e!639259))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98134 (= res!749567 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35776 _keys!1208))))))

(assert (=> start!98134 e!639259))

(assert (=> start!98134 tp_is_empty!28129))

(declare-fun array_inv!27130 (array!73185) Bool)

(assert (=> start!98134 (array_inv!27130 _keys!1208)))

(assert (=> start!98134 true))

(assert (=> start!98134 tp!83500))

(declare-fun array_inv!27131 (array!73183) Bool)

(assert (=> start!98134 (and (array_inv!27131 _values!996) e!639263)))

(declare-fun b!1122549 () Bool)

(declare-fun res!749569 () Bool)

(assert (=> b!1122549 (=> (not res!749569) (not e!639259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73185 (_ BitVec 32)) Bool)

(assert (=> b!1122549 (= res!749569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1122550 () Bool)

(assert (=> b!1122550 (= e!639259 e!639260)))

(declare-fun res!749564 () Bool)

(assert (=> b!1122550 (=> (not res!749564) (not e!639260))))

(assert (=> b!1122550 (= res!749564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498799 mask!1564))))

(assert (=> b!1122550 (= lt!498799 (array!73186 (store (arr!35239 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35776 _keys!1208)))))

(declare-fun zeroValue!944 () V!42633)

(declare-datatypes ((tuple2!17732 0))(
  ( (tuple2!17733 (_1!8877 (_ BitVec 64)) (_2!8877 V!42633)) )
))
(declare-datatypes ((List!24529 0))(
  ( (Nil!24526) (Cons!24525 (h!25743 tuple2!17732) (t!35112 List!24529)) )
))
(declare-datatypes ((ListLongMap!15709 0))(
  ( (ListLongMap!15710 (toList!7870 List!24529)) )
))
(declare-fun call!47147 () ListLongMap!15709)

(declare-fun minValue!944 () V!42633)

(declare-fun lt!498800 () array!73183)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!47143 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4400 (array!73185 array!73183 (_ BitVec 32) (_ BitVec 32) V!42633 V!42633 (_ BitVec 32) Int) ListLongMap!15709)

(assert (=> bm!47143 (= call!47147 (getCurrentListMapNoExtraKeys!4400 lt!498799 lt!498800 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122551 () Bool)

(declare-fun e!639261 () Bool)

(declare-fun e!639256 () Bool)

(assert (=> b!1122551 (= e!639261 e!639256)))

(declare-fun res!749558 () Bool)

(assert (=> b!1122551 (=> res!749558 e!639256)))

(assert (=> b!1122551 (= res!749558 (not (= from!1455 i!673)))))

(declare-fun lt!498802 () ListLongMap!15709)

(assert (=> b!1122551 (= lt!498802 (getCurrentListMapNoExtraKeys!4400 lt!498799 lt!498800 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2487 (Int (_ BitVec 64)) V!42633)

(assert (=> b!1122551 (= lt!498800 (array!73184 (store (arr!35238 _values!996) i!673 (ValueCellFull!13355 (dynLambda!2487 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35775 _values!996)))))

(declare-fun lt!498797 () ListLongMap!15709)

(assert (=> b!1122551 (= lt!498797 (getCurrentListMapNoExtraKeys!4400 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1122552 () Bool)

(declare-fun res!749563 () Bool)

(assert (=> b!1122552 (=> (not res!749563) (not e!639259))))

(assert (=> b!1122552 (= res!749563 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24525))))

(declare-fun b!1122553 () Bool)

(assert (=> b!1122553 (= e!639260 (not e!639261))))

(declare-fun res!749562 () Bool)

(assert (=> b!1122553 (=> res!749562 e!639261)))

(assert (=> b!1122553 (= res!749562 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1122553 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36771 0))(
  ( (Unit!36772) )
))
(declare-fun lt!498801 () Unit!36771)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73185 (_ BitVec 64) (_ BitVec 32)) Unit!36771)

(assert (=> b!1122553 (= lt!498801 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1122554 () Bool)

(declare-fun res!749559 () Bool)

(assert (=> b!1122554 (=> (not res!749559) (not e!639259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1122554 (= res!749559 (validMask!0 mask!1564))))

(declare-fun call!47146 () ListLongMap!15709)

(declare-fun bm!47144 () Bool)

(assert (=> bm!47144 (= call!47146 (getCurrentListMapNoExtraKeys!4400 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122555 () Bool)

(declare-fun e!639262 () Bool)

(declare-fun -!1070 (ListLongMap!15709 (_ BitVec 64)) ListLongMap!15709)

(assert (=> b!1122555 (= e!639262 (= call!47147 (-!1070 call!47146 k0!934)))))

(declare-fun b!1122556 () Bool)

(assert (=> b!1122556 (= e!639258 tp_is_empty!28129)))

(declare-fun b!1122557 () Bool)

(declare-fun res!749565 () Bool)

(assert (=> b!1122557 (=> (not res!749565) (not e!639259))))

(assert (=> b!1122557 (= res!749565 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35776 _keys!1208))))))

(declare-fun b!1122558 () Bool)

(assert (=> b!1122558 (= e!639256 true)))

(assert (=> b!1122558 e!639262))

(declare-fun c!109799 () Bool)

(assert (=> b!1122558 (= c!109799 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!498798 () Unit!36771)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!334 (array!73185 array!73183 (_ BitVec 32) (_ BitVec 32) V!42633 V!42633 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36771)

(assert (=> b!1122558 (= lt!498798 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!334 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122559 () Bool)

(assert (=> b!1122559 (= e!639262 (= call!47147 call!47146))))

(assert (= (and start!98134 res!749567) b!1122554))

(assert (= (and b!1122554 res!749559) b!1122547))

(assert (= (and b!1122547 res!749561) b!1122549))

(assert (= (and b!1122549 res!749569) b!1122552))

(assert (= (and b!1122552 res!749563) b!1122557))

(assert (= (and b!1122557 res!749565) b!1122545))

(assert (= (and b!1122545 res!749568) b!1122544))

(assert (= (and b!1122544 res!749566) b!1122550))

(assert (= (and b!1122550 res!749564) b!1122546))

(assert (= (and b!1122546 res!749560) b!1122553))

(assert (= (and b!1122553 (not res!749562)) b!1122551))

(assert (= (and b!1122551 (not res!749558)) b!1122558))

(assert (= (and b!1122558 c!109799) b!1122555))

(assert (= (and b!1122558 (not c!109799)) b!1122559))

(assert (= (or b!1122555 b!1122559) bm!47143))

(assert (= (or b!1122555 b!1122559) bm!47144))

(assert (= (and b!1122543 condMapEmpty!44011) mapIsEmpty!44011))

(assert (= (and b!1122543 (not condMapEmpty!44011)) mapNonEmpty!44011))

(get-info :version)

(assert (= (and mapNonEmpty!44011 ((_ is ValueCellFull!13355) mapValue!44011)) b!1122548))

(assert (= (and b!1122543 ((_ is ValueCellFull!13355) mapDefault!44011)) b!1122556))

(assert (= start!98134 b!1122543))

(declare-fun b_lambda!18579 () Bool)

(assert (=> (not b_lambda!18579) (not b!1122551)))

(declare-fun t!35110 () Bool)

(declare-fun tb!8403 () Bool)

(assert (=> (and start!98134 (= defaultEntry!1004 defaultEntry!1004) t!35110) tb!8403))

(declare-fun result!17375 () Bool)

(assert (=> tb!8403 (= result!17375 tp_is_empty!28129)))

(assert (=> b!1122551 t!35110))

(declare-fun b_and!37993 () Bool)

(assert (= b_and!37991 (and (=> t!35110 result!17375) b_and!37993)))

(declare-fun m!1037775 () Bool)

(assert (=> b!1122546 m!1037775))

(declare-fun m!1037777 () Bool)

(assert (=> b!1122550 m!1037777))

(declare-fun m!1037779 () Bool)

(assert (=> b!1122550 m!1037779))

(declare-fun m!1037781 () Bool)

(assert (=> b!1122558 m!1037781))

(declare-fun m!1037783 () Bool)

(assert (=> b!1122555 m!1037783))

(declare-fun m!1037785 () Bool)

(assert (=> b!1122544 m!1037785))

(declare-fun m!1037787 () Bool)

(assert (=> bm!47143 m!1037787))

(declare-fun m!1037789 () Bool)

(assert (=> b!1122551 m!1037789))

(declare-fun m!1037791 () Bool)

(assert (=> b!1122551 m!1037791))

(declare-fun m!1037793 () Bool)

(assert (=> b!1122551 m!1037793))

(declare-fun m!1037795 () Bool)

(assert (=> b!1122551 m!1037795))

(declare-fun m!1037797 () Bool)

(assert (=> bm!47144 m!1037797))

(declare-fun m!1037799 () Bool)

(assert (=> mapNonEmpty!44011 m!1037799))

(declare-fun m!1037801 () Bool)

(assert (=> b!1122553 m!1037801))

(declare-fun m!1037803 () Bool)

(assert (=> b!1122553 m!1037803))

(declare-fun m!1037805 () Bool)

(assert (=> b!1122549 m!1037805))

(declare-fun m!1037807 () Bool)

(assert (=> start!98134 m!1037807))

(declare-fun m!1037809 () Bool)

(assert (=> start!98134 m!1037809))

(declare-fun m!1037811 () Bool)

(assert (=> b!1122545 m!1037811))

(declare-fun m!1037813 () Bool)

(assert (=> b!1122554 m!1037813))

(declare-fun m!1037815 () Bool)

(assert (=> b!1122552 m!1037815))

(check-sat (not b!1122545) (not bm!47143) (not b!1122554) (not mapNonEmpty!44011) (not b!1122549) (not b_lambda!18579) (not b!1122555) (not b!1122551) (not b!1122552) (not b!1122546) b_and!37993 (not start!98134) (not b!1122553) (not bm!47144) tp_is_empty!28129 (not b!1122558) (not b!1122550) (not b_next!23599))
(check-sat b_and!37993 (not b_next!23599))
