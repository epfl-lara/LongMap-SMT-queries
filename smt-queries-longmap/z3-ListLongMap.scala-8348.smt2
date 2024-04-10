; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101640 () Bool)

(assert start!101640)

(declare-fun b_free!26361 () Bool)

(declare-fun b_next!26361 () Bool)

(assert (=> start!101640 (= b_free!26361 (not b_next!26361))))

(declare-fun tp!92126 () Bool)

(declare-fun b_and!43965 () Bool)

(assert (=> start!101640 (= tp!92126 b_and!43965)))

(declare-fun b!1222418 () Bool)

(declare-fun res!812186 () Bool)

(declare-fun e!694232 () Bool)

(assert (=> b!1222418 (=> (not res!812186) (not e!694232))))

(declare-datatypes ((array!78913 0))(
  ( (array!78914 (arr!38084 (Array (_ BitVec 32) (_ BitVec 64))) (size!38620 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78913)

(declare-datatypes ((List!26878 0))(
  ( (Nil!26875) (Cons!26874 (h!28083 (_ BitVec 64)) (t!40219 List!26878)) )
))
(declare-fun arrayNoDuplicates!0 (array!78913 (_ BitVec 32) List!26878) Bool)

(assert (=> b!1222418 (= res!812186 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26875))))

(declare-fun b!1222419 () Bool)

(declare-fun e!694239 () Bool)

(declare-fun e!694234 () Bool)

(assert (=> b!1222419 (= e!694239 e!694234)))

(declare-fun res!812195 () Bool)

(assert (=> b!1222419 (=> res!812195 e!694234)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1222419 (= res!812195 (not (= (select (arr!38084 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1222420 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!78913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1222420 (= e!694234 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222421 () Bool)

(declare-fun e!694229 () Bool)

(declare-fun tp_is_empty!31065 () Bool)

(assert (=> b!1222421 (= e!694229 tp_is_empty!31065)))

(declare-fun res!812196 () Bool)

(assert (=> start!101640 (=> (not res!812196) (not e!694232))))

(assert (=> start!101640 (= res!812196 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38620 _keys!1208))))))

(assert (=> start!101640 e!694232))

(assert (=> start!101640 tp_is_empty!31065))

(declare-fun array_inv!28976 (array!78913) Bool)

(assert (=> start!101640 (array_inv!28976 _keys!1208)))

(assert (=> start!101640 true))

(assert (=> start!101640 tp!92126))

(declare-datatypes ((V!46547 0))(
  ( (V!46548 (val!15589 Int)) )
))
(declare-datatypes ((ValueCell!14823 0))(
  ( (ValueCellFull!14823 (v!18250 V!46547)) (EmptyCell!14823) )
))
(declare-datatypes ((array!78915 0))(
  ( (array!78916 (arr!38085 (Array (_ BitVec 32) ValueCell!14823)) (size!38621 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78915)

(declare-fun e!694231 () Bool)

(declare-fun array_inv!28977 (array!78915) Bool)

(assert (=> start!101640 (and (array_inv!28977 _values!996) e!694231)))

(declare-fun b!1222422 () Bool)

(declare-fun res!812188 () Bool)

(assert (=> b!1222422 (=> (not res!812188) (not e!694232))))

(assert (=> b!1222422 (= res!812188 (= (select (arr!38084 _keys!1208) i!673) k0!934))))

(declare-fun b!1222423 () Bool)

(declare-fun res!812193 () Bool)

(assert (=> b!1222423 (=> (not res!812193) (not e!694232))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222423 (= res!812193 (validKeyInArray!0 k0!934))))

(declare-fun b!1222424 () Bool)

(declare-fun res!812184 () Bool)

(declare-fun e!694236 () Bool)

(assert (=> b!1222424 (=> (not res!812184) (not e!694236))))

(declare-fun lt!556155 () array!78913)

(assert (=> b!1222424 (= res!812184 (arrayNoDuplicates!0 lt!556155 #b00000000000000000000000000000000 Nil!26875))))

(declare-fun b!1222425 () Bool)

(declare-datatypes ((Unit!40482 0))(
  ( (Unit!40483) )
))
(declare-fun e!694230 () Unit!40482)

(declare-fun Unit!40484 () Unit!40482)

(assert (=> b!1222425 (= e!694230 Unit!40484)))

(declare-fun b!1222426 () Bool)

(declare-fun res!812192 () Bool)

(assert (=> b!1222426 (=> (not res!812192) (not e!694232))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78913 (_ BitVec 32)) Bool)

(assert (=> b!1222426 (= res!812192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!48493 () Bool)

(declare-fun mapRes!48493 () Bool)

(declare-fun tp!92125 () Bool)

(assert (=> mapNonEmpty!48493 (= mapRes!48493 (and tp!92125 e!694229))))

(declare-fun mapRest!48493 () (Array (_ BitVec 32) ValueCell!14823))

(declare-fun mapValue!48493 () ValueCell!14823)

(declare-fun mapKey!48493 () (_ BitVec 32))

(assert (=> mapNonEmpty!48493 (= (arr!38085 _values!996) (store mapRest!48493 mapKey!48493 mapValue!48493))))

(declare-fun b!1222427 () Bool)

(declare-fun res!812187 () Bool)

(assert (=> b!1222427 (=> (not res!812187) (not e!694232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1222427 (= res!812187 (validMask!0 mask!1564))))

(declare-fun b!1222428 () Bool)

(declare-fun e!694238 () Bool)

(assert (=> b!1222428 (= e!694238 (bvslt from!1455 (size!38620 _keys!1208)))))

(declare-fun lt!556162 () Unit!40482)

(assert (=> b!1222428 (= lt!556162 e!694230)))

(declare-fun c!120323 () Bool)

(assert (=> b!1222428 (= c!120323 (= (select (arr!38084 _keys!1208) from!1455) k0!934))))

(assert (=> b!1222428 e!694239))

(declare-fun res!812191 () Bool)

(assert (=> b!1222428 (=> (not res!812191) (not e!694239))))

(declare-fun lt!556168 () V!46547)

(declare-datatypes ((tuple2!20078 0))(
  ( (tuple2!20079 (_1!10050 (_ BitVec 64)) (_2!10050 V!46547)) )
))
(declare-datatypes ((List!26879 0))(
  ( (Nil!26876) (Cons!26875 (h!28084 tuple2!20078) (t!40220 List!26879)) )
))
(declare-datatypes ((ListLongMap!18047 0))(
  ( (ListLongMap!18048 (toList!9039 List!26879)) )
))
(declare-fun lt!556167 () ListLongMap!18047)

(declare-fun lt!556159 () ListLongMap!18047)

(declare-fun +!4100 (ListLongMap!18047 tuple2!20078) ListLongMap!18047)

(declare-fun get!19441 (ValueCell!14823 V!46547) V!46547)

(assert (=> b!1222428 (= res!812191 (= lt!556159 (+!4100 lt!556167 (tuple2!20079 (select (arr!38084 _keys!1208) from!1455) (get!19441 (select (arr!38085 _values!996) from!1455) lt!556168)))))))

(declare-fun b!1222429 () Bool)

(declare-fun res!812197 () Bool)

(assert (=> b!1222429 (=> (not res!812197) (not e!694232))))

(assert (=> b!1222429 (= res!812197 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38620 _keys!1208))))))

(declare-fun b!1222430 () Bool)

(declare-fun e!694233 () Bool)

(assert (=> b!1222430 (= e!694231 (and e!694233 mapRes!48493))))

(declare-fun condMapEmpty!48493 () Bool)

(declare-fun mapDefault!48493 () ValueCell!14823)

(assert (=> b!1222430 (= condMapEmpty!48493 (= (arr!38085 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14823)) mapDefault!48493)))))

(declare-fun b!1222431 () Bool)

(assert (=> b!1222431 (= e!694232 e!694236)))

(declare-fun res!812189 () Bool)

(assert (=> b!1222431 (=> (not res!812189) (not e!694236))))

(assert (=> b!1222431 (= res!812189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556155 mask!1564))))

(assert (=> b!1222431 (= lt!556155 (array!78914 (store (arr!38084 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38620 _keys!1208)))))

(declare-fun b!1222432 () Bool)

(declare-fun res!812198 () Bool)

(assert (=> b!1222432 (=> (not res!812198) (not e!694232))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1222432 (= res!812198 (and (= (size!38621 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38620 _keys!1208) (size!38621 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1222433 () Bool)

(declare-fun e!694228 () Bool)

(assert (=> b!1222433 (= e!694228 e!694238)))

(declare-fun res!812194 () Bool)

(assert (=> b!1222433 (=> res!812194 e!694238)))

(assert (=> b!1222433 (= res!812194 (not (validKeyInArray!0 (select (arr!38084 _keys!1208) from!1455))))))

(declare-fun lt!556163 () ListLongMap!18047)

(assert (=> b!1222433 (= lt!556163 lt!556167)))

(declare-fun lt!556161 () ListLongMap!18047)

(declare-fun -!1943 (ListLongMap!18047 (_ BitVec 64)) ListLongMap!18047)

(assert (=> b!1222433 (= lt!556167 (-!1943 lt!556161 k0!934))))

(declare-fun zeroValue!944 () V!46547)

(declare-fun lt!556165 () array!78915)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46547)

(declare-fun getCurrentListMapNoExtraKeys!5461 (array!78913 array!78915 (_ BitVec 32) (_ BitVec 32) V!46547 V!46547 (_ BitVec 32) Int) ListLongMap!18047)

(assert (=> b!1222433 (= lt!556163 (getCurrentListMapNoExtraKeys!5461 lt!556155 lt!556165 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1222433 (= lt!556161 (getCurrentListMapNoExtraKeys!5461 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!556158 () Unit!40482)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1150 (array!78913 array!78915 (_ BitVec 32) (_ BitVec 32) V!46547 V!46547 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40482)

(assert (=> b!1222433 (= lt!556158 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1150 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1222434 () Bool)

(declare-fun e!694237 () Bool)

(assert (=> b!1222434 (= e!694236 (not e!694237))))

(declare-fun res!812185 () Bool)

(assert (=> b!1222434 (=> res!812185 e!694237)))

(assert (=> b!1222434 (= res!812185 (bvsgt from!1455 i!673))))

(assert (=> b!1222434 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!556156 () Unit!40482)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78913 (_ BitVec 64) (_ BitVec 32)) Unit!40482)

(assert (=> b!1222434 (= lt!556156 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222435 () Bool)

(declare-fun Unit!40485 () Unit!40482)

(assert (=> b!1222435 (= e!694230 Unit!40485)))

(declare-fun lt!556160 () Unit!40482)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78913 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40482)

(assert (=> b!1222435 (= lt!556160 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1222435 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556164 () Unit!40482)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78913 (_ BitVec 32) (_ BitVec 32)) Unit!40482)

(assert (=> b!1222435 (= lt!556164 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1222435 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26875)))

(declare-fun lt!556157 () Unit!40482)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78913 (_ BitVec 64) (_ BitVec 32) List!26878) Unit!40482)

(assert (=> b!1222435 (= lt!556157 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26875))))

(assert (=> b!1222435 false))

(declare-fun mapIsEmpty!48493 () Bool)

(assert (=> mapIsEmpty!48493 mapRes!48493))

(declare-fun b!1222436 () Bool)

(assert (=> b!1222436 (= e!694237 e!694228)))

(declare-fun res!812190 () Bool)

(assert (=> b!1222436 (=> res!812190 e!694228)))

(assert (=> b!1222436 (= res!812190 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1222436 (= lt!556159 (getCurrentListMapNoExtraKeys!5461 lt!556155 lt!556165 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1222436 (= lt!556165 (array!78916 (store (arr!38085 _values!996) i!673 (ValueCellFull!14823 lt!556168)) (size!38621 _values!996)))))

(declare-fun dynLambda!3338 (Int (_ BitVec 64)) V!46547)

(assert (=> b!1222436 (= lt!556168 (dynLambda!3338 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!556166 () ListLongMap!18047)

(assert (=> b!1222436 (= lt!556166 (getCurrentListMapNoExtraKeys!5461 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1222437 () Bool)

(assert (=> b!1222437 (= e!694233 tp_is_empty!31065)))

(assert (= (and start!101640 res!812196) b!1222427))

(assert (= (and b!1222427 res!812187) b!1222432))

(assert (= (and b!1222432 res!812198) b!1222426))

(assert (= (and b!1222426 res!812192) b!1222418))

(assert (= (and b!1222418 res!812186) b!1222429))

(assert (= (and b!1222429 res!812197) b!1222423))

(assert (= (and b!1222423 res!812193) b!1222422))

(assert (= (and b!1222422 res!812188) b!1222431))

(assert (= (and b!1222431 res!812189) b!1222424))

(assert (= (and b!1222424 res!812184) b!1222434))

(assert (= (and b!1222434 (not res!812185)) b!1222436))

(assert (= (and b!1222436 (not res!812190)) b!1222433))

(assert (= (and b!1222433 (not res!812194)) b!1222428))

(assert (= (and b!1222428 res!812191) b!1222419))

(assert (= (and b!1222419 (not res!812195)) b!1222420))

(assert (= (and b!1222428 c!120323) b!1222435))

(assert (= (and b!1222428 (not c!120323)) b!1222425))

(assert (= (and b!1222430 condMapEmpty!48493) mapIsEmpty!48493))

(assert (= (and b!1222430 (not condMapEmpty!48493)) mapNonEmpty!48493))

(get-info :version)

(assert (= (and mapNonEmpty!48493 ((_ is ValueCellFull!14823) mapValue!48493)) b!1222421))

(assert (= (and b!1222430 ((_ is ValueCellFull!14823) mapDefault!48493)) b!1222437))

(assert (= start!101640 b!1222430))

(declare-fun b_lambda!22303 () Bool)

(assert (=> (not b_lambda!22303) (not b!1222436)))

(declare-fun t!40218 () Bool)

(declare-fun tb!11161 () Bool)

(assert (=> (and start!101640 (= defaultEntry!1004 defaultEntry!1004) t!40218) tb!11161))

(declare-fun result!22933 () Bool)

(assert (=> tb!11161 (= result!22933 tp_is_empty!31065)))

(assert (=> b!1222436 t!40218))

(declare-fun b_and!43967 () Bool)

(assert (= b_and!43965 (and (=> t!40218 result!22933) b_and!43967)))

(declare-fun m!1127349 () Bool)

(assert (=> b!1222431 m!1127349))

(declare-fun m!1127351 () Bool)

(assert (=> b!1222431 m!1127351))

(declare-fun m!1127353 () Bool)

(assert (=> b!1222436 m!1127353))

(declare-fun m!1127355 () Bool)

(assert (=> b!1222436 m!1127355))

(declare-fun m!1127357 () Bool)

(assert (=> b!1222436 m!1127357))

(declare-fun m!1127359 () Bool)

(assert (=> b!1222436 m!1127359))

(declare-fun m!1127361 () Bool)

(assert (=> b!1222424 m!1127361))

(declare-fun m!1127363 () Bool)

(assert (=> mapNonEmpty!48493 m!1127363))

(declare-fun m!1127365 () Bool)

(assert (=> b!1222434 m!1127365))

(declare-fun m!1127367 () Bool)

(assert (=> b!1222434 m!1127367))

(declare-fun m!1127369 () Bool)

(assert (=> b!1222418 m!1127369))

(declare-fun m!1127371 () Bool)

(assert (=> b!1222428 m!1127371))

(declare-fun m!1127373 () Bool)

(assert (=> b!1222428 m!1127373))

(assert (=> b!1222428 m!1127373))

(declare-fun m!1127375 () Bool)

(assert (=> b!1222428 m!1127375))

(declare-fun m!1127377 () Bool)

(assert (=> b!1222428 m!1127377))

(declare-fun m!1127379 () Bool)

(assert (=> b!1222420 m!1127379))

(declare-fun m!1127381 () Bool)

(assert (=> b!1222426 m!1127381))

(declare-fun m!1127383 () Bool)

(assert (=> b!1222423 m!1127383))

(declare-fun m!1127385 () Bool)

(assert (=> b!1222435 m!1127385))

(declare-fun m!1127387 () Bool)

(assert (=> b!1222435 m!1127387))

(declare-fun m!1127389 () Bool)

(assert (=> b!1222435 m!1127389))

(declare-fun m!1127391 () Bool)

(assert (=> b!1222435 m!1127391))

(declare-fun m!1127393 () Bool)

(assert (=> b!1222435 m!1127393))

(declare-fun m!1127395 () Bool)

(assert (=> b!1222433 m!1127395))

(declare-fun m!1127397 () Bool)

(assert (=> b!1222433 m!1127397))

(declare-fun m!1127399 () Bool)

(assert (=> b!1222433 m!1127399))

(assert (=> b!1222433 m!1127371))

(declare-fun m!1127401 () Bool)

(assert (=> b!1222433 m!1127401))

(declare-fun m!1127403 () Bool)

(assert (=> b!1222433 m!1127403))

(assert (=> b!1222433 m!1127371))

(declare-fun m!1127405 () Bool)

(assert (=> start!101640 m!1127405))

(declare-fun m!1127407 () Bool)

(assert (=> start!101640 m!1127407))

(declare-fun m!1127409 () Bool)

(assert (=> b!1222422 m!1127409))

(assert (=> b!1222419 m!1127371))

(declare-fun m!1127411 () Bool)

(assert (=> b!1222427 m!1127411))

(check-sat (not b!1222424) b_and!43967 (not b_lambda!22303) (not b!1222427) tp_is_empty!31065 (not b!1222431) (not b!1222426) (not b_next!26361) (not b!1222436) (not b!1222418) (not b!1222420) (not b!1222428) (not b!1222435) (not b!1222423) (not mapNonEmpty!48493) (not b!1222433) (not b!1222434) (not start!101640))
(check-sat b_and!43967 (not b_next!26361))
