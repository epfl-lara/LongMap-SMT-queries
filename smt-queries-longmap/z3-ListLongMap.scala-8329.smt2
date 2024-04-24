; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101610 () Bool)

(assert start!101610)

(declare-fun b_free!26245 () Bool)

(declare-fun b_next!26245 () Bool)

(assert (=> start!101610 (= b_free!26245 (not b_next!26245))))

(declare-fun tp!91762 () Bool)

(declare-fun b_and!43645 () Bool)

(assert (=> start!101610 (= tp!91762 b_and!43645)))

(declare-fun b!1219454 () Bool)

(declare-fun res!809524 () Bool)

(declare-fun e!692440 () Bool)

(assert (=> b!1219454 (=> (not res!809524) (not e!692440))))

(declare-datatypes ((array!78715 0))(
  ( (array!78716 (arr!37984 (Array (_ BitVec 32) (_ BitVec 64))) (size!38521 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78715)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1219454 (= res!809524 (= (select (arr!37984 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!48304 () Bool)

(declare-fun mapRes!48304 () Bool)

(declare-fun tp!91763 () Bool)

(declare-fun e!692445 () Bool)

(assert (=> mapNonEmpty!48304 (= mapRes!48304 (and tp!91763 e!692445))))

(declare-datatypes ((V!46393 0))(
  ( (V!46394 (val!15531 Int)) )
))
(declare-datatypes ((ValueCell!14765 0))(
  ( (ValueCellFull!14765 (v!18182 V!46393)) (EmptyCell!14765) )
))
(declare-fun mapRest!48304 () (Array (_ BitVec 32) ValueCell!14765))

(declare-fun mapKey!48304 () (_ BitVec 32))

(declare-fun mapValue!48304 () ValueCell!14765)

(declare-datatypes ((array!78717 0))(
  ( (array!78718 (arr!37985 (Array (_ BitVec 32) ValueCell!14765)) (size!38522 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78717)

(assert (=> mapNonEmpty!48304 (= (arr!37985 _values!996) (store mapRest!48304 mapKey!48304 mapValue!48304))))

(declare-fun b!1219455 () Bool)

(declare-fun e!692441 () Bool)

(declare-fun e!692446 () Bool)

(assert (=> b!1219455 (= e!692441 e!692446)))

(declare-fun res!809525 () Bool)

(assert (=> b!1219455 (=> res!809525 e!692446)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1219455 (= res!809525 (not (= (select (arr!37984 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1219456 () Bool)

(declare-fun e!692444 () Bool)

(declare-fun e!692450 () Bool)

(assert (=> b!1219456 (= e!692444 (and e!692450 mapRes!48304))))

(declare-fun condMapEmpty!48304 () Bool)

(declare-fun mapDefault!48304 () ValueCell!14765)

(assert (=> b!1219456 (= condMapEmpty!48304 (= (arr!37985 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14765)) mapDefault!48304)))))

(declare-fun b!1219457 () Bool)

(declare-fun res!809516 () Bool)

(declare-fun e!692448 () Bool)

(assert (=> b!1219457 (=> (not res!809516) (not e!692448))))

(declare-fun lt!554227 () array!78715)

(declare-datatypes ((List!26800 0))(
  ( (Nil!26797) (Cons!26796 (h!28014 (_ BitVec 64)) (t!40017 List!26800)) )
))
(declare-fun arrayNoDuplicates!0 (array!78715 (_ BitVec 32) List!26800) Bool)

(assert (=> b!1219457 (= res!809516 (arrayNoDuplicates!0 lt!554227 #b00000000000000000000000000000000 Nil!26797))))

(declare-fun b!1219458 () Bool)

(declare-fun res!809527 () Bool)

(assert (=> b!1219458 (=> (not res!809527) (not e!692440))))

(assert (=> b!1219458 (= res!809527 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26797))))

(declare-fun b!1219459 () Bool)

(declare-fun res!809513 () Bool)

(assert (=> b!1219459 (=> (not res!809513) (not e!692440))))

(assert (=> b!1219459 (= res!809513 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38521 _keys!1208))))))

(declare-fun res!809514 () Bool)

(assert (=> start!101610 (=> (not res!809514) (not e!692440))))

(assert (=> start!101610 (= res!809514 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38521 _keys!1208))))))

(assert (=> start!101610 e!692440))

(declare-fun tp_is_empty!30949 () Bool)

(assert (=> start!101610 tp_is_empty!30949))

(declare-fun array_inv!28978 (array!78715) Bool)

(assert (=> start!101610 (array_inv!28978 _keys!1208)))

(assert (=> start!101610 true))

(assert (=> start!101610 tp!91762))

(declare-fun array_inv!28979 (array!78717) Bool)

(assert (=> start!101610 (and (array_inv!28979 _values!996) e!692444)))

(declare-fun e!692443 () Bool)

(declare-fun b!1219460 () Bool)

(assert (=> b!1219460 (= e!692443 (or (not (= (select (arr!37984 _keys!1208) from!1455) k0!934)) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(assert (=> b!1219460 e!692441))

(declare-fun res!809517 () Bool)

(assert (=> b!1219460 (=> (not res!809517) (not e!692441))))

(declare-datatypes ((tuple2!19990 0))(
  ( (tuple2!19991 (_1!10006 (_ BitVec 64)) (_2!10006 V!46393)) )
))
(declare-datatypes ((List!26801 0))(
  ( (Nil!26798) (Cons!26797 (h!28015 tuple2!19990) (t!40018 List!26801)) )
))
(declare-datatypes ((ListLongMap!17967 0))(
  ( (ListLongMap!17968 (toList!8999 List!26801)) )
))
(declare-fun lt!554226 () ListLongMap!17967)

(declare-fun lt!554228 () V!46393)

(declare-fun lt!554229 () ListLongMap!17967)

(declare-fun +!4110 (ListLongMap!17967 tuple2!19990) ListLongMap!17967)

(declare-fun get!19400 (ValueCell!14765 V!46393) V!46393)

(assert (=> b!1219460 (= res!809517 (= lt!554226 (+!4110 lt!554229 (tuple2!19991 (select (arr!37984 _keys!1208) from!1455) (get!19400 (select (arr!37985 _values!996) from!1455) lt!554228)))))))

(declare-fun b!1219461 () Bool)

(declare-fun arrayContainsKey!0 (array!78715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1219461 (= e!692446 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1219462 () Bool)

(declare-fun res!809515 () Bool)

(assert (=> b!1219462 (=> (not res!809515) (not e!692440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1219462 (= res!809515 (validKeyInArray!0 k0!934))))

(declare-fun b!1219463 () Bool)

(declare-fun res!809518 () Bool)

(assert (=> b!1219463 (=> (not res!809518) (not e!692440))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1219463 (= res!809518 (validMask!0 mask!1564))))

(declare-fun b!1219464 () Bool)

(assert (=> b!1219464 (= e!692440 e!692448)))

(declare-fun res!809519 () Bool)

(assert (=> b!1219464 (=> (not res!809519) (not e!692448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78715 (_ BitVec 32)) Bool)

(assert (=> b!1219464 (= res!809519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554227 mask!1564))))

(assert (=> b!1219464 (= lt!554227 (array!78716 (store (arr!37984 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38521 _keys!1208)))))

(declare-fun b!1219465 () Bool)

(declare-fun res!809526 () Bool)

(assert (=> b!1219465 (=> (not res!809526) (not e!692440))))

(assert (=> b!1219465 (= res!809526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1219466 () Bool)

(declare-fun e!692447 () Bool)

(assert (=> b!1219466 (= e!692447 e!692443)))

(declare-fun res!809522 () Bool)

(assert (=> b!1219466 (=> res!809522 e!692443)))

(assert (=> b!1219466 (= res!809522 (not (validKeyInArray!0 (select (arr!37984 _keys!1208) from!1455))))))

(declare-fun lt!554223 () ListLongMap!17967)

(assert (=> b!1219466 (= lt!554223 lt!554229)))

(declare-fun lt!554232 () ListLongMap!17967)

(declare-fun -!1890 (ListLongMap!17967 (_ BitVec 64)) ListLongMap!17967)

(assert (=> b!1219466 (= lt!554229 (-!1890 lt!554232 k0!934))))

(declare-fun zeroValue!944 () V!46393)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun minValue!944 () V!46393)

(declare-fun lt!554230 () array!78717)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5456 (array!78715 array!78717 (_ BitVec 32) (_ BitVec 32) V!46393 V!46393 (_ BitVec 32) Int) ListLongMap!17967)

(assert (=> b!1219466 (= lt!554223 (getCurrentListMapNoExtraKeys!5456 lt!554227 lt!554230 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1219466 (= lt!554232 (getCurrentListMapNoExtraKeys!5456 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40356 0))(
  ( (Unit!40357) )
))
(declare-fun lt!554231 () Unit!40356)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1105 (array!78715 array!78717 (_ BitVec 32) (_ BitVec 32) V!46393 V!46393 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40356)

(assert (=> b!1219466 (= lt!554231 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1105 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!48304 () Bool)

(assert (=> mapIsEmpty!48304 mapRes!48304))

(declare-fun b!1219467 () Bool)

(declare-fun e!692449 () Bool)

(assert (=> b!1219467 (= e!692449 e!692447)))

(declare-fun res!809523 () Bool)

(assert (=> b!1219467 (=> res!809523 e!692447)))

(assert (=> b!1219467 (= res!809523 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1219467 (= lt!554226 (getCurrentListMapNoExtraKeys!5456 lt!554227 lt!554230 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1219467 (= lt!554230 (array!78718 (store (arr!37985 _values!996) i!673 (ValueCellFull!14765 lt!554228)) (size!38522 _values!996)))))

(declare-fun dynLambda!3360 (Int (_ BitVec 64)) V!46393)

(assert (=> b!1219467 (= lt!554228 (dynLambda!3360 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554225 () ListLongMap!17967)

(assert (=> b!1219467 (= lt!554225 (getCurrentListMapNoExtraKeys!5456 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1219468 () Bool)

(assert (=> b!1219468 (= e!692445 tp_is_empty!30949)))

(declare-fun b!1219469 () Bool)

(assert (=> b!1219469 (= e!692450 tp_is_empty!30949)))

(declare-fun b!1219470 () Bool)

(assert (=> b!1219470 (= e!692448 (not e!692449))))

(declare-fun res!809521 () Bool)

(assert (=> b!1219470 (=> res!809521 e!692449)))

(assert (=> b!1219470 (= res!809521 (bvsgt from!1455 i!673))))

(assert (=> b!1219470 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!554224 () Unit!40356)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78715 (_ BitVec 64) (_ BitVec 32)) Unit!40356)

(assert (=> b!1219470 (= lt!554224 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1219471 () Bool)

(declare-fun res!809520 () Bool)

(assert (=> b!1219471 (=> (not res!809520) (not e!692440))))

(assert (=> b!1219471 (= res!809520 (and (= (size!38522 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38521 _keys!1208) (size!38522 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!101610 res!809514) b!1219463))

(assert (= (and b!1219463 res!809518) b!1219471))

(assert (= (and b!1219471 res!809520) b!1219465))

(assert (= (and b!1219465 res!809526) b!1219458))

(assert (= (and b!1219458 res!809527) b!1219459))

(assert (= (and b!1219459 res!809513) b!1219462))

(assert (= (and b!1219462 res!809515) b!1219454))

(assert (= (and b!1219454 res!809524) b!1219464))

(assert (= (and b!1219464 res!809519) b!1219457))

(assert (= (and b!1219457 res!809516) b!1219470))

(assert (= (and b!1219470 (not res!809521)) b!1219467))

(assert (= (and b!1219467 (not res!809523)) b!1219466))

(assert (= (and b!1219466 (not res!809522)) b!1219460))

(assert (= (and b!1219460 res!809517) b!1219455))

(assert (= (and b!1219455 (not res!809525)) b!1219461))

(assert (= (and b!1219456 condMapEmpty!48304) mapIsEmpty!48304))

(assert (= (and b!1219456 (not condMapEmpty!48304)) mapNonEmpty!48304))

(get-info :version)

(assert (= (and mapNonEmpty!48304 ((_ is ValueCellFull!14765) mapValue!48304)) b!1219468))

(assert (= (and b!1219456 ((_ is ValueCellFull!14765) mapDefault!48304)) b!1219469))

(assert (= start!101610 b!1219456))

(declare-fun b_lambda!21991 () Bool)

(assert (=> (not b_lambda!21991) (not b!1219467)))

(declare-fun t!40016 () Bool)

(declare-fun tb!11037 () Bool)

(assert (=> (and start!101610 (= defaultEntry!1004 defaultEntry!1004) t!40016) tb!11037))

(declare-fun result!22683 () Bool)

(assert (=> tb!11037 (= result!22683 tp_is_empty!30949)))

(assert (=> b!1219467 t!40016))

(declare-fun b_and!43647 () Bool)

(assert (= b_and!43645 (and (=> t!40016 result!22683) b_and!43647)))

(declare-fun m!1124509 () Bool)

(assert (=> start!101610 m!1124509))

(declare-fun m!1124511 () Bool)

(assert (=> start!101610 m!1124511))

(declare-fun m!1124513 () Bool)

(assert (=> b!1219463 m!1124513))

(declare-fun m!1124515 () Bool)

(assert (=> b!1219454 m!1124515))

(declare-fun m!1124517 () Bool)

(assert (=> mapNonEmpty!48304 m!1124517))

(declare-fun m!1124519 () Bool)

(assert (=> b!1219460 m!1124519))

(declare-fun m!1124521 () Bool)

(assert (=> b!1219460 m!1124521))

(assert (=> b!1219460 m!1124521))

(declare-fun m!1124523 () Bool)

(assert (=> b!1219460 m!1124523))

(declare-fun m!1124525 () Bool)

(assert (=> b!1219460 m!1124525))

(declare-fun m!1124527 () Bool)

(assert (=> b!1219466 m!1124527))

(declare-fun m!1124529 () Bool)

(assert (=> b!1219466 m!1124529))

(declare-fun m!1124531 () Bool)

(assert (=> b!1219466 m!1124531))

(declare-fun m!1124533 () Bool)

(assert (=> b!1219466 m!1124533))

(assert (=> b!1219466 m!1124519))

(declare-fun m!1124535 () Bool)

(assert (=> b!1219466 m!1124535))

(assert (=> b!1219466 m!1124519))

(assert (=> b!1219455 m!1124519))

(declare-fun m!1124537 () Bool)

(assert (=> b!1219470 m!1124537))

(declare-fun m!1124539 () Bool)

(assert (=> b!1219470 m!1124539))

(declare-fun m!1124541 () Bool)

(assert (=> b!1219464 m!1124541))

(declare-fun m!1124543 () Bool)

(assert (=> b!1219464 m!1124543))

(declare-fun m!1124545 () Bool)

(assert (=> b!1219461 m!1124545))

(declare-fun m!1124547 () Bool)

(assert (=> b!1219457 m!1124547))

(declare-fun m!1124549 () Bool)

(assert (=> b!1219458 m!1124549))

(declare-fun m!1124551 () Bool)

(assert (=> b!1219467 m!1124551))

(declare-fun m!1124553 () Bool)

(assert (=> b!1219467 m!1124553))

(declare-fun m!1124555 () Bool)

(assert (=> b!1219467 m!1124555))

(declare-fun m!1124557 () Bool)

(assert (=> b!1219467 m!1124557))

(declare-fun m!1124559 () Bool)

(assert (=> b!1219465 m!1124559))

(declare-fun m!1124561 () Bool)

(assert (=> b!1219462 m!1124561))

(check-sat (not b!1219467) (not b!1219457) (not start!101610) b_and!43647 (not mapNonEmpty!48304) (not b!1219462) (not b!1219465) (not b!1219470) (not b!1219461) (not b_next!26245) (not b_lambda!21991) (not b!1219464) (not b!1219458) (not b!1219460) tp_is_empty!30949 (not b!1219466) (not b!1219463))
(check-sat b_and!43647 (not b_next!26245))
