; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101466 () Bool)

(assert start!101466)

(declare-fun b_free!26283 () Bool)

(declare-fun b_next!26283 () Bool)

(assert (=> start!101466 (= b_free!26283 (not b_next!26283))))

(declare-fun tp!91883 () Bool)

(declare-fun b_and!43755 () Bool)

(assert (=> start!101466 (= tp!91883 b_and!43755)))

(declare-fun b!1219546 () Bool)

(declare-fun e!692459 () Bool)

(declare-fun e!692462 () Bool)

(assert (=> b!1219546 (= e!692459 e!692462)))

(declare-fun res!810021 () Bool)

(assert (=> b!1219546 (=> res!810021 e!692462)))

(declare-datatypes ((array!78751 0))(
  ( (array!78752 (arr!38006 (Array (_ BitVec 32) (_ BitVec 64))) (size!38542 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78751)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1219546 (= res!810021 (not (= (select (arr!38006 _keys!1208) from!1455) k0!934)))))

(declare-fun e!692457 () Bool)

(assert (=> b!1219546 e!692457))

(declare-fun res!810015 () Bool)

(assert (=> b!1219546 (=> (not res!810015) (not e!692457))))

(declare-datatypes ((V!46443 0))(
  ( (V!46444 (val!15550 Int)) )
))
(declare-datatypes ((tuple2!20012 0))(
  ( (tuple2!20013 (_1!10017 (_ BitVec 64)) (_2!10017 V!46443)) )
))
(declare-datatypes ((List!26813 0))(
  ( (Nil!26810) (Cons!26809 (h!28018 tuple2!20012) (t!40076 List!26813)) )
))
(declare-datatypes ((ListLongMap!17981 0))(
  ( (ListLongMap!17982 (toList!9006 List!26813)) )
))
(declare-fun lt!554496 () ListLongMap!17981)

(declare-fun lt!554489 () V!46443)

(declare-fun lt!554490 () ListLongMap!17981)

(declare-datatypes ((ValueCell!14784 0))(
  ( (ValueCellFull!14784 (v!18207 V!46443)) (EmptyCell!14784) )
))
(declare-datatypes ((array!78753 0))(
  ( (array!78754 (arr!38007 (Array (_ BitVec 32) ValueCell!14784)) (size!38543 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78753)

(declare-fun +!4074 (ListLongMap!17981 tuple2!20012) ListLongMap!17981)

(declare-fun get!19383 (ValueCell!14784 V!46443) V!46443)

(assert (=> b!1219546 (= res!810015 (= lt!554496 (+!4074 lt!554490 (tuple2!20013 (select (arr!38006 _keys!1208) from!1455) (get!19383 (select (arr!38007 _values!996) from!1455) lt!554489)))))))

(declare-fun b!1219547 () Bool)

(declare-fun e!692460 () Bool)

(declare-fun e!692463 () Bool)

(assert (=> b!1219547 (= e!692460 (not e!692463))))

(declare-fun res!810017 () Bool)

(assert (=> b!1219547 (=> res!810017 e!692463)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1219547 (= res!810017 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1219547 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40412 0))(
  ( (Unit!40413) )
))
(declare-fun lt!554498 () Unit!40412)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78751 (_ BitVec 64) (_ BitVec 32)) Unit!40412)

(assert (=> b!1219547 (= lt!554498 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1219548 () Bool)

(declare-fun res!810024 () Bool)

(assert (=> b!1219548 (=> (not res!810024) (not e!692460))))

(declare-fun lt!554492 () array!78751)

(declare-datatypes ((List!26814 0))(
  ( (Nil!26811) (Cons!26810 (h!28019 (_ BitVec 64)) (t!40077 List!26814)) )
))
(declare-fun arrayNoDuplicates!0 (array!78751 (_ BitVec 32) List!26814) Bool)

(assert (=> b!1219548 (= res!810024 (arrayNoDuplicates!0 lt!554492 #b00000000000000000000000000000000 Nil!26811))))

(declare-fun b!1219549 () Bool)

(declare-fun e!692458 () Bool)

(assert (=> b!1219549 (= e!692463 e!692458)))

(declare-fun res!810014 () Bool)

(assert (=> b!1219549 (=> res!810014 e!692458)))

(assert (=> b!1219549 (= res!810014 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46443)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!554491 () array!78753)

(declare-fun minValue!944 () V!46443)

(declare-fun getCurrentListMapNoExtraKeys!5431 (array!78751 array!78753 (_ BitVec 32) (_ BitVec 32) V!46443 V!46443 (_ BitVec 32) Int) ListLongMap!17981)

(assert (=> b!1219549 (= lt!554496 (getCurrentListMapNoExtraKeys!5431 lt!554492 lt!554491 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1219549 (= lt!554491 (array!78754 (store (arr!38007 _values!996) i!673 (ValueCellFull!14784 lt!554489)) (size!38543 _values!996)))))

(declare-fun dynLambda!3313 (Int (_ BitVec 64)) V!46443)

(assert (=> b!1219549 (= lt!554489 (dynLambda!3313 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554499 () ListLongMap!17981)

(assert (=> b!1219549 (= lt!554499 (getCurrentListMapNoExtraKeys!5431 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1219550 () Bool)

(declare-fun res!810011 () Bool)

(declare-fun e!692461 () Bool)

(assert (=> b!1219550 (=> (not res!810011) (not e!692461))))

(assert (=> b!1219550 (= res!810011 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38542 _keys!1208))))))

(declare-fun b!1219551 () Bool)

(declare-fun res!810010 () Bool)

(assert (=> b!1219551 (=> (not res!810010) (not e!692461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78751 (_ BitVec 32)) Bool)

(assert (=> b!1219551 (= res!810010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1219552 () Bool)

(declare-fun e!692455 () Bool)

(assert (=> b!1219552 (= e!692457 e!692455)))

(declare-fun res!810023 () Bool)

(assert (=> b!1219552 (=> res!810023 e!692455)))

(assert (=> b!1219552 (= res!810023 (not (= (select (arr!38006 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1219553 () Bool)

(assert (=> b!1219553 (= e!692458 e!692459)))

(declare-fun res!810012 () Bool)

(assert (=> b!1219553 (=> res!810012 e!692459)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1219553 (= res!810012 (not (validKeyInArray!0 (select (arr!38006 _keys!1208) from!1455))))))

(declare-fun lt!554497 () ListLongMap!17981)

(assert (=> b!1219553 (= lt!554497 lt!554490)))

(declare-fun lt!554495 () ListLongMap!17981)

(declare-fun -!1918 (ListLongMap!17981 (_ BitVec 64)) ListLongMap!17981)

(assert (=> b!1219553 (= lt!554490 (-!1918 lt!554495 k0!934))))

(assert (=> b!1219553 (= lt!554497 (getCurrentListMapNoExtraKeys!5431 lt!554492 lt!554491 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1219553 (= lt!554495 (getCurrentListMapNoExtraKeys!5431 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!554494 () Unit!40412)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1125 (array!78751 array!78753 (_ BitVec 32) (_ BitVec 32) V!46443 V!46443 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40412)

(assert (=> b!1219553 (= lt!554494 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1125 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1219554 () Bool)

(assert (=> b!1219554 (= e!692455 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1219555 () Bool)

(assert (=> b!1219555 (= e!692461 e!692460)))

(declare-fun res!810019 () Bool)

(assert (=> b!1219555 (=> (not res!810019) (not e!692460))))

(assert (=> b!1219555 (= res!810019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554492 mask!1564))))

(assert (=> b!1219555 (= lt!554492 (array!78752 (store (arr!38006 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38542 _keys!1208)))))

(declare-fun b!1219556 () Bool)

(declare-fun res!810016 () Bool)

(assert (=> b!1219556 (=> (not res!810016) (not e!692461))))

(assert (=> b!1219556 (= res!810016 (validKeyInArray!0 k0!934))))

(declare-fun b!1219557 () Bool)

(declare-fun res!810013 () Bool)

(assert (=> b!1219557 (=> (not res!810013) (not e!692461))))

(assert (=> b!1219557 (= res!810013 (and (= (size!38543 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38542 _keys!1208) (size!38543 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1219558 () Bool)

(declare-fun e!692453 () Bool)

(declare-fun tp_is_empty!30987 () Bool)

(assert (=> b!1219558 (= e!692453 tp_is_empty!30987)))

(declare-fun b!1219559 () Bool)

(declare-fun e!692454 () Bool)

(declare-fun e!692456 () Bool)

(declare-fun mapRes!48367 () Bool)

(assert (=> b!1219559 (= e!692454 (and e!692456 mapRes!48367))))

(declare-fun condMapEmpty!48367 () Bool)

(declare-fun mapDefault!48367 () ValueCell!14784)

(assert (=> b!1219559 (= condMapEmpty!48367 (= (arr!38007 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14784)) mapDefault!48367)))))

(declare-fun b!1219560 () Bool)

(declare-fun res!810022 () Bool)

(assert (=> b!1219560 (=> (not res!810022) (not e!692461))))

(assert (=> b!1219560 (= res!810022 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26811))))

(declare-fun res!810018 () Bool)

(assert (=> start!101466 (=> (not res!810018) (not e!692461))))

(assert (=> start!101466 (= res!810018 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38542 _keys!1208))))))

(assert (=> start!101466 e!692461))

(assert (=> start!101466 tp_is_empty!30987))

(declare-fun array_inv!28924 (array!78751) Bool)

(assert (=> start!101466 (array_inv!28924 _keys!1208)))

(assert (=> start!101466 true))

(assert (=> start!101466 tp!91883))

(declare-fun array_inv!28925 (array!78753) Bool)

(assert (=> start!101466 (and (array_inv!28925 _values!996) e!692454)))

(declare-fun b!1219561 () Bool)

(declare-fun res!810009 () Bool)

(assert (=> b!1219561 (=> (not res!810009) (not e!692461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1219561 (= res!810009 (validMask!0 mask!1564))))

(declare-fun b!1219562 () Bool)

(assert (=> b!1219562 (= e!692462 (or (bvsge (size!38542 _keys!1208) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!38542 _keys!1208))))))

(assert (=> b!1219562 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!554493 () Unit!40412)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78751 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40412)

(assert (=> b!1219562 (= lt!554493 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1219563 () Bool)

(declare-fun res!810020 () Bool)

(assert (=> b!1219563 (=> (not res!810020) (not e!692461))))

(assert (=> b!1219563 (= res!810020 (= (select (arr!38006 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!48367 () Bool)

(declare-fun tp!91882 () Bool)

(assert (=> mapNonEmpty!48367 (= mapRes!48367 (and tp!91882 e!692453))))

(declare-fun mapRest!48367 () (Array (_ BitVec 32) ValueCell!14784))

(declare-fun mapValue!48367 () ValueCell!14784)

(declare-fun mapKey!48367 () (_ BitVec 32))

(assert (=> mapNonEmpty!48367 (= (arr!38007 _values!996) (store mapRest!48367 mapKey!48367 mapValue!48367))))

(declare-fun mapIsEmpty!48367 () Bool)

(assert (=> mapIsEmpty!48367 mapRes!48367))

(declare-fun b!1219564 () Bool)

(assert (=> b!1219564 (= e!692456 tp_is_empty!30987)))

(assert (= (and start!101466 res!810018) b!1219561))

(assert (= (and b!1219561 res!810009) b!1219557))

(assert (= (and b!1219557 res!810013) b!1219551))

(assert (= (and b!1219551 res!810010) b!1219560))

(assert (= (and b!1219560 res!810022) b!1219550))

(assert (= (and b!1219550 res!810011) b!1219556))

(assert (= (and b!1219556 res!810016) b!1219563))

(assert (= (and b!1219563 res!810020) b!1219555))

(assert (= (and b!1219555 res!810019) b!1219548))

(assert (= (and b!1219548 res!810024) b!1219547))

(assert (= (and b!1219547 (not res!810017)) b!1219549))

(assert (= (and b!1219549 (not res!810014)) b!1219553))

(assert (= (and b!1219553 (not res!810012)) b!1219546))

(assert (= (and b!1219546 res!810015) b!1219552))

(assert (= (and b!1219552 (not res!810023)) b!1219554))

(assert (= (and b!1219546 (not res!810021)) b!1219562))

(assert (= (and b!1219559 condMapEmpty!48367) mapIsEmpty!48367))

(assert (= (and b!1219559 (not condMapEmpty!48367)) mapNonEmpty!48367))

(get-info :version)

(assert (= (and mapNonEmpty!48367 ((_ is ValueCellFull!14784) mapValue!48367)) b!1219558))

(assert (= (and b!1219559 ((_ is ValueCellFull!14784) mapDefault!48367)) b!1219564))

(assert (= start!101466 b!1219559))

(declare-fun b_lambda!22111 () Bool)

(assert (=> (not b_lambda!22111) (not b!1219549)))

(declare-fun t!40075 () Bool)

(declare-fun tb!11083 () Bool)

(assert (=> (and start!101466 (= defaultEntry!1004 defaultEntry!1004) t!40075) tb!11083))

(declare-fun result!22771 () Bool)

(assert (=> tb!11083 (= result!22771 tp_is_empty!30987)))

(assert (=> b!1219549 t!40075))

(declare-fun b_and!43757 () Bool)

(assert (= b_and!43755 (and (=> t!40075 result!22771) b_and!43757)))

(declare-fun m!1124325 () Bool)

(assert (=> b!1219562 m!1124325))

(declare-fun m!1124327 () Bool)

(assert (=> b!1219562 m!1124327))

(declare-fun m!1124329 () Bool)

(assert (=> mapNonEmpty!48367 m!1124329))

(declare-fun m!1124331 () Bool)

(assert (=> b!1219555 m!1124331))

(declare-fun m!1124333 () Bool)

(assert (=> b!1219555 m!1124333))

(declare-fun m!1124335 () Bool)

(assert (=> b!1219549 m!1124335))

(declare-fun m!1124337 () Bool)

(assert (=> b!1219549 m!1124337))

(declare-fun m!1124339 () Bool)

(assert (=> b!1219549 m!1124339))

(declare-fun m!1124341 () Bool)

(assert (=> b!1219549 m!1124341))

(declare-fun m!1124343 () Bool)

(assert (=> b!1219560 m!1124343))

(declare-fun m!1124345 () Bool)

(assert (=> b!1219553 m!1124345))

(declare-fun m!1124347 () Bool)

(assert (=> b!1219553 m!1124347))

(declare-fun m!1124349 () Bool)

(assert (=> b!1219553 m!1124349))

(declare-fun m!1124351 () Bool)

(assert (=> b!1219553 m!1124351))

(declare-fun m!1124353 () Bool)

(assert (=> b!1219553 m!1124353))

(declare-fun m!1124355 () Bool)

(assert (=> b!1219553 m!1124355))

(assert (=> b!1219553 m!1124353))

(declare-fun m!1124357 () Bool)

(assert (=> b!1219556 m!1124357))

(declare-fun m!1124359 () Bool)

(assert (=> b!1219563 m!1124359))

(declare-fun m!1124361 () Bool)

(assert (=> b!1219561 m!1124361))

(declare-fun m!1124363 () Bool)

(assert (=> b!1219554 m!1124363))

(declare-fun m!1124365 () Bool)

(assert (=> start!101466 m!1124365))

(declare-fun m!1124367 () Bool)

(assert (=> start!101466 m!1124367))

(declare-fun m!1124369 () Bool)

(assert (=> b!1219547 m!1124369))

(declare-fun m!1124371 () Bool)

(assert (=> b!1219547 m!1124371))

(assert (=> b!1219546 m!1124353))

(declare-fun m!1124373 () Bool)

(assert (=> b!1219546 m!1124373))

(assert (=> b!1219546 m!1124373))

(declare-fun m!1124375 () Bool)

(assert (=> b!1219546 m!1124375))

(declare-fun m!1124377 () Bool)

(assert (=> b!1219546 m!1124377))

(declare-fun m!1124379 () Bool)

(assert (=> b!1219551 m!1124379))

(declare-fun m!1124381 () Bool)

(assert (=> b!1219548 m!1124381))

(assert (=> b!1219552 m!1124353))

(check-sat (not b_next!26283) (not b!1219556) (not b!1219549) (not b!1219551) (not b!1219553) (not b!1219555) (not b!1219561) (not b!1219562) tp_is_empty!30987 (not b!1219560) b_and!43757 (not b!1219548) (not b!1219547) (not b!1219546) (not b!1219554) (not b_lambda!22111) (not mapNonEmpty!48367) (not start!101466))
(check-sat b_and!43757 (not b_next!26283))
