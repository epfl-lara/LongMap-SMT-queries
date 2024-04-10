; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101582 () Bool)

(assert start!101582)

(declare-fun b_free!26337 () Bool)

(declare-fun b_next!26337 () Bool)

(assert (=> start!101582 (= b_free!26337 (not b_next!26337))))

(declare-fun tp!92051 () Bool)

(declare-fun b_and!43899 () Bool)

(assert (=> start!101582 (= tp!92051 b_and!43899)))

(declare-datatypes ((array!78863 0))(
  ( (array!78864 (arr!38060 (Array (_ BitVec 32) (_ BitVec 64))) (size!38596 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78863)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!693655 () Bool)

(declare-fun b!1221473 () Bool)

(declare-fun arrayContainsKey!0 (array!78863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1221473 (= e!693655 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1221474 () Bool)

(declare-fun e!693667 () Bool)

(declare-fun e!693664 () Bool)

(assert (=> b!1221474 (= e!693667 e!693664)))

(declare-fun res!811485 () Bool)

(assert (=> b!1221474 (=> (not res!811485) (not e!693664))))

(declare-fun lt!555612 () array!78863)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78863 (_ BitVec 32)) Bool)

(assert (=> b!1221474 (= res!811485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555612 mask!1564))))

(assert (=> b!1221474 (= lt!555612 (array!78864 (store (arr!38060 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38596 _keys!1208)))))

(declare-fun b!1221475 () Bool)

(declare-fun res!811476 () Bool)

(assert (=> b!1221475 (=> (not res!811476) (not e!693667))))

(assert (=> b!1221475 (= res!811476 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38596 _keys!1208))))))

(declare-fun b!1221476 () Bool)

(declare-fun e!693660 () Bool)

(declare-fun e!693656 () Bool)

(assert (=> b!1221476 (= e!693660 e!693656)))

(declare-fun res!811482 () Bool)

(assert (=> b!1221476 (=> res!811482 e!693656)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1221476 (= res!811482 (not (= (select (arr!38060 _keys!1208) from!1455) k0!934)))))

(declare-fun e!693663 () Bool)

(assert (=> b!1221476 e!693663))

(declare-fun res!811483 () Bool)

(assert (=> b!1221476 (=> (not res!811483) (not e!693663))))

(declare-datatypes ((V!46515 0))(
  ( (V!46516 (val!15577 Int)) )
))
(declare-fun lt!555604 () V!46515)

(declare-datatypes ((ValueCell!14811 0))(
  ( (ValueCellFull!14811 (v!18236 V!46515)) (EmptyCell!14811) )
))
(declare-datatypes ((array!78865 0))(
  ( (array!78866 (arr!38061 (Array (_ BitVec 32) ValueCell!14811)) (size!38597 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78865)

(declare-datatypes ((tuple2!20058 0))(
  ( (tuple2!20059 (_1!10040 (_ BitVec 64)) (_2!10040 V!46515)) )
))
(declare-datatypes ((List!26858 0))(
  ( (Nil!26855) (Cons!26854 (h!28063 tuple2!20058) (t!40175 List!26858)) )
))
(declare-datatypes ((ListLongMap!18027 0))(
  ( (ListLongMap!18028 (toList!9029 List!26858)) )
))
(declare-fun lt!555608 () ListLongMap!18027)

(declare-fun lt!555602 () ListLongMap!18027)

(declare-fun +!4092 (ListLongMap!18027 tuple2!20058) ListLongMap!18027)

(declare-fun get!19423 (ValueCell!14811 V!46515) V!46515)

(assert (=> b!1221476 (= res!811483 (= lt!555608 (+!4092 lt!555602 (tuple2!20059 (select (arr!38060 _keys!1208) from!1455) (get!19423 (select (arr!38061 _values!996) from!1455) lt!555604)))))))

(declare-fun b!1221477 () Bool)

(declare-fun e!693658 () Bool)

(assert (=> b!1221477 (= e!693656 e!693658)))

(declare-fun res!811475 () Bool)

(assert (=> b!1221477 (=> res!811475 e!693658)))

(assert (=> b!1221477 (= res!811475 (or (bvsge (size!38596 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38596 _keys!1208)) (bvsge from!1455 (size!38596 _keys!1208))))))

(declare-datatypes ((List!26859 0))(
  ( (Nil!26856) (Cons!26855 (h!28064 (_ BitVec 64)) (t!40176 List!26859)) )
))
(declare-fun arrayNoDuplicates!0 (array!78863 (_ BitVec 32) List!26859) Bool)

(assert (=> b!1221477 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26856)))

(declare-datatypes ((Unit!40462 0))(
  ( (Unit!40463) )
))
(declare-fun lt!555605 () Unit!40462)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78863 (_ BitVec 32) (_ BitVec 32)) Unit!40462)

(assert (=> b!1221477 (= lt!555605 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1221477 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555601 () Unit!40462)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78863 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40462)

(assert (=> b!1221477 (= lt!555601 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1221478 () Bool)

(assert (=> b!1221478 (= e!693663 e!693655)))

(declare-fun res!811469 () Bool)

(assert (=> b!1221478 (=> res!811469 e!693655)))

(assert (=> b!1221478 (= res!811469 (not (= (select (arr!38060 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1221479 () Bool)

(declare-fun e!693654 () Bool)

(declare-fun e!693661 () Bool)

(declare-fun mapRes!48454 () Bool)

(assert (=> b!1221479 (= e!693654 (and e!693661 mapRes!48454))))

(declare-fun condMapEmpty!48454 () Bool)

(declare-fun mapDefault!48454 () ValueCell!14811)

(assert (=> b!1221479 (= condMapEmpty!48454 (= (arr!38061 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14811)) mapDefault!48454)))))

(declare-fun b!1221480 () Bool)

(declare-fun res!811484 () Bool)

(assert (=> b!1221480 (=> (not res!811484) (not e!693667))))

(assert (=> b!1221480 (= res!811484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1221481 () Bool)

(declare-fun e!693665 () Bool)

(assert (=> b!1221481 (= e!693664 (not e!693665))))

(declare-fun res!811480 () Bool)

(assert (=> b!1221481 (=> res!811480 e!693665)))

(assert (=> b!1221481 (= res!811480 (bvsgt from!1455 i!673))))

(assert (=> b!1221481 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!555607 () Unit!40462)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78863 (_ BitVec 64) (_ BitVec 32)) Unit!40462)

(assert (=> b!1221481 (= lt!555607 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!48454 () Bool)

(declare-fun tp!92050 () Bool)

(declare-fun e!693662 () Bool)

(assert (=> mapNonEmpty!48454 (= mapRes!48454 (and tp!92050 e!693662))))

(declare-fun mapRest!48454 () (Array (_ BitVec 32) ValueCell!14811))

(declare-fun mapValue!48454 () ValueCell!14811)

(declare-fun mapKey!48454 () (_ BitVec 32))

(assert (=> mapNonEmpty!48454 (= (arr!38061 _values!996) (store mapRest!48454 mapKey!48454 mapValue!48454))))

(declare-fun res!811468 () Bool)

(assert (=> start!101582 (=> (not res!811468) (not e!693667))))

(assert (=> start!101582 (= res!811468 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38596 _keys!1208))))))

(assert (=> start!101582 e!693667))

(declare-fun tp_is_empty!31041 () Bool)

(assert (=> start!101582 tp_is_empty!31041))

(declare-fun array_inv!28958 (array!78863) Bool)

(assert (=> start!101582 (array_inv!28958 _keys!1208)))

(assert (=> start!101582 true))

(assert (=> start!101582 tp!92051))

(declare-fun array_inv!28959 (array!78865) Bool)

(assert (=> start!101582 (and (array_inv!28959 _values!996) e!693654)))

(declare-fun b!1221482 () Bool)

(declare-fun res!811479 () Bool)

(assert (=> b!1221482 (=> (not res!811479) (not e!693667))))

(assert (=> b!1221482 (= res!811479 (= (select (arr!38060 _keys!1208) i!673) k0!934))))

(declare-fun b!1221483 () Bool)

(declare-fun res!811467 () Bool)

(assert (=> b!1221483 (=> (not res!811467) (not e!693667))))

(assert (=> b!1221483 (= res!811467 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26856))))

(declare-fun b!1221484 () Bool)

(declare-fun res!811473 () Bool)

(assert (=> b!1221484 (=> (not res!811473) (not e!693667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1221484 (= res!811473 (validMask!0 mask!1564))))

(declare-fun b!1221485 () Bool)

(declare-fun res!811474 () Bool)

(assert (=> b!1221485 (=> res!811474 e!693658)))

(declare-fun noDuplicate!1631 (List!26859) Bool)

(assert (=> b!1221485 (= res!811474 (not (noDuplicate!1631 Nil!26856)))))

(declare-fun b!1221486 () Bool)

(declare-fun e!693666 () Bool)

(declare-fun contains!7024 (List!26859 (_ BitVec 64)) Bool)

(assert (=> b!1221486 (= e!693666 (not (contains!7024 Nil!26856 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221487 () Bool)

(assert (=> b!1221487 (= e!693661 tp_is_empty!31041)))

(declare-fun b!1221488 () Bool)

(assert (=> b!1221488 (= e!693662 tp_is_empty!31041)))

(declare-fun b!1221489 () Bool)

(declare-fun res!811481 () Bool)

(assert (=> b!1221489 (=> (not res!811481) (not e!693664))))

(assert (=> b!1221489 (= res!811481 (arrayNoDuplicates!0 lt!555612 #b00000000000000000000000000000000 Nil!26856))))

(declare-fun b!1221490 () Bool)

(declare-fun res!811477 () Bool)

(assert (=> b!1221490 (=> (not res!811477) (not e!693667))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1221490 (= res!811477 (validKeyInArray!0 k0!934))))

(declare-fun b!1221491 () Bool)

(declare-fun e!693657 () Bool)

(assert (=> b!1221491 (= e!693657 e!693660)))

(declare-fun res!811478 () Bool)

(assert (=> b!1221491 (=> res!811478 e!693660)))

(assert (=> b!1221491 (= res!811478 (not (validKeyInArray!0 (select (arr!38060 _keys!1208) from!1455))))))

(declare-fun lt!555606 () ListLongMap!18027)

(assert (=> b!1221491 (= lt!555606 lt!555602)))

(declare-fun lt!555610 () ListLongMap!18027)

(declare-fun -!1934 (ListLongMap!18027 (_ BitVec 64)) ListLongMap!18027)

(assert (=> b!1221491 (= lt!555602 (-!1934 lt!555610 k0!934))))

(declare-fun zeroValue!944 () V!46515)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46515)

(declare-fun lt!555603 () array!78865)

(declare-fun getCurrentListMapNoExtraKeys!5451 (array!78863 array!78865 (_ BitVec 32) (_ BitVec 32) V!46515 V!46515 (_ BitVec 32) Int) ListLongMap!18027)

(assert (=> b!1221491 (= lt!555606 (getCurrentListMapNoExtraKeys!5451 lt!555612 lt!555603 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1221491 (= lt!555610 (getCurrentListMapNoExtraKeys!5451 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!555611 () Unit!40462)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1141 (array!78863 array!78865 (_ BitVec 32) (_ BitVec 32) V!46515 V!46515 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40462)

(assert (=> b!1221491 (= lt!555611 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1141 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1221492 () Bool)

(assert (=> b!1221492 (= e!693658 e!693666)))

(declare-fun res!811471 () Bool)

(assert (=> b!1221492 (=> (not res!811471) (not e!693666))))

(assert (=> b!1221492 (= res!811471 (not (contains!7024 Nil!26856 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221493 () Bool)

(declare-fun res!811470 () Bool)

(assert (=> b!1221493 (=> (not res!811470) (not e!693667))))

(assert (=> b!1221493 (= res!811470 (and (= (size!38597 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38596 _keys!1208) (size!38597 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!48454 () Bool)

(assert (=> mapIsEmpty!48454 mapRes!48454))

(declare-fun b!1221494 () Bool)

(assert (=> b!1221494 (= e!693665 e!693657)))

(declare-fun res!811472 () Bool)

(assert (=> b!1221494 (=> res!811472 e!693657)))

(assert (=> b!1221494 (= res!811472 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1221494 (= lt!555608 (getCurrentListMapNoExtraKeys!5451 lt!555612 lt!555603 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1221494 (= lt!555603 (array!78866 (store (arr!38061 _values!996) i!673 (ValueCellFull!14811 lt!555604)) (size!38597 _values!996)))))

(declare-fun dynLambda!3331 (Int (_ BitVec 64)) V!46515)

(assert (=> b!1221494 (= lt!555604 (dynLambda!3331 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555609 () ListLongMap!18027)

(assert (=> b!1221494 (= lt!555609 (getCurrentListMapNoExtraKeys!5451 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!101582 res!811468) b!1221484))

(assert (= (and b!1221484 res!811473) b!1221493))

(assert (= (and b!1221493 res!811470) b!1221480))

(assert (= (and b!1221480 res!811484) b!1221483))

(assert (= (and b!1221483 res!811467) b!1221475))

(assert (= (and b!1221475 res!811476) b!1221490))

(assert (= (and b!1221490 res!811477) b!1221482))

(assert (= (and b!1221482 res!811479) b!1221474))

(assert (= (and b!1221474 res!811485) b!1221489))

(assert (= (and b!1221489 res!811481) b!1221481))

(assert (= (and b!1221481 (not res!811480)) b!1221494))

(assert (= (and b!1221494 (not res!811472)) b!1221491))

(assert (= (and b!1221491 (not res!811478)) b!1221476))

(assert (= (and b!1221476 res!811483) b!1221478))

(assert (= (and b!1221478 (not res!811469)) b!1221473))

(assert (= (and b!1221476 (not res!811482)) b!1221477))

(assert (= (and b!1221477 (not res!811475)) b!1221485))

(assert (= (and b!1221485 (not res!811474)) b!1221492))

(assert (= (and b!1221492 res!811471) b!1221486))

(assert (= (and b!1221479 condMapEmpty!48454) mapIsEmpty!48454))

(assert (= (and b!1221479 (not condMapEmpty!48454)) mapNonEmpty!48454))

(get-info :version)

(assert (= (and mapNonEmpty!48454 ((_ is ValueCellFull!14811) mapValue!48454)) b!1221488))

(assert (= (and b!1221479 ((_ is ValueCellFull!14811) mapDefault!48454)) b!1221487))

(assert (= start!101582 b!1221479))

(declare-fun b_lambda!22241 () Bool)

(assert (=> (not b_lambda!22241) (not b!1221494)))

(declare-fun t!40174 () Bool)

(declare-fun tb!11137 () Bool)

(assert (=> (and start!101582 (= defaultEntry!1004 defaultEntry!1004) t!40174) tb!11137))

(declare-fun result!22883 () Bool)

(assert (=> tb!11137 (= result!22883 tp_is_empty!31041)))

(assert (=> b!1221494 t!40174))

(declare-fun b_and!43901 () Bool)

(assert (= b_and!43899 (and (=> t!40174 result!22883) b_and!43901)))

(declare-fun m!1126351 () Bool)

(assert (=> b!1221483 m!1126351))

(declare-fun m!1126353 () Bool)

(assert (=> b!1221492 m!1126353))

(declare-fun m!1126355 () Bool)

(assert (=> b!1221478 m!1126355))

(declare-fun m!1126357 () Bool)

(assert (=> b!1221494 m!1126357))

(declare-fun m!1126359 () Bool)

(assert (=> b!1221494 m!1126359))

(declare-fun m!1126361 () Bool)

(assert (=> b!1221494 m!1126361))

(declare-fun m!1126363 () Bool)

(assert (=> b!1221494 m!1126363))

(declare-fun m!1126365 () Bool)

(assert (=> start!101582 m!1126365))

(declare-fun m!1126367 () Bool)

(assert (=> start!101582 m!1126367))

(declare-fun m!1126369 () Bool)

(assert (=> b!1221482 m!1126369))

(declare-fun m!1126371 () Bool)

(assert (=> b!1221486 m!1126371))

(declare-fun m!1126373 () Bool)

(assert (=> b!1221480 m!1126373))

(declare-fun m!1126375 () Bool)

(assert (=> b!1221474 m!1126375))

(declare-fun m!1126377 () Bool)

(assert (=> b!1221474 m!1126377))

(declare-fun m!1126379 () Bool)

(assert (=> mapNonEmpty!48454 m!1126379))

(declare-fun m!1126381 () Bool)

(assert (=> b!1221489 m!1126381))

(declare-fun m!1126383 () Bool)

(assert (=> b!1221473 m!1126383))

(declare-fun m!1126385 () Bool)

(assert (=> b!1221481 m!1126385))

(declare-fun m!1126387 () Bool)

(assert (=> b!1221481 m!1126387))

(declare-fun m!1126389 () Bool)

(assert (=> b!1221484 m!1126389))

(assert (=> b!1221476 m!1126355))

(declare-fun m!1126391 () Bool)

(assert (=> b!1221476 m!1126391))

(assert (=> b!1221476 m!1126391))

(declare-fun m!1126393 () Bool)

(assert (=> b!1221476 m!1126393))

(declare-fun m!1126395 () Bool)

(assert (=> b!1221476 m!1126395))

(declare-fun m!1126397 () Bool)

(assert (=> b!1221490 m!1126397))

(declare-fun m!1126399 () Bool)

(assert (=> b!1221485 m!1126399))

(declare-fun m!1126401 () Bool)

(assert (=> b!1221477 m!1126401))

(declare-fun m!1126403 () Bool)

(assert (=> b!1221477 m!1126403))

(declare-fun m!1126405 () Bool)

(assert (=> b!1221477 m!1126405))

(declare-fun m!1126407 () Bool)

(assert (=> b!1221477 m!1126407))

(declare-fun m!1126409 () Bool)

(assert (=> b!1221491 m!1126409))

(declare-fun m!1126411 () Bool)

(assert (=> b!1221491 m!1126411))

(assert (=> b!1221491 m!1126355))

(declare-fun m!1126413 () Bool)

(assert (=> b!1221491 m!1126413))

(assert (=> b!1221491 m!1126355))

(declare-fun m!1126415 () Bool)

(assert (=> b!1221491 m!1126415))

(declare-fun m!1126417 () Bool)

(assert (=> b!1221491 m!1126417))

(check-sat (not b!1221473) tp_is_empty!31041 (not b!1221481) (not b_lambda!22241) (not b!1221480) (not b_next!26337) (not b!1221486) (not b!1221492) (not b!1221476) (not b!1221483) (not b!1221485) (not b!1221484) (not start!101582) (not b!1221494) (not b!1221474) (not b!1221477) (not b!1221489) (not b!1221491) (not b!1221490) (not mapNonEmpty!48454) b_and!43901)
(check-sat b_and!43901 (not b_next!26337))
(get-model)

(declare-fun b_lambda!22245 () Bool)

(assert (= b_lambda!22241 (or (and start!101582 b_free!26337) b_lambda!22245)))

(check-sat tp_is_empty!31041 (not b!1221481) (not b!1221480) (not b_next!26337) (not b!1221486) (not b!1221492) (not b!1221476) (not b!1221483) (not b_lambda!22245) (not b!1221473) (not b!1221485) (not b!1221484) (not start!101582) (not b!1221494) (not b!1221474) (not b!1221477) (not b!1221489) (not b!1221491) (not b!1221490) (not mapNonEmpty!48454) b_and!43901)
(check-sat b_and!43901 (not b_next!26337))
(get-model)

(declare-fun b!1221573 () Bool)

(declare-fun e!693716 () Bool)

(declare-fun e!693717 () Bool)

(assert (=> b!1221573 (= e!693716 e!693717)))

(declare-fun lt!555657 () (_ BitVec 64))

(assert (=> b!1221573 (= lt!555657 (select (arr!38060 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!555655 () Unit!40462)

(assert (=> b!1221573 (= lt!555655 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!555657 #b00000000000000000000000000000000))))

(assert (=> b!1221573 (arrayContainsKey!0 _keys!1208 lt!555657 #b00000000000000000000000000000000)))

(declare-fun lt!555656 () Unit!40462)

(assert (=> b!1221573 (= lt!555656 lt!555655)))

(declare-fun res!811547 () Bool)

(declare-datatypes ((SeekEntryResult!9949 0))(
  ( (MissingZero!9949 (index!42167 (_ BitVec 32))) (Found!9949 (index!42168 (_ BitVec 32))) (Intermediate!9949 (undefined!10761 Bool) (index!42169 (_ BitVec 32)) (x!107584 (_ BitVec 32))) (Undefined!9949) (MissingVacant!9949 (index!42170 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78863 (_ BitVec 32)) SeekEntryResult!9949)

(assert (=> b!1221573 (= res!811547 (= (seekEntryOrOpen!0 (select (arr!38060 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9949 #b00000000000000000000000000000000)))))

(assert (=> b!1221573 (=> (not res!811547) (not e!693717))))

(declare-fun b!1221574 () Bool)

(declare-fun e!693718 () Bool)

(assert (=> b!1221574 (= e!693718 e!693716)))

(declare-fun c!120281 () Bool)

(assert (=> b!1221574 (= c!120281 (validKeyInArray!0 (select (arr!38060 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133849 () Bool)

(declare-fun res!811548 () Bool)

(assert (=> d!133849 (=> res!811548 e!693718)))

(assert (=> d!133849 (= res!811548 (bvsge #b00000000000000000000000000000000 (size!38596 _keys!1208)))))

(assert (=> d!133849 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!693718)))

(declare-fun bm!60728 () Bool)

(declare-fun call!60731 () Bool)

(assert (=> bm!60728 (= call!60731 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1221575 () Bool)

(assert (=> b!1221575 (= e!693716 call!60731)))

(declare-fun b!1221576 () Bool)

(assert (=> b!1221576 (= e!693717 call!60731)))

(assert (= (and d!133849 (not res!811548)) b!1221574))

(assert (= (and b!1221574 c!120281) b!1221573))

(assert (= (and b!1221574 (not c!120281)) b!1221575))

(assert (= (and b!1221573 res!811547) b!1221576))

(assert (= (or b!1221576 b!1221575) bm!60728))

(declare-fun m!1126487 () Bool)

(assert (=> b!1221573 m!1126487))

(declare-fun m!1126489 () Bool)

(assert (=> b!1221573 m!1126489))

(declare-fun m!1126491 () Bool)

(assert (=> b!1221573 m!1126491))

(assert (=> b!1221573 m!1126487))

(declare-fun m!1126493 () Bool)

(assert (=> b!1221573 m!1126493))

(assert (=> b!1221574 m!1126487))

(assert (=> b!1221574 m!1126487))

(declare-fun m!1126495 () Bool)

(assert (=> b!1221574 m!1126495))

(declare-fun m!1126497 () Bool)

(assert (=> bm!60728 m!1126497))

(assert (=> b!1221480 d!133849))

(declare-fun d!133851 () Bool)

(assert (=> d!133851 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1221490 d!133851))

(declare-fun b!1221587 () Bool)

(declare-fun e!693728 () Bool)

(declare-fun call!60734 () Bool)

(assert (=> b!1221587 (= e!693728 call!60734)))

(declare-fun b!1221588 () Bool)

(declare-fun e!693727 () Bool)

(assert (=> b!1221588 (= e!693727 (contains!7024 Nil!26856 (select (arr!38060 lt!555612) #b00000000000000000000000000000000)))))

(declare-fun b!1221589 () Bool)

(assert (=> b!1221589 (= e!693728 call!60734)))

(declare-fun bm!60731 () Bool)

(declare-fun c!120284 () Bool)

(assert (=> bm!60731 (= call!60734 (arrayNoDuplicates!0 lt!555612 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120284 (Cons!26855 (select (arr!38060 lt!555612) #b00000000000000000000000000000000) Nil!26856) Nil!26856)))))

(declare-fun b!1221590 () Bool)

(declare-fun e!693730 () Bool)

(declare-fun e!693729 () Bool)

(assert (=> b!1221590 (= e!693730 e!693729)))

(declare-fun res!811555 () Bool)

(assert (=> b!1221590 (=> (not res!811555) (not e!693729))))

(assert (=> b!1221590 (= res!811555 (not e!693727))))

(declare-fun res!811557 () Bool)

(assert (=> b!1221590 (=> (not res!811557) (not e!693727))))

(assert (=> b!1221590 (= res!811557 (validKeyInArray!0 (select (arr!38060 lt!555612) #b00000000000000000000000000000000)))))

(declare-fun b!1221591 () Bool)

(assert (=> b!1221591 (= e!693729 e!693728)))

(assert (=> b!1221591 (= c!120284 (validKeyInArray!0 (select (arr!38060 lt!555612) #b00000000000000000000000000000000)))))

(declare-fun d!133853 () Bool)

(declare-fun res!811556 () Bool)

(assert (=> d!133853 (=> res!811556 e!693730)))

(assert (=> d!133853 (= res!811556 (bvsge #b00000000000000000000000000000000 (size!38596 lt!555612)))))

(assert (=> d!133853 (= (arrayNoDuplicates!0 lt!555612 #b00000000000000000000000000000000 Nil!26856) e!693730)))

(assert (= (and d!133853 (not res!811556)) b!1221590))

(assert (= (and b!1221590 res!811557) b!1221588))

(assert (= (and b!1221590 res!811555) b!1221591))

(assert (= (and b!1221591 c!120284) b!1221589))

(assert (= (and b!1221591 (not c!120284)) b!1221587))

(assert (= (or b!1221589 b!1221587) bm!60731))

(declare-fun m!1126499 () Bool)

(assert (=> b!1221588 m!1126499))

(assert (=> b!1221588 m!1126499))

(declare-fun m!1126501 () Bool)

(assert (=> b!1221588 m!1126501))

(assert (=> bm!60731 m!1126499))

(declare-fun m!1126503 () Bool)

(assert (=> bm!60731 m!1126503))

(assert (=> b!1221590 m!1126499))

(assert (=> b!1221590 m!1126499))

(declare-fun m!1126505 () Bool)

(assert (=> b!1221590 m!1126505))

(assert (=> b!1221591 m!1126499))

(assert (=> b!1221591 m!1126499))

(assert (=> b!1221591 m!1126505))

(assert (=> b!1221489 d!133853))

(declare-fun b!1221592 () Bool)

(declare-fun e!693732 () Bool)

(declare-fun call!60735 () Bool)

(assert (=> b!1221592 (= e!693732 call!60735)))

(declare-fun b!1221593 () Bool)

(declare-fun e!693731 () Bool)

(assert (=> b!1221593 (= e!693731 (contains!7024 Nil!26856 (select (arr!38060 _keys!1208) from!1455)))))

(declare-fun b!1221594 () Bool)

(assert (=> b!1221594 (= e!693732 call!60735)))

(declare-fun c!120285 () Bool)

(declare-fun bm!60732 () Bool)

(assert (=> bm!60732 (= call!60735 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!120285 (Cons!26855 (select (arr!38060 _keys!1208) from!1455) Nil!26856) Nil!26856)))))

(declare-fun b!1221595 () Bool)

(declare-fun e!693734 () Bool)

(declare-fun e!693733 () Bool)

(assert (=> b!1221595 (= e!693734 e!693733)))

(declare-fun res!811558 () Bool)

(assert (=> b!1221595 (=> (not res!811558) (not e!693733))))

(assert (=> b!1221595 (= res!811558 (not e!693731))))

(declare-fun res!811560 () Bool)

(assert (=> b!1221595 (=> (not res!811560) (not e!693731))))

(assert (=> b!1221595 (= res!811560 (validKeyInArray!0 (select (arr!38060 _keys!1208) from!1455)))))

(declare-fun b!1221596 () Bool)

(assert (=> b!1221596 (= e!693733 e!693732)))

(assert (=> b!1221596 (= c!120285 (validKeyInArray!0 (select (arr!38060 _keys!1208) from!1455)))))

(declare-fun d!133855 () Bool)

(declare-fun res!811559 () Bool)

(assert (=> d!133855 (=> res!811559 e!693734)))

(assert (=> d!133855 (= res!811559 (bvsge from!1455 (size!38596 _keys!1208)))))

(assert (=> d!133855 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26856) e!693734)))

(assert (= (and d!133855 (not res!811559)) b!1221595))

(assert (= (and b!1221595 res!811560) b!1221593))

(assert (= (and b!1221595 res!811558) b!1221596))

(assert (= (and b!1221596 c!120285) b!1221594))

(assert (= (and b!1221596 (not c!120285)) b!1221592))

(assert (= (or b!1221594 b!1221592) bm!60732))

(assert (=> b!1221593 m!1126355))

(assert (=> b!1221593 m!1126355))

(declare-fun m!1126507 () Bool)

(assert (=> b!1221593 m!1126507))

(assert (=> bm!60732 m!1126355))

(declare-fun m!1126509 () Bool)

(assert (=> bm!60732 m!1126509))

(assert (=> b!1221595 m!1126355))

(assert (=> b!1221595 m!1126355))

(assert (=> b!1221595 m!1126413))

(assert (=> b!1221596 m!1126355))

(assert (=> b!1221596 m!1126355))

(assert (=> b!1221596 m!1126413))

(assert (=> b!1221477 d!133855))

(declare-fun d!133857 () Bool)

(assert (=> d!133857 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26856)))

(declare-fun lt!555660 () Unit!40462)

(declare-fun choose!39 (array!78863 (_ BitVec 32) (_ BitVec 32)) Unit!40462)

(assert (=> d!133857 (= lt!555660 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!133857 (bvslt (size!38596 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133857 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!555660)))

(declare-fun bs!34383 () Bool)

(assert (= bs!34383 d!133857))

(assert (=> bs!34383 m!1126401))

(declare-fun m!1126511 () Bool)

(assert (=> bs!34383 m!1126511))

(assert (=> b!1221477 d!133857))

(declare-fun d!133859 () Bool)

(declare-fun res!811565 () Bool)

(declare-fun e!693739 () Bool)

(assert (=> d!133859 (=> res!811565 e!693739)))

(assert (=> d!133859 (= res!811565 (= (select (arr!38060 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133859 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!693739)))

(declare-fun b!1221601 () Bool)

(declare-fun e!693740 () Bool)

(assert (=> b!1221601 (= e!693739 e!693740)))

(declare-fun res!811566 () Bool)

(assert (=> b!1221601 (=> (not res!811566) (not e!693740))))

(assert (=> b!1221601 (= res!811566 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38596 _keys!1208)))))

(declare-fun b!1221602 () Bool)

(assert (=> b!1221602 (= e!693740 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133859 (not res!811565)) b!1221601))

(assert (= (and b!1221601 res!811566) b!1221602))

(declare-fun m!1126513 () Bool)

(assert (=> d!133859 m!1126513))

(declare-fun m!1126515 () Bool)

(assert (=> b!1221602 m!1126515))

(assert (=> b!1221477 d!133859))

(declare-fun d!133861 () Bool)

(assert (=> d!133861 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555663 () Unit!40462)

(declare-fun choose!114 (array!78863 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40462)

(assert (=> d!133861 (= lt!555663 (choose!114 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> d!133861 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133861 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)) lt!555663)))

(declare-fun bs!34384 () Bool)

(assert (= bs!34384 d!133861))

(assert (=> bs!34384 m!1126405))

(declare-fun m!1126517 () Bool)

(assert (=> bs!34384 m!1126517))

(assert (=> b!1221477 d!133861))

(declare-fun d!133863 () Bool)

(declare-fun e!693743 () Bool)

(assert (=> d!133863 e!693743))

(declare-fun res!811571 () Bool)

(assert (=> d!133863 (=> (not res!811571) (not e!693743))))

(declare-fun lt!555675 () ListLongMap!18027)

(declare-fun contains!7026 (ListLongMap!18027 (_ BitVec 64)) Bool)

(assert (=> d!133863 (= res!811571 (contains!7026 lt!555675 (_1!10040 (tuple2!20059 (select (arr!38060 _keys!1208) from!1455) (get!19423 (select (arr!38061 _values!996) from!1455) lt!555604)))))))

(declare-fun lt!555672 () List!26858)

(assert (=> d!133863 (= lt!555675 (ListLongMap!18028 lt!555672))))

(declare-fun lt!555673 () Unit!40462)

(declare-fun lt!555674 () Unit!40462)

(assert (=> d!133863 (= lt!555673 lt!555674)))

(declare-datatypes ((Option!698 0))(
  ( (Some!697 (v!18239 V!46515)) (None!696) )
))
(declare-fun getValueByKey!647 (List!26858 (_ BitVec 64)) Option!698)

(assert (=> d!133863 (= (getValueByKey!647 lt!555672 (_1!10040 (tuple2!20059 (select (arr!38060 _keys!1208) from!1455) (get!19423 (select (arr!38061 _values!996) from!1455) lt!555604)))) (Some!697 (_2!10040 (tuple2!20059 (select (arr!38060 _keys!1208) from!1455) (get!19423 (select (arr!38061 _values!996) from!1455) lt!555604)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!324 (List!26858 (_ BitVec 64) V!46515) Unit!40462)

(assert (=> d!133863 (= lt!555674 (lemmaContainsTupThenGetReturnValue!324 lt!555672 (_1!10040 (tuple2!20059 (select (arr!38060 _keys!1208) from!1455) (get!19423 (select (arr!38061 _values!996) from!1455) lt!555604))) (_2!10040 (tuple2!20059 (select (arr!38060 _keys!1208) from!1455) (get!19423 (select (arr!38061 _values!996) from!1455) lt!555604)))))))

(declare-fun insertStrictlySorted!417 (List!26858 (_ BitVec 64) V!46515) List!26858)

(assert (=> d!133863 (= lt!555672 (insertStrictlySorted!417 (toList!9029 lt!555602) (_1!10040 (tuple2!20059 (select (arr!38060 _keys!1208) from!1455) (get!19423 (select (arr!38061 _values!996) from!1455) lt!555604))) (_2!10040 (tuple2!20059 (select (arr!38060 _keys!1208) from!1455) (get!19423 (select (arr!38061 _values!996) from!1455) lt!555604)))))))

(assert (=> d!133863 (= (+!4092 lt!555602 (tuple2!20059 (select (arr!38060 _keys!1208) from!1455) (get!19423 (select (arr!38061 _values!996) from!1455) lt!555604))) lt!555675)))

(declare-fun b!1221607 () Bool)

(declare-fun res!811572 () Bool)

(assert (=> b!1221607 (=> (not res!811572) (not e!693743))))

(assert (=> b!1221607 (= res!811572 (= (getValueByKey!647 (toList!9029 lt!555675) (_1!10040 (tuple2!20059 (select (arr!38060 _keys!1208) from!1455) (get!19423 (select (arr!38061 _values!996) from!1455) lt!555604)))) (Some!697 (_2!10040 (tuple2!20059 (select (arr!38060 _keys!1208) from!1455) (get!19423 (select (arr!38061 _values!996) from!1455) lt!555604))))))))

(declare-fun b!1221608 () Bool)

(declare-fun contains!7027 (List!26858 tuple2!20058) Bool)

(assert (=> b!1221608 (= e!693743 (contains!7027 (toList!9029 lt!555675) (tuple2!20059 (select (arr!38060 _keys!1208) from!1455) (get!19423 (select (arr!38061 _values!996) from!1455) lt!555604))))))

(assert (= (and d!133863 res!811571) b!1221607))

(assert (= (and b!1221607 res!811572) b!1221608))

(declare-fun m!1126519 () Bool)

(assert (=> d!133863 m!1126519))

(declare-fun m!1126521 () Bool)

(assert (=> d!133863 m!1126521))

(declare-fun m!1126523 () Bool)

(assert (=> d!133863 m!1126523))

(declare-fun m!1126525 () Bool)

(assert (=> d!133863 m!1126525))

(declare-fun m!1126527 () Bool)

(assert (=> b!1221607 m!1126527))

(declare-fun m!1126529 () Bool)

(assert (=> b!1221608 m!1126529))

(assert (=> b!1221476 d!133863))

(declare-fun d!133865 () Bool)

(declare-fun c!120288 () Bool)

(assert (=> d!133865 (= c!120288 ((_ is ValueCellFull!14811) (select (arr!38061 _values!996) from!1455)))))

(declare-fun e!693746 () V!46515)

(assert (=> d!133865 (= (get!19423 (select (arr!38061 _values!996) from!1455) lt!555604) e!693746)))

(declare-fun b!1221613 () Bool)

(declare-fun get!19425 (ValueCell!14811 V!46515) V!46515)

(assert (=> b!1221613 (= e!693746 (get!19425 (select (arr!38061 _values!996) from!1455) lt!555604))))

(declare-fun b!1221614 () Bool)

(declare-fun get!19426 (ValueCell!14811 V!46515) V!46515)

(assert (=> b!1221614 (= e!693746 (get!19426 (select (arr!38061 _values!996) from!1455) lt!555604))))

(assert (= (and d!133865 c!120288) b!1221613))

(assert (= (and d!133865 (not c!120288)) b!1221614))

(assert (=> b!1221613 m!1126391))

(declare-fun m!1126531 () Bool)

(assert (=> b!1221613 m!1126531))

(assert (=> b!1221614 m!1126391))

(declare-fun m!1126533 () Bool)

(assert (=> b!1221614 m!1126533))

(assert (=> b!1221476 d!133865))

(declare-fun d!133867 () Bool)

(assert (=> d!133867 (= (array_inv!28958 _keys!1208) (bvsge (size!38596 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101582 d!133867))

(declare-fun d!133869 () Bool)

(assert (=> d!133869 (= (array_inv!28959 _values!996) (bvsge (size!38597 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101582 d!133869))

(declare-fun d!133871 () Bool)

(declare-fun lt!555678 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!546 (List!26859) (InoxSet (_ BitVec 64)))

(assert (=> d!133871 (= lt!555678 (select (content!546 Nil!26856) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!693751 () Bool)

(assert (=> d!133871 (= lt!555678 e!693751)))

(declare-fun res!811578 () Bool)

(assert (=> d!133871 (=> (not res!811578) (not e!693751))))

(assert (=> d!133871 (= res!811578 ((_ is Cons!26855) Nil!26856))))

(assert (=> d!133871 (= (contains!7024 Nil!26856 #b1000000000000000000000000000000000000000000000000000000000000000) lt!555678)))

(declare-fun b!1221619 () Bool)

(declare-fun e!693752 () Bool)

(assert (=> b!1221619 (= e!693751 e!693752)))

(declare-fun res!811577 () Bool)

(assert (=> b!1221619 (=> res!811577 e!693752)))

(assert (=> b!1221619 (= res!811577 (= (h!28064 Nil!26856) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1221620 () Bool)

(assert (=> b!1221620 (= e!693752 (contains!7024 (t!40176 Nil!26856) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!133871 res!811578) b!1221619))

(assert (= (and b!1221619 (not res!811577)) b!1221620))

(declare-fun m!1126535 () Bool)

(assert (=> d!133871 m!1126535))

(declare-fun m!1126537 () Bool)

(assert (=> d!133871 m!1126537))

(declare-fun m!1126539 () Bool)

(assert (=> b!1221620 m!1126539))

(assert (=> b!1221486 d!133871))

(declare-fun d!133873 () Bool)

(declare-fun res!811583 () Bool)

(declare-fun e!693757 () Bool)

(assert (=> d!133873 (=> res!811583 e!693757)))

(assert (=> d!133873 (= res!811583 ((_ is Nil!26856) Nil!26856))))

(assert (=> d!133873 (= (noDuplicate!1631 Nil!26856) e!693757)))

(declare-fun b!1221625 () Bool)

(declare-fun e!693758 () Bool)

(assert (=> b!1221625 (= e!693757 e!693758)))

(declare-fun res!811584 () Bool)

(assert (=> b!1221625 (=> (not res!811584) (not e!693758))))

(assert (=> b!1221625 (= res!811584 (not (contains!7024 (t!40176 Nil!26856) (h!28064 Nil!26856))))))

(declare-fun b!1221626 () Bool)

(assert (=> b!1221626 (= e!693758 (noDuplicate!1631 (t!40176 Nil!26856)))))

(assert (= (and d!133873 (not res!811583)) b!1221625))

(assert (= (and b!1221625 res!811584) b!1221626))

(declare-fun m!1126541 () Bool)

(assert (=> b!1221625 m!1126541))

(declare-fun m!1126543 () Bool)

(assert (=> b!1221626 m!1126543))

(assert (=> b!1221485 d!133873))

(declare-fun b!1221651 () Bool)

(declare-fun res!811594 () Bool)

(declare-fun e!693776 () Bool)

(assert (=> b!1221651 (=> (not res!811594) (not e!693776))))

(declare-fun lt!555694 () ListLongMap!18027)

(assert (=> b!1221651 (= res!811594 (not (contains!7026 lt!555694 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221652 () Bool)

(declare-fun lt!555697 () Unit!40462)

(declare-fun lt!555695 () Unit!40462)

(assert (=> b!1221652 (= lt!555697 lt!555695)))

(declare-fun lt!555693 () (_ BitVec 64))

(declare-fun lt!555698 () ListLongMap!18027)

(declare-fun lt!555699 () (_ BitVec 64))

(declare-fun lt!555696 () V!46515)

(assert (=> b!1221652 (not (contains!7026 (+!4092 lt!555698 (tuple2!20059 lt!555693 lt!555696)) lt!555699))))

(declare-fun addStillNotContains!304 (ListLongMap!18027 (_ BitVec 64) V!46515 (_ BitVec 64)) Unit!40462)

(assert (=> b!1221652 (= lt!555695 (addStillNotContains!304 lt!555698 lt!555693 lt!555696 lt!555699))))

(assert (=> b!1221652 (= lt!555699 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1221652 (= lt!555696 (get!19423 (select (arr!38061 lt!555603) from!1455) (dynLambda!3331 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1221652 (= lt!555693 (select (arr!38060 lt!555612) from!1455))))

(declare-fun call!60738 () ListLongMap!18027)

(assert (=> b!1221652 (= lt!555698 call!60738)))

(declare-fun e!693777 () ListLongMap!18027)

(assert (=> b!1221652 (= e!693777 (+!4092 call!60738 (tuple2!20059 (select (arr!38060 lt!555612) from!1455) (get!19423 (select (arr!38061 lt!555603) from!1455) (dynLambda!3331 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1221653 () Bool)

(declare-fun e!693779 () Bool)

(assert (=> b!1221653 (= e!693776 e!693779)))

(declare-fun c!120299 () Bool)

(declare-fun e!693778 () Bool)

(assert (=> b!1221653 (= c!120299 e!693778)))

(declare-fun res!811595 () Bool)

(assert (=> b!1221653 (=> (not res!811595) (not e!693778))))

(assert (=> b!1221653 (= res!811595 (bvslt from!1455 (size!38596 lt!555612)))))

(declare-fun b!1221654 () Bool)

(declare-fun e!693775 () ListLongMap!18027)

(assert (=> b!1221654 (= e!693775 (ListLongMap!18028 Nil!26855))))

(declare-fun b!1221655 () Bool)

(declare-fun e!693774 () Bool)

(assert (=> b!1221655 (= e!693774 (= lt!555694 (getCurrentListMapNoExtraKeys!5451 lt!555612 lt!555603 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1221656 () Bool)

(assert (=> b!1221656 (= e!693777 call!60738)))

(declare-fun b!1221657 () Bool)

(assert (=> b!1221657 (= e!693778 (validKeyInArray!0 (select (arr!38060 lt!555612) from!1455)))))

(assert (=> b!1221657 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1221658 () Bool)

(declare-fun e!693773 () Bool)

(assert (=> b!1221658 (= e!693779 e!693773)))

(assert (=> b!1221658 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38596 lt!555612)))))

(declare-fun res!811596 () Bool)

(assert (=> b!1221658 (= res!811596 (contains!7026 lt!555694 (select (arr!38060 lt!555612) from!1455)))))

(assert (=> b!1221658 (=> (not res!811596) (not e!693773))))

(declare-fun b!1221660 () Bool)

(assert (=> b!1221660 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38596 lt!555612)))))

(assert (=> b!1221660 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38597 lt!555603)))))

(declare-fun apply!976 (ListLongMap!18027 (_ BitVec 64)) V!46515)

(assert (=> b!1221660 (= e!693773 (= (apply!976 lt!555694 (select (arr!38060 lt!555612) from!1455)) (get!19423 (select (arr!38061 lt!555603) from!1455) (dynLambda!3331 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1221661 () Bool)

(assert (=> b!1221661 (= e!693779 e!693774)))

(declare-fun c!120300 () Bool)

(assert (=> b!1221661 (= c!120300 (bvslt from!1455 (size!38596 lt!555612)))))

(declare-fun b!1221662 () Bool)

(assert (=> b!1221662 (= e!693775 e!693777)))

(declare-fun c!120298 () Bool)

(assert (=> b!1221662 (= c!120298 (validKeyInArray!0 (select (arr!38060 lt!555612) from!1455)))))

(declare-fun bm!60735 () Bool)

(assert (=> bm!60735 (= call!60738 (getCurrentListMapNoExtraKeys!5451 lt!555612 lt!555603 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!133875 () Bool)

(assert (=> d!133875 e!693776))

(declare-fun res!811593 () Bool)

(assert (=> d!133875 (=> (not res!811593) (not e!693776))))

(assert (=> d!133875 (= res!811593 (not (contains!7026 lt!555694 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133875 (= lt!555694 e!693775)))

(declare-fun c!120297 () Bool)

(assert (=> d!133875 (= c!120297 (bvsge from!1455 (size!38596 lt!555612)))))

(assert (=> d!133875 (validMask!0 mask!1564)))

(assert (=> d!133875 (= (getCurrentListMapNoExtraKeys!5451 lt!555612 lt!555603 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!555694)))

(declare-fun b!1221659 () Bool)

(declare-fun isEmpty!1000 (ListLongMap!18027) Bool)

(assert (=> b!1221659 (= e!693774 (isEmpty!1000 lt!555694))))

(assert (= (and d!133875 c!120297) b!1221654))

(assert (= (and d!133875 (not c!120297)) b!1221662))

(assert (= (and b!1221662 c!120298) b!1221652))

(assert (= (and b!1221662 (not c!120298)) b!1221656))

(assert (= (or b!1221652 b!1221656) bm!60735))

(assert (= (and d!133875 res!811593) b!1221651))

(assert (= (and b!1221651 res!811594) b!1221653))

(assert (= (and b!1221653 res!811595) b!1221657))

(assert (= (and b!1221653 c!120299) b!1221658))

(assert (= (and b!1221653 (not c!120299)) b!1221661))

(assert (= (and b!1221658 res!811596) b!1221660))

(assert (= (and b!1221661 c!120300) b!1221655))

(assert (= (and b!1221661 (not c!120300)) b!1221659))

(declare-fun b_lambda!22247 () Bool)

(assert (=> (not b_lambda!22247) (not b!1221652)))

(assert (=> b!1221652 t!40174))

(declare-fun b_and!43907 () Bool)

(assert (= b_and!43901 (and (=> t!40174 result!22883) b_and!43907)))

(declare-fun b_lambda!22249 () Bool)

(assert (=> (not b_lambda!22249) (not b!1221660)))

(assert (=> b!1221660 t!40174))

(declare-fun b_and!43909 () Bool)

(assert (= b_and!43907 (and (=> t!40174 result!22883) b_and!43909)))

(declare-fun m!1126545 () Bool)

(assert (=> b!1221657 m!1126545))

(assert (=> b!1221657 m!1126545))

(declare-fun m!1126547 () Bool)

(assert (=> b!1221657 m!1126547))

(declare-fun m!1126549 () Bool)

(assert (=> b!1221651 m!1126549))

(declare-fun m!1126551 () Bool)

(assert (=> b!1221655 m!1126551))

(assert (=> bm!60735 m!1126551))

(assert (=> b!1221660 m!1126545))

(assert (=> b!1221660 m!1126545))

(declare-fun m!1126553 () Bool)

(assert (=> b!1221660 m!1126553))

(declare-fun m!1126555 () Bool)

(assert (=> b!1221660 m!1126555))

(assert (=> b!1221660 m!1126361))

(declare-fun m!1126557 () Bool)

(assert (=> b!1221660 m!1126557))

(assert (=> b!1221660 m!1126555))

(assert (=> b!1221660 m!1126361))

(declare-fun m!1126559 () Bool)

(assert (=> d!133875 m!1126559))

(assert (=> d!133875 m!1126389))

(assert (=> b!1221662 m!1126545))

(assert (=> b!1221662 m!1126545))

(assert (=> b!1221662 m!1126547))

(declare-fun m!1126561 () Bool)

(assert (=> b!1221659 m!1126561))

(assert (=> b!1221658 m!1126545))

(assert (=> b!1221658 m!1126545))

(declare-fun m!1126563 () Bool)

(assert (=> b!1221658 m!1126563))

(declare-fun m!1126565 () Bool)

(assert (=> b!1221652 m!1126565))

(declare-fun m!1126567 () Bool)

(assert (=> b!1221652 m!1126567))

(declare-fun m!1126569 () Bool)

(assert (=> b!1221652 m!1126569))

(assert (=> b!1221652 m!1126545))

(assert (=> b!1221652 m!1126567))

(assert (=> b!1221652 m!1126555))

(assert (=> b!1221652 m!1126361))

(assert (=> b!1221652 m!1126557))

(assert (=> b!1221652 m!1126555))

(declare-fun m!1126571 () Bool)

(assert (=> b!1221652 m!1126571))

(assert (=> b!1221652 m!1126361))

(assert (=> b!1221494 d!133875))

(declare-fun b!1221663 () Bool)

(declare-fun res!811598 () Bool)

(declare-fun e!693783 () Bool)

(assert (=> b!1221663 (=> (not res!811598) (not e!693783))))

(declare-fun lt!555701 () ListLongMap!18027)

(assert (=> b!1221663 (= res!811598 (not (contains!7026 lt!555701 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221664 () Bool)

(declare-fun lt!555704 () Unit!40462)

(declare-fun lt!555702 () Unit!40462)

(assert (=> b!1221664 (= lt!555704 lt!555702)))

(declare-fun lt!555706 () (_ BitVec 64))

(declare-fun lt!555705 () ListLongMap!18027)

(declare-fun lt!555700 () (_ BitVec 64))

(declare-fun lt!555703 () V!46515)

(assert (=> b!1221664 (not (contains!7026 (+!4092 lt!555705 (tuple2!20059 lt!555700 lt!555703)) lt!555706))))

(assert (=> b!1221664 (= lt!555702 (addStillNotContains!304 lt!555705 lt!555700 lt!555703 lt!555706))))

(assert (=> b!1221664 (= lt!555706 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1221664 (= lt!555703 (get!19423 (select (arr!38061 _values!996) from!1455) (dynLambda!3331 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1221664 (= lt!555700 (select (arr!38060 _keys!1208) from!1455))))

(declare-fun call!60739 () ListLongMap!18027)

(assert (=> b!1221664 (= lt!555705 call!60739)))

(declare-fun e!693784 () ListLongMap!18027)

(assert (=> b!1221664 (= e!693784 (+!4092 call!60739 (tuple2!20059 (select (arr!38060 _keys!1208) from!1455) (get!19423 (select (arr!38061 _values!996) from!1455) (dynLambda!3331 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1221665 () Bool)

(declare-fun e!693786 () Bool)

(assert (=> b!1221665 (= e!693783 e!693786)))

(declare-fun c!120303 () Bool)

(declare-fun e!693785 () Bool)

(assert (=> b!1221665 (= c!120303 e!693785)))

(declare-fun res!811599 () Bool)

(assert (=> b!1221665 (=> (not res!811599) (not e!693785))))

(assert (=> b!1221665 (= res!811599 (bvslt from!1455 (size!38596 _keys!1208)))))

(declare-fun b!1221666 () Bool)

(declare-fun e!693782 () ListLongMap!18027)

(assert (=> b!1221666 (= e!693782 (ListLongMap!18028 Nil!26855))))

(declare-fun b!1221667 () Bool)

(declare-fun e!693781 () Bool)

(assert (=> b!1221667 (= e!693781 (= lt!555701 (getCurrentListMapNoExtraKeys!5451 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1221668 () Bool)

(assert (=> b!1221668 (= e!693784 call!60739)))

(declare-fun b!1221669 () Bool)

(assert (=> b!1221669 (= e!693785 (validKeyInArray!0 (select (arr!38060 _keys!1208) from!1455)))))

(assert (=> b!1221669 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1221670 () Bool)

(declare-fun e!693780 () Bool)

(assert (=> b!1221670 (= e!693786 e!693780)))

(assert (=> b!1221670 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38596 _keys!1208)))))

(declare-fun res!811600 () Bool)

(assert (=> b!1221670 (= res!811600 (contains!7026 lt!555701 (select (arr!38060 _keys!1208) from!1455)))))

(assert (=> b!1221670 (=> (not res!811600) (not e!693780))))

(declare-fun b!1221672 () Bool)

(assert (=> b!1221672 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38596 _keys!1208)))))

(assert (=> b!1221672 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38597 _values!996)))))

(assert (=> b!1221672 (= e!693780 (= (apply!976 lt!555701 (select (arr!38060 _keys!1208) from!1455)) (get!19423 (select (arr!38061 _values!996) from!1455) (dynLambda!3331 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1221673 () Bool)

(assert (=> b!1221673 (= e!693786 e!693781)))

(declare-fun c!120304 () Bool)

(assert (=> b!1221673 (= c!120304 (bvslt from!1455 (size!38596 _keys!1208)))))

(declare-fun b!1221674 () Bool)

(assert (=> b!1221674 (= e!693782 e!693784)))

(declare-fun c!120302 () Bool)

(assert (=> b!1221674 (= c!120302 (validKeyInArray!0 (select (arr!38060 _keys!1208) from!1455)))))

(declare-fun bm!60736 () Bool)

(assert (=> bm!60736 (= call!60739 (getCurrentListMapNoExtraKeys!5451 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!133877 () Bool)

(assert (=> d!133877 e!693783))

(declare-fun res!811597 () Bool)

(assert (=> d!133877 (=> (not res!811597) (not e!693783))))

(assert (=> d!133877 (= res!811597 (not (contains!7026 lt!555701 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133877 (= lt!555701 e!693782)))

(declare-fun c!120301 () Bool)

(assert (=> d!133877 (= c!120301 (bvsge from!1455 (size!38596 _keys!1208)))))

(assert (=> d!133877 (validMask!0 mask!1564)))

(assert (=> d!133877 (= (getCurrentListMapNoExtraKeys!5451 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!555701)))

(declare-fun b!1221671 () Bool)

(assert (=> b!1221671 (= e!693781 (isEmpty!1000 lt!555701))))

(assert (= (and d!133877 c!120301) b!1221666))

(assert (= (and d!133877 (not c!120301)) b!1221674))

(assert (= (and b!1221674 c!120302) b!1221664))

(assert (= (and b!1221674 (not c!120302)) b!1221668))

(assert (= (or b!1221664 b!1221668) bm!60736))

(assert (= (and d!133877 res!811597) b!1221663))

(assert (= (and b!1221663 res!811598) b!1221665))

(assert (= (and b!1221665 res!811599) b!1221669))

(assert (= (and b!1221665 c!120303) b!1221670))

(assert (= (and b!1221665 (not c!120303)) b!1221673))

(assert (= (and b!1221670 res!811600) b!1221672))

(assert (= (and b!1221673 c!120304) b!1221667))

(assert (= (and b!1221673 (not c!120304)) b!1221671))

(declare-fun b_lambda!22251 () Bool)

(assert (=> (not b_lambda!22251) (not b!1221664)))

(assert (=> b!1221664 t!40174))

(declare-fun b_and!43911 () Bool)

(assert (= b_and!43909 (and (=> t!40174 result!22883) b_and!43911)))

(declare-fun b_lambda!22253 () Bool)

(assert (=> (not b_lambda!22253) (not b!1221672)))

(assert (=> b!1221672 t!40174))

(declare-fun b_and!43913 () Bool)

(assert (= b_and!43911 (and (=> t!40174 result!22883) b_and!43913)))

(assert (=> b!1221669 m!1126355))

(assert (=> b!1221669 m!1126355))

(assert (=> b!1221669 m!1126413))

(declare-fun m!1126573 () Bool)

(assert (=> b!1221663 m!1126573))

(declare-fun m!1126575 () Bool)

(assert (=> b!1221667 m!1126575))

(assert (=> bm!60736 m!1126575))

(assert (=> b!1221672 m!1126355))

(assert (=> b!1221672 m!1126355))

(declare-fun m!1126577 () Bool)

(assert (=> b!1221672 m!1126577))

(assert (=> b!1221672 m!1126391))

(assert (=> b!1221672 m!1126361))

(declare-fun m!1126579 () Bool)

(assert (=> b!1221672 m!1126579))

(assert (=> b!1221672 m!1126391))

(assert (=> b!1221672 m!1126361))

(declare-fun m!1126581 () Bool)

(assert (=> d!133877 m!1126581))

(assert (=> d!133877 m!1126389))

(assert (=> b!1221674 m!1126355))

(assert (=> b!1221674 m!1126355))

(assert (=> b!1221674 m!1126413))

(declare-fun m!1126583 () Bool)

(assert (=> b!1221671 m!1126583))

(assert (=> b!1221670 m!1126355))

(assert (=> b!1221670 m!1126355))

(declare-fun m!1126585 () Bool)

(assert (=> b!1221670 m!1126585))

(declare-fun m!1126587 () Bool)

(assert (=> b!1221664 m!1126587))

(declare-fun m!1126589 () Bool)

(assert (=> b!1221664 m!1126589))

(declare-fun m!1126591 () Bool)

(assert (=> b!1221664 m!1126591))

(assert (=> b!1221664 m!1126355))

(assert (=> b!1221664 m!1126589))

(assert (=> b!1221664 m!1126391))

(assert (=> b!1221664 m!1126361))

(assert (=> b!1221664 m!1126579))

(assert (=> b!1221664 m!1126391))

(declare-fun m!1126593 () Bool)

(assert (=> b!1221664 m!1126593))

(assert (=> b!1221664 m!1126361))

(assert (=> b!1221494 d!133877))

(declare-fun b!1221675 () Bool)

(declare-fun e!693787 () Bool)

(declare-fun e!693788 () Bool)

(assert (=> b!1221675 (= e!693787 e!693788)))

(declare-fun lt!555709 () (_ BitVec 64))

(assert (=> b!1221675 (= lt!555709 (select (arr!38060 lt!555612) #b00000000000000000000000000000000))))

(declare-fun lt!555707 () Unit!40462)

(assert (=> b!1221675 (= lt!555707 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!555612 lt!555709 #b00000000000000000000000000000000))))

(assert (=> b!1221675 (arrayContainsKey!0 lt!555612 lt!555709 #b00000000000000000000000000000000)))

(declare-fun lt!555708 () Unit!40462)

(assert (=> b!1221675 (= lt!555708 lt!555707)))

(declare-fun res!811601 () Bool)

(assert (=> b!1221675 (= res!811601 (= (seekEntryOrOpen!0 (select (arr!38060 lt!555612) #b00000000000000000000000000000000) lt!555612 mask!1564) (Found!9949 #b00000000000000000000000000000000)))))

(assert (=> b!1221675 (=> (not res!811601) (not e!693788))))

(declare-fun b!1221676 () Bool)

(declare-fun e!693789 () Bool)

(assert (=> b!1221676 (= e!693789 e!693787)))

(declare-fun c!120305 () Bool)

(assert (=> b!1221676 (= c!120305 (validKeyInArray!0 (select (arr!38060 lt!555612) #b00000000000000000000000000000000)))))

(declare-fun d!133879 () Bool)

(declare-fun res!811602 () Bool)

(assert (=> d!133879 (=> res!811602 e!693789)))

(assert (=> d!133879 (= res!811602 (bvsge #b00000000000000000000000000000000 (size!38596 lt!555612)))))

(assert (=> d!133879 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555612 mask!1564) e!693789)))

(declare-fun bm!60737 () Bool)

(declare-fun call!60740 () Bool)

(assert (=> bm!60737 (= call!60740 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!555612 mask!1564))))

(declare-fun b!1221677 () Bool)

(assert (=> b!1221677 (= e!693787 call!60740)))

(declare-fun b!1221678 () Bool)

(assert (=> b!1221678 (= e!693788 call!60740)))

(assert (= (and d!133879 (not res!811602)) b!1221676))

(assert (= (and b!1221676 c!120305) b!1221675))

(assert (= (and b!1221676 (not c!120305)) b!1221677))

(assert (= (and b!1221675 res!811601) b!1221678))

(assert (= (or b!1221678 b!1221677) bm!60737))

(assert (=> b!1221675 m!1126499))

(declare-fun m!1126595 () Bool)

(assert (=> b!1221675 m!1126595))

(declare-fun m!1126597 () Bool)

(assert (=> b!1221675 m!1126597))

(assert (=> b!1221675 m!1126499))

(declare-fun m!1126599 () Bool)

(assert (=> b!1221675 m!1126599))

(assert (=> b!1221676 m!1126499))

(assert (=> b!1221676 m!1126499))

(assert (=> b!1221676 m!1126505))

(declare-fun m!1126601 () Bool)

(assert (=> bm!60737 m!1126601))

(assert (=> b!1221474 d!133879))

(declare-fun d!133881 () Bool)

(assert (=> d!133881 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1221484 d!133881))

(declare-fun b!1221679 () Bool)

(declare-fun e!693791 () Bool)

(declare-fun call!60741 () Bool)

(assert (=> b!1221679 (= e!693791 call!60741)))

(declare-fun b!1221680 () Bool)

(declare-fun e!693790 () Bool)

(assert (=> b!1221680 (= e!693790 (contains!7024 Nil!26856 (select (arr!38060 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1221681 () Bool)

(assert (=> b!1221681 (= e!693791 call!60741)))

(declare-fun bm!60738 () Bool)

(declare-fun c!120306 () Bool)

(assert (=> bm!60738 (= call!60741 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120306 (Cons!26855 (select (arr!38060 _keys!1208) #b00000000000000000000000000000000) Nil!26856) Nil!26856)))))

(declare-fun b!1221682 () Bool)

(declare-fun e!693793 () Bool)

(declare-fun e!693792 () Bool)

(assert (=> b!1221682 (= e!693793 e!693792)))

(declare-fun res!811603 () Bool)

(assert (=> b!1221682 (=> (not res!811603) (not e!693792))))

(assert (=> b!1221682 (= res!811603 (not e!693790))))

(declare-fun res!811605 () Bool)

(assert (=> b!1221682 (=> (not res!811605) (not e!693790))))

(assert (=> b!1221682 (= res!811605 (validKeyInArray!0 (select (arr!38060 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1221683 () Bool)

(assert (=> b!1221683 (= e!693792 e!693791)))

(assert (=> b!1221683 (= c!120306 (validKeyInArray!0 (select (arr!38060 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133883 () Bool)

(declare-fun res!811604 () Bool)

(assert (=> d!133883 (=> res!811604 e!693793)))

(assert (=> d!133883 (= res!811604 (bvsge #b00000000000000000000000000000000 (size!38596 _keys!1208)))))

(assert (=> d!133883 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26856) e!693793)))

(assert (= (and d!133883 (not res!811604)) b!1221682))

(assert (= (and b!1221682 res!811605) b!1221680))

(assert (= (and b!1221682 res!811603) b!1221683))

(assert (= (and b!1221683 c!120306) b!1221681))

(assert (= (and b!1221683 (not c!120306)) b!1221679))

(assert (= (or b!1221681 b!1221679) bm!60738))

(assert (=> b!1221680 m!1126487))

(assert (=> b!1221680 m!1126487))

(declare-fun m!1126603 () Bool)

(assert (=> b!1221680 m!1126603))

(assert (=> bm!60738 m!1126487))

(declare-fun m!1126605 () Bool)

(assert (=> bm!60738 m!1126605))

(assert (=> b!1221682 m!1126487))

(assert (=> b!1221682 m!1126487))

(assert (=> b!1221682 m!1126495))

(assert (=> b!1221683 m!1126487))

(assert (=> b!1221683 m!1126487))

(assert (=> b!1221683 m!1126495))

(assert (=> b!1221483 d!133883))

(declare-fun d!133885 () Bool)

(declare-fun res!811606 () Bool)

(declare-fun e!693794 () Bool)

(assert (=> d!133885 (=> res!811606 e!693794)))

(assert (=> d!133885 (= res!811606 (= (select (arr!38060 _keys!1208) i!673) k0!934))))

(assert (=> d!133885 (= (arrayContainsKey!0 _keys!1208 k0!934 i!673) e!693794)))

(declare-fun b!1221684 () Bool)

(declare-fun e!693795 () Bool)

(assert (=> b!1221684 (= e!693794 e!693795)))

(declare-fun res!811607 () Bool)

(assert (=> b!1221684 (=> (not res!811607) (not e!693795))))

(assert (=> b!1221684 (= res!811607 (bvslt (bvadd i!673 #b00000000000000000000000000000001) (size!38596 _keys!1208)))))

(declare-fun b!1221685 () Bool)

(assert (=> b!1221685 (= e!693795 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd i!673 #b00000000000000000000000000000001)))))

(assert (= (and d!133885 (not res!811606)) b!1221684))

(assert (= (and b!1221684 res!811607) b!1221685))

(assert (=> d!133885 m!1126369))

(declare-fun m!1126607 () Bool)

(assert (=> b!1221685 m!1126607))

(assert (=> b!1221473 d!133885))

(declare-fun d!133887 () Bool)

(declare-fun lt!555710 () Bool)

(assert (=> d!133887 (= lt!555710 (select (content!546 Nil!26856) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!693796 () Bool)

(assert (=> d!133887 (= lt!555710 e!693796)))

(declare-fun res!811609 () Bool)

(assert (=> d!133887 (=> (not res!811609) (not e!693796))))

(assert (=> d!133887 (= res!811609 ((_ is Cons!26855) Nil!26856))))

(assert (=> d!133887 (= (contains!7024 Nil!26856 #b0000000000000000000000000000000000000000000000000000000000000000) lt!555710)))

(declare-fun b!1221686 () Bool)

(declare-fun e!693797 () Bool)

(assert (=> b!1221686 (= e!693796 e!693797)))

(declare-fun res!811608 () Bool)

(assert (=> b!1221686 (=> res!811608 e!693797)))

(assert (=> b!1221686 (= res!811608 (= (h!28064 Nil!26856) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1221687 () Bool)

(assert (=> b!1221687 (= e!693797 (contains!7024 (t!40176 Nil!26856) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!133887 res!811609) b!1221686))

(assert (= (and b!1221686 (not res!811608)) b!1221687))

(assert (=> d!133887 m!1126535))

(declare-fun m!1126609 () Bool)

(assert (=> d!133887 m!1126609))

(declare-fun m!1126611 () Bool)

(assert (=> b!1221687 m!1126611))

(assert (=> b!1221492 d!133887))

(declare-fun d!133889 () Bool)

(declare-fun lt!555713 () ListLongMap!18027)

(assert (=> d!133889 (not (contains!7026 lt!555713 k0!934))))

(declare-fun removeStrictlySorted!109 (List!26858 (_ BitVec 64)) List!26858)

(assert (=> d!133889 (= lt!555713 (ListLongMap!18028 (removeStrictlySorted!109 (toList!9029 lt!555610) k0!934)))))

(assert (=> d!133889 (= (-!1934 lt!555610 k0!934) lt!555713)))

(declare-fun bs!34385 () Bool)

(assert (= bs!34385 d!133889))

(declare-fun m!1126613 () Bool)

(assert (=> bs!34385 m!1126613))

(declare-fun m!1126615 () Bool)

(assert (=> bs!34385 m!1126615))

(assert (=> b!1221491 d!133889))

(declare-fun d!133891 () Bool)

(assert (=> d!133891 (= (validKeyInArray!0 (select (arr!38060 _keys!1208) from!1455)) (and (not (= (select (arr!38060 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38060 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1221491 d!133891))

(declare-fun b!1221688 () Bool)

(declare-fun res!811611 () Bool)

(declare-fun e!693801 () Bool)

(assert (=> b!1221688 (=> (not res!811611) (not e!693801))))

(declare-fun lt!555715 () ListLongMap!18027)

(assert (=> b!1221688 (= res!811611 (not (contains!7026 lt!555715 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221689 () Bool)

(declare-fun lt!555718 () Unit!40462)

(declare-fun lt!555716 () Unit!40462)

(assert (=> b!1221689 (= lt!555718 lt!555716)))

(declare-fun lt!555717 () V!46515)

(declare-fun lt!555714 () (_ BitVec 64))

(declare-fun lt!555720 () (_ BitVec 64))

(declare-fun lt!555719 () ListLongMap!18027)

(assert (=> b!1221689 (not (contains!7026 (+!4092 lt!555719 (tuple2!20059 lt!555714 lt!555717)) lt!555720))))

(assert (=> b!1221689 (= lt!555716 (addStillNotContains!304 lt!555719 lt!555714 lt!555717 lt!555720))))

(assert (=> b!1221689 (= lt!555720 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1221689 (= lt!555717 (get!19423 (select (arr!38061 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3331 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1221689 (= lt!555714 (select (arr!38060 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60742 () ListLongMap!18027)

(assert (=> b!1221689 (= lt!555719 call!60742)))

(declare-fun e!693802 () ListLongMap!18027)

(assert (=> b!1221689 (= e!693802 (+!4092 call!60742 (tuple2!20059 (select (arr!38060 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19423 (select (arr!38061 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3331 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1221690 () Bool)

(declare-fun e!693804 () Bool)

(assert (=> b!1221690 (= e!693801 e!693804)))

(declare-fun c!120309 () Bool)

(declare-fun e!693803 () Bool)

(assert (=> b!1221690 (= c!120309 e!693803)))

(declare-fun res!811612 () Bool)

(assert (=> b!1221690 (=> (not res!811612) (not e!693803))))

(assert (=> b!1221690 (= res!811612 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38596 _keys!1208)))))

(declare-fun b!1221691 () Bool)

(declare-fun e!693800 () ListLongMap!18027)

(assert (=> b!1221691 (= e!693800 (ListLongMap!18028 Nil!26855))))

(declare-fun b!1221692 () Bool)

(declare-fun e!693799 () Bool)

(assert (=> b!1221692 (= e!693799 (= lt!555715 (getCurrentListMapNoExtraKeys!5451 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1221693 () Bool)

(assert (=> b!1221693 (= e!693802 call!60742)))

(declare-fun b!1221694 () Bool)

(assert (=> b!1221694 (= e!693803 (validKeyInArray!0 (select (arr!38060 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1221694 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1221695 () Bool)

(declare-fun e!693798 () Bool)

(assert (=> b!1221695 (= e!693804 e!693798)))

(assert (=> b!1221695 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38596 _keys!1208)))))

(declare-fun res!811613 () Bool)

(assert (=> b!1221695 (= res!811613 (contains!7026 lt!555715 (select (arr!38060 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1221695 (=> (not res!811613) (not e!693798))))

(declare-fun b!1221697 () Bool)

(assert (=> b!1221697 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38596 _keys!1208)))))

(assert (=> b!1221697 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38597 _values!996)))))

(assert (=> b!1221697 (= e!693798 (= (apply!976 lt!555715 (select (arr!38060 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19423 (select (arr!38061 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3331 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1221698 () Bool)

(assert (=> b!1221698 (= e!693804 e!693799)))

(declare-fun c!120310 () Bool)

(assert (=> b!1221698 (= c!120310 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38596 _keys!1208)))))

(declare-fun b!1221699 () Bool)

(assert (=> b!1221699 (= e!693800 e!693802)))

(declare-fun c!120308 () Bool)

(assert (=> b!1221699 (= c!120308 (validKeyInArray!0 (select (arr!38060 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun bm!60739 () Bool)

(assert (=> bm!60739 (= call!60742 (getCurrentListMapNoExtraKeys!5451 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!133893 () Bool)

(assert (=> d!133893 e!693801))

(declare-fun res!811610 () Bool)

(assert (=> d!133893 (=> (not res!811610) (not e!693801))))

(assert (=> d!133893 (= res!811610 (not (contains!7026 lt!555715 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133893 (= lt!555715 e!693800)))

(declare-fun c!120307 () Bool)

(assert (=> d!133893 (= c!120307 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38596 _keys!1208)))))

(assert (=> d!133893 (validMask!0 mask!1564)))

(assert (=> d!133893 (= (getCurrentListMapNoExtraKeys!5451 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!555715)))

(declare-fun b!1221696 () Bool)

(assert (=> b!1221696 (= e!693799 (isEmpty!1000 lt!555715))))

(assert (= (and d!133893 c!120307) b!1221691))

(assert (= (and d!133893 (not c!120307)) b!1221699))

(assert (= (and b!1221699 c!120308) b!1221689))

(assert (= (and b!1221699 (not c!120308)) b!1221693))

(assert (= (or b!1221689 b!1221693) bm!60739))

(assert (= (and d!133893 res!811610) b!1221688))

(assert (= (and b!1221688 res!811611) b!1221690))

(assert (= (and b!1221690 res!811612) b!1221694))

(assert (= (and b!1221690 c!120309) b!1221695))

(assert (= (and b!1221690 (not c!120309)) b!1221698))

(assert (= (and b!1221695 res!811613) b!1221697))

(assert (= (and b!1221698 c!120310) b!1221692))

(assert (= (and b!1221698 (not c!120310)) b!1221696))

(declare-fun b_lambda!22255 () Bool)

(assert (=> (not b_lambda!22255) (not b!1221689)))

(assert (=> b!1221689 t!40174))

(declare-fun b_and!43915 () Bool)

(assert (= b_and!43913 (and (=> t!40174 result!22883) b_and!43915)))

(declare-fun b_lambda!22257 () Bool)

(assert (=> (not b_lambda!22257) (not b!1221697)))

(assert (=> b!1221697 t!40174))

(declare-fun b_and!43917 () Bool)

(assert (= b_and!43915 (and (=> t!40174 result!22883) b_and!43917)))

(assert (=> b!1221694 m!1126513))

(assert (=> b!1221694 m!1126513))

(declare-fun m!1126617 () Bool)

(assert (=> b!1221694 m!1126617))

(declare-fun m!1126619 () Bool)

(assert (=> b!1221688 m!1126619))

(declare-fun m!1126621 () Bool)

(assert (=> b!1221692 m!1126621))

(assert (=> bm!60739 m!1126621))

(assert (=> b!1221697 m!1126513))

(assert (=> b!1221697 m!1126513))

(declare-fun m!1126623 () Bool)

(assert (=> b!1221697 m!1126623))

(declare-fun m!1126625 () Bool)

(assert (=> b!1221697 m!1126625))

(assert (=> b!1221697 m!1126361))

(declare-fun m!1126627 () Bool)

(assert (=> b!1221697 m!1126627))

(assert (=> b!1221697 m!1126625))

(assert (=> b!1221697 m!1126361))

(declare-fun m!1126629 () Bool)

(assert (=> d!133893 m!1126629))

(assert (=> d!133893 m!1126389))

(assert (=> b!1221699 m!1126513))

(assert (=> b!1221699 m!1126513))

(assert (=> b!1221699 m!1126617))

(declare-fun m!1126631 () Bool)

(assert (=> b!1221696 m!1126631))

(assert (=> b!1221695 m!1126513))

(assert (=> b!1221695 m!1126513))

(declare-fun m!1126633 () Bool)

(assert (=> b!1221695 m!1126633))

(declare-fun m!1126635 () Bool)

(assert (=> b!1221689 m!1126635))

(declare-fun m!1126637 () Bool)

(assert (=> b!1221689 m!1126637))

(declare-fun m!1126639 () Bool)

(assert (=> b!1221689 m!1126639))

(assert (=> b!1221689 m!1126513))

(assert (=> b!1221689 m!1126637))

(assert (=> b!1221689 m!1126625))

(assert (=> b!1221689 m!1126361))

(assert (=> b!1221689 m!1126627))

(assert (=> b!1221689 m!1126625))

(declare-fun m!1126641 () Bool)

(assert (=> b!1221689 m!1126641))

(assert (=> b!1221689 m!1126361))

(assert (=> b!1221491 d!133893))

(declare-fun b!1221700 () Bool)

(declare-fun res!811615 () Bool)

(declare-fun e!693808 () Bool)

(assert (=> b!1221700 (=> (not res!811615) (not e!693808))))

(declare-fun lt!555722 () ListLongMap!18027)

(assert (=> b!1221700 (= res!811615 (not (contains!7026 lt!555722 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1221701 () Bool)

(declare-fun lt!555725 () Unit!40462)

(declare-fun lt!555723 () Unit!40462)

(assert (=> b!1221701 (= lt!555725 lt!555723)))

(declare-fun lt!555726 () ListLongMap!18027)

(declare-fun lt!555724 () V!46515)

(declare-fun lt!555721 () (_ BitVec 64))

(declare-fun lt!555727 () (_ BitVec 64))

(assert (=> b!1221701 (not (contains!7026 (+!4092 lt!555726 (tuple2!20059 lt!555721 lt!555724)) lt!555727))))

(assert (=> b!1221701 (= lt!555723 (addStillNotContains!304 lt!555726 lt!555721 lt!555724 lt!555727))))

(assert (=> b!1221701 (= lt!555727 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1221701 (= lt!555724 (get!19423 (select (arr!38061 lt!555603) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3331 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1221701 (= lt!555721 (select (arr!38060 lt!555612) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60743 () ListLongMap!18027)

(assert (=> b!1221701 (= lt!555726 call!60743)))

(declare-fun e!693809 () ListLongMap!18027)

(assert (=> b!1221701 (= e!693809 (+!4092 call!60743 (tuple2!20059 (select (arr!38060 lt!555612) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19423 (select (arr!38061 lt!555603) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3331 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1221702 () Bool)

(declare-fun e!693811 () Bool)

(assert (=> b!1221702 (= e!693808 e!693811)))

(declare-fun c!120313 () Bool)

(declare-fun e!693810 () Bool)

(assert (=> b!1221702 (= c!120313 e!693810)))

(declare-fun res!811616 () Bool)

(assert (=> b!1221702 (=> (not res!811616) (not e!693810))))

(assert (=> b!1221702 (= res!811616 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38596 lt!555612)))))

(declare-fun b!1221703 () Bool)

(declare-fun e!693807 () ListLongMap!18027)

(assert (=> b!1221703 (= e!693807 (ListLongMap!18028 Nil!26855))))

(declare-fun e!693806 () Bool)

(declare-fun b!1221704 () Bool)

(assert (=> b!1221704 (= e!693806 (= lt!555722 (getCurrentListMapNoExtraKeys!5451 lt!555612 lt!555603 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1221705 () Bool)

(assert (=> b!1221705 (= e!693809 call!60743)))

(declare-fun b!1221706 () Bool)

(assert (=> b!1221706 (= e!693810 (validKeyInArray!0 (select (arr!38060 lt!555612) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1221706 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1221707 () Bool)

(declare-fun e!693805 () Bool)

(assert (=> b!1221707 (= e!693811 e!693805)))

(assert (=> b!1221707 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38596 lt!555612)))))

(declare-fun res!811617 () Bool)

(assert (=> b!1221707 (= res!811617 (contains!7026 lt!555722 (select (arr!38060 lt!555612) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1221707 (=> (not res!811617) (not e!693805))))

(declare-fun b!1221709 () Bool)

(assert (=> b!1221709 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38596 lt!555612)))))

(assert (=> b!1221709 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38597 lt!555603)))))

(assert (=> b!1221709 (= e!693805 (= (apply!976 lt!555722 (select (arr!38060 lt!555612) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19423 (select (arr!38061 lt!555603) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3331 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1221710 () Bool)

(assert (=> b!1221710 (= e!693811 e!693806)))

(declare-fun c!120314 () Bool)

(assert (=> b!1221710 (= c!120314 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38596 lt!555612)))))

(declare-fun b!1221711 () Bool)

(assert (=> b!1221711 (= e!693807 e!693809)))

(declare-fun c!120312 () Bool)

(assert (=> b!1221711 (= c!120312 (validKeyInArray!0 (select (arr!38060 lt!555612) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun bm!60740 () Bool)

(assert (=> bm!60740 (= call!60743 (getCurrentListMapNoExtraKeys!5451 lt!555612 lt!555603 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!133895 () Bool)

(assert (=> d!133895 e!693808))

(declare-fun res!811614 () Bool)

(assert (=> d!133895 (=> (not res!811614) (not e!693808))))

(assert (=> d!133895 (= res!811614 (not (contains!7026 lt!555722 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133895 (= lt!555722 e!693807)))

(declare-fun c!120311 () Bool)

(assert (=> d!133895 (= c!120311 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38596 lt!555612)))))

(assert (=> d!133895 (validMask!0 mask!1564)))

(assert (=> d!133895 (= (getCurrentListMapNoExtraKeys!5451 lt!555612 lt!555603 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!555722)))

(declare-fun b!1221708 () Bool)

(assert (=> b!1221708 (= e!693806 (isEmpty!1000 lt!555722))))

(assert (= (and d!133895 c!120311) b!1221703))

(assert (= (and d!133895 (not c!120311)) b!1221711))

(assert (= (and b!1221711 c!120312) b!1221701))

(assert (= (and b!1221711 (not c!120312)) b!1221705))

(assert (= (or b!1221701 b!1221705) bm!60740))

(assert (= (and d!133895 res!811614) b!1221700))

(assert (= (and b!1221700 res!811615) b!1221702))

(assert (= (and b!1221702 res!811616) b!1221706))

(assert (= (and b!1221702 c!120313) b!1221707))

(assert (= (and b!1221702 (not c!120313)) b!1221710))

(assert (= (and b!1221707 res!811617) b!1221709))

(assert (= (and b!1221710 c!120314) b!1221704))

(assert (= (and b!1221710 (not c!120314)) b!1221708))

(declare-fun b_lambda!22259 () Bool)

(assert (=> (not b_lambda!22259) (not b!1221701)))

(assert (=> b!1221701 t!40174))

(declare-fun b_and!43919 () Bool)

(assert (= b_and!43917 (and (=> t!40174 result!22883) b_and!43919)))

(declare-fun b_lambda!22261 () Bool)

(assert (=> (not b_lambda!22261) (not b!1221709)))

(assert (=> b!1221709 t!40174))

(declare-fun b_and!43921 () Bool)

(assert (= b_and!43919 (and (=> t!40174 result!22883) b_and!43921)))

(declare-fun m!1126643 () Bool)

(assert (=> b!1221706 m!1126643))

(assert (=> b!1221706 m!1126643))

(declare-fun m!1126645 () Bool)

(assert (=> b!1221706 m!1126645))

(declare-fun m!1126647 () Bool)

(assert (=> b!1221700 m!1126647))

(declare-fun m!1126649 () Bool)

(assert (=> b!1221704 m!1126649))

(assert (=> bm!60740 m!1126649))

(assert (=> b!1221709 m!1126643))

(assert (=> b!1221709 m!1126643))

(declare-fun m!1126651 () Bool)

(assert (=> b!1221709 m!1126651))

(declare-fun m!1126653 () Bool)

(assert (=> b!1221709 m!1126653))

(assert (=> b!1221709 m!1126361))

(declare-fun m!1126655 () Bool)

(assert (=> b!1221709 m!1126655))

(assert (=> b!1221709 m!1126653))

(assert (=> b!1221709 m!1126361))

(declare-fun m!1126657 () Bool)

(assert (=> d!133895 m!1126657))

(assert (=> d!133895 m!1126389))

(assert (=> b!1221711 m!1126643))

(assert (=> b!1221711 m!1126643))

(assert (=> b!1221711 m!1126645))

(declare-fun m!1126659 () Bool)

(assert (=> b!1221708 m!1126659))

(assert (=> b!1221707 m!1126643))

(assert (=> b!1221707 m!1126643))

(declare-fun m!1126661 () Bool)

(assert (=> b!1221707 m!1126661))

(declare-fun m!1126663 () Bool)

(assert (=> b!1221701 m!1126663))

(declare-fun m!1126665 () Bool)

(assert (=> b!1221701 m!1126665))

(declare-fun m!1126667 () Bool)

(assert (=> b!1221701 m!1126667))

(assert (=> b!1221701 m!1126643))

(assert (=> b!1221701 m!1126665))

(assert (=> b!1221701 m!1126653))

(assert (=> b!1221701 m!1126361))

(assert (=> b!1221701 m!1126655))

(assert (=> b!1221701 m!1126653))

(declare-fun m!1126669 () Bool)

(assert (=> b!1221701 m!1126669))

(assert (=> b!1221701 m!1126361))

(assert (=> b!1221491 d!133895))

(declare-fun d!133897 () Bool)

(declare-fun e!693816 () Bool)

(assert (=> d!133897 e!693816))

(declare-fun res!811620 () Bool)

(assert (=> d!133897 (=> (not res!811620) (not e!693816))))

(assert (=> d!133897 (= res!811620 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38596 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38596 _keys!1208))))))))

(declare-fun lt!555730 () Unit!40462)

(declare-fun choose!1827 (array!78863 array!78865 (_ BitVec 32) (_ BitVec 32) V!46515 V!46515 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40462)

(assert (=> d!133897 (= lt!555730 (choose!1827 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133897 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38596 _keys!1208)))))

(assert (=> d!133897 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1141 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!555730)))

(declare-fun bm!60745 () Bool)

(declare-fun call!60749 () ListLongMap!18027)

(assert (=> bm!60745 (= call!60749 (getCurrentListMapNoExtraKeys!5451 (array!78864 (store (arr!38060 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38596 _keys!1208)) (array!78866 (store (arr!38061 _values!996) i!673 (ValueCellFull!14811 (dynLambda!3331 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38597 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!693817 () Bool)

(declare-fun b!1221718 () Bool)

(declare-fun call!60748 () ListLongMap!18027)

(assert (=> b!1221718 (= e!693817 (= call!60749 (-!1934 call!60748 k0!934)))))

(assert (=> b!1221718 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38597 _values!996)))))

(declare-fun b!1221719 () Bool)

(assert (=> b!1221719 (= e!693816 e!693817)))

(declare-fun c!120317 () Bool)

(assert (=> b!1221719 (= c!120317 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun bm!60746 () Bool)

(assert (=> bm!60746 (= call!60748 (getCurrentListMapNoExtraKeys!5451 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1221720 () Bool)

(assert (=> b!1221720 (= e!693817 (= call!60749 call!60748))))

(assert (=> b!1221720 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38597 _values!996)))))

(assert (= (and d!133897 res!811620) b!1221719))

(assert (= (and b!1221719 c!120317) b!1221718))

(assert (= (and b!1221719 (not c!120317)) b!1221720))

(assert (= (or b!1221718 b!1221720) bm!60746))

(assert (= (or b!1221718 b!1221720) bm!60745))

(declare-fun b_lambda!22263 () Bool)

(assert (=> (not b_lambda!22263) (not bm!60745)))

(assert (=> bm!60745 t!40174))

(declare-fun b_and!43923 () Bool)

(assert (= b_and!43921 (and (=> t!40174 result!22883) b_and!43923)))

(declare-fun m!1126671 () Bool)

(assert (=> d!133897 m!1126671))

(assert (=> bm!60745 m!1126377))

(assert (=> bm!60745 m!1126361))

(declare-fun m!1126673 () Bool)

(assert (=> bm!60745 m!1126673))

(declare-fun m!1126675 () Bool)

(assert (=> bm!60745 m!1126675))

(declare-fun m!1126677 () Bool)

(assert (=> b!1221718 m!1126677))

(assert (=> bm!60746 m!1126415))

(assert (=> b!1221491 d!133897))

(declare-fun d!133899 () Bool)

(declare-fun res!811621 () Bool)

(declare-fun e!693818 () Bool)

(assert (=> d!133899 (=> res!811621 e!693818)))

(assert (=> d!133899 (= res!811621 (= (select (arr!38060 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133899 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!693818)))

(declare-fun b!1221721 () Bool)

(declare-fun e!693819 () Bool)

(assert (=> b!1221721 (= e!693818 e!693819)))

(declare-fun res!811622 () Bool)

(assert (=> b!1221721 (=> (not res!811622) (not e!693819))))

(assert (=> b!1221721 (= res!811622 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38596 _keys!1208)))))

(declare-fun b!1221722 () Bool)

(assert (=> b!1221722 (= e!693819 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133899 (not res!811621)) b!1221721))

(assert (= (and b!1221721 res!811622) b!1221722))

(assert (=> d!133899 m!1126487))

(declare-fun m!1126679 () Bool)

(assert (=> b!1221722 m!1126679))

(assert (=> b!1221481 d!133899))

(declare-fun d!133901 () Bool)

(assert (=> d!133901 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!555733 () Unit!40462)

(declare-fun choose!13 (array!78863 (_ BitVec 64) (_ BitVec 32)) Unit!40462)

(assert (=> d!133901 (= lt!555733 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133901 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133901 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!555733)))

(declare-fun bs!34386 () Bool)

(assert (= bs!34386 d!133901))

(assert (=> bs!34386 m!1126385))

(declare-fun m!1126681 () Bool)

(assert (=> bs!34386 m!1126681))

(assert (=> b!1221481 d!133901))

(declare-fun mapNonEmpty!48460 () Bool)

(declare-fun mapRes!48460 () Bool)

(declare-fun tp!92060 () Bool)

(declare-fun e!693825 () Bool)

(assert (=> mapNonEmpty!48460 (= mapRes!48460 (and tp!92060 e!693825))))

(declare-fun mapRest!48460 () (Array (_ BitVec 32) ValueCell!14811))

(declare-fun mapValue!48460 () ValueCell!14811)

(declare-fun mapKey!48460 () (_ BitVec 32))

(assert (=> mapNonEmpty!48460 (= mapRest!48454 (store mapRest!48460 mapKey!48460 mapValue!48460))))

(declare-fun mapIsEmpty!48460 () Bool)

(assert (=> mapIsEmpty!48460 mapRes!48460))

(declare-fun condMapEmpty!48460 () Bool)

(declare-fun mapDefault!48460 () ValueCell!14811)

(assert (=> mapNonEmpty!48454 (= condMapEmpty!48460 (= mapRest!48454 ((as const (Array (_ BitVec 32) ValueCell!14811)) mapDefault!48460)))))

(declare-fun e!693824 () Bool)

(assert (=> mapNonEmpty!48454 (= tp!92050 (and e!693824 mapRes!48460))))

(declare-fun b!1221730 () Bool)

(assert (=> b!1221730 (= e!693824 tp_is_empty!31041)))

(declare-fun b!1221729 () Bool)

(assert (=> b!1221729 (= e!693825 tp_is_empty!31041)))

(assert (= (and mapNonEmpty!48454 condMapEmpty!48460) mapIsEmpty!48460))

(assert (= (and mapNonEmpty!48454 (not condMapEmpty!48460)) mapNonEmpty!48460))

(assert (= (and mapNonEmpty!48460 ((_ is ValueCellFull!14811) mapValue!48460)) b!1221729))

(assert (= (and mapNonEmpty!48454 ((_ is ValueCellFull!14811) mapDefault!48460)) b!1221730))

(declare-fun m!1126683 () Bool)

(assert (=> mapNonEmpty!48460 m!1126683))

(declare-fun b_lambda!22265 () Bool)

(assert (= b_lambda!22257 (or (and start!101582 b_free!26337) b_lambda!22265)))

(declare-fun b_lambda!22267 () Bool)

(assert (= b_lambda!22261 (or (and start!101582 b_free!26337) b_lambda!22267)))

(declare-fun b_lambda!22269 () Bool)

(assert (= b_lambda!22249 (or (and start!101582 b_free!26337) b_lambda!22269)))

(declare-fun b_lambda!22271 () Bool)

(assert (= b_lambda!22255 (or (and start!101582 b_free!26337) b_lambda!22271)))

(declare-fun b_lambda!22273 () Bool)

(assert (= b_lambda!22263 (or (and start!101582 b_free!26337) b_lambda!22273)))

(declare-fun b_lambda!22275 () Bool)

(assert (= b_lambda!22259 (or (and start!101582 b_free!26337) b_lambda!22275)))

(declare-fun b_lambda!22277 () Bool)

(assert (= b_lambda!22253 (or (and start!101582 b_free!26337) b_lambda!22277)))

(declare-fun b_lambda!22279 () Bool)

(assert (= b_lambda!22247 (or (and start!101582 b_free!26337) b_lambda!22279)))

(declare-fun b_lambda!22281 () Bool)

(assert (= b_lambda!22251 (or (and start!101582 b_free!26337) b_lambda!22281)))

(check-sat (not b!1221573) (not d!133893) (not b!1221590) (not b!1221680) (not bm!60737) (not b_lambda!22245) (not b!1221701) (not b_lambda!22277) (not b!1221696) (not b!1221669) (not b!1221671) (not b!1221652) (not b!1221659) b_and!43923 (not b!1221657) (not d!133871) tp_is_empty!31041 (not b!1221588) (not d!133889) (not b_lambda!22271) (not b!1221613) (not b_lambda!22281) (not b!1221574) (not b!1221667) (not b!1221607) (not d!133863) (not b!1221704) (not b!1221591) (not b!1221695) (not b!1221672) (not b!1221602) (not b_lambda!22267) (not bm!60728) (not d!133861) (not b!1221676) (not b!1221718) (not d!133857) (not bm!60740) (not b!1221682) (not mapNonEmpty!48460) (not b!1221608) (not bm!60739) (not b!1221683) (not b!1221692) (not bm!60731) (not b!1221664) (not b!1221689) (not b!1221697) (not b!1221625) (not b_lambda!22269) (not b!1221722) (not bm!60746) (not b!1221687) (not b_next!26337) (not b!1221595) (not b!1221709) (not b!1221663) (not b_lambda!22265) (not d!133887) (not d!133901) (not bm!60738) (not b!1221658) (not b!1221694) (not b!1221700) (not b!1221706) (not d!133877) (not bm!60736) (not b!1221593) (not b!1221626) (not b!1221651) (not d!133895) (not bm!60732) (not b_lambda!22273) (not b!1221662) (not b!1221711) (not d!133897) (not b!1221655) (not b!1221614) (not b_lambda!22279) (not b!1221670) (not b!1221596) (not b!1221620) (not bm!60745) (not b_lambda!22275) (not b!1221707) (not b!1221660) (not b!1221675) (not b!1221685) (not b!1221708) (not b!1221674) (not b!1221688) (not bm!60735) (not b!1221699) (not d!133875))
(check-sat b_and!43923 (not b_next!26337))
