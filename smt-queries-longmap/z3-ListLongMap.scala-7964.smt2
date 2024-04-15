; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98618 () Bool)

(assert start!98618)

(declare-fun b_free!24229 () Bool)

(declare-fun b_next!24229 () Bool)

(assert (=> start!98618 (= b_free!24229 (not b_next!24229))))

(declare-fun tp!85398 () Bool)

(declare-fun b_and!39285 () Bool)

(assert (=> start!98618 (= tp!85398 b_and!39285)))

(declare-fun b!1145422 () Bool)

(declare-datatypes ((Unit!37462 0))(
  ( (Unit!37463) )
))
(declare-fun e!651557 () Unit!37462)

(declare-fun Unit!37464 () Unit!37462)

(assert (=> b!1145422 (= e!651557 Unit!37464)))

(declare-fun lt!511220 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1145422 (= lt!511220 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112898 () Bool)

(assert (=> b!1145422 (= c!112898 (and (not lt!511220) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!511221 () Unit!37462)

(declare-fun e!651552 () Unit!37462)

(assert (=> b!1145422 (= lt!511221 e!651552)))

(declare-datatypes ((V!43473 0))(
  ( (V!43474 (val!14436 Int)) )
))
(declare-fun zeroValue!944 () V!43473)

(declare-datatypes ((array!74290 0))(
  ( (array!74291 (arr!35796 (Array (_ BitVec 32) (_ BitVec 64))) (size!36334 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74290)

(declare-fun lt!511216 () Unit!37462)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13670 0))(
  ( (ValueCellFull!13670 (v!17072 V!43473)) (EmptyCell!13670) )
))
(declare-datatypes ((array!74292 0))(
  ( (array!74293 (arr!35797 (Array (_ BitVec 32) ValueCell!13670)) (size!36335 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74292)

(declare-fun minValue!944 () V!43473)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!417 (array!74290 array!74292 (_ BitVec 32) (_ BitVec 32) V!43473 V!43473 (_ BitVec 64) (_ BitVec 32) Int) Unit!37462)

(assert (=> b!1145422 (= lt!511216 (lemmaListMapContainsThenArrayContainsFrom!417 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112896 () Bool)

(assert (=> b!1145422 (= c!112896 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762754 () Bool)

(declare-fun e!651554 () Bool)

(assert (=> b!1145422 (= res!762754 e!651554)))

(declare-fun e!651560 () Bool)

(assert (=> b!1145422 (=> (not res!762754) (not e!651560))))

(assert (=> b!1145422 e!651560))

(declare-fun lt!511213 () Unit!37462)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74290 (_ BitVec 32) (_ BitVec 32)) Unit!37462)

(assert (=> b!1145422 (= lt!511213 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25110 0))(
  ( (Nil!25107) (Cons!25106 (h!26315 (_ BitVec 64)) (t!36322 List!25110)) )
))
(declare-fun arrayNoDuplicates!0 (array!74290 (_ BitVec 32) List!25110) Bool)

(assert (=> b!1145422 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25107)))

(declare-fun lt!511227 () Unit!37462)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74290 (_ BitVec 64) (_ BitVec 32) List!25110) Unit!37462)

(assert (=> b!1145422 (= lt!511227 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25107))))

(assert (=> b!1145422 false))

(declare-fun b!1145423 () Bool)

(declare-fun res!762767 () Bool)

(declare-fun e!651556 () Bool)

(assert (=> b!1145423 (=> (not res!762767) (not e!651556))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1145423 (= res!762767 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36334 _keys!1208))))))

(declare-fun bm!52264 () Bool)

(declare-fun call!52268 () Unit!37462)

(declare-datatypes ((tuple2!18374 0))(
  ( (tuple2!18375 (_1!9198 (_ BitVec 64)) (_2!9198 V!43473)) )
))
(declare-datatypes ((List!25111 0))(
  ( (Nil!25108) (Cons!25107 (h!26316 tuple2!18374) (t!36323 List!25111)) )
))
(declare-datatypes ((ListLongMap!16343 0))(
  ( (ListLongMap!16344 (toList!8187 List!25111)) )
))
(declare-fun lt!511233 () ListLongMap!16343)

(declare-fun lt!511225 () ListLongMap!16343)

(declare-fun c!112895 () Bool)

(declare-fun addStillContains!820 (ListLongMap!16343 (_ BitVec 64) V!43473 (_ BitVec 64)) Unit!37462)

(assert (=> bm!52264 (= call!52268 (addStillContains!820 (ite c!112898 lt!511225 lt!511233) (ite c!112898 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112895 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112898 minValue!944 (ite c!112895 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1145424 () Bool)

(declare-fun res!762755 () Bool)

(assert (=> b!1145424 (=> (not res!762755) (not e!651556))))

(assert (=> b!1145424 (= res!762755 (= (select (arr!35796 _keys!1208) i!673) k0!934))))

(declare-fun call!52269 () ListLongMap!16343)

(declare-fun bm!52265 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4673 (array!74290 array!74292 (_ BitVec 32) (_ BitVec 32) V!43473 V!43473 (_ BitVec 32) Int) ListLongMap!16343)

(assert (=> bm!52265 (= call!52269 (getCurrentListMapNoExtraKeys!4673 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145425 () Bool)

(declare-fun e!651561 () Bool)

(declare-fun e!651546 () Bool)

(assert (=> b!1145425 (= e!651561 (not e!651546))))

(declare-fun res!762753 () Bool)

(assert (=> b!1145425 (=> res!762753 e!651546)))

(assert (=> b!1145425 (= res!762753 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74290 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1145425 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!511232 () Unit!37462)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74290 (_ BitVec 64) (_ BitVec 32)) Unit!37462)

(assert (=> b!1145425 (= lt!511232 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!762765 () Bool)

(assert (=> start!98618 (=> (not res!762765) (not e!651556))))

(assert (=> start!98618 (= res!762765 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36334 _keys!1208))))))

(assert (=> start!98618 e!651556))

(declare-fun tp_is_empty!28759 () Bool)

(assert (=> start!98618 tp_is_empty!28759))

(declare-fun array_inv!27510 (array!74290) Bool)

(assert (=> start!98618 (array_inv!27510 _keys!1208)))

(assert (=> start!98618 true))

(assert (=> start!98618 tp!85398))

(declare-fun e!651549 () Bool)

(declare-fun array_inv!27511 (array!74292) Bool)

(assert (=> start!98618 (and (array_inv!27511 _values!996) e!651549)))

(declare-fun b!1145426 () Bool)

(declare-fun e!651551 () Bool)

(assert (=> b!1145426 (= e!651546 e!651551)))

(declare-fun res!762756 () Bool)

(assert (=> b!1145426 (=> res!762756 e!651551)))

(assert (=> b!1145426 (= res!762756 (not (= from!1455 i!673)))))

(declare-fun lt!511228 () ListLongMap!16343)

(declare-fun lt!511217 () array!74292)

(declare-fun lt!511215 () array!74290)

(assert (=> b!1145426 (= lt!511228 (getCurrentListMapNoExtraKeys!4673 lt!511215 lt!511217 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!511214 () V!43473)

(assert (=> b!1145426 (= lt!511217 (array!74293 (store (arr!35797 _values!996) i!673 (ValueCellFull!13670 lt!511214)) (size!36335 _values!996)))))

(declare-fun dynLambda!2646 (Int (_ BitVec 64)) V!43473)

(assert (=> b!1145426 (= lt!511214 (dynLambda!2646 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!511230 () ListLongMap!16343)

(assert (=> b!1145426 (= lt!511230 (getCurrentListMapNoExtraKeys!4673 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1145427 () Bool)

(declare-fun e!651559 () Bool)

(declare-fun call!52270 () ListLongMap!16343)

(assert (=> b!1145427 (= e!651559 (= call!52270 call!52269))))

(declare-fun mapNonEmpty!44963 () Bool)

(declare-fun mapRes!44963 () Bool)

(declare-fun tp!85397 () Bool)

(declare-fun e!651548 () Bool)

(assert (=> mapNonEmpty!44963 (= mapRes!44963 (and tp!85397 e!651548))))

(declare-fun mapValue!44963 () ValueCell!13670)

(declare-fun mapRest!44963 () (Array (_ BitVec 32) ValueCell!13670))

(declare-fun mapKey!44963 () (_ BitVec 32))

(assert (=> mapNonEmpty!44963 (= (arr!35797 _values!996) (store mapRest!44963 mapKey!44963 mapValue!44963))))

(declare-fun b!1145428 () Bool)

(assert (=> b!1145428 (= e!651554 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!511220) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1145429 () Bool)

(declare-fun e!651558 () Unit!37462)

(declare-fun lt!511226 () Unit!37462)

(assert (=> b!1145429 (= e!651558 lt!511226)))

(declare-fun call!52271 () Unit!37462)

(assert (=> b!1145429 (= lt!511226 call!52271)))

(declare-fun call!52273 () Bool)

(assert (=> b!1145429 call!52273))

(declare-fun b!1145430 () Bool)

(assert (=> b!1145430 (= e!651556 e!651561)))

(declare-fun res!762764 () Bool)

(assert (=> b!1145430 (=> (not res!762764) (not e!651561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74290 (_ BitVec 32)) Bool)

(assert (=> b!1145430 (= res!762764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!511215 mask!1564))))

(assert (=> b!1145430 (= lt!511215 (array!74291 (store (arr!35796 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36334 _keys!1208)))))

(declare-fun b!1145431 () Bool)

(declare-fun res!762759 () Bool)

(assert (=> b!1145431 (=> (not res!762759) (not e!651556))))

(assert (=> b!1145431 (= res!762759 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25107))))

(declare-fun b!1145432 () Bool)

(declare-fun res!762757 () Bool)

(assert (=> b!1145432 (=> (not res!762757) (not e!651561))))

(assert (=> b!1145432 (= res!762757 (arrayNoDuplicates!0 lt!511215 #b00000000000000000000000000000000 Nil!25107))))

(declare-fun b!1145433 () Bool)

(declare-fun -!1261 (ListLongMap!16343 (_ BitVec 64)) ListLongMap!16343)

(assert (=> b!1145433 (= e!651559 (= call!52270 (-!1261 call!52269 k0!934)))))

(declare-fun b!1145434 () Bool)

(declare-fun e!651545 () Bool)

(assert (=> b!1145434 (= e!651545 true)))

(declare-fun e!651553 () Bool)

(assert (=> b!1145434 e!651553))

(declare-fun res!762763 () Bool)

(assert (=> b!1145434 (=> (not res!762763) (not e!651553))))

(declare-fun lt!511219 () V!43473)

(declare-fun +!3607 (ListLongMap!16343 tuple2!18374) ListLongMap!16343)

(assert (=> b!1145434 (= res!762763 (= (-!1261 (+!3607 lt!511233 (tuple2!18375 (select (arr!35796 _keys!1208) from!1455) lt!511219)) (select (arr!35796 _keys!1208) from!1455)) lt!511233))))

(declare-fun lt!511229 () Unit!37462)

(declare-fun addThenRemoveForNewKeyIsSame!124 (ListLongMap!16343 (_ BitVec 64) V!43473) Unit!37462)

(assert (=> b!1145434 (= lt!511229 (addThenRemoveForNewKeyIsSame!124 lt!511233 (select (arr!35796 _keys!1208) from!1455) lt!511219))))

(declare-fun get!18214 (ValueCell!13670 V!43473) V!43473)

(assert (=> b!1145434 (= lt!511219 (get!18214 (select (arr!35797 _values!996) from!1455) lt!511214))))

(declare-fun lt!511231 () Unit!37462)

(assert (=> b!1145434 (= lt!511231 e!651557)))

(declare-fun c!112897 () Bool)

(declare-fun contains!6651 (ListLongMap!16343 (_ BitVec 64)) Bool)

(assert (=> b!1145434 (= c!112897 (contains!6651 lt!511233 k0!934))))

(assert (=> b!1145434 (= lt!511233 (getCurrentListMapNoExtraKeys!4673 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145435 () Bool)

(declare-fun e!651550 () Bool)

(assert (=> b!1145435 (= e!651550 tp_is_empty!28759)))

(declare-fun bm!52266 () Bool)

(declare-fun call!52274 () ListLongMap!16343)

(declare-fun call!52272 () ListLongMap!16343)

(assert (=> bm!52266 (= call!52274 call!52272)))

(declare-fun bm!52267 () Bool)

(assert (=> bm!52267 (= call!52271 call!52268)))

(declare-fun b!1145436 () Bool)

(declare-fun res!762766 () Bool)

(assert (=> b!1145436 (=> (not res!762766) (not e!651556))))

(assert (=> b!1145436 (= res!762766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1145437 () Bool)

(declare-fun e!651547 () Unit!37462)

(assert (=> b!1145437 (= e!651558 e!651547)))

(declare-fun c!112893 () Bool)

(assert (=> b!1145437 (= c!112893 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!511220))))

(declare-fun b!1145438 () Bool)

(declare-fun Unit!37465 () Unit!37462)

(assert (=> b!1145438 (= e!651557 Unit!37465)))

(declare-fun b!1145439 () Bool)

(assert (=> b!1145439 (= e!651560 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1145440 () Bool)

(declare-fun res!762761 () Bool)

(assert (=> b!1145440 (=> (not res!762761) (not e!651556))))

(assert (=> b!1145440 (= res!762761 (and (= (size!36335 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36334 _keys!1208) (size!36335 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1145441 () Bool)

(declare-fun res!762760 () Bool)

(assert (=> b!1145441 (=> (not res!762760) (not e!651556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1145441 (= res!762760 (validKeyInArray!0 k0!934))))

(declare-fun b!1145442 () Bool)

(declare-fun Unit!37466 () Unit!37462)

(assert (=> b!1145442 (= e!651547 Unit!37466)))

(declare-fun b!1145443 () Bool)

(assert (=> b!1145443 (contains!6651 (+!3607 lt!511225 (tuple2!18375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!511223 () Unit!37462)

(assert (=> b!1145443 (= lt!511223 call!52268)))

(declare-fun call!52267 () Bool)

(assert (=> b!1145443 call!52267))

(assert (=> b!1145443 (= lt!511225 call!52272)))

(declare-fun lt!511224 () Unit!37462)

(assert (=> b!1145443 (= lt!511224 (addStillContains!820 lt!511233 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1145443 (= e!651552 lt!511223)))

(declare-fun b!1145444 () Bool)

(assert (=> b!1145444 (= e!651548 tp_is_empty!28759)))

(declare-fun bm!52268 () Bool)

(assert (=> bm!52268 (= call!52273 call!52267)))

(declare-fun b!1145445 () Bool)

(assert (=> b!1145445 (= e!651554 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!44963 () Bool)

(assert (=> mapIsEmpty!44963 mapRes!44963))

(declare-fun b!1145446 () Bool)

(assert (=> b!1145446 call!52273))

(declare-fun lt!511222 () Unit!37462)

(assert (=> b!1145446 (= lt!511222 call!52271)))

(assert (=> b!1145446 (= e!651547 lt!511222)))

(declare-fun b!1145447 () Bool)

(assert (=> b!1145447 (= e!651553 (= (-!1261 lt!511230 k0!934) lt!511233))))

(declare-fun b!1145448 () Bool)

(declare-fun res!762758 () Bool)

(assert (=> b!1145448 (=> (not res!762758) (not e!651556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1145448 (= res!762758 (validMask!0 mask!1564))))

(declare-fun bm!52269 () Bool)

(assert (=> bm!52269 (= call!52272 (+!3607 lt!511233 (ite (or c!112898 c!112895) (tuple2!18375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1145449 () Bool)

(assert (=> b!1145449 (= c!112895 (and (not lt!511220) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1145449 (= e!651552 e!651558)))

(declare-fun bm!52270 () Bool)

(assert (=> bm!52270 (= call!52270 (getCurrentListMapNoExtraKeys!4673 lt!511215 lt!511217 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145450 () Bool)

(assert (=> b!1145450 (= e!651551 e!651545)))

(declare-fun res!762762 () Bool)

(assert (=> b!1145450 (=> res!762762 e!651545)))

(assert (=> b!1145450 (= res!762762 (not (= (select (arr!35796 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1145450 e!651559))

(declare-fun c!112894 () Bool)

(assert (=> b!1145450 (= c!112894 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!511218 () Unit!37462)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!541 (array!74290 array!74292 (_ BitVec 32) (_ BitVec 32) V!43473 V!43473 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37462)

(assert (=> b!1145450 (= lt!511218 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!541 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52271 () Bool)

(assert (=> bm!52271 (= call!52267 (contains!6651 (ite c!112898 lt!511225 call!52274) k0!934))))

(declare-fun b!1145451 () Bool)

(assert (=> b!1145451 (= e!651549 (and e!651550 mapRes!44963))))

(declare-fun condMapEmpty!44963 () Bool)

(declare-fun mapDefault!44963 () ValueCell!13670)

(assert (=> b!1145451 (= condMapEmpty!44963 (= (arr!35797 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13670)) mapDefault!44963)))))

(assert (= (and start!98618 res!762765) b!1145448))

(assert (= (and b!1145448 res!762758) b!1145440))

(assert (= (and b!1145440 res!762761) b!1145436))

(assert (= (and b!1145436 res!762766) b!1145431))

(assert (= (and b!1145431 res!762759) b!1145423))

(assert (= (and b!1145423 res!762767) b!1145441))

(assert (= (and b!1145441 res!762760) b!1145424))

(assert (= (and b!1145424 res!762755) b!1145430))

(assert (= (and b!1145430 res!762764) b!1145432))

(assert (= (and b!1145432 res!762757) b!1145425))

(assert (= (and b!1145425 (not res!762753)) b!1145426))

(assert (= (and b!1145426 (not res!762756)) b!1145450))

(assert (= (and b!1145450 c!112894) b!1145433))

(assert (= (and b!1145450 (not c!112894)) b!1145427))

(assert (= (or b!1145433 b!1145427) bm!52270))

(assert (= (or b!1145433 b!1145427) bm!52265))

(assert (= (and b!1145450 (not res!762762)) b!1145434))

(assert (= (and b!1145434 c!112897) b!1145422))

(assert (= (and b!1145434 (not c!112897)) b!1145438))

(assert (= (and b!1145422 c!112898) b!1145443))

(assert (= (and b!1145422 (not c!112898)) b!1145449))

(assert (= (and b!1145449 c!112895) b!1145429))

(assert (= (and b!1145449 (not c!112895)) b!1145437))

(assert (= (and b!1145437 c!112893) b!1145446))

(assert (= (and b!1145437 (not c!112893)) b!1145442))

(assert (= (or b!1145429 b!1145446) bm!52267))

(assert (= (or b!1145429 b!1145446) bm!52266))

(assert (= (or b!1145429 b!1145446) bm!52268))

(assert (= (or b!1145443 bm!52268) bm!52271))

(assert (= (or b!1145443 bm!52267) bm!52264))

(assert (= (or b!1145443 bm!52266) bm!52269))

(assert (= (and b!1145422 c!112896) b!1145445))

(assert (= (and b!1145422 (not c!112896)) b!1145428))

(assert (= (and b!1145422 res!762754) b!1145439))

(assert (= (and b!1145434 res!762763) b!1145447))

(assert (= (and b!1145451 condMapEmpty!44963) mapIsEmpty!44963))

(assert (= (and b!1145451 (not condMapEmpty!44963)) mapNonEmpty!44963))

(get-info :version)

(assert (= (and mapNonEmpty!44963 ((_ is ValueCellFull!13670) mapValue!44963)) b!1145444))

(assert (= (and b!1145451 ((_ is ValueCellFull!13670) mapDefault!44963)) b!1145435))

(assert (= start!98618 b!1145451))

(declare-fun b_lambda!19317 () Bool)

(assert (=> (not b_lambda!19317) (not b!1145426)))

(declare-fun t!36321 () Bool)

(declare-fun tb!9033 () Bool)

(assert (=> (and start!98618 (= defaultEntry!1004 defaultEntry!1004) t!36321) tb!9033))

(declare-fun result!18639 () Bool)

(assert (=> tb!9033 (= result!18639 tp_is_empty!28759)))

(assert (=> b!1145426 t!36321))

(declare-fun b_and!39287 () Bool)

(assert (= b_and!39285 (and (=> t!36321 result!18639) b_and!39287)))

(declare-fun m!1055819 () Bool)

(assert (=> b!1145425 m!1055819))

(declare-fun m!1055821 () Bool)

(assert (=> b!1145425 m!1055821))

(declare-fun m!1055823 () Bool)

(assert (=> b!1145424 m!1055823))

(declare-fun m!1055825 () Bool)

(assert (=> b!1145430 m!1055825))

(declare-fun m!1055827 () Bool)

(assert (=> b!1145430 m!1055827))

(declare-fun m!1055829 () Bool)

(assert (=> b!1145441 m!1055829))

(declare-fun m!1055831 () Bool)

(assert (=> b!1145447 m!1055831))

(declare-fun m!1055833 () Bool)

(assert (=> bm!52269 m!1055833))

(declare-fun m!1055835 () Bool)

(assert (=> b!1145433 m!1055835))

(declare-fun m!1055837 () Bool)

(assert (=> b!1145426 m!1055837))

(declare-fun m!1055839 () Bool)

(assert (=> b!1145426 m!1055839))

(declare-fun m!1055841 () Bool)

(assert (=> b!1145426 m!1055841))

(declare-fun m!1055843 () Bool)

(assert (=> b!1145426 m!1055843))

(declare-fun m!1055845 () Bool)

(assert (=> bm!52265 m!1055845))

(declare-fun m!1055847 () Bool)

(assert (=> b!1145439 m!1055847))

(declare-fun m!1055849 () Bool)

(assert (=> b!1145422 m!1055849))

(declare-fun m!1055851 () Bool)

(assert (=> b!1145422 m!1055851))

(declare-fun m!1055853 () Bool)

(assert (=> b!1145422 m!1055853))

(declare-fun m!1055855 () Bool)

(assert (=> b!1145422 m!1055855))

(declare-fun m!1055857 () Bool)

(assert (=> b!1145448 m!1055857))

(declare-fun m!1055859 () Bool)

(assert (=> b!1145434 m!1055859))

(declare-fun m!1055861 () Bool)

(assert (=> b!1145434 m!1055861))

(assert (=> b!1145434 m!1055845))

(declare-fun m!1055863 () Bool)

(assert (=> b!1145434 m!1055863))

(declare-fun m!1055865 () Bool)

(assert (=> b!1145434 m!1055865))

(declare-fun m!1055867 () Bool)

(assert (=> b!1145434 m!1055867))

(declare-fun m!1055869 () Bool)

(assert (=> b!1145434 m!1055869))

(assert (=> b!1145434 m!1055863))

(assert (=> b!1145434 m!1055859))

(assert (=> b!1145434 m!1055869))

(assert (=> b!1145434 m!1055863))

(declare-fun m!1055871 () Bool)

(assert (=> b!1145434 m!1055871))

(declare-fun m!1055873 () Bool)

(assert (=> start!98618 m!1055873))

(declare-fun m!1055875 () Bool)

(assert (=> start!98618 m!1055875))

(assert (=> b!1145450 m!1055863))

(declare-fun m!1055877 () Bool)

(assert (=> b!1145450 m!1055877))

(declare-fun m!1055879 () Bool)

(assert (=> bm!52264 m!1055879))

(declare-fun m!1055881 () Bool)

(assert (=> b!1145431 m!1055881))

(declare-fun m!1055883 () Bool)

(assert (=> bm!52270 m!1055883))

(assert (=> b!1145445 m!1055847))

(declare-fun m!1055885 () Bool)

(assert (=> b!1145443 m!1055885))

(assert (=> b!1145443 m!1055885))

(declare-fun m!1055887 () Bool)

(assert (=> b!1145443 m!1055887))

(declare-fun m!1055889 () Bool)

(assert (=> b!1145443 m!1055889))

(declare-fun m!1055891 () Bool)

(assert (=> mapNonEmpty!44963 m!1055891))

(declare-fun m!1055893 () Bool)

(assert (=> b!1145436 m!1055893))

(declare-fun m!1055895 () Bool)

(assert (=> bm!52271 m!1055895))

(declare-fun m!1055897 () Bool)

(assert (=> b!1145432 m!1055897))

(check-sat (not b!1145430) (not b!1145439) (not b!1145425) b_and!39287 (not b_lambda!19317) (not bm!52264) (not bm!52271) (not start!98618) (not b!1145445) (not b_next!24229) (not b!1145443) (not b!1145431) (not b!1145450) (not b!1145422) (not b!1145447) (not b!1145434) (not b!1145426) (not b!1145448) (not bm!52265) tp_is_empty!28759 (not bm!52269) (not b!1145441) (not mapNonEmpty!44963) (not b!1145433) (not bm!52270) (not b!1145436) (not b!1145432))
(check-sat b_and!39287 (not b_next!24229))
