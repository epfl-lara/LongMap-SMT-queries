; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98726 () Bool)

(assert start!98726)

(declare-fun b_free!24337 () Bool)

(declare-fun b_next!24337 () Bool)

(assert (=> start!98726 (= b_free!24337 (not b_next!24337))))

(declare-fun tp!85721 () Bool)

(declare-fun b_and!39501 () Bool)

(assert (=> start!98726 (= tp!85721 b_and!39501)))

(declare-fun mapIsEmpty!45125 () Bool)

(declare-fun mapRes!45125 () Bool)

(assert (=> mapIsEmpty!45125 mapRes!45125))

(declare-fun b!1150390 () Bool)

(declare-fun call!53568 () Bool)

(assert (=> b!1150390 call!53568))

(declare-datatypes ((Unit!37658 0))(
  ( (Unit!37659) )
))
(declare-fun lt!514679 () Unit!37658)

(declare-fun call!53569 () Unit!37658)

(assert (=> b!1150390 (= lt!514679 call!53569)))

(declare-fun e!654306 () Unit!37658)

(assert (=> b!1150390 (= e!654306 lt!514679)))

(declare-fun b!1150391 () Bool)

(declare-fun e!654301 () Unit!37658)

(declare-fun Unit!37660 () Unit!37658)

(assert (=> b!1150391 (= e!654301 Unit!37660)))

(declare-fun lt!514676 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1150391 (= lt!514676 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113865 () Bool)

(assert (=> b!1150391 (= c!113865 (and (not lt!514676) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!514680 () Unit!37658)

(declare-fun e!654314 () Unit!37658)

(assert (=> b!1150391 (= lt!514680 e!654314)))

(declare-datatypes ((V!43617 0))(
  ( (V!43618 (val!14490 Int)) )
))
(declare-fun zeroValue!944 () V!43617)

(declare-datatypes ((array!74498 0))(
  ( (array!74499 (arr!35900 (Array (_ BitVec 32) (_ BitVec 64))) (size!36438 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74498)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!514682 () Unit!37658)

(declare-datatypes ((ValueCell!13724 0))(
  ( (ValueCellFull!13724 (v!17126 V!43617)) (EmptyCell!13724) )
))
(declare-datatypes ((array!74500 0))(
  ( (array!74501 (arr!35901 (Array (_ BitVec 32) ValueCell!13724)) (size!36439 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74500)

(declare-fun minValue!944 () V!43617)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!450 (array!74498 array!74500 (_ BitVec 32) (_ BitVec 32) V!43617 V!43617 (_ BitVec 64) (_ BitVec 32) Int) Unit!37658)

(assert (=> b!1150391 (= lt!514682 (lemmaListMapContainsThenArrayContainsFrom!450 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113870 () Bool)

(assert (=> b!1150391 (= c!113870 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765186 () Bool)

(declare-fun e!654300 () Bool)

(assert (=> b!1150391 (= res!765186 e!654300)))

(declare-fun e!654312 () Bool)

(assert (=> b!1150391 (=> (not res!765186) (not e!654312))))

(assert (=> b!1150391 e!654312))

(declare-fun lt!514664 () Unit!37658)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74498 (_ BitVec 32) (_ BitVec 32)) Unit!37658)

(assert (=> b!1150391 (= lt!514664 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25199 0))(
  ( (Nil!25196) (Cons!25195 (h!26404 (_ BitVec 64)) (t!36519 List!25199)) )
))
(declare-fun arrayNoDuplicates!0 (array!74498 (_ BitVec 32) List!25199) Bool)

(assert (=> b!1150391 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25196)))

(declare-fun lt!514677 () Unit!37658)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74498 (_ BitVec 64) (_ BitVec 32) List!25199) Unit!37658)

(assert (=> b!1150391 (= lt!514677 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25196))))

(assert (=> b!1150391 false))

(declare-fun bm!53560 () Bool)

(declare-datatypes ((tuple2!18464 0))(
  ( (tuple2!18465 (_1!9243 (_ BitVec 64)) (_2!9243 V!43617)) )
))
(declare-datatypes ((List!25200 0))(
  ( (Nil!25197) (Cons!25196 (h!26405 tuple2!18464) (t!36520 List!25200)) )
))
(declare-datatypes ((ListLongMap!16433 0))(
  ( (ListLongMap!16434 (toList!8232 List!25200)) )
))
(declare-fun call!53567 () ListLongMap!16433)

(declare-fun lt!514678 () ListLongMap!16433)

(declare-fun call!53563 () Bool)

(declare-fun contains!6688 (ListLongMap!16433 (_ BitVec 64)) Bool)

(assert (=> bm!53560 (= call!53563 (contains!6688 (ite c!113865 lt!514678 call!53567) k0!934))))

(declare-fun b!1150392 () Bool)

(declare-fun res!765191 () Bool)

(declare-fun e!654302 () Bool)

(assert (=> b!1150392 (=> (not res!765191) (not e!654302))))

(assert (=> b!1150392 (= res!765191 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25196))))

(declare-fun b!1150393 () Bool)

(declare-fun e!654313 () Unit!37658)

(declare-fun lt!514669 () Unit!37658)

(assert (=> b!1150393 (= e!654313 lt!514669)))

(assert (=> b!1150393 (= lt!514669 call!53569)))

(assert (=> b!1150393 call!53568))

(declare-fun mapNonEmpty!45125 () Bool)

(declare-fun tp!85722 () Bool)

(declare-fun e!654311 () Bool)

(assert (=> mapNonEmpty!45125 (= mapRes!45125 (and tp!85722 e!654311))))

(declare-fun mapRest!45125 () (Array (_ BitVec 32) ValueCell!13724))

(declare-fun mapValue!45125 () ValueCell!13724)

(declare-fun mapKey!45125 () (_ BitVec 32))

(assert (=> mapNonEmpty!45125 (= (arr!35901 _values!996) (store mapRest!45125 mapKey!45125 mapValue!45125))))

(declare-fun b!1150394 () Bool)

(declare-fun arrayContainsKey!0 (array!74498 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1150394 (= e!654312 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150395 () Bool)

(declare-fun e!654308 () Bool)

(declare-fun e!654304 () Bool)

(assert (=> b!1150395 (= e!654308 (not e!654304))))

(declare-fun res!765189 () Bool)

(assert (=> b!1150395 (=> res!765189 e!654304)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1150395 (= res!765189 (bvsgt from!1455 i!673))))

(assert (=> b!1150395 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!514672 () Unit!37658)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74498 (_ BitVec 64) (_ BitVec 32)) Unit!37658)

(assert (=> b!1150395 (= lt!514672 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1150396 () Bool)

(declare-fun e!654315 () Bool)

(declare-fun e!654307 () Bool)

(assert (=> b!1150396 (= e!654315 (and e!654307 mapRes!45125))))

(declare-fun condMapEmpty!45125 () Bool)

(declare-fun mapDefault!45125 () ValueCell!13724)

(assert (=> b!1150396 (= condMapEmpty!45125 (= (arr!35901 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13724)) mapDefault!45125)))))

(declare-fun b!1150397 () Bool)

(declare-fun Unit!37661 () Unit!37658)

(assert (=> b!1150397 (= e!654306 Unit!37661)))

(declare-fun b!1150398 () Bool)

(declare-fun tp_is_empty!28867 () Bool)

(assert (=> b!1150398 (= e!654311 tp_is_empty!28867)))

(declare-fun b!1150399 () Bool)

(declare-fun call!53570 () ListLongMap!16433)

(assert (=> b!1150399 (contains!6688 call!53570 k0!934)))

(declare-fun lt!514674 () Unit!37658)

(declare-fun addStillContains!858 (ListLongMap!16433 (_ BitVec 64) V!43617 (_ BitVec 64)) Unit!37658)

(assert (=> b!1150399 (= lt!514674 (addStillContains!858 lt!514678 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1150399 call!53563))

(declare-fun lt!514673 () ListLongMap!16433)

(declare-fun +!3648 (ListLongMap!16433 tuple2!18464) ListLongMap!16433)

(assert (=> b!1150399 (= lt!514678 (+!3648 lt!514673 (tuple2!18465 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!514668 () Unit!37658)

(declare-fun call!53564 () Unit!37658)

(assert (=> b!1150399 (= lt!514668 call!53564)))

(assert (=> b!1150399 (= e!654314 lt!514674)))

(declare-fun bm!53561 () Bool)

(declare-fun c!113866 () Bool)

(assert (=> bm!53561 (= call!53564 (addStillContains!858 lt!514673 (ite (or c!113865 c!113866) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113865 c!113866) zeroValue!944 minValue!944) k0!934))))

(declare-fun res!765188 () Bool)

(assert (=> start!98726 (=> (not res!765188) (not e!654302))))

(assert (=> start!98726 (= res!765188 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36438 _keys!1208))))))

(assert (=> start!98726 e!654302))

(assert (=> start!98726 tp_is_empty!28867))

(declare-fun array_inv!27582 (array!74498) Bool)

(assert (=> start!98726 (array_inv!27582 _keys!1208)))

(assert (=> start!98726 true))

(assert (=> start!98726 tp!85721))

(declare-fun array_inv!27583 (array!74500) Bool)

(assert (=> start!98726 (and (array_inv!27583 _values!996) e!654315)))

(declare-fun b!1150400 () Bool)

(declare-fun res!765184 () Bool)

(assert (=> b!1150400 (=> (not res!765184) (not e!654302))))

(assert (=> b!1150400 (= res!765184 (and (= (size!36439 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36438 _keys!1208) (size!36439 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun call!53566 () ListLongMap!16433)

(declare-fun e!654303 () Bool)

(declare-fun b!1150401 () Bool)

(declare-fun call!53565 () ListLongMap!16433)

(declare-fun -!1300 (ListLongMap!16433 (_ BitVec 64)) ListLongMap!16433)

(assert (=> b!1150401 (= e!654303 (= call!53565 (-!1300 call!53566 k0!934)))))

(declare-fun b!1150402 () Bool)

(declare-fun e!654299 () Bool)

(assert (=> b!1150402 (= e!654304 e!654299)))

(declare-fun res!765196 () Bool)

(assert (=> b!1150402 (=> res!765196 e!654299)))

(assert (=> b!1150402 (= res!765196 (not (= from!1455 i!673)))))

(declare-fun lt!514671 () array!74500)

(declare-fun lt!514666 () ListLongMap!16433)

(declare-fun lt!514665 () array!74498)

(declare-fun getCurrentListMapNoExtraKeys!4716 (array!74498 array!74500 (_ BitVec 32) (_ BitVec 32) V!43617 V!43617 (_ BitVec 32) Int) ListLongMap!16433)

(assert (=> b!1150402 (= lt!514666 (getCurrentListMapNoExtraKeys!4716 lt!514665 lt!514671 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!514670 () V!43617)

(assert (=> b!1150402 (= lt!514671 (array!74501 (store (arr!35901 _values!996) i!673 (ValueCellFull!13724 lt!514670)) (size!36439 _values!996)))))

(declare-fun dynLambda!2679 (Int (_ BitVec 64)) V!43617)

(assert (=> b!1150402 (= lt!514670 (dynLambda!2679 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!514675 () ListLongMap!16433)

(assert (=> b!1150402 (= lt!514675 (getCurrentListMapNoExtraKeys!4716 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!53562 () Bool)

(assert (=> bm!53562 (= call!53569 call!53564)))

(declare-fun b!1150403 () Bool)

(declare-fun res!765195 () Bool)

(assert (=> b!1150403 (=> (not res!765195) (not e!654302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74498 (_ BitVec 32)) Bool)

(assert (=> b!1150403 (= res!765195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun lt!514663 () ListLongMap!16433)

(declare-fun b!1150404 () Bool)

(declare-fun e!654305 () Bool)

(assert (=> b!1150404 (= e!654305 (= lt!514663 (getCurrentListMapNoExtraKeys!4716 lt!514665 lt!514671 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!53563 () Bool)

(assert (=> bm!53563 (= call!53566 (getCurrentListMapNoExtraKeys!4716 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150405 () Bool)

(assert (=> b!1150405 (= e!654300 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!514676) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1150406 () Bool)

(declare-fun e!654310 () Bool)

(assert (=> b!1150406 (= e!654299 e!654310)))

(declare-fun res!765192 () Bool)

(assert (=> b!1150406 (=> res!765192 e!654310)))

(assert (=> b!1150406 (= res!765192 (not (= (select (arr!35900 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1150406 e!654303))

(declare-fun c!113867 () Bool)

(assert (=> b!1150406 (= c!113867 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!514662 () Unit!37658)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!575 (array!74498 array!74500 (_ BitVec 32) (_ BitVec 32) V!43617 V!43617 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37658)

(assert (=> b!1150406 (= lt!514662 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!575 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150407 () Bool)

(declare-fun res!765194 () Bool)

(assert (=> b!1150407 (=> (not res!765194) (not e!654302))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1150407 (= res!765194 (validKeyInArray!0 k0!934))))

(declare-fun bm!53564 () Bool)

(assert (=> bm!53564 (= call!53565 (getCurrentListMapNoExtraKeys!4716 lt!514665 lt!514671 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150408 () Bool)

(assert (=> b!1150408 (= c!113866 (and (not lt!514676) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1150408 (= e!654314 e!654313)))

(declare-fun bm!53565 () Bool)

(assert (=> bm!53565 (= call!53568 call!53563)))

(declare-fun b!1150409 () Bool)

(assert (=> b!1150409 (= e!654303 (= call!53565 call!53566))))

(declare-fun b!1150410 () Bool)

(declare-fun res!765197 () Bool)

(assert (=> b!1150410 (=> (not res!765197) (not e!654308))))

(assert (=> b!1150410 (= res!765197 (arrayNoDuplicates!0 lt!514665 #b00000000000000000000000000000000 Nil!25196))))

(declare-fun bm!53566 () Bool)

(assert (=> bm!53566 (= call!53570 (+!3648 (ite c!113865 lt!514678 lt!514673) (ite c!113865 (tuple2!18465 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113866 (tuple2!18465 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18465 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1150411 () Bool)

(assert (=> b!1150411 (= e!654313 e!654306)))

(declare-fun c!113869 () Bool)

(assert (=> b!1150411 (= c!113869 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!514676))))

(declare-fun b!1150412 () Bool)

(declare-fun res!765185 () Bool)

(assert (=> b!1150412 (=> (not res!765185) (not e!654302))))

(assert (=> b!1150412 (= res!765185 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36438 _keys!1208))))))

(declare-fun b!1150413 () Bool)

(assert (=> b!1150413 (= e!654307 tp_is_empty!28867)))

(declare-fun b!1150414 () Bool)

(assert (=> b!1150414 (= e!654302 e!654308)))

(declare-fun res!765187 () Bool)

(assert (=> b!1150414 (=> (not res!765187) (not e!654308))))

(assert (=> b!1150414 (= res!765187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!514665 mask!1564))))

(assert (=> b!1150414 (= lt!514665 (array!74499 (store (arr!35900 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36438 _keys!1208)))))

(declare-fun b!1150415 () Bool)

(declare-fun Unit!37662 () Unit!37658)

(assert (=> b!1150415 (= e!654301 Unit!37662)))

(declare-fun b!1150416 () Bool)

(declare-fun res!765183 () Bool)

(assert (=> b!1150416 (=> (not res!765183) (not e!654302))))

(assert (=> b!1150416 (= res!765183 (= (select (arr!35900 _keys!1208) i!673) k0!934))))

(declare-fun b!1150417 () Bool)

(assert (=> b!1150417 (= e!654300 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150418 () Bool)

(assert (=> b!1150418 (= e!654310 true)))

(assert (=> b!1150418 e!654305))

(declare-fun res!765190 () Bool)

(assert (=> b!1150418 (=> (not res!765190) (not e!654305))))

(assert (=> b!1150418 (= res!765190 (= lt!514663 lt!514673))))

(assert (=> b!1150418 (= lt!514663 (-!1300 lt!514675 k0!934))))

(declare-fun lt!514681 () V!43617)

(assert (=> b!1150418 (= (-!1300 (+!3648 lt!514673 (tuple2!18465 (select (arr!35900 _keys!1208) from!1455) lt!514681)) (select (arr!35900 _keys!1208) from!1455)) lt!514673)))

(declare-fun lt!514683 () Unit!37658)

(declare-fun addThenRemoveForNewKeyIsSame!157 (ListLongMap!16433 (_ BitVec 64) V!43617) Unit!37658)

(assert (=> b!1150418 (= lt!514683 (addThenRemoveForNewKeyIsSame!157 lt!514673 (select (arr!35900 _keys!1208) from!1455) lt!514681))))

(declare-fun get!18283 (ValueCell!13724 V!43617) V!43617)

(assert (=> b!1150418 (= lt!514681 (get!18283 (select (arr!35901 _values!996) from!1455) lt!514670))))

(declare-fun lt!514667 () Unit!37658)

(assert (=> b!1150418 (= lt!514667 e!654301)))

(declare-fun c!113868 () Bool)

(assert (=> b!1150418 (= c!113868 (contains!6688 lt!514673 k0!934))))

(assert (=> b!1150418 (= lt!514673 (getCurrentListMapNoExtraKeys!4716 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150419 () Bool)

(declare-fun res!765193 () Bool)

(assert (=> b!1150419 (=> (not res!765193) (not e!654302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1150419 (= res!765193 (validMask!0 mask!1564))))

(declare-fun bm!53567 () Bool)

(assert (=> bm!53567 (= call!53567 call!53570)))

(assert (= (and start!98726 res!765188) b!1150419))

(assert (= (and b!1150419 res!765193) b!1150400))

(assert (= (and b!1150400 res!765184) b!1150403))

(assert (= (and b!1150403 res!765195) b!1150392))

(assert (= (and b!1150392 res!765191) b!1150412))

(assert (= (and b!1150412 res!765185) b!1150407))

(assert (= (and b!1150407 res!765194) b!1150416))

(assert (= (and b!1150416 res!765183) b!1150414))

(assert (= (and b!1150414 res!765187) b!1150410))

(assert (= (and b!1150410 res!765197) b!1150395))

(assert (= (and b!1150395 (not res!765189)) b!1150402))

(assert (= (and b!1150402 (not res!765196)) b!1150406))

(assert (= (and b!1150406 c!113867) b!1150401))

(assert (= (and b!1150406 (not c!113867)) b!1150409))

(assert (= (or b!1150401 b!1150409) bm!53564))

(assert (= (or b!1150401 b!1150409) bm!53563))

(assert (= (and b!1150406 (not res!765192)) b!1150418))

(assert (= (and b!1150418 c!113868) b!1150391))

(assert (= (and b!1150418 (not c!113868)) b!1150415))

(assert (= (and b!1150391 c!113865) b!1150399))

(assert (= (and b!1150391 (not c!113865)) b!1150408))

(assert (= (and b!1150408 c!113866) b!1150393))

(assert (= (and b!1150408 (not c!113866)) b!1150411))

(assert (= (and b!1150411 c!113869) b!1150390))

(assert (= (and b!1150411 (not c!113869)) b!1150397))

(assert (= (or b!1150393 b!1150390) bm!53562))

(assert (= (or b!1150393 b!1150390) bm!53567))

(assert (= (or b!1150393 b!1150390) bm!53565))

(assert (= (or b!1150399 bm!53565) bm!53560))

(assert (= (or b!1150399 bm!53562) bm!53561))

(assert (= (or b!1150399 bm!53567) bm!53566))

(assert (= (and b!1150391 c!113870) b!1150417))

(assert (= (and b!1150391 (not c!113870)) b!1150405))

(assert (= (and b!1150391 res!765186) b!1150394))

(assert (= (and b!1150418 res!765190) b!1150404))

(assert (= (and b!1150396 condMapEmpty!45125) mapIsEmpty!45125))

(assert (= (and b!1150396 (not condMapEmpty!45125)) mapNonEmpty!45125))

(get-info :version)

(assert (= (and mapNonEmpty!45125 ((_ is ValueCellFull!13724) mapValue!45125)) b!1150398))

(assert (= (and b!1150396 ((_ is ValueCellFull!13724) mapDefault!45125)) b!1150413))

(assert (= start!98726 b!1150396))

(declare-fun b_lambda!19425 () Bool)

(assert (=> (not b_lambda!19425) (not b!1150402)))

(declare-fun t!36518 () Bool)

(declare-fun tb!9141 () Bool)

(assert (=> (and start!98726 (= defaultEntry!1004 defaultEntry!1004) t!36518) tb!9141))

(declare-fun result!18855 () Bool)

(assert (=> tb!9141 (= result!18855 tp_is_empty!28867)))

(assert (=> b!1150402 t!36518))

(declare-fun b_and!39503 () Bool)

(assert (= b_and!39501 (and (=> t!36518 result!18855) b_and!39503)))

(declare-fun m!1060143 () Bool)

(assert (=> bm!53564 m!1060143))

(declare-fun m!1060145 () Bool)

(assert (=> b!1150416 m!1060145))

(declare-fun m!1060147 () Bool)

(assert (=> b!1150406 m!1060147))

(declare-fun m!1060149 () Bool)

(assert (=> b!1150406 m!1060149))

(declare-fun m!1060151 () Bool)

(assert (=> b!1150401 m!1060151))

(declare-fun m!1060153 () Bool)

(assert (=> start!98726 m!1060153))

(declare-fun m!1060155 () Bool)

(assert (=> start!98726 m!1060155))

(declare-fun m!1060157 () Bool)

(assert (=> b!1150394 m!1060157))

(declare-fun m!1060159 () Bool)

(assert (=> b!1150391 m!1060159))

(declare-fun m!1060161 () Bool)

(assert (=> b!1150391 m!1060161))

(declare-fun m!1060163 () Bool)

(assert (=> b!1150391 m!1060163))

(declare-fun m!1060165 () Bool)

(assert (=> b!1150391 m!1060165))

(declare-fun m!1060167 () Bool)

(assert (=> bm!53561 m!1060167))

(declare-fun m!1060169 () Bool)

(assert (=> b!1150419 m!1060169))

(declare-fun m!1060171 () Bool)

(assert (=> b!1150399 m!1060171))

(declare-fun m!1060173 () Bool)

(assert (=> b!1150399 m!1060173))

(declare-fun m!1060175 () Bool)

(assert (=> b!1150399 m!1060175))

(declare-fun m!1060177 () Bool)

(assert (=> bm!53566 m!1060177))

(declare-fun m!1060179 () Bool)

(assert (=> b!1150414 m!1060179))

(declare-fun m!1060181 () Bool)

(assert (=> b!1150414 m!1060181))

(declare-fun m!1060183 () Bool)

(assert (=> b!1150407 m!1060183))

(declare-fun m!1060185 () Bool)

(assert (=> b!1150395 m!1060185))

(declare-fun m!1060187 () Bool)

(assert (=> b!1150395 m!1060187))

(assert (=> b!1150404 m!1060143))

(declare-fun m!1060189 () Bool)

(assert (=> b!1150418 m!1060189))

(assert (=> b!1150418 m!1060147))

(declare-fun m!1060191 () Bool)

(assert (=> b!1150418 m!1060191))

(declare-fun m!1060193 () Bool)

(assert (=> b!1150418 m!1060193))

(declare-fun m!1060195 () Bool)

(assert (=> b!1150418 m!1060195))

(declare-fun m!1060197 () Bool)

(assert (=> b!1150418 m!1060197))

(declare-fun m!1060199 () Bool)

(assert (=> b!1150418 m!1060199))

(declare-fun m!1060201 () Bool)

(assert (=> b!1150418 m!1060201))

(assert (=> b!1150418 m!1060147))

(assert (=> b!1150418 m!1060193))

(assert (=> b!1150418 m!1060201))

(assert (=> b!1150418 m!1060147))

(declare-fun m!1060203 () Bool)

(assert (=> b!1150418 m!1060203))

(assert (=> b!1150417 m!1060157))

(declare-fun m!1060205 () Bool)

(assert (=> b!1150392 m!1060205))

(declare-fun m!1060207 () Bool)

(assert (=> mapNonEmpty!45125 m!1060207))

(declare-fun m!1060209 () Bool)

(assert (=> b!1150402 m!1060209))

(declare-fun m!1060211 () Bool)

(assert (=> b!1150402 m!1060211))

(declare-fun m!1060213 () Bool)

(assert (=> b!1150402 m!1060213))

(declare-fun m!1060215 () Bool)

(assert (=> b!1150402 m!1060215))

(declare-fun m!1060217 () Bool)

(assert (=> b!1150403 m!1060217))

(declare-fun m!1060219 () Bool)

(assert (=> b!1150410 m!1060219))

(assert (=> bm!53563 m!1060189))

(declare-fun m!1060221 () Bool)

(assert (=> bm!53560 m!1060221))

(check-sat (not bm!53561) (not b!1150404) (not bm!53566) (not b!1150399) (not b!1150414) (not b!1150401) (not b!1150419) (not bm!53564) (not b!1150394) (not b!1150402) (not b!1150395) (not b!1150407) b_and!39503 (not bm!53563) (not start!98726) (not b!1150392) (not b!1150418) (not b!1150391) (not b_next!24337) tp_is_empty!28867 (not bm!53560) (not b_lambda!19425) (not b!1150406) (not b!1150410) (not mapNonEmpty!45125) (not b!1150417) (not b!1150403))
(check-sat b_and!39503 (not b_next!24337))
