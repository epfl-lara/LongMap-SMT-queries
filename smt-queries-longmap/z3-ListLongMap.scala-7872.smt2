; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98212 () Bool)

(assert start!98212)

(declare-fun b_free!23677 () Bool)

(declare-fun b_next!23677 () Bool)

(assert (=> start!98212 (= b_free!23677 (not b_next!23677))))

(declare-fun tp!83735 () Bool)

(declare-fun b_and!38147 () Bool)

(assert (=> start!98212 (= tp!83735 b_and!38147)))

(declare-fun b!1124686 () Bool)

(declare-fun res!751047 () Bool)

(declare-fun e!640389 () Bool)

(assert (=> b!1124686 (=> res!751047 e!640389)))

(declare-datatypes ((V!42737 0))(
  ( (V!42738 (val!14160 Int)) )
))
(declare-fun zeroValue!944 () V!42737)

(declare-datatypes ((array!73331 0))(
  ( (array!73332 (arr!35312 (Array (_ BitVec 32) (_ BitVec 64))) (size!35849 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73331)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13394 0))(
  ( (ValueCellFull!13394 (v!16789 V!42737)) (EmptyCell!13394) )
))
(declare-datatypes ((array!73333 0))(
  ( (array!73334 (arr!35313 (Array (_ BitVec 32) ValueCell!13394)) (size!35850 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73333)

(declare-fun minValue!944 () V!42737)

(declare-datatypes ((tuple2!17796 0))(
  ( (tuple2!17797 (_1!8909 (_ BitVec 64)) (_2!8909 V!42737)) )
))
(declare-datatypes ((List!24587 0))(
  ( (Nil!24584) (Cons!24583 (h!25801 tuple2!17796) (t!35248 List!24587)) )
))
(declare-datatypes ((ListLongMap!15773 0))(
  ( (ListLongMap!15774 (toList!7902 List!24587)) )
))
(declare-fun contains!6460 (ListLongMap!15773 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4429 (array!73331 array!73333 (_ BitVec 32) (_ BitVec 32) V!42737 V!42737 (_ BitVec 32) Int) ListLongMap!15773)

(assert (=> b!1124686 (= res!751047 (not (contains!6460 (getCurrentListMapNoExtraKeys!4429 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934)))))

(declare-fun b!1124687 () Bool)

(declare-fun e!640385 () Bool)

(declare-fun e!640391 () Bool)

(assert (=> b!1124687 (= e!640385 (not e!640391))))

(declare-fun res!751043 () Bool)

(assert (=> b!1124687 (=> res!751043 e!640391)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1124687 (= res!751043 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1124687 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36829 0))(
  ( (Unit!36830) )
))
(declare-fun lt!499573 () Unit!36829)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73331 (_ BitVec 64) (_ BitVec 32)) Unit!36829)

(assert (=> b!1124687 (= lt!499573 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1124688 () Bool)

(declare-fun res!751050 () Bool)

(declare-fun e!640386 () Bool)

(assert (=> b!1124688 (=> (not res!751050) (not e!640386))))

(declare-datatypes ((List!24588 0))(
  ( (Nil!24585) (Cons!24584 (h!25802 (_ BitVec 64)) (t!35249 List!24588)) )
))
(declare-fun arrayNoDuplicates!0 (array!73331 (_ BitVec 32) List!24588) Bool)

(assert (=> b!1124688 (= res!751050 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24585))))

(declare-fun res!751044 () Bool)

(assert (=> start!98212 (=> (not res!751044) (not e!640386))))

(assert (=> start!98212 (= res!751044 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35849 _keys!1208))))))

(assert (=> start!98212 e!640386))

(declare-fun tp_is_empty!28207 () Bool)

(assert (=> start!98212 tp_is_empty!28207))

(declare-fun array_inv!27174 (array!73331) Bool)

(assert (=> start!98212 (array_inv!27174 _keys!1208)))

(assert (=> start!98212 true))

(assert (=> start!98212 tp!83735))

(declare-fun e!640383 () Bool)

(declare-fun array_inv!27175 (array!73333) Bool)

(assert (=> start!98212 (and (array_inv!27175 _values!996) e!640383)))

(declare-fun mapIsEmpty!44128 () Bool)

(declare-fun mapRes!44128 () Bool)

(assert (=> mapIsEmpty!44128 mapRes!44128))

(declare-fun b!1124689 () Bool)

(declare-fun res!751039 () Bool)

(assert (=> b!1124689 (=> (not res!751039) (not e!640386))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1124689 (= res!751039 (validKeyInArray!0 k0!934))))

(declare-fun b!1124690 () Bool)

(declare-fun res!751049 () Bool)

(assert (=> b!1124690 (=> (not res!751049) (not e!640386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1124690 (= res!751049 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!44128 () Bool)

(declare-fun tp!83734 () Bool)

(declare-fun e!640387 () Bool)

(assert (=> mapNonEmpty!44128 (= mapRes!44128 (and tp!83734 e!640387))))

(declare-fun mapKey!44128 () (_ BitVec 32))

(declare-fun mapValue!44128 () ValueCell!13394)

(declare-fun mapRest!44128 () (Array (_ BitVec 32) ValueCell!13394))

(assert (=> mapNonEmpty!44128 (= (arr!35313 _values!996) (store mapRest!44128 mapKey!44128 mapValue!44128))))

(declare-fun b!1124691 () Bool)

(declare-fun e!640384 () Bool)

(assert (=> b!1124691 (= e!640391 e!640384)))

(declare-fun res!751046 () Bool)

(assert (=> b!1124691 (=> res!751046 e!640384)))

(assert (=> b!1124691 (= res!751046 (not (= from!1455 i!673)))))

(declare-fun lt!499572 () array!73333)

(declare-fun lt!499575 () ListLongMap!15773)

(declare-fun lt!499576 () array!73331)

(assert (=> b!1124691 (= lt!499575 (getCurrentListMapNoExtraKeys!4429 lt!499576 lt!499572 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2510 (Int (_ BitVec 64)) V!42737)

(assert (=> b!1124691 (= lt!499572 (array!73334 (store (arr!35313 _values!996) i!673 (ValueCellFull!13394 (dynLambda!2510 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35850 _values!996)))))

(declare-fun lt!499574 () ListLongMap!15773)

(assert (=> b!1124691 (= lt!499574 (getCurrentListMapNoExtraKeys!4429 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1124692 () Bool)

(declare-fun res!751040 () Bool)

(assert (=> b!1124692 (=> (not res!751040) (not e!640385))))

(assert (=> b!1124692 (= res!751040 (arrayNoDuplicates!0 lt!499576 #b00000000000000000000000000000000 Nil!24585))))

(declare-fun b!1124693 () Bool)

(declare-fun res!751042 () Bool)

(assert (=> b!1124693 (=> (not res!751042) (not e!640386))))

(assert (=> b!1124693 (= res!751042 (and (= (size!35850 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35849 _keys!1208) (size!35850 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1124694 () Bool)

(assert (=> b!1124694 (= e!640387 tp_is_empty!28207)))

(declare-fun b!1124695 () Bool)

(declare-fun res!751045 () Bool)

(assert (=> b!1124695 (=> (not res!751045) (not e!640386))))

(assert (=> b!1124695 (= res!751045 (= (select (arr!35312 _keys!1208) i!673) k0!934))))

(declare-fun b!1124696 () Bool)

(assert (=> b!1124696 (= e!640389 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!35849 _keys!1208)))))))

(declare-fun b!1124697 () Bool)

(declare-fun res!751048 () Bool)

(assert (=> b!1124697 (=> (not res!751048) (not e!640386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73331 (_ BitVec 32)) Bool)

(assert (=> b!1124697 (= res!751048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1124698 () Bool)

(declare-fun e!640388 () Bool)

(assert (=> b!1124698 (= e!640388 tp_is_empty!28207)))

(declare-fun b!1124699 () Bool)

(declare-fun e!640390 () Bool)

(declare-fun call!47381 () ListLongMap!15773)

(declare-fun call!47380 () ListLongMap!15773)

(assert (=> b!1124699 (= e!640390 (= call!47381 call!47380))))

(declare-fun b!1124700 () Bool)

(assert (=> b!1124700 (= e!640386 e!640385)))

(declare-fun res!751051 () Bool)

(assert (=> b!1124700 (=> (not res!751051) (not e!640385))))

(assert (=> b!1124700 (= res!751051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499576 mask!1564))))

(assert (=> b!1124700 (= lt!499576 (array!73332 (store (arr!35312 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35849 _keys!1208)))))

(declare-fun b!1124701 () Bool)

(assert (=> b!1124701 (= e!640383 (and e!640388 mapRes!44128))))

(declare-fun condMapEmpty!44128 () Bool)

(declare-fun mapDefault!44128 () ValueCell!13394)

(assert (=> b!1124701 (= condMapEmpty!44128 (= (arr!35313 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13394)) mapDefault!44128)))))

(declare-fun bm!47377 () Bool)

(assert (=> bm!47377 (= call!47381 (getCurrentListMapNoExtraKeys!4429 lt!499576 lt!499572 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47378 () Bool)

(assert (=> bm!47378 (= call!47380 (getCurrentListMapNoExtraKeys!4429 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124702 () Bool)

(declare-fun -!1094 (ListLongMap!15773 (_ BitVec 64)) ListLongMap!15773)

(assert (=> b!1124702 (= e!640390 (= call!47381 (-!1094 call!47380 k0!934)))))

(declare-fun b!1124703 () Bool)

(declare-fun res!751041 () Bool)

(assert (=> b!1124703 (=> (not res!751041) (not e!640386))))

(assert (=> b!1124703 (= res!751041 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35849 _keys!1208))))))

(declare-fun b!1124704 () Bool)

(assert (=> b!1124704 (= e!640384 e!640389)))

(declare-fun res!751038 () Bool)

(assert (=> b!1124704 (=> res!751038 e!640389)))

(assert (=> b!1124704 (= res!751038 (not (= (select (arr!35312 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1124704 e!640390))

(declare-fun c!109916 () Bool)

(assert (=> b!1124704 (= c!109916 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499571 () Unit!36829)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!355 (array!73331 array!73333 (_ BitVec 32) (_ BitVec 32) V!42737 V!42737 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36829)

(assert (=> b!1124704 (= lt!499571 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!355 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98212 res!751044) b!1124690))

(assert (= (and b!1124690 res!751049) b!1124693))

(assert (= (and b!1124693 res!751042) b!1124697))

(assert (= (and b!1124697 res!751048) b!1124688))

(assert (= (and b!1124688 res!751050) b!1124703))

(assert (= (and b!1124703 res!751041) b!1124689))

(assert (= (and b!1124689 res!751039) b!1124695))

(assert (= (and b!1124695 res!751045) b!1124700))

(assert (= (and b!1124700 res!751051) b!1124692))

(assert (= (and b!1124692 res!751040) b!1124687))

(assert (= (and b!1124687 (not res!751043)) b!1124691))

(assert (= (and b!1124691 (not res!751046)) b!1124704))

(assert (= (and b!1124704 c!109916) b!1124702))

(assert (= (and b!1124704 (not c!109916)) b!1124699))

(assert (= (or b!1124702 b!1124699) bm!47377))

(assert (= (or b!1124702 b!1124699) bm!47378))

(assert (= (and b!1124704 (not res!751038)) b!1124686))

(assert (= (and b!1124686 (not res!751047)) b!1124696))

(assert (= (and b!1124701 condMapEmpty!44128) mapIsEmpty!44128))

(assert (= (and b!1124701 (not condMapEmpty!44128)) mapNonEmpty!44128))

(get-info :version)

(assert (= (and mapNonEmpty!44128 ((_ is ValueCellFull!13394) mapValue!44128)) b!1124694))

(assert (= (and b!1124701 ((_ is ValueCellFull!13394) mapDefault!44128)) b!1124698))

(assert (= start!98212 b!1124701))

(declare-fun b_lambda!18657 () Bool)

(assert (=> (not b_lambda!18657) (not b!1124691)))

(declare-fun t!35247 () Bool)

(declare-fun tb!8481 () Bool)

(assert (=> (and start!98212 (= defaultEntry!1004 defaultEntry!1004) t!35247) tb!8481))

(declare-fun result!17531 () Bool)

(assert (=> tb!8481 (= result!17531 tp_is_empty!28207)))

(assert (=> b!1124691 t!35247))

(declare-fun b_and!38149 () Bool)

(assert (= b_and!38147 (and (=> t!35247 result!17531) b_and!38149)))

(declare-fun m!1039517 () Bool)

(assert (=> b!1124691 m!1039517))

(declare-fun m!1039519 () Bool)

(assert (=> b!1124691 m!1039519))

(declare-fun m!1039521 () Bool)

(assert (=> b!1124691 m!1039521))

(declare-fun m!1039523 () Bool)

(assert (=> b!1124691 m!1039523))

(declare-fun m!1039525 () Bool)

(assert (=> b!1124686 m!1039525))

(assert (=> b!1124686 m!1039525))

(declare-fun m!1039527 () Bool)

(assert (=> b!1124686 m!1039527))

(declare-fun m!1039529 () Bool)

(assert (=> b!1124697 m!1039529))

(declare-fun m!1039531 () Bool)

(assert (=> b!1124702 m!1039531))

(declare-fun m!1039533 () Bool)

(assert (=> b!1124688 m!1039533))

(declare-fun m!1039535 () Bool)

(assert (=> start!98212 m!1039535))

(declare-fun m!1039537 () Bool)

(assert (=> start!98212 m!1039537))

(assert (=> bm!47378 m!1039525))

(declare-fun m!1039539 () Bool)

(assert (=> bm!47377 m!1039539))

(declare-fun m!1039541 () Bool)

(assert (=> mapNonEmpty!44128 m!1039541))

(declare-fun m!1039543 () Bool)

(assert (=> b!1124690 m!1039543))

(declare-fun m!1039545 () Bool)

(assert (=> b!1124695 m!1039545))

(declare-fun m!1039547 () Bool)

(assert (=> b!1124689 m!1039547))

(declare-fun m!1039549 () Bool)

(assert (=> b!1124704 m!1039549))

(declare-fun m!1039551 () Bool)

(assert (=> b!1124704 m!1039551))

(declare-fun m!1039553 () Bool)

(assert (=> b!1124700 m!1039553))

(declare-fun m!1039555 () Bool)

(assert (=> b!1124700 m!1039555))

(declare-fun m!1039557 () Bool)

(assert (=> b!1124692 m!1039557))

(declare-fun m!1039559 () Bool)

(assert (=> b!1124687 m!1039559))

(declare-fun m!1039561 () Bool)

(assert (=> b!1124687 m!1039561))

(check-sat (not b!1124702) (not b!1124700) (not b!1124692) (not bm!47377) (not b_next!23677) (not start!98212) tp_is_empty!28207 (not b!1124704) (not b!1124688) b_and!38149 (not b!1124697) (not b!1124689) (not b!1124691) (not b!1124686) (not b_lambda!18657) (not mapNonEmpty!44128) (not b!1124690) (not b!1124687) (not bm!47378))
(check-sat b_and!38149 (not b_next!23677))
